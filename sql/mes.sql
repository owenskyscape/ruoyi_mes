/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : mes

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 03/01/2022 10:22:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017DD3B2917878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017DD3B2917878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017DD3B2917878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'DESKTOP-KVMPR0Q1641174871660', 1641176571792, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1641174880000, -1, 5, 'PAUSED', 'CRON', 1641174871000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1641174885000, -1, 5, 'PAUSED', 'CRON', 1641174871000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1641174880000, -1, 5, 'PAUSED', 'CRON', 1641174871000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'mes_production_order', '生产指令', 'mes_crystal', 'code', 'MesProductionOrder', 'crud', 'com.ruoyi.mes', 'mes', 'order', '生产指令', 'wangyong', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"原料库\",\"treeCode\":\"\"}', 'admin', '2021-12-20 07:48:30', '', '2021-12-20 09:58:37', '');
INSERT INTO `gen_table` VALUES (2, 'mes_crystal', '原始晶棒入库表', 'mes_production_order', 'id', 'MesCrystal', 'sub', 'com.ruoyi.mes', 'mes', 'crystal', '原始晶棒入库', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"原料库\",\"treeCode\":\"\"}', 'admin', '2021-12-20 07:48:59', '', '2021-12-20 09:58:46', '');
INSERT INTO `gen_table` VALUES (3, 'mes_order_form', '制程单', NULL, NULL, 'MesOrderForm', 'crud', 'com.ruoyi.system', 'system', 'form', '制程单', 'ruoyi', '0', '/', NULL, 'admin', '2021-12-21 01:43:10', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'mes_crystal_info', '晶棒信息', '', NULL, 'MesCrystalInfo', 'crud', 'com.ruoyi.mes', 'mes', 'info', '晶棒信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"原料库\",\"treeCode\":\"\"}', 'admin', '2021-12-25 01:38:48', '', '2021-12-27 15:15:42', '');
INSERT INTO `gen_table` VALUES (6, 'mes_storage_manage', '库位管理', '', NULL, 'MesStorageManage', 'crud', 'com.ruoyi.mes', 'mes', 'manage', '库位管理', 'owen', '1', '/mes/manage', '{\"parentMenuId\":\"2003\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"固化库\",\"treeCode\":\"\"}', 'admin', '2021-12-27 11:18:06', '', '2021-12-27 11:21:18', '');
INSERT INTO `gen_table` VALUES (7, 'mes_glue_batch', '胶水批次', '', NULL, 'MesGlueBatch', 'crud', 'com.ruoyi.mes', 'mes', 'glue_batch', '胶水批次', 'owen', '1', '/mes/glue_batch', '{\"parentMenuId\":\"2022\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"档案维护\",\"treeCode\":\"\"}', 'admin', '2021-12-27 12:59:32', '', '2021-12-27 14:08:28', '');
INSERT INTO `gen_table` VALUES (8, 'mes_board_batch', '板材批次', '', NULL, 'MesBoardBatch', 'crud', 'com.ruoyi.mes', 'mes', 'board_batch', '板材批次', 'owen', '1', '/mes/board_batch', '{\"parentMenuId\":\"2022\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"档案维护\",\"treeCode\":\"\"}', 'admin', '2021-12-27 13:15:02', '', '2021-12-27 14:39:55', '');
INSERT INTO `gen_table` VALUES (9, 'mes_warehousing_info', '入库信息', '', NULL, 'MesWarehousingInfo', 'crud', 'com.ruoyi.mes', 'mes', 'mes_warehousing_info', '入库信息', 'owen', '1', '/mes/mes_warehousing_info', '{\"parentMenuId\":\"2003\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"固化库\",\"treeCode\":\"\"}', 'admin', '2022-01-03 09:06:00', '', '2022-01-03 09:08:38', '');
INSERT INTO `gen_table` VALUES (10, 'mes_storage_info', '库存信息', '', NULL, 'MesStorageInfo', 'crud', 'com.ruoyi.mes', 'mes', 'mes_storage_info', '库存信息', 'owen', '1', '/mes/mes_storage_info', '{\"parentMenuId\":\"2003\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"固化库\",\"treeCode\":\"\"}', 'admin', '2022-01-03 09:08:54', '', '2022-01-03 09:11:54', '');
INSERT INTO `gen_table` VALUES (11, 'mes_exwarehousing_info', '出库信息', '', NULL, 'MesExwarehousingInfo', 'crud', 'com.ruoyi.mes', 'mes', 'mes_exwarehousing_info', '出库信息', 'owen', '1', '/mes/mes_exwarehousing_info', '{\"parentMenuId\":\"2003\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"固化库\",\"treeCode\":\"\"}', 'admin', '2022-01-03 09:20:27', '', '2022-01-03 09:35:25', '');
INSERT INTO `gen_table` VALUES (12, 'mes_crystal_check', '库存盘点', '', NULL, 'MesCrystalCheck', 'crud', 'com.ruoyi.mes', 'mes', 'mes_crystal_check', '库存盘点', 'owen', '1', '/mes/mes_crystal_check', '{\"parentMenuId\":\"2003\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"固化库\",\"treeCode\":\"\"}', 'admin', '2022-01-03 09:50:59', '', '2022-01-03 09:52:39', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 273 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (2, '1', 'crystal_code', '晶棒编号', 'bigint(20)', 'Long', 'crystalCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (3, '1', 'crystal_batch', '晶棒批次', 'varchar(16)', 'String', 'crystalBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (4, '1', 'crystal_spec', '晶棒规格', 'varchar(16)', 'String', 'crystalSpec', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (5, '1', 'resistivity', '电阻率Ω㎝', 'varchar(16)', 'String', 'resistivity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (6, '1', 'side_length', '边长mm', 'double(10,2)', 'BigDecimal', 'sideLength', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (7, '1', 'slice_thick_ness', '片厚μm', 'double(10,2)', 'BigDecimal', 'sliceThickNess', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (8, '1', 'order_batch', '订单批次', 'varchar(16)', 'String', 'orderBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (9, '1', 'spec_code', '规格代码', 'varchar(16)', 'String', 'specCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (10, '1', 'experiments', '实验发起', 'varchar(16)', 'String', 'experiments', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'checkbox', 'mes_SYBZ', 10, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (11, '1', 'type_experiments', '实验类型', 'varchar(16)', 'String', 'typeExperiments', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'checkbox', 'mes_SYLX', 11, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (12, '1', 'name_experiments', '实验名称', 'varchar(16)', 'String', 'nameExperiments', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (13, '1', 'production_remarks', '备注', 'varchar(128)', 'String', 'productionRemarks', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'checkbox', 'mes_SCZL', 13, 'admin', '2021-12-20 07:48:31', NULL, '2021-12-20 09:58:37');
INSERT INTO `gen_table_column` VALUES (14, '2', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (15, '2', 'layer_number', '层数', 'int(11)', 'Long', 'layerNumber', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (16, '2', 'code', '晶棒编号', 'varchar(64)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (17, '2', 'model', '型号', 'varchar(64)', 'String', 'model', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (18, '2', 'spec', '规格', 'varchar(64)', 'String', 'spec', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (19, '2', 'up_resistivity', '中心电阻率（上）', 'double(10,2)', 'BigDecimal', 'upResistivity', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (20, '2', 'down_resistivity', '中心电阻率（下）', 'double(10,2)', 'BigDecimal', 'downResistivity', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (21, '2', 'up_resistance', '表皮电阻（上）', 'double(10,2)', 'BigDecimal', 'upResistance', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (22, '2', 'down_resistance', '表皮电阻（下）', 'double(10,2)', 'BigDecimal', 'downResistance', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (23, '2', 'min_dia', '直径（最小）', 'int(11)', 'Long', 'minDia', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (24, '2', 'max_dia', '直径（最大）', 'int(11)', 'Long', 'maxDia', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (25, '2', 'up_life', '寿命（上）', 'int(11)', 'Long', 'upLife', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (26, '2', 'down_life', '寿命（下）', 'int(11)', 'Long', 'downLife', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (27, '2', 'pass_length', '合格长度mm', 'int(11)', 'Long', 'passLength', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 14, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (28, '2', 'weight', '重量kg', 'double(10,2)', 'BigDecimal', 'weight', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (29, '2', 'min_margin', '边距MIN', 'double(10,2)', 'BigDecimal', 'minMargin', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 16, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (30, '2', 'max_margin', '边距MAX', 'double(10,2)', 'BigDecimal', 'maxMargin', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (31, '2', 'remark', '备注', 'text', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 18, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (32, '2', 'in_level', '入库等级', 'varchar(8)', 'String', 'inLevel', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 19, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (33, '2', 'resistivity', '电阻率', 'varchar(16)', 'String', 'resistivity', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 20, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (34, '2', 'in_store_data', '入库日期', 'datetime', 'Date', 'inStoreData', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 21, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (35, '2', 'heat_number', '炉号', 'int(11)', 'Long', 'heatNumber', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 22, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (36, '2', 'area', '区域', 'varchar(16)', 'String', 'area', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 23, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (37, '2', 'tuohao', '托号', 'varchar(16)', 'String', 'tuohao', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2021-12-20 07:48:59', NULL, '2021-12-20 09:58:46');
INSERT INTO `gen_table_column` VALUES (38, '3', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '3', 'crystal_code1', '晶棒编号一', 'bigint(20)', 'Long', 'crystalCode1', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '3', 'crystal_code2', '晶棒编号二', 'bigint(20)', 'Long', 'crystalCode2', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '3', 'crystal_code3', '晶棒编号三', 'bigint(20)', 'Long', 'crystalCode3', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '3', 'crystal_code4', '晶棒编号四', 'bigint(20)', 'Long', 'crystalCode4', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '3', 'match_date', '配棒日期', 'date', 'Date', 'matchDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '3', 'match_time', '配棒时间', 'time', 'Date', 'matchTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '3', 'numbers', '根数', 'int(11)', 'Long', 'numbers', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '3', 'length', '检棒总长mm', 'int(11)', 'Long', 'length', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '3', 'effective_length', '有效总长mm', 'int(11)', 'Long', 'effectiveLength', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '3', 'thick', '厚片', 'int(11)', 'Long', 'thick', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '3', 'create_user', '配棒人员', 'varchar(16)', 'String', 'createUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '3', 'size_scope', '尺寸范围', 'varchar(16)', 'String', 'sizeScope', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '3', 'glue_stick_date', '粘棒日期', 'date', 'Date', 'glueStickDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '3', 'team', '班组', 'varchar(16)', 'String', 'team', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, '3', 'person', '粘棒人员', 'varchar(16)', 'String', 'person', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, '3', 'viscose_time', '粘胶时间', 'time', 'Date', 'viscoseTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 17, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, '3', 'boiled_glue_batch', '水煮胶厂家批次', 'varchar(16)', 'String', 'boiledGlueBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '3', 'viscose_batch', '粘棒胶厂家批次', 'varchar(16)', 'String', 'viscoseBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '3', 'glue_stick_batch', '粘棒板厂家批次', 'varchar(16)', 'String', 'glueStickBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '3', 'boiled_glue_dosage', '水煮胶用量', 'varchar(16)', 'String', 'boiledGlueDosage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, '3', 'a_dosage', 'A粘棒胶用量', 'varchar(16)', 'String', 'aDosage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, '3', 'b_dosage', 'B粘棒胶用量', 'varchar(16)', 'String', 'bDosage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, '3', 'length_zb', '粘棒板长度mm', 'int(11)', 'Long', 'lengthZb', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, '3', 'material', '粘棒板材质', 'varchar(16)', 'String', 'material', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, '3', 'tray_batch', '晶托编号', 'varchar(16)', 'String', 'trayBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, '3', 'stick_remark', '粘棒备注', 'varchar(32)', 'String', 'stickRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, '3', 'equipment', '切片机台', 'varchar(16)', 'String', 'equipment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, '3', 'qg', '切片选项', 'varchar(16)', 'String', 'qg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, '3', 'date', ' 切片日期', 'date', 'Date', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 30, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, '3', 'team_qp', ' 切片班组', 'varchar(16)', 'String', 'teamQp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, '3', 'slot_pitch', ' 槽距', 'double(10,2)', 'BigDecimal', 'slotPitch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, '3', 'theory_numbers', ' 理论切片数', 'int(11)', 'Long', 'theoryNumbers', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, '3', 'boot_dose', ' 开机线量', 'int(11)', 'Long', 'bootDose', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, '3', 'operation_user_qp', ' 上棒操作工', 'varchar(16)', 'String', 'operationUserQp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, '3', 'start_time', ' 上棒开机时间', 'time', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 36, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, '3', 'glue_stick_loss', ' 粘棒损失mm', 'double(10,2)', 'BigDecimal', 'glueStickLoss', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, '3', 'main_roller_time', ' 主辊时间', 'varchar(16)', 'String', 'mainRollerTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, '3', 'inducer_batch', ' 导轮厂家批次', 'varchar(16)', 'String', 'inducerBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, '3', 'guide_time', ' 导向轮时间', 'varchar(16)', 'String', 'guideTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, '3', 'steel_wire_spec', ' 钢线规格', 'varchar(16)', 'String', 'steelWireSpec', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, '3', 'steel_wire_batch', ' 钢线厂家批次', 'varchar(16)', 'String', 'steelWireBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, '3', 'steel_wire_code', ' 钢线编号', 'varchar(16)', 'String', 'steelWireCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, '3', 'knife_no', ' 切片刀次', 'int(11)', 'Long', 'knifeNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, '3', 'cutting_fluid_batch', ' 切割液厂家批次', 'varchar(16)', 'String', 'cuttingFluidBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, '3', 'cutting_fluid_dosage', ' 切割液用量', 'int(11)', 'Long', 'cuttingFluidDosage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2021-12-21 01:43:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, '3', 'offline_numbers', ' 断线次数', 'int(11)', 'Long', 'offlineNumbers', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, '3', 'add_cut_flag', ' 是否加切', 'varchar(16)', 'String', 'addCutFlag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, '3', 'knife_use_dosage', ' 本刀用线量', 'int(11)', 'Long', 'knifeUseDosage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, '3', 'under_user', ' 下棒操作工', 'varchar(16)', 'String', 'underUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, '3', 'under_time', ' 下棒时间', 'time', 'Date', 'underTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 51, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, '3', 'timeout_remark', ' 超时备注', 'text', 'String', 'timeoutRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 52, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, '3', 'offline_reason', ' 断线原因', 'text', 'String', 'offlineReason', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 53, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, '3', 'offline_remark', ' 断线描述', 'text', 'String', 'offlineRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 54, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, '3', 'slice_remark', '切片备注', 'varchar(32)', 'String', 'sliceRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, '3', 'degumming_time', '脱胶日期', 'datetime', 'Date', 'degummingTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 56, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, '3', 'batch_no', '脱胶班次', 'varchar(32)', 'String', 'batchNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (95, '3', 'degumming_machine', '脱胶机台', 'varchar(32)', 'String', 'degummingMachine', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, '3', 'degumming_user', '脱胶员', 'varchar(32)', 'String', 'degummingUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, '3', 'degumming_batch', '脱胶剂厂家批次', 'varchar(32)', 'String', 'degummingBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, '3', 'knife_no_tj', '脱胶刀次', 'varchar(32)', 'String', 'knifeNoTj', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, '3', 'slice_loss', '切片损失mm', 'double(10,2)', 'BigDecimal', 'sliceLoss', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, '3', 'cleaning_line', '清洗线别', 'varchar(32)', 'String', 'cleaningLine', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, '3', 'cleaning_user', '清洗员', 'varchar(32)', 'String', 'cleaningUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, '3', 'in_piece_count', '清洗进片数', 'int(11)', 'Long', 'inPieceCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, '3', 'out_piece_count', '清洗出片数', 'int(11)', 'Long', 'outPieceCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, '3', 'cleaning_batch', '清洗剂厂家批次', 'varchar(32)', 'String', 'cleaningBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, '3', 'degumming_baloss', '脱胶损失', 'int(11)', 'Long', 'degummingBaloss', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 68, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, '3', 'cleaning_remark', '清洗备注', 'varchar(32)', 'String', 'cleaningRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 69, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, '3', 'check_date', '检验日期', 'date', 'Date', 'checkDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 70, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, '3', 'batch', '分选班组', 'varchar(32)', 'String', 'batch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 71, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, '3', 'machine', '分选机台', 'varchar(32)', 'String', 'machine', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 72, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, '3', 'receive_numbers', '接收片数', 'int(11)', 'Long', 'receiveNumbers', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 73, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, '3', 'operation_user', '上料员', 'varchar(32)', 'String', 'operationUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 74, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, '3', 'cleaning_loss', '清洗损失', 'int(11)', 'Long', 'cleaningLoss', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 75, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, '3', 'sorting_user', '分选员', 'varchar(32)', 'String', 'sortingUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 76, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, '3', 'machine_loss', '机选损失', 'int(11)', 'Long', 'machineLoss', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 77, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, '3', 'package_user', '打包人员', 'varchar(32)', 'String', 'packageUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 78, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, '3', 'qc', 'QC', 'varchar(32)', 'String', 'qc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 79, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, '3', 'a_numbers_jx', '机选A片数', 'int(11)', 'Long', 'aNumbersJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 80, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (118, '3', 'high_resistance_jx', '机选高电阻', 'int(11)', 'Long', 'highResistanceJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 81, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (119, '3', 'low_resistance_jx', '机选低电阻', 'int(11)', 'Long', 'lowResistanceJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 82, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (120, '3', 'a_size_jx', '机选A尺寸', 'int(11)', 'Long', 'aSizeJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 83, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (121, '3', 'a2_line_jx', '机选A2轻线痕', 'int(11)', 'Long', 'a2LineJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 84, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (122, '3', 'b2_line_jx', '机选B2崩边', 'int(11)', 'Long', 'b2LineJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 85, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (123, '3', 'knife_side_jx', '机选入刀侧面崩边', 'int(11)', 'Long', 'knifeSideJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 86, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (124, '3', 'b3_jx', '机选B3TTV', 'int(11)', 'Long', 'b3Jx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 87, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (125, '3', 'b4_jx', '机选B4脏污', 'int(11)', 'Long', 'b4Jx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 88, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (126, '3', 'b5_jx', '机选B5色差', 'int(11)', 'Long', 'b5Jx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 89, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (127, '3', 'c1ttv_jx', '机选C1线痕TTV', 'int(11)', 'Long', 'c1ttvJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 90, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (128, '3', 'c2_jx', '机选C2崩边缺角', 'int(11)', 'Long', 'c2Jx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 91, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, '3', 'c7_jx', '机选C7隐裂', 'int(11)', 'Long', 'c7Jx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 92, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (130, '3', 'dc_jx', '机选直流', 'int(11)', 'Long', 'dcJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 93, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (131, '3', 'double_disc_jx', '机选双片', 'int(11)', 'Long', 'doubleDiscJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 94, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (132, '3', 'other_jx', '机选其他', 'int(11)', 'Long', 'otherJx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 95, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, '3', 'a_size_rx', 'A尺寸', 'int(11)', 'Long', 'aSizeRx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 96, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (134, '3', 'a2_line_rx', 'A2轻线痕', 'int(11)', 'Long', 'a2LineRx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 97, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (135, '3', 'b2_line_rx', 'B2崩边', 'int(11)', 'Long', 'b2LineRx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 98, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (136, '3', 'knife_side_rx', '入刀侧面崩边', 'int(11)', 'Long', 'knifeSideRx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 99, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (137, '3', 'b3_rx', 'B3TTV', 'int(11)', 'Long', 'b3Rx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 100, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (138, '3', 'b4_rx', 'B4脏污', 'int(11)', 'Long', 'b4Rx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 101, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, '3', 'b5_rx', 'B5色差', 'int(11)', 'Long', 'b5Rx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 102, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, '3', 'c1ttv_rx', 'C1线痕TTV', 'int(11)', 'Long', 'c1ttvRx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 103, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, '3', 'c2_rx', 'C2崩边缺角', 'int(11)', 'Long', 'c2Rx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 104, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, '3', 'c7_rx', 'C7隐裂', 'int(11)', 'Long', 'c7Rx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 105, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, '3', 'dc_rx', '直流', 'int(11)', 'Long', 'dcRx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 106, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, '3', 'double_disc_rx', '双片', 'int(11)', 'Long', 'doubleDiscRx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 107, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, '3', 'other', '其他', 'int(11)', 'Long', 'other', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 108, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, '3', 'error_project', '异常项目', 'varchar(32)', 'String', 'errorProject', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 109, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, '3', 'wafer_location', '硅片位置（单片）', 'varchar(32)', 'String', 'waferLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 110, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, '3', 'crystal_location', '晶棒位置（单刀）', 'varchar(32)', 'String', 'crystalLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 111, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, '3', 'remark_yc', '异常描述备注：', 'text', 'String', 'remarkYc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 112, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, '3', 'remark_jb', '备注：', 'text', 'String', 'remarkJb', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 113, 'admin', '2021-12-21 01:43:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, '4', 'id', '主键id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (152, '4', 'code', '晶棒编号', 'varchar(64)', 'String', 'code', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 2, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (153, '4', 'model', '型号', 'varchar(64)', 'String', 'model', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 3, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (154, '4', 'length', '长度', 'int(11)', 'Long', 'length', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 4, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (155, '4', 'type', '类型', 'varchar(64)', 'String', 'type', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'select', 'mes_type', 5, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (156, '4', 'spec', '规格', 'varchar(64)', 'String', 'spec', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'select', 'mes_spec', 6, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (157, '4', 'thickness_splice', '片厚', 'varchar(64)', 'String', 'thicknessSplice', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'select', 'mes_thickness_splice', 7, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (158, '4', 'is_connectible', '是否拼棒', 'varchar(64)', 'String', 'isConnectible', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'select', 'mes_is_connectible', 8, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (159, '4', 'connectible_count', '拼棒数', 'int(11)', 'Long', 'connectibleCount', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (161, '4', 'slicer_model', '切片机型', 'varchar(64)', 'String', 'slicerModel', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'select', 'mes_slicer_model', 11, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (162, '4', 'working_time', '进线时间', 'datetime', 'Date', 'workingTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (163, '4', 'transmitting_state', '流转状态', 'varchar(64)', 'String', 'transmittingState', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (164, '4', 'storage_state', '库存状态', 'int(11)', 'Long', 'storageState', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (165, '4', 'storage_location', '库位', 'varchar(64)', 'String', 'storageLocation', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (166, '4', 'created_time', '建立时间', 'datetime', 'Date', 'createdTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (167, '4', 'creater', '创建人', 'varchar(64)', 'String', 'creater', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (168, '4', 'picker', '领料人', 'varchar(64)', 'String', 'picker', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (169, '4', 'auditor', '审核人', 'varchar(64)', 'String', 'auditor', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (170, '4', 'housing_id', '库位id', 'int(11)', 'Long', 'housingId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (171, '4', 'housing_time', '库位时间', 'datetime', 'Date', 'housingTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (172, '4', 'curing_state', '固化状态', 'varchar(64)', 'String', 'curingState', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (173, '4', 'curing_time', '固化时间', 'int(11)', 'Long', 'curingTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2021-12-25 01:38:48', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (174, '4', 'connection_type', '拼棒类型', 'varchar(64)', 'String', 'connectionType', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'select', 'mes_connection_type', 10, '', '2021-12-25 02:04:00', NULL, '2021-12-27 15:15:42');
INSERT INTO `gen_table_column` VALUES (182, '6', 'id', '主键id', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-27 11:18:06', NULL, '2021-12-27 11:21:18');
INSERT INTO `gen_table_column` VALUES (183, '6', 'code', '库位', 'varchar(64)', 'String', 'code', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 2, 'admin', '2021-12-27 11:18:06', NULL, '2021-12-27 11:21:18');
INSERT INTO `gen_table_column` VALUES (184, '6', 'state', '状态', 'varchar(255)', 'String', 'state', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 3, 'admin', '2021-12-27 11:18:06', NULL, '2021-12-27 11:21:18');
INSERT INTO `gen_table_column` VALUES (185, '6', 'created_time', '建立时间', 'datetime(6)', 'Date', 'createdTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2021-12-27 11:18:06', NULL, '2021-12-27 11:21:18');
INSERT INTO `gen_table_column` VALUES (186, '6', 'creater', '创建人', 'varchar(64)', 'String', 'creater', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-12-27 11:18:06', NULL, '2021-12-27 11:21:18');
INSERT INTO `gen_table_column` VALUES (187, '6', 'revised_time', '修改时间', 'datetime(6)', 'Date', 'revisedTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-12-27 11:18:06', NULL, '2021-12-27 11:21:18');
INSERT INTO `gen_table_column` VALUES (188, '6', 'reviser', '修改人', 'varchar(64)', 'String', 'reviser', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-12-27 11:18:06', NULL, '2021-12-27 11:21:18');
INSERT INTO `gen_table_column` VALUES (189, '7', 'id', '主键id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-27 12:59:32', NULL, '2021-12-27 14:08:28');
INSERT INTO `gen_table_column` VALUES (190, '7', 'mes_glue_batch', '胶水批次', 'varchar(64)', 'String', 'mesGlueBatch', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-27 12:59:32', NULL, '2021-12-27 14:08:28');
INSERT INTO `gen_table_column` VALUES (191, '7', 'creater', '创建人', 'varchar(64)', 'String', 'creater', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2021-12-27 12:59:32', NULL, '2021-12-27 14:08:28');
INSERT INTO `gen_table_column` VALUES (192, '7', 'creating_time', '创建时间', 'datetime(6)', 'Date', 'creatingTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2021-12-27 12:59:32', NULL, '2021-12-27 14:08:28');
INSERT INTO `gen_table_column` VALUES (193, '8', 'id', '主键id', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-27 13:15:02', NULL, '2021-12-27 14:39:55');
INSERT INTO `gen_table_column` VALUES (194, '8', 'mes_board_batch', '板材批次', 'varchar(64)', 'String', 'mesBoardBatch', '0', '0', NULL, '1', NULL, '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-12-27 13:15:02', NULL, '2021-12-27 14:39:55');
INSERT INTO `gen_table_column` VALUES (195, '8', 'creater', '创建人', 'varchar(64)', 'String', 'creater', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-12-27 13:15:02', NULL, '2021-12-27 14:39:55');
INSERT INTO `gen_table_column` VALUES (196, '8', 'creating_time', '创建时间', 'datetime(6)', 'Date', 'creatingTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 4, 'admin', '2021-12-27 13:15:02', NULL, '2021-12-27 14:39:55');
INSERT INTO `gen_table_column` VALUES (197, '8', 'modifier', '修改人', 'varchar(64)', 'String', 'modifier', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-12-27 13:15:02', NULL, '2021-12-27 14:39:55');
INSERT INTO `gen_table_column` VALUES (198, '8', 'modified', '修改时间', 'datetime(6)', 'Date', 'modified', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-12-27 13:15:02', NULL, '2021-12-27 14:39:55');
INSERT INTO `gen_table_column` VALUES (199, '9', 'id', '主键id', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-01-03 09:06:00', NULL, '2022-01-03 09:08:38');
INSERT INTO `gen_table_column` VALUES (200, '9', 'crystal_code', '晶棒编号', 'varchar(64)', 'String', 'crystalCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-01-03 09:06:00', NULL, '2022-01-03 09:08:38');
INSERT INTO `gen_table_column` VALUES (201, '9', 'spec', '规格', 'varchar(64)', 'String', 'spec', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'mes_spec', 3, 'admin', '2022-01-03 09:06:00', NULL, '2022-01-03 09:08:38');
INSERT INTO `gen_table_column` VALUES (202, '9', 'type', '尺寸', 'varchar(64)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'mes_size', 4, 'admin', '2022-01-03 09:06:00', NULL, '2022-01-03 09:08:38');
INSERT INTO `gen_table_column` VALUES (203, '9', 'length', '长度', 'float(11,2)', 'BigDecimal', 'length', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-01-03 09:06:00', NULL, '2022-01-03 09:08:38');
INSERT INTO `gen_table_column` VALUES (204, '9', 'thickness_splice', '片厚', 'varchar(64)', 'String', 'thicknessSplice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-01-03 09:06:00', NULL, '2022-01-03 09:08:38');
INSERT INTO `gen_table_column` VALUES (205, '9', 'slicer_model', '切片机型', 'varchar(64)', 'String', 'slicerModel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'mes_slicer_model', 7, 'admin', '2022-01-03 09:06:00', NULL, '2022-01-03 09:08:38');
INSERT INTO `gen_table_column` VALUES (206, '9', 'storage_location', '库位号', 'varchar(64)', 'String', 'storageLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-01-03 09:06:00', NULL, '2022-01-03 09:08:38');
INSERT INTO `gen_table_column` VALUES (207, '9', 'warehousing_time', '入库时间', 'datetime(6)', 'Date', 'warehousingTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2022-01-03 09:06:00', NULL, '2022-01-03 09:08:38');
INSERT INTO `gen_table_column` VALUES (208, '10', 'id', '主键id', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (209, '10', 'storage_location', '库位', 'varchar(64)', 'String', 'storageLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (210, '10', 'crystal_code', '晶棒编号', 'varchar(64)', 'String', 'crystalCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (211, '10', 'spec', '规格', 'varchar(64)', 'String', 'spec', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (212, '10', 'type', '尺寸', 'varchar(64)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (213, '10', 'length', '长度', 'float(11,2)', 'BigDecimal', 'length', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (214, '10', 'thickness_splice', '片厚', 'varchar(64)', 'String', 'thicknessSplice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (215, '10', 'slicer_model', '切片机型', 'varchar(64)', 'String', 'slicerModel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'mes_slicer_model', 8, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (216, '10', 'warehousing_time', '入库时间', 'datetime', 'Date', 'warehousingTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (217, '10', 'curing_time', '固化时长', 'int(11)', 'Long', 'curingTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (218, '10', 'storage_location_state', '库位库存状态', 'varchar(64)', 'String', 'storageLocationState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (219, '10', 'code', '晶棒编号', 'varchar(64)', 'String', 'code', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (220, '10', 'model', '型号', 'varchar(64)', 'String', 'model', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (221, '10', 'storage_location1', '采集库位', 'varchar(64)', 'String', 'storageLocation1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (222, '10', 'spec1', '采集规格', 'varchar(64)', 'String', 'spec1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (223, '10', 'type1', '采集类型', 'varchar(64)', 'String', 'type1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (224, '10', 'length1', '采集长度', 'int(11)', 'Long', 'length1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (225, '10', 'thickness_splice1', '采集片厚', 'varchar(64)', 'String', 'thicknessSplice1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (226, '10', 'slicer_model1', '采集切片机型', 'varchar(64)', 'String', 'slicerModel1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (227, '10', 'is_connectible1', '采集是否拼棒', 'varchar(64)', 'String', 'isConnectible1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (228, '10', 'connectible_count1', '采集拼棒数', 'int(11)', 'Long', 'connectibleCount1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (229, '10', 'connection_type1', '采集拼棒类型', 'varchar(64)', 'String', 'connectionType1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (230, '10', 'working_time1', '采集进线时间', 'datetime', 'Date', 'workingTime1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 23, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (231, '10', 'transmitting_state1', '采集流转状态', 'varchar(64)', 'String', 'transmittingState1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 24, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (232, '10', 'storage_state1', '采集库存状态', 'int(11)', 'Long', 'storageState1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 25, 'admin', '2022-01-03 09:08:54', NULL, '2022-01-03 09:11:54');
INSERT INTO `gen_table_column` VALUES (233, '11', 'id', '主键id', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (234, '11', 'crystal_code', '晶棒编号', 'varchar(64)', 'String', 'crystalCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (235, '11', 'spec', '规格', 'varchar(64)', 'String', 'spec', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'mes_spec', 3, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (236, '11', 'type', '尺寸', 'varchar(64)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'mes_size', 4, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (237, '11', 'length', '长度', 'float(18,2)', 'BigDecimal', 'length', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (238, '11', 'thickness_splice', '片厚', 'varchar(64)', 'String', 'thicknessSplice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'mes_thickness_splice', 6, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (239, '11', 'slicer_model', '切片机型', 'varchar(64)', 'String', 'slicerModel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'mes_slicer_model', 7, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (240, '11', 'storage_location', '库位号', 'varchar(64)', 'String', 'storageLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (242, '11', 'spec1', '采集规格', 'varchar(64)', 'String', 'spec1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (243, '11', 'type1', '采集类型', 'varchar(64)', 'String', 'type1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (244, '11', 'length1', '采集长度', 'int(11)', 'Long', 'length1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (245, '11', 'thickness_splice1', '采集片厚', 'varchar(64)', 'String', 'thicknessSplice1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (246, '11', 'slicer_model1', '采集切片机型', 'varchar(64)', 'String', 'slicerModel1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (247, '11', 'storage_location1', '采集库位', 'varchar(64)', 'String', 'storageLocation1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (248, '11', 'code', '采集晶棒编号', 'varchar(64)', 'String', 'code', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (249, '11', 'model', '采集型号', 'varchar(64)', 'String', 'model', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (250, '11', 'is_connectible', '采集是否拼棒', 'varchar(64)', 'String', 'isConnectible', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (251, '11', 'connectible_count', '采集拼棒数', 'int(11)', 'Long', 'connectibleCount', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (252, '11', 'connection_type', '采集拼棒类型', 'varchar(64)', 'String', 'connectionType', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'select', '', 20, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (253, '11', 'working_time', '采集进线时间', 'datetime', 'Date', 'workingTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (254, '11', 'transmitting_state', '采集流转状态', 'varchar(64)', 'String', 'transmittingState', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (255, '11', 'storage_state', '采集库存状态', 'int(11)', 'Long', 'storageState', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2022-01-03 09:20:27', NULL, '2022-01-03 09:35:25');
INSERT INTO `gen_table_column` VALUES (256, '11', 'exwarehousing_time', '出库时间', 'datetime(6)', 'Date', 'exwarehousingTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, '', '2022-01-03 09:43:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (257, '12', 'id', '主键id', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (258, '12', 'storage_location', '库位号', 'varchar(64)', 'String', 'storageLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (259, '12', 'crystal_code', '晶棒编号', 'varchar(64)', 'String', 'crystalCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (260, '12', 'code1', '采集晶棒编号', 'varchar(64)', 'String', 'code1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (261, '12', 'model1', '采集型号', 'varchar(64)', 'String', 'model1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (262, '12', 'length1', '采集长度', 'int(11)', 'Long', 'length1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (263, '12', 'type1', '采集类型', 'varchar(64)', 'String', 'type1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (264, '12', 'spec1', '采集规格', 'varchar(64)', 'String', 'spec1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (265, '12', 'thickness_splice1', '采集片厚', 'varchar(64)', 'String', 'thicknessSplice1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (266, '12', 'is_connectible1', '采集是否拼棒', 'varchar(64)', 'String', 'isConnectible1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (267, '12', 'connectible_count1', '采集拼棒数', 'int(11)', 'Long', 'connectibleCount1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:39');
INSERT INTO `gen_table_column` VALUES (268, '12', 'connection_type1', '采集拼棒类型', 'varchar(64)', 'String', 'connectionType1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:40');
INSERT INTO `gen_table_column` VALUES (269, '12', 'slicer_model1', '采集切片机型', 'varchar(64)', 'String', 'slicerModel1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:40');
INSERT INTO `gen_table_column` VALUES (270, '12', 'working_time1', '采集进线时间', 'datetime', 'Date', 'workingTime1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:40');
INSERT INTO `gen_table_column` VALUES (271, '12', 'transmitting_state1', '采集流转状态', 'varchar(64)', 'String', 'transmittingState1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:40');
INSERT INTO `gen_table_column` VALUES (272, '12', 'storage_state1', '采集库存状态', 'int(11)', 'Long', 'storageState1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-01-03 09:50:59', NULL, '2022-01-03 09:52:40');

-- ----------------------------
-- Table structure for mes_board_batch
-- ----------------------------
DROP TABLE IF EXISTS `mes_board_batch`;
CREATE TABLE `mes_board_batch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mes_board_batch` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '板材批次',
  `creater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creating_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modified` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_board_batch
-- ----------------------------

-- ----------------------------
-- Table structure for mes_cleaning
-- ----------------------------
DROP TABLE IF EXISTS `mes_cleaning`;
CREATE TABLE `mes_cleaning`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `matchingpost_order_form` bigint(20) NOT NULL COMMENT '制令单号',
  `slice_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱胶刀次',
  `degumming_time` datetime NULL DEFAULT NULL COMMENT '脱胶日期',
  `batch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班次',
  `degumming_machine` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱胶机台',
  `degumming_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱胶员',
  `degumming_batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱胶剂厂家批次',
  `knife_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗刀次刀次',
  `slice_loss` double(10, 2) NULL DEFAULT NULL COMMENT '切片损失mm',
  `cleaning_line` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗线别',
  `cleaning_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗员',
  `in_piece_count` int(11) NULL DEFAULT NULL COMMENT '进片数',
  `out_piece_count` int(11) NULL DEFAULT NULL COMMENT '出片数',
  `cleaning_batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗剂厂家批次',
  `numbers` int(11) NULL DEFAULT NULL COMMENT '次数',
  `degumming_baloss` double(10, 2) NULL DEFAULT NULL COMMENT '脱胶损失',
  `cleaning_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '清洗库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_cleaning
-- ----------------------------

-- ----------------------------
-- Table structure for mes_crystal
-- ----------------------------
DROP TABLE IF EXISTS `mes_crystal`;
CREATE TABLE `mes_crystal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `layer_number` int(11) NULL DEFAULT NULL COMMENT '层数',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶棒编号',
  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `up_resistivity` double(10, 2) NULL DEFAULT NULL COMMENT '中心电阻率（上）',
  `down_resistivity` double(10, 2) NULL DEFAULT NULL COMMENT '中心电阻率（下）',
  `up_resistance` double(10, 2) NULL DEFAULT NULL COMMENT '表皮电阻（上）',
  `down_resistance` double(10, 2) NULL DEFAULT NULL COMMENT '表皮电阻（下）',
  `min_dia` int(11) NULL DEFAULT NULL COMMENT '直径（最小）',
  `max_dia` int(11) NULL DEFAULT NULL COMMENT '直径（最大）',
  `up_life` int(11) NULL DEFAULT NULL COMMENT '寿命（上）',
  `down_life` int(11) NULL DEFAULT NULL COMMENT '寿命（下）',
  `pass_length` int(11) NULL DEFAULT NULL COMMENT '合格长度mm',
  `weight` double(10, 2) NULL DEFAULT NULL COMMENT '重量kg',
  `min_margin` double(10, 2) NULL DEFAULT NULL COMMENT '边距MIN',
  `max_margin` double(10, 2) NULL DEFAULT NULL COMMENT '边距MAX',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `in_level` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库等级',
  `resistivity` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电阻率',
  `in_store_data` datetime NULL DEFAULT NULL COMMENT '入库日期',
  `heat_number` int(11) NULL DEFAULT NULL COMMENT '炉号',
  `area` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `tuo_hao` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '托号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '原始晶棒入库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_crystal
-- ----------------------------

-- ----------------------------
-- Table structure for mes_crystal_check
-- ----------------------------
DROP TABLE IF EXISTS `mes_crystal_check`;
CREATE TABLE `mes_crystal_check`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `storage_location` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库位号',
  `crystal_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晶棒编号',
  `code1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集晶棒编号',
  `model1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集型号',
  `length1` int(11) NULL DEFAULT NULL COMMENT '采集长度',
  `type1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型',
  `spec1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集规格',
  `thickness_splice1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集片厚',
  `is_connectible1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集是否拼棒',
  `connectible_count1` int(11) NULL DEFAULT NULL COMMENT '采集拼棒数',
  `connection_type1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集拼棒类型',
  `slicer_model1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集切片机型',
  `working_time1` datetime NULL DEFAULT NULL COMMENT '采集进线时间',
  `transmitting_state1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集流转状态',
  `storage_state1` int(11) NULL DEFAULT NULL COMMENT '采集库存状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存盘点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_crystal_check
-- ----------------------------

-- ----------------------------
-- Table structure for mes_crystal_info
-- ----------------------------
DROP TABLE IF EXISTS `mes_crystal_info`;
CREATE TABLE `mes_crystal_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶棒编号',
  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `length` int(11) NULL DEFAULT NULL COMMENT '长度',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `thickness_splice` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '片厚',
  `is_connectible` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否拼棒',
  `connectible_count` int(11) NULL DEFAULT NULL COMMENT '拼棒数',
  `connection_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼棒类型',
  `slicer_model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '切片机型',
  `working_time` datetime NULL DEFAULT NULL COMMENT '进线时间',
  `transmitting_state` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流转状态',
  `storage_state` int(11) NULL DEFAULT NULL COMMENT '库存状态',
  `storage_location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库位',
  `created_time` datetime NULL DEFAULT NULL COMMENT '建立时间',
  `creater` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `picker` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领料人',
  `auditor` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `housing_id` int(11) NULL DEFAULT NULL COMMENT '库位id',
  `housing_time` datetime NULL DEFAULT NULL COMMENT '库位时间',
  `curing_state` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固化状态',
  `curing_time` int(11) NULL DEFAULT NULL COMMENT '固化时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '晶棒信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_crystal_info
-- ----------------------------

-- ----------------------------
-- Table structure for mes_exwarehousing_info
-- ----------------------------
DROP TABLE IF EXISTS `mes_exwarehousing_info`;
CREATE TABLE `mes_exwarehousing_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `crystal_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晶棒编号',
  `spec` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `length` float(18, 2) NULL DEFAULT NULL COMMENT '长度',
  `thickness_splice` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '片厚',
  `slicer_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切片机型',
  `storage_location` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库位号',
  `exwarehousing_time` datetime(6) NULL DEFAULT NULL COMMENT '出库时间',
  `spec1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集规格',
  `type1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型',
  `length1` int(11) NULL DEFAULT NULL COMMENT '采集长度',
  `thickness_splice1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集片厚',
  `slicer_model1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集切片机型',
  `storage_location1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集库位',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集晶棒编号',
  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集型号',
  `is_connectible` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集是否拼棒',
  `connectible_count` int(11) NULL DEFAULT NULL COMMENT '采集拼棒数',
  `connection_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集拼棒类型',
  `working_time` datetime NULL DEFAULT NULL COMMENT '采集进线时间',
  `transmitting_state` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集流转状态',
  `storage_state` int(11) NULL DEFAULT NULL COMMENT '采集库存状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_exwarehousing_info
-- ----------------------------

-- ----------------------------
-- Table structure for mes_glue_batch
-- ----------------------------
DROP TABLE IF EXISTS `mes_glue_batch`;
CREATE TABLE `mes_glue_batch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mes_glue_batch` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '胶水批次',
  `creater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creating_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_glue_batch
-- ----------------------------

-- ----------------------------
-- Table structure for mes_glue_stick
-- ----------------------------
DROP TABLE IF EXISTS `mes_glue_stick`;
CREATE TABLE `mes_glue_stick`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `matchingpost_order_form` bigint(20) NOT NULL COMMENT '制令单号',
  `equipment` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '切片机台',
  `glue_stick_date` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒日期',
  `team` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班组',
  `person` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒人员',
  `viscose_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘胶时间',
  `boiled_glue_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水煮胶厂家批次',
  `viscose_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒胶厂家批次',
  `glue_stick_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒板厂家批次',
  `boiled_glue_dosage` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水煮胶用量',
  `a_dosage` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'A粘棒胶用量',
  `b_dosage` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B粘棒胶用量',
  `length` double(10, 2) NULL DEFAULT NULL COMMENT '粘棒板长度mm',
  `material` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒板材质',
  `tray_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶托编号',
  `stick_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '粘棒库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_glue_stick
-- ----------------------------

-- ----------------------------
-- Table structure for mes_matchingpost
-- ----------------------------
DROP TABLE IF EXISTS `mes_matchingpost`;
CREATE TABLE `mes_matchingpost`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_form` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制令单号',
  `crystal_code1` bigint(20) NOT NULL COMMENT '晶棒编号',
  `crystal_code2` bigint(20) NOT NULL COMMENT '晶棒编号',
  `crystal_code3` bigint(20) NOT NULL COMMENT '晶棒编号',
  `crystal_code4` bigint(20) NOT NULL COMMENT '晶棒编号',
  `match_date` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配棒日期',
  `match_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配棒时间',
  `numbers` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '根数',
  `length` double(10, 2) NULL DEFAULT NULL COMMENT '检棒总长mm',
  `effective_length` double(10, 2) NULL DEFAULT NULL COMMENT '有效总长mm',
  `thick` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厚片',
  `create_user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配棒人员',
  `size_scope` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸范围',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配棒库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_matchingpost
-- ----------------------------

-- ----------------------------
-- Table structure for mes_order_form
-- ----------------------------
DROP TABLE IF EXISTS `mes_order_form`;
CREATE TABLE `mes_order_form`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crystal_code1` bigint(20) NOT NULL COMMENT '晶棒编号一',
  `crystal_code2` bigint(20) NOT NULL COMMENT '晶棒编号二',
  `crystal_code3` bigint(20) NOT NULL COMMENT '晶棒编号三',
  `crystal_code4` bigint(20) NOT NULL COMMENT '晶棒编号四',
  `match_date` date NULL DEFAULT NULL COMMENT '配棒日期',
  `match_time` time NULL DEFAULT NULL COMMENT '配棒时间',
  `numbers` int(11) NULL DEFAULT NULL COMMENT '根数',
  `length` int(11) NULL DEFAULT NULL COMMENT '检棒总长mm',
  `effective_length` int(11) NULL DEFAULT NULL COMMENT '有效总长mm',
  `thick` int(11) NULL DEFAULT NULL COMMENT '厚片',
  `create_user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配棒人员',
  `size_scope` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸范围',
  `glue_stick_date` date NULL DEFAULT NULL COMMENT '粘棒日期',
  `team` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班组',
  `person` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒人员',
  `viscose_time` time NULL DEFAULT NULL COMMENT '粘胶时间',
  `boiled_glue_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水煮胶厂家批次',
  `viscose_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒胶厂家批次',
  `glue_stick_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒板厂家批次',
  `boiled_glue_dosage` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水煮胶用量',
  `a_dosage` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'A粘棒胶用量',
  `b_dosage` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B粘棒胶用量',
  `length_zb` int(11) NULL DEFAULT NULL COMMENT '粘棒板长度mm',
  `material` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒板材质',
  `tray_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶托编号',
  `stick_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粘棒备注',
  `equipment` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '切片机台',
  `qg` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '切片选项',
  `date` date NULL DEFAULT NULL COMMENT ' 切片日期',
  `team_qp` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 切片班组',
  `slot_pitch` double(10, 2) NULL DEFAULT NULL COMMENT ' 槽距',
  `theory_numbers` int(11) NULL DEFAULT NULL COMMENT ' 理论切片数',
  `boot_dose` int(11) NULL DEFAULT NULL COMMENT ' 开机线量',
  `operation_user_qp` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 上棒操作工',
  `start_time` time NULL DEFAULT NULL COMMENT ' 上棒开机时间',
  `glue_stick_loss` double(10, 2) NULL DEFAULT NULL COMMENT ' 粘棒损失mm',
  `main_roller_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 主辊时间',
  `inducer_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 导轮厂家批次',
  `guide_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 导向轮时间',
  `steel_wire_spec` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 钢线规格',
  `steel_wire_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 钢线厂家批次',
  `steel_wire_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 钢线编号',
  `knife_no` int(11) NULL DEFAULT NULL COMMENT ' 切片刀次',
  `cutting_fluid_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 切割液厂家批次',
  `cutting_fluid_dosage` int(11) NULL DEFAULT NULL COMMENT ' 切割液用量',
  `offline_numbers` int(11) NULL DEFAULT NULL COMMENT ' 断线次数',
  `add_cut_flag` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 是否加切',
  `knife_use_dosage` int(11) NULL DEFAULT NULL COMMENT ' 本刀用线量',
  `under_user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 下棒操作工',
  `under_time` time NULL DEFAULT NULL COMMENT ' 下棒时间',
  `timeout_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT ' 超时备注',
  `offline_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT ' 断线原因',
  `offline_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT ' 断线描述',
  `slice_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '切片备注',
  `degumming_time` datetime NULL DEFAULT NULL COMMENT '脱胶日期',
  `batch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱胶班次',
  `degumming_machine` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱胶机台',
  `degumming_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱胶员',
  `degumming_batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱胶剂厂家批次',
  `knife_no_tj` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱胶刀次',
  `slice_loss` double(10, 2) NULL DEFAULT NULL COMMENT '切片损失mm',
  `cleaning_line` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗线别',
  `cleaning_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗员',
  `in_piece_count` int(11) NULL DEFAULT NULL COMMENT '清洗进片数',
  `out_piece_count` int(11) NULL DEFAULT NULL COMMENT '清洗出片数',
  `cleaning_batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗剂厂家批次',
  `degumming_baloss` int(11) NULL DEFAULT NULL COMMENT '脱胶损失',
  `cleaning_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗备注',
  `check_date` date NULL DEFAULT NULL COMMENT '检验日期',
  `batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分选班组',
  `machine` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分选机台',
  `receive_numbers` int(11) NULL DEFAULT NULL COMMENT '接收片数',
  `operation_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上料员',
  `cleaning_loss` int(11) NULL DEFAULT NULL COMMENT '清洗损失',
  `sorting_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分选员',
  `machine_loss` int(11) NULL DEFAULT NULL COMMENT '机选损失',
  `package_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打包人员',
  `qc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QC',
  `a_numbers_jx` int(11) NULL DEFAULT NULL COMMENT '机选A片数',
  `high_resistance_jx` int(11) NULL DEFAULT NULL COMMENT '机选高电阻',
  `low_resistance_jx` int(11) NULL DEFAULT NULL COMMENT '机选低电阻',
  `a_size_jx` int(11) NULL DEFAULT NULL COMMENT '机选A尺寸',
  `a2_line_jx` int(11) NULL DEFAULT NULL COMMENT '机选A2轻线痕',
  `b2_line_jx` int(11) NULL DEFAULT NULL COMMENT '机选B2崩边',
  `knife_side_jx` int(11) NULL DEFAULT NULL COMMENT '机选入刀侧面崩边',
  `b3_jx` int(11) NULL DEFAULT NULL COMMENT '机选B3TTV',
  `b4_jx` int(11) NULL DEFAULT NULL COMMENT '机选B4脏污',
  `b5_jx` int(11) NULL DEFAULT NULL COMMENT '机选B5色差',
  `c1ttv_jx` int(11) NULL DEFAULT NULL COMMENT '机选C1线痕TTV',
  `c2_jx` int(11) NULL DEFAULT NULL COMMENT '机选C2崩边缺角',
  `c7_jx` int(11) NULL DEFAULT NULL COMMENT '机选C7隐裂',
  `dc_jx` int(11) NULL DEFAULT NULL COMMENT '机选直流',
  `double_disc_jx` int(11) NULL DEFAULT NULL COMMENT '机选双片',
  `other_jx` int(11) NULL DEFAULT NULL COMMENT '机选其他',
  `a_size_rx` int(11) NULL DEFAULT NULL COMMENT 'A尺寸',
  `a2_line_rx` int(11) NULL DEFAULT NULL COMMENT 'A2轻线痕',
  `b2_line_rx` int(11) NULL DEFAULT NULL COMMENT 'B2崩边',
  `knife_side_rx` int(11) NULL DEFAULT NULL COMMENT '入刀侧面崩边',
  `b3_rx` int(11) NULL DEFAULT NULL COMMENT 'B3TTV',
  `b4_rx` int(11) NULL DEFAULT NULL COMMENT 'B4脏污',
  `b5_rx` int(11) NULL DEFAULT NULL COMMENT 'B5色差',
  `c1ttv_rx` int(11) NULL DEFAULT NULL COMMENT 'C1线痕TTV',
  `c2_rx` int(11) NULL DEFAULT NULL COMMENT 'C2崩边缺角',
  `c7_rx` int(11) NULL DEFAULT NULL COMMENT 'C7隐裂',
  `dc_rx` int(11) NULL DEFAULT NULL COMMENT '直流',
  `double_disc_rx` int(11) NULL DEFAULT NULL COMMENT '双片',
  `other` int(11) NULL DEFAULT NULL COMMENT '其他',
  `error_project` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常项目',
  `wafer_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '硅片位置（单片）',
  `crystal_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶棒位置（单刀）',
  `remark_yc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常描述备注：',
  `remark_jb` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注：',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '制程单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_order_form
-- ----------------------------

-- ----------------------------
-- Table structure for mes_production_order
-- ----------------------------
DROP TABLE IF EXISTS `mes_production_order`;
CREATE TABLE `mes_production_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crystal_code` bigint(20) NOT NULL COMMENT '晶棒编号',
  `crystal_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶棒批次',
  `crystal_spec` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶棒规格',
  `resistivity` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电阻率Ω㎝',
  `side_length` double(10, 2) NULL DEFAULT NULL COMMENT '边长mm',
  `slice_thick_ness` double(10, 2) NULL DEFAULT NULL COMMENT '片厚μm',
  `order_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单批次',
  `spec_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格代码',
  `experiments` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实验发起',
  `type_experiments` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实验类型',
  `name_experiments` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实验名称',
  `production_remarks` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生产指令' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_production_order
-- ----------------------------

-- ----------------------------
-- Table structure for mes_production_order_auto_check_detail
-- ----------------------------
DROP TABLE IF EXISTS `mes_production_order_auto_check_detail`;
CREATE TABLE `mes_production_order_auto_check_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `matchingpost_order_form` bigint(20) NOT NULL COMMENT '制令单号',
  `check_date` datetime NULL DEFAULT NULL COMMENT '检验日期',
  `batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班组',
  `machine` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机台',
  `receive_numbers` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收片数',
  `operation_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上料员',
  `cleaning_loss` int(11) NULL DEFAULT NULL COMMENT '清洗损失',
  `sorting_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分选员',
  `machine_loss` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机选损失',
  `package_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打包人员',
  `qc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QC',
  `error_project` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常项目',
  `wafer_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '硅片位置（单片）',
  `crystal_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶棒位置（单刀）',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级',
  `a_numbers` int(11) NULL DEFAULT NULL COMMENT 'A片数',
  `high_resistance` int(11) NULL DEFAULT NULL COMMENT '高电阻',
  `low_resistance` int(11) NULL DEFAULT NULL COMMENT '低电阻',
  `a_size` int(11) NULL DEFAULT NULL COMMENT 'A尺寸',
  `a2_line` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\"A2轻线痕\"',
  `b2_line` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B2崩边',
  `knife_side` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入刀侧面崩边',
  `b3` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\"B3TTV\"',
  `b4` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B4脏污',
  `b5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B5色差',
  `c1ttv` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'C1线痕TTV',
  `c2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'C2崩边缺角',
  `c7` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\"C7隐裂',
  `dc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '直流',
  `double_disc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '双片',
  `other` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机选捡包明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_production_order_auto_check_detail
-- ----------------------------

-- ----------------------------
-- Table structure for mes_production_order_check
-- ----------------------------
DROP TABLE IF EXISTS `mes_production_order_check`;
CREATE TABLE `mes_production_order_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `matchingpost_order_form` bigint(20) NOT NULL COMMENT '制令单号',
  `check_date` datetime NULL DEFAULT NULL COMMENT '检验日期',
  `batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班组',
  `machine` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机台',
  `receive_numbers` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收片数',
  `operation_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上料员',
  `cleaning_loss` int(11) NULL DEFAULT NULL COMMENT '清洗损失',
  `sorting_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分选员',
  `machine_loss` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机选损失',
  `package_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打包人员',
  `qc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QC',
  `error_project` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常项目',
  `wafer_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '硅片位置（单片）',
  `crystal_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶棒位置（单刀）',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常描述备注：',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '捡包表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_production_order_check
-- ----------------------------

-- ----------------------------
-- Table structure for mes_production_order_check_detail
-- ----------------------------
DROP TABLE IF EXISTS `mes_production_order_check_detail`;
CREATE TABLE `mes_production_order_check_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `matchingpost_order_form` bigint(20) NOT NULL COMMENT '制令单号',
  `check_date` datetime NULL DEFAULT NULL COMMENT '检验日期',
  `batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班组',
  `machine` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机台',
  `receive_numbers` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收片数',
  `operation_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上料员',
  `cleaning_loss` int(11) NULL DEFAULT NULL COMMENT '清洗损失',
  `sorting_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分选员',
  `machine_loss` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机选损失',
  `package_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打包人员',
  `qc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QC',
  `error_project` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常项目',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级',
  `a_numbers` int(11) NULL DEFAULT NULL COMMENT 'A片数',
  `high_resistance` int(11) NULL DEFAULT NULL COMMENT '高电阻',
  `low_resistance` int(11) NULL DEFAULT NULL COMMENT '低电阻',
  `a_size` int(11) NULL DEFAULT NULL COMMENT 'A尺寸',
  `a2_line` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\"A2轻线痕\"',
  `b2_line` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B2崩边',
  `knife_side` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入刀侧面崩边',
  `b3` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\"B3TTV\"',
  `b4` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B4脏污',
  `b5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B5色差',
  `c1ttv` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'C1线痕TTV',
  `c2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'C2崩边缺角',
  `c7` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\"C7隐裂',
  `dc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '直流',
  `double_disc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '双片',
  `other` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他',
  `wafer_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '硅片位置（单片）',
  `crystal_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶棒位置（单刀）',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常描述备注：',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '捡包明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_production_order_check_detail
-- ----------------------------

-- ----------------------------
-- Table structure for mes_slice
-- ----------------------------
DROP TABLE IF EXISTS `mes_slice`;
CREATE TABLE `mes_slice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `matchingpost_order_form` bigint(20) NOT NULL COMMENT '制令单号',
  `date` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 切片日期',
  `team` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 班组',
  `slot_pitch` double(10, 2) NULL DEFAULT NULL COMMENT ' 槽距',
  `theory_numbers` int(11) NULL DEFAULT NULL COMMENT ' 理论切片数',
  `boot_dose` int(11) NULL DEFAULT NULL COMMENT ' 开机线量',
  `operation_user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 上棒操作工',
  `start_time` datetime NULL DEFAULT NULL COMMENT ' 上棒开机时间',
  `glue_stick_loss` double(10, 2) NULL DEFAULT NULL COMMENT ' 粘棒损失mm',
  `main_roller_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 主辊时间',
  `inducer_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 导轮厂家批次',
  `guide_time` datetime NULL DEFAULT NULL COMMENT ' 导向轮时间',
  `steel_wire_spec` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 钢线规格',
  `steel_wire_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 钢线厂家批次',
  `steel_wire_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 钢线编号',
  `knife_no` int(11) NULL DEFAULT NULL COMMENT ' 刀次',
  `cutting_fluid_batch` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 切割液厂家批次',
  `cutting_fluid_dosage` int(11) NULL DEFAULT NULL COMMENT ' 切割液用量',
  `offline_numbers` int(11) NULL DEFAULT NULL COMMENT ' 断线次数',
  `add_cut_flag` bit(1) NULL DEFAULT NULL COMMENT ' 是否加切',
  `knife_use_dosage` int(11) NULL DEFAULT NULL COMMENT ' 本刀用线量',
  `under_user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 下棒操作工',
  `under_time` datetime NULL DEFAULT NULL COMMENT ' 下棒时间',
  `timeout_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT ' 超时备注',
  `offline_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT ' 断线原因',
  `offline_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT ' 断线描述',
  `slice_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '切片备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '切片库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_slice
-- ----------------------------

-- ----------------------------
-- Table structure for mes_storage_info
-- ----------------------------
DROP TABLE IF EXISTS `mes_storage_info`;
CREATE TABLE `mes_storage_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `storage_location` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库位',
  `crystal_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晶棒编号',
  `spec` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `length` float(11, 2) NULL DEFAULT NULL COMMENT '长度',
  `thickness_splice` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '片厚',
  `slicer_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切片机型',
  `warehousing_time` datetime NULL DEFAULT NULL COMMENT '入库时间',
  `curing_time` int(11) NULL DEFAULT NULL COMMENT '固化时长',
  `storage_location_state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库位库存状态',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晶棒编号',
  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `storage_location1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集库位',
  `spec1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集规格',
  `type1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型',
  `length1` int(11) NULL DEFAULT NULL COMMENT '采集长度',
  `thickness_splice1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集片厚',
  `slicer_model1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集切片机型',
  `is_connectible1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集是否拼棒',
  `connectible_count1` int(11) NULL DEFAULT NULL COMMENT '采集拼棒数',
  `connection_type1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集拼棒类型',
  `working_time1` datetime NULL DEFAULT NULL COMMENT '采集进线时间',
  `transmitting_state1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集流转状态',
  `storage_state1` int(11) NULL DEFAULT NULL COMMENT '采集库存状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_storage_info
-- ----------------------------

-- ----------------------------
-- Table structure for mes_storage_manage
-- ----------------------------
DROP TABLE IF EXISTS `mes_storage_manage`;
CREATE TABLE `mes_storage_manage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库位',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `created_time` datetime(6) NULL DEFAULT NULL COMMENT '建立时间',
  `creater` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `revised_time` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `reviser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库位管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_storage_manage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_warehousing_info
-- ----------------------------
DROP TABLE IF EXISTS `mes_warehousing_info`;
CREATE TABLE `mes_warehousing_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `crystal_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晶棒编号',
  `spec` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `length` float(11, 2) NULL DEFAULT NULL COMMENT '长度',
  `thickness_splice` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '片厚',
  `slicer_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切片机型',
  `storage_location` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库位号',
  `warehousing_time` datetime(6) NULL DEFAULT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_warehousing_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2021-12-20 01:17:14', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-20 01:17:03', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-20 01:17:13', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-20 01:17:14', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-20 01:17:14', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-20 01:17:14', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-12-20 01:17:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-12-20 01:17:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '技术', '0', 'mes_SYBZ', '', '', 'Y', '0', NULL, NULL, 'admin', '2021-12-20 09:52:18', '');
INSERT INTO `sys_dict_data` VALUES (101, 1, '工艺', '1', 'mes_SYBZ', '', '', 'Y', '0', NULL, NULL, 'admin', '2021-12-20 09:54:53', '');
INSERT INTO `sys_dict_data` VALUES (102, 2, '质量', '2', 'mes_SYBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '新工艺', '0', 'mes_SYLX', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '新材料导入', '1', 'mes_SYLX', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '外部导入实验', '2', 'mes_SYLX', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '列表一', '0', 'mes_SCZL', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '列表二', '1', 'mes_SCZL', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '双科', '0', 'mes_SZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '双科', '0', 'mes_SZJ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '珀源', '1', 'mes_SZJ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '珀源', '0', 'mes_ZBJ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 1, '久隆', '1', 'mes_ZBJ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '空塑10mm', '0', 'mes_ZBB', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '空塑12mm', '1', 'mes_ZBB', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 0, '列表一', '0', 'mes_ZBBCZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 1, '列表二', '1', 'mes_ZBBCZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 0, '更换主棍', '0', 'mes_CSBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 1, '调整线网', '1', 'mes_CSBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 2, '设备维修', '2', 'mes_CSBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 3, '断线', '3', 'mes_CSBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 4, '待料', '4', 'mes_CSBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 5, '缺辅材', '5', 'mes_CSBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 6, '缺配件', '6', 'mes_CSBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 0, '是', '0', 'mes_JQ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 1, '否', '1', 'mes_JQ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 0, '钢线', '0', 'mes_DXYY', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 1, '人为', '1', 'mes_DXYY', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 2, '工艺', '2', 'mes_DXYY', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 0, '棒长切换', '0', 'mes_CXH', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 1, '加切', '1', 'mes_CXH', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 2, '切割断线', '2', 'mes_CXH', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 3, '跑线断线', '3', 'mes_CXH', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 4, '热机断线', '4', 'mes_CXH', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 5, '新线首刀', '5', 'mes_CXH', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 6, '设备维修', '6', 'mes_CXH', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (136, 0, '列表一', '0', 'mes_QPBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 1, '列表二', '1', 'mes_QPBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 0, '列表一', '0', 'mes_QXBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (139, 1, '列表二', '1', 'mes_QXBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 0, '列表一', '0', 'mes_YCMS', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 1, '列表二', '1', 'mes_YCMS', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 0, '列表一', '0', 'mes_FXBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 1, '列表二', '1', 'mes_FXBZ', NULL, NULL, 'Y', '0', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-12-20 01:17:12', NULL, NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '实验发起', 'mes_SYBZ', '0', 'admin', NULL, NULL, NULL, '实验发起列表');
INSERT INTO `sys_dict_type` VALUES (101, '实验类型', 'mes_SYLX', '0', 'admin', NULL, NULL, NULL, '实验类型列表');
INSERT INTO `sys_dict_type` VALUES (102, '生产指令备注', 'mes_SCZL', '0', 'admin', NULL, NULL, NULL, '生产指令备注列表');
INSERT INTO `sys_dict_type` VALUES (103, '水煮胶厂家批次', 'mes_SZ', '0', 'admin', NULL, NULL, NULL, '水煮胶厂家批次列表');
INSERT INTO `sys_dict_type` VALUES (104, '粘棒胶厂家批次', 'mes_SZJ', '0', 'admin', NULL, NULL, NULL, '粘棒胶厂家批次列表');
INSERT INTO `sys_dict_type` VALUES (105, '粘棒板厂家批次', 'mes_ZBJ', '0', 'admin', NULL, NULL, NULL, '粘棒板厂家批次列表');
INSERT INTO `sys_dict_type` VALUES (106, '粘棒板材质', 'mes_ZBB', '0', 'admin', NULL, NULL, NULL, '粘棒板材质列表');
INSERT INTO `sys_dict_type` VALUES (107, '粘胶备注', 'mes_ZBBCZ', '0', 'admin', NULL, NULL, NULL, '粘胶备注列表');
INSERT INTO `sys_dict_type` VALUES (108, '超时备注', 'mes_CSBZ', '0', 'admin', NULL, NULL, NULL, '超时备注列表');
INSERT INTO `sys_dict_type` VALUES (109, '是否加切', 'mes_JQ', '0', 'admin', NULL, NULL, NULL, '是否加切列表');
INSERT INTO `sys_dict_type` VALUES (110, '断线原因', 'mes_DXYY', '0', 'admin', NULL, NULL, NULL, '断线原因列表');
INSERT INTO `sys_dict_type` VALUES (111, '超线耗原因', 'mes_CXH', '0', 'admin', NULL, NULL, NULL, '超线耗原因列表');
INSERT INTO `sys_dict_type` VALUES (112, '切片备注', 'mes_QPBZ', '0', 'admin', NULL, NULL, NULL, '切片备注列表');
INSERT INTO `sys_dict_type` VALUES (113, '清洗备注', 'mes_QXBZ', '0', 'admin', NULL, NULL, NULL, '清洗备注列表');
INSERT INTO `sys_dict_type` VALUES (114, '异常描述备注', 'mes_YCMS', '0', 'admin', NULL, NULL, NULL, '异常描述备注列表');
INSERT INTO `sys_dict_type` VALUES (115, '分选备注', 'mes_FXBZ', '0', 'admin', NULL, NULL, NULL, '分选备注列表');
INSERT INTO `sys_dict_type` VALUES (116, '固化状态', 'mes_curing_time', '0', 'admin', '2021-12-25 01:45:35', '', NULL, '记录库位中晶棒的粘胶固化状态');
INSERT INTO `sys_dict_type` VALUES (117, '拼棒类型', 'mes_connection_type', '0', 'admin', '2021-12-25 01:47:51', 'admin', '2021-12-25 01:50:26', '记录晶棒的拼棒类型');
INSERT INTO `sys_dict_type` VALUES (118, '晶棒规格', 'mes_spec', '0', 'admin', '2021-12-25 01:49:05', 'admin', '2021-12-25 01:50:06', '记录晶棒的规格信息');
INSERT INTO `sys_dict_type` VALUES (119, '晶棒尺寸', 'mes_size', '0', 'admin', '2021-12-25 01:51:44', '', NULL, '记录晶棒的尺寸信息');
INSERT INTO `sys_dict_type` VALUES (120, '晶棒片厚', 'mes_thickness_splice', '0', 'admin', '2021-12-25 01:52:55', '', NULL, '记录晶棒片厚信息');
INSERT INTO `sys_dict_type` VALUES (121, '切片机型', 'mes_slicer_model', '0', 'admin', '2021-12-25 01:53:55', '', NULL, '记录晶棒切片机型');
INSERT INTO `sys_dict_type` VALUES (122, '晶棒类型', 'mes_type', '0', 'admin', '2021-12-25 02:00:18', '', NULL, '记录晶棒类型');
INSERT INTO `sys_dict_type` VALUES (123, '拼棒是否', 'mes_is_connectible', '0', 'admin', '2021-12-25 02:02:20', '', NULL, '记录晶棒是否拼棒');
INSERT INTO `sys_dict_type` VALUES (124, '胶水批次', 'mes_glue_batch', '0', 'admin', '2021-12-25 15:11:59', '', NULL, '记录胶水批次信息');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-12-20 01:17:15', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-12-20 01:17:15', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-12-20 01:17:15', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 198 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 01:29:30');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 04:35:26');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-20 04:36:25');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 04:36:28');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 04:38:24');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-20 06:30:14');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 06:30:18');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 06:39:53');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 06:42:57');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 06:45:38');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-20 07:02:54');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 07:02:58');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 07:25:45');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 07:28:40');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 07:47:26');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 08:42:59');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 08:43:53');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 08:45:35');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 08:47:45');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 09:22:57');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-20 10:00:31');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-20 10:00:37');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-21 01:39:49');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-21 01:39:54');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 01:33:27');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 02:09:19');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 03:29:55');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 05:33:31');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 06:58:59');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 07:37:43');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 08:04:10');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 08:06:56');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 08:08:40');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 09:02:40');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-24 11:59:35');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 01:37:34');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 02:09:53');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 02:21:24');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 02:25:46');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 02:39:23');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 02:41:21');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 02:59:12');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 03:30:02');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-12-25 03:39:27');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 04:37:19');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-12-25 13:13:53');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 13:13:55');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-12-25 13:20:36');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 14:16:42');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 14:17:20');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-12-25 14:17:26');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 14:18:11');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 15:09:46');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 16:55:57');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-25 17:13:52');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 09:28:58');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 11:17:03');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 11:24:17');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 12:15:18');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 12:17:57');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 12:23:04');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 12:23:13');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-12-27 12:24:36');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 12:25:05');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 12:56:55');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 13:04:54');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 13:20:40');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 13:26:05');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-12-27 13:28:46');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 13:31:48');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 13:50:23');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 13:58:58');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 14:01:48');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 14:02:02');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 14:03:26');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 14:05:18');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 14:08:12');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 14:11:14');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 14:12:15');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 14:14:23');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 14:24:36');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 14:25:41');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 14:27:07');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 14:30:06');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 14:34:34');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 14:41:43');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 15:03:40');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 15:21:55');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-27 16:47:26');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-27 16:57:50');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-31 09:04:28');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-12-31 15:57:46');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-01 11:23:53');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-03 08:56:40');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-03 09:34:21');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-03 09:43:08');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-03 09:45:25');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-03 09:54:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2071 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-12-20 01:17:04', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-12-20 01:17:04', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-12-20 01:17:04', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2021-12-20 01:17:04', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-12-20 01:17:04', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-12-20 01:17:04', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-12-20 01:17:04', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-12-20 01:17:04', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-12-20 01:17:04', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-12-20 01:17:04', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-12-20 01:17:04', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-12-20 01:17:04', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-12-20 01:17:04', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-12-20 01:17:04', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-12-20 01:17:04', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-12-20 01:17:04', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-12-20 01:17:04', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-12-20 01:17:05', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-12-20 01:17:05', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-12-20 01:17:05', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-12-20 01:17:05', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-12-20 01:17:05', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-12-20 01:17:05', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-12-20 01:17:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-12-20 01:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-12-20 01:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-12-20 01:17:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-12-20 01:17:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-12-20 01:17:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-12-20 01:17:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '配棒库', 0, 1, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-object-group', 'admin', '2021-12-20 01:40:32', 'admin', '2021-12-27 09:32:30', '');
INSERT INTO `sys_menu` VALUES (2001, '来料入库', 2000, 1, '/mes/crystal', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2021-12-20 01:42:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '生产指令', 2000, 2, '/mes/order', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2021-12-20 07:32:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '固化库', 0, 2, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-cubes', 'admin', '2021-12-24 01:36:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '库位管理', 2003, 1, '/mes/manage', 'menuItem', 'C', '0', '1', 'mes:manage:view', '#', 'admin', '2021-12-24 01:59:06', '', NULL, '库位管理菜单');
INSERT INTO `sys_menu` VALUES (2011, '晶棒信息', 2000, 1, '/mes/info', 'menuItem', 'C', '0', '1', 'mes:info:view', '#', 'admin', '2021-12-24 08:05:21', 'admin', '2021-12-25 04:47:43', '晶棒信息菜单');
INSERT INTO `sys_menu` VALUES (2012, '晶棒信息查询', 2011, 1, '#', '', 'F', '0', '1', 'mes:info:list', '#', 'admin', '2021-12-24 08:05:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '晶棒信息新增', 2011, 2, '#', '', 'F', '0', '1', 'mes:info:add', '#', 'admin', '2021-12-24 08:05:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '晶棒信息修改', 2011, 3, '#', '', 'F', '0', '1', 'mes:info:edit', '#', 'admin', '2021-12-24 08:05:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '晶棒信息删除', 2011, 4, '#', '', 'F', '0', '1', 'mes:info:remove', '#', 'admin', '2021-12-24 08:05:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '晶棒信息导出', 2011, 5, '#', '', 'F', '0', '1', 'mes:info:export', '#', 'admin', '2021-12-24 08:05:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '库位管理查询', 2004, 1, '#', '', 'F', '0', '1', 'mes:manage:list', '#', 'admin', '2021-12-27 11:31:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '库位管理新增', 2004, 2, '#', '', 'F', '0', '1', 'mes:manage:add', '#', 'admin', '2021-12-27 11:31:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '库位管理修改', 2004, 3, '#', '', 'F', '0', '1', 'mes:manage:edit', '#', 'admin', '2021-12-27 11:31:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '库位管理删除', 2004, 4, '#', '', 'F', '0', '1', 'mes:manage:remove', '#', 'admin', '2021-12-27 11:31:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '库位管理导出', 2004, 5, '#', '', 'F', '0', '1', 'mes:manage:export', '#', 'admin', '2021-12-27 11:31:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '档案维护', 0, 2, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-folder', 'admin', '2021-12-27 12:58:58', 'admin', '2021-12-27 12:59:19', '');
INSERT INTO `sys_menu` VALUES (2023, '胶水批次', 2022, 1, '/mes/glue_batch', '', 'C', '0', '1', 'mes:glue_batch:view', '#', 'admin', '2021-12-27 13:03:59', '', NULL, '胶水批次菜单');
INSERT INTO `sys_menu` VALUES (2024, '胶水批次查询', 2023, 1, '#', '', 'F', '0', '1', 'mes:glue_batch:list', '#', 'admin', '2021-12-27 13:03:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '胶水批次新增', 2023, 2, '#', '', 'F', '0', '1', 'mes:glue_batch:add', '#', 'admin', '2021-12-27 13:03:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '胶水批次修改', 2023, 3, '#', '', 'F', '0', '1', 'mes:glue_batch:edit', '#', 'admin', '2021-12-27 13:03:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '胶水批次删除', 2023, 4, '#', '', 'F', '0', '1', 'mes:glue_batch:remove', '#', 'admin', '2021-12-27 13:03:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '胶水批次导出', 2023, 5, '#', '', 'F', '0', '1', 'mes:glue_batch:export', '#', 'admin', '2021-12-27 13:03:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '板材批次', 2022, 1, '/mes/board_batch', '', 'C', '0', '1', 'mes:board_batch:view', '#', 'admin', '2021-12-27 13:21:14', '', NULL, '板材批次菜单');
INSERT INTO `sys_menu` VALUES (2030, '板材批次查询', 2029, 1, '#', '', 'F', '0', '1', 'mes:board_batch:list', '#', 'admin', '2021-12-27 13:21:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '板材批次新增', 2029, 2, '#', '', 'F', '0', '1', 'mes:board_batch:add', '#', 'admin', '2021-12-27 13:21:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '板材批次修改', 2029, 3, '#', '', 'F', '0', '1', 'mes:board_batch:edit', '#', 'admin', '2021-12-27 13:21:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '板材批次删除', 2029, 4, '#', '', 'F', '0', '1', 'mes:board_batch:remove', '#', 'admin', '2021-12-27 13:21:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '板材批次导出', 2029, 5, '#', '', 'F', '0', '1', 'mes:board_batch:export', '#', 'admin', '2021-12-27 13:21:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '入库信息', 2003, 4, '/mes/mes_warehousing_info', 'menuItem', 'C', '0', '1', 'mes:mes_warehousing_info:view', '#', 'admin', '2022-01-03 09:24:50', 'admin', '2022-01-03 09:48:08', '入库信息菜单');
INSERT INTO `sys_menu` VALUES (2036, '入库信息查询', 2035, 1, '#', '', 'F', '0', '1', 'mes:mes_warehousing_info:list', '#', 'admin', '2022-01-03 09:24:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '入库信息新增', 2035, 2, '#', '', 'F', '0', '1', 'mes:mes_warehousing_info:add', '#', 'admin', '2022-01-03 09:24:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '入库信息修改', 2035, 3, '#', '', 'F', '0', '1', 'mes:mes_warehousing_info:edit', '#', 'admin', '2022-01-03 09:24:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '入库信息删除', 2035, 4, '#', '', 'F', '0', '1', 'mes:mes_warehousing_info:remove', '#', 'admin', '2022-01-03 09:24:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '入库信息导出', 2035, 5, '#', '', 'F', '0', '1', 'mes:mes_warehousing_info:export', '#', 'admin', '2022-01-03 09:24:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '库存信息', 2003, 2, '/mes/mes_storage_info', 'menuItem', 'C', '0', '1', 'mes:mes_storage_info:view', '#', 'admin', '2022-01-03 09:25:10', 'admin', '2022-01-03 09:47:29', '库存信息菜单');
INSERT INTO `sys_menu` VALUES (2042, '库存信息查询', 2041, 1, '#', '', 'F', '0', '1', 'mes:mes_storage_info:list', '#', 'admin', '2022-01-03 09:25:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '库存信息新增', 2041, 2, '#', '', 'F', '0', '1', 'mes:mes_storage_info:add', '#', 'admin', '2022-01-03 09:25:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '库存信息修改', 2041, 3, '#', '', 'F', '0', '1', 'mes:mes_storage_info:edit', '#', 'admin', '2022-01-03 09:25:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '库存信息删除', 2041, 4, '#', '', 'F', '0', '1', 'mes:mes_storage_info:remove', '#', 'admin', '2022-01-03 09:25:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '库存信息导出', 2041, 5, '#', '', 'F', '0', '1', 'mes:mes_storage_info:export', '#', 'admin', '2022-01-03 09:25:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '出库信息', 2003, 3, '/mes/mes_exwarehousing_info', 'menuItem', 'C', '0', '1', 'mes:mes_exwarehousing_info:view', '#', 'admin', '2022-01-03 09:44:11', 'admin', '2022-01-03 09:47:53', '出库信息菜单');
INSERT INTO `sys_menu` VALUES (2060, '出库信息查询', 2059, 1, '#', '', 'F', '0', '1', 'mes:mes_exwarehousing_info:list', '#', 'admin', '2022-01-03 09:44:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '出库信息新增', 2059, 2, '#', '', 'F', '0', '1', 'mes:mes_exwarehousing_info:add', '#', 'admin', '2022-01-03 09:44:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '出库信息修改', 2059, 3, '#', '', 'F', '0', '1', 'mes:mes_exwarehousing_info:edit', '#', 'admin', '2022-01-03 09:44:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '出库信息删除', 2059, 4, '#', '', 'F', '0', '1', 'mes:mes_exwarehousing_info:remove', '#', 'admin', '2022-01-03 09:44:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '出库信息导出', 2059, 5, '#', '', 'F', '0', '1', 'mes:mes_exwarehousing_info:export', '#', 'admin', '2022-01-03 09:44:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '库存盘点', 2003, 5, '/mes/mes_crystal_check', 'menuItem', 'C', '0', '1', 'mes:mes_crystal_check:view', '#', 'admin', '2022-01-03 09:53:24', 'admin', '2022-01-03 09:53:57', '库存盘点菜单');
INSERT INTO `sys_menu` VALUES (2066, '库存盘点查询', 2065, 1, '#', '', 'F', '0', '1', 'mes:mes_crystal_check:list', '#', 'admin', '2022-01-03 09:53:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '库存盘点新增', 2065, 2, '#', '', 'F', '0', '1', 'mes:mes_crystal_check:add', '#', 'admin', '2022-01-03 09:53:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '库存盘点修改', 2065, 3, '#', '', 'F', '0', '1', 'mes:mes_crystal_check:edit', '#', 'admin', '2022-01-03 09:53:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '库存盘点删除', 2065, 4, '#', '', 'F', '0', '1', 'mes:mes_crystal_check:remove', '#', 'admin', '2022-01-03 09:53:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '库存盘点导出', 2065, 5, '#', '', 'F', '0', '1', 'mes:mes_crystal_check:export', '#', 'admin', '2022-01-03 09:53:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2021-12-20 01:17:15', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2021-12-20 01:17:15', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"原料库\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-object-group\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 01:40:32');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"来料入库\"],\"url\":[\"/mes/crystal\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 01:42:18');
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"管理员\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2021-12-20 01:53:46');
INSERT INTO `sys_oper_log` VALUES (103, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"普通用户\"],\"dept.deptName\":[\"测试部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 01:54:08');
INSERT INTO `sys_oper_log` VALUES (104, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"管理员\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 01:55:34');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"生产指令\"],\"url\":[\"/mes/order\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 07:32:11');
INSERT INTO `sys_oper_log` VALUES (106, '生产指令', 1, 'com.ruoyi.mes.controller.MesProductionOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/add', '127.0.0.1', '内网IP', '{\"crystalId\":[\"1\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166\"],\"sliceThickNess\":[\"170\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\r\n### The error may exist in file [D:\\WorkSpaces\\jiangxi-wms\\ruoyi-mes\\target\\classes\\mapper\\mes\\MesProductionOrderMapper.xml]\r\n### The error may involve com.ruoyi.mes.mapper.MesProductionOrderMapper.insertMesProductionOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mes_production_order          ( crystal_id,             crystal_batch,             crystal_spec,             resistivity,             side_length,             slice_thick_ness,             order_batch,             spec_code,                                       name_experiments )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'', '2021-12-20 07:35:40');
INSERT INTO `sys_oper_log` VALUES (107, '生产指令', 1, 'com.ruoyi.mes.controller.MesProductionOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/add', '127.0.0.1', '内网IP', '{\"crystalId\":[\"2\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166\"],\"sliceThickNess\":[\"170\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\r\n### The error may exist in file [D:\\WorkSpaces\\jiangxi-wms\\ruoyi-mes\\target\\classes\\mapper\\mes\\MesProductionOrderMapper.xml]\r\n### The error may involve com.ruoyi.mes.mapper.MesProductionOrderMapper.insertMesProductionOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mes_production_order          ( crystal_id,             crystal_batch,             crystal_spec,             resistivity,             side_length,             slice_thick_ness,             order_batch,             spec_code,                                       name_experiments )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'', '2021-12-20 07:35:46');
INSERT INTO `sys_oper_log` VALUES (108, '生产指令', 1, 'com.ruoyi.mes.controller.MesProductionOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/add', '127.0.0.1', '内网IP', '{\"crystalId\":[\"3\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166\"],\"sliceThickNess\":[\"170\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\r\n### The error may exist in file [D:\\WorkSpaces\\jiangxi-wms\\ruoyi-mes\\target\\classes\\mapper\\mes\\MesProductionOrderMapper.xml]\r\n### The error may involve com.ruoyi.mes.mapper.MesProductionOrderMapper.insertMesProductionOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mes_production_order          ( crystal_id,             crystal_batch,             crystal_spec,             resistivity,             side_length,             slice_thick_ness,             order_batch,             spec_code,                                       name_experiments )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'', '2021-12-20 07:35:51');
INSERT INTO `sys_oper_log` VALUES (109, '生产指令', 1, 'com.ruoyi.mes.controller.MesProductionOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/add', '127.0.0.1', '内网IP', '{\"crystalId\":[\"3\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166\"],\"sliceThickNess\":[\"170\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\r\n### The error may exist in file [D:\\WorkSpaces\\jiangxi-wms\\ruoyi-mes\\target\\classes\\mapper\\mes\\MesProductionOrderMapper.xml]\r\n### The error may involve com.ruoyi.mes.mapper.MesProductionOrderMapper.insertMesProductionOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mes_production_order          ( crystal_id,             crystal_batch,             crystal_spec,             resistivity,             side_length,             slice_thick_ness,             order_batch,             spec_code,                                       name_experiments )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'', '2021-12-20 07:36:33');
INSERT INTO `sys_oper_log` VALUES (110, '生产指令', 1, 'com.ruoyi.mes.controller.MesProductionOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/add', '127.0.0.1', '内网IP', '{\"crystalId\":[\"3\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166\"],\"sliceThickNess\":[\"170\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\r\n### The error may exist in file [D:\\WorkSpaces\\jiangxi-wms\\ruoyi-mes\\target\\classes\\mapper\\mes\\MesProductionOrderMapper.xml]\r\n### The error may involve com.ruoyi.mes.mapper.MesProductionOrderMapper.insertMesProductionOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mes_production_order          ( crystal_id,             crystal_batch,             crystal_spec,             resistivity,             side_length,             slice_thick_ness,             order_batch,             spec_code,                                       name_experiments )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'', '2021-12-20 07:36:52');
INSERT INTO `sys_oper_log` VALUES (111, '生产指令', 1, 'com.ruoyi.mes.controller.MesProductionOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/add', '127.0.0.1', '内网IP', '{\"crystalId\":[\"3\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166\"],\"sliceThickNess\":[\"170\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\r\n### The error may exist in file [D:\\WorkSpaces\\jiangxi-wms\\ruoyi-mes\\target\\classes\\mapper\\mes\\MesProductionOrderMapper.xml]\r\n### The error may involve com.ruoyi.mes.mapper.MesProductionOrderMapper.insertMesProductionOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mes_production_order          ( crystal_id,             crystal_batch,             crystal_spec,             resistivity,             side_length,             slice_thick_ness,             order_batch,             spec_code,                                       name_experiments )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'crystal_id\' in \'field list\'', '2021-12-20 07:37:02');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_production_order\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 07:48:31');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_crystal\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 07:48:59');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"mes_crystal\"],\"tableComment\":[\"原始晶棒入库表\"],\"className\":[\"MesCrystal\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"14\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"15\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"层数\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"layerNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"16\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒编号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"code\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"17\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"型号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"model\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"18\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"规格\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"spec\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"19\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"中心电阻率（上）\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"upResistivity\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 07:57:50');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideLeng', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 07:58:46');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideLeng', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 07:58:58');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"mes_crystal\"],\"tableComment\":[\"原始晶棒入库表\"],\"className\":[\"MesCrystal\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"14\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"15\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"层数\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"layerNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"16\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒编号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"code\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"17\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"型号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"model\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"18\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"规格\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"spec\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"19\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"中心电阻率（上）\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"upResistivity\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 07:59:24');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"wangyong\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideL', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 08:00:02');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"wangyong\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideL', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 08:00:33');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"wangyong\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideL', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 08:00:44');
INSERT INTO `sys_oper_log` VALUES (121, '字典类型', 5, 'com.ruoyi.web.controller.system.SysDictTypeController.export()', 'POST', 1, 'admin', '研发部门', '/system/dict/export', '127.0.0.1', '内网IP', '{\"dictName\":[\"\"],\"dictType\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"dictId\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"6d1486fe-57df-48ef-a566-12973917c47b_字典类型.xlsx\",\"code\":0}', 0, NULL, '2021-12-20 08:01:05');
INSERT INTO `sys_oper_log` VALUES (122, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/dict/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 08:43:17');
INSERT INTO `sys_oper_log` VALUES (123, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/dict/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 08:43:18');
INSERT INTO `sys_oper_log` VALUES (124, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/dict/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 08:45:43');
INSERT INTO `sys_oper_log` VALUES (125, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/dict/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 08:45:44');
INSERT INTO `sys_oper_log` VALUES (126, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"技术\"],\"dictValue\":[\"0\"],\"dictType\":[\"mes_SYBZ\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 09:52:18');
INSERT INTO `sys_oper_log` VALUES (127, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"工艺\"],\"dictValue\":[\"1\"],\"dictType\":[\"mes_SYBZ\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 09:54:53');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"wangyong\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideL', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 09:56:37');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"mes_crystal\"],\"tableComment\":[\"原始晶棒入库表\"],\"className\":[\"MesCrystal\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"14\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"15\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"层数\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"layerNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"16\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒编号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"code\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"17\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"型号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"model\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"18\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"规格\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"spec\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"19\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"中心电阻率（上）\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"upResistivity\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 09:57:27');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"wangyong\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideL', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 09:57:49');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"wangyong\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideL', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 09:58:03');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"wangyong\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideL', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 09:58:30');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"mes_production_order\"],\"tableComment\":[\"生产指令\"],\"className\":[\"MesProductionOrder\"],\"functionAuthor\":[\"wangyong\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒批次\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalBatch\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"晶棒规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"crystalSpec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"电阻率Ω㎝\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"resistivity\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"边长mm\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"sideL', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 09:58:37');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"mes_crystal\"],\"tableComment\":[\"原始晶棒入库表\"],\"className\":[\"MesCrystal\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"14\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"15\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"层数\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"layerNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"16\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒编号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"code\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"17\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"型号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"model\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"18\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"规格\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"spec\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"19\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"中心电阻率（上）\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"upResistivity\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 09:58:46');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/mes_production_order', '127.0.0.1', '内网IP', '\"mes_production_order\"', NULL, 0, NULL, '2021-12-20 09:59:12');
INSERT INTO `sys_oper_log` VALUES (136, '生产指令', 1, 'com.ruoyi.mes.controller.MesProductionOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/add', '127.0.0.1', '内网IP', '{\"crystalCode\":[\"\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166\"],\"sliceThickNess\":[\"170\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"\"],\"experiments\":[\"\"],\"typeExperiments\":[\"\"],\"productionRemarks\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'crystal_code\' doesn\'t have a default value\r\n### The error may exist in file [D:\\WorkSpaces\\jiangxi-wms\\ruoyi-mes\\target\\classes\\mapper\\mes\\MesProductionOrderMapper.xml]\r\n### The error may involve com.ruoyi.mes.mapper.MesProductionOrderMapper.insertMesProductionOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mes_production_order          ( crystal_batch,             crystal_spec,             resistivity,             side_length,             slice_thick_ness,             order_batch,             spec_code,             experiments,             type_experiments,             name_experiments,             production_remarks )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'crystal_code\' doesn\'t have a default value\n; Field \'crystal_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'crystal_code\' doesn\'t have a default value', '2021-12-20 10:00:59');
INSERT INTO `sys_oper_log` VALUES (137, '生产指令', 1, 'com.ruoyi.mes.controller.MesProductionOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/add', '127.0.0.1', '内网IP', '{\"crystalCode\":[\"1\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166\"],\"sliceThickNess\":[\"170\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"\"],\"experiments\":[\"\"],\"typeExperiments\":[\"\"],\"productionRemarks\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 10:01:11');
INSERT INTO `sys_oper_log` VALUES (138, '生产指令', 2, 'com.ruoyi.mes.controller.MesProductionOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"crystalCode\":[\"0\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166.0\"],\"sliceThickNess\":[\"170.0\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"\"],\"experiments\":[\"\"],\"typeExperiments\":[\"\"],\"productionRemarks\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-20 10:01:58');
INSERT INTO `sys_oper_log` VALUES (139, '生产指令', 2, 'com.ruoyi.mes.controller.MesProductionOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/mes/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"crystalCode\":[\"1\"],\"crystalBatch\":[\"楚雄9.16\"],\"crystalSpec\":[\"单晶P型\"],\"resistivity\":[\"0.4-1.1\"],\"sideLength\":[\"166.0\"],\"sliceThickNess\":[\"170.0\"],\"orderBatch\":[\"爱旭9.30\"],\"specCode\":[\"单P258\"],\"nameExperiments\":[\"\"],\"experiments\":[\"\"],\"typeExperiments\":[\"\"],\"productionRemarks\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-21 01:40:41');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_order_form\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-21 01:43:11');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"固化库\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-cubes\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 01:36:10');
INSERT INTO `sys_oper_log` VALUES (142, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"DROP TABLE IF EXISTS `mes_crystal_info`;\\nCREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',\\n  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) CHARACTER SET uft8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMIT \'类型\',\\n  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) CHARACTER SET uft8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\\n\"]}', NULL, 1, 'syntax error, error in :\'DEFAULT NULL COMMIT \'类型\',\n  `spec` varchar(\', expect ), actual null, pos 570, line 8, column 83, token IDENTIFIER COMMIT', '2021-12-24 05:33:40');
INSERT INTO `sys_oper_log` VALUES (143, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"DROP TABLE IF EXISTS `mes_crystal_info`;\\nCREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',\\n  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMIT \'类型\',\\n  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) CHARACTER SET uft8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"]}', NULL, 1, 'syntax error, error in :\'DEFAULT NULL COMMIT \'类型\',\n  `spec` varchar(\', expect ), actual null, pos 570, line 8, column 83, token IDENTIFIER COMMIT', '2021-12-24 05:34:44');
INSERT INTO `sys_oper_log` VALUES (144, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"\\nDROP TABLE IF EXISTS `mes_crystal_info`;\\nCREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',\\n  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'类型\',\\n  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) CHARACTER SET uft8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"]}', '{\"msg\":\"请输入建表语句\",\"code\":500}', 0, NULL, '2021-12-24 05:36:06');
INSERT INTO `sys_oper_log` VALUES (145, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',\\n  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'类型\',\\n  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) CHARACTER SET uft8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown character set: \'uft8\'\r\n### The error may exist in file [C:\\Users\\12845\\IdeaProjects\\jiangxi-wms\\ruoyi-generator\\target\\classes\\mapper\\generator\\GenTableMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: CREATE TABLE `mes_crystal_info` (  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',  `length` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',  `type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'类型\',  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',  `thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',  `is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',  `slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',  `working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',  `storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',  `storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',  `created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',  `creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',  `picker` VARCHAR(64) CHARACTER SET uft8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',  `auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',  PRIMARY KEY USING BTREE (`id`) ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER S', '2021-12-24 05:36:20');
INSERT INTO `sys_oper_log` VALUES (146, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"DROP TABLE IF EXISTS `mes_crystal_info`;\\nCREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',\\n  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'类型\',\\n  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\"]}', '{\"msg\":\"请输入建表语句\",\"code\":500}', 0, NULL, '2021-12-24 05:37:11');
INSERT INTO `sys_oper_log` VALUES (147, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',\\n  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'类型\',\\n  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\nSET FOREIGN_KEY_CHECKS = 1;\"]}', '{\"msg\":\"请输入建表语句\",\"code\":500}', 0, NULL, '2021-12-24 05:37:23');
INSERT INTO `sys_oper_log` VALUES (148, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',\\n  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'类型\',\\n  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\nSET FOREIGN_KEY_CHECKS = 1;\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'mes_crystal_info\' already exists\r\n### The error may exist in file [C:\\Users\\12845\\IdeaProjects\\jiangxi-wms\\ruoyi-generator\\target\\classes\\mapper\\generator\\GenTableMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: CREATE TABLE `mes_crystal_info` (  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',  `length` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',  `type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'类型\',  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',  `thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',  `is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',  `slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',  `working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',  `storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',  `storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',  `created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',  `creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',  `picker` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',  `auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',  PRIMARY KEY USING BTREE (`id`) ) ENGINE = InnoDB AUTO_INCREMENT = 1 C', '2021-12-24 05:37:39');
INSERT INTO `sys_oper_log` VALUES (149, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"DROP TABLE IF EXISTS `mes_crystal_info`;\\nCREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL DEFAULT NULL COMMENT \'层数\',\\n  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'类型\',\\n  `spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL DEFAULT NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL DEFAULT NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\"]}', '{\"msg\":\"请输入建表语句\",\"code\":500}', 0, NULL, '2021-12-24 05:41:15');
INSERT INTO `sys_oper_log` VALUES (150, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"DROP TABLE IF EXISTS `mes_crystal_info`;\\nCREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL COMMENT \'层数\',\\n  `code` varchar(64) NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64)  NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) NULL COMMENT \'类型\',\\n  `spec` varchar(64) NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"]}', '{\"msg\":\"请输入建表语句\",\"code\":500}', 0, NULL, '2021-12-24 05:50:47');
INSERT INTO `sys_oper_log` VALUES (151, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL COMMENT \'层数\',\\n  `code` varchar(64) NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64)  NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) NULL COMMENT \'类型\',\\n  `spec` varchar(64) NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = \'晶棒信息\' ROW_FORMAT = Dynamic;\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"]}', '{\"msg\":\"请输入建表语句\",\"code\":500}', 0, NULL, '2021-12-24 05:50:59');
INSERT INTO `sys_oper_log` VALUES (152, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL COMMENT \'层数\',\\n  `code` varchar(64) NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64)  NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) NULL COMMENT \'类型\',\\n  `spec` varchar(64) NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) NULL COMMENT \'切片机型\',\\n\\t`working_time` VARCHAR(64) NULL COMMENT \'进线时间\',\\n\\t`storage_state` int(11) NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8 COMMENT = \'晶棒信息\';\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 05:54:01');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 05:57:32');
INSERT INTO `sys_oper_log` VALUES (154, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL COMMENT \'层数\',\\n  `code` varchar(64) NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64)  NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) NULL COMMENT \'类型\',\\n  `spec` varchar(64) NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) NULL COMMENT \'切片机型\',\\n\\t`working_time` datetime NULL COMMENT \'进线时间\',\\n\\t`transmitting_state` VARCHAR(64) NULL COMMENT \'流转状态\',\\n\\t`storage_state` int(11) NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8 COMMENT = \'晶棒信息\';\\n\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'mes_crystal_info\' already exists\r\n### The error may exist in file [C:\\Users\\12845\\IdeaProjects\\jiangxi-wms\\ruoyi-generator\\target\\classes\\mapper\\generator\\GenTableMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: CREATE TABLE `mes_crystal_info` (  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'主键id\',  `layer_number` int(11) NULL COMMENT \'层数\',  `code` varchar(64) NULL COMMENT \'晶棒编号\',  `model` varchar(64) NULL COMMENT \'型号\',  `length` VARCHAR(64) NULL COMMENT \'长度\',  `type` VARCHAR(64) NULL COMMENT \'类型\',  `spec` varchar(64) NULL COMMENT \'规格\',  `thinck_splice` VARCHAR(64) NULL COMMENT \'片厚\',  `is_connectible` VARCHAR(64) NULL COMMENT \'是否拼棒\',  `slicer_model` VARCHAR(64) NULL COMMENT \'切片机型\',  `working_time` datetime NULL COMMENT \'进线时间\',  `transmitting_state` VARCHAR(64) NULL COMMENT \'流转状态\',  `storage_state` int(11) NULL COMMENT \'库存状态\',  `storage_location` VARCHAR(64) NULL COMMENT \'库位\',  `created_time` datetime NULL COMMENT \'建立时间\',  `creater` VARCHAR(64) NULL COMMENT \'创建人\',  `picker` VARCHAR(64) NULL COMMENT \'领料人\',  `auditor` VARCHAR(64) NULL COMMENT \'审核人\',  PRIMARY KEY USING BTREE (`id`) ) ENGINE = InnoDB CHARACTER SET = utf8 COMMENT \'晶棒信息\';\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'mes_crystal_info\' already exists\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'mes_crystal_info\' already exists', '2021-12-24 06:00:05');
INSERT INTO `sys_oper_log` VALUES (155, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT AUTO_INCREMENT COMMENT \'主键id\',\\n  `layer_number` int(11) NULL COMMENT \'层数\',\\n  `code` varchar(64) NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64)  NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) NULL COMMENT \'类型\',\\n  `spec` varchar(64) NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) NULL COMMENT \'是否拼棒\',\\n\\t`slicer_model` VARCHAR(64) NULL COMMENT \'切片机型\',\\n\\t`working_time` datetime NULL COMMENT \'进线时间\',\\n\\t`transmitting_state` VARCHAR(64) NULL COMMENT \'流转状态\',\\n\\t`storage_state` int(11) NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8 COMMENT = \'晶棒信息\';\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 06:00:24');
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 06:03:12');
INSERT INTO `sys_oper_log` VALUES (157, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT AUTO_INCREMENT COMMENT \'主键id\',\\n  `code` varchar(64) NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64)  NULL COMMENT \'型号\',\\n\\t`length` VARCHAR(64) NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) NULL COMMENT \'类型\',\\n  `spec` varchar(64) NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) NULL COMMENT \'是否拼棒\',\\n\\t`connectible_count` int(11) NULL COMMENT \'拼棒数\',\\n\\t`connection` varchar(64) NULL COMMENT \'拼棒类型\',\\n\\t`slicer_model` VARCHAR(64) NULL COMMENT \'切片机型\',\\n\\t`working_time` datetime NULL COMMENT \'进线时间\',\\n\\t`transmitting_state` VARCHAR(64) NULL COMMENT \'流转状态\',\\n\\t`storage_state` int(11) NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8 COMMENT = \'晶棒信息\';\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 06:06:27');
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 06:07:26');
INSERT INTO `sys_oper_log` VALUES (159, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `mes_crystal_info`  (\\n  `id` bigint(20) NOT NULL AUTO_INCREMENT AUTO_INCREMENT COMMENT \'主键id\',\\n  `code` varchar(64) NULL COMMENT \'晶棒编号\',\\n  `model` varchar(64)  NULL COMMENT \'型号\',\\n\\t`length` int(11) NULL COMMENT \'长度\',\\n\\t`type` VARCHAR(64) NULL COMMENT \'类型\',\\n  `spec` varchar(64) NULL COMMENT \'规格\',\\n\\t`thinck_splice` VARCHAR(64) NULL COMMENT \'片厚\',\\n\\t`is_connectible` VARCHAR(64) NULL COMMENT \'是否拼棒\',\\n\\t`connectible_count` int(11) NULL COMMENT \'拼棒数\',\\n\\t`connection` varchar(64) NULL COMMENT \'拼棒类型\',\\n\\t`slicer_model` VARCHAR(64) NULL COMMENT \'切片机型\',\\n\\t`working_time` datetime NULL COMMENT \'进线时间\',\\n\\t`transmitting_state` VARCHAR(64) NULL COMMENT \'流转状态\',\\n\\t`storage_state` int(11) NULL COMMENT \'库存状态\',\\n\\t`storage_location` VARCHAR(64) NULL COMMENT \'库位\',\\n\\t`created_time` datetime NULL COMMENT \'建立时间\',\\n\\t`creater` VARCHAR(64) NULL COMMENT \'创建人\',\\n\\t`picker` VARCHAR(64) NULL COMMENT \'领料人\',\\n\\t`auditor` VARCHAR(64) NULL COMMENT \'审核人\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8 COMMENT = \'晶棒信息\';\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 06:08:03');
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"mes_crystal_info\"],\"tableComment\":[\"晶棒信息\"],\"className\":[\"MesCrystalInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"205\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"206\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"207\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"型号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"208\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"长度\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"length\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"209\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"类型\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"210\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"规格\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"spec\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"211\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"片厚\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"thinckSplice\"],\"columns[6].isQuery\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"input\"],\"columns[6].di', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 06:11:14');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"mes_crystal_info\"],\"tableComment\":[\"晶棒信息\"],\"className\":[\"MesCrystalInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"205\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"206\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"207\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"型号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"208\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"长度\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"length\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"209\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"类型\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"210\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"规格\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"spec\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"211\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"片厚\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"thinckSplice\"],\"columns[6].isQuery\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"input\"],\"columns[6].di', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 06:16:14');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/mes_crystal_info', '127.0.0.1', '内网IP', '\"mes_crystal_info\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 06:16:43');
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_crystal_info\"]}', NULL, 0, NULL, '2021-12-24 06:17:16');
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/mes_crystal_info', '127.0.0.1', '内网IP', '\"mes_crystal_info\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 08:07:47');
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-24 08:08:49');
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_crystal_info\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:38:48');
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"mes_crystal_info\"],\"tableComment\":[\"晶棒信息\"],\"className\":[\"MesCrystalInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"151\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"152\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"153\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"型号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"154\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"长度\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"length\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"155\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"类型\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"156\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"规格\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"spec\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"157\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"片厚\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"thicknessSplice\"],\"columns[6].isQuery\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"input\"],\"columns[6].', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:41:22');
INSERT INTO `sys_oper_log` VALUES (168, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"固化状态\"],\"dictType\":[\"mes_curing_time\"],\"status\":[\"0\"],\"remark\":[\"记录库位中晶棒的粘胶固化状态\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:45:35');
INSERT INTO `sys_oper_log` VALUES (169, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/dict/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:46:18');
INSERT INTO `sys_oper_log` VALUES (170, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"connection_type\"],\"dictType\":[\"晶棒拼棒类型\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒的拼棒类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:47:51');
INSERT INTO `sys_oper_log` VALUES (171, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"mes_spec\"],\"dictType\":[\"晶棒规格信息\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:49:05');
INSERT INTO `sys_oper_log` VALUES (172, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"118\"],\"dictName\":[\"mes_spec\"],\"dictType\":[\"晶棒规格信息\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒的规格信息\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:49:22');
INSERT INTO `sys_oper_log` VALUES (173, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"117\"],\"dictName\":[\"晶棒拼棒类型\"],\"dictType\":[\"connection_type\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒的拼棒类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:49:42');
INSERT INTO `sys_oper_log` VALUES (174, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"117\"],\"dictName\":[\"晶棒拼棒类型\"],\"dictType\":[\"mes_connection_type\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒的拼棒类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:49:55');
INSERT INTO `sys_oper_log` VALUES (175, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"118\"],\"dictName\":[\"晶棒规格\"],\"dictType\":[\"mes_spec\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒的规格信息\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:50:06');
INSERT INTO `sys_oper_log` VALUES (176, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"117\"],\"dictName\":[\"拼棒类型\"],\"dictType\":[\"mes_connection_type\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒的拼棒类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:50:26');
INSERT INTO `sys_oper_log` VALUES (177, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"晶棒尺寸\"],\"dictType\":[\"mes_size\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒的尺寸信息\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:51:44');
INSERT INTO `sys_oper_log` VALUES (178, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"晶棒片厚\"],\"dictType\":[\"mes_thickness_splice\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒片厚信息\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:52:55');
INSERT INTO `sys_oper_log` VALUES (179, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"切片机型\"],\"dictType\":[\"mes_slicer_model\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒切片机型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:53:55');
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"mes_crystal_info\"],\"tableComment\":[\"晶棒信息\"],\"className\":[\"MesCrystalInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"151\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"152\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"153\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"型号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"154\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"长度\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"length\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"155\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"类型\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"mes_spec\"],\"columns[5].columnId\":[\"156\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"规格\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"spec\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"157\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"片厚\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"thicknessSplice\"],\"columns[6].isQuery\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"input\"],\"col', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 01:57:29');
INSERT INTO `sys_oper_log` VALUES (181, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"晶棒类型\"],\"dictType\":[\"mes_type\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:00:18');
INSERT INTO `sys_oper_log` VALUES (182, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"拼棒是否\"],\"dictType\":[\"mes_is_connectible\"],\"status\":[\"0\"],\"remark\":[\"记录晶棒是否拼棒\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:02:20');
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"mes_crystal_info\"],\"tableComment\":[\"晶棒信息\"],\"className\":[\"MesCrystalInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"151\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"152\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"153\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"型号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"154\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"长度\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"length\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"155\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"类型\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"mes_type\"],\"columns[5].columnId\":[\"156\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"规格\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"spec\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"mes_spec\"],\"columns[6].columnId\":[\"157\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"片厚\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"thicknessSplice\"],\"columns[6].isQuery\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"sel', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:02:47');
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/mes_crystal_info', '127.0.0.1', '内网IP', '\"mes_crystal_info\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:04:00');
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"mes_crystal_info\"],\"tableComment\":[\"晶棒信息\"],\"className\":[\"MesCrystalInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"151\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"152\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"153\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"型号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"154\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"长度\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"length\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"155\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"类型\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"mes_type\"],\"columns[5].columnId\":[\"156\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"规格\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"spec\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"mes_spec\"],\"columns[6].columnId\":[\"157\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"片厚\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"thicknessSplice\"],\"columns[6].isQuery\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"sel', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:05:52');
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"mes_crystal_info\"],\"tableComment\":[\"晶棒信息\"],\"className\":[\"MesCrystalInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"151\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"152\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"153\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"型号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"154\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"长度\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"length\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"155\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"类型\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"mes_type\"],\"columns[5].columnId\":[\"156\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"规格\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"spec\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"mes_spec\"],\"columns[6].columnId\":[\"157\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"片厚\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"thicknessSplice\"],\"columns[6].isQuery\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"sel', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:18:37');
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"mes_crystal_info\"],\"tableComment\":[\"晶棒信息\"],\"className\":[\"MesCrystalInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"151\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"152\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"153\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"型号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"154\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"长度\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"length\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"155\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"类型\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"mes_type\"],\"columns[5].columnId\":[\"156\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"规格\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"spec\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"mes_spec\"],\"columns[6].columnId\":[\"157\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"片厚\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"thicknessSplice\"],\"columns[6].isQuery\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"sel', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:18:54');
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/mes_crystal_info', '127.0.0.1', '内网IP', '\"mes_crystal_info\"', NULL, 0, NULL, '2021-12-25 02:19:03');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2003\"],\"menuType\":[\"C\"],\"menuName\":[\"晶棒信息\"],\"url\":[\"/mes/mes_crystal_info\"],\"target\":[\"menuItem\"],\"perms\":[\"mes:mes_crystal_info:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:42:39');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:43:15');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2020', '127.0.0.1', '内网IP', '2020', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:43:33');
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 02:43:41');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2017\"],\"menuType\":[\"F\"],\"menuName\":[\"晶棒信息新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"mes:info:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 04:43:15');
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"晶棒信息\"],\"url\":[\"/mes/info\"],\"target\":[\"menuItem\"],\"perms\":[\"mes:info:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 04:47:43');
INSERT INTO `sys_oper_log` VALUES (195, '晶棒信息', 5, 'com.ruoyi.mes.controller.MesCrystalInfoController.export()', 'POST', 1, 'admin', '研发部门', '/mes/info/export', '127.0.0.1', '内网IP', '{\"code\":[\"\"],\"model\":[\"\"],\"length\":[\"\"],\"type\":[\"\"],\"spec\":[\"\"],\"thicknessSplice\":[\"\"],\"isConnectible\":[\"\"],\"connectibleCount\":[\"\"],\"connectionType\":[\"\"],\"slicerModel\":[\"\"],\"workingTime\":[\"\"],\"transmittingState\":[\"\"],\"storageState\":[\"\"],\"storageLocation\":[\"\"],\"createdTime\":[\"\"],\"creater\":[\"\"],\"picker\":[\"\"],\"auditor\":[\"\"],\"housingId\":[\"\"],\"housingTime\":[\"\"],\"curingState\":[\"\"],\"curingTime\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"8ea29d67-bc08-4a4f-9edc-7b260e9082d5_晶棒信息数据.xlsx\",\"code\":0}', 0, NULL, '2021-12-25 04:49:24');
INSERT INTO `sys_oper_log` VALUES (196, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"胶水批次\"],\"dictType\":[\"mes_glue_batch\"],\"status\":[\"0\"],\"remark\":[\"记录胶水批次信息\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-25 15:11:59');
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"配棒库\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-object-group\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 09:32:30');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_storage_manage\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 11:17:50');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 11:17:57');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_storage_manage\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 11:18:06');
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"mes_storage_manage\"],\"tableComment\":[\"库位管理\"],\"className\":[\"MesStorageManage\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"182\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"183\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"库位\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"184\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"状态\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"state\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"185\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"建立时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createdTime\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"186\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建人\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"creater\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"187\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修改时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"revisedTime\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"188\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"修改人\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"reviser\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"input\"],\"columns[6].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.mes\"],\"moduleName\":[\"mes\"],', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 11:21:18');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/mes_storage_manage', '127.0.0.1', '内网IP', '\"mes_storage_manage\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 11:21:24');
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_storage_manage\"]}', NULL, 0, NULL, '2021-12-27 11:21:33');
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"档案维护\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-folder\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 12:58:58');
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2022\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"档案维护\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-folder\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 12:59:19');
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_glue_batch\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 12:59:32');
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"mes_glue_batch\"],\"tableComment\":[\"胶水批次\"],\"className\":[\"MesGlueBatch\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"189\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"190\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"胶水批次\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mesGlueBatch\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"191\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建人\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"creater\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"192\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"creatingTime\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.mes\"],\"moduleName\":[\"mes\"],\"businessName\":[\"batch\"],\"functionName\":[\"胶水批次\"],\"params[parentMenuId]\":[\"2022\"],\"params[parentMenuName]\":[\"档案维护\"],\"genType\":[\"1\"],\"genPath\":[\"/mes/glue_batch\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 13:01:03');
INSERT INTO `sys_oper_log` VALUES (208, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/mes_glue_batch', '127.0.0.1', '内网IP', '\"mes_glue_batch\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 13:01:09');
INSERT INTO `sys_oper_log` VALUES (209, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_glue_batch\"]}', NULL, 0, NULL, '2021-12-27 13:01:15');
INSERT INTO `sys_oper_log` VALUES (210, '胶水批次', 1, 'com.ruoyi.mes.controller.MesGlueBatchController.addSave()', 'POST', 1, 'admin', '研发部门', '/mes/batch/add', '127.0.0.1', '内网IP', '{\"mesGlueBatch\":[\"20211227A01\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 13:05:18');
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_board_batch\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 13:15:02');
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"mes_board_batch\"],\"tableComment\":[\"板材批次\"],\"className\":[\"MesBoardBatch\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"193\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"194\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"板材批次\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mesBoardBatch\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"195\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建人\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"creater\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"196\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"creatingTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"197\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"修改人\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"modifier\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"198\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修改时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"modified\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.mes\"],\"moduleName\":[\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 13:19:23');
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/mes_board_batch', '127.0.0.1', '内网IP', '\"mes_board_batch\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 13:19:29');
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_board_batch\"]}', NULL, 0, NULL, '2021-12-27 13:19:34');
INSERT INTO `sys_oper_log` VALUES (215, '胶水批次', 3, 'com.ruoyi.mes.controller.MesGlueBatchController.remove()', 'POST', 1, 'admin', '研发部门', '/mes/batch/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 13:26:12');
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"mes_glue_batch\"],\"tableComment\":[\"胶水批次\"],\"className\":[\"MesGlueBatch\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"189\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"190\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"胶水批次\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mesGlueBatch\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"191\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建人\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"creater\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"192\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"creatingTime\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.mes\"],\"moduleName\":[\"mes\"],\"businessName\":[\"glue_batch\"],\"functionName\":[\"胶水批次\"],\"params[parentMenuId]\":[\"2022\"],\"params[parentMenuName]\":[\"档案维护\"],\"genType\":[\"1\"],\"genPath\":[\"/mes/glue_batch\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 14:05:56');
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_board_batch\"]}', NULL, 0, NULL, '2021-12-27 14:06:10');
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"mes_glue_batch\"],\"tableComment\":[\"胶水批次\"],\"className\":[\"MesGlueBatch\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"189\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"190\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"胶水批次\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mesGlueBatch\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"191\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建人\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"creater\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"192\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"creatingTime\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.mes\"],\"moduleName\":[\"mes\"],\"businessName\":[\"glue_batch\"],\"functionName\":[\"胶水批次\"],\"params[parentMenuId]\":[\"2022\"],\"params[parentMenuName]\":[\"档案维护\"],\"genType\":[\"1\"],\"genPath\":[\"/mes/glue_batch\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 14:08:28');
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_glue_batch,mes_board_batch\"]}', NULL, 0, NULL, '2021-12-27 14:08:35');
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"mes_board_batch\"],\"tableComment\":[\"板材批次\"],\"className\":[\"MesBoardBatch\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"193\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"194\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"板材批次\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mesBoardBatch\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"195\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建人\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"creater\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"196\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"creatingTime\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"197\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"修改人\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"modifier\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"198\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修改时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"modified\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.mes\"],\"moduleName\":[\"mes\"],\"businessName\":[\"board_batch\"],\"functionName\":[\"板材批次\"],\"params[parentMenuId]\":[\"2022\"],\"params[parentMenuN', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 14:39:47');
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"mes_board_batch\"],\"tableComment\":[\"板材批次\"],\"className\":[\"MesBoardBatch\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"193\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"194\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"板材批次\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mesBoardBatch\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"195\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建人\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"creater\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"196\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"creatingTime\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"197\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"修改人\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"modifier\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"198\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修改时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"modified\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.mes\"],\"moduleName\":[\"mes\"],\"businessName\":[\"board_batch\"],\"functionName\":[\"板材批次\"],\"params[parentMenuId]\":[\"2022\"],\"params[parentMenuN', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 14:39:55');
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_board_batch\"]}', NULL, 0, NULL, '2021-12-27 14:40:04');
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"mes_crystal_info\"],\"tableComment\":[\"晶棒信息\"],\"className\":[\"MesCrystalInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"151\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"152\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"code\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"153\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"型号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"154\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"长度\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"length\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"155\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"类型\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"mes_type\"],\"columns[5].columnId\":[\"156\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"规格\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"spec\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"mes_spec\"],\"columns[6].columnId\":[\"157\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"片厚\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"thicknessSplice\"],\"columns[6].isQuery\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"sel', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-27 15:15:42');
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_crystal_info\"]}', NULL, 0, NULL, '2021-12-27 15:15:48');
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_warehousing_info\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:06:00');
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"mes_warehousing_info\"],\"tableComment\":[\"入库信息\"],\"className\":[\"MesWarehousingInfo\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"199\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"200\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"201\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"规格\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"spec\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"mes_spec\"],\"columns[3].columnId\":[\"202\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"尺寸\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"mes_size\"],\"columns[4].columnId\":[\"203\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"长度\"],\"columns[4].javaType\":[\"BigDecimal\"],\"columns[4].javaField\":[\"length\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"204\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"片厚\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"thicknessSplice\"],\"columns[5].isI', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:08:38');
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_storage_info\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:08:54');
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"10\"],\"tableName\":[\"mes_storage_info\"],\"tableComment\":[\"库存信息\"],\"className\":[\"MesStorageInfo\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"208\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"209\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"库位\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"storageLocation\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"210\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒编号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalCode\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"211\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"规格\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"spec\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"212\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"尺寸\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"type\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"213\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"长度\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"length\"],\"columns[5].isInsert\":[\"1\"],\"columns[5', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:11:54');
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_storage_info\"]}', NULL, 0, NULL, '2022-01-03 09:12:03');
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_warehousing_info\"]}', NULL, 0, NULL, '2022-01-03 09:12:13');
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2005', '127.0.0.1', '内网IP', '2005', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:16:25');
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:16:32');
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:16:39');
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2008', '127.0.0.1', '内网IP', '2008', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:16:46');
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_ex-warehousing_info\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:20:27');
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"11\"],\"tableName\":[\"mes_ex-warehousing_info\"],\"tableComment\":[\"出库信息\"],\"className\":[\"MesEx-warehousingInfo\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"233\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"234\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"235\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"规格\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"spec\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"mes_spec\"],\"columns[3].columnId\":[\"236\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"尺寸\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"mes_size\"],\"columns[4].columnId\":[\"237\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"长度\"],\"columns[4].javaType\":[\"BigDecimal\"],\"columns[4].javaField\":[\"length\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"238\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"片厚\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"thicknessSplice\"],\"columns', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:23:20');
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/mes_ex-warehousing_info', '127.0.0.1', '内网IP', '\"mes_ex-warehousing_info\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:23:29');
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_ex-warehousing_info\"]}', NULL, 0, NULL, '2022-01-03 09:23:44');
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/mes_ex-warehousing_info', '127.0.0.1', '内网IP', '\"mes_ex-warehousing_info\"', NULL, 1, '同步数据失败，原表结构不存在', '2022-01-03 09:34:35');
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"11\"],\"tableName\":[\"mes_exwarehousing_info\"],\"tableComment\":[\"出库信息\"],\"className\":[\"MesEx-warehousingInfo\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"233\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"234\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"235\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"规格\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"spec\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"mes_spec\"],\"columns[3].columnId\":[\"236\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"尺寸\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"mes_size\"],\"columns[4].columnId\":[\"237\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"长度\"],\"columns[4].javaType\":[\"BigDecimal\"],\"columns[4].javaField\":[\"length\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"238\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"片厚\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"thicknessSplice\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:34:49');
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/mes_exwarehousing_info', '127.0.0.1', '内网IP', '\"mes_exwarehousing_info\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:34:56');
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"11\"],\"tableName\":[\"mes_exwarehousing_info\"],\"tableComment\":[\"出库信息\"],\"className\":[\"MesExwarehousingInfo\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"233\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"234\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"晶棒编号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"crystalCode\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"235\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"规格\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"spec\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"mes_spec\"],\"columns[3].columnId\":[\"236\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"尺寸\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"mes_size\"],\"columns[4].columnId\":[\"237\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"长度\"],\"columns[4].javaType\":[\"BigDecimal\"],\"columns[4].javaField\":[\"length\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"238\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"片厚\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"thicknessSplice\"],\"columns[5', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:35:25');
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_exwarehousing_info\"]}', NULL, 0, NULL, '2022-01-03 09:35:31');
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/mes_exwarehousing_info', '127.0.0.1', '内网IP', '\"mes_exwarehousing_info\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:43:20');
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_exwarehousing_info\"]}', NULL, 0, NULL, '2022-01-03 09:43:27');
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2041\"],\"parentId\":[\"2003\"],\"menuType\":[\"C\"],\"menuName\":[\"库存信息\"],\"url\":[\"/mes/mes_storage_info\"],\"target\":[\"menuItem\"],\"perms\":[\"mes:mes_storage_info:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:47:29');
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2059\"],\"parentId\":[\"2003\"],\"menuType\":[\"C\"],\"menuName\":[\"出库信息\"],\"url\":[\"/mes/mes_exwarehousing_info\"],\"target\":[\"menuItem\"],\"perms\":[\"mes:mes_exwarehousing_info:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:47:53');
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2035\"],\"parentId\":[\"2003\"],\"menuType\":[\"C\"],\"menuName\":[\"入库信息\"],\"url\":[\"/mes/mes_warehousing_info\"],\"target\":[\"menuItem\"],\"perms\":[\"mes:mes_warehousing_info:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:48:08');
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_crystal_check\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:50:59');
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"12\"],\"tableName\":[\"mes_crystal_check\"],\"tableComment\":[\"库存盘点\"],\"className\":[\"MesCrystalCheck\"],\"functionAuthor\":[\"owen\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"257\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"258\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"库位号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"storageLocation\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"259\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"晶棒编号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"crystalCode\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"260\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"采集晶棒编号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"code1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"261\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"采集型号\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"model1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"262\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"采集长度\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"length1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"263\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"采集类型\"],\"columns[6].javaType\":[\"String\"],\"columns[6].javaField\":[\"type1\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:52:40');
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mes_crystal_check\"]}', NULL, 0, NULL, '2022-01-03 09:52:44');
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2065\"],\"parentId\":[\"2003\"],\"menuType\":[\"C\"],\"menuName\":[\"库存盘点\"],\"url\":[\"/mes/mes_crystal_check\"],\"target\":[\"menuItem\"],\"perms\":[\"mes:mes_crystal_check:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-03 09:53:57');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-12-20 01:17:03', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-12-20 01:17:03', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-12-20 01:17:04', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-12-20 01:17:04', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-12-20 01:17:04', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2021-12-20 01:17:04', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-01-03 09:54:46', '2021-12-20 01:17:03', 'admin', '2021-12-20 01:17:03', '', '2022-01-03 09:54:45', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '普通用户', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2021-12-20 01:17:03', '2021-12-20 01:17:03', 'admin', '2021-12-20 01:17:03', 'admin', '2021-12-20 01:54:08', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线用户记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('b641d868-652e-4e96-aac3-f41bb87dcf9d', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2022-01-03 08:56:34', '2022-01-03 10:22:05', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
