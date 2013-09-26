<?php if (count($languages) > 1) { ?>
	<div id="language">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<span><?php echo $text_language; ?>:</span> 
			<?php foreach ($languages as $language) { ?>

				<?php if ($language['code'] == $language_code) { ?>
					<b title="<?php echo $language['name']; ?>" /><?php echo $language['code']; ?></b>
				<?php } else { ?>
					<a title="<?php echo $language['name']; ?>" onClick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>').submit(); $(this).parent().submit();" class="active" /><?php echo $language['code']; ?></a>
				<?php } ?>

			<?php } ?>
			<input type="hidden" name="language_code" value="" />
			<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
		</form>
	</div>
<?php } ?>
