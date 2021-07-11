-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-07-11 19:52:29
-- 伺服器版本： 10.4.18-MariaDB
-- PHP 版本： 7.3.28

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
-- 資料表結構 `productcategory`
--

CREATE TABLE `productcategory` (
  `id` int(11) NOT NULL,
  `cat_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `productcategory`
--

INSERT INTO `productcategory` (`id`, `cat_id`, `cat_name`, `created_at`, `updated_at`) VALUES
(18, 'A', '帳篷/天幕', '2021-05-12 08:29:47', '2021-07-10 15:33:46'),
(20, 'B', '桌椅/戶外家具', '2021-05-12 08:30:06', '2021-07-10 15:34:44'),
(21, 'C', '寢具/睡袋', '2021-05-12 08:34:38', '2021-07-10 15:40:00'),
(22, 'D', '火盆/炊具', '2021-05-12 08:34:45', '2021-07-10 15:40:00'),
(23, 'E', '餐廚具', '2021-05-13 01:27:41', '2021-07-10 15:40:00'),
(24, 'F', '燈具/飾品', '2021-05-13 01:27:50', '2021-07-10 15:40:00'),
(25, 'G', '其他類', '2021-05-13 01:27:57', '2021-07-10 15:40:00'),
(26, 'I', '廚具', '2021-05-13 01:28:02', '2021-05-13 01:28:02'),
(27, 'J', '餐具', '2021-05-13 01:28:07', '2021-05-13 01:28:07'),
(28, 'K', '攜行用具', '2021-05-13 01:28:12', '2021-05-13 01:28:12'),
(29, 'L', '燈具', '2021-05-13 01:28:18', '2021-05-13 01:28:18'),
(30, 'M', '其他類別', '2021-05-13 01:28:33', '2021-05-13 01:28:33');

-- --------------------------------------------------------

--
-- 資料表結構 `productlist`
--

CREATE TABLE `productlist` (
  `cat_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品分類編號',
  `product_id` int(5) UNSIGNED ZEROFILL NOT NULL COMMENT '商品編號',
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名稱',
  `product_summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品短述',
  `product_desc` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品長述',
  `product_img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品主圖(預留)',
  `product_oimage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` int(11) NOT NULL COMMENT '主TAG',
  `product_price` int(11) NOT NULL COMMENT '價格',
  `product_rate` int(11) NOT NULL COMMENT '評分',
  `qty` int(11) NOT NULL COMMENT '臨時性DEMO數量',
  `state` int(11) NOT NULL COMMENT '物品狀態',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品清單';

--
-- 傾印資料表的資料 `productlist`
--

INSERT INTO `productlist` (`cat_id`, `product_id`, `product_name`, `product_summary`, `product_desc`, `product_img`, `product_oimage`, `tag_id`, `product_price`, `product_rate`, `qty`, `state`, `created_at`, `updated_at`) VALUES
('A', 00001, 'Minute Dome Pro. air 1 (SSD-712)', '經典熱門主帳組合', '經典暢銷主帳組', '20210513033250.jpg', 'https://i3.mkgo.net/images/products/20210513033250.jpg', 1, 3500, 4, 10, 0, '2021-05-13 01:32:49', '2021-07-11 10:22:31'),
('A', 00002, 'Landbreeze寢室帳 Pro.1 (SD-641)', '家庭露營好選擇', '帳篷本體、本體營柱長（x2）、本體營柱（x1）、前庭營柱（x1）、標準鋁質營釘（17cm x 16）', '20210513033354.jpg', 'https://i3.mkgo.net/images/products/20210513033354.jpg', 1, 2000, 4, 5, 0, '2021-05-13 01:33:52', '2021-05-13 01:33:52'),
('A', 00003, 'Landbreeze寢室帳 Pro.3 (SD-643)', '耐風耐雨的居住空間', '外帳／75D滌塔夫防撕裂布、PU塗層最低耐水壓1,800mm、鐵氟龍撥水加工、抗UV加工；內帳／68', '20210513033524.jpg', 'https://i3.mkgo.net/images/products/20210513033524.jpg', 1, 3000, 3, 10, 0, '2021-05-13 01:35:21', '2021-07-11 16:02:12'),
('A', 00004, 'Landbreeze寢室帳 Pro.4 (SD-644)', '4-6人大帳', '外帳／75D滌塔夫防撕裂布、PU塗層最低耐水壓1,800mm、鐵氟龍撥水加工、抗UV加工；內帳／68', '20210513033555.jpg', 'https://i3.mkgo.net/images/products/20210513033555.jpg', 1, 5000, 4, 5, 0, '2021-05-13 01:35:51', '2021-07-11 16:03:26'),
('A', 00005, 'Amenity Dome 寢室帳 S (SDE-002RH)', '輕便兩人組合', '情侶熱租組，適合兩人', '20210513033657.jpg', 'https://i3.mkgo.net/images/products/20210513033657.jpg', 1, 2500, 4, 10, 0, '2021-05-13 01:36:39', '2021-07-11 16:03:49'),
('A', 00006, 'Amenity Dome 寢室帳 M (SDE-001RH)', '經典大型寢室帳', '防潑水防風', '20210513033740.jpg', 'https://i3.mkgo.net/images/products/20210513033740.jpg', 1, 3000, 4, 5, 0, '2021-05-13 01:37:34', '2021-07-11 10:19:07'),
('A', 00007, 'Amenity Dome 寢室帳 L (SDE-003RH)', '經典大型寢室帳', '經典大型寢室', '20210513033740.jpg', 'https://i3.mkgo.net/images/products/20210513033740.jpg', 10, 5000, 0, 5, 0, '2021-05-13 01:38:11', '2021-07-11 10:18:57'),
('A', 00008, 'Snowpeak拱型帳 (SDE-080H)', '快速搭設，簡易速成', '特殊款', '20210513033848.jpg', 'https://i3.mkgo.net/images/products/20210513033848.jpg', 1, 3500, 4, 5, 0, '2021-05-13 01:38:40', '2021-07-11 16:05:12'),
('A', 00009, 'HD 六角蝶形天幕 Pro. 焚火內掛頂布 (TP-250IR)', '美型天幕，方便使用焚火台', 'HD 六角蝶形天幕 Pro. 焚火內掛頂布，可與TP-250，TP-250R，TP-265和TP-2', '20210513034012.jpg', 'https://i3.mkgo.net/images/products/20210513034012.jpg', 1, 1500, 3, 7, 0, '2021-05-13 01:40:03', '2021-07-11 16:06:40'),
('A', 00010, '焚火方形天幕帳 (TP-430)', '舒適與機能的最佳選擇', '人群聚集在露營場中央，舒適地圍著焚火，這就是露營的魅力 。', '20210513034046.jpg', 'https://i3.mkgo.net/images/products/20210513034046.jpg', 1, 1500, 4, 8, 0, '2021-05-13 01:40:36', '2021-07-11 16:07:03'),
('A', 00011, 'HD 六角蝶形天幕 Pro. (TP-250R)', '大型客廳帳，隨時分享', 'Living Shell 客廳帳 六角蝶形天幕 Pro.', '20210513034116.jpg', 'https://i3.mkgo.net/images/products/20210513034116.jpg', 1, 2000, 0, 5, 0, '2021-05-13 01:41:05', '2021-07-11 16:10:50'),
('A', 00012, '方形天幕 M (TP-841)', '全家大小最方便的選擇', '高度泛用性的長方形，具有多樣的搭營方式', '20210513034140.jpg', 'https://i3.mkgo.net/images/products/20210513034140.jpg', 1, 1200, 3, 2, 0, '2021-05-13 01:41:28', '2021-07-11 10:23:03'),
('A', 00013, '紗網客廳帳 (TP-925)', '新手入門最佳選擇', ' 入門級客廳帳全新改款，讓搭設更簡單！', '20210513034251.jpg', 'https://i3.mkgo.net/images/products/20210513034251.jpg', 1, 2000, 5, 10, 0, '2021-05-13 01:42:38', '2021-07-11 16:18:34'),
('A', 00014, '大地帳 Pro.L (TP-450)', '大空間需求最佳選擇', '多人活動最佳選擇', '20210513034558.jpg', 'https://i3.mkgo.net/images/products/20210513034558.jpg', 1, 4790, 4, 2, 0, '2021-05-13 01:45:44', '2021-07-11 16:19:00'),
('D', 00015, '焚火台M套裝組合 (SET-111)', '', ' Feature特色 享受火焰搖曳的魔力 - 焚火台', '20210513034739.jpg', 'https://i3.mkgo.net/images/products/20210513034739.jpg', 1, 600, 0, 5, 0, '2021-05-13 01:47:24', '2021-05-13 01:47:24'),
('D', 00016, '焚火台-M燒烤框架 (ST-033GBR)', '', '不鏽鋼', '20210513034826.jpg', 'https://i3.mkgo.net/images/products/20210513034826.jpg', 1, 200, 0, 5, 0, '2021-05-13 01:48:10', '2021-05-13 01:48:10'),
('E', 00017, '不鏽鋼真空保溫瓶M型350 原色', '', '不鏽鋼真空保溫瓶M型350 原色', '20210513034870.jpg', 'https://i3.mkgo.net/images/products/20210513034870.jpg', 1, 100, 0, 2, 0, '2021-05-13 01:48:54', '2021-05-13 01:48:54'),
('E', 00018, 'Low chair 吊掛杯架 (UG-282)', '', '不銹鋼、聚酯纖維', '20210513034941.jpg', 'https://i3.mkgo.net/images/products/20210513034941.jpg', 1, 50, 0, 15, 0, '2021-05-13 01:49:23', '2021-05-13 01:49:23'),
('F', 00019, '迷你戶外夜燈＂燈籠花果＂ 森林 ', '', '擁有可愛造型的多功能迷你夜燈', '20210513035020.jpg', 'https://i3.mkgo.net/images/products/20210513035020.jpg', 1, 500, 0, 10, 0, '2021-05-13 01:50:01', '2021-05-13 01:50:01'),
('F', 00020, 'GP自動點火小型瓦斯燈 ', '', '可單手掌握的輕巧主體、輸出80W光亮的微型夜燈', '20210513035057.jpg', 'https://i3.mkgo.net/images/products/20210513035057.jpg', 1, 200, 0, 5, 0, '2021-05-13 01:50:37', '2021-05-13 01:50:37'),
('B', 00021, '快速竹折和室桌S', '竹製輕巧圓桌', '桌板／竹集成材；腳架／耐酸鋁加工；支架／不鏽鋼；收納袋／尼龍', '20210513035141.jpg', 'https://i3.mkgo.net/images/products/20210513035141.jpg', 1, 200, 3, 12, 0, '2021-05-13 01:51:20', '2021-07-11 16:20:03'),
('B', 00022, 'Rack Sotto 多功能桌椅組 椅背 (LV-211)', '', '聚酯纖維帆布、鋁合金、合板、聚乙烯、聚縮醛', '20210513035169.jpg', 'https://i3.mkgo.net/images/products/20210513035169.jpg', 1, 200, 0, 3, 0, '2021-05-13 01:51:47', '2021-05-13 01:51:47');

-- --------------------------------------------------------

--
-- 資料表結構 `ptagmap`
--

CREATE TABLE `ptagmap` (
  `tmId` int(11) NOT NULL COMMENT '標籤索引編號',
  `tagId` int(11) NOT NULL COMMENT '標籤編號',
  `pId` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '物品編號',
  `obj` int(11) NOT NULL COMMENT '類別',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `ptagmap`
--

INSERT INTO `ptagmap` (`tmId`, `tagId`, `pId`, `obj`, `created_at`, `updated_at`) VALUES
(500, 1, '00001', 2, '2021-05-10 22:33:27', '2021-07-11 13:03:47'),
(501, 1, '00002', 2, '2021-05-10 22:34:11', '2021-07-11 11:30:21'),
(502, 1, '00003', 2, '2021-05-10 22:34:11', '2021-07-11 11:30:21'),
(503, 1, '00004', 2, '2021-05-11 23:42:22', '2021-07-11 11:30:21'),
(504, 1, '00005', 2, '2021-05-11 23:42:22', '2021-07-11 11:30:21'),
(505, 1, '00006', 2, '2021-05-11 23:42:51', '2021-07-11 11:30:21'),
(506, 10, '00007', 2, '2021-05-11 23:42:51', '2021-07-11 18:18:57'),
(507, 1, '00008', 2, '2021-05-11 23:43:22', '2021-07-11 11:30:21'),
(508, 1, '00009', 2, '2021-05-11 23:43:22', '2021-07-11 11:30:21'),
(509, 1, '00010', 2, '2021-05-11 23:43:51', '2021-07-11 11:30:21'),
(510, 1, '00011', 2, '2021-05-10 22:19:45', '2021-07-11 11:30:21'),
(511, 1, '00012', 2, '2021-05-10 22:19:45', '2021-07-11 11:30:21'),
(512, 1, '00013', 2, '2021-05-10 22:20:17', '2021-07-11 11:30:21'),
(513, 1, '00014', 2, '2021-05-10 22:20:17', '2021-07-11 11:30:21'),
(514, 1, '00015', 2, '2021-05-10 22:20:56', '2021-07-11 11:30:21'),
(515, 1, '00016', 2, '2021-05-10 22:20:56', '2021-07-11 11:30:21'),
(516, 1, '00017', 2, '2021-05-10 22:21:15', '2021-07-11 11:30:21'),
(517, 1, '00018', 2, '2021-05-10 22:25:17', '2021-07-11 11:30:21'),
(518, 1, '00019', 2, '2021-05-10 22:31:23', '2021-07-11 11:30:21'),
(519, 1, '00020', 2, '2021-05-10 22:31:23', '2021-07-11 11:30:21'),
(520, 1, '00021', 2, '2021-05-10 22:31:56', '2021-07-11 11:30:21'),
(521, 1, '00022', 2, '2021-05-10 22:31:56', '2021-07-11 11:30:21'),
(522, 1, '00023', 2, '2021-05-10 22:32:23', '2021-07-11 11:30:21'),
(523, 1, '00024', 2, '2021-05-11 23:43:51', '2021-07-11 11:30:21'),
(524, 1, '00025', 2, '2021-07-11 01:36:35', '2021-07-11 11:26:57');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cat_id` (`cat_id`);

--
-- 資料表索引 `productlist`
--
ALTER TABLE `productlist`
  ADD PRIMARY KEY (`product_id`);

--
-- 資料表索引 `ptagmap`
--
ALTER TABLE `ptagmap`
  ADD PRIMARY KEY (`tmId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `productlist`
--
ALTER TABLE `productlist`
  MODIFY `product_id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '商品編號', AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `ptagmap`
--
ALTER TABLE `ptagmap`
  MODIFY `tmId` int(11) NOT NULL AUTO_INCREMENT COMMENT '標籤索引編號', AUTO_INCREMENT=5057;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
