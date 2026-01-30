
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `class_times`

INSERT INTO `class_times` VALUES ('30', '01:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `courses`

INSERT INTO `courses` VALUES ('1', 'OFFICE MANAGEMENT', '10000.00', 'uploads/67c9d2274075e.jpg');
INSERT INTO `courses` VALUES ('2', 'AUTO CAD', '10000.00', 'uploads/67c9d29b80bc4.jpg');
INSERT INTO `courses` VALUES ('3', 'IT (Information Technology)', '12000.00', 'uploads/67c9d2aad0e55.jpg');
INSERT INTO `courses` VALUES ('9', 'GRAPHICS DESIGNING', '10000.00', '');
INSERT INTO `courses` VALUES ('10', 'SHOPIFY ', '15000.00', '');
INSERT INTO `courses` VALUES ('11', 'SAFETY OFFICER', '28000.00', '');
INSERT INTO `courses` VALUES ('12', 'SPOKEN ENGLISH ', '8000.00', '');


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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `fee_payments`

INSERT INTO `fee_payments` VALUES ('24', '25/1', 'IMRAN ALI KHAN', '2500.00', '2025-03-08 10:05:28');
INSERT INTO `fee_payments` VALUES ('25', '25/1', 'IMRAN ALI KHAN', '2500.00', '2025-03-10 04:15:37');
INSERT INTO `fee_payments` VALUES ('26', '25/4', 'RAFIA FAIZ ', '5000.00', '2025-03-11 05:14:16');
INSERT INTO `fee_payments` VALUES ('27', '25/5', 'MUHAMMAD WALEED KHAN', '5000.00', '2025-03-11 05:19:44');
INSERT INTO `fee_payments` VALUES ('28', '25/13', 'MUIHAMMAD JAMAL', '4000.00', '2025-04-09 05:22:49');
INSERT INTO `fee_payments` VALUES ('29', '25/14', 'ZEESHAN', '4500.00', '2025-04-11 05:21:25');
INSERT INTO `fee_payments` VALUES ('30', '25/1', 'IMRAN ALI KHAN', '2500.00', '2025-04-14 04:28:38');
INSERT INTO `fee_payments` VALUES ('31', '25/3', 'QALAB ABBAS', '2500.00', '2025-04-18 03:56:40');
INSERT INTO `fee_payments` VALUES ('32', '25/15', 'JARAR HAIDER AKHTAR', '5000.00', '2025-05-15 05:21:56');
INSERT INTO `fee_payments` VALUES ('33', '25/9', 'SANIA TAUQEER', '4000.00', '2025-05-19 08:24:29');
INSERT INTO `fee_payments` VALUES ('34', '25/10', 'LAIBA TOQEER', '4000.00', '2025-05-19 08:25:01');
INSERT INTO `fee_payments` VALUES ('35', '25/11', 'BISMA BIBI', '4000.00', '2025-05-19 08:25:13');
INSERT INTO `fee_payments` VALUES ('36', '25/12', 'ANIYZA AKRAM', '4000.00', '2025-05-19 08:25:23');
INSERT INTO `fee_payments` VALUES ('37', '25/25', 'ABDULLAH REHAN', '4000.00', '2025-05-24 04:09:54');
INSERT INTO `fee_payments` VALUES ('38', '25/24', 'MUHAMMAD USMAN', '4000.00', '2025-05-24 04:10:46');
INSERT INTO `fee_payments` VALUES ('39', '25/34', 'MUHAMMAD ADNAN TARIQ', '4000.00', '2025-05-26 04:49:08');
INSERT INTO `fee_payments` VALUES ('40', '25/33', 'SAQLAIN ABBAS', '5000.00', '2025-05-27 06:31:46');
INSERT INTO `fee_payments` VALUES ('41', '25/20', 'MUNTZIR MEHDI', '4000.00', '2025-05-29 05:30:47');
INSERT INTO `fee_payments` VALUES ('42', '25/23', 'HAFSA ASLAM', '5000.00', '2025-05-29 05:57:58');
INSERT INTO `fee_payments` VALUES ('43', '25/36', 'MUHAMMAD HASEEB HAIDER ', '3000.00', '2025-06-02 05:03:10');
INSERT INTO `fee_payments` VALUES ('44', '25/29', 'ABIDA SHAHEEN ', '4000.00', '2025-06-03 08:52:57');


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

INSERT INTO `student_info` VALUES ('25/1', 'IMRAN ALI KHAN', 'MUHAMMAD ZAMAN', '3730291658013', 'Male', '03485008028', '03485008028', '03485008028', 'CHAK JANI', 'imran@gmail.com', '2028-03-07', 'uploads/pictures/WhatsApp Image 2025-03-08 at 2.54.09 PM.jpeg', '', '10000.00', '0.00', '2025-01-04 00:00:00', '7', '9', '1', '2', '4', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/10', 'LAIBA TOQEER', 'TOQEER HUSSAIN', '3730227509312', 'Female', '03425313685', '03470537554', '03470537554', 'Thill', 'labia@gamil.com', '2003-09-22', 'uploads/pictures/WhatsApp Image 2025-03-10 at 12.48.11 PM.jpeg', '', '8000.00', '2000.00', '2025-03-03 00:00:00', '7', '10', '1', '6', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/11', 'BISMA BIBI', 'MUHAMMAD YAR', '3730257490716', 'Female', '03405815784', '03436528397', '03436528397', 'Thill', 'bisma@gmail.com', '2024-04-17', 'uploads/pictures/WhatsApp Image 2025-03-10 at 12.52.39 PM.jpeg', '', '8000.00', '2000.00', '2025-03-03 00:00:00', '7', '10', '1', '6', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/12', 'ANIYZA AKRAM', 'MUHAMMAD AKRAM', '3730280226768', 'Female', '03449416249', '03485985968', '03485985968', 'Bhabhanwala', 'akram@gmail.com', '2002-12-14', 'uploads/pictures/WhatsApp Image 2025-03-10 at 12.56.43 PM.jpeg', '', '8000.00', '2000.00', '2025-03-04 00:00:00', '7', '11', '1', '6', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/13', 'MUIHAMMAD JAMAL', 'GHULAM ASGHAR ', '3730281723339', 'Male', '03079128146', '03275084098', '03275084098', 'Bhaganwala', 'jamal@gmail.com', '2004-02-06', 'uploads/pictures/WhatsApp Image 2025-03-10 at 1.05.04 PM.jpeg', '', '8000.00', '2000.00', '2025-03-05 00:00:00', '7', '9', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/14', 'ZEESHAN', 'ARSHAD MEHMOOD', '5210293185279', 'Male', '03437828228', '03437828228', '03126810432', 'Panawala ', 'zeeshan@gmail.com', '1999-01-06', 'uploads/pictures/WhatsApp Image 2025-03-25 at 9.42.29 AM.jpeg', '', '7500.00', '1000.00', '2025-03-04 00:00:00', '3', '9', '12', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/15', 'JARAR HAIDER AKHTAR', 'NASEER UL HASSAN ', '3730234234413', 'Male', '03427961658', '03427961658', '03427961658', 'Painwala ', 'jarar@gmail.com', '1998-07-20', 'uploads/pictures/WhatsApp Image 2025-04-10 at 9.04.14 AM.jpeg', '', '10000.00', '0.00', '2025-03-21 00:00:00', '1', '10', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/16', 'DALWAR HUSSAIN', 'MUSHTAQ AHMED', '3730236831495', 'Male', '03479360833', '03479360833', '03479360833', 'Pindi Saidpur', 'dalwar@gmail.com', '2003-01-03', 'uploads/pictures/WhatsApp Image 2025-04-10 at 2.22.49 PM.jpeg', '', '5000.00', '0.00', '2025-03-16 00:00:00', '3', '16', '1', '2', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/17', 'HASSAM NAVEED', 'NAVEED AKHTAR', '3730297765855', 'Male', '03353114824', '03325483759', '03005483759', 'Jalalpur Shirf', 'hassan@gamil.com', '2009-11-04', 'uploads/pictures/WhatsApp Image 2025-04-10 at 2.29.01 PM.jpeg', '', '8000.00', '2000.00', '2025-04-05 00:00:00', '3', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/18', 'RAJA AMER SULTAN ', 'SHER AFGHAN', '3730265549015', 'Male', '03455961030', '03455961030', '03407225182', 'Pindi Saidpur ', 'amer@gamil.com', '2007-07-18', 'uploads/pictures/WhatsApp Image 2025-04-10 at 2.34.28 PM.jpeg', '', '2500.00', '3000.00', '2025-04-05 00:00:00', '3', '16', '1', '2', '2', '1', '4500.00');
INSERT INTO `student_info` VALUES ('25/19', 'BAKHTWAR AFGHAN', 'SHER AFGHAN ', '3730291159695', 'Female', '03455961030', '03407225182', '03407225182', 'Pindi Saidpur ', 'Bakhtwar@gmail.com', '2008-12-07', 'uploads/pictures/WhatsApp Image 2025-04-10 at 2.42.29 PM.jpeg', '', '3500.00', '500.00', '2025-04-05 00:00:00', '4', '16', '12', '2', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/2', 'GHULAM MURTAZA ', 'UMAR FAROOQ', '3730281568533', 'Male', '03445645448', '03445645448', '03445645448', 'Pananwal ', 'gmmtf786295@gmail.com', '2005-06-06', 'uploads/pictures/WhatsApp Image 2025-03-08 at 3.33.59 PM.jpeg', '', '10000.00', '0.00', '2025-01-13 00:00:00', '7', '10', '9', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/20', 'MUNTZIR MEHDI', 'MESSAM ALI', '3730297111289', 'Male', '03434827514', '03425802259', '03425802259', 'Pananwala ', 'mehdi@gmail.com', '2007-10-12', 'uploads/pictures/WhatsApp Image 2025-04-10 at 2.44.15 PM.jpeg', '', '9000.00', '1000.00', '2025-04-07 00:00:00', '1', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/21', 'MUHAMMAD RAZWAN', 'ARSHAD MEHMOOD', '3730221490101', 'Male', '03475386307', '03432476481', '03432476481', 'Chakjani', 'rawzan@gamil.com', '2010-06-10', 'uploads/pictures/WhatsApp Image 2025-04-10 at 2.49.43 PM.jpeg', '', '5000.00', '0.00', '2025-04-09 00:00:00', '7', '16', '1', '2', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/22', 'SYEDA HIJAB FATIMA ', 'SYAD IJAZ HUSSAN SHAH', '3730271633710', 'Female', '03450567850', '03450567850', '03450567850', 'Syedianwala', 'hajib@gamil.com', '2009-09-02', 'uploads/pictures/WhatsApp Image 2025-04-10 at 2.55.25 PM.jpeg', '', '2500.00', '5000.00', '2025-04-09 00:00:00', '7', '9', '1', '3', '2', '1', '2500.00');
INSERT INTO `student_info` VALUES ('25/23', 'HAFSA ASLAM', 'MUHAMMAD ASLAM ', '00000000000', 'Female', '03439087147', '03439087147', '03439087147', 'Segharpur', 'hafiza@gamil.com', '2007-08-07', 'uploads/pictures/haff.jpeg', '', '10000.00', '0.00', '2025-04-14 00:00:00', '7', '16', '1', '6', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/24', 'MUHAMMAD USMAN', 'KHAZIR HAYAT ', '3730251454771', 'Male', '03425328652', '03425328652', '03425328652', 'Thill ', 'usman@gmail.com', '2009-09-20', 'uploads/pictures/WhatsApp Image 2025-04-16 at 3.07.21 PM.jpeg', '', '9000.00', '1000.00', '2025-04-16 00:00:00', '7', '16', '1', '1', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/25', 'ABDULLAH REHAN', 'MUHAMMAD REHAN NAZIR', '3730236742445', 'Male', '03445995572', '03407699909', '03407699909', 'Thill', 'rehan@gamil.com', '2010-07-30', 'uploads/pictures/WhatsApp Image 2025-04-19 at 11.33.24 AM.jpeg', '', '8000.00', '2000.00', '2025-04-19 00:00:00', '7', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/26', 'SHERYAR AKHTAR ', 'AKHTAR MAHMOOD', '3730253039931', 'Male', '03327298125', '03327298125', '03327298125', 'Pindi Saidpur', 'sheryar@gmail.com', '2005-09-27', 'uploads/pictures/WhatsApp Image 2025-04-21 at 12.02.53 PM.jpeg', '', '4000.00', '2000.00', '2025-04-21 00:00:00', '3', '10', '2', '4', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/27', 'AMBER SHAHZADI', 'FAROOQ AHMED', '3730282952224', 'Female', '03495825114', '03465042017', '03465042017', 'Jalalpur Shirf', 'amber@gmail.com', '2010-03-26', 'uploads/pictures/111111.jpeg', '', '5000.00', '1000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/28', 'AROOJ FATIMA ', 'BABO GHULAM ALI', '3730249474704', 'Female', '03158577062', '03468577062', '03468577062', 'Jalalpur Shirf', 'arooj@gmail.com', '2010-03-16', 'uploads/pictures/555.jpeg', '', '5000.00', '1000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/29', 'ABIDA SHAHEEN ', 'MUHAMMAD RASHID', '3440245336772', 'Female', '03400110727', '03419868391', '03419868391', 'Jalalpur Shirf', 'abida@gmail.com', '2008-03-09', 'uploads/pictures/34.jpeg', '', '9000.00', '1000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/3', 'QALAB ABBAS', 'MUHAMMAD NASEER HAIDERI', '3730281929152', 'Male', '03065869006', '03065869006', '03065869006', 'Painanwala ', 'qalababbas@gmail.com', '2002-08-31', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.27.27 AM.jpeg', '', '10000.00', '0.00', '2025-01-20 00:00:00', '3', '14', '1', '2', '4', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/30', 'MADNI BATOOL', 'GHULAM RASOOL', '3730267051352', 'Female', '03066569280', '03007751744', '03007751744', 'Jalalpur Shirf', 'madni@gmail.com', '2011-01-01', 'uploads/pictures/WhatsApp Image 2025-04-21 at 3.33.40 PM.jpeg', '', '4000.00', '2000.00', '2025-04-21 00:00:00', '7', '16', '1', '30', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/31', 'MALIKA RASOOL', 'GHULAM RASOOL', '3730218844726', 'Female', '03066569280', '03007751744', '03007751744', 'Jalalpur Shirf', 'malika@gmail.com', '2008-11-15', 'uploads/pictures/WhatsApp Image 2025-04-21 at 3.38.15 PM.jpeg', '', '4000.00', '2000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/32', 'ANEEZA RASOOL', 'GHULAM RASOOL', '3730217893776', 'Female', '03066569280', '03007751744', '03007751744', 'Jalalpur Shirf', 'aneeza@gmail.com', '2007-12-30', 'uploads/pictures/WhatsApp Image 2025-04-21 at 3.42.39 PM.jpeg', '', '4000.00', '2000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/33', 'SAQLAIN ABBAS', 'MUHAMMAD AKRAM ', '0000000000000', 'Male', '03435102155', '03435102155', '03435102155', 'Baghanwala', 'saqlain@gmail.com', '2007-08-01', 'uploads/pictures/WhatsApp Image 2025-04-22 at 12.34.16 PM.jpeg', '', '10000.00', '0.00', '2025-04-22 00:00:00', '7', '16', '2', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/34', 'MUHAMMAD ADNAN TARIQ', 'TARIQ MEHMOOD', '3730245399731', 'Male', '03470215402', '03465127175', ' 03465127175', 'Thill', 'adnan@gmail.com', '2009-04-13', 'uploads/pictures/WhatsApp Image 2025-04-23 at 9.01.39 AM.jpeg', '', '8000.00', '2000.00', '2025-04-23 00:00:00', '3', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/35', 'MUHAMMAD SHAHMEER KHAN', 'MUHAMMAD RAMZAN', '3730245834305', 'Male', '03415698074', '03465776621', '03465776621', 'Paninwala ', 'shahmeer@gmail.com', '2008-08-08', 'uploads/pictures/WhatsApp Image 2025-04-26 at 12.07.58 PM.jpeg', '', '4000.00', '2000.00', '2025-04-26 00:00:00', '7', '16', '9', '3', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/36', 'MUHAMMAD HASEEB HAIDER ', 'FAIZ ABBAS ', '3730295464921', 'Male', '03475093096', '03475093096', '03475093096', 'Pindi Saidpur', 'haseeb@gmail.com', '2008-06-04', 'uploads/pictures/WhatsApp Image 2025-05-03 at 9.09.10 AM.jpeg', '', '5500.00', '1000.00', '2025-05-03 00:00:00', '7', '16', '1', '2', '4', '1', '3500.00');
INSERT INTO `student_info` VALUES ('25/37', 'SHAHZAD ARSHAD', 'MUHAMMAD ARSHAD', '3730258760205', 'Male', '03445935987', '03445935987', '03445935987', 'Pindi Saidpur', 'shahzad@gmail.com', '2009-09-05', 'uploads/pictures/WhatsApp Image 2025-05-03 at 1.46.21 PM.jpeg', '', '2500.00', '0.00', '2025-05-03 00:00:00', '7', '16', '1', '3', '4', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/38', 'MUHAMMAD NAIL', 'NAEEM AHMED', '3730216171145', 'Male', '03424270601', '03424270601', '03424270601', 'Chakri', 'nail@gmail.com', '2009-02-26', 'uploads/pictures/WhatsApp Image 2025-05-06 at 12.05.10 PM.jpeg', '', '4000.00', '2000.00', '2025-05-06 00:00:00', '7', '16', '2', '4', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/39', 'MUHAMMAD SAAD', 'MUHAMMAD AYUB', '3730269253503', 'Male', '03475749267', '03475749267', '03475749267', 'Kotli Pareen', 'saad@gmail.co', '2006-02-09', 'uploads/pictures/WhatsApp Image 2025-05-12 at 9.50.17 PM.jpeg', '', '8000.00', '2000.00', '2025-05-12 00:00:00', '3', '10', '1', '1', '1', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/4', 'RAFIA FAIZ ', 'MUHAMMAD RIAZ', '3730277416418', 'Female', '03004799919', '03004799919', '03004799919', 'Chakjani', 'rafia@gmail.com', '2006-03-15', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.32.46 AM.jpeg', '', '10000.00', '0.00', '2025-03-02 00:00:00', '7', '10', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/40', 'AMAN SHAHZADI ', 'MUHAMMAD RIAZ', '3730215795436', 'Female', '03495825220', '03435777415', '03435777415', 'Thill', 'aman@gmail.com', '2007-05-07', 'uploads/pictures/WhatsApp Image 2025-05-12 at 10.01.28 PM.jpeg', '', '5000.00', '0.00', '2025-05-11 00:00:00', '7', '10', '1', '30', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/41', 'MUHAMMAD MUSHTAQ AHMAD', 'MUHAMMAD SHABBIR', '373025954515', 'Male', '03068992645', '03068992645', '03068992645', 'Sherpur', 'mushtaq@gmail.com', '2008-01-08', 'uploads/pictures/WhatsApp Image 2025-05-14 at 9.17.02 AM.jpeg', '', '3500.00', '0.00', '2025-05-14 00:00:00', '7', '9', '1', '2', '3', '1', '6500.00');
INSERT INTO `student_info` VALUES ('25/42', 'MUHAMMAD AHSAN SULTANI', 'ZAHOOR ALLAHI', '3730279464945', 'Male', '03408927990', '03400435016', '03400435016', 'Pindi Saidpur ', 'ehsan@gamil.com', '2010-09-10', 'uploads/pictures/11.jpeg', '', '5000.00', '0.00', '2025-05-17 00:00:00', '7', '16', '1', '3', '3', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/43', 'MUHAMMAD FAIZAN ', 'IMRAN HAIDER', '3730215386523', 'Male', '03498553895', '03498553895', '03498553895', 'Khewanwala ', 'faizan@gmail.com', '2006-10-02', 'uploads/pictures/WhatsApp Image 2025-05-20 at 9.07.06 AM.jpeg', '', '8000.00', '2000.00', '2025-05-20 00:00:00', '7', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/44', 'MUHAMMAD IBRAR AHMED', 'GULZAR AHMED ', '3430259620737', 'Male', '03028795728', '03028795728', '03028795728', 'Pindisaidpur ', 'ibrar@gmail.com', '2008-09-30', 'uploads/pictures/12.jpeg', '', '4000.00', '2000.00', '2025-05-20 00:00:00', '7', '16', '1', '2', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/45', 'FAIZAN RASHEED ', 'RASHEED AHMED ', '3730201219481', 'Male', '03425363338', '03425363338', '03425363338', 'Bhatoo Colony ', 'faizan@gmail.com', '2008-12-10', 'uploads/pictures/12.jpeg', '', '4000.00', '2000.00', '2025-05-21 00:00:00', '3', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/46', 'Syed Haider Ali Shah Bukhari', 'Syed Sajad Hasan Shah  ', '3730245338277', 'Male', '03485292914', '03415143618', '03415143618', 'Abbas Nagar ', 'haider@gmail.com', '2009-08-12', 'uploads/pictures/13.jpeg', '', '2500.00', '2000.00', '2025-05-21 00:00:00', '7', '16', '1', '2', '4', '1', '5500.00');
INSERT INTO `student_info` VALUES ('25/47', 'MUHAMMAD NOMAN ALI ', 'MUHAMMAD MANSHA', '3730228626955', 'Male', '03259095968', '03065531097', '03065531097', 'Sherpur', 'noman@gmail.com', '2009-07-05', 'uploads/pictures/new.jpeg', '', '2000.00', '2000.00', '2025-05-22 00:00:00', '7', '16', '1', '2', '3', '1', '6000.00');
INSERT INTO `student_info` VALUES ('25/48', 'MUHAMMAD USMAN', 'QASIR ABBAS', '3730211986753', 'Male', '03319255769', '03066860337', '03066860337', 'Dheri', 'usman@gmail.com', '2010-05-16', 'uploads/pictures/usman.jpeg', '', '4000.00', '2000.00', '2025-05-23 00:00:00', '7', '16', '1', '1', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/49', 'MUHAMMAD USMAN', 'QASIR ABBAS', '3730286944077', 'Male', '03319255769', '03066860337', '03066860337', 'Dheri', 'usman@gmail.com', '2010-05-16', 'uploads/pictures/usman.jpeg', '', '3500.00', '1000.00', '2025-05-23 00:00:00', '7', '16', '12', '4', '2', '1', '3500.00');
INSERT INTO `student_info` VALUES ('25/5', 'MUHAMMAD WALEED KHAN', 'MIRZA KHAN', '3730233657969', 'Male', '03430842954', '03430842954', '03430842954', 'Dolat pur', 'waleed@gmail.com', '2006-06-11', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.39.47 AM.jpeg', '', '10000.00', '0.00', '2025-03-13 00:00:00', '7', '10', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/50', 'AYESHA BIBI', 'BASHIR AHMAD', '3440296022266', 'Female', '03485302797', '03485302797', '03485302797', 'Pindi Saidpur', 'ayesha@gmail.com', '2003-09-07', 'uploads/pictures/image.jpeg', '', '2500.00', '0.00', '2025-05-24 00:00:00', '3', '10', '1', '2', '4', '1', '7500.00');
INSERT INTO `student_info` VALUES ('25/51', 'IQRA REHMAN', 'AZMAT REHMAN', '3730284740354', 'Female', '03408833484', '03451212754', '03451212754', 'Thill', 'iqra@gmail.com', '2003-01-23', 'uploads/pictures/WhatsApp Image 2025-05-29 at 9.28.38 AM.jpeg', '', '4000.00', '2000.00', '2025-05-29 00:00:00', '7', '11', '1', '2', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/52', 'NOOR UL HASAN ', 'TAHIR MEHMOOD', '373020455871', 'Male', '03435772081', '03435772081', '03435772081', 'Ladwa ', 'noor@gmai.com', '2010-08-30', 'uploads/pictures/WhatsApp Image 2025-06-03 at 9.23.15 AM.jpeg', '', '2500.00', '2000.00', '2025-06-03 00:00:00', '7', '16', '1', '1', '3', '1', '5500.00');
INSERT INTO `student_info` VALUES ('25/53', 'HAMEER ALI', 'SHAHID AHMED', '3730211118889', 'Male', '03415143194', '03415143194', '03415143194', 'Ladwa', 'hameer@gmail.com', '2011-12-21', 'uploads/pictures/WhatsApp Image 2025-06-03 at 9.33.00 AM.jpeg', '', '2500.00', '2000.00', '2025-06-03 00:00:00', '7', '16', '1', '1', '3', '1', '5500.00');
INSERT INTO `student_info` VALUES ('25/6', 'MADAD ALI', 'IBRAR MEHDI', '3730269959133', 'Male', '03009108302', '03009108302', '03009108302', 'Painawala ', 'madad@gmail.com', '2007-06-07', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.53.10 AM.jpeg', '', '5000.00', '0.00', '2025-02-21 00:00:00', '3', '9', '1', '2', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/7', 'HASSAN RAZA', 'ASAD ALI JALIP', '3730285767621', 'Male', '03038167119', '03038167119', '03038167119', 'Pananwala', 'hassan@gmail.com', '2008-04-30', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.57.49 AM.jpeg', '', '5000.00', '0.00', '2025-02-24 00:00:00', '7', '9', '1', '2', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/8', 'DANISH ALI', 'MANSHA KHAN', '3730223070913', 'Male', '03048734150', '03475394029', '03475394029', 'Sherpur', 'dansih@gmail.com', '2006-10-01', 'uploads/pictures/WhatsApp Image 2025-03-10 at 12.40.49 PM.jpeg', '', '5000.00', '0.00', '2025-02-25 00:00:00', '7', '9', '1', '2', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/9', 'SANIA TAUQEER', 'TAUQEER HUSSAIN', '3730208941854', 'Male', '03415265443', '03470537554', '03470537554', 'Thill ', 'sania@gmail.com', '2004-12-20', 'uploads/pictures/WhatsApp Image 2025-03-10 at 12.42.41 PM.jpeg', '', '8000.00', '2000.00', '2025-03-03 00:00:00', '7', '11', '1', '6', '2', '1', '0.00');


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

