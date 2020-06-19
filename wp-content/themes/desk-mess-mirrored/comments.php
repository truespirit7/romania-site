<?php

/** Do not delete these lines */
if ( ! empty( $_SERVER['SCRIPT_FILENAME'] ) && 'comments.php' == basename( $_SERVER['SCRIPT_FILENAME'] ) ) {
	die ( __( 'Please do not load this page directly. Thanks!', 'desk-mess-mirrored' ) );
}
/** End if - not empty */
if ( post_password_required() ) {
	?>
	<p class="nocomments"><?php _e( 'This post is password protected. Enter the password to view comments.', 'desk-mess-mirrored' ); ?></p>
	<?php return;
}
/** End if - post password required */


/**
 * Add Comment Classes
 *
 * Function creates classes to be added to the general comment_class via an
 * add_filter action.
 *
 * @package Desk_Mess_Mirrored
 * @since   1.0.2
 *
 * @param   $classes
 *
 * @return  array
 *
 * @version 2.0
 * Last revised December 11, 2011
 * Add class as related to the user role (see 'Role:' drop-down in User options)
 */
function dmm_add_comment_classes( $classes ) {

	global $comment;

	/** Add classes based on user role */
	if ( user_can( $comment->user_id, 'administrator' ) ) {
		$classes[] = 'administrator';
	} elseif ( user_can( $comment->user_id, 'editor' ) ) {
		$classes[] = 'editor';
	} elseif ( user_can( $comment->user_id, 'contributor' ) ) {
		$classes[] = 'contributor';
	} elseif ( user_can( $comment->user_id, 'subscriber' ) ) {
		$classes[] = 'subscriber';
	} else {
		$classes[] = 'guest';
	}

	/** Add user ID based classes */
	if ( $comment->user_id == 1 ) {
		/** Administrator 'Prime' => first registered user ID */
		$userid = "administrator-prime user-id-1";
	} else {
		/** All other users - NB: user-id-0 -> non-registered user */
		$userid = "user-id-" . ( $comment->user_id );
	}

	$classes[] = $userid;

	/** Add microid */
	$c_email = get_comment_author_email();
	$c_url   = get_comment_author_url();

	if ( ! empty( $c_email ) && ! empty( $c_url ) ) {

		$microid   = 'microid-mailto+http:sha1:' . sha1( sha1( 'mailto:' . $c_email ) . sha1( $c_url ) );
		$classes[] = $microid;

	}

	return $classes;

}

/** End function - add comment classes */
add_filter( 'comment_class', 'dmm_add_comment_classes' ); ?>

<div id="comments-main">

	<?php
	/** Show comments */
	if ( have_comments() ) {
		?>

		<h4 id="comments">
			<?php comments_number( __( 'No Comments', 'desk-mess-mirrored' ), __( '1 Comment', 'desk-mess-mirrored' ), __( '% Comments', 'desk-mess-mirrored' ) ); ?>
		</h4>

		<ul class="commentlist" id="singlecomments">
			<?php wp_list_comments(
				array(
					'avatar_size' => 60,
					'reply_text'  => '&raquo; ' . __( 'Reply to this Comment', 'desk-mess-mirrored' ) . '  &laquo;'
				)
			); ?>
		</ul><!-- #comments -->

		<div class="navigation">
			<div class="alignleft"><?php previous_comments_link() ?></div>
			<div class="alignright"><?php next_comments_link() ?></div>
		</div><!-- .navigation -->

		<?php

		global $post;

		if ( 'open' == $post->comment_status ) {

			/** If comments are open, but there are no comments. */
			if ( ! have_comments() ) {
				printf(
					'<div class="nocomments open">%1$s</div>',
					apply_filters( 'dmm_nocomments_open', __( 'Want to leave a note? Just fill in the form below.', 'desk-mess-mirrored' ) )
				);
			}

		} else {

			/** If comments are closed and not on a page */
			if ( ! is_page() ) {
				printf(
					'<div class="nocomments closed">%1$s</div>',
					apply_filters(
						'dmm_nocomments_closed',
						sprintf(
							__( 'Comments are closed. Would you like to contact the %1$s directly?', 'desk-mess-mirrored' ),
							'<a href="' . home_url() . '/?author=' . $post->post_author . '">author</a>'
						)
					)
				);
			}

		}

	}

	comment_form(); ?>

</div><!-- #comments-main -->