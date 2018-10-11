-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 10, 2018 at 12:59 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employees`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `current_dept_emp`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `current_dept_emp`;
CREATE TABLE IF NOT EXISTS `current_dept_emp` (
`emp_no` int(11)
,`dept_no` char(4)
,`from_date` date
,`to_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_no`, `dept_name`) VALUES
('d009', 'Customer Service'),
('d005', 'Development'),
('d002', 'Finance'),
('d003', 'Human Resources'),
('d001', 'Marketing/Distribution'),
('d004', 'Production'),
('d006', 'Quality Management'),
('d008', 'Research'),
('d007', 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `dept_emp`
--

DROP TABLE IF EXISTS `dept_emp`;
CREATE TABLE IF NOT EXISTS `dept_emp` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_emp`
--

INSERT INTO `dept_emp` (`emp_no`, `dept_no`, `from_date`, `to_date`) VALUES
(10001, 'd005', '1986-06-26', '9999-01-01'),
(10002, 'd007', '1996-08-03', '9999-01-01'),
(10003, 'd004', '1995-12-03', '9999-01-01'),
(10004, 'd004', '1986-12-01', '9999-01-01'),
(10005, 'd003', '1989-09-12', '9999-01-01'),
(10006, 'd005', '1990-08-05', '9999-01-01'),
(10007, 'd008', '1989-02-10', '9999-01-01'),
(10008, 'd005', '1998-03-11', '2000-07-31'),
(10009, 'd006', '1985-02-18', '9999-01-01'),
(10010, 'd004', '1996-11-24', '2000-06-26'),
(10010, 'd006', '2000-06-26', '9999-01-01'),
(10011, 'd009', '1990-01-22', '1996-11-09'),
(10012, 'd005', '1992-12-18', '9999-01-01'),
(10013, 'd003', '1985-10-20', '9999-01-01'),
(10014, 'd005', '1993-12-29', '9999-01-01'),
(10015, 'd008', '1992-09-19', '1993-08-22'),
(10016, 'd007', '1998-02-11', '9999-01-01'),
(10017, 'd001', '1993-08-03', '9999-01-01'),
(10018, 'd004', '1992-07-29', '9999-01-01'),
(10018, 'd005', '1987-04-03', '1992-07-29'),
(10019, 'd008', '1999-04-30', '9999-01-01'),
(10020, 'd004', '1997-12-30', '9999-01-01'),
(10021, 'd005', '1988-02-10', '2002-07-15'),
(10022, 'd005', '1999-09-03', '9999-01-01'),
(10023, 'd005', '1999-09-27', '9999-01-01'),
(10024, 'd004', '1998-06-14', '9999-01-01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `dept_emp_latest_date`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `dept_emp_latest_date`;
CREATE TABLE IF NOT EXISTS `dept_emp_latest_date` (
`emp_no` int(11)
,`from_date` date
,`to_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `dept_manager`
--

DROP TABLE IF EXISTS `dept_manager`;
CREATE TABLE IF NOT EXISTS `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  `grid_no` int(11) DEFAULT '1',
  PRIMARY KEY (`emp_no`),
  KEY `fk_employees_salaries_grid_idx` (`grid_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date`, `grid_no`) VALUES
(10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26', NULL),
(10002, '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21', NULL),
(10003, '1959-12-03', 'Parto', 'Bamford', 'M', '1986-08-28', NULL),
(10004, '1954-05-01', 'Chirstian', 'Koblick', 'M', '1986-12-01', NULL),
(10005, '1955-01-21', 'Kyoichi', 'Maliniak', 'M', '1989-09-12', NULL),
(10006, '1953-04-20', 'Anneke', 'Preusig', 'F', '1989-06-02', NULL),
(10007, '1957-05-23', 'Tzvetan', 'Zielinski', 'F', '1989-02-10', NULL),
(10008, '1958-02-19', 'Saniya', 'Kalloufi', 'M', '1994-09-15', NULL),
(10009, '1952-04-19', 'Sumant', 'Peac', 'F', '1985-02-18', NULL),
(10010, '1963-06-01', 'Duangkaew', 'Piveteau', 'F', '1989-08-24', NULL),
(10011, '1953-11-07', 'Mary', 'Sluis', 'F', '1990-01-22', NULL),
(10012, '1960-10-04', 'Patricio', 'Bridgland', 'M', '1992-12-18', NULL),
(10013, '1963-06-07', 'Eberhardt', 'Terkki', 'M', '1985-10-20', NULL),
(10014, '1956-02-12', 'Berni', 'Genin', 'M', '1987-03-11', NULL),
(10015, '1959-08-19', 'Guoxiang', 'Nooteboom', 'M', '1987-07-02', NULL),
(10016, '1961-05-02', 'Kazuhito', 'Cappelletti', 'M', '1995-01-27', NULL),
(10017, '1958-07-06', 'Cristinel', 'Bouloucos', 'F', '1993-08-03', NULL),
(10018, '1954-06-19', 'Kazuhide', 'Peha', 'F', '1987-04-03', NULL),
(10019, '1953-01-23', 'Lillian', 'Haddadi', 'M', '1999-04-30', NULL),
(10020, '1952-12-24', 'Mayuko', 'Warwick', 'M', '1991-01-26', NULL),
(10021, '1960-02-20', 'Ramzi', 'Erde', 'M', '1988-02-10', NULL),
(10022, '1952-07-08', 'Shahaf', 'Famili', 'M', '1995-08-22', NULL),
(10023, '1953-09-29', 'Bojan', 'Montemayor', 'F', '1989-12-17', NULL),
(10024, '1958-09-05', 'Suzette', 'Pettey', 'F', '1997-05-19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
CREATE TABLE IF NOT EXISTS `salaries` (
  `emp_no` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`emp_no`, `salary`, `from_date`, `to_date`) VALUES
(10001, 60117, '1986-06-26', '1987-06-26'),
(10001, 62102, '1987-06-26', '1988-06-25'),
(10001, 66074, '1988-06-25', '1989-06-25'),
(10001, 66596, '1989-06-25', '1990-06-25'),
(10001, 66961, '1990-06-25', '1991-06-25'),
(10001, 71046, '1991-06-25', '1992-06-24'),
(10001, 74333, '1992-06-24', '1993-06-24'),
(10001, 75286, '1993-06-24', '1994-06-24'),
(10001, 75994, '1994-06-24', '1995-06-24'),
(10001, 76884, '1995-06-24', '1996-06-23'),
(10001, 80013, '1996-06-23', '1997-06-23'),
(10001, 81025, '1997-06-23', '1998-06-23'),
(10001, 81097, '1998-06-23', '1999-06-23'),
(10001, 84917, '1999-06-23', '2000-06-22'),
(10001, 85112, '2000-06-22', '2001-06-22'),
(10001, 85097, '2001-06-22', '2002-06-22'),
(10001, 88958, '2002-06-22', '9999-01-01'),
(10002, 65828, '1996-08-03', '1997-08-03'),
(10002, 65909, '1997-08-03', '1998-08-03'),
(10002, 67534, '1998-08-03', '1999-08-03'),
(10002, 69366, '1999-08-03', '2000-08-02'),
(10002, 71963, '2000-08-02', '2001-08-02'),
(10002, 72527, '2001-08-02', '9999-01-01'),
(10003, 40006, '1995-12-03', '1996-12-02'),
(10003, 43616, '1996-12-02', '1997-12-02'),
(10003, 43466, '1997-12-02', '1998-12-02'),
(10003, 43636, '1998-12-02', '1999-12-02'),
(10003, 43478, '1999-12-02', '2000-12-01'),
(10003, 43699, '2000-12-01', '2001-12-01'),
(10003, 43311, '2001-12-01', '9999-01-01'),
(10004, 40054, '1986-12-01', '1987-12-01'),
(10004, 42283, '1987-12-01', '1988-11-30'),
(10004, 42542, '1988-11-30', '1989-11-30'),
(10004, 46065, '1989-11-30', '1990-11-30'),
(10004, 48271, '1990-11-30', '1991-11-30'),
(10004, 50594, '1991-11-30', '1992-11-29'),
(10004, 52119, '1992-11-29', '1993-11-29'),
(10004, 54693, '1993-11-29', '1994-11-29'),
(10004, 58326, '1994-11-29', '1995-11-29'),
(10004, 60770, '1995-11-29', '1996-11-28'),
(10004, 62566, '1996-11-28', '1997-11-28'),
(10004, 64340, '1997-11-28', '1998-11-28'),
(10004, 67096, '1998-11-28', '1999-11-28'),
(10004, 69722, '1999-11-28', '2000-11-27'),
(10004, 70698, '2000-11-27', '2001-11-27'),
(10004, 74057, '2001-11-27', '9999-01-01'),
(10005, 78228, '1989-09-12', '1990-09-12'),
(10005, 82621, '1990-09-12', '1991-09-12'),
(10005, 83735, '1991-09-12', '1992-09-11'),
(10005, 85572, '1992-09-11', '1993-09-11'),
(10005, 85076, '1993-09-11', '1994-09-11'),
(10005, 86050, '1994-09-11', '1995-09-11'),
(10005, 88448, '1995-09-11', '1996-09-10'),
(10005, 88063, '1996-09-10', '1997-09-10'),
(10005, 89724, '1997-09-10', '1998-09-10'),
(10005, 90392, '1998-09-10', '1999-09-10'),
(10005, 90531, '1999-09-10', '2000-09-09'),
(10005, 91453, '2000-09-09', '2001-09-09'),
(10005, 94692, '2001-09-09', '9999-01-01'),
(10006, 40000, '1990-08-05', '1991-08-05'),
(10006, 42085, '1991-08-05', '1992-08-04'),
(10006, 42629, '1992-08-04', '1993-08-04'),
(10006, 45844, '1993-08-04', '1994-08-04'),
(10006, 47518, '1994-08-04', '1995-08-04'),
(10006, 47917, '1995-08-04', '1996-08-03'),
(10006, 52255, '1996-08-03', '1997-08-03'),
(10006, 53747, '1997-08-03', '1998-08-03'),
(10006, 56032, '1998-08-03', '1999-08-03'),
(10006, 58299, '1999-08-03', '2000-08-02'),
(10006, 60098, '2000-08-02', '2001-08-02'),
(10006, 59755, '2001-08-02', '9999-01-01'),
(10007, 56724, '1989-02-10', '1990-02-10'),
(10007, 60740, '1990-02-10', '1991-02-10'),
(10007, 62745, '1991-02-10', '1992-02-10'),
(10007, 63475, '1992-02-10', '1993-02-09'),
(10007, 63208, '1993-02-09', '1994-02-09'),
(10007, 64563, '1994-02-09', '1995-02-09'),
(10007, 68833, '1995-02-09', '1996-02-09'),
(10007, 70220, '1996-02-09', '1997-02-08'),
(10007, 73362, '1997-02-08', '1998-02-08'),
(10007, 75582, '1998-02-08', '1999-02-08'),
(10007, 79513, '1999-02-08', '2000-02-08'),
(10007, 80083, '2000-02-08', '2001-02-07'),
(10007, 84456, '2001-02-07', '2002-02-07'),
(10007, 88070, '2002-02-07', '9999-01-01'),
(10008, 46671, '1998-03-11', '1999-03-11'),
(10008, 48584, '1999-03-11', '2000-03-10'),
(10008, 52668, '2000-03-10', '2000-07-31'),
(10009, 60929, '1985-02-18', '1986-02-18'),
(10009, 64604, '1986-02-18', '1987-02-18'),
(10009, 64780, '1987-02-18', '1988-02-18'),
(10009, 66302, '1988-02-18', '1989-02-17'),
(10009, 69042, '1989-02-17', '1990-02-17'),
(10009, 70889, '1990-02-17', '1991-02-17'),
(10009, 71434, '1991-02-17', '1992-02-17'),
(10009, 74612, '1992-02-17', '1993-02-16'),
(10009, 76518, '1993-02-16', '1994-02-16'),
(10009, 78335, '1994-02-16', '1995-02-16'),
(10009, 80944, '1995-02-16', '1996-02-16'),
(10009, 82507, '1996-02-16', '1997-02-15'),
(10009, 85875, '1997-02-15', '1998-02-15'),
(10009, 89324, '1998-02-15', '1999-02-15'),
(10009, 90668, '1999-02-15', '2000-02-15'),
(10009, 93507, '2000-02-15', '2001-02-14'),
(10009, 94443, '2001-02-14', '2002-02-14'),
(10009, 94409, '2002-02-14', '9999-01-01'),
(10010, 72488, '1996-11-24', '1997-11-24'),
(10010, 74347, '1997-11-24', '1998-11-24'),
(10010, 75405, '1998-11-24', '1999-11-24'),
(10010, 78194, '1999-11-24', '2000-11-23'),
(10010, 79580, '2000-11-23', '2001-11-23'),
(10010, 80324, '2001-11-23', '9999-01-01'),
(10011, 42365, '1990-01-22', '1991-01-22'),
(10011, 44200, '1991-01-22', '1992-01-22'),
(10011, 48214, '1992-01-22', '1993-01-21'),
(10011, 50927, '1993-01-21', '1994-01-21'),
(10011, 51470, '1994-01-21', '1995-01-21'),
(10011, 54545, '1995-01-21', '1996-01-21'),
(10011, 56753, '1996-01-21', '1996-11-09'),
(10012, 40000, '1992-12-18', '1993-12-18'),
(10012, 41867, '1993-12-18', '1994-12-18'),
(10012, 42318, '1994-12-18', '1995-12-18'),
(10012, 44195, '1995-12-18', '1996-12-17'),
(10012, 46460, '1996-12-17', '1997-12-17'),
(10012, 46485, '1997-12-17', '1998-12-17'),
(10012, 47364, '1998-12-17', '1999-12-17'),
(10012, 51122, '1999-12-17', '2000-12-16'),
(10012, 54794, '2000-12-16', '2001-12-16'),
(10012, 54423, '2001-12-16', '9999-01-01'),
(10013, 40000, '1985-10-20', '1986-10-20'),
(10013, 40623, '1986-10-20', '1987-10-20'),
(10013, 40561, '1987-10-20', '1988-10-19'),
(10013, 40306, '1988-10-19', '1989-10-19'),
(10013, 43569, '1989-10-19', '1990-10-19'),
(10013, 46305, '1990-10-19', '1991-10-19'),
(10013, 47118, '1991-10-19', '1992-10-18'),
(10013, 50351, '1992-10-18', '1993-10-18'),
(10013, 49887, '1993-10-18', '1994-10-18'),
(10013, 53957, '1994-10-18', '1995-10-18'),
(10013, 57590, '1995-10-18', '1996-10-17'),
(10013, 59228, '1996-10-17', '1997-10-17'),
(10013, 59571, '1997-10-17', '1998-10-17'),
(10013, 63274, '1998-10-17', '1999-10-17'),
(10013, 63352, '1999-10-17', '2000-10-16'),
(10013, 66744, '2000-10-16', '2001-10-16'),
(10013, 68901, '2001-10-16', '9999-01-01'),
(10014, 46168, '1993-12-29', '1994-12-29'),
(10014, 48242, '1994-12-29', '1995-12-29'),
(10014, 47921, '1995-12-29', '1996-12-28'),
(10014, 50715, '1996-12-28', '1997-12-28'),
(10014, 53228, '1997-12-28', '1998-12-28'),
(10014, 53962, '1998-12-28', '1999-12-28'),
(10014, 56937, '1999-12-28', '2000-12-27'),
(10014, 59142, '2000-12-27', '2001-12-27'),
(10014, 60598, '2001-12-27', '9999-01-01'),
(10015, 40000, '1992-09-19', '1993-08-22'),
(10016, 70889, '1998-02-11', '1999-02-11'),
(10016, 72946, '1999-02-11', '2000-02-11'),
(10016, 76826, '2000-02-11', '2001-02-10'),
(10016, 76381, '2001-02-10', '2002-02-10'),
(10016, 77935, '2002-02-10', '9999-01-01'),
(10017, 71380, '1993-08-03', '1994-08-03'),
(10017, 75538, '1994-08-03', '1995-08-03'),
(10017, 79510, '1995-08-03', '1996-08-02'),
(10017, 82163, '1996-08-02', '1997-08-02'),
(10017, 86157, '1997-08-02', '1998-08-02'),
(10017, 89619, '1998-08-02', '1999-08-02'),
(10017, 91985, '1999-08-02', '2000-08-01'),
(10017, 96122, '2000-08-01', '2001-08-01'),
(10017, 98522, '2001-08-01', '2002-08-01'),
(10017, 99651, '2002-08-01', '9999-01-01'),
(10018, 55881, '1987-04-03', '1988-04-02'),
(10018, 59206, '1988-04-02', '1989-04-02'),
(10018, 61361, '1989-04-02', '1990-04-02'),
(10018, 61648, '1990-04-02', '1991-04-02'),
(10018, 61217, '1991-04-02', '1992-04-01'),
(10018, 61244, '1992-04-01', '1993-04-01'),
(10018, 63286, '1993-04-01', '1994-04-01'),
(10018, 65739, '1994-04-01', '1995-04-01'),
(10018, 67519, '1995-04-01', '1996-03-31'),
(10018, 69276, '1996-03-31', '1997-03-31'),
(10018, 72585, '1997-03-31', '1998-03-31'),
(10018, 72804, '1998-03-31', '1999-03-31'),
(10018, 76957, '1999-03-31', '2000-03-30'),
(10018, 80305, '2000-03-30', '2001-03-30'),
(10018, 84541, '2001-03-30', '2002-03-30'),
(10018, 84672, '2002-03-30', '9999-01-01'),
(10019, 44276, '1999-04-30', '2000-04-29'),
(10019, 46946, '2000-04-29', '2001-04-29'),
(10019, 46775, '2001-04-29', '2002-04-29'),
(10019, 50032, '2002-04-29', '9999-01-01'),
(10020, 40000, '1997-12-30', '1998-12-30'),
(10020, 40647, '1998-12-30', '1999-12-30'),
(10020, 43800, '1999-12-30', '2000-12-29'),
(10020, 44927, '2000-12-29', '2001-12-29'),
(10020, 47017, '2001-12-29', '9999-01-01'),
(10021, 55025, '1988-02-10', '1989-02-09'),
(10021, 56399, '1989-02-09', '1990-02-09'),
(10021, 59700, '1990-02-09', '1991-02-09'),
(10021, 60851, '1991-02-09', '1992-02-09'),
(10021, 61117, '1992-02-09', '1993-02-08'),
(10021, 60708, '1993-02-08', '1994-02-08'),
(10021, 63514, '1994-02-08', '1995-02-08'),
(10021, 66249, '1995-02-08', '1996-02-08'),
(10021, 70570, '1996-02-08', '1997-02-07'),
(10021, 74759, '1997-02-07', '1998-02-07'),
(10021, 77519, '1998-02-07', '1999-02-07'),
(10021, 77237, '1999-02-07', '2000-02-07'),
(10021, 79631, '2000-02-07', '2001-02-06'),
(10021, 82295, '2001-02-06', '2002-02-06'),
(10021, 84169, '2002-02-06', '2002-07-15'),
(10022, 40000, '1999-09-03', '2000-09-02'),
(10022, 39935, '2000-09-02', '2001-09-02'),
(10022, 41348, '2001-09-02', '9999-01-01'),
(10023, 47883, '1999-09-27', '2000-09-26'),
(10023, 50319, '2000-09-26', '2001-09-26'),
(10023, 50113, '2001-09-26', '9999-01-01'),
(10024, 83733, '1998-06-14', '1999-06-14'),
(10024, 86715, '1999-06-14', '2000-06-13'),
(10024, 91067, '2000-06-13', '2001-06-13'),
(10024, 94701, '2001-06-13', '2002-06-13'),
(10024, 96646, '2002-06-13', '9999-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `salaries_grid`
--

DROP TABLE IF EXISTS `salaries_grid`;
CREATE TABLE IF NOT EXISTS `salaries_grid` (
  `grid_no` int(11) NOT NULL AUTO_INCREMENT,
  `seniority_year_req` int(11) NOT NULL,
  `min_salary` float NOT NULL,
  `max_salary` float NOT NULL,
  `dept_no` char(4) NOT NULL,
  PRIMARY KEY (`grid_no`),
  KEY `fk_employees_departments_idx` (`dept_no`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salaries_grid`
--

INSERT INTO `salaries_grid` (`grid_no`, `seniority_year_req`, `min_salary`, `max_salary`, `dept_no`) VALUES
(1, 1, 38000, 39000, 'd001'),
(2, 2, 39000, 40000, 'd001'),
(3, 3, 40000, 41000, 'd001'),
(4, 4, 41000, 42000, 'd001'),
(5, 5, 42000, 50000, 'd001'),
(6, 6, 43000, 55000, 'd001'),
(7, 7, 44000, 60000, 'd001'),
(8, 8, 45000, 75000, 'd001'),
(9, 9, 46000, 85000, 'd001'),
(10, 10, 50000, 100000, 'd001'),
(11, 1, 38000, 39000, 'd002'),
(12, 2, 39000, 40000, 'd002'),
(13, 3, 40000, 41000, 'd002'),
(14, 4, 41000, 42000, 'd002'),
(15, 5, 42000, 50000, 'd002'),
(16, 6, 43000, 55000, 'd002'),
(17, 7, 44000, 60000, 'd002'),
(18, 8, 45000, 75000, 'd002'),
(19, 9, 46000, 85000, 'd002'),
(20, 10, 50000, 100000, 'd002'),
(21, 1, 38000, 39000, 'd003'),
(22, 2, 39000, 40000, 'd003'),
(23, 3, 40000, 41000, 'd003'),
(24, 4, 41000, 42000, 'd003'),
(25, 5, 42000, 50000, 'd003'),
(26, 6, 43000, 55000, 'd003'),
(27, 7, 44000, 60000, 'd003'),
(28, 8, 45000, 75000, 'd003'),
(29, 9, 46000, 85000, 'd003'),
(30, 10, 50000, 100000, 'd003'),
(31, 1, 38000, 39000, 'd004'),
(32, 2, 39000, 40000, 'd004'),
(33, 3, 40000, 41000, 'd004'),
(34, 4, 41000, 42000, 'd004'),
(35, 5, 42000, 50000, 'd004'),
(36, 6, 43000, 55000, 'd004'),
(37, 7, 44000, 60000, 'd004'),
(38, 8, 45000, 75000, 'd004'),
(39, 9, 46000, 85000, 'd004'),
(40, 10, 50000, 100000, 'd004'),
(41, 1, 38000, 39000, 'd005'),
(42, 2, 39000, 40000, 'd005'),
(43, 3, 40000, 41000, 'd005'),
(44, 4, 41000, 42000, 'd005'),
(45, 5, 42000, 50000, 'd005'),
(46, 6, 43000, 55000, 'd005'),
(47, 7, 44000, 60000, 'd005'),
(48, 8, 45000, 75000, 'd005'),
(49, 9, 46000, 85000, 'd005'),
(50, 10, 50000, 100000, 'd005'),
(51, 1, 38000, 39000, 'd006'),
(52, 2, 39000, 40000, 'd006'),
(53, 3, 40000, 41000, 'd006'),
(54, 4, 41000, 42000, 'd006'),
(55, 5, 42000, 50000, 'd006'),
(56, 6, 43000, 55000, 'd006'),
(57, 7, 44000, 60000, 'd006'),
(58, 8, 45000, 75000, 'd006'),
(59, 9, 46000, 85000, 'd006'),
(60, 10, 50000, 100000, 'd006'),
(61, 1, 38000, 39000, 'd007'),
(62, 2, 39000, 40000, 'd007'),
(63, 3, 40000, 41000, 'd007'),
(64, 4, 41000, 42000, 'd007'),
(65, 5, 42000, 50000, 'd007'),
(66, 6, 43000, 55000, 'd007'),
(67, 7, 44000, 60000, 'd007'),
(68, 8, 45000, 75000, 'd007'),
(69, 9, 46000, 85000, 'd007'),
(70, 10, 50000, 100000, 'd007'),
(71, 1, 38000, 39000, 'd008'),
(72, 2, 39000, 40000, 'd008'),
(73, 3, 40000, 41000, 'd008'),
(74, 4, 41000, 42000, 'd008'),
(75, 5, 42000, 50000, 'd008'),
(76, 6, 43000, 55000, 'd008'),
(77, 7, 44000, 60000, 'd008'),
(78, 8, 45000, 75000, 'd008'),
(79, 9, 46000, 85000, 'd008'),
(80, 10, 50000, 100000, 'd008'),
(81, 1, 38000, 39000, 'd009'),
(82, 2, 39000, 40000, 'd009'),
(83, 3, 40000, 41000, 'd009'),
(84, 4, 41000, 42000, 'd009'),
(85, 5, 42000, 50000, 'd009'),
(86, 6, 43000, 55000, 'd009'),
(87, 7, 44000, 60000, 'd009'),
(88, 8, 45000, 75000, 'd009'),
(89, 9, 46000, 85000, 'd009'),
(90, 10, 50000, 100000, 'd009');

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
CREATE TABLE IF NOT EXISTS `titles` (
  `emp_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_no`,`title`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES
(10001, 'Senior Engineer', '1986-06-26', '9999-01-01'),
(10002, 'Staff', '1996-08-03', '9999-01-01'),
(10003, 'Senior Engineer', '1995-12-03', '9999-01-01'),
(10004, 'Engineer', '1986-12-01', '1995-12-01'),
(10004, 'Senior Engineer', '1995-12-01', '9999-01-01'),
(10005, 'Senior Staff', '1996-09-12', '9999-01-01'),
(10005, 'Staff', '1989-09-12', '1996-09-12'),
(10006, 'Senior Engineer', '1990-08-05', '9999-01-01'),
(10007, 'Senior Staff', '1996-02-11', '9999-01-01'),
(10007, 'Staff', '1989-02-10', '1996-02-11'),
(10008, 'Assistant Engineer', '1998-03-11', '2000-07-31'),
(10009, 'Assistant Engineer', '1985-02-18', '1990-02-18'),
(10009, 'Engineer', '1990-02-18', '1995-02-18'),
(10009, 'Senior Engineer', '1995-02-18', '9999-01-01'),
(10010, 'Engineer', '1996-11-24', '9999-01-01'),
(10011, 'Staff', '1990-01-22', '1996-11-09'),
(10012, 'Engineer', '1992-12-18', '2000-12-18'),
(10012, 'Senior Engineer', '2000-12-18', '9999-01-01'),
(10013, 'Senior Staff', '1985-10-20', '9999-01-01'),
(10014, 'Engineer', '1993-12-29', '9999-01-01'),
(10015, 'Senior Staff', '1992-09-19', '1993-08-22'),
(10016, 'Staff', '1998-02-11', '9999-01-01'),
(10017, 'Senior Staff', '2000-08-03', '9999-01-01'),
(10017, 'Staff', '1993-08-03', '2000-08-03'),
(10018, 'Engineer', '1987-04-03', '1995-04-03'),
(10018, 'Senior Engineer', '1995-04-03', '9999-01-01'),
(10019, 'Staff', '1999-04-30', '9999-01-01'),
(10020, 'Engineer', '1997-12-30', '9999-01-01'),
(10021, 'Technique Leader', '1988-02-10', '2002-07-15'),
(10022, 'Engineer', '1999-09-03', '9999-01-01'),
(10023, 'Engineer', '1999-09-27', '9999-01-01'),
(10024, 'Assistant Engineer', '1998-06-14', '9999-01-01');

-- --------------------------------------------------------

--
-- Structure for view `current_dept_emp`
--
DROP TABLE IF EXISTS `current_dept_emp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_dept_emp`  AS  select `l`.`emp_no` AS `emp_no`,`d`.`dept_no` AS `dept_no`,`l`.`from_date` AS `from_date`,`l`.`to_date` AS `to_date` from (`dept_emp` `d` join `dept_emp_latest_date` `l` on(((`d`.`emp_no` = `l`.`emp_no`) and (`d`.`from_date` = `l`.`from_date`) and (`l`.`to_date` = `d`.`to_date`)))) ;

-- --------------------------------------------------------

--
-- Structure for view `dept_emp_latest_date`
--
DROP TABLE IF EXISTS `dept_emp_latest_date`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dept_emp_latest_date`  AS  select `dept_emp`.`emp_no` AS `emp_no`,max(`dept_emp`.`from_date`) AS `from_date`,max(`dept_emp`.`to_date`) AS `to_date` from `dept_emp` group by `dept_emp`.`emp_no` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD CONSTRAINT `dept_emp_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE;

--
-- Constraints for table `dept_manager`
--
ALTER TABLE `dept_manager`
  ADD CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_salaries_grid` FOREIGN KEY (`grid_no`) REFERENCES `salaries_grid` (`grid_no`);

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE;

--
-- Constraints for table `salaries_grid`
--
ALTER TABLE `salaries_grid`
  ADD CONSTRAINT `fk_employees_departments` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`);

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
