-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: timetable
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `progress`
--
SET AUTOCOMMIT=0;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`student_id`,`subject_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_progress_subject1_idx` (`subject_id`),
  KEY `fk_progress_student1_idx` (`student_id`),
  CONSTRAINT `fk_progress_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_progress_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (1,2,1,1,'2016-03-01 04:15:00'),(2,10,1,1,'2016-03-08 05:10:00'),(3,10,1,1,'2016-03-08 05:10:00'),(4,10,1,1,'2016-03-08 05:10:00'),(5,10,1,1,'2016-03-01 05:10:00'),(6,10,1,1,'2016-03-02 05:10:00'),(7,1,1,1,'2016-03-03 05:10:00'),(8,3,1,1,'2016-03-04 05:10:00'),(9,4,1,1,'2016-03-05 05:10:00'),(10,2,1,1,'2016-03-06 05:10:00'),(11,4,1,1,'2016-03-07 05:10:00'),(12,1,1,1,'2016-03-08 05:10:00'),(13,2,1,1,'2016-03-09 05:10:00'),(14,4,1,1,'2016-03-10 05:10:00'),(15,1,1,1,'2016-03-11 05:10:00'),(16,1,1,1,'2016-03-12 05:10:00'),(17,1,1,1,'2016-03-13 05:10:00'),(18,1,1,1,'2016-03-14 05:10:00');
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `skype` varchar(45) NOT NULL,
  `descr` text NOT NULL,
  `phone` varchar(45) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`group_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `skype_UNIQUE` (`skype`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `fk_student_group_idx` (`group_id`),
  CONSTRAINT `fk_student_group` FOREIGN KEY (`group_id`) REFERENCES `student_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Абрамович Максим  Викторович','1','bendikov@cemi.rssi.ru','abram','Учился я... А НАДО БЫЛО ДУМАТЬ...','801775-36159',1),(2,'Алешко Валерий  Игореввич','1','zacharovaa@mail.ru','aleshko','Коротко о себе: Год выпуска 1988. Пробег 26. Цвет лёгкого загара. Фары зеленые. Документы на руках. Кузов не битый. Крыша на месте. Тормоза в норме. Все опции. Завожусь с полуоборота…',' 8-1775-7-95-03',1),(3,'Брычиков Даниил  Дмитриевич','1','brich@mail.ru','brich','Мне всё по зубам… иногда, правда, и по шее достаётся…','+375 29 658-41-82',1),(4,'Вистяж Алексей  Владимирович','1','vist@tut.by','vist','Я никогда не вру, но я … я недоговариваю.','+375-17-217–04–24',1),(5,'Глубокий Станислав  Сергеевич','1','glub@tut.by','glub','Я отвлекаюсь от повседневной суеты. Ломаю стереотипы, разрушаю рамки, перехожу черты, перегибаю палки... В целом, расширяю горизонты.','+375 29 1014933',1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_group`
--

DROP TABLE IF EXISTS `student_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_group`
--

LOCK TABLES `student_group` WRITE;
/*!40000 ALTER TABLE `student_group` DISABLE KEYS */;
INSERT INTO `student_group` VALUES (1,'553501'),(2,'551001'),(3,'550701'),(4,'550531'),(5,'550501'),(6,'453501'),(7,'451001'),(8,'450701'),(9,'450531'),(10,'450501'),(11,'353501'),(12,'351001'),(13,'350701');
/*!40000 ALTER TABLE `student_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Политология'),(2,'Социология'),(3,'Филоссофия'),(4,'Логика'),(5,'Экономика'),(6,'Экология'),(7,'Физика'),(8,'Математика'),(9,'Химия'),(10,'История'),(11,'Информатика'),(12,'Охрана труда'),(13,'Инженерная графика');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_teacher`
--

DROP TABLE IF EXISTS `subject_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_teacher` (
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`subject_id`,`teacher_id`),
  KEY `fk_subject_has_teacher_teacher1_idx` (`teacher_id`),
  KEY `fk_subject_has_teacher_subject1_idx` (`subject_id`),
  CONSTRAINT `fk_subject_has_teacher_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_teacher_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_teacher`
--

LOCK TABLES `subject_teacher` WRITE;
/*!40000 ALTER TABLE `subject_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `skype` varchar(45) NOT NULL,
  `descr` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `skype_UNIQUE` (`skype`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'БОБКОВ Владимир Андреевич','1','bob@mail.ru','+375(017) 367-05-29','bob','зав. каф., профессор, доктор исторических наук, член-корреспондент НАН Беларуси, заслуженный деятель науки Республики Беларусь'),(2,'БЕЛЯЕВ Алексей Викторович','1','bel@tut.by','+375(017) 368-87-69','bel','доцент; к.и.н.'),(3,'ДУБОВИК Александр Константинович','1','dub@gmail.com','(+375 17) 292-31-72 ','dub','доцент; к.и.н.'),(4,'Лойк Александр Иванович','2','loiko@rambler.ru',' (+375 17) 293-96-23','loiko','Заведующий кафедрой, д.ф.н., профессор');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`group_id`,`subject_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_timetable_group1_idx` (`group_id`),
  KEY `fk_timetable_subject1_idx` (`subject_id`),
  CONSTRAINT `fk_timetable_group1` FOREIGN KEY (`group_id`) REFERENCES `student_group` (`id`),
  CONSTRAINT `fk_timetable_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,'2016-03-07 02:00:00','2016-03-07 03:35:00',1,1),(2,'2016-03-07 03:55:00','2016-03-07 05:30:00',1,2),(3,'2016-03-07 05:40:00','2016-03-07 07:15:00',1,3),(4,'2016-03-07 07:25:00','2016-03-07 09:00:00',1,4),(7,'2016-03-08 02:00:00','2016-03-08 03:35:00',1,5),(10,'2016-03-08 13:42:38','2016-03-08 05:30:00',1,3),(11,'2016-03-08 05:40:00','2016-03-08 07:15:00',1,2),(12,'2016-03-08 07:25:00','2016-03-08 09:00:00',1,6),(13,'2016-03-09 03:55:00','2016-03-09 05:30:00',1,7),(14,'2016-03-09 05:40:00','2016-03-09 07:15:00',1,8),(15,'2016-03-09 07:25:00','2016-03-09 09:00:00',1,9),(16,'2016-03-10 02:00:00','2016-03-10 03:35:00',1,7),(17,'2016-03-10 03:55:00','2016-03-10 05:30:00',1,1),(18,'2016-03-10 05:40:00','2016-03-10 07:15:00',1,11),(19,'2016-03-10 07:25:00','2016-03-10 09:00:00',1,3),(20,'2016-03-11 05:40:00','2016-03-11 07:15:00',1,5),(21,'2016-03-11 07:15:00','2016-03-11 09:00:00',1,2),(22,'2016-03-12 02:00:00','2016-03-12 03:35:00',1,12),(23,'2016-03-08 03:55:00','2016-03-08 05:30:00',1,13);
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@admin.ru','$2a$10$2Uq9QjwEskZUFaOY1h0q5u3OubNCuLBowKMqH1L3iXRL9R5qSjUxC','ROLE_ADMIN'),(2,'user@user.by','$2a$10$60Zjv6nRNxcAkW/s1.OaVuu4mOClXDw8TTkDirL7acGa0841PvHiG','ROLE_USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-14 21:54:44
