-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 12:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_internaship_periode`
--

INSERT INTO `a_internaship_periode` (`id`, `start_date`, `end_date`, `total_student`, `taken_student`, `upload_grade`, `status`, `user_id`) VALUES
(1, '2023-09-07', '2023-10-22', 17, 0, 'no', 'activated', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_student_tb`
--

INSERT INTO `a_student_tb` (`id`, `first_name`, `last_name`, `email`, `phone`, `gender`, `major_in`, `card_id`, `internaship_periode_id`, `partner_id`, `suppervisior_id`, `created_at`, `updated_at`) VALUES
(1, 'Gregg', 'Nicolas', 'noelia.kovacek@spinka.com', '+6064828186982', 'male', 'Software Engineering', 21430, 1, NULL, NULL, '2023-09-07 12:15:27', '2023-09-07 12:15:27'),
(2, 'Fernando', 'Schumm', 'waelchi.bryana@parker.com', '+2349989527245', 'male', 'Marketing', 19326, 1, NULL, NULL, '2023-09-07 12:15:27', '2023-09-07 12:15:27'),
(3, 'Sherwood', 'Rippin', 'larkin.vallie@hotmail.com', '+9803093543297', 'male', 'Management', 18156, 1, NULL, NULL, '2023-09-07 12:15:27', '2023-09-07 12:15:27'),
(4, 'Sadie', 'Herzog', 'domenic.bruen@price.biz', '+5966934578901', 'female', 'Information Management', 19310, 1, NULL, NULL, '2023-09-07 12:15:27', '2023-09-07 12:15:27'),
(5, 'Mabelle', 'McLaughlin', 'rogahn.danika@schmeler.com', '+9196726471053', 'female', 'theology', 19943, 1, NULL, NULL, '2023-09-07 12:15:27', '2023-09-07 12:15:27'),
(6, 'Araceli', 'Breitenberg', 'wehner.reagan@hotmail.com', '+8573410331717', 'female', 'Management', 21306, 1, NULL, NULL, '2023-09-07 12:15:28', '2023-09-07 12:15:28'),
(7, 'Alyce', 'Haag', 'krystal46@yahoo.com', '+5219475399867', 'female', 'Health Sciences', 19070, 1, NULL, NULL, '2023-09-07 12:15:28', '2023-09-07 12:15:28'),
(8, 'Jerod', 'Keeling', 'bahringer.lexi@yahoo.com', '+6998294616392', 'male', 'Health Sciences', 20386, 1, NULL, NULL, '2023-09-07 12:15:28', '2023-09-07 12:15:28'),
(9, 'Dixie', 'Mitchell', 'swaniawski.carlie@mosciski.net', '+1623156596643', 'female', 'Information Management', 20164, 1, NULL, NULL, '2023-09-07 12:15:28', '2023-09-07 12:15:28'),
(10, 'Adalberto', 'Heathcote', 'mckenzie.laura@terry.com', '+4472306704271', 'male', 'Marketing', 19997, 1, NULL, NULL, '2023-09-07 12:15:28', '2023-09-07 12:15:28'),
(11, 'Scot', 'Veum', 'reichmann@hotmail.com', '+4507107585887', 'male', 'Health Sciences', 20495, 1, NULL, NULL, '2023-09-07 12:15:28', '2023-09-07 12:15:28'),
(12, 'Cleora', 'Schamberger', 'goldner.marcelino@daniel.com', '+1394456810195', 'female', 'Management', 21094, 1, NULL, NULL, '2023-09-07 12:15:29', '2023-09-07 12:15:29'),
(13, 'Dulce', 'Leannon', 'fgleichner@gmail.com', '+3500452913858', 'female', 'Health Sciences', 19340, 1, NULL, NULL, '2023-09-07 12:15:29', '2023-09-07 12:15:29'),
(14, 'Karina', 'Hammes', 'karolann.shanahan@hotmail.com', '+6722676143240', 'female', 'Marketing', 21214, 1, NULL, NULL, '2023-09-07 12:15:29', '2023-09-07 12:15:29'),
(15, 'Ethyl', 'Welch', 'hammes.suzanne@mann.com', '+9803520539828', 'female', 'Management', 20859, 1, NULL, NULL, '2023-09-07 12:15:29', '2023-09-07 12:15:29'),
(16, 'Arvid', 'Reilly', 'tyrese.homenick@dach.biz', '+3267057482237', 'male', 'Information Management', 19588, 1, NULL, NULL, '2023-09-07 12:15:29', '2023-09-07 12:15:29'),
(17, 'Chaya', 'Monahan', 'heidenreich.xander@gmail.com', '+4517683434425', 'female', 'Network and communication Systems', 21911, 1, NULL, NULL, '2023-09-07 12:15:29', '2023-09-07 12:15:29');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_users`
--

INSERT INTO `a_users` (`id`, `names`, `username`, `phone`, `secret`, `level`, `institition_id`, `status`, `updated_at`, `a_ip`) VALUES
(1, 'john', 'iprc', NULL, '$2y$10$yCJUqcquW6HUZAMgufO5xOmDSX8xTwVmaDcRoxLdnC6V8B/Z77TIq', 'ADMIN', '1', 'active', '2023-09-07 12:13:31', '::1'),
(99, 'Gregg Nicolas', '21430', '+6064828186982', '$2y$10$YxEMQgg086xcxX2eJwiqSOADX4nrgL536Ds0RK3BoLgZeeUtTDTnG', 'STUDENT', '0', 'active', '2023-09-07 12:15:27', NULL),
(100, 'Fernando Schumm', '19326', '+2349989527245', '$2y$10$aa1DBDDRyjgqIiExJlpdF.KAegS07WLd1AEijKNddCgg03nTiMaCi', 'STUDENT', '0', 'active', '2023-09-07 12:15:27', NULL),
(101, 'Sherwood Rippin', '18156', '+9803093543297', '$2y$10$IS3sg8S0mJmWcI9gvPO4FuSMyZgTvaN3OI1ucdZz/T6GLjwP1grgy', 'STUDENT', '0', 'active', '2023-09-07 12:15:27', NULL),
(102, 'Sadie Herzog', '19310', '+5966934578901', '$2y$10$B9ksAMU1J/6KTKw5j03u2eMVBi9.hqkzlsuGWSyUp/jnlhOu/D9oW', 'STUDENT', '0', 'active', '2023-09-07 12:15:27', NULL),
(103, 'Mabelle McLaughlin', '19943', '+9196726471053', '$2y$10$7AYIAkgf4OsGfrVU12aJq.RwO57/E72TvgxQPHpDMV2JhpjwolaDG', 'STUDENT', '0', 'active', '2023-09-07 12:15:28', NULL),
(104, 'Araceli Breitenberg', '21306', '+8573410331717', '$2y$10$cb.Z1IC/HH9ynvr0EMYjf.PyoBB9pafJBOxEa8F6j918msML5pg1u', 'STUDENT', '0', 'active', '2023-09-07 12:15:28', NULL),
(105, 'Alyce Haag', '19070', '+5219475399867', '$2y$10$JAr9xHpzasjXyI5VOEkKGOqG/qONfokpvJ8qc/ZeIDP3b5JRAT6Gu', 'STUDENT', '0', 'active', '2023-09-07 12:15:28', NULL),
(106, 'Jerod Keeling', '20386', '+6998294616392', '$2y$10$usg8jjhovxPej/4LMor0suY6oc87mJhAen5.X6stwUUmBQ5I6c1eK', 'STUDENT', '0', 'active', '2023-09-07 12:15:28', NULL),
(107, 'Dixie Mitchell', '20164', '+1623156596643', '$2y$10$HNKzihW0ZUQEpdKuPD.g4Ob.31kBhQMzC/3EADNF7pltfA5MnJOyi', 'STUDENT', '0', 'active', '2023-09-07 12:15:28', NULL),
(108, 'Adalberto Heathcote', '19997', '+4472306704271', '$2y$10$78E0vbjou71kYrDfrLDO3.bOPJsMxvdXqNWS6xuPLyyMvRMXpTvj.', 'STUDENT', '0', 'active', '2023-09-07 12:15:28', NULL),
(109, 'Scot Veum', '20495', '+4507107585887', '$2y$10$WxdeqMniRjl0KIfdaM/Yte7TVOGSj/IA23SeGYVCTPSHk5AZhXkPO', 'STUDENT', '0', 'active', '2023-09-07 12:15:29', NULL),
(110, 'Cleora Schamberger', '21094', '+1394456810195', '$2y$10$1g/ZP1f4nfoJeK8Bi5oLBe9sdkPYHKc4cPaoi1kKvWsHDjTmINUte', 'STUDENT', '0', 'active', '2023-09-07 12:15:29', NULL),
(111, 'Dulce Leannon', '19340', '+3500452913858', '$2y$10$6.QTP7XiN8SV2FEUTvHBHOxZ8Pkzf.LsKfnN0dMjpjfmxt4NdQW9C', 'STUDENT', '0', 'active', '2023-09-07 12:15:29', NULL),
(112, 'Karina Hammes', '21214', '+6722676143240', '$2y$10$2Cky0hkBIaQopTpqUUouQOQn9/2X0PaARmWwnmJZ1Wg0CS0RWlgSa', 'STUDENT', '0', 'active', '2023-09-07 12:15:29', NULL),
(113, 'Ethyl Welch', '20859', '+9803520539828', '$2y$10$uKCb0qwUpqMQQ42si8SjjubANEhzFOlfw7cdcGEKiAUkKhoU69vXC', 'STUDENT', '0', 'active', '2023-09-07 12:15:29', NULL),
(114, 'Arvid Reilly', '19588', '+3267057482237', '$2y$10$R5DZYLHQZOsEwT8.9wAeSOQfuUkmt3VAJNyzyRusCFSlHnUb..0gO', 'STUDENT', '0', 'active', '2023-09-07 12:15:29', NULL),
(115, 'Chaya Monahan', '21911', '+4517683434425', '$2y$10$9AO8KxiCpmz8PPqFBoBc6uS93xvuGX4UICQ9XiZx.DwsELj7noniG', 'STUDENT', '0', 'active', '2023-09-07 12:15:30', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `a_partner_student_request`
--
ALTER TABLE `a_partner_student_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_partner_student_request_totals`
--
ALTER TABLE `a_partner_student_request_totals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_partner_tb`
--
ALTER TABLE `a_partner_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `a_suppervisior_tb`
--
ALTER TABLE `a_suppervisior_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_users`
--
ALTER TABLE `a_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `notifications_tb`
--
ALTER TABLE `notifications_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
