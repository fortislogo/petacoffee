<div class="row-fluid">

	<div class="span6">

	<fieldset class="subheading">
		
		<legend><?php echo $text_your_details; ?></legend>
		
		<div class="control-group">
			<label for="firstname" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_firstname; ?>
			</label>
			<div class="controls">
				<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="span11" />
			</div>
		</div>

		<div class="control-group">
			<label for="lastname" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_lastname; ?>
			</label>
			<div class="controls">
				<input type="text" name="lastname" value="<?php echo $lastname; ?>" class="span11" />
			</div>
		</div>

		<div class="control-group">
			<label for="email" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_email; ?>
			</label>
			<div class="controls">
				<input type="text" name="email" value="<?php echo $email; ?>" class="span11" />
			</div>
		</div>

		<div class="control-group">
			<label for="telephone" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_telephone; ?>
			</label>
			<div class="controls">
				<input type="text" name="telephone" value="<?php echo $telephone; ?>" class="span11" />
			</div>
		</div>

		<div class="control-group">
			<label for="fax" class="control-label">
				<?php echo $entry_fax; ?>
			</label>
			<div class="controls">
				<input type="text" name="fax" value="<?php echo $fax; ?>" class="span11" />
			</div>
		</div>

	</fieldset>

	</div>

	<div class="span6">
		
		<fieldset class="subheading">

			<legend><?php echo $text_your_address; ?></legend>
			
			<div class="control-group">
				<label for="company" class="control-label">
					<?php echo $entry_company; ?>
				</label>
				<div class="controls">
					<input type="text" name="company" value="<?php echo $company; ?>" class="span11" />
				</div>
			</div>
			<div class="control-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
				<label for="customer_group_id" class="control-label">
					<?php echo $entry_account; ?>
				</label>
				<div class="controls">
					<select name="customer_group_id" class="span11">
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
					<input type="text" name="company_id" value="<?php echo $company_id; ?>" class="span11" />
				</div>
			</div>
			<div id="tax-id-display" class="control-group">
				<label for="tax_id" class="control-label">
					<span id="tax-id-required" class="req_mark">*</span> <?php echo $entry_tax_id; ?>
				</label>
				<div class="controls">
					<input type="text" name="tax_id" value="<?php echo $tax_id; ?>" class="span11" />
				</div>
			</div>
			<div class="control-group">
				<label for="address_1" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_address_1; ?>
				</label>
				<div class="controls">
					<input type="text" name="address_1" value="<?php echo $address_1; ?>" class="span11" />
				</div>
			</div>
			<div class="control-group">
				<label for="address_2" class="control-label">
					<?php echo $entry_address_2; ?>
				</label>
				<div class="controls">
					<input type="text" name="address_2" value="<?php echo $address_2; ?>" class="span11" />
				</div>
			</div>
			<div class="control-group">
				<label for="city" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_city; ?>
				</label>
				<div class="controls">
					<input type="text" name="city" value="<?php echo $city; ?>" class="span11" />
				</div>
			</div>
			<div class="control-group">
				<label for="postcode" class="control-label">
					<span id="payment-postcode-required" class="req_mark">*</span> <?php echo $entry_postcode; ?>
				</label>
				<div class="controls">
					<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="span11" />
				</div>
			</div>
			<div class="control-group">
				<label for="country_id" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_country; ?>
				</label>
				<div class="controls">
					<select name="country_id" class="span11">
						<option value=""><?php echo $text_select; ?></option>
						<?php foreach ($countries as $country) { ?>
						<?php if ($country['country_id'] == $country_id) { ?>
						<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
						<?php } ?>
					<?php } ?>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label for="zone_id" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_zone; ?>
				</label>
				<div class="controls">
					<select name="zone_id" class="span11"></select>
				</div>
			</div>
	 
		</fieldset>
		
		<?php if ($shipping_required) { ?>

		<div class="control-group">
			<label for="shipping">
				<input type="checkbox" name="shipping_address" value="1" id="shipping" <?php if ($shipping_address) { ?> checked="checked" <?php } ?> class="checkbox inline" />
				<?php echo $entry_shipping; ?>
			</label>
		</div>
		
		<?php } ?>

	</div>

</div>

<div class="buttons">
	<input type="button" value="<?php echo $button_continue; ?>" id="button-guest" class="btn btn-inverse" />
</div>

<script type="text/javascript"><!--

	$('#payment-address select[name=\'customer_group_id\']').live('change', function() {
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

	$('#payment-address select[name=\'customer_group_id\']').trigger('change');

//--></script>

<script type="text/javascript"><!--

	$('#payment-address select[name=\'country_id\']').bind('change', function() {

		$.ajax({
			url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
			dataType: 'json',
			beforeSend: function() {
				$('#payment-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/fortuna/images/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('.wait').remove();
			},			
			success: function(json) {
				if (json['postcode_required'] == '1') {
					$('#payment-postcode-required').show();
				} else {
					$('#payment-postcode-required').hide();
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
				
				$('#payment-address select[name=\'zone_id\']').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});

	$('#payment-address select[name=\'country_id\']').trigger('change');

//--></script>