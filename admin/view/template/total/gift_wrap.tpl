<?php echo $header; ?>
<?php if ($version < 1.5) { ?>
	<?php if ($error) { ?>	<div class="warning"><?php echo $error; ?></div><?php } ?>
	<?php if ($success) { ?><div class="success"><?php echo $success; ?></div><?php } ?>
	<div class="box">
		<div class="left"></div>
		<div class="right"></div>
		<div class="heading">
			<h1 style="background-image: url('view/image/<?php echo $type; ?>.png');"> <?php echo $heading_title; ?></h1>
<?php } else { ?>
	<div id="content">
		<div class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<?php echo $breadcrumb['separator']; ?>
				<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		</div>
		<?php if ($error) { ?><div class="warning"><?php echo $error; ?></div><?php } ?>
		<?php if ($success) { ?><div class="success"><?php echo $success; ?></div><?php } ?>
		<div class="box">
			<div class="heading">
				<h1><img src="view/image/<?php echo $type; ?>.png" alt=""/> <?php echo $heading_title; ?></h1>
<?php } ?>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
				<a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
			</div>
		</div>
		<div class="content">
      <div class="vtabs">
        <a <?php echo ($version < 1.5) ? 'tab' : 'href'; ?>="#tab-general"><?php echo $tab_general; ?></a>
        <a <?php echo ($version < 1.5) ? 'tab' : 'href'; ?>="#tab-about"><?php echo $tab_about; ?></a>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general" class="<?php echo ($version < 1.5) ? 'vtabs_page' : 'vtabs-content'; ?>">
        <table class="form">
          <tr>
            <td><?php echo $entry_fee; ?></td>
            <td><input type="text" name="gift_wrap_fee" value="<?php echo $gift_wrap_fee; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_calculation_method; ?></td>
            <td><select name="gift_wrap_calculation_method">
                <?php if ($gift_wrap_calculation_method == 'per_qty') { ?>
                  <option value="per_qty" selected="selected"><?php echo $text_per_qty; ?></option>
                  <option value="per_product"><?php echo $text_per_product; ?></option>
                  <option value="per_order"><?php echo $text_per_order; ?></option>
                <?php } else if ($gift_wrap_calculation_method == 'per_product') { ?>
                  <option value="per_qty"><?php echo $text_per_qty; ?></option>
                  <option value="per_product" selected="selected"><?php echo $text_per_product; ?></option>
                  <option value="per_order"><?php echo $text_per_order; ?></option>
                <?php } else { ?>
                  <option value="per_qty"><?php echo $text_per_qty; ?></option>
                  <option value="per_product"><?php echo $text_per_product; ?></option>
                  <option value="per_order" selected="selected"><?php echo $text_per_order; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_show_on_shipping; ?></td>
            <td><select name="gift_wrap_show_on_shipping">
                <?php if ($gift_wrap_show_on_shipping) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_show_on_payment; ?></td>
            <td><select name="gift_wrap_show_on_payment">
                <?php if ($gift_wrap_show_on_payment) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_use_note_field; ?></td>
            <td><select name="gift_wrap_use_note_field">
                <?php if ($gift_wrap_use_note_field) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_tax_class_id; ?></td>
            <td><select name="gift_wrap_tax_class_id">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach ($tax_classes as $tax_class) { ?>
                <?php if ($tax_class['tax_class_id'] == $gift_wrap_tax_class_id) { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="gift_wrap_sort_order" value="<?php echo $gift_wrap_sort_order; ?>" size="1" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="gift_wrap_status">
                <?php if ($gift_wrap_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
        </div>
        <div id="tab-about" class="<?php echo ($version < 1.5) ? 'vtabs_page' : 'vtabs-content'; ?>">
          <table class="form">
            <tr>
              <td colspan="2"><a target="_blank" href="http://www.opencartworld.com"><img src="view/image/ocw.png" title="OpenCartWorld.com" /></a></td>
            </tr>
            <tr>
              <td><?php echo $entry_extension_name; ?></td>
              <td><?php echo $extension_name; ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_extension_version; ?></td>
              <td><?php echo $extension_version; ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_extension_url; ?></td>
              <td><a target="_blank" href="<?php echo $extension_url; ?>"><?php echo $extension_url; ?></a></td>
            </tr>
            <tr>
              <td><?php echo $entry_extension_support; ?></td>
              <td><a href="mailto:<?php echo $extension_support; ?>?subject=<?php echo $extension_name; ?> Support Needed"><?php echo $extension_support; ?></a></td>
            </tr>
            <tr>
              <td><?php echo $entry_extension_legal; ?></td>
              <td>&copy; <?php echo date('Y'); ?> OpenCartWorld.com. <a target="_blank" href="<?php echo $extension_terms; ?>"/>Terms &amp; Conditions</a></td>
            </tr>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<?php if ($version < 1.5) { ?></div><?php } ?>
<script type="text/javascript"><!--
var settings = <?php echo $settings; ?>;

function isNumber(n)
{
	return !isNaN(parseFloat(n)) && isFinite(n);
}

function getSettingById(searchId)
{
	for (var id in settings)
	{
		var setting = settings[id];

		if (id == searchId)
		{
			return setting;
		}
	}
	return false;
}

function validateRequirements(id)
{
	var elem  = $('#' + id);
	var setting = getSettingById(id);

	if (setting.requires != undefined) {
		var validates = true;

		for (var required_id in setting.requires)
		{
			if ($('#' + required_id).val() != setting.requires[required_id])
			{
				validates = false;
			}

			if (validates) validates = validateRequirements(required_id);
		}

		return validates;
	}

	return true;
}

function updateFormStatus()
{
	for (var id in settings)
	{
		var setting = settings[id];
		var elem = $('#' + id);

    if (elem.parent().parent().hasClass('heading'))
    {
      if (parseInt(elem.val()))
        elem.parent().parent().removeClass('disabled');
      else
        elem.parent().parent().addClass('disabled');
    }

		if (!validateRequirements(id))
		{
			elem.attr('disabled', 'disabled');
		} else
		{
			elem.attr('disabled', false);
		}
	}
}


$(document).ready(function()
{
  $('#form').submit(function()
  {
    $('[disabled]').each(function() {
      var d_name = $(this).attr("name");
      var d_val = $(this).val();
      $(this).attr("disabled", false);
    });
    return true;
  });

  $('#form').change(function() {
		updateFormStatus();
	});

	updateFormStatus();

  $('.vtabs a').each(function() {
		var obj = $(this);

    if (obj.attr('href').length > 0)
      if (obj.attr('href') == window.location.hash)
        obj.click();
    else
      if (obj.attr('tab') == window.location.hash)
        obj.click();
	});
});
//--></script>
<script type="text/javascript"><!--
<?php if ($version < 1.5) { ?>
$.tabs('.vtabs a');
<?php } else { ?>
$('.vtabs a').tabs();
<?php } ?>
//--></script>
<?php echo $footer; ?>