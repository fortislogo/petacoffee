<?php

class ControllerRecurringCreateOrder extends Controller
{
	public function index()
	{
		$result = $this->getActiveRecurring();
		if ($result)
		{
			foreach($result as $row)
			{			
				$next_order_date = date("Y-m-d", strtotime(sprintf("+%s week", $row['recurring'])));
				$order_info = $this->getOrder($row['order_id']);
				$order_products = $this->getOrderProducts($row['order_id']);
				
				$order_info['order_status_id'] = $this->config->get('config_order_status_id');
				
				$data = $order_info;
				
				foreach ($order_products as $order_product) 
				{
					if (isset($order_product['order_option'])) 
					{
						$order_option = $order_product['order_option'];					
					} 
					else 
					{
						$order_option = array();
					}

					if (isset($order_product['order_download']))
					{
						$order_download = $order_product['order_download'];					
					} 
					else 
					{
						$order_download = array();
					}
							
					$data['order_product'][] = array(
								'order_product_id' => $order_product['order_product_id'],
								'product_id'       => $order_product['product_id'],
								'name'             => $order_product['name'],
								'model'            => $order_product['model'],
								'option'           => $order_option,
								'download'         => $order_download,
								'quantity'         => $order_product['quantity'],
								'price'            => $order_product['price'],
								'total'            => $order_product['total'],
								'tax'              => $order_product['tax'],
								'reward'           => $order_product['reward']
					);
				}
				
				$data['order_total'] = $this->getOrderTotals($row['order_id']);
				
				$order_id = $this->addOrder($data);
				
				$this->db->query("update recurring set next_order_date = '".$next_order_date."' where recurring_id = " . $row['recurring_id']);
				$this->db->query("insert order_recurring set order_id = " . $order_id . ", recurring_id = " . $row['recurring_id']);
				
			}
		}
	}
	
	private function getActiveRecurring()
	{
		$sql = "SELECT r.*, concat(firstname, ' ', lastname) as customer, currency_code, currency_value FROM recurring r  JOIN `order` o ON o.order_id = r.order_id WHERE r.status = 'active' and r.next_order_date = '".date("Y-m-d")."'";			
		$query = $this->db->query($sql);
		return $query->rows;
	}
	
