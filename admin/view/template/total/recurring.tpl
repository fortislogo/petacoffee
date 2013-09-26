<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/total.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
        
        	<tr>
            	<td>Discount:</td>
            	<td><input type="text" name="recurring_discount" value="<?php echo $recurring_discount; ?>"></td>
          	</tr>
            
            <tr>
            	<td>Type:</td>
            	<td>
                	<select name="recurring_discount_type">
                    	<?php if ($recurring_discount_type == 'percent'): ?>
                        <option value="fixed">Fixed Amount</option>
                        <option value="percent"  selected="selected">Percentage</option>
                        <?php else: ?>
                        <option value="fixed" selected="selected">Fixed Amount</option>
                        <option value="percent">Percentage</option>
                        <?php endif; ?>
                    </select>
                </td>
          	</tr>
            
            <tr>
            	<td>Default Frequency:</td>
            	<td>
                	<select name="recurring_default_frequency">
                    	<?php for($i=2; $i<=20; $i++): ?>
                        <?php if ($recurring_default_frequency == $i): ?>
                        <option value="<?php echo $i; ?>" selected="selected"><?php echo $i; ?> weeks</option>
                        <?php else: ?>
                        <option value="<?php echo $i; ?>"><?php echo $i; ?> weeks</option>
                        <?php endif; ?>
                        <?php endfor; ?>
                    </select>
                </td>
          	</tr>
          
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="recurring_status">
                <?php if ($recurring_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="recurring_sort_order" value="<?php echo $recurring_sort_order; ?>" size="1" /></td>
          </tr>
          
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>