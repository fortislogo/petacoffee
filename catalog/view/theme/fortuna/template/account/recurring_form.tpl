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

				

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="return" class="form-horizontal">
                
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
                            	<select name="recurring_frequency">
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
                            <td><input type="input" name="next_order_date" value="<?php echo $next_order_date; ?>"></td>
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
                    
                    
                    <table class="table table-bordered">
                    	
                        <thead>
							<tr>
								<td>
									PRODUCT NAME
								</td>
                                <td>
									MODEL
								</td>
                                <td>
									QUANTITY
								</td>
                                <td>
									PRICE 
								</td>
                                <td>
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
							<td class="quantity"><?php echo $product['quantity']; ?></td>
							<td class="price right"><?php echo $product['price']; ?></td>
							<td class="total right"><?php echo $product['total']; ?></td>
						</tr>
	
					<?php } ?>
	
	
			</tbody>
                        
                        
                    	
                    </table>
                    
                    <div class="form-actions">
						<a href="" class="btn btn-inverse"><span>Update Recurring Order</span></a>
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

	<?php echo $footer; ?>