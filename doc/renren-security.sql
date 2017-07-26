/*
Navicat MySQL Data Transfer

Source Server         : 本地mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : renren-security

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-26 19:56:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022696F2E72656E72656E2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'io.renren.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022696F2E72656E72656E2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', '3c-PC1501069512450', '1501070176138', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1501070400000', '-1', '5', 'WAITING', 'CRON', '1499655202000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022696F2E72656E72656E2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1499655600000', '-1', '5', 'PAUSED', 'CRON', '1499655202000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022696F2E72656E72656E2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2017-07-10 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-10 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2017-07-10 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2017-07-10 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2017-07-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'renren', '0', null, '1197', '2017-07-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2017-07-10 14:00:02');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2017-07-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2017-07-10 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-10 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2017-07-10 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-11 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-11 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2017-07-11 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2017-07-11 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2017-07-11 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2017-07-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2017-07-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'test', 'renren', '0', null, '1312', '2017-07-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2017-07-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'test', 'renren', '0', null, '1020', '2017-07-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2017-07-11 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'test', 'renren', '0', null, '1384', '2017-07-11 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'test', 'renren', '0', null, '1026', '2017-07-12 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2017-07-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'test', 'renren', '0', null, '1046', '2017-07-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2017-07-12 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'test', 'renren', '0', null, '1175', '2017-07-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2017-07-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-12 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2017-07-12 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2017-07-12 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2017-07-12 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2017-07-12 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-12 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-12 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'test', 'renren', '0', null, '1060', '2017-07-12 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2017-07-12 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2017-07-13 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'test', 'renren', '0', null, '1407', '2017-07-13 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'test', 'renren', '0', null, '1057', '2017-07-13 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-13 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'test', 'renren', '0', null, '1037', '2017-07-14 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2017-07-14 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'test', 'renren', '0', null, '1047', '2017-07-14 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2017-07-14 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-14 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-14 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-14 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-14 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'test', 'renren', '0', null, '1048', '2017-07-17 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2017-07-17 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2017-07-17 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2017-07-17 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-17 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-17 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2017-07-17 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'test', 'renren', '0', null, '1026', '2017-07-17 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'test', 'renren', '0', null, '1400', '2017-07-17 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'test', 'renren', '0', null, '1078', '2017-07-17 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2017-07-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'test', 'renren', '0', null, '1085', '2017-07-17 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-17 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2017-07-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2017-07-17 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2017-07-18 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2017-07-18 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2017-07-18 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2017-07-18 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'test', 'renren', '0', null, '1127', '2017-07-18 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2017-07-18 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'test', 'renren', '0', null, '1020', '2017-07-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2017-07-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-18 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-18 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-18 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'test', 'renren', '0', null, '1634', '2017-07-18 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2017-07-18 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'test', 'renren', '0', null, '1034', '2017-07-18 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-19 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2017-07-19 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2017-07-19 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2017-07-19 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'testTask', 'test', 'renren', '0', null, '1048', '2017-07-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2017-07-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2017-07-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'test', 'renren', '0', null, '1020', '2017-07-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2017-07-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2017-07-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2017-07-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'test', 'renren', '0', null, '1049', '2017-07-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'test', 'renren', '0', null, '1044', '2017-07-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2017-07-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2017-07-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2017-07-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2017-07-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-21 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2017-07-21 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2017-07-21 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'test', 'renren', '0', null, '1020', '2017-07-21 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('110', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2017-07-21 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2017-07-21 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('112', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2017-07-21 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2017-07-21 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2017-07-21 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('115', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2017-07-21 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2017-07-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('117', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2017-07-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'test', 'renren', '0', null, '1155', '2017-07-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('119', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2017-07-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2017-07-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-24 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('122', '1', 'testTask', 'test', 'renren', '0', null, '1227', '2017-07-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2017-07-24 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('124', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'test', 'renren', '0', null, '1138', '2017-07-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'test', 'renren', '0', null, '1039', '2017-07-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('127', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2017-07-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('128', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2017-07-25 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'test', 'renren', '0', null, '1084', '2017-07-25 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'test', 'renren', '0', null, '1058', '2017-07-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('131', '1', 'testTask', 'test', 'renren', '0', null, '1020', '2017-07-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('133', '1', 'testTask', 'test', 'renren', '0', null, '1020', '2017-07-25 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'test', 'renren', '0', null, '1049', '2017-07-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('135', '1', 'testTask', 'test', 'renren', '0', null, '1320', '2017-07-25 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'test', 'renren', '0', null, '1026', '2017-07-25 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2017-07-25 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('138', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2017-07-25 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'test', 'renren', '0', null, '1046', '2017-07-26 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('140', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2017-07-26 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'test', 'renren', '0', null, '1020', '2017-07-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'test', 'renren', '0', null, '1371', '2017-07-26 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('143', '1', 'testTask', 'test', 'renren', '0', null, '1047', '2017-07-26 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'test', 'renren', '0', null, '1134', '2017-07-26 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('145', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2017-07-26 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2017-07-26 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2017-07-26 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('148', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2017-07-26 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('149', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2017-07-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2017-07-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'test', 'renren', '0', null, '1046', '2017-07-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('152', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2017-07-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'test', 'renren', '0', null, '1030', '2017-07-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('154', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2017-07-26 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'test', 'renren', '0', null, '1032', '2017-07-26 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2017-07-26 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('157', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-07-26 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'test', 'renren', '0', null, '1032', '2017-07-26 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('159', '1', 'testTask', 'test', 'renren', '0', null, '1041', '2017-07-26 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'test', 'renren', '0', null, '1066', '2017-07-26 19:30:00');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '修改用户', 'io.renren.controller.SysUserController.update()', '{\"createTime\":1478833871000,\"createUserId\":1,\"email\":\"1197192589@qq.com\",\"mobile\":\"18751861827\",\"roleIdList\":[],\"status\":1,\"userId\":1,\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2017-07-10 11:04:51');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存角色', 'io.renren.controller.SysRoleController.save()', '{\"menuIdList\":[1,4,23,24,25,26],\"remark\":\"菜单管理员\",\"roleName\":\"菜单管理员\"}', '0:0:0:0:0:0:0:1', '2017-07-10 17:25:33');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存用户', 'io.renren.controller.SysUserController.save()', '{\"roleIdList\":[1],\"status\":1,\"username\":\"admin1\"}', '0:0:0:0:0:0:0:1', '2017-07-11 09:25:13');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存用户', 'io.renren.controller.SysUserController.save()', '{\"email\":\"admin1@qq.com\",\"roleIdList\":[1],\"status\":1,\"username\":\"admin1\"}', '0:0:0:0:0:0:0:1', '2017-07-11 09:25:31');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存菜单', 'io.renren.controller.SysMenuController.save()', '{\"icon\":\"fa fa-map-marker\",\"name\":\"地图显示\",\"orderNum\":10,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2017-07-11 10:23:03');
INSERT INTO `sys_log` VALUES ('6', 'admin', '删除菜单', 'io.renren.controller.SysMenuController.delete()', '[31]', '0:0:0:0:0:0:0:1', '2017-07-11 10:23:39');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存菜单', 'io.renren.controller.SysMenuController.save()', '{\"icon\":\"fa fa-map-marker\",\"name\":\"地图显示\",\"orderNum\":10,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/map.html\"}', '0:0:0:0:0:0:0:1', '2017-07-11 10:24:49');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改菜单', 'io.renren.controller.SysMenuController.update()', '{\"icon\":\"fa fa-map-marker\",\"menuId\":32,\"name\":\"地图显示\",\"orderNum\":10,\"parentId\":1,\"parentName\":\"系统管理\",\"type\":1,\"url\":\"sys/map.html\"}', '0:0:0:0:0:0:0:1', '2017-07-11 10:25:57');
INSERT INTO `sys_log` VALUES ('9', 'admin', '修改角色', 'io.renren.controller.SysRoleController.update()', '{\"createTime\":1499678733000,\"createUserId\":1,\"menuIdList\":[1,4,23,24],\"remark\":\"菜单管理员\",\"roleId\":1,\"roleName\":\"菜单管理员\"}', '0:0:0:0:0:0:0:1', '2017-07-11 16:03:44');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存菜单', 'io.renren.controller.SysMenuController.save()', '{\"icon\":\"fa fa-medkit\",\"name\":\"医疗管理\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2017-07-11 16:55:53');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改菜单', 'io.renren.controller.SysMenuController.update()', '{\"icon\":\"fa fa-medkit\",\"menuId\":33,\"name\":\"医疗管理\",\"orderNum\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2017-07-11 16:56:42');
INSERT INTO `sys_log` VALUES ('12', 'admin', '保存菜单', 'io.renren.controller.SysMenuController.save()', '{\"icon\":\"fa fa-users\",\"name\":\"医疗组织\",\"orderNum\":201,\"parentId\":33,\"parentName\":\"医疗管理\",\"type\":1,\"url\":\"yl/organization\"}', '0:0:0:0:0:0:0:1', '2017-07-11 17:26:01');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'io.renren.controller.SysMenuController.update()', '{\"icon\":\"fa fa-users\",\"menuId\":34,\"name\":\"医疗组织\",\"orderNum\":201,\"parentId\":33,\"parentName\":\"医疗管理\",\"type\":1,\"url\":\"yl/organization.html\"}', '0:0:0:0:0:0:0:1', '2017-07-11 17:26:37');
INSERT INTO `sys_log` VALUES ('14', 'admin', '修改医疗组织', 'io.renren.controller.YlOrganizationController.update()', '{\"id\":1,\"name\":\"旗直医疗卫生机构\",\"remark\":\"111\"}', '0:0:0:0:0:0:0:1', '2017-07-12 10:24:15');
INSERT INTO `sys_log` VALUES ('15', 'admin', '删除医疗组织', 'io.renren.controller.YlOrganizationController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2017-07-12 10:24:30');
INSERT INTO `sys_log` VALUES ('16', 'admin', '删除医疗组织', 'io.renren.controller.YlOrganizationController.delete()', '[2,4]', '0:0:0:0:0:0:0:1', '2017-07-12 10:24:35');
INSERT INTO `sys_log` VALUES ('17', 'admin', '修改医疗组织', 'io.renren.controller.YlOrganizationController.update()', '{\"id\":3,\"name\":\"社区卫生服务中心\",\"remark\":\"111\"}', '0:0:0:0:0:0:0:1', '2017-07-12 10:27:30');
INSERT INTO `sys_log` VALUES ('18', 'admin', '保存医疗组织', 'io.renren.controller.YlOrganizationController.save()', '{\"name\":\"ssss\",\"remark\":\"aaaa\"}', '0:0:0:0:0:0:0:1', '2017-07-12 10:27:39');
INSERT INTO `sys_log` VALUES ('19', 'admin', '删除医疗组织', 'io.renren.controller.YlOrganizationController.delete()', '[3,5,6,7,8,9,10,11,12,13]', '0:0:0:0:0:0:0:1', '2017-07-12 10:28:24');
INSERT INTO `sys_log` VALUES ('20', 'admin', '修改菜单', 'io.renren.controller.SysMenuController.update()', '{\"icon\":\"fa fa-hospital-o\",\"menuId\":35,\"name\":\"医院信息\",\"orderNum\":202,\"parentId\":33,\"parentName\":\"医疗管理\",\"perms\":\"yl:hospital:list,yl:hospital:info,yl:hospital:save,yl:hospital:update,yl:hospital:delete\",\"type\":1,\"url\":\"yl/hospital.html\"}', '0:0:0:0:0:0:0:1', '2017-07-12 11:27:54');
INSERT INTO `sys_log` VALUES ('21', 'admin', '保存医疗组织', 'io.renren.controller.YlHospitalController.save()', '{}', '0:0:0:0:0:0:0:1', '2017-07-13 16:33:50');
INSERT INTO `sys_log` VALUES ('22', 'admin', '修改菜单', 'io.renren.controller.SysMenuController.update()', '{\"icon\":\"fa fa-users\",\"menuId\":36,\"name\":\"科室信息\",\"orderNum\":203,\"parentId\":33,\"parentName\":\"医疗管理\",\"perms\":\"yl:department:list,yl:department:info,yl:department:save,yl:department:update,yl:department:delete\",\"type\":1,\"url\":\"yl/department.html\"}', '0:0:0:0:0:0:0:1', '2017-07-14 10:17:37');
INSERT INTO `sys_log` VALUES ('23', 'admin', '修改菜单', 'io.renren.controller.SysMenuController.update()', '{\"icon\":\"fa fa-user\",\"menuId\":37,\"name\":\"专家信息\",\"orderNum\":204,\"parentId\":33,\"parentName\":\"医疗管理\",\"perms\":\"yl:specialist:list,yl:specialist:info,yl:specialist:save,yl:specialist:update,yl:specialist:delete\",\"type\":1,\"url\":\"yl/specialist.html\"}', '0:0:0:0:0:0:0:1', '2017-07-14 10:18:02');
INSERT INTO `sys_log` VALUES ('24', 'admin', '保存菜单', 'io.renren.controller.SysMenuController.save()', '{\"icon\":\"fa fa-users\",\"name\":\"会员管理\",\"orderNum\":300,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1}', '0:0:0:0:0:0:0:1', '2017-07-14 17:22:54');
INSERT INTO `sys_log` VALUES ('25', 'admin', '保存菜单', 'io.renren.controller.SysMenuController.save()', '{\"icon\":\"fa fa-users\",\"name\":\"会员管理\",\"orderNum\":300,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"qq/users\"}', '0:0:0:0:0:0:0:1', '2017-07-14 17:24:11');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改菜单', 'io.renren.controller.SysMenuController.update()', '{\"icon\":\"fa fa-users\",\"menuId\":38,\"name\":\"会员管理\",\"orderNum\":300,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0,\"url\":\"qq/users\"}', '0:0:0:0:0:0:0:1', '2017-07-14 17:24:51');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'io.renren.controller.SysMenuController.save()', '{\"icon\":\"fa fa-info-circle\",\"name\":\"信息发布\",\"orderNum\":400,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2017-07-14 17:27:01');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存菜单', 'io.renren.controller.SysMenuController.save()', '{\"icon\":\"fa fa-map-marker\",\"name\":\"位置管理\",\"orderNum\":401,\"parentId\":39,\"parentName\":\"信息发布\",\"type\":1,\"url\":\"xx/location.html\"}', '0:0:0:0:0:0:0:1', '2017-07-14 17:35:15');
INSERT INTO `sys_log` VALUES ('29', 'admin', '删除菜单', 'io.renren.controller.SysMenuController.delete()', '[32]', '0:0:0:0:0:0:0:1', '2017-07-17 15:41:56');
INSERT INTO `sys_log` VALUES ('30', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:08:16');
INSERT INTO `sys_log` VALUES ('31', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:10:33');
INSERT INTO `sys_log` VALUES ('32', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:22:39');
INSERT INTO `sys_log` VALUES ('33', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:25:18');
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:25:30');
INSERT INTO `sys_log` VALUES ('35', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:27:30');
INSERT INTO `sys_log` VALUES ('36', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:30:59');
INSERT INTO `sys_log` VALUES ('37', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:32:13');
INSERT INTO `sys_log` VALUES ('38', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:40:49');
INSERT INTO `sys_log` VALUES ('39', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:41:57');
INSERT INTO `sys_log` VALUES ('40', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{}', '0:0:0:0:0:0:0:1', '2017-07-24 15:50:29');
INSERT INTO `sys_log` VALUES ('41', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"18751861827\",\"longitude\":\"107.8\",\"latitude\":\"38.2\"}', '0:0:0:0:0:0:0:1', '2017-07-24 15:52:38');
INSERT INTO `sys_log` VALUES ('42', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"18751861827\",\"longitude\":\"107.8\",\"latitude\":\"38.2\",\"updateDate\":\"2017-7-24\"}', '0:0:0:0:0:0:0:1', '2017-07-24 16:21:56');
INSERT INTO `sys_log` VALUES ('43', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"18751861827\",\"longitude\":\"107.8\",\"latitude\":\"38.2\",\"updateDate\":\"2017-7-24\"}', '0:0:0:0:0:0:0:1', '2017-07-24 16:23:14');
INSERT INTO `sys_log` VALUES ('44', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"18751861827\",\"longitude\":\"107.8\",\"latitude\":\"38.2\",\"updateDate\":\"2017-7-24\"}', '0:0:0:0:0:0:0:1', '2017-07-24 16:24:34');
INSERT INTO `sys_log` VALUES ('45', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"1\",\"name\":\"重庆\",\"address\":\"重庆市\",\"contact\":\"1111\",\"longitude\":\"107.4\",\"latitude\":\"38\",\"updateDate\":\"2017-7-24\"}', '0:0:0:0:0:0:0:1', '2017-07-24 16:33:21');
INSERT INTO `sys_log` VALUES ('46', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"1\",\"name\":\"重庆\",\"address\":\"重庆市\",\"contact\":\"1111\",\"longitude\":\"107.4\",\"latitude\":\"38\",\"updateDate\":\"2017-7-24\"}', '0:0:0:0:0:0:0:1', '2017-07-24 17:18:19');
INSERT INTO `sys_log` VALUES ('47', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"18751861827111\",\"longitude\":\"107.8\",\"latitude\":\"38.2\",\"updateDate\":\"2017-7-25\"}', '0:0:0:0:0:0:0:1', '2017-07-25 16:16:54');
INSERT INTO `sys_log` VALUES ('48', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"longitude\":\"107.8\",\"latitude\":\"38.2\",\"updateDate\":\"2017-7-25\"}', '0:0:0:0:0:0:0:1', '2017-07-25 19:21:34');
INSERT INTO `sys_log` VALUES ('49', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"longitude\":\"107.8\",\"latitude\":\"38.2\",\"updateDate\":\"2017-7-25\"}', '0:0:0:0:0:0:0:1', '2017-07-25 19:25:24');
INSERT INTO `sys_log` VALUES ('50', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"longitude\":\"107.8\",\"latitude\":\"38.2\",\"updateDate\":\"2017-7-25\"}', '0:0:0:0:0:0:0:1', '2017-07-25 19:25:41');
INSERT INTO `sys_log` VALUES ('51', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"longitude\":\"107.8\",\"latitude\":\"38.2\",\"updateDate\":\"2017-7-25\"}', '0:0:0:0:0:0:0:1', '2017-07-25 19:38:01');
INSERT INTO `sys_log` VALUES ('52', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"\",\"name\":\"幼儿园1\",\"address\":\"幼儿园1\",\"contact\":\"026-26548975\",\"longitude\":\"107.134855\",\"latitude\":\"38.127866\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:32:04');
INSERT INTO `sys_log` VALUES ('53', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"longitude\":\"107.323428\",\"latitude\":\"38.096977\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:32:56');
INSERT INTO `sys_log` VALUES ('54', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"longitude\":\"107.631582\",\"latitude\":\"38.136949\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:33:04');
INSERT INTO `sys_log` VALUES ('55', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"\",\"name\":\"asda\",\"address\":\"asdasd\",\"contact\":\"025-59876541\",\"longitude\":\"107.301581\",\"latitude\":\"38.267611\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:33:51');
INSERT INTO `sys_log` VALUES ('56', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"\",\"name\":\"asdlka\",\"address\":\"asdaksd\",\"contact\":\"025-59876548\",\"longitude\":\"107.482104\",\"latitude\":\"38.205939\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:34:54');
INSERT INTO `sys_log` VALUES ('57', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"\",\"name\":\"asda\",\"address\":\"asdas\",\"contact\":\"025-89654784\",\"longitude\":\"107.483254\",\"latitude\":\"38.196865\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:37:46');
INSERT INTO `sys_log` VALUES ('58', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"\",\"name\":\"asd\",\"address\":\"asd\",\"contact\":\"025-89754879\",\"longitude\":\"107.485554\",\"latitude\":\"38.19505\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:38:09');
INSERT INTO `sys_log` VALUES ('59', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"幼儿园1\",\"address\":\"原二院1\",\"contact\":\"025-59876985\",\"longitude\":\"107.490153\",\"latitude\":\"38.19142\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:41:57');
INSERT INTO `sys_log` VALUES ('60', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"饭店1\",\"address\":\"饭店地址\",\"contact\":\"025-89788578\",\"longitude\":\"107.491303\",\"latitude\":\"38.19505\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:45:04');
INSERT INTO `sys_log` VALUES ('61', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"酒店1\",\"address\":\"酒店地址\",\"contact\":\"025-59874585\",\"longitude\":\"107.485554\",\"latitude\":\"38.205939\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:50:09');
INSERT INTO `sys_log` VALUES ('62', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"酒店1\",\"address\":\"酒店地址\",\"contact\":\"025-26514444\",\"longitude\":\"107.483254\",\"latitude\":\"38.202309\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:52:53');
INSERT INTO `sys_log` VALUES ('63', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"兽医点1\",\"address\":\"兽医点地址\",\"contact\":\"025-88888888\",\"longitude\":\"107.477505\",\"latitude\":\"38.196865\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 09:56:54');
INSERT INTO `sys_log` VALUES ('64', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"幼儿园1\",\"address\":\"幼儿园地址\",\"contact\":\"025-88888888\",\"longitude\":\"107.478655\",\"latitude\":\"38.200494\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"2\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:07:42');
INSERT INTO `sys_log` VALUES ('65', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"3\",\"name\":\"幼儿园1\",\"address\":\"幼儿园地址\",\"contact\":\"025-88888888\",\"longitude\":\"107.141754\",\"latitude\":\"38.225897\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:08:06');
INSERT INTO `sys_log` VALUES ('66', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"3\",\"name\":\"幼儿园1\",\"address\":\"幼儿园地址\",\"contact\":\"025-88888888\",\"longitude\":\"107.569491\",\"latitude\":\"38.022425\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:08:15');
INSERT INTO `sys_log` VALUES ('67', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"phone\":\"025-3698547\",\"longitude\":\"107.356773\",\"latitude\":\"38.151478\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:37:28');
INSERT INTO `sys_log` VALUES ('68', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"phone\":\"025-3698547\",\"longitude\":\"107.432661\",\"latitude\":\"38.078801\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:37:38');
INSERT INTO `sys_log` VALUES ('69', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"phone\":\"025-3698547\",\"longitude\":\"107.448759\",\"latitude\":\"38.086072\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:39:22');
INSERT INTO `sys_log` VALUES ('70', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"phone\":\"025-3698547\",\"longitude\":\"107.453358\",\"latitude\":\"38.098794\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:40:26');
INSERT INTO `sys_log` VALUES ('71', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"3\",\"name\":\"幼儿园1\",\"address\":\"幼儿园地址\",\"contact\":\"025-88888888\",\"phone\":\"025-88888888\",\"longitude\":\"107.570641\",\"latitude\":\"38.03334\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:40:32');
INSERT INTO `sys_log` VALUES ('72', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"phone\":\"025-3698547\",\"longitude\":\"107.455658\",\"latitude\":\"38.109698\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:43:58');
INSERT INTO `sys_log` VALUES ('73', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"phone\":\"025-3698547\",\"longitude\":\"107.461407\",\"latitude\":\"38.118782\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:44:24');
INSERT INTO `sys_log` VALUES ('74', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"phone\":\"\",\"longitude\":\"107.462845\",\"latitude\":\"38.119009\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:49:50');
INSERT INTO `sys_log` VALUES ('75', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"3\",\"name\":\"幼儿园1\",\"address\":\"幼儿园地址\",\"contact\":\"025-88888888\",\"phone\":\"\",\"longitude\":\"107.574953\",\"latitude\":\"38.034022\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 10:50:08');
INSERT INTO `sys_log` VALUES ('76', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"北京\",\"address\":\"北京市\",\"contact\":\"025-3698547\",\"phone\":\"\",\"longitude\":\"107.462845\",\"latitude\":\"38.126731\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 12:19:25');
INSERT INTO `sys_log` VALUES ('77', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"政府部门2\",\"address\":\"政府部门地址\",\"contact\":\"025-36958698\",\"phone\":\"\",\"longitude\":\"107.501364\",\"latitude\":\"38.13218\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"1\"}', '0:0:0:0:0:0:0:1', '2017-07-26 12:21:45');
INSERT INTO `sys_log` VALUES ('78', 'admin', '删除位置信息', 'io.renren.controller.XxLocationController.delete()', '{\"id\":\"4\"}', '0:0:0:0:0:0:0:1', '2017-07-26 17:55:55');
INSERT INTO `sys_log` VALUES ('79', 'admin', '删除位置信息', 'io.renren.controller.XxLocationController.delete()', '{\"id\":\"1\"}', '0:0:0:0:0:0:0:1', '2017-07-26 17:56:10');
INSERT INTO `sys_log` VALUES ('80', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"幼儿园2\",\"address\":\"幼儿园地址2\",\"contact\":\"\",\"phone\":\"18751861827\",\"longitude\":\"107.484116\",\"latitude\":\"38.196638\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"2\"}', '0:0:0:0:0:0:0:1', '2017-07-26 18:20:30');
INSERT INTO `sys_log` VALUES ('81', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"5\",\"name\":\"幼儿园2\",\"address\":\"幼儿园地址2\",\"contact\":\"\",\"phone\":\"18751861827\",\"longitude\":\"107.442148\",\"latitude\":\"38.223856\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 18:20:39');
INSERT INTO `sys_log` VALUES ('82', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"兽医点1\",\"address\":\"兽医点地址1\",\"contact\":\"025-89878987\",\"phone\":\"\",\"longitude\":\"107.38868\",\"latitude\":\"38.183025\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"5\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:34:27');
INSERT INTO `sys_log` VALUES ('83', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"兽医点2\",\"address\":\"兽医点地址2\",\"contact\":\"026-96966363\",\"phone\":\"\",\"longitude\":\"107.350736\",\"latitude\":\"38.110379\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"5\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:34:53');
INSERT INTO `sys_log` VALUES ('84', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"酒店1\",\"address\":\"酒店地址1\",\"contact\":\"\",\"phone\":\"18756986987\",\"longitude\":\"107.534709\",\"latitude\":\"38.201175\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"4\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:35:21');
INSERT INTO `sys_log` VALUES ('85', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"酒店2\",\"address\":\"酒店地址2\",\"contact\":\"\",\"phone\":\"16989657\",\"longitude\":\"107.455371\",\"latitude\":\"38.090388\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"4\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:35:57');
INSERT INTO `sys_log` VALUES ('86', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"饭店1\",\"address\":\"饭店地址1\",\"contact\":\"023-98787468\",\"phone\":\"\",\"longitude\":\"107.553106\",\"latitude\":\"38.101293\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"3\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:36:39');
INSERT INTO `sys_log` VALUES ('87', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"饭店2\",\"address\":\"饭店地址2\",\"contact\":\"010-68863249\",\"phone\":\"15651282709\",\"longitude\":\"107.417426\",\"latitude\":\"38.146711\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"3\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:37:21');
INSERT INTO `sys_log` VALUES ('88', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"2\",\"name\":\"政府1\",\"address\":\"政府地址1\",\"contact\":\"025-36985471\",\"phone\":\"\",\"longitude\":\"107.465719\",\"latitude\":\"38.135813\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:37:48');
INSERT INTO `sys_log` VALUES ('89', 'admin', '新增位置信息', 'io.renren.controller.XxLocationController.save()', '{\"id\":\"\",\"name\":\"政府2\",\"address\":\"政府地址2\",\"contact\":\"\",\"phone\":\"16598782321\",\"longitude\":\"107.502514\",\"latitude\":\"38.177579\",\"updateDate\":\"2017-7-26\",\"createDate\":\"2017-7-26\",\"category\":\"1\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:38:15');
INSERT INTO `sys_log` VALUES ('90', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"8\",\"name\":\"酒店1\",\"address\":\"酒店地址1\",\"contact\":\"\",\"phone\":\"18756986987\",\"longitude\":\"107.511712\",\"latitude\":\"38.213424\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:38:36');
INSERT INTO `sys_log` VALUES ('91', 'admin', '修改位置信息', 'io.renren.controller.XxLocationController.update()', '{\"id\":\"3\",\"name\":\"幼儿园1\",\"address\":\"幼儿园地址\",\"contact\":\"025-88888888\",\"phone\":\"\",\"longitude\":\"107.504813\",\"latitude\":\"38.119918\",\"updateDate\":\"2017-7-26\"}', '0:0:0:0:0:0:0:1', '2017-07-26 19:38:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '100');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user.html', null, '1', 'fa fa-user', '101');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role.html', null, '1', 'fa fa-user-secret', '102');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu.html', null, '1', 'fa fa-th-list', '103');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '104');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'sys/schedule.html', null, '1', 'fa fa-tasks', '105');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '106');
INSERT INTO `sys_menu` VALUES ('28', '1', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '108');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '107');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'sys/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '109');
INSERT INTO `sys_menu` VALUES ('33', '0', '医疗管理', null, null, '0', 'fa fa-medkit', '200');
INSERT INTO `sys_menu` VALUES ('34', '33', '医疗组织', 'yl/organization.html', 'yl:organization:list,yl:organization:info,yl:organization:save,yl:organization:update,yl:organization:delete,yl:organization:select', '1', 'fa fa-users', '201');
INSERT INTO `sys_menu` VALUES ('35', '33', '医院信息', 'yl/hospital.html', 'yl:hospital:list,yl:hospital:info,yl:hospital:save,yl:hospital:update,yl:hospital:delete,yl:hospital:select', '1', 'fa fa-hospital-o', '202');
INSERT INTO `sys_menu` VALUES ('36', '33', '科室信息', 'yl/department.html', 'yl:department:list,yl:department:info,yl:department:save,yl:department:update,yl:department:delete,yl:department:select', '1', 'fa fa-users', '203');
INSERT INTO `sys_menu` VALUES ('37', '33', '专家信息', 'yl/specialist.html', 'yl:specialist:list,yl:specialist:info,yl:specialist:save,yl:specialist:update,yl:specialist:delete', '1', 'fa fa-user', '204');
INSERT INTO `sys_menu` VALUES ('38', '0', '会员管理', 'qq/users', null, '0', 'fa fa-users', '300');
INSERT INTO `sys_menu` VALUES ('39', '0', '信息发布', null, null, '0', 'fa fa-info-circle', '400');
INSERT INTO `sys_menu` VALUES ('40', '39', '位置管理', 'xx/location.html', 'xx:location:list,xx:location:save,xx:location:delete,xx:location:update,xx:location:select', '1', 'fa fa-map-marker', '401');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '菜单管理员', '菜单管理员', '1', '2017-07-10 17:25:33');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('7', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('10', '1', '24');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1197192589@qq.com', '18751861827', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'admin1', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin1@qq.com', null, '1', '1', '2017-07-11 09:25:31');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Records of tb_token
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Table structure for xx_issue
-- ----------------------------
DROP TABLE IF EXISTS `xx_issue`;
CREATE TABLE `xx_issue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `content` mediumtext,
  `author` varchar(10) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  `category` int(10) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_issue
-- ----------------------------

-- ----------------------------
-- Table structure for xx_location
-- ----------------------------
DROP TABLE IF EXISTS `xx_location`;
CREATE TABLE `xx_location` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `content` mediumtext,
  `author` varchar(10) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  `category` int(10) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_location
-- ----------------------------
INSERT INTO `xx_location` VALUES ('2', '政府1', '政府地址1', '025-36985471', '', '', '', '', '2017-07-11', '2017-07-26', '1', '107.465719', '38.135813', '');
INSERT INTO `xx_location` VALUES ('3', '幼儿园1', '幼儿园地址', '025-88888888', '', null, null, null, '2017-07-26', '2017-07-26', '2', '107.504813', '38.119918', null);
INSERT INTO `xx_location` VALUES ('5', '幼儿园2', '幼儿园地址2', '', '18751861827', null, null, null, '2017-07-26', '2017-07-26', '2', '107.442148', '38.223856', null);
INSERT INTO `xx_location` VALUES ('6', '兽医点1', '兽医点地址1', '025-89878987', '', null, null, null, '2017-07-26', '2017-07-26', '5', '107.38868', '38.183025', null);
INSERT INTO `xx_location` VALUES ('7', '兽医点2', '兽医点地址2', '026-96966363', '', null, null, null, '2017-07-26', '2017-07-26', '5', '107.350736', '38.110379', null);
INSERT INTO `xx_location` VALUES ('8', '酒店1', '酒店地址1', '', '18756986987', null, null, null, '2017-07-26', '2017-07-26', '4', '107.511712', '38.213424', null);
INSERT INTO `xx_location` VALUES ('9', '酒店2', '酒店地址2', '', '16989657', null, null, null, '2017-07-26', '2017-07-26', '4', '107.455371', '38.090388', null);
INSERT INTO `xx_location` VALUES ('10', '饭店1', '饭店地址1', '023-98787468', '', null, null, null, '2017-07-26', '2017-07-26', '3', '107.553106', '38.101293', null);
INSERT INTO `xx_location` VALUES ('11', '饭店2', '饭店地址2', '010-68863249', '15651282709', null, null, null, '2017-07-26', '2017-07-26', '3', '107.417426', '38.146711', null);
INSERT INTO `xx_location` VALUES ('12', '政府2', '政府地址2', '', '16598782321', null, null, null, '2017-07-26', '2017-07-26', '1', '107.502514', '38.177579', null);

-- ----------------------------
-- Table structure for yl_department
-- ----------------------------
DROP TABLE IF EXISTS `yl_department`;
CREATE TABLE `yl_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `hospitalId` int(10) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yl_department
-- ----------------------------
INSERT INTO `yl_department` VALUES ('1', '院办', '1', '');
INSERT INTO `yl_department` VALUES ('2', '内科', '1', '');
INSERT INTO `yl_department` VALUES ('3', '眼耳鼻喉科', '1', '');
INSERT INTO `yl_department` VALUES ('4', '外科', '1', '');
INSERT INTO `yl_department` VALUES ('5', '妇产科', '1', '');
INSERT INTO `yl_department` VALUES ('6', '中医科', '1', '');
INSERT INTO `yl_department` VALUES ('7', '五官科', '1', '');
INSERT INTO `yl_department` VALUES ('8', '皮肤科', '1', '');
INSERT INTO `yl_department` VALUES ('9', '急诊科', '1', '');
INSERT INTO `yl_department` VALUES ('10', '方便门诊', '1', '');
INSERT INTO `yl_department` VALUES ('11', '放射科', '1', '');
INSERT INTO `yl_department` VALUES ('12', 'B超室', '1', '');
INSERT INTO `yl_department` VALUES ('13', '药械科', '1', '');
INSERT INTO `yl_department` VALUES ('14', '内科', '2', '');
INSERT INTO `yl_department` VALUES ('15', '妇产科', '2', '');
INSERT INTO `yl_department` VALUES ('16', '肛肠科', '2', '');
INSERT INTO `yl_department` VALUES ('17', '五疗科', '2', '');
INSERT INTO `yl_department` VALUES ('18', '药剂科', '2', '');
INSERT INTO `yl_department` VALUES ('19', '妇产科', '3', '');
INSERT INTO `yl_department` VALUES ('20', '肛肠科', '3', '');
INSERT INTO `yl_department` VALUES ('21', '外科', '3', '');
INSERT INTO `yl_department` VALUES ('22', '儿科', '3', '');
INSERT INTO `yl_department` VALUES ('23', 'B超室', '3', '');
INSERT INTO `yl_department` VALUES ('24', '蒙医科', '3', '');
INSERT INTO `yl_department` VALUES ('25', '办公室', '4', '');
INSERT INTO `yl_department` VALUES ('26', '地病科', '4', '');
INSERT INTO `yl_department` VALUES ('27', '稽查科', '4', '');

-- ----------------------------
-- Table structure for yl_hospital
-- ----------------------------
DROP TABLE IF EXISTS `yl_hospital`;
CREATE TABLE `yl_hospital` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `principal` varchar(10) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `businessScope` varchar(500) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `orgId` int(10) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yl_hospital
-- ----------------------------
INSERT INTO `yl_hospital` VALUES ('1', '鄂托克前旗人民医院', '朱旭丽', '敖镇莎日塔拉东街', '西医综合、中医、蒙医', '7627815', '', '1', '');
INSERT INTO `yl_hospital` VALUES ('2', '鄂托克前旗蒙医医院', '阿日斯楞', '敖镇苏力迪西街', '蒙医综合，五疗，肝胆', '7627224', '', '1', '');
INSERT INTO `yl_hospital` VALUES ('3', '鄂托克前旗妇幼保健所', '计新兰', '敖镇陶伦南街', '内外妇儿蒙医肛肠，妇幼保健', '7628937', '', '1', '');
INSERT INTO `yl_hospital` VALUES ('4', '鄂托克前旗疾病预防控制中心', '高胜东', '敖镇莎日塔拉东街', '地方病防治、职业病防治、儿童计划免疫、传染病预防治', '7622242', '', '1', '');
INSERT INTO `yl_hospital` VALUES ('5', '鄂托克前旗卫生监督所（与疾病预防控制中心合署办公）', '高胜东', '敖镇莎日塔拉东街', '食品安全风险监测、职业卫生监管、公共场所和生活饮用水监督、学校卫生监督、医疗卫生监管', '7622242', '', '1', '');
INSERT INTO `yl_hospital` VALUES ('6', '鄂托克前旗城川镇中心卫生院', '姚科', '城川镇', '全科医学，外妇、内儿、中医、蒙医、口腔', '', '', '2', '');
INSERT INTO `yl_hospital` VALUES ('7', '鄂托克前旗昂素镇中心卫生院', '阿拉腾都西', '昂素镇', '全科医学、外妇、内儿、中医、蒙医', '', '15804774196', '2', '');
INSERT INTO `yl_hospital` VALUES ('8', '鄂托克前旗三段地卫生院', '田步芳', '三段地社区', '全科医学，外妇、内儿、中医、蒙医', '', '13604772369', '2', '');
INSERT INTO `yl_hospital` VALUES ('9', '鄂托克前旗布拉格卫生院', '阿日雅扎布', '布拉格', '全科医学，内儿、蒙医', '', '15134842220', '2', '');
INSERT INTO `yl_hospital` VALUES ('10', '鄂托克前旗珠和卫生院', '白忠', '珠和', '全科医学，内儿、中医、蒙医', '', '15604779310', '2', '');
INSERT INTO `yl_hospital` VALUES ('11', '鄂托克前旗二道川卫生院', '曹东鹏', '二道川', '全科医学，内儿、中医', '', '13904773946', '2', '');
INSERT INTO `yl_hospital` VALUES ('12', '鄂托克前旗毛盖图卫生院', '乌云格日乐', '毛盖图', '全科医学，内儿、蒙医', '', '15947636821', '2', '');
INSERT INTO `yl_hospital` VALUES ('13', '鄂托克前旗敖镇社区卫生服务中心', '白生荣', '敖镇', '全科医学，内儿、中医、蒙医', '', '13947776226', '3', '');
INSERT INTO `yl_hospital` VALUES ('14', '鄂托克前旗上海庙社区卫生服务中心', '郭占雄', '上海庙镇', '全科医学，外妇、内儿、中医、蒙医', '', '13384775151', '3', '');
INSERT INTO `yl_hospital` VALUES ('15', '新汶矿业集团有限责任公司中心医院内蒙古能源分院', '夏振建', '鄂托克前旗上海庙镇', '内、外、妇、儿科、眼科、耳鼻喉科、口腔科', '', '18653868895', '4', '');
INSERT INTO `yl_hospital` VALUES ('16', '鄂托克前旗济生中医医院', '童世民', '敖镇苏力迪大街', '中医内、外、妇、儿科中西医结合科、针灸、推拿、按摩理疗、康复、急诊、检验、影像、预防保健、西医内科、外科、妇产科、B超科', '', '13847727871', '4', '');
INSERT INTO `yl_hospital` VALUES ('17', '鄂托克前旗仁爱中西医门诊部', '吴国发', '敖镇珠和东街（中智佳苑底商）', '许可经营项目：中西医结合内、外、妇科；肛肠科、不孕不育科、预防保健科、耳鼻喉科、功能科、检验科、B超室服务。', '', '18647174297', '5', '');
INSERT INTO `yl_hospital` VALUES ('18', '鄂托克前旗白占祥中医诊所', '白占祥', '敖镇沙日特拉西街', '中医内科服务。 ', '', '13947711069', '6', '');
INSERT INTO `yl_hospital` VALUES ('19', '鄂托克前旗刘占东中医诊所', '刘占东', '敖镇毛盖图西街（石油公司集资楼）', '中医内科服务。 ', '', '13847753693', '6', '');
INSERT INTO `yl_hospital` VALUES ('20', '鄂托克前旗张双林中医诊所', '张双林', '敖镇毛盖图西街（石油公司家属区）', '中医内科服务。 ', '7621649', '13704772350', '6', '');
INSERT INTO `yl_hospital` VALUES ('21', '鄂托克前旗沈志舜中医诊所', '沈志舜', '敖镇乌兰新区（市场南侧）', '许可经营项目：中医内科服务。', '', '13947786110', '6', '');
INSERT INTO `yl_hospital` VALUES ('22', '鄂托克前旗张贵中医诊所', '张贵', '敖镇毛盖图东街（北市场南侧）', '中医内科服务。', '', '13734833276', '6', '');
INSERT INTO `yl_hospital` VALUES ('23', '马锦川中医诊所', '马锦川', '敖镇珠和东街', '中医内科服务。', '7627213', '13948479131', '6', '');
INSERT INTO `yl_hospital` VALUES ('24', '鄂前旗李艳梅中医诊所', '李艳梅', '鄂前旗敖勒召其镇', '中医内科服务。', '', '13947750312', '6', '');
INSERT INTO `yl_hospital` VALUES ('25', '鄂前旗聂智藏医诊所', '聂智', '敖镇布拉格西街满都拉社区', '　藏医内科', '', '18347745566', '7', '');
INSERT INTO `yl_hospital` VALUES ('26', '鄂托克前旗巴音格西格蒙医诊疗所', '巴音格西格', '敖镇玛拉迪东街', '蒙医服务', '', '13947374905', '8', '');
INSERT INTO `yl_hospital` VALUES ('27', '鄂托克前旗其木格蒙医诊所', '其木格达丽', '敖镇查汉陶勒盖西街（畜牧局家属区）', '蒙医内科服务。', '', '13848574995', '8', '');
INSERT INTO `yl_hospital` VALUES ('28', '鄂托克前旗美丽明花蒙医诊所', '美丽明花', '敖镇苏力迪西街（邮政储蓄对面）', '蒙医内科。', '', '13904779309', '8', '');
INSERT INTO `yl_hospital` VALUES ('29', '鄂托克前旗巴图孟克蒙医诊所', '巴图孟克', '敖镇其巴嘎图东街', '蒙医内科。', '', '13134883039', '8', '');
INSERT INTO `yl_hospital` VALUES ('30', '鄂托克前旗敖镇南迪娜诊所', '南迪娜', '敖镇玛拉迪西街', '蒙医内科。', '', '15047392409', '8', '');
INSERT INTO `yl_hospital` VALUES ('31', '鄂托克前旗莫日根西医诊所', '莫日根', '敖镇查干陶勒盖西街', '西医内科服务', '', '13624875410', '9', '');
INSERT INTO `yl_hospital` VALUES ('32', '鄂托克前旗李大印西医诊所', '李大印', '敖镇南环东路', '西医内科服务。', '7627783', '13234846138', '9', '');
INSERT INTO `yl_hospital` VALUES ('33', '鄂托克前旗贾志艳西医诊所', '贾志艳', '敖镇玛拉迪西街', '内科、儿科、妇科服务（除母婴保健专项技术外）。', '7622544', '13947791289', '9', '');
INSERT INTO `yl_hospital` VALUES ('34', '鄂托克前旗刘裕义西医诊所', '刘裕义', '敖镇新区大街三段地信用社南侧', '西医诊所。', '7622965', '13327064325', '9', '');
INSERT INTO `yl_hospital` VALUES ('35', '鄂托克前旗杨海军西医诊所', '杨海军', '敖镇新区大街', '西医内科服务。', '7627966', '18904776568', '9', '');
INSERT INTO `yl_hospital` VALUES ('36', '鄂托克前旗王静西医诊所', '王静', '敖镇苏力迪东街（检察院家属区）', '西医内科服务', '', '13847759298', '9', '');
INSERT INTO `yl_hospital` VALUES ('37', '鄂托克前旗刘桂英西医诊所', '刘桂英', '敖镇玛拉迪西街文化局集资楼', '西医内科服务', '', '15949496484', '9', '');
INSERT INTO `yl_hospital` VALUES ('38', '鄂托克前旗韦玉山西医诊疗所', '韦玉山', '敖镇新区大街', '西医内科服务', '', '15847715758', '9', '');
INSERT INTO `yl_hospital` VALUES ('39', '鄂托克前旗贺海彪口腔诊所', '贺海彪', '敖镇沙日塔拉西街（政府宾馆对面）', '口腔内科专业、正畸专业、口腔修复专业服务', '', '13847971897', '10', '');
INSERT INTO `yl_hospital` VALUES ('40', '鄂托克前旗高树文口腔诊所', '高树文', '敖镇沙日塔拉东街', '口腔内科专业、正畸专业、口腔修复专业服务', '7622781', '13604772387', '10', '');
INSERT INTO `yl_hospital` VALUES ('41', '崔芳云镶牙馆', '崔芳云', '敖镇沙日塔拉西街', '口腔修复专业服务', '', '13754178229', '10', '');
INSERT INTO `yl_hospital` VALUES ('42', '长庆油田第三采气厂医务室', '王炳彦', '昂素镇昂素嘎查', '西医内科服务', '', '13904773140', '11', '');
INSERT INTO `yl_hospital` VALUES ('43', '鄂托克前旗上海庙福城矿业医务室', '皇甫俊', '前旗上海庙富城矿业', '西医内科服务', '', '18853897333', '11', '');
INSERT INTO `yl_hospital` VALUES ('44', '上海庙矿业有限责任公司行上海庙镇一号煤矿医务室', '丁鑫', '鄂前旗上海庙镇', '西医内科服务', '', '18747729009', '11', '');
INSERT INTO `yl_hospital` VALUES ('45', '榆树井煤矿筹建处医务室', '许登明', '鄂旗上海庙镇榆树井煤矿', '西医内科服务', '', '189063540517', '11', '');
INSERT INTO `yl_hospital` VALUES ('46', '贾东则盲人医疗按摩所', '贾东则', '沙日塔拉西街', '按摩', '', '13604774323', '12', '');

-- ----------------------------
-- Table structure for yl_organization
-- ----------------------------
DROP TABLE IF EXISTS `yl_organization`;
CREATE TABLE `yl_organization` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yl_organization
-- ----------------------------
INSERT INTO `yl_organization` VALUES ('1', '旗直医疗卫生机构', '');
INSERT INTO `yl_organization` VALUES ('2', '基层卫生院', '');
INSERT INTO `yl_organization` VALUES ('3', '社区卫生服务中心', '');
INSERT INTO `yl_organization` VALUES ('4', '企业医院和私立医院', '');
INSERT INTO `yl_organization` VALUES ('5', '门诊部', '鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('6', '中医类', '鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('7', '藏医类', '鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('8', '蒙医类', '鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('9', '西医类', '鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('10', '口腔类', '鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('11', '医务室', '鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('12', '按摩所', '鄂托克前旗个体诊所');

-- ----------------------------
-- Table structure for yl_specialist
-- ----------------------------
DROP TABLE IF EXISTS `yl_specialist`;
CREATE TABLE `yl_specialist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `department` int(10) DEFAULT NULL,
  `hospitalId` int(10) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yl_specialist
-- ----------------------------
INSERT INTO `yl_specialist` VALUES ('1', '朱旭丽', '1', '1', '副主任检验师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('2', '陈丽芬', '1', '1', '副主任护师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('3', '侯再明', '2', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('4', '邬文彬', '3', '1', '主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('5', '郝安礼', '2', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('6', '杜丽芳', '2', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('7', '冯择', '4', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('8', '米虎成', '5', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('9', '沙茹拉其其格', '5', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('10', '冯治字', '5', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('11', '张相改', '5', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('12', '丛爱明', '6', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('13', '程凤成', '6', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('14', '贺慧珍', '7', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('15', '张金和', '8', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('16', '刘丽娟', '9', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('17', '李万明', '10', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('18', '王高升', '11', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('19', '张旭升', '11', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('20', '黄怀仁', '12', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('21', '美日更高娃', '13', '1', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('22', '金巴图', '14', '2', '蒙医主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('23', '乌兰巴雅尔', '14', '2', '蒙医主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('24', '哈斯格日勒', '15', '2', '蒙医主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('25', '额日德尼达来', '14', '2', '蒙医副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('26', '斯琴图雅', '16', '2', '蒙医副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('27', '苏雅拉其其格', '17', '2', '蒙医副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('28', '白秀芳', '15', '2', '蒙医副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('29', '巴德玛吉亚', '18', '2', '蒙医副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('30', '乌云', '19', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('31', '图娜拉', '19', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('32', '查汗东', '19', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('33', '王苏雅拉', '19', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('34', '那顺其木格', '19', '3', '蒙医副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('35', '朝勒孟', '20', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('36', '白卫国', '21', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('37', '宝音', '22', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('38', '唐革命', '20', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('39', '马树霞', '23', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('40', '哈斯', '24', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('41', '贺希格', '24', '3', '副主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('42', '徐敏', '25', '4', '预防医学主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('50', '张建军', '25', '4', '中医主任医师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('51', '闫玉生', '26', '4', '副主任检验师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('52', '赵亮', '26', '4', '副主任检验师', '', '', '', '');
INSERT INTO `yl_specialist` VALUES ('53', '张浩', '27', '4', '公卫副主任医师', '', '', '', '');
