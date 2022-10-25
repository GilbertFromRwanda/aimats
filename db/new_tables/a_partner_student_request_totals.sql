-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 25, 2022 at 10:41 AM
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
-- Table structure for table `a_partner_student_request_totals`
--

DROP TABLE IF EXISTS `a_partner_student_request_totals`;
CREATE TABLE IF NOT EXISTS `a_partner_student_request_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partiner_id` int(5) NOT NULL,
  `internaship_id` int(6) NOT NULL,
  `requested_student` int(3) NOT NULL DEFAULT 0,
  `given_student` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `internaship_id` (`internaship_id`),
  KEY `partiner_id` (`partiner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `a_partner_student_request_totals`
--
ALTER TABLE `a_partner_student_request_totals`
  ADD CONSTRAINT `a_partner_student_request_totals_ibfk_1` FOREIGN KEY (`internaship_id`) REFERENCES `a_internaship_periode` (`id`),
  ADD CONSTRAINT `a_partner_student_request_totals_ibfk_2` FOREIGN KEY (`partiner_id`) REFERENCES `a_partner_tb` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
