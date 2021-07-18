-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-07-18 16:23:21
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
-- 資料表結構 `placeinfodesc`
--

CREATE TABLE `placeinfodesc` (
  `placeDescId` int(11) NOT NULL COMMENT '營區編號',
  `altitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '海拔',
  `feature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '營區特色',
  `bathroom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '衛浴配置',
  `wlComm` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '無線通訊',
  `pet` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '攜帶寵物',
  `equipment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附屬設施',
  `service` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附屬服務',
  `parking` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '停車方式',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `placeinfodesc`
--

INSERT INTO `placeinfodesc` (`placeDescId`, `altitude`, `feature`, `bathroom`, `wlComm`, `pet`, `equipment`, `service`, `parking`, `created_at`, `updated_at`) VALUES
(1, '300m以下', '團露大草皮 釣魚 可停露營車 有遊戲設施', '分區浴廁', '中華電信有訊號 遠傳有訊號 台哥大有訊號', '可攜帶寵物 需注意清潔', '溪邊/水庫釣魚 玩沙池 生態池 販賣部/販賣機 餐點/咖啡 冷藏 飲水機 吹風機', '四季採果 週邊賞螢', '可下裝備後，集中停車', '2021-07-15 20:43:36', '2021-07-15 20:43:36'),
(2, '501-800m', '小包區 有雨棚 可停露營車 有遊戲設施 旅遊基地/景點 近溪流', '親子衛浴 分區浴廁 澡盆/水桶/水瓢 沐浴髮品 附廁紙', '中華電信有訊號 遠傳有訊號 台哥大有訊號 台灣之星有訊號', '可攜帶寵物 需注意清潔 需加鍊綁著，或放置籠內 帳內/室內禁止寵物', '戲水池 玩沙池 冷凍 冷藏 吹風機 脫水機 洗衣機 季節賞花', 'DIY活動', '車停營位旁', '2021-07-15 20:45:26', '2021-07-15 20:45:26'),
(3, '501-800m', '團露大草皮 小包區 有遊戲設施 有雲海 有夜景', '分區浴廁', '中華電信有訊號 遠傳有訊號 台哥大有訊號 亞太有訊號 台灣之星有訊號', '可攜帶寵物 需注意清潔 需加鍊綁著，或放置籠內', '戲水池 玩沙池 滑草區 冷凍 冷藏 吹風機', NULL, '車停營位旁', '2021-07-15 20:47:11', '2021-07-15 20:47:11'),
(4, '301-500m', '小包區 有雨棚 可停露營車 有夜景', '分區浴廁 澡盆/水桶/水瓢 洗澡椅 沐浴髮品 附廁紙', '中華電信有訊號 遠傳有訊號 台哥大有訊號', '可攜帶寵物 需注意清潔 需加鍊綁著，或放置籠內', '戲水池 冷凍 冷藏 吹風機 鞦韆', '食材代訂/直配', '車停營位旁 可下裝備後，集中停車', '2021-07-15 20:50:39', '2021-07-15 20:50:39'),
(5, '501-800m', '團露大草皮 免裝備露營 有遊戲設施 有雲海', '集中浴廁 澡盆/水桶/水瓢 洗澡椅 附廁紙 男女浴廁分開', '中華電信有訊號 台哥大有訊號', '可攜帶寵物 需注意清潔 需加鍊綁著，或放置籠內 帳內/室內禁止寵物', '玩沙池 護草墊 冷凍 冷藏 吹風機 彈跳床', '週邊賞螢 週邊採草莓', '車停營位旁 提供推車', '2021-07-15 20:52:11', '2021-07-15 20:52:11'),
(6, '301-500m', '小包區 免裝備露營 近溪流', '集中浴廁', '中華電信有訊號', '可攜帶寵物 需注意清潔 需加鍊綁著，或放置籠內 帳內/室內禁止寵物', '烤肉區 冷凍 冷藏 吹風機 季節賞花', '生態導覽 四季採果 甜柿季 營區賞螢 食材代訂/直配 季節農特產', '集中停車 車輛禁止上草皮', '2021-07-15 20:53:19', '2021-07-15 20:53:19'),
(7, '801-1000m', '小包區 免裝備露營 可停露營車 旅遊基地/景點', '分區浴廁', '有wifi 中華電信有訊號', '不可攜帶寵物', '玩沙池 冷藏', '四季採果 週邊賞螢 營區賞螢 食材代訂/直配', '集中停車 車輛禁止上草皮', '2021-07-15 20:54:27', '2021-07-15 20:54:27'),
(8, '301-500m', '團露大草皮 小包區 可停露營車 有遊戲設施', '親子衛浴 集中浴廁', '中華電信有訊號 遠傳有訊號 台哥大有訊號', '可攜帶寵物 需注意清潔 需加鍊綁著，或放置籠內 需要事先告知營主', '戲水池 玩沙池 護草墊 冷凍 冷藏 吹風機 溜滑梯 鞦韆', '部落導覽', '車停營位旁 集中停車', '2021-07-15 20:55:38', '2021-07-15 20:55:38');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `placeinfodesc`
--
ALTER TABLE `placeinfodesc`
  ADD PRIMARY KEY (`placeDescId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `placeinfodesc`
--
ALTER TABLE `placeinfodesc`
  MODIFY `placeDescId` int(11) NOT NULL AUTO_INCREMENT COMMENT '營區編號', AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
