<?php
/**
 * Report submit js file.
 *
 * Handles javascript stuff related to report submit function.
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
		$().ready(function() {
			// validate signup form on keyup and submit
			$("#reportForm").validate({
				rules: {
					incident_title: {
						required: true,
						minlength: 3
					},
					incident_description: {
						required: true,
						minlength: 3
					},
					incident_date: {
						required: true,
						date: true
					},
					incident_hour: {
						required: true,
						range: [1,12]
					},
					incident_minute: {
						required: true,
						range: [0,60]
					},
					incident_ampm: {
						required: true
					},
					"incident_category[]": {
						required: true,
						minlength: 1
					},
					latitude: {
						required: true,
						range: [-90,90]
					},
					longitude: {
						required: true,
						range: [-180,180]
					},
					location_name: {
						required: true
					},
					"incident_news[]": {
						url: true
					},
					"incident_video[]": {
						url: true
					}
				},
				messages: {
					incident_title: {
						required: "Por favor agrega un T&iacute;tulo",
						minlength: "El t&iacute;tulo debe  contener al menos 3 caracteres"
					},
					incident_description: {
						required: "Por favor agrega una Descripci&oacute;n",
						minlength: "La descripci&oacute;n debe contener al menos 3 caracteres"
					},
					incident_date: {
						required: "Por favor introduce una Fecha",
						date: "Por favor introduce una fecha v&aacute;lida"
					},
					incident_hour: {
						required: "Por favor introduce una Hora",
						range: "Por favor introduce una hora v&aacute;lida"
					},
					incident_minute: {
						required: "Por favor introduce los Minutos",
						range: "Por favor introduce minutos v&aacute;lidos"
					},
					incident_ampm: {
						required: "AM o PM?"
					},
					"incident_category[]": {
						required: "Por favor selecciona al menos una Categor&iacute;a",
						minlength: "Por favor selecciona al menos una Categor&iacute;a"
					},
					latitude: {
						required: "Por favor selecciona un punto v&aacute;lido en el mapa",
						range: "Por favor selecciona un punto v&aacute;lido en el mapa"
					},
					longitude: {
						required: "Por favor selecciona un punto v&aacute;lido en el mapa",
						range: "Por favor selecciona un punto v&aacute;lido en el mapa"
					},
					location_name: {
						required: "Introduce una ciudad o una ubicaci&oacute;n"
					},
					"incident_news[]": {
						url: "Por favor introduce una liga v&aacute;lida a alguna Noticia"
					},
					"incident_news[]": {
						url: "Por favor introduce una liga v&aacute;lida a alg&uacute;n Video"
					}	
				},
				groups: {
					incident_date_time: "incident_date incident_hour",
					latitude_longitude: "latitude longitude"
				},
				errorPlacement: function(error, element) {
					if (element.attr("name") == "incident_date" || element.attr("name") == "incident_hour" || element.attr("name") == "incident_minute" )
					{
						error.append("#incident_date_time");
					}else if (element.attr("name") == "latitude" || element.attr("name") == "longitude"){
						error.insertAfter("#select_city");
					}else if (element.attr("name") == "incident_category[]"){
						error.insertAfter("#categories");
					}else{
						error.insertAfter(element);
					}
				}
			});
		});
		
		
		// Date Picker JS
		$("#incident_date").datepicker({ 
		    showOn: "both", 
		    buttonImage: "<?php echo url::base() ?>media/img/admin/icon-calendar.gif", 
		    buttonImageOnly: true 
		});
		
		function addFormField(div, field, hidden_id, field_type) {
			var id = document.getElementById(hidden_id).value;
			$("#" + div).append("<div class=\"report_row\" id=\"" + field + "_" + id + "\"><input type=\"" + field_type + "\" name=\"" + field + "[]\" class=\"" + field_type + " long2\" /><a href=\"#\" class=\"add\" onClick=\"addFormField('" + div + "','" + field + "','" + hidden_id + "','" + field_type + "'); return false;\">add</a><a href=\"#\" class=\"rem\"  onClick='removeFormField(\"#" + field + "_" + id + "\"); return false;'>remove</a></div>");

			$("#" + field + "_" + id).effect("highlight", {}, 800);

			id = (id - 1) + 2;
			document.getElementById(hidden_id).value = id;
		}

		function removeFormField(id) {
			var answer = confirm("Estas seguro de querer borrar este Item?");
		    if (answer){
				$(id).remove();
		    }
			else{
				return false;
		    }
		}
		
		
		jQuery(function() {
			var moved=false;
			
			// Now initialise the map
			var options = {
			units: "dd"
			, numZoomLevels: 16
			, controls:[]};
			var map = new OpenLayers.Map('divMap', options);
			var default_map = <?php echo $default_map; ?>;
			if (default_map == 2)
			{
				var map_layer = new OpenLayers.Layer.VirtualEarth("virtualearth");
			}
			else if (default_map == 3)
			{
				var map_layer = new OpenLayers.Layer.Yahoo("yahoo");
			}
			else if (default_map == 4)
			{
				var map_layer = new OpenLayers.Layer.OSM.Mapnik("openstreetmap");
			}
			else
			{
				var map_layer = new OpenLayers.Layer.Google("google");
			}
			
			map.addLayer(map_layer);
			
			map.addControl(new OpenLayers.Control.Navigation());
			map.addControl(new OpenLayers.Control.PanZoomBar());
			map.addControl(new OpenLayers.Control.MousePosition());
			
			// Create the markers layer
			var markers = new OpenLayers.Layer.Markers("Markers");
			map.addLayer(markers);
			
			// create a lat/lon object
			var myPoint = new OpenLayers.LonLat(<?php echo $longitude; ?>, <?php echo $latitude; ?>);
			
			// create a marker positioned at a lon/lat
			var marker = new OpenLayers.Marker(myPoint);
			markers.addMarker(marker);
			
			// display the map centered on a latitude and longitude (Google zoom levels)
			map.setCenter(myPoint, <?php echo $default_zoom; ?>);
			
			// Detect Map Clicks
			map.events.register("click", map, function(e){
				var lonlat = map.getLonLatFromViewPortPx(e.xy);
			    m = new OpenLayers.Marker(lonlat);
				markers.clearMarkers();
		    	markers.addMarker(m);
							
				// Update form values (jQuery)
				$("#latitude").attr("value", lonlat.lat);
				$("#longitude").attr("value", lonlat.lon);
			});
			
			// Detect Dropdown Select
			$("#select_city").change(function() {
				var lonlat = $(this).val().split(",");
				if ( lonlat[0] && lonlat[1] )
				{
					l = new OpenLayers.LonLat(lonlat[0], lonlat[1]);
					m = new OpenLayers.Marker(l);
					markers.clearMarkers();
			    	markers.addMarker(m);
					map.setCenter(l, <?php echo $default_zoom; ?>);
					
					// Update form values (jQuery)
					var selected = $("#select_city option[@selected]");
					$("#location_name").attr("value", selected.text());
					
					$("#latitude").attr("value", lonlat[1]);
					$("#longitude").attr("value", lonlat[0]);
				}
			});

		});
