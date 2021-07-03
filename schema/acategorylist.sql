-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-07-03 13:20:06
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
-- 資料表結構 `acategorylist`
--

CREATE TABLE `acategorylist` (
  `aCatId` int(11) NOT NULL COMMENT '流水號',
  `aCatName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別名稱',
  `aCatParentId` int(11) DEFAULT 0 COMMENT '上層編號',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='類別資料表';

--
-- 傾印資料表的資料 `acategorylist`
--

INSERT INTO `acategorylist` (`aCatId`, `aCatName`, `aCatParentId`, `created_at`, `updated_at`) VALUES
(2, '露營新手指南', 0, '2021-05-03 15:27:18', '2021-05-12 10:46:53'),
(3, '親子同遊露營', 0, '2021-05-03 16:25:32', '2021-05-05 14:51:46'),
(4, '深度野營探索', 0, '2021-05-04 09:32:41', '2021-05-05 14:52:43'),
(5, '奢華露營體驗', 0, '2021-05-05 12:09:51', '2021-05-13 10:43:34');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `acategorylist`
--
ALTER TABLE `acategorylist`
  ADD PRIMARY KEY (`aCatId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `acategorylist`
--
ALTER TABLE `acategorylist`
  MODIFY `aCatId` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水號', AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
