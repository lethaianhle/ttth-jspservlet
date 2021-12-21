CREATE DATABASE  IF NOT EXISTS `web_ttth` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `web_ttth`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: web_ttth
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(100) DEFAULT NULL,
  `password` text,
  `name` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(12) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT 'images/default/avatar_default.jpg',
  `loginstate` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (257,'Khangle','202cb962ac59075b964b07152d234b70','LeKhang','1997-01-20','nam','khang@gmail.com','098188181','images/default/avatar_default.jpg',NULL,3),(258,'Tuyen123','d9b1d7db4cd6e70935368a1efb10e377','TuyenHa','1997-01-06','nu','tuyen@gmail.com','0961639293','images/default/avatar_default.jpg',NULL,3),(259,'TuyenHa2','d9b1d7db4cd6e70935368a1efb10e377','Tuyen','1997-01-20','nu','tuyen1@gmail.com','0961637273','images/default/avatar_default.jpg',NULL,3),(439,'tuyenoc','123','tuyen','1997-01-06','nam','tuyen1@gmail.com','019919191','images/default/avatar_default.jpg',NULL,3),(440,'tuyennnn','202cb962ac59075b964b07152d234b70','tuyen','1997-01-07','nam','tuyen1@gmail.com','096127834','images/default/avatar_default.jpg',NULL,3),(493,'admin','202cb962ac59075b964b07152d234b70','admin','1997-01-07','nam','khang@gmail.com','0961659293','images/default/avatar_default.jpg',NULL,1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER check_username

 before insert ON account

 FOR EACH ROW

BEGIN
	declare usname nvarchar(100);
    set usname = new.accountname;
	if exists(select * from account where accountname = usname) then
        SIGNAL sqlstate '45001' set message_text = "No way ! You cannot do this !";
	end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `account_comment`
--

DROP TABLE IF EXISTS `account_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `discussion_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `account_id` (`account_id`),
  KEY `discussion_id` (`discussion_id`),
  CONSTRAINT `account_comment_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE,
  CONSTRAINT `account_comment_ibfk_2` FOREIGN KEY (`discussion_id`) REFERENCES `discussion` (`discussion_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_comment`
--

LOCK TABLES `account_comment` WRITE;
/*!40000 ALTER TABLE `account_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER number_comment_insert

 after insert ON account_comment

 FOR EACH ROW

BEGIN
	declare disID int;
	set disID = new.discussion_id;
    update discussion set reply = (select count(comment_id) from account_comment where discussion_id = disID)
    where discussion_id = disID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER number_comment_delete

 after delete ON account_comment

 FOR EACH ROW

BEGIN
	declare disID int;
	set disID = old.discussion_id;
    update discussion set reply = (select count(comment_id) from account_comment where discussion_id = disID)
    where discussion_id = disID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(100) DEFAULT NULL,
  `startday` date DEFAULT NULL,
  `endday` date DEFAULT NULL,
  `timestudy` varchar(100) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `number_of_students` int(11) DEFAULT NULL,
  `testday` varchar(100) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'151101A','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',8,'2017-09-10 00:00:00',1),(2,'151101B','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',0,'2017-09-10 00:00:00',1),(3,'151101C','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',2,'2017-09-10 00:00:00',1),(4,'151101D','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',1,'2017-09-10 00:00:00',1),(5,'151101E','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',2,'2017-09-10 00:00:00',1),(6,'151101Q','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',0,'2017-09-10 00:00:00',1),(7,'151101Ư','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',1,'2017-09-10 00:00:00',1),(8,'151101F','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',1,'2017-09-10 00:00:00',1),(9,'151101G','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',0,'2017-09-10 00:00:00',2),(10,'151102A','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',2,'2017-09-10 00:00:00',3),(11,'151102B','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',2,'2017-09-10 00:00:00',4),(12,'151102C','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',1,'2017-09-10 00:00:00',5),(13,'151103R','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',0,'2017-09-10 00:00:00',1),(14,'151102Q','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',1,'2017-09-10 00:00:00',2),(15,'15110OI','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',1,'2017-09-10 00:00:00',3),(16,'15110TR','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',1,'2017-09-10 00:00:00',4),(17,'15110IOS','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',0,'2017-09-10 00:00:00',5),(18,'15110TIN','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',1,'2017-09-10 00:00:00',1),(19,'15110UI','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',0,'2017-09-10 00:00:00',2),(20,'151101JDS','2018-01-30','2017-01-10','Thứ 3-5-7','Số 1, Võ Văn Ngân, Q.Thủ Đức',1,'2017-09-10 00:00:00',3),(21,'15110ƯETR','2018-01-30','2017-09-09','Thứ 2-4-6','Số 1, Võ Văn Ngân, Q.Thủ Đức',0,'2017-09-10 00:00:00',4);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(100) DEFAULT NULL,
  `courseimage` varchar(50) DEFAULT 'images/default/course_default.jpg',
  `description` varchar(200) DEFAULT NULL,
  `info` text,
  `fee` decimal(18,0) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Lập trình IOS','images\\default/course_default.jpg',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',5000000,1),(2,'Photoshop chuyên nghiệp','images\\default/course_default.jpg',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',2500000,2),(3,'Tin học văn phòng','images\\default/course_default.jpg',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',3000000,3),(4,'Lập trình di động','images\\default/course_default.jpg',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',3500000,1),(5,'Mạng máy tính','images\\default/course_default.jpg',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',2500000,1),(6,'Hệ quản trị cơ sở dữ liệu','images\\default/course_default.jpg',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',1000000,1),(7,'Tin học cho trẻ','images\\default/course_default.jpg',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',2400000,1),(8,'Adobe illustrator căn bản','images\\default/course_default.jpg',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',NULL,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion` (
  `discussion_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `postedby` varchar(100) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `reply` int(11) DEFAULT '0',
  `discussiontopic_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`discussion_id`),
  KEY `discussiontopic_id` (`discussiontopic_id`),
  KEY `fk_dis_acc` (`account_id`),
  CONSTRAINT `discussion_ibfk_1` FOREIGN KEY (`discussiontopic_id`) REFERENCES `discussion_topic` (`discussiontopic_id`),
  CONSTRAINT `fk_dis_acc` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion`
--

LOCK TABLES `discussion` WRITE;
/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_thread`
--

