<?php echo $header; ?>

<?php /* regular and Google fonts array*/
	
	$fonts = array(
		''                         => '- default -',
		'Arial'                    => 'Arial',
		'Verdana'                  => 'Verdana',
		'Helvetica'                => 'Helvetica',
		'Lucida Grande'            => 'Lucida Grande',
		'Trebuchet MS'             => 'Trebuchet MS',
		'Times New Roman'          => 'Times New Roman',
		'Tahoma'                   => 'Tahoma',
		'Georgia'                  => 'Georgia',
		
		'Abel'                     => 'Abel',
		'Abril+Fatface'            => 'Abril Fatface',
		'Aclonica'                 => 'Aclonica',
		'Acme'                     => 'Acme',
		'Actor'                    => 'Actor',
		'Adamina'                  => 'Adamina',
		'Aguafina+Script'          => 'Aguafina Script',
		'Aladin'                   => 'Aladin',
		'Aldrich'                  => 'Aldrich',
		'Alegreya'                 => 'Alegreya',
		'Alegreya+SC'              => 'Alegreya SC',
		'Alex+Brush'               => 'Alex Brush',
		'Alfa+Slab+One'            => 'Alfa Slab One',
		'Alice'                    => 'Alice',
		'Alike'                    => 'Alike',
		'Alike+Angular'            => 'Alike Angular',
		'Allan'                    => 'Allan',
		'Allerta'                  => 'Allerta',
		'Allerta+Stencil'          => 'Allerta Stencil',
		'Allura'                   => 'Allura',
		'Almendra'                 => 'Almendra',
		'Almendra+SC'              => 'Almendra SC',
		'Amaranth'                 => 'Amaranth',
		'Amatic+SC'                => 'Amatic SC',
		'Amethysta'                => 'Amethysta',
		'Andada'                   => 'Andada',
		'Andika'                   => 'Andika',
		'Annie+Use+Your+Telescope' => 'Annie Use Your Telescope',
		'Anonymous+Pro'            => 'Anonymous Pro',
		'Antic'                    => 'Antic',
		'Anton'                    => 'Anton',
		'Arapey'                   => 'Arapey',
		'Architects+Daughter'      => 'Architects Daughter',
		'Arizonia'                 => 'Arizonia',
		'Armata'                   => 'Armata',
		'Artifika'                 => 'Artifika',
		'Arvo'                     => 'Arvo',
		'Asap'                     => 'Asap',
		'Asul'                     => 'Asul',
		'Atomic+Age'               => 'Atomic Age',
		'Aubrey'                   => 'Aubrey',
		'Bad+Script'               => 'Bad Script',
		'Bangers'                  => 'Bangers',
		'Basic'                    => 'Basic',
		'Baumans'                  => 'Baumans',
		'Belgrano'                 => 'Belgrano',
		'Bentham'                  => 'Bentham',
		'Bevan'                    => 'Bevan',
		'Bigshot+One'              => 'Bigshot One',
		'Bilbo'                    => 'Bilbo',
		'Bilbo+Swash+Caps'         => 'Bilbo Swash Caps',
		'Bitter'                   => 'Bitter',
		'Black+Ops+One'            => 'Black Ops One',
		'Boogaloo'                 => 'Boogaloo',
		'Bowlby+One'               => 'Bowlby One',
		'Bowlby+One+SC'            => 'Bowlby One SC',
		'Brawler'                  => 'Brawler',
		'Bree+Serif'               => 'Bree Serif',
		'Bubblegum+Sans'           => 'Bubblegum Sans',
		'Buda'                     => 'Buda',
		'Buenard'                  => 'Buenard',
		'Cabin'                    => 'Cabin',
		'Cabin+Condensed'          => 'Cabin Condensed',
		'Caesar+Dressing'          => 'Caesar Dressing',
		'Cagliostro'               => 'Cagliostro',
		'Cambo'                    => 'Cambo',
		'Candal'                   => 'Candal',
		'Cantarell'                => 'Cantarell',
		'Cardo'                    => 'Cardo',
		'Carme'                    => 'Carme',
		'Carter+One'               => 'Carter One',
		'Ceviche+One'              => 'Ceviche One',
		'Changa+One'               => 'Changa One',
		'Chango'                   => 'Chango',
		'Chelsea+Market'           => 'Chelsea Market',
		'Cherry+Cream+Soda'        => 'Cherry Cream Soda',
		'Chewy'                    => 'Chewy',
		'Chicle'                   => 'Chicle',
		'Coda'                     => 'Coda',
		'Coda+Caption'             => 'Coda Caption',
		'Comfortaa'                => 'Comfortaa',
		'Concert+One'              => 'Concert One',
		'Condiment'                => 'Condiment',
		'Contrail+One'             => 'Contrail One',
		'Convergence'              => 'Convergence',
		'Cookie'                   => 'Cookie',
		'Copse'                    => 'Copse',
		'Corben'                   => 'Corben',
		'Cousine'                  => 'Cousine',
		'Coustard'                 => 'Coustard',
		'Covered+By+Your+Grace'    => 'Covered By Your Grace',
		'Crete+Round'              => 'Crete Round',
		'Crimson+Text'             => 'Crimson Text',
		'Crushed'                  => 'Crushed',
		'Cuprum'                   => 'Cuprum',
		'Damion'                   => 'Damion',
		'Dancing+Script'           => 'Dancing Script',
		'Days+One'                 => 'Days One',
		'Delius'                   => 'Delius',
		'Delius+Unicase'           => 'Delius Unicase',
		'Devonshire'               => 'Devonshire',
		'Didact+Gothic'            => 'Didact Gothic',
		'Dorsa'                    => 'Dorsa',
		'Dr+Sugiyama'              => 'Dr Sugiyama',
		'Droid+Sans'               => 'Droid Sans',
		'Droid+Sans+Mono'          => 'Droid Sans Mono',
		'Droid+Serif'              => 'Droid Serif',
		'Duru+Sans'                => 'Duru Sans',
		'Dynalight'                => 'Dynalight',
		'Eater'                    => 'Eater',
		'EB+Garamond'              => 'EB Garamond',
		'Electrolize'              => 'Electrolize',
		'Emblema+One'              => 'Emblema One',
		'Engagement'               => 'Engagement',
		'Enriqueta'                => 'Enriqueta',
		'Erica+One'                => 'Erica One',
		'Esteban'                  => 'Esteban',
		'Euphoria+Script'          => 'Euphoria Script',
		'Exo'                      => 'Exo',
		'Expletus+Sans'            => 'Expletus Sans',
		'Fanwood+Text'             => 'Fanwood Text',
		'Federant'                 => 'Federant',
		'Federo'                   => 'Federo',
		'Felipa'                   => 'Felipa',
		'Fjord+One'                => 'Fjord One',
		'Flamenco'                 => 'Flamenco',
		'Flavors'                  => 'Flavors',
		'Fondamento'               => 'Fondamento',
		'Fontdiner+Swanky'         => 'Fontdiner Swanky',
		'Forum'                    => 'Forum',
		'Francois+One'             => 'Francois One',
		'Fresca'                   => 'Fresca',
		'Fugaz+One'                => 'Fugaz One',
		'Gentium+Basic'            => 'Gentium Basic',
		'Gentium+Book+Basic'       => 'Gentium Book Basic',
		'Geo'                      => 'Geo',
		'Germania+One'             => 'Germania One',
		'Give+You+Glory'           => 'Give You Glory',
		'Glegoo'                   => 'Glegoo',
		'Gloria+Hallelujah'        => 'Gloria Hallelujah',
		'Goblin+One'               => 'Goblin One',
		'Gochi+Hand'               => 'Gochi Hand',
		'Goudy+Bookletter+1911'    => 'Goudy Bookletter 1911',
		'Gravitas+One'             => 'Gravitas One',
		'Gruppo'                   => 'Gruppo',
		'Gudea'                    => 'Gudea',
		'Habibi'                   => 'Habibi',
		'Hammersmith+One'          => 'Hammersmith One',
		'Handlee'                  => 'Handlee',
		'Holtwood+One+SC'          => 'Holtwood One SC',
		'Homenaje'                 => 'Homenaje',
		'Iceberg'                  => 'Iceberg',
		'Iceland'                  => 'Iceland',
		'IM+Fell+Double+Pica'      => 'IM Fell Double Pica',
		'IM+Fell+Double+Pica+SC'   => 'IM Fell Double Pica SC',
		'IM+Fell+DW+Pica+SC'       => 'IM Fell DW Pica SC',
		'IM+Fell+French+Canon'     => 'IM Fell French Canon',
		'IM+Fell+French+Canon+SC'  => 'IM Fell French Canon SC',
		'IM+Fell+Great+Primer'     => 'IM Fell Great Primer',
		'IM+Fell+Great+Primer+SC'  => 'IM Fell Great Primer SC',
		'Inconsolata'              => 'Inconsolata',
		'Inder'                    => 'Inder',
		'Indie+Flower'             => 'Indie Flower',
		'Irish+Grover'             => 'Irish Grover',
		'Italianno'                => 'Italianno',
		'Jim+Nightshade'           => 'Jim Nightshade',
		'Jockey+One'               => 'Jockey One',
		'Josefin+Sans'             => 'Josefin Sans',
		'Josefin+Slab'             => 'Josefin Slab',
		'Judson'                   => 'Judson',
		'Julee'                    => 'Julee',
		'Junge'                    => 'Junge',
		'Jura'                     => 'Jura',
		'Just+Another+Hand'        => 'Just Another Hand',
		'Kameron'                  => 'Kameron',
		'Kaushan+Script'           => 'Kaushan Script',
		'Kelly+Slab'               => 'Kelly Slab',
		'Kenia'                    => 'Kenia',
		'Knewave'                  => 'Knewave',
		'Kotta+One'                => 'Kotta One',
		'Kreon'                    => 'Kreon',
		'Lancelot'                 => 'Lancelot',
		'Lato'                     => 'Lato',
		'Lekton'                   => 'Lekton',
		'Lemon'                    => 'Lemon',
		'Lilita+One'               => 'Lilita One',
		'Limelight'                => 'Limelight',
		'Linden+Hill'              => 'Linden Hill',
		'Lobster'                  => 'Lobster',
		'Lobster+Two'              => 'Lobster Two',
		'Lora'                     => 'Lora',
		'Love+Ya+Like+A+Sister'    => 'Love Ya Like A Sister',
		'Luckiest+Guy'             => 'Luckiest Guy',
		'Lustria'                  => 'Lustria',
		'Macondo'                  => 'Macondo',
		'Macondo+Swash+Caps'       => 'Macondo Swash Caps',
		'Magra'                    => 'Magra',
		'Maiden+Orange'            => 'Maiden Orange',
		'Mako'                     => 'Mako',
		'Marck+Script'             => 'Marck Script',
		'Marko+One'                => 'Marko One',
		'Marmelad'                 => 'Marmelad',
		'Marvel'                   => 'Marvel',
		'Mate'                     => 'Mate',
		'Mate+SC'                  => 'Mate SC',
		'Maven+Pro'                => 'Maven Pro',
		'MedievalSharp'            => 'MedievalSharp',
		'Medula+One'               => 'Medula One',
		'Megrim'                   => 'Megrim',
		'Merienda+One'             => 'Merienda One',
		'Merriweather'             => 'Merriweather',
		'Metamorphous'             => 'Metamorphous',
		'Metrophobic'              => 'Metrophobic',
		'Michroma'                 => 'Michroma',
		'Miltonian+Tattoo'         => 'Miltonian Tattoo',
		'Modern+Antiqua'           => 'Modern Antiqua',
		'Molengo'                  => 'Molengo',
		'Monoton'                  => 'Monoton',
		'Montaga'                  => 'Montaga',
		'Montez'                   => 'Montez',
		'Mountains+of+Christmas'   => 'Mountains of Christmas',
		'Mr+Bedfort'               => 'Mr Bedfort',
		'Mr+Dafoe'                 => 'Mr Dafoe',
		'Mrs+Sheppards'            => 'Mrs Sheppards',
		'Muli'                     => 'Muli',
		'Neucha'                   => 'Neucha',
		'Neuton'                   => 'Neuton',
		'News+Cycle'               => 'News Cycle',
		'Niconne'                  => 'Niconne',
		'Nixie+One'                => 'Nixie One',
		'Nobile'                   => 'Nobile',
		'Norican'                  => 'Norican',
		'Nosifer'                  => 'Nosifer',
		'Nothing+You+Could+Do'     => 'Nothing You Could Do',
		'Noticia+Text'             => 'Noticia Text',
		'Nova+Cut'                 => 'Nova Cut',
		'Nova+Flat'                => 'Nova Flat',
		'Nova+Mono'                => 'Nova Mono',
		'Nova+Oval'                => 'Nova Oval',
		'Nova+Round'               => 'Nova Round',
		'Nova+Script'              => 'Nova Script',
		'Nova+Slim'                => 'Nova Slim',
		'Nova+Square'              => 'Nova Square',
		'Numans'                   => 'Numans',
		'Nunito'                   => 'Nunito',
		'Old+Standard+TT'          => 'Old Standard TT',
		'Oldenburg'                => 'Oldenburg',
		'Open+Sans'                => 'Open Sans',
		'Open+Sans+Condensed'      => 'Open Sans Condensed',
		'Orbitron'                 => 'Orbitron',
		'Original+Surfer'          => 'Original Surfer',
		'Oswald'                   => 'Oswald',
		'Overlock'                 => 'Overlock',
		'Overlock+SC'              => 'Overlock SC',
		'Ovo'                      => 'Ovo',
		'Pacifico'                 => 'Pacifico',
		'Parisienne'               => 'Parisienne',
		'Passero+One'              => 'Passero One',
		'Passion+One'              => 'Passion One',
		'Patrick+Hand'             => 'Patrick Hand',
		'Patua+One'                => 'Patua One',
		'Paytone+One'              => 'Paytone One',
		'Permanent+Marker'         => 'Permanent Marker',
		'Petrona'                  => 'Petrona',
		'Philosopher'              => 'Philosopher',
		'Piedra'                   => 'Piedra',
		'Pinyon+Script'            => 'Pinyon Script',
		'Play'                     => 'Play',
		'Playball'                 => 'Playball',
		'Playfair+Display'         => 'Playfair Display',
		'Podkova'                  => 'Podkova',
		'Poller+One'               => 'Poller One',
		'Pompiere'                 => 'Pompiere',
		'Prata'                    => 'Prata',
		'Prociono'                 => 'Prociono',
		'PT+Sans'                  => 'PT Sans',
		'PT+Sans+Caption'          => 'PT Sans Caption',
		'PT+Sans+Narrow'           => 'PT Sans Narrow',
		'PT+Serif'                 => 'PT Serif',
		'PT+Serif+Caption'         => 'PT Serif Caption',
		'Quantico'                 => 'Quantico',
		'Quattrocento'             => 'Quattrocento',
		'Quattrocento+Sans'        => 'Quattrocento Sans',
		'Questrial'                => 'Questrial',
		'Quicksand'                => 'Quicksand',
		'Qwigley'                  => 'Qwigley',
		'Radley'                   => 'Radley',
		'Raleway'                  => 'Raleway',
		'Rammetto+One'             => 'Rammetto One',
		'Rancho'                   => 'Rancho',
		'Rationale'                => 'Rationale',
		'Redressed'                => 'Redressed',
		'Reenie+Beanie'            => 'Reenie Beanie',
		'Ribeye'                   => 'Ribeye',
		'Ribeye+Marrow'            => 'Ribeye Marrow',
		'Righteous'                => 'Righteous',
		'Rochester'                => 'Rochester',
		'Rock+Salt'                => 'Rock Salt',
		'Rokkitt'                  => 'Rokkitt',
		'Ropa+Sans'                => 'Ropa Sans',
		'Rosario'                  => 'Rosario',
		'Ruda'                     => 'Ruda',
		'Ruluko'                   => 'Ruluko',
		'Ruslan+Display'           => 'Ruslan Display',
		'Sail'                     => 'Sail',
		'Salsa'                    => 'Salsa',
		'Sancreek'                 => 'Sancreek',
		'Sansita+One'              => 'Sansita One',
		'Satisfy'                  => 'Satisfy',
		'Shadows+Into+Light'       => 'Shadows Into Light',
		'Shanti'                   => 'Shanti',
		'Share'                    => 'Share',
		'Sigmar+One'               => 'Sigmar One',
		'Signika'                  => 'Signika',
		'Signika+Negative'         => 'Signika Negative',
		'Six+Caps'                 => 'Six Caps',
		'Slackey'                  => 'Slackey',
		'Smokum'                   => 'Smokum',
		'Smythe'                   => 'Smythe',
		'Sofia'                    => 'Sofia',
		'Sonsie+One'               => 'Sonsie One',
		'Sorts+Mill+Goudy'         => 'Sorts Mill Goudy',
		'Special+Elite'            => 'Special Elite',
		'Spicy+Rice'               => 'Spicy Rice',
		'Spinnaker'                => 'Spinnaker',
		'Spirax'                   => 'Spirax',
		'Squada+One'               => 'Squada One',
		'Stardos+Stencil'          => 'Stardos Stencil',
		'Stint+Ultra+Condensed'    => 'Stint Ultra Condensed',
		'Stoke'                    => 'Stoke',
		'Sue+Ellen+Francisco'      => 'Sue Ellen Francisco',
		'Supermercado+One'         => 'Supermercado One',
		'Syncopate'                => 'Syncopate',
		'Tangerine'                => 'Tangerine',
		'Tenor+Sans'               => 'Tenor Sans',
		'Terminal+Dosis'           => 'Terminal Dosis',
		'Tienne'                   => 'Tienne',
		'Tinos'                    => 'Tinos',
		'Titan+One'                => 'Titan One',
		'Trade+Winds'              => 'Trade Winds',
		'Trochut'                  => 'Trochut',
		'Trykker'                  => 'Trykker',
		'Tulpen+One'               => 'Tulpen One',
		'Ubuntu'                   => 'Ubuntu',
		'Ubuntu+Condensed'         => 'Ubuntu Condensed',
		'Ubuntu+Mono'              => 'Ubuntu Mono',
		'Ultra'                    => 'Ultra',
		'Uncial+Antiqua'           => 'Uncial Antiqua',
		'UnifrakturCook'           => 'UnifrakturCook',
		'UnifrakturMaguntia'       => 'UnifrakturMaguntia',
		'Unkempt'                  => 'Unkempt',
		'Unlock'                   => 'Unlock',
		'Varela'                   => 'Varela',
		'Varela+Round'             => 'Varela Round',
		'Vibur'                    => 'Vibur',
		'Vidaloka'                 => 'Vidaloka',
		'Viga'                     => 'Viga',
		'Volkhov'                  => 'Volkhov',
		'Vollkorn'                 => 'Vollkorn',
		'Voltaire'                 => 'Voltaire',
		'VT323'                    => 'VT323',
		'Waiting+for+the+Sunrise'  => 'Waiting for the Sunrise',
		'Wallpoet'                 => 'Wallpoet',
		'Walter+Turncoat'          => 'Walter Turncoat',
		'Wellfleet'                => 'Wellfleet',
		'Wire+One'                 => 'Wire One',
		'Yanone+Kaffeesatz'        => 'Yanone Kaffeesatz',
		'Yellowtail'               => 'Yellowtail',
		'Yeseva+One'               => 'Yeseva One',
		'Yesteryear'               => 'Yesteryear',
		); 

	$skins = array(
		''       => 'Default', 
		'light'  => 'Light',
		'dark'   => 'Dark',
		'pastel' => 'Pastel',
	);

