<?php
/**
 * Search Template
 * Displays search results
 *
 * @package     Desk_Mess_Mirrored
 * @since       2.2
 *
 * @link        http://buynowshop.com/themes/desk-mess-mirrored/
 * @link        https://github.com/Cais/desk-mess-mirrored/
 * @link        https://wordpress.org/themes/desk-mess-mirrored/
 *
 * @author      Edward Caissie <edward.caissie@gmail.com>
 * @copyright   Copyright (c) 2009-2016, Edward Caissie
 */

get_header(); ?>

	<div id="maintop"></div>
	<div id="wrapper">
		<div id="content">

			<div id="main-blog">

				<?php if ( have_posts() ) {

					printf(
						sprintf(
							'<div class="search-found-text">%1$s <span class="search-query">%2$s</span></div>',
							__( 'Я нашёл кое-что, может что-то из этого Вам подойдет. Если нет, то спросите меня по-другому, изменив это выражение: ', 'desk-mess-mirrored' ),
							get_search_query()
						)
					);

					while ( have_posts() ) {

						the_post();
						get_template_part( 'desk-mess-mirrored', get_post_format() );

					}

					get_template_part( 'dmm-navigation' );

				} else {

					printf(
						sprintf(
							'<div class="search-found-text">%1$s <span class="search-query">%2$s</span></div>',
							__( 'Я не смог найти ничего из того, что Вы ищете. Попробуйте спросить меня по-другому, изменив это выражение:', 'desk-mess-mirrored' ),
							get_search_query()
						)
					);

				} ?>

			</div>
			<!--end main blog-->

			<?php get_sidebar(); ?>

			<div class="clear"></div>

		</div>
		<!--end content-->
	</div><!--end wrapper-->
<?php get_footer();