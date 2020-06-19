<?php

?>

	<div <?php post_class(); ?> id="post-<?php the_ID(); ?>">

		<div class="transparent glyph"><?php dmm_aside_glyph(); ?></div>

		<?php if ( ! post_password_required() && ( comments_open() || ( get_comments_number() > 0 ) ) ) { ?>

			<div class="post-comments">
				<?php comments_popup_link( __( '0', 'desk-mess-mirrored' ), __( '1', 'desk-mess-mirrored' ), '%', '', '-' ); ?>
			</div>

		<?php } ?>

		<h1>
			<a href="<?php the_permalink(); ?>" title="<?php the_title_attribute(
				array(
					'before' => __( 'Permalink to: ', 'desk-mess-mirrored' ),
					'after'  => ''
				)
			); ?>"><?php the_title(); ?></a>
		</h1>

		<div class="postdata">

			<?php printf(
				__( 'Posted by %1$s on %2$s in %3$s', 'desk-mess-mirrored' ),
				get_the_author(),
				get_the_time( get_option( 'date_format' ) ),
				get_the_category_list( ', ' )
			);

			if ( ! post_password_required() && ! comments_open() && ( is_home() || is_front_page() ) ) {

				/** Only displays when comments are closed */
				echo '<br />';
				comments_popup_link( '', '', '', '', __( 'with Comments closed', 'desk-mess-mirrored' ) );

			}

			dmm_post_meta_link_edit(); ?>

		</div>

		<?php if ( ( is_home() || is_front_page() ) && has_post_thumbnail() ) {
			the_post_thumbnail( 'thumbnail', array( 'class' => 'alignleft' ) );
		}

		the_content( __( 'Read more...', 'desk-mess-mirrored' ) ); ?>

		<div class="clear"><!-- For inserted media at the end of the post --></div>

		<?php wp_link_pages(
			array(
				'before'         => '<p id="wp-link-pages"><strong>' . __( 'Pages:', 'desk-mess-mirrored' ) . '</strong> ',
				'after'          => '</p>',
				'next_or_number' => 'number'
			)
		);

		dmm_single_view_author_link(); ?>

		<p class="single-meta"><?php the_tags(); ?></p>

	</div> <!-- .post #post-ID -->

<?php comments_template();