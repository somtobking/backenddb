-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 27, 2017 at 11:30 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `upstagged`
--

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
(1, 1, 'Lights off', 'After a romantic scene', 'Lights', 0, '', 0),
(2, 1, 'Lights on', 'When actor walks on stage', 'Lights', 0, '', 0),
(3, 2, 'Lights off', 'When actor walks off stage', 'Lights', 0, '', 0),
(4, 2, 'Music', 'After last scene of show', 'Sound', 0, '', 0),
(5, 4, 'Lights off', 'After action scene', 'Lights', 0, '', 0),
(6, 3, 'Background color change', 'when character switches ', 'Background Change', 0, '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cues`
--
ALTER TABLE `cues`
  ADD PRIMARY KEY (`cue_id`),
  ADD KEY `show_id` (`show_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cues`
--
ALTER TABLE `cues`
  MODIFY `cue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
