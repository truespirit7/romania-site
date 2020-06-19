<?php

get_header();
/** Set the $curauth variable */
$curauth = ( get_query_var( 'author_name ' ) ) ? get_user_by( 'id', get_query_var( 'author_name' ) ) : get_userdata( get_query_var( 'author' ) ); ?>

	<div id="maintop"></div>

	<div id="wrapper">
		<div id="content">
			<div id="main-blog">

				<div class="clear">&nbsp;</div>
				<!-- Hack: the non-breaking space keeps the content below the menu when menus contain many top-level items -->

				<div id="author" class="<?php
				/**
				 * Add class as related to the user role (see 'Role:' drop-down in User options)
				 */
				if ( user_can( $curauth->ID, 'administrator' ) ) {
					echo 'administrator';
				} elseif ( user_can( $curauth->ID, 'editor' ) ) {
					echo 'editor';
				} elseif ( user_can( $curauth->ID, 'contributor' ) ) {
					echo 'contributor';
				} elseif ( user_can( $curauth->ID, 'subscriber' ) ) {
					echo 'subscriber';
				} else {
					echo 'guest';
				}

				if ( ( $curauth->ID ) == '1' ) {
					echo ' administrator-prime';
				}

				/** elseif ( ( $curauth->ID ) == '2' ) { echo ' jellybeen'; } /** sample */
				/** add user classes by ID following the above samples */ ?>">

					<h2><?php printf( '%1$s %2$s', __( 'About ', 'desk-mess-mirrored' ), $curauth->display_name ); ?></h2>

					<ul>

						<?php if ( ! empty( $curauth->user_url ) ) { ?>

							<li class="user-url">
								<?php printf(
									__( 'Website: %1$s', 'desk-mess-mirrored' ),
									'<a href="' . $curauth->user_url . '">' . $curauth->user_url . '</a>'
								); ?>
							</li>

						<?php } ?>

						<li class="user-email">
							<?php printf(
								__( 'Email: %1$s', 'desk-mess-mirrored' ),
								'<a href="mailto:' . $curauth->user_email . '">' . __( 'email', 'desk-mess-mirrored' ) . '</a>'
							); ?>
						</li>

						<?php if ( ! empty( $curauth->user_description ) ) { ?>

							<li class="user-description">
								<?php printf( __( 'Biography: %1$s', 'desk-mess-mirrored' ), $curauth->user_description ); ?>
							</li>

						<?php } ?>

					</ul>
				</div>
				<!-- #author -->

				<h2><?php _e( 'Posts by ', 'desk-mess-mirrored' );
					echo $curauth->display_name; ?>:</h2>

				<!-- start the Loop -->
				<?php if ( have_posts() ) {

					global $count;
					$count = 0;

					while ( have_posts() ) {
						the_post();
						get_template_part( 'desk-mess-mirrored', get_post_format() );
					}

					get_template_part( 'dmm-navigation' );

				} else {

					dmm_no_posts_found();

				} ?>
				<!-- end the Loop -->

			</div>
			<!--end main blog-->

			<?php get_sidebar(); ?>

			<div class="clear"></div>

		</div>
		<!--end content-->
	</div><!--end wrapper-->

<?php get_footer();