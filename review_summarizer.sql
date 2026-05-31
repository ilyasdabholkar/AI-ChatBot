-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: review_summarizer
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('080058a0-4664-4c09-aafc-64647d9356bf','8cd8a44eac045bf8358e5afd74522d14636605bd7e9aa43726155621e5a6746e','2026-05-29 15:53:53.456','20260529155353_init',NULL,NULL,'2026-05-29 15:53:53.285',1),('59fc25bd-c3fc-4552-b1a0-bc15e356d723','8908e3530fb013cf0996440c9ea24404e5a1eb2657829b2d4e7a75539c9843e6','2026-05-29 16:01:56.382','20260529160156_refine_schema',NULL,NULL,'2026-05-29 16:01:56.166',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Sony WH-1000XM5 Wireless Headphones','Premium noise-canceling wireless headphones with industry-leading audio quality, long battery life, and comfortable over-ear design.',349.99),(2,'Apple MacBook Air M3 13-inch','Lightweight laptop powered by the Apple M3 chip featuring exceptional battery life, fast performance, and a premium Retina display.',1299),(3,'Ninja Professional Blender','High-performance kitchen blender designed for smoothies, frozen drinks, sauces, and food preparation.',119.99),(4,'Kindle Paperwhite Signature Edition','Waterproof e-reader with adjustable warm light, wireless charging support, and weeks of battery life.',189.99),(5,'Herman Miller Aeron Chair','Ergonomic office chair engineered for long work sessions with advanced lumbar support and breathable mesh construction.',1699);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` tinyint NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `productId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_productId_fkey` (`productId`),
  CONSTRAINT `reviews_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'Michael Johnson',5,'I purchased these headphones primarily for business travel and they have exceeded my expectations in nearly every area. The noise cancellation is incredibly effective and significantly reduces airplane engine noise, making long flights much more comfortable. Sound quality is balanced and detailed, with excellent clarity for both music and podcasts. Battery life has consistently lasted through multiple days of use without requiring a recharge. The ear cushions remain comfortable even during extended listening sessions. While the price is premium, the overall experience justifies the investment for anyone who values audio quality and comfort.','2025-01-10 09:15:00.000',1),(2,'Sarah Thompson',5,'After comparing several premium headphone models, I decided on these and have been very satisfied. The pairing process with my phone and laptop was seamless, and switching between devices works surprisingly well. I work in a busy office environment and the active noise cancellation helps me stay focused throughout the day. The microphone quality during video meetings has also received positive feedback from colleagues. Build quality feels durable and premium, making these headphones feel like a long-term purchase.','2025-01-18 14:30:00.000',1),(3,'David Martinez',4,'The sound quality is excellent and the comfort level is among the best I have experienced. Bass response is present without overwhelming the mids and highs. My only criticism is that the touch controls occasionally register accidental inputs when adjusting the headphones. Aside from that minor issue, battery performance, wireless range, and noise cancellation have all been outstanding. I would recommend them to frequent travelers and remote workers alike.','2025-02-02 11:05:00.000',1),(4,'Emily Carter',5,'These headphones have transformed my daily commute. The ability to block out train and city noise allows me to enjoy music at lower and safer volume levels. The companion app provides useful customization options, and I appreciate the ability to fine-tune the equalizer. The lightweight design prevents fatigue even after several hours of use. Overall, this is one of the most impressive consumer electronics purchases I have made recently.','2025-02-15 16:40:00.000',1),(5,'Ryan Cooper',4,'I use these headphones for a combination of gaming, music, and online meetings. They perform very well across all three use cases. Audio is detailed, voices are clear, and the battery life consistently exceeds my expectations. The carrying case is sturdy and convenient for travel. Although the headphones are somewhat expensive, the combination of features and performance makes them a worthwhile purchase.','2025-03-01 19:20:00.000',1),(6,'Jessica Lee',5,'As a software developer, I was looking for a portable machine that could handle coding, testing, and light design work without sacrificing battery life. This laptop has delivered exactly that. The M3 chip feels incredibly responsive, applications launch instantly, and multitasking remains smooth even with numerous browser tabs and development tools open. Battery life regularly lasts an entire workday. The display is sharp, color accurate, and comfortable to use for extended periods.','2025-01-12 10:45:00.000',2),(7,'Andrew Walker',5,'I upgraded from an older Intel-based laptop and the difference is dramatic. Performance improvements are noticeable in everyday tasks and more demanding workflows alike. The laptop remains cool and silent during operation, which is something I truly appreciate. Build quality is exceptional, and the keyboard and trackpad continue to be among the best available on any laptop.','2025-01-25 13:10:00.000',2),(8,'Natalie Brooks',4,'I purchased this device for graduate school and it has been an excellent companion for research, writing, and presentations. The lightweight design makes it easy to carry around campus, and battery life means I rarely need to bring a charger. The only reason I am giving four stars instead of five is the limited number of ports, which sometimes requires adapters. Aside from that, the experience has been excellent.','2025-02-08 08:20:00.000',2),(9,'Kevin Scott',5,'This laptop strikes an ideal balance between portability and performance. Video editing projects that used to take significant time now complete much faster. The screen brightness and color reproduction are excellent for creative work. I also appreciate how quickly the system wakes from sleep and remains responsive throughout the day. It feels like a polished and refined product in every respect.','2025-02-21 15:35:00.000',2),(10,'Olivia Harris',5,'The overall user experience is fantastic. Everything from setup to daily use has been straightforward and reliable. The battery life alone makes this laptop stand out compared to competitors I have used in the past. The speakers deliver surprisingly rich audio, and the display is vibrant and sharp. I would confidently recommend this machine to students and professionals alike.','2025-03-05 18:50:00.000',2),(11,'Linda Parker',5,'This blender has become one of the most frequently used appliances in my kitchen. It easily handles frozen fruit, ice, and leafy vegetables when making smoothies. The motor is powerful enough to create a consistently smooth texture without leaving chunks behind. Cleanup is straightforward since the components are easy to disassemble and wash. For the price, the performance is excellent.','2025-01-07 07:55:00.000',3),(12,'Thomas Reed',4,'I purchased this blender to support healthier eating habits and it has worked extremely well. Smoothies, protein shakes, and soups all come out with a professional-quality consistency. The container is large enough to prepare servings for the entire family. The only downside is that it can be somewhat loud when operating at maximum speed, though that is expected from a high-powered blender.','2025-01-20 17:25:00.000',3),(13,'Rachel Morgan',5,'I have used many blenders over the years and this is one of the most capable models in its price range. It crushes ice effortlessly and handles frozen ingredients without struggling. The blades are sharp and efficient, producing smooth results quickly. Build quality feels durable and I expect it to last for years with regular use.','2025-02-04 12:10:00.000',3),(14,'Brandon King',5,'Meal preparation has become significantly easier since purchasing this blender. I use it for sauces, smoothies, and even homemade nut butter. Performance has been consistently reliable and the controls are simple to understand. The large capacity is particularly useful when preparing food for multiple people. Overall, I am extremely pleased with the purchase.','2025-02-18 09:45:00.000',3),(15,'Sophia Turner',4,'The blender delivers strong performance and excellent value. It handles a wide variety of ingredients and consistently produces smooth results. Cleaning is simple and the included pitcher feels sturdy. While the motor noise is noticeable, the blending power more than compensates for it. I would definitely recommend it to anyone looking for a versatile kitchen appliance.','2025-03-03 14:15:00.000',3),(16,'Karen Mitchell',5,'I read regularly and this device has dramatically improved my reading experience. The screen is crisp, easy on the eyes, and highly readable even in direct sunlight. Battery life lasts for weeks, which means I rarely think about charging it. The warm light feature is especially helpful during nighttime reading sessions. Overall, it is an excellent companion for avid readers.','2025-01-11 20:30:00.000',4),(17,'Daniel Foster',5,'I travel frequently and wanted a lightweight alternative to carrying multiple books. This e-reader has been perfect for that purpose. Storage capacity is generous, performance is responsive, and the waterproof design provides peace of mind when reading near water. The device feels premium and thoughtfully designed.','2025-01-28 21:10:00.000',4),(18,'Grace Bennett',4,'The reading experience is outstanding and the display quality is among the best I have seen on an e-reader. Page turns are quick, and the adjustable lighting options make it comfortable to read in various environments. I deducted one star only because I would like even more customization options for organizing large libraries. Otherwise, it is a fantastic product.','2025-02-09 18:05:00.000',4),(19,'Matthew Evans',5,'This device has encouraged me to read more consistently. The lightweight form factor makes it comfortable to hold for extended periods and the battery life is exceptional. Wireless charging is a convenient addition, and the interface remains intuitive and easy to navigate. It offers everything I need in an e-reader.','2025-02-22 22:15:00.000',4),(20,'Chloe Richardson',5,'I was initially hesitant about switching from physical books, but this device won me over quickly. The display closely resembles paper, reducing eye strain during long reading sessions. Synchronization across devices works seamlessly and the overall reading experience feels polished. I would recommend it to anyone who enjoys reading regularly.','2025-03-06 16:25:00.000',4),(21,'Robert Jenkins',5,'I work remotely and spend eight to ten hours per day at my desk. After several months of use, this chair has significantly improved my comfort during long work sessions. The lumbar support is excellent, the mesh material remains breathable, and the adjustment options make it easy to achieve a personalized fit. Although expensive, it feels like an investment in long-term health and productivity.','2025-01-09 08:45:00.000',5),(22,'Amanda Lewis',5,'This is easily the most comfortable office chair I have ever owned. The ergonomic design encourages proper posture without feeling restrictive. I previously experienced lower back discomfort during long workdays, and that issue has been noticeably reduced since switching to this chair. The build quality is exceptional and every component feels premium.','2025-01-23 11:55:00.000',5),(23,'Christopher Adams',4,'The chair delivers outstanding support and comfort, especially during extended periods of desk work. The mesh material keeps airflow moving and prevents heat buildup. Assembly was straightforward and adjustment controls are intuitive. My only hesitation is the high price point, though the quality largely justifies the cost.','2025-02-07 13:40:00.000',5),(24,'Melissa Green',5,'As someone who spends most of the day in meetings and focused computer work, I appreciate how comfortable this chair remains throughout the day. The seat distributes weight evenly and the recline mechanism feels smooth and natural. It is one of the few office chairs I have used that remains comfortable after many consecutive hours.','2025-02-19 10:20:00.000',5),(25,'Jason Wright',5,'The attention to ergonomic detail is impressive. Every adjustment serves a practical purpose and allows the chair to accommodate different working styles. The materials feel durable and well engineered. While the initial investment is substantial, the comfort and support provided make it worthwhile for anyone spending significant time at a desk.','2025-03-04 17:35:00.000',5);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summaries`
--

DROP TABLE IF EXISTS `summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summaries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `generatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `expiresAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `summaries_productId_key` (`productId`),
  CONSTRAINT `summaries_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summaries`
--

LOCK TABLES `summaries` WRITE;
/*!40000 ALTER TABLE `summaries` DISABLE KEYS */;
INSERT INTO `summaries` VALUES (1,3,'Key themes in these customer reviews include:\n\nPositive themes:\n- The blender delivers strong performance and excellent value.\n- It produces smooth results and handles a wide variety of ingredients with ease.\n- The cleaning process is simple, and the included pitcher feels sturdy.\n- The product is versatile and reliable, making meal preparation easier.\n\nNegative theme:\n- The motor noise is noticeable, especially at maximum speed.\n\nOverall, customers are extremely pleased with the purchase, praising its performance, value, and durability. They appreciate its ability to handle frozen ingredients, leafy vegetables, and tough blending tasks with ease. While the motor noise is a drawback, it\'s a minor trade-off for the blender\'s excellent performance and value.','2026-05-31 07:59:40.352','2026-06-07 07:59:40.354'),(2,2,'Overall, this laptop delivers a user experience that surpasses expectations, featuring a fantastic balance between portability and performance. The laptop strikes a perfect balance between the requirements of students and professionals alike, with its lightweight design making it easy to carry around campus and battery life ensuring smooth operation throughout the day. This laptop is especially impressive when working on coding, testing, and light design tasks, with exceptional build quality that allows for smooth performance without sacrificing energy efficiency. In terms of user experience, this laptop offers a polished and refined product in every respect, with its versatile ports, limited number of ports, and lack of external devices presenting challenges in some scenarios. Nonetheless, the user experience is exceptional, thanks to outstanding battery life, performance improvements, and build quality that remain top-notch even after extended use. As a software developer, this laptop has delivered on its promise of a portable machine capable of handling coding, testing, and light design work without sacrificing battery life, making it an excellent choice for professionals like you.','2026-05-31 09:05:51.800','2026-06-07 09:05:51.801'),(3,1,'In summary, these headphone speakers are an excellent value for their combination of audio clarity, battery life, and customization options. The sound quality is top-notch, with detailed bass response, balanced midrange, and clear highs. The comfort level is outstanding, thanks to the comfortable ear cuishions that remain comfortable even during long listening sessions. The noise cancelation is impressively effective, reducing airplane engine noise by a significant margin, making business travel more comfortable. The battery life exceeds expectations, lasting up to 24 hours with active use. Overall, these headphones are highly recommended for anyone who values audio quality and comfort while traveling.','2026-05-31 09:12:59.701','2026-06-07 09:12:59.701');
/*!40000 ALTER TABLE `summaries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31 14:44:48
