<?php
class ModelTotalGiftWrap extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
    if (!$this->cart->hasProducts()) return;

		if (isset($this->session->data['gift_wrap']) && $this->config->get('gift_wrap_status')) {
			$this->load->language('total/gift_wrap');

			$this->load->model('localisation/currency');

			if($this->config->get('gift_wrap_calculation_method') == 'per_qty') {
				$fee = $this->calculateFeePerQty($total_data);
			} else if($this->config->get('gift_wrap_calculation_method') == 'per_product') {
				$fee = $this->calculateFeePerProduct($total_data);
			} else {
				$fee = $this->calculateFeePerOrder($total_data);
			}

			$total_data[] = array(
        'code'       => 'gift_wrap',
        'title'      => $this->language->get('text_gift_wrap'),
        'text'       => $this->currency->format($fee),
        'value'      => $fee,
				'sort_order' => $this->config->get('gift_wrap_sort_order')
			);

			if ($this->config->get('gift_wrap_tax_class_id'))
      {
        if ($this->hasTaxRateClass())
        {
          $tax_rates = $this->tax->getRates($fee, $this->config->get('gift_wrap_tax_class_id'));

          foreach ($tax_rates as $tax_rate) {
            if (!isset($taxes[$tax_rate['tax_rate_id']])) {
              $taxes[$tax_rate['tax_rate_id']] =  $tax_rate['amount'];
            } else {
              $taxes[$tax_rate['tax_rate_id']] += $tax_rate['amount'];
            }
          }
        } else {
          if (!isset($taxes[$this->config->get('gift_wrap_tax_class_id')])) {
            $taxes[$this->config->get('gift_wrap_tax_class_id')] = $fee / 100 * $this->tax->getRate($this->config->get('gift_wrap_tax_class_id'));
          } else {
            $taxes[$this->config->get('gift_wrap_tax_class_id')] += $fee / 100 * $this->tax->getRate($this->config->get('gift_wrap_tax_class_id'));
          }
        }
			}

			// update the total
			$total += $fee;
		}
	}

	private function calculateFeePerQty($total_data){
		$product_total = 0;

		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total += $product['quantity'];
		}
		return $product_total * $this->config->get('gift_wrap_fee');
	}

	private function calculateFeePerProduct($total_data) {
		return $this->cart->hasProducts() * $this->config->get('gift_wrap_fee');
	}

	private function calculateFeePerOrder() {
		return $this->config->get('gift_wrap_fee');
	}

  private function hasTaxRateClass()
  {
    return method_exists($this->tax, 'getRateName');
  }
}
?>