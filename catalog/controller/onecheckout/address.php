<?php 

class ControllerOneCheckoutAddress extends Controller {

	public function payment() {

		$this->language->load('onecheckout/checkout');    	

		$this->load->model('onecheckout/checkout');		

		$json = array();		

		if (!$this->customer->isLogged()) {
			$json['redirect'] = $this->url->link('onecheckout/checkout', '', 'SSL');
		}		

		if ((!$this->cart->hasProducts() && (!isset($this->session->data['vouchers']) || !$this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}			

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if (!$json) {
				if ($this->request->post['payment_address'] == 'existing') {
					if (!isset($this->request->post['address_id'])) {
						$json['error']['warning'] = $this->language->get('error_address');
					}					

					if (!$json) {	
						$this->session->data['payment_address_id'] = $this->request->post['address_id'];
						unset($this->session->data['payment_methods']);
						unset($this->session->data['payment_method']);	
					}
				} 				

				if ($this->request->post['payment_address'] == 'new') {
					if ((strlen(utf8_decode($this->request->post['firstname'])) < 1) || (strlen(utf8_decode($this->request->post['firstname'])) > 32)) {
						$json['error']['firstname'] = $this->language->get('error_firstname');
					}
	

					if ((strlen(utf8_decode($this->request->post['lastname'])) < 1) || (strlen(utf8_decode($this->request->post['lastname'])) > 32)) {
						$json['error']['lastname'] = $this->language->get('error_lastname');
					}			

					if ((strlen(utf8_decode($this->request->post['address_1'])) < 3) || (strlen(utf8_decode($this->request->post['address_1'])) > 64)) {
						$json['error']['address_1'] = $this->language->get('error_address_1');
					}			

					if ((strlen(utf8_decode($this->request->post['city'])) < 2) || (strlen(utf8_decode($this->request->post['city'])) > 32)) {
						$json['error']['city'] = $this->language->get('error_city');
					}
		

					$country_info = $this->model_onecheckout_checkout->getCountry($this->request->post['country_id']);					

					if ($country_info && $country_info['postcode_required'] && (strlen(utf8_decode($this->request->post['postcode'])) < 2) || (strlen(utf8_decode($this->request->post['postcode'])) > 10)) {
						$json['error']['postcode'] = $this->language->get('error_postcode');
					}					

					if ($this->request->post['country_id'] == '') {
						$json['error']['country'] = $this->language->get('error_country');
					}
					

					if ($this->request->post['zone_id'] == '') {
						$json['error']['zone'] = $this->language->get('error_zone');
					}					

					if (!$json) {
						$this->session->data['payment_address_id'] = $this->model_onecheckout_checkout->addAddress($this->request->post);

						unset($this->session->data['payment_methods']);
						unset($this->session->data['payment_method']);
					}		
				}
			}

		} else {

			$this->data['text_address_existing'] = $this->language->get('text_address_existing');
			$this->data['text_address_new'] = $this->language->get('text_address_new');
			$this->data['text_select'] = $this->language->get('text_select');	

			$this->data['entry_firstname'] = $this->language->get('entry_firstname');
			$this->data['entry_lastname'] = $this->language->get('entry_lastname');
			$this->data['entry_company'] = $this->language->get('entry_company');
			$this->data['entry_address_1'] = $this->language->get('entry_address_1');
			$this->data['entry_address_2'] = $this->language->get('entry_address_2');
			$this->data['entry_postcode'] = $this->language->get('entry_postcode');
			$this->data['entry_city'] = $this->language->get('entry_city');
			$this->data['entry_country'] = $this->language->get('entry_country');
			$this->data['entry_zone'] = $this->language->get('entry_zone');			

			$this->data['type'] = 'payment';		

			if (isset($this->session->data['payment_address_id'])) {
				$this->data['address_id'] = $this->session->data['payment_address_id'];
			} else {
				$this->data['address_id'] = $this->customer->getAddressId();
			}	

			$this->data['addresses'] = $this->model_onecheckout_checkout->getAddresses();
			$this->data['country_id'] = $this->config->get('config_country_id');

			$this->data['countries'] = $this->model_onecheckout_checkout->getCountries();	

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/onecheckout/address.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/onecheckout/address.tpl';
			} else {
				$this->template = 'default/template/onecheckout/address.tpl';
			}

			$json['hasshipping'] = $this->cart->hasShipping();	
			$json['output'] = $this->render();
		}

		$this->response->setOutput($this->model_onecheckout_checkout->jsonencode($json));	

  	}

	

