<?php defined('SYSPATH') or die('No direct script access.');

/**
* SITE CONFIGURATIONS
*/

if($_SERVER['HTTP_HOST'] == '76.74.156.97'){
$config = array
(
        'site_name' => 'Ushahidi',
        'default_map' => 'google',
        'api_google' => 'ABQIAAAApREjSx0dczkJG6kthqfUUBR3NKk7eHii-c69NglZwirGLo0GmxT664iGSFTVQPmLKJ5SmoKaCuVVHA',
        'api_yahoo' => '',
        'default_city' => '',
        'default_country' => '',
        'default_lat' => '',
        'default_lon' => '',
        'default_zoom' => '',
        'items_per_page' => '20',
        'items_per_page_admin' => '20',
        'api_url' => '<script src="http://maps.google.com/maps?file=api&v=2&key=" type="text/javascript"></script>',
        'api_url_all' => ''
);

}else{
$config = array
(
	'site_name' => 'Ushahidi',
	'default_map' => 'google',
	'api_google' => 'ABQIAAAApREjSx0dczkJG6kthqfUUBR-mn-1_80rwTF5eM0uHHpr5TfN4hSz6JKhngyPMpMYQEXQxs-YSyhiJQ',
	'api_yahoo' => '',
	'default_city' => '',
	'default_country' => '',
	'default_lat' => '',
	'default_lon' => '',
	'default_zoom' => '',
	'items_per_page' => '20',
	'items_per_page_admin' => '20',
	'api_url' => '<script src="http://maps.google.com/maps?file=api&v=2&key=" type="text/javascript"></script>',
	'api_url_all' => ''
);
}
