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

/***************/
/* User Module */
/***************/

function hooray_get_page_meta()
{
	return array(
		'hooray-wp-registration' => array(
			'name'  => 'hooray_registration',
			'title' => 'Hooray User Registration',
			'slug'  => 'register',
		),
		'hooray-wp-registration-success' => array(
			'name'  => 'hooray_registration_success',
			'title' => 'Hooray User Registration Success',
			'slug'  => 'register-success',
		),
		'hooray-wp-login' => array(
			'name'  => 'hooray_registration_login',
			'title' => 'Hooray User Log In',
			'slug'  => 'login',
		),
	);
}

/**
 * When the plugin is activated
 */
function hooray_install()
{
	hooray_page_install('hooray-wp-registration');
	hooray_page_install('hooray-wp-registration-success');
	hooray_page_install('hooray-wp-login');
}

/**
 * When the plugin is deactivated
 */
function hooray_remove()
{
	$pages = hooray_get_page_meta();
	foreach ($pages as $p) {
		$name = $p[$shortcode]['name'];

		$the_page_id = get_option("{$name}_page_id");
		if($the_page_id) {
			wp_delete_post($the_page_id); // this will trash, not delete
		}

		delete_option("{$name}_page_title");
		delete_option("{$name}_page_slug");
		delete_option("{$name}_page_id");
	}
}

/**
 * Install necessary pages with shortcodes for user module
 * @param string $shortcode Shortcode
 */
function hooray_page_install($shortcode)
{
	$pages = hooray_get_page_meta();
	$name  = $pages[$shortcode]['name'];
	$title = $pages[$shortcode]['title'];
	$slug  = $pages[$shortcode]['slug'];

	// the menu entry...
	delete_option("{$name}_page_title");
	add_option("{$name}_page_title", $title, '', 'yes');
	// the slug...
	delete_option("{$name}_page_slug");
	add_option("{$name}_page_slug", $slug, '', 'yes');
	// the id...
	delete_option("{$name}_page_id");
	add_option("{$name}_page_id", '0', '', 'yes');

	$the_page = get_page_by_title($title);

	if (!$the_page) {
		// Create post object
		$page = array();
		$page['post_title']     = $title;
		$page['post_name']      = $slug;
		$page['post_content']   = "[{$shortcode}]";
		$page['post_status']    = 'publish';
		$page['post_type']      = 'page';
		$page['comment_status'] = 'closed';
		$page['ping_status']    = 'closed';
		$page['post_category']  = array(1); // the default 'Uncategorised'

		// Insert the post into the database
		$the_page_id = wp_insert_post($page);
	}
	else {
		// the plugin may have been previously active and the page may just be trashed...
		$the_page_id = $the_page->ID;

		//make sure the page is not trashed...
		$the_page->post_status = 'publish';
		$the_page_id = wp_update_post($the_page);
	}

	delete_option("{$name}_page_id");
	add_option("{$name}_page_id", $the_page_id);
}

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

			register_new_user($user_login, $user_email);

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

function hooray_validate_custom_fields($errors, $sanitized_user_login, $user_email)
{

}

/**
 * Render successful registration page
 */
function render_shortcode_registration_success() {
	include_once ('templates/registration-success.php');
}

// Runs when plugin is activated
register_activation_hook(__FILE__, 'hooray_install');
// Runs on plugin deactivation
register_deactivation_hook( __FILE__, 'hooray_remove' );
// Register shortcode for user registration form
add_shortcode('hooray-wp-registration', 'render_shortcode_registration');
// Register shortcode for user registration success page
add_shortcode('hooray-wp-registration-success', 'render_shortcode_registration_success');
// Validate custom fields on user registration page
add_filter('registration_errors', 'hooray_validate_custom_fields', 10, 3);
