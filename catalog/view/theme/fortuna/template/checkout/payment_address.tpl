<div class="row-fluid">

	<div class="span12">

		<?php if ($addresses) { ?>

			<label class="radio">
				<input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="checked" class="radio inline" />
				<b><?php echo $text_address_existing; ?></b>
			</label>

			<div id="payment-existing" class="controls">

				<select name="address_id" class="span12" size="5">

					<?php foreach ($addresses as $address) { ?>

						<?php if ($address['address_id'] == $address_id) { ?>
						
							<option value="<?php echo $address['address_id']; ?>" selected="selected">
								<?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?>
							</option>

						<?php } else { ?>

							<option value="<?php echo $address['address_id']; ?>">
								<?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?>
							</option>

						<?php } ?>

					<?php } ?>

				</select>

			</div>

		<?php } ?>
		
		<label class="radio">
			<input type="radio" name="payment_address" value="new" id="payment-address-new" class="radio inline" />
			<b><?php echo $text_address_new; ?></b>
		</label><br>

		<div id="payment-new" style="display: none;" >
			<div class="control-group">
				<label for="firstname" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_firstname; ?>
				</label>
				<div class="controls">
					<input type="text" name="firstname" value="" class="span6" />
				</div>
			</div>
			<div class="control-group">
				<label for="lastname" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_lastname; ?>
				</label>
				<div class="controls">
					<input type="text" name="lastname" value="" class="span6" />
				</div>
			</div>
			<div class="control-group">
				<label for="company" class="control-label">
					<?php echo $entry_company; ?>
				</label>
				<div class="controls">
				<input type="text" name="company" value="" class="span6" />
				</div>
			</div>
			<div class="control-group" style="display: <?php echo ($company_id_display ? 'block' : 'none'); ?>;">
				<label for="company_id" class="control-label">
					<span class="req_mark" style="display: <?php echo ($company_id_required ? 'inline' : 'none'); ?>;">*</span> <?php echo $entry_company_id; ?>
				</label>
				<div class="controls">
				<input type="text" name="company_id" value="" class="span6" />
				</div>
			</div>
			<div class="control-group" style="display: <?php echo ($tax_id_display ? 'block' : 'none'); ?>;">
				<label for="tax_id" class="control-label">
					<span class="req_mark" style="display: <?php echo ($tax_id_required ? 'inline' : 'none'); ?>;">*</span> <?php echo $entry_tax_id; ?>
				</label>
				<div class="controls">
				<input type="text" name="tax_id" value="" class="span6" />
				</div>
			</div>
			<div class="control-group">
				<label for="address_1" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_address_1; ?>
				</label>
				<div class="controls">
				<input type="text" name="address_1" value="" class="span6" />
				</div>
			</div>
			<div class="control-group">
				<label for="address_2" class="control-label">
					<?php echo $entry_address_2; ?>
				</label>
				<div class="controls">
				<input type="text" name="address_2" value="" class="span6" />
				</div>
			</div>
			<div class="control-group">
				<label for="city" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_city; ?>
				</label>
				<div class="controls">
				<input type="text" name="city" value="" class="span6" />
				</div>
			</div>
			<div class="control-group">
				<label for="postcode" class="control-label">
					<span id="payment-postcode-required" class="req_mark">*</span> <?php echo $entry_postcode; ?>
				</label>
				<div class="controls">
				<input type="text" name="postcode" value="" class="span6" />
				</div>
			</div>
			<div class="control-group">
				<label for="country_id" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_country; ?>
				</label>
				<div class="controls">
				<select name="country_id" class="span6" >
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
				<label for="postcode" class="control-label">
					<span class="req_mark">*</span> <?php echo $entry_zone; ?>
				</label>
				<div class="controls">
					<select name="zone_id" class="span6"></select>
				</div>
			</div>	
		</div>

		<div class="buttons">
			<input type="button" value="<?php echo $button_continue; ?>" id="button-payment-address" class="btn btn-inverse" />
		</div>

	</div>

</div>

<script type="text/javascript"><!--

	$('#payment-address input[name=\'payment_address\']').live('change', function() {
		if (this.value == 'new') {
			$('#payment-existing').hide();
			$('#payment-new').show();
		} else {
			$('#payment-existing').show();
			$('#payment-new').hide();
		}
	});
	
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