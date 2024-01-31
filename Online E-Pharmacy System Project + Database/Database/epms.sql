-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: epms
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbladmin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email_id` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `upass` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladmin`
--

LOCK TABLES `tbladmin` WRITE;
/*!40000 ALTER TABLE `tbladmin` DISABLE KEYS */;
INSERT INTO `tbladmin` VALUES (1,'admin@gmail.com','admin','java@1991','2022-01-26 05:21:44','2022-02-13 10:33:40');
/*!40000 ALTER TABLE `tbladmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcaptcha`
--

DROP TABLE IF EXISTS `tblcaptcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcaptcha` (
  `captcha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcaptcha`
--

LOCK TABLES `tblcaptcha` WRITE;
/*!40000 ALTER TABLE `tblcaptcha` DISABLE KEYS */;
INSERT INTO `tblcaptcha` VALUES ('12529');
/*!40000 ALTER TABLE `tblcaptcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcart`
--

DROP TABLE IF EXISTS `tblcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `medicine_mrp_price` double DEFAULT NULL,
  `medicine_discount_price` double DEFAULT NULL,
  `total_medicines_price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcart`
--

LOCK TABLES `tblcart` WRITE;
/*!40000 ALTER TABLE `tblcart` DISABLE KEYS */;
INSERT INTO `tblcart` VALUES (46,485060,4139,300,249,249,0,'2022-03-24 06:23:25','2022-03-24 11:53:25');
/*!40000 ALTER TABLE `tblcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontact`
--

DROP TABLE IF EXISTS `tblcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcontact` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontact`
--

LOCK TABLES `tblcontact` WRITE;
/*!40000 ALTER TABLE `tblcontact` DISABLE KEYS */;
INSERT INTO `tblcontact` VALUES (1,'Kishor Balasaheb Kadam','kadamk33@gmail.com','9404308673','Asking for some medicine','Is it available Cidmus-100 MG tablet?','2022-01-26 05:32:29');
/*!40000 ALTER TABLE `tblcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomer`
--

DROP TABLE IF EXISTS `tblcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcustomer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `upass` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=910222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomer`
--

LOCK TABLES `tblcustomer` WRITE;
/*!40000 ALTER TABLE `tblcustomer` DISABLE KEYS */;
INSERT INTO `tblcustomer` VALUES (485060,'Kishor Kadam','kadamk33@gmail.com','7276763516','Male','Bhalawani, Ahmednagar.','414102','kishor','java@1991','2022-01-13 06:24:19','2022-02-20 11:47:18'),(725244,'Javed Tamboli','javed.tamboli@gmail.com','8369651475','Male','Charoli, Pune.','411022','javed','javed@123','2022-02-28 04:48:32','2022-02-28 10:18:32'),(865931,'Sagar Prakash Kharmale','sagarkharmale@gmail.com','8456571542','Male','Bhandgaon, Ahmednagar, Maharashtra.','414103','sagar','sagar@123','2022-02-28 10:00:38','2022-02-28 15:30:38'),(870174,'Arun Pandit','30arunpandit@gmail.com','+918265686325','Male','Kharwandi, Newasa, Ahmednagar, Maharashtra','411055','arun','arun@123','2022-02-13 06:24:37','2022-02-13 11:54:37'),(910221,'Abhishek','abhishekchemate00@gmail.com','9424781546','Male','Bhalawani,Ahmednagar,Maharashtra.','414103','abhi','abhi@123','2022-03-08 08:56:34','2022-03-08 14:26:34');
/*!40000 ALTER TABLE `tblcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmedicine`
--

DROP TABLE IF EXISTS `tblmedicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmedicine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(100) DEFAULT NULL,
  `medicine_type` varchar(100) DEFAULT NULL,
  `medicine_description` varchar(900) DEFAULT NULL,
  `medicine_image_name` varchar(200) DEFAULT NULL,
  `medicine_image` varchar(400) DEFAULT NULL,
  `medicine_mrp_price` double DEFAULT NULL,
  `medicine_discount_price` double DEFAULT NULL,
  `medicine_quantity` int DEFAULT NULL,
  `medicine_manufacturing_date` varchar(100) DEFAULT NULL,
  `medicine_expiry_date` varchar(100) DEFAULT NULL,
  `medicine_status` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9728 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmedicine`
--

LOCK TABLES `tblmedicine` WRITE;
/*!40000 ALTER TABLE `tblmedicine` DISABLE KEYS */;
INSERT INTO `tblmedicine` VALUES (287,'Ecosprin Gold 10 MG','Allopathy Medicines','Ecosprin Gold 10 Capsule is a combination medicine that is used to prevent heart attack. It contains Atorvastatin that works by reducing the amount of \"bad\" cholesterol (LDL) and raising the amount of \"good\" cholesterol (HDL) in your blood. High levels of cholesterol can cause your blood vessels to narrow (atherosclerosis). Lowering the amount of cholesterol reduces the chances of heart diseases and helps you remain healthier for longer.','ecosprin-gold.jpg','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/ecosprin-gold.jpg',96,95,30,'2022-02-13','2025-02-25','Active','2022-02-13 06:07:46','2022-03-24 11:50:30'),(1343,'Lquin 250mg Tablet','Generic Medicines','LQuin 250 Tablet is an antibiotic, used in the treatment of bacterial infections in adults and children (>6months age). It is also used in treating infections of the urinary tract, nose, throat, skin and lungs (pneumonia). It cures the infection by stopping the further growth of the causative microorganisms.','alergin-tablet.jpg','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/alergin-tablet.jpg',48.31,38.65,62,'2022-02-16','2023-02-07','Active','2022-02-16 09:03:38','2022-03-08 14:28:48'),(2182,'Green Tea','Auyveda Products','Sweetener made from 100% Natural Meethi Tulsi (Stevia) leaves.\r\nSugarFree Green can be used for a wide variety of preparations such as hot & cold beverages, sweets, desserts, cakes etc as well as for cooking & baking.\r\nSweet, just like Sugar, but with no Sugar-calories.\r\n1 spoon equals 1 tsp Sugar in Sweetness.\r\nSafe for the entire family to consume, including kids.\r\nWith SugarFree Green, you can binge guilt-free on your favourite sweet treats, without having to worry about any extra Sugar-calories.','green-tea.JPG','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/green-tea.JPG',330,214,58,'2022-02-16','2026-02-27','Active','2022-02-16 07:19:09','2022-02-28 11:22:41'),(2614,'Cobadex CZs','Allopathy Medicines','Cobadex CZS Tablet is a nutritional supplement that treats nutritional deficiencies caused due to inadequate intake of nutrients from food or other illnesses. It contains Pyridoxine (Vitamin B6), Nicotinamide, Cyanocobalamin (vitamin B12), Folic acid, Chromium, Selenium, and Zinc. Diabetic patients who are being treated with oral diabetic medication and insulin injections are at risk of developing a nutritional deficiency. Cobadex CZS Tablet is given as a nutritional adjuvant for those diabetic patients. It further reduces oxidative stress and prevents cell and tissue damage.','cobadex-czs.jpg','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/cobadex-czs.jpg',70,68.75,51,'2022-02-13','2024-02-11','Active','2022-02-12 04:56:46','2022-03-08 14:28:29'),(4081,'Triphala Churna','Ayurveda Products','Triphala has long been used in Ayurveda, a healing system that originated thousands of years ago in India. Today it is used to treat a number of health conditions. Still, researchers have yet to confirm its benefits.','triphala-churna.JPG','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/triphala-churna.JPG',450,430,35,'2022-03-02','2025-02-02','Active','2022-03-02 13:36:43','2022-03-02 19:06:43'),(4139,'Baidyanath Karela Jamun Juice','Auyveda Products','Karela and Jamun, both are great at keeping a check on blood sugar levels. Baidyanath Karela Jamun Juice is a combination of the purest form of Karela and Jamun, which together help in flushing out toxins from the intestinal tract and keeps common infections at bay. Baidyanath Karela Jamun Juice can help in increasing fluid and sodium retention, which in turn dramatically lowers the blood sugar levels.','kerala-jamun-juice.JPG','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/kerala-jamun-juice.JPG',300,249,44,'2022-02-16','2023-02-21','Active','2022-02-16 07:25:34','2022-02-16 12:55:34'),(5924,'Concor COR 2.5','Allopathy Medicines','Concor Cor 2.5mg Tablet 10s is an antihypertensive drug that is used in the treatment of hypertension (high blood pressure), angina pectoris (chest pain with painful tightness in the chest), arrhythmias (irregular heartbeats). It protects the heart in the early treatment after myocardial infarction (heart attack).','concor-tablet.png','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/concor-tablet.png',244,242,62,'2022-02-15','2023-02-25','Active','2022-02-15 06:41:09','2022-02-28 10:11:26'),(7031,'Eptus 25','Allopathy Medicines','Eptus 25 Tablet is a medicine known as a diuretic (water pill). It is mainly used in the treatment of heart failure and high blood pressure. It is also used to reduce swelling (edema) caused by some other conditions.','eptus-25.jpg','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/eptus-25.jpg',320,288,34,'2022-02-15','2026-02-15','Active','2022-02-15 06:38:35','2022-03-24 11:45:43'),(7466,'Cidmus-100MG','Allopathy Medicines','Cidmus 100mg Tablet is a combination of two medicines: Sacubitril and Valsartan which belong to a class of angiotensin receptor neprilysin inhibitor (ARNI). This combination treats heart failure by relaxing the blood vessels and making it easier for your heart to pump blood throughout your body.','Cidmus-100MG.png','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/Cidmus-100MG.png',1144,930,30,'2022-02-11','2024-02-11','Active','2022-02-11 04:22:27','2022-03-24 11:50:30'),(8434,'Dabar Chawanprash','Auyveda Products','Dabur Chyawanprash boosts ability to fight illnesses.\r\n43 spoons of Dabur Chyawanprash daily help to keep your child protected.\r\nIt is 2 spoons of protection with good taste.\r\nDabur Chyawanprash is a daily dose for your family to build Strength & Stamina.','dabar-chavanprash.JPG','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/dabar-chavanprash.JPG',535,449,20,'2022-02-16','2023-02-16','Active','2022-02-16 07:16:02','2022-03-08 14:28:35'),(9727,'Alergin 10mg Tablet','Generic Medicines','Alergin 10mg Tablet belongs to a group of medicines called antihistamines. It is used to treat various allergic conditions such as hay fever, conjunctivitis and some skin reactions, and reactions to bites and stings. It relieves watery eyes, runny nose, sneezing, and itching.','alergin-tablet.jpg','F:/project-workspace/E-Pharmacy-System/WebContent/uploads/alergin-tablet.jpg',17.79,14.23,114,'2022-02-16','2026-02-23','Active','2022-02-16 09:01:17','2022-03-02 18:38:08');
/*!40000 ALTER TABLE `tblmedicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorder`
--

DROP TABLE IF EXISTS `tblorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_no` int DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `medicine_image_name` varchar(200) DEFAULT NULL,
  `medicine_name` varchar(200) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `medicine_mrp_price` double DEFAULT NULL,
  `medicine_discount_price` double DEFAULT NULL,
  `medicine_total_price` double DEFAULT NULL,
  `medicine_order_status` varchar(45) DEFAULT NULL,
  `payment_mode` varchar(45) DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorder`
--

LOCK TABLES `tblorder` WRITE;
/*!40000 ALTER TABLE `tblorder` DISABLE KEYS */;
INSERT INTO `tblorder` VALUES (1,1001,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','ecosprin-gold.jpg','Ecosprin Gold 10 MG',4,96,95,380,'In Process','COD',1,'2022-02-27 04:41:52','2022-03-07 11:37:53'),(2,1002,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','Cidmus-100MG.png','Cidmus-100MG',4,1144,930,3720,'In Process','COD',1,'2022-02-27 04:41:52','2022-02-28 12:01:50'),(3,1003,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','concor-tablet.png','Concor COR 2.5',6,244,242,1452,'In Process','COD',1,'2022-02-27 04:41:52','2022-02-28 12:02:01'),(4,1004,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','dabar-chavanprash.JPG','Dabar Chawanprash',1,535,449,449,'Pending','COD',1,'2022-02-27 04:41:52','2022-02-27 11:43:40'),(5,1005,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','alergin-tablet.jpg','Lquin 250mg Tablet',3,48.31,38.65,115.94999999999999,'Delivered','COD',1,'2022-02-27 04:41:52','2022-02-28 12:02:29'),(6,2006,'Arun Pandit','30arunpandit@gmail.com','+918265686325','Kharwandi, Newasa, Ahmednagar, Maharashtra','411055','Cidmus-100MG.png','Cidmus-100MG',2,1144,930,1860,'Pending','COD',2,'2022-02-28 04:44:35','2022-02-28 10:14:35'),(7,2007,'Arun Pandit','30arunpandit@gmail.com','+918265686325','Kharwandi, Newasa, Ahmednagar, Maharashtra','411055','alergin-tablet.jpg','Lquin 250mg Tablet',1,48.31,38.65,38.65,'In Process','COD',2,'2022-02-28 04:44:35','2022-02-28 12:02:44'),(8,3008,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','triphala-churna.JPG','Baidyanath Triphala Churn',1,358,295,295,'Delivered','COD',3,'2022-02-28 04:45:35','2022-02-28 12:02:08'),(9,4009,'Javed Tamboli','javed.tamboli@gmail.com','8369651475','Charoli, Pune.','411022','ecosprin-gold.jpg','Ecosprin Gold 10 MG',3,96,95,285,'Pending','COD',4,'2022-02-28 04:50:59','2022-02-28 10:20:59'),(10,4010,'Javed Tamboli','javed.tamboli@gmail.com','8369651475','Charoli, Pune.','411022','dabar-chavanprash.JPG','Dabar Chawanprash',1,535,449,449,'Delivered','COD',4,'2022-02-28 04:50:59','2022-02-28 12:02:17'),(11,5011,'Javed Tamboli','javed.tamboli@gmail.com','8369651475','Charoli, Pune.','411022','green-tea.JPG','Green Tea',2,330,214,428,'In Process','COD',5,'2022-02-28 06:31:19','2022-02-28 12:03:00'),(12,6012,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','green-tea.JPG','Green Tea',1,330,214,214,'Pending','COD',6,'2022-03-01 05:22:02','2022-03-01 10:52:02'),(13,7013,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','alergin-tablet.jpg','Alergin 10mg Tablet',1,17.79,14.23,14.23,'Pending','COD',7,'2022-03-01 05:38:42','2022-03-01 11:08:42'),(14,8014,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','alergin-tablet.jpg','Alergin 10mg Tablet',1,17.79,14.23,14.23,'Pending','COD',8,'2022-03-01 05:39:56','2022-03-01 11:09:56'),(15,9015,'Sagar Prakash Kharmale','sagarkharmale@gmail.com','8456571542','Bhandgaon, Ahmednagar, Maharashtra.','414103','alergin-tablet.jpg','Alergin 10mg Tablet',1,17.79,14.23,14.23,'Pending','COD',9,'2022-03-02 13:11:10','2022-03-02 18:41:10'),(16,10016,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','ecosprin-gold.jpg','Ecosprin Gold 10 MG',0,96,95,95,'Pending','COD',10,'2022-03-02 14:06:53','2022-03-02 19:36:53'),(17,11017,'Abhishek','abhishekchemate00@gmail.com','9424781546','Bhalawani,Ahmednagar,Maharashtra.','414103','cobadex-czs.jpg','Cobadex CZs',4,70,68.75,275,'Delivered','COD',11,'2022-03-08 08:59:05','2022-03-08 14:32:59'),(18,11018,'Abhishek','abhishekchemate00@gmail.com','9424781546','Bhalawani,Ahmednagar,Maharashtra.','414103','dabar-chavanprash.JPG','Dabar Chawanprash',1,535,449,449,'Pending','COD',11,'2022-03-08 08:59:05','2022-03-08 14:29:05'),(19,11019,'Abhishek','abhishekchemate00@gmail.com','9424781546','Bhalawani,Ahmednagar,Maharashtra.','414103','alergin-tablet.jpg','Lquin 250mg Tablet',4,48.31,38.65,154.6,'In Process','COD',11,'2022-03-08 08:59:05','2022-03-08 14:33:26'),(20,12020,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','eptus-25.jpg','Eptus 25',7,320,288,2016,'Pending','COD',12,'2022-03-24 06:15:43','2022-03-24 11:45:43'),(21,13021,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','ecosprin-gold.jpg','Ecosprin Gold 10 MG',5,96,95,475,'Pending','COD',13,'2022-03-24 06:18:14','2022-03-24 11:48:14'),(22,13022,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','Cidmus-100MG.png','Cidmus-100MG',4,1144,930,3720,'Pending','COD',13,'2022-03-24 06:18:14','2022-03-24 11:48:14'),(23,14023,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','ecosprin-gold.jpg','Ecosprin Gold 10 MG',5,96,95,475,'Pending','COD',14,'2022-03-24 06:20:29','2022-03-24 11:50:29'),(24,14024,'Kishor Kadam','kadamk33@gmail.com','7276763516','Bhalawani, Ahmednagar.','414102','Cidmus-100MG.png','Cidmus-100MG',7,1144,930,6510,'Pending','COD',14,'2022-03-24 06:20:30','2022-03-24 11:50:30');
/*!40000 ALTER TABLE `tblorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-15 15:21:15
