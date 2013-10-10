<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>">
				<?php echo $breadcrumb['text']; ?>
			</a>
		<?php } ?>
	</div>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>
				
				<header class="heading">

					<h1 class="page-header"><?php echo $heading_title; ?></h1>

					<?php if ($error_warning) { ?>
						<div class="alert warning"><?php echo $error_warning; ?></div>
					<?php } ?>

				</header>

				

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="recurring_form" class="form-horizontal">
                
                	<table class="table table-bordered" id="product-list">
                    	
                        <thead>
							<tr>
								<td style="text-align:left;">
									PRODUCT NAME
								</td>
                                <td style="text-align:left;">
									MODEL
								</td>
                                <td style="text-align:right;">
									QUANTITY
								</td>
                                <td style="text-align:right">
									PRICE 
								</td>
                                <td style="text-align:right">
									TOTAL
								</td>
							</tr>
						</thead>
                        
                        <tbody>
				
						<?php $product_row = 0; ?>
		            	<?php $option_row = 0; ?>
        			    <?php $download_row = 0; ?>
                        
                        <?php if ($products) { ?>
			              <?php foreach ($products as $order_product) { ?>
            			  	<tr id="product-row<?php echo $product_row; ?>">
		                		<td class="left"><?php echo $order_product['name']; ?><br />
                  					
					                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][product_id]" value="<?php echo $order_product['product_id']; ?>" />
					                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][name]" value="<?php echo $order_product['name']; ?>" />
    					              <?php foreach ($order_product['option'] as $option) { ?>
					                  - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                					  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][product_option_id]" value="<?php echo $option['product_option_id']; ?>" />
					                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][product_option_value_id]" value="<?php echo $option['product_option_value_id']; ?>" />
					                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][name]" value="<?php echo $option['name']; ?>" />
					                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][value]" value="<?php echo $option['value']; ?>" />
					                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][type]" value="<?php echo $option['type']; ?>" />
					                  <?php $option_row++; ?>
					                  <?php } ?>
					                  </td>
            			    <td class="left"><?php echo $order_product['model']; ?>
			                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][model]" value="<?php echo $order_product['model']; ?>" /></td>
            			    <td class="right quantity"><input type="text" name="order_product[<?php echo $product_row; ?>][quantity]" value="<?php echo $order_product['quantity']; ?>" /></td>                 
            			    <td class="right"><?php echo $order_product['price']; ?>
			                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][price]" value="<?php echo $order_product['price']; ?>" /></td>
            			    <td class="right"><?php echo $order_product['total']; ?>
			                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][total]" value="<?php echo $order_product['total']; ?>" />
            			      <input type="hidden" name="order_product[<?php echo $product_row; ?>][tax]" value="<?php echo $order_product['tax']; ?>" />
			                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][reward]" value="<?php echo $order_product['reward']; ?>" /></td>
			              </tr>
            			  <?php $product_row++; ?>
			              <?php } ?>
            			  <?php } else { ?>
			              <tr>
            			    <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
			              </tr>
            			  <?php } ?>	
	
	
						</tbody>
                        
                        
                    	
                    </table>
                    
                    <table class="table table-bordered" id="add-product">
                    	
                        <thead>
							<tr>
								<td colspan="2">
									Add Product(s)
								</td>
							</tr>
						</thead>
                        
                        <tbody>
                        	<tr>
                            	<td>Choose Product:</td>
                                <td><input type="text" name="product" value="" />
                  					<input type="hidden" name="product_id" value="" /></td>
                            </tr>
                        	<tr id="option"></tr>
                            <tr>
                            	<td>Quantity:</td>
                                <td><input type="text" name="quantity" value="1" /></td>
                            </tr>
                        </tbody>
                        
                        <tfoot>
			              <tr>
            			    <td class="left">&nbsp;</td>
			                <td class="left"><a id="button-product" class="btn btn-inverse">Add Product</a></td>
            			  </tr>
			            </tfoot>
                        
                    </table>    
                
					<table class="table table-bordered" id="recurring-details">
                    	
                        <thead>
							<tr>
								<td colspan="2">
									Recurring Order Details
								</td>
							</tr>
						</thead>
                    
                    
                    	<tr>
                        	<td>Frequency:</td>
                            <td>
                            	<select name="recurring">
			            	    	<option value="0">Please select</option>
            			    	    <?php for($i=2; $i<=20; $i++): ?>
				                    <?php if ($recurring_frequency == $i): ?>
                				    <option value="<?php echo $i; ?>" selected="selected"><?php echo $i; ?> weeks</option>
				                    <?php else: ?>
                				    <option value="<?php echo $i; ?>"><?php echo $i; ?> weeks</option>
				                    <?php endif; ?>
                				    <?php endfor; ?>
							    </select>
                            </td>
                        </tr>
                        
                    	<tr>
                        	<td>Next Order Date:</td>
                            <td><input type="input" class="date" name="next_order_date" value="<?php echo $next_order_date; ?>"></td>
                        </tr>
                        
                        <tr>
                        	<td>Status:</td>
                            <td>
                            	<select name="status">
                                	<?php if ($status == 'active'): ?>
                                    <option value="active" selected="selected">Active</option>
                                    <option value="cancel">Cancel</option>
                                    <?php else: ?>
                                    <option value="active">Active</option>
                                    <option value="cancel" selected="selected">Cancel</option>
                                    <?php endif; ?>
                                </select>
                            </td>
                        </tr>
                        
                    </table>
                  
                  	  <table class="table table-bordered" id="billing-details">
                    	
                        <thead>
							<tr>
								<td colspan="2">
									Billing Details
								</td>
							</tr>
						</thead>
                        
                        <?php if ($addresses) { ?>
                        
                         <tr>
                        	<td id="payment_addresses">
                            	<input type="radio" name="payment_use_address" value="existing-address" checked="checked"> Use existing address
                                <div id="existing-address">
								<select name="payment_address_id" style="width:100%" size="5">
								<?php foreach ($addresses as $address) { ?>
								<?php if ($address['address_id'] == $payment_address_id) { ?>
								<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
								<?php } ?>
								<?php } ?>
                                </select>
                                </div>
                                
                                <input type="radio" name="payment_use_address" value="new-address"> New address
                                
                                <div class="new-address" id="new-address">
                                
                                <p>
                                	<label>First Name:</label>
                                    <input type="text" name="payment_firstname">
                                </p>
                                <p>
                                	<label>Last Name:</label>
                                    <input type="text" name="payment_lastname">
                                </p>
                                <p>
                                	<label>Company:</label>
                                    <input type="text" name="payment_company">
                                </p>
                                <p>
                                	<label>Address 1:</label>
                                    <input type="text" name="payment_address_1">
                                </p>
                                <p>
                                	<label>Address 2:</label>
                                    <input type="text" name="payment_address_2">
                                </p>
                                <p>
                                	<label>City:</label>
                                    <input type="text" name="payment_city">
                                </p>
                                <p>
                                	<label>Postal Code:</label>
                                    <input type="text" name="payment_postcode">
                                </p>
                                <p>
                                	<label>Country:</label>
                                    <select name="payment_country_id">
	                                    <option value=""><?php echo $text_select; ?></option>
										<?php foreach ($countries as $country) { ?>
										<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
										<?php } ?>
                                    </select>
                                </p>
                                <p>
                                	<label>Region / State:</label>
                                    <select name="payment_zone_id">
                                    </select>
                                </p>
                                </div>
                            </td>
                        </tr>
                        
                        <?php } ?>
                        
                    </table>      
                    
                    
                    <table class="table table-bordered" id="delivery-details">
                    	
                        <thead>
							<tr>
								<td colspan="2">
									Delivery Details
								</td>
							</tr>
						</thead>
                        
                        <?php if ($addresses) { ?>
                        
                        <tr>
                        	<td id="shipping_addresses">
                            	<input type="radio" name="shipping_use_address" value="existing-address" checked="checked"> Use existing address
                                <div id="existing-address">
								<select name="shipping_address_id" style="width:100%" size="5">
								<?php foreach ($addresses as $address) { ?>
								<?php if ($address['address_id'] == $shipping_address_id) { ?>
								<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
								<?php } ?>
								<?php } ?>
                                </select>
                                </div>
                                
                                <input type="radio" name="shipping_use_address" value="new-address"> New address
                                
                                <div class="new-address" id="new-address">
                                
                                <p>
                                	<label>First Name:</label>
                                    <input type="text" name="shipping_firstname">
                                </p>
                                <p>
                                	<label>Last Name:</label>
                                    <input type="text" name="shipping_lastname">
                                </p>
                                <p>
                                	<label>Company:</label>
                                    <input type="text" name="shipping_company">
                                </p>
                                <p>
                                	<label>Address 1:</label>
                                    <input type="text" name="shipping_address_1">
                                </p>
                                <p>
                                	<label>Address 2:</label>
                                    <input type="text" name="shipping_address_2">
                                </p>
                                <p>
                                	<label>City:</label>
                                    <input type="text" name="shipping_city">
                                </p>
                                <p>
                                	<label>Postal Code:</label>
                                    <input type="text" name="shipping_postcode">
                                </p>
                                <p>
                                	<label>Country:</label>
                                    <select name="shipping_country_id">
	                                    <option value=""><?php echo $text_select; ?></option>
										<?php foreach ($countries as $country) { ?>
										<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
										<?php } ?>
                                    </select>
                                </p>
                                <p>
                                	<label>Region / State:</label>
                                    <select name="shipping_zone_id">
                                    </select>
                                </p>
                                </div>
                            </td>
                        </tr>
                        
						<?php } ?>
                        
                        
                    	
                    </table>
                    
                    <table class="table table-bordered" id="delveiry-method">
                    	
                        <thead>
							<tr>
								<td colspan="2">
									Delivery Method
								</td>
							</tr>
						</thead>
                        
                        <?php if ($shipping_methods) { ?>
                        
                        <tr>
                        	<td>
								<?php foreach ($shipping_methods as $shipping_method) { ?>
				
									<?php foreach ($shipping_method['quote'] as $quote) { ?>

									<label class="radio">
                                    	<?php if ($shipping_code == $quote['code']): ?>
                                        <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" class="radio inline" checked="checked" />
                                        <?php else: ?>
										<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" class="radio inline" />
                                        <?php endif; ?>
	
										<?php echo html_entity_decode($quote['title']); ?> (<b><?php echo $quote['text']; ?></b>)
									
                                    </label><br />
			
            						<?php } ?>

								<?php } ?>
                                
                            </td>    
						
                        </tr>	
                        
                        <?php } ?>
                    	
                    </table>
                    
                    <table class="table table-bordered" id="payment-method">
                    	
                        <thead>
							<tr>
								<td colspan="2">
									Payment Method
								</td>
							</tr>
						</thead>
                        
                        <?php if ($payment_methods) { ?>
                        
                        <tr>
                        	
                            <td>
								<?php foreach ($payment_methods as $payment_method) { ?>
				
								<label class="radio">
                                	<?php if ($payment_code == $payment_method['code']): ?>
                                    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" class="radio inline" />
                                    <?php else: ?>
									<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" class="radio inline" />
                                    <?php endif; ?>
									<?php echo $payment_method['title']; ?>
								</label> <br />

								<?php } ?>
                                
                           </td>     
                           
                        </tr>   
                        
                        <?php } ?>
                    
                    </table>
                    
                    <table class="table table-bordered" id="comment-form">
                    	
                        <thead>
							<tr>
								<td colspan="2">
									Comment / Notes
								</td>
							</tr>
						</thead>
                        
                        <tr>
                        
                        	<td>
                            	<textarea name="comment" rows="8" style="width:100%"><?php echo $comment; ?></textarea>
                            </td>
                        
                        </tr>
                        
                        
                    </table>
                    
                    
                    <table class="table table-bordered" id="order-total">
			            <thead>
            			  <tr>
			                <td class="left">PRODUCT</td>
			                <td class="left">MODEL</td>
            			    <td class="right">QUANTITY</td>
			                <td class="right">PRICE</td>
            			    <td class="right">TOTAL</td>
			              </tr>
            			</thead>
			            <tbody id="total">
            			  <?php $total_row = 0; ?>
			              <?php if ($products || $order_vouchers || $order_totals) { ?>
             				 <?php foreach ($products as $order_product) { ?>
				              <tr>
                				<td class="left"><?php echo $order_product['name']; ?><br />
				                  <?php foreach ($order_product['option'] as $option) { ?>
                				  - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
				                  <?php } ?></td>
                				<td class="left"><?php echo $order_product['model']; ?></td>
				                <td class="right"><?php echo $order_product['quantity']; ?></td>
                				<td class="right"><?php echo $order_product['price']; ?></td>
				                <td class="right"><?php echo $order_product['total']; ?></td>
				              </tr>
			              <?php } ?>
            			  <?php foreach ($order_vouchers as $order_voucher) { ?>
			              <tr>
            			    <td class="left"><?php echo $order_voucher['description']; ?></td>
			                <td class="left"></td>
            			    <td class="right">1</td>
			                <td class="right"><?php echo $order_voucher['amount']; ?></td>
            			    <td class="right"><?php echo $order_voucher['amount']; ?></td>
			              </tr>
            			  <?php } ?>
			              <?php foreach ($order_totals as $order_total) { ?>
           				  <tr id="total-row<?php echo $total_row; ?>">
			                <td class="right" colspan="4"><?php echo html_entity_decode($order_total['title']); ?>:
            			      <input type="hidden" name="order_total[<?php echo $total_row; ?>][order_total_id]" value="<?php echo $order_total['order_total_id']; ?>" />
			                  <input type="hidden" name="order_total[<?php echo $total_row; ?>][code]" value="<?php echo $order_total['code']; ?>" />
            			      <input type="hidden" name="order_total[<?php echo $total_row; ?>][title]" value="<?php echo $order_total['title']; ?>" />
			                  <input type="hidden" name="order_total[<?php echo $total_row; ?>][text]" value="<?php echo $order_total['text']; ?>" />
            			      <input type="hidden" name="order_total[<?php echo $total_row; ?>][value]" value="<?php echo $order_total['value']; ?>" />
				              <input type="hidden" name="order_total[<?php echo $total_row; ?>][sort_order]" value="<?php echo $order_total['sort_order']; ?>" /></td>
			                <td class="right"><?php echo $order_total['text']; ?></td>
            			  </tr>
			              <?php $total_row++; ?>
            		  <?php } ?>
		              <?php } else { ?>
        		      <tr>
                		<td class="center" colspan="5"><?php echo $text_no_results; ?></td>
		              </tr>
        		      <?php } ?>
		            </tbody>
        		  </table>
                    
                    
                    
                    
                    <div class="form-actions">
						<a href="" onclick="$('#recurring_form').submit(); return false;" class="btn btn-inverse"><span>Update Recurring Order</span></a>
                        <a href="" class="btn btn-inverse"><span>Reprocess Recurring Order Now</span></a>
					</div>
					
				</form>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	

	<script type="text/javascript"><!--

		$(document).ready(function() {
			$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		});
	
