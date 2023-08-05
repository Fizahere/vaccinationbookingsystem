-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2023 at 05:45 PM
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
-- Database: `vaccinationbookingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adminID` int(11) NOT NULL,
  `adminName` varchar(250) NOT NULL,
  `adminEmail` varchar(250) NOT NULL,
  `adminPassword` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminID`, `adminName`, `adminEmail`, `adminPassword`) VALUES
(1, 'admin1', 'admin@gmail.com', 'admin1ps'),
(2, 'admin2', 'admin2@gmail.com', 'admin2ps');

-- --------------------------------------------------------

--
-- Table structure for table `children_details`
--

CREATE TABLE `children_details` (
  `childID` int(11) NOT NULL,
  `childName` varchar(250) NOT NULL,
  `childGender` enum('male','female','others') NOT NULL,
  `childAge` int(11) NOT NULL,
  `hospitalID` int(11) DEFAULT NULL,
  `vaccineID` int(11) DEFAULT NULL,
  `vaccinationDate` date NOT NULL,
  `parentID` int(11) DEFAULT NULL,
  `contact` int(11) NOT NULL,
  `appointmentStatus` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending'
) ;

--
-- Dumping data for table `children_details`
--

INSERT INTO `children_details` (`childID`, `childName`, `childGender`, `childAge`, `hospitalID`, `vaccineID`, `vaccinationDate`, `parentID`, `contact`, `appointmentStatus`) VALUES
(1, 'childA', 'female', 14, 2, 5, '2023-07-27', 5, 29383773, 'rejected'),
(2, 'childB', 'male', 17, 4, 5, '2023-08-11', 8, 9823734, 'rejected'),
(3, 'childC', 'male', 17, 4, 3, '2023-07-17', 7, 198230, 'rejected'),
(4, 'childD', 'female', 19, 8, 4, '2023-08-19', 2, 109283, 'rejected'),
(5, 'childE', 'male', 18, 8, 5, '2023-07-19', 1, 98198298, 'approved'),
(6, 'childF', 'female', 15, 7, 4, '2023-07-18', 7, 96765, 'approved'),
(7, 'childG', 'female', 13, 7, 5, '2023-09-14', 6, 97821, 'approved'),
(8, 'childh', 'female', 19, 2, 6, '2023-07-22', 2, 93223, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_login`
--

CREATE TABLE `hospital_login` (
  `hospitalID` int(11) NOT NULL,
  `hospitalName` varchar(250) NOT NULL,
  `hospitalEmail` varchar(250) NOT NULL,
  `hospitalPassword` varchar(250) NOT NULL,
  `hospitalLocation` varchar(250) NOT NULL,
  `hospitalStatus` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital_login`
--

INSERT INTO `hospital_login` (`hospitalID`, `hospitalName`, `hospitalEmail`, `hospitalPassword`, `hospitalLocation`, `hospitalStatus`) VALUES
(1, 'hospitalA', 'hospitala@gmail.com', 'hospitalaps', 'no location', 'rejected'),
(2, 'hospitalb', 'hospitalb@gmail.com', 'hospitalbps', 'underground', 'approved'),
(4, 'hospitald', 'hospitald@gmail.xom', 'hospitaldps', 'sky', 'approved'),
(7, 'hospitalG', 'hospitalG@gmail.com', 'hospitalGps', 'moon', 'approved'),
(8, 'hospitalH', 'hospitalH@gmail.com', 'hospitalGps', 'star', 'approved'),
(9, '', '', '', '', 'rejected'),
(10, 'abc', 'abc@gmail.com', '1234', '---', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `parent_login`
--

CREATE TABLE `parent_login` (
  `parentID` int(11) NOT NULL,
  `parentName` varchar(250) NOT NULL,
  `parentEmail` varchar(250) NOT NULL,
  `parentPassword` varchar(250) NOT NULL,
  `parentStatus` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parent_login`
--

INSERT INTO `parent_login` (`parentID`, `parentName`, `parentEmail`, `parentPassword`, `parentStatus`) VALUES
(1, 'parentA', 'parenta@gmail.com', 'parent1ps', 'approved'),
(2, 'parent2', 'parent2@gmail.com', 'parent2', 'approved'),
(5, 'parentC', 'parentC@gmail.com', 'parentCps', 'approved'),
(6, 'parentD', 'parentD@gmail.com', 'parentDps', 'approved'),
(7, 'parentJ', 'parentJ@gmail.com', 'parentJps', 'approved'),
(8, 'parentL', 'parentL@gmail.com', 'parentLps', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_details`
--

CREATE TABLE `vaccine_details` (
  `vaccineID` int(11) NOT NULL,
  `vaccineName` varchar(250) NOT NULL,
  `vaccineStock` int(11) NOT NULL,
  `hospitalID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaccine_details`
--

INSERT INTO `vaccine_details` (`vaccineID`, `vaccineName`, `vaccineStock`, `hospitalID`) VALUES
(1, 'vaccineA', 20, 1),
(2, 'vaccineB', 22, NULL),
(3, 'vaccineC', 89, NULL),
(4, 'vaccineD', 88, 2),
(5, 'vaccineE', 90, 4),
(6, 'vaccineF', 100, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `adminEmail` (`adminEmail`);

--
-- Indexes for table `children_details`
--
ALTER TABLE `children_details`
  ADD PRIMARY KEY (`childID`),
  ADD KEY `hospitalID` (`hospitalID`),
  ADD KEY `parentID` (`parentID`),
  ADD KEY `vaccineID` (`vaccineID`);

--
-- Indexes for table `hospital_login`
--
ALTER TABLE `hospital_login`
  ADD PRIMARY KEY (`hospitalID`),
  ADD UNIQUE KEY `hospitalEmail` (`hospitalEmail`),
  ADD UNIQUE KEY `hospitalEmail_2` (`hospitalEmail`),
  ADD UNIQUE KEY `hospitalEmail_3` (`hospitalEmail`);

--
-- Indexes for table `parent_login`
--
ALTER TABLE `parent_login`
  ADD PRIMARY KEY (`parentID`),
  ADD UNIQUE KEY `parentEmail` (`parentEmail`),
  ADD UNIQUE KEY `parentEmail_2` (`parentEmail`);

--
-- Indexes for table `vaccine_details`
--
ALTER TABLE `vaccine_details`
  ADD PRIMARY KEY (`vaccineID`),
  ADD KEY `hospitalConstraint` (`hospitalID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `children_details`
--
ALTER TABLE `children_details`
  MODIFY `childID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital_login`
--
ALTER TABLE `hospital_login`
  MODIFY `hospitalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `parent_login`
--
ALTER TABLE `parent_login`
  MODIFY `parentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vaccine_details`
--
ALTER TABLE `vaccine_details`
  MODIFY `vaccineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `children_details`
--
ALTER TABLE `children_details`
  ADD CONSTRAINT `hospitalID` FOREIGN KEY (`hospitalID`) REFERENCES `hospital_login` (`hospitalID`) ON DELETE SET NULL,
  ADD CONSTRAINT `parentID` FOREIGN KEY (`parentID`) REFERENCES `parent_login` (`parentID`) ON DELETE SET NULL,
  ADD CONSTRAINT `vaccineID` FOREIGN KEY (`vaccineID`) REFERENCES `vaccine_details` (`vaccineID`) ON DELETE SET NULL;

--
-- Constraints for table `vaccine_details`
--
ALTER TABLE `vaccine_details`
  ADD CONSTRAINT `hospital_id` FOREIGN KEY (`hospitalID`) REFERENCES `hospital_login` (`hospitalID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
