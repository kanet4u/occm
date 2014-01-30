/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : newchecker

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2014-01-30 07:30:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `actions`
-- ----------------------------
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actions
-- ----------------------------
INSERT INTO `actions` VALUES ('1', 'management_dashboard', '');
INSERT INTO `actions` VALUES ('2', 'user_list', '');
INSERT INTO `actions` VALUES ('3', 'user_delete', '');
INSERT INTO `actions` VALUES ('4', 'user_edit', '');
INSERT INTO `actions` VALUES ('5', 'user_create', '');
INSERT INTO `actions` VALUES ('6', 'problem_list', '');
INSERT INTO `actions` VALUES ('7', 'tag_list', '');
INSERT INTO `actions` VALUES ('8', 'competition_list', '');
INSERT INTO `actions` VALUES ('9', 'page_list', '');
INSERT INTO `actions` VALUES ('10', 'submission_list', '');
INSERT INTO `actions` VALUES ('11', 'reports_list', '');
INSERT INTO `actions` VALUES ('12', 'competition_delete', '');
INSERT INTO `actions` VALUES ('13', 'tag_delete', '');
INSERT INTO `actions` VALUES ('14', 'tag_edite', '');
INSERT INTO `actions` VALUES ('15', 'problem_delete', '');
INSERT INTO `actions` VALUES ('16', 'role_list', '');
INSERT INTO `actions` VALUES ('17', 'role_edit', '');
INSERT INTO `actions` VALUES ('18', 'role_delete', '');
INSERT INTO `actions` VALUES ('19', 'role_add', '');
INSERT INTO `actions` VALUES ('20', 'submission_list', '');
INSERT INTO `actions` VALUES ('21', 'submission_view', '');
INSERT INTO `actions` VALUES ('22', 'pages_list', '');
INSERT INTO `actions` VALUES ('23', 'pages_add', '');
INSERT INTO `actions` VALUES ('24', 'pages_edit', '');
INSERT INTO `actions` VALUES ('25', 'pages_delete', '');
INSERT INTO `actions` VALUES ('26', 'competition_join_list', '');
INSERT INTO `actions` VALUES ('27', 'competition_join_delete', '');
INSERT INTO `actions` VALUES ('28', 'competition_join_approve', '');
INSERT INTO `actions` VALUES ('29', 'problem_test_list', '');
INSERT INTO `actions` VALUES ('30', 'problem_test_edit', '');

-- ----------------------------
-- Table structure for `competitions`
-- ----------------------------
DROP TABLE IF EXISTS `competitions`;
CREATE TABLE `competitions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `details` text,
  `duration` varchar(255) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_limited` tinyint(1) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitions
-- ----------------------------

-- ----------------------------
-- Table structure for `languages`
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `home` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `options` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES ('0', 'c', null, 'C', null, null);
INSERT INTO `languages` VALUES ('1', 'cpp', null, 'C++', null, null);
INSERT INTO `languages` VALUES ('2', 'java', null, 'Java', null, null);

-- ----------------------------
-- Table structure for `pages`
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(4) NOT NULL,
  `updated` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', 'test', '2014-01-29 06:36:10', '1', 'About Us', 'PAGE', '2014-01-29 06:36:36', 'some-url');
INSERT INTO `pages` VALUES ('2', 'asdasda', '2014-01-29 06:41:47', '0', 'adasdasd', 'POST', '2014-02-01 06:42:11', 'asdadasdsa');

-- ----------------------------
-- Table structure for `problems`
-- ----------------------------
DROP TABLE IF EXISTS `problems`;
CREATE TABLE `problems` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `details` text NOT NULL,
  `input1` text NOT NULL,
  `input2` text NOT NULL,
  `input3` text,
  `level` int(11) NOT NULL,
  `memory_limit` int(11) NOT NULL,
  `output1` text NOT NULL,
  `output2` text NOT NULL,
  `output3` text,
  `score` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `competition_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC40B91B4678780F9` (`competition_id`),
  CONSTRAINT `FKC40B91B4678780F9` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problems
-- ----------------------------

