<?php

get_header(); ?>



<div>content...</div> 
	<div id="wrapper">
		<div id="content">

			<div id="main-blog">
				

				<div class="clear">&nbsp;</div>
				<!-- Hack: the non-breaking space keeps the content below the menu when menus contain many top-level items -->

				<?php if ( have_posts() ) {

					while ( have_posts() ) {
						the_post();
						get_template_part( 'desk-mess-mirrored', get_post_format() );
					}

				} else {

					dmm_no_posts_found();

				} ?>

			</div>
			<!-- #main blog -->

			<?php get_sidebar(); ?>

			<div class="clear"></div>

		</div>
		<!-- #content -->
	</div><!-- #wrapper -->

<?php get_footer();