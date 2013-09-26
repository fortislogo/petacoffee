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

	<section id="maincontent" class="account-login" role="main">

		<div class="mainborder">

			<header class="heading">
			
				<h1 class="page-header"><?php echo $heading_title; ?></h1>

				<?php if ($success) { ?>
					<div class="alert success"><?php echo $success; ?><a class="close" data-dismiss="alert" href="#">&times;</a></div>
				<?php } ?>

				<?php if ($error_warning) { ?>
					<div class="alert warning"><?php echo $error_warning; ?><a class="close" data-dismiss="alert" href="#">&times;</a></div>
				<?php } ?>

			</header>

			<div class="row-fluid">

				<div class="span6 register">

					<div class="inner">
				
					<div class="contentset center">
						<h4 class="inner">
							<span><?php echo $text_new_customer; ?></span>
						</h4>
					</div>

					<p><b><?php echo $text_register; ?></b></p>

					<p><?php echo $text_register_account; ?></p>
					
					<div class="buttons">
						<a href="<?php echo $register; ?>" class="btn btn-inverse"><?php echo $button_continue; ?></a>
					</div>

					</div>
				
				</div>

				<div class="span6 login">

					<div class="inner">

						<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="login">
							
							<div class="contentset center">
								<h4 class="inner">
									<span><?php echo $text_returning_customer; ?></span>
								</h4>
							</div>
								
							<p><?php echo $text_i_am_returning_customer; ?></p>
							
							<div class="control-group">
								<label for="email" class="control-label"><b><?php echo $entry_email; ?></b></label>
								<div class="controls">
									<input type="email" name="email" id="email" class="span9 required" required />
								</div>
							</div>

							<div class="control-group">
								<label for="password" class="control-label"><b><?php echo $entry_password; ?></b></label>
								<div class="controls">
									<input type="password" name="password" id="password" class="span9 required" required />
								</div>
							</div>

							<p><i class="icon-exclamation-sign"></i> <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></p>

							<div class="buttons">
								<input type="submit" value="<?php echo $button_login; ?>" class="btn btn-inverse" />
							</div>

							<?php if ($redirect) { ?>
							<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
							<?php } ?>

						</form>
						
					</div>

				</div>

			</div>

		</div>

	</section><!-- #maincontent -->

	<?php echo $content_bottom; ?>

	<script type="text/javascript"><!--

		$('#login input').keydown(function(e) {
			if (e.keyCode == 13) {
				$('#login').submit();
			}
		});

	//--></script>

<?php echo $footer; ?>