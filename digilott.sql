-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 07, 2022 at 12:47 PM
-- Server version: 10.6.5-MariaDB
-- PHP Version: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digilott`
--

-- --------------------------------------------------------

--
-- Table structure for table `arisan_past_winner`
--

CREATE TABLE `arisan_past_winner` (
  `id` bigint(20) NOT NULL,
  `win_date` datetime(6) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `room_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arisan_past_winner`
--

INSERT INTO `arisan_past_winner` (`id`, `win_date`, `amount`, `room_id`, `user_id`) VALUES
(26, '2022-01-07 07:48:27.139533', 600000, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `arisan_payment`
--

CREATE TABLE `arisan_payment` (
  `id` bigint(20) NOT NULL,
  `started_at` datetime(6) DEFAULT NULL,
  `finished_at` datetime(6) DEFAULT NULL,
  `status` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arisan_payment`
--

INSERT INTO `arisan_payment` (`id`, `started_at`, `finished_at`, `status`, `room_id`, `user_id`, `amount`) VALUES
(202, '2022-01-07 04:33:59.000000', NULL, 'paid', 2, 2, 150000),
(203, '2022-01-07 04:33:59.000000', NULL, 'paid', 2, 3, 150000),
(204, '2022-01-07 04:33:59.000000', NULL, 'paid', 2, 5, 150000),
(205, '2022-01-07 04:33:59.000000', NULL, 'paid', 2, 8, 150000),
(206, '2022-01-07 07:48:27.000000', NULL, 'paid', 2, 2, 150000),
(207, '2022-01-07 07:48:27.000000', NULL, 'paid', 2, 3, 150000),
(208, '2022-01-07 07:48:27.000000', NULL, 'paid', 2, 5, 150000),
(209, '2022-01-07 07:48:27.000000', NULL, 'paid', 2, 8, 150000);

-- --------------------------------------------------------

--
-- Table structure for table `arisan_room`
--

