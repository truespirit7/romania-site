
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
	<head>
		<meta charset="<?php bloginfo( 'charset' ); ?>" />
		<link rel="profile" href="http://gmpg.org/xfn/11" />
		<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo( 'stylesheet_url' ); ?>" />
		<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
		<?php wp_head(); ?>
	</head>

	<body <?php body_class(); ?>>
	

				<div id="header"><!-- header -->
					<div id="headerleft"></div>
					<!-- #logo -->
					<div id="cup"></div>
					<div id="top-navigation-menu">
						<?php dmm_nav_menu(); ?>
					</div>
				</div>
				<!-- #header -->
			</div>
			<!-- #header-container -->