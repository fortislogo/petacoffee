<?php
class ControllerRecurringFreeCheckout extends Controller {
	protected function index() 
	{
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/recurring/free_checkout.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/recurring/free_checkout.tpl';
		} else {
			$this->template = 'default/template/recurring/free_checkout.tpl';
		}	
		
		$this->render();	
	}
}
?>