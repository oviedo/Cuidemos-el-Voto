<?php

$lang = array
(
	'comment_author' => array
	(
		'required'=> 'El nombre es requerido.',
		'length'		=> 'El nombre debe de contener por lo menos 3 caract&eacute;res.',
	),
	
	'comment_description' => array
	(
		'required'		=> 'El comentario es requerido.'
	),
	
	'comment_email' => array
	(
		'required'		=> 'El e-mail es requrido si palomeaste la opci&oacute;n.',
		'email'		  => 'El  e-mail parece no tener una direcci&oacute;n v&aacute;lida',
		'length'	  => 'La direcci&oacute;n debe ser de entre 4 y 64 caract&eacute;res.'
	),
	
	'captcha' => array
	(
		'required' => 'Por favor ingresa el c&oacute;digo de seguridad', 
		'default' => 'Por favor ingresa un c&oacute;digo de seguridad v&aacute;lido'
	)
	
);