	public function shipping() {

		$this->language->load('onecheckout/checkout');
		$this->load->model('onecheckout/checkout');	

		$json = array();	

		if (!$this->customer->isLogged()) {
			$json['redirect'] = $this->url->link('onecheckout/checkout', '', 'SSL');
		}		

		if (!$this->cart->hasShipping()) {
			$json['redirect'] = $this->url->link('onecheckout/checkout', '', 'SSL');
		}			

		if ((!$this->cart->hasProducts() && (!isset($this->session->data['vouchers']) || !$this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');	
		}						

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if (!$json) {
				if ($this->request->post['shipping_address'] == 'existing') {

					if (!isset($this->request->post['address_id'])) {
						$json['error']['warning'] = $this->language->get('error_address');
					}					

					if (!$json) {	
						$this->session->data['shipping_address_id'] = $this->request->post['address_id'];
						
						$version_int = $this->model_onecheckout_checkout->versiontoint();
						//version
						if($version_int < 1513 && $version_int >= 1500){
							$address_info = $this->model_onecheckout_checkout->getAddress($this->request->post['address_id']);				
							if ($address_info) {
								$this->tax->setZone($address_info['country_id'], $address_info['zone_id']);
							}
						}
						unset($this->session->data['shipping_methods']);
						unset($this->session->data['shipping_method']);	
					}
				} 				

				if ($this->request->post['shipping_address'] == 'new') {
					if ((strlen(utf8_decode($this->request->post['firstname'])) < 1) || (strlen(utf8_decode($this->request->post['firstname'])) > 32)) {
						$json['error']['firstname'] = $this->language->get('error_firstname');
					}		

					if ((strlen(utf8_decode($this->request->post['lastname'])) < 1) || (strlen(utf8_decode($this->request->post['lastname'])) > 32)) {
						$json['error']['lastname'] = $this->language->get('error_lastname');
					}			

					if ((strlen(utf8_decode($this->request->post['address_1'])) < 3) || (strlen(utf8_decode($this->request->post['address_1'])) > 64)) {
						$json['error']['address_1'] = $this->language->get('error_address_1');
					}			

					if ((strlen(utf8_decode($this->request->post['city'])) < 2) || (strlen(utf8_decode($this->request->post['city'])) > 128)) {
						$json['error']['city'] = $this->language->get('error_city');
					}

					$country_info = $this->model_onecheckout_checkout->getCountry($this->request->post['country_id']);					

					if ($country_info && $country_info['postcode_required'] && (strlen(utf8_decode($this->request->post['postcode'])) < 2) || (strlen(utf8_decode($this->request->post['postcode'])) > 10)) {
						$json['error']['postcode'] = $this->language->get('error_postcode');
					}					

					if ($this->request->post['country_id'] == '') {
						$json['error']['country'] = $this->language->get('error_country');
					}
					

					if ($this->request->post['zone_id'] == '') {
						$json['error']['zone'] = $this->language->get('error_zone');
					}					

					if (!$json) {							

						$this->session->data['shipping_address_id'] = $this->model_onecheckout_checkout->addAddress($this->request->post);								

						$version_int = $this->model_onecheckout_checkout->versiontoint();
						//version
						if($version_int < 1513 && $version_int >= 1500){
							if ($this->cart->hasShipping()) {
								$this->tax->setZone($this->request->post['country_id'], $this->request->post['zone_id']);
							}
						}						
						unset($this->session->data['shipping_methods']);
						unset($this->session->data['shipping_method']);
					}
				}
			}

		} else {

			$this->data['text_address_existing'] = $this->language->get('text_address_existing');
			$this->data['text_address_new'] = $this->language->get('text_address_new');
			$this->data['text_select'] = $this->language->get('text_select');	

			$this->data['entry_firstname'] = $this->language->get('entry_firstname');
			$this->data['entry_lastname'] = $this->language->get('entry_lastname');
			$this->data['entry_company'] = $this->language->get('entry_company');
			$this->data['entry_address_1'] = $this->language->get('entry_address_1');
			$this->data['entry_address_2'] = $this->language->get('entry_address_2');
			$this->data['entry_postcode'] = $this->language->get('entry_postcode');
			$this->data['entry_city'] = $this->language->get('entry_city');
			$this->data['entry_country'] = $this->language->get('entry_country');
			$this->data['entry_zone'] = $this->language->get('entry_zone');	
			
			$this->data['button_continue'] = $this->language->get('button_continue');		

			$this->data['type'] = 'shipping';				

			if (isset($this->session->data['shipping_address_id'])) {
				$this->data['address_id'] = $this->session->data['shipping_address_id'];
			} else {
				$this->data['address_id'] = $this->customer->getAddressId();
			}


			$this->data['addresses'] = $this->model_onecheckout_checkout->getAddresses();			

			$this->data['country_id'] = $this->config->get('config_country_id');	
					
			$this->data['countries'] = $this->model_onecheckout_checkout->getCountries();	

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/onecheckout/address.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/onecheckout/address.tpl';
			} else {
				$this->template = 'default/template/onecheckout/address.tpl';
			}

			$json['hasshipping'] = $this->cart->hasShipping();	
			$json['output'] = $this->render();

		}	
		$this->response->setOutput($this->model_onecheckout_checkout->jsonencode($json));

  	}		
	
