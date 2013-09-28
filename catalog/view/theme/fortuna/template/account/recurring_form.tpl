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
				
						<?php foreach ($products as $product) { ?>
						<tr>
							<td class="name">
								<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
								<?php foreach ($product['option'] as $option) { ?>
								<br />
								<small> - <?php echo $option['name']; ?>: <?php echo $option['option_value']; ?></small>
								<?php } ?>
							</td>
							<td class="model"><?php echo $product['model']; ?></td>
							<td class="quantity" style="text-align:right">
                            	<input type="text" name="product[<?php echo $product['recurring_product_id']; ?>][quantity]" value="<?php echo $product['quantity']; ?>">
                                <input type="image" class="update-cart" src="catalog/view/theme/fortuna/images/update.png" alt="Update" title="Update" />
								<a href="<?php echo $product['remove']; ?>" title="Remove"><img src="catalog/view/theme/fortuna/images/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>
                            </td>
							<td class="price right"><?php echo $product['price']; ?></td>
							<td class="total right"><?php echo $product['total']; ?></td>
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
									Delivery Details
								</td>
							</tr>
						</thead>
                        
                        <?php if ($addresses) { ?>
                        
                        <tr>
                        	<td>
								<select name="address_id" style="width:100%" size="5">
								<?php foreach ($addresses as $address) { ?>
								<?php if ($address['address_id'] == $shipping_address_id) { ?>
								<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
								<?php } ?>
								<?php } ?>
								</select>
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
										<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" class="radio inline" />
	
										<?php echo $quote['title']; ?> (<b><?php echo $quote['text']; ?></b>)
									
                                    </label><br />
			
            						<?php } ?>

								<?php } ?>
                                
                            </td>    
						
                        </tr>	
                        
                        <?php } ?>
                    	
                    </table>
                    
                    <table class="table table-bordered">
                    	
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
									<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" class="radio inline" />
									<?php echo $payment_method['title']; ?>
								</label> <br />

								<?php } ?>
                                
                           </td>     
                           
                        </tr>   
                        
                        <?php } ?>
                    
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
	data  = '#add-product input[type=\'text\'], #add-product input[type=\'hidden\'], #add-product input[type=\'radio\']:checked, #add-product input[type=\'checkbox\']:checked, #add-product select, #add-product textarea, ';

	$.ajax({
		url: '<?php echo HTTP_SERVER; ?>/?route=account/recurring/addproduct&id=<?php echo $this->request->get['id']; ?>',
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
					
					html += '<tr>';
					html += '  <td><a href="">' + product['name'] + '</a>';
					
					if (product['option']) 
					{
						for (j = 0; j < product['option'].length; j++) 
						{
							option = product['option'][j];							
							html += '  <br />- <small>' + option['name'] + ': ' + option['option_value'] + '</small>';
							option_row++;
						}
					}
					
					html += '  </td>';
					html += '  <td class="left">' + product['model'] + '<input type="hidden" name="order_product[' + product_row + '][model]" value="' + product['model'] + '" /></td>';
					html += '  <td class="quantity" style="text-align:right"><input type="text" name="product['+product['recurring_product_id']+'][quantity]" value="'+product['quantity']+'"> <input type="image" class="update-cart" src="catalog/view/theme/fortuna/images/update.png" alt="Update" title="Update" /> <a href="'+product['remove']+'" title="Remove"><img src="catalog/view/theme/fortuna/images/remove.png" alt="Remove" title="Remove" /></a></td>';
					html += '  <td class="right">' + product['price'] + '<input type="hidden" name="order_product[' + product_row + '][price]" value="' + product['price'] + '" /></td>';
					html += '  <td class="right">' + product['total'] + '<input type="hidden" name="order_product[' + product_row + '][total]" value="' + product['total'] + '" /><input type="hidden" name="order_product[' + product_row + '][tax]" value="' + product['tax'] + '" /><input type="hidden" name="order_product[' + product_row + '][reward]" value="' + product['reward'] + '" /></td>';
					html += '</tr>';
					
					product_row++;			
				}
				
				$('#product-list tbody').html(html);
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
	<?php echo $footer; ?>