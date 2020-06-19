<?php


get_header(); ?>

<div id="maintop"></div>
<div id="wrapper">
	<div id="content">

		<div id="main-blog">
			<?php if (is_user_logged_in()) { ?>
				<a href="<?php echo wp_logout_url() ?>" class="helperlink"> Выйти </a>
			<?php } else { ?>
				<h3 class="initial">Радуйся, посетивший библиотеку. Будь добр, <a href="/wp-login.php" title="Вход">представься (Войти)</a>, а если ты здесь впервые, то <a href="/wp-login.php?action=register" title="Регистрация">запишись в реестр (Регистрация)</a></h3><br>.
			<?php } ?>
			<?php
			$id = 3; // ID заданной рубрики
			$n = 3;   // количество выводимых записей
			$recent = new WP_Query("cat=$id&showposts=$n");
			if (have_posts()) {
				while ($recent->have_posts()) {
					$recent->the_post();
				}?>
				<div id = "post-<?php the_ID(  )?>">
				<h1><a href="<?php the_permalink( );?>"><?php the_title( ); ?></a></h1>
				<?php the_excerpt(  ); ?>
				</div>
				<?php get_template_part('dmm-navigation');
				
			} else {

				dmm_no_posts_found();
			}
			?>
		</div>
		<!--end main blog-->

		<?php get_sidebar(); ?>

		<div class="clear"></div>

	</div>
	<!--end content-->
</div>
<!--end wrapper-->
<?php get_footer();
