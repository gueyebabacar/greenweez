# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: 192.168.99.100 (MySQL 5.5.5-10.1.26-MariaDB-1~jessie)
# Base de données: wynd_api
# Temps de génération: 2017-10-13 08:13:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table llx_accounting_system
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_accounting_system`;

CREATE TABLE `llx_accounting_system` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `pcg_version` varchar(12) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` smallint(6) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_system_pcg_version` (`pcg_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_accounting_system` WRITE;
/*!40000 ALTER TABLE `llx_accounting_system` DISABLE KEYS */;

INSERT INTO `llx_accounting_system` (`rowid`, `pcg_version`, `fk_pays`, `label`, `active`)
VALUES
	(1,'PCG99-ABREGE',1,'The simple accountancy french plan',1),
	(2,'PCG99-BASE',1,'The base accountancy french plan',1),
	(3,'PCMN-BASE',2,'The base accountancy belgium plan',1);

/*!40000 ALTER TABLE `llx_accounting_system` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_accountingaccount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_accountingaccount`;

CREATE TABLE `llx_accountingaccount` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pcg_version` varchar(12) NOT NULL,
  `pcg_type` varchar(20) NOT NULL,
  `pcg_subtype` varchar(20) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `account_parent` varchar(20) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `idx_accountingaccount_fk_pcg_version` (`fk_pcg_version`),
  CONSTRAINT `fk_accountingaccount_fk_pcg_version` FOREIGN KEY (`fk_pcg_version`) REFERENCES `llx_accounting_system` (`pcg_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_accountingaccount` WRITE;
/*!40000 ALTER TABLE `llx_accountingaccount` DISABLE KEYS */;

INSERT INTO `llx_accountingaccount` (`rowid`, `fk_pcg_version`, `pcg_type`, `pcg_subtype`, `account_number`, `account_parent`, `label`, `active`)
VALUES
	(1,'PCG99-ABREGE','CAPIT','CAPITAL','101','1401','Capital',1),
	(2,'PCG99-ABREGE','CAPIT','XXXXXX','105','1401','Ecarts de réévaluation',1),
	(3,'PCG99-ABREGE','CAPIT','XXXXXX','1061','1401','Réserve légale',1),
	(4,'PCG99-ABREGE','CAPIT','XXXXXX','1063','1401','Réserves statutaires ou contractuelles',1),
	(5,'PCG99-ABREGE','CAPIT','XXXXXX','1064','1401','Réserves réglementées',1),
	(6,'PCG99-ABREGE','CAPIT','XXXXXX','1068','1401','Autres réserves',1),
	(7,'PCG99-ABREGE','CAPIT','XXXXXX','108','1401','Compte de l\'exploitant',1),
	(8,'PCG99-ABREGE','CAPIT','XXXXXX','12','1401','Résultat de l\'exercice',1),
	(9,'PCG99-ABREGE','CAPIT','XXXXXX','145','1401','Amortissements dérogatoires',1),
	(10,'PCG99-ABREGE','CAPIT','XXXXXX','146','1401','Provision spéciale de réévaluation',1),
	(11,'PCG99-ABREGE','CAPIT','XXXXXX','147','1401','Plus-values réinvesties',1),
	(12,'PCG99-ABREGE','CAPIT','XXXXXX','148','1401','Autres provisions réglementées',1),
	(13,'PCG99-ABREGE','CAPIT','XXXXXX','15','1401','Provisions pour risques et charges',1),
	(14,'PCG99-ABREGE','CAPIT','XXXXXX','16','1401','Emprunts et dettes assimilees',1),
	(15,'PCG99-ABREGE','IMMO','XXXXXX','20','1402','Immobilisations incorporelles',1),
	(16,'PCG99-ABREGE','IMMO','XXXXXX','201','15','Frais d\'établissement',1),
	(17,'PCG99-ABREGE','IMMO','XXXXXX','206','15','Droit au bail',1),
	(18,'PCG99-ABREGE','IMMO','XXXXXX','207','15','Fonds commercial',1),
	(19,'PCG99-ABREGE','IMMO','XXXXXX','208','15','Autres immobilisations incorporelles',1),
	(20,'PCG99-ABREGE','IMMO','XXXXXX','21','1402','Immobilisations corporelles',1),
	(21,'PCG99-ABREGE','IMMO','XXXXXX','23','1402','Immobilisations en cours',1),
	(22,'PCG99-ABREGE','IMMO','XXXXXX','27','1402','Autres immobilisations financieres',1),
	(23,'PCG99-ABREGE','IMMO','XXXXXX','280','1402','Amortissements des immobilisations incorporelles',1),
	(24,'PCG99-ABREGE','IMMO','XXXXXX','281','1402','Amortissements des immobilisations corporelles',1),
	(25,'PCG99-ABREGE','IMMO','XXXXXX','290','1402','Provisions pour dépréciation des immobilisations incorporelles',1),
	(26,'PCG99-ABREGE','IMMO','XXXXXX','291','1402','Provisions pour dépréciation des immobilisations corporelles',1),
	(27,'PCG99-ABREGE','IMMO','XXXXXX','297','1402','Provisions pour dépréciation des autres immobilisations financières',1),
	(28,'PCG99-ABREGE','STOCK','XXXXXX','31','1403','Matieres premières',1),
	(29,'PCG99-ABREGE','STOCK','XXXXXX','32','1403','Autres approvisionnements',1),
	(30,'PCG99-ABREGE','STOCK','XXXXXX','33','1403','En-cours de production de biens',1),
	(31,'PCG99-ABREGE','STOCK','XXXXXX','34','1403','En-cours de production de services',1),
	(32,'PCG99-ABREGE','STOCK','XXXXXX','35','1403','Stocks de produits',1),
	(33,'PCG99-ABREGE','STOCK','XXXXXX','37','1403','Stocks de marchandises',1),
	(34,'PCG99-ABREGE','STOCK','XXXXXX','391','1403','Provisions pour dépréciation des matières premières',1),
	(35,'PCG99-ABREGE','STOCK','XXXXXX','392','1403','Provisions pour dépréciation des autres approvisionnements',1),
	(36,'PCG99-ABREGE','STOCK','XXXXXX','393','1403','Provisions pour dépréciation des en-cours de production de biens',1),
	(37,'PCG99-ABREGE','STOCK','XXXXXX','394','1403','Provisions pour dépréciation des en-cours de production de services',1),
	(38,'PCG99-ABREGE','STOCK','XXXXXX','395','1403','Provisions pour dépréciation des stocks de produits',1),
	(39,'PCG99-ABREGE','STOCK','XXXXXX','397','1403','Provisions pour dépréciation des stocks de marchandises',1),
	(40,'PCG99-ABREGE','TIERS','SUPPLIER','400','1404','Fournisseurs et Comptes rattachés',1),
	(41,'PCG99-ABREGE','TIERS','XXXXXX','409','1404','Fournisseurs débiteurs',1),
	(42,'PCG99-ABREGE','TIERS','CUSTOMER','410','1404','Clients et Comptes rattachés',1),
	(43,'PCG99-ABREGE','TIERS','XXXXXX','419','1404','Clients créditeurs',1),
	(44,'PCG99-ABREGE','TIERS','XXXXXX','421','1404','Personnel',1),
	(45,'PCG99-ABREGE','TIERS','XXXXXX','428','1404','Personnel',1),
	(46,'PCG99-ABREGE','TIERS','XXXXXX','43','1404','Sécurité sociale et autres organismes sociaux',1),
	(47,'PCG99-ABREGE','TIERS','XXXXXX','444','1404','Etat - impôts sur bénéfice',1),
	(48,'PCG99-ABREGE','TIERS','XXXXXX','445','1404','Etat - Taxes sur chiffre affaires',1),
	(49,'PCG99-ABREGE','TIERS','XXXXXX','447','1404','Autres impôts, taxes et versements assimilés',1),
	(50,'PCG99-ABREGE','TIERS','XXXXXX','45','1404','Groupe et associes',1),
	(51,'PCG99-ABREGE','TIERS','XXXXXX','455','50','Associés',1),
	(52,'PCG99-ABREGE','TIERS','XXXXXX','46','1404','Débiteurs divers et créditeurs divers',1),
	(53,'PCG99-ABREGE','TIERS','XXXXXX','47','1404','Comptes transitoires ou d\'attente',1),
	(54,'PCG99-ABREGE','TIERS','XXXXXX','481','1404','Charges à répartir sur plusieurs exercices',1),
	(55,'PCG99-ABREGE','TIERS','XXXXXX','486','1404','Charges constatées d\'avance',1),
	(56,'PCG99-ABREGE','TIERS','XXXXXX','487','1404','Produits constatés d\'avance',1),
	(57,'PCG99-ABREGE','TIERS','XXXXXX','491','1404','Provisions pour dépréciation des comptes de clients',1),
	(58,'PCG99-ABREGE','TIERS','XXXXXX','496','1404','Provisions pour dépréciation des comptes de débiteurs divers',1),
	(59,'PCG99-ABREGE','FINAN','XXXXXX','50','1405','Valeurs mobilières de placement',1),
	(60,'PCG99-ABREGE','FINAN','BANK','51','1405','Banques, établissements financiers et assimilés',1),
	(61,'PCG99-ABREGE','FINAN','CASH','53','1405','Caisse',1),
	(62,'PCG99-ABREGE','FINAN','XXXXXX','54','1405','Régies d\'avance et accréditifs',1),
	(63,'PCG99-ABREGE','FINAN','XXXXXX','58','1405','Virements internes',1),
	(64,'PCG99-ABREGE','FINAN','XXXXXX','590','1405','Provisions pour dépréciation des valeurs mobilières de placement',1),
	(65,'PCG99-ABREGE','CHARGE','PRODUCT','60','1406','Achats',1),
	(66,'PCG99-ABREGE','CHARGE','XXXXXX','603','65','Variations des stocks',1),
	(67,'PCG99-ABREGE','CHARGE','SERVICE','61','1406','Services extérieurs',1),
	(68,'PCG99-ABREGE','CHARGE','XXXXXX','62','1406','Autres services extérieurs',1),
	(69,'PCG99-ABREGE','CHARGE','XXXXXX','63','1406','Impôts, taxes et versements assimiles',1),
	(70,'PCG99-ABREGE','CHARGE','XXXXXX','641','1406','Rémunérations du personnel',1),
	(71,'PCG99-ABREGE','CHARGE','XXXXXX','644','1406','Rémunération du travail de l\'exploitant',1),
	(72,'PCG99-ABREGE','CHARGE','SOCIAL','645','1406','Charges de sécurité sociale et de prévoyance',1),
	(73,'PCG99-ABREGE','CHARGE','XXXXXX','646','1406','Cotisations sociales personnelles de l\'exploitant',1),
	(74,'PCG99-ABREGE','CHARGE','XXXXXX','65','1406','Autres charges de gestion courante',1),
	(75,'PCG99-ABREGE','CHARGE','XXXXXX','66','1406','Charges financières',1),
	(76,'PCG99-ABREGE','CHARGE','XXXXXX','67','1406','Charges exceptionnelles',1),
	(77,'PCG99-ABREGE','CHARGE','XXXXXX','681','1406','Dotations aux amortissements et aux provisions',1),
	(78,'PCG99-ABREGE','CHARGE','XXXXXX','686','1406','Dotations aux amortissements et aux provisions',1),
	(79,'PCG99-ABREGE','CHARGE','XXXXXX','687','1406','Dotations aux amortissements et aux provisions',1),
	(80,'PCG99-ABREGE','CHARGE','XXXXXX','691','1406','Participation des salariés aux résultats',1),
	(81,'PCG99-ABREGE','CHARGE','XXXXXX','695','1406','Impôts sur les bénéfices',1),
	(82,'PCG99-ABREGE','CHARGE','XXXXXX','697','1406','Imposition forfaitaire annuelle des sociétés',1),
	(83,'PCG99-ABREGE','CHARGE','XXXXXX','699','1406','Produits',1),
	(84,'PCG99-ABREGE','PROD','PRODUCT','701','1407','Ventes de produits finis',1),
	(85,'PCG99-ABREGE','PROD','SERVICE','706','1407','Prestations de services',1),
	(86,'PCG99-ABREGE','PROD','PRODUCT','707','1407','Ventes de marchandises',1),
	(87,'PCG99-ABREGE','PROD','PRODUCT','708','1407','Produits des activités annexes',1),
	(88,'PCG99-ABREGE','PROD','XXXXXX','709','1407','Rabais, remises et ristournes accordés par l\'entreprise',1),
	(89,'PCG99-ABREGE','PROD','XXXXXX','713','1407','Variation des stocks',1),
	(90,'PCG99-ABREGE','PROD','XXXXXX','72','1407','Production immobilisée',1),
	(91,'PCG99-ABREGE','PROD','XXXXXX','73','1407','Produits nets partiels sur opérations à long terme',1),
	(92,'PCG99-ABREGE','PROD','XXXXXX','74','1407','Subventions d\'exploitation',1),
	(93,'PCG99-ABREGE','PROD','XXXXXX','75','1407','Autres produits de gestion courante',1),
	(94,'PCG99-ABREGE','PROD','XXXXXX','753','93','Jetons de présence et rémunérations d\'administrateurs, gérants,...',1),
	(95,'PCG99-ABREGE','PROD','XXXXXX','754','93','Ristournes perçues des coopératives',1),
	(96,'PCG99-ABREGE','PROD','XXXXXX','755','93','Quotes-parts de résultat sur opérations faites en commun',1),
	(97,'PCG99-ABREGE','PROD','XXXXXX','76','1407','Produits financiers',1),
	(98,'PCG99-ABREGE','PROD','XXXXXX','77','1407','Produits exceptionnels',1),
	(99,'PCG99-ABREGE','PROD','XXXXXX','781','1407','Reprises sur amortissements et provisions',1),
	(100,'PCG99-ABREGE','PROD','XXXXXX','786','1407','Reprises sur provisions pour risques',1),
	(101,'PCG99-ABREGE','PROD','XXXXXX','787','1407','Reprises sur provisions',1),
	(102,'PCG99-ABREGE','PROD','XXXXXX','79','1407','Transferts de charges',1),
	(103,'PCG99-BASE','CAPIT','XXXXXX','10','1501','Capital  et réserves',1),
	(104,'PCG99-BASE','CAPIT','CAPITAL','101','103','Capital',1),
	(105,'PCG99-BASE','CAPIT','XXXXXX','104','103','Primes liées au capital social',1),
	(106,'PCG99-BASE','CAPIT','XXXXXX','105','103','Ecarts de réévaluation',1),
	(107,'PCG99-BASE','CAPIT','XXXXXX','106','103','Réserves',1),
	(108,'PCG99-BASE','CAPIT','XXXXXX','107','103','Ecart d\'equivalence',1),
	(109,'PCG99-BASE','CAPIT','XXXXXX','108','103','Compte de l\'exploitant',1),
	(110,'PCG99-BASE','CAPIT','XXXXXX','109','103','Actionnaires : capital souscrit - non appelé',1),
	(111,'PCG99-BASE','CAPIT','XXXXXX','11','1501','Report à nouveau (solde créditeur ou débiteur)',1),
	(112,'PCG99-BASE','CAPIT','XXXXXX','110','111','Report à nouveau (solde créditeur)',1),
	(113,'PCG99-BASE','CAPIT','XXXXXX','119','111','Report à nouveau (solde débiteur)',1),
	(114,'PCG99-BASE','CAPIT','XXXXXX','12','1501','Résultat de l\'exercice (bénéfice ou perte)',1),
	(115,'PCG99-BASE','CAPIT','XXXXXX','120','114','Résultat de l\'exercice (bénéfice)',1),
	(116,'PCG99-BASE','CAPIT','XXXXXX','129','114','Résultat de l\'exercice (perte)',1),
	(117,'PCG99-BASE','CAPIT','XXXXXX','13','1501','Subventions d\'investissement',1),
	(118,'PCG99-BASE','CAPIT','XXXXXX','131','117','Subventions d\'équipement',1),
	(119,'PCG99-BASE','CAPIT','XXXXXX','138','117','Autres subventions d\'investissement',1),
	(120,'PCG99-BASE','CAPIT','XXXXXX','139','117','Subventions d\'investissement inscrites au compte de résultat',1),
	(121,'PCG99-BASE','CAPIT','XXXXXX','14','1501','Provisions réglementées',1),
	(122,'PCG99-BASE','CAPIT','XXXXXX','142','121','Provisions réglementées relatives aux immobilisations',1),
	(123,'PCG99-BASE','CAPIT','XXXXXX','143','121','Provisions réglementées relatives aux stocks',1),
	(124,'PCG99-BASE','CAPIT','XXXXXX','144','121','Provisions réglementées relatives aux autres éléments de l\'actif',1),
	(125,'PCG99-BASE','CAPIT','XXXXXX','145','121','Amortissements dérogatoires',1),
	(126,'PCG99-BASE','CAPIT','XXXXXX','146','121','Provision spéciale de réévaluation',1),
	(127,'PCG99-BASE','CAPIT','XXXXXX','147','121','Plus-values réinvesties',1),
	(128,'PCG99-BASE','CAPIT','XXXXXX','148','121','Autres provisions réglementées',1),
	(129,'PCG99-BASE','CAPIT','XXXXXX','15','1501','Provisions pour risques et charges',1),
	(130,'PCG99-BASE','CAPIT','XXXXXX','151','129','Provisions pour risques',1),
	(131,'PCG99-BASE','CAPIT','XXXXXX','153','129','Provisions pour pensions et obligations similaires',1),
	(132,'PCG99-BASE','CAPIT','XXXXXX','154','129','Provisions pour restructurations',1),
	(133,'PCG99-BASE','CAPIT','XXXXXX','155','129','Provisions pour impôts',1),
	(134,'PCG99-BASE','CAPIT','XXXXXX','156','129','Provisions pour renouvellement des immobilisations (entreprises concessionnaires)',1),
	(135,'PCG99-BASE','CAPIT','XXXXXX','157','129','Provisions pour charges à répartir sur plusieurs exercices',1),
	(136,'PCG99-BASE','CAPIT','XXXXXX','158','129','Autres provisions pour charges',1),
	(137,'PCG99-BASE','CAPIT','XXXXXX','16','1501','Emprunts et dettes assimilees',1),
	(138,'PCG99-BASE','CAPIT','XXXXXX','161','137','Emprunts obligataires convertibles',1),
	(139,'PCG99-BASE','CAPIT','XXXXXX','163','137','Autres emprunts obligataires',1),
	(140,'PCG99-BASE','CAPIT','XXXXXX','164','137','Emprunts auprès des établissements de crédit',1),
	(141,'PCG99-BASE','CAPIT','XXXXXX','165','137','Dépôts et cautionnements reçus',1),
	(142,'PCG99-BASE','CAPIT','XXXXXX','166','137','Participation des salariés aux résultats',1),
	(143,'PCG99-BASE','CAPIT','XXXXXX','167','137','Emprunts et dettes assortis de conditions particulières',1),
	(144,'PCG99-BASE','CAPIT','XXXXXX','168','137','Autres emprunts et dettes assimilées',1),
	(145,'PCG99-BASE','CAPIT','XXXXXX','169','137','Primes de remboursement des obligations',1),
	(146,'PCG99-BASE','CAPIT','XXXXXX','17','1501','Dettes rattachées à des participations',1),
	(147,'PCG99-BASE','CAPIT','XXXXXX','171','146','Dettes rattachées à des participations (groupe)',1),
	(148,'PCG99-BASE','CAPIT','XXXXXX','174','146','Dettes rattachées à des participations (hors groupe)',1),
	(149,'PCG99-BASE','CAPIT','XXXXXX','178','146','Dettes rattachées à des sociétés en participation',1),
	(150,'PCG99-BASE','CAPIT','XXXXXX','18','1501','Comptes de liaison des établissements et sociétés en participation',1),
	(151,'PCG99-BASE','CAPIT','XXXXXX','181','150','Comptes de liaison des établissements',1),
	(152,'PCG99-BASE','CAPIT','XXXXXX','186','150','Biens et prestations de services échangés entre établissements (charges)',1),
	(153,'PCG99-BASE','CAPIT','XXXXXX','187','150','Biens et prestations de services échangés entre établissements (produits)',1),
	(154,'PCG99-BASE','CAPIT','XXXXXX','188','150','Comptes de liaison des sociétés en participation',1),
	(155,'PCG99-BASE','IMMO','XXXXXX','20','1502','Immobilisations incorporelles',1),
	(156,'PCG99-BASE','IMMO','XXXXXX','201','155','Frais d\'établissement',1),
	(157,'PCG99-BASE','IMMO','XXXXXX','203','155','Frais de recherche et de développement',1),
	(158,'PCG99-BASE','IMMO','XXXXXX','205','155','Concessions et droits similaires, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',1),
	(159,'PCG99-BASE','IMMO','XXXXXX','206','155','Droit au bail',1),
	(160,'PCG99-BASE','IMMO','XXXXXX','207','155','Fonds commercial',1),
	(161,'PCG99-BASE','IMMO','XXXXXX','208','155','Autres immobilisations incorporelles',1),
	(162,'PCG99-BASE','IMMO','XXXXXX','21','1502','Immobilisations corporelles',1),
	(163,'PCG99-BASE','IMMO','XXXXXX','211','162','Terrains',1),
	(164,'PCG99-BASE','IMMO','XXXXXX','212','162','Agencements et aménagements de terrains',1),
	(165,'PCG99-BASE','IMMO','XXXXXX','213','162','Constructions',1),
	(166,'PCG99-BASE','IMMO','XXXXXX','214','162','Constructions sur sol d\'autrui',1),
	(167,'PCG99-BASE','IMMO','XXXXXX','215','162','Installations techniques, matériels et outillage industriels',1),
	(168,'PCG99-BASE','IMMO','XXXXXX','218','162','Autres immobilisations corporelles',1),
	(169,'PCG99-BASE','IMMO','XXXXXX','22','1502','Immobilisations mises en concession',1),
	(170,'PCG99-BASE','IMMO','XXXXXX','23','1502','Immobilisations en cours',1),
	(171,'PCG99-BASE','IMMO','XXXXXX','231','170','Immobilisations corporelles en cours',1),
	(172,'PCG99-BASE','IMMO','XXXXXX','232','170','Immobilisations incorporelles en cours',1),
	(173,'PCG99-BASE','IMMO','XXXXXX','237','170','Avances et acomptes versés sur immobilisations incorporelles',1),
	(174,'PCG99-BASE','IMMO','XXXXXX','238','170','Avances et acomptes versés sur commandes d\'immobilisations corporelles',1),
	(175,'PCG99-BASE','IMMO','XXXXXX','25','1502','Parts dans des entreprises liées et créances sur des entreprises liées',1),
	(176,'PCG99-BASE','IMMO','XXXXXX','26','1502','Participations et créances rattachées à des participations',1),
	(177,'PCG99-BASE','IMMO','XXXXXX','261','176','Titres de participation',1),
	(178,'PCG99-BASE','IMMO','XXXXXX','266','176','Autres formes de participation',1),
	(179,'PCG99-BASE','IMMO','XXXXXX','267','176','Créances rattachées à des participations',1),
	(180,'PCG99-BASE','IMMO','XXXXXX','268','176','Créances rattachées à des sociétés en participation',1),
	(181,'PCG99-BASE','IMMO','XXXXXX','269','176','Versements restant à effectuer sur titres de participation non libérés',1),
	(182,'PCG99-BASE','IMMO','XXXXXX','27','1502','Autres immobilisations financieres',1),
	(183,'PCG99-BASE','IMMO','XXXXXX','271','183','Titres immobilisés autres que les titres immobilisés de l\'activité de portefeuille (droit de propriété)',1),
	(184,'PCG99-BASE','IMMO','XXXXXX','272','183','Titres immobilisés (droit de créance)',1),
	(185,'PCG99-BASE','IMMO','XXXXXX','273','183','Titres immobilisés de l\'activité de portefeuille',1),
	(186,'PCG99-BASE','IMMO','XXXXXX','274','183','Prêts',1),
	(187,'PCG99-BASE','IMMO','XXXXXX','275','183','Dépôts et cautionnements versés',1),
	(188,'PCG99-BASE','IMMO','XXXXXX','276','183','Autres créances immobilisées',1),
	(189,'PCG99-BASE','IMMO','XXXXXX','277','183','(Actions propres ou parts propres)',1),
	(190,'PCG99-BASE','IMMO','XXXXXX','279','183','Versements restant à effectuer sur titres immobilisés non libérés',1),
	(191,'PCG99-BASE','IMMO','XXXXXX','28','1502','Amortissements des immobilisations',1),
	(192,'PCG99-BASE','IMMO','XXXXXX','280','191','Amortissements des immobilisations incorporelles',1),
	(193,'PCG99-BASE','IMMO','XXXXXX','281','191','Amortissements des immobilisations corporelles',1),
	(194,'PCG99-BASE','IMMO','XXXXXX','282','191','Amortissements des immobilisations mises en concession',1),
	(195,'PCG99-BASE','IMMO','XXXXXX','29','1502','Dépréciations des immobilisations',1),
	(196,'PCG99-BASE','IMMO','XXXXXX','290','195','Dépréciations des immobilisations incorporelles',1),
	(197,'PCG99-BASE','IMMO','XXXXXX','291','195','Dépréciations des immobilisations corporelles',1),
	(198,'PCG99-BASE','IMMO','XXXXXX','292','195','Dépréciations des immobilisations mises en concession',1),
	(199,'PCG99-BASE','IMMO','XXXXXX','293','195','Dépréciations des immobilisations en cours',1),
	(200,'PCG99-BASE','IMMO','XXXXXX','296','195','Provisions pour dépréciation des participations et créances rattachées à des participations',1),
	(201,'PCG99-BASE','IMMO','XXXXXX','297','195','Provisions pour dépréciation des autres immobilisations financières',1),
	(202,'PCG99-BASE','STOCK','XXXXXX','31','1503','Matières premières (et fournitures)',1),
	(203,'PCG99-BASE','STOCK','XXXXXX','311','202','Matières (ou groupe) A',1),
	(204,'PCG99-BASE','STOCK','XXXXXX','312','202','Matières (ou groupe) B',1),
	(205,'PCG99-BASE','STOCK','XXXXXX','317','202','Fournitures A, B, C,',1),
	(206,'PCG99-BASE','STOCK','XXXXXX','32','1503','Autres approvisionnements',1),
	(207,'PCG99-BASE','STOCK','XXXXXX','321','206','Matières consommables',1),
	(208,'PCG99-BASE','STOCK','XXXXXX','322','206','Fournitures consommables',1),
	(209,'PCG99-BASE','STOCK','XXXXXX','326','206','Emballages',1),
	(210,'PCG99-BASE','STOCK','XXXXXX','33','1503','En-cours de production de biens',1),
	(211,'PCG99-BASE','STOCK','XXXXXX','331','210','Produits en cours',1),
	(212,'PCG99-BASE','STOCK','XXXXXX','335','210','Travaux en cours',1),
	(213,'PCG99-BASE','STOCK','XXXXXX','34','1503','En-cours de production de services',1),
	(214,'PCG99-BASE','STOCK','XXXXXX','341','213','Etudes en cours',1),
	(215,'PCG99-BASE','STOCK','XXXXXX','345','213','Prestations de services en cours',1),
	(216,'PCG99-BASE','STOCK','XXXXXX','35','1503','Stocks de produits',1),
	(217,'PCG99-BASE','STOCK','XXXXXX','351','216','Produits intermédiaires',1),
	(218,'PCG99-BASE','STOCK','XXXXXX','355','216','Produits finis',1),
	(219,'PCG99-BASE','STOCK','XXXXXX','358','216','Produits résiduels (ou matières de récupération)',1),
	(220,'PCG99-BASE','STOCK','XXXXXX','37','1503','Stocks de marchandises',1),
	(221,'PCG99-BASE','STOCK','XXXXXX','371','220','Marchandises (ou groupe) A',1),
	(222,'PCG99-BASE','STOCK','XXXXXX','372','220','Marchandises (ou groupe) B',1),
	(223,'PCG99-BASE','STOCK','XXXXXX','39','1503','Provisions pour dépréciation des stocks et en-cours',1),
	(224,'PCG99-BASE','STOCK','XXXXXX','391','223','Provisions pour dépréciation des matières premières',1),
	(225,'PCG99-BASE','STOCK','XXXXXX','392','223','Provisions pour dépréciation des autres approvisionnements',1),
	(226,'PCG99-BASE','STOCK','XXXXXX','393','223','Provisions pour dépréciation des en-cours de production de biens',1),
	(227,'PCG99-BASE','STOCK','XXXXXX','394','223','Provisions pour dépréciation des en-cours de production de services',1),
	(228,'PCG99-BASE','STOCK','XXXXXX','395','223','Provisions pour dépréciation des stocks de produits',1),
	(229,'PCG99-BASE','STOCK','XXXXXX','397','223','Provisions pour dépréciation des stocks de marchandises',1),
	(230,'PCG99-BASE','TIERS','XXXXXX','40','1504','Fournisseurs et Comptes rattachés',1),
	(231,'PCG99-BASE','TIERS','XXXXXX','400','230','Fournisseurs et Comptes rattachés',1),
	(232,'PCG99-BASE','TIERS','SUPPLIER','401','230','Fournisseurs',1),
	(233,'PCG99-BASE','TIERS','XXXXXX','403','230','Fournisseurs - Effets à payer',1),
	(234,'PCG99-BASE','TIERS','XXXXXX','404','230','Fournisseurs d\'immobilisations',1),
	(235,'PCG99-BASE','TIERS','XXXXXX','405','230','Fournisseurs d\'immobilisations - Effets à payer',1),
	(236,'PCG99-BASE','TIERS','XXXXXX','408','230','Fournisseurs - Factures non parvenues',1),
	(237,'PCG99-BASE','TIERS','XXXXXX','409','230','Fournisseurs débiteurs',1),
	(238,'PCG99-BASE','TIERS','XXXXXX','41','1504','Clients et comptes rattachés',1),
	(239,'PCG99-BASE','TIERS','XXXXXX','410','238','Clients et Comptes rattachés',1),
	(240,'PCG99-BASE','TIERS','CUSTOMER','411','238','Clients',1),
	(241,'PCG99-BASE','TIERS','XXXXXX','413','238','Clients - Effets à recevoir',1),
	(242,'PCG99-BASE','TIERS','XXXXXX','416','238','Clients douteux ou litigieux',1),
	(243,'PCG99-BASE','TIERS','XXXXXX','418','238','Clients - Produits non encore facturés',1),
	(244,'PCG99-BASE','TIERS','XXXXXX','419','238','Clients créditeurs',1),
	(245,'PCG99-BASE','TIERS','XXXXXX','42','1504','Personnel et comptes rattachés',1),
	(246,'PCG99-BASE','TIERS','XXXXXX','421','245','Personnel - Rémunérations dues',1),
	(247,'PCG99-BASE','TIERS','XXXXXX','422','245','Comités d\'entreprises, d\'établissement, ...',1),
	(248,'PCG99-BASE','TIERS','XXXXXX','424','245','Participation des salariés aux résultats',1),
	(249,'PCG99-BASE','TIERS','XXXXXX','425','245','Personnel - Avances et acomptes',1),
	(250,'PCG99-BASE','TIERS','XXXXXX','426','245','Personnel - Dépôts',1),
	(251,'PCG99-BASE','TIERS','XXXXXX','427','245','Personnel - Oppositions',1),
	(252,'PCG99-BASE','TIERS','XXXXXX','428','245','Personnel - Charges à payer et produits à recevoir',1),
	(253,'PCG99-BASE','TIERS','XXXXXX','43','1504','Sécurité sociale et autres organismes sociaux',1),
	(254,'PCG99-BASE','TIERS','XXXXXX','431','253','Sécurité sociale',1),
	(255,'PCG99-BASE','TIERS','XXXXXX','437','253','Autres organismes sociaux',1),
	(256,'PCG99-BASE','TIERS','XXXXXX','438','253','Organismes sociaux - Charges à payer et produits à recevoir',1),
	(257,'PCG99-BASE','TIERS','XXXXXX','44','1504','État et autres collectivités publiques',1),
	(258,'PCG99-BASE','TIERS','XXXXXX','441','257','État - Subventions à recevoir',1),
	(259,'PCG99-BASE','TIERS','XXXXXX','442','257','Etat - Impôts et taxes recouvrables sur des tiers',1),
	(260,'PCG99-BASE','TIERS','XXXXXX','443','257','Opérations particulières avec l\'Etat, les collectivités publiques, les organismes internationaux',1),
	(261,'PCG99-BASE','TIERS','XXXXXX','444','257','Etat - Impôts sur les bénéfices',1),
	(262,'PCG99-BASE','TIERS','XXXXXX','445','257','Etat - Taxes sur le chiffre d\'affaires',1),
	(263,'PCG99-BASE','TIERS','XXXXXX','446','257','Obligations cautionnées',1),
	(264,'PCG99-BASE','TIERS','XXXXXX','447','257','Autres impôts, taxes et versements assimilés',1),
	(265,'PCG99-BASE','TIERS','XXXXXX','448','257','Etat - Charges à payer et produits à recevoir',1),
	(266,'PCG99-BASE','TIERS','XXXXXX','449','257','Quotas d\'émission à restituer à l\'Etat',1),
	(267,'PCG99-BASE','TIERS','XXXXXX','45','1504','Groupe et associes',1),
	(268,'PCG99-BASE','TIERS','XXXXXX','451','267','Groupe',1),
	(269,'PCG99-BASE','TIERS','XXXXXX','455','267','Associés - Comptes courants',1),
	(270,'PCG99-BASE','TIERS','XXXXXX','456','267','Associés - Opérations sur le capital',1),
	(271,'PCG99-BASE','TIERS','XXXXXX','457','267','Associés - Dividendes à payer',1),
	(272,'PCG99-BASE','TIERS','XXXXXX','458','267','Associés - Opérations faites en commun et en G.I.E.',1),
	(273,'PCG99-BASE','TIERS','XXXXXX','46','1504','Débiteurs divers et créditeurs divers',1),
	(274,'PCG99-BASE','TIERS','XXXXXX','462','273','Créances sur cessions d\'immobilisations',1),
	(275,'PCG99-BASE','TIERS','XXXXXX','464','273','Dettes sur acquisitions de valeurs mobilières de placement',1),
	(276,'PCG99-BASE','TIERS','XXXXXX','465','273','Créances sur cessions de valeurs mobilières de placement',1),
	(277,'PCG99-BASE','TIERS','XXXXXX','467','273','Autres comptes débiteurs ou créditeurs',1),
	(278,'PCG99-BASE','TIERS','XXXXXX','468','273','Divers - Charges à payer et produits à recevoir',1),
	(279,'PCG99-BASE','TIERS','XXXXXX','47','1504','Comptes transitoires ou d\'attente',1),
	(280,'PCG99-BASE','TIERS','XXXXXX','471','279','Comptes d\'attente',1),
	(281,'PCG99-BASE','TIERS','XXXXXX','476','279','Différence de conversion - Actif',1),
	(282,'PCG99-BASE','TIERS','XXXXXX','477','279','Différences de conversion - Passif',1),
	(283,'PCG99-BASE','TIERS','XXXXXX','478','279','Autres comptes transitoires',1),
	(284,'PCG99-BASE','TIERS','XXXXXX','48','1504','Comptes de régularisation',1),
	(285,'PCG99-BASE','TIERS','XXXXXX','481','284','Charges à répartir sur plusieurs exercices',1),
	(286,'PCG99-BASE','TIERS','XXXXXX','486','284','Charges constatées d\'avance',1),
	(287,'PCG99-BASE','TIERS','XXXXXX','487','284','Produits constatés d\'avance',1),
	(288,'PCG99-BASE','TIERS','XXXXXX','488','284','Comptes de répartition périodique des charges et des produits',1),
	(289,'PCG99-BASE','TIERS','XXXXXX','489','284','Quotas d\'émission alloués par l\'Etat',1),
	(290,'PCG99-BASE','TIERS','XXXXXX','49','1504','Provisions pour dépréciation des comptes de tiers',1),
	(291,'PCG99-BASE','TIERS','XXXXXX','491','290','Provisions pour dépréciation des comptes de clients',1),
	(292,'PCG99-BASE','TIERS','XXXXXX','495','290','Provisions pour dépréciation des comptes du groupe et des associés',1),
	(293,'PCG99-BASE','TIERS','XXXXXX','496','290','Provisions pour dépréciation des comptes de débiteurs divers',1),
	(294,'PCG99-BASE','FINAN','XXXXXX','50','1505','Valeurs mobilières de placement',1),
	(295,'PCG99-BASE','FINAN','XXXXXX','501','294','Parts dans des entreprises liées',1),
	(296,'PCG99-BASE','FINAN','XXXXXX','502','294','Actions propres',1),
	(297,'PCG99-BASE','FINAN','XXXXXX','503','294','Actions',1),
	(298,'PCG99-BASE','FINAN','XXXXXX','504','294','Autres titres conférant un droit de propriété',1),
	(299,'PCG99-BASE','FINAN','XXXXXX','505','294','Obligations et bons émis par la société et rachetés par elle',1),
	(300,'PCG99-BASE','FINAN','XXXXXX','506','294','Obligations',1),
	(301,'PCG99-BASE','FINAN','XXXXXX','507','294','Bons du Trésor et bons de caisse à court terme',1),
	(302,'PCG99-BASE','FINAN','XXXXXX','508','294','Autres valeurs mobilières de placement et autres créances assimilées',1),
	(303,'PCG99-BASE','FINAN','XXXXXX','509','294','Versements restant à effectuer sur valeurs mobilières de placement non libérées',1),
	(304,'PCG99-BASE','FINAN','XXXXXX','51','1505','Banques, établissements financiers et assimilés',1),
	(305,'PCG99-BASE','FINAN','XXXXXX','511','304','Valeurs à l\'encaissement',1),
	(306,'PCG99-BASE','FINAN','BANK','512','304','Banques',1),
	(307,'PCG99-BASE','FINAN','XXXXXX','514','304','Chèques postaux',1),
	(308,'PCG99-BASE','FINAN','XXXXXX','515','304','\"Caisses\" du Trésor et des établissements publics',1),
	(309,'PCG99-BASE','FINAN','XXXXXX','516','304','Sociétés de bourse',1),
	(310,'PCG99-BASE','FINAN','XXXXXX','517','304','Autres organismes financiers',1),
	(311,'PCG99-BASE','FINAN','XXXXXX','518','304','Intérêts courus',1),
	(312,'PCG99-BASE','FINAN','XXXXXX','519','304','Concours bancaires courants',1),
	(313,'PCG99-BASE','FINAN','XXXXXX','52','1505','Instruments de trésorerie',1),
	(314,'PCG99-BASE','FINAN','CASH','53','1505','Caisse',1),
	(315,'PCG99-BASE','FINAN','XXXXXX','531','314','Caisse siège social',1),
	(316,'PCG99-BASE','FINAN','XXXXXX','532','314','Caisse succursale (ou usine) A',1),
	(317,'PCG99-BASE','FINAN','XXXXXX','533','314','Caisse succursale (ou usine) B',1),
	(318,'PCG99-BASE','FINAN','XXXXXX','54','1505','Régies d\'avance et accréditifs',1),
	(319,'PCG99-BASE','FINAN','XXXXXX','58','1505','Virements internes',1),
	(320,'PCG99-BASE','FINAN','XXXXXX','59','1505','Provisions pour dépréciation des comptes financiers',1),
	(321,'PCG99-BASE','FINAN','XXXXXX','590','320','Provisions pour dépréciation des valeurs mobilières de placement',1),
	(322,'PCG99-BASE','CHARGE','PRODUCT','60','1506','Achats',1),
	(323,'PCG99-BASE','CHARGE','XXXXXX','601','322','Achats stockés - Matières premières (et fournitures)',1),
	(324,'PCG99-BASE','CHARGE','XXXXXX','602','322','Achats stockés - Autres approvisionnements',1),
	(325,'PCG99-BASE','CHARGE','XXXXXX','603','322','Variations des stocks (approvisionnements et marchandises)',1),
	(326,'PCG99-BASE','CHARGE','XXXXXX','604','322','Achats stockés - Matières premières (et fournitures)',1),
	(327,'PCG99-BASE','CHARGE','XXXXXX','605','322','Achats de matériel, équipements et travaux',1),
	(328,'PCG99-BASE','CHARGE','XXXXXX','606','322','Achats non stockés de matière et fournitures',1),
	(329,'PCG99-BASE','CHARGE','XXXXXX','607','322','Achats de marchandises',1),
	(330,'PCG99-BASE','CHARGE','XXXXXX','608','322','(Compte réservé, le cas échéant, à la récapitulation des frais accessoires incorporés aux achats)',1),
	(331,'PCG99-BASE','CHARGE','XXXXXX','609','322','Rabais, remises et ristournes obtenus sur achats',1),
	(332,'PCG99-BASE','CHARGE','SERVICE','61','1506','Services extérieurs',1),
	(333,'PCG99-BASE','CHARGE','XXXXXX','611','332','Sous-traitance générale',1),
	(334,'PCG99-BASE','CHARGE','XXXXXX','612','332','Redevances de crédit-bail',1),
	(335,'PCG99-BASE','CHARGE','XXXXXX','613','332','Locations',1),
	(336,'PCG99-BASE','CHARGE','XXXXXX','614','332','Charges locatives et de copropriété',1),
	(337,'PCG99-BASE','CHARGE','XXXXXX','615','332','Entretien et réparations',1),
	(338,'PCG99-BASE','CHARGE','XXXXXX','616','332','Primes d\'assurances',1),
	(339,'PCG99-BASE','CHARGE','XXXXXX','617','332','Etudes et recherches',1),
	(340,'PCG99-BASE','CHARGE','XXXXXX','618','332','Divers',1),
	(341,'PCG99-BASE','CHARGE','XXXXXX','619','332','Rabais, remises et ristournes obtenus sur services extérieurs',1),
	(342,'PCG99-BASE','CHARGE','XXXXXX','62','1506','Autres services extérieurs',1),
	(343,'PCG99-BASE','CHARGE','XXXXXX','621','342','Personnel extérieur à l\'entreprise',1),
	(344,'PCG99-BASE','CHARGE','XXXXXX','622','342','Rémunérations d\'intermédiaires et honoraires',1),
	(345,'PCG99-BASE','CHARGE','XXXXXX','623','342','Publicité, publications, relations publiques',1),
	(346,'PCG99-BASE','CHARGE','XXXXXX','624','342','Transports de biens et transports collectifs du personnel',1),
	(347,'PCG99-BASE','CHARGE','XXXXXX','625','342','Déplacements, missions et réceptions',1),
	(348,'PCG99-BASE','CHARGE','XXXXXX','626','342','Frais postaux et de télécommunications',1),
	(349,'PCG99-BASE','CHARGE','XXXXXX','627','342','Services bancaires et assimilés',1),
	(350,'PCG99-BASE','CHARGE','XXXXXX','628','342','Divers',1),
	(351,'PCG99-BASE','CHARGE','XXXXXX','629','342','Rabais, remises et ristournes obtenus sur autres services extérieurs',1),
	(352,'PCG99-BASE','CHARGE','XXXXXX','63','1506','Impôts, taxes et versements assimilés',1),
	(353,'PCG99-BASE','CHARGE','XXXXXX','631','352','Impôts, taxes et versements assimilés sur rémunérations (administrations des impôts)',1),
	(354,'PCG99-BASE','CHARGE','XXXXXX','633','352','Impôts, taxes et versements assimilés sur rémunérations (autres organismes)',1),
	(355,'PCG99-BASE','CHARGE','XXXXXX','635','352','Autres impôts, taxes et versements assimilés (administrations des impôts)',1),
	(356,'PCG99-BASE','CHARGE','XXXXXX','637','352','Autres impôts, taxes et versements assimilés (autres organismes)',1),
	(357,'PCG99-BASE','CHARGE','XXXXXX','64','1506','Charges de personnel',1),
	(358,'PCG99-BASE','CHARGE','XXXXXX','641','357','Rémunérations du personnel',1),
	(359,'PCG99-BASE','CHARGE','XXXXXX','644','357','Rémunération du travail de l\'exploitant',1),
	(360,'PCG99-BASE','CHARGE','SOCIAL','645','357','Charges de sécurité sociale et de prévoyance',1),
	(361,'PCG99-BASE','CHARGE','XXXXXX','646','357','Cotisations sociales personnelles de l\'exploitant',1),
	(362,'PCG99-BASE','CHARGE','XXXXXX','647','357','Autres charges sociales',1),
	(363,'PCG99-BASE','CHARGE','XXXXXX','648','357','Autres charges de personnel',1),
	(364,'PCG99-BASE','CHARGE','XXXXXX','65','1506','Autres charges de gestion courante',1),
	(365,'PCG99-BASE','CHARGE','XXXXXX','651','364','Redevances pour concessions, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',1),
	(366,'PCG99-BASE','CHARGE','XXXXXX','653','364','Jetons de présence',1),
	(367,'PCG99-BASE','CHARGE','XXXXXX','654','364','Pertes sur créances irrécouvrables',1),
	(368,'PCG99-BASE','CHARGE','XXXXXX','655','364','Quote-part de résultat sur opérations faites en commun',1),
	(369,'PCG99-BASE','CHARGE','XXXXXX','658','364','Charges diverses de gestion courante',1),
	(370,'PCG99-BASE','CHARGE','XXXXXX','66','1506','Charges financières',1),
	(371,'PCG99-BASE','CHARGE','XXXXXX','661','370','Charges d\'intérêts',1),
	(372,'PCG99-BASE','CHARGE','XXXXXX','664','370','Pertes sur créances liées à des participations',1),
	(373,'PCG99-BASE','CHARGE','XXXXXX','665','370','Escomptes accordés',1),
	(374,'PCG99-BASE','CHARGE','XXXXXX','666','370','Pertes de change',1),
	(375,'PCG99-BASE','CHARGE','XXXXXX','667','370','Charges nettes sur cessions de valeurs mobilières de placement',1),
	(376,'PCG99-BASE','CHARGE','XXXXXX','668','370','Autres charges financières',1),
	(377,'PCG99-BASE','CHARGE','XXXXXX','67','1506','Charges exceptionnelles',1),
	(378,'PCG99-BASE','CHARGE','XXXXXX','671','377','Charges exceptionnelles sur opérations de gestion',1),
	(379,'PCG99-BASE','CHARGE','XXXXXX','672','377','(Compte à la disposition des entités pour enregistrer, en cours d\'exercice, les charges sur exercices antérieurs)',1),
	(380,'PCG99-BASE','CHARGE','XXXXXX','675','377','Valeurs comptables des éléments d\'actif cédés',1),
	(381,'PCG99-BASE','CHARGE','XXXXXX','678','377','Autres charges exceptionnelles',1),
	(382,'PCG99-BASE','CHARGE','XXXXXX','68','1506','Dotations aux amortissements et aux provisions',1),
	(383,'PCG99-BASE','CHARGE','XXXXXX','681','382','Dotations aux amortissements et aux provisions - Charges d\'exploitation',1),
	(384,'PCG99-BASE','CHARGE','XXXXXX','686','382','Dotations aux amortissements et aux provisions - Charges financières',1),
	(385,'PCG99-BASE','CHARGE','XXXXXX','687','382','Dotations aux amortissements et aux provisions - Charges exceptionnelles',1),
	(386,'PCG99-BASE','CHARGE','XXXXXX','69','1506','Participation des salariés - impôts sur les bénéfices et assimiles',1),
	(387,'PCG99-BASE','CHARGE','XXXXXX','691','386','Participation des salariés aux résultats',1),
	(388,'PCG99-BASE','CHARGE','XXXXXX','695','386','Impôts sur les bénéfices',1),
	(389,'PCG99-BASE','CHARGE','XXXXXX','696','386','Suppléments d\'impôt sur les sociétés liés aux distributions',1),
	(390,'PCG99-BASE','CHARGE','XXXXXX','697','386','Imposition forfaitaire annuelle des sociétés',1),
	(391,'PCG99-BASE','CHARGE','XXXXXX','698','386','Intégration fiscale',1),
	(392,'PCG99-BASE','CHARGE','XXXXXX','699','386','Produits - Reports en arrière des déficits',1),
	(393,'PCG99-BASE','PROD','XXXXXX','70','1507','Ventes de produits fabriqués, prestations de services, marchandises',1),
	(394,'PCG99-BASE','PROD','PRODUCT','701','393','Ventes de produits finis',1),
	(395,'PCG99-BASE','PROD','XXXXXX','702','393','Ventes de produits intermédiaires',1),
	(396,'PCG99-BASE','PROD','XXXXXX','703','393','Ventes de produits résiduels',1),
	(397,'PCG99-BASE','PROD','XXXXXX','704','393','Travaux',1),
	(398,'PCG99-BASE','PROD','XXXXXX','705','393','Etudes',1),
	(399,'PCG99-BASE','PROD','SERVICE','706','393','Prestations de services',1),
	(400,'PCG99-BASE','PROD','PRODUCT','707','393','Ventes de marchandises',1),
	(401,'PCG99-BASE','PROD','PRODUCT','708','393','Produits des activités annexes',1),
	(402,'PCG99-BASE','PROD','XXXXXX','709','393','Rabais, remises et ristournes accordés par l\'entreprise',1),
	(403,'PCG99-BASE','PROD','XXXXXX','71','1507','Production stockée (ou déstockage)',1),
	(404,'PCG99-BASE','PROD','XXXXXX','713','403','Variation des stocks (en-cours de production, produits)',1),
	(405,'PCG99-BASE','PROD','XXXXXX','72','1507','Production immobilisée',1),
	(406,'PCG99-BASE','PROD','XXXXXX','721','405','Immobilisations incorporelles',1),
	(407,'PCG99-BASE','PROD','XXXXXX','722','405','Immobilisations corporelles',1),
	(408,'PCG99-BASE','PROD','XXXXXX','74','1507','Subventions d\'exploitation',1),
	(409,'PCG99-BASE','PROD','XXXXXX','75','1507','Autres produits de gestion courante',1),
	(410,'PCG99-BASE','PROD','XXXXXX','751','409','Redevances pour concessions, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',1),
	(411,'PCG99-BASE','PROD','XXXXXX','752','409','Revenus des immeubles non affectés à des activités professionnelles',1),
	(412,'PCG99-BASE','PROD','XXXXXX','753','409','Jetons de présence et rémunérations d\'administrateurs, gérants,...',1),
	(413,'PCG99-BASE','PROD','XXXXXX','754','409','Ristournes perçues des coopératives (provenant des excédents)',1),
	(414,'PCG99-BASE','PROD','XXXXXX','755','409','Quotes-parts de résultat sur opérations faites en commun',1),
	(415,'PCG99-BASE','PROD','XXXXXX','758','409','Produits divers de gestion courante',1),
	(416,'PCG99-BASE','PROD','XXXXXX','76','1507','Produits financiers',1),
	(417,'PCG99-BASE','PROD','XXXXXX','761','416','Produits de participations',1),
	(418,'PCG99-BASE','PROD','XXXXXX','762','416','Produits des autres immobilisations financières',1),
	(419,'PCG99-BASE','PROD','XXXXXX','763','416','Revenus des autres créances',1),
	(420,'PCG99-BASE','PROD','XXXXXX','764','416','Revenus des valeurs mobilières de placement',1),
	(421,'PCG99-BASE','PROD','XXXXXX','765','416','Escomptes obtenus',1),
	(422,'PCG99-BASE','PROD','XXXXXX','766','416','Gains de change',1),
	(423,'PCG99-BASE','PROD','XXXXXX','767','416','Produits nets sur cessions de valeurs mobilières de placement',1),
	(424,'PCG99-BASE','PROD','XXXXXX','768','416','Autres produits financiers',1),
	(425,'PCG99-BASE','PROD','XXXXXX','77','1507','Produits exceptionnels',1),
	(426,'PCG99-BASE','PROD','XXXXXX','771','425','Produits exceptionnels sur opérations de gestion',1),
	(427,'PCG99-BASE','PROD','XXXXXX','772','425','(Compte à la disposition des entités pour enregistrer, en cours d\'exercice, les produits sur exercices antérieurs)',1),
	(428,'PCG99-BASE','PROD','XXXXXX','775','425','Produits des cessions d\'éléments d\'actif',1),
	(429,'PCG99-BASE','PROD','XXXXXX','777','425','Quote-part des subventions d\'investissement virée au résultat de l\'exercice',1),
	(430,'PCG99-BASE','PROD','XXXXXX','778','425','Autres produits exceptionnels',1),
	(431,'PCG99-BASE','PROD','XXXXXX','78','1507','Reprises sur amortissements et provisions',1),
	(432,'PCG99-BASE','PROD','XXXXXX','781','431','Reprises sur amortissements et provisions (à inscrire dans les produits d\'exploitation)',1),
	(433,'PCG99-BASE','PROD','XXXXXX','786','431','Reprises sur provisions pour risques (à inscrire dans les produits financiers)',1),
	(434,'PCG99-BASE','PROD','XXXXXX','787','431','Reprises sur provisions (à inscrire dans les produits exceptionnels)',1),
	(435,'PCG99-BASE','PROD','XXXXXX','79','1507','Transferts de charges',1),
	(436,'PCG99-BASE','PROD','XXXXXX','791','435','Transferts de charges d\'exploitation ',1),
	(437,'PCG99-BASE','PROD','XXXXXX','796','435','Transferts de charges financières',1),
	(438,'PCG99-BASE','PROD','XXXXXX','797','435','Transferts de charges exceptionnelles',1),
	(439,'PCMN-BASE','CAPIT','XXXXXX','10','1351','Capital',1),
	(440,'PCMN-BASE','CAPIT','XXXXXX','100','439','Capital souscrit ou capital personnel',1),
	(441,'PCMN-BASE','CAPIT','XXXXXX','1000','440','Capital non amorti',1),
	(442,'PCMN-BASE','CAPIT','XXXXXX','1001','440','Capital amorti',1),
	(443,'PCMN-BASE','CAPIT','XXXXXX','101','439','Capital non appelé',1),
	(444,'PCMN-BASE','CAPIT','XXXXXX','109','439','Compte de l\'exploitant',1),
	(445,'PCMN-BASE','CAPIT','XXXXXX','1090','444','Opérations courantes',1),
	(446,'PCMN-BASE','CAPIT','XXXXXX','1091','444','Impôts personnels',1),
	(447,'PCMN-BASE','CAPIT','XXXXXX','1092','444','Rémunérations et autres avantages',1),
	(448,'PCMN-BASE','CAPIT','XXXXXX','11','1351','Primes d\'émission',1),
	(449,'PCMN-BASE','CAPIT','XXXXXX','12','1351','Plus-values de réévaluation',1),
	(450,'PCMN-BASE','CAPIT','XXXXXX','120','449','Plus-values de réévaluation sur immobilisations incorporelles',1),
	(451,'PCMN-BASE','CAPIT','XXXXXX','1200','450','Plus-values de réévaluation',1),
	(452,'PCMN-BASE','CAPIT','XXXXXX','1201','450','Reprises de réductions de valeur',1),
	(453,'PCMN-BASE','CAPIT','XXXXXX','121','449','Plus-values de réévaluation sur immobilisations corporelles',1),
	(454,'PCMN-BASE','CAPIT','XXXXXX','1210','453','Plus-values de réévaluation',1),
	(455,'PCMN-BASE','CAPIT','XXXXXX','1211','453','Reprises de réductions de valeur',1),
	(456,'PCMN-BASE','CAPIT','XXXXXX','122','449','Plus-values de réévaluation sur immobilisations financières',1),
	(457,'PCMN-BASE','CAPIT','XXXXXX','1220','456','Plus-values de réévaluation',1),
	(458,'PCMN-BASE','CAPIT','XXXXXX','1221','456','Reprises de réductions de valeur',1),
	(459,'PCMN-BASE','CAPIT','XXXXXX','123','449','Plus-values de réévaluation sur stocks',1),
	(460,'PCMN-BASE','CAPIT','XXXXXX','124','449','Reprises de réductions de valeur sur placements de trésorerie',1),
	(461,'PCMN-BASE','CAPIT','XXXXXX','13','1351','Réserve',1),
	(462,'PCMN-BASE','CAPIT','XXXXXX','130','461','Réserve légale',1),
	(463,'PCMN-BASE','CAPIT','XXXXXX','131','461','Réserves indisponibles',1),
	(464,'PCMN-BASE','CAPIT','XXXXXX','1310','463','Réserve pour actions propres',1),
	(465,'PCMN-BASE','CAPIT','XXXXXX','1311','463','Autres réserves indisponibles',1),
	(466,'PCMN-BASE','CAPIT','XXXXXX','132','461','Réserves immunisées',1),
	(467,'PCMN-BASE','CAPIT','XXXXXX','133','461','Réserves disponibles',1),
	(468,'PCMN-BASE','CAPIT','XXXXXX','1330','467','Réserve pour régularisation de dividendes',1),
	(469,'PCMN-BASE','CAPIT','XXXXXX','1331','467','Réserve pour renouvellement des immobilisations',1),
	(470,'PCMN-BASE','CAPIT','XXXXXX','1332','467','Réserve pour installations en faveur du personnel 1333 Réserves libres',1),
	(471,'PCMN-BASE','CAPIT','XXXXXX','14','1351','Bénéfice reporté (ou perte reportée)',1),
	(472,'PCMN-BASE','CAPIT','XXXXXX','15','1351','Subsides en capital',1),
	(473,'PCMN-BASE','CAPIT','XXXXXX','150','472','Montants obtenus',1),
	(474,'PCMN-BASE','CAPIT','XXXXXX','151','472','Montants transférés aux résultats',1),
	(475,'PCMN-BASE','CAPIT','XXXXXX','16','1351','Provisions pour risques et charges',1),
	(476,'PCMN-BASE','CAPIT','XXXXXX','160','475','Provisions pour pensions et obligations similaires',1),
	(477,'PCMN-BASE','CAPIT','XXXXXX','161','475','Provisions pour charges fiscales',1),
	(478,'PCMN-BASE','CAPIT','XXXXXX','162','475','Provisions pour grosses réparations et gros entretiens',1),
	(479,'PCMN-BASE','CAPIT','XXXXXX','163','475','à 169 Provisions pour autres risques et charges',1),
	(480,'PCMN-BASE','CAPIT','XXXXXX','164','475','Provisions pour sûretés personnelles ou réelles constituées à l\'appui de dettes et d\'engagements de tiers',1),
	(481,'PCMN-BASE','CAPIT','XXXXXX','165','475','Provisions pour engagements relatifs à l\'acquisition ou à la cession d\'immobilisations',1),
	(482,'PCMN-BASE','CAPIT','XXXXXX','166','475','Provisions pour exécution de commandes passées ou reçues',1),
	(483,'PCMN-BASE','CAPIT','XXXXXX','167','475','Provisions pour positions et marchés à terme en devises ou positions et marchés à terme en marchandises',1),
	(484,'PCMN-BASE','CAPIT','XXXXXX','168','475','Provisions pour garanties techniques attachées aux ventes et prestations déjà effectuées par l\'entreprise',1),
	(485,'PCMN-BASE','CAPIT','XXXXXX','169','475','Provisions pour autres risques et charges',1),
	(486,'PCMN-BASE','CAPIT','XXXXXX','1690','485','Pour litiges en cours',1),
	(487,'PCMN-BASE','CAPIT','XXXXXX','1691','485','Pour amendes, doubles droits et pénalités',1),
	(488,'PCMN-BASE','CAPIT','XXXXXX','1692','485','Pour propre assureur',1),
	(489,'PCMN-BASE','CAPIT','XXXXXX','1693','485','Pour risques inhérents aux opérations de crédits à moyen ou long terme',1),
	(490,'PCMN-BASE','CAPIT','XXXXXX','1695','485','Provision pour charge de liquidation',1),
	(491,'PCMN-BASE','CAPIT','XXXXXX','1696','485','Provision pour départ de personnel',1),
	(492,'PCMN-BASE','CAPIT','XXXXXX','1699','485','Pour risques divers',1),
	(493,'PCMN-BASE','CAPIT','XXXXXX','17','1351','Dettes à plus d\'un an',1),
	(494,'PCMN-BASE','CAPIT','XXXXXX','170','493','Emprunts subordonnés',1),
	(495,'PCMN-BASE','CAPIT','XXXXXX','1700','494','Convertibles',1),
	(496,'PCMN-BASE','CAPIT','XXXXXX','1701','494','Non convertibles',1),
	(497,'PCMN-BASE','CAPIT','XXXXXX','171','493','Emprunts obligataires non subordonnés',1),
	(498,'PCMN-BASE','CAPIT','XXXXXX','1710','498','Convertibles',1),
	(499,'PCMN-BASE','CAPIT','XXXXXX','1711','498','Non convertibles',1),
	(500,'PCMN-BASE','CAPIT','XXXXXX','172','493','Dettes de location-financement et assimilés',1),
	(501,'PCMN-BASE','CAPIT','XXXXXX','1720','500','Dettes de location-financement de biens immobiliers',1),
	(502,'PCMN-BASE','CAPIT','XXXXXX','1721','500','Dettes de location-financement de biens mobiliers',1),
	(503,'PCMN-BASE','CAPIT','XXXXXX','1722','500','Dettes sur droits réels sur immeubles',1),
	(504,'PCMN-BASE','CAPIT','XXXXXX','173','493','Etablissements de crédit',1),
	(505,'PCMN-BASE','CAPIT','XXXXXX','1730','504','Dettes en compte',1),
	(506,'PCMN-BASE','CAPIT','XXXXXX','17300','505','Banque A',1),
	(507,'PCMN-BASE','CAPIT','XXXXXX','17301','505','Banque B',1),
	(508,'PCMN-BASE','CAPIT','XXXXXX','17302','505','Banque C',1),
	(509,'PCMN-BASE','CAPIT','XXXXXX','17303','505','Banque D',1),
	(510,'PCMN-BASE','CAPIT','XXXXXX','1731','504','Promesses',1),
	(511,'PCMN-BASE','CAPIT','XXXXXX','17310','510','Banque A',1),
	(512,'PCMN-BASE','CAPIT','XXXXXX','17311','510','Banque B',1),
	(513,'PCMN-BASE','CAPIT','XXXXXX','17312','510','Banque C',1),
	(514,'PCMN-BASE','CAPIT','XXXXXX','17313','510','Banque D',1),
	(515,'PCMN-BASE','CAPIT','XXXXXX','1732','504','Crédits d\'acceptation',1),
	(516,'PCMN-BASE','CAPIT','XXXXXX','17320','515','Banque A',1),
	(517,'PCMN-BASE','CAPIT','XXXXXX','17321','515','Banque B',1),
	(518,'PCMN-BASE','CAPIT','XXXXXX','17322','515','Banque C',1),
	(519,'PCMN-BASE','CAPIT','XXXXXX','17323','515','Banque D',1),
	(520,'PCMN-BASE','CAPIT','XXXXXX','174','493','Autres emprunts',1),
	(521,'PCMN-BASE','CAPIT','XXXXXX','175','493','Dettes commerciales',1),
	(522,'PCMN-BASE','CAPIT','XXXXXX','1750','521','Fournisseurs : dettes en compte',1),
	(523,'PCMN-BASE','CAPIT','XXXXXX','17500','522','Entreprises apparentées',1),
	(524,'PCMN-BASE','CAPIT','XXXXXX','175000','523','Entreprises liées',1),
	(525,'PCMN-BASE','CAPIT','XXXXXX','175001','523','Entreprises avec lesquelles il existe un lien de participation',1),
	(526,'PCMN-BASE','CAPIT','XXXXXX','17501','522','Fournisseurs ordinaires',1),
	(527,'PCMN-BASE','CAPIT','XXXXXX','175010','526','Fournisseurs belges',1),
	(528,'PCMN-BASE','CAPIT','XXXXXX','175011','526','Fournisseurs C.E.E.',1),
	(529,'PCMN-BASE','CAPIT','XXXXXX','175012','526','Fournisseurs importation',1),
	(530,'PCMN-BASE','CAPIT','XXXXXX','1751','521','Effets à payer',1),
	(531,'PCMN-BASE','CAPIT','XXXXXX','17510','530','Entreprises apparentées',1),
	(532,'PCMN-BASE','CAPIT','XXXXXX','175100','531','Entreprises liées',1),
	(533,'PCMN-BASE','CAPIT','XXXXXX','175101','531','Entreprises avec lesquelles il existe un lien de participation',1),
	(534,'PCMN-BASE','CAPIT','XXXXXX','17511','530','Fournisseurs ordinaires',1),
	(535,'PCMN-BASE','CAPIT','XXXXXX','175110','534','Fournisseurs belges',1),
	(536,'PCMN-BASE','CAPIT','XXXXXX','175111','534','Fournisseurs C.E.E.',1),
	(537,'PCMN-BASE','CAPIT','XXXXXX','175112','534','Fournisseurs importation',1),
	(538,'PCMN-BASE','CAPIT','XXXXXX','176','493','Acomptes reçus sur commandes',1),
	(539,'PCMN-BASE','CAPIT','XXXXXX','178','493','Cautionnements reçus en numéraires',1),
	(540,'PCMN-BASE','CAPIT','XXXXXX','179','493','Dettes diverses',1),
	(541,'PCMN-BASE','CAPIT','XXXXXX','1790','540','Entreprises liées',1),
	(542,'PCMN-BASE','CAPIT','XXXXXX','1791','540','Autres entreprises avec lesquelles il existe un lien de participation',1),
	(543,'PCMN-BASE','CAPIT','XXXXXX','1792','540','Administrateurs, gérants et associés',1),
	(544,'PCMN-BASE','CAPIT','XXXXXX','1794','540','Rentes viagères capitalisées',1),
	(545,'PCMN-BASE','CAPIT','XXXXXX','1798','540','Dettes envers les coparticipants des associations momentanées et en participation',1),
	(546,'PCMN-BASE','CAPIT','XXXXXX','1799','540','Autres dettes diverses',1),
	(547,'PCMN-BASE','CAPIT','XXXXXX','18','1351','Comptes de liaison des établissements et succursales',1),
	(548,'PCMN-BASE','IMMO','XXXXXX','20','1352','Frais d\'établissement',1),
	(549,'PCMN-BASE','IMMO','XXXXXX','200','548','Frais de constitution et d\'augmentation de capital',1),
	(550,'PCMN-BASE','IMMO','XXXXXX','2000','549','Frais de constitution et d\'augmentation de capital',1),
	(551,'PCMN-BASE','IMMO','XXXXXX','2009','549','Amortissements sur frais de constitution et d\'augmentation de capital',1),
	(552,'PCMN-BASE','IMMO','XXXXXX','201','548','Frais d\'émission d\'emprunts et primes de remboursement',1),
	(553,'PCMN-BASE','IMMO','XXXXXX','2010','552','Agios sur emprunts et frais d\'émission d\'emprunts',1),
	(554,'PCMN-BASE','IMMO','XXXXXX','2019','552','Amortissements sur agios sur emprunts et frais d\'émission d\'emprunts',1),
	(555,'PCMN-BASE','IMMO','XXXXXX','202','548','Autres frais d\'établissement',1),
	(556,'PCMN-BASE','IMMO','XXXXXX','2020','555','Autres frais d\'établissement',1),
	(557,'PCMN-BASE','IMMO','XXXXXX','2029','555','Amortissements sur autres frais d\'établissement',1),
	(558,'PCMN-BASE','IMMO','XXXXXX','203','548','Intérêts intercalaires',1),
	(559,'PCMN-BASE','IMMO','XXXXXX','2030','558','Intérêts intercalaires',1),
	(560,'PCMN-BASE','IMMO','XXXXXX','2039','558','Amortissements sur intérêts intercalaires',1),
	(561,'PCMN-BASE','IMMO','XXXXXX','204','548','Frais de restructuration',1),
	(562,'PCMN-BASE','IMMO','XXXXXX','2040','561','Coût des frais de restructuration',1),
	(563,'PCMN-BASE','IMMO','XXXXXX','2049','561','Amortissements sur frais de restructuration',1),
	(564,'PCMN-BASE','IMMO','XXXXXX','21','1352','Immobilisations incorporelles',1),
	(565,'PCMN-BASE','IMMO','XXXXXX','210','564','Frais de recherche et de développement',1),
	(566,'PCMN-BASE','IMMO','XXXXXX','2100','565','Frais de recherche et de mise au point',1),
	(567,'PCMN-BASE','IMMO','XXXXXX','2108','565','Plus-values actées sur frais de recherche et de mise au point',1),
	(568,'PCMN-BASE','IMMO','XXXXXX','2109','565','Amortissements sur frais de recherche et de mise au point',1),
	(569,'PCMN-BASE','IMMO','XXXXXX','211','564','Concessions, brevets, licences, savoir-faire, marque et droits similaires',1),
	(570,'PCMN-BASE','IMMO','XXXXXX','2110','569','Concessions, brevets, licences, marques, etc',1),
	(571,'PCMN-BASE','IMMO','XXXXXX','2118','569','Plus-values actées sur concessions, etc',1),
	(572,'PCMN-BASE','IMMO','XXXXXX','2119','569','Amortissements sur concessions, etc',1),
	(573,'PCMN-BASE','IMMO','XXXXXX','212','564','Goodwill',1),
	(574,'PCMN-BASE','IMMO','XXXXXX','2120','573','Coût d\'acquisition',1),
	(575,'PCMN-BASE','IMMO','XXXXXX','2128','573','Plus-values actées',1),
	(576,'PCMN-BASE','IMMO','XXXXXX','2129','573','Amortissements sur goodwill',1),
	(577,'PCMN-BASE','IMMO','XXXXXX','213','564','Acomptes versés',1),
	(578,'PCMN-BASE','IMMO','XXXXXX','22','1352','Terrains et constructions',1),
	(579,'PCMN-BASE','IMMO','XXXXXX','220','578','Terrains',1),
	(580,'PCMN-BASE','IMMO','XXXXXX','2200','579','Terrains',1),
	(581,'PCMN-BASE','IMMO','XXXXXX','2201','579','Frais d\'acquisition sur terrains',1),
	(582,'PCMN-BASE','IMMO','XXXXXX','2208','579','Plus-values actées sur terrains',1),
	(583,'PCMN-BASE','IMMO','XXXXXX','2209','579','Amortissements et réductions de valeur',1),
	(584,'PCMN-BASE','IMMO','XXXXXX','22090','583','Amortissements sur frais d\'acquisition',1),
	(585,'PCMN-BASE','IMMO','XXXXXX','22091','583','Réductions de valeur sur terrains',1),
	(586,'PCMN-BASE','IMMO','XXXXXX','221','578','Constructions',1),
	(587,'PCMN-BASE','IMMO','XXXXXX','2210','586','Bâtiments industriels',1),
	(588,'PCMN-BASE','IMMO','XXXXXX','2211','586','Bâtiments administratifs et commerciaux',1),
	(589,'PCMN-BASE','IMMO','XXXXXX','2212','586','Autres bâtiments d\'exploitation',1),
	(590,'PCMN-BASE','IMMO','XXXXXX','2213','586','Voies de transport et ouvrages d\'art',1),
	(591,'PCMN-BASE','IMMO','XXXXXX','2215','586','Constructions sur sol d\'autrui',1),
	(592,'PCMN-BASE','IMMO','XXXXXX','2216','586','Frais d\'acquisition sur constructions',1),
	(593,'PCMN-BASE','IMMO','XXXXXX','2218','586','Plus-values actées',1),
	(594,'PCMN-BASE','IMMO','XXXXXX','22180','593','Sur bâtiments industriels',1),
	(595,'PCMN-BASE','IMMO','XXXXXX','22181','593','Sur bâtiments administratifs et commerciaux',1),
	(596,'PCMN-BASE','IMMO','XXXXXX','22182','593','Sur autres bâtiments d\'exploitation',1),
	(597,'PCMN-BASE','IMMO','XXXXXX','22184','593','Sur voies de transport et ouvrages d\'art',1),
	(598,'PCMN-BASE','IMMO','XXXXXX','2219','586','Amortissements sur constructions',1),
	(599,'PCMN-BASE','IMMO','XXXXXX','22190','598','Sur bâtiments industriels',1),
	(600,'PCMN-BASE','IMMO','XXXXXX','22191','598','Sur bâtiments administratifs et commerciaux',1),
	(601,'PCMN-BASE','IMMO','XXXXXX','22192','598','Sur autres bâtiments d\'exploitation',1),
	(602,'PCMN-BASE','IMMO','XXXXXX','22194','598','Sur voies de transport et ouvrages d\'art',1),
	(603,'PCMN-BASE','IMMO','XXXXXX','22195','598','Sur constructions sur sol d\'autrui',1),
	(604,'PCMN-BASE','IMMO','XXXXXX','22196','598','Sur frais d\'acquisition sur constructions',1),
	(605,'PCMN-BASE','IMMO','XXXXXX','222','578','Terrains bâtis',1),
	(606,'PCMN-BASE','IMMO','XXXXXX','2220','605','Valeur d\'acquisition',1),
	(607,'PCMN-BASE','IMMO','XXXXXX','22200','606','Bâtiments industriels',1),
	(608,'PCMN-BASE','IMMO','XXXXXX','22201','606','Bâtiments administratifs et commerciaux',1),
	(609,'PCMN-BASE','IMMO','XXXXXX','22202','606','Autres bâtiments d\'exploitation',1),
	(610,'PCMN-BASE','IMMO','XXXXXX','22203','606','Voies de transport et ouvrages d\'art',1),
	(611,'PCMN-BASE','IMMO','XXXXXX','22204','606','Frais d\'acquisition des terrains à bâtir',1),
	(612,'PCMN-BASE','IMMO','XXXXXX','2228','605','Plus-values actées',1),
	(613,'PCMN-BASE','IMMO','XXXXXX','22280','612','Sur bâtiments industriels',1),
	(614,'PCMN-BASE','IMMO','XXXXXX','22281','612','Sur bâtiments administratifs et commerciaux',1),
	(615,'PCMN-BASE','IMMO','XXXXXX','22282','612','Sur autres bâtiments d\'exploitation',1),
	(616,'PCMN-BASE','IMMO','XXXXXX','22283','612','Sur voies de transport et ouvrages d\'art',1),
	(617,'PCMN-BASE','IMMO','XXXXXX','2229','605','Amortissements sur terrains bâtis',1),
	(618,'PCMN-BASE','IMMO','XXXXXX','22290','617','Sur bâtiments industriels',1),
	(619,'PCMN-BASE','IMMO','XXXXXX','22291','617','Sur bâtiments administratifs et commerciaux',1),
	(620,'PCMN-BASE','IMMO','XXXXXX','22292','617','Sur autres bâtiments d\'exploitation',1),
	(621,'PCMN-BASE','IMMO','XXXXXX','22293','617','Sur voies de transport et ouvrages d\'art',1),
	(622,'PCMN-BASE','IMMO','XXXXXX','22294','617','Sur frais d\'acquisition des terrains bâtis',1),
	(623,'PCMN-BASE','IMMO','XXXXXX','223','578','Autres droits réels sur des immeubles',1),
	(624,'PCMN-BASE','IMMO','XXXXXX','2230','623','Valeur d\'acquisition',1),
	(625,'PCMN-BASE','IMMO','XXXXXX','2238','623','Plus-values actées',1),
	(626,'PCMN-BASE','IMMO','XXXXXX','2239','623','Amortissements',1),
	(627,'PCMN-BASE','IMMO','XXXXXX','23','1352','Installations, machines et outillages',1),
	(628,'PCMN-BASE','IMMO','XXXXXX','230','627','Installations',1),
	(629,'PCMN-BASE','IMMO','XXXXXX','2300','628','Installations bâtiments industriels',1),
	(630,'PCMN-BASE','IMMO','XXXXXX','2301','628','Installations bâtiments administratifs et commerciaux',1),
	(631,'PCMN-BASE','IMMO','XXXXXX','2302','628','Installations bâtiments d\'exploitation',1),
	(632,'PCMN-BASE','IMMO','XXXXXX','2303','628','Installations voies de transport et ouvrages d\'art',1),
	(633,'PCMN-BASE','IMMO','XXXXXX','2300','628','Installation d\'eau',1),
	(634,'PCMN-BASE','IMMO','XXXXXX','2301','628','Installation d\'électricité',1),
	(635,'PCMN-BASE','IMMO','XXXXXX','2302','628','Installation de vapeur',1),
	(636,'PCMN-BASE','IMMO','XXXXXX','2303','628','Installation de gaz',1),
	(637,'PCMN-BASE','IMMO','XXXXXX','2304','628','Installation de chauffage',1),
	(638,'PCMN-BASE','IMMO','XXXXXX','2305','628','Installation de conditionnement d\'air',1),
	(639,'PCMN-BASE','IMMO','XXXXXX','2306','628','Installation de chargement',1),
	(640,'PCMN-BASE','IMMO','XXXXXX','231','627','Machines',1),
	(641,'PCMN-BASE','IMMO','XXXXXX','2310','640','Division A',1),
	(642,'PCMN-BASE','IMMO','XXXXXX','2311','640','Division B',1),
	(643,'PCMN-BASE','IMMO','XXXXXX','2312','640','Division C',1),
	(644,'PCMN-BASE','IMMO','XXXXXX','237','627','Outillage',1),
	(645,'PCMN-BASE','IMMO','XXXXXX','2370','644','Division A',1),
	(646,'PCMN-BASE','IMMO','XXXXXX','2371','644','Division B',1),
	(647,'PCMN-BASE','IMMO','XXXXXX','2372','644','Division C',1),
	(648,'PCMN-BASE','IMMO','XXXXXX','238','627','Plus-values actées',1),
	(649,'PCMN-BASE','IMMO','XXXXXX','2380','648','Sur installations',1),
	(650,'PCMN-BASE','IMMO','XXXXXX','2381','648','Sur machines',1),
	(651,'PCMN-BASE','IMMO','XXXXXX','2382','648','Sur outillage',1),
	(652,'PCMN-BASE','IMMO','XXXXXX','239','627','Amortissements',1),
	(653,'PCMN-BASE','IMMO','XXXXXX','2390','652','Sur installations',1),
	(654,'PCMN-BASE','IMMO','XXXXXX','2391','652','Sur machines',1),
	(655,'PCMN-BASE','IMMO','XXXXXX','2392','652','Sur outillage',1),
	(656,'PCMN-BASE','IMMO','XXXXXX','24','1352','Mobilier et matériel roulant',1),
	(657,'PCMN-BASE','IMMO','XXXXXX','240','656','Mobilier',1),
	(658,'PCMN-BASE','IMMO','XXXXXX','2400','656','Mobilier',1),
	(659,'PCMN-BASE','IMMO','XXXXXX','24000','658','Mobilier des bâtiments industriels',1),
	(660,'PCMN-BASE','IMMO','XXXXXX','24001','658','Mobilier des bâtiments administratifs et commerciaux',1),
	(661,'PCMN-BASE','IMMO','XXXXXX','24002','658','Mobilier des autres bâtiments d\'exploitation',1),
	(662,'PCMN-BASE','IMMO','XXXXXX','24003','658','Mobilier oeuvres sociales',1),
	(663,'PCMN-BASE','IMMO','XXXXXX','2401','657','Matériel de bureau et de service social',1),
	(664,'PCMN-BASE','IMMO','XXXXXX','24010','663','Des bâtiments industriels',1),
	(665,'PCMN-BASE','IMMO','XXXXXX','24011','663','Des bâtiments administratifs et commerciaux',1),
	(666,'PCMN-BASE','IMMO','XXXXXX','24012','663','Des autres bâtiments d\'exploitation',1),
	(667,'PCMN-BASE','IMMO','XXXXXX','24013','663','Des oeuvres sociales',1),
	(668,'PCMN-BASE','IMMO','XXXXXX','2408','657','Plus-values actées',1),
	(669,'PCMN-BASE','IMMO','XXXXXX','24080','668','Plus-values actées sur mobilier',1),
	(670,'PCMN-BASE','IMMO','XXXXXX','24081','668','Plus-values actées sur matériel de bureau et service social',1),
	(671,'PCMN-BASE','IMMO','XXXXXX','2409','657','Amortissements',1),
	(672,'PCMN-BASE','IMMO','XXXXXX','24090','671','Amortissements sur mobilier',1),
	(673,'PCMN-BASE','IMMO','XXXXXX','24091','671','Amortissements sur matériel de bureau et service social',1),
	(674,'PCMN-BASE','IMMO','XXXXXX','241','656','Matériel roulant',1),
	(675,'PCMN-BASE','IMMO','XXXXXX','2410','674','Matériel automobile',1),
	(676,'PCMN-BASE','IMMO','XXXXXX','24100','675','Voitures',1),
	(677,'PCMN-BASE','IMMO','XXXXXX','24105','675','Camions',1),
	(678,'PCMN-BASE','IMMO','XXXXXX','2411','674','Matériel ferroviaire',1),
	(679,'PCMN-BASE','IMMO','XXXXXX','2412','674','Matériel fluvial',1),
	(680,'PCMN-BASE','IMMO','XXXXXX','2413','674','Matériel naval',1),
	(681,'PCMN-BASE','IMMO','XXXXXX','2414','674','Matériel aérien',1),
	(682,'PCMN-BASE','IMMO','XXXXXX','2418','674','Plus-values sur matériel roulant',1),
	(683,'PCMN-BASE','IMMO','XXXXXX','24180','682','Plus-values sur matériel automobile',1),
	(684,'PCMN-BASE','IMMO','XXXXXX','24181','682','Idem sur matériel ferroviaire',1),
	(685,'PCMN-BASE','IMMO','XXXXXX','24182','682','Idem sur matériel fluvial',1),
	(686,'PCMN-BASE','IMMO','XXXXXX','24183','682','Idem sur matériel naval',1),
	(687,'PCMN-BASE','IMMO','XXXXXX','24184','682','Idem sur matériel aérien',1),
	(688,'PCMN-BASE','IMMO','XXXXXX','2419','674','Amortissements sur matériel roulant',1),
	(689,'PCMN-BASE','IMMO','XXXXXX','24190','688','Amortissements sur matériel automobile',1),
	(690,'PCMN-BASE','IMMO','XXXXXX','24191','688','Idem sur matériel ferroviaire',1),
	(691,'PCMN-BASE','IMMO','XXXXXX','24192','688','Idem sur matériel fluvial',1),
	(692,'PCMN-BASE','IMMO','XXXXXX','24193','688','Idem sur matériel naval',1),
	(693,'PCMN-BASE','IMMO','XXXXXX','24194','688','Idem sur matériel aérien',1),
	(694,'PCMN-BASE','IMMO','XXXXXX','25','1352','Immobilisation détenues en location-financement et droits similaires',1),
	(695,'PCMN-BASE','IMMO','XXXXXX','250','694','Terrains et constructions',1),
	(696,'PCMN-BASE','IMMO','XXXXXX','2500','695','Terrains',1),
	(697,'PCMN-BASE','IMMO','XXXXXX','2501','695','Constructions',1),
	(698,'PCMN-BASE','IMMO','XXXXXX','2508','695','Plus-values sur emphytéose,  leasing et droits similaires : terrains et constructions',1),
	(699,'PCMN-BASE','IMMO','XXXXXX','2509','695','Amortissements et réductions de valeur sur terrains et constructions en leasing',1),
	(700,'PCMN-BASE','IMMO','XXXXXX','251','694','Installations,  machines et outillage',1),
	(701,'PCMN-BASE','IMMO','XXXXXX','2510','700','Installations',1),
	(702,'PCMN-BASE','IMMO','XXXXXX','2511','700','Machines',1),
	(703,'PCMN-BASE','IMMO','XXXXXX','2512','700','Outillage',1),
	(704,'PCMN-BASE','IMMO','XXXXXX','2518','700','Plus-values actées sur installations machines et outillage pris en leasing',1),
	(705,'PCMN-BASE','IMMO','XXXXXX','2519','700','Amortissements sur installations machines et outillage pris en leasing',1),
	(706,'PCMN-BASE','IMMO','XXXXXX','252','694','Mobilier et matériel roulant',1),
	(707,'PCMN-BASE','IMMO','XXXXXX','2520','706','Mobilier',1),
	(708,'PCMN-BASE','IMMO','XXXXXX','2521','706','Matériel roulant',1),
	(709,'PCMN-BASE','IMMO','XXXXXX','2528','706','Plus-values actées sur mobilier et matériel roulant en leasing',1),
	(710,'PCMN-BASE','IMMO','XXXXXX','2529','706','Amortissements sur mobilier et matériel roulant en leasing',1),
	(711,'PCMN-BASE','IMMO','XXXXXX','26','1352','Autres immobilisations corporelles',1),
	(712,'PCMN-BASE','IMMO','XXXXXX','260','711','Frais d\'aménagements de locaux pris en location',1),
	(713,'PCMN-BASE','IMMO','XXXXXX','261','711','Maison d\'habitation',1),
	(714,'PCMN-BASE','IMMO','XXXXXX','262','711','Réserve immobilière',1),
	(715,'PCMN-BASE','IMMO','XXXXXX','263','711','Matériel d\'emballage',1),
	(716,'PCMN-BASE','IMMO','XXXXXX','264','711','Emballages récupérables',1),
	(717,'PCMN-BASE','IMMO','XXXXXX','268','711','Plus-values actées sur autres immobilisations corporelles',1),
	(718,'PCMN-BASE','IMMO','XXXXXX','269','711','Amortissements sur autres immobilisations corporelles',1),
	(719,'PCMN-BASE','IMMO','XXXXXX','2690','718','Amortissements sur frais d\'aménagement des locaux pris en location',1),
	(720,'PCMN-BASE','IMMO','XXXXXX','2691','718','Amortissements sur maison d\'habitation',1),
	(721,'PCMN-BASE','IMMO','XXXXXX','2692','718','Amortissements sur réserve immobilière',1),
	(722,'PCMN-BASE','IMMO','XXXXXX','2693','718','Amortissements sur matériel d\'emballage',1),
	(723,'PCMN-BASE','IMMO','XXXXXX','2694','718','Amortissements sur emballages récupérables',1),
	(724,'PCMN-BASE','IMMO','XXXXXX','27','1352','Immobilisations corporelles en cours et acomptes versés',1),
	(725,'PCMN-BASE','IMMO','XXXXXX','270','724','Immobilisations en cours',1),
	(726,'PCMN-BASE','IMMO','XXXXXX','2700','725','Constructions',1),
	(727,'PCMN-BASE','IMMO','XXXXXX','2701','725','Installations machines et outillage',1),
	(728,'PCMN-BASE','IMMO','XXXXXX','2702','725','Mobilier et matériel roulant',1),
	(729,'PCMN-BASE','IMMO','XXXXXX','2703','725','Autres immobilisations corporelles',1),
	(730,'PCMN-BASE','IMMO','XXXXXX','271','724','Avances et acomptes versés sur immobilisations en cours',1),
	(731,'PCMN-BASE','IMMO','XXXXXX','28','1352','Immobilisations financières',1),
	(732,'PCMN-BASE','IMMO','XXXXXX','280','731','Participations dans des entreprises liées',1),
	(733,'PCMN-BASE','IMMO','XXXXXX','2800','732','Valeur d\'acquisition (peut être subdivisé par participation)',1),
	(734,'PCMN-BASE','IMMO','XXXXXX','2801','732','Montants non appelés (idem)',1),
	(735,'PCMN-BASE','IMMO','XXXXXX','2808','732','Plus-values actées (idem)',1),
	(736,'PCMN-BASE','IMMO','XXXXXX','2809','732','Réductions de valeurs actées (idem)',1),
	(737,'PCMN-BASE','IMMO','XXXXXX','281','731','Créances sur des entreprises liées',1),
	(738,'PCMN-BASE','IMMO','XXXXXX','2810','737','Créances en compte',1),
	(739,'PCMN-BASE','IMMO','XXXXXX','2811','737','Effets à recevoir',1),
	(740,'PCMN-BASE','IMMO','XXXXXX','2812','737','Titres à revenu fixes',1),
	(741,'PCMN-BASE','IMMO','XXXXXX','2817','737','Créances douteuses',1),
	(742,'PCMN-BASE','IMMO','XXXXXX','2819','737','Réductions de valeurs actées',1),
	(743,'PCMN-BASE','IMMO','XXXXXX','282','731','Participations dans des entreprises avec lesquelles il existe un lien de participation',1),
	(744,'PCMN-BASE','IMMO','XXXXXX','2820','743','Valeur d\'acquisition (peut être subdivisé par participation)',1),
	(745,'PCMN-BASE','IMMO','XXXXXX','2821','743','Montants non appelés (idem)',1),
	(746,'PCMN-BASE','IMMO','XXXXXX','2828','743','Plus-values actées (idem)',1),
	(747,'PCMN-BASE','IMMO','XXXXXX','2829','743','Réductions de valeurs actées (idem)',1),
	(748,'PCMN-BASE','IMMO','XXXXXX','283','731','Créances sur des entreprises avec lesquelles il existe un lien de participation',1),
	(749,'PCMN-BASE','IMMO','XXXXXX','2830','748','Créances en compte',1),
	(750,'PCMN-BASE','IMMO','XXXXXX','2831','748','Effets à recevoir',1),
	(751,'PCMN-BASE','IMMO','XXXXXX','2832','748','Titres à revenu fixe',1),
	(752,'PCMN-BASE','IMMO','XXXXXX','2837','748','Créances douteuses',1),
	(753,'PCMN-BASE','IMMO','XXXXXX','2839','748','Réductions de valeurs actées',1),
	(754,'PCMN-BASE','IMMO','XXXXXX','284','731','Autres actions et parts',1),
	(755,'PCMN-BASE','IMMO','XXXXXX','2840','754','Valeur d\'acquisition',1),
	(756,'PCMN-BASE','IMMO','XXXXXX','2841','754','Montants non appelés',1),
	(757,'PCMN-BASE','IMMO','XXXXXX','2848','754','Plus-values actées',1),
	(758,'PCMN-BASE','IMMO','XXXXXX','2849','754','Réductions de valeur actées',1),
	(759,'PCMN-BASE','IMMO','XXXXXX','285','731','Autres créances',1),
	(760,'PCMN-BASE','IMMO','XXXXXX','2850','759','Créances en compte',1),
	(761,'PCMN-BASE','IMMO','XXXXXX','2851','759','Effets à recevoir',1),
	(762,'PCMN-BASE','IMMO','XXXXXX','2852','759','Titres à revenu fixe',1),
	(763,'PCMN-BASE','IMMO','XXXXXX','2857','759','Créances douteuses',1),
	(764,'PCMN-BASE','IMMO','XXXXXX','2859','759','Réductions de valeur actées',1),
	(765,'PCMN-BASE','IMMO','XXXXXX','288','731','Cautionnements versés en numéraires',1),
	(766,'PCMN-BASE','IMMO','XXXXXX','2880','765','Téléphone, téléfax, télex',1),
	(767,'PCMN-BASE','IMMO','XXXXXX','2881','765','Gaz',1),
	(768,'PCMN-BASE','IMMO','XXXXXX','2882','765','Eau',1),
	(769,'PCMN-BASE','IMMO','XXXXXX','2883','765','Electricité',1),
	(770,'PCMN-BASE','IMMO','XXXXXX','2887','765','Autres cautionnements versés en numéraires',1),
	(771,'PCMN-BASE','IMMO','XXXXXX','29','1352','Créances à plus d\'un an',1),
	(772,'PCMN-BASE','IMMO','XXXXXX','290','771','Créances commerciales',1),
	(773,'PCMN-BASE','IMMO','XXXXXX','2900','772','Clients',1),
	(774,'PCMN-BASE','IMMO','XXXXXX','29000','773','Créances en compte sur entreprises liées',1),
	(775,'PCMN-BASE','IMMO','XXXXXX','29001','773','Sur entreprises avec lesquelles il existe un lien de participation',1),
	(776,'PCMN-BASE','IMMO','XXXXXX','29002','773','Sur clients Belgique',1),
	(777,'PCMN-BASE','IMMO','XXXXXX','29003','773','Sur clients C.E.E.',1),
	(778,'PCMN-BASE','IMMO','XXXXXX','29004','773','Sur clients exportation hors C.E.E.',1),
	(779,'PCMN-BASE','IMMO','XXXXXX','29005','773','Créances sur les coparticipants (associations momentanées)',1),
	(780,'PCMN-BASE','IMMO','XXXXXX','2901','772','Effets à recevoir',1),
	(781,'PCMN-BASE','IMMO','XXXXXX','29010','780','Sur entreprises liées',1),
	(782,'PCMN-BASE','IMMO','XXXXXX','29011','780','Sur entreprises avec lesquelles il existe un lien de participation',1),
	(783,'PCMN-BASE','IMMO','XXXXXX','29012','780','Sur clients Belgique',1),
	(784,'PCMN-BASE','IMMO','XXXXXX','29013','780','Sur clients C.E.E.',1),
	(785,'PCMN-BASE','IMMO','XXXXXX','29014','780','Sur clients exportation hors C.E.E.',1),
	(786,'PCMN-BASE','IMMO','XXXXXX','2905','772','Retenues sur garanties',1),
	(787,'PCMN-BASE','IMMO','XXXXXX','2906','772','Acomptes versés',1),
	(788,'PCMN-BASE','IMMO','XXXXXX','2907','772','Créances douteuses (à ventiler comme clients 2900)',1),
	(789,'PCMN-BASE','IMMO','XXXXXX','2909','772','Réductions de valeur actées (à ventiler comme clients 2900)',1),
	(790,'PCMN-BASE','IMMO','XXXXXX','291','771','Autres créances',1),
	(791,'PCMN-BASE','IMMO','XXXXXX','2910','790','Créances en compte',1),
	(792,'PCMN-BASE','IMMO','XXXXXX','29100','791','Sur entreprises liées',1),
	(793,'PCMN-BASE','IMMO','XXXXXX','29101','791','Sur entreprises avec lesquelles il existe un lien de participation',1),
	(794,'PCMN-BASE','IMMO','XXXXXX','29102','791','Sur autres débiteurs',1),
	(795,'PCMN-BASE','IMMO','XXXXXX','2911','790','Effets à recevoir',1),
	(796,'PCMN-BASE','IMMO','XXXXXX','29110','795','Sur entreprises liées',1),
	(797,'PCMN-BASE','IMMO','XXXXXX','29111','795','Sur entreprises avec lesquelles il existe un lien de participation',1),
	(798,'PCMN-BASE','IMMO','XXXXXX','29112','795','Sur autres débiteurs',1),
	(799,'PCMN-BASE','IMMO','XXXXXX','2912','790','Créances résultant de la cession d\'immobilisations données en leasing',1),
	(800,'PCMN-BASE','IMMO','XXXXXX','2917','790','Créances douteuses',1),
	(801,'PCMN-BASE','IMMO','XXXXXX','2919','790','Réductions de valeur actées',1),
	(802,'PCMN-BASE','STOCK','XXXXXX','30','1353','Approvisionnements - matières premières',1),
	(803,'PCMN-BASE','STOCK','XXXXXX','300','802','Valeur d\'acquisition',1),
	(804,'PCMN-BASE','STOCK','XXXXXX','309','802','Réductions de valeur actées',1),
	(805,'PCMN-BASE','STOCK','XXXXXX','31','1353','Approvsionnements et fournitures',1),
	(806,'PCMN-BASE','STOCK','XXXXXX','310','805','Valeur d\'acquisition',1),
	(807,'PCMN-BASE','STOCK','XXXXXX','3100','806','Matières d\'approvisionnement',1),
	(808,'PCMN-BASE','STOCK','XXXXXX','3101','806','Energie, charbon, coke, mazout, essence, propane',1),
	(809,'PCMN-BASE','STOCK','XXXXXX','3102','806','Produits d\'entretien',1),
	(810,'PCMN-BASE','STOCK','XXXXXX','3103','806','Fournitures diverses et petit outillage',1),
	(811,'PCMN-BASE','STOCK','XXXXXX','3104','806','Imprimés et fournitures de bureau',1),
	(812,'PCMN-BASE','STOCK','XXXXXX','3105','806','Fournitures de services sociaux',1),
	(813,'PCMN-BASE','STOCK','XXXXXX','3106','806','Emballages commerciaux',1),
	(814,'PCMN-BASE','STOCK','XXXXXX','31060','813','Emballages perdus',1),
	(815,'PCMN-BASE','STOCK','XXXXXX','31061','813','Emballages récupérables',1),
	(816,'PCMN-BASE','STOCK','XXXXXX','319','805','Réductions de valeur actées',1),
	(817,'PCMN-BASE','STOCK','XXXXXX','32','1353','En cours de fabrication',1),
	(818,'PCMN-BASE','STOCK','XXXXXX','320','817','Valeur d\'acquisition',1),
	(819,'PCMN-BASE','STOCK','XXXXXX','3200','818','Produits semi-ouvrés',1),
	(820,'PCMN-BASE','STOCK','XXXXXX','3201','818','Produits en cours de fabrication',1),
	(821,'PCMN-BASE','STOCK','XXXXXX','3202','818','Travaux en cours',1),
	(822,'PCMN-BASE','STOCK','XXXXXX','3205','818','Déchets',1),
	(823,'PCMN-BASE','STOCK','XXXXXX','3206','818','Rebuts',1),
	(824,'PCMN-BASE','STOCK','XXXXXX','3209','818','Travaux en association momentanée',1),
	(825,'PCMN-BASE','STOCK','XXXXXX','329','817','Réductions de valeur actées',1),
	(826,'PCMN-BASE','STOCK','XXXXXX','33','1353','Produits finis',1),
	(827,'PCMN-BASE','STOCK','XXXXXX','330','826','Valeur d\'acquisition',1),
	(828,'PCMN-BASE','STOCK','XXXXXX','3300','827','Produits finis',1),
	(829,'PCMN-BASE','STOCK','XXXXXX','339','826','Réductions de valeur actées',1),
	(830,'PCMN-BASE','STOCK','XXXXXX','34','1353','Marchandises',1),
	(831,'PCMN-BASE','STOCK','XXXXXX','340','830','Valeur d\'acquisition',1),
	(832,'PCMN-BASE','STOCK','XXXXXX','3400','831','Groupe A',1),
	(833,'PCMN-BASE','STOCK','XXXXXX','3401','831','Groupe B',1),
	(834,'PCMN-BASE','STOCK','XXXXXX','3402','831','Groupe C',1),
	(835,'PCMN-BASE','STOCK','XXXXXX','349','830','Réductions de valeur actées',1),
	(836,'PCMN-BASE','STOCK','XXXXXX','35','1353','Immeubles destinés à la vente',1),
	(837,'PCMN-BASE','STOCK','XXXXXX','350','836','Valeur d\'acquisition',1),
	(838,'PCMN-BASE','STOCK','XXXXXX','3500','837','Immeuble A',1),
	(839,'PCMN-BASE','STOCK','XXXXXX','3501','837','Immeuble B',1),
	(840,'PCMN-BASE','STOCK','XXXXXX','3502','837','Immeuble C',1),
	(841,'PCMN-BASE','STOCK','XXXXXX','351','836','Immeubles construits en vue de leur revente',1),
	(842,'PCMN-BASE','STOCK','XXXXXX','3510','841','Immeuble A',1),
	(843,'PCMN-BASE','STOCK','XXXXXX','3511','841','Immeuble B',1),
	(844,'PCMN-BASE','STOCK','XXXXXX','3512','841','Immeuble C',1),
	(845,'PCMN-BASE','STOCK','XXXXXX','359','836','Réductions de valeurs actées',1),
	(846,'PCMN-BASE','STOCK','XXXXXX','36','1353','Acomptes versés sur achats pour stocks',1),
	(847,'PCMN-BASE','STOCK','XXXXXX','360','846','Acomptes versés (à ventiler éventuellement par catégorie)',1),
	(848,'PCMN-BASE','STOCK','XXXXXX','369','846','Réductions de valeur actées',1),
	(849,'PCMN-BASE','STOCK','XXXXXX','37','1353','Commandes en cours d\'exécution',1),
	(850,'PCMN-BASE','STOCK','XXXXXX','370','849','Valeur d\'acquisition',1),
	(851,'PCMN-BASE','STOCK','XXXXXX','371','849','Bénéfice pris en compte',1),
	(852,'PCMN-BASE','STOCK','XXXXXX','379','849','Réductions de valeur actées',1),
	(853,'PCMN-BASE','TIERS','XXXXXX','40','1354','Créances commerciales',1),
	(854,'PCMN-BASE','TIERS','XXXXXX','400','853','Clients',1),
	(855,'PCMN-BASE','TIERS','XXXXXX','4007','854','Rabais, remises et  ristournes à accorder et autres notes de crédit à établir',1),
	(856,'PCMN-BASE','TIERS','XXXXXX','4008','854','Créances résultant de livraisons de biens (associations momentanées)',1),
	(857,'PCMN-BASE','TIERS','XXXXXX','401','853','Effets à recevoir',1),
	(858,'PCMN-BASE','TIERS','XXXXXX','4010','857','Effets à recevoir',1),
	(859,'PCMN-BASE','TIERS','XXXXXX','4013','857','Effets à l\'encaissement',1),
	(860,'PCMN-BASE','TIERS','XXXXXX','4015','857','Effets à l\'escompte',1),
	(861,'PCMN-BASE','TIERS','XXXXXX','402','853','Clients, créances courantes, entreprises apparentées, administrateurs et gérants',1),
	(862,'PCMN-BASE','TIERS','XXXXXX','4020','861','Entreprises liées',1),
	(863,'PCMN-BASE','TIERS','XXXXXX','4021','861','Autres entreprises avec lesquelles il existe un lien de participation',1),
	(864,'PCMN-BASE','TIERS','XXXXXX','4022','861','Administrateurs et gérants d\'entreprise',1),
	(865,'PCMN-BASE','TIERS','XXXXXX','403','853','Effets à recevoir sur entreprises apparentées et administrateurs et gérants',1),
	(866,'PCMN-BASE','TIERS','XXXXXX','4030','865','Entreprises liées',1),
	(867,'PCMN-BASE','TIERS','XXXXXX','4031','865','Autres entreprises avec lesquelles il existe un lien de participation',1),
	(868,'PCMN-BASE','TIERS','XXXXXX','4032','865','Administrateurs et gérants de l\'entreprise',1),
	(869,'PCMN-BASE','TIERS','XXXXXX','404','853','Produits à recevoir (factures à établir)',1),
	(870,'PCMN-BASE','TIERS','XXXXXX','405','853','Clients : retenues sur garanties',1),
	(871,'PCMN-BASE','TIERS','XXXXXX','406','853','Acomptes versés',1),
	(872,'PCMN-BASE','TIERS','XXXXXX','407','853','Créances douteuses',1),
	(873,'PCMN-BASE','TIERS','XXXXXX','408','853','Compensation clients',1),
	(874,'PCMN-BASE','TIERS','XXXXXX','409','853','Réductions de valeur actées',1),
	(875,'PCMN-BASE','TIERS','XXXXXX','41','1354','Autres créances',1),
	(876,'PCMN-BASE','TIERS','XXXXXX','410','875','Capital appelé, non versé',1),
	(877,'PCMN-BASE','TIERS','XXXXXX','4100','876','Appels de fonds',1),
	(878,'PCMN-BASE','TIERS','XXXXXX','4101','876','Actionnaires défaillants',1),
	(879,'PCMN-BASE','TIERS','XXXXXX','411','875','T.V.A. à récupérer',1),
	(880,'PCMN-BASE','TIERS','XXXXXX','4110','879','T.V.A. due',1),
	(881,'PCMN-BASE','TIERS','XXXXXX','4111','879','T.V.A. déductible',1),
	(882,'PCMN-BASE','TIERS','XXXXXX','4112','879','Compte courant administration T.V.A.',1),
	(883,'PCMN-BASE','TIERS','XXXXXX','4118','879','Taxe d\'égalisation due',1),
	(884,'PCMN-BASE','TIERS','XXXXXX','412','875','Impôts et versements fiscaux à récupérer',1),
	(885,'PCMN-BASE','TIERS','XXXXXX','4120','884','Impôts belges sur le résultat',1),
	(886,'PCMN-BASE','TIERS','XXXXXX','4125','884','Autres impôts belges',1),
	(887,'PCMN-BASE','TIERS','XXXXXX','4128','884','Impôts étrangers',1),
	(888,'PCMN-BASE','TIERS','XXXXXX','414','875','Produits à recevoir',1),
	(889,'PCMN-BASE','TIERS','XXXXXX','416','875','Créances diverses',1),
	(890,'PCMN-BASE','TIERS','XXXXXX','4160','889','Associés (compte d\'apport en société)',1),
	(891,'PCMN-BASE','TIERS','XXXXXX','4161','889','Avances et prêts au personnel',1),
	(892,'PCMN-BASE','TIERS','XXXXXX','4162','889','Compte courant des associés en S.P.R.L.',1),
	(893,'PCMN-BASE','TIERS','XXXXXX','4163','889','Compte courant des administrateurs et gérants',1),
	(894,'PCMN-BASE','TIERS','XXXXXX','4164','889','Créances sur sociétés apparentées',1),
	(895,'PCMN-BASE','TIERS','XXXXXX','4166','889','Emballages et matériel à rendre',1),
	(896,'PCMN-BASE','TIERS','XXXXXX','4167','889','Etat et établissements publics',1),
	(897,'PCMN-BASE','TIERS','XXXXXX','41670','896','Subsides à recevoir',1),
	(898,'PCMN-BASE','TIERS','XXXXXX','41671','896','Autres créances',1),
	(899,'PCMN-BASE','TIERS','XXXXXX','4168','889','Rabais, ristournes et remises à obtenir et autres avoirs non encore reçus',1),
	(900,'PCMN-BASE','TIERS','XXXXXX','417','875','Créances douteuses',1),
	(901,'PCMN-BASE','TIERS','XXXXXX','418','875','Cautionnements versés en numéraires',1),
	(902,'PCMN-BASE','TIERS','XXXXXX','419','875','Réductions de valeur actées',1),
	(903,'PCMN-BASE','TIERS','XXXXXX','42','1354','Dettes à plus d\'un an échéant dans l\'année',1),
	(904,'PCMN-BASE','TIERS','XXXXXX','420','903','Emprunts subordonnés',1),
	(905,'PCMN-BASE','TIERS','XXXXXX','4200','904','Convertibles',1),
	(906,'PCMN-BASE','TIERS','XXXXXX','4201','904','Non convertibles',1),
	(907,'PCMN-BASE','TIERS','XXXXXX','421','903','Emprunts obligataires non subordonnés',1),
	(908,'PCMN-BASE','TIERS','XXXXXX','4210','907','Convertibles',1),
	(909,'PCMN-BASE','TIERS','XXXXXX','4211','907','Non convertibles',1),
	(910,'PCMN-BASE','TIERS','XXXXXX','422','903','Dettes de location-financement et assimilées',1),
	(911,'PCMN-BASE','TIERS','XXXXXX','4220','910','Financement de biens immobiliers',1),
	(912,'PCMN-BASE','TIERS','XXXXXX','4221','910','Financement de biens mobiliers',1),
	(913,'PCMN-BASE','TIERS','XXXXXX','423','903','Etablissements de crédit',1),
	(914,'PCMN-BASE','TIERS','XXXXXX','4230','913','Dettes en compte',1),
	(915,'PCMN-BASE','TIERS','XXXXXX','4231','913','Promesses',1),
	(916,'PCMN-BASE','TIERS','XXXXXX','4232','913','Crédits d\'acceptation',1),
	(917,'PCMN-BASE','TIERS','XXXXXX','424','903','Autres emprunts',1),
	(918,'PCMN-BASE','TIERS','XXXXXX','425','903','Dettes commerciales',1),
	(919,'PCMN-BASE','TIERS','XXXXXX','4250','918','Fournisseurs',1),
	(920,'PCMN-BASE','TIERS','XXXXXX','4251','918','Effets à payer',1),
	(921,'PCMN-BASE','TIERS','XXXXXX','426','903','Cautionnements reçus en numéraires',1),
	(922,'PCMN-BASE','TIERS','XXXXXX','429','903','Dettes diverses',1),
	(923,'PCMN-BASE','TIERS','XXXXXX','4290','922','Entreprises liées',1),
	(924,'PCMN-BASE','TIERS','XXXXXX','4291','922','Entreprises avec lesquelles il existe un lien de participation',1),
	(925,'PCMN-BASE','TIERS','XXXXXX','4292','922','Administrateurs, gérants, associés',1),
	(926,'PCMN-BASE','TIERS','XXXXXX','4299','922','Autres dettes',1),
	(927,'PCMN-BASE','TIERS','XXXXXX','43','1354','Dettes financières',1),
	(928,'PCMN-BASE','TIERS','XXXXXX','430','927','Etablissements de crédit. Emprunts en compte à terme fixe',1),
	(929,'PCMN-BASE','TIERS','XXXXXX','431','927','Etablissements de crédit. Promesses',1),
	(930,'PCMN-BASE','TIERS','XXXXXX','432','927','Etablissements de crédit. Crédits d\'acceptation',1),
	(931,'PCMN-BASE','TIERS','XXXXXX','433','927','Etablissements de crédit. Dettes en compte courant',1),
	(932,'PCMN-BASE','TIERS','XXXXXX','439','927','Autres emprunts',1),
	(933,'PCMN-BASE','TIERS','XXXXXX','44','1354','Dettes commerciales',1),
	(934,'PCMN-BASE','TIERS','XXXXXX','440','933','Fournisseurs',1),
	(935,'PCMN-BASE','TIERS','XXXXXX','4400','934','Entreprises apparentées',1),
	(936,'PCMN-BASE','TIERS','XXXXXX','44000','935','Entreprises liées',1),
	(937,'PCMN-BASE','TIERS','XXXXXX','44001','935','Entreprises avec lesquelles il existe un lien de participation',1),
	(938,'PCMN-BASE','TIERS','XXXXXX','4401','934','Fournisseurs ordinaires',1),
	(939,'PCMN-BASE','TIERS','XXXXXX','44010','938','Fournisseurs belges',1),
	(940,'PCMN-BASE','TIERS','XXXXXX','44011','938','Fournisseurs CEE',1),
	(941,'PCMN-BASE','TIERS','XXXXXX','44012','938','Fournisseurs importation',1),
	(942,'PCMN-BASE','TIERS','XXXXXX','4402','934','Dettes envers les coparticipants (associations momentanées)',1),
	(943,'PCMN-BASE','TIERS','XXXXXX','4403','934','Fournisseurs - retenues de garanties',1),
	(944,'PCMN-BASE','TIERS','XXXXXX','441','933','Effets à payer',1),
	(945,'PCMN-BASE','TIERS','XXXXXX','4410','944','Entreprises apparentées',1),
	(946,'PCMN-BASE','TIERS','XXXXXX','44100','945','Entreprises liées',1),
	(947,'PCMN-BASE','TIERS','XXXXXX','44101','945','Entreprises avec lesquelles il existe un lien de participation',1),
	(948,'PCMN-BASE','TIERS','XXXXXX','4411','944','Fournisseurs ordinaires',1),
	(949,'PCMN-BASE','TIERS','XXXXXX','44110','948','Fournisseurs belges',1),
	(950,'PCMN-BASE','TIERS','XXXXXX','44111','948','Fournisseurs CEE',1),
	(951,'PCMN-BASE','TIERS','XXXXXX','44112','948','Fournisseurs importation',1),
	(952,'PCMN-BASE','TIERS','XXXXXX','444','933','Factures à recevoir',1),
	(953,'PCMN-BASE','TIERS','XXXXXX','446','933','Acomptes reçus',1),
	(954,'PCMN-BASE','TIERS','XXXXXX','448','933','Compensations fournisseurs',1),
	(955,'PCMN-BASE','TIERS','XXXXXX','45','1354','Dettes fiscales, salariales et sociales',1),
	(956,'PCMN-BASE','TIERS','XXXXXX','450','955','Dettes fiscales estimées',1),
	(957,'PCMN-BASE','TIERS','XXXXXX','4501','956','Impôts sur le résultat',1),
	(958,'PCMN-BASE','TIERS','XXXXXX','4505','956','Autres impôts en Belgique',1),
	(959,'PCMN-BASE','TIERS','XXXXXX','4508','956','Impôts à l\'étranger',1),
	(960,'PCMN-BASE','TIERS','XXXXXX','451','955','T.V.A. à payer',1),
	(961,'PCMN-BASE','TIERS','XXXXXX','4510','960','T.V.A. due',1),
	(962,'PCMN-BASE','TIERS','XXXXXX','4511','960','T.V.A. déductible',1),
	(963,'PCMN-BASE','TIERS','XXXXXX','4512','960','Compte courant administration T.V.A.',1),
	(964,'PCMN-BASE','TIERS','XXXXXX','4518','960','Taxe d\'égalisation due',1),
	(965,'PCMN-BASE','TIERS','XXXXXX','452','955','Impôts et taxes à payer',1),
	(966,'PCMN-BASE','TIERS','XXXXXX','4520','965','Autres impôts sur le résultat',1),
	(967,'PCMN-BASE','TIERS','XXXXXX','4525','965','Autres impôts et taxes en Belgique',1),
	(968,'PCMN-BASE','TIERS','XXXXXX','45250','967','Précompte immobilier',1),
	(969,'PCMN-BASE','TIERS','XXXXXX','45251','967','Impôts communaux à payer',1),
	(970,'PCMN-BASE','TIERS','XXXXXX','45252','967','Impôts provinciaux à payer',1),
	(971,'PCMN-BASE','TIERS','XXXXXX','45253','967','Autres impôts et taxes à payer',1),
	(972,'PCMN-BASE','TIERS','XXXXXX','4528','965','Impôts et taxes à l\'étranger',1),
	(973,'PCMN-BASE','TIERS','XXXXXX','453','955','Précomptes retenus',1),
	(974,'PCMN-BASE','TIERS','XXXXXX','4530','973','Précompte professionnel retenu sur rémunérations',1),
	(975,'PCMN-BASE','TIERS','XXXXXX','4531','973','Précompte professionnel retenu sur tantièmes',1),
	(976,'PCMN-BASE','TIERS','XXXXXX','4532','973','Précompte mobilier retenu sur dividendes attribués',1),
	(977,'PCMN-BASE','TIERS','XXXXXX','4533','973','Précompte mobilier retenu sur intérêts payés',1),
	(978,'PCMN-BASE','TIERS','XXXXXX','4538','973','Autres précomptes retenus',1),
	(979,'PCMN-BASE','TIERS','XXXXXX','454','955','Office National de la Sécurité Sociale',1),
	(980,'PCMN-BASE','TIERS','XXXXXX','4540','979','Arriérés',1),
	(981,'PCMN-BASE','TIERS','XXXXXX','4541','979','1er trimestre',1),
	(982,'PCMN-BASE','TIERS','XXXXXX','4542','979','2ème trimestre',1),
	(983,'PCMN-BASE','TIERS','XXXXXX','4543','979','3ème trimestre',1),
	(984,'PCMN-BASE','TIERS','XXXXXX','4544','979','4ème trimestre',1),
	(985,'PCMN-BASE','TIERS','XXXXXX','455','955','Rémunérations',1),
	(986,'PCMN-BASE','TIERS','XXXXXX','4550','985','Administrateurs,  gérants et commissaires (non réviseurs)',1),
	(987,'PCMN-BASE','TIERS','XXXXXX','4551','985','Direction',1),
	(988,'PCMN-BASE','TIERS','XXXXXX','4552','985','Employés',1),
	(989,'PCMN-BASE','TIERS','XXXXXX','4553','985','Ouvriers',1),
	(990,'PCMN-BASE','TIERS','XXXXXX','456','955','Pécules de vacances',1),
	(991,'PCMN-BASE','TIERS','XXXXXX','4560','990','Direction',1),
	(992,'PCMN-BASE','TIERS','XXXXXX','4561','990','Employés',1),
	(993,'PCMN-BASE','TIERS','XXXXXX','4562','990','Ouvriers',1),
	(994,'PCMN-BASE','TIERS','XXXXXX','459','955','Autres dettes sociales',1),
	(995,'PCMN-BASE','TIERS','XXXXXX','4590','994','Provision pour gratifications de fin d\'année',1),
	(996,'PCMN-BASE','TIERS','XXXXXX','4591','994','Départs de personnel',1),
	(997,'PCMN-BASE','TIERS','XXXXXX','4592','994','Oppositions sur rémunérations',1),
	(998,'PCMN-BASE','TIERS','XXXXXX','4593','994','Assurances relatives au personnel',1),
	(999,'PCMN-BASE','TIERS','XXXXXX','45930','998','Assurance loi',1),
	(1000,'PCMN-BASE','TIERS','XXXXXX','45931','998','Assurance salaire garanti',1),
	(1001,'PCMN-BASE','TIERS','XXXXXX','45932','998','Assurance groupe',1),
	(1002,'PCMN-BASE','TIERS','XXXXXX','45933','998','Assurances individuelles',1),
	(1003,'PCMN-BASE','TIERS','XXXXXX','4594','994','Caisse d\'assurances sociales pour travailleurs indépendants',1),
	(1004,'PCMN-BASE','TIERS','XXXXXX','4597','994','Dettes et provisions sociales diverses',1),
	(1005,'PCMN-BASE','TIERS','XXXXXX','46','1354','Acomptes reçus sur commande',1),
	(1006,'PCMN-BASE','TIERS','XXXXXX','47','1354','Dettes découlant de l\'affectation des résultats',1),
	(1007,'PCMN-BASE','TIERS','XXXXXX','470','1006','Dividendes et tantièmes d\'exercices antérieurs',1),
	(1008,'PCMN-BASE','TIERS','XXXXXX','471','1006','Dividendes de l\'exercice',1),
	(1009,'PCMN-BASE','TIERS','XXXXXX','472','1006','Tantièmes de l\'exercice',1),
	(1010,'PCMN-BASE','TIERS','XXXXXX','473','1006','Autres allocataires',1),
	(1011,'PCMN-BASE','TIERS','XXXXXX','48','4','Dettes diverses',1),
	(1012,'PCMN-BASE','TIERS','XXXXXX','480','1011','Obligations et coupons échus',1),
	(1013,'PCMN-BASE','TIERS','XXXXXX','481','1011','Actionnaires - capital à rembourser',1),
	(1014,'PCMN-BASE','TIERS','XXXXXX','482','1011','Participation du personnel à payer',1),
	(1015,'PCMN-BASE','TIERS','XXXXXX','483','1011','Acomptes reçus d\'autres tiers à moins d\'un an',1),
	(1016,'PCMN-BASE','TIERS','XXXXXX','486','1011','Emballages et matériel consignés',1),
	(1017,'PCMN-BASE','TIERS','XXXXXX','488','1011','Cautionnements reçus en numéraires',1),
	(1018,'PCMN-BASE','TIERS','XXXXXX','489','1011','Autres dettes diverses',1),
	(1019,'PCMN-BASE','TIERS','XXXXXX','49','1354','Comptes de régularisation et compte d\'attente',1),
	(1020,'PCMN-BASE','TIERS','XXXXXX','490','1019','Charges à reporter (à subdiviser par catégorie de charges)',1),
	(1021,'PCMN-BASE','TIERS','XXXXXX','491','1019','Produits acquis',1),
	(1022,'PCMN-BASE','TIERS','XXXXXX','4910','1021','Produits d\'exploitation',1),
	(1023,'PCMN-BASE','TIERS','XXXXXX','49100','1022','Ristournes et rabais à obtenir',1),
	(1024,'PCMN-BASE','TIERS','XXXXXX','49101','1022','Commissions à obtenir',1),
	(1025,'PCMN-BASE','TIERS','XXXXXX','49102','1022','Autres produits d\'exploitation (redevances par exemple)',1),
	(1026,'PCMN-BASE','TIERS','XXXXXX','4911','1021','Produits financiers',1),
	(1027,'PCMN-BASE','TIERS','XXXXXX','49110','1026','Intérêts courus et non échus sur prêts et débits',1),
	(1028,'PCMN-BASE','TIERS','XXXXXX','49111','1026','Autres produits financiers',1),
	(1029,'PCMN-BASE','TIERS','XXXXXX','492','1019','Charges à imputer (à subdiviser par catégorie de charges)',1),
	(1030,'PCMN-BASE','TIERS','XXXXXX','493','1019','Produits à reporter',1),
	(1031,'PCMN-BASE','TIERS','XXXXXX','4930','1030','Produits d\'exploitation à reporter',1),
	(1032,'PCMN-BASE','TIERS','XXXXXX','4931','1030','Produits financiers à reporter',1),
	(1033,'PCMN-BASE','TIERS','XXXXXX','499','1019','Comptes d\'attente',1),
	(1034,'PCMN-BASE','TIERS','XXXXXX','4990','1033','Compte d\'attente',1),
	(1035,'PCMN-BASE','TIERS','XXXXXX','4991','1033','Compte de répartition périodique des charges',1),
	(1036,'PCMN-BASE','TIERS','XXXXXX','4999','1033','Transferts d\'exercice',1),
	(1037,'PCMN-BASE','FINAN','XXXXXX','50','1355','Actions propres',1),
	(1038,'PCMN-BASE','FINAN','XXXXXX','51','1355','Actions et parts',1),
	(1039,'PCMN-BASE','FINAN','XXXXXX','510','1038','Valeur d\'acquisition',1),
	(1040,'PCMN-BASE','FINAN','XXXXXX','511','1038','Montants non appelés',1),
	(1041,'PCMN-BASE','FINAN','XXXXXX','519','1038','Réductions de valeur actées',1),
	(1042,'PCMN-BASE','FINAN','XXXXXX','52','1355','Titres à revenus fixes',1),
	(1043,'PCMN-BASE','FINAN','XXXXXX','520','1042','Valeur d\'acquisition',1),
	(1044,'PCMN-BASE','FINAN','XXXXXX','529','1042','Réductions de valeur actées',1),
	(1045,'PCMN-BASE','FINAN','XXXXXX','53','1355','Dépots à terme',1),
	(1046,'PCMN-BASE','FINAN','XXXXXX','530','1045','De plus d\'un an',1),
	(1047,'PCMN-BASE','FINAN','XXXXXX','531','1045','De plus d\'un mois et à un an au plus',1),
	(1048,'PCMN-BASE','FINAN','XXXXXX','532','1045','d\'un mois au plus',1),
	(1049,'PCMN-BASE','FINAN','XXXXXX','539','1045','Réductions de valeur actées',1),
	(1050,'PCMN-BASE','FINAN','XXXXXX','54','1355','Valeurs échues à l\'encaissement',1),
	(1051,'PCMN-BASE','FINAN','XXXXXX','540','1050','Chèques à encaisser',1),
	(1052,'PCMN-BASE','FINAN','XXXXXX','541','1050','Coupons à encaisser',1),
	(1053,'PCMN-BASE','FINAN','XXXXXX','55','1355','Etablissements de crédit - Comptes ouverts auprès des divers établissements.',1),
	(1054,'PCMN-BASE','FINAN','XXXXXX','550','1053','Comptes courants',1),
	(1055,'PCMN-BASE','FINAN','XXXXXX','551','1053','Chèques émis',1),
	(1056,'PCMN-BASE','FINAN','XXXXXX','559','1053','Réductions de valeur actées',1),
	(1057,'PCMN-BASE','FINAN','XXXXXX','56','1355','Office des chèques postaux',1),
	(1058,'PCMN-BASE','FINAN','XXXXXX','560','1057','Compte courant',1),
	(1059,'PCMN-BASE','FINAN','XXXXXX','561','1057','Chèques émis',1),
	(1060,'PCMN-BASE','FINAN','XXXXXX','57','1355','Caisses',1),
	(1061,'PCMN-BASE','FINAN','XXXXXX','570','1060','à 577 Caisses - espèces ( 0 - centrale ; 7 - succursales et agences)',1),
	(1062,'PCMN-BASE','FINAN','XXXXXX','578','1060','Caisses - timbres ( 0 - fiscaux ; 1 - postaux)',1),
	(1063,'PCMN-BASE','FINAN','XXXXXX','58','1355','Virements internes',1),
	(1064,'PCMN-BASE','CHARGE','XXXXXX','60','1356','Approvisionnements et marchandises',1),
	(1065,'PCMN-BASE','CHARGE','XXXXXX','600','1064','Achats de matières premières',1),
	(1066,'PCMN-BASE','CHARGE','XXXXXX','601','1064','Achats de fournitures',1),
	(1067,'PCMN-BASE','CHARGE','XXXXXX','602','1064','Achats de services, travaux et études',1),
	(1068,'PCMN-BASE','CHARGE','XXXXXX','603','1064','Sous-traitances générales',1),
	(1069,'PCMN-BASE','CHARGE','XXXXXX','604','1064','Achats de marchandises',1),
	(1070,'PCMN-BASE','CHARGE','XXXXXX','605','1064','Achats d\'immeubles destinés à la revente',1),
	(1071,'PCMN-BASE','CHARGE','XXXXXX','608','1064','Remises , ristournes et rabais obtenus sur achats',1),
	(1072,'PCMN-BASE','CHARGE','XXXXXX','609','1064','Variations de stocks',1),
	(1073,'PCMN-BASE','CHARGE','XXXXXX','6090','1072','De matières premières',1),
	(1074,'PCMN-BASE','CHARGE','XXXXXX','6091','1072','De fournitures',1),
	(1075,'PCMN-BASE','CHARGE','XXXXXX','6094','1072','De marchandises',1),
	(1076,'PCMN-BASE','CHARGE','XXXXXX','6095','1072','d\'immeubles destinés à la vente',1),
	(1077,'PCMN-BASE','CHARGE','XXXXXX','61','1356','Services et biens divers',1),
	(1078,'PCMN-BASE','CHARGE','XXXXXX','610','1077','Loyers et charges locatives',1),
	(1079,'PCMN-BASE','CHARGE','XXXXXX','6100','1078','Loyers divers',1),
	(1080,'PCMN-BASE','CHARGE','XXXXXX','6101','1078','Charges locatives (assurances, frais de confort,etc)',1),
	(1081,'PCMN-BASE','CHARGE','XXXXXX','611','1077','Entretien et réparation (fournitures et prestations)',1),
	(1082,'PCMN-BASE','CHARGE','XXXXXX','612','1077','Fournitures faites à l\'entreprise',1),
	(1083,'PCMN-BASE','CHARGE','XXXXXX','6120','1082','Eau, gaz, électricité, vapeur',1),
	(1084,'PCMN-BASE','CHARGE','XXXXXX','61200','1083','Eau',1),
	(1085,'PCMN-BASE','CHARGE','XXXXXX','61201','1083','Gaz',1),
	(1086,'PCMN-BASE','CHARGE','XXXXXX','61202','1083','Electricité',1),
	(1087,'PCMN-BASE','CHARGE','XXXXXX','61203','1083','Vapeur',1),
	(1088,'PCMN-BASE','CHARGE','XXXXXX','6121','1082','Téléphone, télégrammes, télex, téléfax, frais postaux',1),
	(1089,'PCMN-BASE','CHARGE','XXXXXX','61210','1088','Téléphone',1),
	(1090,'PCMN-BASE','CHARGE','XXXXXX','61211','1088','Télégrammes',1),
	(1091,'PCMN-BASE','CHARGE','XXXXXX','61212','1088','Télex et téléfax',1),
	(1092,'PCMN-BASE','CHARGE','XXXXXX','61213','1088','Frais postaux',1),
	(1093,'PCMN-BASE','CHARGE','XXXXXX','6122','1082','Livres, bibliothèque',1),
	(1094,'PCMN-BASE','CHARGE','XXXXXX','6123','1082','Imprimés et fournitures de bureau (si non comptabilisé au 601)',1),
	(1095,'PCMN-BASE','CHARGE','XXXXXX','613','1077','Rétributions de tiers',1),
	(1096,'PCMN-BASE','CHARGE','XXXXXX','6130','1095','Redevances et royalties',1),
	(1097,'PCMN-BASE','CHARGE','XXXXXX','61300','1096','Redevances pour brevets, licences, marques et accessoires',1),
	(1098,'PCMN-BASE','CHARGE','XXXXXX','61301','1096','Autres redevances (procédés de fabrication)',1),
	(1099,'PCMN-BASE','CHARGE','XXXXXX','6131','1095','Assurances non relatives au personnel',1),
	(1100,'PCMN-BASE','CHARGE','XXXXXX','61310','1099','Assurance incendie',1),
	(1101,'PCMN-BASE','CHARGE','XXXXXX','61311','1099','Assurance vol',1),
	(1102,'PCMN-BASE','CHARGE','XXXXXX','61312','1099','Assurance autos',1),
	(1103,'PCMN-BASE','CHARGE','XXXXXX','61313','1099','Assurance crédit',1),
	(1104,'PCMN-BASE','CHARGE','XXXXXX','61314','1099','Assurances frais généraux',1),
	(1105,'PCMN-BASE','CHARGE','XXXXXX','6132','1095','Divers',1),
	(1106,'PCMN-BASE','CHARGE','XXXXXX','61320','1105','Commissions aux tiers',1),
	(1107,'PCMN-BASE','CHARGE','XXXXXX','61321','1105','Honoraires d\'avocats, d\'experts, etc',1),
	(1108,'PCMN-BASE','CHARGE','XXXXXX','61322','1105','Cotisations aux groupements professionnels',1),
	(1109,'PCMN-BASE','CHARGE','XXXXXX','61323','1105','Dons, libéralités, etc',1),
	(1110,'PCMN-BASE','CHARGE','XXXXXX','61324','1105','Frais de contentieux',1),
	(1111,'PCMN-BASE','CHARGE','XXXXXX','61325','1105','Publications légales',1),
	(1112,'PCMN-BASE','CHARGE','XXXXXX','6133','1095','Transports et déplacements',1),
	(1113,'PCMN-BASE','CHARGE','XXXXXX','61330','1112','Transports de personnel',1),
	(1114,'PCMN-BASE','CHARGE','XXXXXX','61331','1112','Voyages, déplacements et représentations',1),
	(1115,'PCMN-BASE','CHARGE','XXXXXX','6134','1095','Personnel intérimaire',1),
	(1116,'PCMN-BASE','CHARGE','XXXXXX','614','1077','Annonces, publicité, propagande et documentation',1),
	(1117,'PCMN-BASE','CHARGE','XXXXXX','6140','1116','Annonces et insertions',1),
	(1118,'PCMN-BASE','CHARGE','XXXXXX','6141','1116','Catalogues et imprimés',1),
	(1119,'PCMN-BASE','CHARGE','XXXXXX','6142','1116','Echantillons',1),
	(1120,'PCMN-BASE','CHARGE','XXXXXX','6143','1116','Foires et expositions',1),
	(1121,'PCMN-BASE','CHARGE','XXXXXX','6144','1116','Primes',1),
	(1122,'PCMN-BASE','CHARGE','XXXXXX','6145','1116','Cadeaux à la clientèle',1),
	(1123,'PCMN-BASE','CHARGE','XXXXXX','6146','1116','Missions et réceptions',1),
	(1124,'PCMN-BASE','CHARGE','XXXXXX','6147','1116','Documentation',1),
	(1125,'PCMN-BASE','CHARGE','XXXXXX','615','1077','Sous-traitants',1),
	(1126,'PCMN-BASE','CHARGE','XXXXXX','6150','1125','Sous-traitants pour activités propres',1),
	(1127,'PCMN-BASE','CHARGE','XXXXXX','6151','1125','Sous-traitants d\'associations momentanées (coparticipants)',1),
	(1128,'PCMN-BASE','CHARGE','XXXXXX','6152','1125','Quote-part bénéficiaire des coparticipants',1),
	(1129,'PCMN-BASE','CHARGE','XXXXXX','617','1077','Personnel intérimaire et personnes mises à la disposition de l\'entreprise',1),
	(1130,'PCMN-BASE','CHARGE','XXXXXX','618','1077','Rémunérations, primes pour assurances extralégales, pensions de retraite et de survie des administrateurs, gérants et associés actifs qui ne sont pas attribuées en vertu d\'un contrat de travail',1),
	(1131,'PCMN-BASE','CHARGE','XXXXXX','62','1356','Rémunérations, charges sociales et pensions',1),
	(1132,'PCMN-BASE','CHARGE','XXXXXX','620','1131','Rémunérations et avantages sociaux directs',1),
	(1133,'PCMN-BASE','CHARGE','XXXXXX','6200','1132','Administrateurs ou gérants',1),
	(1134,'PCMN-BASE','CHARGE','XXXXXX','6201','1132','Personnel de direction',1),
	(1135,'PCMN-BASE','CHARGE','XXXXXX','6202','1132','Employés',1),
	(1136,'PCMN-BASE','CHARGE','XXXXXX','6203','1132','Ouvriers',1),
	(1137,'PCMN-BASE','CHARGE','XXXXXX','6204','1132','Autres membres du personnel',1),
	(1138,'PCMN-BASE','CHARGE','XXXXXX','621','1131','Cotisations patronales d\'assurances sociales',1),
	(1139,'PCMN-BASE','CHARGE','XXXXXX','6210','1138','Sur salaires',1),
	(1140,'PCMN-BASE','CHARGE','XXXXXX','6211','1138','Sur appointements et commissions',1),
	(1141,'PCMN-BASE','CHARGE','XXXXXX','622','1131','Primes patronales pour assurances extralégales',1),
	(1142,'PCMN-BASE','CHARGE','XXXXXX','623','1131','Autres frais de personnel',1),
	(1143,'PCMN-BASE','CHARGE','XXXXXX','6230','1142','Assurances du personnel',1),
	(1144,'PCMN-BASE','CHARGE','XXXXXX','62300','1143','Assurances loi, responsabilité civile, chemin du travail',1),
	(1145,'PCMN-BASE','CHARGE','XXXXXX','62301','1143','Assurance salaire garanti',1),
	(1146,'PCMN-BASE','CHARGE','XXXXXX','62302','1143','Assurances individuelles',1),
	(1147,'PCMN-BASE','CHARGE','XXXXXX','6231','1142','Charges sociales diverses',1),
	(1148,'PCMN-BASE','CHARGE','XXXXXX','62310','1147','Jours fériés payés',1),
	(1149,'PCMN-BASE','CHARGE','XXXXXX','62311','1147','Salaire hebdomadaire garanti',1),
	(1150,'PCMN-BASE','CHARGE','XXXXXX','62312','1147','Allocations familiales complémentaires',1),
	(1151,'PCMN-BASE','CHARGE','XXXXXX','6232','1142','Charges sociales des administrateurs, gérants et commissaires',1),
	(1152,'PCMN-BASE','CHARGE','XXXXXX','62320','1151','Allocations familiales complémentaires pour non salariés',1),
	(1153,'PCMN-BASE','CHARGE','XXXXXX','62321','1151','Lois sociales pour indépendants',1),
	(1154,'PCMN-BASE','CHARGE','XXXXXX','62322','1151','Divers',1),
	(1155,'PCMN-BASE','CHARGE','XXXXXX','624','1131','Pensions de retraite et de survie',1),
	(1156,'PCMN-BASE','CHARGE','XXXXXX','6240','1155','Administrateurs et gérants',1),
	(1157,'PCMN-BASE','CHARGE','XXXXXX','6241','1155','Personnel',1),
	(1158,'PCMN-BASE','CHARGE','XXXXXX','625','1131','Provision pour pécule de vacances',1),
	(1159,'PCMN-BASE','CHARGE','XXXXXX','6250','1158','Dotations',1),
	(1160,'PCMN-BASE','CHARGE','XXXXXX','6251','1158','Utilisations et reprises',1),
	(1161,'PCMN-BASE','CHARGE','XXXXXX','63','1356','Amortissements, réductions de valeur et provisions pour risques et charges',1),
	(1162,'PCMN-BASE','CHARGE','XXXXXX','630','1161','Dotations aux amortissements et aux réductions de valeur sur immobilisations',1),
	(1163,'PCMN-BASE','CHARGE','XXXXXX','6300','1162','Dotations aux amortissements sur frais d\'établissement',1),
	(1164,'PCMN-BASE','CHARGE','XXXXXX','6301','1162','Dotations aux amortissements sur immobilisations incorporelles',1),
	(1165,'PCMN-BASE','CHARGE','XXXXXX','6302','1162','Dotations aux amortissements sur immobilisations corporelles',1),
	(1166,'PCMN-BASE','CHARGE','XXXXXX','6308','1162','Dotations aux réductions de valeur sur immobilisations incorporelles',1),
	(1167,'PCMN-BASE','CHARGE','XXXXXX','6309','1162','Dotations aux réductions de valeur sur immobilisations corporelles',1),
	(1168,'PCMN-BASE','CHARGE','XXXXXX','631','1161','Réductions de valeur sur stocks',1),
	(1169,'PCMN-BASE','CHARGE','XXXXXX','6310','1168','Dotations',1),
	(1170,'PCMN-BASE','CHARGE','XXXXXX','6311','1168','Reprises',1),
	(1171,'PCMN-BASE','CHARGE','XXXXXX','632','1161','Réductions de valeur sur commandes en cours d\'exécution',1),
	(1172,'PCMN-BASE','CHARGE','XXXXXX','6320','1171','Dotations',1),
	(1173,'PCMN-BASE','CHARGE','XXXXXX','6321','1171','Reprises',1),
	(1174,'PCMN-BASE','CHARGE','XXXXXX','633','1161','Réductions de valeur sur créances commerciales à plus d\'un an',1),
	(1175,'PCMN-BASE','CHARGE','XXXXXX','6330','1174','Dotations',1),
	(1176,'PCMN-BASE','CHARGE','XXXXXX','6331','1174','Reprises',1),
	(1177,'PCMN-BASE','CHARGE','XXXXXX','634','1161','Réductions de valeur sur créances commerciales à un an au plus',1),
	(1178,'PCMN-BASE','CHARGE','XXXXXX','6340','1177','Dotations',1),
	(1179,'PCMN-BASE','CHARGE','XXXXXX','6341','1177','Reprises',1),
	(1180,'PCMN-BASE','CHARGE','XXXXXX','635','1161','Provisions pour pensions et obligations similaires',1),
	(1181,'PCMN-BASE','CHARGE','XXXXXX','6350','1180','Dotations',1),
	(1182,'PCMN-BASE','CHARGE','XXXXXX','6351','1180','Utilisations et reprises',1),
	(1183,'PCMN-BASE','CHARGE','XXXXXX','636','11613','Provisions pour grosses réparations et gros entretiens',1),
	(1184,'PCMN-BASE','CHARGE','XXXXXX','6360','1183','Dotations',1),
	(1185,'PCMN-BASE','CHARGE','XXXXXX','6361','1183','Utilisations et reprises',1),
	(1186,'PCMN-BASE','CHARGE','XXXXXX','637','1161','Provisions pour autres risques et charges',1),
	(1187,'PCMN-BASE','CHARGE','XXXXXX','6370','1186','Dotations',1),
	(1188,'PCMN-BASE','CHARGE','XXXXXX','6371','1186','Utilisations et reprises',1),
	(1189,'PCMN-BASE','CHARGE','XXXXXX','64','1356','Autres charges d\'exploitation',1),
	(1190,'PCMN-BASE','CHARGE','XXXXXX','640','1189','Charges fiscales d\'exploitation',1),
	(1191,'PCMN-BASE','CHARGE','XXXXXX','6400','1190','Taxes et impôts directs',1),
	(1192,'PCMN-BASE','CHARGE','XXXXXX','64000','1191','Taxes sur autos et camions',1),
	(1193,'PCMN-BASE','CHARGE','XXXXXX','6401','1190','Taxes et impôts indirects',1),
	(1194,'PCMN-BASE','CHARGE','XXXXXX','64010','1193','Timbres fiscaux pris en charge par la firme',1),
	(1195,'PCMN-BASE','CHARGE','XXXXXX','64011','1193','Droits d\'enregistrement',1),
	(1196,'PCMN-BASE','CHARGE','XXXXXX','64012','1193','T.V.A. non déductible',1),
	(1197,'PCMN-BASE','CHARGE','XXXXXX','6402','1190','Impôts provinciaux et communaux',1),
	(1198,'PCMN-BASE','CHARGE','XXXXXX','64020','1197','Taxe sur la force motrice',1),
	(1199,'PCMN-BASE','CHARGE','XXXXXX','64021','1197','Taxe sur le personnel occupé',1),
	(1200,'PCMN-BASE','CHARGE','XXXXXX','6403','1190','Taxes diverses',1),
	(1201,'PCMN-BASE','CHARGE','XXXXXX','641','1189','Moins-values sur réalisations courantes d\'immobilisations corporelles',1),
	(1202,'PCMN-BASE','CHARGE','XXXXXX','642','1189','Moins-values sur réalisations de créances commerciales',1),
	(1203,'PCMN-BASE','CHARGE','XXXXXX','643','1189','à 648 Charges d\'exploitations diverses',1),
	(1204,'PCMN-BASE','CHARGE','XXXXXX','649','1189','Charges d\'exploitation portées à l\'actif au titre de restructuration',1),
	(1205,'PCMN-BASE','CHARGE','XXXXXX','65','1356','Charges financières',1),
	(1206,'PCMN-BASE','CHARGE','XXXXXX','650','1205','Charges des dettes',1),
	(1207,'PCMN-BASE','CHARGE','XXXXXX','6500','1206','Intérêts, commissions et frais afférents aux dettes',1),
	(1208,'PCMN-BASE','CHARGE','XXXXXX','6501','1206','Amortissements des agios et frais d\'émission d\'emprunts',1),
	(1209,'PCMN-BASE','CHARGE','XXXXXX','6502','1206','Autres charges de dettes',1),
	(1210,'PCMN-BASE','CHARGE','XXXXXX','6503','1206','Intérêts intercalaires portés à l\'actif',1),
	(1211,'PCMN-BASE','CHARGE','XXXXXX','651','1205','Réductions de valeur sur actifs circulants',1),
	(1212,'PCMN-BASE','CHARGE','XXXXXX','6510','1211','Dotations',1),
	(1213,'PCMN-BASE','CHARGE','XXXXXX','6511','1211','Reprises',1),
	(1214,'PCMN-BASE','CHARGE','XXXXXX','652','1205','Moins-values sur réalisation d\'actifs circulants',1),
	(1215,'PCMN-BASE','CHARGE','XXXXXX','653','1205','Charges d\'escompte de créances',1),
	(1216,'PCMN-BASE','CHARGE','XXXXXX','654','1205','Différences de change',1),
	(1217,'PCMN-BASE','CHARGE','XXXXXX','655','1205','Ecarts de conversion des devises',1),
	(1218,'PCMN-BASE','CHARGE','XXXXXX','656','1205','Frais de banques, de chèques postaux',1),
	(1219,'PCMN-BASE','CHARGE','XXXXXX','657','1205','Commissions sur ouvertures de crédit, cautions et avals',1),
	(1220,'PCMN-BASE','CHARGE','XXXXXX','658','1205','Frais de vente des titres',1),
	(1221,'PCMN-BASE','CHARGE','XXXXXX','66','1356','Charges exceptionnelles',1),
	(1222,'PCMN-BASE','CHARGE','XXXXXX','660','1221','Amortissements et réductions de valeur exceptionnels',1),
	(1223,'PCMN-BASE','CHARGE','XXXXXX','6600','1222','Sur frais d\'établissement',1),
	(1224,'PCMN-BASE','CHARGE','XXXXXX','6601','1222','Sur immobilisations incorporelles',1),
	(1225,'PCMN-BASE','CHARGE','XXXXXX','6602','1222','Sur immobilisations corporelles',1),
	(1226,'PCMN-BASE','CHARGE','XXXXXX','661','1221','Réductions de valeur sur immobilisations financières',1),
	(1227,'PCMN-BASE','CHARGE','XXXXXX','662','1221','Provisions pour risques et charges exceptionnels',1),
	(1228,'PCMN-BASE','CHARGE','XXXXXX','663','1221','Moins-values sur réalisation d\'actifs immobilisés',1),
	(1229,'PCMN-BASE','CHARGE','XXXXXX','6630','1228','Sur immobilisations incorporelles',1),
	(1230,'PCMN-BASE','CHARGE','XXXXXX','6631','1228','Sur immobilisations corporelles',1),
	(1231,'PCMN-BASE','CHARGE','XXXXXX','6632','1228','Sur immobilisations détenues en location-financement et droits similaires',1),
	(1232,'PCMN-BASE','CHARGE','XXXXXX','6633','1228','Sur immobilisations financières',1),
	(1233,'PCMN-BASE','CHARGE','XXXXXX','6634','1228','Sur immeubles acquis ou construits en vue de la revente',1),
	(1234,'PCMN-BASE','CHARGE','XXXXXX','664','1221','à 668 Autres charges exceptionnelles',1),
	(1235,'PCMN-BASE','CHARGE','XXXXXX','664','1221','Pénalités et amendes diverses',1),
	(1236,'PCMN-BASE','CHARGE','XXXXXX','665','1221','Différence de charge',1),
	(1237,'PCMN-BASE','CHARGE','XXXXXX','669','1221','Charges exceptionnelles transférées à l\'actif en frais de restructuration',1),
	(1238,'PCMN-BASE','CHARGE','XXXXXX','67','1356','Impôts sur le résultat',1),
	(1239,'PCMN-BASE','CHARGE','XXXXXX','670','1238','Impôts belges sur le résultat de l\'exercice',1),
	(1240,'PCMN-BASE','CHARGE','XXXXXX','6700','1239','Impôts et précomptes dus ou versés',1),
	(1241,'PCMN-BASE','CHARGE','XXXXXX','6701','1239','Excédent de versements d\'impôts et précomptes porté à l\'actif',1),
	(1242,'PCMN-BASE','CHARGE','XXXXXX','6702','1239','Charges fiscales estimées',1),
	(1243,'PCMN-BASE','CHARGE','XXXXXX','671','1238','Impôts belges sur le résultat d\'exercices antérieurs',1),
	(1244,'PCMN-BASE','CHARGE','XXXXXX','6710','1243','Suppléments d\'impôts dus ou versés',1),
	(1245,'PCMN-BASE','CHARGE','XXXXXX','6711','1243','Suppléments d\'impôts estimés',1),
	(1246,'PCMN-BASE','CHARGE','XXXXXX','6712','1243','Provisions fiscales constituées',1),
	(1247,'PCMN-BASE','CHARGE','XXXXXX','672','1238','Impôts étrangers sur le résultat de l\'exercice',1),
	(1248,'PCMN-BASE','CHARGE','XXXXXX','673','1238','Impôts étrangers sur le résultat d\'exercices antérieurs',1),
	(1249,'PCMN-BASE','CHARGE','XXXXXX','68','1356','Transferts aux réserves immunisées',1),
	(1250,'PCMN-BASE','CHARGE','XXXXXX','69','1356','Affectation des résultats',1),
	(1251,'PCMN-BASE','CHARGE','XXXXXX','690','1250','Perte reportée de l\'exercice précédent',1),
	(1252,'PCMN-BASE','CHARGE','XXXXXX','691','1250','Dotation à la réserve légale',1),
	(1253,'PCMN-BASE','CHARGE','XXXXXX','692','1250','Dotation aux autres réserves',1),
	(1254,'PCMN-BASE','CHARGE','XXXXXX','693','1250','Bénéfice à reporter',1),
	(1255,'PCMN-BASE','CHARGE','XXXXXX','694','1250','Rémunération du capital',1),
	(1256,'PCMN-BASE','CHARGE','XXXXXX','695','1250','Administrateurs ou gérants',1),
	(1257,'PCMN-BASE','CHARGE','XXXXXX','696','1250','Autres allocataires',1),
	(1258,'PCMN-BASE','PROD','XXXXXX','70','1357','Chiffre d\'affaires',1),
	(1260,'PCMN-BASE','PROD','XXXXXX','700','1258','Ventes de marchandises',1),
	(1261,'PCMN-BASE','PROD','XXXXXX','7000','1260','Ventes en Belgique',1),
	(1262,'PCMN-BASE','PROD','XXXXXX','7001','1260','Ventes dans les pays membres de la C.E.E.',1),
	(1263,'PCMN-BASE','PROD','XXXXXX','7002','1260','Ventes à l\'exportation',1),
	(1264,'PCMN-BASE','PROD','XXXXXX','701','1258','Ventes de produits finis',1),
	(1265,'PCMN-BASE','PROD','XXXXXX','7010','1264','Ventes en Belgique',1),
	(1266,'PCMN-BASE','PROD','XXXXXX','7011','1264','Ventes dans les pays membres de la C.E.E.',1),
	(1267,'PCMN-BASE','PROD','XXXXXX','7012','1264','Ventes à l\'exportation',1),
	(1268,'PCMN-BASE','PROD','XXXXXX','702','1258','Ventes de déchets et rebuts',1),
	(1269,'PCMN-BASE','PROD','XXXXXX','7020','1268','Ventes en Belgique',1),
	(1270,'PCMN-BASE','PROD','XXXXXX','7021','1268','Ventes dans les pays membres de la C.E.E.',1),
	(1271,'PCMN-BASE','PROD','XXXXXX','7022','1268','Ventes à l\'exportation',1),
	(1272,'PCMN-BASE','PROD','XXXXXX','703','1258','Ventes d\'emballages récupérables',1),
	(1273,'PCMN-BASE','PROD','XXXXXX','704','1258','Facturations des travaux en cours (associations momentanées)',1),
	(1274,'PCMN-BASE','PROD','XXXXXX','705','1258','Prestations de services',1),
	(1275,'PCMN-BASE','PROD','XXXXXX','7050','1274','Prestations de services en Belgique',1),
	(1276,'PCMN-BASE','PROD','XXXXXX','7051','1274','Prestations de services dans les pays membres de la C.E.E.',1),
	(1277,'PCMN-BASE','PROD','XXXXXX','7052','1274','Prestations de services en vue de l\'exportation',1),
	(1278,'PCMN-BASE','PROD','XXXXXX','706','1258','Pénalités et dédits obtenus par l\'entreprise',1),
	(1279,'PCMN-BASE','PROD','XXXXXX','708','1258','Remises, ristournes et rabais accordés',1),
	(1280,'PCMN-BASE','PROD','XXXXXX','7080','1279','Sur ventes de marchandises',1),
	(1281,'PCMN-BASE','PROD','XXXXXX','7081','1279','Sur ventes de produits finis',1),
	(1282,'PCMN-BASE','PROD','XXXXXX','7082','1279','Sur ventes de déchets et rebuts',1),
	(1283,'PCMN-BASE','PROD','XXXXXX','7083','1279','Sur prestations de services',1),
	(1284,'PCMN-BASE','PROD','XXXXXX','7084','1279','Mali sur travaux facturés aux associations momentanées',1),
	(1285,'PCMN-BASE','PROD','XXXXXX','71','1357','Variation des stocks et des commandes en cours d\'exécution',1),
	(1286,'PCMN-BASE','PROD','XXXXXX','712','1285','Des en cours de fabrication',1),
	(1287,'PCMN-BASE','PROD','XXXXXX','713','1285','Des produits finis',1),
	(1288,'PCMN-BASE','PROD','XXXXXX','715','1285','Des immeubles construits destinés à la vente',1),
	(1289,'PCMN-BASE','PROD','XXXXXX','717','1285','Des commandes en cours d\'exécution',1),
	(1290,'PCMN-BASE','PROD','XXXXXX','7170','1289','Commandes en cours - Coût de revient',1),
	(1291,'PCMN-BASE','PROD','XXXXXX','71700','1290','Coût des commandes en cours d\'exécution',1),
	(1292,'PCMN-BASE','PROD','XXXXXX','71701','1290','Coût des travaux en cours des associations momentanées',1),
	(1293,'PCMN-BASE','PROD','XXXXXX','7171','1289','Bénéfices portés en compte sur commandes en cours',1),
	(1294,'PCMN-BASE','PROD','XXXXXX','71710','1293','Sur commandes en cours d\'exécution',1),
	(1295,'PCMN-BASE','PROD','XXXXXX','71711','1293','Sur travaux en cours des associations momentanées',1),
	(1296,'PCMN-BASE','PROD','XXXXXX','72','1357','Production immobilisée',1),
	(1297,'PCMN-BASE','PROD','XXXXXX','720','1296','En frais d\'établissement',1),
	(1298,'PCMN-BASE','PROD','XXXXXX','721','1296','En immobilisations incorporelles',1),
	(1299,'PCMN-BASE','PROD','XXXXXX','722','1296','En immobilisations corporelles',1),
	(1300,'PCMN-BASE','PROD','XXXXXX','723','1296','En immobilisations en cours',1),
	(1301,'PCMN-BASE','PROD','XXXXXX','74','1357','Autres produits d\'exploitation',1),
	(1302,'PCMN-BASE','PROD','XXXXXX','740','1301','Subsides d\'exploitation et montants compensatoires',1),
	(1303,'PCMN-BASE','PROD','XXXXXX','741','1301','Plus-values sur réalisations courantes d\'immobilisations corporelles',1),
	(1304,'PCMN-BASE','PROD','XXXXXX','742','1301','Plus-values sur réalisations de créances commerciales',1),
	(1305,'PCMN-BASE','PROD','XXXXXX','743','1301','à 749 Produits d\'exploitation divers',1),
	(1306,'PCMN-BASE','PROD','XXXXXX','743','1301','Produits de services exploités dans l\'intérêt du personnel',1),
	(1307,'PCMN-BASE','PROD','XXXXXX','744','1301','Commissions et courtages',1),
	(1308,'PCMN-BASE','PROD','XXXXXX','745','1301','Redevances pour brevets et licences',1),
	(1309,'PCMN-BASE','PROD','XXXXXX','746','1301','Prestations de services (transports, études, etc)',1),
	(1310,'PCMN-BASE','PROD','XXXXXX','747','1301','Revenus des immeubles affectés aux activités non professionnelles',1),
	(1311,'PCMN-BASE','PROD','XXXXXX','748','1301','Locations diverses à caractère professionnel',1),
	(1312,'PCMN-BASE','PROD','XXXXXX','749','1301','Produits divers',1),
	(1313,'PCMN-BASE','PROD','XXXXXX','7490','1312','Bonis sur reprises d\'emballages consignés',1),
	(1314,'PCMN-BASE','PROD','XXXXXX','7491','1312','Bonis sur travaux en associations momentanées',1),
	(1315,'PCMN-BASE','PROD','XXXXXX','75','1357','Produits financiers',1),
	(1316,'PCMN-BASE','PROD','XXXXXX','750','1315','Produits des immobilisations financières',1),
	(1317,'PCMN-BASE','PROD','XXXXXX','7500','1316','Revenus des actions',1),
	(1318,'PCMN-BASE','PROD','XXXXXX','7501','1316','Revenus des obligations',1),
	(1319,'PCMN-BASE','PROD','XXXXXX','7502','1316','Revenus des créances à plus d\'un an',1),
	(1320,'PCMN-BASE','PROD','XXXXXX','751','1315','Produits des actifs circulants',1),
	(1321,'PCMN-BASE','PROD','XXXXXX','752','1315','Plus-values sur réalisations d\'actifs circulants',1),
	(1322,'PCMN-BASE','PROD','XXXXXX','753','1315','Subsides en capital et en intérêts',1),
	(1323,'PCMN-BASE','PROD','XXXXXX','754','1315','Différences de change',1),
	(1324,'PCMN-BASE','PROD','XXXXXX','755','1315','Ecarts de conversion des devises',1),
	(1325,'PCMN-BASE','PROD','XXXXXX','756','1315','à 759 Produits financiers divers',1),
	(1326,'PCMN-BASE','PROD','XXXXXX','756','1315','Produits des autres créances',1),
	(1327,'PCMN-BASE','PROD','XXXXXX','757','1315','Escomptes obtenus',1),
	(1328,'PCMN-BASE','PROD','XXXXXX','76','1357','Produits exceptionnels',1),
	(1329,'PCMN-BASE','PROD','XXXXXX','760','1328','Reprises d\'amortissements et de réductions de valeur',1),
	(1330,'PCMN-BASE','PROD','XXXXXX','7600','1329','Sur immobilisations incorporelles',1),
	(1331,'PCMN-BASE','PROD','XXXXXX','7601','1329','Sur immobilisations corporelles',1),
	(1332,'PCMN-BASE','PROD','XXXXXX','761','1328','Reprises de réductions de valeur sur immobilisations financières',1),
	(1333,'PCMN-BASE','PROD','XXXXXX','762','1328','Reprises de provisions pour risques et charges exceptionnelles',1),
	(1334,'PCMN-BASE','PROD','XXXXXX','763','1328','Plus-values sur réalisation d\'actifs immobilisés',1),
	(1335,'PCMN-BASE','PROD','XXXXXX','7630','1334','Sur immobilisations incorporelles',1),
	(1336,'PCMN-BASE','PROD','XXXXXX','7631','1334','Sur immobilisations corporelles',1),
	(1337,'PCMN-BASE','PROD','XXXXXX','7632','1334','Sur immobilisations financières',1),
	(1338,'PCMN-BASE','PROD','XXXXXX','764','1328','Autres produits exceptionnels',1),
	(1339,'PCMN-BASE','PROD','XXXXXX','77','1357','Régularisations d\'impôts et reprises de provisions fiscales',1),
	(1340,'PCMN-BASE','PROD','XXXXXX','771','1339','Impôts belges sur le résultat',1),
	(1341,'PCMN-BASE','PROD','XXXXXX','7710','1340','Régularisations d\'impôts dus ou versés',1),
	(1342,'PCMN-BASE','PROD','XXXXXX','7711','1340','Régularisations d\'impôts estimés',1),
	(1343,'PCMN-BASE','PROD','XXXXXX','7712','1340','Reprises de provisions fiscales',1),
	(1344,'PCMN-BASE','PROD','XXXXXX','773','1339','Impôts étrangers sur le résultat',1),
	(1345,'PCMN-BASE','PROD','XXXXXX','79','1357','Affectation aux résultats',1),
	(1346,'PCMN-BASE','PROD','XXXXXX','790','1345','Bénéfice reporté de l\'exercice précédent',1),
	(1347,'PCMN-BASE','PROD','XXXXXX','791','1345','Prélèvement sur le capital et les primes d\'émission',1),
	(1348,'PCMN-BASE','PROD','XXXXXX','792','1345','Prélèvement sur les réserves',1),
	(1349,'PCMN-BASE','PROD','XXXXXX','793','1345','Perte à reporter',1),
	(1350,'PCMN-BASE','PROD','XXXXXX','794','1345','Intervention d\'associés (ou du propriétaire) dans la perte',1),
	(1351,'PCMN-BASE','CAPIT','XXXXXX','1','','Fonds propres, provisions pour risques et charges et dettes à plus d\'un an',1),
	(1352,'PCMN-BASE','IMMO','XXXXXX','2','','Frais d\'établissement. Actifs immobilisés et créances à plus d\'un an',1),
	(1353,'PCMN-BASE','STOCK','XXXXXX','3','','Stock et commandes en cours d\'exécution',1),
	(1354,'PCMN-BASE','TIERS','XXXXXX','4','','Créances et dettes à un an au plus',1),
	(1355,'PCMN-BASE','FINAN','XXXXXX','5','','Placement de trésorerie et de valeurs disponibles',1),
	(1356,'PCMN-BASE','CHARGE','XXXXXX','6','','Charges',1),
	(1357,'PCMN-BASE','PROD','XXXXXX','7','','Produits',1),
	(1401,'PCG99-ABREGE','CAPIT','XXXXXX','1','','Fonds propres, provisions pour risques et charges et dettes à plus d\'un an',1),
	(1402,'PCG99-ABREGE','IMMO','XXXXXX','2','','Frais d\'établissement. Actifs immobilisés et créances à plus d\'un an',1),
	(1403,'PCG99-ABREGE','STOCK','XXXXXX','3','','Stock et commandes en cours d\'exécution',1),
	(1404,'PCG99-ABREGE','TIERS','XXXXXX','4','','Créances et dettes à un an au plus',1),
	(1405,'PCG99-ABREGE','FINAN','XXXXXX','5','','Placement de trésorerie et de valeurs disponibles',1),
	(1406,'PCG99-ABREGE','CHARGE','XXXXXX','6','','Charges',1),
	(1407,'PCG99-ABREGE','PROD','XXXXXX','7','','Produits',1),
	(1501,'PCG99-BASE','CAPIT','XXXXXX','1','','Fonds propres, provisions pour risques et charges et dettes à plus d\'un an',1),
	(1502,'PCG99-BASE','IMMO','XXXXXX','2','','Frais d\'établissement. Actifs immobilisés et créances à plus d\'un an',1),
	(1503,'PCG99-BASE','STOCK','XXXXXX','3','','Stock et commandes en cours d\'exécution',1),
	(1504,'PCG99-BASE','TIERS','XXXXXX','4','','Créances et dettes à un an au plus',1),
	(1505,'PCG99-BASE','FINAN','XXXXXX','5','','Placement de trésorerie et de valeurs disponibles',1),
	(1506,'PCG99-BASE','CHARGE','XXXXXX','6','','Charges',1),
	(1507,'PCG99-BASE','PROD','XXXXXX','7','','Produits',1);

/*!40000 ALTER TABLE `llx_accountingaccount` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_accountingdebcred
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_accountingdebcred`;

CREATE TABLE `llx_accountingdebcred` (
  `fk_transaction` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `direction` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_accountingtransaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_accountingtransaction`;

CREATE TABLE `llx_accountingtransaction` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `datec` date NOT NULL,
  `fk_author` varchar(20) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_source` int(11) NOT NULL,
  `sourcetype` varchar(16) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_actioncomm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_actioncomm`;

CREATE TABLE `llx_actioncomm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_ext` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datep` datetime DEFAULT NULL,
  `datep2` datetime DEFAULT NULL,
  `datea` datetime DEFAULT NULL,
  `datea2` datetime DEFAULT NULL,
  `fk_action` int(11) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_parent` int(11) NOT NULL DEFAULT '0',
  `fk_user_action` int(11) DEFAULT NULL,
  `transparency` int(11) DEFAULT NULL,
  `fk_user_done` int(11) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `fulldayevent` smallint(6) NOT NULL DEFAULT '0',
  `punctual` smallint(6) NOT NULL DEFAULT '1',
  `percent` smallint(6) NOT NULL DEFAULT '0',
  `location` varchar(128) DEFAULT NULL,
  `durationp` double DEFAULT NULL,
  `durationa` double DEFAULT NULL,
  `note` text,
  `fk_element` int(11) DEFAULT NULL,
  `elementtype` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_actioncomm_datea` (`datea`),
  KEY `idx_actioncomm_fk_soc` (`fk_soc`),
  KEY `idx_actioncomm_fk_contact` (`fk_contact`),
  KEY `idx_actioncomm_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_actioncomm_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_actioncomm_extrafields`;

CREATE TABLE `llx_actioncomm_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_actioncomm_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_actioncomm_resources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_actioncomm_resources`;

CREATE TABLE `llx_actioncomm_resources` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_actioncomm` int(11) NOT NULL,
  `element_type` varchar(50) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `answer_status` varchar(50) DEFAULT NULL,
  `mandatory` smallint(6) DEFAULT NULL,
  `transparent` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_actioncomm_resources_idx1` (`fk_actioncomm`,`element_type`,`fk_element`),
  KEY `idx_actioncomm_resources_fk_element` (`fk_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_address`;

CREATE TABLE `llx_address` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `address_inline` varchar(255) NOT NULL,
  `digicode` varchar(25) DEFAULT NULL,
  `floor` varchar(50) DEFAULT NULL,
  `door` varchar(50) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `street_number` varchar(25) NOT NULL,
  `street_name` varchar(25) NOT NULL,
  `zip` varchar(25) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` int(11) NOT NULL,
  `region` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `honorific_prefix` varchar(50) DEFAULT NULL,
  `fk_element_type` varchar(50) NOT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` datetime DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_address_llx_c_pays` (`country`),
  KEY `llx_address_llx_c_regions` (`region`),
  KEY `llx_address_llx_c_departments` (`department`),
  CONSTRAINT `llx_address_llx_wynd_countries` FOREIGN KEY (`country`) REFERENCES `llx_wynd_countries` (`id`),
  CONSTRAINT `llx_address_llx_wynd_departments` FOREIGN KEY (`department`) REFERENCES `llx_wynd_departments` (`id`),
  CONSTRAINT `llx_address_llx_wynd_regions` FOREIGN KEY (`region`) REFERENCES `llx_wynd_regions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_address` WRITE;
/*!40000 ALTER TABLE `llx_address` DISABLE KEYS */;

INSERT INTO `llx_address` (`rowid`, `uuid`, `address_inline`, `digicode`, `floor`, `door`, `complement`, `street_number`, `street_name`, `zip`, `city`, `country`, `region`, `department`, `phone`, `mail`, `label`, `firstname`, `lastname`, `honorific_prefix`, `fk_element_type`, `fk_element`, `datec`, `tms`)
VALUES
	(1,'5c1db24a-ab57-4e67-8c91-53adf135edec','147, boulevard Cousin 63766 Lebondan','65638','43','175','quo','147','boulevard Cousin','63766','Lebondan',2,101,2,'+1748216818813','genevieve86@example.net','vitae','Édouard','Bertrand','Me.','entities',1,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(2,'991f4a8f-fc39-4763-b7ec-7de964941c5c','177, rue Rémy Becker 53035 Chevalier','98612','109','199','quae','177','rue Rémy Becker','53035','Chevalier',2,101,2,'+2278893606355','hoarau.oceane@example.org','ut','Hugues','Dupuis','M.','entities',2,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(3,'4f993598-d9db-4d82-adc2-9fbd9f9a3725','11, rue de Chauvin 14359 De Sousa','29390','18','171','omnis','11','rue de Chauvin','14359','De Sousa',2,101,2,'+2549292835878','christine20@example.com','quos','Olivie','Gallet','Me.','entities',3,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(4,'f88e6792-9447-404a-9f2a-3b4e20b317a5','198, impasse Guy Fabre 87 909 Roussel','34789','33','108','sunt','198','impasse Guy Fabre','87 909','Roussel',2,101,2,'+6809963789189','qgrondin@example.net','unde','Emmanuelle','Ferreira','Me.','entities',4,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(5,'2064d854-0eaf-4967-ad84-49595845bbea','153, boulevard Véronique Julien 79286 Le Goff','64784','149','22','deserunt','153','boulevard Véronique Julie','79286','Le Goff',2,101,2,'+4626411807598','blanc.christophe@example.com','dolor','Valérie','Roger','Pr.','entities',5,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(6,'ab1ce1a4-75ae-46ab-99ae-674937570ffc','91, impasse Thierry Allard 47253 Nguyen','77444','151','36','doloremque','91','impasse Thierry Allard','47253','Nguyen',2,101,2,'+8279603310670','frederic23@example.net','libero','Tristan','Joseph','Dr.','customers',1,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(7,'1e6001e6-2efc-4258-b170-994ab0f07322','83, boulevard Honoré Blanchard 35 844 Grondin-sur-Mer','37210','176','73','pariatur','83','boulevard Honoré Blanchar','35 844','Grondin-sur-Mer',2,101,2,'+1568197421944','gillet.francois@example.net','quia','Cécile','Boucher','Pr.','customers',2,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(8,'3f03e697-f92d-407a-9969-a2d4626d310a','115, place Augustin Chauvin 91413 Turpin','95720','96','10','qui','115','place Augustin Chauvin','91413','Turpin',2,101,2,'+7635403977205','roger64@example.net','ea','Margot','Hernandez','Mme.','customers',3,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(9,'9791fad6-86af-4935-adbd-dc4114fe9a48','11, avenue Thomas Colin 52043 Collin','37734','152','52','sit','11','avenue Thomas Colin','52043','Collin',2,101,2,'+8190884803516','fernandes.pauline@example.com','sint','Luc','Menard','Pr.','customers',4,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(10,'dcfdc253-3a97-4794-9347-72c2cb45cab3','160, chemin Dupont 17 018 Chevallier','61645','174','26','aut','160','chemin Dupont','17 018','Chevallier',2,101,2,'+3470833777139','etienne.francoise@example.org','libero','Éric','Carre','M.','customers',5,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(11,'33d14f85-a34d-4183-8483-eab9fe8ca35e','68, place de Vaillant 89995 Boulaynec','80364','122','105','possimus','68','place de Vaillant','89995','Boulaynec',2,101,2,'+3303092040934','thibaut99@example.net','iusto','Roland','Duval','Dr.','users',1,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(12,'569e529b-727e-4fcd-be78-ce28c038e16f','142, place Édouard Dufour 09 905 Boutin-sur-Bertrand','15977','187','138','et','142','place Édouard Dufour','09 905','Boutin-sur-Bertrand',2,101,2,'+0464585123379','nathalie.rousseau@example.net','placeat','Antoinette','Richard','Me.','users',2,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(13,'a102ed6e-527c-4fa4-9f36-72d886716c88','192, chemin Éric Turpin 40584 Guerin','35864','33','122','aspernatur','192','chemin Éric Turpin','40584','Guerin',2,101,2,'+6092579862650','qbousquet@example.com','sunt','Jacqueline','Jacquet','Me.','users',3,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(14,'d5e6a915-63d2-4bb4-ad70-b9213dc1865d','47, chemin Élise Olivier 20 272 Renard','28771','176','36','ipsum','47','chemin Élise Olivier','20 272','Renard',2,101,2,'+3825339777180','gilbert07@example.net','nobis','Alice','Collet','Me.','users',4,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(15,'33451fd9-2a6e-436a-910c-d92a338356e8','52, chemin de Julien 54 622 Blancdan','57983','50','192','ex','52','chemin de Julien','54 622','Blancdan',2,101,2,'+0710417706424','frederic.lecomte@example.org','reprehenderit','Josette','Guyot','Dr.','users',5,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(16,'f23ca6fb-a346-4e5c-996e-be72b6141aa0','150, rue Moreno 50485 Royer-sur-Nguyen','12236','150','180','nihil','150','rue Moreno','50485','Royer-sur-Nguyen',2,101,2,'+7724200530593','patrick.thomas@example.org','in','Victor','Jourdan','Pr.','invoices',1,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(17,'a5cdea3e-2cf3-4905-849d-c9a7c0a947d6','21, rue Maury 59955 Joseph','79864','118','67','distinctio','21','rue Maury','59955','Joseph',2,101,2,'+9928387877384','bertrand74@example.org','eligendi','Honoré','Paul','Me.','invoices',2,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(18,'9f6c501c-1837-4234-84f9-71b408c6b243','84, rue Frédéric Simon 29564 Lamy','58924','141','56','ea','84','rue Frédéric Simon','29564','Lamy',2,101,2,'+2933073537296','edith.blin@example.net','totam','Adrien','Da Silva','Dr.','invoices',3,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(19,'e7993b4a-eff3-491c-9c58-01c9d2b07d39','181, place Payet 83127 DupreVille','91199','194','82','esse','181','place Payet','83127','DupreVille',2,101,2,'+7085174857183','picard.corinne@example.com','ullam','Stéphanie','Lopez','Pr.','invoices',4,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(20,'253f11a7-f413-4323-8ec3-c7f59d0a0368','191, impasse Imbert 73564 Albert','22653','127','119','dolorum','191','impasse Imbert','73564','Albert',2,101,2,'+6562854506101','gilles.pinto@example.net','dolorum','Isaac','Besson','Mlle','invoices',5,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(21,'5f3877a7-a488-4a5e-85e6-522675f1217c','37, boulevard Louise Gauthier 60 386 Merle-sur-Leleu','70532','114','25','laboriosam','37','boulevard Louise Gauthier','60 386','Merle-sur-Leleu',2,101,2,'+3398373846858','hardy.william@example.net','quos','Susanne','Guillou','Dr.','orders',1,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(22,'ac652290-abc8-4ab1-92c7-02fd292255ad','17, chemin Roland Fournier 14814 PeronVille','86886','78','19','velit','17','chemin Roland Fournier','14814','PeronVille',2,101,2,'+2963895186596','pfernandez@example.org','alias','Bernard','Petit','Me.','orders',2,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(23,'5334a6b4-64a7-4401-8ad1-6bb021bfbb07','44, rue Eugène Mathieu 14 678 DupontVille','36287','176','196','suscipit','44','rue Eugène Mathieu','14 678','DupontVille',2,101,2,'+3469613598993','dorothee59@example.org','at','Joseph','Perrot','Pr.','orders',3,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(24,'a688e38e-6f7e-419d-8401-a7de2b30c6d1','64, avenue Lecoq 80683 Faure','23000','55','112','neque','64','avenue Lecoq','80683','Faure',2,101,2,'+9190332009323','marchal.corinne@example.net','nihil','Xavier','Faure','Pr.','orders',4,'2017-08-11 17:41:00','2017-08-11 17:41:00'),
	(25,'e5045eaa-237a-4308-970b-6de889cf010f','44, impasse Leclercq 79358 Gilles','30089','38','8','distinctio','44','impasse Leclercq','79358','Gilles',2,101,2,'+3051174404841','rjean@example.net','architecto','Maurice','Guyon','Mlle','orders',5,'2017-08-11 17:41:00','2017-08-11 17:41:00');

/*!40000 ALTER TABLE `llx_address` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_adherent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_adherent`;

CREATE TABLE `llx_adherent` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `civilite` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `fk_adherent_type` int(11) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `societe` varchar(50) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `address` text,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `public` smallint(6) NOT NULL DEFAULT '0',
  `datefin` datetime DEFAULT NULL,
  `note` text,
  `datevalid` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_login` (`login`,`entity`),
  UNIQUE KEY `uk_adherent_fk_soc` (`fk_soc`),
  KEY `idx_adherent_fk_adherent_type` (`fk_adherent_type`),
  CONSTRAINT `adherent_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_adherent_adherent_type` FOREIGN KEY (`fk_adherent_type`) REFERENCES `llx_adherent_type` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_adherent_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_adherent_extrafields`;

CREATE TABLE `llx_adherent_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_adherent_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_adherent_type`;

CREATE TABLE `llx_adherent_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `libelle` varchar(50) NOT NULL,
  `cotisation` varchar(3) NOT NULL DEFAULT 'yes',
  `vote` varchar(3) NOT NULL DEFAULT 'yes',
  `note` text,
  `mail_valid` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_type_libelle` (`libelle`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_adherent_type_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_adherent_type_extrafields`;

CREATE TABLE `llx_adherent_type_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_type_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_api_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_api_users`;

CREATE TABLE `llx_api_users` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) NOT NULL,
  `entity` int(3) DEFAULT '1',
  `secret` varchar(40) NOT NULL,
  `privileges` varchar(255) DEFAULT '',
  `salt` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `roles` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_api_users` WRITE;
/*!40000 ALTER TABLE `llx_api_users` DISABLE KEYS */;

INSERT INTO `llx_api_users` (`id`, `user`, `entity`, `secret`, `privileges`, `salt`, `password`, `email`, `is_active`, `roles`, `created_at`)
VALUES
	(1,'admin_api',NULL,'test',NULL,'29b7a0fb2ff5eb80db8f2f7468b086aa','7299d1251ea7fc8068326c8b5092860b8c4d32a5','wdiallo@live.com',1,'a:2:{i:0;s:9:\"ROLE_USER\";i:1;s:10:\"ROLE_ADMIN\";}','2017-08-11 17:40:39'),
	(2,'app_desktop',NULL,'test',NULL,'064030ab5a8e788412984d7901b04584','b8d9803d253c22207edeb946eb115143d6567b64','xvalentin@dbmail.com',1,'a:2:{i:0;s:9:\"ROLE_USER\";i:1;s:8:\"ROLE_APP\";}','2017-08-11 17:40:39'),
	(3,'app_ios',NULL,'test',NULL,'2ccb23413c3a73e9340e2e9a26cb0781','3baa13a50d3c909355e06406f64fb7467b93ca45','denise39@foucher.net',1,'a:2:{i:0;s:9:\"ROLE_USER\";i:1;s:8:\"ROLE_APP\";}','2017-08-11 17:40:39'),
	(4,'app_android',NULL,'test',NULL,'7c9ad91bf75b0b079df77d70c4d9fe3d','b23f4f92eca491b6299a22d09c6b0c7cae4dd0de','frederic.lejeune@yahoo.fr',1,'a:2:{i:0;s:9:\"ROLE_USER\";i:1;s:8:\"ROLE_APP\";}','2017-08-11 17:40:39');

/*!40000 ALTER TABLE `llx_api_users` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_bank
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_bank`;

CREATE TABLE `llx_bank` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datev` date DEFAULT NULL,
  `dateo` date DEFAULT NULL,
  `amount` varchar(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `fk_account` int(11) NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_rappro` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `num_releve` varchar(50) DEFAULT NULL,
  `num_chq` varchar(50) DEFAULT NULL,
  `rappro` tinyint(4) DEFAULT '0',
  `note` text,
  `fk_bordereau` int(11) DEFAULT '0',
  `banque` varchar(255) DEFAULT NULL,
  `emetteur` varchar(255) DEFAULT NULL,
  `author` varchar(40) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_datev` (`datev`),
  KEY `idx_bank_dateo` (`dateo`),
  KEY `idx_bank_fk_account` (`fk_account`),
  KEY `idx_bank_rappro` (`rappro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_bank` WRITE;
/*!40000 ALTER TABLE `llx_bank` DISABLE KEYS */;

INSERT INTO `llx_bank` (`rowid`, `datec`, `tms`, `datev`, `dateo`, `amount`, `label`, `fk_account`, `fk_user_author`, `fk_user_rappro`, `fk_type`, `num_releve`, `num_chq`, `rappro`, `note`, `fk_bordereau`, `banque`, `emetteur`, `author`, `updated_by`, `uuid`)
VALUES
	(1,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'145860','est',2,NULL,NULL,3,NULL,NULL,0,'Excepturi et necessitatibus tenetur doloremque.',0,NULL,NULL,NULL,NULL,'be8b156a-255d-4b8c-91ab-6e31753ffdfb'),
	(2,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'78016','rerum',3,NULL,NULL,2,NULL,NULL,0,'Necessitatibus eius commodi odio ut aliquid.',0,NULL,NULL,NULL,NULL,'84282eb1-ce3e-469f-a430-d631875ccf93'),
	(3,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'115838','minus',3,NULL,NULL,2,NULL,NULL,0,'Repudiandae qui voluptatem distinctio modi officiis.',0,NULL,NULL,NULL,NULL,'507fd08e-95c6-48b8-9635-0c3c58855281'),
	(4,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'45177','quia',3,NULL,NULL,3,NULL,NULL,0,'Qui eligendi quo voluptas totam asperiores ab tenetur voluptatem.',0,NULL,NULL,NULL,NULL,'8908fd10-7540-41b5-aaef-18100bc3f2fb'),
	(5,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'137121','iste',3,NULL,NULL,3,NULL,NULL,0,'Quaerat nostrum voluptas est.',0,NULL,NULL,NULL,NULL,'46735292-8429-48a9-a993-549c3311e060'),
	(6,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'170700','qui',3,NULL,NULL,2,NULL,NULL,0,'Nihil aliquid eos fugit.',0,NULL,NULL,NULL,NULL,'0fb7a42b-5e96-4f6c-bdfe-bcc9e8a922c3'),
	(7,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'21427','dolores',3,NULL,NULL,3,NULL,NULL,0,'Itaque doloribus qui dicta eligendi quae recusandae.',0,NULL,NULL,NULL,NULL,'b958f133-17bb-4fb5-9f16-db8926880fe0'),
	(8,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'65013','molestiae',2,NULL,NULL,2,NULL,NULL,0,'Quo quis inventore qui.',0,NULL,NULL,NULL,NULL,'8a0c0cf0-1016-4a1a-bdc1-101bb6c505a3'),
	(9,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'166498','dolores',3,NULL,NULL,2,NULL,NULL,0,'Reprehenderit nesciunt architecto quas ex similique consequatur nisi.',0,NULL,NULL,NULL,NULL,'a285d8d6-d7e2-490b-8b4b-9ec4594ba7df'),
	(10,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'11422','illum',2,NULL,NULL,2,NULL,NULL,0,'Voluptas a aperiam voluptas aut qui neque minus eos.',0,NULL,NULL,NULL,NULL,'2dc96227-9be2-46ef-8c4d-123f43864db5'),
	(11,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'13915','fugit',2,NULL,NULL,2,NULL,NULL,0,'Excepturi enim velit qui nam nesciunt non dolore quis.',0,NULL,NULL,NULL,NULL,'76866445-07cc-41af-8b77-eaa856fd1c73'),
	(12,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'8703','pariatur',2,NULL,NULL,2,NULL,NULL,0,'Ea vel omnis rerum explicabo inventore quam.',0,NULL,NULL,NULL,NULL,'2ac47170-1b5e-43e1-bfee-0d486af18fa9'),
	(13,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'129880','similique',3,NULL,NULL,3,NULL,NULL,0,'Aut sit aliquam provident et voluptatem eveniet consequatur sit.',0,NULL,NULL,NULL,NULL,'652b1496-589c-463c-8d55-cbbd96d2aa74'),
	(14,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'122063','magnam',2,NULL,NULL,3,NULL,NULL,0,'Nemo possimus qui totam iste perspiciatis harum animi et.',0,NULL,NULL,NULL,NULL,'d5131198-44e5-40a1-a1bb-cb4ecd0e82e7'),
	(15,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'184039','facere',2,NULL,NULL,2,NULL,NULL,0,'Et quod velit velit ut rem repellendus ut.',0,NULL,NULL,NULL,NULL,'e9e51ecb-8559-4ffc-abe4-2332112a39f2'),
	(16,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'172918','similique',2,NULL,NULL,3,NULL,NULL,0,'Ut est in reprehenderit reiciendis accusamus facilis.',0,NULL,NULL,NULL,NULL,'a067d3a6-9d0f-4b0f-b5ed-2322269dec6f'),
	(17,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'59060','doloremque',2,NULL,NULL,3,NULL,NULL,0,'Aut molestiae sapiente est consequatur.',0,NULL,NULL,NULL,NULL,'07068967-9d52-4e50-8c79-a4061ec9d053'),
	(18,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'161732','facere',3,NULL,NULL,2,NULL,NULL,0,'Doloremque quasi vero nobis error fuga ut.',0,NULL,NULL,NULL,NULL,'d954ed10-16a9-4a1b-9999-cba267090ea3'),
	(19,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'50404','ad',3,NULL,NULL,3,NULL,NULL,0,'Est impedit itaque cumque officiis ut quis.',0,NULL,NULL,NULL,NULL,'d4fb0052-13e2-4bb3-b780-d78379c920e4'),
	(20,'2017-08-11 17:40:47','2017-08-11 17:40:47',NULL,NULL,'72713','corrupti',3,NULL,NULL,2,NULL,NULL,0,'Molestiae cupiditate rerum ratione rerum.',0,NULL,NULL,NULL,NULL,'d4a603eb-6fdb-4d24-a348-485fe7dc1aa9');

/*!40000 ALTER TABLE `llx_bank` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_bank_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_bank_account`;

CREATE TABLE `llx_bank_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(12) DEFAULT NULL,
  `label` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `bank` varchar(60) DEFAULT NULL,
  `code_banque` varchar(8) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `country_iban` varchar(2) DEFAULT NULL,
  `cle_iban` varchar(2) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `courant` smallint(6) NOT NULL DEFAULT '0',
  `clos` smallint(6) NOT NULL DEFAULT '0',
  `rappro` smallint(6) DEFAULT '1',
  `url` varchar(128) DEFAULT NULL,
  `account_number` varchar(24) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `min_allowed` int(11) DEFAULT '0',
  `min_desired` int(11) DEFAULT '0',
  `comment` text,
  `ip_address` varchar(255) DEFAULT NULL,
  `order_num_prefix` varchar(255) DEFAULT '0',
  `order_num_nextnum` int(36) DEFAULT '0',
  `uuid` varchar(36) NOT NULL,
  `origin` int(9) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 DEFAULT 'regular',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_account_label` (`label`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_bank_account` WRITE;
/*!40000 ALTER TABLE `llx_bank_account` DISABLE KEYS */;

INSERT INTO `llx_bank_account` (`rowid`, `datec`, `tms`, `ref`, `label`, `entity`, `bank`, `code_banque`, `code_guichet`, `number`, `cle_rib`, `bic`, `iban_prefix`, `country_iban`, `cle_iban`, `domiciliation`, `state_id`, `fk_pays`, `proprio`, `owner_address`, `courant`, `clos`, `rappro`, `url`, `account_number`, `currency_code`, `min_allowed`, `min_desired`, `comment`, `ip_address`, `order_num_prefix`, `order_num_nextnum`, `uuid`, `origin`, `type`)
VALUES
	(1,'2017-08-11 17:40:46','2017-08-11 17:40:46','','aut',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,1,NULL,NULL,'',0,0,NULL,'','',1,'3011be06-5b07-480e-b0c7-a865d6ec5b1f',3,'regular'),
	(2,'2017-08-11 17:40:46','2017-08-11 17:40:46','','consequuntur',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,1,NULL,NULL,'',0,0,NULL,'','',2,'b9bb2ce2-66c3-41fe-b18a-efd034fccd3f',2,'regular'),
	(3,'2017-08-11 17:40:46','2017-08-11 17:40:46','','qui',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,1,NULL,NULL,'',0,0,NULL,'','',3,'70c3aede-be8e-442a-9176-26fe95b9485d',3,'regular'),
	(4,'2017-08-11 17:40:46','2017-08-11 17:40:46','','maiores',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,1,NULL,NULL,'',0,0,NULL,'','',4,'029e2031-2c5a-40b2-924e-e8e400d7dc09',2,'regular'),
	(5,'2017-08-11 17:40:46','2017-08-11 17:40:46','','rerum',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,1,NULL,NULL,'',0,0,NULL,'','',5,'925cf721-d057-4b6f-8c5a-427f05973abe',2,'regular');

/*!40000 ALTER TABLE `llx_bank_account` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_bank_account_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_bank_account_extrafields`;

CREATE TABLE `llx_bank_account_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `payment_mode` text,
  `origin` text,
  `ip_adress` varchar(255) DEFAULT NULL,
  `destination` text,
  `order_num_prefix` varchar(255) DEFAULT '0',
  `order_num_nextnum` varchar(255) DEFAULT '00',
  `cashier_type` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_account_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_bank_categ
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_bank_categ`;

CREATE TABLE `llx_bank_categ` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_bank_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_bank_class`;

CREATE TABLE `llx_bank_class` (
  `lineid` int(11) NOT NULL,
  `fk_categ` int(11) NOT NULL,
  UNIQUE KEY `uk_bank_class_lineid` (`lineid`,`fk_categ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_bank_url
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_bank_url`;

CREATE TABLE `llx_bank_url` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_bank` int(11) DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_url` (`fk_bank`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_basket
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_basket`;

CREATE TABLE `llx_basket` (
  `rowid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_order` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT NULL,
  `origin` varchar(15) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `deliveryTime` datetime DEFAULT NULL,
  `addressDelivery` varchar(100) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `hasSubstitution` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `orderType` varchar(10) DEFAULT NULL,
  KEY `fk_order` (`fk_order`),
  KEY `rowid` (`rowid`),
  CONSTRAINT `llx_basket_ibfk_1` FOREIGN KEY (`fk_order`) REFERENCES `llx_commande` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_booking_closed_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_closed_resource`;

CREATE TABLE `llx_booking_closed_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `date_time_start` datetime NOT NULL,
  `date_time_end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `closed_resource_id_fk` (`resource_id`),
  CONSTRAINT `closed_resource_id_fk` FOREIGN KEY (`resource_id`) REFERENCES `llx_booking_resource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table llx_booking_commande_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_commande_resource`;

CREATE TABLE `llx_booking_commande_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commande_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `slots_resources` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `commande_fk` (`commande_id`),
  KEY `commande_resource_id_fk` (`resource_id`),
  CONSTRAINT `commande_fk` FOREIGN KEY (`commande_id`) REFERENCES `llx_commande` (`rowid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commande_resource_id_fk` FOREIGN KEY (`resource_id`) REFERENCES `llx_booking_resource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_booking_period
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_period`;

CREATE TABLE `llx_booking_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_id_fk` (`entity_id`),
  CONSTRAINT `entity_id_fk` FOREIGN KEY (`entity_id`) REFERENCES `llx_entity` (`rowid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `llx_booking_period` WRITE;
/*!40000 ALTER TABLE `llx_booking_period` DISABLE KEYS */;

INSERT INTO `llx_booking_period` (`id`, `entity_id`, `label`)
VALUES
	(1,1,'default');

/*!40000 ALTER TABLE `llx_booking_period` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_booking_prestation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_prestation`;

CREATE TABLE `llx_booking_prestation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `description` text,
  `length` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prestation_product_fk` (`product_id`),
  CONSTRAINT `prestation_product_fk` FOREIGN KEY (`product_id`) REFERENCES `llx_product` (`rowid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table llx_booking_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_resource`;

CREATE TABLE `llx_booking_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) NOT NULL,
  `resource_group_id` int(11) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `secable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `resource_entity_id_fk` (`entity_id`),
  KEY `resource_group_id_fk` (`resource_group_id`),
  CONSTRAINT `resource_entity_id_fk` FOREIGN KEY (`entity_id`) REFERENCES `llx_entity` (`rowid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resource_group_id_fk` FOREIGN KEY (`resource_group_id`) REFERENCES `llx_booking_resource_group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table llx_booking_resource_destination
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_resource_destination`;

CREATE TABLE `llx_booking_resource_destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_destination_fk` (`destination_id`),
  KEY `booking_resource_fk` (`resource_id`),
  CONSTRAINT `booking_destination_fk` FOREIGN KEY (`destination_id`) REFERENCES `llx_wynd_destination` (`rowid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_resource_fk` FOREIGN KEY (`resource_id`) REFERENCES `llx_booking_resource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_booking_resource_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_resource_group`;

CREATE TABLE `llx_booking_resource_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `sharable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table llx_booking_slot
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_slot`;

CREATE TABLE `llx_booking_slot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `date_time_start` datetime NOT NULL,
  `date_time_end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_start_end` (`date_time_start`,`date_time_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table llx_booking_slot_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_slot_resource`;

CREATE TABLE `llx_booking_slot_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `item_capacity` int(11) NOT NULL DEFAULT '1',
  `item_load` int(11) NOT NULL DEFAULT '0',
  `min_item_capacity` int(11) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `order_capacity` int(11) NOT NULL DEFAULT '1',
  `order_load` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `llx_unique_slot_resource` (`slot_id`,`resource_id`),
  KEY `slot_id_fk` (`slot_id`),
  KEY `resource_id_fk` (`resource_id`),
  KEY `closed_slot_resource` (`closed`),
  KEY `tpl_resource_id_fk` (`resource_id`),
  CONSTRAINT `resource_id_fk` FOREIGN KEY (`resource_id`) REFERENCES `llx_booking_resource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `slot_id_fk` FOREIGN KEY (`slot_id`) REFERENCES `llx_booking_slot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table llx_booking_slot_resource_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_slot_resource_template`;

CREATE TABLE `llx_booking_slot_resource_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `item_capacity` int(11) NOT NULL DEFAULT '1',
  `min_item_capacity` int(11) NOT NULL DEFAULT '1',
  `week_day` int(11) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `order_capacity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `tpl_resource_id_fk` (`resource_id`),
  CONSTRAINT `tpl_resource_id_fk` FOREIGN KEY (`resource_id`) REFERENCES `llx_booking_resource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table llx_booking_slots_periods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_booking_slots_periods`;

CREATE TABLE `llx_booking_slots_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `period_id_fk001` (`period_id`),
  KEY `slot_id_fk011` (`slot_id`),
  CONSTRAINT `period_id_fk001` FOREIGN KEY (`period_id`) REFERENCES `llx_booking_period` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `slot_id_fk001` FOREIGN KEY (`slot_id`) REFERENCES `llx_booking_slot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table llx_bookmark
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_bookmark`;

CREATE TABLE `llx_bookmark` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `dateb` datetime DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(16) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `favicon` varchar(24) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bookmark_url` (`fk_user`,`url`),
  UNIQUE KEY `uk_bookmark_title` (`fk_user`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_bordereau_cheque
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_bordereau_cheque`;

CREATE TABLE `llx_bordereau_cheque` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(16) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `date_bordereau` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `nbcheque` smallint(6) NOT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bordereau_cheque` (`number`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_boxes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_boxes`;

CREATE TABLE `llx_boxes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `box_id` int(11) NOT NULL,
  `position` smallint(6) NOT NULL,
  `box_order` varchar(3) NOT NULL,
  `fk_user` int(11) NOT NULL DEFAULT '0',
  `maxline` int(11) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes` (`entity`,`box_id`,`position`,`fk_user`),
  KEY `idx_boxes_boxid` (`box_id`),
  KEY `idx_boxes_fk_user` (`fk_user`),
  CONSTRAINT `fk_boxes_box_id` FOREIGN KEY (`box_id`) REFERENCES `llx_boxes_def` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_boxes` WRITE;
/*!40000 ALTER TABLE `llx_boxes` DISABLE KEYS */;

INSERT INTO `llx_boxes` (`rowid`, `entity`, `box_id`, `position`, `box_order`, `fk_user`, `maxline`, `params`)
VALUES
	(1,1,1,0,'A01',0,NULL,NULL),
	(2,1,2,0,'B18',0,NULL,NULL),
	(3,1,3,0,'A17',0,NULL,NULL),
	(4,1,4,0,'B16',0,NULL,NULL),
	(25,1,25,0,'A15',0,NULL,NULL),
	(26,1,26,0,'B14',0,NULL,NULL),
	(27,1,27,0,'A13',0,NULL,NULL),
	(28,1,28,0,'B12',0,NULL,NULL),
	(29,1,29,0,'A11',0,NULL,NULL),
	(30,1,30,0,'B10',0,NULL,NULL),
	(31,1,31,0,'A09',0,NULL,NULL),
	(32,1,32,0,'B08',0,NULL,NULL),
	(33,1,33,0,'A07',0,NULL,NULL),
	(34,1,34,0,'B06',0,NULL,NULL),
	(35,1,35,0,'A05',0,NULL,NULL),
	(36,1,36,0,'B04',0,NULL,NULL),
	(37,1,37,0,'A03',0,NULL,NULL),
	(38,1,38,0,'B02',0,NULL,NULL),
	(39,1,39,0,'A19',0,NULL,NULL),
	(92,1,1,0,'A01',1,NULL,NULL),
	(93,1,37,0,'A02',1,NULL,NULL),
	(94,1,35,0,'A03',1,NULL,NULL),
	(95,1,33,0,'A04',1,NULL,NULL),
	(96,1,31,0,'A05',1,NULL,NULL),
	(97,1,29,0,'A06',1,NULL,NULL),
	(98,1,27,0,'A07',1,NULL,NULL),
	(99,1,25,0,'A08',1,NULL,NULL),
	(100,1,3,0,'A09',1,NULL,NULL),
	(101,1,39,0,'A10',1,NULL,NULL),
	(102,1,38,0,'B01',1,NULL,NULL),
	(103,1,36,0,'B02',1,NULL,NULL),
	(104,1,34,0,'B03',1,NULL,NULL),
	(105,1,32,0,'B04',1,NULL,NULL),
	(106,1,30,0,'B05',1,NULL,NULL),
	(107,1,28,0,'B06',1,NULL,NULL),
	(108,1,26,0,'B07',1,NULL,NULL),
	(109,1,2,0,'B08',1,NULL,NULL),
	(113,3,43,0,'0',0,NULL,NULL),
	(114,3,44,0,'0',0,NULL,NULL),
	(115,3,45,0,'0',0,NULL,NULL),
	(116,3,46,0,'0',0,NULL,NULL),
	(130,3,60,0,'0',0,NULL,NULL),
	(131,3,61,0,'0',0,NULL,NULL),
	(132,3,62,0,'0',0,NULL,NULL),
	(133,3,63,0,'0',0,NULL,NULL),
	(134,3,64,0,'0',0,NULL,NULL),
	(139,3,69,0,'0',0,NULL,NULL),
	(140,3,70,0,'0',0,NULL,NULL),
	(141,3,71,0,'0',0,NULL,NULL),
	(142,3,72,0,'0',0,NULL,NULL),
	(143,3,73,0,'0',0,NULL,NULL),
	(144,3,74,0,'0',0,NULL,NULL),
	(145,3,75,0,'0',0,NULL,NULL),
	(146,3,76,0,'0',0,NULL,NULL),
	(147,3,77,0,'0',0,NULL,NULL),
	(148,3,78,0,'0',0,NULL,NULL),
	(253,1,1,0,'A01',32,NULL,NULL),
	(254,1,37,0,'A02',32,NULL,NULL),
	(255,1,35,0,'A03',32,NULL,NULL),
	(256,1,33,0,'A04',32,NULL,NULL),
	(257,1,31,0,'A05',32,NULL,NULL),
	(258,1,29,0,'A06',32,NULL,NULL),
	(259,1,27,0,'A07',32,NULL,NULL),
	(260,1,25,0,'A08',32,NULL,NULL),
	(261,1,3,0,'A09',32,NULL,NULL),
	(262,1,39,0,'A10',32,NULL,NULL),
	(263,1,38,0,'B01',32,NULL,NULL),
	(264,1,36,0,'B02',32,NULL,NULL),
	(265,1,34,0,'B03',32,NULL,NULL),
	(266,1,32,0,'B04',32,NULL,NULL),
	(267,1,30,0,'B05',32,NULL,NULL),
	(268,1,28,0,'B06',32,NULL,NULL),
	(269,1,26,0,'B07',32,NULL,NULL),
	(270,1,2,0,'B08',32,NULL,NULL);

/*!40000 ALTER TABLE `llx_boxes` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_boxes_def
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_boxes_def`;

CREATE TABLE `llx_boxes_def` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes_def` (`file`,`entity`,`note`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_boxes_def` WRITE;
/*!40000 ALTER TABLE `llx_boxes_def` DISABLE KEYS */;

INSERT INTO `llx_boxes_def` (`rowid`, `file`, `entity`, `tms`, `note`)
VALUES
	(1,'box_clients.php',1,'2015-11-22 17:56:01',NULL),
	(2,'box_prospect.php',1,'2015-11-22 17:56:01',NULL),
	(3,'box_contacts.php',1,'2015-11-22 17:56:01',NULL),
	(4,'box_activity.php',1,'2015-11-22 17:56:01','(WarningUsingThisBoxSlowDown)'),
	(25,'box_graph_invoices_supplier_permonth.php',1,'2015-11-22 17:56:01',NULL),
	(26,'box_graph_orders_supplier_permonth.php',1,'2015-11-22 17:56:01',NULL),
	(27,'box_fournisseurs.php',1,'2015-11-22 17:56:01',NULL),
	(28,'box_factures_fourn_imp.php',1,'2015-11-22 17:56:01',NULL),
	(29,'box_factures_fourn.php',1,'2015-11-22 17:56:01',NULL),
	(30,'box_supplier_orders.php',1,'2015-11-22 17:56:01',NULL),
	(31,'box_produits.php',1,'2015-11-22 17:56:04',NULL),
	(32,'box_produits_alerte_stock.php',1,'2015-11-22 17:56:04',NULL),
	(33,'box_graph_product_distribution.php',1,'2015-11-22 17:56:04',NULL),
	(34,'box_comptes.php',1,'2015-11-22 17:56:04',NULL),
	(35,'box_factures_imp.php',1,'2015-11-22 17:56:04',NULL),
	(36,'box_factures.php',1,'2015-11-22 17:56:04',NULL),
	(37,'box_graph_invoices_permonth.php',1,'2015-11-22 17:56:04',NULL),
	(38,'box_commandes.php',1,'2015-11-22 17:56:04',NULL),
	(39,'box_graph_orders_permonth.php',1,'2015-11-22 17:56:04',NULL),
	(43,'box_clients.php',3,'2016-06-28 13:43:56',NULL),
	(44,'box_prospect.php',3,'2016-06-28 13:43:56',NULL),
	(45,'box_contacts.php',3,'2016-06-28 13:43:56',NULL),
	(46,'box_activity.php',3,'2016-06-28 13:43:56','(WarningUsingThisBoxSlowDown)'),
	(60,'box_produits.php',3,'2016-06-28 14:52:41',NULL),
	(61,'box_produits_alerte_stock.php',3,'2016-06-28 14:52:41',NULL),
	(62,'box_graph_product_distribution.php',3,'2016-06-28 14:52:41',NULL),
	(63,'box_commandes.php',3,'2016-06-28 14:52:41',NULL),
	(64,'box_graph_orders_permonth.php',3,'2016-06-28 14:52:41',NULL),
	(69,'box_comptes.php',3,'2016-06-28 14:52:42',NULL),
	(70,'box_factures_imp.php',3,'2016-06-28 14:52:42',NULL),
	(71,'box_factures.php',3,'2016-06-28 14:52:42',NULL),
	(72,'box_graph_invoices_permonth.php',3,'2016-06-28 14:52:42',NULL),
	(73,'box_graph_invoices_supplier_permonth.php',3,'2016-06-28 14:52:43',NULL),
	(74,'box_graph_orders_supplier_permonth.php',3,'2016-06-28 14:52:43',NULL),
	(75,'box_fournisseurs.php',3,'2016-06-28 14:52:43',NULL),
	(76,'box_factures_fourn_imp.php',3,'2016-06-28 14:52:43',NULL),
	(77,'box_factures_fourn.php',3,'2016-06-28 14:52:43',NULL),
	(78,'box_supplier_orders.php',3,'2016-06-28 14:52:43',NULL);

/*!40000 ALTER TABLE `llx_boxes_def` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_action_trigger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_action_trigger`;

CREATE TABLE `llx_c_action_trigger` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `elementtype` varchar(16) NOT NULL,
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_action_trigger_code` (`code`),
  KEY `idx_action_trigger_rang` (`rang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_action_trigger` WRITE;
/*!40000 ALTER TABLE `llx_c_action_trigger` DISABLE KEYS */;

INSERT INTO `llx_c_action_trigger` (`rowid`, `code`, `label`, `description`, `elementtype`, `rang`)
VALUES
	(1,'FICHINTER_VALIDATE','Intervention validated','Executed when a intervention is validated','ficheinter',19),
	(2,'BILL_VALIDATE','Customer invoice validated','Executed when a customer invoice is approved','facture',6),
	(3,'ORDER_SUPPLIER_APPROVE','Supplier order request approved','Executed when a supplier order is approved','order_supplier',12),
	(4,'ORDER_SUPPLIER_REFUSE','Supplier order request refused','Executed when a supplier order is refused','order_supplier',13),
	(5,'ORDER_VALIDATE','Customer order validate','Executed when a customer order is validated','commande',4),
	(6,'PROPAL_VALIDATE','Customer proposal validated','Executed when a commercial proposal is validated','propal',2),
	(9,'COMPANY_SENTBYMAIL','Mails sent from third party card','Executed when you send email from third party card','societe',1),
	(10,'COMPANY_CREATE','Third party created','Executed when a third party is created','societe',1),
	(11,'CONTRACT_VALIDATE','Contract validated','Executed when a contract is validated','contrat',18),
	(12,'PROPAL_SENTBYMAIL','Commercial proposal sent by mail','Executed when a commercial proposal is sent by mail','propal',3),
	(13,'ORDER_SENTBYMAIL','Customer order sent by mail','Executed when a customer order is sent by mail ','commande',5),
	(14,'BILL_PAYED','Customer invoice payed','Executed when a customer invoice is payed','facture',7),
	(15,'BILL_CANCEL','Customer invoice canceled','Executed when a customer invoice is conceled','facture',8),
	(16,'BILL_SENTBYMAIL','Customer invoice sent by mail','Executed when a customer invoice is sent by mail','facture',9),
	(17,'ORDER_SUPPLIER_VALIDATE','Supplier order validated','Executed when a supplier order is validated','order_supplier',11),
	(18,'ORDER_SUPPLIER_SENTBYMAIL','Supplier order sent by mail','Executed when a supplier order is sent by mail','order_supplier',14),
	(19,'BILL_SUPPLIER_VALIDATE','Supplier invoice validated','Executed when a supplier invoice is validated','invoice_supplier',15),
	(20,'BILL_SUPPLIER_PAYED','Supplier invoice payed','Executed when a supplier invoice is payed','invoice_supplier',16),
	(21,'BILL_SUPPLIER_SENTBYMAIL','Supplier invoice sent by mail','Executed when a supplier invoice is sent by mail','invoice_supplier',17),
	(22,'SHIPPING_VALIDATE','Shipping validated','Executed when a shipping is validated','shipping',20),
	(23,'SHIPPING_SENTBYMAIL','Shipping sent by mail','Executed when a shipping is sent by mail','shipping',21),
	(24,'MEMBER_VALIDATE','Member validated','Executed when a member is validated','member',22),
	(25,'MEMBER_SUBSCRIPTION','Member subscribed','Executed when a member is subscribed','member',23),
	(26,'MEMBER_RESILIATE','Member resiliated','Executed when a member is resiliated','member',24),
	(27,'MEMBER_DELETE','Member deleted','Executed when a member is deleted','member',25),
	(28,'BILL_UNVALIDATE','Customer invoice unvalidated','Executed when a customer invoice status set back to draft','facture',10),
	(29,'FICHINTER_SENTBYMAIL','Intervention sent by mail','Executed when a intervention is sent by mail','ficheinter',29),
	(30,'PROJECT_CREATE','Project creation','Executed when a project is created','project',30),
	(31,'PROPAL_CLOSE_SIGNED','Customer proposal closed signed','Executed when a customer proposal is closed signed','propal',31),
	(32,'PROPAL_CLOSE_REFUSED','Customer proposal closed refused','Executed when a customer proposal is closed refused','propal',32),
	(33,'BILL_SUPPLIER_CANCELED','Supplier invoice cancelled','Executed when a supplier invoice is cancelled','invoice_supplier',33),
	(34,'MEMBER_MODIFY','Member modified','Executed when a member is modified','member',34),
	(35,'TASK_CREATE','Task created','Executed when a project task is created','project',35),
	(36,'TASK_MODIFY','Task modified','Executed when a project task is modified','project',36),
	(37,'TASK_DELETE','Task deleted','Executed when a project task is deleted','project',37);

/*!40000 ALTER TABLE `llx_c_action_trigger` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_actioncomm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_actioncomm`;

CREATE TABLE `llx_c_actioncomm` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'system',
  `libelle` varchar(48) NOT NULL,
  `module` varchar(16) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `todo` tinyint(4) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_actioncomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_c_actioncomm` DISABLE KEYS */;

INSERT INTO `llx_c_actioncomm` (`id`, `code`, `type`, `libelle`, `module`, `active`, `todo`, `position`)
VALUES
	(1,'AC_TEL','system','Phone call',NULL,1,NULL,2),
	(2,'AC_FAX','system','Send Fax',NULL,1,NULL,3),
	(3,'AC_PROP','systemauto','Send commercial proposal by email','propal',0,NULL,10),
	(4,'AC_EMAIL','system','Send Email',NULL,1,NULL,4),
	(5,'AC_RDV','system','Rendez-vous',NULL,1,NULL,1),
	(8,'AC_COM','systemauto','Send customer order by email','order',0,NULL,8),
	(9,'AC_FAC','systemauto','Send customer invoice by email','invoice',0,NULL,6),
	(10,'AC_SHIP','systemauto','Send shipping by email','shipping',0,NULL,11),
	(30,'AC_SUP_ORD','systemauto','Send supplier order by email','order_supplier',0,NULL,9),
	(31,'AC_SUP_INV','systemauto','Send supplier invoice by email','invoice_supplier',0,NULL,7),
	(40,'AC_OTH_AUTO','systemauto','Other (automatically inserted events)',NULL,1,NULL,20),
	(50,'AC_OTH','system','Other (manually inserted events)',NULL,1,NULL,5);

/*!40000 ALTER TABLE `llx_c_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_availability
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_availability`;

CREATE TABLE `llx_c_availability` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `label` varchar(60) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_availability` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_availability` WRITE;
/*!40000 ALTER TABLE `llx_c_availability` DISABLE KEYS */;

INSERT INTO `llx_c_availability` (`rowid`, `code`, `label`, `active`)
VALUES
	(1,'AV_NOW','Immediate',1),
	(2,'AV_1W','1 week',1),
	(3,'AV_2W','2 weeks',1),
	(4,'AV_3W','3 weeks',1);

/*!40000 ALTER TABLE `llx_c_availability` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_barcode_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_barcode_type`;

CREATE TABLE `llx_c_barcode_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `libelle` varchar(50) NOT NULL,
  `coder` varchar(16) NOT NULL,
  `example` varchar(16) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_barcode_type` (`code`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_c_cash_divisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_cash_divisions`;

CREATE TABLE `llx_c_cash_divisions` (
  `rowid` int(9) NOT NULL AUTO_INCREMENT,
  `fk_country` int(9) NOT NULL,
  `amount` float(13,6) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_c_cash_divisions_llx_c_pays_rowid_fk` (`fk_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_c_chargesociales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_chargesociales`;

CREATE TABLE `llx_c_chargesociales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(80) DEFAULT NULL,
  `deductible` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `code` varchar(12) NOT NULL,
  `accountancy_code` varchar(24) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_chargesociales` WRITE;
/*!40000 ALTER TABLE `llx_c_chargesociales` DISABLE KEYS */;

INSERT INTO `llx_c_chargesociales` (`id`, `libelle`, `deductible`, `active`, `code`, `accountancy_code`, `fk_pays`, `module`)
VALUES
	(1,'Allocations familiales',1,1,'TAXFAM',NULL,1,NULL),
	(2,'CSG Deductible',1,1,'TAXCSGD',NULL,1,NULL),
	(3,'CSG/CRDS NON Deductible',0,1,'TAXCSGND',NULL,1,NULL),
	(10,'Taxe apprentissage',0,1,'TAXAPP',NULL,1,NULL),
	(11,'Taxe professionnelle',0,1,'TAXPRO',NULL,1,NULL),
	(12,'Cotisation fonciere des entreprises',0,1,'TAXCFE',NULL,1,NULL),
	(13,'Cotisation sur la valeur ajoutee des entreprises',0,1,'TAXCVAE',NULL,1,NULL),
	(20,'Impots locaux/fonciers',0,1,'TAXFON',NULL,1,NULL),
	(25,'Impots revenus',0,1,'TAXREV',NULL,1,NULL),
	(30,'Assurance Sante',0,1,'TAXSECU',NULL,1,NULL),
	(40,'Mutuelle',0,1,'TAXMUT',NULL,1,NULL),
	(50,'Assurance vieillesse',0,1,'TAXRET',NULL,1,NULL),
	(60,'Assurance Chomage',0,1,'TAXCHOM',NULL,1,NULL),
	(201,'ONSS',1,1,'TAXBEONSS',NULL,2,NULL),
	(210,'Precompte professionnel',1,1,'TAXBEPREPRO',NULL,2,NULL),
	(220,'Prime existence',1,1,'TAXBEPRIEXI',NULL,2,NULL),
	(230,'Precompte immobilier',1,1,'TAXBEPREIMMO',NULL,2,NULL);

/*!40000 ALTER TABLE `llx_c_chargesociales` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_civilite
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_civilite`;

CREATE TABLE `llx_c_civilite` (
  `rowid` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `civilite` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_civilite` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_civilite` WRITE;
/*!40000 ALTER TABLE `llx_c_civilite` DISABLE KEYS */;

INSERT INTO `llx_c_civilite` (`rowid`, `code`, `civilite`, `active`, `module`)
VALUES
	(1,'MME','Madame',1,NULL),
	(3,'MR','Monsieur',1,NULL),
	(5,'MLE','Mademoiselle',1,NULL),
	(7,'MTRE','Maître',1,NULL),
	(8,'DR','Docteur',1,NULL);

/*!40000 ALTER TABLE `llx_c_civilite` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_currencies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_currencies`;

CREATE TABLE `llx_c_currencies` (
  `code_iso` varchar(3) NOT NULL,
  `label` varchar(64) NOT NULL,
  `unicode` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`code_iso`),
  UNIQUE KEY `uk_c_currencies_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_currencies` WRITE;
/*!40000 ALTER TABLE `llx_c_currencies` DISABLE KEYS */;

INSERT INTO `llx_c_currencies` (`code_iso`, `label`, `unicode`, `active`)
VALUES
	('AED','United Arab Emirates Dirham',NULL,1),
	('AFN','Afghanistan Afghani','[1547]',1),
	('ALL','Albania Lek','[76,101,107]',1),
	('ANG','Netherlands Antilles Guilder','[402]',1),
	('ARP','Pesos argentins',NULL,0),
	('ARS','Argentino Peso','[36]',1),
	('ATS','Shiliing autrichiens',NULL,0),
	('AUD','Australia Dollar','[36]',1),
	('AWG','Aruba Guilder','[402]',1),
	('AZN','Azerbaijan New Manat','[1084,1072,1085]',1),
	('BAM','Bosnia and Herzegovina Convertible Marka','[75,77]',1),
	('BBD','Barbados Dollar','[36]',1),
	('BEF','Francs belges',NULL,0),
	('BGN','Bulgaria Lev','[1083,1074]',1),
	('BMD','Bermuda Dollar','[36]',1),
	('BND','Brunei Darussalam Dollar','[36]',1),
	('BOB','Bolivia Boliviano','[36,98]',1),
	('BRL','Brazil Real','[82,36]',1),
	('BSD','Bahamas Dollar','[36]',1),
	('BWP','Botswana Pula','[80]',1),
	('BYR','Belarus Ruble','[112,46]',1),
	('BZD','Belize Dollar','[66,90,36]',1),
	('CAD','Canada Dollar','[36]',1),
	('CHF','Switzerland Franc','[67,72,70]',1),
	('CLP','Chile Peso','[36]',1),
	('CNY','China Yuan Renminbi','[165]',1),
	('COP','Colombia Peso','[36]',1),
	('CRC','Costa Rica Colon','[8353]',1),
	('CUP','Cuba Peso','[8369]',1),
	('CZK','Czech Republic Koruna','[75,269]',1),
	('DEM','Deutsch mark',NULL,0),
	('DKK','Denmark Krone','[107,114]',1),
	('DOP','Dominican Republic Peso','[82,68,36]',1),
	('DZD','Algeria Dinar',NULL,1),
	('EEK','Estonia Kroon','[107,114]',1),
	('EGP','Egypt Pound','[163]',1),
	('ESP','Pesete',NULL,0),
	('EUR','Euro Member Countries','[8364]',1),
	('FIM','Mark finlandais',NULL,0),
	('FJD','Fiji Dollar','[36]',1),
	('FKP','Falkland Islands (Malvinas) Pound','[163]',1),
	('FRF','Francs francais',NULL,0),
	('GBP','United Kingdom Pound','[163]',1),
	('GGP','Guernsey Pound','[163]',1),
	('GHC','Ghana Cedis','[162]',1),
	('GIP','Gibraltar Pound','[163]',1),
	('GRD','Drachme (grece)',NULL,0),
	('GTQ','Guatemala Quetzal','[81]',1),
	('GYD','Guyana Dollar','[36]',1),
	('HKD','Hong Kong Dollar','[36]',1),
	('HNL','Honduras Lempira','[76]',1),
	('HRK','Croatia Kuna','[107,110]',1),
	('HUF','Hungary Forint','[70,116]',1),
	('IDR','Indonesia Rupiah','[82,112]',1),
	('IEP','Livres irlandaises',NULL,0),
	('ILS','Israel Shekel','[8362]',1),
	('IMP','Isle of Man Pound','[163]',1),
	('INR','India Rupee',NULL,1),
	('IRR','Iran Rial','[65020]',1),
	('ISK','Iceland Krona','[107,114]',1),
	('ITL','Lires',NULL,0),
	('JEP','Jersey Pound','[163]',1),
	('JMD','Jamaica Dollar','[74,36]',1),
	('JPY','Japan Yen','[165]',1),
	('KES','Kenya Shilling',NULL,1),
	('KGS','Kyrgyzstan Som','[1083,1074]',1),
	('KHR','Cambodia Riel','[6107]',1),
	('KPW','Korea (North) Won','[8361]',1),
	('KRW','Korea (South) Won','[8361]',1),
	('KYD','Cayman Islands Dollar','[36]',1),
	('KZT','Kazakhstan Tenge','[1083,1074]',1),
	('LAK','Laos Kip','[8365]',1),
	('LBP','Lebanon Pound','[163]',1),
	('LKR','Sri Lanka Rupee','[8360]',1),
	('LRD','Liberia Dollar','[36]',1),
	('LTL','Lithuania Litas','[76,116]',1),
	('LUF','Francs luxembourgeois',NULL,0),
	('LVL','Latvia Lat','[76,115]',1),
	('MAD','Morocco Dirham',NULL,1),
	('MKD','Macedonia Denar','[1076,1077,1085]',1),
	('MNT','Mongolia Tughrik','[8366]',1),
	('MRO','Mauritania Ouguiya',NULL,1),
	('MUR','Mauritius Rupee','[8360]',1),
	('MXN','Mexico Peso','[36]',1),
	('MXP','Pesos Mexicans',NULL,0),
	('MYR','Malaysia Ringgit','[82,77]',1),
	('MZN','Mozambique Metical','[77,84]',1),
	('NAD','Namibia Dollar','[36]',1),
	('NGN','Nigeria Naira','[8358]',1),
	('NIO','Nicaragua Cordoba','[67,36]',1),
	('NLG','Florins',NULL,0),
	('NOK','Norway Krone','[107,114]',1),
	('NPR','Nepal Rupee','[8360]',1),
	('NZD','New Zealand Dollar','[36]',1),
	('OMR','Oman Rial','[65020]',1),
	('PAB','Panama Balboa','[66,47,46]',1),
	('PEN','Peru Nuevo Sol','[83,47,46]',1),
	('PHP','Philippines Peso','[8369]',1),
	('PKR','Pakistan Rupee','[8360]',1),
	('PLN','Poland Zloty','[122,322]',1),
	('PTE','Escudos',NULL,0),
	('PYG','Paraguay Guarani','[71,115]',1),
	('QAR','Qatar Riyal','[65020]',1),
	('RON','Romania New Leu','[108,101,105]',1),
	('RSD','Serbia Dinar','[1044,1080,1085,46]',1),
	('RUB','Russia Ruble','[1088,1091,1073]',1),
	('SAR','Saudi Arabia Riyal','[65020]',1),
	('SBD','Solomon Islands Dollar','[36]',1),
	('SCR','Seychelles Rupee','[8360]',1),
	('SEK','Sweden Krona','[107,114]',1),
	('SGD','Singapore Dollar','[36]',1),
	('SHP','Saint Helena Pound','[163]',1),
	('SKK','Couronnes slovaques',NULL,0),
	('SOS','Somalia Shilling','[83]',1),
	('SRD','Suriname Dollar','[36]',1),
	('SUR','Rouble',NULL,0),
	('SVC','El Salvador Colon','[36]',1),
	('SYP','Syria Pound','[163]',1),
	('THB','Thailand Baht','[3647]',1),
	('TND','Tunisia Dinar',NULL,1),
	('TRL','Turkey Lira','[84,76]',1),
	('TRY','Turkey Lira','[8356]',1),
	('TTD','Trinidad and Tobago Dollar','[84,84,36]',1),
	('TVD','Tuvalu Dollar','[36]',1),
	('TWD','Taiwan New Dollar','[78,84,36]',1),
	('UAH','Ukraine Hryvna','[8372]',1),
	('USD','United States Dollar','[36]',1),
	('UYU','Uruguay Peso','[36,85]',1),
	('UZS','Uzbekistan Som','[1083,1074]',1),
	('VEF','Venezuela Bolivar Fuerte','[66,115]',1),
	('VND','Viet Nam Dong','[8363]',1),
	('XAF','Communaute Financiere Africaine (BEAC) CFA Franc',NULL,1),
	('XCD','East Caribbean Dollar','[36]',1),
	('XEU','Ecus',NULL,0),
	('XOF','Communaute Financiere Africaine (BCEAO) Franc',NULL,1),
	('YER','Yemen Rial','[65020]',1),
	('ZAR','South Africa Rand','[82]',1),
	('ZWD','Zimbabwe Dollar','[90,36]',1);

/*!40000 ALTER TABLE `llx_c_currencies` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_departements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_departements`;

CREATE TABLE `llx_c_departements` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code_departement` varchar(6) NOT NULL,
  `fk_region` int(11) DEFAULT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `ncc` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_departements` (`code_departement`,`fk_region`),
  KEY `idx_departements_fk_region` (`fk_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_departements` WRITE;
/*!40000 ALTER TABLE `llx_c_departements` DISABLE KEYS */;

INSERT INTO `llx_c_departements` (`rowid`, `code_departement`, `fk_region`, `cheflieu`, `tncc`, `ncc`, `nom`, `active`)
VALUES
	(1,'0',0,'0',0,'-','-',1),
	(2,'01',82,'01053',5,'AIN','Ain',1),
	(3,'02',22,'02408',5,'AISNE','Aisne',1),
	(4,'03',83,'03190',5,'ALLIER','Allier',1),
	(5,'04',93,'04070',4,'ALPES-DE-HAUTE-PROVENCE','Alpes-de-Haute-Provence',1),
	(6,'05',93,'05061',4,'HAUTES-ALPES','Hautes-Alpes',1),
	(7,'06',93,'06088',4,'ALPES-MARITIMES','Alpes-Maritimes',1),
	(8,'07',82,'07186',5,'ARDECHE','Ardèche',1),
	(9,'08',21,'08105',4,'ARDENNES','Ardennes',1),
	(10,'09',73,'09122',5,'ARIEGE','Ariège',1),
	(11,'10',21,'10387',5,'AUBE','Aube',1),
	(12,'11',91,'11069',5,'AUDE','Aude',1),
	(13,'12',73,'12202',5,'AVEYRON','Aveyron',1),
	(14,'13',93,'13055',4,'BOUCHES-DU-RHONE','Bouches-du-Rhône',1),
	(15,'14',25,'14118',2,'CALVADOS','Calvados',1),
	(16,'15',83,'15014',2,'CANTAL','Cantal',1),
	(17,'16',54,'16015',3,'CHARENTE','Charente',1),
	(18,'17',54,'17300',3,'CHARENTE-MARITIME','Charente-Maritime',1),
	(19,'18',24,'18033',2,'CHER','Cher',1),
	(20,'19',74,'19272',3,'CORREZE','Corrèze',1),
	(21,'2A',94,'2A004',3,'CORSE-DU-SUD','Corse-du-Sud',1),
	(22,'2B',94,'2B033',3,'HAUTE-CORSE','Haute-Corse',1),
	(23,'21',26,'21231',3,'COTE-D OR','Côte-d Or',1),
	(24,'22',53,'22278',4,'COTES-D ARMOR','Côtes-d Armor',1),
	(25,'23',74,'23096',3,'CREUSE','Creuse',1),
	(26,'24',72,'24322',3,'DORDOGNE','Dordogne',1),
	(27,'25',43,'25056',2,'DOUBS','Doubs',1),
	(28,'26',82,'26362',3,'DROME','Drôme',1),
	(29,'27',23,'27229',5,'EURE','Eure',1),
	(30,'28',24,'28085',1,'EURE-ET-LOIR','Eure-et-Loir',1),
	(31,'29',53,'29232',2,'FINISTERE','Finistère',1),
	(32,'30',91,'30189',2,'GARD','Gard',1),
	(33,'31',73,'31555',3,'HAUTE-GARONNE','Haute-Garonne',1),
	(34,'32',73,'32013',2,'GERS','Gers',1),
	(35,'33',72,'33063',3,'GIRONDE','Gironde',1),
	(36,'34',91,'34172',5,'HERAULT','Hérault',1),
	(37,'35',53,'35238',1,'ILLE-ET-VILAINE','Ille-et-Vilaine',1),
	(38,'36',24,'36044',5,'INDRE','Indre',1),
	(39,'37',24,'37261',1,'INDRE-ET-LOIRE','Indre-et-Loire',1),
	(40,'38',82,'38185',5,'ISERE','Isère',1),
	(41,'39',43,'39300',2,'JURA','Jura',1),
	(42,'40',72,'40192',4,'LANDES','Landes',1),
	(43,'41',24,'41018',0,'LOIR-ET-CHER','Loir-et-Cher',1),
	(44,'42',82,'42218',3,'LOIRE','Loire',1),
	(45,'43',83,'43157',3,'HAUTE-LOIRE','Haute-Loire',1),
	(46,'44',52,'44109',3,'LOIRE-ATLANTIQUE','Loire-Atlantique',1),
	(47,'45',24,'45234',2,'LOIRET','Loiret',1),
	(48,'46',73,'46042',2,'LOT','Lot',1),
	(49,'47',72,'47001',0,'LOT-ET-GARONNE','Lot-et-Garonne',1),
	(50,'48',91,'48095',3,'LOZERE','Lozère',1),
	(51,'49',52,'49007',0,'MAINE-ET-LOIRE','Maine-et-Loire',1),
	(52,'50',25,'50502',3,'MANCHE','Manche',1),
	(53,'51',21,'51108',3,'MARNE','Marne',1),
	(54,'52',21,'52121',3,'HAUTE-MARNE','Haute-Marne',1),
	(55,'53',52,'53130',3,'MAYENNE','Mayenne',1),
	(56,'54',41,'54395',0,'MEURTHE-ET-MOSELLE','Meurthe-et-Moselle',1),
	(57,'55',41,'55029',3,'MEUSE','Meuse',1),
	(58,'56',53,'56260',2,'MORBIHAN','Morbihan',1),
	(59,'57',41,'57463',3,'MOSELLE','Moselle',1),
	(60,'58',26,'58194',3,'NIEVRE','Nièvre',1),
	(61,'59',31,'59350',2,'NORD','Nord',1),
	(62,'60',22,'60057',5,'OISE','Oise',1),
	(63,'61',25,'61001',5,'ORNE','Orne',1),
	(64,'62',31,'62041',2,'PAS-DE-CALAIS','Pas-de-Calais',1),
	(65,'63',83,'63113',2,'PUY-DE-DOME','Puy-de-Dôme',1),
	(66,'64',72,'64445',4,'PYRENEES-ATLANTIQUES','Pyrénées-Atlantiques',1),
	(67,'65',73,'65440',4,'HAUTES-PYRENEES','Hautes-Pyrénées',1),
	(68,'66',91,'66136',4,'PYRENEES-ORIENTALES','Pyrénées-Orientales',1),
	(69,'67',42,'67482',2,'BAS-RHIN','Bas-Rhin',1),
	(70,'68',42,'68066',2,'HAUT-RHIN','Haut-Rhin',1),
	(71,'69',82,'69123',2,'RHONE','Rhône',1),
	(72,'70',43,'70550',3,'HAUTE-SAONE','Haute-Saône',1),
	(73,'71',26,'71270',0,'SAONE-ET-LOIRE','Saône-et-Loire',1),
	(74,'72',52,'72181',3,'SARTHE','Sarthe',1),
	(75,'73',82,'73065',3,'SAVOIE','Savoie',1),
	(76,'74',82,'74010',3,'HAUTE-SAVOIE','Haute-Savoie',1),
	(77,'75',11,'75056',0,'PARIS','Paris',1),
	(78,'76',23,'76540',3,'SEINE-MARITIME','Seine-Maritime',1),
	(79,'77',11,'77288',0,'SEINE-ET-MARNE','Seine-et-Marne',1),
	(80,'78',11,'78646',4,'YVELINES','Yvelines',1),
	(81,'79',54,'79191',4,'DEUX-SEVRES','Deux-Sèvres',1),
	(82,'80',22,'80021',3,'SOMME','Somme',1),
	(83,'81',73,'81004',2,'TARN','Tarn',1),
	(84,'82',73,'82121',0,'TARN-ET-GARONNE','Tarn-et-Garonne',1),
	(85,'83',93,'83137',2,'VAR','Var',1),
	(86,'84',93,'84007',0,'VAUCLUSE','Vaucluse',1),
	(87,'85',52,'85191',3,'VENDEE','Vendée',1),
	(88,'86',54,'86194',3,'VIENNE','Vienne',1),
	(89,'87',74,'87085',3,'HAUTE-VIENNE','Haute-Vienne',1),
	(90,'88',41,'88160',4,'VOSGES','Vosges',1),
	(91,'89',26,'89024',5,'YONNE','Yonne',1),
	(92,'90',43,'90010',0,'TERRITOIRE DE BELFORT','Territoire de Belfort',1),
	(93,'91',11,'91228',5,'ESSONNE','Essonne',1),
	(94,'92',11,'92050',4,'HAUTS-DE-SEINE','Hauts-de-Seine',1),
	(95,'93',11,'93008',3,'SEINE-SAINT-DENIS','Seine-Saint-Denis',1),
	(96,'94',11,'94028',2,'VAL-DE-MARNE','Val-de-Marne',1),
	(97,'95',11,'95500',2,'VAL-D OISE','Val-d Oise',1),
	(98,'971',1,'97105',3,'GUADELOUPE','Guadeloupe',1),
	(99,'972',2,'97209',3,'MARTINIQUE','Martinique',1),
	(100,'973',3,'97302',3,'GUYANE','Guyane',1),
	(101,'974',4,'97411',3,'REUNION','Réunion',1),
	(102,'976',6,'97601',3,'MAYOTTE','Mayotte',1),
	(103,'01',201,'',1,'ANVERS','Anvers',1),
	(104,'02',203,'',3,'BRUXELLES-CAPITALE','Bruxelles-Capitale',1),
	(105,'03',202,'',2,'BRABANT-WALLON','Brabant-Wallon',1),
	(106,'04',201,'',1,'BRABANT-FLAMAND','Brabant-Flamand',1),
	(107,'05',201,'',1,'FLANDRE-OCCIDENTALE','Flandre-Occidentale',1),
	(108,'06',201,'',1,'FLANDRE-ORIENTALE','Flandre-Orientale',1),
	(109,'07',202,'',2,'HAINAUT','Hainaut',1),
	(110,'08',201,'',2,'LIEGE','Liège',1),
	(111,'09',202,'',1,'LIMBOURG','Limbourg',1),
	(112,'10',202,'',2,'LUXEMBOURG','Luxembourg',1),
	(113,'11',201,'',2,'NAMUR','Namur',1),
	(114,'AG',315,NULL,NULL,NULL,'AGRIGENTO',1),
	(115,'AL',312,NULL,NULL,NULL,'ALESSANDRIA',1),
	(116,'AN',310,NULL,NULL,NULL,'ANCONA',1),
	(117,'AO',319,NULL,NULL,NULL,'AOSTA',1),
	(118,'AR',316,NULL,NULL,NULL,'AREZZO',1),
	(119,'AP',310,NULL,NULL,NULL,'ASCOLI PICENO',1),
	(120,'AT',312,NULL,NULL,NULL,'ASTI',1),
	(121,'AV',304,NULL,NULL,NULL,'AVELLINO',1),
	(122,'BA',313,NULL,NULL,NULL,'BARI',1),
	(123,'BT',313,NULL,NULL,NULL,'BARLETTA-ANDRIA-TRANI',1),
	(124,'BL',320,NULL,NULL,NULL,'BELLUNO',1),
	(125,'BN',304,NULL,NULL,NULL,'BENEVENTO',1),
	(126,'BG',309,NULL,NULL,NULL,'BERGAMO',1),
	(127,'BI',312,NULL,NULL,NULL,'BIELLA',1),
	(128,'BO',305,NULL,NULL,NULL,'BOLOGNA',1),
	(129,'BZ',317,NULL,NULL,NULL,'BOLZANO',1),
	(130,'BS',309,NULL,NULL,NULL,'BRESCIA',1),
	(131,'BR',313,NULL,NULL,NULL,'BRINDISI',1),
	(132,'CA',314,NULL,NULL,NULL,'CAGLIARI',1),
	(133,'CL',315,NULL,NULL,NULL,'CALTANISSETTA',1),
	(134,'CB',311,NULL,NULL,NULL,'CAMPOBASSO',1),
	(135,'CI',314,NULL,NULL,NULL,'CARBONIA-IGLESIAS',1),
	(136,'CE',304,NULL,NULL,NULL,'CASERTA',1),
	(137,'CT',315,NULL,NULL,NULL,'CATANIA',1),
	(138,'CZ',303,NULL,NULL,NULL,'CATANZARO',1),
	(139,'CH',301,NULL,NULL,NULL,'CHIETI',1),
	(140,'CO',309,NULL,NULL,NULL,'COMO',1),
	(141,'CS',303,NULL,NULL,NULL,'COSENZA',1),
	(142,'CR',309,NULL,NULL,NULL,'CREMONA',1),
	(143,'KR',303,NULL,NULL,NULL,'CROTONE',1),
	(144,'CN',312,NULL,NULL,NULL,'CUNEO',1),
	(145,'EN',315,NULL,NULL,NULL,'ENNA',1),
	(146,'FM',310,NULL,NULL,NULL,'FERMO',1),
	(147,'FE',305,NULL,NULL,NULL,'FERRARA',1),
	(148,'FI',316,NULL,NULL,NULL,'FIRENZE',1),
	(149,'FG',313,NULL,NULL,NULL,'FOGGIA',1),
	(150,'FC',305,NULL,NULL,NULL,'FORLI-CESENA',1),
	(151,'FR',307,NULL,NULL,NULL,'FROSINONE',1),
	(152,'GE',308,NULL,NULL,NULL,'GENOVA',1),
	(153,'GO',306,NULL,NULL,NULL,'GORIZIA',1),
	(154,'GR',316,NULL,NULL,NULL,'GROSSETO',1),
	(155,'IM',308,NULL,NULL,NULL,'IMPERIA',1),
	(156,'IS',311,NULL,NULL,NULL,'ISERNIA',1),
	(157,'SP',308,NULL,NULL,NULL,'LA SPEZIA',1),
	(158,'AQ',301,NULL,NULL,NULL,'L AQUILA',1),
	(159,'LT',307,NULL,NULL,NULL,'LATINA',1),
	(160,'LE',313,NULL,NULL,NULL,'LECCE',1),
	(161,'LC',309,NULL,NULL,NULL,'LECCO',1),
	(162,'LI',314,NULL,NULL,NULL,'LIVORNO',1),
	(163,'LO',309,NULL,NULL,NULL,'LODI',1),
	(164,'LU',316,NULL,NULL,NULL,'LUCCA',1),
	(165,'MC',310,NULL,NULL,NULL,'MACERATA',1),
	(166,'MN',309,NULL,NULL,NULL,'MANTOVA',1),
	(167,'MS',316,NULL,NULL,NULL,'MASSA-CARRARA',1),
	(168,'MT',302,NULL,NULL,NULL,'MATERA',1),
	(169,'VS',314,NULL,NULL,NULL,'MEDIO CAMPIDANO',1),
	(170,'ME',315,NULL,NULL,NULL,'MESSINA',1),
	(171,'MI',309,NULL,NULL,NULL,'MILANO',1),
	(172,'MB',309,NULL,NULL,NULL,'MONZA e BRIANZA',1),
	(173,'MO',305,NULL,NULL,NULL,'MODENA',1),
	(174,'NA',304,NULL,NULL,NULL,'NAPOLI',1),
	(175,'NO',312,NULL,NULL,NULL,'NOVARA',1),
	(176,'NU',314,NULL,NULL,NULL,'NUORO',1),
	(177,'OG',314,NULL,NULL,NULL,'OGLIASTRA',1),
	(178,'OT',314,NULL,NULL,NULL,'OLBIA-TEMPIO',1),
	(179,'OR',314,NULL,NULL,NULL,'ORISTANO',1),
	(180,'PD',320,NULL,NULL,NULL,'PADOVA',1),
	(181,'PA',315,NULL,NULL,NULL,'PALERMO',1),
	(182,'PR',305,NULL,NULL,NULL,'PARMA',1),
	(183,'PV',309,NULL,NULL,NULL,'PAVIA',1),
	(184,'PG',318,NULL,NULL,NULL,'PERUGIA',1),
	(185,'PU',310,NULL,NULL,NULL,'PESARO e URBINO',1),
	(186,'PE',301,NULL,NULL,NULL,'PESCARA',1),
	(187,'PC',305,NULL,NULL,NULL,'PIACENZA',1),
	(188,'PI',316,NULL,NULL,NULL,'PISA',1),
	(189,'PT',316,NULL,NULL,NULL,'PISTOIA',1),
	(190,'PN',306,NULL,NULL,NULL,'PORDENONE',1),
	(191,'PZ',302,NULL,NULL,NULL,'POTENZA',1),
	(192,'PO',316,NULL,NULL,NULL,'PRATO',1),
	(193,'RG',315,NULL,NULL,NULL,'RAGUSA',1),
	(194,'RA',305,NULL,NULL,NULL,'RAVENNA',1),
	(195,'RC',303,NULL,NULL,NULL,'REGGIO CALABRIA',1),
	(196,'RE',305,NULL,NULL,NULL,'REGGIO NELL EMILIA',1),
	(197,'RI',307,NULL,NULL,NULL,'RIETI',1),
	(198,'RN',305,NULL,NULL,NULL,'RIMINI',1),
	(199,'RM',307,NULL,NULL,NULL,'ROMA',1),
	(200,'RO',320,NULL,NULL,NULL,'ROVIGO',1),
	(201,'SA',304,NULL,NULL,NULL,'SALERNO',1),
	(202,'SS',314,NULL,NULL,NULL,'SASSARI',1),
	(203,'SV',308,NULL,NULL,NULL,'SAVONA',1),
	(204,'SI',316,NULL,NULL,NULL,'SIENA',1),
	(205,'SR',315,NULL,NULL,NULL,'SIRACUSA',1),
	(206,'SO',309,NULL,NULL,NULL,'SONDRIO',1),
	(207,'TA',313,NULL,NULL,NULL,'TARANTO',1),
	(208,'TE',301,NULL,NULL,NULL,'TERAMO',1),
	(209,'TR',318,NULL,NULL,NULL,'TERNI',1),
	(210,'TO',312,NULL,NULL,NULL,'TORINO',1),
	(211,'TP',315,NULL,NULL,NULL,'TRAPANI',1),
	(212,'TN',317,NULL,NULL,NULL,'TRENTO',1),
	(213,'TV',320,NULL,NULL,NULL,'TREVISO',1),
	(214,'TS',306,NULL,NULL,NULL,'TRIESTE',1),
	(215,'UD',306,NULL,NULL,NULL,'UDINE',1),
	(216,'VA',309,NULL,NULL,NULL,'VARESE',1),
	(217,'VE',320,NULL,NULL,NULL,'VENEZIA',1),
	(218,'VB',312,NULL,NULL,NULL,'VERBANO-CUSIO-OSSOLA',1),
	(219,'VC',312,NULL,NULL,NULL,'VERCELLI',1),
	(220,'VR',320,NULL,NULL,NULL,'VERONA',1),
	(221,'VV',303,NULL,NULL,NULL,'VIBO VALENTIA',1),
	(222,'VI',320,NULL,NULL,NULL,'VICENZA',1),
	(223,'VT',307,NULL,NULL,NULL,'VITERBO',1),
	(224,'NSW',2801,'',1,'','New South Wales',1),
	(225,'VIC',2801,'',1,'','Victoria',1),
	(226,'QLD',2801,'',1,'','Queensland',1),
	(227,'SA',2801,'',1,'','South Australia',1),
	(228,'ACT',2801,'',1,'','Australia Capital Territory',1),
	(229,'TAS',2801,'',1,'','Tasmania',1),
	(230,'WA',2801,'',1,'','Western Australia',1),
	(231,'NT',2801,'',1,'','Northern Territory',1),
	(232,'ON',1401,'',1,'','Ontario',1),
	(233,'QC',1401,'',1,'','Quebec',1),
	(234,'NS',1401,'',1,'','Nova Scotia',1),
	(235,'NB',1401,'',1,'','New Brunswick',1),
	(236,'MB',1401,'',1,'','Manitoba',1),
	(237,'BC',1401,'',1,'','British Columbia',1),
	(238,'PE',1401,'',1,'','Prince Edward Island',1),
	(239,'SK',1401,'',1,'','Saskatchewan',1),
	(240,'AB',1401,'',1,'','Alberta',1),
	(241,'NL',1401,'',1,'','Newfoundland and Labrador',1),
	(242,'01',419,'',19,'ALAVA','Álava',1),
	(243,'02',404,'',4,'ALBACETE','Albacete',1),
	(244,'03',411,'',11,'ALICANTE','Alicante',1),
	(245,'04',401,'',1,'ALMERIA','Almería',1),
	(246,'05',403,'',3,'AVILA','Avila',1),
	(247,'06',412,'',12,'BADAJOZ','Badajoz',1),
	(248,'07',414,'',14,'ISLAS BALEARES','Islas Baleares',1),
	(249,'08',406,'',6,'BARCELONA','Barcelona',1),
	(250,'09',403,'',8,'BURGOS','Burgos',1),
	(251,'10',412,'',12,'CACERES','Cáceres',1),
	(252,'11',401,'',1,'CADIZ','Cádiz',1),
	(253,'12',411,'',11,'CASTELLON','Castellón',1),
	(254,'13',404,'',4,'CIUDAD REAL','Ciudad Real',1),
	(255,'14',401,'',1,'CORDOBA','Córdoba',1),
	(256,'15',413,'',13,'LA CORUÑA','La Coruña',1),
	(257,'16',404,'',4,'CUENCA','Cuenca',1),
	(258,'17',406,'',6,'GERONA','Gerona',1),
	(259,'18',401,'',1,'GRANADA','Granada',1),
	(260,'19',404,'',4,'GUADALAJARA','Guadalajara',1),
	(261,'20',419,'',19,'GUIPUZCOA','Guipúzcoa',1),
	(262,'21',401,'',1,'HUELVA','Huelva',1),
	(263,'22',402,'',2,'HUESCA','Huesca',1),
	(264,'23',401,'',1,'JAEN','Jaén',1),
	(265,'24',403,'',3,'LEON','León',1),
	(266,'25',406,'',6,'LERIDA','Lérida',1),
	(267,'26',415,'',15,'LA RIOJA','La Rioja',1),
	(268,'27',413,'',13,'LUGO','Lugo',1),
	(269,'28',416,'',16,'MADRID','Madrid',1),
	(270,'29',401,'',1,'MALAGA','Málaga',1),
	(271,'30',417,'',17,'MURCIA','Murcia',1),
	(272,'31',408,'',8,'NAVARRA','Navarra',1),
	(273,'32',413,'',13,'ORENSE','Orense',1),
	(274,'33',418,'',18,'ASTURIAS','Asturias',1),
	(275,'34',403,'',3,'PALENCIA','Palencia',1),
	(276,'35',405,'',5,'LAS PALMAS','Las Palmas',1),
	(277,'36',413,'',13,'PONTEVEDRA','Pontevedra',1),
	(278,'37',403,'',3,'SALAMANCA','Salamanca',1),
	(279,'38',405,'',5,'STA. CRUZ DE TENERIFE','Sta. Cruz de Tenerife',1),
	(280,'39',410,'',10,'CANTABRIA','Cantabria',1),
	(281,'40',403,'',3,'SEGOVIA','Segovia',1),
	(282,'41',401,'',1,'SEVILLA','Sevilla',1),
	(283,'42',403,'',3,'SORIA','Soria',1),
	(284,'43',406,'',6,'TARRAGONA','Tarragona',1),
	(285,'44',402,'',2,'TERUEL','Teruel',1),
	(286,'45',404,'',5,'TOLEDO','Toledo',1),
	(287,'46',411,'',11,'VALENCIA','Valencia',1),
	(288,'47',403,'',3,'VALLADOLID','Valladolid',1),
	(289,'48',419,'',19,'VIZCAYA','Vizcaya',1),
	(290,'49',403,'',3,'ZAMORA','Zamora',1),
	(291,'50',402,'',1,'ZARAGOZA','Zaragoza',1),
	(292,'51',407,'',7,'CEUTA','Ceuta',1),
	(293,'52',409,'',9,'MELILLA','Melilla',1),
	(294,'53',420,'',20,'OTROS','Otros',1),
	(295,'BW',501,NULL,NULL,'BADEN-WÜRTTEMBERG','Baden-Württemberg',1),
	(296,'BY',501,NULL,NULL,'BAYERN','Bayern',1),
	(297,'BE',501,NULL,NULL,'BERLIN','Berlin',1),
	(298,'BB',501,NULL,NULL,'BRANDENBURG','Brandenburg',1),
	(299,'HB',501,NULL,NULL,'BREMEN','Bremen',1),
	(300,'HH',501,NULL,NULL,'HAMBURG','Hamburg',1),
	(301,'HE',501,NULL,NULL,'HESSEN','Hessen',1),
	(302,'MV',501,NULL,NULL,'MECKLENBURG-VORPOMMERN','Mecklenburg-Vorpommern',1),
	(303,'NI',501,NULL,NULL,'NIEDERSACHSEN','Niedersachsen',1),
	(304,'NW',501,NULL,NULL,'NORDRHEIN-WESTFALEN','Nordrhein-Westfalen',1),
	(305,'RP',501,NULL,NULL,'RHEINLAND-PFALZ','Rheinland-Pfalz',1),
	(306,'SL',501,NULL,NULL,'SAARLAND','Saarland',1),
	(307,'SN',501,NULL,NULL,'SACHSEN','Sachsen',1),
	(308,'ST',501,NULL,NULL,'SACHSEN-ANHALT','Sachsen-Anhalt',1),
	(309,'SH',501,NULL,NULL,'SCHLESWIG-HOLSTEIN','Schleswig-Holstein',1),
	(310,'TH',501,NULL,NULL,'THÜRINGEN','Thüringen',1),
	(311,'66',10201,'',0,'','Αθήνα',1),
	(312,'67',10205,'',0,'','Δράμα',1),
	(313,'01',10205,'',0,'','Έβρος',1),
	(314,'02',10205,'',0,'','Θάσος',1),
	(315,'03',10205,'',0,'','Καβάλα',1),
	(316,'04',10205,'',0,'','Ξάνθη',1),
	(317,'05',10205,'',0,'','Ροδόπη',1),
	(318,'06',10203,'',0,'','Ημαθία',1),
	(319,'07',10203,'',0,'','Θεσσαλονίκη',1),
	(320,'08',10203,'',0,'','Κιλκίς',1),
	(321,'09',10203,'',0,'','Πέλλα',1),
	(322,'10',10203,'',0,'','Πιερία',1),
	(323,'11',10203,'',0,'','Σέρρες',1),
	(324,'12',10203,'',0,'','Χαλκιδική',1),
	(325,'13',10206,'',0,'','Άρτα',1),
	(326,'14',10206,'',0,'','Θεσπρωτία',1),
	(327,'15',10206,'',0,'','Ιωάννινα',1),
	(328,'16',10206,'',0,'','Πρέβεζα',1),
	(329,'17',10213,'',0,'','Γρεβενά',1),
	(330,'18',10213,'',0,'','Καστοριά',1),
	(331,'19',10213,'',0,'','Κοζάνη',1),
	(332,'20',10213,'',0,'','Φλώρινα',1),
	(333,'21',10212,'',0,'','Καρδίτσα',1),
	(334,'22',10212,'',0,'','Λάρισα',1),
	(335,'23',10212,'',0,'','Μαγνησία',1),
	(336,'24',10212,'',0,'','Τρίκαλα',1),
	(337,'25',10212,'',0,'','Σποράδες',1),
	(338,'26',10212,'',0,'','Βοιωτία',1),
	(339,'27',10202,'',0,'','Εύβοια',1),
	(340,'28',10202,'',0,'','Ευρυτανία',1),
	(341,'29',10202,'',0,'','Φθιώτιδα',1),
	(342,'30',10202,'',0,'','Φωκίδα',1),
	(343,'31',10209,'',0,'','Αργολίδα',1),
	(344,'32',10209,'',0,'','Αρκαδία',1),
	(345,'33',10209,'',0,'','Κορινθία',1),
	(346,'34',10209,'',0,'','Λακωνία',1),
	(347,'35',10209,'',0,'','Μεσσηνία',1),
	(348,'36',10211,'',0,'','Αιτωλοακαρνανία',1),
	(349,'37',10211,'',0,'','Αχαΐα',1),
	(350,'38',10211,'',0,'','Ηλεία',1),
	(351,'39',10207,'',0,'','Ζάκυνθος',1),
	(352,'40',10207,'',0,'','Κέρκυρα',1),
	(353,'41',10207,'',0,'','Κεφαλληνία',1),
	(354,'42',10207,'',0,'','Ιθάκη',1),
	(355,'43',10207,'',0,'','Λευκάδα',1),
	(356,'44',10208,'',0,'','Ικαρία',1),
	(357,'45',10208,'',0,'','Λέσβος',1),
	(358,'46',10208,'',0,'','Λήμνος',1),
	(359,'47',10208,'',0,'','Σάμος',1),
	(360,'48',10208,'',0,'','Χίος',1),
	(361,'49',10210,'',0,'','Άνδρος',1),
	(362,'50',10210,'',0,'','Θήρα',1),
	(363,'51',10210,'',0,'','Κάλυμνος',1),
	(364,'52',10210,'',0,'','Κάρπαθος',1),
	(365,'53',10210,'',0,'','Κέα-Κύθνος',1),
	(366,'54',10210,'',0,'','Κω',1),
	(367,'55',10210,'',0,'','Μήλος',1),
	(368,'56',10210,'',0,'','Μύκονος',1),
	(369,'57',10210,'',0,'','Νάξος',1),
	(370,'58',10210,'',0,'','Πάρος',1),
	(371,'59',10210,'',0,'','Ρόδος',1),
	(372,'60',10210,'',0,'','Σύρος',1),
	(373,'61',10210,'',0,'','Τήνος',1),
	(374,'62',10204,'',0,'','Ηράκλειο',1),
	(375,'63',10204,'',0,'','Λασίθι',1),
	(376,'64',10204,'',0,'','Ρέθυμνο',1),
	(377,'65',10204,'',0,'','Χανιά',1),
	(378,'AG',601,NULL,NULL,'ARGOVIE','Argovie',1),
	(379,'AI',601,NULL,NULL,'APPENZELL RHODES INTERIEURES','Appenzell Rhodes intérieures',1),
	(380,'AR',601,NULL,NULL,'APPENZELL RHODES EXTERIEURES','Appenzell Rhodes extérieures',1),
	(381,'BE',601,NULL,NULL,'BERNE','Berne',1),
	(382,'BL',601,NULL,NULL,'BALE CAMPAGNE','Bâle Campagne',1),
	(383,'BS',601,NULL,NULL,'BALE VILLE','Bâle Ville',1),
	(384,'FR',601,NULL,NULL,'FRIBOURG','Fribourg',1),
	(385,'GE',601,NULL,NULL,'GENEVE','Genève',1),
	(386,'GL',601,NULL,NULL,'GLARIS','Glaris',1),
	(387,'GR',601,NULL,NULL,'GRISONS','Grisons',1),
	(388,'JU',601,NULL,NULL,'JURA','Jura',1),
	(389,'LU',601,NULL,NULL,'LUCERNE','Lucerne',1),
	(390,'NE',601,NULL,NULL,'NEUCHATEL','Neuchâtel',1),
	(391,'NW',601,NULL,NULL,'NIDWALD','Nidwald',1),
	(392,'OW',601,NULL,NULL,'OBWALD','Obwald',1),
	(393,'SG',601,NULL,NULL,'SAINT-GALL','Saint-Gall',1),
	(394,'SH',601,NULL,NULL,'SCHAFFHOUSE','Schaffhouse',1),
	(395,'SO',601,NULL,NULL,'SOLEURE','Soleure',1),
	(396,'SZ',601,NULL,NULL,'SCHWYZ','Schwyz',1),
	(397,'TG',601,NULL,NULL,'THURGOVIE','Thurgovie',1),
	(398,'TI',601,NULL,NULL,'TESSIN','Tessin',1),
	(399,'UR',601,NULL,NULL,'URI','Uri',1),
	(400,'VD',601,NULL,NULL,'VAUD','Vaud',1),
	(401,'VS',601,NULL,NULL,'VALAIS','Valais',1),
	(402,'ZG',601,NULL,NULL,'ZUG','Zug',1),
	(403,'ZH',601,NULL,NULL,'ZURICH','Zürich',1),
	(404,'701',701,NULL,0,NULL,'Bedfordshire',1),
	(405,'702',701,NULL,0,NULL,'Berkshire',1),
	(406,'703',701,NULL,0,NULL,'Bristol, City of',1),
	(407,'704',701,NULL,0,NULL,'Buckinghamshire',1),
	(408,'705',701,NULL,0,NULL,'Cambridgeshire',1),
	(409,'706',701,NULL,0,NULL,'Cheshire',1),
	(410,'707',701,NULL,0,NULL,'Cleveland',1),
	(411,'708',701,NULL,0,NULL,'Cornwall',1),
	(412,'709',701,NULL,0,NULL,'Cumberland',1),
	(413,'710',701,NULL,0,NULL,'Cumbria',1),
	(414,'711',701,NULL,0,NULL,'Derbyshire',1),
	(415,'712',701,NULL,0,NULL,'Devon',1),
	(416,'713',701,NULL,0,NULL,'Dorset',1),
	(417,'714',701,NULL,0,NULL,'Co. Durham',1),
	(418,'715',701,NULL,0,NULL,'East Riding of Yorkshire',1),
	(419,'716',701,NULL,0,NULL,'East Sussex',1),
	(420,'717',701,NULL,0,NULL,'Essex',1),
	(421,'718',701,NULL,0,NULL,'Gloucestershire',1),
	(422,'719',701,NULL,0,NULL,'Greater Manchester',1),
	(423,'720',701,NULL,0,NULL,'Hampshire',1),
	(424,'721',701,NULL,0,NULL,'Hertfordshire',1),
	(425,'722',701,NULL,0,NULL,'Hereford and Worcester',1),
	(426,'723',701,NULL,0,NULL,'Herefordshire',1),
	(427,'724',701,NULL,0,NULL,'Huntingdonshire',1),
	(428,'725',701,NULL,0,NULL,'Isle of Man',1),
	(429,'726',701,NULL,0,NULL,'Isle of Wight',1),
	(430,'727',701,NULL,0,NULL,'Jersey',1),
	(431,'728',701,NULL,0,NULL,'Kent',1),
	(432,'729',701,NULL,0,NULL,'Lancashire',1),
	(433,'730',701,NULL,0,NULL,'Leicestershire',1),
	(434,'731',701,NULL,0,NULL,'Lincolnshire',1),
	(435,'732',701,NULL,0,NULL,'London - City of London',1),
	(436,'733',701,NULL,0,NULL,'Merseyside',1),
	(437,'734',701,NULL,0,NULL,'Middlesex',1),
	(438,'735',701,NULL,0,NULL,'Norfolk',1),
	(439,'736',701,NULL,0,NULL,'North Yorkshire',1),
	(440,'737',701,NULL,0,NULL,'North Riding of Yorkshire',1),
	(441,'738',701,NULL,0,NULL,'Northamptonshire',1),
	(442,'739',701,NULL,0,NULL,'Northumberland',1),
	(443,'740',701,NULL,0,NULL,'Nottinghamshire',1),
	(444,'741',701,NULL,0,NULL,'Oxfordshire',1),
	(445,'742',701,NULL,0,NULL,'Rutland',1),
	(446,'743',701,NULL,0,NULL,'Shropshire',1),
	(447,'744',701,NULL,0,NULL,'Somerset',1),
	(448,'745',701,NULL,0,NULL,'Staffordshire',1),
	(449,'746',701,NULL,0,NULL,'Suffolk',1),
	(450,'747',701,NULL,0,NULL,'Surrey',1),
	(451,'748',701,NULL,0,NULL,'Sussex',1),
	(452,'749',701,NULL,0,NULL,'Tyne and Wear',1),
	(453,'750',701,NULL,0,NULL,'Warwickshire',1),
	(454,'751',701,NULL,0,NULL,'West Midlands',1),
	(455,'752',701,NULL,0,NULL,'West Sussex',1),
	(456,'753',701,NULL,0,NULL,'West Yorkshire',1),
	(457,'754',701,NULL,0,NULL,'West Riding of Yorkshire',1),
	(458,'755',701,NULL,0,NULL,'Wiltshire',1),
	(459,'756',701,NULL,0,NULL,'Worcestershire',1),
	(460,'757',701,NULL,0,NULL,'Yorkshire',1),
	(461,'758',702,NULL,0,NULL,'Anglesey',1),
	(462,'759',702,NULL,0,NULL,'Breconshire',1),
	(463,'760',702,NULL,0,NULL,'Caernarvonshire',1),
	(464,'761',702,NULL,0,NULL,'Cardiganshire',1),
	(465,'762',702,NULL,0,NULL,'Carmarthenshire',1),
	(466,'763',702,NULL,0,NULL,'Ceredigion',1),
	(467,'764',702,NULL,0,NULL,'Denbighshire',1),
	(468,'765',702,NULL,0,NULL,'Flintshire',1),
	(469,'766',702,NULL,0,NULL,'Glamorgan',1),
	(470,'767',702,NULL,0,NULL,'Gwent',1),
	(471,'768',702,NULL,0,NULL,'Gwynedd',1),
	(472,'769',702,NULL,0,NULL,'Merionethshire',1),
	(473,'770',702,NULL,0,NULL,'Monmouthshire',1),
	(474,'771',702,NULL,0,NULL,'Mid Glamorgan',1),
	(475,'772',702,NULL,0,NULL,'Montgomeryshire',1),
	(476,'773',702,NULL,0,NULL,'Pembrokeshire',1),
	(477,'774',702,NULL,0,NULL,'Powys',1),
	(478,'775',702,NULL,0,NULL,'Radnorshire',1),
	(479,'776',702,NULL,0,NULL,'South Glamorgan',1),
	(480,'777',703,NULL,0,NULL,'Aberdeen, City of',1),
	(481,'778',703,NULL,0,NULL,'Angus',1),
	(482,'779',703,NULL,0,NULL,'Argyll',1),
	(483,'780',703,NULL,0,NULL,'Ayrshire',1),
	(484,'781',703,NULL,0,NULL,'Banffshire',1),
	(485,'782',703,NULL,0,NULL,'Berwickshire',1),
	(486,'783',703,NULL,0,NULL,'Bute',1),
	(487,'784',703,NULL,0,NULL,'Caithness',1),
	(488,'785',703,NULL,0,NULL,'Clackmannanshire',1),
	(489,'786',703,NULL,0,NULL,'Dumfriesshire',1),
	(490,'787',703,NULL,0,NULL,'Dumbartonshire',1),
	(491,'788',703,NULL,0,NULL,'Dundee, City of',1),
	(492,'789',703,NULL,0,NULL,'East Lothian',1),
	(493,'790',703,NULL,0,NULL,'Fife',1),
	(494,'791',703,NULL,0,NULL,'Inverness',1),
	(495,'792',703,NULL,0,NULL,'Kincardineshire',1),
	(496,'793',703,NULL,0,NULL,'Kinross-shire',1),
	(497,'794',703,NULL,0,NULL,'Kirkcudbrightshire',1),
	(498,'795',703,NULL,0,NULL,'Lanarkshire',1),
	(499,'796',703,NULL,0,NULL,'Midlothian',1),
	(500,'797',703,NULL,0,NULL,'Morayshire',1),
	(501,'798',703,NULL,0,NULL,'Nairnshire',1),
	(502,'799',703,NULL,0,NULL,'Orkney',1),
	(503,'800',703,NULL,0,NULL,'Peebleshire',1),
	(504,'801',703,NULL,0,NULL,'Perthshire',1),
	(505,'802',703,NULL,0,NULL,'Renfrewshire',1),
	(506,'803',703,NULL,0,NULL,'Ross & Cromarty',1),
	(507,'804',703,NULL,0,NULL,'Roxburghshire',1),
	(508,'805',703,NULL,0,NULL,'Selkirkshire',1),
	(509,'806',703,NULL,0,NULL,'Shetland',1),
	(510,'807',703,NULL,0,NULL,'Stirlingshire',1),
	(511,'808',703,NULL,0,NULL,'Sutherland',1),
	(512,'809',703,NULL,0,NULL,'West Lothian',1),
	(513,'810',703,NULL,0,NULL,'Wigtownshire',1),
	(514,'811',704,NULL,0,NULL,'Antrim',1),
	(515,'812',704,NULL,0,NULL,'Armagh',1),
	(516,'813',704,NULL,0,NULL,'Co. Down',1),
	(517,'814',704,NULL,0,NULL,'Co. Fermanagh',1),
	(518,'815',704,NULL,0,NULL,'Co. Londonderry',1),
	(519,'AL',1101,'',0,'ALABAMA','Alabama',1),
	(520,'AK',1101,'',0,'ALASKA','Alaska',1),
	(521,'AZ',1101,'',0,'ARIZONA','Arizona',1),
	(522,'AR',1101,'',0,'ARKANSAS','Arkansas',1),
	(523,'CA',1101,'',0,'CALIFORNIA','California',1),
	(524,'CO',1101,'',0,'COLORADO','Colorado',1),
	(525,'CT',1101,'',0,'CONNECTICUT','Connecticut',1),
	(526,'DE',1101,'',0,'DELAWARE','Delaware',1),
	(527,'FL',1101,'',0,'FLORIDA','Florida',1),
	(528,'GA',1101,'',0,'GEORGIA','Georgia',1),
	(529,'HI',1101,'',0,'HAWAII','Hawaii',1),
	(530,'ID',1101,'',0,'IDAHO','Idaho',1),
	(531,'IL',1101,'',0,'ILLINOIS','Illinois',1),
	(532,'IN',1101,'',0,'INDIANA','Indiana',1),
	(533,'IA',1101,'',0,'IOWA','Iowa',1),
	(534,'KS',1101,'',0,'KANSAS','Kansas',1),
	(535,'KY',1101,'',0,'KENTUCKY','Kentucky',1),
	(536,'LA',1101,'',0,'LOUISIANA','Louisiana',1),
	(537,'ME',1101,'',0,'MAINE','Maine',1),
	(538,'MD',1101,'',0,'MARYLAND','Maryland',1),
	(539,'MA',1101,'',0,'MASSACHUSSETTS','Massachusetts',1),
	(540,'MI',1101,'',0,'MICHIGAN','Michigan',1),
	(541,'MN',1101,'',0,'MINNESOTA','Minnesota',1),
	(542,'MS',1101,'',0,'MISSISSIPPI','Mississippi',1),
	(543,'MO',1101,'',0,'MISSOURI','Missouri',1),
	(544,'MT',1101,'',0,'MONTANA','Montana',1),
	(545,'NE',1101,'',0,'NEBRASKA','Nebraska',1),
	(546,'NV',1101,'',0,'NEVADA','Nevada',1),
	(547,'NH',1101,'',0,'NEW HAMPSHIRE','New Hampshire',1),
	(548,'NJ',1101,'',0,'NEW JERSEY','New Jersey',1),
	(549,'NM',1101,'',0,'NEW MEXICO','New Mexico',1),
	(550,'NY',1101,'',0,'NEW YORK','New York',1),
	(551,'NC',1101,'',0,'NORTH CAROLINA','North Carolina',1),
	(552,'ND',1101,'',0,'NORTH DAKOTA','North Dakota',1),
	(553,'OH',1101,'',0,'OHIO','Ohio',1),
	(554,'OK',1101,'',0,'OKLAHOMA','Oklahoma',1),
	(555,'OR',1101,'',0,'OREGON','Oregon',1),
	(556,'PA',1101,'',0,'PENNSYLVANIA','Pennsylvania',1),
	(557,'RI',1101,'',0,'RHODE ISLAND','Rhode Island',1),
	(558,'SC',1101,'',0,'SOUTH CAROLINA','South Carolina',1),
	(559,'SD',1101,'',0,'SOUTH DAKOTA','South Dakota',1),
	(560,'TN',1101,'',0,'TENNESSEE','Tennessee',1),
	(561,'TX',1101,'',0,'TEXAS','Texas',1),
	(562,'UT',1101,'',0,'UTAH','Utah',1),
	(563,'VT',1101,'',0,'VERMONT','Vermont',1),
	(564,'VA',1101,'',0,'VIRGINIA','Virginia',1),
	(565,'WA',1101,'',0,'WASHINGTON','Washington',1),
	(566,'WV',1101,'',0,'WEST VIRGINIA','West Virginia',1),
	(567,'WI',1101,'',0,'WISCONSIN','Wisconsin',1),
	(568,'WY',1101,'',0,'WYOMING','Wyoming',1),
	(569,'GR',1701,NULL,NULL,NULL,'Groningen',1),
	(570,'FR',1701,NULL,NULL,NULL,'Friesland',1),
	(571,'DR',1701,NULL,NULL,NULL,'Drenthe',1),
	(572,'OV',1701,NULL,NULL,NULL,'Overijssel',1),
	(573,'GD',1701,NULL,NULL,NULL,'Gelderland',1),
	(574,'FL',1701,NULL,NULL,NULL,'Flevoland',1),
	(575,'UT',1701,NULL,NULL,NULL,'Utrecht',1),
	(576,'NH',1701,NULL,NULL,NULL,'Noord-Holland',1),
	(577,'ZH',1701,NULL,NULL,NULL,'Zuid-Holland',1),
	(578,'ZL',1701,NULL,NULL,NULL,'Zeeland',1),
	(579,'NB',1701,NULL,NULL,NULL,'Noord-Brabant',1),
	(580,'LB',1701,NULL,NULL,NULL,'Limburg',1),
	(581,'SS',8601,'',0,'','San Salvador',1),
	(582,'SA',8603,'',0,'','Santa Ana',1),
	(583,'AH',8603,'',0,'','Ahuachapan',1),
	(584,'SO',8603,'',0,'','Sonsonate',1),
	(585,'US',8602,'',0,'','Usulutan',1),
	(586,'SM',8602,'',0,'','San Miguel',1),
	(587,'MO',8602,'',0,'','Morazan',1),
	(588,'LU',8602,'',0,'','La Union',1),
	(589,'LL',8601,'',0,'','La Libertad',1),
	(590,'CH',8601,'',0,'','Chalatenango',1),
	(591,'CA',8601,'',0,'','Cabañas',1),
	(592,'LP',8601,'',0,'','La Paz',1),
	(593,'SV',8601,'',0,'','San Vicente',1),
	(594,'CU',8601,'',0,'','Cuscatlan',1),
	(595,'2301',2301,'',0,'CATAMARCA','Catamarca',1),
	(596,'2302',2301,'',0,'JUJUY','Jujuy',1),
	(597,'2303',2301,'',0,'TUCAMAN','Tucamán',1),
	(598,'2304',2301,'',0,'SANTIAGO DEL ESTERO','Santiago del Estero',1),
	(599,'2305',2301,'',0,'SALTA','Salta',1),
	(600,'2306',2302,'',0,'CHACO','Chaco',1),
	(601,'2307',2302,'',0,'CORRIENTES','Corrientes',1),
	(602,'2308',2302,'',0,'ENTRE RIOS','Entre Ríos',1),
	(603,'2309',2302,'',0,'FORMOSA MISIONES','Formosa Misiones',1),
	(604,'2310',2302,'',0,'SANTA FE','Santa Fe',1),
	(605,'2311',2303,'',0,'LA RIOJA','La Rioja',1),
	(606,'2312',2303,'',0,'MENDOZA','Mendoza',1),
	(607,'2313',2303,'',0,'SAN JUAN','San Juan',1),
	(608,'2314',2303,'',0,'SAN LUIS','San Luis',1),
	(609,'2315',2304,'',0,'CORDOBA','Córdoba',1),
	(610,'2316',2304,'',0,'BUENOS AIRES','Buenos Aires',1),
	(611,'2317',2304,'',0,'CABA','Caba',1),
	(612,'2318',2305,'',0,'LA PAMPA','La Pampa',1),
	(613,'2319',2305,'',0,'NEUQUEN','Neuquén',1),
	(614,'2320',2305,'',0,'RIO NEGRO','Río Negro',1),
	(615,'2321',2305,'',0,'CHUBUT','Chubut',1),
	(616,'2322',2305,'',0,'SANTA CRUZ','Santa Cruz',1),
	(617,'2323',2305,'',0,'TIERRA DEL FUEGO','Tierra del Fuego',1),
	(618,'2324',2305,'',0,'ISLAS MALVINAS','Islas Malvinas',1),
	(619,'2325',2305,'',0,'ANTARTIDA','Antártida',1),
	(620,'AC',5601,'ACRE',0,'AC','Acre',1),
	(621,'AL',5601,'ALAGOAS',0,'AL','Alagoas',1),
	(622,'AP',5601,'AMAPA',0,'AP','Amapá',1),
	(623,'AM',5601,'AMAZONAS',0,'AM','Amazonas',1),
	(624,'BA',5601,'BAHIA',0,'BA','Bahia',1),
	(625,'CE',5601,'CEARA',0,'CE','Ceará',1),
	(626,'ES',5601,'ESPIRITO SANTO',0,'ES','Espirito Santo',1),
	(627,'GO',5601,'GOIAS',0,'GO','Goiás',1),
	(628,'MA',5601,'MARANHAO',0,'MA','Maranhão',1),
	(629,'MT',5601,'MATO GROSSO',0,'MT','Mato Grosso',1),
	(630,'MS',5601,'MATO GROSSO DO SUL',0,'MS','Mato Grosso do Sul',1),
	(631,'MG',5601,'MINAS GERAIS',0,'MG','Minas Gerais',1),
	(632,'PA',5601,'PARA',0,'PA','Pará',1),
	(633,'PB',5601,'PARAIBA',0,'PB','Paraiba',1),
	(634,'PR',5601,'PARANA',0,'PR','Paraná',1),
	(635,'PE',5601,'PERNAMBUCO',0,'PE','Pernambuco',1),
	(636,'PI',5601,'PIAUI',0,'PI','Piauí',1),
	(637,'RJ',5601,'RIO DE JANEIRO',0,'RJ','Rio de Janeiro',1),
	(638,'RN',5601,'RIO GRANDE DO NORTE',0,'RN','Rio Grande do Norte',1),
	(639,'RS',5601,'RIO GRANDE DO SUL',0,'RS','Rio Grande do Sul',1),
	(640,'RO',5601,'RONDONIA',0,'RO','Rondônia',1),
	(641,'RR',5601,'RORAIMA',0,'RR','Roraima',1),
	(642,'SC',5601,'SANTA CATARINA',0,'SC','Santa Catarina',1),
	(643,'SE',5601,'SERGIPE',0,'SE','Sergipe',1),
	(644,'SP',5601,'SAO PAULO',0,'SP','Sao Paulo',1),
	(645,'TO',5601,'TOCANTINS',0,'TO','Tocantins',1),
	(646,'DF',5601,'DISTRITO FEDERAL',0,'DF','Distrito Federal',1),
	(647,'151',6715,'',0,'151','Arica',1),
	(648,'152',6715,'',0,'152','Parinacota',1),
	(649,'011',6701,'',0,'011','Iquique',1),
	(650,'014',6701,'',0,'014','Tamarugal',1),
	(651,'021',6702,'',0,'021','Antofagasa',1),
	(652,'022',6702,'',0,'022','El Loa',1),
	(653,'023',6702,'',0,'023','Tocopilla',1),
	(654,'031',6703,'',0,'031','Copiapó',1),
	(655,'032',6703,'',0,'032','Chañaral',1),
	(656,'033',6703,'',0,'033','Huasco',1),
	(657,'041',6704,'',0,'041','Elqui',1),
	(658,'042',6704,'',0,'042','Choapa',1),
	(659,'043',6704,'',0,'043','Limarí',1),
	(660,'051',6705,'',0,'051','Valparaíso',1),
	(661,'052',6705,'',0,'052','Isla de Pascua',1),
	(662,'053',6705,'',0,'053','Los Andes',1),
	(663,'054',6705,'',0,'054','Petorca',1),
	(664,'055',6705,'',0,'055','Quillota',1),
	(665,'056',6705,'',0,'056','San Antonio',1),
	(666,'057',6705,'',0,'057','San Felipe de Aconcagua',1),
	(667,'058',6705,'',0,'058','Marga Marga',1),
	(668,'061',6706,'',0,'061','Cachapoal',1),
	(669,'062',6706,'',0,'062','Cardenal Caro',1),
	(670,'063',6706,'',0,'063','Colchagua',1),
	(671,'071',6707,'',0,'071','Talca',1),
	(672,'072',6707,'',0,'072','Cauquenes',1),
	(673,'073',6707,'',0,'073','Curicó',1),
	(674,'074',6707,'',0,'074','Linares',1),
	(675,'081',6708,'',0,'081','Concepción',1),
	(676,'082',6708,'',0,'082','Arauco',1),
	(677,'083',6708,'',0,'083','Biobío',1),
	(678,'084',6708,'',0,'084','Ñuble',1),
	(679,'091',6709,'',0,'091','Cautín',1),
	(680,'092',6709,'',0,'092','Malleco',1),
	(681,'141',6714,'',0,'141','Valdivia',1),
	(682,'142',6714,'',0,'142','Ranco',1),
	(683,'101',6710,'',0,'101','Llanquihue',1),
	(684,'102',6710,'',0,'102','Chiloé',1),
	(685,'103',6710,'',0,'103','Osorno',1),
	(686,'104',6710,'',0,'104','Palena',1),
	(687,'111',6711,'',0,'111','Coihaique',1),
	(688,'112',6711,'',0,'112','Aisén',1),
	(689,'113',6711,'',0,'113','Capitán Prat',1),
	(690,'114',6711,'',0,'114','General Carrera',1),
	(691,'121',6712,'',0,'121','Magallanes',1),
	(692,'122',6712,'',0,'122','Antártica Chilena',1),
	(693,'123',6712,'',0,'123','Tierra del Fuego',1),
	(694,'124',6712,'',0,'124','Última Esperanza',1),
	(695,'131',6713,'',0,'131','Santiago',1),
	(696,'132',6713,'',0,'132','Cordillera',1),
	(697,'133',6713,'',0,'133','Chacabuco',1),
	(698,'134',6713,'',0,'134','Maipo',1),
	(699,'135',6713,'',0,'135','Melipilla',1),
	(700,'136',6713,'',0,'136','Talagante',1),
	(701,'AN',11701,NULL,0,'AN','Andaman & Nicobar',1),
	(702,'AP',11701,NULL,0,'AP','Andhra Pradesh',1),
	(703,'AR',11701,NULL,0,'AR','Arunachal Pradesh',1),
	(704,'AS',11701,NULL,0,'AS','Assam',1),
	(705,'BR',11701,NULL,0,'BR','Bihar',1),
	(706,'CG',11701,NULL,0,'CG','Chattisgarh',1),
	(707,'CH',11701,NULL,0,'CH','Chandigarh',1),
	(708,'DD',11701,NULL,0,'DD','Daman & Diu',1),
	(709,'DL',11701,NULL,0,'DL','Delhi',1),
	(710,'DN',11701,NULL,0,'DN','Dadra and Nagar Haveli',1),
	(711,'GA',11701,NULL,0,'GA','Goa',1),
	(712,'GJ',11701,NULL,0,'GJ','Gujarat',1),
	(713,'HP',11701,NULL,0,'HP','Himachal Pradesh',1),
	(714,'HR',11701,NULL,0,'HR','Haryana',1),
	(715,'JH',11701,NULL,0,'JH','Jharkhand',1),
	(716,'JK',11701,NULL,0,'JK','Jammu & Kashmir',1),
	(717,'KA',11701,NULL,0,'KA','Karnataka',1),
	(718,'KL',11701,NULL,0,'KL','Kerala',1),
	(719,'LD',11701,NULL,0,'LD','Lakshadweep',1),
	(720,'MH',11701,NULL,0,'MH','Maharashtra',1),
	(721,'ML',11701,NULL,0,'ML','Meghalaya',1),
	(722,'MN',11701,NULL,0,'MN','Manipur',1),
	(723,'MP',11701,NULL,0,'MP','Madhya Pradesh',1),
	(724,'MZ',11701,NULL,0,'MZ','Mizoram',1),
	(725,'NL',11701,NULL,0,'NL','Nagaland',1),
	(726,'OR',11701,NULL,0,'OR','Orissa',1),
	(727,'PB',11701,NULL,0,'PB','Punjab',1),
	(728,'PY',11701,NULL,0,'PY','Puducherry',1),
	(729,'RJ',11701,NULL,0,'RJ','Rajasthan',1),
	(730,'SK',11701,NULL,0,'SK','Sikkim',1),
	(731,'TN',11701,NULL,0,'TN','Tamil Nadu',1),
	(732,'TR',11701,NULL,0,'TR','Tripura',1),
	(733,'UL',11701,NULL,0,'UL','Uttarakhand',1),
	(734,'UP',11701,NULL,0,'UP','Uttar Pradesh',1),
	(735,'WB',11701,NULL,0,'WB','West Bengal',1),
	(736,'DIF',15401,'',0,'DIF','Distrito Federal',1),
	(737,'AGS',15401,'',0,'AGS','Aguascalientes',1),
	(738,'BCN',15401,'',0,'BCN','Baja California Norte',1),
	(739,'BCS',15401,'',0,'BCS','Baja California Sur',1),
	(740,'CAM',15401,'',0,'CAM','Campeche',1),
	(741,'CHP',15401,'',0,'CHP','Chiapas',1),
	(742,'CHI',15401,'',0,'CHI','Chihuahua',1),
	(743,'COA',15401,'',0,'COA','Coahuila',1),
	(744,'COL',15401,'',0,'COL','Colima',1),
	(745,'DUR',15401,'',0,'DUR','Durango',1),
	(746,'GTO',15401,'',0,'GTO','Guanajuato',1),
	(747,'GRO',15401,'',0,'GRO','Guerrero',1),
	(748,'HGO',15401,'',0,'HGO','Hidalgo',1),
	(749,'JAL',15401,'',0,'JAL','Jalisco',1),
	(750,'MEX',15401,'',0,'MEX','México',1),
	(751,'MIC',15401,'',0,'MIC','Michoacán de Ocampo',1),
	(752,'MOR',15401,'',0,'MOR','Morelos',1),
	(753,'NAY',15401,'',0,'NAY','Nayarit',1),
	(754,'NLE',15401,'',0,'NLE','Nuevo León',1),
	(755,'OAX',15401,'',0,'OAX','Oaxaca',1),
	(756,'PUE',15401,'',0,'PUE','Puebla',1),
	(757,'QRO',15401,'',0,'QRO','Querétaro',1),
	(758,'ROO',15401,'',0,'ROO','Quintana Roo',1),
	(759,'SLP',15401,'',0,'SLP','San Luis Potosí',1),
	(760,'SIN',15401,'',0,'SIN','Sinaloa',1),
	(761,'SON',15401,'',0,'SON','Sonora',1),
	(762,'TAB',15401,'',0,'TAB','Tabasco',1),
	(763,'TAM',15401,'',0,'TAM','Tamaulipas',1),
	(764,'TLX',15401,'',0,'TLX','Tlaxcala',1),
	(765,'VER',15401,'',0,'VER','Veracruz',1),
	(766,'YUC',15401,'',0,'YUC','Yucatán',1),
	(767,'ZAC',15401,'',0,'ZAC','Zacatecas',1),
	(768,'ANT',7001,'',0,'ANT','Antioquia',1),
	(769,'BOL',7001,'',0,'BOL','Bolívar',1),
	(770,'BOY',7001,'',0,'BOY','Boyacá',1),
	(771,'CAL',7001,'',0,'CAL','Caldas',1),
	(772,'CAU',7001,'',0,'CAU','Cauca',1),
	(773,'CUN',7001,'',0,'CUN','Cundinamarca',1),
	(774,'HUI',7001,'',0,'HUI','Huila',1),
	(775,'LAG',7001,'',0,'LAG','La Guajira',1),
	(776,'MET',7001,'',0,'MET','Meta',1),
	(777,'NAR',7001,'',0,'NAR','Nariño',1),
	(778,'NDS',7001,'',0,'NDS','Norte de Santander',1),
	(779,'SAN',7001,'',0,'SAN','Santander',1),
	(780,'SUC',7001,'',0,'SUC','Sucre',1),
	(781,'TOL',7001,'',0,'TOL','Tolima',1),
	(782,'VAC',7001,'',0,'VAC','Valle del Cauca',1),
	(783,'RIS',7001,'',0,'RIS','Risalda',1),
	(784,'ATL',7001,'',0,'ATL','Atlántico',1),
	(785,'COR',7001,'',0,'COR','Córdoba',1),
	(786,'SAP',7001,'',0,'SAP','San Andrés, Providencia y Santa Catalina',1),
	(787,'ARA',7001,'',0,'ARA','Arauca',1),
	(788,'CAS',7001,'',0,'CAS','Casanare',1),
	(789,'AMA',7001,'',0,'AMA','Amazonas',1),
	(790,'CAQ',7001,'',0,'CAQ','Caquetá',1),
	(791,'CHO',7001,'',0,'CHO','Chocó',1),
	(792,'GUA',7001,'',0,'GUA','Guainía',1),
	(793,'GUV',7001,'',0,'GUV','Guaviare',1),
	(794,'PUT',7001,'',0,'PUT','Putumayo',1),
	(795,'QUI',7001,'',0,'QUI','Quindío',1),
	(796,'VAU',7001,'',0,'VAU','Vaupés',1),
	(797,'BOG',7001,'',0,'BOG','Bogotá',1),
	(798,'VID',7001,'',0,'VID','Vichada',1),
	(799,'CES',7001,'',0,'CES','Cesar',1),
	(800,'MAG',7001,'',0,'MAG','Magdalena',1),
	(801,'AT',11401,'',0,'AT','Atlántida',1),
	(802,'CH',11401,'',0,'CH','Choluteca',1),
	(803,'CL',11401,'',0,'CL','Colón',1),
	(804,'CM',11401,'',0,'CM','Comayagua',1),
	(805,'CO',11401,'',0,'CO','Copán',1),
	(806,'CR',11401,'',0,'CR','Cortés',1),
	(807,'EP',11401,'',0,'EP','El Paraíso',1),
	(808,'FM',11401,'',0,'FM','Francisco Morazán',1),
	(809,'GD',11401,'',0,'GD','Gracias a Dios',1),
	(810,'IN',11401,'',0,'IN','Intibucá',1),
	(811,'IB',11401,'',0,'IB','Islas de la Bahía',1),
	(812,'LP',11401,'',0,'LP','La Paz',1),
	(813,'LM',11401,'',0,'LM','Lempira',1),
	(814,'OC',11401,'',0,'OC','Ocotepeque',1),
	(815,'OL',11401,'',0,'OL','Olancho',1),
	(816,'SB',11401,'',0,'SB','Santa Bárbara',1),
	(817,'VL',11401,'',0,'VL','Valle',1),
	(818,'YO',11401,'',0,'YO','Yoro',1),
	(819,'DC',11401,'',0,'DC','Distrito Central',1),
	(820,'CC',4601,'Oistins',0,'CC','Christ Church',1),
	(821,'SA',4601,'Greenland',0,'SA','Saint Andrew',1),
	(822,'SG',4601,'Bulkeley',0,'SG','Saint George',1),
	(823,'JA',4601,'Holetown',0,'JA','Saint James',1),
	(824,'SJ',4601,'Four Roads',0,'SJ','Saint John',1),
	(825,'SB',4601,'Bathsheba',0,'SB','Saint Joseph',1),
	(826,'SL',4601,'Crab Hill',0,'SL','Saint Lucy',1),
	(827,'SM',4601,'Bridgetown',0,'SM','Saint Michael',1),
	(828,'SP',4601,'Speightstown',0,'SP','Saint Peter',1),
	(829,'SC',4601,'Crane',0,'SC','Saint Philip',1),
	(830,'ST',4601,'Hillaby',0,'ST','Saint Thomas',1),
	(831,'VE-L',23201,'',0,'VE-L','Mérida',1),
	(832,'VE-T',23201,'',0,'VE-T','Trujillo',1),
	(833,'VE-E',23201,'',0,'VE-E','Barinas',1),
	(834,'VE-M',23202,'',0,'VE-M','Miranda',1),
	(835,'VE-W',23202,'',0,'VE-W','Vargas',1),
	(836,'VE-A',23202,'',0,'VE-A','Distrito Capital',1),
	(837,'VE-D',23203,'',0,'VE-D','Aragua',1),
	(838,'VE-G',23203,'',0,'VE-G','Carabobo',1),
	(839,'VE-I',23204,'',0,'VE-I','Falcón',1),
	(840,'VE-K',23204,'',0,'VE-K','Lara',1),
	(841,'VE-U',23204,'',0,'VE-U','Yaracuy',1),
	(842,'VE-F',23205,'',0,'VE-F','Bolívar',1),
	(843,'VE-X',23205,'',0,'VE-X','Amazonas',1),
	(844,'VE-Y',23205,'',0,'VE-Y','Delta Amacuro',1),
	(845,'VE-O',23206,'',0,'VE-O','Nueva Esparta',1),
	(846,'VE-Z',23206,'',0,'VE-Z','Dependencias Federales',1),
	(847,'VE-C',23207,'',0,'VE-C','Apure',1),
	(848,'VE-J',23207,'',0,'VE-J','Guárico',1),
	(849,'VE-H',23207,'',0,'VE-H','Cojedes',1),
	(850,'VE-P',23207,'',0,'VE-P','Portuguesa',1),
	(851,'VE-B',23208,'',0,'VE-B','Anzoátegui',1),
	(852,'VE-N',23208,'',0,'VE-N','Monagas',1),
	(853,'VE-R',23208,'',0,'VE-R','Sucre',1),
	(854,'VE-V',23209,'',0,'VE-V','Zulia',1),
	(855,'VE-S',23209,'',0,'VE-S','Táchira',1),
	(856,'AL01',1301,'',0,'','Wilaya d\'Adrar',1),
	(857,'AL02',1301,'',0,'','Wilaya de Chlef',1),
	(858,'AL03',1301,'',0,'','Wilaya de Laghouat',1),
	(859,'AL04',1301,'',0,'','Wilaya d\'Oum El Bouaghi',1),
	(860,'AL05',1301,'',0,'','Wilaya de Batna',1),
	(861,'AL06',1301,'',0,'','Wilaya de Béjaïa',1),
	(862,'AL07',1301,'',0,'','Wilaya de Biskra',1),
	(863,'AL08',1301,'',0,'','Wilaya de Béchar',1),
	(864,'AL09',1301,'',0,'','Wilaya de Blida',1),
	(865,'AL11',1301,'',0,'','Wilaya de Bouira',1),
	(866,'AL12',1301,'',0,'','Wilaya de Tamanrasset',1),
	(867,'AL13',1301,'',0,'','Wilaya de Tébessa',1),
	(868,'AL14',1301,'',0,'','Wilaya de Tlemcen',1),
	(869,'AL15',1301,'',0,'','Wilaya de Tiaret',1),
	(870,'AL16',1301,'',0,'','Wilaya de Tizi Ouzou',1),
	(871,'AL17',1301,'',0,'','Wilaya d\'Alger',1),
	(872,'AL18',1301,'',0,'','Wilaya de Djelfa',1),
	(873,'AL19',1301,'',0,'','Wilaya de Jijel',1),
	(874,'AL20',1301,'',0,'','Wilaya de Sétif	',1),
	(875,'AL21',1301,'',0,'','Wilaya de Saïda',1),
	(876,'AL22',1301,'',0,'','Wilaya de Skikda',1),
	(877,'AL23',1301,'',0,'','Wilaya de Sidi Bel Abbès',1),
	(878,'AL24',1301,'',0,'','Wilaya d\'Annaba',1),
	(879,'AL25',1301,'',0,'','Wilaya de Guelma',1),
	(880,'AL26',1301,'',0,'','Wilaya de Constantine',1),
	(881,'AL27',1301,'',0,'','Wilaya de Médéa',1),
	(882,'AL28',1301,'',0,'','Wilaya de Mostaganem',1),
	(883,'AL29',1301,'',0,'','Wilaya de M\'Sila',1),
	(884,'AL30',1301,'',0,'','Wilaya de Mascara',1),
	(885,'AL31',1301,'',0,'','Wilaya d\'Ouargla',1),
	(886,'AL32',1301,'',0,'','Wilaya d\'Oran',1),
	(887,'AL33',1301,'',0,'','Wilaya d\'El Bayadh',1),
	(888,'AL34',1301,'',0,'','Wilaya d\'Illizi',1),
	(889,'AL35',1301,'',0,'','Wilaya de Bordj Bou Arreridj',1),
	(890,'AL36',1301,'',0,'','Wilaya de Boumerdès',1),
	(891,'AL37',1301,'',0,'','Wilaya d\'El Tarf',1),
	(892,'AL38',1301,'',0,'','Wilaya de Tindouf',1),
	(893,'AL39',1301,'',0,'','Wilaya de Tissemsilt',1),
	(894,'AL40',1301,'',0,'','Wilaya d\'El Oued',1),
	(895,'AL41',1301,'',0,'','Wilaya de Khenchela',1),
	(896,'AL42',1301,'',0,'','Wilaya de Souk Ahras',1),
	(897,'AL43',1301,'',0,'','Wilaya de Tipaza',1),
	(898,'AL44',1301,'',0,'','Wilaya de Mila',1),
	(899,'AL45',1301,'',0,'','Wilaya d\'Aïn Defla',1),
	(900,'AL46',1301,'',0,'','Wilaya de Naâma',1),
	(901,'AL47',1301,'',0,'','Wilaya d\'Aïn Témouchent',1),
	(902,'AL48',1301,'',0,'','Wilaya de Ghardaia',1),
	(903,'AL49',1301,'',0,'','Wilaya de Relizane',1),
	(904,'MA',1209,'',0,'','Province de Benslimane',1),
	(905,'MA1',1209,'',0,'','Province de Berrechid',1),
	(906,'MA2',1209,'',0,'','Province de Khouribga',1),
	(907,'MA3',1209,'',0,'','Province de Settat',1),
	(908,'MA4',1210,'',0,'','Province d\'El Jadida',1),
	(909,'MA5',1210,'',0,'','Province de Safi',1),
	(910,'MA6',1210,'',0,'','Province de Sidi Bennour',1),
	(911,'MA7',1210,'',0,'','Province de Youssoufia',1),
	(912,'MA6B',1205,'',0,'','Préfecture de Fès',1),
	(913,'MA7B',1205,'',0,'','Province de Boulemane',1),
	(914,'MA8',1205,'',0,'','Province de Moulay Yacoub',1),
	(915,'MA9',1205,'',0,'','Province de Sefrou',1),
	(916,'MA8A',1202,'',0,'','Province de Kénitra',1),
	(917,'MA9A',1202,'',0,'','Province de Sidi Kacem',1),
	(918,'MA10',1202,'',0,'','Province de Sidi Slimane',1),
	(919,'MA11',1208,'',0,'','Préfecture de Casablanca',1),
	(920,'MA12',1208,'',0,'','Préfecture de Mohammédia',1),
	(921,'MA13',1208,'',0,'','Province de Médiouna',1),
	(922,'MA14',1208,'',0,'','Province de Nouaceur',1),
	(923,'MA15',1214,'',0,'','Province d\'Assa-Zag',1),
	(924,'MA16',1214,'',0,'','Province d\'Es-Semara',1),
	(925,'MA17A',1214,'',0,'','Province de Guelmim',1),
	(926,'MA18',1214,'',0,'','Province de Tata',1),
	(927,'MA19',1214,'',0,'','Province de Tan-Tan',1),
	(928,'MA15',1215,'',0,'','Province de Boujdour',1),
	(929,'MA16',1215,'',0,'','Province de Lâayoune',1),
	(930,'MA17',1215,'',0,'','Province de Tarfaya',1),
	(931,'MA18',1211,'',0,'','Préfecture de Marrakech',1),
	(932,'MA19',1211,'',0,'','Province d\'Al Haouz',1),
	(933,'MA20',1211,'',0,'','Province de Chichaoua',1),
	(934,'MA21',1211,'',0,'','Province d\'El Kelâa des Sraghna',1),
	(935,'MA22',1211,'',0,'','Province d\'Essaouira',1),
	(936,'MA23',1211,'',0,'','Province de Rehamna',1),
	(937,'MA24',1206,'',0,'','Préfecture de Meknès',1),
	(938,'MA25',1206,'',0,'','Province d’El Hajeb',1),
	(939,'MA26',1206,'',0,'','Province d\'Errachidia',1),
	(940,'MA27',1206,'',0,'','Province d’Ifrane',1),
	(941,'MA28',1206,'',0,'','Province de Khénifra',1),
	(942,'MA29',1206,'',0,'','Province de Midelt',1),
	(943,'MA30',1204,'',0,'','Préfecture d\'Oujda-Angad',1),
	(944,'MA31',1204,'',0,'','Province de Berkane',1),
	(945,'MA32',1204,'',0,'','Province de Driouch',1),
	(946,'MA33',1204,'',0,'','Province de Figuig',1),
	(947,'MA34',1204,'',0,'','Province de Jerada',1),
	(948,'MA35',1204,'',0,'','Province de Nadorgg',1),
	(949,'MA36',1204,'',0,'','Province de Taourirt',1),
	(950,'MA37',1216,'',0,'','Province d\'Aousserd',1),
	(951,'MA38',1216,'',0,'','Province d\'Oued Ed-Dahab',1),
	(952,'MA39',1207,'',0,'','Préfecture de Rabat',1),
	(953,'MA40',1207,'',0,'','Préfecture de Skhirat-Témara',1),
	(954,'MA41',1207,'',0,'','Préfecture de Salé',1),
	(955,'MA42',1207,'',0,'','Province de Khémisset',1),
	(956,'MA43',1213,'',0,'','Préfecture d\'Agadir Ida-Outanane',1),
	(957,'MA44',1213,'',0,'','Préfecture d\'Inezgane-Aït Melloul',1),
	(958,'MA45',1213,'',0,'','Province de Chtouka-Aït Baha',1),
	(959,'MA46',1213,'',0,'','Province d\'Ouarzazate',1),
	(960,'MA47',1213,'',0,'','Province de Sidi Ifni',1),
	(961,'MA48',1213,'',0,'','Province de Taroudant',1),
	(962,'MA49',1213,'',0,'','Province de Tinghir',1),
	(963,'MA50',1213,'',0,'','Province de Tiznit',1),
	(964,'MA51',1213,'',0,'','Province de Zagora',1),
	(965,'MA52',1212,'',0,'','Province d\'Azilal',1),
	(966,'MA53',1212,'',0,'','Province de Beni Mellal',1),
	(967,'MA54',1212,'',0,'','Province de Fquih Ben Salah',1),
	(968,'MA55',1201,'',0,'','Préfecture de M\'diq-Fnideq',1),
	(969,'MA56',1201,'',0,'','Préfecture de Tanger-Asilah',1),
	(970,'MA57',1201,'',0,'','Province de Chefchaouen',1),
	(971,'MA58',1201,'',0,'','Province de Fahs-Anjra',1),
	(972,'MA59',1201,'',0,'','Province de Larache',1),
	(973,'MA60',1201,'',0,'','Province d\'Ouezzane',1),
	(974,'MA61',1201,'',0,'','Province de Tétouan',1),
	(975,'MA62',1203,'',0,'','Province de Guercif',1),
	(976,'MA63',1203,'',0,'','Province d\'Al Hoceïma',1),
	(977,'MA64',1203,'',0,'','Province de Taounate',1),
	(978,'MA65',1203,'',0,'','Province de Taza',1),
	(979,'MA6A',1205,'',0,'','Préfecture de Fès',1),
	(980,'MA7A',1205,'',0,'','Province de Boulemane',1),
	(981,'MA15A',1214,'',0,'','Province d\'Assa-Zag',1),
	(982,'MA16A',1214,'',0,'','Province d\'Es-Semara',1),
	(983,'MA18A',1211,'',0,'','Préfecture de Marrakech',1),
	(984,'MA19A',1214,'',0,'','Province de Tan-Tan',1),
	(985,'MA19B',1214,'',0,'','Province de Tan-Tan',1),
	(986,'TN01',1001,'',0,'','Ariana',1),
	(987,'TN02',1001,'',0,'','Béja',1),
	(988,'TN03',1001,'',0,'','Ben Arous',1),
	(989,'TN04',1001,'',0,'','Bizerte',1),
	(990,'TN05',1001,'',0,'','Gabès',1),
	(991,'TN06',1001,'',0,'','Gafsa',1),
	(992,'TN07',1001,'',0,'','Jendouba',1),
	(993,'TN08',1001,'',0,'','Kairouan',1),
	(994,'TN09',1001,'',0,'','Kasserine',1),
	(995,'TN10',1001,'',0,'','Kébili',1),
	(996,'TN11',1001,'',0,'','La Manouba',1),
	(997,'TN12',1001,'',0,'','Le Kef',1),
	(998,'TN13',1001,'',0,'','Mahdia',1),
	(999,'TN14',1001,'',0,'','Médenine',1),
	(1000,'TN15',1001,'',0,'','Monastir',1),
	(1001,'TN16',1001,'',0,'','Nabeul',1),
	(1002,'TN17',1001,'',0,'','Sfax',1),
	(1003,'TN18',1001,'',0,'','Sidi Bouzid',1),
	(1004,'TN19',1001,'',0,'','Siliana',1),
	(1005,'TN20',1001,'',0,'','Sousse',1),
	(1006,'TN21',1001,'',0,'','Tataouine',1),
	(1007,'TN22',1001,'',0,'','Tozeur',1),
	(1008,'TN23',1001,'',0,'','Tunis',1),
	(1009,'TN24',1001,'',0,'','Zaghouan',1);

/*!40000 ALTER TABLE `llx_c_departements` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_ecotaxe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_ecotaxe`;

CREATE TABLE `llx_c_ecotaxe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_ecotaxe` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_ecotaxe` WRITE;
/*!40000 ALTER TABLE `llx_c_ecotaxe` DISABLE KEYS */;

INSERT INTO `llx_c_ecotaxe` (`rowid`, `code`, `libelle`, `price`, `organization`, `fk_pays`, `active`)
VALUES
	(1,'ER-A-A','Materiels electriques < 0,2kg',0.01000000,'ERP',1,1),
	(2,'ER-A-B','Materiels electriques >= 0,2 kg et < 0,5 kg',0.03000000,'ERP',1,1),
	(3,'ER-A-C','Materiels electriques >= 0,5 kg et < 1 kg',0.04000000,'ERP',1,1),
	(4,'ER-A-D','Materiels electriques >= 1 kg et < 2 kg',0.13000000,'ERP',1,1),
	(5,'ER-A-E','Materiels electriques >= 2 kg et < 4kg',0.21000000,'ERP',1,1),
	(6,'ER-A-F','Materiels electriques >= 4 kg et < 8 kg',0.42000000,'ERP',1,1),
	(7,'ER-A-G','Materiels electriques >= 8 kg et < 15 kg',0.84000000,'ERP',1,1),
	(8,'ER-A-H','Materiels electriques >= 15 kg et < 20 kg',1.25000000,'ERP',1,1),
	(9,'ER-A-I','Materiels electriques >= 20 kg et < 30 kg',1.88000000,'ERP',1,1),
	(10,'ER-A-J','Materiels electriques >= 30 kg',3.34000000,'ERP',1,1),
	(11,'ER-M-1','TV, Moniteurs < 9kg',0.84000000,'ERP',1,1),
	(12,'ER-M-2','TV, Moniteurs >= 9kg et < 15kg',1.67000000,'ERP',1,1),
	(13,'ER-M-3','TV, Moniteurs >= 15kg et < 30kg',3.34000000,'ERP',1,1),
	(14,'ER-M-4','TV, Moniteurs >= 30 kg',6.69000000,'ERP',1,1),
	(15,'EC-A-A','Materiels electriques  0,2 kg max',0.00840000,'Ecologic',1,1),
	(16,'EC-A-B','Materiels electriques 0,21 kg min - 0,50 kg max',0.02500000,'Ecologic',1,1),
	(17,'EC-A-C','Materiels electriques  0,51 kg min - 1 kg max',0.04000000,'Ecologic',1,1),
	(18,'EC-A-D','Materiels electriques  1,01 kg min - 2,5 kg max',0.13000000,'Ecologic',1,1),
	(19,'EC-A-E','Materiels electriques  2,51 kg min - 4 kg max',0.21000000,'Ecologic',1,1),
	(20,'EC-A-F','Materiels electriques 4,01 kg min - 8 kg max',0.42000000,'Ecologic',1,1),
	(21,'EC-A-G','Materiels electriques  8,01 kg min - 12 kg max',0.63000000,'Ecologic',1,1),
	(22,'EC-A-H','Materiels electriques 12,01 kg min - 20 kg max',1.05000000,'Ecologic',1,1),
	(23,'EC-A-I','Materiels electriques  20,01 kg min',1.88000000,'Ecologic',1,1),
	(24,'EC-M-1','TV, Moniteurs 9 kg max',0.84000000,'Ecologic',1,1),
	(25,'EC-M-2','TV, Moniteurs 9,01 kg min - 18 kg max',1.67000000,'Ecologic',1,1),
	(26,'EC-M-3','TV, Moniteurs 18,01 kg min - 36 kg max',3.34000000,'Ecologic',1,1),
	(27,'EC-M-4','TV, Moniteurs 36,01 kg min',6.69000000,'Ecologic',1,1),
	(28,'ES-M-1','TV, Moniteurs <= 20 pouces',0.84000000,'Eco-systemes',1,1),
	(29,'ES-M-2','TV, Moniteurs > 20 pouces et <= 32 pouces',3.34000000,'Eco-systemes',1,1),
	(30,'ES-M-3','TV, Moniteurs > 32 pouces et autres grands ecrans',6.69000000,'Eco-systemes',1,1),
	(31,'ES-A-A','Ordinateur fixe, Audio home systems (HIFI), elements hifi separes',0.84000000,'Eco-systemes',1,1),
	(32,'ES-A-B','Ordinateur portable, CD-RCR, VCR, lecteurs et enregistreurs DVD, instruments de musique et caisses de resonance, haut parleurs...',0.25000000,'Eco-systemes',1,1),
	(33,'ES-A-C','Imprimante, photocopieur, telecopieur',0.42000000,'Eco-systemes',1,1),
	(34,'ES-A-D','Accessoires, clavier, souris, PDA, imprimante photo, appareil photo, gps, telephone, repondeur, telephone sans fil, modem, telecommande, casque, camescope, baladeur mp3, radio portable, radio K7 et CD portable, radio reveil',0.08400000,'Eco-systemes',1,1),
	(35,'ES-A-E','GSM',0.00840000,'Eco-systemes',1,1),
	(36,'ES-A-F','Jouets et equipements de loisirs et de sports < 0,5 kg',0.04200000,'Eco-systemes',1,1),
	(37,'ES-A-G','Jouets et equipements de loisirs et de sports > 0,5 kg',0.17000000,'Eco-systemes',1,1),
	(38,'ES-A-H','Jouets et equipements de loisirs et de sports > 10 kg',1.25000000,'Eco-systemes',1,1);

/*!40000 ALTER TABLE `llx_c_ecotaxe` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_effectif
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_effectif`;

CREATE TABLE `llx_c_effectif` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_effectif` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_effectif` WRITE;
/*!40000 ALTER TABLE `llx_c_effectif` DISABLE KEYS */;

INSERT INTO `llx_c_effectif` (`id`, `code`, `libelle`, `active`, `module`)
VALUES
	(0,'EF0','-',1,NULL),
	(1,'EF1-5','1 - 5',1,NULL),
	(2,'EF6-10','6 - 10',1,NULL),
	(3,'EF11-50','11 - 50',1,NULL),
	(4,'EF51-100','51 - 100',1,NULL),
	(5,'EF100-500','100 - 500',1,NULL),
	(6,'EF500-','> 500',1,NULL);

/*!40000 ALTER TABLE `llx_c_effectif` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_email_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_email_templates`;

CREATE TABLE `llx_c_email_templates` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `type_template` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_c_field_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_field_list`;

CREATE TABLE `llx_c_field_list` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `element` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `name` varchar(32) NOT NULL,
  `alias` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `align` varchar(6) DEFAULT 'left',
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  `search` tinyint(4) NOT NULL DEFAULT '0',
  `enabled` varchar(255) DEFAULT '1',
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_c_forme_juridique
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_forme_juridique`;

CREATE TABLE `llx_c_forme_juridique` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `isvatexempted` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_forme_juridique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_forme_juridique` WRITE;
/*!40000 ALTER TABLE `llx_c_forme_juridique` DISABLE KEYS */;

INSERT INTO `llx_c_forme_juridique` (`rowid`, `code`, `fk_pays`, `libelle`, `isvatexempted`, `active`, `module`)
VALUES
	(1,0,0,'-',0,1,NULL),
	(2,2301,23,'Monotributista',0,1,NULL),
	(3,2302,23,'Sociedad Civil',0,1,NULL),
	(4,2303,23,'Sociedades Comerciales',0,1,NULL),
	(5,2304,23,'Sociedades de Hecho',0,1,NULL),
	(6,2305,23,'Sociedades Irregulares',0,1,NULL),
	(7,2306,23,'Sociedad Colectiva',0,1,NULL),
	(8,2307,23,'Sociedad en Comandita Simple',0,1,NULL),
	(9,2308,23,'Sociedad de Capital e Industria',0,1,NULL),
	(10,2309,23,'Sociedad Accidental o en participación',0,1,NULL),
	(11,2310,23,'Sociedad de Responsabilidad Limitada',0,1,NULL),
	(12,2311,23,'Sociedad Anónima',0,1,NULL),
	(13,2312,23,'Sociedad Anónima con Participación Estatal Mayoritaria',0,1,NULL),
	(14,2313,23,'Sociedad en Comandita por Acciones (arts. 315 a 324, LSC)',0,1,NULL),
	(15,11,1,'Artisan Commerçant (EI)',0,1,NULL),
	(16,12,1,'Commerçant (EI)',0,1,NULL),
	(17,13,1,'Artisan (EI)',0,1,NULL),
	(18,14,1,'Officier public ou ministériel',0,1,NULL),
	(19,15,1,'Profession libérale (EI)',0,1,NULL),
	(20,16,1,'Exploitant agricole',0,1,NULL),
	(21,17,1,'Agent commercial',0,1,NULL),
	(22,18,1,'Associé Gérant de société',0,1,NULL),
	(23,19,1,'Personne physique',0,1,NULL),
	(24,21,1,'Indivision',0,1,NULL),
	(25,22,1,'Société créée de fait',0,1,NULL),
	(26,23,1,'Société en participation',0,1,NULL),
	(27,27,1,'Paroisse hors zone concordataire',0,1,NULL),
	(28,29,1,'Groupement de droit privé non doté de la personnalité morale',0,1,NULL),
	(29,31,1,'Personne morale de droit étranger, immatriculée au RCS',0,1,NULL),
	(30,32,1,'Personne morale de droit étranger, non immatriculée au RCS',0,1,NULL),
	(31,35,1,'Régime auto-entrepreneur',0,1,NULL),
	(32,41,1,'Établissement public ou régie à caractère industriel ou commercial',0,1,NULL),
	(33,51,1,'Société coopérative commerciale particulière',0,1,NULL),
	(34,52,1,'Société en nom collectif',0,1,NULL),
	(35,53,1,'Société en commandite',0,1,NULL),
	(36,54,1,'Société à responsabilité limitée (SARL)',0,1,NULL),
	(37,55,1,'Société anonyme à conseil d administration',0,1,NULL),
	(38,56,1,'Société anonyme à directoire',0,1,NULL),
	(39,57,1,'Société par actions simplifiée (SAS)',0,1,NULL),
	(40,58,1,'Entreprise Unipersonnelle à Responsabilité Limitée (EURL)',0,1,NULL),
	(41,59,1,'Société par actions simplifiée unipersonnelle (SASU)',0,1,NULL),
	(42,61,1,'Caisse d\'épargne et de prévoyance',0,1,NULL),
	(43,62,1,'Groupement d\'intérêt économique (GIE)',0,1,NULL),
	(44,63,1,'Société coopérative agricole',0,1,NULL),
	(45,64,1,'Société non commerciale d assurances',0,1,NULL),
	(46,65,1,'Société civile',0,1,NULL),
	(47,69,1,'Personnes de droit privé inscrites au RCS',0,1,NULL),
	(48,71,1,'Administration de l état',0,1,NULL),
	(49,72,1,'Collectivité territoriale',0,1,NULL),
	(50,73,1,'Établissement public administratif',0,1,NULL),
	(51,74,1,'Personne morale de droit public administratif',0,1,NULL),
	(52,81,1,'Organisme gérant régime de protection social à adhésion obligatoire',0,1,NULL),
	(53,82,1,'Organisme mutualiste',0,1,NULL),
	(54,83,1,'Comité d entreprise',0,1,NULL),
	(55,84,1,'Organisme professionnel',0,1,NULL),
	(56,85,1,'Organisme de retraite à adhésion non obligatoire',0,1,NULL),
	(57,91,1,'Syndicat de propriétaires',0,1,NULL),
	(58,92,1,'Association loi 1901 ou assimilé',0,1,NULL),
	(59,93,1,'Fondation',0,1,NULL),
	(60,99,1,'Personne morale de droit privé',0,1,NULL),
	(61,200,2,'Indépendant',0,1,NULL),
	(62,201,2,'SPRL - Société à responsabilité limitée',0,1,NULL),
	(63,202,2,'SA   - Société Anonyme',0,1,NULL),
	(64,203,2,'SCRL - Société coopérative à responsabilité limitée',0,1,NULL),
	(65,204,2,'ASBL - Association sans but Lucratif',0,1,NULL),
	(66,205,2,'SCRI - Société coopérative à responsabilité illimitée',0,1,NULL),
	(67,206,2,'SCS  - Société en commandite simple',0,1,NULL),
	(68,207,2,'SCA  - Société en commandite par action',0,1,NULL),
	(69,208,2,'SNC  - Société en nom collectif',0,1,NULL),
	(70,209,2,'GIE  - Groupement d intérêt économique',0,1,NULL),
	(71,210,2,'GEIE - Groupement européen d intérêt économique',0,1,NULL),
	(72,220,2,'Eenmanszaak',0,1,NULL),
	(73,221,2,'BVBA - Besloten vennootschap met beperkte aansprakelijkheid',0,1,NULL),
	(74,222,2,'NV   - Naamloze Vennootschap',0,1,NULL),
	(75,223,2,'CVBA - Coöperatieve vennootschap met beperkte aansprakelijkheid',0,1,NULL),
	(76,224,2,'VZW  - Vereniging zonder winstoogmerk',0,1,NULL),
	(77,225,2,'CVOA - Coöperatieve vennootschap met onbeperkte aansprakelijkheid ',0,1,NULL),
	(78,226,2,'GCV  - Gewone commanditaire vennootschap',0,1,NULL),
	(79,227,2,'Comm.VA - Commanditaire vennootschap op aandelen',0,1,NULL),
	(80,228,2,'VOF  - Vennootschap onder firma',0,1,NULL),
	(81,229,2,'VS0  - Vennootschap met sociaal oogmerk',0,1,NULL),
	(82,500,5,'GmbH - Gesellschaft mit beschränkter Haftung',0,1,NULL),
	(83,501,5,'AG - Aktiengesellschaft ',0,1,NULL),
	(84,502,5,'GmbH&Co. KG - Gesellschaft mit beschränkter Haftung & Compagnie Kommanditgesellschaft',0,1,NULL),
	(85,503,5,'Gewerbe - Personengesellschaft',0,1,NULL),
	(86,504,5,'UG - Unternehmergesellschaft -haftungsbeschränkt-',0,1,NULL),
	(87,505,5,'GbR - Gesellschaft des bürgerlichen Rechts',0,1,NULL),
	(88,506,5,'KG - Kommanditgesellschaft',0,1,NULL),
	(89,507,5,'Ltd. - Limited Company',0,1,NULL),
	(90,508,5,'OHG - Offene Handelsgesellschaft',0,1,NULL),
	(91,10201,102,'Ατομική επιχείρηση',0,1,NULL),
	(92,10202,102,'Εταιρική  επιχείρηση',0,1,NULL),
	(93,10203,102,'Ομόρρυθμη Εταιρεία Ο.Ε',0,1,NULL),
	(94,10204,102,'Ετερόρρυθμη Εταιρεία Ε.Ε',0,1,NULL),
	(95,10205,102,'Εταιρεία Περιορισμένης Ευθύνης Ε.Π.Ε',0,1,NULL),
	(96,10206,102,'Ανώνυμη Εταιρεία Α.Ε',0,1,NULL),
	(97,10207,102,'Ανώνυμη ναυτιλιακή εταιρεία Α.Ν.Ε',0,1,NULL),
	(98,10208,102,'Συνεταιρισμός',0,1,NULL),
	(99,10209,102,'Συμπλοιοκτησία',0,1,NULL),
	(100,301,3,'Società semplice',0,1,NULL),
	(101,302,3,'Società in nome collettivo s.n.c.',0,1,NULL),
	(102,303,3,'Società in accomandita semplice s.a.s.',0,1,NULL),
	(103,304,3,'Società per azioni s.p.a.',0,1,NULL),
	(104,305,3,'Società a responsabilità limitata s.r.l.',0,1,NULL),
	(105,306,3,'Società in accomandita per azioni s.a.p.a.',0,1,NULL),
	(106,307,3,'Società cooperativa a r.l.',0,1,NULL),
	(107,308,3,'Società consortile',0,1,NULL),
	(108,309,3,'Società europea',0,1,NULL),
	(109,310,3,'Società cooperativa europea',0,1,NULL),
	(110,311,3,'Società unipersonale',0,1,NULL),
	(111,312,3,'Società di professionisti',0,1,NULL),
	(112,313,3,'Società di fatto',0,1,NULL),
	(113,315,3,'Società apparente',0,1,NULL),
	(114,316,3,'Impresa individuale ',0,1,NULL),
	(115,317,3,'Impresa coniugale',0,1,NULL),
	(116,318,3,'Impresa familiare',0,1,NULL),
	(117,319,3,'Consorzio cooperativo',0,1,NULL),
	(118,320,3,'Società cooperativa sociale',0,1,NULL),
	(119,321,3,'Società cooperativa di consumo',0,1,NULL),
	(120,322,3,'Società cooperativa agricola',0,1,NULL),
	(121,323,3,'A.T.I. Associazione temporanea di imprese',0,1,NULL),
	(122,324,3,'R.T.I. Raggruppamento temporaneo di imprese',0,1,NULL),
	(123,325,3,'Studio associato',0,1,NULL),
	(124,600,6,'Raison Individuelle',0,1,NULL),
	(125,601,6,'Société Simple',0,1,NULL),
	(126,602,6,'Société en nom collectif',0,1,NULL),
	(127,603,6,'Société en commandite',0,1,NULL),
	(128,604,6,'Société anonyme (SA)',0,1,NULL),
	(129,605,6,'Société en commandite par actions',0,1,NULL),
	(130,606,6,'Société à responsabilité limitée (SARL)',0,1,NULL),
	(131,607,6,'Société coopérative',0,1,NULL),
	(132,608,6,'Association',0,1,NULL),
	(133,609,6,'Fondation',0,1,NULL),
	(134,700,7,'Sole Trader',0,1,NULL),
	(135,701,7,'Partnership',0,1,NULL),
	(136,702,7,'Private Limited Company by shares (LTD)',0,1,NULL),
	(137,703,7,'Public Limited Company',0,1,NULL),
	(138,704,7,'Workers Cooperative',0,1,NULL),
	(139,705,7,'Limited Liability Partnership',0,1,NULL),
	(140,706,7,'Franchise',0,1,NULL),
	(141,1000,10,'Société à responsabilité limitée (SARL)',0,1,NULL),
	(142,1001,10,'Société en Nom Collectif (SNC)',0,1,NULL),
	(143,1002,10,'Société en Commandite Simple (SCS)',0,1,NULL),
	(144,1003,10,'société en participation',0,1,NULL),
	(145,1004,10,'Société Anonyme (SA)',0,1,NULL),
	(146,1005,10,'Société Unipersonnelle à Responsabilité Limitée (SUARL)',0,1,NULL),
	(147,1006,10,'Groupement d\'intérêt économique (GEI)',0,1,NULL),
	(148,1007,10,'Groupe de sociétés',0,1,NULL),
	(149,1701,17,'Eenmanszaak',0,1,NULL),
	(150,1702,17,'Maatschap',0,1,NULL),
	(151,1703,17,'Vennootschap onder firma',0,1,NULL),
	(152,1704,17,'Commanditaire vennootschap',0,1,NULL),
	(153,1705,17,'Besloten vennootschap (BV)',0,1,NULL),
	(154,1706,17,'Naamloze Vennootschap (NV)',0,1,NULL),
	(155,1707,17,'Vereniging',0,1,NULL),
	(156,1708,17,'Stichting',0,1,NULL),
	(157,1709,17,'Coöperatie met beperkte aansprakelijkheid (BA)',0,1,NULL),
	(158,1710,17,'Coöperatie met uitgesloten aansprakelijkheid (UA)',0,1,NULL),
	(159,1711,17,'Coöperatie met wettelijke aansprakelijkheid (WA)',0,1,NULL),
	(160,1712,17,'Onderlinge waarborgmaatschappij',0,1,NULL),
	(161,401,4,'Empresario Individual',0,1,NULL),
	(162,402,4,'Comunidad de Bienes',0,1,NULL),
	(163,403,4,'Sociedad Civil',0,1,NULL),
	(164,404,4,'Sociedad Colectiva',0,1,NULL),
	(165,405,4,'Sociedad Limitada',0,1,NULL),
	(166,406,4,'Sociedad Anónima',0,1,NULL),
	(167,407,4,'Sociedad Comanditaria por Acciones',0,1,NULL),
	(168,408,4,'Sociedad Comanditaria Simple',0,1,NULL),
	(169,409,4,'Sociedad Laboral',0,1,NULL),
	(170,410,4,'Sociedad Cooperativa',0,1,NULL),
	(171,411,4,'Sociedad de Garantía Recíproca',0,1,NULL),
	(172,412,4,'Entidad de Capital-Riesgo',0,1,NULL),
	(173,413,4,'Agrupación de Interés Económico',0,1,NULL),
	(174,414,4,'Sociedad de Inversión Mobiliaria',0,1,NULL),
	(175,415,4,'Agrupación sin Ánimo de Lucro',0,1,NULL),
	(176,15201,152,'Mauritius Private Company Limited By Shares',0,1,NULL),
	(177,15202,152,'Mauritius Company Limited By Guarantee',0,1,NULL),
	(178,15203,152,'Mauritius Public Company Limited By Shares',0,1,NULL),
	(179,15204,152,'Mauritius Foreign Company',0,1,NULL),
	(180,15205,152,'Mauritius GBC1 (Offshore Company)',0,1,NULL),
	(181,15206,152,'Mauritius GBC2 (International Company)',0,1,NULL),
	(182,15207,152,'Mauritius General Partnership',0,1,NULL),
	(183,15208,152,'Mauritius Limited Partnership',0,1,NULL),
	(184,15209,152,'Mauritius Sole Proprietorship',0,1,NULL),
	(185,15210,152,'Mauritius Trusts',0,1,NULL),
	(186,15401,154,'Sociedad en nombre colectivo',0,1,NULL),
	(187,15402,154,'Sociedad en comandita simple',0,1,NULL),
	(188,15403,154,'Sociedad de responsabilidad limitada',0,1,NULL),
	(189,15404,154,'Sociedad anónima',0,1,NULL),
	(190,15405,154,'Sociedad en comandita por acciones',0,1,NULL),
	(191,15406,154,'Sociedad cooperativa',0,1,NULL);

/*!40000 ALTER TABLE `llx_c_forme_juridique` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_input_method
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_input_method`;

CREATE TABLE `llx_c_input_method` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `libelle` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_method` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_input_method` WRITE;
/*!40000 ALTER TABLE `llx_c_input_method` DISABLE KEYS */;

INSERT INTO `llx_c_input_method` (`rowid`, `code`, `libelle`, `active`, `module`)
VALUES
	(1,'OrderByMail','Courrier',1,NULL),
	(2,'OrderByFax','Fax',1,NULL),
	(3,'OrderByEMail','EMail',1,NULL),
	(4,'OrderByPhone','Téléphone',1,NULL),
	(5,'OrderByWWW','En ligne',1,NULL);

/*!40000 ALTER TABLE `llx_c_input_method` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_input_reason
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_input_reason`;

CREATE TABLE `llx_c_input_reason` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_reason` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_input_reason` WRITE;
/*!40000 ALTER TABLE `llx_c_input_reason` DISABLE KEYS */;

INSERT INTO `llx_c_input_reason` (`rowid`, `code`, `label`, `active`, `module`)
VALUES
	(1,'SRC_INTE','Web site',0,NULL),
	(2,'SRC_CAMP_MAIL','Mailing campaign',0,NULL),
	(3,'SRC_CAMP_PHO','Phone campaign',0,NULL),
	(4,'SRC_CAMP_FAX','Fax campaign',0,NULL),
	(5,'SRC_COMM','Commercial contact',0,NULL),
	(6,'SRC_SHOP','Shop contact',0,NULL),
	(7,'SRC_CAMP_EMAIL','EMailing campaign',0,NULL),
	(8,'SRC_WOM','Word of mouth',0,NULL),
	(9,'SRC_PARTNER','Partner',0,NULL),
	(10,'SRC_EMPLOYEE','Employee',0,NULL),
	(11,'SRC_SPONSORING','Sponsorship',0,NULL),
	(103002541,'POS','POS',1,NULL),
	(103002542,'internet','Internet',1,NULL),
	(103002543,'drive','Drive',1,NULL),
	(103002544,'techniq','Technique',1,NULL);

/*!40000 ALTER TABLE `llx_c_input_reason` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_origin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_origin`;

CREATE TABLE `llx_c_origin` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `description` text,
  `cle_bcp` varchar(255) DEFAULT NULL,
  `cle_picxyz` varchar(255) DEFAULT NULL,
  `cle_mandar` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `rowid` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_c_paiement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_paiement`;

CREATE TABLE `llx_c_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(6) NOT NULL,
  `code` varchar(15) DEFAULT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `default_amount` double NOT NULL DEFAULT '0',
  `amount_of` varchar(20) DEFAULT NULL,
  `original_label` varchar(20) DEFAULT NULL,
  `atos_code` varchar(4) DEFAULT NULL,
  `datec` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uuid` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_paiement` (`code`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_paiement` WRITE;
/*!40000 ALTER TABLE `llx_c_paiement` DISABLE KEYS */;

INSERT INTO `llx_c_paiement` (`id`, `entity`, `code`, `libelle`, `type`, `active`, `module`, `default_amount`, `amount_of`, `original_label`, `atos_code`, `datec`, `tms`, `uuid`)
VALUES
	(1,1,'CASH','Cash',NULL,1,NULL,0,'','','','2017-08-11 17:40:42','2017-08-11 17:40:42','6017c72f-24e4-4f9a-91dd-6ae7901ce939'),
	(2,1,'CB','Cb',NULL,0,NULL,0,'','','','2017-08-11 17:40:42','2017-08-11 17:40:42','c7710c61-15ff-47fc-a62d-899e2a289af1'),
	(3,1,'CHQ','Chq',NULL,1,NULL,0,'','','','2017-08-11 17:40:42','2017-08-11 17:40:42','1b5455c5-1b65-4bb9-8c18-ac343b5efee6'),
	(4,1,'TR','Tr',NULL,1,NULL,0,'','','','2017-08-11 17:40:42','2017-08-11 17:40:42','f28f91f5-91b3-486e-860b-53ae065f704c'),
	(5,1,'VISA','Visa',NULL,1,NULL,0,'','','','2017-08-11 17:40:42','2017-08-11 17:40:42','af2e61c9-be8f-4145-a03f-b469bf0a12be'),
	(6,1,'AMEX','Amex',NULL,1,NULL,0,'','','','2017-08-11 17:40:42','2017-08-11 17:40:42','da753473-7ebe-46e4-9236-687fe7296ec4'),
	(7,1,'MASTER','Master',NULL,0,NULL,0,'','','','2017-08-11 17:40:42','2017-08-11 17:40:42','4caebaef-8b6f-42bd-b95e-fa281487df86'),
	(8,1,'AVOIR','Avoir',NULL,0,NULL,0,'','','','2017-08-11 17:40:42','2017-08-11 17:40:42','3a6accb2-b12f-46f5-b1be-9f7305b63a71');

/*!40000 ALTER TABLE `llx_c_paiement` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_paper_format
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_paper_format`;

CREATE TABLE `llx_c_paper_format` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) NOT NULL,
  `width` float(6,2) DEFAULT '0.00',
  `height` float(6,2) DEFAULT '0.00',
  `unit` varchar(5) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_paper_format` WRITE;
/*!40000 ALTER TABLE `llx_c_paper_format` DISABLE KEYS */;

INSERT INTO `llx_c_paper_format` (`rowid`, `code`, `label`, `width`, `height`, `unit`, `active`, `module`)
VALUES
	(1,'EU4A0','Format 4A0',1682.00,2378.00,'mm',1,NULL),
	(2,'EU2A0','Format 2A0',1189.00,1682.00,'mm',1,NULL),
	(3,'EUA0','Format A0',840.00,1189.00,'mm',1,NULL),
	(4,'EUA1','Format A1',594.00,840.00,'mm',1,NULL),
	(5,'EUA2','Format A2',420.00,594.00,'mm',1,NULL),
	(6,'EUA3','Format A3',297.00,420.00,'mm',1,NULL),
	(7,'EUA4','Format A4',210.00,297.00,'mm',1,NULL),
	(8,'EUA5','Format A5',148.00,210.00,'mm',1,NULL),
	(9,'EUA6','Format A6',105.00,148.00,'mm',1,NULL),
	(100,'USLetter','Format Letter (A)',216.00,279.00,'mm',1,NULL),
	(105,'USLegal','Format Legal',216.00,356.00,'mm',1,NULL),
	(110,'USExecutive','Format Executive',190.00,254.00,'mm',1,NULL),
	(115,'USLedger','Format Ledger/Tabloid (B)',279.00,432.00,'mm',1,NULL),
	(200,'CAP1','Format Canadian P1',560.00,860.00,'mm',1,NULL),
	(205,'CAP2','Format Canadian P2',430.00,560.00,'mm',1,NULL),
	(210,'CAP3','Format Canadian P3',280.00,430.00,'mm',1,NULL),
	(215,'CAP4','Format Canadian P4',215.00,280.00,'mm',1,NULL),
	(220,'CAP5','Format Canadian P5',140.00,215.00,'mm',1,NULL),
	(225,'CAP6','Format Canadian P6',107.00,140.00,'mm',1,NULL);

/*!40000 ALTER TABLE `llx_c_paper_format` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_payment_term
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_payment_term`;

CREATE TABLE `llx_c_payment_term` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `libelle` varchar(255) DEFAULT NULL,
  `libelle_facture` text,
  `fdm` tinyint(4) DEFAULT NULL,
  `nbjour` smallint(6) DEFAULT NULL,
  `decalage` smallint(6) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_payment_term` WRITE;
/*!40000 ALTER TABLE `llx_c_payment_term` DISABLE KEYS */;

INSERT INTO `llx_c_payment_term` (`rowid`, `code`, `sortorder`, `active`, `libelle`, `libelle_facture`, `fdm`, `nbjour`, `decalage`, `module`)
VALUES
	(1,'RECEP',1,1,'A réception de facture','Réception de facture',0,0,NULL,NULL),
	(2,'30D',2,1,'30 jours','Réglement à 30 jours',0,30,NULL,NULL),
	(3,'30DENDMONTH',3,1,'30 jours fin de mois','Réglement à 30 jours fin de mois',1,30,NULL,NULL),
	(4,'60D',4,1,'60 jours','Réglement à 60 jours',0,60,NULL,NULL),
	(5,'60DENDMONTH',5,1,'60 jours fin de mois','Réglement à 60 jours fin de mois',1,60,NULL,NULL),
	(6,'PT_ORDER',6,1,'A réception de commande','A réception de commande',0,0,NULL,NULL),
	(7,'PT_DELIVERY',7,1,'Livraison','Règlement à la livraison',0,0,NULL,NULL),
	(8,'PT_5050',8,1,'50 et 50','Règlement 50% à la commande, 50% à la livraison',0,0,NULL,NULL);

/*!40000 ALTER TABLE `llx_c_payment_term` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_pays
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_pays`;

CREATE TABLE `llx_c_pays` (
  `rowid` int(11) NOT NULL,
  `code` varchar(2) NOT NULL,
  `code_iso` varchar(3) DEFAULT NULL,
  `libelle` varchar(50) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_country_code` (`code`),
  UNIQUE KEY `idx_c_pays_libelle` (`libelle`),
  UNIQUE KEY `idx_c_country_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_pays` WRITE;
/*!40000 ALTER TABLE `llx_c_pays` DISABLE KEYS */;

INSERT INTO `llx_c_pays` (`rowid`, `code`, `code_iso`, `libelle`, `active`)
VALUES
	(0,'',NULL,'-',1),
	(1,'FR',NULL,'France',1),
	(2,'BE',NULL,'Belgium',1),
	(3,'IT',NULL,'Italy',1),
	(4,'ES',NULL,'Spain',1),
	(5,'DE',NULL,'Germany',1),
	(6,'CH',NULL,'Switzerland',1),
	(7,'GB',NULL,'United Kingdom',1),
	(8,'IE',NULL,'Irland',1),
	(9,'CN',NULL,'China',1),
	(10,'TN',NULL,'Tunisia',1),
	(11,'US',NULL,'United States',1),
	(12,'MA',NULL,'Maroc',1),
	(13,'DZ',NULL,'Algeria',1),
	(14,'CA',NULL,'Canada',1),
	(15,'TG',NULL,'Togo',1),
	(16,'GA',NULL,'Gabon',1),
	(17,'NL',NULL,'Nerderland',1),
	(18,'HU',NULL,'Hongrie',1),
	(19,'RU',NULL,'Russia',1),
	(20,'SE',NULL,'Sweden',1),
	(21,'CI',NULL,'Côte d\'Ivoire',1),
	(22,'SN',NULL,'Senegal',1),
	(23,'AR',NULL,'Argentine',1),
	(24,'CM',NULL,'Cameroun',1),
	(25,'PT',NULL,'Portugal',1),
	(26,'SA',NULL,'Saudi Arabia',1),
	(27,'MC',NULL,'Monaco',1),
	(28,'AU',NULL,'Australia',1),
	(29,'SG',NULL,'Singapour',1),
	(30,'AF',NULL,'Afghanistan',1),
	(31,'AX',NULL,'Iles Aland',1),
	(32,'AL',NULL,'Albanie',1),
	(33,'AS',NULL,'Samoa américaines',1),
	(34,'AD',NULL,'Andorre',1),
	(35,'AO',NULL,'Angola',1),
	(36,'AI',NULL,'Anguilla',1),
	(37,'AQ',NULL,'Antarctique',1),
	(38,'AG',NULL,'Antigua-et-Barbuda',1),
	(39,'AM',NULL,'Arménie',1),
	(40,'AW',NULL,'Aruba',1),
	(41,'AT',NULL,'Autriche',1),
	(42,'AZ',NULL,'Azerbaïdjan',1),
	(43,'BS',NULL,'Bahamas',1),
	(44,'BH',NULL,'Bahreïn',1),
	(45,'BD',NULL,'Bangladesh',1),
	(46,'BB',NULL,'Barbade',1),
	(47,'BY',NULL,'Biélorussie',1),
	(48,'BZ',NULL,'Belize',1),
	(49,'BJ',NULL,'Bénin',1),
	(50,'BM',NULL,'Bermudes',1),
	(51,'BT',NULL,'Bhoutan',1),
	(52,'BO',NULL,'Bolivie',1),
	(53,'BA',NULL,'Bosnie-Herzégovine',1),
	(54,'BW',NULL,'Botswana',1),
	(55,'BV',NULL,'Ile Bouvet',1),
	(56,'BR',NULL,'Brazil',1),
	(57,'IO',NULL,'Territoire britannique de l\'Océan Indien',1),
	(58,'BN',NULL,'Brunei',1),
	(59,'BG',NULL,'Bulgarie',1),
	(60,'BF',NULL,'Burkina Faso',1),
	(61,'BI',NULL,'Burundi',1),
	(62,'KH',NULL,'Cambodge',1),
	(63,'CV',NULL,'Cap-Vert',1),
	(64,'KY',NULL,'Iles Cayman',1),
	(65,'CF',NULL,'République centrafricaine',1),
	(66,'TD',NULL,'Tchad',1),
	(67,'CL',NULL,'Chili',1),
	(68,'CX',NULL,'Ile Christmas',1),
	(69,'CC',NULL,'Iles des Cocos (Keeling)',1),
	(70,'CO',NULL,'Colombie',1),
	(71,'KM',NULL,'Comores',1),
	(72,'CG',NULL,'Congo',1),
	(73,'CD',NULL,'République démocratique du Congo',1),
	(74,'CK',NULL,'Iles Cook',1),
	(75,'CR',NULL,'Costa Rica',1),
	(76,'HR',NULL,'Croatie',1),
	(77,'CU',NULL,'Cuba',1),
	(78,'CY',NULL,'Chypre',1),
	(79,'CZ',NULL,'République Tchèque',1),
	(80,'DK',NULL,'Danemark',1),
	(81,'DJ',NULL,'Djibouti',1),
	(82,'DM',NULL,'Dominique',1),
	(83,'DO',NULL,'République Dominicaine',1),
	(84,'EC',NULL,'Equateur',1),
	(85,'EG',NULL,'Egypte',1),
	(86,'SV',NULL,'Salvador',1),
	(87,'GQ',NULL,'Guinée Equatoriale',1),
	(88,'ER',NULL,'Erythrée',1),
	(89,'EE',NULL,'Estonia',1),
	(90,'ET',NULL,'Ethiopie',1),
	(91,'FK',NULL,'Iles Falkland',1),
	(92,'FO',NULL,'Iles Féroé',1),
	(93,'FJ',NULL,'Iles Fidji',1),
	(94,'FI',NULL,'Finlande',1),
	(95,'GF',NULL,'Guyane française',1),
	(96,'PF',NULL,'Polynésie française',1),
	(97,'TF',NULL,'Terres australes françaises',1),
	(98,'GM',NULL,'Gambie',1),
	(99,'GE',NULL,'Georgia',1),
	(100,'GH',NULL,'Ghana',1),
	(101,'GI',NULL,'Gibraltar',1),
	(102,'GR',NULL,'Greece',1),
	(103,'GL',NULL,'Groenland',1),
	(104,'GD',NULL,'Grenade',1),
	(106,'GU',NULL,'Guam',1),
	(107,'GT',NULL,'Guatemala',1),
	(108,'GN',NULL,'Guinea',1),
	(109,'GW',NULL,'Guinea-Bissao',1),
	(111,'HT',NULL,'Haiti',1),
	(112,'HM',NULL,'Iles Heard et McDonald',1),
	(113,'VA',NULL,'Saint-Siège (Vatican)',1),
	(114,'HN',NULL,'Honduras',1),
	(115,'HK',NULL,'Hong Kong',1),
	(116,'IS',NULL,'Islande',1),
	(117,'IN',NULL,'India',1),
	(118,'ID',NULL,'Indonésie',1),
	(119,'IR',NULL,'Iran',1),
	(120,'IQ',NULL,'Iraq',1),
	(121,'IL',NULL,'Israel',1),
	(122,'JM',NULL,'Jamaïque',1),
	(123,'JP',NULL,'Japon',1),
	(124,'JO',NULL,'Jordanie',1),
	(125,'KZ',NULL,'Kazakhstan',1),
	(126,'KE',NULL,'Kenya',1),
	(127,'KI',NULL,'Kiribati',1),
	(128,'KP',NULL,'North Corea',1),
	(129,'KR',NULL,'South Corea',1),
	(130,'KW',NULL,'Koweït',1),
	(131,'KG',NULL,'Kirghizistan',1),
	(132,'LA',NULL,'Laos',1),
	(133,'LV',NULL,'Lettonie',1),
	(134,'LB',NULL,'Liban',1),
	(135,'LS',NULL,'Lesotho',1),
	(136,'LR',NULL,'Liberia',1),
	(137,'LY',NULL,'Libye',1),
	(138,'LI',NULL,'Liechtenstein',1),
	(139,'LT',NULL,'Lituanie',1),
	(140,'LU',NULL,'Luxembourg',1),
	(141,'MO',NULL,'Macao',1),
	(142,'MK',NULL,'ex-République yougoslave de Macédoine',1),
	(143,'MG',NULL,'Madagascar',1),
	(144,'MW',NULL,'Malawi',1),
	(145,'MY',NULL,'Malaisie',1),
	(146,'MV',NULL,'Maldives',1),
	(147,'ML',NULL,'Mali',1),
	(148,'MT',NULL,'Malte',1),
	(149,'MH',NULL,'Iles Marshall',1),
	(151,'MR',NULL,'Mauritanie',1),
	(152,'MU',NULL,'Maurice',1),
	(153,'YT',NULL,'Mayotte',1),
	(154,'MX',NULL,'Mexique',1),
	(155,'FM',NULL,'Micronésie',1),
	(156,'MD',NULL,'Moldavie',1),
	(157,'MN',NULL,'Mongolie',1),
	(158,'MS',NULL,'Monserrat',1),
	(159,'MZ',NULL,'Mozambique',1),
	(160,'MM',NULL,'Birmanie (Myanmar)',1),
	(161,'NA',NULL,'Namibie',1),
	(162,'NR',NULL,'Nauru',1),
	(163,'NP',NULL,'Népal',1),
	(164,'AN',NULL,'Antilles néerlandaises',1),
	(165,'NC',NULL,'Nouvelle-Calédonie',1),
	(166,'NZ',NULL,'Nouvelle-Zélande',1),
	(167,'NI',NULL,'Nicaragua',1),
	(168,'NE',NULL,'Niger',1),
	(169,'NG',NULL,'Nigeria',1),
	(170,'NU',NULL,'Nioué',1),
	(171,'NF',NULL,'Ile Norfolk',1),
	(172,'MP',NULL,'Mariannes du Nord',1),
	(173,'NO',NULL,'Norvège',1),
	(174,'OM',NULL,'Oman',1),
	(175,'PK',NULL,'Pakistan',1),
	(176,'PW',NULL,'Palaos',1),
	(177,'PS',NULL,'Territoire Palestinien Occupé',1),
	(178,'PA',NULL,'Panama',1),
	(179,'PG',NULL,'Papouasie-Nouvelle-Guinée',1),
	(180,'PY',NULL,'Paraguay',1),
	(181,'PE',NULL,'Peru',1),
	(182,'PH',NULL,'Philippines',1),
	(183,'PN',NULL,'Iles Pitcairn',1),
	(184,'PL',NULL,'Pologne',1),
	(185,'PR',NULL,'Porto Rico',1),
	(186,'QA',NULL,'Qatar',1),
	(188,'RO',NULL,'Roumanie',1),
	(189,'RW',NULL,'Rwanda',1),
	(190,'SH',NULL,'Sainte-Hélène',1),
	(191,'KN',NULL,'Saint-Christophe-et-Niévès',1),
	(192,'LC',NULL,'Sainte-Lucie',1),
	(193,'PM',NULL,'Saint-Pierre-et-Miquelon',1),
	(194,'VC',NULL,'Saint-Vincent-et-les-Grenadines',1),
	(195,'WS',NULL,'Samoa',1),
	(196,'SM',NULL,'Saint-Marin',1),
	(197,'ST',NULL,'Sao Tomé-et-Principe',1),
	(198,'RS',NULL,'Serbie',1),
	(199,'SC',NULL,'Seychelles',1),
	(200,'SL',NULL,'Sierra Leone',1),
	(201,'SK',NULL,'Slovaquie',1),
	(202,'SI',NULL,'Slovénie',1),
	(203,'SB',NULL,'Iles Salomon',1),
	(204,'SO',NULL,'Somalie',1),
	(205,'ZA',NULL,'Afrique du Sud',1),
	(206,'GS',NULL,'Iles Géorgie du Sud et Sandwich du Sud',1),
	(207,'LK',NULL,'Sri Lanka',1),
	(208,'SD',NULL,'Soudan',1),
	(209,'SR',NULL,'Suriname',1),
	(210,'SJ',NULL,'Iles Svalbard et Jan Mayen',1),
	(211,'SZ',NULL,'Swaziland',1),
	(212,'SY',NULL,'Syrie',1),
	(213,'TW',NULL,'Taïwan',1),
	(214,'TJ',NULL,'Tadjikistan',1),
	(215,'TZ',NULL,'Tanzanie',1),
	(216,'TH',NULL,'Thaïlande',1),
	(217,'TL',NULL,'Timor Oriental',1),
	(218,'TK',NULL,'Tokélaou',1),
	(219,'TO',NULL,'Tonga',1),
	(220,'TT',NULL,'Trinité-et-Tobago',1),
	(221,'TR',NULL,'Turquie',1),
	(222,'TM',NULL,'Turkménistan',1),
	(223,'TC',NULL,'Iles Turks-et-Caicos',1),
	(224,'TV',NULL,'Tuvalu',1),
	(225,'UG',NULL,'Ouganda',1),
	(226,'UA',NULL,'Ukraine',1),
	(227,'AE',NULL,'Émirats arabes unis',1),
	(228,'UM',NULL,'Iles mineures éloignées des États-Unis',1),
	(229,'UY',NULL,'Uruguay',1),
	(230,'UZ',NULL,'Ouzbékistan',1),
	(231,'VU',NULL,'Vanuatu',1),
	(232,'VE',NULL,'Vénézuela',1),
	(233,'VN',NULL,'Viêt Nam',1),
	(234,'VG',NULL,'Iles Vierges britanniques',1),
	(235,'VI',NULL,'Iles Vierges américaines',1),
	(236,'WF',NULL,'Wallis-et-Futuna',1),
	(237,'EH',NULL,'Sahara occidental',1),
	(238,'YE',NULL,'Yémen',1),
	(239,'ZM',NULL,'Zambie',1),
	(240,'ZW',NULL,'Zimbabwe',1),
	(241,'GG',NULL,'Guernesey',1),
	(242,'IM',NULL,'Ile de Man',1),
	(243,'JE',NULL,'Jersey',1),
	(244,'ME',NULL,'Monténégro',1),
	(245,'BL',NULL,'Saint-Barthélemy',1),
	(246,'MF',NULL,'Saint-Martin',1);

/*!40000 ALTER TABLE `llx_c_pays` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_propalst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_propalst`;

CREATE TABLE `llx_c_propalst` (
  `id` smallint(6) NOT NULL,
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_propalst` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_propalst` WRITE;
/*!40000 ALTER TABLE `llx_c_propalst` DISABLE KEYS */;

INSERT INTO `llx_c_propalst` (`id`, `code`, `label`, `active`)
VALUES
	(0,'PR_DRAFT','Brouillon',1),
	(1,'PR_OPEN','Ouverte',1),
	(2,'PR_SIGNED','Signée',1),
	(3,'PR_NOTSIGNED','Non Signée',1),
	(4,'PR_FAC','Facturée',1);

/*!40000 ALTER TABLE `llx_c_propalst` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_prospectlevel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_prospectlevel`;

CREATE TABLE `llx_c_prospectlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_prospectlevel` WRITE;
/*!40000 ALTER TABLE `llx_c_prospectlevel` DISABLE KEYS */;

INSERT INTO `llx_c_prospectlevel` (`code`, `label`, `sortorder`, `active`, `module`)
VALUES
	('PL_HIGH','High',4,1,NULL),
	('PL_LOW','Low',2,1,NULL),
	('PL_MEDIUM','Medium',3,1,NULL),
	('PL_NONE','None',1,1,NULL);

/*!40000 ALTER TABLE `llx_c_prospectlevel` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_regions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_regions`;

CREATE TABLE `llx_c_regions` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code_region` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `code_region` (`code_region`),
  KEY `idx_c_regions_fk_pays` (`fk_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_regions` WRITE;
/*!40000 ALTER TABLE `llx_c_regions` DISABLE KEYS */;

INSERT INTO `llx_c_regions` (`rowid`, `code_region`, `fk_pays`, `cheflieu`, `tncc`, `nom`, `active`)
VALUES
	(1,0,0,'0',0,'-',1),
	(101,1,1,'97105',3,'Guadeloupe',1),
	(102,2,1,'97209',3,'Martinique',1),
	(103,3,1,'97302',3,'Guyane',1),
	(104,4,1,'97411',3,'Réunion',1),
	(105,11,1,'75056',1,'Île-de-France',1),
	(106,21,1,'51108',0,'Champagne-Ardenne',1),
	(107,22,1,'80021',0,'Picardie',1),
	(108,23,1,'76540',0,'Haute-Normandie',1),
	(109,24,1,'45234',2,'Centre',1),
	(110,25,1,'14118',0,'Basse-Normandie',1),
	(111,26,1,'21231',0,'Bourgogne',1),
	(112,31,1,'59350',2,'Nord-Pas-de-Calais',1),
	(113,41,1,'57463',0,'Lorraine',1),
	(114,42,1,'67482',1,'Alsace',1),
	(115,43,1,'25056',0,'Franche-Comté',1),
	(116,52,1,'44109',4,'Pays de la Loire',1),
	(117,53,1,'35238',0,'Bretagne',1),
	(118,54,1,'86194',2,'Poitou-Charentes',1),
	(119,72,1,'33063',1,'Aquitaine',1),
	(120,73,1,'31555',0,'Midi-Pyrénées',1),
	(121,74,1,'87085',2,'Limousin',1),
	(122,82,1,'69123',2,'Rhône-Alpes',1),
	(123,83,1,'63113',1,'Auvergne',1),
	(124,91,1,'34172',2,'Languedoc-Roussillon',1),
	(125,93,1,'13055',0,'Provence-Alpes-Côte d\'Azur',1),
	(126,94,1,'2A004',0,'Corse',1),
	(201,201,2,'',1,'Flandre',1),
	(202,202,2,'',2,'Wallonie',1),
	(203,203,2,'',3,'Bruxelles-Capitale',1),
	(301,301,3,NULL,1,'Abruzzo',1),
	(302,302,3,NULL,1,'Basilicata',1),
	(303,303,3,NULL,1,'Calabria',1),
	(304,304,3,NULL,1,'Campania',1),
	(305,305,3,NULL,1,'Emilia-Romagna',1),
	(306,306,3,NULL,1,'Friuli-Venezia Giulia',1),
	(307,307,3,NULL,1,'Lazio',1),
	(308,308,3,NULL,1,'Liguria',1),
	(309,309,3,NULL,1,'Lombardia',1),
	(310,310,3,NULL,1,'Marche',1),
	(311,311,3,NULL,1,'Molise',1),
	(312,312,3,NULL,1,'Piemonte',1),
	(313,313,3,NULL,1,'Puglia',1),
	(314,314,3,NULL,1,'Sardegna',1),
	(315,315,3,NULL,1,'Sicilia',1),
	(316,316,3,NULL,1,'Toscana',1),
	(317,317,3,NULL,1,'Trentino-Alto Adige',1),
	(318,318,3,NULL,1,'Umbria',1),
	(319,319,3,NULL,1,'Valle d Aosta',1),
	(320,320,3,NULL,1,'Veneto',1),
	(401,401,4,'',0,'Andalucia',1),
	(402,402,4,'',0,'Aragón',1),
	(403,403,4,'',0,'Castilla y León',1),
	(404,404,4,'',0,'Castilla la Mancha',1),
	(405,405,4,'',0,'Canarias',1),
	(406,406,4,'',0,'Cataluña',1),
	(407,407,4,'',0,'Comunidad de Ceuta',1),
	(408,408,4,'',0,'Comunidad Foral de Navarra',1),
	(409,409,4,'',0,'Comunidad de Melilla',1),
	(410,410,4,'',0,'Cantabria',1),
	(411,411,4,'',0,'Comunidad Valenciana',1),
	(412,412,4,'',0,'Extemadura',1),
	(413,413,4,'',0,'Galicia',1),
	(414,414,4,'',0,'Islas Baleares',1),
	(415,415,4,'',0,'La Rioja',1),
	(416,416,4,'',0,'Comunidad de Madrid',1),
	(417,417,4,'',0,'Región de Murcia',1),
	(418,418,4,'',0,'Principado de Asturias',1),
	(419,419,4,'',0,'Pais Vasco',1),
	(420,420,4,'',0,'Otros',1),
	(501,501,5,'',0,'Deutschland',1),
	(601,601,6,'',1,'Cantons',1),
	(701,701,7,'',0,'England',1),
	(702,702,7,'',0,'Wales',1),
	(703,703,7,'',0,'Scotland',1),
	(704,704,7,'',0,'Northern Ireland',1),
	(1001,1001,10,'',0,'Ariana',1),
	(1002,1002,10,'',0,'Béja',1),
	(1003,1003,10,'',0,'Ben Arous',1),
	(1004,1004,10,'',0,'Bizerte',1),
	(1005,1005,10,'',0,'Gabès',1),
	(1006,1006,10,'',0,'Gafsa',1),
	(1007,1007,10,'',0,'Jendouba',1),
	(1008,1008,10,'',0,'Kairouan',1),
	(1009,1009,10,'',0,'Kasserine',1),
	(1010,1010,10,'',0,'Kébili',1),
	(1011,1011,10,'',0,'La Manouba',1),
	(1012,1012,10,'',0,'Le Kef',1),
	(1013,1013,10,'',0,'Mahdia',1),
	(1014,1014,10,'',0,'Médenine',1),
	(1015,1015,10,'',0,'Monastir',1),
	(1016,1016,10,'',0,'Nabeul',1),
	(1017,1017,10,'',0,'Sfax',1),
	(1018,1018,10,'',0,'Sidi Bouzid',1),
	(1019,1019,10,'',0,'Siliana',1),
	(1020,1020,10,'',0,'Sousse',1),
	(1021,1021,10,'',0,'Tataouine',1),
	(1022,1022,10,'',0,'Tozeur',1),
	(1023,1023,10,'',0,'Tunis',1),
	(1024,1024,10,'',0,'Zaghouan',1),
	(1101,1101,11,'',0,'United-States',1),
	(1201,1201,12,'',0,'Tanger-Tétouan',1),
	(1202,1202,12,'',0,'Gharb-Chrarda-Beni Hssen',1),
	(1203,1203,12,'',0,'Taza-Al Hoceima-Taounate',1),
	(1204,1204,12,'',0,'L\'Oriental',1),
	(1205,1205,12,'',0,'Fès-Boulemane',1),
	(1206,1206,12,'',0,'Meknès-Tafialet',1),
	(1207,1207,12,'',0,'Rabat-Salé-Zemour-Zaër',1),
	(1208,1208,12,'',0,'Grand Cassablanca',1),
	(1209,1209,12,'',0,'Chaouia-Ouardigha',1),
	(1210,1210,12,'',0,'Doukahla-Adba',1),
	(1211,1211,12,'',0,'Marrakech-Tensift-Al Haouz',1),
	(1212,1212,12,'',0,'Tadla-Azilal',1),
	(1213,1213,12,'',0,'Sous-Massa-Drâa',1),
	(1214,1214,12,'',0,'Guelmim-Es Smara',1),
	(1215,1215,12,'',0,'Laâyoune-Boujdour-Sakia el Hamra',1),
	(1216,1216,12,'',0,'Oued Ed-Dahab Lagouira',1),
	(1301,1301,13,'',0,'Algerie',1),
	(1401,1401,14,'',0,'Canada',1),
	(1701,1701,17,'',0,'Provincies van Nederland ',1),
	(2301,2301,23,'',0,'Norte',1),
	(2302,2302,23,'',0,'Litoral',1),
	(2303,2303,23,'',0,'Cuyana',1),
	(2304,2304,23,'',0,'Central',1),
	(2305,2305,23,'',0,'Patagonia',1),
	(2801,2801,28,'',0,'Australia',1),
	(4601,4601,46,'',0,'Barbados',1),
	(5601,5601,56,'',0,'Brasil',1),
	(6701,6701,67,NULL,NULL,'Tarapacá',1),
	(6702,6702,67,NULL,NULL,'Antofagasta',1),
	(6703,6703,67,NULL,NULL,'Atacama',1),
	(6704,6704,67,NULL,NULL,'Coquimbo',1),
	(6705,6705,67,NULL,NULL,'Valparaíso',1),
	(6706,6706,67,NULL,NULL,'General Bernardo O Higgins',1),
	(6707,6707,67,NULL,NULL,'Maule',1),
	(6708,6708,67,NULL,NULL,'Biobío',1),
	(6709,6709,67,NULL,NULL,'Raucanía',1),
	(6710,6710,67,NULL,NULL,'Los Lagos',1),
	(6711,6711,67,NULL,NULL,'Aysén General Carlos Ibáñez del Campo',1),
	(6712,6712,67,NULL,NULL,'Magallanes y Antártica Chilena',1),
	(6713,6713,67,NULL,NULL,'Metropolitana de Santiago',1),
	(6714,6714,67,NULL,NULL,'Los Ríos',1),
	(6715,6715,67,NULL,NULL,'Arica y Parinacota',1),
	(7001,7001,70,'',0,'Colombie',1),
	(8601,8601,86,NULL,NULL,'Central',1),
	(8602,8602,86,NULL,NULL,'Oriental',1),
	(8603,8603,86,NULL,NULL,'Occidental',1),
	(10201,10201,102,NULL,NULL,'Αττική',1),
	(10202,10202,102,NULL,NULL,'Στερεά Ελλάδα',1),
	(10203,10203,102,NULL,NULL,'Κεντρική Μακεδονία',1),
	(10204,10204,102,NULL,NULL,'Κρήτη',1),
	(10205,10205,102,NULL,NULL,'Ανατολική Μακεδονία και Θράκη',1),
	(10206,10206,102,NULL,NULL,'Ήπειρος',1),
	(10207,10207,102,NULL,NULL,'Ιόνια νησιά',1),
	(10208,10208,102,NULL,NULL,'Βόρειο Αιγαίο',1),
	(10209,10209,102,NULL,NULL,'Πελοπόννησος',1),
	(10210,10210,102,NULL,NULL,'Νότιο Αιγαίο',1),
	(10211,10211,102,NULL,NULL,'Δυτική Ελλάδα',1),
	(10212,10212,102,NULL,NULL,'Θεσσαλία',1),
	(10213,10213,102,NULL,NULL,'Δυτική Μακεδονία',1),
	(11401,11401,114,'',0,'Honduras',1),
	(11701,11701,117,'',0,'India',1),
	(15201,15201,152,'',0,'Rivière Noire',1),
	(15202,15202,152,'',0,'Flacq',1),
	(15203,15203,152,'',0,'Grand Port',1),
	(15204,15204,152,'',0,'Moka',1),
	(15205,15205,152,'',0,'Pamplemousses',1),
	(15206,15206,152,'',0,'Plaines Wilhems',1),
	(15207,15207,152,'',0,'Port-Louis',1),
	(15208,15208,152,'',0,'Rivière du Rempart',1),
	(15209,15209,152,'',0,'Savanne',1),
	(15210,15210,152,'',0,'Rodrigues',1),
	(15211,15211,152,'',0,'Les îles Agaléga',1),
	(15212,15212,152,'',0,'Les écueils des Cargados Carajos',1),
	(15401,15401,154,'',0,'Mexique',1),
	(23201,23201,232,'',0,'Los Andes',1),
	(23202,23202,232,'',0,'Capital',1),
	(23203,23203,232,'',0,'Central',1),
	(23204,23204,232,'',0,'Cento Occidental',1),
	(23205,23205,232,'',0,'Guayana',1),
	(23206,23206,232,'',0,'Insular',1),
	(23207,23207,232,'',0,'Los Llanos',1),
	(23208,23208,232,'',0,'Nor-Oriental',1),
	(23209,23209,232,'',0,'Zuliana',1);

/*!40000 ALTER TABLE `llx_c_regions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_revenuestamp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_revenuestamp`;

CREATE TABLE `llx_c_revenuestamp` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pays` int(11) NOT NULL,
  `taux` double NOT NULL,
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `accountancy_code_sell` varchar(15) DEFAULT NULL,
  `accountancy_code_buy` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_revenuestamp` WRITE;
/*!40000 ALTER TABLE `llx_c_revenuestamp` DISABLE KEYS */;

INSERT INTO `llx_c_revenuestamp` (`rowid`, `fk_pays`, `taux`, `note`, `active`, `accountancy_code_sell`, `accountancy_code_buy`)
VALUES
	(101,10,0.4,'Revenue stamp tunisia',1,NULL,NULL);

/*!40000 ALTER TABLE `llx_c_revenuestamp` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_shipment_mode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_shipment_mode`;

CREATE TABLE `llx_c_shipment_mode` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(30) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `description` text,
  `tracking` varchar(255) NOT NULL,
  `active` tinyint(4) DEFAULT '0',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_shipment_mode` WRITE;
/*!40000 ALTER TABLE `llx_c_shipment_mode` DISABLE KEYS */;

INSERT INTO `llx_c_shipment_mode` (`rowid`, `tms`, `code`, `libelle`, `description`, `tracking`, `active`, `module`)
VALUES
	(1,'2015-11-22 17:45:33','CATCH','Catch','Catch by client','',1,NULL),
	(2,'2015-11-22 17:45:33','TRANS','Transporter','Generic transporter','',1,NULL),
	(3,'2015-11-22 17:45:33','COLSUI','Colissimo Suivi','Colissimo Suivi','',0,NULL),
	(4,'2015-11-22 17:45:33','LETTREMAX','Lettre Max','Courrier Suivi et Lettre Max','',0,NULL),
	(5,'2015-11-22 17:45:33','UPS','UPS','United Parcel Service','http://wwwapps.ups.com/etracking/tracking.cgi?InquiryNumber2=&InquiryNumber3=&tracknums_displayed=3&loc=fr_FR&TypeOfInquiryNumber=T&HTMLVersion=4.0&InquiryNumber22=&InquiryNumber32=&track=Track&Suivi.x=64&Suivi.y=7&Suivi=Valider&InquiryNumber1={TRACKID}',0,NULL),
	(6,'2015-11-22 17:45:33','KIALA','KIALA','Relais Kiala','http://www.kiala.fr/tnt/delivery/{TRACKID}',0,NULL),
	(7,'2015-11-22 17:45:33','GLS','GLS','General Logistics Systems','http://www.gls-group.eu/276-I-PORTAL-WEB/content/GLS/FR01/FR/5004.htm?txtAction=71000&txtRefNo={TRACKID}',0,NULL),
	(8,'2015-11-22 17:45:33','CHRONO','Chronopost','Chronopost','http://www.chronopost.fr/expedier/inputLTNumbersNoJahia.do?listeNumeros={TRACKID}',0,NULL);

/*!40000 ALTER TABLE `llx_c_shipment_mode` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_stcomm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_stcomm`;

CREATE TABLE `llx_c_stcomm` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_stcomm` WRITE;
/*!40000 ALTER TABLE `llx_c_stcomm` DISABLE KEYS */;

INSERT INTO `llx_c_stcomm` (`id`, `code`, `libelle`, `active`)
VALUES
	(-1,'ST_NO','Ne pas contacter',1),
	(0,'ST_NEVER','Jamais contacté',1),
	(1,'ST_TODO','A contacter',1),
	(2,'ST_PEND','Contact en cours',1),
	(3,'ST_DONE','Contactée',1);

/*!40000 ALTER TABLE `llx_c_stcomm` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_tva
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_tva`;

CREATE TABLE `llx_c_tva` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pays` int(11) NOT NULL,
  `taux` double NOT NULL,
  `localtax1` double NOT NULL DEFAULT '0',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2` double NOT NULL DEFAULT '0',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `accountancy_code_sell` varchar(15) DEFAULT NULL,
  `accountancy_code_buy` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_tva_id` (`fk_pays`,`taux`,`recuperableonly`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_tva` WRITE;
/*!40000 ALTER TABLE `llx_c_tva` DISABLE KEYS */;

INSERT INTO `llx_c_tva` (`rowid`, `fk_pays`, `taux`, `localtax1`, `localtax1_type`, `localtax2`, `localtax2_type`, `recuperableonly`, `note`, `active`, `accountancy_code_sell`, `accountancy_code_buy`)
VALUES
	(11,1,20,0,'0',0,'0',0,'VAT standard rate (France hors DOM-TOM)',1,NULL,NULL),
	(12,1,8.5,0,'0',0,'0',0,'VAT standard rate (DOM sauf Guyane et Saint-Martin)',0,NULL,NULL),
	(13,1,8.5,0,'0',0,'0',1,'VAT standard rate (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',0,NULL,NULL),
	(14,1,5.5,0,'0',0,'0',0,'VAT reduced rate (France hors DOM-TOM)',1,NULL,NULL),
	(15,1,0,0,'0',0,'0',0,'VAT Rate 0 ou non applicable',1,NULL,NULL),
	(16,1,2.1,0,'0',0,'0',0,'VAT super-reduced rate',1,NULL,NULL),
	(17,1,10,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(21,2,21,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(22,2,6,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(23,2,0,0,'0',0,'0',0,'VAT Rate 0 ou non applicable',1,NULL,NULL),
	(24,2,12,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(31,3,21,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(32,3,10,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(33,3,4,0,'0',0,'0',0,'VAT super-reduced rate',1,NULL,NULL),
	(34,3,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(41,4,21,5.2,'3',-21,'1',0,'VAT standard rate',1,NULL,NULL),
	(42,4,10,1.4,'3',-21,'1',0,'VAT reduced rate',1,NULL,NULL),
	(43,4,4,0.5,'3',-21,'1',0,'VAT super-reduced rate',1,NULL,NULL),
	(44,4,0,0,'3',-21,'1',0,'VAT Rate 0',1,NULL,NULL),
	(51,5,19,0,'0',0,'0',0,'allgemeine Ust.',1,NULL,NULL),
	(52,5,7,0,'0',0,'0',0,'ermäßigte USt.',1,NULL,NULL),
	(53,5,0,0,'0',0,'0',0,'keine USt.',1,NULL,NULL),
	(54,5,5.5,0,'0',0,'0',0,'USt. Forst',0,NULL,NULL),
	(55,5,10.7,0,'0',0,'0',0,'USt. Landwirtschaft',0,NULL,NULL),
	(61,6,8,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(62,6,3.8,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(63,6,2.5,0,'0',0,'0',0,'VAT super-reduced rate',1,NULL,NULL),
	(64,6,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(71,7,20,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(72,7,17.5,0,'0',0,'0',0,'VAT standard rate before 2011',1,NULL,NULL),
	(73,7,5,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(74,7,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(91,9,17,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(92,9,13,0,'0',0,'0',0,'VAT reduced rate 0',1,NULL,NULL),
	(93,9,3,0,'0',0,'0',0,'VAT super reduced rate 0',1,NULL,NULL),
	(94,9,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(101,10,6,1,'4',0,'0',0,'VAT 6%',1,NULL,NULL),
	(102,10,12,1,'4',0,'0',0,'VAT 12%',1,NULL,NULL),
	(103,10,18,1,'4',0,'0',0,'VAT 18%',1,NULL,NULL),
	(104,10,7.5,1,'4',0,'0',0,'VAT 6% Majoré à 25% (7.5%)',1,NULL,NULL),
	(105,10,15,1,'4',0,'0',0,'VAT 12% Majoré à 25% (15%)',1,NULL,NULL),
	(106,10,22.5,1,'4',0,'0',0,'VAT 18% Majoré à 25% (22.5%)',1,NULL,NULL),
	(107,10,0,1,'4',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(111,11,0,0,'0',0,'0',0,'No Sales Tax',1,NULL,NULL),
	(112,11,4,0,'0',0,'0',0,'Sales Tax 4%',1,NULL,NULL),
	(113,11,6,0,'0',0,'0',0,'Sales Tax 6%',1,NULL,NULL),
	(121,12,20,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(122,12,14,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(123,12,10,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(124,12,7,0,'0',0,'0',0,'VAT super-reduced rate',1,NULL,NULL),
	(125,12,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(141,14,7,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(142,14,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(143,14,5,9.975,'1',0,'0',0,'TPS and TVQ rate',1,NULL,NULL),
	(171,17,19,0,'0',0,'0',0,'Algemeen BTW tarief',1,NULL,NULL),
	(172,17,6,0,'0',0,'0',0,'Verlaagd BTW tarief',1,NULL,NULL),
	(173,17,0,0,'0',0,'0',0,'0 BTW tarief',1,NULL,NULL),
	(174,17,21,0,'0',0,'0',0,'Algemeen BTW tarief (vanaf 1 oktober 2012)',0,NULL,NULL),
	(201,20,25,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(202,20,12,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(203,20,6,0,'0',0,'0',0,'VAT super-reduced rate',1,NULL,NULL),
	(204,20,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(231,23,21,0,'0',0,'0',0,'IVA standard rate',1,NULL,NULL),
	(232,23,10.5,0,'0',0,'0',0,'IVA reduced rate',1,NULL,NULL),
	(233,23,0,0,'0',0,'0',0,'IVA Rate 0',1,NULL,NULL),
	(241,24,19.25,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(242,24,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(251,25,23,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(252,25,13,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(253,25,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(254,25,6,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(261,26,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(271,27,19.6,0,'0',0,'0',0,'VAT standard rate (France hors DOM-TOM)',1,NULL,NULL),
	(272,27,8.5,0,'0',0,'0',0,'VAT standard rate (DOM sauf Guyane et Saint-Martin)',0,NULL,NULL),
	(273,27,8.5,0,'0',0,'0',1,'VAT standard rate (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',0,NULL,NULL),
	(274,27,5.5,0,'0',0,'0',0,'VAT reduced rate (France hors DOM-TOM)',0,NULL,NULL),
	(275,27,0,0,'0',0,'0',0,'VAT Rate 0 ou non applicable',1,NULL,NULL),
	(276,27,2.1,0,'0',0,'0',0,'VAT super-reduced rate',1,NULL,NULL),
	(277,27,7,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(281,28,10,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(282,28,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(411,41,20,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(412,41,10,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(413,41,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(461,46,0,0,'0',0,'0',0,'No VAT',1,NULL,NULL),
	(462,46,15,0,'0',0,'0',0,'VAT 15%',1,NULL,NULL),
	(463,46,7.5,0,'0',0,'0',0,'VAT 7.5%',1,NULL,NULL),
	(561,56,0,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(591,59,20,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(592,59,7,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(593,59,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(671,67,19,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(672,67,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(801,80,25,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(802,80,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(861,86,13,0,'0',0,'0',0,'IVA 13',1,NULL,NULL),
	(862,86,0,0,'0',0,'0',0,'SIN IVA',1,NULL,NULL),
	(1141,114,0,0,'0',0,'0',0,'No ISV',1,NULL,NULL),
	(1142,114,12,0,'0',0,'0',0,'ISV 12%',1,NULL,NULL),
	(1161,116,25.5,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(1162,116,7,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(1163,116,0,0,'0',0,'0',0,'VAT rate 0',1,NULL,NULL),
	(1171,117,12.5,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(1172,117,4,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(1173,117,1,0,'0',0,'0',0,'VAT super-reduced rate',1,NULL,NULL),
	(1174,117,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1231,123,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1232,123,5,0,'0',0,'0',0,'VAT Rate 5',1,NULL,NULL),
	(1401,140,15,0,'0',0,'0',0,'VAT standard rate',0,NULL,NULL),
	(1402,140,12,0,'0',0,'0',0,'VAT reduced rate',0,NULL,NULL),
	(1403,140,6,0,'0',0,'0',0,'VAT reduced rate',0,NULL,NULL),
	(1404,140,3,0,'0',0,'0',0,'VAT super-reduced rate',1,NULL,NULL),
	(1405,140,0,0,'0',0,'0',0,'VAT Rate 0',0,NULL,NULL),
	(1511,151,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1512,151,14,0,'0',0,'0',0,'VAT Rate 14',1,NULL,NULL),
	(1521,152,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1522,152,15,0,'0',0,'0',0,'VAT Rate 15',1,NULL,NULL),
	(1541,154,0,0,'0',0,'0',0,'No VAT',1,NULL,NULL),
	(1542,154,16,0,'0',0,'0',0,'VAT 16%',1,NULL,NULL),
	(1543,154,10,0,'0',0,'0',0,'VAT Frontero',1,NULL,NULL),
	(1662,166,15,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(1663,166,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1692,169,5,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(1693,169,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1731,173,25,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(1732,173,14,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(1733,173,8,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(1734,173,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1841,181,18,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(1842,184,7,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(1843,181,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1844,184,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1881,188,24,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(1882,188,9,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(1883,188,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(1884,188,5,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(1931,193,0,0,'0',0,'0',0,'No VAT in SPM',1,NULL,NULL),
	(2011,201,19,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(2012,201,10,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(2013,201,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(2021,202,22,0,'0',0,'0',0,'VAT standard rate',1,NULL,NULL),
	(2022,202,9.5,0,'0',0,'0',0,'VAT reduced rate',1,NULL,NULL),
	(2023,202,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(2051,205,0,0,'0',0,'0',0,'No VAT',1,NULL,NULL),
	(2052,205,14,0,'0',0,'0',0,'VAT 14%',1,NULL,NULL),
	(2261,226,20,0,'0',0,'0',0,'VAT standart rate',1,NULL,NULL),
	(2262,226,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(2321,232,0,0,'0',0,'0',0,'No VAT',1,NULL,NULL),
	(2322,232,12,0,'0',0,'0',0,'VAT 12%',1,NULL,NULL),
	(2323,232,8,0,'0',0,'0',0,'VAT 8%',1,NULL,NULL),
	(2461,246,0,0,'0',0,'0',0,'VAT Rate 0',1,NULL,NULL),
	(2462,102,23,0,'0',0,'0',0,'Κανονικός Φ.Π.Α.',1,NULL,NULL),
	(2463,102,0,0,'0',0,'0',0,'Μηδενικό Φ.Π.Α.',1,NULL,NULL),
	(2464,102,13,0,'0',0,'0',0,'Μειωμένος Φ.Π.Α.',1,NULL,NULL),
	(2465,102,6.5,0,'0',0,'0',0,'Υπερμειωμένος Φ.Π.Α.',1,NULL,NULL),
	(2466,102,16,0,'0',0,'0',0,'Νήσων κανονικός Φ.Π.Α.',1,NULL,NULL),
	(2467,102,9,0,'0',0,'0',0,'Νήσων μειωμένος Φ.Π.Α.',1,NULL,NULL),
	(2468,102,5,0,'0',0,'0',0,'Νήσων υπερμειωμένος Φ.Π.Α.',1,NULL,NULL),
	(2469,140,17,0,'0',0,'0',0,'VAT 17%',1,NULL,NULL);

/*!40000 ALTER TABLE `llx_c_tva` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_type_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_type_contact`;

CREATE TABLE `llx_c_type_contact` (
  `rowid` int(11) NOT NULL,
  `element` varchar(30) NOT NULL,
  `source` varchar(8) NOT NULL DEFAULT 'external',
  `code` varchar(32) NOT NULL,
  `libelle` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_contact_id` (`element`,`source`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_type_contact` WRITE;
/*!40000 ALTER TABLE `llx_c_type_contact` DISABLE KEYS */;

INSERT INTO `llx_c_type_contact` (`rowid`, `element`, `source`, `code`, `libelle`, `active`, `module`)
VALUES
	(10,'contrat','internal','SALESREPSIGN','Commercial signataire du contrat',1,NULL),
	(11,'contrat','internal','SALESREPFOLL','Commercial suivi du contrat',1,NULL),
	(20,'contrat','external','BILLING','Contact client facturation contrat',1,NULL),
	(21,'contrat','external','CUSTOMER','Contact client suivi contrat',1,NULL),
	(22,'contrat','external','SALESREPSIGN','Contact client signataire contrat',1,NULL),
	(31,'propal','internal','SALESREPFOLL','Commercial à l\'origine de la propale',1,NULL),
	(40,'propal','external','BILLING','Contact client facturation propale',1,NULL),
	(41,'propal','external','CUSTOMER','Contact client suivi propale',1,NULL),
	(50,'facture','internal','SALESREPFOLL','Responsable suivi du paiement',1,NULL),
	(60,'facture','external','BILLING','Contact client facturation',1,NULL),
	(61,'facture','external','SHIPPING','Contact client livraison',1,NULL),
	(62,'facture','external','SERVICE','Contact client prestation',1,NULL),
	(70,'invoice_supplier','internal','SALESREPFOLL','Responsable suivi du paiement',1,NULL),
	(71,'invoice_supplier','external','BILLING','Contact fournisseur facturation',1,NULL),
	(72,'invoice_supplier','external','SHIPPING','Contact fournisseur livraison',1,NULL),
	(73,'invoice_supplier','external','SERVICE','Contact fournisseur prestation',1,NULL),
	(80,'agenda','internal','ACTOR','Responsable',1,NULL),
	(81,'agenda','internal','GUEST','Guest',1,NULL),
	(85,'agenda','external','ACTOR','Responsable',1,NULL),
	(86,'agenda','external','GUEST','Guest',1,NULL),
	(91,'commande','internal','SALESREPFOLL','Responsable suivi de la commande',1,NULL),
	(100,'commande','external','BILLING','Contact client facturation commande',1,NULL),
	(101,'commande','external','CUSTOMER','Contact client suivi commande',1,NULL),
	(102,'commande','external','SHIPPING','Contact client livraison commande',1,NULL),
	(120,'fichinter','internal','INTERREPFOLL','Responsable suivi de l\'intervention',1,NULL),
	(121,'fichinter','internal','INTERVENING','Intervenant',1,NULL),
	(130,'fichinter','external','BILLING','Contact client facturation intervention',1,NULL),
	(131,'fichinter','external','CUSTOMER','Contact client suivi de l\'intervention',1,NULL),
	(140,'order_supplier','internal','SALESREPFOLL','Responsable suivi de la commande',1,NULL),
	(141,'order_supplier','internal','SHIPPING','Responsable réception de la commande',1,NULL),
	(142,'order_supplier','external','BILLING','Contact fournisseur facturation commande',1,NULL),
	(143,'order_supplier','external','CUSTOMER','Contact fournisseur suivi commande',1,NULL),
	(145,'order_supplier','external','SHIPPING','Contact fournisseur livraison commande',1,NULL),
	(160,'project','internal','PROJECTLEADER','Chef de Projet',1,NULL),
	(161,'project','internal','PROJECTCONTRIBUTOR','Intervenant',1,NULL),
	(170,'project','external','PROJECTLEADER','Chef de Projet',1,NULL),
	(171,'project','external','PROJECTCONTRIBUTOR','Intervenant',1,NULL),
	(180,'project_task','internal','TASKEXECUTIVE','Responsable',1,NULL),
	(181,'project_task','internal','TASKCONTRIBUTOR','Intervenant',1,NULL),
	(190,'project_task','external','TASKEXECUTIVE','Responsable',1,NULL),
	(191,'project_task','external','TASKCONTRIBUTOR','Intervenant',1,NULL);

/*!40000 ALTER TABLE `llx_c_type_contact` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_type_fees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_type_fees`;

CREATE TABLE `llx_c_type_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_type_fees` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_type_fees` WRITE;
/*!40000 ALTER TABLE `llx_c_type_fees` DISABLE KEYS */;

INSERT INTO `llx_c_type_fees` (`id`, `code`, `libelle`, `active`, `module`)
VALUES
	(1,'TF_OTHER','Other',1,NULL),
	(2,'TF_TRIP','Trip',1,NULL),
	(3,'TF_LUNCH','Lunch',1,NULL);

/*!40000 ALTER TABLE `llx_c_type_fees` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_type_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_type_resource`;

CREATE TABLE `llx_c_type_resource` (
  `rowid` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `label` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_resource_id` (`label`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_c_typent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_typent`;

CREATE TABLE `llx_c_typent` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_typent` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_c_typent` WRITE;
/*!40000 ALTER TABLE `llx_c_typent` DISABLE KEYS */;

INSERT INTO `llx_c_typent` (`id`, `code`, `libelle`, `active`, `module`)
VALUES
	(0,'TE_UNKNOWN','-',1,NULL),
	(1,'TE_STARTUP','Start-up',0,NULL),
	(2,'TE_GROUP','Grand groupe',1,NULL),
	(3,'TE_MEDIUM','PME/PMI',1,NULL),
	(4,'TE_SMALL','TPE',1,NULL),
	(5,'TE_ADMIN','Administration',1,NULL),
	(6,'TE_WHOLE','Grossiste',0,NULL),
	(7,'TE_RETAIL','Revendeur',0,NULL),
	(8,'TE_PRIVATE','Particulier',1,NULL),
	(100,'TE_OTHER','Autres',1,NULL);

/*!40000 ALTER TABLE `llx_c_typent` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_c_ziptown
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_c_ziptown`;

CREATE TABLE `llx_c_ziptown` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  `fk_county` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT '0',
  `zip` varchar(10) NOT NULL,
  `town` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ziptown_fk_pays` (`zip`,`town`,`fk_pays`),
  KEY `idx_c_ziptown_fk_county` (`fk_county`),
  KEY `idx_c_ziptown_fk_pays` (`fk_pays`),
  KEY `idx_c_ziptown_zip` (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_cancel_reason
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_cancel_reason`;

CREATE TABLE `llx_cancel_reason` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_cancel_reason` WRITE;
/*!40000 ALTER TABLE `llx_cancel_reason` DISABLE KEYS */;

INSERT INTO `llx_cancel_reason` (`rowid`, `label`, `description`)
VALUES
	(1,'Bender','This is Bender'),
	(2,'tempora','Porro ut velit soluta explicabo.'),
	(3,'eligendi','Debitis et saepe eum sint dolorem delectus.'),
	(4,'enim','Inventore sed libero et velit.'),
	(5,'qui','A deserunt laudantium quibusdam enim nostrum.'),
	(6,'soluta','Ipsam non ipsum velit reiciendis.'),
	(7,'aperiam','Fuga doloribus nisi placeat cumque.'),
	(8,'est','Temporibus modi saepe architecto unde non.'),
	(9,'dicta','Exercitationem aut porro sed magni cupiditate sit vitae.'),
	(10,'voluptas','Non voluptates ut optio quos qui illo error nihil.');

/*!40000 ALTER TABLE `llx_cancel_reason` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_categorie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_categorie`;

CREATE TABLE `llx_categorie` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_parent` int(11) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text,
  `external_id` varchar(20) DEFAULT NULL,
  `sort` int(4) NOT NULL DEFAULT '1',
  `is_default` tinyint(4) DEFAULT '0',
  `picture` varchar(255) DEFAULT NULL,
  `datec` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `product_limit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `slug` varchar(255) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_categorie_ref` (`entity`,`fk_parent`,`label`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `idx_categorie_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_categorie` WRITE;
/*!40000 ALTER TABLE `llx_categorie` DISABLE KEYS */;

INSERT INTO `llx_categorie` (`rowid`, `uuid`, `entity`, `fk_parent`, `label`, `description`, `external_id`, `sort`, `is_default`, `picture`, `datec`, `tms`, `visible`, `product_limit`, `import_key`, `type`, `slug`, `fk_soc`)
VALUES
	(1,'762c2b54-01a4-40bb-ba46-89f8726e228a',1,NULL,'ad','Quidem eum rerum voluptates laboriosam ea porro.',NULL,1,1,'http://lorempixel.com/640/480/?51180','2017-08-11 17:40:47','2017-08-11 17:40:47',1,NULL,NULL,1,'',NULL),
	(2,'d199cbcd-29ad-4bf1-8d19-b3e17c92e3f9',2,1,'eos','Non aut quas sunt eligendi sapiente.',NULL,2,0,'http://lorempixel.com/640/480/?66521','2017-08-11 17:40:47','2017-08-11 17:40:47',1,NULL,NULL,1,'',NULL),
	(3,'b55d7753-41e9-4c72-b72c-33c6d5b57fb2',3,1,'et','Recusandae voluptatem veniam enim quae voluptas assumenda.',NULL,3,0,'http://lorempixel.com/640/480/?32175','2017-08-11 17:40:47','2017-08-11 17:40:47',1,NULL,NULL,1,'',NULL),
	(4,'572389d9-1fb2-49dc-9c10-cf8c2ff620d8',4,1,'explicabo','A aut architecto et aut beatae.',NULL,4,0,'http://lorempixel.com/640/480/?69938','2017-08-11 17:40:47','2017-08-11 17:40:47',1,NULL,NULL,1,'',NULL),
	(5,'6db7b447-efa6-4aa2-9d81-83831ab3f9f1',5,1,'cum','Doloremque autem aut qui perferendis praesentium cupiditate.',NULL,5,0,'http://lorempixel.com/640/480/?60017','2017-08-11 17:40:47','2017-08-11 17:40:47',1,NULL,NULL,1,'',NULL);

/*!40000 ALTER TABLE `llx_categorie` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_categorie_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_categorie_contact`;

CREATE TABLE `llx_categorie_contact` (
  `fk_categorie` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `display_sort` int(11) DEFAULT '0',
  PRIMARY KEY (`fk_categorie`,`fk_socpeople`),
  KEY `idx_categorie_contact_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_contact_fk_socpeople` (`fk_socpeople`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_categorie_fournisseur
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_categorie_fournisseur`;

CREATE TABLE `llx_categorie_fournisseur` (
  `fk_categorie` int(11) NOT NULL,
  `fk_societe` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `display_sort` int(11) DEFAULT '0',
  PRIMARY KEY (`fk_categorie`,`fk_societe`),
  KEY `idx_categorie_fournisseur_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_fournisseur_fk_societe` (`fk_societe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_categorie_lang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_categorie_lang`;

CREATE TABLE `llx_categorie_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_category` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_category_lang` (`fk_category`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_categorie_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_categorie_member`;

CREATE TABLE `llx_categorie_member` (
  `fk_categorie` int(11) NOT NULL,
  `fk_member` int(11) NOT NULL,
  `display_sort` int(11) DEFAULT '0',
  PRIMARY KEY (`fk_categorie`,`fk_member`),
  KEY `idx_categorie_member_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_member_fk_member` (`fk_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_categorie_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_categorie_product`;

CREATE TABLE `llx_categorie_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_categorie` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `display_sort` int(11) DEFAULT '0',
  `entity` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `idx_categorie_product_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_product_fk_product` (`fk_product`),
  KEY `rowid` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_categorie_product` WRITE;
/*!40000 ALTER TABLE `llx_categorie_product` DISABLE KEYS */;

INSERT INTO `llx_categorie_product` (`rowid`, `fk_categorie`, `fk_product`, `import_key`, `display_sort`, `entity`)
VALUES
	(1,1,1,NULL,NULL,4),
	(2,2,2,NULL,NULL,4),
	(3,3,3,NULL,NULL,4),
	(4,4,4,NULL,NULL,3),
	(5,5,5,NULL,NULL,3),
	(6,5,6,NULL,NULL,2),
	(7,5,6,NULL,NULL,2),
	(8,5,6,NULL,NULL,2),
	(9,5,6,NULL,NULL,1),
	(10,5,6,NULL,NULL,5);

/*!40000 ALTER TABLE `llx_categorie_product` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_categorie_societe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_categorie_societe`;

CREATE TABLE `llx_categorie_societe` (
  `fk_categorie` int(11) NOT NULL,
  `fk_societe` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `display_sort` int(11) DEFAULT '0',
  PRIMARY KEY (`fk_categorie`,`fk_societe`),
  KEY `idx_categorie_societe_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_societe_fk_societe` (`fk_societe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_categories_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_categories_extrafields`;

CREATE TABLE `llx_categories_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `position` int(2) NOT NULL DEFAULT '1',
  `width` int(1) NOT NULL DEFAULT '1',
  `height` int(1) NOT NULL DEFAULT '1',
  `default` int(1) NOT NULL DEFAULT '0',
  `color` varchar(7) DEFAULT '#999',
  PRIMARY KEY (`rowid`),
  KEY `idx_categories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_catering_badge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_badge`;

CREATE TABLE `llx_catering_badge` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `badge_number` varchar(50) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `activation_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `customer_id` int(9) DEFAULT NULL,
  `is_refund` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `badge_customer_rowid_fk` (`customer_id`),
  CONSTRAINT `badge_customer_rowid_fk` FOREIGN KEY (`customer_id`) REFERENCES `llx_wynd_customers` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_catering_company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_company`;

CREATE TABLE `llx_catering_company` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `label` varchar(30) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_catering_payment_mode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_payment_mode`;

CREATE TABLE `llx_catering_payment_mode` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `label` varchar(30) NOT NULL,
  `requires_max_overdraft` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_catering_period
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_period`;

CREATE TABLE `llx_catering_period` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `label` varchar(30) NOT NULL,
  `hour_start` time DEFAULT NULL,
  `hour_end` time DEFAULT NULL,
  `weekdays` longtext COMMENT '(DC2Type:array)',
  `entity_id` int(9) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_catering_pricing_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_pricing_rule`;

CREATE TABLE `llx_catering_pricing_rule` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `label` varchar(30) NOT NULL,
  `max_uses` int(11) NOT NULL,
  `days_before_reset` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `automatic` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `entity_id` int(9) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `pricing_rule_entity_rowid_fk` (`entity_id`),
  CONSTRAINT `pricing_rule_entity_rowid_fk` FOREIGN KEY (`entity_id`) REFERENCES `llx_entity` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_catering_pricing_rule_cohort
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_pricing_rule_cohort`;

CREATE TABLE `llx_catering_pricing_rule_cohort` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `cohort_id` int(11) NOT NULL,
  `pricing_rule_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `pricing_rule_cohort_cohort_rowid_fk` (`cohort_id`),
  KEY `pricing_rule_cohort_pricing_rule_rowid_fk` (`pricing_rule_id`),
  CONSTRAINT `pricing_rule_cohort_cohort_rowid_fk` FOREIGN KEY (`cohort_id`) REFERENCES `llx_wynd_cohort` (`id`),
  CONSTRAINT `pricing_rule_cohort_pricing_rule_rowid_fk` FOREIGN KEY (`pricing_rule_id`) REFERENCES `llx_catering_pricing_rule` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_catering_pricing_rule_company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_pricing_rule_company`;

CREATE TABLE `llx_catering_pricing_rule_company` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `pricing_rule_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `pricing_rule_company_company_rowid_fk` (`company_id`),
  KEY `pricing_rule_company_pricing_rule_rowid_fk` (`pricing_rule_id`),
  CONSTRAINT `pricing_rule_company_company_rowid_fk` FOREIGN KEY (`company_id`) REFERENCES `llx_catering_company` (`rowid`),
  CONSTRAINT `pricing_rule_company_pricing_rule_rowid_fk` FOREIGN KEY (`pricing_rule_id`) REFERENCES `llx_catering_pricing_rule` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_catering_pricing_rule_division
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_pricing_rule_division`;

CREATE TABLE `llx_catering_pricing_rule_division` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `division_id` int(11) NOT NULL,
  `pricing_rule_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `pricing_rule_division_division_rowid_fk` (`division_id`),
  KEY `pricing_rule_division_pricing_rule_rowid_fk` (`pricing_rule_id`),
  CONSTRAINT `pricing_rule_division_division_rowid_fk` FOREIGN KEY (`division_id`) REFERENCES `llx_wynd_pos_divisions` (`rowid`),
  CONSTRAINT `pricing_rule_division_pricing_rule_rowid_fk` FOREIGN KEY (`pricing_rule_id`) REFERENCES `llx_catering_pricing_rule` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_catering_pricing_rule_period
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_pricing_rule_period`;

CREATE TABLE `llx_catering_pricing_rule_period` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `pricing_rule_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `pricing_rule_period_period_rowid_fk` (`period_id`),
  KEY `pricing_rule_period_pricing_rule_rowid_fk` (`pricing_rule_id`),
  CONSTRAINT `pricing_rule_period_period_rowid_fk` FOREIGN KEY (`period_id`) REFERENCES `llx_catering_period` (`rowid`),
  CONSTRAINT `pricing_rule_period_pricing_rule_rowid_fk` FOREIGN KEY (`pricing_rule_id`) REFERENCES `llx_catering_pricing_rule` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_catering_tariff_component
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_catering_tariff_component`;

CREATE TABLE `llx_catering_tariff_component` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `label` varchar(30) NOT NULL,
  `type` enum('PERCENT','AMOUNT','URSAFF') NOT NULL,
  `value` double(24,8) NOT NULL,
  `vat_rate` double(24,8) NOT NULL,
  `included_in_sales` tinyint(4) NOT NULL,
  `included_on_ticket` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `pricing_rule_id` int(9) DEFAULT NULL,
  `component_type` enum('subsidy','admission','collected_for_account','urssaf') NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `tariff_component_pricing_rule_rowid_fk` (`pricing_rule_id`),
  CONSTRAINT `tariff_component_pricing_rule_rowid_fk` FOREIGN KEY (`pricing_rule_id`) REFERENCES `llx_catering_pricing_rule` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_chargesociales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_chargesociales`;

CREATE TABLE `llx_chargesociales` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_ech` datetime NOT NULL,
  `libelle` varchar(80) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `paye` smallint(6) NOT NULL DEFAULT '0',
  `periode` date DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_commande
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commande`;

CREATE TABLE `llx_commande` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_customer` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `source` smallint(6) DEFAULT NULL,
  `fk_statut` varchar(30) NOT NULL DEFAULT 'STATUS_OPEN_PENDING',
  `amount_ht` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `facture` tinyint(4) DEFAULT '0',
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_cancel_reason` int(9) DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `order_dest` int(9) DEFAULT NULL,
  `origin` int(9) DEFAULT NULL,
  `attributes` longtext COMMENT '(DC2Type:array)',
  `order_start` datetime DEFAULT NULL,
  `order_end` datetime DEFAULT NULL,
  `pricing_rule_id` int(9) DEFAULT NULL,
  `badge_id` int(9) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_ref` (`ref`,`entity`),
  KEY `idx_commande_fk_soc` (`fk_customer`),
  KEY `idx_commande_fk_user_author` (`fk_user_author`),
  KEY `idx_commande_fk_user_valid` (`fk_user_valid`),
  KEY `idx_commande_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_commande_fk_projet` (`fk_projet`),
  KEY `idx_commande_fk_account` (`fk_account`),
  KEY `idx_commande_fk_currency` (`fk_currency`),
  KEY `llx_commande_llx_cancel_reason_rowid_fk` (`fk_cancel_reason`),
  KEY `llx_commande_order_dest_fk` (`order_dest`),
  KEY `llx_commande_origin_fk` (`origin`),
  KEY `commande_pricing_rule_rowid_fk` (`pricing_rule_id`),
  KEY `commande_badge_rowid_fk` (`badge_id`),
  CONSTRAINT `commande_badge_rowid_fk` FOREIGN KEY (`badge_id`) REFERENCES `llx_catering_badge` (`rowid`),
  CONSTRAINT `commande_pricing_rule_rowid_fk` FOREIGN KEY (`pricing_rule_id`) REFERENCES `llx_catering_pricing_rule` (`rowid`),
  CONSTRAINT `llx_commande_llx_cancel_reason_rowid_fk` FOREIGN KEY (`fk_cancel_reason`) REFERENCES `llx_cancel_reason` (`rowid`),
  CONSTRAINT `llx_commande_order_dest_fk` FOREIGN KEY (`order_dest`) REFERENCES `llx_wynd_destination` (`rowid`),
  CONSTRAINT `llx_commande_origin_fk` FOREIGN KEY (`origin`) REFERENCES `llx_wynd_channel` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_commande` WRITE;
/*!40000 ALTER TABLE `llx_commande` DISABLE KEYS */;

INSERT INTO `llx_commande` (`rowid`, `ref`, `entity`, `ref_ext`, `ref_int`, `ref_client`, `fk_customer`, `fk_projet`, `tms`, `date_creation`, `date_valid`, `date_cloture`, `date_commande`, `fk_user_author`, `fk_user_valid`, `fk_user_cloture`, `source`, `fk_statut`, `amount_ht`, `remise_percent`, `remise_absolue`, `remise`, `tva`, `localtax1`, `localtax2`, `total_ht`, `total_ttc`, `note_private`, `note_public`, `model_pdf`, `facture`, `fk_account`, `fk_currency`, `fk_cond_reglement`, `fk_mode_reglement`, `date_livraison`, `fk_availability`, `fk_input_reason`, `fk_delivery_address`, `import_key`, `extraparams`, `fk_cancel_reason`, `uuid`, `order_dest`, `origin`, `attributes`, `order_start`, `order_end`, `pricing_rule_id`, `badge_id`, `due_date`)
VALUES
	(1,'1-0000000001',2,NULL,NULL,'1-0000001',1,NULL,'2017-08-11 15:40:54','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,51239.00000000,NULL,NULL,NULL,0,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'0701771c-acdf-4a85-894b-0d1cd830abfb',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-07-21 12:34:13',NULL,NULL,NULL,NULL),
	(2,'1-0000000002',2,NULL,NULL,'1-0000002',1,NULL,'2017-08-11 15:40:56','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,14671.00000000,NULL,NULL,NULL,0,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'b397a5a8-e153-4a5b-a234-a992c7b111d1',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-07-25 06:07:16',NULL,NULL,NULL,NULL),
	(3,'1-0000000003',2,NULL,NULL,'1-0000003',1,NULL,'2017-08-11 15:40:56','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,86862.00000000,NULL,NULL,NULL,0,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'ce1e7e54-6f74-4932-9f14-3533606d12bf',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-07-27 13:53:25',NULL,NULL,NULL,NULL),
	(4,'1-0000000004',2,NULL,NULL,'1-0000004',1,NULL,'2017-08-11 15:40:56','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,166739.00000000,NULL,NULL,NULL,0,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'605fc298-7d94-4246-8959-ed548367bcae',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-07-23 03:04:03',NULL,NULL,NULL,NULL),
	(5,'1-0000000005',2,NULL,NULL,'1-0000005',1,NULL,'2017-08-11 15:40:56','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,169924.00000000,NULL,NULL,NULL,0,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'cc271760-ee02-4a20-8b1b-ef717d4d5d96',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-08-08 05:31:32',NULL,NULL,NULL,NULL),
	(6,'1-0000000006',2,NULL,NULL,'1-0000006',1,NULL,'2017-08-11 15:40:56','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,8077.00000000,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,'0bee154f-5c31-46c4-a645-bf08ee5e7719',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-08-04 09:32:46',NULL,NULL,NULL,NULL),
	(7,'1-0000000007',2,NULL,NULL,'1-0000007',1,NULL,'2017-08-11 15:40:56','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,123071.00000000,NULL,NULL,NULL,0,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,'e9386ca0-18a4-4903-ae13-f062118102c1',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-07-31 23:08:04',NULL,NULL,NULL,NULL),
	(8,'1-0000000008',2,NULL,NULL,'1-0000008',1,NULL,'2017-08-11 15:40:56','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,62743.00000000,NULL,NULL,NULL,0,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,'04534354-85e3-4817-9c37-43f10291dbec',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-07-11 20:46:44',NULL,NULL,NULL,NULL),
	(9,'1-0000000009',2,NULL,NULL,'1-0000009',1,NULL,'2017-08-11 15:40:57','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,90178.00000000,NULL,NULL,NULL,0,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,'f95f85bd-ffa7-499d-9ea3-32300d7db88f',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-08-10 05:35:30',NULL,NULL,NULL,NULL),
	(10,'1-0000000010',2,NULL,NULL,'1-00000010',1,NULL,'2017-08-11 15:40:57','2017-08-11 17:40:54',NULL,NULL,NULL,1,NULL,NULL,NULL,'STATUS_OPEN_PENDING',NULL,0,0,0,NULL,0.00000000,0.00000000,NULL,141594.00000000,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,'c85d905d-6443-44f6-b938-15077311276e',1,1,'a:3:{i:0;a:1:{s:5:\"timer\";i:70;}i:1;a:1:{s:13:\"delivery_time\";s:19:\"2016-12-30 17:30:00\";}i:2;a:1:{s:16:\"has_substitution\";b:0;}}','2017-08-09 18:15:49',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `llx_commande` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_commande_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commande_address`;

CREATE TABLE `llx_commande_address` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `address_inline` varchar(255) DEFAULT NULL,
  `comment` text,
  `digicode` varchar(25) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `extra_phone` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `street_number` varchar(25) DEFAULT NULL,
  `street_name` varchar(25) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `floor` varchar(50) DEFAULT NULL,
  `door` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_unique_address` (`fk_commande`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



# Affichage de la table llx_commande_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commande_extrafields`;

CREATE TABLE `llx_commande_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `order_dest` text,
  `original_json_order` text,
  `dthr_delivery` datetime DEFAULT NULL,
  `ord_sync` int(1) DEFAULT NULL,
  `biper_num` varchar(10) DEFAULT NULL,
  `sms_send` int(1) DEFAULT NULL,
  `customer_on_site` int(1) DEFAULT NULL,
  `review_send` int(1) DEFAULT NULL,
  `order_ack` int(11) DEFAULT '0',
  `order_ack_macadress` varchar(255) DEFAULT NULL,
  `wynd_offers` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `order_start` datetime DEFAULT NULL,
  `order_end` varchar(255) DEFAULT NULL,
  `export_json` text,
  `exported_to_central` int(1) DEFAULT '0',
  `external_export` int(1) DEFAULT NULL,
  `has_substitution` tinyint(1) DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_commande_fournisseur
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commande_fournisseur`;

CREATE TABLE `llx_commande_fournisseur` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(30) DEFAULT NULL,
  `ref_supplier` varchar(30) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT '0',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `source` smallint(6) NOT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `amount_ht` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `fk_input_method` int(11) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_fournisseur_ref` (`ref`,`fk_soc`,`entity`),
  KEY `idx_commande_fournisseur_fk_soc` (`fk_soc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_commande_fournisseur_dispatch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commande_fournisseur_dispatch`;

CREATE TABLE `llx_commande_fournisseur_dispatch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_dispatch_fk_commande` (`fk_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_commande_fournisseur_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commande_fournisseur_extrafields`;

CREATE TABLE `llx_commande_fournisseur_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_commande_fournisseur_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commande_fournisseur_log`;

CREATE TABLE `llx_commande_fournisseur_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datelog` datetime NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_statut` smallint(6) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_commande_fournisseurdet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commande_fournisseurdet`;

CREATE TABLE `llx_commande_fournisseurdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `tva_tx` double(6,3) DEFAULT '0.000',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_commandedet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commandedet`;

CREATE TABLE `llx_commandedet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(10) unsigned DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `discount_code` varchar(50) DEFAULT NULL,
  `discount_label` varchar(100) DEFAULT NULL,
  `payable` int(1) DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `price_ttc` double DEFAULT NULL,
  `price_tva` varchar(20) DEFAULT '0',
  `comments` longtext COMMENT '(DC2Type:array)',
  `fk_discount_order` int(9) DEFAULT NULL,
  `is_tariff_component` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_fk_commande` (`fk_commande`),
  KEY `idx_commandedet_fk_product` (`fk_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_commandedet` WRITE;
/*!40000 ALTER TABLE `llx_commandedet` DISABLE KEYS */;

INSERT INTO `llx_commandedet` (`rowid`, `fk_commande`, `fk_parent_line`, `fk_product`, `label`, `description`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `qty`, `remise_percent`, `remise`, `fk_remise_except`, `price`, `subprice`, `total_ht`, `total_tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `date_start`, `date_end`, `info_bits`, `buy_price_ht`, `fk_product_fournisseur_price`, `special_code`, `rang`, `import_key`, `discount_id`, `discount_code`, `discount_label`, `payable`, `uuid`, `price_ttc`, `price_tva`, `comments`, `fk_discount_order`, `is_tariff_component`)
VALUES
	(1,10,NULL,5,NULL,NULL,5.500,0.000,NULL,0.000,NULL,7,0,0,NULL,7608.5308056872,NULL,53259.71563981,2929.28436019,0.00000000,0.00000000,56189.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'253eeb45-5e62-4272-9571-de818a865406',8027,'418.4691943128','N;',NULL,0),
	(2,10,NULL,9,NULL,NULL,10.000,0.000,NULL,0.000,NULL,2,0,0,NULL,2184.5454545455,NULL,4369.09090909,436.90909091,0.00000000,0.00000000,4806.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'6e87bf2f-7ca0-4623-972e-0d5f5e64391a',2403,'218.45454545455','N;',NULL,0),
	(3,10,NULL,7,NULL,NULL,5.500,0.000,NULL,0.000,NULL,4,0,0,NULL,7418.009478673,NULL,29672.03791469,1631.96208531,0.00000000,0.00000000,31304.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'a8beb560-d192-4044-8a47-1482b053fde2',7826,'407.99052132701','N;',NULL,0),
	(4,7,NULL,5,NULL,NULL,5.500,0.000,NULL,0.000,NULL,9,0,0,NULL,6948.8151658768,NULL,62539.33649289,3439.66350711,0.00000000,0.00000000,65979.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'327ff226-2dc2-4db6-b68d-5a612e4523dc',7331,'382.18483412322','N;',NULL,0),
	(5,1,NULL,5,NULL,NULL,20.000,0.000,NULL,0.000,NULL,8,0,0,NULL,7710.8333333333,NULL,61686.66666667,12337.33333333,0.00000000,0.00000000,74024.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'b6f8993e-7f8e-452f-8e8d-535cbca6153a',9253,'1542.1666666667','N;',NULL,0),
	(6,8,NULL,4,NULL,NULL,20.000,0.000,NULL,0.000,NULL,10,0,0,NULL,13867.5,NULL,138675.00000000,27735.00000000,0.00000000,0.00000000,166410.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'f8508148-96cb-4514-868e-f92de4dc19b7',16641,'2773.5','N;',NULL,0),
	(7,1,NULL,10,NULL,NULL,5.500,0.000,NULL,0.000,NULL,3,0,0,NULL,4753.5545023697,NULL,14260.66350711,784.33649289,0.00000000,0.00000000,15045.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'3842f6e6-96ca-484c-8cfa-12795dc04dfd',5015,'261.44549763033','N;',NULL,0),
	(8,10,NULL,4,NULL,NULL,10.000,0.000,NULL,0.000,NULL,10,0,0,NULL,16930,NULL,169300.00000000,16930.00000000,0.00000000,0.00000000,186230.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'d9de3607-63d3-40b5-865c-fc3e3088b82a',18623,'1693','N;',NULL,0),
	(9,1,NULL,1,NULL,NULL,20.000,0.000,NULL,0.000,NULL,3,0,0,NULL,12346.666666667,NULL,37040.00000000,7408.00000000,0.00000000,0.00000000,44448.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2d05cb1d-1d46-4fd8-8d61-8cab424b21b0',14816,'2469.3333333333','N;',NULL,0),
	(10,2,NULL,4,NULL,NULL,10.000,0.000,NULL,0.000,NULL,9,0,0,NULL,13180.909090909,NULL,118628.18181818,11862.81818182,0.00000000,0.00000000,130491.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'70fba5ac-4657-4b06-8c30-3c72cf620632',14499,'1318.0909090909','N;',NULL,0),
	(11,4,NULL,1,NULL,NULL,10.000,0.000,NULL,0.000,NULL,6,0,0,NULL,10931.818181818,NULL,65590.90909091,6559.09090909,0.00000000,0.00000000,72150.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'9d265e28-85f6-4270-a1b4-62cf5a03419a',12025,'1093.1818181818','N;',NULL,0),
	(12,8,NULL,6,NULL,NULL,20.000,0.000,NULL,0.000,NULL,10,0,0,NULL,10465,NULL,104650.00000000,20930.00000000,0.00000000,0.00000000,125580.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'117dd2ed-f5ad-45b8-a48f-3d55766a6396',12558,'2093','N;',NULL,0),
	(13,6,NULL,2,NULL,NULL,5.500,0.000,NULL,0.000,NULL,8,0,0,NULL,12098.578199052,NULL,96788.62559242,5323.37440758,0.00000000,0.00000000,102112.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'9b94930b-9aa4-48ae-94e6-06ea43e25cac',12764,'665.42180094787','N;',NULL,0),
	(14,8,NULL,3,NULL,NULL,10.000,0.000,NULL,0.000,NULL,5,0,0,NULL,6490.9090909091,NULL,32454.54545455,3245.45454545,0.00000000,0.00000000,35700.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'a794efa3-23e9-4d6a-89b7-73ce36e9aae7',7140,'649.09090909091','N;',NULL,0),
	(15,7,NULL,9,NULL,NULL,10.000,0.000,NULL,0.000,NULL,5,0,0,NULL,4578.1818181818,NULL,22890.90909091,2289.09090909,0.00000000,0.00000000,25180.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'000ca365-575a-4abe-b92f-c2c7f628a171',5036,'457.81818181818','N;',NULL,0),
	(16,7,NULL,4,NULL,NULL,5.500,0.000,NULL,0.000,NULL,10,0,0,NULL,14651.184834123,NULL,146511.84834123,8058.15165877,0.00000000,0.00000000,154570.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'5fee7a9d-472b-4a43-8bd2-f7865790a9c4',15457,'805.81516587678','N;',NULL,0),
	(17,1,NULL,7,NULL,NULL,5.500,0.000,NULL,0.000,NULL,3,0,0,NULL,5111.8483412322,NULL,15335.54502370,843.45497630,0.00000000,0.00000000,16179.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'5c383e2c-973c-4a3a-a387-f7fe603a3622',5393,'281.15165876777','N;',NULL,0),
	(18,2,NULL,2,NULL,NULL,5.500,0.000,NULL,0.000,NULL,5,0,0,NULL,5667.2985781991,NULL,28336.49289099,1558.50710900,0.00000000,0.00000000,29895.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'099dbf7f-703c-4d6c-aacc-d75ce34ed748',5979,'311.70142180095','N;',NULL,0),
	(19,6,NULL,4,NULL,NULL,10.000,0.000,NULL,0.000,NULL,10,0,0,NULL,17055.454545455,NULL,170554.54545455,17055.45454545,0.00000000,0.00000000,187610.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'752c8be2-c9bc-4bc1-a1d6-bc3f886e97c2',18761,'1705.5454545455','N;',NULL,0),
	(20,10,NULL,3,NULL,NULL,5.500,0.000,NULL,0.000,NULL,10,0,0,NULL,6042.654028436,NULL,60426.54028436,3323.45971564,0.00000000,0.00000000,63750.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'1ef64683-7efa-40ce-a8bf-5c1183a231dc',6375,'332.34597156398','N;',NULL,0),
	(21,2,NULL,4,NULL,NULL,10.000,0.000,NULL,0.000,NULL,3,0,0,NULL,6043.6363636364,NULL,18130.90909091,1813.09090909,0.00000000,0.00000000,19944.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'7e96c26d-4bee-4c13-9032-ff530d85ccd0',6648,'604.36363636364','N;',NULL,0),
	(22,8,NULL,6,NULL,NULL,10.000,0.000,NULL,0.000,NULL,9,0,0,NULL,5287.2727272727,NULL,47585.45454546,4758.54545455,0.00000000,0.00000000,52344.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'5d05f019-6860-424f-acc6-b4fc44e247e7',5816,'528.72727272727','N;',NULL,0),
	(23,2,NULL,3,NULL,NULL,10.000,0.000,NULL,0.000,NULL,4,0,0,NULL,7260,NULL,29040.00000000,2904.00000000,0.00000000,0.00000000,31944.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'c6f3ee22-642c-4fbc-92ee-70f4eb5d6e6e',7986,'726','N;',NULL,0),
	(24,8,NULL,5,NULL,NULL,20.000,0.000,NULL,0.000,NULL,1,0,0,NULL,653.33333333333,NULL,653.33333333,130.66666667,0.00000000,0.00000000,784.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'007f1414-3948-40ca-a8f6-1105a54cd665',784,'130.66666666667','N;',NULL,0),
	(25,6,NULL,1,NULL,NULL,10.000,0.000,NULL,0.000,NULL,8,0,0,NULL,901.81818181818,NULL,7214.54545455,721.45454545,0.00000000,0.00000000,7936.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'d834ac12-5a6b-4403-9db5-c5fce94e2bd6',992,'90.181818181818','N;',NULL,0),
	(26,9,NULL,2,NULL,NULL,20.000,0.000,NULL,0.000,NULL,4,0,0,NULL,6715.8333333333,NULL,26863.33333333,5372.66666667,0.00000000,0.00000000,32236.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'3bcaedbc-ae1d-4bec-b0f3-03e40145a725',8059,'1343.1666666667','N;',NULL,0),
	(27,4,NULL,10,NULL,NULL,20.000,0.000,NULL,0.000,NULL,9,0,0,NULL,13763.333333333,NULL,123870.00000000,24774.00000000,0.00000000,0.00000000,148644.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'94deb341-8724-44f3-9eec-515d477f01e8',16516,'2752.6666666667','N;',NULL,0),
	(28,8,NULL,3,NULL,NULL,10.000,0.000,NULL,0.000,NULL,8,0,0,NULL,7294.5454545455,NULL,58356.36363636,5835.63636364,0.00000000,0.00000000,64192.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'f7a49607-3ef0-479a-8d91-82b5f1e88926',8024,'729.45454545455','N;',NULL,0),
	(29,1,NULL,9,NULL,NULL,20.000,0.000,NULL,0.000,NULL,2,0,0,NULL,10074.166666667,NULL,20148.33333333,4029.66666667,0.00000000,0.00000000,24178.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'5886a9f9-53cb-419d-ad83-523f16e0bf8a',12089,'2014.8333333333','N;',NULL,0),
	(30,2,NULL,7,NULL,NULL,20.000,0.000,NULL,0.000,NULL,7,0,0,NULL,6186.6666666667,NULL,43306.66666667,8661.33333333,0.00000000,0.00000000,51968.00000000,0,NULL,NULL,0,0.00000000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'0a134d2d-edab-4755-90d0-9c41cde186ce',7424,'1237.3333333333','N;',NULL,0);

/*!40000 ALTER TABLE `llx_commandedet` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_commandedet_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_commandedet_extrafields`;

CREATE TABLE `llx_commandedet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_compta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_compta`;

CREATE TABLE `llx_compta` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `fk_compta_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `valid` tinyint(4) DEFAULT '0',
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_compta_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_compta_account`;

CREATE TABLE `llx_compta_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `number` varchar(12) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_compta_compte_generaux
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_compta_compte_generaux`;

CREATE TABLE `llx_compta_compte_generaux` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `intitule` varchar(255) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_condition_cohorts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_condition_cohorts`;

CREATE TABLE `llx_condition_cohorts` (
  `rowid` int(9) NOT NULL AUTO_INCREMENT,
  `condition_id` int(9) NOT NULL,
  `cohort_id` int(9) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_cohort_id` (`cohort_id`),
  KEY `fk_condition_id` (`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_condition_dest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_condition_dest`;

CREATE TABLE `llx_condition_dest` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `condition_id` int(9) NOT NULL,
  `dest_id` int(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `llx_condition_dest_llx_condition_price_id_fk` (`condition_id`),
  KEY `llx_condition_dest_llx_wynd_destination_rowid_fk` (`dest_id`),
  CONSTRAINT `llx_condition_dest_llx_condition_price_id_fk` FOREIGN KEY (`condition_id`) REFERENCES `llx_condition_price` (`id`),
  CONSTRAINT `llx_condition_dest_llx_wynd_destination_rowid_fk` FOREIGN KEY (`dest_id`) REFERENCES `llx_wynd_destination` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_condition_dest` WRITE;
/*!40000 ALTER TABLE `llx_condition_dest` DISABLE KEYS */;

INSERT INTO `llx_condition_dest` (`id`, `condition_id`, `dest_id`)
VALUES
	(1,1,3),
	(2,2,3),
	(3,3,2),
	(4,4,4),
	(5,5,3),
	(6,6,4),
	(7,7,1),
	(8,8,2),
	(9,9,5),
	(10,10,4);

/*!40000 ALTER TABLE `llx_condition_dest` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_condition_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_condition_price`;

CREATE TABLE `llx_condition_price` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `hour_start` time DEFAULT NULL,
  `hour_end` time DEFAULT NULL,
  `is_exclusive` tinyint(1) DEFAULT '0',
  `weekdays` longtext COMMENT '(DC2Type:array)',
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `llx_condition_price_condition_id_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_condition_price` WRITE;
/*!40000 ALTER TABLE `llx_condition_price` DISABLE KEYS */;

INSERT INTO `llx_condition_price` (`id`, `date_start`, `date_end`, `hour_start`, `hour_end`, `is_exclusive`, `weekdays`, `uuid`)
VALUES
	(1,'2017-07-15','2017-07-17','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','55fd134a-c3f9-43b0-9ad6-e723f603f508'),
	(2,'2017-07-13','2017-07-15','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','41f86030-65d6-4ed3-ba3a-b45f393a88ab'),
	(3,'2017-08-10','2017-08-12','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','b9e0d04d-e3ec-4da7-894b-1e177d96dabf'),
	(4,'2017-07-23','2017-07-24','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','879be9b0-e71a-4dcf-86e1-c19efae39e25'),
	(5,'2017-08-09','2017-08-13','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','8489af33-00fe-4efe-a7d7-ab6227d6b36c'),
	(6,'2017-07-12','2017-07-15','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','56e514a4-4f47-4b17-9494-4d545a2883b6'),
	(7,'2017-07-26','2017-07-31','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','9512635a-68f3-4cd5-834d-d4df969a26aa'),
	(8,'2017-07-16','2017-07-18','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','063ba96e-3b81-482c-a0c5-2375785543a9'),
	(9,'2017-07-28','2017-07-30','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','097d14c6-4403-4116-913d-6f2e117ebed4'),
	(10,'2017-08-05','2017-08-08','14:00:00','18:00:00',0,'a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}','7dd3e67b-6554-4d7e-bc63-7175bc618157');

/*!40000 ALTER TABLE `llx_condition_price` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_const
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_const`;

CREATE TABLE `llx_const` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `value` text NOT NULL,
  `type` varchar(6) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `note` text,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_const` (`name`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_const` WRITE;
/*!40000 ALTER TABLE `llx_const` DISABLE KEYS */;

INSERT INTO `llx_const` (`rowid`, `name`, `entity`, `value`, `type`, `visible`, `note`, `tms`)
VALUES
	(2,'MAIN_FEATURES_LEVEL',0,'0','chaine',1,'Level of features to show (0=stable only, 1=stable+experimental, 2=stable+experimental+development','2015-11-22 17:45:33'),
	(3,'MAILING_LIMIT_SENDBYWEB',0,'25','chaine',1,'Number of targets to defined packet size when sending mass email','2015-11-22 17:45:33'),
	(4,'SYSLOG_HANDLERS',0,'[\"mod_syslog_file\"]','chaine',0,'Which logger to use','2015-11-22 17:45:33'),
	(5,'SYSLOG_FILE',0,'DOL_DATA_ROOT/dolibarr.log','chaine',0,'Directory where to write log file','2015-11-22 17:45:33'),
	(6,'SYSLOG_LEVEL',0,'7','chaine',0,'Level of debug info to show','2015-11-22 17:45:33'),
	(7,'MAIN_MAIL_SMTP_SERVER',0,'','chaine',0,'Host or ip address for SMTP server','2015-11-22 17:45:33'),
	(8,'MAIN_MAIL_SMTP_PORT',0,'','chaine',0,'Port for SMTP server','2015-11-22 17:45:33'),
	(9,'MAIN_UPLOAD_DOC',0,'2048','chaine',0,'Max size for file upload (0 means no upload allowed)','2015-11-22 17:45:33'),
	(11,'MAIN_MAIL_EMAIL_FROM',1,'robot@domain.com','chaine',0,'EMail emetteur pour les emails automatiques Dolibarr','2015-11-22 17:45:33'),
	(12,'MAIN_SIZE_LISTE_LIMIT',0,'25','chaine',0,'Longueur maximum des listes','2015-11-22 17:45:33'),
	(13,'MAIN_SHOW_WORKBOARD',0,'1','yesno',0,'Affichage tableau de bord de travail Dolibarr','2015-11-22 17:45:33'),
	(14,'MAIN_MENU_STANDARD',1,'wynd_menu.php','chaine',0,'Menu manager for internal users','2015-11-22 17:45:33'),
	(15,'MAIN_MENUFRONT_STANDARD',1,'wynd_menu.php','chaine',0,'Menu manager for external users','2015-11-22 17:45:33'),
	(16,'MAIN_MENU_SMARTPHONE',1,'wynd_menu.php','chaine',0,'Menu manager for internal users using smartphones','2015-11-22 17:45:33'),
	(17,'MAIN_MENUFRONT_SMARTPHONE',1,'wynd_menu.php','chaine',0,'Menu manager for external users using smartphones','2015-11-22 17:45:33'),
	(18,'MAIN_DELAY_ACTIONS_TODO',1,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur actions planifiées non réalisées','2015-11-22 17:45:33'),
	(19,'MAIN_DELAY_ORDERS_TO_PROCESS',1,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes clients non traitées','2015-11-22 17:45:33'),
	(20,'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS',1,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes fournisseurs non traitées','2015-11-22 17:45:33'),
	(21,'MAIN_DELAY_PROPALS_TO_CLOSE',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales à cloturer','2015-11-22 17:45:33'),
	(22,'MAIN_DELAY_PROPALS_TO_BILL',1,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales non facturées','2015-11-22 17:45:33'),
	(23,'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures client impayées','2015-11-22 17:45:33'),
	(24,'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY',1,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures fournisseur impayées','2015-11-22 17:45:33'),
	(25,'MAIN_DELAY_NOT_ACTIVATED_SERVICES',1,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services à activer','2015-11-22 17:45:33'),
	(26,'MAIN_DELAY_RUNNING_SERVICES',1,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services expirés','2015-11-22 17:45:33'),
	(27,'MAIN_DELAY_MEMBERS',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur cotisations adhérent en retard','2015-11-22 17:45:33'),
	(28,'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE',1,'62','chaine',0,'Tolérance de retard avant alerte (en jours) sur rapprochements bancaires à faire','2015-11-22 17:45:33'),
	(29,'MAIN_FIX_FOR_BUGGED_MTA',1,'1','chaine',1,'Set constant to fix email ending from PHP with some linux ike system','2015-11-22 17:45:33'),
	(30,'MAILING_EMAIL_FROM',1,'dolibarr@domain.com','chaine',0,'EMail emmetteur pour les envois d emailings','2015-11-22 17:45:33'),
	(31,'MAIN_MODULE_USER',0,'1',NULL,0,NULL,'2015-11-22 17:45:43'),
	(32,'MAIN_VERSION_LAST_INSTALL',0,'3.6.3','chaine',0,'Dolibarr version when install','2015-11-22 17:45:43'),
	(34,'MAIN_MODULE_TAKEAWAY',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(35,'MAIN_MODULE_TAKEAWAY_TABS_0',0,'product:-subproduct','chaine',0,NULL,'2016-12-08 16:38:09'),
	(36,'MAIN_MODULE_TAKEAWAY_TABS_1',0,'product:+tabSubProductTakeAway:SubProductTakeAway:takeaway@takeaway:$user->rights->produit->lire:/takeaway/product/composition/card.php?id=__ID__','chaine',0,NULL,'2016-12-08 16:38:09'),
	(37,'MAIN_MODULE_TAKEAWAY_TABS_2',0,'product:+tabSubProductUpsellTakeAway:SubProductUpsellTakeAway:takeaway@takeaway:$user->rights->produit->lire:/takeaway/product/upsell/card.php?id=__ID__','chaine',0,NULL,'2016-12-08 16:38:09'),
	(38,'MAIN_MODULE_TAKEAWAY_TABS_3',0,'product:+tabSubProductVariationTakeAway:SubProductVariationTakeAway:takeaway@takeaway:$user->rights->produit->lire:/takeaway/product/variation/card.php?id=__ID__','chaine',0,NULL,'2016-12-08 16:38:09'),
	(39,'MAIN_MODULE_TAKEAWAY_TABS_4',0,'product:+tabSubProductSubstitutionTakeAway:SubProductSubstitutionakeAway:takeaway@takeaway:$user->rights->produit->lire:/takeaway/product/substit/card.php?id=__ID__','chaine',0,NULL,'2016-12-08 16:38:09'),
	(40,'MAIN_MODULE_TAKEAWAY_TABS_5',0,'product:+tabSubProductRestaurant:TkVisRestaurant:takeaway@takeaway:$user->rights->produit->lire:/takeaway/product/restaurant.php?id=__ID__','chaine',0,NULL,'2016-12-08 16:38:09'),
	(41,'MAIN_MODULE_TAKEAWAY_TABS_6',0,'categories_0:+tabSubProductRestaurant:TkVisRestaurant:takeaway@takeaway:$user->rights->categorie->lire:/takeaway/categorie/restaurant.php?id=__ID__','chaine',0,NULL,'2016-12-08 16:38:09'),
	(42,'MAIN_MODULE_TAKEAWAY_TRIGGERS',0,'1','chaine',0,NULL,'2016-12-08 16:38:09'),
	(43,'MAIN_MODULE_TAKEAWAY_HOOKS',0,'[\"ordercard\",\"invoicecard\"]','chaine',0,NULL,'2016-12-08 16:38:09'),
	(44,'PRODUIT_SOUSPRODUITS',0,'1','chaine',1,NULL,'2015-11-22 17:56:01'),
	(45,'TK_KD_GROUP_PRODUCT_FAMILY',1,'1','chaine',0,'group product by family on kitchen display','2015-11-22 17:56:01'),
	(46,'TK_KD_NB_COL',1,'4','chaine',0,'nb display column','2015-11-22 17:56:01'),
	(47,'TK_KD_TIME_DISP_CANCELED',1,'20','chaine',0,'display cancelled order time','2015-11-22 17:56:01'),
	(48,'TK_KD_REFRESH_TIME',1,'2','chaine',0,'refresh time','2015-11-22 17:56:01'),
	(49,'TK_KD_STAT_COLOR_1',1,'08ff25','chaine',0,'statuscolor','2015-11-22 17:56:01'),
	(50,'TK_KD_STAT_COLOR_2',1,'d9f505','chaine',0,'statuscolor','2015-11-22 17:56:01'),
	(51,'TK_KD_STAT_COLOR_3',1,'ff450d','chaine',0,'statuscolor','2015-11-22 17:56:01'),
	(52,'TK_KD_HEAD_TIME_1',1,'5','chaine',0,'statuscolor','2015-11-22 17:56:01'),
	(53,'TK_KD_HEAD_TIME_2',1,'5','chaine',0,'statuscolor','2015-11-22 17:56:01'),
	(54,'TK_KD_HEAD_TIME_3',1,'10','chaine',0,'statuscolor','2015-11-22 17:56:01'),
	(55,'TK_KD_NB_ORDER',1,'6','chaine',0,'Maximum order numbre displayed','2015-11-22 17:56:01'),
	(56,'TK_KD_COL_DEF',1,'FF6701','chaine',0,'Default colors','2015-11-22 17:56:01'),
	(57,'TK_KD_CAT_DISPLAY',1,'103002541','chaine',0,'Defaut cat to display','2015-11-22 17:56:01'),
	(58,'TK_KD_PRINT_TICKET',1,'','chaine',0,'Defaut cat to display','2015-11-22 17:56:01'),
	(59,'TK_CENTRAL_SERVER',0,'87.98.152.209','chaine',0,'Central serveur','2015-11-22 17:56:01'),
	(60,'TK_CENTRAL_USER',0,'webservice','chaine',0,'Central serveur','2015-11-22 17:56:01'),
	(61,'TK_CENTRAL_PASSWORD',0,'hy8d7fg0','chaine',0,'Central serveur','2015-11-22 17:56:01'),
	(62,'TK_CENTRAL_APIKEY',0,'f0da5e908eda420498c433bb5a5acb2d','chaine',0,'Central serveur','2015-11-22 17:56:01'),
	(63,'TK_KD_CAT_TICKET',1,'103002545','chaine',0,'Defaut cat to display on ticket','2015-11-22 17:56:01'),
	(64,'REQUIRE_JQUERY_DATATABLES',0,'1','yesno',0,'use JQUERY DataTable Module','2015-11-22 17:56:01'),
	(66,'SOCIETE_CODECLIENT_ADDON',1,'mod_codeclient_leopard','chaine',0,'Module to control third parties codes','2015-11-22 17:56:01'),
	(67,'SOCIETE_CODECOMPTA_ADDON',1,'mod_codecompta_panicum','chaine',0,'Module to control third parties codes','2015-11-22 17:56:01'),
	(71,'COMPANY_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/thirdparties','chaine',0,NULL,'2015-11-22 17:56:01'),
	(72,'SOCIETE_ADD_REF_IN_LIST',1,'','yesno',0,'Display customer ref into select list','2015-11-22 17:56:01'),
	(77,'FACTURE_ADDON_PDF',1,'crabe','chaine',0,'Name of PDF model of invoice','2015-11-22 17:56:01'),
	(78,'FACTURE_ADDON',1,'mod_facture_terre','chaine',0,'Name of numbering numerotation rules of invoice','2015-11-22 17:56:01'),
	(79,'FACTURE_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/invoices','chaine',0,NULL,'2015-11-22 17:56:01'),
	(84,'PRODUCT_CODEPRODUCT_ADDON',1,'mod_codeproduct_leopard','chaine',0,'Module to control product codes','2015-11-22 17:56:01'),
	(86,'MAIN_MODULE_STOCK',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(89,'COMMANDE_ADDON_PDF',1,'einstein','chaine',0,'Name of PDF model of order','2015-11-22 17:56:01'),
	(90,'COMMANDE_ADDON',1,'mod_commande_marbre','chaine',0,'Name of numbering numerotation rules of order','2015-11-22 17:56:01'),
	(91,'COMMANDE_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/orders','chaine',0,NULL,'2015-11-22 17:56:01'),
	(95,'CATEGORIE_RECURSIV_ADD',1,'','yesno',0,'Affect parent categories','2015-11-22 17:56:01'),
	(96,'MAIN_MODULE_COMPTABILITE',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(102,'MAIN_MODULE_FOURNISSEUR',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(103,'COMMANDE_SUPPLIER_ADDON_PDF',1,'muscadet','chaine',0,'Nom du gestionnaire de generation des bons de commande en PDF','2015-11-22 17:56:01'),
	(104,'COMMANDE_SUPPLIER_ADDON_NUMBER',1,'mod_commande_fournisseur_muguet','chaine',0,'Nom du gestionnaire de numerotation des commandes fournisseur','2015-11-22 17:56:01'),
	(105,'INVOICE_SUPPLIER_ADDON_PDF',1,'canelle','chaine',0,'Nom du gestionnaire de generation des factures fournisseur en PDF','2015-11-22 17:56:01'),
	(106,'INVOICE_SUPPLIER_ADDON_NUMBER',1,'mod_facture_fournisseur_cactus','chaine',0,'Nom du gestionnaire de numerotation des factures fournisseur','2015-11-22 17:56:01'),
	(108,'MAIN_MODULE_SALARIES',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(109,'MAIN_MODULE_TAX',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(110,'MAIN_MODULE_WEBSERVICES',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(112,'MAIN_MODULE_MULTICOMPANY_LOGIN',0,'1','chaine',0,NULL,'2016-12-08 16:38:09'),
	(113,'MAIN_MODULE_MULTICOMPANY_HOOKS',0,'[\"mainloginpage\",\"passwordforgottenpage\",\"toprightmenu\"]','chaine',0,NULL,'2015-11-22 17:56:02'),
	(114,'MAIN_MODULE_MULTICOMPANY_CSS',0,'[\"\\/multicompany\\/css\\/multicompany.css.php\"]','chaine',0,NULL,'2015-11-22 17:56:02'),
	(115,'MAIN_MODULE_WYNDTERMINAL',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(117,'MAIN_MODULE_PRODUCT',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(118,'MAIN_MODULE_BANQUE',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(119,'MAIN_MODULE_FACTURE',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(125,'MAIN_MODULE_COMMANDE',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(126,'MAIN_MODULE_SOCIETE',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(127,'MAIN_MODULE_CATEGORIE',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(128,'MAIN_MODULE_FCKEDITOR',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(129,'FCKEDITOR_ENABLE_SOCIETE',1,'1','yesno',0,'WYSIWIG for description and note (except products/services)','2015-11-22 17:56:04'),
	(130,'FCKEDITOR_ENABLE_PRODUCTDESC',1,'1','yesno',0,'WYSIWIG for products/services description and note','2015-11-22 17:56:04'),
	(131,'FCKEDITOR_ENABLE_MAILING',1,'1','yesno',0,'WYSIWIG for mass emailings','2015-11-22 17:56:04'),
	(132,'FCKEDITOR_ENABLE_DETAILS',1,'1','yesno',0,'WYSIWIG for products details lines for all entities','2015-11-22 17:56:04'),
	(133,'FCKEDITOR_ENABLE_USERSIGN',1,'1','yesno',0,'WYSIWIG for user signature','2015-11-22 17:56:04'),
	(134,'FCKEDITOR_ENABLE_MAIL',1,'1','yesno',0,'WYSIWIG for products details lines for all entities','2015-11-22 17:56:04'),
	(148,'MAIN_MODULE_EXPORT',0,'1',NULL,0,NULL,'2016-12-08 16:38:09'),
	(335,'MAIN_INFO_SOCIETE_LOGO_MINI',1,'logo-quick-1_mini.png','chaine',0,'','2016-03-29 09:00:20'),
	(348,'MAIN_MAIL_EMAIL_FROM',2,'dolibarr-robot@domain.com','chaine',0,'EMail emetteur pour les emails automatiques Dolibarr','2016-03-31 13:43:43'),
	(349,'MAIN_MENU_STANDARD',2,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu du haut pour utilisateurs internes','2016-03-31 13:43:43'),
	(350,'MAIN_MENUFRONT_STANDARD',2,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu du haut pour utilisateurs externes','2016-03-31 13:43:43'),
	(351,'MAIN_MENU_SMARTPHONE',2,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu smartphone pour utilisateurs internes','2016-03-31 13:43:43'),
	(352,'MAIN_MENUFRONT_SMARTPHONE',2,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu smartphone pour utilisateurs externes','2016-03-31 13:43:43'),
	(353,'MAIN_THEME',2,'oblyon','chaine',0,'Default theme','2016-03-31 13:43:43'),
	(354,'MAIN_DELAY_ACTIONS_TODO',2,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur actions planifiées non réalisées','2016-03-31 13:43:43'),
	(355,'MAIN_DELAY_ORDERS_TO_PROCESS',2,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes clients non traitées','2016-03-31 13:43:43'),
	(356,'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS',2,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes fournisseurs non traitées','2016-03-31 13:43:43'),
	(357,'MAIN_DELAY_PROPALS_TO_CLOSE',2,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales à cloturer','2016-03-31 13:43:43'),
	(358,'MAIN_DELAY_PROPALS_TO_BILL',2,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales non facturées','2016-03-31 13:43:43'),
	(359,'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED',2,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures client impayées','2016-03-31 13:43:43'),
	(360,'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY',2,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures fournisseur impayées','2016-03-31 13:43:43'),
	(361,'MAIN_DELAY_NOT_ACTIVATED_SERVICES',2,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services à activer','2016-03-31 13:43:43'),
	(362,'MAIN_DELAY_RUNNING_SERVICES',2,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services expirés','2016-03-31 13:43:43'),
	(363,'MAIN_DELAY_MEMBERS',2,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur cotisations adhérent en retard','2016-03-31 13:43:43'),
	(364,'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE',2,'62','chaine',0,'Tolérance de retard avant alerte (en jours) sur rapprochements bancaires à faire','2016-03-31 13:43:43'),
	(365,'MAILING_EMAIL_FROM',2,'dolibarr@domain.com','chaine',0,'EMail emmetteur pour les envois d emailings','2016-03-31 13:43:43'),
	(373,'MULTICOMPANY_SHARINGS_ENABLED',0,'1','chaine',0,'','2016-03-31 13:44:47'),
	(374,'MULTICOMPANY_SOCIETE_SHARING_ENABLED',0,'1','chaine',0,'','2016-03-31 13:44:51'),
	(375,'MULTICOMPANY_PRODUCT_SHARING_ENABLED',0,'1','chaine',0,'','2016-03-31 13:44:51'),
	(376,'MULTICOMPANY_PRODUCTPRICE_SHARING_ENABLED',0,'1','chaine',0,'','2016-03-31 13:44:53'),
	(377,'MULTICOMPANY_CATEGORY_SHARING_ENABLED',0,'1','chaine',0,'','2016-03-31 13:44:56'),
	(378,'MULTICOMPANY_BANK_ACCOUNT_SHARING_ENABLED',0,'1','chaine',0,'','2016-03-31 13:44:57'),
	(620,'MAIN_MODULE_MULTICOMPANY',0,'1',NULL,0,NULL,'2016-06-28 14:52:43'),
	(1178,'MAIN_INFO_SOCIETE_LOGO',1,'logo-quick-1.png',NULL,1,NULL,'2016-10-17 12:35:25'),
	(1179,'MAIN_INFO_SOCIETE_LOGO_SMALL',1,'logo-quick-1_small.png',NULL,1,NULL,'2016-10-17 12:35:25'),
	(1186,'MAIN_MULTILANGS',1,'0','chaine',0,'','2016-11-17 12:48:12'),
	(1187,'MAIN_SIZE_LISTE_LIMIT',1,'25','chaine',0,'','2016-11-17 12:48:12'),
	(1188,'MAIN_DISABLE_JAVASCRIPT',1,'0','chaine',0,'','2016-11-17 12:48:12'),
	(1189,'MAIN_BUTTON_HIDE_UNAUTHORIZED',1,'0','chaine',0,'','2016-11-17 12:48:12'),
	(1190,'MAIN_START_WEEK',1,'1','chaine',0,'','2016-11-17 12:48:12'),
	(1191,'MAIN_SHOW_LOGO',1,'0','chaine',0,'','2016-11-17 12:48:12'),
	(1192,'MAIN_FIRSTNAME_NAME_POSITION',1,'0','chaine',0,'','2016-11-17 12:48:12'),
	(1193,'MAIN_THEME',1,'wynd','chaine',0,'','2016-11-17 12:48:12'),
	(1194,'MAIN_SEARCHFORM_CONTACT',1,'1','chaine',0,'','2016-11-17 12:48:12'),
	(1195,'MAIN_SEARCHFORM_SOCIETE',1,'1','chaine',0,'','2016-11-17 12:48:12'),
	(1196,'MAIN_SEARCHFORM_PRODUITSERVICE',1,'1','chaine',0,'','2016-11-17 12:48:12'),
	(1197,'MAIN_SEARCHFORM_PRODUITSERVICE_SUPPLIER',1,'0','chaine',0,'','2016-11-17 12:48:12'),
	(1198,'MAIN_SEARCHFORM_ADHERENT',1,'0','chaine',0,'','2016-11-17 12:48:12'),
	(1199,'MAIN_HELPCENTER_DISABLELINK',0,'0','chaine',0,'','2016-11-17 12:48:12'),
	(1200,'MAIN_HELP_DISABLELINK',0,'0','chaine',0,'','2016-11-17 12:48:12'),
	(1209,'MAIN_MAIL_EMAIL_FROM',4,'dolibarr-robot@domain.com','chaine',0,'EMail emetteur pour les emails automatiques Dolibarr','2016-12-08 16:06:10'),
	(1210,'MAIN_MENU_STANDARD',4,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu du haut pour utilisateurs internes','2016-12-08 16:06:10'),
	(1211,'MAIN_MENUFRONT_STANDARD',4,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu du haut pour utilisateurs externes','2016-12-08 16:06:10'),
	(1212,'MAIN_MENU_SMARTPHONE',4,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu smartphone pour utilisateurs internes','2016-12-08 16:06:10'),
	(1213,'MAIN_MENUFRONT_SMARTPHONE',4,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu smartphone pour utilisateurs externes','2016-12-08 16:06:10'),
	(1214,'MAIN_THEME',4,'oblyon','chaine',0,'Default theme','2016-12-08 16:06:10'),
	(1215,'MAIN_DELAY_ACTIONS_TODO',4,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur actions planifiées non réalisées','2016-12-08 16:06:10'),
	(1216,'MAIN_DELAY_ORDERS_TO_PROCESS',4,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes clients non traitées','2016-12-08 16:06:10'),
	(1217,'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS',4,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes fournisseurs non traitées','2016-12-08 16:06:10'),
	(1218,'MAIN_DELAY_PROPALS_TO_CLOSE',4,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales à cloturer','2016-12-08 16:06:10'),
	(1219,'MAIN_DELAY_PROPALS_TO_BILL',4,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales non facturées','2016-12-08 16:06:10'),
	(1220,'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED',4,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures client impayées','2016-12-08 16:06:10'),
	(1221,'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY',4,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures fournisseur impayées','2016-12-08 16:06:10'),
	(1222,'MAIN_DELAY_NOT_ACTIVATED_SERVICES',4,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services à activer','2016-12-08 16:06:10'),
	(1223,'MAIN_DELAY_RUNNING_SERVICES',4,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services expirés','2016-12-08 16:06:10'),
	(1224,'MAIN_DELAY_MEMBERS',4,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur cotisations adhérent en retard','2016-12-08 16:06:10'),
	(1225,'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE',4,'62','chaine',0,'Tolérance de retard avant alerte (en jours) sur rapprochements bancaires à faire','2016-12-08 16:06:10'),
	(1226,'MAILING_EMAIL_FROM',4,'dolibarr@domain.com','chaine',0,'EMail emmetteur pour les envois d emailings','2016-12-08 16:06:10'),
	(1251,'MAIN_INFO_SOCIETE_COUNTRY',3,'1:FR:France','chaine',0,'','2016-12-16 10:52:05'),
	(1252,'MAIN_INFO_SOCIETE_NOM',3,'PAUL Gare du Nord - RER','chaine',0,'','2016-12-16 10:52:05'),
	(1253,'MAIN_INFO_SOCIETE_STATE',3,'0','chaine',0,'','2016-12-16 10:52:05'),
	(1254,'MAIN_MONNAIE',3,'EUR','chaine',0,'','2016-12-16 10:52:05'),
	(1255,'MAIN_LANG_DEFAULT',3,'fr_FR','chaine',0,'','2016-12-16 10:52:05'),
	(1287,'MAIN_INFO_SOCIETE_WEB',1,'elior.com','chaine',0,'','2016-12-16 10:53:49'),
	(1288,'MAIN_INFO_SOCIETE_FORME_JURIDIQUE',1,'0','chaine',0,'','2016-12-16 10:53:49'),
	(1289,'SOCIETE_FISCAL_MONTH_START',1,'0','chaine',0,'','2016-12-16 10:53:49'),
	(1290,'FACTURE_TVAOPTION',1,'1','chaine',0,'','2016-12-16 10:53:49'),
	(1291,'MAIN_INFO_SOCIETE_COUNTRY',2,'1:FR:France','chaine',0,'','2016-12-19 09:44:19'),
	(1292,'MAIN_INFO_SOCIETE_NOM',2,'PAUL Gare du Nord  - Parvis','chaine',0,'','2016-12-19 09:44:19'),
	(1293,'MAIN_INFO_SOCIETE_ADDRESS',2,'Rue de Luxembourg (Hyp Cactus)','chaine',0,'','2016-12-19 09:44:19'),
	(1294,'MAIN_INFO_SOCIETE_TOWN',2,'Paris','chaine',0,'','2016-12-19 09:44:19'),
	(1295,'MAIN_INFO_SOCIETE_ZIP',2,'75009','chaine',0,'','2016-12-19 09:44:19'),
	(1296,'MAIN_INFO_SOCIETE_STATE',2,'0','chaine',0,'','2016-12-19 09:44:19'),
	(1297,'MAIN_MONNAIE',2,'EUR','chaine',0,'','2016-12-19 09:44:19'),
	(1298,'MAIN_LANG_DEFAULT',2,'fr_FR','chaine',0,'','2016-12-19 09:44:19'),
	(1299,'MAIN_INFO_SOCIETE_COUNTRY',1,'1:FR:France','chaine',0,'','2016-12-21 09:22:59'),
	(1300,'MAIN_INFO_SOCIETE_NOM',1,'Areas Elior WIIISH','chaine',0,'','2016-12-21 09:22:59'),
	(1301,'MAIN_INFO_SOCIETE_ADDRESS',1,'Gare du nord','chaine',0,'','2016-12-21 09:22:59'),
	(1302,'MAIN_INFO_SOCIETE_TOWN',1,'Paris','chaine',0,'','2016-12-21 09:22:59'),
	(1303,'MAIN_INFO_SOCIETE_ZIP',1,'75010','chaine',0,'','2016-12-21 09:22:59'),
	(1304,'MAIN_INFO_SOCIETE_STATE',1,'0','chaine',0,'','2016-12-21 09:22:59'),
	(1305,'MAIN_MONNAIE',1,'EUR','chaine',0,'','2016-12-21 09:22:59'),
	(1306,'MAIN_LANG_DEFAULT',1,'fr_FR','chaine',0,'','2016-12-21 09:22:59'),
	(1312,'MAIN_MAIL_EMAIL_FROM',5,'dolibarr-robot@domain.com','chaine',0,'EMail emetteur pour les emails automatiques Dolibarr','2016-12-21 09:23:38'),
	(1313,'MAIN_MENU_STANDARD',5,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu du haut pour utilisateurs internes','2016-12-21 09:23:38'),
	(1314,'MAIN_MENUFRONT_STANDARD',5,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu du haut pour utilisateurs externes','2016-12-21 09:23:38'),
	(1315,'MAIN_MENU_SMARTPHONE',5,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu smartphone pour utilisateurs internes','2016-12-21 09:23:38'),
	(1316,'MAIN_MENUFRONT_SMARTPHONE',5,'oblyon_menu.php','chaine',0,'Module de gestion de la barre de menu smartphone pour utilisateurs externes','2016-12-21 09:23:38'),
	(1317,'MAIN_THEME',5,'oblyon','chaine',0,'Default theme','2016-12-21 09:23:38'),
	(1318,'MAIN_DELAY_ACTIONS_TODO',5,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur actions planifiées non réalisées','2016-12-21 09:23:38'),
	(1319,'MAIN_DELAY_ORDERS_TO_PROCESS',5,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes clients non traitées','2016-12-21 09:23:38'),
	(1320,'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS',5,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes fournisseurs non traitées','2016-12-21 09:23:38'),
	(1321,'MAIN_DELAY_PROPALS_TO_CLOSE',5,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales à cloturer','2016-12-21 09:23:38'),
	(1322,'MAIN_DELAY_PROPALS_TO_BILL',5,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales non facturées','2016-12-21 09:23:38'),
	(1323,'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED',5,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures client impayées','2016-12-21 09:23:38'),
	(1324,'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY',5,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures fournisseur impayées','2016-12-21 09:23:38'),
	(1325,'MAIN_DELAY_NOT_ACTIVATED_SERVICES',5,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services à activer','2016-12-21 09:23:38'),
	(1326,'MAIN_DELAY_RUNNING_SERVICES',5,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services expirés','2016-12-21 09:23:38'),
	(1327,'MAIN_DELAY_MEMBERS',5,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur cotisations adhérent en retard','2016-12-21 09:23:38'),
	(1328,'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE',5,'62','chaine',0,'Tolérance de retard avant alerte (en jours) sur rapprochements bancaires à faire','2016-12-21 09:23:38'),
	(1329,'MAILING_EMAIL_FROM',5,'dolibarr@domain.com','chaine',0,'EMail emmetteur pour les envois d emailings','2016-12-21 09:23:38'),
	(1330,'MAIN_INFO_SOCIETE_COUNTRY',5,'1:FR:France','chaine',0,'','2016-12-21 09:23:55'),
	(1331,'MAIN_INFO_SOCIETE_NOM',5,'AREAS - Gare du nord','chaine',0,'','2016-12-21 09:23:55'),
	(1332,'MAIN_INFO_SOCIETE_STATE',5,'0','chaine',0,'','2016-12-21 09:23:55'),
	(1333,'MAIN_MONNAIE',5,'EUR','chaine',0,'','2016-12-21 09:23:55'),
	(1334,'MAIN_LANG_DEFAULT',5,'fr_FR','chaine',0,'','2016-12-21 09:23:55'),
	(1343,'MAIN_INFO_SOCIETE_COUNTRY',4,'1:FR:France','chaine',0,'','2016-12-21 09:25:27'),
	(1344,'MAIN_INFO_SOCIETE_NOM',4,'PAUL Gare du Nord','chaine',0,'','2016-12-21 09:25:27'),
	(1345,'MAIN_INFO_SOCIETE_ADDRESS',4,'Rue de Paul','chaine',0,'','2016-12-21 09:25:27'),
	(1346,'MAIN_INFO_SOCIETE_TOWN',4,'Paris','chaine',0,'','2016-12-21 09:25:27'),
	(1347,'MAIN_INFO_SOCIETE_ZIP',4,'75001','chaine',0,'','2016-12-21 09:25:27'),
	(1348,'MAIN_INFO_SOCIETE_STATE',4,'0','chaine',0,'','2016-12-21 09:25:27'),
	(1349,'MAIN_MONNAIE',4,'EUR','chaine',0,'','2016-12-21 09:25:27'),
	(1350,'MAIN_LANG_DEFAULT',4,'fr_FR','chaine',0,'','2016-12-21 09:25:27');

/*!40000 ALTER TABLE `llx_const` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_contrat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_contrat`;

CREATE TABLE `llx_contrat` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_contrat` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT '0',
  `mise_en_service` datetime DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_commercial_signature` int(11) NOT NULL,
  `fk_commercial_suivi` int(11) NOT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT '0',
  `fk_user_mise_en_service` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_contrat_ref` (`ref`,`entity`),
  KEY `idx_contrat_fk_soc` (`fk_soc`),
  KEY `idx_contrat_fk_user_author` (`fk_user_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_contrat_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_contrat_extrafields`;

CREATE TABLE `llx_contrat_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contrat_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_contratdet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_contratdet`;

CREATE TABLE `llx_contratdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_contrat` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `statut` smallint(6) DEFAULT '0',
  `label` text,
  `description` text,
  `fk_remise_except` int(11) DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `date_ouverture_prevue` datetime DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT '0.000',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double NOT NULL,
  `remise_percent` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT '0.00000000',
  `price_ht` double DEFAULT NULL,
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int(11) DEFAULT '1',
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT NULL,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT '0',
  `fk_user_ouverture` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `commentaire` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_fk_contrat` (`fk_contrat`),
  KEY `idx_contratdet_fk_product` (`fk_product`),
  KEY `idx_contratdet_date_ouverture_prevue` (`date_ouverture_prevue`),
  KEY `idx_contratdet_date_ouverture` (`date_ouverture`),
  KEY `idx_contratdet_date_fin_validite` (`date_fin_validite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_contratdet_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_contratdet_log`;

CREATE TABLE `llx_contratdet_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_contratdet` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `statut` smallint(6) NOT NULL,
  `fk_user_author` int(11) NOT NULL,
  `commentaire` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_log_fk_contratdet` (`fk_contratdet`),
  KEY `idx_contratdet_log_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_cotisation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_cotisation`;

CREATE TABLE `llx_cotisation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `dateadh` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `cotisation` double DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_cotisation` (`fk_adherent`,`dateadh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_cronjob
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_cronjob`;

CREATE TABLE `llx_cronjob` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `jobtype` varchar(10) NOT NULL,
  `label` text NOT NULL,
  `command` varchar(255) DEFAULT NULL,
  `classesname` varchar(255) DEFAULT NULL,
  `objectname` varchar(255) DEFAULT NULL,
  `methodename` varchar(255) DEFAULT NULL,
  `params` text NOT NULL,
  `md5params` varchar(32) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  `datelastrun` datetime DEFAULT NULL,
  `datenextrun` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `lastresult` text,
  `lastoutput` text,
  `unitfrequency` int(11) NOT NULL DEFAULT '0',
  `frequency` int(11) NOT NULL DEFAULT '0',
  `nbrun` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `note` text,
  `libname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_delivery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_delivery`;

CREATE TABLE `llx_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(25) NOT NULL COMMENT 'Delivery status',
  `order_id` int(11) NOT NULL COMMENT 'Order foreign key',
  `customer_id` int(11) NOT NULL COMMENT 'Customer foreign key',
  `provider_id` varchar(50) DEFAULT NULL COMMENT 'Service provider order id',
  `tracking_url` varchar(255) DEFAULT NULL COMMENT 'Tracking url ',
  `order_created_at` datetime DEFAULT NULL COMMENT 'Order created at',
  `job_created_at` datetime DEFAULT NULL COMMENT 'Job created at',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KEY_UNQ_ORDERID` (`order_id`) USING BTREE,
  KEY `FK_CUSTOMER_ID` (`customer_id`) USING BTREE,
  KEY `KEY_PROVIDER_ID` (`provider_id`) USING BTREE,
  CONSTRAINT `FK_COMMANDE_ID` FOREIGN KEY (`order_id`) REFERENCES `llx_commande` (`rowid`),
  CONSTRAINT `FK_CUSTOMER_ID` FOREIGN KEY (`customer_id`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



# Affichage de la table llx_deplacement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_deplacement`;

CREATE TABLE `llx_deplacement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dated` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `type` varchar(12) NOT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT '1',
  `km` double DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_document_generator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_document_generator`;

CREATE TABLE `llx_document_generator` (
  `rowid` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `classfile` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_document_model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_document_model`;

CREATE TABLE `llx_document_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `type` varchar(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_document_model` (`nom`,`type`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_document_model` WRITE;
/*!40000 ALTER TABLE `llx_document_model` DISABLE KEYS */;

INSERT INTO `llx_document_model` (`rowid`, `nom`, `entity`, `type`, `libelle`, `description`)
VALUES
	(5,'muscadet',1,'order_supplier',NULL,NULL),
	(6,'crabe',1,'invoice',NULL,NULL),
	(7,'einstein',1,'order',NULL,NULL),
	(11,'einstein',3,'order',NULL,NULL),
	(13,'crabe',3,'invoice',NULL,NULL),
	(14,'muscadet',3,'order_supplier',NULL,NULL);

/*!40000 ALTER TABLE `llx_document_model` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_don
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_don`;

CREATE TABLE `llx_don` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `datedon` datetime DEFAULT NULL,
  `amount` double DEFAULT '0',
  `fk_paiement` int(11) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `societe` varchar(50) DEFAULT NULL,
  `address` text,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `phone_mobile` varchar(24) DEFAULT NULL,
  `public` smallint(6) NOT NULL DEFAULT '1',
  `fk_don_projet` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_ecm_directories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_ecm_directories`;

CREATE TABLE `llx_ecm_directories` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_parent` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cachenbofdoc` int(11) NOT NULL DEFAULT '0',
  `fullpath` varchar(255) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `date_m` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `acl` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_ecm_directories` (`label`,`fk_parent`,`entity`),
  KEY `idx_ecm_directories_fk_user_c` (`fk_user_c`),
  KEY `idx_ecm_directories_fk_user_m` (`fk_user_m`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_element_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_element_contact`;

CREATE TABLE `llx_element_contact` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datecreate` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT '5',
  `element_id` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_contact_idx1` (`element_id`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_element_contact_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `idx_element_contact_fk_socpeople` (`fk_socpeople`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_element_element
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_element_element`;

CREATE TABLE `llx_element_element` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_source` int(11) NOT NULL,
  `sourcetype` varchar(32) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_element_idx1` (`fk_source`,`sourcetype`,`fk_target`,`targettype`),
  KEY `idx_element_element_fk_target` (`fk_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_element_element` WRITE;
/*!40000 ALTER TABLE `llx_element_element` DISABLE KEYS */;

INSERT INTO `llx_element_element` (`rowid`, `fk_source`, `sourcetype`, `fk_target`, `targettype`)
VALUES
	(1,1,'commande',2,'facture'),
	(2,2,'commande',4,'facture'),
	(3,3,'commande',6,'facture'),
	(4,4,'commande',8,'facture'),
	(5,5,'commande',10,'facture'),
	(6,6,'commande',12,'facture'),
	(7,6,'commande',14,'facture'),
	(8,7,'commande',16,'facture'),
	(9,8,'commande',18,'facture'),
	(10,9,'commande',20,'facture'),
	(11,10,'commande',22,'facture'),
	(12,11,'commande',24,'facture'),
	(13,12,'commande',26,'facture'),
	(14,13,'commande',28,'facture'),
	(15,14,'commande',30,'facture'),
	(16,15,'commande',32,'facture'),
	(19,15,'commande',38,'facture'),
	(17,16,'commande',34,'facture'),
	(18,17,'commande',36,'facture'),
	(20,18,'commande',40,'facture'),
	(21,23,'commande',42,'facture'),
	(22,24,'commande',44,'facture'),
	(23,25,'commande',46,'facture'),
	(24,27,'commande',48,'facture'),
	(26,27,'commande',52,'facture'),
	(25,28,'commande',50,'facture'),
	(27,33,'commande',54,'facture'),
	(28,36,'commande',56,'facture'),
	(29,37,'commande',58,'facture'),
	(30,38,'commande',60,'facture'),
	(31,40,'commande',62,'facture'),
	(32,41,'commande',64,'facture'),
	(33,42,'commande',66,'facture'),
	(34,43,'commande',68,'facture'),
	(35,45,'commande',70,'facture'),
	(36,46,'commande',72,'facture'),
	(37,47,'commande',74,'facture'),
	(38,50,'commande',76,'facture'),
	(39,50,'commande',78,'facture'),
	(40,51,'commande',83,'facture'),
	(41,52,'commande',85,'facture'),
	(42,53,'commande',87,'facture'),
	(43,54,'commande',89,'facture'),
	(44,55,'commande',91,'facture'),
	(45,55,'commande',93,'facture'),
	(46,57,'commande',95,'facture'),
	(47,57,'commande',97,'facture'),
	(48,58,'commande',98,'facture'),
	(49,59,'commande',100,'facture'),
	(50,60,'commande',102,'facture'),
	(51,62,'commande',104,'facture'),
	(52,63,'commande',106,'facture'),
	(53,64,'commande',108,'facture'),
	(54,65,'commande',110,'facture'),
	(55,66,'commande',112,'facture');

/*!40000 ALTER TABLE `llx_element_element` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_element_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_element_entity`;

CREATE TABLE `llx_element_entity` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `element_type` varchar(100) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `ux_element_entity` (`entity`,`fk_element`,`element_type`),
  KEY `idx_tk_fk_element_element_type` (`fk_element`,`element_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_element_lock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_element_lock`;

CREATE TABLE `llx_element_lock` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_element` int(11) NOT NULL,
  `elementtype` varchar(32) NOT NULL,
  `datel` datetime DEFAULT NULL,
  `datem` datetime DEFAULT NULL,
  `sessionid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_element_resources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_element_resources`;

CREATE TABLE `llx_element_resources` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(64) DEFAULT NULL,
  `element_id` int(11) DEFAULT NULL,
  `element_type` varchar(64) DEFAULT NULL,
  `busy` int(11) DEFAULT NULL,
  `mandatory` int(11) DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_resources_idx1` (`resource_id`,`resource_type`,`element_id`,`element_type`),
  KEY `idx_element_element_element_id` (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_element_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_element_tag`;

CREATE TABLE `llx_element_tag` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `lang` varchar(5) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `element` varchar(64) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_element_tag` (`entity`,`lang`,`tag`,`fk_element`,`element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_entity`;

CREATE TABLE `llx_entity` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` text,
  `slogan` text,
  `wynd_pay_id` varchar(255) NOT NULL,
  `external_id` varchar(40) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `options` text,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `country` int(11) NOT NULL DEFAULT '1',
  `currency` varchar(3) NOT NULL DEFAULT 'EUR',
  `town` varchar(100) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_complement` varchar(255) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `fax` varchar(12) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `capital` double(20,2) DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `code_rcs` varchar(25) DEFAULT NULL,
  `code_siret` varchar(15) DEFAULT NULL,
  `code_siren` varchar(10) DEFAULT NULL,
  `code_ape` varchar(6) DEFAULT NULL,
  `vat_number` varchar(20) DEFAULT NULL,
  `legal_form` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `wyndpay_brand_id` varchar(40) DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `is_applied` tinyint(1) DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_entity_fk_user_creat` (`fk_user_creat`),
  KEY `idx_entity_fk_user_creat_` (`fk_user_creat`) USING BTREE,
  KEY `FK_llx_entity_llx_c_pays_` (`country`) USING BTREE,
  KEY `FK_llx_entity_llx_c_currencies_` (`currency`) USING BTREE,
  CONSTRAINT `fk_entity_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `llx_entity_llx_wynd_countries` FOREIGN KEY (`country`) REFERENCES `llx_wynd_countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_entity` WRITE;
/*!40000 ALTER TABLE `llx_entity` DISABLE KEYS */;

INSERT INTO `llx_entity` (`rowid`, `tms`, `datec`, `name`, `label`, `description`, `slogan`, `wynd_pay_id`, `external_id`, `fk_user_creat`, `options`, `visible`, `active`, `country`, `currency`, `town`, `zip`, `address`, `address_complement`, `phone`, `fax`, `mail`, `website`, `photo`, `logo`, `capital`, `latitude`, `longitude`, `code_rcs`, `code_siret`, `code_siren`, `code_ape`, `vat_number`, `legal_form`, `slug`, `parent`, `wyndpay_brand_id`, `apply_date`, `is_applied`, `is_template`)
VALUES
	(1,'2017-08-11 17:41:01','2017-08-11 17:40:41','Foucher S.A.S.','Le plaisir de louer de manière efficace',NULL,NULL,'b1f696ad-cfa3-3830-8685-c45ff4a4ffda','551',NULL,NULL,1,1,1,'EUR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'master-entity',NULL,NULL,NULL,0,0),
	(2,'2017-08-11 17:41:01','2017-08-11 17:40:41','Leclercq S.A.R.L.','La possibilité de concrétiser vos projets de manière efficace',NULL,NULL,'555a3815-647f-3878-9a58-ec94da6daea2','93143',NULL,NULL,1,1,1,'EUR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48.86000000,2.34000000,NULL,NULL,NULL,NULL,NULL,NULL,'master-entity-1',1,NULL,NULL,0,0),
	(3,'2017-08-11 17:41:01','2017-08-11 17:40:41','Ollivier','L\'avantage de concrétiser vos projets autrement',NULL,NULL,'412465c3-934c-3bde-b300-de7eedae668e','17',NULL,NULL,1,1,1,'EUR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ollivier',1,NULL,NULL,0,0),
	(4,'2017-08-11 17:41:01','2017-08-11 17:40:41','Arnaud Marty SA','Le droit de rouler à l\'état pur',NULL,NULL,'29ea9bd4-a5b5-3ec8-ad09-9286dc9d0b13','28',NULL,NULL,1,1,1,'EUR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'arnaud-marty-sa',1,NULL,NULL,0,0),
	(5,'2017-08-11 17:41:01','2017-08-11 17:40:41','Sauvage','L\'assurance de concrétiser vos projets plus facilement',NULL,NULL,'28cf0078-da5b-34ea-bc83-0c02443a823a','570066',NULL,NULL,1,1,1,'EUR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sauvage',1,NULL,NULL,0,0);

/*!40000 ALTER TABLE `llx_entity` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_entity_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_entity_config`;

CREATE TABLE `llx_entity_config` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL,
  `has_stock_management` tinyint(1) NOT NULL,
  `has_negative_stock_sales` tinyint(1) NOT NULL,
  `has_customer_sharing` tinyint(1) NOT NULL,
  `creditnote_expiration_days` int(11) NOT NULL,
  `creditnote_text` text NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `fk_entity_2` (`entity`),
  KEY `fk_entity` (`entity`),
  CONSTRAINT `fk_entity_contrainte` FOREIGN KEY (`entity`) REFERENCES `llx_entity` (`rowid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_entity_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_entity_extrafields`;

CREATE TABLE `llx_entity_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `rest_compa` int(11) DEFAULT NULL,
  `monday_open_time` varchar(255) DEFAULT '7:00',
  `monday_close_time` varchar(255) DEFAULT '20:00',
  `tuesday_open_time` varchar(255) DEFAULT '7:00',
  `tuesday_close_time` varchar(255) DEFAULT '20:00',
  `wednesday_open_time` varchar(255) DEFAULT '7:00',
  `wednesday_close_time` varchar(255) DEFAULT '20:00',
  `thursday_open_time` varchar(255) DEFAULT '7:00',
  `thursday_close_time` varchar(255) DEFAULT '20:00',
  `friday_open_time` varchar(255) DEFAULT '7:00',
  `friday_close_time` varchar(255) DEFAULT '20:00',
  `saturday_open_time` varchar(255) DEFAULT '7:00',
  `saturday_close_time` varchar(255) DEFAULT '20:00',
  `sunday_open_time` varchar(255) DEFAULT '7:00',
  `sunday_close_time` varchar(255) DEFAULT '20:00',
  `phone` varchar(255) DEFAULT NULL,
  `service_restau` text,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  `responsable_mail` varchar(255) DEFAULT NULL,
  `slogan` text,
  `diet` text,
  `quartier` text,
  `thematic` text,
  `rayon` int(11) DEFAULT NULL,
  `url_backgound_img` varchar(255) DEFAULT NULL,
  `default_destination` text,
  `id_restaurant` varchar(255) DEFAULT NULL,
  `pubnub_channel` text,
  `wyndtapi_url` varchar(255) DEFAULT NULL,
  `merchant_id` varchar(255) NOT NULL,
  `geo_area` text,
  `minimum_amount_order` int(11) DEFAULT NULL,
  `maximum_amount_order` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_entity_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_entity_extrafields` DISABLE KEYS */;

INSERT INTO `llx_entity_extrafields` (`rowid`, `tms`, `fk_object`, `import_key`, `rest_compa`, `monday_open_time`, `monday_close_time`, `tuesday_open_time`, `tuesday_close_time`, `wednesday_open_time`, `wednesday_close_time`, `thursday_open_time`, `thursday_close_time`, `friday_open_time`, `friday_close_time`, `saturday_open_time`, `saturday_close_time`, `sunday_open_time`, `sunday_close_time`, `phone`, `service_restau`, `longitude`, `latitude`, `responsable`, `responsable_mail`, `slogan`, `diet`, `quartier`, `thematic`, `rayon`, `url_backgound_img`, `default_destination`, `id_restaurant`, `pubnub_channel`, `wyndtapi_url`, `merchant_id`, `geo_area`, `minimum_amount_order`, `maximum_amount_order`, `parent`)
VALUES
	(1,'2017-08-11 15:40:41',1,NULL,NULL,'7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','10:00','13:00',NULL,NULL,'+1008918082307',NULL,93.131923,-21.635408,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MERCHANTID_1',NULL,NULL,NULL,NULL),
	(2,'2017-08-11 15:40:41',2,NULL,NULL,'7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','10:00','13:00',NULL,NULL,'+2315340883883',NULL,72.697152,13.262308,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MERCHANTID_2',NULL,NULL,NULL,NULL),
	(3,'2017-08-11 15:40:41',3,NULL,NULL,'7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','10:00','13:00',NULL,NULL,'+4706219050090',NULL,63.330237,-62.472632,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MERCHANTID_3',NULL,NULL,NULL,NULL),
	(4,'2017-08-11 15:40:41',4,NULL,NULL,'7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','10:00','13:00',NULL,NULL,'+4706408050859',NULL,-74.420585,69.469577,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MERCHANTID_4',NULL,NULL,NULL,NULL),
	(5,'2017-08-11 15:40:41',5,NULL,NULL,'7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','7:00','20:00','10:00','13:00',NULL,NULL,'+9789308637277',NULL,44.409642,47.626663,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MERCHANTID_5',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `llx_entity_extrafields` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_entrepot
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_entrepot`;

CREATE TABLE `llx_entrepot` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(255) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `description` text,
  `lieu` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT '0',
  `statut` tinyint(4) DEFAULT '1',
  `valo_pmp` float(12,4) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_entrepot_label` (`label`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_event_element
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_event_element`;

CREATE TABLE `llx_event_element` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_source` int(11) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_events`;

CREATE TABLE `llx_events` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `dateevent` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_events_dateevent` (`dateevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_expedition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_expedition`;

CREATE TABLE `llx_expedition` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `ref_ext` varchar(30) DEFAULT NULL,
  `ref_int` varchar(30) DEFAULT NULL,
  `ref_customer` varchar(30) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_expedition` datetime DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expedition_uk_ref` (`ref`,`entity`),
  KEY `idx_expedition_fk_soc` (`fk_soc`),
  KEY `idx_expedition_fk_user_author` (`fk_user_author`),
  KEY `idx_expedition_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expedition_fk_shipping_method` (`fk_shipping_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_expeditiondet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_expeditiondet`;

CREATE TABLE `llx_expeditiondet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expedition` int(11) NOT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_fk_expedition` (`fk_expedition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_expeditiondet_batch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_expeditiondet_batch`;

CREATE TABLE `llx_expeditiondet_batch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expeditiondet` int(11) NOT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `batch` varchar(30) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `fk_origin_stock` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_expeditiondet` (`fk_expeditiondet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_export_compta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_export_compta`;

CREATE TABLE `llx_export_compta` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(12) NOT NULL,
  `date_export` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_export_model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_export_model`;

CREATE TABLE `llx_export_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `field` text NOT NULL,
  `filter` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_export_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_export_model` WRITE;
/*!40000 ALTER TABLE `llx_export_model` DISABLE KEYS */;

INSERT INTO `llx_export_model` (`rowid`, `fk_user`, `label`, `type`, `field`, `filter`)
VALUES
	(1,0,'Produits_Paul','produit_1','p.rowid,p.ref,p.label,p.description,p.url,p.accountancy_code_sell,p.accountancy_code_buy,p.note,p.length,p.surface,p.volume,p.weight,p.customcode,p.price_base_type,p.price,p.price_ttc,p.tva_tx,p.tosell,p.tobuy,p.datec,p.tms,p.stock,p.pmp,s.nom,pf.ref_fourn,pf.unitprice,extra.sentence_pos,extra.height_btn,extra.width_btn,extra.compo_txt,extra.prod_alegerne,extra.external_id,extra.label_pos,extra.tva_tx_takeaway,extra.price_ttc_takeaway,extra.date_start,extra.date_end,extra.color_button,extra.class_css,extra.label_button_fixe,extra.combo_plu,extra.plu_code,extra.division,extra.category_kvs,extra.category_piquick,extra.image_borne',NULL),
	(2,0,'listing_produit_test','produit_1','p.rowid,p.ref,p.label,extra.external_id',NULL);

/*!40000 ALTER TABLE `llx_export_model` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_extrafields`;

CREATE TABLE `llx_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `elementtype` varchar(64) NOT NULL DEFAULT 'member',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(255) NOT NULL,
  `type` varchar(8) DEFAULT NULL,
  `size` varchar(8) DEFAULT NULL,
  `fieldunique` int(11) DEFAULT '0',
  `fieldrequired` int(11) DEFAULT '0',
  `pos` int(11) DEFAULT '0',
  `param` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_extrafields_name` (`name`,`entity`,`elementtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_extrafields` DISABLE KEYS */;

INSERT INTO `llx_extrafields` (`rowid`, `name`, `entity`, `elementtype`, `tms`, `label`, `type`, `size`, `fieldunique`, `fieldrequired`, `pos`, `param`)
VALUES
	(1032141,'parent',0,'entity','2015-03-17 10:19:19','Entité parente','sellist','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:42:\"entity:label:rowid::visible=1 AND active=1\";N;}}'),
	(1032142,'order_ack',0,'commande','2015-03-17 10:19:19','Commande recus par un terminal','boolean','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(1032143,'order_ack_macadress',0,'commande','2015-03-17 10:19:19','Commande recus le(s) terminal/aux','chkbxlst','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:78:\"wyndterminal_device:mac_adress:rowid::mac_adress IS NOT NULL OR mac_adress<>\'\'\";N;}}'),
	(1032144,'wished_mode_pay',0,'facture','2014-10-27 14:30:36','Mode de paiement souhaité','sellist','',0,0,1,'a:1:{s:7:\"options\";a:1:{s:31:\"c_paiement:libelle:id::active=1\";N;}}'),
	(1032145,'wynd_offers',0,'commande','2014-12-29 08:41:51','Marketplace','sellist','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:31:\"wyndterminal_offers:label:rowid\";N;}}'),
	(103002545,'customer_login',0,'societe','2014-10-27 13:16:23','login','varchar','255',1,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002546,'customer_hashpassword',0,'societe','2014-10-27 13:16:31','password','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002557,'customer_fid_id',0,'societe','2014-10-27 13:16:31','Identifiant Fidélité','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002558,'order_dest',0,'commande','2014-10-27 14:30:36','Déstination','sellist','',0,0,1,'a:1:{s:7:\"options\";a:1:{s:43:\"takeaway_c_dest_order:label:rowid::active=1\";N;}}'),
	(103002559,'order_dest',0,'facture','2014-10-27 14:30:36','Déstination','sellist','',0,0,1,'a:1:{s:7:\"options\";a:1:{s:43:\"takeaway_c_dest_order:label:rowid::active=1\";N;}}'),
	(103002560,'user_takeaway',0,'user','2014-10-29 10:21:55','Utilisateur Restaurant','boolean','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002561,'payment_mode',0,'bank_account','2014-11-10 13:46:09','Mode de paiement','chkbxlst','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:33:\"c_paiement:libelle:code::active=1\";N;}}'),
	(103002562,'origin',0,'bank_account','2014-11-10 15:08:44','Origine','sellist','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:35:\"c_input_reason:label:code::active=1\";N;}}'),
	(103002563,'ip_adress',0,'bank_account','2014-11-10 15:16:54','adresse IP','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002564,'destination',0,'bank_account','2014-11-11 10:14:00','Destination','chkbxlst','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:42:\"takeaway_c_dest_order:label:code::active=1\";N;}}'),
	(103002571,'order_num_prefix',0,'bank_account','2014-11-10 15:16:54','num commande prefix','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002572,'order_num_nextnum',0,'bank_account','2014-11-10 15:16:54','next num commande','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002573,'original_json_order',0,'commande','2014-10-15 03:19:50','JSON source','text','2000',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002577,'dthr_delivery',0,'commande','2014-12-29 08:41:51','Date Heure livraison','datetime','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002578,'ord_sync',0,'commande','2015-01-06 08:07:55','Commande envoyé au restaurant','boolean','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002579,'dthr_delivery',0,'facture','2014-12-29 08:41:51','Date Heure livraison','datetime','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002584,'rest_compa',0,'entity','2014-10-15 03:19:50','Restaurant Companie','boolean','0',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002585,'customer_wyndpay_id',0,'societe','2014-10-27 13:16:31','Identifiant WyndPay','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002589,'biper_num',0,'commande','2014-10-15 03:19:50','Numerot de bipeur','varchar','10',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002590,'cashier_type',0,'bank_account','2014-10-15 03:19:50','Type de caisse','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:4:{s:7:\"primary\";s:14:\" Pas de tunnel\";s:7:\"assiste\";s:8:\" Assité\";s:12:\"semi_assiste\";s:19:\" Mode Semi-Assisté\";s:11:\"non_assiste\";s:18:\" Mode Non Assisté\";}}'),
	(103002592,'monday_open_time',0,'entity','2014-10-15 03:19:50','Horaire ouverture lundi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002593,'monday_close_time',0,'entity','2014-10-15 03:19:50','Horaire fermeture lundi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002594,'tuesday_open_time',0,'entity','2014-10-15 03:19:50','Horaire ouverture mardi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002595,'tuesday_close_time',0,'entity','2014-10-15 03:19:50','Horaire fermeture mardi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002596,'wednesday_open_time',0,'entity','2014-10-15 03:19:50','Horaire ouverture mercredi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002597,'wednesday_close_time',0,'entity','2014-10-15 03:19:50','Horaire fermeture mercredi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002598,'thursday_open_time',0,'entity','2014-10-15 03:19:50','Horaire ouverture jeudi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002599,'thursday_close_time',0,'entity','2014-10-15 03:19:50','Horaire fermeture jeudi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002600,'friday_open_time',0,'entity','2014-10-15 03:19:50','Horaire ouverture vendredi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002601,'friday_close_time',0,'entity','2014-10-15 03:19:50','Horaire fermeture vendredi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002602,'saturday_open_time',0,'entity','2014-10-15 03:19:50','Horaire ouverture samedi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002603,'saturday_close_time',0,'entity','2014-10-15 03:19:50','Horaire fermeture samedi','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002604,'sunday_open_time',0,'entity','2014-10-15 03:19:50','Horaire ouverture dimanche','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002605,'sunday_close_time',0,'entity','2014-10-15 03:19:50','Horaire fermeture dimanche','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002606,'phone',0,'entity','2014-10-15 03:19:50','Téléphone','phone','0',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002607,'service_restau',0,'entity','2014-11-10 13:46:09','Service proposé par le restaurant','chkbxlst','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:51:\"takeaway_c_dict_service_restau:label:code::active=1\";N;}}'),
	(103002608,'longitude',0,'entity','2014-10-15 03:19:50','Longitude','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002609,'latitude',0,'entity','2014-10-15 03:19:50','Latitude','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002610,'compo_txt',0,'product','2014-10-15 03:19:50','Description composition','text','2000',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002611,'responsable',0,'entity','2014-10-15 03:19:50','Responsable','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002612,'responsable_mail',0,'entity','2014-10-15 03:19:50','Mail Responsable','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002613,'prod_alegerne',0,'product','2014-10-15 03:19:50','Alergene','chkbxlst','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:49:\"takeaway_c_product_allergene:label:code::active=1\";N;}}'),
	(103002614,'slogan',0,'entity','2015-06-06 22:12:42','Slogan','text','2000',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002615,'diet',0,'entity','2015-06-06 22:13:03','Diet','text','2000',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002616,'quartier',0,'entity','2015-06-06 22:13:30','Quartier','text','2000',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002617,'thematic',0,'entity','2015-06-06 22:13:57','Thematic','text','2000',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002618,'rayon',0,'entity','2015-06-06 22:40:16','Rayon de livraison en km','int','10',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002619,'customer_token_life',0,'societe','2015-06-02 06:27:37','token life (reset password)','varchar','10',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002620,'customer_token',0,'societe','2015-06-04 05:54:56','token (reset password)','varchar','25',1,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002621,'customer_address_info',0,'societe','2015-06-04 05:55:03','complément adresse','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002622,'url_backgound_img',0,'entity','2014-10-15 03:19:50','Url Background Image','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002623,'sms_send',0,'commande','2015-08-19 23:38:53','Sms de confirmation envoyé ou non','boolean','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002624,'customer_on_site',0,'commande','2015-08-19 23:38:53','Client arrivé sur le parking','boolean','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002625,'review_send',0,'commande','2015-08-19 23:38:53','Questionnaire envoyé ou non','boolean','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002628,'external_id',0,'product','2015-12-19 18:39:11','ID Externe','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002647,'origin',0,'commande','2015-12-20 20:30:08','Origine','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002648,'order_start',0,'commande','2015-12-20 20:30:10','Date de début de prise de commande','datetime','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002649,'order_end',0,'commande','2015-12-20 20:30:13','Date de fin de prise de commande','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002651,'responsable',0,'facture','2015-12-20 20:30:15','Responsable','int','10',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002655,'external_ref',0,'product','2015-12-20 19:45:38','Ref Externe','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002656,'product_type',0,'product','2016-03-23 07:32:53','Type de produit','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002657,'export_json',1,'commande','2016-03-23 21:22:30','Export json','text','2000',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002658,'digicod',1,'socpeople','2016-03-24 09:43:05','Digicode','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002659,'floor',1,'socpeople','2016-03-24 09:43:15','Etage','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002660,'intercom',1,'socpeople','2016-03-24 09:43:27','Interphone','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002663,'exported_to_central',1,'commande','2016-03-30 09:55:12','Exportée vers le central','boolean','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002664,'category_kvs',1,'product','2016-03-31 15:04:07','Catégorie KVS','sellist','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:35:\"wynd_pos_kvs_categories:label:rowid\";N;}}'),
	(103002665,'id_restaurant',1,'entity','2016-03-31 13:44:14','ID restaurant','varchar','255',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002666,'external_export',0,'facture','2015-12-20 20:41:59','Exportée vers le tier','boolean','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002667,'external_export',0,'commande','2015-12-20 20:41:59','Exportée vers le tier','boolean','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002669,'division',1,'product','2016-04-15 01:55:36','Divsion','sellist','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:30:\"wynd_pos_divisions:label:rowid\";N;}}'),
	(103002670,'category_extern',1,'product','2016-04-15 01:59:16','Catégorie Externe','sellist','',0,0,0,'a:1:{s:7:\"options\";a:1:{s:36:\"wynd_pos_category_extern:label:rowid\";N;}}'),
	(103002671,'matricule',0,'user','2015-12-20 20:41:59','Matricule','varchar','11',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002672,'time_work',0,'user','2015-12-20 20:41:59','Contrat horaire','varchar','2',0,0,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}'),
	(103002673,'geo_area',1,'entity','2016-12-21 14:46:35','Zone géographique','select','',0,0,0,'a:1:{s:7:\"options\";a:2:{s:13:\"eurostar_area\";s:13:\"Zone Eurostar\";s:8:\"rer_area\";s:8:\"Zone RER\";}}');

/*!40000 ALTER TABLE `llx_extrafields` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_facture
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_facture`;

CREATE TABLE `llx_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `facnumber` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `increment` int(9) DEFAULT NULL,
  `fk_customer` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `paye` smallint(6) NOT NULL DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `close_code` varchar(16) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `revenuestamp` double(24,8) DEFAULT '0.00000000',
  `total` int(11) NOT NULL DEFAULT '0',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT '1',
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `uuid` char(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `bank_account_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `invoice_cancel_of` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_facture_uk_facnumber` (`facnumber`,`entity`,`increment`),
  KEY `idx_facture_fk_soc` (`fk_customer`),
  KEY `idx_facture_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fk_facture_source` (`fk_facture_source`),
  KEY `idx_facture_fk_projet` (`fk_projet`),
  KEY `idx_facture_fk_account` (`fk_account`),
  KEY `idx_facture_fk_currency` (`fk_currency`),
  KEY `llx_facture_llx_entity_rowid_fk` (`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_facture` WRITE;
/*!40000 ALTER TABLE `llx_facture` DISABLE KEYS */;

INSERT INTO `llx_facture` (`rowid`, `facnumber`, `entity`, `ref_ext`, `ref_int`, `ref_client`, `type`, `increment`, `fk_customer`, `datec`, `datef`, `date_valid`, `tms`, `paye`, `amount`, `remise_percent`, `remise_absolue`, `remise`, `close_code`, `close_note`, `tva`, `localtax1`, `localtax2`, `revenuestamp`, `total`, `total_ttc`, `fk_statut`, `fk_user_author`, `fk_user_valid`, `fk_facture_source`, `fk_projet`, `fk_account`, `fk_currency`, `fk_cond_reglement`, `fk_mode_reglement`, `date_lim_reglement`, `note_private`, `note_public`, `model_pdf`, `import_key`, `extraparams`, `uuid`, `user_id`, `channel_id`, `customer_id`, `bank_account_id`, `destination_id`, `billing_address_id`, `invoice_cancel_of`)
VALUES
	(1,'1-0000001',1,'CBCXYHUD','HTY3DIK4','4907',0,1,1,'1935-03-09 22:24:44','2017-07-27','2017-07-31','1991-12-10 02:24:28',0,67.21000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,15416,68.12000000,1,1,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6e6341f3-5b6e-4bf7-90db-9658353e1a7d',0,1,0,0,1,NULL,NULL),
	(2,'1-0000002',1,'3AYC31J2','3X75JECY','7895',0,2,1,'1960-12-06 15:07:45','2017-08-10','2017-07-16','0000-00-00 00:00:00',0,91.55000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,10148,60.20000000,1,1,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dc4f8889-7412-43bf-bdbe-ff73bb399600',0,1,0,0,1,NULL,NULL),
	(3,'1-0000003',3,'YQXKUZIZ','ZQREIZTR','6444',0,3,1,'1933-10-14 08:37:14','2017-07-24','2017-07-16','0000-00-00 00:00:00',0,24.77000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,4785,28.74000000,1,1,NULL,NULL,NULL,4,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'991fb9ae-3d3d-4514-80dd-78a7774bed03',0,1,0,0,1,NULL,NULL),
	(4,'1-0000004',1,'EABAFRO8','D2744RMU','3821',0,4,1,'1957-12-06 23:34:33','2017-08-09','2017-07-14','1971-01-16 07:04:57',0,165.81000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,19229,42.70000000,1,1,NULL,NULL,NULL,5,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4d806792-6b92-463a-b464-d80b5fa19d79',0,1,0,0,1,NULL,NULL),
	(5,'1-0000005',3,'Z2DJHPA8','TSPYPLK3','6269',0,5,1,'1974-11-20 20:59:45','2017-07-20','2017-07-13','0000-00-00 00:00:00',0,144.75000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,10776,156.27000000,1,1,NULL,NULL,NULL,3,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7708e4da-4533-4464-a7d0-92d13429c193',0,1,0,0,1,NULL,NULL),
	(6,'1-0000006',5,'CZF92IXL','TCR59SSJ','2868',0,6,1,'1996-04-25 16:43:03','2017-07-24','2017-07-18','2008-06-11 03:09:33',0,93.70000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,8650,42.26000000,1,1,NULL,NULL,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7b4da0fb-db5a-49f1-9a3b-459b6c1d40f5',0,1,0,0,1,NULL,NULL),
	(7,'1-0000007',4,'EBLWA2Q9','MT5N64K7','3245',0,7,1,'1999-09-05 13:00:18','2017-07-21','2017-07-18','1994-07-22 15:25:41',0,191.75000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,1272,53.29000000,1,1,NULL,NULL,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'c2efa5c2-7b54-4639-8be0-ab16e4bfe9cf',0,1,0,0,1,NULL,NULL),
	(8,'1-0000008',3,'8N10RCHI','9UXN1SOZ','1145',0,8,1,'1931-01-27 18:24:06','2017-07-16','2017-07-14','0000-00-00 00:00:00',0,133.70000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,6078,123.07000000,1,1,NULL,NULL,NULL,5,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'794fc7a5-eac9-4c5a-b34c-bd8845f0817d',0,1,0,0,1,NULL,NULL),
	(9,'1-0000009',4,'TM3B6KSB','R219OL5G','5318',0,9,1,'1962-05-01 06:33:19','2017-08-06','2017-08-06','0000-00-00 00:00:00',0,59.18000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,3249,128.40000000,1,1,NULL,NULL,NULL,4,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2a98d435-c55c-4347-a414-e1e06fe99059',0,1,0,0,1,NULL,NULL),
	(10,'1-00000010',1,'VLCYD1VA','DWRQEMNI','2740',0,10,1,'1935-12-03 08:15:21','2017-08-06','2017-07-25','1988-03-01 17:09:36',0,97.28000000,0,0,0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,8765,112.81000000,1,1,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ce6be95c-fe50-4518-954c-bafb918c3092',0,1,0,0,1,NULL,NULL);

/*!40000 ALTER TABLE `llx_facture` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_facture_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_facture_extrafields`;

CREATE TABLE `llx_facture_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `order_dest` text,
  `dthr_delivery` datetime DEFAULT NULL,
  `wished_mode_pay` varchar(255) DEFAULT NULL,
  `responsable` int(10) DEFAULT NULL,
  `external_export` int(1) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_facture_fourn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_facture_fourn`;

CREATE TABLE `llx_facture_fourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `ref_supplier` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(30) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `libelle` varchar(255) DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double(24,8) DEFAULT '0.00000000',
  `close_code` varchar(16) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_ref_supplier` (`ref_supplier`,`fk_soc`,`entity`),
  UNIQUE KEY `uk_facture_fourn_ref` (`ref`,`entity`),
  KEY `idx_facture_fourn_date_lim_reglement` (`date_lim_reglement`),
  KEY `idx_facture_fourn_fk_soc` (`fk_soc`),
  KEY `idx_facture_fourn_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fourn_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fourn_fk_projet` (`fk_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_facture_fourn_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_facture_fourn_det`;

CREATE TABLE `llx_facture_fourn_det` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture_fourn` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `fk_code_ventilation` int(11) NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_det_fk_facture` (`fk_facture_fourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_facture_fourn_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_facture_fourn_extrafields`;

CREATE TABLE `llx_facture_fourn_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_facture_rec
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_facture_rec`;

CREATE TABLE `llx_facture_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT '0',
  `fk_mode_reglement` int(11) DEFAULT '0',
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `usenewprice` int(11) DEFAULT '0',
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'd',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_facture_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_facture_rec_fk_soc` (`fk_soc`),
  KEY `idx_facture_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_rec_fk_projet` (`fk_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_facturedet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_facturedet`;

CREATE TABLE `llx_facturedet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` varchar(255) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `fk_remise_except` int(11) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `price` varchar(20) DEFAULT '0',
  `total_ht` varchar(20) DEFAULT '0',
  `total_tva` varchar(20) DEFAULT '0',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` varchar(20) DEFAULT '0',
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT '0',
  `special_code` int(10) unsigned DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `discount_code` varchar(50) DEFAULT NULL,
  `discount_label` varchar(100) DEFAULT NULL,
  `payable` int(1) NOT NULL DEFAULT '0',
  `uuid` char(100) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture`),
  KEY `idx_facturedet_fk_facture` (`fk_facture`),
  KEY `idx_facturedet_fk_product` (`fk_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_facturedet` WRITE;
/*!40000 ALTER TABLE `llx_facturedet` DISABLE KEYS */;

INSERT INTO `llx_facturedet` (`rowid`, `fk_facture`, `fk_parent_line`, `fk_product`, `label`, `description`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `qty`, `remise_percent`, `remise`, `fk_remise_except`, `subprice`, `price`, `total_ht`, `total_tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `date_start`, `date_end`, `info_bits`, `buy_price_ht`, `fk_product_fournisseur_price`, `fk_code_ventilation`, `special_code`, `rang`, `import_key`, `discount_id`, `discount_code`, `discount_label`, `payable`, `uuid`)
VALUES
	(1,4,NULL,4,'hic','Array',5.500,0.000,NULL,0.000,NULL,10,0,0,NULL,NULL,'16698','15680','4922',0.00000000,0.00000000,'16770',0,'2017-07-18 13:48:26',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'f985b39c-268b-4219-bce6-578a4d22b7e6'),
	(2,3,NULL,3,'omnis','Array',20.000,0.000,NULL,0.000,NULL,1,0,0,NULL,NULL,'14537','19456','15454',0.00000000,0.00000000,'9396',0,'2017-07-29 16:47:58',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'652359e4-3a88-4836-b28e-bd82a3ed94d4'),
	(3,4,NULL,2,'quos','Array',5.500,0.000,NULL,0.000,NULL,1,0,0,NULL,NULL,'10643','14927','4795',0.00000000,0.00000000,'18817',0,'2017-07-30 23:07:29',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'2d1c92bf-b721-4fef-bd42-b2e68042e9dc'),
	(4,8,NULL,8,'laudantium','Array',5.500,0.000,NULL,0.000,NULL,1,0,0,NULL,NULL,'17104','11315','7090',0.00000000,0.00000000,'2518',0,'2017-07-21 19:54:55',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'652bae13-071e-4045-b828-7049bd82c727'),
	(5,1,NULL,4,'totam','Array',5.500,0.000,NULL,0.000,NULL,10,0,0,NULL,NULL,'13306','4692','16613',0.00000000,0.00000000,'6341',0,'2017-07-31 12:12:48',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'58647b7c-151a-44c2-9044-4392d774a73c'),
	(6,3,NULL,10,'natus','Array',20.000,0.000,NULL,0.000,NULL,1,0,0,NULL,NULL,'13831','7096','1408',0.00000000,0.00000000,'18820',0,'2017-07-19 21:32:27',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'2801333e-a339-440d-b58e-c3b6610dde28'),
	(7,6,NULL,10,'non','Array',5.500,0.000,NULL,0.000,NULL,6,0,0,NULL,NULL,'9640','14500','7656',0.00000000,0.00000000,'18693',0,'2017-07-27 12:04:21',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'200b408e-8d64-4fbf-960d-2d46c9aff872'),
	(8,7,NULL,4,'qui','Array',10.000,0.000,NULL,0.000,NULL,8,0,0,NULL,NULL,'10083','19954','8511',0.00000000,0.00000000,'12197',0,'2017-07-28 05:19:23',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'cc6e1036-ff2e-4d7a-acbd-288045b8de0b'),
	(9,2,NULL,5,'maxime','Array',5.500,0.000,NULL,0.000,NULL,1,0,0,NULL,NULL,'10639','697','2719',0.00000000,0.00000000,'2183',0,'2017-08-04 22:46:57',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'c80de5fb-0993-41aa-818b-aadc2fa879c7'),
	(10,10,NULL,8,'voluptates','Array',5.500,0.000,NULL,0.000,NULL,10,0,0,NULL,NULL,'18783','2646','16521',0.00000000,0.00000000,'19027',0,'2017-08-06 01:09:55',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'3242601b-b1c8-432d-af2f-a4145f9769c4'),
	(11,10,NULL,2,'at','Array',5.500,0.000,NULL,0.000,NULL,7,0,0,NULL,NULL,'6193','16751','18690',0.00000000,0.00000000,'11387',0,'2017-08-11 09:43:39',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'94337357-b224-4bb5-b77f-38be18afc420'),
	(12,10,NULL,3,'ipsa','Array',20.000,0.000,NULL,0.000,NULL,7,0,0,NULL,NULL,'2847','14494','18307',0.00000000,0.00000000,'16051',0,'2017-08-10 23:55:06',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'f08f2b07-6d4d-4bc0-a6b8-799b3064d30b'),
	(13,2,NULL,6,'qui','Array',10.000,0.000,NULL,0.000,NULL,2,0,0,NULL,NULL,'12491','2481','8582',0.00000000,0.00000000,'11995',0,'2017-08-10 05:26:44',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'2a27ee97-3406-41ee-a8ad-e5deda6e079c'),
	(14,8,NULL,1,'eaque','Array',10.000,0.000,NULL,0.000,NULL,3,0,0,NULL,NULL,'17035','13954','7330',0.00000000,0.00000000,'16211',0,'2017-07-27 07:58:53',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'dfd00adf-56aa-4308-924a-329fc1c59a87'),
	(15,10,NULL,3,'autem','Array',20.000,0.000,NULL,0.000,NULL,7,0,0,NULL,NULL,'18291','8356','19713',0.00000000,0.00000000,'1372',0,'2017-08-02 02:02:37',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'2adc6799-36c0-4a67-b1e8-3f41c2234fb3'),
	(16,4,NULL,5,'quisquam','Array',5.500,0.000,NULL,0.000,NULL,5,0,0,NULL,NULL,'11181','13349','17508',0.00000000,0.00000000,'3929',0,'2017-07-31 03:19:55',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'6e5ee10c-088f-4990-8c9b-113dd00fdf8a'),
	(17,10,NULL,8,'tempora','Array',5.500,0.000,NULL,0.000,NULL,10,0,0,NULL,NULL,'1292','15889','18225',0.00000000,0.00000000,'2202',0,'2017-07-11 18:17:12',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'e4195d1c-e53b-4043-ac83-9d8333d20dc6'),
	(18,1,NULL,1,'repellat','Array',5.500,0.000,NULL,0.000,NULL,3,0,0,NULL,NULL,'6021','3847','4359',0.00000000,0.00000000,'1431',0,'2017-08-01 19:27:28',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'e8281f21-f853-4c3c-a935-81ff5464cbee'),
	(19,8,NULL,10,'illum','Array',10.000,0.000,NULL,0.000,NULL,4,0,0,NULL,NULL,'5305','4052','15091',0.00000000,0.00000000,'15164',0,'2017-07-26 01:48:21',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'0262ded5-4683-4959-a746-3ead88fab139'),
	(20,3,NULL,8,'aliquam','Array',20.000,0.000,NULL,0.000,NULL,2,0,0,NULL,NULL,'1108','11214','9380',0.00000000,0.00000000,'18847',0,'2017-07-22 22:41:18',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'0f636af3-fb80-477c-a84b-cf47c12da08f'),
	(21,10,NULL,6,'ipsa','Array',20.000,0.000,NULL,0.000,NULL,6,0,0,NULL,NULL,'1192','11743','5393',0.00000000,0.00000000,'16126',0,'2017-07-21 18:48:48',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'646f4c1b-d6f3-4bff-9cb6-78bacdba0e3d'),
	(22,7,NULL,3,'ea','Array',10.000,0.000,NULL,0.000,NULL,4,0,0,NULL,NULL,'2758','5433','7057',0.00000000,0.00000000,'16220',0,'2017-08-01 06:10:34',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'6efcd9df-419d-474e-a263-71f45f566c3b'),
	(23,8,NULL,10,'consequatur','Array',5.500,0.000,NULL,0.000,NULL,1,0,0,NULL,NULL,'14164','17631','12710',0.00000000,0.00000000,'19909',0,'2017-08-08 07:05:19',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'0525e282-c810-42f1-847b-56d8d6915a2f'),
	(24,8,NULL,8,'officiis','Array',10.000,0.000,NULL,0.000,NULL,8,0,0,NULL,NULL,'15681','9269','16860',0.00000000,0.00000000,'13721',0,'2017-07-25 18:08:18',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'9806f058-6f29-49f8-a01e-5f1118f3e814'),
	(25,10,NULL,8,'dignissimos','Array',20.000,0.000,NULL,0.000,NULL,3,0,0,NULL,NULL,'7285','18315','7738',0.00000000,0.00000000,'10599',0,'2017-08-03 22:04:06',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'fbed3739-1e76-4085-80cd-27648bfe47f0'),
	(26,6,NULL,3,'corporis','Array',20.000,0.000,NULL,0.000,NULL,2,0,0,NULL,NULL,'5275','3597','8991',0.00000000,0.00000000,'4715',0,'2017-07-18 00:52:33',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'b6d0323e-e421-4001-bf46-b596744caa9e'),
	(27,8,NULL,3,'delectus','Array',10.000,0.000,NULL,0.000,NULL,9,0,0,NULL,NULL,'15514','13644','8818',0.00000000,0.00000000,'4519',0,'2017-07-20 00:36:58',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'f857e756-103d-4853-bf28-5e37e4474510'),
	(28,3,NULL,7,'omnis','Array',10.000,0.000,NULL,0.000,NULL,6,0,0,NULL,NULL,'5586','15378','17158',0.00000000,0.00000000,'7125',0,'2017-08-05 02:28:22',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'98648d0b-c374-4647-a8ca-7c51d4f61e74'),
	(29,8,NULL,10,'eaque','Array',5.500,0.000,NULL,0.000,NULL,10,0,0,NULL,NULL,'3536','11841','6426',0.00000000,0.00000000,'16160',0,'2017-07-23 21:58:00',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'f27337c5-172f-4467-a09a-2e4c4eaba9d3'),
	(30,7,NULL,2,'hic','Array',5.500,0.000,NULL,0.000,NULL,5,0,0,NULL,NULL,'14904','5917','13736',0.00000000,0.00000000,'2334',0,'2017-08-04 17:58:42',NULL,0,0.00000000,NULL,0,0,0,NULL,NULL,NULL,NULL,0,'33a106fa-b266-4f37-95d1-2bae3456fe73');

/*!40000 ALTER TABLE `llx_facturedet` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_facturedet_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_facturedet_extrafields`;

CREATE TABLE `llx_facturedet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facturedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_facturedet_rec
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_facturedet_rec`;

CREATE TABLE `llx_facturedet_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `product_type` int(11) DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `tva_tx` double(6,3) DEFAULT '19.600',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `special_code` int(10) unsigned DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_fichinter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_fichinter`;

CREATE TABLE `llx_fichinter` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT '0',
  `fk_contrat` int(11) DEFAULT '0',
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `datei` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `duree` double DEFAULT NULL,
  `description` text,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fichinter_ref` (`ref`,`entity`),
  KEY `idx_fichinter_fk_soc` (`fk_soc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_fichinter_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_fichinter_extrafields`;

CREATE TABLE `llx_fichinter_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ficheinter_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_fichinterdet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_fichinterdet`;

CREATE TABLE `llx_fichinterdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int(11) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_fichinterdet_fk_fichinter` (`fk_fichinter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_holiday
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_holiday`;

CREATE TABLE `llx_holiday` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `date_create` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `halfday` int(11) DEFAULT '0',
  `statut` int(11) NOT NULL DEFAULT '1',
  `fk_validator` int(11) NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `detail_refuse` varchar(250) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_fk_user` (`fk_user`),
  KEY `idx_holiday_fk_user_create` (`fk_user_create`),
  KEY `idx_holiday_date_create` (`date_create`),
  KEY `idx_holiday_date_debut` (`date_debut`),
  KEY `idx_holiday_date_fin` (`date_fin`),
  KEY `idx_holiday_fk_validator` (`fk_validator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_holiday_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_holiday_config`;

CREATE TABLE `llx_holiday_config` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_holiday_config` WRITE;
/*!40000 ALTER TABLE `llx_holiday_config` DISABLE KEYS */;

INSERT INTO `llx_holiday_config` (`rowid`, `name`, `value`)
VALUES
	(1,'userGroup',NULL),
	(2,'lastUpdate',NULL),
	(3,'nbUser',NULL),
	(4,'delayForRequest','31'),
	(5,'AlertValidatorDelay','0'),
	(6,'AlertValidatorSolde','0'),
	(7,'nbHolidayDeducted','1'),
	(8,'nbHolidayEveryMonth','2.08334');

/*!40000 ALTER TABLE `llx_holiday_config` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_holiday_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_holiday_events`;

CREATE TABLE `llx_holiday_events` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_holiday_name` (`name`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_holiday_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_holiday_logs`;

CREATE TABLE `llx_holiday_logs` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_action` datetime NOT NULL,
  `fk_user_action` int(11) NOT NULL,
  `fk_user_update` int(11) NOT NULL,
  `type_action` varchar(255) NOT NULL,
  `prev_solde` varchar(255) NOT NULL,
  `new_solde` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_holiday_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_holiday_users`;

CREATE TABLE `llx_holiday_users` (
  `fk_user` int(11) NOT NULL,
  `nb_holiday` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_import_model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_import_model`;

CREATE TABLE `llx_import_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `field` text NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_import_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_inventory_wynd_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_inventory_wynd_stock`;

CREATE TABLE `llx_inventory_wynd_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_type_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inventory_stock_stock_type_id` (`stock_type_id`),
  KEY `fk_inventory_stock_warehouse_id` (`warehouse_id`),
  KEY `fk_inventory_stock_product_id` (`product_id`),
  CONSTRAINT `fk_inventory_stock_product_id` FOREIGN KEY (`product_id`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_inventory_stock_stock_type_id` FOREIGN KEY (`stock_type_id`) REFERENCES `llx_inventory_wynd_stock_types` (`id`),
  CONSTRAINT `fk_inventory_stock_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `llx_inventory_wynd_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_inventory_wynd_stock` WRITE;
/*!40000 ALTER TABLE `llx_inventory_wynd_stock` DISABLE KEYS */;

INSERT INTO `llx_inventory_wynd_stock` (`id`, `stock_type_id`, `warehouse_id`, `product_id`, `quantity`, `unit`)
VALUES
	(1,1,1,1,100,'PEC'),
	(2,3,1,1,10,'PEC'),
	(3,1,1,2,100,'PEC'),
	(4,3,1,2,10,'PEC'),
	(5,4,4,3,14,'PEC'),
	(6,4,4,3,12,'PEC'),
	(7,4,4,3,31,'PEC'),
	(8,4,4,3,50,'PEC'),
	(9,4,4,3,75,'PEC'),
	(10,4,4,3,25,'PEC'),
	(11,1,1,4,-25,'PEC'),
	(12,2,2,4,25,'PEC');

/*!40000 ALTER TABLE `llx_inventory_wynd_stock` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_inventory_wynd_stock_movement_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_inventory_wynd_stock_movement_types`;

CREATE TABLE `llx_inventory_wynd_stock_movement_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_inventory_wynd_stock_movement_types` WRITE;
/*!40000 ALTER TABLE `llx_inventory_wynd_stock_movement_types` DISABLE KEYS */;

INSERT INTO `llx_inventory_wynd_stock_movement_types` (`id`, `label`)
VALUES
	(1,'Goods receipt'),
	(2,'Goods issue'),
	(3,'Transfer'),
	(4,'Returns'),
	(5,'Inventory difference'),
	(6,'Initial stock entry');

/*!40000 ALTER TABLE `llx_inventory_wynd_stock_movement_types` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_inventory_wynd_stock_movements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_inventory_wynd_stock_movements`;

CREATE TABLE `llx_inventory_wynd_stock_movements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_type_from_id` int(11) DEFAULT NULL,
  `stock_type_to_id` int(11) DEFAULT NULL,
  `warehouse_from_id` int(11) DEFAULT NULL,
  `warehouse_to_id` int(11) DEFAULT NULL,
  `movement_type_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `unit` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_movements_stock_type_from_id` (`stock_type_from_id`),
  KEY `fk_stock_movements_stock_type_to_id` (`stock_type_to_id`),
  KEY `fk_stock_movements_warehouse_from_id` (`warehouse_from_id`),
  KEY `fk_stock_movements_warehouse_to_id` (`warehouse_to_id`),
  KEY `fk_stock_movements_movement_type_id` (`movement_type_id`),
  KEY `fk_stock_movements_product_id` (`product_id`),
  KEY `fk_stock_movements_user_id` (`user_id`),
  CONSTRAINT `fk_stock_movements_movement_type_id` FOREIGN KEY (`movement_type_id`) REFERENCES `llx_inventory_wynd_stock_movement_types` (`id`),
  CONSTRAINT `fk_stock_movements_product_id` FOREIGN KEY (`product_id`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_stock_movements_stock_type_from_id` FOREIGN KEY (`stock_type_from_id`) REFERENCES `llx_inventory_wynd_stock_types` (`id`),
  CONSTRAINT `fk_stock_movements_stock_type_to_id` FOREIGN KEY (`stock_type_to_id`) REFERENCES `llx_inventory_wynd_stock_types` (`id`),
  CONSTRAINT `fk_stock_movements_user_id` FOREIGN KEY (`user_id`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_stock_movements_warehouse_from_id` FOREIGN KEY (`warehouse_from_id`) REFERENCES `llx_inventory_wynd_warehouse` (`id`),
  CONSTRAINT `fk_stock_movements_warehouse_to_id` FOREIGN KEY (`warehouse_to_id`) REFERENCES `llx_inventory_wynd_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_inventory_wynd_stock_movements` WRITE;
/*!40000 ALTER TABLE `llx_inventory_wynd_stock_movements` DISABLE KEYS */;

INSERT INTO `llx_inventory_wynd_stock_movements` (`id`, `stock_type_from_id`, `stock_type_to_id`, `warehouse_from_id`, `warehouse_to_id`, `movement_type_id`, `product_id`, `user_id`, `quantity`, `unit`, `comment`, `datec`, `tms`)
VALUES
	(1,1,2,1,2,1,4,1,5,'PEC','Explicabo voluptas et et omnis.','2017-07-07 00:00:00','2017-08-11 17:40:53'),
	(2,1,2,1,2,1,4,1,5,'PEC','Quaerat laborum autem qui suscipit vel aut.','2017-07-07 00:00:00','2017-08-11 17:40:53'),
	(3,1,2,1,2,1,4,1,5,'PEC','Corrupti itaque ipsa tenetur.','2017-07-07 00:00:00','2017-08-11 17:40:53'),
	(4,1,2,1,2,1,4,1,5,'PEC','Consequatur consequatur perspiciatis animi ab assumenda.','2017-07-10 00:00:00','2017-08-11 17:40:53'),
	(5,1,2,1,2,1,4,1,5,'PEC','Nihil atque blanditiis labore maxime explicabo assumenda.','2017-07-10 00:00:00','2017-08-11 17:40:53');

/*!40000 ALTER TABLE `llx_inventory_wynd_stock_movements` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_inventory_wynd_stock_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_inventory_wynd_stock_types`;

CREATE TABLE `llx_inventory_wynd_stock_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_inventory_wynd_stock_types` WRITE;
/*!40000 ALTER TABLE `llx_inventory_wynd_stock_types` DISABLE KEYS */;

INSERT INTO `llx_inventory_wynd_stock_types` (`id`, `label`)
VALUES
	(1,'Unrestricted use'),
	(2,'Quality control'),
	(3,'Blocked'),
	(4,'In transit');

/*!40000 ALTER TABLE `llx_inventory_wynd_stock_types` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_inventory_wynd_warehouse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_inventory_wynd_warehouse`;

CREATE TABLE `llx_inventory_wynd_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `entity_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_warehouse_parent_id` (`parent_id`),
  KEY `fk_warehouse_entity_id` (`entity_id`),
  KEY `llx_wynd_warehouse_llx_entity_rowid_fk_entity` (`entity_id`),
  CONSTRAINT `fk_warehouse_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `llx_entity` (`rowid`),
  CONSTRAINT `fk_warehouse_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `llx_inventory_wynd_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_inventory_wynd_warehouse` WRITE;
/*!40000 ALTER TABLE `llx_inventory_wynd_warehouse` DISABLE KEYS */;

INSERT INTO `llx_inventory_wynd_warehouse` (`id`, `parent_id`, `entity_id`, `label`, `barcode`)
VALUES
	(1,NULL,1,'est','9780653523491'),
	(2,1,1,'laboriosam','9781054376693'),
	(3,1,1,'omnis','9785125181506'),
	(4,1,1,'similique','9785052915359'),
	(5,1,1,'beatae','9786642172299'),
	(6,1,1,'itaque','9781133419242'),
	(7,1,2,'ea','9787894455895'),
	(8,1,2,'qui','9786074677218'),
	(9,1,2,'et','9796775468510'),
	(10,1,2,'eius','9792155906870'),
	(11,1,2,'quam','9795809089684');

/*!40000 ALTER TABLE `llx_inventory_wynd_warehouse` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_links`;

CREATE TABLE `llx_links` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datea` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `objecttype` varchar(255) NOT NULL,
  `objectid` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_livraison
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_livraison`;

CREATE TABLE `llx_livraison` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `ref_ext` varchar(30) DEFAULT NULL,
  `ref_int` varchar(30) DEFAULT NULL,
  `ref_customer` varchar(30) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` date DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_livraison_uk_ref` (`ref`,`entity`),
  KEY `idx_livraison_fk_soc` (`fk_soc`),
  KEY `idx_livraison_fk_user_author` (`fk_user_author`),
  KEY `idx_livraison_fk_user_valid` (`fk_user_valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_livraisondet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_livraisondet`;

CREATE TABLE `llx_livraisondet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_livraison` int(11) DEFAULT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text,
  `qty` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_livraisondet_fk_expedition` (`fk_livraison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_localtax
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_localtax`;

CREATE TABLE `llx_localtax` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_mailing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_mailing`;

CREATE TABLE `llx_mailing` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `statut` smallint(6) DEFAULT '0',
  `titre` varchar(60) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `sujet` varchar(60) DEFAULT NULL,
  `body` mediumtext,
  `bgcolor` varchar(8) DEFAULT NULL,
  `bgimage` varchar(255) DEFAULT NULL,
  `cible` varchar(60) DEFAULT NULL,
  `nbemail` int(11) DEFAULT NULL,
  `email_from` varchar(160) DEFAULT NULL,
  `email_replyto` varchar(160) DEFAULT NULL,
  `email_errorsto` varchar(160) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_appro` datetime DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_appro` int(11) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `joined_file1` varchar(255) DEFAULT NULL,
  `joined_file2` varchar(255) DEFAULT NULL,
  `joined_file3` varchar(255) DEFAULT NULL,
  `joined_file4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_mailing_cibles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_mailing_cibles`;

CREATE TABLE `llx_mailing_cibles` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_mailing` int(11) NOT NULL,
  `fk_contact` int(11) NOT NULL,
  `lastname` varchar(160) DEFAULT NULL,
  `firstname` varchar(160) DEFAULT NULL,
  `email` varchar(160) NOT NULL,
  `other` varchar(255) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `source_url` varchar(160) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(16) DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing_cibles` (`fk_mailing`,`email`),
  KEY `idx_mailing_cibles_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_menu`;

CREATE TABLE `llx_menu` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `menu_handler` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `module` varchar(64) DEFAULT NULL,
  `type` varchar(4) NOT NULL,
  `mainmenu` varchar(100) NOT NULL,
  `leftmenu` varchar(100) DEFAULT NULL,
  `fk_menu` int(11) NOT NULL,
  `fk_mainmenu` varchar(24) DEFAULT NULL,
  `fk_leftmenu` varchar(24) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(100) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `langs` varchar(100) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `perms` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT '1',
  `usertype` int(11) NOT NULL DEFAULT '0',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `icon` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_menu_uk_menu` (`menu_handler`,`fk_menu`,`position`,`url`,`entity`),
  KEY `idx_menu_menuhandler_type` (`menu_handler`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_menu` WRITE;
/*!40000 ALTER TABLE `llx_menu` DISABLE KEYS */;

INSERT INTO `llx_menu` (`rowid`, `menu_handler`, `entity`, `module`, `type`, `mainmenu`, `leftmenu`, `fk_menu`, `fk_mainmenu`, `fk_leftmenu`, `position`, `url`, `target`, `titre`, `langs`, `level`, `perms`, `enabled`, `usertype`, `tms`, `icon`)
VALUES
	(1,'all',0,'takeaway','top','takeaway',NULL,0,NULL,NULL,100,'/takeaway/index.php','','Module10300254Name','takeaway@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(2,'all',0,'takeaway','left','takeaway','report',-1,'takeaway',NULL,101,'/takeaway/reports/stats_central.php','','Report','takeaway@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(3,'all',0,'takeaway','left','takeaway',NULL,-1,'takeaway','report',102,'/takeaway/reports/stats_central.php','','Report','takeaway@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(4,'all',0,'takeaway','left','takeaway',NULL,-1,'takeaway','report',103,'/takeaway/reports/stats_central_resto.php','','Rapport par Restaurant','takeaway@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(5,'all',0,'takeaway','left','takeaway',NULL,-1,'takeaway','report',104,'/compta/facture/stats/index.php','','Rapport Facturation','takeaway@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(6,'all',0,'takeaway','left','takeaway',NULL,-1,'takeaway','report',105,'/compta/stats/cabyprodserv.php?modecompta=CREANCES-DETTES','','Rapport produit detaillé','takeaway@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(7,'all',0,'takeaway','left','takeaway',NULL,-1,'takeaway','report',106,'/takeaway/reports/rentabilite.php','','TkReportRenta','takeaway@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(8,'all',0,'takeaway','left','takeaway','pricelist',-1,'takeaway',NULL,107,'/takeaway/pricelist/list.php','','PriceList','pricelist@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(9,'all',0,'takeaway','left','takeaway',NULL,-1,'takeaway','pricelist',108,'/takeaway/pricelist/list.php','','List','pricelist@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(10,'all',0,'takeaway','left','takeaway',NULL,-1,'takeaway','pricelist',109,'/takeaway/pricelist/card.php?action=create','','Create','pricelist@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(11,'all',0,'takeaway','left','takeaway',NULL,-1,'takeaway','pricelist',110,'/takeaway/pricelist/apply.php','','TkApply','pricelist@takeaway',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(12,'all',0,'takeaway','left','takeaway',NULL,-1,'takeaway',NULL,111,'/takeaway/restaurant/restaurant.php','','TkRestaurant','takeway@takeaway',NULL,'1','$conf->entity!=1',0,'2016-12-08 16:35:12',NULL),
	(13,'all',0,'wyndterminal','top','wyndterminal',NULL,0,NULL,NULL,100,'/wyndterminal/wyndterminal/device/list.php','','Module103214Name','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(14,'all',0,'wyndterminal','left','wyndterminal','device',-1,'wyndterminal',NULL,101,'/wyndterminal/wyndterminal/device/list.php','','WTDevice','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(15,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','device',102,'/wyndterminal/wyndterminal/device/list.php','','WTList','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(16,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','device',103,'/wyndterminal/wyndterminal/device/card.php?action=create','','WTCreate','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(17,'all',0,'wyndterminal','left','wyndterminal','offers',-1,'wyndterminal',NULL,104,'/wyndterminal/wyndterminal/offers/list.php','','WTOffers','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(18,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','offers',105,'/wyndterminal/wyndterminal/offers/list.php','','WTList','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(19,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','offers',106,'/wyndterminal/wyndterminal/offers/card.php?action=create','','WTCreate','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(20,'all',0,'wyndterminal','left','wyndterminal','cgv',-1,'wyndterminal',NULL,107,'/wyndterminal/wyndterminal/cgv/list.php','','WTCgv','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(21,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','cgv',108,'/wyndterminal/wyndterminal/cgv/list.php','','WTList','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(22,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','cgv',109,'/wyndterminal/wyndterminal/cgv/card.php?action=create','','WTCreate','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(23,'all',0,'wyndterminal','left','wyndterminal','dayorder',-1,'wyndterminal',NULL,110,'/wyndterminal/wyndterminal/dayorder/list.php','','WTDayOrder','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(24,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','dayorder',111,'/wyndterminal/wyndterminal/dayorder/list.php','','WTList','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(25,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','dayorder',112,'/wyndterminal/wyndterminal/dayorder/card.php?action=create','','WTCreate','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(26,'all',0,'wyndterminal','left','wyndterminal','sav',-1,'wyndterminal',NULL,113,'/wyndterminal/wyndterminal/sav/list.php','','WTSAV','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(27,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','sav',114,'/wyndterminal/wyndterminal/sav/list.php','','WTList','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(28,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','sav',115,'/wyndterminal/wyndterminal/sav/card.php?action=create','','WTCreate','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(29,'all',0,'wyndterminal','left','wyndterminal','manual',-1,'wyndterminal',NULL,116,'/wyndterminal/wyndterminal/manual/list.php','','WTManual','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(30,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','manual',117,'/wyndterminal/wyndterminal/manual/list.php','','WTList','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(31,'all',0,'wyndterminal','left','wyndterminal',NULL,-1,'wyndterminal','manual',118,'/wyndterminal/wyndterminal/manual/card.php?action=create','','WTCreate','wyndterminal@wyndterminal',NULL,'1','1',0,'2016-12-08 16:35:12',NULL),
	(32,'all',0,'wyndterminal','left','wyndterminal','testjson',-1,'wyndterminal',NULL,119,'/wyndterminal/admin/test_submission.php','','WTTestJSON','wyndterminal@wyndterminal',NULL,'1','$conf->global->WYNDTERM_ENV==\"apidev\"',0,'2016-12-08 16:35:12',NULL);

/*!40000 ALTER TABLE `llx_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_notify
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_notify`;

CREATE TABLE `llx_notify` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `daten` datetime DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `objet_type` varchar(24) NOT NULL,
  `objet_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_notify_def
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_notify_def`;

CREATE TABLE `llx_notify_def` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` date DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_opensurvey_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_opensurvey_comments`;

CREATE TABLE `llx_opensurvey_comments` (
  `id_comment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_sondage` char(16) NOT NULL,
  `comment` text NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usercomment` text,
  PRIMARY KEY (`id_comment`),
  KEY `idx_id_comment` (`id_comment`),
  KEY `idx_id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_opensurvey_sondage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_opensurvey_sondage`;

CREATE TABLE `llx_opensurvey_sondage` (
  `id_sondage` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `commentaires` text,
  `mail_admin` varchar(128) DEFAULT NULL,
  `nom_admin` varchar(64) DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `titre` text NOT NULL,
  `date_fin` datetime NOT NULL,
  `format` varchar(2) NOT NULL,
  `mailsonde` tinyint(4) NOT NULL DEFAULT '0',
  `allow_comments` tinyint(4) NOT NULL DEFAULT '1',
  `allow_spy` tinyint(4) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sujet` text,
  PRIMARY KEY (`id_sondage`),
  KEY `idx_date_fin` (`date_fin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_opensurvey_user_studs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_opensurvey_user_studs`;

CREATE TABLE `llx_opensurvey_user_studs` (
  `id_users` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `id_sondage` varchar(16) NOT NULL,
  `reponses` varchar(100) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_users`),
  KEY `idx_opensurvey_user_studs_id_users` (`id_users`),
  KEY `idx_opensurvey_user_studs_nom` (`nom`),
  KEY `idx_opensurvey_user_studs_id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_orders_invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_orders_invoices`;

CREATE TABLE `llx_orders_invoices` (
  `order_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`invoice_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `llx_orders_invoices_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `llx_commande` (`rowid`),
  CONSTRAINT `llx_orders_invoices_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `llx_facture` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[Wynd Manage many-to-many relation between order and invoice';

LOCK TABLES `llx_orders_invoices` WRITE;
/*!40000 ALTER TABLE `llx_orders_invoices` DISABLE KEYS */;

INSERT INTO `llx_orders_invoices` (`order_id`, `invoice_id`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(1,5),
	(1,6),
	(1,7),
	(1,8),
	(1,9),
	(1,10);

/*!40000 ALTER TABLE `llx_orders_invoices` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_paiement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_paiement`;

CREATE TABLE `llx_paiement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `fk_export_compta` int(11) NOT NULL DEFAULT '0',
  `fk_invoice` varchar(11) DEFAULT NULL,
  `uuid` char(100) NOT NULL,
  `fk_credit_note` int(9) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_paiement_fk_bank` (`fk_bank`),
  KEY `paiement_credit_note_fk` (`fk_credit_note`),
  KEY `llx_paiement_llx_c_paiement_id_fk` (`fk_paiement`),
  KEY `llx_paiement_llx_entity_rowid_fk` (`entity`),
  CONSTRAINT `paiement_credit_note_fk` FOREIGN KEY (`fk_credit_note`) REFERENCES `llx_wynd_credit_note` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_paiement` WRITE;
/*!40000 ALTER TABLE `llx_paiement` DISABLE KEYS */;

INSERT INTO `llx_paiement` (`rowid`, `entity`, `datec`, `tms`, `datep`, `amount`, `fk_paiement`, `num_paiement`, `note`, `fk_bank`, `fk_user_creat`, `fk_user_modif`, `statut`, `fk_export_compta`, `fk_invoice`, `uuid`, `fk_credit_note`)
VALUES
	(1,3,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'11215',2,NULL,'Quaerat similique culpa ab rerum consequuntur atque.',1,4,NULL,0,0,'8','3f8ba723-e7d4-43d4-aa62-4cf64362af78',NULL),
	(2,3,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'20881',2,NULL,'Quibusdam excepturi iusto nam at quas numquam.',2,3,NULL,0,0,'5','9eff6f06-2dd0-41bf-8f35-7663d3c3ce52',NULL),
	(3,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'104927',2,NULL,'Repudiandae natus dolores perferendis voluptatem eos nihil voluptate eveniet.',3,4,NULL,0,0,'5','55ca069d-7d68-468a-9e7e-4439394b7b14',NULL),
	(4,3,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'31065',3,NULL,'Et odio nesciunt exercitationem distinctio officia suscipit.',4,1,NULL,0,0,'7','41c0b656-28df-4205-9a38-7a9cfeeaeb40',NULL),
	(5,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'167142',3,NULL,'Est ipsum et quas dolor dignissimos placeat.',5,4,NULL,0,0,'3','dc536463-a971-4b26-82a9-d3592f31e803',NULL),
	(6,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'193026',2,NULL,'Quos amet praesentium voluptatem molestiae voluptate labore in.',6,2,NULL,0,0,'4','2bd4fff7-a7c0-43bc-9e4d-47f132943f5c',NULL),
	(7,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'63946',2,NULL,'Voluptatem accusantium quisquam odio optio.',7,3,NULL,0,0,'7','0cdd1f18-22c1-4911-aa4a-399139ec5705',NULL),
	(8,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'58217',2,NULL,'Optio eaque assumenda omnis incidunt rerum reprehenderit rerum.',8,5,NULL,0,0,'5','3f3c1fc4-1f27-4130-a0b8-5b91a337c04a',NULL),
	(9,3,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'47039',3,NULL,'Provident et porro adipisci aut unde officiis dolorum.',9,2,NULL,0,0,'9','6a728c67-2cbc-493f-82c2-f07ecbfa1689',NULL),
	(10,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'8838',2,NULL,'Magnam nostrum nemo totam doloribus culpa unde nesciunt dolor.',10,5,NULL,0,0,'10','864a4bee-6ae5-4d8c-915c-57bb43fc3744',NULL),
	(11,3,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'144650',3,NULL,'Voluptatum error eius nam cupiditate amet quaerat.',11,5,NULL,0,0,'5','ee33adfc-f2b0-4f32-9255-fe238cf464d2',NULL),
	(12,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'127204',2,NULL,'Dignissimos dolorem ab veritatis quia esse est eos.',12,1,NULL,0,0,'8','a9e4b41b-91d1-4098-a462-9138cd996282',NULL),
	(13,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'96798',2,NULL,'Ipsum quia vel minus.',13,5,NULL,0,0,'9','89b17126-b13c-41a1-9004-43b95db7db7c',NULL),
	(14,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'174563',3,NULL,'Rerum facere rem voluptatum beatae provident.',14,4,NULL,0,0,'3','5fd1fca9-b706-4801-b87b-11f046d5036e',NULL),
	(15,3,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'37085',3,NULL,'Aut veritatis molestias ullam perspiciatis sed dolorum sequi.',15,1,NULL,0,0,'6','cdb15e63-2717-45ef-956b-2d95ed454667',NULL),
	(16,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'188377',2,NULL,'Dolores ratione eos rerum nesciunt sapiente aspernatur iste repellendus.',16,1,NULL,0,0,'7','5df11b53-b387-4b9f-8732-5a40230ee3c9',NULL),
	(17,3,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'185258',3,NULL,'Fugiat vel laudantium et cum et.',17,2,NULL,0,0,'9','81eb0bc1-2d35-40b6-aded-4828c451aedf',NULL),
	(18,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'130577',3,NULL,'Aut suscipit laudantium sint natus nobis.',18,4,NULL,0,0,'3','9e9930b3-21ae-4d37-b46b-5bb963763783',NULL),
	(19,3,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'26485',3,NULL,'Et rem sed numquam sapiente ut.',19,3,NULL,0,0,'2','6d429d5b-e6d3-4954-a5a3-9efa5d56f89b',NULL),
	(20,2,'2017-08-11 17:40:59','2017-08-11 15:40:59',NULL,'135461',2,NULL,'Molestiae aliquam maiores quia numquam ea voluptas aut.',20,3,NULL,0,0,'10','94d4d183-be80-41d4-bf68-80d28216e94e',NULL);

/*!40000 ALTER TABLE `llx_paiement` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_paiementcharge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_paiementcharge`;

CREATE TABLE `llx_paiementcharge` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_charge` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double DEFAULT '0',
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_paiementfourn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_paiementfourn`;

CREATE TABLE `llx_paiementfourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `amount` double DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) NOT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_paiementfourn_facturefourn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_paiementfourn_facturefourn`;

CREATE TABLE `llx_paiementfourn_facturefourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_paiementfourn` int(11) DEFAULT NULL,
  `fk_facturefourn` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiementfourn_facturefourn` (`fk_paiementfourn`,`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_facture` (`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_paiement` (`fk_paiementfourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_payment_salary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_payment_salary`;

CREATE TABLE `llx_payment_salary` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int(11) NOT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_prelevement_bons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_prelevement_bons`;

CREATE TABLE `llx_prelevement_bons` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(12) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `amount` double DEFAULT '0',
  `statut` smallint(6) DEFAULT '0',
  `credite` smallint(6) DEFAULT '0',
  `note` text,
  `date_trans` datetime DEFAULT NULL,
  `method_trans` smallint(6) DEFAULT NULL,
  `fk_user_trans` int(11) DEFAULT NULL,
  `date_credit` datetime DEFAULT NULL,
  `fk_user_credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_prelevement_bons_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_prelevement_facture
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_prelevement_facture`;

CREATE TABLE `llx_prelevement_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `fk_prelevement_lignes` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_facture_fk_prelevement_lignes` (`fk_prelevement_lignes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_prelevement_facture_demande
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_prelevement_facture_demande`;

CREATE TABLE `llx_prelevement_facture_demande` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `amount` double NOT NULL,
  `date_demande` datetime NOT NULL,
  `traite` smallint(6) DEFAULT '0',
  `date_traite` datetime DEFAULT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_user_demande` int(11) NOT NULL,
  `code_banque` varchar(7) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_prelevement_lignes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_prelevement_lignes`;

CREATE TABLE `llx_prelevement_lignes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `statut` smallint(6) DEFAULT '0',
  `client_nom` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `code_banque` varchar(7) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_lignes_fk_prelevement_bons` (`fk_prelevement_bons`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_prelevement_rejet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_prelevement_rejet`;

CREATE TABLE `llx_prelevement_rejet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prelevement_lignes` int(11) DEFAULT NULL,
  `date_rejet` datetime DEFAULT NULL,
  `motif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creation` int(11) DEFAULT NULL,
  `note` text,
  `afacturer` tinyint(4) DEFAULT '0',
  `fk_facture` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_price_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_price_list`;

CREATE TABLE `llx_price_list` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `ref` varchar(100) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `country` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_price_list_llx_entity_rowid_fk` (`entity`),
  KEY `llx_price_list_llx_wynd_countries` (`country`),
  CONSTRAINT `llx_price_list_llx_wynd_countries` FOREIGN KEY (`country`) REFERENCES `llx_wynd_countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_price_list` WRITE;
/*!40000 ALTER TABLE `llx_price_list` DISABLE KEYS */;

INSERT INTO `llx_price_list` (`rowid`, `tms`, `datec`, `fk_user_author`, `fk_user_mod`, `entity`, `ref`, `label`, `import_key`, `country`)
VALUES
	(1,'2017-08-11 17:40:50','2017-08-11 17:40:50',4,4,2,'eum','sit','9501771144777',1),
	(2,'2017-08-11 17:40:50','2017-08-11 17:40:50',5,5,3,'aliquam','qui','8118580158775',1),
	(3,'2017-08-11 17:40:50','2017-08-11 17:40:50',1,1,2,'ut','dolorum','5137768604814',1),
	(4,'2017-08-11 17:40:50','2017-08-11 17:40:50',2,3,2,'atque','aut','1268806221695',1),
	(5,'2017-08-11 17:40:50','2017-08-11 17:40:50',2,4,3,'necessitatibus','qui','4877225139220',1),
	(6,'2017-08-11 17:40:50','2017-08-11 17:40:50',3,1,3,'repellat','expedita','4628803724471',1),
	(7,'2017-08-11 17:40:50','2017-08-11 17:40:50',1,1,3,'sed','illo','2804840081827',1),
	(8,'2017-08-11 17:40:50','2017-08-11 17:40:50',5,5,2,'sed','iure','4759693965115',1),
	(9,'2017-08-11 17:40:50','2017-08-11 17:40:50',3,1,2,'numquam','iusto','3209466190684',1),
	(10,'2017-08-11 17:40:50','2017-08-11 17:40:50',2,1,2,'eveniet','est','2622248285827',1);

/*!40000 ALTER TABLE `llx_price_list` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_price_list_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_price_list_log`;

CREATE TABLE `llx_price_list_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `entity_id` int(11) NOT NULL,
  `pricelist_id` int(11) NOT NULL,
  `entity_label` varchar(255) NOT NULL,
  `pricelist_label` varchar(100) DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_price_list_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_price_list_price`;

CREATE TABLE `llx_price_list_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `fk_price_list` int(11) DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `price_level` smallint(6) DEFAULT '1',
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `import_key` varchar(14) DEFAULT NULL,
  `price_type` enum('AMOUNT','PERCENT') NOT NULL DEFAULT 'AMOUNT',
  `condition_id` int(9) DEFAULT NULL,
  `valo_max` double(24,8) DEFAULT NULL,
  `price_max` double(24,8) DEFAULT NULL,
  `price_max_ttc` double(24,8) DEFAULT NULL,
  `price_percent` double(5,2) DEFAULT NULL,
  `condition_type` enum('RELATIVE','ABSOLUTE') NOT NULL,
  `price_order` int(9) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_variable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `llx_price_list_price_fk_price_list_fk_product_condition_id` (`fk_price_list`,`fk_product`,`condition_id`),
  KEY `idx_price_list_fk_product` (`fk_product`),
  KEY `idx_price_list_fk_price_list` (`fk_price_list`),
  KEY `condition_id` (`condition_id`),
  CONSTRAINT `llx_price_list_price_ibfk_1` FOREIGN KEY (`condition_id`) REFERENCES `llx_condition_price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_price_list_price` WRITE;
/*!40000 ALTER TABLE `llx_price_list_price` DISABLE KEYS */;

INSERT INTO `llx_price_list_price` (`rowid`, `tms`, `datec`, `fk_user_author`, `fk_user_mod`, `fk_price_list`, `fk_product`, `price_level`, `price`, `price_ttc`, `price_min`, `price_min_ttc`, `price_base_type`, `tva_tx`, `recuperableonly`, `localtax1_tx`, `localtax2_tx`, `import_key`, `price_type`, `condition_id`, `valo_max`, `price_max`, `price_max_ttc`, `price_percent`, `condition_type`, `price_order`, `is_default`, `is_variable`)
VALUES
	(1,'2017-08-11 17:40:57','2017-08-11 17:40:57',3,2,1,1,0,3472.19034924,1458.21856170,0.00000000,15467.75927224,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',1,NULL,NULL,NULL,999.99,'',29,1,0),
	(2,'2017-08-11 17:40:57','2017-08-11 17:40:57',4,5,2,2,0,58557.22331441,72419394.57009800,3784.06420313,3.94953138,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',10,NULL,NULL,NULL,999.99,'',47,1,0),
	(3,'2017-08-11 17:40:57','2017-08-11 17:40:57',3,5,3,3,0,415656266.73027000,39.35504786,1.10463509,36508316.17066600,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',6,NULL,NULL,NULL,999.99,'',90,1,0),
	(4,'2017-08-11 17:40:57','2017-08-11 17:40:57',5,1,4,4,0,16232571.02432000,318.97784027,38830.09250152,261.18151792,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',6,NULL,NULL,NULL,999.99,'',61,1,0),
	(5,'2017-08-11 17:40:57','2017-08-11 17:40:57',2,2,5,5,0,285.12288241,0.69439686,554684.03923207,5635068.26003670,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',2,NULL,NULL,NULL,999.99,'',54,1,0),
	(6,'2017-08-11 17:40:57','2017-08-11 17:40:57',5,3,6,6,0,364197.65510909,45650.78927793,21723312.19461100,44724522.15149000,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',9,NULL,NULL,NULL,999.99,'',45,1,0),
	(7,'2017-08-11 17:40:57','2017-08-11 17:40:57',3,3,7,7,0,35086264.95821000,111670.23651418,89961.60610351,2.19159143,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',10,NULL,NULL,NULL,999.99,'',49,1,0),
	(8,'2017-08-11 17:40:57','2017-08-11 17:40:57',5,5,8,8,0,655529.93936166,2573262.07681070,443992.49456426,973.11718697,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',7,NULL,NULL,NULL,999.99,'',88,1,0),
	(9,'2017-08-11 17:40:57','2017-08-11 17:40:57',5,3,9,9,0,2.46404783,1120788.69978690,386336.93997920,420115.50506854,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',4,NULL,NULL,NULL,999.99,'',8,1,0),
	(10,'2017-08-11 17:40:57','2017-08-11 17:40:57',3,2,10,10,0,143163.72755428,14168708.37915000,8664.75735454,732972.42927630,'HT',999.999,0,0.000,0.000,NULL,'AMOUNT',1,NULL,NULL,NULL,999.99,'',59,1,0);

/*!40000 ALTER TABLE `llx_price_list_price` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_printer_ipp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_printer_ipp`;

CREATE TABLE `llx_printer_ipp` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `printer_name` text NOT NULL,
  `printer_location` text NOT NULL,
  `printer_uri` varchar(255) NOT NULL,
  `copy` int(11) NOT NULL DEFAULT '1',
  `module` varchar(16) NOT NULL,
  `login` varchar(32) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product`;

CREATE TABLE `llx_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `indexed_at` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `virtual` tinyint(4) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `note` text,
  `customcode` varchar(32) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `fk_user_author` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT '1',
  `tobuy` tinyint(4) DEFAULT '1',
  `tobatch` tinyint(4) NOT NULL DEFAULT '0',
  `fk_product_type` int(11) DEFAULT '0',
  `duration` varchar(6) DEFAULT NULL,
  `seuil_stock_alerte` int(11) DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT '0',
  `accountancy_code_sell` varchar(15) DEFAULT NULL,
  `accountancy_code_buy` varchar(15) DEFAULT NULL,
  `partnumber` varchar(32) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` tinyint(4) DEFAULT NULL,
  `length` float DEFAULT NULL,
  `length_units` tinyint(4) DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `surface_units` tinyint(4) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_units` tinyint(4) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT '0.00000000',
  `canvas` varchar(32) DEFAULT NULL,
  `finished` tinyint(4) DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `desiredstock` int(11) DEFAULT '0',
  `price_max` double(24,8) DEFAULT NULL,
  `price_max_ttc` double(24,8) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `uuid` varchar(100) DEFAULT NULL,
  `category_kvs` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_label` (`label`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_import_key` (`import_key`),
  KEY `idx_product_seuil_stock_alerte` (`seuil_stock_alerte`),
  KEY `llx_product_llx_entity_rowid_fk` (`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_product` WRITE;
/*!40000 ALTER TABLE `llx_product` DISABLE KEYS */;

INSERT INTO `llx_product` (`rowid`, `ref`, `entity`, `ref_ext`, `datec`, `indexed_at`, `tms`, `virtual`, `label`, `description`, `note`, `customcode`, `fk_country`, `price`, `price_ttc`, `price_min`, `price_min_ttc`, `price_base_type`, `tva_tx`, `recuperableonly`, `localtax1_tx`, `localtax2_tx`, `fk_user_author`, `tosell`, `tobuy`, `tobatch`, `fk_product_type`, `duration`, `seuil_stock_alerte`, `url`, `barcode`, `fk_barcode_type`, `accountancy_code_sell`, `accountancy_code_buy`, `partnumber`, `weight`, `weight_units`, `length`, `length_units`, `surface`, `surface_units`, `volume`, `volume_units`, `stock`, `pmp`, `canvas`, `finished`, `hidden`, `import_key`, `desiredstock`, `price_max`, `price_max_ttc`, `slug`, `uuid`, `category_kvs`)
VALUES
	(1,'product_1',1,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'Banana','Aut ratione recusandae omnis ex omnis est similique.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,1,1,0,0,NULL,0,'http://www.payet.fr/sit-nostrum-eum-omnis-quaerat-doloremque-beatae.html','3892750558897',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','c54eb914-7d0a-4e7e-ae59-fe8c42c5cd7b',4),
	(2,'product_2',1,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'Banana','Rerum veritatis veritatis nam.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,1,1,0,0,NULL,0,'https://millet.com/qui-ut-itaque-iusto.html','1264470549646',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','41521708-14f1-47c4-97c5-00dfe1be64e9',1),
	(3,'product_3',2,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'cupiditate','Eligendi in ab facere sunt dolor.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,1,1,0,0,NULL,0,'http://www.maillard.org/animi-veniam-ad-animi-nihil-impedit-voluptatum-qui.html','3865853463399',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','84723469-9f26-47d8-b057-6e9f02a5b7d4',4),
	(4,'product_4',2,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'iusto','Suscipit qui qui tempora qui.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,1,1,0,0,NULL,0,'https://www.martin.fr/sint-nisi-sed-maiores-veritatis-laudantium','3510233132296',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','98beebe4-4928-458f-bc0e-1ebcb717eda0',4),
	(5,'product_5',3,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'ut','Omnis est accusamus iusto et quis voluptate.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,1,1,0,0,NULL,0,'https://bousquet.net/dolor-quasi-eum-et-nihil.html','2358731603136',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','127f2e84-3701-4739-870d-42ea2204e293',3),
	(6,'product_6',3,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'consequuntur','Alias nihil ipsa officia sapiente nesciunt atque rem.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,1,1,0,0,NULL,0,'http://www.marchal.net/voluptas-temporibus-ut-magnam-repudiandae','3264182799696',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','4dce5e4e-6c2d-4db6-a193-82fdb1543766',4),
	(7,'product_7',4,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'fugiat','Ut omnis nihil dolores et maxime tempora.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,0,1,0,0,NULL,0,'http://www.robert.fr/molestiae-assumenda-fugiat-doloremque-ab-unde','9566161937018',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','c23127b6-2788-4cc3-be34-32e5ed52f877',3),
	(8,'product_8',4,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'molestias','Totam similique voluptatum mollitia ab quo error rerum.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,0,1,0,0,NULL,0,'http://www.martel.com/','3887268300304',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','100630a8-d54a-484f-954f-c996e7a43a43',4),
	(9,'product_9',5,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'ad','Nemo asperiores excepturi explicabo voluptas a molestiae.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,0,1,0,0,NULL,0,'http://www.techer.net/et-et-reprehenderit-officia-consequatur','5745564294315',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','953430cd-4a63-431e-b2a7-9488618f70e1',5),
	(10,'product_10',5,NULL,'2017-08-11 17:40:51',NULL,'2017-08-11 17:40:51',0,'tempore','Nemo rerum in dolores molestias earum quos blanditiis.',NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,0,0.000,0.000,NULL,0,1,0,0,NULL,0,'http://moulin.org/','9300800839031',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,0,NULL,0,NULL,NULL,'','f1da7cbd-4146-4343-8573-e9ba95f6c077',2);

/*!40000 ALTER TABLE `llx_product` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_product_association
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_association`;

CREATE TABLE `llx_product_association` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_pere` int(11) NOT NULL DEFAULT '0',
  `fk_product_fils` int(11) NOT NULL DEFAULT '0',
  `qty` double DEFAULT NULL,
  `entity` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `sort` int(4) DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_association` (`entity`,`fk_product_pere`,`fk_product_fils`),
  KEY `idx_product_association_fils` (`fk_product_fils`),
  KEY `llx_product_association_llx_product_rowid_fk_pere` (`fk_product_pere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_product_association` WRITE;
/*!40000 ALTER TABLE `llx_product_association` DISABLE KEYS */;

INSERT INTO `llx_product_association` (`rowid`, `fk_product_pere`, `fk_product_fils`, `qty`, `entity`, `position`, `sort`)
VALUES
	(1,1,2,1,1,0,1),
	(2,1,3,1,2,0,1),
	(3,2,4,1,3,0,1),
	(4,7,4,1,3,0,1),
	(5,6,10,1,3,0,1),
	(6,8,9,1,3,0,1),
	(7,7,8,1,1,0,1),
	(8,9,7,1,4,0,1),
	(9,5,6,1,4,0,1),
	(10,8,5,1,5,0,1);

/*!40000 ALTER TABLE `llx_product_association` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_product_batch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_batch`;

CREATE TABLE `llx_product_batch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product_stock` int(11) NOT NULL,
  `eatby` datetime DEFAULT NULL,
  `sellby` datetime DEFAULT NULL,
  `batch` varchar(30) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_product_stock` (`fk_product_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_product_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_comments`;

CREATE TABLE `llx_product_comments` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL,
  `comment` varchar(50) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_product_customer_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_customer_price`;

CREATE TABLE `llx_product_customer_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_customer_price_fk_product_fk_soc` (`fk_product`,`fk_soc`),
  KEY `idx_product_customer_price_fk_user` (`fk_user`),
  KEY `idx_product_customer_price_fk_soc` (`fk_soc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_product_customer_price_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_customer_price_log`;

CREATE TABLE `llx_product_customer_price_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_product_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_extrafields`;

CREATE TABLE `llx_product_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `compo_txt` text,
  `prod_alegerne` text,
  `external_id` int(11) DEFAULT NULL,
  `external_category` varchar(50) DEFAULT NULL,
  `external_ref` varchar(100) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT 'product',
  `category_kvs` text,
  `division` text,
  `category_extern` text,
  `featured` int(1) DEFAULT '0',
  `picture` text,
  `barcode` varchar(13) DEFAULT NULL,
  `extra_data` text,
  `n_site` int(4) DEFAULT NULL,
  `label_site` varchar(255) DEFAULT NULL,
  `n_card` int(10) DEFAULT NULL,
  `label_card` varchar(255) DEFAULT NULL,
  `ref_type_line` int(4) DEFAULT NULL,
  `ventil_case` int(10) DEFAULT NULL,
  `ventil_card` int(10) DEFAULT NULL,
  `code_article` int(10) DEFAULT NULL,
  `n_menu_case` int(10) DEFAULT NULL,
  `level_menu` int(10) DEFAULT NULL,
  `weight_menu` int(10) DEFAULT NULL,
  `ref_tva_vae` int(10) DEFAULT NULL,
  `tx_tva_vae` double(24,8) DEFAULT NULL,
  `label_tva_vae` varchar(255) DEFAULT NULL,
  `ref_tva_sp` int(10) DEFAULT NULL,
  `label_tva_sp` varchar(255) DEFAULT NULL,
  `window` int(10) DEFAULT NULL,
  `chaining_window` int(10) DEFAULT NULL,
  `debit_regr` int(10) DEFAULT NULL,
  `coef_debit` int(10) DEFAULT NULL,
  `hp_sell` varchar(255) DEFAULT NULL,
  `unity_tag` varchar(255) DEFAULT NULL,
  `tx_conv_tag` varchar(255) DEFAULT NULL,
  `label_kitchen` varchar(255) DEFAULT NULL,
  `label_key` varchar(255) DEFAULT NULL,
  `label_1` varchar(255) DEFAULT NULL,
  `label_2` varchar(255) DEFAULT NULL,
  `label_3` varchar(255) DEFAULT NULL,
  `date_begin_validity` date DEFAULT NULL,
  `date_end_validity` date DEFAULT NULL,
  `status_lock` varchar(255) DEFAULT NULL,
  `status_except_ca` varchar(255) DEFAULT NULL,
  `status_com` varchar(255) DEFAULT NULL,
  `status_price_prog` varchar(255) DEFAULT NULL,
  `status_price_manual` varchar(255) DEFAULT NULL,
  `status_compil` varchar(255) DEFAULT NULL,
  `status_sell_weight` varchar(255) DEFAULT NULL,
  `status_service` varchar(255) DEFAULT NULL,
  `status_com_required` varchar(255) DEFAULT NULL,
  `status_no_discount` varchar(255) DEFAULT NULL,
  `status_dot` varchar(255) DEFAULT NULL,
  `status_admission_first` varchar(255) DEFAULT NULL,
  `status_admission` varchar(255) DEFAULT NULL,
  `status_fundable` varchar(255) DEFAULT NULL,
  `status_follow` varchar(255) DEFAULT NULL,
  `status_claim` varchar(255) DEFAULT NULL,
  `status_com_stray` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `status_window` varchar(255) DEFAULT NULL,
  `status_message_alone` varchar(255) DEFAULT NULL,
  `price_2` double(24,8) DEFAULT NULL,
  `price_3` double(24,8) DEFAULT NULL,
  `unit_tag` varchar(255) DEFAULT NULL,
  `status_related_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_product_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_extrafields` DISABLE KEYS */;

INSERT INTO `llx_product_extrafields` (`rowid`, `tms`, `fk_object`, `import_key`, `compo_txt`, `prod_alegerne`, `external_id`, `external_category`, `external_ref`, `product_type`, `category_kvs`, `division`, `category_extern`, `featured`, `picture`, `barcode`, `extra_data`, `n_site`, `label_site`, `n_card`, `label_card`, `ref_type_line`, `ventil_case`, `ventil_card`, `code_article`, `n_menu_case`, `level_menu`, `weight_menu`, `ref_tva_vae`, `tx_tva_vae`, `label_tva_vae`, `ref_tva_sp`, `label_tva_sp`, `window`, `chaining_window`, `debit_regr`, `coef_debit`, `hp_sell`, `unity_tag`, `tx_conv_tag`, `label_kitchen`, `label_key`, `label_1`, `label_2`, `label_3`, `date_begin_validity`, `date_end_validity`, `status_lock`, `status_except_ca`, `status_com`, `status_price_prog`, `status_price_manual`, `status_compil`, `status_sell_weight`, `status_service`, `status_com_required`, `status_no_discount`, `status_dot`, `status_admission_first`, `status_admission`, `status_fundable`, `status_follow`, `status_claim`, `status_com_stray`, `status_message`, `status_window`, `status_message_alone`, `price_2`, `price_3`, `unit_tag`, `status_related_message`)
VALUES
	(1,'2017-08-11 15:40:52',1,NULL,NULL,NULL,1,NULL,NULL,'product',NULL,'3',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'2017-08-11 15:40:52',2,NULL,NULL,NULL,2,NULL,NULL,'product',NULL,'4',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,'2017-08-11 15:40:52',3,NULL,NULL,NULL,3,NULL,NULL,'product',NULL,'4',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'2017-08-11 15:40:52',4,NULL,NULL,NULL,4,NULL,NULL,'product',NULL,'5',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,'2017-08-11 15:40:52',5,NULL,NULL,NULL,5,NULL,NULL,'product',NULL,'1',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,'2017-08-11 15:40:52',6,NULL,NULL,NULL,6,NULL,NULL,'product',NULL,'1',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,'2017-08-11 15:40:52',7,NULL,NULL,NULL,7,NULL,NULL,'product',NULL,'1',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,'2017-08-11 15:40:52',8,NULL,NULL,NULL,8,NULL,NULL,'product',NULL,'4',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(9,'2017-08-11 15:40:52',9,NULL,NULL,NULL,9,NULL,NULL,'product',NULL,'1',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,'2017-08-11 15:40:52',10,NULL,NULL,NULL,10,NULL,NULL,'product',NULL,'1',NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `llx_product_extrafields` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_product_extrafields_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_extrafields_2`;

CREATE TABLE `llx_product_extrafields_2` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `compo_txt` text,
  `prod_alegerne` text,
  `division` int(10) DEFAULT NULL,
  `category_kvs_2` int(10) DEFAULT NULL,
  `external_id` int(11) DEFAULT NULL,
  `external_category` varchar(50) DEFAULT NULL,
  `external_ref` varchar(100) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT 'product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_product_fournisseur_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_fournisseur_price`;

CREATE TABLE `llx_product_fournisseur_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `ref_fourn` varchar(30) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT '0',
  `remise` double NOT NULL DEFAULT '0',
  `unitprice` double(24,8) DEFAULT '0.00000000',
  `charges` double(24,8) DEFAULT '0.00000000',
  `unitcharges` double(24,8) DEFAULT '0.00000000',
  `tva_tx` double(6,3) NOT NULL,
  `info_bits` int(11) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_fournisseur_price_ref` (`ref_fourn`,`fk_soc`,`quantity`,`entity`),
  KEY `idx_product_fournisseur_price_fk_user` (`fk_user`),
  KEY `idx_product_fourn_price_fk_product` (`fk_product`,`entity`),
  KEY `idx_product_fourn_price_fk_soc` (`fk_soc`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_product_fournisseur_price_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_fournisseur_price_log`;

CREATE TABLE `llx_product_fournisseur_price_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `fk_product_fournisseur` int(11) NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `quantity` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_product_lang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_lang`;

CREATE TABLE `llx_product_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `note` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lang` (`fk_product`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_product_origin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_origin`;

CREATE TABLE `llx_product_origin` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `country_origin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `llx_product_origin` (`fk_product`,`entity`) USING BTREE,
  KEY `fk_product` (`fk_product`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



# Affichage de la table llx_product_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_price`;

CREATE TABLE `llx_product_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int(11) NOT NULL,
  `date_price` datetime DEFAULT NULL,
  `price_level` smallint(6) DEFAULT '1',
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_max` double(24,8) DEFAULT NULL,
  `price_max_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `tva_tx` double(6,3) NOT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `fk_user_author` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT '1',
  `price_by_qty` int(11) NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `datec` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_user_mod` int(11) DEFAULT NULL,
  `price_percent` double(5,2) DEFAULT NULL,
  `price_type` enum('AMOUNT','PERCENT') NOT NULL DEFAULT 'AMOUNT',
  `condition_type` enum('RELATIVE','ABSOLUTE') NOT NULL,
  `valo_max` double(24,8) DEFAULT NULL,
  `price_order` int(9) DEFAULT NULL,
  `condition_id` int(9) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_variable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `llx_product_price_product_entity_condition_id` (`fk_product`,`entity`,`condition_id`),
  KEY `llx_product_price_ibfk_1` (`condition_id`),
  KEY `llx_product_price_llx_entity_rowid_fk` (`entity`),
  CONSTRAINT `llx_product_price_ibfk_1` FOREIGN KEY (`condition_id`) REFERENCES `llx_condition_price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_product_price` WRITE;
/*!40000 ALTER TABLE `llx_product_price` DISABLE KEYS */;

INSERT INTO `llx_product_price` (`rowid`, `entity`, `tms`, `fk_product`, `date_price`, `price_level`, `price`, `price_ttc`, `price_min`, `price_min_ttc`, `price_max`, `price_max_ttc`, `price_base_type`, `tva_tx`, `recuperableonly`, `localtax1_tx`, `localtax2_tx`, `fk_user_author`, `tosell`, `price_by_qty`, `import_key`, `datec`, `fk_user_mod`, `price_percent`, `price_type`, `condition_type`, `valo_max`, `price_order`, `condition_id`, `is_default`, `is_variable`)
VALUES
	(1,1,'2017-08-11 17:40:52',1,NULL,0,0.33197795,55.68199395,0.00000000,27156.36249288,NULL,NULL,'HT',999.999,0,0.000,0.000,2,1,0,NULL,'2017-08-11 17:40:52',4,NULL,'AMOUNT','ABSOLUTE',NULL,57,4,0,0),
	(2,1,'2017-08-11 17:40:52',2,NULL,0,11.32872654,3121576.18746530,20777.82208411,29276.82441484,NULL,NULL,'HT',999.999,0,0.000,0.000,2,1,0,NULL,'2017-08-11 17:40:52',3,NULL,'AMOUNT','ABSOLUTE',NULL,81,3,0,0),
	(3,1,'2017-08-11 17:40:52',3,NULL,0,736870522.33786000,290547593.06885000,59.19661355,1839985.74291950,NULL,NULL,'HT',999.999,0,0.000,0.000,2,1,0,NULL,'2017-08-11 17:40:52',3,NULL,'AMOUNT','ABSOLUTE',NULL,11,10,0,0),
	(4,1,'2017-08-11 17:40:52',4,NULL,0,200.93221226,3068076.34328480,1.80229138,491935974.15087000,NULL,NULL,'HT',999.999,0,0.000,0.000,3,1,0,NULL,'2017-08-11 17:40:52',2,NULL,'AMOUNT','ABSOLUTE',NULL,96,8,0,0),
	(5,1,'2017-08-11 17:40:52',5,NULL,0,6880.57531778,2.08940810,24.23230804,14345972.80099800,NULL,NULL,'HT',999.999,0,0.000,0.000,4,1,0,NULL,'2017-08-11 17:40:52',5,NULL,'AMOUNT','ABSOLUTE',NULL,46,2,0,0),
	(6,2,'2017-08-11 17:40:52',6,NULL,0,59721343.37379700,26369039.56657800,649.94259393,27.29681965,NULL,NULL,'HT',999.999,0,0.000,0.000,4,1,0,NULL,'2017-08-11 17:40:52',4,NULL,'AMOUNT','ABSOLUTE',NULL,21,9,0,0),
	(7,2,'2017-08-11 17:40:52',7,NULL,0,66854.01008158,1.70998643,107.69661088,2817.51706571,NULL,NULL,'HT',999.999,0,0.000,0.000,2,1,0,NULL,'2017-08-11 17:40:52',2,NULL,'AMOUNT','ABSOLUTE',NULL,54,9,0,0),
	(8,2,'2017-08-11 17:40:52',8,NULL,0,2.30988140,120784.12874444,0.00000000,2716.33723620,NULL,NULL,'HT',999.999,0,0.000,0.000,2,1,0,NULL,'2017-08-11 17:40:52',5,NULL,'AMOUNT','ABSOLUTE',NULL,5,1,0,0),
	(9,2,'2017-08-11 17:40:52',9,NULL,0,62272.23775921,15.84620538,226875.57594348,6.28079573,NULL,NULL,'HT',999.999,0,0.000,0.000,3,1,0,NULL,'2017-08-11 17:40:52',5,NULL,'AMOUNT','ABSOLUTE',NULL,11,2,0,0),
	(10,2,'2017-08-11 17:40:52',10,NULL,0,1635830.31919170,1698.78333771,323.43693315,32.09165345,NULL,NULL,'HT',999.999,0,0.000,0.000,5,1,0,NULL,'2017-08-11 17:40:52',1,NULL,'AMOUNT','ABSOLUTE',NULL,81,8,0,0);

/*!40000 ALTER TABLE `llx_product_price` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_product_price_by_qty
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_price_by_qty`;

CREATE TABLE `llx_product_price_by_qty` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_price` int(11) NOT NULL,
  `date_price` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` double(24,8) DEFAULT '0.00000000',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT '0',
  `remise` double NOT NULL DEFAULT '0',
  `unitprice` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_price_by_qty_level` (`fk_product_price`,`quantity`),
  KEY `idx_product_price_by_qty_fk_product_price` (`fk_product_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_product_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_product_stock`;

CREATE TABLE `llx_product_stock` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `reel` double DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT '0.00000000',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_stock` (`fk_product`,`fk_entrepot`),
  KEY `idx_product_stock_fk_product` (`fk_product`),
  KEY `idx_product_stock_fk_entrepot` (`fk_entrepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_projet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_projet`;

CREATE TABLE `llx_projet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `description` text,
  `fk_user_creat` int(11) NOT NULL,
  `public` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_ref` (`ref`,`entity`),
  KEY `idx_projet_fk_soc` (`fk_soc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_projet_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_projet_extrafields`;

CREATE TABLE `llx_projet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_projet_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_projet_task`;

CREATE TABLE `llx_projet_task` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_projet` int(11) NOT NULL,
  `fk_task_parent` int(11) NOT NULL DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateo` datetime DEFAULT NULL,
  `datee` datetime DEFAULT NULL,
  `datev` datetime DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text,
  `duration_effective` double NOT NULL DEFAULT '0',
  `planned_workload` double NOT NULL DEFAULT '0',
  `progress` int(11) DEFAULT '0',
  `priority` int(11) DEFAULT '0',
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `rang` int(11) DEFAULT '0',
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_task_fk_projet` (`fk_projet`),
  KEY `idx_projet_task_fk_user_creat` (`fk_user_creat`),
  KEY `idx_projet_task_fk_user_valid` (`fk_user_valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_projet_task_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_projet_task_extrafields`;

CREATE TABLE `llx_projet_task_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_task_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_projet_task_time
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_projet_task_time`;

CREATE TABLE `llx_projet_task_time` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_task` int(11) NOT NULL,
  `task_date` date DEFAULT NULL,
  `task_duration` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_propal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_propal`;

CREATE TABLE `llx_propal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `price` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total` double(24,8) DEFAULT '0.00000000',
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_propal_ref` (`ref`,`entity`),
  KEY `idx_propal_fk_soc` (`fk_soc`),
  KEY `idx_propal_fk_user_author` (`fk_user_author`),
  KEY `idx_propal_fk_user_valid` (`fk_user_valid`),
  KEY `idx_propal_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_propal_fk_projet` (`fk_projet`),
  KEY `idx_propal_fk_account` (`fk_account`),
  KEY `idx_propal_fk_currency` (`fk_currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_propal_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_propal_extrafields`;

CREATE TABLE `llx_propal_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_propaldet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_propaldet`;

CREATE TABLE `llx_propaldet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_propal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_remise_except` int(11) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT '0.000',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_fk_propal` (`fk_propal`),
  KEY `idx_propaldet_fk_product` (`fk_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_propaldet_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_propaldet_extrafields`;

CREATE TABLE `llx_propaldet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_resource`;

CREATE TABLE `llx_resource` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_code_type_resource` varchar(32) DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  KEY `fk_code_type_resource_idx` (`fk_code_type_resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_rights_def
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_rights_def`;

CREATE TABLE `llx_rights_def` (
  `id` int(11) NOT NULL DEFAULT '0',
  `libelle` varchar(255) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `perms` varchar(50) DEFAULT NULL,
  `subperms` varchar(50) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `bydefault` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_rights_def` WRITE;
/*!40000 ALTER TABLE `llx_rights_def` DISABLE KEYS */;

INSERT INTO `llx_rights_def` (`id`, `libelle`, `module`, `entity`, `perms`, `subperms`, `type`, `bydefault`)
VALUES
	(11,'Lire les factures','facture',1,'lire',NULL,'a',1),
	(11,'Lire les factures','facture',3,'lire',NULL,'a',1),
	(12,'Creer/modifier les factures','facture',1,'creer',NULL,'a',0),
	(12,'Creer/modifier les factures','facture',3,'creer',NULL,'a',0),
	(13,'Dévalider les factures','facture',1,'invoice_advance','unvalidate','a',0),
	(13,'Dévalider les factures','facture',3,'invoice_advance','unvalidate','a',0),
	(14,'Valider les factures','facture',1,'valider',NULL,'a',0),
	(14,'Valider les factures','facture',3,'valider',NULL,'a',0),
	(15,'Envoyer les factures par mail','facture',1,'invoice_advance','send','a',0),
	(15,'Envoyer les factures par mail','facture',3,'invoice_advance','send','a',0),
	(16,'Emettre des paiements sur les factures','facture',1,'paiement',NULL,'a',0),
	(16,'Emettre des paiements sur les factures','facture',3,'paiement',NULL,'a',0),
	(19,'Supprimer les factures','facture',1,'supprimer',NULL,'a',0),
	(19,'Supprimer les factures','facture',3,'supprimer',NULL,'a',0),
	(31,'Lire les produits','produit',1,'lire',NULL,'r',1),
	(31,'Lire les produits','produit',3,'lire',NULL,'r',1),
	(32,'Creer/modifier les produits','produit',1,'creer',NULL,'w',0),
	(32,'Creer/modifier les produits','produit',3,'creer',NULL,'w',0),
	(34,'Supprimer les produits','produit',1,'supprimer',NULL,'d',0),
	(34,'Supprimer les produits','produit',3,'supprimer',NULL,'d',0),
	(38,'Exporter les produits','produit',1,'export',NULL,'r',0),
	(38,'Exporter les produits','produit',3,'export',NULL,'r',0),
	(81,'Lire les commandes clients','commande',1,'lire',NULL,'r',1),
	(81,'Lire les commandes clients','commande',3,'lire',NULL,'r',1),
	(82,'Creer/modifier les commandes clients','commande',1,'creer',NULL,'w',0),
	(82,'Creer/modifier les commandes clients','commande',3,'creer',NULL,'w',0),
	(84,'Valider les commandes clients','commande',1,'valider',NULL,'d',0),
	(84,'Valider les commandes clients','commande',3,'valider',NULL,'d',0),
	(86,'Envoyer les commandes clients','commande',1,'order_advance','send','d',0),
	(86,'Envoyer les commandes clients','commande',3,'order_advance','send','d',0),
	(87,'Cloturer les commandes clients','commande',1,'cloturer',NULL,'d',0),
	(87,'Cloturer les commandes clients','commande',3,'cloturer',NULL,'d',0),
	(88,'Annuler les commandes clients','commande',1,'annuler',NULL,'d',0),
	(88,'Annuler les commandes clients','commande',3,'annuler',NULL,'d',0),
	(89,'Supprimer les commandes clients','commande',1,'supprimer',NULL,'d',0),
	(89,'Supprimer les commandes clients','commande',3,'supprimer',NULL,'d',0),
	(91,'Lire les charges','tax',1,'charges','lire','r',1),
	(91,'Lire les charges','tax',3,'charges','lire','r',1),
	(92,'Creer/modifier les charges','tax',1,'charges','creer','w',0),
	(92,'Creer/modifier les charges','tax',3,'charges','creer','w',0),
	(93,'Supprimer les charges','tax',1,'charges','supprimer','d',0),
	(93,'Supprimer les charges','tax',3,'charges','supprimer','d',0),
	(94,'Exporter les charges','tax',1,'charges','export','r',0),
	(94,'Exporter les charges','tax',3,'charges','export','r',0),
	(95,'Lire CA, bilans, resultats','compta',1,'resultat','lire','r',1),
	(95,'Lire CA, bilans, resultats','compta',3,'resultat','lire','r',1),
	(96,'Parametrer la ventilation','compta',1,'ventilation','parametrer','r',0),
	(96,'Parametrer la ventilation','compta',3,'ventilation','parametrer','r',0),
	(97,'Lire les ventilations de factures','compta',1,'ventilation','lire','r',1),
	(97,'Lire les ventilations de factures','compta',3,'ventilation','lire','r',1),
	(98,'Ventiler les lignes de factures','compta',1,'ventilation','creer','r',0),
	(98,'Ventiler les lignes de factures','compta',3,'ventilation','creer','r',0),
	(111,'Lire les comptes bancaires','banque',1,'lire',NULL,'r',1),
	(111,'Lire les comptes bancaires','banque',3,'lire',NULL,'r',1),
	(112,'Creer/modifier montant/supprimer ecriture bancaire','banque',1,'modifier',NULL,'w',0),
	(112,'Creer/modifier montant/supprimer ecriture bancaire','banque',3,'modifier',NULL,'w',0),
	(113,'Configurer les comptes bancaires (creer, gerer categories)','banque',1,'configurer',NULL,'a',0),
	(113,'Configurer les comptes bancaires (creer, gerer categories)','banque',3,'configurer',NULL,'a',0),
	(114,'Rapprocher les ecritures bancaires','banque',1,'consolidate',NULL,'w',0),
	(114,'Rapprocher les ecritures bancaires','banque',3,'consolidate',NULL,'w',0),
	(115,'Exporter transactions et releves','banque',1,'export',NULL,'r',0),
	(115,'Exporter transactions et releves','banque',3,'export',NULL,'r',0),
	(116,'Virements entre comptes','banque',1,'transfer',NULL,'w',0),
	(116,'Virements entre comptes','banque',3,'transfer',NULL,'w',0),
	(117,'Gerer les envois de cheques','banque',1,'cheque',NULL,'w',0),
	(117,'Gerer les envois de cheques','banque',3,'cheque',NULL,'w',0),
	(121,'Lire les societes','societe',1,'lire',NULL,'r',1),
	(121,'Lire les societes','societe',3,'lire',NULL,'r',1),
	(122,'Creer modifier les societes','societe',1,'creer',NULL,'w',0),
	(122,'Creer modifier les societes','societe',3,'creer',NULL,'w',0),
	(125,'Supprimer les societes','societe',1,'supprimer',NULL,'d',0),
	(125,'Supprimer les societes','societe',3,'supprimer',NULL,'d',0),
	(126,'Exporter les societes','societe',1,'export',NULL,'r',0),
	(126,'Exporter les societes','societe',3,'export',NULL,'r',0),
	(241,'Lire les categories','categorie',1,'lire',NULL,'r',1),
	(241,'Lire les categories','categorie',3,'lire',NULL,'r',1),
	(242,'Creer/modifier les categories','categorie',1,'creer',NULL,'w',0),
	(242,'Creer/modifier les categories','categorie',3,'creer',NULL,'w',0),
	(243,'Supprimer les categories','categorie',1,'supprimer',NULL,'d',0),
	(243,'Supprimer les categories','categorie',3,'supprimer',NULL,'d',0),
	(251,'Consulter les autres utilisateurs','user',1,'user','lire','r',0),
	(251,'Consulter les autres utilisateurs','user',3,'user','lire','r',0),
	(252,'Consulter les permissions des autres utilisateurs','user',1,'user_advance','readperms','r',0),
	(252,'Consulter les permissions des autres utilisateurs','user',3,'user_advance','readperms','r',0),
	(253,'Creer/modifier utilisateurs internes et externes','user',1,'user','creer','w',0),
	(253,'Creer/modifier utilisateurs internes et externes','user',3,'user','creer','w',0),
	(254,'Creer/modifier utilisateurs externes seulement','user',1,'user_advance','write','w',0),
	(254,'Creer/modifier utilisateurs externes seulement','user',3,'user_advance','write','w',0),
	(255,'Modifier le mot de passe des autres utilisateurs','user',1,'user','password','w',0),
	(255,'Modifier le mot de passe des autres utilisateurs','user',3,'user','password','w',0),
	(256,'Supprimer ou desactiver les autres utilisateurs','user',1,'user','supprimer','d',0),
	(256,'Supprimer ou desactiver les autres utilisateurs','user',3,'user','supprimer','d',0),
	(262,'Consulter tous les tiers par utilisateurs internes (sinon uniquement si contact commercial). Non effectif pour utilisateurs externes (tjs limités à eux-meme).','societe',1,'client','voir','r',1),
	(262,'Consulter tous les tiers par utilisateurs internes (sinon uniquement si contact commercial). Non effectif pour utilisateurs externes (tjs limités à eux-meme).','societe',3,'client','voir','r',1),
	(281,'Lire les contacts','societe',1,'contact','lire','r',1),
	(281,'Lire les contacts','societe',3,'contact','lire','r',1),
	(282,'Creer modifier les contacts','societe',1,'contact','creer','w',0),
	(282,'Creer modifier les contacts','societe',3,'contact','creer','w',0),
	(283,'Supprimer les contacts','societe',1,'contact','supprimer','d',0),
	(283,'Supprimer les contacts','societe',3,'contact','supprimer','d',0),
	(286,'Exporter les contacts','societe',1,'contact','export','d',0),
	(286,'Exporter les contacts','societe',3,'contact','export','d',0),
	(341,'Consulter ses propres permissions','user',1,'self_advance','readperms','r',1),
	(341,'Consulter ses propres permissions','user',3,'self_advance','readperms','r',1),
	(342,'Creer/modifier ses propres infos utilisateur','user',1,'self','creer','w',1),
	(342,'Creer/modifier ses propres infos utilisateur','user',3,'self','creer','w',1),
	(343,'Modifier son propre mot de passe','user',1,'self','password','w',1),
	(343,'Modifier son propre mot de passe','user',3,'self','password','w',1),
	(344,'Modifier ses propres permissions','user',1,'self_advance','writeperms','w',1),
	(344,'Modifier ses propres permissions','user',3,'self_advance','writeperms','w',1),
	(351,'Consulter les groupes','user',1,'group_advance','read','r',0),
	(351,'Consulter les groupes','user',3,'group_advance','read','r',0),
	(352,'Consulter les permissions des groupes','user',1,'group_advance','readperms','r',0),
	(352,'Consulter les permissions des groupes','user',3,'group_advance','readperms','r',0),
	(353,'Creer/modifier les groupes et leurs permissions','user',1,'group_advance','write','w',0),
	(353,'Creer/modifier les groupes et leurs permissions','user',3,'group_advance','write','w',0),
	(354,'Supprimer ou desactiver les groupes','user',1,'group_advance','delete','d',0),
	(354,'Supprimer ou desactiver les groupes','user',3,'group_advance','delete','d',0),
	(358,'Exporter les utilisateurs','user',1,'user','export','r',0),
	(358,'Exporter les utilisateurs','user',3,'user','export','r',0),
	(510,'Read salaries','salaries',1,'read',NULL,'r',0),
	(510,'Read salaries','salaries',3,'read',NULL,'r',0),
	(512,'Create/modify salaries','salaries',1,'write',NULL,'w',0),
	(512,'Create/modify salaries','salaries',3,'write',NULL,'w',0),
	(514,'Delete salaries','salaries',1,'delete',NULL,'d',0),
	(514,'Delete salaries','salaries',3,'delete',NULL,'d',0),
	(517,'Export salaries','salaries',1,'export',NULL,'r',0),
	(517,'Export salaries','salaries',3,'export',NULL,'r',0),
	(1001,'Lire les stocks','stock',1,'lire',NULL,'r',1),
	(1001,'Lire les stocks','stock',3,'lire',NULL,'r',1),
	(1002,'Creer/Modifier les stocks','stock',1,'creer',NULL,'w',0),
	(1002,'Creer/Modifier les stocks','stock',3,'creer',NULL,'w',0),
	(1003,'Supprimer les stocks','stock',1,'supprimer',NULL,'d',0),
	(1003,'Supprimer les stocks','stock',3,'supprimer',NULL,'d',0),
	(1004,'Lire mouvements de stocks','stock',1,'mouvement','lire','r',1),
	(1004,'Lire mouvements de stocks','stock',3,'mouvement','lire','r',1),
	(1005,'Creer/modifier mouvements de stocks','stock',1,'mouvement','creer','w',0),
	(1005,'Creer/modifier mouvements de stocks','stock',3,'mouvement','creer','w',0),
	(1181,'Consulter les fournisseurs','fournisseur',1,'lire',NULL,'r',1),
	(1181,'Consulter les fournisseurs','fournisseur',3,'lire',NULL,'r',1),
	(1182,'Consulter les commandes fournisseur','fournisseur',1,'commande','lire','r',1),
	(1182,'Consulter les commandes fournisseur','fournisseur',3,'commande','lire','r',1),
	(1183,'Creer une commande fournisseur','fournisseur',1,'commande','creer','w',0),
	(1183,'Creer une commande fournisseur','fournisseur',3,'commande','creer','w',0),
	(1184,'Valider une commande fournisseur','fournisseur',1,'commande','valider','w',0),
	(1184,'Valider une commande fournisseur','fournisseur',3,'commande','valider','w',0),
	(1185,'Approuver une commande fournisseur','fournisseur',1,'commande','approuver','w',0),
	(1185,'Approuver une commande fournisseur','fournisseur',3,'commande','approuver','w',0),
	(1186,'Commander une commande fournisseur','fournisseur',1,'commande','commander','w',0),
	(1186,'Commander une commande fournisseur','fournisseur',3,'commande','commander','w',0),
	(1187,'Receptionner une commande fournisseur','fournisseur',1,'commande','receptionner','d',0),
	(1187,'Receptionner une commande fournisseur','fournisseur',3,'commande','receptionner','d',0),
	(1188,'Supprimer une commande fournisseur','fournisseur',1,'commande','supprimer','d',0),
	(1188,'Supprimer une commande fournisseur','fournisseur',3,'commande','supprimer','d',0),
	(1201,'Lire les exports','export',1,'lire',NULL,'r',1),
	(1202,'Creer/modifier un export','export',1,'creer',NULL,'w',0),
	(1231,'Consulter les factures fournisseur','fournisseur',1,'facture','lire','r',1),
	(1231,'Consulter les factures fournisseur','fournisseur',3,'facture','lire','r',1),
	(1232,'Creer une facture fournisseur','fournisseur',1,'facture','creer','w',0),
	(1232,'Creer une facture fournisseur','fournisseur',3,'facture','creer','w',0),
	(1233,'Valider une facture fournisseur','fournisseur',1,'facture','valider','w',0),
	(1233,'Valider une facture fournisseur','fournisseur',3,'facture','valider','w',0),
	(1234,'Supprimer une facture fournisseur','fournisseur',1,'facture','supprimer','d',0),
	(1234,'Supprimer une facture fournisseur','fournisseur',3,'facture','supprimer','d',0),
	(1235,'Envoyer les factures par mail','fournisseur',1,'supplier_invoice_advance','send','a',0),
	(1235,'Envoyer les factures par mail','fournisseur',3,'supplier_invoice_advance','send','a',0),
	(1236,'Exporter les factures fournisseurs, attributs et reglements','fournisseur',1,'facture','export','r',0),
	(1236,'Exporter les factures fournisseurs, attributs et reglements','fournisseur',3,'facture','export','r',0),
	(1237,'Exporter les commande fournisseurs, attributs','fournisseur',1,'commande','export','r',0),
	(1237,'Exporter les commande fournisseurs, attributs','fournisseur',3,'commande','export','r',0),
	(1321,'Exporter les factures clients, attributs et reglements','facture',1,'facture','export','r',0),
	(1321,'Exporter les factures clients, attributs et reglements','facture',3,'facture','export','r',0),
	(1421,'Exporter les commandes clients et attributs','commande',1,'commande','export','r',0),
	(1421,'Exporter les commandes clients et attributs','commande',3,'commande','export','r',0),
	(5001,'Consulter les infos société','multicompany',1,'read',NULL,'r',1),
	(5001,'Consulter les infos société','multicompany',3,'read',NULL,'r',1),
	(5002,'Modifier la fiche société','multicompany',1,'write',NULL,'w',0),
	(5002,'Modifier la fiche société','multicompany',3,'write',NULL,'w',0),
	(1032141,'Lecture','wyndterminal',1,'lire',NULL,'w',1),
	(1032142,'Modification','wyndterminal',1,'modifier',NULL,'w',0),
	(1032143,'Ajout','wyndterminal',1,'creer',NULL,'w',0),
	(1032144,'Suppression','wyndterminal',1,'supprimer',NULL,'w',0);

/*!40000 ALTER TABLE `llx_rights_def` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_shift_report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_shift_report`;

CREATE TABLE `llx_shift_report` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `amount` float(10,6) NOT NULL DEFAULT '0.000000',
  `system_amount` float(10,6) NOT NULL DEFAULT '0.000000',
  `delta_amount` float(10,6) NOT NULL DEFAULT '0.000000',
  `type` enum('INITIAL','REPORT_X','REPORT_Z') NOT NULL DEFAULT 'INITIAL',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(9) NOT NULL,
  `updated_by` int(9) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `created_by` (`created_by`),
  KEY `fk_account` (`fk_account`),
  KEY `FK__llx_user` (`fk_user`),
  KEY `Index 1` (`rowid`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_shift_report_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_shift_report_config`;

CREATE TABLE `llx_shift_report_config` (
  `rowid` int(9) NOT NULL AUTO_INCREMENT,
  `entity` int(9) DEFAULT NULL,
  `management_type` enum('TILL','CASHIER') DEFAULT 'CASHIER',
  `is_initial_report_required` tinyint(1) DEFAULT '0',
  `is_allow_initial_report_empty` tinyint(1) DEFAULT '0',
  `has_range_management` tinyint(1) DEFAULT '0',
  `range_amount` float(10,6) DEFAULT '0.000000',
  `is_allow_range_exceed` tinyint(1) DEFAULT '0',
  `has_range_repeat_management` tinyint(1) DEFAULT '0',
  `range_repeat_count` tinyint(2) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(9) NOT NULL,
  `updated_by` int(9) NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  KEY `llx_shift_report_config_llx_entity_rowid_fk` (`entity`),
  KEY `llx_shift_report_config_llx_user_rowid_created_by_fk` (`created_by`),
  KEY `llx_shift_report_config_llx_user_rowid_update_by_fk` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_shift_report_lines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_shift_report_lines`;

CREATE TABLE `llx_shift_report_lines` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `amount` float(10,6) NOT NULL,
  `quantity` int(3) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `Index 1` (`rowid`),
  KEY `FK__llx_wynd_shift_report` (`fk_report`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_societe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_societe`;

CREATE TABLE `llx_societe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `ref_int` varchar(60) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT '0',
  `parent` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `code_client` varchar(24) DEFAULT NULL,
  `code_fournisseur` varchar(24) DEFAULT NULL,
  `code_compta` varchar(24) DEFAULT NULL,
  `code_compta_fournisseur` varchar(24) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT '0',
  `fk_pays` int(11) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `fk_effectif` int(11) DEFAULT '0',
  `fk_typent` int(11) DEFAULT '0',
  `fk_forme_juridique` int(11) DEFAULT '0',
  `fk_currency` varchar(3) DEFAULT NULL,
  `siren` varchar(128) DEFAULT NULL,
  `siret` varchar(128) DEFAULT NULL,
  `ape` varchar(128) DEFAULT NULL,
  `idprof4` varchar(128) DEFAULT NULL,
  `idprof5` varchar(128) DEFAULT NULL,
  `idprof6` varchar(128) DEFAULT NULL,
  `tva_intra` varchar(20) DEFAULT NULL,
  `capital` double DEFAULT NULL,
  `fk_stcomm` int(11) NOT NULL DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `prefix_comm` varchar(5) DEFAULT NULL,
  `client` tinyint(4) DEFAULT '0',
  `fournisseur` tinyint(4) DEFAULT '0',
  `supplier_account` varchar(32) DEFAULT NULL,
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `customer_bad` tinyint(4) DEFAULT '0',
  `customer_rate` double DEFAULT '0',
  `supplier_rate` double DEFAULT '0',
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `remise_client` double DEFAULT '0',
  `mode_reglement` tinyint(4) DEFAULT NULL,
  `cond_reglement` tinyint(4) DEFAULT NULL,
  `mode_reglement_supplier` tinyint(4) DEFAULT NULL,
  `cond_reglement_supplier` tinyint(4) DEFAULT NULL,
  `tva_assuj` tinyint(4) DEFAULT '1',
  `localtax1_assuj` tinyint(4) DEFAULT '0',
  `localtax2_assuj` tinyint(4) DEFAULT '0',
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT '0',
  `price_level` int(11) DEFAULT NULL,
  `outstanding_limit` double(24,8) DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL COMMENT 'The customer login',
  `password` varchar(255) DEFAULT NULL COMMENT 'The customer hash password',
  `salt` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_prefix_comm` (`prefix_comm`,`entity`),
  UNIQUE KEY `uk_societe_code_client` (`code_client`,`entity`),
  UNIQUE KEY `uk_societe_code_fournisseur` (`code_fournisseur`,`entity`),
  UNIQUE KEY `uk_societe_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_societe_user_creat` (`fk_user_creat`),
  KEY `idx_societe_user_modif` (`fk_user_modif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_societe` WRITE;
/*!40000 ALTER TABLE `llx_societe` DISABLE KEYS */;

INSERT INTO `llx_societe` (`rowid`, `nom`, `entity`, `ref_ext`, `ref_int`, `statut`, `parent`, `tms`, `datec`, `status`, `code_client`, `code_fournisseur`, `code_compta`, `code_compta_fournisseur`, `address`, `zip`, `town`, `fk_departement`, `fk_pays`, `phone`, `fax`, `url`, `email`, `skype`, `fk_effectif`, `fk_typent`, `fk_forme_juridique`, `fk_currency`, `siren`, `siret`, `ape`, `idprof4`, `idprof5`, `idprof6`, `tva_intra`, `capital`, `fk_stcomm`, `note_private`, `note_public`, `prefix_comm`, `client`, `fournisseur`, `supplier_account`, `fk_prospectlevel`, `customer_bad`, `customer_rate`, `supplier_rate`, `fk_user_creat`, `fk_user_modif`, `remise_client`, `mode_reglement`, `cond_reglement`, `mode_reglement_supplier`, `cond_reglement_supplier`, `tva_assuj`, `localtax1_assuj`, `localtax2_assuj`, `barcode`, `fk_barcode_type`, `price_level`, `outstanding_limit`, `default_lang`, `logo`, `canvas`, `import_key`, `login`, `password`, `salt`)
VALUES
	(1,'Client par défaut',1,'CAISSECLI','CAISSECLI',0,NULL,'2014-12-09 06:03:32','2014-09-24 11:16:13',1,'CAISSECLI',NULL,NULL,NULL,'',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'0','','','','','','','',0,0,NULL,NULL,NULL,1,0,NULL,NULL,0,0,0,1,1,0,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'Perte',1,'LOST','LOST',0,NULL,'2014-12-09 06:03:49','2014-11-28 15:20:04',1,'LOST',NULL,NULL,NULL,'',NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'','','','','','','',0,0,NULL,NULL,NULL,3,1,NULL,NULL,0,0,0,1,1,0,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,NULL,NULL,'fr_FR',NULL,NULL,NULL,NULL,NULL,NULL),
	(3,'Yy Fgn',1,'Yy Fgn',NULL,0,NULL,'2016-03-30 09:10:38','2016-03-23 21:58:11',1,NULL,NULL,NULL,NULL,'86 Rue de Dunkerque','75009','Paris',0,0,'0102030405',NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1,0,NULL,NULL,0,0,0,33,33,0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'Eric Dasilva',1,'Eric Dasilva',NULL,0,NULL,'2016-03-30 08:59:57','2016-03-24 10:44:17',1,NULL,NULL,NULL,NULL,'2 Rue de l\'Imprimerie','93210','Saint-Denis',0,0,'0619631309',NULL,NULL,'edasilva@wynd.eu',NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1,0,NULL,NULL,0,0,0,33,33,0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,'Eric Dasilva',1,'Eric Dasilva',NULL,0,NULL,'2016-03-30 09:03:34','2016-03-30 11:03:34',1,NULL,NULL,NULL,NULL,'13 Allée des Charmes','92500','Rueil-Malmaison',0,0,'0123456789',NULL,NULL,'dasilvaeric1988@hotmail.com',NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1,0,NULL,NULL,0,0,0,33,NULL,0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,'Tii Toto',1,'Tii Toto',NULL,0,NULL,'2016-03-30 16:42:15','2016-03-30 16:42:15',1,NULL,NULL,NULL,NULL,'20 Rue Saint-Georges','75009','Paris',0,0,'0102030409',NULL,NULL,'toto@mail.fr',NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1,0,NULL,NULL,0,0,0,33,NULL,0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,'Claude Martin',1,'Claude Martin',NULL,0,NULL,'2016-04-04 11:46:06','2016-04-04 13:46:06',1,NULL,NULL,NULL,NULL,'1 Allée des Ateliers','93500','Pantin',0,0,'0612141516',NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1,0,NULL,NULL,0,0,0,33,NULL,0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,'Christophe Michel',1,'Christophe Michel',NULL,0,NULL,'2016-04-04 16:49:20','2016-04-04 18:48:28',1,NULL,NULL,NULL,NULL,'17 PLACE DES REFLETS','92400','Saint-Denis',0,0,'0123456798',NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1,0,NULL,NULL,0,0,0,33,33,0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(9,'Thomas Domay',1,'Thomas Domay',NULL,0,NULL,'2016-04-06 13:40:44','2016-04-06 15:39:39',1,NULL,NULL,NULL,NULL,'1 Rue Scribe','75009','Paris',0,0,'0600000000',NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1,0,NULL,NULL,0,0,0,33,33,0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,'Maxime Corson',1,'Maxime Corson',NULL,0,NULL,'2016-10-04 13:38:19','2016-10-04 15:38:19',1,NULL,NULL,NULL,NULL,'8 Rue Jean Jaurès','78330','Fontenay-le-Fleury',0,0,'0668352026',NULL,NULL,'mcorson@wynd.eu',NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1,0,NULL,NULL,0,0,0,2,NULL,0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(11,'safwen toukabri',0,NULL,NULL,0,NULL,'2016-12-16 14:11:53','2016-12-16 15:11:53',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,'usertest1.wynd@yopmail.com',NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'usertest1.wynd@yopmail.com','$2y$10$0D./bEQpsnr/sQaBXKHQT.fEXQ0KMwOWEwQvj2cVf0GNr96eCsHMi',NULL);

/*!40000 ALTER TABLE `llx_societe` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_societe_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_societe_address`;

CREATE TABLE `llx_societe_address` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(30) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT '0',
  `name` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `note` text,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_societe_commerciaux
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_societe_commerciaux`;

CREATE TABLE `llx_societe_commerciaux` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_commerciaux` (`fk_soc`,`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_societe_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_societe_extrafields`;

CREATE TABLE `llx_societe_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `customer_login` varchar(255) DEFAULT NULL,
  `customer_hashpassword` varchar(255) DEFAULT NULL,
  `customer_fid_id` varchar(255) DEFAULT NULL,
  `customer_wyndpay_id` varchar(255) DEFAULT NULL,
  `customer_token_life` varchar(10) DEFAULT NULL,
  `customer_token` varchar(25) DEFAULT NULL,
  `customer_address_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_societe_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_societe_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_societe_log`;

CREATE TABLE `llx_societe_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datel` datetime DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_statut` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_societe_prices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_societe_prices`;

CREATE TABLE `llx_societe_prices` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT '0',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `price_level` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_societe_remise
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_societe_remise`;

CREATE TABLE `llx_societe_remise` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_client` double(6,3) NOT NULL DEFAULT '0.000',
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_societe_remise_except
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_societe_remise_except`;

CREATE TABLE `llx_societe_remise_except` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `amount_ht` double(24,8) NOT NULL,
  `amount_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `amount_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `tva_tx` double(6,3) NOT NULL DEFAULT '0.000',
  `fk_user` int(11) NOT NULL,
  `fk_facture_line` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_societe_remise_except_fk_user` (`fk_user`),
  KEY `idx_societe_remise_except_fk_soc` (`fk_soc`),
  KEY `idx_societe_remise_except_fk_facture_line` (`fk_facture_line`),
  KEY `idx_societe_remise_except_fk_facture` (`fk_facture`),
  KEY `idx_societe_remise_except_fk_facture_source` (`fk_facture_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_societe_rib
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_societe_rib`;

CREATE TABLE `llx_societe_rib` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(30) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(7) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(20) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `default_rib` smallint(6) NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_socpeople
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_socpeople`;

CREATE TABLE `llx_socpeople` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL COMMENT 'Customer''s address label',
  `civilite` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `digicode` varchar(255) DEFAULT NULL,
  `floor` varchar(50) DEFAULT NULL,
  `door` varchar(50) DEFAULT NULL,
  `additional_information` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `poste` varchar(80) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jabberid` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `no_email` smallint(6) NOT NULL DEFAULT '0',
  `priv` smallint(6) NOT NULL DEFAULT '0',
  `fk_user_creat` int(11) DEFAULT '0',
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `default_lang` varchar(6) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT '1',
  `newsletter` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_fk_soc` (`fk_soc`),
  KEY `idx_socpeople_fk_user_creat` (`fk_user_creat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_socpeople` WRITE;
/*!40000 ALTER TABLE `llx_socpeople` DISABLE KEYS */;

INSERT INTO `llx_socpeople` (`rowid`, `datec`, `tms`, `fk_soc`, `entity`, `ref_ext`, `label`, `civilite`, `lastname`, `firstname`, `address`, `digicode`, `floor`, `door`, `additional_information`, `zip`, `town`, `fk_departement`, `fk_pays`, `birthday`, `poste`, `phone`, `phone_perso`, `phone_mobile`, `fax`, `email`, `jabberid`, `skype`, `no_email`, `priv`, `fk_user_creat`, `fk_user_modif`, `note_private`, `note_public`, `default_lang`, `canvas`, `import_key`, `statut`, `newsletter`)
VALUES
	(1,'2016-10-04 15:38:19','2016-10-04 13:38:19',10,1,NULL,NULL,NULL,'Corson','Maxime','8 Rue Jean Jaurès',NULL,NULL,NULL,NULL,'78330','Fontenay-le-Fleury',NULL,0,NULL,NULL,'0668352026',NULL,NULL,NULL,'mcorson@wynd.eu',NULL,NULL,0,0,2,NULL,NULL,NULL,NULL,NULL,NULL,1,0),
	(2,'2016-12-16 15:11:53','2016-12-16 14:11:53',11,1,NULL,NULL,NULL,'Toukabri','Safwen','22 Rue de la Tour d\'Auvergne, Paris, France','1702',NULL,NULL,'Bâtment C - 2ème étage - porte droite droite',NULL,NULL,NULL,0,NULL,NULL,'0689714562',NULL,NULL,NULL,'usertest1.wynd@yopmail.com',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0);

/*!40000 ALTER TABLE `llx_socpeople` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_socpeople_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_socpeople_extrafields`;

CREATE TABLE `llx_socpeople_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `digicod` varchar(255) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `intercom` varchar(255) DEFAULT NULL,
  `extra_data` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_socpeople_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_socpeople_extrafields` DISABLE KEYS */;

INSERT INTO `llx_socpeople_extrafields` (`rowid`, `tms`, `fk_object`, `import_key`, `digicod`, `floor`, `intercom`, `extra_data`)
VALUES
	(1,'2016-10-04 13:38:19',1,NULL,NULL,NULL,NULL,NULL),
	(2,'2016-12-16 14:11:53',2,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `llx_socpeople_extrafields` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_stock_mouvement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_stock_mouvement`;

CREATE TABLE `llx_stock_mouvement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datem` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `price` float(13,4) DEFAULT '0.0000',
  `type_mouvement` smallint(6) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `fk_origin` int(11) DEFAULT NULL,
  `origintype` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_stock_mouvement_fk_product` (`fk_product`),
  KEY `idx_stock_mouvement_fk_entrepot` (`fk_entrepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_tag`;

CREATE TABLE `llx_tag` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `picture_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `llx_tag_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `llx_type` (`rowid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

LOCK TABLES `llx_tag` WRITE;
/*!40000 ALTER TABLE `llx_tag` DISABLE KEYS */;

INSERT INTO `llx_tag` (`rowid`, `type_id`, `label`, `description`, `picture_url`, `uuid`)
VALUES
	(1,1,'molestiae','Aut esse libero eveniet nesciunt.','http://lorempixel.com/640/480/?32241','9684f1ff-f035-4518-a834-7ae4faf130c3'),
	(2,2,'et','Aspernatur sapiente voluptatum sint eum nobis et et.','http://lorempixel.com/640/480/?92951','e66b4221-e6e0-4323-b329-7db2d5138b95'),
	(3,3,'fuga','Consequatur cum esse laborum sequi.','http://lorempixel.com/640/480/?11643','03e52dc1-27ca-41ce-8222-2537403402bd'),
	(4,4,'debitis','Aperiam nam nemo consequatur voluptates.','http://lorempixel.com/640/480/?60913','982e5a85-914b-4d43-83fa-0f738cdf594e'),
	(5,5,'ut','Quis labore facilis sit ea quia velit quia laudantium.','http://lorempixel.com/640/480/?42487','4df4e75c-a064-4372-b90e-73246f0c61a2');

/*!40000 ALTER TABLE `llx_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_tags_entities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_tags_entities`;

CREATE TABLE `llx_tags_entities` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `tag_id` (`tag_id`),
  KEY `entity_id` (`entity_id`),
  CONSTRAINT `llx_tags_entities_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `llx_tag` (`rowid`),
  CONSTRAINT `llx_tags_entities_ibfk_2` FOREIGN KEY (`entity_id`) REFERENCES `llx_entity` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;



# Affichage de la table llx_tags_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_tags_products`;

CREATE TABLE `llx_tags_products` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `tag_id` (`tag_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `llx_tags_products_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `llx_tag` (`rowid`),
  CONSTRAINT `llx_tags_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

LOCK TABLES `llx_tags_products` WRITE;
/*!40000 ALTER TABLE `llx_tags_products` DISABLE KEYS */;

INSERT INTO `llx_tags_products` (`rowid`, `tag_id`, `product_id`)
VALUES
	(1,4,1),
	(2,5,2),
	(3,5,3),
	(4,4,4),
	(5,2,5),
	(6,3,6),
	(7,3,7),
	(8,4,8),
	(9,5,9),
	(10,3,10);

/*!40000 ALTER TABLE `llx_tags_products` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_takeaway_c_blacklist_adress
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_blacklist_adress`;

CREATE TABLE `llx_takeaway_c_blacklist_adress` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(200) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(200) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_c_cashdesk_button
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_cashdesk_button`;

CREATE TABLE `llx_takeaway_c_cashdesk_button` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type_button` varchar(10) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `params` text,
  `type_action` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_takeaway_c_cashdesk_button` WRITE;
/*!40000 ALTER TABLE `llx_takeaway_c_cashdesk_button` DISABLE KEYS */;

INSERT INTO `llx_takeaway_c_cashdesk_button` (`rowid`, `type_button`, `code`, `label`, `active`, `params`, `type_action`)
VALUES
	(10,'promo','10%_note','-10% Note',1,NULL,NULL);

/*!40000 ALTER TABLE `llx_takeaway_c_cashdesk_button` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_takeaway_c_dest_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_dest_order`;

CREATE TABLE `llx_takeaway_c_dest_order` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_takeaway_c_dest_order` WRITE;
/*!40000 ALTER TABLE `llx_takeaway_c_dest_order` DISABLE KEYS */;

INSERT INTO `llx_takeaway_c_dest_order` (`rowid`, `code`, `label`, `active`, `module`)
VALUES
	(103002541,'onsite','Sur place',1,NULL),
	(103002542,'takeaway','A emporter',1,NULL),
	(103002543,'drive','Drive',1,NULL),
	(103002544,'delivery','Livraison',1,NULL),
	(103002545,'table','A table',0,NULL);

/*!40000 ALTER TABLE `llx_takeaway_c_dest_order` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_takeaway_c_dict_cashdesk_mesg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_dict_cashdesk_mesg`;

CREATE TABLE `llx_takeaway_c_dict_cashdesk_mesg` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '0',
  `text` varchar(255) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_c_dict_coupure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_dict_coupure`;

CREATE TABLE `llx_takeaway_c_dict_coupure` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '0',
  `valeur` double NOT NULL DEFAULT '0',
  `input_amount` int(11) NOT NULL DEFAULT '0',
  `code_paiement_mode` varchar(20) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_c_dict_customer_display
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_dict_customer_display`;

CREATE TABLE `llx_takeaway_c_dict_customer_display` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `status` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_takeaway_c_dict_customer_display` WRITE;
/*!40000 ALTER TABLE `llx_takeaway_c_dict_customer_display` DISABLE KEYS */;

INSERT INTO `llx_takeaway_c_dict_customer_display` (`rowid`, `message`, `status`, `active`)
VALUES
	(4,'<!DOCTYPE html>\r\n<HTML>\r\n	<HEAD>\r\n		<style type=\"text/css\">\r\n			h1 {\r\n				font-size: 350%;\r\n				font-weight:100;\r\n				align:right;\r\n			}\r\n			body{\r\n				background-color:black;\r\n				color:white;\r\n				font-family: Tahoma, Helvetica, sans-serif;\r\n			}\r\n			#logo{\r\n				position:fixed;\r\n				bottom:30px;\r\n				left:340px;\r\n			}\r\n			#soustitre{\r\n				position:inherit;\r\n				padding-left:10px;\r\n			}\r\n			#total{\r\n				right:50px;\r\n				position:fixed;\r\n			}\r\n		</style>\r\n	</HEAD>\r\n	<BODY>\r\n		<div id=\"logo\"><img src=\"http://127.0.0.1/public/takeaway/logo/logo_small.png\"><br />\r\n			<div id=\"soustitre\"><strong>le N°1 du KEBAB</strong></div>\r\n		</div>\r\n		<div id=\"total\"><h1 align=\"right\"><br />TOTAL : $total$ &euro; </h1></div>\r\n	</BODY>\r\n</HTML>',3,1);

/*!40000 ALTER TABLE `llx_takeaway_c_dict_customer_display` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_takeaway_c_dict_product_size_subs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_dict_product_size_subs`;

CREATE TABLE `llx_takeaway_c_dict_product_size_subs` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `prod_id_ori` int(11) DEFAULT NULL,
  `prod_id_dest` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_takeaway_c_dict_product_size_subs` (`prod_id_ori`,`prod_id_dest`,`type`),
  KEY `tk_dict_product_size_dest` (`prod_id_dest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_c_dict_service_restau
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_dict_service_restau`;

CREATE TABLE `llx_takeaway_c_dict_service_restau` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `label` varchar(100) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_takeaway_c_dict_service_restau` WRITE;
/*!40000 ALTER TABLE `llx_takeaway_c_dict_service_restau` DISABLE KEYS */;

INSERT INTO `llx_takeaway_c_dict_service_restau` (`rowid`, `code`, `label`, `active`)
VALUES
	(103002541,'NAN','Nan',1);

/*!40000 ALTER TABLE `llx_takeaway_c_dict_service_restau` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_takeaway_c_product_allergene
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_product_allergene`;

CREATE TABLE `llx_takeaway_c_product_allergene` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `label` varchar(2000) DEFAULT NULL,
  `entity` int(11) DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_c_promo_coupon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_c_promo_coupon`;

CREATE TABLE `llx_takeaway_c_promo_coupon` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code_promo` varchar(200) DEFAULT NULL,
  `code_promo_client` varchar(200) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_customer_display
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_customer_display`;

CREATE TABLE `llx_takeaway_customer_display` (
  `fk_caisse` int(11) NOT NULL,
  `ip_caisse` varchar(255) DEFAULT NULL,
  `message` text,
  `fk_product` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`fk_caisse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_fond_de_caisse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_fond_de_caisse`;

CREATE TABLE `llx_takeaway_fond_de_caisse` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `nb_item` double(24,2) NOT NULL DEFAULT '0.00',
  `valeur` double(24,2) NOT NULL DEFAULT '0.00',
  `fk_c_dict_coupure` int(11) DEFAULT NULL,
  `fk_caisse` int(11) DEFAULT NULL,
  `fk_user_manager` int(11) DEFAULT NULL,
  `fk_user_equip` int(11) DEFAULT NULL,
  `mode_fc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_c_dict_coupure` (`fk_c_dict_coupure`),
  KEY `idx_fk_caisse` (`fk_caisse`),
  KEY `idx_fk_user_manager` (`fk_user_manager`),
  KEY `idx_fk_user_equip` (`fk_user_equip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_hours_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_hours_plan`;

CREATE TABLE `llx_takeaway_hours_plan` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `weekday` varchar(20) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `max_order` int(11) DEFAULT NULL,
  `current_order` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_takeaway_hours_plan` WRITE;
/*!40000 ALTER TABLE `llx_takeaway_hours_plan` DISABLE KEYS */;

INSERT INTO `llx_takeaway_hours_plan` (`rowid`, `entity`, `weekday`, `start_time`, `end_time`, `max_order`, `current_order`, `datec`, `tms`)
VALUES
	(113,1,'1','2017-01-04 09:00:00','2017-01-04 09:30:00',3,0,NULL,'2017-01-05 14:35:06'),
	(114,1,'1','2017-01-04 09:30:00','2017-01-04 10:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(115,1,'1','2017-01-04 10:00:00','2017-01-04 10:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(116,1,'1','2017-01-04 10:30:00','2017-01-04 11:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(117,1,'1','2017-01-04 11:00:00','2017-01-04 11:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(118,1,'1','2017-01-04 11:30:00','2017-01-04 12:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(119,1,'1','2017-01-04 12:00:00','2017-01-04 12:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(120,1,'1','2017-01-04 12:30:00','2017-01-04 13:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(121,1,'1','2017-01-04 13:00:00','2017-01-04 13:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(122,1,'1','2017-01-04 13:30:00','2017-01-04 14:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(123,1,'1','2017-01-04 14:00:00','2017-01-04 14:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(124,1,'1','2017-01-04 14:30:00','2017-01-04 15:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(125,1,'1','2017-01-04 15:00:00','2017-01-04 15:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(126,1,'1','2017-01-04 15:30:00','2017-01-04 16:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(127,1,'1','2017-01-04 16:00:00','2017-01-04 16:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(128,1,'1','2017-01-04 16:30:00','2017-01-04 17:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(129,1,'2','2017-01-04 09:00:00','2017-01-04 09:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(130,1,'2','2017-01-04 09:30:00','2017-01-04 10:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(131,1,'2','2017-01-04 10:00:00','2017-01-04 10:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(132,1,'2','2017-01-04 10:30:00','2017-01-04 11:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(133,1,'2','2017-01-04 11:00:00','2017-01-04 11:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(134,1,'2','2017-01-04 11:30:00','2017-01-04 12:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(135,1,'2','2017-01-04 12:00:00','2017-01-04 12:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(136,1,'2','2017-01-04 12:30:00','2017-01-04 13:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(137,1,'2','2017-01-04 13:00:00','2017-01-04 13:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(138,1,'2','2017-01-04 13:30:00','2017-01-04 14:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(139,1,'2','2017-01-04 14:00:00','2017-01-04 14:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(140,1,'2','2017-01-04 14:30:00','2017-01-04 15:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(141,1,'2','2017-01-04 15:00:00','2017-01-04 15:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(142,1,'2','2017-01-04 15:30:00','2017-01-04 16:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(143,1,'2','2017-01-04 16:00:00','2017-01-04 16:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(144,1,'2','2017-01-04 16:30:00','2017-01-04 17:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(145,1,'3','2017-01-04 09:00:00','2017-01-04 09:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(146,1,'3','2017-01-04 09:30:00','2017-01-04 10:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(147,1,'3','2017-01-04 10:00:00','2017-01-04 10:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(148,1,'3','2017-01-04 10:30:00','2017-01-04 11:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(149,1,'3','2017-01-04 11:00:00','2017-01-04 11:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(150,1,'3','2017-01-04 11:30:00','2017-01-04 12:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(151,1,'3','2017-01-04 12:00:00','2017-01-04 12:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(152,1,'3','2017-01-04 12:30:00','2017-01-04 13:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(153,1,'3','2017-01-04 13:00:00','2017-01-04 13:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(154,1,'3','2017-01-04 13:30:00','2017-01-04 14:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(155,1,'3','2017-01-04 14:00:00','2017-01-04 14:30:00',3,0,NULL,'2017-01-05 15:43:45'),
	(156,1,'3','2017-01-04 14:30:00','2017-01-04 15:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(157,1,'3','2017-01-04 15:00:00','2017-01-04 15:30:00',3,0,NULL,'2017-01-05 15:43:50'),
	(158,1,'3','2017-01-04 15:30:00','2017-01-04 16:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(159,1,'3','2017-01-04 16:00:00','2017-01-04 16:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(160,1,'3','2017-01-04 16:30:00','2017-01-04 17:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(161,1,'4','2017-01-04 09:00:00','2017-01-04 09:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(162,1,'4','2017-01-04 09:30:00','2017-01-04 10:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(163,1,'4','2017-01-04 10:00:00','2017-01-04 10:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(164,1,'4','2017-01-04 10:30:00','2017-01-04 11:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(165,1,'4','2017-01-04 11:00:00','2017-01-04 11:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(166,1,'4','2017-01-04 11:30:00','2017-01-04 12:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(167,1,'4','2017-01-04 12:00:00','2017-01-04 12:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(168,1,'4','2017-01-04 12:30:00','2017-01-04 13:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(169,1,'4','2017-01-04 13:00:00','2017-01-04 13:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(170,1,'4','2017-01-04 13:30:00','2017-01-04 14:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(171,1,'4','2017-01-04 14:00:00','2017-01-04 14:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(172,1,'4','2017-01-04 14:30:00','2017-01-04 15:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(173,1,'4','2017-01-04 15:00:00','2017-01-04 15:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(174,1,'4','2017-01-04 15:30:00','2017-01-04 16:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(175,1,'4','2017-01-04 16:00:00','2017-01-04 16:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(176,1,'4','2017-01-04 16:30:00','2017-01-04 17:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(177,1,'5','2017-01-04 09:00:00','2017-01-04 09:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(178,1,'5','2017-01-04 09:30:00','2017-01-04 10:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(179,1,'5','2017-01-04 10:00:00','2017-01-04 10:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(180,1,'5','2017-01-04 10:30:00','2017-01-04 11:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(181,1,'5','2017-01-04 11:00:00','2017-01-04 11:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(182,1,'5','2017-01-04 11:30:00','2017-01-04 12:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(183,1,'5','2017-01-04 12:00:00','2017-01-04 12:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(184,1,'5','2017-01-04 12:30:00','2017-01-04 13:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(185,1,'5','2017-01-04 13:00:00','2017-01-04 13:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(186,1,'5','2017-01-04 13:30:00','2017-01-04 14:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(187,1,'5','2017-01-04 14:00:00','2017-01-04 14:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(188,1,'5','2017-01-04 14:30:00','2017-01-04 15:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(189,1,'5','2017-01-04 15:00:00','2017-01-04 15:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(190,1,'5','2017-01-04 15:30:00','2017-01-04 16:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(191,1,'5','2017-01-04 16:00:00','2017-01-04 16:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(192,1,'5','2017-01-04 16:30:00','2017-01-04 17:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(193,1,'6','2017-01-04 09:00:00','2017-01-04 09:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(194,1,'6','2017-01-04 09:30:00','2017-01-04 10:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(195,1,'6','2017-01-04 10:00:00','2017-01-04 10:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(196,1,'6','2017-01-04 10:30:00','2017-01-04 11:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(197,1,'6','2017-01-04 11:00:00','2017-01-04 11:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(198,1,'6','2017-01-04 11:30:00','2017-01-04 12:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(199,1,'6','2017-01-04 12:00:00','2017-01-04 12:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(200,1,'6','2017-01-04 12:30:00','2017-01-04 13:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(201,1,'6','2017-01-04 13:00:00','2017-01-04 13:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(202,1,'6','2017-01-04 13:30:00','2017-01-04 14:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(203,1,'6','2017-01-04 14:00:00','2017-01-04 14:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(204,1,'6','2017-01-04 14:30:00','2017-01-04 15:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(205,1,'6','2017-01-04 15:00:00','2017-01-04 15:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(206,1,'6','2017-01-04 15:30:00','2017-01-04 16:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(207,1,'6','2017-01-04 16:00:00','2017-01-04 16:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(208,1,'6','2017-01-04 16:30:00','2017-01-04 17:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(209,1,'7','2017-01-04 09:00:00','2017-01-04 09:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(210,1,'7','2017-01-04 09:30:00','2017-01-04 10:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(211,1,'7','2017-01-04 10:00:00','2017-01-04 10:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(212,1,'7','2017-01-04 10:30:00','2017-01-04 11:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(213,1,'7','2017-01-04 11:00:00','2017-01-04 11:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(214,1,'7','2017-01-04 11:30:00','2017-01-04 12:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(215,1,'7','2017-01-04 12:00:00','2017-01-04 12:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(216,1,'7','2017-01-04 12:30:00','2017-01-04 13:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(217,1,'7','2017-01-04 13:00:00','2017-01-04 13:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(218,1,'7','2017-01-04 13:30:00','2017-01-04 14:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(219,1,'7','2017-01-04 14:00:00','2017-01-04 14:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(220,1,'7','2017-01-04 14:30:00','2017-01-04 15:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(221,1,'7','2017-01-04 15:00:00','2017-01-04 15:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(222,1,'7','2017-01-04 15:30:00','2017-01-04 16:00:00',3,0,NULL,'2017-01-05 14:35:25'),
	(223,1,'7','2017-01-04 16:00:00','2017-01-04 16:30:00',3,0,NULL,'2017-01-05 14:35:25'),
	(224,1,'7','2017-01-04 16:30:00','2017-01-04 17:00:00',3,0,NULL,'2017-01-05 14:35:25');

/*!40000 ALTER TABLE `llx_takeaway_hours_plan` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_takeaway_odyssey
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_odyssey`;

CREATE TABLE `llx_takeaway_odyssey` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_commandedet` int(11) NOT NULL,
  `qty` int(11) DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_order_summary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_order_summary`;

CREATE TABLE `llx_takeaway_order_summary` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `summary` text,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_order_take_time
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_order_take_time`;

CREATE TABLE `llx_takeaway_order_take_time` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_caisse` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `timespend` int(11) NOT NULL,
  `origine` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `total_ttc` double DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_product_composition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_product_composition`;

CREATE TABLE `llx_takeaway_product_composition` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_association` int(11) NOT NULL DEFAULT '0',
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `visible_onwebsite` int(11) NOT NULL DEFAULT '0',
  `visible_onpos` int(11) NOT NULL DEFAULT '0',
  `minimal` int(11) NOT NULL DEFAULT '0',
  `maximal` int(11) NOT NULL DEFAULT '0',
  `max_override` int(11) NOT NULL DEFAULT '0',
  `default_comp` int(11) NOT NULL DEFAULT '0',
  `trigger_cust_display` int(11) NOT NULL DEFAULT '0',
  `half_assist` int(11) NOT NULL DEFAULT '0',
  `cat_compo_web` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `break` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_takeaway_product_composition` (`fk_product_association`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_takeaway_product_composition` WRITE;
/*!40000 ALTER TABLE `llx_takeaway_product_composition` DISABLE KEYS */;

INSERT INTO `llx_takeaway_product_composition` (`rowid`, `fk_product_association`, `mandatory`, `visible_onwebsite`, `visible_onpos`, `minimal`, `maximal`, `max_override`, `default_comp`, `trigger_cust_display`, `half_assist`, `cat_compo_web`, `title`, `break`, `sort`)
VALUES
	(1561,19899,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1562,19900,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1563,19901,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1564,19902,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1565,19903,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1569,19907,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1570,19908,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1571,19909,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1572,19910,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1573,19911,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1574,19912,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1575,19913,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1576,19914,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1577,19915,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1578,19916,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1579,19917,0,0,0,0,0,0,0,1,0,0,'',0,0),
	(1580,19918,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1581,19919,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1582,19920,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1583,19921,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1584,19922,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1585,19923,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1586,19924,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1587,19925,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1588,19926,0,0,0,0,0,0,0,0,0,0,'',0,0),
	(1589,19927,0,0,0,0,0,0,0,0,0,0,'',0,0);

/*!40000 ALTER TABLE `llx_takeaway_product_composition` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_takeaway_product_upsell
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_product_upsell`;

CREATE TABLE `llx_takeaway_product_upsell` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT NULL,
  `fk_product_parent` int(11) NOT NULL DEFAULT '0',
  `fk_product_child` int(11) NOT NULL DEFAULT '0',
  `qty` double DEFAULT NULL,
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `visible_onwebsite` int(11) NOT NULL DEFAULT '0',
  `visible_onpos` int(11) NOT NULL DEFAULT '0',
  `minimal` int(11) NOT NULL DEFAULT '0',
  `maximal` int(11) NOT NULL DEFAULT '0',
  `max_override` int(11) NOT NULL DEFAULT '0',
  `default_comp` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `half_assist` int(11) NOT NULL DEFAULT '0',
  `cat_compo_web` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_takeaway_product_upsell` (`entity`,`fk_product_parent`,`fk_product_child`),
  KEY `idx_takeaway_product_upsell_fils` (`fk_product_child`),
  KEY `tk_upsell_fk_product_parent` (`fk_product_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_takeaway_product_upsell` WRITE;
/*!40000 ALTER TABLE `llx_takeaway_product_upsell` DISABLE KEYS */;

INSERT INTO `llx_takeaway_product_upsell` (`rowid`, `entity`, `fk_product_parent`, `fk_product_child`, `qty`, `mandatory`, `visible_onwebsite`, `visible_onpos`, `minimal`, `maximal`, `max_override`, `default_comp`, `title`, `sort`, `half_assist`, `cat_compo_web`)
VALUES
	(4,1,122,186,1,0,0,0,1,1,0,0,'',0,0,0);

/*!40000 ALTER TABLE `llx_takeaway_product_upsell` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_takeaway_product_variation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_product_variation`;

CREATE TABLE `llx_takeaway_product_variation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT NULL,
  `fk_product_parent` int(11) NOT NULL DEFAULT '0',
  `fk_product_child` int(11) NOT NULL DEFAULT '0',
  `qty` double DEFAULT NULL,
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `visible_onwebsite` int(11) NOT NULL DEFAULT '0',
  `visible_onpos` int(11) NOT NULL DEFAULT '0',
  `minimal` int(11) NOT NULL DEFAULT '0',
  `maximal` int(11) NOT NULL DEFAULT '0',
  `max_override` int(11) NOT NULL DEFAULT '0',
  `default_comp` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `half_assist` int(11) NOT NULL DEFAULT '0',
  `cat_compo_web` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_takeaway_product_variation` (`entity`,`fk_product_parent`,`fk_product_child`),
  KEY `idx_takeaway_product_variation_fils` (`fk_product_child`),
  KEY `tk_variation_fk_product_parent` (`fk_product_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_report_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_report_data`;

CREATE TABLE `llx_takeaway_report_data` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `reportdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reporttype` varchar(200) DEFAULT NULL,
  `reportdata` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `ux_takeaway_report_data` (`reportdate`,`reporttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_takeaway_synchro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_takeaway_synchro`;

CREATE TABLE `llx_takeaway_synchro` (
  `dt_order_centraltolocal` datetime DEFAULT NULL,
  `dt_order_localtocentral` datetime DEFAULT NULL,
  `dt_thirdparty` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_takeaway_synchro` WRITE;
/*!40000 ALTER TABLE `llx_takeaway_synchro` DISABLE KEYS */;

INSERT INTO `llx_takeaway_synchro` (`dt_order_centraltolocal`, `dt_order_localtocentral`, `dt_thirdparty`)
VALUES
	('2015-11-22 21:56:01','2015-11-22 21:56:01','2015-11-22 21:56:01');

/*!40000 ALTER TABLE `llx_takeaway_synchro` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_texts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_texts`;

CREATE TABLE `llx_texts` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(32) DEFAULT NULL,
  `typemodele` varchar(32) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `private` smallint(6) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `filename` varchar(128) DEFAULT NULL,
  `content` text,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_tva
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_tva`;

CREATE TABLE `llx_tva` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `fk_typepayment` int(11) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_type`;

CREATE TABLE `llx_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

LOCK TABLES `llx_type` WRITE;
/*!40000 ALTER TABLE `llx_type` DISABLE KEYS */;

INSERT INTO `llx_type` (`rowid`, `label`)
VALUES
	(1,'magni'),
	(2,'non'),
	(3,'voluptas'),
	(4,'fuga'),
	(5,'non');

/*!40000 ALTER TABLE `llx_type` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_user`;

CREATE TABLE `llx_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(50) DEFAULT NULL,
  `ref_int` varchar(50) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login` varchar(24) DEFAULT NULL,
  `pass` varchar(32) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(32) DEFAULT NULL,
  `civilite` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `locale` varchar(5) DEFAULT NULL,
  `fk_state` int(11) DEFAULT '0',
  `fk_country` int(11) DEFAULT '0',
  `job` varchar(128) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `office_phone` varchar(20) DEFAULT NULL,
  `office_fax` varchar(20) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `signature` text,
  `admin` smallint(6) DEFAULT '0',
  `module_comm` smallint(6) DEFAULT '1',
  `module_compta` smallint(6) DEFAULT '1',
  `fk_societe` int(11) DEFAULT NULL,
  `fk_socpeople` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `note` text,
  `datelastlogin` datetime DEFAULT NULL,
  `datepreviouslogin` datetime DEFAULT NULL,
  `egroupware_id` int(11) DEFAULT NULL,
  `ldap_sid` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT '1',
  `photo` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT '0',
  `accountancy_code` varchar(24) DEFAULT '11111111111',
  `nb_holiday` int(11) DEFAULT '0',
  `salary` double(24,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `roles` text,
  `user_pos` tinyint(1) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_login` (`login`,`entity`),
  UNIQUE KEY `uk_user_fk_socpeople` (`fk_socpeople`),
  UNIQUE KEY `uk_user_fk_member` (`fk_member`),
  KEY `uk_user_fk_societe` (`fk_societe`),
  KEY `llx_user_llx_wynd_locale_code_fk` (`locale`),
  CONSTRAINT `llx_user_llx_wynd_locale_code_fk` FOREIGN KEY (`locale`) REFERENCES `llx_wynd_locale` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_user` WRITE;
/*!40000 ALTER TABLE `llx_user` DISABLE KEYS */;

INSERT INTO `llx_user` (`rowid`, `entity`, `ref_ext`, `ref_int`, `datec`, `tms`, `login`, `pass`, `pass_crypted`, `pass_temp`, `civilite`, `lastname`, `firstname`, `address`, `zip`, `town`, `locale`, `fk_state`, `fk_country`, `job`, `skype`, `office_phone`, `office_fax`, `user_mobile`, `email`, `signature`, `admin`, `module_comm`, `module_compta`, `fk_societe`, `fk_socpeople`, `fk_member`, `fk_user`, `thm`, `note`, `datelastlogin`, `datepreviouslogin`, `egroupware_id`, `ldap_sid`, `openid`, `statut`, `photo`, `lang`, `color`, `barcode`, `fk_barcode_type`, `accountancy_code`, `nb_holiday`, `salary`, `created_at`, `updated_at`, `roles`, `user_pos`, `card`, `token`, `expiration_date`)
VALUES
	(1,1,'REFyfcge','REF93602','2012-12-21 00:00:00','2017-08-11 17:40:46','john.doe',NULL,'$2y$13$FsmbkyAZZrzTtOWmi9.WleoCvvR6Tzj2nuu7z0ZdZym.ZUoESXPVC',NULL,'Dr.','Doe','John','885, boulevard de Lebreton','83 964','Coulon-sur-Delorme','en_GB',0,NULL,'qui',NULL,NULL,NULL,'+5227366242313','dumont.frederic@voila.fr',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'C\'est un brave garçon, quoique nous ayons eu ensemble des difficultés. Elle demanda des vers, des vers leur grouillant dans le gazon où la fosse pour s\'y engloutir avec elle. Cependant la nourrice.',NULL,NULL,NULL,NULL,NULL,1,'http://lorempixel.com/640/480/cats/?67768','ta_IN',NULL,'9788962802481',42,'11111111111',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
	(2,2,'REFflsdm','REF95004','2017-08-11 17:40:46','2017-08-11 17:40:46','pelletier.isaac',NULL,'$2y$13$dIY/0FbavvhokojM6yp/LOt4QulqlUmTq3j.Xi2FN.J4hvh2POXH6',NULL,'Pr.','Neveu','Alain','4, avenue Leclercq','86 380','Valentin','kk_KZ',0,NULL,'in',NULL,NULL,NULL,'+1840102051912','valerie.bernier@wanadoo.fr',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'Elle réfléchit quelques minutes, et finit encore, par remercier M. Lheureux, n\'est-ce pas vous rendre service, à vous? Et, prenant une figure solennelle: -- J\'ai cru, ma foi, que j\'y renonce... Ah!.',NULL,NULL,NULL,NULL,NULL,1,'http://lorempixel.com/640/480/cats/?61915','en_CA',NULL,'9793433462392',42,'11111111111',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
	(3,3,'REFzthwo','REF52771','2017-08-11 17:40:46','2017-08-11 17:40:46','brun.jules',NULL,'$2y$13$7/S6G2OrusCu4J5cjbmchu6RTo/xKo3Y3s68dDF.aG/80Ealz5R2K',NULL,'Mlle','Chauveau','Anouk','30, avenue de Nguyen','97 811','Roux-sur-Mer','en_EN',0,NULL,'ea',NULL,NULL,NULL,'+7728504306178','allain.aimee@yahoo.fr',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'Fahrenheit (mesure anglaise), pas davantage! -- et, au milieu des saints tenant des fourchettes à la cadence du mouvement qui la traverse en fait l\'expérience devant ses yeux. Il y eut un grand.',NULL,NULL,NULL,NULL,NULL,1,'http://lorempixel.com/640/480/cats/?73519','ss_ZA',NULL,'9789129110524',42,'11111111111',0,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),
	(4,4,'REFqswrh','REF36135','2017-08-11 17:40:46','2017-08-11 17:40:46','benoit.michelle',NULL,'$2y$13$jqhA8rGa09pOw9kd0ObfneIUhskitLDbck2p0BOgNJEi.QRWkfhXm',NULL,'M.','Renault','Louise','67, impasse Marcelle Perret','98 096','Fleury','en_GB',0,NULL,'fugiat',NULL,NULL,NULL,'+8742545132003','hcamus@morel.fr',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'Elle retira la sienne. Elle avait apporté un autre qui, à cette idée, qu\'une femme doit toujours écrire à M. Boulanger que sa femme recommençaient. Alors Rodolphe demanda si elle ne parlait pas,.',NULL,NULL,NULL,NULL,NULL,1,'http://lorempixel.com/640/480/cats/?48330','tr_TR',NULL,'9797456371877',42,'11111111111',0,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),
	(5,5,'REFfvcbu','REF33206','2017-08-11 17:40:46','2017-08-11 17:40:46','gerard.remy',NULL,'$2y$13$FAwOZxEL1FPaxZfxUZ8cr.A99HtjKexS8FLnSjhXI25YJ1kori08S',NULL,'Dr.','Duhamel','Anastasie','rue Christelle Giraud','51 567','Guyon','om_ET',0,NULL,'facilis',NULL,NULL,NULL,'+7143024745502','faivre.celine@simon.fr',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'Hornais jouait à l\'écarté avec Emma; Léon, derrière elle, contemplait entre ce drap noir et se mit à dire: -- Toi qui connais la maison pour recevoir M. Bovary, comment va-t-il? Elle semblait fort.',NULL,NULL,NULL,NULL,NULL,1,'http://lorempixel.com/640/480/cats/?58349','kam_KE',NULL,'9780351333323',42,'11111111111',0,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL);

/*!40000 ALTER TABLE `llx_user` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_user_alert
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_user_alert`;

CREATE TABLE `llx_user_alert` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_user_clicktodial
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_user_clicktodial`;

CREATE TABLE `llx_user_clicktodial` (
  `fk_user` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `pass` varchar(64) DEFAULT NULL,
  `poste` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_user_extrafields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_user_extrafields`;

CREATE TABLE `llx_user_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `user_takeaway` int(1) DEFAULT NULL,
  `matricule` varchar(11) DEFAULT NULL,
  `time_work` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `llx_user_extrafields_fk_object_uindex` (`fk_object`),
  KEY `idx_user_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_user_param
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_user_param`;

CREATE TABLE `llx_user_param` (
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `param` varchar(64) NOT NULL,
  `value` varchar(255) NOT NULL,
  UNIQUE KEY `uk_user_param` (`fk_user`,`param`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_user_param` WRITE;
/*!40000 ALTER TABLE `llx_user_param` DISABLE KEYS */;

INSERT INTO `llx_user_param` (`fk_user`, `entity`, `param`, `value`)
VALUES
	(1,1,'MAIN_BOXES_0','1'),
	(32,1,'MAIN_BOXES_0','1');

/*!40000 ALTER TABLE `llx_user_param` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_user_rights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_user_rights`;

CREATE TABLE `llx_user_rights` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_rights` (`fk_user`,`fk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_usergroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_usergroup`;

CREATE TABLE `llx_usergroup` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_name` (`nom`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_usergroup` WRITE;
/*!40000 ALTER TABLE `llx_usergroup` DISABLE KEYS */;

INSERT INTO `llx_usergroup` (`rowid`, `nom`, `entity`, `datec`, `tms`, `note`)
VALUES
	(1,'ROLE_MANAGER',1,'2017-08-11 17:40:46','2017-08-11 17:40:46',NULL),
	(2,'ROLE_OPERATOR',1,'2017-08-11 17:40:46','2017-08-11 17:40:46',NULL),
	(3,'ROLE_DIRECTOR',1,'2017-08-11 17:40:46','2017-08-11 17:40:46',NULL),
	(4,'ROLE_ASSISTANT',1,'2017-08-11 17:40:46','2017-08-11 17:40:46',NULL),
	(5,'ROLE_SHIFT',1,'2017-08-11 17:40:46','2017-08-11 17:40:46',NULL);

/*!40000 ALTER TABLE `llx_usergroup` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_usergroup_rights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_usergroup_rights`;

CREATE TABLE `llx_usergroup_rights` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_usergroup` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `fk_usergroup` (`fk_usergroup`,`fk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_usergroup_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_usergroup_user`;

CREATE TABLE `llx_usergroup_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_user` int(11) NOT NULL,
  `fk_usergroup` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_usergroup_user_fk_user` (`fk_user`),
  KEY `fk_usergroup_user_fk_usergroup` (`fk_usergroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_usergroup_user` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_user` DISABLE KEYS */;

INSERT INTO `llx_usergroup_user` (`rowid`, `entity`, `fk_user`, `fk_usergroup`)
VALUES
	(1,1,1,1),
	(2,1,2,2),
	(3,1,3,2),
	(4,1,4,2),
	(5,1,5,3);

/*!40000 ALTER TABLE `llx_usergroup_user` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_association_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_association_config`;

CREATE TABLE `llx_wynd_association_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL,
  `fk_association` int(11) NOT NULL,
  `is_required` tinyint(1) DEFAULT '0',
  `is_default` tinyint(1) DEFAULT '0',
  `is_payable` tinyint(1) DEFAULT '0',
  `is_printable` tinyint(1) DEFAULT '0',
  `quantity_min` int(4) DEFAULT '1',
  `quantity_max` int(4) DEFAULT '1',
  `price_override_quantity` double(10,6) DEFAULT NULL,
  `price_extra` double(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `llx_wynd_product_config_id_uindex` (`id`),
  KEY `llx_wynd_product_config_llx_product_rowid_fk` (`fk_association`),
  KEY `llx_wynd_product_config_llx_entity_rowid_fk` (`entity`),
  CONSTRAINT `llx_wynd_product_config_llx_entity_rowid_fk` FOREIGN KEY (`entity`) REFERENCES `llx_entity` (`rowid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `llx_wynd_product_config_llx_product_rowid_fk` FOREIGN KEY (`fk_association`) REFERENCES `llx_product_association` (`rowid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_wynd_association_config` WRITE;
/*!40000 ALTER TABLE `llx_wynd_association_config` DISABLE KEYS */;

INSERT INTO `llx_wynd_association_config` (`id`, `entity`, `fk_association`, `is_required`, `is_default`, `is_payable`, `is_printable`, `quantity_min`, `quantity_max`, `price_override_quantity`, `price_extra`)
VALUES
	(1,1,1,0,0,0,0,1,1,NULL,NULL),
	(2,2,2,0,0,0,0,1,1,NULL,NULL),
	(3,3,3,0,0,0,0,1,1,NULL,NULL),
	(4,3,4,0,0,0,0,1,1,NULL,NULL),
	(5,3,5,0,0,0,0,1,1,NULL,NULL),
	(6,3,6,0,0,0,0,1,1,NULL,NULL),
	(7,1,7,0,0,0,0,1,1,NULL,NULL),
	(8,4,8,0,0,0,0,1,1,NULL,NULL),
	(9,4,9,0,0,0,0,1,1,NULL,NULL),
	(10,5,10,0,0,0,0,1,1,NULL,NULL);

/*!40000 ALTER TABLE `llx_wynd_association_config` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_central_infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_central_infos`;

CREATE TABLE `llx_wynd_central_infos` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `entity` int(3) DEFAULT NULL,
  UNIQUE KEY `UNIQUE` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_central_infos` WRITE;
/*!40000 ALTER TABLE `llx_wynd_central_infos` DISABLE KEYS */;

INSERT INTO `llx_wynd_central_infos` (`rowid`, `url`, `entity`)
VALUES
	(1,'http://devcentral.wynd.eu/api',4);

/*!40000 ALTER TABLE `llx_wynd_central_infos` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_channel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_channel`;

CREATE TABLE `llx_wynd_channel` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  KEY `Index 1` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_channel` WRITE;
/*!40000 ALTER TABLE `llx_wynd_channel` DISABLE KEYS */;

INSERT INTO `llx_wynd_channel` (`rowid`, `label`)
VALUES
	(1,'pos'),
	(2,'website'),
	(3,'borne');

/*!40000 ALTER TABLE `llx_wynd_channel` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_code`;

CREATE TABLE `llx_wynd_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` enum('TEXT','BARCODE') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_code` WRITE;
/*!40000 ALTER TABLE `llx_wynd_code` DISABLE KEYS */;

INSERT INTO `llx_wynd_code` (`id`, `code`, `type`)
VALUES
	(1,'V0KI6TO8','BARCODE'),
	(2,'B1T8X5S2','TEXT'),
	(3,'DQ5QFDGW','BARCODE'),
	(4,'7WMUIW05','BARCODE'),
	(5,'1XMIJM61','BARCODE');

/*!40000 ALTER TABLE `llx_wynd_code` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_code_discounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_code_discounts`;

CREATE TABLE `llx_wynd_code_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `max_uses` int(11) NOT NULL,
  `days_before_reset` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_code_discounts_discount_id` (`discount_id`),
  KEY `fk_code_discounts_code_id` (`code_id`),
  CONSTRAINT `fk_code_discounts_code_id` FOREIGN KEY (`code_id`) REFERENCES `llx_wynd_code` (`id`),
  CONSTRAINT `fk_code_discounts_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `llx_wynd_discount` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_code_discounts` WRITE;
/*!40000 ALTER TABLE `llx_wynd_code_discounts` DISABLE KEYS */;

INSERT INTO `llx_wynd_code_discounts` (`id`, `discount_id`, `code_id`, `max_uses`, `days_before_reset`)
VALUES
	(1,1,1,63,28),
	(2,2,2,34,9),
	(3,3,3,29,10),
	(4,4,4,52,60),
	(5,5,5,49,48);

/*!40000 ALTER TABLE `llx_wynd_code_discounts` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_cohort
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_cohort`;

CREATE TABLE `llx_wynd_cohort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_cohort` WRITE;
/*!40000 ALTER TABLE `llx_wynd_cohort` DISABLE KEYS */;

INSERT INTO `llx_wynd_cohort` (`id`, `label`)
VALUES
	(1,'quia'),
	(2,'delectus'),
	(3,'aut'),
	(4,'nam'),
	(5,'et');

/*!40000 ALTER TABLE `llx_wynd_cohort` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_cohort_customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_cohort_customers`;

CREATE TABLE `llx_wynd_cohort_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `cohort_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cohort_customers_customer_id` (`customer_id`),
  KEY `fk_cohort_customers_cohort_id` (`cohort_id`),
  CONSTRAINT `fk_cohort_customers_cohort_id` FOREIGN KEY (`cohort_id`) REFERENCES `llx_wynd_cohort` (`id`),
  CONSTRAINT `fk_cohort_customers_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `llx_wynd_customers` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_condition_time
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_condition_time`;

CREATE TABLE `llx_wynd_condition_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `hour_start` time DEFAULT NULL,
  `hour_end` time DEFAULT NULL,
  `weekdays` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_condition_time` WRITE;
/*!40000 ALTER TABLE `llx_wynd_condition_time` DISABLE KEYS */;

INSERT INTO `llx_wynd_condition_time` (`id`, `date_start`, `date_end`, `hour_start`, `hour_end`, `weekdays`)
VALUES
	(1,'2017-06-02','2017-06-12','14:00:00','14:00:00','a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}'),
	(2,'2017-07-02','2017-07-12','15:00:00','17:00:00','a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}'),
	(3,'2017-08-02','2017-08-12','16:00:00','19:00:00','a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}'),
	(4,'2017-09-02','2017-09-12','15:00:00','17:00:00','a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}'),
	(5,'2017-10-02','2017-10-12','16:00:00','19:00:00','a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}');

/*!40000 ALTER TABLE `llx_wynd_condition_time` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_countries`;

CREATE TABLE `llx_wynd_countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) CHARACTER SET utf8 NOT NULL,
  `code_iso` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `label` varchar(50) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_wynd_country_code` (`code`),
  UNIQUE KEY `uk_wynd_country_label` (`label`),
  UNIQUE KEY `uk_wynd_country_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_countries` WRITE;
/*!40000 ALTER TABLE `llx_wynd_countries` DISABLE KEYS */;

INSERT INTO `llx_wynd_countries` (`id`, `code`, `code_iso`, `label`, `active`)
VALUES
	(0,'',NULL,'-',1),
	(1,'FR',NULL,'France',1),
	(2,'BE',NULL,'Belgium',1),
	(3,'IT',NULL,'Italy',1),
	(4,'ES',NULL,'Spain',1),
	(5,'DE',NULL,'Germany',1),
	(6,'CH',NULL,'Switzerland',1),
	(7,'GB',NULL,'United Kingdom',1),
	(8,'IE',NULL,'Irland',1),
	(9,'CN',NULL,'China',1),
	(10,'TN',NULL,'Tunisia',1),
	(11,'US',NULL,'United States',1),
	(12,'MA',NULL,'Maroc',1),
	(13,'DZ',NULL,'Algeria',1),
	(14,'CA',NULL,'Canada',1),
	(15,'TG',NULL,'Togo',1),
	(16,'GA',NULL,'Gabon',1),
	(17,'NL',NULL,'Nerderland',1),
	(18,'HU',NULL,'Hongrie',1),
	(19,'RU',NULL,'Russia',1),
	(20,'SE',NULL,'Sweden',1),
	(21,'CI',NULL,'Côte d\'Ivoire',1),
	(22,'SN',NULL,'Senegal',1),
	(23,'AR',NULL,'Argentine',1),
	(24,'CM',NULL,'Cameroun',1),
	(25,'PT',NULL,'Portugal',1),
	(26,'SA',NULL,'Saudi Arabia',1),
	(27,'MC',NULL,'Monaco',1),
	(28,'AU',NULL,'Australia',1),
	(29,'SG',NULL,'Singapour',1),
	(30,'AF',NULL,'Afghanistan',1),
	(31,'AX',NULL,'Iles Aland',1),
	(32,'AL',NULL,'Albanie',1),
	(33,'AS',NULL,'Samoa américaines',1),
	(34,'AD',NULL,'Andorre',1),
	(35,'AO',NULL,'Angola',1),
	(36,'AI',NULL,'Anguilla',1),
	(37,'AQ',NULL,'Antarctique',1),
	(38,'AG',NULL,'Antigua-et-Barbuda',1),
	(39,'AM',NULL,'Arménie',1),
	(40,'AW',NULL,'Aruba',1),
	(41,'AT',NULL,'Autriche',1),
	(42,'AZ',NULL,'Azerbaïdjan',1),
	(43,'BS',NULL,'Bahamas',1),
	(44,'BH',NULL,'Bahreïn',1),
	(45,'BD',NULL,'Bangladesh',1),
	(46,'BB',NULL,'Barbade',1),
	(47,'BY',NULL,'Biélorussie',1),
	(48,'BZ',NULL,'Belize',1),
	(49,'BJ',NULL,'Bénin',1),
	(50,'BM',NULL,'Bermudes',1),
	(51,'BT',NULL,'Bhoutan',1),
	(52,'BO',NULL,'Bolivie',1),
	(53,'BA',NULL,'Bosnie-Herzégovine',1),
	(54,'BW',NULL,'Botswana',1),
	(55,'BV',NULL,'Ile Bouvet',1),
	(56,'BR',NULL,'Brazil',1),
	(57,'IO',NULL,'Territoire britannique de l\'Océan Indien',1),
	(58,'BN',NULL,'Brunei',1),
	(59,'BG',NULL,'Bulgarie',1),
	(60,'BF',NULL,'Burkina Faso',1),
	(61,'BI',NULL,'Burundi',1),
	(62,'KH',NULL,'Cambodge',1),
	(63,'CV',NULL,'Cap-Vert',1),
	(64,'KY',NULL,'Iles Cayman',1),
	(65,'CF',NULL,'République centrafricaine',1),
	(66,'TD',NULL,'Tchad',1),
	(67,'CL',NULL,'Chili',1),
	(68,'CX',NULL,'Ile Christmas',1),
	(69,'CC',NULL,'Iles des Cocos (Keeling)',1),
	(70,'CO',NULL,'Colombie',1),
	(71,'KM',NULL,'Comores',1),
	(72,'CG',NULL,'Congo',1),
	(73,'CD',NULL,'République démocratique du Congo',1),
	(74,'CK',NULL,'Iles Cook',1),
	(75,'CR',NULL,'Costa Rica',1),
	(76,'HR',NULL,'Croatie',1),
	(77,'CU',NULL,'Cuba',1),
	(78,'CY',NULL,'Chypre',1),
	(79,'CZ',NULL,'République Tchèque',1),
	(80,'DK',NULL,'Danemark',1),
	(81,'DJ',NULL,'Djibouti',1),
	(82,'DM',NULL,'Dominique',1),
	(83,'DO',NULL,'République Dominicaine',1),
	(84,'EC',NULL,'Equateur',1),
	(85,'EG',NULL,'Egypte',1),
	(86,'SV',NULL,'Salvador',1),
	(87,'GQ',NULL,'Guinée Equatoriale',1),
	(88,'ER',NULL,'Erythrée',1),
	(89,'EE',NULL,'Estonia',1),
	(90,'ET',NULL,'Ethiopie',1),
	(91,'FK',NULL,'Iles Falkland',1),
	(92,'FO',NULL,'Iles Féroé',1),
	(93,'FJ',NULL,'Iles Fidji',1),
	(94,'FI',NULL,'Finlande',1),
	(95,'GF',NULL,'Guyane française',1),
	(96,'PF',NULL,'Polynésie française',1),
	(97,'TF',NULL,'Terres australes françaises',1),
	(98,'GM',NULL,'Gambie',1),
	(99,'GE',NULL,'Georgia',1),
	(100,'GH',NULL,'Ghana',1),
	(101,'GI',NULL,'Gibraltar',1),
	(102,'GR',NULL,'Greece',1),
	(103,'GL',NULL,'Groenland',1),
	(104,'GD',NULL,'Grenade',1),
	(106,'GU',NULL,'Guam',1),
	(107,'GT',NULL,'Guatemala',1),
	(108,'GN',NULL,'Guinea',1),
	(109,'GW',NULL,'Guinea-Bissao',1),
	(111,'HT',NULL,'Haiti',1),
	(112,'HM',NULL,'Iles Heard et McDonald',1),
	(113,'VA',NULL,'Saint-Siège (Vatican)',1),
	(114,'HN',NULL,'Honduras',1),
	(115,'HK',NULL,'Hong Kong',1),
	(116,'IS',NULL,'Islande',1),
	(117,'IN',NULL,'India',1),
	(118,'ID',NULL,'Indonésie',1),
	(119,'IR',NULL,'Iran',1),
	(120,'IQ',NULL,'Iraq',1),
	(121,'IL',NULL,'Israel',1),
	(122,'JM',NULL,'Jamaïque',1),
	(123,'JP',NULL,'Japon',1),
	(124,'JO',NULL,'Jordanie',1),
	(125,'KZ',NULL,'Kazakhstan',1),
	(126,'KE',NULL,'Kenya',1),
	(127,'KI',NULL,'Kiribati',1),
	(128,'KP',NULL,'North Corea',1),
	(129,'KR',NULL,'South Corea',1),
	(130,'KW',NULL,'Koweït',1),
	(131,'KG',NULL,'Kirghizistan',1),
	(132,'LA',NULL,'Laos',1),
	(133,'LV',NULL,'Lettonie',1),
	(134,'LB',NULL,'Liban',1),
	(135,'LS',NULL,'Lesotho',1),
	(136,'LR',NULL,'Liberia',1),
	(137,'LY',NULL,'Libye',1),
	(138,'LI',NULL,'Liechtenstein',1),
	(139,'LT',NULL,'Lituanie',1),
	(140,'LU',NULL,'Luxembourg',1),
	(141,'MO',NULL,'Macao',1),
	(142,'MK',NULL,'ex-République yougoslave de Macédoine',1),
	(143,'MG',NULL,'Madagascar',1),
	(144,'MW',NULL,'Malawi',1),
	(145,'MY',NULL,'Malaisie',1),
	(146,'MV',NULL,'Maldives',1),
	(147,'ML',NULL,'Mali',1),
	(148,'MT',NULL,'Malte',1),
	(149,'MH',NULL,'Iles Marshall',1),
	(151,'MR',NULL,'Mauritanie',1),
	(152,'MU',NULL,'Maurice',1),
	(153,'YT',NULL,'Mayotte',1),
	(154,'MX',NULL,'Mexique',1),
	(155,'FM',NULL,'Micronésie',1),
	(156,'MD',NULL,'Moldavie',1),
	(157,'MN',NULL,'Mongolie',1),
	(158,'MS',NULL,'Monserrat',1),
	(159,'MZ',NULL,'Mozambique',1),
	(160,'MM',NULL,'Birmanie (Myanmar)',1),
	(161,'NA',NULL,'Namibie',1),
	(162,'NR',NULL,'Nauru',1),
	(163,'NP',NULL,'Népal',1),
	(164,'AN',NULL,'Antilles néerlandaises',1),
	(165,'NC',NULL,'Nouvelle-Calédonie',1),
	(166,'NZ',NULL,'Nouvelle-Zélande',1),
	(167,'NI',NULL,'Nicaragua',1),
	(168,'NE',NULL,'Niger',1),
	(169,'NG',NULL,'Nigeria',1),
	(170,'NU',NULL,'Nioué',1),
	(171,'NF',NULL,'Ile Norfolk',1),
	(172,'MP',NULL,'Mariannes du Nord',1),
	(173,'NO',NULL,'Norvège',1),
	(174,'OM',NULL,'Oman',1),
	(175,'PK',NULL,'Pakistan',1),
	(176,'PW',NULL,'Palaos',1),
	(177,'PS',NULL,'Territoire Palestinien Occupé',1),
	(178,'PA',NULL,'Panama',1),
	(179,'PG',NULL,'Papouasie-Nouvelle-Guinée',1),
	(180,'PY',NULL,'Paraguay',1),
	(181,'PE',NULL,'Peru',1),
	(182,'PH',NULL,'Philippines',1),
	(183,'PN',NULL,'Iles Pitcairn',1),
	(184,'PL',NULL,'Pologne',1),
	(185,'PR',NULL,'Porto Rico',1),
	(186,'QA',NULL,'Qatar',1),
	(188,'RO',NULL,'Roumanie',1),
	(189,'RW',NULL,'Rwanda',1),
	(190,'SH',NULL,'Sainte-Hélène',1),
	(191,'KN',NULL,'Saint-Christophe-et-Niévès',1),
	(192,'LC',NULL,'Sainte-Lucie',1),
	(193,'PM',NULL,'Saint-Pierre-et-Miquelon',1),
	(194,'VC',NULL,'Saint-Vincent-et-les-Grenadines',1),
	(195,'WS',NULL,'Samoa',1),
	(196,'SM',NULL,'Saint-Marin',1),
	(197,'ST',NULL,'Sao Tomé-et-Principe',1),
	(198,'RS',NULL,'Serbie',1),
	(199,'SC',NULL,'Seychelles',1),
	(200,'SL',NULL,'Sierra Leone',1),
	(201,'SK',NULL,'Slovaquie',1),
	(202,'SI',NULL,'Slovénie',1),
	(203,'SB',NULL,'Iles Salomon',1),
	(204,'SO',NULL,'Somalie',1),
	(205,'ZA',NULL,'Afrique du Sud',1),
	(206,'GS',NULL,'Iles Géorgie du Sud et Sandwich du Sud',1),
	(207,'LK',NULL,'Sri Lanka',1),
	(208,'SD',NULL,'Soudan',1),
	(209,'SR',NULL,'Suriname',1),
	(210,'SJ',NULL,'Iles Svalbard et Jan Mayen',1),
	(211,'SZ',NULL,'Swaziland',1),
	(212,'SY',NULL,'Syrie',1),
	(213,'TW',NULL,'Taïwan',1),
	(214,'TJ',NULL,'Tadjikistan',1),
	(215,'TZ',NULL,'Tanzanie',1),
	(216,'TH',NULL,'Thaïlande',1),
	(217,'TL',NULL,'Timor Oriental',1),
	(218,'TK',NULL,'Tokélaou',1),
	(219,'TO',NULL,'Tonga',1),
	(220,'TT',NULL,'Trinité-et-Tobago',1),
	(221,'TR',NULL,'Turquie',1),
	(222,'TM',NULL,'Turkménistan',1),
	(223,'TC',NULL,'Iles Turks-et-Caicos',1),
	(224,'TV',NULL,'Tuvalu',1),
	(225,'UG',NULL,'Ouganda',1),
	(226,'UA',NULL,'Ukraine',1),
	(227,'AE',NULL,'Émirats arabes unis',1),
	(228,'UM',NULL,'Iles mineures éloignées des États-Unis',1),
	(229,'UY',NULL,'Uruguay',1),
	(230,'UZ',NULL,'Ouzbékistan',1),
	(231,'VU',NULL,'Vanuatu',1),
	(232,'VE',NULL,'Vénézuela',1),
	(233,'VN',NULL,'Viêt Nam',1),
	(234,'VG',NULL,'Iles Vierges britanniques',1),
	(235,'VI',NULL,'Iles Vierges américaines',1),
	(236,'WF',NULL,'Wallis-et-Futuna',1),
	(237,'EH',NULL,'Sahara occidental',1),
	(238,'YE',NULL,'Yémen',1),
	(239,'ZM',NULL,'Zambie',1),
	(240,'ZW',NULL,'Zimbabwe',1),
	(241,'GG',NULL,'Guernesey',1),
	(242,'IM',NULL,'Ile de Man',1),
	(243,'JE',NULL,'Jersey',1),
	(244,'ME',NULL,'Monténégro',1),
	(245,'BL',NULL,'Saint-Barthélemy',1),
	(246,'MF',NULL,'Saint-Martin',1);

/*!40000 ALTER TABLE `llx_wynd_countries` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_credit_note
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_credit_note`;

CREATE TABLE `llx_wynd_credit_note` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `reference` varchar(25) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `increment` int(20) NOT NULL,
  `date_create` datetime NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `fk_entity` int(11) NOT NULL,
  `amount` double(24,6) NOT NULL DEFAULT '0.000000',
  `status` enum('DRAFT','AVAILABLE','EXPIRED','USED','CANCELED') DEFAULT 'DRAFT',
  `type` enum('OVERPAYMENT','RETURN') NOT NULL DEFAULT 'OVERPAYMENT',
  `token` varchar(128) DEFAULT NULL,
  `tms` datetime DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_wynd_credit_note_llx_entity_rowid_index` (`fk_entity`),
  KEY `llx_wynd_credit_note_llx_facture_rowid_index` (`fk_facture`),
  KEY `llx_wynd_credit_note_llx_societe_rowid_index` (`fk_soc`),
  KEY `llx_wynd_credit_note_reference_index` (`reference`),
  CONSTRAINT `llx_wynd_credit_note_llx_customer_rowid_fk` FOREIGN KEY (`fk_soc`) REFERENCES `llx_wynd_customers` (`rowid`),
  CONSTRAINT `llx_wynd_credit_note_llx_entity_rowid_fk` FOREIGN KEY (`fk_entity`) REFERENCES `llx_entity` (`rowid`),
  CONSTRAINT `llx_wynd_credit_note_llx_facture_rowid_fk` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_credit_note_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_credit_note_config`;

CREATE TABLE `llx_wynd_credit_note_config` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_entity` int(11) NOT NULL,
  `has_overpayment` tinyint(4) NOT NULL DEFAULT '0',
  `has_return` tinyint(4) NOT NULL DEFAULT '0',
  `total_valid_days` tinyint(4) NOT NULL DEFAULT '30',
  `text_ticket` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `llx_wynd_creditnote_config_fk_entity_uindex` (`fk_entity`),
  CONSTRAINT `llx_wynd_creditnote_config_llx_entity_rowid_fk` FOREIGN KEY (`fk_entity`) REFERENCES `llx_entity` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_customers`;

CREATE TABLE `llx_wynd_customers` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `entity` int(11) NOT NULL,
  `original_entity` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `honorific_prefix` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `comments` text,
  `is_active` tinyint(1) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` datetime NOT NULL,
  `salt` text NOT NULL,
  `is_guest` tinyint(4) NOT NULL DEFAULT '0',
  `external_id` int(11) DEFAULT NULL,
  `register_number` varchar(50) DEFAULT NULL,
  `wyndpay_user_id` varchar(50) DEFAULT NULL,
  `wyndpay_wallet_id` varchar(50) DEFAULT NULL,
  `company_id` int(9) DEFAULT NULL,
  `payment_mode_id` int(9) DEFAULT NULL,
  `attributes` longtext NOT NULL COMMENT '(DC2Type:array)',
  `max_payment_overdraft` int(24) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `llx_wynd_customers_llx_entity` (`entity`),
  KEY `llx_wynd_customers_llx_original_entity` (`original_entity`),
  KEY `customers_payment_mode_rowid_fk` (`payment_mode_id`),
  KEY `customers_company_rowid_fk` (`company_id`),
  CONSTRAINT `customers_company_rowid_fk` FOREIGN KEY (`company_id`) REFERENCES `llx_catering_company` (`rowid`),
  CONSTRAINT `customers_payment_mode_rowid_fk` FOREIGN KEY (`payment_mode_id`) REFERENCES `llx_catering_payment_mode` (`rowid`),
  CONSTRAINT `llx_wynd_customers_llx_entity` FOREIGN KEY (`entity`) REFERENCES `llx_entity` (`rowid`),
  CONSTRAINT `llx_wynd_customers_llx_original_entity` FOREIGN KEY (`original_entity`) REFERENCES `llx_entity` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_customers` WRITE;
/*!40000 ALTER TABLE `llx_wynd_customers` DISABLE KEYS */;

INSERT INTO `llx_wynd_customers` (`rowid`, `uuid`, `entity`, `original_entity`, `login`, `password`, `lastname`, `firstname`, `honorific_prefix`, `email`, `phone`, `birthdate`, `comments`, `is_active`, `datec`, `tms`, `salt`, `is_guest`, `external_id`, `register_number`, `wyndpay_user_id`, `wyndpay_wallet_id`, `company_id`, `payment_mode_id`, `attributes`, `max_payment_overdraft`)
VALUES
	(1,'1837cdc1-8d71-4543-b106-9e0f61005025',1,5,'gregoire.berger@humbert.com','$2y$10$ZE6T89O1MnHN.IGlRfzcD.BPVEYY2TelB7rIxshqcMCZpwdcE2NkC','Verdier','René',NULL,'gregoire.berger@humbert.com',NULL,NULL,NULL,0,'2017-08-11 17:40:48','2017-08-11 17:40:48','047308f27d4f46a6acd5b962adfeae09',0,NULL,NULL,NULL,NULL,NULL,NULL,'a:0:{}',0),
	(2,'83844e41-56df-4254-bbb8-187cd61c6509',2,3,'lejeune.susanne@boutin.org','$2y$10$H.mE9kY4eWQGjDUcSc0MsOFDhb.6UcRD0ocw3KuhPJFW7bmusxi6.','Martins','Nathalie',NULL,'lejeune.susanne@boutin.org',NULL,NULL,NULL,1,'2017-08-11 17:40:49','2017-08-11 17:40:49','4d12a556cd73ccf6f233d483f865efab',0,NULL,NULL,NULL,NULL,NULL,NULL,'a:0:{}',0),
	(3,'832240a9-a047-426b-8790-78e6b1f89020',3,4,'anastasie90@live.com','$2y$10$o5yR1KLefoa3GVHshHcqe.WZXX7qM2L28ryYpEgvagJUXEt2xhu4i','Lefebvre','Tristan',NULL,'anastasie90@live.com',NULL,NULL,NULL,1,'2017-08-11 17:40:49','2017-08-11 17:40:49','a7f8a4a3842c75dd1e18689ced8d339e',0,NULL,NULL,NULL,NULL,NULL,NULL,'a:0:{}',0),
	(4,'9cd3e49b-375e-49d8-b6ce-bdc975751a64',4,2,'pons.francoise@free.fr','$2y$10$jcfQt.dN1q6Junoit3Ovr.pSLCeIQ/034nrKbps7DoRRUJARDUZUm','Gros','Grégoire',NULL,'pons.francoise@free.fr',NULL,NULL,NULL,0,'2017-08-11 17:40:49','2017-08-11 17:40:49','2251fbba645ed4d65729e4e9b76737fd',0,NULL,NULL,NULL,NULL,NULL,NULL,'a:0:{}',0),
	(5,'4971394e-7c3d-41a3-8c10-c6d33464e3ee',5,5,'roussel.lucas@lebreton.fr','$2y$10$s.tbkF1NZXuciT8zpbKcueByh8qly9P8TXRlYxgJnDbaaBalS58Y6','Barre','Alexandre',NULL,'roussel.lucas@lebreton.fr',NULL,NULL,NULL,0,'2017-08-11 17:40:49','2017-08-11 17:40:49','95086a058b0d905313bff7d871cdaa97',0,NULL,NULL,NULL,NULL,NULL,NULL,'a:0:{}',0);

/*!40000 ALTER TABLE `llx_wynd_customers` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_departments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_departments`;

CREATE TABLE `llx_wynd_departments` (
  `id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `region_id` int(11) NOT NULL,
  `county_seat` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `ncc` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_wynd_department_code` (`code`,`region_id`),
  KEY `fk_wynd_department_region` (`region_id`),
  CONSTRAINT `fk_wynd_department_region` FOREIGN KEY (`region_id`) REFERENCES `llx_wynd_regions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_departments` WRITE;
/*!40000 ALTER TABLE `llx_wynd_departments` DISABLE KEYS */;

INSERT INTO `llx_wynd_departments` (`id`, `code`, `region_id`, `county_seat`, `tncc`, `ncc`, `name`, `active`)
VALUES
	(1,'0',1,'0',0,'-','-',1),
	(2,'01',122,'01053',5,'AIN','Ain',1),
	(3,'02',107,'02408',5,'AISNE','Aisne',1),
	(4,'03',123,'03190',5,'ALLIER','Allier',1),
	(5,'04',125,'04070',4,'ALPES-DE-HAUTE-PROVENCE','Alpes-de-Haute-Provence',1),
	(6,'05',125,'05061',4,'HAUTES-ALPES','Hautes-Alpes',1),
	(7,'06',125,'06088',4,'ALPES-MARITIMES','Alpes-Maritimes',1),
	(8,'07',122,'07186',5,'ARDECHE','Ardèche',1),
	(9,'08',106,'08105',4,'ARDENNES','Ardennes',1),
	(10,'09',120,'09122',5,'ARIEGE','Ariège',1),
	(11,'10',106,'10387',5,'AUBE','Aube',1),
	(12,'11',124,'11069',5,'AUDE','Aude',1),
	(13,'12',120,'12202',5,'AVEYRON','Aveyron',1),
	(14,'13',125,'13055',4,'BOUCHES-DU-RHONE','Bouches-du-Rhône',1),
	(15,'14',110,'14118',2,'CALVADOS','Calvados',1),
	(16,'15',123,'15014',2,'CANTAL','Cantal',1),
	(17,'16',118,'16015',3,'CHARENTE','Charente',1),
	(18,'17',118,'17300',3,'CHARENTE-MARITIME','Charente-Maritime',1),
	(19,'18',109,'18033',2,'CHER','Cher',1),
	(20,'19',121,'19272',3,'CORREZE','Corrèze',1),
	(21,'2A',126,'2A004',3,'CORSE-DU-SUD','Corse-du-Sud',1),
	(22,'2B',126,'2B033',3,'HAUTE-CORSE','Haute-Corse',1),
	(23,'21',111,'21231',3,'COTE-D OR','Côte-d Or',1),
	(24,'22',117,'22278',4,'COTES-D ARMOR','Côtes-d Armor',1),
	(25,'23',121,'23096',3,'CREUSE','Creuse',1),
	(26,'24',119,'24322',3,'DORDOGNE','Dordogne',1),
	(27,'25',115,'25056',2,'DOUBS','Doubs',1),
	(28,'26',122,'26362',3,'DROME','Drôme',1),
	(29,'27',108,'27229',5,'EURE','Eure',1),
	(30,'28',109,'28085',1,'EURE-ET-LOIR','Eure-et-Loir',1),
	(31,'29',117,'29232',2,'FINISTERE','Finistère',1),
	(32,'30',124,'30189',2,'GARD','Gard',1),
	(33,'31',120,'31555',3,'HAUTE-GARONNE','Haute-Garonne',1),
	(34,'32',120,'32013',2,'GERS','Gers',1),
	(35,'33',119,'33063',3,'GIRONDE','Gironde',1),
	(36,'34',124,'34172',5,'HERAULT','Hérault',1),
	(37,'35',117,'35238',1,'ILLE-ET-VILAINE','Ille-et-Vilaine',1),
	(38,'36',109,'36044',5,'INDRE','Indre',1),
	(39,'37',109,'37261',1,'INDRE-ET-LOIRE','Indre-et-Loire',1),
	(40,'38',122,'38185',5,'ISERE','Isère',1),
	(41,'39',115,'39300',2,'JURA','Jura',1),
	(42,'40',119,'40192',4,'LANDES','Landes',1),
	(43,'41',109,'41018',0,'LOIR-ET-CHER','Loir-et-Cher',1),
	(44,'42',122,'42218',3,'LOIRE','Loire',1),
	(45,'43',123,'43157',3,'HAUTE-LOIRE','Haute-Loire',1),
	(46,'44',116,'44109',3,'LOIRE-ATLANTIQUE','Loire-Atlantique',1),
	(47,'45',109,'45234',2,'LOIRET','Loiret',1),
	(48,'46',120,'46042',2,'LOT','Lot',1),
	(49,'47',119,'47001',0,'LOT-ET-GARONNE','Lot-et-Garonne',1),
	(50,'48',124,'48095',3,'LOZERE','Lozère',1),
	(51,'49',116,'49007',0,'MAINE-ET-LOIRE','Maine-et-Loire',1),
	(52,'50',110,'50502',3,'MANCHE','Manche',1),
	(53,'51',106,'51108',3,'MARNE','Marne',1),
	(54,'52',106,'52121',3,'HAUTE-MARNE','Haute-Marne',1),
	(55,'53',116,'53130',3,'MAYENNE','Mayenne',1),
	(56,'54',113,'54395',0,'MEURTHE-ET-MOSELLE','Meurthe-et-Moselle',1),
	(57,'55',113,'55029',3,'MEUSE','Meuse',1),
	(58,'56',117,'56260',2,'MORBIHAN','Morbihan',1),
	(59,'57',113,'57463',3,'MOSELLE','Moselle',1),
	(60,'58',111,'58194',3,'NIEVRE','Nièvre',1),
	(61,'59',112,'59350',2,'NORD','Nord',1),
	(62,'60',107,'60057',5,'OISE','Oise',1),
	(63,'61',110,'61001',5,'ORNE','Orne',1),
	(64,'62',112,'62041',2,'PAS-DE-CALAIS','Pas-de-Calais',1),
	(65,'63',123,'63113',2,'PUY-DE-DOME','Puy-de-Dôme',1),
	(66,'64',119,'64445',4,'PYRENEES-ATLANTIQUES','Pyrénées-Atlantiques',1),
	(67,'65',120,'65440',4,'HAUTES-PYRENEES','Hautes-Pyrénées',1),
	(68,'66',124,'66136',4,'PYRENEES-ORIENTALES','Pyrénées-Orientales',1),
	(69,'67',114,'67482',2,'BAS-RHIN','Bas-Rhin',1),
	(70,'68',114,'68066',2,'HAUT-RHIN','Haut-Rhin',1),
	(71,'69',122,'69123',2,'RHONE','Rhône',1),
	(72,'70',115,'70550',3,'HAUTE-SAONE','Haute-Saône',1),
	(73,'71',111,'71270',0,'SAONE-ET-LOIRE','Saône-et-Loire',1),
	(74,'72',116,'72181',3,'SARTHE','Sarthe',1),
	(75,'73',122,'73065',3,'SAVOIE','Savoie',1),
	(76,'74',122,'74010',3,'HAUTE-SAVOIE','Haute-Savoie',1),
	(77,'75',105,'75056',0,'PARIS','Paris',1),
	(78,'76',108,'76540',3,'SEINE-MARITIME','Seine-Maritime',1),
	(79,'77',105,'77288',0,'SEINE-ET-MARNE','Seine-et-Marne',1),
	(80,'78',105,'78646',4,'YVELINES','Yvelines',1),
	(81,'79',118,'79191',4,'DEUX-SEVRES','Deux-Sèvres',1),
	(82,'80',107,'80021',3,'SOMME','Somme',1),
	(83,'81',120,'81004',2,'TARN','Tarn',1),
	(84,'82',120,'82121',0,'TARN-ET-GARONNE','Tarn-et-Garonne',1),
	(85,'83',125,'83137',2,'VAR','Var',1),
	(86,'84',125,'84007',0,'VAUCLUSE','Vaucluse',1),
	(87,'85',116,'85191',3,'VENDEE','Vendée',1),
	(88,'86',118,'86194',3,'VIENNE','Vienne',1),
	(89,'87',121,'87085',3,'HAUTE-VIENNE','Haute-Vienne',1),
	(90,'88',113,'88160',4,'VOSGES','Vosges',1),
	(91,'89',111,'89024',5,'YONNE','Yonne',1),
	(92,'90',115,'90010',0,'TERRITOIRE DE BELFORT','Territoire de Belfort',1),
	(93,'91',105,'91228',5,'ESSONNE','Essonne',1),
	(94,'92',105,'92050',4,'HAUTS-DE-SEINE','Hauts-de-Seine',1),
	(95,'93',105,'93008',3,'SEINE-SAINT-DENIS','Seine-Saint-Denis',1),
	(96,'94',105,'94028',2,'VAL-DE-MARNE','Val-de-Marne',1),
	(97,'95',105,'95500',2,'VAL-D OISE','Val-d Oise',1),
	(98,'971',101,'97105',3,'GUADELOUPE','Guadeloupe',1),
	(99,'972',102,'97209',3,'MARTINIQUE','Martinique',1),
	(100,'973',103,'97302',3,'GUYANE','Guyane',1),
	(101,'974',104,'97411',3,'REUNION','Réunion',1),
	(103,'01',201,'',1,'ANVERS','Anvers',1),
	(104,'02',203,'',3,'BRUXELLES-CAPITALE','Bruxelles-Capitale',1),
	(105,'03',202,'',2,'BRABANT-WALLON','Brabant-Wallon',1),
	(106,'04',201,'',1,'BRABANT-FLAMAND','Brabant-Flamand',1),
	(107,'05',201,'',1,'FLANDRE-OCCIDENTALE','Flandre-Occidentale',1),
	(108,'06',201,'',1,'FLANDRE-ORIENTALE','Flandre-Orientale',1),
	(109,'07',202,'',2,'HAINAUT','Hainaut',1),
	(110,'08',201,'',2,'LIEGE','Liège',1),
	(111,'09',202,'',1,'LIMBOURG','Limbourg',1),
	(112,'10',202,'',2,'LUXEMBOURG','Luxembourg',1),
	(113,'11',201,'',2,'NAMUR','Namur',1),
	(114,'AG',315,NULL,NULL,NULL,'AGRIGENTO',1),
	(115,'AL',312,NULL,NULL,NULL,'ALESSANDRIA',1),
	(116,'AN',310,NULL,NULL,NULL,'ANCONA',1),
	(117,'AO',319,NULL,NULL,NULL,'AOSTA',1),
	(118,'AR',316,NULL,NULL,NULL,'AREZZO',1),
	(119,'AP',310,NULL,NULL,NULL,'ASCOLI PICENO',1),
	(120,'AT',312,NULL,NULL,NULL,'ASTI',1),
	(121,'AV',304,NULL,NULL,NULL,'AVELLINO',1),
	(122,'BA',313,NULL,NULL,NULL,'BARI',1),
	(123,'BT',313,NULL,NULL,NULL,'BARLETTA-ANDRIA-TRANI',1),
	(124,'BL',320,NULL,NULL,NULL,'BELLUNO',1),
	(125,'BN',304,NULL,NULL,NULL,'BENEVENTO',1),
	(126,'BG',309,NULL,NULL,NULL,'BERGAMO',1),
	(127,'BI',312,NULL,NULL,NULL,'BIELLA',1),
	(128,'BO',305,NULL,NULL,NULL,'BOLOGNA',1),
	(129,'BZ',317,NULL,NULL,NULL,'BOLZANO',1),
	(130,'BS',309,NULL,NULL,NULL,'BRESCIA',1),
	(131,'BR',313,NULL,NULL,NULL,'BRINDISI',1),
	(132,'CA',314,NULL,NULL,NULL,'CAGLIARI',1),
	(133,'CL',315,NULL,NULL,NULL,'CALTANISSETTA',1),
	(134,'CB',311,NULL,NULL,NULL,'CAMPOBASSO',1),
	(135,'CI',314,NULL,NULL,NULL,'CARBONIA-IGLESIAS',1),
	(136,'CE',304,NULL,NULL,NULL,'CASERTA',1),
	(137,'CT',315,NULL,NULL,NULL,'CATANIA',1),
	(138,'CZ',303,NULL,NULL,NULL,'CATANZARO',1),
	(139,'CH',301,NULL,NULL,NULL,'CHIETI',1),
	(140,'CO',309,NULL,NULL,NULL,'COMO',1),
	(141,'CS',303,NULL,NULL,NULL,'COSENZA',1),
	(142,'CR',309,NULL,NULL,NULL,'CREMONA',1),
	(143,'KR',303,NULL,NULL,NULL,'CROTONE',1),
	(144,'CN',312,NULL,NULL,NULL,'CUNEO',1),
	(145,'EN',315,NULL,NULL,NULL,'ENNA',1),
	(146,'FM',310,NULL,NULL,NULL,'FERMO',1),
	(147,'FE',305,NULL,NULL,NULL,'FERRARA',1),
	(148,'FI',316,NULL,NULL,NULL,'FIRENZE',1),
	(149,'FG',313,NULL,NULL,NULL,'FOGGIA',1),
	(150,'FC',305,NULL,NULL,NULL,'FORLI-CESENA',1),
	(151,'FR',307,NULL,NULL,NULL,'FROSINONE',1),
	(152,'GE',308,NULL,NULL,NULL,'GENOVA',1),
	(153,'GO',306,NULL,NULL,NULL,'GORIZIA',1),
	(154,'GR',316,NULL,NULL,NULL,'GROSSETO',1),
	(155,'IM',308,NULL,NULL,NULL,'IMPERIA',1),
	(156,'IS',311,NULL,NULL,NULL,'ISERNIA',1),
	(157,'SP',308,NULL,NULL,NULL,'LA SPEZIA',1),
	(158,'AQ',301,NULL,NULL,NULL,'L AQUILA',1),
	(159,'LT',307,NULL,NULL,NULL,'LATINA',1),
	(160,'LE',313,NULL,NULL,NULL,'LECCE',1),
	(161,'LC',309,NULL,NULL,NULL,'LECCO',1),
	(162,'LI',314,NULL,NULL,NULL,'LIVORNO',1),
	(163,'LO',309,NULL,NULL,NULL,'LODI',1),
	(164,'LU',316,NULL,NULL,NULL,'LUCCA',1),
	(165,'MC',310,NULL,NULL,NULL,'MACERATA',1),
	(166,'MN',309,NULL,NULL,NULL,'MANTOVA',1),
	(167,'MS',316,NULL,NULL,NULL,'MASSA-CARRARA',1),
	(168,'MT',302,NULL,NULL,NULL,'MATERA',1),
	(169,'VS',314,NULL,NULL,NULL,'MEDIO CAMPIDANO',1),
	(170,'ME',315,NULL,NULL,NULL,'MESSINA',1),
	(171,'MI',309,NULL,NULL,NULL,'MILANO',1),
	(172,'MB',309,NULL,NULL,NULL,'MONZA e BRIANZA',1),
	(173,'MO',305,NULL,NULL,NULL,'MODENA',1),
	(174,'NA',304,NULL,NULL,NULL,'NAPOLI',1),
	(175,'NO',312,NULL,NULL,NULL,'NOVARA',1),
	(176,'NU',314,NULL,NULL,NULL,'NUORO',1),
	(177,'OG',314,NULL,NULL,NULL,'OGLIASTRA',1),
	(178,'OT',314,NULL,NULL,NULL,'OLBIA-TEMPIO',1),
	(179,'OR',314,NULL,NULL,NULL,'ORISTANO',1),
	(180,'PD',320,NULL,NULL,NULL,'PADOVA',1),
	(181,'PA',315,NULL,NULL,NULL,'PALERMO',1),
	(182,'PR',305,NULL,NULL,NULL,'PARMA',1),
	(183,'PV',309,NULL,NULL,NULL,'PAVIA',1),
	(184,'PG',318,NULL,NULL,NULL,'PERUGIA',1),
	(185,'PU',310,NULL,NULL,NULL,'PESARO e URBINO',1),
	(186,'PE',301,NULL,NULL,NULL,'PESCARA',1),
	(187,'PC',305,NULL,NULL,NULL,'PIACENZA',1),
	(188,'PI',316,NULL,NULL,NULL,'PISA',1),
	(189,'PT',316,NULL,NULL,NULL,'PISTOIA',1),
	(190,'PN',306,NULL,NULL,NULL,'PORDENONE',1),
	(191,'PZ',302,NULL,NULL,NULL,'POTENZA',1),
	(192,'PO',316,NULL,NULL,NULL,'PRATO',1),
	(193,'RG',315,NULL,NULL,NULL,'RAGUSA',1),
	(194,'RA',305,NULL,NULL,NULL,'RAVENNA',1),
	(195,'RC',303,NULL,NULL,NULL,'REGGIO CALABRIA',1),
	(196,'RE',305,NULL,NULL,NULL,'REGGIO NELL EMILIA',1),
	(197,'RI',307,NULL,NULL,NULL,'RIETI',1),
	(198,'RN',305,NULL,NULL,NULL,'RIMINI',1),
	(199,'RM',307,NULL,NULL,NULL,'ROMA',1),
	(200,'RO',320,NULL,NULL,NULL,'ROVIGO',1),
	(201,'SA',304,NULL,NULL,NULL,'SALERNO',1),
	(202,'SS',314,NULL,NULL,NULL,'SASSARI',1),
	(203,'SV',308,NULL,NULL,NULL,'SAVONA',1),
	(204,'SI',316,NULL,NULL,NULL,'SIENA',1),
	(205,'SR',315,NULL,NULL,NULL,'SIRACUSA',1),
	(206,'SO',309,NULL,NULL,NULL,'SONDRIO',1),
	(207,'TA',313,NULL,NULL,NULL,'TARANTO',1),
	(208,'TE',301,NULL,NULL,NULL,'TERAMO',1),
	(209,'TR',318,NULL,NULL,NULL,'TERNI',1),
	(210,'TO',312,NULL,NULL,NULL,'TORINO',1),
	(211,'TP',315,NULL,NULL,NULL,'TRAPANI',1),
	(212,'TN',317,NULL,NULL,NULL,'TRENTO',1),
	(213,'TV',320,NULL,NULL,NULL,'TREVISO',1),
	(214,'TS',306,NULL,NULL,NULL,'TRIESTE',1),
	(215,'UD',306,NULL,NULL,NULL,'UDINE',1),
	(216,'VA',309,NULL,NULL,NULL,'VARESE',1),
	(217,'VE',320,NULL,NULL,NULL,'VENEZIA',1),
	(218,'VB',312,NULL,NULL,NULL,'VERBANO-CUSIO-OSSOLA',1),
	(219,'VC',312,NULL,NULL,NULL,'VERCELLI',1),
	(220,'VR',320,NULL,NULL,NULL,'VERONA',1),
	(221,'VV',303,NULL,NULL,NULL,'VIBO VALENTIA',1),
	(222,'VI',320,NULL,NULL,NULL,'VICENZA',1),
	(223,'VT',307,NULL,NULL,NULL,'VITERBO',1),
	(224,'NSW',2801,'',1,'','New South Wales',1),
	(225,'VIC',2801,'',1,'','Victoria',1),
	(226,'QLD',2801,'',1,'','Queensland',1),
	(227,'SA',2801,'',1,'','South Australia',1),
	(228,'ACT',2801,'',1,'','Australia Capital Territory',1),
	(229,'TAS',2801,'',1,'','Tasmania',1),
	(230,'WA',2801,'',1,'','Western Australia',1),
	(231,'NT',2801,'',1,'','Northern Territory',1),
	(232,'ON',1401,'',1,'','Ontario',1),
	(233,'QC',1401,'',1,'','Quebec',1),
	(234,'NS',1401,'',1,'','Nova Scotia',1),
	(235,'NB',1401,'',1,'','New Brunswick',1),
	(236,'MB',1401,'',1,'','Manitoba',1),
	(237,'BC',1401,'',1,'','British Columbia',1),
	(238,'PE',1401,'',1,'','Prince Edward Island',1),
	(239,'SK',1401,'',1,'','Saskatchewan',1),
	(240,'AB',1401,'',1,'','Alberta',1),
	(241,'NL',1401,'',1,'','Newfoundland and Labrador',1),
	(242,'01',419,'',19,'ALAVA','Álava',1),
	(243,'02',404,'',4,'ALBACETE','Albacete',1),
	(244,'03',411,'',11,'ALICANTE','Alicante',1),
	(245,'04',401,'',1,'ALMERIA','Almería',1),
	(246,'05',403,'',3,'AVILA','Avila',1),
	(247,'06',412,'',12,'BADAJOZ','Badajoz',1),
	(248,'07',414,'',14,'ISLAS BALEARES','Islas Baleares',1),
	(249,'08',406,'',6,'BARCELONA','Barcelona',1),
	(250,'09',403,'',8,'BURGOS','Burgos',1),
	(251,'10',412,'',12,'CACERES','Cáceres',1),
	(252,'11',401,'',1,'CADIZ','Cádiz',1),
	(253,'12',411,'',11,'CASTELLON','Castellón',1),
	(254,'13',404,'',4,'CIUDAD REAL','Ciudad Real',1),
	(255,'14',401,'',1,'CORDOBA','Córdoba',1),
	(256,'15',413,'',13,'LA CORUÑA','La Coruña',1),
	(257,'16',404,'',4,'CUENCA','Cuenca',1),
	(258,'17',406,'',6,'GERONA','Gerona',1),
	(259,'18',401,'',1,'GRANADA','Granada',1),
	(260,'19',404,'',4,'GUADALAJARA','Guadalajara',1),
	(261,'20',419,'',19,'GUIPUZCOA','Guipúzcoa',1),
	(262,'21',401,'',1,'HUELVA','Huelva',1),
	(263,'22',402,'',2,'HUESCA','Huesca',1),
	(264,'23',401,'',1,'JAEN','Jaén',1),
	(265,'24',403,'',3,'LEON','León',1),
	(266,'25',406,'',6,'LERIDA','Lérida',1),
	(267,'26',415,'',15,'LA RIOJA','La Rioja',1),
	(268,'27',413,'',13,'LUGO','Lugo',1),
	(269,'28',416,'',16,'MADRID','Madrid',1),
	(270,'29',401,'',1,'MALAGA','Málaga',1),
	(271,'30',417,'',17,'MURCIA','Murcia',1),
	(272,'31',408,'',8,'NAVARRA','Navarra',1),
	(273,'32',413,'',13,'ORENSE','Orense',1),
	(274,'33',418,'',18,'ASTURIAS','Asturias',1),
	(275,'34',403,'',3,'PALENCIA','Palencia',1),
	(276,'35',405,'',5,'LAS PALMAS','Las Palmas',1),
	(277,'36',413,'',13,'PONTEVEDRA','Pontevedra',1),
	(278,'37',403,'',3,'SALAMANCA','Salamanca',1),
	(279,'38',405,'',5,'STA. CRUZ DE TENERIFE','Sta. Cruz de Tenerife',1),
	(280,'39',410,'',10,'CANTABRIA','Cantabria',1),
	(281,'40',403,'',3,'SEGOVIA','Segovia',1),
	(282,'41',401,'',1,'SEVILLA','Sevilla',1),
	(283,'42',403,'',3,'SORIA','Soria',1),
	(284,'43',406,'',6,'TARRAGONA','Tarragona',1),
	(285,'44',402,'',2,'TERUEL','Teruel',1),
	(286,'45',404,'',5,'TOLEDO','Toledo',1),
	(287,'46',411,'',11,'VALENCIA','Valencia',1),
	(288,'47',403,'',3,'VALLADOLID','Valladolid',1),
	(289,'48',419,'',19,'VIZCAYA','Vizcaya',1),
	(290,'49',403,'',3,'ZAMORA','Zamora',1),
	(291,'50',402,'',1,'ZARAGOZA','Zaragoza',1),
	(292,'51',407,'',7,'CEUTA','Ceuta',1),
	(293,'52',409,'',9,'MELILLA','Melilla',1),
	(294,'53',420,'',20,'OTROS','Otros',1),
	(295,'BW',501,NULL,NULL,'BADEN-WÜRTTEMBERG','Baden-Württemberg',1),
	(296,'BY',501,NULL,NULL,'BAYERN','Bayern',1),
	(297,'BE',501,NULL,NULL,'BERLIN','Berlin',1),
	(298,'BB',501,NULL,NULL,'BRANDENBURG','Brandenburg',1),
	(299,'HB',501,NULL,NULL,'BREMEN','Bremen',1),
	(300,'HH',501,NULL,NULL,'HAMBURG','Hamburg',1),
	(301,'HE',501,NULL,NULL,'HESSEN','Hessen',1),
	(302,'MV',501,NULL,NULL,'MECKLENBURG-VORPOMMERN','Mecklenburg-Vorpommern',1),
	(303,'NI',501,NULL,NULL,'NIEDERSACHSEN','Niedersachsen',1),
	(304,'NW',501,NULL,NULL,'NORDRHEIN-WESTFALEN','Nordrhein-Westfalen',1),
	(305,'RP',501,NULL,NULL,'RHEINLAND-PFALZ','Rheinland-Pfalz',1),
	(306,'SL',501,NULL,NULL,'SAARLAND','Saarland',1),
	(307,'SN',501,NULL,NULL,'SACHSEN','Sachsen',1),
	(308,'ST',501,NULL,NULL,'SACHSEN-ANHALT','Sachsen-Anhalt',1),
	(309,'SH',501,NULL,NULL,'SCHLESWIG-HOLSTEIN','Schleswig-Holstein',1),
	(310,'TH',501,NULL,NULL,'THÜRINGEN','Thüringen',1),
	(311,'66',10201,'',0,'','?????',1),
	(312,'67',10205,'',0,'','?????',1),
	(313,'01',10205,'',0,'','?????',1),
	(314,'02',10205,'',0,'','?????',1),
	(315,'03',10205,'',0,'','??????',1),
	(316,'04',10205,'',0,'','?????',1),
	(317,'05',10205,'',0,'','??????',1),
	(318,'06',10203,'',0,'','??????',1),
	(319,'07',10203,'',0,'','???????????',1),
	(320,'08',10203,'',0,'','??????',1),
	(321,'09',10203,'',0,'','?????',1),
	(322,'10',10203,'',0,'','??????',1),
	(323,'11',10203,'',0,'','??????',1),
	(324,'12',10203,'',0,'','?????????',1),
	(325,'13',10206,'',0,'','????',1),
	(326,'14',10206,'',0,'','?????????',1),
	(327,'15',10206,'',0,'','????????',1),
	(328,'16',10206,'',0,'','???????',1),
	(329,'17',10213,'',0,'','???????',1),
	(330,'18',10213,'',0,'','????????',1),
	(331,'19',10213,'',0,'','??????',1),
	(332,'20',10213,'',0,'','???????',1),
	(333,'21',10212,'',0,'','????????',1),
	(334,'22',10212,'',0,'','??????',1),
	(335,'23',10212,'',0,'','????????',1),
	(336,'24',10212,'',0,'','???????',1),
	(337,'25',10212,'',0,'','????????',1),
	(338,'26',10212,'',0,'','???????',1),
	(339,'27',10202,'',0,'','??????',1),
	(340,'28',10202,'',0,'','?????????',1),
	(341,'29',10202,'',0,'','????????',1),
	(342,'30',10202,'',0,'','??????',1),
	(343,'31',10209,'',0,'','????????',1),
	(344,'32',10209,'',0,'','???????',1),
	(345,'33',10209,'',0,'','????????',1),
	(346,'34',10209,'',0,'','???????',1),
	(347,'35',10209,'',0,'','????????',1),
	(348,'36',10211,'',0,'','???????????????',1),
	(349,'37',10211,'',0,'','?????',1),
	(350,'38',10211,'',0,'','?????',1),
	(351,'39',10207,'',0,'','????????',1),
	(352,'40',10207,'',0,'','???????',1),
	(353,'41',10207,'',0,'','??????????',1),
	(354,'42',10207,'',0,'','?????',1),
	(355,'43',10207,'',0,'','???????',1),
	(356,'44',10208,'',0,'','??????',1),
	(357,'45',10208,'',0,'','??????',1),
	(358,'46',10208,'',0,'','??????',1),
	(359,'47',10208,'',0,'','?????',1),
	(360,'48',10208,'',0,'','????',1),
	(361,'49',10210,'',0,'','??????',1),
	(362,'50',10210,'',0,'','????',1),
	(363,'51',10210,'',0,'','????????',1),
	(364,'52',10210,'',0,'','????????',1),
	(365,'53',10210,'',0,'','???-??????',1),
	(366,'54',10210,'',0,'','??',1),
	(367,'55',10210,'',0,'','?????',1),
	(368,'56',10210,'',0,'','???????',1),
	(369,'57',10210,'',0,'','?????',1),
	(370,'58',10210,'',0,'','?????',1),
	(371,'59',10210,'',0,'','?????',1),
	(372,'60',10210,'',0,'','?????',1),
	(373,'61',10210,'',0,'','?????',1),
	(374,'62',10204,'',0,'','????????',1),
	(375,'63',10204,'',0,'','??????',1),
	(376,'64',10204,'',0,'','???????',1),
	(377,'65',10204,'',0,'','?????',1),
	(378,'AG',601,NULL,NULL,'ARGOVIE','Argovie',1),
	(379,'AI',601,NULL,NULL,'APPENZELL RHODES INTERIEURES','Appenzell Rhodes intérieures',1),
	(380,'AR',601,NULL,NULL,'APPENZELL RHODES EXTERIEURES','Appenzell Rhodes extérieures',1),
	(381,'BE',601,NULL,NULL,'BERNE','Berne',1),
	(382,'BL',601,NULL,NULL,'BALE CAMPAGNE','Bâle Campagne',1),
	(383,'BS',601,NULL,NULL,'BALE VILLE','Bâle Ville',1),
	(384,'FR',601,NULL,NULL,'FRIBOURG','Fribourg',1),
	(385,'GE',601,NULL,NULL,'GENEVE','Genève',1),
	(386,'GL',601,NULL,NULL,'GLARIS','Glaris',1),
	(387,'GR',601,NULL,NULL,'GRISONS','Grisons',1),
	(388,'JU',601,NULL,NULL,'JURA','Jura',1),
	(389,'LU',601,NULL,NULL,'LUCERNE','Lucerne',1),
	(390,'NE',601,NULL,NULL,'NEUCHATEL','Neuchâtel',1),
	(391,'NW',601,NULL,NULL,'NIDWALD','Nidwald',1),
	(392,'OW',601,NULL,NULL,'OBWALD','Obwald',1),
	(393,'SG',601,NULL,NULL,'SAINT-GALL','Saint-Gall',1),
	(394,'SH',601,NULL,NULL,'SCHAFFHOUSE','Schaffhouse',1),
	(395,'SO',601,NULL,NULL,'SOLEURE','Soleure',1),
	(396,'SZ',601,NULL,NULL,'SCHWYZ','Schwyz',1),
	(397,'TG',601,NULL,NULL,'THURGOVIE','Thurgovie',1),
	(398,'TI',601,NULL,NULL,'TESSIN','Tessin',1),
	(399,'UR',601,NULL,NULL,'URI','Uri',1),
	(400,'VD',601,NULL,NULL,'VAUD','Vaud',1),
	(401,'VS',601,NULL,NULL,'VALAIS','Valais',1),
	(402,'ZG',601,NULL,NULL,'ZUG','Zug',1),
	(403,'ZH',601,NULL,NULL,'ZURICH','Zürich',1),
	(404,'701',701,NULL,0,NULL,'Bedfordshire',1),
	(405,'702',701,NULL,0,NULL,'Berkshire',1),
	(406,'703',701,NULL,0,NULL,'Bristol, City of',1),
	(407,'704',701,NULL,0,NULL,'Buckinghamshire',1),
	(408,'705',701,NULL,0,NULL,'Cambridgeshire',1),
	(409,'706',701,NULL,0,NULL,'Cheshire',1),
	(410,'707',701,NULL,0,NULL,'Cleveland',1),
	(411,'708',701,NULL,0,NULL,'Cornwall',1),
	(412,'709',701,NULL,0,NULL,'Cumberland',1),
	(413,'710',701,NULL,0,NULL,'Cumbria',1),
	(414,'711',701,NULL,0,NULL,'Derbyshire',1),
	(415,'712',701,NULL,0,NULL,'Devon',1),
	(416,'713',701,NULL,0,NULL,'Dorset',1),
	(417,'714',701,NULL,0,NULL,'Co. Durham',1),
	(418,'715',701,NULL,0,NULL,'East Riding of Yorkshire',1),
	(419,'716',701,NULL,0,NULL,'East Sussex',1),
	(420,'717',701,NULL,0,NULL,'Essex',1),
	(421,'718',701,NULL,0,NULL,'Gloucestershire',1),
	(422,'719',701,NULL,0,NULL,'Greater Manchester',1),
	(423,'720',701,NULL,0,NULL,'Hampshire',1),
	(424,'721',701,NULL,0,NULL,'Hertfordshire',1),
	(425,'722',701,NULL,0,NULL,'Hereford and Worcester',1),
	(426,'723',701,NULL,0,NULL,'Herefordshire',1),
	(427,'724',701,NULL,0,NULL,'Huntingdonshire',1),
	(428,'725',701,NULL,0,NULL,'Isle of Man',1),
	(429,'726',701,NULL,0,NULL,'Isle of Wight',1),
	(430,'727',701,NULL,0,NULL,'Jersey',1),
	(431,'728',701,NULL,0,NULL,'Kent',1),
	(432,'729',701,NULL,0,NULL,'Lancashire',1),
	(433,'730',701,NULL,0,NULL,'Leicestershire',1),
	(434,'731',701,NULL,0,NULL,'Lincolnshire',1),
	(435,'732',701,NULL,0,NULL,'London - City of London',1),
	(436,'733',701,NULL,0,NULL,'Merseyside',1),
	(437,'734',701,NULL,0,NULL,'Middlesex',1),
	(438,'735',701,NULL,0,NULL,'Norfolk',1),
	(439,'736',701,NULL,0,NULL,'North Yorkshire',1),
	(440,'737',701,NULL,0,NULL,'North Riding of Yorkshire',1),
	(441,'738',701,NULL,0,NULL,'Northamptonshire',1),
	(442,'739',701,NULL,0,NULL,'Northumberland',1),
	(443,'740',701,NULL,0,NULL,'Nottinghamshire',1),
	(444,'741',701,NULL,0,NULL,'Oxfordshire',1),
	(445,'742',701,NULL,0,NULL,'Rutland',1),
	(446,'743',701,NULL,0,NULL,'Shropshire',1),
	(447,'744',701,NULL,0,NULL,'Somerset',1),
	(448,'745',701,NULL,0,NULL,'Staffordshire',1),
	(449,'746',701,NULL,0,NULL,'Suffolk',1),
	(450,'747',701,NULL,0,NULL,'Surrey',1),
	(451,'748',701,NULL,0,NULL,'Sussex',1),
	(452,'749',701,NULL,0,NULL,'Tyne and Wear',1),
	(453,'750',701,NULL,0,NULL,'Warwickshire',1),
	(454,'751',701,NULL,0,NULL,'West Midlands',1),
	(455,'752',701,NULL,0,NULL,'West Sussex',1),
	(456,'753',701,NULL,0,NULL,'West Yorkshire',1),
	(457,'754',701,NULL,0,NULL,'West Riding of Yorkshire',1),
	(458,'755',701,NULL,0,NULL,'Wiltshire',1),
	(459,'756',701,NULL,0,NULL,'Worcestershire',1),
	(460,'757',701,NULL,0,NULL,'Yorkshire',1),
	(461,'758',702,NULL,0,NULL,'Anglesey',1),
	(462,'759',702,NULL,0,NULL,'Breconshire',1),
	(463,'760',702,NULL,0,NULL,'Caernarvonshire',1),
	(464,'761',702,NULL,0,NULL,'Cardiganshire',1),
	(465,'762',702,NULL,0,NULL,'Carmarthenshire',1),
	(466,'763',702,NULL,0,NULL,'Ceredigion',1),
	(467,'764',702,NULL,0,NULL,'Denbighshire',1),
	(468,'765',702,NULL,0,NULL,'Flintshire',1),
	(469,'766',702,NULL,0,NULL,'Glamorgan',1),
	(470,'767',702,NULL,0,NULL,'Gwent',1),
	(471,'768',702,NULL,0,NULL,'Gwynedd',1),
	(472,'769',702,NULL,0,NULL,'Merionethshire',1),
	(473,'770',702,NULL,0,NULL,'Monmouthshire',1),
	(474,'771',702,NULL,0,NULL,'Mid Glamorgan',1),
	(475,'772',702,NULL,0,NULL,'Montgomeryshire',1),
	(476,'773',702,NULL,0,NULL,'Pembrokeshire',1),
	(477,'774',702,NULL,0,NULL,'Powys',1),
	(478,'775',702,NULL,0,NULL,'Radnorshire',1),
	(479,'776',702,NULL,0,NULL,'South Glamorgan',1),
	(480,'777',703,NULL,0,NULL,'Aberdeen, City of',1),
	(481,'778',703,NULL,0,NULL,'Angus',1),
	(482,'779',703,NULL,0,NULL,'Argyll',1),
	(483,'780',703,NULL,0,NULL,'Ayrshire',1),
	(484,'781',703,NULL,0,NULL,'Banffshire',1),
	(485,'782',703,NULL,0,NULL,'Berwickshire',1),
	(486,'783',703,NULL,0,NULL,'Bute',1),
	(487,'784',703,NULL,0,NULL,'Caithness',1),
	(488,'785',703,NULL,0,NULL,'Clackmannanshire',1),
	(489,'786',703,NULL,0,NULL,'Dumfriesshire',1),
	(490,'787',703,NULL,0,NULL,'Dumbartonshire',1),
	(491,'788',703,NULL,0,NULL,'Dundee, City of',1),
	(492,'789',703,NULL,0,NULL,'East Lothian',1),
	(493,'790',703,NULL,0,NULL,'Fife',1),
	(494,'791',703,NULL,0,NULL,'Inverness',1),
	(495,'792',703,NULL,0,NULL,'Kincardineshire',1),
	(496,'793',703,NULL,0,NULL,'Kinross-shire',1),
	(497,'794',703,NULL,0,NULL,'Kirkcudbrightshire',1),
	(498,'795',703,NULL,0,NULL,'Lanarkshire',1),
	(499,'796',703,NULL,0,NULL,'Midlothian',1),
	(500,'797',703,NULL,0,NULL,'Morayshire',1),
	(501,'798',703,NULL,0,NULL,'Nairnshire',1),
	(502,'799',703,NULL,0,NULL,'Orkney',1),
	(503,'800',703,NULL,0,NULL,'Peebleshire',1),
	(504,'801',703,NULL,0,NULL,'Perthshire',1),
	(505,'802',703,NULL,0,NULL,'Renfrewshire',1),
	(506,'803',703,NULL,0,NULL,'Ross & Cromarty',1),
	(507,'804',703,NULL,0,NULL,'Roxburghshire',1),
	(508,'805',703,NULL,0,NULL,'Selkirkshire',1),
	(509,'806',703,NULL,0,NULL,'Shetland',1),
	(510,'807',703,NULL,0,NULL,'Stirlingshire',1),
	(511,'808',703,NULL,0,NULL,'Sutherland',1),
	(512,'809',703,NULL,0,NULL,'West Lothian',1),
	(513,'810',703,NULL,0,NULL,'Wigtownshire',1),
	(514,'811',704,NULL,0,NULL,'Antrim',1),
	(515,'812',704,NULL,0,NULL,'Armagh',1),
	(516,'813',704,NULL,0,NULL,'Co. Down',1),
	(517,'814',704,NULL,0,NULL,'Co. Fermanagh',1),
	(518,'815',704,NULL,0,NULL,'Co. Londonderry',1),
	(519,'AL',1101,'',0,'ALABAMA','Alabama',1),
	(520,'AK',1101,'',0,'ALASKA','Alaska',1),
	(521,'AZ',1101,'',0,'ARIZONA','Arizona',1),
	(522,'AR',1101,'',0,'ARKANSAS','Arkansas',1),
	(523,'CA',1101,'',0,'CALIFORNIA','California',1),
	(524,'CO',1101,'',0,'COLORADO','Colorado',1),
	(525,'CT',1101,'',0,'CONNECTICUT','Connecticut',1),
	(526,'DE',1101,'',0,'DELAWARE','Delaware',1),
	(527,'FL',1101,'',0,'FLORIDA','Florida',1),
	(528,'GA',1101,'',0,'GEORGIA','Georgia',1),
	(529,'HI',1101,'',0,'HAWAII','Hawaii',1),
	(530,'ID',1101,'',0,'IDAHO','Idaho',1),
	(531,'IL',1101,'',0,'ILLINOIS','Illinois',1),
	(532,'IN',1101,'',0,'INDIANA','Indiana',1),
	(533,'IA',1101,'',0,'IOWA','Iowa',1),
	(534,'KS',1101,'',0,'KANSAS','Kansas',1),
	(535,'KY',1101,'',0,'KENTUCKY','Kentucky',1),
	(536,'LA',1101,'',0,'LOUISIANA','Louisiana',1),
	(537,'ME',1101,'',0,'MAINE','Maine',1),
	(538,'MD',1101,'',0,'MARYLAND','Maryland',1),
	(539,'MA',1101,'',0,'MASSACHUSSETTS','Massachusetts',1),
	(540,'MI',1101,'',0,'MICHIGAN','Michigan',1),
	(541,'MN',1101,'',0,'MINNESOTA','Minnesota',1),
	(542,'MS',1101,'',0,'MISSISSIPPI','Mississippi',1),
	(543,'MO',1101,'',0,'MISSOURI','Missouri',1),
	(544,'MT',1101,'',0,'MONTANA','Montana',1),
	(545,'NE',1101,'',0,'NEBRASKA','Nebraska',1),
	(546,'NV',1101,'',0,'NEVADA','Nevada',1),
	(547,'NH',1101,'',0,'NEW HAMPSHIRE','New Hampshire',1),
	(548,'NJ',1101,'',0,'NEW JERSEY','New Jersey',1),
	(549,'NM',1101,'',0,'NEW MEXICO','New Mexico',1),
	(550,'NY',1101,'',0,'NEW YORK','New York',1),
	(551,'NC',1101,'',0,'NORTH CAROLINA','North Carolina',1),
	(552,'ND',1101,'',0,'NORTH DAKOTA','North Dakota',1),
	(553,'OH',1101,'',0,'OHIO','Ohio',1),
	(554,'OK',1101,'',0,'OKLAHOMA','Oklahoma',1),
	(555,'OR',1101,'',0,'OREGON','Oregon',1),
	(556,'PA',1101,'',0,'PENNSYLVANIA','Pennsylvania',1),
	(557,'RI',1101,'',0,'RHODE ISLAND','Rhode Island',1),
	(558,'SC',1101,'',0,'SOUTH CAROLINA','South Carolina',1),
	(559,'SD',1101,'',0,'SOUTH DAKOTA','South Dakota',1),
	(560,'TN',1101,'',0,'TENNESSEE','Tennessee',1),
	(561,'TX',1101,'',0,'TEXAS','Texas',1),
	(562,'UT',1101,'',0,'UTAH','Utah',1),
	(563,'VT',1101,'',0,'VERMONT','Vermont',1),
	(564,'VA',1101,'',0,'VIRGINIA','Virginia',1),
	(565,'WA',1101,'',0,'WASHINGTON','Washington',1),
	(566,'WV',1101,'',0,'WEST VIRGINIA','West Virginia',1),
	(567,'WI',1101,'',0,'WISCONSIN','Wisconsin',1),
	(568,'WY',1101,'',0,'WYOMING','Wyoming',1),
	(569,'GR',1701,NULL,NULL,NULL,'Groningen',1),
	(570,'FR',1701,NULL,NULL,NULL,'Friesland',1),
	(571,'DR',1701,NULL,NULL,NULL,'Drenthe',1),
	(572,'OV',1701,NULL,NULL,NULL,'Overijssel',1),
	(573,'GD',1701,NULL,NULL,NULL,'Gelderland',1),
	(574,'FL',1701,NULL,NULL,NULL,'Flevoland',1),
	(575,'UT',1701,NULL,NULL,NULL,'Utrecht',1),
	(576,'NH',1701,NULL,NULL,NULL,'Noord-Holland',1),
	(577,'ZH',1701,NULL,NULL,NULL,'Zuid-Holland',1),
	(578,'ZL',1701,NULL,NULL,NULL,'Zeeland',1),
	(579,'NB',1701,NULL,NULL,NULL,'Noord-Brabant',1),
	(580,'LB',1701,NULL,NULL,NULL,'Limburg',1),
	(581,'SS',8601,'',0,'','San Salvador',1),
	(582,'SA',8603,'',0,'','Santa Ana',1),
	(583,'AH',8603,'',0,'','Ahuachapan',1),
	(584,'SO',8603,'',0,'','Sonsonate',1),
	(585,'US',8602,'',0,'','Usulutan',1),
	(586,'SM',8602,'',0,'','San Miguel',1),
	(587,'MO',8602,'',0,'','Morazan',1),
	(588,'LU',8602,'',0,'','La Union',1),
	(589,'LL',8601,'',0,'','La Libertad',1),
	(590,'CH',8601,'',0,'','Chalatenango',1),
	(591,'CA',8601,'',0,'','Cabañas',1),
	(592,'LP',8601,'',0,'','La Paz',1),
	(593,'SV',8601,'',0,'','San Vicente',1),
	(594,'CU',8601,'',0,'','Cuscatlan',1),
	(595,'2301',2301,'',0,'CATAMARCA','Catamarca',1),
	(596,'2302',2301,'',0,'JUJUY','Jujuy',1),
	(597,'2303',2301,'',0,'TUCAMAN','Tucamán',1),
	(598,'2304',2301,'',0,'SANTIAGO DEL ESTERO','Santiago del Estero',1),
	(599,'2305',2301,'',0,'SALTA','Salta',1),
	(600,'2306',2302,'',0,'CHACO','Chaco',1),
	(601,'2307',2302,'',0,'CORRIENTES','Corrientes',1),
	(602,'2308',2302,'',0,'ENTRE RIOS','Entre Ríos',1),
	(603,'2309',2302,'',0,'FORMOSA MISIONES','Formosa Misiones',1),
	(604,'2310',2302,'',0,'SANTA FE','Santa Fe',1),
	(605,'2311',2303,'',0,'LA RIOJA','La Rioja',1),
	(606,'2312',2303,'',0,'MENDOZA','Mendoza',1),
	(607,'2313',2303,'',0,'SAN JUAN','San Juan',1),
	(608,'2314',2303,'',0,'SAN LUIS','San Luis',1),
	(609,'2315',2304,'',0,'CORDOBA','Córdoba',1),
	(610,'2316',2304,'',0,'BUENOS AIRES','Buenos Aires',1),
	(611,'2317',2304,'',0,'CABA','Caba',1),
	(612,'2318',2305,'',0,'LA PAMPA','La Pampa',1),
	(613,'2319',2305,'',0,'NEUQUEN','Neuquén',1),
	(614,'2320',2305,'',0,'RIO NEGRO','Río Negro',1),
	(615,'2321',2305,'',0,'CHUBUT','Chubut',1),
	(616,'2322',2305,'',0,'SANTA CRUZ','Santa Cruz',1),
	(617,'2323',2305,'',0,'TIERRA DEL FUEGO','Tierra del Fuego',1),
	(618,'2324',2305,'',0,'ISLAS MALVINAS','Islas Malvinas',1),
	(619,'2325',2305,'',0,'ANTARTIDA','Antártida',1),
	(620,'AC',5601,'ACRE',0,'AC','Acre',1),
	(621,'AL',5601,'ALAGOAS',0,'AL','Alagoas',1),
	(622,'AP',5601,'AMAPA',0,'AP','Amapá',1),
	(623,'AM',5601,'AMAZONAS',0,'AM','Amazonas',1),
	(624,'BA',5601,'BAHIA',0,'BA','Bahia',1),
	(625,'CE',5601,'CEARA',0,'CE','Ceará',1),
	(626,'ES',5601,'ESPIRITO SANTO',0,'ES','Espirito Santo',1),
	(627,'GO',5601,'GOIAS',0,'GO','Goiás',1),
	(628,'MA',5601,'MARANHAO',0,'MA','Maranhão',1),
	(629,'MT',5601,'MATO GROSSO',0,'MT','Mato Grosso',1),
	(630,'MS',5601,'MATO GROSSO DO SUL',0,'MS','Mato Grosso do Sul',1),
	(631,'MG',5601,'MINAS GERAIS',0,'MG','Minas Gerais',1),
	(632,'PA',5601,'PARA',0,'PA','Pará',1),
	(633,'PB',5601,'PARAIBA',0,'PB','Paraiba',1),
	(634,'PR',5601,'PARANA',0,'PR','Paraná',1),
	(635,'PE',5601,'PERNAMBUCO',0,'PE','Pernambuco',1),
	(636,'PI',5601,'PIAUI',0,'PI','Piauí',1),
	(637,'RJ',5601,'RIO DE JANEIRO',0,'RJ','Rio de Janeiro',1),
	(638,'RN',5601,'RIO GRANDE DO NORTE',0,'RN','Rio Grande do Norte',1),
	(639,'RS',5601,'RIO GRANDE DO SUL',0,'RS','Rio Grande do Sul',1),
	(640,'RO',5601,'RONDONIA',0,'RO','Rondônia',1),
	(641,'RR',5601,'RORAIMA',0,'RR','Roraima',1),
	(642,'SC',5601,'SANTA CATARINA',0,'SC','Santa Catarina',1),
	(643,'SE',5601,'SERGIPE',0,'SE','Sergipe',1),
	(644,'SP',5601,'SAO PAULO',0,'SP','Sao Paulo',1),
	(645,'TO',5601,'TOCANTINS',0,'TO','Tocantins',1),
	(646,'DF',5601,'DISTRITO FEDERAL',0,'DF','Distrito Federal',1),
	(647,'151',6715,'',0,'151','Arica',1),
	(648,'152',6715,'',0,'152','Parinacota',1),
	(649,'011',6701,'',0,'011','Iquique',1),
	(650,'014',6701,'',0,'014','Tamarugal',1),
	(651,'021',6702,'',0,'021','Antofagasa',1),
	(652,'022',6702,'',0,'022','El Loa',1),
	(653,'023',6702,'',0,'023','Tocopilla',1),
	(654,'031',6703,'',0,'031','Copiapó',1),
	(655,'032',6703,'',0,'032','Chañaral',1),
	(656,'033',6703,'',0,'033','Huasco',1),
	(657,'041',6704,'',0,'041','Elqui',1),
	(658,'042',6704,'',0,'042','Choapa',1),
	(659,'043',6704,'',0,'043','Limarí',1),
	(660,'051',6705,'',0,'051','Valparaíso',1),
	(661,'052',6705,'',0,'052','Isla de Pascua',1),
	(662,'053',6705,'',0,'053','Los Andes',1),
	(663,'054',6705,'',0,'054','Petorca',1),
	(664,'055',6705,'',0,'055','Quillota',1),
	(665,'056',6705,'',0,'056','San Antonio',1),
	(666,'057',6705,'',0,'057','San Felipe de Aconcagua',1),
	(667,'058',6705,'',0,'058','Marga Marga',1),
	(668,'061',6706,'',0,'061','Cachapoal',1),
	(669,'062',6706,'',0,'062','Cardenal Caro',1),
	(670,'063',6706,'',0,'063','Colchagua',1),
	(671,'071',6707,'',0,'071','Talca',1),
	(672,'072',6707,'',0,'072','Cauquenes',1),
	(673,'073',6707,'',0,'073','Curicó',1),
	(674,'074',6707,'',0,'074','Linares',1),
	(675,'081',6708,'',0,'081','Concepción',1),
	(676,'082',6708,'',0,'082','Arauco',1),
	(677,'083',6708,'',0,'083','Biobío',1),
	(678,'084',6708,'',0,'084','Ñuble',1),
	(679,'091',6709,'',0,'091','Cautín',1),
	(680,'092',6709,'',0,'092','Malleco',1),
	(681,'141',6714,'',0,'141','Valdivia',1),
	(682,'142',6714,'',0,'142','Ranco',1),
	(683,'101',6710,'',0,'101','Llanquihue',1),
	(684,'102',6710,'',0,'102','Chiloé',1),
	(685,'103',6710,'',0,'103','Osorno',1),
	(686,'104',6710,'',0,'104','Palena',1),
	(687,'111',6711,'',0,'111','Coihaique',1),
	(688,'112',6711,'',0,'112','Aisén',1),
	(689,'113',6711,'',0,'113','Capitán Prat',1),
	(690,'114',6711,'',0,'114','General Carrera',1),
	(691,'121',6712,'',0,'121','Magallanes',1),
	(692,'122',6712,'',0,'122','Antártica Chilena',1),
	(693,'123',6712,'',0,'123','Tierra del Fuego',1),
	(694,'124',6712,'',0,'124','Última Esperanza',1),
	(695,'131',6713,'',0,'131','Santiago',1),
	(696,'132',6713,'',0,'132','Cordillera',1),
	(697,'133',6713,'',0,'133','Chacabuco',1),
	(698,'134',6713,'',0,'134','Maipo',1),
	(699,'135',6713,'',0,'135','Melipilla',1),
	(700,'136',6713,'',0,'136','Talagante',1),
	(701,'AN',11701,NULL,0,'AN','Andaman & Nicobar',1),
	(702,'AP',11701,NULL,0,'AP','Andhra Pradesh',1),
	(703,'AR',11701,NULL,0,'AR','Arunachal Pradesh',1),
	(704,'AS',11701,NULL,0,'AS','Assam',1),
	(705,'BR',11701,NULL,0,'BR','Bihar',1),
	(706,'CG',11701,NULL,0,'CG','Chattisgarh',1),
	(707,'CH',11701,NULL,0,'CH','Chandigarh',1),
	(708,'DD',11701,NULL,0,'DD','Daman & Diu',1),
	(709,'DL',11701,NULL,0,'DL','Delhi',1),
	(710,'DN',11701,NULL,0,'DN','Dadra and Nagar Haveli',1),
	(711,'GA',11701,NULL,0,'GA','Goa',1),
	(712,'GJ',11701,NULL,0,'GJ','Gujarat',1),
	(713,'HP',11701,NULL,0,'HP','Himachal Pradesh',1),
	(714,'HR',11701,NULL,0,'HR','Haryana',1),
	(715,'JH',11701,NULL,0,'JH','Jharkhand',1),
	(716,'JK',11701,NULL,0,'JK','Jammu & Kashmir',1),
	(717,'KA',11701,NULL,0,'KA','Karnataka',1),
	(718,'KL',11701,NULL,0,'KL','Kerala',1),
	(719,'LD',11701,NULL,0,'LD','Lakshadweep',1),
	(720,'MH',11701,NULL,0,'MH','Maharashtra',1),
	(721,'ML',11701,NULL,0,'ML','Meghalaya',1),
	(722,'MN',11701,NULL,0,'MN','Manipur',1),
	(723,'MP',11701,NULL,0,'MP','Madhya Pradesh',1),
	(724,'MZ',11701,NULL,0,'MZ','Mizoram',1),
	(725,'NL',11701,NULL,0,'NL','Nagaland',1),
	(726,'OR',11701,NULL,0,'OR','Orissa',1),
	(727,'PB',11701,NULL,0,'PB','Punjab',1),
	(728,'PY',11701,NULL,0,'PY','Puducherry',1),
	(729,'RJ',11701,NULL,0,'RJ','Rajasthan',1),
	(730,'SK',11701,NULL,0,'SK','Sikkim',1),
	(731,'TN',11701,NULL,0,'TN','Tamil Nadu',1),
	(732,'TR',11701,NULL,0,'TR','Tripura',1),
	(733,'UL',11701,NULL,0,'UL','Uttarakhand',1),
	(734,'UP',11701,NULL,0,'UP','Uttar Pradesh',1),
	(735,'WB',11701,NULL,0,'WB','West Bengal',1),
	(736,'DIF',15401,'',0,'DIF','Distrito Federal',1),
	(737,'AGS',15401,'',0,'AGS','Aguascalientes',1),
	(738,'BCN',15401,'',0,'BCN','Baja California Norte',1),
	(739,'BCS',15401,'',0,'BCS','Baja California Sur',1),
	(740,'CAM',15401,'',0,'CAM','Campeche',1),
	(741,'CHP',15401,'',0,'CHP','Chiapas',1),
	(742,'CHI',15401,'',0,'CHI','Chihuahua',1),
	(743,'COA',15401,'',0,'COA','Coahuila',1),
	(744,'COL',15401,'',0,'COL','Colima',1),
	(745,'DUR',15401,'',0,'DUR','Durango',1),
	(746,'GTO',15401,'',0,'GTO','Guanajuato',1),
	(747,'GRO',15401,'',0,'GRO','Guerrero',1),
	(748,'HGO',15401,'',0,'HGO','Hidalgo',1),
	(749,'JAL',15401,'',0,'JAL','Jalisco',1),
	(750,'MEX',15401,'',0,'MEX','México',1),
	(751,'MIC',15401,'',0,'MIC','Michoacán de Ocampo',1),
	(752,'MOR',15401,'',0,'MOR','Morelos',1),
	(753,'NAY',15401,'',0,'NAY','Nayarit',1),
	(754,'NLE',15401,'',0,'NLE','Nuevo León',1),
	(755,'OAX',15401,'',0,'OAX','Oaxaca',1),
	(756,'PUE',15401,'',0,'PUE','Puebla',1),
	(757,'QRO',15401,'',0,'QRO','Querétaro',1),
	(758,'ROO',15401,'',0,'ROO','Quintana Roo',1),
	(759,'SLP',15401,'',0,'SLP','San Luis Potosí',1),
	(760,'SIN',15401,'',0,'SIN','Sinaloa',1),
	(761,'SON',15401,'',0,'SON','Sonora',1),
	(762,'TAB',15401,'',0,'TAB','Tabasco',1),
	(763,'TAM',15401,'',0,'TAM','Tamaulipas',1),
	(764,'TLX',15401,'',0,'TLX','Tlaxcala',1),
	(765,'VER',15401,'',0,'VER','Veracruz',1),
	(766,'YUC',15401,'',0,'YUC','Yucatán',1),
	(767,'ZAC',15401,'',0,'ZAC','Zacatecas',1),
	(768,'ANT',7001,'',0,'ANT','Antioquia',1),
	(769,'BOL',7001,'',0,'BOL','Bolívar',1),
	(770,'BOY',7001,'',0,'BOY','Boyacá',1),
	(771,'CAL',7001,'',0,'CAL','Caldas',1),
	(772,'CAU',7001,'',0,'CAU','Cauca',1),
	(773,'CUN',7001,'',0,'CUN','Cundinamarca',1),
	(774,'HUI',7001,'',0,'HUI','Huila',1),
	(775,'LAG',7001,'',0,'LAG','La Guajira',1),
	(776,'MET',7001,'',0,'MET','Meta',1),
	(777,'NAR',7001,'',0,'NAR','Nariño',1),
	(778,'NDS',7001,'',0,'NDS','Norte de Santander',1),
	(779,'SAN',7001,'',0,'SAN','Santander',1),
	(780,'SUC',7001,'',0,'SUC','Sucre',1),
	(781,'TOL',7001,'',0,'TOL','Tolima',1),
	(782,'VAC',7001,'',0,'VAC','Valle del Cauca',1),
	(783,'RIS',7001,'',0,'RIS','Risalda',1),
	(784,'ATL',7001,'',0,'ATL','Atlántico',1),
	(785,'COR',7001,'',0,'COR','Córdoba',1),
	(786,'SAP',7001,'',0,'SAP','San Andrés, Providencia y Santa Catalina',1),
	(787,'ARA',7001,'',0,'ARA','Arauca',1),
	(788,'CAS',7001,'',0,'CAS','Casanare',1),
	(789,'AMA',7001,'',0,'AMA','Amazonas',1),
	(790,'CAQ',7001,'',0,'CAQ','Caquetá',1),
	(791,'CHO',7001,'',0,'CHO','Chocó',1),
	(792,'GUA',7001,'',0,'GUA','Guainía',1),
	(793,'GUV',7001,'',0,'GUV','Guaviare',1),
	(794,'PUT',7001,'',0,'PUT','Putumayo',1),
	(795,'QUI',7001,'',0,'QUI','Quindío',1),
	(796,'VAU',7001,'',0,'VAU','Vaupés',1),
	(797,'BOG',7001,'',0,'BOG','Bogotá',1),
	(798,'VID',7001,'',0,'VID','Vichada',1),
	(799,'CES',7001,'',0,'CES','Cesar',1),
	(800,'MAG',7001,'',0,'MAG','Magdalena',1),
	(801,'AT',11401,'',0,'AT','Atlántida',1),
	(802,'CH',11401,'',0,'CH','Choluteca',1),
	(803,'CL',11401,'',0,'CL','Colón',1),
	(804,'CM',11401,'',0,'CM','Comayagua',1),
	(805,'CO',11401,'',0,'CO','Copán',1),
	(806,'CR',11401,'',0,'CR','Cortés',1),
	(807,'EP',11401,'',0,'EP','El Paraíso',1),
	(808,'FM',11401,'',0,'FM','Francisco Morazán',1),
	(809,'GD',11401,'',0,'GD','Gracias a Dios',1),
	(810,'IN',11401,'',0,'IN','Intibucá',1),
	(811,'IB',11401,'',0,'IB','Islas de la Bahía',1),
	(812,'LP',11401,'',0,'LP','La Paz',1),
	(813,'LM',11401,'',0,'LM','Lempira',1),
	(814,'OC',11401,'',0,'OC','Ocotepeque',1),
	(815,'OL',11401,'',0,'OL','Olancho',1),
	(816,'SB',11401,'',0,'SB','Santa Bárbara',1),
	(817,'VL',11401,'',0,'VL','Valle',1),
	(818,'YO',11401,'',0,'YO','Yoro',1),
	(819,'DC',11401,'',0,'DC','Distrito Central',1),
	(820,'CC',4601,'Oistins',0,'CC','Christ Church',1),
	(821,'SA',4601,'Greenland',0,'SA','Saint Andrew',1),
	(822,'SG',4601,'Bulkeley',0,'SG','Saint George',1),
	(823,'JA',4601,'Holetown',0,'JA','Saint James',1),
	(824,'SJ',4601,'Four Roads',0,'SJ','Saint John',1),
	(825,'SB',4601,'Bathsheba',0,'SB','Saint Joseph',1),
	(826,'SL',4601,'Crab Hill',0,'SL','Saint Lucy',1),
	(827,'SM',4601,'Bridgetown',0,'SM','Saint Michael',1),
	(828,'SP',4601,'Speightstown',0,'SP','Saint Peter',1),
	(829,'SC',4601,'Crane',0,'SC','Saint Philip',1),
	(830,'ST',4601,'Hillaby',0,'ST','Saint Thomas',1),
	(831,'VE-L',23201,'',0,'VE-L','Mérida',1),
	(832,'VE-T',23201,'',0,'VE-T','Trujillo',1),
	(833,'VE-E',23201,'',0,'VE-E','Barinas',1),
	(834,'VE-M',23202,'',0,'VE-M','Miranda',1),
	(835,'VE-W',23202,'',0,'VE-W','Vargas',1),
	(836,'VE-A',23202,'',0,'VE-A','Distrito Capital',1),
	(837,'VE-D',23203,'',0,'VE-D','Aragua',1),
	(838,'VE-G',23203,'',0,'VE-G','Carabobo',1),
	(839,'VE-I',23204,'',0,'VE-I','Falcón',1),
	(840,'VE-K',23204,'',0,'VE-K','Lara',1),
	(841,'VE-U',23204,'',0,'VE-U','Yaracuy',1),
	(842,'VE-F',23205,'',0,'VE-F','Bolívar',1),
	(843,'VE-X',23205,'',0,'VE-X','Amazonas',1),
	(844,'VE-Y',23205,'',0,'VE-Y','Delta Amacuro',1),
	(845,'VE-O',23206,'',0,'VE-O','Nueva Esparta',1),
	(846,'VE-Z',23206,'',0,'VE-Z','Dependencias Federales',1),
	(847,'VE-C',23207,'',0,'VE-C','Apure',1),
	(848,'VE-J',23207,'',0,'VE-J','Guárico',1),
	(849,'VE-H',23207,'',0,'VE-H','Cojedes',1),
	(850,'VE-P',23207,'',0,'VE-P','Portuguesa',1),
	(851,'VE-B',23208,'',0,'VE-B','Anzoátegui',1),
	(852,'VE-N',23208,'',0,'VE-N','Monagas',1),
	(853,'VE-R',23208,'',0,'VE-R','Sucre',1),
	(854,'VE-V',23209,'',0,'VE-V','Zulia',1),
	(855,'VE-S',23209,'',0,'VE-S','Táchira',1),
	(856,'AL01',1301,'',0,'','Wilaya d\'Adrar',1),
	(857,'AL02',1301,'',0,'','Wilaya de Chlef',1),
	(858,'AL03',1301,'',0,'','Wilaya de Laghouat',1),
	(859,'AL04',1301,'',0,'','Wilaya d\'Oum El Bouaghi',1),
	(860,'AL05',1301,'',0,'','Wilaya de Batna',1),
	(861,'AL06',1301,'',0,'','Wilaya de Béjaïa',1),
	(862,'AL07',1301,'',0,'','Wilaya de Biskra',1),
	(863,'AL08',1301,'',0,'','Wilaya de Béchar',1),
	(864,'AL09',1301,'',0,'','Wilaya de Blida',1),
	(865,'AL11',1301,'',0,'','Wilaya de Bouira',1),
	(866,'AL12',1301,'',0,'','Wilaya de Tamanrasset',1),
	(867,'AL13',1301,'',0,'','Wilaya de Tébessa',1),
	(868,'AL14',1301,'',0,'','Wilaya de Tlemcen',1),
	(869,'AL15',1301,'',0,'','Wilaya de Tiaret',1),
	(870,'AL16',1301,'',0,'','Wilaya de Tizi Ouzou',1),
	(871,'AL17',1301,'',0,'','Wilaya d\'Alger',1),
	(872,'AL18',1301,'',0,'','Wilaya de Djelfa',1),
	(873,'AL19',1301,'',0,'','Wilaya de Jijel',1),
	(874,'AL20',1301,'',0,'','Wilaya de Sétif	',1),
	(875,'AL21',1301,'',0,'','Wilaya de Saïda',1),
	(876,'AL22',1301,'',0,'','Wilaya de Skikda',1),
	(877,'AL23',1301,'',0,'','Wilaya de Sidi Bel Abbès',1),
	(878,'AL24',1301,'',0,'','Wilaya d\'Annaba',1),
	(879,'AL25',1301,'',0,'','Wilaya de Guelma',1),
	(880,'AL26',1301,'',0,'','Wilaya de Constantine',1),
	(881,'AL27',1301,'',0,'','Wilaya de Médéa',1),
	(882,'AL28',1301,'',0,'','Wilaya de Mostaganem',1),
	(883,'AL29',1301,'',0,'','Wilaya de M\'Sila',1),
	(884,'AL30',1301,'',0,'','Wilaya de Mascara',1),
	(885,'AL31',1301,'',0,'','Wilaya d\'Ouargla',1),
	(886,'AL32',1301,'',0,'','Wilaya d\'Oran',1),
	(887,'AL33',1301,'',0,'','Wilaya d\'El Bayadh',1),
	(888,'AL34',1301,'',0,'','Wilaya d\'Illizi',1),
	(889,'AL35',1301,'',0,'','Wilaya de Bordj Bou Arreridj',1),
	(890,'AL36',1301,'',0,'','Wilaya de Boumerdès',1),
	(891,'AL37',1301,'',0,'','Wilaya d\'El Tarf',1),
	(892,'AL38',1301,'',0,'','Wilaya de Tindouf',1),
	(893,'AL39',1301,'',0,'','Wilaya de Tissemsilt',1),
	(894,'AL40',1301,'',0,'','Wilaya d\'El Oued',1),
	(895,'AL41',1301,'',0,'','Wilaya de Khenchela',1),
	(896,'AL42',1301,'',0,'','Wilaya de Souk Ahras',1),
	(897,'AL43',1301,'',0,'','Wilaya de Tipaza',1),
	(898,'AL44',1301,'',0,'','Wilaya de Mila',1),
	(899,'AL45',1301,'',0,'','Wilaya d\'Aïn Defla',1),
	(900,'AL46',1301,'',0,'','Wilaya de Naâma',1),
	(901,'AL47',1301,'',0,'','Wilaya d\'Aïn Témouchent',1),
	(902,'AL48',1301,'',0,'','Wilaya de Ghardaia',1),
	(903,'AL49',1301,'',0,'','Wilaya de Relizane',1),
	(904,'MA',1209,'',0,'','Province de Benslimane',1),
	(905,'MA1',1209,'',0,'','Province de Berrechid',1),
	(906,'MA2',1209,'',0,'','Province de Khouribga',1),
	(907,'MA3',1209,'',0,'','Province de Settat',1),
	(908,'MA4',1210,'',0,'','Province d\'El Jadida',1),
	(909,'MA5',1210,'',0,'','Province de Safi',1),
	(910,'MA6',1210,'',0,'','Province de Sidi Bennour',1),
	(911,'MA7',1210,'',0,'','Province de Youssoufia',1),
	(912,'MA6B',1205,'',0,'','Préfecture de Fès',1),
	(913,'MA7B',1205,'',0,'','Province de Boulemane',1),
	(914,'MA8',1205,'',0,'','Province de Moulay Yacoub',1),
	(915,'MA9',1205,'',0,'','Province de Sefrou',1),
	(916,'MA8A',1202,'',0,'','Province de Kénitra',1),
	(917,'MA9A',1202,'',0,'','Province de Sidi Kacem',1),
	(918,'MA10',1202,'',0,'','Province de Sidi Slimane',1),
	(919,'MA11',1208,'',0,'','Préfecture de Casablanca',1),
	(920,'MA12',1208,'',0,'','Préfecture de Mohammédia',1),
	(921,'MA13',1208,'',0,'','Province de Médiouna',1),
	(922,'MA14',1208,'',0,'','Province de Nouaceur',1),
	(923,'MA15',1214,'',0,'','Province d\'Assa-Zag',1),
	(924,'MA16',1214,'',0,'','Province d\'Es-Semara',1),
	(925,'MA17A',1214,'',0,'','Province de Guelmim',1),
	(926,'MA18',1214,'',0,'','Province de Tata',1),
	(927,'MA19',1214,'',0,'','Province de Tan-Tan',1),
	(928,'MA15',1215,'',0,'','Province de Boujdour',1),
	(929,'MA16',1215,'',0,'','Province de Lâayoune',1),
	(930,'MA17',1215,'',0,'','Province de Tarfaya',1),
	(931,'MA18',1211,'',0,'','Préfecture de Marrakech',1),
	(932,'MA19',1211,'',0,'','Province d\'Al Haouz',1),
	(933,'MA20',1211,'',0,'','Province de Chichaoua',1),
	(934,'MA21',1211,'',0,'','Province d\'El Kelâa des Sraghna',1),
	(935,'MA22',1211,'',0,'','Province d\'Essaouira',1),
	(936,'MA23',1211,'',0,'','Province de Rehamna',1),
	(937,'MA24',1206,'',0,'','Préfecture de Meknès',1),
	(938,'MA25',1206,'',0,'','Province d’El Hajeb',1),
	(939,'MA26',1206,'',0,'','Province d\'Errachidia',1),
	(940,'MA27',1206,'',0,'','Province d’Ifrane',1),
	(941,'MA28',1206,'',0,'','Province de Khénifra',1),
	(942,'MA29',1206,'',0,'','Province de Midelt',1),
	(943,'MA30',1204,'',0,'','Préfecture d\'Oujda-Angad',1),
	(944,'MA31',1204,'',0,'','Province de Berkane',1),
	(945,'MA32',1204,'',0,'','Province de Driouch',1),
	(946,'MA33',1204,'',0,'','Province de Figuig',1),
	(947,'MA34',1204,'',0,'','Province de Jerada',1),
	(948,'MA35',1204,'',0,'','Province de Nadorgg',1),
	(949,'MA36',1204,'',0,'','Province de Taourirt',1),
	(950,'MA37',1216,'',0,'','Province d\'Aousserd',1),
	(951,'MA38',1216,'',0,'','Province d\'Oued Ed-Dahab',1),
	(952,'MA39',1207,'',0,'','Préfecture de Rabat',1),
	(953,'MA40',1207,'',0,'','Préfecture de Skhirat-Témara',1),
	(954,'MA41',1207,'',0,'','Préfecture de Salé',1),
	(955,'MA42',1207,'',0,'','Province de Khémisset',1),
	(956,'MA43',1213,'',0,'','Préfecture d\'Agadir Ida-Outanane',1),
	(957,'MA44',1213,'',0,'','Préfecture d\'Inezgane-Aït Melloul',1),
	(958,'MA45',1213,'',0,'','Province de Chtouka-Aït Baha',1),
	(959,'MA46',1213,'',0,'','Province d\'Ouarzazate',1),
	(960,'MA47',1213,'',0,'','Province de Sidi Ifni',1),
	(961,'MA48',1213,'',0,'','Province de Taroudant',1),
	(962,'MA49',1213,'',0,'','Province de Tinghir',1),
	(963,'MA50',1213,'',0,'','Province de Tiznit',1),
	(964,'MA51',1213,'',0,'','Province de Zagora',1),
	(965,'MA52',1212,'',0,'','Province d\'Azilal',1),
	(966,'MA53',1212,'',0,'','Province de Beni Mellal',1),
	(967,'MA54',1212,'',0,'','Province de Fquih Ben Salah',1),
	(968,'MA55',1201,'',0,'','Préfecture de M\'diq-Fnideq',1),
	(969,'MA56',1201,'',0,'','Préfecture de Tanger-Asilah',1),
	(970,'MA57',1201,'',0,'','Province de Chefchaouen',1),
	(971,'MA58',1201,'',0,'','Province de Fahs-Anjra',1),
	(972,'MA59',1201,'',0,'','Province de Larache',1),
	(973,'MA60',1201,'',0,'','Province d\'Ouezzane',1),
	(974,'MA61',1201,'',0,'','Province de Tétouan',1),
	(975,'MA62',1203,'',0,'','Province de Guercif',1),
	(976,'MA63',1203,'',0,'','Province d\'Al Hoceïma',1),
	(977,'MA64',1203,'',0,'','Province de Taounate',1),
	(978,'MA65',1203,'',0,'','Province de Taza',1),
	(979,'MA6A',1205,'',0,'','Préfecture de Fès',1),
	(980,'MA7A',1205,'',0,'','Province de Boulemane',1),
	(981,'MA15A',1214,'',0,'','Province d\'Assa-Zag',1),
	(982,'MA16A',1214,'',0,'','Province d\'Es-Semara',1),
	(983,'MA18A',1211,'',0,'','Préfecture de Marrakech',1),
	(984,'MA19A',1214,'',0,'','Province de Tan-Tan',1),
	(985,'MA19B',1214,'',0,'','Province de Tan-Tan',1),
	(986,'TN01',1001,'',0,'','Ariana',1),
	(987,'TN02',1001,'',0,'','Béja',1),
	(988,'TN03',1001,'',0,'','Ben Arous',1),
	(989,'TN04',1001,'',0,'','Bizerte',1),
	(990,'TN05',1001,'',0,'','Gabès',1),
	(991,'TN06',1001,'',0,'','Gafsa',1),
	(992,'TN07',1001,'',0,'','Jendouba',1),
	(993,'TN08',1001,'',0,'','Kairouan',1),
	(994,'TN09',1001,'',0,'','Kasserine',1),
	(995,'TN10',1001,'',0,'','Kébili',1),
	(996,'TN11',1001,'',0,'','La Manouba',1),
	(997,'TN12',1001,'',0,'','Le Kef',1),
	(998,'TN13',1001,'',0,'','Mahdia',1),
	(999,'TN14',1001,'',0,'','Médenine',1),
	(1000,'TN15',1001,'',0,'','Monastir',1),
	(1001,'TN16',1001,'',0,'','Nabeul',1),
	(1002,'TN17',1001,'',0,'','Sfax',1),
	(1003,'TN18',1001,'',0,'','Sidi Bouzid',1),
	(1004,'TN19',1001,'',0,'','Siliana',1),
	(1005,'TN20',1001,'',0,'','Sousse',1),
	(1006,'TN21',1001,'',0,'','Tataouine',1),
	(1007,'TN22',1001,'',0,'','Tozeur',1),
	(1008,'TN23',1001,'',0,'','Tunis',1),
	(1009,'TN24',1001,'',0,'','Zaghouan',1);

/*!40000 ALTER TABLE `llx_wynd_departments` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_destination
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_destination`;

CREATE TABLE `llx_wynd_destination` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  KEY `rowid` (`rowid`),
  KEY `rowid_2` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_destination` WRITE;
/*!40000 ALTER TABLE `llx_wynd_destination` DISABLE KEYS */;

INSERT INTO `llx_wynd_destination` (`rowid`, `code`, `label`, `active`)
VALUES
	(1,'onsite','Onsite',1),
	(2,'takeaway','Takeaway',0),
	(3,'drive','Drive',0),
	(4,'delivery','Delivery',0),
	(5,'walk','Walk',1);

/*!40000 ALTER TABLE `llx_wynd_destination` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_destination_entities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_destination_entities`;

CREATE TABLE `llx_wynd_destination_entities` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_entity` int(11) NOT NULL DEFAULT '0',
  `fk_destination` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_entity_destination` (`fk_entity`,`fk_destination`),
  KEY `idx_entity_destination` (`fk_destination`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_wynd_destination_entities` WRITE;
/*!40000 ALTER TABLE `llx_wynd_destination_entities` DISABLE KEYS */;

INSERT INTO `llx_wynd_destination_entities` (`rowid`, `fk_entity`, `fk_destination`)
VALUES
	(2,4,2),
	(5,4,5),
	(1,5,1),
	(3,5,3),
	(4,5,4);

/*!40000 ALTER TABLE `llx_wynd_destination_entities` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_devices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_devices`;

CREATE TABLE `llx_wynd_devices` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL,
  `device_id` varchar(30) NOT NULL,
  `fk_account` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_wynd_devices_device_id_index` (`device_id`),
  KEY `llx_wynd_devices_entity_index` (`entity`),
  KEY `llx_wynd_devices_llx_bank_account_rowid` (`fk_account`),
  CONSTRAINT `llx_wynd_devices_llx_bank_account_rowid` FOREIGN KEY (`fk_account`) REFERENCES `llx_bank_account` (`rowid`),
  CONSTRAINT `llx_wynd_devices_llx_entity_rowid_fk` FOREIGN KEY (`entity`) REFERENCES `llx_entity` (`rowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_discount`;

CREATE TABLE `llx_wynd_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `discount_type` enum('AMOUNT','PERCENT') NOT NULL,
  `condition_type` enum('ABSOLUTE','RELATIVE') NOT NULL,
  `value` double DEFAULT NULL,
  `entity_id` int(11) NOT NULL,
  `condition_time_id` int(11) DEFAULT NULL,
  `min_item_number` int(11) DEFAULT NULL,
  `min_amount` int(11) DEFAULT NULL,
  `basket_impacted` tinyint(1) NOT NULL DEFAULT '0',
  `max_use_per_customer` int(11) DEFAULT NULL,
  `days_before_reset_customer` int(11) DEFAULT NULL,
  `max_use` int(11) DEFAULT NULL,
  `days_before_reset` int(11) DEFAULT NULL,
  `repeatable` tinyint(1) NOT NULL DEFAULT '0',
  `cumulable` tinyint(1) NOT NULL DEFAULT '0',
  `manager_required` tinyint(1) NOT NULL DEFAULT '0',
  `datec` datetime NOT NULL,
  `tms` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_discount_entity_id` (`entity_id`),
  KEY `fk_discount_condition_time_id` (`condition_time_id`),
  CONSTRAINT `fk_discount_condition_time_id` FOREIGN KEY (`condition_time_id`) REFERENCES `llx_wynd_condition_time` (`id`),
  CONSTRAINT `fk_discount_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `llx_entity` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_discount` WRITE;
/*!40000 ALTER TABLE `llx_wynd_discount` DISABLE KEYS */;

INSERT INTO `llx_wynd_discount` (`id`, `label`, `discount_type`, `condition_type`, `value`, `entity_id`, `condition_time_id`, `min_item_number`, `min_amount`, `basket_impacted`, `max_use_per_customer`, `days_before_reset_customer`, `max_use`, `days_before_reset`, `repeatable`, `cumulable`, `manager_required`, `datec`, `tms`)
VALUES
	(1,'cumque','AMOUNT','RELATIVE',68.09,1,1,2,95,1,98,71,4,74,0,0,0,'2017-08-11 17:40:57','2017-08-11 17:40:57'),
	(2,'odio','AMOUNT','RELATIVE',14.9,2,2,2,13,1,70,29,58,89,0,1,1,'2017-08-11 17:40:57','2017-08-11 17:40:57'),
	(3,'id','AMOUNT','ABSOLUTE',23.65,3,3,2,12,1,25,15,66,43,1,0,0,'2017-08-11 17:40:57','2017-08-11 17:40:57'),
	(4,'numquam','PERCENT','ABSOLUTE',57.73,4,4,2,51,1,81,95,23,38,1,0,0,'2017-08-11 17:40:57','2017-08-11 17:40:57'),
	(5,'dicta','AMOUNT','RELATIVE',18.04,5,5,2,68,0,57,63,96,34,1,0,1,'2017-08-11 17:40:57','2017-08-11 17:40:57');

/*!40000 ALTER TABLE `llx_wynd_discount` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_discount_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_discount_channels`;

CREATE TABLE `llx_wynd_discount_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_condition_channels_channel_id` (`channel_id`),
  KEY `fk_condition_channels_discount_id` (`discount_id`),
  CONSTRAINT `fk_condition_channels_channel_id` FOREIGN KEY (`channel_id`) REFERENCES `llx_wynd_channel` (`rowid`),
  CONSTRAINT `fk_condition_channels_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `llx_wynd_discount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_discount_channels` WRITE;
/*!40000 ALTER TABLE `llx_wynd_discount_channels` DISABLE KEYS */;

INSERT INTO `llx_wynd_discount_channels` (`id`, `channel_id`, `discount_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,1,2),
	(4,2,2),
	(5,1,3),
	(6,2,3),
	(7,1,4),
	(8,2,4),
	(9,1,5),
	(10,2,5);

/*!40000 ALTER TABLE `llx_wynd_discount_channels` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_discount_cohorts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_discount_cohorts`;

CREATE TABLE `llx_wynd_discount_cohorts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cohort_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_condition_cohorts_cohort_id` (`cohort_id`),
  KEY `fk_condition_cohorts_discount_id` (`discount_id`),
  CONSTRAINT `fk_condition_cohorts_cohort_id` FOREIGN KEY (`cohort_id`) REFERENCES `llx_wynd_cohort` (`id`),
  CONSTRAINT `fk_condition_cohorts_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `llx_wynd_discount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_discount_cohorts` WRITE;
/*!40000 ALTER TABLE `llx_wynd_discount_cohorts` DISABLE KEYS */;

INSERT INTO `llx_wynd_discount_cohorts` (`id`, `cohort_id`, `discount_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,1,2),
	(4,2,2),
	(5,1,3),
	(6,2,3),
	(7,1,4),
	(8,2,4),
	(9,1,5),
	(10,2,5);

/*!40000 ALTER TABLE `llx_wynd_discount_cohorts` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_discount_destinations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_discount_destinations`;

CREATE TABLE `llx_wynd_discount_destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_condition_destinations_destination_id` (`destination_id`),
  KEY `fk_condition_destinations_discount_id` (`discount_id`),
  CONSTRAINT `fk_condition_destinations_destination_id` FOREIGN KEY (`destination_id`) REFERENCES `llx_wynd_destination` (`rowid`),
  CONSTRAINT `fk_condition_destinations_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `llx_wynd_discount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_discount_destinations` WRITE;
/*!40000 ALTER TABLE `llx_wynd_discount_destinations` DISABLE KEYS */;

INSERT INTO `llx_wynd_discount_destinations` (`id`, `destination_id`, `discount_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,1,2),
	(4,2,2),
	(5,1,3),
	(6,2,3),
	(7,1,4),
	(8,2,4),
	(9,1,5),
	(10,2,5);

/*!40000 ALTER TABLE `llx_wynd_discount_destinations` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_discount_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_discount_order`;

CREATE TABLE `llx_wynd_discount_order` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL DEFAULT '0',
  `attributes` longtext COMMENT '(DC2Type:array)',
  `fk_order` int(11) NOT NULL,
  `fk_discount` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_wynd_discount_order_llx_commande_rowid_fk` (`fk_order`),
  KEY `llx_wynd_discount_order_llx_wynd_discount_id_fk` (`fk_discount`),
  CONSTRAINT `llx_wynd_discount_order_llx_commande_rowid_fk` FOREIGN KEY (`fk_order`) REFERENCES `llx_commande` (`rowid`),
  CONSTRAINT `llx_wynd_discount_order_llx_wynd_discount_id_fk` FOREIGN KEY (`fk_discount`) REFERENCES `llx_wynd_discount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_discount_order` WRITE;
/*!40000 ALTER TABLE `llx_wynd_discount_order` DISABLE KEYS */;

INSERT INTO `llx_wynd_discount_order` (`rowid`, `amount`, `attributes`, `fk_order`, `fk_discount`)
VALUES
	(1,84,'N;',1,1),
	(2,45,'N;',2,3),
	(3,52,'N;',3,4),
	(4,71,'N;',4,2),
	(5,66,'N;',5,4);

/*!40000 ALTER TABLE `llx_wynd_discount_order` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_element_button_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_element_button_config`;

CREATE TABLE `llx_wynd_element_button_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `element_type` enum('product','category','payment','discount','association','payment_method_config') NOT NULL,
  `position` int(3) DEFAULT '1',
  `height` int(2) DEFAULT '1',
  `width` int(2) DEFAULT '1',
  `background` varchar(7) DEFAULT '#999',
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(7) DEFAULT '#999',
  PRIMARY KEY (`id`),
  UNIQUE KEY `llx_wynd_element_button_config_id_uindex` (`id`),
  KEY `llx_wynd_element_button_config_llx_entity_rowid_fk` (`entity`),
  CONSTRAINT `llx_wynd_element_button_config_llx_entity_rowid_fk` FOREIGN KEY (`entity`) REFERENCES `llx_entity` (`rowid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_wynd_element_button_config` WRITE;
/*!40000 ALTER TABLE `llx_wynd_element_button_config` DISABLE KEYS */;

INSERT INTO `llx_wynd_element_button_config` (`id`, `entity`, `fk_element`, `element_type`, `position`, `height`, `width`, `background`, `icon`, `color`)
VALUES
	(1,5,10,'product',10,229,249,'#70ff97','http://lorempixel.com/32/32/?49380','#6cd937'),
	(2,1,9,'product',9,124,103,'#3f40a5','http://lorempixel.com/32/32/?76808','#9afddc'),
	(3,2,7,'product',3,144,190,'#1b31c2','http://lorempixel.com/32/32/?84987','#069746'),
	(4,1,9,'product',17,179,187,'#e06efb','http://lorempixel.com/32/32/?87555','#bf1e24'),
	(5,1,2,'product',8,135,196,'#a17a2e','http://lorempixel.com/32/32/?81153','#d14bf8'),
	(6,1,9,'association',16,207,248,'#4c9a6a','http://lorempixel.com/32/32/?73216','#51807f'),
	(7,1,2,'association',18,167,170,'#ed9975','http://lorempixel.com/32/32/?25665','#183da1'),
	(8,5,10,'association',19,111,153,'#58f26b','http://lorempixel.com/32/32/?19791','#275370'),
	(9,4,6,'association',9,113,229,'#698128','http://lorempixel.com/32/32/?87195','#6dffa8'),
	(10,1,6,'association',2,109,174,'#d501f3','http://lorempixel.com/32/32/?55175','#9aa87a'),
	(11,1,5,'category',10,169,165,'#f70bed','http://lorempixel.com/32/32/?57436','#93da73'),
	(12,1,4,'category',16,186,147,'#cd7af4','http://lorempixel.com/32/32/?41638','#8860e8'),
	(13,1,2,'category',1,145,114,'#462cbd','http://lorempixel.com/32/32/?15469','#f35d94'),
	(14,5,5,'category',3,163,221,'#5189cb','http://lorempixel.com/32/32/?80775','#7f6c19'),
	(15,3,3,'category',6,249,204,'#32da92','http://lorempixel.com/32/32/?84685','#30c52e'),
	(16,1,6,'',9,119,193,'#7a877c','http://lorempixel.com/32/32/?83219','#748cb4'),
	(17,4,1,'',14,232,232,'#82b7be','http://lorempixel.com/32/32/?50222','#b1011f'),
	(18,4,6,'',10,187,159,'#4bde6f','http://lorempixel.com/32/32/?96771','#1b8480'),
	(19,4,2,'',2,147,128,'#3451e2','http://lorempixel.com/32/32/?16800','#bb1de7'),
	(20,5,7,'',15,141,179,'#c990d4','http://lorempixel.com/32/32/?95669','#aec832'),
	(21,3,5,'discount',1,241,111,'#53981d','http://lorempixel.com/32/32/?59752','#bf54dc'),
	(22,2,5,'discount',18,207,139,'#acf819','http://lorempixel.com/32/32/?75687','#d4d745'),
	(23,5,2,'discount',4,228,228,'#48d126','http://lorempixel.com/32/32/?70508','#99b9ff'),
	(24,2,4,'discount',15,187,244,'#5cd9a5','http://lorempixel.com/32/32/?18524','#25e0bb'),
	(25,5,2,'discount',10,132,226,'#03bf9e','http://lorempixel.com/32/32/?89784','#c5203f');

/*!40000 ALTER TABLE `llx_wynd_element_button_config` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_element_channel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_element_channel`;

CREATE TABLE `llx_wynd_element_channel` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_element` int(11) DEFAULT NULL,
  `element_type` varchar(50) DEFAULT NULL,
  `fk_channel` int(11) NOT NULL DEFAULT '0',
  `entity` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `rowid_3` (`rowid`),
  KEY `rowid` (`rowid`),
  KEY `rowid_2` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_element_channel` WRITE;
/*!40000 ALTER TABLE `llx_wynd_element_channel` DISABLE KEYS */;

INSERT INTO `llx_wynd_element_channel` (`rowid`, `fk_element`, `element_type`, `fk_channel`, `entity`)
VALUES
	(1,1,'category',3,1),
	(2,2,'category',3,2),
	(3,3,'category',3,3),
	(4,4,'category',3,4),
	(5,5,'category',2,5),
	(6,1,'product',1,2),
	(7,2,'product',1,2),
	(8,3,'product',1,2),
	(9,4,'product',1,2),
	(10,5,'product',1,2),
	(11,6,'product',2,3),
	(12,7,'product',2,3),
	(13,8,'product',2,3),
	(14,9,'product',2,3),
	(15,10,'product',2,3);

/*!40000 ALTER TABLE `llx_wynd_element_channel` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_element_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_element_config`;

CREATE TABLE `llx_wynd_element_config` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_element` int(11) NOT NULL DEFAULT '0',
  `element_type` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '0',
  `position` int(2) NOT NULL DEFAULT '1',
  `width` int(1) NOT NULL DEFAULT '1',
  `height` int(1) NOT NULL DEFAULT '1',
  `background` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(7) DEFAULT '#999',
  `required` int(1) NOT NULL DEFAULT '0',
  `min` int(2) NOT NULL DEFAULT '0',
  `max` int(2) NOT NULL DEFAULT '0',
  `is_default` int(1) NOT NULL DEFAULT '0',
  `payable` int(1) NOT NULL DEFAULT '0',
  `price_quantity` float(10,6) DEFAULT NULL,
  `price_extra` float(10,6) DEFAULT NULL,
  `is_printable` int(1) NOT NULL DEFAULT '0',
  `payment_type` varchar(20) NOT NULL DEFAULT 'popup',
  `manager_required` int(1) NOT NULL DEFAULT '0',
  `amount_min` float(10,6) NOT NULL DEFAULT '0.000000',
  `amount_max` float(10,6) NOT NULL DEFAULT '0.000000',
  `default_total` int(1) NOT NULL DEFAULT '0',
  `total_override` int(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `rowid` (`rowid`) USING BTREE,
  KEY `Index 1` (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

LOCK TABLES `llx_wynd_element_config` WRITE;
/*!40000 ALTER TABLE `llx_wynd_element_config` DISABLE KEYS */;

INSERT INTO `llx_wynd_element_config` (`rowid`, `fk_element`, `element_type`, `entity`, `position`, `width`, `height`, `background`, `icon`, `color`, `required`, `min`, `max`, `is_default`, `payable`, `price_quantity`, `price_extra`, `is_printable`, `payment_type`, `manager_required`, `amount_min`, `amount_max`, `default_total`, `total_override`)
VALUES
	(37,275,'product',1,3,2,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(38,280,'product',1,5,2,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(39,281,'product',1,7,2,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(40,270,'product',1,9,2,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(41,271,'product',1,11,2,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(42,144,'product',1,1,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(43,184,'product',1,2,1,2,'','','#8080c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(44,183,'product',1,14,1,2,'','','#8080c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(45,276,'product',1,37,2,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(46,268,'product',1,27,2,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(47,163,'product',1,17,2,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(48,308,'product',1,1,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(49,311,'product',1,1,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(50,312,'product',1,1,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(51,56,'product',1,1,1,1,'','','#7f7f7f',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(52,290,'product',1,11,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(53,289,'product',1,9,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(54,302,'product',1,7,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(55,301,'product',1,5,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(56,296,'product',1,3,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(57,287,'product',1,27,2,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(58,297,'product',1,37,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(59,321,'product',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(60,326,'product',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(61,323,'product',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(62,322,'product',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(63,338,'product',1,6,2,2,'','','#c0c0c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(64,335,'product',1,14,2,2,'','','#c0c0c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(65,336,'product',1,22,2,2,'','','#c0c0c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(66,337,'product',1,30,2,2,'','','#c0c0c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(67,262,'product',1,20,1,1,'','','#33a670',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(68,194,'product',1,26,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(69,344,'product',1,29,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(70,350,'product',1,35,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(71,352,'product',1,37,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(72,349,'product',1,34,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(73,348,'product',1,33,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(74,347,'product',1,32,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(75,345,'product',1,30,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(76,351,'product',1,36,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(77,346,'product',1,31,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(78,355,'product',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(79,356,'product',1,2,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(80,328,'product',1,19,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(81,340,'product',1,17,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(82,357,'product',1,3,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(83,358,'product',1,5,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(84,359,'product',1,6,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(85,360,'product',1,7,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(86,361,'product',1,13,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(87,406,'product',1,2,1,2,'','','#8080c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(88,405,'product',1,14,1,2,'','','#8080c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(89,429,'product',1,14,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(90,430,'product',1,15,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(91,412,'product',1,2,1,2,'','','#8080c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(92,411,'product',1,14,1,2,'','','#8080c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(93,315,'product',1,1,1,1,'','','#00ff00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(94,432,'product',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(95,433,'product',1,10,2,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(96,434,'product',1,22,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(97,435,'product',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(98,437,'product',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(99,554,'product',1,39,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(100,597,'product',1,26,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(101,576,'product',1,3,1,2,'','','#ff80c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(102,574,'product',1,11,1,2,'','','#ff80c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(103,606,'product',1,33,1,2,'','','#ff0080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(104,616,'product',1,26,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(105,13595,'product',1,1,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(106,13596,'product',1,9,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(107,13597,'product',1,17,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(108,13598,'product',1,11,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(109,13599,'product',1,3,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(110,13600,'product',1,33,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(111,13601,'product',1,35,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(112,13602,'product',1,19,2,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(113,13603,'product',1,25,2,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(114,13604,'product',1,9,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(115,13605,'product',1,1,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(116,13606,'product',1,17,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(117,13607,'product',1,25,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(118,13608,'product',1,18,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(119,13609,'product',1,10,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(120,13610,'product',1,2,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(121,13611,'product',1,3,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(122,13612,'product',1,11,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(123,13613,'product',1,19,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(124,13614,'product',1,4,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(125,13615,'product',1,12,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(126,13616,'product',1,20,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(127,13617,'product',1,20,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(128,13618,'product',1,27,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(129,13619,'product',1,26,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(130,13620,'product',1,3,1,2,'','','#33a670',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(131,13621,'product',1,1,1,2,'','','#ff0080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(132,13622,'product',1,13,1,2,'','','#ff0080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(133,13623,'product',1,14,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(134,13624,'product',1,2,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(135,13625,'product',1,27,1,2,'','','#00cc00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(136,13626,'product',1,26,1,2,'','','#00cc00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(137,13627,'product',1,25,1,2,'','','#00cc00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(138,13628,'product',1,1,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(139,13629,'product',1,9,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(140,13630,'product',1,17,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(141,13631,'product',1,2,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(142,13632,'product',1,4,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(143,13633,'product',1,12,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(144,13634,'product',1,33,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(145,13635,'product',1,3,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(146,13636,'product',1,11,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(147,13637,'product',1,11,1,2,'','','#ff80c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(148,13638,'product',1,3,1,2,'','','#ff80c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(149,13639,'product',1,17,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(150,13640,'product',1,9,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(151,13641,'product',1,25,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(152,13642,'product',1,10,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(153,13643,'product',1,18,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(154,13644,'product',1,11,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(155,13645,'product',1,33,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(156,13646,'product',1,34,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(157,13647,'product',1,28,1,2,'','','#00cc00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(158,13648,'product',1,20,1,2,'','','#00cc00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(159,13649,'product',1,12,1,2,'','','#00cc00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(160,13650,'product',1,3,2,2,'','','#f3dc0c',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(161,13651,'product',1,1,2,2,'','','#f3dc0c',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(162,13652,'product',1,26,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(163,13653,'product',1,16,1,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(164,13654,'product',1,12,1,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(165,13655,'product',1,4,1,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(166,13656,'product',1,25,2,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(167,13657,'product',1,30,1,1,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(168,13658,'product',1,29,1,1,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(169,13659,'product',1,34,1,1,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(170,13660,'product',1,33,1,1,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(171,13661,'product',1,38,1,1,'','','#dbdb00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(172,13662,'product',1,37,1,1,'','','#dddd00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(173,13663,'product',1,2,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(174,13664,'product',1,6,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(175,13665,'product',1,14,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(176,13666,'product',1,18,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(177,13667,'product',1,10,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(178,13668,'product',1,22,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(179,13669,'product',1,1,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(180,13670,'product',1,5,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(181,13671,'product',1,13,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(182,13672,'product',1,17,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(183,13673,'product',1,9,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(184,13674,'product',1,21,1,1,'','','#0000a0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(185,13675,'product',1,13,1,2,'','','#804000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(186,13676,'product',1,5,1,2,'','','#804000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(187,13677,'product',1,2,1,2,'','','#804000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(188,13678,'product',1,10,1,2,'','','#804000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(189,13679,'product',1,18,1,2,'','','#804000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(190,13680,'product',1,3,1,2,'','','#804000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(191,13681,'product',1,19,1,2,'','','#804000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(192,13682,'product',1,11,1,2,'','','#804000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(193,13683,'product',1,4,1,2,'','','#2894ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(194,13684,'product',1,20,1,2,'','','#2894ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(195,13685,'product',1,12,1,2,'','','#2894ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(196,13686,'product',1,26,2,1,'','','#dd6f00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(197,13687,'product',1,33,2,2,'','','#400080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(198,13688,'product',1,35,2,2,'','','#400080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(199,13689,'product',1,33,1,1,'','','#b75b00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(200,13690,'product',1,37,1,1,'','','#b75b00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(201,13691,'product',1,1,1,1,'','','#b75b00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(202,13692,'product',1,13,1,1,'','','#b75b00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(203,13693,'product',1,5,1,1,'','','#b75b00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(204,13694,'product',1,25,1,1,'','','#b75b00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(205,13695,'product',1,9,1,1,'','','#b75b00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(206,13696,'product',1,29,1,1,'','','#b75b00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(207,13697,'product',1,30,1,1,'','','#71c1b8',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(208,13698,'product',1,26,1,1,'','','#71c1b8',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(209,13699,'product',1,38,1,1,'','','#71c1b8',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(210,13700,'product',1,34,1,1,'','','#71c1b8',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(211,13701,'product',1,6,1,1,'','','#71c1b8',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(212,13702,'product',1,2,1,1,'','','#71c1b8',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(213,13703,'product',1,14,1,1,'','','#71c1b8',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(214,13704,'product',1,10,1,1,'','','#71c1b8',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(215,13705,'product',1,23,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(216,13706,'product',1,40,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(217,13707,'product',1,32,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(218,13708,'product',1,36,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(219,13709,'product',1,7,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(220,13710,'product',1,3,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(221,13711,'product',1,15,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(222,13712,'product',1,35,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(223,13713,'product',1,39,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(224,13714,'product',1,31,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(225,13715,'product',1,8,1,1,'','','#33a670',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(226,13716,'product',1,4,1,1,'','','#33a670',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(227,13717,'product',1,16,1,1,'','','#33a670',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(228,13718,'product',1,12,1,1,'','','#33a670',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(229,13719,'product',1,11,1,1,'','','#db2497',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(230,13720,'product',1,1,1,1,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(231,13721,'product',1,1,1,1,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(232,13722,'product',1,1,1,1,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(233,13723,'product',1,1,1,1,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(234,13724,'product',1,9,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(235,13725,'product',1,1,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(236,13726,'product',1,17,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(237,13727,'product',1,25,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(238,13728,'product',1,18,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(239,13729,'product',1,10,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(240,13730,'product',1,2,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(241,13731,'product',1,3,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(242,13732,'product',1,11,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(243,13733,'product',1,19,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(244,13734,'product',1,33,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(245,13735,'product',1,34,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(246,13736,'product',1,35,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(247,13737,'product',1,27,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(248,13738,'product',1,26,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(249,13739,'product',1,9,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(250,13740,'product',1,1,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(251,13741,'product',1,17,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(252,13742,'product',1,25,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(253,13743,'product',1,18,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(254,13744,'product',1,10,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(255,13745,'product',1,2,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(256,13746,'product',1,3,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(257,13747,'product',1,11,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(258,13748,'product',1,19,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(259,13749,'product',1,33,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(260,13750,'product',1,34,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(261,13751,'product',1,35,1,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(262,13752,'product',1,27,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(263,13753,'product',1,26,1,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(264,13754,'product',1,5,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(265,13755,'product',1,20,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(266,13756,'product',1,12,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(267,13757,'product',1,16,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(268,13758,'product',1,7,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(269,13759,'product',1,3,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(270,13760,'product',1,11,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(271,13761,'product',1,15,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(272,13762,'product',1,31,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(273,13763,'product',1,27,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(274,13764,'product',1,23,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(275,13765,'product',1,32,1,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(276,13766,'product',1,36,1,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(277,13767,'product',1,40,1,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(278,13768,'product',1,1,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(279,13769,'product',1,9,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(280,13770,'product',1,13,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(281,13771,'product',1,29,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(282,13772,'product',1,21,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(283,13773,'product',1,25,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(284,13774,'product',1,10,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(285,13775,'product',1,14,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(286,13776,'product',1,18,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(287,13777,'product',1,30,1,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(288,13778,'product',1,38,1,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(289,13779,'product',1,34,1,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(290,13780,'product',1,24,1,1,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(291,13781,'product',1,22,1,1,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(292,13782,'product',1,19,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(293,13783,'product',1,17,1,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(294,13784,'product',1,14,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(295,13785,'product',1,6,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(296,13786,'product',1,30,2,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(297,13787,'product',1,22,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(298,13788,'product',1,1,1,2,'','','#ff0080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(299,13789,'product',1,13,1,2,'','','#ff0080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(300,13790,'product',1,14,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(301,13791,'product',1,2,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(302,13792,'product',1,1,1,2,'','','#ff0080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(303,13793,'product',1,13,1,2,'','','#ff0080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(304,13794,'product',1,14,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(305,13795,'product',1,2,1,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(306,13796,'product',1,14,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(307,13797,'product',1,6,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(308,13798,'product',1,22,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(309,13799,'product',1,30,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(310,13800,'product',1,1,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(311,13801,'product',1,9,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(312,13802,'product',1,17,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(313,13803,'product',1,11,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(314,13804,'product',1,3,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(315,13805,'product',1,19,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(316,13806,'product',1,33,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(317,13807,'product',1,35,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(318,13808,'product',1,19,2,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(319,13809,'product',1,25,2,2,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(320,13810,'product',1,1,1,1,'','','#ff0080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(321,13812,'product',1,27,2,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(322,13813,'product',1,31,2,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(323,13814,'product',1,11,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(324,13815,'product',1,25,2,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(325,13816,'product',1,29,2,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(326,13817,'product',1,7,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(327,13818,'product',1,3,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(328,13819,'product',1,1,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(329,13820,'product',1,5,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(330,13821,'product',1,15,2,1,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(331,13822,'product',1,13,2,1,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(332,13823,'product',1,1,2,2,'','','#400080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(333,13824,'product',1,3,2,2,'','','#400080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(334,13825,'product',1,21,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(335,13826,'product',1,25,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(336,13827,'product',1,11,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(337,13828,'product',1,15,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(338,13829,'product',1,19,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(339,13830,'product',1,31,2,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(340,13831,'product',1,39,2,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(341,13832,'product',1,35,2,1,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(342,13833,'product',1,29,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(343,13834,'product',1,13,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(344,13835,'product',1,9,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(345,13836,'product',1,1,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(346,13837,'product',1,5,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(347,13838,'product',1,23,2,1,'','','#8080ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(348,13839,'product',1,17,2,1,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(349,13840,'product',1,14,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(350,13841,'product',1,6,2,2,'','','#408080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(351,13842,'product',1,22,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(352,13843,'product',1,30,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(353,13844,'product',1,17,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(354,13845,'product',1,9,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(355,13846,'product',1,25,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(356,13847,'product',1,10,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(357,13848,'product',1,18,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(358,13849,'product',1,11,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(359,13850,'product',1,33,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(360,13851,'product',1,34,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(361,13852,'product',1,28,1,2,'','','#00cc00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(362,13853,'product',1,20,1,2,'','','#00cc00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(363,13854,'product',1,12,1,2,'','','#00cc00',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(364,13855,'product',1,36,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(365,13856,'product',1,26,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(366,28,'association',1,18,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(367,85,'association',1,18,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(368,116,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(369,117,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(370,118,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(371,119,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(372,120,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(373,121,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(374,122,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(375,123,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(376,165,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(377,166,'association',1,3,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(378,167,'association',1,4,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(379,168,'association',1,2,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(380,169,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(381,170,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(382,171,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(383,172,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(384,429,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(385,430,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(386,431,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(387,447,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(388,448,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(389,449,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(390,458,'association',1,18,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(391,578,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(392,581,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(393,582,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(394,660,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(395,661,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(396,662,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(397,663,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(398,665,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(399,686,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(400,687,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(401,881,'association',1,3,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(402,882,'association',1,17,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(403,883,'association',1,19,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(404,880,'association',1,1,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(405,19320,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(406,19321,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(407,19322,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(408,19323,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(409,19324,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(410,19325,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(411,19326,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(412,19327,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(413,19328,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(414,19329,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(415,19330,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(416,19331,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(417,19332,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(418,19333,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(419,19334,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(420,19335,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(421,19336,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(422,19337,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(423,19338,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(424,19339,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(425,19340,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(426,19341,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(427,19342,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(428,19343,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(429,19344,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(430,19345,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(431,19346,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(432,19347,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(433,19348,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(434,19349,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(435,19350,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(436,19351,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(437,19352,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(438,19353,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(439,19354,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(440,19355,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(441,19356,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(442,19357,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(443,19358,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(444,19359,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(445,19360,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(446,19361,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(447,19362,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(448,19363,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(449,19364,'association',1,2,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(450,19365,'association',1,3,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(451,19366,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(452,19367,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(453,19368,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(454,19369,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(455,19370,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(456,19371,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(457,19372,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(458,19373,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(459,19374,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(460,19375,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(461,19376,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(462,19377,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(463,19378,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(464,19379,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(465,19380,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(466,19381,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(467,19382,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(468,19383,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(469,19384,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(470,19385,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(471,19386,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(472,19387,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(473,19388,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(474,19389,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(475,19390,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(476,19391,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(477,19392,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(478,19393,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(479,19394,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(480,19395,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(481,19396,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(482,19397,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(483,19398,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(484,19399,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(485,19400,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(486,19401,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(487,19402,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(488,19403,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(489,19404,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(490,19405,'association',1,1,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(491,19406,'association',1,2,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(492,19407,'association',1,3,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(493,19408,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(494,19409,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(495,19410,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(496,19411,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(497,19412,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(498,19413,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(499,19414,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(500,19415,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(501,19416,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(502,19417,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(503,19418,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(504,19419,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(505,19420,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(506,19421,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(507,19422,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(508,19423,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(509,19424,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(510,19425,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(511,19426,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(512,19427,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(513,19428,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(514,19429,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(515,19430,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(516,19431,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(517,19432,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(518,19433,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(519,19434,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(520,19435,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(521,19436,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(522,19437,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(523,19438,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(524,19439,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(525,19440,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(526,19441,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(527,19442,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(528,19443,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(529,19444,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(530,19445,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(531,19446,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(532,19447,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(533,19448,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(534,19449,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(535,19450,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(536,19451,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(537,19452,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(538,19453,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(539,19454,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(540,19455,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(541,19456,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(542,19457,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(543,19458,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(544,19459,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(545,19460,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(546,19461,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(547,19462,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(548,19463,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(549,19464,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(550,19465,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(551,19466,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(552,19467,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(553,19468,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(554,19469,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(555,19470,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(556,19471,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(557,19472,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(558,19473,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(559,19474,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(560,19475,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(561,19476,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(562,19477,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(563,19478,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(564,19479,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(565,19480,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(566,19481,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(567,19482,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(568,19483,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(569,19484,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(570,19485,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(571,19486,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(572,19487,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(573,19488,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(574,19489,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(575,19490,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(576,19491,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(577,19492,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(578,19493,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(579,19494,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(580,19495,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(581,19496,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(582,19497,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(583,19498,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(584,19499,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(585,19500,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(586,19501,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(587,19502,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(588,19503,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(589,19504,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(590,19505,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(591,19506,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(592,19507,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(593,19508,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(594,19509,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(595,19510,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(596,19511,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(597,19512,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(598,19513,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(599,19514,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(600,19515,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(601,19516,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(602,19517,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(603,19518,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(604,19519,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(605,19520,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(606,19521,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(607,19522,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(608,19523,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(609,19524,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(610,19525,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(611,19526,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(612,19527,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(613,19528,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(614,19529,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(615,19530,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(616,19531,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(617,19532,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(618,19533,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(619,19534,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(620,19535,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(621,19536,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(622,19537,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(623,19538,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(624,19539,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(625,19540,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(626,19541,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(627,19542,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(628,19543,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(629,19544,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(630,19545,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(631,19546,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(632,19547,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(633,19548,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(634,19549,'association',1,28,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(635,19550,'association',1,25,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(636,19551,'association',1,26,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(637,19552,'association',1,27,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(638,19553,'association',1,1,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(639,19554,'association',1,2,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(640,19555,'association',1,13,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(641,19556,'association',1,14,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(642,19557,'association',1,3,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(643,19558,'association',1,15,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(644,19559,'association',1,28,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(645,19560,'association',1,25,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(646,19561,'association',1,26,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(647,19562,'association',1,27,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(648,19563,'association',1,1,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(649,19564,'association',1,2,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(650,19565,'association',1,13,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(651,19566,'association',1,14,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(652,19567,'association',1,3,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(653,19568,'association',1,15,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(654,19569,'association',1,3,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(655,19570,'association',1,1,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(656,19571,'association',1,9,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(657,19572,'association',1,1,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(658,19573,'association',1,17,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(659,19574,'association',1,2,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(660,19575,'association',1,10,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(661,19576,'association',1,3,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(662,19577,'association',1,25,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(663,19578,'association',1,26,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(664,19579,'association',1,35,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(665,19580,'association',1,18,1,2,'','','#b9b900',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(666,19581,'association',1,9,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(667,19582,'association',1,1,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(668,19583,'association',1,17,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(669,19584,'association',1,2,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(670,19585,'association',1,10,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(671,19586,'association',1,3,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(672,19587,'association',1,25,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(673,19588,'association',1,26,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(674,19589,'association',1,35,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(675,19590,'association',1,18,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(676,19593,'association',1,17,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(677,19594,'association',1,3,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(678,19595,'association',1,1,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(679,19596,'association',1,19,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(680,19597,'association',1,33,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(681,19598,'association',1,25,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(682,19599,'association',1,27,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(683,19600,'association',1,26,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(684,19601,'association',1,34,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(685,19602,'association',1,1,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(686,19603,'association',1,14,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(687,19604,'association',1,2,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(688,19605,'association',1,13,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(689,19606,'association',1,3,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(690,19607,'association',1,15,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(691,19608,'association',1,3,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(692,19609,'association',1,1,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(693,19610,'association',1,4,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(694,19611,'association',1,2,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(695,19612,'association',1,3,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(696,19613,'association',1,1,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(697,19614,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(698,19615,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(699,19616,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(700,19617,'association',1,1,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(701,19618,'association',1,14,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(702,19619,'association',1,2,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(703,19620,'association',1,13,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(704,19621,'association',1,3,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(705,19622,'association',1,15,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(706,19623,'association',1,1,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(707,19624,'association',1,2,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(708,19625,'association',1,6,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(709,19626,'association',1,4,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(710,19627,'association',1,3,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(711,19628,'association',1,5,1,1,'','','',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(712,19629,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(713,19630,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(714,19631,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(715,19632,'association',1,1,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(716,19633,'association',1,3,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(717,19634,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(718,19635,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(719,19636,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(720,19637,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(721,19638,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(722,19639,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(723,19640,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(724,19641,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(725,19642,'association',1,9,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(726,19643,'association',1,1,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(727,19644,'association',1,17,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(728,19645,'association',1,2,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(729,19646,'association',1,10,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(730,19647,'association',1,3,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(731,19648,'association',1,25,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(732,19649,'association',1,26,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(733,19650,'association',1,35,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(734,19651,'association',1,18,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(735,19652,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(736,19653,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(737,19654,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(738,19655,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(739,19656,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(740,19657,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(741,19658,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(742,19659,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(743,19660,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(744,19661,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(745,19662,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(746,19663,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(747,19664,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(748,19665,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(749,19666,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(750,19667,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(751,19668,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(752,19669,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(753,19670,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(754,19671,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(755,19672,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(756,19673,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(757,19674,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(758,19675,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(759,19676,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(760,19677,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(761,19678,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(762,19679,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(763,19680,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(764,19682,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(765,19683,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(766,19684,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(767,19685,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(768,19686,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(769,19687,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(770,19688,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(771,19689,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(772,19690,'association',1,3,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(773,19691,'association',1,1,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(774,19692,'association',1,4,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(775,19693,'association',1,2,1,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(776,19694,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(777,19695,'association',1,26,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(778,19696,'association',1,7,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(779,19697,'association',1,31,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(780,19698,'association',1,15,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(781,19699,'association',1,10,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(782,19700,'association',1,23,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(783,19701,'association',1,18,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(784,19702,'association',1,22,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(785,19703,'association',1,14,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(786,19704,'association',1,11,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(787,19705,'association',1,27,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(788,19706,'association',1,19,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(789,19707,'association',1,3,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(790,19708,'association',1,11,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(791,19709,'association',1,19,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(792,19710,'association',1,2,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(793,19711,'association',1,18,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(794,19712,'association',1,10,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(795,19713,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(796,19714,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(797,19715,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(798,19716,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(799,19717,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(800,19718,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(801,19719,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(802,19720,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(803,19721,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(804,19722,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(805,19723,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(806,19724,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(807,19725,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(808,19726,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(809,19727,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(810,19728,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(811,19729,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(812,19730,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(813,19731,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(814,19732,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(815,19733,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(816,19734,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(817,19735,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(818,19736,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(819,19737,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(820,19738,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(821,19739,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(822,19740,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(823,19741,'association',1,1,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(824,19742,'association',1,9,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(825,19743,'association',1,17,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(826,19744,'association',1,25,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(827,19745,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(828,19746,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(829,19747,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(830,19750,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(831,19751,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(832,19752,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(833,19753,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(834,19756,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(835,19759,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(836,19762,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(837,19763,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(838,19764,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(839,19765,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(840,19768,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(841,19771,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(842,19774,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(843,19780,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(844,19786,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(845,19789,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(846,19792,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(847,19795,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(848,19798,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(849,19804,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(850,19810,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(851,19813,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(852,19815,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(853,19816,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(854,19819,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(855,19822,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(856,19825,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(857,19826,'association',1,22,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(858,19827,'association',1,14,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(859,19828,'association',1,11,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(860,19829,'association',1,27,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(861,19830,'association',1,19,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(862,19831,'association',1,11,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(863,19832,'association',1,3,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(864,19833,'association',1,19,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(865,19834,'association',1,2,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(866,19835,'association',1,18,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(867,19836,'association',1,10,1,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(868,19837,'association',1,3,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(869,19838,'association',1,1,2,2,'','','#808080',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(870,19839,'association',1,17,2,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(871,19840,'association',1,3,2,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(872,19841,'association',1,1,2,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(873,19842,'association',1,19,2,2,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(874,19844,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(875,19845,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(876,19846,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(877,19847,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(878,19848,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(879,19849,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(880,19850,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(881,19851,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(882,19852,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(883,19853,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(884,19854,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(885,19855,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(886,19856,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(887,19857,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(888,19858,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(889,19859,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(890,19860,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(891,19861,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(892,19862,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(893,19863,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(894,19864,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(895,19865,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(896,19866,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(897,19867,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(898,19868,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(899,19869,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(900,19870,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(901,19871,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(902,19872,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(903,19873,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(904,19874,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(905,19875,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(906,19876,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(907,19877,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(908,19878,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(909,19879,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(910,19880,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(911,19881,'association',1,6,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(912,19882,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(913,19883,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(914,19884,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(915,19885,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(916,19886,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(917,19887,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(918,19888,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(919,9,'payment',1,1,1,2,'layout/Default/images/billet_5.png','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(920,10,'payment',1,2,1,2,'layout/Default/images/billet_10.png','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(921,11,'payment',1,3,1,2,'layout/Default/images/billet_20.png','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(922,12,'payment',1,4,1,2,'layout/Default/images/billet_50.png','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(923,1,'payment',1,9,2,2,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(924,2,'payment',1,11,2,2,'','','#c0c0c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(925,4,'payment',1,25,1,2,'','','#ffffff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(926,51,'payment',1,17,2,2,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(927,50,'payment',1,26,1,2,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(928,65,'payment',1,33,1,2,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(929,5,'payment',1,34,1,2,'','','#c0c0c0',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(930,66,'payment',1,19,2,2,'','','#ff8000',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(931,1,'discount',1,1,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(932,2,'discount',1,2,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(933,3,'discount',1,3,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(934,4,'discount',1,4,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(935,5,'discount',1,5,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(936,6,'discount',1,6,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(937,7,'discount',1,7,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(938,8,'discount',1,8,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(939,9,'discount',1,9,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(940,10,'discount',1,10,1,1,'','','#999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(941,67,'payment',1,27,2,2,'','','#ff00ff',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(942,13857,'product',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(946,19889,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(947,19890,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(948,19891,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(949,19892,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(950,19893,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(951,19894,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(952,19895,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(953,19896,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(954,19897,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(955,19898,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(956,19899,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(957,19900,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(958,19901,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(959,19902,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(960,19903,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(961,19904,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(962,19905,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(963,19906,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(964,19907,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(965,19908,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(966,19909,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(967,19910,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(968,19911,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(969,19912,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(970,19913,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(971,19914,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(972,19915,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(973,19916,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1024,19917,'association',1,2,1,1,'','','#999999',1,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1025,19918,'association',1,1,1,1,'','','#999999',1,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1026,19919,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1027,19920,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1028,19921,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1029,19922,'association',1,4,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1030,19923,'association',1,5,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1031,19924,'association',1,10,2,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1032,19925,'association',1,1,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1033,19926,'association',1,2,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1),
	(1034,19927,'association',1,3,1,1,'','','#999999',0,0,0,0,0,NULL,NULL,0,'popup',0,0.000000,0.000000,0,1);

/*!40000 ALTER TABLE `llx_wynd_element_config` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_element_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_element_label`;

CREATE TABLE `llx_wynd_element_label` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL DEFAULT '0',
  `fk_element` int(11) DEFAULT NULL,
  `element_type` varchar(50) NOT NULL DEFAULT '0',
  `fk_channel` int(11) NOT NULL DEFAULT '0',
  `fk_locale` varchar(5) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `rowid_2` (`rowid`),
  KEY `rowid` (`rowid`),
  KEY `llx_wynd_element_label_locale` (`fk_locale`),
  CONSTRAINT `llx_wynd_label_llx_wynd_locale_code_fk` FOREIGN KEY (`fk_locale`) REFERENCES `llx_wynd_locale` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_element_label` WRITE;
/*!40000 ALTER TABLE `llx_wynd_element_label` DISABLE KEYS */;

INSERT INTO `llx_wynd_element_label` (`rowid`, `entity`, `label`, `fk_element`, `element_type`, `fk_channel`, `fk_locale`)
VALUES
	(1,5,'doloremque',2,'bankEntry',2,'zh_SG'),
	(2,5,'ullam',17,'bankEntry',3,'en_GB'),
	(3,2,'laboriosam',11,'bankEntry',3,'ar_QA'),
	(4,2,'sint',8,'bankEntry',2,'en_EN'),
	(5,2,'non',19,'bankEntry',3,'ar_QA'),
	(6,1,'aut',18,'bankEntry',3,'fr_FR'),
	(7,3,'illo',3,'bankEntry',3,'kk_KZ'),
	(8,3,'provident',6,'bankEntry',2,'en_GB'),
	(9,2,'repellat',1,'bankEntry',1,'ar_QA'),
	(10,2,'repellat',12,'bankEntry',2,'en_GB'),
	(11,2,'iusto',10,'bankEntry',2,'om_ET'),
	(12,4,'qui',9,'bankEntry',1,'ar_QA'),
	(13,4,'voluptatem',13,'bankEntry',1,'en_GB'),
	(14,2,'cupiditate',16,'bankEntry',1,'zh_SG'),
	(15,1,'at',4,'bankEntry',1,'en_EN'),
	(16,5,'est',7,'bankEntry',1,'en_EN'),
	(17,2,'ut',5,'bankEntry',1,'ar_QA'),
	(18,2,'sed',14,'bankEntry',3,'kk_KZ'),
	(19,5,'rerum',15,'bankEntry',3,'kk_KZ'),
	(20,4,'aut',20,'bankEntry',2,'ar_QA'),
	(21,1,'repellat',1,'category',2,'zh_SG'),
	(22,2,'debitis',2,'category',2,'en_EN'),
	(23,3,'ipsa',3,'category',1,'kk_KZ'),
	(24,4,'voluptatem',4,'category',1,'om_ET'),
	(25,5,'impedit',5,'category',3,'zh_SG'),
	(26,1,'quod',1,'division',1,'zh_SG'),
	(27,2,'aut',2,'division',2,'fr_FR'),
	(28,3,'occaecati',3,'division',1,'fr_FR'),
	(29,4,'vel',4,'division',1,'fr_FR'),
	(30,5,'cumque',5,'division',1,'en_EN'),
	(31,1,'et',1,'tag',1,'en_EN'),
	(32,2,'molestias',2,'tag',2,'om_ET'),
	(33,3,'aperiam',3,'tag',3,'ar_QA'),
	(34,4,'aut',4,'tag',3,'en_EN'),
	(35,5,'eaque',5,'tag',3,'zh_SG'),
	(36,2,'quis',8,'product',2,'en_GB'),
	(37,5,'ullam',5,'product',1,'om_ET'),
	(38,3,'doloremque',6,'product',1,'en_EN'),
	(39,4,'molestias',9,'product',3,'en_GB'),
	(40,3,'commodi',1,'product',1,'zh_SG'),
	(41,5,'inventore',7,'product',1,'ar_QA'),
	(42,4,'culpa',10,'product',2,'en_GB'),
	(43,1,'debitis',2,'product',3,'ar_QA'),
	(44,4,'ut',10,'product',3,'en_GB'),
	(45,4,'quas',3,'product',1,'en_EN');

/*!40000 ALTER TABLE `llx_wynd_element_label` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_interventions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_interventions`;

CREATE TABLE `llx_wynd_interventions` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_order` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `type` enum('ERASE_ELEMENT','ERASE_PAYMENT','CANCEL_INVOICE','DECREASE_QUANTITY','VALIDATE_PAYMENT','VALIDATE_DISCOUNT') NOT NULL,
  `data` longtext,
  `is_post_total` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_wynd_interventions_llx_user_rowid_fk` (`fk_user`),
  KEY `llx_wynd_interventions_llx_commande_rowid_fk` (`fk_order`),
  CONSTRAINT `llx_wynd_interventions_llx_commande_rowid_fk` FOREIGN KEY (`fk_order`) REFERENCES `llx_commande` (`rowid`),
  CONSTRAINT `llx_wynd_interventions_llx_user_rowid_fk` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_kitchen_action
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_kitchen_action`;

CREATE TABLE `llx_wynd_kitchen_action` (
  `rowid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk_config` int(11) NOT NULL,
  `action` enum('SCREEN','KVS','TICKET','CHOICE') NOT NULL DEFAULT 'SCREEN',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `UNIQUE` (`fk_config`,`action`),
  KEY `fk_config` (`fk_config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_kvs_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_kvs_config`;

CREATE TABLE `llx_wynd_kvs_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `theme` enum('DARK','LIGHT') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_entity` (`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_label`;

CREATE TABLE `llx_wynd_label` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL DEFAULT '0',
  `fk_element` int(11) NOT NULL DEFAULT '0',
  `element_type` varchar(50) NOT NULL DEFAULT '0',
  `fk_channel` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `rowid_2` (`rowid`) USING BTREE,
  KEY `rowid` (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;



# Affichage de la table llx_wynd_locale
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_locale`;

CREATE TABLE `llx_wynd_locale` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_wynd_locale` WRITE;
/*!40000 ALTER TABLE `llx_wynd_locale` DISABLE KEYS */;

INSERT INTO `llx_wynd_locale` (`rowid`, `code`, `label`)
VALUES
	(1,'fr_FR','Français'),
	(2,'en_EN','English'),
	(3,'en_GB','et'),
	(4,'om_ET','aperiam'),
	(5,'kk_KZ','ut'),
	(6,'zh_SG','magni'),
	(7,'ar_QA','impedit');

/*!40000 ALTER TABLE `llx_wynd_locale` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_origin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_origin`;

CREATE TABLE `llx_wynd_origin` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '0',
  UNIQUE KEY `rowid_4` (`rowid`),
  KEY `rowid` (`rowid`),
  KEY `rowid_2` (`rowid`),
  KEY `rowid_3` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_origin` WRITE;
/*!40000 ALTER TABLE `llx_wynd_origin` DISABLE KEYS */;

INSERT INTO `llx_wynd_origin` (`rowid`, `code`)
VALUES
	(1,'pos'),
	(2,'website'),
	(3,'borne'),
	(4,'application'),
	(5,'tablet'),
	(6,'drive');

/*!40000 ALTER TABLE `llx_wynd_origin` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_payment_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_payment_config`;

CREATE TABLE `llx_wynd_payment_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT NULL,
  `fk_payment` int(11) NOT NULL,
  `external_id` varchar(20) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT '0',
  `is_main_payment` tinyint(1) DEFAULT '0',
  `is_voidable` tinyint(1) DEFAULT '0',
  `is_refund_in_cash` tinyint(1) DEFAULT '0',
  `is_manager_required` tinyint(1) DEFAULT '0',
  `action_overpayment` enum('CASHBACK','CREDITNOTE') DEFAULT NULL,
  `has_cashdrawer_open` tinyint(1) DEFAULT '0',
  `has_default_total` tinyint(1) DEFAULT '0',
  `has_total_override` tinyint(1) DEFAULT '1',
  `payment_type` varchar(20) DEFAULT 'popup',
  `amount_min` float(10,6) DEFAULT '0.000000',
  `amount_max` float(10,6) DEFAULT '0.000000',
  `datec` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uuid` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `llx_wynd_payment_config_id_uindex` (`id`),
  UNIQUE KEY `llx_wynd_payment_config_entity_fk_payment_uindex` (`entity`,`fk_payment`),
  KEY `llx_wynd_payment_config_llx_c_paiement_id_fk` (`fk_payment`),
  CONSTRAINT `llx_wynd_payment_config_llx_c_paiement_id_fk` FOREIGN KEY (`fk_payment`) REFERENCES `llx_c_paiement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `llx_wynd_payment_config_llx_entity_rowid_fk` FOREIGN KEY (`entity`) REFERENCES `llx_entity` (`rowid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_wynd_payment_config` WRITE;
/*!40000 ALTER TABLE `llx_wynd_payment_config` DISABLE KEYS */;

INSERT INTO `llx_wynd_payment_config` (`id`, `entity`, `fk_payment`, `external_id`, `is_visible`, `is_main_payment`, `is_voidable`, `is_refund_in_cash`, `is_manager_required`, `action_overpayment`, `has_cashdrawer_open`, `has_default_total`, `has_total_override`, `payment_type`, `amount_min`, `amount_max`, `datec`, `tms`, `uuid`)
VALUES
	(1,3,1,'23933864',1,0,0,1,1,'CASHBACK',1,0,1,'popup',0.683370,10000.000000,'2017-07-18 03:45:32','2017-08-05 12:26:19','acb2f954-9422-40ae-9614-3b70588cb37c'),
	(2,2,2,'664863',0,0,0,1,1,'CREDITNOTE',0,1,0,'popup',0.000000,284.405396,'2017-08-03 14:09:24','2017-08-01 15:31:13','450505b4-85ce-415f-9067-2ef5195558c8'),
	(3,3,3,'95563',0,1,0,0,0,'CASHBACK',0,0,1,'popup',112.000000,254.778519,'2017-07-22 15:18:09','2017-07-23 04:47:53','7de5faf7-4672-4e57-921c-80bdcfc18a2e'),
	(4,2,4,'983',1,0,1,0,0,'CREDITNOTE',0,0,1,'popup',10000.000000,10000.000000,'2017-07-28 21:13:44','2017-07-12 06:35:53','2082170b-9a1b-40fb-8640-4b8bcc4e45d4'),
	(5,2,5,'17',0,0,0,0,0,'CREDITNOTE',1,1,1,'popup',1034.733276,1.156455,'2017-07-18 00:22:34','2017-07-19 00:03:22','c9279adb-7d83-413c-a0a0-832811d4848c'),
	(6,2,6,'384665948',1,0,0,1,0,'CREDITNOTE',1,0,1,'popup',14.007283,10000.000000,'2017-08-07 00:26:39','2017-07-23 12:57:45','5a64bb71-7d8e-4e8c-8c8f-bd493790bffe'),
	(7,3,7,'134',1,1,0,1,1,'CASHBACK',0,1,0,'popup',10000.000000,10000.000000,'2017-07-22 23:16:08','2017-08-02 02:58:38','99407bca-e2de-4fbf-a603-b7fa0c2941f1');

/*!40000 ALTER TABLE `llx_wynd_payment_config` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_pos_basket_pool
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_basket_pool`;

CREATE TABLE `llx_wynd_pos_basket_pool` (
  `uuid` varchar(36) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket` longtext NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  `status` enum('HOLD','PROGRESS','LOCKED') DEFAULT 'PROGRESS',
  `destination` int(11) NOT NULL,
  `attributes` longtext NOT NULL,
  `datec` datetime NOT NULL,
  `tms` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `llx_wynd_pos_basket_pool_llx_wynd_destination_rowid_fk` (`destination`),
  KEY `llx_wynd_pos_basket_pool_device_id_index` (`device_id`),
  CONSTRAINT `llx_wynd_pos_basket_pool_llx_bank_account_rowid_fk` FOREIGN KEY (`device_id`) REFERENCES `llx_bank_account` (`rowid`),
  CONSTRAINT `llx_wynd_pos_basket_pool_llx_wynd_destination_rowid_fk` FOREIGN KEY (`destination`) REFERENCES `llx_wynd_destination` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_pos_category_extern
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_category_extern`;

CREATE TABLE `llx_wynd_pos_category_extern` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL DEFAULT '0',
  `external_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `rowid_2` (`rowid`),
  KEY `rowid` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_pos_category_extern` WRITE;
/*!40000 ALTER TABLE `llx_wynd_pos_category_extern` DISABLE KEYS */;

INSERT INTO `llx_wynd_pos_category_extern` (`rowid`, `label`, `external_id`)
VALUES
	(1,'PLATS',NULL),
	(3,'BOISSONS',NULL),
	(4,'DESSERTS',NULL),
	(5,'ENFANTS',NULL),
	(6,'MENUS ADULTES',NULL),
	(7,'DIVERS',NULL),
	(8,'BREAKFAST',NULL);

/*!40000 ALTER TABLE `llx_wynd_pos_category_extern` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_pos_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_config`;

CREATE TABLE `llx_wynd_pos_config` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `entity` int(3) DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8 NOT NULL,
  `locale_ticket` varchar(5) CHARACTER SET utf8 NOT NULL,
  `timer_action` enum('LOGOUT','RELOAD') DEFAULT NULL,
  `timer` int(3) DEFAULT NULL,
  `has_drive` tinyint(1) DEFAULT NULL,
  `has_recall` tinyint(1) DEFAULT NULL,
  `has_borne` tinyint(1) DEFAULT NULL,
  `has_delivery` tinyint(1) DEFAULT NULL,
  `has_training` tinyint(1) DEFAULT NULL,
  `has_unsold` tinyint(1) DEFAULT NULL,
  `has_breaks_and_losses` tinyint(1) DEFAULT NULL,
  `has_blackbox` tinyint(1) DEFAULT NULL,
  `has_shift_report` tinyint(1) DEFAULT NULL,
  `has_restaurant_logon` tinyint(1) DEFAULT NULL,
  `has_combotisation` tinyint(1) DEFAULT NULL,
  `has_export_kvs` tinyint(1) DEFAULT NULL,
  `has_export_optikitchen` tinyint(1) DEFAULT NULL,
  `has_hold_system` tinyint(1) DEFAULT NULL,
  `max_orders_held` int(3) DEFAULT NULL,
  `is_connected` tinyint(1) DEFAULT NULL,
  `is_kitchen_button_active` tinyint(1) DEFAULT NULL,
  `kitchen_action` enum('SCREEN','TICKET','KVS') DEFAULT NULL,
  `checkout_action` enum('NULL','SCREEN','TICKET') DEFAULT 'NULL',
  `is_comments_button_active` tinyint(1) DEFAULT NULL,
  `is_destination_button_active` tinyint(1) DEFAULT NULL,
  `default_destination` enum('ONSITE','TAKEAWAY') DEFAULT NULL,
  `destination_trigger` enum('START','CHECKOUT') DEFAULT NULL,
  `is_abort_allowed` tinyint(1) DEFAULT NULL,
  `is_abort_require_manager` tinyint(1) DEFAULT '0',
  `is_last_add_edition_allowed` tinyint(1) DEFAULT NULL,
  `is_last_item_edition_allowed` tinyint(1) DEFAULT NULL,
  `is_cashdrawer_open_allowed` tinyint(1) DEFAULT NULL,
  `is_cashback_popin_autoclose_active` tinyint(1) DEFAULT NULL,
  `is_night_price_active` tinyint(1) DEFAULT NULL,
  `discount_button_label` varchar(20) DEFAULT NULL,
  `cohort_request` enum('ORDER','PAYMENT') DEFAULT NULL,
  `has_gas_pump` tinyint(1) DEFAULT NULL,
  `print_mode` enum('DIRECT','WPT','FASTPRINTER') DEFAULT 'DIRECT',
  `default_cohort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `llx_wynd_pos_config_id_uindex` (`id`),
  UNIQUE KEY `llx_wynd_pos_config_entity_uindex` (`entity`),
  KEY `llx_wynd_pos_config_llx_wynd_locale_code_fk` (`locale`),
  KEY `llx_wynd_pos_config_llx_wynd_locale_ticket_code_fk` (`locale_ticket`),
  KEY `default_cohort_id` (`default_cohort_id`),
  CONSTRAINT `llx_wynd_pos_config_llx_wynd_locale_code_fk` FOREIGN KEY (`locale`) REFERENCES `llx_wynd_locale` (`code`),
  CONSTRAINT `llx_wynd_pos_config_llx_wynd_locale_code_fk2` FOREIGN KEY (`locale_ticket`) REFERENCES `llx_wynd_locale` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_pos_customer_display
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_customer_display`;

CREATE TABLE `llx_wynd_pos_customer_display` (
  `fk_account` int(11) NOT NULL,
  `basket` text,
  `status` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `Index1` (`fk_account`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_pos_customer_display` WRITE;
/*!40000 ALTER TABLE `llx_wynd_pos_customer_display` DISABLE KEYS */;

INSERT INTO `llx_wynd_pos_customer_display` (`fk_account`, `basket`, `status`)
VALUES
	(1,NULL,1),
	(21,'{\"cashBackText\":\"2,80\"}',5),
	(22,NULL,2),
	(23,NULL,2),
	(24,NULL,1),
	(25,NULL,1),
	(26,NULL,1),
	(103002544,NULL,2),
	(103002545,NULL,2),
	(103002546,'{\"entity\":1,\"deviceID\":\"103002546\",\"deviceNumber\":\"\",\"idUser\":\"2\",\"userName\":\"Support WY\",\"origin\":\"pos\",\"id\":1468421700189,\"orderNumber\":\"73\",\"orderDate\":\"2016-07-13T14:55:00.189Z\",\"total\":33.8,\"content\":[{\"id\":\"2\",\"quantity\":1,\"label\":\"Mega Giant\",\"price\":\"5.75000000\",\"price_takeaway\":\"5.75000000\",\"price_ht\":\"5.58252427\",\"price_ht_takeaway\":\"5.58252427\",\"tva_tx\":\"3.000\",\"tva_tx_takeaway\":\"3.000\",\"category_kvs\":null,\"external_ref\":null,\"division\":null,\"comment\":null},{\"id\":\"3\",\"quantity\":1,\"label\":\"Supr\\u00eame Cheese\",\"price\":\"5.35000000\",\"price_takeaway\":\"5.35000000\",\"price_ht\":\"5.19417476\",\"price_ht_takeaway\":\"5.19417476\",\"tva_tx\":\"3.000\",\"tva_tx_takeaway\":\"3.000\",\"category_kvs\":null,\"external_ref\":null,\"division\":null,\"comment\":null},{\"id\":\"1\",\"quantity\":1,\"label\":\"Mega BBQ BC\",\"price\":\"5.75000000\",\"price_takeaway\":\"5.75000000\",\"price_ht\":\"5.58252000\",\"price_ht_takeaway\":\"5.58252000\",\"tva_tx\":\"3.000\",\"tva_tx_takeaway\":\"3.000\",\"category_kvs\":null,\"external_ref\":null,\"division\":null,\"comment\":null},{\"id\":\"10\",\"quantity\":2,\"label\":\"Chicken Filet\",\"price\":\"4.10000000\",\"price_takeaway\":\"4.10000000\",\"price_ht\":\"3.98058252\",\"price_ht_takeaway\":\"3.98058252\",\"tva_tx\":\"3.000\",\"tva_tx_takeaway\":\"3.000\",\"category_kvs\":null,\"external_ref\":null,\"division\":null,\"comment\":null},{\"id\":\"8\",\"quantity\":1,\"label\":\"Big Bacon\",\"price\":\"4.75000000\",\"price_takeaway\":\"4.75000000\",\"price_ht\":\"4.61165049\",\"price_ht_takeaway\":\"4.61165049\",\"tva_tx\":\"3.000\",\"tva_tx_takeaway\":\"3.000\",\"category_kvs\":null,\"external_ref\":null,\"division\":null,\"comment\":null},{\"id\":\"9\",\"quantity\":1,\"label\":\"Giant\",\"price\":\"4.00000000\",\"price_takeaway\":\"4.00000000\",\"price_ht\":\"3.88350000\",\"price_ht_takeaway\":\"3.88350000\",\"tva_tx\":\"3.000\",\"tva_tx_takeaway\":\"3.000\",\"category_kvs\":null,\"external_ref\":null,\"division\":null,\"comment\":null}],\"payments\":[],\"discounts\":[],\"interventions\":[],\"timer\":{\"hours\":\"00\",\"minutes\":\"00\",\"seconds\":\"03\"},\"deliveryTime\":null,\"customer\":null,\"tickets\":[]}',3),
	(103002547,NULL,2),
	(103002548,NULL,2),
	(103002549,NULL,1),
	(103002550,NULL,2);

/*!40000 ALTER TABLE `llx_wynd_pos_customer_display` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_pos_divisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_divisions`;

CREATE TABLE `llx_wynd_pos_divisions` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `label` varchar(50) NOT NULL,
  `external_id` int(11) DEFAULT NULL,
  `fk_entity` int(11) NOT NULL,
  `fk_division` int(11) DEFAULT NULL,
  `visible_on_kvs` tinyint(1) NOT NULL DEFAULT '1',
  `visible_on_kitchen_ticket` tinyint(1) NOT NULL DEFAULT '1',
  `decompilable` tinyint(1) NOT NULL DEFAULT '1',
  `datec` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tms` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  KEY `llx_division_ibfk_1` (`fk_entity`),
  KEY `llx_division_ibfk_2` (`fk_division`),
  CONSTRAINT `llx_division_ibfk_1` FOREIGN KEY (`fk_entity`) REFERENCES `llx_entity` (`rowid`),
  CONSTRAINT `llx_division_ibfk_2` FOREIGN KEY (`fk_division`) REFERENCES `llx_wynd_pos_divisions` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_pos_divisions` WRITE;
/*!40000 ALTER TABLE `llx_wynd_pos_divisions` DISABLE KEYS */;

INSERT INTO `llx_wynd_pos_divisions` (`rowid`, `uuid`, `label`, `external_id`, `fk_entity`, `fk_division`, `visible_on_kvs`, `visible_on_kitchen_ticket`, `decompilable`, `datec`, `tms`)
VALUES
	(1,'82744724-3c03-4e22-ad8c-e1845e4cf11f','quia',NULL,1,NULL,1,1,1,'2017-08-11 17:40:49','2017-08-11 17:40:49'),
	(2,'db52901c-c64f-41df-a9eb-d1fd4ab2bf6c','aut',NULL,2,1,1,1,1,'2017-08-11 17:40:49','2017-08-11 17:40:49'),
	(3,'07335279-719c-4807-acf9-c515cab15109','culpa',NULL,3,1,1,1,1,'2017-08-11 17:40:49','2017-08-11 17:40:49'),
	(4,'5b73fae8-a8cb-41a8-b653-2132e1b85ff1','dolores',NULL,4,1,1,1,1,'2017-08-11 17:40:49','2017-08-11 17:40:49'),
	(5,'892db8af-2ee2-498a-965e-15b009ee4ee6','consectetur',NULL,5,1,1,1,1,'2017-08-11 17:40:49','2017-08-11 17:40:49');

/*!40000 ALTER TABLE `llx_wynd_pos_divisions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_pos_kvs_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_kvs_categories`;

CREATE TABLE `llx_wynd_pos_kvs_categories` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `sort` int(3) NOT NULL DEFAULT '0',
  UNIQUE KEY `rowid` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_pos_kvs_categories` WRITE;
/*!40000 ALTER TABLE `llx_wynd_pos_kvs_categories` DISABLE KEYS */;

INSERT INTO `llx_wynd_pos_kvs_categories` (`rowid`, `label`, `color`, `sort`)
VALUES
	(1,'aut','#93ff53',0),
	(2,'laudantium','#c2bbf4',0),
	(3,'et','#f8f913',0),
	(4,'laborum','#85f2e1',0),
	(5,'corporis','#59cfdd',0);

/*!40000 ALTER TABLE `llx_wynd_pos_kvs_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_pos_orders_kvs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_orders_kvs`;

CREATE TABLE `llx_wynd_pos_orders_kvs` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL DEFAULT '0',
  `order_num` varchar(50) DEFAULT NULL,
  `total` decimal(24,8) NOT NULL DEFAULT '0.00000000',
  `order_lines` text NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timer` varchar(255) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `is_payd` int(1) NOT NULL DEFAULT '0',
  `is_park` int(1) NOT NULL DEFAULT '0',
  `is_send_to_kitchen` int(1) NOT NULL DEFAULT '0',
  `is_bump` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `order_id` (`order_id`),
  KEY `rowid` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_pos_orders_pool
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_orders_pool`;

CREATE TABLE `llx_wynd_pos_orders_pool` (
  `id_order` varchar(14) NOT NULL,
  `id_machine` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `datec` datetime DEFAULT NULL,
  `origin` varchar(15) DEFAULT NULL,
  UNIQUE KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_pos_piquick_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_piquick_categories`;

CREATE TABLE `llx_wynd_pos_piquick_categories` (
  `rowid` int(11) NOT NULL,
  `label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_pos_piquick_categories` WRITE;
/*!40000 ALTER TABLE `llx_wynd_pos_piquick_categories` DISABLE KEYS */;

INSERT INTO `llx_wynd_pos_piquick_categories` (`rowid`, `label`)
VALUES
	(1,'Solides'),
	(2,'Liquides'),
	(3,'Divers');

/*!40000 ALTER TABLE `llx_wynd_pos_piquick_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_pos_waiting_pool
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_pos_waiting_pool`;

CREATE TABLE `llx_wynd_pos_waiting_pool` (
  `id` varchar(15) NOT NULL,
  `basket` text NOT NULL,
  `device_id` int(11) NOT NULL,
  `customer_ref` int(11) NOT NULL,
  `entity` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_product_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_product_group`;

CREATE TABLE `llx_wynd_product_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_product_group` WRITE;
/*!40000 ALTER TABLE `llx_wynd_product_group` DISABLE KEYS */;

INSERT INTO `llx_wynd_product_group` (`id`, `label`)
VALUES
	(1,'similique'),
	(2,'ut'),
	(3,'voluptatem'),
	(4,'laudantium'),
	(5,'perferendis');

/*!40000 ALTER TABLE `llx_wynd_product_group` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_product_group_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_product_group_discount`;

CREATE TABLE `llx_wynd_product_group_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `min_item_number` int(11) NOT NULL,
  `identical` tinyint(1) NOT NULL,
  `min_amount` int(11) NOT NULL,
  `product_group_impacted` tinyint(1) NOT NULL,
  `number_impacted` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_group_discount_product_group_id` (`product_group_id`),
  KEY `fk_product_group_discount_discount_id` (`discount_id`),
  CONSTRAINT `fk_product_group_discount_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `llx_wynd_discount` (`id`),
  CONSTRAINT `fk_product_group_discount_product_group_id` FOREIGN KEY (`product_group_id`) REFERENCES `llx_wynd_product_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_product_group_discount` WRITE;
/*!40000 ALTER TABLE `llx_wynd_product_group_discount` DISABLE KEYS */;

INSERT INTO `llx_wynd_product_group_discount` (`id`, `product_group_id`, `discount_id`, `min_item_number`, `identical`, `min_amount`, `product_group_impacted`, `number_impacted`)
VALUES
	(1,1,1,10,0,6,1,54),
	(2,2,2,79,1,41,0,15),
	(3,3,3,44,0,56,1,64),
	(4,4,4,79,0,77,0,16),
	(5,5,5,51,0,50,0,48);

/*!40000 ALTER TABLE `llx_wynd_product_group_discount` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_product_group_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_product_group_item`;

CREATE TABLE `llx_wynd_product_group_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_group_item_product_group_id` (`product_group_id`),
  KEY `fk_product_group_item_product_id` (`product_id`),
  CONSTRAINT `fk_product_group_item_product_group_id` FOREIGN KEY (`product_group_id`) REFERENCES `llx_wynd_product_group` (`id`),
  CONSTRAINT `fk_product_group_item_product_id` FOREIGN KEY (`product_id`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_regions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_regions`;

CREATE TABLE `llx_wynd_regions` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `county_seat` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_wynd_region_code` (`code`),
  KEY `fk_wynd_region_country` (`country_id`),
  CONSTRAINT `fk_wynd_region_country` FOREIGN KEY (`country_id`) REFERENCES `llx_wynd_countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_regions` WRITE;
/*!40000 ALTER TABLE `llx_wynd_regions` DISABLE KEYS */;

INSERT INTO `llx_wynd_regions` (`id`, `code`, `country_id`, `county_seat`, `tncc`, `name`, `active`)
VALUES
	(1,0,0,'0',0,'-',1),
	(101,1,1,'97105',3,'Guadeloupe',1),
	(102,2,1,'97209',3,'Martinique',1),
	(103,3,1,'97302',3,'Guyane',1),
	(104,4,1,'97411',3,'Réunion',1),
	(105,11,1,'75056',1,'Île-de-France',1),
	(106,21,1,'51108',0,'Champagne-Ardenne',1),
	(107,22,1,'80021',0,'Picardie',1),
	(108,23,1,'76540',0,'Haute-Normandie',1),
	(109,24,1,'45234',2,'Centre',1),
	(110,25,1,'14118',0,'Basse-Normandie',1),
	(111,26,1,'21231',0,'Bourgogne',1),
	(112,31,1,'59350',2,'Nord-Pas-de-Calais',1),
	(113,41,1,'57463',0,'Lorraine',1),
	(114,42,1,'67482',1,'Alsace',1),
	(115,43,1,'25056',0,'Franche-Comté',1),
	(116,52,1,'44109',4,'Pays de la Loire',1),
	(117,53,1,'35238',0,'Bretagne',1),
	(118,54,1,'86194',2,'Poitou-Charentes',1),
	(119,72,1,'33063',1,'Aquitaine',1),
	(120,73,1,'31555',0,'Midi-Pyrénées',1),
	(121,74,1,'87085',2,'Limousin',1),
	(122,82,1,'69123',2,'Rhône-Alpes',1),
	(123,83,1,'63113',1,'Auvergne',1),
	(124,91,1,'34172',2,'Languedoc-Roussillon',1),
	(125,93,1,'13055',0,'Provence-Alpes-Côte d\'Azur',1),
	(126,94,1,'2A004',0,'Corse',1),
	(201,201,2,'',1,'Flandre',1),
	(202,202,2,'',2,'Wallonie',1),
	(203,203,2,'',3,'Bruxelles-Capitale',1),
	(301,301,3,NULL,1,'Abruzzo',1),
	(302,302,3,NULL,1,'Basilicata',1),
	(303,303,3,NULL,1,'Calabria',1),
	(304,304,3,NULL,1,'Campania',1),
	(305,305,3,NULL,1,'Emilia-Romagna',1),
	(306,306,3,NULL,1,'Friuli-Venezia Giulia',1),
	(307,307,3,NULL,1,'Lazio',1),
	(308,308,3,NULL,1,'Liguria',1),
	(309,309,3,NULL,1,'Lombardia',1),
	(310,310,3,NULL,1,'Marche',1),
	(311,311,3,NULL,1,'Molise',1),
	(312,312,3,NULL,1,'Piemonte',1),
	(313,313,3,NULL,1,'Puglia',1),
	(314,314,3,NULL,1,'Sardegna',1),
	(315,315,3,NULL,1,'Sicilia',1),
	(316,316,3,NULL,1,'Toscana',1),
	(317,317,3,NULL,1,'Trentino-Alto Adige',1),
	(318,318,3,NULL,1,'Umbria',1),
	(319,319,3,NULL,1,'Valle d Aosta',1),
	(320,320,3,NULL,1,'Veneto',1),
	(401,401,4,'',0,'Andalucia',1),
	(402,402,4,'',0,'Aragón',1),
	(403,403,4,'',0,'Castilla y León',1),
	(404,404,4,'',0,'Castilla la Mancha',1),
	(405,405,4,'',0,'Canarias',1),
	(406,406,4,'',0,'Cataluña',1),
	(407,407,4,'',0,'Comunidad de Ceuta',1),
	(408,408,4,'',0,'Comunidad Foral de Navarra',1),
	(409,409,4,'',0,'Comunidad de Melilla',1),
	(410,410,4,'',0,'Cantabria',1),
	(411,411,4,'',0,'Comunidad Valenciana',1),
	(412,412,4,'',0,'Extemadura',1),
	(413,413,4,'',0,'Galicia',1),
	(414,414,4,'',0,'Islas Baleares',1),
	(415,415,4,'',0,'La Rioja',1),
	(416,416,4,'',0,'Comunidad de Madrid',1),
	(417,417,4,'',0,'Región de Murcia',1),
	(418,418,4,'',0,'Principado de Asturias',1),
	(419,419,4,'',0,'Pais Vasco',1),
	(420,420,4,'',0,'Otros',1),
	(501,501,5,'',0,'Deutschland',1),
	(601,601,6,'',1,'Cantons',1),
	(701,701,7,'',0,'England',1),
	(702,702,7,'',0,'Wales',1),
	(703,703,7,'',0,'Scotland',1),
	(704,704,7,'',0,'Northern Ireland',1),
	(1001,1001,10,'',0,'Ariana',1),
	(1002,1002,10,'',0,'Béja',1),
	(1003,1003,10,'',0,'Ben Arous',1),
	(1004,1004,10,'',0,'Bizerte',1),
	(1005,1005,10,'',0,'Gabès',1),
	(1006,1006,10,'',0,'Gafsa',1),
	(1007,1007,10,'',0,'Jendouba',1),
	(1008,1008,10,'',0,'Kairouan',1),
	(1009,1009,10,'',0,'Kasserine',1),
	(1010,1010,10,'',0,'Kébili',1),
	(1011,1011,10,'',0,'La Manouba',1),
	(1012,1012,10,'',0,'Le Kef',1),
	(1013,1013,10,'',0,'Mahdia',1),
	(1014,1014,10,'',0,'Médenine',1),
	(1015,1015,10,'',0,'Monastir',1),
	(1016,1016,10,'',0,'Nabeul',1),
	(1017,1017,10,'',0,'Sfax',1),
	(1018,1018,10,'',0,'Sidi Bouzid',1),
	(1019,1019,10,'',0,'Siliana',1),
	(1020,1020,10,'',0,'Sousse',1),
	(1021,1021,10,'',0,'Tataouine',1),
	(1022,1022,10,'',0,'Tozeur',1),
	(1023,1023,10,'',0,'Tunis',1),
	(1024,1024,10,'',0,'Zaghouan',1),
	(1101,1101,11,'',0,'United-States',1),
	(1201,1201,12,'',0,'Tanger-Tétouan',1),
	(1202,1202,12,'',0,'Gharb-Chrarda-Beni Hssen',1),
	(1203,1203,12,'',0,'Taza-Al Hoceima-Taounate',1),
	(1204,1204,12,'',0,'L\'Oriental',1),
	(1205,1205,12,'',0,'Fès-Boulemane',1),
	(1206,1206,12,'',0,'Meknès-Tafialet',1),
	(1207,1207,12,'',0,'Rabat-Salé-Zemour-Zaër',1),
	(1208,1208,12,'',0,'Grand Cassablanca',1),
	(1209,1209,12,'',0,'Chaouia-Ouardigha',1),
	(1210,1210,12,'',0,'Doukahla-Adba',1),
	(1211,1211,12,'',0,'Marrakech-Tensift-Al Haouz',1),
	(1212,1212,12,'',0,'Tadla-Azilal',1),
	(1213,1213,12,'',0,'Sous-Massa-Drâa',1),
	(1214,1214,12,'',0,'Guelmim-Es Smara',1),
	(1215,1215,12,'',0,'Laâyoune-Boujdour-Sakia el Hamra',1),
	(1216,1216,12,'',0,'Oued Ed-Dahab Lagouira',1),
	(1301,1301,13,'',0,'Algerie',1),
	(1401,1401,14,'',0,'Canada',1),
	(1701,1701,17,'',0,'Provincies van Nederland ',1),
	(2301,2301,23,'',0,'Norte',1),
	(2302,2302,23,'',0,'Litoral',1),
	(2303,2303,23,'',0,'Cuyana',1),
	(2304,2304,23,'',0,'Central',1),
	(2305,2305,23,'',0,'Patagonia',1),
	(2801,2801,28,'',0,'Australia',1),
	(4601,4601,46,'',0,'Barbados',1),
	(5601,5601,56,'',0,'Brasil',1),
	(6701,6701,67,NULL,NULL,'Tarapacá',1),
	(6702,6702,67,NULL,NULL,'Antofagasta',1),
	(6703,6703,67,NULL,NULL,'Atacama',1),
	(6704,6704,67,NULL,NULL,'Coquimbo',1),
	(6705,6705,67,NULL,NULL,'Valparaíso',1),
	(6706,6706,67,NULL,NULL,'General Bernardo O Higgins',1),
	(6707,6707,67,NULL,NULL,'Maule',1),
	(6708,6708,67,NULL,NULL,'Biobío',1),
	(6709,6709,67,NULL,NULL,'Raucanía',1),
	(6710,6710,67,NULL,NULL,'Los Lagos',1),
	(6711,6711,67,NULL,NULL,'Aysén General Carlos Ibáñez del Campo',1),
	(6712,6712,67,NULL,NULL,'Magallanes y Antártica Chilena',1),
	(6713,6713,67,NULL,NULL,'Metropolitana de Santiago',1),
	(6714,6714,67,NULL,NULL,'Los Ríos',1),
	(6715,6715,67,NULL,NULL,'Arica y Parinacota',1),
	(7001,7001,70,'',0,'Colombie',1),
	(8601,8601,86,NULL,NULL,'Central',1),
	(8602,8602,86,NULL,NULL,'Oriental',1),
	(8603,8603,86,NULL,NULL,'Occidental',1),
	(10201,10201,102,NULL,NULL,'??????',1),
	(10202,10202,102,NULL,NULL,'?????? ??????',1),
	(10203,10203,102,NULL,NULL,'???????? ?????????',1),
	(10204,10204,102,NULL,NULL,'?????',1),
	(10205,10205,102,NULL,NULL,'????????? ????????? ??? ?????',1),
	(10206,10206,102,NULL,NULL,'???????',1),
	(10207,10207,102,NULL,NULL,'????? ?????',1),
	(10208,10208,102,NULL,NULL,'?????? ??????',1),
	(10209,10209,102,NULL,NULL,'????????????',1),
	(10210,10210,102,NULL,NULL,'????? ??????',1),
	(10211,10211,102,NULL,NULL,'?????? ??????',1),
	(10212,10212,102,NULL,NULL,'????????',1),
	(10213,10213,102,NULL,NULL,'?????? ?????????',1),
	(11401,11401,114,'',0,'Honduras',1),
	(11701,11701,117,'',0,'India',1),
	(15201,15201,152,'',0,'Rivière Noire',1),
	(15202,15202,152,'',0,'Flacq',1),
	(15203,15203,152,'',0,'Grand Port',1),
	(15204,15204,152,'',0,'Moka',1),
	(15205,15205,152,'',0,'Pamplemousses',1),
	(15206,15206,152,'',0,'Plaines Wilhems',1),
	(15207,15207,152,'',0,'Port-Louis',1),
	(15208,15208,152,'',0,'Rivière du Rempart',1),
	(15209,15209,152,'',0,'Savanne',1),
	(15210,15210,152,'',0,'Rodrigues',1),
	(15211,15211,152,'',0,'Les îles Agaléga',1),
	(15212,15212,152,'',0,'Les écueils des Cargados Carajos',1),
	(15401,15401,154,'',0,'Mexique',1),
	(23201,23201,232,'',0,'Los Andes',1),
	(23202,23202,232,'',0,'Capital',1),
	(23203,23203,232,'',0,'Central',1),
	(23204,23204,232,'',0,'Cento Occidental',1),
	(23205,23205,232,'',0,'Guayana',1),
	(23206,23206,232,'',0,'Insular',1),
	(23207,23207,232,'',0,'Los Llanos',1),
	(23208,23208,232,'',0,'Nor-Oriental',1),
	(23209,23209,232,'',0,'Zuliana',1);

/*!40000 ALTER TABLE `llx_wynd_regions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_shift_report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_shift_report`;

CREATE TABLE `llx_wynd_shift_report` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `amount` float(10,6) NOT NULL DEFAULT '0.000000',
  `system_amount` float(10,6) NOT NULL DEFAULT '0.000000',
  `delta_amount` float(10,6) NOT NULL DEFAULT '0.000000',
  KEY `Index 1` (`rowid`),
  KEY `FK__llx_user` (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wynd_shift_report_lines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_shift_report_lines`;

CREATE TABLE `llx_wynd_shift_report_lines` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `amount` float(10,6) NOT NULL,
  `quantity` int(3) NOT NULL,
  UNIQUE KEY `Index 1` (`rowid`),
  KEY `FK__llx_wynd_shift_report` (`fk_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wynd_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_stock`;

CREATE TABLE `llx_wynd_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_type_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_stock_type_id` (`stock_type_id`),
  KEY `fk_stock_warehouse_id` (`warehouse_id`),
  KEY `fk_stock_product_id` (`product_id`),
  CONSTRAINT `fk_stock_product_id` FOREIGN KEY (`product_id`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_stock_stock_type_id` FOREIGN KEY (`stock_type_id`) REFERENCES `llx_inventory_wynd_stock_types` (`id`),
  CONSTRAINT `fk_stock_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `llx_inventory_wynd_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_stock_inventory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_stock_inventory`;

CREATE TABLE `llx_wynd_stock_inventory` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_warehouse` int(11) NOT NULL,
  `inventory_date` date NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_wynd_stock_inventory_llx_product_rowid_fk_product` (`fk_product`),
  KEY `llx_wynd_stock_inventory_llx_wynd_warehouse_rowid_fk_warehouse` (`fk_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wynd_supplier_commercial_conditions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_supplier_commercial_conditions`;

CREATE TABLE `llx_wynd_supplier_commercial_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4B36BC0C2576E0FD` (`contract_id`),
  CONSTRAINT `FK_4B36BC0C2576E0FD` FOREIGN KEY (`contract_id`) REFERENCES `llx_wynd_supplier_contracts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table llx_wynd_supplier_contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_supplier_contacts`;

CREATE TABLE `llx_wynd_supplier_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_information` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wynd_supplier_contacts_supplier` (`supplier_id`),
  CONSTRAINT `fk_wynd_supplier_contacts_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `llx_wynd_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table llx_wynd_supplier_contracts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_supplier_contracts`;

CREATE TABLE `llx_wynd_supplier_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `status` enum('DRAFT','VALIDATED','ARCHIVED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `delivery_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `franco` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `franco_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_order_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_fee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wynd_supplier_contracts_supplier` (`supplier_id`),
  CONSTRAINT `fk_wynd_supplier_contracts_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `llx_wynd_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table llx_wynd_suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_suppliers`;

CREATE TABLE `llx_wynd_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rcs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intraco` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accounting_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_foreign` tinyint(1) DEFAULT '0',
  `bic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table llx_wynd_suppliers_distributors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_suppliers_distributors`;

CREATE TABLE `llx_wynd_suppliers_distributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `distributor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wynd_suppliers_distributors_supplier` (`supplier_id`),
  KEY `fk_wynd_suppliers_distributors_distributor` (`distributor_id`),
  CONSTRAINT `fk_wynd_suppliers_distributors_distributor` FOREIGN KEY (`distributor_id`) REFERENCES `llx_wynd_suppliers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wynd_suppliers_distributors_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `llx_wynd_suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table llx_wynd_user_entities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_user_entities`;

CREATE TABLE `llx_wynd_user_entities` (
  `user_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`entity_id`),
  KEY `IDX_EF044DFED3C3D2E4` (`user_id`),
  KEY `IDX_EF044DFEA123E519` (`entity_id`),
  CONSTRAINT `FK_EF044DFEA123E519` FOREIGN KEY (`entity_id`) REFERENCES `llx_entity` (`rowid`),
  CONSTRAINT `FK_EF044DFED3C3D2E4` FOREIGN KEY (`user_id`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table llx_wynd_warehouse_enabled
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_warehouse_enabled`;

CREATE TABLE `llx_wynd_warehouse_enabled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_warehouse_enabled_warehouse_id` (`warehouse_id`),
  KEY `fk_warehouse_enabled_entity_id` (`entity_id`),
  KEY `fk_warehouse_enabled_channel_id` (`channel_id`),
  KEY `fk_warehouse_enabled_destination_id` (`destination_id`),
  CONSTRAINT `fk_warehouse_enabled_channel_id` FOREIGN KEY (`channel_id`) REFERENCES `llx_wynd_channel` (`rowid`),
  CONSTRAINT `fk_warehouse_enabled_destination_id` FOREIGN KEY (`destination_id`) REFERENCES `llx_wynd_destination` (`rowid`),
  CONSTRAINT `fk_warehouse_enabled_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `llx_entity` (`rowid`),
  CONSTRAINT `fk_warehouse_enabled_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `llx_inventory_wynd_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `llx_wynd_warehouse_enabled` WRITE;
/*!40000 ALTER TABLE `llx_wynd_warehouse_enabled` DISABLE KEYS */;

INSERT INTO `llx_wynd_warehouse_enabled` (`id`, `warehouse_id`, `entity_id`, `channel_id`, `destination_id`, `sort`)
VALUES
	(1,1,1,1,NULL,0),
	(2,1,2,2,NULL,1),
	(3,2,2,NULL,1,2),
	(4,3,3,NULL,NULL,3);

/*!40000 ALTER TABLE `llx_wynd_warehouse_enabled` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wynd_warehouse_inventory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wynd_warehouse_inventory`;

CREATE TABLE `llx_wynd_warehouse_inventory` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_entity` int(11) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `inventory_date` date NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_wynd_warehouse_inventory_llx_entity_rowid_fk_entity` (`fk_entity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table llx_wyndterminal_c_modeuse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_c_modeuse`;

CREATE TABLE `llx_wyndterminal_c_modeuse` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_wyndterminal_c_modeuse` WRITE;
/*!40000 ALTER TABLE `llx_wyndterminal_c_modeuse` DISABLE KEYS */;

INSERT INTO `llx_wyndterminal_c_modeuse` (`rowid`, `code`, `label`, `active`)
VALUES
	(1,'STD','Standard',1),
	(2,'EXKI','EXKi',1),
	(3,'DIRECT','Direct',1),
	(4,'QUICK','Quick',1);

/*!40000 ALTER TABLE `llx_wyndterminal_c_modeuse` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wyndterminal_cgv
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_cgv`;

CREATE TABLE `llx_wyndterminal_cgv` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `cgv` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_dayorder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_dayorder`;

CREATE TABLE `llx_wyndterminal_dayorder` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `label` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_device
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_device`;

CREATE TABLE `llx_wyndterminal_device` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `mac_adress` varchar(2000) DEFAULT NULL,
  `url_dest` varchar(2000) DEFAULT NULL,
  `webkey` varchar(2000) DEFAULT NULL,
  `mode_use` varchar(20) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `llx_wyndterminal_device` WRITE;
/*!40000 ALTER TABLE `llx_wyndterminal_device` DISABLE KEYS */;

INSERT INTO `llx_wyndterminal_device` (`rowid`, `tms`, `datec`, `fk_user_author`, `fk_user_mod`, `entity`, `mac_adress`, `url_dest`, `webkey`, `mode_use`, `import_key`)
VALUES
	(1,'2017-08-11 17:40:49','2017-08-11 17:40:49',1,1,1,'25:47:E1:E6:FA:E6','http://brun.org/velit-dignissimos-molestias-tenetur-a-cumque-ut.html','et','rerum',NULL),
	(2,'2017-08-11 17:40:49','2017-08-11 17:40:49',1,1,1,'3F:31:9D:14:77:D8','http://lemoine.fr/doloremque-voluptates-unde-optio-accusamus-magnam-non','ratione','enim',NULL),
	(3,'2017-08-11 17:40:49','2017-08-11 17:40:49',1,1,1,'69:4C:AC:CB:F6:9A','http://guibert.com/','qui','in',NULL),
	(4,'2017-08-11 17:40:49','2017-08-11 17:40:49',1,1,1,'EC:11:3B:F2:5B:DE','https://peron.com/quidem-fugit-sapiente-ullam-eveniet.html','dolore','inventore',NULL),
	(5,'2017-08-11 17:40:49','2017-08-11 17:40:49',1,1,1,'AA:BB:CC:DD:EE:FF','http://delattre.fr/','quia','vitae',NULL);

/*!40000 ALTER TABLE `llx_wyndterminal_device` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table llx_wyndterminal_device_cgv
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_device_cgv`;

CREATE TABLE `llx_wyndterminal_device_cgv` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `fk_wyndterminal_device` int(11) NOT NULL,
  `fk_wyndterminal_cgv` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_device_dayorder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_device_dayorder`;

CREATE TABLE `llx_wyndterminal_device_dayorder` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `fk_wyndterminal_device` int(11) NOT NULL,
  `fk_wyndterminal_dayorder` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_device_manual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_device_manual`;

CREATE TABLE `llx_wyndterminal_device_manual` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `fk_wyndterminal_device` int(11) NOT NULL,
  `fk_wyndterminal_manual` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_device_offers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_device_offers`;

CREATE TABLE `llx_wyndterminal_device_offers` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `fk_wyndterminal_device` int(11) NOT NULL,
  `fk_wyndterminal_offers` int(11) NOT NULL,
  `url_api` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_device_sav
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_device_sav`;

CREATE TABLE `llx_wyndterminal_device_sav` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `fk_wyndterminal_device` int(11) NOT NULL,
  `fk_wyndterminal_sav` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_log`;

CREATE TABLE `llx_wyndterminal_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_wyndterminal_device` int(11) DEFAULT NULL,
  `method_call` varchar(200) DEFAULT NULL,
  `parameters` text,
  `url` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_manual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_manual`;

CREATE TABLE `llx_wyndterminal_manual` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `manual` text,
  `response` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_offers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_offers`;

CREATE TABLE `llx_wyndterminal_offers` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `label` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table llx_wyndterminal_sav
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llx_wyndterminal_sav`;

CREATE TABLE `llx_wyndterminal_sav` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `entity` int(11) NOT NULL,
  `mail_label` varchar(2000) DEFAULT NULL,
  `phone_label` varchar(2000) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table migration_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migration_versions`;

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;

INSERT INTO `migration_versions` (`version`)
VALUES
	('20170223170650'),
	('20170228174850'),
	('20170303105858'),
	('20170306000000'),
	('20170307085744'),
	('20170307090825'),
	('20170307104847'),
	('20170308150036'),
	('20170309104436'),
	('20170309145325'),
	('20170309151050'),
	('20170313170424'),
	('20170315120048'),
	('20170316103150'),
	('20170317150314'),
	('20170320105025'),
	('20170320144241'),
	('20170322114950'),
	('20170324140244'),
	('20170328103959'),
	('20170329160511'),
	('20170403134408'),
	('20170405000000'),
	('20170405091200'),
	('20170405182219'),
	('20170407115606'),
	('20170407132439'),
	('20170410000000'),
	('20170410143211'),
	('20170410143240'),
	('20170413143228'),
	('20170413150230'),
	('20170414115539'),
	('20170419151316'),
	('20170421175000'),
	('20170421180600'),
	('20170425145045'),
	('20170502000000'),
	('20170502000001'),
	('20170509084812'),
	('20170510142813'),
	('20170512085143'),
	('20170516101009'),
	('20170516133339'),
	('20170517124720'),
	('20170517141118'),
	('20170517152407'),
	('20170522172218'),
	('20170522173444'),
	('20170523081206'),
	('20170523101640'),
	('20170523133554'),
	('20170523145531'),
	('20170523152656'),
	('20170531172208'),
	('20170601174958'),
	('20170607160309'),
	('20170612100549'),
	('20170614112030'),
	('20170614124152'),
	('20170614172830'),
	('20170615133210'),
	('20170619091847'),
	('20170619124654'),
	('20170621125701'),
	('20170623144922'),
	('20170629085048'),
	('20170629120822'),
	('20170630100512'),
	('20170630143154'),
	('20170704084956'),
	('20170706101055'),
	('20170707123034'),
	('20170713100253'),
	('20170717101013'),
	('20170719144353'),
	('20170728130007'),
	('20170802153258'),
	('20170803154626'),
	('20170804113216'),
	('20170804130400'),
	('20170807140850'),
	('20170808134636'),
	('20170808161139'),
	('20170809141033'),
	('20170810162402'),
	('20170818141754'),
	('20170822160725'),
	('20170824132030'),
	('20170828151630'),
	('20170905121210'),
	('20170911170111'),
	('20170911170616'),
	('20170911171011'),
	('20170911171233'),
	('20170911171625'),
	('20170911173142'),
	('20170911173643'),
	('20170911173936'),
	('20170912115010'),
	('20170913141120'),
	('20170913141342'),
	('20170913181421'),
	('20170914101255'),
	('20170914160418'),
	('20170914180000'),
	('20170918152910'),
	('20170920161531'),
	('20170925155924'),
	('20170926174607'),
	('20170927142920'),
	('20170928164237'),
	('20171002100031'),
	('20171009122102'),
	('20171010094643');

/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table payment_facture
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_facture`;

CREATE TABLE `payment_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_paiement` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `amount` decimal(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table rapport_z
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z`;

CREATE TABLE `rapport_z` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_fiscale` date NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `entity_id` int(11) NOT NULL DEFAULT '1',
  `entity_name` varchar(255) NOT NULL,
  `entity_address` varchar(255) NOT NULL,
  `entity_town` varchar(255) NOT NULL,
  `entity_zip` varchar(255) NOT NULL,
  `entity_tel` varchar(15) NOT NULL,
  `entity_siret` varchar(255) NOT NULL,
  `entity_tvaintra` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_firstname` varchar(25) DEFAULT NULL,
  `user_lastname` varchar(25) DEFAULT NULL,
  `total_reglements` double(24,8) NOT NULL,
  `total_ttc` double(24,8) NOT NULL,
  `total_ht` double(24,8) NOT NULL,
  `nb_ventes` int(11) NOT NULL DEFAULT '0',
  `panier_moyen` double(24,8) NOT NULL DEFAULT '0.00000000',
  `nb_correction` int(11) NOT NULL DEFAULT '0',
  `taux_correction` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  `nb_factures` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z` WRITE;
/*!40000 ALTER TABLE `rapport_z` DISABLE KEYS */;

INSERT INTO `rapport_z` (`id`, `tms`, `date_fiscale`, `date_start`, `date_end`, `entity_id`, `entity_name`, `entity_address`, `entity_town`, `entity_zip`, `entity_tel`, `entity_siret`, `entity_tvaintra`, `user_id`, `user_firstname`, `user_lastname`, `total_reglements`, `total_ttc`, `total_ht`, `nb_ventes`, `panier_moyen`, `nb_correction`, `taux_correction`, `hash`, `nb_factures`)
VALUES
	(1,'2016-09-28 19:23:42','2016-09-28','2016-09-28 05:00:00','2016-09-28 21:23:42',1,'Quick Bascharage 292','28 avenue du luxembourg','Bascharage','4950','0035 226 65 49 ','107331/P','',1,'NULL','SuperAdmin',47.50000000,47.50000500,45.87138500,6,9.66666700,0,0.00000000,'29f767374a1110ef18e9f6aeddb82844',8);

/*!40000 ALTER TABLE `rapport_z` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_br
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_br`;

CREATE TABLE `rapport_z_br` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  `label_tva` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z_br` WRITE;
/*!40000 ALTER TABLE `rapport_z_br` DISABLE KEYS */;

INSERT INTO `rapport_z_br` (`id`, `fk_rapport`, `label_destination`, `qty`, `total`, `hash`, `label_tva`)
VALUES
	(1,1,'A emporter',0,0.00000000,'f7489ceebe582e420d13b51a2370b37d','Total'),
	(2,1,'Sur Place',1,10.49999500,'f1999e73445ffb3ff4b1c8a004b35f5e','Total'),
	(3,1,'Sur Place',1,10.49999500,'866a3d56bd916e6371340deb27979c56','TVA 3%'),
	(4,1,'Drive',0,0.00000000,'9353934fd82e21a6b03004a34f29a8a6','Total'),
	(5,1,'Livraison',0,0.00000000,'d161db83e99e8f4cba4b09301b603cb1','Total'),
	(6,1,'Walk',0,0.00000000,'d957f5b21f7df11b4b80b6f74a86ddf8','Total'),
	(7,1,'Total',1,10.49999500,'a6e30d234322a10c600951f013b85cf6','Total'),
	(8,1,'Total',1,10.49999500,'a6655b37957aadf3b6e0ff79a6622754','TVA 3%');

/*!40000 ALTER TABLE `rapport_z_br` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_br_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_br_det`;

CREATE TABLE `rapport_z_br_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  `label_tva` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rapport_z_CA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_CA`;

CREATE TABLE `rapport_z_CA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `total_net` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_brut` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_remise` double(24,8) NOT NULL DEFAULT '0.00000000',
  `percent` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z_CA` WRITE;
/*!40000 ALTER TABLE `rapport_z_CA` DISABLE KEYS */;

INSERT INTO `rapport_z_CA` (`id`, `fk_rapport`, `label_destination`, `total_net`, `total_brut`, `total_remise`, `percent`, `hash`)
VALUES
	(1,1,'A emporter',15.30000000,15.30000000,0.00000000,32.21052300,'7aea1aaabede905de22d57866e2dc6fb'),
	(2,1,'Sur Place',32.20000500,42.70000000,0.00000000,67.78947700,'c6c01f8d312b20549bbd557bf8d3b0f7'),
	(3,1,'Drive',0.00000000,0.00000000,0.00000000,0.00000000,'13cfc003a3350dd62836556588613afe'),
	(4,1,'Livraison',0.00000000,0.00000000,0.00000000,0.00000000,'ac89dc03186a49437a7806882d9cb000'),
	(5,1,'Walk',0.00000000,0.00000000,0.00000000,0.00000000,'749cd9243809c259734b2f78cedd8f01'),
	(6,1,'Total',47.50000500,58.00000000,0.00000000,0.00000000,'9bfff3cd051fa3bd7421f21f1e875a10');

/*!40000 ALTER TABLE `rapport_z_CA` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_CA_caisse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_CA_caisse`;

CREATE TABLE `rapport_z_CA_caisse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `caisse_id` int(11) NOT NULL,
  `caisse_label` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_net` double(24,8) NOT NULL DEFAULT '0.00000000',
  `spe` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z_CA_caisse` WRITE;
/*!40000 ALTER TABLE `rapport_z_CA_caisse` DISABLE KEYS */;

INSERT INTO `rapport_z_CA_caisse` (`id`, `fk_rapport`, `caisse_id`, `caisse_label`, `qty`, `total_net`, `spe`, `hash`)
VALUES
	(1,1,4,'Consos employés',1,10.50000000,1,'d755196dc484ff2dafbf38f6deec2cfe'),
	(2,1,21,'Caisse1',8,47.50000000,0,'1ddcbec93fb40efd0740672dd6302a4d');

/*!40000 ALTER TABLE `rapport_z_CA_caisse` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_CA_caisse_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_CA_caisse_det`;

CREATE TABLE `rapport_z_CA_caisse_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `caisse_id` int(11) NOT NULL,
  `caisse_label` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_net` double(24,8) NOT NULL DEFAULT '0.00000000',
  `spe` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rapport_z_CA_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_CA_det`;

CREATE TABLE `rapport_z_CA_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `total_net` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_brut` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_remise` double(24,8) NOT NULL DEFAULT '0.00000000',
  `percent` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rapport_z_CA_equipier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_CA_equipier`;

CREATE TABLE `rapport_z_CA_equipier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_lastname` varchar(55) NOT NULL,
  `user_firstname` varchar(55) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_net` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z_CA_equipier` WRITE;
/*!40000 ALTER TABLE `rapport_z_CA_equipier` DISABLE KEYS */;

INSERT INTO `rapport_z_CA_equipier` (`id`, `fk_rapport`, `user_id`, `user_lastname`, `user_firstname`, `qty`, `total_net`, `hash`)
VALUES
	(1,1,2,'Wynd','Support',8,47.50000000,'2bffe929ff3c892eaab42771aa6fbe59');

/*!40000 ALTER TABLE `rapport_z_CA_equipier` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_CA_equipier_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_CA_equipier_det`;

CREATE TABLE `rapport_z_CA_equipier_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_lastname` varchar(55) NOT NULL,
  `user_firstname` varchar(55) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_net` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rapport_z_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_det`;

CREATE TABLE `rapport_z_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_fiscale` date NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `equipier_id` int(11) DEFAULT NULL,
  `entity_id` int(11) NOT NULL DEFAULT '1',
  `entity_name` varchar(255) NOT NULL,
  `entity_address` varchar(255) NOT NULL,
  `entity_town` varchar(255) NOT NULL,
  `entity_zip` varchar(255) NOT NULL,
  `entity_tel` varchar(15) NOT NULL,
  `entity_siret` varchar(255) NOT NULL,
  `entity_tvaintra` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_firstname` varchar(25) DEFAULT NULL,
  `user_lastname` varchar(25) DEFAULT NULL,
  `total_reglements` double NOT NULL,
  `total_ttc` double(24,8) NOT NULL,
  `total_ht` double(24,8) NOT NULL,
  `nb_ventes` int(11) NOT NULL DEFAULT '0',
  `panier_moyen` double(24,8) NOT NULL DEFAULT '0.00000000',
  `nb_correction` int(11) NOT NULL DEFAULT '0',
  `taux_correction` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  `nb_factures` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rapport_z_produit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_produit`;

CREATE TABLE `rapport_z_produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_categ` varchar(255) DEFAULT NULL,
  `label_sous_categ` varchar(255) DEFAULT NULL,
  `label_product` varchar(255) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `nb_product` int(11) NOT NULL DEFAULT '0',
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_remise` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z_produit` WRITE;
/*!40000 ALTER TABLE `rapport_z_produit` DISABLE KEYS */;

INSERT INTO `rapport_z_produit` (`id`, `fk_rapport`, `label_categ`, `label_sous_categ`, `label_product`, `id_product`, `nb_product`, `total_ttc`, `total_ht`, `total_remise`, `hash`)
VALUES
	(1,1,'LUX POS',NULL,NULL,NULL,27,67.60000000,0.00000000,0.00000000,'ca2801c3f44406eff93d32b80882c884'),
	(2,1,'LUX POS','Desserts',NULL,NULL,3,5.50000000,0.00000000,0.00000000,'07a9b72ce9a3ed02cd955d9784b5d8dc'),
	(3,1,'LUX POS','Desserts','Cornet',47,1,1.39000000,1.34951500,0.00000000,'e56c526dfa76c8f87b470673eb93e055'),
	(4,1,'LUX POS','Desserts','Shake mangue 50 cl',45,1,2.85000000,2.76699000,0.00000000,'fdca33b2da70525f67bde0249c9e19f6'),
	(5,1,'LUX POS','Desserts','Andros',61,1,1.26000000,1.22330100,0.00000000,'c15cadfb7a327d24c662f9c425b08eab'),
	(6,1,'LUX POS','Boissons froides',NULL,NULL,3,5.57000000,0.00000000,0.00000000,'07a041eba7937a266a6ebe4aa1962672'),
	(7,1,'LUX POS','Boissons froides','Bière 50 cl',72,1,2.11000000,1.80341900,0.00000000,'3562c6cbdf46db2e75783e3365d18a13'),
	(8,1,'LUX POS','Boissons froides','Sprite 50cl',177,1,2.02000000,1.96116500,0.00000000,'4d0a9b4026e9778de06f6badba44993d'),
	(9,1,'LUX POS','Boissons froides','Nestea 35cl',173,1,1.44000000,1.39805800,0.00000000,'6498272376e7b0344d10a68438250cea'),
	(10,1,'LUX POS','Frites',NULL,NULL,8,7.29000000,0.00000000,0.00000000,'2c855eb925f817d3ce8a6c2526f205b6'),
	(11,1,'LUX POS','Frites','Maxi Frite',99,2,4.17000000,4.04854400,0.00000000,'d227ddba3788590d32b6e7940231e07c'),
	(12,1,'LUX POS','Frites','Nestea 25cl',167,1,1.51000000,1.46601900,0.00000000,'d97a31dfd7730947b231a4cb23410bc2'),
	(13,1,'LUX POS','Frites','Vinaigrette Balsamique',96,1,0.21000000,0.20388400,0.00000000,'245a3aa097df51063afa240db1805a1f'),
	(14,1,'LUX POS','Frites','Aigre Doux',91,1,0.35000000,0.33981000,0.00000000,'44ae8a07bef886a159f4defd73a286f3'),
	(15,1,'LUX POS','Frites','Curry',88,3,1.05000000,1.01943000,0.00000000,'78d4aaa923d8d9532e0b7f8053327f65'),
	(16,1,'LUX POS','Burgers',NULL,NULL,12,47.43000000,0.00000000,0.00000000,'d91a3956614406edf05ec33387f7948a'),
	(17,1,'LUX POS','Burgers','SUPREME BACON',320,1,3.29000000,3.19417500,0.00000000,'b764b5656095431fa232971a63abb4aa'),
	(18,1,'LUX POS','Burgers','Big Pepper',7,3,13.07000000,12.68931900,0.00000000,'2b641fe0cb26129c3224425188f831e7'),
	(19,1,'LUX POS','Burgers','Sprite 25cl',163,1,1.67000000,1.62135900,0.00000000,'be1ca14e066ae1e66f2b29e53a6c7c16'),
	(20,1,'LUX POS','Burgers','Cheeseburger',12,1,1.63000000,1.58252400,0.00000000,'6da19bd7a47e94204f4a7ca58f6ee401'),
	(21,1,'LUX POS','Burgers','Big Bacon',8,2,8.38000000,8.13592200,0.00000000,'017f52ecebc12b958330ba44690fa59e'),
	(22,1,'LUX POS','Burgers','Chicken Filet',10,2,7.89000000,7.66019200,0.00000000,'4d83f08c4be25515a39e9db3e35877aa'),
	(23,1,'LUX POS','Burgers','Mega BBQ BC',1,1,5.75000000,5.58252000,0.00000000,'0ad10334f37f875dfbdcafff0bfb5b83'),
	(24,1,'LUX POS','Burgers','Mega Giant',2,1,5.75000000,5.58252000,0.00000000,'f2c2c5c17bd99473f0ecce4cd02491ff'),
	(25,1,'LUX POS','Salades',NULL,NULL,1,1.81000000,0.00000000,0.00000000,'25f624e9ab2f6d3dfc082e9b4dc37357'),
	(26,1,'LUX POS','Salades','Side Salad',24,1,1.81000000,1.75728200,0.00000000,'cba0a9939f07815c9fd4b8c0905a2beb'),
	(27,1,'totalCateg',NULL,NULL,NULL,27,67.60000000,0.00000000,0.00000000,'c2a8517d6617ac64f4b7b7b771272887');

/*!40000 ALTER TABLE `rapport_z_produit` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_produit_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_produit_det`;

CREATE TABLE `rapport_z_produit_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_categ` varchar(255) DEFAULT NULL,
  `label_sous_categ` varchar(255) DEFAULT NULL,
  `label_product` varchar(255) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `nb_product` int(11) NOT NULL DEFAULT '0',
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_remise` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rapport_z_reglements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_reglements`;

CREATE TABLE `rapport_z_reglements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_payment` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z_reglements` WRITE;
/*!40000 ALTER TABLE `rapport_z_reglements` DISABLE KEYS */;

INSERT INTO `rapport_z_reglements` (`id`, `fk_rapport`, `label_payment`, `qty`, `total`, `hash`)
VALUES
	(1,1,'Espèces',7,47.50000000,'d92c1c54224d24a5494882386272be0e'),
	(2,1,'totalReglement',7,47.50000000,'7298ea8ff2ea4c6df1a9ff8b71215b89');

/*!40000 ALTER TABLE `rapport_z_reglements` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_reglements_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_reglements_det`;

CREATE TABLE `rapport_z_reglements_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_payment` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rapport_z_remise
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_remise`;

CREATE TABLE `rapport_z_remise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_discount` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z_remise` WRITE;
/*!40000 ALTER TABLE `rapport_z_remise` DISABLE KEYS */;

INSERT INTO `rapport_z_remise` (`id`, `fk_rapport`, `label_discount`, `qty`, `total`, `hash`)
VALUES
	(1,1,'total',0,0.00000000,'37ff88d9051ee755eef1675196929e48');

/*!40000 ALTER TABLE `rapport_z_remise` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_remise_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_remise_det`;

CREATE TABLE `rapport_z_remise_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_discount` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rapport_z_remise_tva
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_remise_tva`;

CREATE TABLE `rapport_z_remise_tva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `label_tva` varchar(25) NOT NULL,
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z_remise_tva` WRITE;
/*!40000 ALTER TABLE `rapport_z_remise_tva` DISABLE KEYS */;

INSERT INTO `rapport_z_remise_tva` (`id`, `fk_rapport`, `label_destination`, `label_tva`, `total`, `hash`)
VALUES
	(1,1,'A emporter','total',0.00000000,'63316abcc6ed89c5c8b6286b486488d0'),
	(2,1,'A emporter','TVA 3%',0.00000000,'227f1982060ef21d2c72830eb65f224b'),
	(3,1,'Sur Place','total',0.00000000,'964de320c687a0eb90b4ef5d3f3b8a22'),
	(4,1,'Sur Place','TVA 3%',0.00000000,'d1a610907d6ec44385638f3a207cdb1e'),
	(5,1,'Sur Place','TVA 17%',0.00000000,'c539ca9d36b5d54e3a04ae5fce0ac06c'),
	(6,1,'Drive','total',0.00000000,'2f123dd7e58c63084e69734a495689b9'),
	(7,1,'Livraison','total',0.00000000,'27df9bfd02b64d2f346e7663ed16ea50'),
	(8,1,'Walk','total',0.00000000,'6d7c0dac09a8e07f670342e12ba21d1d'),
	(9,1,'Total','total',0.00000000,'b2c3ac048d4f46494459fe10000d5c4d'),
	(10,1,'Total','TVA 3%',0.00000000,'a85f25f7bfd54c99d7c588233f41e876'),
	(11,1,'Total','TVA 17%',0.00000000,'c519d9b98e5d8527550484f660fee614');

/*!40000 ALTER TABLE `rapport_z_remise_tva` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_remise_tva_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_remise_tva_det`;

CREATE TABLE `rapport_z_remise_tva_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `label_tva` varchar(25) NOT NULL,
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rapport_z_tva
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_tva`;

CREATE TABLE `rapport_z_tva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_type` varchar(10) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `label_tva` varchar(25) NOT NULL,
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rapport_z_tva` WRITE;
/*!40000 ALTER TABLE `rapport_z_tva` DISABLE KEYS */;

INSERT INTO `rapport_z_tva` (`id`, `fk_rapport`, `label_type`, `label_destination`, `label_tva`, `total_ttc`, `total_tva`, `total_ht`, `hash`)
VALUES
	(1,1,'Brut','A emporter','total',15.30000000,0.44562300,14.85437700,'c17c1f867a38b336251133bdb7d7b433'),
	(2,1,'Brut','A emporter','TVA 3%',15.30000000,0.44562300,14.85437700,'232264961e29b44d9e3a94a5fa540d9e'),
	(3,1,'Brut','Sur Place','total',42.70000000,1.48881800,41.21118200,'e4ee19a9a623e076391d287f72927d0e'),
	(4,1,'Brut','Sur Place','TVA 3%',40.59000000,1.18223700,39.40776300,'dbec67d6b7e16cfca0ee402172d124c8'),
	(5,1,'Brut','Sur Place','TVA 17%',2.11000000,0.30658100,1.80341900,'e103d97ab127d333335ef947c61b5c17'),
	(6,1,'Brut','Drive','total',0.00000000,0.00000000,0.00000000,'0ac9c32622a1f8044099ea0db090ebe2'),
	(7,1,'Brut','Livraison','total',0.00000000,0.00000000,0.00000000,'679ee20c21cd36c4a2031b9b526f7ed0'),
	(8,1,'Brut','Walk','total',0.00000000,0.00000000,0.00000000,'b7c3e32f915f60490c0c3d41070128f7'),
	(9,1,'Brut','Total','total',58.00000000,1.93444100,56.06555900,'c95a4195ff6017aaab1c5dd9b831b296'),
	(10,1,'Brut','Total','TVA 3%',55.89000000,1.62786000,54.26214000,'33829684f665b9ba55ac44e69d70bacf'),
	(11,1,'Brut','Total','TVA 17%',2.11000000,0.30658100,1.80341900,'bec0493e1faa719abfaecab988182ce1'),
	(12,1,'Net','A emporter','total',15.30000000,0.44563100,14.85436900,'81423ec73fb9eb84e16a5ff3ebeed60d'),
	(13,1,'Net','A emporter','TVA 3%',15.30000000,0.44563100,14.85436900,'a8fc00b1ec89286a0bf170b63e2bab89'),
	(14,1,'Net','Sur Place','total',32.20000500,1.18298900,31.01701600,'140bb4a1f83627a06444b90db337f4be'),
	(15,1,'Net','Sur Place','TVA 3%',30.09000500,0.87640800,29.21359700,'f389382c11971ad2683a82ae2203f08c'),
	(16,1,'Net','Sur Place','TVA 17%',2.11000000,0.30658100,1.80341900,'739f8a52062e3f1c6b749a3528caf1ba'),
	(17,1,'Net','Drive','total',0.00000000,0.00000000,0.00000000,'8a549f73e0928997387386c33bd2bb71'),
	(18,1,'Net','Livraison','total',0.00000000,0.00000000,0.00000000,'b9fcf916a1430f7bf8857d91eed7f607'),
	(19,1,'Net','Walk','total',0.00000000,0.00000000,0.00000000,'ec42e735a7387b5780e7505a8fb2f3b8'),
	(20,1,'Net','Total','total',47.50000500,1.62862000,45.87138500,'582f2fb17ebf0bf3c6dedc7271238707'),
	(21,1,'Net','Total','TVA 3%',45.39000500,1.32203900,44.06796600,'462e67b8dccd9fbdb1875d13534b5d00'),
	(22,1,'Net','Total','TVA 17%',2.11000000,0.30658100,1.80341900,'95495959d161ba122b1686132769a590');

/*!40000 ALTER TABLE `rapport_z_tva` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rapport_z_tva_det
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rapport_z_tva_det`;

CREATE TABLE `rapport_z_tva_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rapport` int(11) NOT NULL,
  `label_type` varchar(10) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `label_tva` varchar(25) NOT NULL,
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `fk_report_id` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_fiscale` date NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `equipier_id` int(11) DEFAULT NULL,
  `entity_id` int(11) NOT NULL DEFAULT '1',
  `entity_name` varchar(255) NOT NULL,
  `entity_address` varchar(255) NOT NULL,
  `entity_town` varchar(255) NOT NULL,
  `entity_zip` varchar(255) NOT NULL,
  `entity_tel` varchar(15) NOT NULL,
  `entity_siret` varchar(255) NOT NULL,
  `entity_tvaintra` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_firstname` varchar(25) DEFAULT NULL,
  `user_lastname` varchar(25) DEFAULT NULL,
  `average_basket` double(24,8) DEFAULT NULL,
  `total_net` double(24,8) DEFAULT NULL,
  `nb_net` int(11) DEFAULT NULL,
  `total_gross` double(24,8) DEFAULT NULL,
  `nb_gross` int(11) DEFAULT NULL,
  `total_discount` double(24,8) DEFAULT NULL,
  `nb_discount` int(11) DEFAULT NULL,
  `total_br` double(24,8) DEFAULT NULL,
  `nb_br` int(11) DEFAULT NULL,
  `nb_sales_canceled` int(11) DEFAULT NULL,
  `hash` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_id` (`report_id`),
  KEY `fk_report_id` (`fk_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table report_bank_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_bank_account`;

CREATE TABLE `report_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) DEFAULT NULL,
  `caisse_id` int(11) NOT NULL,
  `caisse_label` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_net` double(24,8) NOT NULL DEFAULT '0.00000000',
  `spe` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table report_br_vat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_br_vat`;

CREATE TABLE `report_br_vat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) DEFAULT NULL,
  `label_destination` varchar(55) NOT NULL,
  `tx_tva` double(24,8) NOT NULL,
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='WYND';



# Affichage de la table report_credit_note
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_credit_note`;

CREATE TABLE `report_credit_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) DEFAULT NULL,
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `qty` int(11) NOT NULL DEFAULT '0',
  `status` enum('AVAILABLE','EXPIRED','USED') DEFAULT NULL,
  `type` enum('OVERPAYMENT','RETURN') DEFAULT NULL,
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table report_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_discount`;

CREATE TABLE `report_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) DEFAULT NULL,
  `label_discount` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table report_discount_vat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_discount_vat`;

CREATE TABLE `report_discount_vat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `tx_tva` double(24,8) NOT NULL,
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='WYND';



# Affichage de la table report_division_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_division_product`;

CREATE TABLE `report_division_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) DEFAULT NULL,
  `division_label` varchar(255) DEFAULT NULL,
  `sub_division_label` varchar(255) DEFAULT NULL,
  `product_label` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `nb_product` int(11) NOT NULL DEFAULT '0',
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_discount` double(24,8) DEFAULT NULL,
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table report_interventions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_interventions`;

CREATE TABLE `report_interventions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `type` varchar(60) NOT NULL,
  `nb_requested` int(11) NOT NULL,
  `nb_order_requested` int(11) NOT NULL,
  `nb_validated` int(11) NOT NULL,
  `nb_order_validated` int(11) NOT NULL,
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table report_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_payments`;

CREATE TABLE `report_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) DEFAULT NULL,
  `label_payment` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table report_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_user`;

CREATE TABLE `report_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_lastname` varchar(55) NOT NULL,
  `user_firstname` varchar(55) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_net` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table report_vat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_vat`;

CREATE TABLE `report_vat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_report` int(11) DEFAULT NULL,
  `label_type` varchar(10) NOT NULL,
  `label_destination` varchar(55) NOT NULL,
  `tx_tva` double(24,8) DEFAULT NULL,
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `hash` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_type` varchar(25) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `value` text,
  `expiration_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;

INSERT INTO `tokens` (`id`, `item_type`, `item_id`, `value`, `expiration_date`)
VALUES
	(1,'customer',11,'cda138a7c79c5df600cd93a38ec2a824ed1f6a81','2016-12-17 15:11:53');

/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
