<?php


get_header(); ?>

	<div id="maintop"></div>
	<div id="wrapper">
		<div id="content">

			<div id="main-blog">
			<?php if(is_user_logged_in())
				{?>
				<a href="<?php echo wp_logout_url()?>" class="helperlink"> Выйти </a> 
				<?php } else { ?>
				 <h3>Радуйся, посетивший библиотеку. Будь добр, <a href="/wp-login.php" title="Вход">представься (Войти)</a>, а если ты здесь впервые, то <a href="/wp-login.php?action=register" title="Регистрация">запишись в реестр (Регистрация)</a></h3><br>.
				<?php } ?>
				<?php if ( have_posts() ) {

					while ( have_posts() ) {
						the_post();
						get_template_part( 'desk-mess-mirrored', get_post_format() );
					}

					get_template_part( 'dmm-navigation' );

				} else {

					dmm_no_posts_found();

				} ?>
				</div>
			<!--end main blog-->

			<?php get_sidebar(); ?>

			<div class="clear"></div>

		</div>
		<!--end content-->
	</div><!--end wrapper-->
<?php get_footer();