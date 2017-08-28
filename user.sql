/*
Navicat MySQL Data Transfer

Source Server         : to
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : users

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-07-23 19:32:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(15) NOT NULL,
  `psw` varchar(15) NOT NULL,
  `sex` int(5) NOT NULL,
  `hobby` varchar(50) NOT NULL,
  `state` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lili', '123', '1', 'redaing', 'ben', 'shfsghj');
INSERT INTO `user` VALUES ('2', 'aa', '22', '1', 'watching Tv, Climing', '本', 'fedshfdh');
INSERT INTO `user` VALUES ('3', 'aa', '22', '1', 'watching Tv, Climing', '本', 'fedshfdh');
