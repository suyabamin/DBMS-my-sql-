-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2025 at 05:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab2`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL CHECK (`age` >= 18),
  `phone_no` decimal(11,0) NOT NULL,
  `order_count` int(11) DEFAULT 0,
  `security_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dname` varchar(15) DEFAULT NULL,
  `dnumber` int(11) NOT NULL,
  `mgrssn` int(11) DEFAULT NULL,
  `mgrstartdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dname`, `dnumber`, `mgrssn`, `mgrstartdate`) VALUES
('HEADQUARTERS', 1, 888665555, '0000-00-00'),
('ADMINISTRATION', 4, 987654321, '0000-00-00'),
('RESEARCH', 5, 333445555, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `essn` int(11) NOT NULL,
  `dependent_name` varchar(15) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `relationship` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`essn`, `dependent_name`, `gender`, `bdate`, `relationship`) VALUES
(123456789, 'ALICE', 'F', '0000-00-00', 'DAUGHTER'),
(123456789, 'ELIZABETH', 'F', '0000-00-00', 'SPOUSE'),
(123456789, 'MICHAEL', 'M', '0000-00-00', 'SON'),
(333445555, 'ALICE', 'F', '0000-00-00', 'DAUGHTER'),
(333445555, 'JOY', 'F', '0000-00-00', 'SPOUSE'),
(333445555, 'THEODORE', 'M', '0000-00-00', 'SON'),
(987654321, 'ABNER', 'M', '0000-00-00', 'SPOUSE');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `fname` varchar(15) DEFAULT NULL,
  `minit` varchar(2) DEFAULT NULL,
  `lname` varchar(15) DEFAULT NULL,
  `ssn` int(12) NOT NULL,
  `bdate` date DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `salary` int(7) NOT NULL,
  `superssn` int(12) DEFAULT NULL,
  `dno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`fname`, `minit`, `lname`, `ssn`, `bdate`, `address`, `gender`, `salary`, `superssn`, `dno`) VALUES
('JOHN', 'B', 'SMITH', 123456789, '0000-00-00', '731 FONDREN, HOUSTON, TX', 'M', 30000, 333445555, 5),
('FRANKLIN', 'T', 'WONG', 333445555, '0000-00-00', '638 VOSS, HOUSTON, TX', 'M', 40000, 888665555, 5),
('JOYCE', 'A', 'ENGLISH', 453453453, '0000-00-00', '5631 RICE, HOUSTON, TX', 'F', 25000, 333445555, 5),
('RAMESH', 'K', 'NARAYAN', 666884444, '0000-00-00', '975 FIRE OAK, HUMBLE, TX', 'M', 38000, 333445555, 5),
('JAMES', 'E', 'BORG', 888665555, '0000-00-00', '450 STONE, HOUSTON, TX', 'M', 55000, NULL, 1),
('JENNIFER', 'S', 'WALLACE', 987654321, '0000-00-00', '291 BERRY, BELLAIRE, TX', 'F', 40000, 888665555, 5),
('AHMAD', 'V', 'JABBAR', 987987987, '0000-00-00', '980 DALLAS, HOUSTON, TX', 'M', 25000, 987654321, 5),
('ALICIA', 'J', 'ZELAYA', 999887777, '0000-00-00', '3321 CASTLE, SPRING, TX', 'F', 25000, 987654321, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `security_key` (`security_key`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dnumber`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`essn`,`dependent_name`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `fk_dno_dnumber` (`dno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `fk_essn_ssn` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_dno_dnumber` FOREIGN KEY (`dno`) REFERENCES `department` (`dnumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
