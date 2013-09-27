<div class="row-fluid">

	<div class="span12">

		<?php if ($error_warning) { ?>
			<div class="alert warning"><?php echo $error_warning; ?></div>
		<?php } ?>
        
        <?php if ($has_recurring) { ?>
		
        <div>
		
        
    	<div class="cart-heading" id="recurring-heading">RECURRING ORDER</div>
	    
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
            	Check this box to have this same order automatically sent to you at regular intervals.<br />Want to learn more about how this works? <a href="/?route=information/information&information_id=8">Click here.</a>
    			<br /><br />
                RESEND THIS ORDER EVERY<br />
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
        

		<?php if ($shipping_methods) { ?>
			
			<p><?php echo $text_shipping_method; ?></p>

			<div class="control-group">

				<?php foreach ($shipping_methods as $shipping_method) { ?>
					
					<div class="method-type">
						<p><?php echo $shipping_method['title']; ?></p>

					<?php if (!$shipping_method['error']) { ?>
						<?php foreach ($shipping_method['quote'] as $quote) { ?>

							<label class="radio">
								<?php if ($quote['code'] == $code || !$code) { ?>
									<?php $code = $quote['code']; ?>
									<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" class="radio inline" />
								<?php } else { ?>
									<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" class="radio inline" />
								<?php } ?>
								<?php echo $quote['title']; ?> (<b><?php echo $quote['text']; ?></b>)
							</label><br />
						<?php } ?>
					</div>
					
					<?php } else { ?>
						<div class="error"><?php echo $shipping_method['error']; ?></div>
					<?php } ?>

				<?php } ?>
			
			</div><br />

		<?php } ?>

		<label for="comment" class="label-group"><b><?php echo $text_comments; ?></b></label>
		<div class="controls">
			<textarea name="comment" rows="8" class="span12"><?php echo $comment; ?></textarea>
		</div>

		<div class="buttons">
			<input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" class="btn btn-inverse" />
		</div>
	
	</div>

</div>
