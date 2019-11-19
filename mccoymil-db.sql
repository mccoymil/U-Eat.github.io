-- phpMyAdmin SQL Dump
-- version 2.11.9.4
-- http://www.phpmyadmin.net
--
-- Host: oniddb
-- Generation Time: Nov 19, 2019 at 12:45 PM
-- Server version: 5.5.62
-- PHP Version: 5.2.6-1+lenny16

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mccoymil-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu_item`
--

CREATE TABLE IF NOT EXISTS `menu_item` (
  `menuItemID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `Price` int(11) NOT NULL,
  `ResID` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuItemID`),
  KEY `ResID` (`ResID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `menu_item`
--

INSERT INTO `menu_item` (`menuItemID`, `Name`, `Price`, `ResID`) VALUES
(1, 'Chicken Tenders', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_number` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `readyTime` int(11) NOT NULL,
  `item` varchar(128) NOT NULL,
  PRIMARY KEY (`order_number`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--


-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE IF NOT EXISTS `restaurant` (
  `ResID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `street` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `state` varchar(128) NOT NULL,
  `zip` int(5) NOT NULL,
  PRIMARY KEY (`ResID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`ResID`, `username`, `password`, `name`, `street`, `city`, `state`, `zip`) VALUES
(1, 'newRes', '1234', 'Res One', '1256 Main Street', 'Boise', 'ID', 83716);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `userID` int(11) NOT NULL,
  `resID` int(11) NOT NULL,
  `review` longtext NOT NULL,
  PRIMARY KEY (`userID`,`resID`),
  KEY `resID` (`resID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL,
  `userName` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD CONSTRAINT `menu_item_ibfk_1` FOREIGN KEY (`ResID`) REFERENCES `restaurant` (`ResID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE SET NULL;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`resID`) REFERENCES `restaurant` (`ResID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION;
