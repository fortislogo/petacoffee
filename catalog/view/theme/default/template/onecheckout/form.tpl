  <div class="left">
  	<span class="required">*</span> <?php echo $entry_firstname; ?><br />
  	<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="small-field" /><br />
  </div>
  <div class="right">
  	<span class="required">*</span> <?php echo $entry_lastname; ?><br />
  	<input type="text" name="lastname" value="<?php echo $lastname; ?>" class="small-field" /><br />
  </div>  
  <div class="divclear">
  	<br />
  	<span class="required">*</span> <?php echo $entry_email; ?><br />
  	<input type="text" name="email" value="<?php echo $email; ?>" class="large-field" />
	<br />
	<br />
	<?php echo $entry_company; ?><br />
  	<input type="text" name="company" value="<?php echo $company; ?>" class="large-field" />
  	<br />
  	<br />
	<span class="required">*</span> <?php echo $entry_address_1; ?><br />
  	<input type="text" name="address_1" value="<?php echo $address_1; ?>" class="large-field" />
  	<br />
  	<br />
  	<?php echo $entry_address_2; ?><br />
  	<input type="text" name="address_2" value="<?php echo $address_2; ?>" class="large-field" />
	<br />
  </div>
  <br />
  <div class="left">
  	<span class="required">*</span> <?php echo $entry_telephone; ?><br />
  	<input type="text" name="telephone" value="<?php echo $telephone; ?>" class="small-field" /><br />
  </div>
  <div class="right">
  	<?php echo $entry_fax; ?><br />
  	<input type="text" name="fax" value="<?php echo $fax; ?>" class="small-field" /><br />
  </div>
  <br />
  <div class="divclear"></div>
  <br />
  <div class="left">
  	<span class="required">*</span> <?php echo $entry_city; ?><br />
  	<input type="text" name="city" value="<?php echo $city; ?>" class="small-field" /><br />
  </div>
  <div class="right">
  	<span class="required">*</span> <?php echo $entry_postcode; ?><br />
  	<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="small-field" /><br />
  </div>
  
  <div class="divclear">
  	<br />
  	<span class="required">*</span> <?php echo $entry_country; ?><br />
  	<select name="country_id" class="large-field" onchange="$('#payment-address select[name=\'zone_id\']').load('index.php?route=onecheckout/address/zone&country_id=' + this.value);">
    	<option value=""><?php echo $text_select; ?></option>
    	<?php foreach ($countries as $country) { ?>
    	<?php if ($country['country_id'] == $country_id) { ?>
    	<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
    	<?php } else { ?>
    	<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
    	<?php } ?>
    	<?php } ?>
  	</select>
  	<br />
  	<br />
  	<span class="required">*</span> <?php echo $entry_zone; ?><br />
  	<select name="zone_id" class="large-field">
  	</select>
  	<br />
  	<br />
	<?php if ($guest_checkout) { ?>
	<input type="checkbox" name="account" value="1" id="account" />
	<label for="account"><?php echo $text_reg; ?></label>
	<br />
	<br />
	<?php } else { ?>
	<input type="checkbox" name="account" value="1" id="account" checked="checked" style="display:none;" />
	<?php } ?>	
  </div>
<script type="text/javascript"><!--
$('#payment-address select[name=\'zone_id\']').load('index.php?route=onecheckout/address/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');

$('#payment-address select[name=\'zone_id\']').live('change', function() {
	if($('#payment-address input[name=\'shipping_address\']:checked').attr('value')){
		shippingmethod($('#payment-address select[name=\'country_id\']').val(), $('#payment-address select[name=\'zone_id\']').val(), 1 , $('#payment-address input[name=\'city\']').val(),$('#payment-address input[name=\'postcode\']').val());		
	}
	paymentmethod($('#payment-address select[name=\'country_id\']').val(), $('#payment-address select[name=\'zone_id\']').val(), 1 , $('#payment-address input[name=\'city\']').val(),$('#payment-address input[name=\'postcode\']').val());
});

$('#shipping-address select[name=\'zone_id\']').live('change', function() {
	shippingmethod($('#shipping-address select[name=\'country_id\']').val(), $('#shipping-address select[name=\'zone_id\']').val(), 1 , $('#shipping-address input[name=\'city\']').val(),$('#shipping-address input[name=\'postcode\']').val());
});

$('#payment-address input[name=\'firstname\']').live('blur', function() {
	valiform("payment","firstname","");
});

$('#payment-address input[name=\'firstname\']').live('focus', function() {
	errorremove("payment","firstname");
});

$('#payment-address input[name=\'lastname\']').live('blur', function() {
	valiform("payment","lastname","");
});

$('#payment-address input[name=\'lastname\']').live('focus', function() {
	errorremove("payment","lastname");
});

$('#payment-address input[name=\'email\']').live('blur', function() {
	valiform("payment","email","");
});

$('#payment-address input[name=\'email\']').live('focus', function() {
	errorremove("payment","email");
});

