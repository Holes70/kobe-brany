-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Sun 20.Feb 2022, 21:16
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
-- Databáza: `dia`
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
(1, 0, 1);

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
(1, 1, 1),
(2, 1, 3);

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

--
-- Sťahujem dáta pre tabuľku `complaints`
--

INSERT INTO `complaints` (`id`, `id_order`, `type`, `description`, `created_at`) VALUES
(1, 1, 2, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2022-02-16 08:43:50'),
(2, 2, 1, 'jjj', '2022-02-16 08:43:50'),
(3, 21312321, 1, '', '2022-02-11 11:00:00'),
(7, 96, 2, '', '2022-02-03 20:03:00'),
(8, 95, 1, 'ffacxzda', '0000-00-00 00:00:00');

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
(1, 'Meno_1', 'Priezvisko_1', 'zakaznik_1@gmail.com', 13102523, 2, '123455'),
(2, 'Meno_2', 'Priezvisko_2', 'zakaznik_2@gmail.com', 26527492, 2, '123455'),
(3, 'Meno_3', 'Priezvisko_3', 'zakaznik_3@gmail.com', 59002038, 3, '123455'),
(4, 'Meno_4', 'Priezvisko_4', 'zakaznik_4@gmail.com', 30765647, 3, '123455'),
(5, 'Meno_5', 'Priezvisko_5', 'zakaznik_5@gmail.com', 26107023, 2, '123455'),
(6, 'Meno_6', 'Priezvisko_6', 'zakaznik_6@gmail.com', 55617027, 2, '123455'),
(7, 'Meno_7', 'Priezvisko_7', 'zakaznik_7@gmail.com', 73821795, 2, '123455'),
(8, 'Meno_8', 'Priezvisko_8', 'zakaznik_8@gmail.com', 28961312, 2, '123455'),
(9, 'Meno_9', 'Priezvisko_9', 'zakaznik_9@gmail.com', 44170284, 1, '123455'),
(10, 'Meno_10', 'Priezvisko_10', 'zakaznik_10@gmail.com', 99530803, 2, '123455'),
(11, 'Meno_11', 'Priezvisko_11', 'zakaznik_11@gmail.com', 39444407, 3, '123455'),
(12, 'Meno_12', 'Priezvisko_12', 'zakaznik_12@gmail.com', 71518588, 1, '123455'),
(13, 'Meno_13', 'Priezvisko_13', 'zakaznik_13@gmail.com', 81691151, 1, '123455'),
(14, 'Meno_14', 'Priezvisko_14', 'zakaznik_14@gmail.com', 33728685, 2, '123455'),
(15, 'Meno_15', 'Priezvisko_15', 'zakaznik_15@gmail.com', 12466616, 1, '123455'),
(16, 'Meno_16', 'Priezvisko_16', 'zakaznik_16@gmail.com', 81052978, 1, '123455'),
(17, 'Meno_17', 'Priezvisko_17', 'zakaznik_17@gmail.com', 11903633, 2, '123455'),
(18, 'Meno_18', 'Priezvisko_18', 'zakaznik_18@gmail.com', 43991703, 1, '123455'),
(19, 'Meno_19', 'Priezvisko_19', 'zakaznik_19@gmail.com', 99733331, 2, '123455'),
(20, 'Meno_20', 'Priezvisko_20', 'zakaznik_20@gmail.com', 36481741, 1, '123455'),
(21, 'Meno_21', 'Priezvisko_21', 'zakaznik_21@gmail.com', 96048753, 3, '123455'),
(22, 'Meno_22', 'Priezvisko_22', 'zakaznik_22@gmail.com', 78271635, 3, '123455'),
(23, 'Meno_23', 'Priezvisko_23', 'zakaznik_23@gmail.com', 33061821, 2, '123455'),
(24, 'Meno_24', 'Priezvisko_24', 'zakaznik_24@gmail.com', 91521589, 3, '123455'),
(25, 'Meno_25', 'Priezvisko_25', 'zakaznik_25@gmail.com', 98992246, 3, '123455'),
(26, 'Meno_26', 'Priezvisko_26', 'zakaznik_26@gmail.com', 89801622, 1, '123455'),
(27, 'Meno_27', 'Priezvisko_27', 'zakaznik_27@gmail.com', 88398601, 2, '123455'),
(28, 'Meno_28', 'Priezvisko_28', 'zakaznik_28@gmail.com', 68542758, 1, '123455'),
(29, 'Meno_29', 'Priezvisko_29', 'zakaznik_29@gmail.com', 67587990, 1, '123455'),
(30, 'Meno_30', 'Priezvisko_30', 'zakaznik_30@gmail.com', 80214353, 3, '123455');

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
(2, 'dsadsa', 'dsadsadsa', 'dsadsadsadsa', 'dsadsadsa', '2022-02-10 17:46:25', 0, 0),
(9, 'dsadsadasdsa', 'admin@dia.sk', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'Aohjd asdasdasdasdas', '2022-02-14 12:37:07', 0, 0),
(10, 'admin@dia.sk', 'test@email.sk', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'dsadsadsadas', '2022-02-14 12:37:22', 1, 12),
(12, 'test@email.sk', 'admin@dia.sk', 'Ahoj', 'xxx', '2022-02-14 09:55:02', 0, 0),
(13, 'test@email.sk', 'admin@dia.sk', 'Ahoj', 'xxx', '2022-02-14 09:58:40', 0, 0),
(14, 'admin@dia.sk', 'test2@gmail.com', 'Test2', 'Test2', '2022-02-14 10:14:35', 1, 15),
(15, 'test2@gmail.com', 'admin@dia.sk', 'Test2', 'xxx', '2022-02-14 10:00:33', 0, 0),
(16, 'admin@dia.sk', 'XXX', 'XXX', 'XXX', '2022-02-14 10:14:07', 1, 17),
(17, 'XXX', 'admin@dia.sk', 'XXX', 'jjj', '2022-02-14 10:01:39', 0, 0),
(18, 'admin@dia.sk', 'XXX', 'XXX', 'XXX', '2022-02-14 10:13:37', 1, 19),
(19, 'XXX', 'admin@dia.sk', 'XXX', 'Ahojtewadasd dasdsadas', '2022-02-14 10:03:13', 0, 0),
(20, 'admin@dia.sk', 'xxx', 'xxx', 'xx', '2022-02-14 10:38:56', 1, 21),
(21, 'xxx', 'admin@dia.sk', 'xxx', 'Ano', '2022-02-14 10:38:56', 0, 0);

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
(2, 0, 'Objednávky', 'objednavky', 'Objednávky', 'donate', 5, 1),
(3, 2, 'Všetky', 'objednavky-vsetky', 'Všetky objednávky', '', 41, 1),
(4, 2, 'Nové', 'objednavky-nove', 'Nové objednávky', '', 42, 1),
(5, 2, 'Schválené', 'objednavky-schvalene', 'Schválené', '', 43, 1),
(7, 0, 'Reklamácie', 'reklamacie', 'Reklamácie', 'sync', 6, 1),
(8, 0, 'Faktúry', 'faktury', 'Faktúry', 'file-alt', 5, 1),
(9, 0, 'Výroba', 'vyroba', 'Výroba', 'tools', 10, 1),
(10, 9, 'Návrh a odhad', 'vyroba-navrh', 'Návrh výroby', '', 11, 1),
(11, 9, 'Rozpracované', 'vyroba-rozpracovane', 'Rozpracované', '', 12, 1),
(12, 9, 'Pozastavené', 'vyroba-pozastavene', 'Pozastavené', '', 13, 1),
(13, 9, 'Na odovzdanie', 'vyroba-na-odovzdanie', '', '', 14, 1),
(209, 0, 'Produkty', 'produkty', '', 'archive', 2, 1),
(211, 0, 'Zákazníci', 'zakaznici', '', 'users', 3, 1),
(212, 0, 'Domov', 'home', NULL, 'home', 1, 1),
(213, 2, 'Zaplatené', 'objednavky-zaplatene', NULL, NULL, 44, 1),
(214, 2, 'Odovzdané', 'objednavky-odovzdane', NULL, NULL, 45, 1),
(215, 8, 'Vystavené', 'faktury-vystavene', '', '', 51, 1),
(216, 8, 'Zaplatené', 'faktury-zaplatene', '', '', 52, 1),
(217, 0, 'Príslušenstvo', 'male-produkty', '', 'th-large', 2, 1),
(218, 0, 'Košíky', 'kosiky', '', 'shopping-cart', 4, 1);

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
(5, 'orders', '{\"serial_number\":{\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Číslo\"},\"first_name\":{\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Meno\",\"required\":true},\"last_name\":{\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Priezvisko\",\"required\":true},\"phone\":{\"type\":\"number\",\"step\":1,\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Telefón\",\"required\":true},\"email\":{\"type\":\"email\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"E-mail\",\"required\":true},\"type\":{\"type\":\"radio\",\"default_value\":1,\"radio\":{\"1\":\"Nová\",\"2\":\"Schválená\",\"3\":\"Zaplatená\",\"4\":\"Odovzdaná\"},\"show_in_table\":false,\"show_in_form\":true,\"name_in_table\":\"Typ\"},\"id_customer\":{\"type\":\"lookup\",\"lookup_icon\":\"user\",\"lookup_table\":\"customers\",\"lookup_table_col\":\"id_customer\",\"lookup_url\":\"zakaznici\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Zákazník\",\"lookup_columns\":{\"1\":\"first_name\", \"2\":\"last_name\"},\"lookup_empty_table\":\"<strong style=\'color:#dbdbdb\'>Neregistrovaný</strong>\"},\"id_cart\":{\"type\":\"lookup\",\"lookup_url_type\":\"idcart\",\"lookup_table\":\"carts\",\"lookup_icon\":\"shopping-cart\",\"lookup_table_col\":\"id_cart\",\"lookup_url\":\"kosik\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Košík\",\"lookup_empty_table\":\"<strong style=\'color:#dbdbdb\'>Prázdny</strong>\"},\"id_invoice\":{\"type\":\"lookup\",\"lookup_table\":\"invoices\",\"lookup_icon\":\"file-alt\",\"lookup_columns\":{\"1\":\"number\", \"2\":\"price\"},\"lookup_table_col\":\"id_invoice\",\"lookup_table_empty\":\"Nie je vystavená\",\"lookup_url\":\"faktury\",\"lookup_table_empty_action\":\"vystavit_fakturu?id_order=%id%\",\"lookup_table_empty_text\":\"Vystaviť faktúru\",\"lookup_url_type\":\"id_form\",\"show_in_table\":true,\"show_in_form\":true,\"name_in_table\":\"Faktúra\",\"lookup_empty_table\":\"<strong style=\'color:#dbdbdb\'>x</strong>\",\"hide_in_new_form\":true}}'),
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
(1, 1001, '', '', 0, NULL, 4, 5, 3, 1),
(2, 1002, '', '', 0, NULL, 1, 5, 2, NULL),
(3, 1003, '', '', 0, NULL, 3, 5, 5, 2),
(4, 1004, '', '', 0, NULL, 1, 1, 3, 0),
(5, 1005, '', '', 0, NULL, 1, 5, 3, 3),
(6, 1006, '', '', 0, NULL, 1, 2, 5, 0),
(7, 1007, '', '', 0, NULL, 2, 4, 1, 0),
(8, 1008, '', '', 0, NULL, 3, 1, 1, 0),
(9, 1009, '', '', 0, NULL, 3, 5, 4, 0),
(10, 1010, '', '', 0, NULL, 2, 5, 5, 0),
(11, 1011, '', '', 0, NULL, 3, 5, 2, 0),
(12, 1012, '', '', 0, NULL, 2, 4, 5, 0),
(13, 1013, '', '', 0, NULL, 2, 1, 5, 0),
(14, 1014, '', '', 0, NULL, 3, 1, 3, 0),
(15, 1015, '', '', 0, NULL, 3, 4, 4, 0),
(16, 1016, '', '', 0, NULL, 2, 1, 2, 0),
(17, 1017, '', '', 0, NULL, 3, 2, 5, 0),
(18, 1018, '', '', 0, NULL, 2, 5, 1, 0),
(19, 1019, '', '', 0, NULL, 1, 1, 1, 0),
(20, 1020, '', '', 0, NULL, 3, 4, 1, 0),
(21, 1021, '', '', 0, NULL, 2, 4, 1, 0),
(22, 1022, '', '', 0, NULL, 1, 1, 5, 0),
(23, 1023, '', '', 0, NULL, 1, 5, 5, 0),
(24, 1024, '', '', 0, NULL, 1, 3, 1, 0),
(25, 1025, '', '', 0, NULL, 1, 4, 5, 0),
(26, 1026, '', '', 0, NULL, 2, 5, 1, 0),
(27, 1027, '', '', 0, NULL, 3, 2, 5, 0),
(28, 1028, '', '', 0, NULL, 2, 5, 4, 0),
(29, 1029, '', '', 0, NULL, 3, 3, 5, 0),
(30, 1030, '', '', 0, NULL, 1, 5, 1, 0),
(31, 1031, '', '', 0, NULL, 2, 1, 3, 0),
(32, 1032, '', '', 0, NULL, 2, 2, 1, 0),
(33, 1033, '', '', 0, NULL, 3, 1, 5, 0),
(34, 1034, '', '', 0, NULL, 1, 1, 5, 0),
(35, 1035, '', '', 0, NULL, 1, 4, 3, 0),
(36, 1036, '', '', 0, NULL, 1, 5, 4, 0),
(37, 1037, '', '', 0, NULL, 2, 4, 1, 0),
(38, 1038, '', '', 0, NULL, 2, 2, 2, 0),
(39, 1039, '', '', 0, NULL, 2, 2, 1, 0),
(40, 1040, '', '', 0, NULL, 3, 2, 1, 0),
(41, 1041, '', '', 0, NULL, 2, 1, 3, 0),
(42, 1042, '', '', 0, NULL, 3, 3, 3, 0),
(43, 1043, '', '', 0, NULL, 1, 5, 1, 0),
(44, 1044, '', '', 0, NULL, 3, 1, 2, 0),
(45, 1045, '', '', 0, NULL, 3, 1, 5, 0),
(46, 1046, '', '', 0, NULL, 3, 1, 4, 0),
(47, 1047, '', '', 0, NULL, 1, 5, 3, 0),
(48, 1048, '', '', 0, NULL, 1, 4, 3, 0),
(49, 1049, '', '', 0, NULL, 3, 5, 3, 0),
(50, 1050, '', '', 0, NULL, 1, 5, 2, 0),
(51, 1051, '', '', 0, NULL, 2, 3, 5, 0),
(52, 1052, '', '', 0, NULL, 1, 1, 4, 0),
(53, 1053, '', '', 0, NULL, 1, 3, 3, 0),
(54, 1054, '', '', 0, NULL, 1, 2, 1, 0),
(55, 1055, '', '', 0, NULL, 3, 5, 1, 0),
(56, 1056, '', '', 0, NULL, 1, 4, 4, 0),
(57, 1057, '', '', 0, NULL, 3, 2, 1, 0),
(58, 1058, '', '', 0, NULL, 2, 3, 3, 0),
(59, 1059, '', '', 0, NULL, 2, 1, 2, 0),
(60, 1060, '', '', 0, NULL, 3, 3, 5, 0),
(61, 1061, '', '', 0, NULL, 2, 3, 2, 0),
(62, 1062, '', '', 0, NULL, 2, 2, 1, 0),
(63, 1063, '', '', 0, NULL, 3, 2, 2, 0),
(64, 1064, '', '', 0, NULL, 2, 5, 4, 0),
(65, 1065, '', '', 0, NULL, 3, 3, 5, 0),
(66, 1066, '', '', 0, NULL, 1, 1, 3, 0),
(67, 1067, '', '', 0, NULL, 1, 2, 2, 0),
(68, 1068, '', '', 0, NULL, 3, 5, 4, 0),
(69, 1069, '', '', 0, NULL, 3, 3, 5, 0),
(70, 1070, '', '', 0, NULL, 3, 1, 5, 0),
(71, 1071, '', '', 0, NULL, 2, 4, 4, 0),
(72, 1072, '', '', 0, NULL, 1, 5, 1, 0),
(73, 1073, '', '', 0, NULL, 1, 5, 1, 0),
(74, 1074, '', '', 0, NULL, 2, 4, 1, 0),
(75, 1075, '', '', 0, NULL, 3, 1, 2, 0),
(76, 1076, '', '', 0, NULL, 3, 5, 5, 0),
(77, 1077, '', '', 0, NULL, 2, 5, 5, 0),
(78, 1078, '', '', 0, NULL, 2, 4, 1, 0),
(79, 1079, '', '', 0, NULL, 3, 1, 5, 0),
(80, 1080, '', '', 0, NULL, 1, 2, 1, 0),
(81, 1081, '', '', 0, NULL, 2, 2, 1, 0),
(82, 1082, '', '', 0, NULL, 1, 3, 5, 0),
(83, 1083, '', '', 0, NULL, 3, 3, 5, 0),
(84, 1084, '', '', 0, NULL, 2, 2, 2, 0),
(85, 1085, '', '', 0, NULL, 2, 5, 2, 0),
(86, 1086, '', '', 0, NULL, 1, 3, 5, 0),
(87, 1087, '', '', 0, NULL, 1, 3, 1, 0),
(88, 1088, '', '', 0, NULL, 1, 2, 3, 0),
(89, 1089, '', '', 0, NULL, 2, 1, 1, 0),
(90, 1090, '', '', 0, NULL, 3, 1, 3, 0),
(91, 1091, '', '', 0, NULL, 1, 3, 5, 0),
(92, 1092, '', '', 0, NULL, 2, 1, 5, 0),
(93, 1093, '', '', 0, NULL, 1, 1, 2, 0),
(94, 1094, '', '', 0, NULL, 2, 3, 5, 0),
(95, 1095, '', '', 0, NULL, 1, 3, 5, 0),
(96, 1096, '', '', 0, NULL, 1, 2, 3, 0),
(97, 1097, '', '', 0, NULL, 3, 2, 5, 0),
(98, 1098, '', '', 0, NULL, 1, 4, 4, 0),
(99, 1099, '', '', 0, NULL, 1, 4, 5, 0),
(100, 9999, 'xxxx', 'dasdsadsa', 515154, 'xxx@email.sk', 1, 0, 0, NULL);

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
(1, 'product_3.png', 'Product_1', 107.00, 0, 7, 'Popis', 1),
(2, 'product_1.png', 'dsadsa', 858.00, 1, 0, 'dsadxcx', 2),
(3, 'product_1.png', 'Product_3', 102.00, 1, 14, 'Popis', 2),
(4, 'product_3.png', 'Product_4', 375.00, 0, 8, 'Popis', 2),
(5, 'product_2.png', 'Product_5', 944.00, 0, 4, 'Popis', 2),
(6, 'product_3.png', 'Product_6', 511.00, 1, 4, 'Popis', 2),
(7, 'product_1.png', 'Product_7', 523.00, 0, 0, 'Popis', 2),
(8, 'product_3.png', 'Product_8', 360.00, 1, 15, 'Popis', 1),
(9, 'product_1.png', 'Product_9', 435.00, 0, 14, 'Popis', 1),
(10, 'product_2.png', 'Product_10', 434.00, 0, 3, 'Popis', 2),
(11, 'product_1.png', 'Product_11', 676.00, 1, 13, 'Popis', 2),
(12, 'product_2.png', 'Product_12', 862.00, 1, 10, 'Popis', 2),
(13, 'product_2.png', 'Product_13', 537.00, 0, 8, 'Popis', 2),
(14, 'product_1.png', 'Product_14', 775.00, 1, 2, 'Popis', 2),
(15, 'product_1.png', 'Product_15', 732.00, 1, 10, 'Popis', 2),
(16, 'product_2.png', 'Product_16', 58.00, 0, 5, 'Popis', 1),
(17, 'product_1.png', 'Product_17', 194.00, 1, 13, 'Popis', 1),
(18, 'product_2.png', 'Product_18', 675.00, 1, 11, 'Popis', 2),
(19, 'product_2.png', 'Product_19', 439.00, 1, 13, 'Popis', 2),
(20, 'product_2.png', 'Product_20', 247.00, 1, 7, 'Popis', 1),
(21, 'product_3.png', 'Product_21', 417.00, 0, 0, 'Popis', 2),
(22, 'product_2.png', 'Product_22', 214.00, 1, 7, 'Popis', 2),
(23, 'product_3.png', 'Product_23', 496.00, 1, 9, 'Popis', 2),
(24, 'product_2.png', 'Product_24', 856.00, 1, 6, 'Popis', 1),
(25, 'product_1.png', 'Product_25', 940.00, 1, 11, 'Popis', 2),
(26, 'product_3.png', 'Product_26', 902.00, 1, 8, 'Popis', 2),
(27, 'product_3.png', 'Product_27', 778.00, 0, 6, 'Popis', 2),
(28, 'product_2.png', 'Product_28', 648.00, 0, 10, 'Popis', 2),
(29, 'product_2.png', 'Product_29', 28.00, 1, 11, 'Popis', 1),
(30, 'product_3.png', 'Product_30', 69.00, 1, 12, 'Popis', 2),
(31, 'product_1.png', 'Product_31', 23.00, 1, 14, 'Popis', 2),
(32, 'product_1.png', 'Product_32', 655.00, 0, 10, 'Popis', 2),
(33, 'product_2.png', 'Product_33', 180.00, 1, 13, 'Popis', 1),
(34, 'product_2.png', 'Product_34', 349.00, 1, 2, 'Popis', 1),
(35, 'product_2.png', 'Product_35', 726.00, 1, 7, 'Popis', 2),
(36, 'product_2.png', 'Product_36', 14.00, 0, 13, 'Popis', 1),
(37, 'product_3.png', 'Product_37', 827.00, 0, 12, 'Popis', 2),
(38, 'product_2.png', 'Product_38', 871.00, 0, 2, 'Popis', 2),
(39, 'product_3.png', 'Product_39', 249.00, 0, 1, 'Popis', 2),
(40, 'product_2.png', 'Product_40', 993.00, 0, 3, 'Popis', 1),
(41, 'product_1.png', 'Product_41', 594.00, 0, 7, 'Popis', 1),
(42, 'product_1.png', 'Product_42', 518.00, 0, 6, 'Popis', 1),
(43, 'product_1.png', 'Product_43', 823.00, 1, 15, 'Popis', 2),
(44, 'product_2.png', 'Product_44', 56.00, 1, 0, 'Popis', 2),
(45, 'product_3.png', 'Product_45', 743.00, 0, 11, 'Popis', 1),
(46, 'product_1.png', 'Product_46', 655.00, 0, 14, 'Popis', 2),
(47, 'product_2.png', 'Product_47', 580.00, 0, 3, 'Popis', 1),
(48, 'product_1.png', 'Product_48', 237.00, 0, 7, 'Popis', 2),
(49, 'product_3.png', 'Product_49', 942.00, 0, 1, 'Popis', 2),
(50, 'product_2.png', 'Product_50', 844.00, 1, 0, 'Popis', 1),
(51, 'product_1.png', 'Product_51', 674.00, 0, 1, 'Popis', 2),
(52, 'product_1.png', 'Product_52', 920.00, 1, 5, 'Popis', 2),
(53, 'product_1.png', 'Product_53', 648.00, 1, 2, 'Popis', 1),
(54, 'product_2.png', 'Product_54', 436.00, 0, 0, 'Popis', 2),
(55, 'product_1.png', 'Product_55', 56.00, 1, 6, 'Popis', 2),
(56, 'product_1.png', 'Product_56', 319.00, 0, 2, 'Popis', 1),
(57, 'product_3.png', 'Product_57', 742.00, 0, 5, 'Popis', 1),
(58, 'product_2.png', 'Product_58', 317.00, 1, 4, 'Popis', 1),
(59, 'product_1.png', 'Product_59', 589.00, 0, 12, 'Popis', 1),
(60, 'product_2.png', 'Product_60', 267.00, 1, 0, 'Popis', 1),
(61, 'product_1.png', 'Product_61', 98.00, 1, 15, 'Popis', 2),
(62, 'product_3.png', 'Product_62', 201.00, 1, 14, 'Popis', 2),
(63, 'product_3.png', 'Product_63', 328.00, 1, 8, 'Popis', 2),
(64, 'product_2.png', 'Product_64', 642.00, 0, 0, 'Popis', 2),
(65, 'product_2.png', 'Product_65', 719.00, 0, 3, 'Popis', 1),
(66, 'product_2.png', 'Product_66', 996.00, 1, 6, 'Popis', 1),
(67, 'product_1.png', 'Product_67', 859.00, 1, 12, 'Popis', 1),
(68, 'product_1.png', 'Product_68', 799.00, 1, 0, 'Popis', 1),
(69, 'product_3.png', 'Product_69', 690.00, 1, 4, 'Popis', 1),
(70, 'product_1.png', 'Product_70', 828.00, 1, 1, 'Popis', 1),
(71, 'product_2.png', 'Product_71', 776.00, 0, 1, 'Popis', 1),
(72, 'product_3.png', 'Product_72', 601.00, 0, 13, 'Popis', 1),
(73, 'product_1.png', 'Product_73', 907.00, 1, 8, 'Popis', 2),
(74, 'product_1.png', 'Product_74', 686.00, 1, 6, 'Popis', 2),
(75, 'product_3.png', 'Product_75', 211.00, 1, 13, 'Popis', 2),
(76, 'product_2.png', 'Product_76', 451.00, 1, 13, 'Popis', 1),
(77, 'product_1.png', 'Product_77', 260.00, 0, 12, 'Popis', 2),
(78, 'product_3.png', 'Product_78', 631.00, 1, 4, 'Popis', 1),
(79, 'product_2.png', 'Product_79', 522.00, 1, 9, 'Popis', 1),
(80, 'product_1.png', 'Product_80', 680.00, 1, 1, 'Popis', 2),
(81, 'product_1.png', 'Product_81', 180.00, 1, 5, 'Popis', 1),
(82, 'product_3.png', 'Product_82', 869.00, 1, 4, 'Popis', 2),
(83, 'product_3.png', 'Product_83', 281.00, 0, 9, 'Popis', 2),
(84, 'product_3.png', 'Product_84', 859.00, 1, 2, 'Popis', 1),
(85, 'product_1.png', 'Product_85', 293.00, 0, 7, 'Popis', 1),
(86, 'product_1.png', 'Product_86', 860.00, 0, 14, 'Popis', 2),
(87, 'product_2.png', 'Product_87', 623.00, 0, 11, 'Popis', 2),
(88, 'product_3.png', 'Product_88', 223.00, 1, 13, 'Popis', 2),
(89, 'product_1.png', 'Product_89', 522.00, 0, 5, 'Popis', 1),
(90, 'product_2.png', 'Product_90', 451.00, 1, 10, 'Popis', 2),
(91, 'product_3.png', 'Product_91', 369.00, 1, 1, 'Popis', 2),
(92, 'product_3.png', 'Product_92', 691.00, 0, 14, 'Popis', 2),
(93, 'product_3.png', 'Product_93', 36.00, 0, 2, 'Popis', 1),
(94, 'product_1.png', 'Product_94', 181.00, 1, 9, 'Popis', 1),
(95, 'product_2.png', 'Product_95', 416.00, 0, 3, 'Popis', 2),
(96, 'product_1.png', 'Product_96', 812.00, 1, 0, 'Popis', 1),
(97, 'product_1.png', 'Product_97', 643.00, 1, 2, 'Popis', 2),
(98, 'product_3.png', 'Product_98', 155.00, 1, 6, 'Popis', 1),
(99, 'product_3.png', 'Product_99', 974.00, 0, 11, 'Popis', 1),
(100, 'product_1.png', 'Product_100', 839.00, 0, 5, 'Popis', 1),
(101, 'wallpaper.jpeg', 'gvbj', 5.00, 0, 1, '', 2),
(105, 'product_1.png', 'xxx', 12.00, 1, 1, '', 1);

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
(1, 25, 73),
(2, 13, 70),
(3, 13, 67),
(4, 21, 21),
(5, 21, 86),
(6, 22, 19),
(7, 30, 6),
(8, 18, 55),
(9, 18, 84),
(10, 6, 35),
(11, 3, 27),
(12, 20, 48),
(13, 3, 43),
(14, 14, 98),
(17, 13, 48),
(18, 12, 14),
(19, 27, 14),
(20, 26, 7),
(21, 16, 31),
(22, 21, 5),
(23, 5, 40),
(24, 14, 61),
(25, 8, 51),
(26, 12, 97),
(28, 19, 13),
(29, 30, 38),
(30, 4, 40),
(31, 3, 31),
(32, 12, 89),
(33, 4, 50),
(34, 14, 5),
(35, 20, 69),
(36, 8, 60),
(37, 14, 59),
(38, 17, 80),
(39, 23, 56),
(40, 13, 89),
(41, 8, 58),
(43, 8, 59),
(44, 6, 26),
(45, 18, 93),
(46, 22, 18),
(47, 10, 78),
(48, 27, 64),
(49, 16, 26),
(50, 29, 99),
(51, 6, 90),
(52, 5, 87),
(53, 17, 67),
(54, 7, 23),
(55, 30, 4),
(56, 25, 13),
(57, 13, 55),
(58, 27, 36),
(59, 12, 26),
(60, 25, 51),
(61, 8, 2),
(62, 11, 17),
(63, 18, 68),
(64, 18, 48),
(66, 14, 91),
(67, 28, 13),
(68, 7, 31),
(69, 24, 5),
(70, 20, 42),
(71, 27, 63),
(72, 8, 37),
(73, 13, 15),
(74, 26, 17),
(75, 30, 76),
(76, 17, 26),
(77, 13, 27),
(78, 25, 66),
(79, 13, 52),
(80, 27, 87),
(81, 24, 93),
(82, 5, 87),
(83, 15, 11),
(84, 13, 32),
(85, 5, 75),
(86, 3, 89),
(87, 25, 86),
(88, 20, 31),
(89, 20, 51),
(90, 24, 10),
(91, 21, 8),
(92, 23, 82),
(93, 11, 86),
(94, 30, 86),
(95, 22, 41),
(96, 3, 27),
(97, 16, 49),
(98, 4, 79),
(99, 30, 40),
(100, 26, 7),
(107, 9, 4),
(108, 9, 1),
(109, 9, 7),
(110, 9, 10),
(111, 9, 11),
(112, 9, 12),
(113, 9, 14),
(114, 9, 13),
(115, 9, 15),
(116, 9, 18),
(117, 9, 28);

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

--
-- Sťahujem dáta pre tabuľku `products_gallery`
--

INSERT INTO `products_gallery` (`id`, `id_product`, `id_gallery`) VALUES
(1, 33, 58),
(2, 36, 69),
(3, 32, 94),
(4, 38, 7),
(5, 41, 83),
(6, 19, 52),
(7, 50, 35),
(8, 45, 77),
(9, 12, 71),
(10, 41, 37),
(11, 39, 91),
(12, 44, 20),
(13, 41, 59),
(14, 4, 24),
(15, 7, 37),
(16, 37, 3),
(17, 50, 58),
(18, 47, 95),
(19, 12, 6),
(20, 20, 38),
(21, 30, 92),
(22, 36, 87),
(23, 10, 45),
(24, 41, 26),
(25, 1, 34),
(26, 8, 10),
(27, 40, 69),
(28, 17, 41),
(29, 44, 60),
(30, 23, 88),
(31, 26, 36),
(32, 1, 23),
(34, 1, 94),
(35, 38, 50),
(36, 21, 44),
(37, 17, 61),
(38, 8, 48),
(39, 11, 8),
(40, 25, 86),
(41, 18, 94),
(42, 44, 91),
(43, 12, 34),
(44, 15, 72),
(45, 37, 57),
(46, 15, 60),
(47, 38, 9),
(48, 42, 1),
(49, 36, 10),
(50, 8, 89),
(51, 32, 89),
(52, 20, 85),
(53, 26, 78),
(54, 20, 75),
(55, 29, 30),
(56, 28, 37),
(57, 9, 83),
(58, 43, 30),
(59, 34, 33),
(60, 7, 91),
(61, 42, 1),
(62, 29, 43),
(63, 10, 81),
(64, 20, 28),
(65, 2, 89),
(66, 17, 16),
(67, 4, 5),
(68, 46, 11),
(69, 30, 32),
(70, 8, 61),
(71, 33, 78),
(72, 37, 68),
(73, 4, 48),
(74, 17, 76),
(75, 5, 37),
(76, 3, 6),
(77, 45, 54),
(78, 4, 59),
(79, 27, 86),
(80, 46, 36),
(81, 30, 76),
(82, 10, 80),
(83, 45, 89),
(84, 8, 3),
(85, 38, 67),
(86, 27, 8),
(87, 36, 35),
(88, 9, 45),
(89, 19, 86),
(90, 30, 34),
(91, 19, 2),
(92, 7, 34),
(93, 24, 87),
(94, 24, 77),
(95, 39, 59),
(96, 31, 2),
(97, 11, 4),
(98, 18, 9),
(99, 44, 33),
(100, 9, 100),
(101, 9, 101),
(102, 2, 102),
(105, 24, 105),
(106, 1, 106);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pre tabuľku `customers_uids`
--
ALTER TABLE `customers_uids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `dia_messages`
--
ALTER TABLE `dia_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pre tabuľku `order_type`
--
ALTER TABLE `order_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT pre tabuľku `products_accessories`
--
ALTER TABLE `products_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT pre tabuľku `products_discounts`
--
ALTER TABLE `products_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `products_gallery`
--
ALTER TABLE `products_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

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
