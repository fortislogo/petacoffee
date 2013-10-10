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
        <td><span class="required">*</span> <?php echo $entry_code_chars; ?></td>
        <td><input type="text" name="code_chars" value="<?php echo $code_chars; ?>" size="50" />
              <?php if ($error_code_chars) { ?>
              <span class="error"><?php echo $error_code_chars; ?></span>
              <?php } ?></td>
      </tr>
      <tr>
        <td><span class="required">*</span> <?php echo $entry_code_length; ?></td>
        <td><input type="text" name="code_length" value="<?php echo $code_length; ?>" size="1" />
              <?php if ($error_code_length) { ?>
              <span class="error"><?php echo $error_code_length; ?></span>
              <?php } ?></td>
      </tr>
      <tr>
        <td><span class="required">*</span> <?php echo $entry_default_amount; ?></td>
        <td><input type="text" name="default_amount" value="<?php echo $default_amount; ?>" size="10" />
              <?php if ($error_default_amount) { ?>
              <span class="error"><?php echo $error_default_amount; ?></span>
              <?php } ?></td>
      </tr>
      <tr>
        <td><span class="required">*</span> <?php echo $entry_amount_range; ?></td>
        <td><input type="text" name="min_amount" value="<?php echo $min_amount; ?>" size="10" /> - <input type="text" name="max_amount" value="<?php echo $max_amount; ?>" size="10" />
              <?php if ($error_min_amount) { ?>
              <span class="error"><?php echo $error_min_amount; ?></span>
              <?php } ?>
              <?php if ($error_max_amount) { ?>
              <span class="error"><?php echo $error_max_amount; ?></span>
              <?php } ?></td>
      </tr>
      <tr>
        <td><?php echo $entry_auto_email_voucher; ?></td>
        <td><select name="auto_email_voucher">
            <?php if ($auto_email_voucher) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
      </tr>
      <tr>
        <td><?php echo $entry_valid_for_shipping; ?></td>
        <td><select name="valid_for_shipping">
            <?php if ($valid_for_shipping) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
      </tr>
      <tr>
        <td><?php echo $entry_valid_for_tax; ?></td>
        <td><select name="valid_for_tax">
            <?php if ($valid_for_tax) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
      </tr>
      <tr>
        <td><?php echo $entry_show_during_checkout; ?></td>
        <td><select name="show_during_checkout">
            <?php if ($show_during_checkout) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
      </tr>
      <tr>
        <td><?php echo $entry_allow_check_balance; ?></td>
        <td><select name="allow_check_balance">
            <?php if ($allow_check_balance) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
      </tr>
      <tr>
        <td><?php echo $entry_allow_remove; ?></td>
        <td><select name="allow_remove">
            <?php if ($allow_remove) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
      </tr>
      
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="voucher_status">
                <?php if ($voucher_status) { ?>
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
            <td><input type="text" name="voucher_sort_order" value="<?php echo $voucher_sort_order; ?>" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>