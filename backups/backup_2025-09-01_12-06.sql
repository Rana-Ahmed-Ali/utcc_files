
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `courses`

INSERT INTO `courses` VALUES ('1', 'OFFICE MANAGEMENT', '10000.00', 'uploads/67c9d2274075e.jpg');
INSERT INTO `courses` VALUES ('2', 'AUTO CAD', '10000.00', 'uploads/67c9d29b80bc4.jpg');
INSERT INTO `courses` VALUES ('9', 'GRAPHICS DESIGNING', '10000.00', '');
INSERT INTO `courses` VALUES ('10', 'SHOPIFY ', '15000.00', '');
INSERT INTO `courses` VALUES ('12', 'SPOKEN ENGLISH ', '8000.00', '');
INSERT INTO `courses` VALUES ('16', 'SAFETY OFFICER', '28000.00', '');


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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
INSERT INTO `fee_payments` VALUES ('45', '25/30', 'MADNI BATOOL', '4000.00', '2025-06-05 08:46:02');
INSERT INTO `fee_payments` VALUES ('46', '25/31', 'MALIKA RASOOL', '4000.00', '2025-06-05 08:48:07');
INSERT INTO `fee_payments` VALUES ('47', '25/28', 'AROOJ FATIMA ', '4000.00', '2025-06-05 08:48:45');
INSERT INTO `fee_payments` VALUES ('48', '25/32', 'ANEEZA RASOOL', '4000.00', '2025-06-05 08:52:34');
INSERT INTO `fee_payments` VALUES ('49', '25/26', 'SHERYAR AKHTAR ', '4000.00', '2025-06-23 06:46:11');
INSERT INTO `fee_payments` VALUES ('50', '25/47', 'MUHAMMAD NOMAN ALI ', '3000.00', '2025-06-27 06:28:54');
INSERT INTO `fee_payments` VALUES ('51', '25/63', 'SADIA ALEEM', '2000.00', '2025-07-01 06:07:56');
INSERT INTO `fee_payments` VALUES ('52', '25/36', 'MUHAMMAD HASEEB HAIDER ', '2000.00', '2025-07-02 03:41:11');
INSERT INTO `fee_payments` VALUES ('53', '25/40', 'AMAN SHAHZADI ', '2000.00', '2025-07-02 06:55:29');
INSERT INTO `fee_payments` VALUES ('54', '25/42', 'MUHAMMAD AHSAN SULTANI', '5000.00', '2025-07-03 04:26:04');
INSERT INTO `fee_payments` VALUES ('55', '25/50', 'AYESHA BIBI', '3000.00', '2025-07-03 04:48:54');
INSERT INTO `fee_payments` VALUES ('56', '25/51', 'IQRA REHMAN', '4000.00', '2025-07-03 06:52:30');
INSERT INTO `fee_payments` VALUES ('57', '25/48', 'MUHAMMAD USMAN', '4000.00', '2025-07-04 06:41:39');
INSERT INTO `fee_payments` VALUES ('58', '25/49', 'MUHAMMAD USMAN', '3500.00', '2025-07-04 06:41:48');
INSERT INTO `fee_payments` VALUES ('59', '25/52', 'NOOR UL HASAN ', '2000.00', '2025-07-08 03:52:36');
INSERT INTO `fee_payments` VALUES ('60', '25/55', 'AMNA KANWAL', '4000.00', '2025-07-11 06:43:52');
INSERT INTO `fee_payments` VALUES ('61', '25/53', 'HAMEER ALI', '2500.00', '2025-07-11 06:46:32');
INSERT INTO `fee_payments` VALUES ('62', '25/60', 'SUBHAN ALI AHMED ', '4000.00', '2025-07-26 08:52:57');
INSERT INTO `fee_payments` VALUES ('63', '25/50', 'AYESHA BIBI', '4500.00', '2025-08-02 05:23:53');
INSERT INTO `fee_payments` VALUES ('64', '25/56', 'SAEED ABDULLAH ', '4000.00', '2025-08-04 07:22:41');
INSERT INTO `fee_payments` VALUES ('65', '25/57', 'MUHAMMAD JUNAID', '4000.00', '2025-08-04 07:22:52');
INSERT INTO `fee_payments` VALUES ('66', '25/64', 'SHAMS UL QAMAR', '3000.00', '2025-08-05 03:27:13');
INSERT INTO `fee_payments` VALUES ('67', '25/44', 'MUHAMMAD IBRAR AHMED', '4000.00', '2025-08-05 03:32:57');
INSERT INTO `fee_payments` VALUES ('68', '25/54', 'RIZWANA YASMEEN', '4000.00', '2025-08-06 04:26:19');
INSERT INTO `fee_payments` VALUES ('69', '25/68', 'ZAINAB BIBI', '2000.00', '2025-08-07 07:09:10');
INSERT INTO `fee_payments` VALUES ('70', '25/36', 'MUHAMMAD HASEEB HAIDER ', '1000.00', '2025-08-07 07:09:23');
INSERT INTO `fee_payments` VALUES ('71', '25/36', 'MUHAMMAD HASEEB HAIDER ', '500.00', '2025-08-11 03:42:31');
INSERT INTO `fee_payments` VALUES ('72', '25/73', 'MUHAMMAD NADEEM ASHRAF', '2000.00', '2025-08-11 03:42:50');
INSERT INTO `fee_payments` VALUES ('73', '25/74', 'MUHAMMAD DANISH AFTA', '2000.00', '2025-08-11 03:43:03');
INSERT INTO `fee_payments` VALUES ('74', '25/75', 'MUHAMMAD SHAHRIA IMRAN', '2000.00', '2025-08-11 03:43:19');
INSERT INTO `fee_payments` VALUES ('75', '25/69', 'NIDA FATIMA', '2000.00', '2025-08-11 03:45:29');
INSERT INTO `fee_payments` VALUES ('76', '25/68', 'ZAINAB BIBI', '2000.00', '2025-08-18 04:15:32');
INSERT INTO `fee_payments` VALUES ('77', '25/47', 'MUHAMMAD NOMAN ALI ', '3000.00', '2025-08-18 04:16:59');
INSERT INTO `fee_payments` VALUES ('78', '25/62', 'EMAN TARIQ', '6000.00', '2025-08-18 04:17:57');
INSERT INTO `fee_payments` VALUES ('79', '25/63', 'SADIA ALEEM', '5000.00', '2025-08-18 04:18:15');
INSERT INTO `fee_payments` VALUES ('80', '25/67', 'MALAIKA ARSHAD', '4000.00', '2025-08-18 04:18:28');
INSERT INTO `fee_payments` VALUES ('81', '25/52', 'NOOR UL HASAN ', '3500.00', '2025-08-26 04:41:55');
INSERT INTO `fee_payments` VALUES ('82', '25/53', 'HAMEER ALI', '3000.00', '2025-08-26 04:42:06');
INSERT INTO `fee_payments` VALUES ('83', '25/86', 'SHAMS UL QAMAR', '4000.00', '2025-08-26 06:34:35');
INSERT INTO `fee_payments` VALUES ('84', '25/83', 'MUHAMMAD SHAHZAIB', '5000.00', '2025-09-01 05:30:41');


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
INSERT INTO `student_info` VALUES ('25/26', 'SHERYAR AKHTAR ', 'AKHTAR MAHMOOD', '3730253039931', 'Male', '03327298125', '03327298125', '03327298125', 'Pindi Saidpur', 'sheryar@gmail.com', '2005-09-27', 'uploads/pictures/WhatsApp Image 2025-04-21 at 12.02.53 PM.jpeg', '', '8000.00', '2000.00', '2025-04-21 00:00:00', '3', '10', '2', '4', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/27', 'AMBER SHAHZADI', 'FAROOQ AHMED', '3730282952224', 'Female', '03495825114', '03465042017', '03465042017', 'Jalalpur Shirf', 'amber@gmail.com', '2010-03-26', 'uploads/pictures/111111.jpeg', '', '5000.00', '1000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/28', 'AROOJ FATIMA ', 'BABO GHULAM ALI', '3730249474704', 'Female', '03158577062', '03468577062', '03468577062', 'Jalalpur Shirf', 'arooj@gmail.com', '2010-03-16', 'uploads/pictures/555.jpeg', '', '9000.00', '1000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/29', 'ABIDA SHAHEEN ', 'MUHAMMAD RASHID', '3440245336772', 'Female', '03400110727', '03419868391', '03419868391', 'Jalalpur Shirf', 'abida@gmail.com', '2008-03-09', 'uploads/pictures/34.jpeg', '', '9000.00', '1000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/3', 'QALAB ABBAS', 'MUHAMMAD NASEER HAIDERI', '3730281929152', 'Male', '03065869006', '03065869006', '03065869006', 'Painanwala ', 'qalababbas@gmail.com', '2002-08-31', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.27.27 AM.jpeg', '', '10000.00', '0.00', '2025-01-20 00:00:00', '3', '14', '1', '2', '4', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/30', 'MADNI BATOOL', 'GHULAM RASOOL', '3730267051352', 'Female', '03066569280', '03007751744', '03007751744', 'Jalalpur Shirf', 'madni@gmail.com', '2011-01-01', 'uploads/pictures/WhatsApp Image 2025-04-21 at 3.33.40 PM.jpeg', '', '8000.00', '2000.00', '2025-04-21 00:00:00', '7', '16', '1', '30', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/31', 'MALIKA RASOOL', 'GHULAM RASOOL', '3730218844726', 'Female', '03066569280', '03007751744', '03007751744', 'Jalalpur Shirf', 'malika@gmail.com', '2008-11-15', 'uploads/pictures/WhatsApp Image 2025-04-21 at 3.38.15 PM.jpeg', '', '8000.00', '2000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/32', 'ANEEZA RASOOL', 'GHULAM RASOOL', '3730217893776', 'Female', '03066569280', '03007751744', '03007751744', 'Jalalpur Shirf', 'aneeza@gmail.com', '2007-12-30', 'uploads/pictures/WhatsApp Image 2025-04-21 at 3.42.39 PM.jpeg', '', '8000.00', '2000.00', '2025-04-21 00:00:00', '3', '16', '1', '30', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/33', 'SAQLAIN ABBAS', 'MUHAMMAD AKRAM ', '0000000000000', 'Male', '03435102155', '03435102155', '03435102155', 'Baghanwala', 'saqlain@gmail.com', '2007-08-01', 'uploads/pictures/WhatsApp Image 2025-04-22 at 12.34.16 PM.jpeg', '', '10000.00', '0.00', '2025-04-22 00:00:00', '7', '16', '2', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/34', 'MUHAMMAD ADNAN TARIQ', 'TARIQ MEHMOOD', '3730245399731', 'Male', '03470215402', '03465127175', ' 03465127175', 'Thill', 'adnan@gmail.com', '2009-04-13', 'uploads/pictures/WhatsApp Image 2025-04-23 at 9.01.39 AM.jpeg', '', '8000.00', '2000.00', '2025-04-23 00:00:00', '3', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/35', 'MUHAMMAD SHAHMEER KHAN', 'MUHAMMAD RAMZAN', '3730245834305', 'Male', '03415698074', '03465776621', '03465776621', 'Paninwala ', 'shahmeer@gmail.com', '2008-08-08', 'uploads/pictures/WhatsApp Image 2025-04-26 at 12.07.58 PM.jpeg', '', '4000.00', '2000.00', '2025-04-26 00:00:00', '7', '16', '9', '3', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/36', 'MUHAMMAD HASEEB HAIDER ', 'FAIZ ABBAS ', '3730295464921', 'Male', '03475093096', '03475093096', '03475093096', 'Pindi Saidpur', 'haseeb@gmail.com', '2008-06-04', 'uploads/pictures/WhatsApp Image 2025-05-03 at 9.09.10 AM.jpeg', '', '9000.00', '1000.00', '2025-05-03 00:00:00', '7', '16', '1', '2', '4', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/37', 'SHAHZAD ARSHAD', 'MUHAMMAD ARSHAD', '3730258760205', 'Male', '03445935987', '03445935987', '03445935987', 'Pindi Saidpur', 'shahzad@gmail.com', '2009-09-05', 'uploads/pictures/WhatsApp Image 2025-05-03 at 1.46.21 PM.jpeg', '', '2500.00', '0.00', '2025-05-03 00:00:00', '7', '16', '1', '3', '4', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/38', 'MUHAMMAD NAIL', 'NAEEM AHMED', '3730216171145', 'Male', '03424270601', '03424270601', '03424270601', 'Chakri', 'nail@gmail.com', '2009-02-26', 'uploads/pictures/WhatsApp Image 2025-05-06 at 12.05.10 PM.jpeg', '', '4000.00', '2000.00', '2025-05-06 00:00:00', '7', '16', '2', '4', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/39', 'MUHAMMAD SAAD', 'MUHAMMAD AYUB', '3730269253503', 'Male', '03475749267', '03475749267', '03475749267', 'Kotli Pareen', 'saad@gmail.co', '2006-02-09', 'uploads/pictures/WhatsApp Image 2025-05-12 at 9.50.17 PM.jpeg', '', '8000.00', '2000.00', '2025-05-12 00:00:00', '3', '10', '1', '1', '1', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/4', 'RAFIA FAIZ ', 'MUHAMMAD RIAZ', '3730277416418', 'Female', '03004799919', '03004799919', '03004799919', 'Chakjani', 'rafia@gmail.com', '2006-03-15', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.32.46 AM.jpeg', '', '10000.00', '0.00', '2025-03-02 00:00:00', '7', '10', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/40', 'AMAN SHAHZADI ', 'MUHAMMAD RIAZ', '3730215795436', 'Female', '03495825220', '03435777415', '03435777415', 'Thill', 'aman@gmail.com', '2007-05-07', 'uploads/pictures/WhatsApp Image 2025-05-12 at 10.01.28 PM.jpeg', '', '7000.00', '0.00', '2025-05-11 00:00:00', '7', '10', '1', '30', '2', '1', '3000.00');
INSERT INTO `student_info` VALUES ('25/41', 'MUHAMMAD MUSHTAQ AHMAD', 'MUHAMMAD SHABBIR', '373025954515', 'Male', '03068992645', '03068992645', '03068992645', 'Sherpur', 'mushtaq@gmail.com', '2008-01-08', 'uploads/pictures/WhatsApp Image 2025-05-14 at 9.17.02 AM.jpeg', '', '3500.00', '0.00', '2025-05-14 00:00:00', '7', '9', '1', '2', '3', '1', '6500.00');
INSERT INTO `student_info` VALUES ('25/42', 'MUHAMMAD AHSAN SULTANI', 'ZAHOOR ALLAHI', '3730279464945', 'Male', '03408927990', '03400435016', '03400435016', 'Pindi Saidpur ', 'ehsan@gamil.com', '2010-09-10', 'uploads/pictures/11.jpeg', '', '10000.00', '0.00', '2025-05-17 00:00:00', '7', '16', '1', '3', '3', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/43', 'MUHAMMAD FAIZAN ', 'IMRAN HAIDER', '3730215386523', 'Male', '03498553895', '03498553895', '03498553895', 'Khewanwala ', 'faizan@gmail.com', '2006-10-02', 'uploads/pictures/WhatsApp Image 2025-05-20 at 9.07.06 AM.jpeg', '', '8000.00', '2000.00', '2025-05-20 00:00:00', '7', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/44', 'MUHAMMAD IBRAR AHMED', 'GULZAR AHMED ', '3430259620737', 'Male', '03028795728', '03028795728', '03028795728', 'Pindisaidpur ', 'ibrar@gmail.com', '2008-09-30', 'uploads/pictures/12.jpeg', '', '8000.00', '2000.00', '2025-05-20 00:00:00', '7', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/45', 'FAIZAN RASHEED ', 'RASHEED AHMED ', '3730201219481', 'Male', '03425363338', '03425363338', '03425363338', 'Bhatoo Colony ', 'faizan@gmail.com', '2008-12-10', 'uploads/pictures/12.jpeg', '', '4000.00', '2000.00', '2025-05-21 00:00:00', '3', '16', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/46', 'Syed Haider Ali Shah Bukhari', 'Syed Sajad Hasan Shah  ', '3730245338277', 'Male', '03485292914', '03415143618', '03415143618', 'Abbas Nagar ', 'haider@gmail.com', '2009-08-12', 'uploads/pictures/13.jpeg', '', '2500.00', '2000.00', '2025-05-21 00:00:00', '7', '16', '1', '2', '4', '1', '5500.00');
INSERT INTO `student_info` VALUES ('25/47', 'MUHAMMAD NOMAN ALI ', 'MUHAMMAD MANSHA', '3730228626955', 'Male', '03259095968', '03065531097', '03065531097', 'Sherpur', 'noman@gmail.com', '2009-07-05', 'uploads/pictures/new.jpeg', '', '8000.00', '2000.00', '2025-05-22 00:00:00', '7', '16', '1', '2', '3', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/48', 'MUHAMMAD USMAN', 'QASIR ABBAS', '3730211986753', 'Male', '03319255769', '03066860337', '03066860337', 'Dheri', 'usman@gmail.com', '2010-05-16', 'uploads/pictures/usman.jpeg', '', '8000.00', '2000.00', '2025-05-23 00:00:00', '7', '16', '1', '1', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/49', 'MUHAMMAD USMAN', 'QASIR ABBAS', '3730286944077', 'Male', '03319255769', '03066860337', '03066860337', 'Dheri', 'usman@gmail.com', '2010-05-16', 'uploads/pictures/usman.jpeg', '', '7000.00', '1000.00', '2025-05-23 00:00:00', '7', '16', '12', '4', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/5', 'MUHAMMAD WALEED KHAN', 'MIRZA KHAN', '3730233657969', 'Male', '03430842954', '03430842954', '03430842954', 'Dolat pur', 'waleed@gmail.com', '2006-06-11', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.39.47 AM.jpeg', '', '10000.00', '0.00', '2025-03-13 00:00:00', '7', '10', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/50', 'AYESHA BIBI', 'BASHIR AHMAD', '3440296022266', 'Female', '03485302797', '03485302797', '03485302797', 'Pindi Saidpur', 'ayesha@gmail.com', '2003-09-07', 'uploads/pictures/image.jpeg', '', '10000.00', '0.00', '2025-05-24 00:00:00', '3', '10', '1', '2', '4', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/51', 'IQRA REHMAN', 'AZMAT REHMAN', '3730284740354', 'Female', '03408833484', '03451212754', '03451212754', 'Thill', 'iqra@gmail.com', '2003-01-23', 'uploads/pictures/WhatsApp Image 2025-05-29 at 9.28.38 AM.jpeg', '', '8000.00', '2000.00', '2025-05-29 00:00:00', '7', '11', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/52', 'NOOR UL HASAN ', 'TAHIR MEHMOOD', '373020455871', 'Male', '03435772081', '03435772081', '03435772081', 'Ladwa ', 'noor@gmai.com', '2010-08-30', 'uploads/pictures/WhatsApp Image 2025-06-03 at 9.23.15 AM.jpeg', '', '8000.00', '2000.00', '2025-06-03 00:00:00', '7', '16', '1', '1', '3', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/53', 'HAMEER ALI', 'SHAHID AHMED', '3730211118889', 'Male', '03415143194', '03415143194', '03415143194', 'Ladwa', 'hameer@gmail.com', '2011-12-21', 'uploads/pictures/WhatsApp Image 2025-06-03 at 9.33.00 AM.jpeg', '', '8000.00', '2000.00', '2025-06-03 00:00:00', '7', '16', '1', '1', '3', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/54', 'RIZWANA YASMEEN', 'SHABBIR AHMED ', '3730246625420', 'Male', '03462547064', '03462547064', '03462547064', 'Pindi Saidpur', 'rizwana@gmail.com', '2007-10-23', 'uploads/pictures/WhatsApp Image 2025-06-10 at 10.32.35 AM.jpeg', '', '8000.00', '2000.00', '2025-06-10 00:00:00', '7', '10', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/55', 'AMNA KANWAL', 'MUHAMMAD ABDUL RAUF', '3730273397324', 'Female', '03405157345', '03405157345', '03405157345', 'Pindi Saidpur', 'amna@gamil.com', '2007-08-07', 'uploads/pictures/WhatsApp Image 2025-06-13 at 8.41.10 AM.jpeg', '', '8000.00', '2000.00', '2025-06-13 00:00:00', '7', '10', '1', '1', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/56', 'SAEED ABDULLAH ', 'LAIQAT ALI KHAN', '4240198195013', 'Male', '03485798225', '03485798225', '03485798225', 'Chak Shadi', 'saeed@gmail.com', '2005-11-21', 'uploads/pictures/11.jpeg', '', '8000.00', '2000.00', '2025-06-13 00:00:00', '7', '10', '9', '3', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/57', 'MUHAMMAD JUNAID', 'TAHIR SHAHZAD AKBAR', '3730220561399', 'Male', '03495821845', '03495821845', '03495821845', 'Chak Shadi', 'junaid@gmil.com', '2006-12-23', 'uploads/pictures/WhatsApp Image 2025-06-13 at 9.51.21 AM.jpeg', '', '8000.00', '2000.00', '2025-06-13 00:00:00', '7', '10', '9', '3', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/58', 'SHAHWAIZ AKHTAR', 'MUHAMMAD AKHTAR', '3730256327967', 'Male', '03484276645', '03408033901', '03408033901', 'Dolautpur', 'shahwaiz@gmail.com', '2009-12-21', 'uploads/pictures/WhatsApp Image 2025-06-18 at 9.07.55 AM.jpeg', '', '9000.00', '1000.00', '2025-06-18 00:00:00', '7', '9', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/59', 'MAHNOOR AKRAM', 'MUHAMMAD AKRAM', '3730262032666', 'Female', '03420057901', '03445843840', '03445843840', '03445843840', 'mahnoor@gmail.com', '2002-04-06', 'uploads/pictures/WhatsApp Image 2025-06-18 at 10.18.26 AM.jpeg', '', '8000.00', '2000.00', '2025-06-18 00:00:00', '5', '10', '9', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/6', 'MADAD ALI', 'IBRAR MEHDI', '3730269959133', 'Male', '03009108302', '03009108302', '03009108302', 'Painawala ', 'madad@gmail.com', '2007-06-07', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.53.10 AM.jpeg', '', '5000.00', '0.00', '2025-02-21 00:00:00', '3', '9', '1', '2', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/60', 'SUBHAN ALI AHMED ', 'SHAHAZAD RAZA', '3730201331195', 'Male', '03455962638', '03455962638', '03455962638', 'Khewra', 'subhan@gmail.com', '2008-03-07', 'uploads/pictures/WhatsApp Image 2025-06-20 at 9.05.14 AM.jpeg', '', '8000.00', '2000.00', '2025-06-20 00:00:00', '7', '9', '9', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/61', 'MEMOONA SHAHZAD', 'SHAHZAD RAZA', '37302065338336', 'Female', '03495450209', '03495450209', '03495450209', 'Khewra', 'memoona@gmail.com', '2010-01-17', 'uploads/pictures/WhatsApp Image 2025-06-20 at 9.54.00 AM.jpeg', '', '4000.00', '1500.00', '2025-06-20 00:00:00', '3', '9', '1', '2', '3', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/62', 'EMAN TARIQ', 'TARIQ MEHMOOD', '37302-6778722-0', 'Female', '03335900611', '03335900611', '03335900611', 'Jalalpur Shirf', 'eman@gmail.com', '2007-02-24', 'uploads/pictures/WhatsApp Image 2025-06-20 at 9.59.43 AM.jpeg', '', '8000.00', '2000.00', '2025-06-20 00:00:00', '7', '9', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/63', 'SADIA ALEEM', 'MUHAMMAD ALEEM', '3730299638478', 'Female', '03435772004', '03435772004', '03435772004', 'Jalalpur Shirf', 'sadia@gamil.com', '2002-11-15', 'uploads/pictures/WhatsApp Image 2025-06-20 at 10.16.46 AM.jpeg', '', '9000.00', '2000.00', '2025-06-20 00:00:00', '7', '9', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/64', 'SHAMS UL QAMAR', 'QAMAR ZAMAN', '4240102988129', 'Male', '03471225062', '03445005956', '03445005956', 'Dheri ', 'shams@gamil.com', '2005-10-06', 'uploads/pictures/WhatsApp Image 2025-06-23 at 10.52.42 AM.jpeg', '', '6000.00', '2000.00', '2025-06-23 00:00:00', '7', '10', '12', '3', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/65', 'MUHAMMAD AZAN ALI', 'ZAHID MEHMOOD', '3730127040909', 'Male', '03331553235', '03310463984', '03310463984', 'Shahkamir', 'azan@gamil.com', '2009-02-02', 'uploads/pictures/WhatsApp Image 2025-06-23 at 12.09.10 PM.jpeg', '', '3000.00', '2000.00', '2025-06-23 00:00:00', '7', '16', '12', '3', '2', '1', '3000.00');
INSERT INTO `student_info` VALUES ('25/66', 'SYED MUBISHAR HASSAN SHAH', 'TAQUEER HASSAN SHAH', '3730275588819', 'Male', '03435203634', '03435203634', '03435203634', 'Abbas Nagar', 'mubashar@gmail.com', '2009-08-02', 'uploads/pictures/WhatsApp Image 2025-07-01 at 11.39.39 AM.jpeg', '', '2000.00', '2000.00', '2025-07-01 00:00:00', '7', '9', '1', '2', '3', '1', '6000.00');
INSERT INTO `student_info` VALUES ('25/67', 'MALAIKA ARSHAD', 'ARSHAD MEHMOOD', '3730249948624', 'Female', '03435769599', '03473113419', '03473113419', 'Pindi Saidpur', 'malaika@gmail.com', '2007-11-17', 'uploads/pictures/WhatsApp Image 2025-07-03 at 9.04.49 AM.jpeg', '', '8000.00', '2000.00', '2025-07-03 00:00:00', '7', '10', '1', '2', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/68', 'ZAINAB BIBI', 'MUHAMMAD MANSHA', '3730217108560', 'Female', '03435756527', '03435756527', '03435756527', 'Sagharpur', 'zainab@gmail.com', '2007-08-09', 'uploads/pictures/WhatsApp Image 2025-07-03 at 10.48.18 AM.jpeg', '', '6000.00', '2000.00', '2025-07-03 00:00:00', '7', '10', '1', '4', '3', '1', '2000.00');
INSERT INTO `student_info` VALUES ('25/69', 'NIDA FATIMA', 'MUHAMMAD ALI', '3730260536062', 'Female', '03405886478', '03405886478', '03405886478', 'Jalalpur Shirf', 'nida@gmail.com', '2008-01-25', 'uploads/pictures/WhatsApp Image 2025-07-03 at 11.29.24 AM.jpeg', '', '4000.00', '2000.00', '2025-07-03 00:00:00', '7', '10', '1', '2', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/7', 'HASSAN RAZA', 'ASAD ALI JALIP', '3730285767621', 'Male', '03038167119', '03038167119', '03038167119', 'Pananwala', 'hassan@gmail.com', '2008-04-30', 'uploads/pictures/WhatsApp Image 2025-03-10 at 9.57.49 AM.jpeg', '', '5000.00', '0.00', '2025-02-24 00:00:00', '7', '9', '1', '2', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/70', 'IRAM ZAHRA', 'MUHAMMAD NAZIR', '3730280842226', 'Female', '03414730073', '03414730073', '03414730073', 'Saghar pur', 'iram@gamil.com', '2008-05-27', 'uploads/pictures/WhatsApp Image 2025-07-07 at 11.39.36 AM.jpeg', '', '2500.00', '2000.00', '2025-07-07 00:00:00', '7', '10', '1', '2', '3', '1', '5500.00');
INSERT INTO `student_info` VALUES ('25/71', 'SEERAT FATIMA', 'GHULAM NABI', '3730243621400', 'Female', '03465771250', '03465771250', '03465771250', 'Sagher pur', 'seerat@gamil.com', '2007-10-09', 'uploads/pictures/WhatsApp Image 2025-07-07 at 11.39.45 AM.jpeg', '', '2500.00', '2000.00', '2025-07-07 00:00:00', '7', '10', '1', '3', '3', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/72', 'MUHAMMAD ASAM ABBAS', 'GHULAM ABBAS', '3730269258685', 'Male', '03465865337', '03465865337', '03465865337', 'Pindi Saidpur', 'asam@gmail.com', '2009-08-04', 'uploads/pictures/WhatsApp Image 2025-07-09 at 12.05.08 PM.jpeg', '', '4000.00', '2000.00', '2025-07-09 00:00:00', '7', '10', '1', '4', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/73', 'MUHAMMAD NADEEM ASHRAF', 'MUHAMMAD ASHRAF', '3730239872995', 'Male', '03275375084', '03275375084', '03275375084', 'Dheri', 'nadeem@gamil.com', '0024-09-22', 'uploads/pictures/WhatsApp Image 2025-07-11 at 11.53.11 AM.jpeg', '', '6000.00', '2000.00', '2025-07-11 00:00:00', '7', '10', '2', '4', '2', '1', '2000.00');
INSERT INTO `student_info` VALUES ('25/74', 'MUHAMMAD DANISH AFTA', 'AFTAB HUSSAIN', '3730251652257', 'Male', '03479191199', '03479191199', '03479191199', 'Dheri', 'danish@gmail.com', '2002-07-25', 'uploads/pictures/WhatsApp Image 2025-07-11 at 11.53.10 AM.jpeg', '', '6000.00', '2000.00', '2025-07-11 00:00:00', '7', '10', '2', '4', '2', '1', '2000.00');
INSERT INTO `student_info` VALUES ('25/75', 'MUHAMMAD SHAHRIA IMRAN', 'MUHAMMAD IMRAN', '3730286640857', 'Male', '03275928942', '03275928942', '03275928942', 'Dheri', 'SHAHRIA@gamil.com', '2009-01-12', 'uploads/pictures/WhatsApp Image 2025-07-11 at 11.53.10 AM (1).jpeg', '', '6000.00', '2000.00', '2025-07-11 00:00:00', '7', '10', '1', '4', '2', '1', '2000.00');
INSERT INTO `student_info` VALUES ('25/76', 'SHAHZAIB SULTAN', 'AFZAAL HUSSAIN', '3730236294031', 'Male', '03481247776', '03481247776', '03481247776', 'Doult pur', 'shahzaib@gamil.com', '2006-06-30', 'uploads/pictures/WhatsApp Image 2025-07-12 at 10.14.47 AM.jpeg', '', '4000.00', '2000.00', '2025-07-12 00:00:00', '7', '9', '9', '1', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/77', 'FURQAN AHMED ', 'SHAFQAT ULLAH', '3730285986311', 'Male', '03277849304', '03277849304', '03277849304', 'Pili', 'furqan@gmail.com', '2004-12-16', 'uploads/pictures/WhatsApp Image 2025-07-15 at 9.29.20 AM.jpeg', '', '5000.00', '1000.00', '2025-07-15 00:00:00', '7', '10', '1', '1', '2', '1', '0.00');
INSERT INTO `student_info` VALUES ('25/78', 'MUHAMMAD AWAIS ', 'ISHTAQ AHMED ', '373027454204-1', 'Male', '03441719366', '03441719366', '03441719366', 'Chakjani', 'awis@gmail.com', '2008-05-01', 'uploads/pictures/WhatsApp Image 2025-07-26 at 9.33.10 AM.jpeg', '', '7000.00', '1000.00', '2025-07-26 00:00:00', '7', '10', '1', '3', '2', '1', '2000.00');
INSERT INTO `student_info` VALUES ('25/79', 'ZOBIA BATOOL', 'SYED WAQAR HAIDER SHAH', '3410159034936', 'Female', '03406776060', '03406776060', '03406776060', 'Peerawala', 'zobia@gamil.com', '2005-11-27', 'uploads/pictures/whatsapp 11.png', '', '5500.00', '3000.00', '2025-07-31 00:00:00', '7', '11', '1', '2', '2', '1', '1500.00');
INSERT INTO `student_info` VALUES ('25/8', 'DANISH ALI', 'MANSHA KHAN', '3730223070913', 'Male', '03048734150', '03475394029', '03475394029', 'Sherpur', 'dansih@gmail.com', '2006-10-01', 'uploads/pictures/WhatsApp Image 2025-03-10 at 12.40.49 PM.jpeg', '', '5000.00', '0.00', '2025-02-25 00:00:00', '7', '9', '1', '2', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/80', 'SHAMSA BATOOL', 'SYED WAQAR HAIDER SHAH', '3410103188436', 'Female', '03406776060', '03406776060', '03406776060', 'Peerawala', 'SHAMSA@gamil.com', '2007-09-05', 'uploads/pictures/whatsapp 11.png', '', '4000.00', '3000.00', '2025-07-31 00:00:00', '7', '10', '1', '2', '2', '1', '3000.00');
INSERT INTO `student_info` VALUES ('25/81', 'SYED ZOHAIB HADIER HASAMI', 'SYED WAQAR HAIDER SHAH', '34101626888577', 'Male', '03406776060', '03406776060', '03406776060', 'Peerawala', 'zohaib@gmail.com', '2009-12-14', 'uploads/pictures/WhatsApp Image 2025-07-31 at 10.51.30 AM.jpeg', '', '4000.00', '3000.00', '2025-07-31 00:00:00', '7', '16', '1', '2', '2', '1', '3000.00');
INSERT INTO `student_info` VALUES ('25/82', 'ALI HASSAN SHAH', 'SHAH FAISAL', '3730256998764', 'Male', '03471778527', '03471778527', '03471778527', 'Peerawal', 'ali@gamilc.om', '2006-12-12', 'uploads/pictures/WhatsApp Image 2025-07-31 at 11.00.51 AM.jpeg', '', '4000.00', '3000.00', '2025-07-31 00:00:00', '7', '16', '1', '2', '2', '1', '3000.00');
INSERT INTO `student_info` VALUES ('25/83', 'MUHAMMAD SHAHZAIB', 'ARSHED MEHMOOD', '3740572623289', 'Male', '03273492651', '03273492651', '03273492651', 'Pindi Saidpur ', 'shahzaib@gmail.com', '2007-10-08', 'uploads/pictures/WhatsApp Image 2025-08-04 at 11.53.10 AM.jpeg', '', '10000.00', '0.00', '2025-08-04 00:00:00', '7', '9', '10', '2', '3', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/84', 'SYED ALI HASSAN KAZMI', 'QASIM RAZA ALI SHAH ', '4250197601779', 'Male', '03125070988', '03315454299', '03315454299', 'Syedanwala', 'ali@gmail.com', '2008-01-05', 'uploads/pictures/WhatsApp Image 2025-08-06 at 9.09.51 AM.jpeg', '', '5000.00', '0.00', '2025-08-06 00:00:00', '7', '10', '1', '2', '2', '1', '5000.00');
INSERT INTO `student_info` VALUES ('25/85', 'HUMA YAQOOB', 'MUHAMMAD YAQOOB', '373027423412', 'Female', '03105547927', '03068865122', '03068865122', 'JPS', 'huma@gmail.com', '2006-03-30', 'uploads/pictures/WhatsApp Image 2025-08-06 at 9.24.44 AM.jpeg', '', '4000.00', '2000.00', '2025-08-06 00:00:00', '7', '11', '1', '2', '2', '1', '4000.00');
INSERT INTO `student_info` VALUES ('25/86', 'SHAMS UL QAMAR', 'QAMAR ZAMAN', '240102988129', 'Male', '03471225062', '03445005956', '03445005956', 'Dheri', 'SHAMS@gmail.com', '2005-06-10', 'uploads/pictures/WhatsApp Image 2025-08-06 at 10.38.28 AM.jpeg', '', '8000.00', '2000.00', '2025-08-06 00:00:00', '3', '10', '2', '2', '2', '1', '0.00');
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

