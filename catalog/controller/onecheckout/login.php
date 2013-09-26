<?php  

class ControllerOneCheckoutLogin extends Controller { 

	public function index() {

		$this->language->load('onecheckout/checkout');		
		$this->load->model('onecheckout/checkout');
		$json = array();		

		if ((!$this->cart->hasProducts() && (!isset($this->session->data['vouchers']) || !$this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {

			$json['redirect'] = $this->url->link('checkout/cart');

		}			

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if (isset($this->request->post['account'])) {

				$this->session->data['account'] = $this->request->post['account'];

			}	

			if (isset($this->request->post['email']) && isset($this->request->post['password'])) {

				if ($this->customer->login($this->request->post['email'], $this->request->post['password'])) {

					unset($this->session->data['guest']);	
					
					$this->session->data['payment_address_id'] = $this->customer->getAddressId();
					$this->session->data['shipping_address_id'] = $this->customer->getAddressId();			

					// Calculate Totals
					/**$total_data = array();					
					$total = 0;
					$taxes = $this->cart->getTaxes();
					
					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {						
						
						$sort_order = array(); 
						
						$results = $this->model_onecheckout_checkout->getExtensions('total');
						
						foreach ($results as $key => $value) {
							$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
						}
						
						array_multisort($sort_order, SORT_ASC, $results);
						
						foreach ($results as $result) {
							if ($this->config->get($result['code'] . '_status')) {
								$this->load->model('total/' . $result['code']);
					
								$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
							}
						}
						
						$sort_order = array(); 
					  
						foreach ($total_data as $key => $value) {
							$sort_order[$key] = $value['sort_order'];
						}
				
						array_multisort($sort_order, SORT_ASC, $total_data);
					}
					
					$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
					**/
					
					$json['logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));					
					
					$json['hasshipping'] = $this->cart->hasShipping();
					
					$version_int = $this->model_onecheckout_checkout->versiontoint();
					//version
					if($version_int < 1513 && $version_int >= 1500){
						$address_info = $this->model_onecheckout_checkout->getAddress($this->customer->getAddressId());	
						if ($address_info) {
							$this->tax->setZone($address_info['country_id'], $address_info['zone_id']);
						}
					}

				} else {

					$json['error']['warning'] = $this->language->get('error_login');

				}

			}

		} else {

			$this->data['text_forgotten'] = $this->language->get('text_forgotten');	 

			$this->data['entry_email'] = $this->language->get('entry_email');

			$this->data['entry_password'] = $this->language->get('entry_password');

			$this->data['button_login'] = $this->language->get('button_login');			

			$this->data['guest_checkout'] = ($this->config->get('config_guest_checkout') && !$this->config->get('config_customer_price') && !$this->cart->hasDownload());
			

			if (isset($this->session->data['account'])) {

				$this->data['account'] = $this->session->data['account'];

			} else {

				$this->data['account'] = 'register';

			}			

			$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');			

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/onecheckout/login.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/onecheckout/login.tpl';
			} else {
				$this->template = 'default/template/onecheckout/login.tpl';
			}					

			$json['output'] = $this->render();

		}

		$this->response->setOutput($this->model_onecheckout_checkout->jsonencode($json));		

	}

}

?>