<?php
class ModelTotalRecurring extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) 
	{
		$recurring_status = false;
		
		if (isset($this->session->data['recurring']) && $this->session->data['recurring'] == 1) $recurring_status = true;
		
		if ($this->config->get('recurring_status') == 1 && $recurring_status) 
		{
			$this->language->load('total/recurring');
			
			$amount = $this->config->get('recurring_discount');
			
			if ($this->config->get('recurring_discount_type') == 'percent')
			{
				$amount = $total * ($amount/100);
			}
			
			$discount_total = $amount;
			
			$total_data[] = array(
				'code'       => 'recurring',
       			'title'      => sprintf($this->language->get('text_recurring')),
    			'text'       => $this->currency->format(-$discount_total),
       			'value'      => -$discount_total,
				'sort_order' => $this->config->get('recurring_sort_order')
   			);

			$total -= $discount_total;
		
		}
	}
	
}
?>