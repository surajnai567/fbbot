-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.5-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for jobautomation
CREATE DATABASE IF NOT EXISTS `jobautomation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `jobautomation`;

-- Dumping structure for table jobautomation.clicks
CREATE TABLE IF NOT EXISTS `clicks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `instance_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_fk_3296946` (`instance_id`),
  CONSTRAINT `instance_fk_3296946` FOREIGN KEY (`instance_id`) REFERENCES `post_histories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.clicks: ~0 rows (approximately)
DELETE FROM `clicks`;
/*!40000 ALTER TABLE `clicks` DISABLE KEYS */;
/*!40000 ALTER TABLE `clicks` ENABLE KEYS */;

-- Dumping structure for table jobautomation.credentials
CREATE TABLE IF NOT EXISTS `credentials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credentials_username_unique` (`username`),
  KEY `team_fk_3296986` (`team_id`),
  CONSTRAINT `team_fk_3296986` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.credentials: ~0 rows (approximately)
DELETE FROM `credentials`;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;

-- Dumping structure for table jobautomation.credential_driver
CREATE TABLE IF NOT EXISTS `credential_driver` (
  `credential_id` bigint(20) unsigned NOT NULL,
  `driver_id` bigint(20) unsigned NOT NULL,
  KEY `credential_id_fk_3296984` (`credential_id`),
  KEY `driver_id_fk_3296984` (`driver_id`),
  CONSTRAINT `credential_id_fk_3296984` FOREIGN KEY (`credential_id`) REFERENCES `credentials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `driver_id_fk_3296984` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.credential_driver: ~0 rows (approximately)
DELETE FROM `credential_driver`;
/*!40000 ALTER TABLE `credential_driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `credential_driver` ENABLE KEYS */;

-- Dumping structure for table jobautomation.drivers
CREATE TABLE IF NOT EXISTS `drivers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.drivers: ~0 rows (approximately)
DELETE FROM `drivers`;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;

-- Dumping structure for table jobautomation.job_postings
CREATE TABLE IF NOT EXISTS `job_postings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_fk_3296676` (`team_id`),
  CONSTRAINT `team_fk_3296676` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.job_postings: ~0 rows (approximately)
DELETE FROM `job_postings`;
/*!40000 ALTER TABLE `job_postings` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_postings` ENABLE KEYS */;