-- ----------------------------
-- Table structure for `problem_tags`
-- ----------------------------
DROP TABLE IF EXISTS `problem_tags`;
CREATE TABLE `problem_tags` (
  `problem_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`problem_id`,`tag_id`),
  KEY `FKCADFF5B981E8FE19` (`tag_id`),
  KEY `FKCADFF5B97F23FC79` (`problem_id`),
  CONSTRAINT `FKCADFF5B97F23FC79` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`id`),
  CONSTRAINT `FKCADFF5B981E8FE19` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `ranks`
-- ----------------------------
DROP TABLE IF EXISTS `ranks`;
CREATE TABLE `ranks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `total` double NOT NULL,
  `updated` datetime NOT NULL,
  `competition_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK67439C7678780F9` (`competition_id`),
  KEY `FK67439C7EC1431B` (`user_id`),
  CONSTRAINT `FK67439C7678780F9` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`),
  CONSTRAINT `FK67439C7EC1431B` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ranks
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin');
INSERT INTO `roles` VALUES ('2', 'teacher');
INSERT INTO `roles` VALUES ('3', 'user');

-- ----------------------------
-- Table structure for `role_actions`
-- ----------------------------
DROP TABLE IF EXISTS `role_actions`;
CREATE TABLE `role_actions` (
  `role_id` bigint(20) NOT NULL,
  `action_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`action_id`),
  KEY `FKD1909A34381B5AFB` (`action_id`),
  KEY `FKD1909A3469967F3B` (`role_id`),
  CONSTRAINT `FKD1909A34381B5AFB` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`),
  CONSTRAINT `FKD1909A3469967F3B` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_actions
-- ----------------------------
INSERT INTO `role_actions` VALUES ('1', '1');
INSERT INTO `role_actions` VALUES ('1', '2');
INSERT INTO `role_actions` VALUES ('1', '3');
INSERT INTO `role_actions` VALUES ('1', '4');
INSERT INTO `role_actions` VALUES ('1', '5');
INSERT INTO `role_actions` VALUES ('1', '6');
INSERT INTO `role_actions` VALUES ('1', '7');
INSERT INTO `role_actions` VALUES ('1', '8');
INSERT INTO `role_actions` VALUES ('1', '9');
INSERT INTO `role_actions` VALUES ('1', '10');
INSERT INTO `role_actions` VALUES ('1', '11');
INSERT INTO `role_actions` VALUES ('1', '12');
INSERT INTO `role_actions` VALUES ('1', '13');
INSERT INTO `role_actions` VALUES ('1', '14');
INSERT INTO `role_actions` VALUES ('1', '15');
INSERT INTO `role_actions` VALUES ('1', '16');
INSERT INTO `role_actions` VALUES ('1', '17');
INSERT INTO `role_actions` VALUES ('1', '18');
INSERT INTO `role_actions` VALUES ('1', '19');
INSERT INTO `role_actions` VALUES ('1', '20');
INSERT INTO `role_actions` VALUES ('1', '21');
INSERT INTO `role_actions` VALUES ('1', '22');
INSERT INTO `role_actions` VALUES ('1', '23');
INSERT INTO `role_actions` VALUES ('1', '24');
INSERT INTO `role_actions` VALUES ('1', '25');
INSERT INTO `role_actions` VALUES ('1', '26');
INSERT INTO `role_actions` VALUES ('1', '27');
INSERT INTO `role_actions` VALUES ('1', '28');
INSERT INTO `role_actions` VALUES ('1', '29');
INSERT INTO `role_actions` VALUES ('1', '30');

-- ----------------------------
-- Table structure for `submissions`
-- ----------------------------
DROP TABLE IF EXISTS `submissions`;
CREATE TABLE `submissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_time` datetime DEFAULT NULL,
  `log` text,
  `memory` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `runtime` double NOT NULL,
  `score` int(11) NOT NULL,
  `source_code` text NOT NULL,
  `updation_time` datetime DEFAULT NULL,
  `competition_id` bigint(20) NOT NULL,
  `failed_test_case` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) NOT NULL,
  `problem_id` bigint(20) NOT NULL,
  `status` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2912EA7678780F9` (`competition_id`),
  KEY `FK2912EA721729CDE` (`failed_test_case`),
  KEY `FK2912EA7FCC3737B` (`language_id`),
  KEY `FK2912EA77F23FC79` (`problem_id`),
  KEY `FK2912EA7C76AE11` (`status`),
  KEY `FK2912EA7EC1431B` (`user_id`),
  CONSTRAINT `FK2912EA7FCC3737B` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA721729CDE` FOREIGN KEY (`failed_test_case`) REFERENCES `testcases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA7678780F9` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA77F23FC79` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA7C76AE11` FOREIGN KEY (`status`) REFERENCES `submission_status` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA7EC1431B` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submissions
