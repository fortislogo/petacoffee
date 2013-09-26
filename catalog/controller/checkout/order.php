<?php 
class ControllerCheckoutOrder extends Controller {
	private $error = array();
	
	public function index() 
	{
		$order_id = $this->request->get['order_id'];
		
		echo $order_id;
	}
}
?>
