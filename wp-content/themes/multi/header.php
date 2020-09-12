<?php

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
		<!-- Прогресс бар -->
<div class = "header">
<div class = "progress-container">
	<div class="progress-bar" id="myBar" ></div>
 </div>
 </div>
<!-- /Прогресс бар -->
	<div id="header-container">

		<div id="header"> <!-- header -->

			<div id="headerleft"></div>

			<div id="logo">

				<h2>
					<a href="<?php echo home_url( '/' ); ?>" title="<?php bloginfo( 'name' ); ?>"><?php bloginfo( 'name' ); ?></a>
				</h2>

				<p><?php bloginfo( 'description' ); ?></p>
			</div>
			<!-- #logo -->

			<div id="letter">
				<a href="<?php echo get_feed_link( 'rss2' ); ?>" title="<?php esc_attr_e( 'Add this blog to any reader', 'multi' ); ?>">
					<img alt="<?php esc_attr_e( 'Coffee cup image used as visual link', 'multi' ); ?>" src="<?php echo get_stylesheet_directory_uri(); ?>/images/letter.png" border="0" />
				</a>
			</div>
			<!-- #cup -->

			<div id="top-navigation-menu">
				<?php dmm_nav_menu(); ?>
			</div>

		</div>
		<!-- #header -->

	</div>
	<!-- #header-container -->