-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2021 at 06:58 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learningpoint`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sr_no` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` int(50) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sr_no`, `name`, `email`, `phone_no`, `message`, `date`) VALUES
(1, 'asdfghj', 'akshay@gmail.com', 965213453, 'rthgjh', '2021-02-15 14:45:30'),
(4, 'SONALI KIRANSHING PARDESHI', 'kiran.pardeshi.7373@gmail.com', 2147483647, 'dafs', '2021-02-15 15:42:16'),
(38, 'SONALI KIRANSHING PARDESHI', 'shubhamsayakr@gmail.com', 2147483647, 'dfghj', '2021-02-16 14:00:03'),
(39, 'asfds', 'asdas', 86454, 'asfdsf', '2021-02-22 15:31:51'),
(40, 'akshy', 'kiran.pardeshi.7373@gmail.com', 897465321, 'i want to talk with you', '2021-02-24 19:15:57'),
(41, 'akshy', 'kiran.pardeshi.7373@gmail.com', 897465321, 'i want to talk with you', '2021-02-24 19:25:21'),
(42, 'SONALI KIRANSHING PARDESHI', 'akshay.pardeshi.7373@gmail.com', 86454, 'dkaJS', '2021-02-24 19:25:36'),
(43, 'SONALI KIRANSHING PARDESHI', 'akshay.pardeshi.7373@gmail.com', 86454, 'dkaJS', '2021-02-24 19:29:28'),
(44, 'SONALI KIRANSHING PARDESHI', 'akshay.pardeshi.7373@gmail.com', 86454, 'dkaJS', '2021-02-24 19:29:36'),
(45, 'kiran', 'shubhamsayakr@gmail.com', 646545, 'ashdiashdi\r\n', '2021-02-24 19:29:56'),
(46, 'kiran', 'shubhamsayakr@gmail.com', 646545, 'ashdiashdi\r\n', '2021-02-24 19:38:36'),
(47, 'kiran', 'shubhamsayakr@gmail.com', 646545, 'ashdiashdi\r\n', '2021-02-24 19:38:55'),
(48, 'SONALI KIRANSHING PARDESHI', 'akshay.pardeshi.7373@gmail.com', 8646563, 'wqda', '2021-02-24 19:39:05'),
(49, 'SONALI KIRANSHING PARDESHI', 'akshay.pardeshi.7373@gmail.com', 2147483647, 'aDSA', '2021-02-24 19:44:06'),
(50, 'SONALI KIRANSHING PARDESHI', 'akshay.pardeshi.7373@gmail.com', 2147483647, 'aDSA', '2021-02-24 19:44:41'),
(51, 'SONALI KIRANSHING PARDESHI', 'akshay.pardeshi.7373@gmail.com', 2147483647, 'aDSA', '2021-02-24 19:45:17'),
(52, 'SONALI KIRANSHING PARDESHI', 'akshay.pardeshi.7373@gmail.com', 2147483647, 'aDSA', '2021-02-24 19:46:39'),
(53, 'SONALI KIRANSHING PARDESHI', 'akshay.pardeshi.7373@gmail.com', 2147483647, 'aDSA', '2021-02-24 19:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `java`
--

CREATE TABLE `java` (
  `sno` int(11) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `languagsubpoint` varchar(50) NOT NULL,
  `subdescription` varchar(2000) NOT NULL,
  `program` varchar(1000) DEFAULT NULL,
  `example` varchar(500) DEFAULT NULL,
  `whoissinsertthisdata` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `imgfile` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `java`
--

INSERT INTO `java` (`sno`, `slug`, `languagsubpoint`, `subdescription`, `program`, `example`, `whoissinsertthisdata`, `date`, `imgfile`) VALUES
(1, 'akshay', 'Why to Learn Python?', 'Python is a high-level, interpreted, interactive and object-oriented scripting language. Python is designed to be highly readable. It uses English keywords frequently where as other languages use punctuation, and it has fewer syntactical constructions than other languages.\r\n\r\nPython is a MUST for students and working professionals to become a great Software Engineer specially when they are working in Web Development Domain. I will list down some of the key advantages of learning Python:\r\n\r\nPython is Interpreted − Python is processed at runtime by the interpreter. You do not need to compile your program before executing it. This is similar to PERL and PHP.\r\n\r\nPython is Interactive − You can actually sit at a Python prompt and interact with the interpreter directly to write your programs.\r\n\r\nPython is Object-Oriented − Python supports Object-Oriented style or technique of programming that encapsulates code within objects.\r\n\r\nPython is a Beginner\'s Language − Python is a great language for the beginner-level programmers and supports the development of a wide range of applications from simple text processing to WWW browsers to games.', 'fdsgsh', 'afzfsd', 'rajput', '2021-02-24 16:40:13', 'java.jpg'),
(3, 'kp', 'akshay', 'aygauHSG', '2021-02-24 20:31:45', 'bxjas', 'jhsagdxuas', '2021-02-25 10:06:14', '');

-- --------------------------------------------------------

--
-- Table structure for table `languges`
--

CREATE TABLE `languges` (
  `sno` int(50) NOT NULL,
  `languag` varchar(50) NOT NULL,
  `lang_photo` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `writing_name` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languges`
--

INSERT INTO `languges` (`sno`, `languag`, `lang_photo`, `description`, `writing_name`, `date`) VALUES
(1, 'Java', 'java.jpg', 'Java is a high-level programming language originally developed by Sun Microsystems and released in 1995. Java runs on a variety of platforms, such as Windows, Mac OS, and the various versions of UNIX.', 'aprajput', '2021-02-24 14:09:11'),
(2, 'Python', 'python.jpg', 'Python is a general-purpose interpreted, interactive, object-oriented, and high-level programming language. It was created by Guido van Rossum during 1985- 1990. Like Perl, Python source code is also ', 'aprajput', '2021-02-24 20:38:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `java`
--
ALTER TABLE `java`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `languges`
--
ALTER TABLE `languges`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sr_no` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `java`
--
ALTER TABLE `java`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languges`
--
ALTER TABLE `languges`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
