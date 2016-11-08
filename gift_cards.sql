/*
Navicat MySQL Data Transfer

Source Server         : Homestead
Source Server Version : 50709
Source Host           : 192.168.10.10:3306
Source Database       : gift_cards

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-02-15 15:03:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for vt_capacities
-- ----------------------------
DROP TABLE IF EXISTS `vt_capacities`;
CREATE TABLE `vt_capacities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_capacities
-- ----------------------------
INSERT INTO `vt_capacities` VALUES ('1', 'capacity 1');
INSERT INTO `vt_capacities` VALUES ('2', 'capacity 2');
INSERT INTO `vt_capacities` VALUES ('3', 'capacity 3');

-- ----------------------------
-- Table structure for vt_capacities_products
-- ----------------------------
DROP TABLE IF EXISTS `vt_capacities_products`;
CREATE TABLE `vt_capacities_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `capacity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_capacities_products
-- ----------------------------
INSERT INTO `vt_capacities_products` VALUES ('1', '1', '1');
INSERT INTO `vt_capacities_products` VALUES ('16', '18', '1');
INSERT INTO `vt_capacities_products` VALUES ('17', '18', '2');
INSERT INTO `vt_capacities_products` VALUES ('18', '18', '3');

-- ----------------------------
-- Table structure for vt_categories
-- ----------------------------
DROP TABLE IF EXISTS `vt_categories`;
CREATE TABLE `vt_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `custom` tinyint(1) NOT NULL DEFAULT '1',
  `in_stock` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_categories
-- ----------------------------
INSERT INTO `vt_categories` VALUES ('11', 'asdf', '/uploads/imgs/Green-Field-WideScreen-Wallpaper.jpg', '1', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for vt_client_informations
-- ----------------------------
DROP TABLE IF EXISTS `vt_client_informations`;
CREATE TABLE `vt_client_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_request_id` int(11) NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `adjuster_email` varchar(255) NOT NULL,
  `adjuster_name` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city_state_zip` varchar(255) NOT NULL,
  `extension` text,
  `claim_number1` int(11) DEFAULT NULL,
  `claim_number2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vt_client_informations
-- ----------------------------
INSERT INTO `vt_client_informations` VALUES ('1', '1', '', 'alex@mail.com', 'Adjuster', '22222', '', '', 'city', '', null, null);

-- ----------------------------
-- Table structure for vt_clients
-- ----------------------------
DROP TABLE IF EXISTS `vt_clients`;
CREATE TABLE `vt_clients` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_clients
-- ----------------------------
INSERT INTO `vt_clients` VALUES ('1', 'Title 1', '/img/logo/logo-1.png', '1', '2015-12-14 00:00:00');
INSERT INTO `vt_clients` VALUES ('2', 'Title 2', '/img/logo/logo-2.png', '1', '2015-12-14 00:00:00');
INSERT INTO `vt_clients` VALUES ('3', 'Title 3', '/img/logo/logo-3.png', '1', '2015-12-14 00:00:00');
INSERT INTO `vt_clients` VALUES ('4', 'Title 4', '/img/logo/logo-4.png', '1', '2015-12-14 00:00:00');
INSERT INTO `vt_clients` VALUES ('5', 'Title 5', '/img/logo/logo-5.png', '1', '2015-12-14 00:00:00');
INSERT INTO `vt_clients` VALUES ('6', 'Title 6', '/img/logo/logo-2.png', '1', '2015-12-14 00:00:00');
INSERT INTO `vt_clients` VALUES ('7', 'Title 7', '/img/logo/logo-3.png', '1', '2015-12-14 00:00:00');
INSERT INTO `vt_clients` VALUES ('8', 'Title 8', '/img/logo/logo-1.png', '1', '2015-12-14 00:00:00');

-- ----------------------------
-- Table structure for vt_companies
-- ----------------------------
DROP TABLE IF EXISTS `vt_companies`;
CREATE TABLE `vt_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vt_companies
-- ----------------------------
INSERT INTO `vt_companies` VALUES ('1', 'USA2', '/uploads/imgs/5aca4b926d35.jpg');

-- ----------------------------
-- Table structure for vt_contacts
-- ----------------------------
DROP TABLE IF EXISTS `vt_contacts`;
CREATE TABLE `vt_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `msg` text NOT NULL,
  `viewed` smallint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vt_contacts
-- ----------------------------
INSERT INTO `vt_contacts` VALUES ('7', 'emaila@mail.com', '', null, null, '', '1', '2015-07-07 11:15:29', null, null);
INSERT INTO `vt_contacts` VALUES ('15', 'emaila@mail.com', '9798789', 'company', 'Reason of Contact', 'msg text', '1', '2016-01-19 14:19:37', 'first time', 'last time');
INSERT INTO `vt_contacts` VALUES ('16', 'sdcsdc@cdcd.com', 'dscsd', null, null, 'dcsdc', '1', '2016-01-22 15:57:03', 'cdsc', null);
INSERT INTO `vt_contacts` VALUES ('17', 'sdc@cdscsd.cc', 'scsdc', 'sdc', 'Reason of Contact', 'sdcs', '1', '2016-01-28 17:21:52', 'dsc', 'csdc');
INSERT INTO `vt_contacts` VALUES ('18', 'emil@email.dcd', '123', 'co', 'Reason of Contact', 'dscds', '1', '2016-02-02 10:15:27', 'f name', 'last');
INSERT INTO `vt_contacts` VALUES ('19', 'email@email.com', '789', null, null, 'msg', '1', '2016-02-02 17:14:56', 'test name', null);
INSERT INTO `vt_contacts` VALUES ('20', 'new-emaila@mail.com', '79879', 'company', 'Reason of Contact', 'msg text', '1', '2016-02-02 17:16:05', 'first', 'last');

-- ----------------------------
-- Table structure for vt_countries
-- ----------------------------
DROP TABLE IF EXISTS `vt_countries`;
CREATE TABLE `vt_countries` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `iso` varchar(2) NOT NULL,
  `iso3` varchar(3) NOT NULL,
  `numcode` int(11) NOT NULL,
  `fedex_ship` tinyint(1) NOT NULL,
  `vat` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=cp1251;

-- ----------------------------
-- Records of vt_countries
-- ----------------------------
INSERT INTO `vt_countries` VALUES ('1', 'Russia', 'RU', 'RUS', '643', '1', '18');
INSERT INTO `vt_countries` VALUES ('2', 'Ukraine', 'UA', 'UKR', '804', '1', '20');
INSERT INTO `vt_countries` VALUES ('4', 'Australia', 'AU', 'AUS', '36', '1', '10');
INSERT INTO `vt_countries` VALUES ('5', 'Austria', 'AT', 'AUT', '40', '1', '10');
INSERT INTO `vt_countries` VALUES ('6', 'Azerbaijan', 'AZ', 'AZE', '31', '1', '18');
INSERT INTO `vt_countries` VALUES ('7', 'Albania', 'AL', 'ALB', '8', '1', '20');
INSERT INTO `vt_countries` VALUES ('8', 'Algeria', 'DZ', 'DZA', '12', '0', '17');
INSERT INTO `vt_countries` VALUES ('9', 'Angola', 'AO', 'AGO', '24', '1', '10');
INSERT INTO `vt_countries` VALUES ('10', 'Anguilla', 'AI', 'AIA', '660', '1', '0');
INSERT INTO `vt_countries` VALUES ('11', 'Andorra', 'AD', 'AND', '20', '1', '4');
INSERT INTO `vt_countries` VALUES ('12', 'Antigua and Barbuda', 'AG', 'ATG', '28', '1', '0');
INSERT INTO `vt_countries` VALUES ('13', 'Netherlands Antilles', 'AN', 'ANT', '530', '0', '0');
INSERT INTO `vt_countries` VALUES ('14', 'Argentina', 'AR', 'ARG', '32', '0', '21');
INSERT INTO `vt_countries` VALUES ('15', 'Armenia', 'AM', 'ARM', '51', '0', '20');
INSERT INTO `vt_countries` VALUES ('16', 'Aruba', 'AW', 'ABW', '533', '0', '0');
INSERT INTO `vt_countries` VALUES ('17', 'Afghanistan', 'AF', 'AFG', '4', '0', '5');
INSERT INTO `vt_countries` VALUES ('18', 'Bahamas', 'BS', 'BHS', '44', '0', '0');
INSERT INTO `vt_countries` VALUES ('19', 'Bangladesh', 'BD', 'BGD', '50', '0', '15');
INSERT INTO `vt_countries` VALUES ('20', 'Barbados', 'BB', 'BRB', '52', '0', '15');
INSERT INTO `vt_countries` VALUES ('21', 'Bahrain', 'BH', 'BHR', '48', '0', '0');
INSERT INTO `vt_countries` VALUES ('22', 'Belarus', 'BY', 'BLR', '112', '0', '20');
INSERT INTO `vt_countries` VALUES ('23', 'Belize', 'BZ', 'BLZ', '84', '0', '0');
INSERT INTO `vt_countries` VALUES ('24', 'Belgium', 'BE', 'BEL', '56', '0', '21');
INSERT INTO `vt_countries` VALUES ('25', 'Benin', 'BJ', 'BEN', '204', '0', '18');
INSERT INTO `vt_countries` VALUES ('26', 'Bermuda', 'BM', 'BMU', '60', '0', '0');
INSERT INTO `vt_countries` VALUES ('27', 'Bulgaria', 'BG', 'BGR', '100', '0', '20');
INSERT INTO `vt_countries` VALUES ('28', 'Bolivia', 'BO', 'BOL', '68', '0', '13');
INSERT INTO `vt_countries` VALUES ('29', 'Bosnia and Herzegovina', 'BA', 'BIH', '70', '0', '17');
INSERT INTO `vt_countries` VALUES ('30', 'Botswana', 'BW', 'BWA', '72', '0', '12');
INSERT INTO `vt_countries` VALUES ('31', 'Brazil', 'BR', 'BRA', '76', '0', '25');
INSERT INTO `vt_countries` VALUES ('33', 'Brunei Darussalam', 'BN', 'BRN', '96', '0', '0');
INSERT INTO `vt_countries` VALUES ('34', 'Burkina Faso', 'BF', 'BFA', '854', '0', '18');
INSERT INTO `vt_countries` VALUES ('35', 'Burundi', 'BI', 'BDI', '108', '0', '18');
INSERT INTO `vt_countries` VALUES ('36', 'Bhutan', 'BT', 'BTN', '64', '0', '0');
INSERT INTO `vt_countries` VALUES ('37', 'Wallis and Futuna', 'WF', 'WLF', '876', '0', '0');
INSERT INTO `vt_countries` VALUES ('38', 'Vanuatu', 'VU', 'VUT', '548', '0', '0');
INSERT INTO `vt_countries` VALUES ('39', 'United Kingdom', 'GB', 'GBR', '826', '0', '20');
INSERT INTO `vt_countries` VALUES ('40', 'Hungary', 'HU', 'HUN', '348', '0', '27');
INSERT INTO `vt_countries` VALUES ('41', 'Venezuela', 'VE', 'VEN', '862', '0', '12');
INSERT INTO `vt_countries` VALUES ('42', 'East Timor', 'TL', '', '0', '0', '0');
INSERT INTO `vt_countries` VALUES ('43', 'Vietnam', 'VN', 'VNM', '704', '0', '10');
INSERT INTO `vt_countries` VALUES ('44', 'Gabon', 'GA', 'GAB', '266', '0', '18');
INSERT INTO `vt_countries` VALUES ('45', 'Haiti', 'HT', 'HTI', '332', '0', '0');
INSERT INTO `vt_countries` VALUES ('46', 'Guyana', 'GY', 'GUY', '328', '0', '16');
INSERT INTO `vt_countries` VALUES ('47', 'Gambia', 'GM', 'GMB', '270', '0', '0');
INSERT INTO `vt_countries` VALUES ('48', 'Ghana', 'GH', 'GHA', '288', '0', '0');
INSERT INTO `vt_countries` VALUES ('49', 'Guadeloupe', 'GP', 'GLP', '312', '0', '0');
INSERT INTO `vt_countries` VALUES ('50', 'Guatemala', 'GT', 'GTM', '320', '0', '12');
INSERT INTO `vt_countries` VALUES ('51', 'Guinea', 'GN', 'GIN', '324', '0', '0');
INSERT INTO `vt_countries` VALUES ('52', 'Guinea-Bissau', 'GW', 'GNB', '624', '0', '0');
INSERT INTO `vt_countries` VALUES ('53', 'Germany', 'DE', 'DEU', '276', '0', '19');
INSERT INTO `vt_countries` VALUES ('55', 'Gibraltar', 'GI', 'GIB', '292', '0', '0');
INSERT INTO `vt_countries` VALUES ('56', 'Honduras', 'HN', 'HND', '340', '0', '0');
INSERT INTO `vt_countries` VALUES ('57', 'Hong Kong', 'HK', 'HKG', '344', '0', '0');
INSERT INTO `vt_countries` VALUES ('58', 'Grenada', 'GD', 'GRD', '308', '0', '0');
INSERT INTO `vt_countries` VALUES ('59', 'Greenland', 'GL', 'GRL', '304', '0', '0');
INSERT INTO `vt_countries` VALUES ('60', 'Greece', 'GR', 'GRC', '300', '0', '23');
INSERT INTO `vt_countries` VALUES ('61', 'Georgia', 'GE', 'GEO', '268', '0', '18');
INSERT INTO `vt_countries` VALUES ('62', 'Denmark', 'DK', 'DNK', '208', '0', '25');
INSERT INTO `vt_countries` VALUES ('64', 'Djibouti', 'DJ', 'DJI', '262', '0', '0');
INSERT INTO `vt_countries` VALUES ('65', 'Dominican Republic', 'DO', 'DOM', '214', '0', '0');
INSERT INTO `vt_countries` VALUES ('66', 'Egypt', 'EG', 'EGY', '818', '0', '10');
INSERT INTO `vt_countries` VALUES ('67', 'Zambia', 'ZM', 'ZMB', '894', '0', '18');
INSERT INTO `vt_countries` VALUES ('68', 'Western Sahara', 'EH', 'ESH', '732', '0', '0');
INSERT INTO `vt_countries` VALUES ('69', 'Zimbabwe', 'ZW', 'ZWE', '716', '0', '0');
INSERT INTO `vt_countries` VALUES ('70', 'Israel', 'IL', 'ISR', '376', '0', '16');
INSERT INTO `vt_countries` VALUES ('71', 'India', 'IN', 'IND', '356', '0', '13');
INSERT INTO `vt_countries` VALUES ('72', 'Indonesia', 'ID', 'IDN', '360', '0', '10');
INSERT INTO `vt_countries` VALUES ('73', 'Jordan', 'JO', 'JOR', '400', '0', '16');
INSERT INTO `vt_countries` VALUES ('74', 'Iraq', 'IQ', 'IRQ', '368', '0', '0');
INSERT INTO `vt_countries` VALUES ('75', 'Iran', 'IR', 'IRN', '364', '0', '10');
INSERT INTO `vt_countries` VALUES ('76', 'Ireland', 'IE', 'IRL', '372', '0', '21');
INSERT INTO `vt_countries` VALUES ('77', 'Iceland', 'IS', 'ISL', '352', '0', '26');
INSERT INTO `vt_countries` VALUES ('78', 'Spain', 'ES', 'ESP', '724', '0', '18');
INSERT INTO `vt_countries` VALUES ('79', 'Italy', 'IT', 'ITA', '380', '0', '21');
INSERT INTO `vt_countries` VALUES ('80', 'Yemen', 'YE', 'YEM', '887', '0', '0');
INSERT INTO `vt_countries` VALUES ('81', 'Cape Verde', 'CV', 'CPV', '132', '0', '15');
INSERT INTO `vt_countries` VALUES ('82', 'Kazakhstan', 'KZ', 'KAZ', '398', '0', '12');
INSERT INTO `vt_countries` VALUES ('83', 'Cambodia', 'KH', 'KHM', '116', '0', '10');
INSERT INTO `vt_countries` VALUES ('84', 'Cameroon', 'CM', 'CMR', '120', '0', '19');
INSERT INTO `vt_countries` VALUES ('85', 'Canada', 'CA', 'CAN', '124', '0', '10');
INSERT INTO `vt_countries` VALUES ('86', 'Qatar', 'QA', 'QAT', '634', '0', '0');
INSERT INTO `vt_countries` VALUES ('87', 'Kenya', 'KE', 'KEN', '404', '0', '0');
INSERT INTO `vt_countries` VALUES ('88', 'Cyprus', 'CY', 'CYP', '196', '0', '15');
INSERT INTO `vt_countries` VALUES ('89', 'Kiribati', 'KI', 'KIR', '296', '0', '0');
INSERT INTO `vt_countries` VALUES ('90', 'China', 'CN', 'CHN', '156', '0', '17');
INSERT INTO `vt_countries` VALUES ('91', 'Colombia', 'CO', 'COL', '170', '0', '16');
INSERT INTO `vt_countries` VALUES ('92', 'Comoros', 'KM', 'COM', '174', '0', '0');
INSERT INTO `vt_countries` VALUES ('95', 'Costa Rica', 'CR', 'CRI', '188', '0', '13');
INSERT INTO `vt_countries` VALUES ('96', 'Cote D\'Ivoire', 'CI', 'CIV', '384', '0', '0');
INSERT INTO `vt_countries` VALUES ('97', 'Cuba', 'CU', 'CUB', '192', '0', '20');
INSERT INTO `vt_countries` VALUES ('98', 'Kuwait', 'KW', 'KWT', '414', '0', '0');
INSERT INTO `vt_countries` VALUES ('99', 'Cook Islands', 'CK', 'COK', '184', '0', '0');
INSERT INTO `vt_countries` VALUES ('100', 'Kyrgyzstan', 'KG', 'KGZ', '417', '0', '0');
INSERT INTO `vt_countries` VALUES ('101', 'Laos', 'LA', 'LAO', '418', '0', '0');
INSERT INTO `vt_countries` VALUES ('102', 'Latvia', 'LV', 'LVA', '428', '0', '22');
INSERT INTO `vt_countries` VALUES ('103', 'Lesotho', 'LS', 'LSO', '426', '0', '0');
INSERT INTO `vt_countries` VALUES ('104', 'Liberia', 'LR', 'LBR', '430', '0', '0');
INSERT INTO `vt_countries` VALUES ('105', 'Lebanon', 'LB', 'LBN', '422', '0', '10');
INSERT INTO `vt_countries` VALUES ('106', 'Libya', 'LY', 'LBY', '434', '0', '0');
INSERT INTO `vt_countries` VALUES ('107', 'Lithuania', 'LT', 'LTU', '440', '0', '21');
INSERT INTO `vt_countries` VALUES ('108', 'Liechtenstein', 'LI', 'LIE', '438', '0', '0');
INSERT INTO `vt_countries` VALUES ('109', 'Luxembourg', 'LU', 'LUX', '442', '0', '15');
INSERT INTO `vt_countries` VALUES ('110', 'Mauritius', 'MU', 'MUS', '480', '0', '15');
INSERT INTO `vt_countries` VALUES ('111', 'Mauritania', 'MR', 'MRT', '478', '0', '0');
INSERT INTO `vt_countries` VALUES ('112', 'Madagascar', 'MG', 'MDG', '450', '0', '0');
INSERT INTO `vt_countries` VALUES ('113', 'Macedonia', 'MK', 'MKD', '807', '0', '0');
INSERT INTO `vt_countries` VALUES ('114', 'Malawi', 'MW', 'MWI', '454', '0', '0');
INSERT INTO `vt_countries` VALUES ('115', 'Malaysia', 'MY', 'MYS', '458', '0', '0');
INSERT INTO `vt_countries` VALUES ('116', 'Mali', 'ML', 'MLI', '466', '0', '0');
INSERT INTO `vt_countries` VALUES ('117', 'Maldives', 'MV', 'MDV', '462', '0', '6');
INSERT INTO `vt_countries` VALUES ('118', 'Malta', 'MT', 'MLT', '470', '0', '18');
INSERT INTO `vt_countries` VALUES ('119', 'Martinique', 'MQ', 'MTQ', '474', '0', '0');
INSERT INTO `vt_countries` VALUES ('120', 'Mexico', 'MX', 'MEX', '484', '0', '16');
INSERT INTO `vt_countries` VALUES ('121', 'Mozambique', 'MZ', 'MOZ', '508', '0', '0');
INSERT INTO `vt_countries` VALUES ('122', 'Moldova', 'MD', 'MDA', '498', '0', '0');
INSERT INTO `vt_countries` VALUES ('123', 'Monaco', 'MC', 'MCO', '492', '0', '20');
INSERT INTO `vt_countries` VALUES ('124', 'Mongolia', 'MN', 'MNG', '496', '0', '0');
INSERT INTO `vt_countries` VALUES ('125', 'Morocco', 'MA', 'MAR', '504', '0', '20');
INSERT INTO `vt_countries` VALUES ('128', 'Namibia', 'NA', 'NAM', '516', '0', '0');
INSERT INTO `vt_countries` VALUES ('129', 'Nauru', 'NR', 'NRU', '520', '0', '0');
INSERT INTO `vt_countries` VALUES ('130', 'Nepal', 'NP', 'NPL', '524', '0', '13');
INSERT INTO `vt_countries` VALUES ('131', 'Niger', 'NE', 'NER', '562', '0', '0');
INSERT INTO `vt_countries` VALUES ('132', 'Nigeria', 'NG', 'NGA', '566', '0', '0');
INSERT INTO `vt_countries` VALUES ('133', 'Netherlands', 'NL', 'NLD', '528', '0', '19');
INSERT INTO `vt_countries` VALUES ('134', 'Nicaragua', 'NI', 'NIC', '558', '0', '0');
INSERT INTO `vt_countries` VALUES ('135', 'New Zealand', 'NZ', 'NZL', '554', '0', '15');
INSERT INTO `vt_countries` VALUES ('136', 'New Caledonia', 'NC', 'NCL', '540', '0', '0');
INSERT INTO `vt_countries` VALUES ('137', 'Norway', 'NO', 'NOR', '578', '0', '25');
INSERT INTO `vt_countries` VALUES ('138', 'Norfolk Island', 'NF', 'NFK', '574', '0', '0');
INSERT INTO `vt_countries` VALUES ('139', 'United Arab Emirates', 'AE', 'ARE', '784', '0', '0');
INSERT INTO `vt_countries` VALUES ('140', 'Oman', 'OM', 'OMN', '512', '0', '0');
INSERT INTO `vt_countries` VALUES ('141', 'Pakistan', 'PK', 'PAK', '586', '0', '17');
INSERT INTO `vt_countries` VALUES ('142', 'Panama', 'PA', 'PAN', '591', '0', '7');
INSERT INTO `vt_countries` VALUES ('143', 'Papua New Guinea', 'PG', 'PNG', '598', '0', '0');
INSERT INTO `vt_countries` VALUES ('144', 'Paraguay', 'PY', 'PRY', '600', '0', '0');
INSERT INTO `vt_countries` VALUES ('145', 'Peru', 'PE', 'PER', '604', '0', '16');
INSERT INTO `vt_countries` VALUES ('147', 'Poland', 'PL', 'POL', '616', '0', '23');
INSERT INTO `vt_countries` VALUES ('148', 'Portugal', 'PT', 'PRT', '620', '0', '23');
INSERT INTO `vt_countries` VALUES ('149', 'Puerto Rico', 'PR', 'PRI', '630', '0', '0');
INSERT INTO `vt_countries` VALUES ('150', 'Reunion', 'RE', 'REU', '638', '0', '0');
INSERT INTO `vt_countries` VALUES ('151', 'Rwanda', 'RW', 'RWA', '646', '0', '0');
INSERT INTO `vt_countries` VALUES ('152', 'Romania', 'RO', 'ROM', '642', '0', '24');
INSERT INTO `vt_countries` VALUES ('153', 'United States', 'US', 'USA', '840', '0', '0');
INSERT INTO `vt_countries` VALUES ('154', 'El Salvador', 'SV', 'SLV', '222', '0', '13');
INSERT INTO `vt_countries` VALUES ('155', 'Samoa', 'WS', 'WSM', '882', '0', '0');
INSERT INTO `vt_countries` VALUES ('156', 'San Marino', 'SM', 'SMR', '674', '0', '0');
INSERT INTO `vt_countries` VALUES ('157', 'Sao Tome and Principe', 'ST', 'STP', '678', '0', '0');
INSERT INTO `vt_countries` VALUES ('158', 'Saudi Arabia', 'SA', 'SAU', '682', '0', '0');
INSERT INTO `vt_countries` VALUES ('159', 'Swaziland', 'SZ', 'SWZ', '748', '0', '0');
INSERT INTO `vt_countries` VALUES ('160', 'Saint Lucia', 'LC', 'LCA', '662', '0', '0');
INSERT INTO `vt_countries` VALUES ('161', 'Saint Helena', 'SH', 'SHN', '654', '0', '0');
INSERT INTO `vt_countries` VALUES ('163', 'Seychelles', 'SC', 'SYC', '690', '0', '0');
INSERT INTO `vt_countries` VALUES ('164', 'Saint Pierre and Miquelon', 'PM', 'SPM', '666', '0', '0');
INSERT INTO `vt_countries` VALUES ('165', 'Senegal', 'SN', 'SEN', '686', '0', '20');
INSERT INTO `vt_countries` VALUES ('166', 'Saint Kitts and Nevis', 'KN', 'KNA', '659', '0', '0');
INSERT INTO `vt_countries` VALUES ('167', 'Saint Vincent and the Grenadines', 'VC', 'VCT', '670', '0', '0');
INSERT INTO `vt_countries` VALUES ('168', 'Serbia and Montenegro', 'CS', '', '0', '0', '18');
INSERT INTO `vt_countries` VALUES ('169', 'Singapore', 'SG', 'SGP', '702', '0', '7');
INSERT INTO `vt_countries` VALUES ('170', 'Syria', 'SY', 'SYR', '760', '0', '0');
INSERT INTO `vt_countries` VALUES ('171', 'Slovakia', 'SK', 'SVK', '703', '0', '20');
INSERT INTO `vt_countries` VALUES ('172', 'Slovenia', 'SI', 'SVN', '705', '0', '20');
INSERT INTO `vt_countries` VALUES ('173', 'Solomon Islands', 'SB', 'SLB', '90', '0', '0');
INSERT INTO `vt_countries` VALUES ('174', 'Somalia', 'SO', 'SOM', '706', '0', '0');
INSERT INTO `vt_countries` VALUES ('175', 'Sudan', 'SD', 'SDN', '736', '0', '0');
INSERT INTO `vt_countries` VALUES ('176', 'Suriname', 'SR', 'SUR', '740', '0', '0');
INSERT INTO `vt_countries` VALUES ('177', 'Sierra Leone', 'SL', 'SLE', '694', '0', '0');
INSERT INTO `vt_countries` VALUES ('178', 'Tajikistan', 'TJ', 'TJK', '762', '0', '0');
INSERT INTO `vt_countries` VALUES ('179', 'Taiwan', 'TW', 'TWN', '158', '0', '5');
INSERT INTO `vt_countries` VALUES ('180', 'Thailand', 'TH', 'THA', '764', '0', '7');
INSERT INTO `vt_countries` VALUES ('181', 'Tanzania', 'TZ', 'TZA', '834', '1', '0');
INSERT INTO `vt_countries` VALUES ('182', 'Togo', 'TG', 'TGO', '768', '0', '0');
INSERT INTO `vt_countries` VALUES ('183', 'Tokelau', 'TK', 'TKL', '772', '0', '0');
INSERT INTO `vt_countries` VALUES ('184', 'Tonga', 'TO', 'TON', '776', '0', '0');
INSERT INTO `vt_countries` VALUES ('185', 'Trinidad and Tobago', 'TT', 'TTO', '780', '0', '0');
INSERT INTO `vt_countries` VALUES ('186', 'Tuvalu', 'TV', 'TUV', '798', '0', '0');
INSERT INTO `vt_countries` VALUES ('187', 'Tunisia', 'TN', 'TUN', '788', '0', '18');
INSERT INTO `vt_countries` VALUES ('188', 'Turkmenistan', 'TM', 'TKM', '795', '0', '0');
INSERT INTO `vt_countries` VALUES ('189', 'Turks and Caicos Islands', 'TC', 'TCA', '796', '0', '0');
INSERT INTO `vt_countries` VALUES ('190', 'Turkey', 'TR', 'TUR', '792', '0', '18');
INSERT INTO `vt_countries` VALUES ('191', 'Uganda', 'UG', 'UGA', '800', '0', '0');
INSERT INTO `vt_countries` VALUES ('192', 'Uzbekistan', 'UZ', 'UZB', '860', '0', '20');
INSERT INTO `vt_countries` VALUES ('193', 'Uruguay', 'UY', 'URY', '858', '0', '22');
INSERT INTO `vt_countries` VALUES ('194', 'Faroe Islands', 'FO', 'FRO', '234', '0', '0');
INSERT INTO `vt_countries` VALUES ('195', 'Fiji', 'FJ', 'FJI', '242', '0', '0');
INSERT INTO `vt_countries` VALUES ('196', 'Philippines', 'PH', 'PHL', '608', '0', '12');
INSERT INTO `vt_countries` VALUES ('197', 'Finland', 'FI', 'FIN', '246', '0', '23');
INSERT INTO `vt_countries` VALUES ('198', 'France', 'FR', 'FRA', '250', '0', '20');
INSERT INTO `vt_countries` VALUES ('199', 'French Guiana', 'GF', 'GUF', '254', '0', '0');
INSERT INTO `vt_countries` VALUES ('200', 'French Polynesia', 'PF', 'PYF', '258', '0', '0');
INSERT INTO `vt_countries` VALUES ('201', 'Croatia', 'HR', 'HRV', '191', '0', '23');
INSERT INTO `vt_countries` VALUES ('202', 'Chad', 'TD', 'TCD', '148', '0', '0');
INSERT INTO `vt_countries` VALUES ('204', 'Czech Republic', 'CZ', 'CZE', '203', '0', '20');
INSERT INTO `vt_countries` VALUES ('205', 'Chile', 'CL', 'CHL', '152', '0', '19');
INSERT INTO `vt_countries` VALUES ('206', 'Switzerland', 'CH', 'CHE', '756', '0', '8');
INSERT INTO `vt_countries` VALUES ('207', 'Sweden', 'SE', 'SWE', '752', '0', '25');
INSERT INTO `vt_countries` VALUES ('208', 'Sri Lanka', 'LK', 'LKA', '144', '0', '12');
INSERT INTO `vt_countries` VALUES ('209', 'Ecuador', 'EC', 'ECU', '218', '0', '0');
INSERT INTO `vt_countries` VALUES ('210', 'Equatorial Guinea', 'GQ', 'GNQ', '226', '0', '0');
INSERT INTO `vt_countries` VALUES ('211', 'Eritrea', 'ER', 'ERI', '232', '0', '0');
INSERT INTO `vt_countries` VALUES ('212', 'Estonia', 'EE', 'EST', '233', '0', '20');
INSERT INTO `vt_countries` VALUES ('213', 'Ethiopia', 'ET', 'ETH', '231', '0', '0');
INSERT INTO `vt_countries` VALUES ('214', 'South Africa', 'ZA', 'ZAF', '710', '0', '14');
INSERT INTO `vt_countries` VALUES ('215', 'South Korea', 'KR', 'KOR', '410', '0', '0');
INSERT INTO `vt_countries` VALUES ('217', 'Jamaica', 'JM', 'JAM', '388', '0', '18');
INSERT INTO `vt_countries` VALUES ('218', 'Japan', 'JP', 'JPN', '392', '0', '5');

-- ----------------------------
-- Table structure for vt_menus
-- ----------------------------
DROP TABLE IF EXISTS `vt_menus`;
CREATE TABLE `vt_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(20) DEFAULT NULL,
  `lft` int(20) DEFAULT NULL,
  `rght` int(20) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_menu_id` int(20) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_menus
-- ----------------------------
INSERT INTO `vt_menus` VALUES ('68', null, '1', '2', 'Home', '', '/', '2', '2016-02-09 18:12:24', '1');
INSERT INTO `vt_menus` VALUES ('69', null, '1', '2', 'About', 'about', '/about', '2', '2016-02-09 18:12:45', '1');
INSERT INTO `vt_menus` VALUES ('70', null, '1', '2', 'Guarantee', 'guarantee', '/guarantee', '2', '2016-02-09 18:13:09', '1');
INSERT INTO `vt_menus` VALUES ('71', null, '1', '2', 'FAQ', 'faq', '/faq', '2', '2016-02-09 18:13:30', '1');
INSERT INTO `vt_menus` VALUES ('72', null, '1', '2', 'Privacy', 'privacy', '/privacy', '2', '2016-02-09 18:13:47', '1');
INSERT INTO `vt_menus` VALUES ('73', null, '3', '4', 'Terms', 'terms', '/terms', '2', '2016-02-09 18:14:04', '1');
INSERT INTO `vt_menus` VALUES ('74', null, '5', '6', 'Contact Us', 'contact', '/contact', '2', '2016-02-09 18:16:26', '1');
INSERT INTO `vt_menus` VALUES ('75', null, '7', '8', 'Sell Gift Cartds', 'sell-gift-cartds', '/sell-gift-cartds', '1', '2016-02-09 18:21:52', '1');
INSERT INTO `vt_menus` VALUES ('76', null, '9', '10', 'Buy Gift Cards', 'buy-gift-cards', '/buy-gift-cards', '1', '2016-02-09 18:22:08', '1');
INSERT INTO `vt_menus` VALUES ('77', null, '11', '12', 'Card Balance	', 'card-balance', '/card-balance', '1', '2016-02-09 18:23:18', '1');

-- ----------------------------
-- Table structure for vt_options
-- ----------------------------
DROP TABLE IF EXISTS `vt_options`;
CREATE TABLE `vt_options` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` text,
  `group` varchar(255) NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vt_options
-- ----------------------------
INSERT INTO `vt_options` VALUES ('1', 'tumblr', 'https://tumblr.com', 'social', '2015-09-29 10:51:29');
INSERT INTO `vt_options` VALUES ('2', 'twitter', 'https://twitter.com', 'social', '2016-02-02 16:47:20');
INSERT INTO `vt_options` VALUES ('8', 'google', 'https://www.google.com', 'social', '2015-06-15 18:33:53');
INSERT INTO `vt_options` VALUES ('16', 'youtube', 'https://www.youtube.com/', 'social', '2015-03-31 16:20:09');
INSERT INTO `vt_options` VALUES ('19', 'phone', '', 'info', '2016-02-09 16:58:48');
INSERT INTO `vt_options` VALUES ('21', 'fax', '', 'info', '2016-02-09 16:58:42');
INSERT INTO `vt_options` VALUES ('22', 'copyright', '&copy; 2005-2015', 'info', '2016-02-09 16:57:24');
INSERT INTO `vt_options` VALUES ('23', 'address', '', 'info', '2016-02-09 16:58:33');
INSERT INTO `vt_options` VALUES ('24', 'email', '', 'info', '2016-02-09 16:58:26');
INSERT INTO `vt_options` VALUES ('29', 'pinterest', 'pinterest.com', 'social', '2016-02-09 16:58:18');

-- ----------------------------
-- Table structure for vt_order_items
-- ----------------------------
DROP TABLE IF EXISTS `vt_order_items`;
CREATE TABLE `vt_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `properties` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_order_items
-- ----------------------------
INSERT INTO `vt_order_items` VALUES ('1', '6', '16', '2', '{\"size\":1,\"color\":3,\"Coordinating compnents\":\"img 1\"}');
INSERT INTO `vt_order_items` VALUES ('2', '6', '17', '1', '{\"size\":4,\"color\":3,\"Coordinating compnents\":\"img 1\"}');
INSERT INTO `vt_order_items` VALUES ('3', '6', '18', '3', '{\"size\":1,\"color\":3,\"Coordinating compnents\":\"img 1\"}');
INSERT INTO `vt_order_items` VALUES ('4', '6', '15', '4', '{\"size\":1,\"color\":3,\"dd compnents\":\"img 1\"}');

-- ----------------------------
-- Table structure for vt_order_statuses
-- ----------------------------
DROP TABLE IF EXISTS `vt_order_statuses`;
CREATE TABLE `vt_order_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_order_statuses
-- ----------------------------
INSERT INTO `vt_order_statuses` VALUES ('1', 'New order');
INSERT INTO `vt_order_statuses` VALUES ('2', 'Padding confirmation');
INSERT INTO `vt_order_statuses` VALUES ('3', 'Competed');

-- ----------------------------
-- Table structure for vt_orders
-- ----------------------------
DROP TABLE IF EXISTS `vt_orders`;
CREATE TABLE `vt_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `comment` text,
  `order_status_id` int(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_orders
-- ----------------------------

-- ----------------------------
-- Table structure for vt_pages
-- ----------------------------
DROP TABLE IF EXISTS `vt_pages`;
CREATE TABLE `vt_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL DEFAULT 'default',
  `banner` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `short_content` text NOT NULL,
  `content` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `undeleted` tinyint(1) NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text,
  `meta_description` text,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_pages
-- ----------------------------
INSERT INTO `vt_pages` VALUES ('1', 'Home Page', 'default', 'Home Page Banner', '', '', '', '1', '1', 'home', '', 'meta keys', 'meta descs', '2016-02-09 18:09:49', '2016-01-22 00:00:00');
INSERT INTO `vt_pages` VALUES ('2', 'About Page', 'default', 'About Page', '', '', '', '1', '1', 'about', '', 'meta keys', 'meta descs', '2016-02-09 18:09:41', '2016-01-22 00:00:00');
INSERT INTO `vt_pages` VALUES ('3', 'Buy Gift Cards', 'default', 'Buy Gift Cards', '', '', '', '1', '1', 'buy-gift-cards', 'meta keys', 'meta keys', 'meta descs', '2016-02-09 18:18:46', '2016-01-22 00:00:00');
INSERT INTO `vt_pages` VALUES ('4', 'Card Balance', 'default', 'card-balance', '', '', '', '1', '0', 'card-balance', '', 'meta keys', 'meta descs', '2016-02-09 18:42:25', '2016-01-22 00:00:00');
INSERT INTO `vt_pages` VALUES ('5', 'Bulk Gift Cards', 'default', 'Bulk Gift Cards', '', '', '', '1', '1', 'bulk-gift-cards', '', 'meta keys', 'meta descs', '2016-02-09 18:20:02', '2016-01-22 00:00:00');
INSERT INTO `vt_pages` VALUES ('6', 'Guarantee and Returns', 'default', 'Guarantee and Returns', '', '', '', '1', '1', 'guarantee', '', 'meta keys', 'meta descs', '2016-02-09 18:09:37', '2016-01-22 00:00:00');
INSERT INTO `vt_pages` VALUES ('7', 'FAQ', 'default', 'FAQ', '', '', '', '1', '1', 'faq', '', 'meta keys', 'meta descs', '2016-02-09 18:09:36', '2016-01-22 00:00:00');
INSERT INTO `vt_pages` VALUES ('8', 'Privacy', 'default', 'Privacy', '', '', '', '1', '1', 'privacy', '', 'meta keys', 'meta descs', '2016-02-09 18:09:34', '2016-01-22 00:00:00');
INSERT INTO `vt_pages` VALUES ('9', 'Terms and Conditions', 'default', 'Terms and ConditionsQ', '', '', '', '1', '1', 'terms', '', 'meta keys', 'meta descs', '2016-02-09 18:09:32', '2016-01-22 00:00:00');

-- ----------------------------
-- Table structure for vt_philosophies
-- ----------------------------
DROP TABLE IF EXISTS `vt_philosophies`;
CREATE TABLE `vt_philosophies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_philosophies
-- ----------------------------
INSERT INTO `vt_philosophies` VALUES ('1', 'Competitive Pricing', '/img/ic-7.png', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO `vt_philosophies` VALUES ('2', 'Prompt Delivery', '/img/ic-8.png', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO `vt_philosophies` VALUES ('3', 'Customer Satisfaction', '/img/ic-9.png', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- ----------------------------
-- Table structure for vt_product_images
-- ----------------------------
DROP TABLE IF EXISTS `vt_product_images`;
CREATE TABLE `vt_product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_product_images
-- ----------------------------
INSERT INTO `vt_product_images` VALUES ('25', '18', '/uploads/imgs/bg-3.png');

-- ----------------------------
-- Table structure for vt_products
-- ----------------------------
DROP TABLE IF EXISTS `vt_products`;
CREATE TABLE `vt_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_number` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `sell` decimal(10,2) DEFAULT NULL,
  `listed_on` date DEFAULT NULL,
  `status` smallint(1) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `modified` datetime NOT NULL,
  `sold_on` date DEFAULT NULL,
  `funds` decimal(10,2) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_products
-- ----------------------------
INSERT INTO `vt_products` VALUES ('1', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('2', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('3', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('4', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('5', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('6', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('7', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('8', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('9', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('10', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('11', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('12', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('13', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('14', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('15', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('16', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('17', null, null, null, null, null, null, '/img/demo/img-9.jpg', '2016-01-28 00:00:00', null, null, null);
INSERT INTO `vt_products` VALUES ('18', '234234', '20.00', '20', '20.00', '1990-12-12', '1', '/uploads/imgs/5aca4b926d35.jpg', '2016-02-09 20:34:32', '1990-12-12', '323.00', 'asdf');
INSERT INTO `vt_products` VALUES ('19', 'asfd', '323.00', '32', '23.00', '1990-12-12', '0', '/uploads/imgs/5aca4b926d35.jpg', '2016-02-09 20:36:36', '1990-12-12', '32.00', 'sadf');

-- ----------------------------
-- Table structure for vt_services
-- ----------------------------
DROP TABLE IF EXISTS `vt_services`;
CREATE TABLE `vt_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) DEFAULT NULL,
  `text` text,
  `img` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_services
-- ----------------------------

-- ----------------------------
-- Table structure for vt_site_menus
-- ----------------------------
DROP TABLE IF EXISTS `vt_site_menus`;
CREATE TABLE `vt_site_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_site_menus
-- ----------------------------
INSERT INTO `vt_site_menus` VALUES ('1', 'Header', 'header', null, '1', '2', null, null, '1');
INSERT INTO `vt_site_menus` VALUES ('2', 'Footer', 'footer', null, '3', '4', null, null, '1');

-- ----------------------------
-- Table structure for vt_states
-- ----------------------------
DROP TABLE IF EXISTS `vt_states`;
CREATE TABLE `vt_states` (
  `initials` char(2) NOT NULL DEFAULT '',
  `name` char(30) NOT NULL DEFAULT '',
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`initials`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_states
-- ----------------------------
INSERT INTO `vt_states` VALUES ('AB', 'Alberta', '53');
INSERT INTO `vt_states` VALUES ('AK', 'Alaska', '2');
INSERT INTO `vt_states` VALUES ('AL', 'Alabama', '1');
INSERT INTO `vt_states` VALUES ('AR', 'Arkansas', '4');
INSERT INTO `vt_states` VALUES ('AZ', 'Arizona', '3');
INSERT INTO `vt_states` VALUES ('BC', 'British Columbia', '54');
INSERT INTO `vt_states` VALUES ('CA', 'California', '5');
INSERT INTO `vt_states` VALUES ('CO', 'Colorado', '6');
INSERT INTO `vt_states` VALUES ('CT', 'Connecticut', '7');
INSERT INTO `vt_states` VALUES ('DC', 'Washington, DC', '49');
INSERT INTO `vt_states` VALUES ('DE', 'Delaware', '8');
INSERT INTO `vt_states` VALUES ('FL', 'Florida', '9');
INSERT INTO `vt_states` VALUES ('GA', 'Georgia', '10');
INSERT INTO `vt_states` VALUES ('HI', 'Hawaii', '11');
INSERT INTO `vt_states` VALUES ('IA', 'Iowa', '15');
INSERT INTO `vt_states` VALUES ('ID', 'Idaho', '12');
INSERT INTO `vt_states` VALUES ('IL', 'Illinois', '13');
INSERT INTO `vt_states` VALUES ('IN', 'Indiana', '14');
INSERT INTO `vt_states` VALUES ('KS', 'Kansas', '16');
INSERT INTO `vt_states` VALUES ('KY', 'Kentucky', '17');
INSERT INTO `vt_states` VALUES ('LA', 'Louisiana', '18');
INSERT INTO `vt_states` VALUES ('MA', 'Massachusetts', '21');
INSERT INTO `vt_states` VALUES ('MB', 'Manitoba', '55');
INSERT INTO `vt_states` VALUES ('MD', 'Maryland', '20');
INSERT INTO `vt_states` VALUES ('ME', 'Maine', '19');
INSERT INTO `vt_states` VALUES ('MI', 'Michigan', '22');
INSERT INTO `vt_states` VALUES ('MN', 'Minnesota', '23');
INSERT INTO `vt_states` VALUES ('MO', 'Missouri', '25');
INSERT INTO `vt_states` VALUES ('MS', 'Mississippi', '24');
INSERT INTO `vt_states` VALUES ('MT', 'Montana', '26');
INSERT INTO `vt_states` VALUES ('NB', 'New Brunswick', '56');
INSERT INTO `vt_states` VALUES ('NC', 'North Carolina', '33');
INSERT INTO `vt_states` VALUES ('ND', 'North Dakota', '34');
INSERT INTO `vt_states` VALUES ('NE', 'Nebraska', '27');
INSERT INTO `vt_states` VALUES ('NH', 'New Hampshire', '29');
INSERT INTO `vt_states` VALUES ('NJ', 'New Jersey', '30');
INSERT INTO `vt_states` VALUES ('NL', 'Newfoundland & Labrador', '57');
INSERT INTO `vt_states` VALUES ('NM', 'New Mexico', '31');
INSERT INTO `vt_states` VALUES ('NS', 'Nova Scotia', '59');
INSERT INTO `vt_states` VALUES ('NT', 'Northwest Territories', '58');
INSERT INTO `vt_states` VALUES ('NU', 'Nunavut', '60');
INSERT INTO `vt_states` VALUES ('NV', 'Nevada', '28');
INSERT INTO `vt_states` VALUES ('NY', 'New York', '32');
INSERT INTO `vt_states` VALUES ('OH', 'Ohio', '35');
INSERT INTO `vt_states` VALUES ('OK', 'Oklahoma', '36');
INSERT INTO `vt_states` VALUES ('ON', 'Ontario', '61');
INSERT INTO `vt_states` VALUES ('OR', 'Oregon', '37');
INSERT INTO `vt_states` VALUES ('PA', 'Pennsylvania', '38');
INSERT INTO `vt_states` VALUES ('PE', 'Prince Edward Island', '62');
INSERT INTO `vt_states` VALUES ('PR', 'Puerto Rico', '39');
INSERT INTO `vt_states` VALUES ('QC', 'Quebec', '63');
INSERT INTO `vt_states` VALUES ('RI', 'Rhode Island', '40');
INSERT INTO `vt_states` VALUES ('SC', 'South Carolina', '41');
INSERT INTO `vt_states` VALUES ('SD', 'South Dakota', '42');
INSERT INTO `vt_states` VALUES ('SK', 'Saskatchewan', '65');
INSERT INTO `vt_states` VALUES ('TN', 'Tennessee', '43');
INSERT INTO `vt_states` VALUES ('TX', 'Texas', '44');
INSERT INTO `vt_states` VALUES ('UT', 'Utah', '45');
INSERT INTO `vt_states` VALUES ('VA', 'Virginia', '47');
INSERT INTO `vt_states` VALUES ('VT', 'Vermont', '46');
INSERT INTO `vt_states` VALUES ('WA', 'Washington', '48');
INSERT INTO `vt_states` VALUES ('WI', 'Wisconsin', '51');
INSERT INTO `vt_states` VALUES ('WV', 'West Virginia', '50');
INSERT INTO `vt_states` VALUES ('WY', 'Wyoming', '52');
INSERT INTO `vt_states` VALUES ('YT', 'Yukon Territories', '64');

-- ----------------------------
-- Table structure for vt_subscribes
-- ----------------------------
DROP TABLE IF EXISTS `vt_subscribes`;
CREATE TABLE `vt_subscribes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_subscribes
-- ----------------------------
INSERT INTO `vt_subscribes` VALUES ('1', '', '2015-12-17 18:49:49');

-- ----------------------------
-- Table structure for vt_testimonials
-- ----------------------------
DROP TABLE IF EXISTS `vt_testimonials`;
CREATE TABLE `vt_testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` smallint(6) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vt_testimonials
-- ----------------------------
INSERT INTO `vt_testimonials` VALUES ('1', 'asdf32', '3', 'aaaaa', '1999-02-02 02:32:33', '2016-02-09 18:45:30', '2016-02-09 18:51:45');
INSERT INTO `vt_testimonials` VALUES ('2', 'asdf', '3', 'sadfasd', '1999-02-02 02:32:33', '2016-02-09 18:46:06', '2016-02-09 18:46:06');

-- ----------------------------
-- Table structure for vt_types
-- ----------------------------
DROP TABLE IF EXISTS `vt_types`;
CREATE TABLE `vt_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_types
-- ----------------------------
INSERT INTO `vt_types` VALUES ('1', 'type 1');
INSERT INTO `vt_types` VALUES ('2', 'type 2');

-- ----------------------------
-- Table structure for vt_user_infos
-- ----------------------------
DROP TABLE IF EXISTS `vt_user_infos`;
CREATE TABLE `vt_user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `modified` datetime NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vt_user_infos
-- ----------------------------
INSERT INTO `vt_user_infos` VALUES ('1', '1', 'asdf', 'aasfd', '2016-02-09 19:48:41', 'sadf', null, 'asdf', '32432', '23423');

-- ----------------------------
-- Table structure for vt_users
-- ----------------------------
DROP TABLE IF EXISTS `vt_users`;
CREATE TABLE `vt_users` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `last_login` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1122 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vt_users
-- ----------------------------
INSERT INTO `vt_users` VALUES ('1', 'admin@admin.com', 'admin', 'e4cfd2942bd6f131c1efe6ce49416a1da43c635c', '1', '1', '2015-12-03 11:31:17', '2015-10-29 00:00:00', '2016-02-09 19:48:41');
