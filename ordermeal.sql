/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : ordermeal

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2019-04-06 22:18:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', '0');
INSERT INTO `admins` VALUES ('2', 'tim', '123', '1');

-- ----------------------------
-- Table structure for border
-- ----------------------------
DROP TABLE IF EXISTS `border`;
CREATE TABLE `border` (
  `id` int(11) NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of border
-- ----------------------------
INSERT INTO `border` VALUES ('1', '1');
INSERT INTO `border` VALUES ('2', '1');
INSERT INTO `border` VALUES ('3', '1');
INSERT INTO `border` VALUES ('4', '1');
INSERT INTO `border` VALUES ('5', '1');
INSERT INTO `border` VALUES ('6', '1');
INSERT INTO `border` VALUES ('7', '1');
INSERT INTO `border` VALUES ('8', '1');
INSERT INTO `border` VALUES ('9', '0');
INSERT INTO `border` VALUES ('10', '0');
INSERT INTO `border` VALUES ('11', '0');
INSERT INTO `border` VALUES ('12', '0');
INSERT INTO `border` VALUES ('13', '0');
INSERT INTO `border` VALUES ('14', '0');
INSERT INTO `border` VALUES ('15', '0');
INSERT INTO `border` VALUES ('16', '0');
INSERT INTO `border` VALUES ('17', '0');
INSERT INTO `border` VALUES ('18', '0');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '非常不错的一次用餐体验', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) DEFAULT NULL COMMENT '是否付款0为未付1为已付款',
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `datails` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `is_do` int(11) DEFAULT '0',
  `is_comment` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '4', '1', '2019-04-05 16:09:12', '奶茶-12.0-4', '48', '1', '0', '1');
INSERT INTO `orders` VALUES ('2', '5', '1', '2019-04-05 17:04:15', '奶茶-12.0-5', '60', '0', '0', '1');
INSERT INTO `orders` VALUES ('3', '6', '1', '2019-04-05 17:18:02', '奶茶-12.0-3/红牛-6.0-5', '66', '0', '0', '0');
INSERT INTO `orders` VALUES ('4', '7', '1', '2019-04-05 17:19:37', '奶茶-12.0-3/红牛-6.0-5', '66', '0', '0', '0');
INSERT INTO `orders` VALUES ('5', '8', '1', '2019-04-05 17:20:35', '奶茶-12.0-3/红牛-6.0-5', '66', '0', '0', '0');
INSERT INTO `orders` VALUES ('6', '9', '1', '2019-04-05 17:24:50', '奶茶-12.0-4/红牛-6.0-7', '90', '0', '0', '0');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `describes` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('4', '奶茶', '12.00', '/ordermeal/upload/img/u=2954347635,760536322&fm=72.jpg', '2019最新推出奶茶', '1', '饮品');
INSERT INTO `product` VALUES ('5', '红牛', '6.00', '/ordermeal/upload/img/u=1775942993,1394642686&fm=26&gp=0.jpg', '红牛维生素饮料', '1', '饮品');
INSERT INTO `product` VALUES ('6', '咖啡', '32.00', '/ordermeal/upload/img/coffee.jpg', '美国黑咖啡', '1', '饮品');
INSERT INTO `product` VALUES ('7', '可乐', '15.00', '/ordermeal/upload/img/cola.jpg', '美国进口可乐', '1', '饮品');
INSERT INTO `product` VALUES ('8', '三人特色早餐', '68.00', '/ordermeal/upload/img/g1.jpg', '三人特色早餐，早餐与家人更配哦。', '1', '特色菜');
INSERT INTO `product` VALUES ('9', '龙虾', '88.00', '/ordermeal/upload/img/g2.jpg', '新鲜龙虾', '1', '特色菜');
INSERT INTO `product` VALUES ('10', '水果套餐', '66.00', '/ordermeal/upload/img/g8.jpg', '水果套餐，可口美味哦', '1', '水果');
INSERT INTO `product` VALUES ('11', '新鲜蔬菜', '18.00', '/ordermeal/upload/img/g10.jpg', '新鲜蔬菜', '1', '蔬菜');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('1', '饮品');
INSERT INTO `product_type` VALUES ('2', '水果');
INSERT INTO `product_type` VALUES ('3', '特色菜');
INSERT INTO `product_type` VALUES ('4', '蔬菜');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `vip_type` varchar(255) DEFAULT NULL,
  `integral_num` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'tom', '1234', '0', '0');
INSERT INTO `user` VALUES ('2', 'xiaoming', '1234', '0', '0');
