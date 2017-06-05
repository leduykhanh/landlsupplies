-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2017 at 05:54 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firetronics`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`renoboxc`@`localhost` PROCEDURE `archive` (IN `stat` INT)  BEGIN
UPDATE `riskassessment` set status=3 WHERE (`createdDate` + INTERVAL `expiry_date` YEAR) < NOW();
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `actionofficer`
--

CREATE TABLE `actionofficer` (
  `id` int(11) NOT NULL,
  `hazardid` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `approvingmanager`
--

CREATE TABLE `approvingmanager` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `designation` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `approvingmanager`
--

INSERT INTO `approvingmanager` (`id`, `name`, `email`, `designation`, `image`) VALUES
(1, 'Jay Tay', 'yaytay@firetronics.com.sg', 'Project Manager', 'yaytay.png');

-- --------------------------------------------------------

--
-- Table structure for table `hazard`
--

CREATE TABLE `hazard` (
  `hazard_id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `security` varchar(200) NOT NULL,
  `securitysecond` text NOT NULL,
  `accident` varchar(200) NOT NULL,
  `likehood` varchar(200) NOT NULL,
  `likehoodsecond` text NOT NULL,
  `risk_control` text NOT NULL,
  `risk_label` varchar(200) NOT NULL,
  `risk_additional` text NOT NULL,
  `action_officer` varchar(200) NOT NULL,
  `action_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `name_other` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hazard_actionofficer`
--

