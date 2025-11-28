-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2025 at 08:23 PM
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
-- Database: `lab_2`
--

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
('JOHN', 'B', 'SMITH', 123456789, '1955-01-09', '731 FONDREN, HOUSTON, TX', 'M', 30000, 333445555, 5),
('FRANKLIN', 'T', 'WONG', 333445555, '1945-12-08', '638 VOSS, HOUSTON, TX', 'M', 40000, 888665555, 5),
('JOYCE', 'A', 'ENGLISH', 453453453, '1962-07-31', '5631 RICE, HOUSTON, TX', 'F', 25000, 333445555, 5),
('RAMESH', 'K', 'NARAYAN', 666884444, '1952-09-15', '975 FIRE OAK, HUMBLE,\r\nTX', 'M', 38000, 333445555, 5),
('JAMES', 'E', 'BORG', 888665555, '1927-11-10', '450 STONE, HOUSTON, TX', 'M', 55000, NULL, 1),
('JENNIFER', 'S', 'WALLACE', 987654321, '1931-06-20', '291 BERRY, BELLAIRE,\r\nTX', 'F', 40000, 888665555, 5),
('AHMAD', 'V', 'JABBAR', 987987987, '1959-03-29', '980 DALLAS, HOUSTON,\r\nTX', 'M', 25000, 987654321, 5),
('ALICIA', 'J', 'ZELAYA', 999887777, '1958-07-19', '3321 CASTLE, SPRING, TX', 'F', 25000, 987654321, 5);

--
-- Indexes for dumped tables
--

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
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_dno_dnumber` FOREIGN KEY (`dno`) REFERENCES `department` (`dnumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
