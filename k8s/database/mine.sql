-- MySQL dump 10.13  Distrib 8.0.31, for Linux (aarch64)
--
-- Host: localhost    Database: mine
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2021_04_12_160526_create_system_user_table',1),(2,'2021_04_18_215320_create_system_menu_table',1),(3,'2021_04_18_215515_create_system_role_table',1),(4,'2021_04_18_215521_create_system_user_role_table',1),(5,'2021_04_18_222634_create_system_role_menu_table',1),(6,'2021_04_18_224723_create_system_dict_data_table',1),(7,'2021_04_18_224727_create_system_dict_type_table',1),(8,'2021_04_18_224817_create_system_dept_table',1),(9,'2021_04_18_224835_create_system_post_table',1),(10,'2021_04_18_224912_create_system_login_log_table',1),(11,'2021_04_18_224938_create_system_oper_log_table',1),(12,'2021_04_26_141249_create_system_user_post_table',1),(13,'2021_05_07_215228_create_system_role_dept_table',1),(14,'2021_06_24_111216_create_system_uploadfile_table',1),(15,'2021_11_11_140915_create_system_app_table',1),(16,'2021_11_11_140935_create_system_app_group_table',1),(17,'2021_11_11_141720_create_system_api_table',1),(18,'2021_11_11_141724_create_system_api_group_table',1),(19,'2021_11_11_141849_create_system_api_column_table',1),(20,'2021_11_11_151525_create_system_app_api_table',1),(21,'2021_11_26_163202_create_system_api_log_table',1),(22,'2021_11_26_163818_create_system_notice_table',1),(23,'2021_11_26_164006_create_system_queue_message_table',1),(24,'2021_12_25_163880_create_system_queue_log_table',1),(25,'2021_12_25_163890_create_system_queue_message_receive_table',1),(26,'2021_04_18_224626_create_setting_config_table',2),(27,'2021_04_18_225055_create_setting_crontab_table',2),(28,'2021_04_18_225100_create_setting_crontab_log_table',2),(29,'2021_04_18_225100_create_setting_generate_columns_table',2),(30,'2021_04_18_225100_create_setting_generate_tables_table',2),(31,'2022_07_24_225626_create_setting_config_group_table',2),(32,'2024_04_07_014007_create_after_autoform_table_table',2),(33,'2022_12_21_231534_update_version102',3),(34,'2022_10_14_231534_update_version101',4),(35,'2023_3_31_356255_update_version120',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_config`
--

DROP TABLE IF EXISTS `setting_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_config` (
  `group_id` bigint NOT NULL COMMENT '组id',
  `key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置键名',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置值',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置名称',
  `input_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据输入类型',
  `config_select_data` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置选项数据',
  `sort` smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`key`),
  KEY `setting_config_group_id_index` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_config`
--

LOCK TABLES `setting_config` WRITE;
/*!40000 ALTER TABLE `setting_config` DISABLE KEYS */;
INSERT INTO `setting_config` VALUES (1,'site_copyright','Copyright © 2019-2022 MineAdmin. All rights reserved.','版权信息','textarea',NULL,96,NULL),(1,'site_desc','MineAdmin','网站描述','textarea',NULL,97,NULL),(1,'site_keywords','后台管理系统','网站关键字','input',NULL,98,NULL),(1,'site_name','MineAdmin','网站名称','input',NULL,99,NULL),(1,'site_record_number','xxx','网站备案号','input',NULL,95,NULL),(2,'upload_allow_file','txt,doc,docx,xls,xlsx,ppt,pptx,rar,zip,7z,gz,pdf,wps,md','文件类型','input',NULL,0,NULL),(2,'upload_allow_image','jpg,jpeg,png,gif,svg,bmp','图片类型','input',NULL,0,NULL),(2,'upload_mode','1','上传模式','select','\"[{\\\"label\\\":\\\"\\u672c\\u5730\\u4e0a\\u4f20\\\",\\\"value\\\":\\\"1\\\"},{\\\"label\\\":\\\"\\u963f\\u91cc\\u4e91OSS\\\",\\\"value\\\":\\\"2\\\"},{\\\"label\\\":\\\"\\u4e03\\u725b\\u4e91\\\",\\\"value\\\":\\\"3\\\"},{\\\"label\\\":\\\"\\u817e\\u8baf\\u4e91COS\\\",\\\"value\\\":\\\"4\\\"}]\"',99,NULL);
/*!40000 ALTER TABLE `setting_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_config_group`
--

DROP TABLE IF EXISTS `setting_config_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_config_group` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置组名称',
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置组标识',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_config_group`
--

