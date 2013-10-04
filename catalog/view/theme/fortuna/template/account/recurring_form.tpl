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

				<style>
				#payment-method label
				{
					display:block;
				}
				
				#payment-method label div
				{
					display:none;
				}
				</style>

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
                
					<table class="table table-bordered">
                    	
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
                  
                  	  <table class="table table-bordered">
                    	
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
                    
                    
                    <table class="table table-bordered">
                    	
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
                    
                    <table class="table table-bordered">
                    	
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
                    
                    <table class="table table-bordered" id="gift-coupon">
                    	
                        <thead>
							<tr>
								<td colspan="2">
									Coupon / Gift Voucher
								</td>
							</tr>
						</thead>
                        
                        <tbody>
                        	<tr>
                            	<td>Coupon:</td>
                            	<td>
                                	<input type="text" name="coupon" value="<?php echo $coupon; ?>" />
									<input type="submit" value="Submit" class="btn btn-coupon" />
                                </td>
                            </tr>
                            <tr>
                            	<td>Gift Voucher:</td>
                            	<td>
                                	<input type="text" name="gift_voucher" value="<?php echo $gift_voucher; ?>" />
									<input type="submit" value="Submit" class="btn btn-gift-voucher" />
                                </td>
                            </tr>
                        </tbody>
                    
                    </table>
                    
                    <table class="table table-bordered" id="payment-method">
                    	
                        <thead>
							<tr>
								<td colspan="2">
									Payment Method
								</td>
							</tr>
						</thead>
                        
                        <tbody>
                        <?php if ($payment_methods) { ?>
                        
                        <tr>
                        	
                            <td>
								<?php foreach ($payment_methods as $payment_method) { ?>
				
								<label>
                                	<?php if ($payment_code == $payment_method['code']): ?>
                                    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" class="radio inline" />
                                    <?php else: ?>
									<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" class="radio inline" />
                                    <?php endif; ?>
									<?php echo $payment_method['title']; ?><br />
                                    <?php include($payment_method['form']); ?>
								</label>

								<?php } ?>
                           </td>     
                           
                        </tr>   
                        
                        <?php } ?>
                        
                        </tbody>
                    
                    </table>
                    
                    <table class="table table-bordered">
                    	
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
                    
                    
                    <table class="table table-bordered" id="table-totals">
			            <thead>
            			  <tr>
			                <td class="left">PRODUCT</td>
			                <td class="left">MODEL</td>
            			    <td class="right">QUANTITY</td>
			                <td class="right">PRICE</td>
            			    <td class="right">TOTAL</td>
			              </tr>
            			</thead>
			           
            			  <?php $total_row = 0; ?>
			              <?php if ($products || $order_vouchers || $order_totals) { ?>
                             <?php if ($products): ?>
                             <tbody id="product-totals">
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
                          </tbody>
                          <?php endif; ?>
                          <tbody id="voucher-total">
            			  <?php foreach ($order_vouchers as $order_voucher) { ?>
			              <tr>
            			    <td class="left"><?php echo $order_voucher['description']; ?></td>
			                <td class="left"></td>
            			    <td class="right">1</td>
			                <td class="right"><?php echo $order_voucher['amount']; ?></td>
            			    <td class="right"><?php echo $order_voucher['amount']; ?></td>
			              </tr>
            			  <?php } ?>
                          </tbody>
                          <tbody id="ordertotals-total">
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
                      	  </tbody>
		              <?php } else { ?>
        		      <tr>
                		<td class="center" colspan="5"><?php echo $text_no_results; ?></td>
		              </tr>
        		      <?php } ?>
		            
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
$('#button-product').live('click', function() 
{	
	var params = $('#recurring_form').serialize();
	$.ajax(
	{
		url: '/index.php?route=account/recurring/json',
		data: params,
		dataType: 'json',
		type: 'post',
		success: function(json)
		{
			var productHtml = '';
			var products = json['products'];
			for(var i=0; i<products.length; i++)
			{
				productHtml += '<tr>';
				
				productHtml += '<td>' + products[i].name;
				productHtml += '<input type="hidden" name="order_product[' + i + '][product_id]" value="' + products[i].product_id + '" />';
				productHtml += '<input type="hidden" name="order_product[' + i + '][name]" value="' + products[i].name + '" />';
				
				if (products[i].option)
				{
					var option = products[i].option;
					for(var x=0; x<option.length; x++)
					{
						productHtml += '<br /> - <small>' + option[x].name + ': ' + option[x].value + '</small>';
						productHtml += '<input type="hidden" name="order_product[' + i + '][order_option][' + x + '][product_option_id]" value="' + option[x].product_option_id + '" />';
						productHtml += '<input type="hidden" name="order_product[' + i + '][order_option][' + x + '][product_option_value_id]" value="' + option[x].product_option_value_id + '" />';
						productHtml += '<input type="hidden" name="order_product[' + i + '][order_option][' + x + '][name]" value="' + option[x].name + '" />';
						productHtml += '<input type="hidden" name="order_product[' + i + '][order_option][' + x + '][value]" value="' + option[x].value + '" />';
						productHtml += '<input type="hidden" name="order_product[' + i + '][order_option][' + x + '][type]" value="' + option[x].type + '" />'
						
					}
				}
				
				productHtml += '</td>';
				productHtml += '<td>' + products[i].model  + '<input type="hidden" name="order_product[' + i + '][model]" value="' +products[i].model+'" /></td>';
				productHtml += '<td class="right quantity"><input type="text" name="order_product['+i+'][quantity]" value="'+products[i].quantity+'"></td>';
				productHtml += '<td class="right">' + products[i].price  + '<input type="hidden" name="order_product[' + i + '][price]" value="'+products[i].price+'" /></td>';
				productHtml += '<td class="right">' + products[i].total;
				productHtml += '<input type="hidden" name="order_product[' + i + '][total]" value="' + products[i].total + '" />';
            	productHtml += '<input type="hidden" name="order_product[' + i + '][tax]" value="' + products[i].tax + '" />';
			    productHtml += '<input type="hidden" name="order_product[' + i + '][reward]" value="' + products[i].reward + '" />';
				productHtml += '</td>';
				
				productHtml += '</tr>';
			}
			
			$('#product-list tbody').html(productHtml);
			
			var html = '';
			
			if (json['products'] != '')
			{
				var products = json['products'];
				for(var i=0; i<products.length; i++)
				{
					var product = products[i];
					html += '<tr>';
					html += '<td class="left">' + product.name;
					
					if (product.option)
					{
						var option = product.option;
						for(var x=0; x<option.length; x++)
						{
							html += '<br /> - <small>' + option[x].name + ': ' + option[x].value + '</small>';
						}
					}
					
					html += '</td>';
					html += '<td class="left">' + product.model + '</td>';
					html += '<td class="right">' + product.quantity + '</td>';
					html += '<td class="right">' + product.price + '</td>';
					html += '<td class="right">' + product.total + '</td>';
					html += '</tr>';
				}
				
			}
			
			$('#product-totals').html(html);
			
			html = '';
			
			if (json['order_totals'] != '')
			{
				var totals = json['order_totals'];
			
				for(var i=0; i<totals.length; i++)
				{
					var total = totals[i];
					html += '<tr id="total-row' + i + '">';
					html += '<td class="right" colspan="4">' + total.title + ':</td>';
					html += '<td class="right">' + total.text + '</td>';
            		html += '</tr>';
				}
			}
			
			$('#ordertotals-total').html(html);
			
			html = '';
			
			if (json['payment_methods'])
			{
				html += '<tr>';
				html += '<td>';
				
				var payments = json['payment_methods'];
				
				for(var i=0; i<payments.length; i++)
				{
					var payment = payments[i];
					
					html += '<label>';
					html += '<input type="radio" name="payment_method" value="' + payment.code + '" id="' +payment.code+ '" class="radio inline" /> ';
					html += payment.title;
					html += '<br />' + payment.form +  '</label>';
					
				}
			}
			
			html += '</td>';
			html += '</tr>'
			
			$('#payment-method tbody').html(html);
			
			enable_payment_method();
		}
	})
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

<script>

enable_payment_method();

function enable_payment_method()
{
	$('#payment-method input[type=radio]').bind('change', function()
	{
		$('#payment-method div').hide();
		$(this).parent().find('div').show();
	});															   
}
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
					
					if (json['zone'] != '') {
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
					
					if (json['zone'] != '') {
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