<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.dcjqaccordion.js"></script> 

<div class="box">

	<div class="box-heading"><?php echo $heading_title; ?></div>

	<div class="box-content box-category"><?php echo $category_accordion; ?></div>
	
</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#cat_accordion').dcAccordion({
		classExpand : 'cid<?php echo $category_accordion_cid; ?>',
		menuClose: false,
		autoClose: true,
		saveState: false,
		disableLink: false,		
		autoExpand: true
	});
});
</script>
