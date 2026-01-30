-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2024 at 04:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ucc`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_groups`
--

CREATE TABLE `blood_groups` (
  `id` int(11) NOT NULL,
  `type` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_groups`
--

INSERT INTO `blood_groups` (`id`, `type`) VALUES
(1, 'A+'),
(2, 'A-'),
(5, 'AB+'),
(6, 'AB-'),
(3, 'B+'),
(4, 'B-'),
(7, 'O+'),
(8, 'O-');

-- --------------------------------------------------------

--
-- Table structure for table `class_times`
--

CREATE TABLE `class_times` (
  `id` int(11) NOT NULL,
  `time_slot` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_times`
--

INSERT INTO `class_times` (`id`, `time_slot`) VALUES
(7, '02:00 PM'),
(8, '02:30 PM'),
(9, '03:00 PM'),
(1, '08:00 AM'),
(2, '09:00 AM'),
(3, '10:30 AM'),
(4, '11:00 AM'),
(5, '11:30 AM'),
(6, '12:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fees` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `fees`) VALUES
(1, 'CCA', 7500.00),
(2, 'AUTO CAD', 8000.00),
(3, 'IT (Information Technology)', 12000.00);

-- --------------------------------------------------------

--
-- Table structure for table `course_durations`
--

CREATE TABLE `course_durations` (
  `id` int(11) NOT NULL,
  `duration_length` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_durations`
--

INSERT INTO `course_durations` (`id`, `duration_length`) VALUES
(1, '1 Month'),
(2, '2 Months'),
(3, '3 Months'),
(4, '4 Months');

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qualifications`
--

INSERT INTO `qualifications` (`id`, `name`) VALUES
(11, 'Bachelor\'s Degree (e.g., BA, BSc, BCom, BBA, BS)'),
(15, 'Certificate'),
(14, 'Diploma'),
(13, 'Doctoral Degree (PhD)'),
(10, 'Inter (HSSC)'),
(12, 'Master\'s Degree (e.g., MA, MSc, MCom, MBA, MS)'),
(9, 'Matric (SSC)'),
(16, 'Under Matric');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'ENROLLED'),
(2, 'FREEZE'),
(3, 'STUCK OFF'),
(4, 'COMPLETED'),
(5, 'CERTIFICATE APPLIED'),
(6, 'CERTIFICATE ISSUED');

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `roll_no` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `id` varchar(20) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `phone_personal` varchar(15) DEFAULT NULL,
  `phone_home` varchar(15) DEFAULT NULL,
  `phone_relatives` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `pic` blob DEFAULT NULL,
  `fingerprint` blob DEFAULT NULL,
  `submitted_fees` decimal(10,2) DEFAULT NULL,
  `discounted_fees` decimal(10,2) DEFAULT NULL,
  `admission_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `blood_group_id` int(11) DEFAULT NULL,
  `qualification_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `class_time_id` int(11) DEFAULT NULL,
  `course_duration_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `RemainingFees` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`roll_no`, `name`, `father_name`, `id`, `gender`, `phone_personal`, `phone_home`, `phone_relatives`, `address`, `email`, `date_of_birth`, `pic`, `fingerprint`, `submitted_fees`, `discounted_fees`, `admission_date`, `blood_group_id`, `qualification_id`, `course_id`, `class_time_id`, `course_duration_id`, `status_id`, `RemainingFees`) VALUES
('24/1', 'Fakhar', 'Abbas', '34401', 'Male', '050112780', '03328003484', '', 'NEAR SHEKAIN MASJID STREET', 'm.alirajput686@gmail.com', '2024-05-10', 0x31383635352e6a7067, '', 5000.00, 1000.00, '2024-05-15 22:21:45', 5, 15, 2, 7, 3, 1, 2000.00),
('24/2', 'lkj', 'lkj', '9878', 'Male', '03328003484', '03328003484', '03322616666', 'NEAR SHEKAIN MASJID STREET', 'm.alirajput686@gmail.com', '2024-05-09', '', '', 7500.00, 0.00, '2024-05-15 22:23:44', 5, 14, 1, 1, 2, 1, 0.00);

--
-- Triggers `student_info`
--
DELIMITER $$
CREATE TRIGGER `generate_roll_no` BEFORE INSERT ON `student_info` FOR EACH ROW BEGIN
    DECLARE last_roll_no INT;
    DECLARE current_year CHAR(2);
    DECLARE new_roll_no VARCHAR(10);
    SET current_year = DATE_FORMAT(CURRENT_DATE(), '%y');
    SELECT MAX(CAST(SUBSTRING_INDEX(roll_no, '/', -1) AS UNSIGNED)) INTO last_roll_no FROM student_info WHERE roll_no LIKE CONCAT(current_year, '/%');
    IF last_roll_no IS NULL THEN
        SET new_roll_no = CONCAT(current_year, '/1');
    ELSE
        SET last_roll_no = last_roll_no + 1;
        SET new_roll_no = CONCAT(current_year, '/', last_roll_no);
    END IF;
    SET NEW.roll_no = new_roll_no;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_groups`
--
ALTER TABLE `blood_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `class_times`
--
ALTER TABLE `class_times`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_slot` (`time_slot`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_durations`
--
ALTER TABLE `course_durations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`roll_no`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_blood_group` (`blood_group_id`),
  ADD KEY `fk_qualification` (`qualification_id`),
  ADD KEY `fk_course` (`course_id`),
  ADD KEY `fk_class_time` (`class_time_id`),
  ADD KEY `fk_course_duration` (`course_duration_id`),
  ADD KEY `fk_status` (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood_groups`
--
ALTER TABLE `blood_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `class_times`
--
ALTER TABLE `class_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_durations`
--
ALTER TABLE `course_durations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_info`
--
ALTER TABLE `student_info`
  ADD CONSTRAINT `fk_blood_group` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`),
  ADD CONSTRAINT `fk_class_time` FOREIGN KEY (`class_time_id`) REFERENCES `class_times` (`id`),
  ADD CONSTRAINT `fk_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `fk_course_duration` FOREIGN KEY (`course_duration_id`) REFERENCES `course_durations` (`id`),
  ADD CONSTRAINT `fk_qualification` FOREIGN KEY (`qualification_id`) REFERENCES `qualifications` (`id`),
  ADD CONSTRAINT `fk_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
