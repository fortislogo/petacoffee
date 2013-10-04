<?php
class ControllerRecurringAuthorizeNetAim extends Controller {
	protected function index() 
	{
	
		
		$this->data['card_owner'] = $this->session->data['card']['owner'];
		$this->data['card_num'] = $this->session->data['card']['num'];
		$this->data['card_code'] = $this->session->data['card']['code'];
		$this->data['exp_date_month'] = $this->session->data['card']['exp_month'];
		$this->data['exp_date_year'] = $this->session->data['card']['exp_year'];
		
		$this->data['months'] = array();
		
		for ($i = 1; $i <= 12; $i++) {
			$this->data['months'][] = array(
				'text'  => strftime('%B', mktime(0, 0, 0, $i, 1, 2000)), 
				'value' => sprintf('%02d', $i)
			);
		}
		
		$today = getdate();

		$this->data['year_expire'] = array();

		for ($i = $today['year']; $i < $today['year'] + 11; $i++) {
			$this->data['year_expire'][] = array(
				'text'  => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)),
				'value' => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)) 
			);
		}
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/recurring/authorizenet_aim.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/recurring/authorizenet_aim.tpl';
		} else {
			$this->template = 'default/template/recurring/authorizenet_aim.tpl';
		}	
		
		$this->render();	
	}
}
?>