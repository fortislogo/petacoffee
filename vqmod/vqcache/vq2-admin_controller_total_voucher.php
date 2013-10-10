<?php
class ControllerTotalVoucher extends Controller {
	private $error = array(); 
	 
	public function index() { 
		$this->language->load('total/voucher');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('voucher', $this->request->post);

                $this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . (float)$this->request->post['min_amount'] . "' WHERE `key` = 'config_voucher_min'");
                $this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . (float)$this->request->post['max_amount'] . "' WHERE `key` = 'config_voucher_max'");
        	
		
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

      $this->data['entry_allow_remove'] = $this->language->get('entry_allow_remove');
      $this->data['entry_allow_check_balance'] = $this->language->get('entry_allow_check_balance');
      $this->data['entry_show_during_checkout'] = $this->language->get('entry_show_during_checkout');
      $this->data['entry_amount_range'] = $this->language->get('entry_amount_range');
      $this->data['entry_default_amount'] = $this->language->get('entry_default_amount');
      $this->data['entry_code_chars'] = $this->language->get('entry_code_chars');
      $this->data['entry_code_length'] = $this->language->get('entry_code_length');
      $this->data['entry_auto_email_voucher'] = $this->language->get('entry_auto_email_voucher');
      $this->data['entry_valid_for_shipping'] = $this->language->get('entry_valid_for_shipping');
      $this->data['entry_valid_for_tax'] = $this->language->get('entry_valid_for_tax');
      

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
					
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');


      if (isset($this->error['min_amount'])) {
        $this->data['error_min_amount'] = $this->error['min_amount'];
      } else {
        $this->data['error_min_amount'] = '';
      }
      if (isset($this->error['max_amount'])) {
        $this->data['error_max_amount'] = $this->error['max_amount'];
      } else {
        $this->data['error_max_amount'] = '';
      }
      if (isset($this->error['default_amount'])) {
        $this->data['error_default_amount'] = $this->error['default_amount'];
      } else {
        $this->data['error_default_amount'] = '';
      }
      if (isset($this->error['code_chars'])) {
        $this->data['error_code_chars'] = $this->error['code_chars'];
      } else {
        $this->data['error_code_chars'] = '';
      }
      if (isset($this->error['code_length'])) {
        $this->data['error_code_length'] = $this->error['code_length'];
      } else {
        $this->data['error_code_length'] = '';
      }
      
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_total'),
			'href'      => $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('total/voucher', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('total/voucher', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL');


      if (isset($this->request->post['allow_remove'])) {
        $this->data['allow_remove'] = $this->request->post['allow_remove'];
      } elseif ($this->config->get('allow_remove') != null) {
        $this->data['allow_remove'] = $this->config->get('allow_remove');
      } else {
        $this->data['allow_remove'] =  1;
      }
      if (isset($this->request->post['allow_check_balance'])) {
        $this->data['allow_check_balance'] = $this->request->post['allow_check_balance'];
      } elseif ($this->config->get('allow_check_balance') != null) {
        $this->data['allow_check_balance'] = $this->config->get('allow_check_balance');
      } else {
        $this->data['allow_check_balance'] =  1;
      }
      if (isset($this->request->post['show_during_checkout'])) {
        $this->data['show_during_checkout'] = $this->request->post['show_during_checkout'];
      } elseif ($this->config->get('show_during_checkout') != null) {
        $this->data['show_during_checkout'] = $this->config->get('show_during_checkout');
      } else {
        $this->data['show_during_checkout'] =  1;
      }
      if (isset($this->request->post['min_amount'])) {
        $this->data['min_amount'] = $this->request->post['min_amount'];
      } elseif ($this->config->get('min_amount')) {
        $this->data['min_amount'] = $this->config->get('config_voucher_min');
      } else {
        $this->data['min_amount'] = '1.00';
      }
      if (isset($this->request->post['max_amount'])) {
        $this->data['max_amount'] = $this->request->post['max_amount'];
      } elseif ($this->config->get('max_amount')) {
        $this->data['max_amount'] = $this->config->get('config_voucher_max');
      } else {
        $this->data['max_amount'] = '1000.00';
      }
      if (isset($this->request->post['default_amount'])) {
        $this->data['default_amount'] = $this->request->post['default_amount'];
      } elseif ($this->config->get('default_amount')) {
        $this->data['default_amount'] = $this->config->get('default_amount');
      } else {
        $this->data['default_amount'] = '25.00';
      }
      if (isset($this->request->post['code_chars'])) {
        $this->data['code_chars'] = $this->request->post['code_chars'];
      } elseif ($this->config->get('code_chars')) {
        $this->data['code_chars'] = $this->config->get('code_chars');
      } else {
        $this->data['code_chars'] = 'ABCDEFGHJKMNPRSTWXYZ123456789';
      }
      if (isset($this->request->post['code_length'])) {
        $this->data['code_length'] = $this->request->post['code_length'];
      } elseif ($this->config->get('code_length')) {
        $this->data['code_length'] = $this->config->get('code_length');
      } else {
        $this->data['code_length'] = 7;
      }
      if (isset($this->request->post['auto_email_voucher'])) {
        $this->data['auto_email_voucher'] = $this->request->post['auto_email_voucher'];
      } elseif ($this->config->get('auto_email_voucher') != null) {
        $this->data['auto_email_voucher'] = $this->config->get('auto_email_voucher');
      } else {
        $this->data['auto_email_voucher'] = 1;
      }
      if (isset($this->request->post['valid_for_shipping'])) {
        $this->data['valid_for_shipping'] = $this->request->post['valid_for_shipping'];
      } else {
        $this->data['valid_for_shipping'] = $this->config->get('valid_for_shipping');
      }
      if (isset($this->request->post['valid_for_tax'])) {
        $this->data['valid_for_tax'] = $this->request->post['valid_for_tax'];
      } else {
        $this->data['valid_for_tax'] = $this->config->get('valid_for_tax');
      }
      
		if (isset($this->request->post['voucher_status'])) {
			$this->data['voucher_status'] = $this->request->post['voucher_status'];
		} else {
			$this->data['voucher_status'] = $this->config->get('voucher_status');
		}

		if (isset($this->request->post['voucher_sort_order'])) {
			$this->data['voucher_sort_order'] = $this->request->post['voucher_sort_order'];
		} else {
			$this->data['voucher_sort_order'] = $this->config->get('voucher_sort_order');
		}

		$this->template = 'total/voucher.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validate() {

      if ((strlen(utf8_decode($this->request->post['min_amount']) < 1)) || $this->request->post['min_amount'] <= 0 || !is_numeric($this->request->post['min_amount']) ) {
      		$this->error['min_amount'] = $this->language->get('error_min_amount');
    	}
    	if ((strlen(utf8_decode($this->request->post['max_amount']) < 1)) || $this->request->post['max_amount'] <= 0 || !is_numeric($this->request->post['max_amount']) ) {
      		$this->error['max_amount'] = $this->language->get('error_max_amount');
    	}
    	if ((strlen(utf8_decode($this->request->post['default_amount']) < 1)) || $this->request->post['default_amount'] <= 0 || !is_numeric($this->request->post['default_amount']) ) {
      		$this->error['default_amount'] = $this->language->get('error_default_amount');
    	}
    	if ((strlen(utf8_decode($this->request->post['code_chars'])) < 3)) {
      		$this->error['code_chars'] = $this->language->get('error_code_chars');
    	}
    	if ((strlen(utf8_decode($this->request->post['code_length']) < 1)) || $this->request->post['code_length'] < 3 || $this->request->post['code_length'] > 10 || !is_numeric($this->request->post['code_length']) ) {
      		$this->error['code_length'] = $this->language->get('error_code_length');
    	}
      
		if (!$this->user->hasPermission('modify', 'total/voucher')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>