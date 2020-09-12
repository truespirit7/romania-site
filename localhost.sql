-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 12, 2020 at 03:11 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--
CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db`;

-- --------------------------------------------------------

--
-- Table structure for table `birthplaces`
--

CREATE TABLE `birthplaces` (
  `namePlace` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookID` int(12) NOT NULL,
  `bookAuthor` varchar(21) NOT NULL,
  `bookName` varchar(30) NOT NULL,
  `bookLink` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookID`, `bookAuthor`, `bookName`, `bookLink`) VALUES
(1, 'Феодор Студит', 'Послания', 'https://azbyka.ru/otechnik/Feodor_Studit/poslania/'),
(2, 'Гомер', 'Илиада', 'https://онлайн-читать.рф/%D0%B3%D0%BE%D0%BC%D0%B5%D1%80-%D0%B8%D0%BB%D0%B8%D0%B0%D0%B4%D0%B0/'),
(3, 'Гомер', 'Одиссея', 'https://онлайн-читать.рф/%D0%B3%D0%BE%D0%BC%D0%B5%D1%80-%D0%BE%D0%B4%D0%B8%D1%81%D1%81%D0%B5%D1%8F/');

-- --------------------------------------------------------

--
-- Table structure for table `characterjobs`
--

CREATE TABLE `characterjobs` (
  `characterJob` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `characternames`
--

CREATE TABLE `characternames` (
  `maleNames` varchar(20) NOT NULL,
  `femaleNames` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characternames`
--

INSERT INTO `characternames` (`maleNames`, `femaleNames`) VALUES
('Агафон', 'Агата'),
('Александр', 'Алла'),
('Алексий', 'Анастасия'),
('Анатолий', 'Ангелина'),
('Андрий', 'Анисья'),
('Андроник', 'Анна'),
('Анисим', 'Анфиса'),
('Антип', 'Варвара'),
('Аркадий', 'Васса'),
('Артёмий', 'Вероника'),
('Архип', 'Галина'),
('Афанасий', 'Глафира');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `userId` bigint(20) UNSIGNED NOT NULL,
  `characterName` varchar(50) NOT NULL,
  `characterLastName` varchar(50) DEFAULT NULL,
  `characterAge` int(11) NOT NULL DEFAULT '7',
  `characterSex` enum('male','female') NOT NULL,
  `characterEstate` enum('clergy','nobility','peasantry','merchantry') NOT NULL,
  `characterHealth` enum('Y','N') NOT NULL,
  `characterJob` varchar(50) NOT NULL,
  `characterMoney` double UNSIGNED DEFAULT NULL,
  `characterBirthPlace` varchar(50) DEFAULT NULL,
  `characterAvatar` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`userId`, `characterName`, `characterLastName`, `characterAge`, `characterSex`, `characterEstate`, `characterHealth`, `characterJob`, `characterMoney`, `characterBirthPlace`, `characterAvatar`) VALUES
(1, 'Афанасий', 'Писарь', 22, 'male', 'clergy', 'N', '', 12, 'Константинополь', 'monk'),
(2, 'Анна', 'Комнина', 7, 'female', 'nobility', 'Y', 'Императорский дворец', 3000, 'Константинополь', 'queen');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(10) UNSIGNED NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userAge` int(3) UNSIGNED DEFAULT NULL,
  `userSex` enum('male','female') NOT NULL,
  `daysInGame` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `registrationDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `nickname`, `email`, `password`, `userAge`, `userSex`, `daysInGame`, `registrationDate`) VALUES