// Default values

// Header

if(empty($fortuna_header_background_color)) $fortuna_header_background_color ="F9F9F9";
if(empty($fortuna_header_text_color)) $fortuna_header_text_color             ="999999";
if(empty($fortuna_topbar_background)) $fortuna_topbar_background             ="212121";
if(empty($fortuna_topbar_text_color)) $fortuna_topbar_text_color             ="656565";
if(empty($fortuna_topbar_links)) $fortuna_topbar_links                       ="FFFFFF";
if(empty($fortuna_menu_color)) $fortuna_menu_color                           ="333333";
if(empty($fortuna_menu_separator)) $fortuna_menu_separator                   ="E7E7E7";

// Body

if(empty($fortuna_body_background_color)) $fortuna_body_background_color     ="FFFFFF";
if(empty($fortuna_title_color)) $fortuna_title_color                         ="333333";
if(empty($fortuna_bodytext_color)) $fortuna_bodytext_color                   ="333333";
if(empty($fortuna_lighttext_color)) $fortuna_lighttext_color                 ="777777";
if(empty($fortuna_content_links_color)) $fortuna_content_links_color         ="C53727";

// Footer

if(empty($fortuna_footer_text_color)) $fortuna_footer_text_color             ="333333";
if(empty($fortuna_footer_links_color)) $fortuna_footer_links_color           ="777777";

