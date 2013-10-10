<?php 
class ControllerCheckoutShippingMethod extends Controller {
  	public function index() {
		$this->language->load('checkout/checkout');
		
		$this->load->model('account/address');
		
		if ($this->customer->isLogged() && isset($this->session->data['shipping_address_id'])) {					
			$shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);		
		} elseif (isset($this->session->data['guest'])) {
			$shipping_address = $this->session->data['guest']['shipping'];
		}
		
		if (!empty($shipping_address)) {
			// Shipping Methods
			$quote_data = array();
			
			$this->load->model('setting/extension');
			
			$results = $this->model_setting_extension->getExtensions('shipping');
			
			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('shipping/' . $result['code']);
					
					$quote = $this->{'model_shipping_' . $result['code']}->getQuote($shipping_address); 
		
					if ($quote) {
						$quote_data[$result['code']] = array( 
							'title'      => $quote['title'],
							'quote'      => $quote['quote'], 
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error']
						);
					}
				}
			}
	
			$sort_order = array();
		  
			foreach ($quote_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
	
			array_multisort($sort_order, SORT_ASC, $quote_data);
			
			$this->session->data['shipping_methods'] = $quote_data;
		}
					
		$this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
		$this->data['text_comments'] = $this->language->get('text_comments');

        $this->language->load('total/gift_wrap');
        $this->data['text_gift_wrap_heading'] = $this->language->get('text_gift_wrap_heading');
        $this->data['text_gift_wrap_info'] = $this->language->get('text_gift_wrap_info');
        $this->data['text_gift_wrap_heading'] = $this->language->get('text_gift_wrap_heading');
        $this->data['text_gift_wrap_note'] = $this->language->get('text_gift_wrap_note');
        $this->data['gift_wrap_status'] = $this->config->get('gift_wrap_status');
        $this->data['gift_wrap_show_on_shipping'] = $this->config->get('gift_wrap_show_on_shipping');
        $this->data['gift_wrap_show_on_payment'] = $this->config->get('gift_wrap_show_on_payment');
        $this->data['gift_wrap_use_note_field'] = $this->config->get('gift_wrap_use_note_field');
        $this->data['gift_wrap_fee'] = $this->currency->format($this->tax->calculate($this->config->get('gift_wrap_fee'), $this->config->get('gift_wrap_tax_class_id'), $this->config->get('config_tax')));
        if($this->config->get('gift_wrap_calculation_method') == 'per_qty'){
          $this->data['gift_wrap_fee_note'] = $this->language->get('text_note_per_qty');
        } else if($this->config->get('gift_wrap_calculation_method') == 'per_product'){
          $this->data['gift_wrap_fee_note'] = $this->language->get('text_note_per_product');
        } else {
          $this->data['gift_wrap_fee_note'] = '';
        }
        if(isset($this->session->data['gift_wrap'])){
          $this->data['gift_wrap'] = true;
        } else {
          $this->data['gift_wrap'] = false;
        }
        if(isset($this->session->data['gift_wrap_note'])){
          $this->data['gift_wrap_note'] = $this->session->data['gift_wrap_note'];
        } else {
          $this->data['gift_wrap_note'] = '';
        }
      
	
		$this->data['button_continue'] = $this->language->get('button_continue');
		
		if (empty($this->session->data['shipping_methods'])) {
			$this->data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
		} else {
			$this->data['error_warning'] = '';
		}	
					
		if (isset($this->session->data['shipping_methods'])) {
			$this->data['shipping_methods'] = $this->session->data['shipping_methods']; 
		} else {
			$this->data['shipping_methods'] = array();
		}
		
		if (isset($this->session->data['shipping_method']['code'])) {
			$this->data['code'] = $this->session->data['shipping_method']['code'];
		} else {
			$this->data['code'] = '';
		}
		
		if (isset($this->session->data['comment'])) {
			
        $this->data['comment'] = preg_replace('/' . $this->language->get('text_gift_wrap_note') . '(.*)/ims', '', $this->session->data['comment']);
      
		} else {
			$this->data['comment'] = '';
		}
		
		$this->data['has_recurring'] = $this->cart->hasRecurring(); // && ($this->config->get('recurring_status') == 1);
		
		//recurring
		if (isset($this->session->data['recurring']) && $this->session->data['recurring'] == 1) 
		{ 
			$this->data['recurring'] = $this->session->data['recurring'];
			$this->data['recurring_frequency'] = isset($this->session->data['recurring_frequency']) ? $this->session->data['recurring_frequency'] : 0;
		} 
		else 
		{
			$this->data['recurring'] = '';
			$this->data['recurring_frequency'] = 0;
		}
			
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/shipping_method.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/shipping_method.tpl';
		} else {
			$this->template = 'default/template/checkout/shipping_method.tpl';
		}
		
		$this->response->setOutput($this->render());
  	}
	
	public function validate() {
		$this->language->load('checkout/checkout');
		
		$json = array();		
		
		// Validate if shipping is required. If not the customer should not have reached this page.
		if (!$this->cart->hasShipping()) {
			$json['redirect'] = $this->url->link('checkout/checkout', '', 'SSL');
		}
		
		// Validate if shipping address has been set.		
		$this->load->model('account/address');

		if ($this->customer->isLogged() && isset($this->session->data['shipping_address_id'])) {					
			$shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);		
		} elseif (isset($this->session->data['guest'])) {
			$shipping_address = $this->session->data['guest']['shipping'];
		}
		
		if (empty($shipping_address)) {								
			$json['redirect'] = $this->url->link('checkout/checkout', '', 'SSL');
		}
		
		// Validate cart has products and has stock.	
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');				
		}	
		
		// Validate minimum quantity requirments.			
		$products = $this->cart->getProducts();
				
		foreach ($products as $product) {
			$product_total = 0;
				
			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}		
			
			if ($product['minimum'] > $product_total) {
				$json['redirect'] = $this->url->link('checkout/cart');
				
				break;
			}				
		}
		
		
		
		if (isset($this->request->post['recurring']))
		{
			$this->session->data['recurring'] = 1;
			if ($this->request->post['recurring_frequency'] > 0)
			{
				$this->session->data['recurring_frequency'] = $this->request->post['recurring_frequency'];
			}
			else
			{
				$json['error']['warning'] = "You must select recurring frequency";
			}
		}
		else
		{
			$this->session->data['recurring'] = '';
		}
				
		if (!$json) {
			if (!isset($this->request->post['shipping_method'])) {
				$json['error']['warning'] = $this->language->get('error_shipping');
			} else {
				$shipping = explode('.', $this->request->post['shipping_method']);
					
				if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {			
					$json['error']['warning'] = $this->language->get('error_shipping');
				}
			}
			
			if (!$json) {
				$shipping = explode('.', $this->request->post['shipping_method']);
					
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
				
				$this->session->data['comment'] = strip_tags($this->request->post['comment']);

        if ($this->config->get('gift_wrap_show_on_shipping')) {
          if (isset($this->request->post['gift_wrap']) && $this->request->post['gift_wrap']) {
            $this->session->data['gift_wrap'] = $this->request->post['gift_wrap'];
			if (isset($this->request->post['gift_wrap_note'])) {
				$this->session->data['gift_wrap_note'] = strip_tags($this->request->post['gift_wrap_note']);
			}
          } else {
            unset($this->session->data['gift_wrap']);
            unset($this->session->data['gift_wrap_note']);
          }
        }
      
			}							
		}
		
		$this->response->setOutput(json_encode($json));	
	}
}
?>