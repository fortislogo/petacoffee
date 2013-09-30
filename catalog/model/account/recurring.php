<?php
class ModelAccountRecurring extends Model 
{
	public function getRecurringOrder($id) 
	{
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "recurring` o WHERE o.recurring_id = '" . (int)$id . "'");	
	
		return $query->row;
	}
	 
	public function getRecurringOrders($start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 1;
		}	
		
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "recurring` o WHERE o.customer_id = '" . (int)$this->customer->getId() . "' LIMIT " . (int)$start . "," . (int)$limit);	
	
		return $query->rows;
	}
	
	public function getRecurringOrderProducts($order_id) 
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_product WHERE recurring_id = '" . (int)$order_id . "'");	
		return $query->rows;
	}
	
	public function getOrderProductOptions($recurring_product_id) 
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_product_options WHERE recurring_product_id = '" . (int)$recurring_product_id . "'");
	
		return $query->rows;
	}
	
	public function getOrderVouchers($order_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_voucher` WHERE order_id = '" . (int)$order_id . "'");
		
		return $query->rows;
	}
	
	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");
	
		return $query->rows;
	}	

	public function getOrderHistories($order_id) {
		$query = $this->db->query("SELECT date_added, os.name AS status, oh.comment, oh.notify FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id . "' AND oh.notify = '1' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY oh.date_added");
	
		return $query->rows;
	}	

	public function getOrderDownloads($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_download WHERE order_id = '" . (int)$order_id . "' ORDER BY name");
	
		return $query->rows; 
	}	

	public function getTotalOrders() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE customer_id = '" . (int)$this->customer->getId() . "' AND order_status_id > '0'");
		
		return $query->row['total'];
	}
		
	public function getTotalOrderProductsByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
		
		return $query->row['total'];
	}
	
	public function getTotalOrderVouchersByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order_voucher` WHERE order_id = '" . (int)$order_id . "'");
		
		return $query->row['total'];
	}	
	
	public function cancel($id)
	{
		/*define('AUTHNET_LOGIN', $this->config->get('authorizenet_aim_login'));
   	 	define('AUTHNET_TRANSKEY', $this->config->get('authorizenet_aim_key'));
		
		require(DIR_APPLICATION .'controller/payment/AuthNetXML/AuthnetXML.class.php');
		
		$data = $this->getRecurringOrder($id);
		
		$xml = new AuthnetXML(AUTHNET_LOGIN, AUTHNET_TRANSKEY, AuthnetXML::USE_DEVELOPMENT_SERVER);
		
    	$xml->ARBCancelSubscriptionRequest(array(
        	'refId' => $data['name'],
        	'subscriptionId' => $id
    	));
		
		//echo $xml->response();
		
		*/
		
		
		$this->db->query("update recurring set status = 'cancel' where recurring_id = " . $id);
		
	}
	
	public function restart($id)
	{
		$info = $this->getRecurringOrder($id);
		
		$next = $info['next_order_date'];
		$today = date("Y-m-d");
		
		if ($next <= $today)
		{
			$next = date("Y-m-d", strtotime(sprintf("+%s week", $info['recurring'])));
		}
		
		$this->db->query("update recurring set status = 'active', next_order_date = '".$next."' where recurring_id = " . $id);
		
	}
	
	
	public function update($data, $id)
	{
		//print_r($data); die();
		$this->db->query("delete from recurring_product where recurring_id = '".$id."'");
		$this->db->query("delete from recurring_option where recurring_id = '".$id."'");
		
		if ($data['order_product'])
		{
			foreach($data['order_product'] as $order_product)
			{
				$this->db->query("insert into recurring_product set recurring_id = '".$id."', product_id = '".$order_product['product_id']."', name = '".$order_product['name']."', model = '".$order_product['model']."', quantity = '".$order_product['quantity']."', price = '".$order_product['price']."', total = '".((int)$order_product['quantity'] * (float)$order_product['price'])."', tax = '".$order_product['tax']."', reward = '".$order_product['reward']."'");
				
				$recurring_product_id = $this->db->getLastId();
				
				if ($order_product['order_option'])
				{
					foreach($order_product['order_option'] as $option)
					{
						$this->db->query("insert into recurring_option set recurring_id = '".$id."', recurring_product_id = '".$recurring_product_id."', product_option_id = '".$option['product_option_id']."', product_option_value_id = '".$option['product_option_value_id']."', name = '".$option['name']."',`value` = '".$option['value']."', `type` = '".$option['type']."'");
					}
				}
				
			}
		}
		
		if ($data['payment_use_address'] == 'new-address')
		{
			$this->db->query("insert into address set customer_id = '".$this->customer->getId()."', firstname = '".$data['payment_firstname']."', lastname = '".$data['payment_lastname']."', company = '".$data['payment_company']."', company_id = '', tax_id = '', address_1 = '".$data['payment_address_1']."', address_2 = '".$data['payment_address_2']."', city = '".$data['payment_city']."', postcode = '".$data['payment_postcode']."', country_id = '".$data['payment_country_id']."', zone_id = '".$data['payment_zone_id']."'");
			
			$payment_address_id = $this->db->getLastId();
		}
		else
		{
			$payment_address_id = $data['payment_address_id'];
		}
		
		if ($data['shipping_use_address'] == 'new-address')
		{
			$this->db->query("insert into address set customer_id = '".$this->customer->getId()."', firstname = '".$data['shipping_firstname']."', lastname = '".$data['shipping_lastname']."', company = '".$data['shipping_company']."', company_id = '', tax_id = '', address_1 = '".$data['shipping_address_1']."', address_2 = '".$data['shipping_address_2']."', city = '".$data['shipping_city']."', postcode = '".$data['shipping_postcode']."', country_id = '".$data['shipping_country_id']."', zone_id = '".$data['shipping_zone_id']."'");
			
			$shipping_address_id = $this->db->getLastId();
		}
		else
		{
			$shipping_address_id = $data['payment_address_id'];
		}
		
		$this->load->model('account/address');
		
		$payment_address = $this->model_account_address->getAddress($payment_address_id);
		$shipping_address = $this->model_account_address->getAddress($shipping_address_id);
		
		$this->db->query("update recurring set recurring = '".$data['recurring']."', next_order_date = '".$data['next_order_date']."', status = '".$data['status']."', payment_address_id = '".$data['payment_address_id']."', shipping_address_id = '".$data['shipping_address_id']."', comment = '".$data['comment']."', payment_firstname = '".$data['payment_firstname']."', payment_lastname = '".$data['payment_lastanme']."', payment_company = '".$data['payment_company']."',  payment_address_1 = '".$data['payment_address_1']."', payment_address_2 = '".$data['payment_address_2']."', payment_city = '".$data['payment_city']."', payment_postcode = '".$data['payment_postcode']."', payment_country_id = '".$data['payment_country_id']."', payment_zone_id = '".$data['payment_zone_id']."', shipping_firstname = '".$data['shipping_firstname']."', shipping_lastname = '".$data['shipping_lastname']."', shipping_company = '".$data['shipping_company']."',  shipping_address_1 = '".$data['shipping_address_1']."', shipping_address_2 = '".$data['shipping_address_2']."', shipping_city = '".$data['shipping_city']."', shipping_postcode = '".$data['shipping_postcode']."', shipping_country_id = '".$data['shipping_country_id']."', shipping_zone_id = '".$data['shipping_zone_id']."', payment_address_id = '".$payment_address_id."', shipping_address_id = '".$shipping_address_id."', shipping_code = '".$data['shipping_method']."', payment_code = '".$data['payment_method']."' where recurring_id = '".$id."'");
	}
	
	
	public function addProduct($data, $id)
	{
		//$this->db->query("insert into ".DB_PREFIX."recurring_product set product_id = '".$data['product_id']."', quantity = '".$data['quantity']."', recurring_id = '".$id."'");
		
		$option_price = 0;
		$option_points = 0;
		$option_weight = 0;
		$option_data = array();
		
		$this->load->model('catalog/product');
		
		$product_info = $this->model_catalog_product->getProduct($data['product_id']);
				
		if ($product_info) 
		{
			if (isset($data['option'])) {
				$options = array_filter($data['option']);
			} else {
				$options = array();	
			}
					
			$product_options = $this->model_catalog_product->getProductOptions($data['product_id']);
					
			foreach ($product_options as $product_option) 
			{
				if ($product_option['required'] && empty($options[$product_option['product_option_id']])) 
				{
					$json['error']['product']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}	
			
			$product_id = $data['product_id'];		
								
			if (!isset($json['error']['product']['option'])) 
			{
				//$this->cart->add($this->request->post['product_id'], $quantity, $option);
				foreach ($options as $product_option_id => $option_value) 
				{
					$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
						
					if ($option_query->num_rows) 
					{
						if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio' || $option_query->row['type'] == 'image') {
							$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$option_value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
								
							if ($option_value_query->num_rows) {
								if ($option_value_query->row['price_prefix'] == '+') {
									$option_price += $option_value_query->row['price'];
								} elseif ($option_value_query->row['price_prefix'] == '-') {
									$option_price -= $option_value_query->row['price'];
								}
	
								if ($option_value_query->row['points_prefix'] == '+') {
									$option_points += $option_value_query->row['points'];
								} elseif ($option_value_query->row['points_prefix'] == '-') {
									$option_points -= $option_value_query->row['points'];
								}
																
								if ($option_value_query->row['weight_prefix'] == '+') {
									$option_weight += $option_value_query->row['weight'];
								} elseif ($option_value_query->row['weight_prefix'] == '-') {
									$option_weight -= $option_value_query->row['weight'];
								}
									
								if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $data['quantity']))) {
										$stock = false;
								}
									
								$option_data[] = array(
									'product_option_id'       => $product_option_id,
									'product_option_value_id' => $option_value,
									'option_id'               => $option_query->row['option_id'],
									'option_value_id'         => $option_value_query->row['option_value_id'],
									'name'                    => $option_query->row['name'],
									'option_value'            => $option_value_query->row['name'],
									'type'                    => $option_query->row['type'],
									'quantity'                => $option_value_query->row['quantity'],
									'subtract'                => $option_value_query->row['subtract'],
									'price'                   => $option_value_query->row['price'],
									'price_prefix'            => $option_value_query->row['price_prefix'],
									'points'                  => $option_value_query->row['points'],
									'points_prefix'           => $option_value_query->row['points_prefix'],									
									'weight'                  => $option_value_query->row['weight'],
									'weight_prefix'           => $option_value_query->row['weight_prefix']
								);								
							}
						} elseif ($option_query->row['type'] == 'checkbox' && is_array($option_value)) {
							foreach ($option_value as $product_option_value_id) {
								$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
									
								if ($option_value_query->num_rows) {
									if ($option_value_query->row['price_prefix'] == '+') {
										$option_price += $option_value_query->row['price'];
									} elseif ($option_value_query->row['price_prefix'] == '-') {
										$option_price -= $option_value_query->row['price'];
									}
	
									if ($option_value_query->row['points_prefix'] == '+') {
										$option_points += $option_value_query->row['points'];
									} elseif ($option_value_query->row['points_prefix'] == '-') {
										$option_points -= $option_value_query->row['points'];
									}
																	
									if ($option_value_query->row['weight_prefix'] == '+') {
										$option_weight += $option_value_query->row['weight'];
									} elseif ($option_value_query->row['weight_prefix'] == '-') {
										$option_weight -= $option_value_query->row['weight'];
									}
										
									if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $data['quantity']))) {
										$stock = false;
									}
										
									$option_data[] = array(
										'product_option_id'       => $product_option_id,
										'product_option_value_id' => $product_option_value_id,
										'option_id'               => $option_query->row['option_id'],
										'option_value_id'         => $option_value_query->row['option_value_id'],
										'name'                    => $option_query->row['name'],
										'option_value'            => $option_value_query->row['name'],
										'type'                    => $option_query->row['type'],
										'quantity'                => $option_value_query->row['quantity'],
										'subtract'                => $option_value_query->row['subtract'],
										'price'                   => $option_value_query->row['price'],
										'price_prefix'            => $option_value_query->row['price_prefix'],
										'points'                  => $option_value_query->row['points'],
										'points_prefix'           => $option_value_query->row['points_prefix'],
										'weight'                  => $option_value_query->row['weight'],
										'weight_prefix'           => $option_value_query->row['weight_prefix']
									);								
								}
							}						
						} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
							$option_data[] = array(
								'product_option_id'       => $product_option_id,
								'product_option_value_id' => '',
								'option_id'               => $option_query->row['option_id'],
								'option_value_id'         => '',
								'name'                    => $option_query->row['name'],
								'option_value'            => $option_value,
								'type'                    => $option_query->row['type'],
								'quantity'                => '',
								'subtract'                => '',
								'price'                   => '',
								'price_prefix'            => '',
								'points'                  => '',
								'points_prefix'           => '',								
								'weight'                  => '',
								'weight_prefix'           => ''
							);						
						}
					}
				}
			
			
				$this->db->query("insert into ".DB_PREFIX."recurring_product set product_id = '".$data['product_id']."', quantity = '".$data['quantity']."', recurring_id = '".$id."'");
				
				//print_r($option_data);
				
				$recurring_product_id = $this->db->getLastId();
				
				if ($option_data)
				{
					foreach($option_data as $option)
					{
						$this->db->query("insert into recurring_product_options set recurring_product_id = '".$recurring_product_id."', recurring_id = '".$id."', product_id = '".$product_id."', product_option_id = '".$option['product_option_id']."', product_option_value_id = '".$option['product_option_value_id']."', name = '".$option['name']."', value ='".$option['option_value']."', type = '".$option['type']."'");
					}
				}
			
			}
		}
		
	}
	
	public function getRecurringProducts($recurring_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_product WHERE recurring_id = '" . (int)$recurring_id . "'");
	
		return $query->rows;
	}
	
	public function getRecurringOptions($recurring_id, $recurring_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_option WHERE recurring_id = '" . (int)$recurring_id . "' AND recurring_product_id = '" . (int)$recurring_product_id . "'");
	
		return $query->rows;
	}
	
}
?>