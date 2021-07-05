-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: St 25.Nov 2020, 21:37
-- Verzia serveru: 10.4.11-MariaDB
-- Verzia PHP: 7.4.4

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
(3, 'Kosice', 'Hlavna', 77, 95211);

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
-- Štruktúra tabuľky pre tabuľku `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `id_product`, `count`) VALUES
(1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `products`
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
-- Sťahujem dáta pre tabuľku `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `type_1`, `description`) VALUES
(1, 'Asus 500', 1500, 'asus.png', 1, 'Počítač Intel Core i7 7700 Kaby Lake, Intel H110, RAM 16GB DDR4, NVIDIA GeForce GTX 1080 8GB, SSD 256GB + HDD 1TB 7200 otáčok, DVD, GLAN, WiFi 802.11ac, Bluetooth 4.1, DVI, HDMI, DisplayPort, USB 3.0, USB 3.1 , čítačka kariet, 500W, CZ/SK klávesnica, myš, Windows 10 Home 64-bit'),
(2, 'Acer Predator Orion 5000', 1200, 'acer.png', 1, 'Herný PC Intel Core i7 9700 Coffee Lake 4.7 GHz, NVIDIA GeForce RTX 2060 6 GB, RAM 16GB DDR4, SSD 512GB+ HDD 2TB, DVD, WiFi, typ skrine: Big Tower, Windows 10'),
(3, 'Alza GameBox Ryzen GTX165', 889, 'gamebox.png', 1, 'Herný PC AMD Ryzen 5 2600 3.9 GHz, NVIDIA GeForce GTX 1650 Super 4 GB, RAM 16GB DDR4, SSD 1000GB, bez mechaniky, WiFi, DVI, HDMI a DisplayPort, 5×USB 3.2, 2×USB 2.0, typ skrine: Midi Tower, Windows 10 Home'),
(5, 'Lenovo Gaming L340-17IRH ', 500, 'lenovo.png', 2, 'Herný notebook – Intel Core i5 9300HF Coffee Lake, 17.3\" IPS antireflexný 1920 × 1080, RAM 8GB DDR4, NVIDIA GeForce GTX 1650 4GB, SSD 512GB, numerická klávesnica, podsvietená klávesnica, webkamera, USB 3.2 Gen 1, USB-C, WiFi 5, 45 Wh batéria, Windows 10 Home 81LL00F6CK'),
(7, 'AMD RYZEN 5 3600', 190, 'amd.jpg', 3, 'Procesor 6-jadrový, 12 vláken, 3.6GHz (TDP 65W), Boost 4.2 GHz, 32MB L3 cache, socket AMD AM4, Matisse, box chladič, Wraith Stealth\r\n'),
(8, 'Intel Core i9-9900K', 349, 'intel.jpg', 3, 'Procesor 8-jadrový, 16 vláken, 3.6GHz (TDP 95W), Turboboost 5GHz, 16MB L3 cache, Intel UHD Graphics 630 1200MHz, socket Intel 1151, Coffee Lake refresh, bez chladiča, iba chipset Intel radu 3xx'),
(9, 'HyperX 16GB KIT DDR4 3200', 85, 'ram.jpg', 3, 'Operačná pamäť 2x8GB, PC4-25600, CL16-18-18, napětí 1.35 V, pasivní chladič a XMP 2.0'),
(10, 'Asus Zenbook 15 UX533FTC-', 1599, 'nt.jpg', 2, 'Ultrabook – Intel Core i7 10510U Comet Lake, 15.6\" IPS antireflexný 1920 × 1080, RAM 16GB LPDDR3L-SDRAM, NVIDIA GeForce GTX 1650 Max-Q 4GB, SSD 1000GB, numerická klávesnica, podsvietená klávesnica, webkamera, USB-C, WiFi 5, 71 Wh batéria, Windows 10 Pro UX533FTC-A8185R'),
(11, 'Asus ROG Strix SCAR17 G73', 2579, 'ImgW.jpg', 2, 'Herný notebook – Intel Core i7 10875H Comet Lake, 17.3\" IPS antireflexný 1920 × 1080 300Hz, RAM 32GB DDR4, NVIDIA GeForce RTX 2070 Super 8GB, SSD 1000GB, podsvietená klávesnica, USB 3.2 Gen 1, USB-C, WiFi 5, Windows 10 Home G732LWS-HG019T'),
(12, 'ASUS Zenbook 14 UX425JA-B', 899, 'ImgW (1).jpg', 2, 'Ultrabook – Intel Core i5 1035G1 Ice Lake, 14\" IPS antireflexný 1920 × 1080, RAM 8GB LPDDR4X, Intel UHD Graphics, SSD 512GB, podsvietená klávesnica, webkamera, USB 3.2 Gen 1, USB-C, WiFi 6, 3526 mAh batéria, Windows 10 Home'),
(13, 'Acer Nitro 5 Obsidian Bla', 1145, 'ImgW (2).jpg', 2, 'Herný notebook – Intel Core i7 9750H Coffee Lake, 15.6\" IPS matný 1920 × 1080 120Hz, RAM 16GB DDR4, NVIDIA GeForce GTX 1660 Ti 6GB, SSD 1000GB, numerická klávesnica, podsvietená klávesnica, webkamera, USB-C, WiFi 6, 55 Wh batéria, Windows 10 Home (AN515-54-7386)');

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
(1, 8, 2, 1, 1, 100),
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
-- Štruktúra tabuľky pre tabuľku `users`
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
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `id_address`, `first_name`, `last_name`, `email`, `phone_number`, `password`) VALUES
(1, 1, 'Patrik', 'Kubran', 'xxxx@email.sk', '094231231', 'Heslo'),
(2, 3, 'Robert', 'Haas', 'xxsssxx@email.sk', '094233111', 'Heslo'),
(3, 2, 'Laco', 'Kovac', 'kovac@email.sk', '11111111', 'Heslo'),
(4, 2, 'Admin', 'Admin', 'admin@gmail.com', '094131313', 'admin');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexy pre tabuľku `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexy pre tabuľku `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexy pre tabuľku `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_address` (`id_address`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pre tabuľku `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Obmedzenie pre tabuľku `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Obmedzenie pre tabuľku `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