$('#payment-address input[name=\'address_1\']').live('blur', function() {
	valiform("payment","address_1","");
});

$('#payment-address input[name=\'address_1\']').live('focus', function() {
	errorremove("payment","address_1");
});

$('#payment-address input[name=\'telephone\']').live('blur', function() {
	valiform("payment","telephone","");
});

$('#payment-address input[name=\'telephone\']').live('focus', function() {
	errorremove("payment","telephone");
});

$('#payment-address input[name=\'city\']').live('blur', function() {
	valiform("payment","city","");
	if($('#payment-address input[name=\'shipping_address\']:checked').attr('value')){
		shippingmethod($('#payment-address select[name=\'country_id\']').val(), $('#payment-address select[name=\'zone_id\']').val(), 1 , $('#payment-address input[name=\'city\']').val(),$('#payment-address input[name=\'postcode\']').val());		
	}
	paymentmethod($('#payment-address select[name=\'country_id\']').val(), $('#payment-address select[name=\'zone_id\']').val(), 1 , $('#payment-address input[name=\'city\']').val(),$('#payment-address input[name=\'postcode\']').val());
});

$('#payment-address input[name=\'city\']').live('focus', function() {
	errorremove("payment","city");
});

$('#payment-address input[name=\'postcode\']').live('blur', function() {
	valiform("payment","postcode",", #payment-address select");
	if($('#payment-address input[name=\'shipping_address\']:checked').attr('value')){
		shippingmethod($('#payment-address select[name=\'country_id\']').val(), $('#payment-address select[name=\'zone_id\']').val(), 1 , $('#payment-address input[name=\'city\']').val(),$('#payment-address input[name=\'postcode\']').val());		
	}
	paymentmethod($('#payment-address select[name=\'country_id\']').val(), $('#payment-address select[name=\'zone_id\']').val(), 1 , $('#payment-address input[name=\'city\']').val(),$('#payment-address input[name=\'postcode\']').val());
});

$('#payment-address input[name=\'postcode\']').live('focus', function() {
	errorremove("payment","postcode");
});

$('#payment-address select[name=\'zone_id\']').live('focus', function() {
	errorremove("payment","zone_id");
});

$('#payment-address select[name=\'country_id\']').live('focus', function() {
	errorremove("payment","country_id");
});

$('#shipping-address input[name=\'firstname\']').live('blur', function() {
	valiform("shipping","firstname","");
});

$('#shipping-address input[name=\'firstname\']').live('focus', function() {
	errorremove("shipping","firstname");
});

$('#shipping-address input[name=\'lastname\']').live('blur', function() {
	valiform("shipping","lastname","");
});

$('#shipping-address input[name=\'lastname\']').live('focus', function() {
	errorremove("shipping","lastname");
});

$('#shipping-address input[name=\'address_1\']').live('blur', function() {
	valiform("shipping","address_1","");
});

$('#shipping-address input[name=\'address_1\']').live('focus', function() {
	errorremove("shipping","address_1");
});

$('#shipping-address input[name=\'city\']').live('blur', function() {
	valiform("shipping","city","");
	shippingmethod($('#shipping-address select[name=\'country_id\']').val(), $('#shipping-address select[name=\'zone_id\']').val(), 1 , $('#shipping-address input[name=\'city\']').val(),$('#shipping-address input[name=\'postcode\']').val());
});

$('#shipping-address input[name=\'city\']').live('focus', function() {
	errorremove("shipping","city");
});

$('#shipping-address input[name=\'postcode\']').live('blur', function() {
	valiform("shipping","postcode",", #shipping-address select");
	shippingmethod($('#shipping-address select[name=\'country_id\']').val(), $('#shipping-address select[name=\'zone_id\']').val(), 1 , $('#shipping-address input[name=\'city\']').val(),$('#shipping-address input[name=\'postcode\']').val());
});

$('#shipping-address input[name=\'postcode\']').live('focus', function() {
	errorremove("shipping","postcode");
});

$('#shipping-address select[name=\'zone_id\']').live('focus', function() {
	errorremove("shipping","zone_id");
});

$('#shipping-address select[name=\'country_id\']').live('focus', function() {
	errorremove("shipping","country_id");
});

function valiform(layout, vname, othername){
	$.ajax({
		url: 'index.php?route=onecheckout/form/validate',
		type: 'post',
		data: $('#'+layout+'-address input[name=\''+vname+'\']'+othername),
		dataType: 'json',
		success: function(json) {						
			if (json['error'][vname]) {
				errorremove(layout, vname);
				$('#'+layout+'-address input[name=\''+vname+'\'] + br').after('<span id="error_'+vname+'" class="error">' + json['error'][vname] + '</span>');
			}
		}
	});	
}

function errorremove(layout, vname) {
	if($('#'+layout+'-address #error_'+vname)){
		$('#'+layout+'-address #error_'+vname).remove();
	}
}
//--></script> 