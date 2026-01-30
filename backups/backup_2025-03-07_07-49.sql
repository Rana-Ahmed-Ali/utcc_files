
-- Table structure for table `blood_groups`

CREATE TABLE `blood_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `blood_groups`

INSERT INTO `blood_groups` VALUES ('1', 'A+');
INSERT INTO `blood_groups` VALUES ('2', 'A-');
INSERT INTO `blood_groups` VALUES ('5', 'AB+');
INSERT INTO `blood_groups` VALUES ('6', 'AB-');
INSERT INTO `blood_groups` VALUES ('3', 'B+');
INSERT INTO `blood_groups` VALUES ('4', 'B-');
INSERT INTO `blood_groups` VALUES ('7', 'O+');
INSERT INTO `blood_groups` VALUES ('8', 'O-');


-- Table structure for table `class_times`

CREATE TABLE `class_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_slot` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_slot` (`time_slot`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `class_times`

INSERT INTO `class_times` VALUES ('7', '02:00 PM');
INSERT INTO `class_times` VALUES ('8', '02:30 PM');
INSERT INTO `class_times` VALUES ('9', '03:00 PM');
INSERT INTO `class_times` VALUES ('29', '05:05:00');
INSERT INTO `class_times` VALUES ('1', '08:00 AM');
INSERT INTO `class_times` VALUES ('2', '09:00 AM');
INSERT INTO `class_times` VALUES ('3', '10:30 AM');
INSERT INTO `class_times` VALUES ('4', '11:00 AM');
INSERT INTO `class_times` VALUES ('5', '11:30 AM');
INSERT INTO `class_times` VALUES ('6', '12:00 PM');


-- Table structure for table `course_durations`

CREATE TABLE `course_durations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duration_length` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `course_durations`

INSERT INTO `course_durations` VALUES ('1', '1 Month');
INSERT INTO `course_durations` VALUES ('2', '2 Months');
INSERT INTO `course_durations` VALUES ('3', '3 Months');
INSERT INTO `course_durations` VALUES ('4', '4 Months');


-- Table structure for table `courses`

CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `courses`

INSERT INTO `courses` VALUES ('1', 'CCA', '7500.00', 'uploads/67c9d2274075e.jpg');
INSERT INTO `courses` VALUES ('2', 'AUTO CAD', '8000.00', 'uploads/67c9d29b80bc4.jpg');
INSERT INTO `courses` VALUES ('3', 'IT (Information Technology)', '12000.00', 'uploads/67c9d2aad0e55.jpg');


-- Table structure for table `expense_types`

CREATE TABLE `expense_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`expense_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `expense_types`

INSERT INTO `expense_types` VALUES ('3', 'dd');
INSERT INTO `expense_types` VALUES ('2', 'Electricity');
INSERT INTO `expense_types` VALUES ('1', 'Internet');


-- Table structure for table `expenses`

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `expense_type` varchar(50) NOT NULL,
  `expenses` decimal(10,2) NOT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_type` (`expense_type`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`expense_type`) REFERENCES `expense_types` (`expense_type`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `expenses`

INSERT INTO `expenses` VALUES ('41', '2024-07-07', 'Electricity', '5000.00', 'For month of Jul');



-- Table structure for table `qualifications`

CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `qualifications`

INSERT INTO `qualifications` VALUES ('11', 'Bachelor\'s Degree (e.g., BA, BSc, BCom, BBA, BS)');
INSERT INTO `qualifications` VALUES ('15', 'Certificate');
INSERT INTO `qualifications` VALUES ('14', 'Diploma');
INSERT INTO `qualifications` VALUES ('13', 'Doctoral Degree (PhD)');
INSERT INTO `qualifications` VALUES ('10', 'Inter (HSSC)');
INSERT INTO `qualifications` VALUES ('12', 'Master\'s Degree (e.g., MA, MSc, MCom, MBA, MS)');
INSERT INTO `qualifications` VALUES ('9', 'Matric (SSC)');
INSERT INTO `qualifications` VALUES ('16', 'Under Matric');


-- Table structure for table `status`

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `status`

INSERT INTO `status` VALUES ('1', 'ENROLLED');
INSERT INTO `status` VALUES ('2', 'FREEZE');
INSERT INTO `status` VALUES ('3', 'STUCK OFF');
INSERT INTO `status` VALUES ('4', 'COMPLETED');
INSERT INTO `status` VALUES ('5', 'CERTIFICATE APPLIED');
INSERT INTO `status` VALUES ('6', 'CERTIFICATE ISSUED');


-- Table structure for table `student_info`

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
  `pic` varchar(400) DEFAULT NULL,
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
  `RemainingFees` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_blood_group` (`blood_group_id`),
  KEY `fk_qualification` (`qualification_id`),
  KEY `fk_course` (`course_id`),
  KEY `fk_class_time` (`class_time_id`),
  KEY `fk_course_duration` (`course_duration_id`),
  KEY `fk_status` (`status_id`),
  CONSTRAINT `fk_blood_group` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`),
  CONSTRAINT `fk_class_time` FOREIGN KEY (`class_time_id`) REFERENCES `class_times` (`id`),
  CONSTRAINT `fk_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_course_duration` FOREIGN KEY (`course_duration_id`) REFERENCES `course_durations` (`id`),
  CONSTRAINT `fk_qualification` FOREIGN KEY (`qualification_id`) REFERENCES `qualifications` (`id`),
  CONSTRAINT `fk_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `student_info`

INSERT INTO `student_info` VALUES ('25/1', 'Ahmed Ali', 'Liaquat ali', '398754545487', 'Male', '03147117049', '03147777777', '03111111111', 'School Mohallah near masjid Sheikhan', 'aa12437809@gmail.com', '2002-03-06', 'uploads/pictures/Ahmed Ali pic.jpeg', 'uploads/fingerprints/', '7000.00', '500.00', '2025-03-03 11:25:20', '3', '12', '1', '1', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/2', 'Abu Huraira', 'Sardar Khan', '38555555555', 'Male', '050112131', '0202020202', '0303030303', 'School Mohallah', 'xyzabcdef@gmail.com', '2025-03-08', 'uploads/pictures/Rana abu Huraira.jpg', 'uploads/fingerprints/', '7000.00', '500.00', '2025-03-03 11:28:54', '1', '13', '1', '29', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/3', 'Raza', 'Suhail', '890790878907897', 'Male', '8978907897', '897897897', '78907', '897890', '', '2023-10-28', 'uploads/pictures/Appeal.png', '', '10933.00', '1000.00', '2020-10-29 00:00:00', '1', '11', '3', '7', '3', '1', '67.00');

-- Table structure for table `fee_payments`

CREATE TABLE `fee_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roll_no` varchar(10) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `roll_no` (`roll_no`),
  CONSTRAINT `fee_payments_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student_info` (`roll_no`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `fee_payments`

INSERT INTO `fee_payments` VALUES ('21', '25/3', 'Raza', '100.00', '2025-03-07 07:47:35');
INSERT INTO `fee_payments` VALUES ('22', '25/3', 'Raza', '50.00', '2025-03-07 07:47:46');

-- Table structure for table `users`

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `users`

INSERT INTO `users` VALUES ('1', 'testuser', '482c811da5d5b4bc6d497ffa98491e38');
INSERT INTO `users` VALUES ('3', 'UTCC', 'fe3c56376161c8146f798e8716788bde');

