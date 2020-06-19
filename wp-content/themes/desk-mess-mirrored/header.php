<?php
/**
 * Header

 */
?>
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
		<div id="mainwrap">
			<div id="header-container">
				<div id="header"><!-- header -->
					<div id="headerleft"></div>
					<div id="logo">
						<h2 id="site-title">
							<a href="<?php echo home_url( '/' ); ?>" title="<?php bloginfo( 'name' ); ?>"><?php bloginfo( 'name' ); ?></a>
						</h2>

						<p id="site-description"><?php bloginfo( 'description' ); ?></p>
					</div>
					<!-- #logo -->
					<div id="letter"></div>
					<div id="top-navigation-menu">
						<?php dmm_nav_menu(); ?>
					</div>
				</div>
				<!-- #header -->
			</div>
			<!-- #header-container -->