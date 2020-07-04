-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 04, 2020 at 03:55 PM
-- Server version: 5.7.27
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutaniti_iti`
--

-- --------------------------------------------------------

--
-- Table structure for table `iti_actionscheduler_actions`
--

CREATE TABLE `iti_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `iti_actionscheduler_actions`
--

INSERT INTO `iti_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(374, 'action_scheduler/migration_hook', 'complete', '2020-05-21 08:23:33', '2020-05-21 08:23:33', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1590049413;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1590049413;}', 1, 1, '2020-05-21 08:23:34', '2020-05-21 08:23:34', 0, NULL),
(375, 'wpforms_process_entry_emails_meta_cleanup', 'canceled', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '{\"tasks_meta_id\":1}', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1590105600;s:18:\"\0*\0first_timestamp\";i:1590105600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1590105600;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
(376, 'wpforms_admin_notifications_update', 'complete', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '{\"tasks_meta_id\":2}', 'O:28:\"ActionScheduler_NullSchedule\":0:{}', 2, 1, '2020-05-21 08:23:40', '2020-05-21 08:23:40', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `iti_actionscheduler_claims`
--

CREATE TABLE `iti_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_actionscheduler_groups`
--

CREATE TABLE `iti_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `iti_actionscheduler_groups`
--

INSERT INTO `iti_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration'),
(2, 'wpforms');

-- --------------------------------------------------------

--
-- Table structure for table `iti_actionscheduler_logs`
--

CREATE TABLE `iti_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `iti_actionscheduler_logs`
--

INSERT INTO `iti_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 374, 'action created', '2020-05-21 08:23:33', '2020-05-21 08:23:33'),
(2, 374, 'action started via WP Cron', '2020-05-21 08:23:34', '2020-05-21 08:23:34'),
(3, 374, 'action complete via WP Cron', '2020-05-21 08:23:34', '2020-05-21 08:23:34'),
(4, 375, 'action created', '2020-05-21 08:23:34', '2020-05-21 08:23:34'),
(5, 376, 'action created', '2020-05-21 08:23:35', '2020-05-21 08:23:35'),
(6, 376, 'action started via Async Request', '2020-05-21 08:23:39', '2020-05-21 08:23:39'),
(7, 376, 'action complete via Async Request', '2020-05-21 08:23:40', '2020-05-21 08:23:40'),
(8, 375, 'action canceled', '2020-05-21 08:32:44', '2020-05-21 08:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `iti_commentmeta`
--

CREATE TABLE `iti_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_comments`
--

CREATE TABLE `iti_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
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
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_links`
--

CREATE TABLE `iti_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_ngg_album`
--

CREATE TABLE `iti_ngg_album` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `albumdesc` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `sortorder` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `iti_ngg_album`
--

INSERT INTO `iti_ngg_album` (`id`, `name`, `slug`, `previewpic`, `albumdesc`, `sortorder`, `pageid`, `extras_post_id`) VALUES
(1, 'Welcome to ITI Chinawal:', 'welcome-to-iti-chinawal', 1, '', 'WyIxIl0=', 0, 159);

-- --------------------------------------------------------

--
-- Table structure for table `iti_ngg_gallery`
--

CREATE TABLE `iti_ngg_gallery` (
  `gid` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `path` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `title` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `galdesc` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `author` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `iti_ngg_gallery`
--

INSERT INTO `iti_ngg_gallery` (`gid`, `name`, `slug`, `path`, `title`, `galdesc`, `pageid`, `previewpic`, `author`, `extras_post_id`) VALUES
(1, 'infrastructure', 'Infrastructure', '/wp-content/gallery/infrastructure/', 'Infrastructure', '', 146, 8, 1, 160),
(2, 'classroom-and-labs', 'Classroom-and-Labs', '/wp-content/gallery/classroom-and-labs/', 'Classroom and Labs', NULL, 0, 9, 1, 176),
(3, 'extra-curriculam-activities', 'Extra-Curriculam-Activities', '/wp-content/gallery/extra-curriculam-activities/', 'Extra Curriculam Activities', '', 0, 17, 1, 192),
(4, 'staff-and-meetings', 'Staff-and-Meetings', '/wp-content/gallery/staff-and-meetings/', 'Staff and Meetings', '', 146, 24, 1, 203);

-- --------------------------------------------------------

--
-- Table structure for table `iti_ngg_pictures`
--

CREATE TABLE `iti_ngg_pictures` (
  `pid` bigint(20) NOT NULL,
  `image_slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `galleryid` bigint(20) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `alttext` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `imagedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exclude` tinyint(4) DEFAULT '0',
  `sortorder` bigint(20) NOT NULL DEFAULT '0',
  `meta_data` longtext COLLATE utf8mb4_unicode_520_ci,
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `iti_ngg_pictures`
--

INSERT INTO `iti_ngg_pictures` (`pid`, `image_slug`, `post_id`, `galleryid`, `filename`, `description`, `alttext`, `imagedate`, `exclude`, `sortorder`, `meta_data`, `extras_post_id`, `updated_at`) VALUES
(1, '11', 0, 1, '11.jpg', '', '11', '2019-02-16 05:42:07', 0, 5, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIxMS5qcGciLCJ3aWR0aCI6OTA5LCJoZWlnaHQiOjU5NSwiZ2VuZXJhdGVkIjoiMC44Nzk0NDgwMCAxNTUwMjk1NzI3In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo5MDksImhlaWdodCI6NTk1LCJzYXZlZCI6dHJ1ZSwibWQ1IjoiNzA0MDllNGY2MzU1YTk2MjQwNjYzYWUxYTY2MTQ0NGQiLCJmdWxsIjp7IndpZHRoIjo5MDksImhlaWdodCI6NTk1LCJtZDUiOiI3MDQwOWU0ZjYzNTVhOTYyNDA2NjNhZTFhNjYxNDQ0ZCJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzXzExLmpwZyIsImdlbmVyYXRlZCI6IjAuNDc2MTY0MDAgMTU1MDI5NTcyOSJ9LCJuZ2cwZHluLTB4MjUwLTAwZjB3MDExYzAxMHIxMTBmMTEwcjAxMHQwMTAiOnsid2lkdGgiOjM4MiwiaGVpZ2h0IjoyNTAsImZpbGVuYW1lIjoiMTEuanBnLW5nZ2lkMDExLW5nZzBkeW4tMHgyNTAtMDBmMHcwMTFjMDEwcjExMGYxMTByMDEwdDAxMC5qcGciLCJnZW5lcmF0ZWQiOiIwLjU0Mzg2NzAwIDE1NTAyOTU5NDAifX0=', 161, 1550295940),
(2, '12', 0, 1, '12.jpg', '', '12', '2019-02-16 05:42:11', 0, 6, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIxMi5qcGciLCJ3aWR0aCI6OTYyLCJoZWlnaHQiOjYyMywiZ2VuZXJhdGVkIjoiMC4yODU3NzcwMCAxNTUwMjk1NzMxIn0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo5NjIsImhlaWdodCI6NjIzLCJzYXZlZCI6dHJ1ZSwibWQ1IjoiZjViM2ZjNjMxMDNlYTFlMmFjYzNkMTg4NzhmZDdlZGYiLCJmdWxsIjp7IndpZHRoIjo5NjIsImhlaWdodCI6NjIzLCJtZDUiOiJmNWIzZmM2MzEwM2VhMWUyYWNjM2QxODg3OGZkN2VkZiJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzXzEyLmpwZyIsImdlbmVyYXRlZCI6IjAuNDM3MTg0MDAgMTU1MDI5NTczMiJ9fQ==', 162, 1550295876),
(5, '101_1642', 0, 1, '101_1642.JPG', '', '101_1642', '2019-02-07 10:17:37', 0, 2, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIxMDFfMTY0Mi5KUEciLCJ3aWR0aCI6MzI5NiwiaGVpZ2h0IjoyNDcyLCJnZW5lcmF0ZWQiOiIwLjg5MTY5MDAwIDE1NTAyOTU3NDIifSwiYXBlcnR1cmUiOiJGIDQuOCIsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6IktPREFLIEVBU1lTSEFSRSBDODEzIFpPT00gRElHSVRBTCBDQU1FUkEiLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOjE1NDk1MzQ2NTcsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6IjYgbW0iLCJpc28iOjgwLCJzaHV0dGVyX3NwZWVkIjoiMVwvMzkwIHNlYyIsImZsYXNoIjoiTm90IGZpcmVkIiwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjoxNjAwLCJoZWlnaHQiOjEyMDAsInNhdmVkIjp0cnVlLCJtZDUiOiI5MWM0N2FhOWQ3ZGEwNzViYzMzNDJkYTQ3MWQ1YWVkYSIsImZ1bGwiOnsid2lkdGgiOjE2MDAsImhlaWdodCI6MTIwMCwibWQ1IjoiOTFjNDdhYTlkN2RhMDc1YmMzMzQyZGE0NzFkNWFlZGEifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic18xMDFfMTY0Mi5KUEciLCJnZW5lcmF0ZWQiOiIwLjc3NTQ5MjAwIDE1NTAyOTU3NDMifSwibmdnMGR5bi00NTB4MzUwLTAwZjB3MDEwYzAxMHIxMTBmMTEwcjAxMHQwMTAiOnsid2lkdGgiOjQ1MCwiaGVpZ2h0IjozMzgsImZpbGVuYW1lIjoiMTAxXzE2NDIuSlBHLW5nZ2lkMDE1LW5nZzBkeW4tNDUweDM1MC0wMGYwdzAxMGMwMTByMTEwZjExMHIwMTB0MDEwLkpQRyIsImdlbmVyYXRlZCI6IjAuODM5MzkxMDAgMTU1MDI5NjY3NCJ9fQ==', 165, 1550296674),
(6, '101_1690', 0, 1, '101_1690.JPG', '', '101_1690', '2007-01-01 12:00:55', 0, 4, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIxMDFfMTY5MC5KUEciLCJ3aWR0aCI6MzI5NiwiaGVpZ2h0IjoyNDcyLCJnZW5lcmF0ZWQiOiIwLjA4NTMzODAwIDE1NTAyOTU3NDYifSwiYXBlcnR1cmUiOiJGIDQuOCIsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6IktPREFLIEVBU1lTSEFSRSBDODEzIFpPT00gRElHSVRBTCBDQU1FUkEiLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOjExNjc2NTI4NTUsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6IjYgbW0iLCJpc28iOjgwLCJzaHV0dGVyX3NwZWVkIjoiMVwvMjkwIHNlYyIsImZsYXNoIjoiTm90IGZpcmVkIiwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjoxNjAwLCJoZWlnaHQiOjEyMDAsInNhdmVkIjp0cnVlLCJtZDUiOiJkODIxOTQ1YzExNWRkMzczYmQzOTMwMWI0ZmRiMTY0ZSIsImZ1bGwiOnsid2lkdGgiOjE2MDAsImhlaWdodCI6MTIwMCwibWQ1IjoiZDgyMTk0NWMxMTVkZDM3M2JkMzkzMDFiNGZkYjE2NGUifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic18xMDFfMTY5MC5KUEciLCJnZW5lcmF0ZWQiOiIwLjY4MTQ0ODAwIDE1NTAyOTU3NDkifX0=', 166, 1550295876),
(7, 'building-photo', 0, 1, 'building-Photo.jpg', '', 'building Photo', '2019-02-07 15:40:53', 0, 7, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJidWlsZGluZy1QaG90by5qcGciLCJ3aWR0aCI6MTEwNCwiaGVpZ2h0Ijo2MDAsImdlbmVyYXRlZCI6IjAuMzQ3NTM3MDAgMTU1MDI5NTc1MCJ9LCJhcGVydHVyZSI6IkYgMi4yIiwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjoiUmVkbWkgWTIiLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOjE1NDk1NTQwNTMsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6IjMuODQgbW0iLCJpc28iOjEwMCwic2h1dHRlcl9zcGVlZCI6IjFcLzEzMCBzZWMiLCJmbGFzaCI6Ik5vdCBmaXJlZCIsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6MTEwNCwiaGVpZ2h0Ijo2MDAsInNhdmVkIjp0cnVlLCJtZDUiOiI2OTk4NzY2YWVhMTczZGU3OWMwZmMwMzhmNDYwM2JkMiIsImZ1bGwiOnsid2lkdGgiOjExMDQsImhlaWdodCI6NjAwLCJtZDUiOiI2OTk4NzY2YWVhMTczZGU3OWMwZmMwMzhmNDYwM2JkMiJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX2J1aWxkaW5nLVBob3RvLmpwZyIsImdlbmVyYXRlZCI6IjAuNjEzODc4MDAgMTU1MDI5NTc1MCJ9fQ==', 167, 1550295876),
(8, 'entrance', 0, 1, 'Entrance.JPG', '', 'Entrance', '2019-02-07 10:20:19', 0, 8, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJFbnRyYW5jZS5KUEciLCJ3aWR0aCI6MzI5NiwiaGVpZ2h0IjoyNDcyLCJnZW5lcmF0ZWQiOiIwLjU3NjQ1MTAwIDE1NTAyOTU3NTIifSwiYXBlcnR1cmUiOiJGIDQuOCIsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6IktPREFLIEVBU1lTSEFSRSBDODEzIFpPT00gRElHSVRBTCBDQU1FUkEiLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOjE1NDk1MzQ4MTksImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6IjYgbW0iLCJpc28iOjgwLCJzaHV0dGVyX3NwZWVkIjoiMVwvMjcwIHNlYyIsImZsYXNoIjoiTm90IGZpcmVkIiwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjoxNjAwLCJoZWlnaHQiOjEyMDAsInNhdmVkIjp0cnVlLCJtZDUiOiJmMWU3ZTRmM2JlYzRlNmNiZDliMzlmYWVlOTQ5MDcyNiIsImZ1bGwiOnsid2lkdGgiOjE2MDAsImhlaWdodCI6MTIwMCwibWQ1IjoiZjFlN2U0ZjNiZWM0ZTZjYmQ5YjM5ZmFlZTk0OTA3MjYifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19FbnRyYW5jZS5KUEciLCJnZW5lcmF0ZWQiOiIwLjk0MzQ5NzAwIDE1NTAyOTU3NTUifX0=', 168, 1550295876),
(17, 'ganeshotsav', 0, 3, 'ganeshotsav.JPG', '', 'ganeshotsav', '2013-09-11 22:25:06', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJnYW5lc2hvdHNhdi5KUEciLCJ3aWR0aCI6NjAwLCJoZWlnaHQiOjkwMCwiZ2VuZXJhdGVkIjoiMC4xMDgyMDEwMCAxNTUwMjk5MTE2In0sImFwZXJ0dXJlIjoiRiA2LjMiLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOiJOSUtPTiBEOTAiLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOjEzNzg5MzgzMDYsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6IjQ1IG1tIiwiaXNvIjo0MDAsInNodXR0ZXJfc3BlZWQiOiIxXC8xMzAgc2VjIiwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwid2lkdGgiOjYwMCwiaGVpZ2h0Ijo5MDAsInNhdmVkIjp0cnVlLCJtZDUiOiIwOTI2MmM2MDE4ODVhZTMxN2ZiYWRhMmM0MWU5NzU4NCIsImZ1bGwiOnsid2lkdGgiOjYwMCwiaGVpZ2h0Ijo5MDAsIm1kNSI6IjA5MjYyYzYwMTg4NWFlMzE3ZmJhZGEyYzQxZTk3NTg0In0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfZ2FuZXNob3RzYXYuSlBHIiwiZ2VuZXJhdGVkIjoiMC44NDEwNzgwMCAxNTUwMjk5MTIxIn19', 193, 1550300741),
(9, '13-1', 0, 2, '13.jpg', '', '13', '2019-02-16 06:16:59', 0, 6, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIxMy5qcGciLCJ3aWR0aCI6NzI3LCJoZWlnaHQiOjQ3NCwiZ2VuZXJhdGVkIjoiMC4xMjQwOTIwMCAxNTUwMjk3ODE5In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo3MjcsImhlaWdodCI6NDc0LCJzYXZlZCI6dHJ1ZSwibWQ1IjoiNDM5ZmNhYWUyN2ViZDczY2VmMDQyOGUyMGUyZjUyNWIiLCJmdWxsIjp7IndpZHRoIjo3MjcsImhlaWdodCI6NDc0LCJtZDUiOiI0MzlmY2FhZTI3ZWJkNzNjZWYwNDI4ZTIwZTJmNTI1YiJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzXzEzLmpwZyIsImdlbmVyYXRlZCI6IjAuMzg1Mjg0MDAgMTU1MDI5NzgxOSJ9fQ==', 177, 1550297819),
(10, '16', 0, 2, '16.jpg', '', '16', '2002-12-08 12:00:00', 0, 3, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIxNi5qcGciLCJ3aWR0aCI6NzIwLCJoZWlnaHQiOjU0MCwiZ2VuZXJhdGVkIjoiMC42MDczMjkwMCAxNTUwMjk3ODIwIn0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjoiMjAxNDgxOCIsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6MTAzOTM0ODgwMCwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjoiMy44NSBtbSIsImlzbyI6MzAwLCJzaHV0dGVyX3NwZWVkIjoiMVwvMzAgc2VjIiwiZmxhc2giOiJGaXJlZCIsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6NzIwLCJoZWlnaHQiOjU0MCwic2F2ZWQiOnRydWUsIm1kNSI6ImIyOTFlOGNkZjc2MTMzMjAyMTFlMjVkNDVhNGUxNzM3IiwiZnVsbCI6eyJ3aWR0aCI6NzIwLCJoZWlnaHQiOjU0MCwibWQ1IjoiYjI5MWU4Y2RmNzYxMzMyMDIxMWUyNWQ0NWE0ZTE3MzcifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic18xNi5qcGciLCJnZW5lcmF0ZWQiOiIwLjAzOTAwMTAwIDE1NTAyOTc4MjEifX0=', 178, 1550297821),
(11, '17', 0, 2, '17.jpg', '', '17', '2002-12-08 12:00:00', 0, 4, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIxNy5qcGciLCJ3aWR0aCI6NzIwLCJoZWlnaHQiOjU0MCwiZ2VuZXJhdGVkIjoiMC41OTg0ODcwMCAxNTUwMjk3ODI2In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjoiMjAxNDgxOCIsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6MTAzOTM0ODgwMCwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjoiMy44NSBtbSIsImlzbyI6ODAwLCJzaHV0dGVyX3NwZWVkIjoiMVwvMzAgc2VjIiwiZmxhc2giOiJGaXJlZCIsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6NzIwLCJoZWlnaHQiOjU0MCwic2F2ZWQiOnRydWUsIm1kNSI6ImEyNGM0ODM4NmY4NDYyMWRkOGU1YzNhNjQ2MTdkZGYxIiwiZnVsbCI6eyJ3aWR0aCI6NzIwLCJoZWlnaHQiOjU0MCwibWQ1IjoiYTI0YzQ4Mzg2Zjg0NjIxZGQ4ZTVjM2E2NDYxN2RkZjEifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic18xNy5qcGciLCJnZW5lcmF0ZWQiOiIwLjg4NzE0MzAwIDE1NTAyOTc4MjYifX0=', 179, 1550297826),
(12, '21', 0, 2, '21.jpg', '', '21', '2002-12-08 12:00:00', 0, 1, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIyMS5qcGciLCJ3aWR0aCI6NzIwLCJoZWlnaHQiOjU0MCwiZ2VuZXJhdGVkIjoiMC4xNTI5MjYwMCAxNTUwMjk3ODMwIn0sImFwZXJ0dXJlIjoiRiAyLjIiLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOiJBMzdmIiwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjoxMDM5MzQ4ODAwLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOiIzLjYgbW0iLCJpc28iOjQwNywic2h1dHRlcl9zcGVlZCI6IjFcLzMwIHNlYyIsImZsYXNoIjoiTm90IGZpcmVkIiwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo3MjAsImhlaWdodCI6NTQwLCJzYXZlZCI6dHJ1ZSwibWQ1IjoiODFiMWE4Y2Y4Zjg3OWM2YWU0MGMyNGYzZTRiMzliNzgiLCJmdWxsIjp7IndpZHRoIjo3MjAsImhlaWdodCI6NTQwLCJtZDUiOiI4MWIxYThjZjhmODc5YzZhZTQwYzI0ZjNlNGIzOWI3OCJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzXzIxLmpwZyIsImdlbmVyYXRlZCI6IjAuNDYyMzIyMDAgMTU1MDI5NzgzMCJ9fQ==', 180, 1550297830),
(13, '22', 0, 2, '22.jpg', '', '22', '2002-12-08 12:00:00', 0, 5, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIyMi5qcGciLCJ3aWR0aCI6NzIwLCJoZWlnaHQiOjU0MCwiZ2VuZXJhdGVkIjoiMC41NjA0NTEwMCAxNTUwMjk3ODMxIn0sImFwZXJ0dXJlIjoiRiAyLjIiLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOiJBMzdmIiwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjoxMDM5MzQ4ODAwLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOiIzLjYgbW0iLCJpc28iOjIxMSwic2h1dHRlcl9zcGVlZCI6IjFcLzMwIHNlYyIsImZsYXNoIjoiTm90IGZpcmVkIiwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo3MjAsImhlaWdodCI6NTQwLCJzYXZlZCI6dHJ1ZSwibWQ1IjoiNzQ2YjlkN2U1ZjgwM2Q2YmUzOTA3YjdmNWIzODg0MDUiLCJmdWxsIjp7IndpZHRoIjo3MjAsImhlaWdodCI6NTQwLCJtZDUiOiI3NDZiOWQ3ZTVmODAzZDZiZTM5MDdiN2Y1YjM4ODQwNSJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzXzIyLmpwZyIsImdlbmVyYXRlZCI6IjAuNzk5NDk4MDAgMTU1MDI5NzgzMSJ9fQ==', 181, 1550297831),
(14, 'class2', 0, 2, 'class2.JPG', '', 'class2', '2019-02-07 10:32:10', 0, 2, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJjbGFzczIuSlBHIiwid2lkdGgiOjMyOTYsImhlaWdodCI6MjQ3MiwiZ2VuZXJhdGVkIjoiMC4xODk2NDcwMCAxNTUwMjk3ODM2In0sImFwZXJ0dXJlIjoiRiAyLjciLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOiJLT0RBSyBFQVNZU0hBUkUgQzgxMyBaT09NIERJR0lUQUwgQ0FNRVJBIiwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjoxNTQ5NTM1NTMwLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOiI2IG1tIiwiaXNvIjo4MDAsInNodXR0ZXJfc3BlZWQiOiIxXC82MCBzZWMiLCJmbGFzaCI6IkZpcmVkIiwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjoxNjAwLCJoZWlnaHQiOjEyMDAsInNhdmVkIjp0cnVlLCJtZDUiOiJmNzlmNTI1MDYwZmNjYTIyNzI5NmY2N2NjNzc3ZmU3YSIsImZ1bGwiOnsid2lkdGgiOjE2MDAsImhlaWdodCI6MTIwMCwibWQ1IjoiZjc5ZjUyNTA2MGZjY2EyMjcyOTZmNjdjYzc3N2ZlN2EifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19jbGFzczIuSlBHIiwiZ2VuZXJhdGVkIjoiMC43NzE0ODcwMCAxNTUwMjk3ODM3In19', 182, 1550297837),
(15, 'class-1', 0, 2, 'class-1.JPG', '', 'class 1', '2019-02-07 10:37:01', 0, 7, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJjbGFzcy0xLkpQRyIsIndpZHRoIjozMjk2LCJoZWlnaHQiOjI0NzIsImdlbmVyYXRlZCI6IjAuODYxNDMzMDAgMTU1MDI5Nzg0MSJ9LCJhcGVydHVyZSI6IkYgMi43IiwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjoiS09EQUsgRUFTWVNIQVJFIEM4MTMgWk9PTSBESUdJVEFMIENBTUVSQSIsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6MTU0OTUzNTgyMSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjoiNiBtbSIsImlzbyI6MjAwLCJzaHV0dGVyX3NwZWVkIjoiMVwvMTAgc2VjIiwiZmxhc2giOiJOb3QgZmlyZWQiLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwid2lkdGgiOjE2MDAsImhlaWdodCI6MTIwMCwic2F2ZWQiOnRydWUsIm1kNSI6ImMxMTBlMGQ0ZDhkYzgxZmQwNDE4Y2Y0ZThkYzg5ZGFmIiwiZnVsbCI6eyJ3aWR0aCI6MTYwMCwiaGVpZ2h0IjoxMjAwLCJtZDUiOiJjMTEwZTBkNGQ4ZGM4MWZkMDQxOGNmNGU4ZGM4OWRhZiJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX2NsYXNzLTEuSlBHIiwiZ2VuZXJhdGVkIjoiMC44MDQ1NTEwMCAxNTUwMjk3ODQyIn19', 183, 1550297842),
(16, 'practical-fitter', 0, 2, 'practical-Fitter.jpg', '', 'practical Fitter', '2019-02-07 15:04:50', 0, 8, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJwcmFjdGljYWwtRml0dGVyLmpwZyIsIndpZHRoIjo4MDAsImhlaWdodCI6NjAwLCJnZW5lcmF0ZWQiOiIwLjUxNjU3MzAwIDE1NTAyOTc4NDMifSwiYXBlcnR1cmUiOiJGIDIuMiIsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6IlJlZG1pIFkyIiwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjoxNTQ5NTUxODkwLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOiIzLjg0IG1tIiwiaXNvIjo1MDAsInNodXR0ZXJfc3BlZWQiOiIxXC8zMCBzZWMiLCJmbGFzaCI6Ik5vdCBmaXJlZCIsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6ODAwLCJoZWlnaHQiOjYwMCwic2F2ZWQiOnRydWUsIm1kNSI6IjFlNTlmNDhlM2QxOWYyOWI1OTM0MjZhOTJmOWI5NjRjIiwiZnVsbCI6eyJ3aWR0aCI6ODAwLCJoZWlnaHQiOjYwMCwibWQ1IjoiMWU1OWY0OGUzZDE5ZjI5YjU5MzQyNmE5MmY5Yjk2NGMifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19wcmFjdGljYWwtRml0dGVyLmpwZyIsImdlbmVyYXRlZCI6IjAuNjU2NTA4MDAgMTU1MDI5Nzg0MyJ9fQ==', 184, 1550297843),
(18, 'img-20180327-wa0067', 0, 3, 'IMG-20180327-WA0067.jpg', '', 'IMG-20180327-WA0067', '2019-02-16 06:38:44', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJJTUctMjAxODAzMjctV0EwMDY3LmpwZyIsIndpZHRoIjoxMjgwLCJoZWlnaHQiOjcyMCwiZ2VuZXJhdGVkIjoiMC44MjYyOTEwMCAxNTUwMjk5MTI0In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjoxMjgwLCJoZWlnaHQiOjcyMCwic2F2ZWQiOnRydWUsIm1kNSI6ImM0OTIzYjVhODUwNTg3OGQ2ZTY5ZmViMGI4ZDJlZDA4IiwiZnVsbCI6eyJ3aWR0aCI6MTI4MCwiaGVpZ2h0Ijo3MjAsIm1kNSI6ImM0OTIzYjVhODUwNTg3OGQ2ZTY5ZmViMGI4ZDJlZDA4In0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfSU1HLTIwMTgwMzI3LVdBMDA2Ny5qcGciLCJnZW5lcmF0ZWQiOiIwLjExMjQxNzAwIDE1NTAyOTkxMjUifX0=', 194, 1550300741),
(19, 'e-learning', 0, 3, 'E-learning.jpg', '', 'E learning', '2019-02-16 06:38:45', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJFLWxlYXJuaW5nLmpwZyIsIndpZHRoIjoxMjgwLCJoZWlnaHQiOjk2MCwiZ2VuZXJhdGVkIjoiMC45Mjg3NDYwMCAxNTUwMjk5MTI1In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjoxMjgwLCJoZWlnaHQiOjk2MCwic2F2ZWQiOnRydWUsIm1kNSI6IjdiM2NkMGY4YmE0NDMyNTdmYzEyZDRhY2MxNmY4ODQ5IiwiZnVsbCI6eyJ3aWR0aCI6MTI4MCwiaGVpZ2h0Ijo5NjAsIm1kNSI6IjdiM2NkMGY4YmE0NDMyNTdmYzEyZDRhY2MxNmY4ODQ5In0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfRS1sZWFybmluZy5qcGciLCJnZW5lcmF0ZWQiOiIwLjM2NDc0MDAwIDE1NTAyOTkxMjYifX0=', 195, 1550300741),
(20, 'khel1', 0, 3, 'khel1.jpg', '', 'khel1', '2019-02-07 15:31:56', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJraGVsMS5qcGciLCJ3aWR0aCI6ODAwLCJoZWlnaHQiOjYwMCwiZ2VuZXJhdGVkIjoiMC4xMjc3MjAwMCAxNTUwMjk5MTI3In0sImFwZXJ0dXJlIjoiRiAyLjIiLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOiJSZWRtaSBZMiIsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6MTU0OTU1MzUxNiwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjoiMy44NCBtbSIsImlzbyI6MTAwLCJzaHV0dGVyX3NwZWVkIjoiMVwvMTY3MCBzZWMiLCJmbGFzaCI6Ik5vdCBmaXJlZCIsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6ODAwLCJoZWlnaHQiOjYwMCwic2F2ZWQiOnRydWUsIm1kNSI6ImE2ZDFjYmE2MjVmZTY1ODBmMDI4ZTBmODdhY2Q5ZjhjIiwiZnVsbCI6eyJ3aWR0aCI6ODAwLCJoZWlnaHQiOjYwMCwibWQ1IjoiYTZkMWNiYTYyNWZlNjU4MGYwMjhlMGY4N2FjZDlmOGMifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19raGVsMS5qcGciLCJnZW5lcmF0ZWQiOiIwLjM2NjQ3ODAwIDE1NTAyOTkxMjcifX0=', 196, 1550300741),
(21, 'khel', 0, 3, 'khel.jpg', '', 'khel', '2019-02-07 15:31:56', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJraGVsLmpwZyIsIndpZHRoIjo4MDAsImhlaWdodCI6NjAwLCJnZW5lcmF0ZWQiOiIwLjc3NDc5NDAwIDE1NTAyOTkxMjgifSwiYXBlcnR1cmUiOiJGIDIuMiIsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6IlJlZG1pIFkyIiwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjoxNTQ5NTUzNTE2LCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOiIzLjg0IG1tIiwiaXNvIjoxMDAsInNodXR0ZXJfc3BlZWQiOiIxXC8xNjcwIHNlYyIsImZsYXNoIjoiTm90IGZpcmVkIiwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo4MDAsImhlaWdodCI6NjAwLCJzYXZlZCI6dHJ1ZSwibWQ1IjoiYTZkMWNiYTYyNWZlNjU4MGYwMjhlMGY4N2FjZDlmOGMiLCJmdWxsIjp7IndpZHRoIjo4MDAsImhlaWdodCI6NjAwLCJtZDUiOiJhNmQxY2JhNjI1ZmU2NTgwZjAyOGUwZjg3YWNkOWY4YyJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX2toZWwuanBnIiwiZ2VuZXJhdGVkIjoiMC4wMDE4NzQwMCAxNTUwMjk5MTI5In19', 197, 1550300741),
(22, 'poojan', 0, 3, 'poojan.JPG', '', 'poojan', '2017-09-16 20:51:30', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJwb29qYW4uSlBHIiwid2lkdGgiOjkwMywiaGVpZ2h0Ijo2MDAsImdlbmVyYXRlZCI6IjAuNzQ5OTYwMDAgMTU1MDI5OTEzMCJ9LCJhcGVydHVyZSI6IkYgNi4zIiwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjoiTklLT04gRDkwIiwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjoxNTA1NTk1MDkwLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOiIyNSBtbSIsImlzbyI6MTYwMCwic2h1dHRlcl9zcGVlZCI6IjFcLzEzMCBzZWMiLCJmbGFzaCI6IkZpcmVkIiwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo5MDMsImhlaWdodCI6NjAwLCJzYXZlZCI6dHJ1ZSwibWQ1IjoiNTg5NTRhMzA2NTViNDExYmI4YWFmMmNjMmRlNzljMGEiLCJmdWxsIjp7IndpZHRoIjo5MDMsImhlaWdodCI6NjAwLCJtZDUiOiI1ODk1NGEzMDY1NWI0MTFiYjhhYWYyY2MyZGU3OWMwYSJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3Bvb2phbi5KUEciLCJnZW5lcmF0ZWQiOiIwLjQ2NzM3MDAwIDE1NTAyOTkxMzEifX0=', 198, 1550300741),
(23, 'vishwakarma-pujan', 0, 3, 'vishwakarma-pujan.JPG', '', 'vishwakarma pujan', '2017-09-16 20:48:20', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJ2aXNod2FrYXJtYS1wdWphbi5KUEciLCJ3aWR0aCI6OTAzLCJoZWlnaHQiOjYwMCwiZ2VuZXJhdGVkIjoiMC40MTYwNzYwMCAxNTUwMjk5MTMzIn0sImFwZXJ0dXJlIjoiRiA2LjMiLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOiJOSUtPTiBEOTAiLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOjE1MDU1OTQ5MDAsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6IjUwIG1tIiwiaXNvIjoxNjAwLCJzaHV0dGVyX3NwZWVkIjoiMVwvMTMwIHNlYyIsImZsYXNoIjoiRmlyZWQiLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwid2lkdGgiOjkwMywiaGVpZ2h0Ijo2MDAsInNhdmVkIjp0cnVlLCJtZDUiOiJlMmFjNDUzMzkzMTRjMmI3ZjQ5YzJkMWNjYzM0ODc3ZCIsImZ1bGwiOnsid2lkdGgiOjkwMywiaGVpZ2h0Ijo2MDAsIm1kNSI6ImUyYWM0NTMzOTMxNGMyYjdmNDljMmQxY2NjMzQ4NzdkIn0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfdmlzaHdha2FybWEtcHVqYW4uSlBHIiwiZ2VuZXJhdGVkIjoiMC44MzMyMDEwMCAxNTUwMjk5MTMzIn19', 199, 1550300741),
(24, 'staff', 0, 4, 'staff.JPG', '', 'staff', '2019-02-07 10:50:42', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzdGFmZi5KUEciLCJ3aWR0aCI6MzI5NiwiaGVpZ2h0IjoyNDcyLCJnZW5lcmF0ZWQiOiIwLjI0MDU4MDAwIDE1NTAzMDEzNDAifSwiYXBlcnR1cmUiOiJGIDIuNyIsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6IktPREFLIEVBU1lTSEFSRSBDODEzIFpPT00gRElHSVRBTCBDQU1FUkEiLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOjE1NDk1MzY2NDIsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6IjYgbW0iLCJpc28iOjgwLCJzaHV0dGVyX3NwZWVkIjoiMVwvMTEwIHNlYyIsImZsYXNoIjoiTm90IGZpcmVkIiwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjoxNjAwLCJoZWlnaHQiOjEyMDAsInNhdmVkIjp0cnVlLCJtZDUiOiJmMTY1ZWY0OWQyYjkyZTc0ZWI1NDRmMTk0Y2Q2ZDI2YSIsImZ1bGwiOnsid2lkdGgiOjE2MDAsImhlaWdodCI6MTIwMCwibWQ1IjoiZjE2NWVmNDlkMmI5MmU3NGViNTQ0ZjE5NGNkNmQyNmEifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zdGFmZi5KUEciLCJnZW5lcmF0ZWQiOiIwLjExNDE0ODAwIDE1NTAzMDEzNDcifX0=', 204, 1550301381),
(25, 'staff-meeting', 0, 4, 'staff-meeting.JPG', '', 'staff meeting', '2019-02-07 10:54:37', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzdGFmZi1tZWV0aW5nLkpQRyIsIndpZHRoIjozMjk2LCJoZWlnaHQiOjI0NzIsImdlbmVyYXRlZCI6IjAuODM2NTE0MDAgMTU1MDMwMTM0OSJ9LCJhcGVydHVyZSI6IkYgMi43IiwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjoiS09EQUsgRUFTWVNIQVJFIEM4MTMgWk9PTSBESUdJVEFMIENBTUVSQSIsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6MTU0OTUzNjg3NywiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjoiNiBtbSIsImlzbyI6ODAwLCJzaHV0dGVyX3NwZWVkIjoiMVwvNjAgc2VjIiwiZmxhc2giOiJGaXJlZCIsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6MTYwMCwiaGVpZ2h0IjoxMjAwLCJzYXZlZCI6dHJ1ZSwibWQ1IjoiM2FlOGEyMGI4YTdhNTNjNzU5NjhlNzQ5MGRhMWExMzQiLCJmdWxsIjp7IndpZHRoIjoxNjAwLCJoZWlnaHQiOjEyMDAsIm1kNSI6IjNhZThhMjBiOGE3YTUzYzc1OTY4ZTc0OTBkYTFhMTM0In0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfc3RhZmYtbWVldGluZy5KUEciLCJnZW5lcmF0ZWQiOiIwLjY4MDEzOTAwIDE1NTAzMDEzNTAifX0=', 205, 1550301381),
(26, 'screenshot-from-2019-02-16-12-53-55', 0, 1, 'Screenshot-from-2019-02-16-12-53-55.png', '', 'Screenshot from 2019-02-16 12-53-55', '2019-02-16 14:05:42', 0, 1, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJTY3JlZW5zaG90LWZyb20tMjAxOS0wMi0xNi0xMi01My01NS5wbmciLCJ3aWR0aCI6MTYwMCwiaGVpZ2h0Ijo5MDAsImdlbmVyYXRlZCI6IjAuNjM1MTAzMDAgMTU1MDMyNTk0MiJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6MTYwMCwiaGVpZ2h0Ijo5MDAsInNhdmVkIjp0cnVlLCJtZDUiOiI3MWE5ZWUwNzY5ZWZjZmZmNjk5NDVjN2RmOWMzNzBmZSIsImZ1bGwiOnsid2lkdGgiOjE2MDAsImhlaWdodCI6OTAwLCJtZDUiOiI3MWE5ZWUwNzY5ZWZjZmZmNjk5NDVjN2RmOWMzNzBmZSJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX1NjcmVlbnNob3QtZnJvbS0yMDE5LTAyLTE2LTEyLTUzLTU1LnBuZyIsImdlbmVyYXRlZCI6IjAuMjk4NTc1MDAgMTU1MDMyNTk0NSJ9fQ==', 224, 1550325945),
(27, 'iti-greenary', 0, 1, 'ITI-greenary.jpg', '', 'ITI greenary', '2012-09-01 10:42:20', 0, 3, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJJVEktZ3JlZW5hcnkuanBnIiwid2lkdGgiOjE1MzYsImhlaWdodCI6MjA0OCwiZ2VuZXJhdGVkIjoiMC4zNDQxNDgwMCAxNTUwMzI1OTgwIn0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjoiNzIzMCIsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6MTM0NjQ5NjE0MCwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo5MDAsImhlaWdodCI6MTIwMCwic2F2ZWQiOnRydWUsIm1kNSI6IjcyY2IzOWI5OTA1NTIxM2NjYTVlNTA1NzBjYzY3YjM0IiwiZnVsbCI6eyJ3aWR0aCI6OTAwLCJoZWlnaHQiOjEyMDAsIm1kNSI6IjcyY2IzOWI5OTA1NTIxM2NjYTVlNTA1NzBjYzY3YjM0In0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfSVRJLWdyZWVuYXJ5LmpwZyIsImdlbmVyYXRlZCI6IjAuODQxNTczMDAgMTU1MDMyNTk4MyJ9fQ==', 225, 1550325983);

-- --------------------------------------------------------

--
-- Table structure for table `iti_options`
--

CREATE TABLE `iti_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_options`
--

INSERT INTO `iti_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'https://www.nutaniti.com', 'yes'),
(2, 'home', 'https://www.nutaniti.com', 'yes'),
(3, 'blogname', 'Nutan ITI', 'yes'),
(4, 'blogdescription', 'Nutan ITI Chinawal', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'rahulbhangale26@gmail.com', 'yes'),
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
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:212:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\"ngg_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?ngg_tag=$matches[1]&feed=$matches[2]\";s:43:\"ngg_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?ngg_tag=$matches[1]&feed=$matches[2]\";s:24:\"ngg_tag/([^/]+)/embed/?$\";s:40:\"index.php?ngg_tag=$matches[1]&embed=true\";s:36:\"ngg_tag/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?ngg_tag=$matches[1]&paged=$matches[2]\";s:18:\"ngg_tag/([^/]+)/?$\";s:29:\"index.php?ngg_tag=$matches[1]\";s:37:\"ngg_album/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"ngg_album/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"ngg_album/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"ngg_album/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"ngg_album/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"ngg_album/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"ngg_album/([^/]+)/embed/?$\";s:42:\"index.php?ngg_album=$matches[1]&embed=true\";s:30:\"ngg_album/([^/]+)/trackback/?$\";s:36:\"index.php?ngg_album=$matches[1]&tb=1\";s:38:\"ngg_album/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?ngg_album=$matches[1]&paged=$matches[2]\";s:45:\"ngg_album/([^/]+)/comment-page-([0-9]{1,})/?$\";s:49:\"index.php?ngg_album=$matches[1]&cpage=$matches[2]\";s:34:\"ngg_album/([^/]+)(?:/([0-9]+))?/?$\";s:48:\"index.php?ngg_album=$matches[1]&page=$matches[2]\";s:26:\"ngg_album/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:36:\"ngg_album/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:56:\"ngg_album/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"ngg_album/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"ngg_album/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:32:\"ngg_album/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:39:\"ngg_gallery/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:49:\"ngg_gallery/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:69:\"ngg_gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"ngg_gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"ngg_gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:45:\"ngg_gallery/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:28:\"ngg_gallery/([^/]+)/embed/?$\";s:44:\"index.php?ngg_gallery=$matches[1]&embed=true\";s:32:\"ngg_gallery/([^/]+)/trackback/?$\";s:38:\"index.php?ngg_gallery=$matches[1]&tb=1\";s:40:\"ngg_gallery/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?ngg_gallery=$matches[1]&paged=$matches[2]\";s:47:\"ngg_gallery/([^/]+)/comment-page-([0-9]{1,})/?$\";s:51:\"index.php?ngg_gallery=$matches[1]&cpage=$matches[2]\";s:36:\"ngg_gallery/([^/]+)(?:/([0-9]+))?/?$\";s:50:\"index.php?ngg_gallery=$matches[1]&page=$matches[2]\";s:28:\"ngg_gallery/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:38:\"ngg_gallery/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:58:\"ngg_gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"ngg_gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"ngg_gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:34:\"ngg_gallery/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:40:\"ngg_pictures/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"ngg_pictures/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"ngg_pictures/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"ngg_pictures/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"ngg_pictures/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"ngg_pictures/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"ngg_pictures/([^/]+)/embed/?$\";s:45:\"index.php?ngg_pictures=$matches[1]&embed=true\";s:33:\"ngg_pictures/([^/]+)/trackback/?$\";s:39:\"index.php?ngg_pictures=$matches[1]&tb=1\";s:41:\"ngg_pictures/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?ngg_pictures=$matches[1]&paged=$matches[2]\";s:48:\"ngg_pictures/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?ngg_pictures=$matches[1]&cpage=$matches[2]\";s:37:\"ngg_pictures/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?ngg_pictures=$matches[1]&page=$matches[2]\";s:29:\"ngg_pictures/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"ngg_pictures/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"ngg_pictures/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"ngg_pictures/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"ngg_pictures/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"ngg_pictures/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:44:\"lightbox_library/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:54:\"lightbox_library/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:74:\"lightbox_library/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:69:\"lightbox_library/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:69:\"lightbox_library/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:50:\"lightbox_library/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:33:\"lightbox_library/([^/]+)/embed/?$\";s:49:\"index.php?lightbox_library=$matches[1]&embed=true\";s:37:\"lightbox_library/([^/]+)/trackback/?$\";s:43:\"index.php?lightbox_library=$matches[1]&tb=1\";s:45:\"lightbox_library/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?lightbox_library=$matches[1]&paged=$matches[2]\";s:52:\"lightbox_library/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?lightbox_library=$matches[1]&cpage=$matches[2]\";s:41:\"lightbox_library/([^/]+)(?:/([0-9]+))?/?$\";s:55:\"index.php?lightbox_library=$matches[1]&page=$matches[2]\";s:33:\"lightbox_library/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"lightbox_library/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"lightbox_library/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"lightbox_library/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"lightbox_library/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"lightbox_library/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:45:\"displayed_gallery/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:55:\"displayed_gallery/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:75:\"displayed_gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"displayed_gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"displayed_gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"displayed_gallery/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"displayed_gallery/([^/]+)/embed/?$\";s:50:\"index.php?displayed_gallery=$matches[1]&embed=true\";s:38:\"displayed_gallery/([^/]+)/trackback/?$\";s:44:\"index.php?displayed_gallery=$matches[1]&tb=1\";s:46:\"displayed_gallery/([^/]+)/page/?([0-9]{1,})/?$\";s:57:\"index.php?displayed_gallery=$matches[1]&paged=$matches[2]\";s:53:\"displayed_gallery/([^/]+)/comment-page-([0-9]{1,})/?$\";s:57:\"index.php?displayed_gallery=$matches[1]&cpage=$matches[2]\";s:42:\"displayed_gallery/([^/]+)(?:/([0-9]+))?/?$\";s:56:\"index.php?displayed_gallery=$matches[1]&page=$matches[2]\";s:34:\"displayed_gallery/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"displayed_gallery/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"displayed_gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"displayed_gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"displayed_gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"displayed_gallery/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:40:\"display_type/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"display_type/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"display_type/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"display_type/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"display_type/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"display_type/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"display_type/([^/]+)/embed/?$\";s:45:\"index.php?display_type=$matches[1]&embed=true\";s:33:\"display_type/([^/]+)/trackback/?$\";s:39:\"index.php?display_type=$matches[1]&tb=1\";s:41:\"display_type/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?display_type=$matches[1]&paged=$matches[2]\";s:48:\"display_type/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?display_type=$matches[1]&cpage=$matches[2]\";s:37:\"display_type/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?display_type=$matches[1]&page=$matches[2]\";s:29:\"display_type/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"display_type/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"display_type/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"display_type/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"display_type/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"display_type/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:46:\"gal_display_source/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:56:\"gal_display_source/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:76:\"gal_display_source/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:71:\"gal_display_source/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:71:\"gal_display_source/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:52:\"gal_display_source/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:35:\"gal_display_source/([^/]+)/embed/?$\";s:51:\"index.php?gal_display_source=$matches[1]&embed=true\";s:39:\"gal_display_source/([^/]+)/trackback/?$\";s:45:\"index.php?gal_display_source=$matches[1]&tb=1\";s:47:\"gal_display_source/([^/]+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?gal_display_source=$matches[1]&paged=$matches[2]\";s:54:\"gal_display_source/([^/]+)/comment-page-([0-9]{1,})/?$\";s:58:\"index.php?gal_display_source=$matches[1]&cpage=$matches[2]\";s:43:\"gal_display_source/([^/]+)(?:/([0-9]+))?/?$\";s:57:\"index.php?gal_display_source=$matches[1]&page=$matches[2]\";s:35:\"gal_display_source/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"gal_display_source/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"gal_display_source/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"gal_display_source/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"gal_display_source/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"gal_display_source/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=2&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:9:{i:0;s:25:\"user-menus/user-menus.php\";i:1;s:19:\"akismet/akismet.php\";i:2;s:36:\"contact-form-7/wp-contact-form-7.php\";i:3;s:45:\"contact-form-entries/contact-form-entries.php\";i:4;s:29:\"gmap-embed/srm_gmap_embed.php\";i:5;s:25:\"profile-builder/index.php\";i:6;s:17:\"wp-mobi/index.php\";i:7;s:31:\"wpschoolpress/wpschoolpress.php\";i:8;s:29:\"nextgen-gallery/nggallery.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:91:\"/home/nutaniti/public_html/wp-content/plugins/contact-form-entries/contact-form-entries.php\";i:1;s:92:\"/home/nutaniti/public_html/wp-content/plugins/contact-form-entries/includes/plugin-pages.php\";i:3;s:65:\"/home/nutaniti/public_html/wp-content/plugins/akismet/akismet.php\";i:4;s:86:\"/home/nutaniti/public_html/wp-content/plugins/contact-form-entries/templates/leads.php\";i:5;s:92:\"/home/nutaniti/public_html/wp-content/plugins/contact-form-entries/templates/leads-table.php\";}', 'no'),
(40, 'template', 'education-zone', 'yes'),
(41, 'stylesheet', 'school-zone', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '1', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '43764', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
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
(69, 'close_comments_for_old_posts', '1', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:4:{i:1;a:0:{}i:2;a:4:{s:5:\"title\";s:8:\"Location\";s:4:\"text\";s:20:\"[gmap-embed id=\"98\"]\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:12:\"Quick Links:\";s:4:\"text\";s:127:\"<a href=\"https://admission.dvet.gov.in/assets/Attachments/PDF/ITI%20Admission%20-%20Brochure%202018.pdf\">Admission Brochure</a>\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:41:\"google-maps-widget/google-maps-widget.php\";a:2:{i:0;s:3:\"GMW\";i:1;s:9:\"uninstall\";}}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '2', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '13', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '', 'yes'),
(93, 'initial_db_version', '43764', 'yes'),
(94, 'iti_user_roles', 'a:4:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:87:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:22:\"wl_im_manage_dashboard\";b:1;s:20:\"wl_im_manage_courses\";b:1;s:20:\"wl_im_manage_batches\";b:1;s:22:\"wl_im_manage_enquiries\";b:1;s:21:\"wl_im_manage_students\";b:1;s:17:\"wl_im_manage_fees\";b:1;s:27:\"wl_im_manage_administrators\";b:1;s:21:\"wl_im_manage_settings\";b:1;s:24:\"NextGEN Gallery overview\";b:1;s:19:\"NextGEN Use TinyMCE\";b:1;s:21:\"NextGEN Upload images\";b:1;s:22:\"NextGEN Manage gallery\";b:1;s:19:\"NextGEN Manage tags\";b:1;s:29:\"NextGEN Manage others gallery\";b:1;s:18:\"NextGEN Edit album\";b:1;s:20:\"NextGEN Change style\";b:1;s:22:\"NextGEN Change options\";b:1;s:24:\"NextGEN Attach Interface\";b:1;s:23:\"vxcf_leads_read_entries\";b:1;s:23:\"vxcf_leads_read_license\";b:1;s:24:\"vxcf_leads_read_settings\";b:1;s:23:\"vxcf_leads_edit_entries\";b:1;s:24:\"vxcf_leads_edit_settings\";b:1;s:24:\"vx_crmperks_view_plugins\";b:1;s:23:\"vx_crmperks_view_addons\";b:1;s:23:\"vx_crmperks_edit_addons\";b:1;}}s:7:\"teacher\";a:2:{s:4:\"name\";s:7:\"Teacher\";s:12:\"capabilities\";a:6:{s:11:\"add_student\";b:1;s:11:\"upload_mark\";b:1;s:16:\"attendance_entry\";b:1;s:4:\"read\";b:1;s:10:\"edit_posts\";b:1;s:12:\"upload_files\";b:1;}}s:7:\"student\";a:2:{s:4:\"name\";s:7:\"Student\";s:12:\"capabilities\";a:4:{s:12:\"send_message\";b:1;s:4:\"read\";b:1;s:10:\"edit_posts\";b:1;s:12:\"upload_files\";b:0;}}s:6:\"parent\";a:2:{s:4:\"name\";s:6:\"Parent\";s:12:\"capabilities\";a:4:{s:12:\"send_message\";b:1;s:4:\"read\";b:1;s:10:\"edit_posts\";b:1;s:12:\"upload_files\";b:1;}}}', 'yes'),
(1352, 'plugin_error', '', 'yes'),
(1354, 'wpsp_remove_data', '1', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:6:{s:19:\"wp_inactive_widgets\";a:10:{i:0;s:10:\"archives-2\";i:1;s:15:\"media_gallery-3\";i:2;s:15:\"media_gallery-5\";i:3;s:6:\"meta-2\";i:4;s:8:\"search-2\";i:5;s:6:\"text-2\";i:6;s:12:\"categories-2\";i:7;s:14:\"recent-posts-2\";i:8;s:17:\"recent-comments-2\";i:9;s:16:\"srmgmap_widget-3\";}s:13:\"right-sidebar\";a:1:{i:0;s:6:\"text-3\";}s:10:\"footer-one\";a:0:{}s:10:\"footer-two\";a:0:{}s:12:\"footer-three\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:2:{s:12:\"_multiwidget\";i:1;i:3;a:15:{s:13:\"attachment_id\";i:425;s:3:\"url\";s:99:\"https://www.nutaniti.com/wp-content/uploads/2020/05/e95b0f91-746b-48a1-9ce1-21082fd090f1-300x59.jpg\";s:5:\"title\";s:0:\"\";s:4:\"size\";s:6:\"medium\";s:5:\"width\";i:1221;s:6:\"height\";i:242;s:7:\"caption\";s:0:\"\";s:3:\"alt\";s:0:\"\";s:9:\"link_type\";s:6:\"custom\";s:8:\"link_url\";s:0:\"\";s:13:\"image_classes\";s:0:\"\";s:12:\"link_classes\";s:0:\"\";s:8:\"link_rel\";s:0:\"\";s:17:\"link_target_blank\";b:0;s:11:\"image_title\";s:0:\"\";}}', 'yes'),
(106, 'widget_media_gallery', 'a:3:{s:12:\"_multiwidget\";i:1;i:3;a:6:{s:5:\"title\";s:0:\"\";s:3:\"ids\";a:2:{i:0;i:6;i:1;i:13;}s:7:\"columns\";i:3;s:4:\"size\";s:9:\"thumbnail\";s:9:\"link_type\";s:4:\"post\";s:14:\"orderby_random\";b:0;}i:5;a:0:{}}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'cron', 'a:9:{i:1593858373;a:1:{s:29:\"ngg_delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"ngg_custom\";s:4:\"args\";a:0:{}s:8:\"interval\";i:900;}}}i:1593861581;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1593861589;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1593867206;a:1:{s:24:\"akismet_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1593877895;a:1:{s:29:\"akismet_schedule_cron_recheck\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1593880564;a:1:{s:28:\"fs_data_sync_nextgen-gallery\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1593883181;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1593883226;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(121, 'widget_wen-business-social', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(46462, 'wp_mobi_option', 'a:8:{s:6:\"app_id\";N;s:8:\"app_name\";s:9:\"Nutan ITI\";s:7:\"app_key\";s:34:\"$1$NJbMQ3Uk$dJ.KFnPc06teeBKTlrSf.0\";s:10:\"secret_key\";s:34:\"$1$fnuFLBcu$xBk7/xwHnnxCNQTUiAKRg0\";s:18:\"build_requested_on\";N;s:18:\"build_completed_on\";N;s:13:\"download_link\";N;s:16:\"launcher_icon_id\";s:2:\"13\";}', 'yes'),
(3668, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:25:\"rahulbhangale26@gmail.com\";s:7:\"version\";s:5:\"5.0.7\";s:9:\"timestamp\";i:1571116947;}', 'no'),
(571, 'enable_enquiry_form_title', 'yes', 'yes'),
(413, 'wpgl_zoom_level', '12', 'yes'),
(435, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(572, 'enquiry_form_title', 'Submit your Enquiry', 'yes'),
(116, 'theme_mods_twentynineteen', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(680, 'fs_api_cache', 'a:1:{s:55:\"get:/v1/users/1731078.json?plugin_id=266&fields=is_beta\";O:8:\"stdClass\":3:{s:6:\"result\";O:8:\"stdClass\":2:{s:2:\"id\";s:7:\"1731078\";s:7:\"is_beta\";b:0;}s:7:\"created\";i:1593794275;s:9:\"timestamp\";i:1593880675;}}', 'yes'),
(681, 'fs_gdpr', 'a:1:{s:2:\"u1\";a:2:{s:8:\"required\";b:0;s:18:\"show_opt_in_notice\";b:0;}}', 'yes'),
(684, 'widget_ngg-images', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(685, 'widget_ngg-mrssw', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(686, 'widget_slideshow', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(687, 'ngg_transient_groups', 'a:7:{s:9:\"__counter\";i:7;s:3:\"MVC\";a:2:{s:2:\"id\";i:2;s:7:\"enabled\";b:1;}s:16:\"col_in_iti_posts\";a:2:{s:2:\"id\";i:3;s:7:\"enabled\";b:1;}s:22:\"col_in_iti_ngg_gallery\";a:2:{s:2:\"id\";i:4;s:7:\"enabled\";b:1;}s:23:\"col_in_iti_ngg_pictures\";a:2:{s:2:\"id\";i:5;s:7:\"enabled\";b:1;}s:20:\"col_in_iti_ngg_album\";a:2:{s:2:\"id\";i:6;s:7:\"enabled\";b:1;}s:27:\"displayed_gallery_rendering\";a:2:{s:2:\"id\";i:7;s:7:\"enabled\";b:1;}}', 'yes'),
(122, 'widget_wen-business-advanced-text', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(123, 'widget_wen-business-call-to-action', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(124, 'widget_wen-business-featured-page', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(125, 'widget_wen-business-latest-news', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(126, 'widget_wen-business-testimonial', 'a:2:{s:12:\"_multiwidget\";i:1;i:3;a:12:{s:5:\"title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:13:\"post_category\";i:0;s:14:\"featured_image\";s:9:\"thumbnail\";s:11:\"post_number\";i:4;s:14:\"excerpt_length\";i:20;s:13:\"post_order_by\";s:4:\"date\";s:10:\"post_order\";s:4:\"desc\";s:16:\"transition_delay\";i:3;s:19:\"transition_duration\";i:1;s:13:\"disable_pager\";b:0;s:12:\"custom_class\";s:0:\"\";}}', 'yes'),
(127, 'widget_wen-business-service', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(128, 'widget_wen-business-latest-works', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(129, 'widget_wen-business-contact', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(130, 'theme_mods_wen-business', 'a:6:{s:18:\"custom_css_post_id\";i:384;s:13:\"theme_options\";a:13:{s:9:\"site_logo\";s:85:\"http://www.nutaniti.com/wp-content/uploads/2019/02/Logo-5.psd-Copy-e1549698174209.jpg\";s:12:\"site_favicon\";s:85:\"http://www.nutaniti.com/wp-content/uploads/2019/02/Logo-5.psd-Copy-e1549697946516.jpg\";s:18:\"site_web_clip_icon\";s:85:\"http://www.nutaniti.com/wp-content/uploads/2019/02/Logo-5.psd-Copy-e1549697946516.jpg\";s:16:\"social_in_header\";s:0:\"\";s:16:\"search_in_header\";s:0:\"\";s:22:\"featured_slider_status\";s:11:\"entire-site\";s:22:\"featured_slider_number\";i:5;s:24:\"featured_slider_category\";i:3;s:33:\"featured_slider_transition_effect\";s:10:\"scrollHorz\";s:30:\"featured_slider_enable_caption\";s:0:\"\";s:28:\"featured_slider_enable_pager\";s:0:\"\";s:28:\"featured_slider_enable_arrow\";s:1:\"1\";s:11:\"site_layout\";s:5:\"boxed\";}s:16:\"background_image\";s:0:\"\";s:16:\"background_color\";s:6:\"490204\";s:18:\"nav_menu_locations\";a:2:{s:6:\"footer\";i:0;s:7:\"primary\";i:7;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1590068059;s:4:\"data\";a:5:{s:19:\"wp_inactive_widgets\";a:11:{i:0;s:26:\"wen-business-testimonial-3\";i:1;s:10:\"archives-2\";i:2;s:15:\"media_gallery-3\";i:3;s:15:\"media_gallery-5\";i:4;s:6:\"meta-2\";i:5;s:8:\"search-2\";i:6;s:6:\"text-2\";i:7;s:12:\"categories-2\";i:8;s:14:\"recent-posts-2\";i:9;s:17:\"recent-comments-2\";i:10;s:16:\"srmgmap_widget-3\";}s:9:\"sidebar-1\";a:1:{i:0;s:6:\"text-3\";}s:9:\"sidebar-2\";a:0:{}s:30:\"sidebar-front-page-widget-area\";a:0:{}s:15:\"sidebar-contact\";a:0:{}}}}', 'yes'),
(136, 'can_compress_scripts', '1', 'no'),
(690, 'photocrati_auto_update_admin_update_list', '', 'yes'),
(691, 'photocrati_auto_update_admin_check_date', '', 'yes'),
(692, 'ngg_db_version', '1.8.1', 'yes'),
(695, 'pope_module_list', 'a:37:{i:0;s:19:\"photocrati-fs|3.0.0\";i:1;s:21:\"photocrati-i18n|3.1.6\";i:2;s:29:\"photocrati-validation|3.1.4.2\";i:3;s:23:\"photocrati-router|3.0.0\";i:4;s:34:\"photocrati-wordpress_routing|3.1.0\";i:5;s:25:\"photocrati-security|3.0.0\";i:6;s:33:\"photocrati-nextgen_settings|3.1.6\";i:7;s:20:\"photocrati-mvc|3.1.0\";i:8;s:21:\"photocrati-ajax|3.0.0\";i:9;s:29:\"photocrati-datamapper|3.1.4.2\";i:10;s:31:\"photocrati-nextgen-legacy|3.1.6\";i:11;s:32:\"photocrati-simple_html_dom|3.0.0\";i:12;s:29:\"photocrati-nextgen-data|3.1.6\";i:13;s:32:\"photocrati-nextgen_block|3.1.5.3\";i:14;s:35:\"photocrati-dynamic_thumbnails|3.0.0\";i:15;s:32:\"photocrati-nextgen_admin|3.1.4.2\";i:16;s:42:\"photocrati-nextgen_gallery_display|3.1.4.2\";i:17;s:36:\"photocrati-frame_communication|3.0.0\";i:18;s:33:\"photocrati-attach_to_post|3.1.4.2\";i:19;s:40:\"photocrati-nextgen_addgallery_page|3.0.0\";i:20;s:38:\"photocrati-nextgen_other_options|3.1.6\";i:21;s:37:\"photocrati-nextgen_pagination|3.0.0.2\";i:22;s:35:\"photocrati-dynamic_stylesheet|3.0.0\";i:23;s:36:\"photocrati-nextgen_pro_upgrade|3.0.0\";i:24;s:22:\"photocrati-cache|3.0.0\";i:25;s:25:\"photocrati-lightbox|3.0.0\";i:26;s:42:\"photocrati-nextgen_basic_templates|3.0.0.2\";i:27;s:39:\"photocrati-nextgen_basic_gallery|3.0.13\";i:28;s:45:\"photocrati-nextgen_basic_imagebrowser|3.0.0.4\";i:29;s:40:\"photocrati-nextgen_basic_singlepic|3.1.0\";i:30;s:39:\"photocrati-nextgen_basic_tagcloud|3.1.6\";i:31;s:38:\"photocrati-nextgen_basic_album|3.0.0.5\";i:32;s:23:\"photocrati-widget|3.1.6\";i:33;s:37:\"photocrati-third_party_compat|3.1.4.2\";i:34;s:31:\"photocrati-nextgen_xmlrpc|3.0.0\";i:35;s:22:\"photocrati-wpcli|3.0.0\";i:36;s:24:\"photocrati-imagify|3.1.0\";}', 'yes'),
(253, 'widget_akismet_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(441, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.1.1\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1549810514;s:7:\"version\";s:5:\"5.1.1\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(24928, 'wp_mobi_step', 'view_publish_settings', 'yes'),
(407, 'widget_srmgmap_widget', 'a:2:{s:12:\"_multiwidget\";i:1;i:3;a:2:{s:5:\"title\";s:0:\"\";s:17:\"srmgmap_shortcode\";s:20:\"[gmap-embed id=\"98\"]\";}}', 'yes'),
(408, 'wpgmap_api_key', 'AIzaSyCqf1-MCTrWpKvA8vrfDd5Hi3GB_hwS-cU', 'yes'),
(394, 'gmw_options', 'a:18:{s:6:\"sc_map\";s:3:\"gmw\";s:7:\"api_key\";s:39:\"AIzaSyBrFqhOdMjzUl0nu8ycPxiwVx4t5VAA9i4\";s:8:\"track_ga\";s:1:\"0\";s:14:\"include_jquery\";s:1:\"1\";s:17:\"include_gmaps_api\";s:1:\"1\";s:19:\"include_lightbox_js\";s:1:\"1\";s:20:\"include_lightbox_css\";s:1:\"1\";s:16:\"disable_tooltips\";s:1:\"0\";s:15:\"disable_sidebar\";s:1:\"0\";s:15:\"activation_code\";s:0:\"\";s:14:\"license_active\";s:0:\"\";s:15:\"license_expires\";s:0:\"\";s:12:\"license_type\";s:0:\"\";s:13:\"first_version\";s:4:\"4.05\";s:13:\"first_install\";i:1549807422;s:13:\"last_tracking\";b:0;s:17:\"first_install_gmt\";i:1549807422;s:23:\"dismiss_notice_upgrade2\";b:1;}', 'yes'),
(397, 'widget_googlemapswidget', 'a:2:{i:2;a:32:{s:5:\"title\";s:3:\"Map\";s:7:\"address\";s:26:\"Nutan ITI, Chinawal, India\";s:14:\"thumb_pin_type\";s:10:\"predefined\";s:15:\"thumb_pin_color\";s:7:\"#ff0000\";s:14:\"thumb_pin_size\";s:7:\"default\";s:15:\"thumb_pin_label\";s:1:\"A\";s:13:\"thumb_pin_img\";s:0:\"\";s:11:\"thumb_width\";i:400;s:12:\"thumb_height\";i:400;s:10:\"thumb_zoom\";s:2:\"13\";s:10:\"thumb_type\";s:7:\"roadmap\";s:15:\"thumb_link_type\";s:8:\"lightbox\";s:10:\"thumb_link\";s:0:\"\";s:12:\"thumb_header\";s:0:\"\";s:12:\"thumb_footer\";s:0:\"\";s:18:\"thumb_color_scheme\";s:3:\"new\";s:12:\"thumb_format\";s:3:\"png\";s:10:\"thumb_lang\";s:2:\"en\";s:16:\"thumb_powered_by\";s:1:\"0\";s:16:\"thumb_hide_title\";s:1:\"0\";s:19:\"lightbox_fullscreen\";i:0;s:14:\"lightbox_width\";i:550;s:15:\"lightbox_height\";i:550;s:13:\"lightbox_mode\";s:5:\"place\";s:17:\"lightbox_map_type\";s:7:\"roadmap\";s:13:\"lightbox_zoom\";s:2:\"14\";s:16:\"lightbox_feature\";a:1:{i:0;s:13:\"overlay_close\";}s:15:\"lightbox_header\";s:0:\"\";s:15:\"lightbox_footer\";s:0:\"\";s:13:\"lightbox_skin\";s:5:\"light\";s:13:\"lightbox_lang\";s:2:\"en\";s:8:\"core_ver\";s:4:\"4.05\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(414, 'focus_point', 'a:2:{s:3:\"lat\";s:17:\"21.19403298533498\";s:3:\"lng\";s:16:\"75.9199628829956\";}', 'yes'),
(415, 'wpgl_sel_routes', '0', 'yes'),
(416, 'wpgl_sel_places', '0', 'yes'),
(718, '_site_transient_timeout_locked_1', '1865600880', 'no'),
(719, '_site_transient_locked_1', '1', 'no'),
(676, 'ngg_run_freemius', '1', 'yes'),
(677, 'fs_active_plugins', 'O:8:\"stdClass\":3:{s:7:\"plugins\";a:2:{s:24:\"nextgen-gallery/freemius\";O:8:\"stdClass\":4:{s:7:\"version\";s:5:\"2.1.3\";s:4:\"type\";s:6:\"plugin\";s:9:\"timestamp\";i:1550240750;s:11:\"plugin_path\";s:29:\"nextgen-gallery/nggallery.php\";}s:19:\"user-menus/freemius\";O:8:\"stdClass\":4:{s:7:\"version\";s:5:\"2.3.0\";s:4:\"type\";s:6:\"plugin\";s:9:\"timestamp\";i:1592236378;s:11:\"plugin_path\";s:25:\"user-menus/user-menus.php\";}}s:7:\"abspath\";s:27:\"/home/nutaniti/public_html/\";s:6:\"newest\";O:8:\"stdClass\":5:{s:11:\"plugin_path\";s:25:\"user-menus/user-menus.php\";s:8:\"sdk_path\";s:19:\"user-menus/freemius\";s:7:\"version\";s:5:\"2.3.0\";s:13:\"in_activation\";b:0;s:9:\"timestamp\";i:1592236375;}}', 'yes'),
(167, 'recently_activated', 'a:0:{}', 'yes'),
(688, 'ngg_options', 'a:73:{s:11:\"gallerypath\";s:19:\"wp-content/gallery/\";s:11:\"wpmuCSSfile\";s:13:\"nggallery.css\";s:9:\"wpmuStyle\";b:0;s:9:\"wpmuRoles\";b:0;s:16:\"wpmuImportFolder\";b:0;s:13:\"wpmuZipUpload\";b:0;s:14:\"wpmuQuotaCheck\";b:0;s:17:\"datamapper_driver\";s:22:\"custom_post_datamapper\";s:21:\"gallerystorage_driver\";s:25:\"ngglegacy_gallery_storage\";s:20:\"maximum_entity_count\";i:500;s:17:\"router_param_slug\";s:9:\"nggallery\";s:22:\"router_param_separator\";s:2:\"--\";s:19:\"router_param_prefix\";s:0:\"\";s:9:\"deleteImg\";b:1;s:13:\"usePermalinks\";b:0;s:13:\"permalinkSlug\";s:9:\"nggallery\";s:14:\"graphicLibrary\";s:2:\"gd\";s:14:\"imageMagickDir\";s:15:\"/usr/local/bin/\";s:11:\"useMediaRSS\";b:0;s:18:\"galleries_in_feeds\";b:0;s:12:\"activateTags\";i:0;s:10:\"appendType\";s:4:\"tags\";s:9:\"maxImages\";i:7;s:14:\"relatedHeading\";s:24:\"<h3>Related Images:</h3>\";s:10:\"thumbwidth\";i:240;s:11:\"thumbheight\";i:160;s:8:\"thumbfix\";b:1;s:12:\"thumbquality\";i:100;s:8:\"imgWidth\";i:1800;s:9:\"imgHeight\";i:1200;s:10:\"imgQuality\";i:100;s:9:\"imgBackup\";b:1;s:13:\"imgAutoResize\";b:1;s:9:\"galImages\";s:2:\"24\";s:17:\"galPagedGalleries\";i:0;s:10:\"galColumns\";i:0;s:12:\"galShowSlide\";b:0;s:12:\"galTextSlide\";s:14:\"View Slideshow\";s:14:\"galTextGallery\";s:15:\"View Thumbnails\";s:12:\"galShowOrder\";s:7:\"gallery\";s:7:\"galSort\";s:9:\"sortorder\";s:10:\"galSortDir\";s:3:\"ASC\";s:10:\"galNoPages\";b:1;s:13:\"galImgBrowser\";i:0;s:12:\"galHiddenImg\";i:0;s:10:\"galAjaxNav\";i:1;s:11:\"thumbEffect\";s:14:\"simplelightbox\";s:9:\"thumbCode\";s:47:\"class=\"ngg-simplelightbox\" rel=\"%GALLERY_NAME%\"\";s:18:\"thumbEffectContext\";s:14:\"nextgen_images\";s:5:\"wmPos\";s:9:\"midCenter\";s:6:\"wmXpos\";i:15;s:6:\"wmYpos\";i:5;s:6:\"wmType\";s:4:\"text\";s:6:\"wmPath\";s:0:\"\";s:6:\"wmFont\";s:9:\"arial.ttf\";s:6:\"wmSize\";i:30;s:6:\"wmText\";s:9:\"Nutan ITI\";s:7:\"wmColor\";s:6:\"ffffff\";s:8:\"wmOpaque\";s:2:\"33\";s:7:\"slideFX\";s:4:\"fade\";s:7:\"irWidth\";i:750;s:8:\"irHeight\";i:500;s:12:\"irRotatetime\";i:5;s:11:\"activateCSS\";i:1;s:7:\"CSSfile\";s:13:\"nggallery.css\";s:28:\"always_enable_frontend_logic\";b:0;s:27:\"use_alternate_random_method\";b:0;s:23:\"random_widget_cache_ttl\";i:30;s:22:\"dynamic_thumbnail_slug\";s:13:\"nextgen-image\";s:23:\"dynamic_stylesheet_slug\";s:12:\"nextgen-dcss\";s:13:\"gallery_count\";i:4;s:11:\"installDate\";i:1550240883;s:40:\"gallery_created_after_reviews_introduced\";b:1;}', 'yes'),
(289, 'category_children', 'a:0:{}', 'yes'),
(678, 'fs_debug_mode', '', 'yes');
INSERT INTO `iti_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(679, 'fs_accounts', 'a:11:{s:21:\"id_slug_type_path_map\";a:2:{i:266;a:3:{s:4:\"slug\";s:15:\"nextgen-gallery\";s:4:\"type\";s:6:\"plugin\";s:4:\"path\";s:29:\"nextgen-gallery/nggallery.php\";}i:3637;a:3:{s:4:\"slug\";s:10:\"user-menus\";s:4:\"type\";s:6:\"plugin\";s:4:\"path\";s:25:\"user-menus/user-menus.php\";}}s:11:\"plugin_data\";a:2:{s:15:\"nextgen-gallery\";a:21:{s:16:\"plugin_main_file\";O:8:\"stdClass\":1:{s:4:\"path\";s:29:\"nextgen-gallery/nggallery.php\";}s:17:\"install_timestamp\";i:1550240750;s:16:\"sdk_last_version\";s:5:\"2.1.3\";s:11:\"sdk_version\";s:5:\"2.3.0\";s:16:\"sdk_upgrade_mode\";b:1;s:18:\"sdk_downgrade_mode\";b:0;s:19:\"plugin_last_version\";N;s:14:\"plugin_version\";s:5:\"3.1.6\";s:19:\"plugin_upgrade_mode\";b:1;s:21:\"plugin_downgrade_mode\";b:0;s:21:\"is_plugin_new_install\";b:1;s:17:\"connectivity_test\";a:6:{s:12:\"is_connected\";b:1;s:4:\"host\";s:16:\"www.nutaniti.com\";s:9:\"server_ip\";s:15:\"103.232.239.218\";s:9:\"is_active\";b:1;s:9:\"timestamp\";i:1550240750;s:7:\"version\";s:5:\"3.1.6\";}s:17:\"was_plugin_loaded\";b:1;s:15:\"prev_is_premium\";b:0;s:14:\"has_trial_plan\";b:0;s:22:\"install_sync_timestamp\";i:1593794277;s:20:\"activation_timestamp\";i:1550240878;s:9:\"sync_cron\";O:8:\"stdClass\":5:{s:7:\"version\";s:5:\"3.1.6\";s:7:\"blog_id\";i:0;s:11:\"sdk_version\";s:5:\"2.1.3\";s:9:\"timestamp\";i:1550240883;s:2:\"on\";b:1;}s:14:\"sync_timestamp\";i:1593794275;s:20:\"is_network_activated\";b:0;s:19:\"keepalive_timestamp\";i:1593794277;}s:10:\"user-menus\";a:16:{s:16:\"plugin_main_file\";O:8:\"stdClass\":1:{s:4:\"path\";s:25:\"user-menus/user-menus.php\";}s:20:\"is_network_activated\";b:0;s:17:\"install_timestamp\";i:1592236376;s:16:\"sdk_last_version\";N;s:11:\"sdk_version\";s:5:\"2.3.0\";s:16:\"sdk_upgrade_mode\";b:1;s:18:\"sdk_downgrade_mode\";b:0;s:19:\"plugin_last_version\";N;s:14:\"plugin_version\";s:5:\"1.2.3\";s:19:\"plugin_upgrade_mode\";b:1;s:21:\"plugin_downgrade_mode\";b:0;s:21:\"is_plugin_new_install\";b:1;s:17:\"connectivity_test\";a:6:{s:12:\"is_connected\";b:1;s:4:\"host\";s:16:\"www.nutaniti.com\";s:9:\"server_ip\";s:15:\"103.232.239.213\";s:9:\"is_active\";b:1;s:9:\"timestamp\";i:1592236376;s:7:\"version\";s:5:\"1.2.3\";}s:17:\"was_plugin_loaded\";b:1;s:15:\"prev_is_premium\";b:0;s:12:\"is_anonymous\";a:3:{s:2:\"is\";b:1;s:9:\"timestamp\";i:1592236391;s:7:\"version\";s:5:\"1.2.3\";}}}s:13:\"file_slug_map\";a:2:{s:29:\"nextgen-gallery/nggallery.php\";s:15:\"nextgen-gallery\";s:25:\"user-menus/user-menus.php\";s:10:\"user-menus\";}s:7:\"plugins\";a:2:{s:15:\"nextgen-gallery\";O:9:\"FS_Plugin\":22:{s:16:\"parent_plugin_id\";N;s:5:\"title\";s:15:\"NextGEN Gallery\";s:4:\"slug\";s:15:\"nextgen-gallery\";s:12:\"premium_slug\";s:23:\"nextgen-gallery-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";b:0;s:19:\"is_wp_org_compliant\";b:1;s:22:\"premium_releases_count\";N;s:4:\"file\";s:29:\"nextgen-gallery/nggallery.php\";s:7:\"version\";s:5:\"3.1.6\";s:11:\"auto_update\";N;s:4:\"info\";N;s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:10:\"public_key\";s:32:\"pk_009356711cd548837f074e1ef60a4\";s:10:\"secret_key\";N;s:2:\"id\";s:3:\"266\";s:7:\"updated\";N;s:7:\"created\";N;s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:10:\"user-menus\";O:9:\"FS_Plugin\":22:{s:16:\"parent_plugin_id\";N;s:5:\"title\";s:10:\"User Menus\";s:4:\"slug\";s:10:\"user-menus\";s:12:\"premium_slug\";s:18:\"user-menus-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";b:0;s:19:\"is_wp_org_compliant\";b:1;s:22:\"premium_releases_count\";N;s:4:\"file\";s:25:\"user-menus/user-menus.php\";s:7:\"version\";s:5:\"1.2.3\";s:11:\"auto_update\";N;s:4:\"info\";N;s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:10:\"public_key\";s:32:\"pk_367ac2d0a38c35ef2a78d161fed88\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"3637\";s:7:\"updated\";N;s:7:\"created\";N;s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:9:\"unique_id\";s:32:\"d069e3557b6fe85cb81eec9166d72dd8\";s:5:\"plans\";a:1:{s:15:\"nextgen-gallery\";a:1:{i:0;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:4:\"MjY2\";s:4:\"name\";s:8:\"ZnJlZQ==\";s:5:\"title\";s:8:\"RnJlZQ==\";s:11:\"description\";N;s:17:\"is_free_localhost\";s:4:\"MQ==\";s:17:\"is_block_features\";s:4:\"MQ==\";s:12:\"license_type\";s:4:\"MA==\";s:16:\"is_https_support\";s:0:\"\";s:12:\"trial_period\";N;s:23:\"is_require_subscription\";s:0:\"\";s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";N;s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";s:0:\"\";s:11:\"is_featured\";s:0:\"\";s:2:\"id\";s:4:\"Mzc0\";s:7:\"updated\";N;s:7:\"created\";s:28:\"MjAxNi0wNC0yNCAxNToyNzo0Nw==\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}}s:14:\"active_plugins\";O:8:\"stdClass\":3:{s:9:\"timestamp\";i:1593794277;s:3:\"md5\";s:32:\"9d3751399923fdefda2d4e28639acc35\";s:7:\"plugins\";a:9:{s:19:\"akismet/akismet.php\";a:5:{s:4:\"slug\";s:7:\"akismet\";s:7:\"version\";s:3:\"4.1\";s:5:\"title\";s:17:\"Akismet Anti-Spam\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:36:\"contact-form-7/wp-contact-form-7.php\";a:5:{s:4:\"slug\";s:14:\"contact-form-7\";s:7:\"version\";s:5:\"5.1.1\";s:5:\"title\";s:14:\"Contact Form 7\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:29:\"gmap-embed/srm_gmap_embed.php\";a:5:{s:4:\"slug\";s:10:\"gmap-embed\";s:7:\"version\";s:5:\"1.4.0\";s:5:\"title\";s:16:\"Google Map Embed\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:29:\"nextgen-gallery/nggallery.php\";a:5:{s:4:\"slug\";s:15:\"nextgen-gallery\";s:7:\"version\";s:5:\"3.1.6\";s:5:\"title\";s:15:\"NextGEN Gallery\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:17:\"wp-mobi/index.php\";a:5:{s:4:\"slug\";s:7:\"wp-mobi\";s:7:\"version\";s:5:\"0.0.3\";s:5:\"title\";s:7:\"Wp Mobi\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:45:\"contact-form-entries/contact-form-entries.php\";a:5:{s:4:\"slug\";s:20:\"contact-form-entries\";s:7:\"version\";s:5:\"1.1.1\";s:5:\"title\";s:20:\"Contact Form Entries\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:25:\"profile-builder/index.php\";a:5:{s:4:\"slug\";s:15:\"profile-builder\";s:7:\"version\";s:5:\"3.1.9\";s:5:\"title\";s:15:\"Profile Builder\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:25:\"user-menus/user-menus.php\";a:5:{s:4:\"slug\";s:10:\"user-menus\";s:7:\"version\";s:5:\"1.2.3\";s:5:\"title\";s:10:\"User Menus\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:31:\"wpschoolpress/wpschoolpress.php\";a:5:{s:4:\"slug\";s:13:\"wpschoolpress\";s:7:\"version\";s:5:\"2.1.2\";s:5:\"title\";s:13:\"WPSchoolPress\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}}}s:11:\"all_plugins\";O:8:\"stdClass\":3:{s:9:\"timestamp\";i:1592326138;s:3:\"md5\";s:32:\"7890d8ac3f78c1bf5ba34180137b63cf\";s:7:\"plugins\";a:11:{s:19:\"akismet/akismet.php\";a:5:{s:4:\"slug\";s:7:\"akismet\";s:7:\"version\";s:3:\"4.1\";s:5:\"title\";s:17:\"Akismet Anti-Spam\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:36:\"contact-form-7/wp-contact-form-7.php\";a:5:{s:4:\"slug\";s:14:\"contact-form-7\";s:7:\"version\";s:5:\"5.1.1\";s:5:\"title\";s:14:\"Contact Form 7\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:29:\"gmap-embed/srm_gmap_embed.php\";a:5:{s:4:\"slug\";s:10:\"gmap-embed\";s:7:\"version\";s:5:\"1.4.0\";s:5:\"title\";s:16:\"Google Map Embed\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:9:\"hello.php\";a:5:{s:4:\"slug\";s:11:\"hello-dolly\";s:7:\"version\";s:5:\"1.7.1\";s:5:\"title\";s:11:\"Hello Dolly\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:29:\"nextgen-gallery/nggallery.php\";a:5:{s:4:\"slug\";s:15:\"nextgen-gallery\";s:7:\"version\";s:5:\"3.1.6\";s:5:\"title\";s:15:\"NextGEN Gallery\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:17:\"wp-mobi/index.php\";a:5:{s:4:\"slug\";s:7:\"wp-mobi\";s:7:\"version\";s:5:\"0.0.3\";s:5:\"title\";s:7:\"Wp Mobi\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:45:\"contact-form-entries/contact-form-entries.php\";a:5:{s:4:\"slug\";s:20:\"contact-form-entries\";s:7:\"version\";s:5:\"1.1.1\";s:5:\"title\";s:20:\"Contact Form Entries\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:25:\"profile-builder/index.php\";a:6:{s:4:\"slug\";s:15:\"profile-builder\";s:7:\"version\";s:5:\"3.1.9\";s:5:\"title\";s:15:\"Profile Builder\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;s:7:\"Version\";s:5:\"3.1.7\";}s:25:\"user-menus/user-menus.php\";a:5:{s:4:\"slug\";s:10:\"user-menus\";s:7:\"version\";s:5:\"1.2.3\";s:5:\"title\";s:10:\"User Menus\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:31:\"wpschoolpress/wpschoolpress.php\";a:5:{s:4:\"slug\";s:13:\"wpschoolpress\";s:7:\"version\";s:5:\"2.1.2\";s:5:\"title\";s:13:\"WPSchoolPress\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:23:\"loginizer/loginizer.php\";a:5:{s:4:\"slug\";s:9:\"loginizer\";s:7:\"version\";s:5:\"1.4.3\";s:5:\"title\";s:9:\"Loginizer\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}}}s:10:\"all_themes\";O:8:\"stdClass\":3:{s:9:\"timestamp\";i:1593794277;s:3:\"md5\";s:32:\"7fbd91a51311672582be94cb32fda7c7\";s:6:\"themes\";a:7:{s:14:\"twentynineteen\";a:5:{s:4:\"slug\";s:14:\"twentynineteen\";s:7:\"version\";s:3:\"1.2\";s:5:\"title\";s:15:\"Twenty Nineteen\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:15:\"twentyseventeen\";a:5:{s:4:\"slug\";s:15:\"twentyseventeen\";s:7:\"version\";s:3:\"2.0\";s:5:\"title\";s:16:\"Twenty Seventeen\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:13:\"twentysixteen\";a:5:{s:4:\"slug\";s:13:\"twentysixteen\";s:7:\"version\";s:3:\"1.8\";s:5:\"title\";s:14:\"Twenty Sixteen\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:12:\"wen-business\";a:5:{s:4:\"slug\";s:12:\"wen-business\";s:7:\"version\";s:5:\"1.0.5\";s:5:\"title\";s:12:\"WEN Business\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:14:\"education-zone\";a:5:{s:4:\"slug\";s:14:\"education-zone\";s:7:\"version\";s:5:\"1.2.4\";s:5:\"title\";s:14:\"Education Zone\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:11:\"school-zone\";a:5:{s:4:\"slug\";s:11:\"school-zone\";s:7:\"version\";s:5:\"1.0.8\";s:5:\"title\";s:11:\"School Zone\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:12:\"twentytwenty\";a:5:{s:4:\"slug\";s:12:\"twentytwenty\";s:7:\"version\";s:3:\"1.2\";s:5:\"title\";s:13:\"Twenty Twenty\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}}}s:5:\"sites\";a:1:{s:15:\"nextgen-gallery\";O:7:\"FS_Site\":25:{s:7:\"site_id\";s:7:\"7431468\";s:9:\"plugin_id\";s:3:\"266\";s:7:\"user_id\";s:7:\"1731078\";s:5:\"title\";s:9:\"Nutan ITI\";s:3:\"url\";s:23:\"http://www.nutaniti.com\";s:7:\"version\";s:5:\"3.1.6\";s:8:\"language\";s:5:\"en-US\";s:7:\"charset\";s:5:\"UTF-8\";s:16:\"platform_version\";s:5:\"5.0.7\";s:11:\"sdk_version\";s:5:\"2.3.0\";s:28:\"programming_language_version\";s:6:\"5.6.40\";s:7:\"plan_id\";s:3:\"374\";s:10:\"license_id\";N;s:13:\"trial_plan_id\";N;s:10:\"trial_ends\";N;s:10:\"is_premium\";b:0;s:15:\"is_disconnected\";b:0;s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;s:10:\"public_key\";s:32:\"pk_03653df59ec34632787733f343213\";s:10:\"secret_key\";s:32:\"sk_w)]+0!D^3n!?wk?FIfkt=}yAEL#XR\";s:2:\"id\";s:7:\"2391049\";s:7:\"updated\";s:19:\"2020-07-02 16:36:28\";s:7:\"created\";s:19:\"2019-02-15 14:27:57\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:5:\"users\";a:1:{i:1731078;O:7:\"FS_User\":13:{s:5:\"email\";s:25:\"rahulbhangale26@gmail.com\";s:5:\"first\";s:8:\"nutaniti\";s:4:\"last\";s:0:\"\";s:11:\"is_verified\";b:0;s:7:\"is_beta\";b:0;s:11:\"customer_id\";N;s:5:\"gross\";i:0;s:10:\"public_key\";s:32:\"pk_6fae3e2c46ac286be4484d5e727bc\";s:10:\"secret_key\";s:32:\"sk_={*i7^9Jp?@FW10fiP8s1kMeK&5ln\";s:2:\"id\";s:7:\"1731078\";s:7:\"updated\";N;s:7:\"created\";s:19:\"2019-02-15 14:27:57\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}}', 'yes'),
(426, 'marker_children', 'a:0:{}', 'yes'),
(24927, 'wp_mobi', '{\"app_name\":\"Nutan ITI\",\"app_package_name\":null,\"app_url\":\"http:\\/\\/www.nutaniti.com\",\"requested_on\":1566621188,\"client_id\":\"Mw==\",\"download_link\":\"https:\\/\\/api.wpandro.com\\/downloads\\/3\\/NutanITI_1566664913.apk\"}', 'yes'),
(63011, 'widget_wppb-login-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(63012, 'wppb_version', '3.1.9', 'yes'),
(63013, 'wppb_general_settings', 'a:7:{s:17:\"extraFieldsLayout\";s:7:\"default\";s:17:\"emailConfirmation\";s:2:\"no\";s:21:\"activationLandingPage\";s:0:\"\";s:13:\"adminApproval\";s:2:\"no\";s:9:\"loginWith\";s:13:\"usernameemail\";s:11:\"rolesEditor\";s:2:\"no\";s:23:\"conditional_fields_ajax\";s:2:\"no\";}', 'yes'),
(63014, 'wppb_manage_fields', 'a:13:{i:0;a:21:{s:2:\"id\";i:1;s:5:\"field\";s:24:\"Default - Name (Heading)\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:4:\"Name\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:1;a:21:{s:2:\"id\";i:2;s:5:\"field\";s:18:\"Default - Username\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:8:\"Username\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:3:\"Yes\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:2;a:21:{s:2:\"id\";i:3;s:5:\"field\";s:20:\"Default - First Name\";s:9:\"meta-name\";s:10:\"first_name\";s:11:\"field-title\";s:10:\"First Name\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:3;a:21:{s:2:\"id\";i:4;s:5:\"field\";s:19:\"Default - Last Name\";s:9:\"meta-name\";s:9:\"last_name\";s:11:\"field-title\";s:9:\"Last Name\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:4;a:21:{s:2:\"id\";i:5;s:5:\"field\";s:18:\"Default - Nickname\";s:9:\"meta-name\";s:8:\"nickname\";s:11:\"field-title\";s:8:\"Nickname\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:5;a:21:{s:2:\"id\";i:6;s:5:\"field\";s:34:\"Default - Display name publicly as\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:24:\"Display name publicly as\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:6;a:21:{s:2:\"id\";i:7;s:5:\"field\";s:32:\"Default - Contact Info (Heading)\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:12:\"Contact Info\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:7;a:21:{s:2:\"id\";i:8;s:5:\"field\";s:16:\"Default - E-mail\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:6:\"E-mail\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:3:\"Yes\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:8;a:21:{s:2:\"id\";i:9;s:5:\"field\";s:17:\"Default - Website\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:7:\"Website\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:9;a:21:{s:2:\"id\";i:10;s:5:\"field\";s:34:\"Default - About Yourself (Heading)\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:14:\"About Yourself\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:10;a:21:{s:2:\"id\";i:11;s:5:\"field\";s:27:\"Default - Biographical Info\";s:9:\"meta-name\";s:11:\"description\";s:11:\"field-title\";s:17:\"Biographical Info\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:11;a:21:{s:2:\"id\";i:12;s:5:\"field\";s:18:\"Default - Password\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:8:\"Password\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:3:\"Yes\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:12;a:21:{s:2:\"id\";i:13;s:5:\"field\";s:25:\"Default - Repeat Password\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:15:\"Repeat Password\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:3:\"Yes\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}}', 'yes'),
(63006, 'jpum_reviews_installed_on', '2020-06-15 15:52:58', 'yes'),
(63015, 'wppb_pages_created', 'true', 'yes'),
(59485, 'vxcf_leads_meta', 'a:1:{s:13:\"disable_track\";a:1:{s:5:\"cf_68\";s:3:\"yes\";}}', 'yes'),
(59001, 'action_scheduler_hybrid_store_demarkation', '373', 'yes'),
(59002, 'schema-ActionScheduler_StoreSchema', '3.0.1590049413', 'yes'),
(59003, 'schema-ActionScheduler_LoggerSchema', '2.0.1590049413', 'yes'),
(59004, 'wpforms_version', '1.6.0.1', 'yes'),
(59005, 'wpforms_activated', 'a:1:{s:4:\"lite\";i:1590049413;}', 'yes'),
(59015, 'wpforms_review', 'a:2:{s:4:\"time\";i:1590049415;s:9:\"dismissed\";b:0;}', 'yes'),
(59016, 'wpforms_notifications', 'a:4:{s:6:\"update\";i:1590049420;s:4:\"feed\";a:0:{}s:6:\"events\";a:0:{}s:9:\"dismissed\";a:0:{}}', 'yes'),
(59008, 'action_scheduler_lock_async-request-runner', '1590050013', 'yes'),
(59009, 'wpforms_version_lite', '1.6.0.1', 'yes'),
(59010, 'widget_wpforms-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(66487, '_site_transient_timeout_browser_01cc1d3507e3bcc13d5b7f203206c9bb', '1594265270', 'no'),
(66488, '_site_transient_browser_01cc1d3507e3bcc13d5b7f203206c9bb', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"83.0.4103.116\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(31508, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:6:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.3.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.3.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.3.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.3.4-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.3.4\";s:7:\"version\";s:5:\"5.3.4\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.7.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.7.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.7-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.7-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.7\";s:7:\"version\";s:5:\"5.2.7\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:4;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.6.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.6.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.1.6-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.1.6-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.1.6\";s:7:\"version\";s:5:\"5.1.6\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:5;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:60:\"https://downloads.wordpress.org/release/wordpress-5.0.10.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:60:\"https://downloads.wordpress.org/release/wordpress-5.0.10.zip\";s:10:\"no_content\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.10-no-content.zip\";s:11:\"new_bundled\";s:72:\"https://downloads.wordpress.org/release/wordpress-5.0.10-new-bundled.zip\";s:7:\"partial\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.10-partial-7.zip\";s:8:\"rollback\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.10-rollback-7.zip\";}s:7:\"current\";s:6:\"5.0.10\";s:7:\"version\";s:6:\"5.0.10\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:5:\"5.0.7\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1593840169;s:15:\"version_checked\";s:5:\"5.0.7\";s:12:\"translations\";a:0:{}}', 'no'),
(66900, '_site_transient_timeout_theme_roots', '1593841970', 'no'),
(66901, '_site_transient_theme_roots', 'a:7:{s:14:\"education-zone\";s:7:\"/themes\";s:11:\"school-zone\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:12:\"wen-business\";s:7:\"/themes\";}', 'no'),
(66902, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1593840172;s:7:\"checked\";a:7:{s:14:\"education-zone\";s:5:\"1.2.4\";s:11:\"school-zone\";s:5:\"1.0.8\";s:14:\"twentynineteen\";s:3:\"1.2\";s:15:\"twentyseventeen\";s:3:\"2.0\";s:13:\"twentysixteen\";s:3:\"1.8\";s:12:\"twentytwenty\";s:3:\"1.2\";s:12:\"wen-business\";s:5:\"1.0.5\";}s:8:\"response\";a:7:{s:14:\"education-zone\";a:6:{s:5:\"theme\";s:14:\"education-zone\";s:11:\"new_version\";s:5:\"1.2.5\";s:3:\"url\";s:44:\"https://wordpress.org/themes/education-zone/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/education-zone.1.2.5.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";s:3:\"5.6\";}s:11:\"school-zone\";a:6:{s:5:\"theme\";s:11:\"school-zone\";s:11:\"new_version\";s:5:\"1.0.9\";s:3:\"url\";s:41:\"https://wordpress.org/themes/school-zone/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/school-zone.1.0.9.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";s:3:\"5.6\";}s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.6.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.3\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.3.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:13:\"twentysixteen\";a:6:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"2.1\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.2.1.zip\";s:8:\"requires\";s:3:\"4.4\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"wen-business\";a:6:{s:5:\"theme\";s:12:\"wen-business\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:42:\"https://wordpress.org/themes/wen-business/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/wen-business.1.7.zip\";s:8:\"requires\";s:3:\"5.1\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no'),
(66903, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1593840172;s:7:\"checked\";a:11:{s:19:\"akismet/akismet.php\";s:3:\"4.1\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.1.1\";s:45:\"contact-form-entries/contact-form-entries.php\";s:5:\"1.1.1\";s:29:\"gmap-embed/srm_gmap_embed.php\";s:5:\"1.4.0\";s:9:\"hello.php\";s:5:\"1.7.1\";s:23:\"loginizer/loginizer.php\";s:5:\"1.4.3\";s:29:\"nextgen-gallery/nggallery.php\";s:5:\"3.1.6\";s:25:\"profile-builder/index.php\";s:5:\"3.1.7\";s:25:\"user-menus/user-menus.php\";s:5:\"1.2.3\";s:17:\"wp-mobi/index.php\";s:5:\"0.0.3\";s:31:\"wpschoolpress/wpschoolpress.php\";s:5:\"2.1.2\";}s:8:\"response\";a:7:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.6\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.1.9\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.1.9.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=2279696\";s:2:\"1x\";s:67:\"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=2279696\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:29:\"gmap-embed/srm_gmap_embed.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:24:\"w.org/plugins/gmap-embed\";s:4:\"slug\";s:10:\"gmap-embed\";s:6:\"plugin\";s:29:\"gmap-embed/srm_gmap_embed.php\";s:11:\"new_version\";s:5:\"1.6.7\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/gmap-embed/\";s:7:\"package\";s:53:\"https://downloads.wordpress.org/plugin/gmap-embed.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/gmap-embed/assets/icon-256x256.png?rev=1509263\";s:2:\"1x\";s:63:\"https://ps.w.org/gmap-embed/assets/icon-128x128.png?rev=1509263\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/gmap-embed/assets/banner-772x250.png?rev=1505473\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:3:\"5.3\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:9:\"hello.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.7\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:23:\"loginizer/loginizer.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:23:\"w.org/plugins/loginizer\";s:4:\"slug\";s:9:\"loginizer\";s:6:\"plugin\";s:23:\"loginizer/loginizer.php\";s:11:\"new_version\";s:5:\"1.4.5\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/loginizer/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/loginizer.1.4.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:62:\"https://ps.w.org/loginizer/assets/icon-256x256.png?rev=1381093\";s:2:\"1x\";s:62:\"https://ps.w.org/loginizer/assets/icon-128x128.png?rev=1381093\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/loginizer/assets/banner-1544x500.jpg?rev=1517954\";s:2:\"1x\";s:64:\"https://ps.w.org/loginizer/assets/banner-772x250.jpg?rev=1517954\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:3:\"5.5\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:29:\"nextgen-gallery/nggallery.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:29:\"w.org/plugins/nextgen-gallery\";s:4:\"slug\";s:15:\"nextgen-gallery\";s:6:\"plugin\";s:29:\"nextgen-gallery/nggallery.php\";s:11:\"new_version\";s:5:\"3.3.6\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/nextgen-gallery/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/nextgen-gallery.3.3.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/nextgen-gallery/assets/icon-256x256.png?rev=2083961\";s:2:\"1x\";s:68:\"https://ps.w.org/nextgen-gallery/assets/icon-128x128.png?rev=2083961\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/nextgen-gallery/assets/banner-1544x500.png?rev=2083961\";s:2:\"1x\";s:70:\"https://ps.w.org/nextgen-gallery/assets/banner-772x250.png?rev=2083961\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.0\";s:12:\"requires_php\";s:3:\"5.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:25:\"profile-builder/index.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:29:\"w.org/plugins/profile-builder\";s:4:\"slug\";s:15:\"profile-builder\";s:6:\"plugin\";s:25:\"profile-builder/index.php\";s:11:\"new_version\";s:5:\"3.1.9\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/profile-builder/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/profile-builder.3.1.9.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/profile-builder/assets/icon-256x256.png?rev=2257592\";s:2:\"1x\";s:68:\"https://ps.w.org/profile-builder/assets/icon-128x128.png?rev=2257592\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/profile-builder/assets/banner-1544x500.png?rev=2257594\";s:2:\"1x\";s:70:\"https://ps.w.org/profile-builder/assets/banner-772x250.png?rev=2257592\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:4:{s:45:\"contact-form-entries/contact-form-entries.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:34:\"w.org/plugins/contact-form-entries\";s:4:\"slug\";s:20:\"contact-form-entries\";s:6:\"plugin\";s:45:\"contact-form-entries/contact-form-entries.php\";s:11:\"new_version\";s:5:\"1.1.1\";s:3:\"url\";s:51:\"https://wordpress.org/plugins/contact-form-entries/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-entries.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/contact-form-entries/assets/icon-256x256.png?rev=1926543\";s:2:\"1x\";s:73:\"https://ps.w.org/contact-form-entries/assets/icon-128x128.png?rev=1926543\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:75:\"https://ps.w.org/contact-form-entries/assets/banner-772x250.png?rev=1926543\";}s:11:\"banners_rtl\";a:0:{}}s:25:\"user-menus/user-menus.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:24:\"w.org/plugins/user-menus\";s:4:\"slug\";s:10:\"user-menus\";s:6:\"plugin\";s:25:\"user-menus/user-menus.php\";s:11:\"new_version\";s:5:\"1.2.3\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/user-menus/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/user-menus.1.2.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/user-menus/assets/icon-256x256.png?rev=1507838\";s:2:\"1x\";s:63:\"https://ps.w.org/user-menus/assets/icon-128x128.png?rev=1507838\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/user-menus/assets/banner-1544x500.png?rev=1507838\";s:2:\"1x\";s:65:\"https://ps.w.org/user-menus/assets/banner-772x250.png?rev=1507838\";}s:11:\"banners_rtl\";a:0:{}}s:17:\"wp-mobi/index.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/wp-mobi\";s:4:\"slug\";s:7:\"wp-mobi\";s:6:\"plugin\";s:17:\"wp-mobi/index.php\";s:11:\"new_version\";s:5:\"0.0.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/wp-mobi/\";s:7:\"package\";s:50:\"https://downloads.wordpress.org/plugin/wp-mobi.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:51:\"https://s.w.org/plugins/geopattern-icon/wp-mobi.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:31:\"wpschoolpress/wpschoolpress.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/wpschoolpress\";s:4:\"slug\";s:13:\"wpschoolpress\";s:6:\"plugin\";s:31:\"wpschoolpress/wpschoolpress.php\";s:11:\"new_version\";s:5:\"2.1.2\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wpschoolpress/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/wpschoolpress.2.1.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/wpschoolpress/assets/icon-256x256.png?rev=2004625\";s:2:\"1x\";s:66:\"https://ps.w.org/wpschoolpress/assets/icon-128x128.png?rev=2004625\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wpschoolpress/assets/banner-1544x500.jpg?rev=2004625\";s:2:\"1x\";s:68:\"https://ps.w.org/wpschoolpress/assets/banner-772x250.jpg?rev=2004625\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(59111, 'current_theme', 'School Zone', 'yes'),
(59112, 'theme_mods_school-zone', 'a:28:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:7;}s:18:\"custom_css_post_id\";i:432;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1590059080;s:4:\"data\";a:5:{s:19:\"wp_inactive_widgets\";a:10:{i:0;s:10:\"archives-2\";i:1;s:15:\"media_gallery-3\";i:2;s:15:\"media_gallery-5\";i:3;s:6:\"meta-2\";i:4;s:8:\"search-2\";i:5;s:6:\"text-2\";i:6;s:12:\"categories-2\";i:7;s:14:\"recent-posts-2\";i:8;s:17:\"recent-comments-2\";i:9;s:16:\"srmgmap_widget-3\";}s:13:\"right-sidebar\";a:1:{i:0;s:6:\"text-3\";}s:10:\"footer-one\";a:0:{}s:10:\"footer-two\";a:0:{}s:12:\"footer-three\";a:0:{}}}s:31:\"school_zone_banner_link_two_url\";s:36:\"https://www.nutaniti.com/contact-us/\";s:31:\"school_zone_banner_link_one_url\";s:40:\"https://www.nutaniti.com/admission-form/\";s:30:\"education_zone_ed_info_section\";b:1;s:28:\"education_zone_info_one_post\";s:1:\"1\";s:31:\"education_zone_info_second_post\";s:2:\"44\";s:30:\"education_zone_info_third_post\";s:2:\"50\";s:31:\"education_zone_info_fourth_post\";s:2:\"42\";s:33:\"education_zone_ed_welcome_section\";b:1;s:36:\"education_zone_welcome_section_title\";s:3:\"424\";s:33:\"education_zone_first_stats_number\";s:1:\"2\";s:32:\"education_zone_first_stats_title\";s:5:\"Trade\";s:33:\"education_zone_second_stats_title\";s:8:\"Teachers\";s:34:\"education_zone_second_stats_number\";s:1:\"5\";s:33:\"education_zone_third_stats_number\";s:2:\"40\";s:32:\"education_zone_third_stats_title\";s:8:\"Students\";s:32:\"education_zone_ed_choose_section\";b:0;s:35:\"education_zone_choose_section_title\";s:3:\"424\";s:35:\"education_zone_testimonial_category\";s:1:\"3\";s:32:\"education_zone_ed_search_section\";b:1;s:16:\"background_image\";s:0:\"\";s:38:\"education_zone_ed_testimonials_section\";b:0;s:41:\"education_zone_testimonials_section_title\";s:0:\"\";s:33:\"education_zone_ed_courses_section\";b:1;s:36:\"education_zone_courses_section_title\";s:3:\"122\";}', 'yes'),
(59113, 'theme_switched', '', 'yes'),
(59114, 'widget_education_zone_recent_post', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(59115, 'widget_education_zone_popular_post', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(59116, 'widget_education_zone_social_links', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(66956, '_transient_timeout_3__2899230903', '1593858907', 'no'),
(66957, '_transient_3__2899230903', '[\"ID\",\"post_author\",\"post_date\",\"post_date_gmt\",\"post_content\",\"post_title\",\"post_excerpt\",\"post_status\",\"comment_status\",\"ping_status\",\"post_password\",\"post_name\",\"to_ping\",\"pinged\",\"post_modified\",\"post_modified_gmt\",\"post_content_filtered\",\"post_parent\",\"guid\",\"menu_order\",\"post_type\",\"post_mime_type\",\"comment_count\"]', 'no'),
(66958, '_transient_timeout_5__2899230903', '1593858907', 'no'),
(66959, '_transient_5__2899230903', '[\"pid\",\"image_slug\",\"post_id\",\"galleryid\",\"filename\",\"description\",\"alttext\",\"imagedate\",\"exclude\",\"sortorder\",\"meta_data\",\"extras_post_id\",\"updated_at\"]', 'no'),
(66493, '_transient_is_multi_author', '0', 'yes'),
(66663, '_transient_timeout_2__974818834', '1593860110', 'no');
INSERT INTO `iti_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(66664, '_transient_2__974818834', '{\"photocrati-ajax#ajax.min.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/ajax\\/static\\/ajax.min.js\",\"photocrati-nextgen_admin#gritter\\/gritter.min.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/gritter.min.js\",\"photocrati-nextgen_admin#gritter\\/css\\/gritter.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/css\\/gritter.min.css\",\"photocrati-nextgen_admin#ngg_progressbar.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.js\",\"photocrati-nextgen_admin#ngg_progressbar.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.css\",\"photocrati-nextgen_admin#select2\\/select2.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.min.css\",\"photocrati-nextgen_admin#select2\\/select2.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.min.js\",\"photocrati-nextgen_admin#jquery.nextgen_radio_toggle.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery.nextgen_radio_toggle.min.js\",\"photocrati-nextgen_admin#jquery-ui\\/jquery-ui-1.10.4.custom.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery-ui\\/jquery-ui-1.10.4.custom.min.css\",\"photocrati-nextgen_admin#nextgen_admin_page.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/nextgen_admin_page.min.css\",\"photocrati-nextgen_admin#nextgen_admin_page.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/nextgen_admin_page.min.js\",\"photocrati-frame_communication#frame_event_publisher.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/frame_communication\\/static\\/frame_event_publisher.min.js\",\"photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.js\",\"photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.css\",\"photocrati-nextgen_gallery_display#nextgen_gallery_related_images.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_related_images.min.css\",\"photocrati-nextgen_gallery_display#common.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/common.min.js\",\"photocrati-nextgen_gallery_display#trigger_buttons.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/trigger_buttons.min.css\",\"photocrati-nextgen_gallery_display#jquery.waitforimages.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/jquery.waitforimages.min.js\",\"photocrati-ajax#ajax.min.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/ajax\\/static\\/ajax.min.js\",\"photocrati-nextgen_admin#gritter\\/gritter.min.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/gritter.min.js\",\"photocrati-nextgen_admin#gritter\\/css\\/gritter.css||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/css\\/gritter.min.css\",\"photocrati-nextgen_admin#ngg_progressbar.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.js\",\"photocrati-nextgen_admin#ngg_progressbar.css||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.css\",\"photocrati-nextgen_admin#select2\\/select2.css||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.min.css\",\"photocrati-nextgen_admin#select2\\/select2.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.min.js\",\"photocrati-nextgen_admin#jquery.nextgen_radio_toggle.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery.nextgen_radio_toggle.min.js\",\"photocrati-nextgen_admin#jquery-ui\\/jquery-ui-1.10.4.custom.css||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery-ui\\/jquery-ui-1.10.4.custom.min.css\",\"photocrati-nextgen_admin#nextgen_admin_page.css||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/nextgen_admin_page.min.css\",\"photocrati-nextgen_admin#nextgen_admin_page.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/nextgen_admin_page.min.js\",\"photocrati-frame_communication#frame_event_publisher.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/frame_communication\\/static\\/frame_event_publisher.min.js\",\"photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.js\",\"photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.css||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.css\",\"photocrati-nextgen_gallery_display#nextgen_gallery_related_images.css||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_related_images.min.css\",\"photocrati-nextgen_gallery_display#common.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/common.min.js\",\"photocrati-nextgen_gallery_display#trigger_buttons.css||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/trigger_buttons.min.css\",\"photocrati-nextgen_gallery_display#jquery.waitforimages.js||http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|http:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"http:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/jquery.waitforimages.min.js\",\"photocrati-nextgen_addgallery_page#browserplus-2.4.21.min.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/browserplus-2.4.21.min.js\",\"photocrati-nextgen_addgallery_page#plupload-2.1.1\\/moxie.min.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/moxie.min.js\",\"photocrati-nextgen_addgallery_page#plupload-2.1.1\\/plupload.dev.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/plupload.dev.min.js\",\"photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js\",\"photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.min.css\",\"photocrati-nextgen_addgallery_page#styles.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/styles.min.css\",\"photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.js\",\"photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.css\",\"photocrati-nextgen_addgallery_page#media-library-import.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.js\",\"photocrati-nextgen_addgallery_page#media-library-import.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.css\",\"photocrati-nextgen_block#build\\/post-thumbnail.min.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_block\\/static\\/build\\/post-thumbnail.min.js\",\"photocrati-nextgen_admin#bootstrap\\/css\\/bootstrap-tooltip.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/bootstrap\\/css\\/bootstrap-tooltip.min.css\",\"photocrati-nextgen_admin#tourist\\/tourist.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/tourist\\/tourist.min.js\",\"photocrati-nextgen_admin#tourist\\/tourist.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/tourist\\/tourist.min.css\",\"photocrati-nextgen_admin#nextgen_wizards.js||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/nextgen_wizards.min.js\",\"photocrati-nextgen_admin#nextgen_wizards.css||https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/mu-plugins|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/education-zone|https:\\/\\/www.nutaniti.com\\/wp-content\\/themes\\/school-zone\":\"https:\\/\\/www.nutaniti.com\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/nextgen_wizards.min.css\"}', 'no'),
(59042, 'crm_perks_upload_folder', '5ec63e00a303e4866021648175870', 'yes'),
(59043, 'vxcf_form_version', '1.1.1', 'yes'),
(59044, 'vxcf_form_install_data', 'a:1:{s:4:\"time\";i:1590050319;}', 'no'),
(59050, 'vxcf_leads_msgs', 'a:0:{}', 'yes'),
(46442, 'WPLANG', '', 'yes'),
(46443, 'new_admin_email', 'rahulbhangale26@gmail.com', 'yes'),
(65560, '_site_transient_timeout_browser_6aa22f8afb172793f3803c076764d327', '1593843348', 'no'),
(65561, '_site_transient_browser_6aa22f8afb172793f3803c076764d327', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"83.0.4103.116\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(64773, '_transient_4__2899230903', '[\"gid\",\"name\",\"slug\",\"path\",\"title\",\"galdesc\",\"pageid\",\"previewpic\",\"author\",\"extras_post_id\"]', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `iti_postmeta`
--

CREATE TABLE `iti_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_postmeta`
--

INSERT INTO `iti_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 1, '_edit_lock', '1549474504:1'),
(4, 6, '_wp_attached_file', '2019/02/itiambar1.jpg'),
(5, 6, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2193;s:6:\"height\";i:1086;s:4:\"file\";s:21:\"2019/02/itiambar1.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"itiambar1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"itiambar1-300x149.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:149;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:21:\"itiambar1-768x380.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:380;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:22:\"itiambar1-1024x507.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:507;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:22:\"itiambar1-1600x440.jpg\";s:5:\"width\";i:1600;s:6:\"height\";i:440;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:13:\"3598 ITI LOGO\";s:17:\"created_timestamp\";s:10:\"1469105609\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:13:\"3598 ITI LOGO\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(6, 1, '_edit_last', '1'),
(19, 1, '_wp_old_slug', 'hello-world'),
(9, 1, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:10:\"no-sidebar\";s:12:\"single_image\";s:4:\"full\";s:22:\"single_image_alignment\";s:6:\"center\";}'),
(12, 1, '_thumbnail_id', '6'),
(26, 13, '_wp_attached_file', '2019/02/Logo-5.psd-Copy-e1549698174209.jpg'),
(27, 13, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:60;s:6:\"height\";i:54;s:4:\"file\";s:42:\"2019/02/Logo-5.psd-Copy-e1549698174209.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"Logo-5.psd-Copy-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(31, 13, '_edit_lock', '1593238596:1'),
(33, 13, '_edit_last', '1'),
(34, 13, '_wp_attachment_backup_sizes', 'a:3:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:250;s:6:\"height\";i:224;s:4:\"file\";s:19:\"Logo-5.psd-Copy.jpg\";}s:18:\"full-1549697946516\";a:3:{s:5:\"width\";i:100;s:6:\"height\";i:90;s:4:\"file\";s:34:\"Logo-5.psd-Copy-e1549697931970.jpg\";}s:18:\"full-1549698174209\";a:3:{s:5:\"width\";i:80;s:6:\"height\";i:72;s:4:\"file\";s:34:\"Logo-5.psd-Copy-e1549697946516.jpg\";}}'),
(43, 2, '_edit_lock', '1571665100:1'),
(44, 2, '_edit_last', '1'),
(376, 102, '_edit_last', '1'),
(377, 118, '_menu_item_type', 'post_type'),
(378, 118, '_menu_item_menu_item_parent', '0'),
(379, 118, '_menu_item_object_id', '102'),
(380, 118, '_menu_item_object', 'page'),
(381, 118, '_menu_item_target', ''),
(382, 118, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(383, 118, '_menu_item_xfn', ''),
(384, 118, '_menu_item_url', ''),
(1044, 349, '_edit_lock', '1550673326:1'),
(375, 102, '_edit_lock', '1558375284:1'),
(53, 27, '_edit_lock', '1549806122:1'),
(54, 27, '_edit_last', '1'),
(55, 27, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:10:\"no-sidebar\";s:12:\"single_image\";s:19:\"wen-business-slider\";s:22:\"single_image_alignment\";s:4:\"none\";}'),
(64, 27, '_thumbnail_id', '6'),
(130, 44, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:0:\"\";s:12:\"single_image\";s:19:\"wen-business-slider\";s:22:\"single_image_alignment\";s:6:\"center\";}'),
(103, 38, '_wp_attached_file', '2019/02/800px-ITI-Chinawal-01.jpg'),
(104, 38, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:33:\"2019/02/800px-ITI-Chinawal-01.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"800px-ITI-Chinawal-01-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"800px-ITI-Chinawal-01-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:33:\"800px-ITI-Chinawal-01-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:33:\"800px-ITI-Chinawal-01-800x440.jpg\";s:5:\"width\";i:800;s:6:\"height\";i:440;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(197, 63, '_menu_item_object_id', '61'),
(172, 53, '_wp_attached_file', '2019/02/800px-ITI-Chinawal-02.jpg'),
(173, 53, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:784;s:6:\"height\";i:279;s:4:\"file\";s:33:\"2019/02/800px-ITI-Chinawal-02.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"800px-ITI-Chinawal-02-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"800px-ITI-Chinawal-02-300x107.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:107;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:33:\"800px-ITI-Chinawal-02-768x273.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:273;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(107, 40, '_wp_attached_file', '2019/02/ITI-Chinawal-04.jpg'),
(108, 40, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2048;s:6:\"height\";i:1536;s:4:\"file\";s:27:\"2019/02/ITI-Chinawal-04.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-04-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-04-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-04-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:28:\"ITI-Chinawal-04-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:28:\"ITI-Chinawal-04-1600x440.jpg\";s:5:\"width\";i:1600;s:6:\"height\";i:440;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:4:\"7230\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1413721246\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(109, 41, '_wp_attached_file', '2019/02/ITI-Chinawal-05.jpg'),
(110, 41, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2048;s:6:\"height\";i:1536;s:4:\"file\";s:27:\"2019/02/ITI-Chinawal-05.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-05-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-05-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-05-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:28:\"ITI-Chinawal-05-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:28:\"ITI-Chinawal-05-1600x440.jpg\";s:5:\"width\";i:1600;s:6:\"height\";i:440;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:4:\"7230\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1413721845\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(111, 42, '_edit_lock', '1549806097:1'),
(123, 44, '_edit_lock', '1549806115:1'),
(115, 42, '_edit_last', '1'),
(114, 42, '_thumbnail_id', '41'),
(118, 42, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:0:\"\";s:12:\"single_image\";s:19:\"wen-business-slider\";s:22:\"single_image_alignment\";s:6:\"center\";}'),
(127, 44, '_edit_last', '1'),
(126, 44, '_thumbnail_id', '40'),
(198, 63, '_menu_item_object', 'page'),
(195, 63, '_menu_item_type', 'post_type'),
(196, 63, '_menu_item_menu_item_parent', '0'),
(176, 50, '_thumbnail_id', '53'),
(183, 56, '_edit_lock', '1549809526:1'),
(184, 56, 'place_location', 'a:2:{s:3:\"lat\";s:18:\"21.194513135909926\";s:3:\"lng\";s:17:\"75.92069244384766\";}'),
(185, 56, 'route_coordinate', 'a:0:{}'),
(1037, 302, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1600;s:6:\"height\";i:900;s:4:\"file\";s:47:\"2019/02/Screenshot-from-2019-02-16-12-53-55.png\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:47:\"Screenshot-from-2019-02-16-12-53-55-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:47:\"Screenshot-from-2019-02-16-12-53-55-300x169.png\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:47:\"Screenshot-from-2019-02-16-12-53-55-768x432.png\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:48:\"Screenshot-from-2019-02-16-12-53-55-1024x576.png\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:9:\"image/png\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:48:\"Screenshot-from-2019-02-16-12-53-55-1600x440.png\";s:5:\"width\";i:1600;s:6:\"height\";i:440;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(190, 61, '_edit_lock', '1549978440:1'),
(191, 61, '_edit_last', '1'),
(177, 50, '_pingme', '1'),
(178, 50, '_encloseme', '1'),
(160, 50, '_edit_lock', '1549808062:1'),
(182, 56, '_edit_last', '1'),
(164, 50, '_edit_last', '1'),
(167, 50, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:0:\"\";s:12:\"single_image\";s:19:\"wen-business-slider\";s:22:\"single_image_alignment\";s:0:\"\";}'),
(199, 63, '_menu_item_target', ''),
(200, 63, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(201, 63, '_menu_item_xfn', ''),
(202, 63, '_menu_item_url', ''),
(204, 64, '_menu_item_type', 'post_type'),
(205, 64, '_menu_item_menu_item_parent', '0'),
(206, 64, '_menu_item_object_id', '2'),
(207, 64, '_menu_item_object', 'page'),
(208, 64, '_menu_item_target', ''),
(209, 64, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(210, 64, '_menu_item_xfn', ''),
(211, 64, '_menu_item_url', ''),
(231, 68, '_form', '<label> Your Name <span style=\"color:red\">*</span>\n    [text* your-name] </label>\n\n<label> Your Email <span style=\"color:red\">*</span>\n    [email* your-email] </label>\n\n<label> Subject <span style=\"color:red\">*</span>\n    [text* your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit \"Send\"]'),
(1056, 358, '_menu_item_object_id', '358'),
(1055, 358, '_menu_item_menu_item_parent', '212'),
(1054, 358, '_menu_item_type', 'custom'),
(1199, 472, '_menu_item_url', 'https://www.nutaniti.com/wp-admin/admin.php?page=sch-dashboard'),
(1198, 472, '_menu_item_xfn', ''),
(1197, 472, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1196, 472, '_menu_item_target', ''),
(1195, 472, '_menu_item_object', 'custom'),
(1194, 472, '_menu_item_object_id', '472'),
(1193, 472, '_menu_item_menu_item_parent', '0'),
(1192, 472, '_menu_item_type', 'custom'),
(232, 68, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:26:\"Nutan ITI \"[your-subject]\"\";s:6:\"sender\";s:30:\"Nutan_ITI <admin@nutaniti.com>\";s:9:\"recipient\";s:20:\"contact@nutaniti.com\";s:4:\"body\";s:171:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Nutan ITI (http://www.nutaniti.com)\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(233, 68, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:26:\"Nutan ITI \"[your-subject]\"\";s:6:\"sender\";s:34:\"Nutan ITI <wordpress@nutaniti.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:113:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Nutan ITI (http://www.nutaniti.com)\";s:18:\"additional_headers\";s:35:\"Reply-To: rahulbhangale26@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(234, 68, '_messages', 'a:23:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";s:12:\"invalid_date\";s:29:\"The date format is incorrect.\";s:14:\"date_too_early\";s:44:\"The date is before the earliest one allowed.\";s:13:\"date_too_late\";s:41:\"The date is after the latest one allowed.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:20:\"The file is too big.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:14:\"invalid_number\";s:29:\"The number format is invalid.\";s:16:\"number_too_small\";s:47:\"The number is smaller than the minimum allowed.\";s:16:\"number_too_large\";s:46:\"The number is larger than the maximum allowed.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:17:\"captcha_not_match\";s:31:\"Your entered code is incorrect.\";s:13:\"invalid_email\";s:38:\"The e-mail address entered is invalid.\";s:11:\"invalid_url\";s:19:\"The URL is invalid.\";s:11:\"invalid_tel\";s:32:\"The telephone number is invalid.\";}'),
(235, 68, '_additional_settings', ''),
(236, 68, '_locale', 'en_US'),
(237, 69, '_edit_lock', '1550391341:1'),
(238, 69, '_edit_last', '1'),
(239, 71, '_edit_lock', '1590067283:1'),
(240, 71, '_edit_last', '1'),
(1036, 302, '_wp_attached_file', '2019/02/Screenshot-from-2019-02-16-12-53-55.png'),
(963, 204, 'id_field', 'ID'),
(965, 205, 'filter', 'raw'),
(962, 204, 'filter', 'raw'),
(1065, 359, '_menu_item_object_id', '359'),
(1064, 359, '_menu_item_menu_item_parent', '212'),
(342, 92, '_edit_last', '1'),
(341, 92, '_edit_lock', '1550412112:1'),
(331, 89, '_edit_last', '1'),
(330, 89, '_edit_lock', '1550412372:1'),
(285, 84, '_menu_item_type', 'post_type'),
(286, 84, '_menu_item_menu_item_parent', '0'),
(287, 84, '_menu_item_object_id', '71'),
(288, 84, '_menu_item_object', 'page'),
(289, 84, '_menu_item_target', ''),
(290, 84, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(291, 84, '_menu_item_xfn', ''),
(292, 84, '_menu_item_url', ''),
(363, 98, 'wpgmap_title', ''),
(364, 98, 'wpgmap_heading_class', ''),
(961, 204, '__defaults_set', '1'),
(960, 203, 'id_field', 'ID'),
(959, 203, 'filter', 'raw'),
(958, 203, '__defaults_set', '1'),
(303, 86, '_menu_item_type', 'post_type'),
(304, 86, '_menu_item_menu_item_parent', '0'),
(305, 86, '_menu_item_object_id', '69'),
(306, 86, '_menu_item_object', 'page'),
(307, 86, '_menu_item_target', ''),
(308, 86, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(309, 86, '_menu_item_xfn', ''),
(310, 86, '_menu_item_url', ''),
(312, 87, '_menu_item_type', 'post_type'),
(313, 87, '_menu_item_menu_item_parent', '0'),
(314, 87, '_menu_item_object_id', '61'),
(315, 87, '_menu_item_object', 'page'),
(316, 87, '_menu_item_target', ''),
(317, 87, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(318, 87, '_menu_item_xfn', ''),
(319, 87, '_menu_item_url', ''),
(321, 88, '_menu_item_type', 'post_type'),
(322, 88, '_menu_item_menu_item_parent', '0'),
(323, 88, '_menu_item_object_id', '2'),
(324, 88, '_menu_item_object', 'page'),
(325, 88, '_menu_item_target', ''),
(326, 88, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(327, 88, '_menu_item_xfn', ''),
(328, 88, '_menu_item_url', ''),
(365, 98, 'wpgmap_show_heading', '0'),
(366, 98, 'wpgmap_latlng', '21.19370392312993,75.92100593278815'),
(367, 98, 'wpgmap_map_zoom', '15'),
(368, 98, 'wpgmap_disable_zoom_scroll', '0'),
(369, 98, 'wpgmap_map_width', '100%'),
(370, 98, 'wpgmap_map_height', '300px'),
(371, 98, 'wpgmap_map_type', 'ROADMAP'),
(372, 98, 'wpgmap_map_address', ''),
(373, 98, 'wpgmap_show_infowindow', '0'),
(374, 98, 'wpgmap_enable_direction', '0'),
(390, 120, '_edit_lock', '1550227730:1'),
(391, 120, '_edit_last', '1'),
(392, 122, '_edit_lock', '1550404254:1'),
(393, 122, '_edit_last', '1'),
(394, 124, '_edit_lock', '1550239261:1'),
(395, 124, '_edit_last', '1'),
(396, 126, '_edit_lock', '1550405641:1'),
(397, 126, '_edit_last', '1'),
(398, 128, '_menu_item_type', 'post_type'),
(399, 128, '_menu_item_menu_item_parent', '118'),
(400, 128, '_menu_item_object_id', '126'),
(401, 128, '_menu_item_object', 'page'),
(402, 128, '_menu_item_target', ''),
(403, 128, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(404, 128, '_menu_item_xfn', ''),
(405, 128, '_menu_item_url', ''),
(434, 143, '_wp_attached_file', '2019/02/101_1642.jpg'),
(407, 129, '_menu_item_type', 'post_type'),
(408, 129, '_menu_item_menu_item_parent', '118'),
(409, 129, '_menu_item_object_id', '124'),
(410, 129, '_menu_item_object', 'page'),
(411, 129, '_menu_item_target', ''),
(412, 129, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(413, 129, '_menu_item_xfn', ''),
(414, 129, '_menu_item_url', ''),
(416, 130, '_menu_item_type', 'post_type'),
(417, 130, '_menu_item_menu_item_parent', '118'),
(418, 130, '_menu_item_object_id', '122'),
(419, 130, '_menu_item_object', 'page'),
(420, 130, '_menu_item_target', ''),
(421, 130, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(422, 130, '_menu_item_xfn', ''),
(423, 130, '_menu_item_url', ''),
(435, 143, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:3296;s:6:\"height\";i:2472;s:4:\"file\";s:20:\"2019/02/101_1642.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"101_1642-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"101_1642-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"101_1642-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"101_1642-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:21:\"101_1642-1600x440.jpg\";s:5:\"width\";i:1600;s:6:\"height\";i:440;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"4.8\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:40:\"KODAK EASYSHARE C813 ZOOM DIGITAL CAMERA\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1549534657\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"6\";s:3:\"iso\";s:2:\"80\";s:13:\"shutter_speed\";s:8:\"0.002538\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(425, 131, '_menu_item_type', 'post_type'),
(426, 131, '_menu_item_menu_item_parent', '118'),
(427, 131, '_menu_item_object_id', '120'),
(428, 131, '_menu_item_object', 'page'),
(429, 131, '_menu_item_target', ''),
(430, 131, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(431, 131, '_menu_item_xfn', ''),
(432, 131, '_menu_item_url', ''),
(457, 151, 'view_order', '10000'),
(438, 143, '_edit_lock', '1550228887:1'),
(439, 143, '_edit_last', '1'),
(440, 2, '_thumbnail_id', '223'),
(441, 146, '_edit_lock', '1550315995:1'),
(442, 146, '_edit_last', '1'),
(443, 148, '_menu_item_type', 'post_type'),
(444, 148, '_menu_item_menu_item_parent', '0'),
(445, 148, '_menu_item_object_id', '146'),
(446, 148, '_menu_item_object', 'page'),
(447, 148, '_menu_item_target', ''),
(448, 148, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(449, 148, '_menu_item_xfn', ''),
(450, 148, '_menu_item_url', ''),
(717, 177, 'id_field', 'ID'),
(453, 151, 'title', 'NextGEN Basic Thumbnails'),
(454, 151, 'module_id', 'photocrati-nextgen_basic_gallery'),
(455, 151, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_gallery/static/thumb_preview.jpg'),
(456, 151, 'default_source', 'galleries'),
(458, 151, 'name', 'photocrati-nextgen_basic_thumbnails'),
(459, 151, 'installed_at_version', '3.1.6'),
(460, 151, 'hidden_from_ui', ''),
(461, 151, 'hidden_from_igw', ''),
(462, 151, '__defaults_set', '1'),
(463, 151, 'filter', 'raw'),
(464, 151, 'entity_types', 'WyJpbWFnZSJd'),
(465, 151, 'aliases', 'WyJiYXNpY190aHVtYm5haWwiLCJiYXNpY190aHVtYm5haWxzIiwibmV4dGdlbl9iYXNpY190aHVtYm5haWxzIl0='),
(466, 151, 'id_field', 'ID'),
(467, 151, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3ZpZXciOiJkZWZhdWx0LXZpZXcucGhwIiwiaW1hZ2VzX3Blcl9wYWdlIjoiMjQiLCJudW1iZXJfb2ZfY29sdW1ucyI6MCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwic2hvd19hbGxfaW5fbGlnaHRib3giOjAsImFqYXhfcGFnaW5hdGlvbiI6MSwidXNlX2ltYWdlYnJvd3Nlcl9lZmZlY3QiOjAsInRlbXBsYXRlIjoiIiwiZGlzcGxheV9ub19pbWFnZXNfZXJyb3IiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwic2hvd19zbGlkZXNob3dfbGluayI6MCwic2xpZGVzaG93X2xpbmtfdGV4dCI6IlZpZXcgU2xpZGVzaG93Iiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjowLCJ0aHVtYm5haWxfcXVhbGl0eSI6IjEwMCIsInRodW1ibmFpbF9jcm9wIjoxLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119'),
(468, 152, 'title', 'NextGEN Basic Slideshow'),
(469, 152, 'module_id', 'photocrati-nextgen_basic_gallery'),
(470, 152, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_gallery/static/slideshow_preview.jpg'),
(471, 152, 'default_source', 'galleries'),
(472, 152, 'view_order', '10010'),
(473, 152, 'name', 'photocrati-nextgen_basic_slideshow'),
(474, 152, 'installed_at_version', '3.1.6'),
(475, 152, 'hidden_from_ui', ''),
(476, 152, 'hidden_from_igw', ''),
(477, 152, '__defaults_set', '1'),
(478, 152, 'filter', 'raw'),
(479, 152, 'entity_types', 'WyJpbWFnZSJd'),
(480, 152, 'aliases', 'WyJiYXNpY19zbGlkZXNob3ciLCJuZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyJd'),
(481, 152, 'id_field', 'ID'),
(482, 152, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X3dpZHRoIjo3NTAsImdhbGxlcnlfaGVpZ2h0Ijo1MDAsInNob3dfdGh1bWJuYWlsX2xpbmsiOjAsInRodW1ibmFpbF9saW5rX3RleHQiOiJWaWV3IFRodW1ibmFpbHMiLCJ0ZW1wbGF0ZSI6IiIsImRpc3BsYXlfdmlldyI6ImRlZmF1bHQiLCJhdXRvcGxheSI6MSwicGF1c2VvbmhvdmVyIjoxLCJhcnJvd3MiOjAsImludGVydmFsIjozMDAwLCJ0cmFuc2l0aW9uX3NwZWVkIjozMDAsInRyYW5zaXRpb25fc3R5bGUiOiJmYWRlIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciIsIl9lcnJvcnMiOltdfQ=='),
(483, 153, 'title', 'NextGEN Basic ImageBrowser'),
(484, 153, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_imagebrowser/static/preview.jpg'),
(485, 153, 'default_source', 'galleries'),
(486, 153, 'view_order', '10020'),
(487, 153, 'name', 'photocrati-nextgen_basic_imagebrowser'),
(488, 153, 'installed_at_version', '3.1.6'),
(489, 153, 'hidden_from_ui', ''),
(490, 153, 'hidden_from_igw', ''),
(491, 153, '__defaults_set', '1'),
(492, 153, 'filter', 'raw'),
(493, 153, 'entity_types', 'WyJpbWFnZSJd'),
(494, 153, 'aliases', 'WyJiYXNpY19pbWFnZWJyb3dzZXIiLCJpbWFnZWJyb3dzZXIiLCJuZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciJd'),
(495, 153, 'id_field', 'ID'),
(496, 153, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3ZpZXciOiJkZWZhdWx0LXZpZXcucGhwIiwidGVtcGxhdGUiOiIiLCJhamF4X3BhZ2luYXRpb24iOiIxIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciIsIl9lcnJvcnMiOltdfQ=='),
(497, 154, 'title', 'NextGEN Basic SinglePic'),
(498, 154, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_singlepic/static/preview.gif'),
(499, 154, 'default_source', 'galleries'),
(500, 154, 'view_order', '10060'),
(501, 154, 'hidden_from_ui', '1'),
(502, 154, 'hidden_from_igw', '1'),
(503, 154, 'name', 'photocrati-nextgen_basic_singlepic'),
(504, 154, 'installed_at_version', '3.1.6'),
(505, 154, '__defaults_set', '1'),
(506, 154, 'filter', 'raw'),
(507, 154, 'entity_types', 'WyJpbWFnZSJd'),
(508, 154, 'aliases', 'WyJiYXNpY19zaW5nbGVwaWMiLCJzaW5nbGVwaWMiLCJuZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyJd'),
(509, 154, 'id_field', 'ID'),
(510, 154, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ3aWR0aCI6IiIsImhlaWdodCI6IiIsIm1vZGUiOiIiLCJkaXNwbGF5X3dhdGVybWFyayI6MCwiZGlzcGxheV9yZWZsZWN0aW9uIjowLCJmbG9hdCI6IiIsImxpbmsiOiIiLCJsaW5rX3RhcmdldCI6Il9ibGFuayIsInF1YWxpdHkiOjEwMCwiY3JvcCI6MCwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119'),
(511, 155, 'title', 'NextGEN Basic TagCloud'),
(512, 155, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_tagcloud/static/preview.gif'),
(513, 155, 'default_source', 'tags'),
(514, 155, 'view_order', '10100'),
(515, 155, 'name', 'photocrati-nextgen_basic_tagcloud'),
(516, 155, 'installed_at_version', '3.1.6'),
(517, 155, 'hidden_from_ui', ''),
(518, 155, 'hidden_from_igw', ''),
(519, 155, '__defaults_set', '1'),
(520, 155, 'filter', 'raw'),
(521, 155, 'entity_types', 'WyJpbWFnZSJd'),
(522, 155, 'aliases', 'WyJiYXNpY190YWdjbG91ZCIsInRhZ2Nsb3VkIiwibmV4dGdlbl9iYXNpY190YWdjbG91ZCJd'),
(523, 155, 'id_field', 'ID'),
(524, 155, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwibnVtYmVyIjo0NSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciIsIl9lcnJvcnMiOltdfQ=='),
(525, 156, 'title', 'NextGEN Basic Compact Album'),
(526, 156, 'module_id', 'photocrati-nextgen_basic_album'),
(527, 156, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_album/static/compact_preview.jpg'),
(528, 156, 'default_source', 'albums'),
(529, 156, 'view_order', '10200'),
(530, 156, 'name', 'photocrati-nextgen_basic_compact_album'),
(531, 156, 'installed_at_version', '3.1.6'),
(532, 156, 'hidden_from_ui', ''),
(533, 156, 'hidden_from_igw', ''),
(534, 156, '__defaults_set', '1'),
(535, 156, 'filter', 'raw'),
(536, 156, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(537, 156, 'aliases', 'WyJiYXNpY19jb21wYWN0X2FsYnVtIiwibmV4dGdlbl9iYXNpY19hbGJ1bSIsImJhc2ljX2FsYnVtX2NvbXBhY3QiLCJjb21wYWN0X2FsYnVtIl0='),
(538, 156, 'id_field', 'ID'),
(539, 156, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3ZpZXciOiJkZWZhdWx0LXZpZXcucGhwIiwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwiZW5hYmxlX2Rlc2NyaXB0aW9ucyI6MCwidGVtcGxhdGUiOiIiLCJvcGVuX2dhbGxlcnlfaW5fbGlnaHRib3giOjAsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MSwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX2Nyb3AiOjEsInRodW1ibmFpbF93YXRlcm1hcmsiOjAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119'),
(540, 157, 'title', 'NextGEN Basic Extended Album'),
(541, 157, 'module_id', 'photocrati-nextgen_basic_album'),
(542, 157, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_album/static/extended_preview.jpg'),
(543, 157, 'default_source', 'albums'),
(544, 157, 'view_order', '10210'),
(545, 157, 'name', 'photocrati-nextgen_basic_extended_album'),
(546, 157, 'installed_at_version', '3.1.6'),
(547, 157, 'hidden_from_ui', ''),
(548, 157, 'hidden_from_igw', ''),
(549, 157, '__defaults_set', '1'),
(550, 157, 'filter', 'raw'),
(551, 157, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(552, 157, 'aliases', 'WyJiYXNpY19leHRlbmRlZF9hbGJ1bSIsIm5leHRnZW5fYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJleHRlbmRlZF9hbGJ1bSJd'),
(553, 157, 'id_field', 'ID'),
(554, 157, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3ZpZXciOiJkZWZhdWx0LXZpZXcucGhwIiwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwiZW5hYmxlX2Rlc2NyaXB0aW9ucyI6MCwidGVtcGxhdGUiOiIiLCJvcGVuX2dhbGxlcnlfaW5fbGlnaHRib3giOjAsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MSwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX2Nyb3AiOjEsInRodW1ibmFpbF93YXRlcm1hcmsiOjAsInRodW1ibmFpbF93aWR0aCI6MzAwLCJ0aHVtYm5haWxfaGVpZ2h0IjoyMDAsImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119'),
(555, 158, '_edit_lock', '1550241581:1'),
(696, 159, 'id_field', 'ID'),
(694, 159, '__defaults_set', '1'),
(695, 159, 'filter', 'raw'),
(669, 160, 'id_field', 'ID'),
(668, 160, 'filter', 'raw'),
(699, 161, 'id_field', 'ID'),
(697, 161, '__defaults_set', '1'),
(698, 161, 'filter', 'raw'),
(667, 160, '__defaults_set', '1'),
(675, 162, 'id_field', 'ID'),
(674, 162, 'filter', 'raw'),
(673, 162, '__defaults_set', '1'),
(1069, 359, '_menu_item_xfn', ''),
(720, 176, 'id_field', 'ID'),
(719, 176, 'filter', 'raw'),
(718, 176, '__defaults_set', '1'),
(702, 165, 'id_field', 'ID'),
(700, 165, '__defaults_set', '1'),
(701, 165, 'filter', 'raw'),
(687, 166, 'id_field', 'ID'),
(686, 166, 'filter', 'raw'),
(685, 166, '__defaults_set', '1'),
(690, 167, 'id_field', 'ID'),
(689, 167, 'filter', 'raw'),
(688, 167, '__defaults_set', '1'),
(693, 168, 'id_field', 'ID'),
(692, 168, 'filter', 'raw'),
(691, 168, '__defaults_set', '1'),
(715, 177, '__defaults_set', '1'),
(716, 177, 'filter', 'raw'),
(732, 178, 'id_field', 'ID'),
(730, 178, '__defaults_set', '1'),
(731, 178, 'filter', 'raw'),
(744, 179, 'id_field', 'ID'),
(742, 179, '__defaults_set', '1'),
(743, 179, 'filter', 'raw'),
(756, 180, 'id_field', 'ID'),
(754, 180, '__defaults_set', '1'),
(755, 180, 'filter', 'raw'),
(768, 181, 'id_field', 'ID'),
(766, 181, '__defaults_set', '1'),
(767, 181, 'filter', 'raw'),
(780, 182, 'id_field', 'ID'),
(778, 182, '__defaults_set', '1'),
(779, 182, 'filter', 'raw'),
(792, 183, 'id_field', 'ID'),
(790, 183, '__defaults_set', '1'),
(791, 183, 'filter', 'raw'),
(804, 184, 'id_field', 'ID'),
(802, 184, '__defaults_set', '1'),
(803, 184, 'filter', 'raw'),
(1070, 359, '_menu_item_url', 'http://www.ncvtmis.gov.in/pages/home.aspx?AspxAutoDetectCookieSupport=1'),
(1068, 359, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1067, 359, '_menu_item_target', ''),
(902, 192, 'id_field', 'ID'),
(901, 192, 'filter', 'raw'),
(905, 193, 'id_field', 'ID'),
(904, 193, 'filter', 'raw'),
(903, 193, '__defaults_set', '1'),
(900, 192, '__defaults_set', '1'),
(908, 194, 'id_field', 'ID'),
(907, 194, 'filter', 'raw'),
(906, 194, '__defaults_set', '1'),
(911, 195, 'id_field', 'ID'),
(910, 195, 'filter', 'raw'),
(909, 195, '__defaults_set', '1'),
(914, 196, 'id_field', 'ID'),
(913, 196, 'filter', 'raw'),
(912, 196, '__defaults_set', '1'),
(917, 197, 'id_field', 'ID'),
(916, 197, 'filter', 'raw'),
(915, 197, '__defaults_set', '1'),
(920, 198, 'id_field', 'ID'),
(919, 198, 'filter', 'raw'),
(918, 198, '__defaults_set', '1'),
(923, 199, 'id_field', 'ID'),
(922, 199, 'filter', 'raw'),
(921, 199, '__defaults_set', '1'),
(924, 146, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:10:\"no-sidebar\";s:12:\"single_image\";s:0:\"\";s:22:\"single_image_alignment\";s:4:\"none\";}'),
(1066, 359, '_menu_item_object', 'custom'),
(1063, 359, '_menu_item_type', 'custom'),
(964, 205, '__defaults_set', '1'),
(966, 205, 'id_field', 'ID'),
(967, 210, '_edit_lock', '1550315897:1'),
(968, 210, '_edit_last', '1'),
(969, 212, '_menu_item_type', 'post_type'),
(970, 212, '_menu_item_menu_item_parent', '0'),
(971, 212, '_menu_item_object_id', '210'),
(972, 212, '_menu_item_object', 'page'),
(973, 212, '_menu_item_target', ''),
(974, 212, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(975, 212, '_menu_item_xfn', ''),
(976, 212, '_menu_item_url', ''),
(978, 213, '_edit_lock', '1550674493:1'),
(979, 213, '_edit_last', '1'),
(1061, 358, '_menu_item_url', 'https://admission.dvet.gov.in/Account/CandidateLogin'),
(1059, 358, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1060, 358, '_menu_item_xfn', ''),
(1058, 358, '_menu_item_target', ''),
(1057, 358, '_menu_item_object', 'custom'),
(1005, 222, '_wp_attached_file', '2019/02/ITI-Nutan-English-Medium-School-1.jpg'),
(1006, 222, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1536;s:6:\"height\";i:2048;s:4:\"file\";s:45:\"2019/02/ITI-Nutan-English-Medium-School-1.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"ITI-Nutan-English-Medium-School-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:45:\"ITI-Nutan-English-Medium-School-1-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:46:\"ITI-Nutan-English-Medium-School-1-768x1024.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:46:\"ITI-Nutan-English-Medium-School-1-768x1024.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:46:\"ITI-Nutan-English-Medium-School-1-1536x440.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:440;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:4:\"7230\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1346496023\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(1007, 223, '_wp_attached_file', '2019/02/Entrance.png'),
(1008, 223, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:859;s:6:\"height\";i:531;s:4:\"file\";s:20:\"2019/02/Entrance.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"Entrance-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"Entrance-300x185.png\";s:5:\"width\";i:300;s:6:\"height\";i:185;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"Entrance-768x475.png\";s:5:\"width\";i:768;s:6:\"height\";i:475;s:9:\"mime-type\";s:9:\"image/png\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:20:\"Entrance-859x440.png\";s:5:\"width\";i:859;s:6:\"height\";i:440;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1009, 2, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:10:\"no-sidebar\";s:12:\"single_image\";s:0:\"\";s:22:\"single_image_alignment\";s:0:\"\";}'),
(1021, 224, 'id_field', 'ID'),
(1019, 224, '__defaults_set', '1'),
(1020, 224, 'filter', 'raw'),
(1033, 225, 'id_field', 'ID'),
(1031, 225, '__defaults_set', '1'),
(1032, 225, 'filter', 'raw'),
(1034, 69, '_wp_page_template', 'templates/contact.php'),
(1035, 69, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:10:\"no-sidebar\";s:12:\"single_image\";s:0:\"\";s:22:\"single_image_alignment\";s:0:\"\";}'),
(1038, 303, '_wp_attached_file', '2019/02/Screenshot-from-2019-02-16-12-53-55-1.png'),
(1039, 303, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:993;s:6:\"height\";i:522;s:4:\"file\";s:49:\"2019/02/Screenshot-from-2019-02-16-12-53-55-1.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:49:\"Screenshot-from-2019-02-16-12-53-55-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:49:\"Screenshot-from-2019-02-16-12-53-55-1-300x158.png\";s:5:\"width\";i:300;s:6:\"height\";i:158;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:49:\"Screenshot-from-2019-02-16-12-53-55-1-768x404.png\";s:5:\"width\";i:768;s:6:\"height\";i:404;s:9:\"mime-type\";s:9:\"image/png\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:49:\"Screenshot-from-2019-02-16-12-53-55-1-993x440.png\";s:5:\"width\";i:993;s:6:\"height\";i:440;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1040, 122, '_thumbnail_id', '314'),
(1041, 122, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:10:\"no-sidebar\";s:12:\"single_image\";s:0:\"\";s:22:\"single_image_alignment\";s:0:\"\";}'),
(1042, 314, '_wp_attached_file', '2019/02/Top-view-iti.png'),
(1043, 314, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:993;s:6:\"height\";i:522;s:4:\"file\";s:24:\"2019/02/Top-view-iti.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"Top-view-iti-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"Top-view-iti-300x158.png\";s:5:\"width\";i:300;s:6:\"height\";i:158;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:24:\"Top-view-iti-768x404.png\";s:5:\"width\";i:768;s:6:\"height\";i:404;s:9:\"mime-type\";s:9:\"image/png\";}s:19:\"wen-business-slider\";a:4:{s:4:\"file\";s:24:\"Top-view-iti-993x440.png\";s:5:\"width\";i:993;s:6:\"height\";i:440;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1082, 373, 'wpforms_entries_count', '1'),
(1080, 374, '_edit_lock', '1590071434:1'),
(1081, 374, '_edit_last', '1'),
(1083, 376, '_form', '<div class=\"admission-frm\">\n<table >\n	<tr>\n		<th> <label> Student Full Name* </label> </th>\n		<td>[text* FullName placeholder \"विद्यार्थ्याचे संपुर्ण नाव\" ] </td>\n	</tr>\n	<tr>\n		<th><label> Phone Number </label></th>\n		<td>[tel PhoneNumber placeholder \"विद्यार्थ्याचा मोबाईल नंबर\"] </td>\n	</tr>\n	<tr>\n		<th> <label> Parent\'s Name  </label></th>\n		<td>[text ParentName placeholder \"पालकाचे पूर्ण नाव\"] </td>\n	</tr>\n	<tr>\n		<th><label> Parent\'s Phone Number </label></th>\n		<td>[tel ParentPhoneNumber placeholder \"पालकांचा मोबाईल नंबर\"] </td>\n	</tr>\n	<tr>\n		<th><label> Select Trade</label></th>\n		<td>[select Trade \"Fitter\" \"Electrician\"]</td>\n	</tr>\n	<tr>\n		<th><label>Birth date(as per leaving)</label></th>\n		<td>[date BirthDate]</td>\n	</tr>\n	<tr>\n		<th><label>AdharCard Number</th>\n		<td>[tel AdharCard ] </td>\n	</tr>\n	<tr>\n		<th><label> Education </label></th>\n		<td>[select Education \"10th\" \"12th\" \"Other\"]</td>     \n	</tr>\n	<tr>\n		<th><label> Caste </label></th>\n		<td>[select Caste \"OPEN\" \"OBC\" \"SC\" \"ST\" \"NT\" \"SBC\" \"OTHER\"]</td>\n	</tr>\n	<tr>\n		<th><label> Permanent Address </label></th>\n		<td>[textarea Address placeholder \"कायमचा पत्ता\"] </td>\n	</tr>\n	<tr>\n		<th><label> Photo </label></th>\n		<td>[file StudentPhoto limit:2000000 filetypes:png|jpg|jpeg]</td>\n	</tr>\n	<tr>\n		<th><label> Signature </label></th>\n		<td>[file PassportPhoto limit:2000000 filetypes:png|jpg|jpeg]</td>\n	</tr>\n</table>\n<div class=\"admission-submit\">\n	[submit \"Submit\"]\n</div>\n</div>'),
(1084, 376, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:26:\"Nutan ITI \"[your-subject]\"\";s:6:\"sender\";s:34:\"Nutan ITI <wordpress@nutaniti.com>\";s:9:\"recipient\";s:25:\"rahulbhangale26@gmail.com\";s:4:\"body\";s:183:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n[UserPhoto]\n-- \nThis e-mail was sent from a contact form on Nutan ITI (https://www.nutaniti.com)\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(1085, 376, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:26:\"Nutan ITI \"[your-subject]\"\";s:6:\"sender\";s:34:\"Nutan ITI <wordpress@nutaniti.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:114:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Nutan ITI (https://www.nutaniti.com)\";s:18:\"additional_headers\";s:35:\"Reply-To: rahulbhangale26@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(1086, 376, '_messages', 'a:23:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";s:12:\"invalid_date\";s:29:\"The date format is incorrect.\";s:14:\"date_too_early\";s:44:\"The date is before the earliest one allowed.\";s:13:\"date_too_late\";s:41:\"The date is after the latest one allowed.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:20:\"The file is too big.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:14:\"invalid_number\";s:29:\"The number format is invalid.\";s:16:\"number_too_small\";s:47:\"The number is smaller than the minimum allowed.\";s:16:\"number_too_large\";s:46:\"The number is larger than the maximum allowed.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:17:\"captcha_not_match\";s:31:\"Your entered code is incorrect.\";s:13:\"invalid_email\";s:38:\"The e-mail address entered is invalid.\";s:11:\"invalid_url\";s:19:\"The URL is invalid.\";s:11:\"invalid_tel\";s:32:\"The telephone number is invalid.\";}'),
(1087, 376, '_additional_settings', ''),
(1088, 376, '_locale', 'en_US'),
(1089, 379, '_edit_lock', '1590146193:1'),
(1090, 379, '_edit_last', '1'),
(1091, 379, '_wp_page_template', ''),
(1092, 379, 'theme_settings', 'a:3:{s:11:\"post_layout\";s:10:\"no-sidebar\";s:12:\"single_image\";s:0:\"\";s:22:\"single_image_alignment\";s:0:\"\";}'),
(1173, 376, '_config_errors', 'a:1:{s:23:\"mail.additional_headers\";a:1:{i:0;a:2:{s:4:\"code\";i:102;s:4:\"args\";a:3:{s:7:\"message\";s:51:\"Invalid mailbox syntax is used in the %name% field.\";s:6:\"params\";a:1:{s:4:\"name\";s:8:\"Reply-To\";}s:4:\"link\";s:68:\"https://contactform7.com/configuration-errors/invalid-mailbox-syntax\";}}}}'),
(1174, 379, 'education_zone_sidebar_layout', 'no-sidebar'),
(1203, 88, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1140, 424, '_edit_lock', '1590071468:1'),
(1141, 425, '_wp_attached_file', '2020/05/e95b0f91-746b-48a1-9ce1-21082fd090f1.jpg'),
(1142, 425, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1221;s:6:\"height\";i:242;s:4:\"file\";s:48:\"2020/05/e95b0f91-746b-48a1-9ce1-21082fd090f1.jpg\";s:5:\"sizes\";a:12:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:47:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-300x59.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:59;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:48:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-768x152.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:152;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:49:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-1024x203.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:203;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:25:\"education-zone-image-full\";a:4:{s:4:\"file\";s:49:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-1140x242.jpg\";s:5:\"width\";i:1140;s:6:\"height\";i:242;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:20:\"education-zone-image\";a:4:{s:4:\"file\";s:48:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-750x242.jpg\";s:5:\"width\";i:750;s:6:\"height\";i:242;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:26:\"education-zone-recent-post\";a:4:{s:4:\"file\";s:46:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-70x70.jpg\";s:5:\"width\";i:70;s:6:\"height\";i:70;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:28:\"education-zone-search-result\";a:4:{s:4:\"file\";s:48:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-246x242.jpg\";s:5:\"width\";i:246;s:6:\"height\";i:242;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"education-zone-featured-course\";a:4:{s:4:\"file\";s:48:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-276x242.jpg\";s:5:\"width\";i:276;s:6:\"height\";i:242;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:26:\"education-zone-testimonial\";a:4:{s:4:\"file\";s:48:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"education-zone-blog-full\";a:4:{s:4:\"file\";s:48:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-848x242.jpg\";s:5:\"width\";i:848;s:6:\"height\";i:242;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"education-zone-schema\";a:4:{s:4:\"file\";s:47:\"e95b0f91-746b-48a1-9ce1-21082fd090f1-600x60.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1143, 424, '_edit_last', '1'),
(1144, 424, 'education_zone_sidebar_layout', 'right-sidebar'),
(1145, 425, '_wp_attachment_is_custom_background', 'school-zone'),
(1156, 374, 'education_zone_sidebar_layout', 'right-sidebar'),
(1160, 40, '_edit_lock', '1590070522:1'),
(1161, 438, '_wp_attached_file', '2020/05/ITI-Chinawal-06-e1590071360187.jpg');
INSERT INTO `iti_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1162, 438, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2005;s:6:\"height\";i:741;s:4:\"file\";s:42:\"2020/05/ITI-Chinawal-06-e1590071360187.jpg\";s:5:\"sizes\";a:13:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:42:\"ITI-Chinawal-06-e1590071360187-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:42:\"ITI-Chinawal-06-e1590071360187-300x111.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:111;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:42:\"ITI-Chinawal-06-e1590071360187-768x284.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:284;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:43:\"ITI-Chinawal-06-e1590071360187-1024x378.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:378;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"education-zone-banner\";a:4:{s:4:\"file\";s:43:\"ITI-Chinawal-06-e1590071360187-1920x692.jpg\";s:5:\"width\";i:1920;s:6:\"height\";i:692;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:25:\"education-zone-image-full\";a:4:{s:4:\"file\";s:43:\"ITI-Chinawal-06-e1590071360187-1140x458.jpg\";s:5:\"width\";i:1140;s:6:\"height\";i:458;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:20:\"education-zone-image\";a:4:{s:4:\"file\";s:42:\"ITI-Chinawal-06-e1590071360187-750x458.jpg\";s:5:\"width\";i:750;s:6:\"height\";i:458;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:26:\"education-zone-recent-post\";a:4:{s:4:\"file\";s:40:\"ITI-Chinawal-06-e1590071360187-70x70.jpg\";s:5:\"width\";i:70;s:6:\"height\";i:70;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:28:\"education-zone-search-result\";a:4:{s:4:\"file\";s:42:\"ITI-Chinawal-06-e1590071360187-246x246.jpg\";s:5:\"width\";i:246;s:6:\"height\";i:246;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"education-zone-featured-course\";a:4:{s:4:\"file\";s:42:\"ITI-Chinawal-06-e1590071360187-276x276.jpg\";s:5:\"width\";i:276;s:6:\"height\";i:276;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:26:\"education-zone-testimonial\";a:4:{s:4:\"file\";s:42:\"ITI-Chinawal-06-e1590071360187-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"education-zone-blog-full\";a:4:{s:4:\"file\";s:42:\"ITI-Chinawal-06-e1590071360187-848x480.jpg\";s:5:\"width\";i:848;s:6:\"height\";i:480;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"education-zone-schema\";a:4:{s:4:\"file\";s:41:\"ITI-Chinawal-06-e1590071360187-600x60.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:4:\"7230\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1413721246\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(1169, 438, '_edit_lock', '1590071398:1'),
(1170, 438, '_edit_last', '1'),
(1171, 438, '_wp_attachment_backup_sizes', 'a:15:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:2005;s:6:\"height\";i:965;s:4:\"file\";s:19:\"ITI-Chinawal-06.jpg\";}s:18:\"full-1590071360187\";a:3:{s:5:\"width\";i:2005;s:6:\"height\";i:965;s:4:\"file\";s:34:\"ITI-Chinawal-06-e1590071339586.jpg\";}s:14:\"thumbnail-orig\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-06-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"medium-orig\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-06-300x144.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:144;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"medium_large-orig\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-06-768x370.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:370;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"large-orig\";a:4:{s:4:\"file\";s:28:\"ITI-Chinawal-06-1024x493.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:493;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:26:\"education-zone-banner-orig\";a:4:{s:4:\"file\";s:28:\"ITI-Chinawal-06-1920x692.jpg\";s:5:\"width\";i:1920;s:6:\"height\";i:692;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"education-zone-image-full-orig\";a:4:{s:4:\"file\";s:28:\"ITI-Chinawal-06-1140x458.jpg\";s:5:\"width\";i:1140;s:6:\"height\";i:458;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:25:\"education-zone-image-orig\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-06-750x458.jpg\";s:5:\"width\";i:750;s:6:\"height\";i:458;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:31:\"education-zone-recent-post-orig\";a:4:{s:4:\"file\";s:25:\"ITI-Chinawal-06-70x70.jpg\";s:5:\"width\";i:70;s:6:\"height\";i:70;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:33:\"education-zone-search-result-orig\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-06-246x246.jpg\";s:5:\"width\";i:246;s:6:\"height\";i:246;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:35:\"education-zone-featured-course-orig\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-06-276x276.jpg\";s:5:\"width\";i:276;s:6:\"height\";i:276;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:31:\"education-zone-testimonial-orig\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-06-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"education-zone-blog-full-orig\";a:4:{s:4:\"file\";s:27:\"ITI-Chinawal-06-848x480.jpg\";s:5:\"width\";i:848;s:6:\"height\";i:480;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:26:\"education-zone-schema-orig\";a:4:{s:4:\"file\";s:26:\"ITI-Chinawal-06-600x60.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(1233, 486, '_edit_lock', '1593660484:81'),
(1232, 485, '_edit_lock', '1593659450:82'),
(1231, 484, '_edit_lock', '1593659299:82'),
(1230, 483, '_edit_lock', '1593659296:82'),
(1204, 472, '_jp_nav_item_options', 'a:5:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:11:\"which_users\";s:9:\"logged_in\";s:7:\"can_see\";s:3:\"yes\";s:5:\"roles\";a:5:{i:0;s:13:\"administrator\";i:1;s:7:\"teacher\";i:2;s:7:\"student\";i:3;s:6:\"parent\";s:0:\"\";s:6:\"parent\";}}'),
(1205, 118, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1206, 131, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1207, 130, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1208, 129, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1209, 128, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1210, 84, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1211, 148, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1212, 212, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1213, 358, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1214, 359, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1215, 87, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1216, 86, '_jp_nav_item_options', 'a:3:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:7:\"can_see\";s:3:\"yes\";}'),
(1217, 477, '_menu_item_type', 'post_type'),
(1218, 477, '_menu_item_menu_item_parent', '0'),
(1219, 477, '_menu_item_object_id', '476'),
(1220, 477, '_menu_item_object', 'page'),
(1221, 477, '_menu_item_target', ''),
(1222, 477, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1223, 477, '_menu_item_xfn', ''),
(1224, 477, '_menu_item_url', ''),
(1226, 477, '_jp_nav_item_options', 'a:4:{s:11:\"avatar_size\";s:2:\"24\";s:13:\"redirect_type\";s:7:\"current\";s:11:\"which_users\";s:10:\"logged_out\";s:7:\"can_see\";s:3:\"yes\";}'),
(1227, 476, '_edit_lock', '1592594162:1'),
(1228, 476, '_edit_last', '1'),
(1229, 476, 'education_zone_sidebar_layout', 'right-sidebar');

-- --------------------------------------------------------

--
-- Table structure for table `iti_posts`
--

CREATE TABLE `iti_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_posts`
--

INSERT INTO `iti_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-02-06 17:19:41', '2019-02-06 17:19:41', '<!-- wp:paragraph {\"customTextColor\":\"#000000\",\"fontSize\":\"medium\"} -->\n<p style=\"color:#000000\" class=\"has-text-color has-medium-font-size\">Nutan Private Industrial Training Institute, Chinawal came into existence in the year 19XX. It was promoted by Shikshan Prasarak Mandal, Chinawal, founded in the year 19XX by the group of Professional ans Technical background experts, with a view to meet technical and industrial need for the country.</p>\n<!-- /wp:paragraph -->', 'Welcome To Nutan ITI Chinawal', '', 'publish', 'open', 'open', '', 'welcom-to-nutan-iti', '', '', '2019-02-06 17:35:03', '2019-02-06 17:35:03', '', 0, 'http://www.nutaniti.com/?p=1', 0, 'post', '', 0),
(2, 1, '2019-02-06 17:19:41', '2019-02-06 17:19:41', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"huge\"} -->\n<p class=\"has-text-color has-huge-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">ITI qualified persons can set up their own garage, motor/generator/transformer winding shops or fabrication shops depending upon trade opted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"large\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-large-font-size has-luminous-vivid-orange-color\"><strong> Why Us....</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"columns\":3} -->\n<div class=\"wp-block-columns has-3-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our focus is to teach students on a\n practical basis and we thus, teach topics using fun and attractive \ntechniques via which information gets stored rapidly.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our experience and trained staff \nensures that you will have a wonderful and worthwhile experience and \nbecome extremely well-versed with all aspects of your chosen field.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">\n                        \n							\n                                \n                                \n                                    We\n treat our students as family and never stop at just teaching. We imbibe\n prevalent values about working as one unit that will help them in the \nfuture.<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->', 'Home', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2019-10-21 13:37:25', '2019-10-21 13:37:25', '', 0, 'http://www.nutaniti.com/?page_id=2', 0, 'page', '', 0),
(369, 1, '2019-10-21 13:37:24', '2019-10-21 13:37:24', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"huge\"} -->\n<p class=\"has-text-color has-huge-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">ITI qualified persons can set up their own garage, motor/generator/transformer winding shops or fabrication shops depending upon trade opted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"large\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-large-font-size has-luminous-vivid-orange-color\"><strong> Why Us....</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"columns\":3} -->\n<div class=\"wp-block-columns has-3-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our focus is to teach students on a\n practical basis and we thus, teach topics using fun and attractive \ntechniques via which information gets stored rapidly.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our experience and trained staff \nensures that you will have a wonderful and worthwhile experience and \nbecome extremely well-versed with all aspects of your chosen field.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">\n                        \n							\n                                \n                                \n                                    We\n treat our students as family and never stop at just teaching. We imbibe\n prevalent values about working as one unit that will help them in the \nfuture.<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-10-21 13:37:24', '2019-10-21 13:37:24', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(106, 1, '2019-02-12 17:19:13', '2019-02-12 17:19:13', '', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-12 17:19:13', '2019-02-12 17:19:13', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(107, 1, '2019-02-12 17:24:31', '2019-02-12 17:24:31', '', 'Trades', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-12 17:24:31', '2019-02-12 17:24:31', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2019-02-09 11:15:24', '2019-02-09 11:15:24', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td><strong>Name of the Institute</strong></td><td>Nutan ITI (Pvt.)</td></tr><tr><td><strong>Address of the Institute</strong></td><td>Nutan ITI, Rojoda Rd Chinawal Pincode : 425505</td></tr><tr><td><strong>Date of Establishment</strong></td><td>19XX</td></tr><tr><td><strong>DGET File Reference No.</strong></td><td></td></tr><tr><td><strong>Code Allotted by DGET</strong></td><td></td></tr><tr><td><strong>Contact No.</strong></td><td></td></tr><tr><td><strong>Mobile No.</strong></td><td></td></tr><tr><td><strong>Fax No.</strong></td><td></td></tr><tr><td><strong>Email Id</strong></td><td></td></tr><tr><td><strong>Location – Rural/Urban</strong></td><td>Chinawal</td></tr><tr><td><strong>Approach/How to Reach</strong></td><td></td></tr></tbody></table>\n<!-- /wp:table -->', 'About', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-09 11:15:24', '2019-02-09 11:15:24', '', 2, 'http://www.nutaniti.com/archives/23', 0, 'revision', '', 0),
(21, 1, '2019-02-09 11:14:20', '2019-02-09 11:14:20', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>a.</td><td><strong>Name of the Institute</strong></td><td>Nutan ITI (Pvt.)</td></tr><tr><td>b.</td><td><strong>Address of the Institute</strong></td><td>Nutan ITI, Rojoda Rd Chinawal Pincode : 425505</td></tr><tr><td>c.</td><td><strong>Date of Establishment</strong></td><td>19XX</td></tr><tr><td>d.</td><td><strong>DGET File Reference No.</strong></td><td></td></tr><tr><td>e.</td><td><strong>Code Allotted by DGET</strong></td><td></td></tr><tr><td>f.</td><td><strong>Contact No.</strong></td><td></td></tr><tr><td>g.</td><td><strong>Mobile No.</strong></td><td></td></tr><tr><td>h.</td><td><strong>Fax No.</strong></td><td></td></tr><tr><td>i.</td><td><strong>Email Id</strong></td><td></td></tr><tr><td>j.</td><td><strong>Location – Rural/Urban</strong></td><td>Chinawal</td></tr><tr><td>k.</td><td><strong>Approach/How to Reach</strong></td><td></td></tr></tbody></table>\n<!-- /wp:table -->', 'About', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-09 11:14:20', '2019-02-09 11:14:20', '', 2, 'http://www.nutaniti.com/archives/21', 0, 'revision', '', 0),
(3, 1, '2019-02-06 17:19:41', '2019-02-06 17:19:41', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://www.nutaniti.com.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2019-02-06 17:19:41', '2019-02-06 17:19:41', '', 0, 'http://www.nutaniti.com/?page_id=3', 0, 'page', '', 0),
(6, 1, '2019-02-06 17:26:56', '2019-02-06 17:26:56', '', '3598 ITI LOGO', '3598 ITI LOGO', 'inherit', 'open', 'closed', '', '3598-iti-logo', '', '', '2019-02-06 17:26:56', '2019-02-06 17:26:56', '', 1, 'http://www.nutaniti.com/wp-content/uploads/2019/02/itiambar1.jpg', 0, 'attachment', 'image/jpeg', 0),
(7, 1, '2019-02-06 17:27:08', '2019-02-06 17:27:08', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-02-06 17:27:08', '2019-02-06 17:27:08', '', 1, 'http://www.nutaniti.com/2019/02/06/1-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2019-02-06 17:27:27', '2019-02-06 17:27:27', '<!-- wp:paragraph -->\n<p>Nutan Private Industrial Training Institute, Chinawal came into existence in the year 19XX. It was promoted by Shikshan Prasarak Mandal, Chinawal, founded in the year 19XX by the group of Professional ans Technical background experts, with a view to meet technical and industrial need for the country.</p>\n<!-- /wp:paragraph -->', 'Welcome To Nutan ITI Chinawal', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-02-06 17:27:27', '2019-02-06 17:27:27', '', 1, 'http://www.nutaniti.com/2019/02/06/1-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2019-02-09 07:34:12', '2019-02-09 07:34:12', '', 'Logo', '', 'inherit', 'open', 'closed', '', 'logo-5-psd-copy', '', '', '2019-02-09 07:43:00', '2019-02-09 07:43:00', '', 0, 'http://www.nutaniti.com/wp-content/uploads/2019/02/Logo-5.psd-Copy.jpg', 0, 'attachment', 'image/jpeg', 0),
(12, 1, '2019-02-06 17:35:02', '2019-02-06 17:35:02', '<!-- wp:paragraph {\"customTextColor\":\"#000000\",\"fontSize\":\"medium\"} -->\n<p style=\"color:#000000\" class=\"has-text-color has-medium-font-size\">Nutan Private Industrial Training Institute, Chinawal came into existence in the year 19XX. It was promoted by Shikshan Prasarak Mandal, Chinawal, founded in the year 19XX by the group of Professional ans Technical background experts, with a view to meet technical and industrial need for the country.</p>\n<!-- /wp:paragraph -->', 'Welcome To Nutan ITI Chinawal', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-02-06 17:35:02', '2019-02-06 17:35:02', '', 1, 'http://www.nutaniti.com/2019/02/06/1-revision-v1/', 0, 'revision', '', 0),
(222, 1, '2019-02-16 13:37:55', '2019-02-16 13:37:55', '', 'ITI-Nutan-English-Medium-School-1', '', 'inherit', 'open', 'closed', '', 'iti-nutan-english-medium-school-1', '', '', '2019-02-16 13:37:55', '2019-02-16 13:37:55', '', 2, 'http://www.nutaniti.com/wp-content/uploads/2019/02/ITI-Nutan-English-Medium-School-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(223, 1, '2019-02-16 14:00:03', '2019-02-16 14:00:03', '', 'Entrance', '', 'inherit', 'open', 'closed', '', 'entrance', '', '', '2019-02-16 14:00:03', '2019-02-16 14:00:03', '', 2, 'http://www.nutaniti.com/wp-content/uploads/2019/02/Entrance.png', 0, 'attachment', 'image/png', 0),
(27, 1, '2019-02-09 11:22:16', '2019-02-09 11:22:16', '', 'Industrial Training Institute', '', 'publish', 'closed', 'closed', '', 'industrial-training-institute', '', '', '2019-02-10 13:42:02', '2019-02-10 13:42:02', '', 0, 'http://www.nutaniti.com/?p=27', 0, 'post', '', 0),
(20, 1, '2019-02-09 11:14:16', '2019-02-09 11:14:16', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://www.nutaniti.com/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-09 11:14:16', '2019-02-09 11:14:16', '', 2, 'http://www.nutaniti.com/archives/20', 0, 'revision', '', 0),
(102, 1, '2019-02-12 17:15:54', '2019-02-12 17:15:54', '<!-- wp:table /-->\n\n<!-- wp:paragraph -->\n<p>Nutan Industrial Training Institute Chinawal is one of the most well-known and efficient Industrial Training Institute (ITI)  in Jalgaon disrict Maharashtra State  (MS, India). </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>This Institute is established in Year 2012.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It is situated on Rozoda road Chinawal Village Tal-Raver, Dist-Jalgaon  approximately  6 km away from Savda Bus Stand  and  approximately 14 km away from Raver.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It belongs to Directorate of Vocational Education &amp; Training  [ <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"http://www.dvet.gov.in\">www.dvet.gov.in</a>  ], Mumbai, under Ministry of Higher &amp; Technical Education.<br></p>\n<!-- /wp:paragraph -->', 'About Us', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2019-05-20 18:01:23', '2019-05-20 18:01:23', '', 0, 'http://www.nutaniti.com/?page_id=102', 0, 'page', '', 0),
(28, 1, '2019-02-09 11:20:36', '2019-02-09 11:20:36', '', 'Industrial Training Institute', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2019-02-09 11:20:36', '2019-02-09 11:20:36', '', 27, 'http://www.nutaniti.com/archives/28', 0, 'revision', '', 0),
(224, 1, '2019-02-16 14:05:45', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 14:05:45', '2019-02-16 14:05:45', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=224', 0, 'ngg_pictures', '', 0),
(225, 1, '2019-02-16 14:06:23', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 14:06:23', '2019-02-16 14:06:23', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=225', 0, 'ngg_pictures', '', 0),
(38, 1, '2019-02-10 13:39:35', '2019-02-10 13:39:35', '', '800px-ITI-Chinawal-01', '', 'inherit', 'open', 'closed', '', '800px-iti-chinawal-01', '', '', '2019-02-10 13:39:35', '2019-02-10 13:39:35', '', 2, 'http://www.nutaniti.com/wp-content/uploads/2019/02/800px-ITI-Chinawal-01.jpg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2019-02-10 13:58:31', '2019-02-10 13:58:31', '', '800px-ITI-Chinawal-02', '', 'inherit', 'open', 'closed', '', '800px-iti-chinawal-02', '', '', '2019-02-10 13:58:31', '2019-02-10 13:58:31', '', 50, 'http://www.nutaniti.com/wp-content/uploads/2019/02/800px-ITI-Chinawal-02.jpg', 0, 'attachment', 'image/jpeg', 0),
(40, 1, '2019-02-10 13:39:40', '2019-02-10 13:39:40', '', 'ITI-Chinawal-04', '', 'inherit', 'open', 'closed', '', 'iti-chinawal-04', '', '', '2019-02-10 13:39:40', '2019-02-10 13:39:40', '', 2, 'http://www.nutaniti.com/wp-content/uploads/2019/02/ITI-Chinawal-04.jpg', 0, 'attachment', 'image/jpeg', 0),
(41, 1, '2019-02-10 13:39:44', '2019-02-10 13:39:44', '', 'ITI-Chinawal-05', '', 'inherit', 'open', 'closed', '', 'iti-chinawal-05', '', '', '2019-02-10 13:39:44', '2019-02-10 13:39:44', '', 2, 'http://www.nutaniti.com/wp-content/uploads/2019/02/ITI-Chinawal-05.jpg', 0, 'attachment', 'image/jpeg', 0),
(42, 1, '2019-02-10 13:41:35', '2019-02-10 13:41:35', '', 'Play Area', '', 'publish', 'open', 'open', '', 'play-area', '', '', '2019-02-10 13:41:37', '2019-02-10 13:41:37', '', 0, 'http://www.nutaniti.com/?p=42', 0, 'post', '', 0),
(43, 1, '2019-02-10 13:41:35', '2019-02-10 13:41:35', '', 'Play Area', '', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2019-02-10 13:41:35', '2019-02-10 13:41:35', '', 42, 'http://www.nutaniti.com/archives/43', 0, 'revision', '', 0),
(44, 1, '2019-02-10 13:44:02', '2019-02-10 13:44:02', '', 'Nutan Private ITI, Chinawal', '', 'publish', 'open', 'open', '', 'nutan-private-iti-chinawal', '', '', '2019-02-10 13:44:03', '2019-02-10 13:44:03', '', 0, 'http://www.nutaniti.com/?p=44', 0, 'post', '', 0),
(45, 1, '2019-02-10 13:44:02', '2019-02-10 13:44:02', '', 'Nutan Private ITI, Chinawal', '', 'inherit', 'closed', 'closed', '', '44-revision-v1', '', '', '2019-02-10 13:44:02', '2019-02-10 13:44:02', '', 44, 'http://www.nutaniti.com/archives/45', 0, 'revision', '', 0),
(50, 1, '2019-02-10 13:52:56', '2019-02-10 13:52:56', '', 'Workshop', '', 'publish', 'open', 'open', '', 'workshop', '', '', '2019-02-10 13:58:41', '2019-02-10 13:58:41', '', 0, 'http://www.nutaniti.com/?p=50', 0, 'post', '', 0),
(51, 1, '2019-02-10 13:52:56', '2019-02-10 13:52:56', '', 'Workshop', '', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2019-02-10 13:52:56', '2019-02-10 13:52:56', '', 50, 'http://www.nutaniti.com/archives/51', 0, 'revision', '', 0),
(56, 1, '2019-02-10 14:27:28', '2019-02-10 14:27:28', '[umap lat=<span id=\"latlngspan\" class=\"coordinatetxt\">21.193895</span> lng=<span id=\"latlngspan\" class=\"coordinatetxt\">75.920151</span> ]', 'Nutan ITI Chinawal', '', 'publish', 'closed', 'closed', '', 'nutan-iti-chinawal', '', '', '2019-02-10 14:40:55', '2019-02-10 14:40:55', '', 0, 'http://www.nutaniti.com/?post_type=place&#038;p=56', 0, 'place', '', 0),
(57, 1, '2019-02-10 14:30:29', '2019-02-10 14:30:29', '[umap lat=74 lo', 'Nutan ITI Chinawal', '', 'inherit', 'closed', 'closed', '', '56-autosave-v1', '', '', '2019-02-10 14:30:29', '2019-02-10 14:30:29', '', 56, 'http://www.nutaniti.com/56-autosave-v1/', 0, 'revision', '', 0),
(302, 1, '2019-02-17 11:20:07', '2019-02-17 11:20:07', '', 'Screenshot from 2019-02-16 12-53-55', '', 'inherit', 'open', 'closed', '', 'screenshot-from-2019-02-16-12-53-55', '', '', '2019-02-17 11:20:07', '2019-02-17 11:20:07', '', 122, 'http://www.nutaniti.com/wp-content/uploads/2019/02/Screenshot-from-2019-02-16-12-53-55.png', 0, 'attachment', 'image/png', 0),
(303, 1, '2019-02-17 11:21:56', '2019-02-17 11:21:56', '', 'Screenshot from 2019-02-16 12-53-55', '', 'inherit', 'open', 'closed', '', 'screenshot-from-2019-02-16-12-53-55-2', '', '', '2019-02-17 11:21:56', '2019-02-17 11:21:56', '', 122, 'http://www.nutaniti.com/wp-content/uploads/2019/02/Screenshot-from-2019-02-16-12-53-55-1.png', 0, 'attachment', 'image/png', 0),
(61, 1, '2019-02-10 14:48:22', '2019-02-10 14:48:22', '<!-- wp:paragraph -->\n<p>Join Us Why we ae</p>\n<!-- /wp:paragraph -->', 'Career', '', 'publish', 'closed', 'closed', '', 'career', '', '', '2019-02-10 14:51:06', '2019-02-10 14:51:06', '', 0, 'http://www.nutaniti.com/?page_id=61', 0, 'page', '', 0),
(62, 1, '2019-02-10 14:48:22', '2019-02-10 14:48:22', '<!-- wp:paragraph -->\n<p>Join Us</p>\n<!-- /wp:paragraph -->', 'Career', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2019-02-10 14:48:22', '2019-02-10 14:48:22', '', 61, 'http://www.nutaniti.com/61-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2019-02-10 14:50:24', '2019-02-10 14:50:24', ' ', '', '', 'publish', 'closed', 'closed', '', '63', '', '', '2019-02-10 14:53:19', '2019-02-10 14:53:19', '', 0, 'http://www.nutaniti.com/?p=63', 1, 'nav_menu_item', '', 0),
(64, 1, '2019-02-10 14:50:24', '2019-02-10 14:50:24', ' ', '', '', 'publish', 'closed', 'closed', '', '64', '', '', '2019-02-10 14:53:19', '2019-02-10 14:53:19', '', 0, 'http://www.nutaniti.com/?p=64', 2, 'nav_menu_item', '', 0),
(358, 1, '2019-05-20 17:54:07', '2019-05-20 17:54:07', '', 'Admission Login', '', 'publish', 'closed', 'closed', '', 'admission-login', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=358', 12, 'nav_menu_item', '', 0),
(472, 1, '2020-06-15 15:49:50', '2020-06-15 15:49:50', '', 'Dashboard', '', 'publish', 'closed', 'closed', '', 'dashboard', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'https://www.nutaniti.com/?p=472', 3, 'nav_menu_item', '', 0),
(67, 1, '2019-02-10 14:51:06', '2019-02-10 14:51:06', '<!-- wp:paragraph -->\n<p>Join Us Why we ae</p>\n<!-- /wp:paragraph -->', 'Career', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2019-02-10 14:51:06', '2019-02-10 14:51:06', '', 61, 'http://www.nutaniti.com/61-revision-v1/', 0, 'revision', '', 0),
(68, 1, '2019-02-10 14:55:14', '2019-02-10 14:55:14', '<label> Your Name <span style=\"color:red\">*</span>\r\n    [text* your-name] </label>\r\n\r\n<label> Your Email <span style=\"color:red\">*</span>\r\n    [email* your-email] </label>\r\n\r\n<label> Subject <span style=\"color:red\">*</span>\r\n    [text* your-subject] </label>\r\n\r\n<label> Your Message\r\n    [textarea your-message] </label>\r\n\r\n[submit \"Send\"]\n1\nNutan ITI \"[your-subject]\"\nNutan_ITI <admin@nutaniti.com>\ncontact@nutaniti.com\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on Nutan ITI (http://www.nutaniti.com)\nReply-To: [your-email]\n\n\n\n\nNutan ITI \"[your-subject]\"\nNutan ITI <wordpress@nutaniti.com>\n[your-email]\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on Nutan ITI (http://www.nutaniti.com)\nReply-To: rahulbhangale26@gmail.com\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nYour entered code is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2019-02-17 07:45:17', '2019-02-17 07:45:17', '', 0, 'http://www.nutaniti.com/?post_type=wpcf7_contact_form&#038;p=68', 0, 'wpcf7_contact_form', '', 0),
(69, 1, '2019-02-10 14:56:04', '2019-02-10 14:56:04', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\",\"className\":\"contactus-blck\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color contactus-blck\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Location:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nutan Private ITI, Rozoda road, Chinawal, Tal-Raver, Dist-Jalgaon, Pin code- 425505</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Email &amp; Phone-</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>contact@nutaniti.com                                   Phone No- 0285-XXX<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Contact Us', '', 'publish', 'closed', 'closed', '', 'contact-us', '', '', '2019-02-17 07:46:05', '2019-02-17 07:46:05', '', 0, 'http://www.nutaniti.com/?page_id=69', 0, 'page', '', 0),
(70, 1, '2019-02-10 14:56:04', '2019-02-10 14:56:04', '<!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode -->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-10 14:56:04', '2019-02-10 14:56:04', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0),
(71, 1, '2019-02-12 13:24:49', '2019-02-12 13:24:49', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Electrician:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Total Units :</strong></td><td>2                       </td></tr><tr><td><strong>Durations :</strong></td><td>2 Years</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Fitter:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Total Units :</strong></td><td>2                          </td></tr><tr><td><strong>Durations :</strong></td><td>2 Years</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Trades', '', 'publish', 'closed', 'closed', '', 'departments', '', '', '2019-02-17 14:15:19', '2019-02-17 14:15:19', '', 0, 'http://www.nutaniti.com/?page_id=71', 0, 'page', '', 0),
(72, 1, '2019-02-12 13:24:49', '2019-02-12 13:24:49', '', 'Departments', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-12 13:24:49', '2019-02-12 13:24:49', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0),
(364, 1, '2019-08-24 16:46:11', '2019-08-24 16:46:11', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"huge\"} -->\n<p class=\"has-text-color has-huge-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">ITI qualified persons can set up their own garage, motor/generator/transformer winding shops or fabrication shops depending upon trade opted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"large\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-large-font-size has-luminous-vivid-orange-color\"><strong> Why Us....</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"columns\":3} -->\n<div class=\"wp-block-columns has-3-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our focus is to teach students on a\n practical basis and we thus, teach topics using fun and attractive \ntechniques via which information gets stored rapidly.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our experience and trained staff \nensures that you will have a wonderful and worthwhile experience and \nbecome extremely well-versed with all aspects of your chosen field.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">\n                        \n							\n                                \n                                \n                                    We\n treat our students as family and never stop at just teaching. We imbibe\n prevalent values about working as one unit that will help them in the \nfuture.<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode -->\n[wp_mobi]\n<!-- /wp:shortcode -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-08-24 16:46:11', '2019-08-24 16:46:11', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(90, 1, '2019-02-12 16:51:19', '2019-02-12 16:51:19', '', 'Fitter', '', 'inherit', 'closed', 'closed', '', '89-revision-v1', '', '', '2019-02-12 16:51:19', '2019-02-12 16:51:19', '', 89, 'http://www.nutaniti.com/89-revision-v1/', 0, 'revision', '', 0),
(89, 1, '2019-02-12 16:51:19', '2019-02-12 16:51:19', '<!-- wp:paragraph -->\n<p>Total Unit: 2</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Fitter', '', 'publish', 'closed', 'closed', '', 'fitter', '', '', '2019-02-17 13:55:34', '2019-02-17 13:55:34', '', 0, 'http://www.nutaniti.com/?page_id=89', 0, 'page', '', 0),
(349, 1, '2019-02-20 14:37:34', '0000-00-00 00:00:00', '<!-- wp:columns {\"columns\":3} -->\n<div class=\"wp-block-columns has-3-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Our focus is to teach students on a\n practical basis and we thus, teach topics using fun and attractive \ntechniques via which information gets stored rapidly.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Our experience and trained staff \nensures that you will have a wonderful and worthwhile experience and \nbecome extremely well-versed with all aspects of your chosen field.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Why Us', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-02-20 14:37:34', '2019-02-20 14:37:34', '', 0, 'http://www.nutaniti.com/?page_id=349', 0, 'page', '', 0),
(84, 1, '2019-02-12 13:47:04', '2019-02-12 13:47:04', ' ', '', '', 'publish', 'closed', 'closed', '', '84', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=84', 9, 'nav_menu_item', '', 0),
(86, 1, '2019-02-12 13:47:24', '2019-02-12 13:47:24', ' ', '', '', 'publish', 'closed', 'closed', '', '86', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=86', 15, 'nav_menu_item', '', 0),
(87, 1, '2019-02-12 13:47:24', '2019-02-12 13:47:24', ' ', '', '', 'publish', 'closed', 'closed', '', '87', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=87', 14, 'nav_menu_item', '', 0),
(88, 1, '2019-02-12 13:47:24', '2019-02-12 13:47:24', ' ', '', '', 'publish', 'closed', 'closed', '', '88', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=88', 1, 'nav_menu_item', '', 0),
(92, 1, '2019-02-12 16:52:11', '2019-02-12 16:52:11', '<!-- wp:paragraph -->\n<p>Total Units 2</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Electrician', '', 'publish', 'closed', 'closed', '', 'electrician', '', '', '2019-02-17 14:02:03', '2019-02-17 14:02:03', '', 0, 'http://www.nutaniti.com/?page_id=92', 0, 'page', '', 0),
(93, 1, '2019-02-12 16:52:11', '2019-02-12 16:52:11', '', 'Electrician', '', 'inherit', 'closed', 'closed', '', '92-revision-v1', '', '', '2019-02-12 16:52:11', '2019-02-12 16:52:11', '', 92, 'http://www.nutaniti.com/92-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `iti_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(344, 1, '2019-02-17 14:08:35', '2019-02-17 14:08:35', '<!-- wp:paragraph -->\n<p>Total Unit: 2</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Fitter', '', 'inherit', 'closed', 'closed', '', '89-autosave-v1', '', '', '2019-02-17 14:08:35', '2019-02-17 14:08:35', '', 89, 'http://www.nutaniti.com/89-autosave-v1/', 0, 'revision', '', 0),
(203, 1, '2019-02-16 07:16:21', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:16:21', '2019-02-16 07:16:21', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=203', 0, 'ngg_gallery', '', 0),
(98, 1, '2019-02-12 17:04:57', '0000-00-00 00:00:00', '', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-02-12 17:04:57', '0000-00-00 00:00:00', '', 0, 'http://www.nutaniti.com/?p=98', 0, 'wpgmapembed', '', 0),
(103, 1, '2019-02-12 17:15:54', '2019-02-12 17:15:54', '', 'About Us', '', 'inherit', 'closed', 'closed', '', '102-revision-v1', '', '', '2019-02-12 17:15:54', '2019-02-12 17:15:54', '', 102, 'http://www.nutaniti.com/102-revision-v1/', 0, 'revision', '', 0),
(100, 1, '2019-02-12 17:14:13', '2019-02-12 17:14:13', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td><strong>Name of the Institute</strong></td><td>Nutan ITI (Pvt.)</td></tr><tr><td><strong>Address of the Institute</strong></td><td>Nutan ITI, Rojoda Rd Chinawal Pincode : 425505</td></tr><tr><td><strong>Date of Establishment</strong></td><td>19XX</td></tr><tr><td><strong>DGET File Reference No.</strong></td><td></td></tr><tr><td><strong>Code Allotted by DGET</strong></td><td></td></tr><tr><td><strong>Contact No.</strong></td><td></td></tr><tr><td><strong>Mobile No.</strong></td><td></td></tr><tr><td><strong>Fax No.</strong></td><td></td></tr><tr><td><strong>Email Id</strong></td><td></td></tr><tr><td><strong>Location – Rural/Urban</strong></td><td>Chinawal</td></tr><tr><td><strong>Approach/How to Reach</strong></td><td></td></tr></tbody></table>\n<!-- /wp:table -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-12 17:14:13', '2019-02-12 17:14:13', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(105, 1, '2019-02-12 17:18:06', '2019-02-12 17:18:06', '<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td><strong>Name of the Institute</strong></td><td>Nutan ITI (Pvt.)</td></tr><tr><td><strong>Address of the Institute</strong></td><td>Nutan ITI, Rojoda Rd Chinawal Pincode : 425505</td></tr><tr><td><strong>Date of Establishment</strong></td><td>19XX</td></tr><tr><td><strong>DGET File Reference No.</strong></td></tr><tr><td><strong>Code Allotted by DGET</strong></td></tr><tr><td><strong>Contact No.</strong></td></tr><tr><td><strong>Mobile No.</strong></td></tr><tr><td><strong>Fax No.</strong></td></tr><tr><td><strong>Email Id</strong></td></tr><tr><td><strong>Location – Rural/Urban</strong></td><td>Chinawal</td></tr><tr><td><strong>Approach/How to Reach</strong></td></tr></tbody></table>\n<!-- /wp:table -->', 'About Us', '', 'inherit', 'closed', 'closed', '', '102-revision-v1', '', '', '2019-02-12 17:18:06', '2019-02-12 17:18:06', '', 102, 'http://www.nutaniti.com/102-revision-v1/', 0, 'revision', '', 0),
(109, 1, '2019-02-12 17:28:03', '2019-02-12 17:28:03', '<!-- wp:paragraph -->\n<p>Welcome </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Nutan Private ITI, Chinawal.</strong>Industrial Training Institute \n(ITI\'s) are training institute which provide training in technical field\n in India. Normally a person who has passed 10 standard (SSLC) is \neligible for admission to ITI. The objective of opening of ITI is \nprovide technical manpower to industries.\n<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-12 17:28:03', '2019-02-12 17:28:03', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(113, 1, '2019-02-12 17:38:03', '2019-02-12 17:38:03', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-color has-large-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-12 17:38:03', '2019-02-12 17:38:03', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(111, 1, '2019-02-12 17:31:46', '2019-02-12 17:31:46', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-color has-large-font-size has-luminous-vivid-orange-color\">Welcome to Nutan Private ITI, Chinawal.</p>\n<!-- /wp:paragraph -->', 'Untitled Reusable Block', '', 'publish', 'closed', 'closed', '', 'untitled-reusable-block', '', '', '2019-02-12 17:31:46', '2019-02-12 17:31:46', '', 0, 'http://www.nutaniti.com/untitled-reusable-block/', 0, 'wp_block', '', 0),
(112, 1, '2019-02-12 17:36:32', '2019-02-12 17:36:32', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-color has-large-font-size has-luminous-vivid-orange-color\">Welcome <span class=\"has-very-dark-gray-color has-medium-font-size\"> to Nutan Private ITI, Chinawal.</span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-12 17:36:32', '2019-02-12 17:36:32', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(114, 1, '2019-02-12 17:38:42', '2019-02-12 17:38:42', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"huge\"} -->\n<p class=\"has-text-color has-huge-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-12 17:38:42', '2019-02-12 17:38:42', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(118, 1, '2019-02-15 10:41:28', '2019-02-15 10:41:28', ' ', '', '', 'publish', 'closed', 'closed', '', '118', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=118', 4, 'nav_menu_item', '', 0),
(117, 1, '2019-02-15 10:38:07', '2019-02-15 10:38:07', '<!-- wp:table /-->\n\n<!-- wp:paragraph -->\n<p>Nutan Industrial Training Institute Chinawal is one of the most well-known and efficient Industrial Training Institute (ITI)  in Jalgaon disrict Maharashtra State  (MS, India). </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>This Institute is established in Year 2012.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It is situated on Rozoda road Chinawal Village Tal-Raver, Dist-Jalgaon  approximately  6 km away from Savda Bus Stand  and  approximately 14 km away from Raver.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It belongs to Directorate of Vocational Education &amp; Training  [ <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"http://www.dvet.gov.in\">www.dvet.gov.in</a>  ], Mumbai, under Ministry of Higher &amp; Technical Education.<br></p>\n<!-- /wp:paragraph -->', 'About Us', '', 'inherit', 'closed', 'closed', '', '102-revision-v1', '', '', '2019-02-15 10:38:07', '2019-02-15 10:38:07', '', 102, 'http://www.nutaniti.com/102-revision-v1/', 0, 'revision', '', 0),
(120, 1, '2019-02-15 10:48:49', '2019-02-15 10:48:49', '', 'History', '', 'publish', 'closed', 'closed', '', 'history', '', '', '2019-02-15 10:48:49', '2019-02-15 10:48:49', '', 0, 'http://www.nutaniti.com/?page_id=120', 0, 'page', '', 0),
(121, 1, '2019-02-15 10:48:49', '2019-02-15 10:48:49', '', 'History', '', 'inherit', 'closed', 'closed', '', '120-revision-v1', '', '', '2019-02-15 10:48:49', '2019-02-15 10:48:49', '', 120, 'http://www.nutaniti.com/120-revision-v1/', 0, 'revision', '', 0),
(122, 1, '2019-02-15 10:49:05', '2019-02-15 10:49:05', '<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p style=\"text-align:center\" class=\"has-medium-font-size infra-blck\"><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Land Area :&nbsp; 10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Workshops :&nbsp; 928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class Rooms :&nbsp; 91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Conference &amp; Drawing Hall :&nbsp;&nbsp; 125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Computer Lab :&nbsp;&nbsp; 30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Library :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">All Machines &amp; Equipments for all existing trades in this institute. : AS per the DGET Norms</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Instructional Staff :&nbsp;&nbsp;&nbsp; 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class IV Staff :&nbsp; 03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'publish', 'closed', 'closed', '', 'infrastructure', '', '', '2019-02-17 11:51:24', '2019-02-17 11:51:24', '', 0, 'http://www.nutaniti.com/?page_id=122', 0, 'page', '', 0),
(123, 1, '2019-02-15 10:49:05', '2019-02-15 10:49:05', '', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-15 10:49:05', '2019-02-15 10:49:05', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(124, 1, '2019-02-15 10:49:25', '2019-02-15 10:49:25', '', 'Staff', '', 'publish', 'closed', 'closed', '', 'staff', '', '', '2019-02-15 10:49:26', '2019-02-15 10:49:26', '', 0, 'http://www.nutaniti.com/?page_id=124', 0, 'page', '', 0),
(125, 1, '2019-02-15 10:49:25', '2019-02-15 10:49:25', '', 'Staff', '', 'inherit', 'closed', 'closed', '', '124-revision-v1', '', '', '2019-02-15 10:49:25', '2019-02-15 10:49:25', '', 124, 'http://www.nutaniti.com/124-revision-v1/', 0, 'revision', '', 0),
(126, 1, '2019-02-15 10:50:52', '2019-02-15 10:50:52', '', 'IMC', '', 'publish', 'closed', 'closed', '', 'imc', '', '', '2019-02-15 10:50:53', '2019-02-15 10:50:53', '', 0, 'http://www.nutaniti.com/?page_id=126', 0, 'page', '', 0),
(127, 1, '2019-02-15 10:50:52', '2019-02-15 10:50:52', '', 'IMC', '', 'inherit', 'closed', 'closed', '', '126-revision-v1', '', '', '2019-02-15 10:50:52', '2019-02-15 10:50:52', '', 126, 'http://www.nutaniti.com/126-revision-v1/', 0, 'revision', '', 0),
(128, 1, '2019-02-15 10:51:38', '2019-02-15 10:51:38', ' ', '', '', 'publish', 'closed', 'closed', '', '128', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=128', 8, 'nav_menu_item', '', 0),
(129, 1, '2019-02-15 10:51:38', '2019-02-15 10:51:38', ' ', '', '', 'publish', 'closed', 'closed', '', '129', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=129', 7, 'nav_menu_item', '', 0),
(130, 1, '2019-02-15 10:51:38', '2019-02-15 10:51:38', ' ', '', '', 'publish', 'closed', 'closed', '', '130', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=130', 6, 'nav_menu_item', '', 0),
(131, 1, '2019-02-15 10:51:38', '2019-02-15 10:51:38', ' ', '', '', 'publish', 'closed', 'closed', '', '131', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=131', 5, 'nav_menu_item', '', 0),
(151, 1, '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGh1bWJuYWlscyIsIm1vZHVsZV9pZCI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19nYWxsZXJ5IiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2dhbGxlcnlcL3N0YXRpY1wvdGh1bWJfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDAwLCJhbGlhc2VzIjpbImJhc2ljX3RodW1ibmFpbCIsImJhc2ljX3RodW1ibmFpbHMiLCJuZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiXSwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIzLjEuNiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3ZpZXciOiJkZWZhdWx0LXZpZXcucGhwIiwiaW1hZ2VzX3Blcl9wYWdlIjoiMjQiLCJudW1iZXJfb2ZfY29sdW1ucyI6MCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwic2hvd19hbGxfaW5fbGlnaHRib3giOjAsImFqYXhfcGFnaW5hdGlvbiI6MSwidXNlX2ltYWdlYnJvd3Nlcl9lZmZlY3QiOjAsInRlbXBsYXRlIjoiIiwiZGlzcGxheV9ub19pbWFnZXNfZXJyb3IiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwic2hvd19zbGlkZXNob3dfbGluayI6MCwic2xpZGVzaG93X2xpbmtfdGV4dCI6IlZpZXcgU2xpZGVzaG93Iiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjowLCJ0aHVtYm5haWxfcXVhbGl0eSI6IjEwMCIsInRodW1ibmFpbF9jcm9wIjoxLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic Thumbnails', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGh1bWJuYWlscyIsIm1vZHVsZV9pZCI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19nYWxsZXJ5IiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2dhbGxlcnlcL3N0YXRpY1wvdGh1bWJfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDAwLCJhbGlhc2VzIjpbImJhc2ljX3RodW1ibmFpbCIsImJhc2ljX3RodW1ibmFpbHMiLCJuZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiXSwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIzLjEuNiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3ZpZXciOiJkZWZhdWx0LXZpZXcucGhwIiwiaW1hZ2VzX3Blcl9wYWdlIjoiMjQiLCJudW1iZXJfb2ZfY29sdW1ucyI6MCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwic2hvd19hbGxfaW5fbGlnaHRib3giOjAsImFqYXhfcGFnaW5hdGlvbiI6MSwidXNlX2ltYWdlYnJvd3Nlcl9lZmZlY3QiOjAsInRlbXBsYXRlIjoiIiwiZGlzcGxheV9ub19pbWFnZXNfZXJyb3IiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwic2hvd19zbGlkZXNob3dfbGluayI6MCwic2xpZGVzaG93X2xpbmtfdGV4dCI6IlZpZXcgU2xpZGVzaG93Iiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjowLCJ0aHVtYm5haWxfcXVhbGl0eSI6IjEwMCIsInRodW1ibmFpbF9jcm9wIjoxLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://www.nutaniti.com/?post_type=display_type&p=151', 0, 'display_type', '', 0),
(136, 1, '2019-02-15 10:57:27', '2019-02-15 10:57:27', '<!-- wp:paragraph -->\n<p>Shikshan Prasarak Mandal completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-15 10:57:27', '2019-02-15 10:57:27', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(150, 1, '2019-02-15 14:06:32', '2019-02-15 14:06:32', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI</strong></p>\n<!-- /wp:paragraph -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-15 14:06:32', '2019-02-15 14:06:32', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(138, 1, '2019-02-15 11:00:14', '2019-02-15 11:00:14', '<!-- wp:paragraph -->\n<p><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Land &amp; Workpspace :</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Land Area :  </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Built up Area : </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin. Bldgs : </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Workshops :  <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class Rooms :  </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Conference Hall :   <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Computer Lab :   <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>P. I. R. Lab :          </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Meter Testing Lab : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Central Store : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Head of Institute : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vice Principals :  <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ad ministerial Staff : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Instructional Staff :    <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class IV Staff :  <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-15 11:00:14', '2019-02-15 11:00:14', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(148, 1, '2019-02-15 14:04:02', '2019-02-15 14:04:02', ' ', '', '', 'publish', 'closed', 'closed', '', '148', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=148', 10, 'nav_menu_item', '', 0),
(140, 1, '2019-02-15 11:02:26', '2019-02-15 11:02:26', '<!-- wp:paragraph -->\n<p><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Land &amp; Workpspace :</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Land Area :  </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Built up Area : </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin. Bldgs : </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Workshops :  <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class Rooms :  </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Conference Hall :   <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Computer Lab :   <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>P. I. R. Lab :          </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Meter Testing Lab : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Central Store : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Head of Institute : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vice Principals :  <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ad ministerial Staff : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Instructional Staff :    <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class IV Staff :  <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-15 11:02:26', '2019-02-15 11:02:26', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(143, 1, '2019-02-15 11:08:30', '2019-02-15 11:08:30', '', '101_1642', '', 'inherit', 'open', 'closed', '', '101_1642', '', '', '2019-02-15 11:10:16', '2019-02-15 11:10:16', '', 0, 'http://www.nutaniti.com/wp-content/uploads/2019/02/101_1642.jpg', 0, 'attachment', 'image/jpeg', 0),
(142, 1, '2019-02-15 11:06:26', '2019-02-15 11:06:26', '<!-- wp:paragraph -->\n<p><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Land Area :&nbsp; </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Built up Area : </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin. Bldgs : </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Workshops :&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class Rooms :&nbsp; </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Conference Hall :&nbsp;&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Computer Lab :&nbsp;&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>P. I. R. Lab :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Meter Testing Lab : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Central Store : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Head of Institute : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vice Principals :&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ad ministerial Staff : <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Instructional Staff :&nbsp;&nbsp;&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class IV Staff :&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-15 11:06:26', '2019-02-15 11:06:26', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(146, 1, '2019-02-15 14:03:40', '2019-02-15 14:03:40', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Classrooms and Labs:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"2\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Extra Curriculam Activities:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"3\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Staff and Meetings:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"4\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'publish', 'closed', 'closed', '', 'gallery', '', '', '2019-02-16 07:19:37', '2019-02-16 07:19:37', '', 0, 'http://www.nutaniti.com/?page_id=146', 0, 'page', '', 0),
(147, 1, '2019-02-15 14:03:40', '2019-02-15 14:03:40', '', 'Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-15 14:03:40', '2019-02-15 14:03:40', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(152, 1, '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2xpZGVzaG93IiwibW9kdWxlX2lkIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2dhbGxlcnkiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfZ2FsbGVyeVwvc3RhdGljXC9zbGlkZXNob3dfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDEwLCJhbGlhc2VzIjpbImJhc2ljX3NsaWRlc2hvdyIsIm5leHRnZW5fYmFzaWNfc2xpZGVzaG93Il0sIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2xpZGVzaG93IiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIzLjEuNiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X3dpZHRoIjo3NTAsImdhbGxlcnlfaGVpZ2h0Ijo1MDAsInNob3dfdGh1bWJuYWlsX2xpbmsiOjAsInRodW1ibmFpbF9saW5rX3RleHQiOiJWaWV3IFRodW1ibmFpbHMiLCJ0ZW1wbGF0ZSI6IiIsImRpc3BsYXlfdmlldyI6ImRlZmF1bHQiLCJhdXRvcGxheSI6MSwicGF1c2VvbmhvdmVyIjoxLCJhcnJvd3MiOjAsImludGVydmFsIjozMDAwLCJ0cmFuc2l0aW9uX3NwZWVkIjozMDAsInRyYW5zaXRpb25fc3R5bGUiOiJmYWRlIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciIsIl9lcnJvcnMiOltdfSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJoaWRkZW5fZnJvbV9pZ3ciOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'NextGEN Basic Slideshow', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2xpZGVzaG93IiwibW9kdWxlX2lkIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2dhbGxlcnkiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfZ2FsbGVyeVwvc3RhdGljXC9zbGlkZXNob3dfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDEwLCJhbGlhc2VzIjpbImJhc2ljX3NsaWRlc2hvdyIsIm5leHRnZW5fYmFzaWNfc2xpZGVzaG93Il0sIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2xpZGVzaG93IiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIzLjEuNiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X3dpZHRoIjo3NTAsImdhbGxlcnlfaGVpZ2h0Ijo1MDAsInNob3dfdGh1bWJuYWlsX2xpbmsiOjAsInRodW1ibmFpbF9saW5rX3RleHQiOiJWaWV3IFRodW1ibmFpbHMiLCJ0ZW1wbGF0ZSI6IiIsImRpc3BsYXlfdmlldyI6ImRlZmF1bHQiLCJhdXRvcGxheSI6MSwicGF1c2VvbmhvdmVyIjoxLCJhcnJvd3MiOjAsImludGVydmFsIjozMDAwLCJ0cmFuc2l0aW9uX3NwZWVkIjozMDAsInRyYW5zaXRpb25fc3R5bGUiOiJmYWRlIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciIsIl9lcnJvcnMiOltdfSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJoaWRkZW5fZnJvbV9pZ3ciOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://www.nutaniti.com/?post_type=display_type&p=152', 0, 'display_type', '', 0),
(153, 1, '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgSW1hZ2VCcm93c2VyIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3Nlclwvc3RhdGljXC9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMjAsImFsaWFzZXMiOlsiYmFzaWNfaW1hZ2Vicm93c2VyIiwiaW1hZ2Vicm93c2VyIiwibmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXIiXSwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXIiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjMuMS42IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc3BsYXlfdmlldyI6ImRlZmF1bHQtdmlldy5waHAiLCJ0ZW1wbGF0ZSI6IiIsImFqYXhfcGFnaW5hdGlvbiI6IjEiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic ImageBrowser', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgSW1hZ2VCcm93c2VyIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3Nlclwvc3RhdGljXC9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMjAsImFsaWFzZXMiOlsiYmFzaWNfaW1hZ2Vicm93c2VyIiwiaW1hZ2Vicm93c2VyIiwibmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXIiXSwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXIiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjMuMS42IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc3BsYXlfdmlldyI6ImRlZmF1bHQtdmlldy5waHAiLCJ0ZW1wbGF0ZSI6IiIsImFqYXhfcGFnaW5hdGlvbiI6IjEiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://www.nutaniti.com/?post_type=display_type&p=153', 0, 'display_type', '', 0),
(154, 1, '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2luZ2xlUGljIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpY1wvc3RhdGljXC9wcmV2aWV3LmdpZiIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwNjAsImhpZGRlbl9mcm9tX3VpIjp0cnVlLCJoaWRkZW5fZnJvbV9pZ3ciOnRydWUsImFsaWFzZXMiOlsiYmFzaWNfc2luZ2xlcGljIiwic2luZ2xlcGljIiwibmV4dGdlbl9iYXNpY19zaW5nbGVwaWMiXSwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19zaW5nbGVwaWMiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjMuMS42IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIndpZHRoIjoiIiwiaGVpZ2h0IjoiIiwibW9kZSI6IiIsImRpc3BsYXlfd2F0ZXJtYXJrIjowLCJkaXNwbGF5X3JlZmxlY3Rpb24iOjAsImZsb2F0IjoiIiwibGluayI6IiIsImxpbmtfdGFyZ2V0IjoiX2JsYW5rIiwicXVhbGl0eSI6MTAwLCJjcm9wIjowLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJfZXJyb3JzIjpbXX0sIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic SinglePic', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2luZ2xlUGljIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpY1wvc3RhdGljXC9wcmV2aWV3LmdpZiIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwNjAsImhpZGRlbl9mcm9tX3VpIjp0cnVlLCJoaWRkZW5fZnJvbV9pZ3ciOnRydWUsImFsaWFzZXMiOlsiYmFzaWNfc2luZ2xlcGljIiwic2luZ2xlcGljIiwibmV4dGdlbl9iYXNpY19zaW5nbGVwaWMiXSwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19zaW5nbGVwaWMiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjMuMS42IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIndpZHRoIjoiIiwiaGVpZ2h0IjoiIiwibW9kZSI6IiIsImRpc3BsYXlfd2F0ZXJtYXJrIjowLCJkaXNwbGF5X3JlZmxlY3Rpb24iOjAsImZsb2F0IjoiIiwibGluayI6IiIsImxpbmtfdGFyZ2V0IjoiX2JsYW5rIiwicXVhbGl0eSI6MTAwLCJjcm9wIjowLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJfZXJyb3JzIjpbXX0sIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://www.nutaniti.com/?post_type=display_type&p=154', 0, 'display_type', '', 0),
(155, 1, '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGFnQ2xvdWQiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfdGFnY2xvdWRcL3N0YXRpY1wvcHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6InRhZ3MiLCJ2aWV3X29yZGVyIjoxMDEwMCwiYWxpYXNlcyI6WyJiYXNpY190YWdjbG91ZCIsInRhZ2Nsb3VkIiwibmV4dGdlbl9iYXNpY190YWdjbG91ZCJdLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RhZ2Nsb3VkIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIzLjEuNiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwibnVtYmVyIjo0NSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciIsIl9lcnJvcnMiOltdfSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJoaWRkZW5fZnJvbV9pZ3ciOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'NextGEN Basic TagCloud', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGFnQ2xvdWQiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfdGFnY2xvdWRcL3N0YXRpY1wvcHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6InRhZ3MiLCJ2aWV3X29yZGVyIjoxMDEwMCwiYWxpYXNlcyI6WyJiYXNpY190YWdjbG91ZCIsInRhZ2Nsb3VkIiwibmV4dGdlbl9iYXNpY190YWdjbG91ZCJdLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RhZ2Nsb3VkIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIzLjEuNiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwibnVtYmVyIjo0NSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciIsIl9lcnJvcnMiOltdfSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJoaWRkZW5fZnJvbV9pZ3ciOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://www.nutaniti.com/?post_type=display_type&p=155', 0, 'display_type', '', 0),
(156, 1, '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgQ29tcGFjdCBBbGJ1bSIsIm1vZHVsZV9pZCI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19hbGJ1bSIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfYWxidW1cL3N0YXRpY1wvY29tcGFjdF9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiYWxidW1zIiwidmlld19vcmRlciI6MTAyMDAsImFsaWFzZXMiOlsiYmFzaWNfY29tcGFjdF9hbGJ1bSIsIm5leHRnZW5fYmFzaWNfYWxidW0iLCJiYXNpY19hbGJ1bV9jb21wYWN0IiwiY29tcGFjdF9hbGJ1bSJdLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2NvbXBhY3RfYWxidW0iLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjMuMS42IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc3BsYXlfdmlldyI6ImRlZmF1bHQtdmlldy5waHAiLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJlbmFibGVfZGVzY3JpcHRpb25zIjowLCJ0ZW1wbGF0ZSI6IiIsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoxLCJ0aHVtYm5haWxfcXVhbGl0eSI6MTAwLCJ0aHVtYm5haWxfY3JvcCI6MSwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJfZXJyb3JzIjpbXX0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiaGlkZGVuX2Zyb21faWd3IjpmYWxzZSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'NextGEN Basic Compact Album', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgQ29tcGFjdCBBbGJ1bSIsIm1vZHVsZV9pZCI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19hbGJ1bSIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfYWxidW1cL3N0YXRpY1wvY29tcGFjdF9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiYWxidW1zIiwidmlld19vcmRlciI6MTAyMDAsImFsaWFzZXMiOlsiYmFzaWNfY29tcGFjdF9hbGJ1bSIsIm5leHRnZW5fYmFzaWNfYWxidW0iLCJiYXNpY19hbGJ1bV9jb21wYWN0IiwiY29tcGFjdF9hbGJ1bSJdLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2NvbXBhY3RfYWxidW0iLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjMuMS42IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc3BsYXlfdmlldyI6ImRlZmF1bHQtdmlldy5waHAiLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJlbmFibGVfZGVzY3JpcHRpb25zIjowLCJ0ZW1wbGF0ZSI6IiIsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoxLCJ0aHVtYm5haWxfcXVhbGl0eSI6MTAwLCJ0aHVtYm5haWxfY3JvcCI6MSwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJfZXJyb3JzIjpbXX0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiaGlkZGVuX2Zyb21faWd3IjpmYWxzZSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?post_type=display_type&p=156', 0, 'display_type', '', 0);
INSERT INTO `iti_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(157, 1, '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgRXh0ZW5kZWQgQWxidW0iLCJtb2R1bGVfaWQiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfYWxidW0iLCJlbnRpdHlfdHlwZXMiOlsiYWxidW0iLCJnYWxsZXJ5Il0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2FsYnVtXC9zdGF0aWNcL2V4dGVuZGVkX3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJhbGJ1bXMiLCJ2aWV3X29yZGVyIjoxMDIxMCwiYWxpYXNlcyI6WyJiYXNpY19leHRlbmRlZF9hbGJ1bSIsIm5leHRnZW5fYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJleHRlbmRlZF9hbGJ1bSJdLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIzLjEuNiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3ZpZXciOiJkZWZhdWx0LXZpZXcucGhwIiwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwiZW5hYmxlX2Rlc2NyaXB0aW9ucyI6MCwidGVtcGxhdGUiOiIiLCJvcGVuX2dhbGxlcnlfaW5fbGlnaHRib3giOjAsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MSwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX2Nyb3AiOjEsInRodW1ibmFpbF93YXRlcm1hcmsiOjAsInRodW1ibmFpbF93aWR0aCI6MzAwLCJ0aHVtYm5haWxfaGVpZ2h0IjoyMDAsImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic Extended Album', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-02-15 14:25:53', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgRXh0ZW5kZWQgQWxidW0iLCJtb2R1bGVfaWQiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfYWxidW0iLCJlbnRpdHlfdHlwZXMiOlsiYWxidW0iLCJnYWxsZXJ5Il0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2FsYnVtXC9zdGF0aWNcL2V4dGVuZGVkX3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJhbGJ1bXMiLCJ2aWV3X29yZGVyIjoxMDIxMCwiYWxpYXNlcyI6WyJiYXNpY19leHRlbmRlZF9hbGJ1bSIsIm5leHRnZW5fYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJleHRlbmRlZF9hbGJ1bSJdLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIzLjEuNiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3ZpZXciOiJkZWZhdWx0LXZpZXcucGhwIiwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwiZW5hYmxlX2Rlc2NyaXB0aW9ucyI6MCwidGVtcGxhdGUiOiIiLCJvcGVuX2dhbGxlcnlfaW5fbGlnaHRib3giOjAsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MSwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX2Nyb3AiOjEsInRodW1ibmFpbF93YXRlcm1hcmsiOjAsInRodW1ibmFpbF93aWR0aCI6MzAwLCJ0aHVtYm5haWxfaGVpZ2h0IjoyMDAsImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://www.nutaniti.com/?post_type=display_type&p=157', 0, 'display_type', '', 0),
(158, 1, '2019-02-15 14:41:08', '0000-00-00 00:00:00', '', 'Entrance', '', 'draft', 'open', 'open', '', '', '', '', '2019-02-15 14:41:08', '2019-02-15 14:41:08', '', 0, 'http://www.nutaniti.com/?p=158', 0, 'post', '', 0),
(159, 1, '2019-02-16 05:44:57', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_album', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 05:44:57', '2019-02-16 05:44:57', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?post_type=ngg_album&#038;p=159', 0, 'ngg_album', '', 0),
(160, 1, '2019-02-16 05:44:35', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 05:44:35', '2019-02-16 05:44:35', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=160', 0, 'ngg_gallery', '', 0),
(161, 1, '2019-02-16 05:45:40', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 05:45:40', '2019-02-16 05:45:40', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=161', 0, 'ngg_pictures', '', 0),
(162, 1, '2019-02-16 05:44:36', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 05:44:36', '2019-02-16 05:44:36', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=162', 0, 'ngg_pictures', '', 0),
(176, 1, '2019-02-16 06:16:59', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 06:16:59', '2019-02-16 06:16:59', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=176', 0, 'ngg_gallery', '', 0),
(165, 1, '2019-02-16 05:57:54', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 05:57:54', '2019-02-16 05:57:54', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=165', 0, 'ngg_pictures', '', 0),
(166, 1, '2019-02-16 05:44:36', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 05:44:36', '2019-02-16 05:44:36', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=166', 0, 'ngg_pictures', '', 0),
(167, 1, '2019-02-16 05:44:36', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 05:44:36', '2019-02-16 05:44:36', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=167', 0, 'ngg_pictures', '', 0),
(168, 1, '2019-02-16 05:44:36', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 05:44:36', '2019-02-16 05:44:36', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=168', 0, 'ngg_pictures', '', 0),
(172, 1, '2019-02-16 05:52:38', '2019-02-16 05:52:38', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_pro_grid_album\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 05:52:38', '2019-02-16 05:52:38', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(170, 1, '2019-02-16 05:51:12', '2019-02-16 05:51:12', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_basic_slideshow\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 05:51:12', '2019-02-16 05:51:12', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(173, 1, '2019-02-16 05:53:42', '2019-02-16 05:53:42', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images album_ids=\"1\" display_type=\"photocrati-nextgen_pro_grid_album\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 05:53:42', '2019-02-16 05:53:42', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(174, 1, '2019-02-16 05:54:35', '2019-02-16 05:54:35', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images album_ids=\"1\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 05:54:35', '2019-02-16 05:54:35', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(175, 1, '2019-02-16 05:54:50', '2019-02-16 05:54:50', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 05:54:50', '2019-02-16 05:54:50', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(177, 1, '2019-02-16 06:16:59', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 06:16:59', '2019-02-16 06:16:59', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=177', 0, 'ngg_pictures', '', 0),
(178, 1, '2019-02-16 06:17:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 06:17:01', '2019-02-16 06:17:01', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=178', 0, 'ngg_pictures', '', 0),
(179, 1, '2019-02-16 06:17:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 06:17:06', '2019-02-16 06:17:06', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=179', 0, 'ngg_pictures', '', 0),
(180, 1, '2019-02-16 06:17:10', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 06:17:10', '2019-02-16 06:17:10', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=180', 0, 'ngg_pictures', '', 0),
(181, 1, '2019-02-16 06:17:11', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 06:17:11', '2019-02-16 06:17:11', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=181', 0, 'ngg_pictures', '', 0),
(182, 1, '2019-02-16 06:17:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 06:17:17', '2019-02-16 06:17:17', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=182', 0, 'ngg_pictures', '', 0),
(183, 1, '2019-02-16 06:17:22', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 06:17:22', '2019-02-16 06:17:22', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=183', 0, 'ngg_pictures', '', 0),
(184, 1, '2019-02-16 06:17:23', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 06:17:23', '2019-02-16 06:17:23', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=184', 0, 'ngg_pictures', '', 0),
(185, 1, '2019-02-16 06:20:23', '2019-02-16 06:20:23', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"2\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 06:20:23', '2019-02-16 06:20:23', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(190, 1, '2019-02-16 06:30:17', '2019-02-16 06:30:17', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"huge\"} -->\n<p class=\"has-text-color has-huge-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p> ITI qualified persons can set up their own garage,  motor/generator/transformer winding shops or fabrication shops depending  upon trade opted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-16 06:30:17', '2019-02-16 06:30:17', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(188, 1, '2019-02-16 06:23:34', '2019-02-16 06:23:34', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Classrooms and Labs:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"2\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 06:23:34', '2019-02-16 06:23:34', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(192, 1, '2019-02-16 07:05:41', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:05:41', '2019-02-16 07:05:41', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=192', 0, 'ngg_gallery', '', 0),
(193, 1, '2019-02-16 07:05:41', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:05:41', '2019-02-16 07:05:41', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=193', 0, 'ngg_pictures', '', 0),
(194, 1, '2019-02-16 07:05:41', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:05:41', '2019-02-16 07:05:41', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=194', 0, 'ngg_pictures', '', 0),
(195, 1, '2019-02-16 07:05:41', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:05:41', '2019-02-16 07:05:41', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=195', 0, 'ngg_pictures', '', 0),
(196, 1, '2019-02-16 07:05:41', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:05:41', '2019-02-16 07:05:41', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=196', 0, 'ngg_pictures', '', 0),
(197, 1, '2019-02-16 07:05:41', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:05:41', '2019-02-16 07:05:41', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=197', 0, 'ngg_pictures', '', 0),
(198, 1, '2019-02-16 07:05:41', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:05:41', '2019-02-16 07:05:41', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=198', 0, 'ngg_pictures', '', 0),
(199, 1, '2019-02-16 07:05:41', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:05:41', '2019-02-16 07:05:41', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=199', 0, 'ngg_pictures', '', 0),
(200, 1, '2019-02-16 07:06:55', '2019-02-16 07:06:55', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Classrooms and Labs:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"2\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Extra Curriculam Activities:</strong></p>\n<!-- /wp:paragraph -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 07:06:55', '2019-02-16 07:06:55', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(201, 1, '2019-02-16 07:07:10', '2019-02-16 07:07:10', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Classrooms and Labs:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"2\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Extra Curriculam Activities:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"3\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 07:07:10', '2019-02-16 07:07:10', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(204, 1, '2019-02-16 07:16:21', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:16:21', '2019-02-16 07:16:21', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=204', 0, 'ngg_pictures', '', 0),
(205, 1, '2019-02-16 07:16:21', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2019-02-16 07:16:21', '2019-02-16 07:16:21', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://www.nutaniti.com/?p=205', 0, 'ngg_pictures', '', 0),
(210, 1, '2019-02-16 11:18:16', '2019-02-16 11:18:16', '', 'Student\'s Corner', '', 'publish', 'closed', 'closed', '', 'students-corner', '', '', '2019-02-16 11:18:17', '2019-02-16 11:18:17', '', 0, 'http://www.nutaniti.com/?page_id=210', 0, 'page', '', 0),
(211, 1, '2019-02-16 11:18:16', '2019-02-16 11:18:16', '', 'Student\'s Corner', '', 'inherit', 'closed', 'closed', '', '210-revision-v1', '', '', '2019-02-16 11:18:16', '2019-02-16 11:18:16', '', 210, 'http://www.nutaniti.com/210-revision-v1/', 0, 'revision', '', 0),
(212, 1, '2019-02-16 11:18:52', '2019-02-16 11:18:52', '', 'Student\'s Corner', '', 'publish', 'closed', 'closed', '', 'students-corner', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=212', 11, 'nav_menu_item', '', 0),
(213, 1, '2019-02-16 11:19:24', '2019-02-16 11:19:24', '', 'Admission Process', '', 'publish', 'closed', 'closed', '', 'admission-process', '', '', '2019-02-16 11:19:25', '2019-02-16 11:19:25', '', 0, 'http://www.nutaniti.com/?page_id=213', 0, 'page', '', 0),
(214, 1, '2019-02-16 11:19:24', '2019-02-16 11:19:24', '', 'Admission Process', '', 'inherit', 'closed', 'closed', '', '213-revision-v1', '', '', '2019-02-16 11:19:24', '2019-02-16 11:19:24', '', 213, 'http://www.nutaniti.com/213-revision-v1/', 0, 'revision', '', 0),
(359, 1, '2019-05-20 17:55:17', '2019-05-20 17:55:17', '', 'MIS Portal', '', 'publish', 'closed', 'closed', '', 'mis-portal', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'http://www.nutaniti.com/?p=359', 13, 'nav_menu_item', '', 0),
(209, 1, '2019-02-16 07:19:36', '2019-02-16 07:19:36', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Classrooms and Labs:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"2\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Extra Curriculam Activities:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"3\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Staff and Meetings:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"4\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 07:19:36', '2019-02-16 07:19:36', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(207, 1, '2019-02-16 07:18:11', '2019-02-16 07:18:11', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Welcome to Nutan ITI:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"1\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Classrooms and Labs:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"2\" display_type=\"photocrati-nextgen_basic_thumbnails\"  gallery_width=\"600\" gallery_height=\"400\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Extra Curriculam Activities:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"3\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Staff and Meetings:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ngg_images gallery_ids=\"4\" display_type=\"photocrati-nextgen_basic_thumbnails\"]\n<!-- /wp:shortcode -->', 'Photo Gallery', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2019-02-16 07:18:11', '2019-02-16 07:18:11', '', 146, 'http://www.nutaniti.com/146-revision-v1/', 0, 'revision', '', 0),
(218, 1, '2019-02-16 11:29:07', '2019-02-16 11:29:07', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"huge\"} -->\n<p class=\"has-text-color has-huge-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\"> ITI qualified persons can set up their own garage,  motor/generator/transformer winding shops or fabrication shops depending  upon trade opted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-16 11:29:07', '2019-02-16 11:29:07', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(335, 1, '2019-02-17 14:06:17', '2019-02-17 14:06:17', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Electrician:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Fitter:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Trades', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-17 14:06:17', '2019-02-17 14:06:17', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0),
(284, 1, '2019-02-17 07:10:55', '2019-02-17 07:10:55', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode -->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-17 07:10:55', '2019-02-17 07:10:55', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0),
(318, 1, '2019-02-17 13:55:34', '2019-02-17 13:55:34', '<!-- wp:paragraph -->\n<p>Total Unit: 2</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Fitter', '', 'inherit', 'closed', 'closed', '', '89-revision-v1', '', '', '2019-02-17 13:55:34', '2019-02-17 13:55:34', '', 89, 'http://www.nutaniti.com/89-revision-v1/', 0, 'revision', '', 0),
(244, 1, '2019-02-17 06:19:24', '2019-02-17 06:19:24', '', 'Change Password', 'Change Password', 'publish', 'closed', 'closed', '', 'sch-changepassword', '', '', '2019-02-17 06:19:24', '2019-02-17 06:19:24', '', 0, 'http://www.nutaniti.com/sch-changepassword/', 0, 'page', '', 0),
(245, 1, '2019-02-17 06:19:24', '2019-02-17 06:19:24', '', 'Payment', 'Fees', 'publish', 'closed', 'closed', '', 'sch-payment', '', '', '2019-02-17 06:19:24', '2019-02-17 06:19:24', '', 0, 'http://www.nutaniti.com/sch-payment/', 0, 'page', '', 0),
(290, 1, '2019-02-17 07:22:32', '2019-02-17 07:22:32', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns has-2-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Location:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nutan Private ITI, Rozoda road, Chinawal, Tal-Raver, Dist-Jalgaon, Pin code- 425505</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Email &amp; Phone-</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>contact@nutaniti.com                                   Phone No- 0285-XXX<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-17 07:22:32', '2019-02-17 07:22:32', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0),
(287, 1, '2019-02-17 07:16:37', '2019-02-17 07:16:37', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns has-2-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>abgspoifd</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>nmdl;m;dm;oldjkiopdok;ljomopifm;lio</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:shortcode /-->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-17 07:16:37', '2019-02-17 07:16:37', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0),
(293, 1, '2019-02-17 07:25:23', '2019-02-17 07:25:23', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns has-2-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns has-2-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Location:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nutan Private ITI, Rozoda road, Chinawal, Tal-Raver, Dist-Jalgaon, Pin code- 425505</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Email &amp; Phone-</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>contact@nutaniti.com                                   Phone No- 0285-XXX<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-17 07:25:23', '2019-02-17 07:25:23', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0),
(296, 1, '2019-02-17 07:39:12', '2019-02-17 07:39:12', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Location:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nutan Private ITI, Rozoda road, Chinawal, Tal-Raver, Dist-Jalgaon, Pin code- 425505</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Email &amp; Phone-</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>contact@nutaniti.com                                   Phone No- 0285-XXX<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-17 07:39:12', '2019-02-17 07:39:12', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0),
(295, 1, '2019-02-17 07:28:44', '2019-02-17 07:28:44', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns has-2-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Location:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nutan Private ITI, Rozoda road, Chinawal, Tal-Raver, Dist-Jalgaon, Pin code- 425505</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Email &amp; Phone-</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>contact@nutaniti.com                                   Phone No- 0285-XXX<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-17 07:28:44', '2019-02-17 07:28:44', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0),
(297, 1, '2019-02-17 07:39:31', '2019-02-17 07:39:31', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\",\"className\":\"contactus-blck\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color contactus-blck\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Location:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nutan Private ITI, Rozoda road, Chinawal, Tal-Raver, Dist-Jalgaon, Pin code- 425505</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Email &amp; Phone-</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>contact@nutaniti.com                                   Phone No- 0285-XXX<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-17 07:39:31', '2019-02-17 07:39:31', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `iti_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(300, 1, '2019-02-17 07:46:05', '2019-02-17 07:46:05', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\",\"className\":\"contactus-blck\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color contactus-blck\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Location:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nutan Private ITI, Rozoda road, Chinawal, Tal-Raver, Dist-Jalgaon, Pin code- 425505</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Email &amp; Phone-</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>contact@nutaniti.com                                   Phone No- 0285-XXX<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-17 07:46:05', '2019-02-17 07:46:05', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0),
(299, 1, '2019-02-17 07:39:50', '2019-02-17 07:39:50', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\",\"className\":\"contactus-blck\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color contactus-blck\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Location:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nutan Private ITI, Rozoda road, Chinawal, Tal-Raver, Dist-Jalgaon, Pin code- 425505</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Email &amp; Phone-</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>contact@nutaniti.com                                   Phone No- 0285-XXX<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', '', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-02-17 07:39:50', '2019-02-17 07:39:50', '', 69, 'http://www.nutaniti.com/69-revision-v1/', 0, 'revision', '', 0),
(301, 1, '2019-02-17 07:46:36', '2019-02-17 07:46:36', '<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"large\",\"className\":\"contactus-blck\"} -->\n<p class=\"has-text-color has-large-font-size has-vivid-cyan-blue-color contactus-blck\"><strong>Get In Touch...</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Contact us on any questions or queries. We answer your Emails within one working day.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"contactus-blck\"} -->\n<div class=\"wp-block-columns has-2-columns contactus-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:shortcode -->\n[contact-form-7 id=\"68\" title=\"Contact form 1\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Location:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nutan Private ITI, Rozoda road, Chinawal, Tal-Raver, Dist-Jalgaon, Pin code- 425505</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\"><strong>Email &amp; Phone-</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>contact@nutaniti.com                                   Phone No- 0285-XXX<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '69-autosave-v1', '', '', '2019-02-17 07:46:36', '2019-02-17 07:46:36', '', 69, 'http://www.nutaniti.com/69-autosave-v1/', 0, 'revision', '', 0),
(306, 1, '2019-02-17 11:33:21', '2019-02-17 11:33:21', '<!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\"><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Land Area :  10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Workshops :  928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class Rooms :  91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Conference &amp; Drawing Hall :   125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Computer Lab :   30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Library :         30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns has-2-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute.     :</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>As per the DGET Norms.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vice Principals :&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Instructional Staff :    05<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class IV Staff :  03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-17 11:33:21', '2019-02-17 11:33:21', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(305, 1, '2019-02-17 11:31:05', '2019-02-17 11:31:05', '<!-- wp:paragraph -->\n<p><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Land Area :  10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Workshops :  928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class Rooms :  91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Conference &amp; Drawing Hall :   125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Computer Lab :   30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Library :         30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns has-2-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute.     :</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>As per the DGET Norms.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vice Principals :&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Instructional Staff :    05<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class IV Staff :  03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-17 11:31:05', '2019-02-17 11:31:05', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(307, 1, '2019-02-17 11:33:50', '2019-02-17 11:33:50', '<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"medium\"} -->\n<p style=\"text-align:center\" class=\"has-medium-font-size\"><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Land Area :  10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Workshops :  928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class Rooms :  91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Conference &amp; Drawing Hall :   125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Computer Lab :   30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Library :         30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns has-2-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute.     :</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>As per the DGET Norms.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vice Principals :&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Instructional Staff :    05<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class IV Staff :  03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-17 11:33:50', '2019-02-17 11:33:50', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(308, 1, '2019-02-17 11:34:45', '2019-02-17 11:34:45', '<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p style=\"text-align:center\" class=\"has-medium-font-size infra-blck\"><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Land Area :  10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Workshops :  928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class Rooms :  91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Conference &amp; Drawing Hall :   125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Computer Lab :   30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Library :         30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns has-2-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute.     :</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>As per the DGET Norms.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vice Principals :&nbsp; <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Instructional Staff :    05<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class IV Staff :  03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-17 11:34:45', '2019-02-17 11:34:45', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(312, 1, '2019-02-17 11:42:00', '2019-02-17 11:42:00', '<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p style=\"text-align:center\" class=\"has-medium-font-size infra-blck\"><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Land Area :&nbsp; 10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Workshops :&nbsp; 928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class Rooms :&nbsp; 91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Conference &amp; Drawing Hall :&nbsp;&nbsp; 125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Computer Lab :&nbsp;&nbsp; 30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Library :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute. : AS per the DGET Norms</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Instructional Staff :    0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class IV Staff :&nbsp; 03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-17 11:42:00', '2019-02-17 11:42:00', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(311, 1, '2019-02-17 11:40:52', '2019-02-17 11:40:52', '<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p style=\"text-align:center\" class=\"has-medium-font-size infra-blck\"><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Land Area :&nbsp; 10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Workshops :&nbsp; 928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class Rooms :&nbsp; 91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Conference &amp; Drawing Hall :&nbsp;&nbsp; 125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Computer Lab :&nbsp;&nbsp; 30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Library :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"infra-blck\"} -->\n<div class=\"wp-block-columns has-2-columns infra-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute.     :</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>As per the DGET Norms.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Instructional Staff :    0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class IV Staff :&nbsp; 03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-17 11:40:52', '2019-02-17 11:40:52', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(310, 1, '2019-02-17 11:39:40', '2019-02-17 11:39:40', '<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p style=\"text-align:center\" class=\"has-medium-font-size infra-blck\"><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Land Area :&nbsp; 10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Workshops :&nbsp; 928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class Rooms :&nbsp; 91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Conference &amp; Drawing Hall :&nbsp;&nbsp; 125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Computer Lab :&nbsp;&nbsp; 30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Library :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"className\":\"infra-blck\"} -->\n<div class=\"wp-block-columns has-2-columns infra-blck\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute.     :</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>As per the DGET Norms.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Instructional Staff :&nbsp;&nbsp;&nbsp; 05<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Class IV Staff :&nbsp; 03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-17 11:39:40', '2019-02-17 11:39:40', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(316, 1, '2019-02-17 11:51:23', '2019-02-17 11:51:23', '<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p style=\"text-align:center\" class=\"has-medium-font-size infra-blck\"><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Land Area :&nbsp; 10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Workshops :&nbsp; 928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class Rooms :&nbsp; 91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Conference &amp; Drawing Hall :&nbsp;&nbsp; 125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Computer Lab :&nbsp;&nbsp; 30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Library :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">All Machines &amp; Equipments for all existing trades in this institute. : AS per the DGET Norms</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Instructional Staff :&nbsp;&nbsp;&nbsp; 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class IV Staff :&nbsp; 03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-17 11:51:23', '2019-02-17 11:51:23', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(314, 1, '2019-02-17 11:49:08', '2019-02-17 11:49:08', '', 'Top view iti', '', 'inherit', 'open', 'closed', '', 'top-view-iti', '', '', '2019-02-17 11:49:08', '2019-02-17 11:49:08', '', 122, 'http://www.nutaniti.com/wp-content/uploads/2019/02/Top-view-iti.png', 0, 'attachment', 'image/png', 0),
(315, 1, '2019-02-17 11:49:13', '2019-02-17 11:49:13', '<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p style=\"text-align:center\" class=\"has-medium-font-size infra-blck\"><strong>Shikshan Prasarak Mandal</strong> completed the new building construction On Rozoda road. In this construction there are Workshops, Classroom, Drawinghall and Library which are useful for ITI.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Land &amp; Workpspace :</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Land Area :&nbsp; 10200 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Built up Area : 2050.96 sq.mm</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Admin. Bldgs : 216.00 sq.m.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Workshops :&nbsp; 928.00 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class Rooms :&nbsp; 91.5 sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Machinery &amp; Equipments  </strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Conference &amp; Drawing Hall :&nbsp;&nbsp; 125.10 sq.m.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Computer Lab :&nbsp;&nbsp; 30.55 sq.m. - 1 No</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Library :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30.5 sq.m. 1 No.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Play Ground : 5448.13sq.m</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>All Machines &amp; Equipments for all existing trades in this institute. : AS per the DGET Norms</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Human Resource</strong><strong> \n:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Head of Institute : 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Ad ministerial Staff :  02</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Instructional Staff :&nbsp;&nbsp;&nbsp; 0</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"infra-blck\"} -->\n<p class=\"infra-blck\">Class IV Staff :&nbsp; 03<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"infra-blck\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color infra-blck\"><strong>Others :</strong></p>\n<!-- /wp:paragraph -->', 'Infrastructure', '', 'inherit', 'closed', 'closed', '', '122-revision-v1', '', '', '2019-02-17 11:49:13', '2019-02-17 11:49:13', '', 122, 'http://www.nutaniti.com/122-revision-v1/', 0, 'revision', '', 0),
(325, 1, '2019-02-17 14:02:02', '2019-02-17 14:02:02', '<!-- wp:paragraph -->\n<p>Total Units 2</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Electrician', '', 'inherit', 'closed', 'closed', '', '92-revision-v1', '', '', '2019-02-17 14:02:02', '2019-02-17 14:02:02', '', 92, 'http://www.nutaniti.com/92-revision-v1/', 0, 'revision', '', 0),
(327, 1, '2019-02-17 14:04:07', '2019-02-17 14:04:07', '<!-- wp:paragraph -->\n<p>Total Units 2</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Electrician', '', 'inherit', 'closed', 'closed', '', '92-autosave-v1', '', '', '2019-02-17 14:04:07', '2019-02-17 14:04:07', '', 92, 'http://www.nutaniti.com/92-autosave-v1/', 0, 'revision', '', 0),
(328, 1, '2019-02-17 14:04:09', '2019-02-17 14:04:09', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Electrician:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Trades', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-17 14:04:09', '2019-02-17 14:04:09', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0),
(331, 1, '2019-02-17 14:05:30', '2019-02-17 14:05:30', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Electrician:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Fitter:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>Unit</td><td>Year</td><td>Seats Filled</td><td>Vacant Seats</td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Trades', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-17 14:05:30', '2019-02-17 14:05:30', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0),
(341, 1, '2019-02-17 14:07:47', '2019-02-17 14:07:47', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Electrician:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Fitter:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Trades:', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-17 14:07:47', '2019-02-17 14:07:47', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0),
(339, 1, '2019-02-17 14:07:16', '2019-02-17 14:07:16', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Electrician:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Fitter:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Trades', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-17 14:07:16', '2019-02-17 14:07:16', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `iti_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(347, 1, '2019-02-17 14:15:06', '2019-02-17 14:15:06', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Electrician:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Total Units :</strong></td><td>2                       </td></tr><tr><td><strong>Durations :</strong></td><td>2 Years</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Fitter:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Total Units :</strong></td><td>2                          </td></tr><tr><td><strong>Durations :</strong></td><td>2 Years</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Trades:', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-17 14:15:06', '2019-02-17 14:15:06', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0),
(346, 1, '2019-02-17 14:14:07', '2019-02-17 14:14:07', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Electrician:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Total Units :</strong></td><td>2                  </td></tr><tr><td><strong>Durations :</strong></td><td>2 Years</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Fitter:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td><strong>Total Units :</strong></td><td>2                  </td></tr><tr><td><strong>Durations :</strong></td><td>2 Years</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Trades:', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-17 14:14:07', '2019-02-17 14:14:07', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0),
(348, 1, '2019-02-17 14:15:18', '2019-02-17 14:15:18', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Electrician:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Total Units :</strong></td><td>2                       </td></tr><tr><td><strong>Durations :</strong></td><td>2 Years</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Fitter:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Total Units :</strong></td><td>2                          </td></tr><tr><td><strong>Durations :</strong></td><td>2 Years</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<table class=\"wp-block-table is-style-stripes\"><tbody><tr><td><strong>Unit</strong></td><td><strong>Year</strong></td><td><strong>Seats Filled</strong></td><td><strong>Vacant Seats</strong></td></tr><tr><td>Unit 1</td><td>2012</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2013</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2014</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2015</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2016</td><td>21</td><td>0</td></tr><tr><td>Unit 2</td><td>2017</td><td>21</td><td>0</td></tr><tr><td>Unit 1</td><td>2018</td><td>21</td><td>0</td></tr></tbody></table>\n<!-- /wp:table -->', 'Trades', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-02-17 14:15:18', '2019-02-17 14:15:18', '', 71, 'http://www.nutaniti.com/71-revision-v1/', 0, 'revision', '', 0),
(352, 1, '2019-02-20 14:44:25', '2019-02-20 14:44:25', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"huge\"} -->\n<p class=\"has-text-color has-huge-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>ITI qualified persons can set up their own garage, motor/generator/transformer winding shops or fabrication shops depending upon trade opted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"large\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-large-font-size has-luminous-vivid-orange-color\"><strong> Why Us....</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"columns\":3} -->\n<div class=\"wp-block-columns has-3-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our focus is to teach students on a\n practical basis and we thus, teach topics using fun and attractive \ntechniques via which information gets stored rapidly.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our experience and trained staff \nensures that you will have a wonderful and worthwhile experience and \nbecome extremely well-versed with all aspects of your chosen field.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">\n                        \n							\n                                \n                                \n                                    We\n treat our students as family and never stop at just teaching. We imbibe\n prevalent values about working as one unit that will help them in the \nfuture.<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-20 14:44:25', '2019-02-20 14:44:25', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(351, 1, '2019-02-20 14:40:45', '2019-02-20 14:40:45', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"huge\"} -->\n<p class=\"has-text-color has-huge-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>ITI qualified persons can set up their own garage, motor/generator/transformer winding shops or fabrication shops depending upon trade opted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"large\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-large-font-size has-luminous-vivid-orange-color\"><strong> Why Us....</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"columns\":3} -->\n<div class=\"wp-block-columns has-3-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Our focus is to teach students on a\n practical basis and we thus, teach topics using fun and attractive \ntechniques via which information gets stored rapidly.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Our experience and trained staff \nensures that you will have a wonderful and worthwhile experience and \nbecome extremely well-versed with all aspects of your chosen field.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>\n                        \n							\n                                \n                                \n                                    We\n treat our students as family and never stop at just teaching. We imbibe\n prevalent values about working as one unit that will help them in the \nfuture.<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-20 14:40:45', '2019-02-20 14:40:45', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(353, 1, '2019-02-20 14:45:25', '2019-02-20 14:45:25', '<!-- wp:paragraph {\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"huge\"} -->\n<p class=\"has-text-color has-huge-font-size has-luminous-vivid-orange-color\"><strong>Welcome</strong> <span class=\"has-very-dark-gray-color has-medium-font-size\"><strong>to Nutan Private ITI, Chinawal.</strong></span></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">    Industrial Training Institute  (ITI\'s) are training institute which provide training in technical field  in India. Normally a person who has passed 10 standard (SSLC) is  eligible for admission to ITI. The objective of opening of ITI is  provide technical manpower to industries. <br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nITI qualified persons can set up their own garage, \nmotor/generator/transformer winding shops or fabrication shops depending\n upon trade opted.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nIndustrial Training Institute (ITI\'s) are training institute which \nprovide training in technical field in India. Normally a person who has \npassed 10 standard (SSLC) is eligible for admission to ITI. The \nobjective of opening of ITI is provide technical manpower to industries.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nThese persons are trained in basic skills required to do jobs of say \noperator or a craftsman. The course in ITI is designed in way to impart \nbasic skill in the trade specified. Most of ITI\'s impart training in \ntechnical trades like electrician, fitter, plumber etc.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">\n\nPeople of engineering trade can go for higher studies like diploma in \nengineering. There are also specialized short term courses in Advanced \nTraining Institute (ATI) which enhances the skills of candidates.<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"customFontSize\":19} -->\n<p style=\"font-size:19px\">ITI qualified persons can set up their own garage, motor/generator/transformer winding shops or fabrication shops depending upon trade opted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"luminous-vivid-orange\",\"fontSize\":\"large\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-large-font-size has-luminous-vivid-orange-color\"><strong> Why Us....</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:columns {\"columns\":3} -->\n<div class=\"wp-block-columns has-3-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our focus is to teach students on a\n practical basis and we thus, teach topics using fun and attractive \ntechniques via which information gets stored rapidly.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Our experience and trained staff \nensures that you will have a wonderful and worthwhile experience and \nbecome extremely well-versed with all aspects of your chosen field.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">\n                        \n							\n                                \n                                \n                                    We\n treat our students as family and never stop at just teaching. We imbibe\n prevalent values about working as one unit that will help them in the \nfuture.<br></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:shortcode -->\n[gmap-embed id=\"98\"]\n<!-- /wp:shortcode -->', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-02-20 14:45:25', '2019-02-20 14:45:25', '', 2, 'http://www.nutaniti.com/2-revision-v1/', 0, 'revision', '', 0),
(354, 1, '2019-02-20 14:57:26', '2019-02-20 14:57:26', '<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Admission Process', '', 'inherit', 'closed', 'closed', '', '213-autosave-v1', '', '', '2019-02-20 14:57:26', '2019-02-20 14:57:26', '', 213, 'http://www.nutaniti.com/213-autosave-v1/', 0, 'revision', '', 0),
(373, 1, '2020-05-21 08:24:11', '2020-05-21 08:24:11', '{\"id\":\"373\",\"field_id\":4,\"fields\":{\"1\":{\"id\":\"1\",\"type\":\"text\",\"label\":\"First Name\",\"description\":\"\",\"required\":\"1\",\"size\":\"medium\",\"placeholder\":\"\",\"limit_count\":\"1\",\"limit_mode\":\"characters\",\"default_value\":\"\",\"css\":\"\",\"input_mask\":\"\"},\"2\":{\"id\":\"2\",\"type\":\"text\",\"label\":\"Middle Name\",\"description\":\"\",\"size\":\"medium\",\"placeholder\":\"\",\"limit_count\":\"1\",\"limit_mode\":\"characters\",\"default_value\":\"\",\"css\":\"\",\"input_mask\":\"\"},\"3\":{\"id\":\"3\",\"type\":\"text\",\"label\":\"Last Name\",\"description\":\"\",\"required\":\"1\",\"size\":\"medium\",\"placeholder\":\"\",\"limit_count\":\"1\",\"limit_mode\":\"characters\",\"default_value\":\"\",\"css\":\"\",\"input_mask\":\"\"}},\"settings\":{\"form_title\":\"Admission Form\",\"form_desc\":\"\",\"form_class\":\"\",\"submit_text\":\"Submit\",\"submit_text_processing\":\"Sending...\",\"submit_class\":\"\",\"honeypot\":\"1\",\"notification_enable\":\"1\",\"notifications\":{\"1\":{\"email\":\"{admin_email}\",\"subject\":\"New Admission Form Entry\",\"sender_name\":\"Nutan ITI\",\"sender_address\":\"{admin_email}\",\"replyto\":\"\",\"message\":\"{all_fields}\"}},\"confirmations\":{\"1\":{\"type\":\"message\",\"message\":\"<p>Thanks for contacting us! We will be in touch with you shortly.<\\/p>\",\"message_scroll\":\"1\",\"page\":\"102\",\"redirect\":\"\"}}},\"meta\":{\"template\":\"blank\"}}', 'Admission Form', '', 'publish', 'closed', 'closed', '', 'admission-form', '', '', '2020-05-21 08:27:48', '2020-05-21 08:27:48', '', 0, 'https://www.nutaniti.com/?post_type=wpforms&#038;p=373', 0, 'wpforms', '', 0),
(374, 1, '2020-05-21 08:29:35', '2020-05-21 08:29:35', '<!-- wp:paragraph {\"align\":\"center\",\"customTextColor\":\"#ffffff\",\"customBackgroundColor\":\"#79b530\",\"fontSize\":\"medium\",\"className\":\"admission-frm-header\"} -->\n<p style=\"background-color:#79b530;color:#ffffff;text-align:center\" class=\"has-text-color has-background has-medium-font-size admission-frm-header\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":438,\"className\":\"iti-admission-banner\"} -->\n<figure class=\"wp-block-image iti-admission-banner\"><img src=\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06-e1590071360187-1024x378.jpg\" alt=\"\" class=\"wp-image-438\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'publish', 'closed', 'closed', '', 'admission-form', '', '', '2020-05-21 14:30:28', '2020-05-21 14:30:28', '', 0, 'https://www.nutaniti.com/?page_id=374', 0, 'page', '', 0),
(375, 1, '2020-05-21 08:29:25', '2020-05-21 08:29:25', '<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[wpforms id=\"373\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 08:29:25', '2020-05-21 08:29:25', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(376, 1, '2020-05-21 08:41:16', '2020-05-21 08:41:16', '<div class=\"admission-frm\">\r\n<table >\r\n	<tr>\r\n		<th> <label> Student Full Name* </label> </th>\r\n		<td>[text* FullName placeholder \"विद्यार्थ्याचे संपुर्ण नाव\" ] </td>\r\n	</tr>\r\n	<tr>\r\n		<th><label> Phone Number </label></th>\r\n		<td>[tel PhoneNumber placeholder \"विद्यार्थ्याचा मोबाईल नंबर\"] </td>\r\n	</tr>\r\n	<tr>\r\n		<th> <label> Parent\'s Name  </label></th>\r\n		<td>[text ParentName placeholder \"पालकाचे पूर्ण नाव\"] </td>\r\n	</tr>\r\n	<tr>\r\n		<th><label> Parent\'s Phone Number </label></th>\r\n		<td>[tel ParentPhoneNumber placeholder \"पालकांचा मोबाईल नंबर\"] </td>\r\n	</tr>\r\n	<tr>\r\n		<th><label> Select Trade</label></th>\r\n		<td>[select Trade \"Fitter\" \"Electrician\"]</td>\r\n	</tr>\r\n	<tr>\r\n		<th><label>Birth date(as per leaving)</label></th>\r\n		<td>[date BirthDate]</td>\r\n	</tr>\r\n	<tr>\r\n		<th><label>AdharCard Number</th>\r\n		<td>[tel AdharCard ] </td>\r\n	</tr>\r\n	<tr>\r\n		<th><label> Education </label></th>\r\n		<td>[select Education \"10th\" \"12th\" \"Other\"]</td>     \r\n	</tr>\r\n	<tr>\r\n		<th><label> Caste </label></th>\r\n		<td>[select Caste \"OPEN\" \"OBC\" \"SC\" \"ST\" \"NT\" \"SBC\" \"OTHER\"]</td>\r\n	</tr>\r\n	<tr>\r\n		<th><label> Permanent Address </label></th>\r\n		<td>[textarea Address placeholder \"कायमचा पत्ता\"] </td>\r\n	</tr>\r\n	<tr>\r\n		<th><label> Photo </label></th>\r\n		<td>[file StudentPhoto limit:2000000 filetypes:png|jpg|jpeg]</td>\r\n	</tr>\r\n	<tr>\r\n		<th><label> Signature </label></th>\r\n		<td>[file PassportPhoto limit:2000000 filetypes:png|jpg|jpeg]</td>\r\n	</tr>\r\n</table>\r\n<div class=\"admission-submit\">\r\n	[submit \"Submit\"]\r\n</div>\r\n</div>\n1\nNutan ITI \"[your-subject]\"\nNutan ITI <wordpress@nutaniti.com>\nrahulbhangale26@gmail.com\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n[UserPhoto]\r\n-- \r\nThis e-mail was sent from a contact form on Nutan ITI (https://www.nutaniti.com)\nReply-To: [your-email]\n\n\n\n\nNutan ITI \"[your-subject]\"\nNutan ITI <wordpress@nutaniti.com>\n[your-email]\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on Nutan ITI (https://www.nutaniti.com)\nReply-To: rahulbhangale26@gmail.com\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nYour entered code is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.', 'Admission Form', '', 'publish', 'closed', 'closed', '', 'admission-form', '', '', '2020-05-22 10:52:16', '2020-05-22 10:52:16', '', 0, 'https://www.nutaniti.com/?post_type=wpcf7_contact_form&#038;p=376', 0, 'wpcf7_contact_form', '', 0),
(377, 1, '2020-05-21 08:41:55', '2020-05-21 08:41:55', '<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 08:41:55', '2020-05-21 08:41:55', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(379, 1, '2020-05-21 08:57:19', '2020-05-21 08:57:19', '<!-- wp:shortcode -->\n[vx-entries form-id=\"cf_376\" start=\"0\" limit=\"300\" per-page=\"30\" cols=\"8\" sortable=\"true\" pager=\"true\" export=1]\n<!-- /wp:shortcode -->', 'Application List', '', 'publish', 'closed', 'closed', '123456', 'application-list', '', '', '2020-05-22 11:16:33', '2020-05-22 11:16:33', '', 0, 'https://www.nutaniti.com/?page_id=379', 0, 'page', '', 0),
(380, 1, '2020-05-21 08:57:19', '2020-05-21 08:57:19', '<!-- wp:shortcode -->\n[vx-entries form-id=\"cf_376\" start=\"0\" limit=\"300\" per-page=\"30\" cols=\"6\" sortable=\"true\" pager=\"true\"]\n<!-- /wp:shortcode -->', 'Application List', '', 'inherit', 'closed', 'closed', '', '379-revision-v1', '', '', '2020-05-21 08:57:19', '2020-05-21 08:57:19', '', 379, 'https://www.nutaniti.com/379-revision-v1/', 0, 'revision', '', 0),
(381, 1, '2020-05-21 08:58:21', '2020-05-21 08:58:21', '<!-- wp:shortcode -->\n[vx-entries form-id=\"cf_376\" start=\"0\" limit=\"300\" per-page=\"30\" cols=\"6\" sortable=\"true\" pager=\"true\" export=1]\n<!-- /wp:shortcode -->', 'Application List', '', 'inherit', 'closed', 'closed', '', '379-revision-v1', '', '', '2020-05-21 08:58:21', '2020-05-21 08:58:21', '', 379, 'https://www.nutaniti.com/379-revision-v1/', 0, 'revision', '', 0),
(455, 1, '2020-05-22 11:16:32', '2020-05-22 11:16:32', '<!-- wp:shortcode -->\n[vx-entries form-id=\"cf_376\" start=\"0\" limit=\"300\" per-page=\"30\" cols=\"8\" sortable=\"true\" pager=\"true\" export=1]\n<!-- /wp:shortcode -->', 'Application List', '', 'inherit', 'closed', 'closed', '', '379-revision-v1', '', '', '2020-05-22 11:16:32', '2020-05-22 11:16:32', '', 379, 'https://www.nutaniti.com/379-revision-v1/', 0, 'revision', '', 0),
(384, 1, '2020-05-21 12:15:04', '2020-05-21 12:15:04', '.admission-frm td, .admission-frm th {\n    border: none;\n}\n.admission-frm table {\n    border: none;\n}\n\n.admission-frm input {\n    height: 30px;\n}\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    height: 30px;\n    padding: 5px !important;\n    margin-bottom: 20px;\n}\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    padding-bottom: 28px;\n    margin: 0 auto;\n}', 'wen-business', '', 'publish', 'closed', 'closed', '', 'wen-business', '', '', '2020-05-21 13:12:10', '2020-05-21 13:12:10', '', 0, 'https://www.nutaniti.com/wen-business/', 0, 'custom_css', '', 0),
(385, 1, '2020-05-21 12:15:04', '2020-05-21 12:15:04', '.admission-frm td, .admission-frm th {\n    border: none;\n}\n.admission-frm table {\n    border: none;\n}\n\n.admission-frm input {\n    height: 30px;\n}', 'wen-business', '', 'inherit', 'closed', 'closed', '', '384-revision-v1', '', '', '2020-05-21 12:15:04', '2020-05-21 12:15:04', '', 384, 'https://www.nutaniti.com/384-revision-v1/', 0, 'revision', '', 0),
(387, 1, '2020-05-21 12:18:17', '2020-05-21 12:18:17', '.admission-frm td, .admission-frm th {\n    border: none;\n}\n.admission-frm table {\n    border: none;\n}\n\n.admission-frm input {\n    height: 30px;\n}\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    height: 30px;\n    padding-bottom: 0px;\n    margin-bottom: 20px;\n}', 'wen-business', '', 'inherit', 'closed', 'closed', '', '384-revision-v1', '', '', '2020-05-21 12:18:17', '2020-05-21 12:18:17', '', 384, 'https://www.nutaniti.com/384-revision-v1/', 0, 'revision', '', 0),
(389, 1, '2020-05-21 12:23:13', '2020-05-21 12:23:13', '.admission-frm td, .admission-frm th {\n    border: none;\n}\n.admission-frm table {\n    border: none;\n}\n\n.admission-frm input {\n    height: 30px;\n}\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    height: 30px;\n    padding-bottom: 0px;\n    margin-bottom: 20px;\n}\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    padding-bottom: 28px;\n    margin: 0 auto;\n}', 'wen-business', '', 'inherit', 'closed', 'closed', '', '384-revision-v1', '', '', '2020-05-21 12:23:13', '2020-05-21 12:23:13', '', 384, 'https://www.nutaniti.com/384-revision-v1/', 0, 'revision', '', 0),
(392, 1, '2020-05-21 12:42:42', '2020-05-21 12:42:42', '<!-- wp:paragraph -->\n<p>राज्य सरकार व केंद्र सरकार(डी.जी.ई.टी.)मान्यता असलेल्या नूतन आई.टी.आई. चिनावाल याठिकाणी सन २०२० ते २०२१ या नवीन वर्षाकरिता फिटर व इलेक्ट्रिशियन या ट्रेडला प्रवेश घेण्यासाठी नाव नोंदणी सुरु आहे.तरी प्रवेश घेऊ इच्छित असणाऱ्या विद्यार्थ्यांनी खालील फॉर्म भरून सबमिट करावा. <br>*अधिक माहितीसाठी संपर्क*<br>श्री.वीरेंद्रकुमार केशव भंगाळे-प्राचार्य मो.नं.9527959608<br>श्री.राहूल रवींद्र महाजन-प्रवेश समन्वयक मो.नं.8928547720<br>श्री.वैभव वसंत महाजन-लिपिक मो.नं.9096886967</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Institution Address: - Nutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 12:42:42', '2020-05-21 12:42:42', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(397, 1, '2020-05-21 12:49:17', '2020-05-21 12:49:17', '<!-- wp:paragraph -->\n<p>State Government and Central Government (DGET) approved organisation Nutan ITI Chinawal has started admission process for the Fitter and Electrician trade for year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p><br>*अधिक माहितीसाठी संपर्क*<br>श्री.वीरेंद्रकुमार केशव भंगाळे-प्राचार्य मो.नं.9527959608<br>श्री.राहूल रवींद्र महाजन-प्रवेश समन्वयक मो.नं.8928547720<br>श्री.वैभव वसंत महाजन-लिपिक मो.नं.9096886967</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Institution Address: - Nutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 12:49:17', '2020-05-21 12:49:17', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(396, 1, '2020-05-21 12:48:57', '2020-05-21 12:48:57', '<!-- wp:preformatted -->\n<pre class=\"wp-block-preformatted\">State Government and Central Government (DGET) approved organisation Nutan ITI Chinawal has started admission process for the Fitter and Electrician trade for year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</pre>\n<!-- /wp:preformatted -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p><br>*अधिक माहितीसाठी संपर्क*<br>श्री.वीरेंद्रकुमार केशव भंगाळे-प्राचार्य मो.नं.9527959608<br>श्री.राहूल रवींद्र महाजन-प्रवेश समन्वयक मो.नं.8928547720<br>श्री.वैभव वसंत महाजन-लिपिक मो.नं.9096886967</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Institution Address: - Nutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 12:48:57', '2020-05-21 12:48:57', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(394, 1, '2020-05-21 12:47:53', '2020-05-21 12:47:53', '<!-- wp:preformatted -->\n<pre class=\"wp-block-preformatted\">State Government and Central Government (DGET) approved organisation Nutan ITI Chinawal has started admission process for the Fitter and Electrician trade for year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</pre>\n<!-- /wp:preformatted -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>*अधिक माहितीसाठी संपर्क*<br>श्री.वीरेंद्रकुमार केशव भंगाळे-प्राचार्य मो.नं.9527959608<br>श्री.राहूल रवींद्र महाजन-प्रवेश समन्वयक मो.नं.8928547720<br>श्री.वैभव वसंत महाजन-लिपिक मो.नं.9096886967</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Institution Address: - Nutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 12:47:53', '2020-05-21 12:47:53', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(391, 1, '2020-05-21 12:42:23', '2020-05-21 12:42:23', '<!-- wp:paragraph -->\n<p> राज्य सरकार व केंद्र सरकार(डी.जी.ई.टी.)मान्यता असलेल्या नूतन आई.टी.आई. चिनावाल याठिकाणी सन २०२० ते २०२१ या नवीन वर्षाकरिता फिटर व इलेक्ट्रिशियन या ट्रेडला प्रवेश घेण्यासाठी नाव नोंदणी सुरु आहे.तरी प्रवेश घेऊ इच्छित असणाऱ्या विद्यार्थ्यांनी खालील फॉर्म भरून सबमिट करावा. <br>*अधिक माहितीसाठी संपर्क*<br>श्री.वीरेंद्रकुमार केशव भंगाळे-प्राचार्य मो.नं.9527959608<br>श्री.राहूल रवींद्र महाजन-प्रवेश समन्वयक मो.नं.9881166289 <br>श्री.वैभव वसंत महाजन-लिपिक मो.नं.9096886967</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Institution Address: - Nutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 12:42:23', '2020-05-21 12:42:23', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(398, 1, '2020-05-21 12:50:05', '2020-05-21 12:50:05', '<!-- wp:paragraph {\"textColor\":\"vivid-green-cyan\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-green-cyan-color\"><strong>State Government and Central Government (DGET) approved organisation Nutan ITI Chinawal has started admission process for the Fitter and Electrician trade for year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p><br>*अधिक माहितीसाठी संपर्क*<br>श्री.वीरेंद्रकुमार केशव भंगाळे-प्राचार्य मो.नं.9527959608<br>श्री.राहूल रवींद्र महाजन-प्रवेश समन्वयक मो.नं.8928547720<br>श्री.वैभव वसंत महाजन-लिपिक मो.नं.9096886967</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Institution Address: - Nutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 12:50:05', '2020-05-21 12:50:05', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(399, 1, '2020-05-21 12:50:09', '2020-05-21 12:50:09', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>State Government and Central Government (DGET) approved organisation Nutan ITI Chinawal has started admission process for the Fitter and Electrician trade for year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p><br>*अधिक माहितीसाठी संपर्क*<br>श्री.वीरेंद्रकुमार केशव भंगाळे-प्राचार्य मो.नं.9527959608<br>श्री.राहूल रवींद्र महाजन-प्रवेश समन्वयक मो.नं.8928547720<br>श्री.वैभव वसंत महाजन-लिपिक मो.नं.9096886967</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Institution Address: - Nutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 12:50:09', '2020-05-21 12:50:09', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(413, 1, '2020-05-21 13:31:05', '2020-05-21 13:31:05', '<!-- wp:shortcode -->\n[vx-entries form-id=\"cf_376\" start=\"0\" limit=\"300\" per-page=\"30\" cols=\"10\" sortable=\"true\" pager=\"true\" export=1]\n<!-- /wp:shortcode -->', 'Application List', '', 'inherit', 'closed', 'closed', '', '379-revision-v1', '', '', '2020-05-21 13:31:05', '2020-05-21 13:31:05', '', 379, 'https://www.nutaniti.com/379-revision-v1/', 0, 'revision', '', 0),
(414, 1, '2020-05-21 13:31:49', '2020-05-21 13:31:49', '<!-- wp:shortcode -->\n[vx-entries form-id=\"cf_376\" start=\"0\" limit=\"300\" per-page=\"30\" cols=\"13\" sortable=\"true\" pager=\"true\" export=1]\n<!-- /wp:shortcode -->', 'Application List', '', 'inherit', 'closed', 'closed', '', '379-revision-v1', '', '', '2020-05-21 13:31:49', '2020-05-21 13:31:49', '', 379, 'https://www.nutaniti.com/379-revision-v1/', 0, 'revision', '', 0),
(403, 1, '2020-05-21 13:12:10', '2020-05-21 13:12:10', '.admission-frm td, .admission-frm th {\n    border: none;\n}\n.admission-frm table {\n    border: none;\n}\n\n.admission-frm input {\n    height: 30px;\n}\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    height: 30px;\n    padding: 5px !important;\n    margin-bottom: 20px;\n}\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    padding-bottom: 28px;\n    margin: 0 auto;\n}', 'wen-business', '', 'inherit', 'closed', 'closed', '', '384-revision-v1', '', '', '2020-05-21 13:12:10', '2020-05-21 13:12:10', '', 384, 'https://www.nutaniti.com/384-revision-v1/', 0, 'revision', '', 0),
(401, 1, '2020-05-21 12:56:16', '2020-05-21 12:56:16', '<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 12:56:16', '2020-05-21 12:56:16', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(436, 1, '2020-05-21 14:10:12', '2020-05-21 14:10:12', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-21 14:10:12', '2020-05-21 14:10:12', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(475, 1, '2020-06-15 16:06:22', '2020-06-15 16:06:22', '[wppb-edit-profile]', 'Edit Profile', '', 'publish', 'closed', 'closed', '', 'edit-profile', '', '', '2020-06-15 16:06:22', '2020-06-15 16:06:22', '', 0, 'https://www.nutaniti.com/edit-profile/', 0, 'page', '', 0),
(476, 1, '2020-06-15 16:06:22', '2020-06-15 16:06:22', '[wppb-login redirect_url=\"https://www.nutaniti.com/wp-admin/admin.php?page=sch-dashboard\"]', 'Log In', '', 'publish', 'closed', 'closed', '', 'log-in', '', '', '2020-06-19 18:51:26', '2020-06-19 18:51:26', '', 0, 'https://www.nutaniti.com/log-in/', 0, 'page', '', 0),
(424, 1, '2020-05-21 13:47:47', '2020-05-21 13:47:47', '<!-- wp:image {\"id\":425,\"align\":\"center\"} -->\n<div class=\"wp-block-image\"><figure class=\"aligncenter\"><img src=\"https://www.nutaniti.com/wp-content/uploads/2020/05/e95b0f91-746b-48a1-9ce1-21082fd090f1.jpg\" alt=\"\" class=\"wp-image-425\"/></figure></div>\n<!-- /wp:image -->', 'Stay Healthy', '', 'publish', 'closed', 'closed', '', 'stay-healthy', '', '', '2020-05-21 13:55:40', '2020-05-21 13:55:40', '', 0, 'https://www.nutaniti.com/?page_id=424', 0, 'page', '', 0),
(425, 1, '2020-05-21 13:47:35', '2020-05-21 13:47:35', '', 'e95b0f91-746b-48a1-9ce1-21082fd090f1', '', 'inherit', 'open', 'closed', '', 'e95b0f91-746b-48a1-9ce1-21082fd090f1', '', '', '2020-05-21 13:47:35', '2020-05-21 13:47:35', '', 424, 'https://www.nutaniti.com/wp-content/uploads/2020/05/e95b0f91-746b-48a1-9ce1-21082fd090f1.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `iti_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(430, 1, '2020-05-21 13:55:39', '2020-05-21 13:55:39', '<!-- wp:image {\"id\":425,\"align\":\"center\"} -->\n<div class=\"wp-block-image\"><figure class=\"aligncenter\"><img src=\"https://www.nutaniti.com/wp-content/uploads/2020/05/e95b0f91-746b-48a1-9ce1-21082fd090f1.jpg\" alt=\"\" class=\"wp-image-425\"/></figure></div>\n<!-- /wp:image -->', 'Stay Healthy', '', 'inherit', 'closed', 'closed', '', '424-revision-v1', '', '', '2020-05-21 13:55:39', '2020-05-21 13:55:39', '', 424, 'https://www.nutaniti.com/424-revision-v1/', 0, 'revision', '', 0),
(426, 1, '2020-05-21 13:47:47', '2020-05-21 13:47:47', '<!-- wp:cover {\"url\":\"https://www.nutaniti.com/wp-content/uploads/2020/05/e95b0f91-746b-48a1-9ce1-21082fd090f1.jpg\",\"align\":\"center\",\"id\":425} -->\n<div class=\"wp-block-cover has-background-dim aligncenter\" style=\"background-image:url(https://www.nutaniti.com/wp-content/uploads/2020/05/e95b0f91-746b-48a1-9ce1-21082fd090f1.jpg)\"></div>\n<!-- /wp:cover -->', 'Stay Healthy', '', 'inherit', 'closed', 'closed', '', '424-revision-v1', '', '', '2020-05-21 13:47:47', '2020-05-21 13:47:47', '', 424, 'https://www.nutaniti.com/424-revision-v1/', 0, 'revision', '', 0),
(432, 1, '2020-05-21 14:05:37', '2020-05-21 14:05:37', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    padding: 34px;\n}\n.iti-admission-banner{\n	    margin-top: -29px;\n}\n.vx_entries_table .tablesorter-headerRow{\n	background-color: #eeeeee;\n}\n.vx_entries_table  tfoot tr{\n	background-color: #eeeeee;	\n}\n\n.vx_entries_table th {\n	padding: 0 30px;\n}\n.vx_entries_table td {\n	text-align: center;\n	padding: 5px;\n	border-bottom: solid thin #ccc;\n}\n.page-id-379 .container {\n	width: 1500px;\n}', 'school-zone', '', 'publish', 'closed', 'closed', '', 'school-zone', '', '', '2020-05-26 10:38:20', '2020-05-26 10:38:20', '', 0, 'https://www.nutaniti.com/school-zone/', 0, 'custom_css', '', 0),
(433, 1, '2020-05-21 14:05:37', '2020-05-21 14:05:37', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-21 14:05:37', '2020-05-21 14:05:37', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(434, 1, '2020-05-21 14:06:15', '2020-05-21 14:06:15', '<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:06:15', '2020-05-21 14:06:15', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(440, 1, '2020-05-21 14:17:38', '2020-05-21 14:17:38', '<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cover {\"url\":\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg\",\"align\":\"center\",\"id\":438,\"dimRatio\":0} -->\n<div class=\"wp-block-cover aligncenter\" style=\"background-image:url(https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg)\"></div>\n<!-- /wp:cover -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:17:38', '2020-05-21 14:17:38', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(438, 1, '2020-05-21 14:16:14', '2020-05-21 14:16:14', '', 'ITI-Chinawal-06', '', 'inherit', 'open', 'closed', '', 'iti-chinawal-06', '', '', '2020-05-21 14:29:37', '2020-05-21 14:29:37', '', 374, 'https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg', 0, 'attachment', 'image/jpeg', 0),
(439, 1, '2020-05-21 14:16:30', '2020-05-21 14:16:30', '<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cover {\"url\":\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg\",\"align\":\"center\",\"id\":438} -->\n<div class=\"wp-block-cover has-background-dim aligncenter\" style=\"background-image:url(https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg)\"></div>\n<!-- /wp:cover -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:16:30', '2020-05-21 14:16:30', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(442, 1, '2020-05-21 14:21:49', '2020-05-21 14:21:49', '<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"admision-frm-header\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color admision-frm-header\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cover {\"url\":\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg\",\"align\":\"center\",\"id\":438,\"dimRatio\":0} -->\n<div class=\"wp-block-cover aligncenter\" style=\"background-image:url(https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg)\"></div>\n<!-- /wp:cover -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:21:49', '2020-05-21 14:21:49', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(449, 1, '2020-05-21 14:25:24', '2020-05-21 14:25:24', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    padding: 34px;\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-21 14:25:24', '2020-05-21 14:25:24', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(444, 1, '2020-05-21 14:22:27', '2020-05-21 14:22:27', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    text-align: center;\n    background-color: #79B530;\n    color: #FFF;\n    padding: 34px;\n    width: 600px;\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-21 14:22:27', '2020-05-21 14:22:27', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(445, 1, '2020-05-21 14:23:09', '2020-05-21 14:23:09', '<!-- wp:paragraph {\"align\":\"center\",\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\",\"className\":\"admission-frm-header\"} -->\n<p style=\"text-align:center\" class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color admission-frm-header\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cover {\"url\":\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg\",\"align\":\"center\",\"id\":438,\"dimRatio\":0} -->\n<div class=\"wp-block-cover aligncenter\" style=\"background-image:url(https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg)\"></div>\n<!-- /wp:cover -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:23:09', '2020-05-21 14:23:09', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(446, 1, '2020-05-21 14:23:51', '2020-05-21 14:23:51', '<!-- wp:paragraph {\"align\":\"center\",\"customTextColor\":\"#ffffff\",\"fontSize\":\"medium\",\"className\":\"admission-frm-header\"} -->\n<p style=\"color:#ffffff;text-align:center\" class=\"has-text-color has-medium-font-size admission-frm-header\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cover {\"url\":\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg\",\"align\":\"center\",\"id\":438,\"dimRatio\":0} -->\n<div class=\"wp-block-cover aligncenter\" style=\"background-image:url(https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg)\"></div>\n<!-- /wp:cover -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:23:51', '2020-05-21 14:23:51', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(447, 1, '2020-05-21 14:24:18', '2020-05-21 14:24:18', '<!-- wp:paragraph {\"align\":\"center\",\"customTextColor\":\"#ffffff\",\"customBackgroundColor\":\"#79b530\",\"fontSize\":\"medium\",\"className\":\"admission-frm-header\"} -->\n<p style=\"background-color:#79b530;color:#ffffff;text-align:center\" class=\"has-text-color has-background has-medium-font-size admission-frm-header\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cover {\"url\":\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg\",\"align\":\"center\",\"id\":438,\"dimRatio\":0} -->\n<div class=\"wp-block-cover aligncenter\" style=\"background-image:url(https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg)\"></div>\n<!-- /wp:cover -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:24:18', '2020-05-21 14:24:18', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(451, 1, '2020-05-21 14:26:59', '2020-05-21 14:26:59', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    padding: 34px;\n}\n.iti-admission-banner{\n	    margin-top: -29px;\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-21 14:26:59', '2020-05-21 14:26:59', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(453, 1, '2020-05-21 14:30:07', '2020-05-21 14:30:07', '<!-- wp:paragraph {\"align\":\"center\",\"customTextColor\":\"#ffffff\",\"customBackgroundColor\":\"#79b530\",\"fontSize\":\"medium\",\"className\":\"admission-frm-header\"} -->\n<p style=\"background-color:#79b530;color:#ffffff;text-align:center\" class=\"has-text-color has-background has-medium-font-size admission-frm-header\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":438} -->\n<figure class=\"wp-block-image\"><img src=\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06-e1590071360187-1024x378.jpg\" alt=\"\" class=\"wp-image-438\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:30:07', '2020-05-21 14:30:07', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(452, 1, '2020-05-21 14:27:10', '2020-05-21 14:27:10', '<!-- wp:paragraph {\"align\":\"center\",\"customTextColor\":\"#ffffff\",\"customBackgroundColor\":\"#79b530\",\"fontSize\":\"medium\",\"className\":\"admission-frm-header\"} -->\n<p style=\"background-color:#79b530;color:#ffffff;text-align:center\" class=\"has-text-color has-background has-medium-font-size admission-frm-header\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cover {\"url\":\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg\",\"align\":\"center\",\"id\":438,\"dimRatio\":0,\"className\":\"iti-admission-banner\"} -->\n<div class=\"wp-block-cover aligncenter iti-admission-banner\" style=\"background-image:url(https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06.jpg)\"></div>\n<!-- /wp:cover -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:27:10', '2020-05-21 14:27:10', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(454, 1, '2020-05-21 14:30:27', '2020-05-21 14:30:27', '<!-- wp:paragraph {\"align\":\"center\",\"customTextColor\":\"#ffffff\",\"customBackgroundColor\":\"#79b530\",\"fontSize\":\"medium\",\"className\":\"admission-frm-header\"} -->\n<p style=\"background-color:#79b530;color:#ffffff;text-align:center\" class=\"has-text-color has-background has-medium-font-size admission-frm-header\"><strong>State Government and Central Government (DGET) approved organization Nutan ITI Chinawal has started the admission process for the Fitter and Electrician trade for the year 2020 - 2021. Interested candidates are requested to fill and submit the following form.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":438,\"className\":\"iti-admission-banner\"} -->\n<figure class=\"wp-block-image iti-admission-banner\"><img src=\"https://www.nutaniti.com/wp-content/uploads/2020/05/ITI-Chinawal-06-e1590071360187-1024x378.jpg\" alt=\"\" class=\"wp-image-438\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:table -->\n<table class=\"wp-block-table\"><tbody><tr><td>[contact-form-7 id=\"376\" title=\"Admission Form\"]</td></tr></tbody></table>\n<!-- /wp:table -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>For More Details Contact</strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mr. Virendrakumar Keshav Bhangale,  Principal, Mob No: 9527959608<br>Mr. Rahul Ravindra Mahajan, Admission Coordinator, Mob. No: 8928547720<br>Mr. Vaibhav Vasant Mahajan, Clerk Mob, No: 9096886967 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"vivid-cyan-blue\",\"fontSize\":\"medium\"} -->\n<p class=\"has-text-color has-medium-font-size has-vivid-cyan-blue-color\"><strong>Institution Address: </strong><br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\nNutan ITI, Rozoda Road, Chinawal, Raver, Jalgaon, Pin Code- 425505.\n\n</p>\n<!-- /wp:paragraph -->', 'Admission Form', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2020-05-21 14:30:27', '2020-05-21 14:30:27', '', 374, 'https://www.nutaniti.com/374-revision-v1/', 0, 'revision', '', 0),
(457, 1, '2020-05-26 10:29:47', '2020-05-26 10:29:47', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    padding: 34px;\n}\n.iti-admission-banner{\n	    margin-top: -29px;\n}\n.tablesorter-headerRow{\n	background-color: #eeeeee;\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-26 10:29:47', '2020-05-26 10:29:47', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(459, 1, '2020-05-26 10:31:34', '2020-05-26 10:31:34', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    padding: 34px;\n}\n.iti-admission-banner{\n	    margin-top: -29px;\n}\n.tablesorter-headerRow{\n	background-color: #eeeeee;\n}\ntfoot tr{\n	background-color: #eeeeee;	\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-26 10:31:34', '2020-05-26 10:31:34', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(461, 1, '2020-05-26 10:34:29', '2020-05-26 10:34:29', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    padding: 34px;\n}\n.iti-admission-banner{\n	    margin-top: -29px;\n}\n.vx_entries_table .tablesorter-headerRow{\n	background-color: #eeeeee;\n}\n.vx_entries_table  tfoot tr{\n	background-color: #eeeeee;	\n}\n\n.vx_entries_table th {\n	padding: 0 30px;\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-26 10:34:29', '2020-05-26 10:34:29', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(463, 1, '2020-05-26 10:36:42', '2020-05-26 10:36:42', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    padding: 34px;\n}\n.iti-admission-banner{\n	    margin-top: -29px;\n}\n.vx_entries_table .tablesorter-headerRow{\n	background-color: #eeeeee;\n}\n.vx_entries_table  tfoot tr{\n	background-color: #eeeeee;	\n}\n\n.vx_entries_table th {\n	padding: 0 30px;\n}\n\n.page-id-379 .container {\n	width: 1500px;\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-26 10:36:42', '2020-05-26 10:36:42', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(465, 1, '2020-05-26 10:37:31', '2020-05-26 10:37:31', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    padding: 34px;\n}\n.iti-admission-banner{\n	    margin-top: -29px;\n}\n.vx_entries_table .tablesorter-headerRow{\n	background-color: #eeeeee;\n}\n.vx_entries_table  tfoot tr{\n	background-color: #eeeeee;	\n}\n\n.vx_entries_table th {\n	padding: 0 30px;\n}\n.vx_entries_table td {\n	text-align: center;\n	border-bottom: solid thin #ccc;\n}\n.page-id-379 .container {\n	width: 1500px;\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-26 10:37:31', '2020-05-26 10:37:31', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(484, 82, '2020-07-02 03:08:17', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-07-02 03:08:17', '0000-00-00 00:00:00', '', 0, 'https://www.nutaniti.com/?p=484', 0, 'post', '', 0),
(485, 82, '2020-07-02 03:10:50', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-07-02 03:10:50', '0000-00-00 00:00:00', '', 0, 'https://www.nutaniti.com/?p=485', 0, 'post', '', 0),
(486, 81, '2020-07-02 03:27:44', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-07-02 03:27:44', '0000-00-00 00:00:00', '', 0, 'https://www.nutaniti.com/?p=486', 0, 'post', '', 0),
(487, 81, '2020-07-02 03:28:08', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-07-02 03:28:08', '0000-00-00 00:00:00', '', 0, 'https://www.nutaniti.com/?p=487', 0, 'post', '', 0),
(467, 1, '2020-05-26 10:38:20', '2020-05-26 10:38:20', '.admission-frm th {\n    width: 230px;\n    text-align: left;\n}\n.admission-frm td, .admission-frm th {\n    float: left;\n    padding-bottom: 20px;\n}\n\n.admission-frm input, .admission-frm select, .admission-frm textarea {\n    width: 350px;\n    height: 30px;\n}\n.admission-submit {\n	text-align: center;\n}\n\n.admission-frm input.wpcf7-form-control.wpcf7-submit {\n    background: #79B530;\n    font-size: large;\n    font-weight: 900;\n    padding-bottom: 30px;\n}\n.admission-frm-header {\n    padding: 34px;\n}\n.iti-admission-banner{\n	    margin-top: -29px;\n}\n.vx_entries_table .tablesorter-headerRow{\n	background-color: #eeeeee;\n}\n.vx_entries_table  tfoot tr{\n	background-color: #eeeeee;	\n}\n\n.vx_entries_table th {\n	padding: 0 30px;\n}\n.vx_entries_table td {\n	text-align: center;\n	padding: 5px;\n	border-bottom: solid thin #ccc;\n}\n.page-id-379 .container {\n	width: 1500px;\n}', 'school-zone', '', 'inherit', 'closed', 'closed', '', '432-revision-v1', '', '', '2020-05-26 10:38:20', '2020-05-26 10:38:20', '', 432, 'https://www.nutaniti.com/432-revision-v1/', 0, 'revision', '', 0),
(471, 1, '2020-06-15 15:42:17', '2020-06-15 15:42:17', '', 'Dashboard', 'Dashboard contains all the overview ! ', 'publish', 'closed', 'closed', '', 'sch-dashboard', '', '', '2020-06-15 15:42:17', '2020-06-15 15:42:17', '', 0, 'https://www.nutaniti.com/sch-dashboard/', 0, 'page', '', 0),
(474, 1, '2020-06-15 16:06:22', '2020-06-15 16:06:22', '[wppb-register]', 'Register', '', 'publish', 'closed', 'closed', '', 'register', '', '', '2020-06-15 16:06:22', '2020-06-15 16:06:22', '', 0, 'https://www.nutaniti.com/register/', 0, 'page', '', 0),
(477, 1, '2020-06-15 16:07:16', '2020-06-15 16:07:16', ' ', '', '', 'publish', 'closed', 'closed', '', '477', '', '', '2020-06-15 16:07:16', '2020-06-15 16:07:16', '', 0, 'https://www.nutaniti.com/?p=477', 2, 'nav_menu_item', '', 0),
(482, 1, '2020-06-27 06:15:48', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-06-27 06:15:48', '0000-00-00 00:00:00', '', 0, 'https://www.nutaniti.com/?p=482', 0, 'post', '', 0),
(479, 1, '2020-06-19 18:49:16', '2020-06-19 18:49:16', '[wppb-login redirect_url=\"wp-admin/admin.php?page=sch-dashboard\"]', 'Log In', '', 'inherit', 'closed', 'closed', '', '476-revision-v1', '', '', '2020-06-19 18:49:16', '2020-06-19 18:49:16', '', 476, 'https://www.nutaniti.com/476-revision-v1/', 0, 'revision', '', 0),
(483, 82, '2020-07-02 03:08:13', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-07-02 03:08:13', '0000-00-00 00:00:00', '', 0, 'https://www.nutaniti.com/?p=483', 0, 'post', '', 0),
(481, 1, '2020-06-19 18:51:26', '2020-06-19 18:51:26', '[wppb-login redirect_url=\"https://www.nutaniti.com/wp-admin/admin.php?page=sch-dashboard\"]', 'Log In', '', 'inherit', 'closed', 'closed', '', '476-revision-v1', '', '', '2020-06-19 18:51:26', '2020-06-19 18:51:26', '', 476, 'https://www.nutaniti.com/476-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `iti_termmeta`
--

CREATE TABLE `iti_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_terms`
--

CREATE TABLE `iti_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_terms`
--

INSERT INTO `iti_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'post-format-image', 'post-format-image', 0),
(3, 'Slider', 'slider', 0),
(4, 'ItI chinawal', 'iti-chinawal', 0),
(5, 'Footer', 'footer', 0),
(7, 'Departments', 'departments', 0);

-- --------------------------------------------------------

--
-- Table structure for table `iti_term_relationships`
--

CREATE TABLE `iti_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_term_relationships`
--

INSERT INTO `iti_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 2, 0),
(27, 2, 0),
(27, 3, 0),
(63, 5, 0),
(42, 2, 0),
(42, 3, 0),
(44, 2, 0),
(44, 3, 0),
(358, 7, 0),
(359, 7, 0),
(50, 2, 0),
(50, 3, 0),
(64, 5, 0),
(212, 7, 0),
(84, 7, 0),
(118, 7, 0),
(86, 7, 0),
(87, 7, 0),
(88, 7, 0),
(131, 7, 0),
(130, 7, 0),
(129, 7, 0),
(128, 7, 0),
(148, 7, 0),
(158, 1, 0),
(472, 7, 0),
(477, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `iti_term_taxonomy`
--

CREATE TABLE `iti_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_term_taxonomy`
--

INSERT INTO `iti_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'post_format', '', 0, 5),
(3, 3, 'category', '', 0, 4),
(4, 4, 'marker', '', 0, 0),
(5, 5, 'nav_menu', '', 0, 2),
(7, 7, 'nav_menu', '', 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `iti_usermeta`
--

CREATE TABLE `iti_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_usermeta`
--

INSERT INTO `iti_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'nutaniti'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'iti_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'iti_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice,wp496_privacy,plugin_editor_notice,text_widget_paste_html'),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'iti_dashboard_quick_press_last_post_id', '482'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:13:\"103.232.239.0\";}'),
(19, 1, 'closedpostboxes_post', 'a:0:{}'),
(20, 1, 'meta-box-order_post', 'a:3:{s:8:\"advanced\";s:14:\"theme-settings\";s:4:\"side\";s:0:\"\";s:6:\"normal\";s:0:\"\";}'),
(21, 1, 'metaboxhidden_post', 'a:0:{}'),
(22, 1, 'iti_user-settings', 'libraryContent=browse&mfold=o&editor=html'),
(23, 1, 'iti_user-settings-time', '1590067142'),
(1132, 52, 'session_tokens', 'a:8:{s:64:\"c342c204abe827026a68dcec9935e29e46dbd5deb120faf0eb8cc10e4012888d\";a:4:{s:10:\"expiration\";i:1593868577;s:2:\"ip\";s:15:\"106.210.183.149\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Linux; Android 10; SM-M305F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.96 Mobile Safari/537.36\";s:5:\"login\";i:1593695777;}s:64:\"52d0b86dc212bd4effa927f10dc2c6e5c291d03bb3009baa06992cfec99eb6fb\";a:4:{s:10:\"expiration\";i:1593920946;s:2:\"ip\";s:14:\"117.200.174.38\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36\";s:5:\"login\";i:1593748146;}s:64:\"169b9925acb69c793c8b513d80aad39e411f6abdea1e294b7e3e8a455d532fbc\";a:4:{s:10:\"expiration\";i:1593938149;s:2:\"ip\";s:15:\"103.232.239.213\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36\";s:5:\"login\";i:1593765349;}s:64:\"f653069a58884b1b636d671c5bbce68d70a6d0d49a00706a4cfefb8e748793a5\";a:4:{s:10:\"expiration\";i:1593938149;s:2:\"ip\";s:15:\"103.232.239.213\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36\";s:5:\"login\";i:1593765349;}s:64:\"aeed382c408828ccec5138e92159e791fe442a3a1198ec4060e5938334703a81\";a:4:{s:10:\"expiration\";i:1594004569;s:2:\"ip\";s:15:\"117.200.172.108\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0\";s:5:\"login\";i:1593831769;}s:64:\"9b95da838310e1aed9d5807d1a8196f8a276d863de48de6ba1bfd079e15413b3\";a:4:{s:10:\"expiration\";i:1594006599;s:2:\"ip\";s:14:\"106.210.221.21\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Linux; Android 10; SM-M305F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.96 Mobile Safari/537.36\";s:5:\"login\";i:1593833799;}s:64:\"82b1dccb14433ab38475643b875cc68ae720fa879a921e647e47ae4aa6c3d0c0\";a:4:{s:10:\"expiration\";i:1594008143;s:2:\"ip\";s:14:\"106.210.221.21\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Linux; Android 10; SM-M305F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.96 Mobile Safari/537.36\";s:5:\"login\";i:1593835343;}s:64:\"21732aeb44e1538ea41d1e954634785c787bcf05026a14aae7bda07a9c5eabab\";a:4:{s:10:\"expiration\";i:1594010455;s:2:\"ip\";s:14:\"106.210.221.21\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Linux; Android 10; SM-M305F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.96 Mobile Safari/537.36\";s:5:\"login\";i:1593837655;}}'),
(24, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(25, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}'),
(26, 1, 'nav_menu_recently_edited', '7'),
(27, 1, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:38:\"dashboard_activity,dashboard_right_now\";s:4:\"side\";s:21:\"dashboard_quick_press\";s:7:\"column3\";s:17:\"dashboard_primary\";s:7:\"column4\";s:0:\"\";}'),
(28, 1, 'closedpostboxes_page', 'a:0:{}'),
(29, 1, 'metaboxhidden_page', 'a:0:{}'),
(30, 1, 'closedpostboxes_ngg-manage-gallery', 'a:0:{}'),
(31, 1, 'metaboxhidden_ngg-manage-gallery', 'a:0:{}'),
(712, 1, 'meta-box-order_page', 'a:3:{s:6:\"normal\";s:29:\"education_zone_sidebar_layout\";s:4:\"side\";s:0:\"\";s:8:\"advanced\";s:0:\"\";}'),
(711, 1, '_new_email', 'a:2:{s:4:\"hash\";s:32:\"527cbdab382668fc50bc09cf805fc3f5\";s:8:\"newemail\";s:22:\"nitcchinawal@gmail.com\";}'),
(713, 1, 'managetoplevel_page_{vxcf_leads}columnshidden', 'a:12:{i:0;s:21:\"cf_376-vxvx-BirthDate\";i:1;s:21:\"cf_376-vxvx-AdharCard\";i:2;s:21:\"cf_376-vxvx-Education\";i:3;s:17:\"cf_376-vxvx-Caste\";i:4;s:19:\"cf_376-vxvx-Address\";i:5;s:24:\"cf_376-vxvx-StudentPhoto\";i:6;s:25:\"cf_376-vxvx-PassportPhoto\";i:7;s:21:\"cf_376-vxvx-vxbrowser\";i:8;s:17:\"cf_376-vxvx-vxurl\";i:9;s:20:\"cf_376-vxvx-vxscreen\";i:10;s:21:\"cf_376-vxvx-vxupdated\";i:11;s:16:\"cf_376-vxvx-vxxx\";}'),
(2332, 52, 'iti_dashboard_quick_press_last_post_id', '480'),
(2333, 52, 'community-events-location', 'a:1:{s:2:\"ip\";s:13:\"103.232.239.0\";}'),
(740, 52, 'admin_color', 'fresh'),
(741, 52, 'use_ssl', '0'),
(742, 52, 'show_admin_bar_front', 'true'),
(743, 52, 'locale', ''),
(744, 52, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(745, 52, 'iti_user_level', '0'),
(746, 52, 'dismissed_wp_pointers', 'wp496_privacy'),
(733, 52, 'nickname', 'vkbhangale'),
(734, 52, 'first_name', 'Virendrakumar'),
(735, 52, 'last_name', ''),
(736, 52, 'description', ''),
(737, 52, 'rich_editing', 'true'),
(738, 52, 'syntax_highlighting', 'true'),
(739, 52, 'comment_shortcuts', 'false'),
(2353, 86, 'session_tokens', 'a:1:{s:64:\"edfe51ab6499772703877e772c89ac714941e523252d2d48ef9e13336972f420\";a:4:{s:10:\"expiration\";i:1593833452;s:2:\"ip\";s:11:\"157.47.31.0\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 5 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36\";s:5:\"login\";i:1593660652;}}'),
(2329, 80, 'iti_dashboard_quick_press_last_post_id', '478'),
(2336, 84, 'session_tokens', 'a:1:{s:64:\"ae7c2f96551941fdaacc452c771a1869a3ff4ae2f5da7c344344eb9f4039cc38\";a:4:{s:10:\"expiration\";i:1592767112;s:2:\"ip\";s:15:\"103.232.239.213\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";s:5:\"login\";i:1592594312;}}'),
(2339, 88, 'session_tokens', 'a:2:{s:64:\"fc32d583e13194087af5d5e7ca1fd582c418c8ee3e5cd7ecda08c5d0569b19a5\";a:4:{s:10:\"expiration\";i:1593747114;s:2:\"ip\";s:13:\"49.35.216.127\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Linux; Android 5.1.1; A37f) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593574314;}s:64:\"303cf6016fd1308edaab323946ae7b25cb1d971c0678b7a0d2bbab826ec56edd\";a:4:{s:10:\"expiration\";i:1594786924;s:2:\"ip\";s:12:\"49.35.215.81\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Linux; Android 5.1.1; A37f) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593577324;}}'),
(1140, 80, 'comment_shortcuts', 'false'),
(1139, 80, 'syntax_highlighting', 'true'),
(1138, 80, 'rich_editing', 'true'),
(1137, 80, 'description', ''),
(1136, 80, 'last_name', ''),
(1135, 80, 'first_name', 'Sandip'),
(1134, 80, 'nickname', 'schaudhari'),
(2347, 95, 'session_tokens', 'a:1:{s:64:\"d7d963ff949c19b4fd234d8a1faeaf7cdb0992795dc17799b796dcaccf5ce4da\";a:4:{s:10:\"expiration\";i:1593437220;s:2:\"ip\";s:15:\"106.220.166.188\";s:2:\"ua\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.96 Safari/537.36\";s:5:\"login\";i:1593264420;}}'),
(1851, 52, 'displaypicture', 'a:1:{s:4:\"full\";s:75:\"https://www.nutaniti.com/wp-content/uploads/2020/06/IMG-20180210-WA0042.jpg\";}'),
(1151, 81, 'description', ''),
(1150, 81, 'last_name', ''),
(1149, 81, 'first_name', 'Saraju'),
(1148, 81, 'nickname', 'shole'),
(1147, 80, 'dismissed_wp_pointers', 'wp496_privacy'),
(1146, 80, 'iti_user_level', '0'),
(1145, 80, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(1144, 80, 'locale', ''),
(1141, 80, 'admin_color', 'fresh'),
(1142, 80, 'use_ssl', '0'),
(1143, 80, 'show_admin_bar_front', 'true'),
(1159, 81, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(1158, 81, 'locale', ''),
(1157, 81, 'show_admin_bar_front', 'true'),
(1156, 81, 'use_ssl', '0'),
(1155, 81, 'admin_color', 'fresh'),
(1154, 81, 'comment_shortcuts', 'false'),
(1152, 81, 'rich_editing', 'true'),
(1153, 81, 'syntax_highlighting', 'true'),
(1169, 82, 'admin_color', 'fresh'),
(1168, 82, 'comment_shortcuts', 'false'),
(1167, 82, 'syntax_highlighting', 'true'),
(1166, 82, 'rich_editing', 'true'),
(1165, 82, 'description', ''),
(1164, 82, 'last_name', ''),
(1163, 82, 'first_name', 'Rajesh'),
(1162, 82, 'nickname', 'ringale'),
(1160, 81, 'iti_user_level', '0'),
(1161, 81, 'dismissed_wp_pointers', 'wp496_privacy'),
(1180, 83, 'rich_editing', 'true'),
(1179, 83, 'description', ''),
(1178, 83, 'last_name', ''),
(1177, 83, 'first_name', 'Rahul'),
(1176, 83, 'nickname', 'rmahajan'),
(1175, 82, 'dismissed_wp_pointers', 'wp496_privacy'),
(1174, 82, 'iti_user_level', '0'),
(1173, 82, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(1172, 82, 'locale', ''),
(1170, 82, 'use_ssl', '0'),
(1171, 82, 'show_admin_bar_front', 'true'),
(1189, 83, 'dismissed_wp_pointers', 'wp496_privacy'),
(1188, 83, 'iti_user_level', '0'),
(1187, 83, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(1186, 83, 'locale', ''),
(1185, 83, 'show_admin_bar_front', 'true'),
(1184, 83, 'use_ssl', '0'),
(1183, 83, 'admin_color', 'fresh'),
(1181, 83, 'syntax_highlighting', 'true'),
(1182, 83, 'comment_shortcuts', 'false'),
(1263, 89, 'description', ''),
(1262, 89, 'last_name', ''),
(1261, 89, 'first_name', 'Dhiraj'),
(1260, 89, 'nickname', 'dbhangale'),
(1259, 88, 'dismissed_wp_pointers', 'wp496_privacy'),
(1258, 88, 'iti_user_level', '0'),
(1257, 88, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(1256, 88, 'locale', ''),
(1255, 88, 'show_admin_bar_front', 'true'),
(904, 64, 'nickname', 'Joli'),
(905, 64, 'first_name', 'Joli'),
(906, 64, 'last_name', ''),
(907, 64, 'description', ''),
(908, 64, 'rich_editing', 'true'),
(909, 64, 'syntax_highlighting', 'true'),
(910, 64, 'comment_shortcuts', 'false'),
(911, 64, 'admin_color', 'fresh'),
(912, 64, 'use_ssl', '0'),
(913, 64, 'show_admin_bar_front', 'true'),
(914, 64, 'locale', ''),
(915, 64, 'iti_capabilities', 'a:1:{s:6:\"parent\";b:1;}'),
(916, 64, 'iti_user_level', '0'),
(917, 64, 'dismissed_wp_pointers', 'wp496_privacy'),
(1254, 88, 'use_ssl', '0'),
(1253, 88, 'admin_color', 'fresh'),
(1252, 88, 'comment_shortcuts', 'false'),
(1251, 88, 'syntax_highlighting', 'true'),
(1250, 88, 'rich_editing', 'true'),
(1249, 88, 'description', ''),
(1248, 88, 'last_name', ''),
(1247, 88, 'first_name', 'Yogesh'),
(1246, 88, 'nickname', 'ychaudhari'),
(932, 66, 'nickname', 'Aurelia'),
(933, 66, 'first_name', 'Aurelia'),
(934, 66, 'last_name', ''),
(935, 66, 'description', ''),
(936, 66, 'rich_editing', 'true'),
(937, 66, 'syntax_highlighting', 'true'),
(938, 66, 'comment_shortcuts', 'false'),
(939, 66, 'admin_color', 'fresh'),
(940, 66, 'use_ssl', '0'),
(941, 66, 'show_admin_bar_front', 'true'),
(942, 66, 'locale', ''),
(943, 66, 'iti_capabilities', 'a:1:{s:6:\"parent\";b:1;}'),
(944, 66, 'iti_user_level', '0'),
(945, 66, 'dismissed_wp_pointers', 'wp496_privacy'),
(1245, 87, 'dismissed_wp_pointers', 'wp496_privacy'),
(1244, 87, 'iti_user_level', '0'),
(1243, 87, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1242, 87, 'locale', ''),
(1241, 87, 'show_admin_bar_front', 'true'),
(1240, 87, 'use_ssl', '0'),
(1239, 87, 'admin_color', 'fresh'),
(1238, 87, 'comment_shortcuts', 'false'),
(960, 68, 'nickname', 'Smith'),
(961, 68, 'first_name', 'Smith'),
(962, 68, 'last_name', ''),
(963, 68, 'description', ''),
(964, 68, 'rich_editing', 'true'),
(965, 68, 'syntax_highlighting', 'true'),
(966, 68, 'comment_shortcuts', 'false'),
(967, 68, 'admin_color', 'fresh'),
(968, 68, 'use_ssl', '0'),
(969, 68, 'show_admin_bar_front', 'true'),
(970, 68, 'locale', ''),
(971, 68, 'iti_capabilities', 'a:1:{s:6:\"parent\";b:1;}'),
(972, 68, 'iti_user_level', '0'),
(973, 68, 'dismissed_wp_pointers', 'wp496_privacy'),
(1237, 87, 'syntax_highlighting', 'true'),
(1236, 87, 'rich_editing', 'true'),
(1235, 87, 'description', ''),
(1234, 87, 'last_name', ''),
(1233, 87, 'first_name', 'Pushpak'),
(1232, 87, 'nickname', 'pbhangale'),
(1231, 86, 'dismissed_wp_pointers', 'wp496_privacy'),
(1230, 86, 'iti_user_level', '0'),
(1229, 86, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(1228, 86, 'locale', ''),
(1227, 86, 'show_admin_bar_front', 'true'),
(988, 70, 'nickname', 'Mike'),
(989, 70, 'first_name', 'Mike'),
(990, 70, 'last_name', ''),
(991, 70, 'description', ''),
(992, 70, 'rich_editing', 'true'),
(993, 70, 'syntax_highlighting', 'true'),
(994, 70, 'comment_shortcuts', 'false'),
(995, 70, 'admin_color', 'fresh'),
(996, 70, 'use_ssl', '0'),
(997, 70, 'show_admin_bar_front', 'true'),
(998, 70, 'locale', ''),
(999, 70, 'iti_capabilities', 'a:1:{s:6:\"parent\";b:1;}'),
(1000, 70, 'iti_user_level', '0'),
(1001, 70, 'dismissed_wp_pointers', 'wp496_privacy'),
(1226, 86, 'use_ssl', '0'),
(1225, 86, 'admin_color', 'fresh'),
(1224, 86, 'comment_shortcuts', 'false'),
(1223, 86, 'syntax_highlighting', 'true'),
(1222, 86, 'rich_editing', 'true'),
(1221, 86, 'description', ''),
(1220, 86, 'last_name', ''),
(1219, 86, 'first_name', 'Vaibhav'),
(1218, 86, 'nickname', 'vmahajan'),
(1016, 72, 'nickname', 'James'),
(1017, 72, 'first_name', 'James'),
(1018, 72, 'last_name', ''),
(1019, 72, 'description', ''),
(1020, 72, 'rich_editing', 'true'),
(1021, 72, 'syntax_highlighting', 'true'),
(1022, 72, 'comment_shortcuts', 'false'),
(1023, 72, 'admin_color', 'fresh'),
(1024, 72, 'use_ssl', '0'),
(1025, 72, 'show_admin_bar_front', 'true'),
(1026, 72, 'locale', ''),
(1027, 72, 'iti_capabilities', 'a:1:{s:6:\"parent\";b:1;}'),
(1028, 72, 'iti_user_level', '0'),
(1029, 72, 'dismissed_wp_pointers', 'wp496_privacy'),
(1217, 85, 'dismissed_wp_pointers', 'wp496_privacy'),
(1216, 85, 'iti_user_level', '0'),
(1215, 85, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(1214, 85, 'locale', ''),
(1213, 85, 'show_admin_bar_front', 'true'),
(1212, 85, 'use_ssl', '0'),
(1211, 85, 'admin_color', 'fresh'),
(1210, 85, 'comment_shortcuts', 'false'),
(1044, 74, 'nickname', 'Pineapple'),
(1045, 74, 'first_name', 'Pineapple'),
(1046, 74, 'last_name', ''),
(1047, 74, 'description', ''),
(1048, 74, 'rich_editing', 'true'),
(1049, 74, 'syntax_highlighting', 'true'),
(1050, 74, 'comment_shortcuts', 'false'),
(1051, 74, 'admin_color', 'fresh'),
(1052, 74, 'use_ssl', '0'),
(1053, 74, 'show_admin_bar_front', 'true'),
(1054, 74, 'locale', ''),
(1055, 74, 'iti_capabilities', 'a:1:{s:6:\"parent\";b:1;}'),
(1056, 74, 'iti_user_level', '0'),
(1057, 74, 'dismissed_wp_pointers', 'wp496_privacy'),
(1209, 85, 'syntax_highlighting', 'true'),
(1208, 85, 'rich_editing', 'true'),
(1207, 85, 'description', ''),
(1206, 85, 'last_name', ''),
(1205, 85, 'first_name', 'Vinod'),
(1204, 85, 'nickname', 'vpatil'),
(1203, 84, 'dismissed_wp_pointers', 'wp496_privacy'),
(1202, 84, 'iti_user_level', '0'),
(1201, 84, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1200, 84, 'locale', ''),
(1199, 84, 'show_admin_bar_front', 'true'),
(1072, 76, 'nickname', 'Fred'),
(1073, 76, 'first_name', 'Fred'),
(1074, 76, 'last_name', ''),
(1075, 76, 'description', ''),
(1076, 76, 'rich_editing', 'true'),
(1077, 76, 'syntax_highlighting', 'true'),
(1078, 76, 'comment_shortcuts', 'false'),
(1079, 76, 'admin_color', 'fresh'),
(1080, 76, 'use_ssl', '0'),
(1081, 76, 'show_admin_bar_front', 'true'),
(1082, 76, 'locale', ''),
(1083, 76, 'iti_capabilities', 'a:1:{s:6:\"parent\";b:1;}'),
(1084, 76, 'iti_user_level', '0'),
(1085, 76, 'dismissed_wp_pointers', 'wp496_privacy'),
(1198, 84, 'use_ssl', '0'),
(1197, 84, 'admin_color', 'fresh'),
(1196, 84, 'comment_shortcuts', 'false'),
(1195, 84, 'syntax_highlighting', 'true'),
(1194, 84, 'rich_editing', 'true'),
(1193, 84, 'description', ''),
(1192, 84, 'last_name', ''),
(1191, 84, 'first_name', 'Lakhan'),
(1190, 84, 'nickname', 'lbhalerao'),
(1100, 78, 'nickname', 'Smiths'),
(1101, 78, 'first_name', 'Smiths'),
(1102, 78, 'last_name', ''),
(1103, 78, 'description', ''),
(1104, 78, 'rich_editing', 'true'),
(1105, 78, 'syntax_highlighting', 'true'),
(1106, 78, 'comment_shortcuts', 'false'),
(1107, 78, 'admin_color', 'fresh'),
(1108, 78, 'use_ssl', '0'),
(1109, 78, 'show_admin_bar_front', 'true'),
(1110, 78, 'locale', ''),
(1111, 78, 'iti_capabilities', 'a:1:{s:6:\"parent\";b:1;}'),
(1112, 78, 'iti_user_level', '0'),
(1113, 78, 'dismissed_wp_pointers', 'wp496_privacy'),
(1273, 89, 'dismissed_wp_pointers', 'wp496_privacy'),
(1272, 89, 'iti_user_level', '0'),
(1271, 89, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1270, 89, 'locale', ''),
(1269, 89, 'show_admin_bar_front', 'true'),
(1268, 89, 'use_ssl', '0'),
(1267, 89, 'admin_color', 'fresh'),
(1266, 89, 'comment_shortcuts', 'false'),
(1265, 89, 'syntax_highlighting', 'true'),
(1264, 89, 'rich_editing', 'true'),
(1274, 90, 'nickname', 'rbharambe'),
(1275, 90, 'first_name', 'Ramesh'),
(1276, 90, 'last_name', ''),
(1277, 90, 'description', ''),
(1278, 90, 'rich_editing', 'true'),
(1279, 90, 'syntax_highlighting', 'true'),
(1280, 90, 'comment_shortcuts', 'false'),
(1281, 90, 'admin_color', 'fresh'),
(1282, 90, 'use_ssl', '0'),
(1283, 90, 'show_admin_bar_front', 'true'),
(1284, 90, 'locale', ''),
(1285, 90, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(1286, 90, 'iti_user_level', '0'),
(1287, 90, 'dismissed_wp_pointers', 'wp496_privacy'),
(1288, 91, 'nickname', 'akaple'),
(1289, 91, 'first_name', 'Aakash'),
(1290, 91, 'last_name', ''),
(1291, 91, 'description', ''),
(1292, 91, 'rich_editing', 'true'),
(1293, 91, 'syntax_highlighting', 'true'),
(1294, 91, 'comment_shortcuts', 'false'),
(1295, 91, 'admin_color', 'fresh'),
(1296, 91, 'use_ssl', '0'),
(1297, 91, 'show_admin_bar_front', 'true'),
(1298, 91, 'locale', ''),
(1299, 91, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1300, 91, 'iti_user_level', '0'),
(1301, 91, 'dismissed_wp_pointers', 'wp496_privacy'),
(1302, 92, 'nickname', 'amahajan'),
(1303, 92, 'first_name', 'Arun'),
(1304, 92, 'last_name', ''),
(1305, 92, 'description', ''),
(1306, 92, 'rich_editing', 'true'),
(1307, 92, 'syntax_highlighting', 'true'),
(1308, 92, 'comment_shortcuts', 'false'),
(1309, 92, 'admin_color', 'fresh'),
(1310, 92, 'use_ssl', '0'),
(1311, 92, 'show_admin_bar_front', 'true'),
(1312, 92, 'locale', ''),
(1313, 92, 'iti_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(1314, 92, 'iti_user_level', '0'),
(1315, 92, 'dismissed_wp_pointers', 'wp496_privacy'),
(1316, 93, 'nickname', 'rwaykole'),
(1317, 93, 'first_name', 'Rajeshkumar'),
(1318, 93, 'last_name', ''),
(1319, 93, 'description', ''),
(1320, 93, 'rich_editing', 'true'),
(1321, 93, 'syntax_highlighting', 'true'),
(1322, 93, 'comment_shortcuts', 'false'),
(1323, 93, 'admin_color', 'fresh'),
(1324, 93, 'use_ssl', '0'),
(1325, 93, 'show_admin_bar_front', 'true'),
(1326, 93, 'locale', ''),
(1327, 93, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1328, 93, 'iti_user_level', '0'),
(1329, 93, 'dismissed_wp_pointers', 'wp496_privacy'),
(1330, 94, 'nickname', 'dchaudhari'),
(1331, 94, 'first_name', 'Devendra'),
(1332, 94, 'last_name', ''),
(1333, 94, 'description', ''),
(1334, 94, 'rich_editing', 'true'),
(1335, 94, 'syntax_highlighting', 'true'),
(1336, 94, 'comment_shortcuts', 'false'),
(1337, 94, 'admin_color', 'fresh'),
(1338, 94, 'use_ssl', '0'),
(1339, 94, 'show_admin_bar_front', 'true'),
(1340, 94, 'locale', ''),
(1341, 94, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1342, 94, 'iti_user_level', '0'),
(1343, 94, 'dismissed_wp_pointers', 'wp496_privacy'),
(1344, 95, 'nickname', 'vborole'),
(1345, 95, 'first_name', 'Vaibhav'),
(1346, 95, 'last_name', ''),
(1347, 95, 'description', ''),
(1348, 95, 'rich_editing', 'true'),
(1349, 95, 'syntax_highlighting', 'true'),
(1350, 95, 'comment_shortcuts', 'false'),
(1351, 95, 'admin_color', 'fresh'),
(1352, 95, 'use_ssl', '0'),
(1353, 95, 'show_admin_bar_front', 'true'),
(1354, 95, 'locale', ''),
(1355, 95, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1356, 95, 'iti_user_level', '0'),
(1357, 95, 'dismissed_wp_pointers', 'wp496_privacy'),
(1358, 96, 'nickname', 'kchaudhari'),
(1359, 96, 'first_name', 'Khilchand'),
(1360, 96, 'last_name', ''),
(1361, 96, 'description', ''),
(1362, 96, 'rich_editing', 'true'),
(1363, 96, 'syntax_highlighting', 'true'),
(1364, 96, 'comment_shortcuts', 'false'),
(1365, 96, 'admin_color', 'fresh'),
(1366, 96, 'use_ssl', '0'),
(1367, 96, 'show_admin_bar_front', 'true'),
(1368, 96, 'locale', ''),
(1369, 96, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1370, 96, 'iti_user_level', '0'),
(1371, 96, 'dismissed_wp_pointers', 'wp496_privacy'),
(1372, 97, 'nickname', 'vpatil01'),
(1373, 97, 'first_name', 'Vaibhav'),
(1374, 97, 'last_name', ''),
(1375, 97, 'description', ''),
(1376, 97, 'rich_editing', 'true'),
(1377, 97, 'syntax_highlighting', 'true'),
(1378, 97, 'comment_shortcuts', 'false'),
(1379, 97, 'admin_color', 'fresh'),
(1380, 97, 'use_ssl', '0'),
(1381, 97, 'show_admin_bar_front', 'true'),
(1382, 97, 'locale', ''),
(1383, 97, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1384, 97, 'iti_user_level', '0'),
(1385, 97, 'dismissed_wp_pointers', 'wp496_privacy'),
(1386, 98, 'nickname', 'pmahajan'),
(1387, 98, 'first_name', 'Purvesh'),
(1388, 98, 'last_name', ''),
(1389, 98, 'description', ''),
(1390, 98, 'rich_editing', 'true'),
(1391, 98, 'syntax_highlighting', 'true'),
(1392, 98, 'comment_shortcuts', 'false'),
(1393, 98, 'admin_color', 'fresh'),
(1394, 98, 'use_ssl', '0'),
(1395, 98, 'show_admin_bar_front', 'true'),
(1396, 98, 'locale', ''),
(1397, 98, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1398, 98, 'iti_user_level', '0'),
(1399, 98, 'dismissed_wp_pointers', 'wp496_privacy'),
(1400, 99, 'nickname', 'dnemade'),
(1401, 99, 'first_name', 'Devesh'),
(1402, 99, 'last_name', ''),
(1403, 99, 'description', ''),
(1404, 99, 'rich_editing', 'true'),
(1405, 99, 'syntax_highlighting', 'true'),
(1406, 99, 'comment_shortcuts', 'false'),
(1407, 99, 'admin_color', 'fresh'),
(1408, 99, 'use_ssl', '0'),
(1409, 99, 'show_admin_bar_front', 'true'),
(1410, 99, 'locale', ''),
(1411, 99, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1412, 99, 'iti_user_level', '0'),
(1413, 99, 'dismissed_wp_pointers', 'wp496_privacy'),
(1414, 100, 'nickname', 'kzope'),
(1415, 100, 'first_name', 'Kunal'),
(1416, 100, 'last_name', ''),
(1417, 100, 'description', ''),
(1418, 100, 'rich_editing', 'true'),
(1419, 100, 'syntax_highlighting', 'true'),
(1420, 100, 'comment_shortcuts', 'false'),
(1421, 100, 'admin_color', 'fresh'),
(1422, 100, 'use_ssl', '0'),
(1423, 100, 'show_admin_bar_front', 'true'),
(1424, 100, 'locale', ''),
(1425, 100, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1426, 100, 'iti_user_level', '0'),
(1427, 100, 'dismissed_wp_pointers', 'wp496_privacy'),
(1428, 101, 'nickname', 'hkoli'),
(1429, 101, 'first_name', 'Hemant'),
(1430, 101, 'last_name', ''),
(1431, 101, 'description', ''),
(1432, 101, 'rich_editing', 'true'),
(1433, 101, 'syntax_highlighting', 'true'),
(1434, 101, 'comment_shortcuts', 'false'),
(1435, 101, 'admin_color', 'fresh'),
(1436, 101, 'use_ssl', '0'),
(1437, 101, 'show_admin_bar_front', 'true'),
(1438, 101, 'locale', ''),
(1439, 101, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1440, 101, 'iti_user_level', '0'),
(1441, 101, 'dismissed_wp_pointers', 'wp496_privacy'),
(1442, 102, 'nickname', 'vmalvekar'),
(1443, 102, 'first_name', 'Vishal'),
(1444, 102, 'last_name', ''),
(1445, 102, 'description', ''),
(1446, 102, 'rich_editing', 'true'),
(1447, 102, 'syntax_highlighting', 'true'),
(1448, 102, 'comment_shortcuts', 'false'),
(1449, 102, 'admin_color', 'fresh'),
(1450, 102, 'use_ssl', '0'),
(1451, 102, 'show_admin_bar_front', 'true'),
(1452, 102, 'locale', ''),
(1453, 102, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1454, 102, 'iti_user_level', '0'),
(1455, 102, 'dismissed_wp_pointers', 'wp496_privacy'),
(1456, 103, 'nickname', 'cnemade'),
(1457, 103, 'first_name', 'Chinmay'),
(1458, 103, 'last_name', ''),
(1459, 103, 'description', ''),
(1460, 103, 'rich_editing', 'true'),
(1461, 103, 'syntax_highlighting', 'true'),
(1462, 103, 'comment_shortcuts', 'false'),
(1463, 103, 'admin_color', 'fresh'),
(1464, 103, 'use_ssl', '0'),
(1465, 103, 'show_admin_bar_front', 'true'),
(1466, 103, 'locale', ''),
(1467, 103, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1468, 103, 'iti_user_level', '0'),
(1469, 103, 'dismissed_wp_pointers', 'wp496_privacy'),
(1470, 104, 'nickname', 'dtayade'),
(1471, 104, 'first_name', 'Devayash'),
(1472, 104, 'last_name', ''),
(1473, 104, 'description', ''),
(1474, 104, 'rich_editing', 'true'),
(1475, 104, 'syntax_highlighting', 'true'),
(1476, 104, 'comment_shortcuts', 'false'),
(1477, 104, 'admin_color', 'fresh'),
(1478, 104, 'use_ssl', '0'),
(1479, 104, 'show_admin_bar_front', 'true'),
(1480, 104, 'locale', ''),
(1481, 104, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1482, 104, 'iti_user_level', '0'),
(1483, 104, 'dismissed_wp_pointers', 'wp496_privacy'),
(1484, 105, 'nickname', 'cpatil'),
(1485, 105, 'first_name', 'Chetan'),
(1486, 105, 'last_name', ''),
(1487, 105, 'description', ''),
(1488, 105, 'rich_editing', 'true'),
(1489, 105, 'syntax_highlighting', 'true'),
(1490, 105, 'comment_shortcuts', 'false'),
(1491, 105, 'admin_color', 'fresh'),
(1492, 105, 'use_ssl', '0'),
(1493, 105, 'show_admin_bar_front', 'true'),
(1494, 105, 'locale', ''),
(1495, 105, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1496, 105, 'iti_user_level', '0'),
(1497, 105, 'dismissed_wp_pointers', 'wp496_privacy'),
(1498, 106, 'nickname', 'achoudhari'),
(1499, 106, 'first_name', 'Anant'),
(1500, 106, 'last_name', ''),
(1501, 106, 'description', ''),
(1502, 106, 'rich_editing', 'true'),
(1503, 106, 'syntax_highlighting', 'true'),
(1504, 106, 'comment_shortcuts', 'false'),
(1505, 106, 'admin_color', 'fresh'),
(1506, 106, 'use_ssl', '0'),
(1507, 106, 'show_admin_bar_front', 'true'),
(1508, 106, 'locale', ''),
(1509, 106, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1510, 106, 'iti_user_level', '0'),
(1511, 106, 'dismissed_wp_pointers', 'wp496_privacy'),
(1512, 107, 'nickname', 'tnemade'),
(1513, 107, 'first_name', 'Tekchand'),
(1514, 107, 'last_name', ''),
(1515, 107, 'description', ''),
(1516, 107, 'rich_editing', 'true'),
(1517, 107, 'syntax_highlighting', 'true'),
(1518, 107, 'comment_shortcuts', 'false'),
(1519, 107, 'admin_color', 'fresh'),
(1520, 107, 'use_ssl', '0'),
(1521, 107, 'show_admin_bar_front', 'true'),
(1522, 107, 'locale', ''),
(1523, 107, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1524, 107, 'iti_user_level', '0'),
(1525, 107, 'dismissed_wp_pointers', 'wp496_privacy'),
(1526, 108, 'nickname', 'ypatil'),
(1527, 108, 'first_name', 'Yugant'),
(1528, 108, 'last_name', ''),
(1529, 108, 'description', ''),
(1530, 108, 'rich_editing', 'true'),
(1531, 108, 'syntax_highlighting', 'true'),
(1532, 108, 'comment_shortcuts', 'false'),
(1533, 108, 'admin_color', 'fresh'),
(1534, 108, 'use_ssl', '0'),
(1535, 108, 'show_admin_bar_front', 'true'),
(1536, 108, 'locale', ''),
(1537, 108, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1538, 108, 'iti_user_level', '0'),
(1539, 108, 'dismissed_wp_pointers', 'wp496_privacy'),
(1540, 109, 'nickname', 'skolambe'),
(1541, 109, 'first_name', 'Suraj'),
(1542, 109, 'last_name', ''),
(1543, 109, 'description', ''),
(1544, 109, 'rich_editing', 'true'),
(1545, 109, 'syntax_highlighting', 'true'),
(1546, 109, 'comment_shortcuts', 'false'),
(1547, 109, 'admin_color', 'fresh'),
(1548, 109, 'use_ssl', '0'),
(1549, 109, 'show_admin_bar_front', 'true'),
(1550, 109, 'locale', ''),
(1551, 109, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1552, 109, 'iti_user_level', '0'),
(1553, 109, 'dismissed_wp_pointers', 'wp496_privacy'),
(1554, 110, 'nickname', 'kpatil'),
(1555, 110, 'first_name', 'Kalpesh'),
(1556, 110, 'last_name', ''),
(1557, 110, 'description', ''),
(1558, 110, 'rich_editing', 'true'),
(1559, 110, 'syntax_highlighting', 'true'),
(1560, 110, 'comment_shortcuts', 'false'),
(1561, 110, 'admin_color', 'fresh'),
(1562, 110, 'use_ssl', '0'),
(1563, 110, 'show_admin_bar_front', 'true'),
(1564, 110, 'locale', ''),
(1565, 110, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1566, 110, 'iti_user_level', '0'),
(1567, 110, 'dismissed_wp_pointers', 'wp496_privacy'),
(1568, 111, 'nickname', 'stadavi'),
(1569, 111, 'first_name', 'Sahil'),
(1570, 111, 'last_name', ''),
(1571, 111, 'description', ''),
(1572, 111, 'rich_editing', 'true'),
(1573, 111, 'syntax_highlighting', 'true'),
(1574, 111, 'comment_shortcuts', 'false'),
(1575, 111, 'admin_color', 'fresh'),
(1576, 111, 'use_ssl', '0'),
(1577, 111, 'show_admin_bar_front', 'true'),
(1578, 111, 'locale', ''),
(1579, 111, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1580, 111, 'iti_user_level', '0'),
(1581, 111, 'dismissed_wp_pointers', 'wp496_privacy'),
(1582, 112, 'nickname', 'abonde'),
(1583, 112, 'first_name', 'Ashish'),
(1584, 112, 'last_name', ''),
(1585, 112, 'description', ''),
(1586, 112, 'rich_editing', 'true'),
(1587, 112, 'syntax_highlighting', 'true'),
(1588, 112, 'comment_shortcuts', 'false'),
(1589, 112, 'admin_color', 'fresh'),
(1590, 112, 'use_ssl', '0'),
(1591, 112, 'show_admin_bar_front', 'true'),
(1592, 112, 'locale', ''),
(1593, 112, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1594, 112, 'iti_user_level', '0'),
(1595, 112, 'dismissed_wp_pointers', 'wp496_privacy'),
(1596, 113, 'nickname', 'tpatil'),
(1597, 113, 'first_name', 'Tejas'),
(1598, 113, 'last_name', ''),
(1599, 113, 'description', ''),
(1600, 113, 'rich_editing', 'true'),
(1601, 113, 'syntax_highlighting', 'true'),
(1602, 113, 'comment_shortcuts', 'false'),
(1603, 113, 'admin_color', 'fresh'),
(1604, 113, 'use_ssl', '0'),
(1605, 113, 'show_admin_bar_front', 'true'),
(1606, 113, 'locale', ''),
(1607, 113, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1608, 113, 'iti_user_level', '0'),
(1609, 113, 'dismissed_wp_pointers', 'wp496_privacy'),
(1610, 114, 'nickname', 'ihivare'),
(1611, 114, 'first_name', 'Ishwar'),
(1612, 114, 'last_name', ''),
(1613, 114, 'description', ''),
(1614, 114, 'rich_editing', 'true'),
(1615, 114, 'syntax_highlighting', 'true'),
(1616, 114, 'comment_shortcuts', 'false'),
(1617, 114, 'admin_color', 'fresh'),
(1618, 114, 'use_ssl', '0'),
(1619, 114, 'show_admin_bar_front', 'true'),
(1620, 114, 'locale', ''),
(1621, 114, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1622, 114, 'iti_user_level', '0'),
(1623, 114, 'dismissed_wp_pointers', 'wp496_privacy'),
(1624, 115, 'nickname', 'ningale'),
(1625, 115, 'first_name', 'Niraj'),
(1626, 115, 'last_name', ''),
(1627, 115, 'description', ''),
(1628, 115, 'rich_editing', 'true'),
(1629, 115, 'syntax_highlighting', 'true'),
(1630, 115, 'comment_shortcuts', 'false'),
(1631, 115, 'admin_color', 'fresh'),
(1632, 115, 'use_ssl', '0'),
(1633, 115, 'show_admin_bar_front', 'true'),
(1634, 115, 'locale', ''),
(1635, 115, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1636, 115, 'iti_user_level', '0'),
(1637, 115, 'dismissed_wp_pointers', 'wp496_privacy'),
(1638, 116, 'nickname', 'akahate'),
(1639, 116, 'first_name', 'Akash'),
(1640, 116, 'last_name', ''),
(1641, 116, 'description', ''),
(1642, 116, 'rich_editing', 'true'),
(1643, 116, 'syntax_highlighting', 'true'),
(1644, 116, 'comment_shortcuts', 'false'),
(1645, 116, 'admin_color', 'fresh'),
(1646, 116, 'use_ssl', '0'),
(1647, 116, 'show_admin_bar_front', 'true'),
(1648, 116, 'locale', ''),
(1649, 116, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1650, 116, 'iti_user_level', '0'),
(1651, 116, 'dismissed_wp_pointers', 'wp496_privacy'),
(1652, 117, 'nickname', 'spatil'),
(1653, 117, 'first_name', 'Shubham'),
(1654, 117, 'last_name', ''),
(1655, 117, 'description', ''),
(1656, 117, 'rich_editing', 'true'),
(1657, 117, 'syntax_highlighting', 'true'),
(1658, 117, 'comment_shortcuts', 'false'),
(1659, 117, 'admin_color', 'fresh'),
(1660, 117, 'use_ssl', '0'),
(1661, 117, 'show_admin_bar_front', 'true'),
(1662, 117, 'locale', ''),
(1663, 117, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1664, 117, 'iti_user_level', '0'),
(1665, 117, 'dismissed_wp_pointers', 'wp496_privacy'),
(1666, 118, 'nickname', 'smahajan'),
(1667, 118, 'first_name', 'Swapnil'),
(1668, 118, 'last_name', ''),
(1669, 118, 'description', ''),
(1670, 118, 'rich_editing', 'true'),
(1671, 118, 'syntax_highlighting', 'true'),
(1672, 118, 'comment_shortcuts', 'false'),
(1673, 118, 'admin_color', 'fresh'),
(1674, 118, 'use_ssl', '0'),
(1675, 118, 'show_admin_bar_front', 'true'),
(1676, 118, 'locale', ''),
(1677, 118, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1678, 118, 'iti_user_level', '0'),
(1679, 118, 'dismissed_wp_pointers', 'wp496_privacy'),
(1680, 119, 'nickname', 'sspakale'),
(1681, 119, 'first_name', 'Suraj'),
(1682, 119, 'last_name', ''),
(1683, 119, 'description', ''),
(1684, 119, 'rich_editing', 'true'),
(1685, 119, 'syntax_highlighting', 'true'),
(1686, 119, 'comment_shortcuts', 'false'),
(1687, 119, 'admin_color', 'fresh'),
(1688, 119, 'use_ssl', '0'),
(1689, 119, 'show_admin_bar_front', 'true'),
(1690, 119, 'locale', ''),
(1691, 119, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1692, 119, 'iti_user_level', '0'),
(1693, 119, 'dismissed_wp_pointers', 'wp496_privacy'),
(1694, 120, 'nickname', 'ypatil01'),
(1695, 120, 'first_name', 'Yugesh'),
(1696, 120, 'last_name', ''),
(1697, 120, 'description', ''),
(1698, 120, 'rich_editing', 'true'),
(1699, 120, 'syntax_highlighting', 'true'),
(1700, 120, 'comment_shortcuts', 'false'),
(1701, 120, 'admin_color', 'fresh'),
(1702, 120, 'use_ssl', '0'),
(1703, 120, 'show_admin_bar_front', 'true'),
(1704, 120, 'locale', ''),
(1705, 120, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1706, 120, 'iti_user_level', '0'),
(1707, 120, 'dismissed_wp_pointers', 'wp496_privacy'),
(1708, 121, 'nickname', 'ashaikh'),
(1709, 121, 'first_name', 'Azheruddin'),
(1710, 121, 'last_name', ''),
(1711, 121, 'description', ''),
(1712, 121, 'rich_editing', 'true'),
(1713, 121, 'syntax_highlighting', 'true'),
(1714, 121, 'comment_shortcuts', 'false'),
(1715, 121, 'admin_color', 'fresh'),
(1716, 121, 'use_ssl', '0'),
(1717, 121, 'show_admin_bar_front', 'true'),
(1718, 121, 'locale', ''),
(1719, 121, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1720, 121, 'iti_user_level', '0'),
(1721, 121, 'dismissed_wp_pointers', 'wp496_privacy'),
(1722, 122, 'nickname', 'hbhortakke'),
(1723, 122, 'first_name', 'Hemant'),
(1724, 122, 'last_name', ''),
(1725, 122, 'description', ''),
(1726, 122, 'rich_editing', 'true'),
(1727, 122, 'syntax_highlighting', 'true'),
(1728, 122, 'comment_shortcuts', 'false'),
(1729, 122, 'admin_color', 'fresh'),
(1730, 122, 'use_ssl', '0'),
(1731, 122, 'show_admin_bar_front', 'true'),
(1732, 122, 'locale', ''),
(1733, 122, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1734, 122, 'iti_user_level', '0'),
(1735, 122, 'dismissed_wp_pointers', 'wp496_privacy'),
(1736, 123, 'nickname', 'jnemade'),
(1737, 123, 'first_name', 'Jayesh'),
(1738, 123, 'last_name', ''),
(1739, 123, 'description', ''),
(1740, 123, 'rich_editing', 'true'),
(1741, 123, 'syntax_highlighting', 'true'),
(1742, 123, 'comment_shortcuts', 'false'),
(1743, 123, 'admin_color', 'fresh'),
(1744, 123, 'use_ssl', '0'),
(1745, 123, 'show_admin_bar_front', 'true'),
(1746, 123, 'locale', ''),
(1747, 123, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1748, 123, 'iti_user_level', '0'),
(1749, 123, 'dismissed_wp_pointers', 'wp496_privacy'),
(1750, 124, 'nickname', 'tpatil01'),
(1751, 124, 'first_name', 'Toshal'),
(1752, 124, 'last_name', ''),
(1753, 124, 'description', ''),
(1754, 124, 'rich_editing', 'true'),
(1755, 124, 'syntax_highlighting', 'true'),
(1756, 124, 'comment_shortcuts', 'false'),
(1757, 124, 'admin_color', 'fresh'),
(1758, 124, 'use_ssl', '0'),
(1759, 124, 'show_admin_bar_front', 'true'),
(1760, 124, 'locale', ''),
(1761, 124, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1762, 124, 'iti_user_level', '0'),
(1763, 124, 'dismissed_wp_pointers', 'wp496_privacy'),
(1764, 125, 'nickname', 'rkapale'),
(1765, 125, 'first_name', 'Rupesh'),
(1766, 125, 'last_name', ''),
(1767, 125, 'description', ''),
(1768, 125, 'rich_editing', 'true'),
(1769, 125, 'syntax_highlighting', 'true'),
(1770, 125, 'comment_shortcuts', 'false'),
(1771, 125, 'admin_color', 'fresh'),
(1772, 125, 'use_ssl', '0'),
(1773, 125, 'show_admin_bar_front', 'true'),
(1774, 125, 'locale', ''),
(1775, 125, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1776, 125, 'iti_user_level', '0'),
(1777, 125, 'dismissed_wp_pointers', 'wp496_privacy'),
(1778, 126, 'nickname', 'akhan'),
(1779, 126, 'first_name', 'Shahid Khan'),
(1780, 126, 'last_name', ''),
(1781, 126, 'description', ''),
(1782, 126, 'rich_editing', 'true'),
(1783, 126, 'syntax_highlighting', 'true'),
(1784, 126, 'comment_shortcuts', 'false'),
(1785, 126, 'admin_color', 'fresh'),
(1786, 126, 'use_ssl', '0'),
(1787, 126, 'show_admin_bar_front', 'true'),
(1788, 126, 'locale', ''),
(1789, 126, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1790, 126, 'iti_user_level', '0'),
(1791, 126, 'dismissed_wp_pointers', 'wp496_privacy'),
(1792, 127, 'nickname', 'azope'),
(1793, 127, 'first_name', 'Amit'),
(1794, 127, 'last_name', ''),
(1795, 127, 'description', ''),
(1796, 127, 'rich_editing', 'true'),
(1797, 127, 'syntax_highlighting', 'true'),
(1798, 127, 'comment_shortcuts', 'false'),
(1799, 127, 'admin_color', 'fresh'),
(1800, 127, 'use_ssl', '0'),
(1801, 127, 'show_admin_bar_front', 'true'),
(1802, 127, 'locale', ''),
(1803, 127, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1804, 127, 'iti_user_level', '0'),
(1805, 127, 'dismissed_wp_pointers', 'wp496_privacy'),
(1806, 128, 'nickname', 'sshaikh'),
(1807, 128, 'first_name', 'Shaikh Moin'),
(1808, 128, 'last_name', ''),
(1809, 128, 'description', ''),
(1810, 128, 'rich_editing', 'true'),
(1811, 128, 'syntax_highlighting', 'true'),
(1812, 128, 'comment_shortcuts', 'false'),
(1813, 128, 'admin_color', 'fresh'),
(1814, 128, 'use_ssl', '0'),
(1815, 128, 'show_admin_bar_front', 'true'),
(1816, 128, 'locale', ''),
(1817, 128, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1818, 128, 'iti_user_level', '0'),
(1819, 128, 'dismissed_wp_pointers', 'wp496_privacy'),
(1820, 129, 'nickname', 'smanyar'),
(1821, 129, 'first_name', 'Shaikh Shaheed'),
(1822, 129, 'last_name', ''),
(1823, 129, 'description', ''),
(1824, 129, 'rich_editing', 'true'),
(1825, 129, 'syntax_highlighting', 'true'),
(1826, 129, 'comment_shortcuts', 'false'),
(1827, 129, 'admin_color', 'fresh'),
(1828, 129, 'use_ssl', '0'),
(1829, 129, 'show_admin_bar_front', 'true'),
(1830, 129, 'locale', ''),
(1831, 129, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1832, 129, 'iti_user_level', '0'),
(1833, 129, 'dismissed_wp_pointers', 'wp496_privacy'),
(1834, 130, 'nickname', 'nmahajan'),
(1835, 130, 'first_name', 'Nikhil'),
(1836, 130, 'last_name', ''),
(1837, 130, 'description', ''),
(1838, 130, 'rich_editing', 'true'),
(1839, 130, 'syntax_highlighting', 'true'),
(1840, 130, 'comment_shortcuts', 'false'),
(1841, 130, 'admin_color', 'fresh'),
(1842, 130, 'use_ssl', '0'),
(1843, 130, 'show_admin_bar_front', 'true'),
(1844, 130, 'locale', ''),
(1845, 130, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1846, 130, 'iti_user_level', '0'),
(1847, 130, 'dismissed_wp_pointers', 'wp496_privacy'),
(1852, 52, 'simple_local_avatar', 'a:1:{s:4:\"full\";s:75:\"https://www.nutaniti.com/wp-content/uploads/2020/06/IMG-20180210-WA0042.jpg\";}'),
(2346, 81, 'session_tokens', 'a:4:{s:64:\"5db66d1af2a2cde68b1b26579a8d33236882a416e0b105b9ba05f489ae934199\";a:4:{s:10:\"expiration\";i:1594006362;s:2:\"ip\";s:14:\"157.33.149.108\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 5 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36\";s:5:\"login\";i:1593833562;}s:64:\"c01c08ea486999a2700e819fe88e3c5d9aae7e635d2d17616d696d23b06d74c2\";a:4:{s:10:\"expiration\";i:1594006782;s:2:\"ip\";s:14:\"157.33.149.108\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 5 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36\";s:5:\"login\";i:1593833982;}s:64:\"33804ad192ef2bed1e536b84cba24485d5c0374e204ae8c73f0822da77e188b2\";a:4:{s:10:\"expiration\";i:1594024101;s:2:\"ip\";s:14:\"157.33.149.108\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 5 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593851301;}s:64:\"86b7fa50a72c213d0b899201745c6b050f40b1680343d0d6a3da71bf55bcd7e8\";a:4:{s:10:\"expiration\";i:1594025501;s:2:\"ip\";s:14:\"157.33.149.108\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 5 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593852701;}}'),
(1855, 82, 'session_tokens', 'a:17:{s:64:\"0018772393605771ae9f696af6f69710d5eb42f7cd84dd8785dbd68480c06b91\";a:4:{s:10:\"expiration\";i:1593840725;s:2:\"ip\";s:14:\"157.33.151.165\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";s:5:\"login\";i:1592631125;}s:64:\"85ec45adf75e358e328b5e716654599341335c31e688caa754852493daf51c24\";a:4:{s:10:\"expiration\";i:1593786642;s:2:\"ip\";s:15:\"103.201.136.250\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593613842;}s:64:\"ac2ea8f8038034ffe6f7be63847ae74a7eb297d29f954886140925fc8a4de391\";a:4:{s:10:\"expiration\";i:1593786643;s:2:\"ip\";s:15:\"103.201.136.250\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593613843;}s:64:\"992cdd9159d9abf179bc21f75cf01dfd977b057f9aebb8657dac1037de379899\";a:4:{s:10:\"expiration\";i:1593791140;s:2:\"ip\";s:15:\"106.210.247.130\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Linux; Android 10; SM-M305F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.96 Mobile Safari/537.36\";s:5:\"login\";i:1593618340;}s:64:\"6b8db118fc695036c9a85643344001f7c35ee7189a2caa95747ff7dd82babaa1\";a:4:{s:10:\"expiration\";i:1593791672;s:2:\"ip\";s:12:\"49.35.26.201\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593618872;}s:64:\"1ebeb5addd705baf202cb0726e5dc8d2af14708b440ad58359005b8afa0e1530\";a:4:{s:10:\"expiration\";i:1593793193;s:2:\"ip\";s:12:\"49.35.26.201\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";s:5:\"login\";i:1593620393;}s:64:\"a22ff57fadeda65bd6d8b3b896086d0d3b0804783d2e8c46a3d94a33510302ad\";a:4:{s:10:\"expiration\";i:1593793194;s:2:\"ip\";s:12:\"49.35.26.201\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";s:5:\"login\";i:1593620394;}s:64:\"864f6230cf71f4354fe90804c3ef767f29735caa51ebd59c4ec2a479541eb699\";a:4:{s:10:\"expiration\";i:1593793950;s:2:\"ip\";s:12:\"49.35.26.201\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";s:5:\"login\";i:1593621150;}s:64:\"2a7017505829415b7d3ab503aa8a0c6b9c513a9b27b5ace23980c9fc73539399\";a:4:{s:10:\"expiration\";i:1593793950;s:2:\"ip\";s:12:\"49.35.26.201\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";s:5:\"login\";i:1593621150;}s:64:\"8c7332de3768e8b508484e1cbd982c0a8f1058e345979d2e934e26e66032ba68\";a:4:{s:10:\"expiration\";i:1593793953;s:2:\"ip\";s:12:\"49.35.26.201\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";s:5:\"login\";i:1593621153;}s:64:\"e98cb79d550ffc80b40ece05c0ef84daa2f8eb5c27adc6b47bf1e38d7e659610\";a:4:{s:10:\"expiration\";i:1593831849;s:2:\"ip\";s:10:\"49.35.11.7\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593659049;}s:64:\"0a074dd2df38ebca0c04b9fbf4015fce4be30071ea723c57f08d740b7f214a2b\";a:4:{s:10:\"expiration\";i:1593832557;s:2:\"ip\";s:15:\"106.210.183.145\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Linux; Android 10; SM-M305F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.96 Mobile Safari/537.36\";s:5:\"login\";i:1593659757;}s:64:\"e3a6ae2219cd73d107235da61563aad7d2907fca43ab820a4ea1e0f7b3306abc\";a:4:{s:10:\"expiration\";i:1593861710;s:2:\"ip\";s:11:\"49.35.4.255\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593688910;}s:64:\"fb2fed88cbc4a21f292795047ecd82f9227e078b5dfd53ad3788286aa3af4249\";a:4:{s:10:\"expiration\";i:1593861951;s:2:\"ip\";s:11:\"49.35.4.255\";s:2:\"ua\";s:64:\"Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0\";s:5:\"login\";i:1593689151;}s:64:\"931421fb2a7cca92ce2ebdb1e58fc77943dddcc4ad1d12ad3785bfa511e2d858\";a:4:{s:10:\"expiration\";i:1593866404;s:2:\"ip\";s:11:\"49.35.5.102\";s:2:\"ua\";s:64:\"Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0\";s:5:\"login\";i:1593693604;}s:64:\"16a46ba97df5ea6029bbb7bc1348ae964f30f149fa7a2ffe948703ce3a3c0e72\";a:4:{s:10:\"expiration\";i:1593926224;s:2:\"ip\";s:11:\"49.35.22.59\";s:2:\"ua\";s:129:\"Mozilla/5.0 (Linux; Android 9; Redmi Note 6 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593753424;}s:64:\"cd52f133c20756cda2265c83cf31367de2722a46552bd64a6e492f874de86e1a\";a:4:{s:10:\"expiration\";i:1593926773;s:2:\"ip\";s:11:\"49.35.22.59\";s:2:\"ua\";s:64:\"Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0\";s:5:\"login\";i:1593753973;}}'),
(2328, 80, 'session_tokens', 'a:14:{s:64:\"a7897ea99cddbf37db0f02a6a08e5abc393451d9212723fa6c108cdc5d1bd4fe\";a:4:{s:10:\"expiration\";i:1593833478;s:2:\"ip\";s:14:\"117.200.171.51\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36\";s:5:\"login\";i:1593660678;}s:64:\"79d2d6dbe592b0d27e0b589049eb8fe22252ce10bcd06725ce19279c5718c013\";a:4:{s:10:\"expiration\";i:1593833478;s:2:\"ip\";s:14:\"117.200.171.51\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36\";s:5:\"login\";i:1593660678;}s:64:\"27782c0ee9ee512de7e4c253ffbab576a844d0da67f16b3518ccb66dc2f404a8\";a:4:{s:10:\"expiration\";i:1593852489;s:2:\"ip\";s:13:\"106.220.95.23\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593679689;}s:64:\"f0dafcecdf7a309ba6a8231799ab3e172a946c07239890d2349c7d04134c9e1a\";a:4:{s:10:\"expiration\";i:1593856373;s:2:\"ip\";s:13:\"106.220.95.23\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593683573;}s:64:\"10ddfc065e1650c64a01e98ace8044e440fb81f30e78cb98b6f7fc0602a64361\";a:4:{s:10:\"expiration\";i:1593856531;s:2:\"ip\";s:13:\"106.220.95.23\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593683731;}s:64:\"6213f4ef91723b45b9ffddd61c45fee9e5843a2543737d243644789729f1de09\";a:4:{s:10:\"expiration\";i:1593859178;s:2:\"ip\";s:13:\"106.220.95.23\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593686378;}s:64:\"4b9d6aa37bad8acbe1d0b00eafa5f32782c282d2c854cf175cb22779ed3abed3\";a:4:{s:10:\"expiration\";i:1593868056;s:2:\"ip\";s:14:\"106.210.142.77\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593695256;}s:64:\"7dd4476679379e805dcfa56d7456762594a643cf86e06f4ba7af3f49f946a3e5\";a:4:{s:10:\"expiration\";i:1593870412;s:2:\"ip\";s:11:\"49.35.36.42\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Linux; Android 7.1.2; Redmi Y1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593697612;}s:64:\"d42dc737d268f08b4a7adc509145e79892bd86ee07a45afc2ea662acb8eee7ef\";a:4:{s:10:\"expiration\";i:1593870414;s:2:\"ip\";s:12:\"106.77.22.86\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; CPH1969) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Mobile Safari/537.36\";s:5:\"login\";i:1593697614;}s:64:\"21c7ab8070da3efeacacf291c0f987d033089ab0304a520432bc76dbd5bf68dc\";a:4:{s:10:\"expiration\";i:1593872488;s:2:\"ip\";s:14:\"106.210.142.77\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593699688;}s:64:\"42fd3beb8634e8063b930a613e22ae1d366884bad64e3553c3c88a3c93895d70\";a:4:{s:10:\"expiration\";i:1593880484;s:2:\"ip\";s:14:\"106.210.142.77\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593707684;}s:64:\"c4d27ca636a5a3bd7ed2faad9251a78a1af92352768183e63b76d93ff231f335\";a:4:{s:10:\"expiration\";i:1593927161;s:2:\"ip\";s:14:\"106.220.220.83\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593754361;}s:64:\"47a3b1e9681d003dc386b2a109ad7bc4165c5e8ccdf6d677fff0d3ca8812b5f6\";a:4:{s:10:\"expiration\";i:1593928280;s:2:\"ip\";s:15:\"106.220.128.144\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593755480;}s:64:\"8c8a92eb69c80e74544d5eda66e0db2c7b8d5ba09949af44f6ff6d1520e66f38\";a:4:{s:10:\"expiration\";i:1593928287;s:2:\"ip\";s:15:\"106.220.128.144\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Linux; Android 9; RMX1911) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.101 Mobile Safari/537.36\";s:5:\"login\";i:1593755487;}}'),
(1857, 86, 'displaypicture', 'a:1:{s:4:\"full\";s:57:\"https://www.nutaniti.com/wp-content/uploads/2020/06/2.jpg\";}'),
(1858, 86, 'simple_local_avatar', 'a:1:{s:4:\"full\";s:57:\"https://www.nutaniti.com/wp-content/uploads/2020/06/2.jpg\";}'),
(2330, 80, 'community-events-location', 'a:1:{s:2:\"ip\";s:13:\"106.210.186.0\";}'),
(1862, 81, 'displaypicture', 'a:1:{s:4:\"full\";s:57:\"https://www.nutaniti.com/wp-content/uploads/2020/06/7.jpg\";}'),
(1863, 81, 'simple_local_avatar', 'a:1:{s:4:\"full\";s:57:\"https://www.nutaniti.com/wp-content/uploads/2020/06/7.jpg\";}'),
(1865, 131, 'nickname', 'atadavi'),
(1866, 131, 'first_name', 'Aasif'),
(1867, 131, 'last_name', ''),
(1868, 131, 'description', ''),
(1869, 131, 'rich_editing', 'true');
INSERT INTO `iti_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1870, 131, 'syntax_highlighting', 'true'),
(1871, 131, 'comment_shortcuts', 'false'),
(1872, 131, 'admin_color', 'fresh'),
(1873, 131, 'use_ssl', '0'),
(1874, 131, 'show_admin_bar_front', 'true'),
(1875, 131, 'locale', ''),
(1876, 131, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1877, 131, 'iti_user_level', '0'),
(1878, 131, 'dismissed_wp_pointers', 'wp496_privacy'),
(1879, 132, 'nickname', 'pchaudhari'),
(1880, 132, 'first_name', 'Paresh'),
(1881, 132, 'last_name', ''),
(1882, 132, 'description', ''),
(1883, 132, 'rich_editing', 'true'),
(1884, 132, 'syntax_highlighting', 'true'),
(1885, 132, 'comment_shortcuts', 'false'),
(1886, 132, 'admin_color', 'fresh'),
(1887, 132, 'use_ssl', '0'),
(1888, 132, 'show_admin_bar_front', 'true'),
(1889, 132, 'locale', ''),
(1890, 132, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1891, 132, 'iti_user_level', '0'),
(1892, 132, 'dismissed_wp_pointers', 'wp496_privacy'),
(1893, 133, 'nickname', 'nmahajan01'),
(1894, 133, 'first_name', 'Nikhil'),
(1895, 133, 'last_name', ''),
(1896, 133, 'description', ''),
(1897, 133, 'rich_editing', 'true'),
(1898, 133, 'syntax_highlighting', 'true'),
(1899, 133, 'comment_shortcuts', 'false'),
(1900, 133, 'admin_color', 'fresh'),
(1901, 133, 'use_ssl', '0'),
(1902, 133, 'show_admin_bar_front', 'true'),
(1903, 133, 'locale', ''),
(1904, 133, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1905, 133, 'iti_user_level', '0'),
(1906, 133, 'dismissed_wp_pointers', 'wp496_privacy'),
(1907, 134, 'nickname', 'vpachapole'),
(1908, 134, 'first_name', 'Vishal'),
(1909, 134, 'last_name', ''),
(1910, 134, 'description', ''),
(1911, 134, 'rich_editing', 'true'),
(1912, 134, 'syntax_highlighting', 'true'),
(1913, 134, 'comment_shortcuts', 'false'),
(1914, 134, 'admin_color', 'fresh'),
(1915, 134, 'use_ssl', '0'),
(1916, 134, 'show_admin_bar_front', 'true'),
(1917, 134, 'locale', ''),
(1918, 134, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1919, 134, 'iti_user_level', '0'),
(1920, 134, 'dismissed_wp_pointers', 'wp496_privacy'),
(1921, 135, 'nickname', 'ngayakwad'),
(1922, 135, 'first_name', 'Nikhil'),
(1923, 135, 'last_name', ''),
(1924, 135, 'description', ''),
(1925, 135, 'rich_editing', 'true'),
(1926, 135, 'syntax_highlighting', 'true'),
(1927, 135, 'comment_shortcuts', 'false'),
(1928, 135, 'admin_color', 'fresh'),
(1929, 135, 'use_ssl', '0'),
(1930, 135, 'show_admin_bar_front', 'true'),
(1931, 135, 'locale', ''),
(1932, 135, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1933, 135, 'iti_user_level', '0'),
(1934, 135, 'dismissed_wp_pointers', 'wp496_privacy'),
(1935, 136, 'nickname', 'hgayakwad'),
(1936, 136, 'first_name', 'Hemant'),
(1937, 136, 'last_name', ''),
(1938, 136, 'description', ''),
(1939, 136, 'rich_editing', 'true'),
(1940, 136, 'syntax_highlighting', 'true'),
(1941, 136, 'comment_shortcuts', 'false'),
(1942, 136, 'admin_color', 'fresh'),
(1943, 136, 'use_ssl', '0'),
(1944, 136, 'show_admin_bar_front', 'true'),
(1945, 136, 'locale', ''),
(1946, 136, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1947, 136, 'iti_user_level', '0'),
(1948, 136, 'dismissed_wp_pointers', 'wp496_privacy'),
(1949, 137, 'nickname', 'hsapkale'),
(1950, 137, 'first_name', 'Harshal'),
(1951, 137, 'last_name', ''),
(1952, 137, 'description', ''),
(1953, 137, 'rich_editing', 'true'),
(1954, 137, 'syntax_highlighting', 'true'),
(1955, 137, 'comment_shortcuts', 'false'),
(1956, 137, 'admin_color', 'fresh'),
(1957, 137, 'use_ssl', '0'),
(1958, 137, 'show_admin_bar_front', 'true'),
(1959, 137, 'locale', ''),
(1960, 137, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1961, 137, 'iti_user_level', '0'),
(1962, 137, 'dismissed_wp_pointers', 'wp496_privacy'),
(1963, 138, 'nickname', 'mnemade'),
(1964, 138, 'first_name', 'Bharat'),
(1965, 138, 'last_name', ''),
(1966, 138, 'description', ''),
(1967, 138, 'rich_editing', 'true'),
(1968, 138, 'syntax_highlighting', 'true'),
(1969, 138, 'comment_shortcuts', 'false'),
(1970, 138, 'admin_color', 'fresh'),
(1971, 138, 'use_ssl', '0'),
(1972, 138, 'show_admin_bar_front', 'true'),
(1973, 138, 'locale', ''),
(1974, 138, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1975, 138, 'iti_user_level', '0'),
(1976, 138, 'dismissed_wp_pointers', 'wp496_privacy'),
(1977, 139, 'nickname', 'jbadhe'),
(1978, 139, 'first_name', 'Jayesh'),
(1979, 139, 'last_name', ''),
(1980, 139, 'description', ''),
(1981, 139, 'rich_editing', 'true'),
(1982, 139, 'syntax_highlighting', 'true'),
(1983, 139, 'comment_shortcuts', 'false'),
(1984, 139, 'admin_color', 'fresh'),
(1985, 139, 'use_ssl', '0'),
(1986, 139, 'show_admin_bar_front', 'true'),
(1987, 139, 'locale', ''),
(1988, 139, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(1989, 139, 'iti_user_level', '0'),
(1990, 139, 'dismissed_wp_pointers', 'wp496_privacy'),
(1991, 140, 'nickname', 'mmahajan'),
(1992, 140, 'first_name', 'Mayur'),
(1993, 140, 'last_name', ''),
(1994, 140, 'description', ''),
(1995, 140, 'rich_editing', 'true'),
(1996, 140, 'syntax_highlighting', 'true'),
(1997, 140, 'comment_shortcuts', 'false'),
(1998, 140, 'admin_color', 'fresh'),
(1999, 140, 'use_ssl', '0'),
(2000, 140, 'show_admin_bar_front', 'true'),
(2001, 140, 'locale', ''),
(2002, 140, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2003, 140, 'iti_user_level', '0'),
(2004, 140, 'dismissed_wp_pointers', 'wp496_privacy'),
(2005, 141, 'nickname', 'ashaikh01'),
(2006, 141, 'first_name', 'Shaikh Abutalha'),
(2007, 141, 'last_name', ''),
(2008, 141, 'description', ''),
(2009, 141, 'rich_editing', 'true'),
(2010, 141, 'syntax_highlighting', 'true'),
(2011, 141, 'comment_shortcuts', 'false'),
(2012, 141, 'admin_color', 'fresh'),
(2013, 141, 'use_ssl', '0'),
(2014, 141, 'show_admin_bar_front', 'true'),
(2015, 141, 'locale', ''),
(2016, 141, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2017, 141, 'iti_user_level', '0'),
(2018, 141, 'dismissed_wp_pointers', 'wp496_privacy'),
(2019, 142, 'nickname', 'hnemade'),
(2020, 142, 'first_name', 'Hemant'),
(2021, 142, 'last_name', ''),
(2022, 142, 'description', ''),
(2023, 142, 'rich_editing', 'true'),
(2024, 142, 'syntax_highlighting', 'true'),
(2025, 142, 'comment_shortcuts', 'false'),
(2026, 142, 'admin_color', 'fresh'),
(2027, 142, 'use_ssl', '0'),
(2028, 142, 'show_admin_bar_front', 'true'),
(2029, 142, 'locale', ''),
(2030, 142, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2031, 142, 'iti_user_level', '0'),
(2032, 142, 'dismissed_wp_pointers', 'wp496_privacy'),
(2033, 143, 'nickname', 'cchavhan'),
(2034, 143, 'first_name', 'Chandrasing'),
(2035, 143, 'last_name', ''),
(2036, 143, 'description', ''),
(2037, 143, 'rich_editing', 'true'),
(2038, 143, 'syntax_highlighting', 'true'),
(2039, 143, 'comment_shortcuts', 'false'),
(2040, 143, 'admin_color', 'fresh'),
(2041, 143, 'use_ssl', '0'),
(2042, 143, 'show_admin_bar_front', 'true'),
(2043, 143, 'locale', ''),
(2044, 143, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2045, 143, 'iti_user_level', '0'),
(2046, 143, 'dismissed_wp_pointers', 'wp496_privacy'),
(2047, 144, 'nickname', 'pjoshi'),
(2048, 144, 'first_name', 'Pranay'),
(2049, 144, 'last_name', ''),
(2050, 144, 'description', ''),
(2051, 144, 'rich_editing', 'true'),
(2052, 144, 'syntax_highlighting', 'true'),
(2053, 144, 'comment_shortcuts', 'false'),
(2054, 144, 'admin_color', 'fresh'),
(2055, 144, 'use_ssl', '0'),
(2056, 144, 'show_admin_bar_front', 'true'),
(2057, 144, 'locale', ''),
(2058, 144, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2059, 144, 'iti_user_level', '0'),
(2060, 144, 'dismissed_wp_pointers', 'wp496_privacy'),
(2061, 145, 'nickname', 'rkolhe'),
(2062, 145, 'first_name', 'Roshan'),
(2063, 145, 'last_name', ''),
(2064, 145, 'description', ''),
(2065, 145, 'rich_editing', 'true'),
(2066, 145, 'syntax_highlighting', 'true'),
(2067, 145, 'comment_shortcuts', 'false'),
(2068, 145, 'admin_color', 'fresh'),
(2069, 145, 'use_ssl', '0'),
(2070, 145, 'show_admin_bar_front', 'true'),
(2071, 145, 'locale', ''),
(2072, 145, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2073, 145, 'iti_user_level', '0'),
(2074, 145, 'dismissed_wp_pointers', 'wp496_privacy'),
(2075, 146, 'nickname', 'maadhav'),
(2076, 146, 'first_name', 'Mohan'),
(2077, 146, 'last_name', ''),
(2078, 146, 'description', ''),
(2079, 146, 'rich_editing', 'true'),
(2080, 146, 'syntax_highlighting', 'true'),
(2081, 146, 'comment_shortcuts', 'false'),
(2082, 146, 'admin_color', 'fresh'),
(2083, 146, 'use_ssl', '0'),
(2084, 146, 'show_admin_bar_front', 'true'),
(2085, 146, 'locale', ''),
(2086, 146, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2087, 146, 'iti_user_level', '0'),
(2088, 146, 'dismissed_wp_pointers', 'wp496_privacy'),
(2089, 147, 'nickname', 'dchaudhari01'),
(2090, 147, 'first_name', 'Dipak'),
(2091, 147, 'last_name', ''),
(2092, 147, 'description', ''),
(2093, 147, 'rich_editing', 'true'),
(2094, 147, 'syntax_highlighting', 'true'),
(2095, 147, 'comment_shortcuts', 'false'),
(2096, 147, 'admin_color', 'fresh'),
(2097, 147, 'use_ssl', '0'),
(2098, 147, 'show_admin_bar_front', 'true'),
(2099, 147, 'locale', ''),
(2100, 147, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2101, 147, 'iti_user_level', '0'),
(2102, 147, 'dismissed_wp_pointers', 'wp496_privacy'),
(2103, 148, 'nickname', 'mtayade'),
(2104, 148, 'first_name', 'Manish'),
(2105, 148, 'last_name', ''),
(2106, 148, 'description', ''),
(2107, 148, 'rich_editing', 'true'),
(2108, 148, 'syntax_highlighting', 'true'),
(2109, 148, 'comment_shortcuts', 'false'),
(2110, 148, 'admin_color', 'fresh'),
(2111, 148, 'use_ssl', '0'),
(2112, 148, 'show_admin_bar_front', 'true'),
(2113, 148, 'locale', ''),
(2114, 148, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2115, 148, 'iti_user_level', '0'),
(2116, 148, 'dismissed_wp_pointers', 'wp496_privacy'),
(2117, 149, 'nickname', 'bbonde'),
(2118, 149, 'first_name', 'Bhairav'),
(2119, 149, 'last_name', ''),
(2120, 149, 'description', ''),
(2121, 149, 'rich_editing', 'true'),
(2122, 149, 'syntax_highlighting', 'true'),
(2123, 149, 'comment_shortcuts', 'false'),
(2124, 149, 'admin_color', 'fresh'),
(2125, 149, 'use_ssl', '0'),
(2126, 149, 'show_admin_bar_front', 'true'),
(2127, 149, 'locale', ''),
(2128, 149, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2129, 149, 'iti_user_level', '0'),
(2130, 149, 'dismissed_wp_pointers', 'wp496_privacy'),
(2131, 150, 'nickname', 'gchaudhari'),
(2132, 150, 'first_name', 'Gaurav'),
(2133, 150, 'last_name', ''),
(2134, 150, 'description', ''),
(2135, 150, 'rich_editing', 'true'),
(2136, 150, 'syntax_highlighting', 'true'),
(2137, 150, 'comment_shortcuts', 'false'),
(2138, 150, 'admin_color', 'fresh'),
(2139, 150, 'use_ssl', '0'),
(2140, 150, 'show_admin_bar_front', 'true'),
(2141, 150, 'locale', ''),
(2142, 150, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2143, 150, 'iti_user_level', '0'),
(2144, 150, 'dismissed_wp_pointers', 'wp496_privacy'),
(2145, 151, 'nickname', 'nbaig'),
(2146, 151, 'first_name', 'Noman Baig'),
(2147, 151, 'last_name', ''),
(2148, 151, 'description', ''),
(2149, 151, 'rich_editing', 'true'),
(2150, 151, 'syntax_highlighting', 'true'),
(2151, 151, 'comment_shortcuts', 'false'),
(2152, 151, 'admin_color', 'fresh'),
(2153, 151, 'use_ssl', '0'),
(2154, 151, 'show_admin_bar_front', 'true'),
(2155, 151, 'locale', ''),
(2156, 151, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2157, 151, 'iti_user_level', '0'),
(2158, 151, 'dismissed_wp_pointers', 'wp496_privacy'),
(2159, 152, 'nickname', 'jkolhe'),
(2160, 152, 'first_name', 'Jayesh'),
(2161, 152, 'last_name', ''),
(2162, 152, 'description', ''),
(2163, 152, 'rich_editing', 'true'),
(2164, 152, 'syntax_highlighting', 'true'),
(2165, 152, 'comment_shortcuts', 'false'),
(2166, 152, 'admin_color', 'fresh'),
(2167, 152, 'use_ssl', '0'),
(2168, 152, 'show_admin_bar_front', 'true'),
(2169, 152, 'locale', ''),
(2170, 152, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2171, 152, 'iti_user_level', '0'),
(2172, 152, 'dismissed_wp_pointers', 'wp496_privacy'),
(2173, 153, 'nickname', 'rharankar'),
(2174, 153, 'first_name', 'Rohit'),
(2175, 153, 'last_name', ''),
(2176, 153, 'description', ''),
(2177, 153, 'rich_editing', 'true'),
(2178, 153, 'syntax_highlighting', 'true'),
(2179, 153, 'comment_shortcuts', 'false'),
(2180, 153, 'admin_color', 'fresh'),
(2181, 153, 'use_ssl', '0'),
(2182, 153, 'show_admin_bar_front', 'true'),
(2183, 153, 'locale', ''),
(2184, 153, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2185, 153, 'iti_user_level', '0'),
(2186, 153, 'dismissed_wp_pointers', 'wp496_privacy'),
(2187, 154, 'nickname', 'ddhangar'),
(2188, 154, 'first_name', 'Durgesh'),
(2189, 154, 'last_name', ''),
(2190, 154, 'description', ''),
(2191, 154, 'rich_editing', 'true'),
(2192, 154, 'syntax_highlighting', 'true'),
(2193, 154, 'comment_shortcuts', 'false'),
(2194, 154, 'admin_color', 'fresh'),
(2195, 154, 'use_ssl', '0'),
(2196, 154, 'show_admin_bar_front', 'true'),
(2197, 154, 'locale', ''),
(2198, 154, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2199, 154, 'iti_user_level', '0'),
(2200, 154, 'dismissed_wp_pointers', 'wp496_privacy'),
(2201, 155, 'nickname', 'spatil01'),
(2202, 155, 'first_name', 'Satish'),
(2203, 155, 'last_name', ''),
(2204, 155, 'description', ''),
(2205, 155, 'rich_editing', 'true'),
(2206, 155, 'syntax_highlighting', 'true'),
(2207, 155, 'comment_shortcuts', 'false'),
(2208, 155, 'admin_color', 'fresh'),
(2209, 155, 'use_ssl', '0'),
(2210, 155, 'show_admin_bar_front', 'true'),
(2211, 155, 'locale', ''),
(2212, 155, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2213, 155, 'iti_user_level', '0'),
(2214, 155, 'dismissed_wp_pointers', 'wp496_privacy'),
(2215, 156, 'nickname', 'vgosavi'),
(2216, 156, 'first_name', 'Vinaygir'),
(2217, 156, 'last_name', ''),
(2218, 156, 'description', ''),
(2219, 156, 'rich_editing', 'true'),
(2220, 156, 'syntax_highlighting', 'true'),
(2221, 156, 'comment_shortcuts', 'false'),
(2222, 156, 'admin_color', 'fresh'),
(2223, 156, 'use_ssl', '0'),
(2224, 156, 'show_admin_bar_front', 'true'),
(2225, 156, 'locale', ''),
(2226, 156, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2227, 156, 'iti_user_level', '0'),
(2228, 156, 'dismissed_wp_pointers', 'wp496_privacy'),
(2229, 157, 'nickname', 'kmahajan'),
(2230, 157, 'first_name', 'Kuldip'),
(2231, 157, 'last_name', ''),
(2232, 157, 'description', ''),
(2233, 157, 'rich_editing', 'true'),
(2234, 157, 'syntax_highlighting', 'true'),
(2235, 157, 'comment_shortcuts', 'false'),
(2236, 157, 'admin_color', 'fresh'),
(2237, 157, 'use_ssl', '0'),
(2238, 157, 'show_admin_bar_front', 'true'),
(2239, 157, 'locale', ''),
(2240, 157, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2241, 157, 'iti_user_level', '0'),
(2242, 157, 'dismissed_wp_pointers', 'wp496_privacy'),
(2243, 158, 'nickname', 'gpatil'),
(2244, 158, 'first_name', 'Ganesh'),
(2245, 158, 'last_name', ''),
(2246, 158, 'description', ''),
(2247, 158, 'rich_editing', 'true'),
(2248, 158, 'syntax_highlighting', 'true'),
(2249, 158, 'comment_shortcuts', 'false'),
(2250, 158, 'admin_color', 'fresh'),
(2251, 158, 'use_ssl', '0'),
(2252, 158, 'show_admin_bar_front', 'true'),
(2253, 158, 'locale', ''),
(2254, 158, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2255, 158, 'iti_user_level', '0'),
(2256, 158, 'dismissed_wp_pointers', 'wp496_privacy'),
(2257, 159, 'nickname', 'vbonde'),
(2258, 159, 'first_name', 'Vivek'),
(2259, 159, 'last_name', ''),
(2260, 159, 'description', ''),
(2261, 159, 'rich_editing', 'true'),
(2262, 159, 'syntax_highlighting', 'true'),
(2263, 159, 'comment_shortcuts', 'false'),
(2264, 159, 'admin_color', 'fresh'),
(2265, 159, 'use_ssl', '0'),
(2266, 159, 'show_admin_bar_front', 'true'),
(2267, 159, 'locale', ''),
(2268, 159, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2269, 159, 'iti_user_level', '0'),
(2270, 159, 'dismissed_wp_pointers', 'wp496_privacy'),
(2271, 160, 'nickname', 'mwarke'),
(2272, 160, 'first_name', 'Mohit'),
(2273, 160, 'last_name', ''),
(2274, 160, 'description', ''),
(2275, 160, 'rich_editing', 'true'),
(2276, 160, 'syntax_highlighting', 'true'),
(2277, 160, 'comment_shortcuts', 'false'),
(2278, 160, 'admin_color', 'fresh'),
(2279, 160, 'use_ssl', '0'),
(2280, 160, 'show_admin_bar_front', 'true'),
(2281, 160, 'locale', ''),
(2282, 160, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2283, 160, 'iti_user_level', '0'),
(2284, 160, 'dismissed_wp_pointers', 'wp496_privacy'),
(2285, 161, 'nickname', 'tnemade01'),
(2286, 161, 'first_name', 'Thekuchand'),
(2287, 161, 'last_name', ''),
(2288, 161, 'description', ''),
(2289, 161, 'rich_editing', 'true'),
(2290, 161, 'syntax_highlighting', 'true'),
(2291, 161, 'comment_shortcuts', 'false'),
(2292, 161, 'admin_color', 'fresh'),
(2293, 161, 'use_ssl', '0'),
(2294, 161, 'show_admin_bar_front', 'true'),
(2295, 161, 'locale', ''),
(2296, 161, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2297, 161, 'iti_user_level', '0'),
(2298, 161, 'dismissed_wp_pointers', 'wp496_privacy'),
(2299, 162, 'nickname', 'vchaudhari'),
(2300, 162, 'first_name', 'Vipul'),
(2301, 162, 'last_name', ''),
(2302, 162, 'description', ''),
(2303, 162, 'rich_editing', 'true'),
(2304, 162, 'syntax_highlighting', 'true'),
(2305, 162, 'comment_shortcuts', 'false'),
(2306, 162, 'admin_color', 'fresh'),
(2307, 162, 'use_ssl', '0'),
(2308, 162, 'show_admin_bar_front', 'true'),
(2309, 162, 'locale', ''),
(2310, 162, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2311, 162, 'iti_user_level', '0'),
(2312, 162, 'dismissed_wp_pointers', 'wp496_privacy'),
(2313, 163, 'nickname', 'gnemade'),
(2314, 163, 'first_name', 'Gunawant'),
(2315, 163, 'last_name', ''),
(2316, 163, 'description', ''),
(2317, 163, 'rich_editing', 'true'),
(2318, 163, 'syntax_highlighting', 'true'),
(2319, 163, 'comment_shortcuts', 'false'),
(2320, 163, 'admin_color', 'fresh'),
(2321, 163, 'use_ssl', '0'),
(2322, 163, 'show_admin_bar_front', 'true'),
(2323, 163, 'locale', ''),
(2324, 163, 'iti_capabilities', 'a:1:{s:7:\"student\";b:1;}'),
(2325, 163, 'iti_user_level', '0'),
(2326, 163, 'dismissed_wp_pointers', 'wp496_privacy'),
(2327, 1, 'wppb_pms_cross_promo_dismiss_notification', 'true'),
(2354, 83, 'session_tokens', 'a:2:{s:64:\"f1976e9c7c7ddd99bd8c93c5c0816b610bdf10d323e4e17bdf4dcf09447de269\";a:4:{s:10:\"expiration\";i:1593919509;s:2:\"ip\";s:14:\"157.33.189.170\";s:2:\"ua\";s:196:\"Mozilla/5.0 (Linux; U; Android 8.1.0; en-in; Redmi 5 Build/OPM1.171019.026) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.2.6-g\";s:5:\"login\";i:1593746709;}s:64:\"c0baf04bd229dedb0ca238736d93a9c5f0fc6e1fb436a9c1351cc9dc6da91541\";a:4:{s:10:\"expiration\";i:1593963052;s:2:\"ip\";s:12:\"49.35.40.170\";s:2:\"ua\";s:124:\"Mozilla/5.0 (Linux; Android 8.1.0; Redmi 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36\";s:5:\"login\";i:1593790252;}}'),
(2342, 100, 'session_tokens', 'a:1:{s:64:\"e0c9d1f84abe94e8bd4551d3d51eb392eff1a20eff071bc21683f657a6caa532\";a:4:{s:10:\"expiration\";i:1592810099;s:2:\"ip\";s:14:\"106.193.245.63\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Linux; Android 6.0.1; Redmi 3S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36\";s:5:\"login\";i:1592637299;}}'),
(2349, 85, 'session_tokens', 'a:2:{s:64:\"857ff6ec254a07c215ad12d5b198ed85b90d31c8b6c9a629e09547578e004384\";a:4:{s:10:\"expiration\";i:1593489834;s:2:\"ip\";s:15:\"117.200.173.102\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0\";s:5:\"login\";i:1593317034;}s:64:\"37b775b7c437793b1c84271c12d5ffb5e509e13235cb676831923434f78119b3\";a:4:{s:10:\"expiration\";i:1593574494;s:2:\"ip\";s:12:\"59.95.114.89\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0\";s:5:\"login\";i:1593401694;}}'),
(2352, 81, 'iti_dashboard_quick_press_last_post_id', '487'),
(2343, 80, 'displaypicture', 'a:1:{s:4:\"full\";s:57:\"https://www.nutaniti.com/wp-content/uploads/2020/06/9.jpg\";}'),
(2344, 80, 'simple_local_avatar', 'a:1:{s:4:\"full\";s:57:\"https://www.nutaniti.com/wp-content/uploads/2020/06/9.jpg\";}');

-- --------------------------------------------------------

--
-- Table structure for table `iti_users`
--

CREATE TABLE `iti_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_users`
--

INSERT INTO `iti_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'nutaniti', '$P$BkuFznj96Gv3/1tqVp2E9RFPOqzl8I1', 'nutaniti', 'rahulbhangale26@gmail.com', '', '2019-02-06 17:19:41', '', 0, 'nutaniti'),
(52, 'vkbhangale', '$P$B6GrIwn7QUcyiTfTTS3j7cJbKpuC930', 'vkbhangale', 'vkbhangale3@gmail.com', '', '2020-06-15 16:11:26', '', 0, 'Virendrakumar'),
(80, 'schaudhari', '$P$BJiH2xoOZwdxprWMIJIJLxGPW3GokW.', 'schaudhari', 'csandip527@gmail.com', '', '2020-06-16 17:00:53', '', 0, 'Sandip'),
(81, 'shole', '$P$BkNQr2tDZW29iDA57qDXjVT4TIEZFl1', 'shole', 'sarajughole@gmail.com', '', '2020-06-16 17:07:29', '', 0, 'Saraju'),
(82, 'ringale', '$P$B9OHu/bJSe/.FllJWrgA5xQYlBYiil0', 'ringale', 'rajeshingale1974@gmail.com', '', '2020-06-16 17:09:51', '', 0, 'Rajesh'),
(83, 'rmahajan', '$P$BMvan56X1TBqB7KHEbDLJz7e2Ud9fR.', 'rmahajan', 'rahulmahajan423@gmail.com', '', '2020-06-16 17:11:35', '', 0, 'Rahul'),
(84, 'lbhalerao', '$P$Bh2jSLKCVoWnZcxiBAB2/4V5NRnR3X0', 'lbhalerao', 'lbhalerao@wpandro.lcl', '', '2020-06-16 17:14:35', '1592327676:$P$BWNlAljU0a4wXlp3.R4Oqz01yRfKGT/', 0, 'Lakhan'),
(85, 'vpatil', '$P$BanCmj5mVSqdPiIRGbj60mX0/yLD8j.', 'vpatil', 'pvinod071@gmail.com', '', '2020-06-16 17:15:22', '', 0, 'Vinod'),
(86, 'vmahajan', '$P$BEICajlOI7Ty1ZZQMo6Y7DWphByqbU.', 'vmahajan', 'mahajanv313@gmail.com', '', '2020-06-16 17:17:07', '', 0, 'Vaibhav'),
(87, 'pbhangale', '$P$B0OW31YlyPri/pHpR7Du8H/Olc7Gmm0', 'pbhangale', 'pbhangale@wpandro.lcl', '', '2020-06-16 17:17:35', '1592327860:$P$Blac86KyYMuUqz326FpOEWgNdA3ZO//', 0, 'Pushpak'),
(88, 'ychaudhari', '$P$B/eco7aPzhA39Qf3k/cQpatoexRq4X.', 'ychaudhari', 'yogeshpc1042@gmail.com', '', '2020-06-16 17:18:54', '', 0, 'Yogesh'),
(89, 'dbhangale', '$P$B2JNP2shAx4sUFV14Jq0W.3i5YwxF3.', 'dbhangale', 'dbhangale@wpandro.lcl', '', '2020-06-16 17:19:46', '1592327987:$P$BVYA8G6enXWktwTy5kuKripFGud.qB0', 0, 'Dhiraj'),
(90, 'rbharambe', '$P$By3ApdOrQH72Gkx4M/sIs5GL1bxBui/', 'rbharambe', 'bharamberamesh29@gmail.com', '', '2020-06-16 17:22:04', '', 0, 'Ramesh'),
(91, 'akaple', '$P$BAcG31ptD8lACb8EqAXudQxBf22ZFx/', 'akaple', 'akaple@wpandro.lcl', '', '2020-06-16 17:23:36', '1592328217:$P$BWPazRkdtZuxS4B7ohiUwlbmLTfMDC0', 0, 'Aakash'),
(92, 'amahajan', '$P$B2ubL893K68LqTh6bWvHkzg2gEOUDB0', 'amahajan', 'amahajan@wpandro.lcl', '', '2020-06-16 17:23:38', '', 0, 'Arun'),
(93, 'rwaykole', '$P$BLNX1/FpwBofRnDudps6/drjjgEnia/', 'rwaykole', 'rwaykole@wpandro.lcl', '', '2020-06-16 17:27:44', '1592328467:$P$BaEFaTsZ7ZgiL2bXL2afzprmuqWXW.1', 0, 'Rajeshkumar'),
(94, 'dchaudhari', '$P$Bimg4T947GoJsixJHGTgIF8utLyRfK.', 'dchaudhari', 'dchaudhari@wpandro.lcl', '', '2020-06-16 17:29:11', '1592328552:$P$BoNm1nxHAJS8xwbVNmKIAHyX5JoOWc/', 0, 'Devendra'),
(95, 'vborole', '$P$B8PibnzCz/p1EGpVTZJI36p1gXFtLL0', 'vborole', 'vborole@wpandro.lcl', '', '2020-06-16 17:30:59', '1592328660:$P$B6.VPNOW.zIQHUaMd3F8cnYMF0IC6Z1', 0, 'Vaibhav'),
(96, 'kchaudhari', '$P$BUHiasYySyRdGt1JAcEyij5i9fOXYs.', 'kchaudhari', 'kchaudhari@wpandro.lcl', '', '2020-06-16 17:33:57', '1592328837:$P$Bxr.92BG3zZheZRaIBSzlu5TDTSV.Z0', 0, 'Khilchand'),
(97, 'vapatil', '$P$BgKrF.nkl3pSAdmHUGkjWLnQqMhH/J.', 'vapatil', 'vpatil01@wpandro.lcl', '', '2020-06-16 17:34:29', '', 0, 'Vaibhav'),
(128, 'sshaikh', '$P$BgYuhgPc7D.qXNCoKhrSa01bVjjsmA0', 'sshaikh', 'sshaikh@wpandro.lcl', '', '2020-06-16 18:27:10', '1592332031:$P$BG/dbvMuSq0DncPKGi0isM9pSbl2h1/', 0, 'Shaikh Moin'),
(98, 'pmahajan', '$P$BR9pTBM7NeuSZrugs1EQYTpVj8on0g/', 'pmahajan', 'pmahajan@wpandro.lcl', '', '2020-06-16 17:38:46', '1592329127:$P$BZfdwevbZPfB6iDN7tAN4nGA7/VXcK1', 0, 'Purvesh'),
(99, 'dnemade', '$P$BxNF5IKsE8Td4gX4z/o1S4PjL.yWZw0', 'dnemade', 'dnemade@wpandro.lcl', '', '2020-06-16 17:42:07', '1592329329:$P$B3qC7U69PsCgWUPhaX7174oOtI1uK01', 0, 'Devesh'),
(100, 'kzope', '$P$B3xkISGTs9gdpAVitOOj7zuau2urlk0', 'kzope', 'kzope@wpandro.lcl', '', '2020-06-16 17:42:44', '1592329368:$P$BeDnSg7wxAgUh9E63aLbpXv151ctHc1', 0, 'Kunal'),
(101, 'hkoli', '$P$BVpFUk3zMX.EIoUJdnmNPIDkBhIIbj/', 'hkoli', 'hkoli@wpandro.lcl', '', '2020-06-16 17:44:39', '1592329480:$P$B7PxaLx6N.L7.UYtKxj9QGQQ4CO7oq.', 0, 'Hemant'),
(102, 'vmalvekar', '$P$Bmf/g3ObK0ItbEEx.lIe0PV2mlav/r0', 'vmalvekar', 'vmalvekar@wpandro.lcl', '', '2020-06-16 17:46:22', '1592329583:$P$Blka2QBtZfuPi1Oyx8RDqMftHKOps71', 0, 'Vishal'),
(103, 'cnemade', '$P$BPAZuDU7WLYaHRbmg.1oGSbfUXncqq/', 'cnemade', 'cnemade@wpandro.lcl', '', '2020-06-16 17:49:07', '1592329748:$P$BonpQKuKwhSEeTgTo08P16WvTyip0y0', 0, 'Chinmay'),
(104, 'dtayade', '$P$BUyRJ18m75lfm84HVWma9n1kQa6nWc0', 'dtayade', 'dtayade@wpandro.lcl', '', '2020-06-16 17:50:20', '1592329820:$P$BpYyUpSrU69QOTf6M30bKEG1Z0LR1a/', 0, 'Devayash'),
(105, 'cpatil', '$P$Bf100jZpS5lRpYa8TipLe/aoPPzypI0', 'cpatil', 'cpatil@wpandro.lcl', '', '2020-06-16 17:54:25', '1592330066:$P$BRcBMEHTAenCQQiDsTA2Go5YZJHhLU1', 0, 'Chetan'),
(106, 'achoudhari', '$P$BCo2pgvY2lQiBs2IZPCRZQ20IlQQbi/', 'achoudhari', 'achaudhari@wpandro.lcl', '', '2020-06-16 17:55:51', '1592330153:$P$BcRv3uJ9qcf3RmBOOKUkqX0F/9PsLw1', 0, 'Anant'),
(107, 'tnemade', '$P$BWHDJcpagYtb8VtG26M7I3gruko37G/', 'tnemade', 'tnemade@wpandro.lcl', '', '2020-06-16 17:56:22', '1592330183:$P$BNlo3nPJUwnLnWOqx2dIWmqU8u0oab.', 0, 'Tekchand'),
(108, 'ypatil', '$P$Bcq3TgophdLyNsi2y1yGqTrdyGe4ha0', 'ypatil', 'ypatil@wpandro.lcl', '', '2020-06-16 17:57:51', '1592330272:$P$Bvq.zjEWa2VHQ9pSq1intWmQl87iuQ1', 0, 'Yugant'),
(109, 'skolambe', '$P$B58JHuh7ZcBPo5wPvhodLwcBCZuvCq1', 'skolambe', 'skolambe@wpandro.lcl', '', '2020-06-16 17:59:09', '1592330350:$P$BxIWnVlNiEuDSdO3AfAziCYvh4qURS1', 0, 'Suraj'),
(110, 'kpatil', '$P$Bjm1nxlKIN.q0jNhnzFGaF0Cfp/.ib/', 'kpatil', 'kpatil@wpandro.lcl', '', '2020-06-16 17:59:54', '1592330394:$P$BdTU4aaC.N/OD/6SWGBavxq51KaU3B/', 0, 'Kalpesh'),
(111, 'stadavi', '$P$B/my5vgLdCWGTzN65M7gRgWXLPpMvU.', 'stadavi', 'stadavi@wpandro.lcl', '', '2020-06-16 18:01:36', '1592330496:$P$B7byS6F8Bo30zlshF5eLwqcnIHyjWl.', 0, 'Sahil'),
(112, 'abonde', '$P$Bqi2yE3tK8x4ecxJgiHxOmK6nbSV1j0', 'abonde', 'abonde@wpandro.lcl', '', '2020-06-16 18:01:40', '1592330500:$P$BEjtjqhZ72BFY//hdUODQfhXjgQdny0', 0, 'Ashish'),
(113, 'tpatil', '$P$BZlEIRqr4jF9/lNbZZuPnBqVP99Rag1', 'tpatil', 'tpatil@wpandro.lcl', '', '2020-06-16 18:03:08', '1592330589:$P$BrwYz80i1ig/E9E7sLNSkDZfsRhyIO0', 0, 'Tejas'),
(114, 'ihivare', '$P$Bu.WIzhowlRxjwYyHMG68r.IxwTCH40', 'ihivare', 'ihivare@wpandro.lcl', '', '2020-06-16 18:04:10', '1592330650:$P$BrdhyefTcGSl6IN9UpAMvJG/Gd7mvz/', 0, 'Ishwar'),
(115, 'ningale', '$P$BzbOv8TO9wcoI/aUHwkknxQdW3lal11', 'ningale', 'ningale@wpandro.lcl', '', '2020-06-16 18:05:30', '1592330731:$P$BthLJws/g/S6FdORfVRBsgu3/IxHa2/', 0, 'Niraj'),
(116, 'akahate', '$P$BevcekjVc1vGmvWyrdYlE1vj3BkOkp/', 'akahate', 'akahate@wpandro.lcl', '', '2020-06-16 18:06:24', '1592330785:$P$BF0S/Yy8QzEk1jjIQ2tzCLKr1AcXl40', 0, 'Akash'),
(117, 'spatil', '$P$BilW4nojnqiZq6E/0WZernSCQR6RFd1', 'spatil', 'spatil@wpandro.lcl', '', '2020-06-16 18:08:15', '1592330896:$P$BdtCp60MbB9J1XeL5pIcHgQvFgPFEZ1', 0, 'Shubham'),
(118, 'smahajan', '$P$BvytPXmUUsnjdQASdcapCymbDPq/1T.', 'smahajan', 'smahajan@wpandro.lcl', '', '2020-06-16 18:09:07', '1592330948:$P$B4Hp8Oo.2xMX2YvIYH7CqIAYQ4y5pT/', 0, 'Swapnil'),
(119, 'sspakale', '$P$BtOeKoJKqhgSIO9jEQOiX/vqzxfr1l0', 'sspakale', 'sspakale@wpandro.lcl', '', '2020-06-16 18:10:20', '1592331021:$P$B6/Af2QAc3i1GYCgCGM.CDgqEWqJpG.', 0, 'Suraj'),
(120, 'ypatil01', '$P$BwOuvRhAmhupM3q3wDeOMS0PdqPX1C.', 'ypatil01', 'ypatil01@wpandro.lcl', '', '2020-06-16 18:11:40', '1592331101:$P$B.omm7ep38PUWcLOcfqsOdRWHbwI6s.', 0, 'Yugesh'),
(121, 'ashaikh', '$P$BxX0Jnk8grbKUvlQ37u26dd3ezH3111', 'ashaikh', 'ashaikh@wpandro.lcl', '', '2020-06-16 18:13:00', '1592331182:$P$BNq6Z.eBy5VGnfPu6zUIZPYfuwFTlI.', 0, 'Azheruddin'),
(122, 'hbhortakke', '$P$BoRY0Hd3mAO1N7DiDvcFfbQ8zYQ89e0', 'hbhortakke', 'hbhortakke@wpandro.lcl', '', '2020-06-16 18:14:14', '1592331256:$P$BcJfI5Bn5YUztDQRRw9HWKZV01oRoh.', 0, 'Hemant'),
(123, 'jnemade', '$P$BzN.pyTcNzZwnFrVEzXHQ0skbLObH.1', 'jnemade', 'jnemade@wpandro.lcl', '', '2020-06-16 18:15:03', '1592331305:$P$B8nxq/tLIgw/Of5bHgPQ6e1lr0/j8w/', 0, 'Jayesh'),
(124, 'tpatil01', '$P$BwkE2CetGKEPU9J3P65saq0k5i7aOL/', 'tpatil01', 'tpatil01@wpandro.lcl', '', '2020-06-16 18:16:45', '1592331406:$P$Br5BOSARMOsOJi2LfKif3hVoWmDZTy.', 0, 'Toshal'),
(125, 'rkapale', '$P$Bn3xBmg7bioLDJVnfqyvUmz7CfOCdn1', 'rkapale', 'rkapale@wpandro.lcl', '', '2020-06-16 18:16:49', '1592331410:$P$B85ya20j4BBuS.QNosXUCnpH.BHAfA1', 0, 'Rupesh'),
(126, 'akhan', '$P$BPmeps9pBQarKsi3ExmGgWqPSh9LLK0', 'akhan', 'akhan@wpandro.lcl', '', '2020-06-16 18:19:03', '1592331544:$P$Bcn.MWxVyueMse7AfsOW2/YWJRZuks1', 0, 'Shahid Khan'),
(127, 'azope', '$P$BXBn1areAn4skoSI3oXeJ3YghRu.zI1', 'azope', 'azope@wpandro.lcl', '', '2020-06-16 18:21:53', '1592331714:$P$BMXTtCGoxgl572R1nfY31josn4db14.', 0, 'Amit'),
(129, 'smanyar', '$P$B./GXVUFLTplliEi4BRWaQdqokAikE1', 'smanyar', 'smanyar@wpandro.lcl', '', '2020-06-16 18:30:01', '1592332203:$P$BItKEWxZtyXB2ZhSa13G8CGeupfErK/', 0, 'Shaikh Shaheed'),
(130, 'nmahajan', '$P$B/MEZ0SmS9MVq8EPD123NvmxPFLfgv.', 'nmahajan', 'nmahajan@wpandro.lcl', '', '2020-06-16 18:32:47', '1592332368:$P$Bu32/GTI5ZxsI5IU2fgStVNtgKRvpN.', 0, 'Nikhil'),
(131, 'atadavi', '$P$BIZAFllYq0LX65CNuoSF2tMeJ4P2XJ0', 'atadavi', 'atadavi@wpandro.lcl', '', '2020-06-17 08:46:54', '1592383614:$P$BJsg9qKYco/Dq6ha52fbVr.8M9UByL.', 0, 'Aasif'),
(132, 'pchaudhari', '$P$BTxAd0Ea8fmNa.6GwjTfWpzPBf4zcg0', 'pchaudhari', 'pchaudhari@wpandro.lcl', '', '2020-06-17 08:55:09', '1592384110:$P$Bw1nKs1z6K4IpmtEG.S9NLUTgRSnU01', 0, 'Paresh'),
(133, 'nmahajan01', '$P$BUfxCw5XXbikt9cQl4QTLk7BM30uW80', 'nmahajan01', 'nmahajan01@wpandro.lcl', '', '2020-06-17 09:04:57', '1592384697:$P$BspObhiuVo0zDYZgOcGBVF.E8h7VFl1', 0, 'Nikhil'),
(134, 'vpachapole', '$P$BYHKZDxp0Bsn7NIgZVUAIxz7OVDYvb.', 'vpachapole', 'vpachapole@wpandro.lcl', '', '2020-06-17 09:08:03', '1592384889:$P$BDOCXL9pL3vYzex2NJPVoXuhqd7ZQ51', 0, 'Vishal'),
(135, 'ngayakwad', '$P$BJ29WggBp/EiikBmCJ.KKjiKZ/Emcq/', 'ngayakwad', 'ngayakwad@wpandro.lcl', '', '2020-06-17 11:10:26', '1592392228:$P$B1IMRhxWzK2doipsspZO1sc6517b9S1', 0, 'Nikhil'),
(136, 'hgayakwad', '$P$BvCHITJgrX59qKdrn3kvy7rDEAuzmC.', 'hgayakwad', 'hgayakwad@wpandro.lcl', '', '2020-06-17 11:12:25', '1592392345:$P$Bw9bpbirz7e57gql8ggakLn9FdezX71', 0, 'Hemant'),
(137, 'hsapkale', '$P$BrhlUfhAV4wxYTKwxyLDAD6Nmdcoft.', 'hsapkale', 'hsapkale@wpandro.lcl', '', '2020-06-17 11:17:38', '1592392659:$P$BI0S3dBqbLWu5t4RnfSJZamNKcuJO9/', 0, 'Harshal'),
(138, 'mnemade', '$P$B40sFAbIDThylAPTSGtvGPrZfTy2y.1', 'mnemade', 'mnemade@wpandro.lcl', '', '2020-06-17 11:28:15', '1592393296:$P$BQrlsEL5ihudzq0p39yLf7xhpOJWHL1', 0, 'Bharat'),
(139, 'jbadhe', '$P$Bl2ZehsHAF3dhDN9BIYR7dgxQICcO41', 'jbadhe', 'jbadhe@wpandro.lcl', '', '2020-06-17 11:30:46', '1592393448:$P$BpIBmRMowEPTrghlOu4YgRVIEAqo3G0', 0, 'Jayesh'),
(140, 'mmahajan', '$P$BOaztsHS81GGsFPCgfpiFa4ikHLT.o.', 'mmahajan', 'mmahajan@wpandro.lcl', '', '2020-06-17 11:33:02', '1592393584:$P$Bqg4w9Fe.PrJiA4vHnalO02EzpuxS91', 0, 'Mayur'),
(141, 'ashaikh01', '$P$BbEYvavWLrXdqqbX2r4uA40uiwaGPN.', 'ashaikh01', 'ashaikh01@wpandro.lcl', '', '2020-06-17 11:37:08', '1592393831:$P$Bk0NykQz1lng/zq3cnOBNxsyBlIj5H1', 0, 'Shaikh Abutalha'),
(142, 'hnemade', '$P$BLSL2nhI32GGyVKmzRaf023qhaoCFq.', 'hnemade', 'hnemade@wpandro.lcl', '', '2020-06-17 11:39:32', '1592393975:$P$BrkAiFjyqEjx.3ldJs0Ch.Dty9hA6i/', 0, 'Hemant'),
(143, 'cchavhan', '$P$BVwaYh39T/52OA0Ah4xm6ex4FDD2AI0', 'cchavhan', 'cchavhan@wpandro.lcl', '', '2020-06-17 11:42:10', '1592394132:$P$BxWSBEsfpLbk8ulhMwqmxrzhFTpWBp1', 0, 'Chandrasing'),
(144, 'pjoshi', '$P$B7KatiAMzrukrmDTaSk2pBvSYep4oR/', 'pjoshi', 'pjoshi@wpandro.lcl', '', '2020-06-17 13:15:28', '1592399729:$P$BN//MJprO1B8CLSYRiYNahc45PsvGH.', 0, 'Pranay'),
(145, 'rkolhe', '$P$BkkKO/XqgWoA2mYi8ErDnhxdckWojI0', 'rkolhe', 'rkolhe@wpandro.lcl', '', '2020-06-17 13:17:53', '1592399874:$P$Burc6PBnex1k5YUKqL1wC/gPaHvQ4g/', 0, 'Roshan'),
(146, 'maadhav', '$P$Bw0sZbqlUHVIc.Ben7bVY31qnZ.eBT/', 'maadhav', 'maadhav@wpandro.lcl', '', '2020-06-17 14:41:06', '1592404866:$P$BPagn0LVAIkhPkdo5NtAOBaSdn.aE5.', 0, 'Mohan'),
(147, 'dchaudhari01', '$P$BrELIV5mRoNrcUovzaq9/VqOa2fI9a/', 'dchaudhari01', 'dchaudhari01@wpandro.lcl', '', '2020-06-17 14:44:48', '1592405089:$P$BQryLXSResshL1sGgCVop66IeGopCQ.', 0, 'Dipak'),
(148, 'mtayade', '$P$Bv8lZiu5ZoNrKhRoBECQpGp3hn2BPS/', 'mtayade', 'mtayade@wpandro.in', '', '2020-06-17 14:48:33', '1592405313:$P$Bdgm96sOPMKoqt/2ji6QaODUXvxCYE/', 0, 'Manish'),
(149, 'bbonde', '$P$B.akGxGNHQqVjIHXBpGUaYrWS9QTF31', 'bbonde', 'bbonde@wpandro.lcl', '', '2020-06-17 15:09:53', '1592406594:$P$BvoPmSolIOvW81ZLTSkwnTvAtktCA60', 0, 'Bhairav'),
(150, 'gchaudhari', '$P$B47IzRqayr3ifPtu31sPeJ2QKhB/bN0', 'gchaudhari', 'gchaudhari@wpandro.lcl', '', '2020-06-17 15:14:54', '1592406895:$P$B7HU.RxPfKXSLUJdRM52gKRxuGM3Wp/', 0, 'Gaurav'),
(151, 'nbaig', '$P$B1yp8HJpogwMF1/6BiS.jzZoxgTcIU0', 'nbaig', 'nbaig@wpandro.in', '', '2020-06-17 15:17:26', '1592407050:$P$BH/IaieTkGtMb0q2OwOl0M4mHiApPV1', 0, 'Noman Baig'),
(152, 'jkolhe', '$P$BVCT4qPOiSnpgKAPi9Vqn7wtZyalkI0', 'jkolhe', 'jkolhe@wpandro.lcl', '', '2020-06-17 15:20:19', '1592407221:$P$BxascLaEB.LxyIZsB9cQpujlP222oX1', 0, 'Jayesh'),
(153, 'rharankar', '$P$B6w9i7LGRlASGLDq7oBADufzfD0/uc0', 'rharankar', 'rharankar@wpandro.lcl', '', '2020-06-17 15:23:27', '1592407408:$P$BzYhNgabu/d78m38joGrH.xJf6ZEOI/', 0, 'Rohit'),
(154, 'ddhangar', '$P$BwWML1cclf0OVcEV1GcbOtXSA4pXoK/', 'ddhangar', 'ddhangar@wpandro.lcl', '', '2020-06-17 15:28:44', '1592407725:$P$BayLNhaAMOgZyuR6iJrl7c9MWOdj//0', 0, 'Durgesh'),
(155, 'spatil01', '$P$BrakAngduplQQIzZM8BwuottOlwZSh.', 'spatil01', 'spatil01@wpandro.lcl', '', '2020-06-17 15:30:52', '1592407854:$P$BbF.WfiqWBAr0HYmKxtCrvH3ZyNLNW.', 0, 'Satish'),
(156, 'vgosavi', '$P$B5SBRDHe9ufJB/DNuubjYLrMnQ5tBS1', 'vgosavi', 'vgosavi@wpandro.lcl', '', '2020-06-17 15:33:00', '1592407981:$P$BD0e.eTeGUnHKzDWxRnmPCGCuj0U7p/', 0, 'Vinaygir'),
(157, 'kmahajan', '$P$BhDHs4XlJKIS4JGYyCKsO5Vwa9CbCx.', 'kmahajan', 'kmahajan@wpandro.lcl', '', '2020-06-17 15:37:57', '1592408278:$P$BP.01xt0x7cW7/C8C5gxpEI1c05MZz0', 0, 'Kuldip'),
(158, 'gpatil', '$P$BfVE97DmaVFGe3mKwOG9SVi5SRy7i7.', 'gpatil', 'gpatil@wpandro.lcl', '', '2020-06-17 15:40:42', '1592408443:$P$BRcL.dIQ5mU8oyphIMVaBThq65e9yu/', 0, 'Ganesh'),
(159, 'vbonde', '$P$BTPM7iHWTjhck4mOhQmhcFhYAilX.M/', 'vbonde', 'vbonde@wpandro.lcl', '', '2020-06-17 15:45:51', '1592408752:$P$B89F85N8SoW57dShFi4pEZ4FBaPIST/', 0, 'Vivek'),
(160, 'mwarke', '$P$BbjQN9XKRs96c3.9n2F2FHXHkYZdcK1', 'mwarke', 'mwarke@wpandro.lcl', '', '2020-06-17 15:47:58', '1592408883:$P$BJYfNFzbpAmr25gfaZ6JLOAMoBZHPW/', 0, 'Mohit'),
(161, 'tnemade01', '$P$BAkZyMvbh8zXGZvytsnFjmrz612kab0', 'tnemade01', 'tnemade01@wpandro.lcl', '', '2020-06-17 15:51:35', '1592409096:$P$BqC25e5J/eUsxCVag8.vIZ.QdzC9pi.', 0, 'Thekuchand'),
(162, 'vchaudhari', '$P$BX2qJT.rMCTUb4gYgQ2.a0Szp2QXPf.', 'vchaudhari', 'vchaudhari@wpandro.lcl', '', '2020-06-17 16:37:41', '1592411863:$P$BUr7AK4TxldeJ3AxJ2Xll4lC6u122r1', 0, 'Vipul'),
(163, 'gnemade', '$P$BCPBE/wv4.1H72UulMFDyYMAh6lYtk0', 'gnemade', 'gnemade@wpandro.lcl', '', '2020-06-17 16:41:13', '1592412076:$P$BxAq5ejwgXvIfTT/ny.sHIL6yJpf591', 0, 'Gunawant');

-- --------------------------------------------------------

--
-- Table structure for table `iti_vxcf_leads`
--

CREATE TABLE `iti_vxcf_leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` int(4) NOT NULL DEFAULT '0',
  `type` int(4) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_star` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `ip` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `browser` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `screen` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `os` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vis_id` varchar(250) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_520_ci,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `iti_vxcf_leads`
--

INSERT INTO `iti_vxcf_leads` (`id`, `form_id`, `status`, `type`, `is_read`, `is_star`, `user_id`, `ip`, `browser`, `screen`, `os`, `vis_id`, `url`, `meta`, `created`, `updated`) VALUES
(1, 'cf_376', 1, 0, 0, 0, 1, '103.232.239.200', 'Chrome', '1920 x 1080', 'Windows', '5ec63ef26637a159005054637668071', 'https://www.nutaniti.com/admission-form/', NULL, '2020-05-21 08:42:26', '2020-05-21 08:42:26'),
(2, 'cf_376', 1, 0, 0, 0, 1, '103.232.239.200', 'Chrome', '1920 x 1080', 'Windows', '5ec63ef26637a159005054637668071', 'https://www.nutaniti.com/admission-form/', NULL, '2020-05-21 08:48:53', '2020-05-21 08:48:53'),
(3, 'cf_376', 1, 0, 1, 0, 0, '106.200.102.241', 'Chrome', '360 x 780', 'Android', '5ec67b8eb97de159006606299449082', 'https://www.nutaniti.com/admission-form/', NULL, '2020-05-21 13:01:02', '2020-05-21 13:01:02'),
(4, 'cf_376', 1, 0, 1, 0, 0, '103.232.239.200', 'Safari', '360 x 780', 'linux', '5ec6825104b02159006779392181793', 'https://www.nutaniti.com/admission-form/', NULL, '2020-05-21 13:29:53', '2020-05-21 13:29:53'),
(5, 'cf_376', 0, 0, 1, 0, 0, '157.33.179.183', 'Chrome', '393 x 786', 'Android', '5ec782b16cf16159013342583826778', 'https://www.nutaniti.com/admission-form/', NULL, '2020-05-22 07:43:45', '2020-05-22 07:43:45'),
(6, 'cf_68', 1, 0, 0, 0, 0, '185.216.34.237', 'Chrome', NULL, 'Windows', '5ec79abf8a5ce159013958381650597', '//www.nutaniti.com/wp-json/contact-form-7/v1/contact-forms/68/feedback', NULL, '2020-05-22 09:26:23', '2020-05-22 09:26:23'),
(7, 'cf_376', 0, 0, 0, 0, 0, '106.220.130.131', 'Chrome', '360 x 800', 'Android', '5ec7aedd015f415901447337766337', 'https://www.nutaniti.com/admission-form/', NULL, '2020-05-22 10:52:13', '2020-05-22 10:52:13'),
(8, 'cf_376', 0, 0, 0, 0, 0, '49.35.31.83', 'Chrome', '360 x 760', 'Android', '5eca129cda815159030134064587390', 'https://www.nutaniti.com/admission-form/', NULL, '2020-05-24 06:22:20', '2020-05-24 06:22:20'),
(9, 'cf_376', 0, 0, 0, 0, 0, '157.47.17.10', 'Chrome', '360 x 640', 'Android', '5ecaae857f501159034125398633302', 'https://www.nutaniti.com/admission-form/', NULL, '2020-05-24 17:27:33', '2020-05-24 17:27:33'),
(10, 'cf_376', 0, 0, 0, 0, 0, '157.33.186.206', 'Chrome', '320 x 570', 'Android', '5ed460a1d7700159097667339718582', 'https://www.nutaniti.com/admission-form/', NULL, '2020-06-01 01:57:53', '2020-06-01 01:57:53'),
(11, 'cf_376', 0, 0, 0, 0, 0, '49.35.5.67', 'Chrome', '393 x 851', 'Android', '5ed4fe457ebf2159101702920026292', 'https://www.nutaniti.com/admission-form/', NULL, '2020-06-01 13:10:29', '2020-06-01 13:10:29'),
(12, 'cf_376', 0, 0, 0, 0, 0, '106.210.190.170', 'Chrome', '360 x 640', 'Android', '5ee05c2d62333159176196572641525', 'https://www.nutaniti.com/admission-form/', NULL, '2020-06-10 04:06:05', '2020-06-10 04:06:05'),
(13, 'cf_376', 0, 0, 0, 0, 0, '106.193.207.51', 'Chrome', '360 x 640', 'Android', '5ee05c2d62333159176196572641525', 'https://www.nutaniti.com/admission-form/', NULL, '2020-06-10 08:23:22', '2020-06-10 08:23:22'),
(14, 'cf_376', 0, 0, 0, 0, 0, '49.35.192.187', 'Firefox', '240 x 320', 'Android', '5eef1555ba803159272686968756569', 'https://www.nutaniti.com/admission-form/', NULL, '2020-06-21 08:07:49', '2020-06-21 08:07:49'),
(15, 'cf_376', 0, 0, 0, 0, 0, '49.35.192.187', 'Firefox', '240 x 320', 'Android', '5eef1559a9d2e159272687347816386', 'https://www.nutaniti.com/admission-form/', NULL, '2020-06-21 08:07:53', '2020-06-21 08:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `iti_vxcf_leads_detail`
--

CREATE TABLE `iti_vxcf_leads_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `iti_vxcf_leads_detail`
--

INSERT INTO `iti_vxcf_leads_detail` (`id`, `lead_id`, `name`, `value`) VALUES
(1, 1, 'FirstName', 'Rahul'),
(2, 1, 'your-email', 'rahulbhangale26@gmail.com'),
(3, 1, 'your-subject', 'I want to functionality,'),
(4, 1, 'your-message', 'Hello'),
(5, 2, 'FirstName', 'Rahul'),
(6, 2, 'your-email', 'rahulbhangale26@gmail.com'),
(7, 2, 'your-subject', 'I want to functionality,'),
(8, 2, 'your-message', 'asd'),
(9, 2, 'UserPhoto', 'a:1:{i:0;s:35:\"2020/05/2019-09-15-22-40-32-262.jpg\";}'),
(10, 3, 'FullName', 'Gaurav Bhangale'),
(11, 3, 'PhoneNumber', '0900080000'),
(12, 3, 'ParentName', 'V bhangale'),
(13, 3, 'ParentPhoneNumber', '08080808080'),
(14, 3, 'StudentPhoto', 'a:1:{i:0;s:60:\"2020/05/what-to-look-out-for-in-your-lawn-mowing-service.jpg\";}'),
(15, 3, 'PassportPhoto', 'a:1:{i:0;s:62:\"2020/05/what-to-look-out-for-in-your-lawn-mowing-service-1.jpg\";}'),
(16, 3, 'Trade', 'इलेक्ट्रिशियन'),
(17, 3, 'BirthDate', '2011-01-01'),
(18, 3, 'Education', '१२ वी पास'),
(19, 3, 'Caste', 'इतर मागास वर्ग(OBC)'),
(20, 3, 'Address', 'Chinawal, Raver'),
(21, 3, 'Interested', '100 %'),
(22, 4, 'FullName', 'Gaurav bhangale'),
(23, 4, 'PhoneNumber', '7387040760'),
(24, 4, 'ParentName', 'V bhangale'),
(25, 4, 'ParentPhoneNumber', '8805548468'),
(26, 4, 'Trade', 'Electrician'),
(27, 4, 'BirthDate', '2010-05-12'),
(28, 4, 'AdharCard', '6990585869669'),
(29, 4, 'NonCreamyLayer', 'Yes'),
(30, 4, 'Education', '12th'),
(31, 4, 'Caste', 'OBC'),
(32, 4, 'Address', 'Chinawal, raver, jalgaon'),
(33, 4, 'StudentPhoto', 'a:1:{i:0;s:78:\"2020/05/Screenshot_2020-05-15-17-30-58-88_690c51e735bda6d3c2fe83c15517e971.png\";}'),
(34, 4, 'PassportPhoto', 'a:1:{i:0;s:78:\"2020/05/Screenshot_2020-05-15-17-31-24-10_690c51e735bda6d3c2fe83c15517e971.png\";}'),
(35, 5, 'FullName', 'Vaibhav vasant mahajan'),
(36, 5, 'PhoneNumber', '9890361298'),
(37, 5, 'ParentName', 'Vasant madhav mahajan'),
(38, 5, 'ParentPhoneNumber', '9890361298'),
(39, 5, 'Trade', 'Electrician'),
(40, 5, 'BirthDate', '1994-10-13'),
(41, 5, 'AdharCard', '2255442244855'),
(42, 5, 'NonCreamyLayer', 'Yes'),
(43, 5, 'Education', '10th'),
(44, 5, 'Caste', 'OBC'),
(45, 5, 'Address', 'Chinawal'),
(46, 5, 'StudentPhoto', ''),
(47, 5, 'PassportPhoto', ''),
(48, 6, 'your-name', 'Seх dating in Аustralia | Girls for sех in Austrаlia: https://s.coop/sexygirlsdating212855'),
(49, 6, 'your-email', 'one_luv_413@yahoo.com'),
(50, 6, 'your-subject', 'Find уоursеlf а girl fоr thе night in уоur city: http://gmy.su/:5pbjb'),
(51, 6, 'your-message', 'Вeаutiful girls fоr sех in уour city: http://www.ugly.nz//194879'),
(52, 7, 'FullName', 'भुवन संदीप चौधरी'),
(53, 7, 'PhoneNumber', '8600861739'),
(54, 7, 'ParentName', 'संदीप गणेश चौधरी'),
(55, 7, 'ParentPhoneNumber', '8600861739'),
(56, 7, 'Trade', 'Fitter'),
(57, 7, 'BirthDate', '2002-01-15'),
(58, 7, 'AdharCard', '22145423525'),
(59, 7, 'NonCreamyLayer', 'No'),
(60, 7, 'Education', '12th'),
(61, 7, 'Caste', 'OBC'),
(62, 7, 'Address', 'मुक्काम पोस्ट आमोदा तालुका यावल जिल्हा जळगाव'),
(63, 7, 'StudentPhoto', ''),
(64, 7, 'PassportPhoto', ''),
(65, 8, 'FullName', 'Pratik m mahajna'),
(66, 8, 'PhoneNumber', '9518520804'),
(67, 8, 'ParentName', 'Mohan R mahajan'),
(68, 8, 'ParentPhoneNumber', '9359144472'),
(69, 8, 'Trade', 'Fitter'),
(70, 8, 'BirthDate', ''),
(71, 8, 'AdharCard', ''),
(72, 8, 'Education', '10th'),
(73, 8, 'Caste', 'OPEN'),
(74, 8, 'Address', ''),
(75, 8, 'StudentPhoto', ''),
(76, 8, 'PassportPhoto', ''),
(77, 9, 'FullName', 'लोकेश राजेंद्र येवले'),
(78, 9, 'PhoneNumber', '8329178631'),
(79, 9, 'ParentName', 'राजेंद्र मधुकर येवले '),
(80, 9, 'ParentPhoneNumber', '9767152785'),
(81, 9, 'Trade', 'Fitter'),
(82, 9, 'BirthDate', '2002-04-14'),
(83, 9, 'AdharCard', ''),
(84, 9, 'Education', '10th'),
(85, 9, 'Caste', 'OBC'),
(86, 9, 'Address', 'कोरपावली'),
(87, 9, 'StudentPhoto', ''),
(88, 9, 'PassportPhoto', ''),
(89, 10, 'FullName', 'Salunke baban shankar'),
(90, 10, 'PhoneNumber', '8625043541'),
(91, 10, 'ParentName', 'Shankar limbaji Salunke'),
(92, 10, 'ParentPhoneNumber', '9673733741'),
(93, 10, 'Trade', 'Electrician'),
(94, 10, 'BirthDate', '2000-09-14'),
(95, 10, 'AdharCard', '684687167962'),
(96, 10, 'Education', '10th'),
(97, 10, 'Caste', 'OBC'),
(98, 10, 'Address', 'Sushiladevi deshmukh nagar latur'),
(99, 10, 'StudentPhoto', ''),
(100, 10, 'PassportPhoto', ''),
(101, 11, 'FullName', 'Girish Ravindra Falak'),
(102, 11, 'PhoneNumber', '9421611155'),
(103, 11, 'ParentName', 'Ravindra Madhukar Falak'),
(104, 11, 'ParentPhoneNumber', '9960722511'),
(105, 11, 'Trade', 'Fitter'),
(106, 11, 'BirthDate', '2002-10-16'),
(107, 11, 'AdharCard', '740431617661'),
(108, 11, 'Education', '10th'),
(109, 11, 'Caste', 'OBC'),
(110, 11, 'Address', 'Sarkari davakhana , khiroda road chinawal, Tal.Raver Jal.jalgaon '),
(111, 11, 'StudentPhoto', 'a:1:{i:0;s:31:\"2020/06/IMG_20200601_183620.jpg\";}'),
(112, 11, 'PassportPhoto', 'a:1:{i:0;s:31:\"2020/06/IMG_20200601_183909.jpg\";}'),
(113, 12, 'FullName', 'Prathamesh Kiran Lokhande'),
(114, 12, 'PhoneNumber', ''),
(115, 12, 'ParentName', ''),
(116, 12, 'ParentPhoneNumber', ''),
(117, 12, 'Trade', 'Electrician'),
(118, 12, 'BirthDate', ''),
(119, 12, 'AdharCard', ''),
(120, 12, 'Education', '10th'),
(121, 12, 'Caste', 'OPEN'),
(122, 12, 'Address', ''),
(123, 12, 'StudentPhoto', ''),
(124, 12, 'PassportPhoto', ''),
(125, 13, 'FullName', 'Prathamesh Kiran Lokhande'),
(126, 13, 'PhoneNumber', '7385023774'),
(127, 13, 'ParentName', 'Kiran madhukar lokhande'),
(128, 13, 'ParentPhoneNumber', '9096090647'),
(129, 13, 'Trade', 'Electrician'),
(130, 13, 'BirthDate', ''),
(131, 13, 'AdharCard', '263674236444'),
(132, 13, 'Education', '10th'),
(133, 13, 'Caste', 'OBC'),
(134, 13, 'Address', 'At post Atrawal tel Yawal dis Jalgaon '),
(135, 13, 'StudentPhoto', 'a:1:{i:0;s:31:\"2020/06/IMG_20200610_134850.jpg\";}'),
(136, 13, 'PassportPhoto', 'a:1:{i:0;s:31:\"2020/06/IMG_20200610_135206.jpg\";}'),
(137, 14, 'FullName', 'saraju govinda hole'),
(138, 14, 'PhoneNumber', '9561434539'),
(139, 14, 'ParentName', 'Govinda shitaram hole'),
(140, 14, 'ParentPhoneNumber', '9561434539'),
(141, 14, 'Trade', 'Fitter'),
(142, 14, 'BirthDate', '1977-02-14'),
(143, 14, 'AdharCard', '9123253652'),
(144, 14, 'Education', '10th'),
(145, 14, 'Caste', 'OBC'),
(146, 14, 'Address', 'Maskawad tal raver jalgoan'),
(147, 14, 'StudentPhoto', 'a:1:{i:0;s:36:\"2020/06/WA-IMG-20200619-f9fdd73f.jpg\";}'),
(148, 14, 'PassportPhoto', ''),
(149, 15, 'FullName', 'saraju govinda hole'),
(150, 15, 'PhoneNumber', '9561434539'),
(151, 15, 'ParentName', 'Govinda shitaram hole'),
(152, 15, 'ParentPhoneNumber', '9561434539'),
(153, 15, 'Trade', 'Fitter'),
(154, 15, 'BirthDate', '1977-02-14'),
(155, 15, 'AdharCard', '9123253652'),
(156, 15, 'Education', '10th'),
(157, 15, 'Caste', 'OBC'),
(158, 15, 'Address', 'Maskawad tal raver jalgoan'),
(159, 15, 'StudentPhoto', 'a:1:{i:0;s:38:\"2020/06/WA-IMG-20200619-f9fdd73f-1.jpg\";}'),
(160, 15, 'PassportPhoto', '');

-- --------------------------------------------------------

--
-- Table structure for table `iti_vxcf_leads_notes`
--

CREATE TABLE `iti_vxcf_leads_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `color` int(1) NOT NULL DEFAULT '0',
  `email` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_520_ci,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wl_im_batches`
--

CREATE TABLE `iti_wl_im_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_code` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `batch_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wl_im_courses`
--

CREATE TABLE `iti_wl_im_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_code` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `course_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `course_detail` text COLLATE utf8mb4_unicode_520_ci,
  `duration` int(11) UNSIGNED DEFAULT NULL,
  `duration_in` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fees` decimal(12,2) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wl_im_enquiries`
--

CREATE TABLE `iti_wl_im_enquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wl_im_installments`
--

CREATE TABLE `iti_wl_im_installments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(12,2) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wl_im_students`
--

CREATE TABLE `iti_wl_im_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_520_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fees_payable` decimal(12,2) UNSIGNED DEFAULT '0.00',
  `fees_paid` decimal(12,2) UNSIGNED DEFAULT '0.00',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `course_completed` tinyint(1) NOT NULL DEFAULT '0',
  `completion_date` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `batch_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpforms_tasks_meta`
--

CREATE TABLE `iti_wpforms_tasks_meta` (
  `id` bigint(20) NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `iti_wpforms_tasks_meta`
--

INSERT INTO `iti_wpforms_tasks_meta` (`id`, `action`, `data`, `date`) VALUES
(1, 'wpforms_process_entry_emails_meta_cleanup', 'Wzg2NDAwXQ==', '2020-05-21 08:23:34'),
(2, 'wpforms_admin_notifications_update', 'W10=', '2020-05-21 08:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_attendance`
--

CREATE TABLE `iti_wpsp_attendance` (
  `aid` int(15) UNSIGNED NOT NULL,
  `unit_id` varchar(15) DEFAULT NULL,
  `absents` text,
  `sick_leave` text NOT NULL,
  `casual_leave` text NOT NULL,
  `special_leave` text NOT NULL,
  `date` date DEFAULT NULL,
  `entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iti_wpsp_attendance`
--

INSERT INTO `iti_wpsp_attendance` (`aid`, `unit_id`, `absents`, `sick_leave`, `casual_leave`, `special_leave`, `date`, `entry`) VALUES
(1, '6', 'Nil', '', '', '', '2020-06-18', '2020-06-18 17:08:33'),
(3, '6', '[{\"sid\":\"94\",\"reason\":\"\"},{\"sid\":\"103\",\"reason\":\"\"},{\"sid\":\"119\",\"reason\":\"\"}]', '', '', '', '2020-06-20', '2020-06-20 05:48:45'),
(4, '4', 'Nil', '', '', '', '2020-06-19', '2020-06-20 09:26:11'),
(5, '4', 'Nil', '', '', '', '2020-06-20', '2020-06-20 09:27:31'),
(6, '4', '[{\"sid\":\"84\",\"reason\":\"\"},{\"sid\":\"97\",\"reason\":\"\"}]', '[{\"sid\":\"89\",\"reason\":\"\"},{\"sid\":\"93\",\"reason\":\"\"}]', '[{\"sid\":\"87\",\"reason\":\"\"},{\"sid\":\"95\",\"reason\":\"\"}]', '[{\"sid\":\"91\",\"reason\":\"\"}]', '2020-06-21', '2020-06-21 05:22:18'),
(7, '4', '[{\"sid\":\"84\",\"reason\":\"\"},{\"sid\":\"87\",\"reason\":\"\"},{\"sid\":\"125\",\"reason\":\"\"}]', '[{\"sid\":\"118\",\"reason\":\"\"}]', '[{\"sid\":\"120\",\"reason\":\"\"}]', '[{\"sid\":\"114\",\"reason\":\"\"}]', '2020-05-31', '2020-06-21 05:26:19'),
(8, '6', '[{\"sid\":\"130\",\"reason\":\"\"}]', '[{\"sid\":\"110\",\"reason\":\"\"}]', '[{\"sid\":\"127\",\"reason\":\"\"}]', 'null', '2020-01-01', '2020-06-22 03:22:27'),
(9, '6', 'Nil', '', '', '', '2020-01-02', '2020-06-22 03:23:14'),
(10, '6', 'Nil', '', '', '', '2020-01-03', '2020-06-22 03:23:51'),
(11, '6', 'Nil', '', '', '', '2020-01-04', '2020-06-22 03:24:40'),
(13, '6', '[{\"sid\":\"126\",\"reason\":\"\"}]', 'null', '[{\"sid\":\"117\",\"reason\":\"\"}]', 'null', '2020-01-07', '2020-06-22 03:28:52'),
(14, '6', 'Nil', '', '', '', '2020-01-08', '2020-06-22 03:29:59'),
(15, '6', 'Nil', '', '', '', '2020-02-01', '2020-06-22 03:32:24'),
(17, '6', 'Nil', '', '', '', '2020-02-03', '2020-06-22 03:32:53'),
(18, '6', '[{\"sid\":\"94\",\"reason\":\"\"},{\"sid\":\"96\",\"reason\":\"\"},{\"sid\":\"100\",\"reason\":\"\"},{\"sid\":\"101\",\"reason\":\"\"},{\"sid\":\"103\",\"reason\":\"\"}]', 'null', 'null', 'null', '2020-01-06', '2020-06-22 03:35:59'),
(19, '6', '[{\"sid\":\"94\",\"reason\":\"\"},{\"sid\":\"96\",\"reason\":\"\"},{\"sid\":\"100\",\"reason\":\"\"},{\"sid\":\"101\",\"reason\":\"\"},{\"sid\":\"103\",\"reason\":\"\"}]', 'null', 'null', 'null', '2020-01-06', '2020-06-22 03:35:59'),
(22, '4', '[{\"sid\":\"89\",\"reason\":\"\"},{\"sid\":\"98\",\"reason\":\"\"}]', 'null', 'null', 'null', '2020-06-01', '2020-06-22 08:55:13'),
(23, '4', 'Nil', '', '', '', '2020-06-02', '2020-06-22 08:55:45'),
(24, '4', '[{\"sid\":\"91\",\"reason\":\"\"},{\"sid\":\"116\",\"reason\":\"\"}]', 'null', 'null', 'null', '2020-06-23', '2020-06-23 03:11:43'),
(27, '5', '[{\"sid\":\"84\",\"reason\":\"\"},{\"sid\":\"87\",\"reason\":\"\"}]', '[{\"sid\":\"91\",\"reason\":\"\"}]', '[{\"sid\":\"89\",\"reason\":\"\"}]', '[{\"sid\":\"93\",\"reason\":\"\"}]', '2019-10-02', '2020-06-29 04:09:31'),
(28, '4', 'Nil', '', '', '', '2019-08-12', '2020-06-30 03:33:05'),
(29, '4', 'Nil', '', '', '', '2019-08-13', '2020-06-30 03:34:02'),
(30, '5', 'Nil', '', '', '', '2020-01-01', '2020-06-30 09:11:09');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_attendance_types`
--

CREATE TABLE `iti_wpsp_attendance_types` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_attendance_types`
--

INSERT INTO `iti_wpsp_attendance_types` (`id`, `name`, `code`, `description`) VALUES
(1, 'Present', 'P', ''),
(2, 'Absent', 'A', ''),
(3, 'Sick Leave', 'SL', ''),
(4, 'Casual Leave', 'CL', ''),
(5, 'Special Leave', 'SPL', '');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_batches`
--

CREATE TABLE `iti_wpsp_batches` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_batches`
--

INSERT INTO `iti_wpsp_batches` (`id`, `name`) VALUES
(1, '2018-2020'),
(2, '2019-2021');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_class`
--

CREATE TABLE `iti_wpsp_class` (
  `cid` int(15) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `c_numb` varchar(128) DEFAULT NULL,
  `c_name` varchar(128) DEFAULT NULL,
  `teacher_id` int(15) DEFAULT NULL,
  `c_capacity` int(5) DEFAULT NULL,
  `c_loc` varchar(60) DEFAULT NULL,
  `c_sdate` date DEFAULT NULL,
  `c_edate` date DEFAULT NULL,
  `c_fee_type` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iti_wpsp_class`
--

INSERT INTO `iti_wpsp_class` (`cid`, `trade_id`, `batch_id`, `c_numb`, `c_name`, `teacher_id`, `c_capacity`, `c_loc`, `c_sdate`, `c_edate`, `c_fee_type`) VALUES
(4, 1, 2, '1', 'Fitter 1', 80, 22, 'Online', '2020-01-01', '2020-12-31', 'free'),
(5, 1, 1, '2', 'Fitter 2', 81, 22, 'Online', '2020-01-01', '2020-12-31', 'free'),
(6, 2, 2, '3', 'Electrician 2', 82, 22, 'Online', '2020-01-01', '2020-12-31', 'free'),
(7, 2, 1, '4', 'Electrician 1', 83, 22, 'Online', '2020-01-31', '2020-12-31', 'free'),
(8, 0, 0, '1', 'Fitter', 81, 13, 'Classroom', '2020-07-01', '2020-07-01', 'free');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_class_mapping`
--

CREATE TABLE `iti_wpsp_class_mapping` (
  `id` bigint(11) NOT NULL,
  `sid` bigint(11) NOT NULL,
  `cid` bigint(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_class_mapping`
--

INSERT INTO `iti_wpsp_class_mapping` (`id`, `sid`, `cid`, `date`) VALUES
(5, 14, 6, '0000-00-00'),
(10, 21, 6, '0000-00-00'),
(13, 23, 6, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_events`
--

CREATE TABLE `iti_wpsp_events` (
  `id` bigint(15) UNSIGNED NOT NULL,
  `start` varchar(50) DEFAULT NULL,
  `end` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `title` text,
  `description` longtext,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_exam`
--

CREATE TABLE `iti_wpsp_exam` (
  `eid` int(15) NOT NULL,
  `classid` int(15) DEFAULT NULL,
  `subject_id` varchar(128) DEFAULT NULL,
  `e_name` varchar(128) DEFAULT NULL,
  `e_s_date` date DEFAULT NULL,
  `e_e_date` date DEFAULT NULL,
  `entry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_fees`
--

CREATE TABLE `iti_wpsp_fees` (
  `fees_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `fees_amount` float NOT NULL,
  `description` text NOT NULL,
  `duration` text NOT NULL,
  `paymentType` text NOT NULL,
  `due_time` int(2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_fees_payment`
--

CREATE TABLE `iti_wpsp_fees_payment` (
  `fees_pay_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `fees_id` int(11) NOT NULL,
  `fees_paid_amount` float NOT NULL,
  `payment_status` varchar(10) NOT NULL,
  `paid_due_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_fee_payment_history`
--

CREATE TABLE `iti_wpsp_fee_payment_history` (
  `payment_history_id` bigint(20) NOT NULL,
  `fees_pay_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `paid_date` date NOT NULL,
  `paid_by` bigint(20) NOT NULL,
  `paid_status` int(2) NOT NULL,
  `paymentdescription` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_files`
--

CREATE TABLE `iti_wpsp_files` (
  `id` int(11) NOT NULL,
  `file_type_id` int(11) NOT NULL,
  `file_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `uploaded_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_files`
--

INSERT INTO `iti_wpsp_files` (`id`, `file_type_id`, `file_name`, `file_path`, `is_active`, `uploaded_by`, `uploaded_on`) VALUES
(1, 1, 'CTS Fitter 2017.pdf', '/uploads/files/1/', 1, 52, '2020-07-04 10:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_file_types`
--

CREATE TABLE `iti_wpsp_file_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_file_types`
--

INSERT INTO `iti_wpsp_file_types` (`id`, `name`, `description`) VALUES
(1, 'Syllabus', 'This type of files stores the syllabus details.');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_grade`
--

CREATE TABLE `iti_wpsp_grade` (
  `gid` int(15) NOT NULL,
  `g_name` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `g_point` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `mark_from` int(3) DEFAULT NULL,
  `mark_upto` int(3) DEFAULT NULL,
  `comment` varchar(60) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_import_history`
--

CREATE TABLE `iti_wpsp_import_history` (
  `id` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `imported_id` longtext NOT NULL,
  `time` datetime NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_leavedays`
--

CREATE TABLE `iti_wpsp_leavedays` (
  `id` bigint(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `leave_date` date DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_mark`
--

CREATE TABLE `iti_wpsp_mark` (
  `mid` bigint(20) NOT NULL,
  `subject_id` varchar(128) DEFAULT NULL,
  `class_id` int(15) DEFAULT NULL,
  `student_id` int(15) DEFAULT NULL,
  `exam_id` int(15) DEFAULT NULL,
  `mark` varchar(60) DEFAULT NULL,
  `remarks` text,
  `attendance` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_mark_extract`
--

CREATE TABLE `iti_wpsp_mark_extract` (
  `id` bigint(20) NOT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `field_id` bigint(20) DEFAULT NULL,
  `exam_id` int(12) DEFAULT NULL,
  `subject_id` int(12) DEFAULT NULL,
  `mark` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_mark_fields`
--

CREATE TABLE `iti_wpsp_mark_fields` (
  `field_id` bigint(20) NOT NULL,
  `subject_id` int(12) DEFAULT NULL,
  `field_text` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_messages`
--

CREATE TABLE `iti_wpsp_messages` (
  `mid` int(15) NOT NULL,
  `s_id` int(15) DEFAULT NULL,
  `r_id` int(15) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `msg` longtext,
  `replay_id` int(11) DEFAULT NULL,
  `main_m_id` int(11) DEFAULT NULL,
  `del_stat` int(15) DEFAULT NULL,
  `s_read` int(11) DEFAULT '0',
  `r_read` int(11) DEFAULT '0',
  `m_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_messages_delete`
--

CREATE TABLE `iti_wpsp_messages_delete` (
  `id` bigint(11) NOT NULL,
  `m_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `delete_status` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_notification`
--

CREATE TABLE `iti_wpsp_notification` (
  `nid` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_settings`
--

CREATE TABLE `iti_wpsp_settings` (
  `id` int(15) UNSIGNED NOT NULL,
  `option_name` varchar(50) DEFAULT NULL,
  `option_value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iti_wpsp_settings`
--

INSERT INTO `iti_wpsp_settings` (`id`, `option_name`, `option_value`) VALUES
(1, 'sch_name', 'Nutan ITI'),
(2, 'sch_logo', 'https://www.nutaniti.com/wp-content/uploads/2020/06/Logo-5.psd-Copy-e1549698174209.jpg'),
(3, 'sch_addr', ''),
(4, 'sch_city', ''),
(5, 'sch_state', ''),
(6, 'sch_country', ''),
(7, 'sch_pno', ''),
(8, 'sch_fax', '0'),
(9, 'sch_email', ''),
(10, 'sch_website', ''),
(11, 'date_format', 'm/d/Y'),
(12, 'markstype', 'Number'),
(13, 'absent_sms_alert', '0'),
(14, 'notification_sms_alert', '0');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_student`
--

CREATE TABLE `iti_wpsp_student` (
  `sid` int(15) NOT NULL,
  `wp_usr_id` bigint(20) DEFAULT NULL,
  `parent_wp_usr_id` int(15) DEFAULT NULL,
  `batch_id` int(11) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `current_unit_id` int(11) NOT NULL,
  `s_rollno` varchar(15) DEFAULT NULL,
  `s_fname` varchar(30) DEFAULT NULL,
  `s_mname` varchar(30) DEFAULT NULL,
  `s_lname` varchar(30) DEFAULT NULL,
  `s_dob` date DEFAULT NULL,
  `s_gender` varchar(10) DEFAULT NULL,
  `s_address` varchar(200) DEFAULT NULL,
  `s_paddress` varchar(200) DEFAULT NULL,
  `s_country` varchar(20) DEFAULT NULL,
  `s_zipcode` varchar(10) DEFAULT NULL,
  `s_phone` varchar(25) DEFAULT NULL,
  `s_bloodgrp` varchar(20) DEFAULT NULL,
  `s_doj` date DEFAULT NULL,
  `class_id` varchar(255) DEFAULT NULL,
  `class_date` varchar(255) DEFAULT NULL,
  `s_pzipcode` varchar(10) DEFAULT NULL,
  `s_pcountry` varchar(20) DEFAULT NULL,
  `s_city` varchar(20) DEFAULT NULL,
  `s_pcity` varchar(20) DEFAULT NULL,
  `p_fname` varchar(30) DEFAULT NULL,
  `p_mname` varchar(30) DEFAULT NULL,
  `p_lname` varchar(30) DEFAULT NULL,
  `p_gender` varchar(10) DEFAULT NULL,
  `p_edu` varchar(50) DEFAULT NULL,
  `p_phone` varchar(25) DEFAULT NULL,
  `p_profession` varchar(60) DEFAULT NULL,
  `p_bloodgrp` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iti_wpsp_student`
--

INSERT INTO `iti_wpsp_student` (`sid`, `wp_usr_id`, `parent_wp_usr_id`, `batch_id`, `trade_id`, `current_unit_id`, `s_rollno`, `s_fname`, `s_mname`, `s_lname`, `s_dob`, `s_gender`, `s_address`, `s_paddress`, `s_country`, `s_zipcode`, `s_phone`, `s_bloodgrp`, `s_doj`, `class_id`, `class_date`, `s_pzipcode`, `s_pcountry`, `s_city`, `s_pcity`, `p_fname`, `p_mname`, `p_lname`, `p_gender`, `p_edu`, `p_phone`, `p_profession`, `p_bloodgrp`) VALUES
(9, 84, 0, 1, 1, 5, '1', 'Lakhan', '', 'Bhalerao', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '8698095030', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Ukhardu', '', 'Bhalerao', 'Male', '', NULL, '', ''),
(10, 87, 0, 1, 1, 5, '2', 'Pushpak', '', 'Bhangale', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '9561832623', '', '0000-00-00', 'a:1:{i:0;s:1:\"4\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Anil', '', 'Bhangale', 'Male', '', NULL, '', ''),
(11, 89, 0, 1, 1, 5, '3', 'Dhiraj', '', 'Bhangale', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '8625996705', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Sanjay', '', 'Bhangale', 'Male', '', NULL, '', ''),
(12, 91, 0, 1, 1, 5, '4', 'Aakash', '', 'Kaple', '0000-00-00', 'Male', 'At/P. Faizpur, Tal. Yawal, Dist Jalgaon', 'At/P. Faizpur, Tal. Yawal, Dist Jalgaon', 'India', '425503', '8956398957', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425503', 'India', 'Faizpur', 'Faizpur', 'Waman', '', 'Kaple', 'Male', '', NULL, '', ''),
(13, 93, 0, 1, 1, 5, '5', 'Rajeshkumar', '', 'Waykole', '0000-00-00', 'Male', 'At/P. Sangvi Bh, Tal. Yawal, Dist. Jalgaon', 'At/P. Sangvi Bh, Tal. Yawal, Dist. Jalgaon', 'India', '425304', '9923654816', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425304', 'India', 'Sangvi', 'Sangvi', 'Pramodbhai', '', 'Waykole', 'Male', '', NULL, '', ''),
(14, 94, 0, 1, 2, 6, '1', 'Devendra', '', 'Chaudhari', '0000-00-00', 'Male', 'At/P - Raver', 'At/P - Raver', 'India', '425505', '8805272249', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', 'a:1:{i:0;s:10:\"0000-00-00\";}', '425505', 'India', 'Raver', 'Raver', 'Bhaskar', '', 'Chaudhari', 'Male', '', NULL, '', ''),
(15, 95, 0, 1, 1, 5, '6', 'Vaibhav', '', 'Borole', '0000-00-00', 'Male', 'Vivre BK, Tal. Raver, Dist. Jalgaon', 'Vivre BK, Tal. Raver, Dist. Jalgaon', 'India', '425508', '7378324652', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425508', 'India', 'Vivre', 'Vivre', 'Kishor', '', 'Borole', 'Male', '', NULL, '', ''),
(16, 96, 0, 1, 2, 6, '2', 'Khilchand', '', 'Chaudhari', '0000-00-00', 'Male', 'At/P :- Savada', 'Savada', 'India', '425502', '9372692093', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425502', 'India', 'Savad', 'Savad', 'Pradip', '', 'Chaudhari', 'Male', '', NULL, '', ''),
(17, 97, 0, 1, 1, 5, '7', 'Vaibhav', '', 'Patil', '0000-00-00', 'Male', 'At/P. Utkhede, Tal. Raver, Dist. Jalgaon', 'At/P. Utkhede, Tal. Raver, Dist. Jalgaon', 'India', '425504', '9607223151', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425504', 'India', 'Utkhede', 'Utkhede', 'Natthu', '', 'Patil', 'Male', '', NULL, '', ''),
(18, 98, 0, 1, 1, 5, '8', 'Purvesh', '', 'Mahajan', '0000-00-00', 'Male', 'At/P. Vivre Bk, Tal. Raver, Dist. Jalgaon', 'At/P. Vivre Bk, Tal. Raver, Dist. Jalgaon', 'India', '425508', '8551884062', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425508', 'India', 'Vivre', 'Vivre', 'Sunil', '', 'Mahajan', 'Male', '', NULL, '', ''),
(19, 99, 0, 1, 1, 5, '9', 'Devesh', '', 'Nemade', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '7066283197', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Nemchand', '', 'Nemade', 'Male', '``', NULL, '', ''),
(20, 100, 0, 1, 2, 6, '3', 'Kunal', '', 'Zope', '0000-00-00', 'Male', 'At/P- Savada, Tal-Raver, Dist-Jalgaon', 'At/P- Savada, Tal-Raver, Dist-Jalgaon', 'India', '425502', '8551981544', '', '0000-00-00', 'a:1:{i:0;s:1:\"6\";}', '0', '425502', 'India', 'Savada', 'Savada', 'Chandrashekhar', '', 'Zope', 'Male', '', NULL, '', ''),
(21, 101, 0, 1, 2, 6, '4', 'Hemant', 'Rajendra', 'Koli', '0000-00-00', 'Male', 'At/P - Faizpur, Tal - Yawal, Dist - Jalgaon', 'At/P - Faizpur, Tal - Yawal, Dist - Jalgaon', 'India', '425503', '9372189571', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', 'a:1:{i:0;s:10:\"0000-00-00\";}', '425503', 'India', 'Faizpur', 'Faizpur', 'Rajendra', '', 'Koli', 'Male', '', NULL, '', ''),
(22, 102, 0, 1, 1, 5, '10', 'Vishal', '', 'Malvekar', '0000-00-00', 'Male', 'At/P. Vivre Bk, Tal. Raver, Dist. Jalgaon', 'At/P. Vivre Bk, Tal. Raver, Dist. Jalgaon', 'India', '425508', '7378732017', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425508', 'India', 'Vivre', 'Vivre', 'Hiraman', '', 'Malvekar', 'Male', '', NULL, '', ''),
(23, 103, 0, 1, 2, 6, '5', 'Chinmay', '', 'Nemade', '0000-00-00', 'Male', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'India', '425505', '9421523830', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', 'a:1:{i:0;s:0:\"\";}', '425505', 'India', 'Chinawal', 'Chinawal', 'Sudhakar', '', 'Nemade', 'Male', '', NULL, '', ''),
(24, 104, 0, 1, 1, 5, '11', 'Devayash', '', 'Tayade', '0000-00-00', 'Male', 'At/P. Kochur Bk, Tal. Raver Dist. Jalgaon', 'At/P. Kochur Bk, Tal. Raver Dist. Jalgaon', 'India', '425502', '7028891541', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425502', 'India', 'Kochur', 'Kochur', 'Supadu', '', 'Tayade', 'Male', '', NULL, '', ''),
(25, 105, 0, 1, 1, 5, '12', 'Chetan', '', 'Patil', '0000-00-00', 'Male', 'At/P. Vivre Bk, Tal. Raver, Dist. Jalgaon', 'At/P. Vivre Bk, Tal. Raver, Dist. Jalgaon', 'India', '425508', '9146103017', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425508', 'India', 'Vivre', 'Vivre', 'Vijay', '', 'Patil', 'Male', '', NULL, '', ''),
(26, 106, 0, 1, 2, 6, '6', 'Anant', '', 'Chaudhari', '2020-06-16', 'Male', 'At/P- Maskawad Bk, Tal -Raver, Dist - Jalgaon', 'At/P- Maskawad Bk, Tal -Raver, Dist - Jalgaon', 'India', '425502', '9067429201', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425502', 'India', 'Maskawad', 'Maskawad', 'Ravindra', '', 'Chaudhari', 'Male', '', NULL, '', ''),
(27, 107, 0, 1, 1, 5, '13', 'Tekchand', '', 'Nemade', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '9765940252', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Digambar', '', 'Nemade', 'Male', '', NULL, '', ''),
(28, 108, 0, 1, 2, 6, '7', 'Yugant', '', 'Patil', '0000-00-00', 'Male', 'Boharde Post -Therolae', 'Boharde Post -Therolae', 'India', '425508', '8329824912', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425508', 'India', 'Therolae', 'Therolae', '', '', '', 'Male', '', NULL, '', ''),
(29, 109, 0, 1, 1, 5, '14', 'Suraj', '', 'Kolambe', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '8411844239', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Dodhu', '', 'Kolambe', 'Male', '', NULL, '', ''),
(30, 110, 0, 1, 2, 6, '8', 'Kalpesh', '', 'Patil', '0000-00-00', 'Male', 'At/P - Borkhede Sim, Tal - Yawal, Dist - Jalgaon', 'At/P - Borkhede Sim, Tal - Yawal, Dist - Jalgaon', 'India', '425502', '9923574273', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425502', 'India', 'Borkhede', 'Borkhede', '', '', '', 'Male', '', NULL, '', ''),
(31, 111, 0, 1, 2, 6, '9', 'Sahil', '', 'Tadavi', '0000-00-00', 'Male', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'India', '425505', '8390005861', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Imoddin', '', 'Tadavi', 'Male', '', NULL, '', ''),
(32, 112, 0, 1, 1, 5, '15', 'Ashish', '', 'Bonde', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '8530450917', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Prakash', '', 'Bonde', 'Male', '', NULL, '', ''),
(33, 113, 0, 1, 2, 6, '10', 'Tejas', '', 'Patil', '0000-00-00', 'Male', 'At/P- Maskawad Bk, Tal -Raver, Dist - Jalgaon', 'At/P- Maskawad Bk, Tal -Raver, Dist - Jalgaon', 'India', '425502', '7798222675', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425502', 'India', 'Maskawad', 'Maskawad', 'Hemant', '', 'Patil', 'Male', '', NULL, '', ''),
(34, 114, 0, 1, 1, 5, '16', 'Ishwar', '', 'Hivare', '0000-00-00', 'Male', 'At/P. Rozoda,. Tal. Raver, Dist. Jalgaon', 'At/P. Rozoda,. Tal. Raver, Dist. Jalgaon', 'India', '425504', '7558496550', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425504', 'India', 'Rozoda', 'Rozoda', 'Padmakar', '', 'Hivare', 'Male', '', NULL, '', ''),
(35, 115, 0, 1, 2, 6, '11', 'Niraj', '', 'Ingale', '0000-00-00', 'Male', 'At/P - Faizpur, Tal - Yawal, Dist - Jalgaon', 'At/P - Faizpur, Tal - Yawal, Dist - Jalgaon', 'India', '425503', '7709803183', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425503', 'India', 'Faizpur', 'Faizpur', 'Hemraj', '', 'Ingale', 'Male', '', NULL, '', ''),
(36, 116, 0, 1, 1, 5, '17', 'Akash', '', 'Kahate', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '8317289008', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Sunil', '', 'Kahate', 'Male', '', NULL, '', ''),
(37, 117, 0, 1, 2, 6, '12', 'Shubham', '', 'Patil', '0000-00-00', 'Male', 'At/P - Boharde post - Theroale', 'At/P - Boharde post - Theroale', 'India', '425508', '7798673120', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425508', 'India', 'Theroale', 'Theroale', 'Prakash', '', 'Patil', 'Male', '', NULL, '', ''),
(38, 118, 0, 1, 1, 5, '18', 'Swapnil', '', 'Mahajan', '0000-00-00', 'Male', 'At/P. Raver, Tal. Raver, Dist. Jalgaon', 'At/P. Raver, Tal. Raver, Dist. Jalgaon', 'India', '425508', '8888647476', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425508', 'India', 'Raver', 'Raver', 'Anil', '', 'Mahajan', 'Male', '', NULL, '', ''),
(39, 119, 0, 1, 2, 6, '13', 'Suraj', '', 'Sapakale', '0000-00-00', 'Male', 'At/P- Maskawad Bk, Tal -Raver, Dist - Jalgaon', 'At/P- Maskawad Bk, Tal -Raver, Dist - Jalgaon', 'India', '425502', '9623387714', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425502', 'India', 'Maskawad', 'Maskawad', 'Manoj', '', 'Sapakale', 'Male', '', NULL, '', ''),
(40, 120, 0, 1, 1, 5, '19', 'Yugesh', '', 'Patil', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '9325268360', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Rajendra', '', 'Patil', 'Male', '', NULL, '', ''),
(41, 121, 0, 1, 2, 6, '14', 'Azheruddin', '', 'Shaikh', '0000-00-00', 'Male', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'India', '425505', '9130795870', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Iqramuddin', '', 'Shaikh', 'Male', '', NULL, '', ''),
(42, 122, 0, 1, 1, 5, '20', 'Hemant', '', 'Bhortakke', '0000-00-00', 'Male', 'At/P. Jalgaon.', 'At/P. Jalgaon.', 'India', '425004', '9834517741', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425004', 'India', 'Jalgaon', 'Jalgaon', 'Chandrashekhar', '', 'Bhortakke', 'Male', '', NULL, '', ''),
(43, 123, 0, 1, 2, 6, '15', 'Jayesh', '', 'Nemade', '0000-00-00', 'Male', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'India', '425505', '9146461204', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Digamber', '', 'Nemade', 'Male', '', NULL, '', ''),
(44, 124, 0, 1, 2, 6, '16', 'Toshal', '', 'Patil', '0000-00-00', 'Male', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'India', '425505', '9370701500', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Sanjay', '', 'Patil', 'Male', '', NULL, '', ''),
(45, 125, 0, 1, 1, 5, '21', 'Rupesh', '', 'Kapale', '0000-00-00', 'Male', 'At/P. Amode, Tal. Raver, Dist.Jalgaon', 'At/P. Amode, Tal. Raver, Dist.Jalgaon', 'India', '425524', '8600430924', '', '2020-06-16', 'a:1:{i:0;s:1:\"4\";}', '0', '425524', 'India', 'Amode', 'Amode', 'Arun', '', 'Kapale', 'Male', '', NULL, '', ''),
(46, 126, 0, 1, 2, 6, '17', 'Shahid Khan', '', 'Khan', '0000-00-00', 'Male', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'At/p - Chinawal, Tal - Raver, Dist - Jalgaon', 'India', '425505', '8408891080', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Akram Khan', '', 'Khan', 'Male', '', NULL, '', ''),
(47, 127, 0, 1, 2, 6, '21', 'Amit', '', 'Zope', '0000-00-00', 'Male', 'At/P. Savda, Tal. Raver, Dist. Jalgaon', 'At/P. Savda, Tal. Raver, Dist. Jalgaon', 'India', '425502', '9730122346', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425502', 'India', 'Savda', 'Savda', 'Jaywant', '', 'Zope', 'Male', '', NULL, '', ''),
(48, 128, 0, 1, 2, 6, '20', 'Shaikh Moin', '', 'Shaikh', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '9970788650', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Shaikh Irfan', '', 'Shaikh', 'Male', '', NULL, '', ''),
(49, 129, 0, 1, 2, 6, '19', 'Shaikh Shaheed', '', 'Manyar', '0000-00-00', 'Male', 'At/P. Amode, Tal. Yawal, Dist. Jalgaom', 'At/P. Amode, Tal. Yawal, Dist. Jalgaom', 'India', '425524', '9766451380', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425524', 'India', 'Amode', 'Amode', 'Shaikh Saleem', '', 'Manyar', 'Male', '', NULL, '', ''),
(50, 130, 0, 1, 2, 6, '18', 'Nikhil', '', 'Mahajan', '0000-00-00', 'Male', 'At/P. Savda, Tal. Raver, Dist Jalgaon', 'At/P. Savda, Tal. Raver, Dist Jalgaon', 'India', '425502', '9420387042', '', '2020-06-16', 'a:1:{i:0;s:1:\"6\";}', '0', '425502', 'India', 'Savda', 'Savda', 'Yuvraj', '', 'Mahajan', 'Male', '', NULL, '', ''),
(51, 131, 0, 2, 1, 4, '1', 'Aasif', '', 'Tadavi', '0000-00-00', 'Male', 'At/P. Wadgaon, Tal. Raver, Dist. Jalgaon', 'At/P. Wadgaon, Tal. Raver, Dist. Jalgaon', 'India', '0', '7020465324', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Wadgaon', 'Wadgaon', 'Maheboob', '', 'Tadavi', 'Male', '', NULL, '', ''),
(52, 132, 0, 2, 1, 4, '2', 'Paresh', '', 'Chaudhari', '0000-00-00', 'Male', 'At/P. Kochur, Tal. Raver, Dist. Jalgaon', 'At/P. Kochur, Tal. Raver, Dist. Jalgaon', 'India', '0', '7498668452', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Kochur', 'Kochur', 'Baburao', '', 'Chaudhari', 'Male', '', NULL, '', ''),
(53, 133, 0, 2, 1, 4, '3', 'Nikhil', '', 'Mahajan', '0000-00-00', 'Male', 'At/P. Mothe Waghoda, Tal. Raver, Dist Jalgaon', 'At/P. Mothe Waghoda, Tal. Raver, Dist Jalgaon', 'India', '0', '9588656619', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Mothe Waghoda', 'Mothe Waghoda', 'Sunil', '', 'Mahajan', 'Male', '', NULL, '', ''),
(54, 134, 0, 2, 1, 4, '4', 'Vishal', '', 'Pachapole', '0000-00-00', 'Male', 'Dhangar Wada, At/P. Savkheda, Tal. Raver, Dist. Jalgaon', 'Dhangar Wada, At/P. Savkheda, Tal. Raver, Dist. Jalgaon', 'India', '0', '9588670216', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Savkheda', 'Savkheda', 'Bharat', '', 'Pachapole', 'Male', '', NULL, '', ''),
(55, 135, 0, 2, 1, 4, '5', 'Nikhil', '', 'Gayakwad', '0000-00-00', 'Male', 'Mahadev Wada, At/P. Vivre, Tal. Raver, Dist. Jalgaon', 'Mahadev Wada, At/P. Vivre, Tal. Raver, Dist. Jalgaon', 'India', '0', '7517903742', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Vivre', 'Vivre', 'Gajanan', '', 'Gayakwad', 'Male', '', NULL, '', ''),
(56, 136, 0, 2, 1, 4, '6', 'Hemant', '', 'Gayakwad', '0000-00-00', 'Male', 'Mahadev Wada, At/P. Vivre, Tal. Raver, Dist. Jalgaon', 'Mahadev Wada, At/P. Vivre, Tal. Raver, Dist. Jalgaon', 'India', '0', '9370997016', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Vivre', 'Vivre', 'Raju', '', 'Gayakwad', 'Male', '', NULL, '', ''),
(57, 137, 0, 2, 1, 4, '7', 'Harshal', '', 'Sapkale', '0000-00-00', 'Male', 'Wan-Galli, At/P. Chinawal, Tal. Raver, Dist. Jalgaon', 'Wan-Galli, At/P. Chinawal, Tal. Raver, Dist. Jalgaon', 'India', '425505', '8459330137', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Vinod', '', 'Sapkale', 'Male', '', NULL, '', ''),
(58, 138, 0, 2, 1, 4, '8', 'Bharat', '', 'Nemade', '0000-00-00', 'Male', 'Gavat Bazar, At/P. Savda, Tal. Raver, Dist. Jalgaon', 'Gavat Bazar, At/P. Savda, Tal. Raver, Dist. Jalgaon', 'India', '0', '7709702205', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Savda', 'Savda', 'Mohan', '', 'Nemade', 'Male', '', NULL, '', ''),
(59, 139, 0, 2, 1, 4, '9', 'Jayesh', '', 'Badhe', '0000-00-00', 'Male', 'At/P. Savkheda, Tal. Raver, Dist. Jalgaon', 'At/P. Savkheda, Tal. Raver, Dist. Jalgaon', 'India', '0', '9970220839', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Savkheda', 'Savkheda', 'Vijay', '', 'Badhe', 'Male', '', NULL, '', ''),
(60, 140, 0, 2, 1, 4, '10', 'Mayur', '', 'Mahajan', '0000-00-00', 'Male', 'At/P. Savkheda, Tal. Raver, Dist. Jalgaon', 'At/P. Savkheda, Tal. Raver, Dist. Jalgaon', 'India', '0', '9175606350', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Savkheda', 'Savkheda', 'Murlidhar', '', 'Mahajan', 'Male', '', NULL, '', ''),
(61, 141, 0, 2, 1, 4, '11', 'Shaikh Abutalha', '', 'Shaikh Yusuf', '0000-00-00', 'Male', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '9370357325', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Shaikh Yusuf', '', '', 'Male', '', NULL, '', ''),
(62, 142, 0, 2, 1, 4, '12', 'Hemant', '', 'Nemade', '0000-00-00', 'Male', 'Rozoda Road, At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'Rozoda Road, At/P. Chinawal, Tal. Raver Dist. Jalgaon', 'India', '425505', '7666871604', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Laxman', '', 'Nemade', 'Male', '', NULL, '', ''),
(63, 143, 0, 2, 1, 4, '13', 'Chandrasing', '', 'Chavhan', '0000-00-00', 'Male', 'At/P, Kumbharkheda, Tal. Raver, Dist. Jalgaon', 'At/P, Kumbharkheda, Tal. Raver, Dist. Jalgaon', 'India', '0', '7770092111', '', '2020-06-17', 'a:1:{i:0;s:1:\"5\";}', '0', '0', 'India', 'Kumbharkheda', 'Kumbharkheda', 'Gokul', '', 'Chavhan', 'Male', '', NULL, '', ''),
(64, 144, 0, 2, 2, 7, '1', 'Pranay', '', 'Joshi', '0000-00-00', 'Male', 'Shiv Colony, At/P. Faizpur, Tal. Raver, Dist. Jalgaon', 'Shiv Colony, At/P. Faizpur, Tal. Raver, Dist. Jalgaon', 'India', '0', '7709928975', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Faizpur', 'Faizpur', 'Ramesh', '', 'Joshi', 'Male', '', NULL, '', ''),
(65, 145, 0, 2, 2, 7, '2', 'Roshan', '', 'Kolhe', '0000-00-00', 'Male', 'Gramin Rugnalaya Sarkari Quarte, At/P. Raver, Dist. Jalgaon', 'Gramin Rugnalaya Sarkari Quarte, At/P. Raver, Dist. Jalgaon', 'India', '0', '7888239932', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Raver', 'Raver', 'Chhagan', '', 'Kolhe', 'Male', '', NULL, '', ''),
(66, 146, 0, 2, 2, 7, '3', 'Mohan', '', 'Aadhav', '0000-00-00', 'Male', 'Dakshin Baher Peth, At/P. Faizpur, Tal. Yawal, Dist. Jalgaon', 'Dakshin Baher Peth, At/P. Faizpur, Tal. Yawal, Dist. Jalgaon', 'India', '0', '9834441012', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Faizpur', 'Faizpur', 'Jagan', '', 'Aadhav', 'Male', '', NULL, '', ''),
(67, 147, 0, 2, 2, 7, '4', 'Dipak', '', 'Chaudhari', '0000-00-00', 'Male', 'At/P. Morgaon, Tal. Raver, Dist. Jalgaon', 'At/P. Morgaon, Tal. Raver, Dist. Jalgaon', 'India', '0', '9309156170', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Morgaon', 'Morgaon', 'Kishor', '', 'Chaudhari', 'Male', '', NULL, '', ''),
(68, 148, 0, 2, 2, 7, '5', 'Manish', '', 'Tayade', '0000-00-00', 'Male', 'Swami Narayan Nagar, At/P. Savda, Tal. raver, Dist. Jalgaon', 'Swami Narayan Nagar, At/P. Savda, Tal. raver, Dist. Jalgaon', 'India', '0', '8080058332', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Savda', 'Savda', 'Purushottam', '', 'Tayade', 'Male', '', NULL, '', ''),
(69, 149, 0, 2, 2, 7, '6', 'Bhairav', '', 'Bonde', '0000-00-00', 'Male', 'Bonde Wada, At/P. Bamnod, Tal. Yawal, Dist. Jalgaon', 'Bonde Wada, At/P. Bamnod, Tal. Yawal, Dist. Jalgaon', 'India', '0', '8668308342', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Bamnod', 'Bamnod', 'Atul', '', 'Bonde', 'Male', '', NULL, '', ''),
(70, 150, 0, 2, 2, 7, '7', 'Gaurav', '', 'Chaudhari', '0000-00-00', 'Male', 'At/P. Munjalwadi, Tal. Raver, Dist. jalgaon', 'At/P. Munjalwadi, Tal. Raver, Dist. jalgaon', 'India', '0', '8805809754', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Munjalwadi', 'Munjalwadi', 'Gokul', '', 'Chaudhari', 'Male', '', NULL, '', ''),
(71, 151, 0, 2, 2, 7, '8', 'Noman Baig', '', 'Jabir Baig', '0000-00-00', 'Male', 'Raza Nagar, At/P. Khirdi, Tal. Raver, Dist. Jalgaon', 'Raza Nagar, At/P. Khirdi, Tal. Raver, Dist. Jalgaon', 'India', '0', '9175605758', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Khirdi', 'Khirdi', 'Jabir Baig', '', '', 'Male', '', NULL, '', ''),
(72, 152, 0, 2, 2, 7, '9', 'Jayesh', '', 'Kolhe', '0000-00-00', 'Male', 'At/P. Pimprud post Faizpur Tal. Yawal, Dist. jalgaon', 'At/P. Pimprud post Faizpur Tal. Yawal, Dist. jalgaon', 'India', '0', '7083809523', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Faizpur', 'Faizpur', 'Kiran', '', 'Kolhe', 'Male', '', NULL, '', ''),
(73, 153, 0, 2, 2, 7, '10', 'Rohit', '', 'Harankar', '0000-00-00', 'Male', 'Kumbhar wada, At/P, Vivra, Tal. Raver, Dist. Jalgaon', 'Kumbhar wada, At/P, Vivra, Tal. Raver, Dist. Jalgaon', 'India', '0', '9834260253', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Vivra', 'Vivra', 'Santosh', '', 'Harankar', 'Male', '', NULL, '', ''),
(74, 154, 0, 2, 2, 7, '11', 'Durgesh', '', 'Dhangar', '0000-00-00', 'Male', '810 Beghar Plot, At/P. Vivra, Tal. raver, Dist. Jalgaon', '810 Beghar Plot, At/P. Vivra, Tal. raver, Dist. Jalgaon', 'India', '0', '9049746966', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Vivra', 'Vivra', 'Santosh', '', 'Dhangar', 'Male', '', NULL, '', ''),
(75, 155, 0, 2, 2, 7, '12', 'Satish', '', 'Patil', '0000-00-00', 'Male', 'At/P. Morgaon, Tal. Raver, Dist. Jalgaon', 'At/P. Morgaon, Tal. Raver, Dist. Jalgaon', 'India', '0', '7066075578', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Morgaon', 'Morgaon', 'Arun', '', 'Patil', 'Male', '', NULL, '', ''),
(76, 156, 0, 2, 2, 7, '13', 'Vinaygir', '', 'Gosavi', '0000-00-00', 'Male', 'At/P. Savda Kazipura, Tal. Raver, Dist. Jalgaon', 'At/P. Savda Kazipura, Tal. Raver, Dist. Jalgaon', 'India', '0', '9325940306', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Savda', 'Savda', 'Nimbagir', '', 'Gosavi', 'Male', '', NULL, '', ''),
(77, 157, 0, 2, 2, 7, '14', 'Kuldip', '', 'Mahajan', '0000-00-00', 'Male', 'At/P. Waghoda BK, Tal. Raver, Dist. Jalgaon', 'At/P. Waghoda BK, Tal. Raver, Dist. Jalgaon', 'India', '0', '7798771869', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Waghoda', 'Waghoda', 'Suresh', '', 'Mahajan', 'Male', '', NULL, '', ''),
(78, 158, 0, 2, 2, 7, '15', 'Ganesh', '', 'Patil', '0000-00-00', 'Male', 'At/P. Vivra, Tal. Raver, Dist. Jalgaon', 'At/P. Vivra, Tal. Raver, Dist. Jalgaon', 'India', '0', '9601733767', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Vivra', 'Vivra', 'Vinod', '', 'Patil', 'Male', '', NULL, '', ''),
(79, 159, 0, 2, 2, 7, '16', 'Vivek', '', 'Bonde', '0000-00-00', 'Male', 'At/P. Kumbharkheda, Tal. Raver, Dist. Jalgaon', 'At/P. Kumbharkheda, Tal. Raver, Dist. Jalgaon', 'India', '0', '8412945623', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Kumbharkheda', 'Kumbharkheda', 'Vivek', '', 'Bonde', 'Male', '', NULL, '', ''),
(80, 160, 0, 2, 2, 7, '17', 'Mohit', '', 'Warke', '0000-00-00', 'Male', 'Patil Wada, At/P. Chinawal, Tal. Raver, Dist. Jalgaon', 'Patil Wada, At/P. Chinawal, Tal. Raver, Dist. Jalgaon', 'India', '425505', '7498471801', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Raju', '', 'Warke', 'Male', '', NULL, '', ''),
(81, 161, 0, 2, 2, 7, '18', 'Thekuchand', '', 'Nemade', '0000-00-00', 'Male', 'Rozoda Road Near ITI, At/P. Chinawal, Tal. Raver, Dist. Jalgaon', 'Rozoda Road Near ITI, At/P. Chinawal, Tal. Raver, Dist. Jalgaon', 'India', '0', '8999237785', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Chinawal', 'Chinawal', 'Anil', '', 'Nemade', 'Male', '', NULL, '', ''),
(82, 162, 0, 2, 2, 7, '19', 'Vipul', '', 'Chaudhari', '0000-00-00', 'Male', 'Amoda Road, Viroda, At/P. Viroda, Tal.Yawal, Dist. Jalgaon', 'Amoda Road, Viroda, At/P. Viroda, Tal.Yawal, Dist. Jalgaon', 'India', '0', '9503498729', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '0', 'India', 'Viroda', 'Viroda', 'Liladhar', '', 'Chaudhari', 'Male', '', NULL, '', ''),
(83, 163, 0, 2, 2, 7, '20', 'Gunawant', '', 'Nemade', '0000-00-00', 'Male', '1645 Waghoda Road, At/P. Chinawal, Tal. Raver, Dist. Jalgaon', '1645 Waghoda Road, At/P. Chinawal, Tal. Raver, Dist. Jalgaon', 'India', '425505', '8530353252', '', '2020-06-17', 'a:1:{i:0;s:1:\"7\";}', '0', '425505', 'India', 'Chinawal', 'Chinawal', 'Pravin', '', 'Nemade', 'Male', '', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_subject`
--

CREATE TABLE `iti_wpsp_subject` (
  `id` int(15) NOT NULL,
  `sub_code` varchar(8) DEFAULT NULL,
  `class_id` int(15) DEFAULT NULL,
  `trade_id` int(11) NOT NULL,
  `year_or_semester_no` int(11) NOT NULL,
  `sub_name` varchar(60) DEFAULT NULL,
  `sub_teach_id` varchar(15) DEFAULT NULL,
  `book_name` varchar(60) DEFAULT NULL,
  `sub_desc` varchar(250) DEFAULT NULL,
  `max_mark` int(4) DEFAULT NULL,
  `pass_mark` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iti_wpsp_subject`
--

INSERT INTO `iti_wpsp_subject` (`id`, `sub_code`, `class_id`, `trade_id`, `year_or_semester_no`, `sub_name`, `sub_teach_id`, `book_name`, `sub_desc`, `max_mark`, `pass_mark`) VALUES
(34, 'FJ-1', NULL, 1, 1, 'Trade Theory', NULL, NULL, NULL, NULL, NULL),
(35, 'FJ-2', NULL, 1, 1, 'Trade Practicle', NULL, NULL, NULL, NULL, NULL),
(36, 'FJ-3', NULL, 1, 1, 'Workshop Calculation and Science', NULL, NULL, NULL, NULL, NULL),
(37, 'FJ-4', NULL, 1, 1, 'Employability Skill', NULL, NULL, NULL, NULL, NULL),
(38, 'FJ-5', NULL, 1, 1, 'Engineering drawing', NULL, NULL, NULL, NULL, NULL),
(39, 'FS-1', NULL, 1, 2, 'Trade Theory', NULL, NULL, NULL, NULL, NULL),
(40, 'FS-2', NULL, 1, 2, 'Trade Practicle', NULL, NULL, NULL, NULL, NULL),
(41, 'FS-3', NULL, 1, 2, 'Workshop Calculation and Science', NULL, NULL, NULL, NULL, NULL),
(42, 'FS-4', NULL, 1, 2, 'Employability Skill', NULL, NULL, NULL, NULL, NULL),
(43, 'FS-5', NULL, 1, 2, 'Engineering drawing', NULL, NULL, NULL, NULL, NULL),
(44, 'EJ-1', NULL, 2, 1, 'Trade Theory', NULL, NULL, NULL, NULL, NULL),
(45, 'EJ-2', NULL, 2, 1, 'Trade Practicle', NULL, NULL, NULL, NULL, NULL),
(46, 'EJ-3', NULL, 2, 1, 'Workshop Calculation and Science', NULL, NULL, NULL, NULL, NULL),
(47, 'EJ-4', NULL, 2, 1, 'Employability Skill', NULL, NULL, NULL, NULL, NULL),
(48, 'EJ-5', NULL, 2, 1, 'Engineering drawing', NULL, NULL, NULL, NULL, NULL),
(49, 'ES-1', NULL, 2, 2, 'Trade Theory', NULL, NULL, NULL, NULL, NULL),
(50, 'ES-2', NULL, 2, 2, 'Trade Practicle', NULL, NULL, NULL, NULL, NULL),
(51, 'ES-3', NULL, 2, 2, 'Workshop Calculation and Science', NULL, NULL, NULL, NULL, NULL),
(52, 'ES-4', NULL, 2, 2, 'Employability Skill', NULL, NULL, NULL, NULL, NULL),
(53, 'ES-5', NULL, 2, 2, 'Engineering drawing', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_subject_instructors`
--

CREATE TABLE `iti_wpsp_subject_instructors` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `year_or_semester_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `iti_wpsp_subject_instructors`
--

INSERT INTO `iti_wpsp_subject_instructors` (`id`, `subject_id`, `instructor_id`, `unit_id`, `trade_id`, `year_or_semester_no`) VALUES
(1, 34, 13, 4, 1, 1),
(2, 35, 13, 4, 1, 1),
(3, 36, 16, 4, 1, 1),
(4, 37, 1, 4, 1, 1),
(5, 38, 16, 4, 1, 1),
(6, 39, 12, 5, 1, 2),
(7, 40, 12, 5, 1, 2),
(8, 41, 16, 5, 1, 2),
(9, 42, 1, 5, 1, 2),
(10, 43, 16, 5, 1, 2),
(11, 44, 14, 6, 2, 2),
(12, 45, 14, 6, 2, 2),
(13, 46, 16, 6, 2, 2),
(14, 47, 1, 6, 2, 2),
(15, 48, 16, 6, 2, 2),
(16, 44, 15, 7, 2, 1),
(17, 45, 15, 7, 2, 1),
(18, 46, 16, 7, 2, 1),
(19, 47, 1, 7, 2, 1),
(20, 48, 16, 7, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_syllabus`
--

CREATE TABLE `iti_wpsp_syllabus` (
  `id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_syllabus`
--

INSERT INTO `iti_wpsp_syllabus` (`id`, `file_id`, `trade_id`, `name`) VALUES
(1, 1, 1, 'CTS Fitter - 2017');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_teacher`
--

CREATE TABLE `iti_wpsp_teacher` (
  `tid` int(11) NOT NULL,
  `wp_usr_id` bigint(20) DEFAULT NULL,
  `designation_id` smallint(6) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `empcode` varchar(60) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `dol` date DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `qualification` varchar(25) DEFAULT NULL,
  `gender` varchar(12) DEFAULT NULL,
  `bloodgrp` varchar(5) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `whours` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iti_wpsp_teacher`
--

INSERT INTO `iti_wpsp_teacher` (`tid`, `wp_usr_id`, `designation_id`, `first_name`, `middle_name`, `last_name`, `zipcode`, `country`, `city`, `address`, `empcode`, `dob`, `doj`, `dol`, `phone`, `qualification`, `gender`, `bloodgrp`, `position`, `whours`) VALUES
(1, 52, 1, 'Virendrakumar', 'Keshav', 'Bhangale', '425505', 'India', 'Chinawal', 'Chinawal, Tal- Raver, Dist-Jalgaon', '1', '1965-10-10', '2020-06-15', '0000-00-00', '9527959608', 'Mechanical Diploma', 'Male', 'B+', 'Principal', '8'),
(12, 80, 3, 'Sandip', 'Trambak', 'Chaudhari', '425505', 'India', 'Chinawal', 'At/P - Chinawal, Tal - Raver, Dist-Jalgaon', '2', '1974-06-05', '2020-06-01', '0000-00-00', '8600861739', 'C T I', 'Male', 'B+', 'Fitter Lecturer', '8'),
(13, 81, 3, 'Saraju', 'Govinda', 'Hole', '425505', 'India', 'Chinawal', 'At/P - Chinawal, Tal - Raver, Dist-Jalgaon', '3', '1977-02-14', '2020-06-16', '0000-00-00', '9561434539', 'N. C. V. T .(FITTER)', 'Male', 'O+', 'Fitter Lecturer', '8'),
(14, 82, 3, 'Rajesh', 'Dhanaji', 'Ingale', '411045', 'India', 'Chinawal', 'At/P - Chinawal, Tal - Raver, Dist-Jalgaon', '4', '0000-00-00', '2020-06-16', '0000-00-00', '9423974227', 'D. E. E', 'Male', '', 'Electrician Lecturer', '8'),
(15, 83, 3, 'Rahul', 'Ravindra', 'Mahajan', '425505', 'India', 'Chinawal', 'At/P - Chinawal, Tal - Raver, Dist-Jalgaon', '5', '0000-00-00', '2020-06-16', '0000-00-00', '8928547720', 'D. E. E.', 'Male', '', 'Electrician Lecturer', '8'),
(16, 85, 3, 'Vinod', 'Vasant', 'Patil', '425505', 'India', 'Chinawal', 'At/P - Chinawal, Tal - Raver, Dist-Jalgaon', '6', '0000-00-00', '2020-06-16', '0000-00-00', '7507001301', 'D. M. E.', 'Male', '', 'Mathematics and Drawing', '8'),
(17, 86, 2, 'Vaibhav', 'Vasant', 'Mahajan', '425505', 'India', 'Chinawal', 'At/P - Chinawal, Tal - Raver, Dist-Jalgaon', '7', '1994-10-13', '2020-06-16', '0000-00-00', '9890361298', 'I T I, B Com', 'Male', 'AB+', 'Clerk', '8'),
(18, 88, 4, 'Yogesh', 'Pralhad', 'Chaudhari', '425505', 'India', 'Chinawal', 'At/P - Chinawal, Tal - Raver, Dist-Jalgaon', '8', '0000-00-00', '0000-00-00', '0000-00-00', '7875535639', 'I T I', 'Male', '', 'Workshop Helper', '8'),
(19, 90, 0, 'Ramesh', 'Shridhar', 'Bharambe', '425505', 'India', 'Chinawal', 'At/P - Chinawal, Tal - Raver, Dist-Jalgaon', '9', '0000-00-00', '2020-06-16', '0000-00-00', '9404050540', 'M. S. C', 'Male', '', 'Peon', '8'),
(20, 92, 0, 'Arun', 'Hari', 'Mahajan', '425505', 'India', 'Chinawal', 'At/P - Chinawal, Tal - Raver, Dist-Jalgaon', '10', '0000-00-00', '2020-06-16', '0000-00-00', '9146521252', 'NA', 'Male', '', 'Watch Men', '8');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_teacher_attendance`
--

CREATE TABLE `iti_wpsp_teacher_attendance` (
  `id` bigint(11) NOT NULL,
  `teacher_id` bigint(11) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `reason` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_teacher_batches`
--

CREATE TABLE `iti_wpsp_teacher_batches` (
  `id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_temp`
--

CREATE TABLE `iti_wpsp_temp` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(255) DEFAULT NULL,
  `t_username` varchar(255) DEFAULT NULL,
  `t_email` varchar(255) DEFAULT NULL,
  `t_password` varchar(255) DEFAULT NULL,
  `t_type` varchar(255) NOT NULL,
  `t_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_timetable`
--

CREATE TABLE `iti_wpsp_timetable` (
  `id` int(15) UNSIGNED NOT NULL,
  `class_id` int(10) NOT NULL,
  `time_id` int(10) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `session_id` int(10) NOT NULL,
  `day` int(2) NOT NULL,
  `heading` text,
  `is_active` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_trades`
--

CREATE TABLE `iti_wpsp_trades` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_years` smallint(6) NOT NULL,
  `duration` smallint(6) NOT NULL,
  `trade_pattern` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `published_on` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_on` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_trades`
--

INSERT INTO `iti_wpsp_trades` (`id`, `name`, `number_of_years`, `duration`, `trade_pattern`, `created_by`, `created_on`, `published_on`, `deleted_by`, `deleted_on`) VALUES
(1, 'Fitter', 0, 2, 'year', 1, '2020-06-27 11:15:37', '2020-06-27 11:15:37', NULL, NULL),
(2, 'Electrician', 0, 2, 'year', 1, '2020-06-27 11:15:37', '2020-06-27 11:15:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_trainee_attendances`
--

CREATE TABLE `iti_wpsp_trainee_attendances` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_type_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `reason` text CHARACTER SET utf8mb4,
  `attendance_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_trainee_attendances`
--

INSERT INTO `iti_wpsp_trainee_attendances` (`id`, `student_id`, `attendance_type_id`, `instructor_id`, `reason`, `attendance_date`) VALUES
(1, 9, 2, 12, '', '2020-06-01 00:00:00'),
(2, 10, 2, 12, '', '2020-06-01 00:00:00'),
(3, 11, 1, 12, '', '2020-06-01 00:00:00'),
(4, 12, 1, 12, '', '2020-06-01 00:00:00'),
(5, 13, 1, 12, '', '2020-06-01 00:00:00'),
(6, 15, 1, 12, '', '2020-06-01 00:00:00'),
(7, 17, 1, 12, '', '2020-06-01 00:00:00'),
(8, 18, 1, 12, '', '2020-06-01 00:00:00'),
(9, 19, 1, 12, '', '2020-06-01 00:00:00'),
(10, 22, 1, 12, '', '2020-06-01 00:00:00'),
(11, 24, 1, 12, '', '2020-06-01 00:00:00'),
(12, 25, 1, 12, '', '2020-06-01 00:00:00'),
(13, 27, 1, 12, '', '2020-06-01 00:00:00'),
(14, 29, 1, 12, '', '2020-06-01 00:00:00'),
(15, 32, 1, 12, '', '2020-06-01 00:00:00'),
(16, 34, 1, 12, '', '2020-06-01 00:00:00'),
(17, 36, 1, 12, '', '2020-06-01 00:00:00'),
(18, 38, 1, 12, '', '2020-06-01 00:00:00'),
(19, 40, 1, 12, '', '2020-06-01 00:00:00'),
(20, 42, 1, 12, '', '2020-06-01 00:00:00'),
(21, 45, 1, 12, '', '2020-06-01 00:00:00'),
(22, 14, 1, 14, '', '2019-08-02 00:00:00'),
(23, 16, 1, 14, '', '2019-08-02 00:00:00'),
(24, 20, 1, 14, '', '2019-08-02 00:00:00'),
(25, 21, 1, 14, '', '2019-08-02 00:00:00'),
(26, 23, 1, 14, '', '2019-08-02 00:00:00'),
(27, 26, 4, 14, '', '2019-08-02 00:00:00'),
(28, 28, 1, 14, '', '2019-08-02 00:00:00'),
(29, 30, 1, 14, '', '2019-08-02 00:00:00'),
(30, 31, 1, 14, '', '2019-08-02 00:00:00'),
(31, 33, 1, 14, '', '2019-08-02 00:00:00'),
(32, 35, 1, 14, '', '2019-08-02 00:00:00'),
(33, 37, 1, 14, '', '2019-08-02 00:00:00'),
(34, 39, 1, 14, '', '2019-08-02 00:00:00'),
(35, 41, 1, 14, '', '2019-08-02 00:00:00'),
(36, 43, 1, 14, '', '2019-08-02 00:00:00'),
(37, 44, 1, 14, '', '2019-08-02 00:00:00'),
(38, 46, 1, 14, '', '2019-08-02 00:00:00'),
(39, 47, 1, 14, '', '2019-08-02 00:00:00'),
(40, 48, 1, 14, '', '2019-08-02 00:00:00'),
(41, 49, 1, 14, '', '2019-08-02 00:00:00'),
(42, 50, 1, 14, '', '2019-08-02 00:00:00'),
(43, 14, 1, 14, '', '2020-07-02 00:00:00'),
(44, 16, 1, 14, '', '2020-07-02 00:00:00'),
(45, 20, 1, 14, '', '2020-07-02 00:00:00'),
(46, 21, 1, 14, '', '2020-07-02 00:00:00'),
(47, 23, 1, 14, '', '2020-07-02 00:00:00'),
(48, 26, 1, 14, '', '2020-07-02 00:00:00'),
(49, 28, 1, 14, '', '2020-07-02 00:00:00'),
(50, 30, 1, 14, '', '2020-07-02 00:00:00'),
(51, 31, 1, 14, '', '2020-07-02 00:00:00'),
(52, 33, 1, 14, '', '2020-07-02 00:00:00'),
(53, 35, 1, 14, '', '2020-07-02 00:00:00'),
(54, 37, 1, 14, '', '2020-07-02 00:00:00'),
(55, 39, 1, 14, '', '2020-07-02 00:00:00'),
(56, 41, 1, 14, '', '2020-07-02 00:00:00'),
(57, 43, 1, 14, '', '2020-07-02 00:00:00'),
(58, 44, 1, 14, '', '2020-07-02 00:00:00'),
(59, 46, 2, 14, '', '2020-07-02 00:00:00'),
(60, 47, 1, 14, '', '2020-07-02 00:00:00'),
(61, 48, 1, 14, '', '2020-07-02 00:00:00'),
(62, 49, 4, 14, 'injuward', '2020-07-02 00:00:00'),
(63, 50, 1, 14, '', '2020-07-02 00:00:00'),
(79, 14, 1, 14, '', '2020-07-01 00:00:00'),
(80, 16, 1, 14, '', '2020-07-01 00:00:00'),
(83, 20, 1, 14, '', '2020-07-01 00:00:00'),
(84, 21, 1, 14, '', '2020-07-01 00:00:00'),
(86, 23, 1, 14, '', '2020-07-01 00:00:00'),
(89, 26, 1, 14, '', '2020-07-01 00:00:00'),
(90, 28, 1, 14, '', '2020-07-01 00:00:00'),
(92, 30, 1, 14, '', '2020-07-01 00:00:00'),
(93, 31, 1, 14, '', '2020-07-01 00:00:00'),
(94, 33, 1, 14, '', '2020-07-01 00:00:00'),
(95, 35, 1, 14, '', '2020-07-01 00:00:00'),
(96, 37, 1, 14, '', '2020-07-01 00:00:00'),
(97, 39, 1, 14, '', '2020-07-01 00:00:00'),
(98, 41, 1, 14, '', '2020-07-01 00:00:00'),
(99, 43, 1, 14, '', '2020-07-01 00:00:00'),
(100, 44, 1, 14, '', '2020-07-01 00:00:00'),
(101, 46, 1, 14, '', '2020-07-01 00:00:00'),
(102, 47, 1, 14, '', '2020-07-01 00:00:00'),
(103, 48, 1, 14, '', '2020-07-01 00:00:00'),
(104, 49, 5, 14, 'injuward', '2020-07-01 00:00:00'),
(105, 50, 1, 14, '', '2020-07-01 00:00:00'),
(127, 9, 1, 12, '', '2019-08-03 00:00:00'),
(128, 10, 1, 12, '', '2019-08-03 00:00:00'),
(129, 11, 1, 12, '', '2019-08-03 00:00:00'),
(130, 12, 1, 12, '', '2019-08-03 00:00:00'),
(131, 13, 1, 12, '', '2019-08-03 00:00:00'),
(132, 15, 1, 12, '', '2019-08-03 00:00:00'),
(133, 17, 1, 12, '', '2019-08-03 00:00:00'),
(134, 18, 1, 12, '', '2019-08-03 00:00:00'),
(135, 19, 1, 12, '', '2019-08-03 00:00:00'),
(136, 22, 1, 12, '', '2019-08-03 00:00:00'),
(137, 24, 1, 12, '', '2019-08-03 00:00:00'),
(138, 25, 1, 12, '', '2019-08-03 00:00:00'),
(139, 27, 1, 12, '', '2019-08-03 00:00:00'),
(140, 29, 1, 12, '', '2019-08-03 00:00:00'),
(141, 32, 1, 12, '', '2019-08-03 00:00:00'),
(142, 34, 1, 12, '', '2019-08-03 00:00:00'),
(143, 36, 1, 12, '', '2019-08-03 00:00:00'),
(144, 38, 1, 12, '', '2019-08-03 00:00:00'),
(145, 40, 1, 12, '', '2019-08-03 00:00:00'),
(146, 42, 1, 12, '', '2019-08-03 00:00:00'),
(147, 45, 1, 12, '', '2019-08-03 00:00:00'),
(148, 9, 1, 12, '', '2019-08-04 00:00:00'),
(149, 10, 1, 12, '', '2019-08-04 00:00:00'),
(150, 11, 1, 12, '', '2019-08-04 00:00:00'),
(151, 12, 1, 12, '', '2019-08-04 00:00:00'),
(152, 13, 1, 12, '', '2019-08-04 00:00:00'),
(153, 15, 1, 12, '', '2019-08-04 00:00:00'),
(154, 17, 1, 12, '', '2019-08-04 00:00:00'),
(155, 18, 1, 12, '', '2019-08-04 00:00:00'),
(156, 19, 1, 12, '', '2019-08-04 00:00:00'),
(157, 22, 1, 12, '', '2019-08-04 00:00:00'),
(158, 24, 1, 12, '', '2019-08-04 00:00:00'),
(159, 25, 1, 12, '', '2019-08-04 00:00:00'),
(160, 27, 1, 12, '', '2019-08-04 00:00:00'),
(161, 29, 1, 12, '', '2019-08-04 00:00:00'),
(162, 32, 1, 12, '', '2019-08-04 00:00:00'),
(163, 34, 1, 12, '', '2019-08-04 00:00:00'),
(164, 36, 1, 12, '', '2019-08-04 00:00:00'),
(165, 38, 1, 12, '', '2019-08-04 00:00:00'),
(166, 40, 1, 12, '', '2019-08-04 00:00:00'),
(167, 42, 1, 12, '', '2019-08-04 00:00:00'),
(168, 45, 1, 12, '', '2019-08-04 00:00:00'),
(169, 9, 1, 12, '', '2019-08-01 00:00:00'),
(170, 10, 1, 12, '', '2019-08-01 00:00:00'),
(171, 11, 1, 12, '', '2019-08-01 00:00:00'),
(172, 12, 1, 12, '', '2019-08-01 00:00:00'),
(173, 13, 1, 12, '', '2019-08-01 00:00:00'),
(174, 15, 1, 12, '', '2019-08-01 00:00:00'),
(175, 17, 1, 12, '', '2019-08-01 00:00:00'),
(176, 18, 1, 12, '', '2019-08-01 00:00:00'),
(177, 19, 1, 12, '', '2019-08-01 00:00:00'),
(178, 22, 1, 12, '', '2019-08-01 00:00:00'),
(179, 24, 1, 12, '', '2019-08-01 00:00:00'),
(180, 25, 1, 12, '', '2019-08-01 00:00:00'),
(181, 27, 1, 12, '', '2019-08-01 00:00:00'),
(182, 29, 1, 12, '', '2019-08-01 00:00:00'),
(183, 32, 1, 12, '', '2019-08-01 00:00:00'),
(184, 34, 1, 12, '', '2019-08-01 00:00:00'),
(185, 36, 1, 12, '', '2019-08-01 00:00:00'),
(186, 38, 1, 12, '', '2019-08-01 00:00:00'),
(187, 40, 1, 12, '', '2019-08-01 00:00:00'),
(188, 42, 1, 12, '', '2019-08-01 00:00:00'),
(189, 45, 1, 12, '', '2019-08-01 00:00:00'),
(190, 9, 1, 12, '', '2019-08-02 00:00:00'),
(191, 10, 1, 12, '', '2019-08-02 00:00:00'),
(192, 11, 1, 12, '', '2019-08-02 00:00:00'),
(193, 12, 1, 12, '', '2019-08-02 00:00:00'),
(194, 13, 1, 12, '', '2019-08-02 00:00:00'),
(195, 15, 1, 12, '', '2019-08-02 00:00:00'),
(196, 17, 1, 12, '', '2019-08-02 00:00:00'),
(197, 18, 1, 12, '', '2019-08-02 00:00:00'),
(198, 19, 1, 12, '', '2019-08-02 00:00:00'),
(199, 22, 1, 12, '', '2019-08-02 00:00:00'),
(200, 24, 1, 12, '', '2019-08-02 00:00:00'),
(201, 25, 1, 12, '', '2019-08-02 00:00:00'),
(202, 27, 1, 12, '', '2019-08-02 00:00:00'),
(203, 29, 1, 12, '', '2019-08-02 00:00:00'),
(204, 32, 1, 12, '', '2019-08-02 00:00:00'),
(205, 34, 1, 12, '', '2019-08-02 00:00:00'),
(206, 36, 1, 12, '', '2019-08-02 00:00:00'),
(207, 38, 1, 12, '', '2019-08-02 00:00:00'),
(208, 40, 1, 12, '', '2019-08-02 00:00:00'),
(209, 42, 1, 12, '', '2019-08-02 00:00:00'),
(210, 45, 1, 12, '', '2019-08-02 00:00:00'),
(211, 9, 1, 12, '', '2019-08-05 00:00:00'),
(212, 10, 1, 12, '', '2019-08-05 00:00:00'),
(213, 11, 1, 12, '', '2019-08-05 00:00:00'),
(214, 12, 1, 12, '', '2019-08-05 00:00:00'),
(215, 13, 1, 12, '', '2019-08-05 00:00:00'),
(216, 15, 1, 12, '', '2019-08-05 00:00:00'),
(217, 17, 1, 12, '', '2019-08-05 00:00:00'),
(218, 18, 1, 12, '', '2019-08-05 00:00:00'),
(219, 19, 1, 12, '', '2019-08-05 00:00:00'),
(220, 22, 1, 12, '', '2019-08-05 00:00:00'),
(221, 24, 4, 12, '', '2019-08-05 00:00:00'),
(222, 25, 1, 12, '', '2019-08-05 00:00:00'),
(223, 27, 1, 12, '', '2019-08-05 00:00:00'),
(224, 29, 1, 12, '', '2019-08-05 00:00:00'),
(225, 32, 1, 12, '', '2019-08-05 00:00:00'),
(226, 34, 1, 12, '', '2019-08-05 00:00:00'),
(227, 36, 1, 12, '', '2019-08-05 00:00:00'),
(228, 38, 1, 12, '', '2019-08-05 00:00:00'),
(229, 40, 1, 12, '', '2019-08-05 00:00:00'),
(230, 42, 1, 12, '', '2019-08-05 00:00:00'),
(231, 45, 1, 12, '', '2019-08-05 00:00:00'),
(232, 9, 1, 12, '', '2019-08-06 00:00:00'),
(233, 10, 1, 12, '', '2019-08-06 00:00:00'),
(234, 11, 1, 12, '', '2019-08-06 00:00:00'),
(235, 12, 1, 12, '', '2019-08-06 00:00:00'),
(236, 13, 1, 12, '', '2019-08-06 00:00:00'),
(237, 15, 1, 12, '', '2019-08-06 00:00:00'),
(238, 17, 1, 12, '', '2019-08-06 00:00:00'),
(239, 18, 1, 12, '', '2019-08-06 00:00:00'),
(240, 19, 1, 12, '', '2019-08-06 00:00:00'),
(241, 22, 1, 12, '', '2019-08-06 00:00:00'),
(242, 24, 4, 12, '', '2019-08-06 00:00:00'),
(243, 25, 1, 12, '', '2019-08-06 00:00:00'),
(244, 27, 1, 12, '', '2019-08-06 00:00:00'),
(245, 29, 1, 12, '', '2019-08-06 00:00:00'),
(246, 32, 1, 12, '', '2019-08-06 00:00:00'),
(247, 34, 1, 12, '', '2019-08-06 00:00:00'),
(248, 36, 1, 12, '', '2019-08-06 00:00:00'),
(249, 38, 1, 12, '', '2019-08-06 00:00:00'),
(250, 40, 1, 12, '', '2019-08-06 00:00:00'),
(251, 42, 1, 12, '', '2019-08-06 00:00:00'),
(252, 45, 1, 12, '', '2019-08-06 00:00:00'),
(253, 9, 1, 12, '', '2019-08-07 00:00:00'),
(254, 10, 1, 12, '', '2019-08-07 00:00:00'),
(255, 11, 1, 12, '', '2019-08-07 00:00:00'),
(256, 12, 1, 12, '', '2019-08-07 00:00:00'),
(257, 13, 1, 12, '', '2019-08-07 00:00:00'),
(258, 15, 1, 12, '', '2019-08-07 00:00:00'),
(259, 17, 1, 12, '', '2019-08-07 00:00:00'),
(260, 18, 1, 12, '', '2019-08-07 00:00:00'),
(261, 19, 1, 12, '', '2019-08-07 00:00:00'),
(262, 22, 1, 12, '', '2019-08-07 00:00:00'),
(263, 24, 4, 12, '', '2019-08-07 00:00:00'),
(264, 25, 1, 12, '', '2019-08-07 00:00:00'),
(265, 27, 1, 12, '', '2019-08-07 00:00:00'),
(266, 29, 1, 12, '', '2019-08-07 00:00:00'),
(267, 32, 1, 12, '', '2019-08-07 00:00:00'),
(268, 34, 1, 12, '', '2019-08-07 00:00:00'),
(269, 36, 1, 12, '', '2019-08-07 00:00:00'),
(270, 38, 1, 12, '', '2019-08-07 00:00:00'),
(271, 40, 1, 12, '', '2019-08-07 00:00:00'),
(272, 42, 1, 12, '', '2019-08-07 00:00:00'),
(273, 45, 1, 12, '', '2019-08-07 00:00:00'),
(274, 9, 1, 12, '', '2019-08-08 00:00:00'),
(275, 10, 2, 12, '', '2019-08-08 00:00:00'),
(276, 11, 2, 12, '', '2019-08-08 00:00:00'),
(277, 12, 1, 12, '', '2019-08-08 00:00:00'),
(278, 13, 1, 12, '', '2019-08-08 00:00:00'),
(279, 15, 1, 12, '', '2019-08-08 00:00:00'),
(280, 17, 1, 12, '', '2019-08-08 00:00:00'),
(281, 18, 1, 12, '', '2019-08-08 00:00:00'),
(282, 19, 1, 12, '', '2019-08-08 00:00:00'),
(283, 22, 1, 12, '', '2019-08-08 00:00:00'),
(284, 24, 4, 12, '', '2019-08-08 00:00:00'),
(285, 25, 1, 12, '', '2019-08-08 00:00:00'),
(286, 27, 1, 12, '', '2019-08-08 00:00:00'),
(287, 29, 1, 12, '', '2019-08-08 00:00:00'),
(288, 32, 1, 12, '', '2019-08-08 00:00:00'),
(289, 34, 1, 12, '', '2019-08-08 00:00:00'),
(290, 36, 1, 12, '', '2019-08-08 00:00:00'),
(291, 38, 1, 12, '', '2019-08-08 00:00:00'),
(292, 40, 1, 12, '', '2019-08-08 00:00:00'),
(293, 42, 1, 12, '', '2019-08-08 00:00:00'),
(294, 45, 1, 12, '', '2019-08-08 00:00:00'),
(295, 9, 1, 12, '', '2019-08-09 00:00:00'),
(296, 10, 1, 12, '', '2019-08-09 00:00:00'),
(297, 11, 1, 12, '', '2019-08-09 00:00:00'),
(298, 12, 1, 12, '', '2019-08-09 00:00:00'),
(299, 13, 1, 12, '', '2019-08-09 00:00:00'),
(300, 15, 1, 12, '', '2019-08-09 00:00:00'),
(301, 17, 1, 12, '', '2019-08-09 00:00:00'),
(302, 18, 1, 12, '', '2019-08-09 00:00:00'),
(303, 19, 2, 12, '', '2019-08-09 00:00:00'),
(304, 22, 1, 12, '', '2019-08-09 00:00:00'),
(305, 24, 1, 12, '', '2019-08-09 00:00:00'),
(306, 25, 1, 12, '', '2019-08-09 00:00:00'),
(307, 27, 1, 12, '', '2019-08-09 00:00:00'),
(308, 29, 1, 12, '', '2019-08-09 00:00:00'),
(309, 32, 1, 12, '', '2019-08-09 00:00:00'),
(310, 34, 1, 12, '', '2019-08-09 00:00:00'),
(311, 36, 1, 12, '', '2019-08-09 00:00:00'),
(312, 38, 1, 12, '', '2019-08-09 00:00:00'),
(313, 40, 1, 12, '', '2019-08-09 00:00:00'),
(314, 42, 1, 12, '', '2019-08-09 00:00:00'),
(315, 45, 1, 12, '', '2019-08-09 00:00:00'),
(316, 9, 1, 12, '', '2019-08-13 00:00:00'),
(317, 10, 1, 12, '', '2019-08-13 00:00:00'),
(318, 11, 1, 12, '', '2019-08-13 00:00:00'),
(319, 12, 1, 12, '', '2019-08-13 00:00:00'),
(320, 13, 1, 12, '', '2019-08-13 00:00:00'),
(321, 15, 1, 12, '', '2019-08-13 00:00:00'),
(322, 17, 1, 12, '', '2019-08-13 00:00:00'),
(323, 18, 1, 12, '', '2019-08-13 00:00:00'),
(324, 19, 1, 12, '', '2019-08-13 00:00:00'),
(325, 22, 1, 12, '', '2019-08-13 00:00:00'),
(326, 24, 1, 12, '', '2019-08-13 00:00:00'),
(327, 25, 1, 12, '', '2019-08-13 00:00:00'),
(328, 27, 1, 12, '', '2019-08-13 00:00:00'),
(329, 29, 1, 12, '', '2019-08-13 00:00:00'),
(330, 32, 1, 12, '', '2019-08-13 00:00:00'),
(331, 34, 1, 12, '', '2019-08-13 00:00:00'),
(332, 36, 1, 12, '', '2019-08-13 00:00:00'),
(333, 38, 2, 12, '', '2019-08-13 00:00:00'),
(334, 40, 1, 12, '', '2019-08-13 00:00:00'),
(335, 42, 1, 12, '', '2019-08-13 00:00:00'),
(336, 45, 2, 12, '', '2019-08-13 00:00:00'),
(337, 9, 1, 12, '', '2019-08-14 00:00:00'),
(338, 10, 1, 12, '', '2019-08-14 00:00:00'),
(339, 11, 1, 12, '', '2019-08-14 00:00:00'),
(340, 12, 1, 12, '', '2019-08-14 00:00:00'),
(341, 13, 1, 12, '', '2019-08-14 00:00:00'),
(342, 15, 1, 12, '', '2019-08-14 00:00:00'),
(343, 17, 1, 12, '', '2019-08-14 00:00:00'),
(344, 18, 1, 12, '', '2019-08-14 00:00:00'),
(345, 19, 1, 12, '', '2019-08-14 00:00:00'),
(346, 22, 1, 12, '', '2019-08-14 00:00:00'),
(347, 24, 1, 12, '', '2019-08-14 00:00:00'),
(348, 25, 1, 12, '', '2019-08-14 00:00:00'),
(349, 27, 2, 12, '', '2019-08-14 00:00:00'),
(350, 29, 1, 12, '', '2019-08-14 00:00:00'),
(351, 32, 1, 12, '', '2019-08-14 00:00:00'),
(352, 34, 1, 12, '', '2019-08-14 00:00:00'),
(353, 36, 2, 12, '', '2019-08-14 00:00:00'),
(354, 38, 2, 12, '', '2019-08-14 00:00:00'),
(355, 40, 1, 12, '', '2019-08-14 00:00:00'),
(356, 42, 1, 12, '', '2019-08-14 00:00:00'),
(357, 45, 1, 12, '', '2019-08-14 00:00:00'),
(358, 9, 1, 12, '', '2019-08-16 00:00:00'),
(359, 10, 1, 12, '', '2019-08-16 00:00:00'),
(360, 11, 1, 12, '', '2019-08-16 00:00:00'),
(361, 12, 2, 12, '', '2019-08-16 00:00:00'),
(362, 13, 2, 12, '', '2019-08-16 00:00:00'),
(363, 15, 1, 12, '', '2019-08-16 00:00:00'),
(364, 17, 1, 12, '', '2019-08-16 00:00:00'),
(365, 18, 1, 12, '', '2019-08-16 00:00:00'),
(366, 19, 2, 12, '', '2019-08-16 00:00:00'),
(367, 22, 1, 12, '', '2019-08-16 00:00:00'),
(368, 24, 1, 12, '', '2019-08-16 00:00:00'),
(369, 25, 1, 12, '', '2019-08-16 00:00:00'),
(370, 27, 1, 12, '', '2019-08-16 00:00:00'),
(371, 29, 1, 12, '', '2019-08-16 00:00:00'),
(372, 32, 1, 12, '', '2019-08-16 00:00:00'),
(373, 34, 1, 12, '', '2019-08-16 00:00:00'),
(374, 36, 2, 12, '', '2019-08-16 00:00:00'),
(375, 38, 2, 12, '', '2019-08-16 00:00:00'),
(376, 40, 1, 12, '', '2019-08-16 00:00:00'),
(377, 42, 1, 12, '', '2019-08-16 00:00:00'),
(378, 45, 2, 12, '', '2019-08-16 00:00:00'),
(379, 9, 2, 12, '', '2019-08-19 00:00:00'),
(380, 10, 2, 12, '', '2019-08-19 00:00:00'),
(381, 11, 2, 12, '', '2019-08-19 00:00:00'),
(382, 12, 2, 12, '', '2019-08-19 00:00:00'),
(383, 13, 1, 12, '', '2019-08-19 00:00:00'),
(384, 15, 1, 12, '', '2019-08-19 00:00:00'),
(385, 17, 2, 12, '', '2019-08-19 00:00:00'),
(386, 18, 1, 12, '', '2019-08-19 00:00:00'),
(387, 19, 2, 12, '', '2019-08-19 00:00:00'),
(388, 22, 1, 12, '', '2019-08-19 00:00:00'),
(389, 24, 1, 12, '', '2019-08-19 00:00:00'),
(390, 25, 1, 12, '', '2019-08-19 00:00:00'),
(391, 27, 2, 12, '', '2019-08-19 00:00:00'),
(392, 29, 1, 12, '', '2019-08-19 00:00:00'),
(393, 32, 1, 12, '', '2019-08-19 00:00:00'),
(394, 34, 2, 12, '', '2019-08-19 00:00:00'),
(395, 36, 2, 12, '', '2019-08-19 00:00:00'),
(396, 38, 2, 12, '', '2019-08-19 00:00:00'),
(397, 40, 1, 12, '', '2019-08-19 00:00:00'),
(398, 42, 1, 12, '', '2019-08-19 00:00:00'),
(399, 45, 1, 12, '', '2019-08-19 00:00:00'),
(400, 9, 1, 12, '', '2019-08-20 00:00:00'),
(401, 10, 1, 12, '', '2019-08-20 00:00:00'),
(402, 11, 1, 12, '', '2019-08-20 00:00:00'),
(403, 12, 1, 12, '', '2019-08-20 00:00:00'),
(404, 13, 1, 12, '', '2019-08-20 00:00:00'),
(405, 15, 1, 12, '', '2019-08-20 00:00:00'),
(406, 17, 1, 12, '', '2019-08-20 00:00:00'),
(407, 18, 1, 12, '', '2019-08-20 00:00:00'),
(408, 19, 1, 12, '', '2019-08-20 00:00:00'),
(409, 22, 1, 12, '', '2019-08-20 00:00:00'),
(410, 24, 1, 12, '', '2019-08-20 00:00:00'),
(411, 25, 1, 12, '', '2019-08-20 00:00:00'),
(412, 27, 1, 12, '', '2019-08-20 00:00:00'),
(413, 29, 1, 12, '', '2019-08-20 00:00:00'),
(414, 32, 1, 12, '', '2019-08-20 00:00:00'),
(415, 34, 1, 12, '', '2019-08-20 00:00:00'),
(416, 36, 1, 12, '', '2019-08-20 00:00:00'),
(417, 38, 1, 12, '', '2019-08-20 00:00:00'),
(418, 40, 1, 12, '', '2019-08-20 00:00:00'),
(419, 42, 1, 12, '', '2019-08-20 00:00:00'),
(420, 45, 2, 12, '', '2019-08-20 00:00:00'),
(421, 9, 1, 12, '', '2019-08-21 00:00:00'),
(422, 10, 2, 12, '', '2019-08-21 00:00:00'),
(423, 11, 2, 12, '', '2019-08-21 00:00:00'),
(424, 12, 1, 12, '', '2019-08-21 00:00:00'),
(425, 13, 2, 12, '', '2019-08-21 00:00:00'),
(426, 15, 1, 12, '', '2019-08-21 00:00:00'),
(427, 17, 1, 12, '', '2019-08-21 00:00:00'),
(428, 18, 1, 12, '', '2019-08-21 00:00:00'),
(429, 19, 1, 12, '', '2019-08-21 00:00:00'),
(430, 22, 1, 12, '', '2019-08-21 00:00:00'),
(431, 24, 1, 12, '', '2019-08-21 00:00:00'),
(432, 25, 1, 12, '', '2019-08-21 00:00:00'),
(433, 27, 1, 12, '', '2019-08-21 00:00:00'),
(434, 29, 1, 12, '', '2019-08-21 00:00:00'),
(435, 32, 1, 12, '', '2019-08-21 00:00:00'),
(436, 34, 1, 12, '', '2019-08-21 00:00:00'),
(437, 36, 1, 12, '', '2019-08-21 00:00:00'),
(438, 38, 1, 12, '', '2019-08-21 00:00:00'),
(439, 40, 1, 12, '', '2019-08-21 00:00:00'),
(440, 42, 1, 12, '', '2019-08-21 00:00:00'),
(441, 45, 1, 12, '', '2019-08-21 00:00:00'),
(442, 9, 1, 12, '', '2019-08-22 00:00:00'),
(443, 10, 2, 12, '', '2019-08-22 00:00:00'),
(444, 11, 2, 12, '', '2019-08-22 00:00:00'),
(445, 12, 1, 12, '', '2019-08-22 00:00:00'),
(446, 13, 2, 12, '', '2019-08-22 00:00:00'),
(447, 15, 1, 12, '', '2019-08-22 00:00:00'),
(448, 17, 1, 12, '', '2019-08-22 00:00:00'),
(449, 18, 1, 12, '', '2019-08-22 00:00:00'),
(450, 19, 1, 12, '', '2019-08-22 00:00:00'),
(451, 22, 1, 12, '', '2019-08-22 00:00:00'),
(452, 24, 1, 12, '', '2019-08-22 00:00:00'),
(453, 25, 1, 12, '', '2019-08-22 00:00:00'),
(454, 27, 1, 12, '', '2019-08-22 00:00:00'),
(455, 29, 1, 12, '', '2019-08-22 00:00:00'),
(456, 32, 1, 12, '', '2019-08-22 00:00:00'),
(457, 34, 1, 12, '', '2019-08-22 00:00:00'),
(458, 36, 1, 12, '', '2019-08-22 00:00:00'),
(459, 38, 1, 12, '', '2019-08-22 00:00:00'),
(460, 40, 1, 12, '', '2019-08-22 00:00:00'),
(461, 42, 1, 12, '', '2019-08-22 00:00:00'),
(462, 45, 1, 12, '', '2019-08-22 00:00:00'),
(463, 9, 1, 12, '', '2019-08-23 00:00:00'),
(464, 10, 1, 12, '', '2019-08-23 00:00:00'),
(465, 11, 1, 12, '', '2019-08-23 00:00:00'),
(466, 12, 1, 12, '', '2019-08-23 00:00:00'),
(467, 13, 1, 12, '', '2019-08-23 00:00:00'),
(468, 15, 1, 12, '', '2019-08-23 00:00:00'),
(469, 17, 1, 12, '', '2019-08-23 00:00:00'),
(470, 18, 1, 12, '', '2019-08-23 00:00:00'),
(471, 19, 1, 12, '', '2019-08-23 00:00:00'),
(472, 22, 1, 12, '', '2019-08-23 00:00:00'),
(473, 24, 1, 12, '', '2019-08-23 00:00:00'),
(474, 25, 1, 12, '', '2019-08-23 00:00:00'),
(475, 27, 1, 12, '', '2019-08-23 00:00:00'),
(476, 29, 1, 12, '', '2019-08-23 00:00:00'),
(477, 32, 1, 12, '', '2019-08-23 00:00:00'),
(478, 34, 1, 12, '', '2019-08-23 00:00:00'),
(479, 36, 1, 12, '', '2019-08-23 00:00:00'),
(480, 38, 1, 12, '', '2019-08-23 00:00:00'),
(481, 40, 1, 12, '', '2019-08-23 00:00:00'),
(482, 42, 1, 12, '', '2019-08-23 00:00:00'),
(483, 45, 1, 12, '', '2019-08-23 00:00:00'),
(484, 9, 1, 12, '', '2019-08-26 00:00:00'),
(485, 10, 1, 12, '', '2019-08-26 00:00:00'),
(486, 11, 1, 12, '', '2019-08-26 00:00:00'),
(487, 12, 1, 12, '', '2019-08-26 00:00:00'),
(488, 13, 1, 12, '', '2019-08-26 00:00:00'),
(489, 15, 1, 12, '', '2019-08-26 00:00:00'),
(490, 17, 1, 12, '', '2019-08-26 00:00:00'),
(491, 18, 1, 12, '', '2019-08-26 00:00:00'),
(492, 19, 2, 12, '', '2019-08-26 00:00:00'),
(493, 22, 1, 12, '', '2019-08-26 00:00:00'),
(494, 24, 1, 12, '', '2019-08-26 00:00:00'),
(495, 25, 1, 12, '', '2019-08-26 00:00:00'),
(496, 27, 1, 12, '', '2019-08-26 00:00:00'),
(497, 29, 2, 12, '', '2019-08-26 00:00:00'),
(498, 32, 2, 12, '', '2019-08-26 00:00:00'),
(499, 34, 1, 12, '', '2019-08-26 00:00:00'),
(500, 36, 1, 12, '', '2019-08-26 00:00:00'),
(501, 38, 1, 12, '', '2019-08-26 00:00:00'),
(502, 40, 1, 12, '', '2019-08-26 00:00:00'),
(503, 42, 1, 12, '', '2019-08-26 00:00:00'),
(504, 45, 1, 12, '', '2019-08-26 00:00:00'),
(505, 9, 1, 12, '', '2019-08-27 00:00:00'),
(506, 10, 1, 12, '', '2019-08-27 00:00:00'),
(507, 11, 1, 12, '', '2019-08-27 00:00:00'),
(508, 12, 1, 12, '', '2019-08-27 00:00:00'),
(509, 13, 1, 12, '', '2019-08-27 00:00:00'),
(510, 15, 1, 12, '', '2019-08-27 00:00:00'),
(511, 17, 1, 12, '', '2019-08-27 00:00:00'),
(512, 18, 1, 12, '', '2019-08-27 00:00:00'),
(513, 19, 1, 12, '', '2019-08-27 00:00:00'),
(514, 22, 2, 12, '', '2019-08-27 00:00:00'),
(515, 24, 1, 12, '', '2019-08-27 00:00:00'),
(516, 25, 2, 12, '', '2019-08-27 00:00:00'),
(517, 27, 1, 12, '', '2019-08-27 00:00:00'),
(518, 29, 2, 12, '', '2019-08-27 00:00:00'),
(519, 32, 2, 12, '', '2019-08-27 00:00:00'),
(520, 34, 2, 12, '', '2019-08-27 00:00:00'),
(521, 36, 1, 12, '', '2019-08-27 00:00:00'),
(522, 38, 1, 12, '', '2019-08-27 00:00:00'),
(523, 40, 1, 12, '', '2019-08-27 00:00:00'),
(524, 42, 1, 12, '', '2019-08-27 00:00:00'),
(525, 45, 1, 12, '', '2019-08-27 00:00:00'),
(526, 9, 1, 12, '', '2019-08-28 00:00:00'),
(527, 10, 1, 12, '', '2019-08-28 00:00:00'),
(528, 11, 1, 12, '', '2019-08-28 00:00:00'),
(529, 12, 1, 12, '', '2019-08-28 00:00:00'),
(530, 13, 1, 12, '', '2019-08-28 00:00:00'),
(531, 15, 1, 12, '', '2019-08-28 00:00:00'),
(532, 17, 2, 12, '', '2019-08-28 00:00:00'),
(533, 18, 2, 12, '', '2019-08-28 00:00:00'),
(534, 19, 1, 12, '', '2019-08-28 00:00:00'),
(535, 22, 1, 12, '', '2019-08-28 00:00:00'),
(536, 24, 1, 12, '', '2019-08-28 00:00:00'),
(537, 25, 1, 12, '', '2019-08-28 00:00:00'),
(538, 27, 1, 12, '', '2019-08-28 00:00:00'),
(539, 29, 1, 12, '', '2019-08-28 00:00:00'),
(540, 32, 2, 12, '', '2019-08-28 00:00:00'),
(541, 34, 1, 12, '', '2019-08-28 00:00:00'),
(542, 36, 2, 12, '', '2019-08-28 00:00:00'),
(543, 38, 1, 12, '', '2019-08-28 00:00:00'),
(544, 40, 1, 12, '', '2019-08-28 00:00:00'),
(545, 42, 1, 12, '', '2019-08-28 00:00:00'),
(546, 45, 1, 12, '', '2019-08-28 00:00:00'),
(547, 9, 1, 12, '', '2019-08-29 00:00:00'),
(548, 10, 1, 12, '', '2019-08-29 00:00:00'),
(549, 11, 1, 12, '', '2019-08-29 00:00:00'),
(550, 12, 1, 12, '', '2019-08-29 00:00:00'),
(551, 13, 1, 12, '', '2019-08-29 00:00:00'),
(552, 15, 1, 12, '', '2019-08-29 00:00:00'),
(553, 17, 1, 12, '', '2019-08-29 00:00:00'),
(554, 18, 2, 12, '', '2019-08-29 00:00:00'),
(555, 19, 1, 12, '', '2019-08-29 00:00:00'),
(556, 22, 2, 12, '', '2019-08-29 00:00:00'),
(557, 24, 1, 12, '', '2019-08-29 00:00:00'),
(558, 25, 1, 12, '', '2019-08-29 00:00:00'),
(559, 27, 1, 12, '', '2019-08-29 00:00:00'),
(560, 29, 1, 12, '', '2019-08-29 00:00:00'),
(561, 32, 1, 12, '', '2019-08-29 00:00:00'),
(562, 34, 1, 12, '', '2019-08-29 00:00:00'),
(563, 36, 1, 12, '', '2019-08-29 00:00:00'),
(564, 38, 1, 12, '', '2019-08-29 00:00:00'),
(565, 40, 1, 12, '', '2019-08-29 00:00:00'),
(566, 42, 1, 12, '', '2019-08-29 00:00:00'),
(567, 45, 1, 12, '', '2019-08-29 00:00:00'),
(568, 9, 1, 12, '', '2019-08-30 00:00:00'),
(569, 10, 2, 12, '', '2019-08-30 00:00:00'),
(570, 11, 1, 12, '', '2019-08-30 00:00:00'),
(571, 12, 1, 12, '', '2019-08-30 00:00:00'),
(572, 13, 1, 12, '', '2019-08-30 00:00:00'),
(573, 15, 1, 12, '', '2019-08-30 00:00:00'),
(574, 17, 1, 12, '', '2019-08-30 00:00:00'),
(575, 18, 1, 12, '', '2019-08-30 00:00:00'),
(576, 19, 1, 12, '', '2019-08-30 00:00:00'),
(577, 22, 1, 12, '', '2019-08-30 00:00:00'),
(578, 24, 1, 12, '', '2019-08-30 00:00:00'),
(579, 25, 1, 12, '', '2019-08-30 00:00:00'),
(580, 27, 1, 12, '', '2019-08-30 00:00:00'),
(581, 29, 1, 12, '', '2019-08-30 00:00:00'),
(582, 32, 2, 12, '', '2019-08-30 00:00:00'),
(583, 34, 1, 12, '', '2019-08-30 00:00:00'),
(584, 36, 1, 12, '', '2019-08-30 00:00:00'),
(585, 38, 1, 12, '', '2019-08-30 00:00:00'),
(586, 40, 1, 12, '', '2019-08-30 00:00:00'),
(587, 42, 1, 12, '', '2019-08-30 00:00:00'),
(588, 45, 1, 12, '', '2019-08-30 00:00:00'),
(589, 9, 1, 12, '', '2019-08-31 00:00:00'),
(590, 10, 2, 12, '', '2019-08-31 00:00:00'),
(591, 11, 2, 12, '', '2019-08-31 00:00:00'),
(592, 12, 1, 12, '', '2019-08-31 00:00:00'),
(593, 13, 1, 12, '', '2019-08-31 00:00:00'),
(594, 15, 1, 12, '', '2019-08-31 00:00:00'),
(595, 17, 1, 12, '', '2019-08-31 00:00:00'),
(596, 18, 1, 12, '', '2019-08-31 00:00:00'),
(597, 19, 1, 12, '', '2019-08-31 00:00:00'),
(598, 22, 1, 12, '', '2019-08-31 00:00:00'),
(599, 24, 1, 12, '', '2019-08-31 00:00:00'),
(600, 25, 1, 12, '', '2019-08-31 00:00:00'),
(601, 27, 1, 12, '', '2019-08-31 00:00:00'),
(602, 29, 1, 12, '', '2019-08-31 00:00:00'),
(603, 32, 1, 12, '', '2019-08-31 00:00:00'),
(604, 34, 1, 12, '', '2019-08-31 00:00:00'),
(605, 36, 1, 12, '', '2019-08-31 00:00:00'),
(606, 38, 1, 12, '', '2019-08-31 00:00:00'),
(607, 40, 1, 12, '', '2019-08-31 00:00:00'),
(608, 42, 1, 12, '', '2019-08-31 00:00:00'),
(609, 45, 2, 12, '', '2019-08-31 00:00:00'),
(610, 9, 1, 12, '', '2019-09-01 00:00:00'),
(611, 10, 1, 12, '', '2019-09-01 00:00:00'),
(612, 11, 1, 12, '', '2019-09-01 00:00:00'),
(613, 12, 1, 12, '', '2019-09-01 00:00:00'),
(614, 13, 1, 12, '', '2019-09-01 00:00:00'),
(615, 15, 1, 12, '', '2019-09-01 00:00:00'),
(616, 17, 1, 12, '', '2019-09-01 00:00:00'),
(617, 18, 1, 12, '', '2019-09-01 00:00:00'),
(618, 19, 1, 12, '', '2019-09-01 00:00:00'),
(619, 22, 1, 12, '', '2019-09-01 00:00:00'),
(620, 24, 1, 12, '', '2019-09-01 00:00:00'),
(621, 25, 1, 12, '', '2019-09-01 00:00:00'),
(622, 27, 1, 12, '', '2019-09-01 00:00:00'),
(623, 29, 1, 12, '', '2019-09-01 00:00:00'),
(624, 32, 1, 12, '', '2019-09-01 00:00:00'),
(625, 34, 1, 12, '', '2019-09-01 00:00:00'),
(626, 36, 1, 12, '', '2019-09-01 00:00:00'),
(627, 38, 1, 12, '', '2019-09-01 00:00:00'),
(628, 40, 1, 12, '', '2019-09-01 00:00:00'),
(629, 42, 1, 12, '', '2019-09-01 00:00:00'),
(630, 45, 1, 12, '', '2019-09-01 00:00:00'),
(631, 9, 1, 12, '', '2019-09-03 00:00:00'),
(632, 10, 1, 12, '', '2019-09-03 00:00:00'),
(633, 11, 1, 12, '', '2019-09-03 00:00:00'),
(634, 12, 1, 12, '', '2019-09-03 00:00:00'),
(635, 13, 1, 12, '', '2019-09-03 00:00:00'),
(636, 15, 1, 12, '', '2019-09-03 00:00:00'),
(637, 17, 1, 12, '', '2019-09-03 00:00:00'),
(638, 18, 1, 12, '', '2019-09-03 00:00:00'),
(639, 19, 1, 12, '', '2019-09-03 00:00:00'),
(640, 22, 1, 12, '', '2019-09-03 00:00:00'),
(641, 24, 1, 12, '', '2019-09-03 00:00:00'),
(642, 25, 1, 12, '', '2019-09-03 00:00:00'),
(643, 27, 1, 12, '', '2019-09-03 00:00:00'),
(644, 29, 1, 12, '', '2019-09-03 00:00:00'),
(645, 32, 1, 12, '', '2019-09-03 00:00:00'),
(646, 34, 1, 12, '', '2019-09-03 00:00:00'),
(647, 36, 1, 12, '', '2019-09-03 00:00:00'),
(648, 38, 1, 12, '', '2019-09-03 00:00:00'),
(649, 40, 1, 12, '', '2019-09-03 00:00:00'),
(650, 42, 1, 12, '', '2019-09-03 00:00:00'),
(651, 45, 1, 12, '', '2019-09-03 00:00:00'),
(652, 9, 1, 12, '', '2019-09-04 00:00:00'),
(653, 10, 1, 12, '', '2019-09-04 00:00:00'),
(654, 11, 1, 12, '', '2019-09-04 00:00:00'),
(655, 12, 1, 12, '', '2019-09-04 00:00:00'),
(656, 13, 1, 12, '', '2019-09-04 00:00:00'),
(657, 15, 1, 12, '', '2019-09-04 00:00:00'),
(658, 17, 1, 12, '', '2019-09-04 00:00:00'),
(659, 18, 1, 12, '', '2019-09-04 00:00:00'),
(660, 19, 1, 12, '', '2019-09-04 00:00:00'),
(661, 22, 1, 12, '', '2019-09-04 00:00:00'),
(662, 24, 1, 12, '', '2019-09-04 00:00:00'),
(663, 25, 1, 12, '', '2019-09-04 00:00:00'),
(664, 27, 1, 12, '', '2019-09-04 00:00:00'),
(665, 29, 1, 12, '', '2019-09-04 00:00:00'),
(666, 32, 1, 12, '', '2019-09-04 00:00:00'),
(667, 34, 1, 12, '', '2019-09-04 00:00:00'),
(668, 36, 1, 12, '', '2019-09-04 00:00:00'),
(669, 38, 1, 12, '', '2019-09-04 00:00:00'),
(670, 40, 1, 12, '', '2019-09-04 00:00:00'),
(671, 42, 1, 12, '', '2019-09-04 00:00:00'),
(672, 45, 2, 12, '', '2019-09-04 00:00:00'),
(694, 9, 1, 12, '', '2019-09-06 00:00:00'),
(695, 10, 1, 12, '', '2019-09-06 00:00:00'),
(696, 11, 1, 12, '', '2019-09-06 00:00:00'),
(697, 12, 1, 12, '', '2019-09-06 00:00:00'),
(698, 13, 1, 12, '', '2019-09-06 00:00:00'),
(699, 15, 1, 12, '', '2019-09-06 00:00:00'),
(700, 17, 1, 12, '', '2019-09-06 00:00:00'),
(701, 18, 1, 12, '', '2019-09-06 00:00:00'),
(702, 19, 1, 12, '', '2019-09-06 00:00:00'),
(703, 22, 1, 12, '', '2019-09-06 00:00:00'),
(704, 24, 1, 12, '', '2019-09-06 00:00:00'),
(705, 25, 1, 12, '', '2019-09-06 00:00:00'),
(706, 27, 1, 12, '', '2019-09-06 00:00:00'),
(707, 29, 1, 12, '', '2019-09-06 00:00:00'),
(708, 32, 1, 12, '', '2019-09-06 00:00:00'),
(709, 34, 1, 12, '', '2019-09-06 00:00:00'),
(710, 36, 2, 12, '', '2019-09-06 00:00:00'),
(711, 38, 1, 12, '', '2019-09-06 00:00:00'),
(712, 40, 1, 12, '', '2019-09-06 00:00:00'),
(713, 42, 1, 12, '', '2019-09-06 00:00:00'),
(714, 45, 1, 12, '', '2019-09-06 00:00:00'),
(715, 9, 1, 12, '', '2019-09-07 00:00:00'),
(716, 10, 2, 12, '', '2019-09-07 00:00:00'),
(717, 11, 2, 12, '', '2019-09-07 00:00:00'),
(718, 12, 1, 12, '', '2019-09-07 00:00:00'),
(719, 13, 3, 12, '', '2019-09-07 00:00:00'),
(720, 15, 2, 12, '', '2019-09-07 00:00:00'),
(721, 17, 2, 12, '', '2019-09-07 00:00:00'),
(722, 18, 1, 12, '', '2019-09-07 00:00:00'),
(723, 19, 1, 12, '', '2019-09-07 00:00:00'),
(724, 22, 1, 12, '', '2019-09-07 00:00:00'),
(725, 24, 1, 12, '', '2019-09-07 00:00:00'),
(726, 25, 1, 12, '', '2019-09-07 00:00:00'),
(727, 27, 1, 12, '', '2019-09-07 00:00:00'),
(728, 29, 1, 12, '', '2019-09-07 00:00:00'),
(729, 32, 1, 12, '', '2019-09-07 00:00:00'),
(730, 34, 1, 12, '', '2019-09-07 00:00:00'),
(731, 36, 1, 12, '', '2019-09-07 00:00:00'),
(732, 38, 2, 12, '', '2019-09-07 00:00:00'),
(733, 40, 1, 12, '', '2019-09-07 00:00:00'),
(734, 42, 1, 12, '', '2019-09-07 00:00:00'),
(735, 45, 2, 12, '', '2019-09-07 00:00:00'),
(736, 9, 1, 12, '', '2019-09-09 00:00:00'),
(737, 10, 1, 12, '', '2019-09-09 00:00:00'),
(738, 11, 1, 12, '', '2019-09-09 00:00:00'),
(739, 12, 1, 12, '', '2019-09-09 00:00:00'),
(740, 13, 1, 12, '', '2019-09-09 00:00:00'),
(741, 15, 1, 12, '', '2019-09-09 00:00:00'),
(742, 17, 1, 12, '', '2019-09-09 00:00:00'),
(743, 18, 1, 12, '', '2019-09-09 00:00:00'),
(744, 19, 2, 12, '', '2019-09-09 00:00:00'),
(745, 22, 1, 12, '', '2019-09-09 00:00:00'),
(746, 24, 1, 12, '', '2019-09-09 00:00:00'),
(747, 25, 1, 12, '', '2019-09-09 00:00:00'),
(748, 27, 1, 12, '', '2019-09-09 00:00:00'),
(749, 29, 1, 12, '', '2019-09-09 00:00:00'),
(750, 32, 1, 12, '', '2019-09-09 00:00:00'),
(751, 34, 2, 12, '', '2019-09-09 00:00:00'),
(752, 36, 1, 12, '', '2019-09-09 00:00:00'),
(753, 38, 1, 12, '', '2019-09-09 00:00:00'),
(754, 40, 1, 12, '', '2019-09-09 00:00:00'),
(755, 42, 1, 12, '', '2019-09-09 00:00:00'),
(756, 45, 1, 12, '', '2019-09-09 00:00:00'),
(757, 9, 1, 12, '', '2019-09-11 00:00:00'),
(758, 10, 1, 12, '', '2019-09-11 00:00:00'),
(759, 11, 1, 12, '', '2019-09-11 00:00:00'),
(760, 12, 2, 12, '', '2019-09-11 00:00:00'),
(761, 13, 2, 12, '', '2019-09-11 00:00:00'),
(762, 15, 1, 12, '', '2019-09-11 00:00:00'),
(763, 17, 1, 12, '', '2019-09-11 00:00:00'),
(764, 18, 1, 12, '', '2019-09-11 00:00:00'),
(765, 19, 1, 12, '', '2019-09-11 00:00:00'),
(766, 22, 1, 12, '', '2019-09-11 00:00:00'),
(767, 24, 1, 12, '', '2019-09-11 00:00:00'),
(768, 25, 2, 12, '', '2019-09-11 00:00:00'),
(769, 27, 1, 12, '', '2019-09-11 00:00:00'),
(770, 29, 1, 12, '', '2019-09-11 00:00:00'),
(771, 32, 2, 12, '', '2019-09-11 00:00:00'),
(772, 34, 1, 12, '', '2019-09-11 00:00:00'),
(773, 36, 2, 12, '', '2019-09-11 00:00:00'),
(774, 38, 1, 12, '', '2019-09-11 00:00:00'),
(775, 40, 1, 12, '', '2019-09-11 00:00:00'),
(776, 42, 1, 12, '', '2019-09-11 00:00:00'),
(777, 45, 2, 12, '', '2019-09-11 00:00:00'),
(778, 9, 1, 12, '', '2019-09-12 00:00:00'),
(779, 10, 1, 12, '', '2019-09-12 00:00:00'),
(780, 11, 1, 12, '', '2019-09-12 00:00:00'),
(781, 12, 1, 12, '', '2019-09-12 00:00:00'),
(782, 13, 2, 12, '', '2019-09-12 00:00:00'),
(783, 15, 1, 12, '', '2019-09-12 00:00:00'),
(784, 17, 1, 12, '', '2019-09-12 00:00:00'),
(785, 18, 1, 12, '', '2019-09-12 00:00:00'),
(786, 19, 1, 12, '', '2019-09-12 00:00:00'),
(787, 22, 1, 12, '', '2019-09-12 00:00:00'),
(788, 24, 1, 12, '', '2019-09-12 00:00:00'),
(789, 25, 1, 12, '', '2019-09-12 00:00:00'),
(790, 27, 2, 12, '', '2019-09-12 00:00:00'),
(791, 29, 1, 12, '', '2019-09-12 00:00:00'),
(792, 32, 1, 12, '', '2019-09-12 00:00:00'),
(793, 34, 1, 12, '', '2019-09-12 00:00:00'),
(794, 36, 2, 12, '', '2019-09-12 00:00:00'),
(795, 38, 1, 12, '', '2019-09-12 00:00:00'),
(796, 40, 1, 12, '', '2019-09-12 00:00:00'),
(797, 42, 1, 12, '', '2019-09-12 00:00:00'),
(798, 45, 1, 12, '', '2019-09-12 00:00:00'),
(799, 9, 1, 12, '', '2019-09-13 00:00:00'),
(800, 10, 2, 12, '', '2019-09-13 00:00:00'),
(801, 11, 2, 12, '', '2019-09-13 00:00:00'),
(802, 12, 2, 12, '', '2019-09-13 00:00:00'),
(803, 13, 2, 12, '', '2019-09-13 00:00:00'),
(804, 15, 1, 12, '', '2019-09-13 00:00:00'),
(805, 17, 1, 12, '', '2019-09-13 00:00:00'),
(806, 18, 1, 12, '', '2019-09-13 00:00:00'),
(807, 19, 1, 12, '', '2019-09-13 00:00:00'),
(808, 22, 1, 12, '', '2019-09-13 00:00:00'),
(809, 24, 1, 12, '', '2019-09-13 00:00:00'),
(810, 25, 1, 12, '', '2019-09-13 00:00:00'),
(811, 27, 2, 12, '', '2019-09-13 00:00:00'),
(812, 29, 1, 12, '', '2019-09-13 00:00:00'),
(813, 32, 1, 12, '', '2019-09-13 00:00:00'),
(814, 34, 1, 12, '', '2019-09-13 00:00:00'),
(815, 36, 1, 12, '', '2019-09-13 00:00:00'),
(816, 38, 1, 12, '', '2019-09-13 00:00:00'),
(817, 40, 1, 12, '', '2019-09-13 00:00:00'),
(818, 42, 1, 12, '', '2019-09-13 00:00:00'),
(819, 45, 1, 12, '', '2019-09-13 00:00:00'),
(820, 9, 1, 12, '', '2019-09-16 00:00:00'),
(821, 10, 1, 12, '', '2019-09-16 00:00:00'),
(822, 11, 1, 12, '', '2019-09-16 00:00:00'),
(823, 12, 1, 12, '', '2019-09-16 00:00:00'),
(824, 13, 1, 12, '', '2019-09-16 00:00:00'),
(825, 15, 1, 12, '', '2019-09-16 00:00:00'),
(826, 17, 2, 12, '', '2019-09-16 00:00:00'),
(827, 18, 1, 12, '', '2019-09-16 00:00:00'),
(828, 19, 2, 12, '', '2019-09-16 00:00:00'),
(829, 22, 1, 12, '', '2019-09-16 00:00:00'),
(830, 24, 1, 12, '', '2019-09-16 00:00:00'),
(831, 25, 1, 12, '', '2019-09-16 00:00:00'),
(832, 27, 1, 12, '', '2019-09-16 00:00:00'),
(833, 29, 2, 12, '', '2019-09-16 00:00:00'),
(834, 32, 1, 12, '', '2019-09-16 00:00:00'),
(835, 34, 1, 12, '', '2019-09-16 00:00:00'),
(836, 36, 2, 12, '', '2019-09-16 00:00:00'),
(837, 38, 1, 12, '', '2019-09-16 00:00:00'),
(838, 40, 1, 12, '', '2019-09-16 00:00:00'),
(839, 42, 1, 12, '', '2019-09-16 00:00:00'),
(840, 45, 1, 12, '', '2019-09-16 00:00:00'),
(841, 9, 1, 12, '', '2019-09-17 00:00:00'),
(842, 10, 2, 12, '', '2019-09-17 00:00:00'),
(843, 11, 2, 12, '', '2019-09-17 00:00:00'),
(844, 12, 2, 12, '', '2019-09-17 00:00:00'),
(845, 13, 1, 12, '', '2019-09-17 00:00:00'),
(846, 15, 1, 12, '', '2019-09-17 00:00:00'),
(847, 17, 2, 12, '', '2019-09-17 00:00:00'),
(848, 18, 1, 12, '', '2019-09-17 00:00:00'),
(849, 19, 1, 12, '', '2019-09-17 00:00:00'),
(850, 22, 1, 12, '', '2019-09-17 00:00:00'),
(851, 24, 1, 12, '', '2019-09-17 00:00:00'),
(852, 25, 1, 12, '', '2019-09-17 00:00:00'),
(853, 27, 1, 12, '', '2019-09-17 00:00:00'),
(854, 29, 1, 12, '', '2019-09-17 00:00:00'),
(855, 32, 1, 12, '', '2019-09-17 00:00:00'),
(856, 34, 1, 12, '', '2019-09-17 00:00:00'),
(857, 36, 1, 12, '', '2019-09-17 00:00:00'),
(858, 38, 1, 12, '', '2019-09-17 00:00:00'),
(859, 40, 1, 12, '', '2019-09-17 00:00:00'),
(860, 42, 1, 12, '', '2019-09-17 00:00:00'),
(861, 45, 1, 12, '', '2019-09-17 00:00:00'),
(862, 9, 1, 12, '', '2019-09-18 00:00:00'),
(863, 10, 1, 12, '', '2019-09-18 00:00:00'),
(864, 11, 1, 12, '', '2019-09-18 00:00:00'),
(865, 12, 1, 12, '', '2019-09-18 00:00:00'),
(866, 13, 1, 12, '', '2019-09-18 00:00:00'),
(867, 15, 1, 12, '', '2019-09-18 00:00:00'),
(868, 17, 1, 12, '', '2019-09-18 00:00:00'),
(869, 18, 1, 12, '', '2019-09-18 00:00:00'),
(870, 19, 1, 12, '', '2019-09-18 00:00:00'),
(871, 22, 1, 12, '', '2019-09-18 00:00:00'),
(872, 24, 1, 12, '', '2019-09-18 00:00:00'),
(873, 25, 1, 12, '', '2019-09-18 00:00:00'),
(874, 27, 1, 12, '', '2019-09-18 00:00:00'),
(875, 29, 1, 12, '', '2019-09-18 00:00:00'),
(876, 32, 2, 12, '', '2019-09-18 00:00:00'),
(877, 34, 1, 12, '', '2019-09-18 00:00:00'),
(878, 36, 1, 12, '', '2019-09-18 00:00:00'),
(879, 38, 2, 12, '', '2019-09-18 00:00:00'),
(880, 40, 1, 12, '', '2019-09-18 00:00:00'),
(881, 42, 1, 12, '', '2019-09-18 00:00:00'),
(882, 45, 2, 12, '', '2019-09-18 00:00:00'),
(883, 9, 1, 12, '', '2019-09-19 00:00:00'),
(884, 10, 1, 12, '', '2019-09-19 00:00:00'),
(885, 11, 1, 12, '', '2019-09-19 00:00:00'),
(886, 12, 1, 12, '', '2019-09-19 00:00:00'),
(887, 13, 1, 12, '', '2019-09-19 00:00:00'),
(888, 15, 1, 12, '', '2019-09-19 00:00:00'),
(889, 17, 1, 12, '', '2019-09-19 00:00:00'),
(890, 18, 1, 12, '', '2019-09-19 00:00:00'),
(891, 19, 1, 12, '', '2019-09-19 00:00:00'),
(892, 22, 1, 12, '', '2019-09-19 00:00:00'),
(893, 24, 1, 12, '', '2019-09-19 00:00:00'),
(894, 25, 1, 12, '', '2019-09-19 00:00:00'),
(895, 27, 1, 12, '', '2019-09-19 00:00:00'),
(896, 29, 1, 12, '', '2019-09-19 00:00:00'),
(897, 32, 1, 12, '', '2019-09-19 00:00:00'),
(898, 34, 1, 12, '', '2019-09-19 00:00:00'),
(899, 36, 1, 12, '', '2019-09-19 00:00:00'),
(900, 38, 1, 12, '', '2019-09-19 00:00:00'),
(901, 40, 1, 12, '', '2019-09-19 00:00:00'),
(902, 42, 1, 12, '', '2019-09-19 00:00:00'),
(903, 45, 1, 12, '', '2019-09-19 00:00:00'),
(904, 9, 1, 12, '', '2019-09-20 00:00:00'),
(905, 10, 1, 12, '', '2019-09-20 00:00:00'),
(906, 11, 1, 12, '', '2019-09-20 00:00:00'),
(907, 12, 1, 12, '', '2019-09-20 00:00:00'),
(908, 13, 1, 12, '', '2019-09-20 00:00:00'),
(909, 15, 1, 12, '', '2019-09-20 00:00:00'),
(910, 17, 1, 12, '', '2019-09-20 00:00:00'),
(911, 18, 1, 12, '', '2019-09-20 00:00:00'),
(912, 19, 1, 12, '', '2019-09-20 00:00:00'),
(913, 22, 1, 12, '', '2019-09-20 00:00:00'),
(914, 24, 1, 12, '', '2019-09-20 00:00:00'),
(915, 25, 1, 12, '', '2019-09-20 00:00:00'),
(916, 27, 1, 12, '', '2019-09-20 00:00:00'),
(917, 29, 1, 12, '', '2019-09-20 00:00:00'),
(918, 32, 1, 12, '', '2019-09-20 00:00:00'),
(919, 34, 1, 12, '', '2019-09-20 00:00:00'),
(920, 36, 2, 12, '', '2019-09-20 00:00:00'),
(921, 38, 1, 12, '', '2019-09-20 00:00:00'),
(922, 40, 1, 12, '', '2019-09-20 00:00:00'),
(923, 42, 1, 12, '', '2019-09-20 00:00:00'),
(924, 45, 1, 12, '', '2019-09-20 00:00:00'),
(925, 9, 1, 12, '', '2019-09-21 00:00:00'),
(926, 10, 1, 12, '', '2019-09-21 00:00:00'),
(927, 11, 1, 12, '', '2019-09-21 00:00:00'),
(928, 12, 1, 12, '', '2019-09-21 00:00:00'),
(929, 13, 1, 12, '', '2019-09-21 00:00:00'),
(930, 15, 1, 12, '', '2019-09-21 00:00:00'),
(931, 17, 1, 12, '', '2019-09-21 00:00:00'),
(932, 18, 1, 12, '', '2019-09-21 00:00:00'),
(933, 19, 1, 12, '', '2019-09-21 00:00:00'),
(934, 22, 1, 12, '', '2019-09-21 00:00:00'),
(935, 24, 1, 12, '', '2019-09-21 00:00:00'),
(936, 25, 1, 12, '', '2019-09-21 00:00:00'),
(937, 27, 1, 12, '', '2019-09-21 00:00:00'),
(938, 29, 1, 12, '', '2019-09-21 00:00:00'),
(939, 32, 1, 12, '', '2019-09-21 00:00:00'),
(940, 34, 1, 12, '', '2019-09-21 00:00:00'),
(941, 36, 1, 12, '', '2019-09-21 00:00:00'),
(942, 38, 1, 12, '', '2019-09-21 00:00:00'),
(943, 40, 1, 12, '', '2019-09-21 00:00:00'),
(944, 42, 1, 12, '', '2019-09-21 00:00:00'),
(945, 45, 1, 12, '', '2019-09-21 00:00:00'),
(946, 9, 1, 12, '', '2019-09-23 00:00:00'),
(947, 10, 1, 12, '', '2019-09-23 00:00:00'),
(948, 11, 1, 12, '', '2019-09-23 00:00:00'),
(949, 12, 1, 12, '', '2019-09-23 00:00:00'),
(950, 13, 1, 12, '', '2019-09-23 00:00:00'),
(951, 15, 1, 12, '', '2019-09-23 00:00:00'),
(952, 17, 1, 12, '', '2019-09-23 00:00:00'),
(953, 18, 1, 12, '', '2019-09-23 00:00:00'),
(954, 19, 2, 12, '', '2019-09-23 00:00:00'),
(955, 22, 1, 12, '', '2019-09-23 00:00:00'),
(956, 24, 1, 12, '', '2019-09-23 00:00:00'),
(957, 25, 1, 12, '', '2019-09-23 00:00:00'),
(958, 27, 1, 12, '', '2019-09-23 00:00:00'),
(959, 29, 1, 12, '', '2019-09-23 00:00:00'),
(960, 32, 1, 12, '', '2019-09-23 00:00:00'),
(961, 34, 2, 12, '', '2019-09-23 00:00:00'),
(962, 36, 1, 12, '', '2019-09-23 00:00:00'),
(963, 38, 1, 12, '', '2019-09-23 00:00:00'),
(964, 40, 1, 12, '', '2019-09-23 00:00:00'),
(965, 42, 1, 12, '', '2019-09-23 00:00:00'),
(966, 45, 1, 12, '', '2019-09-23 00:00:00'),
(967, 9, 1, 12, '', '2019-09-24 00:00:00'),
(968, 10, 1, 12, '', '2019-09-24 00:00:00'),
(969, 11, 1, 12, '', '2019-09-24 00:00:00'),
(970, 12, 2, 12, '', '2019-09-24 00:00:00'),
(971, 13, 2, 12, '', '2019-09-24 00:00:00'),
(972, 15, 1, 12, '', '2019-09-24 00:00:00'),
(973, 17, 1, 12, '', '2019-09-24 00:00:00'),
(974, 18, 1, 12, '', '2019-09-24 00:00:00'),
(975, 19, 1, 12, '', '2019-09-24 00:00:00'),
(976, 22, 1, 12, '', '2019-09-24 00:00:00'),
(977, 24, 1, 12, '', '2019-09-24 00:00:00'),
(978, 25, 2, 12, '', '2019-09-24 00:00:00'),
(979, 27, 1, 12, '', '2019-09-24 00:00:00'),
(980, 29, 1, 12, '', '2019-09-24 00:00:00'),
(981, 32, 1, 12, '', '2019-09-24 00:00:00'),
(982, 34, 1, 12, '', '2019-09-24 00:00:00'),
(983, 36, 1, 12, '', '2019-09-24 00:00:00'),
(984, 38, 1, 12, '', '2019-09-24 00:00:00'),
(985, 40, 1, 12, '', '2019-09-24 00:00:00'),
(986, 42, 1, 12, '', '2019-09-24 00:00:00'),
(987, 45, 1, 12, '', '2019-09-24 00:00:00'),
(988, 9, 2, 12, '', '2019-09-25 00:00:00'),
(989, 10, 2, 12, '', '2019-09-25 00:00:00'),
(990, 11, 1, 12, '', '2019-09-25 00:00:00'),
(991, 12, 1, 12, '', '2019-09-25 00:00:00'),
(992, 13, 1, 12, '', '2019-09-25 00:00:00'),
(993, 15, 1, 12, '', '2019-09-25 00:00:00'),
(994, 17, 1, 12, '', '2019-09-25 00:00:00'),
(995, 18, 1, 12, '', '2019-09-25 00:00:00'),
(996, 19, 2, 12, '', '2019-09-25 00:00:00'),
(997, 22, 2, 12, '', '2019-09-25 00:00:00'),
(998, 24, 2, 12, '', '2019-09-25 00:00:00'),
(999, 25, 1, 12, '', '2019-09-25 00:00:00'),
(1000, 27, 1, 12, '', '2019-09-25 00:00:00'),
(1001, 29, 1, 12, '', '2019-09-25 00:00:00'),
(1002, 32, 1, 12, '', '2019-09-25 00:00:00'),
(1003, 34, 1, 12, '', '2019-09-25 00:00:00'),
(1004, 36, 1, 12, '', '2019-09-25 00:00:00'),
(1005, 38, 1, 12, '', '2019-09-25 00:00:00'),
(1006, 40, 1, 12, '', '2019-09-25 00:00:00'),
(1007, 42, 1, 12, '', '2019-09-25 00:00:00'),
(1008, 45, 1, 12, '', '2019-09-25 00:00:00'),
(1009, 9, 1, 12, '', '2019-09-26 00:00:00'),
(1010, 10, 1, 12, '', '2019-09-26 00:00:00'),
(1011, 11, 1, 12, '', '2019-09-26 00:00:00'),
(1012, 12, 1, 12, '', '2019-09-26 00:00:00'),
(1013, 13, 2, 12, '', '2019-09-26 00:00:00'),
(1014, 15, 1, 12, '', '2019-09-26 00:00:00'),
(1015, 17, 1, 12, '', '2019-09-26 00:00:00'),
(1016, 18, 1, 12, '', '2019-09-26 00:00:00'),
(1017, 19, 1, 12, '', '2019-09-26 00:00:00'),
(1018, 22, 1, 12, '', '2019-09-26 00:00:00'),
(1019, 24, 1, 12, '', '2019-09-26 00:00:00'),
(1020, 25, 1, 12, '', '2019-09-26 00:00:00'),
(1021, 27, 1, 12, '', '2019-09-26 00:00:00'),
(1022, 29, 1, 12, '', '2019-09-26 00:00:00'),
(1023, 32, 1, 12, '', '2019-09-26 00:00:00'),
(1024, 34, 1, 12, '', '2019-09-26 00:00:00'),
(1025, 36, 1, 12, '', '2019-09-26 00:00:00'),
(1026, 38, 2, 12, '', '2019-09-26 00:00:00'),
(1027, 40, 1, 12, '', '2019-09-26 00:00:00'),
(1028, 42, 1, 12, '', '2019-09-26 00:00:00'),
(1029, 45, 1, 12, '', '2019-09-26 00:00:00'),
(1030, 9, 1, 12, '', '2019-09-27 00:00:00'),
(1031, 10, 1, 12, '', '2019-09-27 00:00:00'),
(1032, 11, 1, 12, '', '2019-09-27 00:00:00'),
(1033, 12, 1, 12, '', '2019-09-27 00:00:00'),
(1034, 13, 1, 12, '', '2019-09-27 00:00:00'),
(1035, 15, 1, 12, '', '2019-09-27 00:00:00'),
(1036, 17, 1, 12, '', '2019-09-27 00:00:00'),
(1037, 18, 1, 12, '', '2019-09-27 00:00:00'),
(1038, 19, 1, 12, '', '2019-09-27 00:00:00'),
(1039, 22, 1, 12, '', '2019-09-27 00:00:00'),
(1040, 24, 1, 12, '', '2019-09-27 00:00:00'),
(1041, 25, 1, 12, '', '2019-09-27 00:00:00'),
(1042, 27, 1, 12, '', '2019-09-27 00:00:00'),
(1043, 29, 1, 12, '', '2019-09-27 00:00:00'),
(1044, 32, 1, 12, '', '2019-09-27 00:00:00'),
(1045, 34, 1, 12, '', '2019-09-27 00:00:00'),
(1046, 36, 1, 12, '', '2019-09-27 00:00:00'),
(1047, 38, 1, 12, '', '2019-09-27 00:00:00'),
(1048, 40, 1, 12, '', '2019-09-27 00:00:00'),
(1049, 42, 1, 12, '', '2019-09-27 00:00:00'),
(1050, 45, 1, 12, '', '2019-09-27 00:00:00'),
(1051, 9, 1, 12, '', '2019-09-30 00:00:00'),
(1052, 10, 1, 12, '', '2019-09-30 00:00:00'),
(1053, 11, 1, 12, '', '2019-09-30 00:00:00'),
(1054, 12, 1, 12, '', '2019-09-30 00:00:00'),
(1055, 13, 1, 12, '', '2019-09-30 00:00:00'),
(1056, 15, 1, 12, '', '2019-09-30 00:00:00'),
(1057, 17, 1, 12, '', '2019-09-30 00:00:00'),
(1058, 18, 1, 12, '', '2019-09-30 00:00:00'),
(1059, 19, 1, 12, '', '2019-09-30 00:00:00'),
(1060, 22, 1, 12, '', '2019-09-30 00:00:00'),
(1061, 24, 1, 12, '', '2019-09-30 00:00:00'),
(1062, 25, 1, 12, '', '2019-09-30 00:00:00'),
(1063, 27, 1, 12, '', '2019-09-30 00:00:00'),
(1064, 29, 1, 12, '', '2019-09-30 00:00:00'),
(1065, 32, 1, 12, '', '2019-09-30 00:00:00'),
(1066, 34, 1, 12, '', '2019-09-30 00:00:00'),
(1067, 36, 1, 12, '', '2019-09-30 00:00:00'),
(1068, 38, 1, 12, '', '2019-09-30 00:00:00'),
(1069, 40, 1, 12, '', '2019-09-30 00:00:00'),
(1070, 42, 1, 12, '', '2019-09-30 00:00:00'),
(1071, 45, 1, 12, '', '2019-09-30 00:00:00'),
(1072, 9, 1, 12, '', '2019-10-01 00:00:00'),
(1073, 10, 1, 12, '', '2019-10-01 00:00:00'),
(1074, 11, 1, 12, '', '2019-10-01 00:00:00'),
(1075, 12, 1, 12, '', '2019-10-01 00:00:00'),
(1076, 13, 1, 12, '', '2019-10-01 00:00:00'),
(1077, 15, 1, 12, '', '2019-10-01 00:00:00'),
(1078, 17, 1, 12, '', '2019-10-01 00:00:00'),
(1079, 18, 1, 12, '', '2019-10-01 00:00:00'),
(1080, 19, 1, 12, '', '2019-10-01 00:00:00'),
(1081, 22, 1, 12, '', '2019-10-01 00:00:00'),
(1082, 24, 1, 12, '', '2019-10-01 00:00:00'),
(1083, 25, 1, 12, '', '2019-10-01 00:00:00'),
(1084, 27, 1, 12, '', '2019-10-01 00:00:00'),
(1085, 29, 1, 12, '', '2019-10-01 00:00:00'),
(1086, 32, 1, 12, '', '2019-10-01 00:00:00'),
(1087, 34, 1, 12, '', '2019-10-01 00:00:00'),
(1088, 36, 1, 12, '', '2019-10-01 00:00:00'),
(1089, 38, 1, 12, '', '2019-10-01 00:00:00'),
(1090, 40, 1, 12, '', '2019-10-01 00:00:00'),
(1091, 42, 1, 12, '', '2019-10-01 00:00:00'),
(1092, 45, 1, 12, '', '2019-10-01 00:00:00'),
(1093, 9, 1, 12, '', '2019-10-03 00:00:00'),
(1094, 10, 1, 12, '', '2019-10-03 00:00:00'),
(1095, 11, 1, 12, '', '2019-10-03 00:00:00'),
(1096, 12, 1, 12, '', '2019-10-03 00:00:00'),
(1097, 13, 1, 12, '', '2019-10-03 00:00:00'),
(1098, 15, 1, 12, '', '2019-10-03 00:00:00'),
(1099, 17, 1, 12, '', '2019-10-03 00:00:00'),
(1100, 18, 1, 12, '', '2019-10-03 00:00:00'),
(1101, 19, 1, 12, '', '2019-10-03 00:00:00'),
(1102, 22, 1, 12, '', '2019-10-03 00:00:00'),
(1103, 24, 1, 12, '', '2019-10-03 00:00:00'),
(1104, 25, 1, 12, '', '2019-10-03 00:00:00'),
(1105, 27, 1, 12, '', '2019-10-03 00:00:00'),
(1106, 29, 1, 12, '', '2019-10-03 00:00:00'),
(1107, 32, 1, 12, '', '2019-10-03 00:00:00'),
(1108, 34, 2, 12, '', '2019-10-03 00:00:00'),
(1109, 36, 1, 12, '', '2019-10-03 00:00:00'),
(1110, 38, 1, 12, '', '2019-10-03 00:00:00'),
(1111, 40, 1, 12, '', '2019-10-03 00:00:00'),
(1112, 42, 1, 12, '', '2019-10-03 00:00:00'),
(1113, 45, 1, 12, '', '2019-10-03 00:00:00'),
(1114, 9, 1, 12, '', '2019-10-04 00:00:00'),
(1115, 10, 1, 12, '', '2019-10-04 00:00:00'),
(1116, 11, 1, 12, '', '2019-10-04 00:00:00'),
(1117, 12, 1, 12, '', '2019-10-04 00:00:00'),
(1118, 13, 1, 12, '', '2019-10-04 00:00:00'),
(1119, 15, 1, 12, '', '2019-10-04 00:00:00'),
(1120, 17, 1, 12, '', '2019-10-04 00:00:00'),
(1121, 18, 1, 12, '', '2019-10-04 00:00:00'),
(1122, 19, 1, 12, '', '2019-10-04 00:00:00'),
(1123, 22, 1, 12, '', '2019-10-04 00:00:00'),
(1124, 24, 1, 12, '', '2019-10-04 00:00:00'),
(1125, 25, 1, 12, '', '2019-10-04 00:00:00'),
(1126, 27, 1, 12, '', '2019-10-04 00:00:00'),
(1127, 29, 1, 12, '', '2019-10-04 00:00:00'),
(1128, 32, 1, 12, '', '2019-10-04 00:00:00'),
(1129, 34, 1, 12, '', '2019-10-04 00:00:00'),
(1130, 36, 1, 12, '', '2019-10-04 00:00:00'),
(1131, 38, 1, 12, '', '2019-10-04 00:00:00'),
(1132, 40, 1, 12, '', '2019-10-04 00:00:00'),
(1133, 42, 1, 12, '', '2019-10-04 00:00:00'),
(1134, 45, 1, 12, '', '2019-10-04 00:00:00'),
(1135, 9, 1, 12, '', '2019-10-05 00:00:00'),
(1136, 10, 1, 12, '', '2019-10-05 00:00:00'),
(1137, 11, 1, 12, '', '2019-10-05 00:00:00'),
(1138, 12, 2, 12, '', '2019-10-05 00:00:00'),
(1139, 13, 1, 12, '', '2019-10-05 00:00:00'),
(1140, 15, 1, 12, '', '2019-10-05 00:00:00'),
(1141, 17, 1, 12, '', '2019-10-05 00:00:00'),
(1142, 18, 1, 12, '', '2019-10-05 00:00:00'),
(1143, 19, 1, 12, '', '2019-10-05 00:00:00'),
(1144, 22, 1, 12, '', '2019-10-05 00:00:00'),
(1145, 24, 1, 12, '', '2019-10-05 00:00:00'),
(1146, 25, 1, 12, '', '2019-10-05 00:00:00'),
(1147, 27, 1, 12, '', '2019-10-05 00:00:00'),
(1148, 29, 1, 12, '', '2019-10-05 00:00:00'),
(1149, 32, 1, 12, '', '2019-10-05 00:00:00'),
(1150, 34, 2, 12, '', '2019-10-05 00:00:00'),
(1151, 36, 1, 12, '', '2019-10-05 00:00:00'),
(1152, 38, 2, 12, '', '2019-10-05 00:00:00'),
(1153, 40, 1, 12, '', '2019-10-05 00:00:00'),
(1154, 42, 1, 12, '', '2019-10-05 00:00:00'),
(1155, 45, 1, 12, '', '2019-10-05 00:00:00'),
(1156, 9, 1, 12, '', '2019-10-07 00:00:00'),
(1157, 10, 1, 12, '', '2019-10-07 00:00:00'),
(1158, 11, 1, 12, '', '2019-10-07 00:00:00'),
(1159, 12, 1, 12, '', '2019-10-07 00:00:00'),
(1160, 13, 1, 12, '', '2019-10-07 00:00:00'),
(1161, 15, 1, 12, '', '2019-10-07 00:00:00'),
(1162, 17, 2, 12, '', '2019-10-07 00:00:00'),
(1163, 18, 2, 12, '', '2019-10-07 00:00:00'),
(1164, 19, 2, 12, '', '2019-10-07 00:00:00'),
(1165, 22, 1, 12, '', '2019-10-07 00:00:00'),
(1166, 24, 1, 12, '', '2019-10-07 00:00:00'),
(1167, 25, 1, 12, '', '2019-10-07 00:00:00'),
(1168, 27, 1, 12, '', '2019-10-07 00:00:00'),
(1169, 29, 1, 12, '', '2019-10-07 00:00:00'),
(1170, 32, 1, 12, '', '2019-10-07 00:00:00'),
(1171, 34, 1, 12, '', '2019-10-07 00:00:00'),
(1172, 36, 1, 12, '', '2019-10-07 00:00:00'),
(1173, 38, 2, 12, '', '2019-10-07 00:00:00'),
(1174, 40, 1, 12, '', '2019-10-07 00:00:00'),
(1175, 42, 1, 12, '', '2019-10-07 00:00:00'),
(1176, 45, 1, 12, '', '2019-10-07 00:00:00'),
(1177, 9, 1, 12, '', '2019-10-10 00:00:00'),
(1178, 10, 2, 12, '', '2019-10-10 00:00:00'),
(1179, 11, 2, 12, '', '2019-10-10 00:00:00'),
(1180, 12, 1, 12, '', '2019-10-10 00:00:00'),
(1181, 13, 1, 12, '', '2019-10-10 00:00:00'),
(1182, 15, 1, 12, '', '2019-10-10 00:00:00'),
(1183, 17, 1, 12, '', '2019-10-10 00:00:00'),
(1184, 18, 1, 12, '', '2019-10-10 00:00:00'),
(1185, 19, 2, 12, '', '2019-10-10 00:00:00'),
(1186, 22, 1, 12, '', '2019-10-10 00:00:00'),
(1187, 24, 1, 12, '', '2019-10-10 00:00:00'),
(1188, 25, 1, 12, '', '2019-10-10 00:00:00'),
(1189, 27, 1, 12, '', '2019-10-10 00:00:00'),
(1190, 29, 1, 12, '', '2019-10-10 00:00:00'),
(1191, 32, 1, 12, '', '2019-10-10 00:00:00'),
(1192, 34, 2, 12, '', '2019-10-10 00:00:00'),
(1193, 36, 1, 12, '', '2019-10-10 00:00:00'),
(1194, 38, 1, 12, '', '2019-10-10 00:00:00'),
(1195, 40, 1, 12, '', '2019-10-10 00:00:00'),
(1196, 42, 1, 12, '', '2019-10-10 00:00:00'),
(1197, 45, 1, 12, '', '2019-10-10 00:00:00'),
(1198, 9, 1, 12, '', '2019-10-11 00:00:00'),
(1199, 10, 2, 12, '', '2019-10-11 00:00:00'),
(1200, 11, 2, 12, '', '2019-10-11 00:00:00'),
(1201, 12, 1, 12, '', '2019-10-11 00:00:00'),
(1202, 13, 1, 12, '', '2019-10-11 00:00:00'),
(1203, 15, 1, 12, '', '2019-10-11 00:00:00'),
(1204, 17, 1, 12, '', '2019-10-11 00:00:00'),
(1205, 18, 1, 12, '', '2019-10-11 00:00:00'),
(1206, 19, 2, 12, '', '2019-10-11 00:00:00'),
(1207, 22, 1, 12, '', '2019-10-11 00:00:00'),
(1208, 24, 1, 12, '', '2019-10-11 00:00:00'),
(1209, 25, 1, 12, '', '2019-10-11 00:00:00'),
(1210, 27, 1, 12, '', '2019-10-11 00:00:00'),
(1211, 29, 1, 12, '', '2019-10-11 00:00:00'),
(1212, 32, 1, 12, '', '2019-10-11 00:00:00'),
(1213, 34, 1, 12, '', '2019-10-11 00:00:00'),
(1214, 36, 1, 12, '', '2019-10-11 00:00:00'),
(1215, 38, 1, 12, '', '2019-10-11 00:00:00'),
(1216, 40, 1, 12, '', '2019-10-11 00:00:00'),
(1217, 42, 1, 12, '', '2019-10-11 00:00:00'),
(1218, 45, 1, 12, '', '2019-10-11 00:00:00'),
(1219, 9, 1, 12, '', '2019-10-12 00:00:00'),
(1220, 10, 2, 12, '', '2019-10-12 00:00:00');
INSERT INTO `iti_wpsp_trainee_attendances` (`id`, `student_id`, `attendance_type_id`, `instructor_id`, `reason`, `attendance_date`) VALUES
(1221, 11, 2, 12, '', '2019-10-12 00:00:00'),
(1222, 12, 1, 12, '', '2019-10-12 00:00:00'),
(1223, 13, 2, 12, '', '2019-10-12 00:00:00'),
(1224, 15, 1, 12, '', '2019-10-12 00:00:00'),
(1225, 17, 1, 12, '', '2019-10-12 00:00:00'),
(1226, 18, 1, 12, '', '2019-10-12 00:00:00'),
(1227, 19, 1, 12, '', '2019-10-12 00:00:00'),
(1228, 22, 1, 12, '', '2019-10-12 00:00:00'),
(1229, 24, 1, 12, '', '2019-10-12 00:00:00'),
(1230, 25, 1, 12, '', '2019-10-12 00:00:00'),
(1231, 27, 1, 12, '', '2019-10-12 00:00:00'),
(1232, 29, 1, 12, '', '2019-10-12 00:00:00'),
(1233, 32, 1, 12, '', '2019-10-12 00:00:00'),
(1234, 34, 1, 12, '', '2019-10-12 00:00:00'),
(1235, 36, 2, 12, '', '2019-10-12 00:00:00'),
(1236, 38, 1, 12, '', '2019-10-12 00:00:00'),
(1237, 40, 1, 12, '', '2019-10-12 00:00:00'),
(1238, 42, 1, 12, '', '2019-10-12 00:00:00'),
(1239, 45, 1, 12, '', '2019-10-12 00:00:00'),
(1240, 9, 1, 12, '', '2019-10-14 00:00:00'),
(1241, 10, 1, 12, '', '2019-10-14 00:00:00'),
(1242, 11, 1, 12, '', '2019-10-14 00:00:00'),
(1243, 12, 1, 12, '', '2019-10-14 00:00:00'),
(1244, 13, 1, 12, '', '2019-10-14 00:00:00'),
(1245, 15, 1, 12, '', '2019-10-14 00:00:00'),
(1246, 17, 1, 12, '', '2019-10-14 00:00:00'),
(1247, 18, 1, 12, '', '2019-10-14 00:00:00'),
(1248, 19, 2, 12, '', '2019-10-14 00:00:00'),
(1249, 22, 1, 12, '', '2019-10-14 00:00:00'),
(1250, 24, 1, 12, '', '2019-10-14 00:00:00'),
(1251, 25, 1, 12, '', '2019-10-14 00:00:00'),
(1252, 27, 1, 12, '', '2019-10-14 00:00:00'),
(1253, 29, 1, 12, '', '2019-10-14 00:00:00'),
(1254, 32, 1, 12, '', '2019-10-14 00:00:00'),
(1255, 34, 1, 12, '', '2019-10-14 00:00:00'),
(1256, 36, 1, 12, '', '2019-10-14 00:00:00'),
(1257, 38, 1, 12, '', '2019-10-14 00:00:00'),
(1258, 40, 1, 12, '', '2019-10-14 00:00:00'),
(1259, 42, 1, 12, '', '2019-10-14 00:00:00'),
(1260, 45, 2, 12, '', '2019-10-14 00:00:00'),
(1261, 9, 1, 12, '', '2019-10-15 00:00:00'),
(1262, 10, 1, 12, '', '2019-10-15 00:00:00'),
(1263, 11, 1, 12, '', '2019-10-15 00:00:00'),
(1264, 12, 2, 12, '', '2019-10-15 00:00:00'),
(1265, 13, 1, 12, '', '2019-10-15 00:00:00'),
(1266, 15, 1, 12, '', '2019-10-15 00:00:00'),
(1267, 17, 1, 12, '', '2019-10-15 00:00:00'),
(1268, 18, 1, 12, '', '2019-10-15 00:00:00'),
(1269, 19, 1, 12, '', '2019-10-15 00:00:00'),
(1270, 22, 1, 12, '', '2019-10-15 00:00:00'),
(1271, 24, 1, 12, '', '2019-10-15 00:00:00'),
(1272, 25, 1, 12, '', '2019-10-15 00:00:00'),
(1273, 27, 1, 12, '', '2019-10-15 00:00:00'),
(1274, 29, 1, 12, '', '2019-10-15 00:00:00'),
(1275, 32, 1, 12, '', '2019-10-15 00:00:00'),
(1276, 34, 1, 12, '', '2019-10-15 00:00:00'),
(1277, 36, 1, 12, '', '2019-10-15 00:00:00'),
(1278, 38, 1, 12, '', '2019-10-15 00:00:00'),
(1279, 40, 1, 12, '', '2019-10-15 00:00:00'),
(1280, 42, 1, 12, '', '2019-10-15 00:00:00'),
(1281, 45, 1, 12, '', '2019-10-15 00:00:00'),
(1282, 9, 1, 12, '', '2019-10-16 00:00:00'),
(1283, 10, 1, 12, '', '2019-10-16 00:00:00'),
(1284, 11, 1, 12, '', '2019-10-16 00:00:00'),
(1285, 12, 1, 12, '', '2019-10-16 00:00:00'),
(1286, 13, 1, 12, '', '2019-10-16 00:00:00'),
(1287, 15, 1, 12, '', '2019-10-16 00:00:00'),
(1288, 17, 1, 12, '', '2019-10-16 00:00:00'),
(1289, 18, 1, 12, '', '2019-10-16 00:00:00'),
(1290, 19, 1, 12, '', '2019-10-16 00:00:00'),
(1291, 22, 1, 12, '', '2019-10-16 00:00:00'),
(1292, 24, 1, 12, '', '2019-10-16 00:00:00'),
(1293, 25, 1, 12, '', '2019-10-16 00:00:00'),
(1294, 27, 2, 12, '', '2019-10-16 00:00:00'),
(1295, 29, 1, 12, '', '2019-10-16 00:00:00'),
(1296, 32, 1, 12, '', '2019-10-16 00:00:00'),
(1297, 34, 1, 12, '', '2019-10-16 00:00:00'),
(1298, 36, 1, 12, '', '2019-10-16 00:00:00'),
(1299, 38, 1, 12, '', '2019-10-16 00:00:00'),
(1300, 40, 1, 12, '', '2019-10-16 00:00:00'),
(1301, 42, 1, 12, '', '2019-10-16 00:00:00'),
(1302, 45, 1, 12, '', '2019-10-16 00:00:00'),
(1303, 9, 1, 12, '', '2019-10-17 00:00:00'),
(1304, 10, 1, 12, '', '2019-10-17 00:00:00'),
(1305, 11, 1, 12, '', '2019-10-17 00:00:00'),
(1306, 12, 1, 12, '', '2019-10-17 00:00:00'),
(1307, 13, 1, 12, '', '2019-10-17 00:00:00'),
(1308, 15, 1, 12, '', '2019-10-17 00:00:00'),
(1309, 17, 1, 12, '', '2019-10-17 00:00:00'),
(1310, 18, 1, 12, '', '2019-10-17 00:00:00'),
(1311, 19, 1, 12, '', '2019-10-17 00:00:00'),
(1312, 22, 1, 12, '', '2019-10-17 00:00:00'),
(1313, 24, 1, 12, '', '2019-10-17 00:00:00'),
(1314, 25, 1, 12, '', '2019-10-17 00:00:00'),
(1315, 27, 1, 12, '', '2019-10-17 00:00:00'),
(1316, 29, 1, 12, '', '2019-10-17 00:00:00'),
(1317, 32, 1, 12, '', '2019-10-17 00:00:00'),
(1318, 34, 1, 12, '', '2019-10-17 00:00:00'),
(1319, 36, 1, 12, '', '2019-10-17 00:00:00'),
(1320, 38, 2, 12, '', '2019-10-17 00:00:00'),
(1321, 40, 1, 12, '', '2019-10-17 00:00:00'),
(1322, 42, 1, 12, '', '2019-10-17 00:00:00'),
(1323, 45, 1, 12, '', '2019-10-17 00:00:00'),
(1324, 9, 1, 12, '', '2019-10-18 00:00:00'),
(1325, 10, 1, 12, '', '2019-10-18 00:00:00'),
(1326, 11, 1, 12, '', '2019-10-18 00:00:00'),
(1327, 12, 1, 12, '', '2019-10-18 00:00:00'),
(1328, 13, 1, 12, '', '2019-10-18 00:00:00'),
(1329, 15, 1, 12, '', '2019-10-18 00:00:00'),
(1330, 17, 1, 12, '', '2019-10-18 00:00:00'),
(1331, 18, 1, 12, '', '2019-10-18 00:00:00'),
(1332, 19, 1, 12, '', '2019-10-18 00:00:00'),
(1333, 22, 1, 12, '', '2019-10-18 00:00:00'),
(1334, 24, 1, 12, '', '2019-10-18 00:00:00'),
(1335, 25, 1, 12, '', '2019-10-18 00:00:00'),
(1336, 27, 1, 12, '', '2019-10-18 00:00:00'),
(1337, 29, 1, 12, '', '2019-10-18 00:00:00'),
(1338, 32, 1, 12, '', '2019-10-18 00:00:00'),
(1339, 34, 1, 12, '', '2019-10-18 00:00:00'),
(1340, 36, 2, 12, '', '2019-10-18 00:00:00'),
(1341, 38, 1, 12, '', '2019-10-18 00:00:00'),
(1342, 40, 1, 12, '', '2019-10-18 00:00:00'),
(1343, 42, 1, 12, '', '2019-10-18 00:00:00'),
(1344, 45, 1, 12, '', '2019-10-18 00:00:00'),
(1366, 9, 1, 12, '', '2019-10-22 00:00:00'),
(1367, 10, 1, 12, '', '2019-10-22 00:00:00'),
(1368, 11, 1, 12, '', '2019-10-22 00:00:00'),
(1369, 12, 1, 12, '', '2019-10-22 00:00:00'),
(1370, 13, 1, 12, '', '2019-10-22 00:00:00'),
(1371, 15, 1, 12, '', '2019-10-22 00:00:00'),
(1372, 17, 1, 12, '', '2019-10-22 00:00:00'),
(1373, 18, 1, 12, '', '2019-10-22 00:00:00'),
(1374, 19, 1, 12, '', '2019-10-22 00:00:00'),
(1375, 22, 1, 12, '', '2019-10-22 00:00:00'),
(1376, 24, 1, 12, '', '2019-10-22 00:00:00'),
(1377, 25, 1, 12, '', '2019-10-22 00:00:00'),
(1378, 27, 1, 12, '', '2019-10-22 00:00:00'),
(1379, 29, 1, 12, '', '2019-10-22 00:00:00'),
(1380, 32, 1, 12, '', '2019-10-22 00:00:00'),
(1381, 34, 1, 12, '', '2019-10-22 00:00:00'),
(1382, 36, 1, 12, '', '2019-10-22 00:00:00'),
(1383, 38, 1, 12, '', '2019-10-22 00:00:00'),
(1384, 40, 1, 12, '', '2019-10-22 00:00:00'),
(1385, 42, 1, 12, '', '2019-10-22 00:00:00'),
(1386, 45, 2, 12, '', '2019-10-22 00:00:00'),
(1387, 9, 1, 12, '', '2019-10-23 00:00:00'),
(1388, 10, 1, 12, '', '2019-10-23 00:00:00'),
(1389, 11, 1, 12, '', '2019-10-23 00:00:00'),
(1390, 12, 1, 12, '', '2019-10-23 00:00:00'),
(1391, 13, 1, 12, '', '2019-10-23 00:00:00'),
(1392, 15, 1, 12, '', '2019-10-23 00:00:00'),
(1393, 17, 1, 12, '', '2019-10-23 00:00:00'),
(1394, 18, 1, 12, '', '2019-10-23 00:00:00'),
(1395, 19, 1, 12, '', '2019-10-23 00:00:00'),
(1396, 22, 1, 12, '', '2019-10-23 00:00:00'),
(1397, 24, 1, 12, '', '2019-10-23 00:00:00'),
(1398, 25, 1, 12, '', '2019-10-23 00:00:00'),
(1399, 27, 1, 12, '', '2019-10-23 00:00:00'),
(1400, 29, 2, 12, '', '2019-10-23 00:00:00'),
(1401, 32, 2, 12, '', '2019-10-23 00:00:00'),
(1402, 34, 1, 12, '', '2019-10-23 00:00:00'),
(1403, 36, 2, 12, '', '2019-10-23 00:00:00'),
(1404, 38, 1, 12, '', '2019-10-23 00:00:00'),
(1405, 40, 1, 12, '', '2019-10-23 00:00:00'),
(1406, 42, 1, 12, '', '2019-10-23 00:00:00'),
(1407, 45, 1, 12, '', '2019-10-23 00:00:00'),
(1408, 9, 1, 12, '', '2019-10-24 00:00:00'),
(1409, 10, 1, 12, '', '2019-10-24 00:00:00'),
(1410, 11, 1, 12, '', '2019-10-24 00:00:00'),
(1411, 12, 1, 12, '', '2019-10-24 00:00:00'),
(1412, 13, 2, 12, '', '2019-10-24 00:00:00'),
(1413, 15, 1, 12, '', '2019-10-24 00:00:00'),
(1414, 17, 1, 12, '', '2019-10-24 00:00:00'),
(1415, 18, 1, 12, '', '2019-10-24 00:00:00'),
(1416, 19, 1, 12, '', '2019-10-24 00:00:00'),
(1417, 22, 1, 12, '', '2019-10-24 00:00:00'),
(1418, 24, 1, 12, '', '2019-10-24 00:00:00'),
(1419, 25, 1, 12, '', '2019-10-24 00:00:00'),
(1420, 27, 1, 12, '', '2019-10-24 00:00:00'),
(1421, 29, 1, 12, '', '2019-10-24 00:00:00'),
(1422, 32, 1, 12, '', '2019-10-24 00:00:00'),
(1423, 34, 1, 12, '', '2019-10-24 00:00:00'),
(1424, 36, 1, 12, '', '2019-10-24 00:00:00'),
(1425, 38, 1, 12, '', '2019-10-24 00:00:00'),
(1426, 40, 1, 12, '', '2019-10-24 00:00:00'),
(1427, 42, 1, 12, '', '2019-10-24 00:00:00'),
(1428, 45, 1, 12, '', '2019-10-24 00:00:00'),
(1429, 9, 1, 12, '', '2019-10-30 00:00:00'),
(1430, 10, 1, 12, '', '2019-10-30 00:00:00'),
(1431, 11, 1, 12, '', '2019-10-30 00:00:00'),
(1432, 12, 1, 12, '', '2019-10-30 00:00:00'),
(1433, 13, 1, 12, '', '2019-10-30 00:00:00'),
(1434, 15, 1, 12, '', '2019-10-30 00:00:00'),
(1435, 17, 1, 12, '', '2019-10-30 00:00:00'),
(1436, 18, 1, 12, '', '2019-10-30 00:00:00'),
(1437, 19, 1, 12, '', '2019-10-30 00:00:00'),
(1438, 22, 1, 12, '', '2019-10-30 00:00:00'),
(1439, 24, 1, 12, '', '2019-10-30 00:00:00'),
(1440, 25, 1, 12, '', '2019-10-30 00:00:00'),
(1441, 27, 1, 12, '', '2019-10-30 00:00:00'),
(1442, 29, 1, 12, '', '2019-10-30 00:00:00'),
(1443, 32, 1, 12, '', '2019-10-30 00:00:00'),
(1444, 34, 1, 12, '', '2019-10-30 00:00:00'),
(1445, 36, 1, 12, '', '2019-10-30 00:00:00'),
(1446, 38, 1, 12, '', '2019-10-30 00:00:00'),
(1447, 40, 1, 12, '', '2019-10-30 00:00:00'),
(1448, 42, 1, 12, '', '2019-10-30 00:00:00'),
(1449, 45, 1, 12, '', '2019-10-30 00:00:00'),
(1450, 9, 1, 12, '', '2019-10-31 00:00:00'),
(1451, 10, 1, 12, '', '2019-10-31 00:00:00'),
(1452, 11, 1, 12, '', '2019-10-31 00:00:00'),
(1453, 12, 1, 12, '', '2019-10-31 00:00:00'),
(1454, 13, 1, 12, '', '2019-10-31 00:00:00'),
(1455, 15, 1, 12, '', '2019-10-31 00:00:00'),
(1456, 17, 1, 12, '', '2019-10-31 00:00:00'),
(1457, 18, 1, 12, '', '2019-10-31 00:00:00'),
(1458, 19, 1, 12, '', '2019-10-31 00:00:00'),
(1459, 22, 1, 12, '', '2019-10-31 00:00:00'),
(1460, 24, 1, 12, '', '2019-10-31 00:00:00'),
(1461, 25, 1, 12, '', '2019-10-31 00:00:00'),
(1462, 27, 1, 12, '', '2019-10-31 00:00:00'),
(1463, 29, 1, 12, '', '2019-10-31 00:00:00'),
(1464, 32, 1, 12, '', '2019-10-31 00:00:00'),
(1465, 34, 1, 12, '', '2019-10-31 00:00:00'),
(1466, 36, 1, 12, '', '2019-10-31 00:00:00'),
(1467, 38, 1, 12, '', '2019-10-31 00:00:00'),
(1468, 40, 1, 12, '', '2019-10-31 00:00:00'),
(1469, 42, 1, 12, '', '2019-10-31 00:00:00'),
(1470, 45, 1, 12, '', '2019-10-31 00:00:00'),
(1471, 9, 1, 12, '', '2019-11-01 00:00:00'),
(1472, 10, 1, 12, '', '2019-11-01 00:00:00'),
(1473, 11, 1, 12, '', '2019-11-01 00:00:00'),
(1474, 12, 1, 12, '', '2019-11-01 00:00:00'),
(1475, 13, 1, 12, '', '2019-11-01 00:00:00'),
(1476, 15, 1, 12, '', '2019-11-01 00:00:00'),
(1477, 17, 1, 12, '', '2019-11-01 00:00:00'),
(1478, 18, 1, 12, '', '2019-11-01 00:00:00'),
(1479, 19, 1, 12, '', '2019-11-01 00:00:00'),
(1480, 22, 1, 12, '', '2019-11-01 00:00:00'),
(1481, 24, 1, 12, '', '2019-11-01 00:00:00'),
(1482, 25, 1, 12, '', '2019-11-01 00:00:00'),
(1483, 27, 1, 12, '', '2019-11-01 00:00:00'),
(1484, 29, 1, 12, '', '2019-11-01 00:00:00'),
(1485, 32, 1, 12, '', '2019-11-01 00:00:00'),
(1486, 34, 1, 12, '', '2019-11-01 00:00:00'),
(1487, 36, 1, 12, '', '2019-11-01 00:00:00'),
(1488, 38, 1, 12, '', '2019-11-01 00:00:00'),
(1489, 40, 1, 12, '', '2019-11-01 00:00:00'),
(1490, 42, 1, 12, '', '2019-11-01 00:00:00'),
(1491, 45, 1, 12, '', '2019-11-01 00:00:00'),
(1492, 9, 1, 12, '', '2019-11-02 00:00:00'),
(1493, 10, 1, 12, '', '2019-11-02 00:00:00'),
(1494, 11, 1, 12, '', '2019-11-02 00:00:00'),
(1495, 12, 1, 12, '', '2019-11-02 00:00:00'),
(1496, 13, 1, 12, '', '2019-11-02 00:00:00'),
(1497, 15, 1, 12, '', '2019-11-02 00:00:00'),
(1498, 17, 1, 12, '', '2019-11-02 00:00:00'),
(1499, 18, 1, 12, '', '2019-11-02 00:00:00'),
(1500, 19, 1, 12, '', '2019-11-02 00:00:00'),
(1501, 22, 1, 12, '', '2019-11-02 00:00:00'),
(1502, 24, 1, 12, '', '2019-11-02 00:00:00'),
(1503, 25, 1, 12, '', '2019-11-02 00:00:00'),
(1504, 27, 1, 12, '', '2019-11-02 00:00:00'),
(1505, 29, 1, 12, '', '2019-11-02 00:00:00'),
(1506, 32, 1, 12, '', '2019-11-02 00:00:00'),
(1507, 34, 1, 12, '', '2019-11-02 00:00:00'),
(1508, 36, 1, 12, '', '2019-11-02 00:00:00'),
(1509, 38, 1, 12, '', '2019-11-02 00:00:00'),
(1510, 40, 1, 12, '', '2019-11-02 00:00:00'),
(1511, 42, 1, 12, '', '2019-11-02 00:00:00'),
(1512, 45, 1, 12, '', '2019-11-02 00:00:00'),
(1513, 9, 1, 12, '', '2019-11-04 00:00:00'),
(1514, 10, 1, 12, '', '2019-11-04 00:00:00'),
(1515, 11, 1, 12, '', '2019-11-04 00:00:00'),
(1516, 12, 1, 12, '', '2019-11-04 00:00:00'),
(1517, 13, 1, 12, '', '2019-11-04 00:00:00'),
(1518, 15, 1, 12, '', '2019-11-04 00:00:00'),
(1519, 17, 1, 12, '', '2019-11-04 00:00:00'),
(1520, 18, 1, 12, '', '2019-11-04 00:00:00'),
(1521, 19, 1, 12, '', '2019-11-04 00:00:00'),
(1522, 22, 1, 12, '', '2019-11-04 00:00:00'),
(1523, 24, 1, 12, '', '2019-11-04 00:00:00'),
(1524, 25, 1, 12, '', '2019-11-04 00:00:00'),
(1525, 27, 1, 12, '', '2019-11-04 00:00:00'),
(1526, 29, 1, 12, '', '2019-11-04 00:00:00'),
(1527, 32, 1, 12, '', '2019-11-04 00:00:00'),
(1528, 34, 1, 12, '', '2019-11-04 00:00:00'),
(1529, 36, 1, 12, '', '2019-11-04 00:00:00'),
(1530, 38, 1, 12, '', '2019-11-04 00:00:00'),
(1531, 40, 1, 12, '', '2019-11-04 00:00:00'),
(1532, 42, 1, 12, '', '2019-11-04 00:00:00'),
(1533, 45, 1, 12, '', '2019-11-04 00:00:00'),
(1534, 9, 1, 12, '', '2019-11-05 00:00:00'),
(1535, 10, 1, 12, '', '2019-11-05 00:00:00'),
(1536, 11, 1, 12, '', '2019-11-05 00:00:00'),
(1537, 12, 1, 12, '', '2019-11-05 00:00:00'),
(1538, 13, 1, 12, '', '2019-11-05 00:00:00'),
(1539, 15, 1, 12, '', '2019-11-05 00:00:00'),
(1540, 17, 1, 12, '', '2019-11-05 00:00:00'),
(1541, 18, 1, 12, '', '2019-11-05 00:00:00'),
(1542, 19, 1, 12, '', '2019-11-05 00:00:00'),
(1543, 22, 1, 12, '', '2019-11-05 00:00:00'),
(1544, 24, 1, 12, '', '2019-11-05 00:00:00'),
(1545, 25, 1, 12, '', '2019-11-05 00:00:00'),
(1546, 27, 1, 12, '', '2019-11-05 00:00:00'),
(1547, 29, 1, 12, '', '2019-11-05 00:00:00'),
(1548, 32, 1, 12, '', '2019-11-05 00:00:00'),
(1549, 34, 1, 12, '', '2019-11-05 00:00:00'),
(1550, 36, 1, 12, '', '2019-11-05 00:00:00'),
(1551, 38, 1, 12, '', '2019-11-05 00:00:00'),
(1552, 40, 1, 12, '', '2019-11-05 00:00:00'),
(1553, 42, 1, 12, '', '2019-11-05 00:00:00'),
(1554, 45, 1, 12, '', '2019-11-05 00:00:00'),
(1555, 9, 1, 12, '', '2019-11-06 00:00:00'),
(1556, 10, 1, 12, '', '2019-11-06 00:00:00'),
(1557, 11, 1, 12, '', '2019-11-06 00:00:00'),
(1558, 12, 2, 12, '', '2019-11-06 00:00:00'),
(1559, 13, 1, 12, '', '2019-11-06 00:00:00'),
(1560, 15, 1, 12, '', '2019-11-06 00:00:00'),
(1561, 17, 1, 12, '', '2019-11-06 00:00:00'),
(1562, 18, 1, 12, '', '2019-11-06 00:00:00'),
(1563, 19, 1, 12, '', '2019-11-06 00:00:00'),
(1564, 22, 1, 12, '', '2019-11-06 00:00:00'),
(1565, 24, 1, 12, '', '2019-11-06 00:00:00'),
(1566, 25, 1, 12, '', '2019-11-06 00:00:00'),
(1567, 27, 1, 12, '', '2019-11-06 00:00:00'),
(1568, 29, 1, 12, '', '2019-11-06 00:00:00'),
(1569, 32, 1, 12, '', '2019-11-06 00:00:00'),
(1570, 34, 1, 12, '', '2019-11-06 00:00:00'),
(1571, 36, 2, 12, '', '2019-11-06 00:00:00'),
(1572, 38, 1, 12, '', '2019-11-06 00:00:00'),
(1573, 40, 1, 12, '', '2019-11-06 00:00:00'),
(1574, 42, 1, 12, '', '2019-11-06 00:00:00'),
(1575, 45, 1, 12, '', '2019-11-06 00:00:00'),
(1576, 9, 1, 12, '', '2019-11-08 00:00:00'),
(1577, 10, 1, 12, '', '2019-11-08 00:00:00'),
(1578, 11, 1, 12, '', '2019-11-08 00:00:00'),
(1579, 12, 1, 12, '', '2019-11-08 00:00:00'),
(1580, 13, 1, 12, '', '2019-11-08 00:00:00'),
(1581, 15, 1, 12, '', '2019-11-08 00:00:00'),
(1582, 17, 1, 12, '', '2019-11-08 00:00:00'),
(1583, 18, 1, 12, '', '2019-11-08 00:00:00'),
(1584, 19, 1, 12, '', '2019-11-08 00:00:00'),
(1585, 22, 1, 12, '', '2019-11-08 00:00:00'),
(1586, 24, 1, 12, '', '2019-11-08 00:00:00'),
(1587, 25, 1, 12, '', '2019-11-08 00:00:00'),
(1588, 27, 1, 12, '', '2019-11-08 00:00:00'),
(1589, 29, 1, 12, '', '2019-11-08 00:00:00'),
(1590, 32, 1, 12, '', '2019-11-08 00:00:00'),
(1591, 34, 1, 12, '', '2019-11-08 00:00:00'),
(1592, 36, 2, 12, '', '2019-11-08 00:00:00'),
(1593, 38, 1, 12, '', '2019-11-08 00:00:00'),
(1594, 40, 1, 12, '', '2019-11-08 00:00:00'),
(1595, 42, 1, 12, '', '2019-11-08 00:00:00'),
(1596, 45, 1, 12, '', '2019-11-08 00:00:00'),
(1597, 9, 1, 12, '', '2019-11-07 00:00:00'),
(1598, 10, 1, 12, '', '2019-11-07 00:00:00'),
(1599, 11, 1, 12, '', '2019-11-07 00:00:00'),
(1600, 12, 2, 12, '', '2019-11-07 00:00:00'),
(1601, 13, 1, 12, '', '2019-11-07 00:00:00'),
(1602, 15, 1, 12, '', '2019-11-07 00:00:00'),
(1603, 17, 1, 12, '', '2019-11-07 00:00:00'),
(1604, 18, 1, 12, '', '2019-11-07 00:00:00'),
(1605, 19, 1, 12, '', '2019-11-07 00:00:00'),
(1606, 22, 1, 12, '', '2019-11-07 00:00:00'),
(1607, 24, 1, 12, '', '2019-11-07 00:00:00'),
(1608, 25, 1, 12, '', '2019-11-07 00:00:00'),
(1609, 27, 1, 12, '', '2019-11-07 00:00:00'),
(1610, 29, 1, 12, '', '2019-11-07 00:00:00'),
(1611, 32, 1, 12, '', '2019-11-07 00:00:00'),
(1612, 34, 1, 12, '', '2019-11-07 00:00:00'),
(1613, 36, 2, 12, '', '2019-11-07 00:00:00'),
(1614, 38, 1, 12, '', '2019-11-07 00:00:00'),
(1615, 40, 1, 12, '', '2019-11-07 00:00:00'),
(1616, 42, 1, 12, '', '2019-11-07 00:00:00'),
(1617, 45, 1, 12, '', '2019-11-07 00:00:00'),
(1618, 9, 1, 12, '', '2019-11-11 00:00:00'),
(1619, 10, 1, 12, '', '2019-11-11 00:00:00'),
(1620, 11, 1, 12, '', '2019-11-11 00:00:00'),
(1621, 12, 1, 12, '', '2019-11-11 00:00:00'),
(1622, 13, 1, 12, '', '2019-11-11 00:00:00'),
(1623, 15, 1, 12, '', '2019-11-11 00:00:00'),
(1624, 17, 1, 12, '', '2019-11-11 00:00:00'),
(1625, 18, 1, 12, '', '2019-11-11 00:00:00'),
(1626, 19, 1, 12, '', '2019-11-11 00:00:00'),
(1627, 22, 1, 12, '', '2019-11-11 00:00:00'),
(1628, 24, 1, 12, '', '2019-11-11 00:00:00'),
(1629, 25, 1, 12, '', '2019-11-11 00:00:00'),
(1630, 27, 1, 12, '', '2019-11-11 00:00:00'),
(1631, 29, 1, 12, '', '2019-11-11 00:00:00'),
(1632, 32, 1, 12, '', '2019-11-11 00:00:00'),
(1633, 34, 1, 12, '', '2019-11-11 00:00:00'),
(1634, 36, 1, 12, '', '2019-11-11 00:00:00'),
(1635, 38, 1, 12, '', '2019-11-11 00:00:00'),
(1636, 40, 1, 12, '', '2019-11-11 00:00:00'),
(1637, 42, 1, 12, '', '2019-11-11 00:00:00'),
(1638, 45, 1, 12, '', '2019-11-11 00:00:00'),
(1639, 9, 1, 12, '', '2019-11-13 00:00:00'),
(1640, 10, 1, 12, '', '2019-11-13 00:00:00'),
(1641, 11, 1, 12, '', '2019-11-13 00:00:00'),
(1642, 12, 1, 12, '', '2019-11-13 00:00:00'),
(1643, 13, 1, 12, '', '2019-11-13 00:00:00'),
(1644, 15, 1, 12, '', '2019-11-13 00:00:00'),
(1645, 17, 1, 12, '', '2019-11-13 00:00:00'),
(1646, 18, 1, 12, '', '2019-11-13 00:00:00'),
(1647, 19, 1, 12, '', '2019-11-13 00:00:00'),
(1648, 22, 1, 12, '', '2019-11-13 00:00:00'),
(1649, 24, 1, 12, '', '2019-11-13 00:00:00'),
(1650, 25, 1, 12, '', '2019-11-13 00:00:00'),
(1651, 27, 1, 12, '', '2019-11-13 00:00:00'),
(1652, 29, 1, 12, '', '2019-11-13 00:00:00'),
(1653, 32, 1, 12, '', '2019-11-13 00:00:00'),
(1654, 34, 1, 12, '', '2019-11-13 00:00:00'),
(1655, 36, 1, 12, '', '2019-11-13 00:00:00'),
(1656, 38, 1, 12, '', '2019-11-13 00:00:00'),
(1657, 40, 1, 12, '', '2019-11-13 00:00:00'),
(1658, 42, 1, 12, '', '2019-11-13 00:00:00'),
(1659, 45, 1, 12, '', '2019-11-13 00:00:00'),
(1660, 9, 1, 12, '', '2019-11-14 00:00:00'),
(1661, 10, 1, 12, '', '2019-11-14 00:00:00'),
(1662, 11, 1, 12, '', '2019-11-14 00:00:00'),
(1663, 12, 1, 12, '', '2019-11-14 00:00:00'),
(1664, 13, 1, 12, '', '2019-11-14 00:00:00'),
(1665, 15, 1, 12, '', '2019-11-14 00:00:00'),
(1666, 17, 1, 12, '', '2019-11-14 00:00:00'),
(1667, 18, 1, 12, '', '2019-11-14 00:00:00'),
(1668, 19, 1, 12, '', '2019-11-14 00:00:00'),
(1669, 22, 1, 12, '', '2019-11-14 00:00:00'),
(1670, 24, 1, 12, '', '2019-11-14 00:00:00'),
(1671, 25, 1, 12, '', '2019-11-14 00:00:00'),
(1672, 27, 1, 12, '', '2019-11-14 00:00:00'),
(1673, 29, 1, 12, '', '2019-11-14 00:00:00'),
(1674, 32, 1, 12, '', '2019-11-14 00:00:00'),
(1675, 34, 1, 12, '', '2019-11-14 00:00:00'),
(1676, 36, 1, 12, '', '2019-11-14 00:00:00'),
(1677, 38, 1, 12, '', '2019-11-14 00:00:00'),
(1678, 40, 1, 12, '', '2019-11-14 00:00:00'),
(1679, 42, 1, 12, '', '2019-11-14 00:00:00'),
(1680, 45, 1, 12, '', '2019-11-14 00:00:00'),
(1681, 9, 1, 12, '', '2019-11-15 00:00:00'),
(1682, 10, 1, 12, '', '2019-11-15 00:00:00'),
(1683, 11, 1, 12, '', '2019-11-15 00:00:00'),
(1684, 12, 1, 12, '', '2019-11-15 00:00:00'),
(1685, 13, 1, 12, '', '2019-11-15 00:00:00'),
(1686, 15, 1, 12, '', '2019-11-15 00:00:00'),
(1687, 17, 1, 12, '', '2019-11-15 00:00:00'),
(1688, 18, 1, 12, '', '2019-11-15 00:00:00'),
(1689, 19, 1, 12, '', '2019-11-15 00:00:00'),
(1690, 22, 1, 12, '', '2019-11-15 00:00:00'),
(1691, 24, 1, 12, '', '2019-11-15 00:00:00'),
(1692, 25, 1, 12, '', '2019-11-15 00:00:00'),
(1693, 27, 1, 12, '', '2019-11-15 00:00:00'),
(1694, 29, 1, 12, '', '2019-11-15 00:00:00'),
(1695, 32, 1, 12, '', '2019-11-15 00:00:00'),
(1696, 34, 1, 12, '', '2019-11-15 00:00:00'),
(1697, 36, 1, 12, '', '2019-11-15 00:00:00'),
(1698, 38, 1, 12, '', '2019-11-15 00:00:00'),
(1699, 40, 1, 12, '', '2019-11-15 00:00:00'),
(1700, 42, 1, 12, '', '2019-11-15 00:00:00'),
(1701, 45, 1, 12, '', '2019-11-15 00:00:00'),
(1702, 9, 1, 12, '', '2019-11-18 00:00:00'),
(1703, 10, 1, 12, '', '2019-11-18 00:00:00'),
(1704, 11, 1, 12, '', '2019-11-18 00:00:00'),
(1705, 12, 1, 12, '', '2019-11-18 00:00:00'),
(1706, 13, 1, 12, '', '2019-11-18 00:00:00'),
(1707, 15, 1, 12, '', '2019-11-18 00:00:00'),
(1708, 17, 1, 12, '', '2019-11-18 00:00:00'),
(1709, 18, 1, 12, '', '2019-11-18 00:00:00'),
(1710, 19, 1, 12, '', '2019-11-18 00:00:00'),
(1711, 22, 1, 12, '', '2019-11-18 00:00:00'),
(1712, 24, 1, 12, '', '2019-11-18 00:00:00'),
(1713, 25, 1, 12, '', '2019-11-18 00:00:00'),
(1714, 27, 1, 12, '', '2019-11-18 00:00:00'),
(1715, 29, 1, 12, '', '2019-11-18 00:00:00'),
(1716, 32, 1, 12, '', '2019-11-18 00:00:00'),
(1717, 34, 1, 12, '', '2019-11-18 00:00:00'),
(1718, 36, 1, 12, '', '2019-11-18 00:00:00'),
(1719, 38, 1, 12, '', '2019-11-18 00:00:00'),
(1720, 40, 1, 12, '', '2019-11-18 00:00:00'),
(1721, 42, 1, 12, '', '2019-11-18 00:00:00'),
(1722, 45, 1, 12, '', '2019-11-18 00:00:00'),
(1723, 9, 1, 12, '', '2019-11-19 00:00:00'),
(1724, 10, 2, 12, '', '2019-11-19 00:00:00'),
(1725, 11, 2, 12, '', '2019-11-19 00:00:00'),
(1726, 12, 2, 12, '', '2019-11-19 00:00:00'),
(1727, 13, 1, 12, '', '2019-11-19 00:00:00'),
(1728, 15, 1, 12, '', '2019-11-19 00:00:00'),
(1729, 17, 1, 12, '', '2019-11-19 00:00:00'),
(1730, 18, 1, 12, '', '2019-11-19 00:00:00'),
(1731, 19, 1, 12, '', '2019-11-19 00:00:00'),
(1732, 22, 1, 12, '', '2019-11-19 00:00:00'),
(1733, 24, 1, 12, '', '2019-11-19 00:00:00'),
(1734, 25, 1, 12, '', '2019-11-19 00:00:00'),
(1735, 27, 1, 12, '', '2019-11-19 00:00:00'),
(1736, 29, 1, 12, '', '2019-11-19 00:00:00'),
(1737, 32, 1, 12, '', '2019-11-19 00:00:00'),
(1738, 34, 1, 12, '', '2019-11-19 00:00:00'),
(1739, 36, 2, 12, '', '2019-11-19 00:00:00'),
(1740, 38, 1, 12, '', '2019-11-19 00:00:00'),
(1741, 40, 1, 12, '', '2019-11-19 00:00:00'),
(1742, 42, 1, 12, '', '2019-11-19 00:00:00'),
(1743, 45, 1, 12, '', '2019-11-19 00:00:00'),
(1744, 9, 1, 12, '', '2019-11-20 00:00:00'),
(1745, 10, 2, 12, '', '2019-11-20 00:00:00'),
(1746, 11, 2, 12, '', '2019-11-20 00:00:00'),
(1747, 12, 1, 12, '', '2019-11-20 00:00:00'),
(1748, 13, 1, 12, '', '2019-11-20 00:00:00'),
(1749, 15, 1, 12, '', '2019-11-20 00:00:00'),
(1750, 17, 1, 12, '', '2019-11-20 00:00:00'),
(1751, 18, 1, 12, '', '2019-11-20 00:00:00'),
(1752, 19, 1, 12, '', '2019-11-20 00:00:00'),
(1753, 22, 1, 12, '', '2019-11-20 00:00:00'),
(1754, 24, 1, 12, '', '2019-11-20 00:00:00'),
(1755, 25, 1, 12, '', '2019-11-20 00:00:00'),
(1756, 27, 1, 12, '', '2019-11-20 00:00:00'),
(1757, 29, 1, 12, '', '2019-11-20 00:00:00'),
(1758, 32, 2, 12, '', '2019-11-20 00:00:00'),
(1759, 34, 1, 12, '', '2019-11-20 00:00:00'),
(1760, 36, 1, 12, '', '2019-11-20 00:00:00'),
(1761, 38, 1, 12, '', '2019-11-20 00:00:00'),
(1762, 40, 1, 12, '', '2019-11-20 00:00:00'),
(1763, 42, 1, 12, '', '2019-11-20 00:00:00'),
(1764, 45, 1, 12, '', '2019-11-20 00:00:00'),
(1765, 9, 1, 12, '', '2019-11-21 00:00:00'),
(1766, 10, 1, 12, '', '2019-11-21 00:00:00'),
(1767, 11, 1, 12, '', '2019-11-21 00:00:00'),
(1768, 12, 1, 12, '', '2019-11-21 00:00:00'),
(1769, 13, 1, 12, '', '2019-11-21 00:00:00'),
(1770, 15, 1, 12, '', '2019-11-21 00:00:00'),
(1771, 17, 1, 12, '', '2019-11-21 00:00:00'),
(1772, 18, 1, 12, '', '2019-11-21 00:00:00'),
(1773, 19, 2, 12, '', '2019-11-21 00:00:00'),
(1774, 22, 1, 12, '', '2019-11-21 00:00:00'),
(1775, 24, 1, 12, '', '2019-11-21 00:00:00'),
(1776, 25, 1, 12, '', '2019-11-21 00:00:00'),
(1777, 27, 2, 12, '', '2019-11-21 00:00:00'),
(1778, 29, 1, 12, '', '2019-11-21 00:00:00'),
(1779, 32, 1, 12, '', '2019-11-21 00:00:00'),
(1780, 34, 1, 12, '', '2019-11-21 00:00:00'),
(1781, 36, 1, 12, '', '2019-11-21 00:00:00'),
(1782, 38, 2, 12, '', '2019-11-21 00:00:00'),
(1783, 40, 1, 12, '', '2019-11-21 00:00:00'),
(1784, 42, 1, 12, '', '2019-11-21 00:00:00'),
(1785, 45, 2, 12, '', '2019-11-21 00:00:00'),
(1786, 9, 1, 12, '', '2019-11-22 00:00:00'),
(1787, 10, 1, 12, '', '2019-11-22 00:00:00'),
(1788, 11, 1, 12, '', '2019-11-22 00:00:00'),
(1789, 12, 2, 12, '', '2019-11-22 00:00:00'),
(1790, 13, 2, 12, '', '2019-11-22 00:00:00'),
(1791, 15, 1, 12, '', '2019-11-22 00:00:00'),
(1792, 17, 1, 12, '', '2019-11-22 00:00:00'),
(1793, 18, 1, 12, '', '2019-11-22 00:00:00'),
(1794, 19, 1, 12, '', '2019-11-22 00:00:00'),
(1795, 22, 1, 12, '', '2019-11-22 00:00:00'),
(1796, 24, 1, 12, '', '2019-11-22 00:00:00'),
(1797, 25, 1, 12, '', '2019-11-22 00:00:00'),
(1798, 27, 1, 12, '', '2019-11-22 00:00:00'),
(1799, 29, 2, 12, '', '2019-11-22 00:00:00'),
(1800, 32, 1, 12, '', '2019-11-22 00:00:00'),
(1801, 34, 2, 12, '', '2019-11-22 00:00:00'),
(1802, 36, 2, 12, '', '2019-11-22 00:00:00'),
(1803, 38, 1, 12, '', '2019-11-22 00:00:00'),
(1804, 40, 1, 12, '', '2019-11-22 00:00:00'),
(1805, 42, 1, 12, '', '2019-11-22 00:00:00'),
(1806, 45, 2, 12, '', '2019-11-22 00:00:00'),
(1807, 9, 1, 12, '', '2019-10-25 00:00:00'),
(1808, 10, 2, 12, '', '2019-10-25 00:00:00'),
(1809, 11, 2, 12, '', '2019-10-25 00:00:00'),
(1810, 12, 1, 12, '', '2019-10-25 00:00:00'),
(1811, 13, 1, 12, '', '2019-10-25 00:00:00'),
(1812, 15, 1, 12, '', '2019-10-25 00:00:00'),
(1813, 17, 1, 12, '', '2019-10-25 00:00:00'),
(1814, 18, 1, 12, '', '2019-10-25 00:00:00'),
(1815, 19, 2, 12, '', '2019-10-25 00:00:00'),
(1816, 22, 1, 12, '', '2019-10-25 00:00:00'),
(1817, 24, 1, 12, '', '2019-10-25 00:00:00'),
(1818, 25, 1, 12, '', '2019-10-25 00:00:00'),
(1819, 27, 1, 12, '', '2019-10-25 00:00:00'),
(1820, 29, 1, 12, '', '2019-10-25 00:00:00'),
(1821, 32, 1, 12, '', '2019-10-25 00:00:00'),
(1822, 34, 1, 12, '', '2019-10-25 00:00:00'),
(1823, 36, 1, 12, '', '2019-10-25 00:00:00'),
(1824, 38, 1, 12, '', '2019-10-25 00:00:00'),
(1825, 40, 1, 12, '', '2019-10-25 00:00:00'),
(1826, 42, 1, 12, '', '2019-10-25 00:00:00'),
(1827, 45, 1, 12, '', '2019-10-25 00:00:00'),
(1828, 9, 1, 12, '', '2019-11-26 00:00:00'),
(1829, 10, 2, 12, '', '2019-11-26 00:00:00'),
(1830, 11, 1, 12, '', '2019-11-26 00:00:00'),
(1831, 12, 2, 12, '', '2019-11-26 00:00:00'),
(1832, 13, 1, 12, '', '2019-11-26 00:00:00'),
(1833, 15, 1, 12, '', '2019-11-26 00:00:00'),
(1834, 17, 1, 12, '', '2019-11-26 00:00:00'),
(1835, 18, 1, 12, '', '2019-11-26 00:00:00'),
(1836, 19, 2, 12, '', '2019-11-26 00:00:00'),
(1837, 22, 1, 12, '', '2019-11-26 00:00:00'),
(1838, 24, 1, 12, '', '2019-11-26 00:00:00'),
(1839, 25, 1, 12, '', '2019-11-26 00:00:00'),
(1840, 27, 1, 12, '', '2019-11-26 00:00:00'),
(1841, 29, 1, 12, '', '2019-11-26 00:00:00'),
(1842, 32, 1, 12, '', '2019-11-26 00:00:00'),
(1843, 34, 1, 12, '', '2019-11-26 00:00:00'),
(1844, 36, 1, 12, '', '2019-11-26 00:00:00'),
(1845, 38, 1, 12, '', '2019-11-26 00:00:00'),
(1846, 40, 1, 12, '', '2019-11-26 00:00:00'),
(1847, 42, 1, 12, '', '2019-11-26 00:00:00'),
(1848, 45, 1, 12, '', '2019-11-26 00:00:00'),
(1849, 9, 1, 12, '', '2019-11-27 00:00:00'),
(1850, 10, 1, 12, '', '2019-11-27 00:00:00'),
(1851, 11, 1, 12, '', '2019-11-27 00:00:00'),
(1852, 12, 1, 12, '', '2019-11-27 00:00:00'),
(1853, 13, 1, 12, '', '2019-11-27 00:00:00'),
(1854, 15, 1, 12, '', '2019-11-27 00:00:00'),
(1855, 17, 1, 12, '', '2019-11-27 00:00:00'),
(1856, 18, 1, 12, '', '2019-11-27 00:00:00'),
(1857, 19, 1, 12, '', '2019-11-27 00:00:00'),
(1858, 22, 2, 12, '', '2019-11-27 00:00:00'),
(1859, 24, 1, 12, '', '2019-11-27 00:00:00'),
(1860, 25, 2, 12, '', '2019-11-27 00:00:00'),
(1861, 27, 1, 12, '', '2019-11-27 00:00:00'),
(1862, 29, 1, 12, '', '2019-11-27 00:00:00'),
(1863, 32, 1, 12, '', '2019-11-27 00:00:00'),
(1864, 34, 1, 12, '', '2019-11-27 00:00:00'),
(1865, 36, 2, 12, '', '2019-11-27 00:00:00'),
(1866, 38, 1, 12, '', '2019-11-27 00:00:00'),
(1867, 40, 1, 12, '', '2019-11-27 00:00:00'),
(1868, 42, 1, 12, '', '2019-11-27 00:00:00'),
(1869, 45, 1, 12, '', '2019-11-27 00:00:00'),
(1870, 9, 1, 12, '', '2019-11-28 00:00:00'),
(1871, 10, 1, 12, '', '2019-11-28 00:00:00'),
(1872, 11, 1, 12, '', '2019-11-28 00:00:00'),
(1873, 12, 1, 12, '', '2019-11-28 00:00:00'),
(1874, 13, 2, 12, '', '2019-11-28 00:00:00'),
(1875, 15, 1, 12, '', '2019-11-28 00:00:00'),
(1876, 17, 1, 12, '', '2019-11-28 00:00:00'),
(1877, 18, 1, 12, '', '2019-11-28 00:00:00'),
(1878, 19, 1, 12, '', '2019-11-28 00:00:00'),
(1879, 22, 1, 12, '', '2019-11-28 00:00:00'),
(1880, 24, 1, 12, '', '2019-11-28 00:00:00'),
(1881, 25, 1, 12, '', '2019-11-28 00:00:00'),
(1882, 27, 2, 12, '', '2019-11-28 00:00:00'),
(1883, 29, 1, 12, '', '2019-11-28 00:00:00'),
(1884, 32, 2, 12, '', '2019-11-28 00:00:00'),
(1885, 34, 1, 12, '', '2019-11-28 00:00:00'),
(1886, 36, 1, 12, '', '2019-11-28 00:00:00'),
(1887, 38, 2, 12, '', '2019-11-28 00:00:00'),
(1888, 40, 1, 12, '', '2019-11-28 00:00:00'),
(1889, 42, 1, 12, '', '2019-11-28 00:00:00'),
(1890, 45, 1, 12, '', '2019-11-28 00:00:00'),
(1891, 9, 1, 12, '', '2019-10-29 00:00:00'),
(1892, 10, 1, 12, '', '2019-10-29 00:00:00'),
(1893, 11, 1, 12, '', '2019-10-29 00:00:00'),
(1894, 12, 1, 12, '', '2019-10-29 00:00:00'),
(1895, 13, 2, 12, '', '2019-10-29 00:00:00'),
(1896, 15, 1, 12, '', '2019-10-29 00:00:00'),
(1897, 17, 1, 12, '', '2019-10-29 00:00:00'),
(1898, 18, 1, 12, '', '2019-10-29 00:00:00'),
(1899, 19, 1, 12, '', '2019-10-29 00:00:00'),
(1900, 22, 1, 12, '', '2019-10-29 00:00:00'),
(1901, 24, 2, 12, '', '2019-10-29 00:00:00'),
(1902, 25, 1, 12, '', '2019-10-29 00:00:00'),
(1903, 27, 1, 12, '', '2019-10-29 00:00:00'),
(1904, 29, 1, 12, '', '2019-10-29 00:00:00'),
(1905, 32, 2, 12, '', '2019-10-29 00:00:00'),
(1906, 34, 1, 12, '', '2019-10-29 00:00:00'),
(1907, 36, 1, 12, '', '2019-10-29 00:00:00'),
(1908, 38, 2, 12, '', '2019-10-29 00:00:00'),
(1909, 40, 1, 12, '', '2019-10-29 00:00:00'),
(1910, 42, 1, 12, '', '2019-10-29 00:00:00'),
(1911, 45, 1, 12, '', '2019-10-29 00:00:00'),
(1912, 9, 1, 12, '', '2019-11-30 00:00:00'),
(1913, 10, 1, 12, '', '2019-11-30 00:00:00'),
(1914, 11, 1, 12, '', '2019-11-30 00:00:00'),
(1915, 12, 1, 12, '', '2019-11-30 00:00:00'),
(1916, 13, 1, 12, '', '2019-11-30 00:00:00'),
(1917, 15, 1, 12, '', '2019-11-30 00:00:00'),
(1918, 17, 1, 12, '', '2019-11-30 00:00:00'),
(1919, 18, 1, 12, '', '2019-11-30 00:00:00'),
(1920, 19, 1, 12, '', '2019-11-30 00:00:00'),
(1921, 22, 2, 12, '', '2019-11-30 00:00:00'),
(1922, 24, 1, 12, '', '2019-11-30 00:00:00'),
(1923, 25, 2, 12, '', '2019-11-30 00:00:00'),
(1924, 27, 1, 12, '', '2019-11-30 00:00:00'),
(1925, 29, 1, 12, '', '2019-11-30 00:00:00'),
(1926, 32, 1, 12, '', '2019-11-30 00:00:00'),
(1927, 34, 1, 12, '', '2019-11-30 00:00:00'),
(1928, 36, 1, 12, '', '2019-11-30 00:00:00'),
(1929, 38, 1, 12, '', '2019-11-30 00:00:00'),
(1930, 40, 1, 12, '', '2019-11-30 00:00:00'),
(1931, 42, 1, 12, '', '2019-11-30 00:00:00'),
(1932, 45, 1, 12, '', '2019-11-30 00:00:00'),
(1933, 9, 1, 12, '', '2019-11-16 00:00:00'),
(1934, 10, 1, 12, '', '2019-11-16 00:00:00'),
(1935, 11, 1, 12, '', '2019-11-16 00:00:00'),
(1936, 12, 1, 12, '', '2019-11-16 00:00:00'),
(1937, 13, 1, 12, '', '2019-11-16 00:00:00'),
(1938, 15, 1, 12, '', '2019-11-16 00:00:00'),
(1939, 17, 1, 12, '', '2019-11-16 00:00:00'),
(1940, 18, 1, 12, '', '2019-11-16 00:00:00'),
(1941, 19, 1, 12, '', '2019-11-16 00:00:00'),
(1942, 22, 1, 12, '', '2019-11-16 00:00:00'),
(1943, 24, 1, 12, '', '2019-11-16 00:00:00'),
(1944, 25, 1, 12, '', '2019-11-16 00:00:00'),
(1945, 27, 1, 12, '', '2019-11-16 00:00:00'),
(1946, 29, 1, 12, '', '2019-11-16 00:00:00'),
(1947, 32, 1, 12, '', '2019-11-16 00:00:00'),
(1948, 34, 1, 12, '', '2019-11-16 00:00:00'),
(1949, 36, 1, 12, '', '2019-11-16 00:00:00'),
(1950, 38, 1, 12, '', '2019-11-16 00:00:00'),
(1951, 40, 1, 12, '', '2019-11-16 00:00:00'),
(1952, 42, 1, 12, '', '2019-11-16 00:00:00'),
(1953, 45, 1, 12, '', '2019-11-16 00:00:00'),
(1954, 9, 1, 12, '', '2019-11-25 00:00:00'),
(1955, 10, 2, 12, '', '2019-11-25 00:00:00'),
(1956, 11, 2, 12, '', '2019-11-25 00:00:00'),
(1957, 12, 1, 12, '', '2019-11-25 00:00:00'),
(1958, 13, 1, 12, '', '2019-11-25 00:00:00'),
(1959, 15, 1, 12, '', '2019-11-25 00:00:00'),
(1960, 17, 1, 12, '', '2019-11-25 00:00:00'),
(1961, 18, 1, 12, '', '2019-11-25 00:00:00'),
(1962, 19, 2, 12, '', '2019-11-25 00:00:00'),
(1963, 22, 1, 12, '', '2019-11-25 00:00:00'),
(1964, 24, 1, 12, '', '2019-11-25 00:00:00'),
(1965, 25, 1, 12, '', '2019-11-25 00:00:00'),
(1966, 27, 1, 12, '', '2019-11-25 00:00:00'),
(1967, 29, 1, 12, '', '2019-11-25 00:00:00'),
(1968, 32, 1, 12, '', '2019-11-25 00:00:00'),
(1969, 34, 1, 12, '', '2019-11-25 00:00:00'),
(1970, 36, 1, 12, '', '2019-11-25 00:00:00'),
(1971, 38, 1, 12, '', '2019-11-25 00:00:00'),
(1972, 40, 1, 12, '', '2019-11-25 00:00:00'),
(1973, 42, 1, 12, '', '2019-11-25 00:00:00'),
(1974, 45, 1, 12, '', '2019-11-25 00:00:00'),
(1975, 9, 1, 12, '', '2019-11-29 00:00:00'),
(1976, 10, 1, 12, '', '2019-11-29 00:00:00'),
(1977, 11, 1, 12, '', '2019-11-29 00:00:00'),
(1978, 12, 1, 12, '', '2019-11-29 00:00:00'),
(1979, 13, 2, 12, '', '2019-11-29 00:00:00'),
(1980, 15, 1, 12, '', '2019-11-29 00:00:00'),
(1981, 17, 1, 12, '', '2019-11-29 00:00:00'),
(1982, 18, 1, 12, '', '2019-11-29 00:00:00'),
(1983, 19, 1, 12, '', '2019-11-29 00:00:00'),
(1984, 22, 1, 12, '', '2019-11-29 00:00:00'),
(1985, 24, 2, 12, '', '2019-11-29 00:00:00'),
(1986, 25, 1, 12, '', '2019-11-29 00:00:00'),
(1987, 27, 1, 12, '', '2019-11-29 00:00:00'),
(1988, 29, 1, 12, '', '2019-11-29 00:00:00'),
(1989, 32, 2, 12, '', '2019-11-29 00:00:00'),
(1990, 34, 1, 12, '', '2019-11-29 00:00:00'),
(1991, 36, 1, 12, '', '2019-11-29 00:00:00'),
(1992, 38, 2, 12, '', '2019-11-29 00:00:00'),
(1993, 40, 1, 12, '', '2019-11-29 00:00:00'),
(1994, 42, 1, 12, '', '2019-11-29 00:00:00'),
(1995, 45, 1, 12, '', '2019-11-29 00:00:00'),
(1996, 9, 1, 12, '', '2019-12-02 00:00:00'),
(1997, 10, 1, 12, '', '2019-12-02 00:00:00'),
(1998, 11, 1, 12, '', '2019-12-02 00:00:00'),
(1999, 12, 1, 12, '', '2019-12-02 00:00:00'),
(2000, 13, 1, 12, '', '2019-12-02 00:00:00'),
(2001, 15, 1, 12, '', '2019-12-02 00:00:00'),
(2002, 17, 1, 12, '', '2019-12-02 00:00:00'),
(2003, 18, 1, 12, '', '2019-12-02 00:00:00'),
(2004, 19, 1, 12, '', '2019-12-02 00:00:00'),
(2005, 22, 1, 12, '', '2019-12-02 00:00:00'),
(2006, 24, 1, 12, '', '2019-12-02 00:00:00'),
(2007, 25, 1, 12, '', '2019-12-02 00:00:00'),
(2008, 27, 1, 12, '', '2019-12-02 00:00:00'),
(2009, 29, 1, 12, '', '2019-12-02 00:00:00'),
(2010, 32, 1, 12, '', '2019-12-02 00:00:00'),
(2011, 34, 1, 12, '', '2019-12-02 00:00:00'),
(2012, 36, 1, 12, '', '2019-12-02 00:00:00'),
(2013, 38, 1, 12, '', '2019-12-02 00:00:00'),
(2014, 40, 1, 12, '', '2019-12-02 00:00:00'),
(2015, 42, 1, 12, '', '2019-12-02 00:00:00'),
(2016, 45, 1, 12, '', '2019-12-02 00:00:00'),
(2017, 9, 1, 12, '', '2019-12-03 00:00:00'),
(2018, 10, 1, 12, '', '2019-12-03 00:00:00'),
(2019, 11, 1, 12, '', '2019-12-03 00:00:00'),
(2020, 12, 1, 12, '', '2019-12-03 00:00:00'),
(2021, 13, 1, 12, '', '2019-12-03 00:00:00'),
(2022, 15, 1, 12, '', '2019-12-03 00:00:00'),
(2023, 17, 1, 12, '', '2019-12-03 00:00:00'),
(2024, 18, 1, 12, '', '2019-12-03 00:00:00'),
(2025, 19, 1, 12, '', '2019-12-03 00:00:00'),
(2026, 22, 1, 12, '', '2019-12-03 00:00:00'),
(2027, 24, 1, 12, '', '2019-12-03 00:00:00'),
(2028, 25, 1, 12, '', '2019-12-03 00:00:00'),
(2029, 27, 1, 12, '', '2019-12-03 00:00:00'),
(2030, 29, 1, 12, '', '2019-12-03 00:00:00'),
(2031, 32, 1, 12, '', '2019-12-03 00:00:00'),
(2032, 34, 1, 12, '', '2019-12-03 00:00:00'),
(2033, 36, 1, 12, '', '2019-12-03 00:00:00'),
(2034, 38, 1, 12, '', '2019-12-03 00:00:00'),
(2035, 40, 1, 12, '', '2019-12-03 00:00:00'),
(2036, 42, 1, 12, '', '2019-12-03 00:00:00'),
(2037, 45, 1, 12, '', '2019-12-03 00:00:00'),
(2059, 9, 1, 12, '', '2019-12-04 00:00:00'),
(2060, 10, 1, 12, '', '2019-12-04 00:00:00'),
(2061, 11, 1, 12, '', '2019-12-04 00:00:00'),
(2062, 12, 1, 12, '', '2019-12-04 00:00:00'),
(2063, 13, 1, 12, '', '2019-12-04 00:00:00'),
(2064, 15, 1, 12, '', '2019-12-04 00:00:00'),
(2065, 17, 1, 12, '', '2019-12-04 00:00:00'),
(2066, 18, 1, 12, '', '2019-12-04 00:00:00'),
(2067, 19, 1, 12, '', '2019-12-04 00:00:00'),
(2068, 22, 1, 12, '', '2019-12-04 00:00:00'),
(2069, 24, 1, 12, '', '2019-12-04 00:00:00'),
(2070, 25, 1, 12, '', '2019-12-04 00:00:00'),
(2071, 27, 1, 12, '', '2019-12-04 00:00:00'),
(2072, 29, 2, 12, '', '2019-12-04 00:00:00'),
(2073, 32, 1, 12, '', '2019-12-04 00:00:00'),
(2074, 34, 1, 12, '', '2019-12-04 00:00:00'),
(2075, 36, 1, 12, '', '2019-12-04 00:00:00'),
(2076, 38, 1, 12, '', '2019-12-04 00:00:00'),
(2077, 40, 1, 12, '', '2019-12-04 00:00:00'),
(2078, 42, 1, 12, '', '2019-12-04 00:00:00'),
(2079, 45, 1, 12, '', '2019-12-04 00:00:00'),
(2080, 9, 1, 12, '', '2019-12-05 00:00:00'),
(2081, 10, 1, 12, '', '2019-12-05 00:00:00'),
(2082, 11, 1, 12, '', '2019-12-05 00:00:00'),
(2083, 12, 1, 12, '', '2019-12-05 00:00:00'),
(2084, 13, 1, 12, '', '2019-12-05 00:00:00'),
(2085, 15, 1, 12, '', '2019-12-05 00:00:00'),
(2086, 17, 2, 12, '', '2019-12-05 00:00:00'),
(2087, 18, 1, 12, '', '2019-12-05 00:00:00'),
(2088, 19, 1, 12, '', '2019-12-05 00:00:00'),
(2089, 22, 1, 12, '', '2019-12-05 00:00:00'),
(2090, 24, 1, 12, '', '2019-12-05 00:00:00'),
(2091, 25, 1, 12, '', '2019-12-05 00:00:00'),
(2092, 27, 1, 12, '', '2019-12-05 00:00:00'),
(2093, 29, 1, 12, '', '2019-12-05 00:00:00'),
(2094, 32, 2, 12, '', '2019-12-05 00:00:00'),
(2095, 34, 1, 12, '', '2019-12-05 00:00:00'),
(2096, 36, 1, 12, '', '2019-12-05 00:00:00'),
(2097, 38, 2, 12, '', '2019-12-05 00:00:00'),
(2098, 40, 1, 12, '', '2019-12-05 00:00:00'),
(2099, 42, 2, 12, '', '2019-12-05 00:00:00'),
(2100, 45, 1, 12, '', '2019-12-05 00:00:00'),
(2101, 9, 1, 12, '', '2019-12-06 00:00:00'),
(2102, 10, 1, 12, '', '2019-12-06 00:00:00'),
(2103, 11, 1, 12, '', '2019-12-06 00:00:00'),
(2104, 12, 1, 12, '', '2019-12-06 00:00:00'),
(2105, 13, 1, 12, '', '2019-12-06 00:00:00'),
(2106, 15, 1, 12, '', '2019-12-06 00:00:00'),
(2107, 17, 2, 12, '', '2019-12-06 00:00:00'),
(2108, 18, 2, 12, '', '2019-12-06 00:00:00'),
(2109, 19, 2, 12, '', '2019-12-06 00:00:00'),
(2110, 22, 1, 12, '', '2019-12-06 00:00:00'),
(2111, 24, 1, 12, '', '2019-12-06 00:00:00'),
(2112, 25, 1, 12, '', '2019-12-06 00:00:00'),
(2113, 27, 1, 12, '', '2019-12-06 00:00:00'),
(2114, 29, 1, 12, '', '2019-12-06 00:00:00'),
(2115, 32, 1, 12, '', '2019-12-06 00:00:00'),
(2116, 34, 2, 12, '', '2019-12-06 00:00:00'),
(2117, 36, 1, 12, '', '2019-12-06 00:00:00'),
(2118, 38, 1, 12, '', '2019-12-06 00:00:00'),
(2119, 40, 1, 12, '', '2019-12-06 00:00:00'),
(2120, 42, 1, 12, '', '2019-12-06 00:00:00'),
(2121, 45, 1, 12, '', '2019-12-06 00:00:00'),
(2122, 9, 1, 12, '', '2019-12-07 00:00:00'),
(2123, 10, 1, 12, '', '2019-12-07 00:00:00'),
(2124, 11, 1, 12, '', '2019-12-07 00:00:00'),
(2125, 12, 1, 12, '', '2019-12-07 00:00:00'),
(2126, 13, 2, 12, '', '2019-12-07 00:00:00'),
(2127, 15, 1, 12, '', '2019-12-07 00:00:00'),
(2128, 17, 1, 12, '', '2019-12-07 00:00:00'),
(2129, 18, 1, 12, '', '2019-12-07 00:00:00'),
(2130, 19, 1, 12, '', '2019-12-07 00:00:00'),
(2131, 22, 1, 12, '', '2019-12-07 00:00:00'),
(2132, 24, 2, 12, '', '2019-12-07 00:00:00'),
(2133, 25, 1, 12, '', '2019-12-07 00:00:00'),
(2134, 27, 1, 12, '', '2019-12-07 00:00:00'),
(2135, 29, 1, 12, '', '2019-12-07 00:00:00'),
(2136, 32, 1, 12, '', '2019-12-07 00:00:00'),
(2137, 34, 1, 12, '', '2019-12-07 00:00:00'),
(2138, 36, 2, 12, '', '2019-12-07 00:00:00'),
(2139, 38, 1, 12, '', '2019-12-07 00:00:00'),
(2140, 40, 2, 12, '', '2019-12-07 00:00:00'),
(2141, 42, 1, 12, '', '2019-12-07 00:00:00'),
(2142, 45, 1, 12, '', '2019-12-07 00:00:00'),
(2143, 9, 1, 12, '', '2019-12-09 00:00:00'),
(2144, 10, 2, 12, '', '2019-12-09 00:00:00'),
(2145, 11, 2, 12, '', '2019-12-09 00:00:00'),
(2146, 12, 1, 12, '', '2019-12-09 00:00:00'),
(2147, 13, 1, 12, '', '2019-12-09 00:00:00'),
(2148, 15, 2, 12, '', '2019-12-09 00:00:00'),
(2149, 17, 2, 12, '', '2019-12-09 00:00:00'),
(2150, 18, 1, 12, '', '2019-12-09 00:00:00'),
(2151, 19, 1, 12, '', '2019-12-09 00:00:00'),
(2152, 22, 2, 12, '', '2019-12-09 00:00:00'),
(2153, 24, 1, 12, '', '2019-12-09 00:00:00'),
(2154, 25, 2, 12, '', '2019-12-09 00:00:00'),
(2155, 27, 2, 12, '', '2019-12-09 00:00:00'),
(2156, 29, 1, 12, '', '2019-12-09 00:00:00'),
(2157, 32, 1, 12, '', '2019-12-09 00:00:00'),
(2158, 34, 1, 12, '', '2019-12-09 00:00:00'),
(2159, 36, 1, 12, '', '2019-12-09 00:00:00'),
(2160, 38, 1, 12, '', '2019-12-09 00:00:00'),
(2161, 40, 1, 12, '', '2019-12-09 00:00:00'),
(2162, 42, 1, 12, '', '2019-12-09 00:00:00'),
(2163, 45, 2, 12, '', '2019-12-09 00:00:00'),
(2164, 9, 1, 12, '', '2019-12-10 00:00:00'),
(2165, 10, 1, 12, '', '2019-12-10 00:00:00'),
(2166, 11, 1, 12, '', '2019-12-10 00:00:00'),
(2167, 12, 1, 12, '', '2019-12-10 00:00:00'),
(2168, 13, 1, 12, '', '2019-12-10 00:00:00'),
(2169, 15, 1, 12, '', '2019-12-10 00:00:00'),
(2170, 17, 2, 12, '', '2019-12-10 00:00:00'),
(2171, 18, 1, 12, '', '2019-12-10 00:00:00'),
(2172, 19, 1, 12, '', '2019-12-10 00:00:00'),
(2173, 22, 1, 12, '', '2019-12-10 00:00:00'),
(2174, 24, 1, 12, '', '2019-12-10 00:00:00'),
(2175, 25, 1, 12, '', '2019-12-10 00:00:00'),
(2176, 27, 1, 12, '', '2019-12-10 00:00:00'),
(2177, 29, 1, 12, '', '2019-12-10 00:00:00'),
(2178, 32, 1, 12, '', '2019-12-10 00:00:00'),
(2179, 34, 1, 12, '', '2019-12-10 00:00:00'),
(2180, 36, 1, 12, '', '2019-12-10 00:00:00'),
(2181, 38, 2, 12, '', '2019-12-10 00:00:00'),
(2182, 40, 1, 12, '', '2019-12-10 00:00:00'),
(2183, 42, 1, 12, '', '2019-12-10 00:00:00'),
(2184, 45, 1, 12, '', '2019-12-10 00:00:00'),
(2185, 9, 1, 12, '', '2019-12-11 00:00:00'),
(2186, 10, 1, 12, '', '2019-12-11 00:00:00'),
(2187, 11, 1, 12, '', '2019-12-11 00:00:00'),
(2188, 12, 1, 12, '', '2019-12-11 00:00:00'),
(2189, 13, 1, 12, '', '2019-12-11 00:00:00'),
(2190, 15, 1, 12, '', '2019-12-11 00:00:00'),
(2191, 17, 2, 12, '', '2019-12-11 00:00:00'),
(2192, 18, 1, 12, '', '2019-12-11 00:00:00'),
(2193, 19, 1, 12, '', '2019-12-11 00:00:00'),
(2194, 22, 1, 12, '', '2019-12-11 00:00:00'),
(2195, 24, 1, 12, '', '2019-12-11 00:00:00'),
(2196, 25, 1, 12, '', '2019-12-11 00:00:00'),
(2197, 27, 1, 12, '', '2019-12-11 00:00:00'),
(2198, 29, 1, 12, '', '2019-12-11 00:00:00'),
(2199, 32, 1, 12, '', '2019-12-11 00:00:00'),
(2200, 34, 1, 12, '', '2019-12-11 00:00:00'),
(2201, 36, 1, 12, '', '2019-12-11 00:00:00'),
(2202, 38, 2, 12, '', '2019-12-11 00:00:00'),
(2203, 40, 1, 12, '', '2019-12-11 00:00:00'),
(2204, 42, 1, 12, '', '2019-12-11 00:00:00'),
(2205, 45, 1, 12, '', '2019-12-11 00:00:00'),
(2206, 9, 1, 12, '', '2019-12-12 00:00:00'),
(2207, 10, 1, 12, '', '2019-12-12 00:00:00'),
(2208, 11, 1, 12, '', '2019-12-12 00:00:00'),
(2209, 12, 1, 12, '', '2019-12-12 00:00:00'),
(2210, 13, 2, 12, '', '2019-12-12 00:00:00'),
(2211, 15, 1, 12, '', '2019-12-12 00:00:00'),
(2212, 17, 1, 12, '', '2019-12-12 00:00:00'),
(2213, 18, 1, 12, '', '2019-12-12 00:00:00'),
(2214, 19, 1, 12, '', '2019-12-12 00:00:00'),
(2215, 22, 1, 12, '', '2019-12-12 00:00:00'),
(2216, 24, 1, 12, '', '2019-12-12 00:00:00'),
(2217, 25, 1, 12, '', '2019-12-12 00:00:00'),
(2218, 27, 1, 12, '', '2019-12-12 00:00:00'),
(2219, 29, 1, 12, '', '2019-12-12 00:00:00'),
(2220, 32, 1, 12, '', '2019-12-12 00:00:00'),
(2221, 34, 2, 12, '', '2019-12-12 00:00:00'),
(2222, 36, 2, 12, '', '2019-12-12 00:00:00'),
(2223, 38, 1, 12, '', '2019-12-12 00:00:00'),
(2224, 40, 1, 12, '', '2019-12-12 00:00:00'),
(2225, 42, 1, 12, '', '2019-12-12 00:00:00'),
(2226, 45, 2, 12, '', '2019-12-12 00:00:00'),
(2227, 9, 1, 12, '', '2019-12-13 00:00:00'),
(2228, 10, 1, 12, '', '2019-12-13 00:00:00'),
(2229, 11, 1, 12, '', '2019-12-13 00:00:00'),
(2230, 12, 1, 12, '', '2019-12-13 00:00:00'),
(2231, 13, 1, 12, '', '2019-12-13 00:00:00'),
(2232, 15, 1, 12, '', '2019-12-13 00:00:00'),
(2233, 17, 1, 12, '', '2019-12-13 00:00:00'),
(2234, 18, 1, 12, '', '2019-12-13 00:00:00'),
(2235, 19, 1, 12, '', '2019-12-13 00:00:00'),
(2236, 22, 1, 12, '', '2019-12-13 00:00:00'),
(2237, 24, 1, 12, '', '2019-12-13 00:00:00'),
(2238, 25, 1, 12, '', '2019-12-13 00:00:00'),
(2239, 27, 2, 12, '', '2019-12-13 00:00:00'),
(2240, 29, 1, 12, '', '2019-12-13 00:00:00'),
(2241, 32, 1, 12, '', '2019-12-13 00:00:00'),
(2242, 34, 1, 12, '', '2019-12-13 00:00:00'),
(2243, 36, 1, 12, '', '2019-12-13 00:00:00'),
(2244, 38, 1, 12, '', '2019-12-13 00:00:00'),
(2245, 40, 2, 12, '', '2019-12-13 00:00:00'),
(2246, 42, 1, 12, '', '2019-12-13 00:00:00'),
(2247, 45, 1, 12, '', '2019-12-13 00:00:00'),
(2248, 9, 1, 12, '', '2019-12-16 00:00:00'),
(2249, 10, 1, 12, '', '2019-12-16 00:00:00'),
(2250, 11, 1, 12, '', '2019-12-16 00:00:00'),
(2251, 12, 1, 12, '', '2019-12-16 00:00:00'),
(2252, 13, 1, 12, '', '2019-12-16 00:00:00'),
(2253, 15, 2, 12, '', '2019-12-16 00:00:00'),
(2254, 17, 1, 12, '', '2019-12-16 00:00:00'),
(2255, 18, 2, 12, '', '2019-12-16 00:00:00'),
(2256, 19, 1, 12, '', '2019-12-16 00:00:00'),
(2257, 22, 2, 12, '', '2019-12-16 00:00:00'),
(2258, 24, 1, 12, '', '2019-12-16 00:00:00'),
(2259, 25, 2, 12, '', '2019-12-16 00:00:00'),
(2260, 27, 1, 12, '', '2019-12-16 00:00:00'),
(2261, 29, 2, 12, '', '2019-12-16 00:00:00'),
(2262, 32, 2, 12, '', '2019-12-16 00:00:00'),
(2263, 34, 1, 12, '', '2019-12-16 00:00:00'),
(2264, 36, 1, 12, '', '2019-12-16 00:00:00'),
(2265, 38, 1, 12, '', '2019-12-16 00:00:00'),
(2266, 40, 1, 12, '', '2019-12-16 00:00:00'),
(2267, 42, 1, 12, '', '2019-12-16 00:00:00'),
(2268, 45, 2, 12, '', '2019-12-16 00:00:00'),
(2269, 9, 1, 12, '', '2019-12-17 00:00:00'),
(2270, 10, 2, 12, '', '2019-12-17 00:00:00'),
(2271, 11, 2, 12, '', '2019-12-17 00:00:00'),
(2272, 12, 1, 12, '', '2019-12-17 00:00:00'),
(2273, 13, 1, 12, '', '2019-12-17 00:00:00'),
(2274, 15, 1, 12, '', '2019-12-17 00:00:00'),
(2275, 17, 2, 12, '', '2019-12-17 00:00:00'),
(2276, 18, 1, 12, '', '2019-12-17 00:00:00'),
(2277, 19, 1, 12, '', '2019-12-17 00:00:00'),
(2278, 22, 1, 12, '', '2019-12-17 00:00:00'),
(2279, 24, 1, 12, '', '2019-12-17 00:00:00'),
(2280, 25, 1, 12, '', '2019-12-17 00:00:00'),
(2281, 27, 1, 12, '', '2019-12-17 00:00:00'),
(2282, 29, 1, 12, '', '2019-12-17 00:00:00'),
(2283, 32, 1, 12, '', '2019-12-17 00:00:00'),
(2284, 34, 1, 12, '', '2019-12-17 00:00:00'),
(2285, 36, 1, 12, '', '2019-12-17 00:00:00'),
(2286, 38, 1, 12, '', '2019-12-17 00:00:00'),
(2287, 40, 1, 12, '', '2019-12-17 00:00:00'),
(2288, 42, 1, 12, '', '2019-12-17 00:00:00'),
(2289, 45, 1, 12, '', '2019-12-17 00:00:00'),
(2290, 9, 1, 12, '', '2019-12-19 00:00:00'),
(2291, 10, 1, 12, '', '2019-12-19 00:00:00'),
(2292, 11, 1, 12, '', '2019-12-19 00:00:00'),
(2293, 12, 1, 12, '', '2019-12-19 00:00:00'),
(2294, 13, 1, 12, '', '2019-12-19 00:00:00'),
(2295, 15, 1, 12, '', '2019-12-19 00:00:00'),
(2296, 17, 1, 12, '', '2019-12-19 00:00:00'),
(2297, 18, 1, 12, '', '2019-12-19 00:00:00'),
(2298, 19, 1, 12, '', '2019-12-19 00:00:00'),
(2299, 22, 1, 12, '', '2019-12-19 00:00:00'),
(2300, 24, 2, 12, '', '2019-12-19 00:00:00'),
(2301, 25, 1, 12, '', '2019-12-19 00:00:00'),
(2302, 27, 1, 12, '', '2019-12-19 00:00:00'),
(2303, 29, 2, 12, '', '2019-12-19 00:00:00'),
(2304, 32, 1, 12, '', '2019-12-19 00:00:00'),
(2305, 34, 2, 12, '', '2019-12-19 00:00:00'),
(2306, 36, 2, 12, '', '2019-12-19 00:00:00'),
(2307, 38, 1, 12, '', '2019-12-19 00:00:00'),
(2308, 40, 1, 12, '', '2019-12-19 00:00:00'),
(2309, 42, 1, 12, '', '2019-12-19 00:00:00'),
(2310, 45, 2, 12, '', '2019-12-19 00:00:00'),
(2311, 9, 1, 12, '', '2019-12-20 00:00:00'),
(2312, 10, 1, 12, '', '2019-12-20 00:00:00'),
(2313, 11, 1, 12, '', '2019-12-20 00:00:00'),
(2314, 12, 1, 12, '', '2019-12-20 00:00:00'),
(2315, 13, 1, 12, '', '2019-12-20 00:00:00'),
(2316, 15, 1, 12, '', '2019-12-20 00:00:00'),
(2317, 17, 1, 12, '', '2019-12-20 00:00:00'),
(2318, 18, 1, 12, '', '2019-12-20 00:00:00'),
(2319, 19, 1, 12, '', '2019-12-20 00:00:00'),
(2320, 22, 1, 12, '', '2019-12-20 00:00:00'),
(2321, 24, 1, 12, '', '2019-12-20 00:00:00'),
(2322, 25, 1, 12, '', '2019-12-20 00:00:00'),
(2323, 27, 1, 12, '', '2019-12-20 00:00:00'),
(2324, 29, 1, 12, '', '2019-12-20 00:00:00'),
(2325, 32, 1, 12, '', '2019-12-20 00:00:00'),
(2326, 34, 1, 12, '', '2019-12-20 00:00:00'),
(2327, 36, 1, 12, '', '2019-12-20 00:00:00'),
(2328, 38, 1, 12, '', '2019-12-20 00:00:00'),
(2329, 40, 1, 12, '', '2019-12-20 00:00:00'),
(2330, 42, 1, 12, '', '2019-12-20 00:00:00'),
(2331, 45, 1, 12, '', '2019-12-20 00:00:00'),
(2332, 9, 1, 12, '', '2019-12-21 00:00:00'),
(2333, 10, 1, 12, '', '2019-12-21 00:00:00'),
(2334, 11, 1, 12, '', '2019-12-21 00:00:00'),
(2335, 12, 1, 12, '', '2019-12-21 00:00:00'),
(2336, 13, 1, 12, '', '2019-12-21 00:00:00'),
(2337, 15, 1, 12, '', '2019-12-21 00:00:00'),
(2338, 17, 1, 12, '', '2019-12-21 00:00:00'),
(2339, 18, 2, 12, '', '2019-12-21 00:00:00'),
(2340, 19, 1, 12, '', '2019-12-21 00:00:00'),
(2341, 22, 1, 12, '', '2019-12-21 00:00:00'),
(2342, 24, 2, 12, '', '2019-12-21 00:00:00'),
(2343, 25, 1, 12, '', '2019-12-21 00:00:00'),
(2344, 27, 1, 12, '', '2019-12-21 00:00:00'),
(2345, 29, 1, 12, '', '2019-12-21 00:00:00'),
(2346, 32, 1, 12, '', '2019-12-21 00:00:00'),
(2347, 34, 1, 12, '', '2019-12-21 00:00:00'),
(2348, 36, 1, 12, '', '2019-12-21 00:00:00'),
(2349, 38, 1, 12, '', '2019-12-21 00:00:00'),
(2350, 40, 2, 12, '', '2019-12-21 00:00:00'),
(2351, 42, 1, 12, '', '2019-12-21 00:00:00'),
(2352, 45, 1, 12, '', '2019-12-21 00:00:00'),
(2353, 9, 1, 12, '', '2019-12-23 00:00:00'),
(2354, 10, 1, 12, '', '2019-12-23 00:00:00'),
(2355, 11, 2, 12, '', '2019-12-23 00:00:00'),
(2356, 12, 1, 12, '', '2019-12-23 00:00:00'),
(2357, 13, 1, 12, '', '2019-12-23 00:00:00'),
(2358, 15, 1, 12, '', '2019-12-23 00:00:00'),
(2359, 17, 1, 12, '', '2019-12-23 00:00:00'),
(2360, 18, 1, 12, '', '2019-12-23 00:00:00'),
(2361, 19, 1, 12, '', '2019-12-23 00:00:00'),
(2362, 22, 1, 12, '', '2019-12-23 00:00:00'),
(2363, 24, 1, 12, '', '2019-12-23 00:00:00'),
(2364, 25, 1, 12, '', '2019-12-23 00:00:00'),
(2365, 27, 2, 12, '', '2019-12-23 00:00:00'),
(2366, 29, 1, 12, '', '2019-12-23 00:00:00'),
(2367, 32, 2, 12, '', '2019-12-23 00:00:00'),
(2368, 34, 1, 12, '', '2019-12-23 00:00:00'),
(2369, 36, 1, 12, '', '2019-12-23 00:00:00'),
(2370, 38, 1, 12, '', '2019-12-23 00:00:00'),
(2371, 40, 1, 12, '', '2019-12-23 00:00:00'),
(2372, 42, 1, 12, '', '2019-12-23 00:00:00'),
(2373, 45, 1, 12, '', '2019-12-23 00:00:00'),
(2374, 9, 1, 12, '', '2019-12-24 00:00:00'),
(2375, 10, 1, 12, '', '2019-12-24 00:00:00'),
(2376, 11, 1, 12, '', '2019-12-24 00:00:00'),
(2377, 12, 1, 12, '', '2019-12-24 00:00:00'),
(2378, 13, 1, 12, '', '2019-12-24 00:00:00'),
(2379, 15, 1, 12, '', '2019-12-24 00:00:00'),
(2380, 17, 1, 12, '', '2019-12-24 00:00:00'),
(2381, 18, 1, 12, '', '2019-12-24 00:00:00'),
(2382, 19, 1, 12, '', '2019-12-24 00:00:00'),
(2383, 22, 1, 12, '', '2019-12-24 00:00:00'),
(2384, 24, 1, 12, '', '2019-12-24 00:00:00'),
(2385, 25, 1, 12, '', '2019-12-24 00:00:00'),
(2386, 27, 1, 12, '', '2019-12-24 00:00:00'),
(2387, 29, 1, 12, '', '2019-12-24 00:00:00'),
(2388, 32, 1, 12, '', '2019-12-24 00:00:00'),
(2389, 34, 1, 12, '', '2019-12-24 00:00:00'),
(2390, 36, 1, 12, '', '2019-12-24 00:00:00'),
(2391, 38, 1, 12, '', '2019-12-24 00:00:00'),
(2392, 40, 1, 12, '', '2019-12-24 00:00:00'),
(2393, 42, 1, 12, '', '2019-12-24 00:00:00'),
(2394, 45, 1, 12, '', '2019-12-24 00:00:00'),
(2395, 9, 1, 12, '', '2019-12-25 00:00:00'),
(2396, 10, 1, 12, '', '2019-12-25 00:00:00');
INSERT INTO `iti_wpsp_trainee_attendances` (`id`, `student_id`, `attendance_type_id`, `instructor_id`, `reason`, `attendance_date`) VALUES
(2397, 11, 1, 12, '', '2019-12-25 00:00:00'),
(2398, 12, 1, 12, '', '2019-12-25 00:00:00'),
(2399, 13, 1, 12, '', '2019-12-25 00:00:00'),
(2400, 15, 1, 12, '', '2019-12-25 00:00:00'),
(2401, 17, 1, 12, '', '2019-12-25 00:00:00'),
(2402, 18, 1, 12, '', '2019-12-25 00:00:00'),
(2403, 19, 1, 12, '', '2019-12-25 00:00:00'),
(2404, 22, 1, 12, '', '2019-12-25 00:00:00'),
(2405, 24, 1, 12, '', '2019-12-25 00:00:00'),
(2406, 25, 1, 12, '', '2019-12-25 00:00:00'),
(2407, 27, 1, 12, '', '2019-12-25 00:00:00'),
(2408, 29, 1, 12, '', '2019-12-25 00:00:00'),
(2409, 32, 1, 12, '', '2019-12-25 00:00:00'),
(2410, 34, 1, 12, '', '2019-12-25 00:00:00'),
(2411, 36, 1, 12, '', '2019-12-25 00:00:00'),
(2412, 38, 1, 12, '', '2019-12-25 00:00:00'),
(2413, 40, 1, 12, '', '2019-12-25 00:00:00'),
(2414, 42, 1, 12, '', '2019-12-25 00:00:00'),
(2415, 45, 1, 12, '', '2019-12-25 00:00:00'),
(2416, 9, 1, 12, '', '2019-12-26 00:00:00'),
(2417, 10, 2, 12, '', '2019-12-26 00:00:00'),
(2418, 11, 1, 12, '', '2019-12-26 00:00:00'),
(2419, 12, 1, 12, '', '2019-12-26 00:00:00'),
(2420, 13, 1, 12, '', '2019-12-26 00:00:00'),
(2421, 15, 1, 12, '', '2019-12-26 00:00:00'),
(2422, 17, 1, 12, '', '2019-12-26 00:00:00'),
(2423, 18, 1, 12, '', '2019-12-26 00:00:00'),
(2424, 19, 1, 12, '', '2019-12-26 00:00:00'),
(2425, 22, 2, 12, '', '2019-12-26 00:00:00'),
(2426, 24, 1, 12, '', '2019-12-26 00:00:00'),
(2427, 25, 2, 12, '', '2019-12-26 00:00:00'),
(2428, 27, 1, 12, '', '2019-12-26 00:00:00'),
(2429, 29, 1, 12, '', '2019-12-26 00:00:00'),
(2430, 32, 1, 12, '', '2019-12-26 00:00:00'),
(2431, 34, 1, 12, '', '2019-12-26 00:00:00'),
(2432, 36, 1, 12, '', '2019-12-26 00:00:00'),
(2433, 38, 1, 12, '', '2019-12-26 00:00:00'),
(2434, 40, 1, 12, '', '2019-12-26 00:00:00'),
(2435, 42, 2, 12, '', '2019-12-26 00:00:00'),
(2436, 45, 1, 12, '', '2019-12-26 00:00:00'),
(2437, 9, 1, 12, '', '2019-12-30 00:00:00'),
(2438, 10, 1, 12, '', '2019-12-30 00:00:00'),
(2439, 11, 1, 12, '', '2019-12-30 00:00:00'),
(2440, 12, 1, 12, '', '2019-12-30 00:00:00'),
(2441, 13, 1, 12, '', '2019-12-30 00:00:00'),
(2442, 15, 1, 12, '', '2019-12-30 00:00:00'),
(2443, 17, 1, 12, '', '2019-12-30 00:00:00'),
(2444, 18, 1, 12, '', '2019-12-30 00:00:00'),
(2445, 19, 1, 12, '', '2019-12-30 00:00:00'),
(2446, 22, 1, 12, '', '2019-12-30 00:00:00'),
(2447, 24, 1, 12, '', '2019-12-30 00:00:00'),
(2448, 25, 1, 12, '', '2019-12-30 00:00:00'),
(2449, 27, 1, 12, '', '2019-12-30 00:00:00'),
(2450, 29, 1, 12, '', '2019-12-30 00:00:00'),
(2451, 32, 1, 12, '', '2019-12-30 00:00:00'),
(2452, 34, 1, 12, '', '2019-12-30 00:00:00'),
(2453, 36, 1, 12, '', '2019-12-30 00:00:00'),
(2454, 38, 1, 12, '', '2019-12-30 00:00:00'),
(2455, 40, 1, 12, '', '2019-12-30 00:00:00'),
(2456, 42, 1, 12, '', '2019-12-30 00:00:00'),
(2457, 45, 1, 12, '', '2019-12-30 00:00:00'),
(2458, 9, 1, 12, '', '2019-12-31 00:00:00'),
(2459, 10, 1, 12, '', '2019-12-31 00:00:00'),
(2460, 11, 1, 12, '', '2019-12-31 00:00:00'),
(2461, 12, 1, 12, '', '2019-12-31 00:00:00'),
(2462, 13, 1, 12, '', '2019-12-31 00:00:00'),
(2463, 15, 1, 12, '', '2019-12-31 00:00:00'),
(2464, 17, 1, 12, '', '2019-12-31 00:00:00'),
(2465, 18, 1, 12, '', '2019-12-31 00:00:00'),
(2466, 19, 1, 12, '', '2019-12-31 00:00:00'),
(2467, 22, 1, 12, '', '2019-12-31 00:00:00'),
(2468, 24, 1, 12, '', '2019-12-31 00:00:00'),
(2469, 25, 1, 12, '', '2019-12-31 00:00:00'),
(2470, 27, 1, 12, '', '2019-12-31 00:00:00'),
(2471, 29, 1, 12, '', '2019-12-31 00:00:00'),
(2472, 32, 1, 12, '', '2019-12-31 00:00:00'),
(2473, 34, 1, 12, '', '2019-12-31 00:00:00'),
(2474, 36, 1, 12, '', '2019-12-31 00:00:00'),
(2475, 38, 1, 12, '', '2019-12-31 00:00:00'),
(2476, 40, 1, 12, '', '2019-12-31 00:00:00'),
(2477, 42, 1, 12, '', '2019-12-31 00:00:00'),
(2478, 45, 1, 12, '', '2019-12-31 00:00:00'),
(2479, 64, 1, 15, '', '2019-08-12 00:00:00'),
(2480, 65, 1, 15, '', '2019-08-12 00:00:00'),
(2481, 66, 1, 15, '', '2019-08-12 00:00:00'),
(2482, 67, 1, 15, '', '2019-08-12 00:00:00'),
(2483, 68, 1, 15, '', '2019-08-12 00:00:00'),
(2484, 69, 1, 15, '', '2019-08-12 00:00:00'),
(2485, 70, 1, 15, '', '2019-08-12 00:00:00'),
(2486, 71, 1, 15, '', '2019-08-12 00:00:00'),
(2487, 72, 1, 15, '', '2019-08-12 00:00:00'),
(2488, 73, 1, 15, '', '2019-08-12 00:00:00'),
(2489, 74, 1, 15, '', '2019-08-12 00:00:00'),
(2490, 75, 1, 15, '', '2019-08-12 00:00:00'),
(2491, 76, 1, 15, '', '2019-08-12 00:00:00'),
(2492, 77, 1, 15, '', '2019-08-12 00:00:00'),
(2493, 78, 1, 15, '', '2019-08-12 00:00:00'),
(2494, 79, 1, 15, '', '2019-08-12 00:00:00'),
(2495, 80, 1, 15, '', '2019-08-12 00:00:00'),
(2496, 81, 1, 15, '', '2019-08-12 00:00:00'),
(2497, 82, 1, 15, '', '2019-08-12 00:00:00'),
(2498, 83, 1, 15, '', '2019-08-12 00:00:00'),
(2499, 9, 1, 12, '', '2020-01-01 00:00:00'),
(2500, 10, 1, 12, '', '2020-01-01 00:00:00'),
(2501, 11, 1, 12, '', '2020-01-01 00:00:00'),
(2502, 12, 1, 12, '', '2020-01-01 00:00:00'),
(2503, 13, 1, 12, '', '2020-01-01 00:00:00'),
(2504, 15, 1, 12, '', '2020-01-01 00:00:00'),
(2505, 17, 1, 12, '', '2020-01-01 00:00:00'),
(2506, 18, 1, 12, '', '2020-01-01 00:00:00'),
(2507, 19, 1, 12, '', '2020-01-01 00:00:00'),
(2508, 22, 1, 12, '', '2020-01-01 00:00:00'),
(2509, 24, 1, 12, '', '2020-01-01 00:00:00'),
(2510, 25, 1, 12, '', '2020-01-01 00:00:00'),
(2511, 27, 1, 12, '', '2020-01-01 00:00:00'),
(2512, 29, 1, 12, '', '2020-01-01 00:00:00'),
(2513, 32, 1, 12, '', '2020-01-01 00:00:00'),
(2514, 34, 1, 12, '', '2020-01-01 00:00:00'),
(2515, 36, 1, 12, '', '2020-01-01 00:00:00'),
(2516, 38, 1, 12, '', '2020-01-01 00:00:00'),
(2517, 40, 1, 12, '', '2020-01-01 00:00:00'),
(2518, 42, 1, 12, '', '2020-01-01 00:00:00'),
(2519, 45, 1, 12, '', '2020-01-01 00:00:00'),
(2520, 9, 1, 12, '', '2020-01-02 00:00:00'),
(2521, 10, 2, 12, '', '2020-01-02 00:00:00'),
(2522, 11, 2, 12, '', '2020-01-02 00:00:00'),
(2523, 12, 2, 12, '', '2020-01-02 00:00:00'),
(2524, 13, 1, 12, '', '2020-01-02 00:00:00'),
(2525, 15, 1, 12, '', '2020-01-02 00:00:00'),
(2526, 17, 1, 12, '', '2020-01-02 00:00:00'),
(2527, 18, 1, 12, '', '2020-01-02 00:00:00'),
(2528, 19, 2, 12, '', '2020-01-02 00:00:00'),
(2529, 22, 1, 12, '', '2020-01-02 00:00:00'),
(2530, 24, 1, 12, '', '2020-01-02 00:00:00'),
(2531, 25, 1, 12, '', '2020-01-02 00:00:00'),
(2532, 27, 1, 12, '', '2020-01-02 00:00:00'),
(2533, 29, 2, 12, '', '2020-01-02 00:00:00'),
(2534, 32, 1, 12, '', '2020-01-02 00:00:00'),
(2535, 34, 1, 12, '', '2020-01-02 00:00:00'),
(2536, 36, 2, 12, '', '2020-01-02 00:00:00'),
(2537, 38, 1, 12, '', '2020-01-02 00:00:00'),
(2538, 40, 1, 12, '', '2020-01-02 00:00:00'),
(2539, 42, 1, 12, '', '2020-01-02 00:00:00'),
(2540, 45, 1, 12, '', '2020-01-02 00:00:00'),
(2541, 9, 1, 12, '', '2020-01-03 00:00:00'),
(2542, 10, 1, 12, '', '2020-01-03 00:00:00'),
(2543, 11, 1, 12, '', '2020-01-03 00:00:00'),
(2544, 12, 1, 12, '', '2020-01-03 00:00:00'),
(2545, 13, 1, 12, '', '2020-01-03 00:00:00'),
(2546, 15, 1, 12, '', '2020-01-03 00:00:00'),
(2547, 17, 2, 12, '', '2020-01-03 00:00:00'),
(2548, 18, 1, 12, '', '2020-01-03 00:00:00'),
(2549, 19, 1, 12, '', '2020-01-03 00:00:00'),
(2550, 22, 1, 12, '', '2020-01-03 00:00:00'),
(2551, 24, 1, 12, '', '2020-01-03 00:00:00'),
(2552, 25, 1, 12, '', '2020-01-03 00:00:00'),
(2553, 27, 2, 12, '', '2020-01-03 00:00:00'),
(2554, 29, 1, 12, '', '2020-01-03 00:00:00'),
(2555, 32, 1, 12, '', '2020-01-03 00:00:00'),
(2556, 34, 1, 12, '', '2020-01-03 00:00:00'),
(2557, 36, 1, 12, '', '2020-01-03 00:00:00'),
(2558, 38, 1, 12, '', '2020-01-03 00:00:00'),
(2559, 40, 1, 12, '', '2020-01-03 00:00:00'),
(2560, 42, 1, 12, '', '2020-01-03 00:00:00'),
(2561, 45, 1, 12, '', '2020-01-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_trainee_records`
--

CREATE TABLE `iti_wpsp_trainee_records` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `trainee_record_type_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `is_checked` tinyint(1) NOT NULL,
  `progress` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_trainee_records`
--

INSERT INTO `iti_wpsp_trainee_records` (`id`, `student_id`, `trainee_record_type_id`, `instructor_id`, `is_checked`, `progress`, `checked_on`) VALUES
(597, 56, 5, 13, 1, '', '2020-06-30 00:00:00'),
(598, 57, 5, 13, 1, '', '2020-06-30 00:00:00'),
(599, 58, 5, 13, 1, '', '2020-06-30 00:00:00'),
(600, 51, 10, 13, 1, '', '2020-06-30 00:00:00'),
(601, 52, 10, 13, 1, '', '2020-06-30 00:00:00'),
(602, 53, 10, 13, 1, '', '2020-06-30 00:00:00'),
(603, 54, 10, 13, 1, '', '2020-06-30 00:00:00'),
(604, 55, 10, 13, 1, '', '2020-06-30 00:00:00'),
(605, 56, 10, 13, 1, '', '2020-06-30 00:00:00'),
(606, 57, 10, 13, 1, '', '2020-06-30 00:00:00'),
(607, 58, 10, 13, 1, '', '2020-06-30 00:00:00'),
(608, 59, 10, 13, 1, '', '2020-06-30 00:00:00'),
(609, 60, 10, 13, 1, '', '2020-06-30 00:00:00'),
(610, 61, 10, 13, 1, '', '2020-06-30 00:00:00'),
(611, 62, 10, 13, 1, '', '2020-06-30 00:00:00'),
(612, 63, 10, 13, 1, '', '2020-06-30 00:00:00'),
(613, 51, 1, 13, 1, '', '2019-09-06 00:00:00'),
(614, 51, 2, 13, 1, '', '2019-09-06 00:00:00'),
(615, 51, 3, 13, 1, '', '2019-09-06 00:00:00'),
(616, 51, 4, 13, 1, '', '2019-09-06 00:00:00'),
(617, 51, 5, 13, 1, '', '2019-09-06 00:00:00'),
(618, 51, 6, 13, 1, '', '2019-09-06 00:00:00'),
(619, 51, 7, 13, 1, '', '2019-09-06 00:00:00'),
(620, 51, 8, 13, 1, '', '2019-09-06 00:00:00'),
(621, 51, 9, 13, 1, '', '2019-09-06 00:00:00'),
(622, 51, 10, 13, 1, 'Excellent', '2019-09-06 00:00:00'),
(623, 52, 10, 13, 1, '', '2019-09-06 00:00:00'),
(624, 53, 10, 13, 1, '', '2019-09-06 00:00:00'),
(625, 54, 10, 13, 1, '', '2019-09-06 00:00:00'),
(626, 55, 10, 13, 1, '', '2019-09-06 00:00:00'),
(627, 56, 10, 13, 1, '', '2019-09-06 00:00:00'),
(628, 57, 10, 13, 1, '', '2019-09-06 00:00:00'),
(629, 58, 10, 13, 1, '', '2019-09-06 00:00:00'),
(630, 59, 10, 13, 1, '', '2019-09-06 00:00:00'),
(631, 60, 10, 13, 1, '', '2019-09-06 00:00:00'),
(632, 61, 10, 13, 1, '', '2019-09-06 00:00:00'),
(633, 62, 10, 13, 1, '', '2019-09-06 00:00:00'),
(634, 63, 10, 13, 1, '', '2019-09-06 00:00:00'),
(845, 9, 1, 12, 1, '', '2019-08-01 00:00:00'),
(846, 10, 1, 12, 1, '', '2019-08-01 00:00:00'),
(847, 11, 1, 12, 1, '', '2019-08-01 00:00:00'),
(848, 12, 1, 12, 1, '', '2019-08-01 00:00:00'),
(849, 13, 1, 12, 1, '', '2019-08-01 00:00:00'),
(850, 15, 1, 12, 1, '', '2019-08-01 00:00:00'),
(851, 17, 1, 12, 1, '', '2019-08-01 00:00:00'),
(852, 18, 1, 12, 1, '', '2019-08-01 00:00:00'),
(853, 19, 1, 12, 1, '', '2019-08-01 00:00:00'),
(854, 22, 1, 12, 1, '', '2019-08-01 00:00:00'),
(855, 24, 1, 12, 1, '', '2019-08-01 00:00:00'),
(856, 25, 1, 12, 1, '', '2019-08-01 00:00:00'),
(857, 27, 1, 12, 1, '', '2019-08-01 00:00:00'),
(858, 29, 1, 12, 1, '', '2019-08-01 00:00:00'),
(859, 32, 1, 12, 1, '', '2019-08-01 00:00:00'),
(860, 34, 1, 12, 1, '', '2019-08-01 00:00:00'),
(861, 36, 1, 12, 1, '', '2019-08-01 00:00:00'),
(862, 38, 1, 12, 1, '', '2019-08-01 00:00:00'),
(863, 40, 1, 12, 1, '', '2019-08-01 00:00:00'),
(864, 42, 1, 12, 1, '', '2019-08-01 00:00:00'),
(865, 45, 1, 12, 1, '', '2019-08-01 00:00:00'),
(866, 9, 2, 12, 1, '', '2019-08-01 00:00:00'),
(867, 10, 2, 12, 1, '', '2019-08-01 00:00:00'),
(868, 11, 2, 12, 1, '', '2019-08-01 00:00:00'),
(869, 12, 2, 12, 1, '', '2019-08-01 00:00:00'),
(870, 13, 2, 12, 1, '', '2019-08-01 00:00:00'),
(871, 15, 2, 12, 1, '', '2019-08-01 00:00:00'),
(872, 17, 2, 12, 1, '', '2019-08-01 00:00:00'),
(873, 18, 2, 12, 1, '', '2019-08-01 00:00:00'),
(874, 19, 2, 12, 1, '', '2019-08-01 00:00:00'),
(875, 22, 2, 12, 1, '', '2019-08-01 00:00:00'),
(876, 24, 2, 12, 1, '', '2019-08-01 00:00:00'),
(877, 25, 2, 12, 1, '', '2019-08-01 00:00:00'),
(878, 27, 2, 12, 1, '', '2019-08-01 00:00:00'),
(879, 29, 2, 12, 1, '', '2019-08-01 00:00:00'),
(880, 32, 2, 12, 1, '', '2019-08-01 00:00:00'),
(881, 34, 2, 12, 1, '', '2019-08-01 00:00:00'),
(882, 36, 2, 12, 1, '', '2019-08-01 00:00:00'),
(883, 38, 2, 12, 1, '', '2019-08-01 00:00:00'),
(884, 40, 2, 12, 1, '', '2019-08-01 00:00:00'),
(885, 42, 2, 12, 1, '', '2019-08-01 00:00:00'),
(886, 45, 2, 12, 1, '', '2019-08-01 00:00:00'),
(887, 9, 3, 12, 1, '', '2019-08-01 00:00:00'),
(888, 10, 3, 12, 1, '', '2019-08-01 00:00:00'),
(889, 11, 3, 12, 1, '', '2019-08-01 00:00:00'),
(890, 12, 3, 12, 1, '', '2019-08-01 00:00:00'),
(891, 13, 3, 12, 1, '', '2019-08-01 00:00:00'),
(892, 15, 3, 12, 1, '', '2019-08-01 00:00:00'),
(893, 17, 3, 12, 1, '', '2019-08-01 00:00:00'),
(894, 18, 3, 12, 1, '', '2019-08-01 00:00:00'),
(895, 19, 3, 12, 1, '', '2019-08-01 00:00:00'),
(896, 22, 3, 12, 1, '', '2019-08-01 00:00:00'),
(897, 24, 3, 12, 1, '', '2019-08-01 00:00:00'),
(898, 25, 3, 12, 1, '', '2019-08-01 00:00:00'),
(899, 27, 3, 12, 1, '', '2019-08-01 00:00:00'),
(900, 29, 3, 12, 1, '', '2019-08-01 00:00:00'),
(901, 32, 3, 12, 1, '', '2019-08-01 00:00:00'),
(902, 34, 3, 12, 1, '', '2019-08-01 00:00:00'),
(903, 36, 3, 12, 1, '', '2019-08-01 00:00:00'),
(904, 38, 3, 12, 1, '', '2019-08-01 00:00:00'),
(905, 40, 3, 12, 1, '', '2019-08-01 00:00:00'),
(906, 42, 3, 12, 1, '', '2019-08-01 00:00:00'),
(907, 45, 3, 12, 1, '', '2019-08-01 00:00:00'),
(908, 9, 4, 12, 1, '', '2019-08-01 00:00:00'),
(909, 10, 4, 12, 1, '', '2019-08-01 00:00:00'),
(910, 11, 4, 12, 1, '', '2019-08-01 00:00:00'),
(911, 12, 4, 12, 1, '', '2019-08-01 00:00:00'),
(912, 13, 4, 12, 1, '', '2019-08-01 00:00:00'),
(913, 15, 4, 12, 1, '', '2019-08-01 00:00:00'),
(914, 17, 4, 12, 1, '', '2019-08-01 00:00:00'),
(915, 18, 4, 12, 1, '', '2019-08-01 00:00:00'),
(916, 19, 4, 12, 1, '', '2019-08-01 00:00:00'),
(917, 22, 4, 12, 1, '', '2019-08-01 00:00:00'),
(918, 24, 4, 12, 1, '', '2019-08-01 00:00:00'),
(919, 25, 4, 12, 1, '', '2019-08-01 00:00:00'),
(920, 27, 4, 12, 1, '', '2019-08-01 00:00:00'),
(921, 29, 4, 12, 1, '', '2019-08-01 00:00:00'),
(922, 32, 4, 12, 1, '', '2019-08-01 00:00:00'),
(923, 34, 4, 12, 1, '', '2019-08-01 00:00:00'),
(924, 36, 4, 12, 1, '', '2019-08-01 00:00:00'),
(925, 38, 4, 12, 1, '', '2019-08-01 00:00:00'),
(926, 40, 4, 12, 1, '', '2019-08-01 00:00:00'),
(927, 42, 4, 12, 1, '', '2019-08-01 00:00:00'),
(928, 45, 4, 12, 1, '', '2019-08-01 00:00:00'),
(929, 9, 5, 12, 1, '', '2019-08-01 00:00:00'),
(930, 10, 5, 12, 1, '', '2019-08-01 00:00:00'),
(931, 11, 5, 12, 1, '', '2019-08-01 00:00:00'),
(932, 12, 5, 12, 1, '', '2019-08-01 00:00:00'),
(933, 13, 5, 12, 1, '', '2019-08-01 00:00:00'),
(934, 15, 5, 12, 1, '', '2019-08-01 00:00:00'),
(935, 17, 5, 12, 1, '', '2019-08-01 00:00:00'),
(936, 18, 5, 12, 1, '', '2019-08-01 00:00:00'),
(937, 19, 5, 12, 1, '', '2019-08-01 00:00:00'),
(938, 22, 5, 12, 1, '', '2019-08-01 00:00:00'),
(939, 24, 5, 12, 1, '', '2019-08-01 00:00:00'),
(940, 25, 5, 12, 1, '', '2019-08-01 00:00:00'),
(941, 27, 5, 12, 1, '', '2019-08-01 00:00:00'),
(942, 29, 5, 12, 1, '', '2019-08-01 00:00:00'),
(943, 32, 5, 12, 1, '', '2019-08-01 00:00:00'),
(944, 34, 5, 12, 1, '', '2019-08-01 00:00:00'),
(945, 36, 5, 12, 1, '', '2019-08-01 00:00:00'),
(946, 38, 5, 12, 1, '', '2019-08-01 00:00:00'),
(947, 40, 5, 12, 1, '', '2019-08-01 00:00:00'),
(948, 42, 5, 12, 1, '', '2019-08-01 00:00:00'),
(949, 45, 5, 12, 1, '', '2019-08-01 00:00:00'),
(950, 9, 6, 12, 1, '', '2019-08-01 00:00:00'),
(951, 10, 6, 12, 1, '', '2019-08-01 00:00:00'),
(952, 11, 6, 12, 1, '', '2019-08-01 00:00:00'),
(953, 12, 6, 12, 1, '', '2019-08-01 00:00:00'),
(954, 13, 6, 12, 1, '', '2019-08-01 00:00:00'),
(955, 15, 6, 12, 1, '', '2019-08-01 00:00:00'),
(956, 17, 6, 12, 1, '', '2019-08-01 00:00:00'),
(957, 18, 6, 12, 1, '', '2019-08-01 00:00:00'),
(958, 19, 6, 12, 1, '', '2019-08-01 00:00:00'),
(959, 22, 6, 12, 1, '', '2019-08-01 00:00:00'),
(960, 24, 6, 12, 1, '', '2019-08-01 00:00:00'),
(961, 25, 6, 12, 1, '', '2019-08-01 00:00:00'),
(962, 27, 6, 12, 1, '', '2019-08-01 00:00:00'),
(963, 29, 6, 12, 1, '', '2019-08-01 00:00:00'),
(964, 32, 6, 12, 1, '', '2019-08-01 00:00:00'),
(965, 34, 6, 12, 1, '', '2019-08-01 00:00:00'),
(966, 36, 6, 12, 1, '', '2019-08-01 00:00:00'),
(967, 38, 6, 12, 1, '', '2019-08-01 00:00:00'),
(968, 40, 6, 12, 1, '', '2019-08-01 00:00:00'),
(969, 42, 6, 12, 1, '', '2019-08-01 00:00:00'),
(970, 45, 6, 12, 1, '', '2019-08-01 00:00:00'),
(971, 9, 7, 12, 1, '', '2019-08-01 00:00:00'),
(972, 10, 7, 12, 1, '', '2019-08-01 00:00:00'),
(973, 11, 7, 12, 1, '', '2019-08-01 00:00:00'),
(974, 12, 7, 12, 1, '', '2019-08-01 00:00:00'),
(975, 13, 7, 12, 1, '', '2019-08-01 00:00:00'),
(976, 15, 7, 12, 1, '', '2019-08-01 00:00:00'),
(977, 17, 7, 12, 1, '', '2019-08-01 00:00:00'),
(978, 18, 7, 12, 1, '', '2019-08-01 00:00:00'),
(979, 19, 7, 12, 1, '', '2019-08-01 00:00:00'),
(980, 22, 7, 12, 1, '', '2019-08-01 00:00:00'),
(981, 24, 7, 12, 1, '', '2019-08-01 00:00:00'),
(982, 25, 7, 12, 1, '', '2019-08-01 00:00:00'),
(983, 27, 7, 12, 1, '', '2019-08-01 00:00:00'),
(984, 29, 7, 12, 1, '', '2019-08-01 00:00:00'),
(985, 32, 7, 12, 1, '', '2019-08-01 00:00:00'),
(986, 34, 7, 12, 1, '', '2019-08-01 00:00:00'),
(987, 36, 7, 12, 1, '', '2019-08-01 00:00:00'),
(988, 38, 7, 12, 1, '', '2019-08-01 00:00:00'),
(989, 40, 7, 12, 1, '', '2019-08-01 00:00:00'),
(990, 42, 7, 12, 1, '', '2019-08-01 00:00:00'),
(991, 45, 7, 12, 1, '', '2019-08-01 00:00:00'),
(992, 9, 9, 12, 1, '', '2019-08-01 00:00:00'),
(993, 10, 9, 12, 1, '', '2019-08-01 00:00:00'),
(994, 11, 9, 12, 1, '', '2019-08-01 00:00:00'),
(995, 12, 9, 12, 1, '', '2019-08-01 00:00:00'),
(996, 13, 9, 12, 1, '', '2019-08-01 00:00:00'),
(997, 15, 9, 12, 1, '', '2019-08-01 00:00:00'),
(998, 17, 9, 12, 1, '', '2019-08-01 00:00:00'),
(999, 18, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1000, 19, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1001, 22, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1002, 24, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1003, 25, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1004, 27, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1005, 29, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1006, 32, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1007, 34, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1008, 36, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1009, 38, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1010, 40, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1011, 42, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1012, 45, 9, 12, 1, '', '2019-08-01 00:00:00'),
(1013, 9, 10, 12, 1, 'Excellent', '2019-08-01 00:00:00'),
(1014, 10, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1015, 11, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1016, 12, 10, 12, 1, 'Excellent', '2019-08-01 00:00:00'),
(1017, 13, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1018, 15, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1019, 17, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1020, 18, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1021, 19, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1022, 22, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1023, 24, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1024, 25, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1025, 27, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1026, 29, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1027, 32, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1028, 34, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1029, 36, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1030, 38, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1031, 40, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1032, 42, 10, 12, 1, '', '2019-08-01 00:00:00'),
(1033, 45, 10, 12, 1, '', '2019-08-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_trainee_record_type`
--

CREATE TABLE `iti_wpsp_trainee_record_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_trainee_record_type`
--

INSERT INTO `iti_wpsp_trainee_record_type` (`id`, `name`, `description`) VALUES
(1, 'Daily Diary', 'This type of record stores daily activity details'),
(2, 'Drafting Book', ''),
(3, 'Theory File', ''),
(4, 'Job Sheetbook', ''),
(5, 'Assignment Book', ''),
(6, 'Practical Book', ''),
(7, 'Drawing Book', ''),
(8, 'WSC Notebook', ''),
(9, 'WSC Assignment', ''),
(10, 'Progress', '@SelectBox');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_transport`
--

CREATE TABLE `iti_wpsp_transport` (
  `id` int(15) UNSIGNED NOT NULL,
  `bus_no` varchar(30) DEFAULT NULL,
  `bus_name` varchar(50) DEFAULT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `bus_route` mediumtext,
  `route_fees` varchar(5) DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_units`
--

CREATE TABLE `iti_wpsp_units` (
  `id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `year_or_semester_no` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `unit_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iti_wpsp_units`
--

INSERT INTO `iti_wpsp_units` (`id`, `batch_id`, `trade_id`, `year_or_semester_no`, `instructor_id`, `unit_name`) VALUES
(4, 2, 1, 1, 13, 'Unit 1'),
(5, 1, 1, 2, 12, 'Unit 2'),
(6, 1, 2, 2, 14, 'Unit 2'),
(7, 2, 2, 1, 15, 'Unit 1');

-- --------------------------------------------------------

--
-- Table structure for table `iti_wpsp_workinghours`
--

CREATE TABLE `iti_wpsp_workinghours` (
  `id` int(5) UNSIGNED NOT NULL,
  `hour` varchar(20) DEFAULT NULL,
  `begintime` varchar(10) NOT NULL,
  `endtime` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iti_wpsp_workinghours`
--

INSERT INTO `iti_wpsp_workinghours` (`id`, `hour`, `begintime`, `endtime`, `type`) VALUES
(1, 'Lecture 1', '10:00', '11:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `subject_instructor`
--

CREATE TABLE `subject_instructor` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `year_or_semester_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `iti_actionscheduler_actions`
--
ALTER TABLE `iti_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Indexes for table `iti_actionscheduler_claims`
--
ALTER TABLE `iti_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Indexes for table `iti_actionscheduler_groups`
--
ALTER TABLE `iti_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Indexes for table `iti_actionscheduler_logs`
--
ALTER TABLE `iti_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Indexes for table `iti_commentmeta`
--
ALTER TABLE `iti_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `iti_comments`
--
ALTER TABLE `iti_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `iti_links`
--
ALTER TABLE `iti_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `iti_ngg_album`
--
ALTER TABLE `iti_ngg_album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Indexes for table `iti_ngg_gallery`
--
ALTER TABLE `iti_ngg_gallery`
  ADD PRIMARY KEY (`gid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Indexes for table `iti_ngg_pictures`
--
ALTER TABLE `iti_ngg_pictures`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Indexes for table `iti_options`
--
ALTER TABLE `iti_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `iti_postmeta`
--
ALTER TABLE `iti_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `iti_posts`
--
ALTER TABLE `iti_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `iti_termmeta`
--
ALTER TABLE `iti_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `iti_terms`
--
ALTER TABLE `iti_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `iti_term_relationships`
--
ALTER TABLE `iti_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `iti_term_taxonomy`
--
ALTER TABLE `iti_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `iti_usermeta`
--
ALTER TABLE `iti_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `iti_users`
--
ALTER TABLE `iti_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `iti_vxcf_leads`
--
ALTER TABLE `iti_vxcf_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `status` (`status`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `iti_vxcf_leads_detail`
--
ALTER TABLE `iti_vxcf_leads_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`),
  ADD KEY `name` (`name`(190));

--
-- Indexes for table `iti_vxcf_leads_notes`
--
ALTER TABLE `iti_vxcf_leads_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `iti_wl_im_batches`
--
ALTER TABLE `iti_wl_im_batches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `batch_code` (`batch_code`,`course_id`,`is_deleted`,`deleted_at`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `iti_wl_im_courses`
--
ALTER TABLE `iti_wl_im_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_code` (`course_code`,`is_deleted`,`deleted_at`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `iti_wl_im_enquiries`
--
ALTER TABLE `iti_wl_im_enquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `iti_wl_im_installments`
--
ALTER TABLE `iti_wl_im_installments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `iti_wl_im_students`
--
ALTER TABLE `iti_wl_im_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `iti_wpforms_tasks_meta`
--
ALTER TABLE `iti_wpforms_tasks_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_attendance`
--
ALTER TABLE `iti_wpsp_attendance`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `iti_wpsp_attendance_types`
--
ALTER TABLE `iti_wpsp_attendance_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_batches`
--
ALTER TABLE `iti_wpsp_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_class`
--
ALTER TABLE `iti_wpsp_class`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `iti_wpsp_class_mapping`
--
ALTER TABLE `iti_wpsp_class_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_events`
--
ALTER TABLE `iti_wpsp_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_exam`
--
ALTER TABLE `iti_wpsp_exam`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `iti_wpsp_fees`
--
ALTER TABLE `iti_wpsp_fees`
  ADD PRIMARY KEY (`fees_id`);

--
-- Indexes for table `iti_wpsp_fees_payment`
--
ALTER TABLE `iti_wpsp_fees_payment`
  ADD PRIMARY KEY (`fees_pay_id`);

--
-- Indexes for table `iti_wpsp_fee_payment_history`
--
ALTER TABLE `iti_wpsp_fee_payment_history`
  ADD PRIMARY KEY (`payment_history_id`);

--
-- Indexes for table `iti_wpsp_files`
--
ALTER TABLE `iti_wpsp_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_file_types`
--
ALTER TABLE `iti_wpsp_file_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_grade`
--
ALTER TABLE `iti_wpsp_grade`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `iti_wpsp_import_history`
--
ALTER TABLE `iti_wpsp_import_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_leavedays`
--
ALTER TABLE `iti_wpsp_leavedays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_mark`
--
ALTER TABLE `iti_wpsp_mark`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `iti_wpsp_mark_extract`
--
ALTER TABLE `iti_wpsp_mark_extract`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_mark_fields`
--
ALTER TABLE `iti_wpsp_mark_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `iti_wpsp_messages`
--
ALTER TABLE `iti_wpsp_messages`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `iti_wpsp_messages_delete`
--
ALTER TABLE `iti_wpsp_messages_delete`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_notification`
--
ALTER TABLE `iti_wpsp_notification`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `iti_wpsp_settings`
--
ALTER TABLE `iti_wpsp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_student`
--
ALTER TABLE `iti_wpsp_student`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `iti_wpsp_subject`
--
ALTER TABLE `iti_wpsp_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_subject_instructors`
--
ALTER TABLE `iti_wpsp_subject_instructors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_syllabus`
--
ALTER TABLE `iti_wpsp_syllabus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_teacher`
--
ALTER TABLE `iti_wpsp_teacher`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `iti_wpsp_teacher_attendance`
--
ALTER TABLE `iti_wpsp_teacher_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_teacher_batches`
--
ALTER TABLE `iti_wpsp_teacher_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_temp`
--
ALTER TABLE `iti_wpsp_temp`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `iti_wpsp_timetable`
--
ALTER TABLE `iti_wpsp_timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_trades`
--
ALTER TABLE `iti_wpsp_trades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_trainee_attendances`
--
ALTER TABLE `iti_wpsp_trainee_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_trainee_records`
--
ALTER TABLE `iti_wpsp_trainee_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_trainee_record_type`
--
ALTER TABLE `iti_wpsp_trainee_record_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_transport`
--
ALTER TABLE `iti_wpsp_transport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_units`
--
ALTER TABLE `iti_wpsp_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iti_wpsp_workinghours`
--
ALTER TABLE `iti_wpsp_workinghours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_instructor`
--
ALTER TABLE `subject_instructor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iti_actionscheduler_actions`
--
ALTER TABLE `iti_actionscheduler_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- AUTO_INCREMENT for table `iti_actionscheduler_claims`
--
ALTER TABLE `iti_actionscheduler_claims`
  MODIFY `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `iti_actionscheduler_groups`
--
ALTER TABLE `iti_actionscheduler_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `iti_actionscheduler_logs`
--
ALTER TABLE `iti_actionscheduler_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `iti_commentmeta`
--
ALTER TABLE `iti_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `iti_comments`
--
ALTER TABLE `iti_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `iti_links`
--
ALTER TABLE `iti_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_ngg_album`
--
ALTER TABLE `iti_ngg_album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iti_ngg_gallery`
--
ALTER TABLE `iti_ngg_gallery`
  MODIFY `gid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `iti_ngg_pictures`
--
ALTER TABLE `iti_ngg_pictures`
  MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `iti_options`
--
ALTER TABLE `iti_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66962;

--
-- AUTO_INCREMENT for table `iti_postmeta`
--
ALTER TABLE `iti_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234;

--
-- AUTO_INCREMENT for table `iti_posts`
--
ALTER TABLE `iti_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=488;

--
-- AUTO_INCREMENT for table `iti_termmeta`
--
ALTER TABLE `iti_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_terms`
--
ALTER TABLE `iti_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `iti_term_taxonomy`
--
ALTER TABLE `iti_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `iti_usermeta`
--
ALTER TABLE `iti_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2355;

--
-- AUTO_INCREMENT for table `iti_users`
--
ALTER TABLE `iti_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `iti_vxcf_leads`
--
ALTER TABLE `iti_vxcf_leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `iti_vxcf_leads_detail`
--
ALTER TABLE `iti_vxcf_leads_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `iti_vxcf_leads_notes`
--
ALTER TABLE `iti_vxcf_leads_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wl_im_batches`
--
ALTER TABLE `iti_wl_im_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wl_im_courses`
--
ALTER TABLE `iti_wl_im_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wl_im_enquiries`
--
ALTER TABLE `iti_wl_im_enquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wl_im_installments`
--
ALTER TABLE `iti_wl_im_installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wl_im_students`
--
ALTER TABLE `iti_wl_im_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpforms_tasks_meta`
--
ALTER TABLE `iti_wpforms_tasks_meta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `iti_wpsp_attendance`
--
ALTER TABLE `iti_wpsp_attendance`
  MODIFY `aid` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `iti_wpsp_attendance_types`
--
ALTER TABLE `iti_wpsp_attendance_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `iti_wpsp_batches`
--
ALTER TABLE `iti_wpsp_batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `iti_wpsp_class`
--
ALTER TABLE `iti_wpsp_class`
  MODIFY `cid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `iti_wpsp_class_mapping`
--
ALTER TABLE `iti_wpsp_class_mapping`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `iti_wpsp_events`
--
ALTER TABLE `iti_wpsp_events`
  MODIFY `id` bigint(15) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_exam`
--
ALTER TABLE `iti_wpsp_exam`
  MODIFY `eid` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_fees`
--
ALTER TABLE `iti_wpsp_fees`
  MODIFY `fees_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_fees_payment`
--
ALTER TABLE `iti_wpsp_fees_payment`
  MODIFY `fees_pay_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_fee_payment_history`
--
ALTER TABLE `iti_wpsp_fee_payment_history`
  MODIFY `payment_history_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_files`
--
ALTER TABLE `iti_wpsp_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iti_wpsp_file_types`
--
ALTER TABLE `iti_wpsp_file_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iti_wpsp_grade`
--
ALTER TABLE `iti_wpsp_grade`
  MODIFY `gid` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_import_history`
--
ALTER TABLE `iti_wpsp_import_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_leavedays`
--
ALTER TABLE `iti_wpsp_leavedays`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_mark`
--
ALTER TABLE `iti_wpsp_mark`
  MODIFY `mid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_mark_extract`
--
ALTER TABLE `iti_wpsp_mark_extract`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_mark_fields`
--
ALTER TABLE `iti_wpsp_mark_fields`
  MODIFY `field_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_messages`
--
ALTER TABLE `iti_wpsp_messages`
  MODIFY `mid` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_messages_delete`
--
ALTER TABLE `iti_wpsp_messages_delete`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_notification`
--
ALTER TABLE `iti_wpsp_notification`
  MODIFY `nid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_settings`
--
ALTER TABLE `iti_wpsp_settings`
  MODIFY `id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `iti_wpsp_student`
--
ALTER TABLE `iti_wpsp_student`
  MODIFY `sid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `iti_wpsp_subject`
--
ALTER TABLE `iti_wpsp_subject`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `iti_wpsp_subject_instructors`
--
ALTER TABLE `iti_wpsp_subject_instructors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `iti_wpsp_syllabus`
--
ALTER TABLE `iti_wpsp_syllabus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iti_wpsp_teacher`
--
ALTER TABLE `iti_wpsp_teacher`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `iti_wpsp_teacher_attendance`
--
ALTER TABLE `iti_wpsp_teacher_attendance`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_teacher_batches`
--
ALTER TABLE `iti_wpsp_teacher_batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_temp`
--
ALTER TABLE `iti_wpsp_temp`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_timetable`
--
ALTER TABLE `iti_wpsp_timetable`
  MODIFY `id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_trades`
--
ALTER TABLE `iti_wpsp_trades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `iti_wpsp_trainee_attendances`
--
ALTER TABLE `iti_wpsp_trainee_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2562;

--
-- AUTO_INCREMENT for table `iti_wpsp_trainee_records`
--
ALTER TABLE `iti_wpsp_trainee_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1034;

--
-- AUTO_INCREMENT for table `iti_wpsp_trainee_record_type`
--
ALTER TABLE `iti_wpsp_trainee_record_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `iti_wpsp_transport`
--
ALTER TABLE `iti_wpsp_transport`
  MODIFY `id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iti_wpsp_units`
--
ALTER TABLE `iti_wpsp_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `iti_wpsp_workinghours`
--
ALTER TABLE `iti_wpsp_workinghours`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subject_instructor`
--
ALTER TABLE `subject_instructor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
