<?php

$lang = array
(
	'locale' => array
	(
		'required'		=> 'El local es requerido.',
		'length'		=> 'El local tiene un valor incorrecto.',
		'alpha_dash'	=> 'El local tiene un valor incorrecto. ',
		'locale'		=> 'El Reporte Origina y la Traducci&oacute;n tienen el mismo local (lenguage)',
		'exists'		=> 'Este reporte ya tiene traducci&oacute;n en este lenguage'
	),
	
	'incident_title' => array
	(
		'required'		=> 'El t&iacute;tulo es requerido.',
		'length'		=> 'El t&iacute;tulo debe tener entre 3 y 200 caract&eacute;res.'
	),
	
	'incident_description' => array
	(
		'required'		=> 'El campo de descripci&oacute;n es requerido.'
	),	
	
	'incident_date' => array
	(
		'required'		=> 'El campo de datos es requerido.',
		'date_mmddyyyy' => 'El campo de fecha no tiene una fecha v&aacute;lida.',
		'date_ddmmyyyy' => 'El campo de fecha no tiene una fecha v&aacute;lida.'
	),
	
	'incident_hour' => array
	(
		'required'		=> 'El campo de hora es requerido.',
		'between' => 'El campo de hora no tiene una hora v&aacute;lida.'
	),
	
	'incident_minute' => array
	(
		'required'		=> 'El campo de hora es requerido.',
		'between' => 'El campo de hora no tiene una hora v&aacute;lida.'
	),
	
	'incident_ampm' => array
	(
		'validvalues' => 'El campo am/pm no tiene un valor v&aacute;lido.'
	),
	
	'latitude' => array
	(
		'required'		=> 'El campo de latitud es requerido.',
		'between' => 'El campo de latitud no tiene una latitud v&aacute;lida.'
	),
	
	'longitude' => array
	(
		'required'		=> 'El campo de longitud es requerido.',
		'between' => 'El campo de longitud no tiene una longitud v&aacute;lida.'
	),
	
	'location_name' => array
	(
		'required'		=> 'El campo de ubicaci&oacute;n es requerido.',
		'length'		=> 'El campo de ubicaci&oacute;n debe tener entre 3 y 200 caract&eacute;res.',
	),
			
	'incident_category' => array
	(
		'required'		=> 'El campo de categor&oacute;a es requerido.',
		'numeric'		=> 'El campo de categor&oacute;a no tiene una categor&oacute;a v&aacute;lida.'
	),
	
	'incident_news' => array
	(
		'url'		=> 'La fuente de noticias no tiene un URL v&aacute;lida.'
	),
	
	'incident_video' => array
	(
		'url'		=> 'Los v&iacute;nculos de video no tienen un URL v&aacute;lido.'
	),
	
	'incident_photo' => array
	(
		'valid'		=> 'El campo para subir fotos no tienen un archivo v&aacute;lido',
		'type'		=> 'El campo para subir fotos no tienen una im&aacute;gen v&aacute;lida . Los &uacute;nicos formatos aceptados son  .JPG, .PNG and .GIF.',
		'size'		=> 'Por favor asegura que las im&aacute;genes  est&aacute;n limitadas a 2MB.'
	),
	
	'person_first' => array
	(
		'length'		=> 'El campo de primer nombre debe tener entre 3 y 100 caract&eacute;res..'
	),
	
	'person_last' => array
	(
		'length'		=> 'El campo de apellido debe tener entre 3 y 200 caract&eacute;res..'
	),
	
	'person_email' => array
	(
		'email'		  => 'El e-mail parece no tener una direcci&oacute;n v&aacute;lida.',
		'length'	  => 'La direcci&oacute;n debe ser de entre 4 y 64 caract&eacute;res.'
	),
	
	// Admin - Report Download Validation
	'data_point' => array
	(
		'required'		  => 'Por favor selecciona un tipo v&aacute;lido de reporte para descargar',
		'numeric'		  => 'Por favor selecciona un tipo v&aacute;lido de reporte para descargar',
		'between'		  => 'Por favor selecciona un tipo v&aacute;lido de reporte para descargar'
	),
	'data_include' => array
	(
		'numeric'		  => 'Por favor selecciona un objeto v&aacute;lido para incluir en la descarga',
		'between'		  => 'Por favor selecciona un objeto v&aacute;lido para incluir en la descarga'
	),
	'from_date' => array
	(
		'date_mmddyyyy'		  => 'La fecha del campo DE no tiene una fecha v&aacute;lida',
		'range'	  => 'Por favor ingresa una fecha DE v&aacute;lida. No puede ser m&aacute;s all&aacute; de hoy.'
	),
	'to_date' => array
	(
		'date_mmddyyyy'		  => 'La fecha del campo A no tiene una fecha v&aacute;lida',
		'range'	  => 'Por favor ingresa una fecha A v&aacute;lida. No puede ser m&aacute;s all&aacute; de hoy.',
		'range_greater'	=> 'Tu fecha DE no puede ser mayor que tu fecha A.'
	),
	'custom_field' => array
	(
		'values'		  => 'Por favor ingresa un valor v&aacute;lido para uno de los objetios de tu forma'
	),
	
	'incident_active' => array
	(
		'required'		=> 'Por favor ingresa un valor v&aacute;lido en Aprovar este Reporte',
		'between'		=> 'Por favor ingresa un valor v&aacute;lido en Aprovar este Reporte'
	),
	
	'incident_verified' => array
	(
		'required'		=> 'Por favor ingresa un valor v&aacute;lido en Verificar este Reporte',
		'between'		=> 'Por favor ingresa un valor v&aacute;lido en Verificar este Reporte'
	),
	
	'incident_source' => array
	(
		'alpha'		=> 'Por favor ingresa un valor v&aacute;lido en Confiabilidad de la Fuente',
		'length'		=> 'Por favor ingresa un valor v&aacute;lido en Confiabilidad de la Fuente'
	),
	
	'incident_information' => array
	(
		'alpha'		=> 'Por favor ingresa un valor v&aacute;lido en Probabilidad de Informaci&oacute;n',
		'length'		=> 'Por favor ingresa un valor v&aacute;lido Probabilidad de Informaci&oacute;n'
	)
);
