/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ershoujiaoyi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ershoujiaoyi` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ershoujiaoyi`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int(20) NOT NULL COMMENT '创建用户',
  `address_name` varchar(200) NOT NULL COMMENT '收货人 ',
  `address_phone` varchar(200) NOT NULL COMMENT '电话 ',
  `address_dizhi` varchar(200) NOT NULL COMMENT '地址 ',
  `isdefault_types` int(11) NOT NULL COMMENT '是否默认地址 ',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='收货地址';

/*Data for the table `address` */

insert  into `address`(`id`,`yonghu_id`,`address_name`,`address_phone`,`address_dizhi`,`isdefault_types`,`insert_time`,`update_time`,`create_time`) values (1,1,'张三','17785544913','地址1111',1,'2022-03-15 17:23:26','2022-03-15 10:27:27','2022-03-15 09:36:48'),(2,2,'123','17785596969','在地图选择',1,'2022-03-15 10:24:45','2022-03-15 10:27:15','2022-03-15 09:36:48');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ershoujiaoyi/upload/1640743438038.jpg'),(2,'picture2','http://localhost:8080/ershoujiaoyi/upload/1640743456288.jpg'),(3,'picture3','http://localhost:8080/ershoujiaoyi/upload/1640743468461.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (94,'sex_types','性别类型名称',1,'男',NULL,NULL,'2022-03-15 09:05:00'),(95,'sex_types','性别类型名称',2,'女',NULL,NULL,'2022-03-15 09:05:00'),(96,'news_types','新闻类型名称',1,'新闻类型1',NULL,NULL,'2022-03-15 09:05:00'),(97,'news_types','新闻类型名称',2,'新闻类型2',NULL,NULL,'2022-03-15 09:05:00'),(98,'goods_types','商品类型名称',1,'家电',NULL,NULL,'2022-03-15 09:05:00'),(99,'goods_types','商品类型名称',2,'玩具',NULL,NULL,'2022-03-15 09:05:00'),(100,'goods_types','商品类型名称',3,'衣物',NULL,NULL,'2022-03-15 09:05:00'),(101,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2022-03-15 09:05:00'),(102,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2022-03-15 09:05:00'),(103,'isdefault_types','是否默认地址',1,'否',NULL,NULL,'2022-03-15 09:05:00'),(104,'isdefault_types','是否默认地址',2,'是',NULL,NULL,'2022-03-15 09:05:00'),(105,'shangxia_types','上下架名称',1,'上架',NULL,NULL,'2022-03-15 09:05:00'),(106,'shangxia_types','上下架名称',2,'下架',NULL,NULL,'2022-03-15 09:05:00'),(108,'goods_order_types','订单类型名称',2,'退款',NULL,NULL,'2022-03-15 09:05:00'),(109,'goods_order_types','订单类型名称',3,'已支付',NULL,NULL,'2022-03-15 09:05:00'),(110,'goods_order_types','订单类型名称',4,'已发货',NULL,NULL,'2022-03-15 09:05:00'),(111,'goods_order_types','订单类型名称',5,'已完成',NULL,NULL,'2022-03-15 09:05:00'),(112,'goods_order_payment_types','订单支付类型名称',1,'现金',NULL,NULL,'2022-03-15 09:05:00');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (58,'1111',1,'123',NULL,1,'2022-03-15 11:25:52',NULL,'2022-03-15 11:25:52'),(59,NULL,1,'3323',58,2,'2022-03-15 11:25:58',NULL,'2022-03-15 11:25:58'),(61,NULL,1,'333',58,2,'2022-03-15 11:14:25',NULL,'2022-03-15 11:14:25'),(62,NULL,4,'233',58,2,'2022-03-15 11:14:39',NULL,'2022-03-15 11:14:39'),(63,NULL,1,'用户11的评论',58,2,'2022-03-15 17:06:15',NULL,'2022-03-15 17:06:15'),(64,NULL,1,'可以讨论',58,2,'2022-03-15 11:44:03',NULL,'2022-03-15 11:44:03');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '商品名称  Search111 ',
  `goods_types` int(11) DEFAULT NULL COMMENT '商品类型  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户id',
  `goods_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `goods_kucun_number` int(11) DEFAULT NULL COMMENT '商品库存  Search111',
  `goods_old_money` decimal(10,2) DEFAULT NULL COMMENT '商品原价 ',
  `goods_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价/积分 ',
  `shangxia_types` int(11) DEFAULT NULL COMMENT '是否上架 ',
  `goods_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `goods_content` text COMMENT '简介 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品信息';

/*Data for the table `goods` */

insert  into `goods`(`id`,`goods_name`,`goods_types`,`yonghu_id`,`goods_photo`,`goods_kucun_number`,`goods_old_money`,`goods_new_money`,`shangxia_types`,`goods_delete`,`goods_content`,`create_time`) values (1,'商品1',3,1,'http://localhost:8080/ershoujiaoyi/upload/1640741835495.jpg',1,'120.00','100.00',1,1,'<p><span style=\"color: rgb(96, 98, 102);\">简介11111111</span></p>','2022-03-15 09:37:33'),(2,'商品2',1,1,'http://localhost:8080/ershoujiaoyi/upload/1640742697958.jpg',15,'500.00','400.00',1,1,'<p><span style=\"color: rgb(96, 98, 102);\">简介1</span></p>','2022-03-15 09:36:48'),(3,'游戏手柄',2,2,'http://localhost:8080/ershoujiaoyi/upload/1640846223472.jpg',4,'199.00','150.00',1,1,'<p>123123123123123123</p>','2022-03-15 09:36:48'),(5,'香水',1,2,'http://localhost:8080/ershoujiaoyi/upload/1640856388157.jpg',10,'185.00','120.00',1,1,'123','2022-03-15 17:26:45'),(7,'游戏机',1,4,'http://localhost:8080/ershoujiaoyi/upload/1641265820634.jpg',0,'13333.00','1200.00',1,1,'图片显示空白是因为加载太慢了 刷新一下就好了','2022-03-15 11:11:00'),(8,'商品名称1',3,1,'http://localhost:8080/ershoujiaoyi/upload/1645261442437.jpg',11,'132.00','333.00',1,2,'<p>简介</p><p>1</p>','2022-03-15 17:04:13'),(9,'1',1,1,'http://localhost:8080/ershoujiaoyi/upload/1645261555784.jpg',1,'1.00','1.00',1,2,'1','2022-03-15 17:06:01');

/*Table structure for table `goods_liuyan` */

DROP TABLE IF EXISTS `goods_liuyan`;

CREATE TABLE `goods_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `goods_liuyan_text` text COMMENT '评论内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评论时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='评论';

