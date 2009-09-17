<?php defined('SYSPATH') or die('No direct script access.');
/**
 * This controller is used to list/view Organizations
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     Help Controller  
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */

class Participate_Controller extends Main_Controller {

    function __construct()
    {
        parent::__construct();

		// Javascript Header
		$this->template->header->validator_enabled = TRUE;
    }

    /**
     * Displays all Organizations.
     */
    public function index() 
	{
		$this->template->header->this_page = 'participate';
		$this->template->content = new View('participate');
		
        
	}
	
	
}
