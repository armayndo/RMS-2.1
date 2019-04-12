-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.37-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for spring_security_custom_user_demo
CREATE DATABASE IF NOT EXISTS `spring_security_custom_user_demo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `spring_security_custom_user_demo`;

-- Dumping structure for table spring_security_custom_user_demo.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table spring_security_custom_user_demo.role: ~3 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
REPLACE INTO `role` (`id`, `name`) VALUES
	(1, 'ROLE_EMPLOYEE'),
	(2, 'ROLE_MANAGER'),
	(3, 'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table spring_security_custom_user_demo.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(80) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table spring_security_custom_user_demo.user: ~6 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`) VALUES
	(1, 'emp', '$2a$10$dz.C3hCWEu0pLCPHnbkTv.WM/iyxnSTrn/MEmqXmdBMnKFm6Mkb5S', 'John', 'roma123', 'john@luv2code.com'),
	(2, 'man', '$2a$10$dz.C3hCWEu0pLCPHnbkTv.WM/iyxnSTrn/MEmqXmdBMnKFm6Mkb5S', 'Mary', 'Public', 'mary@luv2code.com'),
	(3, 'adm', '$2a$10$dz.C3hCWEu0pLCPHnbkTv.WM/iyxnSTrn/MEmqXmdBMnKFm6Mkb5S', 'Susan', 'Adams', 'susan@luv2code.com'),
	(4, 'roma', '$2a$10$dz.C3hCWEu0pLCPHnbkTv.WM/iyxnSTrn/MEmqXmdBMnKFm6Mkb5S', 'romadhona', 'armayndo', 'roma123@yahoo.com'),
	(12, 'roma1', '$2a$10$R7gD5lluFlX.JEL043aNruO5iBWtas9jeApYdK3bM3JL.xu9nLBAW', 'Roma', 'Armayndo', 'armayndo1@yahoo.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table spring_security_custom_user_demo.users_roles
CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_ROLE_idx` (`role_id`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_USER_05` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table spring_security_custom_user_demo.users_roles: ~10 rows (approximately)
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
REPLACE INTO `users_roles` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(2, 2),
	(3, 1),
	(3, 3),
	(4, 1),
	(4, 2),
	(4, 3),
	(12, 1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