	public function getOrderProducts($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
		
		return $query->rows;
	}
	
	
	private function getOrderTotals($order_id) 
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");
		return $query->rows;
	}
	
	
	private function getOrder($order_id) 
	{
		$order_query = $this->db->query("SELECT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = o.customer_id) AS customer FROM `" . DB_PREFIX . "order` o WHERE o.order_id = '" . (int)$order_id . "'");
		
		if ($order_query->num_rows) 
		{
			$reward = 0;
			
			$order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
		
			foreach ($order_product_query->rows as $product) {
				$reward += $product['reward'];
			}			
			
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['payment_country_id'] . "'");

			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['payment_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}
			
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['shipping_country_id'] . "'");

			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['shipping_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}
		
			if ($order_query->row['affiliate_id']) {
				$affiliate_id = $order_query->row['affiliate_id'];
			} else {
				$affiliate_id = 0;
			}				
				
			$affiliate_info = $this->getAffiliate($affiliate_id);
				
			if ($affiliate_info) {
				$affiliate_firstname = $affiliate_info['firstname'];
				$affiliate_lastname = $affiliate_info['lastname'];
			} else {
				$affiliate_firstname = '';
				$affiliate_lastname = '';				
			}

			$this->load->model('localisation/language');
			
			$language_info = $this->model_localisation_language->getLanguage($order_query->row['language_id']);
			
			if ($language_info) {
				$language_code = $language_info['code'];
				$language_filename = $language_info['filename'];
				$language_directory = $language_info['directory'];
			} else {
				$language_code = '';
				$language_filename = '';
				$language_directory = '';
			}
			
			return array(
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				'customer'                => $order_query->row['customer'],
				'customer_group_id'       => $order_query->row['customer_group_id'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'email'                   => $order_query->row['email'],
				'payment_firstname'       => $order_query->row['payment_firstname'],
				'payment_lastname'        => $order_query->row['payment_lastname'],
				'payment_company'         => $order_query->row['payment_company'],
				'payment_company_id'      => $order_query->row['payment_company_id'],
				'payment_tax_id'          => $order_query->row['payment_tax_id'],
				'payment_address_1'       => $order_query->row['payment_address_1'],
				'payment_address_2'       => $order_query->row['payment_address_2'],
				'payment_postcode'        => $order_query->row['payment_postcode'],
				'payment_city'            => $order_query->row['payment_city'],
				'payment_zone_id'         => $order_query->row['payment_zone_id'],
				'payment_zone'            => $order_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $order_query->row['payment_country_id'],
				'payment_country'         => $order_query->row['payment_country'],
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $order_query->row['payment_address_format'],
				'payment_method'          => $order_query->row['payment_method'],
				'payment_code'            => $order_query->row['payment_code'],				
				'shipping_firstname'      => $order_query->row['shipping_firstname'],
				'shipping_lastname'       => $order_query->row['shipping_lastname'],
				'shipping_company'        => $order_query->row['shipping_company'],
				'shipping_address_1'      => $order_query->row['shipping_address_1'],
				'shipping_address_2'      => $order_query->row['shipping_address_2'],
				'shipping_postcode'       => $order_query->row['shipping_postcode'],
				'shipping_city'           => $order_query->row['shipping_city'],
				'shipping_zone_id'        => $order_query->row['shipping_zone_id'],
				'shipping_zone'           => $order_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $order_query->row['shipping_country_id'],
				'shipping_country'        => $order_query->row['shipping_country'],
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $order_query->row['shipping_address_format'],
				'shipping_method'         => $order_query->row['shipping_method'],
				'shipping_code'           => $order_query->row['shipping_code'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'reward'                  => $reward,
				'order_status_id'         => $order_query->row['order_status_id'],
				'affiliate_id'            => $order_query->row['affiliate_id'],
				'affiliate_firstname'     => $affiliate_firstname,
				'affiliate_lastname'      => $affiliate_lastname,
				'commission'              => $order_query->row['commission'],
				'language_id'             => $order_query->row['language_id'],
				'language_code'           => $language_code,
				'language_filename'       => $language_filename,
				'language_directory'      => $language_directory,				
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'ip'                      => $order_query->row['ip'],
				'forwarded_ip'            => $order_query->row['forwarded_ip'], 
				'user_agent'              => $order_query->row['user_agent'],	
				'accept_language'         => $order_query->row['accept_language'],					
				'date_added'              => $order_query->row['date_added'],
				'date_modified'           => $order_query->row['date_modified'],
				'gift_message'			  => $order_query->row['gift_message'],
				'gift'					  => $order_query->row['gift'] == 0 ? 'No' : 'Yes',
				'partial_cc'			  => $order_query->row['cc']
			);
		} else {
			return false;
		}
	}
	
	private function getAffiliate($affiliate_id) 
	{
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . (int)$affiliate_id . "'");
	
		return $query->row;
	}
	
	private function addOrder($data) 
	{
		$store_name = $this->config->get('config_name');
		$store_url = HTTP_SERVER;
		
		$invoice_prefix = $this->config->get('config_invoice_prefix');
		
		$this->load->model('localisation/country');
		
		$this->load->model('localisation/zone');
		
		$country_info = $this->model_localisation_country->getCountry($data['shipping_country_id']);
		
		if ($country_info) {
			$shipping_country = $country_info['name'];
			$shipping_address_format = $country_info['address_format'];
		} else {
			$shipping_country = '';	
			$shipping_address_format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
		}	
		
		$zone_info = $this->model_localisation_zone->getZone($data['shipping_zone_id']);
		
		if ($zone_info) {
			$shipping_zone = $zone_info['name'];
		} else {
			$shipping_zone = '';			
		}	
					
		$country_info = $this->model_localisation_country->getCountry($data['payment_country_id']);
		
		if ($country_info) {
			$payment_country = $country_info['name'];
			$payment_address_format = $country_info['address_format'];			
		} else {
			$payment_country = '';	
			$payment_address_format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';					
		}
	
		$zone_info = $this->model_localisation_zone->getZone($data['payment_zone_id']);
		
		if ($zone_info) {
			$payment_zone = $zone_info['name'];
		} else {
			$payment_zone = '';			
		}	

		$this->load->model('localisation/currency');

		$currency_info = $this->model_localisation_currency->getCurrencyByCode($this->config->get('config_currency'));
		
		if ($currency_info) {
			$currency_id = $currency_info['currency_id'];
			$currency_code = $currency_info['code'];
			$currency_value = $currency_info['value'];
		} else {
			$currency_id = 0;
			$currency_code = $this->config->get('config_currency');
			$currency_value = 1.00000;			
		}
      	
      	$this->db->query("INSERT INTO `" . DB_PREFIX . "order` 
						 SET invoice_prefix = '" . $this->db->escape($invoice_prefix) . "', 
						 	 store_id = '" . (int)$data['store_id'] . "', 
							 store_name = '" . $this->db->escape($store_name) . "',
							 store_url = '" . $this->db->escape($store_url) . "', 
							 customer_id = '" . (int)$data['customer_id'] . "', 
							 customer_group_id = '" . (int)$data['customer_group_id'] . "', 
							 firstname = '" . $this->db->escape($data['firstname']) . "', 
							 lastname = '" . $this->db->escape($data['lastname']) . "', 
							 email = '" . $this->db->escape($data['email']) . "', 
							 telephone = '" . $this->db->escape($data['telephone']) . "', 
							 fax = '" . $this->db->escape($data['fax']) . "', 
							 payment_firstname = '" . $this->db->escape($data['payment_firstname']) . "', 
							 payment_lastname = '" . $this->db->escape($data['payment_lastname']) . "', 
							 payment_company = '" . $this->db->escape($data['payment_company']) . "', 
							 payment_company_id = '" . $this->db->escape($data['payment_company_id']) . "', 
							 payment_tax_id = '" . $this->db->escape($data['payment_tax_id']) . "', 
							 payment_address_1 = '" . $this->db->escape($data['payment_address_1']) . "', 
							 payment_address_2 = '" . $this->db->escape($data['payment_address_2']) . "', 
							 payment_city = '" . $this->db->escape($data['payment_city']) . "', 
							 payment_postcode = '" . $this->db->escape($data['payment_postcode']) . "', 
							 payment_country = '" . $this->db->escape($payment_country) . "', 
							 payment_country_id = '" . (int)$data['payment_country_id'] . "', 
							 payment_zone = '" . $this->db->escape($payment_zone) . "', 
							 payment_zone_id = '" . (int)$data['payment_zone_id'] . "', 
							 payment_address_format = '" . $this->db->escape($payment_address_format) . "', 
							 payment_method = '" . $this->db->escape($data['payment_method']) . "', 
							 payment_code = '" . $this->db->escape($data['payment_code']) . "', 
							 shipping_firstname = '" . $this->db->escape($data['shipping_firstname']) . "', 
							 shipping_lastname = '" . $this->db->escape($data['shipping_lastname']) . "', 
							 shipping_company = '" . $this->db->escape($data['shipping_company']) . "', 
							 shipping_address_1 = '" . $this->db->escape($data['shipping_address_1']) . "', 
							 shipping_address_2 = '" . $this->db->escape($data['shipping_address_2']) . "', 
							 shipping_city = '" . $this->db->escape($data['shipping_city']) . "', 
							 shipping_postcode = '" . $this->db->escape($data['shipping_postcode']) . "', 
							 shipping_country = '" . $this->db->escape($shipping_country) . "', 
							 shipping_country_id = '" . (int)$data['shipping_country_id'] . "', 
							 shipping_zone = '" . $this->db->escape($shipping_zone) . "', 
							 shipping_zone_id = '" . (int)$data['shipping_zone_id'] . "', 
							 shipping_address_format = '" . $this->db->escape($shipping_address_format) . "', 
							 shipping_method = '" . $this->db->escape($data['shipping_method']) . "', 
							 shipping_code = '" . $this->db->escape($data['shipping_code']) . "', 
							 comment = '" . $this->db->escape($data['comment']) . "', 
							 order_status_id = '" . (int)$data['order_status_id'] . "', 
							 affiliate_id  = '" . (int)$data['affiliate_id'] . "', 
							 language_id = '" . (int)$this->config->get('config_language_id') . "', 
							 currency_id = '" . (int)$currency_id . "', 
							 currency_code = '" . $this->db->escape($currency_code) . "', 
							 currency_value = '" . (float)$currency_value . "', 
							 date_added = NOW(), 
							 date_modified = NOW()");
      	
      	$order_id = $this->db->getLastId();
		
      	if (isset($data['order_product'])) {		
      		foreach ($data['order_product'] as $order_product) {	
				$this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET order_id = '" . (int)$order_id . "', product_id = '" . (int)$order_product['product_id'] . "', name = '" . $this->db->escape($order_product['name']) . "', model = '" . $this->db->escape($order_product['model']) . "', quantity = '" . (int)$order_product['quantity'] . "', price = '" . (float)$order_product['price'] . "', total = '" . (float)$order_product['total'] . "', tax = '" . (float)$order_product['tax'] . "', reward = '" . (int)$order_product['reward'] . "'");
			
				$order_product_id = $this->db->getLastId();
				
				$this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = (quantity - " . (int)$order_product['quantity'] . ") WHERE product_id = '" . (int)$order_product['product_id'] . "' AND subtract = '1'");
				
				if (isset($order_product['order_option'])) {
					foreach ($order_product['order_option'] as $order_option) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '" . (int)$order_option['product_option_id'] . "', product_option_value_id = '" . (int)$order_option['product_option_value_id'] . "', name = '" . $this->db->escape($order_option['name']) . "', `value` = '" . $this->db->escape($order_option['value']) . "', `type` = '" . $this->db->escape($order_option['type']) . "'");
						
						$this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity - " . (int)$order_product['quantity'] . ") WHERE product_option_value_id = '" . (int)$order_option['product_option_value_id'] . "' AND subtract = '1'");
					}
				}
				
				if (isset($order_product['order_download'])) {
					foreach ($order_product['order_download'] as $order_download) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_download SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', name = '" . $this->db->escape($order_download['name']) . "', filename = '" . $this->db->escape($order_download['filename']) . "', mask = '" . $this->db->escape($order_download['mask']) . "', remaining = '" . (int)$order_download['remaining'] . "'");
					}
				}
			}
		}
		
		if (isset($data['order_voucher'])) {	
			foreach ($data['order_voucher'] as $order_voucher) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "order_voucher SET order_id = '" . (int)$order_id . "', voucher_id = '" . (int)$order_voucher['voucher_id'] . "', description = '" . $this->db->escape($order_voucher['description']) . "', code = '" . $this->db->escape($order_voucher['code']) . "', from_name = '" . $this->db->escape($order_voucher['from_name']) . "', from_email = '" . $this->db->escape($order_voucher['from_email']) . "', to_name = '" . $this->db->escape($order_voucher['to_name']) . "', to_email = '" . $this->db->escape($order_voucher['to_email']) . "', voucher_theme_id = '" . (int)$order_voucher['voucher_theme_id'] . "', message = '" . $this->db->escape($order_voucher['message']) . "', amount = '" . (float)$order_voucher['amount'] . "'");
			
      			$this->db->query("UPDATE " . DB_PREFIX . "voucher SET order_id = '" . (int)$order_id . "' WHERE voucher_id = '" . (int)$order_voucher['voucher_id'] . "'");
			}
		}

		// Get the total
		$total = 0;
		
		if (isset($data['order_total']) && $data['order_total']) 
		{		
      		foreach ($data['order_total'] as $order_total) 
			{	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = '" . $this->db->escape($order_total['code']) . "', title = '" . $this->db->escape($order_total['title']) . "', text = '" . $this->db->escape($order_total['text']) . "', `value` = '" . (float)$order_total['value'] . "', sort_order = '" . (int)$order_total['sort_order'] . "'");
			}
			
			$total += $order_total['value'];
		}

		// Affiliate
		$affiliate_id = 0;
		$commission = 0;
		
		if (!empty($this->request->post['affiliate_id'])) {
			$this->load->model('sale/affiliate');
			
			$affiliate_info = $this->model_sale_affiliate->getAffiliate($this->request->post['affiliate_id']);
			
			if ($affiliate_info) {
				$affiliate_id = $affiliate_info['affiliate_id']; 
				$commission = ($total / 100) * $affiliate_info['commission']; 
			}
		}
		
		// Update order total			 
		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET total = '" . (float)$total . "', affiliate_id = '" . (int)$affiliate_id . "', commission = '" . (float)$commission . "' WHERE order_id = '" . (int)$order_id . "'"); 	
		
		return $order_id;
	}
}

?>