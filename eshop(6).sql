-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2021 at 11:27 AM
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
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `id` int(11) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `price` float NOT NULL,
  `available` tinyint(4) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`id`, `image`, `name`, `price`, `available`, `description`, `count`) VALUES
(1, 'test.png', 'Nazov maleho produktu', 100, 1, NULL, 0);

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
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `id_customer_uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carts_products`
--

CREATE TABLE `carts_products` (
  `id` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts_products`
--

INSERT INTO `carts_products` (`id`, `id_cart`, `id_product`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `id_customer_uid` int(11) NOT NULL,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `phone_number` int(10) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `id_customer_uid`, `first_name`, `last_name`, `email`, `phone_number`, `state`, `password`) VALUES
(1, 1, 'Meno_1', 'Priezvisko_1', 'zakaznik_1@gmail.com', 999999, 1, '123456'),
(2, 1, 'Meno_1', 'Priezvisko1', 'zakaznik_1@gmail.com', 29808281, 2, '123455'),
(3, 2, 'Meno_2', 'Priezvisko2', 'zakaznik_2@gmail.com', 15421021, 3, '123455'),
(4, 3, 'Meno_3', 'Priezvisko3', 'zakaznik_3@gmail.com', 66578892, NULL, '123455'),
(5, 4, 'Meno_4', 'Priezvisko4', 'zakaznik_4@gmail.com', 22489431, NULL, '123455'),
(6, 5, 'Meno_5', 'Priezvisko5', 'zakaznik_5@gmail.com', 45898638, NULL, '123455'),
(7, 6, 'Meno_6', 'Priezvisko6', 'zakaznik_6@gmail.com', 79645786, NULL, '123455'),
(8, 7, 'Meno_7', 'Priezvisko7', 'zakaznik_7@gmail.com', 87897181, NULL, '123455'),
(9, 8, 'Meno_8', 'Priezvisko8', 'zakaznik_8@gmail.com', 74215832, NULL, '123455'),
(10, 9, 'Meno_9', 'Priezvisko9', 'zakaznik_9@gmail.com', 37420274, NULL, '123455'),
(11, 10, 'Meno_10', 'Priezvisko10', 'zakaznik_10@gmail.com', 32352423, NULL, '123455'),
(12, 11, 'Meno_11', 'Priezvisko11', 'zakaznik_11@gmail.com', 54144212, NULL, '123455'),
(13, 12, 'Meno_12', 'Priezvisko12', 'zakaznik_12@gmail.com', 70473811, NULL, '123455'),
(14, 13, 'Meno_13', 'Priezvisko13', 'zakaznik_13@gmail.com', 28587311, NULL, '123455'),
(15, 14, 'Meno_14', 'Priezvisko14', 'zakaznik_14@gmail.com', 27037619, NULL, '123455'),
(16, 15, 'Meno_15', 'Priezvisko15', 'zakaznik_15@gmail.com', 21051330, NULL, '123455'),
(17, 16, 'Meno_16', 'Priezvisko16', 'zakaznik_16@gmail.com', 13440766, NULL, '123455'),
(18, 17, 'Meno_17', 'Priezvisko17', 'zakaznik_17@gmail.com', 14568480, NULL, '123455'),
(19, 18, 'Meno_18', 'Priezvisko18', 'zakaznik_18@gmail.com', 92563851, NULL, '123455'),
(20, 19, 'Meno_19', 'Priezvisko19', 'zakaznik_19@gmail.com', 55412583, NULL, '123455'),
(21, 20, 'Meno_20', 'Priezvisko20', 'zakaznik_20@gmail.com', 22891224, NULL, '123455'),
(22, 21, 'Meno_21', 'Priezvisko21', 'zakaznik_21@gmail.com', 48364841, NULL, '123455'),
(23, 22, 'Meno_22', 'Priezvisko22', 'zakaznik_22@gmail.com', 61604174, NULL, '123455'),
(24, 23, 'Meno_23', 'Priezvisko23', 'zakaznik_23@gmail.com', 86633421, NULL, '123455'),
(25, 24, 'Meno_24', 'Priezvisko24', 'zakaznik_24@gmail.com', 87037844, NULL, '123455'),
(26, 25, 'Meno_25', 'Priezvisko25', 'zakaznik_25@gmail.com', 87469280, NULL, '123455'),
(27, 26, 'Meno_26', 'Priezvisko26', 'zakaznik_26@gmail.com', 83676997, NULL, '123455'),
(28, 27, 'Meno_27', 'Priezvisko27', 'zakaznik_27@gmail.com', 77528465, NULL, '123455'),
(29, 28, 'Meno_28', 'Priezvisko28', 'zakaznik_28@gmail.com', 62638470, NULL, '123455'),
(30, 29, 'Meno_29', 'Priezvisko29', 'zakaznik_29@gmail.com', 93558063, NULL, '123455'),
(31, 30, 'Meno_30', 'Priezvisko30', 'zakaznik_30@gmail.com', 46613758, NULL, '123455');

-- --------------------------------------------------------

--
-- Table structure for table `customers_uids`
--

CREATE TABLE `customers_uids` (
  `id` int(11) NOT NULL,
  `uid` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `description` varchar(35) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `order_index` int(2) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dia_navbar`
--

INSERT INTO `dia_navbar` (`id`, `id_parent`, `name`, `link`, `description`, `icon`, `order_index`, `is_enabled`) VALUES
(2, 0, 'Objednávky', 'objednavky', 'Objednávky', 'donate', 2, 1),
(3, 2, 'Všetky objednávky', 'objednavky-vsetky', 'Všetky objednávky', '', 3, 1),
(4, 2, 'Nové objednávky', 'objednavky-nove', 'Nové objednávky', '', 4, 1),
(5, 2, 'Schválené objednávky', 'objednavky-schvalene', 'Schválené objednávky', '', 5, 1),
(6, 0, 'Konfigurátor', 'konfigurator', 'Konfigurátor', 'ruler', 7, 1),
(7, 0, 'Reklamácie', 'reklamacie', 'Reklamácie', 'sync', 8, 1),
(8, 0, 'Faktúry', 'faktury', 'Faktúry', 'file-alt', 9, 1),
(9, 0, 'Výroba', 'vyroba', 'Výroba', 'tools', 10, 1),
(10, 9, 'Návrh a odhad', 'vyroba-navrh', 'Návrh výroby', '', 11, 1),
(11, 9, 'Rozpracované', 'vyroba-rozpracovane', 'Rozpracované', '', 12, 1),
(12, 9, 'Pozastavené', 'vyroba-pozastavene', 'Pozastavené', '', 13, 1),
(13, 9, 'Na odovzdanie', 'vyroba-na-odovzdanie', '', '', 14, 1),
(207, 0, 'Dia_Alerts', 'alerts', '', 'exclamation-triangle', 15, 1),
(208, 0, 'Dia_messages', 'messages', '', 'comment-dots', 16, 1),
(209, 0, 'Produkty', 'produkty', '', 'archive', 7, 1),
(210, 0, 'Príslušenstvo', 'prislusenstvo', '', 'pizza-slice', 8, 0),
(211, NULL, 'Zákazníci', 'zakaznici', NULL, 'users', NULL, 1),
(212, 0, 'Domov', 'home', NULL, 'home', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dia_tables`
--

CREATE TABLE `dia_tables` (
  `id` int(11) NOT NULL,
  `table_name` varchar(55) NOT NULL,
  `structure` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dia_tables`
--

INSERT INTO `dia_tables` (`id`, `table_name`, `structure`) VALUES
(1, 'users', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":true},\"id_address\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":true,\"type\":\"lookup\",\"lookup_table\":\"addresses\"},\"avatar\":{\"show_in_table\":true,\"show_in_form\":true,\"type\":\"image\"},\"first_name\":{\"type\":\"text\",\"required\":true,\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"First Name\"},\"last_name\":{\"type\":\"text\",\"required\":true,\"show_in_table\":true,\"show_in_form\":true},\"email\":{\"type\":\"email\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Email\"},\"phone_number\":{\"type\":\"number\",\"required\":true,\"show_in_form\":true,\"show_in_table\":true},\"password\":{\"type\":\"password\",\"required\":true,\"show_in_form\":true,\"show_in_table\":true}}'),
(2, 'products', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":false},\"image\":{\"type\":\"image\",\"show_in_table\":true,\"show_in_form\":true},\"name\":{\"show_in_table\":true,\"name_in_table\":\"Produkt\",\"show_in_form\":true,\"required\":true},\"price\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Cena\",\"show_in_form\":true,\"required\":true,\"unit\":\"€\"},\"available\":{\"type\":\"checkbox\",\"show_in_table\":true,\"name_in_table\":\"Dostupný\",\"show_in_form\":true},\"count\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Skladom\",\"show_in_form\":true},\"description\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Popis\",\"show_in_form\":true},\"type\":{\"type\":\"number\",\"show_in_table\":false,\"name_in_table\":\"Typ\",\"show_in_form\":true}}'),
(3, 'accessories', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":false},\"image\":{\"type\":\"image\",\"show_in_table\":true,\"show_in_form\":true},\"name\":{\"show_in_table\":true,\"name_in_table\":\"Produkt\",\"show_in_form\":true,\"required\":true},\"price\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Cena\",\"show_in_form\":true,\"required\":true,\"unit\":\"€\"},\"available\":{\"type\":\"checkbox\",\"show_in_table\":true,\"name_in_table\":\"Dostupný\",\"show_in_form\":true},\"description\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Popis\",\"show_in_form\":true},\"count\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Počet\",\"show_in_form\":true}}'),
(4, 'customers', '{\"first_name\":{\"disabled\":true,\"required\":true,\"show_in_table\":true,\"name_in_table\":\"Meno\",\"show_in_form\":true},\"last_name\":{\"required\":true,\"show_in_table\":true,\"name_in_table\":\"Priezvisko\",\"show_in_form\":true},\"email\":{\"required\":false,\"show_in_table\":true,\"name_in_table\":\"E-mail\",\"show_in_form\":true},\"phone_number\":{\"required\":true,\"show_in_table\":true,\"name_in_table\":\"Mobil\",\"show_in_form\":true},\"state\":{\"show_in_table\":true,\"show_in_form\":true}}'),
(5, 'orders', '{\"serial_number\":{\"show_in_table\":true,\"name_in_table\":\"Číslo\"},\"count\":{\"show_in_table\":true,\"name_in_table\":\"Počet\"},\"id_cart\":{\"type\":\"lookup\",\"lookup_table\":\"carts\",\"lookup_table_col\":\"id\",\"lookup_url\":\"kosik\",\"show_in_table\":true,\"name_in_table\":\"Košík\"}}'),
(6, 'products_accessories', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":false},\"image\":{\"type\":\"image\",\"show_in_table\":true,\"show_in_form\":true},\"name\":{\"show_in_table\":true,\"name_in_table\":\"Produkt\",\"show_in_form\":true,\"required\":true},\"price\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Cena\",\"show_in_form\":true,\"required\":true,\"unit\":\"€\"},\"available\":{\"type\":\"checkbox\",\"show_in_table\":true,\"name_in_table\":\"Dostupný\",\"show_in_form\":true},\"count\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Skladom\",\"show_in_form\":true},\"description\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Popis\",\"show_in_form\":true},\"type\":{\"type\":\"number\",\"show_in_table\":false,\"name_in_table\":\"Typ\",\"show_in_form\":true}}');

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
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id_cart` int(11) NOT NULL,
  `id_invoice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `serial_number`, `count`, `id_type`, `id_customer_uid`, `id_cart`, `id_invoice`) VALUES
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
  `image` varchar(55) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `price` double(14,2) DEFAULT NULL,
  `available` tinyint(1) DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `id_product_info` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `name`, `price`, `available`, `count`, `description`, `type`, `id_product_info`) VALUES
(2, 'default.jpg', 'Product_1', 714.00, 1, 13, 'Popis', 2, 1),
(3, 'default.jpg', 'Product_2', 352.00, 1, 13, 'Popis', 2, 5),
(4, 'default.jpg', 'Product_3', 964.00, 0, 10, 'Popis', 2, 1),
(5, 'default.jpg', 'Product_4', 737.00, 1, 13, 'Popis', 1, 5),
(6, 'default.jpg', 'Product_5', 379.00, 0, 6, 'Popis', 2, 4),
(7, 'default.jpg', 'Product_6', 178.00, 0, 5, 'Popis', 1, 5),
(8, 'default.jpg', 'Product_7', 730.00, 1, 1, 'Popis', 2, 2),
(9, 'default.jpg', 'Product_8', 328.00, 1, 7, 'Popis', 1, 3),
(10, 'default.jpg', 'Product_9', 367.00, 1, 10, 'Popis', 1, 2),
(11, 'default.jpg', 'Product_10', 947.00, 0, 5, 'Popis', 1, 1),
(12, 'default.jpg', 'Product_11', 58.00, 0, 13, 'Popis', 1, 4),
(13, 'default.jpg', 'Product_12', 508.00, 1, 11, 'Popis', 2, 3),
(14, 'default.jpg', 'Product_13', 775.00, 1, 2, 'Popis', 2, 2),
(15, 'default.jpg', 'Product_14', 961.00, 1, 5, 'Popis', 2, 1),
(16, 'default.jpg', 'Product_15', 283.00, 1, 2, 'Popis', 1, 3),
(17, 'default.jpg', 'Product_16', 408.00, 1, 3, 'Popis', 1, 2),
(18, 'default.jpg', 'Product_17', 287.00, 0, 4, 'Popis', 2, 5),
(19, 'default.jpg', 'Product_18', 904.00, 1, 14, 'Popis', 2, 4),
(20, 'default.jpg', 'Product_19', 524.00, 0, 15, 'Popis', 2, 2),
(21, 'default.jpg', 'Product_20', 41.00, 1, 13, 'Popis', 1, 4),
(22, 'default.jpg', 'Product_21', 344.00, 1, 14, 'Popis', 1, 4),
(23, 'default.jpg', 'Product_22', 657.00, 1, 12, 'Popis', 1, 3),
(24, 'default.jpg', 'Product_23', 595.00, 1, 6, 'Popis', 2, 1),
(25, 'default.jpg', 'Product_24', 966.00, 1, 9, 'Popis', 2, 4),
(26, 'default.jpg', 'Product_25', 529.00, 1, 0, 'Popis', 1, 3),
(27, 'default.jpg', 'Product_26', 621.00, 0, 10, 'Popis', 1, 5),
(28, 'default.jpg', 'Product_27', 706.00, 1, 10, 'Popis', 2, 4),
(29, 'default.jpg', 'Product_28', 992.00, 0, 5, 'Popis', 1, 5),
(30, 'default.jpg', 'Product_29', 830.00, 1, 12, 'Popis', 1, 4),
(31, 'default.jpg', 'Product_30', 757.00, 1, 15, 'Popis', 1, 2),
(32, 'default.jpg', 'Product_31', 677.00, 0, 1, 'Popis', 1, 4),
(33, 'default.jpg', 'Product_32', 901.00, 1, 7, 'Popis', 2, 4),
(34, 'default.jpg', 'Product_33', 478.00, 1, 14, 'Popis', 1, 4),
(35, 'default.jpg', 'Product_34', 47.00, 1, 5, 'Popis', 1, 4),
(36, 'default.jpg', 'Product_35', 622.00, 0, 7, 'Popis', 1, 1),
(37, 'default.jpg', 'Product_36', 30.00, 0, 0, 'Popis', 2, 5),
(38, 'default.jpg', 'Product_37', 135.00, 1, 2, 'Popis', 1, 1),
(39, 'default.jpg', 'Product_38', 147.00, 0, 5, 'Popis', 1, 2),
(40, 'default.jpg', 'Product_39', 243.00, 1, 5, 'Popis', 1, 1),
(41, 'default.jpg', 'Product_40', 869.00, 0, 8, 'Popis', 1, 4),
(42, 'default.jpg', 'Product_41', 236.00, 0, 7, 'Popis', 2, 5),
(43, 'default.jpg', 'Product_42', 227.00, 0, 2, 'Popis', 2, 5),
(44, 'default.jpg', 'Product_43', 831.00, 1, 12, 'Popis', 1, 1),
(45, 'default.jpg', 'Product_44', 749.00, 0, 15, 'Popis', 1, 4),
(46, 'default.jpg', 'Product_45', 579.00, 1, 2, 'Popis', 1, 3),
(47, 'default.jpg', 'Product_46', 644.00, 0, 1, 'Popis', 2, 2),
(48, 'default.jpg', 'Product_47', 880.00, 1, 10, 'Popis', 2, 4),
(49, 'default.jpg', 'Product_48', 176.00, 0, 5, 'Popis', 1, 4),
(50, 'default.jpg', 'Product_49', 579.00, 0, 14, 'Popis', 1, 5),
(51, 'default.jpg', 'Product_50', 666.00, 0, 2, 'Popis', 2, 3),
(52, 'default.jpg', 'Product_51', 463.00, 0, 13, 'Popis', 1, 2),
(53, 'default.jpg', 'Product_52', 739.00, 1, 0, 'Popis', 1, 2),
(54, 'default.jpg', 'Product_53', 839.00, 0, 11, 'Popis', 1, 1),
(55, 'default.jpg', 'Product_54', 144.00, 0, 0, 'Popis', 1, 5),
(56, 'default.jpg', 'Product_55', 507.00, 0, 1, 'Popis', 2, 1),
(57, 'default.jpg', 'Product_56', 568.00, 0, 14, 'Popis', 1, 1),
(58, 'default.jpg', 'Product_57', 106.00, 0, 13, 'Popis', 1, 3),
(59, 'default.jpg', 'Product_58', 314.00, 0, 15, 'Popis', 1, 5),
(60, 'default.jpg', 'Product_59', 96.00, 0, 15, 'Popis', 2, 5),
(61, 'default.jpg', 'Product_60', 989.00, 1, 3, 'Popis', 1, 1),
(62, 'default.jpg', 'Product_61', 379.00, 0, 12, 'Popis', 2, 3),
(63, 'default.jpg', 'Product_62', 359.00, 0, 5, 'Popis', 2, 4),
(64, 'default.jpg', 'Product_63', 988.00, 0, 10, 'Popis', 2, 5),
(65, 'default.jpg', 'Product_64', 552.00, 1, 6, 'Popis', 2, 3),
(66, 'default.jpg', 'Product_65', 822.00, 1, 15, 'Popis', 2, 5),
(67, 'default.jpg', 'Product_66', 834.00, 0, 1, 'Popis', 2, 2),
(68, 'default.jpg', 'Product_67', 157.00, 1, 7, 'Popis', 1, 4),
(69, 'default.jpg', 'Product_68', 119.00, 1, 9, 'Popis', 1, 1),
(70, 'default.jpg', 'Product_69', 112.00, 0, 1, 'Popis', 2, 2),
(71, 'default.jpg', 'Product_70', 9.00, 0, 4, 'Popis', 2, 2),
(72, 'default.jpg', 'Product_71', 871.00, 0, 0, 'Popis', 1, 2),
(73, 'default.jpg', 'Product_72', 525.00, 0, 4, 'Popis', 2, 2),
(74, 'default.jpg', 'Product_73', 35.00, 1, 2, 'Popis', 1, 4),
(75, 'default.jpg', 'Product_74', 191.00, 0, 2, 'Popis', 1, 1),
(76, 'default.jpg', 'Product_75', 522.00, 0, 15, 'Popis', 2, 4),
(77, 'default.jpg', 'Product_76', 511.00, 1, 0, 'Popis', 1, 2),
(78, 'default.jpg', 'Product_77', 656.00, 1, 7, 'Popis', 2, 3),
(79, 'default.jpg', 'Product_78', 515.00, 1, 13, 'Popis', 2, 4),
(80, 'default.jpg', 'Product_79', 344.00, 1, 7, 'Popis', 1, 5),
(81, 'default.jpg', 'Product_80', 603.00, 0, 13, 'Popis', 1, 2),
(82, 'default.jpg', 'Product_81', 895.00, 1, 6, 'Popis', 1, 5),
(83, 'default.jpg', 'Product_82', 87.00, 1, 3, 'Popis', 2, 5),
(84, 'default.jpg', 'Product_83', 682.00, 1, 1, 'Popis', 1, 1),
(85, 'default.jpg', 'Product_84', 773.00, 1, 9, 'Popis', 1, 4),
(86, 'default.jpg', 'Product_85', 291.00, 0, 1, 'Popis', 2, 5),
(87, 'default.jpg', 'Product_86', 29.00, 0, 10, 'Popis', 2, 1),
(88, 'default.jpg', 'Product_87', 694.00, 0, 9, 'Popis', 1, 1),
(89, 'default.jpg', 'Product_88', 511.00, 1, 15, 'Popis', 2, 1),
(90, 'default.jpg', 'Product_89', 441.00, 1, 12, 'Popis', 2, 4),
(91, 'default.jpg', 'Product_90', 844.00, 0, 12, 'Popis', 2, 5),
(92, 'default.jpg', 'Product_91', 10.00, 0, 0, 'Popis', 1, 2),
(93, 'default.jpg', 'Product_92', 449.00, 0, 15, 'Popis', 2, 5),
(94, 'default.jpg', 'Product_93', 447.00, 1, 8, 'Popis', 1, 5),
(95, 'default.jpg', 'Product_94', 508.00, 1, 14, 'Popis', 1, 4),
(96, 'default.jpg', 'Product_95', 689.00, 0, 7, 'Popis', 2, 4),
(97, 'default.jpg', 'Product_96', 490.00, 0, 10, 'Popis', 1, 4),
(98, 'default.jpg', 'Product_97', 559.00, 0, 1, 'Popis', 2, 4),
(99, 'default.jpg', 'Product_98', 842.00, 1, 1, 'Popis', 2, 2),
(100, 'default.jpg', 'Product_99', 720.00, 1, 0, 'Popis', 2, 1),
(101, 'default.jpg', 'Product_100', 175.00, 1, 6, 'Popis', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `products_accessories`
--

CREATE TABLE `products_accessories` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_product_accessory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_accessories`
--

INSERT INTO `products_accessories` (`id`, `id_product`, `id_product_accessory`) VALUES
(1, 5, 2),
(2, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `products_discounts`
--

CREATE TABLE `products_discounts` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `discount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_gallery`
--

CREATE TABLE `product_gallery` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_gallery` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'TEST PRVY'),
(2, 'Bombarder');

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
  `avatar` varchar(55) DEFAULT 'avatar.png',
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_address`, `avatar`, `first_name`, `last_name`, `email`, `phone_number`, `password`) VALUES
(1, 1, 'avatar.png', 'Patrik', 'Holes', 'vajda@email.sk', '94231231', 'Heslo'),
(2, 3, 'avatar.png', 'Robert', 'Haas', 'xxsssxx@email.sk', '94233113', 'Heslo');

-- --------------------------------------------------------

--
-- Table structure for table `users_socials`
--

CREATE TABLE `users_socials` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `icon` varchar(55) DEFAULT NULL,
  `description` varchar(55) DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_socials`
--

INSERT INTO `users_socials` (`id`, `title`, `icon`, `description`, `id_user`) VALUES
(1, 'Facebook', 'facebook', 'www.facebook.com', 4),
(2, 'Youtube', 'youtube', 'www.youtube.com', 4),
(3, 'LinkedIn', 'linkedin', 'www.linkedin.com', 4);

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
-- Indexes for table `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts_products`
--
ALTER TABLE `carts_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers_uids`
--
ALTER TABLE `customers_uids`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
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
-- Indexes for table `products_accessories`
--
ALTER TABLE `products_accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_discounts`
--
ALTER TABLE `products_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_gallery`
--
ALTER TABLE `product_gallery`
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
-- Indexes for table `users_socials`
--
ALTER TABLE `users_socials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_index` (`id_user`);

--
-- Indexes for table `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts_products`
--
ALTER TABLE `carts_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `customers_uids`
--
ALTER TABLE `customers_uids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `dia_tables`
--
ALTER TABLE `dia_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `products_accessories`
--
ALTER TABLE `products_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products_discounts`
--
ALTER TABLE `products_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_gallery`
--
ALTER TABLE `product_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_dropzone`
--
ALTER TABLE `test_dropzone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users_socials`
--
ALTER TABLE `users_socials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;