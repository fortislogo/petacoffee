<?php if($coupon_status) { ?>
<div class="cart-module">
  <div class="cart-heading"><?php echo $coupon_heading_title; ?></div>
  <div class="cart-content" id="coupon"><?php echo $entry_coupon; ?>&nbsp;<br />
    <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
    &nbsp;<a id="button-coupon" class="button"><span><?php echo $button_coupon; ?></span></a></div>
</div>
<?php } ?>
<?php if($reward_status) { ?>
<div class="cart-module">
  <div class="cart-heading"><?php echo $reward_heading_title; ?></div>
  <div class="cart-content" id="reward"><?php echo $entry_reward; ?>&nbsp;<br />
  <input type="text" name="reward" value="<?php echo $reward; ?>" />
  &nbsp;<a id="button-reward" class="button"><span><?php echo $button_reward; ?></span></a></div>
</div>
<?php } ?>
<?php if($voucher_status) { ?>
<div class="cart-module">
  <div class="cart-heading"><?php echo $voucher_heading_title; ?></div>
  <div class="cart-content" id="voucher"><?php echo $entry_voucher; ?>&nbsp;<br />
    <input type="text" name="voucher" value="<?php echo $voucher; ?>" />
    &nbsp;<a id="button-voucher" class="button"><span><?php echo $button_voucher; ?></span></a></div>
</div>
<?php } ?>

<?php if ($has_recurring) { ?>
<div class="cart-module">
	<div class="cart-heading" id="recurring-heading">Join PETA Coffee Club!</div>
    <div class="cart-content" id="recurring">
    <table>
    	<tr>
        	<td style="padding:5px; vertical-align:top;">
			    <?php if ($recurring) { ?>
		    	<input type="checkbox" name="recurring" value="1" checked="checked">    
    			<?php } else { ?>    
    			<input type="checkbox" name="recurring" value="1">     
    			<?php } ?> 
            </td>    
            <td style="padding:5px 0px;">
    			I want to set this up as recurring order <br />Want to learn more? Click to the <b><a href="/?route=information/information&information_id=8">PETA Coffee Club</a></b> info page.    
			    <br /><br />
                Reprocess this order every<br />
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
    </table>     
    </div>
</div>
<?php } ?>

<style type="text/css">
.cart-module > div {
	display: block;
}
.cart-module .cart-heading {
	border: 1px solid #DBDEE1;
	padding: 8px 8px 8px 22px;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	color: #555555;
	margin-bottom: 15px;
	cursor: pointer;
	background: #F8F8F8 url('catalog/view/theme/default/image/cart-right.png') 10px 50% no-repeat;
}
.cart-module .active {
	background: #F8F8F8 url('catalog/view/theme/default/image/cart-down.png') 7px 50% no-repeat;
}
.cart-module .cart-content {
	display: none;
	overflow: auto;
	font-family: Arial, Helvetica, sans-serif;
	font-size:12px;
}

.cart-module .cart-content input[type=text]
{
	width:50%;
}
</style>
<script type="text/javascript"><!--
$('.cart-module .cart-heading').bind('click', function() {
	if ($(this).hasClass('active')) {
		$(this).removeClass('active');
	} else {
		$(this).addClass('active');
	}
		
	$(this).parent().find('.cart-content').slideToggle('slow');
});
<?php if ($recurring): ?>
$(document).ready(function()
{
	$('#recurring-heading').trigger('click');
});
<?php endif; ?>
//--></script>