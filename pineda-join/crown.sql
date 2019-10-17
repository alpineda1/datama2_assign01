-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2019 at 08:54 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crown`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `cust_fname` varchar(45) NOT NULL,
  `cust_mi` varchar(45) NOT NULL,
  `cust_lname` varchar(45) NOT NULL,
  `cust_cont` int(12) NOT NULL,
  `cust_add` varchar(45) NOT NULL,
  `cust_eadd` varchar(45) NOT NULL,
  `cust_job` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `cust_fname`, `cust_mi`, `cust_lname`, `cust_cont`, `cust_add`, `cust_eadd`, `cust_job`) VALUES
(1, 'Zea', 'R', 'Saintsbury', 2147483647, '5443 Brickson Park Road', 'zsaintsbury0@upenn.edu', 'Financial Advisor'),
(2, 'Clemmie', 'F', 'Mayall', 2147483647, '0 Transport Court', 'cmayall1@canalblog.com', 'Developer III'),
(3, 'Oliviero', 'G', 'Newdick', 927043487, '087 Oak Crossing', 'onewdick2@t.co', 'Help Desk Operator'),
(4, 'Maxine', 'O', 'Fairlamb', 927043487, '8974 Caliangt Pass', 'mfairlamb3@reddit.com', 'GIS Technical Architect'),
(5, 'Lamond', 'V', 'Althorp', 927043487, '73 Duke Circle', 'lalthorp4@lulu.com', 'Design Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `item_color` varchar(50) DEFAULT NULL,
  `item_qty` varchar(50) DEFAULT NULL,
  `bldg_add` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `item_name`, `item_color`, `item_qty`, `bldg_add`) VALUES
(1, 'Hillard', 'Orange', 'Schelle', '6750 Maple Wood Road'),
(2, 'Carmelita', 'Blue', 'Hattiff', '36 Coleman Drive'),
(3, 'Leodora', 'Maroon', 'Kowalski', '83203 Kim Terrace'),
(4, 'Adolph', 'Goldenrod', 'Vogelein', '52 Stang Park'),
(5, 'Ransell', 'Pink', 'Flarity', '2322 Summerview Avenue');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(12) NOT NULL,
  `order_date` varchar(45) NOT NULL,
  `order_desc` varchar(45) NOT NULL,
  `order_pick_up` varchar(45) NOT NULL,
  `order_drop_off` varchar(45) NOT NULL,
  `order_is_completed` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_date`, `order_desc`, `order_pick_up`, `order_drop_off`, `order_is_completed`) VALUES
(1, '11/1/2018', 'Control Bleeding in Peritoneal Cavity, Percut', '8/14/2019', '8/22/2019', '0'),
(2, '9/8/2019', 'Replace of Low Tooth, Sing, with Autol Sub, O', '8/7/2019', '5/30/2019', '1'),
(3, '9/2/2019', 'Insertion of Infusion Device into GI Tract, O', '10/2/2019', '4/8/2019', '1'),
(4, '2/2/2019', 'Removal of Autol Sub from Pancreat Duct, Perc', '1/25/2019', '2/10/2019', '0'),
(5, '8/9/2019', 'Reposition Right Palatine Bone with Int Fix, ', '5/25/2019', '3/28/2019', '0');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  `payment_amt` decimal(45,0) NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `payment_type`, `payment_amt`, `payment_date`) VALUES
(1, 'jcb', '0', '0000-00-00'),
(2, 'instapayment', '0', '0000-00-00'),
(3, 'visa-electron', '0', '0000-00-00'),
(4, 'jcb', '0', '0000-00-00'),
(5, 'switch', '0', '0000-00-00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
