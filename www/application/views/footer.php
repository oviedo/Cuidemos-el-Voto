<?php 
/**
 * Footer view page.
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
		<!-- end content block <> start footer block -->
		<div id="footer">			
			<div style="margin: 0 auto 0 auto; text-align:center;">
			<a href="http://civic.mit.edu" title="Center for Future Civic Media - Massachusetts Institue of Technology"><img src="<?= url::base()?>media/img/civic-mit.jpg" border="0" alt="civic.mit.edu"></a>&nbsp;			
			<a href="http://www.eflyer.com.mx" title="eflyer - Tu imaginaci&oacute;n es el l&iacute;mite"><img src="<?= url::base()?>media/img/eflyer.jpg" border="0" alt="eflyer.com.mx"></a>&nbsp;
			<a href="http://www.pgr.gob.mx/Combate%20a%20la%20Delincuencia/Delitos%20Federales/Delitos%20Electorales/FEPADE/predef/predef.asp" title="FEPADE  - Fiscalía Especializada para la Atención de Delitos Electorales"><img src="<?= url::base()?>media/img/fepade.jpg" border="0" alt="FEPADE"></a>&nbsp;
			<a href="http://www.ushahidi.com" title="Ushahidi"><img src="<?= url::base()?>media/img/ushahidi.jpg" border="0" alt="Ushahidi"></a>&nbsp;
			<br/>
			<a href="http://www.somosmexico.org" title="Somos M&eacute;xico"><img src="<?= url::base()?>media/img/somos-mexico.jpg" border="0" alt="somosmexico.org"></a>&nbsp;						
			<a href="http://www.tuscandidatos.com/" title="Tus Candidatos - Busca. Conoce. Elige a tu mejor candidato"><img src="<?= url::base()?>media/img/tus-candidatos.jpg" border="0" alt="tuscandidatos.com"></a>&nbsp;
			<a href="http://www.centrodeinteligenciapolitica.com" title="CEINPOL - Centro de Inteligencia P&oacute;litica"><img src="<?= url::base()?>media/img/ceinpol.jpg" border="0" alt="centrodeinteligenciapolitica.com"></a>&nbsp;
			
			<a href="http://www.atncnmx.org.mx" title="atncnmx - Atención M&eacute;xico"><img src="<?= url::base()?>media/img/atncnmx.jpg" border="0" alt="atncnmx.org.mx"></a>&nbsp;
			<a href="http://www.congresoconrostro.org" title="Por un Congreso con Rostro"><img src="<?= url::base()?>media/img/congreso-con-rostro.jpg" border="0" alt="congresoconrostro.org"></a>&nbsp;
			<a href="http://www.axiombox.com" title="axiom box"><img src="<?= url::base()?>media/img/axiom-box.jpg" border="0" alt="axiombox.com"></a>&nbsp;
			<br/>
			<a href="http://www.tendiendopuentes.org.mx" title="Tendiendo Puentes"><img src="<?= url::base()?>media/img/tendiendo-puentes.jpg" border="0" alt="tendiendopuentes.org.mx"></a>&nbsp;
			</div>
			<br/>	
			<div class="footer-info">
				<ul>
					<li><a href="<?php echo url::base() ?>"><?php echo Kohana::lang('ui_main.home'); ?></a></li>
					<li><a href="<?php echo url::base() . "reports/submit" ?>"><?php echo Kohana::lang('ui_main.report_an_incident'); ?></a></li>
					<li><a href="<?php echo url::base() . "alerts" ?>"><?php echo Kohana::lang('ui_main.alerts'); ?></a></li>
					<li><a href="<?php echo url::base() . "help" ?>"><?php echo Kohana::lang('ui_main.help'); ?></a></li>
					<li><a href="<?php echo url::base() . "about" ?>"><?php echo Kohana::lang('ui_main.about'); ?></a></li>					
					<li><a href="http://feedback.ushahidi.com/fillsurvey.php?sid=2&uid=<?php echo $_SERVER['SERVER_NAME']; ?>" target="_blank"><?php echo Kohana::lang('ui_main.feedback'); ?></a></li>
				</ul>
				<p><?php echo Kohana::lang('ui_main.copyright'); ?></p>
			</div>			
		</div>
		<!-- end footer block -->
	</div>
	<img src="<?php echo $tracker_url; ?>" />
	<?php echo $google_analytics; ?>	
	<!-- Task Scheduler -->
	<img src="<?php echo url::base() . 'scheduler'; ?>" height="1" width="1" border="0">
</body>
</html>