<?php
class ControllerTotalGiftWrap extends Controller {
  private $error = array();
  private $type = 'total';
  private $name = 'gift_wrap';
  private $extension_name = 'Gift Wrap';
  private $extension_version = '1.2';
  private $extension_url = 'http://www.opencartworld.com/gift-wrap';
  private $extension_terms = 'http://www.opencartworld.com/terms-and-conditions';
  private $extension_support = 'support@opencartworld.com';
  private $key;
  private $settings = array(
    'fee' => array(),
    'tax_class_id' => array(),
    'calculation_method' => array('default'=>'per_qty'),
    'show_on_shipping' => array('default'=>1),
    'show_on_payment' => array('default'=>1),
    'use_note_field' => array('default'=>1),
    'sort_order' => array(),
    'status' => array(
      'default' => 1
    ),
  );
  private $language_vars = array(
    'heading_title',
    'heading_status',
    'tab_general',
    'tab_about',
    'entry_extension_name',
    'entry_extension_version',
    'entry_extension_author',
    'entry_extension_url',
    'entry_extension_support',
    'entry_extension_legal',
    'text_enabled',
    'text_disabled',
    'text_success',
    'text_status',
    'text_total',
    'text_per_qty',
    'text_per_product',
    'text_per_order',
    'text_none',
    'text_order_totals',
    'button_save',
    'button_cancel',
    'error_permission',
  );

	public function index() {
		$this->key = $this->type . '/' . $this->name;

    $this->load->language($this->key);

    foreach ($this->language_vars as $var) $this->data[$var] = $this->language->get($var);

    $this->load->model('setting/setting');

    if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate()))
    {
      $this->model_setting_setting->editSetting($this->name, $this->request->post);

      $this->session->data['success'] = $this->language->get('text_success');

      $this->redirect($this->ocw->buildURL($this->key, 'token=' . $this->session->data['token'], 'SSL'));
    }

    $this->document->setTitle($this->language->get('heading_title'));

    if ($this->ocw->getVersion() < 1.5)
    {
      $this->document->breadcrumbs = array();

      $this->document->breadcrumbs[] = array(
        'href' => $this->ocw->buildURL('common/home', 'token=' . $this->session->data['token'], 'SSL'),
        'text' => $this->language->get('text_home'),
        'separator' => FALSE
      );

      $this->document->breadcrumbs[] = array(
        'href' => $this->ocw->buildURL('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
        'text' => $this->language->get('text_order_totals'),
        'separator' => ' :: '
      );

	  $this->document->breadcrumbs[] = array(
        'href' => $this->ocw->buildURL($this->key, 'token=' . $this->session->data['token'], 'SSL'),
        'text' => $this->language->get('heading_title'),
        'separator' => ' :: '
      );
    }
    else
    {
      $this->data['breadcrumbs'] = array();

      $this->data['breadcrumbs'][] = array(
        'href' => $this->ocw->buildURL('common/home', 'token=' . $this->session->data['token'], 'SSL'),
        'text' => $this->language->get('text_home'),
        'separator' => FALSE
      );

      $this->data['breadcrumbs'][] = array(
        'href' => $this->ocw->buildURL('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
        'text' => $this->language->get('text_order_totals'),
        'separator' => ' :: '
      );

	  $this->data['breadcrumbs'][] = array(
        'href' => $this->ocw->buildURL($this->key, 'token=' . $this->session->data['token'], 'SSL'),
        'text' => $this->language->get('heading_title'),
        'separator' => ' :: '
      );
    }

    $this->data['settings'] = json_encode($this->settings);

		foreach ($this->settings as $setting => $config)
    {
	  if (is_numeric($setting)) {
        $setting = $config;
        $config = array();
      }
      $key = $this->name . '_' . $setting;
      $this->data['entry_' . $setting] = $this->language->get('entry_' . $setting);
      if (isset($this->request->post[$key]))
      {
        $this->data[$key] = $this->request->post[$key];
      }
      elseif (!is_null($this->config->get($key)))
      {
        $this->data[$key] = $this->config->get($key);
      }
      elseif (isset($config['default']))
      {
        $this->data[$key] = $config['default'];
      }
      else
      {
        $this->data[$key] = '';
      }
    }

    $this->data['token'] = $this->session->data['token'];
    $this->data['type'] = $this->type;
    $this->data['name'] = $this->name;
    $this->data['extension_name'] = $this->extension_name;
    $this->data['extension_version'] = $this->extension_version;
    $this->data['extension_url'] = $this->extension_url;
    $this->data['extension_support'] = $this->extension_support;
    $this->data['extension_terms'] = $this->extension_terms;
    $this->data['version'] = $this->ocw->getVersion();
    $this->data['action'] = $this->ocw->buildURL($this->key, 'token=' . $this->session->data['token'], 'SSL');
    $this->data['cancel'] = $this->ocw->buildURL('extension/total', 'token=' . $this->session->data['token'], 'SSL');
    $this->data['error'] = isset($this->error['warning']) ? $this->error['warning'] : '';
    $this->data['success'] = isset($this->session->data['success']) ? $this->session->data['success'] : '';
    unset($this->session->data['success']);

		$this->load->model('localisation/tax_class');

		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		$this->template = 'total/gift_wrap.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		if ($this->ocw->getVersion() < 1.5) {
      $this->response->setOutput($this->render(true), $this->config->get('config_compression'));
    } else {
      $this->response->setOutput($this->render());
	  }
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'total/gift_wrap')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
?>