CREATE TABLE `hazard_actionofficer` (
  `id` int(11) NOT NULL,
  `hazardId` int(11) NOT NULL,
  `ramemberId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hazard_cause`
--

CREATE TABLE `hazard_cause` (
  `id` int(10) NOT NULL,
  `hazardId` int(10) NOT NULL,
  `cause` text NOT NULL,
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `injury_hazard`
--

CREATE TABLE `injury_hazard` (
  `id` int(11) NOT NULL,
  `hazard_id` int(11) NOT NULL,
  `injury` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ramember`
--

CREATE TABLE `ramember` (
  `id` int(11) NOT NULL,
  `signature` varchar(100) NOT NULL DEFAULT 'florencio.png',
  `name` text NOT NULL,
  `stauts` int(11) NOT NULL,
  `designation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ramember`
--

INSERT INTO `ramember` (`id`, `signature`, `name`, `stauts`, `designation`) VALUES
(1, 'jamal.png', 'Jamal', 0, 'Engineer'),
(2, 'dhinesh.png', 'Dhinesh', 0, 'Project Enginner'),
(3, 'sin.png', 'Ng Tian Sin', 0, 'Supervisor'),
(4, 'chai.png', 'Goh Kim Chai', 0, 'Supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `riskassessment`
--

CREATE TABLE `riskassessment` (
  `id` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `location` longtext NOT NULL,
  `process` longtext NOT NULL,
  `createdDate` datetime NOT NULL,
  `approveDate` datetime DEFAULT NULL,
  `revisionDate` datetime DEFAULT NULL,
  `approveBy` int(11) DEFAULT NULL,
  `approverEmail` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 outstanding 1 for draft 2 approved 3 archive',
  `NotifySignatureAdded` int(11) NOT NULL DEFAULT '0',
  `whenViewed` int(11) NOT NULL DEFAULT '0',
  `whenSignatureAdded` int(11) NOT NULL DEFAULT '0',
  `asTemplate` int(11) NOT NULL,
  `sendAttachment` int(11) NOT NULL DEFAULT '0',
  `signingReminders` int(11) NOT NULL DEFAULT '0',
  `sendReminder` int(11) NOT NULL DEFAULT '0',
  `afterFirstReminder` int(11) NOT NULL DEFAULT '0',
  `ecpireReminder` int(11) NOT NULL DEFAULT '0',
  `project_title` varchar(300) NOT NULL,
  `expiry_date` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `risk_ramemeber`
--

CREATE TABLE `risk_ramemeber` (
  `id` int(10) NOT NULL,
  `riskId` int(10) NOT NULL,
  `ramemberId` int(10) NOT NULL,
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `signing`
--

CREATE TABLE `signing` (
  `id` int(11) NOT NULL,
  `riskid` int(11) NOT NULL,
  `name` text NOT NULL,
  `designation` text NOT NULL,
  `email` text NOT NULL,
  `signature` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_login`
--

CREATE TABLE `staff_login` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `designation` text NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(11) NOT NULL,
  `signature` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_login`
--

INSERT INTO `staff_login` (`id`, `email`, `password`, `name`, `designation`, `age`, `sex`, `signature`) VALUES
(1, 'alex@firetronics.com.sg', '123456', 'Alex', 'Safety Supervisor', 40, 'm', 'alex.png'),
(2, 'sankar@firetronics.com.sg', '123456', 'Sankar', 'Safety Supervisor', 40, 'm', 'sankar.png');

-- --------------------------------------------------------

--
-- Table structure for table `workactivity`
--

CREATE TABLE `workactivity` (
  `work_id` int(11) NOT NULL,
  `riskId` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workactivity`
--

INSERT INTO `workactivity` (`work_id`, `riskId`, `name`, `created_by`, `created_on`, `status`) VALUES
(61, 4, 'Operation of Electrical Tools', 'Nalluchamy Muthulingam', '2017-02-23 03:06:58', 0),
(62, 4, 'Operation of mechanical tools', 'Nalluchamy Muthulingam', '2017-02-23 03:06:58', 0),
(63, 4, 'Housekeeping', 'Nalluchamy Muthulingam', '2017-02-23 03:06:58', 0),
(65, 5, 'Cable Pulling using Scaffold/A frame ladder', 'Nalluchamy Muthulingam', '2017-02-23 03:21:14', 0),
(68, 6, 'Performing work at ceiling', 'Nalluchamy Muthulingam', '2017-02-23 03:30:03', 0),
(69, 7, 'Installation of glass at height', 'Nalluchamy Muthulingam', '2017-02-23 03:35:56', 0),
(71, 8, 'Partition Works at height', 'Nalluchamy Muthulingam', '2017-02-23 03:41:40', 0),
(74, 9, 'Prepare materials & tools', 'Nalluchamy Muthulingam', '2017-02-23 03:55:27', 0),
(75, 9, 'Painting at height', 'Nalluchamy Muthulingam', '2017-02-23 03:55:27', 0),
(84, 2, 'Using computer', 'Nalluchamy Muthulingam', '2017-03-06 04:46:01', 0),
(85, 2, 'Lifting of boxes, furniture, office equipment, document files', 'Nalluchamy Muthulingam', '2017-03-06 04:46:01', 0),
(100, 11, 'Pre-insulation Layout and Arrangement', 'Nalluchamy Muthulingam', '2017-03-06 04:49:28', 0),
(101, 11, 'Drilling and Cutting', 'Nalluchamy Muthulingam', '2017-03-06 04:49:28', 0),
(102, 11, 'Fitment Installation', 'Nalluchamy Muthulingam', '2017-03-06 04:49:28', 0),
(103, 11, 'Lamination by Glue and Sealant', 'Nalluchamy Muthulingam', '2017-03-06 04:49:28', 0),
(104, 11, 'Lacquering ', 'Nalluchamy Muthulingam', '2017-03-06 04:49:28', 0),
(105, 11, 'Installation of Door Panels of Handles', 'Nalluchamy Muthulingam', '2017-03-06 04:49:28', 0),
(106, 11, 'Housekeeping', 'Nalluchamy Muthulingam', '2017-03-06 04:49:28', 0),
(122, 12, 'Pre-insulation Layout and Arrangement', 'Nalluchamy Muthulingam', '2017-04-19 09:58:31', 0),
(123, 12, 'Drilling and Cutting', 'Nalluchamy Muthulingam', '2017-04-19 09:58:31', 0),
(124, 12, 'Fitment Installation', 'Nalluchamy Muthulingam', '2017-04-19 09:58:31', 0),
(125, 12, 'Lamination by Glue and Sealant', 'Nalluchamy Muthulingam', '2017-04-19 09:58:31', 0),
(126, 12, 'Lacquering ', 'Nalluchamy Muthulingam', '2017-04-19 09:58:31', 0),
(127, 12, 'Installation of Door Panels of Handles', 'Nalluchamy Muthulingam', '2017-04-19 09:58:31', 0),
(128, 12, 'Housekeeping', 'Nalluchamy Muthulingam', '2017-04-19 09:58:31', 0),
(129, 1, 'Pre-insulation Layout and Arrangement', 'Nalluchamy Muthulingam', '2017-04-19 10:01:19', 0),
(130, 1, 'Drilling and Cutting', 'Nalluchamy Muthulingam', '2017-04-19 10:01:19', 0),
(131, 1, 'Fitment Installation', 'Nalluchamy Muthulingam', '2017-04-19 10:01:19', 0),
(132, 1, 'Lamination by Glue and Sealant', 'Nalluchamy Muthulingam', '2017-04-19 10:01:19', 0),
(133, 1, 'Lacquering ', 'Nalluchamy Muthulingam', '2017-04-19 10:01:19', 0),
(134, 1, 'Installation of Door Panels of Handles', 'Nalluchamy Muthulingam', '2017-04-19 10:01:19', 0),
(135, 1, 'Housekeeping', 'Nalluchamy Muthulingam', '2017-04-19 10:01:19', 0),
(136, 10, 'Hoisting of material using of crane', 'Nalluchamy Muthulingam', '2017-04-19 10:22:06', 0),
(137, 13, 'Pre-insulation Layout and Arrangement', 'Nalluchamy Muthulingam', '2017-04-22 07:39:08', 0),
(138, 13, 'Drilling and Cutting', 'Nalluchamy Muthulingam', '2017-04-22 07:39:08', 0),
(139, 13, 'Fitment Installation', 'Nalluchamy Muthulingam', '2017-04-22 07:39:08', 0),
(140, 13, 'Lamination by Glue and Sealant', 'Nalluchamy Muthulingam', '2017-04-22 07:39:08', 0),
(141, 13, 'Lacquering ', 'Nalluchamy Muthulingam', '2017-04-22 07:39:08', 0),
(142, 13, 'Installation of Door Panels of Handles', 'Nalluchamy Muthulingam', '2017-04-22 07:39:08', 0),
(143, 13, 'Housekeeping', 'Nalluchamy Muthulingam', '2017-04-22 07:39:08', 0),
(144, 14, 'Pre-insulation Layout and Arrangement', 'Nalluchamy Muthulingam', '2017-04-24 11:11:30', 0),
(145, 14, 'Drilling and Cutting', 'Nalluchamy Muthulingam', '2017-04-24 11:11:30', 0),
(146, 14, 'Fitment Installation', 'Nalluchamy Muthulingam', '2017-04-24 11:11:30', 0),
(147, 14, 'Lamination by Glue and Sealant', 'Nalluchamy Muthulingam', '2017-04-24 11:11:30', 0),
(148, 14, 'Lacquering ', 'Nalluchamy Muthulingam', '2017-04-24 11:11:30', 0),
(149, 14, 'Installation of Door Panels of Handles', 'Nalluchamy Muthulingam', '2017-04-24 11:11:30', 0),
(150, 14, 'Housekeeping', 'Nalluchamy Muthulingam', '2017-04-24 11:11:30', 0),
(151, 15, 'Pre-insulation Layout and Arrangement', 'Nalluchamy Muthulingam', '2017-04-24 11:11:59', 0),
(152, 15, 'Drilling and Cutting', 'Nalluchamy Muthulingam', '2017-04-24 11:11:59', 0),
(153, 15, 'Fitment Installation', 'Nalluchamy Muthulingam', '2017-04-24 11:11:59', 0),
(154, 15, 'Lamination by Glue and Sealant', 'Nalluchamy Muthulingam', '2017-04-24 11:11:59', 0),
(155, 15, 'Lacquering ', 'Nalluchamy Muthulingam', '2017-04-24 11:11:59', 0),
(156, 15, 'Installation of Door Panels of Handles', 'Nalluchamy Muthulingam', '2017-04-24 11:11:59', 0),
(157, 15, 'Housekeeping', 'Nalluchamy Muthulingam', '2017-04-24 11:11:59', 0),
(165, 3, 'Pre-insulation Layout and Arrangement', 'Nalluchamy Muthulingam', '2017-05-03 05:02:19', 0),
(166, 3, 'Drilling and Cutting', 'Nalluchamy Muthulingam', '2017-05-03 05:02:19', 0),
(167, 3, 'Fitment Installation', 'Nalluchamy Muthulingam', '2017-05-03 05:02:19', 0),
(168, 3, 'Lamination by Glue and Sealant', 'Nalluchamy Muthulingam', '2017-05-03 05:02:19', 0),
(169, 3, 'Lacquering ', 'Nalluchamy Muthulingam', '2017-05-03 05:02:19', 0),
(170, 3, 'Installation of Door Panels of Handles', 'Nalluchamy Muthulingam', '2017-05-03 05:02:19', 0),
(171, 3, 'Housekeeping', 'Nalluchamy Muthulingam', '2017-05-03 05:02:19', 0),
(172, 16, 'installing power point', 'Nalluchamy Muthulingam', '2017-05-12 10:58:42', 0),
(180, 17, 'Pre-insulation Layout and Arrangement', 'Nalluchamy Muthulingam', '2017-05-12 11:04:35', 0),
(181, 17, 'Drilling and Cutting', 'Nalluchamy Muthulingam', '2017-05-12 11:04:35', 0),
(182, 17, 'Fitment Installation', 'Nalluchamy Muthulingam', '2017-05-12 11:04:35', 0),
(183, 17, 'Lamination by Glue and Sealant', 'Nalluchamy Muthulingam', '2017-05-12 11:04:35', 0),
(184, 17, 'Lacquering ', 'Nalluchamy Muthulingam', '2017-05-12 11:04:35', 0),
(185, 17, 'Installation of Door Panels of Handles', 'Nalluchamy Muthulingam', '2017-05-12 11:04:35', 0),
(186, 17, 'Housekeeping', 'Nalluchamy Muthulingam', '2017-05-12 11:04:35', 0),
(188, 19, 'unload material', 'Nalluchamy Muthulingam', '2017-06-01 12:34:53', 0),
(189, 19, 'Install hoarding', 'Nalluchamy Muthulingam', '2017-06-01 12:34:53', 0),
(191, 20, 'Working at height', 'Nalluchamy Muthulingam', '2017-06-01 12:45:27', 0),
(192, 21, 'Working using of ladder', 'Nalluchamy Muthulingam', '2017-06-01 12:50:43', 0),
(194, 18, 'Hacking using electric breaker', 'Nalluchamy Muthulingam', '2017-06-01 13:21:27', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actionofficer`
--
ALTER TABLE `actionofficer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `approvingmanager`
--
ALTER TABLE `approvingmanager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hazard`
--
ALTER TABLE `hazard`
  ADD PRIMARY KEY (`hazard_id`);

--
-- Indexes for table `hazard_actionofficer`
--
ALTER TABLE `hazard_actionofficer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hazard_cause`
--
ALTER TABLE `hazard_cause`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `injury_hazard`
--
ALTER TABLE `injury_hazard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ramember`
--
ALTER TABLE `ramember`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riskassessment`
--
ALTER TABLE `riskassessment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `risk_ramemeber`
--
ALTER TABLE `risk_ramemeber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signing`
--
ALTER TABLE `signing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_login`
--
ALTER TABLE `staff_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workactivity`
--
ALTER TABLE `workactivity`
  ADD PRIMARY KEY (`work_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actionofficer`
--
ALTER TABLE `actionofficer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `approvingmanager`
--
ALTER TABLE `approvingmanager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hazard`
--
ALTER TABLE `hazard`
  MODIFY `hazard_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hazard_actionofficer`
--
ALTER TABLE `hazard_actionofficer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hazard_cause`
--
ALTER TABLE `hazard_cause`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `injury_hazard`
--
ALTER TABLE `injury_hazard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ramember`
--
ALTER TABLE `ramember`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `riskassessment`
--
ALTER TABLE `riskassessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `risk_ramemeber`
--
ALTER TABLE `risk_ramemeber`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `signing`
--
ALTER TABLE `signing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_login`
--
ALTER TABLE `staff_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `workactivity`
--
ALTER TABLE `workactivity`
  MODIFY `work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
