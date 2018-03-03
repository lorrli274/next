-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: construction_co
-- ------------------------------------------------------
-- Server version 5.7.21-0ubuntu0.16.04.1

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
-- Current Database: `construction_co`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `construction_co` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `construction_co`;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `hourly_wage` float(5,2) NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Zechariah','Langosh',56.00,'2016-10-04'),
(2,'Elmer','Barton',60.00,'2014-11-16'),
(3,'Macie','Kautzer',59.10,'2016-10-18'),
(4,'Janice','Mills',54.00,'2012-05-21'),
(5,'Lillie','Donnelly',48.50,'2012-05-03'),
(6,'Agnes','Zulauf',56.00,'2017-10-11'),
(7,'Kellie','Sauer',60.00,'2012-03-08'),
(8,'Juanita','Swift',36.25,'2015-05-26'),
(9,'Faye','Renner',33.00,'2010-06-11'),
(10,'Ernestina','Langworth',34.00,'2010-03-26'),
(11,'Melissa','Pouros',14.00,'2010-04-12'),
(12,'Ubaldo','Predovic',13.00,'2011-12-21'),
(13,'Osvaldo','Funk',26.00,'2009-02-28'),
(14,'Jamey','Romaguera',37.50,'2017-03-08'),
(15,'Jackeline','Hilpert',51.00,'2009-01-18'),
(16,'Santos','Heidenreich',15.00,'2016-03-12'),
(17,'Jessyca','Leuschke',43.00,'2008-08-05'),
(18,'Dedric','Hamill',16.00,'2010-06-24'),
(19,'Pearl','Champlin',50.50,'2013-03-30'),
(20,'Ophelia','Price',42.00,'2010-01-30'),
(21,'Tess','Hermiston',59.00,'2015-01-22'),
(22,'Salvatore','Borer',20.25,'2009-08-02'),
(23,'Flo','Davis',57.00,'2015-01-16');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_orders`
--

DROP TABLE IF EXISTS `job_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_orders` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(6) NOT NULL,
  `project_id` int(6) NOT NULL,
  `description` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `order_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `quantity` int(6) unsigned NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1356 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_orders`
--

LOCK TABLES `job_orders` WRITE;
/*!40000 ALTER TABLE `job_orders` DISABLE KEYS */;
INSERT INTO `job_orders` VALUES
(16,23,2,'Skil 7-1/4 24-tooth Carbide Tipped Saw Blade, 75724w','2015-12-21 06:42:11',108,2260.89),
(18,7,1,'Black & Decker 20v Max Lithium Ion Drill/driver, Ldx120c','2012-08-28 21:55:28',230,953.14),
(24,15,3,'Legacy Mfg Straight-on Tapered Chuck Inflator W/ 12 In. Hose, Brass Indicator Bar, 10-90 Psi','2018-02-12 22:59:07',90,662.24),
(26,12,3,'Dewalt Power Tools 18 Volt Compact Lithium Ion Drill Driver & Impact Driver Comb','2016-05-25 19:11:00',213,1036.4),
(27,15,4,'Black & Decker 12-volt Cordless Air Station Inflator','2017-05-05 12:37:13',249,314.38),
(39,22,1,'Bostitch Air Regulator & Gauge Kit, 1/4 Npt, Btfp72326','2011-09-13 14:15:31',43,67.99),
(41,12,2,'Multi-temp Hybrid Cordless Glue Gun','2013-02-09 03:28:47',74,1266.91),
(59,15,1,'Primefit Industrial-grade Retractable Air Hose Reel With 50 Rubber Air Hose','2012-02-05 15:31:44',208,1135.11),
(62,9,5,'Ultra Steel 3.0 Amp Jig Saw','2018-02-26 16:54:32',61,1089.18),
(66,9,2,'Crawford 38 In. Adjustable Steel Sawhorse','2013-04-13 16:45:20',222,581.41),
(74,7,2,'Got Air Heavy Duty Portable Air Compressor, Pump, Inflator','2014-03-29 21:37:21',43,108.67),
(75,7,2,'Bosch 1006vsr 3/8 Corded Drill','2016-02-18 09:54:08',132,857.33),
(78,4,3,'Sold & Shipped By Wayfair.com','2014-09-05 04:48:36',19,1681.28),
(83,4,4,'Rubbermaid Wall Washer Replacement Pads, White Rcps299','2015-08-30 14:39:23',208,567.45),
(86,17,4,'Dremel 7300-n/8 4.8-volt Cordless Dremel Minimite Two Speed Rotary Tool','2017-12-17 09:38:36',274,2406.61),
(90,20,2,'Dremel 8300-01 12v Cordless Multi-max Oscillating Kit, Refurbished','2015-07-09 11:01:24',265,306.04),
(105,9,2,'Cps Products Ccvpc4su 4 Cfm Single Stage Vacuum Pump','2014-07-29 01:35:59',253,724.52),
(112,18,4,'Black & Decker 109-piece Basic Project Set, 71-0109','2017-05-22 23:01:54',292,1758.81),
(114,18,2,'Ingersoll Rand Impact 1/2','2016-02-05 17:45:25',260,1410.73),
(119,17,1,'Buffalo Tools Electric 110v 3/8 Vsr Drill','2010-01-10 23:09:54',71,2419.16),
(126,17,2,'Electric Glue Skillet 7','2015-08-14 21:32:28',94,1611.17),
(127,13,3,'Black & Decker 7750a 4-1/2-inch Small Angle Grinder','2017-07-11 05:57:20',181,526.09),
(140,13,1,'Skil 7-1/4 40-tooth Carbide Tipped Circular Saw Blade, 75740w','2009-06-18 16:13:32',1,62.55),
(144,11,3,'Pentagon Professional Aluminum Drywall Bench','2014-07-15 02:43:07',286,2380.76),
(146,20,2,'Wen 5.2 Amp Electric Pole Saw','2013-09-15 18:49:34',26,1877.01),
(148,7,4,'Ingersoll Rand Hammer Pin','2016-05-04 15:33:49',165,1333.63),
(156,20,2,'Dremel Saw-max Tool Kit, Sm20-03','2013-02-13 00:51:20',102,489.63),
(161,22,1,'Black & Decker 18-volt Cordless Drill, Gco18c','2012-05-04 23:49:55',21,2120.87),
(162,22,2,'Black & Decker Vs Jig Saw, Js515','2014-02-16 21:42:52',142,1837.79),
(169,19,5,'Dewalt Tools Dwtdc385k Hd Srp 18v Cordless Reciprocating Saw Kit','2018-01-30 17:46:24',52,1964.29),
(191,14,3,'Fpc Corporation Surebonder Dual Melt High/low Temperature Glue Gun Fprdt270','2017-10-11 19:47:28',228,937.87),
(194,17,1,'Eclipse Dp-366d Desoldering Pump','2009-10-11 09:54:58',105,624.4),
(201,17,3,'Jflint Products 306 Mr Hard Water- Power Tool System','2016-06-01 01:49:39',246,1828.3),
(202,12,2,'Powermate 10 Gallon Proforce Oil Free Vertical Air Compressor','2014-01-21 14:10:52',173,2160.05),
(204,21,2,'Radnor #7326 1/4 Id Brass Hose Ferrule','2016-02-12 00:26:18',248,53.48),
(207,15,5,'Mk Diamond Mk-370exp 7-inch Wet Cutting Tile Saw','2018-02-25 20:40:54',24,1212.21),
(210,10,3,'Stalwart 8-in-1 Multipurpose Lighted Magnetic Driver With Bits','2017-05-17 08:09:31',227,456.57),
(212,15,4,'Primefit Industrial-grade Retractable Air Hose Reel With 50 Rubber Air Hose','2017-06-12 13:07:40',54,805.19),
(225,9,3,'Lincoln Industrial 18 Volt Cordless Grease Gun W/ 2 Batteries','2015-02-05 19:04:36',287,1142.35),
(228,17,1,'Black & Decker Lithium-ion Smartdriver With Exclusive Magnetic Screw-holder','2012-01-14 01:58:59',209,635.58),
(240,13,1,'Century Drill And Tool Jig Saw Blade (set Of 5) (set Of 5)','2012-11-09 23:12:33',100,1036.6),
(242,4,3,'Skil 735-0118v Octo Multi-finishing Sander','2016-01-21 23:02:48',272,1637.06),
(244,17,4,'Stanley Fatmax 3/8 Corded Drill, Fme105','2015-10-24 00:39:08',294,953.56),
(245,17,1,'Ultra Steel 4-piece 18v Cordless Power Tool Kit','2009-11-18 08:19:41',99,720.71),
(247,7,5,'Qep Tile Tools 60089 7 Portable Tile Saw','2018-02-11 22:31:53',235,1506.56),
(248,7,4,'Campbell Hausfeld Exteme Duty 3/8 Air Ratchet','2017-07-29 14:46:22',245,1527.75),
(249,16,4,'Skil 5480-01 7-1/4-inch Skilsaw Circular Saw','2018-02-28 10:54:24',232,1628.99),
(250,15,3,'Mayhew Tools Mayhew Tools - Catspaw Deck Wrecker Cats Paw Deck Wrecker: 479-41104 - Cats Paw Deck Wr','2016-07-30 06:35:12',151,1176.9),
(251,11,2,'Black & Decker 5.2a 3.25 Planer Kit, 7698k','2015-06-28 16:04:29',55,225.1),
(253,12,3,'Dremel Sm600 3 Multi-purpose Flush Cut Carbide Wheel','2018-01-27 01:43:46',194,24.36),
(254,13,2,'Powryte 3/8 Air Impact Wrench, 100101a','2013-12-06 02:20:34',256,228.42),
(256,12,1,'Gyros 45-20265 High Speed Steel Wire Gauge Drill Bit No.65 Set Of 2','2012-06-14 03:12:10',270,135.58),
(261,14,4,'Ingersoll Rand 705-93 Trigger','2017-05-09 20:12:28',101,1705.15),
(266,18,4,'Wagner 0283022c Ht775 Heat Gun','2015-12-06 17:23:22',31,1295.3),
(267,13,2,'Powermate 6 Gallon Proforce Pancake Air Compressor With Extra Value Kit','2015-04-10 18:40:51',213,1659.85),
(269,20,2,'Numax 18 Gauge 2 In 1 Brad Nailer & Stapler','2014-03-30 21:40:00',230,710.58),
(270,9,3,'Hitachi 35 Piece Hi-torq Impact Rated Torsion Bit Set','2017-10-20 00:12:02',207,430.18),
(282,20,4,'Campbell Hausfeld Lever Safety Blowgun Kit','2017-10-14 20:13:24',173,2163.29),
(287,22,1,'Bostitch 50 Foot Air Hose, 1/4 Npt, Btfp72334','2010-12-01 20:38:58',110,2263.97),
(290,10,2,'Black And Decker Dragster 3 X 21 Belt Sander, Ds321','2015-11-03 18:54:43',174,1911.73),
(302,9,2,'Crawford 38 In. Adjustable Steel Sawhorse','2015-04-15 03:11:16',145,1318.71),
(307,18,2,'Mini Glue Sticks 4 25/pkg-gold/silver','2014-06-25 06:06:13',293,2441.85),
(311,13,2,'Goodyear Heavy Duty I8000 120 Volt Direct Drive Inflator','2014-03-25 13:39:05',111,91.75),
(313,13,4,'Porter Cable 352vs 3 X 21 Variable Speed Belt Sander','2016-10-08 20:52:31',23,1485.07),
(317,18,4,'Vermont American 7 To 7-1/4 Masonry Circular Saw Blades 28052','2016-07-23 14:53:20',176,1343.68),
(327,12,3,'Skil 4570-01 18-volt Jigsaw','2016-09-12 23:07:53',187,779.61),
(333,12,2,'Mountain Blow Gun 24 Deluxe W/90 Deg Angled Nozzle','2015-07-15 17:52:49',234,1042.69),
(348,7,4,'Hitachi 17 Piece Split Point Black Oxide Shield Drill Bit Set','2017-04-23 02:34:07',97,1610.7),
(358,4,4,'Black And Decker 3-position Rechargeable Screwdriver, Li2000','2017-09-18 15:16:17',74,594.07),
(360,10,1,'Campbell Hausfeld 2-1/2 Finish Nailer (16 Gauge)','2010-12-13 02:28:51',6,629.65),
(361,12,3,'Gmc Power Equipment 4.6 Gallon Gmc Syclone 4620a Ultra Quiet And Oil Free Air Compressor','2016-07-08 17:35:25',152,699.35),
(365,15,1,'Hitachi 1 1/2 18-gauge Narrow Crown Finish Stapler','2009-09-09 03:37:03',175,249.92),
(382,5,4,'Aaa 300psi Air Compressor','2017-02-22 04:12:38',246,129.44),
(385,15,1,'Eclipse 900-015 Helping Hands Soldering Aid','2011-03-29 19:17:27',184,85.54),
(392,15,4,'Wagner Ht1000 Heat Tool','2015-09-08 17:23:45',133,165.08),
(405,12,2,'Skil 1400-02 Multi-tasker 2.0a Oscillating Tool Kit','2015-02-27 00:28:56',64,1137.29),
(423,9,1,'Bostitch .5 Vsr 2-speed Hammerdrill/drill, Bte140k','2011-07-31 20:26:14',278,2288.85),
(425,20,1,'Powryte 3/8 Air Impact Wrench, 100101a','2010-10-30 20:04:38',13,1068.26),
(426,16,4,'Mayhew Tools Mayhew Tools - Catspaw Deck Wrecker Cats Paw Deck Wrecker: 479-41104 - Cats Paw Deck Wr','2016-10-12 13:38:52',3,1472.89),
(427,2,4,'Fpc Glue Sticks, 4, 15/pkg, Glow-in-the-dark','2017-06-05 15:47:26',20,481.28),
(432,2,3,'Skil 7-1/4 40-tooth Carbide Tipped Circular Saw Blade, 75740w','2016-01-04 07:35:00',35,1376.64),
(435,15,4,'Master Magnetics 7269 36-inch Retrieval Magnet','2017-11-15 23:53:13',165,233.08),
(441,21,4,'Bosch 2240-01 12 Volt Cordless Drill And Driver','2018-01-30 17:54:47',296,481.72),
(446,18,2,'Drill America Flame Carbide Burr 1/4 Shank','2012-07-17 19:21:17',233,2427.05),
(454,22,2,'Cgw Abrasives Z-thru Flap Discs - 4 1/2 X 7/8 Z-80 T27 Z-thru Flap Disc','2014-09-24 00:25:28',129,1412.19),
(459,20,1,'Black & Decker Vs Jig Saw, Js515','2011-04-07 02:30:20',64,1866.54),
(465,7,3,'Dewalt Power Tools 18 Volt Compact Lithium Ion Drill Driver & Impact Driver Comb','2016-11-15 05:18:56',268,1237.43),
(467,14,3,'Vermont American 10 40 Tpi 10x Titanium Carbide Circular Saw Blades 27831','2018-01-21 23:28:30',182,1163.45),
(468,10,4,'California Air Tools 10 Gallon Ultra Quiet And Oil-free 2.0 Hp Steel Tank Air Compressor','2016-01-05 09:09:58',20,1852.68),
(474,15,3,'Hyundai Hpc3010 Air Compressor Kit','2014-08-18 17:10:36',287,704.22),
(476,4,3,'Great Neck Saw 80134 36-piece Rotary Tool Set','2014-02-11 09:16:31',247,1448.65),
(481,7,4,'Ad Tech Hi-temp Full Size Glue Gun','2017-07-17 19:45:47',72,172.69),
(484,14,3,'Forney 72732 Wire Cup Brush Fine Crimped With 1/4-inch Hex Shank 3-inch-by-.008-inch','2017-03-21 04:17:48',169,827.38),
(486,12,4,'Hitachi 18 V Post Li-ion Driver Drill','2017-03-06 20:50:38',297,1071.45),
(496,18,3,'Master Magnetics 07047 Neodymium Disc Magnets - 3-pack','2017-09-27 04:57:02',65,282.02),
(506,19,2,'Hitachi 2 Hp 4-gal Compressor','2014-02-05 10:23:42',172,400.24),
(513,11,3,'Freeman Pf3p6galck Freeman Ultimate Finishing Kit With 6 Gallon Compressor, 3 Nailers, Canvas Carry','2015-09-13 14:53:44',207,2246.44),
(519,10,3,'Black & Decker 18v Cordless Drill Set, Gco18sfb','2014-04-19 22:53:20',292,2471.87),
(522,15,2,'Bosch Ros10 5 Palm-grip Random Orbit Sander','2015-10-26 05:52:56',182,1341.41),
(528,9,2,'Bostitch Air Regulator And Gauge, Threaded, #mregulator','2014-01-20 02:31:29',278,303.62),
(538,13,1,'Skil 7-1/4 24-tooth Carbide Tipped Saw Blade, 75724w','2012-04-04 08:31:04',229,1529.54),
(549,22,3,'Black & Decker 20v Max Lithium Ion Drill/driver, Ldx120c','2015-12-09 04:40:28',111,1957.39),
(559,5,4,'Legacy Mfg Straight-on Tapered Chuck Inflator W/ 12 In. Hose, Brass Indicator Bar, 10-90 Psi','2017-05-21 07:43:35',181,1961.61),
(560,19,2,'Dewalt Power Tools 18 Volt Compact Lithium Ion Drill Driver & Impact Driver Comb','2013-06-26 13:18:33',146,1374.32),
(561,3,4,'Black & Decker 12-volt Cordless Air Station Inflator','2017-12-31 15:59:38',119,1857.45),
(568,20,4,'Bostitch Air Regulator & Gauge Kit, 1/4 Npt, Btfp72326','2015-07-28 04:07:24',157,787.14),
(569,22,3,'Multi-temp Hybrid Cordless Glue Gun','2016-01-03 20:57:12',269,973.1),
(571,13,4,'Primefit Industrial-grade Retractable Air Hose Reel With 50 Rubber Air Hose','2016-11-28 16:26:01',87,355.55),
(576,19,3,'Ultra Steel 3.0 Amp Jig Saw','2017-09-23 17:28:59',176,1377.49),
(581,11,3,'Crawford 38 In. Adjustable Steel Sawhorse','2015-11-04 00:48:01',297,680.86),
(583,19,3,'Got Air Heavy Duty Portable Air Compressor, Pump, Inflator','2016-09-26 13:07:04',257,271.27),
(587,17,3,'Bosch 1006vsr 3/8 Corded Drill','2017-01-27 14:46:21',170,1328.2),
(592,4,3,'Sold & Shipped By Wayfair.com','2017-03-22 00:35:21',235,2439.42),
(609,15,3,'Rubbermaid Wall Washer Replacement Pads, White Rcps299','2014-10-29 17:40:21',140,1675.13),
(613,13,3,'Dremel 7300-n/8 4.8-volt Cordless Dremel Minimite Two Speed Rotary Tool','2014-12-15 09:32:09',238,1831.1),
(616,10,1,'Dremel 8300-01 12v Cordless Multi-max Oscillating Kit, Refurbished','2011-09-22 22:41:42',4,1556.54),
(622,17,3,'Cps Products Ccvpc4su 4 Cfm Single Stage Vacuum Pump','2016-05-08 17:19:19',8,2252.17),
(623,17,1,'Black & Decker 109-piece Basic Project Set, 71-0109','2012-04-22 04:15:37',257,697.85),
(626,8,3,'Ingersoll Rand Impact 1/2','2018-02-11 04:54:49',38,1198.71),
(628,15,4,'Buffalo Tools Electric 110v 3/8 Vsr Drill','2017-07-30 03:00:23',255,1607.88),
(634,21,4,'Electric Glue Skillet 7','2015-10-14 01:38:07',164,256.99),
(641,17,3,'Black & Decker 7750a 4-1/2-inch Small Angle Grinder','2017-07-12 02:52:30',86,2145.18),
(644,11,2,'Skil 7-1/4 40-tooth Carbide Tipped Circular Saw Blade, 75740w','2013-12-04 10:29:04',6,2358.59),
(652,12,2,'Pentagon Professional Aluminum Drywall Bench','2015-11-12 06:58:11',99,2488.27),
(655,7,3,'Wen 5.2 Amp Electric Pole Saw','2017-05-20 21:21:34',222,1611.26),
(656,5,1,'Ingersoll Rand Hammer Pin','2012-08-29 15:21:22',231,1956.11),
(661,8,4,'Dremel Saw-max Tool Kit, Sm20-03','2015-12-31 04:16:12',112,1429.7),
(668,22,1,'Black & Decker 18-volt Cordless Drill, Gco18c','2012-07-31 10:40:43',193,267.11),
(674,15,2,'Black & Decker Vs Jig Saw, Js515','2016-02-24 21:33:37',178,781.23),
(677,7,1,'Dewalt Tools Dwtdc385k Hd Srp 18v Cordless Reciprocating Saw Kit','2012-04-23 02:50:01',42,845.66),
(682,19,3,'Fpc Corporation Surebonder Dual Melt High/low Temperature Glue Gun Fprdt270','2015-09-08 14:32:26',120,1018.32),
(691,21,3,'Eclipse Dp-366d Desoldering Pump','2015-03-08 19:15:33',31,177.86),
(699,9,1,'Jflint Products 306 Mr Hard Water- Power Tool System','2010-11-25 07:28:24',6,1323.85),
(701,4,3,'Powermate 10 Gallon Proforce Oil Free Vertical Air Compressor','2014-08-07 20:17:13',278,462.76),
(712,20,2,'Radnor #7326 1/4 Id Brass Hose Ferrule','2012-05-07 06:12:59',297,1564.49),
(713,7,2,'Mk Diamond Mk-370exp 7-inch Wet Cutting Tile Saw','2013-10-06 23:47:06',27,597.96),
(732,13,2,'Stalwart 8-in-1 Multipurpose Lighted Magnetic Driver With Bits','2015-01-10 07:51:30',17,225.88),
(737,21,4,'Primefit Industrial-grade Retractable Air Hose Reel With 50 Rubber Air Hose','2017-08-07 05:42:48',107,1705.57),
(739,5,3,'Lincoln Industrial 18 Volt Cordless Grease Gun W/ 2 Batteries','2015-08-21 10:39:23',237,950.49),
(741,16,4,'Black & Decker Lithium-ion Smartdriver With Exclusive Magnetic Screw-holder','2017-01-31 09:38:15',139,656.53),
(742,12,3,'Century Drill And Tool Jig Saw Blade (set Of 5) (set Of 5)','2017-11-17 20:33:43',170,487.93),
(745,18,3,'Skil 735-0118v Octo Multi-finishing Sander','2015-05-27 16:38:22',244,2019.44),
(747,7,4,'Stanley Fatmax 3/8 Corded Drill, Fme105','2017-12-07 15:33:22',161,2012.79),
(748,10,2,'Ultra Steel 4-piece 18v Cordless Power Tool Kit','2015-01-14 23:23:29',180,1830.6),
(760,7,2,'Qep Tile Tools 60089 7 Portable Tile Saw','2012-03-16 16:53:20',101,2087.26),
(761,13,3,'Campbell Hausfeld Exteme Duty 3/8 Air Ratchet','2016-10-07 21:46:11',98,65.52),
(764,4,4,'Skil 5480-01 7-1/4-inch Skilsaw Circular Saw','2017-10-02 23:38:32',30,1956.5),
(765,12,4,'Mayhew Tools Mayhew Tools - Catspaw Deck Wrecker Cats Paw Deck Wrecker: 479-41104 - Cats Paw Deck Wr','2016-07-15 20:45:02',105,133.58),
(770,16,4,'Black & Decker 5.2a 3.25 Planer Kit, 7698k','2017-09-08 21:28:15',25,2376.02),
(777,20,1,'Dremel Sm600 3 Multi-purpose Flush Cut Carbide Wheel','2010-07-08 13:51:58',285,1039.65),
(780,18,2,'Powryte 3/8 Air Impact Wrench, 100101a','2013-07-03 19:59:12',23,2268.51),
(782,19,3,'Gyros 45-20265 High Speed Steel Wire Gauge Drill Bit No.65 Set Of 2','2015-01-26 17:27:58',183,1830.41),
(787,18,1,'Ingersoll Rand 705-93 Trigger','2012-07-19 07:03:18',146,2178.33),
(803,2,4,'Wagner 0283022c Ht775 Heat Gun','2016-01-25 07:59:41',283,1067.89),
(810,20,2,'Powermate 6 Gallon Proforce Pancake Air Compressor With Extra Value Kit','2014-01-30 14:09:52',135,118.51),
(812,7,4,'Numax 18 Gauge 2 In 1 Brad Nailer & Stapler','2016-11-23 08:22:20',121,499.01),
(813,23,4,'Hitachi 35 Piece Hi-torq Impact Rated Torsion Bit Set','2015-08-15 15:55:09',108,930.72),
(817,10,2,'Campbell Hausfeld Lever Safety Blowgun Kit','2012-05-05 04:10:48',86,660.92),
(819,20,3,'Bostitch 50 Foot Air Hose, 1/4 Npt, Btfp72334','2016-06-03 04:17:43',193,1172.32),
(821,12,2,'Black And Decker Dragster 3 X 21 Belt Sander, Ds321','2013-12-06 04:19:48',98,2370.93),
(824,9,4,'Crawford 38 In. Adjustable Steel Sawhorse','2016-09-20 10:11:16',192,320.2),
(829,4,4,'Mini Glue Sticks 4 25/pkg-gold/silver','2016-09-21 12:06:11',254,445.96),
(835,9,2,'Goodyear Heavy Duty I8000 120 Volt Direct Drive Inflator','2015-03-24 01:42:32',258,1281.33),
(837,13,1,'Porter Cable 352vs 3 X 21 Variable Speed Belt Sander','2011-09-12 14:20:00',63,2167.98),
(843,19,3,'Vermont American 7 To 7-1/4 Masonry Circular Saw Blades 28052','2013-12-08 04:34:30',185,2290.18),
(847,5,4,'Skil 4570-01 18-volt Jigsaw','2016-03-01 07:40:08',59,249.68),
(848,17,1,'Mountain Blow Gun 24 Deluxe W/90 Deg Angled Nozzle','2012-02-13 12:35:58',203,1744.14),
(849,12,4,'Hitachi 17 Piece Split Point Black Oxide Shield Drill Bit Set','2017-08-26 14:22:21',299,1692.14),
(852,17,3,'Black And Decker 3-position Rechargeable Screwdriver, Li2000','2017-07-21 15:52:36',268,1747.17),
(855,15,4,'Campbell Hausfeld 2-1/2 Finish Nailer (16 Gauge)','2017-08-19 12:27:20',281,2210.64),
(856,2,3,'Gmc Power Equipment 4.6 Gallon Gmc Syclone 4620a Ultra Quiet And Oil Free Air Compressor','2017-03-03 05:16:18',110,14.93),
(869,15,1,'Hitachi 1 1/2 18-gauge Narrow Crown Finish Stapler','2012-02-13 14:13:39',55,1618.34),
(870,20,2,'Aaa 300psi Air Compressor','2013-04-12 09:12:33',17,2195.76),
(879,10,3,'Eclipse 900-015 Helping Hands Soldering Aid','2015-06-19 03:04:41',91,1565.85),
(882,7,4,'Wagner Ht1000 Heat Tool','2015-07-08 04:30:51',157,165.44),
(887,9,2,'Skil 1400-02 Multi-tasker 2.0a Oscillating Tool Kit','2015-09-14 01:30:43',202,477.66),
(891,13,2,'Bostitch .5 Vsr 2-speed Hammerdrill/drill, Bte140k','2012-09-09 05:31:10',209,1543.35),
(896,7,2,'Powryte 3/8 Air Impact Wrench, 100101a','2012-03-31 08:32:07',255,1410.31),
(897,4,3,'Mayhew Tools Mayhew Tools - Catspaw Deck Wrecker Cats Paw Deck Wrecker: 479-41104 - Cats Paw Deck Wr','2016-09-14 03:03:15',21,2218.35),
(898,22,4,'Fpc Glue Sticks, 4, 15/pkg, Glow-in-the-dark','2017-01-10 20:20:28',143,587.69),
(899,17,3,'Skil 7-1/4 40-tooth Carbide Tipped Circular Saw Blade, 75740w','2015-07-20 11:19:06',206,2242.02),
(910,11,2,'Master Magnetics 7269 36-inch Retrieval Magnet','2012-03-12 22:12:26',168,1854.65),
(918,9,5,'Bosch 2240-01 12 Volt Cordless Drill And Driver','2018-02-21 00:45:25',222,1752.2),
(923,18,2,'Drill America Flame Carbide Burr 1/4 Shank','2015-02-02 01:08:46',176,2167.05),
(924,20,3,'Cgw Abrasives Z-thru Flap Discs - 4 1/2 X 7/8 Z-80 T27 Z-thru Flap Disc','2015-07-04 06:34:14',284,291.42),
(925,17,2,'Black & Decker Vs Jig Saw, Js515','2012-03-25 16:52:02',121,992.44),
(937,4,1,'Dewalt Power Tools 18 Volt Compact Lithium Ion Drill Driver & Impact Driver Comb','2012-07-11 03:31:04',18,1008.65),
(938,10,5,'Vermont American 10 40 Tpi 10x Titanium Carbide Circular Saw Blades 27831','2018-01-29 01:20:24',88,818.9),
(939,9,2,'California Air Tools 10 Gallon Ultra Quiet And Oil-free 2.0 Hp Steel Tank Air Compressor','2012-05-16 20:14:31',256,661.44),
(941,13,2,'Hyundai Hpc3010 Air Compressor Kit','2015-01-23 18:37:33',73,33.14),
(949,16,3,'Great Neck Saw 80134 36-piece Rotary Tool Set','2017-05-05 14:44:03',50,1917.86),
(951,18,2,'Ad Tech Hi-temp Full Size Glue Gun','2012-12-09 16:29:26',213,2042.42),
(956,18,3,'Forney 72732 Wire Cup Brush Fine Crimped With 1/4-inch Hex Shank 3-inch-by-.008-inch','2015-05-09 14:06:07',165,2298.89),
(957,13,1,'Hitachi 18 V Post Li-ion Driver Drill','2010-01-20 12:17:44',93,1330.45),
(960,20,3,'Master Magnetics 07047 Neodymium Disc Magnets - 3-pack','2015-09-22 04:24:52',134,871.69),
(961,20,2,'Hitachi 2 Hp 4-gal Compressor','2015-02-03 22:17:18',89,235.73),
(965,18,2,'Freeman Pf3p6galck Freeman Ultimate Finishing Kit With 6 Gallon Compressor, 3 Nailers, Canvas Carry','2012-05-01 23:11:57',38,923.22),
(966,9,3,'Black & Decker 18v Cordless Drill Set, Gco18sfb','2014-07-23 01:51:13',27,647.29),
(977,5,2,'Bosch Ros10 5 Palm-grip Random Orbit Sander','2012-10-25 12:59:07',91,1316.53),
(980,4,2,'Bostitch Air Regulator And Gauge, Threaded, #mregulator','2014-03-05 23:11:51',71,563.13),
(981,18,3,'Skil 7-1/4 24-tooth Carbide Tipped Saw Blade, 75724w','2014-05-27 18:05:53',296,1755.75),
(985,12,4,'Black & Decker 20v Max Lithium Ion Drill/driver, Ldx120c','2017-10-30 22:15:23',205,2317.68),
(991,5,2,'Legacy Mfg Straight-on Tapered Chuck Inflator W/ 12 In. Hose, Brass Indicator Bar, 10-90 Psi','2013-06-16 02:06:37',275,947.45),
(992,4,2,'Dewalt Power Tools 18 Volt Compact Lithium Ion Drill Driver & Impact Driver Comb','2015-08-12 02:49:08',122,2379.84),
(994,18,2,'Black & Decker 12-volt Cordless Air Station Inflator','2013-01-20 20:02:58',258,1607.6),
(998,22,3,'Bostitch Air Regulator & Gauge Kit, 1/4 Npt, Btfp72326','2014-03-25 22:53:36',147,79.53),
(1004,15,4,'Multi-temp Hybrid Cordless Glue Gun','2015-08-01 06:54:28',207,982.94),
(1008,5,1,'Primefit Industrial-grade Retractable Air Hose Reel With 50 Rubber Air Hose','2012-08-23 08:11:50',121,859.36),
(1019,13,3,'Ultra Steel 3.0 Amp Jig Saw','2014-12-13 22:29:10',234,1622.57),
(1033,18,1,'Crawford 38 In. Adjustable Steel Sawhorse','2012-09-01 03:09:27',12,1836.99),
(1034,15,2,'Got Air Heavy Duty Portable Air Compressor, Pump, Inflator','2012-02-15 04:21:47',132,1387.75),
(1040,15,4,'Bosch 1006vsr 3/8 Corded Drill','2017-10-19 01:21:22',204,2320.11),
(1041,13,2,'Sold & Shipped By Wayfair.com','2015-06-17 19:06:33',227,2018.26),
(1051,12,3,'Rubbermaid Wall Washer Replacement Pads, White Rcps299','2017-09-15 04:50:07',48,1667.15),
(1056,4,2,'Dremel 7300-n/8 4.8-volt Cordless Dremel Minimite Two Speed Rotary Tool','2012-08-03 23:05:52',46,2125.45),
(1059,19,2,'Dremel 8300-01 12v Cordless Multi-max Oscillating Kit, Refurbished','2015-10-22 03:01:11',53,846.22),
(1062,20,4,'Cps Products Ccvpc4su 4 Cfm Single Stage Vacuum Pump','2016-12-28 14:23:20',197,1488.74),
(1070,13,2,'Black & Decker 109-piece Basic Project Set, 71-0109','2012-08-20 10:53:22',185,1548.44),
(1073,13,2,'Ingersoll Rand Impact 1/2','2012-11-11 11:08:23',245,119.68),
(1074,20,2,'Buffalo Tools Electric 110v 3/8 Vsr Drill','2015-10-04 10:09:34',85,2096.69),
(1079,5,2,'Electric Glue Skillet 7','2013-01-17 22:49:31',130,941.26),
(1085,21,3,'Black & Decker 7750a 4-1/2-inch Small Angle Grinder','2015-09-06 21:26:55',136,1307.62),
(1086,21,4,'Skil 7-1/4 40-tooth Carbide Tipped Circular Saw Blade, 75740w','2017-12-23 05:02:51',219,1578.04),
(1088,12,4,'Pentagon Professional Aluminum Drywall Bench','2015-10-30 04:53:58',53,577.2),
(1089,20,2,'Wen 5.2 Amp Electric Pole Saw','2014-05-23 12:38:33',177,700.54),
(1091,5,2,'Ingersoll Rand Hammer Pin','2012-11-29 12:36:57',237,1232.87),
(1094,5,3,'Dremel Saw-max Tool Kit, Sm20-03','2017-09-29 12:00:33',190,1001.2),
(1096,18,2,'Black & Decker 18-volt Cordless Drill, Gco18c','2014-07-31 20:12:38',21,1387.24),
(1101,13,1,'Black & Decker Vs Jig Saw, Js515','2009-03-03 06:46:14',162,24.94),
(1102,1,4,'Dewalt Tools Dwtdc385k Hd Srp 18v Cordless Reciprocating Saw Kit','2017-01-23 12:40:00',244,144.02),
(1107,17,1,'Fpc Corporation Surebonder Dual Melt High/low Temperature Glue Gun Fprdt270','2009-08-13 22:56:37',190,2035.22),
(1112,23,3,'Eclipse Dp-366d Desoldering Pump','2016-05-18 12:54:53',85,2489.46),
(1115,5,2,'Jflint Products 306 Mr Hard Water- Power Tool System','2015-11-16 06:00:49',39,873.19),
(1116,20,4,'Powermate 10 Gallon Proforce Oil Free Vertical Air Compressor','2018-01-10 16:47:20',197,2148.99),
(1126,13,2,'Radnor #7326 1/4 Id Brass Hose Ferrule','2013-05-22 15:24:50',15,2393.85),
(1138,9,2,'Mk Diamond Mk-370exp 7-inch Wet Cutting Tile Saw','2015-11-23 10:54:56',71,739.54),
(1142,2,3,'Stalwart 8-in-1 Multipurpose Lighted Magnetic Driver With Bits','2017-10-15 05:21:56',39,2112.28),
(1147,15,3,'Primefit Industrial-grade Retractable Air Hose Reel With 50 Rubber Air Hose','2016-07-05 17:14:15',155,384.3),
(1150,15,3,'Lincoln Industrial 18 Volt Cordless Grease Gun W/ 2 Batteries','2017-01-10 04:40:49',230,662.59),
(1151,1,4,'Black & Decker Lithium-ion Smartdriver With Exclusive Magnetic Screw-holder','2017-12-27 02:40:04',178,613.33),
(1153,5,2,'Century Drill And Tool Jig Saw Blade (set Of 5) (set Of 5)','2015-07-16 05:55:04',21,2486.97),
(1154,4,3,'Skil 735-0118v Octo Multi-finishing Sander','2017-01-06 13:24:42',13,1818.34),
(1167,10,3,'Stanley Fatmax 3/8 Corded Drill, Fme105','2016-12-26 05:38:18',262,383.98),
(1177,20,2,'Ultra Steel 4-piece 18v Cordless Power Tool Kit','2013-07-21 05:02:30',299,901.09),
(1178,22,2,'Qep Tile Tools 60089 7 Portable Tile Saw','2015-10-13 07:37:09',59,1809.05),
(1183,9,4,'Campbell Hausfeld Exteme Duty 3/8 Air Ratchet','2016-03-15 07:44:55',264,2059.04),
(1185,18,4,'Skil 5480-01 7-1/4-inch Skilsaw Circular Saw','2015-10-26 00:41:08',40,488.7),
(1190,15,4,'Mayhew Tools Mayhew Tools - Catspaw Deck Wrecker Cats Paw Deck Wrecker: 479-41104 - Cats Paw Deck Wr','2016-10-15 19:29:08',58,225.09),
(1193,2,3,'Black & Decker 5.2a 3.25 Planer Kit, 7698k','2015-11-05 14:26:29',165,149.82),
(1203,12,3,'Dremel Sm600 3 Multi-purpose Flush Cut Carbide Wheel','2014-09-24 01:33:34',121,69.67),
(1211,4,3,'Powryte 3/8 Air Impact Wrench, 100101a','2017-11-26 17:56:55',166,800.02),
(1212,17,2,'Gyros 45-20265 High Speed Steel Wire Gauge Drill Bit No.65 Set Of 2','2012-07-01 23:12:25',93,2443.77),
(1232,19,4,'Ingersoll Rand 705-93 Trigger','2015-09-10 22:59:04',248,501.02),
(1235,10,3,'Wagner 0283022c Ht775 Heat Gun','2017-08-21 11:59:08',2,1651.13),
(1238,22,3,'Powermate 6 Gallon Proforce Pancake Air Compressor With Extra Value Kit','2015-03-14 13:27:46',237,447.39),
(1242,19,4,'Numax 18 Gauge 2 In 1 Brad Nailer & Stapler','2017-03-28 02:57:02',104,810.82),
(1244,21,2,'Hitachi 35 Piece Hi-torq Impact Rated Torsion Bit Set','2015-04-11 19:53:51',49,1724.07),
(1246,19,4,'Campbell Hausfeld Lever Safety Blowgun Kit','2016-08-23 19:22:13',251,1305.08),
(1247,10,3,'Bostitch 50 Foot Air Hose, 1/4 Npt, Btfp72334','2017-07-05 21:42:43',171,1012.59),
(1262,15,2,'Black And Decker Dragster 3 X 21 Belt Sander, Ds321','2015-07-08 17:44:29',208,1374.09),
(1273,4,4,'Crawford 38 In. Adjustable Steel Sawhorse','2015-11-10 16:05:09',273,2360.53),
(1313,10,3,'Mini Glue Sticks 4 25/pkg-gold/silver','2017-09-28 13:45:05',128,1820.06),
(1315,19,3,'Goodyear Heavy Duty I8000 120 Volt Direct Drive Inflator','2017-06-04 05:10:45',107,1846.61),
(1316,21,4,'Porter Cable 352vs 3 X 21 Variable Speed Belt Sander','2016-09-13 10:29:13',223,298.11),
(1327,17,3,'Vermont American 7 To 7-1/4 Masonry Circular Saw Blades 28052','2015-05-24 02:07:39',267,768.37),
(1328,13,1,'Skil 4570-01 18-volt Jigsaw','2011-05-07 04:08:41',106,1329.67),
(1331,15,3,'Mountain Blow Gun 24 Deluxe W/90 Deg Angled Nozzle','2014-04-11 06:17:40',64,1960.2),
(1335,13,3,'Hitachi 17 Piece Split Point Black Oxide Shield Drill Bit Set','2016-07-22 05:36:42',232,1725.62),
(1337,13,2,'Black And Decker 3-position Rechargeable Screwdriver, Li2000','2014-04-23 03:00:30',202,908.72),
(1339,16,4,'Campbell Hausfeld 2-1/2 Finish Nailer (16 Gauge)','2016-04-08 00:21:36',49,1505.88),
(1340,5,1,'Gmc Power Equipment 4.6 Gallon Gmc Syclone 4620a Ultra Quiet And Oil Free Air Compressor','2012-10-21 00:37:06',49,152.22),
(1351,22,1,'Hitachi 1 1/2 18-gauge Narrow Crown Finish Stapler','2012-07-23 13:16:56',231,2257.18);
/*!40000 ALTER TABLE `job_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_employees`
--

DROP TABLE IF EXISTS `project_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_employees` (
  `employee_id` int(6) NOT NULL,
  `project_id` int(6) NOT NULL,
  `hours` float(6,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_employees`