CREATE TABLE `arisan_room` (
  `id` bigint(20) NOT NULL,
  `room_name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_member` int(11) DEFAULT NULL,
  `min_member` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `started_at` datetime(6) DEFAULT NULL,
  `finished_at` datetime(6) DEFAULT NULL,
  `closed_at` datetime(6) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `intervaldate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arisan_room`
--

INSERT INTO `arisan_room` (`id`, `room_name`, `max_member`, `min_member`, `created_at`, `started_at`, `finished_at`, `closed_at`, `cost`, `intervaldate`) VALUES
(1, 'Iklima Room', 15, 5, '2021-12-30 20:36:15.794669', '2022-01-07 00:00:00.000000', NULL, NULL, 100000, 14),
(2, 'Muzakki Room', 15, 6, '2021-12-30 20:36:37.521816', '2022-01-07 07:48:27.000000', '2022-01-07 07:48:27.000000', NULL, 150000, 7),
(6, 'Arisan Baru', 20, 16, '2021-12-31 06:07:17.131949', '2022-01-06 00:00:00.000000', NULL, NULL, 150000, 14),
(7, 'Room Baru', 25, 10, '2022-01-06 18:12:47.797961', '2022-01-08 00:00:00.000000', NULL, NULL, 250000, 14);

-- --------------------------------------------------------

--
-- Table structure for table `arisan_roomroles`
--

CREATE TABLE `arisan_roomroles` (
  `id` bigint(20) NOT NULL,
  `role_room` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arisan_roomroles`
--

INSERT INTO `arisan_roomroles` (`id`, `role_room`, `room_id`, `user_id`) VALUES
(1, 'host', 1, 2),
(2, 'member', 1, 3),
(3, 'host', 2, 3),
(4, 'member', 2, 2),
(6, 'member', 2, 8),
(7, 'member', 2, 5),
(9, 'member', 1, 8),
(18, 'member', 6, 8);

-- --------------------------------------------------------

--
-- Table structure for table `arisan_room_user`
--

CREATE TABLE `arisan_room_user` (
  `id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arisan_room_user`
--

INSERT INTO `arisan_room_user` (`id`, `room_id`, `user_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(42, 1, 5),
(18, 1, 8),
(41, 1, 10),
(4, 2, 2),
(3, 2, 3),
(16, 2, 5),
(15, 2, 8),
(6, 6, 3),
(35, 6, 8),
(7, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user profile', 7, 'add_userprofile'),
(26, 'Can change user profile', 7, 'change_userprofile'),
(27, 'Can delete user profile', 7, 'delete_userprofile'),
(28, 'Can view user profile', 7, 'view_userprofile'),
(29, 'Can add room', 8, 'add_room'),
(30, 'Can change room', 8, 'change_room'),
(31, 'Can delete room', 8, 'delete_room'),
(32, 'Can view room', 8, 'view_room'),
(33, 'Can add rooms', 8, 'add_rooms'),
(34, 'Can change rooms', 8, 'change_rooms'),
(35, 'Can delete rooms', 8, 'delete_rooms'),
(36, 'Can view rooms', 8, 'view_rooms'),
(37, 'Can add telepon', 9, 'add_telepon'),
(38, 'Can change telepon', 9, 'change_telepon'),
(39, 'Can delete telepon', 9, 'delete_telepon'),
(40, 'Can view telepon', 9, 'view_telepon'),
(41, 'Can add member', 10, 'add_member'),
(42, 'Can change member', 10, 'change_member'),
(43, 'Can delete member', 10, 'delete_member'),
(44, 'Can view member', 10, 'view_member'),
(45, 'Can add past_ winner', 11, 'add_past_winner'),
(46, 'Can change past_ winner', 11, 'change_past_winner'),
(47, 'Can delete past_ winner', 11, 'delete_past_winner'),
(48, 'Can view past_ winner', 11, 'view_past_winner'),
(49, 'Can add payment', 12, 'add_payment'),
(50, 'Can change payment', 12, 'change_payment'),
(51, 'Can delete payment', 12, 'delete_payment'),
(52, 'Can view payment', 12, 'view_payment'),
(53, 'Can add room roles', 13, 'add_roomroles'),
(54, 'Can change room roles', 13, 'change_roomroles'),
(55, 'Can delete room roles', 13, 'delete_roomroles'),
(56, 'Can view room roles', 13, 'view_roomroles');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$IEeiv6sbGVwOR8TjtAg99e$Cd2Z4V48lsM0XPJnih5EZLLMuWjNLjd90tVIie041MA=', '2022-01-07 03:31:29.027214', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2021-12-30 13:08:59.457946'),
(2, 'pbkdf2_sha256$320000$SE399T10IE1TGitQg3Y9oz$pV8X56Eh0vsfx518JIDvE6YK/nJB5FfQiNURABfbYiY=', '2021-12-31 06:19:23.666194', 0, 'iklima', 'Iklima', 'Mardiana', 'iklima@iklima.com', 0, 1, '2021-12-30 13:10:20.000000'),
(3, 'pbkdf2_sha256$320000$ytdx3Mx3FqGN5Ntj2lLASl$6N5RcI4iRB0mfRWTgAtJ6jxDySM1WtXvfMxxyDuzxJc=', '2022-01-07 12:08:43.287541', 0, 'muzakki', 'Muzakki', 'Abdillah', 'muzakki@muzakki.com', 0, 1, '2021-12-30 13:10:51.000000'),
(5, 'pbkdf2_sha256$320000$58OIrhjTB28X5dwCGSgu4f$WxY/vt4YrejDrrbg1/jSDwAp8Hcubsv4TM0Fl5syVhw=', NULL, 0, 'ivan', 'Ivan', 'Septian', 'ivan@ivan.com', 0, 1, '2021-12-30 23:16:32.000000'),
(8, 'pbkdf2_sha256$320000$A4bk0GmxeQkGzWbIycQ9oy$6+O4+Ch4ON7b2FViN+Z61dHsdrTsyptz5CTxJ2KBvMk=', '2022-01-07 12:11:33.732450', 0, 'wiormiw', 'Wijoyo', 'Raharjo M.I.W.', 'wio@wio.com', 0, 1, '2021-12-30 23:23:15.000000'),
(9, 'pbkdf2_sha256$320000$9PVjo87AkFTv5EE4pPXwmB$4ZE53RT9a7waT6R9nQHlyKQEeLKHxJ9tJQPNo8mr+Zk=', '2021-12-31 07:46:24.832204', 0, 'aakasep', 'Asep', 'Tampan Dan Berani', 'asep@asep.com', 0, 1, '2021-12-31 07:24:18.034300'),
(10, 'pbkdf2_sha256$320000$4um92PEuRaYT9t3OcY9lLK$mpo2Dt6QGKYy3OLtkE4TVnLZCu/uwSyezT6Vh6Ae7HY=', NULL, 0, 'iniuserbaru', 'Nama', 'Nama Belakang', 'user@user.com', 0, 1, '2021-12-31 07:55:12.264820'),
(11, 'pbkdf2_sha256$320000$DJvWwOwOxGdXvTfzlnjTTJ$LbbKwX7YYl30RQLAo88irkqAqFMUSRFnmZRTw3oTXdQ=', '2022-01-07 10:32:48.303340', 0, 'tututu02', 'Test', 'User', 'tututu@tututu.com', 0, 1, '2022-01-07 10:31:40.409207'),
(14, 'pbkdf2_sha256$320000$pz7begmDQrHzF5c5LRp8gF$iw4G4QmJpy/dg+8H/dj8vPPDtMT0W+a0AM2ESVLpE0Q=', '2022-01-07 11:51:03.869663', 0, 'ujicoba02', 'Uji', 'Coba', 'ujicoba@ujicoba.com', 0, 1, '2022-01-07 11:50:32.465031');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-12-30 13:10:21.005210', '2', 'iklima', 1, '[{\"added\": {}}]', 4, 1),
(2, '2021-12-30 13:10:52.037144', '3', 'muzakki', 1, '[{\"added\": {}}]', 4, 1),
(3, '2021-12-30 13:49:04.006654', '2', ' ', 1, '[{\"added\": {}}]', 7, 1),
(4, '2021-12-30 13:50:02.625669', '2', 'iklima', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(5, '2021-12-30 14:06:32.050568', '1', 'Room Iklima', 1, '[{\"added\": {}}]', 8, 1),
(6, '2021-12-30 14:25:14.790515', '1', 'Iklima Mardiana', 1, '[{\"added\": {}}]', 9, 1),
(7, '2021-12-30 14:25:33.709669', '2', 'Iklima Mardiana', 1, '[{\"added\": {}}]', 9, 1),
(8, '2021-12-30 14:26:05.331148', '3', 'muzakki', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(9, '2021-12-30 14:26:21.469930', '2', 'iklima', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(10, '2021-12-30 15:12:54.058805', '4', 'auth.User.None arisan.Room.None', 1, '[{\"added\": {}}]', 10, 1),
(11, '2021-12-30 15:15:30.589191', '4', 'iklima Room Iklima', 2, '[{\"changed\": {\"fields\": [\"User\", \"Room\"]}}]', 10, 1),
(12, '2021-12-30 15:16:57.895644', '4', 'iklima Room Iklima', 3, '', 10, 1),
(13, '2021-12-30 15:24:03.849237', '5', 'auth.User.None arisan.Room.None', 1, '[{\"added\": {}}]', 10, 1),
(14, '2021-12-30 15:24:13.697272', '6', 'auth.User.None arisan.Room.None', 1, '[{\"added\": {}}]', 10, 1),
(15, '2021-12-30 17:33:33.932618', '2', 'muuuuu', 2, '[{\"changed\": {\"fields\": [\"Intervaldate\"]}}]', 8, 1),
(16, '2021-12-30 20:13:06.932255', '6', 'Member object (6)', 2, '[{\"changed\": {\"fields\": [\"User\", \"Role room\"]}}]', 10, 1),
(17, '2021-12-30 20:13:54.664723', '5', 'Member object (5)', 2, '[{\"changed\": {\"fields\": [\"User\", \"Role room\"]}}]', 10, 1),
(18, '2021-12-30 20:14:04.347732', '6', 'Member object (6)', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 10, 1),
(19, '2021-12-30 20:14:42.205953', '5', 'Member object (5)', 2, '[{\"changed\": {\"fields\": [\"Room\"]}}]', 10, 1),
(20, '2021-12-30 20:14:52.838700', '7', 'Member object (7)', 1, '[{\"added\": {}}]', 10, 1),
(21, '2021-12-30 20:34:25.055579', '1', 'Iklima Mardiana', 1, '[{\"added\": {}}]', 7, 1),
(22, '2021-12-30 20:34:44.134161', '2', 'Muzakki Abdillah', 1, '[{\"added\": {}}]', 7, 1),
(23, '2021-12-30 20:35:00.568045', '1', 'Iklima Mardiana', 1, '[{\"added\": {}}]', 9, 1),
(24, '2021-12-30 20:35:08.224264', '2', 'Iklima Mardiana', 1, '[{\"added\": {}}]', 9, 1),
(25, '2021-12-30 20:35:16.148369', '3', 'Muzakki Abdillah', 1, '[{\"added\": {}}]', 9, 1),
(26, '2021-12-30 20:36:15.843739', '1', 'Iklima Room', 1, '[{\"added\": {}}]', 8, 1),
(27, '2021-12-30 20:36:37.532782', '2', 'Muzakki Room', 1, '[{\"added\": {}}]', 8, 1),
(28, '2021-12-30 20:36:46.471813', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 8, 1),
(29, '2021-12-30 20:37:10.391279', '1', 'RoomRoles object (1)', 1, '[{\"added\": {}}]', 13, 1),
(30, '2021-12-30 20:37:17.381486', '2', 'RoomRoles object (2)', 1, '[{\"added\": {}}]', 13, 1),
(31, '2021-12-30 20:37:28.541450', '3', 'RoomRoles object (3)', 1, '[{\"added\": {}}]', 13, 1),
(32, '2021-12-30 20:37:33.825001', '4', 'RoomRoles object (4)', 1, '[{\"added\": {}}]', 13, 1),
(33, '2021-12-30 20:47:04.155512', '5', 'Iklima Mardiana - member', 1, '[{\"added\": {}}]', 13, 1),
(34, '2021-12-30 20:47:14.252367', '5', 'Iklima Mardiana - member', 3, '', 13, 1),
(35, '2021-12-30 21:46:35.029840', '2', 'iklima', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(36, '2021-12-30 23:11:20.809189', '4', '', 3, '', 4, 1),
(37, '2021-12-30 23:20:57.323996', '6', 'wiormiw', 3, '', 4, 1),
(38, '2021-12-30 23:22:43.856163', '7', 'wiormiw', 3, '', 4, 1),
(39, '2021-12-30 23:23:49.198090', '5', 'ivan', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(40, '2021-12-30 23:24:00.926766', '8', 'wiormiw', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(41, '2021-12-31 03:51:13.454033', '3', 'muzakki', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(42, '2021-12-31 04:34:19.255085', '2', 'Muzakki Abdillah', 2, '[{\"changed\": {\"fields\": [\"Ktp\"]}}]', 7, 1),
(43, '2021-12-31 04:34:29.225690', '1', 'Iklima Mardiana', 2, '[{\"changed\": {\"fields\": [\"Ktp\"]}}]', 7, 1),
(44, '2021-12-31 05:46:06.736042', '4', 'MyRoom', 3, '', 8, 1),
(45, '2021-12-31 06:18:57.220108', '2', 'iklima', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(46, '2021-12-31 07:56:35.001569', '3', 'Nama Nama Belakang', 1, '[{\"added\": {}}]', 7, 1),
(47, '2021-12-31 07:56:54.831420', '4', 'Nama Nama Belakang', 1, '[{\"added\": {}}]', 9, 1),
(48, '2022-01-06 18:14:28.684897', '7', 'Room Baru', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 8, 1),
(49, '2022-01-06 18:15:41.560610', '8', 'Room Saya', 3, '', 8, 1),
(50, '2022-01-06 18:52:46.303440', '11', 'Roomsssss', 3, '', 8, 1),
(51, '2022-01-06 18:52:46.321428', '10', 'Roomsssss', 3, '', 8, 1),
(52, '2022-01-06 18:52:46.332711', '9', 'Roomsssss', 3, '', 8, 1),
(53, '2022-01-06 19:13:54.874917', '1', 'Iklima Room', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(54, '2022-01-06 19:14:02.170263', '7', 'Room Baru', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(55, '2022-01-06 19:14:07.679506', '6', 'Arisan Baru', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(56, '2022-01-06 19:14:14.185593', '5', 'Arisan Skuy', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(57, '2022-01-06 19:14:29.658631', '3', 'MyRoom', 2, '[{\"changed\": {\"fields\": [\"User\", \"Started at\"]}}]', 8, 1),
(58, '2022-01-06 19:14:38.346216', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(59, '2022-01-06 19:14:54.850715', '7', 'Room Baru', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(60, '2022-01-06 19:15:03.854654', '5', 'Arisan Skuy', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(61, '2022-01-06 19:15:12.949164', '3', 'MyRoom', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(62, '2022-01-06 19:15:21.293702', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(63, '2022-01-06 19:15:29.201230', '1', 'Iklima Room', 2, '[{\"changed\": {\"fields\": [\"Started at\"]}}]', 8, 1),
(64, '2022-01-06 19:32:50.541672', '5', 'Arisan Skuy', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 8, 1),
(65, '2022-01-06 19:48:49.975504', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 8, 1),
(66, '2022-01-06 19:49:11.878370', '6', 'Wijoyo Raharjo M.I.W. - member', 1, '[{\"added\": {}}]', 13, 1),
(67, '2022-01-06 19:49:18.679897', '7', 'Ivan Septian - member', 1, '[{\"added\": {}}]', 13, 1),
(68, '2022-01-06 19:49:57.024642', '1', 'Muzakki Abdillah - bill', 1, '[{\"added\": {}}]', 12, 1),
(69, '2022-01-06 19:50:16.734669', '2', 'Muzakki Abdillah - bill', 1, '[{\"added\": {}}]', 12, 1),
(70, '2022-01-06 19:50:38.031179', '3', 'Muzakki Abdillah - bill', 1, '[{\"added\": {}}]', 12, 1),
(71, '2022-01-07 01:15:49.199613', '5', 'Wijoyo Raharjo M.I.W. - 2022-01-07 01:06:49.317743+00:00 - 150000', 3, '', 11, 1),
(72, '2022-01-07 01:20:52.050724', '6', 'Wijoyo Raharjo M.I.W. - 2022-01-07 01:18:58.906706+00:00 - 150000', 3, '', 11, 1),
(73, '2022-01-07 01:23:13.801093', '7', 'Wijoyo Raharjo M.I.W. - 2022-01-07 01:21:17.478583+00:00 - 150000', 3, '', 11, 1),
(74, '2022-01-07 01:47:20.889340', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Closed at\"]}}]', 8, 1),
(75, '2022-01-07 02:17:09.874632', '5', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(76, '2022-01-07 02:17:09.921406', '4', 'Iklima Mardiana - bill', 3, '', 12, 1),
(77, '2022-01-07 02:17:09.965549', '3', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(78, '2022-01-07 02:17:09.976401', '2', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(79, '2022-01-07 02:17:10.032075', '1', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(80, '2022-01-07 02:18:34.361089', '8', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(81, '2022-01-07 02:18:34.374782', '7', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(82, '2022-01-07 02:18:34.430163', '6', 'Iklima Mardiana - bill', 3, '', 12, 1),
(83, '2022-01-07 02:18:49.009091', '12', 'Room Baru', 3, '', 8, 1),
(84, '2022-01-07 02:26:39.221534', '16', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(85, '2022-01-07 02:26:39.239417', '15', 'Iklima Mardiana - bill', 3, '', 12, 1),
(86, '2022-01-07 02:30:49.029263', '14', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(87, '2022-01-07 02:30:49.043986', '13', 'Iklima Mardiana - bill', 3, '', 12, 1),
(88, '2022-01-07 02:30:49.054952', '12', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(89, '2022-01-07 02:30:49.066121', '11', 'Iklima Mardiana - bill', 3, '', 12, 1),
(90, '2022-01-07 02:30:49.077184', '10', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(91, '2022-01-07 02:30:49.088252', '9', 'Iklima Mardiana - bill', 3, '', 12, 1),
(92, '2022-01-07 02:30:59.986142', '10', 'Muzakki Abdillah - 2022-01-07 02:23:27.279517+00:00 - 200000', 3, '', 11, 1),
(93, '2022-01-07 02:31:00.037720', '9', 'Iklima Mardiana - 2022-01-07 02:23:23.247059+00:00 - 200000', 3, '', 11, 1),
(94, '2022-01-07 02:31:00.081791', '8', 'Wijoyo Raharjo M.I.W. - 2022-01-07 01:23:50.274474+00:00 - 150000', 3, '', 11, 1),
(95, '2022-01-07 02:31:00.093051', '4', 'Ivan Septian - 2022-01-07 01:06:25.001774+00:00 - 150000', 3, '', 11, 1),
(96, '2022-01-07 02:31:00.103911', '2', 'Muzakki Abdillah - 2022-01-07 00:01:30.699077+00:00 - 150000', 3, '', 11, 1),
(97, '2022-01-07 02:31:00.115256', '1', 'Iklima Mardiana - 2022-01-07 00:01:20.373771+00:00 - 150000', 3, '', 11, 1),
(98, '2022-01-07 02:31:20.891798', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Finished at\", \"Closed at\"]}}]', 8, 1),
(99, '2022-01-07 02:31:35.397707', '1', 'Iklima Room', 2, '[{\"changed\": {\"fields\": [\"Finished at\", \"Closed at\"]}}]', 8, 1),
(100, '2022-01-07 02:40:33.700658', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Finished at\", \"Closed at\"]}}]', 8, 1),
(101, '2022-01-07 02:40:43.718252', '15', 'Wijoyo Raharjo M.I.W. - 2022-01-07 02:36:02.797732+00:00 - 600000', 3, '', 11, 1),
(102, '2022-01-07 02:40:43.735299', '14', 'Ivan Septian - 2022-01-07 02:35:58.551056+00:00 - 600000', 3, '', 11, 1),
(103, '2022-01-07 02:40:43.747169', '13', 'Muzakki Abdillah - 2022-01-07 02:35:52.534137+00:00 - 600000', 3, '', 11, 1),
(104, '2022-01-07 02:40:43.757292', '12', 'Iklima Mardiana - 2022-01-07 02:35:41.362047+00:00 - 600000', 3, '', 11, 1),
(105, '2022-01-07 02:47:35.875193', '56', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(106, '2022-01-07 02:47:35.936555', '55', 'Ivan Septian - bill', 3, '', 12, 1),
(107, '2022-01-07 02:47:35.956433', '54', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(108, '2022-01-07 02:47:35.967703', '53', 'Iklima Mardiana - bill', 3, '', 12, 1),
(109, '2022-01-07 02:47:35.978665', '52', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(110, '2022-01-07 02:47:35.989719', '51', 'Ivan Septian - bill', 3, '', 12, 1),
(111, '2022-01-07 02:47:36.034067', '50', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(112, '2022-01-07 02:47:36.089618', '49', 'Iklima Mardiana - bill', 3, '', 12, 1),
(113, '2022-01-07 02:47:36.100563', '48', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(114, '2022-01-07 02:47:36.111811', '47', 'Ivan Septian - bill', 3, '', 12, 1),
(115, '2022-01-07 02:47:36.122843', '46', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(116, '2022-01-07 02:47:36.133954', '45', 'Iklima Mardiana - bill', 3, '', 12, 1),
(117, '2022-01-07 02:47:36.145214', '44', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(118, '2022-01-07 02:47:36.200516', '43', 'Ivan Septian - bill', 3, '', 12, 1),
(119, '2022-01-07 02:47:36.244789', '42', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(120, '2022-01-07 02:47:36.255791', '41', 'Iklima Mardiana - bill', 3, '', 12, 1),
(121, '2022-01-07 02:47:36.266983', '40', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(122, '2022-01-07 02:47:36.278103', '39', 'Ivan Septian - bill', 3, '', 12, 1),
(123, '2022-01-07 02:47:36.289203', '38', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(124, '2022-01-07 02:47:36.300237', '37', 'Iklima Mardiana - bill', 3, '', 12, 1),
(125, '2022-01-07 02:47:36.311367', '36', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(126, '2022-01-07 02:47:36.322410', '35', 'Ivan Septian - bill', 3, '', 12, 1),
(127, '2022-01-07 02:47:36.333458', '34', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(128, '2022-01-07 02:47:36.344483', '33', 'Iklima Mardiana - bill', 3, '', 12, 1),
(129, '2022-01-07 02:47:36.355634', '32', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(130, '2022-01-07 02:47:36.366616', '31', 'Ivan Septian - bill', 3, '', 12, 1),
(131, '2022-01-07 02:47:36.377664', '30', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(132, '2022-01-07 02:47:36.388795', '29', 'Iklima Mardiana - bill', 3, '', 12, 1),
(133, '2022-01-07 02:47:36.399913', '28', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(134, '2022-01-07 02:47:36.410832', '27', 'Ivan Septian - bill', 3, '', 12, 1),
(135, '2022-01-07 02:47:36.422127', '26', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(136, '2022-01-07 02:47:36.433118', '25', 'Iklima Mardiana - bill', 3, '', 12, 1),
(137, '2022-01-07 02:47:36.444222', '24', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(138, '2022-01-07 02:47:36.455296', '23', 'Ivan Septian - bill', 3, '', 12, 1),
(139, '2022-01-07 02:47:36.465934', '22', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(140, '2022-01-07 02:47:36.477297', '21', 'Iklima Mardiana - bill', 3, '', 12, 1),
(141, '2022-01-07 02:47:36.488350', '20', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(142, '2022-01-07 02:47:36.520686', '19', 'Ivan Septian - bill', 3, '', 12, 1),
(143, '2022-01-07 02:47:36.532777', '18', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(144, '2022-01-07 02:47:36.543711', '17', 'Iklima Mardiana - bill', 3, '', 12, 1),
(145, '2022-01-07 02:47:47.221173', '19', 'Iklima Mardiana - 2022-01-07 02:46:48.058300+00:00 - 600000', 3, '', 11, 1),
(146, '2022-01-07 02:47:47.237881', '18', 'Wijoyo Raharjo M.I.W. - 2022-01-07 02:46:44.642593+00:00 - 600000', 3, '', 11, 1),
(147, '2022-01-07 02:47:47.266768', '17', 'Muzakki Abdillah - 2022-01-07 02:46:40.440476+00:00 - 600000', 3, '', 11, 1),
(148, '2022-01-07 02:47:47.282429', '16', 'Ivan Septian - 2022-01-07 02:46:37.292802+00:00 - 600000', 3, '', 11, 1),
(149, '2022-01-07 02:48:00.293475', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Finished at\", \"Closed at\"]}}]', 8, 1),
(150, '2022-01-07 03:05:04.754809', '72', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(151, '2022-01-07 03:05:04.783828', '71', 'Ivan Septian - bill', 3, '', 12, 1),
(152, '2022-01-07 03:05:04.794890', '70', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(153, '2022-01-07 03:05:04.805954', '69', 'Iklima Mardiana - bill', 3, '', 12, 1),
(154, '2022-01-07 03:05:04.817051', '68', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(155, '2022-01-07 03:05:04.828074', '67', 'Ivan Septian - bill', 3, '', 12, 1),
(156, '2022-01-07 03:05:04.839062', '66', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(157, '2022-01-07 03:05:04.850216', '65', 'Iklima Mardiana - bill', 3, '', 12, 1),
(158, '2022-01-07 03:05:04.894426', '64', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(159, '2022-01-07 03:05:04.905538', '63', 'Ivan Septian - bill', 3, '', 12, 1),
(160, '2022-01-07 03:05:04.916599', '62', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(161, '2022-01-07 03:05:04.927750', '61', 'Iklima Mardiana - bill', 3, '', 12, 1),
(162, '2022-01-07 03:05:04.938791', '60', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(163, '2022-01-07 03:05:04.950052', '59', 'Ivan Septian - bill', 3, '', 12, 1),
(164, '2022-01-07 03:05:04.994246', '58', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(165, '2022-01-07 03:05:05.005230', '57', 'Iklima Mardiana - bill', 3, '', 12, 1),
(166, '2022-01-07 03:05:14.474252', '23', 'Iklima Mardiana - 2022-01-07 02:59:45.618188+00:00 - 600000', 3, '', 11, 1),
(167, '2022-01-07 03:05:14.491850', '22', 'Muzakki Abdillah - 2022-01-07 02:59:42.827930+00:00 - 600000', 3, '', 11, 1),
(168, '2022-01-07 03:05:14.503302', '21', 'Wijoyo Raharjo M.I.W. - 2022-01-07 02:59:40.249950+00:00 - 600000', 3, '', 11, 1),
(169, '2022-01-07 03:05:14.514315', '20', 'Ivan Septian - 2022-01-07 02:59:37.559962+00:00 - 600000', 3, '', 11, 1),
(170, '2022-01-07 03:05:29.730238', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Finished at\", \"Closed at\", \"Count\"]}}]', 8, 1),
(171, '2022-01-07 03:15:17.502252', '88', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(172, '2022-01-07 03:15:17.524162', '87', 'Ivan Septian - bill', 3, '', 12, 1),
(173, '2022-01-07 03:15:17.535157', '86', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(174, '2022-01-07 03:15:17.546221', '85', 'Iklima Mardiana - bill', 3, '', 12, 1),
(175, '2022-01-07 03:15:17.557292', '84', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(176, '2022-01-07 03:15:17.568310', '83', 'Ivan Septian - bill', 3, '', 12, 1),
(177, '2022-01-07 03:15:17.579396', '82', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(178, '2022-01-07 03:15:17.590505', '81', 'Iklima Mardiana - bill', 3, '', 12, 1),
(179, '2022-01-07 03:15:17.601587', '80', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(180, '2022-01-07 03:15:17.612642', '79', 'Ivan Septian - bill', 3, '', 12, 1),
(181, '2022-01-07 03:15:17.623788', '78', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(182, '2022-01-07 03:15:17.635293', '77', 'Iklima Mardiana - bill', 3, '', 12, 1),
(183, '2022-01-07 03:15:17.667433', '76', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(184, '2022-01-07 03:15:17.690133', '75', 'Ivan Septian - bill', 3, '', 12, 1),
(185, '2022-01-07 03:15:17.701272', '74', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(186, '2022-01-07 03:15:17.712240', '73', 'Iklima Mardiana - bill', 3, '', 12, 1),
(187, '2022-01-07 03:15:30.709468', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 8, 1),
(188, '2022-01-07 03:33:23.385532', '104', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(189, '2022-01-07 03:33:23.404316', '103', 'Ivan Septian - bill', 3, '', 12, 1),
(190, '2022-01-07 03:33:23.415426', '102', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(191, '2022-01-07 03:33:23.532986', '101', 'Iklima Mardiana - bill', 3, '', 12, 1),
(192, '2022-01-07 03:33:23.548543', '100', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(193, '2022-01-07 03:33:23.559563', '99', 'Ivan Septian - bill', 3, '', 12, 1),
(194, '2022-01-07 03:33:23.571034', '98', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(195, '2022-01-07 03:33:23.581772', '97', 'Iklima Mardiana - bill', 3, '', 12, 1),
(196, '2022-01-07 03:33:23.592828', '96', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(197, '2022-01-07 03:33:23.603609', '95', 'Ivan Septian - bill', 3, '', 12, 1),
(198, '2022-01-07 03:33:23.615291', '94', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(199, '2022-01-07 03:33:23.625993', '93', 'Iklima Mardiana - bill', 3, '', 12, 1),
(200, '2022-01-07 03:33:23.637096', '92', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(201, '2022-01-07 03:33:23.648141', '91', 'Ivan Septian - bill', 3, '', 12, 1),
(202, '2022-01-07 03:33:23.658913', '90', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(203, '2022-01-07 03:33:23.687957', '89', 'Iklima Mardiana - bill', 3, '', 12, 1),
(204, '2022-01-07 03:33:37.689003', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 8, 1),
(205, '2022-01-07 03:38:38.065412', '108', 'Wijoyo Raharjo M.I.W. - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(206, '2022-01-07 03:38:45.164832', '107', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(207, '2022-01-07 03:38:52.447479', '106', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(208, '2022-01-07 03:38:58.509228', '105', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(209, '2022-01-07 03:48:06.762057', '148', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(210, '2022-01-07 03:48:06.777980', '147', 'Ivan Septian - bill', 3, '', 12, 1),
(211, '2022-01-07 03:48:06.789146', '146', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(212, '2022-01-07 03:48:06.822713', '145', 'Iklima Mardiana - bill', 3, '', 12, 1),
(213, '2022-01-07 03:48:06.833684', '144', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(214, '2022-01-07 03:48:06.844836', '143', 'Ivan Septian - bill', 3, '', 12, 1),
(215, '2022-01-07 03:48:06.855972', '142', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(216, '2022-01-07 03:48:06.867387', '141', 'Iklima Mardiana - bill', 3, '', 12, 1),
(217, '2022-01-07 03:48:06.877813', '140', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(218, '2022-01-07 03:48:06.888538', '139', 'Ivan Septian - bill', 3, '', 12, 1),
(219, '2022-01-07 03:48:06.899720', '138', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(220, '2022-01-07 03:48:06.911259', '137', 'Iklima Mardiana - bill', 3, '', 12, 1),
(221, '2022-01-07 03:48:06.922132', '136', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(222, '2022-01-07 03:48:06.933202', '135', 'Ivan Septian - bill', 3, '', 12, 1),
(223, '2022-01-07 03:48:06.944265', '134', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(224, '2022-01-07 03:48:06.955427', '133', 'Iklima Mardiana - bill', 3, '', 12, 1),
(225, '2022-01-07 03:48:06.966535', '132', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(226, '2022-01-07 03:48:06.977586', '131', 'Ivan Septian - bill', 3, '', 12, 1),
(227, '2022-01-07 03:48:06.988886', '130', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(228, '2022-01-07 03:48:06.999503', '129', 'Iklima Mardiana - bill', 3, '', 12, 1),
(229, '2022-01-07 03:48:07.010647', '128', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(230, '2022-01-07 03:48:07.055180', '127', 'Ivan Septian - bill', 3, '', 12, 1),
(231, '2022-01-07 03:48:07.066227', '126', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(232, '2022-01-07 03:48:07.077312', '125', 'Iklima Mardiana - bill', 3, '', 12, 1),
(233, '2022-01-07 03:48:07.088317', '124', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(234, '2022-01-07 03:48:07.099476', '123', 'Ivan Septian - bill', 3, '', 12, 1),
(235, '2022-01-07 03:48:07.110699', '122', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(236, '2022-01-07 03:48:07.121455', '121', 'Iklima Mardiana - bill', 3, '', 12, 1),
(237, '2022-01-07 03:48:07.132421', '120', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(238, '2022-01-07 03:48:07.176951', '119', 'Ivan Septian - bill', 3, '', 12, 1),
(239, '2022-01-07 03:48:07.187890', '118', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(240, '2022-01-07 03:48:07.198972', '117', 'Iklima Mardiana - bill', 3, '', 12, 1),
(241, '2022-01-07 03:48:07.209960', '116', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(242, '2022-01-07 03:48:07.221123', '115', 'Ivan Septian - bill', 3, '', 12, 1),
(243, '2022-01-07 03:48:07.232620', '114', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(244, '2022-01-07 03:48:07.243124', '113', 'Iklima Mardiana - bill', 3, '', 12, 1),
(245, '2022-01-07 03:48:07.254427', '112', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(246, '2022-01-07 03:48:07.265211', '111', 'Ivan Septian - bill', 3, '', 12, 1),
(247, '2022-01-07 03:48:07.276505', '110', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(248, '2022-01-07 03:48:07.287563', '109', 'Iklima Mardiana - bill', 3, '', 12, 1),
(249, '2022-01-07 03:48:07.298567', '108', 'Wijoyo Raharjo M.I.W. - paid', 3, '', 12, 1),
(250, '2022-01-07 03:48:07.309719', '107', 'Ivan Septian - paid', 3, '', 12, 1),
(251, '2022-01-07 03:48:07.320874', '106', 'Muzakki Abdillah - paid', 3, '', 12, 1),
(252, '2022-01-07 03:48:07.331764', '105', 'Iklima Mardiana - paid', 3, '', 12, 1),
(253, '2022-01-07 03:50:11.167201', '152', 'Wijoyo Raharjo M.I.W. - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(254, '2022-01-07 03:50:18.028167', '151', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(255, '2022-01-07 03:50:23.368449', '150', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(256, '2022-01-07 03:50:28.604065', '149', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(257, '2022-01-07 03:50:44.371111', '156', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(258, '2022-01-07 03:50:44.392432', '155', 'Ivan Septian - bill', 3, '', 12, 1),
(259, '2022-01-07 03:50:44.403628', '154', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(260, '2022-01-07 03:50:44.414819', '153', 'Iklima Mardiana - bill', 3, '', 12, 1),
(261, '2022-01-07 03:50:44.425936', '152', 'Wijoyo Raharjo M.I.W. - paid', 3, '', 12, 1),
(262, '2022-01-07 03:50:44.437054', '151', 'Ivan Septian - paid', 3, '', 12, 1),
(263, '2022-01-07 03:50:44.448003', '150', 'Muzakki Abdillah - paid', 3, '', 12, 1),
(264, '2022-01-07 03:50:44.524567', '149', 'Iklima Mardiana - paid', 3, '', 12, 1),
(265, '2022-01-07 03:51:55.789666', '160', 'Wijoyo Raharjo M.I.W. - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(266, '2022-01-07 03:52:02.371772', '159', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(267, '2022-01-07 03:52:07.588500', '158', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(268, '2022-01-07 03:52:13.140404', '157', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(269, '2022-01-07 03:52:34.270406', '164', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(270, '2022-01-07 03:52:34.284284', '163', 'Ivan Septian - bill', 3, '', 12, 1),
(271, '2022-01-07 03:52:34.295294', '162', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(272, '2022-01-07 03:52:34.306770', '161', 'Iklima Mardiana - bill', 3, '', 12, 1),
(273, '2022-01-07 03:52:34.317802', '160', 'Wijoyo Raharjo M.I.W. - paid', 3, '', 12, 1),
(274, '2022-01-07 03:52:34.328934', '159', 'Ivan Septian - paid', 3, '', 12, 1),
(275, '2022-01-07 03:52:34.339953', '158', 'Muzakki Abdillah - paid', 3, '', 12, 1),
(276, '2022-01-07 03:52:34.351129', '157', 'Iklima Mardiana - paid', 3, '', 12, 1),
(277, '2022-01-07 03:53:03.584457', '168', 'Wijoyo Raharjo M.I.W. - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(278, '2022-01-07 03:53:08.954767', '167', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(279, '2022-01-07 03:53:20.970313', '166', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(280, '2022-01-07 03:53:27.005383', '165', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(281, '2022-01-07 03:53:59.533356', '173', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(282, '2022-01-07 03:53:59.556886', '172', 'Ivan Septian - bill', 3, '', 12, 1),
(283, '2022-01-07 03:53:59.567672', '171', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(284, '2022-01-07 03:53:59.578860', '170', 'Iklima Mardiana - bill', 3, '', 12, 1),
(285, '2022-01-07 03:53:59.590056', '168', 'Wijoyo Raharjo M.I.W. - paid', 3, '', 12, 1),
(286, '2022-01-07 03:53:59.601331', '167', 'Ivan Septian - paid', 3, '', 12, 1),
(287, '2022-01-07 03:53:59.612456', '166', 'Muzakki Abdillah - paid', 3, '', 12, 1),
(288, '2022-01-07 03:53:59.623500', '165', 'Iklima Mardiana - paid', 3, '', 12, 1),
(289, '2022-01-07 03:56:14.907869', '181', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(290, '2022-01-07 03:56:14.921173', '180', 'Ivan Septian - bill', 3, '', 12, 1),
(291, '2022-01-07 03:56:14.932266', '179', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(292, '2022-01-07 03:56:14.943554', '178', 'Iklima Mardiana - bill', 3, '', 12, 1),
(293, '2022-01-07 03:56:14.987708', '177', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(294, '2022-01-07 03:56:14.998557', '176', 'Ivan Septian - bill', 3, '', 12, 1),
(295, '2022-01-07 03:56:15.010320', '175', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(296, '2022-01-07 03:56:15.021124', '174', 'Iklima Mardiana - bill', 3, '', 12, 1),
(297, '2022-01-07 03:58:40.461867', '185', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(298, '2022-01-07 03:58:40.481302', '184', 'Ivan Septian - bill', 3, '', 12, 1),
(299, '2022-01-07 03:58:40.492238', '183', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(300, '2022-01-07 03:58:40.503427', '182', 'Iklima Mardiana - bill', 3, '', 12, 1),
(301, '2022-01-07 04:07:59.383826', '193', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(302, '2022-01-07 04:07:59.397124', '192', 'Ivan Septian - bill', 3, '', 12, 1),
(303, '2022-01-07 04:07:59.408331', '191', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(304, '2022-01-07 04:07:59.419397', '190', 'Iklima Mardiana - bill', 3, '', 12, 1),
(305, '2022-01-07 04:07:59.430727', '189', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(306, '2022-01-07 04:07:59.441721', '188', 'Ivan Septian - bill', 3, '', 12, 1),
(307, '2022-01-07 04:07:59.452340', '187', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(308, '2022-01-07 04:07:59.463628', '186', 'Iklima Mardiana - bill', 3, '', 12, 1),
(309, '2022-01-07 04:08:13.158183', '197', 'Wijoyo Raharjo M.I.W. - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(310, '2022-01-07 04:08:18.508108', '196', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(311, '2022-01-07 04:08:23.795969', '195', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(312, '2022-01-07 04:08:29.224751', '194', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(313, '2022-01-07 04:34:41.842586', '201', 'Wijoyo Raharjo M.I.W. - bill', 3, '', 12, 1),
(314, '2022-01-07 04:34:41.861390', '200', 'Ivan Septian - bill', 3, '', 12, 1),
(315, '2022-01-07 04:34:41.872356', '199', 'Muzakki Abdillah - bill', 3, '', 12, 1),
(316, '2022-01-07 04:34:41.883124', '198', 'Iklima Mardiana - bill', 3, '', 12, 1),
(317, '2022-01-07 04:34:41.894421', '197', 'Wijoyo Raharjo M.I.W. - paid', 3, '', 12, 1),
(318, '2022-01-07 04:34:41.905410', '196', 'Ivan Septian - paid', 3, '', 12, 1),
(319, '2022-01-07 04:34:41.916666', '195', 'Muzakki Abdillah - paid', 3, '', 12, 1),
(320, '2022-01-07 04:34:41.927668', '194', 'Iklima Mardiana - paid', 3, '', 12, 1),
(321, '2022-01-07 04:34:54.149577', '2', 'Muzakki Room', 2, '[{\"changed\": {\"fields\": [\"Finished at\"]}}]', 8, 1),
(322, '2022-01-07 04:35:01.637071', '25', 'Muzakki Abdillah - 2022-01-07 04:33:59.906171+00:00 - 600000', 3, '', 11, 1),
(323, '2022-01-07 04:35:01.654832', '24', 'Wijoyo Raharjo M.I.W. - 2022-01-07 04:28:31.027035+00:00 - 600000', 3, '', 11, 1),
(324, '2022-01-07 06:19:44.978879', '13', 'Test Room', 3, '', 8, 1),
(325, '2022-01-07 06:57:34.348363', '14', 'Test', 3, '', 8, 1),
(326, '2022-01-07 07:16:35.405654', '16', 'MyRoom', 3, '', 8, 1),
(327, '2022-01-07 07:16:35.418668', '15', 'Test', 3, '', 8, 1),
(328, '2022-01-07 07:17:14.870081', '17', 'Room Baru', 1, '[{\"added\": {}}]', 8, 1),
(329, '2022-01-07 07:17:32.288961', '17', 'Room Baru', 3, '', 8, 1),
(330, '2022-01-07 07:21:31.095787', '20', 'Room Joyo', 3, '', 8, 1),
(331, '2022-01-07 07:21:31.149242', '19', 'Room Joyo', 3, '', 8, 1),
(332, '2022-01-07 07:21:31.160457', '18', 'Room Joyo', 3, '', 8, 1),
(333, '2022-01-07 07:22:17.750369', '21', 'Room Joyo', 3, '', 8, 1),
(334, '2022-01-07 07:24:07.320178', '22', 'Room Joyo', 3, '', 8, 1),
(335, '2022-01-07 07:47:55.240698', '205', 'Wijoyo Raharjo M.I.W. - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(336, '2022-01-07 07:48:00.408094', '204', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(337, '2022-01-07 07:48:05.337466', '203', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(338, '2022-01-07 07:48:11.281700', '202', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(339, '2022-01-07 09:17:14.289368', '5', 'Arisan Skuy', 3, '', 8, 1),
(340, '2022-01-07 09:17:14.318571', '3', 'MyRoom', 3, '', 8, 1),
(341, '2022-01-07 09:21:18.094819', '4', 'Wijoyo Raharjo M.I.W.', 1, '[{\"added\": {}}]', 7, 1),
(342, '2022-01-07 09:21:39.482246', '5', 'Ivan Septian', 1, '[{\"added\": {}}]', 7, 1),
(343, '2022-01-07 09:22:10.964806', '5', 'Wijoyo Raharjo M.I.W.', 1, '[{\"added\": {}}]', 9, 1),
(344, '2022-01-07 09:53:50.473159', '24', 'Room Joyo', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 8, 1),
(345, '2022-01-07 10:24:06.143697', '25', 'Room Joyo', 3, '', 8, 1),
(346, '2022-01-07 10:32:40.627454', '11', 'tututu02', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(347, '2022-01-07 10:43:45.627078', '4', 'Wijoyo Raharjo M.I.W.', 2, '[{\"changed\": {\"fields\": [\"Ktp\"]}}]', 7, 1),
(348, '2022-01-07 11:43:44.496652', '12', 'ujicoba02', 3, '', 4, 1),
(349, '2022-01-07 11:49:00.882356', '13', 'ujicoba02', 3, '', 4, 1),
(350, '2022-01-07 11:54:40.514847', '24', 'Room Joyo', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 8, 1),
(351, '2022-01-07 11:55:50.003492', '1', 'Iklima Room', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 8, 1),
(352, '2022-01-07 12:00:34.417519', '206', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(353, '2022-01-07 12:00:42.739966', '207', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(354, '2022-01-07 12:00:48.943231', '208', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(355, '2022-01-07 12:00:55.919317', '210', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(356, '2022-01-07 12:01:03.409583', '211', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(357, '2022-01-07 12:01:10.278033', '212', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(358, '2022-01-07 12:01:17.087538', '214', 'Uji Coba - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(359, '2022-01-07 12:05:15.423260', '219', 'Uji Coba - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(360, '2022-01-07 12:05:22.052179', '217', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(361, '2022-01-07 12:05:29.253262', '216', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(362, '2022-01-07 12:05:36.233806', '215', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(363, '2022-01-07 12:09:30.322656', '21', 'Muzakki Abdillah - member', 1, '[{\"added\": {}}]', 13, 1),
(364, '2022-01-07 12:12:34.120825', '224', 'Uji Coba - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(365, '2022-01-07 12:12:40.816503', '222', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(366, '2022-01-07 12:12:48.007298', '220', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(367, '2022-01-07 12:13:27.246246', '229', 'Uji Coba - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(368, '2022-01-07 12:13:34.038683', '228', 'Wijoyo Raharjo M.I.W. - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(369, '2022-01-07 12:13:41.485285', '227', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(370, '2022-01-07 12:13:49.000677', '226', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(371, '2022-01-07 12:13:56.283485', '225', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(372, '2022-01-07 12:14:30.301074', '234', 'Uji Coba - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(373, '2022-01-07 12:14:37.053181', '233', 'Wijoyo Raharjo M.I.W. - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(374, '2022-01-07 12:14:45.178357', '232', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(375, '2022-01-07 12:14:52.689143', '231', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(376, '2022-01-07 12:14:59.504311', '230', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(377, '2022-01-07 12:15:41.205033', '239', 'Uji Coba - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(378, '2022-01-07 12:15:47.206635', '238', 'Wijoyo Raharjo M.I.W. - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(379, '2022-01-07 12:15:54.308339', '237', 'Ivan Septian - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(380, '2022-01-07 12:16:01.253006', '236', 'Muzakki Abdillah - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(381, '2022-01-07 12:16:07.881432', '235', 'Iklima Mardiana - paid', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'arisan', 'member'),
(11, 'arisan', 'past_winner'),
(12, 'arisan', 'payment'),
(8, 'arisan', 'room'),
(13, 'arisan', 'roomroles'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'users', 'telepon'),
(7, 'users', 'userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-12-30 13:07:45.582809'),
(2, 'auth', '0001_initial', '2021-12-30 13:08:05.935250'),
(3, 'admin', '0001_initial', '2021-12-30 13:08:10.529017'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-12-30 13:08:10.734271'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-30 13:08:10.856519'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-12-30 13:08:13.959486'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-12-30 13:08:15.513308'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-12-30 13:08:16.422031'),
(9, 'auth', '0004_alter_user_username_opts', '2021-12-30 13:08:16.500843'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-12-30 13:08:17.946064'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-12-30 13:08:18.106464'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-12-30 13:08:18.173495'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-12-30 13:08:19.054330'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-12-30 13:08:19.784978'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-12-30 13:08:20.670543'),
(16, 'auth', '0011_update_proxy_permissions', '2021-12-30 13:08:20.768805'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-12-30 13:08:21.584622'),
(18, 'sessions', '0001_initial', '2021-12-30 13:08:25.318183'),
(19, 'users', '0001_initial', '2021-12-30 13:42:28.811120'),
(20, 'users', '0002_alter_userprofile_gol_pendapatan', '2021-12-30 13:43:00.366228'),
(21, 'arisan', '0001_initial', '2021-12-30 14:02:02.856081'),
(22, 'arisan', '0002_rename_room_rooms', '2021-12-30 14:02:24.891619'),
(23, 'arisan', '0003_rename_rooms_room', '2021-12-30 14:04:56.898773'),
(24, 'arisan', '0004_alter_room_started_at', '2021-12-30 14:06:11.165328'),
(25, 'arisan', '0005_alter_room_room_name', '2021-12-30 14:13:09.798311'),
(26, 'users', '0003_alter_userprofile_kota_alter_userprofile_provinsi_and_more', '2021-12-30 14:13:10.784140'),
(27, 'arisan', '0006_room_is_finish_room_is_started', '2021-12-30 14:29:24.521252'),
(28, 'arisan', '0007_member', '2021-12-30 15:00:22.658333'),
(29, 'arisan', '0008_remove_member_room_member_room_remove_member_user_and_more', '2021-12-30 15:15:11.754197'),
(30, 'arisan', '0009_remove_member_room_member_room_remove_member_user_and_more', '2021-12-30 15:18:02.869267'),
(31, 'arisan', '0010_member_role_room', '2021-12-30 15:21:45.178496'),
(32, 'arisan', '0011_alter_member_role_room', '2021-12-30 15:23:39.699337'),
(33, 'arisan', '0012_past_winner', '2021-12-30 15:30:24.367688'),
(34, 'arisan', '0013_rename_deadline_room_intervaldate_and_more', '2021-12-30 16:34:34.481650'),
(35, 'arisan', '0014_alter_member_role_room_alter_payment_status', '2021-12-30 16:35:36.465360'),
(36, 'arisan', '0015_alter_member_room_alter_member_user_and_more', '2021-12-30 18:49:46.971670'),
(37, 'arisan', '0016_remove_member_user_member_user_and_more', '2021-12-30 20:12:48.482399'),
(38, 'arisan', '0017_remove_member_user_member_user_and_more', '2021-12-30 20:13:49.500651'),
(39, 'arisan', '0018_remove_past_winner_room_remove_past_winner_user_and_more', '2021-12-30 20:31:55.879328'),
(40, 'users', '0004_remove_userprofile_user_delete_telepon_and_more', '2021-12-30 20:31:56.632642'),
(41, 'arisan', '0019_initial', '2021-12-30 20:33:25.305664'),
(42, 'users', '0005_initial', '2021-12-30 20:33:26.533299'),
(43, 'arisan', '0020_alter_past_winner_unique_together_and_more', '2021-12-30 20:49:24.897616'),
(44, 'arisan', '0021_payment_amount', '2022-01-07 02:11:45.719191'),
(45, 'arisan', '0022_alter_payment_finished_at_alter_payment_started_at_and_more', '2022-01-07 02:28:37.252819'),
(46, 'arisan', '0023_room_count', '2022-01-07 02:55:34.908252'),
(47, 'arisan', '0024_alter_payment_unique_together', '2022-01-07 03:52:44.940681'),
(48, 'arisan', '0025_alter_payment_unique_together', '2022-01-07 03:53:47.621205'),
(49, 'arisan', '0026_remove_room_count', '2022-01-07 04:34:32.004746');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('27r6s5h3h8ch6sk6tbma00s18vgcub2i', '.eJxVjEEOwiAQRe_C2hAISBmX7j0DmWEGqRqalHbVeHdt0oVu_3vvbyrhutS0dpnTyOqiojr9boT5KW0H_MB2n3Se2jKPpHdFH7Tr28Tyuh7u30HFXr-1AXKEhhlwiCGXEMUHS8aKl2CsoSFy8R59QGAHZ3JZGMBnBzYHKOr9Ae_nOBc:1n36KI:SKhJDGCNSysQNtmLPAy7Z_oIRMBwxTRcdtbYjc3WIX8', '2022-01-14 01:03:22.333036'),
('ov2u6r3cnz1quogv402ho1yuz8ee76aq', '.eJxVjDsOwjAQBe_iGln-xdiU9JzB2vWucQA5UpxUiLuTSCmgfTPz3iLButS0dp7TSOIitDj9bgj5yW0H9IB2n2Se2jKPKHdFHrTL20T8uh7u30GFXrfaolcAwaAvpM8KgzIcrVbFB6e0pYFcjIM1wQRfmHHztVNZQyEbLHvx-QLH9Dc3:1n5mY4:Zm1iuqlUh_YpdHTQP8Qvi7WsUkWNvAVKjCamFB_uiQ0', '2022-01-21 10:32:40.696941'),
('tsiz1775mcpzb75ugdblo3s51zhbvv9p', '.eJxVjMsOwiAQRf-FtSHDG1y69xvIMFCpGkhKuzL-uzbpQrf3nHNfLOK21riNssQ5szNT7PS7JaRHaTvId2y3zqm3dZkT3xV-0MGvPZfn5XD_DiqO-q0TTDJL0gBok9bBWAlWCbLahAAKnS_SFTHpgD440pjIGAOCyKMHkOz9Ab4jNtQ:1n5dzM:aKq0967eFKr69Y_ZxQSdAaPZcxSrv5XO3oU1-3tuXn8', '2022-01-21 01:24:16.830533'),
('ys7n4nae12tnnyf9zofmrz57ikfdvxoi', '.eJxVjEEOwiAQRe_C2hAISBmX7j0DmWEGqRqalHbVeHdt0oVu_3vvbyrhutS0dpnTyOqiojr9boT5KW0H_MB2n3Se2jKPpHdFH7Tr28Tyuh7u30HFXr-1AXKEhhlwiCGXEMUHS8aKl2CsoSFy8R59QGAHZ3JZGMBnBzYHKOr9Ae_nOBc:1n5o5l:f4gZczkl8g5PwOZD773ocPfQ2Q8qEiIA8qAU2Vtiq_c', '2022-01-21 12:11:33.759762');

-- --------------------------------------------------------

--
-- Table structure for table `users_telepon`
--

CREATE TABLE `users_telepon` (
  `id` bigint(20) NOT NULL,
  `telepon` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_telepon`
--

INSERT INTO `users_telepon` (`id`, `telepon`, `user_id`) VALUES
(1, '087825823747', 2),
(2, '087838273747', 2),
(3, '087826384757', 3),
(4, '0878312487831', 10),
(5, '087825922428', 8),
(6, '087825778392', 8),
(7, '087839228348', 14);

-- --------------------------------------------------------

--
-- Table structure for table `users_userprofile`
--

CREATE TABLE `users_userprofile` (
  `id` bigint(20) NOT NULL,
  `nik` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ktp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gol_pendapatan` int(11) DEFAULT NULL,
  `provinsi` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_userprofile`
--

INSERT INTO `users_userprofile` (`id`, `nik`, `ktp`, `gol_pendapatan`, `provinsi`, `kota`, `created_at`, `user_id`) VALUES
(1, '1234123412341234', 'Star.png', 1, 'Jawa Barat', 'Tasikmalaya', '2021-12-30 20:34:25.051103', 2),
(2, '4321432143214321', 'HoneyComb.png', 2, 'Jawa Barat', 'Bandung', '2021-12-30 20:34:44.131927', 3),
(3, '1234123412341234', '8.png', 1, 'Jawa Barat', 'Bandung', '2021-12-31 07:56:34.995960', 10),
(4, '235462713746', '8.png', 1, 'Jawa Barat', 'Bandung', '2022-01-07 09:21:18.090748', 8),
(5, '3827429312349023', '2.png', 2, 'Jawa Barat', 'Kuningan', '2022-01-07 09:21:39.479766', 5),
(6, NULL, '', NULL, NULL, NULL, '2022-01-07 10:31:41.042659', 11),
(9, '1234123412341234', '', 1, 'Jawa Barat', 'Tasikmalaya', '2022-01-07 11:50:33.235568', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arisan_past_winner`
--
ALTER TABLE `arisan_past_winner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `arisan_past_winner_user_id_room_id_f8c867d0_uniq` (`user_id`,`room_id`),
  ADD KEY `arisan_past_winner_room_id_116b65f2_fk_arisan_room_id` (`room_id`);

--
-- Indexes for table `arisan_payment`
--
ALTER TABLE `arisan_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arisan_payment_room_id_6b88efa6_fk_arisan_room_id` (`room_id`),
  ADD KEY `arisan_payment_user_id_51e033c1` (`user_id`);

--
-- Indexes for table `arisan_room`
--
ALTER TABLE `arisan_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arisan_roomroles`
--
ALTER TABLE `arisan_roomroles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `arisan_roomroles_user_id_room_id_966d2926_uniq` (`user_id`,`room_id`),
  ADD KEY `arisan_roomroles_room_id_0404cda1_fk_arisan_room_id` (`room_id`);

--
-- Indexes for table `arisan_room_user`
--
ALTER TABLE `arisan_room_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `arisan_room_user_room_id_user_id_113c6c45_uniq` (`room_id`,`user_id`),
  ADD KEY `arisan_room_user_user_id_17311abe_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `users_telepon`
--
ALTER TABLE `users_telepon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_telepon_user_id_f0370001_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `users_userprofile`
--
ALTER TABLE `users_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arisan_past_winner`
--
ALTER TABLE `arisan_past_winner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `arisan_payment`
--
ALTER TABLE `arisan_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `arisan_room`
--
ALTER TABLE `arisan_room`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `arisan_roomroles`
--
ALTER TABLE `arisan_roomroles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `arisan_room_user`
--
ALTER TABLE `arisan_room_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users_telepon`
--
ALTER TABLE `users_telepon`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users_userprofile`
--
ALTER TABLE `users_userprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arisan_past_winner`
--
ALTER TABLE `arisan_past_winner`
  ADD CONSTRAINT `arisan_past_winner_room_id_116b65f2_fk_arisan_room_id` FOREIGN KEY (`room_id`) REFERENCES `arisan_room` (`id`),
  ADD CONSTRAINT `arisan_past_winner_user_id_4247307c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `arisan_payment`
--
ALTER TABLE `arisan_payment`
  ADD CONSTRAINT `arisan_payment_room_id_6b88efa6_fk_arisan_room_id` FOREIGN KEY (`room_id`) REFERENCES `arisan_room` (`id`),
  ADD CONSTRAINT `arisan_payment_user_id_51e033c1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `arisan_roomroles`
--
ALTER TABLE `arisan_roomroles`
  ADD CONSTRAINT `arisan_roomroles_room_id_0404cda1_fk_arisan_room_id` FOREIGN KEY (`room_id`) REFERENCES `arisan_room` (`id`),
  ADD CONSTRAINT `arisan_roomroles_user_id_c04e14ac_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `arisan_room_user`
--
ALTER TABLE `arisan_room_user`
  ADD CONSTRAINT `arisan_room_user_room_id_6f093dbf_fk_arisan_room_id` FOREIGN KEY (`room_id`) REFERENCES `arisan_room` (`id`),
  ADD CONSTRAINT `arisan_room_user_user_id_17311abe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_telepon`
--
ALTER TABLE `users_telepon`
  ADD CONSTRAINT `users_telepon_user_id_f0370001_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_userprofile`
--
ALTER TABLE `users_userprofile`
  ADD CONSTRAINT `users_userprofile_user_id_87251ef1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
