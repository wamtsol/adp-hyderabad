-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 05, 2021 at 12:28 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hyderaba_adphyd`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_type_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `monthly_salary` decimal(10,2) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_type_id`, `username`, `email`, `name`, `monthly_salary`, `password`, `status`, `ts`) VALUES
(1, 1, 'admin', 'vickyali2@hotmail.com', 'Admin', 0.00, 'admin', 1, '2021-07-30 10:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `admin_type`
--

CREATE TABLE `admin_type` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `can_add` int(1) NOT NULL DEFAULT '0',
  `can_edit` int(1) NOT NULL DEFAULT '0',
  `can_delete` int(1) NOT NULL DEFAULT '0',
  `can_read` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_type`
--

INSERT INTO `admin_type` (`id`, `title`, `can_add`, `can_edit`, `can_delete`, `can_read`, `status`, `ts`) VALUES
(1, 'Administrator', 1, 1, 1, 1, 1, '2017-02-27 12:10:38'),
(3, 'Employee', 0, 0, 0, 1, 1, '2017-12-30 22:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `status`, `ts`) VALUES
(1, 'CATEGORY-A', 1, '2021-07-28 17:06:33');

-- --------------------------------------------------------

--
-- Table structure for table `config_type`
--

CREATE TABLE `config_type` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `sortorder` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config_type`
--

INSERT INTO `config_type` (`id`, `title`, `sortorder`) VALUES
(1, 'General Settings', 1),
(9, 'Invoice Setting', 2);

-- --------------------------------------------------------

--
-- Table structure for table `config_variable`
--

CREATE TABLE `config_variable` (
  `id` int(11) NOT NULL,
  `config_type_id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `notes` varchar(512) NOT NULL,
  `type` varchar(200) NOT NULL,
  `default_values` text NOT NULL,
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  `sortorder` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config_variable`
--

INSERT INTO `config_variable` (`id`, `config_type_id`, `title`, `notes`, `type`, `default_values`, `key`, `value`, `sortorder`) VALUES
(1, 1, 'Site URL', '', 'text', '', 'site_url', 'http://localhost/adp-hyderabad/admin', 2),
(2, 1, 'Site Title', '', 'text', '', 'site_title', 'ADP Hyderabad', 1),
(3, 1, 'Admin Logo', '', 'file', '', 'admin_logo', '', 4),
(10, 1, 'Currency Symbol', '', 'text', '', 'currency_symbol', 'Rs', 5),
(7, 1, 'Admin Email', 'Main Email Address where all the notifications will be sent.', 'text', '', 'admin_email', '', 3),
(18, 1, 'Address/Phone', '', 'editor', '', 'address_phone', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>', 6),
(19, 1, 'Header', '', 'editor', '', 'fees_chalan_header', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>', 7),
(21, 9, 'Supplier Detail', '', 'editor', '', 'supplier_detail', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>', 8),
(22, 1, 'Customer ID', '', 'text', '', 'customer_id', '3', 9);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `depth` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `small_icon` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `title`, `url`, `parent_id`, `depth`, `sortorder`, `icon`, `small_icon`) VALUES
(1, 'Dashboard', '#', 0, 0, 1, 'dashboard.png', 'home'),
(68, 'Scheme', '#', 0, 0, 6, 'scheme.jpg', 'magnet'),
(69, 'Manage Scheme', 'scheme_manage.php', 68, 1, 7, 'manage-scheme.png', 'circle'),
(8, 'Manage Users', 'admin_manage.php', 1, 1, 4, 'administrator.png', 'user'),
(7, 'General Settings', 'config_manage.php?config_id=1', 1, 1, 2, 'general-settings.png', 'cog'),
(12, 'Upload Center', 'upload_manage.php', 1, 1, 3, 'upload-center.png', 'file-o'),
(26, 'Manage User Types', 'admin_type_manage.php', 1, 1, 5, 'admin-type.png', 'unlock-alt');

-- --------------------------------------------------------

--
-- Table structure for table `menu_2_admin_type`
--

CREATE TABLE `menu_2_admin_type` (
  `menu_id` int(11) NOT NULL,
  `admin_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_2_admin_type`
--

INSERT INTO `menu_2_admin_type` (`menu_id`, `admin_type_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(4, 3),
(4, 4),
(5, 1),
(5, 3),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(12, 1),
(14, 1),
(14, 3),
(15, 1),
(15, 3),
(16, 1),
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(20, 1),
(21, 1),
(21, 3),
(22, 1),
(22, 3),
(23, 1),
(24, 1),
(24, 3),
(25, 1),
(26, 1),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(41, 3),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(61, 1),
(61, 3),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(64, 3),
(65, 1),
(65, 3),
(66, 1),
(66, 3),
(67, 1),
(67, 3),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schemes`
--

CREATE TABLE `schemes` (
  `id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `sub_sector_id` int(11) NOT NULL,
  `taluka_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `adp_number` varchar(50) NOT NULL,
  `approval_year` int(4) NOT NULL,
  `project_description` text NOT NULL,
  `completion_date` date NOT NULL,
  `estim_cost` decimal(10,2) NOT NULL,
  `actual_expenditure` decimal(10,2) NOT NULL,
  `estim_expenditure` decimal(10,2) NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `electric` decimal(10,2) NOT NULL,
  `rev` decimal(10,2) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schemes`
--

INSERT INTO `schemes` (`id`, `sector_id`, `sub_sector_id`, `taluka_id`, `category_id`, `adp_number`, `approval_year`, `project_description`, `completion_date`, `estim_cost`, `actual_expenditure`, `estim_expenditure`, `capital`, `electric`, `rev`, `status`, `ts`) VALUES
(1, 4, 0, 2, 1, 'HB17P00001', 2020, 'HB17P00001-Providing & Laying Water Supply Line at New Sabzi Mandi.', '2020-06-30', 15.00, 13.13, 15.00, 1.88, 0.00, 0.00, 1, '2021-08-04 15:56:10'),
(2, 4, 0, 1, 1, 'HB17P00002', 2020, 'HB17P00002-\"Construction Open Drains at Village Bhawal Khan Palari, Taluka Qasimabad, District Hyderabad.', '2020-06-30', 0.60, 0.53, 0.60, 0.08, 0.00, 0.00, 1, '2021-08-04 15:56:18'),
(3, 4, 0, 2, 1, 'HB17P00003', 2020, 'HB17P00003-\"Laying Drainge Lines at Imtiaz Qureshi Muhallah at Baldia Colony Union Committee-1, Taluka City Hyderabad.\"', '2020-06-30', 2.80, 2.45, 2.80, 0.35, 0.00, 0.00, 1, '2021-08-04 15:55:58'),
(4, 4, 0, 3, 1, 'HB17P00004', 2020, 'HB17P00004-\"Providing Drainage line at Peoples Colony Taluka Latifabad Unit # 4, District Hyderabad.\"', '2020-06-30', 0.50, 0.44, 0.50, 0.06, 0.00, 0.00, 1, '2021-08-04 15:56:00'),
(5, 4, 0, 4, 1, 'HB17P00005', 2020, 'HB17P00005-\"Providing Drainage line at Village Rahim Khan Chalgari, Uc-Masu Bhurgari, Taluka Rural,Hyderabad.\"', '2020-06-30', 0.50, 0.44, 0.50, 0.06, 0.00, 0.00, 1, '2021-08-04 15:56:03'),
(6, 4, 0, 1, 1, 'HB17P00006', 2020, 'HB17P00006-\"Laying Drainage line infront of Khimtia House Bhitai Town Taluka Qasimabad, District Hyderabad.\"', '2020-06-30', 0.90, 0.79, 0.90, 0.11, 0.00, 0.00, 1, '2021-08-04 15:55:14'),
(7, 4, 0, 1, 1, 'HB17P00007', 2020, 'HB17P00007-\"Construction Open Surface Drains at Village Majid Kerio, Taluka Qasimabad, District Hyderabad.\"', '2020-06-30', 0.80, 0.70, 0.80, 0.10, 0.00, 0.00, 1, '2021-08-04 15:56:08'),
(8, 5, 0, 2, 1, 'HB12P00015', 2021, 'Improvement of road from Mehran Ground to National Highway.', '2021-06-30', 20.00, 17.77, 20.00, 2.23, 0.00, 0.00, 1, '2021-08-04 15:53:30'),
(9, 5, 0, 3, 1, 'HB12P00059', 2021, 'Improvement of Asphalt Road from Pakola Factory to Gujrati Para Taluka Latifabad.', '2021-06-30', 20.00, 16.52, 20.00, 3.48, 0.00, 0.00, 1, '2021-08-04 15:53:33'),
(10, 5, 0, 4, 1, 'HB12P00072', 2021, 'Construction of Roads From Almani Regulater To Haji Abdullah Hingro U.C Tando Fazal.', '2021-06-30', 20.00, 17.41, 20.00, 2.59, 0.00, 0.00, 1, '2021-08-04 15:53:38'),
(11, 5, 0, 3, 1, 'HB12P00073', 2021, 'Construction of Roads From Villege Arab Shoro To Village Hameed Khokar Via Khako Machi UC Hosri.', '2021-06-30', 28.00, 18.54, 20.00, 9.40, 0.00, 0.00, 1, '2021-08-04 15:53:26'),
(12, 5, 0, 2, 1, 'HB12P00083', 2021, 'Improvement of Various C.C. Streets in U.C. 09 Taluka City Hyderabad.', '2021-06-30', 28.00, 20.98, 28.00, 7.02, 0.00, 0.00, 1, '2021-08-04 15:53:21'),
(13, 5, 0, 2, 1, 'HB13P00057', 2021, 'Imrovement of Sphalt Road from Phulleli Chowck to Mir Ground  City Hyderabad.', '2021-06-30', 19.05, 17.07, 19.05, 1.98, 0.00, 0.00, 1, '2021-08-04 15:53:18'),
(14, 5, 0, 3, 1, 'HB13P00071', 2021, 'Improvement of Road from Block D-2 Unit No.11 I/C Back Side of Urban Hospital UC No.11 Latifabad', '2021-06-30', 15.64, 11.15, 15.64, 3.50, 0.00, 0.00, 1, '2021-08-04 15:52:56'),
(15, 5, 0, 3, 1, 'HB13P00085', 2021, 'Improvement of Road/ CC street from Gujrati para to Tando Yousuf Grave yard road Including  Links U.C.No. 15 Taluka Latifabad', '2021-06-30', 9.52, 8.43, 9.52, 1.09, 0.00, 0.00, 1, '2021-08-04 15:52:49'),
(16, 5, 0, 3, 1, 'HB13P00086', 2021, 'Improvement of Road From Main Tando Muhammad khan road to Shahlatif Colony including Hashmi Colony Link Road Latifabad.', '2021-06-30', 14.63, 7.56, 14.63, 3.97, 0.00, 0.00, 1, '2021-08-04 15:52:45'),
(17, 5, 0, 1, 1, 'HB13P00111', 2021, 'Construction of CC Block Street in Muhammadi Town UC No.2 Qasimabad (newly approved location) Happy Homes Ph-IV, Gulistan-e-Sajjad, Al-Raheem Villas, Naseem Nagar Phase-III, Al-Abbas Colony, Citizen Colony Taluka Qasimabad Hyderabad', '2021-06-30', 20.00, 19.06, 20.00, 0.94, 0.00, 0.00, 1, '2021-08-04 15:52:41'),
(18, 5, 0, 1, 1, 'HB13P00117', 2021, 'Construction of road in various street of village Muhammad Bux Shoro UC No.4 Qasimabad', '2021-06-30', 19.94, 18.60, 19.94, 1.34, 0.00, 0.00, 1, '2021-08-04 15:52:37'),
(19, 5, 0, 4, 1, 'HB13P00152', 2021, 'Construction of road from Mughan Jo Tar to Khokhar Shaikh long Khoso Mori Mile. 0/0-1/5 (2.41 Kms) Revised on 05-08-20', '2021-06-30', 28.64, 14.60, 18.64, 14.03, 0.00, 0.00, 1, '2021-08-04 15:52:33'),
(20, 5, 0, 4, 1, 'HB13P00160', 2021, 'Construction of Road from Hyd. Tando Fazal Road to Village Motoo Behrani Road Mile 0/0-1/2', '2021-06-30', 17.28, 16.09, 17.28, 1.18, 0.00, 0.00, 1, '2021-08-04 15:51:50'),
(21, 5, 0, 2, 1, 'HB15P00016', 2021, 'Improvement of C.C Paver at Memon Hospital Beside Nala to Sattar Shah Parak City Hyderabad (0/0 Ã¢Â€Â“ 0/5).', '2021-06-30', 9.76, 9.63, 9.76, 0.14, 0.00, 0.00, 1, '2021-08-04 15:52:25'),
(22, 5, 0, 2, 1, 'HB15P00023', 2021, 'Improvement of Asphalt Road / Paving Block from GPO Road to High Court Building City Hyderabad (0/0-0/0+330)', '2021-06-30', 28.00, 16.71, 20.00, 11.29, 0.00, 0.00, 1, '2021-08-04 15:52:20'),
(23, 5, 0, 3, 1, 'HB15P00026', 2021, 'Improvement of Asphalt various Street Block-C Unit No. 06 Taluka Latifabad. (0/0-0/3 +220 Mile).', '2021-06-30', 11.45, 5.59, 11.45, 5.00, 0.00, 0.00, 1, '2021-08-04 15:52:17'),
(24, 5, 0, 1, 1, 'HB15P00045', 2021, 'W/Reconditioning of Asphalt road from Main Jamshoro Road Via Marvi Garden to Wadhu Wah Taluka Qasimabad Mile 0/0-0/2.', '2021-06-30', 12.00, 3.67, 12.00, 1.00, 0.00, 0.00, 1, '2021-08-04 15:52:11'),
(25, 5, 0, 1, 1, 'HB15P00047', 2021, 'Construction Of Road From Hyderabad Bypass Via (Ghaforia Masjid Al-Mustafa Trust) To Village Misri Shaikh Uc No. 4 Taluka Qasimabad Mile 0/0-2/0.', '2021-06-30', 20.00, 18.63, 20.00, 1.37, 0.00, 0.00, 1, '2021-08-04 15:52:08'),
(26, 5, 0, 4, 1, 'HB15P00050', 2021, 'Construction of Road from Tando Fazal road to Village Saboo Unar Mile 0/0-1/1.', '2021-06-30', 14.00, 12.42, 14.00, 1.58, 0.00, 0.00, 1, '2021-08-04 15:58:31'),
(27, 5, 0, 4, 1, 'HB15P00057', 2021, 'Construction of Pre-Streets Bridges over Rohri Canal 75 Rft @ Point Village Qaim Babar including Road Approaches.', '2021-06-30', 10.00, 9.31, 10.00, 0.69, 0.00, 0.00, 1, '2021-08-04 16:02:24'),
(28, 3, 0, 2, 1, 'HB16P00019', 2021, 'Construction of C.C Street at Village Nabi Bux Jatoi, Deh Ghangra, Union Council No.5, Taluka City Hyderabad', '2021-06-30', 0.80, 0.00, 0.80, 0.80, 0.00, 0.00, 1, '2021-08-04 16:03:28'),
(29, 5, 0, 2, 1, 'HB16P00021', 2021, 'Construction of C.C Street at Shah Latif Colony Near Lalu Lashari, Taluka City Hyderabad', '2021-06-30', 0.80, 0.00, 0.80, 0.80, 0.00, 0.00, 1, '2021-08-04 16:04:31'),
(30, 5, 0, 4, 1, 'HB16P00022', 2021, 'Construction of C.C Drainage Nala at Point Tando Hyder Town Portion along Road Sides Taluka Hyderabad Rural.', '2021-06-30', 16.66, 0.00, 16.66, 14.00, 0.00, 0.00, 1, '2021-08-04 16:05:35'),
(31, 5, 0, 2, 1, 'HB17P00008', 2021, 'Construction of Road from Ghangra Mori Miran Shah Grid Station to Vlllage road Thakur Mile-0/0-0/5.', '2021-06-30', 9.94, 7.72, 9.94, 2.22, 0.00, 0.00, 1, '2021-08-04 16:12:55'),
(32, 3, 0, 4, 1, 'HB17P00009', 2021, 'Improvement of road at Village Khuda Bux Gopang UC No.03 HMC Mile-0/0-0/3+300 ft.', '2021-06-30', 4.47, 3.91, 4.47, 0.56, 0.00, 0.00, 1, '2021-08-04 16:14:40'),
(33, 3, 0, 1, 1, 'HB17P00011', 2021, 'Construction of CC road in Village Gulab Laghari Mile-0/0-0/1 ft Taluka Qasimabad Revised on 05-08-20', '2021-06-30', 18.00, 1.86, 2.47, 15.00, 0.00, 0.00, 1, '2021-08-04 16:15:47'),
(34, 5, 0, 1, 1, 'HB17P00012', 2021, 'Construction of CC road in Al-Shahbaz Colony Mile-0/0-0/3+250 ft Taluka Qasimabad', '2021-06-30', 19.98, 8.99, 8.45, 9.50, 0.00, 0.00, 1, '2021-08-04 16:18:25'),
(35, 5, 0, 4, 1, 'HB17P00013', 2021, 'Construction of road from Village Imam Bux Lund to Village Gul Hassan Lund (1 KM) Revised on 05-08-20', '2021-06-30', 22.00, 4.63, 6.00, 16.00, 0.00, 0.00, 1, '2021-08-04 16:23:38'),
(36, 5, 0, 4, 1, 'HB17P00014', 2021, 'Construction of road from Jhang Mori Stop to Mir Allah Bux Talpur UC Chukhi Taluka Hyderabad  Revised on 05-08-20', '2021-06-30', 12.00, 1.75, 2.00, 9.50, 0.00, 0.00, 1, '2021-08-04 16:27:50'),
(37, 5, 0, 4, 1, 'HB17P00015', 2021, 'Construction of road from Village Umeed Ali Rind to Hussain Bux Lashari UC Seri Taluka Hyderabad', '2021-06-30', 4.17, 3.65, 4.17, 0.52, 0.00, 0.00, 1, '2021-08-04 16:30:00'),
(38, 5, 0, 4, 1, 'HB1900001*', 2022, 'Taluka Qasimabad Construction of CC Block at village Haji Qadir Bux Doomro near Hajra Plaza, Ward-7', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:34:38'),
(39, 5, 0, 1, 1, 'HB1900002*', 2022, 'Construction of CC Block at Hur Camp Ward-2', '2022-06-30', 0.65, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:35:15'),
(40, 5, 0, 4, 1, 'HB1900003*', 2022, 'Construction of CC Block at Hur Camp Ward-2', '2022-06-30', 0.65, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:36:31'),
(41, 5, 0, 1, 1, 'HB1900004*', 2022, 'Construction of CC Block at Qasimabad Phase-I Ward-12', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:37:26'),
(42, 5, 0, 1, 1, 'HB1900005*', 2022, 'Construction of CC Block at Al-Shahbaz Colony', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:38:14'),
(43, 5, 0, 1, 1, 'HB1900006*', 2022, 'Construction of CC Block at Sehrish Nagar Ward-19', '2022-06-30', 0.65, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:39:07'),
(44, 5, 0, 1, 1, 'HB1900007*', 2022, 'Construction of CC Block at S.R.T.C Colony Ward-13', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:40:01'),
(45, 5, 0, 1, 1, 'HB1900008*', 2022, 'Construction of CC Block at Baghrani Goth Ward-27', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:40:48'),
(46, 5, 0, 1, 1, 'HB1900009*', 2022, 'Construction of CC Block at village Noor Khan Chang', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:41:33'),
(47, 5, 0, 1, 1, 'HB1900010*', 2022, 'Construction of CC Block at Sadat Ali Mahesar Happy Phase-III Ward-4', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:42:22'),
(48, 5, 0, 1, 1, 'HB1900011*', 2022, 'Construction of CC Block at Prince Town Ward-08', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:43:32'),
(49, 5, 0, 1, 1, 'HB1900012*', 2022, 'HB1900012*	Construction of CC Block at Byepass Town Phase-I', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:44:18'),
(50, 5, 0, 1, 1, 'HB1900013*', 2022, 'Construction of CC Block at Byepass Town Phase-II', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:45:22'),
(51, 5, 0, 1, 1, 'HB1900014*', 2022, 'Imrovement of Road from Main Qasimabad Shaikh Ayaz road to Gulshan-e-Habib Taluka Qasimabad', '2022-06-30', 3.24, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:57:34'),
(52, 5, 0, 1, 1, 'HB1900015', 2022, 'Imrovement of CC Block Hadi Nagar Imam Bargha i/e link roads Taluka Qasimabad', '2022-06-30', 1.76, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:58:40'),
(53, 5, 0, 1, 1, 'HB1900016*', 2022, 'Construction of CC Block street in Ravenue Colony Phase-I Taluka Qasimabad', '2022-06-30', 0.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 16:59:31'),
(54, 5, 0, 4, 1, 'HB1900017*', 2022, 'Improvement of Al-Mustafa Town Phase-I and II CC Block street i/e links Taluka Qasimabad', '2022-06-30', 1.82, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:00:21'),
(55, 5, 0, 1, 1, 'HB1900018*', 2022, 'Construction of CC Block of Main Street at Abdullah Heaven Taluka Qasimabad', '2022-06-30', 1.59, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:01:13'),
(56, 5, 0, 1, 1, 'HB1900019*', 2022, 'Construction of CC Block Extension Phase-II Revenue Colony Taluka Qasimabad', '2022-06-30', 0.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:02:26'),
(57, 5, 0, 1, 1, 'HB1900020*', 2022, 'Construction of CC Block Street at Old Wahdat Colony Taluka Qasimabad', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:21:19'),
(58, 5, 0, 1, 1, 'HB1900021*', 2022, 'Improvement of road from Police Check Post to Abdullah Garden Phase-I Taluka Qasimabad', '2022-06-30', 1.52, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:22:00'),
(59, 5, 0, 1, 1, 'HB1900022*', 2022, 'Construction of CC Block Street at Abbas Town Phase-I Near Jahania Chowk Taluka Qasimabad', '2022-06-30', 2.10, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:27:48'),
(60, 5, 0, 1, 1, 'HB1900023*', 2022, 'Construction of CC Block at Village Bhuro Khoso UC-Hatri near Darya Baig Mughal Taluka Qasimabad', '2022-06-30', 1.98, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:30:02'),
(61, 5, 0, 1, 1, 'HB1900024*', 2022, 'Construction of CC road at Qasimabad Phase-I from Korai Market to Hasim Residency Taluka Qasimabad', '2022-06-30', 1.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:30:53'),
(62, 5, 0, 3, 1, 'HB1900025*', 2022, 'Taluka Latifabad Construction of Paving Blocks of Various Streets of UC-92 Taluka Latifabad', '2022-06-30', 2.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:49:10'),
(63, 5, 0, 3, 1, 'HB1900026*', 2022, 'Construction of Paving Blocks of Various Streets of UC-91 Taluka Latifabad', '2022-06-30', 4.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:49:57'),
(64, 5, 0, 3, 1, 'HB1900027*', 2022, 'Construction of CC /Paving Blocks of Various Streets of UC-93 Taluka Latifabad', '2022-06-30', 5.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:50:52'),
(65, 5, 0, 3, 1, 'HB1900028*', 2022, 'Construction of Paving Blocks of Various Streets of UC-94 Taluka Latifabad', '2022-06-30', 0.90, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:54:20'),
(66, 5, 0, 3, 1, 'HB1900029*', 2022, 'Construction of Paving Blocks of Various Streets of UC-95 Tawakal Mir Jatt Taluka Latifabad', '2022-06-30', 3.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:32:27'),
(67, 3, 0, 3, 1, 'HB1900030*', 2022, 'Improvement of road work for streets of Unar Mirani Goth UC-89 Taluka Latifabad', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:53:55'),
(68, 5, 0, 3, 1, 'HB1900031*', 2022, 'Construction of Paving Blocks of Various Streets of Waheed Colony UC-85 Taluka Latifabad', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:53:58'),
(69, 5, 0, 1, 1, 'HB1900032*', 2022, 'Improvement / Construction of road / CC work for streets of UC-86, 87 Taluka Latifabad', '2022-06-30', 3.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:57:45'),
(70, 5, 0, 3, 1, 'HB1900033*', 2022, 'Construction of Paving Blocks of Various Streets of UC-86 Taluka Latifabad', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:32:20'),
(71, 5, 0, 3, 1, 'HB1900034*', 2022, 'Construction of CC / Paving Blocks of Various Streets of UC-83 Taluka Latifabad', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:32:23'),
(72, 5, 0, 3, 1, 'HB1900035*', 2022, 'Construction of CC / Paving Blocks of Various Streets of UC-53 Taluka Latifabad', '2022-06-30', 3.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 17:57:56'),
(73, 5, 0, 3, 1, 'HB1900036*', 2022, 'Construction of CC / Paving Blocks and Drainage of Various Streets of UC-54 Taluka Latifabad', '2022-06-30', 2.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:31:26'),
(74, 3, 0, 3, 1, 'HB1900037*', 2022, 'Construction of CC / Paving Blocks of Various Streets of UC-55 Taluka Latifabad', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:02:42'),
(75, 5, 0, 1, 1, 'HB1900038*', 2022, 'Construction of Paving Blocks of Various Streets of UC-61 Taluka Latifabad', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:02:46'),
(76, 5, 0, 3, 1, 'HB1900039*', 2022, 'Construction of Paving Blocks of Various Streets of UC-70 Taluka Latifabad', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:32:10'),
(77, 5, 0, 3, 1, 'HB1900040*', 2022, 'Construction of Paving Blocks of Various Streets of UC-71 Taluka Latifabad', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:40:48'),
(78, 5, 0, 3, 1, 'HB1900041*', 2022, 'Construction of Paving Blocks of Various Streets of UC-72 Taluka Latifabad', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:32:05'),
(79, 5, 0, 3, 1, 'HB1900042*', 2022, 'Construction of Paving Blocks of Various Streets of UC-79 Taluka Latifabad', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:11:55'),
(80, 5, 0, 3, 1, 'HB1900043*', 2022, 'Construction of Paving Blocks of Various Streets of UC-80 Taluka Latifabad', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:32:03'),
(81, 5, 0, 3, 1, 'HB1900044*', 0, 'Construction of Road / Paver Work for Village Jamali Goth UC-92 Latifabad Hyderabad', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:12:02'),
(82, 5, 0, 3, 1, 'HB1900045*', 2022, 'Construction of Paver Work for Streets at Gujrati Para UC-90 Latifabad Hyderabad', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:31:10'),
(83, 3, 0, 1, 1, 'HB1900046*', 2022, 'Construction of Paver Work for Streets of UC-81 Latifabad Hyderabad', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:16:38'),
(84, 5, 0, 3, 1, 'HB1900047*', 2022, 'Construction of Paving Block of Various Streets of UC-71 Latifabad Hyderabad', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:31:59'),
(85, 5, 0, 3, 1, 'HB1900048*', 2022, 'Construction of Boundary Wall for Government Masjid Middle School Makrani Para UC-79 Latifabad Hyderabad', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:31:05'),
(86, 5, 0, 3, 1, 'HB1900049*', 2022, 'Construction of CC Paving Block of Various Streets of UC-80 Latifabad Hyderabad', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:16:50'),
(87, 5, 0, 3, 1, 'HB1900050*', 2022, 'Improvement of Asphalt Road from Papssport Office to Saitho House via Site Police Station UC-93 Taluka Latifabad', '2022-06-30', 6.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:31:01'),
(88, 5, 0, 1, 1, 'HB1900051*', 2022, 'Providing Drianage System at Bhittai Town UC-Husri Taluka Latifabad', '2022-06-30', 2.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:31:54'),
(89, 5, 0, 3, 1, 'HB1900052*', 2022, 'Construction of CC Blocks Streets at Bhittai Town UC Husri Taluka Latifabad', '2022-06-30', 2.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:23:29'),
(90, 5, 0, 3, 1, 'HB1900053*', 2022, 'Improvement of CC road at Arif Khanzada i/c link shogan House and Fan wali gali unit no.11 (UC-66) Taluka Latifabad', '2022-06-30', 0.60, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:31:41'),
(91, 5, 0, 3, 1, 'HB1900054*', 2022, 'Improvement of CC road at Mehar Ali Society (Afsheen Street) unit no.11Taluka Latifabad', '2022-06-30', 0.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:23:35'),
(92, 5, 0, 3, 1, 'HB1900055*', 2022, 'Improvement of CC road Unit No.8 Taluka Latifabad (i) Link Guddu Counclor (ii) Link Bi-Khala UC-76 Taluka Latifabad', '2022-06-30', 0.60, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:30:53'),
(93, 5, 0, 3, 1, 'HB1900056*', 2022, 'Taluka Rural Construction of CC Block various villages at UC Halepota Taluka Rural District Hyderabad', '2022-06-30', 3.11, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:30:51'),
(94, 5, 0, 3, 1, 'HB1900057*', 2022, 'Construction of CC Block various villages at UC Tando Qaiser Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:29:28'),
(95, 5, 0, 3, 1, 'HB1900058*', 2022, 'Construction of CC Block various villages at UC Tando Alam Mari Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:29:31'),
(96, 5, 0, 3, 1, 'HB1900059*', 2022, 'Construction of CC Block various villages at UC Mori Taluka Rural District Hyderabad', '2022-06-30', 1.55, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:29:33'),
(97, 5, 0, 4, 1, 'HB1900060*', 2022, 'Construction of CC Block various villages at UC Tando Fazal Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:41:49'),
(98, 5, 0, 4, 1, 'HB1900061*', 2022, 'Construction of CC Block various villages at UC Bohiki Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:41:56'),
(99, 5, 0, 4, 1, 'HB1900062*', 2022, 'Construction of CC Block various villages at UC Sawan Khan Gopang Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:42:37'),
(100, 5, 0, 4, 1, 'HB1900063*', 2022, 'Construction of CC Block various villages at UC Seri Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:43:02'),
(101, 5, 0, 4, 1, 'HB1900064*', 2022, 'Construction of CC Block various villages at UC Almani Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:42:50'),
(102, 5, 0, 4, 1, 'HB1900065*', 2022, 'Construction of CC Block various villages at UC Senhwar Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:48:03'),
(103, 5, 0, 4, 1, 'HB1900066*', 2022, 'Construction of CC Block various villages at UC Narejani Taluka Rural District Hyderabad', '2022-06-30', 1.55, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:48:00'),
(104, 5, 0, 4, 1, 'HB1900067*', 2022, 'Construction of CC Block various villages at UC Mossa Khatian Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:48:18'),
(105, 5, 0, 4, 1, 'HB1900068*', 2022, 'Construction of CC Block various villages at UC Dhamachani Taluka Rural District Hyderabad', '2022-06-30', 1.55, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:48:13'),
(106, 5, 0, 4, 1, 'HB1900069*', 2022, 'Construction of CC Block various villages at UC Tando Hyder Taluka Rural District Hyderabad', '2022-06-30', 1.55, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:47:21'),
(118, 5, 0, 4, 1, 'HB1900070*', 2022, 'Construction of CC Block various villages at UC Dali Wadi Taluka Rural District Hyderabad', '2022-06-30', 0.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:54:46'),
(120, 3, 0, 4, 1, 'HB1900072*', 2022, 'Construction of CC Block various villages at UC Chukhi Taluka Rural District Hyderabad', '2022-06-30', 3.10, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:57:49'),
(121, 5, 0, 4, 1, 'HB1900073*', 2022, 'Construction of CC Streets various villages at UC Hatri Taluka Rural District Hyderabad', '2022-06-30', 1.40, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:57:31'),
(122, 5, 0, 4, 1, 'HB1900071*', 2022, 'Construction of CC Block various villages at UC Moolan Taluka Rural District Hyderabad', '2022-06-30', 2.33, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-04 18:54:05'),
(124, 5, 0, 4, 1, 'HB1900074*', 2022, 'Construction of CC Block various villages at UC Behram Taluka Rural District Hyderabad', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:43:43'),
(125, 5, 0, 4, 1, 'HB1900075*', 2022, 'Construction of CC Block various villages at UC Barchani Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:43:13'),
(126, 5, 0, 4, 1, 'HB1900076*', 2022, 'Construction of CC Streets various villages at UC Masu Bhurgri Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:43:59'),
(127, 5, 0, 4, 1, 'HB1900077*', 2022, 'Construction of various villages at UC Tando Jam Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:43:23'),
(128, 5, 0, 4, 1, 'HB1900078*', 2022, 'Construction of CC Blocks various villages at UC Sawan Khan Gopang Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:43:19'),
(129, 5, 0, 4, 1, 'HB1900079*', 2022, 'Construction of CC Streets various villages at UC Husri Taluka Rural District Hyderabad', '2022-06-30', 4.95, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:47:22'),
(130, 5, 0, 4, 1, 'HB1900080*', 2022, 'Construction of CC Block various villages at UC Tando Qaiser Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:48:18'),
(131, 5, 0, 4, 1, 'HB1900081*', 2022, 'Construction of CC Block various villages at UC Tando Hyder Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:48:16'),
(132, 5, 0, 4, 1, 'HB1900082*', 2022, 'Construction of CC Block various villages at UC Mori Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:49:09'),
(133, 5, 0, 4, 1, 'HB1900083*', 2022, 'Construction of CC Block various villages at UC Moolan Taluka Rural District Hyderabad', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:54:44'),
(134, 5, 0, 4, 1, 'HB1900084*', 2022, 'Construction of CC Block various villages at UC Bohiki Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:53:43'),
(135, 5, 0, 4, 1, 'HB1900085*', 2022, 'Construction of CC Block various villages at UC Chukhi Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:54:06'),
(136, 5, 0, 4, 1, 'HB1900086*', 2022, 'Construction of CC Block various villages at UC Senhwar Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:54:03'),
(137, 5, 0, 4, 1, 'HB1900087*', 2022, 'Construction of CC Block various villages at UC Tando Alam Mari Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:54:24'),
(138, 5, 0, 4, 1, 'HB1900088*', 2022, 'Construction of CC Block various villages at UC Almani Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 10:54:20'),
(139, 3, 0, 4, 1, 'HB1900089*', 2022, 'Construction of CC Block various villages at UC Tando Fazal Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:03:28'),
(140, 5, 0, 4, 1, 'HB1900090*', 2022, 'Construction of CC Block various villages at UC Tando Fazal Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:04:21'),
(141, 5, 0, 4, 1, 'HB1900091*', 2022, 'Construction of CC Block various villages at UC Halepota Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:03:35'),
(142, 5, 0, 4, 1, 'HB1900092*', 2022, 'Construction of CC Block Various Villages at UC Moosa Khatiyan  Taluka Rural District Hyderabad', '2022-06-30', 1.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:04:34'),
(143, 5, 0, 4, 1, 'HB1900093*', 2022, 'Construction of CC Paving Block, CC Roads & Drainge Line in various Areas PS-65 Taluka Latifabad Hyderabad', '2022-06-30', 36.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:04:14'),
(144, 5, 0, 4, 1, 'HB1900094*', 2022, 'Taluka City Improvement of Zuhaib vighio Street UC No.48 Taluka City', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:03:40'),
(145, 5, 0, 2, 1, 'HB1900095*', 2022, 'Improvement of Mashori Street UC No.36 Ward No.03 Taluka City', '2022-06-30', 1.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:13:34'),
(146, 5, 0, 2, 1, 'HB1900096*', 2022, 'Improvement of Amanullah Street UC No.36 Ward No.03 Taluka City', '0000-00-00', 1.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:14:28'),
(147, 5, 0, 2, 1, 'HB1900097*', 2022, 'Improvement of Hussaini Chowk Street UC No.36 Ward No.03 Taluka City', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:13:45'),
(148, 5, 0, 2, 1, 'HB1900098*', 2022, 'Improvement of lal Masjid / Moin Shaikh Street UC No.33 Taluka City', '2022-06-30', 0.90, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:13:47'),
(149, 5, 0, 2, 1, 'HB1900099*', 2022, 'Improvement of lal Masjid / Moin Shaikh Street UC No.33 (Back Side) Taluka City', '0000-00-00', 0.90, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:14:25'),
(150, 5, 0, 2, 1, 'HB1900100*', 2022, 'Improvement of Ewan-E-Qureshi / Faisal Qureshi Street UC No.34 Taluka City', '2022-06-30', 0.90, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:14:53'),
(151, 5, 0, 2, 1, 'HB1900101*', 2022, 'Improvement of Mandar Wali Gali Street UC No. 50 Taluka City', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:14:20'),
(152, 5, 0, 2, 1, 'HB1900102*', 2022, 'Improvement of Kashif Chandio Street UC No. 50 Taluka City', '2022-06-30', 0.72, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:13:56'),
(153, 5, 0, 2, 1, 'HB1900103*', 2022, 'Improvement of Mohammadi Masjid Street UC No. 04 Taluka City', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:22:48'),
(154, 5, 0, 2, 1, 'HB1900104*', 2022, 'Improvement of Faheem Samoo Street UC No. 36 Taluka City', '2022-06-30', 0.90, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:23:28'),
(155, 5, 0, 2, 1, 'HB1900105*', 2022, 'Improvement of Khatyan Street UC No. 36 Taluka City', '2022-06-30', 0.60, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:23:25'),
(156, 5, 0, 2, 1, 'HB1900106*', 2022, 'Improvement of Keri Faqir Street UC No. 36 Taluka City', '2022-06-30', 0.40, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:24:21'),
(157, 5, 0, 3, 1, 'HB1900107*', 2022, 'Improvement of Madarsa Anwar-ul-Uloom & Naeem Street UC No. 36 Taluka City', '2022-06-30', 1.45, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:24:07'),
(158, 5, 0, 2, 1, 'HB1900108*', 2022, 'Improvement of Nooro Wadha Street UC No. 35 Taluka City', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:23:03'),
(159, 5, 0, 2, 1, 'HB1900109*', 2022, 'Improvement of Mehboob Chandio Street UC No. 35 Taluka City', '2022-06-30', 0.95, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:31:21'),
(160, 5, 0, 2, 1, 'HB1900110*', 2022, 'Improvement of Arshad Achho Street UC No. 06 Taluka City', '2022-06-30', 0.90, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:30:49'),
(161, 5, 0, 2, 1, 'HB1900111*', 2022, 'Improvement of Jhanzeeb Baba Street UC No. 36 Taluka City', '2022-06-30', 1.18, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:31:34'),
(162, 5, 0, 2, 1, 'HB1900112*', 2022, 'Improvement of CC Paver Babu Rahim Ursani Street UC No. 36 Taluka City', '2022-06-30', 0.90, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:31:17'),
(163, 5, 0, 2, 1, 'HB1900113*', 2022, 'Improvement of various Roads UC-01 Taluka City', '2022-06-30', 6.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:31:44'),
(164, 5, 0, 2, 0, 'HB1900114*', 2022, 'Improvement of CC Paver road Ghumanabad / Abdullah Chang village Bachal Solangi  UC-02 Taluka City', '2022-06-30', 8.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:30:56'),
(165, 5, 0, 2, 1, 'HB1900115*', 2022, 'Improvement of CC Paver road Gadi Khata / Ebrat Press / Qazi Mohala UC-25 Taluka City', '2022-06-30', 4.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:37:46'),
(166, 5, 0, 2, 1, 'HB1900116*', 2022, 'Improvement of CC Paver road Khokhar Mohala Streets UC-26 Taluka City', '2022-06-30', 4.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:37:30'),
(167, 5, 0, 2, 1, 'HB1900117*', 2022, 'Improvement of CC Paver road Sheesh Mohala main road Sirighat UC-48 & 49 Taluka City', '2022-06-30', 7.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:37:27'),
(168, 5, 0, 2, 1, 'HB1900118*', 2022, 'Improvement of CC Paver road Silawat Para / Market / Amil Colony  UC-49 Taluka City', '2022-06-30', 3.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:37:43'),
(169, 5, 0, 2, 1, 'HB1900119*', 2022, 'Improvement of CC Paver road @ Dadan Shah Mohalla  UC-29 Taluka City', '2022-06-30', 3.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:02:08'),
(170, 5, 0, 2, 1, 'HB1900119*', 2022, 'Improvement of CC Paver road @ Dadan Shah Mohalla  UC-29 Taluka City', '2022-06-30', 3.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:43:40'),
(171, 5, 0, 2, 1, 'HB1900120*', 2022, 'Improvement of CC Paver road Waseem Qureshi / Khilji Mohalla UC-34 Taluka City', '2022-06-30', 2.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:43:57'),
(172, 5, 0, 2, 1, 'HB1900121*', 2022, 'Improvement of CC Paver / CC Topping @ Doctors Colony / Janat Bhatti UC-32 Taluka City', '2022-06-30', 2.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:43:47'),
(173, 5, 0, 2, 1, 'HB1900122*', 2022, 'Improvement of CC Topping / CC Drain UC-37 & 39 Taluka City', '2022-06-30', 2.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:50:31'),
(174, 5, 0, 2, 1, 'HB1900123*', 2022, 'Improvement of CC Topping @ OPD Civil Hospital UC-31 Taluka City', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:50:04'),
(175, 5, 0, 2, 1, 'HB1900124*', 2022, 'Construction Asphat Conrete road from Emam Clinic to Aliabad Primary School UC No.03 Taluka City', '2022-06-30', 8.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:51:13'),
(176, 5, 0, 2, 1, 'HB1900125*', 2022, 'Improvement of CC Paver road @ Porha Sheedxi Hajano Mohallah / Imran Plaza UC-34 Taluka Cit', '2022-06-30', 5.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:51:11'),
(177, 6, 0, 2, 1, 'HB12P00098', 2021, 'Additional of Class Rooms in Existing Primary School in Taluka City  & Taluka Qasimabad District Hyderabad (18 Class Rooms)  under Block Allocation 2011-2012 Programme.', '2021-06-30', 18.62, 17.97, 17.97, 0.24, 0.00, 0.00, 1, '2021-08-05 12:15:49'),
(178, 6, 0, 4, 1, 'HB12P00100', 2021, 'Additional of Class Rooms in Existing Primary School in Taluka Rural District Hyderabad (18 Class Rooms) under Block Allocation 2011-2012 Programme.', '2021-06-30', 18.62, 21.52, 18.62, 0.94, 0.07, 0.00, 1, '2021-08-05 11:50:17'),
(179, 6, 0, 3, 1, 'HB12P00101', 2021, 'Construction of Building for Shelterless Existing  Primary Schools (02-Roomed) in District Hyderabad (07 Units) under Block Allocation 2011-2012 Programme.', '2021-06-30', 17.63, 18.31, 17.63, 1.28, 0.10, 0.00, 1, '2021-08-05 11:54:19'),
(180, 5, 0, 2, 1, 'HB1900126*', 2022, 'Improvement of CC Topping srounding Khaki Shah Mohallah Suhil Soomro Sultan Decoraction Street UC-48 Taluka City', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:54:26'),
(181, 5, 0, 2, 1, 'HB1900127*', 2022, 'Improvement of CC paver road Suchi para J.Bhawani Ka Mandir / Hindu Compound / Jhandi Wadha & Asif Patoli Street UC No.48', '2022-06-30', 3.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:54:15'),
(182, 5, 0, 2, 1, 'HB1900128*', 2022, 'Improvement of Asphaly / CC Paver Homopathic College to Hyder Chowk in portion UC No.22, 23 Taluka City', '2022-06-30', 4.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:58:39'),
(183, 6, 0, 3, 1, 'HB12P00102', 2021, 'Additional of Class Rooms in Existing Middle Schools in  District Hyderabad (15 Class Rooms) under Block Allocation 2011-2012 Programme.', '2021-06-30', 18.04, 15.38, 15.38, 1.06, 0.10, 0.00, 1, '2021-08-05 12:14:02'),
(184, 5, 0, 2, 1, 'HB1900129*', 2022, 'Improvement of CC Paver road from Ewan-E-Qureshi Hospital Opposite Street UC No.34 (Shezad Palzza) Taluka City', '2022-06-30', 0.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 11:56:13'),
(185, 6, 0, 1, 1, 'HB12P00105', 2021, 'Constt: / Re-constt: of (02 Roomed) Primary Schools in Taluka Latifabad & Qasimabad District Hyderabad (07 Units) under Block Allocation 2011-2012 Programme.', '2021-06-30', 18.23, 15.95, 15.95, 0.62, 0.10, 0.00, 1, '2021-08-05 12:15:37'),
(186, 6, 0, 4, 1, 'HB12P00106', 2021, 'Constt: / Re-constt: of (02 Roomed) Primary Schools in Taluka Rural Hyd: District Hyderabad (07 Units) under Block Allocation 2011-2012 Programme.', '2021-06-30', 18.23, 19.92, 18.23, 0.88, 0.20, 0.00, 1, '2021-08-05 12:15:30'),
(187, 5, 0, 2, 1, 'HB1900130*', 2022, 'Improvement of CC Paver road @ Hakeem Qureshi Street UC No.34 Taluka City', '2022-06-30', 0.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:06:02'),
(188, 5, 0, 2, 1, 'HB1900131*', 2022, 'Improvement of CC paver road @ Safy Jatoi UC No.03 Taluka City', '2022-06-30', 0.70, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:03:39'),
(189, 6, 0, 2, 1, 'HB12P00107', 2021, 'Constt: / Re-constt: of (05 Roomed) Primary Schools in Taluka City District Hyderabad (03 Units) under Block Allocation 2011-2012 Programme.', '2021-06-30', 18.63, 16.70, 16.70, 2.45, 0.35, 0.00, 1, '2021-08-05 12:04:08'),
(190, 5, 0, 2, 1, 'HB1900132*', 2022, 'Improvement of CC paver road Sahib Khan Village UC No.05 Taluka City', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:05:14'),
(191, 5, 0, 2, 1, 'HB1900133*', 2022, 'Improvement of CC Topping @ Makka Masjid UC No.23 Taluka City', '2022-06-30', 0.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:05:31'),
(192, 6, 0, 3, 1, 'HB12P00109', 2021, 'Up-gradation of Primary Schools Middle Schools in District Hyderabad (03 Units)  under Block Allocation 2011-2012 Programme.', '2021-06-30', 29.84, 20.12, 20.12, 3.50, 0.50, 0.00, 1, '2021-08-05 12:04:14'),
(193, 6, 0, 2, 1, 'HB12P00110', 2021, 'Repair / Renovation of Existing Primary Schools in Taluka City Hyderabad (13 Units)  under Block Allocation 2011-2012 Programme.', '2021-06-30', 17.31, 16.93, 16.93, 2.82, 0.10, 0.00, 1, '2021-08-05 12:15:20'),
(194, 6, 0, 4, 1, 'HB12P00113', 2021, 'Repair / Renovation of Existing Primary Schools in Taluka Rural & District Hyderabad (26 Units) under Block Allocation 2011-2012 Programme.', '2021-06-30', 20.00, 18.37, 18.32, 1.29, 0.00, 0.00, 1, '2021-08-05 12:07:05'),
(195, 5, 0, 2, 1, 'HB1900134*', 2022, 'Improvement of CC paver road Haji Shah Masjid to Memon Hospital via Pakistan Pakwan UC No.48 Taluka City', '2022-06-30', 1.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:07:53'),
(196, 6, 0, 3, 1, 'HB12P00114', 2021, 'Repair / Renovation of Existing Middle Schools in District Hyderabad (12 Units)  under Block Allocation 2011-2012 Programme.', '2021-06-30', 20.00, 18.84, 18.84, 0.40, 0.00, 0.00, 1, '2021-08-05 12:08:01'),
(197, 6, 0, 3, 1, 'HB12P00115', 2021, 'Repair / Renovation of Existing Primary / Middle Schools in District Hyderabad 2012-13 Programe', '2021-06-30', 40.00, 35.23, 35.23, 1.54, 0.42, 0.00, 1, '2021-08-05 12:15:07'),
(198, 5, 0, 2, 1, 'HB1900135*', 2022, 'Improvement of CC  Topping @ Zahid House to Raees Karyana Store UC No.23 Taluka City', '2022-06-30', 0.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:09:11'),
(199, 5, 0, 1, 1, 'HB1900136*', 2022, 'Improvement of CC Paver road Imam Bargha Moula Hussain Kachi Mohalla Qaidabad UC No.38 Taluka City', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:10:10'),
(200, 6, 0, 3, 1, 'HB12P00116', 2021, 'Up-gradation of Primary Schools to Middle Schools in Dsitrict Hyderabad (05 Units) 2012-13 Program', '2021-06-30', 36.27, 24.05, 24.05, 3.50, 0.30, 0.00, 1, '2021-08-05 12:10:07'),
(201, 6, 0, 3, 1, 'HB12P00117', 2021, 'Additional of Class Rooms in Exiting Primary / Middle Schools in District Hyderabad (25-C/R) 2012-13 Program.', '2021-06-30', 34.35, 28.16, 28.16, 0.00, 0.27, 0.00, 1, '2021-08-05 12:11:27'),
(202, 5, 0, 2, 1, 'HB1900137*', 2022, 'Improvement of CC Paver road Sahibzada Abu-ul-Khair House Street UC No.34 Taluka City', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:11:23'),
(203, 5, 0, 2, 1, 'HB1900138*', 2022, 'Improvement of CC Topping @ Zulfiqar Ali Mangrio Street UC No.16 Taluka City', '2022-06-30', 0.80, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:12:33'),
(204, 5, 0, 2, 1, 'HB1900139*', 2022, 'Improvement of CC Paver road Masjid-E-Aqsa / Moin Shaikh Street UC No,34 Taluka City', '2022-06-30', 3.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:13:32'),
(205, 5, 0, 2, 1, 'HB1900140*', 2022, 'Improvement of CC Paver road Dhani Bux Purto Street Toheed Colony UC No.03 Taluka City', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:14:14'),
(206, 5, 0, 2, 1, 'HB1900141*', 2022, 'Improvement of Road CC Paver Road @ UC No.03 Taluka City', '2022-06-30', 3.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:15:18'),
(207, 5, 0, 2, 1, 'HB1900142*', 2022, 'Improvement of Road CC Paver Road @ UC No.04 Taluka City', '2022-06-30', 3.30, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:16:11'),
(208, 6, 0, 3, 1, 'HB12P00159', 2021, 'Provision of Furniture / Equiments in Exiting Elementary Schools in District Hyderabad 2012-13 Program', '2021-06-30', 15.00, 0.00, 10.86, 0.00, 0.00, 1.50, 1, '2021-08-05 12:17:20'),
(209, 5, 0, 2, 1, 'HB1900143*', 2022, 'Improvement of Road CC Paver Road @ UC No.06 Taluka City', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:17:25'),
(210, 5, 0, 2, 1, 'HB1900144*', 2022, 'Improvement of Road CC Paver Road @ UC No.07 Taluka City', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:18:17'),
(211, 6, 0, 4, 1, 'HB13P00171', 2021, 'Construction of Two Roomed Building for Shelterless Existing Primary Schools in Taluka Rural / District Hyderabad under Block Allocation (2013-14-Programme) (03-Units)', '2021-06-30', 15.95, 14.97, 14.97, 0.80, 0.05, 0.00, 1, '2021-08-05 12:18:56'),
(212, 5, 0, 2, 1, 'HB1900145*', 2022, 'Improvement of Road CC Paver Road @ UC No.07 Taluka City', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:19:47'),
(213, 6, 0, 4, 1, 'HB13P00172', 2021, 'Construction of Two Roomed Building for Shelterless Existing Primary Schools in Taluka Rural / District Hyderabad under Block Allocation (2013-14-Programme) (02-Units)', '2021-06-30', 10.65, 0.00, 6.07, 0.00, 0.05, 0.00, 1, '2021-08-05 12:20:37'),
(214, 5, 0, 2, 1, 'HB1900146*', 2022, 'Improvement of Road CC Paver Road @ UC No.13 Taluka City', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:20:24'),
(215, 5, 0, 2, 1, 'HB1900147*', 2022, 'Improvement of Road CC Paver Road @ UC No.14 Taluka City', '2022-06-30', 3.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:21:12'),
(216, 5, 0, 2, 1, 'HB1900148*', 2022, 'Improvement of Road CC Paver Road @ UC No.15 Taluka City', '2022-06-30', 3.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:22:16'),
(217, 6, 0, 2, 1, 'HB13P00173', 2021, 'Construction of Five Roomed Building for Shelterless Existing Primary Schools at Raees GGPS Raees Pacca Qila U.C-08 in Taluka City / District Hyderabad under Block Allocation (2013-14-Programme)', '2021-06-30', 12.02, 2.23, 2.22, 4.00, 0.30, 0.00, 1, '2021-08-05 12:23:02'),
(218, 5, 0, 2, 1, 'HB1900149*', 2022, 'Improvement of Road CC Paver Road @ UC No.16 Taluka City', '2022-06-30', 4.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:23:10'),
(219, 6, 0, 3, 1, 'HB13P00174', 2021, 'Addition of Class Rooms in Existing Primary / Elementary Schools in District Hyderabad  (08-ClassRooms) under Block Allocation (2013-14-Programme)', '2021-06-30', 16.53, 11.34, 11.24, 0.10, 0.35, 0.00, 1, '2021-08-05 12:23:53'),
(220, 5, 0, 3, 1, 'HB1900150*', 2022, 'Improvement of Road CC Paver Road @ UC No.17 Taluka City', '2022-06-30', 2.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:24:49'),
(221, 6, 0, 3, 1, 'HB13P00176', 2021, 'Construction / Reconstruction of Two Roomed Building Existing Primary Schools in District Hyderabad under Block Allocation (2013-14-Programme) (03-Units)', '2021-06-30', 16.46, 12.91, 12.91, 0.10, 0.05, 0.00, 1, '2021-08-05 12:24:50'),
(222, 5, 0, 2, 1, 'HB1900151*', 2022, 'Improvement of Road CC Paver Road @ UC No.40 Taluka City', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:25:07'),
(223, 6, 0, 3, 1, 'HB13P00177', 2021, 'Construction / Reconstruction of Two Roomed Building Existing Primary Schools in District Hyderabad under Block Allocation (2013-14-Programme) (03-Units)', '2021-06-30', 16.49, 14.94, 14.94, 0.15, 0.05, 0.00, 1, '2021-08-05 12:25:57'),
(224, 5, 0, 2, 1, 'HB1900152*', 2022, 'Improvement of Road CC Paver Road @ UC No.41 Taluka City', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:26:39'),
(225, 6, 0, 2, 1, 'HB13P00178', 2021, 'Rehabilitation of Existing Primary / Middle Schools in Taluka City / District Hyderabad under Block Allocation (2013-14-Programme) (07-Units)', '2021-06-30', 11.77, 11.33, 11.33, 0.00, 0.30, 0.00, 1, '2021-08-05 12:27:01'),
(226, 3, 0, 2, 1, 'HB1900153*', 2022, 'Improvement of Road CC Paver Road @ UC No.43 Taluka City', '2022-06-30', 3.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:27:53'),
(227, 5, 0, 2, 1, 'HB1900154*', 2022, 'Improvement of Road CC Paver Road @ UC No.43 Taluka City', '2022-06-30', 1.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:28:33'),
(228, 6, 0, 3, 1, 'HB13P00179', 2021, 'Rehabilitation of Existing Primary / Middle Schools in Taluka Latifabad District Hyderabad under Block Allocation (2013-14-Programme) (05-Units)', '2021-06-30', 11.31, 9.31, 9.10, 0.16, 0.35, 0.00, 1, '2021-08-05 12:29:03'),
(229, 5, 0, 2, 1, 'HB1900155*', 2022, 'Improvement of Road CC Paver Road @ UC No.44 Taluka City', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:29:26'),
(230, 6, 0, 1, 1, 'HB13P00180', 2021, 'Rehabilitation of Existing Primary / Middle Schools in Taluka Qasimabad District Hyderabad under Block Allocation (2013-14-Programme) (07-Units)', '2021-06-30', 10.48, 10.46, 10.46, 0.40, 0.29, 0.00, 1, '2021-08-05 12:29:53'),
(231, 5, 0, 2, 1, 'HB1900157*', 2022, 'Improvement of Road CC Paver Road @ UC No.52 Taluka City', '2022-06-30', 1.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:30:51'),
(232, 6, 0, 4, 1, 'HB13P00181', 2021, 'Rehabilitation of Existing Primary / Middle Schools in Taluka Rural / District Hyderabad under Block Allocation  (2013-14-Programme) (06-Units)', '2021-06-30', 14.15, 14.63, 14.63, 0.34, 0.25, 0.00, 1, '2021-08-05 12:31:15'),
(233, 3, 0, 2, 1, 'HB1900158*', 2022, 'Improvement of Road CC Paver Road @ UC No.09 Taluka City', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:32:36'),
(234, 6, 0, 4, 1, 'HB13P00182', 2021, 'Rehabilitation of Existing Primary / Middle Schools in Taluka Rural / District Hyderabad under Block Allocation  (2013-14-Programme) (06-Units)', '2021-06-30', 14.38, 14.16, 14.16, 0.75, 0.03, 0.00, 1, '2021-08-05 12:32:07'),
(235, 6, 0, 1, 1, 'HB15P00062', 2021, 'Rehabilitation of GBPS New Wahdat Colony (2015-16 Programme) Qasimabad', '2021-06-30', 0.80, 0.70, 0.70, 0.04, 0.00, 0.00, 1, '2021-08-05 12:32:59'),
(236, 5, 0, 2, 1, 'HB1900159*', 2022, 'Improvement of Road CC Paver Road @ UC No.10 Taluka City', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:33:15'),
(237, 6, 0, 1, 1, 'HB15P00064', 2021, 'Construction / Re-construction of GBPS Shafi Mohammad Brohi (2015-16 Programme) Qasimabad', '2021-06-30', 0.93, 0.01, 0.89, 0.01, 0.00, 0.00, 1, '2021-08-05 12:33:44'),
(238, 5, 0, 2, 1, 'HB1900160*', 2022, 'Improvement of Road CC Paver Road @ UC No.11 Taluka City', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:35:15'),
(239, 5, 0, 2, 1, 'HB1900161*', 2022, 'Improvement of Road CC Paver Road @ UC No.12 Taluka City', '2022-06-30', 0.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:36:08'),
(240, 6, 0, 4, 1, 'HB15P00068', 2021, 'Construction of 2-roomed building of Shelterless GBPS Alan Burdi  (2015-16 Programme)  Rural Hyderabad', '2021-06-30', 4.21, 4.21, 4.21, 0.18, 0.10, 0.00, 1, '2021-08-05 12:34:32'),
(241, 3, 0, 2, 1, 'HB1900162*', 2022, 'Improvement of CC Paver road from Ghoushala Chowk to Siddique House via Rishi Ghat UC No.41 Taluka City', '2022-06-30', 18.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:37:08'),
(242, 6, 0, 4, 1, 'HB15P00069', 2021, 'Re-construction of 2-roomed building of Shelterless GBPS Sono Khan Lashari (2015-16 Programme) Rural Hyderabad', '2021-06-30', 4.20, 4.20, 4.20, 0.10, 0.10, 0.00, 1, '2021-08-05 12:35:27'),
(243, 6, 0, 4, 1, 'HB15P00073', 2021, 'Re-construction of 2-roomed building of Shelterless GBPS Mohammad Ali Mehrani (2015-16 Programme) Rural Hyderabad', '2021-06-30', 4.20, 1.80, 4.10, 0.00, 0.05, 0.00, 1, '2021-08-05 12:36:31'),
(244, 5, 0, 2, 1, 'HB1900163*', 2022, 'Improvement of CC Paver road Habib Hotel to Rakhsha Market via Railway Station UC No.21 Taluka City', '2022-06-30', 10.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:37:04'),
(245, 6, 0, 3, 1, 'HB12P00103', 2021, 'Additional of Class Rooms in Existing High Schools in District Hyderabad (13 Class Rooms) under Block Allocation 2011-2012 Programme.', '2021-06-30', 18.11, 16.41, 16.41, 1.43, 0.20, 0.00, 1, '2021-08-05 12:38:47'),
(246, 5, 0, 2, 1, 'HB1900164*', 2022, 'Improvement of road CC Paver @ UC No.05 Taluka City', '2022-06-30', 3.40, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:38:27'),
(247, 6, 0, 2, 1, 'HB12P00123', 2021, 'Construction / Re-construction of Govt. Boys High School Haji Manik Bhatti Taluka City Hyd: District Hyderabad (01 Unit)  under Block Allocation 2011-2012 Programme.', '2021-06-30', 17.68, 14.16, 19.18, 3.00, 0.25, 0.00, 1, '2021-08-05 12:39:19'),
(248, 5, 0, 2, 1, 'HB1900165*', 2022, 'Improvement of road CC Paver road @ UC No.18 Taluka City', '2022-06-30', 4.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:39:23'),
(249, 6, 0, 3, 1, 'HB12P00124', 2021, 'Construction / Re-construction of Govt. Boys High School Zeal Pak Taluka Latifabad District Hyderabad  (01 Unit)  under Block Allocation 2011-2012 Programme.', '2021-06-30', 35.40, 34.04, 34.04, 2.00, 0.38, 0.00, 1, '2021-08-05 12:40:09'),
(250, 5, 0, 2, 1, 'HB1900166*', 2022, 'Improvement of CC Paver Street Haji Gul Badsha Silawat Para UC No.36 Taluka City', '2022-06-30', 0.90, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:40:25'),
(251, 5, 0, 2, 1, 'HB1900167*', 2022, 'Improvement of CC Paver road Chhatan Shah Bukhari Dargha UC No.48 Taluka City', '2022-06-30', 1.20, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:41:02'),
(252, 6, 0, 3, 1, 'HB12P00125', 2021, 'Construction / Re-construction of Govt. Boys High School Noor-e-Islam Taluka Latifabad District Hyderabad  (01 Unit)  under Block Allocation 2011-2012 Programme.', '2021-06-30', 18.11, 10.84, 10.84, 3.50, 0.00, 0.00, 1, '2021-08-05 12:41:03'),
(253, 6, 0, 3, 1, 'HB12P00126', 2021, 'Construction / Re-construction of High School @ Govt. Girls Pilot High School G.O.R. Colony Taluka Latifabad District Hyderabad  (01 Unit) under Block Allocation 2011-2012 Programme.', '2021-06-30', 22.00, 20.30, 20.30, 1.00, 0.39, 0.00, 1, '2021-08-05 12:41:56');
INSERT INTO `schemes` (`id`, `sector_id`, `sub_sector_id`, `taluka_id`, `category_id`, `adp_number`, `approval_year`, `project_description`, `completion_date`, `estim_cost`, `actual_expenditure`, `estim_expenditure`, `capital`, `electric`, `rev`, `status`, `ts`) VALUES
(254, 5, 0, 3, 1, 'HB1900168*', 2022, 'Improvement of various of road from Village Ali Muhammad Panhwar to Village Muhammad Khan Panhwar Hosri Town Taluka Latifabad 0/0-0/4.7 (0.94 KM).', '2022-06-30', 4.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 12:41:45'),
(255, 6, 0, 2, 1, 'HB12P00130', 2021, 'Repair / Renovation of GBHS Jamia Arabia City Hyd: District Hyderabad (01 Unit)  under Block Allocation 2011-2012 Programme.', '2021-06-30', 11.28, 10.49, 13.51, 1.35, 0.25, 0.00, 1, '2021-08-05 12:43:27'),
(256, 6, 0, 3, 1, 'HB12P00132', 2021, 'Repair / Renovation of GBHS Unit No.07 Latifabad  District Hyderabad (01 Unit)  Under Block Allocation 2011-2012 Programme.', '2021-06-30', 16.00, 13.92, 13.92, 2.00, 0.00, 0.00, 1, '2021-08-05 12:45:17'),
(257, 6, 0, 3, 1, 'HB12P00133', 2021, 'Construction of I.T Centre at Govt. Girls Comprehensive High School Unit No.05 Latifabad District Hyderabad   Under Block Allocation 2011-2012 Programme.', '2021-06-30', 14.66, 11.91, 11.91, 1.00, 0.50, 0.00, 1, '2021-08-05 12:46:11'),
(258, 7, 0, 2, 1, 'HB13P00200', 2021, 'Renovation of Deputy Commissioner House  Hyderabad.', '2021-06-30', 34.15, 27.95, 34.15, 6.21, 0.00, 0.00, 1, '2021-08-05 12:46:52'),
(259, 6, 0, 3, 1, 'HB12P00134', 2021, 'Repair / Renovation of Existing Secondary / Higher Secondary Schools in District Hyderabad  06 Units 2012-2013 Programme.', '2021-06-30', 20.00, 17.76, 17.76, 2.42, 0.00, 0.00, 1, '2021-08-05 12:47:24'),
(260, 7, 0, 2, 1, 'HB13P00201', 2021, 'Construction of Watch Tower, Guard Room, Vehicle Shade & Renovation of other structures at Deputy Commissioner House Hyderabad.', '2021-06-30', 40.00, 15.96, 18.75, 22.00, 0.00, 0.00, 1, '2021-08-05 12:48:05'),
(261, 6, 0, 3, 1, 'HB12P00135', 2021, 'Up-gradation of Middle Schools to High Schools in District Hyderabad (01 Units) 2012-2013 Programme @ GGMS Karan Khan Shoro.', '2021-06-30', 25.44, 22.78, 22.78, 0.11, 0.20, 0.00, 1, '2021-08-05 12:48:20'),
(262, 7, 0, 1, 1, 'HB12P00144', 2021, 'Renovation of Volley Ball Ground  Hussainabad Hyderabad.', '2021-06-30', 12.87, 9.31, 12.87, 0.10, 0.00, 0.00, 1, '2021-08-05 12:49:04'),
(263, 6, 0, 1, 1, 'HB12P00136', 2021, 'Construction of I.T Centre in GGHS Mehran  2012-2013 Programme.', '2021-06-30', 26.93, 29.72, 30.97, 1.00, 0.00, 0.00, 1, '2021-08-05 12:49:37'),
(264, 7, 0, 4, 1, 'HB17P00018', 2021, 'HB17P00018-\"Construction of  Camp Office ofAssistant Commissioner Office Taluka Rural at Tapedari Dera, Tando Jam.', '2021-06-30', 34.00, 19.59, 34.00, 12.50, 0.00, 0.00, 1, '2021-08-05 12:50:02'),
(265, 6, 0, 2, 1, 'HB12P00137', 2021, 'Construction of I.T Centre in Shah Bukhari  2012-2013 Programme.', '2021-06-30', 30.68, 27.91, 27.91, 1.00, 0.36, 0.00, 1, '2021-08-05 12:51:12'),
(266, 7, 0, 2, 1, 'HB17P00019', 2021, 'HB17P00019-Construction of Rooms (Annexes) at Collectors residence District Hyderabad', '2021-06-30', 39.93, 6.70, 29.70, 23.00, 0.00, 0.00, 1, '2021-08-05 12:51:39'),
(267, 6, 0, 3, 1, 'HB12P00160', 2021, 'Provision of Science Equipment and Furniture in Existing Secondary / Higher Secondary Schools in District Hyderabad 2012-13 Programe.', '2021-06-30', 20.00, 0.00, 11.05, 0.00, 0.00, 1.50, 1, '2021-08-05 12:52:00'),
(268, 7, 0, 4, 1, 'HB17P00020', 2021, 'HB17P00020-Construction of CC Streets at VariousVillages / Places at Taluka Qasimabad', '2021-06-30', 35.00, 5.29, 7.70, 25.00, 0.00, 0.00, 1, '2021-08-05 12:52:41'),
(269, 6, 0, 2, 1, 'HB13P00185', 2021, 'Repair / Renovation of Existing Secondary / Higher Secondary School in Taluka City Hyderabad & Latifabad District Hyderabad under Block Allocation (2013-14-Programme) (05-Units)', '2021-06-30', 16.06, 10.08, 10.08, 3.50, 0.10, 0.00, 1, '2021-08-05 12:52:41'),
(270, 7, 0, 2, 1, 'HB17P00021', 2021, 'HB17P00021-Construction of CC Streets at VariousPlaces at  Taluka City.', '2021-06-30', 2.50, 0.53, 2.50, 1.97, 0.00, 0.00, 1, '2021-08-05 12:53:38'),
(271, 6, 0, 1, 1, 'HB13P00186', 2021, 'Repair / Renovation of Existing Secondary / Higher Secondary School in Taluka Qasimabad & Taluka Rural / District Hyderabad under Block Allocation (2013-14-Programme) (04-Units)', '2021-06-30', 15.04, 12.67, 12.67, 1.20, 0.10, 0.00, 1, '2021-08-05 12:53:31'),
(272, 7, 0, 3, 1, 'HB17P00022', 2021, 'HB17P00022-Construction of CC Streets at VariousPlaces at Taluka Latifabad.', '2021-06-30', 3.00, 0.60, 3.00, 2.40, 0.00, 0.00, 1, '2021-08-05 12:54:38'),
(273, 6, 0, 1, 1, 'HB15P00075', 2021, 'Rehabilitation  of GGLSS New Wahdat Colony (2015-16 Programme) Qasimabad', '2021-06-30', 5.29, 1.15, 5.04, 0.00, 0.17, 0.00, 1, '2021-08-05 12:55:12'),
(274, 7, 0, 4, 1, 'HB17P00023', 2021, 'HB17P00023-Construction of CC Streets at variousVillages / Places at Taluka Rural.', '2021-06-30', 10.20, 7.55, 10.20, 2.65, 0.00, 0.00, 1, '2021-08-05 12:55:32'),
(275, 6, 0, 1, 1, 'HB15P00076', 2021, 'Rehabilitation  of GBHS Wahdat Colony (2015-16 Programme) Qasimabad', '2021-06-30', 4.73, 2.37, 2.37, 2.24, 0.00, 0.00, 1, '2021-08-05 12:55:55'),
(276, 6, 0, 2, 1, 'HB15P00077', 2021, 'Rehabilitation  of GBHS Mir Nabi Bux Town (2015-16 Programme)  City Hyderabad', '2021-06-30', 9.00, 0.08, 0.08, 3.50, 0.00, 0.00, 1, '2021-08-05 12:56:34'),
(277, 7, 0, 2, 1, 'HB17P00024', 2021, 'HB17P00024-Construction of Office of the ProvincialDisaster Management (PDMA) Distirct Hyderabad.', '2021-06-30', 34.00, 17.00, 34.00, 12.00, 0.00, 0.00, 1, '2021-08-05 12:57:06'),
(278, 6, 0, 2, 1, 'HB15P00079', 2021, 'Rehabilitation  of GGLSS English Teaching @ Barrage Colony (2015-16 Programme) City Hyderabad', '2021-06-30', 3.00, 1.26, 1.26, 0.83, 0.00, 0.00, 1, '2021-08-05 12:57:38'),
(279, 7, 0, 2, 1, 'HB17P00025', 2021, 'HB17P00025-\"Construction of Collector\'s Office,District Hyderabad.\"', '2021-06-30', 40.00, 30.00, 40.00, 9.00, 0.00, 0.00, 1, '2021-08-05 12:58:22'),
(280, 6, 0, 1, 1, 'HB12P00142', 2021, 'Construcion of I.T College Old Wahdat Colony Taluka Qasimabad 2012-13 Program', '2021-06-30', 34.08, 36.91, 36.96, 0.14, 1.80, 0.00, 1, '2021-08-05 12:58:49'),
(281, 7, 0, 2, 1, 'HB17P00026', 2021, 'HB17P00026-\"Construction of Office of the StationHouse Officer, (SHO) Anti Encroachment Force, District Hyderabad.', '2021-06-30', 39.00, 23.67, 39.00, 12.50, 0.00, 0.00, 1, '2021-08-05 12:59:29'),
(282, 6, 0, 2, 1, 'HB13P00188', 2021, 'Construction of Gymnasium Hall @ Govt. Khursheed Begum Girls Degree College, Taluka City / District Hyderabad (Remaining Work) under Block Allocation (2013-14-Programme)', '2021-06-30', 18.68, 18.66, 18.66, 0.00, 1.17, 0.00, 1, '2021-08-05 12:59:29'),
(283, 6, 0, 2, 1, 'HB15P00083', 2021, 'Renovation / Addition of Existing Govt. Commerce College Hyderabad (Main Building, Computer Lab, Library & Revenue (2015-16 Programme) City Hyderabad', '2021-06-30', 6.00, 1.44, 1.44, 4.44, 0.50, 0.00, 1, '2021-08-05 13:00:06'),
(284, 7, 0, 2, 1, 'HB1900169*', 2021, 'Construction of Deputy Commissioner Office (Phase-II) District Hyderabad', '2021-06-30', 39.95, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:00:24'),
(285, 6, 0, 4, 1, 'HB17P00016', 2021, 'HB17P00016-Rehabilitation of existing PrimarySchools in Taluka Rural Hyderabad 2017-18 Programme-(5Units)', '2021-06-30', 6.62, 7.17, 7.17, 0.70, 0.25, 0.00, 1, '2021-08-05 13:01:04'),
(286, 7, 0, 2, 1, 'HB1900170*', 2021, 'Repair / Renovation of Compound Wall & Existing Enterance Gate Car Parking (Rest House) at DC House Hyderabad', '2021-06-30', 39.96, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:01:06'),
(287, 6, 0, 4, 1, 'HB17P00017', 2021, 'HB17P00017-Construction /Re-construction of SchoolBuilding in existing primary School (2CR) Taluka Rural Hyderabad-2017-18Progra', '2021-06-30', 8.00, 5.97, 9.20, 2.22, 0.15, 0.00, 1, '2021-08-05 13:02:01'),
(288, 7, 0, 4, 1, 'HB1900171*', 2021, 'Construction of Office of the Assistant Commissioner, Taluka Rural (First Floor with Mosque) District Hyderabad', '2021-06-30', 21.06, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:02:14'),
(289, 7, 0, 3, 1, 'HB1900172*', 2021, 'Taluka Latifabad Improvement of various C.C. Paving Block Street @ village Nabi Bux Panhwar Village Yousif Panhwar Hyderi Primary School Imam Bargha via Govt: Primary School Village Bero Panhwar i/c Waqar Panhwar General Store Street to Main Road via Bilal Masjid Latifabad', '2021-06-30', 4.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:03:09'),
(290, 7, 0, 3, 1, 'HB1900173*', 2021, 'Improvement of various C.C. Paving Block Street in Village Allah Bux Brohi Taluka Latifabad Hyderabad', '2021-06-30', 4.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:03:54'),
(291, 7, 0, 3, 1, 'HB1900174*', 2021, 'Improvement of various C.C. Paving Block Road from Main road Unit No.12 to Hayyat-un-Nabbi Masjid via Sidhrah Masjid i/c link Unit No.12 Taluka Latifabad', '2021-06-30', 4.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:04:36'),
(292, 7, 0, 3, 1, 'HB1900175*', 2021, 'Improvement of various C.C. Paving Block Main Road Gulshan-e-Hali i/c Link Taluka Latifabad', '2021-06-30', 4.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:05:14'),
(293, 7, 0, 2, 1, 'HB1900176*', 2021, 'Improvement of various C.C. Paving Block Street @ Jani Shah Bukhari Masjid Area and Jatoi House Nala Street (Umrani Mohallah) to Jani Shah Mohallah / UC-20 PS-64 Taluka City Hyderabad', '2021-06-30', 4.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:14:35'),
(294, 7, 0, 2, 1, 'HB1900177*', 2021, 'Renovation of Dawood Khan Ground Taluka Latifabad', '2021-06-30', 2.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:14:51'),
(295, 7, 0, 3, 1, 'HB1900178*', 2021, 'Improvement of various C.C. Paving Block Street @ Zeal Pak Colony Taluka Latifabad', '2021-06-30', 5.00, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:15:30'),
(296, 7, 0, 3, 1, 'HB1900179*', 2021, 'Improvement of various C.C. Paving Block @ Goth Shadi Mohallah Cattle Colony Taluka Latifabad', '2021-06-30', 2.50, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:16:06'),
(297, 7, 0, 3, 1, 'HB1900180*', 2021, 'Improvement of various C.C. Paving Block in various Street at Taluka Latifabad Hyderabad', '2021-06-16', 2.15, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 13:16:46'),
(298, 7, 0, 2, 1, 'HB12P00155', 2021, 'Const: of Casualty / Emergency Block  20 Bedded Hospital Taluka City Hyd.', '2021-06-30', 59.67, 25.60, 38.13, 19.00, 0.00, 0.00, 1, '2021-08-05 13:18:40'),
(299, 7, 0, 3, 1, 'HB12P00156', 2021, 'Construction of Child Care Centre at unit # 06 Latifabad Hyderabad.', '2021-06-30', 40.00, 31.36, 40.00, 1.00, 0.00, 0.00, 1, '2021-08-05 13:19:55'),
(300, 7, 0, 3, 1, 'HB13P00192', 0, 'Construction of Building of Existing Dispensary at Village Haji, Muhammad Moosa Shoro, UC-Husri, Hyderabad.', '2021-06-30', 12.19, 10.06, 11.19, 3.00, 0.00, 0.00, 1, '2021-08-05 13:22:46'),
(301, 7, 0, 4, 1, 'HB13P00194', 2021, 'Construction of  Dispensary at Village Gelo Noonari, UC-Hatri, Hyderabad.', '2021-06-30', 12.19, 10.06, 10.99, 0.50, 0.00, 0.00, 1, '2021-08-05 13:22:28'),
(302, 7, 0, 4, 1, 'HB13P00196', 2021, 'Construction of Govt: Dispensary at Village Tando Saeed Khan  Kot Abbasi UC Masoo Bhurgari Taluka Rural  Hyderabad', '2021-06-30', 12.23, 10.14, 11.53, 0.50, 0.00, 0.00, 1, '2021-08-05 13:24:41'),
(303, 7, 0, 4, 1, 'HB15P00088', 2021, 'Construction of Govt. Dispensary at Village Sahib Khan Mirani Union Council Narejani Taluka (Rural) Hyderabad', '2021-06-30', 11.00, 10.08, 10.07, 0.50, 0.00, 0.00, 1, '2021-08-05 13:25:36'),
(304, 7, 0, 4, 1, 'HB15P00089', 2021, 'Construction of Govt. Dispensary at Village Dargah Rukanpir Union Council Haji Sawan Khan Gopang, Taluka (Rural) Hyderabad.', '2021-06-30', 11.00, 9.78, 11.00, 0.58, 0.00, 0.00, 1, '2021-08-05 13:26:31'),
(305, 7, 0, 4, 1, 'HB15P00090', 2021, 'Construction of Govt. Dispensary at Village Mori Manger UC Dhamachani, Taluka (Rural) Hyderabad.', '2021-06-30', 11.00, 8.20, 11.00, 2.40, 0.00, 0.00, 1, '2021-08-05 13:27:18'),
(306, 7, 0, 4, 1, 'HB15P00091', 2021, 'Construction of Govt. Dispensary at Village Shah Bukhari near JJVL Taluka Qasimabad  Hyderabad.', '0000-00-00', 11.00, 9.96, 10.40, 0.45, 0.00, 0.00, 1, '2021-08-05 13:28:27'),
(307, 7, 0, 1, 1, 'HB15P00092', 2021, 'Construction of Govt. Dispensary at Hurr Camp Colony , Taluka Qasimabad  Hyderabad. Shifted at village Begam Ghangro, Ghangra Mori.', '2021-06-30', 11.00, 7.75, 11.00, 2.85, 0.00, 0.00, 1, '2021-08-05 13:29:24'),
(308, 7, 0, 3, 1, 'HB15P00093', 2021, 'Construction of Mother & Child Care Centre at Revenue Employees Housing Society Qasimabad, Hyderabad.', '2021-06-30', 15.00, 12.78, 15.00, 1.00, 0.00, 0.00, 1, '2021-08-05 13:31:28'),
(309, 7, 0, 4, 1, 'HB15P00094', 2021, 'Providing Missing facilities for Establishment of Shaheed Mohtarma Banazir Bhutto 30 Bedded Hospital at Tando Agha, Hyderabad(under defunct PWP-II Programme)', '2021-06-30', 15.35, 13.95, 15.35, 0.60, 0.00, 0.00, 1, '2021-08-05 13:33:19'),
(310, 7, 0, 1, 1, 'HB15P00095', 2021, 'Construction of Dispensary at Tando Yousuf Taluka Latifabad, Hyderabad.', '2021-06-30', 12.17, 8.63, 12.17, 2.28, 0.00, 0.00, 1, '2021-08-05 13:34:02'),
(311, 7, 0, 2, 1, 'HB17P00027', 2021, 'HB17P00027-Construction of Abdullah Shah MedicalComplex at Hilal-e-Ahmar Hospital District Hyderabad.', '2021-06-30', 60.00, 24.07, 40.00, 22.00, 0.00, 0.00, 1, '2021-08-05 13:35:04'),
(312, 7, 0, 4, 1, 'HB17P00028', 2021, 'HB17P00028-Construction of  of Government ofDispensary at Village Haji Nindho Tebho Deh Mori UC Tando Hyder.', '2021-06-30', 5.00, 2.59, 5.00, 1.92, 0.00, 0.00, 1, '2021-08-05 13:36:04'),
(313, 7, 0, 4, 1, 'HB17P00029', 2021, 'HB17P00029-Construction of  of Government ofDispensary at Village tando Saeed Khan UC Barchani.', '2021-06-30', 5.00, 3.52, 5.00, 0.98, 0.00, 0.00, 1, '2021-08-05 13:56:42'),
(314, 7, 0, 4, 1, 'HB17P00031', 2021, 'HB17P00031-Construction of  of Government ofDispensary at Village Ibrahim Shehno UC Hatri.', '2021-06-30', 5.00, 2.18, 5.00, 2.00, 0.00, 0.00, 1, '2021-08-05 13:57:22'),
(315, 7, 0, 4, 1, 'HB17P00032', 2021, 'HB17P00032-Construction of  of Government ofDispensary at Village Ghulam Pitafi UC Chukhi.', '2021-06-30', 5.00, 2.31, 5.00, 1.80, 0.00, 0.00, 1, '2021-08-05 13:58:08'),
(316, 7, 0, 4, 1, 'HB17P00033', 2021, 'HB17P00033-Construction of  of Government ofDispensary at Village Dil Jan Khoso UC Sawan Khan Gopang.', '2021-06-30', 5.00, 3.50, 5.00, 1.00, 0.00, 0.00, 1, '2021-08-05 13:58:49'),
(317, 7, 0, 4, 0, 'HB17P00034', 0, 'HB17P00034-Construction of  of Government ofDispensary at Village Bahadur Chandio UC Moosa Khatyan.', '2021-06-30', 5.00, 3.96, 5.00, 0.20, 0.00, 0.00, 1, '2021-08-05 14:00:01'),
(318, 8, 0, 1, 1, 'HB1900186*', 2022, 'Supply of Gas to Villages of Taluka Qasimabad  (Mevo Khan Hajano, Abdul Jabbar Keero, Hayat Khan Vighio, Jiyando Khan Vighio, Khabbar Khan Kerio, Mehro Khan Vighio & Jalal Vighio)', '2022-06-30', 37.36, 0.00, 0.00, 0.05, 0.00, 0.00, 1, '2021-08-05 14:00:15'),
(319, 7, 0, 4, 1, 'HB17P00035', 2021, 'HB17P00035-Construction of  of Government ofDispensary at Village Hayat Bhatti UC Masu Burgri.', '2021-06-30', 5.00, 3.46, 5.00, 1.04, 0.00, 0.00, 1, '2021-08-05 14:03:49'),
(320, 7, 0, 4, 1, 'HB17P00036', 2021, 'HB17P00036-Construction of  of Government ofDispensary at Village Jaro Babar UC Tando Hyder Taluka Rural DistirctHyderabad.', '2021-06-30', 5.00, 1.63, 5.00, 2.88, 0.00, 0.00, 1, '2021-08-05 14:04:17'),
(321, 7, 0, 4, 1, 'HB17P00037', 2021, 'HB17P00037-Construction of  of Government ofDispensary at Village Umer Halepoto UC Halepota Taluka Rural DistirctHyderabad.', '2021-06-30', 5.00, 2.35, 5.00, 2.15, 0.00, 0.00, 1, '2021-08-05 14:05:39'),
(322, 7, 0, 4, 1, 'HB17P00038', 2021, 'Construction of  Building for Incinerator at Hyderabad Rural District Hyderabad.', '2021-06-30', 19.91, 10.78, 19.91, 3.01, 0.00, 0.00, 1, '2021-08-05 14:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`id`, `parent_id`, `title`, `status`, `ts`) VALUES
(1, 0, 'C.C BLOCK / DRAIN', 1, '2021-07-28 17:04:45'),
(2, 0, 'GOVT: OFFICE BUILDING', 1, '2021-07-28 17:05:09'),
(3, 0, 'Sector-1', 1, '2021-07-29 18:38:18'),
(4, 0, 'PPH', 1, '2021-08-04 13:49:37'),
(5, 0, 'Road', 1, '2021-08-04 14:38:11'),
(6, 0, 'EW', 1, '2021-08-05 11:47:21'),
(7, 0, 'Buildings', 1, '2021-08-05 12:45:45'),
(8, 0, 'Sui Gas', 1, '2021-08-05 13:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `taluka`
--

CREATE TABLE `taluka` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taluka`
--

INSERT INTO `taluka` (`id`, `title`, `status`, `ts`) VALUES
(1, 'Qasimabad', 1, '2021-08-04 14:09:25'),
(2, 'City', 1, '2021-08-04 14:16:27'),
(3, 'Latifabad', 1, '2021-08-04 14:25:56'),
(4, 'Rural', 1, '2021-08-04 14:28:49');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `filelocation` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `filename`, `filelocation`) VALUES
(1, 'my file', 'my-file.xlsx');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_type`
--
ALTER TABLE `admin_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_type`
--
ALTER TABLE `config_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_variable`
--
ALTER TABLE `config_variable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_2_admin_type`
--
ALTER TABLE `menu_2_admin_type`
  ADD PRIMARY KEY (`menu_id`,`admin_type_id`);

--
-- Indexes for table `schemes`
--
ALTER TABLE `schemes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taluka`
--
ALTER TABLE `taluka`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `admin_type`
--
ALTER TABLE `admin_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `config_type`
--
ALTER TABLE `config_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `config_variable`
--
ALTER TABLE `config_variable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `schemes`
--
ALTER TABLE `schemes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `taluka`
--
ALTER TABLE `taluka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
