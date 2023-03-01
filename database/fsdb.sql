CREATE DATABASE  IF NOT EXISTS `fsdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fsdb`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: fsdb
-- ------------------------------------------------------
-- Server version	8.0.28

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
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Men',NULL),(2,'Women',NULL),(3,'Bag',NULL),(4,'Clothing',NULL),(5,'Shoes',NULL),(6,'Accessories',NULL),(7,'Kids',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `role_id` int NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `product_id` int NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `status` tinyint(1) DEFAULT '1',
  `price` float NOT NULL,
  `quantity` int DEFAULT '0',
  `supplier` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_id` int NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `thumbnail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'Đồng hồ CSX20','Apple Watch SE 2022 44mm \nGPS viền nhôm chính là siêu phẩm với đầy sự tinh tế, \nhiện đại và đẳng cấp sẽ được nhà Táo cho ra mắt vào tháng \n9 năm nay. Với nhiều cập nhật nổi bật về thiết kế, nhiều \ncông nghệ màn hình hiện đại hơn và nhiều tiện ích mở \nrộng hơn được đưa ra thì đây chắc chắn chính là chiếc đồng hồ bạn nên lựa chọn. \nHãy tham khảo thêm cho mình một vài thông tin về chiếc đồng hồ này ngay sau đây \nđể có thể hiểu thêm về nó và các đặc tính nổi bật của nó nhé.',1,72.62,100,'CellphoneS',6,'2023-02-22 21:01:23','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677660803/fashion/product/applewatch_series_3_two_loop_full.jpg.og_goxtsy.jpg'),(3,'Apple Watch 15','Apple Watch SE 2022 44mm ',1,25.99,20,'CellphoneS',6,'2023-02-22 21:01:23','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677660872/fashion/product/mvw-star-msa003-03-nam-0-600x600_ryqelm.jpg'),(4,'Jean pro2','Hãy cùng khám phá bộ sưu tập quần độc đáo của chúng tôi! Mỗi chiếc quần đều được\n thiết kế với chất liệu cao cấp và kiểu dáng tinh tế, mang đến cho bạn cảm giác thoải mái và phong cách.\nChiếc quần dài đen của chúng tôi là một lựa chọn hoàn hảo cho các buổi tiệc hoặc sự kiện quan \ntrọng. Chất liệu vải cao cấp và đường may tỉ mỉ tạo nên sự sang trọng và đẳng cấp, trong khi kiểu \ndáng ôm sát vừa vặn với cơ thể giúp bạn trông thật quyến rũ và thu hút mọi ánh nhìn.\nNếu bạn đang tìm kiếm một chiếc quần thoải mái cho các hoạt động thể thao hoặc đi bộ, thì chiếc quần jogger\n của chúng tôi chắc chắn sẽ là lựa chọn tuyệt vời. Chất liệu vải co giãn và thiết kế lỏng lẻo giúp bạn cảm thấy thoải mái và dễ \n chịu trong suốt quá trình hoạt động.',1,29.99,12,'ABC Clothing',4,'2023-03-01 15:33:22','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-6_dhb4dd.jpg'),(5,'Jean rog1','Hãy cùng khám phá bộ sưu tập quần độc đáo của chúng tôi! Mỗi chiếc quần đều được\n thiết kế với chất liệu cao cấp và kiểu dáng tinh tế, mang đến cho bạn cảm giác thoải mái và phong cách.\nChiếc quần dài đen của chúng tôi là một lựa chọn hoàn hảo cho các buổi tiệc hoặc sự kiện quan \ntrọng. Chất liệu vải cao cấp và đường may tỉ mỉ tạo nên sự sang trọng và đẳng cấp, trong khi kiểu \ndáng ôm sát vừa vặn với cơ thể giúp bạn trông thật quyến rũ và thu hút mọi ánh nhìn.\nNếu bạn đang tìm kiếm một chiếc quần thoải mái cho các hoạt động thể thao hoặc đi bộ, thì chiếc quần jogger\n của chúng tôi chắc chắn sẽ là lựa chọn tuyệt vời. Chất liệu vải co giãn và thiết kế lỏng lẻo giúp bạn cảm thấy thoải mái và dễ \n chịu trong suốt quá trình hoạt động.',1,21.99,200,'Diof Clothing',4,'2023-03-01 15:39:23','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-6_dhb4dd.jpg'),(6,'Jean pro_xv','Hãy cùng khám phá bộ sưu tập quần độc đáo của chúng tôi! Mỗi chiếc quần đều được\n thiết kế với chất liệu cao cấp và kiểu dáng tinh tế, mang đến cho bạn cảm giác thoải mái và phong cách.\nChiếc quần dài đen của chúng tôi là một lựa chọn hoàn hảo cho các buổi tiệc hoặc sự kiện quan \ntrọng. Chất liệu vải cao cấp và đường may tỉ mỉ tạo nên sự sang trọng và đẳng cấp, trong khi kiểu \ndáng ôm sát vừa vặn với cơ thể giúp bạn trông thật quyến rũ và thu hút mọi ánh nhìn.\nNếu bạn đang tìm kiếm một chiếc quần thoải mái cho các hoạt động thể thao hoặc đi bộ, thì chiếc quần jogger\n của chúng tôi chắc chắn sẽ là lựa chọn tuyệt vời. Chất liệu vải co giãn và thiết kế lỏng lẻo giúp bạn cảm thấy thoải mái và dễ \n chịu trong suốt quá trình hoạt động.',1,25.39,32,'XYZ Clothing',4,'2023-03-01 15:39:23','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-6_dhb4dd.jpg'),(7,'T-Shirt-ProA','Chào mừng đến với bộ sưu tập áo thun của chúng tôi! Chúng tôi tự hào cung cấp các sản phẩm chất lượng cao, đa dạng về mẫu mã và kiểu dáng để đáp ứng nhu cầu của khách hàng.',1,36.99,72,'ShirtCore',1,'2023-03-01 15:44:13','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-9_qtugyt.jpg'),(8,'BagLZ2','Chào mừng đến với bộ sưu tập túi của chúng tôi! Chúng tôi cung cấp các loại túi đa dạng về kích thước, kiểu dáng và chất liệu, giúp bạn thoải mái lựa chọn túi phù hợp với nhu cầu của mình.',1,82.99,11,'LzBagGu',3,'2023-03-01 15:44:13','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-7_iss4qn.jpg'),(9,'T-Shirt-Strx','Chào mừng đến với bộ sưu tập áo thun của chúng tôi! Chúng tôi tự hào cung cấp các sản phẩm chất lượng cao, đa dạng về mẫu mã và kiểu dáng để đáp ứng nhu cầu của khách hàng.',1,16.99,200,'Guzzihaz',1,'2023-03-01 15:44:13','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-5_r56uhl.jpg'),(10,'KidZx','Chào mừng đến với bộ sưu tập túi của chúng tôi! Chúng tôi cung cấp các loại túi đa dạng về kích thước, kiểu dáng và chất liệu, giúp bạn thoải mái lựa chọn túi phù hợp với nhu cầu của mình.',1,39.99,25,'Kiddo',7,'2023-03-01 15:44:13','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655433/fashion/product/product-11_k75zxn.jpg'),(11,'CuzPro_X','Chào mừng đến với bộ sưu tập kính mát của chúng tôi! Chúng tôi tự hào cung cấp các sản phẩm chất lượng cao với đa dạng kiểu dáng và màu sắc để bạn dễ dàng tìm kiếm chiếc kính mát phù hợp với phong cách của mình.',1,37.99,39,'Lviz',6,'2023-03-01 15:45:42','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655433/fashion/product/product-14_ixx93z.jpg'),(12,'CuzPro_XS','Chào mừng đến với bộ sưu tập kính mát của chúng tôi! Chúng tôi tự hào cung cấp các sản phẩm chất lượng cao với đa dạng kiểu dáng và màu sắc để bạn dễ dàng tìm kiếm chiếc kính mát phù hợp với phong cách của mình.',1,55.99,12,'Lviz',6,'2023-03-01 15:45:42','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655433/fashion/product/product-14_ixx93z.jpg'),(13,'UltraBoot4','Chào mừng đến với Ultrabook adidas của chúng tôi! Được tạo ra từ sự kết hợp giữa thương hiệu thể thao hàng đầu và công nghệ hiện đại, Ultrabook adidas của chúng tôi sẽ đem lại cho bạn sự thoải mái và hiệu suất tuyệt vời trong mọi hoạt động của bạn.',1,29.99,33,'Addidas',5,'2023-03-01 15:49:27','https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655432/fashion/product/product-1_qtz6zz.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleorder`
--

DROP TABLE IF EXISTS `saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `subtotal` float DEFAULT '0',
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleorder`
--

LOCK TABLES `saleorder` WRITE;
/*!40000 ALTER TABLE `saleorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleorderdetails`
--

DROP TABLE IF EXISTS `saleorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleorderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `unitprice` float DEFAULT NULL,
  `unitquantity` int DEFAULT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `saleorderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `saleorder` (`id`),
  CONSTRAINT `saleorderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleorderdetails`
--

LOCK TABLES `saleorderdetails` WRITE;
/*!40000 ALTER TABLE `saleorderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `saleorderdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-01 18:02:12
