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