--

LOCK TABLES `project_employees` WRITE;
/*!40000 ALTER TABLE `project_employees` DISABLE KEYS */;
INSERT INTO `project_employees` VALUES (12,5,2.70),
(11,1,87.10),
(7,3,215.61),
(15,5,151.56),
(11,5,881.56),
(4,5,849.50),
(18,1,650.97),
(22,3,434.30),
(16,3,553.84),
(9,1,878.12),
(14,4,277.54),
(8,3,689.43),
(2,3,946.57),
(21,4,28.92),
(10,2,686.84),
(23,4,598.04),
(22,2,824.13),
(1,4,442.89),
(14,5,738.41),
(4,2,932.87),
(9,3,155.54),
(9,5,873.01),
(4,3,852.13),
(11,3,473.88),
(2,2,335.83),
(20,1,283.62),
(22,1,417.66),
(17,1,286.55),
(4,4,338.70),
(19,2,725.55),
(18,4,314.12),
(19,4,971.61),
(9,2,879.33),
(17,3,130.45),
(15,1,561.97),
(2,5,121.24),
(13,3,363.34),
(17,4,53.38),
(20,3,652.02),
(15,2,85.37),
(9,4,404.84);
/*!40000 ALTER TABLE `project_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `value` float(8,1) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'East Ave Shermans Diner',250000.0,'2008-03-01','2012-05-15'),
(2,'Big Money Bank',560000.0,'2012-02-15','2015-09-01'),
(3,'Central Valley Hospital',54000.0,'2013-12-01','2017-09-15'),
(4,'Washington Avenue Barber',10000.0,'2015-07-01','2020-08-01'),
(5,'Hamill, Berge and Adams Office',95500.0,'2018-01-01','2024-12-01');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01  3:36:47
