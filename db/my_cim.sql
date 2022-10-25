-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 25, 2022 at 07:22 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_cim`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowed_devices`
--

DROP TABLE IF EXISTS `allowed_devices`;
CREATE TABLE IF NOT EXISTS `allowed_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` varchar(50) NOT NULL,
  `name` varchar(60) NOT NULL,
  `status` enum('active','inactive','') NOT NULL DEFAULT 'active',
  `institition_id` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `institition_id` (`institition_id`),
  KEY `cat` (`cat`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allowed_devices`
--

INSERT INTO `allowed_devices` (`id`, `cat`, `name`, `status`, `institition_id`, `created_at`) VALUES
(2, 'inputDevice', 'mouse', 'active', 3, '2022-07-20 09:24:43'),
(3, 'inputDevice', 'interactive smartboard', 'active', 3, '2022-07-20 09:25:52'),
(4, 'inputDevice', 'touchscreen', 'active', 3, '2022-07-20 09:26:02'),
(5, 'inputDevice', 'fingerprint scanner', 'active', 3, '2022-07-20 09:26:18'),
(6, 'inputDevice', 'microphone ', 'active', 3, '2022-07-20 09:26:36'),
(7, 'inputDevice', 'keyboard', 'active', 3, '2022-07-20 09:26:47'),
(8, 'inputDevice', 'headset', 'active', 3, '2022-07-20 09:27:09'),
(9, 'inputDevice', 'digital camera', 'active', 3, '2022-07-20 09:27:29'),
(10, 'inputDevice', 'biometric scanner', 'active', 3, '2022-07-20 09:27:43'),
(11, 'inputDevice', 'barcode reader', 'active', 3, '2022-07-20 09:28:00'),
(12, 'networkDevice', 'ethernet hardware', 'active', 3, '2022-07-20 09:28:16'),
(13, 'networkDevice', 'bluetooth/wireless hardware', 'active', 3, '2022-07-20 09:28:31'),
(14, 'processingDevice', 'amd microprocessor', 'active', 3, '2022-07-20 09:29:00'),
(15, 'processingDevice', 'the control unit', 'active', 3, '2022-07-20 09:29:39'),
(16, 'processingDevice', 'arithmetic and logic unit', 'active', 3, '2022-07-20 09:29:49'),
(17, 'processingDevice', 'register and cache', 'active', 3, '2022-07-20 09:30:01'),
(18, 'outputDevice', 'monitor', 'active', 3, '2022-07-20 09:30:54'),
(19, 'outputDevice', 'projection display', 'active', 3, '2022-07-20 09:31:02'),
(20, 'outputDevice', 'interactive (electronic) smartboard', 'active', 3, '2022-07-20 09:31:10'),
(21, 'outputDevice', 'touchscreen', 'active', 3, '2022-07-20 09:31:18'),
(22, 'outputDevice', 'speakers', 'active', 3, '2022-07-20 09:31:25'),
(23, 'outputDevice', 'headphones and earphones', 'active', 3, '2022-07-20 09:31:33'),
(24, 'networkDevice', 'ethernet cables', 'active', 3, '2022-07-20 09:31:52'),
(25, 'networkDevice', 'wireless and bluetooth transmissions', 'active', 3, '2022-07-20 09:32:02'),
(26, 'outputDevice', 'flash drives', 'active', 3, '2022-07-20 09:32:21'),
(27, 'outputDevice', 'dot matrix printer', 'active', 3, '2022-07-20 09:32:39'),
(28, 'outputDevice', '3d printer', 'active', 3, '2022-07-20 09:32:45'),
(29, 'outputDevice', 'inkjet printer', 'active', 3, '2022-07-20 09:32:55'),
(30, 'outputDevice', 'laserjet printer', 'active', 3, '2022-07-20 09:33:02'),
(31, 'storageDevice', 'ram', 'active', 3, '2022-07-20 09:33:36'),
(32, 'storageDevice', 'rom', 'active', 3, '2022-07-20 09:34:44'),
(34, 'storageDevice', 'solid state disk(ssd)', 'active', 3, '2022-07-20 09:35:25'),
(35, 'storageDevice', ' optical disks', 'active', 3, '2022-07-20 09:35:39'),
(36, 'storageDevice', 'flash disks', 'active', 3, '2022-07-20 09:35:48'),
(37, 'storageDevice', 'external disk drives', 'active', 3, '2022-07-20 09:35:59'),
(38, 'storageDevice', 'hard disk drives(hdd)', 'active', 3, '2022-07-20 09:36:27'),
(39, 'inputDevice', 'tablet', 'active', 3, '2022-07-24 12:07:58'),
(40, 'inputDevice', 'computer', 'active', 5, '2022-08-04 09:32:33'),
(41, 'inputDevice', 'phone', 'active', 5, '2022-08-04 09:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `a_internaship_periode`
--

DROP TABLE IF EXISTS `a_internaship_periode`;
CREATE TABLE IF NOT EXISTS `a_internaship_periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_student` int(11) NOT NULL DEFAULT 0,
  `taken_student` int(11) NOT NULL DEFAULT 0,
  `status` enum('activated','deactivated') NOT NULL DEFAULT 'deactivated',
  `user_id` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_internaship_periode`
--

INSERT INTO `a_internaship_periode` (`id`, `start_date`, `end_date`, `total_student`, `taken_student`, `status`, `user_id`) VALUES
(1, '2022-10-16', '2022-11-30', 29, 0, 'activated', 1),
(2, '2021-10-16', '2021-11-30', 0, 0, 'deactivated', 1);

-- --------------------------------------------------------

--
-- Table structure for table `a_partner_student_request`
--

DROP TABLE IF EXISTS `a_partner_student_request`;
CREATE TABLE IF NOT EXISTS `a_partner_student_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_student_number` int(3) NOT NULL,
  `major_in` varchar(100) NOT NULL,
  `partner_id` int(5) NOT NULL,
  `internaship_id` int(3) NOT NULL,
  `given_student_number` int(3) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `internaship_id` (`internaship_id`),
  KEY `partner_id` (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_partner_student_request`
--

INSERT INTO `a_partner_student_request` (`id`, `request_student_number`, `major_in`, `partner_id`, `internaship_id`, `given_student_number`, `created_at`) VALUES
(1, 1, 'Accounting', 1, 1, 0, '0000-00-00'),
(2, 3, 'Finance', 1, 1, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `a_partner_tb`
--

DROP TABLE IF EXISTS `a_partner_tb`;
CREATE TABLE IF NOT EXISTS `a_partner_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `tin` varchar(9) NOT NULL,
  `place` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `c_profile` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_partner_tb`
--

INSERT INTO `a_partner_tb` (`id`, `name`, `phone`, `tin`, `place`, `email`, `is_active`, `c_profile`, `created_at`, `user_id`) VALUES
(1, 'Doyle, Hoeger and Gusikowski', '0788262808', '383566028', 'Antonettatown', 'dane54@ortiz.com', 'yes', 'Magni ut deleniti reprehenderit assumenda distinctio. Corrupti ut dolore sunt laborum voluptas eos natus odio. Nihil totam omnis itaque aut. Rerum sint quam sed.', '2022-10-20 14:58:35', 0),
(2, 'Robel Ltd', '0789692643', '539899686', 'Kariport', 'welch.tomasa@keebler.net', 'yes', 'Error voluptatem blanditiis occaecati qui cumque recusandae. Laborum aut ut eveniet excepturi. Pariatur temporibus vel dicta adipisci eius. Libero est aut officia sapiente ab odio.', '2022-10-23 09:29:08', 0),
(3, 'Lakin, Jakubowski and Ritchie', '0783611162', '358761893', 'West Ashleighberg', 'fpfannerstill@kohler.com', 'yes', 'Enim quas deleniti consectetur cumque omnis quas ad. Sint voluptas occaecati mollitia laboriosam eaque. Minus voluptatem voluptas blanditiis sunt.', '2022-10-23 09:29:08', 0),
(4, 'Friesen-Rippin', '0784146046', '802133111', 'New Xavier', 'sryan@durgan.org', 'yes', 'Maiores molestias praesentium veniam sit tempora cum. Quia molestias quia facere eaque qui. A ad officiis explicabo vel quasi.', '2022-10-23 09:29:08', 0),
(5, 'Hodkiewicz, Schoen and Wiza', '0789161287', '396792596', 'North Wileybury', 'christelle.oconnell@connelly.org', 'yes', 'Voluptatem quia autem quam ipsa quidem. Assumenda quo neque ut fugiat voluptas vitae fuga. Et officiis voluptatem vero nemo sit accusantium et. Ab in pariatur beatae ducimus alias deleniti neque.', '2022-10-23 09:29:09', 0),
(6, 'Casper Group', '0788431110', '263048703', 'Emmerichside', 'pgerhold@donnelly.biz', 'yes', 'Laboriosam ut nostrum et quia accusamus qui impedit quasi. Nemo dolorem consequatur reprehenderit sed dolorem officiis debitis iste. Consequatur quod vel aliquam commodi.', '2022-10-23 09:29:09', 0),
(7, 'Schuppe, Lynch and Gottlieb', '0780675089', '351276113', 'North Amandaview', 'rbahringer@hammes.com', 'yes', 'Facere nihil est cum porro et aliquid aut. Magni rerum facilis aut tempora sit. Autem provident dolorum quis dolore. Aut non sit expedita.', '2022-10-23 09:29:09', 0),
(8, 'Dooley-Bauch', '0781444882', '365186118', 'Lake Damarisstad', 'armstrong.dejuan@marquardt.com', 'yes', 'Omnis est sint et commodi est ducimus. Accusamus ut aliquid magni eligendi quibusdam. Rerum quia non modi expedita quia natus saepe quaerat.', '2022-10-23 09:29:09', 0),
(9, 'McKenzie-Schumm', '0786327328', '606624099', 'West Jadeborough', 'davonte.parker@douglas.net', 'yes', 'Facilis aliquam est itaque tempora. Eveniet et ut voluptate nam. Dolor et rerum incidunt quos sunt. Quae aspernatur velit ducimus ad.', '2022-10-23 09:29:10', 0),
(10, 'Cruickshank-Huel', '0787529331', '032184390', 'Okunevatown', 'ksatterfield@mante.com', 'yes', 'Asperiores doloribus voluptatum sint tempore unde. Natus quod at et hic molestiae. Eum repellendus voluptas molestias voluptatem vitae temporibus. Voluptas asperiores molestiae ab et amet enim.', '2022-10-23 09:29:10', 0),
(11, 'Zulauf and Sons', '0781262542', '681048513', 'Roobview', 'qpagac@hickle.com', 'yes', 'Neque qui autem quod est et rem unde. Aspernatur dolores quasi non occaecati. Repudiandae porro et vero aliquam voluptatem et.', '2022-10-23 09:29:10', 0),
(12, 'Treutel-Hayes', '0781917394', '774332873', 'West Amiya', 'zbayer@ritchie.com', 'yes', 'Et et aut tenetur at tenetur voluptas sed tenetur. Ratione aspernatur optio rem natus aut voluptatum. Non sed soluta velit id. Officiis vero laudantium sequi fugit fugit nisi porro dolores.', '2022-10-23 09:29:10', 0),
(13, 'Dach-Olson', '0785009571', '993408373', 'Tayaville', 'stuart46@herzog.biz', 'yes', 'Adipisci aut quibusdam reiciendis est. Et consectetur praesentium sed et blanditiis perspiciatis. Est accusantium quam nesciunt deleniti voluptate dolor quasi ad.', '2022-10-23 09:29:10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `a_student_logbook`
--

DROP TABLE IF EXISTS `a_student_logbook`;
CREATE TABLE IF NOT EXISTS `a_student_logbook` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `used_tools` varchar(200) NOT NULL,
  `screenshoots` varchar(200) NOT NULL,
  `objective` varchar(200) NOT NULL,
  `student_id` int(6) NOT NULL,
  `suppervisor_id` int(6) NOT NULL,
  `internaship_id` int(6) NOT NULL,
  `partner_id` int(6) NOT NULL,
  `partner_comment` varchar(200) NOT NULL,
  `suppervisior_comment` varchar(200) NOT NULL,
  `log_date` date NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `a_student_tb`
--

DROP TABLE IF EXISTS `a_student_tb`;
CREATE TABLE IF NOT EXISTS `a_student_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `major_in` varchar(100) NOT NULL,
  `card_id` int(6) NOT NULL,
  `internaship_periode_id` int(6) NOT NULL,
  `partner_id` int(6) DEFAULT NULL,
  `suppervisior_id` int(6) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `internaship_periode_id` (`internaship_periode_id`),
  KEY `suppervisior_id` (`suppervisior_id`),
  KEY `partner_id` (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_student_tb`
--

INSERT INTO `a_student_tb` (`id`, `first_name`, `last_name`, `email`, `phone`, `gender`, `major_in`, `card_id`, `internaship_periode_id`, `partner_id`, `suppervisior_id`, `created_at`, `updated_at`) VALUES
(1, 'Jayda', 'Batz', 'goldner.rusty@yahoo.com', '+2249154930942', 'female', 'Software Engineering', 18089, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(2, 'Aniyah', 'Klein', 'vena.osinski@yahoo.com', '+9147585652248', 'female', 'Software Engineering', 19439, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(3, 'Vilma', 'Mitchell', 'cameron.funk@orn.com', '+1108422840684', 'female', 'Information Management', 20059, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(4, 'Ignacio', 'Dibbert', 'lueilwitz.augustine@yahoo.com', '+5839686429147', 'male', 'Software Engineering', 19428, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(5, 'Eugenia', 'Bode', 'xkirlin@yahoo.com', '+3869659343525', 'female', 'theology', 18548, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(6, 'Beaulah', 'Abernathy', 'vidal29@parker.com', '+3229388812539', 'female', 'Health Sciences', 17631, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(7, 'Verner', 'Muller', 'ppacocha@maggio.info', '+8885875191282', 'male', 'Information Management', 18046, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(8, 'Aurelie', 'Bernhard', 'telly.kreiger@gmail.com', '+5854838426463', 'female', 'Management', 17536, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(9, 'Braeden', 'Wisoky', 'xdickens@harvey.biz', '+1460726595940', 'male', 'Accounting', 17795, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(10, 'Kaleb', 'Koepp', 'pearline98@gutkowski.org', '+7294017745308', 'male', 'Information Management', 18187, 1, NULL, NULL, '2022-10-23 09:25:29', '2022-10-23 09:25:29'),
(11, 'Alejandrin', 'Ferry', 'akeem.mccullough@green.net', '+1308488346713', 'male', 'Network and communication Systems', 19936, 1, NULL, NULL, '2022-10-23 09:25:30', '2022-10-23 09:25:30'),
(12, 'Alexandrine', 'Ledner', 'lesch.earline@dicki.com', '+2184133287894', 'female', 'Finance', 19642, 1, NULL, NULL, '2022-10-23 09:25:30', '2022-10-23 09:25:30'),
(13, 'Audra', 'Dibbert', 'maria66@conroy.com', '+7376492427544', 'female', 'Accounting', 17507, 1, NULL, NULL, '2022-10-23 09:25:30', '2022-10-23 09:25:30'),
(14, 'Laurence', 'Walker', 'kuhic.kaylah@mills.net', '+3352463745165', 'female', 'Software Engineering', 18335, 1, NULL, NULL, '2022-10-23 09:28:13', '2022-10-23 09:28:13'),
(15, 'Darius', 'Abshire', 'xsanford@schulist.com', '+3536703394132', 'male', 'Information Management', 19738, 1, NULL, NULL, '2022-10-23 09:28:13', '2022-10-23 09:28:13'),
(16, 'Antonia', 'Kreiger', 'stanley.moore@waters.com', '+2715983778371', 'female', 'Finance', 19903, 1, NULL, NULL, '2022-10-23 09:28:13', '2022-10-23 09:28:13'),
(17, 'Enos', 'Wintheiser', 'jocelyn18@gmail.com', '+2706485057969', 'male', 'Finance', 19144, 1, NULL, NULL, '2022-10-23 09:28:13', '2022-10-23 09:28:13'),
(18, 'Mossie', 'Feeney', 'pkautzer@kirlin.info', '+2241685451810', 'female', 'Information Management', 19406, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(19, 'Kole', 'Hudson', 'bechtelar.aleen@hotmail.com', '+8007962010092', 'male', 'Information Management', 18113, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(20, 'Tom', 'Kozey', 'deondre.runolfsson@weissnat.com', '+8812958700640', 'male', 'Health Sciences', 17638, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(21, 'Jamir', 'Fritsch', 'lhegmann@hotmail.com', '+8113197328134', 'male', 'Marketing', 19878, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(22, 'Damian', 'Ritchie', 'rasheed.hessel@hintz.info', '+2342979008749', 'male', 'Marketing', 19984, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(23, 'Jamel', 'Cormier', 'evans.mitchell@morar.com', '+3683747566242', 'male', 'Management', 17085, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(24, 'Angelica', 'Konopelski', 'dortha.ryan@cummerata.info', '+8745007934330', 'female', 'Network and communication Systems', 17641, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(25, 'Westley', 'Ryan', 'gusikowski.juana@gmail.com', '+8409968819665', 'male', 'Information Management', 17517, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(26, 'Cameron', 'Ziemann', 'gideon.mcglynn@gmail.com', '+6744862612713', 'male', 'Management', 18910, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(27, 'Antone', 'Greenfelder', 'earlene95@crist.biz', '+5661705339183', 'male', 'Finance', 18016, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(28, 'Jacquelyn', 'Emmerich', 'claude31@gmail.com', '+5156748987502', 'female', 'Finance', 17738, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14'),
(29, 'Pasquale', 'McCullough', 'xledner@yahoo.com', '+5955775719862', 'female', 'Health Sciences', 19499, 1, NULL, NULL, '2022-10-23 09:28:14', '2022-10-23 09:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `a_suppervisior_tb`
--

DROP TABLE IF EXISTS `a_suppervisior_tb`;
CREATE TABLE IF NOT EXISTS `a_suppervisior_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(200) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `department` enum('IT','BUSSINESS','THEOLOGY','HEALTH SCIENCE') NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_suppervisior_tb`
--

INSERT INTO `a_suppervisior_tb` (`id`, `names`, `gender`, `department`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lacy Veum', 'female', 'IT', 'lonzo.koepp@hotmail.com', '0784004976', 'active', '2022-10-16 16:39:26', '2022-10-16 16:39:26'),
(2, 'Mayra Sanford', 'female', 'HEALTH SCIENCE', 'muriel56@sipes.com', '0786312163', 'active', '2022-10-16 16:39:26', '2022-10-16 16:39:26'),
(3, 'Kelsi Mayert MD', 'female', 'IT', 'gerda.swift@lind.com', '0787959446', 'active', '2022-10-16 16:39:26', '2022-10-16 16:39:26'),
(4, 'Gavin Dibbert', 'male', 'THEOLOGY', 'william99@yahoo.com', '0781796538', 'active', '2022-10-16 16:39:26', '2022-10-16 16:39:26'),
(5, 'Eden Ritchie', 'female', 'HEALTH SCIENCE', 'lamar65@pfeffer.com', '0789081336', 'active', '2022-10-16 16:39:26', '2022-10-16 16:39:26'),
(6, 'Dr. Alda Collins IV', 'female', 'THEOLOGY', 'chasity23@upton.com', '0788060762', 'active', '2022-10-16 16:39:26', '2022-10-16 16:39:26'),
(7, 'Dixie Mills', 'female', 'HEALTH SCIENCE', 'yessenia63@becker.com', '0784731846', 'active', '2022-10-16 16:39:26', '2022-10-16 16:39:26'),
(8, 'Mr. Vernon Russel III', 'male', 'THEOLOGY', 'mkohler@koelpin.org', '0781084518', 'active', '2022-10-16 16:39:26', '2022-10-16 16:39:26'),
(9, 'Arianna VonRueden II', 'female', 'THEOLOGY', 'dubuque.thora@grant.com', '0785076217', 'active', '2022-10-16 16:39:27', '2022-10-16 16:39:27'),
(10, 'Cole Ferry', 'male', 'IT', 'deron.huels@runolfsson.net', '0785902280', 'active', '2022-10-16 16:43:52', '2022-10-16 16:43:52'),
(11, 'Moshe Lindgren', 'male', 'BUSSINESS', 'zbahringer@yahoo.com', '0785726001', 'active', '2022-10-16 16:43:52', '2022-10-16 16:43:52'),
(12, 'Cathryn Ullrich DDS', 'female', 'BUSSINESS', 'leffler.winifred@botsford.com', '0788489263', 'active', '2022-10-16 16:43:52', '2022-10-16 16:43:52'),
(13, 'Margaretta Hirthe', 'female', 'BUSSINESS', 'blaze10@beatty.com', '0785395262', 'active', '2022-10-16 16:43:52', '2022-10-16 16:43:52'),
(14, 'Adah Stoltenberg', 'female', 'IT', 'eloise.kshlerin@gmail.com', '0789040651', 'active', '2022-10-16 16:43:52', '2022-10-16 16:43:52'),
(15, 'Sonny Green', 'male', 'HEALTH SCIENCE', 'feil.merle@mosciski.com', '0789367801', 'active', '2022-10-16 16:43:52', '2022-10-16 16:43:52'),
(16, 'Adrian Powlowski', 'male', 'HEALTH SCIENCE', 'hintz.ebony@bins.biz', '0783003613', 'active', '2022-10-16 16:43:52', '2022-10-16 16:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `a_users`
--

DROP TABLE IF EXISTS `a_users`;
CREATE TABLE IF NOT EXISTS `a_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `names` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `secret` varchar(150) NOT NULL,
  `level` enum('ADMIN','INST_ADMIN','BEN_ADMIN','SUP_ADMIN','PARTNER','STUDENT','SUPERVISIOR','USER') NOT NULL DEFAULT 'USER',
  `institition_id` varchar(5) NOT NULL DEFAULT '0',
  `ben_id` int(5) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `a_ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_indx` (`username`),
  KEY `username` (`username`),
  KEY `institition_id` (`institition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_users`
--

INSERT INTO `a_users` (`id`, `names`, `username`, `phone`, `secret`, `level`, `institition_id`, `ben_id`, `status`, `updated_at`, `a_ip`) VALUES
(1, 'john', 'risa', NULL, '$2y$10$yCJUqcquW6HUZAMgufO5xOmDSX8xTwVmaDcRoxLdnC6V8B/Z77TIq', 'ADMIN', '1', 0, 'active', '2022-10-24 11:07:57', '::1'),
(11, 'mutuyimana andre', 'u1_mutu', '07485934', '$2y$10$advXItbZ4Me08n2sCovQTuDhKkjoW6ldEY2ylpj0CIvZXt6vCaiay', 'INST_ADMIN', '3', 0, 'active', '2022-08-03 21:38:39', '127.0.0.1'),
(12, 'kalisa andre', 'u3_kali', '0743587348', '$2y$10$SMYyLri3Iv5ReaMf1V6Rpe904IBpGqwaLwrDfwbbU59iFIW22NdNu', 'SUPERVISIOR', '3', 1, 'active', '2022-08-03 21:04:58', '127.0.0.1'),
(13, 'mukiza andre', 'u1_muk', '0723942934', '$2y$10$r7AwWpALzN8ZVXpXYd9/g.18mKG5WeZ1srY/47RN6rTIBIZOAy9mm', 'INST_ADMIN', '2', 0, 'active', '2022-07-21 10:05:18', '::1'),
(14, 'ndahiro', 'u2_nda', '0723842389', '$2y$10$Pe1rLhlXlpdt8cepsO9asOU2pCMpKhNOpvb8KXj6r7BvvWf7RZadu', 'BEN_ADMIN', '2', 2, 'active', '2022-07-22 09:51:53', '::1'),
(15, 'mutabazi', 'u3_t', '0732482389', '$2y$10$mg9Z8obrdI0tdrEWkUIT6Og7MAYx.Ws8WGTX4KFCSbCvL/58QcbDi', 'BEN_ADMIN', '3', 3, 'active', '2022-07-22 15:23:57', '::1'),
(16, 'NDORI', 'u1_ndori', '0748539458', '$2y$10$XdgNm4UaVGXCE3yI8PqEiO//vM54y2l3o1.iZlXav8QeMODUWJRie', 'BEN_ADMIN', '1', 4, 'active', '2022-07-28 09:42:19', NULL),
(17, 'mucyo', 'u1_', '0345374583', '$2y$10$D4sWL2ZEaS6jYUcj9kfZieHB0L0ud1LoIGceFAMgdVqwWCQQtWyfS', 'BEN_ADMIN', '3', 3, 'active', '2022-07-28 09:45:24', NULL),
(18, 'kalisa andre', 'mytech', '0734257348', '$2y$10$mGnnn1UkouZKAqWsfMF3jejC93av2SXrmv4QkBT3gGv5Yh6Z1BJ6.', 'SUP_ADMIN', '3', 0, 'active', '2022-08-03 21:35:21', '127.0.0.1'),
(19, 'karenzei', 'bk', '0747823748', '$2y$10$sDRN/JGNI84vV8IcIte1ZuKcE6DKqG90lLv1hgRaDLtYgo3PiVNyC', 'SUP_ADMIN', '4', 0, 'active', '2022-08-04 10:13:42', '::1'),
(20, 'Iransubije Philemon', 'umucyotech', '0780627626', '$2y$10$eoQOn/P6i8zEV4jMSELst.LGcxOY8Z/RoO0O7V3V5LI94LtCiM4ni', 'SUP_ADMIN', '5', 0, 'active', '2022-08-10 17:30:00', '127.0.0.1'),
(21, 'Daniel Nsanzabandi', 'u1_danmindc', '0786432606', '$2y$10$cgswtT2GRfsyD06urU0AwODfqSt3JDEJcyJl1zrhBHt.iQIdNFdxG', 'INST_ADMIN', '5', 0, 'active', '2022-09-01 12:04:32', '127.0.0.1'),
(22, 'Marcel Ngabo', 'u1_marcelminalc', '0780180142', '$2y$10$qNBn5NfCmKadSBtlVjbMjOAhqsbqgIJiHVuGGHxBtz2dpqMyeuYdi', 'INST_ADMIN', '4', 0, 'active', '2022-08-04 13:23:37', '127.0.0.1'),
(23, 'Manzi Samuel', 'u1_manzkarongi', '0780627626', '$2y$10$LgCIAiqipomY5Hhw6JbcTettrgQ5Iusz5Adhb5jUWD3EbBSJ1irvO', 'BEN_ADMIN', '5', 5, 'active', '2022-09-01 12:02:55', '127.0.0.1'),
(24, 'Henry John', 'positivo', '0783673673', '$2y$10$uvL6Ynx9/DGcInZfTuQb1u1j5zptFgd6OtRiS3YdnbeuTWoaT.LL6', 'SUP_ADMIN', '6', 0, 'active', '2022-09-01 12:06:25', '127.0.0.1'),
(25, 'Mark Franklin', 'dellrw', '0726464643', '$2y$10$dLru.tz3VR/XhNYdSO8dcOCByBOcn0xnNzfwnJIUOaYRrcn76jLdG', 'SUP_ADMIN', '7', 0, 'active', '2022-08-31 22:48:36', '127.0.0.1'),
(26, 'samuel ', 'u5_samgasb', '0780627626', '$2y$10$2Lgw2RXK9/RqoMT1Cf761eGLtoCncRR0QocKXAkodxKPhu6yVr.fy', 'BEN_ADMIN', '5', 9, 'active', '2022-08-31 22:36:18', '127.0.0.1'),
(27, 'gad', 'u4_gad', '0788881530', '$2y$10$uBpVpKblkF02SmPGwur77.wKhJZvmHxJtaWhVxXkESHoYIpvb1h5i', 'BEN_ADMIN', '4', 6, 'active', '2022-08-31 12:21:15', '127.0.0.1'),
(28, 'mudenge Rugamba', 'mudenge', '0783738735', '$2y$10$Gf/mjjocCZW//jE8wXgp/.mqVip.IKM0M/afS5dBkY6YvAHnfItR6', 'SUP_ADMIN', '1', 0, 'active', '2022-08-31 12:21:53', '127.0.0.1'),
(29, 'Robel Ltd', 'macejkovic.clinton', '0789692643', '$2y$10$zZKLPLZEs0j9X6Hqeg.ieeBFe0MYd617Z3gRlURBH88Z6bsV7xRYi', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:08', NULL),
(30, 'Lakin, Jakubowski and Ritchie', 'jon.brakus', '0783611162', '$2y$10$RJwxRr1LiLFT5KrzIhSMTuaNg9OyvfAyajqVTiffSi6opP37z5Q/m', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:08', NULL),
(31, 'Friesen-Rippin', 'littel.enos', '0784146046', '$2y$10$7Tr66vkfzHEin6UGz5U/fe6Xbz.g4QRvu/FzzMPQ9C8VTLsoOxR8W', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:08', NULL),
(32, 'Hodkiewicz, Schoen and Wiza', 'parker.daisy', '0789161287', '$2y$10$6eQmX6rOSmihlhS/tOZWVuThXMJxAmWxTLRMl42pA9yqI9S3UHmt6', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:09', NULL),
(33, 'Casper Group', 'amiya.walter', '0788431110', '$2y$10$1IbeF0N5FsF2QBXvtUnVAuwFpLstOQ9KdN2epR2zzZO3xNCB3djMu', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:09', NULL),
(34, 'Schuppe, Lynch and Gottlieb', 'khackett', '0780675089', '$2y$10$JV9UEQj4H9D2WhNghsYoRu3j99zXX2ipvx6kBP.gqgvtfWIHigTKa', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:09', NULL),
(35, 'Dooley-Bauch', 'ivonrueden', '0781444882', '$2y$10$AlBOAiZS97OH.x70mbRDX.ipguF2F5SjK5FC4oz0COl2FtOgLVZV.', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:09', NULL),
(36, 'McKenzie-Schumm', 'lstrosin', '0786327328', '$2y$10$DpcMurSmAeG5InDNkSk80OeiX4RstPtsaK.POCdos./XvIGUyHvjC', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:10', NULL),
(37, 'Cruickshank-Huel', 'eli.corkery', '0787529331', '$2y$10$wna5uPvNmDgiXIpvdiUNo.K1YOHCa0Bc67uVdNdxAU8IVUpnztlZW', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:10', NULL),
(38, 'Zulauf and Sons', 'block.lonzo', '0781262542', '$2y$10$lQ.RPBfHrF4qeKGiAjS1ouhtG5eYBlDksEyIqyuCZ7d2yvP0qlb7C', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:10', NULL),
(39, 'Treutel-Hayes', 'xcormier', '0781917394', '$2y$10$xULnbKnfGBcYFbR105IH8u13rwquRzoCiZIS0RhZynVNuLIQOS6KK', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:10', NULL),
(40, 'Dach-Olson', 'jrunolfsdottir', '0785009571', '$2y$10$5H7fxg7p9wcuGC2NeIyjAex2uoWbwLMs1vkuzgEIm3RHNaDlAJzAm', 'PARTNER', '0', 0, 'active', '2022-10-23 09:29:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_tb`
--

DROP TABLE IF EXISTS `beneficiary_tb`;
CREATE TABLE IF NOT EXISTS `beneficiary_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(5) NOT NULL,
  `institition_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `institition_id` (`institition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `beneficiary_tb`
--

INSERT INTO `beneficiary_tb` (`id`, `name`, `phone`, `email`, `created_at`, `user_id`, `institition_id`) VALUES
(5, 'IPRC-KARONGI', '0780627626', 'iprckarongi@ac.rw', '2022-08-04 09:11:34', 1, 5),
(6, 'Gasabo District', '0785646744', 'info@gasabodistrict.gov.rw', '2022-08-04 09:12:34', 1, 4),
(7, 'RIB', '0783676367', 'info@rib.gov.rw', '2022-08-04 09:13:06', 1, 3),
(8, 'CHK', '0724474747', 'info@chk.minisante.rw', '2022-08-04 09:13:41', 1, 2),
(9, 'Gasabo District OFFICE', '0788328237', 'info@gasabodistrict.gov.rw', '2022-08-04 12:43:52', 21, 5);

-- --------------------------------------------------------

--
-- Table structure for table `device_requests`
--

DROP TABLE IF EXISTS `device_requests`;
CREATE TABLE IF NOT EXISTS `device_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `numbers` int(11) NOT NULL,
  `specifications` text NOT NULL,
  `purchased` int(3) NOT NULL DEFAULT 0,
  `m_unit` varchar(10) NOT NULL,
  `institition_id` int(3) NOT NULL,
  `ben_id` int(3) NOT NULL,
  `request_code` varchar(5) NOT NULL,
  `user_id` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `request_code` (`request_code`),
  KEY `ben_id` (`ben_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `device_requests`
--

INSERT INTO `device_requests` (`id`, `name`, `numbers`, `specifications`, `purchased`, `m_unit`, `institition_id`, `ben_id`, `request_code`, `user_id`, `created_at`) VALUES
(1, 'keyboard', 3, 'hp\nquert', 0, '3', 3, 1, '00001', 12, '2022-08-03 21:31:39'),
(2, 'computer', 2, 'HP Elite Desktop PC Computer Intel Core i5 3.1-GHz, 8 gb Ram, 1 TB Hard Drive, DVDRW, 19 Inch LCD Monitor, Windows 10', 2, '2', 5, 5, '00002', 23, '2022-08-04 09:36:39'),
(3, 'tablet', 2, '1 GB RAM, 8 GB max storage, RK3126 / Cortex-A7 chipset, 2 MP primary camera, 0 MP front camera, screen TN-LCD 7.0\" 1200x600, Android, 3.5mm', 2, '2', 5, 5, '00003', 23, '2022-08-04 11:58:53'),
(4, 'inkjet printer', 3, 'Print Resolution. Up to 4800 x 1200 dpi ; Print Technology. 2 FINE Cartridges (Black and Colour) ; Mono Print Speed. Approx. 7.7 ipm.', 0, '3', 5, 9, '00004', 26, '2022-08-04 12:48:17'),
(5, 'inkjet printer', 3, 'Print Resolution. Up to 4800 x 1200 dpi ; Print Technology. 2 FINE Cartridges (Black and Colour) ; Mono Print Speed. Approx. 7.7 ipm.', 3, '3', 4, 6, '00005', 27, '2022-08-04 12:52:54'),
(6, 'laserjet printer', 2, 'HP LaserJet M140we Printer with HP  and 6 Months Instant Ink. ', 2, '2', 5, 5, '00006', 23, '2022-08-04 13:14:52'),
(7, 'speakers', 1, 'dell speaker', 0, '1', 5, 0, '00007', 21, '2022-08-04 21:09:51'),
(8, 'monitor', 1, 'some spec 4\n14 inchs', 0, '1', 5, 5, '00008', 23, '2022-08-08 19:34:53'),
(9, 'flash drives', 2, 'scan disk\n8 GB', 2, '2', 5, 5, '00009', 23, '2022-08-08 19:38:44'),
(10, 'projection display', 1, '40 long light', 0, '1', 5, 5, '00010', 23, '2022-08-08 19:49:34'),
(11, 'touchscreen', 1, 'dell hd', 0, '1', 5, 5, '00011', 23, '2022-08-08 20:51:13'),
(12, 'computer', 1, 'I7, 1T, HDMI', 1, '1', 5, 5, '00012', 23, '2022-08-09 09:20:58'),
(13, 'fingerprint scanner', 1, 'Finger, ransonic print', 1, '1', 5, 0, '00013', 21, '2022-08-09 09:29:57'),
(14, 'digital camera', 1, 'Cam, 1TB, i5', 1, '1', 5, 5, '00014', 23, '2022-08-09 09:39:10'),
(15, 'barcode reader', 1, 'i5', 0, '1', 5, 5, '00015', 23, '2022-08-10 17:10:18'),
(16, 'computer', 2, 'i5, laptop', 0, '2', 5, 5, '00016', 23, '2022-08-12 10:35:12'),
(17, 'biometric scanner', 1, 'bio, i5 ', 0, '1', 5, 5, '00017', 23, '2022-08-18 18:22:10'),
(18, 'computer', 2, 'laptop, core i5', 0, '2', 5, 5, '00018', 23, '2022-08-19 12:13:34'),
(19, 'biometric scanner', 1, 'hp scanner', 0, '1', 5, 5, '00019', 23, '2022-08-31 16:19:05'),
(20, 'computer', 1, '1 GB RAM, 8 GB Max Storage, RK3126 / Cortex-A7 Chipset, 2 MP Primary Camera, 0 MP Front Camera, Screen TN-LCD 7.0\" 1200x600, Android, 3.5mm', 0, '1', 5, 5, '00020', 23, '2022-08-31 22:20:22'),
(21, 'monitor', 1, '1 GB RAM, 8 GB Max Storage, RK3126 / Cortex-A7 Chipset', 1, '1', 5, 5, '00021', 23, '2022-08-31 22:38:05'),
(22, 'computer', 0, 'Hp, i5', 0, '0', 5, 5, '00022', 23, '2022-09-01 12:04:12');

-- --------------------------------------------------------

--
-- Table structure for table `institition_tb`
--

DROP TABLE IF EXISTS `institition_tb`;
CREATE TABLE IF NOT EXISTS `institition_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `institition_tb`
--

INSERT INTO `institition_tb` (`id`, `name`, `email`, `created_at`, `user_id`) VALUES
(2, 'minisante', 'min@gmail.com', '2022-07-19 11:29:35', 1),
(3, 'minijuste', 'minjuest.info@gmail.com', '2022-07-19 11:44:16', 1),
(4, 'MINALOC', 'info@minaloc.gov.rw', '2022-08-04 08:19:05', 1),
(5, 'MINEDUC', 'info@mineduc.ac.rw', '2022-08-04 09:10:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inst_requests`
--

DROP TABLE IF EXISTS `inst_requests`;
CREATE TABLE IF NOT EXISTS `inst_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_code` varchar(6) NOT NULL,
  `inst_id` int(3) NOT NULL,
  `ben_id` int(3) NOT NULL,
  `tot_requests` int(6) NOT NULL,
  `tot_failed` int(11) NOT NULL DEFAULT 0,
  `status` enum('benToInst','instToBen','instToAdmin','adminToInst','benToConfirm','instToConfirm') NOT NULL,
  `request_year` year(4) NOT NULL,
  `sup_id` int(3) NOT NULL DEFAULT 0,
  `has_registered` enum('yes','no') NOT NULL DEFAULT 'no',
  `has_published` enum('yes','no') NOT NULL DEFAULT 'no',
  `has_deliveried` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `r_code_2` (`r_code`),
  KEY `r_code` (`r_code`),
  KEY `sup_id` (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inst_requests`
--

INSERT INTO `inst_requests` (`id`, `r_code`, `inst_id`, `ben_id`, `tot_requests`, `tot_failed`, `status`, `request_year`, `sup_id`, `has_registered`, `has_published`, `has_deliveried`, `created_at`, `updated_at`, `updated_by`) VALUES
(1, '00001', 3, 1, 3, 0, 'instToAdmin', 2022, 5, 'no', 'yes', 'no', '2022-08-03 21:31:39', '2022-08-03 21:41:41', 11),
(2, '00002', 5, 5, 2, 0, 'instToBen', 2022, 5, 'yes', 'yes', 'yes', '2022-08-04 09:36:39', '2022-08-04 11:54:30', 23),
(3, '00003', 5, 5, 2, 0, 'instToBen', 2022, 6, 'yes', 'yes', 'yes', '2022-08-04 11:58:53', '2022-08-04 12:26:38', 23),
(4, '00004', 5, 9, 3, 0, 'instToAdmin', 2022, 0, 'no', 'yes', 'no', '2022-08-04 12:48:17', '2022-08-04 13:17:00', 21),
(5, '00005', 4, 6, 3, 0, 'instToBen', 2022, 7, 'yes', 'yes', 'yes', '2022-08-04 12:52:54', '2022-08-04 13:07:07', 27),
(6, '00006', 5, 5, 2, 0, 'instToBen', 2022, 7, 'yes', 'yes', 'yes', '2022-08-04 13:14:52', '2022-08-04 19:23:13', 23),
(7, '00007', 5, 0, 1, 0, 'instToAdmin', 2022, 0, 'no', 'yes', 'no', '2022-08-04 21:09:51', '2022-08-04 21:14:03', 21),
(8, '00008', 5, 5, 1, 0, 'benToInst', 2022, 0, 'no', 'no', 'no', '2022-08-08 19:34:53', '2022-08-08 19:34:53', 23),
(9, '00009', 5, 5, 2, 0, 'adminToInst', 2022, 7, 'yes', 'yes', 'yes', '2022-08-08 19:38:44', '2022-08-08 19:56:55', 21),
(10, '00010', 5, 5, 1, 0, 'benToInst', 2022, 0, 'no', 'no', 'no', '2022-08-08 19:49:34', '2022-08-08 19:49:34', 23),
(11, '00011', 5, 5, 1, 0, 'instToAdmin', 2022, 0, 'no', 'yes', 'no', '2022-08-08 20:51:13', '2022-08-08 21:31:05', 21),
(12, '00012', 5, 5, 1, 0, 'instToBen', 2022, 7, 'yes', 'yes', 'yes', '2022-08-09 09:20:58', '2022-08-09 09:31:16', 23),
(13, '00013', 5, 0, 1, 0, 'benToConfirm', 2022, 7, 'yes', 'yes', 'yes', '2022-08-09 09:29:57', '2022-08-31 22:33:34', 21),
(14, '00014', 5, 5, 1, 0, 'instToBen', 2022, 6, 'yes', 'yes', 'yes', '2022-08-09 09:39:10', '2022-08-09 09:50:49', 23),
(15, '00015', 5, 5, 1, 0, 'instToAdmin', 2022, 0, 'no', 'yes', 'no', '2022-08-10 17:10:18', '2022-08-10 17:29:14', 21),
(16, '00016', 5, 5, 2, 0, 'instToAdmin', 2022, 0, 'no', 'yes', 'no', '2022-08-12 10:35:12', '2022-08-12 10:40:16', 21),
(17, '00017', 5, 5, 1, 0, 'instToAdmin', 2022, 0, 'no', 'yes', 'no', '2022-08-18 18:22:10', '2022-08-18 18:23:51', 21),
(18, '00018', 5, 5, 2, 0, 'benToInst', 2022, 0, 'no', 'no', 'no', '2022-08-19 12:13:34', '2022-08-19 12:13:34', 23),
(19, '00019', 5, 5, 1, 0, 'benToInst', 2022, 0, 'no', 'no', 'no', '2022-08-31 16:19:05', '2022-08-31 16:19:05', 23),
(20, '00020', 5, 5, 1, 0, 'instToAdmin', 2022, 0, 'no', 'yes', 'no', '2022-08-31 22:20:22', '2022-08-31 22:22:00', 21),
(21, '00021', 5, 5, 1, 0, 'instToBen', 2022, 7, 'yes', 'yes', 'yes', '2022-08-31 22:38:05', '2022-08-31 22:44:06', 23),
(22, '00022', 5, 5, 0, 0, 'instToAdmin', 2022, 0, 'no', 'yes', 'no', '2022-09-01 12:04:12', '2022-09-01 12:05:58', 21);

-- --------------------------------------------------------

--
-- Table structure for table `notifications_tb`
--

DROP TABLE IF EXISTS `notifications_tb`;
CREATE TABLE IF NOT EXISTS `notifications_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `level` enum('ADMIN','INST_ADMIN','BEN_ADMIN','SUP_ADMIN') NOT NULL,
  `level_id` int(3) NOT NULL,
  `done_by` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `level_id` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications_tb`
--

INSERT INTO `notifications_tb` (`id`, `message`, `link`, `level`, `level_id`, `done_by`, `created_at`) VALUES
(9, 'Risa confirmed your delivery  #00002', 'home?d=00002', '', 5, 1, '2022-08-04 11:49:28'),
(21, 'Risa confirmed your delivery  #00003', 'home?d=00003', '', 6, 1, '2022-08-04 12:21:08'),
(37, 'Risa confirmed your delivery  #00005', 'home?d=00005', '', 7, 1, '2022-08-04 13:04:28'),
(48, 'Risa confirmed your delivery  #00006', 'home?d=00006', '', 7, 1, '2022-08-04 19:19:40'),
(65, 'Risa confirmed your delivery  #00009', 'home?d=00009', '', 7, 1, '2022-08-08 19:54:00'),
(70, 'flash drives with  #4324  as serial number need to be replaced', 'status?d=10&nm=flash drives', '', 7, 1, '2022-08-08 20:08:19'),
(77, 'New tender from risa #00011', '{home?d=00011}', 'SUP_ADMIN', 2, 1, '2022-08-08 21:21:27'),
(78, 'New tender from risa #00011', '{home?d=00011}', 'SUP_ADMIN', 3, 1, '2022-08-08 21:21:27'),
(79, 'New tender from risa #00011', '{home?d=00011}', 'SUP_ADMIN', 5, 1, '2022-08-08 21:21:27'),
(80, 'New tender from risa #00011', '{home?d=00011}', 'SUP_ADMIN', 6, 1, '2022-08-08 21:21:27'),
(82, 'New tender from risa #00011', 'home?d=00011', 'SUP_ADMIN', 2, 1, '2022-08-08 21:31:05'),
(83, 'New tender from risa #00011', 'home?d=00011', 'SUP_ADMIN', 3, 1, '2022-08-08 21:31:05'),
(84, 'New tender from risa #00011', 'home?d=00011', 'SUP_ADMIN', 5, 1, '2022-08-08 21:31:05'),
(89, 'New tender from risa #00012', 'home?d=00012', 'SUP_ADMIN', 2, 1, '2022-08-09 09:22:40'),
(90, 'New tender from risa #00012', 'home?d=00012', 'SUP_ADMIN', 3, 1, '2022-08-09 09:22:40'),
(101, 'New tender from risa #00013', 'home?d=00013', 'SUP_ADMIN', 2, 1, '2022-08-09 09:30:38'),
(102, 'New tender from risa #00013', 'home?d=00013', 'SUP_ADMIN', 3, 1, '2022-08-09 09:30:38'),
(116, 'New tender from risa #00014', 'home?d=00014', 'SUP_ADMIN', 2, 1, '2022-08-09 09:40:39'),
(117, 'New tender from risa #00014', 'home?d=00014', 'SUP_ADMIN', 3, 1, '2022-08-09 09:40:39'),
(134, 'New tender from risa #00015', 'home?d=00015', 'SUP_ADMIN', 2, 1, '2022-08-10 17:29:14'),
(135, 'New tender from risa #00015', 'home?d=00015', 'SUP_ADMIN', 3, 1, '2022-08-10 17:29:14'),
(142, 'New tender from risa #00016', 'home?d=00016', 'SUP_ADMIN', 2, 1, '2022-08-12 10:40:16'),
(143, 'New tender from risa #00016', 'home?d=00016', 'SUP_ADMIN', 3, 1, '2022-08-12 10:40:16'),
(144, 'New tender from risa #00016', 'home?d=00016', 'SUP_ADMIN', 5, 1, '2022-08-12 10:40:16'),
(149, 'New tender from risa #00017', 'home?d=00017', 'SUP_ADMIN', 2, 1, '2022-08-18 18:23:51'),
(150, 'New tender from risa #00017', 'home?d=00017', 'SUP_ADMIN', 3, 1, '2022-08-18 18:23:51'),
(151, 'New tender from risa #00017', 'home?d=00017', 'SUP_ADMIN', 5, 1, '2022-08-18 18:23:51'),
(160, 'New tender from risa #00020', 'home?d=00020', 'SUP_ADMIN', 2, 1, '2022-08-31 22:22:00'),
(161, 'New tender from risa #00020', 'home?d=00020', 'SUP_ADMIN', 3, 1, '2022-08-31 22:22:00'),
(162, 'New tender from risa #00020', 'home?d=00020', 'SUP_ADMIN', 5, 1, '2022-08-31 22:22:00'),
(169, 'The institition send your requested computing devices please check and approve #00013', 'requested?c=00013&cf=QVRkR0R4Q01yMVBRcTlJdjljSDc1QT09', 'BEN_ADMIN', 0, 21, '2022-08-31 22:33:34'),
(172, 'New tender from risa #00021', 'home?d=00021', 'SUP_ADMIN', 2, 1, '2022-08-31 22:39:32'),
(173, 'New tender from risa #00021', 'home?d=00021', 'SUP_ADMIN', 3, 1, '2022-08-31 22:39:32'),
(174, 'New tender from risa #00021', 'home?d=00021', 'SUP_ADMIN', 5, 1, '2022-08-31 22:39:32'),
(175, 'New tender from risa #00021', 'home?d=00021', 'SUP_ADMIN', 6, 1, '2022-08-31 22:39:32'),
(194, 'New tender from risa #00022', 'home?d=00022', 'SUP_ADMIN', 2, 1, '2022-09-01 12:05:58'),
(195, 'New tender from risa #00022', 'home?d=00022', 'SUP_ADMIN', 3, 1, '2022-09-01 12:05:58'),
(196, 'New tender from risa #00022', 'home?d=00022', 'SUP_ADMIN', 5, 1, '2022-09-01 12:05:58'),
(198, 'New tender from risa #00022', 'home?d=00022', 'SUP_ADMIN', 7, 1, '2022-09-01 12:05:58');

-- --------------------------------------------------------

--
-- Table structure for table `supplied_devices`
--

DROP TABLE IF EXISTS `supplied_devices`;
CREATE TABLE IF NOT EXISTS `supplied_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(100) NOT NULL,
  `guarantee` int(3) NOT NULL,
  `serial_number` varchar(50) NOT NULL,
  `status` enum('functional','nonfunctional','lost','maintenance','replaced') NOT NULL DEFAULT 'functional',
  `device_id` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `request_code` varchar(6) NOT NULL,
  `comment` tinytext NOT NULL,
  `end_guarantee` date DEFAULT NULL,
  `has_reported` enum('yes','no') NOT NULL DEFAULT 'no',
  `c_flow` enum('benToInst','instToAdmin','instToReject','benToConfirm','instToBen','none','adminToInst','adminToSup','supToAdmin','supToConfirm') NOT NULL DEFAULT 'none',
  `has_replaced` enum('yes','no') NOT NULL DEFAULT 'no',
  `status_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_code` (`request_code`),
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplied_devices`
--

INSERT INTO `supplied_devices` (`id`, `manufacturer`, `guarantee`, `serial_number`, `status`, `device_id`, `created_at`, `updated_at`, `request_code`, `comment`, `end_guarantee`, `has_reported`, `c_flow`, `has_replaced`, `status_date`) VALUES
(1, 'HP', 6, '23324', 'functional', 2, '2022-08-04 11:50:13', '2022-08-04 12:29:25', '00002', 'Keyboard malfunctioning<p>#old serial number:345</p>', '2023-02-04', 'yes', 'instToBen', 'yes', '2022-08-04'),
(2, 'HP', 6, '543', 'functional', 2, '2022-08-04 11:50:13', '2022-08-04 11:50:13', '00002', '', '2023-02-04', 'no', 'none', 'no', '2023-02-04'),
(3, 'POSITIVO BGH', 4, '456543', 'functional', 3, '2022-08-04 12:23:19', '2022-08-04 12:23:19', '00003', '', '2022-12-04', 'no', 'none', 'no', '2022-12-04'),
(4, 'POSITIVO BGH', 4, '567654', 'functional', 3, '2022-08-04 12:23:19', '2022-08-04 12:23:19', '00003', '', '2022-12-04', 'no', 'none', 'no', '2022-12-04'),
(5, 'POSITIVO BGH', 6, '233', 'functional', 5, '2022-08-04 13:05:06', '2022-08-04 13:05:06', '00005', '', '2023-02-04', 'no', 'none', 'no', '2023-02-04'),
(6, 'POSITIVO BGH', 6, '444', 'functional', 5, '2022-08-04 13:05:06', '2022-08-04 13:05:06', '00005', '', '2023-02-04', 'no', 'none', 'no', '2023-02-04'),
(7, 'POSITIVO BGH', 6, '6666', 'functional', 5, '2022-08-04 13:05:06', '2022-08-04 13:05:06', '00005', '', '2023-02-04', 'no', 'none', 'no', '2023-02-04'),
(8, 'POSITIVO BGH', 6, '44', 'nonfunctional', 6, '2022-08-04 19:20:24', '2022-08-04 19:24:07', '00006', 'malfunctional', '2023-02-04', 'no', 'benToInst', 'no', '2023-02-04'),
(9, 'POSITIVO BGH', 6, '73873845', 'nonfunctional', 6, '2022-08-04 19:20:24', '2022-08-04 20:22:28', '00006', 'screen not seen<p>#old serial number:r4544</p>', '2023-02-04', 'yes', 'adminToInst', 'yes', '2022-08-04'),
(10, 'scann', 13, '472383748234', 'functional', 9, '2022-08-08 19:54:27', '2022-08-08 20:17:24', '00009', 'for shorting storage<p>#old serial number:4324</p>', '2023-09-08', 'yes', 'instToBen', 'yes', '2022-08-08'),
(11, 'scann', 13, '12-323', 'functional', 9, '2022-08-08 19:54:27', '2022-08-08 19:54:27', '00009', '', '2023-09-08', 'no', 'none', 'no', '2023-09-08'),
(12, 'HP', 10, '8888', 'functional', 12, '2022-08-09 09:26:52', '2022-08-09 09:34:59', '00012', 'not functional<p>#old serial number:4444344-B</p>', '2023-06-09', 'yes', 'instToBen', 'yes', '2022-08-09'),
(13, 'POSITIVO BGH', 7, '999', 'maintenance', 14, '2022-08-09 09:47:26', '2022-08-09 09:52:58', '00014', 'malfunctioning<br/>please make sure lenses are replaced', '2023-03-09', 'no', 'instToReject', 'no', '2023-03-09'),
(14, 'ACER', 6, '333TB', 'functional', 13, '2022-08-31 22:32:58', '2022-08-31 22:32:58', '00013', '', '2023-03-03', 'no', 'none', 'no', '2023-03-03'),
(15, 'POSITIVO BGH', 7, '8888', 'functional', 21, '2022-08-31 22:42:29', '2022-08-31 22:49:38', '00021', 'malfunctioning<p>#old serial number:55-TB</p>', '2023-03-31', 'yes', 'instToBen', 'yes', '2022-08-31');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_application`
--

DROP TABLE IF EXISTS `supplier_application`;
CREATE TABLE IF NOT EXISTS `supplier_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_code` varchar(6) NOT NULL,
  `sup_id` int(3) NOT NULL,
  `guarante` varchar(10) NOT NULL,
  `price` varchar(10) NOT NULL,
  `special_offer` varchar(200) NOT NULL,
  `delivery_time` date DEFAULT NULL,
  `has_sent` enum('yes','no') NOT NULL DEFAULT 'no',
  `winner_id` int(3) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sup_id` (`sup_id`),
  KEY `request_code` (`request_code`),
  KEY `winner_id` (`winner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_application`
--

INSERT INTO `supplier_application` (`id`, `request_code`, `sup_id`, `guarante`, `price`, `special_offer`, `delivery_time`, `has_sent`, `winner_id`, `created_at`, `updated_at`) VALUES
(1, '00001', 5, '6', '450000', 'No Installation payment', '2022-08-07', 'yes', 5, '2022-08-04 09:47:12', '2022-08-04 11:50:57'),
(2, '00002', 5, '12', '550000', 'Free delivery', '2022-08-11', 'yes', 5, '2022-08-04 11:08:17', '2022-08-04 11:47:58'),
(3, '00003', 6, '6', '200000', 'Free Delivery', '2022-08-09', 'no', 6, '2022-08-04 12:07:12', '2022-08-04 12:20:55'),
(4, '00003', 7, '6', '73000', 'Free delivery', '2022-08-08', 'no', 6, '2022-08-04 12:14:30', '2022-08-04 12:20:55'),
(5, '00005', 5, '9', '73000', 'free delivery', '2022-08-09', 'no', 7, '2022-08-04 12:57:32', '2022-08-04 13:04:14'),
(6, '00005', 6, '6', '20000', 'free delivery', '2022-08-12', 'no', 7, '2022-08-04 12:59:20', '2022-08-04 13:04:14'),
(7, '00005', 7, '6', '73000', 'Free delivery', '2022-08-16', 'no', 7, '2022-08-04 13:00:33', '2022-08-04 13:04:14'),
(8, '00004', 7, '6', '450000', 'free installation', '2022-08-10', 'no', 0, '2022-08-04 13:18:05', '2022-08-04 13:18:05'),
(9, '00006', 7, '6', '450000', 'free installation', '2022-08-10', 'yes', 7, '2022-08-04 13:18:15', '2022-08-04 19:13:22'),
(10, '00007', 7, '8', '2000', 'vvvvv', '2022-08-10', 'no', 0, '2022-08-04 21:15:37', '2022-08-04 21:15:37'),
(11, '00009', 7, '12', '50000', 'transport', '2022-08-10', 'yes', 7, '2022-08-08 19:52:12', '2022-08-08 19:52:39'),
(12, '00012', 7, '10', '450000', 'free delivery', '2022-08-16', 'yes', 7, '2022-08-09 09:23:45', '2022-08-09 09:24:35'),
(13, '00014', 6, '8', '5445', '', '2022-08-15', 'yes', 6, '2022-08-09 09:42:30', '2022-08-09 09:46:12'),
(14, '00014', 7, '4', '555555', 'trttrtrtrrtrt', '2022-08-14', 'yes', 6, '2022-08-09 09:43:20', '2022-08-09 09:46:12'),
(15, '00013', 5, '2', '2000', '', '2022-08-14', 'no', 7, '2022-08-10 17:31:59', '2022-08-31 22:31:08'),
(17, '00015', 6, '6', '300000', 'free delivery', '2022-08-22', 'no', 0, '2022-08-19 12:16:40', '2022-08-19 12:16:40'),
(18, '00013', 7, '9', '33', 'rrrrr', '2022-09-06', 'no', 7, '2022-08-31 22:29:35', '2022-08-31 22:31:08'),
(19, '00021', 7, '3', '56969', 'Free delivery', '2022-09-07', 'yes', 7, '2022-08-31 22:40:02', '2022-08-31 22:41:04'),
(20, '00022', 6, '6', '500000', 'free delivery', '2022-09-04', 'no', 0, '2022-09-01 12:07:08', '2022-09-01 12:07:08');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `a_internaship_periode`
--
ALTER TABLE `a_internaship_periode`
  ADD CONSTRAINT `a_internaship_periode_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `a_users` (`id`);

--
-- Constraints for table `a_partner_student_request`
--
ALTER TABLE `a_partner_student_request`
  ADD CONSTRAINT `a_partner_student_request_ibfk_1` FOREIGN KEY (`internaship_id`) REFERENCES `a_internaship_periode` (`id`),
  ADD CONSTRAINT `a_partner_student_request_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `a_partner_tb` (`id`);

--
-- Constraints for table `a_student_tb`
--
ALTER TABLE `a_student_tb`
  ADD CONSTRAINT `a_student_tb_ibfk_1` FOREIGN KEY (`internaship_periode_id`) REFERENCES `a_internaship_periode` (`id`),
  ADD CONSTRAINT `a_student_tb_ibfk_3` FOREIGN KEY (`suppervisior_id`) REFERENCES `a_suppervisior_tb` (`id`),
  ADD CONSTRAINT `a_student_tb_ibfk_4` FOREIGN KEY (`partner_id`) REFERENCES `a_partner_tb` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `supplied_devices`
--
ALTER TABLE `supplied_devices`
  ADD CONSTRAINT `supplied_devices_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
