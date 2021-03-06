<?php defined('SYSPATH') or die('No direct script access.');
/**
* Feed Controller
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     Feed Controller  
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
* 
*/

class Feed_Controller extends Controller
{
	function __construct()
    {
        parent::__construct();
    }

	public function index($feedtype = 'rss2') 
{
		if(!Kohana::config('settings.allow_feed')) {
			throw new Kohana_404_Exception();
		}
		if($feedtype!='atom' AND $feedtype!= 'rss2') {
			throw new Kohana_404_Exception();
		}
		$feedpath = $feedtype == 'atom' ? 'feed/atom/' :  'feed/';
		$site_url = "http://" . $_SERVER['SERVER_NAME'] . "/";
		$incidents = ORM::factory('incident')->where('incident_active', '1')->orderby('incident_dateadd', 'desc')->limit(20)->find_all();
		$items = array();
		foreach($incidents as $incident) {
			$item = array();
			$item['title'] = $incident->incident_title;
			$item['link'] = $site_url.'reports/view/'.$incident->id;
			$item['description'] = $incident->incident_description;
			$item['date'] = $incident->incident_dateadd;
			if($incident->location_id != 0 AND $incident->location->longitude AND $incident->location->latitude) 
				$item['point'] = array($incident->location->latitude,$incident->location->longitude);
			$items[] = $item;
		}

		
		header("Content-Type: text/xml; charset=utf-8");
		$view = new View('feed_'.$feedtype);
		$view->feed_title = htmlspecialchars(Kohana::config('settings.site_name'));
		$view->site_url = $site_url;
		$view->georss = 1; // this adds georss namespace in the feed
		$view->feed_url = $site_url.$feedpath;
		$view->feed_date = gmdate("D, d M Y H:i:s T", time());
		$view->feed_description = 'Incident feed for '.Kohana::config('settings.site_name');
		$view->items = $items;
		$view->render(TRUE);
	}
}
