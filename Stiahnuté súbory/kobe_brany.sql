-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Po 28.Feb 2022, 18:53
-- Verzia serveru: 10.4.22-MariaDB
-- Verzia PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `kobe_brany`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `id_customer_uid` int(11) DEFAULT NULL,
  `is_order` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `carts`
--

INSERT INTO `carts` (`id`, `id_customer_uid`, `is_order`) VALUES
(1, NULL, 1);

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
(1, 1, 100);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `complaints_documents`
--

CREATE TABLE `complaints_documents` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `id_complaint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
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

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `state`, `password`) VALUES
(1, 'Meno_1', 'Priezvisko_1', 'zakaznik_1@email.com', 38578330, 1, '$2y$10$s1tAB/5onyVNFK..JU.9NuQevnL6OLHSMZ0.5uW0Pn9HK8oTmgUki'),
(2, 'Meno_2', 'Priezvisko_2', 'zakaznik_2@email.com', 36620544, 3, '$2y$10$PvE9oM7h11valPKb4EsIWeHEk.V9iJxzqTzlIFeB37iYktbeTmkW.'),
(3, 'Meno_3', 'Priezvisko_3', 'zakaznik_3@email.com', 99524807, 2, '$2y$10$2.YglEAji08AdPohXIoaDerhgDkW0UyMgdC5IuJAwmQKczn5EA5B6'),
(4, 'Meno_4', 'Priezvisko_4', 'zakaznik_4@email.com', 73539637, 2, '$2y$10$bczMFkOQ4rRUfd6Iz7JehOa5r.2qjlZtBw00nCydANiJhZ0H7sbDi'),
(5, 'Meno_5', 'Priezvisko_5', 'zakaznik_5@email.com', 37432026, 3, '$2y$10$WToXH.EMUD6ot.HhZtRAr.wZ6oDfe2gp23cmihosvIuxlH8800n7q'),
(6, 'Meno_6', 'Priezvisko_6', 'zakaznik_6@email.com', 62593570, 3, '$2y$10$VH8mA2GT4T.IkgiU0oQX6OlAbTFkEyT5Hb7M8hA6eT4BcfCFB63bG'),
(7, 'Meno_7', 'Priezvisko_7', 'zakaznik_7@email.com', 20014658, 2, '$2y$10$KXOHIDPKqdZCT.H5b0aK7.KeizOwVepbnnoYCVJ7cITTbmLucJ7h2'),
(8, 'Meno_8', 'Priezvisko_8', 'zakaznik_8@email.com', 54549656, 3, '$2y$10$rm81j4FBwZxVkydrFtzlseZOEVL4NcY4LUYv4NCNt1jq6n3vW415K'),
(9, 'Meno_9', 'Priezvisko_9', 'zakaznik_9@email.com', 29444851, 1, '$2y$10$qkeCFFMm6yoO4fTPcpIQSumftInyBGAvBiRksg6bLHlgoJxnyscwK'),
(10, 'Meno_10', 'Priezvisko_10', 'zakaznik_10@email.com', 43559678, 3, '$2y$10$6YJqyY3xtoEor0ul9Nugbe2Cb5HKp2rqK3XdkSJQLzO5Y87IFy9Yu');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `customers_uids`
--

CREATE TABLE `customers_uids` (
  `id` int(11) NOT NULL,
  `uid` varchar(55) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `customers_uids`
--

INSERT INTO `customers_uids` (`id`, `uid`, `id_customer`) VALUES
(3, '31231231', 1),
(4, '31231312', 2);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `dia_messages`
--

CREATE TABLE `dia_messages` (
  `id` int(11) NOT NULL,
  `recipient` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `id_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `dia_messages`
--

