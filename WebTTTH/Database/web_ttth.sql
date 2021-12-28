-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: web_ttth
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=500 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (257,'Khangle','202cb962ac59075b964b07152d234b70','LeKhang','1997-01-20','Nữ','khang@gmail.com','098188181','images\\avatar/77927725_p0_master1200.jpg',NULL,2),(493,'admin','202cb962ac59075b964b07152d234b70','admin','2000-12-26','Nam','admin@gmail.com','0979842998','images\\avatars/79070562_p2.jpg',NULL,1),(494,'thaianh','000','Lê Thái Anh','1997-01-01','nam','lta@gmail.com','13518136161','images/default/avatar_default.jpg',NULL,3),(495,'phong','202cb962ac59075b964b07152d234b70','Lê Hoàng Thiên Phong','1997-01-01','nam','phong@gmail.com','1351351','images/default/avatar_default.jpg',NULL,3),(499,'thang','202cb962ac59075b964b07152d234b70','Nguyễn Viết Thắng','2021-12-23','Nữ','thang@gmail.com','1614161461','images/default/avatar_default.jpg',NULL,2);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_comment`
--

DROP TABLE IF EXISTS `account_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_comment`
--

LOCK TABLES `account_comment` WRITE;
/*!40000 ALTER TABLE `account_comment` DISABLE KEYS */;
INSERT INTO `account_comment` VALUES (1,495,1,'2021-12-22 14:28:01','Ch?u luôn'),(2,493,1,'2021-12-22 15:12:22','Test Comment'),(3,257,1,'2021-12-22 16:23:45','j');
/*!40000 ALTER TABLE `account_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `class` VALUES (1,'151101A','2022-01-30','2021-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',1,'2022-09-10 00:00:00',1),(2,'151101B','2022-01-30','2021-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',1),(3,'151101C','2022-01-30','2021-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',1),(4,'151101D','2022-01-30','2022-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',1),(5,'151101E','2022-01-30','2022-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',1),(6,'151101Q','2022-01-30','2022-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',1),(7,'151101Ư','2022-01-30','2022-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',1),(8,'151101F','2022-01-30','2022-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',1),(9,'151101G','2022-01-30','2022-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',2),(10,'151102A','2022-01-30','2022-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',3),(11,'151102B','2022-01-30','2022-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',4),(12,'151102C','2022-01-30','2022-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',5),(13,'151103R','2022-01-30','2022-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',1),(14,'151102Q','2022-01-30','2022-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',2),(15,'15110OI','2022-01-30','2022-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',3),(16,'15110TR','2022-01-30','2022-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',4),(17,'15110IOS','2022-01-30','2022-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',5),(18,'15110TIN','2022-01-30','2022-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',1),(19,'15110UI','2022-01-30','2022-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',2),(20,'151101JDS','2022-01-30','2022-09-09','Thứ 3-5-7','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',3),(21,'15110ƯETR','2022-01-30','2022-09-09','Thứ 2-4-6','Số 12, Trần Thái Tông, Thanh Xuân',0,'2022-09-10 00:00:00',4);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Lập trình IOS','images\\course/laptrinhios.jpg','','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',5000000,1),(2,'Photoshop chuyên nghiệp','images\\course/pts.png','','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',2500000,2),(3,'Tin học văn phòng','images\\course/thvphong.png',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',3000000,3),(4,'Lập trình di động','images\\course/lta.jpg','','“Tại sao lập trình C là môn đầu tiên phải học?” – ',3500000,1),(5,'Mạng máy tính','images\\course/mmt.png',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',2500000,1),(6,'Hệ quản trị cơ sở dữ liệu','images\\course/csdl.png',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',1000000,1),(7,'Tin học cho trẻ','images\\course/thct.jpg',NULL,'“Tại sao lập trình C là môn đầu tiên phải học?” – \r\nĐây có lẽ là câu hỏi của rất nhiều bạn sinh viên năm thứ nhất học tại khoa \r\nCông Nghệ Thông Tin (CNTT) thuộc các trường đại học trên cả nước hay các bạn học \r\ntại những trung tâm đào tạo về lập trình. Nhiều bạn trẻ bao gồm tác giả bài viết này\r\n trươc đây cảm thấy rất thắc mắc tại sao lại phải học lập trình C.\r\n Chúng ta sẽ cùng bàn luận về vấn đề này.\r\n\r\nThường thì phần lớn các bạn sinh viên theo học CNTT đều chưa định hình được rõ mình\r\n sẽ làm gì trong năm đầu tiên ở trường đại học. Nội dung hay lộ trình học CNTT \r\nở các trường đại học sẽ bao gồm rất nhiều môn chuyên ngành, bao gồm: lập trình, \r\nthiết kế, an ninh mạng, marketing online,.. Mỗi 1 môn học sẽ mang tới cho người học \r\nmột lĩnh vực khác nhau để đi làm nhưng những bạn mới vào trường chưa thể ý thức được\r\n điều đó. Và lập trình C được chọn là môn khời đầu vì nó rất tốt cho việc tư duy khi \r\ntheo học ngành CNTT.\r\n\r\nTại sao lập trình C lại được chọn làm môn khởi đầu?\r\n\r\nChắc chắn năm thứ nhất ở các trường đại học các thầy cô giáo sẽ mang lập trình C \r\nra làm môn đầu tiên để giảng dạy cho các bạn còn đang bỡ ngỡ bước khi mới gia nhập\r\n vào thế giới của máy tính. Vậy tại sao lập trình C lại được ưu tiên chứ không phải\r\n môn học khác? Vietpro xin phép được giải thích thắc mắc của các bạn như sau.\r\n\r\nCác bạn học công nghệ thông tin thường chuyên về các môn tự nhiên như toán, lý, hóa \r\nkhi còn đang học phổ thông. Những môn học này sẽ ứng dụng rất nhiều vào chuyên ngành\r\n và được dạy lại một lần nữa khi các bạn học năm thứ nhất đại học, với mục đích rèn\r\n giũa lại cho các bạn khả năng tư duy cũng như giúp các bạn phát triển nghiệp vụ sau\r\n này. Và ngôn ngữ lập trình C là một công cụ hỗ trỡ cho các bạn phát triển những\r\n tư duy đó.',2400000,1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion`
--

LOCK TABLES `discussion` WRITE;
/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
INSERT INTO `discussion` VALUES (1,'Th?o Lu?n - Di?n ?àn','Không có gì\r\n',NULL,'2021-11-25',3,1,493),(2,'L?p trình C++','T?i sao ph?i h?c L?p trình c/c++?',NULL,'2021-12-22',0,4,495);
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_thread`
--

DROP TABLE IF EXISTS `discussion_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'HỆ SINH THÁI GALAXY - MÓN QUÀ MÙA LỄ HỘI','2021-11-25','Trong thời đại công nghệ số, những sản phẩm thông minh đã trở thành những món đồ vật gắn liền trong đời sống hàng ngày. Và nếu như bạn là người yêu thích công nghệ và đang tìm kiếm những vật dụng thông minh bên cạnh chiếc Galaxy phone sao cho vừa thể hiện được cá tính, vừa giúp cho đời sống cá nhân trở nên hiện đại và tiện ích hơn, kết nối liền mạch, trải nghiệm trọn vẹn hơn, có lẽ những sản phẩm thuộc Hệ sinh thái Galaxy bao gồm Galaxy Tab S7 FE, Galaxy Buds2 và Galaxy Watch4 Series là một trong những món quà bạn nên cân nhắc.','images\\TinTuc/glx.jpg',493,1),(2,'Trên tay Honor X30 5G: Chưa đến 5.5 triệu đồng, sức mạnh ăn đứt Nokia G50 5G','2021-12-22','Honor X30 5G là chiếc smartphone 5G giá rẻ nổi bật hàng đầu hiện nay. Nó là bước đi cụ thể đánh vào phân khúc smartphone 5G giá rẻ rất tiềm năng mà Nokia G50 5G đang là một trong những sản phẩm nổi bật nhất cùng với Redmi Note 11 5G.','images\\TinTuc/hon.jpg',493,1),(3,'Apple dự định sẽ nâng cấp chip Apple Silicon theo chu kỳ 18 tháng','2021-12-22','Theo AppleInsider, trong báo cáo đến từ trang Commercial Times của Đài Loan, các nguồn tin trong chuỗi cung ứng cho biết Apple đang nhắm đến việc cập nhật dòng sản phẩm Apple Silicon của mình 18 tháng một lần. Điều này khác với các chip A-series, vốn có bước nhảy vọt thế hệ vào mùa thu mỗi năm như một phần trong sự nâng cấp hằng năm của iPhone.','images\\TinTuc/ap.jpg',493,1),(4,'Huawei Tuyển Dụng Lập trình viên Java','2021-12-22','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words','images\\TinTuc/td1.png',493,2),(5,'ITFIT A08C: Mẫu tai nghe cho dân thể thao giá chỉ 599K!!!','2021-12-22','Bạn là một gymer, bạn là một người thích tập thể dục nhưng trên hết bạn là một người yêu âm nhạc. Vậy làm cách gì để kết hợp giữa 2 việc thể thao và âm nhạc? Đặc biệt là phải có mức giá hợp lý. Video này mình sẽ trải nghiệm mẫu tai nghe ITFIT A08C. ITFIT A08C một mẫu tai nghe đến từ Samsung với kiểu dáng neck band rất thích hợp với việc chạy bộ, tập gym. Công nghệ cũng đầy đủ như kháng nước IP X3 giúp việc tập thể thao càng trở nên tốt hơn. Chất âm của mẫu tai nghe này chắc chắn sẽ làm hài lòng những người đam mê vừa thể thao vừa nghe nhạc. Bass chắc, đầm, dày các dải âm thanh khác cũng rất ok.','images\\TinTuc/km.jpg',493,3),(6,'Nghỉ lễ phát sóng trực tiếp AFF Cup 2021 trên VTV [CHÍNH THỨC]','2021-12-22','Next Media là đơn vị nắm giữ bản quyền toàn cầu Sports FIVE, trong đó có các hình thức miễn phí và trả tiền trên tất cả các hạ tầng.','images\\TinTuc/nl.jpeg',493,4);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class`
--

LOCK TABLES `student_class` WRITE;
/*!40000 ALTER TABLE `student_class` DISABLE KEYS */;
INSERT INTO `student_class` VALUES (7,257,1,NULL,1),(8,495,1,NULL,0);
/*!40000 ALTER TABLE `student_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_class`
--

DROP TABLE IF EXISTS `teacher_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_class`
--

LOCK TABLES `teacher_class` WRITE;
/*!40000 ALTER TABLE `teacher_class` DISABLE KEYS */;
INSERT INTO `teacher_class` VALUES (1,257,1,NULL),(3,499,1,NULL);
/*!40000 ALTER TABLE `teacher_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `type_of_news` VALUES (1,'Tin Công Nghệ'),(2,'Tin Tuyển Dụng'),(3,'Tin Khuyến Mãi'),(4,'Tin Nghỉ Lễ');
/*!40000 ALTER TABLE `type_of_news` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-28 16:08:56
