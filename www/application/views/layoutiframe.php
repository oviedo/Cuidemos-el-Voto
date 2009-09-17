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
	<style media="all" type="text/css">@import "<?php echo url::base() ?>index.php/media/css/alliframe.css";</style>	
	<!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="<?php echo url::base() ?>index.php/media/css/ie6.css" media="screen"/><![endif]-->
	<?php
	// Load OpenLayers before jQuery!
	if ($map_enabled)
	{
		echo html::script('index.php/media/js/OpenLayers/OpenLayers');
		// OpenLayers Theme
		echo html::stylesheet('index.php/media/js/OpenLayers/theme/default/style');
	}	
	
	// Load jQuery
	echo html::script('index.php/media/js/jquery');
	echo html::script('index.php/media/js/jquery.ui.min');
	echo html::script('index.php/media/js/jquery.pngFix.js');
	
	// Other stuff to load only we have the map enabled
	if ($map_enabled)
	{
		echo $api_url . "\n";
		if ($main_page) {
			echo html::script('index.php/media/js/accessibleUISlider.jQuery');
			echo html::script('index.php/media/js/jquery.flot');
			echo html::script('index.php/media/js/timeline.js');
			?>
			<!--[if IE]><script language="javascript" type="text/javascript" src="<?php echo url::base() ?>media/js/excanvas.pack.js"></script><![endif]-->
			<?php
			echo html::stylesheet('index.php/media/css/jquery-ui-themeroller');
		}
	}

	?>
	<script type="text/javascript">
		<?php echo $js . "\n"; ?>		
	</script>	
</head>
<body style="background-color:#fff";>
	<div id="main">
		<!-- start header block -->		
		<!-- end header block <> start content block -->
<?php echo $content; ?>

	</div>
	<img src="<?php echo $tracker_url; ?>" />
	<?php echo $google_analytics; ?>	
	<!-- Task Scheduler -->
	<img src="<?php echo url::base() . 'scheduler'; ?>" height="1" width="1" border="0">
</body>
</html>