/*Data for the table `goods_liuyan` */

insert  into `goods_liuyan`(`id`,`goods_id`,`yonghu_id`,`goods_liuyan_text`,`insert_time`,`update_time`,`create_time`) values (14,1,1,'123','2022-03-15 14:15:16',NULL,'2022-03-15 14:15:16'),(15,1,1,'321','2022-03-15 16:25:00',NULL,'2022-03-15 16:25:00'),(16,1,1,'商品评论111','2022-03-15 17:07:23',NULL,'2022-03-15 17:07:23'),(17,2,1,'可以评论','2022-03-15 11:43:21',NULL,'2022-03-15 11:43:21');

/*Table structure for table `goods_order` */

DROP TABLE IF EXISTS `goods_order`;

CREATE TABLE `goods_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `address_id` int(11) DEFAULT NULL COMMENT '收货地址 ',
  `buy_number` int(11) DEFAULT NULL COMMENT '购买数量',
  `goods_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格 ',
  `goods_order_types` int(11) DEFAULT NULL COMMENT '订单类型',
  `goods_order_payment_types` int(11) DEFAULT NULL COMMENT '支付类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品订单';

/*Data for the table `goods_order` */

insert  into `goods_order`(`id`,`goods_order_uuid_number`,`goods_id`,`yonghu_id`,`address_id`,`buy_number`,`goods_order_true_price`,`goods_order_types`,`goods_order_payment_types`,`insert_time`,`create_time`) values (2,'1641265975561',7,1,1,1,'1200.00',5,1,'2022-03-15 11:12:56','2022-03-15 11:12:56'),(3,'1645261598827',5,1,1,1,'120.00',5,1,'2022-03-15 17:06:39','2022-03-15 17:06:39'),(4,'1647315809945',5,1,1,1,'120.00',5,1,'2022-03-15 11:43:30','2022-03-15 11:43:30');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `news_name` varchar(200) DEFAULT NULL COMMENT '新闻名称 Search111  ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '新闻图片 ',
  `news_types` int(11) NOT NULL COMMENT '新闻类型 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '新闻发布时间 ',
  `news_content` text COMMENT '新闻详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='新闻信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_photo`,`news_types`,`insert_time`,`news_content`,`create_time`) values (4,'新闻1','http://localhost:8080/ershoujiaoyi/upload/1640743305292.jpg',2,'2022-03-15 10:01:51','<p><span style=\"color: rgb(96, 98, 102);\">新闻详情1</span></p>','2022-03-15 10:01:51'),(5,'新闻2','http://localhost:8080/ershoujiaoyi/upload/1640743321788.jpg',1,'2022-03-15 10:02:08','<p><span style=\"color: rgb(96, 98, 102);\">新闻详情2</span></p>','2022-03-15 10:02:08');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','kvnvn4mug2vrk0n4kr5jjpg2d3gawrm1','2022-03-15 09:27:20','2022-03-15 12:47:41'),(2,1,'111','yonghu','用户','i38dvga119khltq73qtqabmo5ieroiak','2022-03-15 10:10:09','2022-03-15 12:48:22'),(3,2,'222','yonghu','用户','e9a6tcyhdrd5l0hv3t9cgez7roogmzea','2022-03-15 15:40:19','2022-03-15 12:44:21'),(4,3,'123','yonghu','用户','vz81e64a7jyw0dds78nw1mpjbcyfcapn','2022-03-15 17:15:32','2022-03-15 11:27:08'),(5,4,'123','yonghu','用户','msuugx7d9vu6i2yl1iz5m5bn5j9c9k72','2022-03-15 11:08:31','2022-01-07 10:13:57');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-03-15 15:59:12');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号 ',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`yonghu_phone`,`yonghu_id_number`,`sex_types`,`new_money`,`yonghu_delete`,`create_time`) values (1,'a1','123456','用户1','http://localhost:8080/ershoujiaoyi/upload/1640741787686.jpg','17744455454','401882197711214411',1,'10758.00',1,'2022-03-15 09:36:48'),(2,'a2','123456','用户2','http://localhost:8080/ershoujiaoyi/upload/1641266534491.webp','17785599461','410881199211311111',2,'240.00',1,'2022-03-15 15:08:57'),(4,'a3','123456','用户3','http://localhost:8080/ershoujiaoyi/upload/1641265908645.jpg','13311331311','410882199111211111',2,'1200.00',1,'2022-03-15 11:08:26');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
