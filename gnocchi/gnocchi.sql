-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: gnocchi
-- ------------------------------------------------------
-- Server version	5.5.35-1ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('a54c57ada3f5');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_policy`
--

DROP TABLE IF EXISTS `archive_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_policy` (
  `name` varchar(255) NOT NULL,
  `back_window` int(11) NOT NULL,
  `definition` text NOT NULL,
  `aggregation_methods` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_policy`
--

LOCK TABLES `archive_policy` WRITE;
/*!40000 ALTER TABLE `archive_policy` DISABLE KEYS */;
INSERT INTO `archive_policy` VALUES ('high',0,'[{\"points\": 86400, \"granularity\": 1.0, \"timespan\": 86400.0}, {\"points\": 43200, \"granularity\": 60.0, \"timespan\": 2592000.0}, {\"points\": 8760, \"granularity\": 3600.0, \"timespan\": 31536000.0}]','[\"std\", \"count\", \"95pct\", \"min\", \"max\", \"sum\", \"median\", \"mean\"]'),('low',0,'[{\"points\": 12, \"granularity\": 300.0, \"timespan\": 3600.0}, {\"points\": 24, \"granularity\": 3600.0, \"timespan\": 86400.0}, {\"points\": 30, \"granularity\": 86400.0, \"timespan\": 2592000.0}]','[\"std\", \"count\", \"95pct\", \"min\", \"max\", \"sum\", \"median\", \"mean\"]'),('medium',0,'[{\"points\": 60, \"granularity\": 60.0, \"timespan\": 3600.0}, {\"points\": 168, \"granularity\": 3600.0, \"timespan\": 604800.0}, {\"points\": 365, \"granularity\": 86400.0, \"timespan\": 31536000.0}]','[\"std\", \"count\", \"95pct\", \"min\", \"max\", \"sum\", \"median\", \"mean\"]');
/*!40000 ALTER TABLE `archive_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_policy_rule`
--

DROP TABLE IF EXISTS `archive_policy_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_policy_rule` (
  `name` varchar(255) NOT NULL,
  `archive_policy_name` varchar(255) NOT NULL,
  `metric_pattern` varchar(255) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `fk_archive_policy_rule_archive_policy_name_archive_policy_name` (`archive_policy_name`),
  CONSTRAINT `fk_archive_policy_rule_archive_policy_name_archive_policy_name` FOREIGN KEY (`archive_policy_name`) REFERENCES `archive_policy` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_policy_rule`
--

LOCK TABLES `archive_policy_rule` WRITE;
/*!40000 ALTER TABLE `archive_policy_rule` DISABLE KEYS */;
INSERT INTO `archive_policy_rule` VALUES ('default','low','*');
/*!40000 ALTER TABLE `archive_policy_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceph_account`
--

DROP TABLE IF EXISTS `ceph_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceph_account` (
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_ceph_account_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceph_account`
--

LOCK TABLES `ceph_account` WRITE;
/*!40000 ALTER TABLE `ceph_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ceph_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceph_account_history`
--

DROP TABLE IF EXISTS `ceph_account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceph_account_history` (
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_ceph_account_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceph_account_history`
--

LOCK TABLES `ceph_account_history` WRITE;
/*!40000 ALTER TABLE `ceph_account_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ceph_account_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity`
--

DROP TABLE IF EXISTS `identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity` (
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_identity_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity`
--

LOCK TABLES `identity` WRITE;
/*!40000 ALTER TABLE `identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_history`
--

DROP TABLE IF EXISTS `identity_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity_history` (
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_identity_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_history`
--

LOCK TABLES `identity_history` WRITE;
/*!40000 ALTER TABLE `identity_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `name` varchar(255) NOT NULL,
  `container_format` varchar(255) NOT NULL,
  `disk_format` varchar(255) NOT NULL,
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_image_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_history`
--

DROP TABLE IF EXISTS `image_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_history` (
  `name` varchar(255) NOT NULL,
  `container_format` varchar(255) NOT NULL,
  `disk_format` varchar(255) NOT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_image_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_history`
--

LOCK TABLES `image_history` WRITE;
/*!40000 ALTER TABLE `image_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
  `flavor_id` varchar(255) NOT NULL,
  `image_ref` varchar(255) DEFAULT NULL,
  `host` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `server_group` varchar(255) DEFAULT NULL,
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_instance_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_disk`
--

DROP TABLE IF EXISTS `instance_disk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_disk` (
  `name` varchar(255) NOT NULL,
  `instance_id` binary(16) NOT NULL,
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_instance_disk_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_disk`
--

LOCK TABLES `instance_disk` WRITE;
/*!40000 ALTER TABLE `instance_disk` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_disk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_disk_history`
--

DROP TABLE IF EXISTS `instance_disk_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_disk_history` (
  `name` varchar(255) NOT NULL,
  `instance_id` binary(16) NOT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_instance_disk_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_disk_history`
--

LOCK TABLES `instance_disk_history` WRITE;
/*!40000 ALTER TABLE `instance_disk_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_disk_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_history`
--

DROP TABLE IF EXISTS `instance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_history` (
  `flavor_id` varchar(255) NOT NULL,
  `image_ref` varchar(255) DEFAULT NULL,
  `host` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `server_group` varchar(255) DEFAULT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_instance_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_history`
--

LOCK TABLES `instance_history` WRITE;
/*!40000 ALTER TABLE `instance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_net_int`
--

DROP TABLE IF EXISTS `instance_net_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_net_int` (
  `name` varchar(255) NOT NULL,
  `instance_id` binary(16) NOT NULL,
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_instance_net_int_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_net_int`
--

LOCK TABLES `instance_net_int` WRITE;
/*!40000 ALTER TABLE `instance_net_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_net_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_net_int_history`
--

DROP TABLE IF EXISTS `instance_net_int_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_net_int_history` (
  `name` varchar(255) NOT NULL,
  `instance_id` binary(16) NOT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_instance_net_int_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_net_int_history`
--

LOCK TABLES `instance_net_int_history` WRITE;
/*!40000 ALTER TABLE `instance_net_int_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_net_int_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipmi`
--

DROP TABLE IF EXISTS `ipmi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipmi` (
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_ipmi_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipmi`
--

LOCK TABLES `ipmi` WRITE;
/*!40000 ALTER TABLE `ipmi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipmi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipmi_history`
--

DROP TABLE IF EXISTS `ipmi_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipmi_history` (
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_ipmi_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipmi_history`
--

LOCK TABLES `ipmi_history` WRITE;
/*!40000 ALTER TABLE `ipmi_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipmi_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metric`
--

DROP TABLE IF EXISTS `metric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric` (
  `id` binary(16) NOT NULL,
  `archive_policy_name` varchar(255) NOT NULL,
  `created_by_user_id` varchar(255) DEFAULT NULL,
  `created_by_project_id` varchar(255) DEFAULT NULL,
  `resource_id` binary(16) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('active','delete') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_metric0resource_id0name` (`resource_id`,`name`),
  KEY `fk_metric_archive_policy_name_archive_policy_name` (`archive_policy_name`),
  KEY `ix_metric_status` (`status`),
  CONSTRAINT `fk_metric_archive_policy_name_archive_policy_name` FOREIGN KEY (`archive_policy_name`) REFERENCES `archive_policy` (`name`),
  CONSTRAINT `fk_metric_resource_id_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metric`
--

LOCK TABLES `metric` WRITE;
/*!40000 ALTER TABLE `metric` DISABLE KEYS */;
/*!40000 ALTER TABLE `metric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network`
--

DROP TABLE IF EXISTS `network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network` (
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_network_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network`
--

LOCK TABLES `network` WRITE;
/*!40000 ALTER TABLE `network` DISABLE KEYS */;
/*!40000 ALTER TABLE `network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_history`
--

DROP TABLE IF EXISTS `network_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_history` (
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_network_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_history`
--

LOCK TABLES `network_history` WRITE;
/*!40000 ALTER TABLE `network_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `type` enum('generic','instance','swift_account','volume','ceph_account','network','identity','ipmi','stack','image','instance_disk','instance_network_interface') NOT NULL,
  `created_by_user_id` varchar(255) DEFAULT NULL,
  `created_by_project_id` varchar(255) DEFAULT NULL,
  `started_at` decimal(20,6) NOT NULL,
  `revision_start` decimal(20,6) NOT NULL,
  `ended_at` decimal(20,6) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `original_resource_id` varchar(255) DEFAULT NULL,
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES ('generic','e46a2935-e654-47f7-b658-bb28dc2cfd03','a57b54c2-9682-434f-9afa-00fd66a256ad',1457069216.222017,1457069216.222061,NULL,NULL,NULL,NULL,'\n}EI風4/i3姻
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_history`
--

DROP TABLE IF EXISTS `resource_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_history` (
  `type` enum('generic','instance','swift_account','volume','ceph_account','network','identity','ipmi','stack','image','instance_disk','instance_network_interface') NOT NULL,
  `created_by_user_id` varchar(255) DEFAULT NULL,
  `created_by_project_id` varchar(255) DEFAULT NULL,
  `started_at` decimal(20,6) NOT NULL,
  `revision_start` decimal(20,6) NOT NULL,
  `ended_at` decimal(20,6) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `original_resource_id` varchar(255) DEFAULT NULL,
  `revision` int(11) NOT NULL AUTO_INCREMENT,
  `id` binary(16) NOT NULL,
  `revision_end` decimal(20,6) NOT NULL,
  PRIMARY KEY (`revision`),
  KEY `fk_resource_history_id_resource_id` (`id`),
  CONSTRAINT `fk_resource_history_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_history`
--

LOCK TABLES `resource_history` WRITE;
/*!40000 ALTER TABLE `resource_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack`
--

DROP TABLE IF EXISTS `stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack` (
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_stack_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack`
--

LOCK TABLES `stack` WRITE;
/*!40000 ALTER TABLE `stack` DISABLE KEYS */;
/*!40000 ALTER TABLE `stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack_history`
--

DROP TABLE IF EXISTS `stack_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack_history` (
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_stack_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack_history`
--

LOCK TABLES `stack_history` WRITE;
/*!40000 ALTER TABLE `stack_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `stack_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swift_account`
--

DROP TABLE IF EXISTS `swift_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swift_account` (
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_swift_account_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swift_account`
--

LOCK TABLES `swift_account` WRITE;
/*!40000 ALTER TABLE `swift_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `swift_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swift_account_history`
--

DROP TABLE IF EXISTS `swift_account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swift_account_history` (
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_swift_account_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swift_account_history`
--

LOCK TABLES `swift_account_history` WRITE;
/*!40000 ALTER TABLE `swift_account_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `swift_account_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume`
--

DROP TABLE IF EXISTS `volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume` (
  `display_name` varchar(255) DEFAULT NULL,
  `id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_volume_id_resource_id` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume`
--

LOCK TABLES `volume` WRITE;
/*!40000 ALTER TABLE `volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_history`
--

DROP TABLE IF EXISTS `volume_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_history` (
  `display_name` varchar(255) DEFAULT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`revision`),
  CONSTRAINT `fk_volume_history_revision_resource_history_revision` FOREIGN KEY (`revision`) REFERENCES `resource_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_history`
--

LOCK TABLES `volume_history` WRITE;
/*!40000 ALTER TABLE `volume_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-05  2:34:05
