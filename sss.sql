/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : sss

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2017-11-17 11:29:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add mvinfo', '7', 'add_mvinfo');
INSERT INTO `auth_permission` VALUES ('20', 'Can change mvinfo', '7', 'change_mvinfo');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete mvinfo', '7', 'delete_mvinfo');
INSERT INTO `auth_permission` VALUES ('22', 'Can add tg', '8', 'add_tg');
INSERT INTO `auth_permission` VALUES ('23', 'Can change tg', '8', 'change_tg');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete tg', '8', 'delete_tg');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$20000$32UNoof23roD$z9jp9+IHFHqUPdZGxVNFydaNYWdY6Xyz26nrK6Xnn6w=', null, '1', 'admin', '', '', 'a@a.com', '1', '1', '2017-11-17 00:58:54');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'ys', 'mvinfo');
INSERT INTO `django_content_type` VALUES ('8', 'ys', 'tg');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-11-17 00:58:01');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-11-17 00:58:02');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-11-17 00:58:02');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2017-11-17 00:58:02');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2017-11-17 00:58:02');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2017-11-17 00:58:02');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2017-11-17 00:58:02');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2017-11-17 00:58:03');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2017-11-17 00:58:03');
INSERT INTO `django_migrations` VALUES ('10', 'sessions', '0001_initial', '2017-11-17 00:58:03');
INSERT INTO `django_migrations` VALUES ('11', 'ys', '0001_initial', '2017-11-17 00:58:03');
INSERT INTO `django_migrations` VALUES ('12', 'ys', '0002_tg', '2017-11-17 00:58:03');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `ys_mvinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ys_mvinfo`;
CREATE TABLE `ys_mvinfo` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `url` varchar(350) NOT NULL,
  `uri` varchar(350) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_mvinfo
-- ----------------------------
INSERT INTO `ys_mvinfo` VALUES ('1', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('2', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('3', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('4', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('5', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('6', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('7', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('8', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('9', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('10', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('11', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('12', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('13', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('14', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('15', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('16', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('17', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('18', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('19', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('20', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('21', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('22', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('23', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('24', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('25', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('26', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('27', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('28', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('29', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('30', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('31', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('32', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('33', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('34', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('35', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('36', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('37', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('38', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('39', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('40', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('41', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('42', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('43', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('44', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('45', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('46', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('47', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('48', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('49', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('50', '哈哈哈哈8', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('51', '哈哈哈哈9', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('52', '哈哈哈哈10', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('53', '哈哈哈哈11', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('54', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('55', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('56', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('57', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('58', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('59', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('60', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('61', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('62', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('63', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('64', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('65', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('66', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('67', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('68', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('69', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('70', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('71', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('72', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('73', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('74', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('75', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('76', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('77', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('78', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('79', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('80', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('81', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('82', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('83', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('84', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('85', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('86', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('87', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('88', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('89', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('90', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('91', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('92', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('93', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('94', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('95', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('96', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('97', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('98', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('99', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('100', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('101', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('102', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('103', '哈哈哈哈8', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('104', '哈哈哈哈9', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('105', '哈哈哈哈10', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('106', '哈哈哈哈11', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('107', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('108', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('109', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('110', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('111', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('112', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('113', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('114', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('115', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('116', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('117', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('118', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('119', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('120', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('121', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('122', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('123', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('124', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('125', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('126', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('127', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('128', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('129', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('130', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('131', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('132', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('133', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('134', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('135', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('136', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('137', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('138', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('139', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('140', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('141', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('142', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('143', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('144', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('145', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('146', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('147', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('148', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('149', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('150', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('151', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('152', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('153', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('154', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('155', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('156', '哈哈哈哈8', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('157', '哈哈哈哈9', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('158', '哈哈哈哈10', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('159', '哈哈哈哈11', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('160', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('161', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('162', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('163', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('164', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('165', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('166', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('167', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('168', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('169', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('170', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('171', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('172', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('173', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('174', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('175', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('176', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('177', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('178', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('179', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('180', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('181', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('182', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('183', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('184', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('185', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('186', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('187', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('188', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('189', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('190', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('191', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('192', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('193', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('194', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('195', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('196', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('197', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('198', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('199', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('200', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('201', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('202', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('203', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('204', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('205', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('206', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('207', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('208', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('209', '哈哈哈哈8', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('210', '哈哈哈哈9', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('211', '哈哈哈哈10', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('212', '哈哈哈哈11', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('213', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('214', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('215', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('216', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('217', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('218', '哈哈哈哈6', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('219', '哈哈哈哈7', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('220', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('221', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('222', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('223', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('224', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('225', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('226', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('227', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('228', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('229', '哈哈哈哈2', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('230', '哈哈哈哈3', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('231', '哈哈哈哈4', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('232', '哈哈哈哈5', 'https://www.baidu.com/', 'https://www.baidu.com/');
INSERT INTO `ys_mvinfo` VALUES ('233', '哈哈哈哈1', 'https://www.baidu.com/', 'https://www.baidu.com/');

-- ----------------------------
-- Table structure for `ys_tg`
-- ----------------------------
DROP TABLE IF EXISTS `ys_tg`;
CREATE TABLE `ys_tg` (
  `id` varchar(36) NOT NULL,
  `url` varchar(350) NOT NULL,
  `timeout` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_tg
-- ----------------------------
