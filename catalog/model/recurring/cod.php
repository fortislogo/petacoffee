<?php
class ModelRecurringCod extends Model 
{	
	public function confirm() 
	{
		$this->load->model('checkout/order');		
		$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('cod_order_status_id'));
	}
}
?>