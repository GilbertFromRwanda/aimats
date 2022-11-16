-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 16, 2022 at 12:49 PM
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
-- Table structure for table `a_internaship_periode`
--

DROP TABLE IF EXISTS `a_internaship_periode`;
CREATE TABLE IF NOT EXISTS `a_internaship_periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_student` int(11) NOT NULL DEFAULT 0,
  `taken_student` int(11) NOT NULL DEFAULT 0,
  `upload_grade` enum('no','yes') NOT NULL DEFAULT 'no',
  `status` enum('activated','deactivated') NOT NULL DEFAULT 'deactivated',
  `user_id` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_internaship_periode`
--



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
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `internaship_id` (`internaship_id`),
  KEY `partner_id` (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_partner_student_request`
--



-- --------------------------------------------------------

--
-- Table structure for table `a_partner_student_request_totals`
--

DROP TABLE IF EXISTS `a_partner_student_request_totals`;
CREATE TABLE IF NOT EXISTS `a_partner_student_request_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(5) NOT NULL,
  `internaship_id` int(6) NOT NULL,
  `requested_student` int(3) NOT NULL DEFAULT 0,
  `given_student` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `internaship_id` (`internaship_id`),
  KEY `partiner_id` (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_partner_student_request_totals`
--



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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_partner_tb`
--



-- --------------------------------------------------------

--
-- Table structure for table `a_student_grade`
--

DROP TABLE IF EXISTS `a_student_grade`;
CREATE TABLE IF NOT EXISTS `a_student_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_criteria` text NOT NULL,
  `marks` int(2) NOT NULL,
  `attachment` varchar(200) NOT NULL,
  `student_id` varchar(7) NOT NULL,
  `partner_id` int(6) NOT NULL,
  `supervisior_id` int(6) NOT NULL,
  `internaship_id` int(6) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `partner_id` (`partner_id`),
  KEY `supervisior_id` (`supervisior_id`),
  KEY `internaship_id` (`internaship_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_student_grade`
--


-- --------------------------------------------------------

--
-- Table structure for table `a_student_logbook`
--

DROP TABLE IF EXISTS `a_student_logbook`;
CREATE TABLE IF NOT EXISTS `a_student_logbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `used_tools` varchar(200) DEFAULT NULL,
  `screenshoots` varchar(200) NOT NULL DEFAULT '-',
  `objective` varchar(200) NOT NULL,
  `challenges` varchar(250) DEFAULT NULL,
  `student_id` int(6) NOT NULL,
  `suppervisor_id` int(6) NOT NULL,
  `internaship_id` int(6) NOT NULL,
  `partner_id` int(6) NOT NULL,
  `partner_comment` varchar(200) NOT NULL DEFAULT '-',
  `suppervisior_comment` varchar(200) NOT NULL DEFAULT '-',
  `log_date` date NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `partner_id` (`partner_id`),
  KEY `suppervisor_id` (`suppervisor_id`),
  KEY `internaship_id` (`internaship_id`),
  KEY `log_date` (`log_date`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_student_logbook`
--


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
  KEY `partner_id` (`partner_id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_student_tb`
--


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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_suppervisior_tb`
--



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
  `level` enum('ADMIN','PARTNER','STUDENT','SUPERVISIOR','USER') NOT NULL DEFAULT 'USER',
  `institition_id` varchar(5) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `a_ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_indx` (`username`),
  KEY `username` (`username`),
  KEY `institition_id` (`institition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_users`
--

INSERT INTO `a_users` (`id`, `names`, `username`, `phone`, `secret`, `level`, `institition_id`, `status`, `updated_at`, `a_ip`) VALUES
(1, 'john', 'auca', NULL, '$2y$10$yCJUqcquW6HUZAMgufO5xOmDSX8xTwVmaDcRoxLdnC6V8B/Z77TIq', 'ADMIN', '1', 'active', '2022-11-16 14:07:49', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_tb`
--

DROP TABLE IF EXISTS `notifications_tb`;
CREATE TABLE IF NOT EXISTS `notifications_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `level` enum('ADMIN','PARTNER','STUDENT','SUPERVISIOR') NOT NULL,
  `level_id` int(3) NOT NULL,
  `done_by` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `level_id` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications_tb`
--

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
-- Constraints for table `a_partner_student_request_totals`
--
ALTER TABLE `a_partner_student_request_totals`
  ADD CONSTRAINT `a_partner_student_request_totals_ibfk_1` FOREIGN KEY (`internaship_id`) REFERENCES `a_internaship_periode` (`id`),
  ADD CONSTRAINT `a_partner_student_request_totals_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `a_partner_tb` (`id`);

--
-- Constraints for table `a_student_grade`
--
ALTER TABLE `a_student_grade`
  ADD CONSTRAINT `a_student_grade_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `a_partner_tb` (`id`),
  ADD CONSTRAINT `a_student_grade_ibfk_2` FOREIGN KEY (`supervisior_id`) REFERENCES `a_suppervisior_tb` (`id`),
  ADD CONSTRAINT `a_student_grade_ibfk_3` FOREIGN KEY (`internaship_id`) REFERENCES `a_internaship_periode` (`id`);

--
-- Constraints for table `a_student_logbook`
--
ALTER TABLE `a_student_logbook`
  ADD CONSTRAINT `a_student_logbook_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `a_partner_tb` (`id`),
  ADD CONSTRAINT `a_student_logbook_ibfk_2` FOREIGN KEY (`suppervisor_id`) REFERENCES `a_suppervisior_tb` (`id`),
  ADD CONSTRAINT `a_student_logbook_ibfk_3` FOREIGN KEY (`internaship_id`) REFERENCES `a_internaship_periode` (`id`);

--
-- Constraints for table `a_student_tb`
--
ALTER TABLE `a_student_tb`
  ADD CONSTRAINT `a_student_tb_ibfk_1` FOREIGN KEY (`internaship_periode_id`) REFERENCES `a_internaship_periode` (`id`),
  ADD CONSTRAINT `a_student_tb_ibfk_3` FOREIGN KEY (`suppervisior_id`) REFERENCES `a_suppervisior_tb` (`id`),
  ADD CONSTRAINT `a_student_tb_ibfk_4` FOREIGN KEY (`partner_id`) REFERENCES `a_partner_tb` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
