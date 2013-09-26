<?php
class ControllerPaymentAuthorizeNetAim extends Controller {
	protected function index() {
		$this->language->load('payment/authorizenet_aim');
		
		$this->data['text_credit_card'] = $this->language->get('text_credit_card');
		$this->data['text_wait'] = $this->language->get('text_wait');
		
		$this->data['entry_cc_owner'] = $this->language->get('entry_cc_owner');
		$this->data['entry_cc_number'] = $this->language->get('entry_cc_number');
		$this->data['entry_cc_expire_date'] = $this->language->get('entry_cc_expire_date');
		$this->data['entry_cc_cvv2'] = $this->language->get('entry_cc_cvv2');
		
		$this->data['button_confirm'] = $this->language->get('button_confirm');
		
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
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/authorizenet_aim.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/authorizenet_aim.tpl';
		} else {
			$this->template = 'default/template/payment/authorizenet_aim.tpl';
		}	
		
		$this->render();		
	}
	
	public function send() {
		if ($this->config->get('authorizenet_aim_server') == 'live') {
    		$url = 'https://secure.authorize.net/gateway/transact.dll';
		} elseif ($this->config->get('authorizenet_aim_server') == 'test') {
			$url = 'https://test.authorize.net/gateway/transact.dll';		
		}	
		
		//$url = 'https://secure.networkmerchants.com/gateway/transact.dll';	
		
		$this->load->model('checkout/order');
		
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		
        $data = array();

		$data['x_login'] = $this->config->get('authorizenet_aim_login');
		$data['x_tran_key'] = $this->config->get('authorizenet_aim_key');
		$data['x_version'] = '3.1';
		$data['x_delim_data'] = 'true';
		$data['x_delim_char'] = ',';
		$data['x_encap_char'] = '"';
		$data['x_relay_response'] = 'false';
		$data['x_first_name'] = html_entity_decode($order_info['payment_firstname'], ENT_QUOTES, 'UTF-8');
		$data['x_last_name'] = html_entity_decode($order_info['payment_lastname'], ENT_QUOTES, 'UTF-8');
		$data['x_company'] = html_entity_decode($order_info['payment_company'], ENT_QUOTES, 'UTF-8');
		$data['x_address'] = html_entity_decode($order_info['payment_address_1'], ENT_QUOTES, 'UTF-8');
		$data['x_city'] = html_entity_decode($order_info['payment_city'], ENT_QUOTES, 'UTF-8');
		$data['x_state'] = html_entity_decode($order_info['payment_zone'], ENT_QUOTES, 'UTF-8');
		$data['x_zip'] = html_entity_decode($order_info['payment_postcode'], ENT_QUOTES, 'UTF-8');
		$data['x_country'] = html_entity_decode($order_info['payment_country'], ENT_QUOTES, 'UTF-8');
		$data['x_phone'] = $order_info['telephone'];
		$data['x_customer_ip'] = $this->request->server['REMOTE_ADDR'];
		$data['x_email'] = $order_info['email'];
		$data['x_description'] = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
		$data['x_amount'] = $this->currency->format($order_info['total'], $order_info['currency_code'], 1.00000, false);
		$data['x_currency_code'] = $this->currency->getCode();
		$data['x_method'] = 'CC';
		$data['x_type'] = ($this->config->get('authorizenet_aim_method') == 'capture') ? 'AUTH_CAPTURE' : 'AUTH_ONLY';
		$data['x_card_num'] = str_replace(' ', '', $this->request->post['cc_number']);
		$data['x_exp_date'] = $this->request->post['cc_expire_date_month'] . $this->request->post['cc_expire_date_year'];
		$data['x_card_code'] = $this->request->post['cc_cvv2'];
		$data['x_invoice_num'] = $this->session->data['order_id'];
		/* Customer Shipping Address Fields */
		$data['x_ship_to_first_name'] = html_entity_decode($order_info['shipping_firstname'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_last_name'] = html_entity_decode($order_info['shipping_lastname'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_company'] = html_entity_decode($order_info['shipping_company'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_address'] = html_entity_decode($order_info['shipping_address_1'], ENT_QUOTES, 'UTF-8') . ' ' . html_entity_decode($order_info['shipping_address_2'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_city'] = html_entity_decode($order_info['shipping_city'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_state'] = html_entity_decode($order_info['shipping_zone'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_zip'] = html_entity_decode($order_info['shipping_postcode'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_country'] = html_entity_decode($order_info['shipping_country'], ENT_QUOTES, 'UTF-8');
	
		if ($this->config->get('authorizenet_aim_mode') == 'test') {
			$data['x_test_request'] = 'true';
		}
		
		if (false && isset($this->session->data['recurring']) && $this->session->data['recurring'])
		{
			$response = $this->recurring($data);
			
			if ($response->messages->resultCode == 'Ok')
			{
				$this->db->query("update `order` set cc = '".substr($data['x_card_num'], -4)."' where order_id = " . $this->session->data['order_id']);
				$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('config_order_status_id'));
				
				$message = "Subscription OK";			
				
				$json['success'] = $this->url->link('checkout/success', '', 'SSL');	
				
				$subscription_id = $response->subscriptionId;
				
				$this->addSubscription($data, $subscription_id);
				
				$this->model_checkout_order->update($this->session->data['order_id'], $this->config->get('authorizenet_aim_order_status_id'), $message, false);							
			}
			else
			{
				$json['error'] = 'Subscription Failed!';
			}
		}
		else
		{
				
			$curl = curl_init($url);

			curl_setopt($curl, CURLOPT_PORT, 443);
			curl_setopt($curl, CURLOPT_HEADER, 0);
			curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($curl, CURLOPT_FORBID_REUSE, 1);
			curl_setopt($curl, CURLOPT_FRESH_CONNECT, 1);
			curl_setopt($curl, CURLOPT_POST, 1);
			curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 10);
			curl_setopt($curl, CURLOPT_TIMEOUT, 10);
			curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data, '', '&'));
 
			$response = curl_exec($curl);
		
			$json = array();
		
			if (curl_error($curl)) 
			{
				$json['error'] = 'CURL ERROR: ' . curl_errno($curl) . '::' . curl_error($curl);
			
				$this->log->write('AUTHNET AIM CURL ERROR: ' . curl_errno($curl) . '::' . curl_error($curl));	
			} 
			elseif ($response) 
			{
				$i = 1;
			
				$response_info = array();
				
				$results = explode(',', $response);
			
				foreach ($results as $result) 
				{
					$response_info[$i] = trim($result, '"');
				
					$i++;
				}
				
				$forRecurring = $data;
				$forRecurring['x_card_owner'] = $this->request->post['cc_owner'];
				$this->recurring($forRecurring);
			
				if ($response_info[1] == '1') 
				{
					if (strtoupper($response_info[38]) == strtoupper(md5($this->config->get('authorizenet_aim_hash') . $this->config->get('authorizenet_aim_login') . $response_info[7] . $this->currency->format($order_info['total'], $order_info['currency_code'], 1.00000, false))) || $this->config->get('authorizenet_aim_mode') == 'test') 
					{
					
						$this->db->query("update `order` set cc = '".substr($data['x_card_num'], -4)."' where order_id = " . $this->session->data['order_id']);
						$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('config_order_status_id'));
					
						$message = '';
					
						if (isset($response_info['5'])) {
							$message .= 'Authorization Code: ' . $response_info['5'] . "\n";
						}
						
						if (isset($response_info['6'])) {
							$message .= 'AVS Response: ' . $response_info['6'] . "\n";
						}
			
						if (isset($response_info['7'])) {
							$message .= 'Transaction ID: ' . $response_info['7'] . "\n";
						}
	
						if (isset($response_info['39'])) {
							$message .= 'Card Code Response: ' . $response_info['39'] . "\n";
						}
					
						if (isset($response_info['40'])) {
							$message .= 'Cardholder Authentication Verification Response: ' . $response_info['40'] . "\n";
						}
						
						if (isset($this->session->data['recurring']) && $this->session->data['recurring'] == 1)
						{
							$this->recurring($forRecurring);
						}
					
						$this->model_checkout_order->update($this->session->data['order_id'], $this->config->get('authorizenet_aim_order_status_id'), $message, false);			
						
					}
				
					$json['success'] = $this->url->link('checkout/success', '', 'SSL');				
				
			
				} 
				else 
				{
					$json['error'] = $response_info[4];
				}
			} 
			else 
			{
				$json['error'] = 'Empty Gateway Response';
			
				$this->log->write('AUTHNET AIM CURL ERROR: Empty Gateway Response');
			}
			
			curl_close($curl);
		}
		
		
		
		
		/*if ($response && $response[1] == '1')
		{
			if (isset($this->session->data['recurring']) && $this->session->data['recurring'])
			{
				$response = $this->recurring($data);
			}
		}
		*/
		
		
		$this->response->setOutput(json_encode($json));
	}
	
	function recurring($order)
	{
		$this->addSubscription($order, 0);
	}
	
	function xrecurring($order)
	{
		//print_r($order);
		
		require('AuthNetXML/AuthnetXML.class.php');
		
		define('AUTHNET_LOGIN', $this->config->get('authorizenet_aim_login'));
   	 	define('AUTHNET_TRANSKEY', $this->config->get('authorizenet_aim_key'));
   		
		$xml = new AuthnetXML(AUTHNET_LOGIN, AUTHNET_TRANSKEY, AuthnetXML::USE_DEVELOPMENT_SERVER);
		
		/*$xml->createCustomerProfileRequest(array(
        	'profile' => array(
            	'merchantCustomerId' => '398019',
	            'email' => 'celso@gbsmanila.com',
    	        'paymentProfiles' => array(
        	        'billTo' => array(
            	        'firstName' => $order['x_first_name'],
                	    'lastName' => $order['x_last_name'],
                    	'address' => $order['x_address'],
	                    'city' => $order['x_city'],
    	                'state' => $order['x_zip'],
        	            'zip' => $order['x_zip'],
            	        'phoneNumber' => $order['x_phone']
                	),
	                'payment' => array(
    	                'creditCard' => array(
        	            'cardNumber' => $order['x_card_num'],
            	        'expirationDate' => sprintf("%s-%s",substr($order['x_exp_date'], -4,4), substr($order['x_exp_date'], 0, 2)),
                	    ),
                	),
            	),
  	          'shipToList' => array(
    	            'firstName' =>  $order['x_ship_to_first_name'],
        	        'lastName' =>  $order['x_ship_to_last_name'],
            	    'address' =>  $order['x_ship_to_address'],
                	'city' =>  $order['x_ship_to_city'],
	                'state' =>  $order['x_ship_to_state'],
    	            'zip' =>  $order['x_ship_to_state'],
        	        'phoneNumber' =>  $order['x_phone']
            	),
	        ),
    	    'validationMode' => 'testMode'
    	));
		*/
		
		$subscription_name = "";
		
		foreach ($this->cart->getProducts() as $product)
		{
			if ($product['recurring'] == 1)
			{
				$subscription_name = $product['name'];
			}
		}
		
		//$subscription_name = md5(rand());
		
		$xml->ARBCreateSubscriptionRequest(
			array(
        		'refId' => $this->session->data['order_id'],
        		'subscription' => array(
            		'name' => $subscription_name,
            		'paymentSchedule' => array(
                		'interval' => array(
                    	'length' => 7 * $this->session->data['recurring_frequency'],
                    	'unit' => 'days'
               		 ),
                	'startDate' => date("Y-m-d", mktime(0,0,0, date("m") + 1, 1, date("Y"))),
                	'totalOccurrences' => '12',
                	'trialOccurrences' => '1'
            	),
            	'amount' => $order['x_amount'],
            	'trialAmount' => '0.00',
            	'payment' => array(
                	'creditCard' => array(
                    	'cardNumber' => $order['x_card_num'],
            	        'expirationDate' => sprintf("%s-%s",substr($order['x_exp_date'], -4,4), substr($order['x_exp_date'], 0, 2)),
                	)
            	),
				
				'order' => array(
					'invoiceNumber' => $this->session->data['order_id']
				),
            
				'billTo' => array(
               		'firstName' => $order['x_first_name'],
               		'lastName' => $order['x_last_name'],
            	),
				
        	)
    	));
		
		return $xml->response();
		
	}
	
	function addSubscription($data, $subscription_id)
	{
		$query = $this->db->query("SELECT customer_id FROM customer WHERE email = '".$this->db->escape($data['x_email'])."'");
		$customer_id = $query->row['customer_id'];
		
		$subscription_name = "";
		
		/*foreach ($this->cart->getProducts() as $product)
		{
			if ($product['recurring'] == 1)
			{
				$subscription_name = $product['name'];
			}
		}*/
		
		$next_order_date = date("Y-m-d", strtotime(sprintf("+%s week", $this->session->data['recurring_frequency'])));
		
		$this->db->query("INSERT INTO recurring SET 
						 	customer_id = " . (int)$customer_id .", 
							subscription_id = " . $subscription_id . ", 
							name = '".$this->session->data['order_id']."',
							product = '".$this->db->escape($subscription_name)."',
							recurring = '".$this->session->data['recurring_frequency']."',
							previous_amount = '".$data['x_amount']."',
							amount = '".$data['x_amount']."',
							date = '".date("Y-m-d")."',
							next_order_date = '".$next_order_date."',
							order_id = '".$this->session->data['order_id']."',
							status = 'active',
							cc_name = '".$data['x_card_owner']."',
							cc_card_no = '".$data['x_card_num']."',
							cc_cv_no = '".$data['x_card_code']."',
							cc_expiry = '".$data['x_exp_date']."'");
		
		$recurring_id = $this->db->getLastId();
		
		$products = $this->cart->getProducts();
		
		$this->db->query("delete from recurring_product where recurring_id = " . $recurring_id);
		
		foreach($products as $product)
		{
			$this->db->query("insert into recurring_product set recurring_id = '".$recurring_id."', product_id = '".$product['product_id']."', quantity = '".$product['quantity']."'");
			if ($product['option'])
			{
				foreach($product['option'] as $option)
				{
					$this->db->query("delete from recurring_product_options where recurring_id = " . $recurring_id . " and product_option_value_id = " . $option['product_option_value_id']);
					$this->db->query("insert into recurring_product_options set recurring_id = '".$recurring_id."', product_option_value_id = '".$option['product_option_value_id']."'");
				}
			}
		}
		
		$this->db->query("insert order_recurring set order_id = " . $this->session->data['order_id'] . ", recurring_id = " . $recurring_id);
		
		
	}
}
?>