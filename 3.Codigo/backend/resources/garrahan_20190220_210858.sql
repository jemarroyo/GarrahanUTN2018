-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "garrahan" ------------------------------
CREATE DATABASE IF NOT EXISTS `garrahan` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `garrahan`;
-- ---------------------------------------------------------


-- CREATE TABLE "ConciliationComment" --------------------------
CREATE TABLE `ConciliationComment` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`date` DateTime NOT NULL,
	`comment` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`orderId` Int( 11 ) NULL,
	`operatorId` Int( 11 ) NULL,
	`creationDate` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- -------------------------------------------------------------


-- CREATE TABLE "ConfigElement" --------------------------------
CREATE TABLE `ConfigElement` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`value` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`description` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`isInteger` TinyInt( 1 ) NOT NULL,
	`min` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`max` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`lastUpdated` DateTime NULL,
	`version` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------


-- CREATE TABLE "Institution" ----------------------------------
CREATE TABLE `Institution` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`cuit` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`address` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`email` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`userCount` Int( 11 ) NULL,
	`orderCount` Int( 11 ) NULL,
	`type` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`creationDate` DateTime NOT NULL,
	`version` Int( 255 ) NOT NULL,
	`invalidCharCount` Int( 255 ) NOT NULL DEFAULT 0,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 13;
-- -------------------------------------------------------------


