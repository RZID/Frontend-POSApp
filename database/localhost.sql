-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 07, 2021 at 06:31 AM
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
(1, 'Espresso', 10000, 1, '1611739111577.png'),
(2, 'Coffee Latte', 15000, 1, '1612672701427.jpg'),
(3, 'Cappucino', 5000, 1, '1612661302982.png'),
(4, 'Red Velvet Latte', 33000, 2, '1611739306022.png'),
(5, 'Choco Rhum', 28000, 6, '1611739341236.png'),
(6, 'Black Forest', 30000, 6, '1611739413266.png'),
(7, 'Chicken Katsu Dabu-dabu', 60000, 7, '1611739463283.png'),
(8, 'Salmon Truffle Teriyaki', 60000, 7, '1611739493568.png'),
(9, 'Wiener Schnitzel', 69000, 7, '1611739517892.png'),
(10, 'Affogato', 25000, 1, '1611741704975.jpeg'),
(11, 'Americano', 20000, 1, '1611741729543.jpg'),
(12, 'Macchiato', 20000, 1, '1611741754450.png'),
(13, 'Mochachino', 25000, 1, '1612673779830.png'),
(14, 'Green Tea Latte', 25000, 2, '1611741992657.jpg'),
(16, 'Hot Chocolate', 25000, 2, '1611742056811.jpg'),
(17, 'Hot Choco Mint', 25000, 2, '1611742071930.jpg'),
(18, 'Lychee Tea', 19000, 3, '1611742309502.jpg'),
(19, 'Strawberry Tea', 19000, 3, '1611742328502.jpg'),
(20, 'Peach Tea', 19000, 3, '1611742347876.jpg'),
(21, 'Chocolate Delight', 25000, 4, '1611742558482.jpg'),
(22, 'Green Tea Frap', 25000, 4, '1611742570830.png'),
(23, 'Caramel Frap', 25000, 4, '1611742586145.jpg'),
(24, 'Blended Choco Mint', 25000, 4, '1611742602733.jpg'),
(25, 'Sourberry', 19000, 5, '1611742723014.jpg'),
(26, 'Mucho Mango', 19000, 5, '1611742732823.jpg'),
(27, 'Summer Blast', 30000, 5, '1611793306496.jpg'),
(31, 'Avocado Lava', 40000, 5, '1611925909999.jpg'),
(46, 'Tea With Strawberry', 20000, 3, '1612593304723.jpg');

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
(2, 'cashier 1', 'cashier@kopimu.com', '$2b$10$EDRkJfz28rgdGDGJvJlRReVx1kRyPEcPX9tpkglgoHQD0HSAwF1ma', 2),
(4, 'Ramadhanu', 'ramadhanu@rzidinc.org', '$2b$10$IdTF.xW3awtsrq8kfBj6l.6R2p6wAakrDQleogzQl5lXLyg5xEkse', 1),
(5, 'admin', 'admin@rzidinc.xyz', '$2b$10$ElN4/fGt0Anwg6TTCwo5YOHoozxpDJT8ITlu3Cm3Xhs2SDfPvWpye', 1),
(6, 'admin Lagi', 'admin@udin.xyz', '$2b$10$4sxMxYJ5O0lQQ5elCUDpD.GfMWez/diyxAQB.IJngEca1/b/Gq3jy', 1),
(7, 'hello', 'admin@oo.php', '$2b$10$sTreEdGJg4.hifFFy9LHQu.XCUdCygW1T2leOyisRV5fbIr5iEJSC', 1),
(8, 'asd', 'asd@asde1.com', '$2b$10$xa2QEpmSyDQlHbUzUcqrA.MfUjM3A.m2EJESqklISupz5a3etF2u2', 1),
(9, 'asd', 'asd@min.com', '$2b$10$EMdqkz4Xsfsh94FKyfRcS.DluEycuPr1eOeakugAJADCNFVYwRDxK', 2),
(10, 'wadma', 'ads@fasd.com', '$2b$10$AQ0/vPmJSDzm85.jgn/sUOpqtBmnwLJxNfwug3HcVGTLvcChTaBg.', 1),
(11, 'asda', 'asda@agmda.com', '$2b$10$mw0qUysNp.Me6yQqFk/AleE9KgJOBkRy.8XjvghU64ls4a8qh89JC', 1),
(12, 'admin', 'ad@admin.op', '$2b$10$rGFuDyWMGOpbCl9mDMt1T.ioXMIzCwvd372p0iQd7Zvy.ALcX1zAO', 1),
(13, 'admin', 'admin@pasd.com', '$2b$10$vRbn8eKkuEjoVS74VlBLMudxuFbwQ4wLQ5WcLd6pF0x2TiFxQVAQ6', 1),
(14, 'admin', 'dasidn@famsiudha.com', '$2b$10$.pjw4ec/F5IPIc4v3Hw7pO0IXZYVNOWycokd6PdO/XyA3jI6v.AEm', 1),
(16, 'asda', 'ads@gnasd.com', '$2b$10$lhQZ.ePCZKGdp8iB9iznWeLqOOrbmYZOkxAFC3W55frSE04/nwrGm', 1),
(17, 'responses', 'asdmin@gnasudh.com', '$2b$10$Ptgts1WpvxeTiYzbHSReWegPoOgu4dBt3Ln8Jr/ihFPfKml/dRjhi', 1),
(18, 'asdas', 'adsfajoiugfwu@sadhuifhosi.com', '$2b$10$uXOOl6rL9JAJ3/9bssbxp.YHNEmQZryjT85UuqJ/yyYIw4xXp8rKa', 1),
(19, 'kara', 'asd@ganasdi.com', '$2b$10$O.wK3oqmdIzYnEcJergOaeNvnNiend8ZCUkn70ngEfJbiB.TetDYa', 1),
(20, 'asdjas', 'dafiusahdf@famisda.com', '$2b$10$tBVXPSfh5A5.FQaYx5UmWOrqtQw68FBQ0wRIiqz1zaLVg2WnxS7M2', 1),
(21, 'adminasd', 'sfna@fand.com', '$2b$10$6jx7pnOWmx40jdVi6Ds8ruaNScsFWauNyAfQvPzO7rzpjPvY3qGey', 1),
(22, 'kenapa', 'kok@gitu.sih', '$2b$10$jYsGDgvOMVqE/tPiKFnBYuU8kpO9qSEdjNunX4N3RdZKNTk256UTy', 1),
(23, 'asd', 'asd@asdaasd.com', '$2b$10$nboboo7HI15S1N46pZvKy.EXH4kuxdU7KrTn1/BKxdert6p0U9t1y', 1),
(24, 'asd', 'asdanj@asdasd.jir', '$2b$10$hU3usqHuGf3IuJvxKA7Cg.hkAf3/VkTCmr7JIH8s1disOMLQlF9u.', 1),
(25, 'admin', 'admin@gmail.com', '$2b$10$tGdclU2mBgXV25PJ41PiDecHn9eesU3NoNPLU0kRXxKXzwmHZ0/cu', 1),
(26, 'asdas', 'asdasda@asdnun.com', '$2b$10$m9OuSTkTqJ7SN5EI6xTZGuNn/.dENN0wPSC5PIOozsPJRvCu5W/qK', 1),
(27, 'asdas', 'sdauwhfo@fsdofua.com', '$2b$10$rCWJ57QzE8kpJLY3Tep4MuB.nPIXiXLIdze81l4UAYvL6qIp9oz2S', 1),
(28, 'admin', 'admin@fasda.com', '$2b$10$YKO2ikUEeVCdDum4xRxhSOOEMjaF2.CPI9M6G.YrCRxP5vTfaTXOW', 1),
(29, 'asd', 'asd@aasd.com', '$2b$10$.cz8TNYjwusyR1MYTV.wiezaszw5ZtObGuYoaTVagGA5GUYMJaf0S', 1),
(30, 'asd', 'asd@dasd.com', '$2b$10$UEI7KJ/hNsGsa.QG1zffKOTrJ9mO4zbbLklwZsFxgt.Yl5rQIxuVC', 1),
(31, 'admin', 'adm1231in@bah.com', '$2b$10$RDs2VK.z81oRJ0tPpcCHy.pJOxfBamHdN2G2aqYO2tuGa0FEQYDmG', 1),
(32, 'asd', 'asdmin@gmasdnais.com', '$2b$10$wIzzJx1S1oIjPJ/vAxZWc.kjTg2jpXltowqjKdwvwy9PcO51VVOM.', 1),
(33, 'asdasd', 'asda@asdahsduahsiudwdiuj.com', '$2b$10$xTt2tkpXIwcSPSJhpCKvTOcZJcMea5XroJBE.zOTULeKRbRAP.eDK', 1),
(34, 'asda', 'asdasd3ep3i0@asidjas.com', '$2b$10$8HEneLX8k4sS8tEz1G53T.aj68RzFocsxB3z34PfQM5I19n1RKbGy', 1),
(35, 'admin', 'admin@admin.com', '$2b$10$jNOx8OZPUMG5XNJpdQwMMOzYL7TgHJPoTtPiaVl0J52mbvsau4uTy', 1),
(59, 'asd', 'asd@ad', '$2b$10$S321CTKsOGk.PZXqSA9EJuxO5244cuLjHMi9v5rtWRrykhhXuvwby', 1),
(65, 'admin', 'kk@gmail.com', '$2b$10$pO2txBvy1HB588JTIEqbu.VgpX8asG1XT..x0MT2ClK9SEt7pDaa.', 1),
(66, 'admin', 'aa@gmail.com', '$2b$10$gzT1vFcKZrSwyzSH4KfK1O2QS7aLK211F5ezzlz.hb/n0VkSwxqRi', 1),
(67, 'admin', 'admin@oo.com', '$2b$10$2PBmPJJqC.8qcIw52LQNx.QbvX6k3vvlsfKLCRkEatsdQtfz/b2Vu', 1),
(68, 'admin', 'admin@kk.co.id', '$2b$10$PXESt14dwpBVxuxGplnGb.U3y55lMaGuFyyVudF2BfYntEsK30UTS', 1),
(69, 'admsid', 'sajhfdoiau@asdjoi.com', '$2b$10$P5Q3IokeOsfRGF72wp5t2OG1kXtx.Fv.mtgjnmIgzhcmnDLbzxC6W', 1),
(70, 'admin', 'adminin@gmail.com', '$2b$10$D/TVWGik.SHGW2anbSoyaeCQG3e75L1lHHiTWARnHqOxqxmdxt3tm', 1),
(71, 'admin', 'adminOK@gmail.com', '$2b$10$wa/9zf6IxM4.4TPjN78ByuVfzXP9TVant/7XLwrsOu0xtAU1NPMzC', 1);

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
