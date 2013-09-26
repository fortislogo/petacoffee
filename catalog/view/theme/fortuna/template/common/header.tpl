<!DOCTYPE html>

<!--[if IE 7]>                  <html class="ie7 no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">  <!--<![endif]-->

<head>

	<base href="<?php echo $base; ?>" />

	<meta charset="utf-8" />
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<title><?php echo $title; ?></title>

	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>

	<?php if ($icon) { ?>
	<link rel="shortcut icon" href="<?php echo $icon; ?>" />
	<?php } else { ?>
	<link rel="shortcut icon" href="catalog/view/theme/fortuna/favicon.ico" />
	<?php } ?>

	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>” rel=”<?php echo $link['rel']; ?>" /> 
	<?php } ?>
	
	<!--[if !lte IE 6]><!-->

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/bootstrap.min.css"/>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/stylesheet.css" media="screen"/>

	<?php if($direction=='rtl'){?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/stylesheet.rtl.css" media="screen"/>
	<?php }?>

	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />

	<!--<![endif]-->

	<!--[if lte IE 6]>
	<link rel="stylesheet" href="//universal-ie6-css.googlecode.com/files/ie6.1.1.css" media="screen, projection">
	<![endif]-->

	<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if necessary -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>window.jQuery || document.write(unescape('%3Cscript src="catalog/view/theme/fortuna/js/jquery-1.7.1.min.js"%3E%3C/script%3E'))</script>

	<script src="catalog/view/theme/fortuna/js/modernizr.full.min.js"></script>
		
	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

	<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>

	<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.elastislide.js"></script>

	<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.cycle.js"></script>

	<?php


	// If fortuna module is enabled

	if($this->config->get('fortuna_status')== 1) {

		if($this->config->get('fortuna_skins')!='') { ?>
			<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/<?php echo $this->config->get('fortuna_skins') ?>.css" media="screen"/>
		<?php }

		if($this->config->get('fortuna_title_font')!='' || $this->config->get('fortuna_body_font')!='' || $this->config->get('fortuna_small_font') != '' ) {
			
			$regfonts = array('Arial', 'Verdana', 'Helvetica', 'Lucida Grande', 'Trebuchet MS', 'Times New Roman', 'Tahoma', 'Georgia' );
			
			// Titles font
			if (in_array($this->config->get('fortuna_title_font'), $regfonts)==false) { 
				?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('fortuna_title_font') ?>&amp;v1' rel='stylesheet' type='text/css'><?php 
			} // Body font
			if (in_array($this->config->get('fortuna_body_font'), $regfonts)==false) { 
				?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('fortuna_body_font') ?>&amp;v1' rel='stylesheet' type='text/css'><?php 
			} // Small text font
			if (in_array($this->config->get('fortuna_small_font'), $regfonts)==false) { 
				?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('fortuna_small_font') ?>&amp;v1' rel='stylesheet' type='text/css'>
			
			<?php } ?>
		
		<?php } ?>

		<style type="text/css">

			#header {
				<?php 
					
				if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;

				if($this->config->get('fortuna_custom_image')!='') { ?>
					background-image: url("<?php echo $path_image . $this->config->get('fortuna_custom_image') ?>"); ?>;
					background-position: top center;
					background-repeat: no-repeat;
				<?php } else if($this->config->get('fortuna_custom_pattern')!='') { ?>
					background-image: url("<?php echo $path_image . $this->config->get('fortuna_custom_pattern') ?>"); ?>;
				<?php } else if($this->config->get('fortuna_pattern_overlay')!='none') { ?>
					background-image: url("catalog/view/theme/fortuna/images/patterns/<?php echo $this->config->get('fortuna_pattern_overlay'); ?>.png");
				<?php } else { ?>
					background-image: none;
				<?php } ?>
			}

			<?php if($this->config->get('fortuna_custom_colors')!='') { ?>

				#header {
					background-color: <?php echo $this->config->get('fortuna_header_background_color'); ?>;
				}

				#topbar {
				<?php if($this->config->get('fortuna_skins')=='light') { ?>
					border-top-color:<?php echo $this->config->get('fortuna_topbar_background'); ?>;
				<?php } else { ?>
					background: <?php echo $this->config->get('fortuna_topbar_background'); ?>;
				<?php } ?>
				}

				#welcome, #wrapselector {
					color: <?php echo $this->config->get('fortuna_topbar_text_color'); ?>;
				}

				#wrapselector a, #welcome a {
					color: <?php echo $this->config->get('fortuna_topbar_links'); ?>;
				}
				
				#wrapselector b {
					background: <?php echo $this->config->get('fortuna_topbar_text_color'); ?>;
				}

				#header .info {
					color: <?php echo $this->config->get('fortuna_header_text_color'); ?>;
				}

				.navbar .nav > li > a {
					color: <?php echo $this->config->get('fortuna_menu_color'); ?>;
					border-left-color: <?php echo $this->config->get('fortuna_menu_separator'); ?>;
				}

				h1.page-header {
					color: <?php echo $this->config->get('fortuna_title_color'); ?>;
				}
				.mainborder a {
					color: <?php echo $this->config->get('fortuna_content_links_color'); ?>;	
				}
				.mainborder, .mainborder .nav-tabs > li > a, .category-list a, .product-info, #continue-shopping {
					color: <?php echo $this->config->get('fortuna_bodytext_color'); ?>;
				}
				.breadcrumb, .breadcrumb a, .paginate .results, .product-info .price-tax, .product-info .price .reward {
					color: <?php echo $this->config->get('fortuna_lighttext_color'); ?>;
				}
				#footer, #footer h3 {
					color: <?php echo $this->config->get('fortuna_footer_text_color'); ?>;
				}
				#footer a, #footer a:link, #footer a:visited {
					color: <?php echo $this->config->get('fortuna_footer_links_color'); ?>;
				}
				
				<?php 
			
				$btncarttop = $this->config->get('fortuna_button_top_color');
				$btncartbot = $this->config->get('fortuna_button_bottom_color');
				?>
				.btn-cart {
					border-color: <?php echo $this->config->get('fortuna_button_border_color'); ?>;
					color: <?php echo $this->config->get('fortuna_button_text_color'); ?> !important;

					background-color: <?php echo $btncarttop; ?>;
					background-image: -moz-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -ms-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -webkit-gradient(linear, 0 0, 0 100%, from(<?php echo $btncarttop; ?>), to(<?php echo $btncartbot; ?>));
					background-image: -webkit-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -o-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-repeat: repeat-x;
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $btncarttop; ?>', endColorstr='<?php echo $btncartbot; ?>', GradientType=0);
				}
				.btn-cart:hover, .btn-cart:active, .btn-cart.active, .btn-cart.disabled, .btn-cart[disabled] {
					background-color: <?php echo $btncartbot; ?>;
				}

				<?php 
			
				$btninversetop = $this->config->get('fortuna_2button_top_color');
				$btninversebot = $this->config->get('fortuna_2button_bottom_color');
				?>
				.btn-inverse {
					border-color: <?php echo $this->config->get('fortuna_2button_border_color'); ?>;
					color: <?php echo $this->config->get('fortuna_2button_text_color'); ?> !important;

					background-color: <?php echo $this->config->get('fortuna_2button_top_color'); ?>;
					background-image: -moz-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: -ms-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: -webkit-gradient(linear, 0 0, 0 100%, from(<?php echo $btninversetop; ?>), to(<?php echo $btninversebot; ?>));
					background-image: -webkit-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: -o-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-repeat: repeat-x;
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $btninversetop; ?>', endColorstr='<?php echo $btninversebot; ?>', GradientType=0);

				}
				.btn-inverse:hover, .btn-inverse:active, .btn-inverse.active, .btn-inverse.disabled, .btn-inverse[disabled] {
					background-color: <?php echo $this->config->get('fortuna_2button_bottom_color'); ?>;
				}
				
				.grid-box .name a, .product-list .name a, .es-carousel .name a  {
					color: <?php echo $this->config->get('fortuna_product_name_color'); ?>;	
				}
				.grid-box .price, .product-list .price, .es-carousel .price, .product-info .price-normal {
					color: <?php echo $this->config->get('fortuna_normal_price_color'); ?>;	
				}
				.price-old {
					color: <?php echo $this->config->get('fortuna_old_price_color'); ?>;	
				}
				.price-new {
					color: <?php echo $this->config->get('fortuna_new_price_color'); ?>;	
				}
				.onsale .ribbon, .onsale .ribbonshadow {
					background-color: <?php echo $this->config->get('fortuna_onsale_background_color'); ?>;
					color: <?php echo $this->config->get('fortuna_onsale_text_color'); ?>;
				}
				.box-category a {
					color: <?php echo $this->config->get('fortuna_categories_menu_color'); ?>;		
				}

				@media (max-width: 767px) {
					.nav-collapse .nav > li > a:hover, .nav-collapse .dropdown-menu a:hover {
						background-color: <?php echo $this->config->get('fortuna_menu_color'); ?>;
					}
					#welcome a {
					<?php if($this->config->get('fortuna_skins')=='') { ?>
						color:<?php echo $this->config->get('fortuna_topbar_background'); ?>;
					<?php } ?>
					}
				}
			
			<?php } /* fortuna_custom_colors END */

			if ($this->config->get('fortuna_display_cart_button')!='') { ?>
				.product-grid .grid-box .btn-cart,
				.es-carousel ul li .btn-cart {
					margin-left: 0 !important;
				}
			<?php }

			if ($this->config->get('fortuna_body_font') != '' ) {
				$fontpre =  $this->config->get('fortuna_body_font');
				$font = str_replace("+", " ", $fontpre);
				?>
				body, p { font-family:<?php echo $font ?>; }
			<?php } 
			
			if($this->config->get('fortuna_title_font')!='') {
				$fontpre =  $this->config->get('fortuna_title_font');
				$font = str_replace("+", " ", $fontpre);
				?>
				h1 {
					font-family:<?php echo $font ?>;
				}
			<?php }

			if ($this->config->get('fortuna_small_font') != '') {
				$fontpre =  $this->config->get('fortuna_small_font');
				$font = str_replace("+", " ", $fontpre);
				?>
				small, .wishlist a, .compare a, .remove a, .product-compare, #topbar, #topbar a, .product-filter .display li, .product-list .price-tax, .product-info .price-tax, .product-info .price .reward, span.error, #copy, #footer .info, .breadcrumb a, .paginate .results, #welcome, .help {
					font-family:<?php echo $font ?>;
				}
			<?php }

			if ($this->config->get('fortuna_custom_css') != '') { 
				echo htmlspecialchars_decode( $this->config->get('fortuna_custom_css'), ENT_QUOTES );
			} ?>

		</style>

		<?php if ($this->config->get('fortuna_custom_stylesheet') != '') { ?>
			<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/custom.css" />
		<?php } ?>

	<?php } ?> <!-- fortuna_status END -->

	<?php echo $google_analytics; ?>

