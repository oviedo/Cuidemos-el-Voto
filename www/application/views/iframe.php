<div align="center" id="banner" style="height:77px; background: url(<?=url::base()?>media/img/banner.jpg) center top no-repeat;" title="www.CuidemosElVoto.org"></div>
<div id="content">
  <div class="content-bg">
    <!-- start map and media filter -->
    <div class="big-block">
      <div class="big-block-top">
        <div class="big-block-bottom">
          <div class="big-map-block">            
            <div id="map" class="map-holder"></div>
            <div class="slider-holder">
              <form action="#">
                <input type="hidden" value="0" name="currentCat" id="currentCat">
                  <fieldset>
                    <label for="startDate">De:</label>
                    <select name="startDate" id="startDate">
                      <?php echo $startDate; ?>
                    </select>

                    <label for="endDate">A:</label>
                    <select name="endDate" id="endDate">
                      <?php echo $endDate; ?>
                    </select>
                  </fieldset>
                </form>
              </div>	    
	    <div style="width:350px;padding-left:20px;text-align:center;">¡Cuidemos el Voto! no grabará ningún número celular por lo cuál tu reporte será completamente anónimo.</div>
            </div>
            <div class="category">              
              <div class="grey-box">
                <div class="grey-box-bg">
                  <ul>
                    <li><a class="active" id="cat_0" href="#"><span style="background:no-repeat url(<?php echo url::base() . 'swatch/?c=990000&w=16&h=16&.png' ?>); background-position:left center;">Todas las Categor&iacute;as</span></a></li>
                    <?php
		      foreach ($categories as $category => $category_info)
		      {
                          $category_title = $category_info[0];
                          $category_color = $category_info[1];
			    echo '<li><a href="#" id="cat_'. $category .'"><span style="background:no-repeat url('. url::base() . "swatch/?c=" . $category_color . "&w=16&h=16&.png" . '); background-position:left center;">' . $category_title . '</span></a></li>';
                      }
		    ?>
                  </ul>		  
                </div>
              </div>
              <br/>
	      <div style="margin:0 auto 0 auto;text-align:center;">
	      <div class="report-btns">
                <a class="btn-red" href="<?=url::base()?>reports/submit/" target="_blank"><span>Reportar un Incidente</span></a>
				<div style="clear:both;margin:0;padding:0;height:1px;"></div>
                <a class="btn-grey" href="<?=url::base()?>participate" target="_blank"><span>Enviar v&iacute;a SMS al 5532690062</span></a>
              </div>
	      <br/>
	      
	      </div>
	      
            </div>
          </div>
        </div>
      </div>
      <!-- end map and media filter <> start incidents and news blocks -->
      <br/>
        <div class="small-block incidents">
          <h3><?php echo Kohana::lang('ui_main.incidents_listed'); ?></h3>          
                <ul>
                  <li>
                    <ul class="title">
                      <li class="w-01"><?php echo Kohana::lang('ui_main.title'); ?></li>
                      <li class="w-02"><?php echo Kohana::lang('ui_main.location'); ?></li>
                      <li class="w-03"><?php echo Kohana::lang('ui_main.date'); ?></li>
                    </ul>
                  </li>
                  <?php
		    if ($total_items == 0)
                        {
		  ?>
                  <li>
                    <ul>
                      <li class="w-01">No se encontraron reportes en el sistema</li>
                      <li class="w-02">&nbsp;</li>
                      <li class="w-03">&nbsp;</li>
                    </ul>
                  </li>
                  <?php
                        }
			foreach ($incidents as $incident)
                            {
                                $incident_id = $incident->id;
								$incident_title = text::limit_chars($incident->incident_title, 40, '...', True);
                                $incident_date = $incident->incident_date;
                                $incident_date = date('M j Y', strtotime($incident->incident_date));
                                $incident_location = $incident->location->location_name;
		  		  ?>
                  <li>
                    <ul>
                      <li class="w-01">
                        <a href="<?php echo url::base() . 'index.php/reports/view/' . $incident_id; ?>" target="_blank">
                        <?php echo $incident_title ?></a></li>
                      <li class="w-02"><?php echo $incident_location ?></li>
                      <li class="w-03"><?php echo $incident_date; ?></li>
                    </ul>
                  </li>
                  <?php
					}
				?>
                </ul>                
	      
        </div>
      
      <!-- end start incidents and news blocks -->
    </div>
  </div>