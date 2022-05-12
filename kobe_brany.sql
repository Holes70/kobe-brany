-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Št 12.Máj 2022, 11:06
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
  `is_order` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `carts`
--

INSERT INTO `carts` (`id`, `id_customer_uid`, `is_order`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 2, 1),
(9, 1, 1),
(10, 3, 0);

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
(1, 1, 98),
(2, 1, 94),
(3, 2, 76),
(4, 3, 98),
(5, 4, 87),
(6, 5, 22),
(7, 6, 22),
(8, 7, 1),
(9, 7, 87),
(10, 8, 97),
(11, 9, 98),
(12, 9, 90);

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
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
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
(10, 'Meno_10', 'Priezvisko_10', 'zakaznik_10@email.com', 43559678, 3, '$2y$10$6YJqyY3xtoEor0ul9Nugbe2Cb5HKp2rqK3XdkSJQLzO5Y87IFy9Yu'),
(11, 'Jozef', 'Obrovsky', 'jozefo@email.sk', 132321, 1, '$2y$10$5VVHWV4a9p/KbleylRsPte8KP2VfwRTpDH363GicFXqC2oANFcmo.'),
(12, 'Marek', 'Haha', 'Marek7@gmail.com', 423432, 1, '$2y$10$9b49N6/unZrW719rBP6O4ezZLBSyj7UAMDNOk3wK1x0z854I79zbS');

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
(1, '957149121', NULL),
(2, '757313347', NULL),
(3, '1364924746', NULL);

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
(1, 'admin@dia.sk', 'Jozef17@email.sk', 'Produkt-17 k dispozícii?', 'Dobrý deň,\r\nKedy bude produkt-17 k dispozícii?\r\nĎakujem, \r\nJozef L.', '2022-03-11 11:43:45', 1, 0);

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
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `available_for_user` text NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `dia_navbar`
--

INSERT INTO `dia_navbar` (`id`, `id_parent`, `name`, `link`, `description`, `icon`, `order_index`, `is_enabled`, `available_for_user`) VALUES
(2, 0, 'Objednávky', 'objednavky', 'Objednávky', 'donate', 500, 1, '{\"1\":1,\"2\":2}'),
(3, 2, 'Všetky', 'objednavky', 'Všetky objednávky', '', 41, 1, '{\"1\":1,\"2\":2}'),
(4, 2, 'Nové', 'objednavky-nove', 'Nové objednávky', '', 42, 1, '{\"1\":1,\"2\":2}'),
(5, 2, 'Schválené', 'objednavky-schvalene', 'Schválené', '', 43, 1, '{\"1\":1,\"2\":2}'),
(7, 0, 'Reklamácie', 'reklamacie', 'Reklamácie', 'sync', 800, 1, '{\"1\":1,\"2\":2}'),
(8, 0, 'Faktúry', 'faktury', 'Faktúry', 'file-alt', 700, 1, '{\"1\":1,\"2\":2}'),
(209, 0, 'Produkty', 'produkty', '', 'archive', 200, 1, '{\"1\":1,\"2\":3}'),
(211, 0, 'Zákazníci', 'zakaznici', '', 'users', 400, 1, '{\"1\":1}'),
(212, 0, 'Domov', 'home', '', 'home', 100, 1, '{\"1\":1,\"2\":2,\"3\":3}'),
(213, 2, 'Zaplatené', 'objednavky-zaplatene', NULL, NULL, 44, 1, '{\"1\":1,\"2\":2}'),
(214, 2, 'Odovzdané', 'objednavky-odovzdane', NULL, NULL, 45, 1, '{\"1\":1,\"2\":2}'),
(215, 8, 'Vystavené', 'faktury-vystavene', '', '', 51, 1, '{\"1\":1,\"2\":2}'),
(216, 8, 'Zaplatené', 'faktury-zaplatene', '', '', 52, 1, '{\"1\":1,\"2\":2}'),
(217, 0, 'Príslušenstvo', 'male-produkty', '', 'th-large', 300, 1, '{\"1\":1,\"2\":3}'),
(218, 0, 'Košíky', 'kosiky', '', 'shopping-cart', 600, 1, '{\"1\":1}'),
(219, 2, 'Prehľad', 'objednavky-vsetky', '', '', 40, 0, '{\"1\":1}');

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
(1, 9999, 'Jozef', 'Hrdlo', 9999999, 'hrdlo@email.sk', 1, 0, 1, NULL),
(2, 9999, 'Jozef', 'Hrdlo', 9999999, 'hrdlo@email.sk', 2, 0, 2, 0),
(3, 9999, 'Ondrej', 'Lah', 2147483647, 'la2112h@email.sk', 1, 0, 3, NULL),
(4, 9999, 'Pavol', 'Hrach', 432432432, 'hrach@asdasd.sk', 1, 0, 4, NULL),
(5, 9999, 'Maria', 'Banova', 432432432, 'banova@zoznam.sk', 3, 0, 5, 0),
(6, 9999, 'Roman', 'Mlady', 2147483647, '1222mlady@azet.sk', 1, 0, 6, NULL),
(7, 9999, 'Vlado', 'Roman', 321312321, 'vlado_r@gmail.com', 2, 0, 7, 0),
(8, 9999, 'Jozef', 'Obrovsky', 132321, 'jozefo@email.sk', 2, 11, 8, 0),
(9, 9999, 'Marek', 'Haha', 423432, 'Marek7@gmail.com', 1, 12, 9, NULL);

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
  `vat` int(2) NOT NULL,
  `price_without_vat` float NOT NULL,
  `available` tinyint(1) DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `state` int(1) NOT NULL DEFAULT 1,
  `discount` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `products`
