$(document).ready(function(){

	/* ---------------------------------------------------------------------- */
	/*	Forms Validation
	/* ---------------------------------------------------------------------- */

		jQuery.validator.setDefaults({
			errorClass: "error",  
			validClass: "success",  
			errorElement: "span",  
			highlight: function(element, errorClass, validClass) {	
				if (element.type === 'radio') { 
					this.findByName(element.name).parent("div").parent("div").removeClass(validClass).addClass(errorClass);	
				} else { $(element).parent("div").parent("div").removeClass(validClass).addClass(errorClass);	}  
			},  
			unhighlight: function(element, errorClass, validClass) { 
				if (element.type === 'radio') { this.findByName(element.name).parent("div").parent("div").removeClass(errorClass).addClass(validClass);	
				} else { $(element).parent("div").parent("div").removeClass(errorClass).addClass(validClass);	}  
			},
			errorPlacement: function(error, element) {
				error.insertAfter(element);
			}
		});

		$("#contact-form").validate({
		  rules: {
			enquiry: {
				required: true,
				minlength: 10
			}
		  }
		});

		$("#register-form, #password-form").validate({
		  rules: {
			password: {
				required: true, minlength: 3
			},
			confirm: {
				required: function(element) {
					var str = $("#password").val();

					return str.length > 0;
				},
				equalTo: "#password",
				minlength: 3
			}
		  }
		});

		$("#edit-account, #voucher, #address, #return, #login, #forgotten").validate();
	

	/* ---------------------------------------------------------------------- */
	/*	Flexslider - responsive slider
	/* ---------------------------------------------------------------------- */

		$(window).load(function() {

		    $('.flexslider').flexslider({

		    	animation: "fade",            //String: Select your animation type, "fade" or "slide"
				slideDirection: "horizontal", //String: Select the sliding direction, "horizontal" or "vertical"
				slideshow: true,              //Boolean: Animate slider automatically
				slideshowSpeed: 7000,         //Integer: Set the speed of the slideshow cycling, in milliseconds
				animationDuration: 600,       //Integer: Set the speed of animations, in milliseconds
				directionNav: true,           //Boolean: Create navigation for previous/next navigation? (true/false)
				controlNav: true,             //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
				keyboardNav: true,            //Boolean: Allow slider navigating via keyboard left/right keys
				mousewheel: false,            //Boolean: Allow slider navigating via mousewheel
				prevText: "Previous",         //String: Set the text for the "previous" directionNav item
				nextText: "Next",             //String: Set the text for the "next" directionNav item
				randomize: false,             //Boolean: Randomize slide order
				slideToStart: 0,              //Integer: The slide that the slider should start on. Array notation (0 = first slide)
				animationLoop: true,          //Boolean: Should the animation loop? If false, directionNav will received "disable" classes at either end
				pauseOnAction: true,          //Boolean: Pause the slideshow when interacting with control elements, highly recommended.
				pauseOnHover: false          //Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering
		    });

		  });


	/* ---------------------------------------------------------------------- */
	/*	Elastislide - responsive carousel
	/* ---------------------------------------------------------------------- */

		// Because of dynamic options, moved to carousel.tpl


	/* ---------------------------------------------------------------------- */
	/*	Search
	/* ---------------------------------------------------------------------- */

		$('.button-search').bind('click', function() {
			url = $('base').attr('href') + 'index.php?route=product/search';
					 
			var filter_name = $('input[name=\'filter_name\']').attr('value');
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			location = url;
		});
		
		$('#header input[name=\'filter_name\']').bind('keydown', function(e) {
			if (e.keyCode == 13) {
				url = $('base').attr('href') + 'index.php?route=product/search';
				 
				var filter_name = $('input[name=\'filter_name\']').attr('value');
				
				if (filter_name) {
					url += '&filter_name=' + encodeURIComponent(filter_name);
				}
				
				location = url;
			}
		});

	 
	/* ---------------------------------------------------------------------- */
	/*	Opacity animation on hover
	/* ---------------------------------------------------------------------- */

		if ($.browser.msie && ($.browser.version == 8 || $.browser.version == 7 || $.browser.version == 6)) {

		} else {
		 
			$(".box-product > div").hover(function() {
				$(this).siblings().stop().animate({ opacity: .65 }, 300)}, function () {
					$(this).siblings().stop().animate({ opacity: 1 }, 300)}
			);

			$(".product-grid > div").hover(function() { 
				$(this).siblings().stop().animate({ opacity: .65 }, 500)}, function () {
					$(this).siblings().stop().animate({ opacity: 1 }, 300) }
			);

			$(".es-carousel > ul > li").hover(function() { 
				$(this).siblings().stop().animate({ opacity: .65 }, 500)}, function () {
					$(this).siblings().stop().animate({ opacity: 1 }, 300) }
			);

			$(".image-additional > a").hover(function() { 
				$(this).siblings().stop().animate({ opacity: .65 }, 500)}, function () {
					$(this).siblings().stop().animate({ opacity: 1 }, 300) }
			);
		}


	/* ---------------------------------------------------------------------- */
	/*	Ajax Minicart
	/* ---------------------------------------------------------------------- */

		$('#cart .arrow').live('mouseover', function() {
			$('#cart').addClass('active');
			
			$('#cart').load('index.php?route=module/cart #cart > *');

			$('#cart > .content').slideToggle('fast');
			
			$('#cart').live('mouseleave', function() {
				$(this).removeClass('active');
			});
		});

	/* ---------------------------------------------------------------------- */
	/*	Footer menu
	/* ---------------------------------------------------------------------- */

		$(".column .header").click(function () {

			$screensize = $(window).width();

			if ($screensize < 767) {
				$(this).toggleClass("active");  
				$(this).parent().find(".content").slideToggle('medium');
			}

		});

	/* ---------------------------------------------------------------------- */
	/*	Scroll to top
	/* ---------------------------------------------------------------------- */
	
		$().UItoTop({ 
			easingType: 'easeOutQuart',
			scrollSpeed: 1200
		});

	/* ---------------------------------------------------------------------- */
	/*	Toggle sidebar
	/* ---------------------------------------------------------------------- */
		
		$("#toggle_sidebar").click(function () {

			$(this).toggleClass("collapse");

			$("#column-left").toggleClass("close");

			$("#maincontent").toggleClass('span9 span12');

		});
	
	/* ---------------------------------------------------------------------- */
	/*	Colorbox
	/* ---------------------------------------------------------------------- */

		$('.colorbox').colorbox({
			overlayClose: true,
			opacity: 0.5,
			maxHeight: 560,
			maxWidth: 560,
			width:'100%'
		});

});

	/* ---------------------------------------------------------------------- */
	/*	Add to Cart
	/* ---------------------------------------------------------------------- */

		function addToCart(product_id, quantity) {
			quantity = typeof(quantity) != 'undefined' ? quantity : 1;

			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: 'product_id=' + product_id + '&quantity=' + quantity,
				dataType: 'json',
				success: function(json) {
					$('.alert, .success, .warning, .attention, .information, .error').remove();
					
					if (json['redirect']) {
						location = json['redirect'];
					}
					
					if (json['success']) {
						$('#notification').html('<div class="alert success">' + json['success'] + '<a class="close" data-dismiss="alert" href="#">&times;</a></div>');
						
						$('.alert success').fadeIn('slow');
						
						$('#cart-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});
		}

	/* ---------------------------------------------------------------------- */
	/*	Add to Wishlist
	/* ---------------------------------------------------------------------- */

		function addToWishList(product_id) {
			$.ajax({
				url: 'index.php?route=account/wishlist/add',
				type: 'post',
				data: 'product_id=' + product_id,
				dataType: 'json',
				success: function(json) {
					$('.alert, .success, .warning, .attention, .information').remove();
								
					if (json['success']) {
						$('#notification').after('<div class="alert success">' + json['success'] + '<a class="close" data-dismiss="alert" href="#">&times;</a></div>');
						
						$('.alert success').fadeIn('slow');
						
						$('#wishlist-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}	
				}
			});
		}

	/* ---------------------------------------------------------------------- */
	/*	Add to Compare
	/* ---------------------------------------------------------------------- */

		function addToCompare(product_id) { 
			$.ajax({
				url: 'index.php?route=product/compare/add',
				type: 'post',
				data: 'product_id=' + product_id,
				dataType: 'json',
				success: function(json) {
					$('.alert, .success, .warning, .attention, .information').remove();
								
					if (json['success']) {
						$('#notification').html('<div class="alert success fade in">' + json['success'] + '<a class="close" data-dismiss="alert" href="#">&times;</a></div>');
						
						$('.alert success').fadeIn('slow');
						
						$('#compare-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});
		}

	/* ---------------------------------------------------------------------- */
	/*	jquery.cookie.js Apache mod_security blocks the file in some servers.
	/* ---------------------------------------------------------------------- */


		/**
		 * jQuery Cookie plugin
		 *
		 * Copyright (c) 2010 Klaus Hartl (stilbuero.de)
		 * Dual licensed under the MIT and GPL licenses:
		 * http://www.opensource.org/licenses/mit-license.php
		 * http://www.gnu.org/licenses/gpl.html
		 *
		 */

		/**
		 *
		 * @name $.cookie
		 * @cat Plugins/Cookie
		 * @author Klaus Hartl/klaus.hartl@stilbuero.de
		 */
		jQuery.cookie = function (key, value, options) {

		    // key and value given, set cookie...
		    if (arguments.length > 1 && (value === null || typeof value !== "object")) {
		        options = jQuery.extend({}, options);

		        if (value === null) {
		            options.expires = -1;
		        }

		        if (typeof options.expires === 'number') {
		            var days = options.expires, t = options.expires = new Date();
		            t.setDate(t.getDate() + days);
		        }

		        return (document.cookie = [
		            encodeURIComponent(key), '=',
		            options.raw ? String(value) : encodeURIComponent(String(value)),
		            options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
		            options.path ? '; path=' + options.path : '',
		            options.domain ? '; domain=' + options.domain : '',
		            options.secure ? '; secure' : ''
		        ].join(''));
		    }

		    // key and possibly options given, get cookie...
		    options = value || {};
		    var result, decode = options.raw ? function (s) { return s; } : decodeURIComponent;
		    return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
		};


	/* ---------------------------------------------------------------------- */
	/*	Grid/List view
	/* ---------------------------------------------------------------------- */

		function display(view) {

			if (view == 'list') {

				$('#list').addClass('active');

				$('.product-grid').attr('class', 'product-list');
				
				$('.product-list > div').each(function(index, element) {

					$(this).removeClass('alpha alpha3 alpha4 odd grid-box');

					$(this).addClass('product-row');

					var special = $(element).find('.onsale').html();
					
					if (special != null) {
						html = '<span class="onsale">' + special  + '</span>';
						html += '<div class="row-fluid">';
					} else {
						html = '<div class="row-fluid">';
					}
				
					var image = $(element).find('.image').html();

					if (image != null) { 
						html += '<div class="image span3">' + image + '</div>';
					} else {
						html += '<div class="image span3">&nbsp;</div>';
					}
										
					html += '<div class="name-desc span4">';

					html += '<div class="name">' + $(element).find('.name').html() + '</div>';
					var rating = $(element).find('.rating').html();
					
					if (rating != null) {
						html += '<div class="rating">' + rating + '</div>';
					}
					html += '<div class="description">' + $(element).find('.description').html() + '</div>';

					html += '</div>';
					
					var price = $(element).find('.price').html();
					
					if (price != null) {
						html += '<div class="price span2">' + price  + '</div>';
					} else {
						html += '<div class="price span2">&nbsp;</div>';
					}

					html += '<div class="actions span3">';
					html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
					
					var wishlist = $(element).find('.wishlist').html();
					if (wishlist != null) {
						html += '  <div class="wishlist">' + wishlist + '</div>';
					}

					var compare = $(element).find('.compare').html();
					if (compare != null) {
						html += '  <div class="compare">' + compare + '</div>';
					}

					html += '</div>';

					html += '</div>';

					$(element).html(html);
				});
				
				$.cookie('display', 'list'); 

			} else {

				$('#grid').addClass('active');
				
				$('.product-list').attr('class', 'product-grid row');
				
				$('.product-grid > div').each(function(index, element) {

					$(this).removeClass('row-fluid');
					
					$(this).addClass('grid-box');

					if (index == 0 ) {	$(this).addClass('alpha');	}
					else if ((index+3) % 3 == 0 ) {	$(this).addClass('alpha3');	}
					else if ((index+4) % 4 == 0 ) {	$(this).addClass('alpha4');	}

					if ((index+2) % 2 == 0 ) { $(this).addClass('odd');	}

					html = '';
					
					var image = $(element).find('.image').html();

					html += '<div class="inner">';

					var special = $(element).find('.onsale').html();
					
					if (special != null) {
						html += '<span class="onsale">' + special  + '</span>';
					}
					
					if (image != null) {
						html += '<div class="image">' + image + '</div>';
					}
					
					html += '<div class="name">' + $(element).find('.name').html() + '</div>';

					var rating = $(element).find('.rating').html();
					
					if (rating != null) {
						html += '<div class="rating">' + rating + '</div>';
					}

					html += '<div class="description">' + $(element).find('.description').html() + '</div>';
					
					var price = $(element).find('.price').html();
					
					if (price != null) {
						html += '<div class="price">' + price  + '</div>';
					}
								
					html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
					
					var wishlist = $(element).find('.wishlist').html();
					if (wishlist != null) {
						html += '  <div class="wishlist">' + wishlist + '</div>';
					}

					var compare = $(element).find('.compare').html();
					if (compare != null) {
						html += '  <div class="compare">' + compare + '</div>';
					}

					html += '</div>';
					
					$(element).html(html);

				});
										
				$.cookie('display', 'grid');

			}

		}

		view = $.cookie('display');

		if (view) {	display(view);	} 
		else { display('grid'); }