-- CREATE TABLE "InstitutionType" ------------------------------
CREATE TABLE `InstitutionType` ( 
	`name` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`description` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	PRIMARY KEY ( `name` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "Irradiation" ----------------------------------
CREATE TABLE `Irradiation` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`irradiationStart` DateTime NOT NULL,
	`irradiationEnd` DateTime NOT NULL,
	`irradiationTime` Int( 11 ) NOT NULL,
	`irradiationTag` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`comments` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`orderId` Int( 11 ) NULL,
	`irradiatorId` Int( 11 ) NULL,
	`version` Int( 255 ) NOT NULL,
	`unitCount` Int( 255 ) NOT NULL DEFAULT 0,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 8;
-- -------------------------------------------------------------


-- CREATE TABLE "OrderInfo" ------------------------------------
CREATE TABLE `OrderInfo` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`code` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`carrier` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`creationDate` DateTime NOT NULL,
	`completionDate` DateTime NULL,
	`acceptedOn` DateTime NULL,
	`lastModified` DateTime NULL,
	`unitCount` Int( 11 ) NOT NULL DEFAULT 0,
	`statusId` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`institutionId` Int( 11 ) NULL,
	`priorityId` Int( 11 ) NULL,
	`ownerId` Int( 11 ) NULL,
	`operatorId` Int( 11 ) NULL,
	`version` Int( 255 ) NOT NULL DEFAULT 0,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 107;
-- -------------------------------------------------------------


-- CREATE TABLE "OrderPriority" --------------------------------
CREATE TABLE `OrderPriority` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`description` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------


-- CREATE TABLE "OrderStatus" ----------------------------------
CREATE TABLE `OrderStatus` ( 
	`name` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`description` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	PRIMARY KEY ( `name` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "Unit" -----------------------------------------
CREATE TABLE `Unit` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`code` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`creationDate` DateTime NOT NULL,
	`irradiated` TinyInt( 1 ) NOT NULL DEFAULT 0,
	`orderId` Int( 11 ) NULL,
	`unitTypeId` Int( 11 ) NULL,
	`irradiationId` Int( 11 ) NULL,
	`irradiatorUserId` Int( 11 ) NULL,
	`version` Int( 255 ) NOT NULL DEFAULT 0,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 741;
-- -------------------------------------------------------------


-- CREATE TABLE "UnitType" -------------------------------------
CREATE TABLE `UnitType` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`code` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`name` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`creationDate` DateTime NOT NULL,
	`billingDivider` Int( 11 ) NOT NULL,
	`enabled` TinyInt( 1 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- -------------------------------------------------------------


-- CREATE TABLE "UnitTypeMapping" ------------------------------
CREATE TABLE `UnitTypeMapping` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`count` Int( 11 ) NULL,
	`orderId` Int( 11 ) NULL,
	`unitTypeId` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 542;
-- -------------------------------------------------------------


-- CREATE TABLE "XACL" -----------------------------------------
CREATE TABLE `XACL` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`model` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`property` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`accessType` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`permission` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`principalType` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`principalId` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`creationDate` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "XAccessToken" ---------------------------------
CREATE TABLE `XAccessToken` ( 
	`id` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`description` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`ttl` Int( 11 ) NULL,
	`scopes` Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`created` DateTime NULL,
	`userId` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "XRole" ----------------------------------------
CREATE TABLE `XRole` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`description` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`name` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`creationDate` DateTime NULL,
	`modified` DateTime NULL,
	`version` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------


-- CREATE TABLE "XRoleMapping" ---------------------------------
CREATE TABLE `XRoleMapping` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`description` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`principalType` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`principalId` Int( 11 ) NULL,
	`roleId` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- -------------------------------------------------------------


-- CREATE TABLE "XUser" ----------------------------------------
CREATE TABLE `XUser` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`firstname` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`lastname` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`avatarUrl` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '"/assets/avatar.svg"',
	`dni` Int( 11 ) NULL,
	`isInternal` TinyInt( 1 ) NOT NULL DEFAULT 0,
	`creationDate` DateTime NULL,
	`accountConfirmed` TinyInt( 1 ) NULL DEFAULT 0,
	`active` TinyInt( 1 ) NULL DEFAULT 0,
	`orderCount` Int( 11 ) NULL DEFAULT 0,
	`realm` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`username` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`password` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`email` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`emailVerified` TinyInt( 1 ) NULL DEFAULT 0,
	`verificationToken` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`institutionId` Int( 11 ) NULL,
	`version` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 18;
-- -------------------------------------------------------------


-- CREATE TABLE "Comment" --------------------------------------
CREATE TABLE `Comment` ( 
	`id` BigInt( 255 ) AUTO_INCREMENT NOT NULL,
	`text` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`creationDate` DateTime NOT NULL,
	`orderId` Int( 11 ) NOT NULL,
	`operatorId` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------


-- Dump data of "ConciliationComment" ----------------------
LOCK TABLES `ConciliationComment` WRITE;

INSERT INTO `ConciliationComment`(`id`,`date`,`comment`,`orderId`,`operatorId`,`creationDate`) VALUES ( '1', '2019-01-29 23:58:55', 'Test Rechazo', '1', '2', '2019-01-29 23:58:55' );
INSERT INTO `ConciliationComment`(`id`,`date`,`comment`,`orderId`,`operatorId`,`creationDate`) VALUES ( '2', '2019-02-18 21:50:53', 'test de irradiación order N° 12', '12', NULL, '2019-02-18 21:50:53' );
INSERT INTO `ConciliationComment`(`id`,`date`,`comment`,`orderId`,`operatorId`,`creationDate`) VALUES ( '3', '2019-02-18 22:19:08', 'test orden 5', '5', NULL, '2019-02-18 22:19:08' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "ConfigElement" ----------------------------
LOCK TABLES `ConfigElement` WRITE;

INSERT INTO `ConfigElement`(`id`,`name`,`value`,`description`,`isInteger`,`min`,`max`,`lastUpdated`,`version`) VALUES ( '1', 'minTimeOfIrradiationInMinutes', '0.25', 'Duración mínima obligatoria del proceso de irradiación en minutos.', '0', '0.1', '60', '2019-02-05 18:41:55', '2' );
INSERT INTO `ConfigElement`(`id`,`name`,`value`,`description`,`isInteger`,`min`,`max`,`lastUpdated`,`version`) VALUES ( '2', 'tagCodeInvalidCharCount', '1', 'Cantidad de caracteres a descartar en la lectura de una etiqueta', '1', '0', '5', '2019-01-21 19:39:48', '0' );
INSERT INTO `ConfigElement`(`id`,`name`,`value`,`description`,`isInteger`,`min`,`max`,`lastUpdated`,`version`) VALUES ( '3', 'unitCodeInvalidCharCount', '1', 'Cantidad de caracteres a descartar en la lectura de un código de unidad', '1', '0', '5', '2019-01-21 19:39:48', '0' );
INSERT INTO `ConfigElement`(`id`,`name`,`value`,`description`,`isInteger`,`min`,`max`,`lastUpdated`,`version`) VALUES ( '4', 'test', '0.25', 'test v2', '0', '0.1', '60', '2019-01-26 18:38:24', '1' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "Institution" ------------------------------
LOCK TABLES `Institution` WRITE;

INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '1', 'Fuhesa', '30031561042', '73 Crownhardt Crossing', 'agodson0@squidoo.com', '0', '0', 'PÚBLICA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '2', 'Eurnekian', '30339432806', '3799 Melrose Avenue', 'mhills9@uiuc.edu', '0', '0', 'UBA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '3', 'Eva Peron San Martin', '30152559815', '479 Amoth Junction', 'rmillichipa@google.es', '0', '0', 'PRIVADA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '4', 'Abete', '30770297093', '1147 Blue Bill Park Place', 'cabbys1@twitpic.com', '0', '0', 'PÚBLICA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '5', 'Alvarez', '30706000028', '693 Autumn Leaf Court', 'kdorsey2@typepad.com', '1', '49', 'PRIVADA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '6', 'Argerich', '30830705038', '61 4th Way', 'kloutheane3@com.com', '0', '0', 'PRIVADA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '7', 'Britanico', '30219873780', '906 Sachs Street', 'eminihan4@harvard.edu', '1', '51', 'PRIVADA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '8', 'Carrillo', '30157309739', '4292 Kedzie Junction', 'cseaborn5@squidoo.com', '0', '0', 'PRIVADA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '9', 'Clinicas', '30454949166', '9239 7th Court', 'bcritoph6@creativecommons.org', '0', '0', 'PRIVADA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '10', 'Durand', '30301374778', '36 Elgar Center', 'bcattenach7@usgs.gov', '0', '0', 'PÚBLICA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '11', 'Elizalde', '30836402451', '02756 Washington Alley', 'fbimrose8@nba.com', '0', '0', 'PÚBLICA', '2019-01-21 19:39:48', '0', '0' );
INSERT INTO `Institution`(`id`,`name`,`cuit`,`address`,`email`,`userCount`,`orderCount`,`type`,`creationDate`,`version`,`invalidCharCount`) VALUES ( '12', 'German', '30289788069', 'Arturo Jauretche', 'gmolina@gmail.com', NULL, NULL, 'PRIVADA', '2019-01-21 21:07:51', '0', '0' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "InstitutionType" --------------------------
LOCK TABLES `InstitutionType` WRITE;

INSERT INTO `InstitutionType`(`name`,`description`) VALUES ( 'Ins. Prov. Bs As', 'Instituciones en Provincia de Buenos Aires' );
INSERT INTO `InstitutionType`(`name`,`description`) VALUES ( 'PRIVADA', 'Instituciones privadas de salud' );
INSERT INTO `InstitutionType`(`name`,`description`) VALUES ( 'PÚBLICA', 'Instituciones públicas de salud' );
INSERT INTO `InstitutionType`(`name`,`description`) VALUES ( 'UBA', 'Instituciones de salud dependientes de la Universidad de Buenos Aires' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "Irradiation" ------------------------------
LOCK TABLES `Irradiation` WRITE;

INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '1', '2019-01-30 23:52:35', '2019-01-30 23:53:04', '1', 'test unidad', 'Todo ok', '3', '1', '0', '0' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '2', '2019-02-11 17:09:15', '2019-02-11 17:09:33', '1', 'test-order10', 'Todo ok', '10', '2', '0', '1' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '3', '2019-02-11 18:00:16', '2019-02-11 18:00:38', '1', 'test-order10', 'Todo ok, paso 2', '10', '2', '0', '1' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '4', '2019-02-11 20:13:36', '2019-02-11 20:13:59', '1', 'Test cierre orden', 'Todo ok', '10', '2', '0', '7' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '5', '2019-02-11 20:47:19', '2019-02-11 20:47:38', '1', 'cierre test estado', 'Todo ok', '105', '2', '0', '3' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '6', '2019-02-11 20:50:20', '2019-02-11 20:50:43', '1', 'Irradiación Completa orden 4', 'Test Irradación Completado.', '4', '2', '0', '7' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '7', '2019-02-20 12:44:06', '2019-02-20 12:44:29', '1', 'test-order-8', 'test-order-8', '8', '1', '0', '6' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '8', '2019-02-20 16:25:20', '2019-02-20 16:25:42', '1', 'test-order-7', NULL, '7', '1', '0', '3' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '9', '2019-02-20 16:26:49', '2019-02-20 16:27:11', '1', 'test-order-7-finish', NULL, '7', '1', '0', '3' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '10', '2019-02-20 19:00:29', '2019-02-20 19:00:51', '1', 'inicio-irradiacion', NULL, '14', '1', '0', '1' );
INSERT INTO `Irradiation`(`id`,`irradiationStart`,`irradiationEnd`,`irradiationTime`,`irradiationTag`,`comments`,`orderId`,`irradiatorId`,`version`,`unitCount`) VALUES ( '11', '2019-02-20 19:28:14', '2019-02-20 19:28:37', '1', 'final-irradiacion', NULL, '14', '1', '0', '6' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "OrderInfo" --------------------------------
LOCK TABLES `OrderInfo` WRITE;

INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '1', '0YxVkyOi', 'Terry Austin', '2017-04-04 05:59:22', NULL, NULL, '2019-01-21 19:39:49', '9', 'RECHAZADA', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '2', 'jq2hGHWy', 'Lula Chavez', '2017-12-26 06:22:36', NULL, '2019-02-11 15:27:59', '2019-01-21 19:39:49', '8', 'EN_PROCESO', '5', '2', '3', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '3', 'xucHQNny', 'Kevin Luna', '2017-07-02 01:01:51', NULL, '2019-01-30 00:38:42', '2019-01-21 19:39:49', '5', 'EN_PROCESO', '7', '2', '4', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '4', 'cFyLf6xK', 'Carrie Riley', '2017-08-19 12:29:50', NULL, '2019-02-11 20:49:32', '2019-01-21 19:39:49', '7', 'IRRADIADA', '7', '1', '4', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '5', 'KMEEzeYB', 'Carolyn Valdez', '2017-10-10 06:20:26', NULL, '2019-02-18 22:18:05', '2019-01-21 19:39:49', '9', 'EN_PROCESO', '5', '1', '3', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '6', 'QW7f8ehJ', 'Lucille Pope', '2017-10-26 22:32:15', NULL, '2019-02-18 23:21:05', '2019-01-21 19:39:49', '9', 'EN_PROCESO', '7', '2', '4', '1', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '7', 'b8CF4P3K', 'Eric Carr', '2017-06-05 04:39:49', NULL, '2019-02-20 16:24:36', '2019-01-21 19:39:49', '6', 'IRRADIADA', '7', '2', '4', '1', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '8', 'quaDqs2x', 'Alma Baker', '2017-09-29 13:33:22', NULL, '2019-02-20 12:10:36', '2019-01-21 19:39:49', '6', 'IRRADIADA', '7', '2', '4', '1', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '9', 'oCvUduFF', 'Frank Wolfe', '2017-05-01 07:01:48', NULL, '2019-02-18 15:01:33', '2019-01-21 19:39:49', '7', 'EN_PROCESO', '7', '1', '4', '1', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '10', 'mo5clfkw', 'Olivia Jefferson', '2017-04-18 00:52:49', NULL, '2019-02-11 15:42:43', '2019-01-21 19:39:49', '7', 'IRRADIADA', '5', '1', '3', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '11', 'qL4WCy9A', 'Glen Reeves', '2017-02-01 19:41:31', NULL, '2019-01-29 21:33:26', '2019-01-21 19:39:49', '7', 'EN_PROCESO', '5', '1', '3', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '12', 'yHCBKfDu', 'Bertie Warner', '2017-11-29 15:37:58', NULL, '2019-02-18 21:17:57', '2019-01-21 19:39:49', '7', 'EN_PROCESO', '5', '2', '3', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '13', 'XpvnE6HM', 'Aaron Walters', '2017-11-29 20:37:30', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '14', 'UzjOq3Ie', 'Lula Pierce', '2017-04-26 17:01:12', NULL, '2019-02-20 17:24:33', '2019-01-21 19:39:49', '7', 'IRRADIADA', '7', '2', '4', '1', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '15', 'mP4PU4Sh', 'Marion Barker', '2017-02-16 14:11:23', NULL, '2019-02-18 15:42:50', '2019-01-21 19:39:49', '9', 'EN_PROCESO', '7', '2', '4', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '16', 'lzuvIPKo', 'Aaron Dawson', '2017-01-05 14:35:06', NULL, '2019-02-18 15:00:25', '2019-01-21 19:39:49', '10', 'EN_PROCESO', '5', '1', '3', '1', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '17', 'I8zHLTfB', 'Jason Collins', '2017-03-14 14:18:04', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '18', 'hlcCRLgX', 'Harvey Chambers', '2017-08-11 08:31:19', NULL, '2019-02-18 15:10:03', '2019-01-21 19:39:49', '6', 'EN_PROCESO', '7', '1', '4', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '19', '4DQmmnJJ', 'Jean Baker', '2017-02-09 16:10:55', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '20', 'RcERHITD', 'Erik Underwood', '2017-12-06 15:18:58', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '21', 'yMxjAx4u', 'Virginia Nguyen', '2017-05-22 16:24:03', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '22', 'QVzGWxxs', 'Todd Byrd', '2017-06-25 06:08:57', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '23', '80goqf5t', 'Roger White', '2017-01-17 21:54:03', NULL, NULL, '2019-01-21 19:39:49', '5', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '24', 'El0bv8hB', 'Vincent Bailey', '2017-04-12 16:53:54', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '25', 'o0qHYZ4S', 'Mike Bishop', '2017-02-13 06:00:13', NULL, NULL, '2019-01-21 19:39:49', '7', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '26', 'BBsi5Pmz', 'Nettie McLaughlin', '2017-02-27 07:39:20', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '27', 'BjZoguFL', 'Nicholas Singleton', '2017-11-27 08:52:53', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '28', 'Xy0Mp8hy', 'Sean Lawrence', '2017-01-24 05:23:27', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '29', 'VVAObT0S', 'Curtis Hicks', '2017-09-30 14:32:12', NULL, NULL, '2019-01-21 19:39:49', '7', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '30', 'aZtFAg2i', 'Alfred Gross', '2017-11-22 17:13:27', NULL, NULL, '2019-01-21 19:39:49', '5', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '31', 'geErn3ua', 'Elmer Little', '2017-09-25 13:31:21', NULL, NULL, '2019-01-21 19:39:49', '4', 'PENDIENTE', '5', '2', '3', NULL, '1' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '32', 'vvqHhMmt', 'Duane Poole', '2017-06-02 21:11:20', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '33', 'yIpokuZy', 'Delia Curry', '2017-12-09 09:29:06', NULL, NULL, '2019-01-21 19:39:49', '10', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '34', 'VkmAlBQk', 'Raymond Obrien', '2017-04-15 21:33:50', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '35', 'ozgan0Zb', 'Richard Buchanan', '2017-09-16 23:12:08', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '36', 'Im7FqEyE', 'Phoebe Greer', '2017-05-12 23:53:03', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '37', 'yfSfUfA0', 'Billy Vasquez', '2017-01-09 12:46:36', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '38', 'beD0geJ7', 'Ella Lowe', '2017-08-21 14:07:07', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '39', 'LC3FpaSJ', 'Nicholas Stokes', '2017-04-07 07:51:11', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '40', 'DlcK4RdE', 'Lou Parsons', '2017-12-10 21:17:33', NULL, NULL, '2019-01-21 19:39:49', '7', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '41', 's4NWrhwW', 'Lucille Boyd', '2017-08-19 12:42:15', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '42', 'hCX4vSEF', 'Juan Blake', '2017-02-04 19:45:15', NULL, NULL, '2019-01-21 19:39:49', '5', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '43', 'VkIXR10h', 'Mike Jacobs', '2017-12-23 19:46:21', NULL, NULL, '2019-01-21 19:39:49', '5', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '44', 'Gg7DFJSM', 'Andrew Gilbert', '2017-08-13 04:03:23', NULL, NULL, '2019-01-21 19:39:49', '5', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '45', 'ydudaR1A', 'Jim Daniel', '2017-01-15 17:06:17', NULL, NULL, '2019-01-21 19:39:49', '10', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '46', 'Z9YrtJVZ', 'Trevor Moore', '2017-05-25 03:44:10', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '47', 'dPzCjvyc', 'Eugenia Byrd', '2017-10-25 11:02:36', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '48', 'Bss1ixht', 'Lois Armstrong', '2017-03-15 06:27:22', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '49', 'j2mikW3w', 'Edward Adams', '2017-07-17 10:58:47', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '50', 'LVS3yJVO', 'Bertie Jacobs', '2017-05-16 10:40:24', NULL, NULL, '2019-01-21 19:39:49', '7', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '51', 'Z13SQGDi', 'Rodney Williams', '2017-08-11 15:27:44', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '52', 'l2H9wC2l', 'Connor Dunn', '2017-08-15 13:43:34', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '53', 'BsvrfSUV', 'Beatrice Obrien', '2017-01-10 03:17:54', NULL, NULL, '2019-01-21 19:39:49', '10', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '54', 'z3QVdP24', 'Mason Mason', '2017-06-10 00:32:23', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '55', 'gegFNvxe', 'Carlos Lamb', '2017-02-15 05:18:24', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '56', 'flOYeXLs', 'Milton Ballard', '2017-08-01 06:40:54', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '57', 'byEqxtSB', 'Devin Craig', '2017-12-31 11:16:43', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '58', 'zTz6fxrE', 'Blanche McKenzie', '2017-05-29 22:24:27', NULL, NULL, '2019-01-21 19:39:49', '10', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '59', 'SE9bgwX2', 'Ruby Alexander', '2017-04-01 11:24:07', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '60', 'pxqRJT0l', 'Leon Colon', '2017-08-16 02:42:28', NULL, NULL, '2019-01-21 19:39:49', '5', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '61', '8lmDeKbP', 'Arthur Jimenez', '2017-04-03 23:21:08', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '62', 'GzjZ9wqH', 'Mable Farmer', '2017-01-15 12:28:50', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '63', 'viLTlXDE', 'Patrick Flowers', '2017-07-30 05:32:25', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '64', 'sobapKIE', 'Jeffrey Graham', '2017-05-26 08:26:22', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '65', 'zydGys7N', 'Leila Benson', '2017-11-05 09:34:52', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '66', 'f87LlzNf', 'Aiden Adkins', '2017-01-03 08:19:26', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '67', 'XqzTxy81', 'Cameron Joseph', '2017-08-31 21:34:36', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '68', '4mrjS2pP', 'Ronald Herrera', '2017-08-19 20:48:01', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '69', 'eTBgDyJT', 'Lura Vaughn', '2017-03-12 04:04:05', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '70', 'e7FiELru', 'Patrick Perkins', '2017-05-14 06:07:21', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '71', 'EZUESkVI', 'Lucile Hughes', '2017-06-29 01:26:26', NULL, NULL, '2019-01-21 19:39:49', '10', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '72', 'dM1gliJL', 'Harvey Munoz', '2017-09-28 14:07:38', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '73', '8iI01sMk', 'Julian Scott', '2017-04-13 23:51:18', NULL, NULL, '2019-01-21 19:39:49', '5', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '74', 'XgOSpPhJ', 'Julia Ray', '2017-11-23 08:32:57', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '75', 'X3Ccg3cI', 'Seth Boone', '2017-10-01 11:24:19', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '76', 'BzTYfob2', 'Lucille Collier', '2017-07-01 06:31:54', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '77', '8ZNYc4Q7', 'Ivan Flores', '2017-04-11 14:30:57', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '78', 'yb9oah20', 'Elnora Graham', '2017-07-19 16:43:21', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '79', 'sMnwxmw6', 'Ethan Brooks', '2017-02-15 01:17:40', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '80', 's9yQdsyl', 'Lucile McDonald', '2017-08-16 03:08:37', NULL, NULL, '2019-01-21 19:39:49', '10', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '81', 'syOjWGIN', 'Keith Moss', '2017-01-28 02:16:18', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '82', 'mwOBMqOL', 'Luis Bennett', '2017-01-13 00:39:44', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '83', 'UE1qJ8DT', 'Earl Flores', '2017-02-16 07:32:10', NULL, NULL, '2019-01-21 19:39:49', '7', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '84', '4U8hvwNj', 'Cordelia Walker', '2017-10-04 18:34:37', NULL, NULL, '2019-01-21 19:39:49', '7', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '85', 'wPfV9D5k', 'Verna Holmes', '2017-10-20 20:45:36', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '86', 'lqwFQ9ak', 'Pauline Barnett', '2017-11-30 01:28:56', NULL, NULL, '2019-01-21 19:39:49', '10', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '87', 'yaq6nvUl', 'Madge Peterson', '2017-11-14 20:09:35', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '88', 'IeQS9tV6', 'Jonathan Riley', '2017-09-13 18:56:19', NULL, NULL, '2019-01-21 19:39:49', '8', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '89', 'k0HAWssg', 'Mayme Lee', '2017-09-05 08:41:43', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '90', '7w5Emt5Y', 'Johnny Munoz', '2017-06-14 07:19:31', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '91', 'vEkp4VRY', 'Francis Evans', '2017-07-26 09:23:34', NULL, NULL, '2019-01-21 19:39:49', '7', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '92', 'iRmvRbus', 'Kyle Reynolds', '2017-11-08 07:19:45', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '93', 'kwO3wl1O', 'Gavin West', '2017-05-01 14:13:05', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '94', 'kwrASKJd', 'Mina Harmon', '2017-03-23 21:51:51', NULL, NULL, '2019-01-21 19:39:49', '7', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '95', 'Kr1wB8ID', 'Hunter Guzman', '2017-04-04 23:27:20', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '96', 'wRxvKBkq', 'Jerome Watkins', '2017-09-11 01:47:30', NULL, NULL, '2019-01-21 19:39:49', '6', 'PENDIENTE', '7', '2', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '97', '4brNZK0I', 'Ricky Hawkins', '2017-05-14 22:45:17', NULL, NULL, '2019-01-21 19:39:49', '5', 'PENDIENTE', '5', '1', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '98', '6jwYfH3Y', 'Danny Vaughn', '2017-02-06 12:13:49', NULL, NULL, '2019-01-21 19:39:49', '9', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '99', 'TCpe6UZw', 'Bessie Hernandez', '2017-09-02 02:54:41', NULL, NULL, '2019-01-21 19:39:49', '5', 'PENDIENTE', '7', '1', '4', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '100', 'rQSEr86j', 'Ruth Joseph', '2017-12-07 09:16:19', NULL, NULL, '2019-01-21 19:39:49', '10', 'PENDIENTE', '5', '2', '3', NULL, '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '105', 'q1w2e3r4t5y6', 'CMA', '2019-01-30 21:55:17', NULL, '2019-02-11 15:24:58', '2019-01-30 21:55:17', '3', 'IRRADIADA', '5', '2', '3', '2', '0' );
INSERT INTO `OrderInfo`(`id`,`code`,`carrier`,`creationDate`,`completionDate`,`acceptedOn`,`lastModified`,`unitCount`,`statusId`,`institutionId`,`priorityId`,`ownerId`,`operatorId`,`version`) VALUES ( '106', 'qawsedrftg', 'YANMING', '2019-01-30 22:10:18', NULL, '2019-02-11 14:26:56', '2019-01-30 22:10:18', '2', 'EN_PROCESO', '5', '2', '3', '2', '0' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "OrderPriority" ----------------------------
LOCK TABLES `OrderPriority` WRITE;

INSERT INTO `OrderPriority`(`id`,`name`,`description`) VALUES ( '1', 'URGENTE', 'Órdenes urgentes' );
INSERT INTO `OrderPriority`(`id`,`name`,`description`) VALUES ( '2', 'NORMAL', 'Prioridad simple' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "OrderStatus" ------------------------------
LOCK TABLES `OrderStatus` WRITE;

INSERT INTO `OrderStatus`(`name`,`description`) VALUES ( 'CANCELADA', 'Órdenes canceladas por los clientes. No son tenidas en cuenta para futuras revisiones ni irradiaciones.' );
INSERT INTO `OrderStatus`(`name`,`description`) VALUES ( 'EN_PROCESO', 'Órdenes que fueron aceptadas y pueden ser irradiadas o bien están siendo irradiadas.' );
INSERT INTO `OrderStatus`(`name`,`description`) VALUES ( 'IRRADIADA', 'Órdenes que ya fueron irradiadas en forma completa.' );
INSERT INTO `OrderStatus`(`name`,`description`) VALUES ( 'PENDIENTE', 'Órdenes recién ingresadas, ó recientemente revisadas y modificadas por el cliente. Deben ser aceptadas o rechazadas.' );
INSERT INTO `OrderStatus`(`name`,`description`) VALUES ( 'POSTERGADA', 'Test del estado de la orden' );
INSERT INTO `OrderStatus`(`name`,`description`) VALUES ( 'RECHAZADA', 'Órdenes que fueron rechazadas por algún operador y deben ser revisadas/conciliadas por el cliente.' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "Unit" -------------------------------------
LOCK TABLES `Unit` WRITE;

INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '1', '721a0352-409d-55a7-af7f-c9eb4732a517', '2017-04-04 05:59:22', '1', '1', '1', '3', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '2', '6beac6ab-4442-5756-b5d4-6dd7b9ba166f', '2017-04-04 05:59:22', '0', '1', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '3', '11b69f9a-3a86-548d-ae6b-6f020389dc8b', '2017-04-04 05:59:22', '0', '1', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '4', '10ac385a-8635-50a9-8216-6f7611cf10d1', '2017-04-04 05:59:22', '0', '1', '1', NULL, NULL, '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '5', '6d9ddcc8-f898-51e0-8cc3-d070c0d84c81', '2017-04-04 05:59:22', '1', '1', '3', '2', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '6', 'a4c376fc-a427-5710-84fc-b04f8c9ba3bb', '2017-04-04 05:59:22', '0', '1', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '7', 'bd9b34e6-0c59-53a4-96e3-5c8a5fd688db', '2017-04-04 05:59:22', '0', '1', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '8', 'dc0af5b9-2180-5c31-884b-82db5482fb5f', '2017-04-04 05:59:22', '0', '1', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '9', '55035767-140b-59fa-a292-d950143ee72f', '2017-04-04 05:59:22', '0', '1', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '10', 'f650bde1-e176-5319-ab72-c6ed44c7e3a0', '2017-12-26 06:22:36', '0', '2', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '11', 'ff20dcd8-e599-5342-9283-a5eca014480b', '2017-12-26 06:22:36', '0', '2', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '12', '2db77be7-0730-5f22-85a8-b47805ca1f2e', '2017-12-26 06:22:36', '0', '2', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '13', 'cf88b087-2ee2-5065-9934-d9603349134d', '2017-12-26 06:22:36', '0', '2', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '14', 'ece6d024-ca95-553c-8f08-0b0d698d88dc', '2017-12-26 06:22:36', '0', '2', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '15', 'e1b9e58a-62f1-5f63-aaac-232c99d323c7', '2017-12-26 06:22:36', '0', '2', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '16', 'aaa506e6-1c0b-5b70-b895-6b259c25cc7e', '2017-12-26 06:22:36', '0', '2', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '17', 'f66e64c7-e59e-5de8-b697-ca9082faa538', '2017-12-26 06:22:36', '0', '2', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '18', '9740a120-e07f-50a3-816d-97fe43123d66', '2017-07-02 01:01:51', '0', '3', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '19', '46e9471c-9184-500c-8bff-6547b7460d09', '2017-07-02 01:01:51', '0', '3', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '20', '3b24980c-f8cd-5e27-a070-29a1f0a7eb50', '2017-07-02 01:01:51', '0', '3', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '21', '4350db58-ffa4-5b6f-aea7-d8545664f9e3', '2017-07-02 01:01:51', '0', '3', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '22', '349d57c6-7d46-5512-a611-77ddf2644c51', '2017-07-02 01:01:51', '0', '3', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '23', 'c451784a-301a-5e9f-90d4-ad96ba05040b', '2017-08-19 12:29:50', '1', '4', '2', '6', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '24', 'a4ee97af-5598-5280-b61f-f43288da8145', '2017-08-19 12:29:50', '1', '4', '4', '6', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '25', 'e09e29b9-5c3e-59e0-b72b-13d2b5d3fbc4', '2017-08-19 12:29:50', '1', '4', '4', '6', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '26', '3537cbb7-535f-5222-92ee-d3d8dc993651', '2017-08-19 12:29:50', '1', '4', '3', '6', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '27', 'c5adc518-4ff5-5caa-862e-dc8ddf2a6e4e', '2017-08-19 12:29:50', '1', '4', '2', '6', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '28', 'e396f1ac-859b-5759-90e8-60672d91c70e', '2017-08-19 12:29:50', '1', '4', '3', '6', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '29', 'aae5c447-9085-5526-ba46-953efe4c220f', '2017-08-19 12:29:50', '1', '4', '3', '6', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '30', '99baeca2-02d8-5ff7-a17d-ea4cd7844723', '2017-10-26 22:32:15', '0', '6', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '31', '8948b51c-5490-506e-80e5-fcd1d4567aac', '2017-10-26 22:32:15', '0', '6', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '32', '5163d7b5-0635-5d76-9537-4ac952443162', '2017-10-26 22:32:15', '0', '6', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '33', 'b58703b6-b191-5f9d-b128-aa239a6d5c94', '2017-10-26 22:32:15', '0', '6', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '34', '33d0343a-7b85-574a-96dd-41f0e23fa9cd', '2017-10-26 22:32:15', '0', '6', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '35', '7328a2fa-dd85-5c6b-bc3e-d9405dca293c', '2017-10-26 22:32:15', '0', '6', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '36', 'a8b3c028-676c-5310-bd49-a1d8d870e1f8', '2017-10-26 22:32:15', '0', '6', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '37', '13de2dfa-0606-58b6-94d9-833533ff660e', '2017-10-26 22:32:15', '0', '6', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '38', 'bc239226-c4b5-549c-acbd-c17f0ca7718d', '2017-10-26 22:32:15', '0', '6', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '39', '2f420f15-a08f-5828-b78a-be737d07c39f', '2017-09-29 13:33:22', '1', '8', '1', '7', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '40', '8c8130e1-51a8-57a8-afcc-ddc1377341ed', '2017-09-29 13:33:22', '1', '8', '5', '7', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '41', 'fd68dd71-e2f1-507d-bd27-5cf589766301', '2017-09-29 13:33:22', '1', '8', '2', '7', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '42', '9b9c85b0-63f3-5061-aaed-cfb546792e45', '2017-09-29 13:33:22', '1', '8', '3', '7', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '43', '1de6a428-1c3d-5d27-9741-2ad0b6e8c48c', '2017-09-29 13:33:22', '1', '8', '3', '7', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '44', 'e6da53ed-efbd-5015-ba41-172cc9eb0f53', '2017-09-29 13:33:22', '1', '8', '1', '7', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '45', 'ef45d8a2-77d2-5546-a9cb-6e92f2cd92ff', '2017-05-01 07:01:48', '0', '9', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '46', '96e2fefa-e1cb-5443-951b-9d826d184af2', '2017-05-01 07:01:48', '0', '9', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '47', 'cce7acc3-a3ad-5e5f-a14b-69f4bca90666', '2017-05-01 07:01:48', '0', '9', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '48', 'ad3fb992-1726-5f4d-84e1-3d24297551e8', '2017-05-01 07:01:48', '0', '9', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '49', 'ff7e8728-f566-5350-9d27-8c8fd18722a5', '2017-05-01 07:01:48', '0', '9', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '50', '2026ec0c-543e-58dd-b090-6ae21d0ba218', '2017-05-01 07:01:48', '0', '9', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '51', '39193eab-5ff5-562e-8849-9e9ad11fd6c2', '2017-05-01 07:01:48', '0', '9', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '52', '74d1fa3f-7e90-5aee-b6ed-d357252cb0b1', '2017-04-18 00:52:49', '1', '10', '2', '4', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '53', 'f3183bc1-6d63-5eca-945c-b93a4b7519e3', '2017-04-18 00:52:49', '1', '10', '2', '4', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '54', 'bdc2fab4-a350-5384-a5dd-983fd271ae92', '2017-04-18 00:52:49', '1', '10', '3', '4', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '55', '3bf13f35-f90b-520b-a737-b266c27b42f8', '2017-04-18 00:52:49', '1', '10', '4', '4', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '56', '71ff5ac1-6450-5f09-b150-03f9d16effd9', '2017-04-18 00:52:49', '1', '10', '3', '4', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '57', 'c42a3801-ce5f-5622-af7d-0c44c7683d20', '2017-04-18 00:52:49', '1', '10', '2', '4', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '58', '784ef937-0575-567c-a3c6-a2a60688c537', '2017-04-18 00:52:49', '1', '10', '2', '4', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '59', '10b7965c-ec97-547d-a5f4-23e908108e15', '2017-06-05 04:39:49', '1', '7', '5', '8', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '60', '9e16a001-3169-5372-8198-55842116fab1', '2017-06-05 04:39:49', '1', '7', '5', '9', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '61', '0e486c0e-efa7-5427-ab81-94bc03b035ae', '2017-06-05 04:39:49', '1', '7', '4', '8', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '62', '88142e88-bbdd-579f-a336-b1dd9ee16631', '2017-06-05 04:39:49', '1', '7', '5', '9', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '63', 'eae445b8-6464-5209-a046-51f24cae09dd', '2017-06-05 04:39:49', '1', '7', '2', '9', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '64', '17683bd8-e27c-5df3-b426-ec6da575a045', '2017-06-05 04:39:49', '1', '7', '5', '8', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '65', 'fbbbf88f-6c8b-562f-ab3e-463d26a8730e', '2017-10-10 06:20:26', '0', '5', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '66', '63e07ca9-dab1-5761-8107-c6e5e634558f', '2017-10-10 06:20:26', '0', '5', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '67', 'd1adc282-ee26-5afd-8eaa-fbb9fc751193', '2017-10-10 06:20:26', '0', '5', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '68', '17ef4b9b-1208-5f29-981c-904933169e93', '2017-10-10 06:20:26', '0', '5', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '69', 'd6b77076-cfa2-5880-9613-ecc20b2331cd', '2017-10-10 06:20:26', '0', '5', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '70', 'ea8bf57a-7ced-5f82-9d37-24504b5e054e', '2017-10-10 06:20:26', '0', '5', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '71', '0016db2e-e764-5ac0-ae57-5a76ba5ba567', '2017-10-10 06:20:26', '0', '5', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '72', 'b3d41a89-bd37-51d3-bfe4-ee4feb124587', '2017-10-10 06:20:26', '0', '5', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '73', 'a963912a-7df9-547b-b978-3de54001e6ec', '2017-10-10 06:20:26', '0', '5', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '74', 'db67a508-accf-5d3d-96ed-321336ebc6db', '2017-02-01 19:41:31', '0', '11', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '75', '2557fdaf-8817-51fa-927f-d7b2ebd98d51', '2017-02-01 19:41:31', '0', '11', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '76', '1df51282-83ae-5a19-b1c3-44babc931e57', '2017-02-01 19:41:31', '0', '11', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '77', '0768ab87-b47b-5847-9578-e5f24d2631f1', '2017-02-01 19:41:31', '0', '11', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '78', '0eb01a0c-ff3a-5fc4-80e1-a30f9fc1069a', '2017-02-01 19:41:31', '0', '11', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '79', 'a7bf27b6-d48b-5d70-b756-c4ac7928dac6', '2017-02-01 19:41:31', '0', '11', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '80', '3e36e637-1203-54c7-ba8a-e629c5bdbd19', '2017-02-01 19:41:31', '0', '11', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '81', '22372a63-ac49-5309-8d9d-ffade590ba85', '2017-11-29 15:37:58', '0', '12', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '82', 'fcf4b0ca-0025-5a46-adb9-93d0c5e194f4', '2017-11-29 15:37:58', '0', '12', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '83', '2a7cd282-0eb6-57ac-9578-8f313517d19c', '2017-11-29 15:37:58', '0', '12', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '84', 'f7ac81bf-c205-5c96-a23d-bbfea8923902', '2017-11-29 15:37:58', '0', '12', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '85', 'ac3fefc1-1a3f-5bae-aef9-d41c4710a7e1', '2017-11-29 15:37:58', '0', '12', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '86', 'e666b704-5538-51a2-bf48-95a49649bcf0', '2017-11-29 15:37:58', '0', '12', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '87', '16b88140-d3ab-5cc0-b147-ae3d7d2bee37', '2017-11-29 15:37:58', '0', '12', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '88', '562d09e4-8524-5589-8335-ecb507be5005', '2017-05-22 16:24:03', '0', '21', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '89', '69d4509c-32ac-5900-b9bc-f385aa6facd2', '2017-05-22 16:24:03', '0', '21', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '90', 'a65d4dea-b810-581d-aa67-964d46df2fa8', '2017-05-22 16:24:03', '0', '21', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '91', '95e763cd-a4c4-5304-8775-cb3b4a25e857', '2017-05-22 16:24:03', '0', '21', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '92', '1315ec41-2cab-58f3-8f54-3ca58ff76e0b', '2017-05-22 16:24:03', '0', '21', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '93', 'a779dd07-bad1-5bbd-800e-2915ce585ea7', '2017-05-22 16:24:03', '0', '21', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '94', 'b377d298-f63e-56f2-b019-811a32294fe6', '2017-11-29 20:37:30', '0', '13', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '95', '84bae7cf-deb5-5b9f-83c2-55881a4a6650', '2017-11-29 20:37:30', '0', '13', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '96', '632ab60d-0fd7-5dca-8e3d-dd64ee9f3a45', '2017-11-29 20:37:30', '0', '13', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '97', 'cb41dc40-952a-563a-be89-718c434117da', '2017-11-29 20:37:30', '0', '13', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '98', 'a1af5115-303a-5a1a-8927-8104ae62b49e', '2017-11-29 20:37:30', '0', '13', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '99', '52e58f3b-a86e-538a-bb38-6d6937be5e56', '2017-11-29 20:37:30', '0', '13', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '100', '7c174b66-1a6e-52be-b83e-c06d0ed9e54e', '2017-11-29 20:37:30', '0', '13', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '101', '51493762-45ce-54e4-a325-2c8621cd51e0', '2017-11-29 20:37:30', '0', '13', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '102', 'd70c91cb-21c4-5bee-a9d5-8a6871e791fb', '2017-02-16 14:11:23', '0', '15', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '103', '0cd74fad-a818-57d4-bd2e-35c3cf0ee8f7', '2017-02-16 14:11:23', '0', '15', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '104', 'c6dcd88e-2eab-592c-b668-a0fd765c8179', '2017-02-16 14:11:23', '0', '15', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '105', 'f3b92b7d-5dc7-52cd-9bfa-ab022d2def48', '2017-02-16 14:11:23', '0', '15', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '106', '63990d0d-86cf-5934-a551-2927b522c531', '2017-02-16 14:11:23', '0', '15', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '107', '26cd5035-f82f-5f1d-9312-b979ee44b415', '2017-02-16 14:11:23', '0', '15', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '108', 'afd19cb6-4c60-51be-82bf-e87de62c7761', '2017-02-16 14:11:23', '0', '15', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '109', 'b877d0b9-2869-5606-bf59-7a988897e7e4', '2017-02-16 14:11:23', '0', '15', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '110', '9285f4d3-6bcd-53f3-a121-e0f63e7a65e1', '2017-02-16 14:11:23', '0', '15', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '111', 'd7478f88-fece-5035-ad9e-293f7a4400d4', '2017-04-26 17:01:12', '1', '14', '1', '11', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '112', 'e5b1efcd-7df0-5937-80d4-893a2fd9e4a6', '2017-04-26 17:01:12', '1', '14', '5', '11', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '113', '6a7710b9-ff4e-5993-b298-32981ee0158f', '2017-04-26 17:01:12', '1', '14', '3', '11', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '114', '3c87de72-a68d-56e5-81a1-c169c45e3b45', '2017-04-26 17:01:12', '1', '14', '2', '11', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '115', '33656bb8-3954-51db-b3ca-2a8a6125579a', '2017-04-26 17:01:12', '1', '14', '4', '11', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '116', 'c2953b22-ffaf-501c-9e08-197ff6fb97ff', '2017-04-26 17:01:12', '1', '14', '4', '11', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '117', 'f189cde5-e0dd-5eb0-8bbb-f6e6625e35ac', '2017-04-26 17:01:12', '1', '14', '5', '10', '1', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '118', '6604aec8-a75f-5d2f-b635-486adc5ab255', '2017-01-05 14:35:06', '0', '16', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '119', 'eb0cb349-de00-5744-b48b-70abb6f9701e', '2017-01-05 14:35:06', '0', '16', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '120', 'ae661dc5-8fae-574e-bef7-d473c4503c59', '2017-01-05 14:35:06', '0', '16', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '121', 'f24ca515-6f74-5c89-b71a-4722fde4628c', '2017-01-05 14:35:06', '0', '16', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '122', '66fa68e4-2ae0-5b31-800e-4d952894675f', '2017-01-05 14:35:06', '0', '16', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '123', '25e57e49-e1a6-55fd-a1c6-538e34ab5bc5', '2017-01-05 14:35:06', '0', '16', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '124', '9cb20578-9e8a-5665-926b-d62e9f1bfdff', '2017-01-05 14:35:06', '0', '16', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '125', '4fa4967d-02fa-529f-b20f-377874fe67ba', '2017-01-05 14:35:06', '0', '16', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '126', 'd4d3cff4-acef-5e55-9919-e9dbedc74081', '2017-01-05 14:35:06', '0', '16', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '127', '7077c263-cef8-5a19-aabd-44a365739d68', '2017-01-05 14:35:06', '0', '16', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '128', '56a62e7d-1904-51d5-8748-1d5cb0ff7b20', '2017-03-14 14:18:04', '0', '17', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '129', '2ed20e4d-dd0a-591e-b3b4-89f6d478a9f7', '2017-03-14 14:18:04', '0', '17', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '130', '9014c877-5ee7-5ddc-96f0-ebf62e3b25eb', '2017-03-14 14:18:04', '0', '17', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '131', 'ef445bb7-33b9-5b4a-beef-3475cfabc8f8', '2017-03-14 14:18:04', '0', '17', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '132', 'd84a03d4-0637-5078-83bd-4f4f0f95d068', '2017-03-14 14:18:04', '0', '17', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '133', 'd9bf3558-6ea0-52ca-b533-73908c238fea', '2017-03-14 14:18:04', '0', '17', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '134', '99f04124-542e-5155-a3bc-dd4ef129d48a', '2017-03-14 14:18:04', '0', '17', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '135', 'bca79b0b-cc63-585f-9f87-55f05cd9b30c', '2017-03-14 14:18:04', '0', '17', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '136', '154caf97-6365-5dd4-98f7-c875bfef94b9', '2017-08-11 08:31:19', '0', '18', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '137', '18cca760-54a6-523e-9bd8-cf6fde53935f', '2017-08-11 08:31:19', '0', '18', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '138', 'b172929f-fc17-5c58-a9a1-ec3b6f384e74', '2017-08-11 08:31:19', '0', '18', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '139', '4055f32b-4853-5782-b621-436cd4991322', '2017-08-11 08:31:19', '0', '18', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '140', '1427c12b-fbc9-5fe1-885b-e4ed9f129108', '2017-08-11 08:31:19', '0', '18', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '141', 'f82af4b1-e396-53de-b26a-38f47add9616', '2017-08-11 08:31:19', '0', '18', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '142', '6b248b9e-d044-5042-8e3f-702fceed27e6', '2017-02-09 16:10:55', '0', '19', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '143', '5e7f3518-6211-5462-b118-9db4f9e8b778', '2017-02-09 16:10:55', '0', '19', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '144', '97027e6f-76ae-5099-ba5d-d118cfe27f79', '2017-02-09 16:10:55', '0', '19', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '145', '9093785d-9a72-5a17-9da6-e220203d3fe0', '2017-02-09 16:10:55', '0', '19', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '146', '2572eed9-ba4c-50e8-b26a-a686bb5a2b97', '2017-02-09 16:10:55', '0', '19', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '147', '69e91d49-be73-5e84-8d41-c6f1389c6032', '2017-02-09 16:10:55', '0', '19', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '148', '35909ff0-48dd-5888-93fc-661b224fd04e', '2017-12-06 15:18:58', '0', '20', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '149', 'e3e851c8-e503-544d-bb9d-8eee694bfadb', '2017-12-06 15:18:58', '0', '20', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '150', 'f1c89064-3a6c-55db-a9bb-d128c8120510', '2017-12-06 15:18:58', '0', '20', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '151', '3a4d00fa-4a1b-5f7d-a00e-cc8c48a3dcf8', '2017-12-06 15:18:58', '0', '20', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '152', '7b380e7d-7c4c-5d6c-a083-b471f8bbe617', '2017-12-06 15:18:58', '0', '20', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '153', '756cdcc5-3dee-5f4e-9026-3a60602baa96', '2017-12-06 15:18:58', '0', '20', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '154', 'eb996101-42ad-5e8e-8db6-e43c8fb6361a', '2017-06-25 06:08:57', '0', '22', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '155', '86babf06-16d6-5200-9639-6a10f1964a14', '2017-06-25 06:08:57', '0', '22', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '156', 'fe339e32-8a73-5a10-8c42-824263ac5b28', '2017-06-25 06:08:57', '0', '22', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '157', '4fce33c6-0e5e-5609-84b8-f9a531c959cf', '2017-06-25 06:08:57', '0', '22', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '158', '94387910-75d8-5eb0-b834-c28fb0567be5', '2017-06-25 06:08:57', '0', '22', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '159', '6ad8dd16-1d6c-5429-b93c-abcc85cb238f', '2017-06-25 06:08:57', '0', '22', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '160', 'c64a121e-0aa4-55d1-8823-d3ed63348896', '2017-06-25 06:08:57', '0', '22', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '161', 'ea7f0a65-4518-5e34-90d6-0f5439a31ba8', '2017-06-25 06:08:57', '0', '22', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '162', 'ffd1a1cd-2684-5f90-bb5b-5c7be8bc1b29', '2017-01-17 21:54:03', '0', '23', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '163', '8b2d8696-23da-58c1-a887-ecb88229f94b', '2017-01-17 21:54:03', '0', '23', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '164', 'ca772c69-b1b1-5d62-9f8c-92153c4aaee3', '2017-01-17 21:54:03', '0', '23', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '165', '300bb6f4-817e-5a3b-9de6-77f4dc08f55b', '2017-01-17 21:54:03', '0', '23', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '166', '44c1b586-356f-527c-b6e2-8290ed0ccca0', '2017-01-17 21:54:03', '0', '23', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '167', 'fcb83889-14a5-51d9-bbaa-298019d6b205', '2017-04-12 16:53:54', '0', '24', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '168', '81292ea9-4154-56d4-88e9-83a4cec28277', '2017-04-12 16:53:54', '0', '24', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '169', 'fd66d5c4-411d-5783-b2e8-7d28b2484309', '2017-04-12 16:53:54', '0', '24', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '170', 'd80e203d-b835-58d5-b1ae-9dea87974cc4', '2017-04-12 16:53:54', '0', '24', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '171', 'f3c65fe2-dc59-5c04-a125-227ed65a3d9d', '2017-04-12 16:53:54', '0', '24', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '172', '28d7a0be-4cf8-541f-9291-db340e12eef1', '2017-04-12 16:53:54', '0', '24', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '173', 'c83b5a43-7208-5bf6-a57d-f02427d0e532', '2017-02-13 06:00:13', '0', '25', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '174', '9e618bf8-e33a-5366-b507-8cb41838f4eb', '2017-02-13 06:00:13', '0', '25', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '175', '4ac390b6-e20b-5cc6-825f-593637aaeaf1', '2017-02-13 06:00:13', '0', '25', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '176', 'c3be36c0-d7c5-5a40-98b6-9e7df64d2946', '2017-02-13 06:00:13', '0', '25', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '177', '0e33788b-7a73-52ad-9157-dadf9fe031ef', '2017-02-13 06:00:13', '0', '25', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '178', 'f7d17337-0463-5098-a8fb-a4638681c6f8', '2017-02-13 06:00:13', '0', '25', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '179', '66b93fc3-0e52-563d-a011-dfee64ad3711', '2017-02-13 06:00:13', '0', '25', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '180', '7ef8819b-d01c-5a4e-8766-e48faf26a4e8', '2017-02-27 07:39:20', '0', '26', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '181', '8abc908f-3482-5d8a-9a07-918c609b153c', '2017-02-27 07:39:20', '0', '26', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '182', 'fff8095b-88d4-5c5a-807b-35be28d7ecfa', '2017-02-27 07:39:20', '0', '26', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '183', '0cb8e340-2a5f-5e21-9fcf-f04eb7c2d0ce', '2017-02-27 07:39:20', '0', '26', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '184', 'f486eec8-870b-537e-871b-c02c4e654c9f', '2017-02-27 07:39:20', '0', '26', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '185', 'cfb84c38-00be-5086-9f12-6eddfdf384ff', '2017-02-27 07:39:20', '0', '26', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '186', '2a1acb9c-a6fc-520e-bfe9-3402765be1aa', '2017-02-27 07:39:20', '0', '26', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '187', 'b2599550-2d54-559e-920a-649ca9811dc8', '2017-02-27 07:39:20', '0', '26', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '188', 'd8b03058-c343-5a29-84f7-7bcc01816dc5', '2017-11-27 08:52:53', '0', '27', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '189', '165a527d-5213-5cf6-a070-8383de5de23d', '2017-11-27 08:52:53', '0', '27', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '190', '8f985356-cf3c-51a8-b155-13792337e61f', '2017-11-27 08:52:53', '0', '27', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '191', '4d1d9570-55e4-5ec2-8818-170626d89a72', '2017-11-27 08:52:53', '0', '27', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '192', '54010b7a-fa10-5479-8d4e-5d25cd25f9a0', '2017-11-27 08:52:53', '0', '27', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '193', '803fa071-3991-5b92-9130-ac5211eee1d6', '2017-11-27 08:52:53', '0', '27', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '194', '18825940-36d9-534a-ac9a-a822f8cffdc6', '2017-01-24 05:23:27', '0', '28', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '195', 'dc2c435c-d805-52b8-a928-7fadbedf8b28', '2017-01-24 05:23:27', '0', '28', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '196', 'fe79e583-20eb-5931-b8f0-4c12b52b62c2', '2017-01-24 05:23:27', '0', '28', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '197', '45dde852-b940-55e1-bd0f-7bf6c4b86d12', '2017-01-24 05:23:27', '0', '28', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '198', '70202a34-9f25-577f-b2fc-eb6ec081738d', '2017-01-24 05:23:27', '0', '28', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '199', '4ce01773-4f0b-54ab-8ae5-71ba8f077db6', '2017-01-24 05:23:27', '0', '28', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '200', 'fcada369-6125-53b6-a5ca-15de3d9fb709', '2017-01-24 05:23:27', '0', '28', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '201', '79789fc4-9863-5485-bb83-40a66165682f', '2017-01-24 05:23:27', '0', '28', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '202', '4129c3d6-526f-54ec-bf00-21737d10e05a', '2017-01-24 05:23:27', '0', '28', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '203', '35970b7d-6487-5142-9aec-9c74d9733d49', '2017-09-30 14:32:12', '0', '29', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '204', '70edd552-6feb-5186-9216-cca8f33ff9ec', '2017-09-30 14:32:12', '0', '29', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '205', 'e33ba9bb-1ffd-507f-8d11-5714b9f7062e', '2017-09-30 14:32:12', '0', '29', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '206', '193deb23-9102-578b-95b1-e9890c49ae27', '2017-09-30 14:32:12', '0', '29', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '207', '3080cc65-75e4-58df-95e3-bfbbdf9eb2fb', '2017-09-30 14:32:12', '0', '29', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '208', 'c97b613f-dab3-56cd-9b70-afdb43e7600f', '2017-09-30 14:32:12', '0', '29', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '209', '3e2d0ff0-7887-5ff0-8e47-93846dcce1e9', '2017-09-30 14:32:12', '0', '29', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '210', 'f24fd94c-f1ca-57e1-a7d9-fb101f76ef40', '2017-11-22 17:13:27', '0', '30', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '211', 'b11b5452-4cd9-58fc-9c5f-9586b08049d5', '2017-11-22 17:13:27', '0', '30', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '212', 'fb298a95-188d-5df4-99f9-dacafd23e82e', '2017-11-22 17:13:27', '0', '30', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '213', '19e52fda-28c4-5702-a422-ce2410a574ed', '2017-11-22 17:13:27', '0', '30', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '214', '2fa5e5d8-65a8-5a06-b688-5d012a415e4e', '2017-11-22 17:13:27', '0', '30', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '215', 'c97aecfe-8f67-5512-b890-c09304879995', '2017-09-25 13:31:21', '0', '31', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '218', 'f8be73de-f2ab-5a7e-b731-26ce86866150', '2017-09-25 13:31:21', '0', '31', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '219', 'e9dd0b28-bf49-5a11-a314-eb73c0ece8ad', '2017-09-25 13:31:21', '0', '31', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '220', '0b0d702c-d056-52d4-a5b5-fa3fd2f268db', '2017-09-25 13:31:21', '0', '31', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '221', '7cd8b585-be80-5c6e-903e-cc607a661086', '2017-06-02 21:11:20', '0', '32', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '222', 'efdb37b9-a52b-5460-8313-a42ce1693ee4', '2017-06-02 21:11:20', '0', '32', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '223', '63c8c635-d13a-562c-b37d-deef1d0cb352', '2017-06-02 21:11:20', '0', '32', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '224', 'a36c4e7e-ab57-52d7-9445-1a1c9b757a69', '2017-06-02 21:11:20', '0', '32', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '225', '7583aa48-260a-5cc5-a20d-929dd5b54e3f', '2017-06-02 21:11:20', '0', '32', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '226', '173f0186-e8aa-5056-b082-4ea495ce3051', '2017-06-02 21:11:20', '0', '32', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '227', '3af869de-47bf-5bff-805a-46edb548518b', '2017-12-09 09:29:06', '0', '33', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '228', '6dc0ee1a-8e09-5826-8e6e-08c0b12e7eff', '2017-12-09 09:29:06', '0', '33', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '229', 'bea7b087-0085-51e8-bee8-195b4c565224', '2017-12-09 09:29:06', '0', '33', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '230', '8502a94c-b668-5f1b-9df9-c53b7e433f87', '2017-12-09 09:29:06', '0', '33', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '231', 'e46d76eb-3627-52ee-917c-bcc36187af10', '2017-12-09 09:29:06', '0', '33', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '232', '334281e6-1c22-52d6-9c33-462b4cbeb4b2', '2017-12-09 09:29:06', '0', '33', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '233', '1a7e7e95-97bf-5dc2-8b19-c579fb2f6c3f', '2017-12-09 09:29:06', '0', '33', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '234', '434079f8-22cb-5b57-8d2f-de511622e40c', '2017-12-09 09:29:06', '0', '33', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '235', '0ff2d9c8-1280-59f7-90d8-7df0b8e2450d', '2017-12-09 09:29:06', '0', '33', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '236', 'd84912e8-db65-54b2-8494-8e95954a89d8', '2017-12-09 09:29:06', '0', '33', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '237', 'c0f24c09-ca50-5073-b851-f0ff08d7adb7', '2017-04-15 21:33:50', '0', '34', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '238', 'f832f388-1e71-54c3-a95b-98a81116b136', '2017-04-15 21:33:50', '0', '34', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '239', 'a6ca107b-3a5f-5610-bfe6-8125bfa537f0', '2017-04-15 21:33:50', '0', '34', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '240', 'e6036ac7-2441-5eac-8141-9e398092a2fb', '2017-04-15 21:33:50', '0', '34', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '241', '93ee1d44-516b-580b-8b62-d138d76319f1', '2017-04-15 21:33:50', '0', '34', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '242', 'a74d5334-4127-5aca-8167-9c7ea53c3d26', '2017-04-15 21:33:50', '0', '34', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '243', '1338fc5a-fb15-5299-9a4d-fe2d0af3a31f', '2017-04-15 21:33:50', '0', '34', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '244', '55d6b35f-c519-5fb8-bfd2-f74038987ac3', '2017-04-15 21:33:50', '0', '34', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '245', '3e3ed24f-8902-57c7-b6b8-60c9c2f5eb34', '2017-04-15 21:33:50', '0', '34', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '246', '03be2eec-4338-5c38-a566-6107b6078514', '2017-09-16 23:12:08', '0', '35', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '247', '862663c1-536f-5520-bcd7-aa1f51b40ac2', '2017-09-16 23:12:08', '0', '35', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '248', 'edcfa487-c3fb-50e7-a391-23045affcfb2', '2017-09-16 23:12:08', '0', '35', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '249', 'aeef7f57-39d7-531c-a40e-13c718273839', '2017-09-16 23:12:08', '0', '35', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '250', 'a575311b-f019-5a17-b7c8-5ef18d3efa1d', '2017-09-16 23:12:08', '0', '35', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '251', '8eb340bf-08a7-5902-815d-599918a72205', '2017-09-16 23:12:08', '0', '35', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '252', '01b625cc-6a63-506c-83f0-c3c38ecc54ba', '2017-09-16 23:12:08', '0', '35', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '253', 'fd9c46a7-fd43-5562-9f58-288adea0afcf', '2017-09-16 23:12:08', '0', '35', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '254', 'e5373f7b-cc07-5622-bd20-775e58dca286', '2017-09-16 23:12:08', '0', '35', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '255', '69db9d26-f8f5-56ac-858d-5161c915f7e7', '2017-05-12 23:53:03', '0', '36', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '256', 'cf35809c-374e-5ee8-b2c9-09df4c87cec4', '2017-05-12 23:53:03', '0', '36', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '257', '03f126fd-5fef-586c-af7f-eed2e3e431b6', '2017-05-12 23:53:03', '0', '36', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '258', '1f800488-3fce-5ea5-bf12-cd6389d545e7', '2017-05-12 23:53:03', '0', '36', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '259', '772849ae-c27a-570d-92b3-08eb60f18b22', '2017-05-12 23:53:03', '0', '36', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '260', '7b7bcc08-b3c5-5e83-b298-83e17cf174cf', '2017-05-12 23:53:03', '0', '36', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '261', '57e3da13-a365-5af7-8311-ddbd444e1fb9', '2017-05-12 23:53:03', '0', '36', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '262', 'ca0abb7a-1463-513c-b1fe-1afb2fee0023', '2017-05-12 23:53:03', '0', '36', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '263', 'ba2cb30d-67fa-517e-b8d7-9a70e16416d1', '2017-01-09 12:46:36', '0', '37', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '264', '8fa0ff70-84f1-51fc-842e-52885a331edd', '2017-01-09 12:46:36', '0', '37', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '265', '5b4f5e3d-d3f9-59ae-afbd-9252e3e18de8', '2017-01-09 12:46:36', '0', '37', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '266', '9365ed40-d7f2-5669-a656-e296db07cc9f', '2017-01-09 12:46:36', '0', '37', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '267', '1e618687-3660-53fc-b624-e33e89ddd300', '2017-01-09 12:46:36', '0', '37', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '268', '5166c90b-a9d0-5ff6-9c56-d9f65dbd2db5', '2017-01-09 12:46:36', '0', '37', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '269', '939a5561-7bad-5c24-82f6-116df010470a', '2017-01-09 12:46:36', '0', '37', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '270', '97ece1a8-e8f1-5bbe-bb03-ef29d6eb41d7', '2017-01-09 12:46:36', '0', '37', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '271', '6dce31fc-52f7-5018-8bed-72767e879029', '2017-01-09 12:46:36', '0', '37', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '272', '3f9cedcb-7e29-5372-9cdd-a7c4c2d2e918', '2017-08-21 14:07:07', '0', '38', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '273', '5c2ec748-298d-5a65-9726-f701690aa5d8', '2017-08-21 14:07:07', '0', '38', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '274', 'b5be060c-3bd7-5cdf-b6ef-29b42920fa76', '2017-08-21 14:07:07', '0', '38', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '275', '78851da0-7f88-55b6-b654-92ac3f5ae621', '2017-08-21 14:07:07', '0', '38', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '276', '2399a870-a8bc-5e1d-985c-9f4bb376dbc4', '2017-08-21 14:07:07', '0', '38', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '277', '8256f6f7-6b87-5447-87e2-930f5c664476', '2017-08-21 14:07:07', '0', '38', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '278', 'fcf2e9f3-d75c-5bdf-bf10-da946f81ab91', '2017-04-07 07:51:11', '0', '39', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '279', 'dd82fd7e-bcb3-5b24-8094-31b92694a67e', '2017-04-07 07:51:11', '0', '39', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '280', 'b4bd0560-07fc-57e6-851e-6c40db2c4855', '2017-04-07 07:51:11', '0', '39', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '281', '51e0215a-4463-5753-8beb-d98b80c6119f', '2017-04-07 07:51:11', '0', '39', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '282', 'abd76801-6e9c-54c6-8416-f90ecc5bf998', '2017-04-07 07:51:11', '0', '39', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '283', '33754fa2-2918-52b6-9c1c-5dd427982630', '2017-04-07 07:51:11', '0', '39', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '284', 'becc3c6a-a986-50c9-a407-ebfa95f33d7c', '2017-04-07 07:51:11', '0', '39', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '285', '31f40b5b-a0d2-5fe1-b21f-88ad7944d2b8', '2017-04-07 07:51:11', '0', '39', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '286', '842ce2c5-54d6-527b-ac1a-abca6fd6d0eb', '2017-12-10 21:17:33', '0', '40', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '287', '5f3b5a1a-3521-5f69-b8c9-51a12debf174', '2017-12-10 21:17:33', '0', '40', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '288', '7fde6427-4d06-55d4-bdfd-a335c027f2d8', '2017-12-10 21:17:33', '0', '40', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '289', 'e1fcdedc-966f-5340-a06d-90dc995713c7', '2017-12-10 21:17:33', '0', '40', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '290', '29293741-671d-54d4-9811-ded46d9c1821', '2017-12-10 21:17:33', '0', '40', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '291', 'd5e0b808-33bc-5903-8be9-89e5e17f4d3d', '2017-12-10 21:17:33', '0', '40', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '292', '5b7c1525-371e-5af3-b3de-6f2025a6a1de', '2017-12-10 21:17:33', '0', '40', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '293', 'ebbc1189-90fc-503a-b231-fa32e8fc8904', '2017-02-04 19:45:15', '0', '42', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '294', '409c6986-e744-59bd-bfab-4e56f7159c79', '2017-02-04 19:45:15', '0', '42', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '295', '221e421d-cbbb-53ce-9ca8-c6c21bbd8393', '2017-02-04 19:45:15', '0', '42', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '296', 'b55c7f46-41d5-5f92-8a49-eb98e963a187', '2017-02-04 19:45:15', '0', '42', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '297', 'ee64e50b-6603-587d-9f11-55df919475b0', '2017-02-04 19:45:15', '0', '42', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '298', 'cd4651ac-7720-551c-9276-f6ca9ef81ef5', '2017-08-19 12:42:15', '0', '41', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '299', '0878aafb-f52c-5e42-ab5a-c71857d0a4d9', '2017-08-19 12:42:15', '0', '41', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '300', 'f3035f53-6a35-5166-9de9-b865e57551c1', '2017-08-19 12:42:15', '0', '41', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '301', '6aba3676-6c45-51ba-a290-8971ce79df1d', '2017-08-19 12:42:15', '0', '41', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '302', 'c84e7fd3-ec6b-5dbb-838f-88bd4f0ebfb8', '2017-08-19 12:42:15', '0', '41', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '303', '01138ad6-53d7-5391-9f1c-75c27c38feb7', '2017-08-19 12:42:15', '0', '41', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '304', '6d452ae2-f8da-579a-ac8e-b14000fefd49', '2017-08-19 12:42:15', '0', '41', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '305', '0b0cbb8b-3349-578d-9d97-d47a53301ed0', '2017-08-19 12:42:15', '0', '41', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '306', 'f94f081e-ec99-5ce3-80a6-1a634b43eb93', '2017-12-23 19:46:21', '0', '43', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '307', 'a6285250-9872-5ba5-8a6f-f4a1cad8cdee', '2017-12-23 19:46:21', '0', '43', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '308', '5e1e3f04-b6c5-53bf-aec2-46ad96ce5d92', '2017-12-23 19:46:21', '0', '43', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '309', 'f1768054-c0e5-5715-9fcd-cc56be01cdfc', '2017-12-23 19:46:21', '0', '43', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '310', '726e95f2-fb81-5e0b-a298-38fb1a085f1a', '2017-12-23 19:46:21', '0', '43', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '311', '9fb7cfc0-b886-53cb-b25e-5be5d38648a8', '2017-08-13 04:03:23', '0', '44', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '312', 'ee0aadb6-796f-58be-a11e-1359f333d622', '2017-08-13 04:03:23', '0', '44', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '313', '63dcb7e9-aee5-56cb-a757-c360ada46b51', '2017-08-13 04:03:23', '0', '44', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '314', 'da02202a-f2da-5c09-9db5-96279501228f', '2017-08-13 04:03:23', '0', '44', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '315', '2495c5e6-30ab-5ed1-a9e9-3bc76a64e98f', '2017-08-13 04:03:23', '0', '44', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '316', 'b08bcbc7-6b5b-5779-b400-aa103876566d', '2017-01-15 17:06:17', '0', '45', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '317', '73ef2a1e-b3a9-503a-afdd-2917caf18031', '2017-01-15 17:06:17', '0', '45', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '318', 'ffe0a575-25cd-58cb-80b1-54e8b3cc0201', '2017-01-15 17:06:17', '0', '45', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '319', '83c9198b-beb4-5f9d-bb22-971ff9596e1e', '2017-01-15 17:06:17', '0', '45', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '320', '13fb3499-6b8d-5e75-a4cd-0f24ac6921d2', '2017-01-15 17:06:17', '0', '45', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '321', '0bc2521e-b6c6-59e8-a393-b682d711fd3d', '2017-01-15 17:06:17', '0', '45', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '322', 'f3890061-cf6a-59b7-9c57-568fc083a3c8', '2017-01-15 17:06:17', '0', '45', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '323', 'e1da2176-f4bf-5522-a64c-719252c9cc86', '2017-01-15 17:06:17', '0', '45', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '324', 'a4039d5a-a9cd-56f8-8664-ce32b5be67aa', '2017-01-15 17:06:17', '0', '45', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '325', '6e1d8b03-7912-5b34-a7bf-9dfaeda22483', '2017-01-15 17:06:17', '0', '45', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '326', '0e2a864a-af8e-54ae-bdc8-69fada706688', '2017-05-25 03:44:10', '0', '46', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '327', 'e6c910d4-2163-5c3f-bd1e-e83105d32ee0', '2017-05-25 03:44:10', '0', '46', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '328', 'f60af586-e92a-5ef0-9d28-b067031a6041', '2017-05-25 03:44:10', '0', '46', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '329', '14417a1d-7ee6-569a-80eb-6bd56c65480b', '2017-05-25 03:44:10', '0', '46', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '330', 'ed09ab0d-af18-56f1-b992-bc29e9f73c8f', '2017-05-25 03:44:10', '0', '46', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '331', '826a541f-79a7-5ade-bc8e-7e8fa03b4a49', '2017-05-25 03:44:10', '0', '46', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '332', '677a1d5a-e677-5cd9-b23e-2821b53c04ad', '2017-10-25 11:02:36', '0', '47', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '333', 'bc69e7ae-4277-5c67-b484-0c4a8e337c7a', '2017-10-25 11:02:36', '0', '47', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '334', 'c7cf936d-9294-502f-af16-814c6f130f54', '2017-10-25 11:02:36', '0', '47', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '335', '06380897-a51c-5251-b6d8-61d8dd82963e', '2017-10-25 11:02:36', '0', '47', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '336', '27344a24-23be-5b84-afc1-8d6387a66e61', '2017-10-25 11:02:36', '0', '47', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '337', 'a3563341-dcdd-5914-b257-fad40e1a0e96', '2017-03-15 06:27:22', '0', '48', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '338', '48603dc4-f444-52d5-b8bf-ece753811180', '2017-03-15 06:27:22', '0', '48', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '339', '18f55473-d4d6-58a3-a21c-2e91c8f35221', '2017-03-15 06:27:22', '0', '48', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '340', 'b78b5406-e119-57a1-8f45-3e7b93223ed0', '2017-03-15 06:27:22', '0', '48', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '341', '4db8de38-e702-5a11-bb76-0c49f6bdcd23', '2017-03-15 06:27:22', '0', '48', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '342', 'ddd3e40c-20a3-5153-b06d-f1f509ffb510', '2017-03-15 06:27:22', '0', '48', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '343', 'f88f3959-0372-5e56-9e65-cb59875845a3', '2017-03-15 06:27:22', '0', '48', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '344', 'a49f0165-b33d-57b2-ad56-525ede0e7372', '2017-10-25 11:02:36', '0', '47', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '345', '908c5ed5-4f23-519a-b619-36c4376972d9', '2017-03-15 06:27:22', '0', '48', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '346', '64a95367-998e-597b-927f-fa0c09e29177', '2017-07-17 10:58:47', '0', '49', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '347', 'a191276f-8f11-57f2-86d0-0e9eca1af841', '2017-07-17 10:58:47', '0', '49', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '348', '34d88fa7-e586-5d13-9002-aaa800904ffe', '2017-07-17 10:58:47', '0', '49', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '349', 'c3589530-5b30-53e6-bff9-f4635d4c023f', '2017-07-17 10:58:47', '0', '49', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '350', 'e8282fa0-bf4f-544c-b0f9-1f646d1902be', '2017-07-17 10:58:47', '0', '49', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '351', '3cba3bec-70a2-5ca2-9ed6-fb35482dec20', '2017-07-17 10:58:47', '0', '49', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '352', '281f0ea7-ea04-560c-9a21-e1040097ab8d', '2017-05-16 10:40:24', '0', '50', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '353', 'cdd10cb9-198a-5b24-81be-8112c04b65df', '2017-05-16 10:40:24', '0', '50', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '354', '35ccbcba-cfe5-5e8a-98e4-a7f8b7b6dc92', '2017-05-16 10:40:24', '0', '50', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '355', '9d0c6f2b-61dd-5b04-849b-e8a01bd99d2d', '2017-05-16 10:40:24', '0', '50', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '356', '3f42b9d4-89c1-5e0e-bb6c-62da2883b98d', '2017-05-16 10:40:24', '0', '50', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '357', '256f93df-91ae-5c0f-b080-1100a0ba6660', '2017-05-16 10:40:24', '0', '50', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '358', '98833013-fa24-529b-a46e-e84643283ad4', '2017-05-16 10:40:24', '0', '50', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '359', '3c3ee5af-eee2-57ab-90c8-c3437109546d', '2017-08-11 15:27:44', '0', '51', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '360', '94d30868-f54c-5379-a2ce-feef878e4dd2', '2017-08-11 15:27:44', '0', '51', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '361', '71ebd9b8-73bd-59c6-aecb-464f014c6d0e', '2017-08-11 15:27:44', '0', '51', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '362', 'c6d892dc-15ab-50fe-9114-5d28f938b156', '2017-08-11 15:27:44', '0', '51', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '363', '9cfcad46-3325-5d63-b130-230f32f812cd', '2017-08-11 15:27:44', '0', '51', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '364', '8f5cc457-1494-5f5b-a6d9-459c1b1629c7', '2017-08-11 15:27:44', '0', '51', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '365', 'd1b639ed-2657-5d44-b116-b9a8d17e78f4', '2017-08-15 13:43:34', '0', '52', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '366', 'd3de77b0-b450-5ada-9a3c-65021b6ee211', '2017-08-15 13:43:34', '0', '52', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '367', '914b038f-f43c-5d87-9dc3-77ee8a86163b', '2017-08-15 13:43:34', '0', '52', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '368', '560c4930-8746-554f-9332-2c23d52b77b0', '2017-08-15 13:43:34', '0', '52', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '369', '10a28e71-2228-5d19-b527-554a6d94ac66', '2017-08-15 13:43:34', '0', '52', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '370', 'da380408-21a5-5817-b3d0-6b8591eccca6', '2017-08-15 13:43:34', '0', '52', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '371', '68414c34-54ce-56dc-8de7-a169cff2ca8a', '2017-01-10 03:17:54', '0', '53', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '372', 'd5fe2c71-3074-51fc-a767-3644fa5c6d47', '2017-01-10 03:17:54', '0', '53', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '373', 'bfface39-c0d6-5c09-955f-b7f303c8a805', '2017-01-10 03:17:54', '0', '53', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '374', 'c4b4afc9-0a13-5a37-8330-b758051a7a5d', '2017-01-10 03:17:54', '0', '53', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '375', '9e95f61b-5f31-5963-a266-df1b5f361c36', '2017-01-10 03:17:54', '0', '53', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '376', 'e815a20a-5968-5685-a14c-4d88606390d9', '2017-01-10 03:17:54', '0', '53', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '377', '1d19a6b5-6cd7-5ba3-84ef-fcfb86f8b6f7', '2017-01-10 03:17:54', '0', '53', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '378', '1814d0de-5422-5453-9fe9-07aa4513bcb6', '2017-01-10 03:17:54', '0', '53', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '379', '157481d7-387f-58f4-88e4-65209c4e534c', '2017-01-10 03:17:54', '0', '53', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '380', '00a6cf53-9874-5443-9605-eab30ed9eb14', '2017-01-10 03:17:54', '0', '53', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '381', '98cc368c-1174-539c-96b2-677b1bd9b3bd', '2017-06-10 00:32:23', '0', '54', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '382', '490ff50f-7693-509f-9699-b0b04f9c4be4', '2017-06-10 00:32:23', '0', '54', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '383', 'fefbd180-be61-5776-a4d8-bf78a89c4a8f', '2017-06-10 00:32:23', '0', '54', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '384', '0f6d16d7-6764-57c0-8e5d-bd6f4bc5217d', '2017-06-10 00:32:23', '0', '54', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '385', 'aed38b14-44d7-5d53-8fa1-ff8f0dd80b93', '2017-06-10 00:32:23', '0', '54', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '386', '8e21bed3-0236-5bf5-898a-e9fd44261ffb', '2017-06-10 00:32:23', '0', '54', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '387', '522a27fd-33e7-56a0-a649-026a4e47cd52', '2017-06-10 00:32:23', '0', '54', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '388', '0a7b036c-1db6-5576-9fc2-98d2e258928c', '2017-02-15 05:18:24', '0', '55', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '389', '1bd031ee-57c2-56a8-95d3-bfb58bed528e', '2017-02-15 05:18:24', '0', '55', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '390', '34c3c0be-229e-5110-9d6c-95281d1b6bf0', '2017-06-10 00:32:23', '0', '54', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '391', 'c5ddc753-c93e-504f-960a-a10b0a700eae', '2017-02-15 05:18:24', '0', '55', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '392', 'f1402177-b3c9-5bb7-8589-87c24f5d5343', '2017-02-15 05:18:24', '0', '55', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '393', 'e4ccf6b9-53ca-5939-af2a-426f75ea0c83', '2017-02-15 05:18:24', '0', '55', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '394', '09d3c1cf-9480-55a3-9db3-b91eadf3fc88', '2017-02-15 05:18:24', '0', '55', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '395', 'ce9c858f-3b0e-5617-9221-c41051756d05', '2017-08-01 06:40:54', '0', '56', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '396', 'f748dadb-5fde-572d-bb94-350c0f5b83ec', '2017-08-01 06:40:54', '0', '56', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '397', 'ad9f9182-8ae7-5937-9fcd-fe234d5fc9f4', '2017-08-01 06:40:54', '0', '56', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '398', '5964405e-e6ff-57d2-b9a5-1b7496692052', '2017-08-01 06:40:54', '0', '56', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '399', 'c4413926-b2e3-5e93-bd11-bafe41c1477e', '2017-08-01 06:40:54', '0', '56', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '400', 'b96d7101-c5f9-5f20-a0c0-2ba9bd68557b', '2017-08-01 06:40:54', '0', '56', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '401', '424f85d3-a467-5957-a15b-d5063c8b3611', '2017-08-01 06:40:54', '0', '56', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '402', '83934a40-6119-5698-9146-75733538e1cd', '2017-08-01 06:40:54', '0', '56', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '403', '4fc16bdf-d3ac-540c-bf90-bfdf1ced1381', '2017-12-31 11:16:43', '0', '57', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '404', 'a7ae03d8-d2c9-5da2-985a-0c1ccebed304', '2017-12-31 11:16:43', '0', '57', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '405', '0028eac4-53c5-5488-a7c8-997d731e99ce', '2017-12-31 11:16:43', '0', '57', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '406', '1b46c681-06e5-59d3-87ab-98c8ea0d6375', '2017-12-31 11:16:43', '0', '57', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '407', '0131a61b-3a3e-5f45-937c-14d589c11d53', '2017-12-31 11:16:43', '0', '57', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '408', '5522dfd6-ce59-5087-adac-03f90ca4c00b', '2017-12-31 11:16:43', '0', '57', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '409', '2026e4cf-be41-5c7e-8a22-91921bdda543', '2017-12-31 11:16:43', '0', '57', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '410', '2cf88eed-a670-5837-ace9-0f9aa0bf4206', '2017-12-31 11:16:43', '0', '57', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '411', '10ce7932-2c3a-5b37-b276-411ef71ec112', '2017-12-31 11:16:43', '0', '57', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '412', '9f80c656-2552-59f6-9552-0ef200091d86', '2017-05-29 22:24:27', '0', '58', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '413', 'ae943e86-d26e-57d6-b5d9-90ce428a70b6', '2017-05-29 22:24:27', '0', '58', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '414', 'b1286133-bc08-5db4-85b6-6d3873552d58', '2017-05-29 22:24:27', '0', '58', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '415', '1e655a47-6174-5b2e-98de-a16b10d6d2e6', '2017-05-29 22:24:27', '0', '58', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '416', 'a501e8b7-1e54-5147-9e48-e74e3d4b3244', '2017-05-29 22:24:27', '0', '58', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '417', '0ecc5168-6e76-51b4-bc07-2adf1559c730', '2017-05-29 22:24:27', '0', '58', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '418', '71bbaa72-3e9c-58d1-a9a0-fffe633a4201', '2017-05-29 22:24:27', '0', '58', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '419', '954cc09e-ad0c-5528-a797-5d4f6bb0ef73', '2017-05-29 22:24:27', '0', '58', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '420', 'd72e6530-37b7-56a0-a6f3-c61d2103e3da', '2017-05-29 22:24:27', '0', '58', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '421', '9786abd7-fae0-5d3f-86f9-dce0a405d7b5', '2017-05-29 22:24:27', '0', '58', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '422', '36eb6acb-401f-5328-a0be-d9742518b0cd', '2017-04-01 11:24:07', '0', '59', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '423', '9e9a95da-2dbf-5b66-a10c-9c85de596818', '2017-04-01 11:24:07', '0', '59', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '424', '279a9e58-b164-5475-854c-a581818dca07', '2017-04-01 11:24:07', '0', '59', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '425', 'de00b21f-b7c8-5955-88aa-085d498a7e58', '2017-04-01 11:24:07', '0', '59', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '426', 'e18ead14-d5de-577a-bd42-79b6bec8c9f1', '2017-04-01 11:24:07', '0', '59', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '427', '928f3fb9-e070-5bb1-8836-e1429612a5ba', '2017-04-01 11:24:07', '0', '59', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '428', 'ae182c06-4973-56bc-bd86-f4c1bbc034ce', '2017-04-01 11:24:07', '0', '59', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '429', 'bea67018-1742-571d-aaa2-81141b45577d', '2017-04-01 11:24:07', '0', '59', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '430', '144ebfd0-6577-5d14-961a-15eb1280b351', '2017-08-16 02:42:28', '0', '60', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '431', '215002bd-a3ad-5dbb-bf02-c42df90452d8', '2017-08-16 02:42:28', '0', '60', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '432', '0018f787-7de8-53ce-8144-a6315658041d', '2017-08-16 02:42:28', '0', '60', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '433', 'd608a840-c3c6-5068-b675-98804da9f8a8', '2017-08-16 02:42:28', '0', '60', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '434', 'd32f20dd-d6d9-5a36-b15d-52e38c0791bc', '2017-08-16 02:42:28', '0', '60', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '435', '22f8f23e-9a6a-545f-9ad9-76c6d96efc5a', '2017-04-03 23:21:08', '0', '61', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '436', '83ee8d84-bc6e-5afd-afa4-7d6c4e1af934', '2017-04-03 23:21:08', '0', '61', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '437', 'd70f7a77-478b-5f48-a425-2f379d717216', '2017-04-03 23:21:08', '0', '61', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '438', '028c7093-5dd3-51fc-97ee-5ec9b5ed5b97', '2017-04-03 23:21:08', '0', '61', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '439', 'dc9c720a-a118-578e-9186-04e378ddde28', '2017-04-03 23:21:08', '0', '61', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '440', '69e1d697-de6b-5ecf-a9a1-33dd9d3b417a', '2017-04-03 23:21:08', '0', '61', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '441', '743e0f0d-bb03-5779-8d12-913b3effc1a1', '2017-04-03 23:21:08', '0', '61', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '442', '1b695c1d-6ab2-5b2a-b6a5-ff34a59dce2f', '2017-04-03 23:21:08', '0', '61', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '443', 'cf3f5958-ed70-5bee-b779-0992daaccf32', '2017-04-03 23:21:08', '0', '61', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '444', 'fe05e83c-cb34-5387-9403-23621f8a32b7', '2017-01-15 12:28:50', '0', '62', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '445', '1687d5cb-3b24-5923-8f4e-2451620699f9', '2017-01-15 12:28:50', '0', '62', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '446', 'db88a433-9458-5ded-9771-0c13601df45f', '2017-01-15 12:28:50', '0', '62', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '447', 'e7659472-b9c7-530a-b15c-4fc4c7a1f105', '2017-01-15 12:28:50', '0', '62', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '448', '0862ddc8-c8dd-5bf2-9d86-f0e867e2630b', '2017-01-15 12:28:50', '0', '62', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '449', 'daff26e1-0a1d-5144-a635-de79934d85a3', '2017-01-15 12:28:50', '0', '62', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '450', '845ea7bc-92e7-5904-9d62-19817fe30b46', '2017-07-30 05:32:25', '0', '63', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '451', '04176db8-927c-55ef-b8c1-e19949194369', '2017-07-30 05:32:25', '0', '63', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '452', 'f664ca9a-eff4-55cc-8ed6-6ab3258ae0a7', '2017-07-30 05:32:25', '0', '63', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '453', 'd27fc48b-c0b3-541b-903f-d2f45e4ab2d2', '2017-07-30 05:32:25', '0', '63', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '454', 'a14f4a1c-5ca3-5b5a-be77-61f0483f7d78', '2017-07-30 05:32:25', '0', '63', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '455', '00f1d389-ff00-5f0e-8256-7784443d07b1', '2017-07-30 05:32:25', '0', '63', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '456', 'a4b1a513-c3f1-5907-a6bb-e5c871585575', '2017-07-30 05:32:25', '0', '63', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '457', '5817070c-4269-53a8-9d94-2006b05ea54a', '2017-07-30 05:32:25', '0', '63', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '458', '92638b29-9b28-5e31-8015-8ed486ccc01f', '2017-07-30 05:32:25', '0', '63', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '459', 'c5c50d30-7171-5277-88b0-7a9f1af65b98', '2017-05-26 08:26:22', '0', '64', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '460', 'bb0fb31b-a129-548d-8a60-8d2492302618', '2017-05-26 08:26:22', '0', '64', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '461', '3c9da8be-9058-5380-aeea-d3377db591e5', '2017-05-26 08:26:22', '0', '64', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '462', '28686c32-b973-58f7-b7f1-51732f3fb2b9', '2017-05-26 08:26:22', '0', '64', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '463', 'ae10d285-2a79-53f9-98a3-ab1024a5e657', '2017-05-26 08:26:22', '0', '64', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '464', '8c3a2b11-a598-5340-867f-e1bad7d107c9', '2017-05-26 08:26:22', '0', '64', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '465', 'c43c3de0-f46b-58f7-a5e6-dfd0d4139d05', '2017-05-26 08:26:22', '0', '64', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '466', '250f3347-3678-50a2-a288-a59ed659317c', '2017-05-26 08:26:22', '0', '64', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '467', '37d75971-7370-51e0-b064-b70a3fc58310', '2017-05-26 08:26:22', '0', '64', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '468', '17b96cad-35ca-5270-aa3e-36b1c7d4a044', '2017-11-05 09:34:52', '0', '65', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '469', 'a650209a-9def-5420-9ee8-415c6867cc5e', '2017-11-05 09:34:52', '0', '65', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '470', 'b2563ce7-3ad0-52fc-9723-70418542f525', '2017-11-05 09:34:52', '0', '65', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '471', '0f98f414-91c0-5171-93ed-2a68ccc0e46e', '2017-11-05 09:34:52', '0', '65', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '472', '06168815-6e84-580f-9383-8b638202968c', '2017-11-05 09:34:52', '0', '65', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '473', '2b2bd395-4107-561c-94a0-e70c57888537', '2017-11-05 09:34:52', '0', '65', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '474', '474c3916-fabd-5e00-b09e-da11476e327a', '2017-11-05 09:34:52', '0', '65', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '475', 'b2226f52-8c96-589b-ab93-a5b0af43ced6', '2017-11-05 09:34:52', '0', '65', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '476', '1a140218-af75-5b8f-862d-f2c7322cc6f4', '2017-11-05 09:34:52', '0', '65', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '477', '298e755b-94d6-52eb-842a-e8ef6d11ae3b', '2017-01-03 08:19:26', '0', '66', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '478', '98b78f73-0449-5851-abe7-ff05a8bfcf8e', '2017-01-03 08:19:26', '0', '66', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '479', '7da4397c-e0a1-5706-964a-d35092e601b0', '2017-01-03 08:19:26', '0', '66', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '480', '2512ae4a-8d0a-5646-8b0f-4882eef8ac10', '2017-01-03 08:19:26', '0', '66', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '481', '13a13792-dc5e-53c4-8107-2e06d47aafe0', '2017-01-03 08:19:26', '0', '66', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '482', '02e4ecef-c47e-5192-a7af-b8d3e87101f9', '2017-01-03 08:19:26', '0', '66', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '483', '0f6cb403-7464-5f35-a658-ad811ca7d59d', '2017-01-03 08:19:26', '0', '66', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '484', '1b72b5be-39cf-55a4-83db-0da9a3d83a45', '2017-01-03 08:19:26', '0', '66', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '485', 'd7423143-a79b-56aa-b6bd-1a863bb5518c', '2017-01-03 08:19:26', '0', '66', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '486', '8ad11d0e-dce8-5902-ae47-59a6fd212f21', '2017-08-31 21:34:36', '0', '67', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '487', 'e6559c2c-0a8d-543e-ae3e-a8487f93f021', '2017-08-31 21:34:36', '0', '67', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '488', 'dcf4ff8a-0674-549a-a3cf-fd4b053e32f3', '2017-08-31 21:34:36', '0', '67', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '489', 'ba71d0e8-6b77-5269-a6d6-ec5c53776968', '2017-08-31 21:34:36', '0', '67', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '490', 'e5aec96c-83c8-569b-b403-4f8a69cfe1d8', '2017-08-31 21:34:36', '0', '67', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '491', '4695b810-319f-5e9d-8066-59a41135b674', '2017-08-31 21:34:36', '0', '67', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '492', 'fd2c5a41-b366-556d-9e47-d2aeda60c8e9', '2017-08-19 20:48:01', '0', '68', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '493', '00c256d3-1b20-5a0a-adc0-e9cbe5b08a49', '2017-08-19 20:48:01', '0', '68', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '494', '77f5d39d-6730-588b-810a-2ae3fdfe7bc3', '2017-08-19 20:48:01', '0', '68', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '495', '18698683-1354-5395-9e54-2a1078b7641e', '2017-08-19 20:48:01', '0', '68', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '496', '63b7bd92-be89-5566-ac30-51d7acd41181', '2017-08-19 20:48:01', '0', '68', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '497', 'aed461a5-64fe-585c-b15c-059673b53b60', '2017-08-19 20:48:01', '0', '68', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '498', 'c4028612-c425-5532-9743-bca535d74b63', '2017-03-12 04:04:05', '0', '69', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '499', '0611c3dd-d3bf-54b9-9e9e-22e5b5252793', '2017-03-12 04:04:05', '0', '69', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '500', '0b0bea49-2129-50a5-9f3b-a2f861cc7191', '2017-03-12 04:04:05', '0', '69', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '501', '98fc82c6-29ec-5007-81e3-0fa61c7b8113', '2017-03-12 04:04:05', '0', '69', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '502', '9ac5d272-e459-507d-99b7-2a18e733e51d', '2017-03-12 04:04:05', '0', '69', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '503', 'b51ff9ee-84d3-5a93-a6ef-fefc79f58504', '2017-03-12 04:04:05', '0', '69', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '504', '51f3ca87-7b11-5f41-99fd-ac6772deac65', '2017-05-14 06:07:21', '0', '70', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '505', 'e1db95f8-4dac-5e20-9b6e-e3668b2cdaff', '2017-05-14 06:07:21', '0', '70', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '506', '6a9213ec-efa2-50f2-acf3-feab38e53e45', '2017-05-14 06:07:21', '0', '70', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '507', '912d4559-8f74-537b-a7f0-d510b04d8175', '2017-05-14 06:07:21', '0', '70', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '508', '172b2bed-8137-5488-b84f-7ceaeea42d21', '2017-05-14 06:07:21', '0', '70', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '509', '7bf3f138-8cfb-5552-a023-7099f59b6b98', '2017-05-14 06:07:21', '0', '70', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '510', '4ade7d4b-a669-5d29-90f4-0354d7444854', '2017-06-29 01:26:26', '0', '71', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '511', 'a76a0cba-55fa-5472-83bc-2a728afc4f15', '2017-06-29 01:26:26', '0', '71', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '512', '7f5e5374-eb63-52a9-862e-b98482ec884b', '2017-06-29 01:26:26', '0', '71', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '513', '71f1b93d-dc6e-592f-ab35-ec0e1b9c64c1', '2017-06-29 01:26:26', '0', '71', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '514', '75d8d355-7a5a-5bfb-85df-140f26a41262', '2017-06-29 01:26:26', '0', '71', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '515', '5397a254-10ea-5b54-b102-3a1890e516ba', '2017-06-29 01:26:26', '0', '71', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '516', '013276f8-6fa6-5c95-9ea9-47733fe42956', '2017-06-29 01:26:26', '0', '71', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '517', 'b5ec6bda-6012-55a8-8215-7d071246af27', '2017-06-29 01:26:26', '0', '71', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '518', 'e1a329d7-7bec-5b32-8b80-fe90478482b9', '2017-06-29 01:26:26', '0', '71', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '519', '73225d89-87da-520c-868a-3848502c9fc7', '2017-06-29 01:26:26', '0', '71', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '520', 'cd4c386e-a5ac-5727-a042-4ec3a629ee7a', '2017-09-28 14:07:38', '0', '72', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '521', '238f6006-fdbd-5bcc-a117-7c259930089c', '2017-09-28 14:07:38', '0', '72', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '522', 'd24d5923-3649-5c92-8959-262a0091283a', '2017-09-28 14:07:38', '0', '72', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '523', '198d6ae0-50a9-52f2-be29-12f574dabb8d', '2017-09-28 14:07:38', '0', '72', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '524', '481d02c0-e362-54f2-80ec-51c77eb604d1', '2017-09-28 14:07:38', '0', '72', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '525', '68bacd9e-a844-50fe-aa31-edb33069c04f', '2017-09-28 14:07:38', '0', '72', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '526', '8892e6cc-f58a-510e-b7ce-62c967e3da5c', '2017-04-13 23:51:18', '0', '73', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '527', '7128a149-8138-546c-9cc1-eeda33ca52e2', '2017-04-13 23:51:18', '0', '73', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '528', '9ae2c538-6cbd-5813-bcc5-7928d3ab5d62', '2017-04-13 23:51:18', '0', '73', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '529', '73fc6bd7-34a3-5a21-9138-e3033f36ccdf', '2017-04-13 23:51:18', '0', '73', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '530', '33b6796d-6b78-5519-980e-8579704cea77', '2017-11-23 08:32:57', '0', '74', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '531', '710cff9d-1099-549d-8d79-99662535f97d', '2017-11-23 08:32:57', '0', '74', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '532', 'fc748c2e-c1e7-5f46-a062-91ff00ac82cb', '2017-11-23 08:32:57', '0', '74', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '533', '537fdbd0-c623-5ea3-9be7-0c95afe7abcd', '2017-11-23 08:32:57', '0', '74', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '534', 'bb774b5b-f6a4-545a-8aa0-44ac72e72a9d', '2017-11-23 08:32:57', '0', '74', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '535', '76b7e9ad-cfdd-5567-b8f6-5062ae9dd862', '2017-04-13 23:51:18', '0', '73', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '536', 'cc4ae864-ab21-545f-a887-913b1a3a8c6f', '2017-11-23 08:32:57', '0', '74', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '537', 'ebd6a879-5957-5209-b92b-dc3d3ee238ee', '2017-10-01 11:24:19', '0', '75', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '538', '6a6e7da9-b78c-54f6-829e-b7c96ef63ff6', '2017-10-01 11:24:19', '0', '75', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '539', 'b5b66286-074a-5137-bb32-52ddb8722b2c', '2017-10-01 11:24:19', '0', '75', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '540', '4e084c27-1e54-58a7-bd09-6651fc5737ce', '2017-10-01 11:24:19', '0', '75', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '541', 'f5c48163-6c38-594b-8e83-c1ef5497e36a', '2017-10-01 11:24:19', '0', '75', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '542', '7ad34682-bb54-59e0-be67-1361a43222bc', '2017-10-01 11:24:19', '0', '75', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '543', '91abc862-df79-5fe0-b107-9fc2a1e8bb4f', '2017-10-01 11:24:19', '0', '75', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '544', '56488f84-93ec-5a4f-a3d3-040341d07836', '2017-10-01 11:24:19', '0', '75', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '545', '9cdc26e9-8330-5594-b4ea-8111532e1a36', '2017-07-01 06:31:54', '0', '76', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '546', '8cb7f41f-3d06-5831-843e-00764a8d93ff', '2017-07-01 06:31:54', '0', '76', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '547', '4a6f6afc-6083-5f4a-993e-2cadb36c0876', '2017-07-01 06:31:54', '0', '76', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '548', '53cb0ff7-ac3d-55c0-b5bf-64d9c2bf04e3', '2017-07-01 06:31:54', '0', '76', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '549', '4ef5c3fb-2a98-5dd2-9b5c-fbee143f830d', '2017-07-01 06:31:54', '0', '76', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '550', 'a7d7513d-83ee-5915-9bec-9032015bf987', '2017-10-01 11:24:19', '0', '75', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '551', '92cf3b21-fd5c-5402-9c02-0c0dd804bf16', '2017-07-01 06:31:54', '0', '76', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '552', 'edc7aa0f-ef6d-591d-9345-632126cda7ec', '2017-07-01 06:31:54', '0', '76', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '553', 'f77a95d4-c95e-53ac-b927-4a9c7fb5c1e3', '2017-07-01 06:31:54', '0', '76', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '554', 'eaa1614b-5a65-57cc-b461-c7095b98cfa3', '2017-07-01 06:31:54', '0', '76', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '555', '1c899af4-8651-51cd-8721-b1af173fb83b', '2017-04-11 14:30:57', '0', '77', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '556', 'bf2ca0df-c20a-508f-9ae9-4ffe020f22ce', '2017-04-11 14:30:57', '0', '77', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '557', 'cfd4a49b-8312-5447-a650-80630c8cd5a1', '2017-04-11 14:30:57', '0', '77', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '558', 'c14029b7-c768-5db5-befe-d719ba72a4d1', '2017-04-11 14:30:57', '0', '77', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '559', '6b85ddc7-2d2f-5540-bb48-820c52238d29', '2017-04-11 14:30:57', '0', '77', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '560', '429506bf-a74e-5cd0-9671-73fa2b6b7c6f', '2017-07-19 16:43:21', '0', '78', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '561', '73c55f6a-610d-5e61-b9be-1db7c79cc6e8', '2017-04-11 14:30:57', '0', '77', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '562', '4b668194-3f9f-5d6b-ac4a-97de4c9ff7a7', '2017-07-19 16:43:21', '0', '78', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '563', 'dad9bc84-d55c-56b3-84fc-038a42ea12e6', '2017-07-19 16:43:21', '0', '78', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '564', '7c6b6f4a-5149-5f9a-b1e8-7b22b27ed447', '2017-07-19 16:43:21', '0', '78', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '565', '63e5b385-edfa-5640-bb2b-68838a1eba0b', '2017-07-19 16:43:21', '0', '78', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '566', 'd9b36dcc-433a-5a1b-b8f7-7285555b465b', '2017-07-19 16:43:21', '0', '78', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '567', 'e009cf38-de2a-5651-93f9-90e20ec7ce11', '2017-07-19 16:43:21', '0', '78', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '568', 'ea65ba15-8c04-5484-96c9-73f4b7f6bbfe', '2017-07-19 16:43:21', '0', '78', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '569', '00d09dce-b360-57a8-9bb1-f35a40e52445', '2017-02-15 01:17:40', '0', '79', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '570', '02fdbc98-08b2-5319-a275-761cc6c12b4f', '2017-02-15 01:17:40', '0', '79', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '571', '60ef8ccd-db61-56c8-9916-693061b33e09', '2017-02-15 01:17:40', '0', '79', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '572', 'bd021463-2a5c-5d23-bb6b-eb8475fc1cf2', '2017-02-15 01:17:40', '0', '79', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '573', 'f3612fe0-92a5-5f9e-84bd-6d71e369fec8', '2017-02-15 01:17:40', '0', '79', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '574', '71a5ff90-6aea-56e6-9a0a-df01f652cf35', '2017-02-15 01:17:40', '0', '79', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '575', '575466c7-5f19-55f1-baa2-40b4381fe30d', '2017-02-15 01:17:40', '0', '79', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '576', '19cb5ca2-6eb4-5001-ad3b-3f2255631008', '2017-02-15 01:17:40', '0', '79', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '577', '420875b4-1ce3-5003-b51a-0960d8f47300', '2017-02-15 01:17:40', '0', '79', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '578', '9acb4eb6-94e6-5885-9cde-fcfe115c13a6', '2017-08-16 03:08:37', '0', '80', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '579', '087c4d3f-b413-54e8-a1d2-c30db243b147', '2017-08-16 03:08:37', '0', '80', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '580', '61092762-8b22-5c72-a2e9-6a36aeacf622', '2017-08-16 03:08:37', '0', '80', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '581', '89fdb4c2-f4ca-5a94-b5c4-98959060b011', '2017-08-16 03:08:37', '0', '80', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '582', 'ca37da3f-8df1-5ea2-8cd9-90cfcce0c9d3', '2017-08-16 03:08:37', '0', '80', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '583', 'fa8c4b98-58b2-547d-a135-ab4b5a6d5016', '2017-08-16 03:08:37', '0', '80', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '584', 'a2aa6b4d-ff46-59ed-b0c0-17581001ce33', '2017-08-16 03:08:37', '0', '80', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '585', '6603d203-456d-5833-9bd2-4b82b6bc2bdc', '2017-08-16 03:08:37', '0', '80', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '586', 'b1be361e-506f-5287-864c-acd1023bde4c', '2017-08-16 03:08:37', '0', '80', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '587', 'eabef2ff-95b0-5dc6-b36c-42185705d293', '2017-01-28 02:16:18', '0', '81', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '588', 'f589235b-408b-536c-8ab3-55e788bfe75e', '2017-01-28 02:16:18', '0', '81', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '589', 'a5cac077-3825-57c5-897f-84dc26ec7388', '2017-01-28 02:16:18', '0', '81', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '590', '72955641-f8c5-5701-96c8-e72e9f34ec17', '2017-01-28 02:16:18', '0', '81', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '591', '0085a29e-3de6-5c9e-83a0-a26f5af096fe', '2017-01-28 02:16:18', '0', '81', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '592', '275dfcfc-045d-5938-9c06-bc9d2938d7e2', '2017-01-28 02:16:18', '0', '81', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '593', 'c10e6adc-ad61-5f05-8735-c44e640ef797', '2017-01-13 00:39:44', '0', '82', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '594', '685fd5fd-b167-5675-a8a3-d3ecc6b6e789', '2017-08-16 03:08:37', '0', '80', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '595', 'cb0ca501-59ed-5b3c-8ca1-c1435aaa5d9c', '2017-01-13 00:39:44', '0', '82', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '596', 'bbf0a7de-6f23-5a03-a245-ffb99535cf85', '2017-01-13 00:39:44', '0', '82', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '597', '1f17298c-b65e-58ef-a8f1-60877f2f5798', '2017-01-13 00:39:44', '0', '82', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '598', '463c0e09-0828-5fa4-9351-687a388bf8b1', '2017-01-13 00:39:44', '0', '82', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '599', '1471de30-7cea-571a-a36a-a1217c93e5c9', '2017-01-13 00:39:44', '0', '82', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '600', '2b8d2643-e5a3-5508-9c54-4fdca61873d6', '2017-01-13 00:39:44', '0', '82', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '601', 'feb7f2ac-180d-5865-923f-700fdd6dca42', '2017-02-16 07:32:10', '0', '83', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '602', '59b18929-21d4-592b-afbd-42e29e45263d', '2017-02-16 07:32:10', '0', '83', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '603', 'f3a04ebd-2c0b-5b83-851a-a86c35f1435a', '2017-02-16 07:32:10', '0', '83', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '604', 'd01bb667-90fd-5a0e-b501-3eb8e6680d01', '2017-02-16 07:32:10', '0', '83', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '605', 'f7f650a4-71a5-569b-b300-4433e53e8ffd', '2017-02-16 07:32:10', '0', '83', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '606', '8799aa2f-d51d-5196-a4ae-be2af9c3a9ed', '2017-01-13 00:39:44', '0', '82', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '607', '2a432f1b-0ab0-525e-afe0-75583b4affe7', '2017-02-16 07:32:10', '0', '83', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '608', '2b638595-3719-535b-8533-f48dd831af23', '2017-10-04 18:34:37', '0', '84', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '609', '671ff2f7-a11c-57cd-968b-6fe5cfceac81', '2017-10-04 18:34:37', '0', '84', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '610', 'c5056f01-390c-5d68-935c-6b1f469a6d95', '2017-02-16 07:32:10', '0', '83', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '611', '1cddb96c-19f7-5aa1-b214-c6f0dd8d387c', '2017-10-04 18:34:37', '0', '84', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '612', 'f8fff8d2-3aaa-57dd-b59b-c5bc127cad30', '2017-10-04 18:34:37', '0', '84', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '613', '8a8306b4-9561-5f67-9cde-b26d0f71dc7e', '2017-10-04 18:34:37', '0', '84', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '614', 'efc20b01-a046-5e20-be5c-8a97be4a661a', '2017-10-04 18:34:37', '0', '84', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '615', '91ae075c-6cee-5098-adf1-597c8d4ecf4f', '2017-10-04 18:34:37', '0', '84', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '616', 'a0eefffe-aee8-54d1-b6ad-2758a23dcede', '2017-10-20 20:45:36', '0', '85', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '617', '544535c9-fa19-5f9d-a13d-929343e1b19e', '2017-10-20 20:45:36', '0', '85', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '618', '5483aa8d-eeb3-5c06-93a9-0db56fbaee5f', '2017-10-20 20:45:36', '0', '85', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '619', '38875db5-0a39-5d2c-93b9-42ce1ea0256e', '2017-10-20 20:45:36', '0', '85', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '620', 'c1d8ea4c-c267-512f-aa6b-8bd5effe6bfa', '2017-10-20 20:45:36', '0', '85', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '621', '87c62f92-5f17-5728-bf18-a3bfe5775319', '2017-10-20 20:45:36', '0', '85', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '622', 'dc9a8d5c-ab4d-5f17-95f1-48bd32a8862d', '2017-10-20 20:45:36', '0', '85', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '623', 'd12ba785-a5b5-5306-a65a-7c89f320d9a2', '2017-10-20 20:45:36', '0', '85', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '624', '6adaa37d-8331-5ca6-8e68-bf7c88fb56ea', '2017-10-20 20:45:36', '0', '85', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '625', 'e7c49aeb-0335-5afb-b404-497add495fb0', '2017-11-30 01:28:56', '0', '86', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '626', '0b8eb6af-f2c7-5059-85ef-849a38fdce7c', '2017-11-30 01:28:56', '0', '86', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '627', 'e3232719-e6a8-5ab3-ab15-bbc8d5584997', '2017-11-30 01:28:56', '0', '86', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '628', 'a2f6ca47-5b60-5185-b4cb-f0fee126c608', '2017-11-30 01:28:56', '0', '86', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '629', '6318378d-b61b-5bab-b612-ffff26db29dd', '2017-11-30 01:28:56', '0', '86', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '630', '5d1ec1e5-d0ad-5d5d-9d3e-b2a7619fe909', '2017-11-30 01:28:56', '0', '86', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '631', 'c8b3e0ee-778e-553c-a99e-2f5238f66a56', '2017-11-30 01:28:56', '0', '86', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '632', 'cceb380f-b119-5ca3-8995-a9a2d102c0f0', '2017-11-30 01:28:56', '0', '86', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '633', '40fe746c-b508-5a90-a031-d09bf9549378', '2017-11-30 01:28:56', '0', '86', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '634', 'c77768ce-d862-5c5b-9253-07d0ff58b424', '2017-11-30 01:28:56', '0', '86', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '635', 'ea3aa7f9-6601-5ea8-a2b6-0054747ffde2', '2017-11-14 20:09:35', '0', '87', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '636', '14255311-76b7-5a0e-9836-9a4db4bec879', '2017-11-14 20:09:35', '0', '87', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '637', '8d76a64a-ac02-553a-b1c6-92a70bb51fd4', '2017-11-14 20:09:35', '0', '87', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '638', 'a5c36ff6-3811-55db-9e8c-f45231d09b87', '2017-11-14 20:09:35', '0', '87', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '639', '2e420c87-fb5a-5606-a29f-440bf7ef25bc', '2017-11-14 20:09:35', '0', '87', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '640', 'b1226e06-7498-5f90-80d9-5b7dfe5cb53e', '2017-11-14 20:09:35', '0', '87', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '641', '04ea4005-cd53-557c-b37c-3aadf4534430', '2017-11-14 20:09:35', '0', '87', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '642', 'e75a24d9-5cab-5fcf-85ff-b576a00ff05b', '2017-11-14 20:09:35', '0', '87', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '643', '98ea4178-c2a5-51a4-8bf0-a4f75fc66a79', '2017-09-13 18:56:19', '0', '88', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '644', '1137afc3-6a71-5f18-b707-fb105e5455ec', '2017-09-13 18:56:19', '0', '88', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '645', 'f743f391-6ac4-5b10-bfaa-a952699efc84', '2017-09-13 18:56:19', '0', '88', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '646', 'ca827063-eb6b-584a-a331-6aa92fe7c192', '2017-09-13 18:56:19', '0', '88', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '647', '9938ec1f-0f97-5047-8b7e-c30dabad20ba', '2017-09-13 18:56:19', '0', '88', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '648', '5f2f8fb8-e9d6-5251-9586-c19b40186d99', '2017-09-13 18:56:19', '0', '88', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '649', 'ad0fb4f0-611a-5e77-9c75-480deeea378c', '2017-09-13 18:56:19', '0', '88', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '650', '2fbe8e7a-e45e-545c-94bc-be341ea74740', '2017-09-05 08:41:43', '0', '89', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '651', 'a9e593bb-9b76-5406-b17f-efcfb0ae1077', '2017-09-05 08:41:43', '0', '89', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '652', 'ecd6498f-c4d1-59e6-a227-d4efcfd16e41', '2017-09-05 08:41:43', '0', '89', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '653', '83b62d2f-cd13-547e-ae7a-035586e610a2', '2017-09-13 18:56:19', '0', '88', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '654', 'c82d6413-0d90-54f1-8ccd-ff0cf28709c8', '2017-09-05 08:41:43', '0', '89', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '655', '09debb5b-3a7e-5e6d-b5fd-888b42dd1109', '2017-09-05 08:41:43', '0', '89', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '656', '8074c1ed-e5cc-5f81-a622-645493b81101', '2017-09-05 08:41:43', '0', '89', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '657', 'f88fa4b9-be62-543a-9ee2-9c30a145e8cf', '2017-06-14 07:19:31', '0', '90', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '658', 'ef87d3af-0e5d-5ed6-add1-f02a319a44bd', '2017-06-14 07:19:31', '0', '90', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '659', '98cb4c58-4d23-5e70-81d2-e2689b631816', '2017-06-14 07:19:31', '0', '90', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '660', 'a2f84e99-2445-5b5a-9bcf-b334069b6472', '2017-06-14 07:19:31', '0', '90', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '661', '062b968f-d1c1-51f5-98e5-d8c6b9652281', '2017-06-14 07:19:31', '0', '90', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '662', '23ca2173-9e99-589f-bf46-1345bb7a1804', '2017-06-14 07:19:31', '0', '90', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '663', '3edb4e1a-cbf1-5ca5-82f9-a59fc92fc303', '2017-06-14 07:19:31', '0', '90', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '664', '82842262-5f27-5fcd-8cee-460338e1b2d4', '2017-06-14 07:19:31', '0', '90', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '665', '2c1d469a-baf3-51b1-a9b4-e4320326a489', '2017-06-14 07:19:31', '0', '90', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '666', '8d95afdc-6491-5d57-a434-45b3a7e3be1a', '2017-07-26 09:23:34', '0', '91', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '667', '526bc64b-5409-5905-835b-50112bec824e', '2017-07-26 09:23:34', '0', '91', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '668', '16feedc0-8076-5b0e-99d8-06a380361736', '2017-07-26 09:23:34', '0', '91', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '669', '5107e730-1745-5533-b7f6-b7b20fe5f81c', '2017-07-26 09:23:34', '0', '91', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '670', '43d7ac6d-cfbf-5138-b976-a9932d0c8a39', '2017-07-26 09:23:34', '0', '91', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '671', '8d93f9c5-5e9b-5b16-acc6-eb805f2e5fdd', '2017-07-26 09:23:34', '0', '91', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '672', '987da40e-6c8a-5db0-92e9-592c83fbadf8', '2017-07-26 09:23:34', '0', '91', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '673', 'f3c3fd14-d88f-55f4-b1d0-c5dd835fbea0', '2017-11-08 07:19:45', '0', '92', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '674', '1d70cbbc-147a-5a04-bbeb-1c7c77dca22e', '2017-11-08 07:19:45', '0', '92', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '675', '1fd7ac27-9174-5da2-99a6-b3fe740a12ce', '2017-11-08 07:19:45', '0', '92', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '676', 'e4097ae4-337e-594e-a45a-32c804153d07', '2017-11-08 07:19:45', '0', '92', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '677', 'b244cafa-a8f5-5f92-ab20-d33dbe1db1c4', '2017-11-08 07:19:45', '0', '92', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '678', '862920ba-884d-5b5b-98b4-501599e1b9af', '2017-05-01 14:13:05', '0', '93', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '679', 'd36df190-8fe8-5bec-95fe-f4cf704d2d82', '2017-05-01 14:13:05', '0', '93', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '680', '1df8016b-f93d-5a31-8e9c-6821ca43ff16', '2017-05-01 14:13:05', '0', '93', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '681', '31833d4d-7adf-5bdc-8999-b83a7112f658', '2017-05-01 14:13:05', '0', '93', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '682', '570a9a79-058e-5abd-b8c8-7a397cb3f1dd', '2017-11-08 07:19:45', '0', '92', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '683', 'a75b121f-6cbf-559f-a839-475629114169', '2017-05-01 14:13:05', '0', '93', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '684', '25651d3e-952e-5d79-be56-200d032ce245', '2017-05-01 14:13:05', '0', '93', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '685', 'aa263f30-8b6b-514f-a960-8c56ac5c5e28', '2017-05-01 14:13:05', '0', '93', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '686', 'fe7186dd-6bd7-53f1-86bc-aab58302ded9', '2017-05-01 14:13:05', '0', '93', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '687', 'd577f85d-79a6-5027-ba2e-f9176d4ae8fc', '2017-05-01 14:13:05', '0', '93', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '688', '2173cdf7-fda0-536e-8e79-26186bfae80f', '2017-03-23 21:51:51', '0', '94', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '689', '1e8224b7-5075-5629-8664-e0a778410516', '2017-03-23 21:51:51', '0', '94', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '690', '8ae4ad1c-7d11-5490-b159-85c7ee8dc72c', '2017-03-23 21:51:51', '0', '94', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '691', '7d9c3cc9-80cb-5d3d-8f98-cc363f17f5d0', '2017-03-23 21:51:51', '0', '94', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '692', '68757b09-f51c-5408-b3a0-fbd887a0b0f3', '2017-03-23 21:51:51', '0', '94', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '693', '873ceead-4cb3-555f-b26c-370dd9fca40a', '2017-03-23 21:51:51', '0', '94', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '694', '6e758622-9017-597a-b0d6-2a35ff3457e2', '2017-03-23 21:51:51', '0', '94', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '695', '23d95579-dc00-5bfe-abc2-f869cf52adf8', '2017-04-04 23:27:20', '0', '95', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '696', '25a3cbe6-e4a3-5f00-b410-c7fd4addb0b8', '2017-04-04 23:27:20', '0', '95', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '697', '0bec0f56-0934-5ce8-a1d3-a8ed41699a45', '2017-04-04 23:27:20', '0', '95', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '698', 'b2b413e5-fbe5-5849-9609-f50b2135e6d3', '2017-04-04 23:27:20', '0', '95', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '699', 'b75c20c5-bd13-5285-a117-5bf012180c76', '2017-04-04 23:27:20', '0', '95', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '700', 'd9b520a0-d2ac-5e15-8de4-33c53c4eee54', '2017-04-04 23:27:20', '0', '95', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '701', '1d2d9726-673f-5019-9670-4aead9eefaf6', '2017-09-11 01:47:30', '0', '96', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '702', '7a917a37-d01a-5abd-9ccc-7869c824324d', '2017-09-11 01:47:30', '0', '96', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '703', '6a0597e9-f49a-57af-bda3-b6a60bf9b9c8', '2017-09-11 01:47:30', '0', '96', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '704', '181cfb95-d271-5db0-9b77-dd4c17dfee96', '2017-09-11 01:47:30', '0', '96', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '705', '3dd7b717-5fd0-511c-a26e-a6b9814f08f8', '2017-09-11 01:47:30', '0', '96', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '706', '77a33bce-db59-5e27-ab51-2562b89a2a25', '2017-09-11 01:47:30', '0', '96', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '707', '4ced5a96-c744-5460-868a-dbb4fcb17b33', '2017-05-14 22:45:17', '0', '97', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '708', 'b8d12bb7-1d46-5a0b-ab2b-641a85cd872d', '2017-05-14 22:45:17', '0', '97', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '709', 'd80d7e41-fe09-567b-83ea-422c8027664f', '2017-05-14 22:45:17', '0', '97', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '710', '0e909a1c-b9e7-5d81-bf29-60e2761b0deb', '2017-05-14 22:45:17', '0', '97', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '711', '9f12dd66-121b-5a81-82f6-6f97d64409f2', '2017-05-14 22:45:17', '0', '97', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '712', '706c74af-cab6-5159-9413-eb92805ce5c5', '2017-02-06 12:13:49', '0', '98', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '713', '7415146b-c6b8-5bf4-8a27-52d5d9d4247e', '2017-02-06 12:13:49', '0', '98', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '714', '2b6563df-6e09-5a4d-97c3-e6be951e83fb', '2017-02-06 12:13:49', '0', '98', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '715', '6a6627a5-9865-5009-8ff6-baac6696d5a8', '2017-02-06 12:13:49', '0', '98', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '716', 'b609d881-595d-52d8-be57-6ea2600e4907', '2017-02-06 12:13:49', '0', '98', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '717', 'e1550699-215f-5010-9148-d80e67fd56b1', '2017-02-06 12:13:49', '0', '98', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '718', 'f9dfbec3-e364-5bf8-a4b1-673bd5c56693', '2017-02-06 12:13:49', '0', '98', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '719', '6625f7c7-7ded-55b4-99be-ff44c4d61e85', '2017-02-06 12:13:49', '0', '98', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '720', '1f61a4d4-4440-5852-bcaa-cc33879ba2e0', '2017-02-06 12:13:49', '0', '98', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '721', '6a2847a1-7e7e-5b73-9a20-63d702f8af09', '2017-09-02 02:54:41', '0', '99', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '722', '9c9174cd-47b5-5468-a891-4c4a2deafa52', '2017-09-02 02:54:41', '0', '99', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '723', 'a4a6ca13-9794-52e7-aa3f-47ff27a15295', '2017-09-02 02:54:41', '0', '99', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '724', '682d19dc-8913-5950-a56f-7623065287d7', '2017-09-02 02:54:41', '0', '99', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '725', 'd541aafc-3f7b-5f7e-9ec5-4086548a05d2', '2017-09-02 02:54:41', '0', '99', '1', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '726', 'd7ace972-049b-50f2-99fe-d47acc6cf7ec', '2017-12-07 09:16:19', '0', '100', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '727', '3ef9ae13-4ea2-5954-a503-853819e4fb75', '2017-12-07 09:16:19', '0', '100', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '728', 'a605d3be-b05d-50b6-acf5-2b3982c906d4', '2017-12-07 09:16:19', '0', '100', '4', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '729', '04d070bd-1714-5601-872c-5cad8e067c7a', '2017-12-07 09:16:19', '0', '100', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '730', '1edd98ac-5560-5414-8ebb-e1de578d329f', '2017-12-07 09:16:19', '0', '100', '3', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '731', '4671f2bb-6ca7-571a-87c2-237fab108b75', '2017-12-07 09:16:19', '0', '100', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '732', 'e3a90575-28a6-5b71-9e38-80b35df45b79', '2017-12-07 09:16:19', '0', '100', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '733', '48fa79b6-f9cf-593f-9191-544ca590c022', '2017-12-07 09:16:19', '0', '100', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '734', 'c5daa89f-2608-5bf2-9640-af87c6b11a72', '2017-12-07 09:16:19', '0', '100', '2', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '735', '8d423192-797a-5686-852d-1a051b9264cf', '2017-12-07 09:16:19', '0', '100', '5', NULL, NULL, '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '736', '1q6t3e4r57u8i3w2qder5', '2019-01-30 21:55:17', '1', '105', '3', '5', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '737', 'q26e7yu83retgbf863tdnd9', '2019-01-30 21:55:17', '1', '105', '1', '5', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '738', '9i8u7y6t5r4e3wqqdsh0', '2019-01-30 21:55:17', '1', '105', '2', '5', '2', '1' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '739', 'dgdt6454trg8j67hye74he7', '2019-01-30 22:10:18', '1', '3', '3', '1', '2', '0' );
INSERT INTO `Unit`(`id`,`code`,`creationDate`,`irradiated`,`orderId`,`unitTypeId`,`irradiationId`,`irradiatorUserId`,`version`) VALUES ( '740', 'tdtdg65648ehbe6373ujs', '2019-01-30 22:10:19', '1', '3', '1', '1', '2', '0' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "UnitType" ---------------------------------
LOCK TABLES `UnitType` WRITE;

INSERT INTO `UnitType`(`id`,`code`,`name`,`creationDate`,`billingDivider`,`enabled`) VALUES ( '1', 'AFR', 'Aféresis', '2019-01-21 19:39:48', '2', '1' );
INSERT INTO `UnitType`(`id`,`code`,`name`,`creationDate`,`billingDivider`,`enabled`) VALUES ( '2', 'GRN', 'Granulocitos', '2019-01-21 19:39:48', '1', '1' );
INSERT INTO `UnitType`(`id`,`code`,`name`,`creationDate`,`billingDivider`,`enabled`) VALUES ( '3', 'CP', 'Plaquetas', '2019-01-21 19:39:48', '4', '1' );
INSERT INTO `UnitType`(`id`,`code`,`name`,`creationDate`,`billingDivider`,`enabled`) VALUES ( '4', 'OTRO', 'Tipo de hemocomponente no identificado', '2019-01-21 19:39:48', '1', '1' );
INSERT INTO `UnitType`(`id`,`code`,`name`,`creationDate`,`billingDivider`,`enabled`) VALUES ( '5', 'CGR', 'Globulos Rojos', '2019-01-21 19:39:48', '1', '1' );
INSERT INTO `UnitType`(`id`,`code`,`name`,`creationDate`,`billingDivider`,`enabled`) VALUES ( '6', 'TNT', 'Test type', '2019-01-22 21:34:57', '1', '0' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "UnitTypeMapping" --------------------------
LOCK TABLES `UnitTypeMapping` WRITE;

INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '1', '1', '2', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '2', '1', '2', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '3', '2', '2', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '4', '3', '2', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '5', '1', '2', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '6', '5', '1', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '7', '0', '1', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '8', '3', '1', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '9', '0', '1', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '10', '1', '1', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '11', '1', '3', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '12', '1', '3', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '13', '1', '3', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '14', '1', '3', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '15', '1', '3', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '16', '0', '4', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '17', '2', '4', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '18', '3', '4', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '19', '2', '4', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '20', '0', '4', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '21', '0', '6', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '22', '3', '6', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '23', '3', '6', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '24', '3', '6', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '25', '0', '6', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '26', '2', '8', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '27', '1', '8', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '28', '2', '8', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '29', '0', '8', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '30', '1', '8', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '31', '1', '9', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '32', '3', '9', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '33', '1', '9', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '34', '1', '9', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '35', '1', '9', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '36', '0', '10', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '37', '4', '10', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '38', '2', '10', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '39', '1', '10', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '40', '0', '10', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '41', '0', '7', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '42', '1', '7', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '43', '0', '7', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '44', '1', '7', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '45', '4', '7', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '46', '0', '5', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '47', '3', '5', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '48', '3', '5', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '49', '2', '5', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '50', '1', '5', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '51', '1', '11', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '52', '2', '11', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '53', '2', '11', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '54', '1', '11', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '55', '1', '11', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '56', '1', '12', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '57', '2', '12', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '58', '2', '12', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '59', '2', '12', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '60', '0', '12', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '61', '3', '21', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '62', '1', '21', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '63', '1', '21', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '64', '0', '21', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '65', '1', '21', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '66', '1', '13', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '67', '5', '13', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '68', '0', '13', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '69', '0', '13', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '70', '2', '13', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '71', '1', '15', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '72', '3', '15', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '73', '4', '15', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '74', '1', '15', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '75', '0', '15', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '76', '1', '14', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '77', '1', '14', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '78', '1', '14', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '79', '2', '14', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '80', '2', '14', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '81', '0', '16', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '82', '4', '16', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '83', '1', '16', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '84', '4', '16', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '85', '1', '16', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '86', '0', '17', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '87', '1', '17', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '88', '3', '17', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '89', '2', '17', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '90', '2', '17', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '91', '1', '18', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '92', '0', '18', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '93', '3', '18', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '94', '1', '18', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '95', '1', '18', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '96', '1', '19', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '97', '0', '19', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '98', '2', '19', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '99', '3', '19', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '100', '0', '19', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '101', '0', '20', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '102', '2', '20', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '103', '1', '20', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '104', '3', '20', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '105', '0', '20', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '106', '3', '22', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '107', '2', '22', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '108', '2', '22', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '109', '1', '22', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '110', '0', '22', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '111', '1', '23', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '112', '1', '23', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '113', '0', '23', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '114', '1', '23', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '115', '2', '23', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '116', '2', '24', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '117', '1', '24', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '118', '2', '24', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '119', '1', '24', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '120', '0', '24', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '121', '1', '25', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '122', '1', '25', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '123', '3', '25', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '124', '1', '25', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '125', '1', '25', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '126', '1', '26', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '127', '2', '26', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '128', '0', '26', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '129', '4', '26', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '130', '1', '26', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '131', '2', '27', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '132', '2', '27', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '133', '1', '27', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '134', '1', '27', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '135', '0', '27', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '136', '2', '28', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '137', '0', '28', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '138', '3', '28', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '139', '3', '28', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '140', '1', '28', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '141', '0', '29', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '142', '2', '29', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '143', '1', '29', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '144', '3', '29', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '145', '1', '29', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '146', '1', '30', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '147', '2', '30', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '148', '0', '30', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '149', '2', '30', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '150', '0', '30', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '151', '0', '31', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '152', '3', '31', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '153', '1', '31', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '154', '1', '31', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '155', '1', '31', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '156', '2', '32', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '157', '2', '32', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '158', '2', '32', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '159', '0', '32', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '160', '0', '32', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '161', '0', '33', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '162', '3', '33', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '163', '5', '33', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '164', '1', '33', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '165', '1', '33', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '166', '2', '34', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '167', '0', '34', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '168', '4', '34', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '169', '2', '34', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '170', '1', '34', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '171', '1', '35', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '172', '7', '35', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '173', '1', '35', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '174', '0', '35', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '175', '0', '35', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '176', '0', '36', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '177', '2', '36', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '178', '1', '36', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '179', '3', '36', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '180', '2', '36', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '181', '0', '37', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '182', '3', '37', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '183', '3', '37', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '184', '2', '37', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '185', '1', '37', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '186', '1', '38', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '187', '0', '38', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '188', '2', '38', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '189', '1', '38', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '190', '2', '38', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '191', '0', '39', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '192', '2', '39', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '193', '3', '39', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '194', '2', '39', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '195', '1', '39', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '196', '1', '40', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '197', '1', '40', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '198', '2', '40', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '199', '2', '40', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '200', '1', '40', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '201', '0', '42', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '202', '1', '42', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '203', '2', '42', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '204', '0', '42', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '205', '2', '42', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '206', '0', '41', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '207', '3', '41', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '208', '0', '41', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '209', '4', '41', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '210', '1', '41', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '211', '0', '43', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '212', '2', '43', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '213', '1', '43', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '214', '1', '43', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '215', '1', '43', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '216', '1', '44', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '217', '1', '44', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '218', '1', '44', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '219', '2', '44', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '220', '0', '44', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '221', '2', '45', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '222', '2', '45', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '223', '3', '45', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '224', '0', '45', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '225', '3', '45', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '226', '1', '46', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '227', '0', '46', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '228', '3', '46', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '229', '1', '46', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '230', '1', '46', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '231', '0', '47', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '232', '2', '47', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '233', '3', '47', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '234', '0', '47', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '235', '1', '47', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '236', '4', '48', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '237', '0', '48', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '238', '1', '48', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '239', '1', '48', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '240', '2', '48', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '241', '3', '49', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '242', '0', '49', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '243', '3', '49', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '244', '0', '49', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '245', '0', '50', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '246', '2', '50', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '247', '2', '50', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '248', '0', '49', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '249', '3', '50', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '250', '0', '50', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '251', '1', '51', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '252', '1', '51', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '253', '2', '51', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '254', '2', '51', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '255', '0', '51', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '256', '0', '52', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '257', '0', '52', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '258', '3', '52', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '259', '1', '52', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '260', '2', '52', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '261', '2', '53', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '262', '1', '53', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '263', '4', '53', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '264', '1', '53', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '265', '2', '53', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '266', '0', '54', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '267', '1', '54', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '268', '4', '54', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '269', '3', '54', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '270', '0', '54', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '271', '2', '55', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '272', '3', '55', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '273', '0', '55', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '274', '1', '55', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '275', '0', '55', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '276', '1', '56', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '277', '2', '56', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '278', '3', '56', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '279', '2', '56', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '280', '0', '56', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '281', '4', '57', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '282', '2', '57', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '283', '3', '57', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '284', '0', '57', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '285', '0', '57', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '286', '0', '58', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '287', '1', '58', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '288', '4', '58', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '289', '3', '58', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '290', '2', '58', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '291', '1', '59', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '292', '2', '59', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '293', '2', '59', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '294', '0', '59', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '295', '3', '59', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '296', '1', '60', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '297', '2', '60', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '298', '1', '60', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '299', '1', '60', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '300', '0', '60', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '301', '0', '61', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '302', '3', '61', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '303', '3', '61', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '304', '2', '61', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '305', '1', '61', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '306', '2', '62', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '307', '1', '62', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '308', '1', '62', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '309', '1', '62', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '310', '1', '62', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '311', '1', '63', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '312', '3', '63', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '313', '2', '63', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '314', '2', '63', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '315', '1', '63', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '316', '1', '64', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '317', '4', '64', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '318', '2', '64', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '319', '1', '64', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '320', '1', '64', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '321', '1', '65', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '322', '4', '65', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '323', '0', '65', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '324', '3', '65', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '325', '1', '65', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '326', '2', '66', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '327', '3', '66', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '328', '1', '66', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '329', '3', '66', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '330', '0', '66', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '331', '0', '67', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '332', '2', '67', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '333', '3', '67', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '334', '1', '67', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '335', '0', '67', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '336', '0', '68', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '337', '1', '68', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '338', '2', '68', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '339', '2', '68', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '340', '1', '68', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '341', '0', '69', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '342', '3', '69', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '343', '2', '69', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '344', '1', '69', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '345', '0', '69', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '346', '0', '70', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '347', '2', '70', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '348', '2', '70', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '349', '0', '70', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '350', '2', '70', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '351', '2', '71', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '352', '1', '71', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '353', '3', '71', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '354', '3', '71', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '355', '1', '71', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '356', '0', '72', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '357', '2', '72', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '358', '0', '72', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '359', '2', '72', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '360', '2', '72', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '361', '0', '73', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '362', '3', '73', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '363', '0', '73', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '364', '1', '73', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '365', '1', '73', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '366', '1', '74', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '367', '1', '74', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '368', '3', '74', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '369', '1', '74', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '370', '0', '74', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '371', '1', '75', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '372', '3', '75', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '373', '3', '75', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '374', '2', '75', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '375', '0', '75', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '376', '1', '76', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '377', '1', '76', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '378', '2', '76', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '379', '2', '76', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '380', '3', '76', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '381', '0', '79', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '382', '2', '79', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '383', '3', '79', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '384', '3', '79', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '385', '1', '79', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '386', '0', '81', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '387', '1', '81', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '388', '2', '81', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '389', '2', '81', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '390', '1', '81', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '391', '2', '80', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '392', '2', '80', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '393', '4', '80', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '394', '2', '80', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '395', '0', '80', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '396', '0', '82', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '397', '2', '82', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '398', '2', '82', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '399', '1', '82', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '400', '3', '82', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '401', '0', '77', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '402', '1', '77', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '403', '1', '77', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '404', '4', '77', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '405', '0', '77', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '406', '0', '78', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '407', '2', '78', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '408', '4', '78', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '409', '1', '78', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '410', '1', '78', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '411', '0', '83', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '412', '1', '83', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '413', '3', '83', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '414', '2', '83', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '415', '1', '83', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '416', '0', '84', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '417', '3', '84', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '418', '3', '84', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '419', '1', '84', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '420', '0', '84', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '421', '0', '85', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '422', '3', '85', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '423', '4', '85', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '424', '2', '85', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '425', '0', '85', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '426', '0', '86', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '427', '3', '86', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '428', '3', '86', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '429', '3', '86', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '430', '1', '86', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '431', '0', '87', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '432', '2', '87', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '433', '4', '87', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '434', '1', '87', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '435', '1', '87', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '436', '0', '88', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '437', '0', '88', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '438', '2', '88', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '439', '2', '88', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '440', '4', '88', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '441', '1', '89', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '442', '1', '89', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '443', '2', '89', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '444', '2', '89', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '445', '0', '89', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '446', '0', '90', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '447', '1', '90', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '448', '2', '90', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '449', '5', '90', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '450', '1', '90', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '451', '1', '91', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '452', '1', '91', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '453', '2', '91', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '454', '3', '91', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '455', '0', '91', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '456', '1', '92', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '457', '1', '92', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '458', '2', '92', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '459', '1', '92', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '460', '1', '92', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '461', '2', '93', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '462', '4', '93', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '463', '3', '93', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '464', '0', '93', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '465', '0', '93', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '466', '0', '94', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '467', '0', '94', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '468', '2', '94', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '469', '5', '94', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '470', '0', '94', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '471', '0', '95', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '472', '1', '95', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '473', '3', '95', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '474', '1', '95', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '475', '1', '95', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '476', '2', '96', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '477', '1', '96', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '478', '0', '96', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '479', '1', '96', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '480', '2', '96', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '481', '1', '97', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '482', '0', '97', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '483', '1', '97', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '484', '1', '97', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '485', '2', '97', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '486', '1', '98', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '487', '1', '98', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '488', '3', '98', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '489', '1', '98', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '490', '3', '98', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '491', '1', '99', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '492', '1', '99', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '493', '1', '99', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '494', '0', '99', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '495', '2', '99', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '496', '0', '100', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '497', '3', '100', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '498', '3', '100', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '499', '1', '100', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '500', '3', '100', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '504', '2', '3', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '505', '2', '2', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '506', '1', '2', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '507', '3', '2', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '508', '1', '2', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '509', '1', '2', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '518', '1', '4', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '519', '1', '4', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '520', '1', '4', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '521', '1', '4', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '522', '1', '4', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '523', '1', '4', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '524', '1', '4', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '525', '1', '16', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '526', '1', '16', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '527', '1', '16', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '528', '1', '16', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '529', '1', '16', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '530', '1', '16', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '531', '1', '16', '3' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '532', '1', '16', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '533', '1', '16', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '534', '1', '16', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '535', '1', '9', '5' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '536', '1', '9', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '537', '1', '9', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '538', '1', '9', '1' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '539', '1', '9', '4' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '540', '1', '9', '2' );
INSERT INTO `UnitTypeMapping`(`id`,`count`,`orderId`,`unitTypeId`) VALUES ( '541', '1', '9', '3' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "XACL" -------------------------------------
-- ---------------------------------------------------------


-- Dump data of "XAccessToken" -----------------------------
-- ---------------------------------------------------------


-- Dump data of "XRole" ------------------------------------
LOCK TABLES `XRole` WRITE;

INSERT INTO `XRole`(`id`,`description`,`name`,`creationDate`,`modified`,`version`) VALUES ( '1', 'Operadores técnicos del Banco de Sangre', 'operator', '2019-01-21 19:39:48', '2019-01-21 19:39:48', '' );
INSERT INTO `XRole`(`id`,`description`,`name`,`creationDate`,`modified`,`version`) VALUES ( '2', 'Administradores del Banco de Sangre', 'admin', '2019-01-21 19:39:48', '2019-01-21 19:39:48', '' );
INSERT INTO `XRole`(`id`,`description`,`name`,`creationDate`,`modified`,`version`) VALUES ( '3', 'Usuarios externos al Banco', 'client', '2019-01-21 19:39:48', '2019-01-21 19:39:48', '' );
INSERT INTO `XRole`(`id`,`description`,`name`,`creationDate`,`modified`,`version`) VALUES ( '4', 'Usuarios externos al Banco', 'client', '2019-01-21 19:39:48', '2019-01-21 19:39:48', '' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "XRoleMapping" -----------------------------
LOCK TABLES `XRoleMapping` WRITE;

INSERT INTO `XRoleMapping`(`id`,`description`,`principalType`,`principalId`,`roleId`) VALUES ( '1', NULL, NULL, '1', '1' );
INSERT INTO `XRoleMapping`(`id`,`description`,`principalType`,`principalId`,`roleId`) VALUES ( '2', NULL, NULL, '2', '1' );
INSERT INTO `XRoleMapping`(`id`,`description`,`principalType`,`principalId`,`roleId`) VALUES ( '3', NULL, NULL, '2', '2' );
INSERT INTO `XRoleMapping`(`id`,`description`,`principalType`,`principalId`,`roleId`) VALUES ( '4', NULL, NULL, '3', '4' );
INSERT INTO `XRoleMapping`(`id`,`description`,`principalType`,`principalId`,`roleId`) VALUES ( '5', NULL, NULL, '4', '4' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "XUser" ------------------------------------
LOCK TABLES `XUser` WRITE;

INSERT INTO `XUser`(`id`,`firstname`,`lastname`,`avatarUrl`,`dni`,`isInternal`,`creationDate`,`accountConfirmed`,`active`,`orderCount`,`realm`,`username`,`password`,`email`,`emailVerified`,`verificationToken`,`institutionId`,`version`) VALUES ( '1', 'Juan', 'Perez', '/assets/avatar.svg', '30123323', '1', '2019-01-21 19:39:48', '1', '1', '0', NULL, 'operador', '$2a$10$TggEiELu1ZLjgn48RKfwJ.sh1Kgv9pgfe.iJk..01i304SPiZ4hd.', 'user1@dummy.com', '0', 'c2f6dd53-6824-4eca-9023-5647c34fbf87', NULL, '0' );
INSERT INTO `XUser`(`id`,`firstname`,`lastname`,`avatarUrl`,`dni`,`isInternal`,`creationDate`,`accountConfirmed`,`active`,`orderCount`,`realm`,`username`,`password`,`email`,`emailVerified`,`verificationToken`,`institutionId`,`version`) VALUES ( '2', 'Jimena', 'Perez', '/assets/avatar.svg', '30123343', '1', '2019-01-21 19:39:48', '1', '1', '0', NULL, 'administrador', '$2a$10$eFlv819LPoLrqGuW5sDVNeIZABxE9Iua.uevs7t7U84NmvQUISAyW', 'user2@dummy.com', '0', '52174e2c-1b4d-4a7f-a586-4718d00a906a', NULL, '0' );
INSERT INTO `XUser`(`id`,`firstname`,`lastname`,`avatarUrl`,`dni`,`isInternal`,`creationDate`,`accountConfirmed`,`active`,`orderCount`,`realm`,`username`,`password`,`email`,`emailVerified`,`verificationToken`,`institutionId`,`version`) VALUES ( '3', 'Pedro', 'Fernandez', '/assets/avatar.svg', '30123325', '0', '2019-01-21 19:39:48', '1', '1', '49', NULL, 'cliente1', '$2a$10$P0kxrcumeIPxjW4znaxACOLS6iGYgnI.Ue9UClJERJTTxmDnBtCS.', 'user3@dummy.com', '0', '2be7f6c9-7bd2-4246-aee3-87b25e1f01ff', '5', '0' );
INSERT INTO `XUser`(`id`,`firstname`,`lastname`,`avatarUrl`,`dni`,`isInternal`,`creationDate`,`accountConfirmed`,`active`,`orderCount`,`realm`,`username`,`password`,`email`,`emailVerified`,`verificationToken`,`institutionId`,`version`) VALUES ( '4', 'Juan', 'Fernandez', '/assets/avatar.svg', '30123326', '0', '2019-01-21 19:39:48', '1', '1', '51', NULL, 'cliente2', '$2a$10$3baYa/w1faknZu6QmTC4L.NASvDQvQnyFf6sr95doBy605lJRhuv2', 'user4@dummy.com', '0', '84a0cd55-4b8b-456f-8880-2b2ab39548b0', '7', '0' );
INSERT INTO `XUser`(`id`,`firstname`,`lastname`,`avatarUrl`,`dni`,`isInternal`,`creationDate`,`accountConfirmed`,`active`,`orderCount`,`realm`,`username`,`password`,`email`,`emailVerified`,`verificationToken`,`institutionId`,`version`) VALUES ( '17', 'test', 'test', '/assets/avatar.svg', '12345678', '0', '2019-02-18 20:53:13', '0', '0', '0', NULL, 'test', '$2a$10$OnrfE9cfyFxM1c2z56PDzuGDAAou6cD7KaUpfcy/q2cd6SvEspVVC', 'molina.grm@gmail.com', '0', 'dfc80630-f739-47d8-b18d-ed8d2cb0a210', '1', '0' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- Dump data of "Comment" ----------------------------------
LOCK TABLES `Comment` WRITE;

INSERT INTO `Comment`(`id`,`text`,`creationDate`,`orderId`,`operatorId`) VALUES ( '1', 'test comments sin irradiar.', '2019-02-20 18:17:32', '14', '1' );
INSERT INTO `Comment`(`id`,`text`,`creationDate`,`orderId`,`operatorId`) VALUES ( '2', 'test comments post irradiacion', '2019-02-20 19:26:49', '14', '1' );
UNLOCK TABLES;

-- ---------------------------------------------------------


-- CREATE INDEX "index_version" --------------------------------
CREATE INDEX `index_version` USING BTREE ON `ConfigElement`( `version` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_version1" -------------------------------
CREATE INDEX `index_version1` USING BTREE ON `Institution`( `version` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_version2" -------------------------------
CREATE INDEX `index_version2` USING BTREE ON `Irradiation`( `version` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_version3" -------------------------------
CREATE INDEX `index_version3` USING BTREE ON `OrderInfo`( `version` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_version4" -------------------------------
CREATE INDEX `index_version4` USING BTREE ON `Unit`( `version` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_version6" -------------------------------
CREATE INDEX `index_version6` USING BTREE ON `XRole`( `version` );
-- -------------------------------------------------------------


-- CREATE INDEX "principalId" ----------------------------------
CREATE INDEX `principalId` USING BTREE ON `XRoleMapping`( `principalId` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_version5" -------------------------------
CREATE INDEX `index_version5` USING BTREE ON `XUser`( `version` );
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


