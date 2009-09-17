<?php

$lang = array
(
	'name' => array
	(
		'required'=> 'Se requiere llenar el campo de nombre.',
		'length'		=> 'El nombre debe tener por lo menos tres caract&eacute;res.',
	),
	
	'email' => array
	(
		'required'		=> 'El e-mail es requerido si palomeaste la opci&oacute;n.',
		'email'		  => 'El e-mail parece no tener una direcci&oacute;n v&aacute;lida',
		'length'	  => 'La direcci&oacute;n debe ser de entre 4 y 64 caract&eacute;res.'
	),	
	
	'phone' => array
	(
		'length'		=> 'El n&uacute;mero de tel&eacute;fono no es v&aacute;lido.',
	),
		
	'message' => array
	(
		'required'		=> 'Es necesario poner un comentario.'
	),
	
	'captcha' => array
	(
		'required' => 'Por favor ingresa el c&oacute;digo de seguridad.', 
		'default' => 'Por favor ingresa un c&oacute;digo de seguridad v&aacute;lido.'
	)
	
);
