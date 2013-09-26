<div class="row-fluid">
	<div class="span12">

		<div class="control-group">
			<label for="firstname" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_firstname; ?>
			</label>
			<div class="controls">
				<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="span6" />
			</div>
		</div>

		<div class="control-group">
			<label for="lastname" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_lastname; ?>
			</label>
			<div class="controls">
				<input type="text" name="lastname" value="<?php echo $lastname; ?>" class="span6" />
			</div>
		</div>

		<div class="control-group">
			<label for="company" class="control-label">
				<?php echo $entry_company; ?>
			</label>
			<div class="controls">
				<input type="text" name="company" value="<?php echo $company; ?>" class="span6" />
			</div>
		</div>

		<div class="control-group">
			<label for="address_1" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_address_1; ?>
			</label>
			<div class="controls">
				<input type="text" name="address_1" value="<?php echo $address_1; ?>" class="span6" />
			</div>
		</div>

		<div class="control-group">
			<label for="address_2" class="control-label">
				<?php echo $entry_address_2; ?>
			</label>
			<div class="controls">
				<input type="text" name="address_2" value="<?php echo $address_2; ?>" class="span6" />
			</div>
		</div>

		<div class="control-group">
			<label for="city" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_city; ?>
			</label>
			<div class="controls">
				<input type="text" name="city" value="<?php echo $city; ?>" class="span6" />
			</div>
		</div>

		<div class="control-group">
			<label for="postcode" class="control-label">
				<span id="shipping-postcode-required" class="req_mark">*</span><?php echo $entry_postcode; ?>
			</label>
			<div class="controls">
				<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="span6" />
			</div>
		</div>

		<div class="control-group">
			<label for="country_id" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_country; ?>
			</label>
			<div class="controls">
				<select name="country_id" class="span6">
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
			<div class="controls"><select name="zone_id" class="span6"></select></div>
		</div>

	</div>
</div>

<div class="buttons">
	<input type="button" value="<?php echo $button_continue; ?>" id="button-guest-shipping" class="btn btn-inverse" />
</div>

<script type="text/javascript"><!--

	$('#shipping-address select[name=\'country_id\']').bind('change', function() {
		
		$.ajax({
			url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
			dataType: 'json',
			beforeSend: function() {
				$('#shipping-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/fortuna/images/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('.wait').remove();
			},			
			success: function(json) {
				if (json['postcode_required'] == '1') {
					$('#shipping-postcode-required').show();
				} else {
					$('#shipping-postcode-required').hide();
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
				
				$('#shipping-address select[name=\'zone_id\']').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});

	$('#shipping-address select[name=\'country_id\']').trigger('change');

//--></script>