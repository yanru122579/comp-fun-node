-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-07-18 16:23:34
-- 伺服器版本： 10.4.18-MariaDB
-- PHP 版本： 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `campfun`
--

-- --------------------------------------------------------

--
-- 資料表結構 `placeprice`
--

CREATE TABLE `placeprice` (
  `areaId` int(11) NOT NULL COMMENT '營區區域編號',
  `placeId` int(11) NOT NULL COMMENT '營區編號',
  `placeSImg` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '營區配置圖',
  `placeAImg` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '營區區域小圖',
  `placeArea` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '營區區域',
  `placeType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '場地型態',
  `placeSize` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '場地尺寸',
  `tentQty` tinyint(3) NOT NULL COMMENT '場地帳數',
  `weekdaysPrice` int(11) NOT NULL COMMENT '平日價格',
  `holidayPrice` int(11) NOT NULL COMMENT '假日價格',
  `continuousPrice` int(11) NOT NULL COMMENT '連續天數價格',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `placeprice`
--

INSERT INTO `placeprice` (`areaId`, `placeId`, `placeSImg`, `placeAImg`, `placeArea`, `placeType`, `placeSize`, `tentQty`, `weekdaysPrice`, `holidayPrice`, `continuousPrice`, `created_at`, `updated_at`) VALUES
(1, 1, '01-2-1.jpg', '01-1-1.jpg', 'A區 草地', '碎石草地', '6M*8M', 24, 800, 1000, 700, '2021-07-15 23:25:23', '2021-07-15 23:25:23'),
(2, 1, NULL, '01-1-2.jpg', 'B區 草地', '碎石草地', '6M*8M', 10, 800, 1000, 700, '2021-07-13 17:33:10', '2021-07-13 17:33:10'),
(3, 2, '02-2-1.jpg', '02-1-1.jpg', 'A區碎石草皮', '碎石草皮', '8M*8M', 6, 1000, 1100, 900, '2021-07-15 01:01:51', '2021-07-15 01:01:51'),
(4, 2, NULL, '02-1-2.jpg', 'A區雨棚', '碎石雨棚', '4M*6M', 9, 1200, 1400, 1100, '2021-07-15 01:04:01', '2021-07-15 01:04:01'),
(5, 2, NULL, '02-1-3.jpg', 'B區碎石草皮', '碎石草皮', '5M*7M', 8, 900, 1000, 800, '2021-07-15 01:05:24', '2021-07-15 01:05:24'),
(6, 3, '03-2-1.jpg', '03-1-1.jpg', '草皮A區', '碎石草地', '6M*8M', 6, 1000, 1100, 900, '2021-07-15 01:30:44', '2021-07-15 01:30:44'),
(7, 3, NULL, '03-1-2.jpg', '草皮B區', '碎石草地', '5.5M*8M', 9, 1000, 1100, 900, '2021-07-15 01:31:32', '2021-07-15 01:31:32'),
(8, 4, '04-2-1.jpg', '04-1-1.jpg', 'A區', '碎石', '8M*18M', 4, 900, 1000, 800, '2021-07-15 01:36:02', '2021-07-15 01:36:02'),
(9, 4, NULL, '04-1-2.jpg', 'B區', '碎石', '5M*8M', 6, 900, 1000, 800, '2021-07-15 01:35:42', '2021-07-15 01:35:42'),
(10, 5, '05-2-1.jpg', '05-1-1.jpg', 'A區', '草皮', '5M*8M', 12, 1000, 1100, 900, '2021-07-15 01:39:24', '2021-07-15 01:39:24'),
(11, 5, NULL, '05-1-2.jpg', 'B區', '草皮', '5M*7M', 13, 1000, 1100, 900, '2021-07-15 01:40:29', '2021-07-15 01:40:29'),
(12, 6, '06-2-1.jpg', '06-1-1.jpg', 'A區', '草皮', '5M*8M', 3, 900, 1000, 800, '2021-07-15 01:43:40', '2021-07-15 01:43:40'),
(13, 6, NULL, '06-1-2.jpg', 'B區', '草皮', '5M*6M', 5, 900, 1000, 800, '2021-07-15 01:44:33', '2021-07-15 01:44:33'),
(14, 7, '07-2-1.jpg', '07-1-1.jpg', 'A區草地', '草地', '5Mx8M', 10, 1000, 1100, 800, '2021-07-15 01:49:37', '2021-07-15 01:49:37'),
(15, 7, NULL, '07-1-2.jpg', 'B區棧板', '木棧板', '3.6Mx3.6M', 5, 1000, 1100, 800, '2021-07-15 01:50:32', '2021-07-15 01:50:32'),
(16, 8, '08-2-1.jpg', '08-1-1.jpg', 'A區', '碎石草皮', '6Mx12M', 15, 1200, 1300, 1000, '2021-07-15 01:53:13', '2021-07-15 01:53:13'),
(17, 8, NULL, '08-1-2.jpg', 'B區', '碎石草皮', '5.3Mx15M', 12, 1200, 1300, 1000, '2021-07-15 01:53:57', '2021-07-15 01:53:57');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `placeprice`
--
ALTER TABLE `placeprice`
  ADD PRIMARY KEY (`areaId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `placeprice`
--
ALTER TABLE `placeprice`
  MODIFY `areaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '營區區域編號', AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
