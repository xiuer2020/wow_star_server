/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.26-log : Database - wow_star
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wow_star` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wow_star`;

/*Table structure for table `addrs` */

DROP TABLE IF EXISTS `addrs`;

CREATE TABLE `addrs` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收获地址id',
  `user_id` varchar(20) NOT NULL COMMENT '用户id',
  `name` varchar(20) DEFAULT NULL COMMENT '收件人姓名',
  `phone` int(20) DEFAULT NULL COMMENT '收件人电话',
  `addr` varbinary(30) DEFAULT NULL COMMENT '收件人地址',
  `created_at` datetime DEFAULT NULL COMMENT '收货信息创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '收获信息更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `addrs` */

insert  into `addrs`(`id`,`user_id`,`name`,`phone`,`addr`,`created_at`,`updated_at`) values 
(1,'openId','addresseeName',NULL,'addresseeAddr','2021-04-30 09:12:44','2021-04-30 09:12:44'),
(2,'openId','addresseeName',NULL,'addresseeAddr','2021-04-30 09:13:02','2021-04-30 09:13:02'),
(3,'openId','addresseeName',NULL,'addresseeAddr','2021-04-30 09:13:37','2021-04-30 09:13:37'),
(4,'openId',NULL,NULL,NULL,'2021-04-30 09:24:04','2021-04-30 09:24:04');

/*Table structure for table `feedbacks` */

DROP TABLE IF EXISTS `feedbacks`;

CREATE TABLE `feedbacks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈id',
  `number` varchar(20) DEFAULT NULL COMMENT '反馈编号',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `description` varchar(200) DEFAULT NULL COMMENT '反馈描述',
  `created_at` datetime DEFAULT NULL COMMENT '反馈创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '反馈更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `feedbacks` */

insert  into `feedbacks`(`id`,`number`,`user_id`,`description`,`created_at`,`updated_at`) values 
(7,'f1619769247',1,'decription','2021-04-30 07:54:07','2021-04-30 07:54:07'),
(8,'f1619772014',1,'decription','2021-04-30 08:40:14','2021-04-30 08:40:14'),
(9,'f1619772038',1,'decription','2021-04-30 08:40:38','2021-04-30 08:40:38');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `number` varchar(20) DEFAULT NULL COMMENT '商品编号',
  `name` varchar(20) DEFAULT NULL COMMENT '商品名称',
  `owner` varchar(20) DEFAULT NULL COMMENT '商品所有者',
  `description` text COMMENT '商品描述',
  `deadline` datetime DEFAULT NULL COMMENT '商品上架截止时间',
  `cover_image` varchar(100) DEFAULT NULL COMMENT '商品封面图片地址',
  `publicity_video` varchar(100) DEFAULT NULL COMMENT '商品宣传视频地址',
  `issuer` varchar(10) DEFAULT NULL COMMENT '发行方',
  `sale_quantity` int(100) DEFAULT NULL COMMENT '商品销售记录',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`number`,`name`,`owner`,`description`,`deadline`,`cover_image`,`publicity_video`,`issuer`,`sale_quantity`,`created_at`,`updated_at`) values 
(1,'2','name','owner','description',NULL,'cover_image','publicity_video','issuer',20,'2021-04-30 16:29:46','2021-04-30 08:39:27');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `number` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `user_id` int(11) DEFAULT NULL COMMENT '订单用户id',
  `addr` varchar(20) DEFAULT NULL COMMENT '订单用户地址',
  `quantity` int(10) DEFAULT NULL COMMENT '订单数量',
  `good_id` int(10) DEFAULT NULL COMMENT '商品id',
  `mailing_type` varchar(20) DEFAULT NULL COMMENT '寄件类型',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`number`,`user_id`,`addr`,`quantity`,`good_id`,`mailing_type`,`created_at`,`updated_at`) values 
(12,'ws1619771960',2,'广州',2,1,'mailingType','2021-04-30 08:39:20','2021-04-30 08:39:20'),
(13,'ws1619771967',2,'广州',2,1,'mailingType','2021-04-30 08:39:27','2021-04-30 08:39:27');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `open_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信用户唯一标识符',
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信临时密钥',
  `uionid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信uionid',
  `head_portrait` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户令牌',
  `addr` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户号码',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`open_id`,`session_key`,`uionid`,`head_portrait`,`remember_token`,`addr`,`phone`,`created_at`,`updated_at`) values 
(66,'openId','session_key','unionid','headPortrait','rememberToken',NULL,NULL,'2021-04-30 08:27:20','2021-05-06 00:55:44');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
