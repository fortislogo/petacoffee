<?php   
class ControllerCommonHome extends Controller {   
	public function index() {
    	$this->language->load('common/home');
	 
		$this->document->setTitle($this->language->get('heading_title'));
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_overview'] = $this->language->get('text_overview');
		$this->data['text_statistics'] = $this->language->get('text_statistics');
		$this->data['text_latest_10_orders'] = $this->language->get('text_latest_10_orders');
		$this->data['text_total_sale'] = $this->language->get('text_total_sale');
		$this->data['text_total_sale_year'] = $this->language->get('text_total_sale_year');
		$this->data['text_total_order'] = $this->language->get('text_total_order');
		$this->data['text_total_customer'] = $this->language->get('text_total_customer');
		$this->data['text_total_customer_approval'] = $this->language->get('text_total_customer_approval');
		$this->data['text_total_review_approval'] = $this->language->get('text_total_review_approval');
		$this->data['text_total_affiliate'] = $this->language->get('text_total_affiliate');
		$this->data['text_total_affiliate_approval'] = $this->language->get('text_total_affiliate_approval');
		$this->data['text_day'] = $this->language->get('text_day');
		$this->data['text_week'] = $this->language->get('text_week');
		$this->data['text_month'] = $this->language->get('text_month');
		$this->data['text_year'] = $this->language->get('text_year');
		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_order'] = $this->language->get('column_order');
		$this->data['column_customer'] = $this->language->get('column_customer');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_total'] = $this->language->get('column_total');
		$this->data['column_firstname'] = $this->language->get('column_firstname');
		$this->data['column_lastname'] = $this->language->get('column_lastname');
		$this->data['column_action'] = $this->language->get('column_action');
		
		$this->data['entry_range'] = $this->language->get('entry_range');
		
		// Check install directory exists
 		if (is_dir(dirname(DIR_APPLICATION) . '/install')) {
			$this->data['error_install'] = $this->language->get('error_install');
		} else {
			$this->data['error_install'] = '';
		}

		// Check image directory is writable
		$file = DIR_IMAGE . 'test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_image'] = sprintf($this->language->get('error_image'). DIR_IMAGE);
		} else {
			$this->data['error_image'] = '';
			
			unlink($file);
		}
		
		// Check image cache directory is writable
		$file = DIR_IMAGE . 'cache/test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_image_cache'] = sprintf($this->language->get('error_image_cache'). DIR_IMAGE . 'cache/');
		} else {
			$this->data['error_image_cache'] = '';
			
			unlink($file);
		}
		
		// Check cache directory is writable
		$file = DIR_CACHE . 'test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_cache'] = sprintf($this->language->get('error_image_cache'). DIR_CACHE);
		} else {
			$this->data['error_cache'] = '';
			
			unlink($file);
		}
		
		// Check download directory is writable
		$file = DIR_DOWNLOAD . 'test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_download'] = sprintf($this->language->get('error_download'). DIR_DOWNLOAD);
		} else {
			$this->data['error_download'] = '';
			
			unlink($file);
		}
		
		// Check logs directory is writable
		$file = DIR_LOGS . 'test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_logs'] = sprintf($this->language->get('error_logs'). DIR_LOGS);
		} else {
			$this->data['error_logs'] = '';
			
			unlink($file);
		}
										
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('sale/order');

		$this->data['total_sale'] = $this->currency->format($this->model_sale_order->getTotalSales(), $this->config->get('config_currency'));
		$this->data['total_sale_year'] = $this->currency->format($this->model_sale_order->getTotalSalesByYear(date('Y')), $this->config->get('config_currency'));
		$this->data['total_order'] = $this->model_sale_order->getTotalOrders();
		
		$this->load->model('sale/customer');
		
		$this->data['total_customer'] = $this->model_sale_customer->getTotalCustomers();
		$this->data['total_customer_approval'] = $this->model_sale_customer->getTotalCustomersAwaitingApproval();
		
		$this->load->model('catalog/review');
		
		$this->data['total_review'] = $this->model_catalog_review->getTotalReviews();
		$this->data['total_review_approval'] = $this->model_catalog_review->getTotalReviewsAwaitingApproval();
		
		$this->load->model('sale/affiliate');
		
		$this->data['total_affiliate'] = $this->model_sale_affiliate->getTotalAffiliates();
		$this->data['total_affiliate_approval'] = $this->model_sale_affiliate->getTotalAffiliatesAwaitingApproval();
				
		$this->data['orders'] = array(); 
		
		$data = array(
			'sort'  => 'o.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => 10
		);
		
		$results = $this->model_sale_order->getOrders($data);
    	
    	foreach ($results as $result) {
			$action = array();
			 
			$action[] = array(
				'text' => $this->language->get('text_view'),
				'href' => $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'], 'SSL')
			);
					
			$this->data['orders'][] = array(
				'order_id'   => $result['order_id'],
				'customer'   => $result['customer'],
				'status'     => $result['status'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'total'      => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
				'action'     => $action
			);
		}

		if ($this->config->get('config_currency_auto')) {
			$this->load->model('localisation/currency');
		
			$this->model_localisation_currency->updateCurrencies();
		}
		
		$this->template = 'common/home.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
  	}
	
	public function chart() {
		$this->language->load('common/home');
		
		$data = array();
		
		$data['order'] = array();
		$data['customer'] = array();
		$data['xaxis'] = array();
		
		$data['order']['label'] = $this->language->get('text_order');
		$data['customer']['label'] = $this->language->get('text_customer');
		
		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'month';
		}
		
		switch ($range) {
			case 'day':
				for ($i = 0; $i < 24; $i++) {
					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND (DATE(date_added) = DATE(NOW()) AND HOUR(date_added) = '" . (int)$i . "') GROUP BY HOUR(date_added) ORDER BY date_added ASC");
					
					if ($query->num_rows) {
						$data['order']['data'][]  = array($i, (int)$query->row['total']);
					} else {
						$data['order']['data'][]  = array($i, 0);
					}
					
					$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE DATE(date_added) = DATE(NOW()) AND HOUR(date_added) = '" . (int)$i . "' GROUP BY HOUR(date_added) ORDER BY date_added ASC");
					
					if ($query->num_rows) {
						$data['customer']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['customer']['data'][] = array($i, 0);
					}
			
					$data['xaxis'][] = array($i, date('H', mktime($i, 0, 0, date('n'), date('j'), date('Y'))));
				}					
				break;
			case 'week':
				$date_start = strtotime('-' . date('w') . ' days'); 
				
				for ($i = 0; $i < 7; $i++) {
					$date = date('Y-m-d', $date_start + ($i * 86400));

					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND DATE(date_added) = '" . $this->db->escape($date) . "' GROUP BY DATE(date_added)");
			
					if ($query->num_rows) {
						$data['order']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['order']['data'][] = array($i, 0);
					}
				
					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "customer` WHERE DATE(date_added) = '" . $this->db->escape($date) . "' GROUP BY DATE(date_added)");
			
					if ($query->num_rows) {
						$data['customer']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['customer']['data'][] = array($i, 0);
					}
		
					$data['xaxis'][] = array($i, date('D', strtotime($date)));
				}
				
				break;
			default:
			case 'month':
				for ($i = 1; $i <= date('t'); $i++) {
					$date = date('Y') . '-' . date('m') . '-' . $i;
					
					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND (DATE(date_added) = '" . $this->db->escape($date) . "') GROUP BY DAY(date_added)");
					
					if ($query->num_rows) {
						$data['order']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['order']['data'][] = array($i, 0);
					}	
				
					$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE DATE(date_added) = '" . $this->db->escape($date) . "' GROUP BY DAY(date_added)");
			
					if ($query->num_rows) {
						$data['customer']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['customer']['data'][] = array($i, 0);
					}	
					
					$data['xaxis'][] = array($i, date('j', strtotime($date)));
				}
				break;
			case 'year':
				for ($i = 1; $i <= 12; $i++) {
					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND YEAR(date_added) = '" . date('Y') . "' AND MONTH(date_added) = '" . $i . "' GROUP BY MONTH(date_added)");
					
					if ($query->num_rows) {
						$data['order']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['order']['data'][] = array($i, 0);
					}
					
					$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE YEAR(date_added) = '" . date('Y') . "' AND MONTH(date_added) = '" . $i . "' GROUP BY MONTH(date_added)");
					
					if ($query->num_rows) { 
						$data['customer']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['customer']['data'][] = array($i, 0);
					}
					
					$data['xaxis'][] = array($i, date('M', mktime(0, 0, 0, $i, 1, date('Y'))));
				}			
				break;	
		} 
		
		$this->response->setOutput(json_encode($data));
	}
	
	public function login() {
		$route = '';
		
		if (isset($this->request->get['route'])) {
			$part = explode('/', $this->request->get['route']);
			
			if (isset($part[0])) {
				$route .= $part[0];
			}
			
			if (isset($part[1])) {
				$route .= '/' . $part[1];
			}
		}
		
		$ignore = array(
			'common/login',
			'common/forgotten',
			'common/reset',
			'sale/recurring/create_order'
		);	
					
		if (!$this->user->isLogged() && !in_array($route, $ignore)) {
			return $this->forward('common/login');
		}
		
		if (isset($this->request->get['route'])) {
			$ignore = array(
				'common/login',
				'common/logout',
				'common/forgotten',
				'common/reset',
				'error/not_found',
				'error/permission',
				'sale/recurring/create_order'
			);
						
			$config_ignore = array();
			
			if ($this->config->get('config_token_ignore')) {
				$config_ignore = unserialize($this->config->get('config_token_ignore'));
			}
				
			$ignore = array_merge($ignore, $config_ignore);
						
			if (!in_array($route, $ignore) && (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token']))) {
				return $this->forward('common/login');
			}
		} else {
			if (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
				return $this->forward('common/login');
			}
		}
	}
	
	public function permission() {
		if (isset($this->request->get['route'])) {
			$route = '';
			
			$part = explode('/', $this->request->get['route']);
			
			if (isset($part[0])) {
				$route .= $part[0];
			}
			
			if (isset($part[1])) {
				$route .= '/' . $part[1];
			}
			
			$ignore = array(
				'common/home',
				'common/login',
				'common/logout',
				'common/forgotten',
				'common/reset',
				'error/not_found',
				'error/permission',
				'sale/recurring/createOrder'
			);			
						
			if (!in_array($route, $ignore) && !$this->user->hasPermission('access', $route)) {
				return $this->forward('error/permission');
			}
		}
	}	
	
	public function import()
	{
		/*$this->import_category();
		$this->import_product();
		$this->import_product_options();
		$this->import_orders();
		$this->import_orders_items();
		$this->import_customers();*/
		$this->import_temp_orders();
		/*$this->import_recurring();*/
		
		//$this->import_coupon();
	}
	
	
	private function import_coupon()
	{
		$query = $this->db->query("delete from coupon");
		$query = $this->db->query("select * from xcart_discount_coupons");
		$result = $query->rows;
		foreach($result as $row)
		{
			$coupon = array();
			$ss = array();
			
			$coupon['name'] = $row['coupon'];
			$coupon['code'] = $row['coupon'];
			$coupon['type'] = $row['coupon_type'] == 'percent' ? 'P' : 'F';
			$coupon['discount'] = $row['discount'];
			
			$end = date("Y-m-d", $row['expire']);
			
			$coupon['date_start'] = $end;
			$coupon['date_end'] = $end;
			$coupon['status'] = $row['status'] == 'A' ? 1 : 0;
			$coupon['uses_total'] = $row['times'];
			$coupon['uses_customer'] = $row['per_user'] == 'Y' ? 1 : 0;
			$coupon['total'] = $row['minimum'];
			
			$sql = "INSERT INTO `coupon` SET";
			
			foreach($coupon as $field => $value)
			{
				$ss[] = sprintf(" `%s` = '%s'", $field, $value);
			}
			
			$sql .= implode(',', $ss);
			
			$this->db->query($sql);
		}
	}
	
	public function import_recurring()
	{
		$this->db->query("delete from recurring");
		$this->db->query("delete from recurring_option");
		$this->db->query("delete from recurring_product");
		$query = $this->db->query("select * from recurring_orders");
		$results = $query->rows;
		foreach($results as $row)
		{
			$recurring['name'] = $row['last_orderid'];			
			$recurring['order_id'] = $row['last_orderid'];
			$recurring['amount'] = $row['original_total'];
			$recurring['recurring'] = $row['order_frequency'];
			
			$status = '';
			if ($row['active'] == 'Y') $status = 'active';
			
			$recurring['status'] = $status;
			
			$order = $this->getOrder($row['last_orderid']);
			
			$payment_country_id = $this->getCountryId($order['b_country']);
			$payment_zone_id = $this->getZoneId($order['b_state']);
			
			$shipping_country_id = $this->getCountryId($order['s_country']);
			$shipping_zone_id = $this->getZoneId($order['s_state']);
			
			$recurring['date'] = date("Y-m-d", $order['date']);
			
			$email_address = $this->getCustomerEmail($order['login']);
			
			$customer_id = $this->getCustomerIdByEmail($email_address);
			
			$recurring['customer_id'] = $customer_id;
			
			$next_order_date = date("Y-m-d", strtotime(sprintf("%s +%s week", date("Y-m-d", $order['date']),$row['order_frequency'])));
			
			$recurring['next_order_date'] = $next_order_date;
			
			$recurring['payment_firstname'] = $order['b_firstname'];
			$recurring['payment_lastname'] = $order['b_lastname'];
			$recurring['payment_address_1'] = $order['b_address'];
			$recurring['payment_city'] = $order['b_city'];
			$recurring['payment_postcode'] = $order['b_zipcode'];
			$recurring['payment_country'] = $order['b_country'];
			$recurring['payment_country_id'] = $payment_country_id;
			$recurring['payment_zone'] = $order['b_state'];
			$recurring['payment_zone_id'] = $payment_zone_id;
			
			$recurring['shipping_firstname'] = $order['s_firstname'];
			$recurring['shipping_lastname'] = $order['s_lastname'];
			$recurring['shipping_address_1'] = $order['s_address'];
			$recurring['shipping_city'] = $order['b_city'];
			$recurring['shipping_postcode'] = $order['b_zipcode'];
			$recurring['shipping_country'] = $order['b_country'];
			$recurring['shipping_country_id'] = $shipping_country_id;
			$recurring['shipping_zone'] = $order['b_state'];
			$recurring['shipping_zone_id'] = $shipping_zone_id;
			
			$recurring_id = $this->addRecurring($recurring);
			
			$this->load->model('sale/order');
			
			$products = $this->model_sale_order->getOrderProducts($row['last_orderid']);
			
			foreach($products as $product)
			{
				$this->db->query("insert into recurring_product set product_id = '".$product['product_id']."', name = '".$product['name']."', model = '".$product['model']."', quantity = '".$product['quantity']."', price = '".$product['price']."', total = '".$product['total']."', tax = '".$product['tax']."', reward = '".$product['reward']."', recurring_id = '".$recurring_id."'");
			}
			
		}
		
		echo "done.";
	}
	
	
	
	
	function addRecurring($data)
	{
		$sql = "INSERT INTO recurring SET";
		$new = array();
		foreach($data as $field => $value)
		{
			$new[] = " `$field` = '$value'";
		}
		
		$sql .= implode(',', $new);
		
		$this->db->query($sql);
		
		return $this->db->getLastId();
	}
	
	
	/*function getCustomerIdByEmail($email)
	{
		$customerid = 0;
		$query = $this->db->query("select * from customer where email = '".$email."'");
		$result = $query->row;
		if ($result)
			$customerid = $result['customer_id'];
		return $customerid;
	}*/
	
	function getCustomerEmail($login)
	{
		$query = $this->db->query("select * from xcart_customers where login = '".$login."'");
		$result = $query->row;
		$email = "";
		if ($result)
			$email = $result['email'];
		return $email;
	}
	
	function getCountryId($country)
	{
		$countryid = 223;
		
		return $countryid;
	}
	
	function getZoneId($zone)
	{
		$zoneid = 0;
		
		$query = $this->db->query("select * from zone where country_id = 223 and code = '".$zone."'");
		$result = $query->row;
		
		if ($result)
		
			$zoneid = $result['zone_id'];
		
		return $zoneid;
	}
	
	function getOrder($order_id)
	{
		$query = $this->db->query("select * from xcart_orders where orderid = " . $order_id);
		$result = $query->row;
		return $result;
	}
	
	public function update_customer_password()
	{
		$query = $this->db->query("select * from xcart_customers");
		$result = $query->rows;
		foreach($result as $row)
		{
			$email = $row['email'];
			$pass = text_decrypt($row['password']);
			
			//echo sprintf("email:%s password: %s<br />", $email, $pass);
			
			$id = $this->getCustomerIdByEmail($email);
			
			if ($id > 0)
			{
				echo sprintf("%s: %s: %s<br />", $id, $row['email'], $pass);
				$this->db->query("UPDATE customer SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($pass)))) . "' WHERE customer_id = '" . (int)$id . "'");
				//$this->db->query("update customer set password = '".$pass."' where customer_id = " . $id);
			}
		}
	}
	
	
	
	function getCustomerIdByEmail($email)
	{
		$query = $this->db->query("select * from customer where email = '".$email."'");
		$result = $query->row;
		$id = 0;
		if ($result)
		{
			$id = $result['customer_id'];
		}
		
		return $id;
	}
	
	
	
	public function import_customers()
	{
		$this->load->model('sale/customer');
		$this->db->query("delete from customer");
		$this->db->query("delete from address");
		$query = $this->db->query("select * from xcart_customers");
		$result = $query->rows;
		foreach($result as $row)
		{
			$user['firstname'] = $row['firstname'];
			$user['lastname'] = $row['lastname'];
			$user['email'] = $row['email'];
			$user['telephone'] = $row['phone'];
			$user['fax'] = $row['fax'];
			$user['store'] = 0;
			$user['newsletter'] = 0;
			$user['customer_group_id'] = 1;
			$user['password'] = 'password';
			$user['status'] = 1;
			
			$user['address'] = array();
			$address['firstname'] = $row['firstname'];
			$address['lastname'] = $row['lastname'];
			$address['company'] = '';
			$address['company_id'] = '';
			$address['address_1'] = $row['b_address'];
			$address['address_2'] = '';
			$address['tax_id'] = '';
			$address['city'] = $row['b_city'];
			$address['postcode'] = $row['b_zipcode'];
			
			$query = $this->db->query("select country_id from country where iso_code_2 = '".$row['b_country']."'");
			
			if ($query->row)
			{
				$country_id = $query->row['country_id'];
			}
			else
			{
				$country_id = 0;
			}
			
			
			
			if ($country_id > 0)
			{
				$query = $this->db->query("select zone_id from zone where code = '".$row['b_state']."' and country_id = " . $country_id);
				$zone_id = $query->row['zone_id'];
			}
			else
			{
				$zone_id = 0;
			}
			
			$address['country_id'] = $country_id;
			$address['zone_id'] = $zone_id;
			$user['address'][] = $address;
			
			$this->model_sale_customer->addCustomer($user);
		}
	}
	
	function import_category()
	{
		$this->load->model('catalog/category');
		
		$query = $this->db->query("select category_id from category");
		$results = $query->rows;
		foreach($results as $row)
		{
			$this->model_catalog_category->deleteCategory($row['category_id']);
		}
		
		$file = 'csv/category.csv';
		$row = 1;
		if (($handle = fopen($file, "r")) !== FALSE) 
		{
    		while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) 
			{
       		 	if ($row > 1)
				{
					$category = array('category_description' => array(
									  1 => array(
										'name' => $data[1],
										'meta_keyword' => '',
										'meta_description' => '',
										'description' => '',
										)
									  ),
									  'keyword' => strtolower(str_replace(' ', '-', $data[1])),
									  'column' => 0,
									  'parent_id' => 0,
									  'sort_order' => $data[5],
									  'status' => 1,
									  'top' => 1,
									  'category_store' => array(0));
					
					$this->model_catalog_category->addCategory($category);
				}
				$row++;
    		}
    		fclose($handle);
		}
	}
	
	function import_product()
	{
		$this->load->model('catalog/product');
		
		$query = $this->db->query("select product_id from product");
		$results = $query->rows;
		foreach($results as $row)
		{
			$this->model_catalog_product->deleteProduct($row['product_id']);
		}
		
		$file = 'csv/product.csv';
		$row = 1;
		if (($handle = fopen($file, "r")) !== FALSE) 
		{
    		while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) 
			{
       		 	if ($row > 1)
				{
					//print_r($data);
					
					$category_id = $this->getCategoryId($data[21]);
					
					$product = array('model' => $data[1],
									 'sku' => $data[1],
									 'upc' => '',
									 'ean' => '',
									 'jan' => '',
									 'isbn' => '',
									 'mpn' => '',
									 'location' => '',
									 'quantity' => $data[8],
									 'minimum' => '',
									 'subtract' => 1,
									 'stock_status_id' => 5,
									 'date_available' => date("Y-m-d"),
									 'manufacturer_id' => '',
									 'shipping' => 1,
									 'price' => $data[23],
									 'points' => 0,
									 'weight' => $data[3],
									 'weight_class_id' => 1,
									 'length' => '',
									 'width' => '',
									 'height' => '',
									 'length_class_id' => 1,
									 'status' => 1,
									 'tax_class_id' => 0,
									 'sort_order' => 0,
									 'image' => 'data/products/' .$data[25],
									  'keyword' => strtolower(str_replace(' ', '-', $data[2])),
									 'product_description' => array(
									 		1 => array(
												'name' => $data[2],
												'meta_keyword' => '',
												'meta_description' => '',
												'description' => $data[6],
												'tag' => $data[7]
											)
									 	),
									 'recurring' => 1,
									  'product_store' => array(0),
									  'product_category' => array($category_id)
									 );
					
					$this->model_catalog_product->addProduct($product);
				}
				$row++;
    		}
    		fclose($handle);
		}
	}
	
	function getCategoryId($name)
	{
		$query = $this->db->query("select category_id from category_description where name = '".$name."'");
		$result = $query->row;
		if ($result)
		{
			$category_id = $result['category_id'];
		}
		else
		{
			$category_id = 0;
		}
		
		return $category_id;
	}
	
	function import_product_options()
	{
		$file = 'csv/product_options.csv';
		$row = 1;
		if (($handle = fopen($file, "r")) !== FALSE) 
		{
    		while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) 
			{
       		 	if ($row > 1)
				{
					$options = array();
					$option_description = $this->getOptions($data[5]);
					$product_id = $this->getProductId($data[1]);
					if ($product_id > 0)
					{
						$options['type'] = 'select';
						$options['product_option_id'] = '';
						$options['name'] = $option_description['name'];
						$options['required'] = 1;
						$options['option_id'] = $option_description['option_id'];
					}
					
					$this->addProductOption($product_id, array('product_option' => array($options)));
					
				}
				$row++;
    		}
    		fclose($handle);
		}
	}
	
	function getOptions($name)
	{
		$query = $this->db->query("select od.name, od.option_id from option_description od join option_value_description ovd on ovd.option_id = od.option_id where ovd.name = '".$this->db->escape($name)."'");
		if ($query->row)
		{
			return $query->row;
		}
		else
		{
			return array();
		}
	}
	
	function getProductId($sku)
	{
		$query = $this->db->query("select product_id from product where sku = '".$this->db->escape($sku)."'");
		if ($query->row)
		{
			return $query->row['product_id'];
		}
		else
			return 0;
	}
	
	function addProductOption($product_id, $data)
	{
		if (isset($data['product_option'])) {
			foreach ($data['product_option'] as $product_option) {
				if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', required = '" . (int)$product_option['required'] . "'");
				
					$product_option_id = $this->db->getLastId();
				
					if (isset($product_option['product_option_value']) && count($product_option['product_option_value']) > 0 ) {
						foreach ($product_option['product_option_value'] as $product_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$product_option_id . "', product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', option_value_id = '" . (int)$product_option_value['option_value_id'] . "', quantity = '" . (int)$product_option_value['quantity'] . "', subtract = '" . (int)$product_option_value['subtract'] . "', price = '" . (float)$product_option_value['price'] . "', price_prefix = '" . $this->db->escape($product_option_value['price_prefix']) . "', points = '" . (int)$product_option_value['points'] . "', points_prefix = '" . $this->db->escape($product_option_value['points_prefix']) . "', weight = '" . (float)$product_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($product_option_value['weight_prefix']) . "'");
						} 
					}else{
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_option_id = '".$product_option_id."'");
					}
				} else { 
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', option_value = '" . $this->db->escape($product_option['option_value']) . "', required = '" . (int)$product_option['required'] . "'");
				}
			}
		}
	}
	
	function import_orders()
	{
		$file = 'csv/orders.csv';
		$row = 1;
		if (($handle = fopen($file, "r")) !== FALSE) 
		{
    		while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) 
			{
       		 	if ($row > 1)
				{
					$sql = array();
					foreach($data as $key => $val)
					{
						$sql[] = sprintf("%s = '%s'", $fields[$key], $this->db->escape($val));
					}	
					$this->db->query("insert into temp_orders set " . implode(',', $sql));			
				}
				else
				{	
					$fields = array();
					$sql = array();
					foreach($data as $fname)
					{
						$sql[] = sprintf("%s varchar(100)", substr($fname, 1));
						$fields[] = substr($fname, 1);
					}
					$this->db->query("drop table if exists temp_orders");
					$this->db->query("create table temp_orders (".implode(',', $sql).")");
				}
				$row++;
    		}
    		fclose($handle);
		}
	}
	
	function import_orders_items()
	{
		$file = 'csv/orders_items.csv';
		$row = 1;
		if (($handle = fopen($file, "r")) !== FALSE) 
		{
    		while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) 
			{
       		 	if ($row > 1)
				{
					$sql = array();
					foreach($data as $key => $val)
					{
						$sql[] = sprintf("%s = '%s'", $fields[$key], $this->db->escape($val));
					}	
					$this->db->query("insert into temp_orders_items set " . implode(',', $sql));			
				}
				else
				{	
					$fields = array();
					$sql = array();
					foreach($data as $fname)
					{
						$sql[] = sprintf("%s varchar(100)", substr($fname, 1));
						$fields[] = substr($fname, 1);
					}
					$this->db->query("drop table if exists temp_orders_items");
					$this->db->query("create table temp_orders_items (".implode(',', $sql).")");
				}
				$row++;
    		}
    		fclose($handle);
		}
	}
	
	/*function getCountryId($country)
	{
		$query = $this->db->query("select country_id from country where iso_code_2 = '".$country."'");
			
		if ($query->row)
		{
			$country_id = $query->row['country_id'];
		}
		else
		{
			$country_id = 0;
		}
			
		return $country_id;
	}
	
	function getZoneId($country, $zone)
	{
		if ($country > 0)
		{
			$query = $this->db->query("select zone_id from zone where code = '".$state."' and country_id = " . $country);
			$zone_id = $query->row['zone_id'];
		}
		else
		{
			$zone_id = 0;
		}
		
		return $zone_id;
	}
	*/
	function getShippingMethod($id)
	{
		$query = $this->db->query("select shipping from xcart_shipping where shippingid = " . $id);
		if ($query->row)
			return $query->row['shipping'];
		else
			return '';
	}
	
	
	
	function import_temp_orders()
	{
		$this->load->model('sale/order');
		
		$this->db->query("delete from `order`");
		$this->db->query("delete from order_product");
		$this->db->query("delete from order_total");
		
		$query = $this->db->query("select * from xcart_orders");
		$results = $query->rows;
		foreach($results as $row)
		{
			//print_r($row);
			$query = $this->db->query("select * from xcart_order_details where orderid = " . $row['orderid']);
			$products = $query->rows;
			
			$product_data = array();
			
			$total = 0;
			
			foreach($products as $product)
			{
				$total += ($product['amount'] * $product['price']);
				
				$product_data[] = array('product_id' => $product['productid'],
									    'name' => $product['product'],
										'model' => $product['productcode'],
										'quantity' => $product['amount'],
										'price' => $product['price'],
										'total' => $product['amount'] * $product['price'],
										'reward' => 0,
										'tax' => 0);
			}
			
			$order['order_total'] = array();
			$order['order_total'][] = array('code' => 'total', 
											'title' => 'Total',
											'value' => $total, 
											'text' => sprintf("USD$%s", number_format($total, 2)),
											'sort_order' => 4);
			
			$order['order_product'] = $product_data;
			
			$order['store_id'] = 0;
			$order['email'] = $row['email'];
			$order['customer_id'] = $this->getCustomerId($row);
			
			$shipping_country_id = $this->getCountryId($row['s_country']);
			$shipping_zone_id = $this->getZoneId($row['s_country'], $row['s_state']);		
			
			$payment_country_id = $this->getCountryId($row['b_country']);
			$payment_zone_id = $this->getZoneId($row['b_country'], $row['b_state']);
			$payment_method = $row['payment_method'];
			
			$shipping_method = $this->getShippingMethod($row['shippingid']);
			
			$order['order_id'] = $row['orderid'];
			$order['shipping_country_id'] = $shipping_country_id;
			$order['shipping_zone_id'] = $shipping_zone_id;
			
			$order['payment_country_id'] = $payment_country_id;
			$order['payment_zone_id'] = $payment_zone_id;
			
			$order['customer_group_id'] = 0;
			$order['firstname'] = $row['firstname'];
			$order['lastname'] = $row['lastname'];
			$order['telephone'] = $row['phone'];
			$order['fax'] = $row['fax'];
			
			$order['payment_firstname'] = $row['b_firstname'];
			$order['payment_lastname'] = $row['b_lastname'];
			$order['payment_company'] = $row['company'];
			$order['payment_company_id'] = 0;
			$order['payment_tax_id'] = 0;
			
			$order['payment_address_1'] = $row['b_address'];
			$order['payment_address_2'] = '';
			$order['payment_city'] = $row['b_city'];
			$order['payment_postcode'] = $row['b_zipcode'];
			
			$order['payment_code'] = '';
			
			$order['shipping_firstname'] = $row['s_firstname'];
			$order['shipping_lastname'] = $row['s_lastname'];
			$order['shipping_company'] = $row['company'];
			$order['shipping_company_id'] = 0;
			$order['shipping_tax_id'] = 0;
			
			$order['shipping_address_1'] = $row['s_address'];
			$order['shipping_address_2'] = '';
			$order['shipping_city'] = $row['s_city'];
			$order['shipping_postcode'] = $row['s_zipcode'];
			
			$order['shipping_code'] = '';
			
			$order['payment_method'] = $payment_method;
			$order['shipping_method'] = $shipping_method;
			
			$order['comment'] = $row['customer_notes'];
			
			$order['order_status_id'] = 5;
			$order['affiliate_id'] = 0;
			
			$this->model_sale_order->addOrder($order);
		}
	}
	
	function getPaymentMethod($id)
	{
		$query = $this->db->query("select payment_method from xcart_payment_methods where paymentid = " . $id);
		return $query->row['payment_method'];
	}
	function getCustomerId($data)
	{
		$this->load->model('sale/customer');
		
		$query = $this->db->query("select customer_id from customer where email = '".$data['email']."'");
		if ($query->row)
			return $query->row['customer_id'];	
		else
		{
			$row = $data;
			
			$user['firstname'] = $row['firstname'];
			$user['lastname'] = $row['lastname'];
			$user['email'] = $row['email'];
			$user['telephone'] = $row['phone'];
			$user['fax'] = $row['fax'];
			$user['store'] = 0;
			$user['newsletter'] = 0;
			$user['customer_group_id'] = 1;
			$user['password'] = 'password';
			$user['status'] = 1;
			
			$user['address'] = array();
			$address['firstname'] = $row['firstname'];
			$address['lastname'] = $row['lastname'];
			$address['company'] = '';
			$address['company_id'] = '';
			$address['address_1'] = $row['b_address'];
			$address['address_2'] = '';
			$address['tax_id'] = '';
			$address['city'] = $row['b_city'];
			$address['postcode'] = $row['b_zipcode'];
			
			$query = $this->db->query("select country_id from country where iso_code_2 = '".$row['b_country']."'");
			
			if ($query->row)
			{
				$country_id = $query->row['country_id'];
			}
			else
			{
				$country_id = 0;
			}
			
			
			
			if ($country_id > 0)
			{
				$query = $this->db->query("select zone_id from zone where code = '".$row['b_state']."' and country_id = " . $country_id);
				$zone_id = $query->row['zone_id'];
			}
			else
			{
				$zone_id = 0;
			}
			
			$address['country_id'] = $country_id;
			$address['zone_id'] = $zone_id;
			$user['address'][] = $address;
			
			$this->model_sale_customer->addCustomer($user);
			
			return $this->getCustomerId($data);
		}
		
				
	}
}
?>