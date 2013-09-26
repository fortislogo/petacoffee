<div class="row-fluid">

	<div class="span12">

		<?php if ($error_warning) { ?>
			<div class="alert warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<?php if ($payment_methods) { ?>

			<p><?php echo $text_payment_method; ?></p>

			<div class="control-group">

				<?php foreach ($payment_methods as $payment_method) { ?>
				
				<label class="radio">
					<?php if ($payment_method['code'] == $code || !$code) { ?>
						<?php $code = $payment_method['code']; ?>
							<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" class="radio inline" />
						<?php } else { ?>
							<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" class="radio inline" />
						<?php } ?>
						<?php echo $payment_method['title']; ?>
				</label> <br />
				
				<?php } ?>
			
			</div><br />

		<?php } ?>
        
        
        

		<label for="comment" class="label-group"><b><?php echo $text_comments; ?></b></label>
		<div class="controls">
			<textarea name="comment" rows="8" class="span12"><?php echo $comment; ?></textarea>
		</div>

		<?php if ($text_agree) { ?>

        <?php if ($gift_wrap_status && $gift_wrap_show_on_payment) { ?>
          <?php if ($this->ocw->getVersion() < 1.5) { ?>
            <b style="margin-bottom: 2px; display: block;"><?php echo $text_gift_wrap_heading; ?></b>
            <div class="content">
              <table width="100%" cellpadding="3">
                <tr>
                  <td width="1"><input type="checkbox" name="gift_wrap" id="gift_wrap_p" value="1" <?php if($gift_wrap) { echo "checked"; } ?>/></td>
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
                $('#gift_wrap_p').change(function() {
                  if ($(this).is(':checked')) {
                    $(this).val(1);
                    $('#gift_wrap_notes_p').slideDown();
                  } else {
                    $(this).val(0);
                    $('#gift_wrap_notes_p').slideUp();
                  }
                });
                $(document).ready(function() {
                  if ($('#gift_wrap_p').is(':checked')) {
                    $('#gift_wrap_notes_p').slideDown();
                  }
                });
                //--></script>
                <div id="gift_wrap_notes_p" style="display: none;">
                  <?php echo $text_gift_wrap_note; ?><br>
                  <textarea name="gift_wrap_note" style="width: 99%; height: 100px;"><?php echo $gift_wrap_note; ?></textarea>
                </div>
              <?php } ?>
            </div>
          <?php } else { ?>
            <b><?php echo $text_gift_wrap_heading; ?></b>
            <table class="form">
	        	<tr>
	        		<td style="width: 1px;"><input type="checkbox" name="gift_wrap" id="gift_wrap_p" value="1" <?php if($gift_wrap) { echo "checked"; } ?>/></td>
	        		<td><label for="gift_wrap_p" style="cursor: pointer;"><?php echo $text_gift_wrap_info; ?></label></td>
	        		<td style="text-align: right;"><?php echo $gift_wrap_fee; ?>
	        			<?php if($gift_wrap_fee_note != ''){?>
	        				<br><small style="white-space:nowrap;"><?php echo $gift_wrap_fee_note; ?></small>
	        			<?php } ?>
	        		</td>
	        	</tr>
	        	</table>
	        	<?php if ($gift_wrap_use_note_field) { ?>
	        	  <script type="text/javascript"><!--
	        	  $('#gift_wrap_p').change(function() {
	        	    if ($(this).is(':checked')) {
	        	      $(this).val(1);
	        	      $('#gift_wrap_notes_p').slideDown();
	        	    } else {
	        	      $(this).val(0);
                  $('#gift_wrap_notes_p').slideUp();
	        	    }
	        	  });

	        	  $(document).ready(function() {
                if ($('#gift_wrap_p').is(':checked')) {
                  $('#gift_wrap_notes_p').slideDown();
                }
              });
	        	  //--></script>
	        	  <div id="gift_wrap_notes_p" style="display: none;">
	        	  <b><?php echo $text_gift_wrap_note; ?></b>
	        		<textarea name="gift_wrap_note" rows="8" style="width: 98%;"><?php echo $gift_wrap_note; ?></textarea>
	        		<br />
              <br />
	        		</div>
	        	<?php } ?>
          <?php } ?>
        <?php } ?>
      
		<div class="buttons">
			<?php echo $text_agree; ?>
				<?php if ($agree) { ?>
				<input type="checkbox" name="agree" value="1" checked="checked" />
				<?php } else { ?>
				<input type="checkbox" name="agree" value="1" />
				<?php } ?><br /><br />
				<input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="btn btn-inverse" />
		</div>
		<?php } else { ?>

        <?php if ($gift_wrap_status && $gift_wrap_show_on_payment) { ?>
          <?php if ($this->ocw->getVersion() < 1.5) { ?>
            <b style="margin-bottom: 2px; display: block;"><?php echo $text_gift_wrap_heading; ?></b>
            <div class="content">
              <table width="100%" cellpadding="3">
                <tr>
                  <td width="1"><input type="checkbox" name="gift_wrap" id="gift_wrap_p" value="1" <?php if($gift_wrap) { echo "checked"; } ?>/></td>
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
                $('#gift_wrap_p').change(function() {
                  if ($(this).is(':checked')) {
                    $(this).val(1);
                    $('#gift_wrap_notes_p').slideDown();
                  } else {
                    $(this).val(0);
                    $('#gift_wrap_notes_p').slideUp();
                  }
                });
                $(document).ready(function() {
                  if ($('#gift_wrap_p').is(':checked')) {
                    $('#gift_wrap_notes_p').slideDown();
                  }
                });
                //--></script>
                <div id="gift_wrap_notes_p" style="display: none;">
                  <?php echo $text_gift_wrap_note; ?><br>
                  <textarea name="gift_wrap_note" style="width: 99%; height: 100px;"><?php echo $gift_wrap_note; ?></textarea>
                </div>
              <?php } ?>
            </div>
          <?php } else { ?>
            <b><?php echo $text_gift_wrap_heading; ?></b>
            <table class="form">
	        	<tr>
	        		<td style="width: 1px;"><input type="checkbox" name="gift_wrap" id="gift_wrap_p" value="1" <?php if($gift_wrap) { echo "checked"; } ?>/></td>
	        		<td><label for="gift_wrap_p" style="cursor: pointer;"><?php echo $text_gift_wrap_info; ?></label></td>
	        		<td style="text-align: right;"><?php echo $gift_wrap_fee; ?>
	        			<?php if($gift_wrap_fee_note != ''){?>
	        				<br><small style="white-space:nowrap;"><?php echo $gift_wrap_fee_note; ?></small>
	        			<?php } ?>
	        		</td>
	        	</tr>
	        	</table>
	        	<?php if ($gift_wrap_use_note_field) { ?>
	        	  <script type="text/javascript"><!--
	        	  $('#gift_wrap_p').change(function() {
	        	    if ($(this).is(':checked')) {
	        	      $(this).val(1);
	        	      $('#gift_wrap_notes_p').slideDown();
	        	    } else {
	        	      $(this).val(0);
                  $('#gift_wrap_notes_p').slideUp();
	        	    }
	        	  });

	        	  $(document).ready(function() {
                if ($('#gift_wrap_p').is(':checked')) {
                  $('#gift_wrap_notes_p').slideDown();
                }
              });
	        	  //--></script>
	        	  <div id="gift_wrap_notes_p" style="display: none;">
	        	  <b><?php echo $text_gift_wrap_note; ?></b>
	        		<textarea name="gift_wrap_note" rows="8" style="width: 98%;"><?php echo $gift_wrap_note; ?></textarea>
	        		<br />
              <br />
	        		</div>
	        	<?php } ?>
          <?php } ?>
        <?php } ?>
      
		<div class="buttons">
				<input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="btn btn-inverse" />
		</div>
		<?php } ?>

	</div>
    



</div>

<script type="text/javascript"><!--

	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		maxHeight: 560,
		maxWidth: 560,
		width:'100%'
	});
	
//--></script> 