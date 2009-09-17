<?php
/**
 * Help view js file.
 * 
 * Handles javascript stuff related to help view function.
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
		jQuery(function() {
			/*
			Send Message JS
			*/			
			// Ajax Validation
			$("#sendMessage").validate({
				rules: {
					name: {
						required: true,
						minlength: 3
					},
					email: {
						email: true
					},
					phone: {
						minlength: 3
					},
					message: {
						required: true,
						minlength: 3
					},
					captcha: {
						required: true
					}
				},
				messages: {
					name: {
						required: "Por favor agrega tu nombre",
						minlength: "Tu nombre debe contener al menos 3 caracteres"
					},
					email: {
						required: "Por favor agrega tu E-mail",
						email: "Por favor introduce un E-mail v&aacute;lido"
					},
					phone: {
						minlength: "Tu numero de tel&eacute;fono no es v&aacute;lido"
					},
					message: {
						required: "Por favor agrega tu comentario",
						minlength: "Tu comentario debe contener al menos 3 caracteres"
					},
					captcha: {
						required: "Introduce el C&oacute;digo de Seguridad"
					}
				}
			});
		});