//--></script>

<script type="text/javascript"><!--
$('#button-product, #button-voucher, #button-update').live('click', function() {	
	data  = '#recurring-details input[type=\'text\'], #recurring-details input[type=\'hidden\'], #recurring-details input[type=\'radio\']:checked, #recurring-details input[type=\'checkbox\']:checked, #recurring-details select, #recurring-details textarea, ';
	data += '#payment-details input[type=\'text\'], #payment-details input[type=\'hidden\'], #payment-details input[type=\'radio\']:checked, #payment-details input[type=\'checkbox\']:checked, #payment-details select, #payment-details textarea, ';
	data += '#delivery-details input[type=\'text\'], #delivery-details input[type=\'hidden\'], #delivery-details input[type=\'radio\']:checked, #delivery-details input[type=\'checkbox\']:checked, #delivery-details select, #delivery-details textarea, ';
	
	if ($(this).attr('id') == 'button-product') {
		data += '#add-product input[type=\'text\'], #add-product input[type=\'hidden\'], #add-product input[type=\'radio\']:checked, #add-product input[type=\'checkbox\']:checked, #add-product select, #add-product textarea, ';
	} else {
		data += '#product-list input[type=\'text\'], #product-list input[type=\'hidden\'], #product-list input[type=\'radio\']:checked, #product-list input[type=\'checkbox\']:checked, #product-list select, #product-list textarea, ';
	}
	
	if ($(this).attr('id') == 'button-voucher') {
		data += '#tab-voucher input[type=\'text\'], #tab-voucher input[type=\'hidden\'], #tab-voucher input[type=\'radio\']:checked, #tab-voucher input[type=\'checkbox\']:checked, #tab-voucher select, #tab-voucher textarea, ';
	} else {
		data += '#voucher input[type=\'text\'], #voucher input[type=\'hidden\'], #voucher input[type=\'radio\']:checked, #voucher input[type=\'checkbox\']:checked, #voucher select, #voucher textarea, ';
	}
	
	data += '#order-total input[type=\'text\'], #order-total input[type=\'hidden\'], #order-total input[type=\'radio\']:checked, #order-total input[type=\'checkbox\']:checked, #order-total select, #order-total textarea';

	$.ajax({
		url: '/index.php?route=account/recurring/json',
		type: 'post',
		data: $(data),
		dataType: 'json',	
		beforeSend: function() {
			$('.success, .warning, .attention, .error').remove();
			
			$('.box').before('<div class="attention"><img src="view/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},			
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();
			
			// Check for errors
			if (json['error']) {
				if (json['error']['warning']) {
					$('.box').before('<div class="warning">' + json['error']['warning'] + '</div>');
				}
							
				// Order Details
				if (json['error']['customer']) {
					$('.box').before('<span class="error">' + json['error']['customer'] + '</span>');
				}	
								
				if (json['error']['firstname']) {
					$('input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
				}
				
				if (json['error']['lastname']) {
					$('input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
				}	
				
				if (json['error']['email']) {
					$('input[name=\'email\']').after('<span class="error">' + json['error']['email'] + '</span>');
				}
				
				if (json['error']['telephone']) {
					$('input[name=\'telephone\']').after('<span class="error">' + json['error']['telephone'] + '</span>');
				}	
			
				// Payment Address
				if (json['error']['payment']) {	
					if (json['error']['payment']['firstname']) {
						$('input[name=\'payment_firstname\']').after('<span class="error">' + json['error']['payment']['firstname'] + '</span>');
					}
					
					if (json['error']['payment']['lastname']) {
						$('input[name=\'payment_lastname\']').after('<span class="error">' + json['error']['payment']['lastname'] + '</span>');
					}	
					
					if (json['error']['payment']['address_1']) {
						$('input[name=\'payment_address_1\']').after('<span class="error">' + json['error']['payment']['address_1'] + '</span>');
					}	
					
					if (json['error']['payment']['city']) {
						$('input[name=\'payment_city\']').after('<span class="error">' + json['error']['payment']['city'] + '</span>');
					}	
																								
					if (json['error']['payment']['country']) {
						$('select[name=\'payment_country_id\']').after('<span class="error">' + json['error']['payment']['country'] + '</span>');
					}	
					
					if (json['error']['payment']['zone']) {
						$('select[name=\'payment_zone_id\']').after('<span class="error">' + json['error']['payment']['zone'] + '</span>');
					}
					
					if (json['error']['payment']['postcode']) {
						$('input[name=\'payment_postcode\']').after('<span class="error">' + json['error']['payment']['postcode'] + '</span>');
					}						
				}
			
				// Shipping	Address
				if (json['error']['shipping']) {		
					if (json['error']['shipping']['firstname']) {
						$('input[name=\'shipping_firstname\']').after('<span class="error">' + json['error']['shipping']['firstname'] + '</span>');
					}
					
					if (json['error']['shipping']['lastname']) {
						$('input[name=\'shipping_lastname\']').after('<span class="error">' + json['error']['shipping']['lastname'] + '</span>');
					}	
					
					if (json['error']['shipping']['address_1']) {
						$('input[name=\'shipping_address_1\']').after('<span class="error">' + json['error']['shipping']['address_1'] + '</span>');
					}	
					
					if (json['error']['shipping']['city']) {
						$('input[name=\'shipping_city\']').after('<span class="error">' + json['error']['shipping']['city'] + '</span>');
					}	
																								
					if (json['error']['shipping']['country']) {
						$('select[name=\'shipping_country_id\']').after('<span class="error">' + json['error']['shipping']['country'] + '</span>');
					}	
					
					if (json['error']['shipping_zone']) {
						$('select[name=\'shipping_zone_id\']').after('<span class="error">' + json['error']['shipping']['zone'] + '</span>');
					}
					
					if (json['error']['shipping']['postcode']) {
						$('input[name=\'shipping_postcode\']').after('<span class="error">' + json['error']['shipping']['postcode'] + '</span>');
					}	
				}
				
				// Products
				if (json['error']['product']) {
					if (json['error']['product']['option']) {	
						for (i in json['error']['product']['option']) {
							$('#option-' + i).after('<span class="error">' + json['error']['product']['option'][i] + '</span>');
						}						
					}
					
					if (json['error']['product']['stock']) {
						$('.box').before('<div class="warning">' + json['error']['product']['stock'] + '</div>');
					}	
											
					if (json['error']['product']['minimum']) {	
						for (i in json['error']['product']['minimum']) {
							$('.box').before('<div class="warning">' + json['error']['product']['minimum'][i] + '</div>');
						}						
					}
				} else {
					$('input[name=\'product\']').attr('value', '');
					$('input[name=\'product_id\']').attr('value', '');
					$('#option td').remove();			
					$('input[name=\'quantity\']').attr('value', '1');			
				}
				
				// Voucher
				if (json['error']['vouchers']) {
					if (json['error']['vouchers']['from_name']) {
						$('input[name=\'from_name\']').after('<span class="error">' + json['error']['vouchers']['from_name'] + '</span>');
					}	
					
					if (json['error']['vouchers']['from_email']) {
						$('input[name=\'from_email\']').after('<span class="error">' + json['error']['vouchers']['from_email'] + '</span>');
					}	
								
					if (json['error']['vouchers']['to_name']) {
						$('input[name=\'to_name\']').after('<span class="error">' + json['error']['vouchers']['to_name'] + '</span>');
					}	
					
					if (json['error']['vouchers']['to_email']) {
						$('input[name=\'to_email\']').after('<span class="error">' + json['error']['vouchers']['to_email'] + '</span>');
					}	
					
					if (json['error']['vouchers']['amount']) {
						$('input[name=\'amount\']').after('<span class="error">' + json['error']['vouchers']['amount'] + '</span>');
					}	
				} else {
					$('input[name=\'from_name\']').attr('value', '');	
					$('input[name=\'from_email\']').attr('value', '');	
					$('input[name=\'to_name\']').attr('value', '');
					$('input[name=\'to_email\']').attr('value', '');	
					$('textarea[name=\'message\']').attr('value', '');	
					$('input[name=\'amount\']').attr('value', '25.00');
				}
				
				// Shipping Method	
				if (json['error']['shipping_method']) {
					$('.box').before('<div class="warning">' + json['error']['shipping_method'] + '</div>');
				}	
				
				// Payment Method
				if (json['error']['payment_method']) {
					$('.box').before('<div class="warning">' + json['error']['payment_method'] + '</div>');
				}	
															
				// Coupon
				if (json['error']['coupon']) {
					$('.box').before('<div class="warning">' + json['error']['coupon'] + '</div>');
				}
				
				// Voucher
				if (json['error']['voucher']) {
					$('.box').before('<div class="warning">' + json['error']['voucher'] + '</div>');
				}
				
				// Reward Points		
				if (json['error']['reward']) {
					$('.box').before('<div class="warning">' + json['error']['reward'] + '</div>');
				}	
			} else {
				$('input[name=\'product\']').attr('value', '');
				$('input[name=\'product_id\']').attr('value', '');
				$('#option td').remove();	
				$('input[name=\'quantity\']').attr('value', '1');	
				
				$('input[name=\'from_name\']').attr('value', '');	
				$('input[name=\'from_email\']').attr('value', '');	
				$('input[name=\'to_name\']').attr('value', '');
				$('input[name=\'to_email\']').attr('value', '');	
				$('textarea[name=\'message\']').attr('value', '');	
				$('input[name=\'amount\']').attr('value', '25.00');									
			}

			if (json['success']) {
				$('.box').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				
				$('.success').fadeIn('slow');				
			}
			
			if (json['order_product'] != '') {
				var product_row = 0;
				var option_row = 0;
				var download_row = 0;
	
				html = '';
				
				for (i = 0; i < json['order_product'].length; i++) {
					product = json['order_product'][i];
					
					html += '<tr id="product-row' + product_row + '">';
					html += '  <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="$(\'#product-row' + product_row + '\').remove(); $(\'#button-update\').trigger(\'click\');" /></td>';
					html += '  <td class="left">' + product['name'] + '<br /><input type="hidden" name="order_product[' + product_row + '][order_product_id]" value="" /><input type="hidden" name="order_product[' + product_row + '][product_id]" value="' + product['product_id'] + '" /><input type="hidden" name="order_product[' + product_row + '][name]" value="' + product['name'] + '" />';
					
					if (product['option']) {
						for (j = 0; j < product['option'].length; j++) {
							option = product['option'][j];
							
							html += '  - <small>' + option['name'] + ': ' + option['value'] + '</small><br />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][order_option_id]" value="' + option['order_option_id'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][product_option_id]" value="' + option['product_option_id'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][product_option_value_id]" value="' + option['product_option_value_id'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][name]" value="' + option['name'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][value]" value="' + option['value'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][type]" value="' + option['type'] + '" />';
							
							option_row++;
						}
					}
					
					if (product['download']) {
						for (j = 0; j < product['download'].length; j++) {
							download = product['download'][j];
							
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][order_download_id]" value="' + download['order_download_id'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][name]" value="' + download['name'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][filename]" value="' + download['filename'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][mask]" value="' + download['mask'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][remaining]" value="' + download['remaining'] + '" />';
							
							download_row++;
						}
					}
					
					html += '  </td>';
					html += '  <td class="left">' + product['model'] + '<input type="hidden" name="order_product[' + product_row + '][model]" value="' + product['model'] + '" /></td>';
					html += '  <td class="right">' + product['quantity'] + '<input type="hidden" name="order_product[' + product_row + '][quantity]" value="' + product['quantity'] + '" /></td>';
					html += '  <td class="right">' + product['price'] + '<input type="hidden" name="order_product[' + product_row + '][price]" value="' + product['price'] + '" /></td>';
					html += '  <td class="right">' + product['total'] + '<input type="hidden" name="order_product[' + product_row + '][total]" value="' + product['total'] + '" /><input type="hidden" name="order_product[' + product_row + '][tax]" value="' + product['tax'] + '" /><input type="hidden" name="order_product[' + product_row + '][reward]" value="' + product['reward'] + '" /></td>';
					html += '</tr>';
					
					product_row++;			
				}
				
				$('#product').html(html);
			} else {
				html  = '</tr>';
				html += '  <td colspan="6" class="center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';	

				$('#product').html(html);	
			}
						
			// Vouchers
			if (json['order_voucher'] != '') {
				var voucher_row = 0;
				
				 html = '';
				 
				 for (i in json['order_voucher']) {
					voucher = json['order_voucher'][i];
					 
					html += '<tr id="voucher-row' + voucher_row + '">';
					html += '  <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="$(\'#voucher-row' + voucher_row + '\').remove(); $(\'#button-update\').trigger(\'click\');" /></td>';
					html += '  <td class="left">' + voucher['description'];
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][order_voucher_id]" value="" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][voucher_id]" value="' + voucher['voucher_id'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][description]" value="' + voucher['description'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][code]" value="' + voucher['code'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][from_name]" value="' + voucher['from_name'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][from_email]" value="' + voucher['from_email'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][to_name]" value="' + voucher['to_name'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][to_email]" value="' + voucher['to_email'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][voucher_theme_id]" value="' + voucher['voucher_theme_id'] + '" />';	
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][message]" value="' + voucher['message'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][amount]" value="' + voucher['amount'] + '" />';
					html += '  </td>';
					html += '  <td class="left"></td>';
					html += '  <td class="right">1</td>';
					html += '  <td class="right">' + voucher['amount'] + '</td>';
					html += '  <td class="right">' + voucher['amount'] + '</td>';
					html += '</tr>';	
				  
					voucher_row++;
				}
				  
				$('#voucher').html(html);				
			} else {
				html  = '</tr>';
				html += '  <td colspan="6" class="center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';	

				$('#voucher').html(html);	
			}
						
			// Totals
			if (json['order_product'] != '' || json['order_voucher'] != '' || json['order_total'] != '') {
				html = '';
				
				if (json['order_product'] != '') {
					for (i = 0; i < json['order_product'].length; i++) {
						product = json['order_product'][i];
						
						html += '<tr>';
						html += '  <td class="left">' + product['name'] + '<br />';
						
						if (product['option']) {
							for (j = 0; j < product['option'].length; j++) {
								option = product['option'][j];
								
								html += '  - <small>' + option['name'] + ': ' + option['value'] + '</small><br />';
							}
						}
						
						html += '  </td>';
						html += '  <td class="left">' + product['model'] + '</td>';
						html += '  <td class="right">' + product['quantity'] + '</td>';
						html += '  <td class="right">' + product['price'] + '</td>';
						html += '  <td class="right">' + product['total'] + '</td>';
						html += '</tr>';
					}				
				}
				
				if (json['order_voucher'] != '') {
					for (i in json['order_voucher']) {
						voucher = json['order_voucher'][i];
						 
						html += '<tr>';
						html += '  <td class="left">' + voucher['description'] + '</td>';
						html += '  <td class="left"></td>';
						html += '  <td class="right">1</td>';
						html += '  <td class="right">' + voucher['amount'] + '</td>';
						html += '  <td class="right">' + voucher['amount'] + '</td>';
						html += '</tr>';	
					}	
				}
				
				var total_row = 0;
				
				for (i in json['order_total']) {
					total = json['order_total'][i];
					
					html += '<tr id="total-row' + total_row + '">';
					html += '  <td class="right" colspan="4"><input type="hidden" name="order_total[' + total_row + '][order_total_id]" value="" /><input type="hidden" name="order_total[' + total_row + '][code]" value="' + total['code'] + '" /><input type="hidden" name="order_total[' + total_row + '][title]" value="' + total['title'] + '" /><input type="hidden" name="order_total[' + total_row + '][text]" value="' + total['text'] + '" /><input type="hidden" name="order_total[' + total_row + '][value]" value="' + total['value'] + '" /><input type="hidden" name="order_total[' + total_row + '][sort_order]" value="' + total['sort_order'] + '" />' + total['title'] + ':</td>';
					html += '  <td class="right">' + total['value'] + '</td>';
					html += '</tr>';
					
					total_row++;
				}
				
				$('#total').html(html);
			} else {
				html  = '</tr>';
				html += '  <td colspan="5" class="center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';	

				$('#total').html(html);					
			}
			
			// Shipping Methods
			if (json['shipping_method']) {
				html = '<option value=""><?php echo $text_select; ?></option>';

				for (i in json['shipping_method']) {
					html += '<optgroup label="' + json['shipping_method'][i]['title'] + '">';
				
					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							if (json['shipping_method'][i]['quote'][j]['code'] == $('input[name=\'shipping_code\']').attr('value')) {
								html += '<option value="' + json['shipping_method'][i]['quote'][j]['code'] + '" selected="selected">' + json['shipping_method'][i]['quote'][j]['title'] + '</option>';
							} else {
								html += '<option value="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</option>';
							}
						}		
					} else {
						html += '<option value="" style="color: #F00;" disabled="disabled">' + json['shipping_method'][i]['error'] + '</option>';
					}
					
					html += '</optgroup>';
				}
		
				$('select[name=\'shipping\']').html(html);	
				
				if ($('select[name=\'shipping\'] option:selected').attr('value')) {
					$('input[name=\'shipping_method\']').attr('value', $('select[name=\'shipping\'] option:selected').text());
				} else {
					$('input[name=\'shipping_method\']').attr('value', '');
				}
				
				$('input[name=\'shipping_code\']').attr('value', $('select[name=\'shipping\'] option:selected').attr('value'));	
			}
						
			// Payment Methods
			if (json['payment_method']) {
				html = '<option value=""><?php echo $text_select; ?></option>';
				
				for (i in json['payment_method']) {
					if (json['payment_method'][i]['code'] == $('input[name=\'payment_code\']').attr('value')) {
						html += '<option value="' + json['payment_method'][i]['code'] + '" selected="selected">' + json['payment_method'][i]['title'] + '</option>';
					} else {
						html += '<option value="' + json['payment_method'][i]['code'] + '">' + json['payment_method'][i]['title'] + '</option>';
					}		
				}
		
				$('select[name=\'payment\']').html(html);
				
				if ($('select[name=\'payment\'] option:selected').attr('value')) {
					$('input[name=\'payment_method\']').attr('value', $('select[name=\'payment\'] option:selected').text());
				} else {
					$('input[name=\'payment_method\']').attr('value', '');
				}
				
				$('input[name=\'payment_code\']').attr('value', $('select[name=\'payment\'] option:selected').attr('value'));
			}	
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=product/product/autocomplete&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {	
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id,
						model: item.model,
						option: item.option,
						price: item.price
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'product\']').attr('value', ui.item['label']);
		$('input[name=\'product_id\']').attr('value', ui.item['value']);
		
		if (ui.item['option'] != '') {
			html = '';

			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				
				if (option['type'] == 'select') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
				
					html += option['name'] + '<br />';
					html += '<select name="option[' + option['product_option_id'] + ']">';
					html += '<option value=""><?php echo $text_select; ?></option>';
				
					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];
						
						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];
						
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}
						
						html += '</option>';
					}
						
					html += '</select>';
					html += '</div>';
					html += '<br />';
				}
				
				if (option['type'] == 'radio') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
				
					html += option['name'] + '<br />';
					html += '<select name="option[' + option['product_option_id'] + ']">';
					html += '<option value=""><?php echo $text_select; ?></option>';
				
					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];
						
						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];
						
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}
						
						html += '</option>';
					}
						
					html += '</select>';
					html += '</div>';
					html += '<br />';
				}
					
				if (option['type'] == 'checkbox') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
					
					html += option['name'] + '<br />';
					
					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];
						
						html += '<input type="checkbox" name="option[' + option['product_option_id'] + '][]" value="' + option_value['product_option_value_id'] + '" id="option-value-' + option_value['product_option_value_id'] + '" />';
						html += '<label for="option-value-' + option_value['product_option_value_id'] + '">' + option_value['name'];
						
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}
						
						html += '</label>';
						html += '<br />';
					}
					
					html += '</div>';
					html += '<br />';
				}
			
				if (option['type'] == 'image') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
				
					html += option['name'] + '<br />';
					html += '<select name="option[' + option['product_option_id'] + ']">';
					html += '<option value=""><?php echo $text_select; ?></option>';
				
					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];
						
						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];
						
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}
						
						html += '</option>';
					}
						
					html += '</select>';
					html += '</div>';
					html += '<br />';
				}
						
				if (option['type'] == 'text') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
					
					html += option['name'] + '<br />';
					html += '<input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['option_value'] + '" />';
					html += '</div>';
					html += '<br />';
				}
				
				if (option['type'] == 'textarea') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
					
					html += option['name'] + '<br />';
					html += '<textarea name="option[' + option['product_option_id'] + ']" cols="40" rows="5">' + option['option_value'] + '</textarea>';
					html += '</div>';
					html += '<br />';
				}
				
				if (option['type'] == 'file') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
					
					html += option['name'] + '<br />';
					html += '<a id="button-option-' + option['product_option_id'] + '" class="button"><?php echo $button_upload; ?></a>';
					html += '<input type="hidden" name="option[' + option['product_option_id'] + ']" value="' + option['option_value'] + '" />';
					html += '</div>';
					html += '<br />';
				}
				
				if (option['type'] == 'date') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
					
					html += option['name'] + '<br />';
					html += '<input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['option_value'] + '" class="date" />';
					html += '</div>';
					html += '<br />';
				}
				
				if (option['type'] == 'datetime') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
					
					html += option['name'] + '<br />';
					html += '<input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['option_value'] + '" class="datetime" />';
					html += '</div>';
					html += '<br />';						
				}
				
				if (option['type'] == 'time') {
					html += '<div id="option-' + option['product_option_id'] + '">';
					
					if (option['required']) {
						html += '<span class="required">*</span> ';
					}
					
					html += option['name'] + '<br />';
					html += '<input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['option_value'] + '" class="time" />';
					html += '</div>';
					html += '<br />';						
				}
			}
			
			$('#option').html('<td class="left"><?php echo $entry_option; ?></td><td class="left">' + html + '</td>');

			for (i = 0; i < ui.item.option.length; i++) {
				option = ui.item.option[i];
				
				if (option['type'] == 'file') {		
					new AjaxUpload('#button-option-' + option['product_option_id'], {
						action: 'index.php?route=sale/order/upload',
						name: 'file',
						autoSubmit: true,
						responseType: 'json',
						data: option,
						onSubmit: function(file, extension) {
							$('#button-option-' + (this._settings.data['product_option_id'] + '-' + this._settings.data['product_option_id'])).after('<img src="view/image/loading.gif" class="loading" />');
						},
						onComplete: function(file, json) {

							$('.error').remove();
							
							if (json['success']) {
								alert(json['success']);
								
								$('input[name=\'option[' + this._settings.data['product_option_id'] + ']\']').attr('value', json['file']);
							}
							
							if (json.error) {
								$('#option-' + this._settings.data['product_option_id']).after('<span class="error">' + json['error'] + '</span>');
							}
							
							$('.loading').remove();	
						}
					});
				}
			}
			
		} else {
			$('#option td').remove();
		}
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});	
//--></script> 

