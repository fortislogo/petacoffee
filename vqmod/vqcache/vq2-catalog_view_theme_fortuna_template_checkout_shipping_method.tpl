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


        <?php if ($gift_wrap_status && $gift_wrap_show_on_shipping) { ?>
          <?php if ($this->ocw->getVersion() < 1.5) { ?>
            <b style="margin-bottom: 2px; display: block;"><?php echo $text_gift_wrap_heading; ?></b>
            <div class="content">
              <table width="100%" cellpadding="3">
                <tr>
                  <td width="1"><input type="checkbox" name="gift_wrap" id="gift_wrap" value="1" <?php if($gift_wrap) { echo "checked"; } ?>/></td>
                  <td><label for="gift_wrap" style="cursor: pointer;"><?php echo $text_gift_wrap_info; ?></label></td>
                  <td width="1" align="right"><?php echo $gift_wrap_fee; ?>
                    <?php if($gift_wrap_fee_note != ''){?>
                      <br><small style="white-space:nowrap;"><?php echo $gift_wrap_fee_note; ?></small>
                    <?php } ?>
                  </td>
                </tr>
              </table>
              <?php if ($gift_wrap_use_note_field) { ?>
                <script type="text/javascript"><!--
                $('#gift_wrap').change(function() {
                  if ($(this).is(':checked')) {
                    $(this).val(1);
                    $('#gift_wrap_notes').slideDown();
                  } else {
                    $(this).val(0);
                    $('#gift_wrap_notes').slideUp();
                  }
                });
                $(document).ready(function() {
                  if ($('#gift_wrap').is(':checked')) {
                    $('#gift_wrap_notes').slideDown();
                  }
                });
                //--></script>
                <div id="gift_wrap_notes" style="display: none;">
                  <?php echo $text_gift_wrap_note; ?><br>
                  <textarea name="gift_wrap_note" style="width: 99%; height: 100px;"><?php echo $gift_wrap_note; ?></textarea>
                </div>
              <?php } ?>
            </div>
          <?php } else { ?>
            <b><?php echo $text_gift_wrap_heading; ?></b>
            <table class="form">
	        	<tr>
	        		<td style="width: 1px;"><input type="checkbox" name="gift_wrap" id="gift_wrap" value="1" <?php if($gift_wrap) { echo "checked"; } ?>/></td>
	        		<td><label for="gift_wrap" style="cursor: pointer;"><?php echo $text_gift_wrap_info; ?></label></td>
	        		<td style="text-align: right;"><?php echo $gift_wrap_fee; ?>
	        			<?php if($gift_wrap_fee_note != ''){?>
	        				<br><small style="white-space:nowrap;"><?php echo $gift_wrap_fee_note; ?></small>
	        			<?php } ?>
	        		</td>
	        	</tr>
	        	</table>
	        	<?php if ($gift_wrap_use_note_field) { ?>
	        	  <script type="text/javascript"><!--
	        	  $('#gift_wrap').change(function() {
	        	    if ($(this).is(':checked')) {
	        	      $(this).val(1);
	        	      $('#gift_wrap_notes').slideDown();
	        	    } else {
	        	      $(this).val(0);
                  $('#gift_wrap_notes').slideUp();
	        	    }
	        	  });

	        	  $(document).ready(function() {
                if ($('#gift_wrap').is(':checked')) {
                  $('#gift_wrap_notes').slideDown();
                }
              });
	        	  //--></script>
	        	  <div id="gift_wrap_notes" style="display: none;">
	        	  <b><?php echo $text_gift_wrap_note; ?></b>
	        		<textarea name="gift_wrap_note" rows="8" style="width: 98%;"><?php echo $gift_wrap_note; ?></textarea>
	        		<br />
              <br />
	        		</div>
	        	<?php } ?>
          <?php } ?>
        <?php } ?>
      
		<div class="buttons">
			<input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" class="btn btn-inverse" />
		</div>
	
	</div>

</div>
