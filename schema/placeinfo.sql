-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-07-12 14:30:39
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
-- 資料表結構 `placeinfo`
--

CREATE TABLE `placeinfo` (
  `placeId` int(11) NOT NULL COMMENT '流水號',
  `placeName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '營區名稱',
  `placeLoc` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '營區位置',
  `placeDesc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '營區簡介',
  `placeRating` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '營區評價',
  `placeViewImg` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '營區大圖',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `placeinfo`
--

INSERT INTO `placeinfo` (`placeId`, `placeName`, `placeLoc`, `placeDesc`, `placeRating`, `placeViewImg`, `created_at`, `updated_at`) VALUES
(1, '上雲端露營區', '苗栗縣頭屋鄉', '鄰近明德水庫 日新島 薰衣草森林 雅聞玫瑰森林', NULL, '01.jpg', '2021-07-11 18:50:52', '2021-07-11 18:50:52'),
(2, '斯揚莫那休閒莊園', '宜蘭縣大同鄉', '位於宜蘭大同-留茂安和四季部落之間，面對雪山脈 背靠加羅湖群', NULL, '02.jpg', '2021-07-11 18:50:43', '2021-07-11 18:50:43'),
(3, '松蘿園林露營區', '宜蘭縣大同鄉', '制高點賞大景營地~觀看龜山島日出及太平山日落絕美景色', NULL, '03.jpg', '2021-07-07 13:44:18', '2021-07-07 13:44:18'),
(4, '天際線茶園營地', '宜蘭縣大同鄉', '座擁群峯、山巒疊翠，夜景、朝日、茶園景緻，皆極具特色', NULL, '04.jpg', '2021-07-07 13:45:10', '2021-07-07 13:45:10'),
(5, '東和露營區', '苗栗縣大湖鄉', '山嵐飄渺 壯麗的雲海景色，享受遼闊視野大景相伴的時光', '0', '05.jpg', '2021-07-11 18:54:17', '2021-07-11 18:54:17'),
(6, '五福山莊', '苗栗縣三義鄉', '關刀山下的自然保育林區內的百年客家聚落', '0', '06.jpg', '2021-07-11 18:56:11', '2021-07-11 18:56:11'),
(7, '山板樵楓橋夜泊露營區', '苗栗縣三義鄉', '位於苗栗三義 園內復育豐富動植物，提供您盡情享受山野的自然之美', '0', '07.jpg', '2021-07-11 18:57:48', '2021-07-11 18:57:48'),
(8, '瑪崙菓園親子露營區', '宜蘭縣大同鄉', '喚醒露營人的開闊露營魂，是宜蘭一處親子探險的私房秘境', '0', '08.jpg', '2021-07-11 18:59:27', '2021-07-11 18:59:27');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `placeinfo`
--
ALTER TABLE `placeinfo`
  ADD PRIMARY KEY (`placeId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `placeinfo`
--
ALTER TABLE `placeinfo`
  MODIFY `placeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水號', AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
