-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 01, 2016 at 02:39 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wphooray`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2016-04-30 05:29:39', '2016-04-30 05:29:39', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0),
(2, 83, 'Mr. Subscriber', 'thuta@localhost.com', '', '127.0.0.1', '2016-05-01 17:06:18', '2016-05-01 10:36:18', 'This is a comment of the author to his own post.', 0, '1', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', 0, 3),
(3, 83, 'Mr. Subscriber', 'test2@localhost.com', '', '127.0.0.1', '2016-05-01 17:07:50', '2016-05-01 10:37:50', 'This is a comment by a subscriber.', 0, '1', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', 0, 5),
(4, 83, 'Mr. Editor', 'test@localhost.com', '', '127.0.0.1', '2016-05-01 17:09:22', '2016-05-01 10:39:22', 'This is a comment by a editor.', 0, '1', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wp-hooray', 'yes'),
(2, 'home', 'http://localhost/wp-hooray', 'yes'),
(3, 'blogname', 'HoorayWordpress', 'yes'),
(4, 'blogdescription', 'Just a Wordpress tutorial site', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'stk@localhost.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:178:{s:11:"feedback/?$";s:28:"index.php?post_type=feedback";s:41:"feedback/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=feedback&feed=$matches[1]";s:36:"feedback/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=feedback&feed=$matches[1]";s:28:"feedback/page/([0-9]{1,})/?$";s:46:"index.php?post_type=feedback&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:36:"feedback/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"feedback/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"feedback/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"feedback/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"feedback/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"feedback/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:25:"feedback/([^/]+)/embed/?$";s:41:"index.php?feedback=$matches[1]&embed=true";s:29:"feedback/([^/]+)/trackback/?$";s:35:"index.php?feedback=$matches[1]&tb=1";s:49:"feedback/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?feedback=$matches[1]&feed=$matches[2]";s:44:"feedback/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?feedback=$matches[1]&feed=$matches[2]";s:37:"feedback/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?feedback=$matches[1]&paged=$matches[2]";s:44:"feedback/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?feedback=$matches[1]&cpage=$matches[2]";s:33:"feedback/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?feedback=$matches[1]&page=$matches[2]";s:25:"feedback/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:"feedback/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:55:"feedback/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"feedback/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"feedback/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"feedback/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"wpuf_subscription/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"wpuf_subscription/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"wpuf_subscription/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"wpuf_subscription/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"wpuf_subscription/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:51:"wpuf_subscription/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"wpuf_subscription/([^/]+)/embed/?$";s:65:"index.php?post_type=wpuf_subscription&name=$matches[1]&embed=true";s:38:"wpuf_subscription/([^/]+)/trackback/?$";s:59:"index.php?post_type=wpuf_subscription&name=$matches[1]&tb=1";s:46:"wpuf_subscription/([^/]+)/page/?([0-9]{1,})/?$";s:72:"index.php?post_type=wpuf_subscription&name=$matches[1]&paged=$matches[2]";s:53:"wpuf_subscription/([^/]+)/comment-page-([0-9]{1,})/?$";s:72:"index.php?post_type=wpuf_subscription&name=$matches[1]&cpage=$matches[2]";s:42:"wpuf_subscription/([^/]+)(?:/([0-9]+))?/?$";s:71:"index.php?post_type=wpuf_subscription&name=$matches[1]&page=$matches[2]";s:34:"wpuf_subscription/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"wpuf_subscription/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"wpuf_subscription/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"wpuf_subscription/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"wpuf_subscription/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"wpuf_subscription/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:38:"wpuf_forms/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:48:"wpuf_forms/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:68:"wpuf_forms/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"wpuf_forms/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"wpuf_forms/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:44:"wpuf_forms/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:27:"wpuf_forms/([^/]+)/embed/?$";s:58:"index.php?post_type=wpuf_forms&name=$matches[1]&embed=true";s:31:"wpuf_forms/([^/]+)/trackback/?$";s:52:"index.php?post_type=wpuf_forms&name=$matches[1]&tb=1";s:39:"wpuf_forms/([^/]+)/page/?([0-9]{1,})/?$";s:65:"index.php?post_type=wpuf_forms&name=$matches[1]&paged=$matches[2]";s:46:"wpuf_forms/([^/]+)/comment-page-([0-9]{1,})/?$";s:65:"index.php?post_type=wpuf_forms&name=$matches[1]&cpage=$matches[2]";s:35:"wpuf_forms/([^/]+)(?:/([0-9]+))?/?$";s:64:"index.php?post_type=wpuf_forms&name=$matches[1]&page=$matches[2]";s:27:"wpuf_forms/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"wpuf_forms/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"wpuf_forms/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"wpuf_forms/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"wpuf_forms/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"wpuf_forms/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:40:"wpuf_profile/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"wpuf_profile/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"wpuf_profile/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"wpuf_profile/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"wpuf_profile/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"wpuf_profile/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:29:"wpuf_profile/([^/]+)/embed/?$";s:60:"index.php?post_type=wpuf_profile&name=$matches[1]&embed=true";s:33:"wpuf_profile/([^/]+)/trackback/?$";s:54:"index.php?post_type=wpuf_profile&name=$matches[1]&tb=1";s:41:"wpuf_profile/([^/]+)/page/?([0-9]{1,})/?$";s:67:"index.php?post_type=wpuf_profile&name=$matches[1]&paged=$matches[2]";s:48:"wpuf_profile/([^/]+)/comment-page-([0-9]{1,})/?$";s:67:"index.php?post_type=wpuf_profile&name=$matches[1]&cpage=$matches[2]";s:37:"wpuf_profile/([^/]+)(?:/([0-9]+))?/?$";s:66:"index.php?post_type=wpuf_profile&name=$matches[1]&page=$matches[2]";s:29:"wpuf_profile/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"wpuf_profile/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"wpuf_profile/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"wpuf_profile/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"wpuf_profile/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:35:"wpuf_profile/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:38:"wpuf_input/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:48:"wpuf_input/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:68:"wpuf_input/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"wpuf_input/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"wpuf_input/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:44:"wpuf_input/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:27:"wpuf_input/([^/]+)/embed/?$";s:43:"index.php?wpuf_input=$matches[1]&embed=true";s:31:"wpuf_input/([^/]+)/trackback/?$";s:37:"index.php?wpuf_input=$matches[1]&tb=1";s:39:"wpuf_input/([^/]+)/page/?([0-9]{1,})/?$";s:50:"index.php?wpuf_input=$matches[1]&paged=$matches[2]";s:46:"wpuf_input/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?wpuf_input=$matches[1]&cpage=$matches[2]";s:35:"wpuf_input/([^/]+)(?:/([0-9]+))?/?$";s:49:"index.php?wpuf_input=$matches[1]&page=$matches[2]";s:27:"wpuf_input/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"wpuf_input/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"wpuf_input/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"wpuf_input/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"wpuf_input/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"wpuf_input/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:17:"hooray/hooray.php";i:1;s:25:"wp-registration/index.php";i:2;s:25:"wp-user-frontend/wpuf.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:3:{i:0;s:80:"D:\\xampp\\htdocs\\wp-tuto/wp-content/plugins/front-end-publishing/fepublishing.php";i:1;s:78:"D:\\xampp\\htdocs\\wp-tuto/wp-content/plugins/wp-user-manager/wp-user-manager.php";i:2;s:0:"";}', 'no'),
(40, 'template', 'twentytwelve', 'yes'),
(41, 'stylesheet', 'twentytwelve', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '36686', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:37:"front-end-publishing/fepublishing.php";s:12:"fep_rollback";}', 'no'),
(82, 'timezone_string', 'Asia/Rangoon', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '36686', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:5:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;s:13:"array_version";i:3;}', 'yes'),
(99, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'cron', 'a:5:{i:1462123779;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1462167001;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1462167144;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1462183048;a:1:{s:29:"wpuf_remove_expired_post_hook";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(107, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:0:{}s:15:"version_checked";s:5:"4.5.1";s:12:"last_checked";i:1462080591;}', 'yes'),
(108, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1462098097;s:7:"checked";a:4:{s:19:"akismet/akismet.php";s:6:"3.1.10";s:9:"hello.php";s:3:"1.6";s:37:"hooray-wordpress/hooray-wordpress.php";s:3:"1.0";s:35:"wp-user-manager/wp-user-manager.php";s:6:"1.2.10";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:3:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:6:"3.1.10";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/akismet.3.1.10.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:35:"wp-user-manager/wp-user-manager.php";O:8:"stdClass":6:{s:2:"id";s:5:"61430";s:4:"slug";s:15:"wp-user-manager";s:6:"plugin";s:35:"wp-user-manager/wp-user-manager.php";s:11:"new_version";s:6:"1.2.10";s:3:"url";s:46:"https://wordpress.org/plugins/wp-user-manager/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/wp-user-manager.1.2.10.zip";}}}', 'yes'),
(111, '_site_transient_update_themes', 'O:8:"stdClass":1:{s:12:"last_checked";i:1462101584;}', 'yes'),
(113, '_transient_timeout_plugin_slugs', '1462184497', 'no'),
(114, '_transient_plugin_slugs', 'a:6:{i:0;s:19:"akismet/akismet.php";i:1;s:37:"front-end-publishing/fepublishing.php";i:2;s:9:"hello.php";i:3;s:17:"hooray/hooray.php";i:4;s:25:"wp-registration/index.php";i:5;s:25:"wp-user-frontend/wpuf.php";}', 'no'),
(115, 'recently_activated', 'a:3:{s:37:"front-end-publishing/fepublishing.php";i:1462096569;s:37:"hooray-wordpress/hooray-wordpress.php";i:1462080408;s:35:"wp-user-manager/wp-user-manager.php";i:1462013535;}', 'yes'),
(116, 'can_compress_scripts', '1', 'yes'),
(120, '_transient_twentysixteen_categories', '1', 'yes'),
(121, 'theme_mods_twentysixteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1461994281;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(122, 'current_theme', 'Twenty Twelve', 'yes'),
(123, 'theme_mods_twentytwelve', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}}', 'yes'),
(124, 'theme_switched', '', 'yes'),
(134, 'wp_wpum_field_groups_db_version', '1.0', 'yes'),
(135, 'wp_wpum_fields_db_version', '1.0', 'yes'),
(138, 'wpum_did_121_update', '1', 'yes'),
(141, 'widget_wpum-recent-users', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(142, 'widget_wpum-password-recovery-form', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(143, 'widget_wpum-registration-form', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(144, 'widget_wpum-login-form', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(164, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(174, 'wpregistration_meta', 'a:7:{i:0;a:8:{s:4:"type";s:4:"text";s:5:"title";s:9:"User Name";s:9:"data_name";s:21:"wp_registration_login";s:11:"description";s:0:"";s:13:"error_message";s:0:"";s:8:"required";s:2:"on";s:5:"class";s:0:"";s:5:"width";s:0:"";}i:1;a:11:{s:4:"type";s:5:"email";s:5:"title";s:10:"User Email";s:9:"data_name";s:21:"wp_registration_email";s:11:"description";s:0:"";s:13:"error_message";s:0:"";s:8:"required";s:2:"on";s:5:"class";s:0:"";s:5:"width";s:0:"";s:10:"send_email";s:0:"";s:5:"logic";s:0:"";s:10:"conditions";a:3:{s:10:"visibility";s:4:"Show";s:5:"bound";s:3:"All";s:5:"rules";a:1:{i:0;a:3:{s:8:"elements";s:0:"";s:9:"operators";s:2:"is";s:14:"element_values";s:0:"";}}}}i:2;a:8:{s:4:"type";s:4:"text";s:5:"title";s:9:"Last Name";s:9:"data_name";s:25:"wp_registration_last_name";s:11:"description";s:0:"";s:13:"error_message";s:0:"";s:8:"required";s:0:"";s:5:"class";s:0:"";s:5:"width";s:0:"";}i:3;a:8:{s:4:"type";s:4:"text";s:5:"title";s:10:"First Name";s:9:"data_name";s:26:"wp_registration_first_name";s:11:"description";s:0:"";s:13:"error_message";s:0:"";s:8:"required";s:0:"";s:5:"class";s:0:"";s:5:"width";s:0:"";}i:4;a:8:{s:4:"type";s:4:"text";s:5:"title";s:8:"Nickname";s:9:"data_name";s:24:"wp_registration_nickname";s:11:"description";s:0:"";s:13:"error_message";s:0:"";s:8:"required";s:0:"";s:5:"class";s:0:"";s:5:"width";s:0:"";}i:5;a:8:{s:4:"type";s:4:"text";s:5:"title";s:3:"Age";s:9:"data_name";s:19:"wp_registration_age";s:11:"description";s:0:"";s:13:"error_message";s:0:"";s:8:"required";s:0:"";s:5:"class";s:0:"";s:5:"width";s:0:"";}i:6;a:10:{s:4:"type";s:5:"radio";s:5:"title";s:3:"Sex";s:9:"data_name";s:19:"wp_registration_sex";s:11:"description";s:0:"";s:13:"error_message";s:0:"";s:7:"options";s:11:"Male\nFemale";s:8:"selected";s:0:"";s:8:"required";s:0:"";s:5:"class";s:0:"";s:5:"width";s:0:"";}}', 'yes'),
(175, 'nm_wpregistration_settings', 'a:37:{s:6:"action";s:31:"nm_wpregistration_save_settings";s:28:"nm_wpregistration_form_title";s:0:"";s:27:"nm_wpregistration_form_desc";s:0:"";s:33:"nm_wpregistration_terms_condition";s:0:"";s:30:"nm_wpregistration_register_url";s:0:"";s:33:"nm_wpregistration_success_message";s:0:"";s:30:"nm_wpregistration_redirect_url";s:0:"";s:36:"nm_wpregistration_redirect_url_login";s:26:"http://localhost/wp-hooray";s:30:"nm_wpregistration_button_title";s:0:"";s:41:"nm_wpregistration_validation_notification";s:0:"";s:34:"nm_wpregistration_button_txt_color";s:0:"";s:33:"nm_wpregistration_button_fontsize";s:0:"";s:33:"nm_wpregistration_button_bg_color";s:0:"";s:30:"nm_wpregistration_button_class";s:0:"";s:26:"nm_wpregistration_form_css";s:0:"";s:26:"nm_wpregistration_new_user";s:222:"Dear %USERNAME%,\r\n\r\nThanks for your registration at <a href=\\"http://localhost/wp-tuto\\">%SITE_NAME%</a>. Here is information you should use in order to login:\r\n\r\nYour username: %USERNAME%\r\nYour password: %USER_PASSWORD%\r\n";s:5:"title";s:3:"Sex";s:9:"data_name";s:19:"wp_registration_sex";s:11:"description";s:0:"";s:13:"error_message";s:0:"";s:5:"class";s:0:"";s:5:"width";s:0:"";s:7:"options";s:12:"Male\r\nFemale";s:8:"selected";s:0:"";s:7:"checked";s:0:"";s:11:"min_checked";s:0:"";s:11:"max_checked";s:0:"";s:12:"date_formats";s:8:"mm/dd/yy";s:4:"mask";s:0:"";s:20:"condition_visibility";s:4:"Show";s:15:"condition_bound";s:3:"All";s:19:"condition_operators";s:2:"is";s:9:"max_value";s:0:"";s:9:"min_value";s:0:"";s:4:"step";s:0:"";s:13:"default_value";s:0:"";s:8:"required";s:2:"on";}', 'yes'),
(196, '_transient_timeout_dash_88ae138922fe95674369b1cb3d215a2b', '1462137322', 'no'),
(197, '_transient_dash_88ae138922fe95674369b1cb3d215a2b', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: wordpress.org; Host not found</p></div><div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: planet.wordpress.org; Host not found</p></div><div class="rss-widget"><ul></ul></div>', 'no'),
(198, 'fep_post_restrictions', 'a:11:{s:15:"min_words_title";s:1:"2";s:15:"max_words_title";s:2:"12";s:17:"min_words_content";s:3:"250";s:17:"max_words_content";s:4:"2000";s:13:"min_words_bio";s:2:"50";s:13:"max_words_bio";s:3:"100";s:8:"min_tags";s:1:"1";s:8:"max_tags";s:1:"5";s:9:"max_links";s:1:"2";s:13:"max_links_bio";s:1:"2";s:18:"thumbnail_required";s:1:"0";}', 'yes'),
(199, 'fep_role_settings', 'a:3:{s:8:"no_check";s:1:"0";s:17:"instantly_publish";s:1:"0";s:12:"enable_media";s:1:"0";}', 'yes'),
(200, 'fep_misc', 'a:7:{s:17:"before_author_bio";s:0:"";s:18:"disable_author_bio";s:4:"true";s:11:"remove_bios";s:1:"0";s:19:"nofollow_body_links";s:1:"0";s:18:"nofollow_bio_links";s:1:"0";s:25:"disable_login_redirection";s:1:"0";s:14:"posts_per_page";s:2:"10";}', 'yes'),
(201, 'WPLANG', '', 'yes'),
(215, 'wpuf_version', '2.3.13', 'yes'),
(217, 'wpuf_general', 'a:14:{s:18:"fixed_form_element";s:2:"on";s:12:"edit_page_id";s:2:"89";s:18:"default_post_owner";s:1:"1";s:12:"admin_access";s:4:"read";s:17:"override_editlink";s:3:"yes";s:13:"cf_show_front";s:3:"off";s:11:"load_script";s:2:"on";s:17:"insert_photo_size";s:9:"thumbnail";s:17:"insert_photo_type";s:4:"link";s:13:"image_caption";s:3:"off";s:17:"default_post_form";s:2:"78";s:16:"recaptcha_public";s:0:"";s:17:"recaptcha_private";s:0:"";s:10:"custom_css";s:0:"";}', 'yes'),
(218, 'wpuf_dashboard', 'a:9:{s:16:"enable_post_edit";s:3:"yes";s:15:"enable_post_del";s:3:"yes";s:20:"disable_pending_edit";s:2:"on";s:8:"per_page";s:2:"10";s:13:"show_user_bio";s:2:"on";s:15:"show_post_count";s:2:"on";s:13:"show_ft_image";s:3:"off";s:11:"ft_img_size";s:9:"thumbnail";s:11:"un_auth_msg";s:0:"";}', 'yes'),
(219, 'wpuf_profile', '', 'yes'),
(220, 'wpuf_payment', '', 'yes'),
(221, 'wpuf_support', '', 'yes'),
(233, '_site_transient_timeout_theme_roots', '1462103384', 'yes'),
(234, '_site_transient_theme_roots', 'a:5:{s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";s:10:"zerif-lite";s:7:"/themes";}', 'yes'),
(241, 'category_children', 'a:0:{}', 'yes'),
(256, '_transient_is_multi_author', '1', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(4, 6, '_menu_item_type', 'custom'),
(5, 6, '_menu_item_menu_item_parent', '0'),
(6, 6, '_menu_item_object_id', '6'),
(7, 6, '_menu_item_object', 'custom'),
(8, 6, '_menu_item_target', ''),
(9, 6, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(10, 6, '_menu_item_xfn', ''),
(11, 6, '_menu_item_url', 'http://localhost/wp-tuto/'),
(12, 6, '_menu_item_orphaned', '1461995260'),
(13, 7, '_menu_item_type', 'post_type'),
(14, 7, '_menu_item_menu_item_parent', '0'),
(15, 7, '_menu_item_object_id', '2'),
(16, 7, '_menu_item_object', 'page'),
(17, 7, '_menu_item_target', ''),
(18, 7, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(19, 7, '_menu_item_xfn', ''),
(20, 7, '_menu_item_url', ''),
(21, 7, '_menu_item_orphaned', '1461995260'),
(22, 8, '_menu_item_type', 'custom'),
(23, 8, '_menu_item_menu_item_parent', '0'),
(24, 8, '_menu_item_object_id', '8'),
(25, 8, '_menu_item_object', 'custom'),
(26, 8, '_menu_item_target', ''),
(27, 8, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(28, 8, '_menu_item_xfn', ''),
(29, 8, '_menu_item_url', 'http://localhost/wp-tuto/'),
(30, 8, '_menu_item_orphaned', '1461996087'),
(31, 9, '_menu_item_type', 'post_type'),
(32, 9, '_menu_item_menu_item_parent', '0'),
(33, 9, '_menu_item_object_id', '2'),
(34, 9, '_menu_item_object', 'page'),
(35, 9, '_menu_item_target', ''),
(36, 9, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(37, 9, '_menu_item_xfn', ''),
(38, 9, '_menu_item_url', ''),
(39, 9, '_menu_item_orphaned', '1461996087'),
(40, 15, '_menu_item_type', 'custom'),
(41, 15, '_menu_item_menu_item_parent', '0'),
(42, 15, '_menu_item_object_id', '15'),
(43, 15, '_menu_item_object', 'custom'),
(44, 15, '_menu_item_target', ''),
(45, 15, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(46, 15, '_menu_item_xfn', ''),
(47, 15, '_menu_item_url', 'http://localhost/wp-tuto/'),
(48, 15, '_menu_item_orphaned', '1461999986'),
(49, 16, '_menu_item_type', 'post_type'),
(50, 16, '_menu_item_menu_item_parent', '0'),
(51, 16, '_menu_item_object_id', '13'),
(52, 16, '_menu_item_object', 'page'),
(53, 16, '_menu_item_target', ''),
(54, 16, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(55, 16, '_menu_item_xfn', ''),
(56, 16, '_menu_item_url', ''),
(57, 16, '_menu_item_orphaned', '1461999986'),
(58, 17, '_menu_item_type', 'post_type'),
(59, 17, '_menu_item_menu_item_parent', '0'),
(60, 17, '_menu_item_object_id', '10'),
(61, 17, '_menu_item_object', 'page'),
(62, 17, '_menu_item_target', ''),
(63, 17, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(64, 17, '_menu_item_xfn', ''),
(65, 17, '_menu_item_url', ''),
(66, 17, '_menu_item_orphaned', '1461999986'),
(67, 18, '_menu_item_type', 'post_type'),
(68, 18, '_menu_item_menu_item_parent', '0'),
(69, 18, '_menu_item_object_id', '11'),
(70, 18, '_menu_item_object', 'page'),
(71, 18, '_menu_item_target', ''),
(72, 18, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(73, 18, '_menu_item_xfn', ''),
(74, 18, '_menu_item_url', ''),
(75, 18, '_menu_item_orphaned', '1461999986'),
(76, 19, '_menu_item_type', 'post_type'),
(77, 19, '_menu_item_menu_item_parent', '0'),
(78, 19, '_menu_item_object_id', '14'),
(79, 19, '_menu_item_object', 'page'),
(80, 19, '_menu_item_target', ''),
(81, 19, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(82, 19, '_menu_item_xfn', ''),
(83, 19, '_menu_item_url', ''),
(84, 19, '_menu_item_orphaned', '1461999986'),
(85, 20, '_menu_item_type', 'post_type'),
(86, 20, '_menu_item_menu_item_parent', '0'),
(87, 20, '_menu_item_object_id', '12'),
(88, 20, '_menu_item_object', 'page'),
(89, 20, '_menu_item_target', ''),
(90, 20, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(91, 20, '_menu_item_xfn', ''),
(92, 20, '_menu_item_url', ''),
(93, 20, '_menu_item_orphaned', '1461999986'),
(94, 21, '_menu_item_type', 'post_type'),
(95, 21, '_menu_item_menu_item_parent', '0'),
(96, 21, '_menu_item_object_id', '2'),
(97, 21, '_menu_item_object', 'page'),
(98, 21, '_menu_item_target', ''),
(99, 21, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(100, 21, '_menu_item_xfn', ''),
(101, 21, '_menu_item_url', ''),
(102, 21, '_menu_item_orphaned', '1461999986'),
(103, 22, '_menu_item_type', 'custom'),
(104, 22, '_menu_item_menu_item_parent', '0'),
(105, 22, '_menu_item_object_id', '22'),
(106, 22, '_menu_item_object', 'custom'),
(107, 22, '_menu_item_target', ''),
(108, 22, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(109, 22, '_menu_item_xfn', ''),
(110, 22, '_menu_item_url', 'http://localhost/wp-tuto/'),
(111, 22, '_menu_item_orphaned', '1462001173'),
(112, 23, '_menu_item_type', 'post_type'),
(113, 23, '_menu_item_menu_item_parent', '0'),
(114, 23, '_menu_item_object_id', '13'),
(115, 23, '_menu_item_object', 'page'),
(116, 23, '_menu_item_target', ''),
(117, 23, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(118, 23, '_menu_item_xfn', ''),
(119, 23, '_menu_item_url', ''),
(120, 23, '_menu_item_orphaned', '1462001173'),
(121, 24, '_menu_item_type', 'post_type'),
(122, 24, '_menu_item_menu_item_parent', '0'),
(123, 24, '_menu_item_object_id', '10'),
(124, 24, '_menu_item_object', 'page'),
(125, 24, '_menu_item_target', ''),
(126, 24, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(127, 24, '_menu_item_xfn', ''),
(128, 24, '_menu_item_url', ''),
(129, 24, '_menu_item_orphaned', '1462001173'),
(130, 25, '_menu_item_type', 'post_type'),
(131, 25, '_menu_item_menu_item_parent', '0'),
(132, 25, '_menu_item_object_id', '11'),
(133, 25, '_menu_item_object', 'page'),
(134, 25, '_menu_item_target', ''),
(135, 25, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(136, 25, '_menu_item_xfn', ''),
(137, 25, '_menu_item_url', ''),
(138, 25, '_menu_item_orphaned', '1462001173'),
(139, 26, '_menu_item_type', 'post_type'),
(140, 26, '_menu_item_menu_item_parent', '0'),
(141, 26, '_menu_item_object_id', '14'),
(142, 26, '_menu_item_object', 'page'),
(143, 26, '_menu_item_target', ''),
(144, 26, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(145, 26, '_menu_item_xfn', ''),
(146, 26, '_menu_item_url', ''),
(147, 26, '_menu_item_orphaned', '1462001173'),
(148, 27, '_menu_item_type', 'post_type'),
(149, 27, '_menu_item_menu_item_parent', '0'),
(150, 27, '_menu_item_object_id', '12'),
(151, 27, '_menu_item_object', 'page'),
(152, 27, '_menu_item_target', ''),
(153, 27, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(154, 27, '_menu_item_xfn', ''),
(155, 27, '_menu_item_url', ''),
(156, 27, '_menu_item_orphaned', '1462001173'),
(157, 28, '_menu_item_type', 'post_type'),
(158, 28, '_menu_item_menu_item_parent', '0'),
(159, 28, '_menu_item_object_id', '2'),
(160, 28, '_menu_item_object', 'page'),
(161, 28, '_menu_item_target', ''),
(162, 28, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(163, 28, '_menu_item_xfn', ''),
(164, 28, '_menu_item_url', ''),
(165, 28, '_menu_item_orphaned', '1462001173'),
(166, 29, '_menu_item_type', 'custom'),
(167, 29, '_menu_item_menu_item_parent', '0'),
(168, 29, '_menu_item_object_id', '29'),
(169, 29, '_menu_item_object', 'custom'),
(170, 29, '_menu_item_target', ''),
(171, 29, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(172, 29, '_menu_item_xfn', ''),
(173, 29, '_menu_item_url', 'http://localhost/wp-tuto/'),
(174, 29, '_menu_item_orphaned', '1462001193'),
(175, 30, '_menu_item_type', 'post_type'),
(176, 30, '_menu_item_menu_item_parent', '0'),
(177, 30, '_menu_item_object_id', '13'),
(178, 30, '_menu_item_object', 'page'),
(179, 30, '_menu_item_target', ''),
(180, 30, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(181, 30, '_menu_item_xfn', ''),
(182, 30, '_menu_item_url', ''),
(183, 30, '_menu_item_orphaned', '1462001193'),
(184, 31, '_menu_item_type', 'post_type'),
(185, 31, '_menu_item_menu_item_parent', '0'),
(186, 31, '_menu_item_object_id', '10'),
(187, 31, '_menu_item_object', 'page'),
(188, 31, '_menu_item_target', ''),
(189, 31, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(190, 31, '_menu_item_xfn', ''),
(191, 31, '_menu_item_url', ''),
(192, 31, '_menu_item_orphaned', '1462001193'),
(193, 32, '_menu_item_type', 'post_type'),
(194, 32, '_menu_item_menu_item_parent', '0'),
(195, 32, '_menu_item_object_id', '11'),
(196, 32, '_menu_item_object', 'page'),
(197, 32, '_menu_item_target', ''),
(198, 32, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(199, 32, '_menu_item_xfn', ''),
(200, 32, '_menu_item_url', ''),
(201, 32, '_menu_item_orphaned', '1462001193'),
(202, 33, '_menu_item_type', 'post_type'),
(203, 33, '_menu_item_menu_item_parent', '0'),
(204, 33, '_menu_item_object_id', '14'),
(205, 33, '_menu_item_object', 'page'),
(206, 33, '_menu_item_target', ''),
(207, 33, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(208, 33, '_menu_item_xfn', ''),
(209, 33, '_menu_item_url', ''),
(210, 33, '_menu_item_orphaned', '1462001193'),
(211, 34, '_menu_item_type', 'post_type'),
(212, 34, '_menu_item_menu_item_parent', '0'),
(213, 34, '_menu_item_object_id', '12'),
(214, 34, '_menu_item_object', 'page'),
(215, 34, '_menu_item_target', ''),
(216, 34, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(217, 34, '_menu_item_xfn', ''),
(218, 34, '_menu_item_url', ''),
(219, 34, '_menu_item_orphaned', '1462001193'),
(220, 35, '_menu_item_type', 'post_type'),
(221, 35, '_menu_item_menu_item_parent', '0'),
(222, 35, '_menu_item_object_id', '2'),
(223, 35, '_menu_item_object', 'page'),
(224, 35, '_menu_item_target', ''),
(225, 35, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(226, 35, '_menu_item_xfn', ''),
(227, 35, '_menu_item_url', ''),
(228, 35, '_menu_item_orphaned', '1462001193'),
(229, 36, '_menu_item_type', 'custom'),
(230, 36, '_menu_item_menu_item_parent', '0'),
(231, 36, '_menu_item_object_id', '36'),
(232, 36, '_menu_item_object', 'custom'),
(233, 36, '_menu_item_target', ''),
(234, 36, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(235, 36, '_menu_item_xfn', ''),
(236, 36, '_menu_item_url', 'http://localhost/wp-tuto/'),
(237, 36, '_menu_item_orphaned', '1462011945'),
(238, 37, '_menu_item_type', 'post_type'),
(239, 37, '_menu_item_menu_item_parent', '0'),
(240, 37, '_menu_item_object_id', '13'),
(241, 37, '_menu_item_object', 'page'),
(242, 37, '_menu_item_target', ''),
(243, 37, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(244, 37, '_menu_item_xfn', ''),
(245, 37, '_menu_item_url', ''),
(246, 37, '_menu_item_orphaned', '1462011945'),
(247, 38, '_menu_item_type', 'post_type'),
(248, 38, '_menu_item_menu_item_parent', '0'),
(249, 38, '_menu_item_object_id', '10'),
(250, 38, '_menu_item_object', 'page'),
(251, 38, '_menu_item_target', ''),
(252, 38, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(253, 38, '_menu_item_xfn', ''),
(254, 38, '_menu_item_url', ''),
(255, 38, '_menu_item_orphaned', '1462011945'),
(256, 39, '_menu_item_type', 'post_type'),
(257, 39, '_menu_item_menu_item_parent', '0'),
(258, 39, '_menu_item_object_id', '11'),
(259, 39, '_menu_item_object', 'page'),
(260, 39, '_menu_item_target', ''),
(261, 39, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(262, 39, '_menu_item_xfn', ''),
(263, 39, '_menu_item_url', ''),
(264, 39, '_menu_item_orphaned', '1462011945'),
(265, 40, '_menu_item_type', 'post_type'),
(266, 40, '_menu_item_menu_item_parent', '0'),
(267, 40, '_menu_item_object_id', '14'),
(268, 40, '_menu_item_object', 'page'),
(269, 40, '_menu_item_target', ''),
(270, 40, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(271, 40, '_menu_item_xfn', ''),
(272, 40, '_menu_item_url', ''),
(273, 40, '_menu_item_orphaned', '1462011945'),
(274, 41, '_menu_item_type', 'post_type'),
(275, 41, '_menu_item_menu_item_parent', '0'),
(276, 41, '_menu_item_object_id', '12'),
(277, 41, '_menu_item_object', 'page'),
(278, 41, '_menu_item_target', ''),
(279, 41, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(280, 41, '_menu_item_xfn', ''),
(281, 41, '_menu_item_url', ''),
(282, 41, '_menu_item_orphaned', '1462011945'),
(283, 42, '_menu_item_type', 'post_type'),
(284, 42, '_menu_item_menu_item_parent', '0'),
(285, 42, '_menu_item_object_id', '2'),
(286, 42, '_menu_item_object', 'page'),
(287, 42, '_menu_item_target', ''),
(288, 42, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(289, 42, '_menu_item_xfn', ''),
(290, 42, '_menu_item_url', ''),
(291, 42, '_menu_item_orphaned', '1462011945'),
(292, 43, '_menu_item_type', 'custom'),
(293, 43, '_menu_item_menu_item_parent', '0'),
(294, 43, '_menu_item_object_id', '43'),
(295, 43, '_menu_item_object', 'custom'),
(296, 43, '_menu_item_target', ''),
(297, 43, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(298, 43, '_menu_item_xfn', ''),
(299, 43, '_menu_item_url', 'http://localhost/wp-hooray'),
(346, 49, '_menu_item_type', 'post_type'),
(347, 49, '_menu_item_menu_item_parent', '0'),
(348, 49, '_menu_item_object_id', '2'),
(349, 49, '_menu_item_object', 'page'),
(350, 49, '_menu_item_target', ''),
(351, 49, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(352, 49, '_menu_item_xfn', ''),
(353, 49, '_menu_item_url', ''),
(364, 10, '_wp_trash_meta_status', 'publish'),
(365, 10, '_wp_trash_meta_time', '1462013598'),
(366, 10, '_wp_desired_post_slug', 'login'),
(367, 11, '_wp_trash_meta_status', 'publish'),
(368, 11, '_wp_trash_meta_time', '1462013598'),
(369, 11, '_wp_desired_post_slug', 'password-reset'),
(370, 12, '_wp_trash_meta_status', 'publish'),
(371, 12, '_wp_trash_meta_time', '1462013598'),
(372, 12, '_wp_desired_post_slug', 'register'),
(373, 13, '_wp_trash_meta_status', 'publish'),
(374, 13, '_wp_trash_meta_time', '1462013598'),
(375, 13, '_wp_desired_post_slug', 'account'),
(376, 14, '_wp_trash_meta_status', 'publish'),
(377, 14, '_wp_trash_meta_time', '1462013598'),
(378, 14, '_wp_desired_post_slug', 'profile'),
(379, 56, 'nm_members', NULL),
(380, 56, '_edit_last', '1'),
(381, 56, '_edit_lock', '1462033783:1'),
(382, 56, '_wp_page_template', 'default'),
(392, 43, 'nm_members', NULL),
(393, 49, 'nm_members', NULL),
(394, 59, 'nm_members', NULL),
(395, 59, '_edit_last', '1'),
(396, 59, '_edit_lock', '1462033851:1'),
(397, 59, '_wp_page_template', 'default'),
(398, 62, 'nm_members', NULL),
(399, 63, 'nm_members', NULL),
(400, 63, '_edit_lock', '1462076550:4'),
(401, 64, 'nm_members', NULL),
(402, 64, '_edit_lock', '1462079349:4'),
(408, 66, 'nm_members', NULL),
(409, 66, '_edit_lock', '1462081169:1'),
(410, 67, 'nm_members', NULL),
(411, 67, '_edit_lock', '1462081196:1'),
(418, 70, 'nm_members', NULL),
(419, 70, '_edit_lock', '1462081559:1'),
(420, 70, '_edit_last', '1'),
(421, 71, 'nm_members', NULL),
(422, 71, '_edit_lock', '1462081509:1'),
(423, 71, '_edit_last', '1'),
(424, 73, 'nm_members', NULL),
(425, 74, 'nm_members', NULL),
(426, 74, '_edit_lock', '1462097209:1'),
(427, 74, '_edit_last', '1'),
(428, 74, '_wp_page_template', 'default'),
(429, 76, 'nm_members', NULL),
(430, 76, '_edit_lock', '1462105500:1'),
(431, 76, '_edit_last', '1'),
(434, 78, 'nm_members', NULL),
(435, 78, '_edit_lock', '1462103958:1'),
(436, 78, '_edit_last', '1'),
(437, 79, 'nm_members', NULL),
(438, 78, 'wpuf_form_settings', 'a:24:{s:9:"post_type";s:8:"feedback";s:11:"post_status";s:7:"publish";s:11:"post_format";s:1:"0";s:11:"default_cat";s:1:"4";s:10:"guest_post";s:5:"false";s:13:"guest_details";s:4:"true";s:10:"name_label";s:4:"Name";s:11:"email_label";s:5:"Email";s:16:"message_restrict";s:68:"This page is restricted. Please Log in / Register to view this page.";s:11:"redirect_to";s:4:"post";s:7:"message";s:10:"Post saved";s:7:"page_id";s:2:"74";s:3:"url";s:0:"";s:14:"comment_status";s:4:"open";s:11:"submit_text";s:6:"Submit";s:10:"draft_post";s:5:"false";s:16:"edit_post_status";s:7:"publish";s:16:"edit_redirect_to";s:4:"same";s:14:"update_message";s:25:"Post updated successfully";s:12:"edit_page_id";s:2:"74";s:8:"edit_url";s:0:"";s:12:"subscription";s:10:"- Select -";s:11:"update_text";s:6:"Update";s:12:"notification";a:5:{s:3:"new";s:2:"on";s:6:"new_to";s:17:"stk@localhost.com";s:11:"new_subject";s:16:"New post created";s:8:"new_body";s:213:"Hi Admin,\r\nA new post has been created in your site %sitename% (%siteurl%).\r\n\r\nHere is the details:\r\nPost Title: %post_title%\r\nContent: %post_content%\r\nAuthor: %author%\r\nPost URL: %permalink%\r\nEdit URL: %editlink%";s:4:"edit";s:3:"off";}}'),
(439, 74, '_wpuf_form_id', ''),
(442, 82, 'nm_members', NULL),
(443, 83, 'nm_members', NULL),
(444, 83, '_wpuf_form_id', '78'),
(448, 85, 'nm_members', NULL),
(449, 85, '_edit_lock', '1462098728:1'),
(450, 83, '_edit_lock', '1462102506:1'),
(451, 86, 'nm_members', NULL),
(452, 87, 'nm_members', NULL),
(453, 88, 'nm_members', NULL),
(454, 86, 'wpuf_form_settings', 'a:24:{s:9:"post_type";s:8:"feedback";s:11:"post_status";s:7:"publish";s:11:"post_format";s:1:"0";s:11:"default_cat";s:1:"4";s:10:"guest_post";s:5:"false";s:13:"guest_details";s:4:"true";s:10:"name_label";s:4:"Name";s:11:"email_label";s:5:"Email";s:16:"message_restrict";s:68:"This page is restricted. Please Log in / Register to view this page.";s:11:"redirect_to";s:4:"post";s:7:"message";s:10:"Post saved";s:7:"page_id";s:2:"74";s:3:"url";s:0:"";s:14:"comment_status";s:4:"open";s:11:"submit_text";s:6:"Submit";s:10:"draft_post";s:5:"false";s:16:"edit_post_status";s:7:"publish";s:16:"edit_redirect_to";s:4:"same";s:14:"update_message";s:25:"Post updated successfully";s:12:"edit_page_id";s:2:"74";s:8:"edit_url";s:0:"";s:12:"subscription";s:10:"- Select -";s:11:"update_text";s:6:"Update";s:12:"notification";a:5:{s:3:"new";s:2:"on";s:6:"new_to";s:17:"stk@localhost.com";s:11:"new_subject";s:16:"New post created";s:8:"new_body";s:213:"Hi Admin,\r\nA new post has been created in your site %sitename% (%siteurl%).\r\n\r\nHere is the details:\r\nPost Title: %post_title%\r\nContent: %post_content%\r\nAuthor: %author%\r\nPost URL: %permalink%\r\nEdit URL: %editlink%";s:4:"edit";s:3:"off";}}'),
(455, 86, '_edit_lock', '1462105402:1'),
(456, 86, '_edit_last', '1'),
(457, 89, 'nm_members', 'yes'),
(458, 89, '_edit_lock', '1462103661:1'),
(459, 89, '_edit_last', '1'),
(460, 89, '_wp_page_template', 'default'),
(461, 89, '_wpuf_form_id', '86'),
(462, 91, 'nm_members', NULL),
(463, 91, '_wpuf_form_id', '78'),
(464, 91, '_edit_lock', '1462105002:1'),
(465, 91, '_edit_last', '1'),
(466, 94, 'nm_members', NULL),
(467, 94, '_menu_item_type', 'custom'),
(468, 94, '_menu_item_menu_item_parent', '0'),
(469, 94, '_menu_item_object_id', '94'),
(470, 94, '_menu_item_object', 'custom'),
(471, 94, '_menu_item_target', ''),
(472, 94, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(473, 94, '_menu_item_xfn', ''),
(474, 94, '_menu_item_url', 'http://localhost/wp-hooray/category/uncategorized/'),
(475, 94, '_menu_item_orphaned', '1462105793'),
(476, 95, 'nm_members', NULL),
(477, 95, '_menu_item_type', 'taxonomy'),
(478, 95, '_menu_item_menu_item_parent', '0'),
(479, 95, '_menu_item_object_id', '1'),
(480, 95, '_menu_item_object', 'category'),
(481, 95, '_menu_item_target', ''),
(482, 95, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(483, 95, '_menu_item_xfn', ''),
(484, 95, '_menu_item_url', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-04-30 05:29:39', '2016-04-30 05:29:39', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2016-04-30 05:29:39', '2016-04-30 05:29:39', '', 0, 'http://localhost/wp-tuto/?p=1', 0, 'post', '', 1),
(2, 1, '2016-04-30 05:29:39', '2016-04-30 05:29:39', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/wp-tuto/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2016-04-30 05:29:39', '2016-04-30 05:29:39', '', 0, 'http://localhost/wp-tuto/?page_id=2', 0, 'page', '', 0),
(3, 1, '2016-04-30 05:30:02', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-04-30 05:30:02', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=3', 0, 'post', '', 0),
(6, 1, '2016-04-30 05:47:40', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 05:47:40', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=6', 1, 'nav_menu_item', '', 0),
(7, 1, '2016-04-30 05:47:40', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 05:47:40', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=7', 1, 'nav_menu_item', '', 0),
(8, 1, '2016-04-30 06:01:27', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 06:01:27', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=8', 1, 'nav_menu_item', '', 0),
(9, 1, '2016-04-30 06:01:27', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 06:01:27', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=9', 1, 'nav_menu_item', '', 0),
(10, 1, '2016-04-30 06:48:38', '2016-04-30 06:48:38', '[wpum_login_form]', 'Login', '', 'trash', 'closed', 'closed', '', 'login__trashed', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 0, 'http://localhost/wp-tuto/login/', 0, 'page', '', 0),
(11, 1, '2016-04-30 06:48:38', '2016-04-30 06:48:38', '[wpum_password_recovery form_id="" login_link="yes" psw_link="no" register_link="yes" ]', 'Password Reset', '', 'trash', 'closed', 'closed', '', 'password-reset__trashed', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 0, 'http://localhost/wp-tuto/password-reset/', 0, 'page', '', 0),
(12, 1, '2016-04-30 06:48:38', '2016-04-30 06:48:38', '[wpum_register form_id="" login_link="yes" psw_link="yes" register_link="no" ]', 'Register', '', 'trash', 'closed', 'closed', '', 'register__trashed', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 0, 'http://localhost/wp-tuto/register/', 0, 'page', '', 0),
(13, 1, '2016-04-30 06:48:38', '2016-04-30 06:48:38', '[wpum_account]', 'Account', '', 'trash', 'closed', 'closed', '', 'account__trashed', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 0, 'http://localhost/wp-tuto/account/', 0, 'page', '', 0),
(14, 1, '2016-04-30 06:48:38', '2016-04-30 06:48:38', '[wpum_profile]', 'Profile', '', 'trash', 'closed', 'closed', '', 'profile__trashed', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 0, 'http://localhost/wp-tuto/profile/', 0, 'page', '', 0),
(15, 1, '2016-04-30 07:06:25', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:06:25', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=15', 1, 'nav_menu_item', '', 0),
(16, 1, '2016-04-30 07:06:26', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:06:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=16', 1, 'nav_menu_item', '', 0),
(17, 1, '2016-04-30 07:06:26', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:06:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=17', 1, 'nav_menu_item', '', 0),
(18, 1, '2016-04-30 07:06:26', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:06:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=18', 1, 'nav_menu_item', '', 0),
(19, 1, '2016-04-30 07:06:26', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:06:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=19', 1, 'nav_menu_item', '', 0),
(20, 1, '2016-04-30 07:06:26', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:06:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=20', 1, 'nav_menu_item', '', 0),
(21, 1, '2016-04-30 07:06:26', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:06:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=21', 1, 'nav_menu_item', '', 0),
(22, 1, '2016-04-30 07:26:13', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=22', 1, 'nav_menu_item', '', 0),
(23, 1, '2016-04-30 07:26:13', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=23', 1, 'nav_menu_item', '', 0),
(24, 1, '2016-04-30 07:26:13', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=24', 1, 'nav_menu_item', '', 0),
(25, 1, '2016-04-30 07:26:13', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=25', 1, 'nav_menu_item', '', 0),
(26, 1, '2016-04-30 07:26:13', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=26', 1, 'nav_menu_item', '', 0),
(27, 1, '2016-04-30 07:26:13', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=27', 1, 'nav_menu_item', '', 0),
(28, 1, '2016-04-30 07:26:13', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=28', 1, 'nav_menu_item', '', 0),
(29, 1, '2016-04-30 07:26:33', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=29', 1, 'nav_menu_item', '', 0),
(30, 1, '2016-04-30 07:26:33', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=30', 1, 'nav_menu_item', '', 0),
(31, 1, '2016-04-30 07:26:33', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=31', 1, 'nav_menu_item', '', 0),
(32, 1, '2016-04-30 07:26:33', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=32', 1, 'nav_menu_item', '', 0),
(33, 1, '2016-04-30 07:26:33', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=33', 1, 'nav_menu_item', '', 0),
(34, 1, '2016-04-30 07:26:33', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=34', 1, 'nav_menu_item', '', 0),
(35, 1, '2016-04-30 07:26:33', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 07:26:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=35', 1, 'nav_menu_item', '', 0),
(36, 1, '2016-04-30 10:25:45', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 10:25:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=36', 1, 'nav_menu_item', '', 0),
(37, 1, '2016-04-30 10:25:45', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 10:25:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=37', 1, 'nav_menu_item', '', 0),
(38, 1, '2016-04-30 10:25:45', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 10:25:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=38', 1, 'nav_menu_item', '', 0),
(39, 1, '2016-04-30 10:25:45', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 10:25:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=39', 1, 'nav_menu_item', '', 0),
(40, 1, '2016-04-30 10:25:45', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 10:25:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=40', 1, 'nav_menu_item', '', 0),
(41, 1, '2016-04-30 10:25:45', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 10:25:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=41', 1, 'nav_menu_item', '', 0),
(42, 1, '2016-04-30 10:25:45', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-04-30 10:25:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=42', 1, 'nav_menu_item', '', 0),
(43, 1, '2016-04-30 10:51:44', '2016-04-30 10:51:44', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2016-05-01 19:01:00', '2016-05-01 12:31:00', '', 0, 'http://localhost/wp-tuto/?p=43', 1, 'nav_menu_item', '', 0),
(49, 1, '2016-04-30 10:51:44', '2016-04-30 10:51:44', ' ', '', '', 'publish', 'closed', 'closed', '', '49', '', '', '2016-05-01 19:01:00', '2016-05-01 12:31:00', '', 0, 'http://localhost/wp-tuto/?p=49', 3, 'nav_menu_item', '', 0),
(51, 1, '2016-04-30 10:53:18', '2016-04-30 10:53:18', '[wpum_login_form]', 'Login', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 10, 'http://localhost/wp-tuto/2016/04/30/10-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2016-04-30 10:53:18', '2016-04-30 10:53:18', '[wpum_password_recovery form_id="" login_link="yes" psw_link="no" register_link="yes" ]', 'Password Reset', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 11, 'http://localhost/wp-tuto/2016/04/30/11-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2016-04-30 10:53:18', '2016-04-30 10:53:18', '[wpum_register form_id="" login_link="yes" psw_link="yes" register_link="no" ]', 'Register', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 12, 'http://localhost/wp-tuto/2016/04/30/12-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2016-04-30 10:53:18', '2016-04-30 10:53:18', '[wpum_account]', 'Account', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 13, 'http://localhost/wp-tuto/2016/04/30/13-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2016-04-30 10:53:18', '2016-04-30 10:53:18', '[wpum_profile]', 'Profile', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2016-04-30 10:53:18', '2016-04-30 10:53:18', '', 14, 'http://localhost/wp-tuto/2016/04/30/14-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2016-04-30 11:31:05', '2016-04-30 11:31:05', '[nm-wp-registration]', 'Member Registration', '', 'publish', 'closed', 'closed', '', 'register', '', '', '2016-04-30 11:31:05', '2016-04-30 11:31:05', '', 0, 'http://localhost/wp-tuto/?page_id=56', 0, 'page', '', 0),
(58, 1, '2016-04-30 11:31:05', '2016-04-30 11:31:05', '[nm-wp-registration]', 'Member Registration', '', 'inherit', 'closed', 'closed', '', '56-revision-v1', '', '', '2016-04-30 11:31:05', '2016-04-30 11:31:05', '', 56, 'http://localhost/wp-tuto/2016/04/30/56-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2016-04-30 16:32:25', '2016-04-30 16:32:25', '[nm-wp-login]', 'Login', '', 'publish', 'closed', 'closed', '', 'login', '', '', '2016-04-30 16:32:25', '2016-04-30 16:32:25', '', 0, 'http://localhost/wp-tuto/?page_id=59', 0, 'page', '', 0),
(61, 1, '2016-04-30 16:32:25', '2016-04-30 16:32:25', '[nm-wp-login]', 'Login', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2016-04-30 16:32:25', '2016-04-30 16:32:25', '', 59, 'http://localhost/wp-tuto/2016/04/30/59-revision-v1/', 0, 'revision', '', 0),
(62, 4, '2016-05-01 04:21:59', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-05-01 04:21:59', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=62', 0, 'post', '', 0),
(63, 4, '2016-05-01 04:22:12', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-05-01 04:22:12', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?p=63', 0, 'post', '', 0),
(64, 4, '2016-05-01 04:24:50', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-05-01 04:24:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?page_id=64', 0, 'page', '', 0),
(66, 1, '2016-05-01 05:39:11', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-01 05:39:11', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?post_type=trouble-corner&p=66', 0, 'trouble-corner', '', 0),
(67, 1, '2016-05-01 05:39:38', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-01 05:39:38', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?post_type=trouble-corner&p=67', 0, 'trouble-corner', '', 0),
(70, 1, '2016-05-01 05:45:14', '0000-00-00 00:00:00', '', 'Sample user feedback post', '', 'draft', 'open', 'closed', '', '', '', '', '2016-05-01 05:45:14', '2016-05-01 05:45:14', '', 0, 'http://localhost/wp-tuto/?post_type=trouble-corner&#038;p=70', 0, 'trouble-corner', '', 0),
(71, 1, '2016-05-01 05:46:47', '2016-05-01 05:46:47', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras purus elit, pulvinar in lobortis aliquet, interdum in dolor. Sed malesuada elit nec nisl ornare sed rutrum arcu consectetur. Nulla congue imperdiet tincidunt. <!--more-->Nunc semper nibh ac magna interdum ultricies. Ut a massa sed sapien accumsan gravida. Nulla facilisi. Duis vel tortor dolor, a condimentum dolor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam ac ipsum consequat magna imperdiet mattis non non nunc. Duis sed libero augue, vel vestibulum nisi. Ut euismod, enim quis mollis laoreet, arcu risus hendrerit nulla, eget tempus quam mi vel magna. Duis quis orci orci, non sodales risus. Suspendisse auctor dui sollicitudin mauris suscipit eget accumsan nunc adipiscing. Suspendisse mollis porttitor ultricies. Aenean id nisl nisi. Cras auctor ultricies ante, vitae aliquet nunc tempor scelerisque. Curabitur sed sem non dui consectetur egestas. Proin ultricies iaculis nisl ac egestas.\r\n\r\nQuisque varius sapien eget lorem feugiat vel dictum neque semper. Duis consequat nisl vitae risus adipiscing aliquam. Suspendisse vehicula egestas blandit. In laoreet molestie est. Donec rhoncus sodales ligula vitae fringilla. Mauris congue blandit metus eu eleifend. Cras gravida, nisi at euismod malesuada, justo massa adipiscing nisl, porttitor tristique urna ipsum id lacus. Nullam a leo neque, eget pulvinar urna. Suspendisse fringilla ante vitae nisi ultricies vestibulum. Donec id libero quis orci blandit placerat. Sed ut eros at nunc cursus commodo eget eu neque. Donec molestie, nisi non eleifend placerat, turpis odio pretium nisl, ac consequat eros leo malesuada dolor. Vivamus sit amet orci non lectus interdum condimentum vitae tempus nisi.', 'Sample user feedback post', '', 'publish', 'open', 'closed', '', 'sample-user-feedback-post', '', '', '2016-05-01 05:46:47', '2016-05-01 05:46:47', '', 0, 'http://localhost/wp-tuto/?post_type=feedback&#038;p=71', 0, 'feedback', '', 0),
(72, 1, '2016-05-01 05:46:47', '2016-05-01 05:46:47', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras purus elit, pulvinar in lobortis aliquet, interdum in dolor. Sed malesuada elit nec nisl ornare sed rutrum arcu consectetur. Nulla congue imperdiet tincidunt. <!--more-->Nunc semper nibh ac magna interdum ultricies. Ut a massa sed sapien accumsan gravida. Nulla facilisi. Duis vel tortor dolor, a condimentum dolor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam ac ipsum consequat magna imperdiet mattis non non nunc. Duis sed libero augue, vel vestibulum nisi. Ut euismod, enim quis mollis laoreet, arcu risus hendrerit nulla, eget tempus quam mi vel magna. Duis quis orci orci, non sodales risus. Suspendisse auctor dui sollicitudin mauris suscipit eget accumsan nunc adipiscing. Suspendisse mollis porttitor ultricies. Aenean id nisl nisi. Cras auctor ultricies ante, vitae aliquet nunc tempor scelerisque. Curabitur sed sem non dui consectetur egestas. Proin ultricies iaculis nisl ac egestas.\r\n\r\nQuisque varius sapien eget lorem feugiat vel dictum neque semper. Duis consequat nisl vitae risus adipiscing aliquam. Suspendisse vehicula egestas blandit. In laoreet molestie est. Donec rhoncus sodales ligula vitae fringilla. Mauris congue blandit metus eu eleifend. Cras gravida, nisi at euismod malesuada, justo massa adipiscing nisl, porttitor tristique urna ipsum id lacus. Nullam a leo neque, eget pulvinar urna. Suspendisse fringilla ante vitae nisi ultricies vestibulum. Donec id libero quis orci blandit placerat. Sed ut eros at nunc cursus commodo eget eu neque. Donec molestie, nisi non eleifend placerat, turpis odio pretium nisl, ac consequat eros leo malesuada dolor. Vivamus sit amet orci non lectus interdum condimentum vitae tempus nisi.', 'Sample user feedback post', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2016-05-01 05:46:47', '2016-05-01 05:46:47', '', 71, 'http://localhost/wp-tuto/2016/05/01/71-revision-v1/', 0, 'revision', '', 0),
(73, 4, '2016-05-01 16:14:33', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-01 16:14:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?post_type=feedback&p=73', 0, 'feedback', '', 0),
(74, 1, '2016-05-01 16:18:24', '2016-05-01 09:48:24', '[wpuf_form id="78"]', 'Submit Feedback', '', 'publish', 'closed', 'closed', '', 'submit-feedback', '', '', '2016-05-01 16:35:35', '2016-05-01 10:05:35', '', 0, 'http://localhost/wp-tuto/?page_id=74', 0, 'page', '', 0),
(75, 1, '2016-05-01 16:18:24', '2016-05-01 09:48:24', '[fep_submission_form]', 'Submit Feedback', '', 'inherit', 'closed', 'closed', '', '74-revision-v1', '', '', '2016-05-01 16:18:24', '2016-05-01 09:48:24', '', 74, 'http://localhost/wp-tuto/2016/05/01/74-revision-v1/', 0, 'revision', '', 0),
(76, 3, '2016-05-01 16:25:36', '2016-05-01 09:55:36', 'Quisque varius sapien eget lorem feugiat vel dictum neque semper. Duis consequat nisl vitae risus adipiscing aliquam. Suspendisse vehicula egestas blandit. In laoreet molestie est. Donec rhoncus sodales ligula vitae fringilla. Mauris congue blandit metus eu eleifend. Cras gravida, nisi at euismod malesuada, justo massa adipiscing nisl, porttitor tristique urna ipsum id lacus. Nullam a leo neque, eget pulvinar urna. Suspendisse fringilla ante vitae nisi ultricies vestibulum. Donec id libero quis orci blandit placerat. Sed ut eros at nunc cursus commodo eget eu neque. Donec molestie, nisi non eleifend placerat, turpis odio pretium nisl, ac consequat eros leo malesuada dolor. Vivamus sit amet orci non lectus interdum condimentum vitae tempus nisi.<!--more-->\r\n\r\nPraesent lacus libero, rutrum vitae congue adipiscing, scelerisque vitae tortor. Suspendisse elit ipsum, porttitor ac pharetra eget, faucibus id nulla. Maecenas vel viverra lorem. Aliquam suscipit iaculis ornare. Fusce vel posuere elit. Ut eu mi magna, aliquet aliquam mi. Donec interdum dolor non mi imperdiet viverra. Duis tincidunt nulla eget nulla viverra sodales. In mollis erat sit amet sem laoreet quis tempus diam elementum. Nullam cursus egestas blandit. Etiam fringilla, elit vel rutrum sodales, mi felis blandit lectus, eu dictum urna dolor et est. Aenean neque nulla, dictum quis sodales ut, fringilla in ligula. Maecenas sapien erat, placerat vel laoreet non, egestas ut leo. Vivamus hendrerit interdum elit, ac malesuada purus interdum sit amet. Fusce enim lacus, dignissim vehicula sagittis ut, ultrices quis tellus. Aenean velit felis, volutpat vitae commodo at, tincidunt at tortor. Duis pharetra vestibulum enim, a pulvinar orci accumsan at. Phasellus et nunc odio. Nulla facilisi. Ut viverra libero et quam hendrerit sit amet lacinia tellus lobortis.', 'This is a test', '', 'publish', 'open', 'open', '', 'this-is-a-test', '', '', '2016-05-01 16:25:36', '2016-05-01 09:55:36', '', 0, 'http://localhost/wp-tuto/?p=76', 0, 'post', '', 0),
(77, 1, '2016-05-01 16:25:36', '2016-05-01 09:55:36', 'Quisque varius sapien eget lorem feugiat vel dictum neque semper. Duis consequat nisl vitae risus adipiscing aliquam. Suspendisse vehicula egestas blandit. In laoreet molestie est. Donec rhoncus sodales ligula vitae fringilla. Mauris congue blandit metus eu eleifend. Cras gravida, nisi at euismod malesuada, justo massa adipiscing nisl, porttitor tristique urna ipsum id lacus. Nullam a leo neque, eget pulvinar urna. Suspendisse fringilla ante vitae nisi ultricies vestibulum. Donec id libero quis orci blandit placerat. Sed ut eros at nunc cursus commodo eget eu neque. Donec molestie, nisi non eleifend placerat, turpis odio pretium nisl, ac consequat eros leo malesuada dolor. Vivamus sit amet orci non lectus interdum condimentum vitae tempus nisi.<!--more-->\r\n\r\nPraesent lacus libero, rutrum vitae congue adipiscing, scelerisque vitae tortor. Suspendisse elit ipsum, porttitor ac pharetra eget, faucibus id nulla. Maecenas vel viverra lorem. Aliquam suscipit iaculis ornare. Fusce vel posuere elit. Ut eu mi magna, aliquet aliquam mi. Donec interdum dolor non mi imperdiet viverra. Duis tincidunt nulla eget nulla viverra sodales. In mollis erat sit amet sem laoreet quis tempus diam elementum. Nullam cursus egestas blandit. Etiam fringilla, elit vel rutrum sodales, mi felis blandit lectus, eu dictum urna dolor et est. Aenean neque nulla, dictum quis sodales ut, fringilla in ligula. Maecenas sapien erat, placerat vel laoreet non, egestas ut leo. Vivamus hendrerit interdum elit, ac malesuada purus interdum sit amet. Fusce enim lacus, dignissim vehicula sagittis ut, ultrices quis tellus. Aenean velit felis, volutpat vitae commodo at, tincidunt at tortor. Duis pharetra vestibulum enim, a pulvinar orci accumsan at. Phasellus et nunc odio. Nulla facilisi. Ut viverra libero et quam hendrerit sit amet lacinia tellus lobortis.', 'This is a test', '', 'inherit', 'closed', 'closed', '', '76-revision-v1', '', '', '2016-05-01 16:25:36', '2016-05-01 09:55:36', '', 76, 'http://localhost/wp-tuto/2016/05/01/76-revision-v1/', 0, 'revision', '', 0),
(78, 1, '2016-05-01 16:34:18', '2016-05-01 10:04:18', '', 'Feedback Create Form', '', 'publish', 'closed', 'closed', '', 'feedback-form', '', '', '2016-05-01 18:22:38', '2016-05-01 11:52:38', '', 0, 'http://localhost/wp-tuto/?post_type=wpuf_forms&#038;p=78', 0, 'wpuf_forms', '', 0),
(79, 1, '2016-05-01 16:34:18', '2016-05-01 10:04:18', 'a:16:{s:10:"input_type";s:8:"textarea";s:8:"template";s:12:"post_content";s:8:"required";s:3:"yes";s:5:"label";s:11:"Description";s:4:"name";s:12:"post_content";s:7:"is_meta";s:2:"no";s:4:"help";s:0:"";s:3:"css";s:0:"";s:4:"rows";s:1:"5";s:4:"cols";s:2:"25";s:11:"placeholder";s:0:"";s:7:"default";s:0:"";s:4:"rich";s:3:"yes";s:12:"insert_image";s:2:"no";s:16:"word_restriction";s:0:"";s:9:"wpuf_cond";N;}', '', '', 'publish', 'closed', 'closed', '', '79', '', '', '2016-05-01 18:22:38', '2016-05-01 11:52:38', '', 78, 'http://localhost/wp-tuto/wpuf_input/79/', 1, 'wpuf_input', '', 0),
(80, 1, '2016-05-01 16:35:35', '2016-05-01 10:05:35', '[wpuf_form id="78"]', 'Submit Feedback', '', 'inherit', 'closed', 'closed', '', '74-revision-v1', '', '', '2016-05-01 16:35:35', '2016-05-01 10:05:35', '', 74, 'http://localhost/wp-tuto/2016/05/01/74-revision-v1/', 0, 'revision', '', 0),
(82, 1, '2016-05-01 16:45:49', '2016-05-01 10:15:49', 'a:12:{s:10:"input_type";s:4:"text";s:8:"template";s:10:"post_title";s:8:"required";s:3:"yes";s:5:"label";s:5:"Title";s:4:"name";s:10:"post_title";s:7:"is_meta";s:2:"no";s:4:"help";s:0:"";s:3:"css";s:0:"";s:11:"placeholder";s:0:"";s:7:"default";s:0:"";s:4:"size";s:2:"40";s:9:"wpuf_cond";N;}', '', '', 'publish', 'closed', 'closed', '', '82', '', '', '2016-05-01 18:22:38', '2016-05-01 11:52:38', '', 78, 'http://localhost/wp-tuto/wpuf_input/82/', 0, 'wpuf_input', '', 0),
(83, 3, '2016-05-01 16:48:05', '2016-05-01 10:18:05', '<p>Donec at lectus id ante cursus tincidunt. Vestibulum odio purus, elementum vel imperdiet eget, auctor vitae diam. Duis venenatis interdum metus. In elit nulla, molestie eu sollicitudin sed, fermentum sed massa. Pellentesque lacinia ultrices elementum. Suspendisse vehicula velit sed risus consectetur ornare. Cras id nunc est, in dictum nulla. Aenean in vulputate sapien. <!--more-->Duis purus mauris, commodo nec porta non, pharetra vitae elit. Sed sollicitudin hendrerit est et scelerisque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi id diam lectus, ac varius sem. Aliquam erat volutpat. Quisque scelerisque, nisl at auctor hendrerit, metus odio tincidunt massa, pulvinar lacinia eros odio vel tellus.</p>', 'WP User Frontend', '', 'publish', 'open', 'closed', '', 'wp-user-frontend', '', '', '2016-05-01 16:48:05', '2016-05-01 10:18:05', '', 0, 'http://localhost/wp-tuto/feedback/wp-user-frontend/', 0, 'feedback', '', 3),
(85, 1, '2016-05-01 17:01:13', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-01 17:01:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-tuto/?post_type=feedback&p=85', 0, 'feedback', '', 0),
(86, 1, '2016-05-01 18:23:06', '2016-05-01 11:53:06', '', 'Feedback Edit Form', '', 'publish', 'closed', 'closed', '', 'feedback-edit-form', '', '', '2016-05-01 18:23:06', '2016-05-01 11:53:06', '', 0, 'http://localhost/wp-hooray/?post_type=wpuf_forms&#038;p=86', 0, 'wpuf_forms', '', 0),
(87, 1, '2016-05-01 18:22:51', '2016-05-01 11:52:51', 'a:12:{s:10:"input_type";s:4:"text";s:8:"template";s:10:"post_title";s:8:"required";s:3:"yes";s:5:"label";s:5:"Title";s:4:"name";s:10:"post_title";s:7:"is_meta";s:2:"no";s:4:"help";s:0:"";s:3:"css";s:0:"";s:11:"placeholder";s:0:"";s:7:"default";s:0:"";s:4:"size";s:2:"40";s:9:"wpuf_cond";N;}', '', '', 'publish', 'closed', 'closed', '', '87', '', '', '2016-05-01 18:23:06', '2016-05-01 11:53:06', '', 86, 'http://localhost/wp-hooray/wpuf_input/87/', 0, 'wpuf_input', '', 0),
(88, 1, '2016-05-01 18:22:51', '2016-05-01 11:52:51', 'a:16:{s:10:"input_type";s:8:"textarea";s:8:"template";s:12:"post_content";s:8:"required";s:3:"yes";s:5:"label";s:11:"Description";s:4:"name";s:12:"post_content";s:7:"is_meta";s:2:"no";s:4:"help";s:0:"";s:3:"css";s:0:"";s:4:"rows";s:1:"5";s:4:"cols";s:2:"25";s:11:"placeholder";s:0:"";s:7:"default";s:0:"";s:4:"rich";s:3:"yes";s:12:"insert_image";s:2:"no";s:16:"word_restriction";s:0:"";s:9:"wpuf_cond";N;}', '', '', 'publish', 'closed', 'closed', '', '88', '', '', '2016-05-01 18:23:06', '2016-05-01 11:53:06', '', 86, 'http://localhost/wp-hooray/wpuf_input/88/', 1, 'wpuf_input', '', 0),
(89, 1, '2016-05-01 18:26:35', '2016-05-01 11:56:35', '[wpuf_edit]', 'Edit Feedback', '', 'publish', 'closed', 'closed', '', 'edit-feedback', '', '', '2016-05-01 18:26:35', '2016-05-01 11:56:35', '', 0, 'http://localhost/wp-hooray/?page_id=89', 0, 'page', '', 0),
(90, 1, '2016-05-01 18:26:35', '2016-05-01 11:56:35', '[wpuf_edit]', 'Edit Feedback', '', 'inherit', 'closed', 'closed', '', '89-revision-v1', '', '', '2016-05-01 18:26:35', '2016-05-01 11:56:35', '', 89, 'http://localhost/wp-hooray/2016/05/01/89-revision-v1/', 0, 'revision', '', 0),
(91, 4, '2016-05-01 18:45:51', '2016-05-01 12:15:51', 'Contributors: nmedia\r\nDonate link: http://www.najeebmedia.com/donate/\r\nTags: registration form, simple registration, drag drop fields, front end registration, wp registration, signup form, wp signup form, ajax wp form\r\n\r\n<!--more-->\r\nRequires at least: 3.5\r\nTested up to: 4.5\r\nStable tag: 1.8\r\nLicense: GPLv2\r\nLicense URI: http://www.gnu.org/licenses/gpl-2.0.html\r\n\r\nThis plugin allow admin to create user signup form to render on front end using drag and drop easy admin panel\r\n\r\n<strong>Description</strong>\r\nThis plugin render wordpress signup form based on fields selected by Admin. Input fields can be placed in registration form using nice drag and drop meta page.\r\nThis plugin is also a best combination when use with N-Media other form plugins like:\r\n[File uploader pro](https://wordpress.org/plugins/nmedia-user-file-uploader/)\r\n[Front end repositor manager](https://wordpress.org/plugins/wp-front-end-repository/)\r\n[Member private conversation](https://wordpress.org/plugins/wordpress-member-private-conversation/)\r\n[File sharing plugin](http://najeebmedia.com/n-media-file-sharing-with-ultimate-security/)\r\n\r\n\r\n<strong>How to use</strong>\r\n* Just create a page and place this shortcode: `[nm-wp-registration]`\r\n* Then setup form fields and other settins from `Admin -&gt; WP Registration` described below section\r\n* Custom login page can also set with shortcode `[nm-wp-login]`\r\n\r\n<strong>How it works</strong>\r\n[vimeo http://vimeo.com/112390753]\r\n\r\n<strong>Plugin Settings</strong>\r\n= Basic Settings Tab =\r\n* Signup form title (`it will render as Registration form title if requried`);\r\n* Signup form description  (`it will render description under title if required`)\r\n* Terms and conditions (`nice feature to add a checkbox with provided text to accept before submit`)\r\n* Success message (`this message will displayed when form submitted successfully`)\r\n* Redirects URL (`after registration and login redirect url can be set`)\r\n* Validation message (`display a message when one or more required field(s) not provided`)\r\n* Singup button title\r\n* Signup button text color\r\n* Signup button text font size\r\n* Signup button BG color\r\n* Signup button class\r\n* Form custom CSS editor\r\n* Set email contents for signup completion (`%USERNAME%`, `%USER_PASSWORD%`, `%SITE_NAME%`)\r\n* Set signup form input fields using drag drop editor\r\n\r\n= Pro Features =\r\n* Autocomplete, multi select input\r\n* Avartar support\r\n* Edit profile\r\n* Change password form\r\n* Member Direclty\r\n* Login with Facebook\r\n* Auto Login\r\n* Access to Support Forum\r\n* Page restricted by Roles\r\n* Singup with defined Role\r\n[Visite for more detail](http://najeebmedia.com/wordpress-plugin/wp-user-registration-form/)\r\n\r\n<strong> Installation</strong>\r\n\r\n1. Upload plugin directory to the `/wp-content/plugins/` directory\r\n2. Activate the plugin through the ''Plugins'' menu in WordPress\r\n3. After activation, you can set options from `Comment Fields` menu\r\n\r\n== Frequently Asked Questions ==\r\n= How to use =\r\n* Just create a page and place this shortcode: `[nm-wp-registration]`\r\n* Then setup form fields and other settins from `Admin -&gt; WP Registration` described below section\r\n\r\n= Where all fields are saved? =\r\n* All fields are saved as User meta and can be seen under profile', 'Simple User Registration', '', 'publish', 'open', 'closed', '', 'simple-user-registration', '', '', '2016-05-01 18:48:14', '2016-05-01 12:18:14', '', 0, 'http://localhost/wp-hooray/feedback/simple-user-registration/', 0, 'feedback', '', 0),
(92, 1, '2016-05-01 18:47:48', '2016-05-01 12:17:48', 'Contributors: nmedia\nDonate link: http://www.najeebmedia.com/donate/\nTags: registration form, simple registration, drag drop fields, front end registration, wp registration, signup form, wp signup form, ajax wp form\n\n<!--more-->\nRequires at least: 3.5\nTested up to: 4.5\nStable tag: 1.8\nLicense: GPLv2\nLicense URI: http://www.gnu.org/licenses/gpl-2.0.html\n\nThis plugin allow admin to create user signup form to render on front end using drag and drop easy admin panel\n\n<strong>Description</strong>\nThis plugin render wordpress signup form based on fields selected by Admin. Input fields can be placed in registration form using nice drag and drop meta page.\nThis plugin is also a best combination when use with N-Media other form plugins like:\n[File uploader pro](https://wordpress.org/plugins/nmedia-user-file-uploader/)\n[Front end repositor manager](https://wordpress.org/plugins/wp-front-end-repository/)\n[Member private conversation](https://wordpress.org/plugins/wordpress-member-private-conversation/)\n[File sharing plugin](http://najeebmedia.com/n-media-file-sharing-with-ultimate-security/)\n\n\n<strong>How to use</strong>\n* Just create a page and place this shortcode: `[nm-wp-registration]`\n* Then setup form fields and other settins from `Admin -&gt; WP Registration` described below section\n* Custom login page can also set with shortcode `[nm-wp-login]`\n\n= How it works =\n[vimeo http://vimeo.com/112390753]\n\nPlugin Settings\n= Basic Settings Tab =\n* Signup form title (`it will render as Registration form title if requried`);\n* Signup form description  (`it will render description under title if required`)\n* Terms and conditions (`nice feature to add a checkbox with provided text to accept before submit`)\n* Success message (`this message will displayed when form submitted successfully`)\n* Redirects URL (`after registration and login redirect url can be set`)\n* Validation message (`display a message when one or more required field(s) not provided`)\n* Singup button title\n* Signup button text color\n* Signup button text font size\n* Signup button BG color\n* Signup button class\n* Form custom CSS editor\n* Set email contents for signup completion (`%USERNAME%`, `%USER_PASSWORD%`, `%SITE_NAME%`)\n* Set signup form input fields using drag drop editor\n\n\n\n= Pro Features =\n* Autocomplete, multi select input\n* Avartar support\n* Edit profile\n* Change password form\n* Member Direclty\n* Login with Facebook\n* Auto Login\n* Access to Support Forum\n* Page restricted by Roles\n* Singup with defined Role\n[Visite for more detail](http://najeebmedia.com/wordpress-plugin/wp-user-registration-form/)\n\n\n== Installation ==\n\n1. Upload plugin directory to the `/wp-content/plugins/` directory\n2. Activate the plugin through the ''Plugins'' menu in WordPress\n3. After activation, you can set options from `Comment Fields` menu\n\n== Frequently Asked Questions ==\n= How to use =\n* Just create a page and place this shortcode: `[nm-wp-registration]`\n* Then setup form fields and other settins from `Admin -&gt; WP Registration` described below section\n\n= Where all fields are saved? =\n* All fields are saved as User meta and can be seen under profile', 'Simple User Registration', '', 'inherit', 'closed', 'closed', '', '91-autosave-v1', '', '', '2016-05-01 18:47:48', '2016-05-01 12:17:48', '', 91, 'http://localhost/wp-hooray/2016/05/01/91-autosave-v1/', 0, 'revision', '', 0),
(93, 1, '2016-05-01 18:48:14', '2016-05-01 12:18:14', 'Contributors: nmedia\r\nDonate link: http://www.najeebmedia.com/donate/\r\nTags: registration form, simple registration, drag drop fields, front end registration, wp registration, signup form, wp signup form, ajax wp form\r\n\r\n<!--more-->\r\nRequires at least: 3.5\r\nTested up to: 4.5\r\nStable tag: 1.8\r\nLicense: GPLv2\r\nLicense URI: http://www.gnu.org/licenses/gpl-2.0.html\r\n\r\nThis plugin allow admin to create user signup form to render on front end using drag and drop easy admin panel\r\n\r\n<strong>Description</strong>\r\nThis plugin render wordpress signup form based on fields selected by Admin. Input fields can be placed in registration form using nice drag and drop meta page.\r\nThis plugin is also a best combination when use with N-Media other form plugins like:\r\n[File uploader pro](https://wordpress.org/plugins/nmedia-user-file-uploader/)\r\n[Front end repositor manager](https://wordpress.org/plugins/wp-front-end-repository/)\r\n[Member private conversation](https://wordpress.org/plugins/wordpress-member-private-conversation/)\r\n[File sharing plugin](http://najeebmedia.com/n-media-file-sharing-with-ultimate-security/)\r\n\r\n\r\n<strong>How to use</strong>\r\n* Just create a page and place this shortcode: `[nm-wp-registration]`\r\n* Then setup form fields and other settins from `Admin -&gt; WP Registration` described below section\r\n* Custom login page can also set with shortcode `[nm-wp-login]`\r\n\r\n<strong>How it works</strong>\r\n[vimeo http://vimeo.com/112390753]\r\n\r\n<strong>Plugin Settings</strong>\r\n= Basic Settings Tab =\r\n* Signup form title (`it will render as Registration form title if requried`);\r\n* Signup form description  (`it will render description under title if required`)\r\n* Terms and conditions (`nice feature to add a checkbox with provided text to accept before submit`)\r\n* Success message (`this message will displayed when form submitted successfully`)\r\n* Redirects URL (`after registration and login redirect url can be set`)\r\n* Validation message (`display a message when one or more required field(s) not provided`)\r\n* Singup button title\r\n* Signup button text color\r\n* Signup button text font size\r\n* Signup button BG color\r\n* Signup button class\r\n* Form custom CSS editor\r\n* Set email contents for signup completion (`%USERNAME%`, `%USER_PASSWORD%`, `%SITE_NAME%`)\r\n* Set signup form input fields using drag drop editor\r\n\r\n= Pro Features =\r\n* Autocomplete, multi select input\r\n* Avartar support\r\n* Edit profile\r\n* Change password form\r\n* Member Direclty\r\n* Login with Facebook\r\n* Auto Login\r\n* Access to Support Forum\r\n* Page restricted by Roles\r\n* Singup with defined Role\r\n[Visite for more detail](http://najeebmedia.com/wordpress-plugin/wp-user-registration-form/)\r\n\r\n<strong> Installation</strong>\r\n\r\n1. Upload plugin directory to the `/wp-content/plugins/` directory\r\n2. Activate the plugin through the ''Plugins'' menu in WordPress\r\n3. After activation, you can set options from `Comment Fields` menu\r\n\r\n== Frequently Asked Questions ==\r\n= How to use =\r\n* Just create a page and place this shortcode: `[nm-wp-registration]`\r\n* Then setup form fields and other settins from `Admin -&gt; WP Registration` described below section\r\n\r\n= Where all fields are saved? =\r\n* All fields are saved as User meta and can be seen under profile', 'Simple User Registration', '', 'inherit', 'closed', 'closed', '', '91-revision-v1', '', '', '2016-05-01 18:48:14', '2016-05-01 12:18:14', '', 91, 'http://localhost/wp-hooray/2016/05/01/91-revision-v1/', 0, 'revision', '', 0),
(94, 1, '2016-05-01 18:59:53', '0000-00-00 00:00:00', '', 'Posts', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-05-01 18:59:53', '0000-00-00 00:00:00', '', 0, 'http://localhost/wp-hooray/?p=94', 1, 'nav_menu_item', '', 0),
(95, 1, '2016-05-01 19:01:00', '2016-05-01 12:31:00', '', 'Posts', '', 'publish', 'closed', 'closed', '', 'posts', '', '', '2016-05-01 19:01:00', '2016-05-01 12:31:00', '', 0, 'http://localhost/wp-hooray/?p=95', 2, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Main Menu', 'main-menu', 0),
(3, 'feedback', 'feedback', 0),
(4, 'feedbacks', 'feedbacks', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(43, 2, 0),
(49, 2, 0),
(76, 1, 0),
(76, 3, 0),
(95, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(2, 2, 'nav_menu', '', 0, 3),
(3, 3, 'post_tag', '', 0, 1),
(4, 4, 'category', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '1'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(17, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:28:"add-post-type-trouble-corner";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(18, 1, 'session_tokens', 'a:6:{s:64:"ce9db5b0f8d1c42d3660bad018b68181b19ec4c1ac130589f759d191029e79ca";a:4:{s:10:"expiration";i:1462172149;s:2:"ip";s:3:"::1";s:2:"ua";s:101:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.87 Safari/537.36";s:5:"login";i:1461999349;}s:64:"dfdf256a2a62e70885c46cdf4798c24b79dc1e1a0df8da6a7a63d732a3f7152e";a:4:{s:10:"expiration";i:1462184635;s:2:"ip";s:3:"::1";s:2:"ua";s:101:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.87 Safari/537.36";s:5:"login";i:1462011835;}s:64:"e65d80f967804e4085dd593ce4db0f31c7f51a519a90130fa9d932f7016a56d3";a:4:{s:10:"expiration";i:1462211166;s:2:"ip";s:3:"::1";s:2:"ua";s:101:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.87 Safari/537.36";s:5:"login";i:1462038366;}s:64:"346e3b1598c65c00f1963b535aa244baac3551553f5bd8fc41e9bec7e51c94d4";a:4:{s:10:"expiration";i:1462248911;s:2:"ip";s:3:"::1";s:2:"ua";s:101:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.87 Safari/537.36";s:5:"login";i:1462076111;}s:64:"e2e028be8633cdd9000807093afc231fa3223685e1a379be228b8b96a5f5078e";a:4:{s:10:"expiration";i:1463303709;s:2:"ip";s:3:"::1";s:2:"ua";s:101:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.87 Safari/537.36";s:5:"login";i:1462094109;}s:64:"1a301aeb4794b6508e07d238ad89168a31d8052c7659d2c0a8b8418e7649cf78";a:4:{s:10:"expiration";i:1463311871;s:2:"ip";s:3:"::1";s:2:"ua";s:101:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.87 Safari/537.36";s:5:"login";i:1462102271;}}'),
(19, 1, 'nav_menu_recently_edited', '2'),
(36, 3, 'nickname', 'subscriber'),
(37, 3, 'first_name', 'Mr.'),
(38, 3, 'last_name', 'Subscriber'),
(39, 3, 'description', ''),
(40, 3, 'rich_editing', 'true'),
(41, 3, 'comment_shortcuts', 'false'),
(42, 3, 'admin_color', 'fresh'),
(43, 3, 'use_ssl', '0'),
(44, 3, 'show_admin_bar_front', 'true'),
(45, 3, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(46, 3, 'wp_user_level', '0'),
(47, 3, 'dismissed_wp_pointers', ''),
(48, 3, '_post_id', ''),
(49, 3, 'wp_registration_nickname', 'thuta'),
(50, 3, 'wp_registration_age', '18'),
(51, 3, 'wp_registration_sex', 'Male'),
(53, 4, 'nickname', 'editor'),
(54, 4, 'first_name', 'Mr.'),
(55, 4, 'last_name', 'Editor'),
(56, 4, 'description', ''),
(57, 4, 'rich_editing', 'true'),
(58, 4, 'comment_shortcuts', 'false'),
(59, 4, 'admin_color', 'fresh'),
(60, 4, 'use_ssl', '0'),
(61, 4, 'show_admin_bar_front', 'true'),
(62, 4, 'wp_capabilities', 'a:1:{s:6:"editor";b:1;}'),
(63, 4, 'wp_user_level', '7'),
(64, 4, 'dismissed_wp_pointers', ''),
(65, 4, '_post_id', ''),
(66, 4, 'wp_registration_nickname', ''),
(67, 4, 'wp_registration_age', '33'),
(68, 4, 'wp_registration_sex', 'Male'),
(85, 3, 'session_tokens', 'a:2:{s:64:"3120d4ff9c94328d8acc50e0592f5cdd83e03f9b3e651e17ed96062e632206a9";a:4:{s:10:"expiration";i:1462210623;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:65:"Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0";s:5:"login";i:1462037823;}s:64:"29dde07c6a5bc852b99472008e5662d328717d4c030d2c93690b9f46cd5c2f84";a:4:{s:10:"expiration";i:1462275146;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:65:"Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0";s:5:"login";i:1462102346;}}'),
(104, 4, 'wp_dashboard_quick_press_last_post_id', '62'),
(105, 1, 'wp_user-settings', 'mfold=o&hidetb=1'),
(106, 1, 'wp_user-settings-time', '1462105090'),
(108, 3, 'wp_user-settings', 'editor=tinymce&hidetb=0'),
(109, 3, 'wp_user-settings-time', '1462098067'),
(118, 1, 'closedpostboxes_wpuf_forms', 'a:1:{i:0;s:26:"wpuf-metabox-fields-banner";}'),
(119, 1, 'metaboxhidden_wpuf_forms', 'a:1:{i:0;s:7:"slugdiv";}'),
(120, 4, 'wpuf_postlock', 'no'),
(121, 4, 'wpuf_lock_cause', ''),
(122, 4, 'wpuf_sub_validity', NULL),
(123, 4, 'wpuf_sub_pcount', NULL),
(124, 3, 'wpuf_postlock', 'no'),
(125, 3, 'wpuf_lock_cause', ''),
(126, 3, 'wpuf_sub_validity', NULL),
(127, 3, 'wpuf_sub_pcount', NULL),
(129, 7, 'nickname', 'contributor'),
(130, 7, 'first_name', 'Mr.'),
(131, 7, 'last_name', 'Contributor'),
(132, 7, 'description', ''),
(133, 7, 'rich_editing', 'true'),
(134, 7, 'comment_shortcuts', 'false'),
(135, 7, 'admin_color', 'fresh'),
(136, 7, 'use_ssl', '0'),
(137, 7, 'show_admin_bar_front', 'true'),
(138, 7, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(139, 7, 'wp_user_level', '0'),
(140, 7, 'dismissed_wp_pointers', ''),
(141, 7, '_post_id', ''),
(142, 7, 'wp_registration_nickname', 'contributor'),
(143, 7, 'wp_registration_age', '25'),
(144, 7, 'wp_registration_sex', 'Male'),
(145, 7, 'wpuf_postlock', 'no'),
(146, 7, 'wpuf_lock_cause', ''),
(147, 7, 'wpuf_sub_validity', NULL),
(148, 7, 'wpuf_sub_pcount', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BXcnMZrslPDohFGGHxRGixwOmINjF9.', 'admin', 'stk@localhost.com', '', '2016-04-30 05:29:39', '', 0, 'admin'),
(3, 'subscriber', '$P$BzW0xtd1cki1o0QUXxGZWefTymFJoM1', 'subscriber', 'test1@localhost.com', '', '2016-04-30 17:11:35', '', 0, 'Mr. Subscriber'),
(4, 'editor', '$P$ByG/YptckEuSPqmIBDwYTmwuvwim5M1', 'editor', 'test@localhost.com', '', '2016-04-30 17:17:35', '', 0, 'Mr. Editor'),
(7, 'contributor', '$P$BNh0RhQTcyxZh/iYNKW/e5.n/0quGO1', 'contributor', 'test2@localhost.com', '', '2016-05-01 12:01:35', '', 0, 'Mr. Contributor');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpuf_transaction`
--

DROP TABLE IF EXISTS `wp_wpuf_transaction`;
CREATE TABLE IF NOT EXISTS `wp_wpuf_transaction` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending_payment',
  `cost` varchar(255) DEFAULT '',
  `post_id` varchar(20) DEFAULT NULL,
  `pack_id` bigint(20) DEFAULT NULL,
  `payer_first_name` longtext,
  `payer_last_name` longtext,
  `payer_email` longtext,
  `payment_type` longtext,
  `payer_address` longtext,
  `transaction_id` longtext,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
