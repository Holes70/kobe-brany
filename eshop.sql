-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Po 20.Dec 2021, 21:41
-- Verzia serveru: 10.4.21-MariaDB
-- Verzia PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `eshop`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `accessories`
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
-- Sťahujem dáta pre tabuľku `accessories`
--

INSERT INTO `accessories` (`id`, `image`, `name`, `price`, `available`, `description`, `count`) VALUES
(1, 'test.png', 'Nazov maleho produktu', 100, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `city` varchar(25) NOT NULL,
  `street` varchar(25) NOT NULL,
  `house_number` int(11) NOT NULL,
  `zipcode` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `addresses`
--

INSERT INTO `addresses` (`id`, `city`, `street`, `house_number`, `zipcode`) VALUES
(1, 'Piestany', 'Svata', 505, 95234),
(2, 'Piestany', 'Trajan', 5342, 95234),
(3, 'Kosice', 'Hlavna', 77, 95211),
(4, 'Svrbice', 'Svrbice', 34, 95606);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'xxx', 'xxx');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `permission` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `admins`
--

INSERT INTO `admins` (`id`, `id_user`, `permission`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `id_customer_uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `carts_products`
--

CREATE TABLE `carts_products` (
  `id` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `carts_products`
--

INSERT INTO `carts_products` (`id`, `id_cart`, `id_product`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `customers`
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
-- Sťahujem dáta pre tabuľku `customers`
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
-- Štruktúra tabuľky pre tabuľku `customers_uids`
--

CREATE TABLE `customers_uids` (
  `id` int(11) NOT NULL,
  `uid` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `dia_alerts`
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
-- Štruktúra tabuľky pre tabuľku `dia_alerts_users`
--

CREATE TABLE `dia_alerts_users` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_alert` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `dia_navbar`
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
-- Sťahujem dáta pre tabuľku `dia_navbar`
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
-- Štruktúra tabuľky pre tabuľku `dia_tables`
--

CREATE TABLE `dia_tables` (
  `id` int(11) NOT NULL,
  `table_name` varchar(55) NOT NULL,
  `structure` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `dia_tables`
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
-- Štruktúra tabuľky pre tabuľku `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`) VALUES
(1, 'Jozef', 'Mrkva'),
(3, 'ONdrej', 'Stihac');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `orders`
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
-- Sťahujem dáta pre tabuľku `orders`
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
-- Štruktúra tabuľky pre tabuľku `order_type`
--

CREATE TABLE `order_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `order_type`
--

INSERT INTO `order_type` (`id`, `name`) VALUES
(1, 'Nové'),
(2, 'Schválené'),
(3, 'Zaplatené'),
(4, 'Hotové'),
(5, 'Odovzdané');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `products`
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
-- Sťahujem dáta pre tabuľku `products`
--

INSERT INTO `products` (`id`, `image`, `name`, `price`, `available`, `count`, `description`, `type`, `id_product_info`) VALUES
(1, 'product_1.png', 'Product_1', 728.00, 1, 5, 'Popis', 2, 2),
(2, 'product_2.png', 'Product_2', 151.00, 1, 8, 'Popis', 1, 4),
(3, 'product_3.png', 'Product_3', 835.00, 1, 9, 'Popis', 1, 4),
(4, 'product_1.png', 'Product_4', 945.00, 1, 4, 'Popis', 1, 1),
(5, 'product_1.png', 'Product_5', 422.00, 1, 11, 'Popis', 1, 3),
(6, 'product_3.png', 'Product_6', 87.00, 1, 15, 'Popis', 1, 2),
(7, 'product_1.png', 'Product_7', 362.00, 1, 15, 'Popis', 2, 5),
(8, 'product_1.png', 'Product_8', 828.00, 0, 11, 'Popis', 2, 5),
(9, 'product_2.png', 'Product_9', 965.00, 0, 4, 'Popis', 1, 3),
(10, 'product_2.png', 'Product_10', 770.00, 1, 1, 'Popis', 1, 5),
(11, 'product_3.png', 'Product_11', 768.00, 0, 12, 'Popis', 2, 2),
(12, 'product_1.png', 'Product_12', 618.00, 1, 0, 'Popis', 1, 5),
(13, 'product_1.png', 'Product_13', 166.00, 1, 5, 'Popis', 1, 3),
(14, 'product_2.png', 'Product_14', 27.00, 1, 0, 'Popis', 1, 4),
(15, 'product_1.png', 'Product_15', 318.00, 0, 12, 'Popis', 1, 5),
(16, 'product_3.png', 'Product_16', 6.00, 0, 6, 'Popis', 1, 2),
(17, 'product_2.png', 'Product_17', 894.00, 0, 12, 'Popis', 2, 2),
(18, 'product_3.png', 'Product_18', 630.00, 0, 8, 'Popis', 1, 3),
(19, 'product_1.png', 'Product_19', 174.00, 1, 3, 'Popis', 1, 1),
(20, 'product_1.png', 'Product_20', 263.00, 0, 9, 'Popis', 2, 2),
(21, 'product_2.png', 'Product_21', 200.00, 1, 14, 'Popis', 1, 5),
(22, 'product_3.png', 'Product_22', 779.00, 0, 6, 'Popis', 2, 2),
(23, 'product_2.png', 'Product_23', 455.00, 0, 8, 'Popis', 2, 1),
(24, 'product_3.png', 'Product_24', 997.00, 1, 3, 'Popis', 2, 3),
(25, 'product_1.png', 'Product_25', 563.00, 1, 1, 'Popis', 2, 4),
(26, 'product_1.png', 'Product_26', 69.00, 0, 4, 'Popis', 2, 2),
(27, 'product_1.png', 'Product_27', 575.00, 0, 10, 'Popis', 1, 5),
(28, 'product_3.png', 'Product_28', 427.00, 0, 2, 'Popis', 2, 5),
(29, 'product_3.png', 'Product_29', 248.00, 0, 6, 'Popis', 1, 2),
(30, 'product_3.png', 'Product_30', 651.00, 1, 6, 'Popis', 1, 5),
(31, 'product_3.png', 'Product_31', 747.00, 1, 1, 'Popis', 2, 2),
(32, 'product_3.png', 'Product_32', 218.00, 0, 14, 'Popis', 1, 3),
(33, 'product_1.png', 'Product_33', 724.00, 0, 10, 'Popis', 2, 1),
(34, 'product_3.png', 'Product_34', 65.00, 1, 10, 'Popis', 2, 4),
(35, 'product_3.png', 'Product_35', 765.00, 0, 2, 'Popis', 1, 1),
(36, 'product_3.png', 'Product_36', 248.00, 0, 6, 'Popis', 2, 3),
(37, 'product_2.png', 'Product_37', 534.00, 0, 6, 'Popis', 1, 3),
(38, 'product_1.png', 'Product_38', 865.00, 1, 7, 'Popis', 1, 1),
(39, 'product_1.png', 'Product_39', 895.00, 0, 9, 'Popis', 1, 1),
(40, 'product_1.png', 'Product_40', 857.00, 1, 4, 'Popis', 1, 5),
(41, 'product_3.png', 'Product_41', 671.00, 1, 3, 'Popis', 2, 1),
(42, 'product_3.png', 'Product_42', 802.00, 1, 13, 'Popis', 2, 2),
(43, 'product_2.png', 'Product_43', 511.00, 0, 0, 'Popis', 2, 4),
(44, 'product_1.png', 'Product_44', 78.00, 1, 1, 'Popis', 2, 5),
(45, 'product_1.png', 'Product_45', 82.00, 1, 2, 'Popis', 1, 3),
(46, 'product_3.png', 'Product_46', 579.00, 0, 12, 'Popis', 2, 1),
(47, 'product_2.png', 'Product_47', 105.00, 0, 13, 'Popis', 1, 5),
(48, 'product_1.png', 'Product_48', 416.00, 0, 5, 'Popis', 1, 2),
(49, 'product_1.png', 'Product_49', 2.00, 1, 9, 'Popis', 2, 2),
(50, 'product_1.png', 'Product_50', 191.00, 1, 4, 'Popis', 1, 2),
(51, 'product_3.png', 'Product_51', 265.00, 0, 11, 'Popis', 1, 2),
(52, 'product_3.png', 'Product_52', 62.00, 1, 6, 'Popis', 2, 3),
(53, 'product_3.png', 'Product_53', 908.00, 0, 7, 'Popis', 1, 2),
(54, 'product_3.png', 'Product_54', 601.00, 1, 15, 'Popis', 1, 5),
(55, 'product_3.png', 'Product_55', 209.00, 0, 2, 'Popis', 2, 5),
(56, 'product_2.png', 'Product_56', 893.00, 0, 14, 'Popis', 2, 4),
(57, 'product_2.png', 'Product_57', 470.00, 1, 4, 'Popis', 2, 5),
(58, 'product_2.png', 'Product_58', 339.00, 1, 11, 'Popis', 2, 1),
(59, 'product_2.png', 'Product_59', 733.00, 1, 5, 'Popis', 1, 4),
(60, 'product_2.png', 'Product_60', 714.00, 1, 15, 'Popis', 2, 5),
(61, 'product_1.png', 'Product_61', 889.00, 1, 0, 'Popis', 2, 3),
(62, 'product_2.png', 'Product_62', 431.00, 1, 1, 'Popis', 2, 2),
(63, 'product_3.png', 'Product_63', 318.00, 1, 4, 'Popis', 2, 5),
(64, 'product_2.png', 'Product_64', 986.00, 1, 11, 'Popis', 2, 4),
(65, 'product_2.png', 'Product_65', 770.00, 0, 13, 'Popis', 1, 4),
(66, 'product_3.png', 'Product_66', 291.00, 0, 10, 'Popis', 2, 1),
(67, 'product_3.png', 'Product_67', 751.00, 0, 2, 'Popis', 1, 2),
(68, 'product_2.png', 'Product_68', 730.00, 0, 3, 'Popis', 1, 5),
(69, 'product_2.png', 'Product_69', 158.00, 1, 1, 'Popis', 1, 3),
(70, 'product_1.png', 'Product_70', 399.00, 0, 7, 'Popis', 1, 1),
(71, 'product_1.png', 'Product_71', 276.00, 0, 12, 'Popis', 2, 4),
(72, 'product_3.png', 'Product_72', 338.00, 0, 9, 'Popis', 2, 1),
(73, 'product_2.png', 'Product_73', 518.00, 0, 12, 'Popis', 2, 2),
(74, 'product_1.png', 'Product_74', 562.00, 1, 14, 'Popis', 2, 3),
(75, 'product_1.png', 'Product_75', 775.00, 0, 4, 'Popis', 1, 3),
(76, 'product_1.png', 'Product_76', 379.00, 1, 0, 'Popis', 1, 3),
(77, 'product_1.png', 'Product_77', 716.00, 0, 5, 'Popis', 2, 4),
(78, 'product_2.png', 'Product_78', 388.00, 0, 7, 'Popis', 2, 2),
(79, 'product_3.png', 'Product_79', 584.00, 1, 7, 'Popis', 1, 2),
(80, 'product_2.png', 'Product_80', 413.00, 0, 7, 'Popis', 1, 5),
(81, 'product_1.png', 'Product_81', 550.00, 1, 6, 'Popis', 2, 2),
(82, 'product_2.png', 'Product_82', 257.00, 0, 0, 'Popis', 2, 1),
(83, 'product_2.png', 'Product_83', 258.00, 1, 0, 'Popis', 2, 1),
(84, 'product_2.png', 'Product_84', 892.00, 1, 3, 'Popis', 1, 2),
(85, 'product_2.png', 'Product_85', 348.00, 1, 10, 'Popis', 2, 3),
(86, 'product_3.png', 'Product_86', 116.00, 0, 2, 'Popis', 1, 2),
(87, 'product_3.png', 'Product_87', 534.00, 1, 15, 'Popis', 2, 2),
(88, 'product_3.png', 'Product_88', 586.00, 1, 7, 'Popis', 1, 2),
(89, 'product_1.png', 'Product_89', 196.00, 0, 9, 'Popis', 2, 5),
(90, 'product_3.png', 'Product_90', 849.00, 0, 11, 'Popis', 2, 1),
(91, 'product_3.png', 'Product_91', 185.00, 0, 8, 'Popis', 1, 5),
(92, 'product_3.png', 'Product_92', 1000.00, 0, 15, 'Popis', 2, 5),
(93, 'product_2.png', 'Product_93', 298.00, 1, 13, 'Popis', 2, 4),
(94, 'product_3.png', 'Product_94', 531.00, 1, 4, 'Popis', 1, 1),
(95, 'product_1.png', 'Product_95', 172.00, 1, 6, 'Popis', 1, 5),
(96, 'product_2.png', 'Product_96', 278.00, 1, 3, 'Popis', 2, 4),
(97, 'product_1.png', 'Product_97', 997.00, 0, 5, 'Popis', 2, 4),
(98, 'product_3.png', 'Product_98', 129.00, 1, 8, 'Popis', 2, 2),
(99, 'product_1.png', 'Product_99', 89.00, 1, 15, 'Popis', 1, 3),
(100, 'product_2.png', 'Product_100', 65.00, 0, 10, 'Popis', 2, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `products_accessories`
--

CREATE TABLE `products_accessories` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_product_accessory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `products_accessories`
--

INSERT INTO `products_accessories` (`id`, `id_product`, `id_product_accessory`) VALUES
(1, 10, 19),
(2, 17, 15),
(3, 3, 73),
(4, 9, 79),
(5, 29, 92),
(6, 21, 42),
(7, 26, 50),
(8, 23, 71),
(9, 10, 4),
(10, 3, 19),
(11, 13, 12),
(12, 6, 54),
(13, 26, 14),
(14, 22, 25),
(15, 20, 90),
(16, 22, 68),
(17, 12, 79),
(18, 22, 24),
(19, 23, 40),
(20, 3, 45),
(21, 16, 81),
(22, 1, 78),
(23, 11, 99),
(24, 17, 10),
(25, 3, 92),
(26, 18, 40),
(27, 5, 61),
(28, 17, 98),
(29, 13, 12),
(30, 10, 66),
(31, 24, 72),
(32, 25, 3),
(33, 4, 15),
(34, 19, 97),
(35, 15, 94),
(36, 15, 97),
(37, 15, 46),
(38, 11, 61),
(39, 11, 73),
(40, 10, 91),
(41, 4, 61),
(42, 23, 46),
(43, 8, 18),
(44, 20, 69),
(45, 22, 60),
(46, 16, 64),
(47, 12, 17),
(48, 22, 76),
(49, 5, 62),
(50, 19, 75),
(51, 16, 39),
(52, 16, 36),
(53, 9, 11),
(54, 11, 41),
(55, 3, 61),
(56, 10, 57),
(57, 10, 67),
(58, 9, 12),
(59, 20, 20),
(60, 17, 35),
(61, 14, 47),
(62, 2, 17),
(63, 9, 25),
(64, 29, 48),
(65, 16, 58),
(66, 23, 93),
(67, 21, 66),
(68, 24, 9),
(69, 30, 39),
(70, 13, 99),
(71, 1, 53),
(72, 4, 60),
(73, 11, 87),
(74, 6, 68),
(75, 23, 85),
(76, 13, 35),
(77, 23, 48),
(78, 24, 10),
(79, 29, 35),
(80, 27, 7),
(81, 18, 28),
(82, 1, 4),
(83, 19, 70),
(84, 13, 45),
(85, 19, 51),
(86, 7, 96),
(87, 12, 5),
(88, 25, 62),
(89, 13, 8),
(90, 24, 21),
(91, 1, 60),
(92, 17, 87),
(93, 30, 12),
(94, 3, 63),
(95, 24, 48),
(96, 25, 12),
(97, 5, 45),
(98, 17, 99),
(99, 27, 29),
(100, 1, 11);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `products_discounts`
--

CREATE TABLE `products_discounts` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `discount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `product_gallery`
--

CREATE TABLE `product_gallery` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_gallery` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `stock`
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
-- Sťahujem dáta pre tabuľku `stock`
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
-- Štruktúra tabuľky pre tabuľku `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `tests`
--

INSERT INTO `tests` (`id`, `name`) VALUES
(1, 'TEST PRVY'),
(2, 'Bombarder');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `test_dropzone`
--

CREATE TABLE `test_dropzone` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `test_dropzone`
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
-- Štruktúra tabuľky pre tabuľku `users`
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
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `id_address`, `avatar`, `first_name`, `last_name`, `email`, `phone_number`, `password`) VALUES
(1, 1, 'avatar.png', 'Patrik', 'Holes', 'vajda@email.sk', '94231231', 'Heslo'),
(2, 3, 'avatar.png', 'Robert', 'Haas', 'xxsssxx@email.sk', '94233113', 'Heslo');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users_socials`
--

CREATE TABLE `users_socials` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `icon` varchar(55) DEFAULT NULL,
  `description` varchar(55) DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `users_socials`
--

INSERT INTO `users_socials` (`id`, `title`, `icon`, `description`, `id_user`) VALUES
(1, 'Facebook', 'facebook', 'www.facebook.com', 4),
(2, 'Youtube', 'youtube', 'www.youtube.com', 4),
(3, 'LinkedIn', 'linkedin', 'www.linkedin.com', 4);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `user_tests`
--

CREATE TABLE `user_tests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `user_tests`
--

