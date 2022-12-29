-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 03:10 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aimats_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `a_internaship_periode`
--

CREATE TABLE `a_internaship_periode` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_student` int(11) NOT NULL DEFAULT 0,
  `taken_student` int(11) NOT NULL DEFAULT 0,
  `upload_grade` enum('no','yes') NOT NULL DEFAULT 'no',
  `status` enum('activated','deactivated') NOT NULL DEFAULT 'deactivated',
  `user_id` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_internaship_periode`
--

INSERT INTO `a_internaship_periode` (`id`, `start_date`, `end_date`, `total_student`, `taken_student`, `upload_grade`, `status`, `user_id`) VALUES
(1, '2022-11-16', '2022-12-31', 10, 0, 'no', 'activated', 1),
(2, '2022-12-14', '2023-01-28', 0, 0, 'no', 'deactivated', 1);

-- --------------------------------------------------------

--
-- Table structure for table `a_partner_student_request`
--

CREATE TABLE `a_partner_student_request` (
  `id` int(11) NOT NULL,
  `request_student_number` int(3) NOT NULL,
  `major_in` varchar(100) NOT NULL,
  `partner_id` int(5) NOT NULL,
  `internaship_id` int(3) NOT NULL,
  `given_student_number` int(3) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_partner_student_request`
--

INSERT INTO `a_partner_student_request` (`id`, `request_student_number`, `major_in`, `partner_id`, `internaship_id`, `given_student_number`, `created_at`) VALUES
(21, 1, 'Software Engineering', 20, 1, 1, '2022-12-14');

-- --------------------------------------------------------

--
-- Table structure for table `a_partner_student_request_totals`
--

CREATE TABLE `a_partner_student_request_totals` (
  `id` int(11) NOT NULL,
  `partner_id` int(5) NOT NULL,
  `internaship_id` int(6) NOT NULL,
  `requested_student` int(3) NOT NULL DEFAULT 0,
  `given_student` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_partner_student_request_totals`
--

INSERT INTO `a_partner_student_request_totals` (`id`, `partner_id`, `internaship_id`, `requested_student`, `given_student`) VALUES
(19, 20, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `a_partner_tb`
--

CREATE TABLE `a_partner_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `tin` varchar(9) NOT NULL,
  `place` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `c_profile` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_partner_tb`
--

INSERT INTO `a_partner_tb` (`id`, `name`, `phone`, `tin`, `place`, `email`, `is_active`, `c_profile`, `created_at`, `user_id`) VALUES
(16, 'MTN RWANDA', '0789329423', '324423421', 'kigali', 'mtn@gmail.com', 'yes', 'mtn is network company ', '2022-12-14 04:09:52', 1),
(17, 'RWANDA tel', '0723472364', '452934884', 'kigali', 'ki@gmail.com', 'yes', 'RWanda tel is best ver', '2022-12-14 04:33:06', 1),
(18, 'Igihe ltd', '0789994324', '085324958', 'kigali', 'igihe@gmail.com', 'yes', 'igihe is broadasc', '2022-12-14 04:38:31', 1),
(19, 'Umuseke', '0784238482', '239482394', 'kigali', 'umuseke@gmail.com', 'yes', 'bwetwte', '2022-12-14 04:41:07', 1),
(20, 'Kaneza tech', '0782384234', '0', 'kigali-kimironko', 'kanze@gmail.com', 'yes', NULL, '2022-12-14 04:44:44', 0),
(21, 'AIRTEL.RW', '0723456789', '12343456', 'kigali', 'Airtel@gmail.com', 'yes', 'airtel.rw', '2022-12-14 05:13:59', 1),
(22, 'RDB', '0788123452', '0', 'kigali-rwanda', 'rdb12@gmail.com', 'no', NULL, '2022-12-14 21:00:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `a_student_grade`
--

CREATE TABLE `a_student_grade` (
  `id` int(11) NOT NULL,
  `evaluation_criteria` text NOT NULL,
  `marks` int(2) NOT NULL,
  `s_marks` int(2) DEFAULT NULL,
  `attachment` varchar(200) NOT NULL,
  `student_id` varchar(7) NOT NULL,
  `partner_id` int(6) NOT NULL,
  `supervisior_id` int(6) NOT NULL,
  `internaship_id` int(6) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `a_student_logbook`
--

CREATE TABLE `a_student_logbook` (
  `id` int(11) NOT NULL,
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
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `a_student_tb`
--

CREATE TABLE `a_student_tb` (
  `id` int(11) NOT NULL,
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
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_student_tb`
--

INSERT INTO `a_student_tb` (`id`, `first_name`, `last_name`, `email`, `phone`, `gender`, `major_in`, `card_id`, `internaship_periode_id`, `partner_id`, `suppervisior_id`, `created_at`, `updated_at`) VALUES
(30, 'Braden', 'Schroeder', 'santos.lowe@gmail.com', '+9194651261956', 'male', 'Finance', 18064, 1, NULL, NULL, '2022-11-16 06:19:21', '2022-11-16 06:19:21'),
(31, 'Fern', 'Blanda', 'johnson.jaren@skiles.com', '+5173576788310', 'male', 'Software Engineering', 17370, 1, 20, 20, '2022-11-16 06:19:21', '2022-12-14 05:25:15'),
(32, 'Jevon', 'Lowe', 'bechtelar.gretchen@gmail.com', '+5082351399297', 'male', 'Information Management', 18548, 1, NULL, 21, '2022-11-16 06:19:21', '2022-12-14 05:26:16'),
(33, 'Brenna', 'Rempel', 'mcartwright@hammes.com', '+6546251132206', 'female', 'Software Engineering', 19082, 1, NULL, NULL, '2022-11-16 06:19:22', '2022-11-16 06:19:22'),
(34, 'Cesar', 'Hayes', 'dillon49@ferry.info', '+3679831274637', 'male', 'Marketing', 18294, 1, NULL, NULL, '2022-11-16 06:19:22', '2022-11-16 06:19:22'),
(35, 'Gerry', 'Goodwin', 'fritsch.ora@stehr.com', '+6151731056284', 'female', 'Software Engineering', 17741, 1, NULL, NULL, '2022-11-16 06:19:22', '2022-11-16 06:19:22'),
(36, 'Nyasia', 'Ullrich', 'lynn.will@gmail.com', '+2799949129914', 'female', 'Health Sciences', 19037, 1, NULL, NULL, '2022-11-16 06:19:22', '2022-11-16 06:19:22'),
(37, 'Jordon', 'Daniel', 'nwaelchi@yahoo.com', '+4452307222008', 'male', 'Network and communication Systems', 20427, 1, NULL, NULL, '2022-11-16 06:19:23', '2022-11-16 06:19:23'),
(38, 'Alvera', 'Keebler', 'brendon.flatley@beahan.net', '+8893712759459', 'female', 'Information Management', 17198, 1, NULL, NULL, '2022-11-16 06:19:23', '2022-11-16 06:19:23'),
(39, 'Daniella', 'Klocko', 'eric.brakus@hotmail.com', '+6560524024504', 'female', 'Accounting', 19708, 1, NULL, NULL, '2022-11-16 06:19:23', '2022-11-16 06:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `a_suppervisior_tb`
--

CREATE TABLE `a_suppervisior_tb` (
  `id` int(11) NOT NULL,
  `names` varchar(200) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `department` enum('IT','BUSSINESS','THEOLOGY','HEALTH SCIENCE') NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_suppervisior_tb`
--

INSERT INTO `a_suppervisior_tb` (`id`, `names`, `gender`, `department`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(19, 'Mugabo Ganza', 'male', 'IT', 'ganza@gmail.com', '0732472634', 'active', '2022-12-14 04:11:03', '2022-12-14 04:11:03'),
(20, 'prince', 'male', 'IT', 'prince@gmail.com', '0788845689', 'active', '2022-12-14 05:09:02', '2022-12-14 05:09:02'),
(21, 'genifa', 'female', 'IT', 'genifa@gmail.com', '0782345677', 'active', '2022-12-14 05:10:45', '2022-12-14 05:10:45');

-- --------------------------------------------------------

--
-- Table structure for table `a_users`
--

CREATE TABLE `a_users` (
  `id` bigint(20) NOT NULL,
  `names` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `secret` varchar(150) NOT NULL,
  `level` enum('ADMIN','PARTNER','STUDENT','SUPERVISIOR','USER') NOT NULL DEFAULT 'USER',
  `institition_id` varchar(5) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `a_ip` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_users`
--

INSERT INTO `a_users` (`id`, `names`, `username`, `phone`, `secret`, `level`, `institition_id`, `status`, `updated_at`, `a_ip`) VALUES
(1, 'john', 'auca', NULL, '$2y$10$yCJUqcquW6HUZAMgufO5xOmDSX8xTwVmaDcRoxLdnC6V8B/Z77TIq', 'ADMIN', '1', 'active', '2022-12-21 15:40:44', '::1'),
(45, 'Braden Schroeder', '18064', '+9194651261956', '$2y$10$P/hButk/KoNHzzF/GL0qIeX50rpjsTcU/SUb7tw4BH18GJ0Plj0cu', 'STUDENT', '0', 'active', '2022-12-14 14:54:55', '::1'),
(46, 'Fern Blanda', '17370', '+5173576788310', '$2y$10$cHBRMbRM34K8DGptq98mQu3ddW25ljkhNLzFvFEK7JSL4QWz7xOHa', 'STUDENT', '0', 'active', '2022-11-16 06:19:21', NULL),
(47, 'Jevon Lowe', '18548', '+5082351399297', '$2y$10$N.BJpb118vn2VlxnOfTCAuLrnWiDQzuioledUUN2q2CdfUp4.Caje', 'STUDENT', '0', 'active', '2022-11-16 06:19:22', NULL),
(48, 'Brenna Rempel', '19082', '+6546251132206', '$2y$10$lF3j6VTnsr/wpEYkWQGUzOZWOnnazjPTgPePtj6bCpjHMyaXr0yze', 'STUDENT', '0', 'active', '2022-11-16 06:19:22', NULL),
(49, 'Cesar Hayes', '18294', '+3679831274637', '$2y$10$Wr.VbCygwqrAuH8VYMORPu8sulRkVTQJEpvTvYwyj6dLPmKQISLLu', 'STUDENT', '0', 'active', '2022-11-16 06:19:22', NULL),
(50, 'Gerry Goodwin', '17741', '+6151731056284', '$2y$10$Ayb9GHN45FvPOKS4ldbsnewbXc/r3htXON9GB6A4scX1lNJIMrdL.', 'STUDENT', '0', 'active', '2022-11-16 06:19:22', NULL),
(51, 'Nyasia Ullrich', '19037', '+2799949129914', '$2y$10$bPOVS9VNALKHx4vgUPS16OArqYxE4FTOH/fJnDi.ue4efkH7UTiZS', 'STUDENT', '0', 'active', '2022-11-16 06:19:23', NULL),
(52, 'Jordon Daniel', '20427', '+4452307222008', '$2y$10$iwI/NIYKoxn7l3FpuPUSEuVagyVKBcAfmWKZbZSv5Yd1cjul5Tvk2', 'STUDENT', '0', 'active', '2022-11-16 06:19:23', NULL),
(53, 'Alvera Keebler', '17198', '+8893712759459', '$2y$10$ATI5lwkO7/Ey2VnPzmIJSOtlGKUgF/Gqnh.j/kOvDKUpb0w.xlpqC', 'STUDENT', '0', 'active', '2022-11-16 06:19:23', NULL),
(54, 'Daniella Klocko', '19708', '+6560524024504', '$2y$10$Yc65Z9ks8iNYlFqFdTIg/eqC4pPHNXi/IfDq0y/x5PmggSdZSnTAm', 'STUDENT', '0', 'active', '2022-11-16 06:19:23', NULL),
(55, 'MTN RWANDA', 'mtn', '0789329423', '$2y$10$RFwvrxHRD9s5Kxp0H6.STupaRIPQYlBVbi1mNGEPe6aUkZkEHIW0i', 'PARTNER', '16', 'active', '2022-12-14 14:31:24', '::1'),
(56, 'Mugabo Ganza', 'sup', '0732472634', '$2y$10$kQetpxVAXczbbIIKPSgKZO8TO.yLrExPHFDiG6NWfp633BnJePJUS', 'SUPERVISIOR', '19', 'active', '2022-12-29 16:08:40', '::1'),
(57, 'RWANDA tel', 'rtel', '0723472364', '$2y$10$xxmGsYoS0b4LEopUxl3w2Oe4rrC1OZSEvgwUrSRffIKJiB6hGRgQW', 'PARTNER', '17', 'active', '2022-12-14 14:33:36', '::1'),
(58, 'Igihe ltd', 'igihe', '0789994324', '$2y$10$8vrEjXwSj6ord3qWkb5mDOotBuNXOrlbFddce.Dxp2HNKfGqTRgwW', 'PARTNER', '18', 'active', '2022-12-14 04:38:32', NULL),
(59, 'Umuseke', 'umuseke', '0784238482', '$2y$10$meIVw6MTOLIkcPO.XRjOSO7PQjbdMc2cE4M5GL6WxWoE8nlFdoNXe', 'PARTNER', '19', 'active', '2022-12-14 04:41:07', NULL),
(60, 'kaneza', 'kaneza', '0782384234', '$2y$10$i2kGocO3miq/QIkC.h.hXuhxhZz/JU1cnnp4XUWDM5p.EWwCksuxy', 'PARTNER', '20', 'active', '2022-12-14 14:50:25', '::1'),
(61, 'prince', 'prince', '0788845689', '$2y$10$y5r/aaiq3qYQ7YL7SmEDneKTYY5bLGV18KxmMMs0pCRR1G8TimWiq', 'SUPERVISIOR', '20', 'active', '2022-12-14 05:09:02', NULL),
(62, 'genifa', 'genifa', '0782345677', '$2y$10$eZOwImMZJx6q3/VD8AZeL.MpJ.tAWTxTg7owLSyXVd.llySONnKXy', 'SUPERVISIOR', '21', 'active', '2022-12-14 21:01:12', '::1'),
(63, 'AIRTEL.RW', 'airtel', '0723456789', '$2y$10$5azRbtAVkb3HG/fyODXQ5epPv8A1zP8uWprP6BzuWJTK4kwOIKpMi', 'PARTNER', '21', 'active', '2022-12-14 05:13:59', NULL),
(64, 'rdb', 'rdb', '0788123452', '$2y$10$xJ5Rwsq1RMJlDCxMy0RoMuwk.Mv2KGnl45SYxT2Zl2jOd68MZLM0K', 'PARTNER', '22', 'active', '2022-12-14 21:00:13', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_tb`
--

CREATE TABLE `notifications_tb` (
  `id` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `level` enum('ADMIN','PARTNER','STUDENT','SUPERVISIOR') NOT NULL,
  `level_id` int(3) NOT NULL,
  `done_by` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications_tb`
--

INSERT INTO `notifications_tb` (`id`, `message`, `link`, `level`, `level_id`, `done_by`, `created_at`) VALUES
(17, 'Auca internaship(Start:2022-12-14 End:2023-01-28,status:deactivated,upload Marks:no)', 'home', 'PARTNER', 16, 1, '2022-12-14 05:17:08'),
(18, 'Auca internaship(Start:2022-12-14 End:2023-01-28,status:deactivated,upload Marks:no)', 'home', 'PARTNER', 17, 1, '2022-12-14 05:17:08'),
(19, 'Auca internaship(Start:2022-12-14 End:2023-01-28,status:deactivated,upload Marks:no)', 'home', 'PARTNER', 18, 1, '2022-12-14 05:17:08'),
(20, 'Auca internaship(Start:2022-12-14 End:2023-01-28,status:deactivated,upload Marks:no)', 'home', 'PARTNER', 19, 1, '2022-12-14 05:17:08'),
(21, 'Auca internaship(Start:2022-12-14 End:2023-01-28,status:deactivated,upload Marks:no)', 'home', 'PARTNER', 20, 1, '2022-12-14 05:17:08'),
(22, 'Auca internaship(Start:2022-12-14 End:2023-01-28,status:deactivated,upload Marks:no)', 'home', 'PARTNER', 21, 1, '2022-12-14 05:17:09'),
(23, 'New Internaship Student(Blanda Blanda)', 'a_partner_student?st=17370', 'PARTNER', 20, 1, '2022-12-14 05:25:15'),
(24, 'Kaneza tech -&gt; kigali-kimironko as partern AND prince -&gt; IT as supervisior', 'home', 'STUDENT', 17370, 1, '2022-12-14 05:25:15'),
(25, 'New Assigned Student(Blanda Blanda)', 'a_partner_student?st=17370', 'SUPERVISIOR', 20, 1, '2022-12-14 05:25:15'),
(26, 'New Assigned Student(Lowe Lowe)', 'a_partner_student?st=18548', 'SUPERVISIOR', 21, 1, '2022-12-14 05:26:16'),
(27, '- as partern AND genifa -&gt; IT as supervisior', 'home', 'STUDENT', 18548, 1, '2022-12-14 05:26:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_internaship_periode`
--
ALTER TABLE `a_internaship_periode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `a_partner_student_request`
--
ALTER TABLE `a_partner_student_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `internaship_id` (`internaship_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `a_partner_student_request_totals`
--
ALTER TABLE `a_partner_student_request_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `internaship_id` (`internaship_id`),
  ADD KEY `partiner_id` (`partner_id`);

--
-- Indexes for table `a_partner_tb`
--
ALTER TABLE `a_partner_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_student_grade`
--
ALTER TABLE `a_student_grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `supervisior_id` (`supervisior_id`),
  ADD KEY `internaship_id` (`internaship_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `a_student_logbook`
--
ALTER TABLE `a_student_logbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `suppervisor_id` (`suppervisor_id`),
  ADD KEY `internaship_id` (`internaship_id`),
  ADD KEY `log_date` (`log_date`);

--
-- Indexes for table `a_student_tb`
--
ALTER TABLE `a_student_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `internaship_periode_id` (`internaship_periode_id`),
  ADD KEY `suppervisior_id` (`suppervisior_id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `a_suppervisior_tb`
--
ALTER TABLE `a_suppervisior_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_users`
--
ALTER TABLE `a_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_indx` (`username`),
  ADD KEY `username` (`username`),
  ADD KEY `institition_id` (`institition_id`);

--
-- Indexes for table `notifications_tb`
--
ALTER TABLE `notifications_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_internaship_periode`
--
ALTER TABLE `a_internaship_periode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `a_partner_student_request`
--
ALTER TABLE `a_partner_student_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `a_partner_student_request_totals`
--
ALTER TABLE `a_partner_student_request_totals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `a_partner_tb`
--
ALTER TABLE `a_partner_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `a_student_grade`
--
ALTER TABLE `a_student_grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `a_student_logbook`
--
ALTER TABLE `a_student_logbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `a_student_tb`
--
ALTER TABLE `a_student_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `a_suppervisior_tb`
--
ALTER TABLE `a_suppervisior_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `a_users`
--
ALTER TABLE `a_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `notifications_tb`
--
ALTER TABLE `notifications_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