DROP TABLE IF EXISTS `discussion_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_thread` (
  `discussionthread_id` int(11) NOT NULL AUTO_INCREMENT,
  `discussionthread_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`discussionthread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_thread`
--

LOCK TABLES `discussion_thread` WRITE;
/*!40000 ALTER TABLE `discussion_thread` DISABLE KEYS */;
INSERT INTO `discussion_thread` VALUES (1,'Đại sảnh'),(2,'Góc lập trình'),(3,'Góc công nghệ'),(4,'Khu giải trí'),(5,'Thương mại & mua bán');
/*!40000 ALTER TABLE `discussion_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_topic`
--

DROP TABLE IF EXISTS `discussion_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_topic` (
  `discussiontopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `discussiontopic_name` varchar(100) DEFAULT NULL,
  `discussionthread_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`discussiontopic_id`),
  KEY `discussionthread_id` (`discussionthread_id`),
  CONSTRAINT `discussion_topic_ibfk_1` FOREIGN KEY (`discussionthread_id`) REFERENCES `discussion_thread` (`discussionthread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_topic`
--

LOCK TABLES `discussion_topic` WRITE;
/*!40000 ALTER TABLE `discussion_topic` DISABLE KEYS */;
INSERT INTO `discussion_topic` VALUES (1,'Thông báo',1),(2,'Thắc mắc và góp ý',1),(3,'Sự kiện',1),(4,'Hỏi đáp & bàn luận',2),(5,'Chia sẻ tài liệu',2),(6,'Hỏi & đáp công nghệ',3),(7,'Thiết bị di động',3),(8,'Đồ điện tử',3),(9,'Chuyện trò linh tinh',4),(10,'Game',4),(11,'Thương mại và mua bán',5);
/*!40000 ALTER TABLE `discussion_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content_news` text,
  `image` varchar(50) DEFAULT 'images/default/course_default.jpg',
  `account_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `account_id` (`account_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE,
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type_of_news` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Teacher'),(3,'Student');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_class`
--

DROP TABLE IF EXISTS `student_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_class` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `point` float DEFAULT NULL,
  `confirm` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`sc_id`),
  KEY `account_id` (`account_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `student_class_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE,
  CONSTRAINT `student_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class`
--

LOCK TABLES `student_class` WRITE;
/*!40000 ALTER TABLE `student_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER number_of_student_insert

 after insert ON student_class

 FOR EACH ROW

BEGIN
	declare classID int;
	set classID = new.class_id;
    update class set number_of_students = (select count(sc_id) from student_class where confirm=1 and class_id = classID)
    where class_id = classID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER number_of_student_update

 after update ON student_class

 FOR EACH ROW

BEGIN
	declare classID int;
	set classID = new.class_id;
    update class set number_of_students = (select count(sc_id) from student_class where confirm=1 and class_id = classID)
    where class_id = classID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER number_of_student_delete

 after delete ON student_class

 FOR EACH ROW

BEGIN
	declare classID int;
	set classID = old.class_id;
    update class set number_of_students = (select count(sc_id) from student_class where confirm=1 and class_id = classID)
    where class_id = classID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `teacher_class`
--

DROP TABLE IF EXISTS `teacher_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_class` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `salary` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`tc_id`),
  KEY `account_id` (`account_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `teacher_class_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE,
  CONSTRAINT `teacher_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_class`
--

LOCK TABLES `teacher_class` WRITE;
/*!40000 ALTER TABLE `teacher_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topicname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Lập trình'),(2,'Đồ họa hình ảnh'),(3,'Văn phòng');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_news`
--

DROP TABLE IF EXISTS `type_of_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_of_news` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_news`
--

LOCK TABLES `type_of_news` WRITE;
/*!40000 ALTER TABLE `type_of_news` DISABLE KEYS */;
INSERT INTO `type_of_news` VALUES (1,'Tin công nghệ'),(2,'Tin Tuyển Dụng'),(3,'Tin Khuyến Mãi'),(4,'Tin nghĩ lễ');
/*!40000 ALTER TABLE `type_of_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'web_ttth'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-12 17:34:56
