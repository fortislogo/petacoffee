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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_generate_and_send; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_file; ?></td>
            <td><input type="file" name="file" />
              <?php if ($error_file) { ?>
              <span class="error"><?php echo $error_file; ?></span><br />
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_sender_name; ?></td>
            <td><input type="text" name="sender_name" value="<?php echo $sender_name; ?>" />
              <?php if ($error_sender_name) { ?>
              <span class="error"><?php echo $error_sender_name; ?></span><br />
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_sender_email; ?></td>
            <td><input type="text" name="sender_email" value="<?php echo $sender_email; ?>" />
              <?php if ($error_sender_email) { ?>
              <span class="error"><?php echo $error_sender_email; ?></span><br />
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_message; ?></td>
            <td><textarea name="message" cols="40" rows="5"><?php echo $message; ?></textarea>
              <?php if ($error_message) { ?>
              <span class="error"><?php echo $error_message; ?></span><br />
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_theme; ?></td>
            <td><select name="voucher_theme_id">
                <?php foreach ($voucher_themes as $voucher_theme) { ?>
                <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
                <option value="<?php echo $voucher_theme['voucher_theme_id']; ?>" selected="selected"><?php echo $voucher_theme['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_amount; ?></td>
            <td><input type="text" name="amount" value="<?php echo $amount; ?>" />
              <?php if ($error_amount) { ?>
              <span class="error"><?php echo $error_amount; ?></span><br />
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_currency; ?></td>
            <td><select name="currency_id">
                <?php foreach ($currencies as $currency) { ?>
                <?php if ($currency['currency_id'] == $currency_id) { ?>
                <option value="<?php echo $currency['currency_id']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $currency['currency_id']; ?>"><?php echo $currency['title']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>