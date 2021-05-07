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
  `name` varchar(20) NOT NULL COMMENT '收件人姓名',
  `phone` int(20) NOT NULL COMMENT '收件人电话',
  `addr` varbinary(30) NOT NULL COMMENT '收件人地址',
  `created_at` datetime NOT NULL COMMENT '收货信息创建时间',
  `updated_at` datetime NOT NULL COMMENT '收获信息更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `addrs` */

/*Table structure for table `feedbacks` */

DROP TABLE IF EXISTS `feedbacks`;

CREATE TABLE `feedbacks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈id',
  `number` varchar(20) NOT NULL COMMENT '反馈编号',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `description` varchar(200) NOT NULL COMMENT '反馈描述',
  `created_at` datetime NOT NULL COMMENT '反馈创建时间',
  `updated_at` datetime NOT NULL COMMENT '反馈更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feedbacks` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `number` varchar(20) NOT NULL COMMENT '商品编号',
  `name` varchar(20) NOT NULL COMMENT '商品名称',
  `owner` varchar(20) NOT NULL COMMENT '商品所有者',
  `description` text NOT NULL COMMENT '商品描述',
  `deadline` datetime NOT NULL COMMENT '商品上架截止时间',
  `cover_image` varchar(100) NOT NULL COMMENT '商品封面图片地址',
  `publicity_video` varchar(100) NOT NULL COMMENT '商品宣传视频地址',
  `issuer` varchar(10) NOT NULL COMMENT '发行方',
  `sale_quantity` int(100) NOT NULL COMMENT '商品销售记录',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `number` varchar(20) NOT NULL COMMENT '订单编号',
  `user_id` int(11) NOT NULL COMMENT '订单用户id',
  `addr` varchar(20) NOT NULL COMMENT '订单用户地址',
  `quantity` int(10) NOT NULL COMMENT '订单数量',
  `good_id` int(10) NOT NULL COMMENT '商品id',
  `mailing_type` varchar(20) NOT NULL COMMENT '寄件类型',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `open_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信用户唯一标识符',
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信临时密钥',
  `uionid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信uionid',
  `head_portrait` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户头像',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户令牌',
  `addr` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户号码',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