INSERT INTO `user_tests` (`id`, `user_id`, `test_id`, `filename`, `size`) VALUES
(72, 1, 1, '241904789_594821854879214_4852358777093468944_n.gif', NULL),
(73, 1, 1, 'tatrabanka.jpg', NULL),
(74, 1, 1, 'dpd.png', NULL),
(75, 1, 1, 'ups.png', 67725),
(76, 2, 1, 'packeta.jpg', 8424),
(77, 1, 1, '5acd1a998bad9920b5c7c738_Global Aviation Logo.png', 13631);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexy pre tabuľku `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `carts_products`
--
ALTER TABLE `carts_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `customers_uids`
--
ALTER TABLE `customers_uids`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `dia_alerts`
--
ALTER TABLE `dia_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `dia_alerts_users`
--
ALTER TABLE `dia_alerts_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_alert` (`id_alert`) USING BTREE;

--
-- Indexy pre tabuľku `dia_navbar`
--
ALTER TABLE `dia_navbar`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `dia_tables`
--
ALTER TABLE `dia_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `order_type`
--
ALTER TABLE `order_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `products_accessories`
--
ALTER TABLE `products_accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `products_discounts`
--
ALTER TABLE `products_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexy pre tabuľku `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `test_dropzone`
--
ALTER TABLE `test_dropzone`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_address` (`id_address`);

--
-- Indexy pre tabuľku `users_socials`
--
ALTER TABLE `users_socials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_index` (`id_user`);

--
-- Indexy pre tabuľku `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `carts_products`
--
ALTER TABLE `carts_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pre tabuľku `customers_uids`
--
ALTER TABLE `customers_uids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `dia_alerts`
--
ALTER TABLE `dia_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pre tabuľku `dia_alerts_users`
--
ALTER TABLE `dia_alerts_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `dia_navbar`
--
ALTER TABLE `dia_navbar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT pre tabuľku `dia_tables`
--
ALTER TABLE `dia_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pre tabuľku `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pre tabuľku `order_type`
--
ALTER TABLE `order_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pre tabuľku `products_accessories`
--
ALTER TABLE `products_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pre tabuľku `products_discounts`
--
ALTER TABLE `products_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `product_gallery`
--
ALTER TABLE `product_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `test_dropzone`
--
ALTER TABLE `test_dropzone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pre tabuľku `users_socials`
--
ALTER TABLE `users_socials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
