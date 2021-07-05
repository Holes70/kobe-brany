-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2021 at 11:41 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

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
(1, 'ADMIN', 'admin');

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
(99, 1, '', 'k', '77'),
(100, 99, 'dasdas', 'das', 'dsa'),
(103, 99, 'XXX', 'dsa', 'das');

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
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `id_product`, `count`) VALUES
(1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(25) DEFAULT NULL,
  `type_1` int(2) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `type_1`, `description`) VALUES
(3, 'Alza GameBox Ryzen GTX165', 889, 'gamebox.png', 1, 'Herný PC AMD Ryzen 5 2600 3.9 GHz, NVIDIA GeForce GTX 1650 Super 4 GB, RAM 16GB DDR4, SSD 1000GB, bez mechaniky, WiFi, DVI, HDMI a DisplayPort, 5×USB 3.2, 2×USB 2.0, typ skrine: Midi Tower, Windows 10 Home'),
(5, 'Lenovo Gaming L340-17IRH ', 500, 'lenovo.png', 2, 'Herný notebook – Intel Core i5 9300HF Coffee Lake, 17.3\" IPS antireflexný 1920 × 1080, RAM 8GB DDR4, NVIDIA GeForce GTX 1650 4GB, SSD 512GB, numerická klávesnica, podsvietená klávesnica, webkamera, USB 3.2 Gen 1, USB-C, WiFi 5, 45 Wh batéria, Windows 10 Home 81LL00F6CK'),
(7, 'AMD RYZEN 5 3600', 190, 'amd.jpg', 3, 'Procesor 6-jadrový, 12 vláken, 3.6GHz (TDP 65W), Boost 4.2 GHz, 32MB L3 cache, socket AMD AM4, Matisse, box chladič, Wraith Stealth\r\n'),
(8, 'Intel Core i9-9900K', 349, 'intel.jpg', 3, 'Procesor 8-jadrový, 16 vláken, 3.6GHz (TDP 95W), Turboboost 5GHz, 16MB L3 cache, Intel UHD Graphics 630 1200MHz, socket Intel 1151, Coffee Lake refresh, bez chladiča, iba chipset Intel radu 3xx'),
(9, 'HyperX 16GB KIT DDR4 3200', 85, 'ram.jpg', 3, 'Operačná pamäť 2x8GB, PC4-25600, CL16-18-18, napětí 1.35 V, pasivní chladič a XMP 2.0'),
(10, 'Asus Zenbook 15 UX533FTC-', 1599, 'nt.jpg', 2, 'Ultrabook – Intel Core i7 10510U Comet Lake, 15.6\" IPS antireflexný 1920 × 1080, RAM 16GB LPDDR3L-SDRAM, NVIDIA GeForce GTX 1650 Max-Q 4GB, SSD 1000GB, numerická klávesnica, podsvietená klávesnica, webkamera, USB-C, WiFi 5, 71 Wh batéria, Windows 10 Pro UX533FTC-A8185R'),
(11, 'Asus ROG Strix SCAR17 G73', 2579, 'ImgW.jpg', 2, 'Herný notebook – Intel Core i7 10875H Comet Lake, 17.3\" IPS antireflexný 1920 × 1080 300Hz, RAM 32GB DDR4, NVIDIA GeForce RTX 2070 Super 8GB, SSD 1000GB, podsvietená klávesnica, USB 3.2 Gen 1, USB-C, WiFi 5, Windows 10 Home G732LWS-HG019T'),
(12, 'ASUS Zenbook 14 UX425JA', 899, 'ImgW (1).jpg', 2, 'Ultrabook – Intel Core i5 1035G1 Ice Lake, 14\" IPS antireflexný 1920 × 1080, RAM 8GB LPDDR4X, Intel UHD Graphics, SSD 512GB, podsvietená klávesnica, webkamera, USB 3.2 Gen 1, USB-C, WiFi 6, 3526 mAh batéria, Windows 10 Home'),
(13, 'GFFFF', 1146, 'ImgW (2).jpg', 2, 'Herný notebook – Intel Core i7 9750H Coffee Lake, 15.6\" IPS matný 1920 × 1080 120Hz, RAM 16GB DDR4, NVIDIA GeForce GTX 1660 Ti 6GB, SSD 1000GB, numerická klávesnica, podsvietená klávesnica, webkamera, USB-C, WiFi 6, 55 Wh batéria, Windows 10 Home (AN515-54-7386)');

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
(3, 2, 'Laco', 'Kovacko', 'kovac@email.sk', '11111111', 'Heslo'),
(4, 2, 'Admin', 'Admin', 'admin@gmail.com', '94131313', 'admin'),
(5, 1, 'Test', 'FOrm', 'test@gmail.com', '423432432', '42343243');

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
-- Indexes for table `dia_navbar`
--
ALTER TABLE `dia_navbar`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_address` (`id_address`);

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
-- AUTO_INCREMENT for table `dia_navbar`
--
ALTER TABLE `dia_navbar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
