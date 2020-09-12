<?php

load_theme_textdomain( 'multi', get_template_directory() . '/languages' );
$locale      = get_locale();
$locale_file = get_template_directory() . "/languages/$locale.php";
if ( is_readable( $locale_file ) ) {
	/** @noinspection PhpIncludeInspection */
	require_once( $locale_file );
}
function custom_login_css() {
	echo '<link rel="stylesheet" type="text/css" href="'.get_stylesheet_directory_uri('template_directory').'/style_login.css" />';
	}
	add_action('login_head', 'custom_login_css');
	
	add_filter('login_headerurl', create_function('', ('return get_home_url();') ));
	add_filter('login_headertitle', create_function('', ('return false;') ));
