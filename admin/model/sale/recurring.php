<?php
class ModelSaleRecurring extends Model {
	public function addrecurring($data) {
		$this->load->model('setting/store');
		
		$store_info = $this->model_setting_store->getStore($data['store_id']);
		
		if ($store_info) {
			$store_name = $store_info['name'];
			$store_url = $store_info['url'];
		} else {
			$store_name = $this->config->get('config_name');
			$store_url = HTTP_CATALOG;
		}
		
		$this->load->model('setting/setting');
		
		$setting_info = $this->model_setting_setting->getSetting('setting', $data['store_id']);
			
		if (isset($setting_info['invoice_prefix'])) {
			$invoice_prefix = $setting_info['invoice_prefix'];
		} else {
			$invoice_prefix = $this->config->get('config_invoice_prefix');
		}
		
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
      	
      	$this->db->query("INSERT INTO `" . DB_PREFIX . "recurring` SET invoice_prefix = '" . $this->db->escape($invoice_prefix) . "', store_id = '" . (int)$data['store_id'] . "', store_name = '" . $this->db->escape($store_name) . "',store_url = '" . $this->db->escape($store_url) . "', customer_id = '" . (int)$data['customer_id'] . "', customer_group_id = '" . (int)$data['customer_group_id'] . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', payment_firstname = '" . $this->db->escape($data['payment_firstname']) . "', payment_lastname = '" . $this->db->escape($data['payment_lastname']) . "', payment_company = '" . $this->db->escape($data['payment_company']) . "', payment_company_id = '" . $this->db->escape($data['payment_company_id']) . "', payment_tax_id = '" . $this->db->escape($data['payment_tax_id']) . "', payment_address_1 = '" . $this->db->escape($data['payment_address_1']) . "', payment_address_2 = '" . $this->db->escape($data['payment_address_2']) . "', payment_city = '" . $this->db->escape($data['payment_city']) . "', payment_postcode = '" . $this->db->escape($data['payment_postcode']) . "', payment_country = '" . $this->db->escape($payment_country) . "', payment_country_id = '" . (int)$data['payment_country_id'] . "', payment_zone = '" . $this->db->escape($payment_zone) . "', payment_zone_id = '" . (int)$data['payment_zone_id'] . "', payment_address_format = '" . $this->db->escape($payment_address_format) . "', payment_method = '" . $this->db->escape($data['payment_method']) . "', payment_code = '" . $this->db->escape($data['payment_code']) . "', shipping_firstname = '" . $this->db->escape($data['shipping_firstname']) . "', shipping_lastname = '" . $this->db->escape($data['shipping_lastname']) . "', shipping_company = '" . $this->db->escape($data['shipping_company']) . "', shipping_address_1 = '" . $this->db->escape($data['shipping_address_1']) . "', shipping_address_2 = '" . $this->db->escape($data['shipping_address_2']) . "', shipping_city = '" . $this->db->escape($data['shipping_city']) . "', shipping_postcode = '" . $this->db->escape($data['shipping_postcode']) . "', shipping_country = '" . $this->db->escape($shipping_country) . "', shipping_country_id = '" . (int)$data['shipping_country_id'] . "', shipping_zone = '" . $this->db->escape($shipping_zone) . "', shipping_zone_id = '" . (int)$data['shipping_zone_id'] . "', shipping_address_format = '" . $this->db->escape($shipping_address_format) . "', shipping_method = '" . $this->db->escape($data['shipping_method']) . "', shipping_code = '" . $this->db->escape($data['shipping_code']) . "', comment = '" . $this->db->escape($data['comment']) . "', recurring_status_id = '" . (int)$data['recurring_status_id'] . "', affiliate_id  = '" . (int)$data['affiliate_id'] . "', language_id = '" . (int)$this->config->get('config_language_id') . "', currency_id = '" . (int)$currency_id . "', currency_code = '" . $this->db->escape($currency_code) . "', currency_value = '" . (float)$currency_value . "', date_added = NOW(), date_modified = NOW()");
      	
      	$recurring_id = $this->db->getLastId();
		
      	if (isset($data['recurring_product'])) {		
      		foreach ($data['recurring_product'] as $recurring_product) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_product SET recurring_id = '" . (int)$recurring_id . "', product_id = '" . (int)$recurring_product['product_id'] . "', name = '" . $this->db->escape($recurring_product['name']) . "', model = '" . $this->db->escape($recurring_product['model']) . "', quantity = '" . (int)$recurring_product['quantity'] . "', price = '" . (float)$recurring_product['price'] . "', total = '" . (float)$recurring_product['total'] . "', tax = '" . (float)$recurring_product['tax'] . "', reward = '" . (int)$recurring_product['reward'] . "'");
			
				$recurring_product_id = $this->db->getLastId();
				
				$this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = (quantity - " . (int)$recurring_product['quantity'] . ") WHERE product_id = '" . (int)$recurring_product['product_id'] . "' AND subtract = '1'");
				
				if (isset($recurring_product['recurring_option'])) {
					foreach ($recurring_product['recurring_option'] as $recurring_option) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_option SET recurring_id = '" . (int)$recurring_id . "', recurring_product_id = '" . (int)$recurring_product_id . "', product_option_id = '" . (int)$recurring_option['product_option_id'] . "', product_option_value_id = '" . (int)$recurring_option['product_option_value_id'] . "', name = '" . $this->db->escape($recurring_option['name']) . "', `value` = '" . $this->db->escape($recurring_option['value']) . "', `type` = '" . $this->db->escape($recurring_option['type']) . "'");
						
						$this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity - " . (int)$recurring_product['quantity'] . ") WHERE product_option_value_id = '" . (int)$recurring_option['product_option_value_id'] . "' AND subtract = '1'");
					}
				}
				
				if (isset($recurring_product['recurring_download'])) {
					foreach ($recurring_product['recurring_download'] as $recurring_download) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_download SET recurring_id = '" . (int)$recurring_id . "', recurring_product_id = '" . (int)$recurring_product_id . "', name = '" . $this->db->escape($recurring_download['name']) . "', filename = '" . $this->db->escape($recurring_download['filename']) . "', mask = '" . $this->db->escape($recurring_download['mask']) . "', remaining = '" . (int)$recurring_download['remaining'] . "'");
					}
				}
			}
		}
		
		if (isset($data['recurring_voucher'])) {	
			foreach ($data['recurring_voucher'] as $recurring_voucher) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_voucher SET recurring_id = '" . (int)$recurring_id . "', voucher_id = '" . (int)$recurring_voucher['voucher_id'] . "', description = '" . $this->db->escape($recurring_voucher['description']) . "', code = '" . $this->db->escape($recurring_voucher['code']) . "', from_name = '" . $this->db->escape($recurring_voucher['from_name']) . "', from_email = '" . $this->db->escape($recurring_voucher['from_email']) . "', to_name = '" . $this->db->escape($recurring_voucher['to_name']) . "', to_email = '" . $this->db->escape($recurring_voucher['to_email']) . "', voucher_theme_id = '" . (int)$recurring_voucher['voucher_theme_id'] . "', message = '" . $this->db->escape($recurring_voucher['message']) . "', amount = '" . (float)$recurring_voucher['amount'] . "'");
			
      			$this->db->query("UPDATE " . DB_PREFIX . "voucher SET recurring_id = '" . (int)$recurring_id . "' WHERE voucher_id = '" . (int)$recurring_voucher['voucher_id'] . "'");
			}
		}

		// Get the total
		$total = 0;
		
		if (isset($data['recurring_total'])) {		
      		foreach ($data['recurring_total'] as $recurring_total) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_total SET recurring_id = '" . (int)$recurring_id . "', code = '" . $this->db->escape($recurring_total['code']) . "', title = '" . $this->db->escape($recurring_total['title']) . "', text = '" . $this->db->escape($recurring_total['text']) . "', `value` = '" . (float)$recurring_total['value'] . "', sort_recurring = '" . (int)$recurring_total['sort_recurring'] . "'");
			}
			
			$total += $recurring_total['value'];
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
		
		// Update recurring total			 
		$this->db->query("UPDATE `" . DB_PREFIX . "recurring` SET total = '" . (float)$total . "', affiliate_id = '" . (int)$affiliate_id . "', commission = '" . (float)$commission . "' WHERE recurring_id = '" . (int)$recurring_id . "'"); 	
	}
	
	public function editrecurring($recurring_id, $data) {
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

		// Restock products before subtracting the stock later on
		$recurring_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "recurring` WHERE recurring_status_id > '0' AND recurring_id = '" . (int)$recurring_id . "'");

		if ($recurring_query->num_rows) {
			$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_product WHERE recurring_id = '" . (int)$recurring_id . "'");

			foreach($product_query->rows as $product) {
				$this->db->query("UPDATE `" . DB_PREFIX . "product` SET quantity = (quantity + " . (int)$product['quantity'] . ") WHERE product_id = '" . (int)$product['product_id'] . "' AND subtract = '1'");

				$option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_option WHERE recurring_id = '" . (int)$recurring_id . "' AND recurring_product_id = '" . (int)$product['recurring_product_id'] . "'");

				foreach ($option_query->rows as $option) {
					$this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity + " . (int)$product['quantity'] . ") WHERE product_option_value_id = '" . (int)$option['product_option_value_id'] . "' AND subtract = '1'");
				}
			}
		}

      	$this->db->query("UPDATE `" . DB_PREFIX . "recurring` SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', payment_firstname = '" . $this->db->escape($data['payment_firstname']) . "', payment_lastname = '" . $this->db->escape($data['payment_lastname']) . "', payment_company = '" . $this->db->escape($data['payment_company']) . "', payment_company_id = '" . $this->db->escape($data['payment_company_id']) . "', payment_tax_id = '" . $this->db->escape($data['payment_tax_id']) . "', payment_address_1 = '" . $this->db->escape($data['payment_address_1']) . "', payment_address_2 = '" . $this->db->escape($data['payment_address_2']) . "', payment_city = '" . $this->db->escape($data['payment_city']) . "', payment_postcode = '" . $this->db->escape($data['payment_postcode']) . "', payment_country = '" . $this->db->escape($payment_country) . "', payment_country_id = '" . (int)$data['payment_country_id'] . "', payment_zone = '" . $this->db->escape($payment_zone) . "', payment_zone_id = '" . (int)$data['payment_zone_id'] . "', payment_address_format = '" . $this->db->escape($payment_address_format) . "', payment_method = '" . $this->db->escape($data['payment_method']) . "', payment_code = '" . $this->db->escape($data['payment_code']) . "', shipping_firstname = '" . $this->db->escape($data['shipping_firstname']) . "', shipping_lastname = '" . $this->db->escape($data['shipping_lastname']) . "',  shipping_company = '" . $this->db->escape($data['shipping_company']) . "', shipping_address_1 = '" . $this->db->escape($data['shipping_address_1']) . "', shipping_address_2 = '" . $this->db->escape($data['shipping_address_2']) . "', shipping_city = '" . $this->db->escape($data['shipping_city']) . "', shipping_postcode = '" . $this->db->escape($data['shipping_postcode']) . "', shipping_country = '" . $this->db->escape($shipping_country) . "', shipping_country_id = '" . (int)$data['shipping_country_id'] . "', shipping_zone = '" . $this->db->escape($shipping_zone) . "', shipping_zone_id = '" . (int)$data['shipping_zone_id'] . "', shipping_address_format = '" . $this->db->escape($shipping_address_format) . "', shipping_method = '" . $this->db->escape($data['shipping_method']) . "', shipping_code = '" . $this->db->escape($data['shipping_code']) . "', comment = '" . $this->db->escape($data['comment']) . "', recurring_status_id = '" . (int)$data['recurring_status_id'] . "', affiliate_id  = '" . (int)$data['affiliate_id'] . "', date_modified = NOW() WHERE recurring_id = '" . (int)$recurring_id . "'");
				
		$this->db->query("DELETE FROM " . DB_PREFIX . "recurring_product WHERE recurring_id = '" . (int)$recurring_id . "'"); 
       	$this->db->query("DELETE FROM " . DB_PREFIX . "recurring_option WHERE recurring_id = '" . (int)$recurring_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recurring_download WHERE recurring_id = '" . (int)$recurring_id . "'");
		
      	if (isset($data['recurring_product'])) {		
      		foreach ($data['recurring_product'] as $recurring_product) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_product SET recurring_product_id = '" . (int)$recurring_product['recurring_product_id'] . "', recurring_id = '" . (int)$recurring_id . "', product_id = '" . (int)$recurring_product['product_id'] . "', name = '" . $this->db->escape($recurring_product['name']) . "', model = '" . $this->db->escape($recurring_product['model']) . "', quantity = '" . (int)$recurring_product['quantity'] . "', price = '" . (float)$recurring_product['price'] . "', total = '" . (float)$recurring_product['total'] . "', tax = '" . (float)$recurring_product['tax'] . "', reward = '" . (int)$recurring_product['reward'] . "'");
			
				$recurring_product_id = $this->db->getLastId();

				$this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = (quantity - " . (int)$recurring_product['quantity'] . ") WHERE product_id = '" . (int)$recurring_product['product_id'] . "' AND subtract = '1'");
	
				if (isset($recurring_product['recurring_option'])) {
					foreach ($recurring_product['recurring_option'] as $recurring_option) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_option SET recurring_option_id = '" . (int)$recurring_option['recurring_option_id'] . "', recurring_id = '" . (int)$recurring_id . "', recurring_product_id = '" . (int)$recurring_product_id . "', product_option_id = '" . (int)$recurring_option['product_option_id'] . "', product_option_value_id = '" . (int)$recurring_option['product_option_value_id'] . "', name = '" . $this->db->escape($recurring_option['name']) . "', `value` = '" . $this->db->escape($recurring_option['value']) . "', `type` = '" . $this->db->escape($recurring_option['type']) . "'");
						
						
						$this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity - " . (int)$recurring_product['quantity'] . ") WHERE product_option_value_id = '" . (int)$recurring_option['product_option_value_id'] . "' AND subtract = '1'");
					}
				}
				
				if (isset($recurring_product['recurring_download'])) {
					foreach ($recurring_product['recurring_download'] as $recurring_download) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_download SET recurring_download_id = '" . (int)$recurring_download['recurring_download_id'] . "', recurring_id = '" . (int)$recurring_id . "', recurring_product_id = '" . (int)$recurring_product_id . "', name = '" . $this->db->escape($recurring_download['name']) . "', filename = '" . $this->db->escape($recurring_download['filename']) . "', mask = '" . $this->db->escape($recurring_download['mask']) . "', remaining = '" . (int)$recurring_download['remaining'] . "'");
					}
				}
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "recurring_voucher WHERE recurring_id = '" . (int)$recurring_id . "'"); 
		
		if (isset($data['recurring_voucher'])) {	
			foreach ($data['recurring_voucher'] as $recurring_voucher) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_voucher SET recurring_voucher_id = '" . (int)$recurring_voucher['recurring_voucher_id'] . "', recurring_id = '" . (int)$recurring_id . "', voucher_id = '" . (int)$recurring_voucher['voucher_id'] . "', description = '" . $this->db->escape($recurring_voucher['description']) . "', code = '" . $this->db->escape($recurring_voucher['code']) . "', from_name = '" . $this->db->escape($recurring_voucher['from_name']) . "', from_email = '" . $this->db->escape($recurring_voucher['from_email']) . "', to_name = '" . $this->db->escape($recurring_voucher['to_name']) . "', to_email = '" . $this->db->escape($recurring_voucher['to_email']) . "', voucher_theme_id = '" . (int)$recurring_voucher['voucher_theme_id'] . "', message = '" . $this->db->escape($recurring_voucher['message']) . "', amount = '" . (float)$recurring_voucher['amount'] . "'");
			
				$this->db->query("UPDATE " . DB_PREFIX . "voucher SET recurring_id = '" . (int)$recurring_id . "' WHERE voucher_id = '" . (int)$recurring_voucher['voucher_id'] . "'");
			}
		}
		
		// Get the total
		$total = 0;
				
		$this->db->query("DELETE FROM " . DB_PREFIX . "recurring_total WHERE recurring_id = '" . (int)$recurring_id . "'");
		
		if (isset($data['recurring_total'])) {		
      		foreach ($data['recurring_total'] as $recurring_total) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_total SET recurring_total_id = '" . (int)$recurring_total['recurring_total_id'] . "', recurring_id = '" . (int)$recurring_id . "', code = '" . $this->db->escape($recurring_total['code']) . "', title = '" . $this->db->escape($recurring_total['title']) . "', text = '" . $this->db->escape($recurring_total['text']) . "', `value` = '" . (float)$recurring_total['value'] . "', sort_recurring = '" . (int)$recurring_total['sort_recurring'] . "'");
			}
			
			$total += $recurring_total['value'];
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
				 
		$this->db->query("UPDATE `" . DB_PREFIX . "recurring` SET total = '" . (float)$total . "', affiliate_id = '" . (int)$affiliate_id . "', commission = '" . (float)$commission . "' WHERE recurring_id = '" . (int)$recurring_id . "'"); 
	}
	
	public function deleterecurring($recurring_id) 
	{
		$recurring_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "recurring` WHERE recurring_id = '" . (int)$recurring_id . "'");

		if ($recurring_query->num_rows) 
		{
			$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_product WHERE recurring_id = '" . (int)$recurring_id . "'");
			
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "recurring` WHERE recurring_id = '" . (int)$recurring_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recurring_product WHERE recurring_id = '" . (int)$recurring_id . "'");
      	
	}

	public function getrecurring($recurring_id) {
		$recurring_query = $this->db->query("SELECT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = o.customer_id) AS customer FROM `" . DB_PREFIX . "recurring` o WHERE o.recurring_id = '" . (int)$recurring_id . "'");

		if ($recurring_query->num_rows) {
			$reward = 0;
			
			$recurring_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_product WHERE recurring_id = '" . (int)$recurring_id . "'");
		
			foreach ($recurring_product_query->rows as $product) {
				$reward += $product['reward'];
			}			
			
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$recurring_query->row['payment_country_id'] . "'");

			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$recurring_query->row['payment_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}
			
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$recurring_query->row['shipping_country_id'] . "'");

			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$recurring_query->row['shipping_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}
		
			if ($recurring_query->row['affiliate_id']) {
				$affiliate_id = $recurring_query->row['affiliate_id'];
			} else {
				$affiliate_id = 0;
			}				
				
			$this->load->model('sale/affiliate');
				
			$affiliate_info = $this->model_sale_affiliate->getAffiliate($affiliate_id);
				
			if ($affiliate_info) {
				$affiliate_firstname = $affiliate_info['firstname'];
				$affiliate_lastname = $affiliate_info['lastname'];
			} else {
				$affiliate_firstname = '';
				$affiliate_lastname = '';				
			}

			$this->load->model('localisation/language');
			
			$language_info = $this->model_localisation_language->getLanguage($recurring_query->row['language_id']);
			
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
				'recurring_id'                => $recurring_query->row['recurring_id'],
				'invoice_no'              => $recurring_query->row['invoice_no'],
				'invoice_prefix'          => $recurring_query->row['invoice_prefix'],
				'store_id'                => $recurring_query->row['store_id'],
				'store_name'              => $recurring_query->row['store_name'],
				'store_url'               => $recurring_query->row['store_url'],
				'customer_id'             => $recurring_query->row['customer_id'],
				'customer'                => $recurring_query->row['customer'],
				'customer_group_id'       => $recurring_query->row['customer_group_id'],
				'firstname'               => $recurring_query->row['firstname'],
				'lastname'                => $recurring_query->row['lastname'],
				'telephone'               => $recurring_query->row['telephone'],
				'fax'                     => $recurring_query->row['fax'],
				'email'                   => $recurring_query->row['email'],
				'payment_firstname'       => $recurring_query->row['payment_firstname'],
				'payment_lastname'        => $recurring_query->row['payment_lastname'],
				'payment_company'         => $recurring_query->row['payment_company'],
				'payment_company_id'      => $recurring_query->row['payment_company_id'],
				'payment_tax_id'          => $recurring_query->row['payment_tax_id'],
				'payment_address_1'       => $recurring_query->row['payment_address_1'],
				'payment_address_2'       => $recurring_query->row['payment_address_2'],
				'payment_postcode'        => $recurring_query->row['payment_postcode'],
				'payment_city'            => $recurring_query->row['payment_city'],
				'payment_zone_id'         => $recurring_query->row['payment_zone_id'],
				'payment_zone'            => $recurring_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $recurring_query->row['payment_country_id'],
				'payment_country'         => $recurring_query->row['payment_country'],
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $recurring_query->row['payment_address_format'],
				'payment_method'          => $recurring_query->row['payment_method'],
				'payment_code'            => $recurring_query->row['payment_code'],				
				'shipping_firstname'      => $recurring_query->row['shipping_firstname'],
				'shipping_lastname'       => $recurring_query->row['shipping_lastname'],
				'shipping_company'        => $recurring_query->row['shipping_company'],
				'shipping_address_1'      => $recurring_query->row['shipping_address_1'],
				'shipping_address_2'      => $recurring_query->row['shipping_address_2'],
				'shipping_postcode'       => $recurring_query->row['shipping_postcode'],
				'shipping_city'           => $recurring_query->row['shipping_city'],
				'shipping_zone_id'        => $recurring_query->row['shipping_zone_id'],
				'shipping_zone'           => $recurring_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $recurring_query->row['shipping_country_id'],
				'shipping_country'        => $recurring_query->row['shipping_country'],
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $recurring_query->row['shipping_address_format'],
				'shipping_method'         => $recurring_query->row['shipping_method'],
				'shipping_code'           => $recurring_query->row['shipping_code'],
				'comment'                 => $recurring_query->row['comment'],
				'total'                   => $recurring_query->row['total'],
				'reward'                  => $reward,
				'recurring_status_id'         => $recurring_query->row['recurring_status_id'],
				'affiliate_id'            => $recurring_query->row['affiliate_id'],
				'affiliate_firstname'     => $affiliate_firstname,
				'affiliate_lastname'      => $affiliate_lastname,
				'commission'              => $recurring_query->row['commission'],
				'language_id'             => $recurring_query->row['language_id'],
				'language_code'           => $language_code,
				'language_filename'       => $language_filename,
				'language_directory'      => $language_directory,				
				'currency_id'             => $recurring_query->row['currency_id'],
				'currency_code'           => $recurring_query->row['currency_code'],
				'currency_value'          => $recurring_query->row['currency_value'],
				'ip'                      => $recurring_query->row['ip'],
				'forwarded_ip'            => $recurring_query->row['forwarded_ip'], 
				'user_agent'              => $recurring_query->row['user_agent'],	
				'accept_language'         => $recurring_query->row['accept_language'],					
				'date_added'              => $recurring_query->row['date_added'],
				'date_modified'           => $recurring_query->row['date_modified']
			);
		} else {
			return false;
		}
	}
	
	public function getrecurrings($data = array()) 
	{
		$sql = "SELECT r.*, concat(firstname, ' ', lastname) as customer, currency_code, currency_value FROM recurring r  JOIN `order` o ON o.order_id = r.order_id";	
		
		$query = $this->db->query($sql);
		return $query->rows;
	}
	
	public function getrecurringProducts($recurring_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_product WHERE recurring_id = '" . (int)$recurring_id . "'");
		
		return $query->rows;
	}
	
	public function getrecurringOption($recurring_id, $recurring_option_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_option WHERE recurring_id = '" . (int)$recurring_id . "' AND recurring_option_id = '" . (int)$recurring_option_id . "'");

		return $query->row;
	}
	
	public function getrecurringOptions($recurring_id, $recurring_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_option WHERE recurring_id = '" . (int)$recurring_id . "' AND recurring_product_id = '" . (int)$recurring_product_id . "'");

		return $query->rows;
	}

	public function getrecurringDownloads($recurring_id, $recurring_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_download WHERE recurring_id = '" . (int)$recurring_id . "' AND recurring_product_id = '" . (int)$recurring_product_id . "'");

		return $query->rows;
	}
	
	public function getrecurringVouchers($recurring_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_voucher WHERE recurring_id = '" . (int)$recurring_id . "'");
		
		return $query->rows;
	}
	
	public function getrecurringVoucherByVoucherId($voucher_id) {
      	$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "recurring_voucher` WHERE voucher_id = '" . (int)$voucher_id . "'");

		return $query->row;
	}
				
	public function getrecurringTotals($recurring_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_total WHERE recurring_id = '" . (int)$recurring_id . "' recurring BY sort_recurring");

		return $query->rows;
	}

	public function getTotalrecurrings($data = array()) {
    
	}

	public function getTotalrecurringsByStoreId($store_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "recurring` WHERE store_id = '" . (int)$store_id . "'");

		return $query->row['total'];
	}

	public function getTotalrecurringsByrecurringStatusId($recurring_status_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "recurring` WHERE recurring_status_id = '" . (int)$recurring_status_id . "' AND recurring_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalrecurringsByLanguageId($language_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "recurring` WHERE language_id = '" . (int)$language_id . "' AND recurring_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalrecurringsByCurrencyId($currency_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "recurring` WHERE currency_id = '" . (int)$currency_id . "' AND recurring_status_id > '0'");

		return $query->row['total'];
	}
	
	public function getTotalSales() {
      	$query = $this->db->query("SELECT SUM(total) AS total FROM `" . DB_PREFIX . "recurring` WHERE recurring_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalSalesByYear($year) {
      	$query = $this->db->query("SELECT SUM(total) AS total FROM `" . DB_PREFIX . "recurring` WHERE recurring_status_id > '0' AND YEAR(date_added) = '" . (int)$year . "'");

		return $query->row['total'];
	}

	public function createInvoiceNo($recurring_id) {
		$recurring_info = $this->getrecurring($recurring_id);
			
		if ($recurring_info && !$recurring_info['invoice_no']) {
			$query = $this->db->query("SELECT MAX(invoice_no) AS invoice_no FROM `" . DB_PREFIX . "recurring` WHERE invoice_prefix = '" . $this->db->escape($recurring_info['invoice_prefix']) . "'");
	
			if ($query->row['invoice_no']) {
				$invoice_no = $query->row['invoice_no'] + 1;
			} else {
				$invoice_no = 1;
			}
		
			$this->db->query("UPDATE `" . DB_PREFIX . "recurring` SET invoice_no = '" . (int)$invoice_no . "', invoice_prefix = '" . $this->db->escape($recurring_info['invoice_prefix']) . "' WHERE recurring_id = '" . (int)$recurring_id . "'");
			
			return $recurring_info['invoice_prefix'] . $invoice_no;
		}
	}
	
	public function addrecurringHistory($recurring_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "recurring` SET recurring_status_id = '" . (int)$data['recurring_status_id'] . "', date_modified = NOW() WHERE recurring_id = '" . (int)$recurring_id . "'");

		$this->db->query("INSERT INTO " . DB_PREFIX . "recurring_history SET recurring_id = '" . (int)$recurring_id . "', recurring_status_id = '" . (int)$data['recurring_status_id'] . "', notify = '" . (isset($data['notify']) ? (int)$data['notify'] : 0) . "', comment = '" . $this->db->escape(strip_tags($data['comment'])) . "', date_added = NOW()");

		$recurring_info = $this->getrecurring($recurring_id);

		// Send out any gift voucher mails
		if ($this->config->get('config_complete_status_id') == $data['recurring_status_id']) {
			$this->load->model('sale/voucher');

			$results = $this->getrecurringVouchers($recurring_id);
			
			foreach ($results as $result) {
				$this->model_sale_voucher->sendVoucher($result['voucher_id']);
			}
		}

      	if ($data['notify']) {
			$language = new Language($recurring_info['language_directory']);
			$language->load($recurring_info['language_filename']);
			$language->load('mail/recurring');

			$subject = sprintf($language->get('text_subject'), $recurring_info['store_name'], $recurring_id);

			$message  = $language->get('text_recurring') . ' ' . $recurring_id . "\n";
			$message .= $language->get('text_date_added') . ' ' . date($language->get('date_format_short'), strtotime($recurring_info['date_added'])) . "\n\n";
			
			$recurring_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring_status WHERE recurring_status_id = '" . (int)$data['recurring_status_id'] . "' AND language_id = '" . (int)$recurring_info['language_id'] . "'");
				
			if ($recurring_status_query->num_rows) {
				$message .= $language->get('text_recurring_status') . "\n";
				$message .= $recurring_status_query->row['name'] . "\n\n";
			}
			
			if ($recurring_info['customer_id']) {
				$message .= $language->get('text_link') . "\n";
				$message .= html_entity_decode($recurring_info['store_url'] . 'index.php?route=account/recurring/info&recurring_id=' . $recurring_id, ENT_QUOTES, 'UTF-8') . "\n\n";
			}
			
			if ($data['comment']) {
				$message .= $language->get('text_comment') . "\n\n";
				$message .= strip_tags(html_entity_decode($data['comment'], ENT_QUOTES, 'UTF-8')) . "\n\n";
			}

			$message .= $language->get('text_footer');

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');
			$mail->setTo($recurring_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($recurring_info['store_name']);
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
			$mail->send();
		}
	}
		
	public function getrecurringHistories($recurring_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 10;
		}	
				
		$query = $this->db->query("SELECT oh.date_added, os.name AS status, oh.comment, oh.notify FROM " . DB_PREFIX . "recurring_history oh LEFT JOIN " . DB_PREFIX . "recurring_status os ON oh.recurring_status_id = os.recurring_status_id WHERE oh.recurring_id = '" . (int)$recurring_id . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' recurring BY oh.date_added ASC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}
	
	public function getTotalrecurringHistories($recurring_id) {
	  	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recurring_history WHERE recurring_id = '" . (int)$recurring_id . "'");

		return $query->row['total'];
	}	
		
	public function getTotalrecurringHistoriesByrecurringStatusId($recurring_status_id) {
	  	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recurring_history WHERE recurring_status_id = '" . (int)$recurring_status_id . "'");

		return $query->row['total'];
	}	
	
	public function getEmailsByProductsrecurringed($products, $start, $end) {
		$implode = array();
		
		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . $product_id . "'";
		}
		
		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "recurring` o LEFT JOIN " . DB_PREFIX . "recurring_product op ON (o.recurring_id = op.recurring_id) WHERE (" . implode(" OR ", $implode) . ") AND o.recurring_status_id <> '0'");
	
		return $query->rows;
	}
	
	public function getTotalEmailsByProductsrecurringed($products) {
		$implode = array();
		
		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . $product_id . "'";
		}
				
		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "recurring` o LEFT JOIN " . DB_PREFIX . "recurring_product op ON (o.recurring_id = op.recurring_id) WHERE (" . implode(" OR ", $implode) . ") AND o.recurring_status_id <> '0' LIMIT " . $start . "," . $end);	
		
		return $query->row['total'];
	}	
	
	
}
?>