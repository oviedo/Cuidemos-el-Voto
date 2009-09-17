<?php 
/**
 * Header view page.
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     API Controller
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	<title><?php echo $site_name; ?></title>
	<style media="all" type="text/css">@import "<?php echo url::base() ?>media/css/all.css";</style>
	<style media="all" type="text/css">@import "<?php echo url::base() ?>media/css/photoslider.css";</style>
	<style media="all" type="text/css">@import "<?php echo url::base() ?>media/css/videoslider.css";</style>
	<!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="<?php echo url::base() ?>media/css/ie6.css" media="screen"/><![endif]-->
	<?php
	// Load OpenLayers before jQuery!
	if ($map_enabled)
	{
		echo html::script('media/js/OpenLayers/OpenLayers');
		// OpenLayers Theme
		echo html::stylesheet('media/js/OpenLayers/theme/default/style');
	}	
	
	// Load jQuery
	echo html::script('media/js/jquery');
	echo html::script('media/js/jquery.ui.min');
	echo html::script('media/js/jquery.pngFix.js');
	if($this_page == 'twitter'){
		echo '<script language="javascript" src="/twittertmp/jquery.juitter.js" type="text/javascript"></script>';
		echo '<script language="javascript" src="/twittertmp/system.js" type="text/javascript"></script>';
		echo '<link media="screen" type="text/css" href="/twittertmp/style.css" rel="stylesheet">';
	}
	
	// Other stuff to load only we have the map enabled
	if ($map_enabled)
	{
		if($_SERVER['HTTP_HOST'] == '76.74.156.97'){
			echo '<script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAApREjSx0dczkJG6kthqfUUBR3NKk7eHii-c69NglZwirGLo0GmxT664iGSFTVQPmLKJ5SmoKaCuVVHA" type="text/javascript"></script>';
		}else{
			echo '<script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAJBWKA1FaImmunuohpC7yphTJHToCCIsdBz_ldgTLqnJCTfHmohQQBQbgqwGG0vyOUOZPqMok3I9l7w" type="text/javascript"></script>';
		}
		
		if ($main_page) {
			echo html::script('media/js/accessibleUISlider.jQuery');
			echo html::script('media/js/jquery.flot');
			echo html::script('media/js/timeline.js');
			?>
			<!--[if IE]><script language="javascript" type="text/javascript" src="<?php echo url::base() ?>media/js/excanvas.pack.js"></script><![endif]-->
			<?php
			echo html::stylesheet('media/css/jquery-ui-themeroller');
		}
	}
	if ($validator_enabled) 
	{
		echo html::script('media/js/jquery.validate.min');
	}
	if ($datepicker_enabled)
	{
		echo html::stylesheet('media/css/datepicker/ui.datepicker');
	}
	if ($photoslider_enabled)
	{
		echo html::script('media/js/photoslider.js');
	}
	if( $videoslider_enabled )
	{
		echo html::script('media/js/coda-slider.pack.js');
	}
	if ($allow_feed == 1) {
		echo "<link rel=\"alternate\" type=\"application/rss+xml\" href=\"http://" . $_SERVER['SERVER_NAME'] . "/feed/\" title=\"RSS2\" />";
	}
	?>
	<script type="text/javascript">
		<?php echo $js . "\n"; ?>		
	</script>	
</head>
<body>
	<div id="main">
		<!-- start header block -->
		<div id="header">
			<div class="header-info">
				
			</div>
			<div id="menumain">
			<ul id="menu">
				<li class="first"><a <?php if ($this_page == 'home') echo 'class="active"'; ?> href="<?php echo url::base() . "main" ?>"><?php echo Kohana::lang('ui_main.home'); ?></a></li>
				<li><a <?php if ($this_page == 'reports') echo 'class="active"'; ?> href="<?php echo url::base() . "reports/" ?>"><?php echo Kohana::lang('ui_main.reports'); ?></a></li>
				<li><a <?php if ($this_page == 'reports_submit') echo 'class="active"'; ?> href="<?php echo url::base() . "reports/submit" ?>"><?php echo Kohana::lang('ui_main.submit'); ?></a></li>
				<li><a <?php if ($this_page == 'alerts') echo 'class="active"'; ?> href="<?php echo url::base() . "alerts" ?>"><?php echo Kohana::lang('ui_main.alerts'); ?></a></li>
			        <li><a <?php if ($this_page == 'participate') echo 'class="active"'; ?> href="<?php echo url::base() . "participate" ?>"><?php echo Kohana::lang('ui_main.who_help'); ?></a></li>				
				<li><a <?php if ($this_page == 'help') echo 'class="active"'; ?> href="<?php echo url::base() . "help" ?>"><?php echo Kohana::lang('ui_main.participated'); ?></a></li>
				<li><a <?php if ($this_page == 'twitter') echo 'class="active"'; ?> href="<?php echo url::base() . "twitter" ?>">Tweets</a></li>				
				<li class="last"><a <?php if ($this_page == 'about') echo 'class="active"'; ?> href="<?php echo url::base() . "about" ?>"><?php echo Kohana::lang('ui_main.about'); ?></a></li>
			</ul>
			</div>			
		</div>
		<!-- end header block <> start content block -->
