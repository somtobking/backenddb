-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 30, 2017 at 01:42 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upstagged`
--

-- --------------------------------------------------------

--
-- Table structure for table `crew`
--

CREATE TABLE `crew` (
  `user_id` int(11) NOT NULL,
  `crewName` varchar(45) NOT NULL,
  `crewRole` varchar(45) NOT NULL,
  `show_id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_num` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crew`
--

INSERT INTO `crew` (`user_id`, `crewName`, `crewRole`, `show_id`, `email`, `phone_num`) VALUES
(1038, 'Romeo', 'Cast', 1, 'sofylovesbub@hotmail.com', 2031678939),
(1088, 'Juliet', 'Cast', 1, 'crobinson@gmail.com', 2041590939),
(1230, 'Captain Prince', 'Crew', 1, 'cprince@yahoo.com', 2034569703),
(1234, 'Tybalt', 'Cast', 1, 'clintondix@yahoo.com', 2147483647),
(1239, 'Horatio', 'Cast', 2, 'shayt@yahoo.com', 2045672356),
(1464, 'Mercutio', 'Cast', 1, 'Jwatson@yahoo.com', 2035683292),
(1568, 'Father Laurence', 'Cast', 1, 'dmack@aol.com', 2146892012),
(1663, 'Polonius', 'Cast', 2, 'Norastec@tele.us', 2123468906),
(1834, 'Hamlet', 'Cast', 2, 'VirginiaGJimenez@gmail.com', 2143268078),
(1905, 'Claudius, King of Denmark', 'Cast', 2, 'wadelcompton@tele.us', 2106087454),
(1906, 'Player Queen', 'Crew', 2, 'adloworu@gmail.com', 2123623245);

-- --------------------------------------------------------

--
-- Table structure for table `cues`
--

CREATE TABLE `cues` (
  `cue_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `cueName` varchar(100) NOT NULL,
  `cueActionCall` varchar(100) NOT NULL,
  `cueType` varchar(30) NOT NULL,
  `Called` int(10) DEFAULT NULL,
  `Edit` varchar(30) NOT NULL,
  `cueDelete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cues`
--

INSERT INTO `cues` (`cue_id`, `show_id`, `cueName`, `cueActionCall`, `cueType`, `Called`, `Edit`, `cueDelete`) VALUES
(1, 1, 'Lights off', 'After a romantic scene', 'Lights', 0, '', 0),
(2, 1, 'Lights on', 'When actor walks on stage', 'Lights', 0, '', 0),
(3, 2, 'Lights off', 'When actor walks off stage', 'Lights', 0, '', 0),
(4, 2, 'Music', 'After last scene of show', 'Sound', 0, '', 0),
(5, 1, 'Lights off', 'After action scene', 'Lights', 0, '', 0),
(6, 2, 'Background color change', 'when character switches ', 'Background Change', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `show_id` int(11) NOT NULL,
  `showName` varchar(45) NOT NULL,
  `Description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `showName`, `Description`) VALUES
(1, 'Romeo and Juliet', 'Romance and Drama'),
(2, 'Hamlet', 'Drama ');

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1907;
--
-- AUTO_INCREMENT for table `cues`
--
ALTER TABLE `cues`
  MODIFY `cue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