LOCK TABLES `setting_config_group` WRITE;
/*!40000 ALTER TABLE `setting_config_group` DISABLE KEYS */;
INSERT INTO `setting_config_group` VALUES (1,'站点配置','site_config',1,1,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL),(2,'上传配置','upload_config',1,1,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL);
/*!40000 ALTER TABLE `setting_config_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_crontab`
--

DROP TABLE IF EXISTS `setting_crontab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_crontab` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `type` smallint DEFAULT '4' COMMENT '任务类型 (1 command, 2 class, 3 url, 4 eval)',
  `target` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调用任务字符串',
  `parameter` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调用任务参数',
  `rule` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务执行表达式',
  `singleton` smallint DEFAULT '1' COMMENT '是否单次执行 (1 是 2 不是)',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_crontab`
--

LOCK TABLES `setting_crontab` WRITE;
/*!40000 ALTER TABLE `setting_crontab` DISABLE KEYS */;
INSERT INTO `setting_crontab` VALUES (1,'urlCrontab',3,'http://127.0.0.1:9501/','','59 */1 * * * *',2,2,0,0,'2021-08-07 15:28:28','2021-08-07 15:44:55','请求127.0.0.1'),(2,'每月1号清理所有日志',2,'App\\System\\Crontab\\ClearLogCrontab','','0 0 0 1 * *',2,2,0,0,'2022-04-11 03:15:48','2022-04-11 03:15:48','');
/*!40000 ALTER TABLE `setting_crontab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_crontab_log`
--

DROP TABLE IF EXISTS `setting_crontab_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_crontab_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crontab_id` bigint unsigned NOT NULL COMMENT '任务ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务名称',
  `target` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务调用目标字符串',
  `parameter` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务调用参数',
  `exception_info` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '异常信息',
  `status` smallint DEFAULT '1' COMMENT '执行状态 (1成功 2失败)',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务执行日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_crontab_log`
--

LOCK TABLES `setting_crontab_log` WRITE;
/*!40000 ALTER TABLE `setting_crontab_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_crontab_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_datasource`
--

DROP TABLE IF EXISTS `setting_datasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_datasource` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据源名称',
  `dsn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '连接dsn字符串',
  `username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据库名称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据库用户',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_datasource`
--

LOCK TABLES `setting_datasource` WRITE;
/*!40000 ALTER TABLE `setting_datasource` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_datasource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_generate_columns`
--

DROP TABLE IF EXISTS `setting_generate_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_generate_columns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_id` bigint unsigned NOT NULL COMMENT '所属表ID',
  `column_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段名称',
  `column_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段注释',
  `column_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段类型',
  `is_pk` smallint DEFAULT '1' COMMENT '1 非主键 2 主键',
  `is_required` smallint DEFAULT '1' COMMENT '1 非必填 2 必填',
  `is_insert` smallint DEFAULT '1' COMMENT '1 非插入字段 2 插入字段',
  `is_edit` smallint DEFAULT '1' COMMENT '1 非编辑字段 2 编辑字段',
  `is_list` smallint DEFAULT '1' COMMENT '1 非列表显示字段 2 列表显示字段',
  `is_query` smallint DEFAULT '1' COMMENT '1 非查询字段 2 查询字段',
  `is_sort` smallint DEFAULT '1' COMMENT '1 不排序 2 排序字段',
  `query_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'eq' COMMENT '查询方式 eq 等于, neq 不等于, gt 大于, lt 小于, like 范围',
  `view_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text' COMMENT '页面控件，text, textarea, password, select, checkbox, radio, date, upload, ma-upload（封装的上传控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典类型',
  `allow_roles` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '允许查看该字段的角色',
  `options` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段其他设置',
  `extra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段扩展信息',
  `sort` tinyint unsigned DEFAULT '0' COMMENT '排序',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务字段信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_generate_columns`
--

LOCK TABLES `setting_generate_columns` WRITE;
/*!40000 ALTER TABLE `setting_generate_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_generate_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_generate_tables`
--

DROP TABLE IF EXISTS `setting_generate_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_generate_tables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表注释',
  `module_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属模块',
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '命名空间',
  `menu_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成菜单名',
  `belong_menu_id` bigint DEFAULT NULL COMMENT '所属菜单',
  `package_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '控制器包名',
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成类型，single 单表CRUD，tree 树表CRUD，parent_sub父子表CRUD',
  `generate_type` smallint DEFAULT '1' COMMENT '1 压缩包下载 2 生成到模块',
  `generate_menus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成菜单列表',
  `build_menu` smallint DEFAULT '1' COMMENT '是否构建菜单',
  `component_type` smallint DEFAULT '1' COMMENT '组件显示方式',
  `options` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他业务选项',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_generate_tables`
--

LOCK TABLES `setting_generate_tables` WRITE;
/*!40000 ALTER TABLE `setting_generate_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_generate_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_api`
--

DROP TABLE IF EXISTS `system_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_api` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint unsigned NOT NULL COMMENT '接口组ID',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名称',
  `access_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口访问名称',
  `class_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类命名空间',
  `method_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '方法名',
  `auth_mode` smallint NOT NULL DEFAULT '1' COMMENT '认证模式 (1简易 2复杂)',
  `request_mode` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A' COMMENT '请求模式 (A 所有 P POST G GET)',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '接口说明介绍',
  `response` text COLLATE utf8mb4_unicode_ci COMMENT '返回内容示例',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_api_group_id_index` (`group_id`),
  KEY `system_api_access_name_index` (`access_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='接口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_api`
--

LOCK TABLES `system_api` WRITE;
/*!40000 ALTER TABLE `system_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_api_column`
--

DROP TABLE IF EXISTS `system_api_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_api_column` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `api_id` bigint unsigned NOT NULL COMMENT '接口主键',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名称',
  `type` smallint NOT NULL DEFAULT '1' COMMENT '字段类型 1 请求 2 返回',
  `data_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据类型',
  `is_required` smallint NOT NULL DEFAULT '1' COMMENT '是否必填 1 非必填 2 必填',
  `default_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '默认值',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段说明',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_api_column_api_id_type_status_index` (`api_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='接口字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_api_column`
--

LOCK TABLES `system_api_column` WRITE;
/*!40000 ALTER TABLE `system_api_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_api_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_api_group`
--

DROP TABLE IF EXISTS `system_api_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_api_group` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口组名称',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='接口分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_api_group`
--

LOCK TABLES `system_api_group` WRITE;
/*!40000 ALTER TABLE `system_api_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_api_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_api_log`
--

DROP TABLE IF EXISTS `system_api_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_api_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `api_id` bigint unsigned NOT NULL COMMENT 'api ID',
  `api_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名称',
  `access_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口访问名称',
  `request_data` text COLLATE utf8mb4_unicode_ci COMMENT '请求数据',
  `response_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '响应状态码',
  `response_data` text COLLATE utf8mb4_unicode_ci COMMENT '响应数据',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '访问IP地址',
  `ip_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP所属地',
  `access_time` timestamp NULL DEFAULT NULL COMMENT '访问时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_api_log_api_id_index` (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='接口日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_api_log`
--

LOCK TABLES `system_api_log` WRITE;
/*!40000 ALTER TABLE `system_api_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_api_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_app`
--

DROP TABLE IF EXISTS `system_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_app` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint unsigned NOT NULL COMMENT '应用组ID',
  `app_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名称',
  `app_id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用ID',
  `app_secret` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用密钥',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '应用介绍',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_app_group_id_app_id_app_secret_index` (`group_id`,`app_id`,`app_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_app`
--

LOCK TABLES `system_app` WRITE;
/*!40000 ALTER TABLE `system_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_app_api`
--

DROP TABLE IF EXISTS `system_app_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_app_api` (
  `app_id` bigint unsigned NOT NULL COMMENT '应用ID',
  `api_id` bigint unsigned NOT NULL COMMENT 'API—ID',
  PRIMARY KEY (`app_id`,`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='应用和api关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_app_api`
--

LOCK TABLES `system_app_api` WRITE;
/*!40000 ALTER TABLE `system_app_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_app_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_app_group`
--

DROP TABLE IF EXISTS `system_app_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_app_group` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用组名称',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='应用分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_app_group`
--

LOCK TABLES `system_app_group` WRITE;
/*!40000 ALTER TABLE `system_app_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_app_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dept`
--

DROP TABLE IF EXISTS `system_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dept` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint unsigned NOT NULL COMMENT '父ID',
  `level` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组级集合',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `leader` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `sort` smallint unsigned DEFAULT '0' COMMENT '排序',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_dept_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dept`
--

LOCK TABLES `system_dept` WRITE;
/*!40000 ALTER TABLE `system_dept` DISABLE KEYS */;
INSERT INTO `system_dept` VALUES (1,0,'0','曼艺科技','曼艺','16888888888',1,0,1,NULL,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,NULL);
/*!40000 ALTER TABLE `system_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dept_leader`
--

DROP TABLE IF EXISTS `system_dept_leader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dept_leader` (
  `dept_id` bigint unsigned NOT NULL COMMENT '部门主键',
  `user_id` bigint unsigned NOT NULL COMMENT '用户主键',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `created_at` timestamp NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`dept_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门领导表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dept_leader`
--

LOCK TABLES `system_dept_leader` WRITE;
/*!40000 ALTER TABLE `system_dept_leader` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_dept_leader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dict_data`
--

DROP TABLE IF EXISTS `system_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` bigint unsigned NOT NULL COMMENT '字典类型ID',
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典标签',
  `value` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典值',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典标示',
  `sort` smallint unsigned DEFAULT '0' COMMENT '排序',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_dict_data_type_id_index` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dict_data`
--

LOCK TABLES `system_dict_data` WRITE;
/*!40000 ALTER TABLE `system_dict_data` DISABLE KEYS */;
INSERT INTO `system_dict_data` VALUES (1,1,'InnoDB','InnoDB','table_engine',0,1,0,0,'2021-06-26 16:37:11','2021-06-27 05:33:29',NULL,''),(2,1,'MyISAM','MyISAM','table_engine',0,1,0,0,'2021-06-26 16:37:21','2021-06-27 05:33:29',NULL,''),(3,2,'本地存储','1','upload_mode',99,1,0,0,'2021-06-27 05:33:43','2021-06-27 05:33:43',NULL,''),(4,2,'阿里云OSS','2','upload_mode',98,1,0,0,'2021-06-27 05:33:55','2021-06-27 05:33:55',NULL,''),(5,2,'七牛云','3','upload_mode',97,1,0,0,'2021-06-27 05:34:07','2021-06-27 05:34:07',NULL,''),(6,2,'腾讯云COS','4','upload_mode',96,1,0,0,'2021-06-27 05:34:19','2021-06-27 05:34:19',NULL,''),(7,3,'正常','1','data_status',0,1,0,0,'2021-06-27 05:36:51','2021-06-27 05:37:01',NULL,'0为正常'),(8,3,'停用','2','data_status',0,1,0,0,'2021-06-27 05:37:10','2021-06-27 05:37:10',NULL,'1为停用'),(9,4,'统计页面','statistics','dashboard',0,1,0,0,'2021-08-09 04:53:53','2021-08-09 04:53:53',NULL,'管理员用'),(10,4,'工作台','work','dashboard',0,1,0,0,'2021-08-09 04:54:18','2021-08-09 04:54:18',NULL,'员工使用'),(11,5,'男','1','sex',0,1,0,0,'2021-08-09 04:55:00','2021-08-09 04:55:00',NULL,''),(12,5,'女','2','sex',0,1,0,0,'2021-08-09 04:55:08','2021-08-09 04:55:08',NULL,''),(13,5,'未知','3','sex',0,1,0,0,'2021-08-09 04:55:16','2021-08-09 04:55:16',NULL,''),(14,6,'String','1','api_data_type',7,1,0,0,'2021-11-23 02:49:00','2021-11-23 02:49:00',NULL,''),(15,6,'Integer','2','api_data_type',6,1,0,0,'2021-11-23 02:49:29','2021-11-23 02:49:29',NULL,''),(16,6,'Array','3','api_data_type',5,1,0,0,'2021-11-23 02:49:38','2021-11-23 02:49:38',NULL,''),(17,6,'Float','4','api_data_type',4,1,0,0,'2021-11-23 02:49:46','2021-11-23 02:49:46',NULL,''),(18,6,'Boolean','5','api_data_type',3,1,0,0,'2021-11-23 02:49:54','2021-11-23 02:49:54',NULL,''),(19,6,'Enum','6','api_data_type',2,1,0,0,'2021-11-23 02:50:17','2021-11-23 02:50:17',NULL,''),(20,6,'Object','7','api_data_type',1,1,0,0,'2021-11-23 02:50:26','2021-11-23 02:50:26',NULL,''),(21,6,'File','8','api_data_type',0,1,0,0,'2021-12-25 10:32:48','2021-12-25 10:32:48',NULL,''),(22,7,'通知','1','backend_notice_type',2,1,0,0,'2021-11-11 09:29:27','2021-11-11 09:30:51',NULL,''),(23,7,'公告','2','backend_notice_type',1,1,0,0,'2021-11-11 09:31:42','2021-11-11 09:31:42',NULL,''),(24,8,'所有','A','request_mode',5,1,0,0,'2021-11-14 09:23:25','2021-11-14 09:23:25',NULL,''),(25,8,'GET','G','request_mode',4,1,0,0,'2021-11-14 09:23:45','2021-11-14 09:23:45',NULL,''),(26,8,'POST','P','request_mode',3,1,0,0,'2021-11-14 09:23:38','2021-11-14 09:23:38',NULL,''),(27,8,'PUT','U','request_mode',2,1,0,0,'2021-11-14 09:23:45','2021-11-14 09:23:45',NULL,''),(28,8,'DELETE','D','request_mode',1,1,0,0,'2021-11-14 09:23:45','2021-11-14 09:23:45',NULL,''),(29,9,'未生产','1','queue_produce_status',5,1,0,0,'2021-12-25 10:25:28','2021-12-25 10:25:28',NULL,''),(30,9,'生产中','2','queue_produce_status',4,1,0,0,'2021-12-25 10:25:38','2021-12-25 10:25:38',NULL,''),(31,9,'生产成功','3','queue_produce_status',3,1,0,0,'2021-12-25 10:25:50','2021-12-25 10:25:50',NULL,''),(32,9,'生产失败','4','queue_produce_status',2,1,0,0,'2021-12-25 10:26:14','2021-12-25 10:26:14',NULL,''),(33,9,'生产重复','5','queue_produce_status',1,1,0,0,'2021-12-25 10:26:30','2021-12-25 10:26:30',NULL,''),(34,10,'未消费','1','queue_consume_status',5,1,0,0,'2021-12-25 10:26:57','2021-12-25 10:26:57',NULL,''),(35,10,'消费中','2','queue_consume_status',4,1,0,0,'2021-12-25 10:27:07','2021-12-25 10:27:07',NULL,''),(36,10,'消费成功','3','queue_consume_status',3,1,0,0,'2021-12-25 10:27:16','2021-12-25 10:27:16',NULL,''),(37,10,'消费失败','4','queue_consume_status',2,1,0,0,'2021-12-25 10:27:24','2021-12-25 10:27:24',NULL,''),(38,10,'消费重复','5','queue_consume_status',1,1,0,0,'2021-12-25 10:27:35','2021-12-25 10:27:35',NULL,''),(39,11,'通知','notice','queue_msg_type',1,1,0,0,'2021-12-25 10:30:31','2021-12-25 10:30:31',NULL,''),(40,11,'公告','announcement','queue_msg_type',2,1,0,0,'2021-12-25 10:31:00','2021-12-25 10:31:00',NULL,''),(41,11,'待办','todo','queue_msg_type',3,1,0,0,'2021-12-25 10:31:26','2021-12-25 10:31:26',NULL,''),(42,11,'抄送我的','carbon_copy_mine','queue_msg_type',4,1,0,0,'2021-12-25 10:31:26','2021-12-25 10:31:26',NULL,''),(43,11,'私信','private_message','queue_msg_type',5,1,0,0,'2021-12-25 10:31:26','2021-12-25 10:31:26',NULL,''),(44,12,'图片','image','attachment_type',10,1,0,0,'2022-03-17 06:49:59','2022-03-17 06:49:59',NULL,''),(45,12,'文档','text','attachment_type',9,1,0,0,'2022-03-17 06:50:20','2022-03-17 06:50:49',NULL,''),(46,12,'音频','audio','attachment_type',8,1,0,0,'2022-03-17 06:50:37','2022-03-17 06:50:52',NULL,''),(47,12,'视频','video','attachment_type',7,1,0,0,'2022-03-17 06:50:45','2022-03-17 06:50:57',NULL,''),(48,12,'应用程序','application','attachment_type',6,1,0,0,'2022-03-17 06:50:52','2022-03-17 06:50:59',NULL,'');
/*!40000 ALTER TABLE `system_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dict_type`
--

DROP TABLE IF EXISTS `system_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典名称',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典标示',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dict_type`
--

LOCK TABLES `system_dict_type` WRITE;
/*!40000 ALTER TABLE `system_dict_type` DISABLE KEYS */;
INSERT INTO `system_dict_type` VALUES (1,'数据表引擎','table_engine',1,0,0,'2021-06-26 16:36:42','2021-06-27 05:33:29',NULL,'数据表引擎字典'),(2,'存储模式','upload_mode',1,0,0,'2021-06-27 05:33:11','2021-06-27 05:33:11',NULL,'上传文件存储模式'),(3,'数据状态','data_status',1,0,0,'2021-06-27 05:36:16','2021-06-27 05:36:34',NULL,'通用数据状态'),(4,'后台首页','dashboard',1,0,0,'2021-08-09 04:53:17','2021-08-09 04:53:17',NULL,''),(5,'性别','sex',1,0,0,'2021-08-09 04:54:40','2021-08-09 04:54:40',NULL,''),(6,'接口数据类型','api_data_type',1,0,0,'2021-11-22 12:56:03','2021-11-22 12:56:03',NULL,''),(7,'后台公告类型','backend_notice_type',1,0,0,'2021-11-11 09:29:05','2021-11-11 09:29:14',NULL,''),(8,'请求方式','request_mode',1,0,0,'2021-11-14 09:22:52','2021-11-14 09:22:52',NULL,''),(9,'队列生产状态','queue_produce_status',1,0,0,'2021-12-25 10:22:38','2021-12-25 10:22:38',NULL,''),(10,'队列消费状态','queue_consume_status',1,0,0,'2021-12-25 10:23:19','2021-12-25 10:23:19',NULL,''),(11,'队列消息类型','queue_msg_type',1,0,0,'2021-12-25 10:28:40','2021-12-25 10:28:40',NULL,''),(12,'附件类型','attachment_type',1,0,0,'2022-03-17 06:49:23','2022-03-17 06:49:23',NULL,'');
/*!40000 ALTER TABLE `system_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_login_log`
--

DROP TABLE IF EXISTS `system_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_login_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP地址',
  `ip_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP所属地',
  `os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '浏览器',
  `status` smallint NOT NULL DEFAULT '1' COMMENT '登录状态 (1成功 2失败)',
  `message` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提示消息',
  `login_time` timestamp NOT NULL COMMENT '登录时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_login_log_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_login_log`
--

LOCK TABLES `system_login_log` WRITE;
/*!40000 ALTER TABLE `system_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_menu`
--

DROP TABLE IF EXISTS `system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint unsigned NOT NULL COMMENT '父ID',
  `level` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组级集合',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单标识代码',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `route` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `redirect` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转地址',
  `is_hidden` smallint NOT NULL DEFAULT '1' COMMENT '是否隐藏 (1是 2否)',
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单类型, (M菜单 B按钮 L链接 I iframe)',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `sort` smallint unsigned DEFAULT '0' COMMENT '排序',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4609 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_menu`
--

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;
INSERT INTO `system_menu` VALUES (1000,0,'0','权限','permission','ma-icon-permission','permission','','',2,'M',1,99,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1100,1000,'0,1000','用户管理','system:user','ma-icon-user','user','system/user/index','',2,'M',1,99,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1101,1100,'0,1000,1100','用户列表','system:user:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1102,1100,'0,1000,1100','用户回收站列表','system:user:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1103,1100,'0,1000,1100','用户保存','system:user:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1104,1100,'0,1000,1100','用户更新','system:user:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1105,1100,'0,1000,1100','用户删除','system:user:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1106,1100,'0,1000,1100','用户读取','system:user:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1107,1100,'0,1000,1100','用户恢复','system:user:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1108,1100,'0,1000,1100','用户真实删除','system:user:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1109,1100,'0,1000,1100','用户导入','system:user:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1110,1100,'0,1000,1100','用户导出','system:user:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1111,1100,'0,1000,1100','用户状态改变','system:user:changeStatus','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1112,1100,'0,1000,1100','用户初始化密码','system:user:initUserPassword','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1113,1100,'0,1000,1100','更新用户缓存','system:user:cache','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1114,1100,'0,1000,1100','设置用户首页','system:user:homePage','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1200,1000,'0,1000','菜单管理','system:menu','icon-menu','menu','system/menu/index','',2,'M',1,96,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1201,1200,'0,1000,1200','菜单列表','system:menu:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1202,1200,'0,1000,1200','菜单回收站','system:menu:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1203,1200,'0,1000,1200','菜单保存','system:menu:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1204,1200,'0,1000,1200','菜单更新','system:menu:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1205,1200,'0,1000,1200','菜单删除','system:menu:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1206,1200,'0,1000,1200','菜单读取','system:menu:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1207,1200,'0,1000,1200','菜单恢复','system:menu:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1208,1200,'0,1000,1200','菜单真实删除','system:menu:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1209,1200,'0,1000,1200','菜单导入','system:menu:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1210,1200,'0,1000,1200','菜单导出','system:menu:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1300,1000,'0,1000','部门管理','system:dept','ma-icon-dept','dept','system/dept/index','',2,'M',1,97,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1301,1300,'0,1000,1300','部门列表','system:dept:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1302,1300,'0,1000,1300','部门回收站','system:dept:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1303,1300,'0,1000,1300','部门保存','system:dept:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1304,1300,'0,1000,1300','部门更新','system:dept:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1305,1300,'0,1000,1300','部门删除','system:dept:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1306,1300,'0,1000,1300','部门读取','system:dept:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1307,1300,'0,1000,1300','部门恢复','system:dept:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1308,1300,'0,1000,1300','部门真实删除','system:dept:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1309,1300,'0,1000,1300','部门导入','system:dept:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1310,1300,'0,1000,1300','部门导出','system:dept:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1311,1300,'0,1000,1300','部门状态改变','system:dept:changeStatus','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1400,1000,'0,1000','角色管理','system:role','ma-icon-role','role','system/role/index','',2,'M',1,98,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1401,1400,'0,1000,1400','角色列表','system:role:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1402,1400,'0,1000,1400','角色回收站','system:role:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1403,1400,'0,1000,1400','角色保存','system:role:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1404,1400,'0,1000,1400','角色更新','system:role:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1405,1400,'0,1000,1400','角色删除','system:role:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1406,1400,'0,1000,1400','角色读取','system:role:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1407,1400,'0,1000,1400','角色恢复','system:role:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1408,1400,'0,1000,1400','角色真实删除','system:role:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1409,1400,'0,1000,1400','角色导入','system:role:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1410,1400,'0,1000,1400','角色导出','system:role:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1411,1400,'0,1000,1400','角色状态改变','system:role:changeStatus','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1412,1400,'0,1000,1400','更新菜单权限','system:role:menuPermission','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1413,1400,'0,1000,1400','更新数据权限','system:role:dataPermission','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1500,1000,'0,1000','岗位管理','system:post','ma-icon-post','post','system/post/index','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1501,1500,'0,1000,1500','岗位列表','system:post:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1502,1500,'0,1000,1500','岗位回收站','system:post:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1503,1500,'0,1000,1500','岗位保存','system:post:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1504,1500,'0,1000,1500','岗位更新','system:post:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1505,1500,'0,1000,1500','岗位删除','system:post:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1506,1500,'0,1000,1500','岗位读取','system:post:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1507,1500,'0,1000,1500','岗位恢复','system:post:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1508,1500,'0,1000,1500','岗位真实删除','system:post:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1509,1500,'0,1000,1500','岗位导入','system:post:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1510,1500,'0,1000,1500','岗位导出','system:post:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(1511,1500,'0,1000,1500','岗位状态改变','system:post:changeStatus','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2000,0,'0','数据','dataCenter','icon-storage','dataCenter','','',2,'M',1,98,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2100,2000,'0,2000','数据字典','system:dict','ma-icon-dict','dict','system/dict/index','',2,'M',1,99,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2101,2100,'0,2000,2100','数据字典列表','system:dict:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2102,2100,'0,2000,2100','数据字典回收站','system:dict:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2103,2100,'0,2000,2100','数据字典保存','system:dict:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2104,2100,'0,2000,2100','数据字典更新','system:dict:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2105,2100,'0,2000,2100','数据字典删除','system:dict:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2106,2100,'0,2000,2100','数据字典读取','system:dict:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2107,2100,'0,2000,2100','数据字典恢复','system:dict:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2108,2100,'0,2000,2100','数据字典真实删除','system:dict:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2109,2100,'0,2000,2100','数据字典导入','system:dict:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2110,2100,'0,2000,2100','数据字典导出','system:dict:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2112,2100,'0,2000,2100','字典状态改变','system:dataDict:changeStatus','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2200,2000,'0,2000','附件管理','system:attachment','ma-icon-attach','attachment','system/attachment/index','',2,'M',1,98,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2201,2300,'0,2000,2200','附件删除','system:attachment:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2202,2200,'0,2000,2200','附件列表','system:attachment:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2203,2200,'0,2000,2200','附件回收站','system:attachment:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2204,2200,'0,2000,2200','附件真实删除','system:attachment:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2300,2000,'0,2000','数据表维护','system:dataMaintain','ma-icon-db','dataMaintain','system/dataMaintain/index','',2,'M',1,95,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2301,2300,'0,2000,2300','数据表列表','system:dataMaintain:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2302,2300,'0,2000,2300','数据表详细','system:dataMaintain:detailed','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2303,2300,'0,2000,2300','数据表清理碎片','system:dataMaintain:fragment','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2304,2300,'0,2000,2300','数据表优化','system:dataMaintain:optimize','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2500,2000,'0,2000','应用中心','apps','icon-apps','apps','','',2,'M',1,90,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2510,2500,'0,2000,2500','应用分组','system:appGroup','ma-icon-group','appGroup','system/appGroup/index','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2511,2510,'0,2000,2500,2510','应用分组列表','system:appGroup:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2512,2510,'0,2000,2500,2510','应用分组回收站','system:appGroup:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2513,2510,'0,2000,2500,2510','应用分组保存','system:appGroup:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2514,2510,'0,2000,2500,2510','应用分组更新','system:appGroup:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2515,2510,'0,2000,2500,2510','应用分组删除','system:appGroup:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2516,2510,'0,2000,2500,2510','应用分组读取','system:appGroup:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2517,2510,'0,2000,2500,2510','应用分组恢复','system:appGroup:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2518,2510,'0,2000,2500,2510','应用分组真实删除','system:appGroup:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2519,2510,'0,2000,2500,2510','应用分组导入','system:appGroup:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2520,2510,'0,2000,2500,2510','应用分组导出','system:appGroup:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2530,2500,'0,2000,2500','应用管理','system:app','icon-archive','app','system/app/index','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2531,2530,'0,2000,2500,2530','应用列表','system:app:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2532,2530,'0,2000,2500,2530','应用回收站','system:app:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2533,2530,'0,2000,2500,2530','应用保存','system:app:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2534,2530,'0,2000,2500,2530','应用更新','system:app:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2535,2530,'0,2000,2500,2530','应用删除','system:app:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2536,2530,'0,2000,2500,2530','应用读取','system:app:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2537,2530,'0,2000,2500,2530','应用恢复','system:app:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2538,2530,'0,2000,2500,2530','应用真实删除','system:app:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2539,2530,'0,2000,2500,2530','应用导入','system:app:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2540,2530,'0,2000,2500,2530','应用导出','system:app:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2541,2530,'0,2000,2500,2530','应用绑定接口','system:app:bind','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2600,2000,'0,2000','应用接口','apis','icon-common','apis','','',2,'M',1,80,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2610,2600,'0,2000,2600','接口分组','system:apiGroup','ma-icon-group','apiGroup','system/apiGroup/index','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2611,2610,'0,2000,2600,2610','接口分组列表','system:apiGroup:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2612,2610,'0,2000,2600,2610','接口分组回收站','system:apiGroup:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2613,2610,'0,2000,2600,2610','接口分组保存','system:apiGroup:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2614,2610,'0,2000,2600,2610','接口分组更新','system:apiGroup:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2615,2610,'0,2000,2600,2610','接口分组删除','system:apiGroup:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2616,2610,'0,2000,2600,2610','接口分组读取','system:apiGroup:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2617,2610,'0,2000,2600,2610','接口分组恢复','system:apiGroup:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2618,2610,'0,2000,2600,2610','接口分组真实删除','system:apiGroup:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2619,2610,'0,2000,2600,2610','接口分组导入','system:apiGroup:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2620,2610,'0,2000,2600,2610','接口分组导出','system:apiGroup:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2630,2600,'0,2000,2600','接口管理','system:api','icon-mind-mapping','api','system/api/index','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2631,2630,'0,2000,2600,2630','接口列表','system:api:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2632,2630,'0,2000,2600,2630','接口回收站','system:api:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2633,2630,'0,2000,2600,2630','接口保存','system:api:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2634,2630,'0,2000,2600,2630','接口更新','system:api:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2635,2630,'0,2000,2600,2630','接口删除','system:api:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2636,2630,'0,2000,2600,2630','接口读取','system:api:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2637,2630,'0,2000,2600,2630','接口恢复','system:api:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2638,2630,'0,2000,2600,2630','接口真实删除','system:api:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2639,2630,'0,2000,2600,2630','接口导入','system:api:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2640,2630,'0,2000,2600,2630','接口导出','system:api:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2700,2000,'0,2000','系统公告','system:notice','icon-bulb','notice','system/notice/index','',2,'M',1,94,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2701,2700,'0,2000,2700','系统公告列表','system:notice:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2702,2700,'0,2000,2700','系统公告回收站','system:notice:recycle','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2703,2700,'0,2000,2700','系统公告保存','system:notice:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2704,2700,'0,2000,2700','系统公告更新','system:notice:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2705,2700,'0,2000,2700','系统公告删除','system:notice:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2706,2700,'0,2000,2700','系统公告读取','system:notice:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2707,2700,'0,2000,2700','系统公告恢复','system:notice:recovery','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2708,2700,'0,2000,2700','系统公告真实删除','system:notice:realDelete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2709,2700,'0,2000,2700','系统公告导入','system:notice:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(2710,2700,'0,2000,2700','系统公告导出','system:notice:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3000,0,'0','监控','monitor','icon-desktop','monitor','','',2,'M',1,97,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3200,3000,'0,3000','服务监控','system:monitor:server','icon-thunderbolt','server','system/monitor/server/index','',2,'M',1,99,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3300,3000,'0,3000','日志监控','logs','icon-book','logs','','',2,'M',1,95,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3400,3300,'0,3000,3200','登录日志','system:loginLog','icon-idcard','loginLog','system/logs/loginLog','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3401,3400,'0,3000,3200,3300','登录日志删除','system:loginLog:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3500,3300,'0,3000,3200','操作日志','system:operLog','icon-robot','operLog','system/logs/operLog','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3501,3500,'0,3000,3200,3400','操作日志删除','system:operLog:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3600,3000,'0,3000','在线用户','system:onlineUser','ma-icon-online','onlineUser','system/monitor/onlineUser/index','',2,'M',1,98,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3601,3500,'0,3000,3500','在线用户列表','system:onlineUser:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3602,3500,'0,3000,3500','强退用户','system:onlineUser:kick','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3700,3000,'0,3000','缓存监控','system:cache','icon-dice','cache','system/monitor/cache/index','',2,'M',1,98,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3701,3700,'0,3000,3700','获取Redis信息','system:cache:monitor','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3702,3700,'0,3000,3700','删除一个缓存','system:cache:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3703,3700,'0,3000,3700','清空所有缓存','system:cache:clear','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3800,3300,'0,3000,3300','接口日志','system:apiLog','icon-calendar','apiLog','system/logs/apiLog','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3801,3800,'0,3000,3300,3800','接口日志删除','system:apiLog:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3850,3300,'0,3000,3300','队列日志','system:queueLog','icon-layers','queueLog','system/logs/queueLog','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3851,3850,'0,3000,3300,3850','删除队列日志','system:queueLog:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(3852,3850,'0,3000,3300,3850','更新队列状态','system:queueLog:updateStatus','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4000,0,'0','工具','devTools','ma-icon-tool','devTools','','',2,'M',1,95,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4100,4000,'0,4000','模块管理','setting:module','icon-folder','module','setting/module/index','',2,'M',1,99,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4101,4100,'0,4000,4100','新增模块','setting:module:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4102,4100,'0,4000,4100','模块删除','setting:module:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4103,4100,'0,4000,4100','模块列表','setting:module:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4104,4100,'0,4000,4100','模块启停用','setting:module:status','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4105,4100,'0,4000,4100','安装模块','setting:module:install','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4200,4000,'0,4000','代码生成器','setting:code','ma-icon-code','code','setting/code/index','',2,'M',1,98,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4201,4200,'0,4000,4200','预览代码','setting:code:preview','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4202,4200,'0,4000,4200','装载数据表','setting:code:loadTable','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4203,4200,'0,4000,4200','删除业务表','setting:code:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4204,4200,'0,4000,4200','同步业务表','setting:code:sync','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4205,4200,'0,4000,4200','生成代码','setting:code:generate','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4400,4000,'0,4000','定时任务','setting:crontab','icon-schedule','crontab','setting/crontab/index','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4401,4400,'0,4000,4400','定时任务列表','setting:crontab:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4402,4400,'0,4000,4400','定时任务保存','setting:crontab:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4403,4400,'0,4000,4400','定时任务更新','setting:crontab:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4404,4400,'0,4000,4400','定时任务删除','setting:crontab:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4405,4400,'0,4000,4400','定时任务读取','setting:crontab:read','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4406,4400,'0,4000,4400','定时任务导入','setting:crontab:import','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4407,4400,'0,4000,4400','定时任务导出','setting:crontab:export','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4408,4400,'0,4000,4400','定时任务执行','setting:crontab:run','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4409,4400,'0,4000,4400','定时任务日志删除','setting:crontab:deleteLog','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4500,0,'0','系统设置','setting:config','icon-settings','system','setting/config/index','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4502,4500,'0,4500','配置列表','setting:config:index','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4504,4500,'0,4500','新增配置 ','setting:config:save','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4505,4500,'0,4500','更新配置','setting:config:update','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4506,4500,'0,4500','删除配置','setting:config:delete','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4507,4500,'0,4500','清除配置缓存','setting:config:clearCache','','','','',1,'B',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4600,4000,'0,4000','系统接口','systemInterface','icon-compass','systemInterface','setting/systemInterface/index','',2,'M',1,0,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,''),(4601,4000,'0,4000','数据源管理','setting:datasource','icon-storage','setting/datasource','setting/datasource/index','',2,'M',1,0,1,0,'2024-08-04 21:59:30','2024-08-04 21:59:30',NULL,''),(4602,4601,'0,4000,4601','数据源管理列表','setting:datasource:index','','','','',2,'B',1,0,0,0,'2024-08-04 21:59:30','2024-08-04 21:59:30',NULL,''),(4603,4601,'0,4000,4601','数据源管理保存','setting:datasource:save','','','','',2,'B',1,0,0,0,'2024-08-04 21:59:30','2024-08-04 21:59:30',NULL,''),(4604,4601,'0,4000,4601','数据源管理更新','setting:datasource:update','','','','',2,'B',1,0,0,0,'2024-08-04 21:59:30','2024-08-04 21:59:30',NULL,''),(4605,4601,'0,4000,4601','数据源管理读取','setting:datasource:read','','','','',2,'B',1,0,0,0,'2024-08-04 21:59:30','2024-08-04 21:59:30',NULL,''),(4606,4601,'0,4000,4601','数据源管理删除','setting:datasource:delete','','','','',2,'B',1,0,0,0,'2024-08-04 21:59:30','2024-08-04 21:59:30',NULL,''),(4607,4601,'0,4000,4601','数据源管理导入','setting:datasource:import','','','','',2,'B',1,0,0,0,'2024-08-04 21:59:30','2024-08-04 21:59:30',NULL,''),(4608,4601,'0,4000,4601','数据源管理导出','setting:datasource:export','','','','',2,'B',1,0,0,0,'2024-08-04 21:59:30','2024-08-04 21:59:30',NULL,'');
/*!40000 ALTER TABLE `system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notice`
--

DROP TABLE IF EXISTS `system_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notice` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_id` bigint NOT NULL COMMENT '消息ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `type` smallint NOT NULL COMMENT '公告类型（1通知 2公告）',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '公告内容',
  `click_num` int DEFAULT '0' COMMENT '浏览次数',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_notice_message_id_index` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notice`
--

LOCK TABLES `system_notice` WRITE;
/*!40000 ALTER TABLE `system_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oper_log`
--

DROP TABLE IF EXISTS `system_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oper_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求方式',
  `router` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求路由',
  `service_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务名称',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求IP地址',
  `ip_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP所属地',
  `request_data` text COLLATE utf8mb4_unicode_ci COMMENT '请求数据',
  `response_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '响应状态码',
  `response_data` text COLLATE utf8mb4_unicode_ci COMMENT '响应数据',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_oper_log_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oper_log`
--

LOCK TABLES `system_oper_log` WRITE;
/*!40000 ALTER TABLE `system_oper_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_post`
--

DROP TABLE IF EXISTS `system_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位代码',
  `sort` smallint unsigned DEFAULT '0' COMMENT '排序',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_post`
--

LOCK TABLES `system_post` WRITE;
/*!40000 ALTER TABLE `system_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_queue_log`
--

DROP TABLE IF EXISTS `system_queue_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_queue_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exchange_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交换机名称',
  `routing_key_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路由名称',
  `queue_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '队列名称',
  `queue_content` longtext COLLATE utf8mb4_unicode_ci COMMENT '队列数据',
  `log_content` text COLLATE utf8mb4_unicode_ci COMMENT '队列日志',
  `produce_status` smallint DEFAULT '1' COMMENT '生产状态 1:未生产 2:生产中 3:生产成功 4:生产失败 5:生产重复',
  `consume_status` smallint DEFAULT '1' COMMENT '消费状态 1:未消费 2:消费中 3:消费成功 4:消费失败 5:消费重复',
  `delay_time` int unsigned NOT NULL COMMENT '延迟时间（秒）',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='队列日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_queue_log`
--

LOCK TABLES `system_queue_log` WRITE;
/*!40000 ALTER TABLE `system_queue_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_queue_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_queue_message`
--

DROP TABLE IF EXISTS `system_queue_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_queue_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_id` bigint unsigned DEFAULT NULL COMMENT '内容ID',
  `content_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容类型',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息标题',
  `send_by` bigint unsigned DEFAULT NULL COMMENT '发送人',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `system_queue_message_content_type_index` (`content_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='队列消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_queue_message`
--

LOCK TABLES `system_queue_message` WRITE;
/*!40000 ALTER TABLE `system_queue_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_queue_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_queue_message_receive`
--

DROP TABLE IF EXISTS `system_queue_message_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_queue_message_receive` (
  `message_id` bigint unsigned NOT NULL COMMENT '队列消息主键',
  `user_id` bigint unsigned NOT NULL COMMENT '接收用户主键',
  `read_status` smallint DEFAULT '1' COMMENT '已读状态 (1未读 2已读)',
  PRIMARY KEY (`message_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='队列消息接收人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_queue_message_receive`
--

LOCK TABLES `system_queue_message_receive` WRITE;
/*!40000 ALTER TABLE `system_queue_message_receive` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_queue_message_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role`
--

DROP TABLE IF EXISTS `system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色代码',
  `data_scope` smallint DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定义数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：本人数据权限）',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `sort` smallint unsigned DEFAULT '0' COMMENT '排序',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role`
--

LOCK TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;
INSERT INTO `system_role` VALUES (1,'超级管理员（创始人）','superAdmin',0,1,0,1,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,'系统内置角色，不可删除');
/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role_dept`
--

DROP TABLE IF EXISTS `system_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role_dept` (
  `role_id` bigint unsigned NOT NULL COMMENT '角色主键',
  `dept_id` bigint unsigned NOT NULL COMMENT '部门主键',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色与部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role_dept`
--

LOCK TABLES `system_role_dept` WRITE;
/*!40000 ALTER TABLE `system_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role_menu`
--

DROP TABLE IF EXISTS `system_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role_menu` (
  `role_id` bigint unsigned NOT NULL COMMENT '角色主键',
  `menu_id` bigint unsigned NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色与菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role_menu`
--

LOCK TABLES `system_role_menu` WRITE;
/*!40000 ALTER TABLE `system_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_uploadfile`
--

DROP TABLE IF EXISTS `system_uploadfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_uploadfile` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `storage_mode` smallint DEFAULT '1' COMMENT '存储模式 (1 本地 2 阿里云 3 七牛云 4 腾讯云)',
  `origin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原文件名',
  `object_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新文件名',
  `hash` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件hash',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类型',
  `storage_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '存储目录',
  `suffix` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件后缀',
  `size_byte` bigint DEFAULT NULL COMMENT '字节数',
  `size_info` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url地址',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_uploadfile_hash_unique` (`hash`),
  KEY `system_uploadfile_storage_path_index` (`storage_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='上传文件信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_uploadfile`
--

LOCK TABLES `system_uploadfile` WRITE;
/*!40000 ALTER TABLE `system_uploadfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_uploadfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID，主键',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `user_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT '100' COMMENT '用户类型：(100系统用户)',
  `nickname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户邮箱',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `signed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人签名',
  `dashboard` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '后台首页类型',
  `status` smallint DEFAULT '1' COMMENT '状态 (1正常 2停用)',
  `login_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后登陆IP',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '最后登陆时间',
  `backend_setting` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '后台设置数据',
  `created_by` bigint DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_user_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` VALUES (1,'superAdmin','$2y$10$kqBZdgVWl/w2.pGNKQWpeenTjAwy.wJDUvekLasLnGl30g8LGPR..','100','创始人','16858888988','admin@adminmine.com',NULL,'广阔天地，大有所为','statistics',1,NULL,NULL,NULL,0,0,'2024-08-04 21:59:29','2024-08-04 21:59:29',NULL,NULL);
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_dept`
--

DROP TABLE IF EXISTS `system_user_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_dept` (
  `user_id` bigint unsigned NOT NULL COMMENT '用户主键',
  `dept_id` bigint unsigned NOT NULL COMMENT '部门主键',
  PRIMARY KEY (`user_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_dept`
--

LOCK TABLES `system_user_dept` WRITE;
/*!40000 ALTER TABLE `system_user_dept` DISABLE KEYS */;
INSERT INTO `system_user_dept` VALUES (1,1);
/*!40000 ALTER TABLE `system_user_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_post`
--

DROP TABLE IF EXISTS `system_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_post` (
  `user_id` bigint unsigned NOT NULL COMMENT '用户主键',
  `post_id` bigint unsigned NOT NULL COMMENT '岗位主键',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_post`
--

LOCK TABLES `system_user_post` WRITE;
/*!40000 ALTER TABLE `system_user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_role`
--

DROP TABLE IF EXISTS `system_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_role` (
  `user_id` bigint unsigned NOT NULL COMMENT '用户主键',
  `role_id` bigint unsigned NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_role`
--

LOCK TABLES `system_user_role` WRITE;
/*!40000 ALTER TABLE `system_user_role` DISABLE KEYS */;
INSERT INTO `system_user_role` VALUES (1,1);
/*!40000 ALTER TABLE `system_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-05 14:51:25
