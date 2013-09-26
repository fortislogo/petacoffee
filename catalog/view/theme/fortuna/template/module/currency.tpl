<?php if (count($currencies) > 1) { ?>

<div id="currency">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<span><?php echo $text_currency; ?>:</span>
		<?php foreach ($currencies as $currency) { ?>
			<?php if ($currency['code'] == $currency_code) { ?>
			
			<?php if ($currency['symbol_left']) { ?>
			<b title="<?php echo $currency['title']; ?>" class="active"><?php echo $currency['symbol_left']; ?></b>
			<?php } else { ?>
			<b title="<?php echo $currency['title']; ?>" class="active"><?php echo $currency['symbol_right']; ?></b>
			<?php } ?>
			
			<?php } else { ?>
			
			<?php if ($currency['symbol_left']) { ?>
			<a title="<?php echo $currency['title']; ?>" onClick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().submit();"><?php echo $currency['symbol_left']; ?></a>
			<?php } else { ?>
			<a title="<?php echo $currency['title']; ?>" onClick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().submit();"><?php echo $currency['symbol_right']; ?></a>
			<?php } ?>
			
			<?php } ?>
		<?php } ?>
		<input type="hidden" name="currency_code" value="" />
		<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</form>
</div>

<?php } ?>