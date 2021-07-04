-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-07-03 13:20:28
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
-- 資料表結構 `acommentlist`
--

CREATE TABLE `acommentlist` (
  `id` int(11) NOT NULL COMMENT '留言編號',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '留言內容',
  `rating` tinyint(1) NOT NULL COMMENT '評分',
  `parentId` int(11) NOT NULL DEFAULT 0 COMMENT '上(父)層編號',
  `itemId` int(11) NOT NULL COMMENT '商品編號',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='評論';

--
-- 傾印資料表的資料 `acommentlist`
--

INSERT INTO `acommentlist` (`id`, `name`, `content`, `rating`, `parentId`, `itemId`, `created_at`, `updated_at`) VALUES
(1, '', 'good', 5, 0, 2, '2021-04-23 10:44:06', '2021-04-23 10:44:06'),
(2, 'Amy', 'good', 5, 0, 2, '2021-04-23 10:44:16', '2021-04-23 10:44:16'),
(3, '管理員', 'thanks ', 0, 1, 2, '2021-04-23 10:56:53', '2021-04-23 10:56:53'),
(4, '管理員', 'thank you!', 0, 2, 2, '2021-04-23 10:57:02', '2021-04-23 10:57:02');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `acommentlist`
--
ALTER TABLE `acommentlist`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `acommentlist`
--
ALTER TABLE `acommentlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言編號', AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
