-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 08, 2021 at 02:31 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pos`
--
CREATE DATABASE IF NOT EXISTS `db_pos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_pos`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `id_category` int(11) NOT NULL,
  `name_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`id_category`, `name_category`) VALUES
(1, 'Espresso Based'),
(2, 'White'),
(3, 'Tea'),
(4, 'Blended'),
(5, 'Tutti Fruit'),
(6, 'Bakery'),
(7, 'Lunch');

-- --------------------------------------------------------

--
-- Table structure for table `tb_history`
--

CREATE TABLE `tb_history` (
  `id_history` int(10) NOT NULL,
  `date_history` datetime NOT NULL DEFAULT current_timestamp(),
  `cashier_history` varchar(255) NOT NULL,
  `product_history` text NOT NULL,
  `amount_history` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_history`
--

INSERT INTO `tb_history` (`id_history`, `date_history`, `cashier_history`, `product_history`, `amount_history`) VALUES
(1, '2020-01-10 14:48:35', 'Cashier 1', 'Espresso x1, Coffee Latte x3, Cappucino x2', 65000),
(2, '2021-01-16 17:36:52', 'Pevita Pearce', 'Espresso x1', 10000),
(3, '2021-01-16 17:41:39', 'Pevita Pearce', 'Coffee Latte x7, Black Forest x1, Odading Mang Oleh x8', 175000),
(4, '2021-01-16 17:42:47', 'Pevita Pearce', 'Choco Rhum x7', 196000),
(5, '2021-01-16 17:45:12', 'Pevita Pearce', 'Coffee Latte x7, Red Velvet Latte x4, Choco Rhum x3', 321000),
(6, '2021-01-16 17:46:18', 'Pevita Pearce', 'Espresso x1, Cappucino x1', 15000),
(7, '2021-01-16 17:47:43', 'Pevita Pearce', 'Cappucino x1', 5000),
(8, '2021-01-16 10:59:08', 'Pevita Pearce', 'Coffee Latte x1', 15000),
(9, '2021-01-17 08:14:27', 'Pevita Pearce', 'Choco Rhum x4, Black Forest x1, Green Tea x3', 169000),
(10, '2021-01-17 12:01:23', 'Pevita Pearce', 'Coffee Latte x1, Cappucino x1', 20000),
(11, '2021-01-17 12:01:28', 'Pevita Pearce', 'Cappucino x1, Black Forest x1', 35000),
(12, '2021-01-17 12:01:32', 'Pevita Pearce', 'Choco Rhum x1', 28000),
(13, '2021-01-17 12:01:37', 'Pevita Pearce', 'Red Velvet Latte x5, Choco Rhum x1', 193000),
(14, '2021-01-17 12:01:47', 'Pevita Pearce', 'Chicken Katsu Dabu-dabu x1, Salmon Truffle Teriyaki x1, Wiener Schnitzel x1, Green Tea x1, Dalgona Coffee x1', 233000),
(15, '2021-01-17 12:01:56', 'Pevita Pearce', 'Espresso x1, Coffee Latte x1, Cappucino x1, Choco Rhum x1, Black Forest x1', 88000),
(16, '2021-01-17 12:02:00', 'Pevita Pearce', 'Red Velvet Latte x1, Choco Rhum x1, Black Forest x1', 91000),
(17, '2021-01-17 16:53:01', 'Pevita Pearce', 'Espresso x1', 10000),
(18, '2021-01-19 09:33:36', 'Pevita Pearce', 'Choco Rhum x6', 168000),
(19, '2021-01-20 09:24:06', 'Pevita Pearce', 'Coffee Latte x1, Cappucino x5, Choco Rhum x1, Black Forest x1, Green Tea x3', 137500),
(20, '2021-01-20 09:43:58', 'Pevita Pearce', 'Coffee Latte x1', 16500),
(21, '2021-01-20 10:34:10', 'Pevita Pearce', 'Coffee Latte x1, Cappucino x2, Choco Rhum x1', 58300),
(22, '2021-01-21 08:14:13', 'Pevita Pearce', 'Cappucino x1, Black Forest x1, Salmon Truffle Teriyaki x1, Green Tea x1', 114400),
(23, '2021-01-21 14:02:59', 'Pevita Pearce', 'Coffee Latte x1, Cappucino x1, Choco Rhum x1, Black Forest x1', 85800),
(24, '2021-01-21 14:04:35', 'Pevita Pearce', 'Dalgona Coffee x1, Macchiato x1', 71500),
(25, '2021-02-05 13:11:18', 'admin', 'Coffee Latte x1, Cappucino x1', 22000),
(26, '2021-02-05 13:12:15', 'admin', 'Espresso x1, Coffee Latte x1, Cappucino x1, Black Forest x1', 66000),
(27, '2021-02-05 13:15:05', 'admin', 'Espresso x1, Coffee Latte x1, Cappucino x1', 33000),
(28, '2021-02-05 13:16:13', 'admin', 'Cappucino x1, Choco Rhum x1, Black Forest x1', 69300),
(29, '2021-02-05 13:22:48', 'admin', 'Espresso x1, Coffee Latte x1, Cappucino x1', 33000),
(30, '2021-02-05 13:42:21', 'admin', 'Espresso x1, Coffee Latte x1, Cappucino x1, Red Velvet Latte x1, Choco Rhum x1, Black Forest x1', 133100),
(31, '2021-02-05 15:24:03', 'admin', 'Cappucino x6, Choco Rhum x1, Black Forest x1, Chicken Katsu Dabu-dabu x1, Wiener Schnitzel x1', 238700),
(32, '2021-02-05 15:54:47', 'admin', 'Affogato x1, Americano x1, Peach Tea x1, Chocolate Delight x1, Blended Choco Mint x1, Summer Blast x1, Avocado Lava x1', 202400),
(33, '2021-02-06 09:55:42', 'admin', 'Choco Rhum x1, Black Forest x1', 63800),
(34, '2021-02-06 10:01:14', 'admin', 'Cappucino x1, Black Forest x1', 38500),
(35, '2021-02-06 13:19:41', 'admin', 'Cappucino x2, Teh Manis Hangat x1, Kopi Hitam x1', 13200),
(36, '2021-02-07 08:31:53', 'cashier 1', 'Espresso x1, Coffee Latte x1, Cappucino x1', 33000),
(37, '2021-02-07 08:32:04', 'cashier 1', 'Coffee Latte x1, Red Velvet Latte x9, Choco Rhum x1, Black Forest x2', 440000),
(38, '2021-02-07 08:32:14', 'cashier 1', 'Espresso x1, Cappucino x1', 16500);

-- --------------------------------------------------------

--
-- Table structure for table `tb_product`
--

CREATE TABLE `tb_product` (
  `id_product` int(11) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `price_product` int(100) NOT NULL,
  `category_product` int(11) NOT NULL,
  `image_product` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_product`
--

INSERT INTO `tb_product` (`id_product`, `name_product`, `price_product`, `category_product`, `image_product`) VALUES
(1, 'Espresso', 10000, 1, '1612739793620.jpg'),
(2, 'Coffee Latte', 15000, 1, '1612739862177.png'),
(3, 'Cappucino', 5000, 1, '1612739883006.png'),
(4, 'Red Velvet Latte', 33000, 2, '1612739900209.png'),
(5, 'Choco Rhum', 28000, 6, '1612739919352.png'),
(6, 'Black Forest', 30000, 6, '1612739981470.png'),
(7, 'Chicken Katsu Dabu-dabu', 60000, 7, '1612739996804.png'),
(8, 'Salmon Truffle Teriyaki', 60000, 7, '1612740010106.png'),
(9, 'Wiener Schnitzel', 69000, 7, '1612740020318.png'),
(10, 'Affogato', 25000, 1, '1612740033484.jpeg'),
(11, 'Americano', 20000, 1, '1612740066190.png'),
(12, 'Macchiato', 20000, 1, '1612740099752.jpg'),
(13, 'Mochachino', 25000, 1, '1612741364473.jpg'),
(14, 'Green Tea Latte', 25000, 2, '1612741375988.jpg'),
(16, 'Hot Chocolate', 25000, 2, '1612741387180.jpg'),
(17, 'Hot Choco Mint', 25000, 2, '1612741398383.jpg'),
(18, 'Lychee Tea', 19000, 3, '1612741408245.jpg'),
(19, 'Strawberry Tea', 19000, 3, '1612741419835.jpg'),
(20, 'Peach Tea', 19000, 3, '1612741337606.jpg'),
(21, 'Chocolate Delight', 25000, 4, '1612741348755.jpg'),
(22, 'Green Tea Frap', 25000, 4, '1612741433035.png'),
(23, 'Caramel Frap', 25000, 4, '1612741444703.jpg'),
(24, 'Blended Choco Mint', 25000, 4, '1612741464270.jpg'),
(25, 'Sourberry', 19000, 5, '1612741474543.jpg'),
(26, 'Mucho Mango', 19000, 5, '1612741486203.jpg'),
(27, 'Summer Blast', 30000, 5, '1612741498631.jpg'),
(31, 'Avocado Lava', 40000, 5, '1612741507959.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_role`
--

CREATE TABLE `tb_role` (
  `id_role` int(11) NOT NULL,
  `name_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_role`
--

INSERT INTO `tb_role` (`id_role`, `name_role`) VALUES
(1, 'Admin'),
(2, 'Cashier');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(255) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `access_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `name_user`, `email_user`, `password_user`, `access_user`) VALUES
(1, 'admin', 'admin@kopimu.com', '$2b$10$9jx1yVkyLz15znqoj.ZbkOH4CN.puBHgX.hakDsNPA3fqPOM5T.iC', 1),
(2, 'cashier 1', 'cashier@kopimu.com', '$2b$10$EDRkJfz28rgdGDGJvJlRReVx1kRyPEcPX9tpkglgoHQD0HSAwF1ma', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id_category`) USING BTREE,
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `tb_history`
--
ALTER TABLE `tb_history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `category_product` (`category_product`);

--
-- Indexes for table `tb_role`
--
ALTER TABLE `tb_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `access_user` (`access_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_history`
--
ALTER TABLE `tb_history`
  MODIFY `id_history` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tb_role`
--
ALTER TABLE `tb_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_product`
--
ALTER TABLE `tb_product`
  ADD CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`category_product`) REFERENCES `tb_category` (`id_category`);

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `Role Join` FOREIGN KEY (`access_user`) REFERENCES `tb_role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
