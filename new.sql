-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 01, 2021 at 03:24 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `city` varchar(25) NOT NULL,
  `street` varchar(25) NOT NULL,
  `house_number` int(11) NOT NULL,
  `zipcode` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `city`, `street`, `house_number`, `zipcode`) VALUES
(1, 'Piestany', 'Svata', 505, 95234),
(2, 'Piestany', 'Trajan', 5342, 95234),
(3, 'Kosice', 'Hlavna', 77, 95211),
(4, 'Svrbice', 'Svrbice', 34, 95606);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'xxx', 'xxx');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `permission` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `id_user`, `permission`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dia_alerts`
--

CREATE TABLE `dia_alerts` (
  `id` int(11) NOT NULL,
  `type` int(1) DEFAULT NULL,
  `title` varchar(55) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `footer` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dia_alerts_users`
--

CREATE TABLE `dia_alerts_users` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_alert` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dia_navbar`
--

CREATE TABLE `dia_navbar` (
  `id` int(11) NOT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `name` varchar(25) NOT NULL,
  `link` varchar(25) NOT NULL,
  `description` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dia_navbar`
--

INSERT INTO `dia_navbar` (`id`, `id_parent`, `name`, `link`, `description`) VALUES
(1, 0, 'Domov', 'home', 'Domovská stránka'),
(2, 0, 'Objednávky', 'objednavky', 'Objednávky'),
(3, 2, 'Všetky objednávky', 'objednavky-vsetky', 'Všetky objednávky'),
(4, 2, 'Nové objednávky', 'objednavky-nove', 'Nové objednávky'),
(5, 2, 'Schválené objednávky', 'objednavky-schvalene', 'Schválené objednávky'),
(6, 0, 'Konfigurátor', 'konfigurator', 'Konfigurátor'),
(7, 0, 'Reklamácie', 'reklamacie', 'Reklamácie'),
(8, 0, 'Faktúry', 'faktury', 'Faktúry'),
(9, 0, 'Výroba', 'vyroba', 'Výroba'),
(10, 9, 'Návrh a odhad', 'vyroba-navrh', 'Návrh výroby'),
(11, 9, 'Rozpracované', 'vyroba-rozpracovane', 'Rozpracované'),
(12, 9, 'Pozastavené', 'vyroba-pozastavene', 'Pozastavené'),
(13, 9, 'Na odovzdanie', 'vyroba-na-odovzdanie', NULL),
(207, NULL, 'Dia_Alerts', 'alerts', NULL),
(208, NULL, 'Dia_messages', 'messages', NULL),
(209, NULL, 'Produkty', 'produkty', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dia_tables`
--

CREATE TABLE `dia_tables` (
  `id` int(11) NOT NULL,
  `table_name` varchar(55) NOT NULL,
  `structure` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dia_tables`
--

INSERT INTO `dia_tables` (`id`, `table_name`, `structure`) VALUES
(1, 'users', '{\"id_address\": {\"required\": true, \"lookup\": {\"table\": \"addresses\", \"key\": \"id\"}}, \"first_name\": {\"required\": true}, \"last_name\": {\"required\": true}, \"email\": {\"required\": false}, \"phone_number\": {\"required\": false}, \"password\": {\"required\": false}}');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`) VALUES
(1, 'Jozef', 'Mrkva'),
(3, 'ONdrej', 'Stihac');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `serial_number` int(8) DEFAULT NULL,
  `count` int(1) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_customer_uid` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_invoice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `serial_number`, `count`, `id_type`, `id_customer_uid`, `id_product`, `id_invoice`) VALUES
(1, 1001, 4, 2, 4, 5, 1),
(2, 1002, 4, 5, 4, 1, 1),
(3, 1003, 2, 4, 2, 5, 1),
(4, 1004, 4, 4, 3, 1, 1),
(5, 1005, 4, 5, 1, 3, 1),
(6, 1006, 4, 5, 3, 5, 1),
(7, 1007, 2, 5, 5, 1, 1),
(8, 1008, 2, 2, 1, 2, 1),
(9, 1009, 4, 3, 3, 5, 1),
(10, 1010, 3, 3, 2, 3, 1),
(11, 1011, 2, 1, 4, 1, 1),
(12, 1012, 2, 4, 1, 4, 1),
(13, 1013, 3, 4, 2, 4, 1),
(14, 1014, 3, 4, 1, 5, 1),
(15, 1015, 1, 5, 2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_type`
--

CREATE TABLE `order_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_type`
--

INSERT INTO `order_type` (`id`, `name`) VALUES
(1, 'Nové'),
(2, 'Schválené'),
(3, 'Zaplatené'),
(4, 'Hotové'),
(5, 'Odovzdané');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `price` double(14,2) DEFAULT NULL,
  `id_product_info` int(11) DEFAULT NULL,
  `id_product_accessories` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `id_product_info`, `id_product_accessories`) VALUES