<script>
$('#payment_addresses input[type=radio]').bind('click', function()
{														 
	$('#payment_addresses div').hide();
	$('#payment_addresses #' + $(this).val()).show();
});

$('#shipping_addresses input[type=radio]').bind('click', function()
{														 
	$('#shipping_addresses div').hide();
	$('#shipping_addresses #' + $(this).val()).show();
});
			
</script>

	<script type="text/javascript"><!--

		$('select[name=\'payment_country_id\']').bind('change', function() {
	
			$.ajax({
				url: 'index.php?route=account/address/country&country_id=' + this.value,
				dataType: 'json',
				beforeSend: function() {
					$('select[name=\'payment_country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/sellegance/images/loading.gif" alt="" /></span>');
				},		
				complete: function() {
					$('.wait').remove();
				},			
				success: function(json) {
					if (json['postcode_required'] == '1') {
						$('#postcode-required').show();
					} else {
						$('#postcode-required').hide();
					}
					
					html = '<option value=""><?php echo $text_select; ?></option>';
					
					if (json['zone'] != undefined && json['zone'] != '') {
						for (i = 0; i < json['zone'].length; i++) {
		        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
			    			
							if (json['zone'][i]['zone_id'] == '<?php echo $payment_zone_id; ?>') {
			      				html += ' selected="selected"';
			    			}
			
			    			html += '>' + json['zone'][i]['name'] + '</option>';
						}
					} else {
						html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
					}
					
					$('select[name=\'payment_zone_id\']').html(html);
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});

		$('select[name=\'payment_country_id\']').trigger('change');
		
		//--></script> 
        
        <script type="text/javascript"><!--

		$('select[name=\'shipping_country_id\']').bind('change', function() {
	
			$.ajax({
				url: 'index.php?route=account/address/country&country_id=' + this.value,
				dataType: 'json',
				beforeSend: function() {
					$('select[name=\'shipping_country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/sellegance/images/loading.gif" alt="" /></span>');
				},		
				complete: function() {
					$('.wait').remove();
				},			
				success: function(json) {
					if (json['postcode_required'] == '1') {
						$('#postcode-required').show();
					} else {
						$('#postcode-required').hide();
					}
					
					html = '<option value=""><?php echo $text_select; ?></option>';
					
					if (json['zone'] != undefined && json['zone'] != '') {
						for (i = 0; i < json['zone'].length; i++) {
		        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
			    			
							if (json['zone'][i]['zone_id'] == '<?php echo $shipping_zone_id; ?>') {
			      				html += ' selected="selected"';
			    			}
			
			    			html += '>' + json['zone'][i]['name'] + '</option>';
						}
					} else {
						html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
					}
					
					$('select[name=\'shipping_zone_id\']').html(html);
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});

		$('select[name=\'shipping_country_id\']').trigger('change');
		
		//--></script> 

	<?php echo $footer; ?>