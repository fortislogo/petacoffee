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
		
				<p><?php echo $text_account_already; ?></p>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="register-form" class="form-horizontal">

					<fieldset class="subheading">

						<legend><?php echo $text_your_details; ?></legend>

						<div class="control-group">
							<label class="control-label" for="firstname">
								<span class="req_mark">*</span> <?php echo $entry_firstname; ?>
							</label>
							<div class="controls">
								<input type="text" name="firstname" id="firstname" value="<?php echo $firstname; ?>" title="<?php echo $this->language->get('error_firstname'); ?>" class="required span3" required />
								<?php if ($error_firstname) { ?>
								<span class="error"><?php echo $error_firstname; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="lastname">
								<span class="req_mark">*</span> <?php echo $entry_lastname; ?>
							</label>
							<div class="controls">
								<input type="text" name="lastname" id="lastname" value="<?php echo $lastname; ?>" title="<?php echo $this->language->get('error_lastname'); ?>" class="required span3" required />
								<?php if ($error_lastname) { ?>
								<span class="error"><?php echo $error_lastname; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="email">
								<span class="req_mark">*</span> <?php echo $entry_email; ?>
							</label>
							<div class="controls">
								<input type="email" name="email" id="email" value="<?php echo $email; ?>"  title="<?php echo $this->language->get('error_email'); ?>" class="required email span3" required />
								<?php if ($error_email) { ?>
								<span class="error"><?php echo $error_email; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="telephone">
								<span class="req_mark">*</span> <?php echo $entry_telephone; ?>
							</label>
							<div class="controls">
								<input type="tel" name="telephone" id="telephone" value="<?php echo $telephone; ?>" title="<?php echo $this->language->get('error_telephone'); ?>" class="required span3" required />
								<?php if ($error_telephone) { ?>
								<span class="error"><?php echo $error_telephone; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="fax"><?php echo $entry_fax; ?></label>
							<div class="controls">
								<input type="text" name="fax" id="fax" value="<?php echo $fax; ?>" class="span3" />
							</div>
						</div>

					</fieldset>

					<fieldset class="subheading">

						<legend><?php echo $text_your_address; ?></legend>

						<div class="control-group">
							<label class="control-label" for="company"><?php echo $entry_company; ?></label>
							<div class="controls">
								<input type="text" name="company" id="company" value="<?php echo $company; ?>" class="span3" />
							</div>
						</div>

						<div class="control-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
							<label for="customer_group_id" class="control-label">
								<?php echo $entry_account; ?>
							</label>
							<div class="controls">
								<select name="customer_group_id" class="span3">
									<?php foreach ($customer_groups as $customer_group) { ?>
									<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
										<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>

				  		<div id="company-id-display" class="control-group">
							<label for="company_id" class="control-label">
								<span id="company-id-required" class="req_mark">*</span> <?php echo $entry_company_id; ?>
							</label>
							<div class="controls">
								<input type="text" name="company_id" value="" title="<?php echo $this->language->get('error_company_id'); ?>" class="span3" />
								<?php if ($error_company_id) { ?>
					            <span class="error"><?php echo $error_company_id; ?></span>
					            <?php } ?>
							</div>
						</div>

						<div id="tax-id-display" class="control-group">
							<label for="tax_id" class="control-label">
								<span id="tax-id-required" class="req_mark">*</span> <?php echo $entry_tax_id; ?>
							</label>
							<div class="controls">
								<input type="text" name="tax_id" value="" title="<?php echo $this->language->get('error_tax_id'); ?>" class="span3" />
								<?php if ($error_tax_id) { ?>
					            <span class="error"><?php echo $error_tax_id; ?></span>
					            <?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="address_1">
								<span class="req_mark">*</span> <?php echo $entry_address_1; ?>
							</label>
							<div class="controls">
								<input type="text" name="address_1" id="address_1" value="<?php echo $address_1; ?>" title="<?php echo $this->language->get('error_address_1'); ?>" class="required span3" required />
								<?php if ($error_address_1) { ?>
								<span class="error"><?php echo $error_address_1; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="address_2"><?php echo $entry_address_2; ?></label>
							<div class="controls">
								<input type="text" name="address_2" id="address_2" value="<?php echo $address_2; ?>" class="span3" />
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="city">
								<span class="req_mark">*</span> <?php echo $entry_city; ?>
							</label>
							<div class="controls">
								<input type="text" name="city" id="city" value="<?php echo $city; ?>" title="<?php echo $this->language->get('error_city'); ?>" class="required span3" required />
								<?php if ($error_city) { ?>
								<span class="error"><?php echo $error_city; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="postcode">
								<span id="postcode-required" class="req_mark">*</span> <?php echo $entry_postcode; ?>
							</label>
							<div class="controls">
								<input type="text" name="postcode" id="postcode" value="<?php echo $postcode; ?>" title="<?php echo $this->language->get('error_postcode'); ?>" class="required span3" required />
								<?php if ($error_postcode) { ?>
								<span class="error"><?php echo $error_postcode; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="country_id">
								<span class="req_mark">*</span> <?php echo $entry_country; ?>
							</label>
							<div class="controls">
								<select name="country_id" id="country_id" title="<?php echo $this->language->get('error_country'); ?>" class="required span3" required >

									<option value="false"><?php echo $text_select; ?></option>

									<?php foreach ($countries as $country) { ?>
										
										<?php if ($country['country_id'] == $country_id) { ?>
									
											<option value="<?php echo $country['country_id']; ?>" selected="selected">
												<?php echo $country['name']; ?>
											</option>

										<?php } else { ?>
										
											<option value="<?php echo $country['country_id']; ?>">
												<?php echo $country['name']; ?>
											</option>
										
										<?php } ?>
									
									<?php } ?>

								</select>
								<?php if ($error_country) { ?>
								<span class="error"><?php echo $error_country; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="zone_id">
								<span class="req_mark">*</span> <?php echo $entry_zone; ?>
							</label>
							<div class="controls">
								<select name="zone_id" id="zone_id" title="<?php echo $this->language->get('error_zone'); ?>" class="required span3" required>
								</select>
								<?php if ($error_zone) { ?>
								<span class="error"><?php echo $error_zone; ?></span>
								<?php } ?>
							</div>
						</div>

					</fieldset>

					<fieldset class="subheading">

						<legend><?php echo $text_your_password; ?></legend>

						<div class="control-group">
							<label class="control-label" for="password">
								<span class="req_mark">*</span> <?php echo $entry_password; ?>
							</label>
							<div class="controls">
								<input type="password" name="password" id="password" value="<?php echo $password; ?>" title="<?php echo $this->language->get('error_password'); ?>" class="password span3" required />
								<?php if ($error_password) { ?>
									<span class="error"><?php echo $error_password; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="confirm">
								<span class="req_mark">*</span> <?php echo $entry_confirm; ?>
							</label>
							<div class="controls">
								<input type="password" name="confirm" id="confirm" value="<?php echo $confirm; ?>"  title="<?php echo $this->language->get('error_password'); ?>" class="password span3" required />
								<?php if ($error_confirm) { ?>
									<span class="error"><?php echo $error_confirm; ?></span>
								<?php } ?>
							</div>
						</div>

					</fieldset>

					<fieldset class="subheading">

						<legend><?php echo $text_newsletter; ?></legend>

						<div class="control-group">
							<label class="control-label"><?php echo $entry_newsletter; ?></label>
							<div class="controls">
								<?php if ($newsletter == 1) { ?>
									<label class="radio inline"><input type="radio" name="newsletter" value="1" checked="checked" /><?php echo $text_yes; ?></label>
									<label class="radio inline"><input type="radio" name="newsletter" value="0" /><?php echo $text_no; ?></label>
								<?php } else { ?>
									<label class="radio inline"><input type="radio" name="newsletter" value="1" /><?php echo $text_yes; ?></label>
									<label class="radio inline"><input type="radio" name="newsletter" value="0" checked="checked" /><?php echo $text_no; ?></label>
								<?php } ?>
							</div>
						</div>

					</fieldset>

					<div class="form-actions">
							
						<?php if ($text_agree) { ?>
							<p>
								<?php echo $text_agree; ?> <input type="checkbox" name="agree" value="1" <?php if ($agree) { ?> checked="checked" <?php } ?> />
							</p>
						<?php } ?>
						
						<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
						
					</div>
					
				</form>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

	<script type="text/javascript"><!--

		$('select[name=\'customer_group_id\']').live('change', function() {
			var customer_group = [];
			
		<?php foreach ($customer_groups as $customer_group) { ?>
			customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
		<?php } ?>	

			if (customer_group[this.value]) {
				if (customer_group[this.value]['company_id_display'] == '1') {
					$('#company-id-display').show();
				} else {
					$('#company-id-display').hide();
				}
				
				if (customer_group[this.value]['company_id_required'] == '1') {
					$('#company-id-required').show();
				} else {
					$('#company-id-required').hide();
				}
				
				if (customer_group[this.value]['tax_id_display'] == '1') {
					$('#tax-id-display').show();
				} else {
					$('#tax-id-display').hide();
				}
				
				if (customer_group[this.value]['tax_id_required'] == '1') {
					$('#tax-id-required').show();
				} else {
					$('#tax-id-required').hide();
				}	
			}
		});

		$('select[name=\'customer_group_id\']').trigger('change');
		
	//--></script>

	<script type="text/javascript"><!--
		
		$('select[name=\'country_id\']').bind('change', function() {
			$.ajax({
				url: 'index.php?route=account/register/country&country_id=' + this.value,
				dataType: 'json',
				beforeSend: function() {
					$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/fortuna/images/loading.gif" alt="" /></span>');
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
			    			
							if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
			      				html += ' selected="selected"';
			    			}
			
			    			html += '>' + json['zone'][i]['name'] + '</option>';
						}
					} else {
						html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
					}
					
					$('select[name=\'zone_id\']').html(html);
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});

		$('select[name=\'country_id\']').trigger('change');

	//--></script>

<?php echo $footer; ?>