<?php defined('SYSPATH') or die('No direct script access.');
/**
* FrontlineSMS HTTP Post Controller
* Gets HTTP Post data from a FrontlineSMS Installation
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     FrontlineSMS Controller  
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
*/

class Frontlinesms_Controller extends Controller
{
	function index()
	{
		if (isset($_GET['key'])) {
			$frontlinesms_key = $_GET['key'];
		}
		
		if (isset($_GET['s'])) {
			$message_from = $_GET['s'];
			// Remove non-numeric characters from string
			$message_from = ereg_replace("[^0-9]", "", $message_from);
		}
		
		if (isset($_GET['m'])) {
			$message_description = $_GET['m'];
		}
		
		if (!empty($frontlinesms_key) && !empty($message_from) && !empty($message_description))
		{
			// Is this a valid FrontlineSMS Key?
			$keycheck = ORM::factory('settings', 1)->where('frontlinesms_key', $frontlinesms_key)->find();
			if ($keycheck->loaded==true)
			{
				$services = new Service_Model();
		    	$service = $services->where('service_name', 'SMS')->find();
			   	if (!$service) {
		 		    return;
			    }
			
				$reporter_check = ORM::factory('reporter')
					->where('service_id', $service->id)
					->where('service_account', $message_from)
					->find();

				if ($reporter_check->loaded == true)
				{
					$reporter_id = $reporter_check->id;
				}
				else
				{
					// get default reporter level (Untrusted)
		    		$levels = new Level_Model();
			    	$default_level = $levels->where('level_weight', 0)->find();

		    		$reporter = new Reporter_Model();
		    		$reporter->service_id       = $service->id;
		    		$reporter->service_userid   = null;
		    		$reporter->service_account  = $message_from;
		    		$reporter->reporter_level   = $default_level;
		    		$reporter->reporter_first   = null;
		    		$reporter->reporter_last    = null;
		    		$reporter->reporter_email   = null;
		    		$reporter->reporter_phone   = null;
		    		$reporter->reporter_ip      = null;
		    		$reporter->reporter_date    = date('Y-m-d');
		    		$reporter->save();
					$reporter_id = $reporter->id;
				}

			$rest = $this->getsms($message_description);			
			if($rest['incidencia'] != ''){
				
				if($coord = $this->gettextaddress($rest['localidad'].', mexico')){					
					// STEP 1: SAVE LOCATION
					$location = new Location_Model('');
					$location->location_name = $coord['textaddress'];
					$location->country_id = 157; //Mexico
					$location->latitude = $coord['latitude'];
					$location->longitude = $coord['longitude'];
					$location->location_date = date("Y-m-d H:i:s",time());
					$location->save();
					$locationid = $location->id;
				}else{
					$locationid = 0;
				}
				
				// STEP 2: SAVE INCIDENT
				$incident = new Incident_Model('');
				$incident->location_id = $locationid;
				//$incident->locale = $post->locale;
				$incident->form_id = 1;
				$incident->user_id = 0;
				$incident->incident_title = $rest['mensaje'];
				$incident->incident_description = $rest['mensaje'];
				$incident->incident_date = date("Y-m-d H:i:s",time());
				$incident->incident_dateadd = date("Y-m-d H:i:s",time());
				$incident->incident_mode = 2;

				// Incident Evaluation Info
				$incident->incident_active = 0;
				$incident->incident_verified = 0;
				$incident->incident_source = null;
				$incident->incident_information = null;
				//Save
				$incident->save();
				$incidentid = $incident->id;
				
				// STEP 3: SAVE CATEGORIES				
				$incident_category = new Incident_Category_Model();
				$incident_category->incident_id = $incident->id;
				$incident_category->category_id = $rest['incidencia'];
				$incident_category->save();
				
			}else{
				$incidentid = 0;
			}
			
			// Save Message
	    		$message = new Message_Model();
	    		$message->parent_id = 0;
	    		$message->incident_id = $incidentid;
	    		$message->user_id = 0;
	    		$message->reporter_id = $reporter_id;
	    		$message->message_from = $message_from;
	    		$message->message_to = null;
	    		$message->message = $message_description;
	    		$message->message_type = 1; // Inbox
	    		$message->message_date = date("Y-m-d H:i:s",time());
	    		$message->service_messageid = null;
	    		$message->save();
			}
		}
	}
	
	function getsms($sms){
		$arrincidencia = array();	
		foreach (ORM::factory('category')
			 ->where('category_visible', '1')
			 ->find_all() as $category)
		{
		    // Create a list of all categories
		    $arrincidencia[$category->sms] = $category->id;
		}
		$ret = array('incidencia'=>'','localidad'=>'','mensaje'=>$sms);	
		$minusc = strtolower(trim($sms));
		$cadexpl = explode(' ',$minusc);
		$indice = 0;
		
		foreach($cadexpl as $busqu){
			if(array_key_exists($busqu,$arrincidencia)){
				$ret['incidencia'] = $arrincidencia[$busqu];
				$ret['localidad'] = implode(' ',array_slice($cadexpl,0,$indice));
				$ret['mensaje'] = implode(' ',array_slice($cadexpl,$indice+1,count($cadexpl)));
				break;
			}
			$indice++;				
		}
		return $ret;
	}
	
	 function gettextaddress($address){
		
	    $keymaps = "ABQIAAAAJBWKA1FaImmunuohpC7yphTJHToCCIsdBz_ldgTLqnJCTfHmohQQBQbgqwGG0vyOUOZPqMok3I9l7w";
	    $url = "http://maps.google.com/maps/geo?q=".urlencode($address)."&output=json&oe=utf8&key=$keymaps";
	    // create a new cURL resource
	    $ch = curl_init();
	    // set URL and other appropriate options
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_HEADER,false);
	    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true) ;
	    
	    // grab URL and pass it to the browser
	    $documentjson = curl_exec($ch);
	    
	    // close cURL resource, and free up system resources
	    curl_close($ch);	    
	    $arr = json_decode(trim($documentjson),true);	    
	    if(is_array($arr) && $arr['Status']['code'] == 200){		
		    if(count($arr['Placemark']) > 0){		    
			    $coord = $arr['Placemark'][0]['Point']['coordinates'];			    
			    return array('textaddress' => $arr['Placemark'][0]['address'], 'latitude' => $coord[1], 'longitude' => $coord[0]);
		    }
	    }
	    return false;
    }
	
}