// add to cart buttons

if(empty($fortuna_button_top_color)) $fortuna_button_top_color               ="DD4B39";
if(empty($fortuna_button_bottom_color)) $fortuna_button_bottom_color         ="D14836";
if(empty($fortuna_button_border_color)) $fortuna_button_border_color         ="C53727";
if(empty($fortuna_button_text_color)) $fortuna_button_text_color             ="FFFFFF";

// secondary buttons

if(empty($fortuna_2button_top_color)) $fortuna_2button_top_color             ="505050";
if(empty($fortuna_2button_bottom_color)) $fortuna_2button_bottom_color       ="191919";
if(empty($fortuna_2button_border_color)) $fortuna_2button_border_color       ="373737";
if(empty($fortuna_2button_text_color)) $fortuna_2button_text_color           ="FFFFFF";

// Products
if(empty($fortuna_product_name_color)) $fortuna_product_name_color           ="000000";
if(empty($fortuna_normal_price_color)) $fortuna_normal_price_color           ="333333";
if(empty($fortuna_old_price_color)) $fortuna_old_price_color                 ="999999";
if(empty($fortuna_new_price_color)) $fortuna_new_price_color                 ="FF0000";

if(empty($fortuna_onsale_background_color)) $fortuna_onsale_background_color ="ec3237";
if(empty($fortuna_onsale_text_color)) $fortuna_onsale_text_color             ="FFFFFF";

