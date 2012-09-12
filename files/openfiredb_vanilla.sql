-- MySQL dump 10.13  Distrib 5.5.27, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: openfire
-- ------------------------------------------------------
-- Server version	5.5.27-1~dotdeb.0

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
-- Table structure for table `ofExtComponentConf`
--

DROP TABLE IF EXISTS `ofExtComponentConf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofExtComponentConf` (
  `subdomain` varchar(255) NOT NULL,
  `wildcard` tinyint(4) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `permission` varchar(10) NOT NULL,
  PRIMARY KEY (`subdomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofExtComponentConf`
--

LOCK TABLES `ofExtComponentConf` WRITE;
/*!40000 ALTER TABLE `ofExtComponentConf` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofExtComponentConf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofGroup`
--

DROP TABLE IF EXISTS `ofGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofGroup` (
  `groupName` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofGroup`
--

LOCK TABLES `ofGroup` WRITE;
/*!40000 ALTER TABLE `ofGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofGroupProp`
--

DROP TABLE IF EXISTS `ofGroupProp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofGroupProp` (
  `groupName` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`groupName`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofGroupProp`
--

LOCK TABLES `ofGroupProp` WRITE;
/*!40000 ALTER TABLE `ofGroupProp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofGroupProp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofGroupUser`
--

DROP TABLE IF EXISTS `ofGroupUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofGroupUser` (
  `groupName` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `administrator` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupName`,`username`,`administrator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofGroupUser`
--

LOCK TABLES `ofGroupUser` WRITE;
/*!40000 ALTER TABLE `ofGroupUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofGroupUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofID`
--

DROP TABLE IF EXISTS `ofID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofID` (
  `idType` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofID`
--

LOCK TABLES `ofID` WRITE;
/*!40000 ALTER TABLE `ofID` DISABLE KEYS */;
INSERT INTO `ofID` VALUES (18,1),(19,1),(23,1),(26,2);
/*!40000 ALTER TABLE `ofID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucAffiliation`
--

DROP TABLE IF EXISTS `ofMucAffiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofMucAffiliation` (
  `roomID` bigint(20) NOT NULL,
  `jid` text NOT NULL,
  `affiliation` tinyint(4) NOT NULL,
  PRIMARY KEY (`roomID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucAffiliation`
--

LOCK TABLES `ofMucAffiliation` WRITE;
/*!40000 ALTER TABLE `ofMucAffiliation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucAffiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucConversationLog`
--

DROP TABLE IF EXISTS `ofMucConversationLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofMucConversationLog` (
  `roomID` bigint(20) NOT NULL,
  `sender` text NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `logTime` char(15) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  KEY `ofMucConversationLog_time_idx` (`logTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucConversationLog`
--

LOCK TABLES `ofMucConversationLog` WRITE;
/*!40000 ALTER TABLE `ofMucConversationLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucConversationLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucMember`
--

DROP TABLE IF EXISTS `ofMucMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofMucMember` (
  `roomID` bigint(20) NOT NULL,
  `jid` text NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `faqentry` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roomID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucMember`
--

LOCK TABLES `ofMucMember` WRITE;
/*!40000 ALTER TABLE `ofMucMember` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucRoom`
--

DROP TABLE IF EXISTS `ofMucRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofMucRoom` (
  `serviceID` bigint(20) NOT NULL,
  `roomID` bigint(20) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `naturalName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lockedDate` char(15) NOT NULL,
  `emptyDate` char(15) DEFAULT NULL,
  `canChangeSubject` tinyint(4) NOT NULL,
  `maxUsers` int(11) NOT NULL,
  `publicRoom` tinyint(4) NOT NULL,
  `moderated` tinyint(4) NOT NULL,
  `membersOnly` tinyint(4) NOT NULL,
  `canInvite` tinyint(4) NOT NULL,
  `roomPassword` varchar(50) DEFAULT NULL,
  `canDiscoverJID` tinyint(4) NOT NULL,
  `logEnabled` tinyint(4) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `rolesToBroadcast` tinyint(4) NOT NULL,
  `useReservedNick` tinyint(4) NOT NULL,
  `canChangeNick` tinyint(4) NOT NULL,
  `canRegister` tinyint(4) NOT NULL,
  PRIMARY KEY (`serviceID`,`name`),
  KEY `ofMucRoom_roomid_idx` (`roomID`),
  KEY `ofMucRoom_serviceid_idx` (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucRoom`
--

LOCK TABLES `ofMucRoom` WRITE;
/*!40000 ALTER TABLE `ofMucRoom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucRoom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucRoomProp`
--

DROP TABLE IF EXISTS `ofMucRoomProp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofMucRoomProp` (
  `roomID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`roomID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucRoomProp`
--

LOCK TABLES `ofMucRoomProp` WRITE;
/*!40000 ALTER TABLE `ofMucRoomProp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucRoomProp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucService`
--

DROP TABLE IF EXISTS `ofMucService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofMucService` (
  `serviceID` bigint(20) NOT NULL,
  `subdomain` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isHidden` tinyint(4) NOT NULL,
  PRIMARY KEY (`subdomain`),
  KEY `ofMucService_serviceid_idx` (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucService`
--

LOCK TABLES `ofMucService` WRITE;
/*!40000 ALTER TABLE `ofMucService` DISABLE KEYS */;
INSERT INTO `ofMucService` VALUES (1,'conference',NULL,0);
/*!40000 ALTER TABLE `ofMucService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucServiceProp`
--

DROP TABLE IF EXISTS `ofMucServiceProp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofMucServiceProp` (
  `serviceID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`serviceID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucServiceProp`
--

LOCK TABLES `ofMucServiceProp` WRITE;
/*!40000 ALTER TABLE `ofMucServiceProp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucServiceProp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofOffline`
--

DROP TABLE IF EXISTS `ofOffline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofOffline` (
  `username` varchar(64) NOT NULL,
  `messageID` bigint(20) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `messageSize` int(11) NOT NULL,
  `stanza` text NOT NULL,
  PRIMARY KEY (`username`,`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofOffline`
--

LOCK TABLES `ofOffline` WRITE;
/*!40000 ALTER TABLE `ofOffline` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofOffline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPresence`
--

DROP TABLE IF EXISTS `ofPresence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPresence` (
  `username` varchar(64) NOT NULL,
  `offlinePresence` text,
  `offlineDate` char(15) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPresence`
--

LOCK TABLES `ofPresence` WRITE;
/*!40000 ALTER TABLE `ofPresence` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPresence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPrivacyList`
--

DROP TABLE IF EXISTS `ofPrivacyList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPrivacyList` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `isDefault` tinyint(4) NOT NULL,
  `list` text NOT NULL,
  PRIMARY KEY (`username`,`name`),
  KEY `ofPrivacyList_default_idx` (`username`,`isDefault`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPrivacyList`
--

LOCK TABLES `ofPrivacyList` WRITE;
/*!40000 ALTER TABLE `ofPrivacyList` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPrivacyList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPrivate`
--

DROP TABLE IF EXISTS `ofPrivate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPrivate` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `namespace` varchar(200) NOT NULL,
  `privateData` text NOT NULL,
  PRIMARY KEY (`username`,`name`,`namespace`(100))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPrivate`
--

LOCK TABLES `ofPrivate` WRITE;
/*!40000 ALTER TABLE `ofPrivate` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPrivate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofProperty`
--

DROP TABLE IF EXISTS `ofProperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofProperty` (
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofProperty`
--

LOCK TABLES `ofProperty` WRITE;
/*!40000 ALTER TABLE `ofProperty` DISABLE KEYS */;
INSERT INTO `ofProperty` VALUES ('passwordKey','6C9JQH57Ly9yUXl'),('provider.admin.className','org.jivesoftware.openfire.admin.DefaultAdminProvider'),('provider.auth.className','org.jivesoftware.openfire.auth.DefaultAuthProvider'),('provider.group.className','org.jivesoftware.openfire.group.DefaultGroupProvider'),('provider.lockout.className','org.jivesoftware.openfire.lockout.DefaultLockOutProvider'),('provider.securityAudit.className','org.jivesoftware.openfire.security.DefaultSecurityAuditProvider'),('provider.user.className','org.jivesoftware.openfire.user.DefaultUserProvider'),('provider.vcard.className','org.jivesoftware.openfire.vcard.DefaultVCardProvider'),('update.lastCheck','1347086549101'),('xmpp.auth.anonymous','true'),('xmpp.domain','173.230.147.246'),('xmpp.session.conflict-limit','0'),('xmpp.socket.ssl.active','true');
/*!40000 ALTER TABLE `ofProperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubAffiliation`
--

DROP TABLE IF EXISTS `ofPubsubAffiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPubsubAffiliation` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `affiliation` varchar(10) NOT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubAffiliation`
--

LOCK TABLES `ofPubsubAffiliation` WRITE;
/*!40000 ALTER TABLE `ofPubsubAffiliation` DISABLE KEYS */;
INSERT INTO `ofPubsubAffiliation` VALUES ('pubsub','','173.230.147.246','owner');
/*!40000 ALTER TABLE `ofPubsubAffiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubDefaultConf`
--

DROP TABLE IF EXISTS `ofPubsubDefaultConf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPubsubDefaultConf` (
  `serviceID` varchar(100) NOT NULL,
  `leaf` tinyint(4) NOT NULL,
  `deliverPayloads` tinyint(4) NOT NULL,
  `maxPayloadSize` int(11) NOT NULL,
  `persistItems` tinyint(4) NOT NULL,
  `maxItems` int(11) NOT NULL,
  `notifyConfigChanges` tinyint(4) NOT NULL,
  `notifyDelete` tinyint(4) NOT NULL,
  `notifyRetract` tinyint(4) NOT NULL,
  `presenceBased` tinyint(4) NOT NULL,
  `sendItemSubscribe` tinyint(4) NOT NULL,
  `publisherModel` varchar(15) NOT NULL,
  `subscriptionEnabled` tinyint(4) NOT NULL,
  `accessModel` varchar(10) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `replyPolicy` varchar(15) DEFAULT NULL,
  `associationPolicy` varchar(15) NOT NULL,
  `maxLeafNodes` int(11) NOT NULL,
  PRIMARY KEY (`serviceID`,`leaf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubDefaultConf`
--

LOCK TABLES `ofPubsubDefaultConf` WRITE;
/*!40000 ALTER TABLE `ofPubsubDefaultConf` DISABLE KEYS */;
INSERT INTO `ofPubsubDefaultConf` VALUES ('pubsub',0,0,0,0,0,1,1,1,0,0,'publishers',1,'open','English',NULL,'all',-1),('pubsub',1,1,5120,0,-1,1,1,1,0,1,'publishers',1,'open','English',NULL,'all',-1);
/*!40000 ALTER TABLE `ofPubsubDefaultConf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubItem`
--

DROP TABLE IF EXISTS `ofPubsubItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPubsubItem` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `payload` mediumtext,
  PRIMARY KEY (`serviceID`,`nodeID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubItem`
--

LOCK TABLES `ofPubsubItem` WRITE;
/*!40000 ALTER TABLE `ofPubsubItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPubsubItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubNode`
--

DROP TABLE IF EXISTS `ofPubsubNode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPubsubNode` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `leaf` tinyint(4) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  `parent` varchar(100) DEFAULT NULL,
  `deliverPayloads` tinyint(4) NOT NULL,
  `maxPayloadSize` int(11) DEFAULT NULL,
  `persistItems` tinyint(4) DEFAULT NULL,
  `maxItems` int(11) DEFAULT NULL,
  `notifyConfigChanges` tinyint(4) NOT NULL,
  `notifyDelete` tinyint(4) NOT NULL,
  `notifyRetract` tinyint(4) NOT NULL,
  `presenceBased` tinyint(4) NOT NULL,
  `sendItemSubscribe` tinyint(4) NOT NULL,
  `publisherModel` varchar(15) NOT NULL,
  `subscriptionEnabled` tinyint(4) NOT NULL,
  `configSubscription` tinyint(4) NOT NULL,
  `accessModel` varchar(10) NOT NULL,
  `payloadType` varchar(100) DEFAULT NULL,
  `bodyXSLT` varchar(100) DEFAULT NULL,
  `dataformXSLT` varchar(100) DEFAULT NULL,
  `creator` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `replyPolicy` varchar(15) DEFAULT NULL,
  `associationPolicy` varchar(15) DEFAULT NULL,
  `maxLeafNodes` int(11) DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubNode`
--

LOCK TABLES `ofPubsubNode` WRITE;
/*!40000 ALTER TABLE `ofPubsubNode` DISABLE KEYS */;
INSERT INTO `ofPubsubNode` VALUES ('pubsub','',0,'001347086513626','001347086513626',NULL,0,0,0,0,1,1,1,0,0,'publishers',1,0,'open','','','','173.230.147.246','','English','',NULL,'all',-1);
/*!40000 ALTER TABLE `ofPubsubNode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubNodeGroups`
--

DROP TABLE IF EXISTS `ofPubsubNodeGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPubsubNodeGroups` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `rosterGroup` varchar(100) NOT NULL,
  KEY `ofPubsubNodeGroups_idx` (`serviceID`,`nodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubNodeGroups`
--

LOCK TABLES `ofPubsubNodeGroups` WRITE;
/*!40000 ALTER TABLE `ofPubsubNodeGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPubsubNodeGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubNodeJIDs`
--

DROP TABLE IF EXISTS `ofPubsubNodeJIDs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPubsubNodeJIDs` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `associationType` varchar(20) NOT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubNodeJIDs`
--

LOCK TABLES `ofPubsubNodeJIDs` WRITE;
/*!40000 ALTER TABLE `ofPubsubNodeJIDs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPubsubNodeJIDs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubSubscription`
--

DROP TABLE IF EXISTS `ofPubsubSubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofPubsubSubscription` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `state` varchar(15) NOT NULL,
  `deliver` tinyint(4) NOT NULL,
  `digest` tinyint(4) NOT NULL,
  `digest_frequency` int(11) NOT NULL,
  `expire` char(15) DEFAULT NULL,
  `includeBody` tinyint(4) NOT NULL,
  `showValues` varchar(30) DEFAULT NULL,
  `subscriptionType` varchar(10) NOT NULL,
  `subscriptionDepth` tinyint(4) NOT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubSubscription`
--

LOCK TABLES `ofPubsubSubscription` WRITE;
/*!40000 ALTER TABLE `ofPubsubSubscription` DISABLE KEYS */;
INSERT INTO `ofPubsubSubscription` VALUES ('pubsub','','B8jw98SffpTOXV6Ai93UYfLpGl8qwuWEUS0c8F28','173.230.147.246','173.230.147.246','subscribed',1,0,86400000,NULL,0,' ','nodes',1,NULL);
/*!40000 ALTER TABLE `ofPubsubSubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofRemoteServerConf`
--

DROP TABLE IF EXISTS `ofRemoteServerConf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofRemoteServerConf` (
  `xmppDomain` varchar(255) NOT NULL,
  `remotePort` int(11) DEFAULT NULL,
  `permission` varchar(10) NOT NULL,
  PRIMARY KEY (`xmppDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofRemoteServerConf`
--

LOCK TABLES `ofRemoteServerConf` WRITE;
/*!40000 ALTER TABLE `ofRemoteServerConf` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofRemoteServerConf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofRoster`
--

DROP TABLE IF EXISTS `ofRoster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofRoster` (
  `rosterID` bigint(20) NOT NULL,
  `username` varchar(64) NOT NULL,
  `jid` varchar(1024) NOT NULL,
  `sub` tinyint(4) NOT NULL,
  `ask` tinyint(4) NOT NULL,
  `recv` tinyint(4) NOT NULL,
  `nick` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rosterID`),
  KEY `ofRoster_unameid_idx` (`username`),
  KEY `ofRoster_jid_idx` (`jid`(767))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofRoster`
--

LOCK TABLES `ofRoster` WRITE;
/*!40000 ALTER TABLE `ofRoster` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofRoster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofRosterGroups`
--

DROP TABLE IF EXISTS `ofRosterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofRosterGroups` (
  `rosterID` bigint(20) NOT NULL,
  `rank` tinyint(4) NOT NULL,
  `groupName` varchar(255) NOT NULL,
  PRIMARY KEY (`rosterID`,`rank`),
  KEY `ofRosterGroup_rosterid_idx` (`rosterID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofRosterGroups`
--

LOCK TABLES `ofRosterGroups` WRITE;
/*!40000 ALTER TABLE `ofRosterGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofRosterGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofSASLAuthorized`
--

DROP TABLE IF EXISTS `ofSASLAuthorized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofSASLAuthorized` (
  `username` varchar(64) NOT NULL,
  `principal` text NOT NULL,
  PRIMARY KEY (`username`,`principal`(200))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofSASLAuthorized`
--

LOCK TABLES `ofSASLAuthorized` WRITE;
/*!40000 ALTER TABLE `ofSASLAuthorized` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofSASLAuthorized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofSecurityAuditLog`
--

DROP TABLE IF EXISTS `ofSecurityAuditLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofSecurityAuditLog` (
  `msgID` bigint(20) NOT NULL,
  `username` varchar(64) NOT NULL,
  `entryStamp` bigint(20) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `node` varchar(255) NOT NULL,
  `details` text,
  PRIMARY KEY (`msgID`),
  KEY `ofSecurityAuditLog_tstamp_idx` (`entryStamp`),
  KEY `ofSecurityAuditLog_uname_idx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofSecurityAuditLog`
--

LOCK TABLES `ofSecurityAuditLog` WRITE;
/*!40000 ALTER TABLE `ofSecurityAuditLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofSecurityAuditLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofUser`
--

DROP TABLE IF EXISTS `ofUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofUser` (
  `username` varchar(64) NOT NULL,
  `plainPassword` varchar(32) DEFAULT NULL,
  `encryptedPassword` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `ofUser_cDate_idx` (`creationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofUser`
--

LOCK TABLES `ofUser` WRITE;
/*!40000 ALTER TABLE `ofUser` DISABLE KEYS */;
INSERT INTO `ofUser` VALUES ('admin',NULL,'7bf079d116463a24f172e02f7ad0e09daa4b8959d49de3a2','Administrator','krish@olindata.com','001347086511433','0');
/*!40000 ALTER TABLE `ofUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofUserFlag`
--

DROP TABLE IF EXISTS `ofUserFlag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofUserFlag` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `startTime` char(15) DEFAULT NULL,
  `endTime` char(15) DEFAULT NULL,
  PRIMARY KEY (`username`,`name`),
  KEY `ofUserFlag_sTime_idx` (`startTime`),
  KEY `ofUserFlag_eTime_idx` (`endTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofUserFlag`
--

LOCK TABLES `ofUserFlag` WRITE;
/*!40000 ALTER TABLE `ofUserFlag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofUserFlag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofUserProp`
--

DROP TABLE IF EXISTS `ofUserProp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofUserProp` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`username`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofUserProp`
--

LOCK TABLES `ofUserProp` WRITE;
/*!40000 ALTER TABLE `ofUserProp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofUserProp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofVCard`
--

DROP TABLE IF EXISTS `ofVCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofVCard` (
  `username` varchar(64) NOT NULL,
  `vcard` mediumtext NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofVCard`
--

LOCK TABLES `ofVCard` WRITE;
/*!40000 ALTER TABLE `ofVCard` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofVCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofVersion`
--

DROP TABLE IF EXISTS `ofVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofVersion` (
  `name` varchar(50) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofVersion`
--

LOCK TABLES `ofVersion` WRITE;
/*!40000 ALTER TABLE `ofVersion` DISABLE KEYS */;
INSERT INTO `ofVersion` VALUES ('openfire',21);
/*!40000 ALTER TABLE `ofVersion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-08  3:05:57
