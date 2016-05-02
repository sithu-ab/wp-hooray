<?php
/**
 * Plugin Name: Hooray
 * Plugin URI ~
 * Description: Site-specific plugin
 * Version: 1.0
 * Author: Sithu K.
 * Author URI: http://sithukyaw.com
 */

/**
 * Our custom post type function
 */
function hooray_create_posttype()
{
	// Set UI labels for Custom Post Type
	$labels = array(
		'name'                => _x('Feedbacks', 'Post Type General Name'),
		'singular_name'       => _x('Feedback', 'Post Type Singular Name'),
		'menu_name'           => __('Feedback Corner'),
		'parent_item_colon'   => __('Parent Feedback'),
		'all_items'           => __('All Feedbacks'),
		'view_item'           => __('View Feedback'),
		'add_new_item'        => __('Add New Feedback'),
		'add_new'             => __('Add New'),
		'edit_item'           => __('Edit Feedback'),
		'update_item'         => __('Update Feedback'),
		'search_items'        => __('Search Feedback'),
		'not_found'           => __('Not Found'),
		'not_found_in_trash'  => __('Not found in Trash'),
	);

	// Set other options for Custom Post Type
	$args = array(
		'label'               => __('feedbacks'),
		'description'         => __('Discussion about user feedbacks'),
		'labels'              => $labels,
		// Features this CPT supports in Subscriber
		'supports'            => array('title', 'editor', 'excerpt', 'author', 'comments', 'revisions'),
		// You can associate this CPT with a taxonomy or custom taxonomy.
		// 'taxonomies'          => array('genres' ),
		/* A hierarchical CPT is like Pages and can have
		* Parent and child items. A non-hierarchical CPT
		* is like Posts.
		*/
		'hierarchical'        => false,
		'public'              => true,
		'show_ui'             => true,
		'show_in_menu'        => true,
		'show_in_nav_menus'   => true,
		'show_in_admin_bar'   => true,
		'menu_position'       => 5,
		'can_export'          => true,
		'has_archive'         => true,
		'exclude_from_search' => false,
		'publicly_queryable'  => true,
		'capability_type'     => 'page',
	);

	register_post_type('feedback', $args);
}
add_action('init', 'hooray_create_posttype', 0);

/**
 * Add a navigation menu for Feedback Corner
 */
function hooray_nav_menu_items($items, $args)
{
	if ($args->theme_location == 'primary') {
		$items .= '<li class="feedback-corner"><a href="' . esc_url(home_url('/feedback')) . '">' . __('Feedback Corner') . '</a></li>';
		$items .= '<li class="submit-feedback"><a href="' . esc_url(home_url('/submit-feedback')) . '">' . __('Submit Feedback') . '</a></li>';
	}

	return $items;
}
add_filter('wp_nav_menu_items', 'hooray_nav_menu_items', 10, 2);

/**
 * Render user registration form
 */
function render_shortcode_registration() {

	if ( !get_option('users_can_register') ) {
		echo 'User registration is disabled.';
		return false;
	}

	$http_post = ('POST' == $_SERVER['REQUEST_METHOD']);
	$error = '';
	$user_login = '';
	$user_email = '';
	$user_nickname = '';
	$user_age = '';
	$user_sex = '';

	if ($http_post && isset($_POST['wp-submit'])) {
		extract($_POST);

		if ($user_age && !is_numeric($user_age)) {
			$error = __('Enter a numeric value for Age');
		} elseif ($user_age && $user_age < 18) {
			$error = __('Invalid Age. You must be at least 18-year old.');
		} elseif (empty($user_sex)) {
			$error = __('Please select your sex.');
		}

		if (empty($error)) {
			$user_pass = wp_generate_password(12, false);
			$userdata = array(
				'user_pass'      => $user_pass,
				'user_login'     => $user_login,
				'user_email'     => $user_email,
				'user_nicename'  => $user_login,
				'nickname'       => $user_nickname,
				'show_admin_bar_front' => 'false',
			);

			$result = wp_insert_user($userdata);

			if ($result && !is_wp_error($result)) {
				$custom_fields = array(
					'user_age' => $user_age,
					'user_sex' => $user_sex,
				);

				foreach ($custom_fields as $key => $val) {
					update_user_meta($result, $key, $val);
				}

				// Send registration confirmation mail
				$site_title  = get_bloginfo();
				$admin_email = get_bloginfo('admin_email');

				// TODO: to create mail template
				$suject = '[' . $site_title . '] ' . __('New user registration', 'hooray');
				$body = '<p>User registered with the following information:</p>';
				$body .= '<p>Username: ' . $user_login.'<br>';
				$body .= 'Password: ' . $user_pass.'</p>';
				$body .= '<p><a href="' . esc_url(home_url('/login')) . '" title="Login">Click here to login</a>';
				$body = str_replace("\n", "<br />", $body);

				$headers[] = "From: {$site_title} <{$admin_email}>";
				$headers[] = "Content-Type: text/html";
				$headers[] = "MIME-Version: 1.0\r\n";

				if(wp_mail($user_email, $suject, $body, $headers)){
					wp_redirect(home_url('/signup-success'));
				}else{
					wp_signon(array(
						'user_login' => $user_login,
						'user_password' => $user_pass,
					));
					wp_redirect(home_url('/'));
				}
				exit;
			} else {
				$error = $result->get_error_message();
			}
		}
	}

	include_once ('templates/user-registration.php');
}

/**
 * Render successful registration page
 */
function render_shortcode_registration_success() {
	include_once ('templates/registration-success.php');
}

add_shortcode('hooray-wp-registration', 'render_shortcode_registration');
add_shortcode('hooray-wp-registration-success', 'render_shortcode_registration_success');