// Other
if(empty($fortuna_categories_menu_color)) $fortuna_categories_menu_color     ="333333";

if(empty($fortuna_facebook_label)) $fortuna_facebook_label     ="Facebook";


?>

<style type="text/css">
	.customhelp { color: #666; font-size:0.9em; }
	.color { <?php echo $entry_border_caption; ?>1px solid #AAA; }
	.pttrn {width:32px; display: inline-block; text-align: center;}
</style>

<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

<div class="box">

	<div class="heading">
		<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
		<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
	</div>

	<div class="content">

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

		<div style="margin-<?php echo $entry_bottom_caption; ?> 10px">
			<label><?php echo $entry_status; ?></label>
			<select name="fortuna_status">
				<?php if ($fortuna_status) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			</select>

			<span class="customhelp"><?php echo $theme_version; ?></span>

		</div>

		<div id="settings_tabs" class="htabs clearfix">
			<a href="#design_settings"><?php echo $entry_tab_design; ?></a>
			<a href="#functions_settings"><?php echo $entry_tab_functions; ?></a>
			<a href="#header_settings"><?php echo $entry_tab_header; ?></a>
			<a href="#footer_settings"><?php echo $entry_tab_footer; ?></a>
			<a href="#custom_code_settings"><?php echo $entry_tab_custom_code; ?></a>
		</div>

		<div id="design_settings" class="divtab">

			<table class="form">

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_skins_sub; ?></h3>
						<span class="customhelp"><?php echo $entry_skins_sub_help; ?></span>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_skin; ?></td>
					<td>
						<select name="fortuna_skins">
							<?php foreach ($skins as $sv => $sc) { ?>
								<?php ($sv ==  $this->config->get('fortuna_skins')) ? $currentskin = 'selected' : $currentskin=''; ?>
								<option value="<?php echo $sv; ?>" <?php echo $currentskin; ?> ><?php echo $sc; ?></option>	
							<?php } ?>
						</select>
						<span class="customhelp"><?php echo $entry_skin_help; ?></span>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_pattern_sub; ?></h3>
					</td>
				</tr>

				<tr>
					<td><?php echo $entry_pattern_overlay; ?></td>
					<td>
						<div>
							<?php for ($i = 1; $i <= 42; $i++) { ?>
								<div class="pttrn"><span class="customhelp"><?php echo $i; ?></span><img src="view/image/patterns/<?php echo $i; ?>.png" alt="pattern <?php echo $i; ?>"></div>
								<?php if(!($i%14)): ?>
									<br />
								<?php endif ?>
							<?php } ?>
						</div> <br />
						<select name="fortuna_pattern_overlay">
							<option value="none"selected="selected">none</option>
							<?php for ($i = 1; $i <= 42; $i++) { 
									($this->config->get('fortuna_pattern_overlay')== $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>'; 
								<?php } ?>
						</select>
						<span class="customhelp"><?php echo $entry_pattern_overlay_help; ?></span>
					</td>
				</tr>
				
				<tr>
					<td><?php echo $entry_custom_pattern; ?></td>
					<td>
						<input type="hidden" name="fortuna_custom_pattern" value="<?php echo $fortuna_custom_pattern; ?>" id="fortuna_custom_pattern" />
						<img src="<?php echo $fortuna_pattern_preview; ?>" id="fortuna_pattern_preview" />
						<br /><a onclick="image_upload('fortuna_custom_pattern', 'fortuna_pattern_preview');"><?php echo $text_select; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#fortuna_pattern_preview').attr('src', '<?php echo $no_image; ?>'); $('#fortuna_custom_pattern').attr('value', '');"><?php echo $text_clear; ?></a>
					</td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_custom_image; ?> <br />
						<span class="customhelp"><?php echo $entry_custom_image_help; ?></span>
					</td>
					<td>
						<input type="hidden" name="fortuna_custom_image" value="<?php echo $fortuna_custom_image; ?>" id="fortuna_custom_image" />
						<img src="<?php echo $fortuna_image_preview; ?>" alt="" id="fortuna_image_preview" />
						<br /><a onclick="image_upload('fortuna_custom_image', 'fortuna_image_preview');"><?php echo $text_select; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#fortuna_image_preview').attr('src', '<?php echo $no_image; ?>'); $('#fortuna_custom_image').attr('value', '');"><?php echo $text_clear; ?></a>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_colors_sub; ?></h3>
						
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<input type="checkbox" name="fortuna_custom_colors"<?php if ($fortuna_custom_colors) echo 'checked="checked"';?>> <?php echo $entry_custom_colors_help; ?> <br /><br />
						<span class="customhelp"><?php echo $entry_colors_sub_help; ?></span>
					</td>
				</tr>

				<tr>
					<td colspan="2"><b><?php echo $entry_header_bold; ?></b></td>
				</tr>

				<tr>
					<td><?php echo $entry_background_caption; ?></td>
					<td><input type="text" name="fortuna_header_background_color" value="<?php echo $fortuna_header_background_color; ?>" size="6" class="color {required:false,hash:true}"  />
					</td>
				</tr>

				<tr>
					<td><?php echo $entry_textcolor_caption; ?></td>
					<td><input type="text" name="fortuna_header_text_color" value="<?php echo $fortuna_header_text_color; ?>" size="6" class="color {required:false,hash:true}"  />
						<span class="customhelp"><?php echo $entry_header_text_color_help; ?></span></td>
				</tr>

				<tr>
					<td><?php echo $entry_topbar_color; ?></td>
					<td>
						<span class="customhelp"><?php echo $entry_background_caption; ?></span> <input type="text" name="fortuna_topbar_background" value="<?php echo $fortuna_topbar_background; ?>" size="6" class="color {required:false,hash:true}" />
						<span class="customhelp"><?php echo $entry_textcolor_caption; ?></span> <input type="text" name="fortuna_topbar_text_color" value="<?php echo $fortuna_topbar_text_color; ?>" size="6" class="color {required:false,hash:true}" />
						<span class="customhelp"><?php echo $entry_links_caption; ?></span> <input type="text" name="fortuna_topbar_links" value="<?php echo $fortuna_topbar_links; ?>" size="6" class="color {required:false,hash:true}" />
						<span class="customhelp"><?php echo $entry_topbar_color_help; ?></span>
					</td>
				</tr>

				<tr>
					<td><?php echo $entry_menu_color; ?></td>
					<td>
						<span class="customhelp"><?php echo $entry_links_caption; ?></span>
						<input type="text" name="fortuna_menu_color" value="<?php echo $fortuna_menu_color; ?>" size="6" class="color {required:false,hash:true}"  />
						<span class="customhelp"><?php echo $entry_menu_separator_color; ?></span> <input type="text" name="fortuna_menu_separator" value="<?php echo $fortuna_menu_separator; ?>" size="6" class="color {required:false,hash:true}" />
					</td>
				</tr>

				<tr>
					<td colspan="2"><b><?php echo $entry_body_bold; ?></b></td>
				</tr>

				<tr>
					<td><?php echo $entry_background_caption; ?></td>
					<td><input type="text" name="fortuna_body_background_color" value="<?php echo $fortuna_body_background_color; ?>" size="6" class="color {required:false,hash:true}"  />
						<span class="customhelp"><?php echo $entry_body_background_color_help; ?></span>
					</td>
				</tr>

				<tr>
					<td><?php echo $entry_title_color; ?></td>
					<td><input type="text" name="fortuna_title_color" value="<?php echo $fortuna_title_color; ?>" size="6" class="color {required:false,hash:true}"  />
						<span class="customhelp"><?php echo $entry_title_color_help; ?></span></td>
				</tr>

				<tr>
					<td><?php echo $entry_textcolor_caption; ?></td>
					<td><input type="text" name="fortuna_bodytext_color" value="<?php echo $fortuna_bodytext_color; ?>" size="6" class="color {required:false,hash:true}"  />
						<span class="customhelp"><?php echo $entry_body_color_help; ?></span></td>
				</tr>

				<tr>
					<td><?php echo $entry_links_caption; ?></td>
					<td><input type="text" name="fortuna_content_links_color" value="<?php echo $fortuna_content_links_color; ?>" size="6" class="color {required:false,hash:true}"  />
						<span class="customhelp"><?php echo $entry_content_links_color_help; ?></span></td>
				</tr>

				<tr>
					<td><?php echo $entry_light_color; ?></td>
					<td><input type="text" name="fortuna_lighttext_color" value="<?php echo $fortuna_lighttext_color; ?>" size="6" class="color {required:false,hash:true}"  />
						<span class="customhelp"><?php echo $entry_light_color_help; ?></span></td>
				</tr>

				<tr>
					<td colspan="2"><b><?php echo $entry_footer_bold; ?></b></td>
				</tr>

				<tr>
					<td><?php echo $entry_textcolor_caption; ?></td>
					<td><input type="text" name="fortuna_footer_text_color" value="<?php echo $fortuna_footer_text_color; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>

				<tr>
					<td><?php echo $entry_links_caption; ?></td>
					<td><input type="text" name="fortuna_footer_links_color" value="<?php echo $fortuna_footer_links_color; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>

				<tr>
					<td colspan="2"><b><?php echo $entry_buttons_bold; ?></b></td>
				</tr>

				<tr>
					<td><?php echo $entry_button_color; ?></td>
					<td>
					<span class="customhelp"><?php echo $entry_top_caption; ?></span> <input type="text" name="fortuna_button_top_color" value="<?php echo $fortuna_button_top_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_bottom_caption; ?></span> <input type="text" name="fortuna_button_bottom_color" value="<?php echo $fortuna_button_bottom_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_border_caption; ?></span> <input type="text" name="fortuna_button_border_color" value="<?php echo $fortuna_button_border_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_textcolor_caption; ?></span> <input type="text" name="fortuna_button_text_color" value="<?php echo $fortuna_button_text_color; ?>" size="6" class="color {required:false,hash:true}" />
					</td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_2button_color; ?>
					</td>
					<td>
					<span class="customhelp"><?php echo $entry_top_caption; ?></span> <input type="text" name="fortuna_2button_top_color" value="<?php echo $fortuna_2button_top_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_bottom_caption; ?></span> <input type="text" name="fortuna_2button_bottom_color" value="<?php echo $fortuna_2button_bottom_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_border_caption; ?></span> <input type="text" name="fortuna_2button_border_color" value="<?php echo $fortuna_2button_border_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_textcolor_caption; ?></span> <input type="text" name="fortuna_2button_text_color" value="<?php echo $fortuna_2button_text_color; ?>" size="6" class="color {required:false,hash:true}" />
					</td>
				</tr>

				<tr>
					<td colspan="2"><b><?php echo $entry_products_bold; ?></b></td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_product_name; ?>
					</td>
					<td>
					<input type="text" name="fortuna_product_name_color" value="<?php echo $fortuna_product_name_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_product_name_help; ?></span>
					</td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_product_price; ?>
					</td>
					<td>
					<span class="customhelp"><?php echo $entry_normal_price; ?></span> <input type="text" name="fortuna_normal_price_color" value="<?php echo $fortuna_normal_price_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_old_price; ?></span> <input type="text" name="fortuna_old_price_color" value="<?php echo $fortuna_old_price_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_promotion_price; ?></span> <input type="text" name="fortuna_new_price_color" value="<?php echo $fortuna_new_price_color; ?>" size="6" class="color {required:false,hash:true}" />
					</td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_onsale_color; ?>
					</td>
					<td>
					<span class="customhelp"><?php echo $entry_background_caption; ?></span> <input type="text" name="fortuna_onsale_background_color" value="<?php echo $fortuna_onsale_background_color; ?>" size="6" class="color {required:false,hash:true}" />
					<span class="customhelp"><?php echo $entry_textcolor_caption; ?></span> <input type="text" name="fortuna_onsale_text_color" value="<?php echo $fortuna_onsale_text_color; ?>" size="6" class="color {required:false,hash:true}" />
					</td>
				</tr>

				<tr>
					<td colspan="2"><b><?php echo $entry_other_bold; ?></b></td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_category_menu; ?>
					</td>
					<td>
					<input type="text" name="fortuna_categories_menu_color" value="<?php echo $fortuna_categories_menu_color; ?>" size="6" class="color {required:false,hash:true}" />
					</td>
				</tr>

			</table>
			
		</div>

		<div id="functions_settings" class="divtab">
		
			<table class="form">

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_images_sub; ?></h3>
					</td>
				</tr>
				
				<tr>
					<td><?php echo $entry_cloud_zoom; ?></td>
					<td>
						<input type="checkbox" name="fortuna_cloud_zoom"<?php if ($fortuna_cloud_zoom) echo 'checked="checked"';?>>
						<?php echo $entry_cloud_zoom_label; ?> <br />
						<span class="customhelp"><?php echo $entry_cloud_zoom_help; ?></span>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_wishcompare_sub; ?></h3>
						<span class="customhelp"><?php echo $entry_wishcompare_sub_help; ?></span>
					</td>
				</tr>
				
				<tr>
					<td><?php echo $entry_wishlist; ?></td>
					<td>
						<input type="checkbox" name="fortuna_hide_wishlist"<?php if ($fortuna_hide_wishlist) echo 'checked="checked"';?>>
						<span class="customhelp"><?php echo $entry_hide_wishlist_label; ?></span>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_compare; ?></td>
					<td>
						<input type="checkbox" name="fortuna_hide_compare"<?php if ($fortuna_hide_compare) echo 'checked="checked"';?>>
						<span class="customhelp"><?php echo $entry_hide_compare_label; ?></span>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<span class="customhelp"><?php echo $entry_cart_button_sub_help; ?></span>
					</td>
				</tr>

				<tr>
					<td><?php echo $entry_display_cart_button; ?></td>
					<td>
						<input type="checkbox" name="fortuna_display_cart_button"<?php if ($fortuna_display_cart_button) echo 'checked="checked"';?>>
						<span class="customhelp"><?php echo $entry_display_cart_button_label; ?></span>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_extensions_sub; ?></h3>
					</td>
				</tr>
				
				<tr>
					<td><?php echo $entry_subcat_thumbs; ?></td>
					<td>
						<input type="checkbox" name="fortuna_subcat_thumbs"<?php if ($fortuna_subcat_thumbs) echo 'checked="checked"';?>>
						<?php echo $entry_subcat_thumbs_label; ?> <br />
						<span class="customhelp"><?php echo $entry_subcat_thumbs_help; ?></span>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_fonts_sub; ?></h3>
						<span class="customhelp"><?php echo $entry_fonts_sub_help; ?></span>
					</td>
				</tr>

				<tr>
					<td><?php echo $entry_title_font; ?></td>
					<td>
						<select name="fortuna_title_font">
							<?php foreach ($fonts as $fv => $fc) { ?>
								<?php ($fv ==  $this->config->get('fortuna_title_font')) ? $currentfont = 'selected' : $currentfont=''; ?>
								<option value="<?php echo $fv; ?>" <?php echo $currentfont; ?> ><?php echo $fc; ?></option>	
							<?php } ?>
						</select>
						<span class="customhelp"><?php echo $entry_title_font_help; ?></span>

					</td>
				</tr>

				<tr>
					<td><?php echo $entry_body_font ?></td>
					<td>
						<select name="fortuna_body_font">
							<?php foreach ($fonts as $fv => $fc) { ?>
								<?php ($fv ==  $this->config->get('fortuna_body_font')) ? $currentfont = 'selected' : $currentfont=''; ?>
								<option value="<?php echo $fv; ?>" <?php echo $currentfont; ?> ><?php echo $fc; ?></option>	
							<?php } ?>
						</select>
						<span class="customhelp"><?php echo $entry_body_font_help; ?></span>

					</td>
				</tr>

			 	<tr>
					<td><?php echo $entry_small_font; ?></td>
					<td>
						<select name="fortuna_small_font">
							<?php foreach ($fonts as $fv => $fc) { ?>
								<?php ($fv ==  $this->config->get('fortuna_small_font')) ? $currentfont = 'selected' : $currentfont=''; ?>
								<option value="<?php echo $fv; ?>" <?php echo $currentfont; ?> ><?php echo $fc; ?></option>	
							<?php } ?>
						</select>
						<span class="customhelp"><?php echo $entry_small_font_help; ?></span>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_modules_sub; ?></h3>
						<span class="customhelp"><?php echo $entry_modules_sub_help; ?></span>
					</td>
				</tr>
				
				<tr>
					<td><?php echo $entry_featured; ?></td>
					<td>
						<input type="checkbox" name="fortuna_featured_carousel"<?php if ($fortuna_featured_carousel) echo 'checked="checked"';?>>
						<span class="customhelp"><?php echo $entry_featured_label; ?></span>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_bestseller; ?></td>
					<td>
						<input type="checkbox" name="fortuna_bestseller_carousel"<?php if ($fortuna_bestseller_carousel) echo 'checked="checked"';?>>
						<span class="customhelp"><?php echo $entry_bestseller_label; ?></span>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_latest; ?></td>
					<td>
						<input type="checkbox" name="fortuna_latest_carousel"<?php if ($fortuna_latest_carousel) echo 'checked="checked"';?>>
						<span class="customhelp"><?php echo $entry_latest_label; ?></span>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_special; ?></td>
					<td>
						<input type="checkbox" name="fortuna_special_carousel"<?php if ($fortuna_special_carousel) echo 'checked="checked"';?>>
						<span class="customhelp"><?php echo $entry_special_label; ?></span>
					</td>
				</tr>

			</table>

		</div>

		<div id="header_settings" class="divtab">
		
			<table class="form">

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_header_layout_sub; ?></h3>
					</td>
				</tr>

				<tr>
					<td><?php echo $entry_logo_center; ?></td>
					<td>
						<input type="checkbox" name="fortuna_logo_center"<?php if ($fortuna_logo_center) echo 'checked="checked"';?>>
						<?php echo $entry_logo_center_label; ?> <br />
					</td>
				</tr>

				<tr>
					<td><?php echo $entry_search_navbar; ?></td>
					<td>
						<input type="checkbox" name="fortuna_search_navbar"<?php if ($fortuna_search_navbar) echo 'checked="checked"';?>>
						<?php echo $entry_search_navbar_label; ?> <br />
						<span class="customhelp"><?php echo $entry_search_navbar_help; ?></span>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_header_info_sub; ?></h3>
					</td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_header_info_text; ?> <br />
						<span class="customhelp"><?php echo $entry_header_info_text_help; ?></span>
					</td>
					<td><textarea name="fortuna_header_info_text" cols="52" rows="5"><?php echo $fortuna_header_info_text; ?></textarea>
					</td>
				</tr>
			</table>
		</div>

		<div id="footer_settings" class="divtab">
		
			<table class="form">

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_social_sub; ?></h3>
					</td>
				</tr>
				
				<tr>
					<td><?php echo $entry_facebook_id; ?> <br>
						<span class="customhelp"><?php echo $entry_facebook_id_help; ?></span>
					</td>
					<td>
						<input type="text" name="fortuna_facebook_id" value="<?php echo $fortuna_facebook_id; ?>" />
						<span class="customhelp"><?php echo $entry_facebook_header_text; ?></span>
						<input type="text" name="fortuna_facebook_label" value="<?php echo $fortuna_facebook_label; ?>" /> <br>
						<span class="customhelp"><?php echo $entry_facebook_id_getID_help; ?></span>
						
					</td>
				</tr>

				<tr>
					<td><?php echo $entry_twitter_username; ?></td>
					<td><input type="text" name="fortuna_twitter_username" value="<?php echo $fortuna_twitter_username; ?>" /></td>
				</tr>

				<tr>
					<td><?php echo $entry_youtube_username; ?></td>
					<td><input type="text" name="fortuna_youtube_username" value="<?php echo $fortuna_youtube_username; ?>" /></td>
				</tr>

				<tr>
					<td><?php echo $entry_gplus_id; ?></td>
					<td><input type="text" name="fortuna_gplus_id" value="<?php echo $fortuna_gplus_id; ?>" /></td>
				</tr>

				<tr>
					<td><?php echo $entry_tumblr_username; ?></td>
					<td><input type="text" name="fortuna_tumblr_username" value="<?php echo $fortuna_tumblr_username; ?>" /></td>
				</tr>

				<tr>
					<td><?php echo $entry_skype_username; ?></td>
					<td><input type="text" name="fortuna_skype_username" value="<?php echo $fortuna_skype_username; ?>" /></td>
				</tr>

				<tr>
					<td><?php echo $entry_pinterest_id; ?></td>
					<td><input type="text" name="fortuna_pinterest_id" value="<?php echo $fortuna_pinterest_id; ?>" /></td>
				</tr>

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_footer_info_sub; ?></h3>
					</td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_payment_logos; ?> <br />
						<img src="view/image/payment/payment_methods.png">
						<span class="customhelp"><?php echo $entry_payment_logos_help; ?></span><br />
						
					</td>
					<td><textarea name="fortuna_payment_logos" cols="52" rows="5"><?php echo $fortuna_payment_logos; ?></textarea>
					</td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_footer_info_text; ?> <br />
						<span class="customhelp"><?php echo $entry_footer_info_text_help; ?></span>
					</td>
					<td><textarea name="fortuna_footer_info_text" cols="52" rows="5"><?php echo $fortuna_footer_info_text; ?></textarea>
					</td>
				</tr>

				<tr>
					<td>
						<?php echo $entry_copyright_text; ?> <br />
						<span class="customhelp"><?php echo $entry_copyright_text_help; ?></span>
					</td>
					<td><textarea name="fortuna_copyright" cols="52" rows="2"><?php echo $fortuna_copyright; ?></textarea>
					</td>
				</tr>

			</table>

		</div>

		<div id="custom_code_settings" class="divtab">
		
			<table class="form">

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_custom_stylesheet_sub; ?></h3>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_custom_stylesheet; ?></td>
					<td><input type="checkbox" name="fortuna_custom_stylesheet"<?php if ($fortuna_custom_stylesheet) echo 'checked="checked"';?>>
						<span class="customhelp"><?php echo $entry_custom_stylesheet_help; ?></span></td>
				</tr>

				<tr>
					<td colspan="2">
						<h3><?php echo $entry_custom_css_sub; ?></h3>
						<span class="customhelp"><?php echo $entry_custom_css_help; ?></span>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_custom_css; ?></td>
					<td><textarea name="fortuna_custom_css" cols="52" rows="20" style="width:80%;"><?php echo $fortuna_custom_css; ?></textarea>
						</td>
				</tr>

			</table>

		</div>


		</form>

	</div>

</div>

<?php echo $footer; ?>

<script type="text/javascript">

	$('#settings_tabs a').tabs();

</script>

<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script> 

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>

<script type="text/javascript">

	CKEDITOR.replace('fortuna_payment_logos', {
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});

	CKEDITOR.replace('fortuna_header_info_text', {
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});

	CKEDITOR.replace('fortuna_footer_info_text', {
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});

	CKEDITOR.replace('fortuna_copyright', {
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});  
</script>

<script type="text/javascript"><!--
function image_upload(field, preview) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + preview).replaceWith('<img src="' + data + '" alt="" id="' + preview + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 