--

INSERT INTO `products` (`id`, `image`, `name`, `price`, `vat`, `price_without_vat`, `available`, `count`, `description`, `type`, `state`, `discount`) VALUES
(1, 'product_1.jpg', 'Produkt-1', 822.00, 20, 685, 1, 0, 'Popis', 1, 2, 0),
(2, 'prislusenstvo_2.jpg', 'Príslušenstvo-2', 169.00, 20, 140.83, 0, 8, 'Popis', 2, 1, 0),
(3, 'product_1.jpg', 'Produkt-3', 980.00, 20, 816.67, 1, 13, 'Popis', 1, 2, 20),
(4, 'prislusenstvo_1.jpg', 'Príslušenstvo-4', 515.00, 20, 429.17, 0, 12, 'Popis', 2, 1, 0),
(5, 'product_2.jpg', 'Produkt-5', 405.00, 20, 337.5, 1, 3, 'Popis', 1, 2, 0),
(6, 'prislusenstvo_2.jpg', 'Príslušenstvo-6', 896.00, 20, 746.67, 0, 13, 'Popis', 2, 3, 0),
(7, 'product_3.jpg', 'Produkt-7', 363.00, 20, 302.5, 0, 5, 'Popis', 1, 3, 0),
(8, 'prislusenstvo_2.jpg', 'Príslušenstvo-8', 227.00, 20, 189.17, 0, 13, 'Popis', 2, 1, 0),
(9, 'product_2.jpg', 'Produkt-9', 764.00, 20, 636.67, 1, 6, 'Popis', 1, 2, 0),
(10, 'prislusenstvo_3.jpg', 'Príslušenstvo-10', 721.00, 20, 600.83, 0, 15, 'Popis', 2, 2, 20),
(11, 'product_1.jpg', 'Produkt-11', 906.00, 20, 755, 1, 3, 'Popis', 1, 1, 0),
(12, 'product_2.jpg', 'Produkt-12', 408.00, 20, 340, 1, 1, 'Popis', 1, 3, 0),
(13, 'product_1.jpg', 'Produkt-13', 397.00, 20, 330.83, 1, 0, 'Popis', 1, 2, 0),
(14, 'prislusenstvo_3.jpg', 'Príslušenstvo-14', 102.00, 20, 85, 1, 1, 'Popis', 2, 2, 20),
(15, 'product_3.jpg', 'Produkt-15', 527.00, 20, 439.17, 1, 8, 'Popis', 1, 1, 0),
(16, 'product_3.jpg', 'Produkt-16', 795.00, 20, 662.5, 1, 3, 'Popis', 1, 2, 20),
(17, 'prislusenstvo_3.jpg', 'Príslušenstvo-17', 658.00, 20, 548.33, 0, 2, 'Popis', 2, 2, 0),
(18, 'prislusenstvo_3.jpg', 'Príslušenstvo-18', 689.00, 20, 574.17, 0, 7, 'Popis', 2, 2, 0),
(19, 'product_1.jpg', 'Produkt-19', 140.00, 20, 116.67, 0, 5, 'Popis', 1, 2, 0),
(20, 'prislusenstvo_3.jpg', 'Príslušenstvo-20', 706.00, 20, 588.33, 1, 13, 'Popis', 2, 2, 20),
(21, 'prislusenstvo_3.jpg', 'Príslušenstvo-21', 213.00, 20, 177.5, 0, 10, 'Popis', 2, 3, 0),
(22, 'product_1.jpg', 'Produkt-22', 823.00, 20, 685.83, 0, 1, 'Popis', 1, 2, 0),
(23, 'prislusenstvo_3.jpg', 'Príslušenstvo-23', 975.00, 20, 812.5, 0, 4, 'Popis', 2, 3, 20),
(24, 'prislusenstvo_2.jpg', 'Príslušenstvo-24', 72.00, 20, 60, 1, 7, 'Popis', 2, 2, 0),
(25, 'product_2.jpg', 'Produkt-25', 0.00, 20, 0, 0, 9, 'Popis', 1, 1, 0),
(26, 'product_1.jpg', 'Produkt-26', 461.00, 20, 384.17, 1, 9, 'Popis', 1, 3, 20),
(27, 'product_3.jpg', 'Produkt-27', 268.00, 20, 223.33, 0, 4, 'Popis', 1, 3, 0),
(28, 'prislusenstvo_2.jpg', 'Príslušenstvo-28', 809.00, 20, 674.17, 1, 6, 'Popis', 2, 1, 20),
(29, 'prislusenstvo_1.jpg', 'Príslušenstvo-29', 753.00, 20, 627.5, 1, 8, 'Popis', 2, 2, 0),
(30, 'prislusenstvo_2.jpg', 'Príslušenstvo-30', 537.00, 20, 447.5, 1, 9, 'Popis', 2, 1, 0),
(31, 'prislusenstvo_2.jpg', 'Príslušenstvo-31', 600.00, 20, 500, 1, 8, 'Popis', 2, 2, 20),
(32, 'product_2.jpg', 'Produkt-32', 952.00, 20, 793.33, 0, 0, 'Popis', 1, 3, 0),
(33, 'prislusenstvo_3.jpg', 'Príslušenstvo-33', 651.00, 20, 542.5, 1, 1, 'Popis', 2, 3, 0),
(34, 'product_3.jpg', 'Produkt-34', 30.00, 20, 25, 0, 10, 'Popis', 1, 1, 0),
(35, 'prislusenstvo_3.jpg', 'Príslušenstvo-35', 537.00, 20, 447.5, 0, 7, 'Popis', 2, 3, 0),
(36, 'product_1.jpg', 'Produkt-36', 311.00, 20, 259.17, 1, 3, 'Popis', 1, 2, 0),
(37, 'prislusenstvo_2.jpg', 'Príslušenstvo-37', 140.00, 20, 116.67, 1, 11, 'Popis', 2, 3, 20),
(38, 'prislusenstvo_3.jpg', 'Príslušenstvo-38', 702.00, 20, 585, 1, 3, 'Popis', 2, 2, 0),
(39, 'prislusenstvo_1.jpg', 'Príslušenstvo-39', 122.00, 20, 101.67, 1, 6, 'Popis', 2, 1, 20),
(40, 'product_1.jpg', 'Produkt-40', 833.00, 20, 694.17, 0, 10, 'Popis', 1, 2, 0),
(41, 'product_3.jpg', 'Produkt-41', 955.00, 20, 795.83, 1, 2, 'Popis', 1, 3, 0),
(42, 'product_3.jpg', 'Produkt-42', 367.00, 20, 305.83, 1, 5, 'Popis', 1, 3, 20),
(43, 'prislusenstvo_1.jpg', 'Príslušenstvo-43', 605.00, 20, 504.17, 0, 8, 'Popis', 2, 2, 0),
(44, 'product_2.jpg', 'Produkt-44', 889.00, 20, 740.83, 1, 10, 'Popis', 1, 2, 20),
(45, 'product_2.jpg', 'Produkt-45', 314.00, 20, 261.67, 1, 9, 'Popis', 1, 1, 0),
(46, 'prislusenstvo_1.jpg', 'Príslušenstvo-46', 815.00, 20, 679.17, 0, 9, 'Popis', 2, 3, 0),
(47, 'prislusenstvo_1.jpg', 'Príslušenstvo-47', 914.00, 20, 761.67, 1, 10, 'Popis', 2, 1, 0),
(48, 'prislusenstvo_1.jpg', 'Príslušenstvo-48', 525.00, 20, 437.5, 1, 12, 'Popis', 2, 3, 0),
(49, 'product_3.jpg', 'Produkt-49', 705.00, 20, 587.5, 0, 0, 'Popis', 1, 3, 0),
(50, 'product_1.jpg', 'Produkt-50', 245.00, 20, 204.17, 1, 2, 'Popis', 1, 3, 0),
(51, 'product_2.jpg', 'Produkt-51', 62.00, 20, 51.67, 1, 3, 'Popis', 1, 1, 20),
(52, 'prislusenstvo_1.jpg', 'Príslušenstvo-52', 185.00, 20, 154.17, 0, 4, 'Popis', 2, 3, 0),
(53, 'prislusenstvo_1.jpg', 'Príslušenstvo-53', 86.00, 20, 71.67, 0, 5, 'Popis', 2, 1, 20),
(54, 'product_3.jpg', 'Produkt-54', 235.00, 20, 195.83, 1, 11, 'Popis', 1, 2, 0),
(55, 'prislusenstvo_2.jpg', 'Príslušenstvo-55', 357.00, 20, 297.5, 1, 10, 'Popis', 2, 3, 0),
(56, 'product_1.jpg', 'Produkt-56', 719.00, 20, 599.17, 1, 2, 'Popis', 1, 2, 0),
(57, 'product_2.jpg', 'Produkt-57', 75.00, 20, 62.5, 1, 11, 'Popis', 1, 1, 0),
(58, 'product_2.jpg', 'Produkt-58', 709.00, 20, 590.83, 1, 2, 'Popis', 1, 3, 0),
(59, 'product_1.jpg', 'Produkt-59', 948.00, 20, 790, 0, 12, 'Popis', 1, 3, 20),
(60, 'prislusenstvo_2.jpg', 'Príslušenstvo-60', 779.00, 20, 649.17, 1, 8, 'Popis', 2, 3, 0),
(61, 'product_3.jpg', 'Produkt-61', 49.00, 20, 40.83, 0, 0, 'Popis', 1, 3, 20),
(62, 'product_2.jpg', 'Produkt-62', 264.00, 20, 220, 1, 12, 'Popis', 1, 1, 0),
(63, 'prislusenstvo_2.jpg', 'Príslušenstvo-63', 383.00, 20, 319.17, 1, 3, 'Popis', 2, 2, 0),
(64, 'prislusenstvo_2.jpg', 'Príslušenstvo-64', 375.00, 20, 312.5, 1, 15, 'Popis', 2, 1, 0),
(65, 'prislusenstvo_1.jpg', 'Príslušenstvo-65', 768.00, 20, 640, 1, 12, 'Popis', 2, 2, 0),
(66, 'prislusenstvo_1.jpg', 'Príslušenstvo-66', 561.00, 20, 467.5, 1, 5, 'Popis', 2, 3, 0),
(67, 'prislusenstvo_2.jpg', 'Príslušenstvo-67', 972.00, 20, 810, 0, 11, 'Popis', 2, 3, 0),
(68, 'prislusenstvo_3.jpg', 'Príslušenstvo-68', 485.00, 20, 404.17, 0, 11, 'Popis', 2, 2, 0),
(69, 'product_1.jpg', 'Produkt-69', 377.00, 20, 314.17, 0, 3, 'Popis', 1, 1, 0),
(70, 'product_2.jpg', 'Produkt-70', 590.00, 20, 491.67, 0, 8, 'Popis', 1, 2, 0),
(71, 'prislusenstvo_2.jpg', 'Príslušenstvo-71', 122.00, 20, 101.67, 0, 2, 'Popis', 2, 2, 0),
(72, 'prislusenstvo_3.jpg', 'Príslušenstvo-72', 638.00, 20, 531.67, 1, 7, 'Popis', 2, 1, 0),
(73, 'prislusenstvo_2.jpg', 'Príslušenstvo-73', 579.00, 20, 482.5, 1, 13, 'Popis', 2, 2, 0),
(74, 'prislusenstvo_1.jpg', 'Príslušenstvo-74', 383.00, 20, 319.17, 1, 8, 'Popis', 2, 2, 0),
(75, 'prislusenstvo_1.jpg', 'Príslušenstvo-75', 859.00, 20, 715.83, 1, 0, 'Popis', 2, 3, 20),
(76, 'product_1.jpg', 'Produkt-76', 329.00, 20, 274.17, 0, 4, 'Popis', 1, 1, 0),
(77, 'prislusenstvo_3.jpg', 'Príslušenstvo-77', 219.00, 20, 182.5, 1, 2, 'Popis', 2, 2, 0),
(78, 'prislusenstvo_1.jpg', 'Príslušenstvo-78', 152.00, 20, 126.67, 0, 13, 'Popis', 2, 2, 0),
(79, 'product_2.jpg', 'Produkt-79', 184.00, 20, 153.33, 1, 7, 'Popis', 1, 3, 0),
(80, 'prislusenstvo_1.jpg', 'Príslušenstvo-80', 241.00, 20, 200.83, 1, 8, 'Popis', 2, 2, 0),
(81, 'prislusenstvo_2.jpg', 'Príslušenstvo-81', 212.00, 20, 176.67, 1, 9, 'Popis', 2, 1, 0),
(82, 'product_1.jpg', 'Produkt-82', 449.00, 20, 374.17, 0, 0, 'Popis', 1, 3, 0),
(83, 'prislusenstvo_3.jpg', 'Príslušenstvo-83', 834.00, 20, 695, 0, 11, 'Popis', 2, 3, 0),
(84, 'prislusenstvo_2.jpg', 'Príslušenstvo-84', 369.00, 20, 307.5, 1, 4, 'Popis', 2, 1, 0),
(85, 'product_3.jpg', 'Produkt-85', 763.00, 20, 635.83, 1, 4, 'Popis', 1, 1, 20),
(86, 'prislusenstvo_2.jpg', 'Príslušenstvo-86', 843.00, 20, 702.5, 1, 4, 'Popis', 2, 3, 0),
(87, 'product_3.jpg', 'Produkt-87', 976.00, 20, 813.33, 0, 5, 'Popis', 1, 1, 0),
(88, 'product_2.jpg', 'Produkt-88', 351.00, 20, 292.5, 1, 13, 'Popis', 1, 3, 0),
(89, 'product_3.jpg', 'Produkt-89', 602.00, 20, 501.67, 1, 10, 'Popis', 1, 3, 20),
(90, 'product_2.jpg', 'Produkt-90', 180.00, 20, 150, 0, 8, 'Popis', 1, 2, 20),
(91, 'product_2.jpg', 'Produkt-91', 946.00, 20, 788.33, 1, 6, 'Popis', 1, 3, 20),
(92, 'product_3.jpg', 'Produkt-92', 615.00, 20, 512.5, 1, 13, 'Popis', 1, 2, 0),
(93, 'product_1.jpg', 'Produkt-93', 637.00, 20, 530.83, 0, 14, 'Popis', 1, 3, 0),
(94, 'product_3.jpg', 'Produkt-94', 80.00, 20, 66.67, 1, 10, 'Popis', 1, 1, 0),
(95, 'prislusenstvo_2.jpg', 'Príslušenstvo-95', 863.00, 20, 719.17, 1, 4, 'Popis', 2, 3, 0),
(96, 'prislusenstvo_1.jpg', 'Príslušenstvo-96', 224.00, 20, 186.67, 0, 1, 'Popis', 2, 2, 0),
(97, 'product_3.jpg', 'Produkt-97', 496.00, 20, 413.33, 0, 3, 'Popis', 1, 2, 0),
(98, 'product_1.jpg', 'Produkt-98', 11.00, 20, 9, 0, 6, 'Materia:dsadsadsa\ndsadasdsa dsa;ds\n\ndsadsadsadsa', 1, 1, 0),
(99, 'product_1.jpg', 'Produkt-99', 84.00, 20, 70, 1, 10, 'Popis', 1, 3, 0),
(100, 'prislusenstvo_2.jpg', 'Príslušenstvo-100', 132.00, 20, 110, 1, 7, 'Popis', 2, 1, 0);

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
(1, 99, 86);

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
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `image` varchar(55) DEFAULT 'avatar.png',
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `image`, `first_name`, `last_name`, `email`, `password`, `type`) VALUES
(1, 'admin.jpg', 'Admin', 'Admin', 'admin@dia.sk', '$2y$10$.tSU76T5uTw40vRifEB1z.bmFCJkQuoNEUOch8O0zSHqUYeIsB3WO', 1),
(2, 'default.jpg', 'Uctovnik', 'Uctovnik', 'uctovnik@dia.sk', '$2y$10$hZrWOQVpCGJ8ETCCustTpOLDxcg4o4IzEaCtJiK/qXSD1pxHKnTmC', 2),
(3, 'default.jpg', 'Skladnik', 'Skladnik', 'skladnik@dia.sk', '$2y$10$gm5FRyHlQa9DDcHeMuUk9ORyOp1uvhjZsJNrcSs6mLjz21WY8K/TC', 3);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer_uid_index` (`id_customer_uid`) USING BTREE;

--
-- Indexy pre tabuľku `carts_products`
--
ALTER TABLE `carts_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cart_index` (`id_cart`),
  ADD KEY `id_product_index` (`id_product`);

--
-- Indexy pre tabuľku `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order_index` (`id_order`);

--
-- Indexy pre tabuľku `complaints_documents`
--
ALTER TABLE `complaints_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_complaint_index` (`id_complaint`);

--
-- Indexy pre tabuľku `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`);

--
-- Indexy pre tabuľku `customers_uids`
--
ALTER TABLE `customers_uids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer_index` (`id_customer`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_index` (`id_cart`),
  ADD KEY `invoice_index` (`id_invoice`),
  ADD KEY `customer_index` (`id_customer`),
  ADD KEY `type_index` (`type`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product_ac_index` (`id_product`),
  ADD KEY `id_product_accessory_index` (`id_product_accessory`);

--
-- Indexy pre tabuľku `products_discounts`
--
ALTER TABLE `products_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `products_gallery`
--
ALTER TABLE `products_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_gallery_id_product_index` (`id_product`),
  ADD KEY `products_gallery_id_gallery_index` (`id_gallery`) USING BTREE;

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `carts_products`
--
ALTER TABLE `carts_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pre tabuľku `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `complaints_documents`
--
ALTER TABLE `complaints_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pre tabuľku `customers_uids`
--
ALTER TABLE `customers_uids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `dia_messages`
--
ALTER TABLE `dia_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `dia_navbar`
--
ALTER TABLE `dia_navbar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `customer_uid_index` FOREIGN KEY (`id_customer_uid`) REFERENCES `customers_uids` (`id`);

--
-- Obmedzenie pre tabuľku `carts_products`
--
ALTER TABLE `carts_products`
  ADD CONSTRAINT `id_cart_index` FOREIGN KEY (`id_cart`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `id_product_index` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Obmedzenie pre tabuľku `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `id_order_index` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`);

--
-- Obmedzenie pre tabuľku `complaints_documents`
--
ALTER TABLE `complaints_documents`
  ADD CONSTRAINT `id_complaint_index` FOREIGN KEY (`id_complaint`) REFERENCES `complaints` (`id`);

--
-- Obmedzenie pre tabuľku `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `cart_index` FOREIGN KEY (`id_cart`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `type_index` FOREIGN KEY (`type`) REFERENCES `order_type` (`id`);

--
-- Obmedzenie pre tabuľku `products_accessories`
--
ALTER TABLE `products_accessories`
  ADD CONSTRAINT `id_product_ac_index` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `id_product_accessory_index` FOREIGN KEY (`id_product_accessory`) REFERENCES `products` (`id`);

--
-- Obmedzenie pre tabuľku `products_gallery`
--
ALTER TABLE `products_gallery`
  ADD CONSTRAINT `products_gallery_id_gallery_index` FOREIGN KEY (`id_gallery`) REFERENCES `gallery` (`id`),
  ADD CONSTRAINT `products_gallery_id_product_index` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