(1, 'Product_59', 'Popis', 0.00, 4, 5),
(2, 'Product_54', 'Popis', 0.00, 1, 1),
(3, 'Product_29', 'Popis', 14.00, 3, 5),
(4, 'Product_97', 'Popis', 0.00, 5, 1),
(5, 'Product_20', 'Popis', 0.00, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `available` int(1) NOT NULL,
  `sale` int(1) DEFAULT NULL,
  `sale_prize` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `id_product`, `count`, `available`, `sale`, `sale_prize`) VALUES
(1, 8, 2, 1, 0, 100),
(2, 7, 1, 1, 1, 100),
(3, 5, 3, 1, 1, 100),
(4, 3, 1, 1, 1, 100),
(5, 2, 4, 1, 1, 100),
(6, 1, 3, 1, 1, 100),
(7, 9, 16, 1, 1, 100),
(8, 10, 6, 1, 1, 100),
(9, 11, 5, 1, 1, 100),
(10, 12, 3, 1, 1, 100),
(11, 13, 3, 1, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `name`) VALUES
(1, 'TEST PRVY');

-- --------------------------------------------------------

--
-- Table structure for table `test_dropzone`
--

CREATE TABLE `test_dropzone` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_dropzone`
--

INSERT INTO `test_dropzone` (`id`, `filename`) VALUES
(1, 'ups.png'),
(2, 'slovenskaposta.png'),
(3, 'dpd.png'),
(4, 'dpd.png'),
(5, 'dpd.png'),
(6, 'dpd.png'),
(7, 'packeta.jpg'),
(8, 'dpd.png'),
(9, 'tatrabanka.jpg'),
(10, 'slovenskaposta.png'),
(11, 'slovenskaposta.png'),
(12, 'tatrabanka.jpg'),
(13, 'ups.png'),
(14, 'slovenskaposta.png'),
(15, 'tatrabanka.jpg'),
(16, 'dpd.png'),
(17, 'ups.png'),
(18, 'tatrabanka.jpg'),
(19, 'ups.png'),
(20, 'ups.png'),
(21, 'ups.png'),
(22, 'dpd.png'),
(23, 'slovenskaposta.png'),
(24, 'slovenskaposta.png'),
(25, 'dpd.png'),
(26, 'slovenskaposta.png'),
(27, 'tatrabanka.jpg'),
(28, 'ups.png'),
(29, 'slovenskaposta.png'),
(30, 'tatrabanka.jpg'),
(31, 'ups.png'),
(32, 'tatrabanka.jpg'),
(33, 'slovenskaposta.png'),
(34, 'slovenskaposta.png'),
(35, 'tatrabanka.jpg'),
(36, 'ups.png'),
(37, 'dpd.png'),
(38, 'slovenskaposta.png'),
(39, 'tatrabanka.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_address` int(11) DEFAULT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_address`, `first_name`, `last_name`, `email`, `phone_number`, `password`) VALUES
(1, 1, 'Patrik', 'VAjdaxxx', 'vajda@email.sk', '94231231', 'Heslo'),
(2, 3, 'Robert', 'Haas', 'xxsssxx@email.sk', '094233111', 'Heslo'),
(4, 2, 'Admin', 'Admin', 'admin@gmail.com', '94131313', 'admin'),
(5, 1, 'Test', 'FOrm', 'test@gmail.com', '423432432', '42343243'),
(6, 1, 'Patrik', 'Holes', 'dsa', '', ''),
(7, 1, 'Patrik', 'Holes', '', '', ''),
(8, 1, 'Patrik', 'Holes', '', '', ''),
(9, 1, 'dasdasdas', 'dasdsa', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_tests`
--

CREATE TABLE `user_tests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_tests`
--

INSERT INTO `user_tests` (`id`, `user_id`, `test_id`, `filename`, `size`) VALUES
(72, 1, 1, '241904789_594821854879214_4852358777093468944_n.gif', NULL),
(73, 1, 1, 'tatrabanka.jpg', NULL),
(74, 1, 1, 'dpd.png', NULL),
(75, 1, 1, 'ups.png', 67725),
(76, 2, 1, 'packeta.jpg', 8424);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `dia_alerts`
--
ALTER TABLE `dia_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dia_alerts_users`
--
ALTER TABLE `dia_alerts_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_alert` (`id_alert`) USING BTREE;

--
-- Indexes for table `dia_navbar`
--
ALTER TABLE `dia_navbar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dia_tables`
--
ALTER TABLE `dia_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_type`
--
ALTER TABLE `order_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_dropzone`
--
ALTER TABLE `test_dropzone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_address` (`id_address`);

--
-- Indexes for table `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dia_alerts`
--
ALTER TABLE `dia_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dia_alerts_users`
--
ALTER TABLE `dia_alerts_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dia_navbar`
--
ALTER TABLE `dia_navbar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `dia_tables`
--
ALTER TABLE `dia_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_type`
--
ALTER TABLE `order_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test_dropzone`
--
ALTER TABLE `test_dropzone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
