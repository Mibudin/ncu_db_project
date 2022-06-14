-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db_108502523
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'科技'),(2,'遊戲'),(3,'教育'),(4,'地方創生'),(5,'空間'),(6,'飲食'),(7,'時尚'),(8,'音樂'),(9,'新春賀喜'),(10,'攝影');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_comment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `proposal_id` int unsigned NOT NULL,
  `member_id` int unsigned DEFAULT NULL,
  `user_comment` varchar(255) NOT NULL,
  `proposer_response` varchar(255) DEFAULT NULL,
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `response_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_id_idx` (`proposal_id`),
  KEY `fk_member_id_idx` (`member_id`),
  CONSTRAINT `fk_comment__member_id` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_comment__proposal_id` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_proposal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` VALUES (1,5,9,'不好意思，我的贊助編號是P108681B 想問一下什麼時候會收到呢～！ 感謝','您好，禮盒已經送出，和豐店到店，應該已經抵達喔～ 感謝您對募資計畫的支持喔～ :)','2022-05-17 21:57:12','2022-05-28 15:04:01'),(2,1,10,'GoPlus 已更新連線方式，你們還支援24小時不斷線嗎','丹尼的影片 1 : 40 秒有講解如何連線 GoPlus 功能喔～','2022-05-22 03:54:29','2022-05-22 21:02:05'),(3,1,3,'請問當寶可夢執行背景應用程式or手機休眠時，247還會持續運作抓怪轉牌嗎?',NULL,'2022-05-28 22:04:48',NULL),(4,5,4,'讚！！每日寫日記','太棒了，歡迎在我們FB粉絲頁跟大家分享喔～','2022-05-01 07:23:57','2022-05-25 17:04:09'),(5,4,8,'加油！你的作品很有特色，如果size再完整一些，單價低一些應該很有市場的！','謝謝您的支持與鼓勵！！','2022-05-04 09:14:21','2022-05-30 00:35:11'),(6,10,1,'上次短褲沒跟到，這次上衣短褲共下買。','謝謝您的支持 : )','2022-05-23 03:08:29','2022-05-28 12:09:12'),(7,1,2,'我多訂一個能退嘛','要請您寄一封信到 support@zeczec.com','2022-05-14 08:55:11','2022-05-26 19:03:05'),(8,2,6,'請問軟糖保存期限多久呢？因為同事都是垃圾讓人很需要囤貨 :)','您好，保存期限是一年喔！希望可以陪你平靜渡過被垃圾氣到不行的每一天 :)','2022-05-03 21:19:24','2022-05-19 13:48:54'),(9,1,7,'有機會可以早點出貨嗎？6/1要等很久',NULL,'2022-05-01 05:42:38',NULL),(10,3,1,'請問留言tag兩個人的活動我不小心讓他的網頁跳出來該怎麼再操作一次，謝謝。','您好！已另外傳送嘖嘖站內信給您，再請查收','2022-05-06 13:08:35','2022-05-25 04:21:24');
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_faq`
--

DROP TABLE IF EXISTS `tbl_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_faq` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `proposal_id` int unsigned NOT NULL,
  `last_editor_id` int unsigned DEFAULT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_id_idx` (`proposal_id`),
  KEY `fk_last_editor_id_idx` (`last_editor_id`),
  CONSTRAINT `fk_faq__last_editor_id` FOREIGN KEY (`last_editor_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_faq__proposal_id` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_proposal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_faq`
--

LOCK TABLES `tbl_faq` WRITE;
/*!40000 ALTER TABLE `tbl_faq` DISABLE KEYS */;
INSERT INTO `tbl_faq` VALUES (1,4,8,'要如何下單？','先點擊想要贊助的方案之後，照著以下步驟 1、選擇您想要「信用卡付款」或是「ATM轉帳」2、選擇您要宅配或是超商取貨，並輸入對應的收件資訊 3、確認贊助人資訊，並按下立刻付款。 4、之後會根據付款方式給您相關的付款資料 5、付款後回到嘖嘖頁面，點選右上角選單的贊助紀錄，就可以確認剛剛是否付款成功囉！','2022-05-24 09:13:00'),(2,4,8,'請問何時會出貨？','預計於2022年7月初開始依訂單編號陸續出貨。','2022-05-24 07:03:31'),(3,1,7,'請問有什麼需要注意的呢？','由於新品PVC材質，於生產完成即封裝寄送，初次開啟會有些許味道屬於正常，收到後可先打開放置通風處即可消除。若有需清潔，可用中性清潔劑清洗乾淨並完全晾乾，切勿長時間曝曬於太陽下。 ','2022-05-24 07:03:43'),(4,2,6,'有多入之大宗採購需求該怎麼做？','歡迎加入LINE@好友搜尋「@550yisos」，將會有專人與您接洽喔！','2022-05-23 07:28:00'),(5,7,3,'付款方式有哪些？','目前開放ATM、信用卡。','2022-05-23 07:28:00'),(6,3,4,'可以用信用卡分期嗎？','【台灣的募資平台因應政府規定，均沒有提供分期付款的功能】不過，持卡者如果想以自己信卡來做【分期付款】這樣是可以的。但是，這樣就會有分期利率手續費的衍生（相關利率依每家銀行規範為準）所以，想要以分期付款的朋友，請你先與你持卡銀行確認相關資訊。','2022-05-23 07:18:00'),(7,10,1,'十月才能收到商品嗎？','事實上如果不受疫情或戰爭的影響~八月就能出貨了！目前確定八月最少可以出100組~先下單先拿到喔','2022-05-24 13:30:00'),(8,6,4,'有使用說明嗎?','請至粉絲專頁~魔術吸管~參考一下喔~','2022-05-15 06:36:00'),(9,6,4,'是否有分男女版型呢 ?','我們的版型皆為中性版型，中性版是男女皆適合喔！','2022-05-19 07:06:00'),(10,5,9,'可否寄送到國外？','目前我們的商品可以寄送到下列地區：香港(運費$250) / 澳門(運費$250) / 中國(運費$250) / 美國(運費$800) / 日本(運費$600)','2022-05-19 07:06:00');
/*!40000 ALTER TABLE `tbl_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_following_proposer`
--

DROP TABLE IF EXISTS `tbl_following_proposer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_following_proposer` (
  `proposer_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  PRIMARY KEY (`proposer_id`,`member_id`),
  KEY `fk_member_id_idx` (`member_id`),
  CONSTRAINT `fk_following_proposer__member_id` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_following_proposer__proposer_id` FOREIGN KEY (`proposer_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_following_proposer`
--

LOCK TABLES `tbl_following_proposer` WRITE;
/*!40000 ALTER TABLE `tbl_following_proposer` DISABLE KEYS */;
INSERT INTO `tbl_following_proposer` VALUES (1,2),(2,2),(6,4),(8,4),(4,5),(8,5),(1,6),(7,6),(7,7),(10,7),(3,9);
/*!40000 ALTER TABLE `tbl_following_proposer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_following_record`
--

DROP TABLE IF EXISTS `tbl_following_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_following_record` (
  `proposal_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  PRIMARY KEY (`proposal_id`,`member_id`),
  KEY `fk_member_id_idx` (`member_id`),
  CONSTRAINT `fk_following_record__member_id` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_following_record__proposal_id` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_proposal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_following_record`
--

LOCK TABLES `tbl_following_record` WRITE;
/*!40000 ALTER TABLE `tbl_following_record` DISABLE KEYS */;
INSERT INTO `tbl_following_record` VALUES (3,1),(10,1),(1,2),(1,3),(5,4),(2,6),(1,7),(4,8),(6,9),(1,10);
/*!40000 ALTER TABLE `tbl_following_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_gender`
--

DROP TABLE IF EXISTS `tbl_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_gender` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_gender`
--

LOCK TABLES `tbl_gender` WRITE;
/*!40000 ALTER TABLE `tbl_gender` DISABLE KEYS */;
INSERT INTO `tbl_gender` VALUES (1,'不透漏'),(2,'男性'),(3,'女性'),(4,'其它');
/*!40000 ALTER TABLE `tbl_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_login_record`
--

DROP TABLE IF EXISTS `tbl_login_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_login_record` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int unsigned NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_member_id_idx` (`member_id`),
  CONSTRAINT `fk_login_record__member_id` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_login_record`
--

LOCK TABLES `tbl_login_record` WRITE;
/*!40000 ALTER TABLE `tbl_login_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_login_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_member` (
  `member_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `salt` char(64) NOT NULL,
  `address` varchar(255) NOT NULL,
  `avatar` varchar(64) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender_id` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_gender_id_idx` (`gender_id`),
  CONSTRAINT `fk_member__gender_id` FOREIGN KEY (`gender_id`) REFERENCES `tbl_gender` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES (1,'毛若穎','0921003614','in.consequat@yahoo.com','0oplfZ16tyLX','366 苗栗縣銅鑼鄉民權路31號','1','1997-09-28',3),(2,'林芳岑','0988008346','adipiscing.enim.mi@outlook.com','7gB%z9Svg8EW','600 嘉義市東區世賢路24號','2','1999-12-28',1),(3,'胡素芝','0922830125','nullam.velit@yahoo.com','JJQF0j%tkx3i','325 桃園市龍潭區淮子埔一路29號','3','2005-06-06',4),(4,'童雅婷','0958351743','sed.auctor@hotmail.com','Rv$uGmL&C!%g','540 南投縣南投市三和一路14號','4','2001-12-01',3),(5,'賴麗萍','0912587773','sagittis.nullam@google.com','XcZg6Be^cU2y','508 彰化縣和美鎮潭北路15號','5','2006-11-27',3),(6,'黃志斌','0960105109','nec.leo.morbi@protonmail.com','aZjy*GvZt@s*','711 臺南市歸仁區崙頂二街11號','6','1985-12-04',2),(7,'廖松白','0961749001','sociosqu.ad@yahoo.com','j8tI5!wG88PM','411 臺中市太平區北田路14號','7','1982-07-22',2),(8,'徐嘉柏','0928735721','proin.non@protonmail.com','n7UDOe0uspZk','801 高雄市前金區自立二路18號','8','1986-02-09',2),(9,'李麗珠','0968169143','arcu.vel.quam@hotmail.com','wlmM33nAD@SR','201 基隆市信義區義四路22號','9','2008-09-09',3),(10,'施泓音','0970691667','dui.quis.accumsan@google.com','&@^ODhk0MH&l','622 嘉義縣大林鎮早知31號','10','1998-11-11',1);
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member_credential`
--

DROP TABLE IF EXISTS `tbl_member_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_member_credential` (
  `hashed_user_id` int unsigned NOT NULL,
  `hashed_pwd_string` varchar(200) NOT NULL,
  PRIMARY KEY (`hashed_user_id`),
  CONSTRAINT `fk_member_credential__hashed_user_id` FOREIGN KEY (`hashed_user_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member_credential`
--

LOCK TABLES `tbl_member_credential` WRITE;
/*!40000 ALTER TABLE `tbl_member_credential` DISABLE KEYS */;
INSERT INTO `tbl_member_credential` VALUES (1,'5459ffea690882061cfa56fa9033278370e48de356c700637aad68d14f2ae0ae'),(2,'07703ba76ae595a212c8317146fb292fb773f34314a3708a6f3e916bbf6e499c'),(3,'1caf7cfa34bdb90fd7a332dfed5a5e0d1a153d6a164234aa98b7ba611b83abe7'),(4,'ea8ced964d6826e1eede67dccaea05e543e4bcf84ff06d6af8f7877413a91538'),(5,'7a09363a667de652e1666b0810219bb7886036dca13af909cd755c80df946365'),(6,'ccd108b762527fcdcdb8c5b6cad6480e9b81a5d92f29e6793d6865b274bc50dc'),(7,'a5c5e74448987538a8bffda3518f59e2f3785cf460d4f882a2c563af654fe13f'),(8,'1a4c96ddeda1e2bfc16abd7bd6f8a72dc416c10c824747cbe5b1f9cc20671c40'),(9,'e9c59dd5748d8c0be520b37658c8da542720916cc6d7ff627ad2ba0e76237bca'),(10,'5ad2e13f01b6c6597301b4dd8fa5b2a055c6e4245e84f63344f6bbb5c0f3c802');
/*!40000 ALTER TABLE `tbl_member_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proposal`
--

DROP TABLE IF EXISTS `tbl_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proposal` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `title` varchar(120) NOT NULL,
  `content` text,
  `amount` int NOT NULL DEFAULT '0',
  `goal` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `viewed_num` int NOT NULL DEFAULT '0',
  `create_date` date NOT NULL DEFAULT (curdate()),
  `due_date` date DEFAULT NULL,
  `pass_date` date DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deactivated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_category_id_idx` (`category_id`),
  CONSTRAINT `fk_proposal__category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proposal`
--

LOCK TABLES `tbl_proposal` WRITE;
/*!40000 ALTER TABLE `tbl_proposal` DISABLE KEYS */;
INSERT INTO `tbl_proposal` VALUES (1,1,'《 247 Catcher 》｜ 最全面的【抓寶 & 打團】輔助道具','大家好！我們是 PhotoFast 銀箭資訊。今年，我們創造出了一款能符合 Pokemon GO 玩家需求的抓寶利器！不只能突破現有的連線一小時限制，更讓您能夠在打團戰或攻道館時輕鬆應戰！',2393696,100000,2,1150,'2022-04-06','2022-07-05','2022-04-06','2022-06-12 17:45:21',0),(2,6,'【最後 3 天】台灣首發輕機能舒壓軟糖 ✧ Kimóo 情緒平衡軟糖 ✧ 日本專利「特濃舒壓ＧＡＢＡ」Ｘ「快樂Ｌ色氨酸」，面對再多鳥事也能有平靜好心情！','喜劇演員的起笑配方！募資前百人實測 → 75.8% 有感回饋：「吃了真的有鬆～」——— 你的心累了嗎？\"Not being O.K. is O.K.\" 沒關係，是情緒啊！吃一顆回到內在平靜小宇宙！',377200,200000,2,251,'2022-03-23','2022-06-21','2022-03-23','2022-06-12 17:45:21',0),(3,3,'數感宇宙探索課程｜為國小生打造的生活數學 DIY 影音學習組｜給孩子一堂不一樣的數學課','本課程結合數感實驗室逾 10 年數學教育經驗、史丹佛大學「成長型數學思維」理論。內容針對國小中年級以上的孩子，強調具體、跨域、手作、情境。鼓勵孩子探索思考，讓孩子愛上數學。',3737138,500000,2,641,'2022-05-04','2022-08-02','2022-05-04','2022-06-12 17:45:21',0),(4,7,'『Organs without body 2014 S/S 服裝秀』','「ORGANS WITHOUT BODY 」為 藝術家「安地羊 Andy Yen」2012創立之服裝品牌。',5050,100000,3,4,'2013-08-21','2013-11-19','2013-08-21','2013-11-19 06:52:13',1),(5,4,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』','本次募資計畫是由茶品牌 Three Leafs Tea 透過45款茶做為與消費者連結的媒介，結合茶與藝術向世界說台灣。以「人、事、物、學、遊」五個層面介紹清晰易懂的台灣在地文化故事。',852482,50000,3,194,'2021-12-12','2022-03-12','2021-12-12','2022-03-11 19:23:12',1),(6,5,'樂待STAY 桃園水岸店 on Line 募資企劃-我們讓孩子樂呆 父母樂待',NULL,282244,943038,2,63,'2022-05-25','2022-08-23','2022-05-25','2022-06-12 17:45:21',0),(7,3,'謎路⼈Way of Puzzle 2022【It\'s All I Have】專輯發⾏企劃',NULL,45651,400000,2,31,'2022-05-23','2022-08-21','2022-05-23','2022-06-12 17:45:21',0),(8,2,'邏輯解謎｜密室逃脫桌遊 破解古老的秘密','益智解謎新視野，結合密室逃脫與立體拼圖的概念，打造一個全新的益智桌遊。你可以舒適地在家中享受愉快的動腦時光，將大腦發揮至極限。',0,100000,1,0,'2022-03-22',NULL,NULL,'2022-03-22 06:34:17',0),(9,10,'SIRUI 75mm ​變形鏡頭','還停留在變形鏡頭既沉且大的印象中？還以為變形鏡頭是高昂的貴族鏡頭？不！消費級別的變形鏡頭世界早已誕生——思銳1.33X寬銀幕變形鏡頭！目前，思銳已推出24mm/F2.8、35mm/F1.8、50mm/F1.8三個焦段，其以更小的體積、更高的性價比、更強的電影質感，讓大眾影友真正能無負擔地接觸變形鏡頭。',532600,100000,3,200,'2021-07-20','2021-10-18','2021-07-20','2021-10-18 02:45:33',1),(10,1,'【 HOMI｜地表最強全情境短袖 & EAM 登山防曬衣 】featuring CORDURA fabric / MIT 設計製造！','ㄧ件夏天的短袖可以有什麼不同？CORDURA 柔軟強韌，非塗層物理涼感，抗UV 前所未有的透氣調節，MIT 質感獨家設計製造 # 針對夏天的穿著環境，更舒適的穿著體驗而衍生出 HOMI 的第一件短袖物件 Movement T shirt，利用材料及設計創造出ㄧ件可以在夏日的不同環境下，隨時給你舒適機能與質感外型的短袖！',1556942,100000,3,3148,'2022-05-24','2022-08-22','2022-05-24','2022-06-12 17:45:21',1);
/*!40000 ALTER TABLE `tbl_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proposal_member`
--

DROP TABLE IF EXISTS `tbl_proposal_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proposal_member` (
  `proposal_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  PRIMARY KEY (`proposal_id`,`member_id`),
  KEY `fk_member_id_idx` (`member_id`),
  CONSTRAINT `fk_proposal_member__member_id` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_proposal_member__proposal_id` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_proposal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proposal_member`
--

LOCK TABLES `tbl_proposal_member` WRITE;
/*!40000 ALTER TABLE `tbl_proposal_member` DISABLE KEYS */;
INSERT INTO `tbl_proposal_member` VALUES (10,1),(8,2),(6,3),(7,3),(3,4),(6,4),(2,6),(1,7),(4,8),(10,8),(5,9),(9,10);
/*!40000 ALTER TABLE `tbl_proposal_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proposal_option`
--

DROP TABLE IF EXISTS `tbl_proposal_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proposal_option` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `proposal_id` int unsigned NOT NULL,
  `title` varchar(64) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_id_idx` (`proposal_id`),
  CONSTRAINT `fk_proposal_option__proposal_id` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_proposal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proposal_option`
--

LOCK TABLES `tbl_proposal_option` WRITE;
/*!40000 ALTER TABLE `tbl_proposal_option` DISABLE KEYS */;
INSERT INTO `tbl_proposal_option` VALUES (1,1,'247 早鳥超值組',2290,'內容物包含：247 Catcher x 1 自動點擊器 x 1 usb - C 充電線 x 1 專屬收納包 x 1 247 Catcher 說明書 x 1【重要提醒】台灣本島地區免運費，外島地區收額外運費。全球地區皆可寄，運費於結帳時顯示。若需統編請輸入收件資訊時備註。'),(2,3,'單組 體驗初學',1790,'Ａ數學分析／Ｂ邏輯推演／Ｃ策略規劃：３組擇１ '),(3,9,'【好評追加！超早鳥衣褲組合】',3899,'Movement 全情境短T X1 +  Movement 全情境短褲 X1 +  ▲未來售價：5060，現省1161 '),(4,5,'小資支持 12個月每月茶包禮',800,'【感謝禮】回饋您對我們計畫的支持，我們每個月會寄一包茶葉體驗包 + 電子刊物'),(5,10,'75mm 超級早鳥價格',18800,'75mm F1.8 Anamorphic 1.33X Lens X1 '),(6,8,'【 嘖嘖超早鳥優惠 】 未來售價 $1790｜現省300元',1490,'金字塔、諾克斯碉堡、龍之屋（三選一） ×1 款'),(7,6,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』',1888,'想參與STAY最有名的親子活動嗎，此為一大一小體驗邀請，歡迎爸媽帶著你的孩子，或是孩子帶著你最愛的爸媽，參加我們90分鐘的專屬親子派對，和我們一起慶祝STAY桃園水岸店的開幕'),(8,7,'【只想聽歌組】',720,'【謎路人 2022 It\'s All I Have】 概念專輯 1張 '),(9,4,'原畫畫作一件10號',15000,'原畫畫作'),(10,2,'【嘖嘖價】1 入 83 折',690,'Kimóo情緒平衡軟糖 1 盒');
/*!40000 ALTER TABLE `tbl_proposal_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sponsor_record`
--

DROP TABLE IF EXISTS `tbl_sponsor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sponsor_record` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int unsigned DEFAULT NULL,
  `proposal_option_id` int unsigned NOT NULL,
  `amount` int NOT NULL,
  `sponsor_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_member_id_idx` (`member_id`),
  KEY `fk_proposal_option_id_idx` (`proposal_option_id`),
  CONSTRAINT `fk_sponsor_record__member_id` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_sponsor_record__proposal_option_id` FOREIGN KEY (`proposal_option_id`) REFERENCES `tbl_proposal_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sponsor_record`
--

LOCK TABLES `tbl_sponsor_record` WRITE;
/*!40000 ALTER TABLE `tbl_sponsor_record` DISABLE KEYS */;
INSERT INTO `tbl_sponsor_record` VALUES (1,9,4,800,'2013-09-29 01:51:59'),(2,10,1,2290,'2022-05-27 23:10:13'),(3,3,1,2290,'2022-05-26 23:51:32'),(4,4,4,800,'2013-10-21 22:31:40'),(5,8,9,15000,'2021-08-19 22:16:11'),(6,1,5,18800,'2022-01-16 03:41:14'),(7,2,1,2290,'2022-05-13 23:02:37'),(8,6,10,690,'2022-06-01 12:21:47'),(9,7,1,2290,'2022-05-09 08:55:12'),(10,1,2,1790,'2022-05-11 08:10:28');
/*!40000 ALTER TABLE `tbl_sponsor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_108502523'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_CreateProposal`(
    IN in_member_id INT,
    IN in_title VARCHAR(120),
    IN in_content TEXT,
    IN in_goal INT,
    IN in_category_id INT,
    OUT out_affected_row_num INT
)
    SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _is_member_exist TINYINT(1) DEFAULT 0;
    DECLARE _is_category_exist TINYINT(1) DEFAULT 0;
    DECLARE _created_proposal_id INT DEFAULT NULL;

    SET out_affected_row_num = 0;


    /*
      Step 1: check the proposal data
      - Failed if some of the proposal data is invalid.
     */

    /* Check whether the member exists */
    SELECT EXISTS(
           SELECT tm.member_id
             FROM tbl_member AS tm
            WHERE tm.member_id = in_member_id)
      INTO _is_member_exist;

    IF NOT _is_member_exist THEN
        /* The member does not exist */
        LEAVE proc;
    END IF;

    /* Check whether the goal is valid */
    IF in_goal <= 0 THEN
        /* Invalid proposal data */
        LEAVE proc;
    END IF;

    /* Check whether the category exists */
    SELECT EXISTS(
           SELECT tc.id
             FROM tbl_category AS tc
            WHERE tc.id = in_category_id)
      INTO _is_category_exist;

    IF NOT _is_category_exist THEN
        /* The category does not exist */
        LEAVE proc;
    END IF;


    /*
      Step 2: insert the proposal data
     */

    INSERT INTO tbl_proposal (category_id, title, content, goal)
    VALUES (in_category_id, in_title, in_content, in_goal);
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();

    /* Get the proposal_id of the last inserted record */
    SELECT LAST_INSERT_ID() INTO _created_proposal_id;

    INSERT INTO tbl_proposal_member (proposal_id, member_id)
    VALUES (_created_proposal_id, in_member_id);
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();


    /*
      Step 3: select the inserted proposal data
     */

    SELECT tp.id            AS proposal_id,
           tp.title         AS proposal_title,
           tp.content       AS proposal_content,
           tp.amount        AS amount,
           tp.goal          AS goal,
           tp.status        AS status,
           tp.viewed_num    AS viewed_num,
           tp.create_date   AS create_date,
           tp.due_date      AS due_date,
           tc.category_name AS category
      FROM tbl_proposal AS tp
           INNER JOIN tbl_category tc
           ON tp.category_id = tc.id
     WHERE tp.id = _created_proposal_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_DeleteMember`(
    IN in_member_id INT,
    OUT out_affected_row_num INT
)
    SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _is_member_exist TINYINT(1) DEFAULT 0;
    DECLARE _is_member_proposer TINYINT(1) DEFAULT 0;

    SET out_affected_row_num = 0;

    /*
      Step 1: check whether this member is deletable
      - Failed if this member is not deletable for some reasons.
     */

    /* Check whether this member exists */
    SELECT EXISTS(
           SELECT tm.member_id
             from tbl_member AS tm
            WHERE tm.member_id = in_member_id)
      INTO _is_member_exist;

    IF NOT _is_member_exist THEN
        /* This member is not exist */
        LEAVE proc;
    END IF;

    /* Check whether this member is a proposer */
    SELECT EXISTS(
           SELECT tpm.member_id
             FROM tbl_proposal_member AS tpm
            WHERE tpm.member_id = in_member_id)
      INTO _is_member_proposer;

    IF _is_member_proposer THEN
        /* A current proposer cannot be deleted, take the responsibilities as a proposer */
        LEAVE proc;
    END IF;


    /*
      Step 2: delete this member and delete or modify associate records
     */

    /* While deleting this member, in other tables, some fields taking `member_id` as
       a foreign key would be deleted (ON DELETE CASCADE) or set to NULL (ON DELETE SET NULL),
       unfortunately, which would not be detected by `ROW_COUNT()`. */
    DELETE FROM tbl_member
     WHERE tbl_member.member_id = in_member_id;
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_GetFollowedProposalsByMember`(
    IN in_member_id INT,
    OUT out_result_row_num INT
)
    SQL SECURITY INVOKER
BEGIN
    SELECT tfr.member_id   AS member_id,
           tfr.proposal_id AS proposal_id,  /* Satisfying "Problem: sp.[1].1" */
           tp.title        AS proposal_title,
           tp.amount       AS proposal_amount,
           tp.goal         AS proposal_goal
      FROM tbl_following_record AS tfr
           INNER JOIN tbl_proposal AS tp
           ON tfr.proposal_id = tp.id
     WHERE tfr.member_id = in_member_id;

    SELECT FOUND_ROWS() INTO out_result_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHistorySponsorByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_GetHistorySponsorByMember`(
    IN in_member_id INT,
    OUT out_result_row_num INT
)
    SQL SECURITY INVOKER
BEGIN
    SELECT tsr.member_id AS member_id,
           tp.id         AS proposal_id,
           tp.title      AS proposal_title,
           tpo.title     AS proposal_option_title,
           tsr.amount    AS amount,
           tp.status     AS status
      FROM tbl_sponsor_record AS tsr
           INNER JOIN tbl_proposal_option AS tpo
           ON tsr.proposal_option_id = tpo.id
           INNER JOIN tbl_proposal AS tp
           ON tpo.proposal_id = tp.id
     WHERE tsr.member_id = in_member_id;

    SELECT FOUND_ROWS() INTO out_result_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_GetProposalByCompletionRate`(
    IN in_ratio FLOAT,
    OUT out_result_row_num INT
)
    SQL SECURITY INVOKER
BEGIN
    SELECT tp.id               AS proposal_id,
           tp.title            AS proposal_title,
           tp.amount           AS amount,
           tp.goal             AS goal,
           tp.amount / tp.goal AS ratio
      FROM tbl_proposal AS tp
     WHERE tp.amount / tp.goal >= in_ratio
     ORDER BY ratio DESC;

    SELECT FOUND_ROWS() INTO out_result_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalsByKeyword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_GetProposalsByKeyword`(
    IN in_keyword VARCHAR(64),
    OUT out_result_row_num INT
)
    SQL SECURITY INVOKER
BEGIN
    SELECT tp.id       AS proposal_id,
           tp.title    AS proposal_title,
           tp.due_date AS due_date,
           tp.amount   AS amount
      FROM tbl_proposal AS tp
     WHERE tp.title LIKE CONCAT('%', in_keyword, '%');  /* Check whether titles contains the keyword */

    SELECT FOUND_ROWS() INTO out_result_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_GetRecommendedProposals`(
    IN in_member_id INT,
    OUT out_result_row_num INT
)
    SQL SECURITY INVOKER
proc: BEGIN

    /*
      Step 1: select the recommended proposals if exist
     */

    /*
      Notes of table joins:
      -      `tsr` : the members sponsored which proposal option
      - JOIN `tpo` : the above proposal options belong to which proposal
      - JOIN `tpo2`: the above proposals include which proposal option
      - JOIN `tsr2`: the above proposal options were sponsored by which members
      - JOIN `tsr3`: the above members sponsored which proposal option
      - JOIN `tpo3`: the above proposal options belong to which proposal
      - JOIN `tp`  : the above proposals' information
      - JOIN `tpm` : the above proposals' proposers
     */
    CREATE TEMPORARY TABLE tbl_tmp_recommended_proposal
    SELECT DISTINCT
           tp.id         AS proposal_id,
           tp.title      AS proposal_title,
           tp.status     AS status,
           tp.viewed_num AS viewed_num
      FROM tbl_sponsor_record AS tsr
           INNER JOIN tbl_proposal_option AS tpo
           ON tsr.proposal_option_id = tpo.id
           INNER JOIN tbl_proposal_option AS tpo2
           ON tpo.proposal_id = tpo2.proposal_id
           INNER JOIN tbl_sponsor_record AS tsr2
           ON tsr2.proposal_option_id = tpo2.id
           INNER JOIN tbl_sponsor_record AS tsr3
           ON tsr3.member_id = tsr2.member_id
           INNER JOIN tbl_proposal_option AS tpo3
           ON tsr3.proposal_option_id = tpo3.id
           INNER JOIN tbl_proposal AS tp
           ON tpo3.proposal_id = tp.id
           INNER JOIN tbl_proposal_member AS tpm
           ON tp.id = tpm.proposal_id
     WHERE tsr.member_id = in_member_id             /* Requirement a. */
           AND tsr.member_id != tsr2.member_id      /* Requirement a. */
           AND tpo.proposal_id != tpo3.proposal_id  /* Requirement b. */
           AND tp.status = 2                        /* Requirement c. */
           AND tpm.member_id != tsr.member_id       /* Requirement d. */
     ORDER BY tp.viewed_num DESC;

    SELECT FOUND_ROWS() INTO out_result_row_num;


    /*
      Step 2: check whether the recommended proposals exist
      - Failed if no recommended proposal found.
     */

    IF out_result_row_num = 0 THEN
        /* No recommended proposal found */
        SELECT tp.id         AS proposal_id,
               tp.title      AS proposal_title,
               tp.status     AS status,
               tp.viewed_num AS viewed_num
          FROM tbl_proposal AS tp
         ORDER BY tp.viewed_num DESC
         LIMIT 5;
    ELSE
        SELECT *
          FROM tbl_tmp_recommended_proposal;
    END IF;

    SELECT FOUND_ROWS() INTO out_result_row_num;

    DROP TABLE tbl_tmp_recommended_proposal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_GetUnrepliedComments`(
    IN in_member_id INT,
    OUT out_result_row_num INT
)
    SQL SECURITY INVOKER
BEGIN
    SELECT tpm.member_id        AS member_id,
           tc.proposal_id       AS proposal_id,
           tp.title             AS proposal_title,
           tc.id                AS comment_id,
           tc.user_comment      AS member_comment,
           tc.comment_time      AS comment_time,
           tc.proposer_response AS proposer_response
      FROM tbl_proposal_member AS tpm
           INNER JOIN tbl_comment AS tc
           ON tpm.proposal_id = tc.proposal_id
           INNER JOIN tbl_proposal AS tp
           ON tc.proposal_id = tp.id
     WHERE tpm.member_id = in_member_id
           AND tc.proposer_response IS NULL; /* "Unreplied" is equivalent to "proposer_response is NULL" */

    SELECT FOUND_ROWS() INTO out_result_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_Login`(
    IN in_email VARCHAR(64),
    IN in_hashed_pwd VARCHAR(200),
    OUT out_status_code INT
)
    SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _login_member_id INT DEFAULT NULL;
    DECLARE _is_pwd_check_success TINYINT(1) DEFAULT 0;

    /*
      Step 1: check the given email and the corresponding user
      - Failed if no corresponding member record found.
     */

    /* Check whether the member exists */
    SELECT tm.member_id
      INTO _login_member_id
      FROM tbl_member AS tm
     WHERE tm.email = in_email;

    IF _login_member_id IS NULL THEN
        /* No member who registered with this email found */
        SET out_status_code = 3;
        SELECT out_status_code AS status_code;
        LEAVE proc;
    END IF;


    /*
      Step 2: check the given hashed password
      - Failed if:
        1. no corresponding member credential record found
            (belonging to the "wrong password" exception here), and
        2. wrong hashed password (literally).
     */

    /* Check if the member credential record exists
       and if the hashed password is correct */
    SELECT EXISTS(
           SELECT tmc.hashed_user_id
             FROM tbl_member_credential AS tmc
            WHERE tmc.hashed_user_id = _login_member_id
                  AND tmc.hashed_pwd_string = in_hashed_pwd)
      INTO _is_pwd_check_success;

    IF NOT _is_pwd_check_success THEN
        /* Step 2 failed */
        SET out_status_code = 2;
        SELECT out_status_code AS status_code;
        LEAVE proc;
    END IF;


    /*
      Step 3: post-process for login success
     */

    /* Record this login */
    INSERT INTO tbl_login_record (member_id)
    VALUES (_login_member_id);

    SET out_status_code = 1;
    SELECT out_status_code AS status_code;  /* Satisfying the result table on the SP specification. */
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_RegisterMember`(
    IN in_email VARCHAR(64),
    IN in_hashed_pwd VARCHAR(255),
    IN in_salt CHAR(64),
    IN in_name VARCHAR(64),
    IN in_address VARCHAR(255),
    IN in_phone VARCHAR(64),
    OUT out_affected_row_num INT
)
    SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _is_email_duplicated TINYINT(1) DEFAULT 1;
    DECLARE _register_member_id INT DEFAULT NULL;

    SET out_affected_row_num = 0;


    /*
      Step 1: check whether the given email is duplicated
      - Failed if the given email is duplicated.
     */

    SELECT EXISTS(
           SELECT tm.member_id
             FROM tbl_member AS tm
            WHERE tm.email = in_email)
      INTO _is_email_duplicated;

    IF _is_email_duplicated THEN
        /* The given email is duplicated */
        LEAVE proc;
    END IF;


    /*
      Step 2: insert data into the member table
     */

    INSERT INTO tbl_member (name, phone, email, salt, address)
    VALUES (in_name, in_phone, in_email, in_salt, in_address);
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();

    /* Get the member_id of the last inserted record */
    SELECT LAST_INSERT_ID() INTO _register_member_id;


    /*
      Step 3: insert data into the member credential table
      - GENERAL ASSUMPTION:
            Each member record in `tbl_member` must have one and only one
            corresponding member credential record in `tbl_member_credential`,
            and vice versa.
     */

    INSERT INTO tbl_member_credential (hashed_user_id, hashed_pwd_string)
    VALUES (_register_member_id, in_hashed_pwd);
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();


    /*
      Step 4: select the inserted member data
     */

    SELECT tm.member_id          AS member_id,
           tm.name               AS name,
           tm.email              AS email,
           tmc.hashed_pwd_string AS password,
           tm.salt               AS salt,
           tm.phone              AS phone,
           tm.address            AS address
      FROM tbl_member AS tm
           INNER JOIN tbl_member_credential AS tmc
           ON tm.member_id = tmc.hashed_user_id
     WHERE tm.member_id = _register_member_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_UpdateProposalStatus`(
    IN in_proposal_id INT,
    IN in_status INT,
    OUT out_affected_row_num INT
)
    SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _original_status INT DEFAULT NULL;
    DECLARE _due_date DATE DEFAULT NULL;

    SET out_affected_row_num = 0;


    /*
      Step 1: check whether the proposal exists
      - Failed if this proposal does not exist.
     */

    SELECT tp.status,
           tp.due_date
      FROM tbl_proposal AS tp
     WHERE tp.id = in_proposal_id
      INTO _original_status,
           _due_date;

    IF _original_status IS NULL THEN
        /* This proposal does not exist */
        LEAVE proc;
    END IF;


    /*
      Step 2: check whether this status updating is valid
      - Failed if the given status is invalid.
      - No handling for extended due date here
     */

    /* Prefer separate if statements here for easier to handle different exceptions
       and print different exception messages. */

    IF in_status NOT BETWEEN 1 AND 3 THEN
        /* Impossible target status */
        LEAVE proc;
    END IF;

    IF in_status - _original_status != 1 THEN
        /* Invalid status transition */
        LEAVE proc;
    END IF;

    IF in_status = 3 AND _due_date >= CURRENT_DATE() THEN
        /* Have not expired */
        LEAVE proc;
    END IF;


    /*
      Step 3: update the status and do some other associated processes
     */

    CASE in_status
         /* WHEN 1 THEN */  /* UNDER-REVIEWING */
            /* Impossible here */

         WHEN 2 THEN  /* ONGOING */
            /* Calculate pass_date and due_date */
            UPDATE tbl_proposal AS tp
               SET tp.status = 2,
                   tp.pass_date = CURRENT_DATE(),
                   tp.due_date = DATE_ADD(CURRENT_DATE(), INTERVAL 90 DAY)
             WHERE tp.id = in_proposal_id;

         WHEN 3 THEN  /* EXPIRED */
            /* Deactivate this proposal */
            UPDATE tbl_proposal AS tp
               SET tp.status = 3,
                   tp.is_deactivated = 1
             WHERE tp.id = in_proposal_id;

         /* ELSE */
            /* Impossible here */
    END CASE;
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();


    /*
      Step 4: select the updated proposal data
     */

    SELECT tp.id AS proposal_id,
           tp.status AS status
      FROM tbl_proposal AS tp
     WHERE tp.id = in_proposal_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`108502523`@`10.0.2.2` PROCEDURE `sp_UpdatePwd`(
    IN in_member_id INT,
    IN in_hashed_pwd VARCHAR(200),
    IN in_salt CHAR(64),
    OUT out_affected_row_num INT
)
    SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _is_member_exist TINYINT(1) DEFAULT 0;

    SET out_affected_row_num = 0;


    /*
      Step 1: check whether this member exists
      - Failed if this member does not exist.
     */

    SELECT EXISTS(
           SELECT tm.member_id
             FROM tbl_member AS tm
                  INNER JOIN tbl_member_credential tmc
                  ON tm.member_id = tmc.hashed_user_id
            WHERE tm.member_id = in_member_id)
      INTO _is_member_exist;

    IF NOT _is_member_exist THEN
        /* This member does not exist */
        LEAVE proc;
    END IF;


    /*
      Step 2: update the member data
     */

    UPDATE tbl_member AS tm,
           tbl_member_credential AS tmc
       SET tm.salt = in_salt,
           tmc.hashed_pwd_string = in_hashed_pwd
     WHERE tm.member_id = tmc.hashed_user_id
           AND tm.member_id = in_member_id;
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();


    /*
      Step 3: select the updated member data
     */

    SELECT tm.member_id          AS member_id,
           tm.name               AS name,
           tm.email              AS email,
           tmc.hashed_pwd_string AS password,
           tm.salt               AS salt,
           tm.phone              AS phone,
           tm.address            AS address
      FROM tbl_member AS tm
           INNER JOIN tbl_member_credential AS tmc
           ON tm.member_id = tmc.hashed_user_id
     WHERE tm.member_id = in_member_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14 23:06:05
