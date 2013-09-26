<?php echo $header; ?>

<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>

	<div id="notification"></div>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left ?>

		<section id="maincontent" class="product-info <?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<div class="row-fluid">

					<div class="span5">

						<?php if ($thumb || $images) { ?>

							<?php if ($thumb) { ?>

								<div class="image">

								<?php if ($price && $special) { ?>
									<div class="onsale">
										<div class="ribbon">
											<?php $this->language->load('module/fortuna');
											echo $this->language->get('text_onsale'); ?>
										</div>
										<div class="ribbonshadow"></div>
									</div>
								<?php } ?>

								<!-- Cloud Zoom script BEGIN -->

								<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_cloud_zoom')!='') { ?>

									<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom colorbox" id='zoom1' rel="adjustX: 10, adjustY:-4, tint:'#000000',tintOpacity:0.2, zoomWidth:360, position:'inside', showTitle:false"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /><span id="zoom-image"><i class="icon-zoomin"></i> Zoom</span></a>

								<!-- Cloud Zoom script END -->

								<?php } else { ?>

									<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>

								<?php } ?>

								</div>

							<?php } ?>

							<?php if ($images) { ?>

								<div class="image-additional">

									<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_cloud_zoom')!='') { ?>

										<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' "><img src="<?php echo $thumb; ?>" width="62" height="62" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>

									<?php } ?>

									<?php foreach ($images as $image) { ?>

										<!-- Cloud Zoom script BEGIN -->

										<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_cloud_zoom')!='') { ?>

											<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' "><img src="<?php echo $image['thumb']; ?>" width="62" height="62" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>

										<!-- Cloud Zoom script END -->

										<?php } else { ?>
										
											<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $image['thumb']; ?>" width="62" height="62" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>

										<?php } ?>

									<?php } ?>

								</div>

							<?php } ?>

						<?php } ?> 

					</div> <!-- .span6 LEFT BOX-->

					<div class="span7">

						<div class="details">

							<header class="heading">
								<h1 class="page-header"><?php echo $heading_title; ?></h1>
							</header class="heading">

							<div class="row-fluid price-cart">

								<div class="price span6">

									<?php if ($price) { ?>
									
									<?php echo $text_price; ?>

									<?php if (!$special) { ?>
										<span class="price-normal"><?php echo $price; ?></span>
									<?php } else { ?>
										<span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
									<?php } ?>

									<?php if ($tax) { ?>
										<div class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></div>
									<?php } ?>

									<?php if ($points) { ?>
										<div class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></div>
									<?php } ?>

									<?php if ($discounts) { ?>
									<div class="discount">
										<ul>
										<?php foreach ($discounts as $discount) { ?>
											<li><?php echo sprintf($text_discount, $discount['quantity'], "<span>".$discount['price']."</span>"); ?></li>
										<?php } ?>
										</ul>
									</div>
									<?php } ?>
									
									<?php } ?>

								</div> <!-- .price -->

								<div class="cart span6">

									<div class="add-cart">

										<input type="text" name="quantity" value="<?php echo $minimum; ?>" class="input-mini" />
										<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

										<input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="btn btn-large btn-cart" />

										<?php if ($minimum > 1) { ?>
											<small class="minimum"><?php echo $text_minimum; ?></small>
										<?php } ?>

									</div> <!-- .add_cart -->

								</div> <!-- .cart -->

							</div>

							<div class="row-fluid">

								<div class="span6">

									<div class="description">

										<?php if ($manufacturer) { ?>
											<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
										<?php } ?>
											
											<span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
											<span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
											<span><?php echo $text_stock; ?></span> <?php echo $stock; ?>

									</div> <!-- .description -->

									<?php if ($options) { ?>
									
										<div class="options">
											
											<h4><?php echo $text_option; ?></h4><br>

											<?php foreach ($options as $option) { ?>

												<!-- Select -->
											
												<?php if ($option['type'] == 'select') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">
														
														<label for="option[<?php echo $option['product_option_id']; ?>]">
															
															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<select name="option[<?php echo $option['product_option_id']; ?>]" class="span10">
																<option value=""><?php echo $text_select; ?></option>
																
																<?php foreach ($option['option_value'] as $option_value) { ?>
																	
																	<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
																	
																	<?php if ($option_value['price']) { ?>
																		(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
																	<?php } ?>

																	</option>

																<?php } ?>
															</select>
														</div>

													</div>

												<?php } ?>

												<!-- Radio -->

												<?php if ($option['type'] == 'radio') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label class="control-label">

															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<?php foreach ($option['option_value'] as $option_value) { ?>						
															
															<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio">
																
																<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />

																<?php echo $option_value['name']; ?>

																<?php if ($option_value['price']) { ?>
																	(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
																<?php } ?>

															</label>

														<?php } ?>

													</div>

												<?php } ?>

												<!-- Checkbox -->

												<?php if ($option['type'] == 'checkbox') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label class="control-label">
															
															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<?php foreach ($option['option_value'] as $option_value) { ?>
														
															<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="checkbox">
																<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
														
																<?php echo $option_value['name']; ?>
														
																<?php if ($option_value['price']) { ?>
																	(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
																<?php } ?>
														
															</label>
														
														<?php } ?>
													
													</div>

												<?php } ?>

												<!-- Image -->

												<?php if ($option['type'] == 'image') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label class="control-label">

															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<?php foreach ($option['option_value'] as $option_value) { ?>						
															
															<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio option-image">
																
																<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />

																<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />

																<?php if ($option_value['price']) { ?>
																	(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
																<?php } ?>

															</label>

														<?php } ?>

													</div>

												<?php } ?>

												<!-- Text field -->

												<?php if ($option['type'] == 'text') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">
															
															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>"  class="span10" />
														</div>

													</div>

												<?php } ?>

												<!-- Textarea -->

												<?php if ($option['type'] == 'textarea') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">
															
															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"  class="span10"><?php echo $option['option_value']; ?></textarea>
														</div>

													</div>

												<?php } ?>

												<!-- File -->

												<?php if ($option['type'] == 'file') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">

															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<a id="button-option-<?php echo $option['product_option_id']; ?>" class="btn btn-success btn-small"><i class="icon-upload icon-white"></i> <?php echo $button_upload; ?></a>
															<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
														</div>

													</div>

												<?php } ?>

												<!-- Date -->

												<?php if ($option['type'] == 'date') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="contro-label">

															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date span5" />
														</div>

													</div>

												<?php } ?>

												<!-- Date time -->

												<?php if ($option['type'] == 'datetime') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">

															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime span7" />
														</div>

													</div>

												<?php } ?>

												<!-- Time -->

												<?php if ($option['type'] == 'time') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">
															
															<?php if ($option['required']) { ?>
																<span class="req_mark">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time span5" />
														</div>

													</div>

												<?php } ?>

											<?php } ?>

										</div> <!-- .options -->

									<?php } ?>

								</div>

								<div class="span6">

									<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_hide_wishlist')=='') { ?>
									<div class="wishlist"><a onclick="addToWishList('<?php echo $product_id; ?>');" title="<?php echo $button_wishlist; ?>"><i class="icon-wishlist"></i> <?php echo $button_wishlist; ?></a></div>
									<?php } ?>

									<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_hide_compare')=='') { ?>
									<div class="compare"><a onclick="addToCompare('<?php echo $product_id; ?>');" title="<?php echo $button_compare; ?>"><i class="icon-compare"></i> <?php echo $button_compare; ?></a></div>
									<?php } ?>
							
									<?php if ($review_status) { ?>

										<div class="review">

											<a onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('#add-review').offset().top}, 800);"><i class="icon-review"></i> <?php echo $text_write; ?></a><br>
											<img src="catalog/view/theme/fortuna/images/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /> <a onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('#tabs').offset().top}, 800);"><?php echo $reviews; ?></a>

										</div>

									<?php } ?>

									<div class="share">

										<!-- AddThis button BEGIN -->

										<div class="addthis_default_style">
											<a class="addthis_button_compact"><?php //echo $text_share; ?></a> 
											<a class="addthis_button_email"></a>
											<a class="addthis_button_twitter"></a>
											<a class="addthis_button_google_plusone"></a>
											<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
										</div>
										<script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js"></script> 
										
										<!-- AddThis button END --> 

									</div>

									<?php if ($tags) { ?>

										<div class="tags">
											<b><?php echo $text_tags; ?></b>
											
											<?php foreach ($tags as $tag) { ?>
												<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>
											<?php } ?>
										
										</div>

									<?php } ?>

								</div>

							</div>

							<section id="full-info">

								<div class="tabbable">

									<ul id="tabs" class="nav nav-tabs">

										<li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>

										<?php if ($attribute_groups) { ?>
										<li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
										<?php } ?>

										<?php if ($review_status) { ?>
										<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
										<?php } ?>

									</ul> <!-- .nav-tabs -->

									<div class="tab-content">

										<div id="tab-description" class="tab-pane active">

											<div class="row-fluid">

											<div class="span12"><?php echo $description; ?></div>

											</div>

										</div> <!-- #tab-description -->

										<?php if ($attribute_groups) { ?>

										<div id="tab-attribute" class="tab-pane">

											<!-- <h3 class="page-header"><?php echo $tab_attribute; ?></h3> -->

											<section class="product-atrributes">
											
												<table class="table attribute">

													<?php foreach ($attribute_groups as $attribute_group) { ?>

													<thead>
														<tr>
															<td colspan="2"><?php echo $attribute_group['name']; ?></td>
														</tr>
													</thead>

													<tbody>
														<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
														<tr>
															<th><?php echo $attribute['name']; ?></th>
															<td><?php echo $attribute['text']; ?></td>
														</tr>
														<?php } ?>
													</tbody>

													<?php } ?>

												</table>

											</section> <!-- .product-atrributes -->

										</div>

										<?php } ?>
									

										<?php if ($review_status) { ?>

										<div id="tab-review" class="tab-pane">
											
											<section id="list-reviews">
												<div id="review"></div>
											</section>
											
											<section id="add-review">

												<div id="review-form">

													<div class="contentset center" id="review-title">
														<h4 class="inner">
															<span><?php echo $text_write; ?></span>
														</h4>
													</div>

													<div class="control-group">
														
														<label class="label-group"><span class="req_mark">*</span> <b><?php echo $entry_name; ?></b></label>

														<div class="controls">
															<input type="text" name="name" value="" class="span12" required />
														</div>

													</div>

													<div class="control-group">

														<label class="label-group"><span class="req_mark">*</span> <b><?php echo $entry_review; ?></b></label>

														<div class="controls"><textarea name="text" cols="40" rows="8" class="span12" required ></textarea>
														</div>

														<small><?php echo $text_note; ?></small>

													</div>

													<div class="control-group">

														<label class="label-group"><span class="req_mark">*</span> <b><?php echo $entry_rating; ?></b></label> 
															
														<div class="controls">
															
															<span><?php echo $entry_bad; ?></span>
															
															<input type="radio" name="rating" value="1" />
															<input type="radio" name="rating" value="2" />
															<input type="radio" name="rating" value="3" />
															<input type="radio" name="rating" value="4" />
															<input type="radio" name="rating" value="5" />
															
															<span><?php echo $entry_good; ?></span>
														
														</div>

													</div>

													<div class="control-group">

														<label for="captcha" class="control-label"><b><?php echo $entry_captcha; ?></b></label>

														<div class="controls">
															<input type="text" name="captcha" id="captcha" value="" class="span4" />
														</div>

													</div>

													<img src="index.php?route=product/product/captcha" alt="" />
													
													<div class="form-actions">
														<a id="button-review" class="btn btn-inverse"><span><?php echo $button_continue; ?></span></a>
													</div>

												</div> <!-- #review-form -->

											</section> <!-- #add-review -->

										</div> <!-- #tab-review -->

										<?php } ?>

									</div> <!-- .tab-content -->

								</div>

							</section> <!-- #full-info -->

						</div>			

					</div> <!-- .span6 RIGHT BOX-->

				</div>

			</div>

		</section>

	</div>


	<?php if ($products) { ?>

	<section id="related-products" class="es-carousel-wrapper top-arrows">

		<h4 class="module-header"><?php echo $tab_related; ?></h4>

		<div class="es-carousel">

			<ul>

			<?php foreach ($products as $product) {  ?>
				
				<li>
					<div class="inner">

						<?php if ($product['price'] && $product['special']) { ?>
							<div class="onsale">
								<div class="ribbon">
									<?php $this->language->load('module/fortuna');
									echo $this->language->get('text_onsale'); ?>
								</div>
								<div class="ribbonshadow"></div>
							</div>
						<?php } ?>

						<?php if ($product['thumb']) { ?>
						<div class="image">
							<a href="<?php echo $product['href']; ?>">
								<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
							</a>
						</div>
						<?php } ?>

						<div class="name">
							<a href="<?php echo $product['href']; ?>">
								<?php echo $product['name']; ?>
							</a>
						</div>

						<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
						</div>
						<?php } ?>

						<?php if ($product['rating']) { ?>
						<div class="rating">
							<img src="catalog/view/theme/fortuna/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
						</div>
						<?php } ?>

						<div class="cart">
							<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart btn-small" />
						</div>

					</div> <!-- .inner -->
				</li>

			<?php } ?>

			</ul>

	  </div>

	</section> <!-- .es-carousel-wrapper -->

	<?php } ?>


	<?php echo $content_bottom; ?>

	<script type="text/javascript">

		$('#related-products').elastislide({

			speed       : 450,	// animation speed
			easing      : '',	// animation easing effect
			imageW		: 180, 	// the images width
			minItems	: 2,
			easing		: 'jswing',
			border		: 1
		});

		//Fix to adjust on windows resize
		$(window).triggerHandler('resize.elastislide');

	</script>

	<script type="text/javascript">

		$('#button-cart').bind('click', function() {

			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
				dataType: 'json',
				success: function(json) {
					$('.alert, .success, .warning, .attention, .information, .error').remove();
					
					if (json['error']) {
						if (json['error']['option']) {
							for (i in json['error']['option']) {
								$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
							}
						}
					} 	 
								
					if (json['success']) {
						$('#notification').html('<div class="alert success">' + json['success'] + '<a class="close" data-dismiss="alert" href="#">&times;</a></div>');
							
						$('.success').fadeIn('slow');
							
						$('#cart-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});

		});

	</script>


	<?php if ($options) { ?>

		<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>

		<?php foreach ($options as $option) { ?>

			<?php if ($option['type'] == 'file') { ?>

				<script type="text/javascript">

					new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
						action: 'index.php?route=product/product/upload',
						name: 'file',
						autoSubmit: true,
						responseType: 'json',
						onSubmit: function(file, extension) {
							$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/fortuna/images/loading.gif" class="loading" style="padding-left: 5px;" />');
						},
						onComplete: function(file, json) {
							$('.error').remove();
							
							if (json.success) {
								alert(json.success);
								
								$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json.file);
							}
							
							if (json.error) {
								$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json.error + '</span>');
							}
							
							$('.loading').remove();	
						}
					});

				</script>

			<?php } ?>

		<?php } ?>

	<?php } ?>


	<script type="text/javascript">

		$('#review .paginate a').live('click', function() {

			$('#review').slideUp('slow');
				
			$('#review').load(this.href);
			
			$('#review').slideDown('slow');
			
			return false;
		});			

		$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

		$('#button-review').bind('click', function() {

			$.ajax({
				type: 'POST',
				url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
				dataType: 'json',
				data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
				beforeSend: function() {
					$('.success, .warning').remove();
					$('#button-review').attr('disabled', true);
					$('#review-title').after('<div class="alert attention"><img src="catalog/view/theme/fortuna/images/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
				},
				complete: function() {
					$('#button-review').attr('disabled', false);
					$('.attention').remove();
				},
				success: function(data) {
					if (data.error) {
						$('#review-title').after('<div class="alert warning">' + data.error + '</div>');
					}
					
					if (data.success) {
						$('#review-title').after('<div class="alert success">' + data.success + '</div>');
										
						$('input[name=\'name\']').val('');
						$('textarea[name=\'text\']').val('');
						$('input[name=\'rating\']:checked').attr('checked', '');
						$('input[name=\'captcha\']').val('');
					}
				}
			});
		});

	</script> 

	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>

	<script type="text/javascript">
		
		if ($.browser.msie && $.browser.version == 6) {
			$('.date, .datetime, .time').bgIframe();
		}

		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});
		$('.time').timepicker({timeFormat: 'h:m'});
	
	</script> 


<?php echo $footer; ?>