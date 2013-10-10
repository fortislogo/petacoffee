<?php
      class ModelTotalVoucher extends Model {
        public function getTotal(&$total_data, &$total, &$taxes) {
          if (isset($this->session->data['vouchers_to_redeem'])) {
            $this->load->language('total/voucher');

            $this->load->model('checkout/voucher');

            foreach ($this->session->data['vouchers_to_redeem'] as $voucher)
            {
              $voucher_info = $this->model_checkout_voucher->getVoucher($voucher);

              if ($voucher_info) {

                $amount = $total;

                foreach ($total_data as $data) {
                  if (!$this->config->get('valid_for_shipping')) {
                    if ($data['code'] == 'shipping')
                    {
                      $amount -= $data['value'];
                    }
                  }
                  if (!$this->config->get('valid_for_tax')) {
                    if ($data['code'] == 'tax')
                    {
                      $amount -= $data['value'];
                    }
                  }
                }

                if ($voucher_info['amount'] < $amount) {
                  $amount = $voucher_info['amount'];
                }

                if ($this->config->get('allow_remove'))
                {
                  $title = sprintf($this->language->get('text_voucher'), $voucher); //'<!--start:voucher_remove--> <a href="index.php?route=checkout/cart/removeVoucher&voucher=' . $voucher . '" title="' . $this->language->get('text_remove') . '">[x]</a><!--end:voucher_remove-->';
                } else {
                  $title = sprintf($this->language->get('text_voucher'), $voucher);
                }

                $total_data[] = array(
                  'code'       => 'voucher',
                     'title'      => $title,
                    'text'       => $this->currency->format(-$amount),
                     'value'      => -$amount,
                  'sort_order' => $this->config->get('voucher_sort_order')
                   );

                $total -= $amount;
              }
            }
          }
        }

        public function confirm($order_info, $order_total) {
          $code = '';

          $start = strpos($order_total['title'], '(') + 1;
          $end = strrpos($order_total['title'], ')');

          if ($start && $end) {
            $code = substr($order_total['title'], $start, $end - $start);
          }

          $this->load->model('checkout/voucher');

          $voucher_info = $this->model_checkout_voucher->getVoucher($code);

          if ($voucher_info) {
            $this->model_checkout_voucher->redeem($voucher_info['voucher_id'], $order_info['order_id'], $order_total['value']);
          }
        }
      }
      ?>