-- Dumping structure for table jobautomation.job_posting_post_location
CREATE TABLE IF NOT EXISTS `job_posting_post_location` (
  `job_posting_id` bigint(20) unsigned NOT NULL,
  `post_location_id` bigint(20) unsigned NOT NULL,
  KEY `job_posting_id_fk_3296745` (`job_posting_id`),
  KEY `post_location_id_fk_3296745` (`post_location_id`),
  CONSTRAINT `job_posting_id_fk_3296745` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_location_id_fk_3296745` FOREIGN KEY (`post_location_id`) REFERENCES `post_locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.job_posting_post_location: ~0 rows (approximately)
DELETE FROM `job_posting_post_location`;
/*!40000 ALTER TABLE `job_posting_post_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_posting_post_location` ENABLE KEYS */;

-- Dumping structure for table jobautomation.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.migrations: ~23 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_100000_create_password_resets_table', 1),
	(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(3, '2021_02_27_000001_create_job_postings_table', 1),
	(4, '2021_02_27_000002_create_credentials_table', 1),
	(5, '2021_02_27_000003_create_clicks_table', 1),
	(6, '2021_02_27_000004_create_post_histories_table', 1),
	(7, '2021_02_27_000005_create_post_locations_table', 1),
	(8, '2021_02_27_000006_create_permissions_table', 1),
	(9, '2021_02_27_000007_create_drivers_table', 1),
	(10, '2021_02_27_000008_create_users_table', 1),
	(11, '2021_02_27_000009_create_teams_table', 1),
	(12, '2021_02_27_000010_create_roles_table', 1),
	(13, '2021_02_27_000011_create_job_posting_post_location_pivot_table', 1),
	(14, '2021_02_27_000012_create_role_user_pivot_table', 1),
	(15, '2021_02_27_000013_create_permission_role_pivot_table', 1),
	(16, '2021_02_27_000014_create_credential_driver_pivot_table', 1),
	(17, '2021_02_27_000015_add_relationship_fields_to_teams_table', 1),
	(18, '2021_02_27_000016_add_relationship_fields_to_users_table', 1),
	(19, '2021_02_27_000017_add_relationship_fields_to_post_locations_table', 1),
	(20, '2021_02_27_000018_add_relationship_fields_to_post_histories_table', 1),
	(21, '2021_02_27_000019_add_relationship_fields_to_clicks_table', 1),
	(22, '2021_02_27_000020_add_relationship_fields_to_credentials_table', 1),
	(23, '2021_02_27_000021_add_relationship_fields_to_job_postings_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table jobautomation.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table jobautomation.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.permissions: ~52 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'user_management_access', NULL, NULL, NULL),
	(2, 'permission_create', NULL, NULL, NULL),
	(3, 'permission_edit', NULL, NULL, NULL),
	(4, 'permission_show', NULL, NULL, NULL),
	(5, 'permission_delete', NULL, NULL, NULL),
	(6, 'permission_access', NULL, NULL, NULL),
	(7, 'role_create', NULL, NULL, NULL),
	(8, 'role_edit', NULL, NULL, NULL),
	(9, 'role_show', NULL, NULL, NULL),
	(10, 'role_delete', NULL, NULL, NULL),
	(11, 'role_access', NULL, NULL, NULL),
	(12, 'user_create', NULL, NULL, NULL),
	(13, 'user_edit', NULL, NULL, NULL),
	(14, 'user_show', NULL, NULL, NULL),
	(15, 'user_delete', NULL, NULL, NULL),
	(16, 'user_access', NULL, NULL, NULL),
	(17, 'team_create', NULL, NULL, NULL),
	(18, 'team_edit', NULL, NULL, NULL),
	(19, 'team_show', NULL, NULL, NULL),
	(20, 'team_delete', NULL, NULL, NULL),
	(21, 'team_access', NULL, NULL, NULL),
	(22, 'job_posting_create', NULL, NULL, NULL),
	(23, 'job_posting_edit', NULL, NULL, NULL),
	(24, 'job_posting_show', NULL, NULL, NULL),
	(25, 'job_posting_delete', NULL, NULL, NULL),
	(26, 'job_posting_access', NULL, NULL, NULL),
	(27, 'post_location_create', NULL, NULL, NULL),
	(28, 'post_location_edit', NULL, NULL, NULL),
	(29, 'post_location_show', NULL, NULL, NULL),
	(30, 'post_location_delete', NULL, NULL, NULL),
	(31, 'post_location_access', NULL, NULL, NULL),
	(32, 'post_history_create', NULL, NULL, NULL),
	(33, 'post_history_edit', NULL, NULL, NULL),
	(34, 'post_history_show', NULL, NULL, NULL),
	(35, 'post_history_delete', NULL, NULL, NULL),
	(36, 'post_history_access', NULL, NULL, NULL),
	(37, 'click_create', NULL, NULL, NULL),
	(38, 'click_edit', NULL, NULL, NULL),
	(39, 'click_show', NULL, NULL, NULL),
	(40, 'click_delete', NULL, NULL, NULL),
	(41, 'click_access', NULL, NULL, NULL),
	(42, 'credential_create', NULL, NULL, NULL),
	(43, 'credential_edit', NULL, NULL, NULL),
	(44, 'credential_show', NULL, NULL, NULL),
	(45, 'credential_delete', NULL, NULL, NULL),
	(46, 'credential_access', NULL, NULL, NULL),
	(47, 'driver_create', NULL, NULL, NULL),
	(48, 'driver_edit', NULL, NULL, NULL),
	(49, 'driver_show', NULL, NULL, NULL),
	(50, 'driver_delete', NULL, NULL, NULL),
	(51, 'driver_access', NULL, NULL, NULL),
	(52, 'profile_password_edit', NULL, NULL, NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table jobautomation.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  KEY `role_id_fk_3296633` (`role_id`),
  KEY `permission_id_fk_3296633` (`permission_id`),
  CONSTRAINT `permission_id_fk_3296633` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_id_fk_3296633` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.permission_role: ~83 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 33),
	(1, 34),
	(1, 35),
	(1, 36),
	(1, 37),
	(1, 38),
	(1, 39),
	(1, 40),
	(1, 41),
	(1, 42),
	(1, 43),
	(1, 44),
	(1, 45),
	(1, 46),
	(1, 47),
	(1, 48),
	(1, 49),
	(1, 50),
	(1, 51),
	(1, 52),
	(2, 22),
	(2, 23),
	(2, 24),
	(2, 25),
	(2, 26),
	(2, 27),
	(2, 28),
	(2, 29),
	(2, 30),
	(2, 31),
	(2, 32),
	(2, 33),
	(2, 34),
	(2, 35),
	(2, 36),
	(2, 37),
	(2, 38),
	(2, 39),
	(2, 40),
	(2, 41),
	(2, 42),
	(2, 43),
	(2, 44),
	(2, 45),
	(2, 46),
	(2, 47),
	(2, 48),
	(2, 49),
	(2, 50),
	(2, 51),
	(2, 52);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table jobautomation.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table jobautomation.post_histories
CREATE TABLE IF NOT EXISTS `post_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `job_post_id` bigint(20) unsigned NOT NULL,
  `post_location_id` bigint(20) unsigned NOT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_post_fk_3296739` (`job_post_id`),
  KEY `post_location_fk_3296740` (`post_location_id`),
  KEY `team_fk_3296744` (`team_id`),
  CONSTRAINT `job_post_fk_3296739` FOREIGN KEY (`job_post_id`) REFERENCES `job_postings` (`id`),
  CONSTRAINT `post_location_fk_3296740` FOREIGN KEY (`post_location_id`) REFERENCES `post_locations` (`id`),
  CONSTRAINT `team_fk_3296744` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.post_histories: ~0 rows (approximately)
DELETE FROM `post_histories`;
/*!40000 ALTER TABLE `post_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_histories` ENABLE KEYS */;

-- Dumping structure for table jobautomation.post_locations
CREATE TABLE IF NOT EXISTS `post_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  `driver_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_fk_3296666` (`team_id`),
  KEY `driver_fk_3296985` (`driver_id`),
  CONSTRAINT `driver_fk_3296985` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  CONSTRAINT `team_fk_3296666` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.post_locations: ~0 rows (approximately)
DELETE FROM `post_locations`;
/*!40000 ALTER TABLE `post_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_locations` ENABLE KEYS */;

-- Dumping structure for table jobautomation.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Admin', NULL, NULL, NULL),
	(2, 'User', NULL, NULL, NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table jobautomation.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  KEY `user_id_fk_3296642` (`user_id`),
  KEY `role_id_fk_3296642` (`role_id`),
  CONSTRAINT `role_id_fk_3296642` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_3296642` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.role_user: ~1 rows (approximately)
DELETE FROM `role_user`;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table jobautomation.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `owner_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_fk_3296652` (`owner_id`),
  CONSTRAINT `owner_fk_3296652` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.teams: ~0 rows (approximately)
DELETE FROM `teams`;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;

-- Dumping structure for table jobautomation.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `team_fk_3296653` (`team_id`),
  CONSTRAINT `team_fk_3296653` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jobautomation.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `team_id`) VALUES
	(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$di5bOBIFXdgb1idl6ZRH0Of/kdY/hSCsNX4ZV.x1/dMG8iBDEnzv.', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
