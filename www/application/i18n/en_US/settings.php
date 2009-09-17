<?php

$lang = array
(
	'site_name' => array
	(
		'required'		=> 'El nombre del sitio es requerido.',
		'length'		=> 'El nombre del sitio debe tener entre 3 y 50 caract&eacute;res.',
	),
	
	'site_tagline' => array
	(
		'required'		=> 'El lema es requerido.',
		'length'		=> 'El lema debe tener entre 3 y 100 caract&eacute;res.',
	),
	
	'site_email' => array
	(
		'email'		  => 'El  e-mail del sitio parece no tener una direcci&oacute;n v&aacute;lida?',
		'length'	  => 'El e-mail del sitio debe tener entre 4 y 100 caract&eacute;res.'
	),
	
	'items_per_page' => array
	(
		'required'		=> 'Los objetos por p&aacute;gina (Frontend) son requeridos.',
		'between' => 'Los objetos por p&aacute;gina (Frontend) no tienen un valor v&aacute;lido.'
	),
	
	'items_per_page_admin' => array
	(
		'required'		=> 'Los objetos por p&aacute;gina (Admin) son requeridos.',
		'between' => 'Los objetos por p&aacute;gina (Admin) no tienen un valor v&aacute;lido.'
	),
	
	'allow_reports' => array
	(
		'required'		=> 'El campo para permitir reportes es requerido.',
		'between' => 'El campo para permitir reportes no tiene un valor v&aacute;lido.'
	),
	
	'allow_comments' => array
	(
		'required'		=> 'El campo para permitir comentarios es requerido.',
		'between' => 'El campo para permitir comentarios no tiene un valor v&aacute;lido.'
	),
	
	'allow_feed' => array
	(
		'required'		=> 'El campo para incluir servicio sindicado es necesario.',
		'between' => 'El campo para incluir servicio sindicado no tiene un valor v&aacute;lido.'
	),
	
	'sms_no1' => array
	(
		'numeric'		=> 'El n&uacute;mero de tel&eacute;fono 1 sólo debe contener n&uacute;meros.',
		'length' => 'El n&uacute;mero de tel&eacute;fono 1 es demasiado largo.'
	),
	
	'sms_no2' => array
	(
		'numeric'		=> 'El n&uacute;mero de tel&eacute;fono 2 sólo debe contener n&uacute;meros.',
		'length' => 'El n&uacute;mero de tel&eacute;fono 2 es demasiado largo.'
	),
	
	'sms_no3' => array
	(
		'numeric'		=> 'El n&uacute;mero de tel&eacute;fono 3 sólo debe contener n&uacute;meros.',
		'length' => 'El n&uacute;mero de tel&eacute;fono 2 es demasiado largo.'
	),
	
	'clickatell_api' => array
	(
		'required'		=> 'El n&uacute;mero de API de Clickatell es requerido.',
		'length'		=> 'El n&uacute;mero de API de Clickatell no debe de tener m&aacute;s de 20 n&uacute;meros.',
	),
	
	'clickatell_username' => array
	(
		'required'		=> 'El campo de usuario de Clickatell es requerido.',
		'length'		=> 'El campo de usuario de Clickatell no debe de tener m&aacute;s de 20 caract&eacute;res .',
	),
	
	'clickatell_password' => array
	(
		'required'		=> 'El password de Clickatell es requerido.',
		'length'		=> 'El password de Clickatell debe tener entre 5 y 50 caract&eacute;res.',
	),

	'google_analytics' => array
	(
		'length'		=> 'El campo de Google Analytics debe tener un Web Property ID con el formato UA-XXXXX-XX.',
	)		
	
);
