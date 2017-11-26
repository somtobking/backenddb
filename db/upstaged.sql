-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 26, 2017 at 11:47 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upstaged`
--

-- --------------------------------------------------------

--
-- Table structure for table `crew`
--

CREATE TABLE `crew` (
  `user_id` int(11) NOT NULL,
  `crewName` varchar(45) NOT NULL,
  `crewRole` varchar(45) NOT NULL,
  `show_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crew`
--

INSERT INTO `crew` (`user_id`, `crewName`, `crewRole`, `show_id`) VALUES
(3, 'crewName1', 'Role1', 6),
(4, 'crewName2', 'Role2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cues`
--

CREATE TABLE `cues` (
  `cue_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `cueName` varchar(45) NOT NULL,
  `cueActionCall` varchar(30) NOT NULL,
  `cueType` varchar(30) NOT NULL,
  `Called?` tinyint(1) NOT NULL,
  `Edit` varchar(30) NOT NULL,
  `cueDelete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cues`
--

INSERT INTO `cues` (`cue_id`, `show_id`, `cueName`, `cueActionCall`, `cueType`, `Called?`, `Edit`, `cueDelete`) VALUES
(1, 6, 'name1', 'anything', 'lights', 0, '', 0),
(2, 5, 'name3', 'anything3', 'lights3', 0, '', 0),
(3, 5, 'name4', 'anything4', 'lights4', 0, '', 0),
(6, 5, 'name2', 'anything2', 'lights2', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `show_id` int(11) NOT NULL,
  `showName` varchar(45) NOT NULL,
  `Describtion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `showName`, `Describtion`) VALUES
(1, 'first show', 'action'),
(2, 'second show', 'drama'),
(3, 'third show', 'animation'),
(4, 'fourth show', 'comdey'),
(5, 'fifth show', 'romantic'),
(6, 'sixth show', 'cartoon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crew`
--
ALTER TABLE `crew`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `show_id` (`show_id`);

--
-- Indexes for table `cues`
--
ALTER TABLE `cues`
  ADD PRIMARY KEY (`cue_id`),
  ADD KEY `show_id` (`show_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`show_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crew`
--
ALTER TABLE `crew`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cues`
--
ALTER TABLE `cues`
  MODIFY `cue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `crew`
--
ALTER TABLE `crew`
  ADD CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`);

--
-- Constraints for table `cues`
--
ALTER TABLE `cues`
  ADD CONSTRAINT `cues_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
