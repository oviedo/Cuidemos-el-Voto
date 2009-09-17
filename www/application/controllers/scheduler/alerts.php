<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Alerts Scheduler Controller
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     Alerts Controller  
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
*/

class Alerts_Controller extends Scheduler_Controller
{
	public function __construct()
    {
        parent::__construct();
	}	
	
	public function index() 
	{
		$db = new Database();
		
		$incidents = $db->query("SELECT incident.id, incident_title, 
								 incident_description, incident_verified, 
								 location.latitude, location.longitude, alert_sent.incident_id
								 FROM incident INNER JOIN location ON incident.location_id = location.id
								 LEFT OUTER JOIN alert_sent ON incident.id = alert_sent.incident_id");

		$config = kohana::config('alerts');

		$sms_from = NULL;

		$settings = ORM::factory('settings', 1);
		if ($settings->loaded == true)
		{
			// Get SMS Numbers
			if (!empty($settings->sms_no3))
				$sms_from = $settings->sms_no3;
			elseif (!empty($settings->sms_no2))
				$sms_from = $settings->sms_no2;
			elseif (!empty($settings->sms_no1))
				$sms_from = $settings->sms_no1;
			else
				$sms_from = "000";      // User needs to set up an SMS number
		}


		foreach ($incidents as $incident)
		{
			if ($incident->incident_id != NULL)
				continue;

			$verified = (int) $incident->incident_verified;
			
			if ($verified)
			{
				$latitude = (double) $incident->latitude;
				$longitude = (double) $incident->longitude;
				$proximity = new Proximity($latitude, $longitude);
				$alertees = $this->_get_alertees($proximity);

				foreach ($alertees as $alertee)
				{
					$alert_type = (int) $alertee->alert_type;

					if ($alert_type == 1) // SMS alertee
					{
						
						
							
							$sms = new Eflyer();						
							$sms->user = $settings->eflyer_username;
							$sms->password = $settings->eflyer_password;						
							$sms->use_ssl = false;
							$sms->sms();
						
							
						
						$message = $incident->incident_description;
			if ($sms->send ($alertee->alert_recipient, $message) == "OK")
			
                        {				
				$db->insert('alert_sent', array('alert_id' => $alertee->id, 'incident_id' => $incident->id, 'alert_date' => date("Y-m-d H:i:s")));				
				$db->clear_cache(true);
                        }
					}

					elseif ($alert_type == 2) // Email alertee
					{
						
						$to = $alertee->alert_recipient;
						$from = $config['alerts_email'];
						$subject = $incident->incident_title;
						$message = $incident->incident_description;

						if (email::send($to, $from, $subject, $message, TRUE) == 1)
						{
							
							$db->insert('alert_sent', array('alert_id' => $alertee->id, 'incident_id' => $incident->id, 'alert_date' => date("Y-m-d H:i:s")));							
							$db->clear_cache(true);
						}
					}
				}	
			}
		}
	}

	private function _get_alertees(Proximity $proximity) 
	{
		$radius = " alert_lat >= ".$proximity->minLat." 
            AND alert_lat <= ".$proximity->maxLat." 
            AND alert_lon >= ".$proximity->minLong."
            AND alert_lon <= ".$proximity->maxLong."
			AND alert_confirmed = 1";

		$alertees = ORM::factory('alert')
					->select('id, alert_type, alert_recipient')
					->where($radius)
					->find_all();

		return $alertees;
	}
}
