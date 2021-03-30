-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2021 at 06:00 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Id` int(11) NOT NULL,
  `Username` varchar(50) COLLATE utf8_bin NOT NULL,
  `Password` mediumtext COLLATE utf8_bin NOT NULL,
  `Email` varchar(100) COLLATE utf8_bin NOT NULL,
  `Phone` varchar(12) COLLATE utf8_bin NOT NULL,
  `Address` varchar(200) COLLATE utf8_bin NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `OTP` varchar(20) COLLATE utf8_bin NOT NULL,
  `Class_Id` int(11) DEFAULT NULL,
  `Account_Type` int(11) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Create_By` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Id`, `Username`, `Password`, `Email`, `Phone`, `Address`, `IsActive`, `OTP`, `Class_Id`, `Account_Type`, `Create_Date`, `Create_By`, `Status`) VALUES
(1, 'admin', '$2a$10$N11k8TnV8ZHJGxACunoRhu9TAFf80xXedqR70zWvQOo.CoFl4rkuW', 'admin@gmail.com', '0868946944', 'Tây Ninh', 0, '', NULL, 1, '2021-03-28 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `Id` int(11) NOT NULL,
  `Content` varchar(200) COLLATE utf8_bin NOT NULL,
  `IsCorrect` tinyint(1) NOT NULL,
  `Question_Id` int(11) DEFAULT NULL,
  `Create_Date` datetime NOT NULL,
  `Create_By` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) COLLATE utf8_bin NOT NULL,
  `Techer_Id` int(11) DEFAULT NULL,
  `Create_Date` datetime NOT NULL,
  `Create_By` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`Id`, `Name`, `Techer_Id`, `Create_Date`, `Create_By`, `Status`) VALUES
(1, 'C1808G2', NULL, '2021-03-28 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `classes_subject`
--

CREATE TABLE `classes_subject` (
  `Id` int(11) NOT NULL,
  `Classes_Id` int(11) DEFAULT NULL,
  `Subject_Id` int(11) DEFAULT NULL,
  `Create_Date` datetime NOT NULL,
  `Create_By` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `Id` int(11) NOT NULL,
  `Classes_Subject_Id` int(11) DEFAULT NULL,
  `Name` varchar(200) COLLATE utf8_bin NOT NULL,
  `Code` varchar(20) COLLATE utf8_bin NOT NULL,
  `Type` int(11) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Create_By` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `Id` int(11) NOT NULL,
  `Content` varchar(250) COLLATE utf8_bin NOT NULL,
  `Answer_Type` int(11) NOT NULL,
  `Question_Type` int(11) NOT NULL,
  `Exam_Id` int(11) DEFAULT NULL,
  `Order` int(11) NOT NULL,
  `Image` varchar(200) COLLATE utf8_bin NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Create_By` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) COLLATE utf8_bin NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Create_By` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Class_Id` (`Class_Id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Question_Id` (`Question_Id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Techer_Id` (`Techer_Id`),
  ADD KEY `Techer_Id_2` (`Techer_Id`);

--
-- Indexes for table `classes_subject`
--
ALTER TABLE `classes_subject`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Classes_Id` (`Classes_Id`,`Subject_Id`),
  ADD KEY `Subject_Id` (`Subject_Id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Classes_Subject_Id` (`Classes_Subject_Id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Exam_Id` (`Exam_Id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classes_subject`
--
ALTER TABLE `classes_subject`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`Question_Id`) REFERENCES `question` (`Id`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`Techer_Id`) REFERENCES `account` (`Id`);

--
-- Constraints for table `classes_subject`
--
ALTER TABLE `classes_subject`
  ADD CONSTRAINT `classes_subject_ibfk_1` FOREIGN KEY (`Subject_Id`) REFERENCES `subject` (`Id`),
  ADD CONSTRAINT `classes_subject_ibfk_2` FOREIGN KEY (`Classes_Id`) REFERENCES `classes` (`Id`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`Classes_Subject_Id`) REFERENCES `classes_subject` (`Id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`Exam_Id`) REFERENCES `exam` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
