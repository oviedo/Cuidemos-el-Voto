<?php 
/**
 * Reports view page.
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
		<div id="content">
		  <div class="content-bg">
		    <!-- start incident block -->
		    <div class="big-block">
		      <div class="big-block-top">
		        <div class="big-block-bottom">
		          <div class="incident-name">
		            <h1><?php echo $incident_title; ?></h1>
		            <ul>
		              <li>
		                <strong>UBICACION</strong>
		                <p><?php echo $incident_location; ?></p>
		              </li>
		              <li>
		                <strong>FECHA</strong>
		                <p><?php echo $incident_date; ?></p>
		              </li>
		              <li>
		                <strong>HORA</strong>
		                <p><?php echo $incident_time; ?></p>
		              </li>
		              <li>
		                <strong>CATEGORIA</strong>
                        <?php
                        foreach($incident_category as $category) 
                        { 
                            echo "<a href=\"#\">" .
                                $category->category->category_title . "</a>&nbsp;&nbsp;&nbsp;";
                        }
                        ?>
		              </li>
		              <li>
		                <strong>ENTIDAD</strong>
		                <p>N/A</p>
		              </li>
		              <li>
		                <strong>VERIFICADO</strong>
                        <?php        
                        if ( $incident_verified == 1 )
                        {
                            echo "<p><strong class=\"green\">SI</strong></p>";
                        }
                        else
                        {
                            echo "<p><strong class=\"red\">NO</strong></p>";
                        }
                        ?>
		              </li>
		            </ul>
		          </div>
		          <div class="incident-map">
		            <ul class="legend">
		              <li class="ico-red">INCIDENTE</li>
		              <li class="ico-orange">INCIDENTES CERCANOS</li>
		            </ul>
		            <div class="map-holder" id="map"></div>
		          </div>
		          <div class="report-description">
		            <div class="title">
		              <h2>Descripci&oacute;n del Reporte</h2>
		              <a href="#comments"><span>+ agregar informaci&oacute;n</span></a>
		            </div>
		            <div class="orig-report">
		              <div class="report">
		                <h4>Reporte Original</h4>
		                <p><?php echo $incident_description; ?></p>
				<?php if( count($incident_news) > 0 ) { ?>						
				      <div>
					<p><br/>
					<strong>Referencia<?if(count($incident_news) > 1) echo 's'; ?>:</strong>
					<ul>
				      <?php foreach( $incident_news as $incident_new) { ?>
					  <li><a href="<?=$incident_new?>"><?=$incident_new?></a></li>
				      <?php } ?>
					</ul>
					</p>
				      </div>
				<?php } ?>
						<div class="report_rating">
							<div>
							Credibilidad:&nbsp;
							<a href="javascript:rating('<?php echo $incident_id; ?>','add','original','oloader_<?php echo $incident_id; ?>')"><img id="oup_<?php echo $incident_id; ?>" src="<?php echo url::base() . 'media/img/'; ?>up.png" alt="UP" title="UP" border="0" /></a>&nbsp;
							<a href="javascript:rating('<?php echo $incident_id; ?>','subtract','original')"><img id="odown_<?php echo $incident_id; ?>" src="<?php echo url::base() . 'media/img/'; ?>down.png" alt="DOWN" title="DOWN" border="0" /></a>&nbsp;
							</div>
							<div class="rating_value" id="orating_<?php echo $incident_id; ?>"><?php echo $incident_rating; ?></div>
							<div id="oloader_<?php echo $incident_id; ?>" class="rating_loading" ></div>
						</div>
		              </div>
		            </div>
		            <div class="orig-report">
		              <div class="discussion">
		                <h5>REPORTES ADICIONALES Y COMENTARIOS&nbsp;&nbsp;&nbsp;(<a href="#comments">Agregar</a>)</h5>
                        <?php
                        	foreach($incident_comments as $comment)
			                {
                                echo "<div class=\"discussion-box\">";
                                echo "<p><strong>" . $comment->comment_author . "</strong>&nbsp;(" . date('M j Y', strtotime($comment->comment_date)) . ")</p>";
                                echo "<p>" . $comment->comment_description . "</p>";
                                echo "<div class=\"report_rating\">";
                                echo "	<div>";
                                echo "	Credibilidad:&nbsp;";
                                echo "	<a href=\"javascript:rating('" . $comment->id . "','add','comment','cloader_" . $comment->id . "')\"><img id=\"cup_" . $comment->id . "\" src=\"" . url::base() . 'media/img/' . "up.png\" alt=\"UP\" title=\"ARRIBA\" border=\"0\" /></a>&nbsp;";
                                echo "	<a href=\"javascript:rating('" . $comment->id . "','subtract','comment','cloader_" . $comment->id . "')\"><img id=\"cdown_" . $comment->id . "\" src=\"" . url::base() . 'media/img/' . "down.png\" alt=\"DOWN\" title=\"ABAJO\" border=\"0\" /></a>&nbsp;";
                                echo "	</div>";
                                echo "	<div class=\"rating_value\" id=\"crating_" . $comment->id . "\">" . $comment->comment_rating . "</div>";
                                echo "	<div id=\"cloader_" . $comment->id . "\" class=\"rating_loading\" ></div>";
                                echo "</div>";
                                echo "</div>";
			                }
                        ?>
		              </div>
		            </div>		
		          </div>
		        </div>
		      </div>
		    </div>
		    <!-- end incident block <> start other report -->
		    <div class="blocks-holder">
		      <!-- start images -->
		      <div class="small-block images">
		        <h3>Imagenes</h3>
		        <div class="block-bg">
		          <div class="block-top">
		            <div class="block-bottom">
		              <div class="photoslider" id="default"></div>
					</div>
		          </div>
		        </div>
		      </div>
		      <!-- end images <> start side block -->
		      <div class="side-block">
		        <div class="small-block">
		          <h3>Reporte de incidente(s)</h3>
		          <div class="block-bg">
		            <div class="block-top">
		              <div class="block-bottom">
		                <ul>
		                  <li>
		                    <ul class="title">
		                      <li class="w-01">TITULO</li>
		                      <li class="w-02">UBICACION</li>
		                      <li class="w-03">FECHA</li>
		                    </ul>
		                  </li>
                           <?php
                           foreach($incident_neighbors as $neighbor)
                           {
                                echo "<li>";
                                echo "<ul>";
                                echo "<li class=\"w-01\"><a href=\"" . url::base(); 
                                echo "reports/view/" . $neighbor->id . "\">" . $neighbor->incident_title . "</a></li>";
                                echo "<li class=\"w-02\">" . $neighbor->location->location_name . "</li>";
                                echo "<li class=\"w-03\">" . date('M j Y', strtotime($neighbor->incident_date)) . "</li>";
                                echo "</ul>";
                                echo "</li>";
                           }
                           ?>
		                </ul>
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="small-block">
		          <h3>Noticias Relacionadas al Incidente</h3>
		          <div class="block-bg">
		            <div class="block-top">
		              <div class="block-bottom">
		                <ul>
		                  <li>
		                    <ul class="title">
		                      <li class="w-01">TITULO</li>
		                      <li class="w-02">FUENTE</li>
		                      <li class="w-03">FECHA</li>
		                    </ul>
		                  </li>
						<?php
						foreach ($feeds as $feed)
						{
							$feed_id = $feed->id;
							$feed_title = text::limit_chars($feed->item_title, 40, '...', True);
							$feed_link = $feed->item_link;
							$feed_date = date('M j Y', strtotime($feed->item_date));
							$feed_source = text::limit_chars($feed->feed->feed_name, 15, "...");
							?>
							<li>
								<ul>
									<li class="w-01">
									<a href="<?php echo $feed_link; ?>" target="_blank">
									<?php echo $feed_title ?></a></li>
									<li class="w-02"><?php echo $feed_source; ?></li>
									<li class="w-03"><?php echo $feed_date; ?></li>
								</ul>
							</li>
							<?php
						}
						?>
		                </ul>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <!-- end side block -->
		    </div>
			<br />
			<!-- start videos -->
			<?php
				if( count($incident_videos) > 0 ) 
				{

			?>
			    <div class="small-block images">
			    	<h3>Videos</h3>
					<div class="block-bg">
			          <div class="block-top">
			            <div class="block-bottom">

							<div class="slider-wrap">
								<div id="slider1" class="csw">
									<div class="panelContainer">

										<?php
											// embed the video codes
											foreach( $incident_videos as $incident_video) {
										?>
										<div class="panel">
											<div class="wrapper">
												<p>
												 <?php
												 $videos_embed->embed($incident_video,'');
												 ?>	
												<p>
											</div>
										</div>
										<?php } ?>

									</div><!-- .panelContainer -->
								</div><!-- #slider1 -->
							</div><!-- .slider-wrap -->

						</div>
			         </div>
			       </div>
			    </div>
			 <?php } ?>
			 <!-- end incident block <> start other report -->
			<br />
		    <!-- end incident block <> start other report -->
			<a name="comments"></a>
			<div class="big-block">
				<div class="big-block-top">
				<div class="big-block-bottom">
					<div id="comments" class="report_comment">
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
									print (!$error_description) ? '' : "<li>" . $error_description . "</li>";
								}
								?>
								</ul>
							</div>
						<?php
						}
						?>
						<?php print form::open(NULL, array('id' => 'commentForm', 'name' => 'commentForm')); ?>
						<div class="report_row">
                        	<strong>Nombre:</strong><br />
							<?php print form::input('comment_author', $form['comment_author'], ' class="text"'); ?>
                        </div>
						<div class="report_row">
                        	<strong>E-Mail:</strong><br />
							<?php print form::input('comment_email', $form['comment_email'], ' class="text"'); ?>
                        </div>
						<div class="report_row">
							<strong>Comentarios:</strong><br />
							<?php print form::textarea('comment_description', $form['comment_description'], ' rows="4" cols="40" class="textarea long" ') ?>
                        </div>
						<div class="report_row">
							<strong>C&oacute;digo de seguridad:</strong><br />
							<?php print $captcha->render(); ?><br />
							<?php print form::input('captcha', $form['captcha'], ' class="text"'); ?>
                        </div>
                        <div class="report_row">
                        	<input name="submit" type="submit" value="Enviar Comentarios" class="btn_blue" />
                        </div>
						<?php print form::close(); ?>
					</div>
				  </div>
				</div>
			  </div>
			</div>
		</div>