(2, 'Maria', 'maria@gmai.com', 'qwe321', 20, 'female', 1, '2020-04-08 08:21:07'),
(3, 'Player', 'player@gmail.com', '45tre', 25, 'male', 0, '2020-04-10 17:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `wp_cackle_channel`
--

CREATE TABLE `wp_cackle_channel` (
  `id` bigint(20) NOT NULL,
  `time` bigint(11) NOT NULL,
  `modified` varchar(25) DEFAULT NULL,
  `last_comment` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Автор комментария', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-02-27 16:03:30', '2020-02-27 13:03:30', 'Привет! Это комментарий.\nЧтобы начать модерировать, редактировать и удалять комментарии, перейдите на экран «Комментарии» в консоли.\nАватары авторов комментариев загружаются с сервиса <a href=\"https://ru.gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost', 'yes'),
(2, 'home', 'http://localhost', 'yes'),
(3, 'blogname', 'Ῥωμανία', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'truespirit7777@gmail.com', 'yes'),
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
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:22:\"cyr3lat/cyr-to-lat.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:64:\"C:\\laragon\\www/wp-content/themes/desk-mess-mirrored/comments.php\";i:1;s:62:\"C:\\laragon\\www/wp-content/themes/desk-mess-mirrored/footer.php\";i:2;s:61:\"C:\\laragon\\www/wp-content/themes/desk-mess-mirrored/style.css\";i:3;s:48:\"C:\\laragon\\www/wp-content/themes/multi/style.css\";i:4;s:53:\"C:\\laragon\\www/wp-content/themes/papyrus-10/style.css\";}', 'no'),
(40, 'template', 'desk-mess-mirrored', 'yes'),
(41, 'stylesheet', 'multi', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '47018', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
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
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:3:{i:2;a:4:{s:5:\"title\";s:13:\"О сайте\";s:4:\"text\";s:205:\"Здесь может быть отличное место для того, чтобы представить себя, свой сайт или выразить какие-то благодарности.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:21:\"Найдите нас\";s:4:\"text\";s:226:\"<strong>Адрес</strong>\n123 Мейн стрит\nНью Йорк, NY 10001\n\n<strong>Часы</strong>\nПонедельник&mdash;пятница: 9:00&ndash;17:00\nСуббота и воскресенье: 11:00&ndash;15:00\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:40:\"uptolike-share/uptolike_share_widget.php\";s:22:\"uptolike_delete_plugin\";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '144', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'admin_email_lifespan', '1598360609', 'yes'),
(94, 'initial_db_version', '45805', 'yes'),
(95, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(96, 'fresh_site', '0', 'yes'),
(97, 'WPLANG', 'ru_RU', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:6:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:9:\"sidebar-1\";a:7:{i:0;s:13:\"custom_html-2\";i:1;s:8:\"search-2\";i:2;s:14:\"recent-posts-2\";i:3;s:17:\"recent-comments-2\";i:4;s:10:\"archives-2\";i:5;s:12:\"categories-2\";i:6;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:11:\"menu_header\";a:1:{i:0;s:10:\"nav_menu-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(104, 'cron', 'a:9:{i:1599926620;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1599959020;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1599959451;a:1:{s:19:\"wpseo-reindex-links\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1599981645;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1600002218;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600002230;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600002233;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600391443;a:1:{s:16:\"wpseo_ryte_fetch\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_nav_menu', 'a:2:{i:2;a:1:{s:8:\"nav_menu\";i:2;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_custom_html', 'a:2:{i:2;a:2:{s:5:\"title\";s:39:\"Просьба библиотекарю\";s:7:\"content\";s:124:\"<div class = \"text-sidebar\">Добрый библиотекарь, пожалуйста, поищи для меня:\r\n</div>\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'recovery_keys', 'a:0:{}', 'yes'),
(148, 'theme_mods_twentytwenty', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1587731386;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}s:18:\"nav_menu_locations\";a:0:{}}', 'yes'),
(156, 'theme_mods_medieval', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(160, 'theme_mods_history-channel-11', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(163, 'theme_mods_papyrus-10', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(164, 'current_theme', 'Romania-RP', 'yes'),
(165, 'theme_switched', '', 'yes'),
(166, 'theme_switched_via_customizer', '', 'yes'),
(167, 'customize_stashed_theme_mods', 'a:0:{}', 'no'),
(170, 'theme_mods_parchment-draft', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(173, 'theme_mods_retro-book-10', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(223, 'theme_mods_library', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1587785467;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(243, 'recovery_mode_email_last_sent', '1592855838', 'yes'),
(250, 'theme_mods_desk-mess-mirrored', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1587785513;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(254, 'theme_mods_multi', 'a:11:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:8:\"top-menu\";i:2;}s:18:\"custom_css_post_id\";i:-1;s:16:\"background_image\";s:59:\"http://localhost/wp-content/uploads/2020/06/marble-bg-1.png\";s:17:\"background_preset\";s:6:\"custom\";s:15:\"background_size\";s:4:\"auto\";s:17:\"background_repeat\";s:6:\"repeat\";s:21:\"background_attachment\";s:6:\"scroll\";s:21:\"background_position_x\";s:6:\"center\";s:21:\"background_position_y\";s:6:\"center\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1592624179;s:4:\"data\";a:5:{s:11:\"menu_header\";a:1:{i:0;s:10:\"nav_menu-2\";}s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:9:\"sidebar-1\";a:7:{i:0;s:13:\"custom_html-2\";i:1;s:8:\"search-2\";i:2;s:14:\"recent-posts-2\";i:3;s:17:\"recent-comments-2\";i:4;s:10:\"archives-2\";i:5;s:12:\"categories-2\";i:6;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(264, 'recently_activated', 'a:8:{s:43:\"portfolio-post-type/portfolio-post-type.php\";i:1592625295;s:24:\"wordpress-seo/wp-seo.php\";i:1592624255;s:19:\"akismet/akismet.php\";i:1592622439;s:33:\"worth-the-read/worth-the-read.php\";i:1592529031;s:17:\"cackle/cackle.php\";i:1592501143;s:40:\"uptolike-share/uptolike_share_widget.php\";i:1592461925;s:33:\"theme-my-login/theme-my-login.php\";i:1592373285;s:25:\"loginpress/loginpress.php\";i:1592372425;}', 'yes'),
(274, 'db_upgraded', '', 'yes'),
(276, 'can_compress_scripts', '1', 'no'),
(292, '_transient_health-check-site-status-result', '{\"good\":6,\"recommended\":8,\"critical\":2}', 'yes'),
(315, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(356, 'new_admin_email', 'truespirit7777@gmail.com', 'yes'),
(368, 'widget_theme-my-login', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(369, '_tml_installed_at', '1591598142', 'no'),
(370, '_tml_updated_at', '1591598142', 'no'),
(371, '_tml_version', '7.1', 'no'),
(399, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:24:\"truespirit7777@gmail.com\";s:7:\"version\";s:5:\"5.4.2\";s:9:\"timestamp\";i:1592193127;}', 'no'),
(420, 'tml_login_type', 'default', 'yes'),
(421, 'tml_registration_type', 'default', 'yes'),
(422, 'tml_user_passwords', '1', 'yes'),
(423, 'tml_auto_login', '1', 'yes'),
(424, 'tml_dashboard_slug', 'dashboard', 'yes'),
(425, 'tml_login_slug', 'login', 'yes'),
(426, 'tml_logout_slug', 'logout', 'yes'),
(427, 'tml_register_slug', 'register', 'yes'),
(428, 'tml_lostpassword_slug', 'lostpassword', 'yes'),
(429, 'tml_resetpass_slug', 'resetpass', 'yes'),
(564, 'loginpress_customization', 'a:0:{}', 'yes'),
(565, 'loginpress_setting', 'a:0:{}', 'yes'),
(566, 'loginpress_active_time', '1592372339', 'no'),
(567, 'loginpress_login_redirects', '', 'yes'),
(568, 'loginpress_social_logins', '', 'yes'),
(569, 'loginpress_limit_login_attempts', '', 'yes'),
(570, 'loginpress_autologin', '', 'yes'),
(571, 'loginpress_hidelogin', '', 'yes'),
(572, 'loginpress_premium', '', 'yes'),
(573, 'rdn_fetch_12516765', 'fetch', 'yes'),
(574, '_loginpress_optin', 'no', 'yes'),
(586, 'widget_akismet_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(655, 'uptolike_options', 'a:13:{s:9:\"id_number\";s:0:\"\";s:11:\"widget_code\";s:1090:\"<script type=\"text/javascript\">(function (w, doc) {\r\n    if (!w.__utlWdgt) {\r\n        w.__utlWdgt = true;\r\n        var d = doc, s = d.createElement(\'script\'), g = \'getElementsByTagName\';\r\n        s.type = \'text/javascript\';\r\n        s.charset = \'UTF-8\';\r\n        s.async = true;\r\n        s.src = (\'https:\' == w.location.protocol ? \'https\' : \'http\') + \'://w.uptolike.com/widgets/v1/uptolike.js\';\r\n        var h = d[g](\'body\')[0];\r\n        h.appendChild(s);\r\n    }\r\n})(window, document);\r\n</script>\r\n<div data-url data-background-alpha=\"0.0\" data-orientation=\"horizontal\" data-text-color=\"000000\" data-share-shape=\"round-rectangle\" data-buttons-color=\"ff9300\" data-sn-ids=\"fb.tw.ok.vk.gp.mr.\" data-counter-background-color=\"ffffff\" data-share-counter-size=\"11\" data-share-size=\"30\" data-background-color=\"ededed\" data-share-counter-type=\"common\" data-pid=\"cmslocalhost\" data-counter-background-alpha=\"1.0\" data-share-style=\"1\" data-mode=\"share\" data-following-enable=\"false\" data-like-text-enable=\"false\" data-selection-enable=\"true\" data-icon-color=\"ffffff\" class=\"uptolike-buttons\">\r\n</div>\";s:14:\"uptolike_email\";s:0:\"\";s:7:\"on_main\";i:1;s:7:\"on_page\";i:1;s:7:\"on_post\";i:1;s:16:\"on_special_pages\";i:1;s:10:\"on_archive\";i:1;s:15:\"widget_position\";s:6:\"bottom\";s:11:\"widget_mode\";s:3:\"plg\";s:12:\"widget_align\";s:6:\"center\";s:12:\"utl_language\";s:2:\"ru\";s:13:\"uptolike_json\";s:0:\"\";}', 'yes'),
(656, 'widget_uptolike_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(659, 'cackle_plugin_version', '4.28', 'yes'),
(690, 'redux_version_upgraded_from', '3.6.15', 'yes'),
(691, 'wtr_settings', 'a:32:{s:8:\"last_tab\";s:1:\"1\";s:16:\"progress-display\";a:1:{i:0;s:4:\"post\";}s:20:\"progress-cpts-manual\";s:0:\"\";s:17:\"progress-comments\";s:0:\"\";s:18:\"progress-placement\";s:4:\"left\";s:15:\"progress-offset\";s:1:\"0\";s:12:\"progress-rtl\";s:0:\"\";s:22:\"progress-fixed-opacity\";s:1:\"0\";s:18:\"progress-non-touch\";s:1:\"1\";s:14:\"progress-touch\";s:0:\"\";s:24:\"progress-placement-touch\";s:3:\"top\";s:21:\"progress-offset-touch\";s:1:\"0\";s:14:\"content-offset\";s:1:\"0\";s:18:\"progress-thickness\";s:1:\"5\";s:19:\"progress-foreground\";s:7:\"#f44813\";s:27:\"progress-foreground-opacity\";s:3:\"0.5\";s:19:\"progress-background\";s:7:\"#FFFFFF\";s:28:\"progress-comments-background\";s:7:\"#ffcece\";s:31:\"progress-transparent-background\";s:0:\"\";s:22:\"progress-muted-opacity\";s:3:\"0.5\";s:25:\"progress-muted-foreground\";s:7:\"#f44813\";s:12:\"time-display\";a:1:{i:0;s:4:\"post\";}s:16:\"time-cpts-manual\";s:0:\"\";s:14:\"time-placement\";s:12:\"before-title\";s:8:\"time-wpm\";s:3:\"200\";s:8:\"time-ppm\";s:1:\"5\";s:11:\"time-format\";s:10:\"# min read\";s:20:\"time-format-singular\";s:0:\"\";s:11:\"time-method\";s:10:\"word-count\";s:16:\"time-block-level\";s:0:\"\";s:15:\"time-typography\";a:10:{s:11:\"font-family\";s:0:\"\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:0:\"\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:10:\"text-align\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"16px\";s:5:\"color\";s:7:\"#CCCCCC\";}s:8:\"time-css\";s:131:\".wtr-time-wrap{ \r\n	/* wraps the entire label */\r\n	margin: 0 10px;\r\n\r\n}\r\n.wtr-time-number{ \r\n	/* applies only to the number */\r\n	\r\n}\";}', 'yes'),
(692, 'wtr_settings-transients', 'a:2:{s:14:\"changed_values\";a:1:{s:22:\"progress-fixed-opacity\";s:1:\"1\";}s:9:\"last_save\";i:1592528971;}', 'yes'),
(707, 'wpseo', 'a:26:{s:15:\"ms_defaults_set\";b:0;s:40:\"ignore_search_engines_discouraged_notice\";b:0;s:25:\"ignore_indexation_warning\";b:0;s:29:\"indexation_warning_hide_until\";b:0;s:18:\"indexation_started\";b:0;s:7:\"version\";s:4:\"14.3\";s:16:\"previous_version\";s:0:\"\";s:20:\"disableadvanced_meta\";b:1;s:30:\"enable_headless_rest_endpoints\";b:1;s:17:\"ryte_indexability\";b:1;s:11:\"baiduverify\";s:0:\"\";s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:9:\"site_type\";s:0:\"\";s:20:\"has_multiple_authors\";s:0:\"\";s:16:\"environment_type\";s:0:\"\";s:23:\"content_analysis_active\";b:1;s:23:\"keyword_analysis_active\";b:1;s:21:\"enable_admin_bar_menu\";b:1;s:26:\"enable_cornerstone_content\";b:1;s:18:\"enable_xml_sitemap\";b:1;s:24:\"enable_text_link_counter\";b:1;s:22:\"show_onboarding_notice\";b:1;s:18:\"first_activated_on\";i:1592529043;s:13:\"myyoast-oauth\";b:0;}', 'yes'),
(708, 'wpseo_titles', 'a:70:{s:17:\"forcerewritetitle\";b:0;s:9:\"separator\";s:7:\"sc-dash\";s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:45:\"%%name%%, Автор в %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:64:\"Вы искали %%searchphrase%% %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:57:\"Страница не найдена %%sep%% %%sitename%%\";s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:84:\"Сообщение %%POSTLINK%% появились сначала на %%BLOGLINK%%.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:0;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:1;s:23:\"is-media-purge-relevant\";b:0;s:20:\"breadcrumbs-404crumb\";s:54:\"Ошибка 404: страница не найдена\";s:29:\"breadcrumbs-display-blog-page\";b:1;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:19:\"Архивы для\";s:18:\"breadcrumbs-enable\";b:0;s:16:\"breadcrumbs-home\";s:31:\"Главная страница\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:17:\"Вы искали\";s:15:\"breadcrumbs-sep\";s:7:\"&raquo;\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:11:\"person_logo\";s:0:\"\";s:14:\"person_logo_id\";i:0;s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:15:\"company_logo_id\";i:0;s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:7:\"company\";s:25:\"company_or_person_user_id\";b:0;s:17:\"stripcategorybase\";b:0;s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:13:\"showdate-post\";b:0;s:23:\"display-metabox-pt-post\";b:1;s:23:\"post_types-post-maintax\";i:0;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:13:\"showdate-page\";b:0;s:23:\"display-metabox-pt-page\";b:1;s:23:\"post_types-page-maintax\";i:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:19:\"showdate-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:1;s:29:\"post_types-attachment-maintax\";i:0;s:18:\"title-tax-category\";s:57:\"Архивы %%term_title%% %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:0;s:18:\"title-tax-post_tag\";s:57:\"Архивы %%term_title%% %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:0;s:21:\"title-tax-post_format\";s:57:\"Архивы %%term_title%% %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:1;s:23:\"noindex-tax-post_format\";b:1;}', 'yes'),
(709, 'wpseo_social', 'a:19:{s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:19:\"og_default_image_id\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:21:\"og_frontpage_image_id\";s:0:\"\";s:9:\"opengraph\";b:1;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:0:\"\";s:13:\"wikipedia_url\";s:0:\"\";s:10:\"fbadminapp\";s:0:\"\";}', 'yes'),
(710, 'wpseo_flush_rewrite', '1', 'yes'),
(711, 'yoast_migrations_free', 'a:1:{s:7:\"version\";s:4:\"14.3\";}', 'yes'),
(712, '_transient_timeout_wpseo_link_table_inaccessible', '1624065051', 'no'),
(713, '_transient_wpseo_link_table_inaccessible', '0', 'no'),
(714, '_transient_timeout_wpseo_meta_table_inaccessible', '1624065051', 'no'),
(715, '_transient_wpseo_meta_table_inaccessible', '0', 'no'),
(717, 'wpseo_ryte', 'a:2:{s:6:\"status\";i:-1;s:10:\"last_fetch\";i:1592529063;}', 'yes'),
(718, 'rewrite_rules', 'a:124:{s:19:\"sitemap_index\\.xml$\";s:19:\"index.php?sitemap=1\";s:31:\"([^/]+?)-sitemap([0-9]+)?\\.xml$\";s:51:\"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]\";s:24:\"([a-z]+)?-?sitemap\\.xsl$\";s:39:\"index.php?yoast-sitemap-xsl=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:12:\"portfolio/?$\";s:29:\"index.php?post_type=portfolio\";s:42:\"portfolio/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?post_type=portfolio&feed=$matches[1]\";s:37:\"portfolio/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?post_type=portfolio&feed=$matches[1]\";s:29:\"portfolio/page/([0-9]{1,})/?$\";s:47:\"index.php?post_type=portfolio&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:37:\"portfolio/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"portfolio/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"portfolio/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"portfolio/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"portfolio/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"portfolio/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"portfolio/([^/]+)/embed/?$\";s:42:\"index.php?portfolio=$matches[1]&embed=true\";s:30:\"portfolio/([^/]+)/trackback/?$\";s:36:\"index.php?portfolio=$matches[1]&tb=1\";s:50:\"portfolio/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?portfolio=$matches[1]&feed=$matches[2]\";s:45:\"portfolio/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?portfolio=$matches[1]&feed=$matches[2]\";s:38:\"portfolio/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?portfolio=$matches[1]&paged=$matches[2]\";s:45:\"portfolio/([^/]+)/comment-page-([0-9]{1,})/?$\";s:49:\"index.php?portfolio=$matches[1]&cpage=$matches[2]\";s:34:\"portfolio/([^/]+)(?:/([0-9]+))?/?$\";s:48:\"index.php?portfolio=$matches[1]&page=$matches[2]\";s:26:\"portfolio/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:36:\"portfolio/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:56:\"portfolio/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"portfolio/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"portfolio/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:32:\"portfolio/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:59:\"portfolio_category/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?portfolio_category=$matches[1]&feed=$matches[2]\";s:54:\"portfolio_category/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?portfolio_category=$matches[1]&feed=$matches[2]\";s:35:\"portfolio_category/([^/]+)/embed/?$\";s:51:\"index.php?portfolio_category=$matches[1]&embed=true\";s:47:\"portfolio_category/([^/]+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?portfolio_category=$matches[1]&paged=$matches[2]\";s:29:\"portfolio_category/([^/]+)/?$\";s:40:\"index.php?portfolio_category=$matches[1]\";s:54:\"portfolio_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?portfolio_tag=$matches[1]&feed=$matches[2]\";s:49:\"portfolio_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?portfolio_tag=$matches[1]&feed=$matches[2]\";s:30:\"portfolio_tag/([^/]+)/embed/?$\";s:46:\"index.php?portfolio_tag=$matches[1]&embed=true\";s:42:\"portfolio_tag/([^/]+)/page/?([0-9]{1,})/?$\";s:53:\"index.php?portfolio_tag=$matches[1]&paged=$matches[2]\";s:24:\"portfolio_tag/([^/]+)/?$\";s:35:\"index.php?portfolio_tag=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(774, 'theme_mods_twentyseventeen', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:3:\"top\";i:2;}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1592624211;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:3:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";i:2;s:10:\"nav_menu-2\";}s:9:\"sidebar-1\";a:7:{i:0;s:13:\"custom_html-2\";i:1;s:8:\"search-2\";i:2;s:14:\"recent-posts-2\";i:3;s:17:\"recent-comments-2\";i:4;s:10:\"archives-2\";i:5;s:12:\"categories-2\";i:6;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(832, 'category_children', 'a:0:{}', 'yes'),
(841, '_site_transient_timeout_theme_roots', '1599924567', 'no'),
(842, '_site_transient_theme_roots', 'a:3:{s:18:\"desk-mess-mirrored\";s:7:\"/themes\";s:5:\"multi\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";}', 'no'),
(845, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.5.1.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.5.1.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1599922770;s:15:\"version_checked\";s:5:\"5.4.2\";s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:4:\"core\";s:4:\"slug\";s:7:\"default\";s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-08-19 16:39:45\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/ru_RU.zip\";s:10:\"autoupdate\";b:1;}}}', 'no'),
(846, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1599922771;s:7:\"checked\";a:3:{s:18:\"desk-mess-mirrored\";s:5:\"100.2\";s:5:\"multi\";s:5:\"102.2\";s:15:\"twentyseventeen\";s:3:\"2.3\";}s:8:\"response\";a:1:{s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}', 'no'),
(847, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1599922772;s:7:\"checked\";a:5:{s:19:\"akismet/akismet.php\";s:5:\"4.1.6\";s:22:\"cyr3lat/cyr-to-lat.php\";s:3:\"3.5\";s:43:\"portfolio-post-type/portfolio-post-type.php\";s:5:\"1.0.0\";s:33:\"worth-the-read/worth-the-read.php\";s:3:\"1.6\";s:24:\"wordpress-seo/wp-seo.php\";s:4:\"14.3\";}s:8:\"response\";a:3:{s:43:\"portfolio-post-type/portfolio-post-type.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:33:\"w.org/plugins/portfolio-post-type\";s:4:\"slug\";s:19:\"portfolio-post-type\";s:6:\"plugin\";s:43:\"portfolio-post-type/portfolio-post-type.php\";s:11:\"new_version\";s:5:\"1.0.1\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/portfolio-post-type/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/portfolio-post-type.1.0.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/portfolio-post-type/assets/icon-256x256.png?rev=974090\";s:2:\"1x\";s:71:\"https://ps.w.org/portfolio-post-type/assets/icon-256x256.png?rev=974090\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:73:\"https://ps.w.org/portfolio-post-type/assets/banner-772x250.jpg?rev=497144\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.1\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:33:\"worth-the-read/worth-the-read.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/worth-the-read\";s:4:\"slug\";s:14:\"worth-the-read\";s:6:\"plugin\";s:33:\"worth-the-read/worth-the-read.php\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/worth-the-read/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/worth-the-read.1.7.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/worth-the-read/assets/icon-128x128.png?rev=1482821\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/worth-the-read/assets/banner-772x250.png?rev=1466470\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.1\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:4:\"14.9\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/wordpress-seo.14.9.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.png?rev=2363699\";s:2:\"1x\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=2363699\";s:3:\"svg\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=2363699\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=1843435\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=1843435\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=1843435\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=1843435\";}s:6:\"tested\";s:5:\"5.5.1\";s:12:\"requires_php\";s:6:\"5.6.20\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:2:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:19:\"portfolio-post-type\";s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"updated\";s:19:\"2017-07-12 15:43:56\";s:7:\"package\";s:86:\"https://downloads.wordpress.org/translation/plugin/portfolio-post-type/1.0.0/ru_RU.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:13:\"wordpress-seo\";s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:4:\"14.3\";s:7:\"updated\";s:19:\"2020-06-19 09:34:07\";s:7:\"package\";s:79:\"https://downloads.wordpress.org/translation/plugin/wordpress-seo/14.3/ru_RU.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.6\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:22:\"cyr3lat/cyr-to-lat.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/cyr3lat\";s:4:\"slug\";s:7:\"cyr3lat\";s:6:\"plugin\";s:22:\"cyr3lat/cyr-to-lat.php\";s:11:\"new_version\";s:3:\"3.5\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/cyr3lat/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/cyr3lat.3.5.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:51:\"https://s.w.org/plugins/geopattern-icon/cyr3lat.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(848, '_site_transient_timeout_php_check_73ecd64509db505b6046b20394d377da', '1600527573', 'no'),
(849, '_site_transient_php_check_73ecd64509db505b6046b20394d377da', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(77, 2, '_edit_lock', '1587735616:1'),
(82, 41, '_wp_attached_file', '2020/04/body_bg.jpg'),
(83, 41, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:383;s:6:\"height\";i:383;s:4:\"file\";s:19:\"2020/04/body_bg.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"body_bg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"body_bg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(84, 41, '_wp_attachment_image_alt', 'Стол'),
(85, 41, '_wp_attachment_is_custom_background', 'multi'),
(88, 1, '_edit_lock', '1592417120:1'),
(90, 1, '_edit_last', '1'),
(92, 1, '_wp_old_slug', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80'),
(111, 54, '_menu_item_type', 'custom'),
(112, 54, '_menu_item_menu_item_parent', '0'),
(113, 54, '_menu_item_object_id', '54'),
(114, 54, '_menu_item_object', 'custom'),
(115, 54, '_menu_item_target', ''),
(116, 54, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(117, 54, '_menu_item_xfn', ''),
(118, 54, '_menu_item_url', 'http://localhost/'),
(119, 54, '_menu_item_orphaned', '1591116532'),
(120, 55, '_menu_item_type', 'post_type'),
(121, 55, '_menu_item_menu_item_parent', '0'),
(122, 55, '_menu_item_object_id', '2'),
(123, 55, '_menu_item_object', 'page'),
(124, 55, '_menu_item_target', ''),
(125, 55, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(126, 55, '_menu_item_xfn', ''),
(127, 55, '_menu_item_url', ''),
(128, 55, '_menu_item_orphaned', '1591116532'),
(134, 58, '_menu_item_type', 'custom'),
(135, 58, '_menu_item_menu_item_parent', '0'),
(136, 58, '_menu_item_object_id', '58'),
(137, 58, '_menu_item_object', 'custom'),
(138, 58, '_menu_item_target', ''),
(139, 58, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(140, 58, '_menu_item_xfn', ''),
(141, 58, '_menu_item_url', 'http://localhost/'),
(142, 58, '_menu_item_orphaned', '1591118815'),
(143, 59, '_menu_item_type', 'post_type'),
(144, 59, '_menu_item_menu_item_parent', '0'),
(145, 59, '_menu_item_object_id', '2'),
(146, 59, '_menu_item_object', 'page'),
(147, 59, '_menu_item_target', ''),
(148, 59, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(149, 59, '_menu_item_xfn', ''),
(150, 59, '_menu_item_url', ''),
(151, 59, '_menu_item_orphaned', '1591118815'),
(170, 62, '_menu_item_type', 'custom'),
(171, 62, '_menu_item_menu_item_parent', '0'),
(172, 62, '_menu_item_object_id', '62'),
(173, 62, '_menu_item_object', 'custom'),
(174, 62, '_menu_item_target', ''),
(175, 62, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(176, 62, '_menu_item_xfn', ''),
(177, 62, '_menu_item_url', 'http://localhost/'),
(189, 66, '_edit_lock', '1591801787:1'),
(251, 86, '_wp_attached_file', '2020/06/marble-bg-1.png'),
(252, 86, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:23:\"2020/06/marble-bg-1.png\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"marble-bg-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"marble-bg-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(253, 86, '_wp_attachment_is_custom_background', 'multi'),
(273, 94, '_edit_lock', '1592493913:1'),
(276, 66, '_edit_last', '1'),
(281, 103, '_edit_lock', '1592198446:1'),
(282, 103, '_edit_last', '1'),
(283, 105, '_menu_item_type', 'post_type'),
(284, 105, '_menu_item_menu_item_parent', '0'),
(285, 105, '_menu_item_object_id', '103'),
(286, 105, '_menu_item_object', 'page'),
(287, 105, '_menu_item_target', ''),
(288, 105, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(289, 105, '_menu_item_xfn', ''),
(290, 105, '_menu_item_url', ''),
(291, 106, '_menu_item_type', 'custom'),
(292, 106, '_menu_item_menu_item_parent', '0'),
(293, 106, '_menu_item_object_id', '106'),
(294, 106, '_menu_item_object', 'custom'),
(295, 106, '_menu_item_target', ''),
(296, 106, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(297, 106, '_menu_item_xfn', ''),
(298, 106, '_menu_item_url', '/forum'),
(309, 121, '_edit_lock', '1592538291:1'),
(318, 132, '_menu_item_type', 'taxonomy'),
(319, 132, '_menu_item_menu_item_parent', '0'),
(320, 132, '_menu_item_object_id', '4'),
(321, 132, '_menu_item_object', 'category'),
(322, 132, '_menu_item_target', ''),
(323, 132, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(324, 132, '_menu_item_xfn', ''),
(325, 132, '_menu_item_url', ''),
(338, 136, '_wp_attached_file', '2020/06/cropped-favikon.png'),
(339, 136, '_wp_attachment_context', 'site-icon'),
(340, 136, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:27:\"2020/06/cropped-favikon.png\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"cropped-favikon-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"cropped-favikon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:27:\"cropped-favikon-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:27:\"cropped-favikon-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:27:\"cropped-favikon-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:25:\"cropped-favikon-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(342, 138, '_wp_attached_file', '2020/06/cropped-favikon-1.png'),
(343, 138, '_wp_attachment_context', 'site-icon'),
(344, 138, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:29:\"2020/06/cropped-favikon-1.png\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:29:\"cropped-favikon-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:29:\"cropped-favikon-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:29:\"cropped-favikon-1-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:29:\"cropped-favikon-1-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:29:\"cropped-favikon-1-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:27:\"cropped-favikon-1-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(350, 141, '_wp_attached_file', '2020/06/favicon.png'),
(351, 141, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:716;s:6:\"height\";i:639;s:4:\"file\";s:19:\"2020/06/favicon.png\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"favicon-300x268.png\";s:5:\"width\";i:300;s:6:\"height\";i:268;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"favicon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(352, 142, '_wp_attached_file', '2020/06/cropped-favicon.png'),
(353, 142, '_wp_attachment_context', 'site-icon'),
(354, 142, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:27:\"2020/06/cropped-favicon.png\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:25:\"cropped-favicon-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(357, 141, '_wp_attachment_image_alt', 'Герб Романии'),
(358, 144, '_wp_attached_file', '2020/06/cropped-favicon-1.png'),
(359, 144, '_wp_attachment_context', 'site-icon'),
(360, 144, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:29:\"2020/06/cropped-favicon-1.png\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:29:\"cropped-favicon-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:29:\"cropped-favicon-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:29:\"cropped-favicon-1-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:29:\"cropped-favicon-1-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:29:\"cropped-favicon-1-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-1-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(364, 121, 'wtr-disable-reading-progress', ''),
(365, 121, 'wtr-disable-time-commitment', ''),
(366, 121, '_edit_last', '1'),
(368, 121, 'wtr-custom-time-label', ''),
(371, 149, '_menu_item_type', 'custom'),
(372, 149, '_menu_item_menu_item_parent', '0'),
(373, 149, '_menu_item_object_id', '149'),
(374, 149, '_menu_item_object', 'custom'),
(375, 149, '_menu_item_target', ''),
(376, 149, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(377, 149, '_menu_item_xfn', ''),
(378, 149, '_menu_item_url', '/books'),
(380, 150, '_menu_item_type', 'custom'),
(381, 150, '_menu_item_menu_item_parent', '149'),
(382, 150, '_menu_item_object_id', '150'),
(383, 150, '_menu_item_object', 'custom'),
(384, 150, '_menu_item_target', ''),
(385, 150, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(386, 150, '_menu_item_xfn', ''),
(387, 150, '_menu_item_url', '/readnow'),
(389, 151, '_menu_item_type', 'custom'),
(390, 151, '_menu_item_menu_item_parent', '149'),
(391, 151, '_menu_item_object_id', '151'),
(392, 151, '_menu_item_object', 'custom'),
(393, 151, '_menu_item_target', ''),
(394, 151, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(395, 151, '_menu_item_xfn', ''),
(396, 151, '_menu_item_url', '/books'),
(397, 152, '_menu_item_type', 'custom'),
(398, 152, '_menu_item_menu_item_parent', '0'),
(399, 152, '_menu_item_object_id', '152'),
(400, 152, '_menu_item_object', 'custom'),
(401, 152, '_menu_item_target', ''),
(402, 152, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(403, 152, '_menu_item_xfn', ''),
(404, 152, '_menu_item_url', '/hotel'),
(405, 153, '_edit_lock', '1592639517:1'),
(406, 153, '_edit_last', '1'),
(421, 160, '_edit_lock', '1592855734:1'),
(422, 160, '_wp_page_template', 'form-template.php');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-02-27 16:03:30', '2020-02-27 13:03:30', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите ее, затем начинайте создавать!</p>\n<!-- /wp:paragraph -->', 'Привет, мир!', '', 'publish', 'open', 'open', '', 'privet-mir', '', '', '2020-06-17 19:30:01', '2020-06-17 16:30:01', '', 0, 'http://localhost/?p=1', 0, 'post', '', 1),
(2, 1, '2020-02-27 16:03:30', '2020-02-27 13:03:30', '<!-- wp:paragraph -->\n<p>Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице &laquo;Детали&raquo; владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Привет! Днём я курьер, а вечером &#8212; подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...или так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Компания &laquo;Штучки XYZ&raquo; была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href=\"http://localhost/wp-admin/\">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Пример страницы', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-02-27 16:03:30', '2020-02-27 13:03:30', '', 0, 'http://localhost/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-02-27 16:03:30', '2020-02-27 13:03:30', '<!-- wp:heading --><h2>Кто мы</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Наш адрес сайта: http://localhost.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие персональные данные мы собираем и с какой целью</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Комментарии</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если посетитель оставляет комментарий на сайте, мы собираем данные указанные в форме комментария, а также IP адрес посетителя и данные user-agent браузера с целью определения спама.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Анонимизированная строка создаваемая из вашего адреса email (\"хеш\") может предоставляться сервису Gravatar, чтобы определить используете ли вы его. Политика конфиденциальности Gravatar доступна здесь: https://automattic.com/privacy/ . После одобрения комментария ваше изображение профиля будет видимым публично в контексте вашего комментария.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Медиафайлы</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы зарегистрированный пользователь и загружаете фотографии на сайт, вам возможно следует избегать загрузки изображений с метаданными EXIF, так как они могут содержать данные вашего месторасположения по GPS. Посетители могут извлечь эту информацию скачав изображения с сайта.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Формы контактов</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Куки</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий на нашем сайте, вы можете включить сохранение вашего имени, адреса email и вебсайта в куки. Это делается для вашего удобства, чтобы не заполнять данные снова при повторном комментировании. Эти куки хранятся в течение одного года.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Если у вас есть учетная запись на сайте и вы войдете в неё, мы установим временный куки для определения поддержки куки вашим браузером, куки не содержит никакой личной информации и удаляется при закрытии вашего браузера.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При входе в учетную запись мы также устанавливаем несколько куки с данными входа и настройками экрана. Куки входа хранятся в течение двух дней, куки с настройками экрана - год. Если вы выберете возможность \"Запомнить меня\", данные о входе будут сохраняться в течение двух недель. При выходе из учетной записи куки входа будут удалены.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При редактировании или публикации статьи в браузере будет сохранен дополнительный куки, он не содержит персональных данных и содержит только ID записи отредактированной вами, истекает через 1 день.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Встраиваемое содержимое других вебсайтов</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Статьи на этом сайте могут включать встраиваемое содержимое (например видео, изображения, статьи и др.), подобное содержимое ведет себя так же, как если бы посетитель зашел на другой сайт.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Эти сайты могут собирать данные о вас, использовать куки, внедрять дополнительное отслеживание третьей стороной и следить за вашим взаимодействием с внедренным содержимым, включая отслеживание взаимодействия, если у вас есть учетная запись и вы авторизовались на том сайте.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Веб-аналитика</h3><!-- /wp:heading --><!-- wp:heading --><h2>С кем мы делимся вашими данными</h2><!-- /wp:heading --><!-- wp:heading --><h2>Как долго мы храним ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий, то сам комментарий и его метаданные сохраняются неопределенно долго. Это делается для того, чтобы определять и одобрять последующие комментарии автоматически, вместо помещения их в очередь на одобрение.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Для пользователей с регистрацией на нашем сайте мы храним ту личную информацию, которую они указывают в своем профиле. Все пользователи могут видеть, редактировать или удалить свою информацию из профиля в любое время (кроме имени пользователя). Администрация вебсайта также может видеть и изменять эту информацию.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие у вас права на ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>При наличии учетной записи на сайте или если вы оставляли комментарии, то вы можете запросить файл экспорта персональных данных, которые мы сохранили о вас, включая предоставленные вами данные. Вы также можете запросить удаление этих данных, это не включает данные, которые мы обязаны хранить в административных целях, по закону или целях безопасности.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Куда мы отправляем ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Комментарии пользователей могут проверяться автоматическим сервисом определения спама.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Ваша контактная информация</h2><!-- /wp:heading --><!-- wp:heading --><h2>Дополнительная информация</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Как мы защищаем ваши данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие принимаются процедуры против взлома данных</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>От каких третьих сторон мы получаем данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие автоматические решения принимаются на основе данных пользователей</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Требования к раскрытию отраслевых нормативных требований</h3><!-- /wp:heading -->', 'Политика конфиденциальности', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-02-27 16:03:30', '2020-02-27 13:03:30', '', 0, 'http://localhost/?page_id=3', 0, 'page', '', 0),
(41, 1, '2020-04-25 09:15:52', '2020-04-25 06:15:52', '', 'body_bg', '', 'inherit', 'open', 'closed', '', 'body_bg', '', '', '2020-04-25 09:16:42', '2020-04-25 06:16:42', '', 0, 'http://localhost/wp-content/uploads/2020/04/body_bg.jpg', 0, 'attachment', 'image/jpeg', 0),
(44, 1, '2020-04-25 10:44:04', '2020-04-25 07:44:04', '<!-- wp:paragraph -->\n<p>Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите ее, затем начинайте создавать!</p>\n<!-- /wp:paragraph -->', 'Привет, мир!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-04-25 10:44:04', '2020-04-25 07:44:04', '', 1, 'http://localhost/?p=44', 0, 'revision', '', 0),
(54, 1, '2020-06-02 19:48:52', '0000-00-00 00:00:00', '', 'Главная', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-06-02 19:48:52', '0000-00-00 00:00:00', '', 0, 'http://localhost/?p=54', 1, 'nav_menu_item', '', 0),
(55, 1, '2020-06-02 19:48:52', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-06-02 19:48:52', '0000-00-00 00:00:00', '', 0, 'http://localhost/?p=55', 1, 'nav_menu_item', '', 0),
(58, 1, '2020-06-02 20:26:55', '0000-00-00 00:00:00', '', 'Главная', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-06-02 20:26:55', '0000-00-00 00:00:00', '', 0, 'http://localhost/?p=58', 1, 'nav_menu_item', '', 0),
(59, 1, '2020-06-02 20:26:55', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-06-02 20:26:55', '0000-00-00 00:00:00', '', 0, 'http://localhost/?p=59', 1, 'nav_menu_item', '', 0),
(62, 1, '2020-06-02 20:32:03', '2020-06-02 17:32:03', '', 'Вести', '', 'publish', 'closed', 'closed', '', 'glavnaya', '', '', '2020-06-19 18:22:05', '2020-06-19 15:22:05', '', 0, 'http://localhost/?p=62', 1, 'nav_menu_item', '', 0),
(66, 1, '2020-06-02 20:36:49', '2020-06-02 17:36:49', '', 'Книги', '', 'publish', 'closed', 'closed', '', 'books', '', '', '2020-06-10 18:09:47', '2020-06-10 15:09:47', '', 0, 'http://localhost/?page_id=66', 0, 'page', '', 0),
(67, 1, '2020-06-02 20:36:49', '2020-06-02 17:36:49', '', 'Книги', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2020-06-02 20:36:49', '2020-06-02 17:36:49', '', 66, 'http://localhost/?p=67', 0, 'revision', '', 0),
(86, 1, '2020-06-08 09:35:53', '2020-06-08 06:35:53', '', 'marble-bg', '', 'inherit', 'open', 'closed', '', 'marble-bg-2', '', '', '2020-06-08 09:35:53', '2020-06-08 06:35:53', '', 0, 'http://localhost/wp-content/uploads/2020/06/marble-bg-1.png', 0, 'attachment', 'image/png', 0),
(94, 1, '2020-06-10 12:31:14', '2020-06-10 09:31:14', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Сейчас библиотека строится, об открытии будет сообщено.</p>\n<!-- /wp:paragraph -->', 'Библиотека строится.', '', 'publish', 'open', 'open', '', 'biblioteka-stroitsya', '', '', '2020-06-18 18:27:24', '2020-06-18 15:27:24', '', 0, 'http://localhost/?p=94', 0, 'post', '', 0),
(95, 1, '2020-06-10 12:31:14', '2020-06-10 09:31:14', '<!-- wp:paragraph -->\n<p>Сейчас библиоткека строиться, об открытии будет сообщено.</p>\n<!-- /wp:paragraph -->', 'Библиотека строится.', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2020-06-10 12:31:14', '2020-06-10 09:31:14', '', 94, 'http://localhost/?p=95', 0, 'revision', '', 0),
(103, 1, '2020-06-15 08:18:46', '2020-06-15 05:18:46', '', 'Обо мне', '', 'publish', 'closed', 'closed', '', 'about-me', '', '', '2020-06-15 08:23:03', '2020-06-15 05:23:03', '', 0, 'http://localhost/?page_id=103', 0, 'page', '', 0),
(104, 1, '2020-06-15 08:18:46', '2020-06-15 05:18:46', '', 'Обо мне', '', 'inherit', 'closed', 'closed', '', '103-revision-v1', '', '', '2020-06-15 08:18:46', '2020-06-15 05:18:46', '', 103, 'http://localhost/103-revision-v1/', 0, 'revision', '', 0),
(105, 1, '2020-06-15 08:23:29', '2020-06-15 05:23:29', ' ', '', '', 'publish', 'closed', 'closed', '', '105', '', '', '2020-06-19 18:22:05', '2020-06-19 15:22:05', '', 0, 'http://localhost/?p=105', 2, 'nav_menu_item', '', 0),
(106, 1, '2020-06-17 07:08:46', '2020-06-17 04:08:46', '', 'Форум', '', 'publish', 'closed', 'closed', '', 'forum', '', '', '2020-06-19 18:22:05', '2020-06-19 15:22:05', '', 0, 'http://localhost/?p=106', 7, 'nav_menu_item', '', 0),
(107, 1, '2020-06-17 07:39:22', '2020-06-17 04:39:22', '<!-- wp:paragraph -->\n<p>Сейчас библиотека строиться, об открытии будет сообщено.</p>\n<!-- /wp:paragraph -->', 'Библиотека строится.', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2020-06-17 07:39:22', '2020-06-17 04:39:22', '', 94, 'http://localhost/94-revision-v1/', 0, 'revision', '', 0),
(108, 1, '2020-06-17 11:39:24', '2020-06-17 08:39:24', '<!-- wp:paragraph -->\n<p>Сейчас библиотека строится, об открытии будет сообщено.</p>\n<!-- /wp:paragraph -->', 'Библиотека строится.', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2020-06-17 11:39:24', '2020-06-17 08:39:24', '', 94, 'http://localhost/94-revision-v1/', 0, 'revision', '', 0),
(110, 1, '2020-06-17 16:28:41', '2020-06-17 13:28:41', '<!-- wp:paragraph -->\n<p><span class=\"intial\">С</span>ейчас библиотека строится, об открытии будет сообщено.</p>\n<!-- /wp:paragraph -->', 'Библиотека строится.', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2020-06-17 16:28:41', '2020-06-17 13:28:41', '', 94, 'http://localhost/94-revision-v1/', 0, 'revision', '', 0),
(112, 1, '2020-06-17 16:46:16', '2020-06-17 13:46:16', '<!-- wp:html -->\n<p <span class=\"initial\">С</span>ейчас библиотека строится, об открытии будет сообщено.</p>\n<!-- /wp:html -->', 'Библиотека строится.', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2020-06-17 16:46:16', '2020-06-17 13:46:16', '', 94, 'http://localhost/94-revision-v1/', 0, 'revision', '', 0),
(113, 1, '2020-06-17 16:47:56', '2020-06-17 13:47:56', '<!-- wp:paragraph -->\n<p><span class=\"initial\">С</span>ейчас библиотека строится, об открытии будет сообщено.</p>\n<!-- /wp:paragraph -->', 'Библиотека строится.', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2020-06-17 16:47:56', '2020-06-17 13:47:56', '', 94, 'http://localhost/94-revision-v1/', 0, 'revision', '', 0),
(115, 1, '2020-06-17 19:28:39', '2020-06-17 16:28:39', '<!-- wp:paragraph -->\n<p>Сейчас библиотека строится, об открытии будет сообщено.</p>\n<!-- /wp:paragraph -->', 'Библиотека строится.', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2020-06-17 19:28:39', '2020-06-17 16:28:39', '', 94, 'http://localhost/94-revision-v1/', 0, 'revision', '', 0),
(116, 1, '2020-06-17 19:29:23', '2020-06-17 16:29:23', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите ее, затем начинайте создавать!</p>\n<!-- /wp:paragraph -->', 'Привет, мир!', '', 'inherit', 'closed', 'closed', '', '1-autosave-v1', '', '', '2020-06-17 19:29:23', '2020-06-17 16:29:23', '', 1, 'http://localhost/1-autosave-v1/', 0, 'revision', '', 0),
(117, 1, '2020-06-17 19:30:01', '2020-06-17 16:30:01', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите ее, затем начинайте создавать!</p>\n<!-- /wp:paragraph -->', 'Привет, мир!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-06-17 19:30:01', '2020-06-17 16:30:01', '', 1, 'http://localhost/1-revision-v1/', 0, 'revision', '', 0),
(118, 1, '2020-06-17 19:37:59', '2020-06-17 16:37:59', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Сейчас библиотека строится, об открытии будет сообщено.</p>\n<!-- /wp:paragraph -->', 'Библиотека строится.', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2020-06-17 19:37:59', '2020-06-17 16:37:59', '', 94, 'http://localhost/94-revision-v1/', 0, 'revision', '', 0),
(119, 1, '2020-06-17 19:39:04', '2020-06-17 16:39:04', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Сейчас библиотека строится, об открытии будет сообщено.</p>\n<!-- /wp:paragraph -->', 'Библиотека строится.', '', 'inherit', 'closed', 'closed', '', '94-autosave-v1', '', '', '2020-06-17 19:39:04', '2020-06-17 16:39:04', '', 94, 'http://localhost/94-autosave-v1/', 0, 'revision', '', 0),
(121, 1, '2020-06-17 21:28:48', '2020-06-17 18:28:48', '<!-- wp:html -->\n<p class=\"initial\">Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Феодор Студит, Устав</p>\n<!-- /wp:paragraph -->', 'Правило о книгах', '', 'publish', 'open', 'open', '', 'proverka', '', '', '2020-06-19 04:32:41', '2020-06-19 01:32:41', '', 0, 'http://localhost/?p=121', 0, 'post', '', 0),
(122, 1, '2020-06-17 21:27:58', '2020-06-17 18:27:58', '<!-- wp:paragraph -->\n<p>Проверка ПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверка.</p>\n<!-- /wp:paragraph -->', 'Проверка', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-17 21:27:58', '2020-06-17 18:27:58', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(123, 1, '2020-06-17 21:28:48', '2020-06-17 18:28:48', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Проверка ПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверка.</p>\n<!-- /wp:paragraph -->', 'Проверка', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-17 21:28:48', '2020-06-17 18:28:48', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(124, 1, '2020-06-17 21:34:26', '2020-06-17 18:34:26', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Проверка ПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверка. </p>\n<!-- /wp:paragraph -->', 'Проверка', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-17 21:34:26', '2020-06-17 18:34:26', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(125, 1, '2020-06-17 21:34:54', '2020-06-17 18:34:54', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Проверка ПроверкаПроверкаПроверкаПровер каПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПровер каПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверка ПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверка ПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПроверкаПрове ркаПроверкаПроверкаПроверкаПроверкаПроверкаПроверка. </p>\n<!-- /wp:paragraph -->', 'Проверка', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-17 21:34:54', '2020-06-17 18:34:54', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(126, 1, '2020-06-17 21:35:36', '2020-06-17 18:35:36', '<!-- wp:paragraph {\"className\":\"initial\"} -->\n<p class=\"initial\">Проверка Прове  каПроверк аПроверка Провер каПроверкаПроверк аПроверкаПроверкаПр оверкаПроверкаПровер каПроверкаП роверкаПрове рка Провер ка Пров еркаПров еркаПроверка ПроверкаПр оверкаП роверкаПроверка ПроверкаПро веркаПрове ркаПроверкаПроверкаПро веркаПроверка ПроверкаПроверкаПр оверкаПроверкаПроверкаПр оверкаПроверк аПровер каП роверкаПроверкаПрове ркаПров еркаПроверкаПроверкаПр оверкаПровер каПро верка. </p>\n<!-- /wp:paragraph -->', 'Проверка', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-17 21:35:36', '2020-06-17 18:35:36', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(127, 1, '2020-06-18 09:02:18', '2020-06-18 06:02:18', '<!-- wp:quote {\"className\":\"is-style-default\"} -->\n<blockquote class=\"wp-block-quote is-style-default\"><p class=\"initial\">Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Феодор Студит, Устав</p>\n<!-- /wp:paragraph -->', 'Правило о книгах', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-18 09:02:18', '2020-06-18 06:02:18', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(129, 1, '2020-06-18 09:03:48', '2020-06-18 06:03:48', '<!-- wp:quote {\"className\":\"is-style-default\"} -->\n<blockquote><p class=\"initial\">Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Феодор Студит, Устав</p>\n<!-- /wp:paragraph -->', 'Правило о книгах', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-18 09:03:48', '2020-06-18 06:03:48', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(130, 1, '2020-06-18 09:04:20', '2020-06-18 06:04:20', '<!-- wp:html -->\n<blockquote><p class=\"initial\">Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p></blockquote>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Феодор Студит, Устав</p>\n<!-- /wp:paragraph -->', 'Правило о книгах', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-18 09:04:20', '2020-06-18 06:04:20', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(131, 1, '2020-06-18 09:07:12', '2020-06-18 06:07:12', '<!-- wp:html -->\n<p class=\"initial\">Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Феодор Студит, Устав</p>\n<!-- /wp:paragraph -->', 'Правило о книгах', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-18 09:07:12', '2020-06-18 06:07:12', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(132, 1, '2020-06-18 18:32:18', '2020-06-18 15:32:18', ' ', '', '', 'publish', 'closed', 'closed', '', '132', '', '', '2020-06-19 18:22:05', '2020-06-19 15:22:05', '', 0, 'http://localhost/?p=132', 3, 'nav_menu_item', '', 0),
(136, 1, '2020-06-18 19:58:14', '2020-06-18 16:58:14', 'http://localhost/wp-content/uploads/2020/06/cropped-favikon.png', 'cropped-favikon.png', '', 'inherit', 'open', 'closed', '', 'cropped-favikon-png', '', '', '2020-06-18 19:58:14', '2020-06-18 16:58:14', '', 0, 'http://localhost/wp-content/uploads/2020/06/cropped-favikon.png', 0, 'attachment', 'image/png', 0),
(138, 1, '2020-06-18 19:58:53', '2020-06-18 16:58:53', 'http://localhost/wp-content/uploads/2020/06/cropped-favikon-1.png', 'cropped-favikon-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-favikon-1-png', '', '', '2020-06-18 19:58:53', '2020-06-18 16:58:53', '', 0, 'http://localhost/wp-content/uploads/2020/06/cropped-favikon-1.png', 0, 'attachment', 'image/png', 0),
(141, 1, '2020-06-18 20:21:31', '2020-06-18 17:21:31', '', 'favicon', '', 'inherit', 'open', 'closed', '', 'favicon', '', '', '2020-06-18 20:22:09', '2020-06-18 17:22:09', '', 0, 'http://localhost/wp-content/uploads/2020/06/favicon.png', 0, 'attachment', 'image/png', 0),
(142, 1, '2020-06-18 20:21:49', '2020-06-18 17:21:49', 'http://localhost/wp-content/uploads/2020/06/cropped-favicon.png', 'cropped-favicon.png', '', 'inherit', 'open', 'closed', '', 'cropped-favicon-png', '', '', '2020-06-18 20:21:49', '2020-06-18 17:21:49', '', 0, 'http://localhost/wp-content/uploads/2020/06/cropped-favicon.png', 0, 'attachment', 'image/png', 0),
(144, 1, '2020-06-18 20:22:12', '2020-06-18 17:22:12', 'http://localhost/wp-content/uploads/2020/06/cropped-favicon-1.png', 'cropped-favicon-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-favicon-1-png', '', '', '2020-06-18 20:22:12', '2020-06-18 17:22:12', '', 0, 'http://localhost/wp-content/uploads/2020/06/cropped-favicon-1.png', 0, 'attachment', 'image/png', 0),
(146, 1, '2020-06-19 04:06:29', '2020-06-19 01:06:29', '<!-- wp:html -->\n<p class=\"initial\">Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Феодор Студит, Устав</p>\n<!-- /wp:paragraph -->', 'Правило о книгах', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-19 04:06:29', '2020-06-19 01:06:29', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(147, 1, '2020-06-19 04:07:19', '2020-06-19 01:07:19', '<!-- wp:html -->\n<p class=\"initial\">Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Феодор Студит, Устав</p>\n<!-- /wp:paragraph -->', 'Правило о книгах', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-19 04:07:19', '2020-06-19 01:07:19', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(148, 1, '2020-06-19 04:32:39', '2020-06-19 01:32:39', '<!-- wp:html -->\n<p class=\"initial\">Следует иметь в виду, что по тем дням, когда мы не занимаемся физическим трудом, библиотекарь один раз бьет в<br>било — и братия собирается в библиотеку, каждый берет по книге и читает до вечера. Перед вечерей библиотекарь опять бьет в било, все приходят и возвращают свои книги согласно реестру.</p>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Феодор Студит, Устав</p>\n<!-- /wp:paragraph -->', 'Правило о книгах', '', 'inherit', 'closed', 'closed', '', '121-revision-v1', '', '', '2020-06-19 04:32:39', '2020-06-19 01:32:39', '', 121, 'http://localhost/121-revision-v1/', 0, 'revision', '', 0),
(149, 1, '2020-06-19 05:14:04', '2020-06-19 02:14:04', '', 'Книги', '', 'publish', 'closed', 'closed', '', 'kniigi', '', '', '2020-06-19 18:22:05', '2020-06-19 15:22:05', '', 0, 'http://localhost/?p=149', 4, 'nav_menu_item', '', 0),
(150, 1, '2020-06-19 05:14:04', '2020-06-19 02:14:04', '', 'Читаю сейчас', '', 'publish', 'closed', 'closed', '', 'chitayu-sejchas', '', '', '2020-06-19 18:22:05', '2020-06-19 15:22:05', '', 0, 'http://localhost/?p=150', 6, 'nav_menu_item', '', 0),
(151, 1, '2020-06-19 05:14:04', '2020-06-19 02:14:04', '', 'Все книги', '', 'publish', 'closed', 'closed', '', 'vse-knigi', '', '', '2020-06-19 18:22:05', '2020-06-19 15:22:05', '', 0, 'http://localhost/?p=151', 5, 'nav_menu_item', '', 0),
(152, 1, '2020-06-19 18:19:42', '2020-06-19 15:19:42', '', 'Гостиница', '', 'publish', 'closed', 'closed', '', 'gostinitsa', '', '', '2020-06-19 18:22:05', '2020-06-19 15:22:05', '', 0, 'http://localhost/?p=152', 8, 'nav_menu_item', '', 0),
(153, 1, '2020-06-20 06:33:12', '2020-06-20 03:33:12', '', 'Гостиница', '', 'publish', 'closed', 'closed', '', 'hotel', '', '', '2020-06-20 10:51:57', '2020-06-20 07:51:57', '', 0, 'http://localhost/?page_id=153', 0, 'page', '', 0),
(154, 1, '2020-06-20 06:33:12', '2020-06-20 03:33:12', '', 'Гостиница', '', 'inherit', 'closed', 'closed', '', '153-revision-v1', '', '', '2020-06-20 06:33:12', '2020-06-20 03:33:12', '', 153, 'http://localhost/153-revision-v1/', 0, 'revision', '', 0),
(160, 1, '2020-06-22 22:29:17', '2020-06-22 19:29:17', '', 'Form', '', 'publish', 'closed', 'closed', '', 'form', '', '', '2020-06-22 22:34:40', '2020-06-22 19:34:40', '', 0, 'http://localhost/?page_id=160', 0, 'page', '', 0),
(161, 1, '2020-06-22 22:29:17', '2020-06-22 19:29:17', '', 'Ответ', '', 'inherit', 'closed', 'closed', '', '160-revision-v1', '', '', '2020-06-22 22:29:17', '2020-06-22 19:29:17', '', 160, 'http://localhost/160-revision-v1/', 0, 'revision', '', 0),
(162, 1, '2020-06-22 22:30:06', '2020-06-22 19:30:06', '', 'Form', '', 'inherit', 'closed', 'closed', '', '160-revision-v1', '', '', '2020-06-22 22:30:06', '2020-06-22 19:30:06', '', 160, 'http://localhost/160-revision-v1/', 0, 'revision', '', 0),
(163, 1, '2020-06-22 22:34:44', '2020-06-22 19:34:44', '', 'Form', '', 'inherit', 'closed', 'closed', '', '160-autosave-v1', '', '', '2020-06-22 22:34:44', '2020-06-22 19:34:44', '', 160, 'http://localhost/160-autosave-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без рубрики', 'bez-rubriki', 0),
(2, 'Навигация', 'navigatsiya', 0),
(3, 'Вести', 'vesti', 0),
(4, 'Записки', 'zapiski', 0),
(5, 'hotelpro', 'hotelpro', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(62, 2, 0),
(94, 3, 0),
(94, 4, 0),
(105, 2, 0),
(106, 2, 0),
(121, 3, 0),
(132, 2, 0),
(149, 2, 0),
(150, 2, 0),
(151, 2, 0),
(152, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 8),
(3, 3, 'category', '', 0, 2),
(4, 4, 'category', '', 0, 1),
(5, 5, 'category', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'adm'),
(2, 1, 'first_name', 'Евсевий'),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '120'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, 'wp_user-settings', 'libraryContent=browse'),
(20, 1, 'wp_user-settings-time', '1587795523'),
(21, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(22, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}'),
(23, 1, 'nav_menu_recently_edited', '2'),
(27, 2, 'nickname', 'udal'),
(28, 2, 'first_name', ''),
(29, 2, 'last_name', ''),
(30, 2, 'description', ''),
(31, 2, 'rich_editing', 'true'),
(32, 2, 'syntax_highlighting', 'true'),
(33, 2, 'comment_shortcuts', 'false'),
(34, 2, 'admin_color', 'fresh'),
(35, 2, 'use_ssl', '0'),
(36, 2, 'show_admin_bar_front', 'true'),
(37, 2, 'locale', ''),
(38, 2, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(39, 2, 'wp_user_level', '0'),
(40, 2, 'default_password_nag', ''),
(42, 2, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(45, 1, 'session_tokens', 'a:1:{s:64:\"f041873ffc12501f275c93ed943dafd01e84aa4c468e3ce918ef223f18caf4bb\";a:4:{s:10:\"expiration\";i:1600095944;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:80.0) Gecko/20100101 Firefox/80.0\";s:5:\"login\";i:1599923144;}}'),
(46, 1, 'wp_r_tru_u_x', 'a:2:{s:2:\"id\";s:0:\"\";s:7:\"expires\";i:86400;}'),
(47, 2, 'session_tokens', 'a:1:{s:64:\"70adb378e3232589c66b9ba789b7c635750a2855f9534b7fa7c1189aceb90ffd\";a:4:{s:10:\"expiration\";i:1592723487;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0\";s:5:\"login\";i:1592550687;}}'),
(49, 1, '_yoast_wpseo_profile_updated', '1592624212');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'adm', '$P$BfUij09kPtkJ2.VeDAfIVudjq0Kzld.', 'adm', 'truespirit7777@gmail.com', '', '2020-02-27 13:03:30', '', 0, 'Евсевий'),
(2, 'udal', '$P$B2i0iQCpw9UNnVA9ZmKTQzJYmENzyz.', 'udal', 'udalkanal@gmail.com', '', '2020-06-10 13:20:10', '', 0, 'udal');

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_indexable`
--

CREATE TABLE `wp_yoast_indexable` (
  `id` int(11) UNSIGNED NOT NULL,
  `permalink` longtext COLLATE utf8mb4_unicode_520_ci,
  `permalink_hash` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_sub_type` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `post_parent` int(11) UNSIGNED DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci,
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `breadcrumb_title` text COLLATE utf8mb4_unicode_520_ci,
  `post_status` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_protected` tinyint(1) DEFAULT '0',
  `has_public_posts` tinyint(1) DEFAULT NULL,
  `number_of_pages` int(11) UNSIGNED DEFAULT NULL,
  `canonical` longtext COLLATE utf8mb4_unicode_520_ci,
  `primary_focus_keyword` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `primary_focus_keyword_score` int(3) DEFAULT NULL,
  `readability_score` int(3) DEFAULT NULL,
  `is_cornerstone` tinyint(1) DEFAULT '0',
  `is_robots_noindex` tinyint(1) DEFAULT '0',
  `is_robots_nofollow` tinyint(1) DEFAULT '0',
  `is_robots_noarchive` tinyint(1) DEFAULT '0',
  `is_robots_noimageindex` tinyint(1) DEFAULT '0',
  `is_robots_nosnippet` tinyint(1) DEFAULT '0',
  `twitter_title` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_image` longtext COLLATE utf8mb4_unicode_520_ci,
  `twitter_description` longtext COLLATE utf8mb4_unicode_520_ci,
  `twitter_image_id` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `twitter_image_source` text COLLATE utf8mb4_unicode_520_ci,
  `open_graph_title` text COLLATE utf8mb4_unicode_520_ci,
  `open_graph_description` longtext COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image` longtext COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image_id` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_image_source` text COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image_meta` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `link_count` int(11) DEFAULT NULL,
  `incoming_link_count` int(11) DEFAULT NULL,
  `prominent_words_version` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blog_id` bigint(20) NOT NULL DEFAULT '1',
  `language` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `region` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_page_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_article_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_yoast_indexable`
--

INSERT INTO `wp_yoast_indexable` (`id`, `permalink`, `permalink_hash`, `object_id`, `object_type`, `object_sub_type`, `author_id`, `post_parent`, `title`, `description`, `breadcrumb_title`, `post_status`, `is_public`, `is_protected`, `has_public_posts`, `number_of_pages`, `canonical`, `primary_focus_keyword`, `primary_focus_keyword_score`, `readability_score`, `is_cornerstone`, `is_robots_noindex`, `is_robots_nofollow`, `is_robots_noarchive`, `is_robots_noimageindex`, `is_robots_nosnippet`, `twitter_title`, `twitter_image`, `twitter_description`, `twitter_image_id`, `twitter_image_source`, `open_graph_title`, `open_graph_description`, `open_graph_image`, `open_graph_image_id`, `open_graph_image_source`, `open_graph_image_meta`, `link_count`, `incoming_link_count`, `prominent_words_version`, `created_at`, `updated_at`, `blog_id`, `language`, `region`, `schema_page_type`, `schema_article_type`) VALUES
(1, 'http://localhost/author/adm/', '28:cf0b67744db01c1539ab8ae423127b3b', 1, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'https://0.gravatar.com/avatar/63eeb734b0038623e39295fe6dc23173?s=500&d=mm&r=g', NULL, NULL, 'gravatar-image', NULL, NULL, 'https://0.gravatar.com/avatar/63eeb734b0038623e39295fe6dc23173?s=500&d=mm&r=g', NULL, 'gravatar-image', NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-20 00:33:15', 1, NULL, NULL, NULL, NULL),
(2, 'http://localhost/wp-content/uploads/2020/04/body_bg.jpg', '55:2b2178900ba1a3d7ff509d7bb7babb96', 41, 'post', 'attachment', 1, 0, NULL, NULL, 'body_bg', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wp-content/uploads/2020/04/body_bg.jpg', NULL, '41', 'attachment-image', NULL, NULL, 'http://localhost/wp-content/uploads/2020/04/body_bg.jpg', '41', 'attachment-image', '{\"width\":383,\"height\":383,\"url\":\"http:\\/\\/localhost\\/wp-content\\/uploads\\/2020\\/04\\/body_bg.jpg\",\"path\":\"C:\\\\laragon\\\\www\\/wp-content\\/uploads\\/2020\\/04\\/body_bg.jpg\",\"size\":\"full\",\"id\":41,\"alt\":\"\\u0421\\u0442\\u043e\\u043b\",\"pixels\":146689,\"type\":\"image\\/jpeg\"}', NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(3, 'http://localhost/wp-content/uploads/2020/06/marble-bg-1.png', '59:4f82557b43d42e5da9f04ad98c52cd91', 86, 'post', 'attachment', 1, 0, NULL, NULL, 'marble-bg', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/marble-bg-1.png', NULL, '86', 'attachment-image', NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/marble-bg-1.png', '86', 'attachment-image', '{\"width\":500,\"height\":500,\"url\":\"http:\\/\\/localhost\\/wp-content\\/uploads\\/2020\\/06\\/marble-bg-1.png\",\"path\":\"C:\\\\laragon\\\\www\\/wp-content\\/uploads\\/2020\\/06\\/marble-bg-1.png\",\"size\":\"full\",\"id\":86,\"alt\":\"\",\"pixels\":250000,\"type\":\"image\\/png\"}', NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(4, 'http://localhost/wp-content/uploads/2020/06/cropped-favikon.png', '63:b4e77e7609858cc7504a1c0d794d25c5', 136, 'post', 'attachment', 1, 0, NULL, NULL, 'cropped-favikon.png', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/cropped-favikon.png', NULL, '136', 'attachment-image', NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/cropped-favikon.png', '136', 'attachment-image', '{\"width\":512,\"height\":512,\"url\":\"http:\\/\\/localhost\\/wp-content\\/uploads\\/2020\\/06\\/cropped-favikon.png\",\"path\":\"C:\\\\laragon\\\\www\\/wp-content\\/uploads\\/2020\\/06\\/cropped-favikon.png\",\"size\":\"full\",\"id\":136,\"alt\":\"\",\"pixels\":262144,\"type\":\"image\\/png\"}', NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(5, 'http://localhost/wp-content/uploads/2020/06/cropped-favikon-1.png', '65:af101252fd49585e844bb8510e9dced5', 138, 'post', 'attachment', 1, 0, NULL, NULL, 'cropped-favikon-1.png', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/cropped-favikon-1.png', NULL, '138', 'attachment-image', NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/cropped-favikon-1.png', '138', 'attachment-image', '{\"width\":512,\"height\":512,\"url\":\"http:\\/\\/localhost\\/wp-content\\/uploads\\/2020\\/06\\/cropped-favikon-1.png\",\"path\":\"C:\\\\laragon\\\\www\\/wp-content\\/uploads\\/2020\\/06\\/cropped-favikon-1.png\",\"size\":\"full\",\"id\":138,\"alt\":\"\",\"pixels\":262144,\"type\":\"image\\/png\"}', NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(6, 'http://localhost/wp-content/uploads/2020/06/favicon.png', '55:3ad6d4cab299f87341b94217cbba827c', 141, 'post', 'attachment', 1, 0, NULL, NULL, 'favicon', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/favicon.png', NULL, '141', 'attachment-image', NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/favicon.png', '141', 'attachment-image', '{\"width\":716,\"height\":639,\"url\":\"http:\\/\\/localhost\\/wp-content\\/uploads\\/2020\\/06\\/favicon.png\",\"path\":\"C:\\\\laragon\\\\www\\/wp-content\\/uploads\\/2020\\/06\\/favicon.png\",\"size\":\"full\",\"id\":141,\"alt\":\"\\u0413\\u0435\\u0440\\u0431 \\u0420\\u043e\\u043c\\u0430\\u043d\\u0438\\u0438\",\"pixels\":457524,\"type\":\"image\\/png\"}', NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(7, 'http://localhost/wp-content/uploads/2020/06/cropped-favicon.png', '63:4f54c06d769eb22c86aa4cb65aa1717f', 142, 'post', 'attachment', 1, 0, NULL, NULL, 'cropped-favicon.png', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/cropped-favicon.png', NULL, '142', 'attachment-image', NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/cropped-favicon.png', '142', 'attachment-image', '{\"width\":512,\"height\":512,\"url\":\"http:\\/\\/localhost\\/wp-content\\/uploads\\/2020\\/06\\/cropped-favicon.png\",\"path\":\"C:\\\\laragon\\\\www\\/wp-content\\/uploads\\/2020\\/06\\/cropped-favicon.png\",\"size\":\"full\",\"id\":142,\"alt\":\"\",\"pixels\":262144,\"type\":\"image\\/png\"}', NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(8, 'http://localhost/wp-content/uploads/2020/06/cropped-favicon-1.png', '65:2ed973d02f72c20fa2d2d43e314ef085', 144, 'post', 'attachment', 1, 0, NULL, NULL, 'cropped-favicon-1.png', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/cropped-favicon-1.png', NULL, '144', 'attachment-image', NULL, NULL, 'http://localhost/wp-content/uploads/2020/06/cropped-favicon-1.png', '144', 'attachment-image', '{\"width\":512,\"height\":512,\"url\":\"http:\\/\\/localhost\\/wp-content\\/uploads\\/2020\\/06\\/cropped-favicon-1.png\",\"path\":\"C:\\\\laragon\\\\www\\/wp-content\\/uploads\\/2020\\/06\\/cropped-favicon-1.png\",\"size\":\"full\",\"id\":144,\"alt\":\"\",\"pixels\":262144,\"type\":\"image\\/png\"}', NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(9, 'http://localhost/?page_id=3', '27:009b95274aadaedd534f46b3655d0c8d', 3, 'post', 'page', 1, 0, NULL, NULL, 'Политика конфиденциальности', 'draft', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(10, 'http://localhost/sample-page/', '29:5a67242ac883f8db927fcbd72cfe744f', 2, 'post', 'page', 1, 0, NULL, NULL, 'Пример страницы', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(11, 'http://localhost/books/', '23:f70fc8640cda93695c2fe0ea1c15087e', 66, 'post', 'page', 1, 0, NULL, NULL, 'Книги', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(12, 'http://localhost/about-me/', '26:aba6398c57803d844b3b4ca9e0f58032', 103, 'post', 'page', 1, 0, NULL, NULL, 'Обо мне', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(13, 'http://localhost/about-me__trashed/', '35:a76cbf2a9cec0c095d3fbc80ea0ae0b0', 64, 'post', 'page', 1, 0, NULL, NULL, 'Обо мне', 'trash', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(14, 'http://localhost/category-zapiski__trashed/', '43:6fa1f3589ff4d971c018ca449cb7e73d', 68, 'post', 'page', 1, 0, NULL, NULL, 'Записки', 'trash', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(15, 'http://localhost/?p=120', '23:2689dcae3bd98437b7221a8e93ee0954', 120, 'post', 'post', 1, 0, NULL, NULL, 'Черновик', 'auto-draft', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(16, 'http://localhost/privet-mir/', '28:5731444081d02109ee1f7cbdb2a7c368', 1, 'post', 'post', 1, 0, NULL, NULL, 'Привет, мир!', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(17, 'http://localhost/biblioteka-stroitsya/', '38:c977c8c48012a36a0a215d68de3af52c', 94, 'post', 'post', 1, 0, NULL, NULL, 'Библиотека строится.', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(18, 'http://localhost/proverka/', '26:3ff4aff4151eed09864a315798cdbd58', 121, 'post', 'post', 1, 0, NULL, NULL, 'Правило о книгах', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-06-19 01:11:00', '2020-06-18 22:32:41', 1, NULL, NULL, NULL, NULL),
(19, 'http://localhost/category/bez-rubriki/', '38:c9711783e6f77b8036266cd9b2f64d33', 1, 'term', 'category', NULL, NULL, NULL, NULL, 'Без рубрики', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(20, 'http://localhost/category/vesti/', '32:3599e16f827cb488ce2d0f7c024c5e71', 3, 'term', 'category', NULL, NULL, NULL, NULL, 'Вести', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(21, 'http://localhost/category/zapiski/', '34:d4e0fa961f5b8b8b9642c0bb990d14c4', 4, 'term', 'category', NULL, NULL, NULL, NULL, 'Записки', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(22, NULL, NULL, NULL, 'system-page', '404', NULL, NULL, 'Страница не найдена %%sep%% %%sitename%%', NULL, 'Ошибка 404: страница не найдена', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-20 00:37:28', 1, NULL, NULL, NULL, NULL),
(23, NULL, NULL, NULL, 'system-page', 'search-result', NULL, NULL, 'Вы искали %%searchphrase%% %%page%% %%sep%% %%sitename%%', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-20 00:37:28', 1, NULL, NULL, NULL, NULL),
(24, NULL, NULL, NULL, 'date-archive', NULL, NULL, NULL, '%%date%% %%page%% %%sep%% %%sitename%%', '', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-20 00:37:28', 1, NULL, NULL, NULL, NULL),
(25, 'http://localhost/', '17:c9db569cb388e160e4b86ca1ddff84d7', NULL, 'home-page', NULL, NULL, NULL, '%%sitename%% %%page%% %%sep%% %%sitedesc%%', '', 'Главная страница', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:11:00', '2020-06-18 22:11:00', 1, NULL, NULL, NULL, NULL),
(26, 'http://localhost/portfolio/', '27:a761a483672e26edd8feb2bc3e71369e', NULL, 'post-type-archive', 'portfolio', NULL, NULL, '%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%', '', 'Portfolio', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-20 03:29:13', '2020-06-20 00:29:13', 1, NULL, NULL, NULL, NULL),
(27, 'http://localhost/gostinitsa/', '28:66801f38ac62d4b982d2215d7b63cf88', 153, 'post', 'page', 1, 0, NULL, NULL, 'Гостиница', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-06-20 03:31:43', '2020-06-20 00:33:15', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_indexable_hierarchy`
--

CREATE TABLE `wp_yoast_indexable_hierarchy` (
  `indexable_id` int(11) UNSIGNED NOT NULL,
  `ancestor_id` int(11) UNSIGNED NOT NULL,
  `depth` int(11) UNSIGNED DEFAULT NULL,
  `blog_id` bigint(20) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_migrations`
--

CREATE TABLE `wp_yoast_migrations` (
  `id` int(11) UNSIGNED NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_yoast_migrations`
--

INSERT INTO `wp_yoast_migrations` (`id`, `version`) VALUES
(1, '20171228151840'),
(2, '20171228151841'),
(3, '20190529075038'),
(4, '20191011111109'),
(5, '20200408101900'),
(6, '20200420073606'),
(7, '20200428123747'),
(8, '20200428194858'),
(9, '20200429105310'),
(10, '20200430075614'),
(11, '20200430150130'),
(12, '20200507054848'),
(13, '20200513133401');

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_primary_term`
--

CREATE TABLE `wp_yoast_primary_term` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `term_id` int(11) UNSIGNED NOT NULL,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blog_id` bigint(20) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_seo_links`
--

CREATE TABLE `wp_yoast_seo_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `target_post_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_seo_meta`
--

CREATE TABLE `wp_yoast_seo_meta` (
  `object_id` bigint(20) UNSIGNED NOT NULL,
  `internal_link_count` int(10) UNSIGNED DEFAULT NULL,
  `incoming_link_count` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_yoast_seo_meta`
--

INSERT INTO `wp_yoast_seo_meta` (`object_id`, `internal_link_count`, `incoming_link_count`) VALUES
(121, 0, 0),
(153, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookID`);

--
-- Indexes for table `characternames`
--
ALTER TABLE `characternames`
  ADD UNIQUE KEY `uniqueNames` (`maleNames`,`femaleNames`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `wp_cackle_channel`
--
ALTER TABLE `wp_cackle_channel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `ID` (`ID`),
  ADD KEY `ID_2` (`ID`);

--
-- Indexes for table `wp_yoast_indexable`
--
ALTER TABLE `wp_yoast_indexable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_type_and_sub_type` (`object_type`,`object_sub_type`),
  ADD KEY `permalink_hash` (`permalink_hash`),
  ADD KEY `object_id_and_type` (`object_id`,`object_type`);

--
-- Indexes for table `wp_yoast_indexable_hierarchy`
--
ALTER TABLE `wp_yoast_indexable_hierarchy`
  ADD PRIMARY KEY (`indexable_id`,`ancestor_id`),
  ADD KEY `indexable_id` (`indexable_id`),
  ADD KEY `ancestor_id` (`ancestor_id`),
  ADD KEY `depth` (`depth`);

--
-- Indexes for table `wp_yoast_migrations`
--
ALTER TABLE `wp_yoast_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_wp_yoast_migrations_version` (`version`);

--
-- Indexes for table `wp_yoast_primary_term`
--
ALTER TABLE `wp_yoast_primary_term`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_taxonomy` (`post_id`,`taxonomy`),
  ADD KEY `post_term` (`post_id`,`term_id`);

--
-- Indexes for table `wp_yoast_seo_links`
--
ALTER TABLE `wp_yoast_seo_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_direction` (`post_id`,`type`);

--
-- Indexes for table `wp_yoast_seo_meta`
--
ALTER TABLE `wp_yoast_seo_meta`
  ADD UNIQUE KEY `object_id` (`object_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `userId` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=851;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_yoast_indexable`
--
ALTER TABLE `wp_yoast_indexable`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `wp_yoast_migrations`
--
ALTER TABLE `wp_yoast_migrations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wp_yoast_primary_term`
--
ALTER TABLE `wp_yoast_primary_term`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_yoast_seo_links`
--
ALTER TABLE `wp_yoast_seo_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `wp_users` (`ID`) ON UPDATE CASCADE;
--
-- Database: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Fname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Lname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Card_no` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `License_no` char(8) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interacts_with`
--

CREATE TABLE `interacts_with` (
  `EmpID` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `User` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Service` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reserves`
--

CREATE TABLE `reserves` (
  `User_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Room_no` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Number` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `Vacancy` set('Yes','No') COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(5,2) NOT NULL,
  `Type` set('Single','Double','Queen','King','Double_Queen','Double_King','Suite','Presidential') COLLATE utf8_unicode_ci NOT NULL,
  `Description` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Number`, `Vacancy`, `Price`, `Type`, `Description`) VALUES
('123', 'Yes', '125.00', 'Single', 'Single twin bed with a loveseat, a desk, and a television.'),
('156', 'Yes', '125.00', 'Single', 'Single twin bed with a loveseat, a desk, and a television.'),
('234', 'Yes', '150.00', 'Double', 'Two twin beds with a couch, a desk, and a television.'),
('346', 'Yes', '175.00', 'Queen', 'One queen bed with a loveseat, a desk, and a television.'),
('455', 'Yes', '125.00', 'Single', 'Single twin bed with a loveseat, a desk, and a television.'),
('456', 'Yes', '200.00', 'King', 'One king bed with a loveseat, a mini refrigerator, a desk, and a television.'),
('545', 'Yes', '150.00', 'Double', 'Two twin beds with a couch, a desk, and a television.'),
('567', 'Yes', '275.00', 'Double_Queen', 'Two queen beds with a couch, a mini refrigerator, a desk, and two televisions.'),
('678', 'Yes', '325.00', 'Double_King', 'Two king beds with two couches, a mini refrigerator, two desks, and two televisions.'),
('789', 'Yes', '400.00', 'Suite', 'Two separate rooms connected together. Each room has two twin beds, a loveseat, and a television. There is also a living room with a television, a large couch, a mini refrigerator, and a desk.'),
('890', 'Yes', '800.00', 'Presidential', 'The most luxurious room. King bed, television, and walk-in closet in the master bedroom. Living room with several couches, a fireplace, a television, and dining table.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `interacts_with`
--
ALTER TABLE `interacts_with`
  ADD KEY `EmpID` (`EmpID`),
  ADD KEY `User` (`User`);

--
-- Indexes for table `reserves`
--
ALTER TABLE `reserves`
  ADD KEY `User_name` (`User_name`),
  ADD KEY `Room_no` (`Room_no`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Number`);
--
-- Database: `hoteldb`
--
CREATE DATABASE IF NOT EXISTS `hoteldb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hoteldb`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `patronymic` varchar(50) DEFAULT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `firstName`, `lastName`, `patronymic`, `address`) VALUES
(15, 'Danil', 'Andreev', 'Alexandrovich', 'Biysk'),
(16, 'Ð”Ð°Ð½Ð¸Ð»', 'ÐÐ½Ð´Ñ€ÐµÐµÐ²', 'ÐÐ»ÐµÐºÑÐ°Ð½Ð´Ñ€Ð¾Ð²Ð¸Ñ‡', 'Biysk');

-- --------------------------------------------------------

--
-- Table structure for table `reserves`
--

CREATE TABLE `reserves` (
  `reserveID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `roomID` int(11) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `breakfast` enum('Да','Нет') DEFAULT 'Нет'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reserves`
--

INSERT INTO `reserves` (`reserveID`, `customerID`, `roomID`, `startDate`, `endDate`, `breakfast`) VALUES
(33, 15, 1, '2020-06-26', NULL, 'Нет'),
(34, 15, 6, '2020-06-27', NULL, 'Нет'),
(35, 16, 1, '2020-06-26', NULL, 'Нет');

-- --------------------------------------------------------

--
-- Table structure for table `roomclass`
--

CREATE TABLE `roomclass` (
  `classID` int(11) NOT NULL,
  `className` varchar(12) NOT NULL,
  `classCost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roomclass`
--

INSERT INTO `roomclass` (`classID`, `className`, `classCost`) VALUES
(1, 'Люкс', 1500),
(2, 'Одноместный', 500),
(3, 'Двухместный', 900);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomID` int(11) NOT NULL,
  `roomClass` int(11) NOT NULL,
  `vacancy` enum('free','reserved') DEFAULT 'free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roomID`, `roomClass`, `vacancy`) VALUES
(1, 1, 'free'),
(2, 1, 'free'),
(3, 1, 'free'),
(4, 1, 'free'),
(5, 1, 'free'),
(6, 2, 'free'),
(7, 2, 'free'),
(8, 2, 'free'),
(9, 3, 'free'),
(17, 1, 'free'),
(18, 1, 'free'),
(40, 1, 'free'),
(41, 1, 'free'),
(44, 2, 'free'),
(45, 2, 'free'),
(46, 2, 'free'),
(47, 2, 'free'),
(48, 2, 'free'),
(49, 2, 'free'),
(52, 3, 'free'),
(53, 3, 'free'),
(54, 3, 'free'),
(55, 3, 'free'),
(56, 3, 'free'),
(57, 3, 'free'),
(58, 3, 'free'),
(59, 3, 'free'),
(60, 3, 'free');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `reserves`
--
ALTER TABLE `reserves`
  ADD PRIMARY KEY (`reserveID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `roomclass`
--
ALTER TABLE `roomclass`
  ADD PRIMARY KEY (`classID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomID`),
  ADD KEY `roomClass` (`roomClass`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `reserves`
--
ALTER TABLE `reserves`
  MODIFY `reserveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `roomclass`
--
ALTER TABLE `roomclass`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reserves`
--
ALTER TABLE `reserves`
  ADD CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`roomClass`) REFERENCES `roomclass` (`classID`);
--
-- Database: `serverdb`
--
CREATE DATABASE IF NOT EXISTS `serverdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `serverdb`;

-- --------------------------------------------------------

--
-- Table structure for table `birthplaces`
--

CREATE TABLE `birthplaces` (
  `namePlace` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `characterjobs`
--

CREATE TABLE `characterjobs` (
  `characterJob` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `characternames`
--

CREATE TABLE `characternames` (
  `maleNames` varchar(20) NOT NULL,
  `femaleNames` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characternames`
--

INSERT INTO `characternames` (`maleNames`, `femaleNames`) VALUES
('Агафон', 'Агата'),
('Александр', 'Алла'),
('Алексий', 'Анастасия'),
('Анатолий', 'Ангелина'),
('Андрий', 'Анисья'),
('Андроник', 'Анна'),
('Анисим', 'Анфиса'),
('Антип', 'Варвара'),
('Аркадий', 'Васса'),
('Артёмий', 'Вероника'),
('Архип', 'Галина'),
('Афанасий', 'Глафира');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `userId` int(10) UNSIGNED NOT NULL,
  `characterName` varchar(50) NOT NULL,
  `characterLastName` varchar(50) DEFAULT NULL,
  `characterAge` varchar(50) NOT NULL,
  `characterSex` enum('male','female') NOT NULL,
  `characterEstate` enum('clergy','nobility','peasantry','merchantry') NOT NULL,
  `characterHealth` enum('Y','N') NOT NULL,
  `characterJob` varchar(50) NOT NULL,
  `characterMoney` double UNSIGNED DEFAULT NULL,
  `characterBirthPlace` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`userId`, `characterName`, `characterLastName`, `characterAge`, `characterSex`, `characterEstate`, `characterHealth`, `characterJob`, `characterMoney`, `characterBirthPlace`) VALUES
(2, 'Анна', 'Комнина', '23', 'female', 'nobility', 'Y', 'Дворовая дочь', 10000, 'Форум Константина'),
(3, 'Афанасий', 'Конюх', '25', 'male', 'peasantry', 'Y', 'Землепашец', 10.2, 'Пригород у Константиновых Ворот');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(10) UNSIGNED NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userAge` int(3) UNSIGNED DEFAULT NULL,
  `userSex` enum('male','female') NOT NULL,
  `daysInGame` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `registrationDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `nickname`, `email`, `password`, `userAge`, `userSex`, `daysInGame`, `registrationDate`) VALUES
(2, 'Maria', 'maria@gmai.com', 'qwe321', 20, 'female', 1, '2020-04-08 08:21:07'),
(3, 'Player', 'player@gmail.com', '45tre', 25, 'male', 0, '2020-04-10 17:35:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `characternames`
--
ALTER TABLE `characternames`
  ADD UNIQUE KEY `uniqueNames` (`maleNames`,`femaleNames`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `FK_characters_users` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `FK_characters_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
