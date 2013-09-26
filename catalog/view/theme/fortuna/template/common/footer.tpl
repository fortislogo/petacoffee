		</section> <!-- #content_wrapper -->

		<footer id="footer" class="container">

			<div class="row-fluid">

				<div class="column span2">
					<h3 class="header"><?php echo $text_information; ?></h3>
					<ul class="content">
						<?php 
						$i=1;
						foreach ($informations as $information) { ?>
						<li id="inf<?php echo $i;?>"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
						<?php 
						$i++;
					} ?>
					</ul>
				</div>

				<div class="column span2">
					<h3 class="header"><?php echo $text_service; ?></h3>
					<ul class="content">
						<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
						<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
						<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
					</ul>
				</div>

				<div class="column span2">
					<h3 class="header"><?php echo $text_extra; ?></h3>
						<ul class="content">
							<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
							<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
							<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
							<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
						</ul>
				</div>

				<div class="column span2">
					<h3 class="header"><?php echo $text_account; ?></h3>
						<ul class="content">
							<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
							<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
							<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_hide_wishlist')=='') { ?>
							<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
							<?php } ?>
							<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
						</ul>
				</div>

				<div class="span4 follow-us">

					<?php if($this->config->get('fortuna_status')== 1) { ?>

						<?php if($this->config->get('fortuna_facebook_id') != '') { ?>
						
	                        <div id="facebook">
	                        	<h3><?php echo $this->config->get('fortuna_facebook_label'); ?></h3>
	                             <div class="fb-inner">
	                             	
	                            	<script type="text/javascript" src="//static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php/en_US"></script>
	                            	<script type="text/javascript">
										FB._https = true;
										FB.init("88958d92366cd3c6fd29b2996edd5120");
									</script>
	                            	<fb:fan profile_id="<?php echo $this->config->get('fortuna_facebook_id'); ?>" stream="0" connections="5" logobar="0" border="white" width="220" height="120" css="<?php echo HTTPS_SERVER; ?>catalog/view/theme/fortuna/stylesheet/facebook.css?3.0.0.2"></fb:fan>

	                            </div>
	                        </div>

	                    <?php } ?>
					
					<?php } ?>

				</div>

			</div> <!-- .row -->

			<?php 	if($this->config->get('fortuna_status')== 1) { ?>

			<div class="row-fluid bottom-row">
				<div class="span3 payment">
					<?php if($this->config->get('fortuna_payment_logos') != '') { ?>
						<?php echo html_entity_decode($this->config->get('fortuna_payment_logos'), ENT_QUOTES, 'UTF-8'); ?>
					<?php } else { ?>
						<img src="catalog/view/theme/fortuna/images/payment_methods.png" />
					<?php } ?>
				</div>
				<div class="span6 info">
					<?php if($this->config->get('fortuna_footer_info_text') != '') { ?>
						<?php echo html_entity_decode($this->config->get('fortuna_footer_info_text'), ENT_QUOTES, 'UTF-8');?>
					<?php } ?>
				</div>
				<div class="span3">
					<div class="social">
						<?php if($this->config->get('fortuna_facebook_id') != '') { ?>
							<a href="https://facebook.com/<?php echo $this->config->get('fortuna_facebook_id'); ?>" target="_blank">
							<img src="catalog/view/theme/fortuna/images/icons/facebook.png" alt="Facebook" title="Facebook"></a>
						<?php } ?>
						<?php if($this->config->get('fortuna_twitter_username') != '') { ?>
							<a href="https://twitter.com/#!/<?php echo $this->config->get('fortuna_twitter_username'); ?>" target="_blank">
							<img src="catalog/view/theme/fortuna/images/icons/twitter.png" alt="Twitter" title="Twitter">
						</a>
						<?php } ?>
						<?php if($this->config->get('fortuna_youtube_username') != '') { ?>
							<a href="https://youtube.com/user/<?php echo $this->config->get('fortuna_youtube_username'); ?>" target="_blank">
							<img src="catalog/view/theme/fortuna/images/icons/youtube.png" alt="YouTube" title="YouTube">
						</a>
						<?php } ?>
						<?php if($this->config->get('fortuna_gplus_id') != '') { ?>
							<a href="https://plus.google.com/u/0/<?php echo $this->config->get('fortuna_gplus_id'); ?>" target="_blank">
							<img src="catalog/view/theme/fortuna/images/icons/gplus.png" alt="Google+" title="Google+">
						</a>
						<?php } ?>
						<?php if($this->config->get('fortuna_pinterest_id') != '') { ?>
							<a href="https://pinterest.com/<?php echo $this->config->get('fortuna_pinterest_id'); ?>" target="_blank">
							<img src="catalog/view/theme/fortuna/images/icons/pinterest.png" alt="Pinterest" title="Pinterest">
						</a>
						<?php } ?>
						<?php if($this->config->get('fortuna_tumblr_username') != '') { ?>
							<a href="http://<?php echo $this->config->get('fortuna_tumblr_username'); ?>.tumblr.com" target="_blank">
							<img src="catalog/view/theme/fortuna/images/icons/tumblr.png" alt="Tumblr" title="Tumblr">
						</a>
						<?php } ?>
						<?php if($this->config->get('fortuna_skype_username') != '') { ?>
							<a href="skype:<?php echo $this->config->get('fortuna_skype_username'); ?>?call" target="_blank">
							<img src="catalog/view/theme/fortuna/images/icons/skype.png" alt="Skype Me!" title="Skype Me!">
						</a>
						<?php } ?>
					</div>
				</div>
			</div>

			<?php } ?>

		</footer> <!-- #footer -->

		<footer id="footend" class="container">

			<div class="row">

			<?php if($this->config->get('fortuna_status')== 1) { ?>
				<?php if($this->config->get('fortuna_copyright') != '') { ?>
					<div id="copy"><?php echo html_entity_decode($this->config->get('fortuna_copyright'), ENT_QUOTES, 'UTF-8'); ?></div>
				<?php } else { ?>
					
					<div id="copy"><?php echo $this->config->get('config_name'); ?> &copy;2012. Powered by <a class="blue" href="http://www.opencart.com">OpenCart</a>.</div>
				<?php } ?>
			<?php } else { ?>
				<div id="copy"><?php echo $this->config->get('config_name'); ?> &copy;2012. Powered by <a class="blue" href="http://www.opencart.com">OpenCart</a><br /><a href="http://www.everthemes.com">fortuna</a> by <a href="http://www.everthemes.com">EVERTHEMES.COM</a>.</div>
			<?php } ?>

			</div>

		</footer> <!-- #footend -->

		<script type="text/javascript" src="catalog/view/theme/fortuna/js/bootstrap.min.js"></script>
		<!--[if lt IE 9]> <script type="text/javascript" src="catalog/view/theme/fortuna/js/selectivizr.min.js"></script> <![endif]-->
		<script type="text/javascript" src="catalog/view/theme/fortuna/js/respond.min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.easing-1.3.min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.flexslider.min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.ui.totop.js"></script>
		<script type="text/JavaScript" src="catalog/view/theme/fortuna/js/cloud-zoom.1.0.2.min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/fortuna/js/custom.js"></script>
		
	</body>

</html>