</head>

<body>

	<header id="header">

		<div id="topbar">
			<div class="container">
				<div class="row-fluid">
					
					<div class="span12 rightbox">
						<div id="outercart"><?php echo $cart; ?></div>
						<div id="wrapselector">
							<?php echo $language; ?>
			  				<?php echo $currency; ?>
		  				</div>
						
					</div>
				</div>
			</div>
		</div>

		<div class="container elements">

			<div class="row-fluid">

				<?php if($this->config->get('fortuna_logo_center')!='') { ?>

					<div class="span4 left">
						<?php if($this->config->get('fortuna_header_info_text') != '') { ?>
							<div class="info">
								<?php echo html_entity_decode($this->config->get('fortuna_header_info_text'), ENT_QUOTES, 'UTF-8');?>
							</div>
						<?php } ?>
					</div>

					<div id="logo" class="span4 centered">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>"><img src="catalog/view/theme/fortuna/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } ?>
					</div> <!-- #logo -->

				<?php } else { ?>

					<div id="logo" class="span4">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>"><img src="catalog/view/theme/fortuna/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } ?>
					</div> <!-- #logo -->

					<div class="span4">
						<?php if($this->config->get('fortuna_header_info_text') != '') { ?>
							<div class="info">
								<?php echo html_entity_decode($this->config->get('fortuna_header_info_text'), ENT_QUOTES, 'UTF-8');?>
							</div>
						<?php } ?>
					</div>

				<?php } ?>

				<div class="rightbox2 span4">
					
					<?php 
					if(($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_search_navbar')=='') || $this->config->get('fortuna_status')== 0 ) { ?>
					<div class="searchbox">
						<input type="search" name="filter_name" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" />
						<button class="button-search" type="button">
							<i class="icon-zoomin"></i>
						</button>
					</div>
					<?php } ?>

					<div id="welcome">
						<?php if (!$logged) { ?>
						<?php echo $text_welcome; ?>
						<?php } else { ?>
						<?php echo $text_logged; ?>
						<?php } ?>
					</div>

				</div>
					
				</div>

			</div>  <!-- .row-fluid -->

		</div>

		<div id="outernav">

			<div class="container">

			<?php if ($categories) { ?>

			<?php 
				if($this->config->get('fortuna_search_navbar')!='') { ?>
				<div class="searchbox">
					<input type="search" name="filter_name" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" />
					<button class="button-search" type="button">
						<i class="icon-zoomin"></i>
					</button>
				</div>
				<?php } ?>
		
				<nav id="mainnav" class="navbar" role="navigation">
					<div class="navbar-inner">
						<div class="container">

							<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
								<span>
								<?php $this->language->load('module/fortuna');
								echo $this->language->get('text_mobile_menu'); ?></span><i class="icon-navbtn"></i>
							</a>

							<div class="nav-collapse">
								<ul class="nav">

									<li id="homelink"><a href="<?php echo $home; ?>" title="<?php echo $text_home; ?>"><?php echo $text_home; ?></i></a></li>

									<?php foreach ($categories as $category) { ?>
										<li <?php if ($category['children']) { ?> class="dropdown"<?php } ?>><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
										<?php if ($category['children']) { ?>
											<ul class="dropdown-menu">
											<?php for ($i = 0; $i < count($category['children']);) { ?>
											<?php if ($category['column'] > 1) { ?>
												<li class="column-menu">
													<ul>
											<?php } ?>
											<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
											<?php for (; $i < $j; $i++) { ?>
												<?php if (isset($category['children'][$i])) { ?>
													<li>
														<a href="<?php echo $category['children'][$i]['href']; ?>">
															<?php echo $category['children'][$i]['name']; ?>
														</a>
													</li>
												<?php } ?>
											<?php } ?>
											<?php if ($category['column'] > 1) { ?>
													</ul>
												</li>
											<?php } ?>
											<?php } ?>
											</ul>
										<?php } ?>
										</li>
									<?php } ?>
								</ul>
							</div>
						</div>
					</div>
				</nav><!-- #navbar -->

			<?php } ?>
		
			</div>

		</div>

	</header> <!-- #header -->

	<section id="content-wrapper" class="container">
	