	public function getinfo() {
		$json = array();
		$this->load->model('onecheckout/checkout');
		
		if(isset($this->session->data['payment_address_id']) && $this->session->data['payment_address_id']){			
			$payment_address = $this->model_onecheckout_checkout->getAddress($this->session->data['payment_address_id']);
		} elseif(isset($this->session->data['guest']['payment']) && $this->session->data['guest']['payment']) {
			$payment_address = $this->session->data['guest']['payment'];
		}
		
		if(isset($payment_address)) {
			$json['paymentaddress'] = $payment_address['firstname'] . ' ' . $payment_address['lastname'] . '<br />' . $payment_address['address_1'] . ' ' . $payment_address['address_2']  . '<br />' . $payment_address['city'] . ' ' . $payment_address['postcode'] . '<br />' . $payment_address['zone'] . '<br />' . $payment_address['country'];
		} else {
			$json['paymentaddress'] = '';
		}
		
		if(isset($this->session->data['shipping_address_id']) && $this->session->data['shipping_address_id']) {
			$shipping_address = $this->model_onecheckout_checkout->getAddress($this->session->data['shipping_address_id']);
		} elseif(isset($this->session->data['guest']['shipping']) && $this->session->data['guest']['shipping']) {
			$shipping_address = $this->session->data['guest']['shipping'];
		}
		
		if(isset($shipping_address)) {
			$json['shippingaddress'] = $shipping_address['firstname'] . ' ' . $shipping_address['lastname'] . '<br />' . $shipping_address['address_1'] . ' ' . $shipping_address['address_2']  . '<br />' . $shipping_address['city'] . ' ' . $shipping_address['postcode'] . '<br />' . $shipping_address['zone'] . '<br />' . $shipping_address['country'];
		} else {
			$json['shippingaddress'] = '';
		}
		
		if (isset($this->session->data['shipping_method']['title'])) {
			$json['shippingmethod'] = $this->session->data['shipping_method']['title'];
		} else {
			$json['shippingmethod'] = '';
		}
		
		if (isset($this->session->data['payment_method']['title'])) {
			$json['paymentmethod'] = $this->session->data['payment_method']['title'];
		} else {
			$json['paymentmethod'] = '';
		}
		
		if (isset($this->session->data['comment'])) {
			$this->language->load('onecheckout/checkout');
			$json['paymentmethod'] .= '<br /><br /><h2 style="border-bottom:1px #000000 solid; padding-bottom:6px;">'.$this->language->get('text_checkout_comment').'</h2>';
			$json['paymentmethod'] .= '<p style="padding-top:10px;">'.$this->session->data['comment'].'</p>';
		}
		
		$this->response->setOutput($this->model_onecheckout_checkout->jsonencode($json));
	}
	
	public function zone() {

		$output = '<option value="">' . $this->language->get('text_select') . '</option>';	

		$this->load->model('onecheckout/checkout');
    	$results = $this->model_onecheckout_checkout->getZonesByCountryId($this->request->get['country_id']);        

      	foreach ($results as $result) {
        	$output .= '<option value="' . $result['zone_id'] . '"';	

	    	if (isset($this->request->get['zone_id']) && ($this->request->get['zone_id'] == $result['zone_id'])) {
	      		$output .= ' selected="selected"';
	    	}

	    	$output .= '>' . $result['name'] . '</option>';

    	} 		

		if (!$results) {
		  	$output .= '<option value="0">' . $this->language->get('text_none') . '</option>';
		}	

		$this->response->setOutput($output);

  	}	

}
?>