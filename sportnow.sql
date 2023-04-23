-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: sportnow
-- ------------------------------------------------------
-- Server version	8.0.31

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


CREATE DATABASE sportnow;
USE sportnow;



DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(90) DEFAULT 'Unknown',
  `image` varchar(500) DEFAULT 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
  `email` varchar(90) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('tungba1','1','Tung Ba 101','https://scontent.fhan14-2.fna.fbcdn.net/v/t39.30808-6/302171787_1812182202473423_2219482232048890630_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=enEAkEYByfoAX-FOwv9&_nc_ht=scontent.fhan14-2.fna&oh=00_AfDOZM0o2jIwjLuxV9sW3i_Tx7fwQoThEMCrWWeJpXEeRg&oe=639A87A2','tungba1@gmail.com','0965899821','Male','2022-10-02'),('tungba2','1','Tung Ba 2','https://scontent.fhan14-2.fna.fbcdn.net/v/t39.30808-6/302171787_1812182202473423_2219482232048890630_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=enEAkEYByfoAX-FOwv9&_nc_ht=scontent.fhan14-2.fna&oh=00_AfDOZM0o2jIwjLuxV9sW3i_Tx7fwQoThEMCrWWeJpXEeRg&oe=639A87A2','tungba2@gmail.com','0965899821','Male','10/03/2002'),('tungba3','1','Tung Ba 3','https://scontent.fhan14-2.fna.fbcdn.net/v/t39.30808-6/302171787_1812182202473423_2219482232048890630_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=enEAkEYByfoAX-FOwv9&_nc_ht=scontent.fhan14-2.fna&oh=00_AfDOZM0o2jIwjLuxV9sW3i_Tx7fwQoThEMCrWWeJpXEeRg&oe=639A87A2','tungba3@gmail.com','0965899821','Male','10/03/2002');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idAddress` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `province` varchar(45) NOT NULL,
  `district` varchar(45) NOT NULL,
  `subDistrict` varchar(45) NOT NULL,
  `detail` varchar(100) NOT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'tungba1','Tung Ba 1','0965656565','Son La','Son La','Chieng Sinh','Group 1'),(2,'tungba2','Tung Ba 2','0965656565','Son La','Son La','Chieng Sinh','Group 1'),(3,'tungba3','Tung Ba 3','0965656565','Son La','Son La','Chieng Sinh','Group 1'),(4,'tungba3','Tung Ba 3','0965656565','Son La','Son La','Chieng Sinh','Group 2'),(5,'tungba2','Tung Ba 2','0965656565','Son La','Son La','Chieng Sinh','Group 2'),(6,'tungba1','Tung Ba 1','0965656565','Son La','Son La','Chieng Sinh','Group 2');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `idCart` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `idProduct` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idCart`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,'tungba1',2,4),(4,'tungba2',4,2),(5,'tungba2',5,3),(6,'tungba2',6,4),(7,'tungba3',7,1),(8,'tungba3',8,2),(9,'tungba3',9,3),(21,'tungba1',1,1),(22,'tungba1',3,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_user`
--

DROP TABLE IF EXISTS `category_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_user` (
  `username` varchar(45) NOT NULL,
  `cuName` varchar(45) NOT NULL,
  PRIMARY KEY (`cuName`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_user`
--

LOCK TABLES `category_user` WRITE;
/*!40000 ALTER TABLE `category_user` DISABLE KEYS */;
INSERT INTO `category_user` VALUES ('tungba1','ball'),('tungba1','shirt'),('tungba3','shirt'),('tungba2','short'),('tungba2','socks'),('tungba3','socks');
/*!40000 ALTER TABLE `category_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `idFeedback` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `content` varchar(500) NOT NULL,
  PRIMARY KEY (`idFeedback`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (10,'tungba1','The product is so good'),(11,'tungba1','The product is so good'),(12,'tungba2','The product is so good'),(13,'tungba2','The product is so good'),(14,'tungba3','The product is so good'),(15,'tungba3','The product is so good'),(17,'tungba1','asdasdasd');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `idOrderItem` int NOT NULL AUTO_INCREMENT,
  `idOrder` int NOT NULL,
  `idProduct` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idOrderItem`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,2),(2,1,2,2),(3,1,3,2),(4,2,4,2),(5,2,5,2),(6,2,6,2);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderr`
--

DROP TABLE IF EXISTS `orderr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderr` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `orderDate` date NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderr`
--

LOCK TABLES `orderr` WRITE;
/*!40000 ALTER TABLE `orderr` DISABLE KEYS */;
INSERT INTO `orderr` VALUES (1,'tungba1','2022-11-09','Shipped'),(2,'tungba1','2022-11-08','Shipping');
/*!40000 ALTER TABLE `orderr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  `type` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `image` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `storage` int NOT NULL,
  `sold` int NOT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Chelsea Home Shirt','shirt',20,'chelsea_shirt.png','Chelsea Football Club is an English professional football club based in Fulham, West London. Founded in 1905, they play their home games at Stamford Bridge. The club competes in the Premier League, the top division of English football. They won their first major honour, the League championship, in 1955. The club won the FA Cup for the first time in 1970, their first European honour, the Cup Winners\' Cup, in 1971, and becoming only the third English club to win the Club World Cup in 2022',8,2),(2,'Chelsea Home Shorts','short',15,'chelsea_short.png','Chelsea Football Club is an English professional football club based in Fulham, West London. Founded in 1905, they play their home games at Stamford Bridge. The club competes in the Premier League, the top division of English football. They won their first major honour, the League championship, in 1955. The club won the FA Cup for the first time in 1970, their first European honour, the Cup Winners\' Cup, in 1971, and becoming only the third English club to win the Club World Cup in 2022',8,2),(3,'Chelsea Home Socks','socks',5,'chelsea_socks.png','Chelsea Football Club is an English professional football club based in Fulham, West London. Founded in 1905, they play their home games at Stamford Bridge. The club competes in the Premier League, the top division of English football. They won their first major honour, the League championship, in 1955. The club won the FA Cup for the first time in 1970, their first European honour, the Cup Winners\' Cup, in 1971, and becoming only the third English club to win the Club World Cup in 2022',8,2),(4,'Manchester United Shirt','shirt',20,'MU_shirt.png','Manchester United Football Club, commonly referred to as Man United (often stylised as Man Utd), or simply United, is a professional football club based in Old Trafford, Greater Manchester, England. The club competes in the Premier League, the top division in the English football league system. Nicknamed the Red Devils, it was founded as Newton Heath LYR Football Club in 1878, but changed its name to Manchester United in 1902. The club moved from Newton Heath to its current stadium, Old Trafford, in 1910.',8,2),(5,'Manchester United Shorts','short',15,'MU_short.png','Manchester United Football Club, commonly referred to as Man United (often stylised as Man Utd), or simply United, is a professional football club based in Old Trafford, Greater Manchester, England. The club competes in the Premier League, the top division in the English football league system. Nicknamed the Red Devils, it was founded as Newton Heath LYR Football Club in 1878, but changed its name to Manchester United in 1902. The club moved from Newton Heath to its current stadium, Old Trafford, in 1910.',8,2),(6,'Manchester United Socks','socks',5,'MU_socks.png','Manchester United Football Club, commonly referred to as Man United (often stylised as Man Utd), or simply United, is a professional football club based in Old Trafford, Greater Manchester, England. The club competes in the Premier League, the top division in the English football league system. Nicknamed the Red Devils, it was founded as Newton Heath LYR Football Club in 1878, but changed its name to Manchester United in 1902. The club moved from Newton Heath to its current stadium, Old Trafford, in 1910.',8,2),(7,'Tottenham Shirt','shirt',20,'tottenham_shirt.png','Tottenham Hotspur Football Club, commonly referred to as Tottenham or Spurs, is a professional football club based in Tottenham, London, England. It competes in the Premier League, the top flight of English football. The team has played its home matches in the 62,850-capacity Tottenham Hotspur Stadium since April 2019, replacing their former home of White Hart Lane, which had been demolished to make way for the new stadium on the same site.',10,0),(8,'Tottenham Shorts','short',15,'tottenham_short.png','Tottenham Hotspur Football Club, commonly referred to as Tottenham or Spurs, is a professional football club based in Tottenham, London, England. It competes in the Premier League, the top flight of English football. The team has played its home matches in the 62,850-capacity Tottenham Hotspur Stadium since April 2019, replacing their former home of White Hart Lane, which had been demolished to make way for the new stadium on the same site.',10,0),(9,'Tottenham Socks','socks',5,'tottenham_socks.png','Tottenham Hotspur Football Club, commonly referred to as Tottenham or Spurs, is a professional football club based in Tottenham, London, England. It competes in the Premier League, the top flight of English football. The team has played its home matches in the 62,850-capacity Tottenham Hotspur Stadium since April 2019, replacing their former home of White Hart Lane, which had been demolished to make way for the new stadium on the same site.',10,0),(10,'Arsenal Shirt','shirt',10,'arsenal_shirt.png','The Arsenal Football Club, commonly referred to as Arsenal, is a professional football club based in Islington, London, England. Arsenal plays in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, one European Cup Winners\' Cup, and one Inter-Cities Fairs Cup. In terms of trophies won, it is the third-most successful club in English football.',10,0),(11,'Arsenal Shorts','short',15,'arsenal_short.png','The Arsenal Football Club, commonly referred to as Arsenal, is a professional football club based in Islington, London, England. Arsenal plays in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, one European Cup Winners\' Cup, and one Inter-Cities Fairs Cup. In terms of trophies won, it is the third-most successful club in English football.',10,0),(12,'Arsenal Socks','socks',5,'arsenal_socks.png','The Arsenal Football Club, commonly referred to as Arsenal, is a professional football club based in Islington, London, England. Arsenal plays in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, one European Cup Winners\' Cup, and one Inter-Cities Fairs Cup. In terms of trophies won, it is the third-most successful club in English football.',10,0),(13,'Arsenal Ball','ball',10,'arsenal_ball.png','The Arsenal Football Club, commonly referred to as Arsenal, is a professional football club based in Islington, London, England. Arsenal plays in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, one European Cup Winners\' Cup, and one Inter-Cities Fairs Cup. In terms of trophies won, it is the third-most successful club in English football.',10,0),(14,'Fulham Shirt','shirt',20,'fulham_shirt.png','Fulham Football Club is an English professional football club based in Fulham, London, which compete in the Premier League. They have played home games at Craven Cottage since 1896, other then a two-year period spent at Loftus Road whilst Craven Cottage underwent redevelopments that were completed in 2004. They contest West London derby rivalries with Chelsea, Queens Park Rangers and Brentford. The club adopted a white shirt and black shorts as its kit in 1903, which has been used ever since.',10,0),(15,'Fulham Shorts','short',15,'fulham_short.png','Fulham Football Club is an English professional football club based in Fulham, London, which compete in the Premier League. They have played home games at Craven Cottage since 1896, other then a two-year period spent at Loftus Road whilst Craven Cottage underwent redevelopments that were completed in 2004. They contest West London derby rivalries with Chelsea, Queens Park Rangers and Brentford. The club adopted a white shirt and black shorts as its kit in 1903, which has been used ever since.',10,0),(16,'Fulham Socks','socks',5,'fulham_socks.png','Fulham Football Club is an English professional football club based in Fulham, London, which compete in the Premier League. They have played home games at Craven Cottage since 1896, other then a two-year period spent at Loftus Road whilst Craven Cottage underwent redevelopments that were completed in 2004. They contest West London derby rivalries with Chelsea, Queens Park Rangers and Brentford. The club adopted a white shirt and black shorts as its kit in 1903, which has been used ever since.',10,0),(17,'Manchester City Shirt','shirt',20,'MC_shirt.png','Manchester City Football Club are an English football club based in Manchester that competes in the Premier League, the top flight of English football. Founded in 1880 as St. Mark\'s (West Gorton), they became Ardwick Association Football Club in 1887 and Manchester City in 1894. The club\'s home ground is the Etihad Stadium in east Manchester, to which they moved in 2003, having played at Maine Road since 1923. Manchester City adopted their sky blue home shirts in 1894, in the first season with the current name. Over the course of its history, the club has won eight league titles, six FA Cups, eight League Cups, six FA Community Shields, and one European Cup Winners\' Cup.',10,0),(18,'Manchester City Shorts','short',15,'MC_short.png','Manchester City Football Club are an English football club based in Manchester that competes in the Premier League, the top flight of English football. Founded in 1880 as St. Mark\'s (West Gorton), they became Ardwick Association Football Club in 1887 and Manchester City in 1894. The club\'s home ground is the Etihad Stadium in east Manchester, to which they moved in 2003, having played at Maine Road since 1923. Manchester City adopted their sky blue home shirts in 1894, in the first season with the current name. Over the course of its history, the club has won eight league titles, six FA Cups, eight League Cups, six FA Community Shields, and one European Cup Winners\' Cup.',10,0),(19,'Manchester City Socks','socks',5,'MC_socks.png','Manchester City Football Club are an English football club based in Manchester that competes in the Premier League, the top flight of English football. Founded in 1880 as St. Mark\'s (West Gorton), they became Ardwick Association Football Club in 1887 and Manchester City in 1894. The club\'s home ground is the Etihad Stadium in east Manchester, to which they moved in 2003, having played at Maine Road since 1923. Manchester City adopted their sky blue home shirts in 1894, in the first season with the current name. Over the course of its history, the club has won eight league titles, six FA Cups, eight League Cups, six FA Community Shields, and one European Cup Winners\' Cup.',10,0),(20,'Newcastle Shirt','shirt',20,'newcastle_shirt.png','Newcastle United Football Club is an English professional football club, based in Newcastle upon Tyne, that plays in the Premier League – the top flight of English football. The club was founded in 1892 by the merger of Newcastle East End and Newcastle West End. The team play their home matches at St James\' Park in the centre of Newcastle. Following the Taylor Report\'s requirement that all Premier League clubs have all-seater stadiums, the ground was modified in the mid-1990s and currently has a capacity of 52,305.',10,0),(21,'Newcastle Shorts','short',15,'newcastle_short.png','Newcastle United Football Club is an English professional football club, based in Newcastle upon Tyne, that plays in the Premier League – the top flight of English football. The club was founded in 1892 by the merger of Newcastle East End and Newcastle West End. The team play their home matches at St James\' Park in the centre of Newcastle. Following the Taylor Report\'s requirement that all Premier League clubs have all-seater stadiums, the ground was modified in the mid-1990s and currently has a capacity of 52,305.',10,0),(22,'Newcastle Socks','socks',5,'newcastle_socks.png','Newcastle United Football Club is an English professional football club, based in Newcastle upon Tyne, that plays in the Premier League – the top flight of English football. The club was founded in 1892 by the merger of Newcastle East End and Newcastle West End. The team play their home matches at St James\' Park in the centre of Newcastle. Following the Taylor Report\'s requirement that all Premier League clubs have all-seater stadiums, the ground was modified in the mid-1990s and currently has a capacity of 52,305.',10,0),(23,'Liverpool Shirt','shirt',10,'liverpool_shirt.png','Liverpool Football Club is a professional football club based in Liverpool, England. The club competes in the Premier League, the top tier of English football. Founded in 1892, the club joined the Football League the following year and has played its home games at Anfield since its formation.',10,0),(24,'Liverpool Shorts','short',15,'liverpool_short.png','Liverpool Football Club is a professional football club based in Liverpool, England. The club competes in the Premier League, the top tier of English football. Founded in 1892, the club joined the Football League the following year and has played its home games at Anfield since its formation.',10,0),(25,'Liverpool Socks','socks',5,'liverpool_socks.png','Liverpool Football Club is a professional football club based in Liverpool, England. The club competes in the Premier League, the top tier of English football. Founded in 1892, the club joined the Football League the following year and has played its home games at Anfield since its formation.',10,0),(26,'Brighton Shirt','shirt',20,'brighton_shirt.png','Brighton & Hove Albion Football Club, commonly referred to simply as Brighton, is an English professional football club based in the city of Brighton and Hove. They compete in the Premier League, the top tier of the English football league system. The club\'s home ground is the 31,800-capacity Falmer Stadium, situated in Falmer to the north east of the city.',10,0),(27,'Brighton Shorts','short',15,'brighton_short.png','Brighton & Hove Albion Football Club, commonly referred to simply as Brighton, is an English professional football club based in the city of Brighton and Hove. They compete in the Premier League, the top tier of the English football league system. The club\'s home ground is the 31,800-capacity Falmer Stadium, situated in Falmer to the north east of the city.',10,0),(28,'Brighton Socks','socks',5,'brighton_socks.png','Brighton & Hove Albion Football Club, commonly referred to simply as Brighton, is an English professional football club based in the city of Brighton and Hove. They compete in the Premier League, the top tier of the English football league system. The club\'s home ground is the 31,800-capacity Falmer Stadium, situated in Falmer to the north east of the city.',10,0),(29,'Bournemouth Shirt','shirt',20,'bournemouth_shirt.png','Bournemouth Football Club is an English football team currently playing in the Wessex League Premier Division, in the ninth tier of the English football league system. Their nickname is \"The Poppies\", and they are often known as Bournemouth Poppies to avoid confusion with the Premier League club AFC Bournemouth. The club plays at Victoria Park, Namu Road, in Bournemouth and are founding members of the Hampshire FA and Bournemouth FA.',10,0),(30,'Bournemouth Shorts','short',15,'bournemouth_short.png','Bournemouth Football Club is an English football team currently playing in the Wessex League Premier Division, in the ninth tier of the English football league system. Their nickname is \"The Poppies\", and they are often known as Bournemouth Poppies to avoid confusion with the Premier League club AFC Bournemouth. The club plays at Victoria Park, Namu Road, in Bournemouth and are founding members of the Hampshire FA and Bournemouth FA.',10,0),(31,'Bournemouth Socks','socks',5,'bournemouth_socks.png','Bournemouth Football Club is an English football team currently playing in the Wessex League Premier Division, in the ninth tier of the English football league system. Their nickname is \"The Poppies\", and they are often known as Bournemouth Poppies to avoid confusion with the Premier League club AFC Bournemouth. The club plays at Victoria Park, Namu Road, in Bournemouth and are founding members of the Hampshire FA and Bournemouth FA.',10,0),(32,'Brentford Shirt','shirt',20,'brentford_shirt.jpg','Brentford Football Club is a professional football club based in Brentford, West London, England. They compete in the Premier League, the highest tier of English football, having gained promotion via the playoffs at the end of the 2020–21 Championship season. Nicknamed \"The Bees\", the club was founded in 1889 and played home matches at Griffin Park from 1904 before moving to Gtech Community Stadium in 2020. Their main rivals are fellow West London-based clubs Fulham and Queens Park Rangers.',10,0),(33,'Brentford Shorts','short',15,'brentford_short.jpg','Brentford Football Club is a professional football club based in Brentford, West London, England. They compete in the Premier League, the highest tier of English football, having gained promotion via the playoffs at the end of the 2020–21 Championship season. Nicknamed \"The Bees\", the club was founded in 1889 and played home matches at Griffin Park from 1904 before moving to Gtech Community Stadium in 2020. Their main rivals are fellow West London-based clubs Fulham and Queens Park Rangers.',10,0),(34,'Brentford Socks','socks',5,'brentford_socks.jpg','Brentford Football Club is a professional football club based in Brentford, West London, England. They compete in the Premier League, the highest tier of English football, having gained promotion via the playoffs at the end of the 2020–21 Championship season. Nicknamed \"The Bees\", the club was founded in 1889 and played home matches at Griffin Park from 1904 before moving to Gtech Community Stadium in 2020. Their main rivals are fellow West London-based clubs Fulham and Queens Park Rangers.',10,0),(35,'Brentford Ball','ball',10,'brentford_ball.jpg','Brentford Football Club is a professional football club based in Brentford, West London, England. They compete in the Premier League, the highest tier of English football, having gained promotion via the playoffs at the end of the 2020–21 Championship season. Nicknamed \"The Bees\", the club was founded in 1889 and played home matches at Griffin Park from 1904 before moving to Gtech Community Stadium in 2020. Their main rivals are fellow West London-based clubs Fulham and Queens Park Rangers.',10,0),(36,'Everton Shirt','shirt',20,'everton_shirt.jpg','Everton Football Club is an English professional association football club based in Liverpool that competes in the Premier League, the top tier of English football. The club was a founder member of the Football League in 1888 and has competed in the top division for a record 118 seasons, having missed only four top-flight seasons (1930–31, 1951–52, 1952–53 and 1953–54). Everton is the second-longest continuous serving club in English top flight football and ranks third in the all-time points rankings. The club has won nine league titles, five FA Cups, one European Cup Winners\' Cup and nine Charity Shields.',10,0),(37,'Everton Shorts','short',15,'everton_short.jpg','Everton Football Club is an English professional association football club based in Liverpool that competes in the Premier League, the top tier of English football. The club was a founder member of the Football League in 1888 and has competed in the top division for a record 118 seasons, having missed only four top-flight seasons (1930–31, 1951–52, 1952–53 and 1953–54). Everton is the second-longest continuous serving club in English top flight football and ranks third in the all-time points rankings. The club has won nine league titles, five FA Cups, one European Cup Winners\' Cup and nine Charity Shields.',10,0),(38,'Everton Socks','socks',5,'everton_socks.jpg','Everton Football Club is an English professional association football club based in Liverpool that competes in the Premier League, the top tier of English football. The club was a founder member of the Football League in 1888 and has competed in the top division for a record 118 seasons, having missed only four top-flight seasons (1930–31, 1951–52, 1952–53 and 1953–54). Everton is the second-longest continuous serving club in English top flight football and ranks third in the all-time points rankings. The club has won nine league titles, five FA Cups, one European Cup Winners\' Cup and nine Charity Shields.',10,0),(39,'Everton Ball','ball',10,'everton_ball.jpg','Everton Football Club is an English professional association football club based in Liverpool that competes in the Premier League, the top tier of English football. The club was a founder member of the Football League in 1888 and has competed in the top division for a record 118 seasons, having missed only four top-flight seasons (1930–31, 1951–52, 1952–53 and 1953–54). Everton is the second-longest continuous serving club in English top flight football and ranks third in the all-time points rankings. The club has won nine league titles, five FA Cups, one European Cup Winners\' Cup and nine Charity Shields.',10,0),(40,'West Ham Shirt','shirt',20,'westham_shirt.jpg','West Ham United Football Club is an English professional football club that plays its home matches in Stratford, East London. The club competes in the Premier League, the top tier of English football. The club plays at the London Stadium, having moved from their former home, the Boleyn Ground, in 2016.',10,0),(41,'West Ham Shorts','short',15,'westham_short.jpg','West Ham United Football Club is an English professional football club that plays its home matches in Stratford, East London. The club competes in the Premier League, the top tier of English football. The club plays at the London Stadium, having moved from their former home, the Boleyn Ground, in 2016.',10,0),(42,'West Ham Socks','socks',5,'westham_short.jpg','West Ham United Football Club is an English professional football club that plays its home matches in Stratford, East London. The club competes in the Premier League, the top tier of English football. The club plays at the London Stadium, having moved from their former home, the Boleyn Ground, in 2016.',10,0),(43,'West Ham Ball','ball',10,'westham_socks.jpg','West Ham United Football Club is an English professional football club that plays its home matches in Stratford, East London. The club competes in the Premier League, the top tier of English football. The club plays at the London Stadium, having moved from their former home, the Boleyn Ground, in 2016.',10,0),(44,'Leeds Shirt','shirt',20,'leeds_shirt.jpg','Leeds United Football Club is a professional football club based in Leeds, West Yorkshire. The club competes in the Premier League, the highest level of England\'s football league system, and plays its home matches at Elland Road Stadium.',10,0),(45,'Leeds Shorts','short',15,'leeds_short.jpg','Leeds United Football Club is a professional football club based in Leeds, West Yorkshire. The club competes in the Premier League, the highest level of England\'s football league system, and plays its home matches at Elland Road Stadium.',10,0),(46,'Leeds Socks','socks',5,'leeds_socks.jpg','Leeds United Football Club is a professional football club based in Leeds, West Yorkshire. The club competes in the Premier League, the highest level of England\'s football league system, and plays its home matches at Elland Road Stadium.',10,0),(47,'Leeds Ball','ball',10,'leeds_ball.jpg','Leeds United Football Club is a professional football club based in Leeds, West Yorkshire. The club competes in the Premier League, the highest level of England\'s football league system, and plays its home matches at Elland Road Stadium.',10,0),(48,'Crystal Palace Shirt','shirt',20,'crystalpalace_shirt.jpg','Crystal Palace Football Club is a professional football club based in Selhurst in the Borough of Croydon, South London, England, who compete in the Premier League, the highest level of English football. Although founded as a professional outfit in 1905, the club\'s origins can be traced as far back as 1861, when an amateur Crystal Palace football team was established at the Crystal Palace Exhibition building. This has led to claims by the club that Crystal Palace should be recognised as the oldest professional football club in the world, after historians discovered a lineage through the Crystal Palace Company. Both the amateur and professional clubs played inside the grounds of the Palace, with the professional club using the FA Cup Final stadium for its home games until 1915, when they were forced to leave due to the outbreak of the First World War. In 1924, they moved to their current home at Selhurst Park.',10,0),(49,'Crystal Palace Shorts','short',15,'crystalpalace_short.jpg','Crystal Palace Football Club is a professional football club based in Selhurst in the Borough of Croydon, South London, England, who compete in the Premier League, the highest level of English football. Although founded as a professional outfit in 1905, the club\'s origins can be traced as far back as 1861, when an amateur Crystal Palace football team was established at the Crystal Palace Exhibition building. This has led to claims by the club that Crystal Palace should be recognised as the oldest professional football club in the world, after historians discovered a lineage through the Crystal Palace Company. Both the amateur and professional clubs played inside the grounds of the Palace, with the professional club using the FA Cup Final stadium for its home games until 1915, when they were forced to leave due to the outbreak of the First World War. In 1924, they moved to their current home at Selhurst Park.',10,0),(50,'Crystal Palace Socks','socks',5,'crystalpalace_socks.jpg','Crystal Palace Football Club is a professional football club based in Selhurst in the Borough of Croydon, South London, England, who compete in the Premier League, the highest level of English football. Although founded as a professional outfit in 1905, the club\'s origins can be traced as far back as 1861, when an amateur Crystal Palace football team was established at the Crystal Palace Exhibition building. This has led to claims by the club that Crystal Palace should be recognised as the oldest professional football club in the world, after historians discovered a lineage through the Crystal Palace Company. Both the amateur and professional clubs played inside the grounds of the Palace, with the professional club using the FA Cup Final stadium for its home games until 1915, when they were forced to leave due to the outbreak of the First World War. In 1924, they moved to their current home at Selhurst Park.',10,0),(51,'Crystal Palace Ball','ball',10,'crystalpalace_ball.jpg','Crystal Palace Football Club is a professional football club based in Selhurst in the Borough of Croydon, South London, England, who compete in the Premier League, the highest level of English football. Although founded as a professional outfit in 1905, the club\'s origins can be traced as far back as 1861, when an amateur Crystal Palace football team was established at the Crystal Palace Exhibition building. This has led to claims by the club that Crystal Palace should be recognised as the oldest professional football club in the world, after historians discovered a lineage through the Crystal Palace Company. Both the amateur and professional clubs played inside the grounds of the Palace, with the professional club using the FA Cup Final stadium for its home games until 1915, when they were forced to leave due to the outbreak of the First World War. In 1924, they moved to their current home at Selhurst Park.',10,0),(52,'Aston Villa Shirt','shirt',20,'astonvilla_shirt.jpg','Aston Villa Football Club is a professional football club based in Aston, Birmingham, England. The club competes in the Premier League, the top tier of the English football league system. Founded in 1874, they have played at their home ground, Villa Park, since 1897. Aston Villa are one of the oldest and most successful clubs in England, being a founding member of the Football League in 1888 and of the Premier League in 1992.',10,0),(53,'Aston Villa Shorts','short',15,'astonvilla_short.jpg','Aston Villa Football Club is a professional football club based in Aston, Birmingham, England. The club competes in the Premier League, the top tier of the English football league system. Founded in 1874, they have played at their home ground, Villa Park, since 1897. Aston Villa are one of the oldest and most successful clubs in England, being a founding member of the Football League in 1888 and of the Premier League in 1992.',10,0),(54,'Aston Villa Socks','socks',5,'astonvilla_socks.jpg','Aston Villa Football Club is a professional football club based in Aston, Birmingham, England. The club competes in the Premier League, the top tier of the English football league system. Founded in 1874, they have played at their home ground, Villa Park, since 1897. Aston Villa are one of the oldest and most successful clubs in England, being a founding member of the Football League in 1888 and of the Premier League in 1992.',10,0),(55,'Aston Villa Ball','ball',10,'astonvilla_ball.jpg','Aston Villa Football Club is a professional football club based in Aston, Birmingham, England. The club competes in the Premier League, the top tier of the English football league system. Founded in 1874, they have played at their home ground, Villa Park, since 1897. Aston Villa are one of the oldest and most successful clubs in England, being a founding member of the Football League in 1888 and of the Premier League in 1992.',10,0),(56,'Southamton Shirt','shirt',20,'southamton_shirt.jpg','Southampton Football Club is an English professional football club based in Southampton, Hampshire, which competes in the Premier League. Their home ground since 2001 has been St Mary\'s Stadium, prior to which they were based at The Dell. The club play in red and white shirts. They have been nicknamed \"The Saints\" due to the club\'s beginnings as a church football team at St Mary\'s Church. Southampton share a long-standing South Coast derby rivalry with Portsmouth, due in part to geographic proximity and both cities\' respective maritime histories.',10,0),(57,'Southamton Shorts','short',15,'southamton_short.jpg','Southampton Football Club is an English professional football club based in Southampton, Hampshire, which competes in the Premier League. Their home ground since 2001 has been St Mary\'s Stadium, prior to which they were based at The Dell. The club play in red and white shirts. They have been nicknamed \"The Saints\" due to the club\'s beginnings as a church football team at St Mary\'s Church. Southampton share a long-standing South Coast derby rivalry with Portsmouth, due in part to geographic proximity and both cities\' respective maritime histories.',10,0),(58,'Southamton Socks','socks',5,'southamton_socks.jpg','Southampton Football Club is an English professional football club based in Southampton, Hampshire, which competes in the Premier League. Their home ground since 2001 has been St Mary\'s Stadium, prior to which they were based at The Dell. The club play in red and white shirts. They have been nicknamed \"The Saints\" due to the club\'s beginnings as a church football team at St Mary\'s Church. Southampton share a long-standing South Coast derby rivalry with Portsmouth, due in part to geographic proximity and both cities\' respective maritime histories.',10,0),(59,'Wolves Shirt','shirt',20,'wolves_shirt.jpg','Wolverhampton Wanderers Football Club, commonly known as Wolves, is a professional football club based in Wolverhampton, England, which compete in the Premier League. The club has played at Molineux Stadium since moving from Dudley Road in 1889. The club\'s traditional kit consists of old gold shirts and socks with black shorts. Since 1979, the kit has also featured the club\'s \"wolf\'s head\" logo. Long-standing rivalries exist with other clubs from the West Midlands, the main one being the Black Country derby contested with West Bromwich Albion.',10,0),(60,'Wolves Shorts','short',15,'wolves_short.jpg','Wolverhampton Wanderers Football Club, commonly known as Wolves, is a professional football club based in Wolverhampton, England, which compete in the Premier League. The club has played at Molineux Stadium since moving from Dudley Road in 1889. The club\'s traditional kit consists of old gold shirts and socks with black shorts. Since 1979, the kit has also featured the club\'s \"wolf\'s head\" logo. Long-standing rivalries exist with other clubs from the West Midlands, the main one being the Black Country derby contested with West Bromwich Albion.',10,0),(61,'Wolves Socks','socks',5,'wolves_socks.jpg','Wolverhampton Wanderers Football Club, commonly known as Wolves, is a professional football club based in Wolverhampton, England, which compete in the Premier League. The club has played at Molineux Stadium since moving from Dudley Road in 1889. The club\'s traditional kit consists of old gold shirts and socks with black shorts. Since 1979, the kit has also featured the club\'s \"wolf\'s head\" logo. Long-standing rivalries exist with other clubs from the West Midlands, the main one being the Black Country derby contested with West Bromwich Albion.',10,0),(62,'Leicester City Shirt','shirt',20,'LC_shirt.jpg','Leicester City Football Club is an English professional football club based in Leicester in the East Midlands of England. The club competes in the Premier League, the highest level of England\'s football league system, and plays its home matches at King Power Stadium.',10,0),(63,'Leicester City Shorts','short',15,'LC_short.jpg','Leicester City Football Club is an English professional football club based in Leicester in the East Midlands of England. The club competes in the Premier League, the highest level of England\'s football league system, and plays its home matches at King Power Stadium.',10,0),(64,'Leicester City Socks','socks',5,'LC_socks.jpg','Leicester City Football Club is an English professional football club based in Leicester in the East Midlands of England. The club competes in the Premier League, the highest level of England\'s football league system, and plays its home matches at King Power Stadium.',10,0),(65,'Nottingham Forest Shirt','shirt',20,'NF_shirt.jpg','Nottingham Forest Football Club is an association football club based in West Bridgford, Nottinghamshire, England. The football club was founded in 1865 and have played their home games at the City Ground, on the banks of the River Trent, since 1898. Forest are one of four English clubs to have won the European Cup/UEFA Champions League more than once and are one of two English clubs to have won the competition back-to-back. Forest have two stars above their club crest to commemorate their two European Cup victories. The club competes in the Premier League, the top division of the English football league system.',10,0),(66,'Nottingham Forest Shorts','short',15,'NF_short.jpg','Nottingham Forest Football Club is an association football club based in West Bridgford, Nottinghamshire, England. The football club was founded in 1865 and have played their home games at the City Ground, on the banks of the River Trent, since 1898. Forest are one of four English clubs to have won the European Cup/UEFA Champions League more than once and are one of two English clubs to have won the competition back-to-back. Forest have two stars above their club crest to commemorate their two European Cup victories. The club competes in the Premier League, the top division of the English football league system.',10,0),(67,'Nottingham Forest Socks','socks',5,'NF_socks.jpg','Nottingham Forest Football Club is an association football club based in West Bridgford, Nottinghamshire, England. The football club was founded in 1865 and have played their home games at the City Ground, on the banks of the River Trent, since 1898. Forest are one of four English clubs to have won the European Cup/UEFA Champions League more than once and are one of two English clubs to have won the competition back-to-back. Forest have two stars above their club crest to commemorate their two European Cup victories. The club competes in the Premier League, the top division of the English football league system.',10,0),(68,'Nottingham Forest Ball','ball',10,'NF_ball.jpg','Nottingham Forest Football Club is an association football club based in West Bridgford, Nottinghamshire, England. The football club was founded in 1865 and have played their home games at the City Ground, on the banks of the River Trent, since 1898. Forest are one of four English clubs to have won the European Cup/UEFA Champions League more than once and are one of two English clubs to have won the competition back-to-back. Forest have two stars above their club crest to commemorate their two European Cup victories. The club competes in the Premier League, the top division of the English football league system.',10,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-13 12:28:13
