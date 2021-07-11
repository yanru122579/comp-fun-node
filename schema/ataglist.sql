-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-07-08 14:22:15
-- 伺服器版本： 10.4.18-MariaDB
-- PHP 版本： 8.0.5

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
-- 資料表結構 `ataglist`
--

CREATE TABLE `ataglist` (
  `tagId` int(11) NOT NULL COMMENT '標籤編號',
  `tagName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '標籤名稱',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `ataglist`
--

INSERT INTO `ataglist` (`tagId`, `tagName`, `created_at`, `updated_at`) VALUES
(1, '#星期六', '2021-05-10 21:42:06', '2021-05-12 10:47:16'),
(2, '#夜景', '2021-05-10 21:42:06', '2021-05-10 21:45:49'),
(3, '#免裝備', '2021-05-10 21:43:28', '2021-05-10 21:43:28'),
(4, '#高海拔', '2021-05-10 21:43:28', '2021-05-10 21:45:00'),
(5, '#釣魚', '2021-05-10 21:44:23', '2021-05-10 21:44:23'),
(6, '#大草皮', '2021-05-10 21:44:23', '2021-05-10 21:44:23'),
(7, '#櫻花', '2021-05-10 21:45:21', '2021-05-10 21:45:21'),
(8, '#雲海', '2021-05-10 21:45:21', '2021-05-10 21:45:21'),
(9, '#近溪流', '2021-05-10 21:46:31', '2021-05-10 21:46:31'),
(10, '#兒童親子', '2021-05-10 21:46:31', '2021-05-13 10:44:52'),
(12, '#露營料理', '2021-05-13 15:55:41', '2021-06-28 16:02:49');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `ataglist`
--
ALTER TABLE `ataglist`
  ADD PRIMARY KEY (`tagId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `ataglist`
--
ALTER TABLE `ataglist`
  MODIFY `tagId` int(11) NOT NULL AUTO_INCREMENT COMMENT '標籤編號', AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
