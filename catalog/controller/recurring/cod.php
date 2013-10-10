<?php
class ControllerRecurringCod extends Controller {
	protected function index() 
	{
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/recurring/cod.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/recurring/cod.tpl';
		} else {
			$this->template = 'default/template/recurring/cod.tpl';
		}	
		
		$this->render();	
	}
}
?>