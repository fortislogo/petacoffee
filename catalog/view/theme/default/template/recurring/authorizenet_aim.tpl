<div id="payment">

	<label style="display:inline-block; width:200px;">Card Owner:</label> <input type="text" name="cc_owner" value="<?php echo $card_owner; ?>" /> <br />
    <label style="display:inline-block; width:200px;">Credit Card Number:</label> <input type="text" name="cc_number" value="<?php echo $card_num; ?>" /> <br />
    <label style="display:inline-block; width:200px;">Expiry Date:</label> <select name="cc_expire_date_month">
					<?php foreach ($months as $month) { ?>
                    <?php if ($exp_date_month == $month['value']): ?>
                    <option value="<?php echo $month['value']; ?>" selected="selected"><?php echo $month['text']; ?></option>
                    <?php else: ?>
					<option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
                    <?php endif; ?>
					<?php } ?>
				</select>
				/
				<select name="cc_expire_date_year">
					<?php foreach ($year_expire as $year) { ?>
                    <?php if ($exp_date_year == $year['value']): ?>
                    <option value="<?php echo $year['value']; ?>" selected="selected"><?php echo $year['text']; ?></option>
                    <?php else: ?>
					<option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
                    <?php endif; ?>
					<?php } ?>
				</select> <br />
    <label style="display:inline-block; width:200px;">CVV2:</label> <input type="text" name="cc_cvv2" value="<?php echo $card_code; ?>" size="3" />

</div>