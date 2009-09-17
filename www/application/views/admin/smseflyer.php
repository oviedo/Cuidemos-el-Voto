<?php 
/**
 * Sms global view page.
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
			<div class="bg">
				<h2><?php echo $title; ?> <a href="<?php echo url::base() . 'admin/settings/site' ?>">Site</a><a href="<?php echo url::base() . 'admin/settings' ?>">Map</a><a href="<?php echo url::base() . 'admin/settings/sms' ?>" class="active">SMS</a><a href="<?php echo url::base() . 'admin/settings/sharing' ?>">Sharing</a></h2>
				<?php print form::open(); ?>
				<div class="report-form">
					<?php
					if ($form_error) {
					?>
						<!-- red-box -->
						<div class="red-box">
							<h3>Error!</h3>
							<ul>
							<?php
							foreach ($errors as $error_item => $error_description)
							{
								// print "<li>" . $error_description . "</li>";
								print (!$error_description) ? '' : "<li>" . $error_description . "</li>";
							}
							?>
							</ul>
						</div>
					<?php
					}

					if ($form_saved) {
					?>
						<!-- green-box -->
						<div class="green-box">
							<h3>Your Settings Have Been Saved!</h3>
						</div>
					<?php
					}
					?>				
					<div class="head">
						<h3>SMS Setup Options</h3>
						<input type="image" src="<?php echo url::base() ?>media/img/admin/btn-cancel.gif" class="cancel-btn" />
						<input type="image" src="<?php echo url::base() ?>media/img/admin/btn-save-settings.gif" class="save-rep-btn" />
					</div>
					<!-- column -->
		
					<div class="sms_nav_holder">
						<a href="<?php echo url::base() . 'admin/settings/smseflyer' ?>" class="active">Option 1: Use Eflyer</a>
						<a href="<?php echo url::base() . 'admin/settings/sms' ?>">Option 2: Use Frontline SMS</a>
						<a href="<?php echo url::base() . 'admin/settings/smsglobal' ?>">Option 3: Use a Global SMS Gateway</a>
					</div>
		
					<div class="sms_holder">
						<table style="width: 630px;" class="my_table">
							<tr>
								<td style="width:60px;">
									<span class="big_blue_span">Step 1:</span>
								</td>
								<td>
									<h4 class="fix">Sign up for Eflyer service by <a href="http://www.eflyer.com.mx" target="_blank">clicking here</a>.</h4>
								</td>
							</tr>
							<tr>
								<td>
									<span class="big_blue_span">Step 2:</span>
								</td>
								<td>
									<h4 class="fix">Enter your Eflyer access information below. <sup><a href="#">?</a></sup></h4>									
									<div class="row">
										<h4>Your Eflyer User Name (e-mail address):</h4>
										<?php print form::input('eflyer_username', $form['eflyer_username'], ' class="text title_2"'); ?>
									</div>
									<div class="row">
										<h4>Your Eflyer Password:</h4>
										<?php print form::password('eflyer_password', $form['eflyer_password'], ' class="text title_2"'); ?>
									</div>
								</td>
							</tr>
						</table>
					</div>
		
					<div class="simple_border"></div>
		
					<input type="image" src="<?php echo url::base() ?>media/img/admin/btn-save-settings.gif" class="save-rep-btn" />
					<input type="image" src="<?php echo url::base() ?>media/img/admin/btn-cancel.gif" class="cancel-btn" />
				</div>
				<?php print form::close(); ?>
			</div>