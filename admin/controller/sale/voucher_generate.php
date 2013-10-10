<?php 
class ControllerSaleVoucherGenerate extends Controller {
	private $error = array();
   
  public function index() {
    $this->load->language('sale/voucher_generate');

    $this->document->setTitle($this->language->get('heading_title'));

    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm())
    {
      $results = $this->generateAndSendVouchers($this->request->post);
      if ($results)
      {
        $this->session->data['success'] = sprintf($this->language->get('text_success'),$results['count']);
      }
    }

    $this->getForm();
  }

  private function getForm() {
    $this->data['heading_title'] = $this->language->get('heading_title');

    $this->data['entry_file'] = $this->language->get('entry_file');
    $this->data['entry_sender_name'] = $this->language->get('entry_sender_name');
    $this->data['entry_sender_email'] = $this->language->get('entry_sender_email');
    $this->data['entry_message'] = $this->language->get('entry_message');
    $this->data['entry_theme'] = $this->language->get('entry_theme');
    $this->data['entry_amount'] = $this->language->get('entry_amount');
    $this->data['entry_currency'] = $this->language->get('entry_currency');

    $this->data['button_generate_and_send'] = $this->language->get('button_generate_and_send');

    if (isset($this->error['warning'])) {
      $this->data['error_warning'] = $this->error['warning'];
    } else {
      $this->data['error_warning'] = '';
    }

    if (isset($this->error['sender_name'])) {
      $this->data['error_sender_name'] = $this->error['sender_name'];
    } else {
      $this->data['error_sender_name'] = '';
    }

    if (isset($this->error['sender_email'])) {
      $this->data['error_sender_email'] = $this->error['sender_email'];
    } else {
      $this->data['error_sender_email'] = '';
    }

    if (isset($this->error['message'])) {
      $this->data['error_message'] = $this->error['message'];
    } else {
      $this->data['error_message'] = '';
    }

    if (isset($this->error['amount'])) {
      $this->data['error_amount'] = $this->error['amount'];
    } else {
      $this->data['error_amount'] = '';
    }

    if (isset($this->error['file'])) {
      $this->data['error_file'] = $this->error['file'];
    } else {
      $this->data['error_file'] = '';
    }

    $this->data['breadcrumbs'] = array();

    $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('text_home'),
        'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
        'separator' => false
    );

    $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('heading_title'),
    'href'      => $this->url->link('sale/voucher_generate', 'token=' . $this->session->data['token'], 'SSL'),
        'separator' => ' :: '
    );

    $this->data['action'] = $this->url->link('sale/voucher_generate', 'token=' . $this->session->data['token'], 'SSL');

    $this->data['token'] = $this->session->data['token'];

    $this->load->model('localisation/currency');

    $this->data['currencies'] = $this->model_localisation_currency->getCurrencies();

    if (isset($this->request->post['sender_name'])) {
      $this->data['sender_name'] = $this->request->post['sender_name'];
    } else {
      $this->data['sender_name'] = $this->config->get('config_name');
    }

    if (isset($this->request->post['sender_email'])) {
      $this->data['sender_email'] = $this->request->post['sender_email'];
    } else {
      $this->data['sender_email'] = $this->config->get('config_email');
    }

    if (isset($this->request->post['message'])) {
      $this->data['message'] = $this->request->post['message'];
    } else {
      $this->data['message'] = '';
    }

    $this->load->model('sale/voucher_theme');

		$this->data['voucher_themes'] = $this->model_sale_voucher_theme->getVoucherThemes();

    if (isset($this->request->post['voucher_theme_id'])) {
      $this->data['voucher_theme_id'] = $this->request->post['voucher_theme_id'];
    } else {
      $this->data['voucher_theme_id'] = 0;
    }

    if (isset($this->request->post['amount'])) {
      $this->data['amount'] = $this->request->post['amount'];
    } else {
      $this->data['amount'] = '';
    }

    if (isset($this->request->post['currency_id'])) {
      $this->data['currency_id'] = $this->request->post['currency_id'];
    } else {
      $this->data['currency_id'] = 0;
    }

    if (isset($this->session->data['success'])) {
      $this->data['success'] = $this->session->data['success'];
    } else {
      $this->data['success'] = '';
    }

    $this->template = 'sale/voucher_generate.tpl';
    $this->children = array(
      'common/header',
      'common/footer'
    );

    $this->response->setOutput($this->render());
  }

  private function generateAndSendVouchers()
  {
    $this->load->model('sale/voucher');

    $recipients = array();

    if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name']))
    {
      $handle = fopen($this->request->files['file']['tmp_name'], "r");

      while (($data = fgetcsv($handle)) !== FALSE)
      {
        if (count($data) != 2) {
          return false;
        }

        $recipient = array();
        $recipient['name'] = $data[0];
        $recipient['email'] = $data[1];

        if (!$this->validateRecipient($recipient)) {
          return false;
        }

        $recipients[] = $recipient;
      }
    }

    $this->load->model('localisation/currency');

    $currency = $this->model_localisation_currency->getCurrency($this->request->post['currency_id']);

    foreach ($recipients as $recipient)
    {
      $data = array();
      $data['code'] = $this->generateVoucherCode();
      $data['from_name'] = $this->request->post['sender_name'];
      $data['from_email'] = $this->request->post['sender_email'];
      $data['to_name'] = $recipient['name'];
      $data['to_email'] = $recipient['email'];
      $data['message'] = $this->request->post['message'];
      $data['amount'] = $this->currency->format($this->request->post['amount'], $currency['code'], false, false);
      $data['voucher_theme_id'] = $this->request->post['voucher_theme_id'];
      $data['status'] = 1;

      $this->model_sale_voucher->addVoucher($data);
      $voucher_id = $this->db->getLastId();
      $this->model_sale_voucher->sendVoucher($voucher_id);
    }

    return array('count'=>count($recipients));
  }

  private function generateVoucherCode()
  {
    $code = '';

    $chars = $this->config->get('code_chars');
    $size = $this->config->get('code_length');

    $i = 1;

    while ($i <= $size) {
      $max = strlen($chars)-1;
      $num = rand(0,$max);
      $tmp = substr($chars,$num,1);
      $code .= $tmp;
      $i++;
    }

    return $code;
  }
  	
	private function validateForm() {
    if (!$this->user->hasPermission('modify', 'sale/voucher_generate')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }

		if ((strlen(utf8_decode($this->request->post['sender_name'])) < 1) || (strlen(utf8_decode($this->request->post['sender_name'])) > 64)) {
			$this->error['sender_name'] = $this->language->get('error_sender_name');
		}

    if ((strlen(utf8_decode($this->request->post['sender_email'])) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['sender_email'])) {
      $this->error['sender_email'] = $this->language->get('error_sender_email');
    }

    if (!$this->request->post['message']) {
			$this->error['message'] = $this->language->get('error_message');
		}

    if (!$this->request->post['amount'] || $this->request->post['amount'] < 0) {
			$this->error['amount'] = $this->language->get('error_amount');
		}

    if (!$this->request->files['file']['tmp_name']) {
			$this->error['file'] = $this->language->get('error_file');
		}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  }

  private function validateRecipient($recipient) {

		if ((strlen(utf8_decode($recipient['name'])) < 1) || (strlen(utf8_decode($recipient['name'])) > 64)) {
			$this->error['file'] = $this->language->get('error_file_invalid');
		}

    if ((strlen(utf8_decode($recipient['email'])) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $recipient['email'])) {
      $this->error['file'] = $this->language->get('error_file_invalid');
    }

		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  }
}
?>