-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-07-17 16:12:07
-- 伺服器版本： 10.4.20-MariaDB
-- PHP 版本： 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `campfun`
--

-- --------------------------------------------------------

--
-- 資料表結構 `addressbook`
--

CREATE TABLE `addressbook` (
  `addressId` int(11) NOT NULL COMMENT '地址ID',
  `mId` int(11) NOT NULL COMMENT '會員ID',
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市',
  `township` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '區域',
  `naa` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '詳細住址',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `addressbook`
--

INSERT INTO `addressbook` (`addressId`, `mId`, `country`, `township`, `naa`, `created_at`, `updated_at`) VALUES
(53, 127, '2', '0', '土其耳曾提出，今日之蛋，', '2021-07-14 16:59:46', '2021-07-14 16:59:46'),
(54, 189, '0', '0', '土其耳曾提出，今日之蛋，', '2021-07-17 17:24:07', '2021-07-17 17:24:07'),
(55, 189, '1', '2', '希望大家能從這段話中有所收穫', '2021-07-17 17:24:15', '2021-07-17 17:24:15');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `couponId` int(11) NOT NULL,
  `mId` int(11) NOT NULL,
  `newMember` int(11) NOT NULL COMMENT '新人優惠卷',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `coupon`
--

INSERT INTO `coupon` (`couponId`, `mId`, `newMember`, `created_at`) VALUES
(1, 127, 1, '2021-07-15 01:23:41'),
(2, 182, 1, '2021-07-15 01:23:53'),
(3, 183, 1, '2021-07-15 01:24:38'),
(4, 184, 1, '2021-07-15 01:25:52'),
(5, 185, 1, '2021-07-15 15:09:17'),
(6, 186, 1, '2021-07-15 15:10:25'),
(7, 187, 1, '2021-07-15 15:19:07'),
(8, 188, 1, '2021-07-15 15:35:31'),
(9, 189, 1, '2021-07-15 18:02:48'),
(10, 190, 1, '2021-07-15 23:34:27'),
(11, 191, 1, '2021-07-16 15:50:46'),
(12, 192, 1, '2021-07-17 21:56:28');

-- --------------------------------------------------------

--
-- 資料表結構 `csmessage`
--

CREATE TABLE `csmessage` (
  `messageId` int(11) NOT NULL,
  `fromWho` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toWho` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messsage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `csmessage`
--

INSERT INTO `csmessage` (`messageId`, `fromWho`, `toWho`, `messsage`, `created_at`) VALUES
(5, '189', 'csStaff', '你好，有人在嗎', '2021-07-17 16:20:06'),
(11, 'csStaff', '189', '您好~這裡是客服小姐姐，我是服務您的飛天豬排，請問有什麼問題需要協助呢?', '2021-07-17 16:30:43'),
(12, '189', 'csStaff', '我們可以很篤定的說', '2021-07-17 16:45:17'),
(18, 'csStaff', '189', '你好絕對是史無前例的', '2021-07-17 17:07:41'),
(23, '192', 'csStaff', '你好~~有人在嗎', '2021-07-17 21:58:06'),
(24, '192', 'csStaff', '1', '2021-07-17 21:58:23'),
(25, '192', 'csStaff', '2', '2021-07-17 21:58:24'),
(26, '192', 'csStaff', '3', '2021-07-17 21:58:25'),
(27, '192', 'csStaff', '4', '2021-07-17 21:58:26');

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `mId` int(11) NOT NULL COMMENT '會員ID，流水號',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員帳號/信箱',
  `password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員密碼',
  `fName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓氏',
  `lName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '暱稱',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手機號碼',
  `birthday` date NOT NULL DEFAULT '1990-01-01' COMMENT '生日',
  `gender` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `avatar` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間',
  `isActivated` tinyint(1) NOT NULL DEFAULT 1 COMMENT '開通狀況',
  `otg` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`mId`, `email`, `password`, `fName`, `lName`, `nickname`, `phone`, `birthday`, `gender`, `address`, `avatar`, `created_at`, `updated_at`, `isActivated`, `otg`) VALUES
(1, 'test@gmail.com', 'reyeryeryery', '林', NULL, '猛男撿樹枝2', '0953967734', '0000-00-00', '女', '桃園市龜山區頂興路48巷23號', '', '2021-05-05 16:27:22', '2021-07-15 19:18:13', 1, 0),
(2, 'test2@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', NULL, NULL, '卑鄙源之助2', '0970408634', '0000-00-00', '女', '新竹市東區綠水路133巷1號1樓', '', '2021-05-05 16:32:15', '2021-07-08 21:25:18', 1, 0),
(4, 'test4@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', NULL, NULL, '台北暴徒aka黑魔王', '0926582165', '0000-00-00', '女', '台北市信義區富陽街256號', '', '2021-05-05 16:33:09', '2021-07-08 21:25:17', 1, 0),
(6, 'test6@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', NULL, NULL, '話語霸權', '0953967734', '0000-00-00', '女', '桃園市龜山區頂興路48巷23號', '', '2021-05-05 16:44:42', '2021-07-08 21:25:17', 1, 0),
(7, 'test8@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', NULL, NULL, '人民的法槌', '0953357937', '0000-00-00', '女', '新北市土城區中央路一段59巷13號', '', '2021-05-05 21:07:58', '2021-07-08 21:25:16', 1, 0),
(8, 'test9@gmail.com', '5f6955d227a320c7f1f6c7da2a6d96a851a8118f', NULL, NULL, '構造改革', '0972539816', '0000-00-00', '女', '台北市信義區崇德街133巷6號', '', '2021-05-05 21:08:20', '2021-07-08 21:25:15', 1, 0),
(9, 'test10@gmail.com', '5f6955d227a320c7f1f6c7da2a6d96a851a8118f', NULL, NULL, '話語霸權', '0970443589', '0000-00-00', '女', '台北市信義區吳興街167巷15號', '', '2021-05-05 21:13:03', '2021-07-08 21:25:15', 1, 0),
(14, 'test11@gmail.com', 'l@STn3MzMV', NULL, NULL, '金馬麒麟刀加暗盾', '0970443589', '0000-00-00', '女', '台北市信義區吳興街1', '', '2021-05-10 10:07:48', '2021-07-08 21:25:14', 1, 0),
(123, 'test3@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', NULL, NULL, '惡魔貓男', '0953900670', '0000-00-00', '女', '新北市板橋區大觀路二段200號', '', '2021-05-05 16:32:55', '2021-07-08 21:25:13', 1, 0),
(125, 'good@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '林', NULL, '韭菜戰士2', '0912345678', '0000-00-00', '男', '大安公園', '', '2021-05-12 15:35:49', '2021-07-08 21:25:10', 1, 0),
(126, 'user@user.com', '12dea96fec20593566ab75692c9949596833adc9', NULL, NULL, '', '', '0000-00-00', '男', '', '', '2021-05-13 14:59:57', '2021-07-08 21:25:09', 1, 0),
(127, 'qoo', '$2a$10$EdChcSFUYebLhNWU31f3Ae6F6Rww83pTr7ggyHKVJ4dXfz2SQra7y', '奧', '樂雞', '就是一隻雞', '09112', '1991-02-01', '男', '大安安', '57e6e25d-a24f-4d46-8993-812e27194482.jpg', '2021-07-08 15:31:43', '2021-07-15 13:05:46', 1, 0),
(192, 'qq@gmail.com', '$2a$10$sJdPuAgYZ/ijz8crQv7tBus45sTcuicAgutJH.wEuzZBl8Iq9dX6O', NULL, NULL, '', '', '1990-01-01', '', '', 'cdddb128-7d90-4001-9bcf-9a48158f84fd.png', '2021-07-17 21:56:28', '2021-07-17 21:57:42', 1, 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `addressbook`
--
ALTER TABLE `addressbook`
  ADD PRIMARY KEY (`addressId`);

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`couponId`);

--
-- 資料表索引 `csmessage`
--
ALTER TABLE `csmessage`
  ADD PRIMARY KEY (`messageId`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mId`),
  ADD KEY `username` (`email`),
  ADD KEY `email` (`email`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addressbook`
--
ALTER TABLE `addressbook`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址ID', AUTO_INCREMENT=56;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupon`
--
ALTER TABLE `coupon`
  MODIFY `couponId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `csmessage`
--
ALTER TABLE `csmessage`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `mId` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員ID，流水號', AUTO_INCREMENT=193;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
