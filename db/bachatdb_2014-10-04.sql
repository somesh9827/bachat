# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.19)
# Database: bachatdb
# Generation Time: 2014-10-04 06:19:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(100) NOT NULL DEFAULT '',
  `address_line_2` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(30) NOT NULL DEFAULT '',
  `pin_code` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL DEFAULT '',
  `last_name` varchar(25) NOT NULL DEFAULT '',
  `dob` date DEFAULT NULL,
  `gender` char(1) NOT NULL DEFAULT '',
  `contact` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table offer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `offer`;

CREATE TABLE `offer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shop_owner_id` int(11) unsigned NOT NULL,
  `product_name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `shop_owner_id` (`shop_owner_id`),
  CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`shop_owner_id`) REFERENCES `shop_owner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `geo_location` varchar(50) DEFAULT NULL,
  `address_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `shop_category_id` int(11) unsigned NOT NULL,
  `opening_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closing_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `day_closed` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`),
  KEY `owner_id` (`owner_id`),
  KEY `shop_category_id` (`shop_category_id`),
  CONSTRAINT `shop_ibfk_3` FOREIGN KEY (`shop_category_id`) REFERENCES `shop_category` (`id`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `shop_owner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_category`;

CREATE TABLE `shop_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_owner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_owner`;

CREATE TABLE `shop_owner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `contact_number` int(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_owner_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_owner_login`;

CREATE TABLE `shop_owner_login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '',
  `shop_owner_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`email`),
  KEY `s` (`shop_owner_id`),
  CONSTRAINT `s` FOREIGN KEY (`shop_owner_id`) REFERENCES `shop_owner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
