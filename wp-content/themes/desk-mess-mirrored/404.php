<?php

get_header(); ?>

	<div id="maintop"></div>

	<div id="wrapper">

		<div id="content">

			<div id="main-blog">

				<h1><?php _e( 'Страница 404 !!!', 'desk-mess-mirrored' ); ?></h1>

				<?php
				$message_404 = __( 'Эта страница не найдена,', 'desk-mess-mirrored' ) . '<br />';
				$message_404 .= __( 'попробуйте поискать по-другому.', 'desk-mess-mirrored' ) . '<br />';
				$message_404 .= '<br />';
				$message_404 .= __( 'Можете попросить поискать ("Поиск") нужное вам у библиотекаря.', 'desk-mess-mirrored' ) . '<br />';

				echo $message_404; ?>

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