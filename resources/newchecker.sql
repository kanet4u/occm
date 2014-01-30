/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : newchecker

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2014-01-30 10:54:02
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitions
-- ----------------------------
INSERT INTO `competitions` VALUES ('1', '<p>One user can be only one competition at current time. Only logged in users can view own active\r\n                    competition, judge status and ranklist.</p>\r\n\r\n                <p>Here competition info. Rules and rating system clarification. Maybe some hints for problems. </p>', '29 : 0 : 0', '2014-01-30 08:10:00', '0', '2014-01-29 03:10:00', 'OCCM Test Competition');
INSERT INTO `competitions` VALUES ('2', '<p>One user can be only one competition at current time. Only logged in users can view own active\r\n                    competition, judge status and ranklist.</p>\r\n\r\n                <p>Here competition info. Rules and rating system clarification. Maybe some hints for problems. </p>', '24 : 0 : 0', '2014-02-01 08:12:00', '0', '2014-01-31 08:12:00', 'CDAC Open Community Coders');
INSERT INTO `competitions` VALUES ('3', '<p>One user can be only one competition at current time. Only logged in users can view own active\r\n                    competition, judge status and ranklist.</p>\r\n\r\n                <p>Here competition info. Rules and rating system clarification. Maybe some hints for problems. </p>', '22 : 0 : 0', '2014-01-31 06:12:00', '0', '2014-01-30 08:12:00', 'Fast Code - High Score');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problems
-- ----------------------------
INSERT INTO `problems` VALUES ('1', 'A', '2014-01-30 08:32:41', 'Calculate a + b ', 'a and b', '-1 1', '-1 -11', '1', '64', 'a+b', '0', '-12', '0', '1', '2', 'A+B Problem', '1');
INSERT INTO `problems` VALUES ('2', 'B', '2014-01-30 08:18:26', 'The problem is so easy, that the authors were lazy to write a statement for it!', 'The input stream contains a&nbsp;set of&nbsp;integer numbers <i>A<sub>i</sub></i> (0&nbsp;â¤ <i>A<sub>i</sub></i> â¤ 10<sup>18</sup>). The numbers are separated by&nbsp;any number of&nbsp;spaces and line breaks. A&nbsp;size of&nbsp;the input stream does not exceed 256&nbsp;KB.', '1', '1427  0   \r\n\r\n   876652098643267843 \r\n5276538', '1', '64', 'For each number <i>A<sub>i</sub></i> from the last one till the first one you should output its square root. Each square root should be&nbsp;printed in&nbsp;a&nbsp;separate line with at&nbsp;least four digits after decimal point.', '1', '2297.0716\r\n936297014.1164\r\n0.0000\r\n37.7757', '0', '1', '2', 'Reverse Root', '2');
INSERT INTO `problems` VALUES ('3', 'A', '2014-01-30 08:20:53', 'You have a number of stones with known weights <i>w</i><sub>1</sub>, â¦, <i>w<sub>n</sub></i>.  Write a program that will rearrange the stones into two piles such that weight difference between the piles is minimal.', 'Input contains the number of stones <i>n</i> (1 â¤ <i>n</i> â¤ 20) and weights of the stones <i>w</i><sub>1</sub>, â¦, <i>w<sub>n</sub></i> (integers, 1 â¤ <i>w<sub>i</sub></i> â¤ 100000) delimited by white spaces.', '5\r\n5 8 13 27 14', '5\r\n5 8 13 27 14', '1', '64', 'Your program should output a number representing the minimal possible weight difference between stone piles.', '3', '3', '0', '1', '2', 'Stone Pile', '3');

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
  `input` text,
  `test` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2912EA7678780F9` (`competition_id`),
  KEY `FK2912EA721729CDE` (`failed_test_case`),
  KEY `FK2912EA7FCC3737B` (`language_id`),
  KEY `FK2912EA77F23FC79` (`problem_id`),
  KEY `FK2912EA7C76AE11` (`status`),
  KEY `FK2912EA7EC1431B` (`user_id`),
  CONSTRAINT `FK2912EA721729CDE` FOREIGN KEY (`failed_test_case`) REFERENCES `testcases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA7678780F9` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA77F23FC79` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA7C76AE11` FOREIGN KEY (`status`) REFERENCES `submission_status` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA7EC1431B` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2912EA7FCC3737B` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submissions
-- ----------------------------
INSERT INTO `submissions` VALUES ('1', '2014-01-30 08:33:02', null, '0', '', '0', '0', 'import java.util.Scanner;\r\nimport java.io.PrintWriter;\r\n\r\npublic class Problem {\r\n    public static void main(String[] args) {\r\n        Scanner scanner = new Scanner(System.in);\r\n        PrintWriter writer = new PrintWriter(System.out);\r\n\r\n        int i = scanner.nextInt();\r\n        writer.println(i);\r\n        writer.flush();\r\n    }\r\n}', null, '1', null, '2', '1', '0', '1', null, '0');
INSERT INTO `submissions` VALUES ('2', '2014-01-30 08:34:12', null, '0', '', '0', '0', 'import java.util.Scanner;\r\nimport java.io.PrintWriter;\r\n\r\npublic class Problem {\r\n    public static void main(String[] args) {\r\n        Scanner scanner = new Scanner(System.in);\r\n        PrintWriter writer = new PrintWriter(System.out);\r\n\r\n        int i = scanner.nextInt();\r\n        writer.println(i);\r\n        writer.flush();\r\n    }\r\n}', null, '3', null, '2', '3', '0', '1', null, '0');
INSERT INTO `submissions` VALUES ('3', '2014-01-30 08:37:22', null, '0', '', '0', '0', '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main()\r\n{\r\n    cout << \"Hello world!\" << endl;\r\n    return 0;\r\n}\r\n', null, '1', null, '1', '1', '0', '1', null, '0');
INSERT INTO `submissions` VALUES ('4', '2014-01-30 08:37:52', null, '0', '', '0', '0', '#include <stdio.h>\r\n#include <stdlib.h>\r\n\r\nint main()\r\n{\r\n    printf(\"Hello world!\");\r\n    return 0;\r\n}\r\n', null, '3', null, '0', '3', '0', '1', null, '0');
INSERT INTO `submissions` VALUES ('5', '2014-01-30 09:28:33', null, '0', '', '0', '0', 'import java.util.Scanner;\r\nimport java.io.PrintWriter;\r\n\r\npublic class Problem {\r\n    public static void main(String[] args) {\r\n        Scanner scanner = new Scanner(System.in);\r\n        PrintWriter writer = new PrintWriter(System.out);\r\n\r\n        int i = scanner.nextInt();\r\n        writer.println(i);\r\n        writer.flush();\r\n    }\r\n}', null, '3', null, '2', '3', '0', '1', null, '0');
INSERT INTO `submissions` VALUES ('6', '2014-01-30 09:45:08', null, '0', '', '0', '0', 'import java.util.Scanner;\r\nimport java.io.PrintWriter;\r\n\r\npublic class Problem {\r\n    public static void main(String[] args) {\r\n        Scanner scanner = new Scanner(System.in);\r\n        PrintWriter writer = new PrintWriter(System.out);\r\n\r\n        int i = scanner.nextInt();\r\n        writer.println(i);\r\n        writer.flush();\r\n    }\r\n}', null, '3', null, '2', '3', '0', '1', null, '0');
INSERT INTO `submissions` VALUES ('7', '2014-01-30 09:57:12', '11111111111', '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdasd', '1');
INSERT INTO `submissions` VALUES ('8', '2014-01-30 09:59:46', 'wwe', '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'eqweqe', '1');
INSERT INTO `submissions` VALUES ('9', '2014-01-30 10:03:08', '1312', '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'fff', '1');
INSERT INTO `submissions` VALUES ('10', '2014-01-30 10:07:48', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdas', '1');
INSERT INTO `submissions` VALUES ('11', '2014-01-30 10:19:33', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdsad', '1');
INSERT INTO `submissions` VALUES ('12', '2014-01-30 10:26:13', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdasd', '1');
INSERT INTO `submissions` VALUES ('13', '2014-01-30 10:27:22', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'sdasdas', '1');
INSERT INTO `submissions` VALUES ('14', '2014-01-30 10:35:01', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdasdsad', '1');
INSERT INTO `submissions` VALUES ('15', '2014-01-30 10:35:14', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdasdsad', '1');
INSERT INTO `submissions` VALUES ('16', '2014-01-30 10:37:15', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdasdsadasdsadas', '1');
INSERT INTO `submissions` VALUES ('17', '2014-01-30 10:37:24', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdasdsadasdsadas', '1');
INSERT INTO `submissions` VALUES ('18', '2014-01-30 10:37:32', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdasdsadasdsadas', '1');
INSERT INTO `submissions` VALUES ('19', '2014-01-30 10:41:35', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdasdsadasdsadas', '1');
INSERT INTO `submissions` VALUES ('20', '2014-01-30 10:42:34', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasdasdsadasdsadas', '1');
INSERT INTO `submissions` VALUES ('21', '2014-01-30 10:43:30', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', '', '1');
INSERT INTO `submissions` VALUES ('22', '2014-01-30 10:43:44', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdsad', '1');
INSERT INTO `submissions` VALUES ('23', '2014-01-30 10:43:59', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasda', '1');
INSERT INTO `submissions` VALUES ('24', '2014-01-30 10:44:08', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasda', '1');
INSERT INTO `submissions` VALUES ('25', '2014-01-30 10:45:13', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasda', '1');
INSERT INTO `submissions` VALUES ('26', '2014-01-30 10:45:48', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdasda', '1');
INSERT INTO `submissions` VALUES ('27', '2014-01-30 10:46:37', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'asdas', '1');
INSERT INTO `submissions` VALUES ('28', '2014-01-30 10:50:19', null, '0', '', '0', '0', 'import java.util.Scanner;\r\nimport java.io.PrintWriter;\r\n\r\npublic class Problem {\r\n    public static void main(String[] args) {\r\n        Scanner scanner = new Scanner(System.in);\r\n        PrintWriter writer = new PrintWriter(System.out);\r\n\r\n        int i = scanner.nextInt();\r\n        writer.println(i);\r\n        writer.flush();\r\n    }\r\n}', null, '3', null, '2', '3', '0', '1', null, '0');
INSERT INTO `submissions` VALUES ('29', '2014-01-30 10:50:39', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'adsasda', '1');
INSERT INTO `submissions` VALUES ('30', '2014-01-30 10:50:48', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'adsasda', '1');
INSERT INTO `submissions` VALUES ('31', '2014-01-30 10:50:57', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'adsasda', '1');
INSERT INTO `submissions` VALUES ('32', '2014-01-30 10:51:12', null, '0', '', '0', '0', 'import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}', null, '3', null, '2', '3', '0', '1', 'adsasda', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
INSERT INTO `testcases` VALUES ('1', '1 2', '3', '1');
INSERT INTO `testcases` VALUES ('2', '-1 1', '0', '1');
INSERT INTO `testcases` VALUES ('3', '0 0', '0', '1');
INSERT INTO `testcases` VALUES ('4', '9 16', '4\r\n3', '2');
INSERT INTO `testcases` VALUES ('5', '25\r\n\r\n16  64', '8\r\n4\r\n5', '2');
INSERT INTO `testcases` VALUES ('6', '5\r\n5 8 13 27 14', '3', '3');
INSERT INTO `testcases` VALUES ('7', '5\r\n5 8 13 27 14', '3', '3');
INSERT INTO `testcases` VALUES ('8', '1 4', '5', '1');

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
  CONSTRAINT `FKD519E688678780F9` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKD519E688EC1431B` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_competitions
-- ----------------------------
INSERT INTO `user_competitions` VALUES ('1', '1', '3', '1');
INSERT INTO `user_competitions` VALUES ('2', '1', '2', '1');

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