-- ----------------------------

-- ----------------------------
-- Table structure for `submission_status`
-- ----------------------------
DROP TABLE IF EXISTS `submission_status`;
CREATE TABLE `submission_status` (
  `code` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `severity` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submission_status
-- ----------------------------
INSERT INTO `submission_status` VALUES ('0', 'PN', 'Pending', 'info');
INSERT INTO `submission_status` VALUES ('1', 'TN', 'Testing', 'info');
INSERT INTO `submission_status` VALUES ('2', 'TL', 'Time Limit Exceed', 'warning');
INSERT INTO `submission_status` VALUES ('3', 'WA', 'Wrong Answer', 'warning');
INSERT INTO `submission_status` VALUES ('4', 'SC', 'Success', 'success');
INSERT INTO `submission_status` VALUES ('5', 'CE', 'Compilation Error', 'danger');
INSERT INTO `submission_status` VALUES ('6', 'ML', 'Memory Limit Exceed', 'warning');
INSERT INTO `submission_status` VALUES ('7', 'OL', 'Output Limit Exceed', 'warning');
INSERT INTO `submission_status` VALUES ('8', 'RC', 'Restricted Code', 'danger');
INSERT INTO `submission_status` VALUES ('9', 'RE', 'Runtime Error', 'danger');
INSERT INTO `submission_status` VALUES ('10', 'SI', 'Security Issue', 'danger');
INSERT INTO `submission_status` VALUES ('11', 'SE', 'Testing System Error', 'warning');

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('2', 'Arrays');

-- ----------------------------
-- Table structure for `testcases`
-- ----------------------------
DROP TABLE IF EXISTS `testcases`;
CREATE TABLE `testcases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `input` varchar(255) NOT NULL,
  `output` varchar(255) NOT NULL,
  `problem_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB9D8B1F17F23FC79` (`problem_id`),
  CONSTRAINT `FKB9D8B1F17F23FC79` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `fname` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `sname` varchar(64) NOT NULL,
  `role` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6A68E0817BA6A2D` (`role`),
  KEY `FK6A68E08267DE810` (`status`),
  CONSTRAINT `FK6A68E0817BA6A2D` FOREIGN KEY (`role`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK6A68E08267DE810` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'homidjonov@gmail.com', 'Shavkat', 'user.png', 'random1', 'Khamidjanov', '1', '2');
INSERT INTO `users` VALUES ('2', 'jamshids@mal.com', 'Kerak', 'user.png', 'random2', 'Emas', '1', '1');

-- ----------------------------
-- Table structure for `user_competitions`
-- ----------------------------
DROP TABLE IF EXISTS `user_competitions`;
CREATE TABLE `user_competitions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `approved` tinyint(1) NOT NULL,
  `competition_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD519E688678780F9` (`competition_id`),
  KEY `FKD519E688EC1431B` (`user_id`),
  CONSTRAINT `FKD519E688EC1431B` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKD519E688678780F9` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_competitions
-- ----------------------------

-- ----------------------------
-- Table structure for `user_status`
-- ----------------------------
DROP TABLE IF EXISTS `user_status`;
CREATE TABLE `user_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_status
-- ----------------------------
INSERT INTO `user_status` VALUES ('1', 'pending');
INSERT INTO `user_status` VALUES ('2', 'active');
INSERT INTO `user_status` VALUES ('3', 'banned');
