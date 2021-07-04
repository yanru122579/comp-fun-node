-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-07-03 13:20:40
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
-- 資料表結構 `articlelist`
--

CREATE TABLE `articlelist` (
  `aId` int(11) NOT NULL COMMENT '文章編號',
  `aTitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章標題',
  `aImg` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章配圖',
  `author` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者',
  `aContent` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '內文',
  `aCategoryId` int(11) NOT NULL COMMENT '文章分類編號',
  `aCommentId` int(11) NOT NULL COMMENT '留言編號',
  `aTagId` int(11) NOT NULL COMMENT '標籤編號',
  `aDate` date NOT NULL DEFAULT current_timestamp() COMMENT '發布日期',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章列表';

--
-- 傾印資料表的資料 `articlelist`
--

INSERT INTO `articlelist` (`aId`, `aTitle`, `aImg`, `author`, `aContent`, `aCategoryId`, `aCommentId`, `aTagId`, `aDate`, `created_at`, `updated_at`) VALUES
(3, '登山、露營再不是難事！野外露營、探險知識一次學會！', 'item_20210628154131.jpg', 'T小編', '冒險是什麼呢？就字面上的意義來講，指的是冒著危險的意思。借字典上的解釋來說，則是指刻意去做不確定是否能成功的事。雖然不清楚自己接下來做的事會成功還是失敗，卻依然鼓起勇氣去嘗試的意思。話雖如此，這並不是叫我們冒著生命危險，去做別人沒做過的事。在採取行動之前，我們必須慎重的擬定計畫，做好完善的事前準備，盡可能避開危險才行。在你能做到這些之後，遇到剩下的1%無法預期的危險時，便要勇敢地去面對它，這才是所指的冒險。\r\n　　\r\n第一次離開父母身邊獨自旅行、第一次去參加露營……那種心中充滿不安與期待的感覺，大家應該都記得很清楚吧。萬一發生什麼意外該怎麼辦？心情始終平靜不下來。這種心跳加速的感覺，不論經歷多少次的冒險都不會消失。正因為有這顆興奮的心，我們才會做好避免失敗的準備；當冒險過程順利時，我們也才會感到格外開心。本文分享了野外生活的必要事項，包含步行、飲食、睡覺、面臨危險的應對方式等，製作讓野外生活更有趣的遊玩器具，以及和動物、植物的接觸。只要學會了這些，就可以說完成了99％的準備。剩下的就是帶著勇氣出發。\r\n　　\r\n野外是一個自由自在的空間，沒有所謂的時間分配。在你能盡情享受毫無拘束的同時，也必須自己承擔所有行動的責任。人生就是一場冒險。既然有快樂的事，當然也會有出乎意料的事。在野外體驗到的所有事情，不論是在自己出了社會之後，或者在自己的人生歷程當中，對你一定都大有幫助。\r\n背包的裝法\r\n \r\n輕的東西在下面，重的東西在上面\r\n感覺好像有點相反，但在揹行李時，重的東西要放在上面。如果把重的東西放在下面，那身體就會往後仰，使我們在向上或下爬時，身體都會呈現前彎的姿勢。所以要把重的東西放在較高的位置，這樣它的重量就會分布在腳上了。\r\n \r\n利用袋子，把東西依種類分開\r\n 背包是個很大的袋子。如果把什麼東西都塞進裡面，要拿出來時就會很難找。動動腦筋吧。把食物、食器、衣物、藥⋯⋯各自放進不同的袋子裡，就能把東西分裝成好幾小包了。準備好一些棉布袋、塑膠袋後，將物品分別放進去。替換衣物最怕溼掉，所以就放進塑膠袋，而棉布製的袋子，最適合拿去裝柔軟易壞的東西。棉布袋用舊的內衣做就可以了。\r\n \r\n易受損物品的裝法\r\n 接下來，讓我們來分裝容易受損的物品和不容易受損的物品吧。相機、手電筒、食物中的蛋，都是一撞到就很容易壞掉或碎掉，這些物品要放在上面，然後在下面放入輕而龐大的東西，像是睡袋或衣物。接著再依序放入食器、爐子、食物。重物與容易受損的物品之間，必須塞進布或紙等當成緩衝墊。手電筒要確定它的電源開關不會鬆動，以免電源隨著背包搖晃而開啟，等抵達目的地後才發現電池已經沒電。把電池方向裝反，或在中間夾紙進去都可以。東西裝好後試著揹揹看，確認左右的重量是否相等。這就是最後的檢查了。', 3, 0, 0, '2021-05-07', '2021-05-04 12:17:53', '2021-07-02 18:01:26'),
(4, '從營地到野地，帶你體驗露營的不同樂趣', 'item_20210511154757.jpg', 'D小編', '遠離都市塵囂、返回大自然懷抱，無論是營地露營或是更具挑戰性的野地露營，與大自然共處的每一個時刻與景色，都令人備感療癒。營地有平整的水泥或草坪鋪地，以及齊全的水電與浴廁設備，很適合全家親子共遊或好友歡聚。而野地露營（簡稱「野營」）則多在沒有水電浴廁的山林或海邊，自行尋找紮營地點，撿拾林木生火野炊，是追求更自然原始的探險體驗。\r\n\r\n一直以來我都非常幸運，有機會可以學習、珍惜、培養我對戶外活動的認識及熱愛，這點令我感到滿心歡喜。我還記得那些黎明時分，看著太陽從地平線升起，聽著身旁的野生動物逐漸甦醒的聲音。我獨自一人在偏遠的鱒魚河畔，享受溫暖的營火及咖啡，這樣的時刻正如心靈的神奇解藥。有時候，對於那些聽到雁群嘎嘎飛過而不知抬頭望向天空的人，我為他們感到惋惜。在我聽來，雁鳴確實有如音樂般美妙。\r\n\r\n正因為如此，這本書的目標想同時針對有經驗的露營者及新手露友，讓他們不管在林間或水邊，都能有更豐富的活動體驗。這本書不是寫給那些到了露營地，卻總待在車子裡，未能再向外探險的露營者。身為一名獵人、釣友和露友，我常常大膽離開現有步道去探險，希望能發現尚未有其他足跡走過的地方。\r\n\r\n露營必備基本功 × 野營進階秘技 × 急救處理法，讓你的露營技能全面升級。請勿選擇低於地下水位的漥地或溪谷紮營，確保高度才安全；將營繩綁在一綑枝條上再埋進地裡，就能取代營釘；乾燥紙張、揉成一團的雜草和樹脂，都是好用的火種；地面被雨水浸濕時，用樹葉、石頭或樹枝搭建基底便能順利生火；出發前一晚，在保冷箱裡放幾袋冰塊讓內部冷卻，可以使冷度維持更久；被蜜蜂螫到時，用小蘇打粉調成糊狀冷敷可減輕疼痛。', 4, 0, 0, '2021-05-07', '2021-05-04 12:18:38', '2021-07-02 18:01:32'),
(6, '第一次親子健行好好玩！新手家庭也能輕鬆入門', 'item_20210628102454.jpg', 'O小編', '台灣有70%是山，在你家附近一定有幾條郊山步道，其實登山健行沒有那麼難，就是找家裡附近的步道去走走！再也不怕孩子放電沒處去！又放假了！到底要去哪裡遛小孩？！百貨？遊樂場？公園？還是宅在家？試試看出門健行吧！讓孩子的童年不受限！運動╳遊戲╳教養一魚多吃的趣味旅行。不必花大錢、就近出發，給孩子一生最棒的禮物，在大自然中學習獨立、自信與毅力。\r\n\r\n一向喜歡大自然的我們，3年多前首度嘗試露營後，就這麼帶著三小一頭栽進了露營生活裡，在什麼都要自備的狀況下，全家人一起準備、出發、搭帳、收拾，回到家還需要花時間的清潔、收納擺放；在充滿生態的大自然中體驗生命教育、在搭帳及煮食的過程中體驗平日父母的辛勞，藉此促進親子互動、累積回憶情感，並在露營中學習人際互動、學會尊重他人，這些所附加的人生課題，是在平時生活中與學校課堂上所沒教的事呢！\r\n \r\n像大家都說雨天不適合露營，但我常喜歡藉著雨天露營讓孩子去體會逆境的不愉快（雖然收濕帳很累人，但收久也有經驗了）、學習情緒的處理與心境的轉換。還記得在福壽山露營時的午後，天幕外下著傾盆大雨，無處可去的我們只能落寞的待在天幕下等雨停，此時我故意的問孩子們：「我們來露營碰到下雨了怎麼辦？」，孩子們不減興致的回我：「沒關係！我們來吃下午茶吧！」。俗語說「山不轉路轉，路不轉人轉，人不轉心轉」的體驗竟然是這麼容易，那時的我發現到，原來孩子在無形當中其實都有在內化成長，更勝我們的碎念嘮叨。\r\n \r\n而我們也因此正好搭上了這波露營風潮的起始，細數這3年多超過80露的露營生活中，我們見證了露營裝備的精進興盛，以及新營地在全台各地的雨後春筍，因此這本書的核心概念，主要是給剛踏入露營的新朋友們，首先有個最真誠、最實在的建議與資訊，不要因為潮流或美好的一面而盲從踏入、也不要因為既定的刻板印象，而放棄了與大自然分享人生的機會；也希望已身為露友的我們，在挑選營地時能更重視自然生態，將人為開發對自然的影響減到最低，用行動支持真心對待台灣這片土地的好營地。', 5, 0, 0, '2021-05-07', '2021-05-05 09:51:37', '2021-07-02 18:01:38'),
(7, '出發台灣山林：新手也能走，從里山到深山的步道小旅行', 'item_20210628102405.jpeg', 'X小編', '台灣是山之國度，超過260座3000公尺以上高山貫穿脊梁，300多條長長短短的步道羅織成網，刻寫島嶼的歷史脈絡，串連隨海拔高度改變的動植物。自古以來，山林就是生活的一部分，以雙腳閱讀台灣，看見台灣的美，翻開島嶼的立體故事。\r\n\r\n精選全台各地28條步道，帶領新手從淺山走進深山，包含都市近郊的自然綠地、與先民生活息息相關的里山古道、原住民族的傳統領域、以及適合初心者的百岳，由編輯實地採訪，挖掘熱門路線的故事，探尋山野秘境的傳說。放下手機出發吧！走進山林，抬頭沐浴穿過葉縫的陽光，閉眼傾聽森林的聲音，大口呼吸空氣中的療癒清新，你也會瞬間愛上這道啟動五感的山野味。\r\n\r\n說走就走淺山行14+：\r\n剛剛好的陽光，換雙舒適好走的鞋子就出發。鄰近都市的郊山隱藏綠色秘境，溪流瀑布清涼消暑，箭竹草坡渲染層層疊疊的抹茶綠，險峻岩場驚險刺激，古道石橋尋找閩南人與客家人遷徙生活的痕跡，走進山林原來這麼容易！\r\n\r\n深山部落森之道9+：\r\n跟隨原住民的腳步深入傳統領域，踩踏柔軟的松針地毯，探訪雲霧圍繞的巨木紅檜，穿梭針闊葉混合林，學習野外求生訣竅，翻山越嶺尋找氤氳野溪溫泉，山野森林是神話的起源、是獵場，也是回家的路。\r\n\r\n挑戰三千公尺的視野3+：\r\n呼吸高海拔的純淨空氣，揭開台灣百岳的奇、險、峻、秀。只要稍加鍛鍊，百岳也並非高不可攀，不再羨慕朋友臉書中帥氣的攻頂照片，做好準備就勇敢出發吧！\r\n健行/登山裝備檢查表：\r\n複印之後隨身帶著走！每次出發前檢查一次，登山不再怕忘記帶裝備。', 4, 0, 0, '2021-05-07', '2021-05-05 09:51:58', '2021-07-02 18:01:45'),
(8, '帶你走進大自然，用美食向美景致敬！', 'item_20210628101716.jpeg', 'S小編', '野炊，可不只是泡麵、火鍋而已！軟嫩入味的米蘭番茄燉牛肉、切開滿是肉汁的巴西森巴串烤、吸收大海精華的西班牙海鮮燉飯……這些，都可以用一口鍋子，在野外輕鬆搞定！\r\n\r\n隨著外景節目跑遍臺灣北中南東的鄉野山林，不論上山下海，都一肩扛起劇組伙食大任的主廚Max，為了克服設備和保鮮上的困難，在營地、高山上端出不輸景色的垂涎美食，他用最常見的平底鍋、燉鍋、烤肉爐設計「單一鍋具」菜單，並發揮廚師專長，研究出一套「簡單、方便、更好吃！」的野炊密技──1. 善用「預前調理」→ 將食材、調味料最少化，利用醃製延緩食材變質。2. 聰明「簡化烹調」→ 省略繁雜工序，將食材像調理包般依序加入鍋中即完成。3. 變化「延伸吃法」→ 一道菜兩種吃法，增加豐富度和樂趣，多煮也不怕浪費。今天起，跟著行家的腳步，一起體驗全新的野炊樂趣！從澎湃主菜、飽足主食、暖胃湯品到網美甜點，全部一鍋完成。\r\n\r\n戶外也做得出來的神級美味：\r\n野炊要方便，卻不能犧牲味道！Max主廚將「廚師專業」結合「野炊經驗」，活用食材特性、烹調方式縮短時間、工序，例如用快熟的豬頸肉取代豬腳，把「餐廳級料理」的德國水煮豬腳，簡化成「戶外版本」的水煮豬頸肉，丟進水裡煮一煮，就完成沒想過露營也吃得到的豪華美味！\r\n\r\n減少野地限制的事前備料法：\r\n戶外不像家裡廚房，有各種設備和調味料。但只要前一天在家中，依照食材種類、食譜步驟進行事前醃製、備料，到現場後就能像調理包般輕鬆加入鍋中。不但大幅縮短烹調時間，還可以延長食材保鮮，而且不用帶一堆瓶瓶罐罐，豐盛的野炊料理即刻開動。\r\n\r\n1+1大於2的美味延伸吃法：\r\nMax主廚獨創野炊吃法2.0，用創意小變化，讓一道菜變成另一道精彩的美味！把吃到一半的新德里咖哩雞做成北海道湯咖哩，或是吃不完的森巴串烤撕碎和優格醬一起夾入熱狗麵包，隔天就有神好吃的牛肉沙威瑪當早餐！再也不用擔心煮好的菜吃不完，還能隨時變換口味。\r\n\r\n符合野炊需求的超貼心規劃：\r\n野炊不想掃興，最重要的就是出發前的準備！從行李、場地的確認，到依照人數、設備做好菜單安排、食材保鮮，Max主廚幫你逐一做好規劃！每道料理也細心標註使用鍋具、食用人數和烹調時間，不論是小家庭還是大聚會，都能依照需求挑選菜單。\r\n\r\n結合在地食材的台灣好滋味：\r\n寶島台灣四面環海、風和日麗，擁有許多富饒的山海產。本書中收錄許多Max主廚走遍台灣，運用當地特產發想出的料理，苗栗水梨雞湯、新社菇菇炊飯、日月潭水煮魚……只要在抵達營地前順道購買在地盛產食材，不用多餘調味，就是完美發揮食材特質的驚豔台灣味。', 3, 0, 0, '2021-05-07', '2021-05-05 10:50:34', '2021-07-02 18:01:15'),
(10, '愛好大自然、以童心為原動力，怎麼帶你玩戶外活動？', 'item_20210628101929.jpeg', 'B小編', '不是因為年紀大了才出來遊山玩水，而是不出來遊山玩水，所以才會變老！無論是什麼事物，只要持之以恆就會成為力量，能辦到的情增加了，樂趣也會隨之增加。不要過於在意身分證上的年齡，因為是否持續懷抱好奇心、樂觀正向地享受人生，才是衡量一個人年輕與否的指標啊！\r\n　　\r\n席捲網路、讓年輕人為之驚嘆的超人氣「戶外活動型爺爺Youtuber」──「winpy-jijii」將親身和各位分享他獨到的樂活哲學。將「人生就是戶外活動，戶外活動就是人生」與「對分析物品結構與DIY懷抱濃厚興趣」等信念作為自己品味人生、暢遊各式活動的豐沛動能，讓今年已經70多歲的他，依舊滿懷童心，盡情探索且嘗試各種嶄新事物。對生活少了好奇心，即使年輕也蒼老。看了jijii老爺爺的《我的露營人生》這本書，雖然好像是本露營工具書，但卻是一本十足激勵人心的心靈雞湯，字裡行間讓人血脈賁張，恨不得趕快拿起工具來DIY，瞬間燃起對生活與生命的樂趣。看完這本書，原來露營不是只是帶個帳篷、睡袋就完成的小事，而是集結許多生活瑣碎小知識的大樂事啊。露營是種對人生的生活態度，可以選擇激情，可以選擇優雅，不管選擇如何？用自己最舒服的方式去享受這一切吧！「我的露營人生Life is Camp」，看完滿滿的感動，期待自己也能跟網紅老爺爺一樣，用熱情去選擇自己想要的生活！', 5, 0, 0, '2021-05-07', '2021-05-05 12:13:17', '2021-07-02 18:01:03'),
(11, '山林癒：沐浴山林擁抱樹木，借助大自然力量自我療癒', 'item_20210628101753.jpg', 'L小編', '一起走進山林，來抱樹吧，發現樹療和森林浴的美好益處！2019/10/21台灣山林全面開放，安全享受山林前，先認識森林浴、樹療法和山林如何治癒身心！\r\n\r\n「重新與自然連結有助於建立深層的平衡和幸福感，尤其是它能減少壓力。我發現森林恢復了我的寧靜，改善了我的健康。閃閃發光的辦公室和引人入勝的樹木之間，有著巨大的差別，有時讓我覺得自己像是穿著西裝的現代德魯伊僧侶，只不過我在週末的時候不會搭上披肩長袍，而是換上健行運動鞋！幸福就在大自然中，我就是因為這原因而成為樹療師：和你一同分享風景的美，不是為了把它拍下來好放到Instagram，而是盡情享受眼前的這一刻。我想以你手上這本書訴說我的經驗、我和樹木不可思議的相遇，它們帶給我什麼，以及這些能為你帶來什麼。我們巨大而沉默的樹木朋友，堅毅地跨越不同的世代，和那些知道如何仔細聆聽的人，分享它們的寶藏。」\r\n\r\n讓我們懷著熱情與好奇心，跟著作者走進美麗的森林，探索帶著神話色彩的山峰與深藏不露的山谷、原始森林和特有物種、在地族群與少數民族、文化及專業知識……在鬱鬱蔥蔥的樹叢與簌簌顫動的枝葉圍繞中，跟隨他的指引，認識30種具有樹療功效、植物療法及嫩芽療效的重要樹種，與樹林神奇的力量連接在一起，讓尋求減輕壓力、緩解病症、恢復元氣、重新與大自然連結的人，認識山林的力量，從樹木為我們提供的驚人治癒力中受益！', 5, 0, 0, '2021-05-07', '2021-05-05 13:15:19', '2021-07-02 18:02:01'),
(12, '～運用先人的智慧結晶，展開一場現代冒險旅程～', 'item_20210511171158.jpg', 'Ready', '「體驗在真正的野外環境中過夜，能幫助你找回在安心舒適的現代社會中學不到的想像力及判斷力，並使人更加成長。」你是否在繁忙的日常生活中感到焦慮？是否在網路上接收了過量的訊息而無法思考？每天手機的LINE提示音響不停？彷彿被世界追著跑，沒有片刻的安寧。我們的祖先一開始是在野外生活，並且延續了好幾個世紀，因此人類的某些習慣應該不是如此輕易就會被遺忘的。看著火堆中的熊熊火焰會讓人內心感到平靜，就是因為這幅過去看到過的景象有如本能般保留在了體內。\r\n\r\n所以，上山吧。在山林間不需要考慮太多事情，只需專注於手邊的工作。著手搭建營地、生火、煮食，只為了今天的生存而努力，還能得到滿滿的成就感。\r\n有幾項原因促成我決定搬到信州定居，其中最重要的，就是關東近郊沒有地方能讓我從事野外活動。舉例來說像是用斧頭或刀子劈柴，然後生火野炊，光是要這樣就非常困難。當然，信州也不是到處都能隨意做這些事，但相較於大都市，至少還有這樣的地方。值得感激的是，許多地主都能夠理解野外活動並提供善意，讓我在他們的土地上砍樹、生火。我想有些人可能還是全家一起住在那裡的，多虧了在地民眾於公於私都大力提供協助，我才能夠持續從事野外活動至今。\r\n\r\n歸根究底，現代日本仍保留了在野外焚火的地域文化，是我能夠完成本書的重要因素。中信地方（譯註：長野縣西部一帶）的民眾會在一月十五日收集新年期間裝飾家中的松樹、注連繩、不倒翁等，製作成巨大的圓錐狀焚燒物，在各地公園、廣場焚燒，進行名為三九郎的送神儀式，場面非常壯觀。舉行儀式的地點周圍當然都是住宅區，焚燒時濃煙密布，下風處的住家更是首當其衝，但沒有人對此發出怨言。\r\n\r\n我的故鄉山形縣也有一項名為煮芋頭大會的活動，民眾會在河邊用大鍋子當場煮起芋頭，是當地盛大的豐收祭典，同樣也沒有人抱怨這樣會汙染河川。或許因為這是自古以來與地方密不可分、每年都會舉辦的活動，所以大家從小就自然而然地當成了生活的一部分吧。進行野外活動有一項不可或缺的要件，就是當地人對於用火這件事抱持寬容的態度。具備這項條件之後，才有辦法施展各種用火及刀具的知識和技術。\r\n\r\n常有人問我野地生活技藝方面的問題，其中又以小刀等刀具相關的問題居多。換個角度想，可見原來有這麼多人有意在這方面做嘗試。我認為，在如此便利的時代，想要特地體驗生火、野營的不便，並不是什麼奇怪的事，其實大家心裡都有這樣的渴望。', 4, 0, 0, '2021-05-07', '2021-05-05 13:15:38', '2021-06-28 12:59:07'),
(13, '野外技能補完手冊：從輕量化裝備、行進技巧、戶外炊煮、營地工藝到辨識危險', 'item_20210628102008.jpeg', 'LISA', '現代社會的壓迫讓我們許多人都無法當真正的自己，踏進荒野讓我們可以暫時從這一切解放出來。荒野裡的時光有真實的價值。也許我們可以發掘出多一點真實的自我，或許我們會看到生命不止如此，還有更多美好的東西。\r\n\r\n但踏進荒野不只是換上登山鞋，揹上背包，走進山中那麼簡單。那還包括一系列憑自己的力量，在野外好好生存的方法、智慧，以及格調。沒有野外技能，只帶著手機上山，出了事就打電話求救，是無法接受的。\r\n\r\n方法是：知道自己在戶外時，需要哪些裝備、怎麼讀地圖、怎麼搭帳篷、怎麼炊煮。\r\n\r\n智慧是：有辦法判斷下雨時，自己適合穿雨衣、風衣，還是風雨衣。知道睡袋的最佳溫度取決於自己的代謝率，睡袋上的標示和別人的使用評鑑都只是有用的參考。智慧讓我們得以建立自己的系統，知道如何做到輕量化，揹得輕鬆愉快，但該帶的東西還是一件都不少，甚至還能在山上做出熱騰騰的麵包。知道什麼裝備能讓自己最舒服、怎麼前進最有效率、怎麼解決棘手的行進及露營問題。\r\n\r\n格調是：格調是一切。但這裡講得不是時尚，而是你怎麼行動、表現、過野外生活。格調是，當其他人都又濕又冷、邊走邊抖時，自己卻一身乾燥溫暖。格調是，在走了十公里才發現走錯路後，依然保持正面的態度。格調是，懂得尊重在步道上碰到的其他人和其他野外生物。就是這些，決定了什麼是優秀的戶外人。\r\n\r\n選擇營地：\r\n尋找營地時，要注意的第一件事情就是當地的規定。許多地方不准在步道或水源的60公尺內紮營。各地都有不同規定，最多人造訪的地方（國家公園、熱門的野外景點等等）有最多的規定。步道口都會有這些規定的告示牌，進入步道之前要先留意。\r\n \r\n接著，我試著找隱蔽的營地，以免防礙別人享受風景，我也比較不會看到其他人。找展望好的營地沒問題，誰不喜歡看到太陽在群山間落下呢？但也沒必要把帳篷紮在所有人走過都看得一清二楚的地方。到樹叢邊緣或是稜線旁而非稜線上紮營吧！我也曾經看過有人在步道上紮營，我懷疑他們可能會讓孩子在大馬路上玩。', 3, 0, 0, '2021-05-07', '2021-05-05 13:16:18', '2021-06-28 16:20:09'),
(14, '女子露營休日，裝備x穿搭x美食x行程，一次搞定！', 'item_20210628104614.jpg', 'Rach', '教妳用最基本的露營裝備，不用耗費過多體力與心力，就能和姊妹們一起「露營趣」！用最基本的裝備，和姊妹們一起享受美好的休日時光！生命就該浪費在美好的事物上，而時間就該與好閨蜜一同度過。\r\n\r\n我從小在北海道成長，對我來說，「森林活動」就是每天生活中的一部分。從小就在森林裡遊玩的我，喜愛森林裡的一切，走在林間小徑時，都幻想自己是童話繪本裡的女主角……。長大成人後，森林仍像我的第二個家。青綠的樹木或植物、蔚藍的天空、清涼的溪水這些由身體感受而來的記憶，讓我在森林裡非常的安心。近幾年來，露營活動盛行我也常和朋友們一起去露營，能夠感受大自然的擁抱最棒了！某天，我的露營夥伴不經意地說：「露營只能有一種風格嗎？好想試試看『女孩風』的露營喔～」聽到這些話時，我腦中忽然閃過好多想法。有些人認為露營是專屬於男性或是親子的活動，但其實就算是女生，也可以和姐妹們來場露營派對。我試著整理出女孩們在準備露營時會碰到的問題，並一一提出解決方案：\r\n\r\n露營裝備好重？找到在體力與功能間取得平衡的裝備，並知道打包技巧就沒問題！\r\n不知道要帶哪些衣服？只要掌握穿搭原理，就能穿得時尚，又能享受大自然！\r\n露營要玩什麼？安排簡單的玩樂行程，準備簡單美味的食物，就能辦場戶外派對！\r\n大家的帳棚都長得一樣，好無趣？只要準備幾個小物品，就能營造專屬自己的露營風格！\r\n', 2, 0, 0, '2021-05-07', '2021-05-05 13:16:43', '2021-06-28 16:46:14'),
(15, '平底鍋登山露營食譜', 'item_20210628104655.jpeg', 'Tom', '登山料理，讓登山或山上露營更為豐富與多彩。為了避免一邊登山一邊背負重物，導致過度消耗體力，登山者必須仔細挑選烹調鍋具，並謹守食材準備的原則，才能享受登山樂趣，並且吃得飽又巧。在烹調登山料理的諸多器具中，平底鍋極受登山界人士肯定，尤其是登山專用的小型平底鍋；只要準備1個材質佳的輕量平底鍋，幾乎所有料理都能烹調，是最實用的登山入門鍋具。除了煎烤、炒的基本功能，就連烹煮米飯、麵類等主食，以及鍋類料理都難不倒它。平底鍋導熱性佳、烹調效率高，熟練用法與技巧之後，就能隨心所欲變化出多種不同料理，CP值超高，可說是登山露營的萬用鍋。\r\n\r\n文章中的料理以「1個平底鍋製作」為主題，收錄各地山友實作之食譜精華，兼具美味及實用性。這些料理的重點在於「做法超簡單」、「使用輕量易保存」和「風味多變」，專為登山露營量身打造。每道料理中，一併提供適合的登山行程、飲食型態的小圖示標記，更易閱讀，料理新手也能駕輕就熟。此外，登山達人也不吝分享「不需用火的塑膠袋下酒菜」和「折疊湯杯料理」實用私房食譜，讓菜色更多元。除了食譜之外，經驗豐富的山友們還傳授器具挑選的訣竅、調理技法和烹調小建議，以及四天三夜平底鍋登山菜單規劃，仔細閱讀，可省下許多盲目摸索的時間。喜愛登山、露營的朋友們，別再因「隨便吃輕量即食包」，還是「背負重食材」而左右為難了。選個優質平底鍋，挑好適合的食材，讓登山露營料理更豐盛、營養。', 2, 0, 0, '2021-05-07', '2021-05-05 13:17:00', '2021-06-28 16:46:55'),
(21, '超輕量登山野營技巧：10天食物加上裝備不到12公斤！', 'item_20210628104724.jpg', 'A小編', '輕量化意味著要犧牲旅程的舒適與安全？輕量化裝備都很貴？背超輕就能走超快，能走超快就多了很多仔細欣賞山林、觀賞花朵、融入自然的餘裕。背超輕就有餘裕仔細辨識叉路、融入環境，理當能減少迷途的狀況。背超輕就能提高機動性，能更準確控制腳的落點，減少跌倒甚至墜崖的風險。更進一步深入超輕量登山的讀者，應當能體會這跟獵人上山是很類似的經驗，以最少量的裝備與大自然進行最深的交流，希望這最終會帶領您擁有超輕量碳足跡的人生。還記得與朋友走在阿帕拉契山徑時，很容易認出這些全程徒步者，他們的背包很小，食物多半是只要加熱水的乾燥糧，爐頭是用半個可樂鋁罐做成的酒精爐，我捧在手上端詳，連個噴嚏都不敢打，生怕它飛走。但最讓我狐疑的是鞋子，不是傳統的高筒登山鞋，而是輕量的越野跑鞋。他們背上的包袱輕，腳上的負擔少，一路健步如飛，眼光總是向前看，很少往腳下看。\r\n\r\n那時我才剛踏進戶外領域，總覺得在岩石路徑多的賓州段，不穿高筒登山鞋一定很容易扭傷腳踝，很納悶他們怎麼可以只穿越野跑鞋？直到多年後才領悟，當負重輕，能掌握自己的步伐，自然不需要笨重的登山鞋。\r\n\r\n看多那些人的奇異行為後，因為好奇我上網閱讀輕量化論壇和達人的部落格文章，想了解輕量化究竟是怎麼回事，結果看到的多半是對一克兩克斤斤計較，比如把牙刷斷柄，把牙膏擠出來在太陽下曬乾，切成一段段攜帶等內容。我看完後嗤之以鼻，覺得輕量化就是犧牲舒適度罷了。我當時的行程頂多四、五天，最初體力較差，確實嫌過包袱重，但幾次下來也就習慣了，還驕傲自己真能背，何必為了輕量化走極端路線。', 2, 0, 0, '2021-05-11', '2021-05-11 16:32:08', '2021-07-02 18:00:48'),
(22, '四季的露營，享受美好露營時光～', 'item_20210628102253.jpg', 'Y小編', '實際掌握露營知識，天天都是露營好日子，從出發那一刻開始都是美好又難忘的回憶，享受從容不迫的露營體驗。初學者一看就會！老手再度複習！享受美好露營時光～對露營初學者來說，最常見的想法不外乎就是：「就算想要去露營也根本不知道該如何準備起！」想體驗別人口中露營的樂趣：親近大自然、享受山水的愜意悠閒，擁有一段自由自在的享受時光、增進親子或朋友間的感情，結果站在琳瑯滿目的道具前，卻不知道該從何買起？帳篷為寢室，天幕是客、餐廳，再加上配置好的廚房……，在露營區的營地設置，就像是在現場建起一個家的感覺。想要在露營區度過舒適的時光，就要好好仔細挑選道具，依照自己憧憬的露營空間挑選適合的道具，從五花八門的商品中挑選出屬於自己風格的道具，就是這份樂趣讓人慢性中毒，甚至可以說是「露營中毒症」的主要因素呢！要充分享受初次的露營樂趣，第一個目標就是「不疾不徐、舒適愉快的享受」，不要什麼都想要，就塞滿了一堆計畫。做料理也是，一開始不要太勉強。慢慢地增加自己可以做的事情，熟練程度就會慢慢累積起來，重點就是「保持輕鬆愉快」！', 5, 0, 0, '2021-05-11', '2021-05-11 22:45:44', '2021-07-02 18:00:42'),
(24, '零失敗，好上手！完全圖解露營必備料理', 'item_20210628102307.jpg', 'K小編', '在家做出的好味道，外出露營也辦得到，不用烤箱也能烤披薩、蘋果派；用剩菜就能完成通心麵沙拉、濃湯，還有貼心的料理順序規畫，讓上一道菜的美味，成為下一道菜的佐味\r\n鍋具不必一再清洗，超省力；甚至可以一鍋兩菜，最省時！零失敗，好上手，你一定沒想過，露營能夠這麼好吃又好玩。三餐老是「吃外面」，不健康；現在出發「外面吃」，最享受。誰說出外吃不到好料？就靠露營料理打破你的美味迷思，一邊露營一邊料理，讓肚子和心靈都超療癒。\r\n\r\n露營難道只能吃一般的炭火烤肉嗎？「NO！露營也可以吃得很豪華！」只要用對方法和工具，即使是在野外，也能做出好味道。不需要烤箱或窯就可以烤出的披薩，蘋果派、烤全雞甚至布丁；在山野也可以料理鮮美的透抽、鮭魚、石斑魚等經典海味。全47種露營料理，顛覆你的想像，從此別再誤解露營只能吃烤肉和泡麵啦。這樣露營食材的準備，一定很麻煩吧？「學會行前處理+剩菜變身美味早餐就不怕！」出發前先做好基本的食材處理、製作醬料，再用一點小撇步收納保存，這樣到營地就能直接料理，把多出來的時間留給野外美景囉。另外，出門在外更不該浪費食材，讓高手教你把晚餐的剩菜變成隔天一早的豐盛美食，不僅能夠享受美味，也可以減少收拾殘局的時間，一兼二顧，露營不費力！', 2, 0, 0, '2021-05-11', '2021-05-11 23:08:13', '2021-07-02 18:00:24'),
(25, '用鑄鐵平底鍋、荷蘭鍋、烤肉爐做出令人垂涎的戶外料理', 'item_20210628102111.jpg', 'KEN', '從不用升火也能做出的輕鬆小菜，到讓你大飽口腹之欲的魚、肉、蔬菜料理、點心等，這裡通通都有。22道簡單小菜x 17道平底鍋料理x 18道荷蘭鍋料理x 15道烤肉爐料理\r\n19種香草香料x 8種醬料x 8種飲料。吃得比5星級餐廳還豪華，野炊比想像中簡單上手。在野外用餐總是感覺食物特別美味！野炊露營能為小朋友和大人帶來很棒的成長體驗；而且，圍著營火用餐，人人臉上都會自然浮現笑容，戶外野炊就是有這些迷人的魅力。只要有一個荷蘭鍋，無論是烤雞、西班牙海鮮飯、烤秋刀魚、味噌豬肉蓋飯、關東煮、煎餃、蒸麵包、雞蛋布丁、草莓披薩……等，各種各樣的料理都難不倒它，烤、燉、蒸、煮、炸、燻，一鍋搞定。', 5, 0, 0, '2021-05-11', '2021-05-11 23:09:26', '2021-06-28 16:21:11'),
(31, '終極輕量化的山林料理絕招', 'item_20210628093240.jpg', '露營編', '行動食物與應急食物，食材要裝到容易辨認的塑膠袋裡。在野外做飯與在家裡不一樣，你必須要把食材帶去。為了方便處理，最好是帶輕盈、體積不大、不需花太多時間調理的食材。蔬菜只要洗好需要的量，再裝進塑膠袋裡帶去即可，如果先切成適當的大小，就能省下更多時間了。打翻之後不能再使用的食材，像是麵粉、油之類的，要放進袋子或瓶子裡，並且用塑膠袋裝好。\r\n \r\n行動食物要放在衣服或背包的口袋裡。和到當地才開始做的餐點不一樣，乾糧或零嘴等行動食物，是在走路途中肚子餓時吃的東西。覺得肚子餓了或是很累的時候，不要忍耐，拿出乾糧來吃吧，準備巧克力、餅乾或糖果等自己喜歡吃的零嘴是最好的，人們吃到愛吃的東西後，就會變得很有精神。為了能夠方便拿取，請把行動食物放到衣服的口袋，或是背包口袋的上方吧。', 3, 0, 0, '2021-06-27', '2021-06-28 13:04:54', '2021-06-28 15:45:36'),
(32, '建立「輕量化的觀念」比購買「輕量化的裝備」重要', 'item_20210628093216.jpg', 'John', '山的浩瀚、人的渺小，從登山找回與大自然的相處之道。沒有任何一位真正的登山者會用驕傲的語氣說他征服了什麼高山，相反地，面對「山」這樣偉大浩瀚的存在，反而要不斷縮小自我，並放大眼界，用像山一樣的胸懷包容各種好壞。\r\n\r\n走進高山的世界，傾聽風、樹、雲、石、水、光的聲響，踏著渾厚的步伐，穩定且緩慢地向前邁進、向上攀升，在那靜謐的浩瀚天地間，享受巨大孤獨的洗禮，腦袋因而感到無比清晰，這是每一位登山者嚮往的心靈境界。登山並不像綁鞋帶或騎單車那樣，一旦學會就可對外宣稱「我學會了」，登山如同許多專業運動項目和技能，必須不斷地嚴格自我要求，精進知識和技巧，方能學會面對挑戰、任意自在，找回與大自然的相處之道！\r\n\r\n台灣終於也來到了這樣時代，年輕人加入世界山民夢想的長距離步道行列，給自己半年時間在異鄉流浪，遇見步道天使的奇蹟，倚賴陌生人的善意，對話經過試煉的愛情，在在呈現國際的健行者文化，步道的軟內涵遠比硬工程來得久遠，值得讀者細細品味。', 4, 0, 0, '2021-06-28', '2021-06-28 15:32:16', '2021-06-28 15:32:16'),
(33, '靜謐山徑上的星星，找回與 大自然的相處之道！', 'item_20210628102227.jpg', 'J小編', '露營登山玩水事前準備非常重要，一定要把自己搞得很舒服，否則景再美卻餓肚子冷到靠北淋得濕嗒嗒還有心讚嘆山河嗎？用勇氣或夢想這種很老土的旗幟伴行，既然不是，還是已經昇華到另外一種境界？我認為那種境界就是「想那麼多，人生不就是一翻兩瞪眼，多想也只是浪費時間，不如說走就走」。\r\n\r\n我不得不幻想著，這條我可能一輩子不會有機會踏上的太平洋屋脊步道，就彷彿是人生的短暫縮影。這一路上的風景有崎嶇坎坷、有風光明媚、有歡笑瘋癲當然還有汗水與淚水，你會認識一些人，也會跟一些人揮手道別，幸運的話還會遇上好多天使。而最重要的是，那個深愛的人還緊緊牽著你的手，直到步道的終點。PCT步道很難，人生也是，謝謝阿泰和呆呆，這場不可思議的壯舉，給了你我面對人生最珍貴的無懼勇氣。', 3, 0, 0, '2021-06-28', '2021-06-28 15:33:38', '2021-07-02 18:00:17'),
(34, '登山的服裝配件，嚴格來說沒有一個是多餘的', 'item_20210628104809.jpg', 'R小編', '露營是近幾年非常流行的休閒活動，開車載著帳篷、廚具、食物等等裝備就可以到露營場所度過美好的時光。然而，你知道台灣的山林卻為了開闢更多的露營場地而被濫墾濫伐，造成水土保持的災難嗎？其實還有另一種既著重環境維護且更深度親近大自然的休閒方式，就是本書要介紹的『野營』。\r\n\r\n野營既然是休閒活動，就沒有野外求生那麼嚴肅艱苦。跟露營類似之處是同樣可以開車載著必要的用具進入山野，當經驗變得豐富之後，就可以逐漸減少攜帶的用具，降低對文明工具的依賴，以現場採集到的物品來替代，觀察與體驗大自然帶給我們的恩典。當你在深入感受風、地面濕氣、樹木的生長方向等周圍的大自然事物時，體內的生理時鐘會放緩下來，同時自己的行動與思考的速度也會跟著放慢，我覺得這就是大自然的節奏！若能配合這樣的節奏，仔細謹慎地進行所有的作業，會讓察覺危險的能力變得更敏銳，進而減少受傷等危險發生的機會。融入大自然的方法有很多種，但是我覺得沒有一種活動能像野營這樣自然、有趣，透過遊玩就能實現的。希望讀者們看了本書之後，能以輕鬆愉快的心情加入野營的行列，不用刻意勉強，順其自然就好。', 4, 0, 0, '2021-06-28', '2021-06-28 15:34:14', '2021-07-02 18:00:01'),
(35, '新手必修的登山露營課', 'item_20210628110123.jpg', 'C小編', '為什麼學會「露營」這麼重要？只要有露營裝備，即使預約不到山屋也能有地方住宿，任何緊急時刻都能保住性命。一般旅行都要規劃個老半天，如果你擁有紮營技能，帶上設備就能立刻出發，再也不用搶三個月前訂位！首度公開專家才知道的露營訣竅，讓你的野外宿營比躺在家裡更舒服！\r\n\r\n一輩子受用！搭帳篷的4大重點\r\n 1. 紮營雷區要避掉：優先選擇平坦且無傾斜的地面，低處、窪地與河川附近有溪水暴漲危機，懸崖下方的位置很可能有落石，此類區域都要避免。\r\n 2. 事前整地有技巧：帳篷下面若有石頭或樹枝，睡覺時背部容易感到不適，請事先去除乾淨。\r\n 3. 營釘種類很重要：營釘是搭起帳篷必不可少的工具，要根據不同的用途和地面狀況選用營釘，下釘的角度及深度更是提升帳篷穩定度的關鍵。\r\n 4. 防水工具不能少：為了隔絕濕氣，攤開帳篷前要先鋪上防潮地布；下雨時，將登山杖墊在帳篷外面兩側下方，抬高地布的邊緣，雨水就不會流進來。\r\n\r\n所謂的「登山露營」，是指什麼樣的登山型態呢？跟一般的郊山健行有什麼不同？在這之前，我們要先來探討什麼是「登山」。登山大致上分為兩種，一種是按照既有登山路線行走的健行（Trekking），或是以阿爾卑斯式攀登的方式（Alpine Climbing）在無既定路線的岩壁上攀登。不論是哪一種型式，都和一般的散步不同，因為登山包含了冒險的要素。如果可以的話，必須盡可能靠自己的力量完成，這也是登山前必須要擁有的基本態度。登山露營是將登山期間所需要的食衣住行全部揹在身上，不靠任何外部的力量達到目的，因此與一般登山相比，所需要學習的技能更多，危險性也較高。不過，我認為，揹帳篷登山才是登山應有的樣貌。日本是一個登山環境非常友善的國家，周邊環境與配套措施完善，受歡迎的登山地區大部分都備有山屋，也有路徑明確的登山步道。新手可以從入住山屋開始練習，或是夜宿帳篷、在山屋裡準備伙食，選擇這種折衷的方式，不必一開始就過於勉強自己，挑戰高難度的全自助登山行程。配合自己的體能與登山技巧，慢慢地提升難度，一邊體驗登山露營的樂趣，在不破壞山林的前提下，利用現有的環境，在山裡盡情享受遠離塵囂的大自然吧！本書集結了登山露營所必備的知識與技術，以及我個人的登山經驗分享，希望能讓大家對登山露營有正確的認識，並勇於開啟人生第一次的登山露營。', 2, 0, 0, '2021-06-28', '2021-06-28 17:01:23', '2021-07-02 18:00:06');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `articlelist`
--
ALTER TABLE `articlelist`
  ADD PRIMARY KEY (`aId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `articlelist`
--
ALTER TABLE `articlelist`
  MODIFY `aId` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章編號', AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
