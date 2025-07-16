-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2023 at 07:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new-food-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `onpay`
--

CREATE TABLE `onpay` (
  `id` int(100) NOT NULL,
  `cus_name` text NOT NULL,
  `amount` int(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `pay_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transaction_id` varchar(100) NOT NULL,
  `card_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `onpay`
--

INSERT INTO `onpay` (`id`, `cus_name`, `amount`, `status`, `pay_time`, `transaction_id`, `card_type`) VALUES
(3, 'Uday Palli', 380, 'Successful', '2023-11-22 03:41:19', 'ONL-PAY-R969U0935P', 'debit card'),
(5, 'bharat Yangandul', 120, 'Successful', '2023-11-22 03:41:19', 'ONL-PAY-VLIBNZG666', 'upi'),
(6, 'Ankit sarwadkar', 300, 'Successful', '2023-11-22 03:41:19', 'ONL-PAY-MTL9PG98XZ', 'upi'),
(7, 'virat kohli', 450, 'Successful', '2023-11-22 03:41:19', 'ONL-PAY-GC37DRKBNJ', 'debit card'),
(8, 'rohit sharma', 200, 'Successful', '2023-11-22 03:41:19', 'ONL-PAY-20XSKIEKLF', 'debit card');


-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` int(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `message_status` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `name`, `phone`, `subject`, `message`, `message_status`, `date`) VALUES
(18, 'Uday Palli', 1717731002, 'Hi There', 'When my order will come?', 'read', '2023-11-20 11:23:36'),
(19, 'Bharat Yangandul', 1867348264, 'Test Subject', 'Test Message', 'unread', '2023-11-20 12:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `online_orders_new`
--

CREATE TABLE `online_orders_new` (
  `order_id` int(100) NOT NULL,
  `Item_Name` varchar(100) NOT NULL,
  `Price` int(100) NOT NULL,
  `Quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_orders_new`
--

INSERT INTO `online_orders_new` (`order_id`, `Item_Name`, `Price`, `Quantity`) VALUES
(96, 'Dosa', 120, 2),
(96, 'Idli Vada', 100, 1),
(96, 'Gulab Jamun', 80, 3),
(97, 'Maharastrain thali', 200, 2),
(97, 'Rajsthani thali', 220, 1),
(98, 'Pav Bhaji', 100, 5),
(99, 'vada pav', 50, 2),
(99, 'Jalebi', 60, 1),
(99, 'Lassi', 60, 2),
(100, 'Panjabi Thali', 250, 1),
(100, 'Cold Drinks', 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_manager`
--

CREATE TABLE `order_manager` (
  `order_id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `cus_name` text NOT NULL,
  `cus_email` varchar(100) NOT NULL,
  `cus_add1` varchar(100) NOT NULL,
  `cus_city` text NOT NULL,
  `cus_phone` bigint(100) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `order_date` datetime NOT NULL,
  `total_amount` int(11) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `order_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_manager`
--

INSERT INTO `order_manager` (`order_id`, `username`, `cus_name`, `cus_email`, `cus_add1`, `cus_city`, `cus_phone`, `payment_status`, `order_date`, `total_amount`, `transaction_id`, `order_status`) VALUES

(96, 'udaypalli', 'Uday Palli', 'udaypalli@gmail.com', 'i group vidi gharkul', 'Solapur', 1717731002, 'successful', '2023-11-22 03:41:19', 380, 'ONL-PAY-6NW73HW7WR', 'Pending'),
(97, 'bharatyan', 'Bharat yangandul', 'bharatyan@gmail.com', 'vinayak nagar', 'Solapur', 1717731678, 'successful', '2023-11-22 03:41:19', 120, 'ONL-PAY-SK7IM5U84G', 'Delivered'),
(98, 'ankitsar', 'Ankit Sarawadkar', 'ankit001@gmail.com', 'Railway lines', 'solapur', 1717731034, 'successful', '2023-11-22 03:41:19', 300, 'ONL-PAY-8E5L7NIWAE', 'Processing'),
(99, 'virat', 'Virat Kohli', 'vk@gmail.com', 'Sat rasta', 'Solapur', 1745731002, 'successful', '2023-11-22 03:41:19', 450, 'ONL-PAY-VPE49B581W', 'Processing'),
(100, 'rohit', 'Rohit Sharma', 'rohit@gmail.com', 'navi peth', 'Solapur', 1756122112, 'pending', '2023-11-22 03:41:19', 250, 'ONL-PAY-02H137JNWT', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(39, 'Doc', 'doc211', 'b59c67bf196a4758191e42f76670ceba');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(41, 'Breakfast', 'Food_Category_81005.jpg', 'Yes', 'Yes'),
(42, 'Thali', 'Food_Category_13196.jpg', 'Yes', 'Yes'),
(43, 'Desserts', 'Food_Category_76472.jpg', 'Yes', 'Yes'),
(44, 'Fastfoods', 'Food_Category_39435.jpg', 'Yes', 'Yes'),
(48, 'Beverages', 'Food_Category_94135.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_eipay`
--

CREATE TABLE `tbl_eipay` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_id` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `tran_id` varchar(50) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_status` varchar(50) NOT NULL,
  `order_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_eipay`
--

INSERT INTO `tbl_eipay` (`id`, `table_id`, `amount`, `tran_id`, `order_date`, `payment_status`, `order_status`) VALUES
(415, 'Table 3', 763.00, 'EI-PAY-GKKQXXZ42C', '2023-11-22 03:41:19', 'Successful', 'Delivered'),
(416, 'Table 2', 460.00, 'EI-PAY-5SA6TNEO29', '2023-11-22 03:41:10', 'Successful', 'Delivered'),
(418, 'Table 4', 450.00, 'EI-PAY-65IYLWUW2S', '2023-11-22 03:41:19', 'Successful', 'Pending'),
(420, 'Table 4', 678.00, 'EI-PAY-245XLV2144', '2023-11-22 03:41:19', 'Successful', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL,
  `stock` int(100) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`, `stock`) VALUES
(34, 'Dosa', 'Dosa', 120.00, 'Food-Name-7394.jpg', 41, 'No', 'Yes', 70),
(35, 'Idli Vada', 'Idli Vada', 100.00, 'Food-Name-251.jpg', 41, 'No', 'Yes', 59),
(36, 'Poha', 'Poha', 100.00, 'Food-Name-1511.jpg', 41, 'No', 'Yes', 83),
(37, 'Chole Bhature', 'Chole Bhature', 150.00, 'Food-Name-8238.jpg', 41, 'Yes', 'Yes', 90),
(38, 'Maharashtrian Thali', 'Maharashtrian Thali', 200.00, 'Food-Name-3657.jpg', 42, 'Yes', 'Yes', 69),
(39, 'Rajasthani Thali ', 'Rajasthani Thali ', 220.00, 'Food-Name-4854.jpg', 42, 'No', 'Yes', 49),
(40, 'Gujarati Thali', 'Gujarati Thali', 230.00, 'Food-Name-926.jpg', 42, 'No', 'Yes', 80),
(41, 'Punjabi Thali', 'Punjabi Thali', 250.00, 'Food-Name-6428.jpg', 42, 'No', 'Yes', 86),
(42, 'Gulab Jamun', 'Gulab Jamun', 80.00, 'Food-Name-1499.jpg', 43, 'No', 'Yes', 145),
(43, 'Jalebi', 'Jalebi', 60.00, 'Food-Name-5049.jpg', 43, 'No', 'Yes', 159),
(44, 'Rasgulla', 'Rasgulla', 110.00, 'Food-Name-3512.jpg', 43, 'Yes', 'Yes', 60),
(45, 'Rasmalai', 'Rasmalai', 120.00, 'Food-Name-5500.jpg', 43, 'No', 'Yes', 139),
(46, 'Vada Pav', 'Vada Pav', 50.00, 'Food-Name-9143.jpg', 44, 'No', 'Yes', 500),
(47, 'Samosa', 'Samosa', 50.00, 'Food-Name-1669.jpg', 44, 'No', 'Yes', 300),
(48, 'Pav Bhaji', 'Pav Bhaji', 100.00, 'Food-Name-937.jpg', 44, 'Yes', 'Yes', 596),
(49, 'Pakora', 'Pakora', 70.00, 'Food-Name-5356.jpg', 44, 'Yes', 'Yes', 78),
(50, 'Lassi', 'Lassi', 60.00, 'Food-Name-5725.jpg', 48, 'No', 'Yes', 595),
(51, 'Masala Chaas', 'Masala Chaas', 30.00, 'Food-Name-5497.jpg', 48, 'Yes', 'Yes', 39),
(52, 'Falooda', 'Falooda', 120.00, 'Food-Name-2893.jpg', 48, 'Yes', 'Yes', 594),
(53, 'Cold Drinks', 'Cold Drinks', 20.00, 'Food-Name-8745.jpg', 48, 'Yes', 'Yes', 597);

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `add1` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` bigint(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_users` 2233,1111
--

INSERT INTO `tbl_users` (`id`, `name`, `email`, `add1`, `city`, `phone`, `username`, `password`) VALUES
(1, 'Uday Palli', 'udaypalli@gmail.com', 'Vidi Gharkul Solapur', 'Solapur', 1717731002, 'uday', 'e0f7a4d0ef9b84b83b693bbf3feb8e6e'),
(5, 'Bharat Yangandul', 'bharat@gmail.com', 'Vinayak nagar', 'solapur', 1717122112, 'bharat', 'b59c67bf196a4758191e42f76670ceba');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `onpay`
--
ALTER TABLE `onpay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_manager`
--
ALTER TABLE `order_manager`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_eipay`
--
ALTER TABLE `tbl_eipay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);


--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `onpay`
--
ALTER TABLE `onpay`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_manager`
--
ALTER TABLE `order_manager`
  MODIFY `order_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tbl_eipay`
--
ALTER TABLE `tbl_eipay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
