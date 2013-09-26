<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_featured_carousel') != '') { ?>

	<section id="featured-products" class="es-carousel-wrapper top-arrows">

		<div class="box-heading"><?php echo $heading_title; ?></div>

		<div class="es-carousel">

			<ul>

			<?php foreach ($products as $product) {  ?>
				
				<li>
					<div class="inner">

						<?php if ($product['price'] && $product['special']) { ?>
							<div class="onsale">
								<div class="ribbon">
									<?php $this->language->load('module/fortuna');
									echo $this->language->get('text_onsale'); ?>
								</div>
								<div class="ribbonshadow"></div>
							</div>
						<?php } ?>

						<?php if ($product['thumb']) { ?>
						<div class="image">
							<a href="<?php echo $product['href']; ?>">
								<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
							</a>
						</div>
						<?php } ?>

						<div class="name">
							<a href="<?php echo $product['href']; ?>">
								<?php echo $product['name']; ?>
							</a>
						</div>

						<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
						</div>
						<?php } ?>

						<?php if ($product['rating']) { ?>
						<div class="rating">
							<img src="catalog/view/theme/fortuna/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
						</div>
						<?php } ?>

						<div class="cart">
							<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart btn-small" />
						</div>

					</div> <!-- .span3 -->
				</li>

			<?php } ?>

			</ul>

	  </div>

	</section> <!-- .es-carousel-wrapper -->

	<script type="text/javascript">

		$('#featured-products').elastislide({

			speed       : 450,	// animation speed
			easing      : '',	// animation easing effect
			imageW		: 180, 	// the images width
			minItems	: 2,
			easing		: 'jswing',
			border		: 1
		});

		//Fix to adjust on windows resize
		$(window).triggerHandler('resize.elastislide');

	</script>

<?php } else { ?>

	<section id="featured-products" class="box">

		<div class="box-heading"><?php echo $heading_title; ?></div>

		<div class="box-content">

			<div class="box-product row-fluid">
				
				<?php 
				
				$counter = 0;
				
				foreach ($products as $product) { 
					
					if (($counter+2) % 4 == 0) $xclass="odd";
					else if (($counter+4) % 4 == 0 ) $xclass="alpha";
					else $xclass="";

				?>

				<div class="span3 grid-box <?php echo $xclass; ?>">

					<div class="inner">

						<?php if ($product['price'] && $product['special']) { ?>
							<div class="onsale">
								<div class="ribbon">
									<?php $this->language->load('module/fortuna');
									echo $this->language->get('text_onsale'); ?>
								</div>
								<div class="ribbonshadow"></div>
							</div>
						<?php } ?>

						<?php if ($product['thumb']) { ?>
						<div class="image">
							<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
						</div>
						<?php } ?>

						<div class="name">
							<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
						</div>

						<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
						</div>
						<?php } ?>

						<?php if ($product['rating']) { ?>
						<div class="rating">
							<img src="catalog/view/theme/fortuna/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
						</div>
						<?php } ?>

						<div class="cart">
							<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart btn-small" />
						</div>

					</div>

				</div>

				<?php $counter++; } ?>

			</div>

		</div>

	</section>

<?php } ?>