INSERT INTO `dia_messages` (`id`, `recipient`, `sender`, `subject`, `body`, `timestamp`, `viewed`, `id_answer`) VALUES
(1, 'admin@dia.sk', 'Jozef17@email.sk', 'Produkt-17 k dispozícii?', 'Dobrý deň,\r\nKedy bude produkt-17 k dispozícii?\r\nĎakujem, \r\nJozef L.', '2022-02-28 12:02:53', 0, 0);

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
(2, 0, 'Objednávky', 'objednavky', 'Objednávky', 'donate', 500, 1),
(3, 2, 'Všetky', 'objednavky-vsetky', 'Všetky objednávky', '', 41, 1),
(4, 2, 'Nové', 'objednavky-nove', 'Nové objednávky', '', 42, 1),
(5, 2, 'Schválené', 'objednavky-schvalene', 'Schválené', '', 43, 1),
(7, 0, 'Reklamácie', 'reklamacie', 'Reklamácie', 'sync', 800, 1),
(8, 0, 'Faktúry', 'faktury', 'Faktúry', 'file-alt', 700, 1),
(209, 0, 'Produkty', 'produkty', '', 'archive', 200, 1),
(211, 0, 'Zákazníci', 'zakaznici', '', 'users', 400, 1),
(212, 0, 'Domov', 'home', '', 'home', 100, 1),
(213, 2, 'Zaplatené', 'objednavky-zaplatene', NULL, NULL, 44, 1),
(214, 2, 'Odovzdané', 'objednavky-odovzdane', NULL, NULL, 45, 1),
(215, 8, 'Vystavené', 'faktury-vystavene', '', '', 51, 1),
(216, 8, 'Zaplatené', 'faktury-zaplatene', '', '', 52, 1),
(217, 0, 'Príslušenstvo', 'male-produkty', '', 'th-large', 300, 1),
(218, 0, 'Košíky', 'kosiky', '', 'shopping-cart', 600, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `dia_notifications`
--

CREATE TABLE `dia_notifications` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `url` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `dia_notifications`
--

INSERT INTO `dia_notifications` (`id`, `message`, `id_user`, `timestamp`, `viewed`, `url`) VALUES
(2, 'XXX', 1, '2022-02-15 13:17:21', 1, 'produkty?id_form=1'),
(3, 'XXX', 1, '2022-02-15 13:21:13', 1, NULL);

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
(1, 'users', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":false},\"avatar\":{\"show_in_table\":true,\"show_in_form\":true,\"type\":\"image\"},\"first_name\":{\"required\":true,\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Meno\"},\"last_name\":{\"required\":true,\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Priezvisko\"},\"email\":{\"type\":\"email\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"E-mail\",\"required\":true},\"password\":{\"type\":\"password\",\"required\":true,\"show_in_form\":false,\"show_in_table\":false,\"name_in_table\":\"Heslo\"}}'),
(2, 'products', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":false},\"image\":{\"type\":\"image\",\"show_in_table\":true,\"show_in_form\":true,\"upload_action\":\"upload_product_image\",\"required\":true},\"name\":{\"show_in_table\":true,\"name_in_table\":\"Produkt\",\"show_in_form\":true,\"required\":true},\"price\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Cena\",\"show_in_form\":true,\"required\":true,\"unit\":\"€\"},\"available\":{\"type\":\"checkbox\",\"default_value\":true,\"show_in_table\":true,\"name_in_table\":\"Dostupný\",\"show_in_form\":true},\"count\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Skladom\",\"show_in_form\":true},\"description\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Popis\",\"show_in_form\":true},\"type\":{\"type\":\"radio\",\"default_value\":1,\"radio\":{\"1\":\"Na mieru\",\"2\":\"Príslušenstvo\"},\"show_in_table\":false,\"name_in_table\":\"Typ\",\"show_in_form\":true}}'),
(3, 'accessories', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":false},\"image\":{\"type\":\"image\",\"show_in_table\":true,\"show_in_form\":true},\"name\":{\"show_in_table\":true,\"name_in_table\":\"Produkt\",\"show_in_form\":true,\"required\":true},\"price\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Cena\",\"show_in_form\":true,\"required\":true,\"unit\":\"€\"},\"available\":{\"type\":\"checkbox\",\"show_in_table\":true,\"name_in_table\":\"Dostupný\",\"show_in_form\":true},\"description\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Popis\",\"show_in_form\":true},\"count\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Počet\",\"show_in_form\":true}}'),
(4, 'customers', '{\"first_name\":{\"disabled\":true,\"required\":true,\"show_in_table\":true,\"name_in_table\":\"Meno\",\"show_in_form\":true},\"last_name\":{\"required\":true,\"show_in_table\":true,\"name_in_table\":\"Priezvisko\",\"show_in_form\":true},\"email\":{\"required\":false,\"show_in_table\":true,\"name_in_table\":\"E-mail\",\"show_in_form\":true},\"phone_number\":{\"required\":true,\"show_in_table\":true,\"name_in_table\":\"Mobil\",\"show_in_form\":true},\"state\":{\"type\":\"radio\",\"name_in_table\":\" \",\"default_value\":\"1\",\"radio\":{\"1\":\"Nový\",\"2\":\"Overený\",\"3\":\"Dlžný\"},\"radio_colors\":{\"1\":\"success\",\"2\":\"primary\",\"3\":\"danger\"},\"show_in_table\":true,\"show_in_form\":true}}'),
(5, 'orders', '{\"serial_number\":{\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Číslo\"},\"first_name\":{\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Meno\",\"required\":true},\"last_name\":{\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Priezvisko\",\"required\":true},\"phone\":{\"type\":\"number\",\"step\":1,\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Telefón\",\"required\":true},\"email\":{\"type\":\"email\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"E-mail\",\"required\":true},\"type\":{\"type\":\"radio\",\"default_value\":1,\"radio\":{\"1\":\"Nová\",\"2\":\"Schválená\",\"3\":\"Zaplatená\",\"4\":\"Odovzdaná\"},\"show_in_table\":false,\"show_in_form\":true,\"name_in_table\":\"Typ\"},\"id_customer\":{\"type\":\"lookup\",\"lookup_icon\":\"user\",\"lookup_table\":\"customers\",\"lookup_table_col\":\"id_customer\",\"lookup_url\":\"zakaznici\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Zákazník\",\"lookup_columns\":{\"1\":\"first_name\", \"2\":\"last_name\"},\"lookup_empty_table\":\"<strong style=\'color:#dbdbdb\'>Neregistrovaný</strong>\",\"readonly_in_edit\":true},\"id_cart\":{\"type\":\"lookup\",\"lookup_url_type\":\"idcart\",\"lookup_table\":\"carts\",\"lookup_icon\":\"shopping-cart\",\"lookup_table_col\":\"id_cart\",\"lookup_url\":\"kosik\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Košík\",\"lookup_empty_table\":\"<strong style=\'color:#dbdbdb\'>Prázdny</strong>\"},\"id_invoice\":{\"type\":\"lookup\",\"lookup_table\":\"invoices\",\"lookup_icon\":\"file-alt\",\"lookup_columns\":{\"1\":\"number\", \"2\":\"price\"},\"lookup_table_col\":\"id_invoice\",\"lookup_table_empty\":\"Nie je vystavená\",\"lookup_url\":\"faktury\",\"lookup_table_empty_action\":\"vystavit_fakturu?id_order=%id%\",\"lookup_table_empty_text\":\"Vystaviť faktúru\",\"lookup_empty_action\":true,\"lookup_url_type\":\"id_form\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Faktúra\",\"lookup_empty_table\":\"<strong style=\'color:#dbdbdb\'>x</strong>\",\"hide_in_new_form\":true}}'),
(6, 'products_accessories', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":false},\"image\":{\"type\":\"image\",\"show_in_table\":true,\"show_in_form\":true},\"name\":{\"show_in_table\":true,\"name_in_table\":\"Produkt\",\"show_in_form\":true,\"required\":true},\"price\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Cena\",\"show_in_form\":true,\"required\":true,\"unit\":\"€\"},\"available\":{\"type\":\"checkbox\",\"show_in_table\":true,\"name_in_table\":\"Dostupný\",\"show_in_form\":true},\"count\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Skladom\",\"show_in_form\":true},\"description\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Popis\",\"show_in_form\":true},\"type\":{\"type\":\"radio\",\"default_value\":1,\"radio\":{\"1\":\"Na mieru\",\"2\":\"Príslušenstvo\"},\"show_in_table\":false,\"name_in_table\":\"Typ\",\"show_in_form\":true}}'),
(7, 'invoices', '{\"number\":{\"type\":\"number\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Číslo\"},\"price\":{\"type\":\"number\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Cena\",\"unit\":\"€\"},\"id_order\":{\"type\":\"lookup\",\"lookup_table\":\"orders\",\"lookup_table_col\":\"id\",\"lookup_columns\":{\"1\":\"serial_number\"},\"lookup_url\":\"objednavky\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Objednávka\"},\"state\":{\"type\":\"radio\",\"default_value\":1,\"radio\":{\"1\":\"Vystavená\",\"2\":\"Zaplatená\"},\"show_in_table\":false,\"show_in_form\":true,\"name_in_table\":\"Stav\"}}\n'),
(8, 'carts_products', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":false},\"image\":{\"type\":\"image\",\"show_in_table\":true,\"show_in_form\":true},\"name\":{\"show_in_table\":true,\"name_in_table\":\"Produkt\",\"show_in_form\":true,\"required\":true},\"price\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Cena\",\"show_in_form\":true,\"required\":true,\"unit\":\"€\"},\"available\":{\"type\":\"checkbox\",\"default_value\":true,\"show_in_table\":true,\"name_in_table\":\"Dostupný\",\"show_in_form\":true},\"count\":{\"type\":\"number\",\"show_in_table\":true,\"name_in_table\":\"Skladom\",\"show_in_form\":true},\"description\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Popis\",\"show_in_form\":true},\"type\":{\"type\":\"number\",\"show_in_table\":false,\"name_in_table\":\"Typ\",\"show_in_form\":true}}'),
(9, 'dia_navbar', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":true},\"id_parent\":{\"type\":\"number\",\"show_in_table\":true,\"show_in_form\":true},\"name\":{\"show_in_table\":true,\"show_in_form\":true,\"type\":\"text\"},\"link\":{\"show_in_table\":true,\"show_in_form\":true,\"type\":\"text\"},\"description\":{\"show_in_table\":true,\"show_in_form\":true,\"type\":\"text\"},\"icon\":{\"show_in_table\":true,\"show_in_form\":true,\"type\":\"text\"},\"order_index\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":true},\"is_enabled\":{\"type\":\"checkbox\",\"show_in_table\":false,\"show_in_form\":true,\"default_value\":true}}'),
(10, 'menu', '{\"id\":{\"type\":\"number\",\"show_in_table\":false,\"show_in_form\":true},\"title\":{\"show_in_table\":true,\"show_in_form\":true,\"type\":\"text\"},\"link\":{\"show_in_table\":true,\"show_in_form\":true,\"type\":\"text\"}}'),
(11, 'complaints', '{\"id_order\":{\"type\":\"lookup\",\"lookup_table\":\"orders\",\"lookup_table_col\":\"id\",\"lookup_columns\":{\"1\":\"serial_number\",\"2\":\"first_name\",\"3\":\"last_name\"},\"lookup_url\":\"objednavky\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Objednávka\"},\"type\":{\"type\":\"radio\",\"show_in_table\":true,\"default_value\":1,\"radio\":{\"1\":\"Nová\",\"2\":\"Schválená\",\"3\":\"Hotová\"},\"show_in_form\":true,\"radio_colors\":{\"1\":\"danger\",\"2\":\"warning\",\"3\":\"success\"}},\"description\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Popis\",\"show_in_form\":true},\"created_at\":{\"type\":\"datetime-local\",\"show_in_table\":true,\"name_in_table\":\"Vytvorená\",\"show_in_form\":true,\"readonly\":true}}'),
(12, 'dia_messages', '{\"recipient\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Príjemca\"},\"sender\":{\"type\":\"text\",\"show_in_table\":true,\"name_in_table\":\"Odosielateľ\"},\"subject\":{\"type\":\"text\",\"show_in_table\":true,\"name_in_table\":\"Predmet\",\"limit_string\":10},\"body\":{\"type\":\"text\",\"show_in_table\":false,\"name_in_table\":\"Správa\"},\"timestamp\":{\"type\":\"text\",\"show_in_table\":true,\"name_in_table\":\"Dátum\"},\"viewed\":{\"type\":\"checkbox\",\"checkbox_false\":\"<i class=\'far fa-eye-slash color-grey\'></i>\",\"checkbox_true\":\"<i class=\'far fa-eye color-grey\'></i>\",\"show_in_table\":true},\"id_answer\":{\"type\":\"checkbox\",\"show_in_table\":true,\"name_in_table\":\"Odpoveď\"}}'),
(13, 'dia_notifications', '{\"message\":{\"type\":\"text\",\"show_in_table\":true,\"name_in_table\":\"Popis\"},\"timestamp\":{\"type\":\"text\",\"show_in_table\":true},\"viewed\":{\"type\":\"checkbox\",\"checkbox_false\":\"<i class=\'far fa-eye-slash color-grey\'></i>\",\"checkbox_true\":\"<i class=\'far fa-eye color-grey\'></i>\",\"show_in_table\":true}}'),
(14, 'carts', '{\"id\":{\"show_in_table\":true,\"name_in_table\":\"ID\"},\"id_customer_uid\":{\"show_in_table\":false,\"show_in_form\":false,\"hide_in_new_form\":true},\"is_order\":{\"type\":\"checkbox\",\"default_value\":true,\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Objednané\"}}\n');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `gallery`
--

INSERT INTO `gallery` (`id`, `image`) VALUES
(1, 'product_2.png'),
(2, 'product_2.png'),
(3, 'product_2.png'),
(4, 'product_3.png'),
(5, 'product_3.png'),
(6, 'product_3.png'),
(7, 'product_3.png'),
(8, 'product_1.png'),
(9, 'product_3.png'),
(10, 'product_3.png'),
(11, 'product_2.png'),
(12, 'product_3.png'),
(13, 'product_3.png'),
(14, 'product_2.png'),
(15, 'product_1.png'),
(16, 'product_3.png'),
(17, 'product_2.png'),
(18, 'product_2.png'),
(19, 'product_3.png'),
(20, 'product_1.png'),
(21, 'product_1.png'),
(22, 'product_1.png'),
(23, 'product_1.png'),
(24, 'product_3.png'),
(25, 'product_2.png'),
(26, 'product_2.png'),
(27, 'product_1.png'),
(28, 'product_3.png'),
(29, 'product_1.png'),
(30, 'product_3.png'),
(31, 'product_1.png'),
(32, 'product_1.png'),
(33, 'product_1.png'),
(34, 'product_3.png'),
(35, 'product_1.png'),
(36, 'product_1.png'),
(37, 'product_2.png'),
(38, 'product_3.png'),
(39, 'product_3.png'),
(40, 'product_2.png'),
(41, 'product_3.png'),
(42, 'product_3.png'),
(43, 'product_1.png'),
(44, 'product_3.png'),
(45, 'product_1.png'),
(46, 'product_3.png'),
(47, 'product_1.png'),
(48, 'product_1.png'),
(49, 'product_1.png'),
(50, 'product_1.png'),
(51, 'product_2.png'),
(52, 'product_2.png'),
(53, 'product_2.png'),
(54, 'product_2.png'),
(55, 'product_3.png'),
(56, 'product_2.png'),
(57, 'product_3.png'),
(58, 'product_3.png'),
(59, 'product_1.png'),
(60, 'product_1.png'),
(61, 'product_2.png'),
(62, 'product_3.png'),
(63, 'product_1.png'),
(64, 'product_3.png'),
(65, 'product_3.png'),
(66, 'product_1.png'),
(67, 'product_3.png'),
(68, 'product_2.png'),
(69, 'product_1.png'),
(70, 'product_3.png'),
(71, 'product_2.png'),
(72, 'product_3.png'),
(73, 'product_3.png'),
(74, 'product_3.png'),
(75, 'product_2.png'),
(76, 'product_2.png'),
(77, 'product_2.png'),
(78, 'product_1.png'),
(79, 'product_3.png'),
(80, 'product_1.png'),
(81, 'product_2.png'),
(82, 'product_2.png'),
(83, 'product_2.png'),
(84, 'product_2.png'),
(85, 'product_1.png'),
(86, 'product_1.png'),
(87, 'product_2.png'),
(88, 'product_3.png'),
(89, 'product_3.png'),
(90, 'product_2.png'),
(91, 'product_1.png'),
(92, 'product_3.png'),
(93, 'product_3.png'),
(94, 'product_2.png'),
(95, 'product_3.png'),
(96, 'product_3.png'),
(97, 'product_1.png'),
(98, 'product_3.png'),
(99, 'product_3.png'),
(100, 'wallpaper.jpeg'),
(101, 'wallpaper.jpeg'),
(102, 'basic-measuring-of-resistance-voltage-and-current-using'),
(103, 'wallpaper.jpeg'),
(104, 'wallpaper.jpeg'),
(105, 'wallpaper.jpeg'),
(106, '2009-12-30_030828_4.jpg');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `number` int(9) NOT NULL,
  `price` float NOT NULL,
  `state` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `invoices`
--

INSERT INTO `invoices` (`id`, `number`, `price`, `state`) VALUES
(1, 1, 135.55, 2),
(2, 2, 140, 2),
(3, 3, 111, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `link` varchar(55) NOT NULL,
  `order_index` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `menu`
--

INSERT INTO `menu` (`id`, `title`, `link`, `order_index`) VALUES
(1, 'Domov', 'domov', 1),
(2, 'Služby', 'sluzby', 2),
(3, 'O nás', 'o-nas', 3),
(4, 'Kontakt', 'kontakt', 4),
(5, 'Cenník', 'cennik', 5);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `serial_number` int(8) DEFAULT NULL,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` int(1) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_cart` int(11) NOT NULL,
  `id_invoice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `orders`
--

INSERT INTO `orders` (`id`, `serial_number`, `first_name`, `last_name`, `phone`, `email`, `type`, `id_customer`, `id_cart`, `id_invoice`) VALUES
(1, 9999, 'Meno_10', 'Priezvisko_10', 43432432, 'zakaznik_10@email.com', 2, 10, 1, 0);

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
  `type` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `products`
--

INSERT INTO `products` (`id`, `image`, `name`, `price`, `available`, `count`, `description`, `type`) VALUES
(1, 'product_2.png', 'Príslušenstvo-1', 727.00, 0, 9, 'Popis', 2),
(2, 'product_3.png', 'Produkt-2', 570.00, 0, 9, 'Popis', 1),
(3, 'product_1.png', 'Príslušenstvo-3', 675.00, 1, 7, 'Popis', 2),
(4, 'product_3.png', 'Príslušenstvo-4', 732.00, 0, 8, 'Popis', 2),
(5, 'product_1.png', 'Príslušenstvo-5', 747.00, 1, 12, 'Popis', 2),
(6, 'product_3.png', 'Produkt-6', 139.00, 1, 15, 'Popis', 1),
(7, 'product_1.png', 'Produkt-7', 823.00, 1, 10, 'Popis', 1),
(8, 'product_1.png', 'Príslušenstvo-8', 558.00, 1, 15, 'Popis', 2),
(9, 'product_1.png', 'Príslušenstvo-9', 486.00, 0, 8, 'Popis', 2),
(10, 'product_3.png', 'Produkt-10', 878.00, 1, 1, 'Popis', 1),
(11, 'product_2.png', 'Produkt-11', 240.00, 0, 15, 'Popis', 1),
(12, 'product_2.png', 'Produkt-12', 157.00, 0, 10, 'Popis', 1),
(13, 'product_3.png', 'Príslušenstvo-13', 90.00, 1, 6, 'Popis', 2),
(14, 'product_3.png', 'Príslušenstvo-14', 811.00, 0, 15, 'Popis', 2),
(15, 'product_3.png', 'Produkt-15', 553.00, 0, 6, 'Popis', 1),
(16, 'product_1.png', 'Príslušenstvo-16', 94.00, 1, 8, 'Popis', 2),
(17, 'product_2.png', 'Príslušenstvo-17', 226.00, 0, 14, 'Popis', 2),
(18, 'product_2.png', 'Príslušenstvo-18', 839.00, 1, 14, 'Popis', 2),
(19, 'product_2.png', 'Produkt-19', 940.00, 0, 4, 'Popis', 1),
(20, 'product_3.png', 'Príslušenstvo-20', 164.00, 1, 2, 'Popis', 2),
(21, 'product_3.png', 'Príslušenstvo-21', 356.00, 1, 10, 'Popis', 2),
(22, 'product_2.png', 'Príslušenstvo-22', 926.00, 1, 14, 'Popis', 2),
(23, 'product_1.png', 'Produkt-23', 712.00, 1, 5, 'Popis', 1),
(24, 'product_2.png', 'Produkt-24', 904.00, 0, 5, 'Popis', 1),
(25, 'product_1.png', 'Produkt-25', 311.00, 1, 1, 'Popis', 1),
(26, 'product_2.png', 'Produkt-26', 14.00, 0, 1, 'Popis', 1),
(27, 'product_1.png', 'Príslušenstvo-27', 242.00, 1, 12, 'Popis', 2),
(28, 'product_2.png', 'Produkt-28', 163.00, 0, 7, 'Popis', 1),
(29, 'product_2.png', 'Príslušenstvo-29', 15.00, 1, 13, 'Popis', 2),
(30, 'product_1.png', 'Produkt-30', 92.00, 0, 12, 'Popis', 1),
(31, 'product_3.png', 'Príslušenstvo-31', 747.00, 1, 3, 'Popis', 2),
(32, 'product_3.png', 'Produkt-32', 89.00, 1, 13, 'Popis', 1),
(33, 'product_1.png', 'Príslušenstvo-33', 26.00, 1, 0, 'Popis', 2),
(34, 'product_2.png', 'Produkt-34', 522.00, 0, 13, 'Popis', 1),
(35, 'product_1.png', 'Príslušenstvo-35', 764.00, 0, 3, 'Popis', 2),
(36, 'product_1.png', 'Produkt-36', 978.00, 0, 8, 'Popis', 1),
(37, 'product_2.png', 'Produkt-37', 795.00, 0, 9, 'Popis', 1),
(38, 'product_1.png', 'Príslušenstvo-38', 133.00, 1, 2, 'Popis', 2),
(39, 'product_3.png', 'Produkt-39', 599.00, 1, 5, 'Popis', 1),
(40, 'product_3.png', 'Produkt-40', 779.00, 0, 11, 'Popis', 1),
(41, 'product_2.png', 'Príslušenstvo-41', 859.00, 0, 3, 'Popis', 2),
(42, 'product_2.png', 'Príslušenstvo-42', 593.00, 0, 15, 'Popis', 2),
(43, 'product_2.png', 'Príslušenstvo-43', 342.00, 0, 3, 'Popis', 2),
(44, 'product_3.png', 'Príslušenstvo-44', 287.00, 0, 6, 'Popis', 2),
(45, 'product_3.png', 'Produkt-45', 791.00, 0, 10, 'Popis', 1),
(46, 'product_1.png', 'Príslušenstvo-46', 536.00, 1, 10, 'Popis', 2),
(47, 'product_3.png', 'Produkt-47', 820.00, 0, 9, 'Popis', 1),
(48, 'product_1.png', 'Produkt-48', 791.00, 0, 8, 'Popis', 1),
(49, 'product_2.png', 'Príslušenstvo-49', 413.00, 0, 8, 'Popis', 2),
(50, 'product_1.png', 'Príslušenstvo-50', 882.00, 1, 3, 'Popis', 2),
(51, 'product_2.png', 'Príslušenstvo-51', 577.00, 1, 2, 'Popis', 2),
(52, 'product_2.png', 'Produkt-52', 965.00, 1, 7, 'Popis', 1),
(53, 'product_2.png', 'Príslušenstvo-53', 373.00, 0, 5, 'Popis', 2),
(54, 'product_2.png', 'Príslušenstvo-54', 832.00, 0, 7, 'Popis', 2),
(55, 'product_3.png', 'Príslušenstvo-55', 200.00, 0, 13, 'Popis', 2),
(56, 'product_3.png', 'Produkt-56', 649.00, 0, 11, 'Popis', 1),
(57, 'product_1.png', 'Príslušenstvo-57', 15.00, 0, 10, 'Popis', 2),
(58, 'product_1.png', 'Príslušenstvo-58', 456.00, 1, 15, 'Popis', 2),
(59, 'product_3.png', 'Príslušenstvo-59', 11.00, 0, 5, 'Popis', 2),
(60, 'product_3.png', 'Príslušenstvo-60', 23.00, 0, 12, 'Popis', 2),
(61, 'product_3.png', 'Príslušenstvo-61', 6.00, 0, 13, 'Popis', 2),
(62, 'product_2.png', 'Príslušenstvo-62', 142.00, 1, 1, 'Popis', 2),
(63, 'product_1.png', 'Príslušenstvo-63', 610.00, 1, 9, 'Popis', 2),
(64, 'product_2.png', 'Príslušenstvo-64', 336.00, 1, 5, 'Popis', 2),
(65, 'product_1.png', 'Produkt-65', 930.00, 1, 4, 'Popis', 1),
(66, 'product_2.png', 'Príslušenstvo-66', 828.00, 0, 4, 'Popis', 2),
(67, 'product_1.png', 'Príslušenstvo-67', 304.00, 0, 5, 'Popis', 2),
(68, 'product_2.png', 'Produkt-68', 470.00, 0, 2, 'Popis', 1),
(69, 'product_3.png', 'Produkt-69', 117.00, 0, 6, 'Popis', 1),
(70, 'product_1.png', 'Príslušenstvo-70', 841.00, 1, 8, 'Popis', 2),
(71, 'product_3.png', 'Príslušenstvo-71', 21.00, 1, 10, 'Popis', 2),
(72, 'product_1.png', 'Príslušenstvo-72', 280.00, 1, 15, 'Popis', 2),
(73, 'product_1.png', 'Príslušenstvo-73', 615.00, 0, 14, 'Popis', 2),
(74, 'product_3.png', 'Produkt-74', 163.00, 1, 10, 'Popis', 1),
(75, 'product_3.png', 'Produkt-75', 920.00, 1, 7, 'Popis', 1),
(76, 'product_1.png', 'Príslušenstvo-76', 488.00, 0, 8, 'Popis', 2),
(77, 'product_1.png', 'Príslušenstvo-77', 541.00, 0, 2, 'Popis', 2),
(78, 'product_3.png', 'Produkt-78', 354.00, 0, 12, 'Popis', 1),
(79, 'product_3.png', 'Príslušenstvo-79', 264.00, 1, 2, 'Popis', 2),
(80, 'product_1.png', 'Príslušenstvo-80', 394.00, 1, 12, 'Popis', 2),
(81, 'product_2.png', 'Produkt-81', 89.00, 0, 3, 'Popis', 1),
(82, 'product_1.png', 'Produkt-82', 148.00, 1, 2, 'Popis', 1),
(83, 'product_3.png', 'Produkt-83', 768.00, 0, 12, 'Popis', 1),
(84, 'product_3.png', 'Príslušenstvo-84', 717.00, 1, 6, 'Popis', 2),
(85, 'product_1.png', 'Príslušenstvo-85', 167.00, 1, 11, 'Popis', 2),
(86, 'product_1.png', 'Príslušenstvo-86', 124.00, 1, 5, 'Popis', 2),
(87, 'product_3.png', 'Príslušenstvo-87', 798.00, 1, 0, 'Popis', 2),
(88, 'product_3.png', 'Príslušenstvo-88', 77.00, 1, 9, 'Popis', 2),
(89, 'product_2.png', 'Produkt-89', 843.00, 0, 1, 'Popis', 1),
(90, 'product_1.png', 'Produkt-90', 0.00, 0, 1, 'Popis', 1),
(91, 'product_2.png', 'Produkt-91', 676.00, 1, 11, 'Popis', 1),
(92, 'product_3.png', 'Produkt-92', 776.00, 1, 10, 'Popis', 1),
(93, 'product_1.png', 'Produkt-93', 879.00, 1, 11, 'Popis', 1),
(94, 'product_1.png', 'Produkt-94', 181.00, 0, 9, 'Popis', 1),
(95, 'product_3.png', 'Príslušenstvo-95', 339.00, 0, 6, 'Popis', 2),
(96, 'product_1.png', 'Produkt-96', 421.00, 0, 2, 'Popis', 1),
(97, 'product_3.png', 'Príslušenstvo-97', 666.00, 0, 0, 'Popis', 2),
(98, 'product_2.png', 'Príslušenstvo-98', 535.00, 0, 15, 'Popis', 2),
(99, 'product_3.png', 'Produkt-99', 8.00, 1, 15, 'Popis', 1),
(100, 'product_3.png', 'Príslušenstvo-100', 579.00, 1, 14, 'Popis', 2);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `products_accessories`
--

CREATE TABLE `products_accessories` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_product_accessory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Štruktúra tabuľky pre tabuľku `products_gallery`
--

CREATE TABLE `products_gallery` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_gallery` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `avatar` varchar(55) DEFAULT 'avatar.png',
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `avatar`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'admin.jpg', 'Admin', 'Admin', 'admin@dia.sk', '$2y$10$.tSU76T5uTw40vRifEB1z.bmFCJkQuoNEUOch8O0zSHqUYeIsB3WO');

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
(77, 1, 1, '2009-12-30_030828_4.jpg', 43330),
(78, 1, 1, '2009-12-30_030828_4.jpg', 43330),
(79, 1, 1, '2009-12-30_030828_4.jpg', 43330),
(80, 1, 1, '2009-12-30_030828_4.jpg', 43330),
(81, 1, 1, '2009-12-30_030828_4.jpg', 43330);

--
-- Kľúče pre exportované tabuľky
--

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
-- Indexy pre tabuľku `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `complaints_documents`
--
ALTER TABLE `complaints_documents`
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
-- Indexy pre tabuľku `dia_messages`
--
ALTER TABLE `dia_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `dia_navbar`
--
ALTER TABLE `dia_navbar`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `dia_notifications`
--
ALTER TABLE `dia_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `dia_tables`
--
ALTER TABLE `dia_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `menu`
--
ALTER TABLE `menu`
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
-- Indexy pre tabuľku `products_gallery`
--
ALTER TABLE `products_gallery`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `carts_products`
--
ALTER TABLE `carts_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pre tabuľku `complaints_documents`
--
ALTER TABLE `complaints_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `customers_uids`
--
ALTER TABLE `customers_uids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `dia_messages`
--
ALTER TABLE `dia_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `dia_navbar`
--
ALTER TABLE `dia_navbar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT pre tabuľku `dia_notifications`
--
ALTER TABLE `dia_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `dia_tables`
--
ALTER TABLE `dia_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pre tabuľku `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT pre tabuľku `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `products_discounts`
--
ALTER TABLE `products_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `products_gallery`
--
ALTER TABLE `products_gallery`
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
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
