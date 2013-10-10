<?php echo $header; ?>

	<?php echo $content_top; ?>
	
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>">
				<?php echo $breadcrumb['text']; ?>
			</a>
		<?php } ?>
	</div>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>
	
	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>
				
				<header class="heading">
	
					<h1 class="page-header"><?php echo $heading_title; ?></h1>
					<?php if ($success) { ?>
						<div class="alert success"><?php echo $success; ?></div>
					<?php } ?>

				</header>
			
				<div class="contentset">
					<h4 class="inner">
						<span><?php echo $text_my_account; ?></span>
					</h4>
				</div>

				<ul class="list">

					<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
					<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
					<li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
					<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_hide_wishlist')=='') { ?>
					<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
					<?php } ?>
					
                    
                    
				</ul>
                
               
				
				<div class="contentset">
					<h4 class="inner">
						<span><?php echo $text_my_orders; ?></span>
					</h4>
				</div>

				<ul class="list">

					<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo HTTP_SERVER ?>?route=account/recurring">Recurring Orders</a></li>
					<!-- <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li> -->
					<li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
					<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					<!-- <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li> -->

        <?php if ($allow_check_balance) { ?>
        <li><a href="<?php echo $voucher_balance; ?>"><?php echo $text_voucher_balance; ?></a></li>
        <?php } ?>
      

				</ul>
				
				<div class="contentset">
					<h4 class="inner">
						<span><?php echo $text_my_newsletter; ?></span>
					</h4>
				</div>

				<ul class="list">

					<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>

				</ul>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div>

	<?php echo $content_bottom; ?>
	
<?php echo $footer; ?> 