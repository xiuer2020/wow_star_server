/*
SQLyog Community
MySQL - 5.7.26-log : Database - wow_star
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `addresses` */

CREATE TABLE `addresses` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收获地址id',
  `openid` varchar(100) NOT NULL COMMENT '用户微信open_id',
  `name` varchar(20) NOT NULL COMMENT '收件人姓名',
  `region` varchar(20) NOT NULL COMMENT '收件人所在地区',
  `phone` varchar(20) NOT NULL COMMENT '收件人电话',
  `detail_address` varbinary(30) DEFAULT NULL COMMENT '收件人详细地址',
  `current_address` tinyint(4) NOT NULL COMMENT '是否为当前地址',
  `created_at` datetime NOT NULL COMMENT '收货信息创建时间',
  `updated_at` datetime NOT NULL COMMENT '收获信息更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `addresses` */

insert  into `addresses`(`id`,`openid`,`name`,`region`,`phone`,`detail_address`,`current_address`,`created_at`,`updated_at`) values 
(1,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','name','region','name','详细地址',1,'2021-05-07 17:16:28','2021-05-13 17:41:52'),
(2,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','name','region','name','详细地址',0,'2021-05-07 17:34:55','2021-05-13 17:37:39'),
(3,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','name','region','name','详细地址1',0,'2021-05-07 17:43:16','2021-05-13 17:37:43'),
(4,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','name','region','name','sitj',0,'2021-05-07 17:48:43','2021-05-13 17:41:52'),
(5,'openId','name','region','name','sitedetailSite',0,'2021-05-07 17:49:23','2021-05-08 15:29:33'),
(6,'openId','name','region','123','addr',0,'2021-05-08 09:02:34','2021-05-08 15:29:33'),
(7,'openId','name','region','name','detailSite',0,'2021-05-08 15:12:19','2021-05-08 15:29:33'),
(8,'openId','name','region','name','detailAddr',0,'2021-05-08 15:13:20','2021-05-08 15:29:33'),
(9,'openId','name','region','name','detailAddr',0,'2021-05-08 15:14:50','2021-05-08 15:29:33'),
(10,'openId','name','region','name','detailAddr',0,'2021-05-08 15:16:07','2021-05-08 15:29:33'),
(11,'openId','name','region','name','detailSite',0,'2021-05-08 15:16:52','2021-05-08 15:29:33'),
(12,'openId','name','region','name','detailAddr',0,'2021-05-08 15:18:44','2021-05-08 15:29:33'),
(13,'openId','name','region','name','detailAddr',0,'2021-05-08 15:21:44','2021-05-08 15:29:33'),
(14,'openId','name','region','name','detailAddr',0,'2021-05-08 15:23:51','2021-05-08 15:29:33'),
(15,'openId','name','region','name','detailAddr',0,'2021-05-08 15:25:29','2021-05-08 15:29:33'),
(16,'openId','name','region','name','detailAddr',0,'2021-05-08 15:25:48','2021-05-08 15:29:33'),
(17,'openId','name','region','name','detailAddr',0,'2021-05-08 15:25:55','2021-05-08 15:29:33'),
(18,'openId','name','region','name','detailAddr',0,'2021-05-08 15:26:29','2021-05-08 15:29:33'),
(19,'openId','name','region','name','detailAddr',0,'2021-05-08 15:29:33','2021-05-08 15:43:58'),
(20,'openId','name','region','name','detailAddr',0,'2021-05-08 15:46:09','2021-05-08 15:46:25'),
(21,'openId','name','region','name','detailAddr',0,'2021-05-08 15:46:25','2021-05-08 15:49:28');

/*Table structure for table `admin_menu` */

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_menu` */

insert  into `admin_menu`(`id`,`parent_id`,`order`,`title`,`icon`,`uri`,`permission`,`created_at`,`updated_at`) values 
(1,0,1,'Dashboard','fa-bar-chart','/',NULL,NULL,NULL),
(2,0,2,'Admin','fa-tasks','',NULL,NULL,NULL),
(3,2,3,'Users','fa-users','auth/users',NULL,NULL,NULL),
(4,2,4,'Roles','fa-user','auth/roles',NULL,NULL,NULL),
(5,2,5,'Permission','fa-ban','auth/permissions',NULL,NULL,NULL),
(6,2,6,'Menu','fa-bars','auth/menu',NULL,NULL,NULL),
(7,2,7,'Operation log','fa-history','auth/logs',NULL,NULL,NULL);

/*Table structure for table `admin_operation_log` */

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_operation_log` */

insert  into `admin_operation_log`(`id`,`user_id`,`path`,`method`,`ip`,`input`,`created_at`,`updated_at`) values 
(1,1,'admin','GET','127.0.0.1','[]','2021-05-07 03:52:13','2021-05-07 03:52:13'),
(2,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 03:52:22','2021-05-07 03:52:22'),
(3,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 03:52:26','2021-05-07 03:52:26'),
(4,1,'admin/users','POST','127.0.0.1','{\"name\":\"zhifeng pan\",\"email\":\"admin@163.com\",\"email_verified_at\":\"2021-05-07 03:52:26\",\"password\":\"admin\",\"remember_token\":\"hkj\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}','2021-05-07 03:54:22','2021-05-07 03:54:22'),
(5,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 03:54:22','2021-05-07 03:54:22'),
(6,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 03:54:53','2021-05-07 03:54:53'),
(7,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 03:56:53','2021-05-07 03:56:53'),
(8,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 03:56:57','2021-05-07 03:56:57'),
(9,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 03:57:01','2021-05-07 03:57:01'),
(10,1,'admin/goods','POST','127.0.0.1','{\"number\":\"number\",\"name\":\"name\",\"owner\":\"owner\",\"description\":\"description\",\"deadline\":\"2021-05-07 03:57:01\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"4\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods\"}','2021-05-07 03:58:15','2021-05-07 03:58:15'),
(11,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 03:58:15','2021-05-07 03:58:15'),
(12,1,'admin/goods/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 03:59:14','2021-05-07 03:59:14'),
(13,1,'admin/goods/1/edit','GET','127.0.0.1','[]','2021-05-07 03:59:49','2021-05-07 03:59:49'),
(14,1,'admin/goods/1/edit','GET','127.0.0.1','[]','2021-05-07 04:03:49','2021-05-07 04:03:49'),
(15,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 04:03:52','2021-05-07 04:03:52'),
(16,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 04:03:53','2021-05-07 04:03:53'),
(17,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 04:04:00','2021-05-07 04:04:00'),
(18,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 05:39:39','2021-05-07 05:39:39'),
(19,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 05:42:10','2021-05-07 05:42:10'),
(20,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 05:46:03','2021-05-07 05:46:03'),
(21,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 05:46:05','2021-05-07 05:46:05'),
(22,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 05:46:12','2021-05-07 05:46:12'),
(23,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 05:46:14','2021-05-07 05:46:14'),
(24,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 05:50:09','2021-05-07 05:50:09'),
(25,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 05:50:13','2021-05-07 05:50:13'),
(26,1,'admin/goods/create','GET','127.0.0.1','[]','2021-05-07 05:51:18','2021-05-07 05:51:18'),
(27,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 05:51:36','2021-05-07 05:51:36'),
(28,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":\"1\"}','2021-05-07 05:52:00','2021-05-07 05:52:00'),
(29,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 05:52:02','2021-05-07 05:52:02'),
(30,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":\"2\"}','2021-05-07 05:52:07','2021-05-07 05:52:07'),
(31,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 05:52:49','2021-05-07 05:52:49'),
(32,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 05:52:59','2021-05-07 05:52:59'),
(33,1,'admin/goods/create','GET','127.0.0.1','[]','2021-05-07 05:54:47','2021-05-07 05:54:47'),
(34,1,'admin','GET','127.0.0.1','[]','2021-05-07 05:55:11','2021-05-07 05:55:11'),
(35,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 05:55:25','2021-05-07 05:55:25'),
(36,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 05:55:30','2021-05-07 05:55:30'),
(37,1,'admin/users','POST','127.0.0.1','{\"name\":null,\"addr\":null,\"open_id\":null,\"remember_token\":null,\"head_portrait\":null,\"phone\":null,\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/users\"}','2021-05-07 05:57:14','2021-05-07 05:57:14'),
(38,1,'admin/users/create','GET','127.0.0.1','[]','2021-05-07 05:57:14','2021-05-07 05:57:14'),
(39,1,'admin/users','POST','127.0.0.1','{\"name\":null,\"addr\":null,\"open_id\":\"openId\",\"remember_token\":null,\"head_portrait\":null,\"phone\":null,\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\"}','2021-05-07 05:57:29','2021-05-07 05:57:29'),
(40,1,'admin/users/create','GET','127.0.0.1','[]','2021-05-07 05:57:29','2021-05-07 05:57:29'),
(41,1,'admin/users','POST','127.0.0.1','{\"name\":\"name\",\"addr\":\"addr\",\"open_id\":\"openId\",\"remember_token\":\"rememberToken\",\"head_portrait\":\"\\/assets\\/images\\/item-tab.png\",\"phone\":\"11111111111\",\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\"}','2021-05-07 05:58:32','2021-05-07 05:58:32'),
(42,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 05:58:32','2021-05-07 05:58:32'),
(43,1,'admin/goods/create','GET','127.0.0.1','[]','2021-05-07 05:58:45','2021-05-07 05:58:45'),
(44,1,'admin/goods','GET','127.0.0.1','{\"id\":\"2\",\"_pjax\":\"#pjax-container\"}','2021-05-07 05:59:34','2021-05-07 05:59:34'),
(45,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null}','2021-05-07 05:59:44','2021-05-07 05:59:44'),
(46,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 06:00:01','2021-05-07 06:00:01'),
(47,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"description\",\"deadline\":null,\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"4\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods?&id=\"}','2021-05-07 06:00:20','2021-05-07 06:00:20'),
(48,1,'admin/goods/create','GET','127.0.0.1','[]','2021-05-07 06:00:21','2021-05-07 06:00:21'),
(49,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"description\",\"deadline\":\"4545\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"4\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\"}','2021-05-07 06:02:16','2021-05-07 06:02:16'),
(50,1,'admin/goods/create','GET','127.0.0.1','[]','2021-05-07 06:02:16','2021-05-07 06:02:16'),
(51,1,'admin/goods/create','GET','127.0.0.1','[]','2021-05-07 06:03:17','2021-05-07 06:03:17'),
(52,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 06:03:51','2021-05-07 06:03:51'),
(53,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 06:03:59','2021-05-07 06:03:59'),
(54,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"Description\",\"deadline\":\"2021-05-07 06:03:59\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"4\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods\"}','2021-05-07 06:04:12','2021-05-07 06:04:12'),
(55,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 06:04:12','2021-05-07 06:04:12'),
(56,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 06:04:15','2021-05-07 06:04:15'),
(57,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"Description\",\"deadline\":\"2021-05-07 06:04:15\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"3\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods\"}','2021-05-07 06:04:26','2021-05-07 06:04:26'),
(58,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 06:04:26','2021-05-07 06:04:26'),
(59,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 06:06:47','2021-05-07 06:06:47'),
(60,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"Description\",\"deadline\":\"2021-05-07 06:06:47\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"10\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods\"}','2021-05-07 06:07:03','2021-05-07 06:07:03'),
(61,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 06:07:03','2021-05-07 06:07:03'),
(62,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:29:56','2021-05-07 14:29:56'),
(63,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 06:30:34','2021-05-07 06:30:34'),
(64,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 06:30:34','2021-05-07 06:30:34'),
(65,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 06:30:46','2021-05-07 06:30:46'),
(66,1,'admin/users','POST','127.0.0.1','{\"name\":\"name\",\"addr\":\"addr\",\"open_id\":\"openId\",\"remember_token\":\"rememberToken\",\"head_portrait\":\"\\/assets\\/images\\/item-tab.png\",\"phone\":\"11111111111\",\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/users\"}','2021-05-07 06:30:58','2021-05-07 06:30:58'),
(67,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 06:30:58','2021-05-07 06:30:58'),
(68,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 14:31:27','2021-05-07 14:31:27'),
(69,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:32:58','2021-05-07 14:32:58'),
(70,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:33:04','2021-05-07 14:33:04'),
(71,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 14:33:14','2021-05-07 14:33:14'),
(72,1,'admin/goods','POST','127.0.0.1','{\"name\":\"zhifeng pan\",\"owner\":\"owner\",\"description\":\"Description\",\"deadline\":\"2021-05-07 14:33:14\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"0\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods\"}','2021-05-07 14:33:25','2021-05-07 14:33:25'),
(73,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:33:26','2021-05-07 14:33:26'),
(74,1,'admin/users','GET','127.0.0.1','[]','2021-05-07 14:33:51','2021-05-07 14:33:51'),
(75,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:34:09','2021-05-07 14:34:09'),
(76,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 14:34:32','2021-05-07 14:34:32'),
(77,1,'admin/goods','POST','127.0.0.1','{\"name\":\"zhifeng pan\",\"owner\":\"owner\",\"description\":\"Description\",\"deadline\":\"2021-05-07 14:34:32\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"3\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods\"}','2021-05-07 14:34:53','2021-05-07 14:34:53'),
(78,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:34:53','2021-05-07 14:34:53'),
(79,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:36:35','2021-05-07 14:36:35'),
(80,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 14:36:44','2021-05-07 14:36:44'),
(81,1,'admin/goods','POST','127.0.0.1','{\"name\":\"zhifeng pan\",\"owner\":\"owner\",\"description\":\"Description\",\"deadline\":\"2021-05-07 14:36:44\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"10\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods\"}','2021-05-07 14:36:59','2021-05-07 14:36:59'),
(82,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:36:59','2021-05-07 14:36:59'),
(83,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:37:53','2021-05-07 14:37:53'),
(84,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 14:37:59','2021-05-07 14:37:59'),
(85,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"Description\",\"deadline\":\"2021-05-07 14:37:59\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"10\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods\"}','2021-05-07 14:38:12','2021-05-07 14:38:12'),
(86,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:38:12','2021-05-07 14:38:12'),
(87,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:40:56','2021-05-07 14:40:56'),
(88,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:55:15','2021-05-07 14:55:15'),
(89,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 14:55:18','2021-05-07 14:55:18'),
(90,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"Description\",\"deadline\":\"2021-05-07 14:55:18\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"10\",\"_token\":\"HwnizQeNmckdvJ54gQe2vpiZI08f43hXZAy2mAHj\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/goods\"}','2021-05-07 14:55:33','2021-05-07 14:55:33'),
(91,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:55:33','2021-05-07 14:55:33'),
(92,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 14:56:30','2021-05-07 14:56:30'),
(93,1,'admin/goods/create','GET','127.0.0.1','[]','2021-05-07 14:58:07','2021-05-07 14:58:07'),
(94,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 14:58:13','2021-05-07 14:58:13'),
(95,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:58:15','2021-05-07 14:58:15'),
(96,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 14:58:20','2021-05-07 14:58:20'),
(97,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 14:59:27','2021-05-07 14:59:27'),
(98,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:11:46','2021-05-07 15:11:46'),
(99,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:11:54','2021-05-07 15:11:54'),
(100,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"\\u5546\\u54c1\\u6240\\u6709\\u8005\",\"deadline\":\"2021-05-22 15:11:57\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"10\",\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/goods\"}','2021-05-07 15:12:45','2021-05-07 15:12:45'),
(101,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:12:45','2021-05-07 15:12:45'),
(102,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:15:32','2021-05-07 15:15:32'),
(103,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:15:57','2021-05-07 15:15:57'),
(104,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:15:58','2021-05-07 15:15:58'),
(105,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:15:59','2021-05-07 15:15:59'),
(106,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:16:02','2021-05-07 15:16:02'),
(107,1,'admin/goods/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:16:04','2021-05-07 15:16:04'),
(108,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:16:08','2021-05-07 15:16:08'),
(109,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:16:12','2021-05-07 15:16:12'),
(110,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:16:16','2021-05-07 15:16:16'),
(111,1,'admin/goods/2','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:16:20','2021-05-07 15:16:20'),
(112,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:16:36','2021-05-07 15:16:36'),
(113,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:17:05','2021-05-07 15:17:05'),
(114,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:17:07','2021-05-07 15:17:07'),
(115,1,'admin/goods/2','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:17:10','2021-05-07 15:17:10'),
(116,1,'admin/goods/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:18:01','2021-05-07 15:18:01'),
(117,1,'admin/goods/2/edit','GET','127.0.0.1','[]','2021-05-07 15:18:24','2021-05-07 15:18:24'),
(118,1,'admin/goods/2','PUT','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"\\u5546\\u54c1\\u6240\\u6709\\u8005\",\"deadline\":\"2021-05-22 15:11:57\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"12\",\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/goods\"}','2021-05-07 15:18:33','2021-05-07 15:18:33'),
(119,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:18:33','2021-05-07 15:18:33'),
(120,1,'admin/goods/2','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:18:40','2021-05-07 15:18:40'),
(121,1,'admin/goods','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:18:51','2021-05-07 15:18:51'),
(122,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:31:13','2021-05-07 15:31:13'),
(123,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:37:28','2021-05-07 15:37:28'),
(124,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:37:30','2021-05-07 15:37:30'),
(125,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:38:02','2021-05-07 15:38:02'),
(126,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:38:04','2021-05-07 15:38:04'),
(127,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"\\u5546\\u54c1\\u63cf\\u8ff0\",\"deadline\":\"2021-05-08 15:38:04\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"3\",\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/goods\"}','2021-05-07 15:38:18','2021-05-07 15:38:18'),
(128,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:38:18','2021-05-07 15:38:18'),
(129,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:45:59','2021-05-07 15:45:59'),
(130,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"\\u5546\\u54c1\\u63cf\\u8ff0\",\"deadline\":\"2021-05-08 15:45:59\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"4\",\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/goods\"}','2021-05-07 15:46:30','2021-05-07 15:46:30'),
(131,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:46:30','2021-05-07 15:46:30'),
(132,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:46:40','2021-05-07 15:46:40'),
(133,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"\\u5546\\u54c1\\u63cf\\u8ff0\",\"deadline\":\"2021-05-08 15:46:40\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"10\",\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/goods\"}','2021-05-07 15:46:52','2021-05-07 15:46:52'),
(134,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:46:52','2021-05-07 15:46:52'),
(135,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:46:53','2021-05-07 15:46:53'),
(136,1,'admin/goods','POST','127.0.0.1','{\"name\":\"name\",\"owner\":\"owner\",\"description\":\"\\u5546\\u54c1\\u63cf\\u8ff0\",\"deadline\":\"2021-05-15 15:46:53\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"4\",\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/goods\"}','2021-05-07 15:47:15','2021-05-07 15:47:15'),
(137,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:47:15','2021-05-07 15:47:15'),
(138,1,'admin/goods/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2021-05-07 15:47:18','2021-05-07 15:47:18'),
(139,1,'admin/goods','POST','127.0.0.1','{\"name\":\"zhifeng pan\",\"owner\":\"owner\",\"description\":\"\\u5546\\u54c1\\u63cf\\u8ff0\",\"deadline\":\"2021-05-18 15:47:18\",\"cover_image\":\"\\/assets\\/images\\/item-tab.png\",\"publicity_video\":\"\\/assets\\/images\\/item-tab.png\",\"issuer\":\"issuer\",\"sale_quantity\":\"4\",\"_token\":\"8iwaRpU3FCXJvIrT83KobhP2RISZKs0dVvfTLgHU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/goods\"}','2021-05-07 15:47:34','2021-05-07 15:47:34'),
(140,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 15:47:34','2021-05-07 15:47:34'),
(141,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 17:53:17','2021-05-07 17:53:17'),
(142,1,'admin/goods','GET','127.0.0.1','[]','2021-05-07 17:54:00','2021-05-07 17:54:00'),
(143,1,'admin/users','GET','127.0.0.1','[]','2021-05-08 16:17:04','2021-05-08 16:17:04');

/*Table structure for table `admin_permissions` */

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_permissions` */

insert  into `admin_permissions`(`id`,`name`,`slug`,`http_method`,`http_path`,`created_at`,`updated_at`) values 
(1,'All permission','*','','*',NULL,NULL),
(2,'Dashboard','dashboard','GET','/',NULL,NULL),
(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),
(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),
(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL);

/*Table structure for table `admin_role_menu` */

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_role_menu` */

insert  into `admin_role_menu`(`role_id`,`menu_id`,`created_at`,`updated_at`) values 
(1,2,NULL,NULL);

/*Table structure for table `admin_role_permissions` */

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_role_permissions` */

insert  into `admin_role_permissions`(`role_id`,`permission_id`,`created_at`,`updated_at`) values 
(1,1,NULL,NULL);

/*Table structure for table `admin_role_users` */

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_role_users` */

insert  into `admin_role_users`(`role_id`,`user_id`,`created_at`,`updated_at`) values 
(1,1,NULL,NULL);

/*Table structure for table `admin_roles` */

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_roles` */

insert  into `admin_roles`(`id`,`name`,`slug`,`created_at`,`updated_at`) values 
(1,'Administrator','administrator','2021-05-07 03:49:14','2021-05-07 03:49:14');

/*Table structure for table `admin_user_permissions` */

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_user_permissions` */

/*Table structure for table `admin_users` */

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_users` */

insert  into `admin_users`(`id`,`username`,`password`,`name`,`avatar`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','$2y$10$Z5lI/8ZZzEDkkfCVAaNMteXD53yZRAXkmXc5RG5mzcACZS9YBuHtW','Administrator',NULL,'XNN2IKiLn8BngXamcy84JDtBDykttWUtqUHjbh4NyrecUnHtniiVta5EA396','2021-05-07 03:49:14','2021-05-07 03:49:14');

/*Table structure for table `failed_jobs` */

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `feedbacks` */

CREATE TABLE `feedbacks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈id',
  `openid` varchar(100) NOT NULL COMMENT '用户id',
  `number` varchar(20) NOT NULL COMMENT '反馈编号',
  `description` text NOT NULL COMMENT '反馈描述',
  `created_at` timestamp NOT NULL COMMENT '反馈创建时间',
  `updated_at` timestamp NOT NULL COMMENT '反馈更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `feedbacks` */

insert  into `feedbacks`(`id`,`openid`,`number`,`description`,`created_at`,`updated_at`) values 
(1,'1','f1620435592','decription','2021-05-08 08:59:52','2021-05-08 08:59:52'),
(2,'openId','f1620461767','feedback','2021-05-08 16:16:07','2021-05-08 16:16:07'),
(3,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','f1620899760','feedback','2021-05-13 17:56:00','2021-05-13 17:56:00'),
(4,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','f1620899841','feedback','2021-05-13 17:57:21','2021-05-13 17:57:21');

/*Table structure for table `flights` */

CREATE TABLE `flights` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `flights` */

/*Table structure for table `goods` */

CREATE TABLE `goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) NOT NULL COMMENT '商品名称',
  `owner` varchar(20) NOT NULL COMMENT '商品所有者',
  `description` text NOT NULL COMMENT '商品描述',
  `deadline` timestamp NOT NULL COMMENT '商品上架截止时间',
  `cover_image` varchar(100) NOT NULL COMMENT '商品封面图片地址',
  `publicity_video` varchar(100) NOT NULL COMMENT '商品宣传视频地址',
  `issuer` varchar(10) NOT NULL COMMENT '发行方',
  `sale_quantity` int(100) NOT NULL COMMENT '商品销售记录',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`name`,`owner`,`description`,`deadline`,`cover_image`,`publicity_video`,`issuer`,`sale_quantity`,`created_at`,`updated_at`) values 
(1,'name','owner','商品描述','2021-05-13 15:38:04','/assets/images/item-tab.png','/assets/images/item-tab.png','issuer',29,'2021-05-09 15:38:18','2021-05-13 15:18:21'),
(2,'name','owner','商品描述','2021-05-14 15:45:59','/assets/images/item-tab.png','/assets/images/item-tab.png','issuer',4,'2021-05-09 15:46:30','2021-05-07 15:46:30'),
(3,'name','owner','商品描述','2021-05-15 15:46:40','/assets/images/item-tab.png','/assets/images/item-tab.png','issuer',10,'2021-05-09 15:46:52','2021-05-07 15:46:52'),
(4,'name','owner','商品描述','2021-05-15 15:46:53','/assets/images/item-tab.png','/assets/images/item-tab.png','issuer',4,'2021-05-09 15:47:15','2021-05-07 15:47:15'),
(5,'zhifeng pan','owner','商品描述','2021-05-18 15:47:18','/assets/images/item-tab.png','/assets/images/item-tab.png','issuer',4,'2021-05-09 15:47:34','2021-05-07 15:47:34');

/*Table structure for table `migrations` */

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2016_01_04_173148_create_admin_tables',1),
(4,'2019_08_19_000000_create_failed_jobs_table',1),
(5,'2021_04_28_004618_create_flights_table',1),
(6,'2021_04_28_062312_flight',1),
(7,'2019_12_14_000001_create_personal_access_tokens_table',2);

/*Table structure for table `orders` */

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `openid` varchar(100) NOT NULL COMMENT '订单用户id',
  `number` varchar(20) NOT NULL COMMENT '订单编号',
  `address` varchar(20) NOT NULL COMMENT '订单用户地址',
  `quantity` int(10) NOT NULL COMMENT '订单数量',
  `good_id` int(10) NOT NULL COMMENT '商品id',
  `post_type` varchar(20) NOT NULL DEFAULT 'post_type' COMMENT '邮递类型',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`openid`,`number`,`address`,`quantity`,`good_id`,`post_type`,`created_at`,`updated_at`) values 
(1,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620435542','广州',2,1,'mailingType','2021-05-08 08:59:02','2021-05-08 08:59:02'),
(2,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620465144','region详细地址',1,1,'普通快递','2021-05-08 17:12:24','2021-05-08 17:12:24'),
(3,'openId','ws162288','addr',8,1,'type','2021-05-08 17:23:13','2021-05-08 17:23:15'),
(4,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620888324','region详细地址',1,1,'post_type','2021-05-13 14:45:24','2021-05-13 14:45:24'),
(5,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620888404','region详细地址',1,1,'post_type','2021-05-13 14:46:44','2021-05-13 14:46:44'),
(6,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620888751','region详细地址',1,1,'普通快递','2021-05-13 14:52:31','2021-05-13 14:52:31'),
(7,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620889285','region详细地址',1,1,'普通快递','2021-05-13 15:01:25','2021-05-13 15:01:25'),
(8,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620889499','region详细地址',1,1,'普通快递','2021-05-13 15:04:59','2021-05-13 15:04:59'),
(9,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620889580','region详细地址',1,1,'普通快递','2021-05-13 15:06:20','2021-05-13 15:06:20'),
(10,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620889869','region详细地址',1,1,'顺丰到付','2021-05-13 15:11:09','2021-05-13 15:11:09'),
(11,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620890113','region详细地址',1,1,'顺丰到付','2021-05-13 15:15:13','2021-05-13 15:15:13'),
(12,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620890224','region详细地址',1,1,'顺丰到付','2021-05-13 15:17:04','2021-05-13 15:17:04'),
(13,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','ws1620890301','region详细地址',1,1,'普通快递','2021-05-13 15:18:21','2021-05-13 15:18:21');

/*Table structure for table `password_resets` */

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`created_at`,`updated_at`) values 
(124,'App\\Models\\User',1,'web','9a4766e5fcd199f492aaaddaa6d21c471afe4555d251fc42f35056b3e5ecdabf','[\"*\"]','2021-05-13 17:57:21','2021-05-13 16:35:05','2021-05-13 17:57:21');

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head_portrait` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`session_key`,`addr`,`openid`,`head_portrait`,`phone`,`created_at`,`updated_at`) values 
(1,'name','rSyI2M/OgtSMyRjbPG0KvQ==','addr','oZjvr5VqeivBOdh3teLH4Eq97oOQ','/assets/images/item-tab.png','11111111111','2021-05-07 05:58:32','2021-05-13 16:35:05'),
(2,'name','dW92iL5eFpdyy0lwfNfqTA==','addr','openId','/assets/images/item-tab.png','11111111111','2021-05-07 06:30:58','2021-05-08 10:02:57');

/*Table structure for table `wx_sessions` */

CREATE TABLE `wx_sessions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL COMMENT '微信用户唯一标识符',
  `session_key` varchar(50) NOT NULL COMMENT '微信会话密钥',
  `purePhoneNumber` varchar(100) DEFAULT NULL COMMENT '微信纯电话号码',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;

/*Data for the table `wx_sessions` */

insert  into `wx_sessions`(`id`,`openid`,`session_key`,`purePhoneNumber`,`created_at`,`updated_at`) values 
(187,'oZjvr5VqeivBOdh3teLH4Eq97oOQ','rSyI2M/OgtSMyRjbPG0KvQ==',NULL,'2021-05-13 16:35:04','2021-05-13 16:35:04');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
