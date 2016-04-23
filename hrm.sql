-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2016 at 01:48 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hrm`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `dashboard_get_subunit_parent_id`(
                  id INT
                ) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
                SELECT (SELECT t2.id 
                               FROM ohrm_subunit t2 
                               WHERE t2.lft < t1.lft AND t2.rgt > t1.rgt    
                               ORDER BY t2.rgt-t1.rgt ASC LIMIT 1) INTO @parent
                FROM ohrm_subunit t1 WHERE t1.id = id;

                RETURN @parent;

                END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `abstract_display_field`
--

CREATE TABLE IF NOT EXISTS `abstract_display_field` (
`id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_sortable` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `element_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_property` text COLLATE utf8_unicode_ci NOT NULL,
  `width` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_exportable` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_alignment_style` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL,
  `display_field_group_id` bigint(20) unsigned DEFAULT NULL,
  `default_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_config`
--

CREATE TABLE IF NOT EXISTS `hs_hr_config` (
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(512) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_config`
--

INSERT INTO `hs_hr_config` (`key`, `value`) VALUES
('admin.default_workshift_end_time', '17:00'),
('admin.default_workshift_start_time', '09:00'),
('admin.localization.default_date_format', 'd-m-Y'),
('admin.localization.default_language', 'vi_VN'),
('admin.localization.use_browser_language', 'No'),
('admin.product_type', 'os'),
('attendanceEmpEditSubmitted', 'No'),
('attendanceSupEditSubmitted', 'No'),
('authorize_user_role_manager_class', 'BasicUserRoleManager'),
('beacon.activation_acceptance_status', 'on'),
('beacon.activiation_status', 'off'),
('beacon.company_name', ''),
('beacon.flash_period', '120'),
('beacon.lock', 'unlocked'),
('beacon.next_flash_time', '0000-00-00'),
('beacon.uuid', '0'),
('csrf_secret', 'isrbas153jag81id0tejgjjh6qerlgtq10qrg71si63981m81289'),
('domain.name', 'localhost'),
('hsp_accrued_last_updated', '0000-00-00'),
('hsp_current_plan', '0'),
('hsp_used_last_updated', '0000-00-00'),
('include_supervisor_chain', 'No'),
('ldap_domain_name', ''),
('ldap_port', ''),
('ldap_server', ''),
('ldap_status', ''),
('leave.entitlement_consumption_algorithm', 'FIFOEntitlementConsumptionStrategy'),
('leave.include_pending_leave_in_balance', '1'),
('leave.leavePeriodStatus', '1'),
('leave.work_schedule_implementation', 'BasicWorkSchedule'),
('leave_period_defined', 'Yes'),
('openId.provider.added', 'off'),
('pim_show_deprecated_fields', '0'),
('report.mysql_group_concat_max_len', '2048'),
('showSIN', '0'),
('showSSN', '0'),
('showTaxExemptions', '0'),
('themeName', 'default'),
('timesheet_period_and_start_date', '<TimesheetPeriod><PeriodType>Weekly</PeriodType><ClassName>WeeklyTimesheetPeriod</ClassName><StartDate>1</StartDate><Heading>Week</Heading></TimesheetPeriod>'),
('timesheet_period_set', 'Yes'),
('timesheet_time_format', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_country`
--

CREATE TABLE IF NOT EXISTS `hs_hr_country` (
  `cou_code` char(2) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `cou_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_country`
--

INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES
('AD', 'ANDORRA', 'Andorra', 'AND', 20),
('AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
('AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
('AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
('AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
('AL', 'ALBANIA', 'Albania', 'ALB', 8),
('AM', 'ARMENIA', 'Armenia', 'ARM', 51),
('AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
('AO', 'ANGOLA', 'Angola', 'AGO', 24),
('AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
('AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
('AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
('AT', 'AUSTRIA', 'Austria', 'AUT', 40),
('AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
('AW', 'ARUBA', 'Aruba', 'ABW', 533),
('AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
('BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
('BB', 'BARBADOS', 'Barbados', 'BRB', 52),
('BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
('BE', 'BELGIUM', 'Belgium', 'BEL', 56),
('BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
('BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
('BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
('BI', 'BURUNDI', 'Burundi', 'BDI', 108),
('BJ', 'BENIN', 'Benin', 'BEN', 204),
('BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
('BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
('BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
('BR', 'BRAZIL', 'Brazil', 'BRA', 76),
('BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
('BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
('BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
('BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
('BY', 'BELARUS', 'Belarus', 'BLR', 112),
('BZ', 'BELIZE', 'Belize', 'BLZ', 84),
('CA', 'CANADA', 'Canada', 'CAN', 124),
('CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
('CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
('CG', 'CONGO', 'Congo', 'COG', 178),
('CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
('CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
('CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
('CL', 'CHILE', 'Chile', 'CHL', 152),
('CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
('CN', 'CHINA', 'China', 'CHN', 156),
('CO', 'COLOMBIA', 'Colombia', 'COL', 170),
('CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
('CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
('CU', 'CUBA', 'Cuba', 'CUB', 192),
('CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
('CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
('CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
('CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
('DE', 'GERMANY', 'Germany', 'DEU', 276),
('DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
('DK', 'DENMARK', 'Denmark', 'DNK', 208),
('DM', 'DOMINICA', 'Dominica', 'DMA', 212),
('DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
('DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
('EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
('EE', 'ESTONIA', 'Estonia', 'EST', 233),
('EG', 'EGYPT', 'Egypt', 'EGY', 818),
('EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
('ER', 'ERITREA', 'Eritrea', 'ERI', 232),
('ES', 'SPAIN', 'Spain', 'ESP', 724),
('ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
('FI', 'FINLAND', 'Finland', 'FIN', 246),
('FJ', 'FIJI', 'Fiji', 'FJI', 242),
('FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
('FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
('FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
('FR', 'FRANCE', 'France', 'FRA', 250),
('GA', 'GABON', 'Gabon', 'GAB', 266),
('GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
('GD', 'GRENADA', 'Grenada', 'GRD', 308),
('GE', 'GEORGIA', 'Georgia', 'GEO', 268),
('GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
('GH', 'GHANA', 'Ghana', 'GHA', 288),
('GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
('GL', 'GREENLAND', 'Greenland', 'GRL', 304),
('GM', 'GAMBIA', 'Gambia', 'GMB', 270),
('GN', 'GUINEA', 'Guinea', 'GIN', 324),
('GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
('GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
('GR', 'GREECE', 'Greece', 'GRC', 300),
('GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
('GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
('GU', 'GUAM', 'Guam', 'GUM', 316),
('GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
('GY', 'GUYANA', 'Guyana', 'GUY', 328),
('HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
('HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
('HN', 'HONDURAS', 'Honduras', 'HND', 340),
('HR', 'CROATIA', 'Croatia', 'HRV', 191),
('HT', 'HAITI', 'Haiti', 'HTI', 332),
('HU', 'HUNGARY', 'Hungary', 'HUN', 348),
('ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
('IE', 'IRELAND', 'Ireland', 'IRL', 372),
('IL', 'ISRAEL', 'Israel', 'ISR', 376),
('IN', 'INDIA', 'India', 'IND', 356),
('IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
('IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
('IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
('IS', 'ICELAND', 'Iceland', 'ISL', 352),
('IT', 'ITALY', 'Italy', 'ITA', 380),
('JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
('JO', 'JORDAN', 'Jordan', 'JOR', 400),
('JP', 'JAPAN', 'Japan', 'JPN', 392),
('KE', 'KENYA', 'Kenya', 'KEN', 404),
('KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
('KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
('KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
('KM', 'COMOROS', 'Comoros', 'COM', 174),
('KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
('KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
('KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
('KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
('KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
('KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
('LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
('LB', 'LEBANON', 'Lebanon', 'LBN', 422),
('LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
('LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
('LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
('LR', 'LIBERIA', 'Liberia', 'LBR', 430),
('LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
('LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
('LV', 'LATVIA', 'Latvia', 'LVA', 428),
('LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
('MA', 'MOROCCO', 'Morocco', 'MAR', 504),
('MC', 'MONACO', 'Monaco', 'MCO', 492),
('MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
('MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
('MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
('MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
('ML', 'MALI', 'Mali', 'MLI', 466),
('MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
('MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
('MO', 'MACAO', 'Macao', 'MAC', 446),
('MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
('MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
('MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
('MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
('MT', 'MALTA', 'Malta', 'MLT', 470),
('MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
('MV', 'MALDIVES', 'Maldives', 'MDV', 462),
('MW', 'MALAWI', 'Malawi', 'MWI', 454),
('MX', 'MEXICO', 'Mexico', 'MEX', 484),
('MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
('MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
('NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
('NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
('NE', 'NIGER', 'Niger', 'NER', 562),
('NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
('NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
('NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
('NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
('NO', 'NORWAY', 'Norway', 'NOR', 578),
('NP', 'NEPAL', 'Nepal', 'NPL', 524),
('NR', 'NAURU', 'Nauru', 'NRU', 520),
('NU', 'NIUE', 'Niue', 'NIU', 570),
('NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
('OM', 'OMAN', 'Oman', 'OMN', 512),
('PA', 'PANAMA', 'Panama', 'PAN', 591),
('PE', 'PERU', 'Peru', 'PER', 604),
('PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
('PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
('PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
('PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
('PL', 'POLAND', 'Poland', 'POL', 616),
('PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
('PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
('PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
('PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
('PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
('PW', 'PALAU', 'Palau', 'PLW', 585),
('PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
('QA', 'QATAR', 'Qatar', 'QAT', 634),
('RE', 'REUNION', 'Reunion', 'REU', 638),
('RO', 'ROMANIA', 'Romania', 'ROM', 642),
('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
('RW', 'RWANDA', 'Rwanda', 'RWA', 646),
('SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
('SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
('SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
('SD', 'SUDAN', 'Sudan', 'SDN', 736),
('SE', 'SWEDEN', 'Sweden', 'SWE', 752),
('SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
('SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
('SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
('SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
('SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
('SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
('SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
('SN', 'SENEGAL', 'Senegal', 'SEN', 686),
('SO', 'SOMALIA', 'Somalia', 'SOM', 706),
('SR', 'SURINAME', 'Suriname', 'SUR', 740),
('ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
('SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
('SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
('SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
('TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
('TD', 'CHAD', 'Chad', 'TCD', 148),
('TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
('TG', 'TOGO', 'Togo', 'TGO', 768),
('TH', 'THAILAND', 'Thailand', 'THA', 764),
('TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
('TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
('TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
('TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
('TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
('TO', 'TONGA', 'Tonga', 'TON', 776),
('TR', 'TURKEY', 'Turkey', 'TUR', 792),
('TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
('TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
('TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan', 'TWN', 158),
('TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
('UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
('UG', 'UGANDA', 'Uganda', 'UGA', 800),
('UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
('US', 'UNITED STATES', 'United States', 'USA', 840),
('UY', 'URUGUAY', 'Uruguay', 'URY', 858),
('UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
('VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
('VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
('VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
('VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
('VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
('VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
('VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
('WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
('WS', 'SAMOA', 'Samoa', 'WSM', 882),
('YE', 'YEMEN', 'Yemen', 'YEM', 887),
('YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
('ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
('ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
('ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_currency_type`
--

CREATE TABLE IF NOT EXISTS `hs_hr_currency_type` (
  `code` int(11) NOT NULL DEFAULT '0',
  `currency_id` char(3) NOT NULL DEFAULT '',
  `currency_name` varchar(70) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_currency_type`
--

INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES
(3, 'AED', 'Utd. Arab Emir. Dirham'),
(4, 'AFN', 'Afghanistan Afghani'),
(5, 'ALL', 'Albanian Lek'),
(6, 'ANG', 'NL Antillian Guilder'),
(7, 'AOR', 'Angolan New Kwanza'),
(177, 'ARP', 'Argentina Pesos'),
(8, 'ARS', 'Argentine Peso'),
(10, 'AUD', 'Australian Dollar'),
(11, 'AWG', 'Aruban Florin'),
(12, 'BBD', 'Barbados Dollar'),
(13, 'BDT', 'Bangladeshi Taka'),
(15, 'BGL', 'Bulgarian Lev'),
(16, 'BHD', 'Bahraini Dinar'),
(17, 'BIF', 'Burundi Franc'),
(18, 'BMD', 'Bermudian Dollar'),
(19, 'BND', 'Brunei Dollar'),
(20, 'BOB', 'Bolivian Boliviano'),
(21, 'BRL', 'Brazilian Real'),
(22, 'BSD', 'Bahamian Dollar'),
(23, 'BTN', 'Bhutan Ngultrum'),
(24, 'BWP', 'Botswana Pula'),
(25, 'BZD', 'Belize Dollar'),
(26, 'CAD', 'Canadian Dollar'),
(27, 'CHF', 'Swiss Franc'),
(28, 'CLP', 'Chilean Peso'),
(29, 'CNY', 'Chinese Yuan Renminbi'),
(30, 'COP', 'Colombian Peso'),
(31, 'CRC', 'Costa Rican Colon'),
(32, 'CUP', 'Cuban Peso'),
(33, 'CVE', 'Cape Verde Escudo'),
(34, 'CYP', 'Cyprus Pound'),
(171, 'CZK', 'Czech Koruna'),
(37, 'DJF', 'Djibouti Franc'),
(38, 'DKK', 'Danish Krona'),
(39, 'DOP', 'Dominican Peso'),
(40, 'DZD', 'Algerian Dinar'),
(41, 'ECS', 'Ecuador Sucre'),
(43, 'EEK', 'Estonian Krona'),
(44, 'EGP', 'Egyptian Pound'),
(46, 'ETB', 'Ethiopian Birr'),
(42, 'EUR', 'Euro'),
(48, 'FJD', 'Fiji Dollar'),
(49, 'FKP', 'Falkland Islands Pound'),
(51, 'GBP', 'Pound Sterling'),
(52, 'GHC', 'Ghanaian Cedi'),
(53, 'GIP', 'Gibraltar Pound'),
(54, 'GMD', 'Gambian Dalasi'),
(55, 'GNF', 'Guinea Franc'),
(57, 'GTQ', 'Guatemalan Quetzal'),
(58, 'GYD', 'Guyanan Dollar'),
(59, 'HKD', 'Hong Kong Dollar'),
(60, 'HNL', 'Honduran Lempira'),
(61, 'HRK', 'Croatian Kuna'),
(62, 'HTG', 'Haitian Gourde'),
(63, 'HUF', 'Hungarian Forint'),
(64, 'IDR', 'Indonesian Rupiah'),
(66, 'ILS', 'Israeli New Shekel'),
(67, 'INR', 'Indian Rupee'),
(68, 'IQD', 'Iraqi Dinar'),
(69, 'IRR', 'Iranian Rial'),
(70, 'ISK', 'Iceland Krona'),
(72, 'JMD', 'Jamaican Dollar'),
(73, 'JOD', 'Jordanian Dinar'),
(74, 'JPY', 'Japanese Yen'),
(75, 'KES', 'Kenyan Shilling'),
(76, 'KHR', 'Kampuchean Riel'),
(77, 'KMF', 'Comoros Franc'),
(78, 'KPW', 'North Korean Won'),
(79, 'KRW', 'Korean Won'),
(80, 'KWD', 'Kuwaiti Dinar'),
(81, 'KYD', 'Cayman Islands Dollar'),
(82, 'KZT', 'Kazakhstan Tenge'),
(83, 'LAK', 'Lao Kip'),
(84, 'LBP', 'Lebanese Pound'),
(85, 'LKR', 'Sri Lanka Rupee'),
(86, 'LRD', 'Liberian Dollar'),
(87, 'LSL', 'Lesotho Loti'),
(88, 'LTL', 'Lithuanian Litas'),
(90, 'LVL', 'Latvian Lats'),
(91, 'LYD', 'Libyan Dinar'),
(92, 'MAD', 'Moroccan Dirham'),
(93, 'MGF', 'Malagasy Franc'),
(94, 'MMK', 'Myanmar Kyat'),
(95, 'MNT', 'Mongolian Tugrik'),
(96, 'MOP', 'Macau Pataca'),
(97, 'MRO', 'Mauritanian Ouguiya'),
(98, 'MTL', 'Maltese Lira'),
(99, 'MUR', 'Mauritius Rupee'),
(100, 'MVR', 'Maldive Rufiyaa'),
(101, 'MWK', 'Malawi Kwacha'),
(102, 'MXN', 'Mexican New Peso'),
(172, 'MXP', 'Mexican Peso'),
(103, 'MYR', 'Malaysian Ringgit'),
(104, 'MZM', 'Mozambique Metical'),
(105, 'NAD', 'Namibia Dollar'),
(106, 'NGN', 'Nigerian Naira'),
(107, 'NIO', 'Nicaraguan Cordoba Oro'),
(109, 'NOK', 'Norwegian Krona'),
(110, 'NPR', 'Nepalese Rupee'),
(111, 'NZD', 'New Zealand Dollar'),
(112, 'OMR', 'Omani Rial'),
(113, 'PAB', 'Panamanian Balboa'),
(114, 'PEN', 'Peruvian Nuevo Sol'),
(115, 'PGK', 'Papua New Guinea Kina'),
(116, 'PHP', 'Philippine Peso'),
(117, 'PKR', 'Pakistan Rupee'),
(118, 'PLN', 'Polish Zloty'),
(120, 'PYG', 'Paraguay Guarani'),
(121, 'QAR', 'Qatari Rial'),
(122, 'ROL', 'Romanian Leu'),
(123, 'RUB', 'Russian Rouble'),
(180, 'RUR', 'Russia Rubles'),
(173, 'SAR', 'Saudi Arabia Riyal'),
(125, 'SBD', 'Solomon Islands Dollar'),
(126, 'SCR', 'Seychelles Rupee'),
(127, 'SDD', 'Sudanese Dinar'),
(128, 'SDP', 'Sudanese Pound'),
(129, 'SEK', 'Swedish Krona'),
(131, 'SGD', 'Singapore Dollar'),
(132, 'SHP', 'St. Helena Pound'),
(130, 'SKK', 'Slovak Koruna'),
(135, 'SLL', 'Sierra Leone Leone'),
(136, 'SOS', 'Somali Shilling'),
(137, 'SRD', 'Surinamese Dollar'),
(138, 'STD', 'Sao Tome/Principe Dobra'),
(139, 'SVC', 'El Salvador Colon'),
(140, 'SYP', 'Syrian Pound'),
(141, 'SZL', 'Swaziland Lilangeni'),
(142, 'THB', 'Thai Baht'),
(143, 'TND', 'Tunisian Dinar'),
(144, 'TOP', 'Tongan Pa''anga'),
(145, 'TRL', 'Turkish Lira'),
(146, 'TTD', 'Trinidad/Tobago Dollar'),
(147, 'TWD', 'Taiwan Dollar'),
(148, 'TZS', 'Tanzanian Shilling'),
(149, 'UAH', 'Ukraine Hryvnia'),
(150, 'UGX', 'Uganda Shilling'),
(151, 'USD', 'United States Dollar'),
(152, 'UYP', 'Uruguayan Peso'),
(153, 'VEB', 'Venezuelan Bolivar'),
(154, 'VND', 'Vietnamese Dong'),
(155, 'VUV', 'Vanuatu Vatu'),
(156, 'WST', 'Samoan Tala'),
(158, 'XAF', 'CFA Franc BEAC'),
(159, 'XAG', 'Silver (oz.)'),
(160, 'XAU', 'Gold (oz.)'),
(161, 'XCD', 'Eastern Caribbean Dollars'),
(179, 'XDR', 'IMF Special Drawing Right'),
(162, 'XOF', 'CFA Franc BCEAO'),
(163, 'XPD', 'Palladium (oz.)'),
(164, 'XPF', 'CFP Franc'),
(165, 'XPT', 'Platinum (oz.)'),
(166, 'YER', 'Yemeni Riyal'),
(167, 'YUM', 'Yugoslavian Dinar'),
(175, 'YUN', 'Yugoslav Dinar'),
(168, 'ZAR', 'South African Rand'),
(176, 'ZMK', 'Zambian Kwacha'),
(169, 'ZRN', 'New Zaire'),
(170, 'ZWD', 'Zimbabwe Dollar');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_export`
--

CREATE TABLE IF NOT EXISTS `hs_hr_custom_export` (
  `export_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `headings` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_fields`
--

CREATE TABLE IF NOT EXISTS `hs_hr_custom_fields` (
  `field_num` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` int(11) NOT NULL,
  `screen` varchar(100) DEFAULT NULL,
  `extra_data` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_import`
--

CREATE TABLE IF NOT EXISTS `hs_hr_custom_import` (
  `import_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `has_heading` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_district`
--

CREATE TABLE IF NOT EXISTS `hs_hr_district` (
  `district_code` varchar(13) NOT NULL DEFAULT '',
  `district_name` varchar(50) DEFAULT NULL,
  `province_code` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_employee`
--

CREATE TABLE IF NOT EXISTS `hs_hr_employee` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `employee_id` varchar(50) DEFAULT NULL,
  `emp_lastname` varchar(100) NOT NULL DEFAULT '',
  `emp_firstname` varchar(100) NOT NULL DEFAULT '',
  `emp_middle_name` varchar(100) NOT NULL DEFAULT '',
  `emp_nick_name` varchar(100) DEFAULT '',
  `emp_smoker` smallint(6) DEFAULT '0',
  `ethnic_race_code` varchar(13) DEFAULT NULL,
  `emp_birthday` date DEFAULT NULL,
  `nation_code` int(4) DEFAULT NULL,
  `emp_gender` smallint(6) DEFAULT NULL,
  `emp_marital_status` varchar(20) DEFAULT NULL,
  `emp_ssn_num` varchar(100) CHARACTER SET latin1 DEFAULT '',
  `emp_sin_num` varchar(100) DEFAULT '',
  `emp_other_id` varchar(100) DEFAULT '',
  `emp_dri_lice_num` varchar(100) DEFAULT '',
  `emp_dri_lice_exp_date` date DEFAULT NULL,
  `emp_military_service` varchar(100) DEFAULT '',
  `emp_status` int(13) DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `eeo_cat_code` int(11) DEFAULT NULL,
  `work_station` int(6) DEFAULT NULL,
  `emp_street1` varchar(100) DEFAULT '',
  `emp_street2` varchar(100) DEFAULT '',
  `city_code` varchar(100) DEFAULT '',
  `coun_code` varchar(100) DEFAULT '',
  `provin_code` varchar(100) DEFAULT '',
  `emp_zipcode` varchar(20) DEFAULT NULL,
  `emp_hm_telephone` varchar(50) DEFAULT NULL,
  `emp_mobile` varchar(50) DEFAULT NULL,
  `emp_work_telephone` varchar(50) DEFAULT NULL,
  `emp_work_email` varchar(50) DEFAULT NULL,
  `sal_grd_code` varchar(13) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `emp_oth_email` varchar(50) DEFAULT NULL,
  `termination_id` int(4) DEFAULT NULL,
  `custom1` varchar(250) DEFAULT NULL,
  `custom2` varchar(250) DEFAULT NULL,
  `custom3` varchar(250) DEFAULT NULL,
  `custom4` varchar(250) DEFAULT NULL,
  `custom5` varchar(250) DEFAULT NULL,
  `custom6` varchar(250) DEFAULT NULL,
  `custom7` varchar(250) DEFAULT NULL,
  `custom8` varchar(250) DEFAULT NULL,
  `custom9` varchar(250) DEFAULT NULL,
  `custom10` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_employee`
--

INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
(1, '0001', 'Trần', 'Hưng', 'Quang', '', 0, NULL, '1994-12-18', 189, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, 'số 11,ngõ 12,đường Nguyễn Khuyến', '', 'Hà Nội', 'PH', 'Hà Nội', '1', '0985937800', '0985937800', '0985937800', 'tranquanghungtqh1812@gmail.com', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '0002', 'Nguyễn Tất', 'Sơn', 'Hà', '', 0, NULL, '1992-01-02', 189, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_attachment`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_attachment` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eattach_id` int(11) NOT NULL DEFAULT '0',
  `eattach_desc` varchar(200) DEFAULT NULL,
  `eattach_filename` varchar(100) DEFAULT NULL,
  `eattach_size` int(11) DEFAULT '0',
  `eattach_attachment` mediumblob,
  `eattach_type` varchar(200) DEFAULT NULL,
  `screen` varchar(100) DEFAULT '',
  `attached_by` int(11) DEFAULT NULL,
  `attached_by_name` varchar(200) DEFAULT NULL,
  `attached_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_basicsalary`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_basicsalary` (
`id` int(11) NOT NULL,
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `sal_grd_code` int(11) DEFAULT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `ebsal_basic_salary` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `payperiod_code` varchar(13) DEFAULT NULL,
  `salary_component` varchar(100) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_children`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_children` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ec_name` varchar(100) DEFAULT '',
  `ec_date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_contract_extend`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_contract_extend` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `econ_extend_id` decimal(10,0) NOT NULL DEFAULT '0',
  `econ_extend_start_date` datetime DEFAULT NULL,
  `econ_extend_end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_dependents`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_dependents` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ed_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ed_name` varchar(100) DEFAULT '',
  `ed_relationship_type` enum('child','other') DEFAULT NULL,
  `ed_relationship` varchar(100) DEFAULT '',
  `ed_date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_directdebit`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_directdebit` (
`id` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL,
  `dd_routing_num` int(9) NOT NULL,
  `dd_account` varchar(100) NOT NULL DEFAULT '',
  `dd_amount` decimal(11,2) NOT NULL,
  `dd_account_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'CHECKING, SAVINGS',
  `dd_transaction_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'BLANK, PERC, FLAT, FLATMINUS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_emergency_contacts`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_emergency_contacts` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `eec_name` varchar(100) DEFAULT '',
  `eec_relationship` varchar(100) DEFAULT '',
  `eec_home_no` varchar(100) DEFAULT '',
  `eec_mobile_no` varchar(100) DEFAULT '',
  `eec_office_no` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_history_of_ealier_pos`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_history_of_ealier_pos` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `emp_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ehoep_job_title` varchar(100) DEFAULT '',
  `ehoep_years` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_language`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_language` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL,
  `fluency` smallint(6) NOT NULL DEFAULT '0',
  `competency` smallint(6) DEFAULT '0',
  `comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_locations`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_locations` (
  `emp_number` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_member_detail`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_member_detail` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `membship_code` int(6) NOT NULL DEFAULT '0',
  `ememb_subscript_ownership` varchar(20) DEFAULT NULL,
  `ememb_subscript_amount` decimal(15,2) DEFAULT NULL,
  `ememb_subs_currency` varchar(20) DEFAULT NULL,
  `ememb_commence_date` date DEFAULT NULL,
  `ememb_renewal_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_passport`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_passport` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ep_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ep_passport_num` varchar(100) NOT NULL DEFAULT '',
  `ep_passportissueddate` datetime DEFAULT NULL,
  `ep_passportexpiredate` datetime DEFAULT NULL,
  `ep_comments` varchar(255) DEFAULT NULL,
  `ep_passport_type_flg` smallint(6) DEFAULT NULL,
  `ep_i9_status` varchar(100) DEFAULT '',
  `ep_i9_review_date` date DEFAULT NULL,
  `cou_code` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_picture`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_picture` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `epic_picture` mediumblob,
  `epic_filename` varchar(100) DEFAULT NULL,
  `epic_type` varchar(50) DEFAULT NULL,
  `epic_file_size` varchar(20) DEFAULT NULL,
  `epic_file_width` varchar(20) DEFAULT NULL,
  `epic_file_height` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_picture`
--

INSERT INTO `hs_hr_emp_picture` (`emp_number`, `epic_picture`, `epic_filename`, `epic_type`, `epic_file_size`, `epic_file_width`, `epic_file_height`) VALUES
(1, 0xffd8ffe000104a46494600010200006400640000ffec00114475636b79000100040000003c0000ffe10a97687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e0a3c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520342e312d633033362034362e3237363732302c204d6f6e2046656220313920323030372032323a34303a30382020202020202020223e0a203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e0a20203c7264663a4465736372697074696f6e207264663a61626f75743d22220a20202020786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f220a20202020786d6c6e733a7861705269676874733d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f7269676874732f220a2020207861705269676874733a4d61726b65643d2244617665204a6f686e736f6e220a2020207861705269676874733a57656253746174656d656e743d2244617665204a6f686e736f6e223e0a2020203c64633a7269676874733e0a202020203c7264663a416c743e0a20202020203c7264663a6c6920786d6c3a6c616e673d22782d64656661756c74223e44617665204a6f686e736f6e3c2f7264663a6c693e0a202020203c2f7264663a416c743e0a2020203c2f64633a7269676874733e0a20203c2f7264663a4465736372697074696f6e3e0a203c2f7264663a5244463e0a3c2f783a786d706d6574613e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a2020202020202020202020202020202020202020202020202020200a3c3f787061636b657420656e643d2277223f3effee000e41646f62650064c000000001ffdb0084000604040405040605050609060506090b080606080b0c0a0a0b0a0a0c100c0c0c0c0c0c100c0e0f100f0e0c1313141413131c1b1b1b1c1f1f1f1f1f1f1f1f1f1f010707070d0c0d181010181a1511151a1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1fffc0001108008200e303011100021101031101ffc4009a000002030101010100000000000000000005060304070201080001000301010100000000000000000000000102030004051000020103020306030406080602030000010203001104120521310641516122321371813391421407a1b1c1522334d162728224151608e1c243534435f092b4251711000202020202020104030000000000000001110221033112411351043261812214f04205ffda000c03010002110311003f00c565cd880d315bc4d240e04cd592696e072a2323cf689e36b514c1012803aa2a9e2cd58519b67dab526b61cfb291b340c381fe145c8f25feca46c23aecbbb410e312bc75f3152bd474157930778db33b6d98854cec792024f6161e56f9358d2d134c2619b1656e7b26e871d67931f2a1668e52a749d686dfa7c6baac74728d0f6bfcd0943a47b8c0b2a03e79a21a5adda4a546da649ba0d726e789b8c09360ceb2c5227b834f302f63a876106b9fa35c93016e28c5380e37ab50006cac76b71e1550a605cc94c5c0f1eea2904a6c65956c8389e5440469d3f9131bb29b1add81d49a0e9495982842598f0143b19524fd93b2e3e330436925ed41d84f2b9a7ae477aa3929c1b2666464e5ce8a7d8c184c93803828e42ffde2299d8dd0831410c0761a0c859057da4f6af6e34a8582a65a165047d944a56a59c6c013c1e6e7d948d9548abba6d32450160bf0ad562590b6de56b9ecab0106b67cc0acb53b229219c9c98de337b6ab52180934e865b83c7b4518164efdde1d9cab41bb0b474476f6d6ec69c43d923609703cdda6b19102c72deec385f956182fb342279eede9bf0bf75615a1e7102244047c6c2a6c53ccac8d115adc4d64824187bcb464a126c3b69ba8c5cc7ea4c859408c9b13ceb75314bad36f79a68b7ac555ff001407e2bbc489c357cc555a95252978c0b531ca7ca8b2614636e12467813db622a5074268d37f2ef649f395f70db5b5665b4cfb7bdd4b5ede65bf7768a959f8653d5daa699b77e597536e7306c9c64dba156b3b4ada891fbc816f71f1b51aeb389c2e58d9b7fe4d74963c8b2e7fb99ce574b47235a2d57bdc2ad8f873aa75817bfc227cdfcb3fcb99756de7658544b6d6cbad586abd995efeaa9dad16295edd6450ea8fca5fcbfda231343264e1b0e0a9a84a87b2e4371b0eda0eee60aeaa7652f08491b46df0de48721723161b99a465319007703ccf65a9bac99eb5e1906fb938d8d011810b6489231a9945bb2ee2fcecb545a18eb6d6a8435c7dcf225ff32781a2c7f74c5147cc936ec1fbb7e173e355b614105fc9c8fb97b37fa63f28f72ccdc22d3baf53cd163e344e2e4438edeeb383d973fb2a4b235f18327c4bfe9a2c8c07f122f7102de94d07ecdc4554b01c68a632449b4a70b1a4b0585370c74931883cad488cccdf78c510e4301c89ae9448a30e4c9149c28b41090dd7c9e6e74900ec5457699ee3b4d114b7edcde3dd4000cc6801752fcbbab0e5f9de0b05b71ee14104a930046941c69901a18365c2091ab5b9d2b08cb0c4112d7b52132ae726a516fb68a0a40d18ec5b87214d2182d636296916d59b1aa87adb76f47d82459c0084dc13dbf6d5f4e4d710fa931e1c1656460f1dff0088cc0e923c0d2de9052969376fc89eafda27d8b1e1931561ca004499720b349cf4a027d445b81f957175eb6e0ead89da909f1e0d760ddf1f2217557569a3043c6a74b0d3db63d9e3caabde51c6f4c58a727526df0c8f07baa5c219038b1b2a9e24a5f50e3c2848fe96c55ddbaea3cbb438675984899c437e4bc4adfb476f0a95e59d5ab5d6bfa88bd69d4cd24c72a46775ca292c480f25f48416e4d7e7ff000abead7e45bdd251e0cf66dea68fcf8cce564670558dc2e93da07671f89aeb48e4772ee46fb83361c514519c3ca8cea98c6dfc3361e620779a35a390db62688363dc25de77edbb6d8999a7cbc94551c154adedf605a86f5829a2f934eff721b3aa6cbb4cd1c2bed6329c749fdc219470f2fb5e921adcf9d088254b4c9f3ac0bedb1f8d162bb07f6e93881db6a9b0d596b3197452a2a81eb92639acbc073a681585a4cdd78d727e3420513779d2f21b7db55400288bcffaa88196c63a18788e3df4a2c12e240aa4506668bb617f9da941055fc0decca28c8c46705b57117a0393a60c6ac0922fdd4c2b1876cc7fe18b721d949626125b5f49e14a6923ca45d2028a6452a411c0a2f722fdd44682e6df12ebb9161418c823b86fb16362b6107b936b10797db56d2d896429efb0e465e395663299011ac9bdbfa29ef9351c16ba0778df76a8a31eeb470c52592388aa17d2781d7c697d723fb219a76dff009cfb809c7e271e238e008cc2971248bcb5c9280750bfddb5bbab2d467b015d47f98793ba4d1a62ff000a040563e02f1211c805bf75af73df5bd68dec2c6d7bce226dd3e44d9920f658e8f6e32e8baec03330d1abc785ea36ae4b56c2675175647979a640046636b8c72752a5aea5958f31dbe355d5825b5f62963666248c90ab1890920c6a3c82fc756afebd5a48c1e15704a4ba5b48e16ecf0623be9d0a19fcbec1ccff0055edd9d8c57de86759047201a6ca789e3c3eda8ede0aea5935dff7259700d9f6a02426691a43ec820a14d3c5be20d4c5ae133e6ed43551812c16db1c96f954ec350b796de52690e8a80da66fc4804d509db9097bccd8da4560300e79f55e9808a49092c0da805840449ed69b59ab0a407cb6ef140045f8997c7d54601231fe0c695f1a49199ecf83cac2b011460c19a4cbd163714d206396dfb494c70c470efa93b05222cd38f8c0fbd752c3cb20175fb69aaa7815d45cfc7e56449a22950f13a6dc48f88ae9a6937782f46329b48764661ea2468fd3545f5d481ed2c4d3498e81962d609e1fc4041fdb4ef5550bec6c14d04f99925e7b6a63c23b9d2b6e4ba8d4ecb23d59e4c902c2def0038e80cc78bfc00b72a41ceb6a89a6f742b0280148f8f0f30f97655121584a4c531e2a9bafba542862d6d43b8016e54f0022c59631217d27421b346ca18a0e565b69007ef114ac2993ef7bada109869f85c7e0d243112c9a80e4a4f01dfc2a4d14912f3b22528fac5d4fa1ec38f1f311e3fae90626db27fc44f195ed3e6363c01163c38723f6d3c8a356247ab0d6ea9ee31bb372b06e209fddb53a62ba87fa1e4c5c5de638f20b7d402374b0d247a4924f7d0b5250d4b431f7f3b3a35f2f675ea3c594b344ab1e5c4e7d2ddba7befe15cb47182b6c9f3ab3ca642b6edb55ce661ddaa297503636352b8f40864c6e50adaa659306c5b648f9019aa9d89db90bb6d8560bad2f616457dce33ef69b71354410c6d3d353e522b2af3152b5e0cd868f42e5101b41b91c293de8493ac5e839b51d5193f2a57bd04b3fff003f6ffb55bfb08d00886095847e53564165e930580074f65662a453c58bdbccbdb8f6d06c161b639628f0353d85813c78549ac9aac4c1910eef9d93192131578151c9bc750aefd3af02dec04cf99365918e3c5eea5f9bdd9bf55eacd40ab25e87763918eb97901644201440b751f10682b87a9e67ef5b6ae24792d102cdfc3849f40efb01ced45da4caa56c19a79619373966098f190b871586a7b78789a9be4a2f80bff96245832ee19f2abe43464b46b721473083bbe3da6b7593496363dbfd9c64121fe3c8c259495b598f24e1c82f755682d8b39e3ffd74bee583bf3296d46c7ca388f28f01d94ec4026defb8674cf16d8912042409b25b5312beb27901f2351b5d2c2295a7c9c2e3eeb24efb7e644acca3dc57889b1e3e53ccf0bf0e75296d9584915fa8fa6b231f1d72962ba491b2b007d3db661da2d7a0d19338fcbcc281e7ca6982c923c5eda457bfa1bcc57b78d1480d877716daccd8b84ad2c2d90590c78e019a4fdd00b7962078f98fcaa4eca64aaae20abd312a43938fbcedf893aed0676863390c1e46922f56a0be571cf8d377700554f28fa4b67fc36efd31baecd96c1e2962d2d63ae45322eb0cbf02470ae76f251d7831cc5fcbc0cec400543101adfba6d42fbe0e7b2092f42086c41f95aa0fec191d2f46ab30d66e287bc70963f42e282a7db2dc287b993658cde94823c52bede9e1c0d05b198c93a8b69f67798d2d652d635dd4b4a02352e8cda61fc2c7e5f330e75c1b9cb08da764f2fc2b9c48221b580d58c893fcb23d3e3a7fe6ac319fa6c30a30b8e0b5dded2907edd61c78a0f2a8bda8d2cdb0892f9b1479da98f949e3e157488dc0fd6bd5b3e44516db853048db84a579e9f8d5756b8c9344dd21928f02e32a32301eae173f05aebab15a0e47b263cf36446e923e95d528bdcdcf25bf79e66abd241200df7a6b253649b430c4c7b17b2f0b8bd85cfeef0a5b6b84356f2c533b7ee9972c58641316146a5d1cf00ac6cbc3bcf654122cda1b3030e2c78b163c94f6e18afa56e0b000f60fde3dbdd4d04fb06e62770649427f855b1f687953f863f86976fbbdb7a2dc8cb05e9253a0aa80238893a97d3aac033a83c74f3b1fb2849817b9bcd909345ac058c6b653e40c2fc3ecfdda572c2a1124dd0f8195b5636462bc58fb9623fe221c790918b90d70cd0ca839065ed1f3a9ba14ee24cb9dbd6c7bbac93edafb7e12964c940e654bcafa8b6a1c2ca6c17c29552cb960ecbc21d3aa3789727a7e348c07190015d3db716d5e3ce9d3c05ac8b7b6e264edb94f2e1dcb62c8641129f2c9191c74b76778a306944d1ecb97bef5149931664b8788d8ca933c4da5a63c59a317e0be5e35354adb90b6d70cd63a7361c3dcd76ee9ec458b1f1be8e34362deda2212a4b733ae43c4d6db61e8a114dbacb72c5de0e3e3c527e3bde680b23f35887b68ba45b88d36a83e0b2e4d67a730bfcc36e8f2274232c0d390ac2c750edae1dcb242f5c96372da63523ca2a0082a47b6437008028a340720dbe15894d87014e8d00adff1d5a2216c00a7aa04193750f4bb65ee29320bf9aff0ae9a5e102b51d3a771863c71a5bd000ae7b291ec86379ce9f1a4e849952594def5ba0a47f883a7fbbff352f40998e7752c0ac40600d765751bd801dd7a921784f9c16e56aad75c0bdc46cbdc354e49bf03e500f3ae8a501662ee56548dbc22300748d5a07217e55602437f4bc73e3cd0ee0c034ce75484f200705017b87eba7a819a86df908cd911c51800c65cdac58b7603f16e7f0ae9abc926803998f266430c794ac531ce9f64f05251414f8f1e2685c3502cfb79c55c8ca0419e4c841272b2816e03c6cd52881f92bcb14990d042a84b1526c079cea37d23bcf1bb5259e06aa21c63923735c37c199198d9048fa54db86ab8ed3cbf55aa7928336ddb76e7939ac8206d0020f6dc9761c6c194f11a7b8538a336674d6243b24f3c87dec94934b3f66ae4178f03cf89ed3440018f3f1e1d5323701e42bc81551c57530b102a6c7405cac9c3dc709c1c7271dff872a6936287828b9fd7463069c947076af6c08e527f0f131782153a9781e1f0b5256a3d992344bef86642aaa7cabdbc0dcdff005d549057036b197201860a89640341f42bf34d57fd748e132a94a358e84e93dc360c2c1dc6494488933ac68416d04b062dac9b7c2e2b9aefe0b572a059db369872bf30b2e68235f65321f324c561c4c7231d7a79dedcf872e752dbf896d6b26b7833c38b91912c33092092c0a1f5295e5c7b45ab95a944b67e40fdd77d05ecbca956b26c18bb9cad20b7db47a024331e7ce6302e7956ea092be519261c6f4c80d9422d97dc9359145b0265d8f6b5c7f4d0919b3994306ac215dc31bdeb00ad63a7f47e9a30341f27c9bdee19726a2e413dd5e9f583989614cb660ceec477506c3523547933f4bfa106a66ecb55288660a8658e7ea32e2ec8efa50f69ecbda8be428d0f6fc00ca9ee4ac8a6306c9c0dc713ce9ea2857a73a863db375d390fab1e5d25a53d88b7d3f3a7ade00eb233e66762e6b1cb8482b2b6b2bc8d952c42d37602a8127c5719a6190e96c89a39d811c163552ede17f1a56138e9dcec5c3df0ab80d2a931a5feed975e9f8769352762890437a0f92f0ee71aafb6ede5089a985f91b72be9f483f1ae9a6513b618d1d3f9f8b280b1291144c17539b3330f55fbea77a8531873033e0b41a955d8f9514582fc692f70d6a0fc2d8f07fcb9b127883ab31666ed3737e268d720b383bcbd8f6c683db48156ca1578711ff1a1741a585dc1e9a8609a4430ea567b07d3f77ba855147613f7bc1c7c5dce5857505d5cafdbdbf0a16c332c97fa6371181bc63c5337f879caa4ca390b9f57caa76c94ab8373df1df6ee97cb8b8bc49910c903af0d6b2a9234f7573d8ad63b7ec06e97db30e5dbf177ac440bba6db23c790c0693342d765f707ef2df4dfb454b66074f3925c9ca8a04324034c3279e35ee0df77eda910bb720a19524f3f11706b136c3981b73c801d3f0a46080c47b7c96b5ac69643049f812ab722f424d07e08540e158d0732292b722b04a5929db4c6807ccfe4207314530143dc3a7f4fe9a231f2c6d50ea6e57af4ec73a41496330a1661e51c4d4c628e2e9cac89640dfc28e32d21e43e15d3442b16b6b668f3f1f2c70449810df06a09664648d1b74dca48f12195a11ee8d1105edbc86e1387deef34e6434c7d29136d0a920f76775bc8c7b1adc7fa28bae0c80f1e565ed1ed61286601eeb21e773c6dc7bea4ade0768b1beee3f874c625b54a6324a93dfc5493e154b311215fa67739c66e5fe33cd9790da237eed47ce47f7454a65156a0d67a6e78723a65a08593f15eeb32c8c2e4056e0ff00ddb5eada6c4b654f30e38f0cab226a6b808a80b371f35871e2c7f5f3aa6db2052a4d93d40cd20c6f65b19d58a9121b102f72355f893db5c376fe0e9a2432e06e104e8b082cb25b91045ffb26baf5e4e5ba82fc5007042799ac7910dfa01aa5b5e09ab9c41880ad90a822fcb8fca9a94c1ad6338eb7d9a28a793332a63898f183af5f68fde53c8dfba85f4c8f5d827eddd47d1f0ee31893225c8516b322dac6f52f4c7253d8cfa37367daf7efcb1c59f1738e440b910a626545ea0c8fa424a398d37218571ef45f4bfe673d26327132d70546a4c96d6cb6edb957e3e04571d9c97d9c30c6674dac70243a6fa073fd348d9cc508b658e36e238d29a061dbf051101b560c16caa83c072ac622700f0b50315de020f2ac022311e4450314b323e76145980596acb73f65614a3afcbcfb3f6d131f32ed18ce8cbaabd464d20aef400daa729ea5466bfc0522e466851d9b327cbc0ca8d7ea040180ed1ddf3aba6291a61491c89aa3d05982a47d8ac5755cd30e33eddf8fdc32b6b86c0bcd20121e647b766d44788e74d5a89c1beedb8092618460145b8b017b9aa2524db15fabfa722923d2a972780239fc076d4af49294b88ad832c83f0f962f2468d7d5c0bf1e0a0770149c8dc0b93ed59d8db826424a5cb6b0387a3ca42922a68a4e063e80ea76c787739b35b463c6a22543ea26e070f13595a0cd48cabd4f9191bb6ddb36195c67dc3dc6c89858c8b10e0aaa7b1a46edee14f4bcb835e90a4b79787b742cb0c44cb930a3cb34ee6fc54fa7bffa6a96689a4cb3b0efd32490fe31191858c4f21e250f307b3e1495b75633af6433e36e1893e51c49c08b25fcf0153c268fb591859b50fbc2bb2979472de901a815319551e400df8692da9bb3ce185ec076d5513316ff0071526e31b6ceba88daa7125e35e47216c78f86837a86ebf52bad498d4192cb206889575370d7e22b95fd8f845ab43e9cff006e193bc754f49751e167cc8d85164e12c2a89a183dc97636ef40be37e35cfbaedd7252b6ead346d9d3bd3c717769b2dceb8b1a14c6c76fde908d53c9f6d97edae45805f63b07a6815efc2a6cc9944edc9af5102f536c69278f1c28eea28cd9cc91a83464c56205f8d109e1517bda83332b4aa2f4a00765b00a40e14643003dc11563249e7ce984606d51dbe76a1063e788d0ab0d2b5e984eba8da48ba772e60b6f269bff006b85642b147a1f2228777f665f44e9a57fb4388aaeb24c3dbc6138fc4e4c6d68fdc8d4f80e7c3e7541aafc0d7f977b7bcbb8e5663a855897421239339b1f8705a6aa3366b1873cc34a39e02d60bfb45309058c8412212cbab5f071da7ec343932133a83632cdefc034c9186f6c11605bbec79daa76ac64a55c8afb69c4685a0c821725d4d89e0ccfc788a9560a342bf53ecf9189fc7c5611c40a48f1761b0f2fcee696c3d4afb66f2f99958f2c0c62dcb1c28329e434dcd04a3283214c4ea0dcf1f704dc266592297dc8e55fbac070b1fd86876f21ebe0748f71c5c88a02b287c79341463db18f1efd55ad70aa0425c694e3802531a05d71b29f346e47346ec22a5eeb55e0aad55b04b6dea39824673a557954683372924b796eede1da05776bfb957ce19c77fa965c650a9f997bae26edb63edf3633e502dae09146978e41ca5563c070fb9cad4766d565c8b4d51c9926174c6e99398b8f0c65ae3502a353003bc0bd8d72b65950fa53f22fa830fa7f668ba6a0c544925cb39199961f5333150ba59bb480a3c3b2a3b6dfc700bd2327d090ba989348016c2c072ae5562307e76b0bf21df41b0954e563f13ee2dbbef4831d09a26175607e1402453e444a2e4f1a32606cfb963a76dab1a41f3f504080f9a8c19d81995d4b1806c6f5ba99317b37aba0f70832804765e9d50d208dc7ab31fdbe326af0a75adb348adfeab7d5eb1f5afcfb34f2ab7a05ee02c2e979a69c22279bb6a8ee90e93619de3a01f3ba6b70c5b5a7681da35ef651a854bdb93743e70c6966c7952543a2688dc7832d75ac11347c1cec5ddb6b954d94cf8f7997f71d3813fa2ac9c8220d0fa4f162821cac84e0b90636e1e09e623e7568c888628a4b6a21c703666eef9d681a4b58bba21711c85d5870bd858f8d4dda06e9254dcb360713476fe32f065b06bf0bab0f956604673d4b64cec7dd31d40c8c4914e4bfa97db721748a85ab992f5b7821eb9cac154c38dacb0990063ccb796e07ff006341ac9aac4fcbdad1d967864f6664b23329b5c93ccf7055e75a032738383b8e5bb638934aa11198d7971e2588eea4829da076dbb649f1f1e3c52cc66637249f2a272bfcea36295c8766cf8d4a6db0c9aa4f73ce4f1b285f4d4e24a2b4043071a0f6c48c2eaedc41ecee61415467692c6cbb041b96f2d8b2a0785e4b10dc5439e00d5893618ea3d9b136bc76d9b070971a48c9fc53282acffb4a9ecaaad52a492d809e8cdaf6ec1df567cc710c46da1c9b00477d4afaec9036da6b836cdc7f313a6b62da44f91991b055f2aab06663e00573575da4e64653befe7a6e3b94e530a330e25f82fde6155f4a5c96aeb07e175cefb992097225d1029f2c2a6c3e66a56aa3aa9a067dbff303223b2a37b9293603ee8fe9a8db052bf53b0687526e6f17bd94da4b70541c2a7ec43dff00e763009ddf7c9e305d9ade1db55a5d338f67d1bd442debafb3e0620290bd84576d34a671dab642b667e64e6ba9505aacbeba0761767ea9dd249b5799539d57d48593a5de33f278176155d7a902d63dd7917f59bdeff3ab7ad09d8dfb0f6c11ce74add98d781d8f67a40e9b4ecacd16a913cbe3dd4b2083e3afce2e8ac9e90ebedc705e32b8594ed99b7c96f2b4529b903fb2dc2bbb4dfb54e2db48606d8b3e4c7cc81a2e3aa368645e60ab769aeba9336ae8ec93fe58c839c2da548f50d5dd57d7c1361fb2ac615cff00097ccc3b41e7c476d51d41d81db8c864490a111ab736b9b8ee1d9fa292dae4657806cb3038854cbaeec1acafa4dc77a9e752748591fbc9424dbb373cc8574a2303c18f00c791d2bce91d4320cea0e8edc33a0c3b65a3c98e6f6652ba9b97abcd6f9d0f53195d0a3bbe1e76de571b291e0c8d3e6490150fa8dae3b0fca95d4a56c41b3664b85942417f6d459dcf237e001acaa0b391c374ea3973277c5db75348a1166987054b0f4eaefae7b572595b041851e7299646994cd62a08fbb7f0a568298d38995b83edf040b64952c0bb1b70e5c7e22832954cb1bdf57274a451e97272644d71e42d8e9707b477f777d5a94c4b25b2f98036c7f9ad95beee3249bb4dfe2d8d9413e5d3fd5bfeaabd2e73d87257c1cc84ab3a90f56745617b342bef1b198f5cb1b97853eeb1bdbe1537aa03d8574ce8e076d4dc2fe5a85a852962dffa89562d2ad65ae6b50eaa5d96b6bea7f62659358d5c975542faa4e9a6f81df64eaec68cb6465399e5e4357a13fb22b9eda4eaa6e5c83ba8bac22776f38543c6e29b5ea27bb7489793d57866e0aeaf135d95ab3cebd9007337adb5a4d5a541aeaa368e5ba4cfc376c09942ab0155562704e99302a796c5aad5b1268ebdf6b5fc2ffb28f71202b8bf9d1d60ba5d72143037e35c1fd7a1ddfd8b8d983fee5bacb1a048e4c78a665e6dc003f2b527f5aa67f63e50adf9bbf99f99d7fb4e00cedb62c6cbdba4261c98cdd8a49c190f870a7ae9eb9911ec5651023ecbece22c724f65d4de73dba39f0ae9ab844e0d3f60ca83136f8f4b11264b19dec7906f481f2abd5a4840d47ba2e9047c47ce99001d95ba45624865bddadcfe0691d83056837640d6481fbf55ad7a9f61a107769cb0faa59028d22d1a8e43c69e885b32695d6e595493cdd8fa42f877d520592beeb0ed7bd6d6fb4e793321b18a6b7f16293eebc64f2d3fa69baab2834c393379ff002f7798b39a1ce9a1936c885e3c885f8487bda3f583e07878d46daade7828b62630e2edaf870ac1042a9027363c1029fbd51b28295c9621dbb13de06c7deffa4e0f9813ccf8a8f1a85b05a81e9205c5c50256124eeb62c07670eca933a6bc09bbd9db72b78783293dc8797806b57652df270ece700e97a0064919d893ae2e3ab0b69e2dce9edad3ca115be478c0d94624281b2199881a89edf1aa7480264fd4a176fd90c9a81571c0dee6a2ee53ae0c8da5cacf94c318bf1ba8fe93430d0cb0f0793eddb8c2b6692336e4035ea5d24a7b0f61da77879e15e0c18dcc89c427f6a97a056c65fcc9770c6864b65958a2e2c08d37a4f59bd801ccea1c89c69f72e395c56f58af6839b3c8b8e77efa6ea23ba2a4930637bd144db923d4472358427c6dc32f1d818e423c0f114caecc17ff005967daded47f4f472f1bde8f73414506283ea62579ea354412c24aac2c8cd61e34407634c9c19d88bf227851315f2e5c4887b601925e4231c79f2a577808fb8d9f22431061a1f42065fdd3a40b5564408c7bb88d2ecdc0dfe1e14eac2b444dbcc0ce598dc77f8d2f7468237dc26f6cce58203cb5f68f852cb189f69ea3122c915c2c8848b0e17f1146973341b83755971574b1d57e1dc0f71ab226114f6df1e33282ce05c906d66a617b1de1ef11307d30c4e356992e0335d7bef464cc8a7cfdb721fda9af0923cb2456001f854ecaaf91eb6b2e01ae916dcc673289615bb193b748ec15cbb75c1d3af6480f76eac99e67758d8dc010af206b9ab47cb3a2db570850c59b3533bdfca9c3fb8c4baadcf3eef855480d18dbb22612e3c93fb69293a7570374ecabebb4e09d9416a6fcc0c538ba249009a20500537bd59dd08a44eddbabb2f3d0c01a55c707b06abd7270cab6d82b1e50b26b59a645e64dadc7ba8853082e6e182b2c9248eddbe51faab64d279b87512b010e1cb205ed0c348bfca960dd80f36766ccc52598b0ed17bfd9580d9e197240291c0c6de5b84d47f4507631a0fe556d2bb9e44916edf84820e510cab24848ee07b2a77b382da6b2f2695d43d15d2bb7c514bf838a459182b9014ad8fde561c2a4ad6674da945e05bcfe97fcb7cb8dd460abcabe567c77208f90ac9dc5b575b33cdd3a3f6392795368c8915e33e686565247601e6b1bd597ea72da8bc007fd3b93ff00712dee7b37bfdeeef8d1ea275299fa87e15440b725bc3fbdcb9530504a6f447e8f4af3e7f3a06233ff00b1c6fa3cc73f573fbbe343c8ac3327a47d6e63d5cfe555119d4ff4d7eafeda36022927d74f57abfeaf2f978d204fdb9ff31ff9ddbebe5fddfead3dff007054f766fe613ea7a07eb3cfc685466356d5fcaafabea8ff00e0abd7f1256e46493f92fbfcdb955bfd492e403d35f573feb7d5ff00a9f0fd7df52d7e4a5cf77afa83ea7ac7d2e5cbb696e3548b2ff975fe6399f57a3d3dbe15aff8b0d791661fa83d7eafdbd95c2f83a9727bba73c6e5f50d2ae065c80ba9ff00f0b9fa24e5fdaad5176f8019e7f7fe544916e0f48fadfddaa05127de5fa9cc73e5f3a60930fabdbf3e54598e26fbbcbb79f3f9d03306bfd4ede7f2f9d458ac75d9fd38bf53b3f95fa7f2f1a2550d7b5fd55ffd7fa97eb7f33ccf2fdb537c955c10e47a73bff63ea1f4be87def4510aff003e0eba2be845fcd7a47d6e7ccf3a163507ce88ff00dc49fcbfd493ebfd4e43e97f5fbaa3bb83a347268fdbff0083e9fd9ffe4d729d67ffd9, 'wolf resting.jpg', 'image/jpeg', '11712', '200', '114');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_reportto`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_reportto` (
  `erep_sup_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_sub_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_reporting_mode` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_skill`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_skill` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL,
  `years_of_exp` decimal(2,0) DEFAULT NULL,
  `comments` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_us_tax`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_us_tax` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `tax_federal_status` varchar(13) DEFAULT NULL,
  `tax_federal_exceptions` int(2) DEFAULT '0',
  `tax_state` varchar(13) DEFAULT NULL,
  `tax_state_status` varchar(13) DEFAULT NULL,
  `tax_state_exceptions` int(2) DEFAULT '0',
  `tax_unemp_state` varchar(13) DEFAULT NULL,
  `tax_work_state` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_work_experience`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_work_experience` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eexp_seqno` decimal(10,0) NOT NULL DEFAULT '0',
  `eexp_employer` varchar(100) DEFAULT NULL,
  `eexp_jobtit` varchar(120) DEFAULT NULL,
  `eexp_from_date` datetime DEFAULT NULL,
  `eexp_to_date` datetime DEFAULT NULL,
  `eexp_comments` varchar(200) DEFAULT NULL,
  `eexp_internal` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_jobtit_empstat`
--

CREATE TABLE IF NOT EXISTS `hs_hr_jobtit_empstat` (
  `jobtit_code` int(7) NOT NULL,
  `estat_code` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_mailnotifications`
--

CREATE TABLE IF NOT EXISTS `hs_hr_mailnotifications` (
  `user_id` int(20) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_module`
--

CREATE TABLE IF NOT EXISTS `hs_hr_module` (
  `mod_id` varchar(36) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `owner_email` varchar(100) DEFAULT NULL,
  `version` varchar(36) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_module`
--

INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES
('MOD001', 'Admin', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Admin'),
('MOD002', 'PIM', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Functions'),
('MOD004', 'Report', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Reporting'),
('MOD005', 'Leave', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Leave Tracking'),
('MOD006', 'Time', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Time Tracking'),
('MOD007', 'Benefits', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Benefits Tracking'),
('MOD008', 'Recruitment', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Recruitment'),
('MOD009', 'Performance', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Performance');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_payperiod`
--

CREATE TABLE IF NOT EXISTS `hs_hr_payperiod` (
  `payperiod_code` varchar(13) NOT NULL DEFAULT '',
  `payperiod_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_payperiod`
--

INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES
('1', 'Weekly'),
('2', 'Bi Weekly'),
('3', 'Semi Monthly'),
('4', 'Monthly'),
('5', 'Monthly on first pay of month.'),
('6', 'Hourly');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_pay_period`
--

CREATE TABLE IF NOT EXISTS `hs_hr_pay_period` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `close_date` date NOT NULL,
  `check_date` date NOT NULL,
  `timesheet_aproval_due_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_province`
--

CREATE TABLE IF NOT EXISTS `hs_hr_province` (
`id` int(11) NOT NULL,
  `province_name` varchar(40) NOT NULL DEFAULT '',
  `province_code` char(2) NOT NULL DEFAULT '',
  `cou_code` char(2) NOT NULL DEFAULT 'us'
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_province`
--

INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES
(1, 'Alaska', 'AK', 'US'),
(2, 'Alabama', 'AL', 'US'),
(3, 'American Samoa', 'AS', 'US'),
(4, 'Arizona', 'AZ', 'US'),
(5, 'Arkansas', 'AR', 'US'),
(6, 'California', 'CA', 'US'),
(7, 'Colorado', 'CO', 'US'),
(8, 'Connecticut', 'CT', 'US'),
(9, 'Delaware', 'DE', 'US'),
(10, 'District of Columbia', 'DC', 'US'),
(11, 'Federated States of Micronesia', 'FM', 'US'),
(12, 'Florida', 'FL', 'US'),
(13, 'Georgia', 'GA', 'US'),
(14, 'Guam', 'GU', 'US'),
(15, 'Hawaii', 'HI', 'US'),
(16, 'Idaho', 'ID', 'US'),
(17, 'Illinois', 'IL', 'US'),
(18, 'Indiana', 'IN', 'US'),
(19, 'Iowa', 'IA', 'US'),
(20, 'Kansas', 'KS', 'US'),
(21, 'Kentucky', 'KY', 'US'),
(22, 'Louisiana', 'LA', 'US'),
(23, 'Maine', 'ME', 'US'),
(24, 'Marshall Islands', 'MH', 'US'),
(25, 'Maryland', 'MD', 'US'),
(26, 'Massachusetts', 'MA', 'US'),
(27, 'Michigan', 'MI', 'US'),
(28, 'Minnesota', 'MN', 'US'),
(29, 'Mississippi', 'MS', 'US'),
(30, 'Missouri', 'MO', 'US'),
(31, 'Montana', 'MT', 'US'),
(32, 'Nebraska', 'NE', 'US'),
(33, 'Nevada', 'NV', 'US'),
(34, 'New Hampshire', 'NH', 'US'),
(35, 'New Jersey', 'NJ', 'US'),
(36, 'New Mexico', 'NM', 'US'),
(37, 'New York', 'NY', 'US'),
(38, 'North Carolina', 'NC', 'US'),
(39, 'North Dakota', 'ND', 'US'),
(40, 'Northern Mariana Islands', 'MP', 'US'),
(41, 'Ohio', 'OH', 'US'),
(42, 'Oklahoma', 'OK', 'US'),
(43, 'Oregon', 'OR', 'US'),
(44, 'Palau', 'PW', 'US'),
(45, 'Pennsylvania', 'PA', 'US'),
(46, 'Puerto Rico', 'PR', 'US'),
(47, 'Rhode Island', 'RI', 'US'),
(48, 'South Carolina', 'SC', 'US'),
(49, 'South Dakota', 'SD', 'US'),
(50, 'Tennessee', 'TN', 'US'),
(51, 'Texas', 'TX', 'US'),
(52, 'Utah', 'UT', 'US'),
(53, 'Vermont', 'VT', 'US'),
(54, 'Virgin Islands', 'VI', 'US'),
(55, 'Virginia', 'VA', 'US'),
(56, 'Washington', 'WA', 'US'),
(57, 'West Virginia', 'WV', 'US'),
(58, 'Wisconsin', 'WI', 'US'),
(59, 'Wyoming', 'WY', 'US'),
(60, 'Armed Forces Africa', 'AE', 'US'),
(61, 'Armed Forces Americas (except Canada)', 'AA', 'US'),
(62, 'Armed Forces Canada', 'AE', 'US'),
(63, 'Armed Forces Europe', 'AE', 'US'),
(64, 'Armed Forces Middle East', 'AE', 'US'),
(65, 'Armed Forces Pacific', 'AP', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_unique_id`
--

CREATE TABLE IF NOT EXISTS `hs_hr_unique_id` (
`id` int(11) NOT NULL,
  `last_id` int(10) unsigned NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_unique_id`
--

INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES
(1, 2, 'hs_hr_employee', 'emp_number'),
(2, 9, 'hs_hr_module', 'mod_id'),
(3, 0, 'hs_hr_leave', 'leave_id'),
(4, 0, 'hs_hr_leavetype', 'leave_type_id'),
(5, 0, 'hs_hr_leave_requests', 'leave_request_id'),
(6, 0, 'hs_hr_custom_export', 'export_id'),
(7, 0, 'hs_hr_custom_import', 'import_id'),
(8, 0, 'hs_hr_pay_period', 'id'),
(9, 0, 'hs_hr_kpi', 'id'),
(10, 0, 'hs_hr_performance_review', 'id'),
(11, 2, 'ohrm_emp_reporting_method', 'reporting_method_id'),
(12, 2, 'ohrm_timesheet', 'timesheet_id'),
(13, 0, 'ohrm_timesheet_action_log', 'timesheet_action_log_id'),
(14, 0, 'ohrm_timesheet_item', 'timesheet_item_id'),
(15, 1, 'ohrm_attendance_record', 'id'),
(16, 2, 'ohrm_job_vacancy', 'id'),
(17, 2, 'ohrm_job_candidate', 'id'),
(18, 120, 'ohrm_workflow_state_machine', 'id'),
(19, 0, 'ohrm_job_candidate_attachment', 'id'),
(20, 0, 'ohrm_job_vacancy_attachment', 'id'),
(21, 2, 'ohrm_job_candidate_vacancy', 'id'),
(22, 4, 'ohrm_job_candidate_history', 'id'),
(23, 0, 'ohrm_job_interview', 'id');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_advanced_report`
--

CREATE TABLE IF NOT EXISTS `ohrm_advanced_report` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_advanced_report`
--

INSERT INTO `ohrm_advanced_report` (`id`, `name`, `definition`) VALUES
(1, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="empNumber" label="Employee Number"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM ohrm_leave_type WHERE (deleted = 0) OR (SELECT count(l.id) FROM ohrm_leave l WHERE l.status = 3 AND l.leave_type_id = ohrm_leave_type.id) > 0 ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="leavetype" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="false">\n                    <field_name>ohrm_leave_type.exclude_in_reports_if_no_entitlement</field_name>\n                    <field_alias>exclude_if_no_entitlement</field_alias>\n                    <display_name>Exclude</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="false">\n                    <field_name>ohrm_leave_type.deleted</field_name>\n                    <field_alias>leave_type_deleted</field_alias>\n                    <display_name>Leave Type Deleted</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>leaveType</field_alias>\n                    <display_name>Leave Type</display_name>\n                    <width>160</width>	\n                </field>s                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.leave_type_id as leave_type_id,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.emp_number,empNumber} AND \n    $X{IN,ohrm_leave_entitlement.leave_type_id,leaveTypeId} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.leave_type_id\nORDER BY A.leave_type_id\n\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 1 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 2 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,emp_number,empNumber} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.leave_type_id,leaveTypeId} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY leave_type_id\nORDER BY ohrm_leave.leave_type_id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="unused">       \n    <query>FROM ohrm_leave_type WHERE deleted = 0 AND $X{IN,ohrm_leave_type.id,leaveTypeId} ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>160</width>	\n                    <align>right</align>\n                </field>                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n\n    <join>             \n        <join_by sub_report="mainTable" id="leaveTypeId"></join_by>              \n        <join_by sub_report="entitlementsTotal" id="leaveTypeId"></join_by> \n        <join_by sub_report="pendingQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="scheduledQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="takenQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="unused" id="leaveTypeId"></join_by>  \n\n    </join>\n    <page_limit>100</page_limit>        \n</report>'),
(2, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="leaveType" label="Leave Type"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n        <input_field type="text" name="emp_numbers" label="employees"></input_field>\n        <input_field type="text" name="job_title" label="Job Title"></input_field>\n        <input_field type="text" name="location" label="Location"></input_field>\n        <input_field type="text" name="sub_unit" label="Sub Unit"></input_field>\n        <input_field type="text" name="terminated" label="Terminated"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM hs_hr_employee \n    LEFT JOIN hs_hr_emp_locations ON hs_hr_employee.emp_number = hs_hr_emp_locations.emp_number\n    WHERE $X{IN,hs_hr_employee.emp_number,emp_numbers} \n    AND $X{=,hs_hr_employee.job_title_code,job_title}\n    AND $X{IN,hs_hr_employee.work_station,sub_unit}\n    AND $X{IN,hs_hr_emp_locations.location_id,location}\n    AND $X{IS NULL,hs_hr_employee.termination_id,terminated}\n    ORDER BY hs_hr_employee.emp_lastname</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="personalDetails" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="false">\n                    <field_name>hs_hr_employee.termination_id</field_name>\n                    <field_alias>termination_id</field_alias>\n                    <display_name>Termination ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>CONCAT(hs_hr_employee.emp_firstname, '' '', hs_hr_employee.emp_lastname)</field_name>\n                    <field_alias>employeeName</field_alias>\n                    <display_name>Employee</display_name>\n                    <width>150</width>\n                </field>                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.emp_number as emp_number,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.leave_type_id,leaveType}\n    AND $X{IN,ohrm_leave_entitlement.emp_number,empNumber} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.emp_number\nORDER BY A.emp_number\n\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 1 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 2 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n<sub_report type="sql" name="unused">       \n    <query>FROM hs_hr_employee WHERE $X{IN,hs_hr_employee.emp_number,empNumber} ORDER BY hs_hr_employee.emp_number</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>    \n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="true">\n                    <field_name>hs_hr_employee.emp_firstname</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>150</width>\n                    <align>right</align>\n                </field> \n                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n    <join>             \n        <join_by sub_report="mainTable" id="empNumber"></join_by>            \n        <join_by sub_report="entitlementsTotal" id="empNumber"></join_by> \n        <join_by sub_report="pendingQuery" id="empNumber"></join_by>\n        <join_by sub_report="scheduledQuery" id="empNumber"></join_by>\n        <join_by sub_report="takenQuery" id="empNumber"></join_by> \n        <join_by sub_report="unused" id="empNumber"></join_by>  \n    </join>\n    <page_limit>20</page_limit>       \n</report>');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_attendance_record`
--

CREATE TABLE IF NOT EXISTS `ohrm_attendance_record` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `punch_in_utc_time` datetime DEFAULT NULL,
  `punch_in_note` varchar(255) DEFAULT NULL,
  `punch_in_time_offset` varchar(255) DEFAULT NULL,
  `punch_in_user_time` datetime DEFAULT NULL,
  `punch_out_utc_time` datetime DEFAULT NULL,
  `punch_out_note` varchar(255) DEFAULT NULL,
  `punch_out_time_offset` varchar(255) DEFAULT NULL,
  `punch_out_user_time` datetime DEFAULT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_attendance_record`
--

INSERT INTO `ohrm_attendance_record` (`id`, `employee_id`, `punch_in_utc_time`, `punch_in_note`, `punch_in_time_offset`, `punch_in_user_time`, `punch_out_utc_time`, `punch_out_note`, `punch_out_time_offset`, `punch_out_user_time`, `state`) VALUES
(1, 1, '2016-04-23 11:25:00', 'Lập kế hoạch', '7', '2016-04-23 18:25:00', NULL, NULL, NULL, NULL, 'PUNCHED IN');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_auth_provider_extra_details`
--

CREATE TABLE IF NOT EXISTS `ohrm_auth_provider_extra_details` (
`id` int(11) NOT NULL,
  `provider_id` int(10) NOT NULL,
  `provider_type` int(11) DEFAULT NULL,
  `client_id` text,
  `client_secret` text,
  `developer_key` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_available_group_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_available_group_field` (
  `report_group_id` bigint(20) NOT NULL,
  `group_field_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_beacon_notification`
--

CREATE TABLE IF NOT EXISTS `ohrm_beacon_notification` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_composite_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_composite_display_field` (
`composite_display_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_composite_display_field`
--

INSERT INTO `ohrm_composite_display_field` (`composite_display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES
(1, 1, 'IF(hs_hr_employee.termination_id IS NULL, CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname), CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname, " (Past Employee)"))', 'Employee Name', 'employeeName', 'false', NULL, NULL, 'label', '<xml><getter>employeeName</getter></xml>', '300', '0', NULL, 0, NULL, 'Deleted Employee', 0, 0),
(2, 1, 'CONCAT(ohrm_customer.name, " - " ,ohrm_project.name)', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '300', '0', NULL, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_customer`
--

CREATE TABLE IF NOT EXISTS `ohrm_customer` (
`customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_customer`
--

INSERT INTO `ohrm_customer` (`customer_id`, `name`, `description`, `is_deleted`) VALUES
(1, 'Công ty 1', '', 0),
(2, 'Công ty 2', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint`
--

CREATE TABLE IF NOT EXISTS `ohrm_datapoint` (
`id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `datapoint_type_id` int(11) NOT NULL,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint_type`
--

CREATE TABLE IF NOT EXISTS `ohrm_datapoint_type` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `action_class` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_datapoint_type`
--

INSERT INTO `ohrm_datapoint_type` (`id`, `name`, `action_class`) VALUES
(1, 'config', 'configDatapointProcessor'),
(2, 'count', 'countDatapointProcessor'),
(3, 'session', 'sessionDatapointProcessor'),
(4, 'organization', 'OrganizationDataProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_data_group` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_data_group`
--

INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES
(1, 'personal_information', 'PIM - Personal Details', 1, NULL, 1, NULL),
(2, 'personal_attachment', 'PIM - Personal Details - Attachments', 1, 1, 1, 1),
(3, 'personal_custom_fields', 'PIM - Personal Details - Custom Fields', 1, NULL, 1, NULL),
(4, 'contact_details', 'PIM - Contact Details', 1, NULL, 1, NULL),
(5, 'contact_attachment', 'PIM - Contact Details - Attachments', 1, 1, 1, 1),
(6, 'contact_custom_fields', 'PIM - Contact Details - Custom Fields', 1, NULL, 1, NULL),
(7, 'emergency_contacts', 'PIM - Emergency Contacts', 1, 1, 1, 1),
(8, 'emergency_attachment', 'PIM - Emergency Contacts - Attachments', 1, 1, 1, 1),
(9, 'emergency_custom_fields', 'PIM - Emergency Contacts - Custom Fields', 1, NULL, 1, NULL),
(10, 'dependents', 'PIM - Dependents', 1, 1, 1, 1),
(11, 'dependents_attachment', 'PIM - Dependents - Attachments', 1, 1, 1, 1),
(12, 'dependents_custom_fields', 'PIM - Dependents - Custom Fields', 1, NULL, 1, NULL),
(13, 'immigration', 'PIM - Immigration', 1, 1, 1, 1),
(14, 'immigration_attachment', 'PIM - Immigration - Attachments', 1, 1, 1, 1),
(15, 'immigration_custom_fields', 'PIM - Immigration - Custom Fields', 1, NULL, 1, NULL),
(16, 'job_details', 'PIM - Job', 1, NULL, 1, NULL),
(17, 'job_attachment', 'PIM - Job - Attachments', 1, 1, 1, 1),
(18, 'job_custom_fields', 'PIM - Job - Custom Fields', 1, NULL, 1, NULL),
(19, 'salary_details', 'PIM - Salary', 1, 1, 1, 1),
(20, 'salary_attachment', 'PIM - Salary - Attachments', 1, 1, 1, 1),
(21, 'salary_custom_fields', 'PIM - Salary - Custom Fields', 1, NULL, 1, NULL),
(22, 'tax_exemptions', 'PIM - Tax Exemptions', 1, NULL, 1, NULL),
(23, 'tax_attachment', 'PIM - Tax Exemptions - Attachments', 1, 1, 1, 1),
(24, 'tax_custom_fields', 'PIM - Tax Exemptions - Custom Fields', 1, NULL, 1, NULL),
(25, 'supervisor', 'PIM - Employee Supervisors', 1, 1, 1, 1),
(26, 'subordinates', 'PIM - Employee Subordinates', 1, 1, 1, 1),
(27, 'report-to_attachment', 'PIM - Employee Supervisors/Subordinates - Attachment', 1, 1, 1, 1),
(28, 'report-to_custom_fields', 'PIM - Employee Supervisors/Subordinates - Custom Fields', 1, NULL, 1, NULL),
(29, 'qualification_work', 'PIM - Qualifications - Work Experience', 1, 1, 1, 1),
(30, 'qualification_education', 'PIM - Qualifications - Education', 1, 1, 1, 1),
(31, 'qualification_skills', 'PIM - Qualifications - Skills', 1, 1, 1, 1),
(32, 'qualification_languages', 'PIM - Qualifications - Languages', 1, 1, 1, 1),
(33, 'qualification_license', 'PIM - Qualifications - License', 1, 1, 1, 1),
(34, 'qualifications_attachment', 'PIM - Qualifications - Attachments', 1, 1, 1, 1),
(35, 'qualifications_custom_fields', 'PIM - Qualifications - Custom Fields', 1, NULL, 1, NULL),
(36, 'membership', 'PIM - Membership', 1, 1, 1, 1),
(37, 'membership_attachment', 'PIM - Membership - Attachments', 1, 1, 1, 1),
(38, 'membership_custom_fields', 'PIM - Membership - Custom Fields', 1, NULL, 1, NULL),
(39, 'photograph', 'PIM - Employee Photograph', 1, NULL, 1, 1),
(40, 'leave_entitlements', 'Leave - Leave Entitlements', 1, 1, 1, 1),
(41, 'leave_entitlements_usage_report', 'Leave - Leave Entitlements and Usage Report', 1, NULL, NULL, NULL),
(42, 'job_titles', 'Admin - Job Titles', 1, 1, 1, 1),
(43, 'pay_grades', 'Admin - Pay Grades', 1, 1, 1, 1),
(44, 'time_customers', 'Time - Project Info - Customers', 1, 1, 1, 1),
(45, 'time_projects', 'Time - Project Info - Projects', 1, 1, 1, 1),
(46, 'pim_reports', 'PIM - Reports', 1, 1, 1, 1),
(47, 'attendance_configuration', 'Time - Attendance Configuration', 1, 0, 1, 0),
(48, 'attendance_records', 'Time - Attendance Records', 1, 0, 0, 0),
(49, 'time_project_reports', 'Time - Project Reports', 1, 0, 0, 0),
(50, 'time_employee_reports', 'Time - Employee Reports', 1, 0, 0, 0),
(51, 'attendance_summary', 'Time - Attendance Summary', 1, 0, 0, 0),
(52, 'leave_period', 'Leave - Leave Period', 1, 0, 1, 0),
(53, 'leave_types', 'Leave - Leave Types', 1, 1, 1, 1),
(54, 'work_week', 'Leave - Work Week', 1, 0, 1, 0),
(55, 'holidays', 'Leave - Holidays', 1, 1, 1, 1),
(56, 'recruitment_vacancies', 'Recruitment - Vacancies', 1, 1, 1, 1),
(57, 'recruitment_candidates', 'Recruitment - Candidates', 1, 1, 1, 1),
(58, 'time_employee_timesheets', 'Time - Employee Timesheets', 1, 0, 0, 0),
(59, 'leave_list', 'Leave - Leave List', 1, 0, 0, 0),
(60, 'leave_list_comments', 'Leave - Leave List - Comments', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group_screen`
--

CREATE TABLE IF NOT EXISTS `ohrm_data_group_screen` (
`id` int(11) NOT NULL,
  `data_group_id` int(11) DEFAULT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_data_group_screen`
--

INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES
(1, 40, 69, 1),
(2, 40, 72, 2),
(3, 40, 73, 3),
(4, 40, 71, 4),
(5, 41, 78, 1),
(6, 42, 23, 1),
(7, 42, 80, 1),
(8, 42, 80, 2),
(9, 42, 80, 3),
(10, 42, 81, 4),
(11, 43, 24, 1),
(12, 43, 82, 1),
(13, 43, 82, 2),
(14, 43, 82, 3),
(15, 43, 83, 4),
(16, 43, 84, 3),
(17, 43, 85, 3),
(18, 42, 74, 1),
(19, 43, 74, 1),
(20, 44, 36, 1),
(21, 44, 86, 2),
(22, 44, 86, 3),
(23, 44, 87, 4),
(24, 45, 37, 1),
(25, 45, 88, 1),
(26, 45, 88, 2),
(27, 45, 88, 3),
(28, 45, 89, 4),
(29, 45, 90, 2),
(30, 45, 90, 3),
(31, 45, 91, 2),
(32, 45, 91, 3),
(33, 46, 45, 1),
(34, 46, 45, 4),
(35, 46, 92, 2),
(36, 46, 92, 3),
(37, 46, 93, 1),
(38, 47, 56, 1),
(39, 47, 56, 3),
(40, 48, 55, 1),
(41, 49, 57, 1),
(42, 49, 102, 1),
(43, 50, 58, 1),
(44, 51, 59, 1),
(45, 51, 101, 1),
(46, 52, 47, 1),
(47, 52, 47, 3),
(48, 53, 7, 1),
(49, 53, 8, 1),
(50, 53, 8, 2),
(51, 53, 8, 3),
(52, 53, 9, 2),
(53, 53, 10, 4),
(54, 54, 14, 1),
(55, 54, 14, 3),
(56, 55, 11, 1),
(57, 55, 12, 2),
(58, 55, 12, 3),
(59, 55, 13, 4),
(60, 56, 61, 1),
(61, 56, 94, 1),
(62, 56, 94, 2),
(63, 56, 94, 3),
(64, 56, 95, 4),
(65, 57, 60, 1),
(66, 57, 96, 1),
(67, 57, 96, 2),
(68, 57, 96, 3),
(69, 57, 97, 4),
(70, 56, 76, 1),
(71, 57, 76, 1),
(72, 58, 52, 1),
(73, 59, 16, 1),
(74, 59, 98, 1),
(75, 59, 99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_display_field` (
`display_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_display_field`
--

INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES
(1, 1, 'ohrm_project.name', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(2, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'link', '<xml><labelGetter>activityname</labelGetter><placeholderGetters><id>activity_id</id><total>totalduration</total><projectId>projectId</projectId><from>fromDate</from><to>toDate</to><approved>onlyIncludeApprovedTimesheets</approved></placeholderGetters><urlPattern>../../displayProjectActivityDetailsReport?reportId=3#activityId={id}#total={total}#from={from}#to={to}#projectId={projectId}#onlyIncludeApprovedTimesheets={approved}</urlPattern></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(3, 1, 'ohrm_project_activity.project_id', 'Project Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>project_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1),
(4, 1, 'ohrm_project_activity.activity_id', 'Activity Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>activity_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1),
(5, 1, 'ohrm_timesheet_item.duration', 'Time (hours)', NULL, 'false', NULL, NULL, 'label', '<xml><getter>duration</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 0),
(6, 1, 'hs_hr_employee.emp_firstname', 'Employee First Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_firstname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(7, 1, 'hs_hr_employee.emp_lastname', 'Employee Last Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_lastname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(8, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'label', '<xml><getter>activityname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(9, 3, 'hs_hr_employee.employee_id', 'Employee Id', 'employeeId', 'false', NULL, NULL, 'label', '<xml><getter>employeeId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(10, 3, 'hs_hr_employee.emp_lastname', 'Employee Last Name', 'employeeLastname', 'false', NULL, NULL, 'label', '<xml><getter>employeeLastname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(11, 3, 'hs_hr_employee.emp_firstname', 'Employee First Name', 'employeeFirstname', 'false', NULL, NULL, 'label', '<xml><getter>employeeFirstname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(12, 3, 'hs_hr_employee.emp_middle_name', 'Employee Middle Name', 'employeeMiddlename', 'false', NULL, NULL, 'label', '<xml><getter>employeeMiddlename</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(13, 3, 'hs_hr_employee.emp_birthday', 'Date of Birth', 'empBirthday', 'false', NULL, NULL, 'labelDate', '<xml><getter>empBirthday</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(14, 3, 'ohrm_nationality.name', 'Nationality', 'nationality', 'false', NULL, NULL, 'label', '<xml><getter>nationality</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(15, 3, 'CASE hs_hr_employee.emp_gender WHEN 1 THEN "Male" WHEN 2 THEN "Female" WHEN 3 THEN "Other" END', 'Gender', 'empGender', 'false', NULL, NULL, 'label', '<xml><getter>empGender</getter></xml>', '80', '0', NULL, 0, 1, '---', 0, 0),
(17, 3, 'hs_hr_employee.emp_marital_status', 'Marital Status', 'maritalStatus', 'false', NULL, NULL, 'label', '<xml><getter>maritalStatus</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(18, 3, 'hs_hr_employee.emp_dri_lice_num', 'Driver License Number', 'driversLicenseNumber', 'false', NULL, NULL, 'label', '<xml><getter>driversLicenseNumber</getter></xml>', '240', '0', NULL, 0, 1, '---', 0, 0),
(19, 3, 'hs_hr_employee.emp_dri_lice_exp_date', 'License Expiry Date', 'licenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>licenseExpiryDate</getter></xml>', '135', '0', NULL, 0, 1, '---', 0, 0),
(20, 3, 'CONCAT_WS(", ", NULLIF(hs_hr_employee.emp_street1, ""), NULLIF(hs_hr_employee.emp_street2, ""), NULLIF(hs_hr_employee.city_code, ""), NULLIF(hs_hr_employee.provin_code,""), NULLIF(hs_hr_employee.emp_zipcode,""), NULLIF(hs_hr_country.cou_name,""))', 'Address', 'address', 'false', NULL, NULL, 'label', '<xml><getter>address</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(21, 3, 'hs_hr_employee.emp_hm_telephone', 'Home Telephone', 'homeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>homeTelephone</getter></xml>', '130', '0', NULL, 0, 2, '---', 0, 0),
(22, 3, 'hs_hr_employee.emp_mobile', 'Mobile', 'mobile', 'false', NULL, NULL, 'label', '<xml><getter>mobile</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0),
(23, 3, 'hs_hr_employee.emp_work_telephone', 'Work Telephone', 'workTelephone', 'false', NULL, NULL, 'label', '<xml><getter>workTelephone</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0),
(24, 3, 'hs_hr_employee.emp_work_email', 'Work Email', 'workEmail', 'false', NULL, NULL, 'label', '<xml><getter>workEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(25, 3, 'hs_hr_employee.emp_oth_email', 'Other Email', 'otherEmail', 'false', NULL, NULL, 'label', '<xml><getter>otherEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(26, 3, 'hs_hr_emp_emergency_contacts.eec_name', 'Name', 'ecname', 'false', NULL, NULL, 'label', '<xml><getter>ecname</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0),
(27, 3, 'hs_hr_emp_emergency_contacts.eec_home_no', 'Home Telephone', 'ecHomeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecHomeTelephone</getter></xml>', '130', '0', NULL, 1, 3, '---', 0, 0),
(28, 3, 'hs_hr_emp_emergency_contacts.eec_office_no', 'Work Telephone', 'ecWorkTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecWorkTelephone</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0),
(29, 3, 'hs_hr_emp_emergency_contacts.eec_relationship', 'Relationship', 'ecRelationship', 'false', NULL, NULL, 'label', '<xml><getter>ecRelationship</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0),
(30, 3, 'hs_hr_emp_emergency_contacts.eec_mobile_no', 'Mobile', 'ecMobile', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0),
(31, 3, 'hs_hr_emp_dependents.ed_name', 'Name', 'dependentName', 'false', NULL, NULL, 'label', '<xml><getter>dependentName</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0),
(32, 3, 'IF (hs_hr_emp_dependents.ed_relationship_type = ''other'', hs_hr_emp_dependents.ed_relationship, hs_hr_emp_dependents.ed_relationship_type)', 'Relationship', 'dependentRelationship', 'false', NULL, NULL, 'label', '<xml><getter>dependentRelationship</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0),
(33, 3, 'hs_hr_emp_dependents.ed_date_of_birth', 'Date of Birth', 'dependentDateofBirth', 'false', NULL, NULL, 'labelDate', '<xml><getter>dependentDateofBirth</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 0),
(35, 3, 'ohrm_membership.name', 'Membership', 'name', 'false', NULL, NULL, 'label', '<xml><getter>name</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(36, 3, 'hs_hr_emp_member_detail.ememb_subscript_ownership', 'Subscription Paid By', 'subscriptionPaidBy', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionPaidBy</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(37, 3, 'hs_hr_emp_member_detail.ememb_subscript_amount', 'Subscription Amount', 'subscriptionAmount', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionAmount</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(38, 3, 'hs_hr_emp_member_detail.ememb_subs_currency', 'Currency', 'membershipCurrency', 'false', NULL, NULL, 'label', '<xml><getter>membershipCurrency</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(39, 3, 'hs_hr_emp_member_detail.ememb_commence_date', 'Subscription Commence Date', 'subscriptionCommenceDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionCommenceDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(40, 3, 'hs_hr_emp_member_detail.ememb_renewal_date', 'Subscription Renewal Date', 'subscriptionRenewalDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionRenewalDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(41, 3, 'hs_hr_emp_work_experience.eexp_employer', 'Company', 'expCompany', 'false', NULL, NULL, 'label', '<xml><getter>expCompany</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(42, 3, 'hs_hr_emp_work_experience.eexp_jobtit', 'Job Title', 'expJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>expJobTitle</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(43, 3, 'hs_hr_emp_work_experience.eexp_from_date', 'From', 'expFrom', 'false', NULL, NULL, 'labelDate', '<xml><getter>expFrom</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(44, 3, 'hs_hr_emp_work_experience.eexp_to_date', 'To', 'expTo', 'false', NULL, NULL, 'labelDate', '<xml><getter>expTo</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(45, 3, 'hs_hr_emp_work_experience.eexp_comments', 'Comment', 'expComment', 'false', NULL, NULL, 'label', '<xml><getter>expComment</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(47, 3, 'ohrm_education.name', 'Level', 'eduProgram', 'false', NULL, NULL, 'label', '<xml><getter>eduProgram</getter></xml>', '200', '0', NULL, 1, 11, '---', 0, 0),
(48, 3, 'ohrm_emp_education.year', 'Year', 'eduYear', 'false', NULL, NULL, 'label', '<xml><getter>eduYear</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 0),
(49, 3, 'ohrm_emp_education.score', 'Score', 'eduGPAOrScore', 'false', NULL, NULL, 'label', '<xml><getter>eduGPAOrScore</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(52, 3, 'ohrm_skill.name', 'Skill', 'skill', 'false', NULL, NULL, 'label', '<xml><getter>skill</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0),
(53, 3, 'hs_hr_emp_skill.years_of_exp', 'Years of Experience', 'skillYearsOfExperience', 'false', NULL, NULL, 'label', '<xml><getter>skillYearsOfExperience</getter></xml>', '135', '0', NULL, 1, 12, '---', 0, 0),
(54, 3, 'hs_hr_emp_skill.comments', 'Comments', 'skillComments', 'false', NULL, NULL, 'label', '<xml><getter>skillComments</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0),
(55, 3, 'ohrm_language.name', 'Language', 'langName', 'false', NULL, NULL, 'label', '<xml><getter>langName</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(57, 3, 'CASE hs_hr_emp_language.competency WHEN 1 THEN "Poor" WHEN 2 THEN "Basic" WHEN 3 THEN "Good" WHEN 4 THEN "Mother Tongue" END', 'Competency', 'langCompetency', 'false', NULL, NULL, 'label', '<xml><getter>langCompetency</getter></xml>', '130', '0', NULL, 1, 13, '---', 0, 0),
(58, 3, 'hs_hr_emp_language.comments', 'Comments', 'langComments', 'false', NULL, NULL, 'label', '<xml><getter>langComments</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(59, 3, 'ohrm_license.name', 'License Type', 'empLicenseType', 'false', NULL, NULL, 'label', '<xml><getter>empLicenseType</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0),
(60, 3, 'ohrm_emp_license.license_issued_date', 'Issued Date', 'empLicenseIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseIssuedDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0),
(61, 3, 'ohrm_emp_license.license_expiry_date', 'Expiry Date', 'empLicenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseExpiryDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0),
(62, 3, 'supervisor.emp_firstname', 'First Name', 'supervisorFirstName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorFirstName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(63, 3, 'subordinate.emp_firstname', 'First Name', 'subordinateFirstName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateFirstName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(64, 3, 'supervisor.emp_lastname', 'Last Name', 'supervisorLastName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorLastName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(65, 3, 'ohrm_pay_grade.name', 'Pay Grade', 'salPayGrade', 'false', NULL, NULL, 'label', '<xml><getter>salPayGrade</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(66, 3, 'hs_hr_emp_basicsalary.salary_component', 'Salary Component', 'salSalaryComponent', 'false', NULL, NULL, 'label', '<xml><getter>salSalaryComponent</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(67, 3, 'hs_hr_emp_basicsalary.ebsal_basic_salary', 'Amount', 'salAmount', 'false', NULL, NULL, 'label', '<xml><getter>salAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 1, 0),
(68, 3, 'hs_hr_emp_basicsalary.comments', 'Comments', 'salComments', 'false', NULL, NULL, 'label', '<xml><getter>salComments</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(69, 3, 'hs_hr_payperiod.payperiod_name', 'Pay Frequency', 'salPayFrequency', 'false', NULL, NULL, 'label', '<xml><getter>salPayFrequency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(70, 3, 'hs_hr_currency_type.currency_name', 'Currency', 'salCurrency', 'false', NULL, NULL, 'label', '<xml><getter>salCurrency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(71, 3, 'hs_hr_emp_directdebit.dd_account', 'Direct Deposit Account Number', 'ddAccountNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(72, 3, 'hs_hr_emp_directdebit.dd_account_type', 'Direct Deposit Account Type', 'ddAccountType', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountType</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(73, 3, 'hs_hr_emp_directdebit.dd_routing_num', 'Direct Deposit Routing Number', 'ddRoutingNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddRoutingNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(74, 3, 'hs_hr_emp_directdebit.dd_amount', 'Direct Deposit Amount', 'ddAmount', 'false', NULL, NULL, 'label', '<xml><getter>ddAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(75, 3, 'hs_hr_emp_contract_extend.econ_extend_start_date', 'Contract Start Date', 'empContStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContStartDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(76, 3, 'hs_hr_emp_contract_extend.econ_extend_end_date', 'Contract End Date', 'empContEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContEndDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(77, 3, 'ohrm_job_title.job_title', 'Job Title', 'empJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>empJobTitle</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(78, 3, 'ohrm_employment_status.name', 'Employment Status', 'empEmploymentStatus', 'false', NULL, NULL, 'label', '<xml><getter>empEmploymentStatus</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(80, 3, 'ohrm_job_category.name', 'Job Category', 'empJobCategory', 'false', NULL, NULL, 'label', '<xml><getter>empJobCategory</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(81, 3, 'hs_hr_employee.joined_date', 'Joined Date', 'empJoinedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empJoinedDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(82, 3, 'ohrm_subunit.name', 'Sub Unit', 'empSubUnit', 'false', NULL, NULL, 'label', '<xml><getter>empSubUnit</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(83, 3, 'ohrm_location.name', 'Location', 'empLocation', 'false', NULL, NULL, 'label', '<xml><getter>empLocation</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(84, 3, 'hs_hr_emp_passport.ep_passport_num', 'Number', 'empPassportNo', 'false', NULL, NULL, 'label', '<xml><getter>empPassportNo</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(85, 3, 'hs_hr_emp_passport.ep_passportissueddate', 'Issued Date', 'empPassportIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportIssuedDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0),
(86, 3, 'hs_hr_emp_passport.ep_passportexpiredate', 'Expiry Date', 'empPassportExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportExpiryDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0),
(87, 3, 'hs_hr_emp_passport.ep_i9_status', 'Eligibility Status', 'empPassportEligibleStatus', 'false', NULL, NULL, 'label', '<xml><getter>empPassportEligibleStatus</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(88, 3, 'hs_hr_emp_passport.cou_code', 'Issued By', 'empPassportIssuedBy', 'false', NULL, NULL, 'label', '<xml><getter>empPassportIssuedBy</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(89, 3, 'hs_hr_emp_passport.ep_i9_review_date', 'Eligibility Review Date', 'empPassportEligibleReviewDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportEligibleReviewDate</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(90, 3, 'hs_hr_emp_passport.ep_comments', 'Comments', 'empPassportComments', 'false', NULL, NULL, 'label', '<xml><getter>empPassportComments</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(91, 3, 'subordinate.emp_lastname', 'Last Name', 'subordinateLastName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateLastName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(92, 3, 'CASE hs_hr_emp_language.fluency WHEN 1 THEN "Writing" WHEN 2 THEN "Speaking" WHEN 3 THEN "Reading" END', 'Fluency', 'langFluency', 'false', NULL, NULL, 'label', '<xml><getter>langFluency</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(93, 3, 'supervisor_reporting_method.reporting_method_name', 'Reporting Method', 'supReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>supReportingMethod</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(94, 3, 'subordinate_reporting_method.reporting_method_name', 'Reporting Method', 'subReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>subReportingMethod</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(95, 3, 'CASE hs_hr_emp_passport.ep_passport_type_flg WHEN 1 THEN "Passport" WHEN 2 THEN "Visa" END', 'Document Type', 'documentType', 'false', NULL, NULL, 'label', '<xml><getter>documentType</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(97, 3, 'hs_hr_employee.emp_other_id', 'Other Id', 'otherId', 'false', NULL, NULL, 'label', '<xml><getter>otherId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(98, 3, 'hs_hr_emp_emergency_contacts.eec_seqno', 'ecSeqNo', 'ecSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 1),
(99, 3, 'hs_hr_emp_dependents.ed_seqno', 'SeqNo', 'edSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 1),
(100, 3, 'hs_hr_emp_passport.ep_seqno', 'SeqNo', 'epSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 1),
(101, 3, 'hs_hr_emp_basicsalary.id', 'salaryId', 'salaryId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 7, '---', 0, 1),
(102, 3, 'subordinate.emp_number', 'subordinateId', 'subordinateId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 8, '---', 0, 1),
(103, 3, 'supervisor.emp_number', 'supervisorId', 'supervisorId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 9, '---', 0, 1),
(104, 3, 'hs_hr_emp_work_experience.eexp_seqno', 'workExpSeqNo', 'workExpSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 1),
(105, 3, 'ohrm_emp_education.education_id', 'empEduCode', 'empEduCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 1),
(106, 3, 'hs_hr_emp_skill.skill_id', 'empSkillCode', 'empSkillCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 12, '---', 0, 1),
(107, 3, 'hs_hr_emp_language.lang_id', 'empLangCode', 'empLangCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1),
(108, 3, 'hs_hr_emp_language.fluency', 'empLangType', 'empLangType', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1),
(109, 3, 'ohrm_emp_license.license_id', 'empLicenseCode', 'empLicenseCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 1),
(110, 3, 'hs_hr_emp_member_detail.membship_code', 'membershipCode', 'membershipCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 15, '---', 0, 1),
(112, 3, 'ROUND(DATEDIFF(hs_hr_emp_work_experience.eexp_to_date, hs_hr_emp_work_experience.eexp_from_date)/365,1)', 'Duration', 'expDuration', 'false', NULL, NULL, 'label', '<xml><getter>expDuration</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(113, 3, 'ohrm_emp_termination.termination_date', 'Termination Date', 'terminationDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>terminationDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(114, 3, 'ohrm_emp_termination_reason.name', 'Termination Reason', 'terminationReason', 'false', NULL, NULL, 'label', '<xml><getter>terminationReason</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(115, 3, 'ohrm_emp_education.institute', 'Institute', 'getInstitute', 'false', NULL, NULL, 'label', '<xml><getter>getInstitute</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(116, 3, 'ohrm_emp_education.major', 'Major/Specialization', 'getMajor', 'false', NULL, NULL, 'label', '<xml><getter>getMajor</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(117, 3, 'ohrm_emp_education.start_date', 'Start Date', 'getStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getStartDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(118, 3, 'ohrm_emp_education.end_date', 'End Date', 'getEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getEndDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(119, 3, 'ohrm_emp_license.license_no', 'License Number', 'getLicenseNo', 'false', NULL, NULL, 'label', '<xml><getter>getLicenseNo</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0),
(120, 3, 'ohrm_emp_termination.note', 'Termination Note', 'getNote', 'false', NULL, NULL, 'label', '<xml><getter>getNote</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_display_field_group` (
`id` int(10) unsigned NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_list` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_display_field_group`
--

INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES
(1, 3, 'Personal', 0),
(2, 3, 'Contact Details', 0),
(3, 3, 'Emergency Contacts', 1),
(4, 3, 'Dependents', 1),
(5, 3, 'Immigration', 1),
(6, 3, 'Job', 0),
(7, 3, 'Salary', 1),
(8, 3, 'Subordinates', 1),
(9, 3, 'Supervisors', 1),
(10, 3, 'Work Experience', 1),
(11, 3, 'Education', 1),
(12, 3, 'Skills', 1),
(13, 3, 'Languages', 1),
(14, 3, 'License', 1),
(15, 3, 'Memberships', 1),
(16, 3, 'Custom Fields', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_education`
--

CREATE TABLE IF NOT EXISTS `ohrm_education` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_education`
--

INSERT INTO `ohrm_education` (`id`, `name`) VALUES
(1, 'Đại học');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email`
--

CREATE TABLE IF NOT EXISTS `ohrm_email` (
`id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email`
--

INSERT INTO `ohrm_email` (`id`, `name`) VALUES
(1, 'leave.apply'),
(3, 'leave.approve'),
(2, 'leave.assign'),
(4, 'leave.cancel'),
(6, 'leave.change'),
(5, 'leave.reject');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_configuration`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_configuration` (
`id` int(10) NOT NULL,
  `mail_type` varchar(50) DEFAULT NULL,
  `sent_as` varchar(250) NOT NULL,
  `sendmail_path` varchar(250) DEFAULT NULL,
  `smtp_host` varchar(250) DEFAULT NULL,
  `smtp_port` int(10) DEFAULT NULL,
  `smtp_username` varchar(250) DEFAULT NULL,
  `smtp_password` varchar(250) DEFAULT NULL,
  `smtp_auth_type` varchar(50) DEFAULT NULL,
  `smtp_security_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_notification`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_notification` (
`id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_enable` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email_notification`
--

INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`) VALUES
(1, 'Leave Applications', 0),
(2, 'Leave Assignments', 0),
(3, 'Leave Approvals', 0),
(4, 'Leave Cancellations', 0),
(5, 'Leave Rejections', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_processor`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_processor` (
`id` int(6) NOT NULL,
  `email_id` int(6) NOT NULL,
  `class_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email_processor`
--

INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES
(1, 1, 'LeaveEmailProcessor'),
(2, 2, 'LeaveEmailProcessor'),
(3, 3, 'LeaveEmailProcessor'),
(4, 4, 'LeaveEmailProcessor'),
(5, 5, 'LeaveEmailProcessor'),
(6, 6, 'LeaveChangeMailProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_subscriber`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_subscriber` (
`id` int(6) NOT NULL,
  `notification_id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_template`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_template` (
`id` int(6) NOT NULL,
  `email_id` int(6) NOT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `performer_role` varchar(50) DEFAULT NULL,
  `recipient_role` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email_template`
--

INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES
(1, 1, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationBody.txt'),
(2, 1, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubscriberBody.txt'),
(3, 3, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalBody.txt'),
(4, 3, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberBody.txt'),
(5, 2, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBody.txt'),
(6, 2, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubjectForSupervisors.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBodyForSupervisors.txt'),
(7, 2, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberBody.txt'),
(8, 4, 'en_US', 'ess', 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationBody.txt'),
(9, 4, 'en_US', 'ess', 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberBody.txt'),
(10, 4, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationBody.txt'),
(11, 4, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberBody.txt'),
(12, 5, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionBody.txt'),
(13, 5, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberBody.txt'),
(14, 6, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeBody.txt'),
(15, 6, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberBody.txt');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employee_work_shift`
--

CREATE TABLE IF NOT EXISTS `ohrm_employee_work_shift` (
`work_shift_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employment_status`
--

CREATE TABLE IF NOT EXISTS `ohrm_employment_status` (
`id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_education`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_education` (
`id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `institute` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `year` decimal(4,0) DEFAULT NULL,
  `score` varchar(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_license`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_license` (
  `emp_number` int(11) NOT NULL,
  `license_id` int(11) NOT NULL,
  `license_no` varchar(50) DEFAULT NULL,
  `license_issued_date` date DEFAULT NULL,
  `license_expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_reporting_method`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_reporting_method` (
`reporting_method_id` int(7) NOT NULL,
  `reporting_method_name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_emp_reporting_method`
--

INSERT INTO `ohrm_emp_reporting_method` (`reporting_method_id`, `reporting_method_name`) VALUES
(1, 'Direct'),
(2, 'Indirect');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_termination` (
`id` int(4) NOT NULL,
  `emp_number` int(4) DEFAULT NULL,
  `reason_id` int(4) DEFAULT NULL,
  `termination_date` date NOT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination_reason`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_termination_reason` (
`id` int(4) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_emp_termination_reason`
--

INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES
(1, 'Other'),
(2, 'Retired'),
(3, 'Contract Not Renewed'),
(4, 'Resigned - Company Requested'),
(5, 'Resigned - Self Proposed'),
(6, 'Resigned'),
(7, 'Deceased'),
(8, 'Physically Disabled/Compensated'),
(9, 'Laid-off'),
(10, 'Dismissed');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_filter_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_filter_field` (
  `filter_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `where_clause_part` mediumtext NOT NULL,
  `filter_field_widget` varchar(255) DEFAULT NULL,
  `condition_no` int(20) NOT NULL,
  `required` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_filter_field`
--

INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES
(1, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectList', 2, 'true'),
(2, 1, 'activity_show_deleted', 'ohrm_project_activity.is_deleted', 'ohrmWidgetInputCheckbox', 2, 'false'),
(3, 1, 'project_date_range', 'date', 'ohrmWidgetDateRange', 1, 'false'),
(4, 1, 'employee', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 2, 'true'),
(5, 1, 'activity_name', 'ohrm_project_activity.activity_id', 'ohrmWidgetProjectActivityList', 2, 'true'),
(6, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectListWithAllOption', 2, 'true'),
(7, 1, 'only_include_approved_timesheets', 'ohrm_timesheet.state', 'ohrmWidgetApprovedTimesheetInputCheckBox', 2, NULL),
(8, 3, 'employee_name', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 1, NULL),
(9, 3, 'pay_grade', 'hs_hr_emp_basicsalary.sal_grd_code', 'ohrmReportWidgetPayGradeDropDown', 1, NULL),
(10, 3, 'education', 'ohrm_emp_education.education_id', 'ohrmReportWidgetEducationtypeDropDown', 1, NULL),
(11, 3, 'employment_status', 'hs_hr_employee.emp_status', 'ohrmWidgetEmploymentStatusList', 1, NULL),
(12, 3, 'service_period', 'datediff(current_date(), hs_hr_employee.joined_date)/365', 'ohrmReportWidgetServicePeriod', 1, NULL),
(13, 3, 'joined_date', 'hs_hr_employee.joined_date', 'ohrmReportWidgetJoinedDate', 1, NULL),
(14, 3, 'job_title', 'hs_hr_employee.job_title_code', 'ohrmWidgetJobTitleList', 1, NULL),
(15, 3, 'language', 'hs_hr_emp_language.lang_id', 'ohrmReportWidgetLanguageDropDown', 1, NULL),
(16, 3, 'skill', 'hs_hr_emp_skill.skill_id', 'ohrmReportWidgetSkillDropDown', 1, NULL),
(17, 3, 'age_group', 'datediff(current_date(), hs_hr_employee.emp_birthday)/365', 'ohrmReportWidgetAgeGroup', 1, NULL),
(18, 3, 'sub_unit', 'hs_hr_employee.work_station', 'ohrmWidgetSubDivisionList', 1, NULL),
(19, 3, 'gender', 'hs_hr_employee.emp_gender', 'ohrmReportWidgetGenderDropDown', 1, NULL),
(20, 3, 'location', 'ohrm_location.id', 'ohrmReportWidgetOperationalCountryLocationDropDown', 1, NULL),
(21, 1, 'is_deleted', 'ohrm_project_activity.is_deleted', '', 2, NULL),
(22, 3, 'include', 'hs_hr_employee.termination_id', 'ohrmReportWidgetIncludedEmployeesDropDown', 1, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_group_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_by_clause` mediumtext NOT NULL,
  `group_field_widget` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_group_field`
--

INSERT INTO `ohrm_group_field` (`group_field_id`, `name`, `group_by_clause`, `group_field_widget`) VALUES
(1, 'activity id', 'GROUP BY ohrm_project_activity.activity_id', NULL),
(2, 'employee number', 'GROUP BY hs_hr_employee.emp_number', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_holiday`
--

CREATE TABLE IF NOT EXISTS `ohrm_holiday` (
`id` int(10) unsigned NOT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `recurring` tinyint(3) unsigned DEFAULT '0',
  `length` int(10) unsigned DEFAULT NULL,
  `operational_country_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_home_page`
--

CREATE TABLE IF NOT EXISTS `ohrm_home_page` (
`id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_home_page`
--

INSERT INTO `ohrm_home_page` (`id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES
(1, 1, 'dashboard/index', NULL, 15),
(2, 2, 'dashboard/index', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_candidate` (
  `id` int(13) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `comment` text,
  `mode_of_application` int(4) NOT NULL,
  `date_of_application` date NOT NULL,
  `cv_file_id` int(13) DEFAULT NULL,
  `cv_text_version` text,
  `keywords` varchar(255) DEFAULT NULL,
  `added_person` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_candidate`
--

INSERT INTO `ohrm_job_candidate` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `contact_number`, `status`, `comment`, `mode_of_application`, `date_of_application`, `cv_file_id`, `cv_text_version`, `keywords`, `added_person`) VALUES
(1, 'Hưng', 'Quang', 'Trần', 'tranquanghungtqh1812@gmail.com', '0985937800', 1, '', 1, '2016-04-23', NULL, NULL, '', NULL),
(2, 'Sơn', 'Hà', 'Nguyễn Tất', 'nguyentathason@gmail.com', '', 1, '', 1, '2016-04-23', NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_attachment`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_candidate_attachment` (
`id` int(13) NOT NULL,
  `candidate_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_history`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_candidate_history` (
`id` int(13) NOT NULL,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) DEFAULT NULL,
  `candidate_vacancy_name` varchar(255) DEFAULT NULL,
  `interview_id` int(13) DEFAULT NULL,
  `action` int(4) NOT NULL,
  `performed_by` int(13) DEFAULT NULL,
  `performed_date` datetime NOT NULL,
  `note` text,
  `interviewers` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_candidate_history`
--

INSERT INTO `ohrm_job_candidate_history` (`id`, `candidate_id`, `vacancy_id`, `candidate_vacancy_name`, `interview_id`, `action`, `performed_by`, `performed_date`, `note`, `interviewers`) VALUES
(1, 1, NULL, NULL, NULL, 16, NULL, '2016-04-23 06:58:11', NULL, NULL),
(2, 2, 1, 'Lập trình viên PHP', NULL, 1, NULL, '2016-04-23 08:45:16', NULL, NULL),
(3, 2, NULL, NULL, NULL, 16, NULL, '2016-04-23 08:45:16', NULL, NULL),
(4, 1, 1, 'Lập trình viên PHP', NULL, 1, NULL, '2016-04-23 08:45:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_vacancy`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_candidate_vacancy` (
  `id` int(13) DEFAULT NULL,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_candidate_vacancy`
--

INSERT INTO `ohrm_job_candidate_vacancy` (`id`, `candidate_id`, `vacancy_id`, `status`, `applied_date`) VALUES
(2, 1, 1, 'APPLICATION INITIATED', '2016-04-23'),
(1, 2, 1, 'APPLICATION INITIATED', '2016-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_category`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_category` (
`id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_category`
--

INSERT INTO `ohrm_job_category` (`id`, `name`) VALUES
(1, 'Officials and Managers'),
(2, 'Professionals'),
(3, 'Technicians'),
(4, 'Sales Workers'),
(5, 'Operatives'),
(6, 'Office and Clerical Workers'),
(7, 'Craft Workers'),
(8, 'Service Workers'),
(9, 'Laborers and Helpers');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_interview` (
`id` int(13) NOT NULL,
  `candidate_vacancy_id` int(13) DEFAULT NULL,
  `candidate_id` int(13) DEFAULT NULL,
  `interview_name` varchar(100) NOT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_attachment`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_interview_attachment` (
`id` int(13) NOT NULL,
  `interview_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_interviewer`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_interview_interviewer` (
  `interview_id` int(13) NOT NULL,
  `interviewer_id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_specification_attachment`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_specification_attachment` (
`id` int(13) NOT NULL,
  `job_title_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_title`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_title` (
`id` int(13) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `job_description` varchar(400) DEFAULT NULL,
  `note` varchar(400) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_title`
--

INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES
(1, 'Developer', '', '', 0),
(2, 'Tester', '', '', 0),
(3, 'Business Analytics', '', '', 0),
(4, 'Project Manager', '', '', 0),
(5, 'Technical Leader', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_vacancy` (
  `id` int(13) NOT NULL,
  `job_title_code` int(4) NOT NULL,
  `hiring_manager_id` int(13) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `no_of_positions` int(13) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `published_in_feed` tinyint(1) NOT NULL DEFAULT '0',
  `defined_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_vacancy`
--

INSERT INTO `ohrm_job_vacancy` (`id`, `job_title_code`, `hiring_manager_id`, `name`, `description`, `no_of_positions`, `status`, `published_in_feed`, `defined_time`, `updated_time`) VALUES
(1, 1, 1, 'Lập trình viên PHP', '', NULL, 1, 1, '2016-04-23 06:59:02', '2016-04-23 06:59:02'),
(2, 2, 1, 'Kiểm thử phần mềm', '', NULL, 1, 1, '2016-04-23 08:46:16', '2016-04-23 08:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy_attachment`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_vacancy_attachment` (
`id` int(13) NOT NULL,
  `vacancy_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_kpi`
--

CREATE TABLE IF NOT EXISTS `ohrm_kpi` (
`id` bigint(20) NOT NULL,
  `job_title_code` varchar(10) DEFAULT NULL,
  `kpi_indicators` varchar(255) DEFAULT NULL,
  `min_rating` int(7) DEFAULT '0',
  `max_rating` int(7) DEFAULT '0',
  `default_kpi` smallint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_kpi`
--

INSERT INTO `ohrm_kpi` (`id`, `job_title_code`, `kpi_indicators`, `min_rating`, `max_rating`, `default_kpi`, `deleted_at`) VALUES
(1, '1', 'KPI_Developer', 40, 100, NULL, NULL),
(2, '4', 'KPI_Project Manager', 60, 100, NULL, NULL),
(3, '5', 'KPI_Technical Leader', 60, 100, NULL, NULL),
(4, '3', 'KPI_Business Analytics', 40, 100, NULL, NULL),
(5, '2', 'KPI_Tester', 40, 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_language`
--

CREATE TABLE IF NOT EXISTS `ohrm_language` (
`id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave` (
`id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `length_hours` decimal(6,2) unsigned DEFAULT NULL,
  `length_days` decimal(6,4) unsigned DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `comments` varchar(256) DEFAULT NULL,
  `leave_request_id` int(10) unsigned NOT NULL,
  `leave_type_id` int(10) unsigned NOT NULL,
  `emp_number` int(7) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `duration_type` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave`
--

INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES
(1, '2016-04-01', '4.00', '0.5000', 3, NULL, 1, 1, 2, '09:00:00', '13:00:00', 1),
(2, '2016-04-02', '0.00', '0.0000', 4, NULL, 1, 1, 2, '09:00:00', '13:00:00', 1),
(3, '2016-04-03', '0.00', '0.0000', 4, NULL, 1, 1, 2, '09:00:00', '13:00:00', 1),
(4, '2016-04-04', '4.00', '0.5000', 3, NULL, 1, 1, 2, '09:00:00', '13:00:00', 1),
(5, '2016-04-05', '4.00', '0.5000', 3, NULL, 1, 1, 2, '09:00:00', '13:00:00', 1),
(6, '2016-04-06', '4.00', '0.5000', 3, NULL, 1, 1, 2, '09:00:00', '13:00:00', 1),
(7, '2016-04-07', '4.00', '0.5000', 3, NULL, 1, 1, 2, '09:00:00', '13:00:00', 1),
(8, '2016-04-08', '4.00', '0.5000', 3, NULL, 1, 1, 2, '09:00:00', '13:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_adjustment`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_adjustment` (
`id` int(10) unsigned NOT NULL,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `leave_type_id` int(10) unsigned NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `adjustment_type` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_comment`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_comment` (
`id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_entitlement` (
`id` int(10) unsigned NOT NULL,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `days_used` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `leave_type_id` int(10) unsigned NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `entitlement_type` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_entitlement`
--

INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES
(1, 2, '1.000000000000000', '1.0000', 1, '2016-03-01 00:00:00', '2017-02-28 00:00:00', '2016-04-23 00:00:00', NULL, 1, 0, 1, 'Admin'),
(2, 1, '2.000000000000000', '0.0000', 1, '2016-03-01 00:00:00', '2017-02-28 00:00:00', '2016-04-23 00:00:00', NULL, 1, 0, 1, 'Hưng');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_adjustment`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_entitlement_adjustment` (
`id` int(11) NOT NULL,
  `adjustment_id` int(10) unsigned NOT NULL,
  `entitlement_id` int(10) unsigned NOT NULL,
  `length_days` decimal(4,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_type`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_entitlement_type` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_editable` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_entitlement_type`
--

INSERT INTO `ohrm_leave_entitlement_type` (`id`, `name`, `is_editable`) VALUES
(1, 'Added', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_leave_entitlement`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_leave_entitlement` (
`id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `entitlement_id` int(10) unsigned NOT NULL,
  `length_days` decimal(6,4) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_leave_entitlement`
--

INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES
(1, 1, 1, '0.5000'),
(2, 4, 1, '0.5000');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_period_history`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_period_history` (
`id` int(11) NOT NULL,
  `leave_period_start_month` int(11) NOT NULL,
  `leave_period_start_day` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_period_history`
--

INSERT INTO `ohrm_leave_period_history` (`id`, `leave_period_start_month`, `leave_period_start_day`, `created_at`) VALUES
(1, 3, 1, '2016-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_request` (
`id` int(10) unsigned NOT NULL,
  `leave_type_id` int(10) unsigned NOT NULL,
  `date_applied` date NOT NULL,
  `emp_number` int(7) NOT NULL,
  `comments` varchar(256) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_request`
--

INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES
(1, 1, '2016-04-01', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request_comment`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_request_comment` (
`id` int(11) NOT NULL,
  `leave_request_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_status`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_status` (
`id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_status`
--

INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES
(1, -1, 'REJECTED'),
(2, 0, 'CANCELLED'),
(3, 1, 'PENDING APPROVAL'),
(4, 2, 'SCHEDULED'),
(5, 3, 'TAKEN'),
(6, 4, 'WEEKEND'),
(7, 5, 'HOLIDAY');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_type`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_type` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `exclude_in_reports_if_no_entitlement` tinyint(1) NOT NULL DEFAULT '0',
  `operational_country_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_type`
--

INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES
(1, '1', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_license`
--

CREATE TABLE IF NOT EXISTS `ohrm_license` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_location`
--

CREATE TABLE IF NOT EXISTS `ohrm_location` (
`id` int(11) NOT NULL,
  `name` varchar(110) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `province` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(35) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `fax` varchar(35) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_login`
--

CREATE TABLE IF NOT EXISTS `ohrm_login` (
`id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role_name` text NOT NULL,
  `user_role_predefined` tinyint(1) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_login`
--

INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES
(1, 1, 'Admin', 'Admin', 1, '2016-04-23 02:51:34'),
(2, 1, 'Admin', 'Admin', 1, '2016-04-23 06:12:18'),
(3, 1, 'Admin', 'Admin', 1, '2016-04-23 06:26:30'),
(4, 1, 'Admin', 'Admin', 1, '2016-04-23 06:57:27'),
(5, 1, 'Admin', 'Admin', 1, '2016-04-23 07:04:17'),
(6, 1, 'Admin', 'Admin', 1, '2016-04-23 07:06:04'),
(7, 1, 'Admin', 'Admin', 1, '2016-04-23 07:30:54'),
(8, 1, 'Admin', 'Admin', 1, '2016-04-23 07:38:44'),
(9, 1, 'Hưng', 'Admin', 1, '2016-04-23 11:05:10');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_membership`
--

CREATE TABLE IF NOT EXISTS `ohrm_membership` (
`id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_menu_item`
--

CREATE TABLE IF NOT EXISTS `ohrm_menu_item` (
`id` int(11) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `order_hint` int(11) NOT NULL,
  `url_extras` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_menu_item`
--

INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES
(1, 'Admin', 74, NULL, 1, 100, NULL, 1),
(2, 'User Management', NULL, 1, 2, 100, NULL, 1),
(3, 'Project Info', NULL, 52, 2, 400, NULL, 0),
(4, 'Customers', 36, 3, 3, 100, NULL, 1),
(5, 'Projects', 37, 3, 3, 200, NULL, 1),
(6, 'Job', NULL, 1, 2, 300, NULL, 1),
(7, 'Job Titles', 23, 6, 3, 100, NULL, 1),
(8, 'Pay Grades', 24, 6, 3, 200, NULL, 1),
(9, 'Employment Status', 25, 6, 3, 300, NULL, 1),
(10, 'Job Categories', 26, 6, 3, 400, NULL, 1),
(11, 'Work Shifts', 27, 6, 3, 500, NULL, 1),
(12, 'Organization', NULL, 1, 2, 400, NULL, 1),
(13, 'General Information', 20, 12, 3, 100, NULL, 1),
(14, 'Locations', 21, 12, 3, 200, NULL, 1),
(15, 'Structure', 22, 12, 3, 300, NULL, 1),
(16, 'Qualifications', NULL, 1, 2, 500, NULL, 1),
(17, 'Skills', 28, 16, 3, 100, NULL, 1),
(18, 'Education', 29, 16, 3, 200, NULL, 1),
(19, 'Licenses', 30, 16, 3, 300, NULL, 1),
(20, 'Languages', 31, 16, 3, 400, NULL, 1),
(21, 'Memberships', 32, 16, 3, 500, NULL, 1),
(22, 'Nationalities', 33, 1, 2, 700, NULL, 1),
(23, 'Configuration', NULL, 1, 2, 900, NULL, 1),
(24, 'Email Configuration', 34, 23, 3, 100, NULL, 1),
(25, 'Email Subscriptions', 35, 23, 3, 200, NULL, 1),
(27, 'Localization', 38, 23, 3, 300, NULL, 1),
(28, 'Modules', 39, 23, 3, 400, NULL, 1),
(30, 'PIM', 75, NULL, 1, 200, NULL, 1),
(31, 'Configuration', NULL, 30, 2, 100, NULL, 1),
(32, 'Optional Fields', 40, 31, 3, 100, NULL, 1),
(33, 'Custom Fields', 41, 31, 3, 200, NULL, 1),
(34, 'Data Import', 42, 31, 3, 300, NULL, 1),
(35, 'Reporting Methods', 43, 31, 3, 400, NULL, 1),
(36, 'Termination Reasons', 44, 31, 3, 500, NULL, 1),
(37, 'Employee List', 5, 30, 2, 200, '/reset/1', 1),
(38, 'Add Employee', 4, 30, 2, 300, NULL, 1),
(39, 'Reports', 45, 30, 2, 400, '/reportGroup/3/reportType/PIM_DEFINED', 1),
(40, 'My Info', 46, NULL, 1, 700, NULL, 1),
(41, 'Leave', 68, NULL, 1, 300, NULL, 1),
(42, 'Configure', NULL, 41, 2, 500, NULL, 0),
(43, 'Leave Period', 47, 42, 3, 100, NULL, 1),
(44, 'Leave Types', 7, 42, 3, 200, NULL, 1),
(45, 'Work Week', 14, 42, 3, 300, NULL, 1),
(46, 'Holidays', 11, 42, 3, 400, NULL, 1),
(48, 'Leave List', 16, 41, 2, 600, '/reset/1', 1),
(49, 'Assign Leave', 17, 41, 2, 700, NULL, 1),
(50, 'My Leave', 48, 41, 2, 200, '/reset/1', 1),
(51, 'Apply', 49, 41, 2, 100, NULL, 1),
(52, 'Time', 67, NULL, 1, 400, NULL, 1),
(53, 'Timesheets', NULL, 52, 2, 100, NULL, 1),
(54, 'My Timesheets', 51, 53, 3, 100, NULL, 1),
(55, 'Employee Timesheets', 52, 53, 3, 200, NULL, 1),
(56, 'Attendance', NULL, 52, 2, 200, NULL, 1),
(57, 'My Records', 53, 56, 3, 100, NULL, 1),
(58, 'Punch In/Out', 54, 56, 3, 200, NULL, 1),
(59, 'Employee Records', 55, 56, 3, 300, NULL, 1),
(60, 'Configuration', 56, 56, 3, 400, NULL, 1),
(61, 'Reports', NULL, 52, 2, 300, NULL, 1),
(62, 'Project Reports', 57, 61, 3, 100, '?reportId=1', 1),
(63, 'Employee Reports', 58, 61, 3, 200, '?reportId=2', 1),
(64, 'Attendance Summary', 59, 61, 3, 300, '?reportId=4', 1),
(65, 'Recruitment', 76, NULL, 1, 500, NULL, 1),
(66, 'Candidates', 60, 65, 2, 100, NULL, 1),
(67, 'Vacancies', 61, 65, 2, 200, NULL, 1),
(74, 'Entitlements', NULL, 41, 2, 300, NULL, 0),
(75, 'Add Entitlements', 72, 74, 3, 100, NULL, 1),
(76, 'My Entitlements', 70, 74, 3, 300, '/reset/1', 1),
(77, 'Employee Entitlements', 69, 74, 3, 200, '/reset/1', 1),
(78, 'Reports', NULL, 41, 2, 400, NULL, 0),
(79, 'Leave Entitlements and Usage Report', 78, 78, 3, 100, NULL, 1),
(80, 'My Leave Entitlements and Usage Report', 79, 78, 3, 200, NULL, 1),
(81, 'Users', 1, 2, 3, 100, NULL, 1),
(82, 'Dashboard', 103, NULL, 1, 800, NULL, 1),
(83, 'Performance', NULL, NULL, 1, 700, '', 1),
(84, 'Configure', NULL, 83, 2, 100, '', 1),
(85, 'Manage Reviews', NULL, 83, 2, 200, '', 1),
(86, 'KPIs', 105, 84, 3, 100, '', 1),
(87, 'Manage Reviews', 111, 85, 3, 100, '', 1),
(88, 'My Reviews', 106, 85, 3, 200, '', 1),
(89, 'Review List', 110, 85, 3, 300, '', 1),
(90, 'Trackers', 112, 84, 3, 200, NULL, 1),
(91, 'Employee Trackers', 113, 83, 2, 800, NULL, 1),
(92, 'My Trackers', 114, 83, 2, 700, NULL, 1),
(93, 'Directory', 116, NULL, 1, 1000, '/reset/1', 1),
(94, 'Social Media Authentication', 117, 23, 3, 500, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module`
--

CREATE TABLE IF NOT EXISTS `ohrm_module` (
`id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_module`
--

INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES
(1, 'core', 1),
(2, 'admin', 1),
(3, 'pim', 1),
(4, 'leave', 1),
(5, 'time', 1),
(6, 'attendance', 1),
(7, 'recruitment', 1),
(8, 'recruitmentApply', 1),
(9, 'communication', 1),
(10, 'dashboard', 1),
(11, 'performance', 1),
(12, 'directory', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module_default_page`
--

CREATE TABLE IF NOT EXISTS `ohrm_module_default_page` (
`id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_module_default_page`
--

INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES
(1, 2, 1, 'admin/viewSystemUsers', NULL, 20),
(2, 3, 1, 'pim/viewEmployeeList', NULL, 20),
(3, 3, 3, 'pim/viewEmployeeList', NULL, 10),
(4, 3, 2, 'pim/viewMyDetails', NULL, 0),
(5, 4, 1, 'leave/viewLeaveList/reset/1', NULL, 20),
(6, 4, 3, 'leave/viewLeaveList/reset/1', NULL, 10),
(7, 4, 2, 'leave/viewMyLeaveList', NULL, 0),
(8, 4, 1, 'leave/defineLeavePeriod', 'LeavePeriodDefinedHomePageEnabler', 100),
(9, 4, 2, 'leave/showLeavePeriodNotDefinedWarning', 'LeavePeriodDefinedHomePageEnabler', 90),
(10, 5, 1, 'time/viewEmployeeTimesheet', NULL, 20),
(11, 5, 2, 'time/viewMyTimesheet', NULL, 0),
(12, 5, 1, 'time/defineTimesheetPeriod', 'TimesheetPeriodDefinedHomePageEnabler', 100),
(13, 5, 2, 'time/timesheetPeriodNotDefined', 'TimesheetPeriodDefinedHomePageEnabler', 100),
(14, 7, 1, 'recruitment/viewCandidates', NULL, 20),
(15, 7, 5, 'recruitment/viewCandidates', NULL, 10),
(16, 7, 6, 'recruitment/viewCandidates', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_nationality`
--

CREATE TABLE IF NOT EXISTS `ohrm_nationality` (
`id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_nationality`
--

INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES
(1, 'Afghan'),
(2, 'Albanian'),
(3, 'Algerian'),
(4, 'American'),
(5, 'Andorran'),
(6, 'Angolan'),
(7, 'Antiguans'),
(8, 'Argentinean'),
(9, 'Armenian'),
(10, 'Australian'),
(11, 'Austrian'),
(12, 'Azerbaijani'),
(13, 'Bahamian'),
(14, 'Bahraini'),
(15, 'Bangladeshi'),
(16, 'Barbadian'),
(17, 'Barbudans'),
(18, 'Batswana'),
(19, 'Belarusian'),
(20, 'Belgian'),
(21, 'Belizean'),
(22, 'Beninese'),
(23, 'Bhutanese'),
(24, 'Bolivian'),
(25, 'Bosnian'),
(26, 'Brazilian'),
(27, 'British'),
(28, 'Bruneian'),
(29, 'Bulgarian'),
(30, 'Burkinabe'),
(31, 'Burmese'),
(32, 'Burundian'),
(33, 'Cambodian'),
(34, 'Cameroonian'),
(35, 'Canadian'),
(36, 'Cape Verdean'),
(37, 'Central African'),
(38, 'Chadian'),
(39, 'Chilean'),
(40, 'Chinese'),
(41, 'Colombian'),
(42, 'Comoran'),
(43, 'Congolese'),
(44, 'Costa Rican'),
(45, 'Croatian'),
(46, 'Cuban'),
(47, 'Cypriot'),
(48, 'Czech'),
(49, 'Danish'),
(50, 'Djibouti'),
(51, 'Dominican'),
(52, 'Dutch'),
(53, 'East Timorese'),
(54, 'Ecuadorean'),
(55, 'Egyptian'),
(56, 'Emirian'),
(57, 'Equatorial Guinean'),
(58, 'Eritrean'),
(59, 'Estonian'),
(60, 'Ethiopian'),
(61, 'Fijian'),
(62, 'Filipino'),
(63, 'Finnish'),
(64, 'French'),
(65, 'Gabonese'),
(66, 'Gambian'),
(67, 'Georgian'),
(68, 'German'),
(69, 'Ghanaian'),
(70, 'Greek'),
(71, 'Grenadian'),
(72, 'Guatemalan'),
(73, 'Guinea-Bissauan'),
(74, 'Guinean'),
(75, 'Guyanese'),
(76, 'Haitian'),
(77, 'Herzegovinian'),
(78, 'Honduran'),
(79, 'Hungarian'),
(80, 'I-Kiribati'),
(81, 'Icelander'),
(82, 'Indian'),
(83, 'Indonesian'),
(84, 'Iranian'),
(85, 'Iraqi'),
(86, 'Irish'),
(87, 'Israeli'),
(88, 'Italian'),
(89, 'Ivorian'),
(90, 'Jamaican'),
(91, 'Japanese'),
(92, 'Jordanian'),
(93, 'Kazakhstani'),
(94, 'Kenyan'),
(95, 'Kittian and Nevisian'),
(96, 'Kuwaiti'),
(97, 'Kyrgyz'),
(98, 'Laotian'),
(99, 'Latvian'),
(100, 'Lebanese'),
(101, 'Liberian'),
(102, 'Libyan'),
(103, 'Liechtensteiner'),
(104, 'Lithuanian'),
(105, 'Luxembourger'),
(106, 'Macedonian'),
(107, 'Malagasy'),
(108, 'Malawian'),
(109, 'Malaysian'),
(110, 'Maldivan'),
(111, 'Malian'),
(112, 'Maltese'),
(113, 'Marshallese'),
(114, 'Mauritanian'),
(115, 'Mauritian'),
(116, 'Mexican'),
(117, 'Micronesian'),
(118, 'Moldovan'),
(119, 'Monacan'),
(120, 'Mongolian'),
(121, 'Moroccan'),
(122, 'Mosotho'),
(123, 'Motswana'),
(124, 'Mozambican'),
(125, 'Namibian'),
(126, 'Nauruan'),
(127, 'Nepalese'),
(128, 'New Zealander'),
(129, 'Nicaraguan'),
(130, 'Nigerian'),
(131, 'Nigerien'),
(132, 'North Korean'),
(133, 'Northern Irish'),
(134, 'Norwegian'),
(135, 'Omani'),
(136, 'Pakistani'),
(137, 'Palauan'),
(138, 'Panamanian'),
(139, 'Papua New Guinean'),
(140, 'Paraguayan'),
(141, 'Peruvian'),
(142, 'Polish'),
(143, 'Portuguese'),
(144, 'Qatari'),
(145, 'Romanian'),
(146, 'Russian'),
(147, 'Rwandan'),
(148, 'Saint Lucian'),
(149, 'Salvadoran'),
(150, 'Samoan'),
(151, 'San Marinese'),
(152, 'Sao Tomean'),
(153, 'Saudi'),
(154, 'Scottish'),
(155, 'Senegalese'),
(156, 'Serbian'),
(157, 'Seychellois'),
(158, 'Sierra Leonean'),
(159, 'Singaporean'),
(160, 'Slovakian'),
(161, 'Slovenian'),
(162, 'Solomon Islander'),
(163, 'Somali'),
(164, 'South African'),
(165, 'South Korean'),
(166, 'Spanish'),
(167, 'Sri Lankan'),
(168, 'Sudanese'),
(169, 'Surinamer'),
(170, 'Swazi'),
(171, 'Swedish'),
(172, 'Swiss'),
(173, 'Syrian'),
(174, 'Taiwanese'),
(175, 'Tajik'),
(176, 'Tanzanian'),
(177, 'Thai'),
(178, 'Togolese'),
(179, 'Tongan'),
(180, 'Trinidadian or Tobagonian'),
(181, 'Tunisian'),
(182, 'Turkish'),
(183, 'Tuvaluan'),
(184, 'Ugandan'),
(185, 'Ukrainian'),
(186, 'Uruguayan'),
(187, 'Uzbekistani'),
(188, 'Venezuelan'),
(189, 'Việt Nam'),
(190, 'Welsh'),
(191, 'Yemenite'),
(192, 'Zambian'),
(193, 'Zimbabwean');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_access_token`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_access_token` (
  `access_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_authorization_code`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_authorization_code` (
  `authorization_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_client`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_client` (
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` varchar(2000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_refresh_token`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_refresh_token` (
  `refresh_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_user`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_user` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_provider`
--

CREATE TABLE IF NOT EXISTS `ohrm_openid_provider` (
`id` int(10) NOT NULL,
  `provider_name` varchar(40) DEFAULT NULL,
  `provider_url` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_user_identity`
--

CREATE TABLE IF NOT EXISTS `ohrm_openid_user_identity` (
  `user_id` int(10) DEFAULT NULL,
  `provider_id` int(10) DEFAULT NULL,
  `user_identity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_operational_country`
--

CREATE TABLE IF NOT EXISTS `ohrm_operational_country` (
`id` int(10) unsigned NOT NULL,
  `country_code` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_organization_gen_info`
--

CREATE TABLE IF NOT EXISTS `ohrm_organization_gen_info` (
`id` int(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tax_id` varchar(30) DEFAULT NULL,
  `registration_number` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `zip_code` varchar(30) DEFAULT NULL,
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_organization_gen_info`
--

INSERT INTO `ohrm_organization_gen_info` (`id`, `name`, `tax_id`, `registration_number`, `phone`, `fax`, `email`, `country`, `province`, `city`, `zip_code`, `street1`, `street2`, `note`) VALUES
(1, 'HRM', '', '', '0985937800', '', 'tranquanghungtqh1812@gmail.com', 'PH', 'Ha Noi', 'Hà Nội', '', 'Văn Quán, Hà Đông, Hà Nội', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade`
--

CREATE TABLE IF NOT EXISTS `ohrm_pay_grade` (
`id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade_currency`
--

CREATE TABLE IF NOT EXISTS `ohrm_pay_grade_currency` (
  `pay_grade_id` int(11) NOT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `min_salary` double DEFAULT NULL,
  `max_salary` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_review`
--

CREATE TABLE IF NOT EXISTS `ohrm_performance_review` (
`id` int(7) NOT NULL,
  `status_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `work_period_start` date DEFAULT NULL,
  `work_period_end` date DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `department_id` int(7) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  `final_comment` text CHARACTER SET utf8 COLLATE utf8_bin,
  `final_rate` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_track`
--

CREATE TABLE IF NOT EXISTS `ohrm_performance_track` (
`id` int(11) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `tracker_name` varchar(200) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_performance_track`
--

INSERT INTO `ohrm_performance_track` (`id`, `emp_number`, `tracker_name`, `added_date`, `added_by`, `status`, `modified_date`) VALUES
(1, 2, '1', '2016-04-23 03:18:07', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_tracker_log`
--

CREATE TABLE IF NOT EXISTS `ohrm_performance_tracker_log` (
`id` int(11) NOT NULL,
  `performance_track_id` int(11) DEFAULT NULL,
  `log` varchar(150) DEFAULT NULL,
  `comment` varchar(3000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `reviewer_id` int(7) DEFAULT NULL,
  `achievement` varchar(45) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_tracker_reviewer`
--

CREATE TABLE IF NOT EXISTS `ohrm_performance_tracker_reviewer` (
`id` int(11) NOT NULL,
  `performance_track_id` int(11) NOT NULL,
  `reviewer_id` int(7) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_performance_tracker_reviewer`
--

INSERT INTO `ohrm_performance_tracker_reviewer` (`id`, `performance_track_id`, `reviewer_id`, `added_date`, `status`) VALUES
(1, 1, 1, '2016-04-23 03:18:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_plugin`
--

CREATE TABLE IF NOT EXISTS `ohrm_plugin` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project`
--

CREATE TABLE IF NOT EXISTS `ohrm_project` (
`project_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_project`
--

INSERT INTO `ohrm_project` (`project_id`, `customer_id`, `name`, `description`, `is_deleted`) VALUES
(1, 1, 'Triển khai hệ thống ERP', 'ERP', 0),
(2, 2, 'Triển khai hệ thống ERP', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_activity`
--

CREATE TABLE IF NOT EXISTS `ohrm_project_activity` (
`activity_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(110) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_admin`
--

CREATE TABLE IF NOT EXISTS `ohrm_project_admin` (
  `project_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_project_admin`
--

INSERT INTO `ohrm_project_admin` (`project_id`, `emp_number`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report`
--

CREATE TABLE IF NOT EXISTS `ohrm_report` (
`report_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `use_filter_field` tinyint(1) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_report`
--

INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES
(1, 'Project Report', 1, 1, NULL),
(2, 'Employee Report', 1, 1, NULL),
(3, 'Project Activity Details', 1, 1, NULL),
(4, 'Attendance Total Summary Report', 2, 0, NULL),
(5, 'Báo cáo nhân viên', 3, 1, 'PIM_DEFINED');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_report_group` (
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `core_sql` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_report_group`
--

INSERT INTO `ohrm_report_group` (`report_group_id`, `name`, `core_sql`) VALUES
(1, 'timesheet', 'SELECT selectCondition FROM ohrm_project_activity LEFT JOIN (SELECT * FROM ohrm_timesheet_item WHERE whereCondition1) AS ohrm_timesheet_item  ON (ohrm_timesheet_item.activity_id = ohrm_project_activity.activity_id) LEFT JOIN ohrm_project ON (ohrm_project.project_id = ohrm_project_activity.project_id) LEFT JOIN hs_hr_employee ON (hs_hr_employee.emp_number = ohrm_timesheet_item.employee_id) LEFT JOIN ohrm_timesheet ON (ohrm_timesheet.timesheet_id = ohrm_timesheet_item.timesheet_id) LEFT JOIN ohrm_customer ON (ohrm_customer.customer_id = ohrm_project.customer_id) WHERE whereCondition2 groupByClause ORDER BY ohrm_customer.name, ohrm_project.name, ohrm_project_activity.name, hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname'),
(2, 'attendance', 'SELECT selectCondition FROM hs_hr_employee LEFT JOIN (SELECT * FROM ohrm_attendance_record WHERE ( ( ohrm_attendance_record.punch_in_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) AND ( ohrm_attendance_record.punch_out_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) ) ) AS ohrm_attendance_record ON (hs_hr_employee.emp_number = ohrm_attendance_record.employee_id) WHERE hs_hr_employee.emp_number = #@employeeId@,@hs_hr_employee.emp_number AND (hs_hr_employee.termination_id is null) @# AND (hs_hr_employee.job_title_code = #@"jobTitle")@,@hs_hr_employee.job_title_code OR hs_hr_employee.job_title_code is null)@# AND (hs_hr_employee.work_station IN (#@subUnit)@,@SELECT id FROM ohrm_subunit) OR hs_hr_employee.work_station is null@#) AND (hs_hr_employee.emp_status = #@"employeeStatus")@,@hs_hr_employee.emp_status OR hs_hr_employee.emp_status is null)@# groupByClause ORDER BY hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname'),
(3, 'pim', 'SELECT selectCondition FROM hs_hr_employee \n                    LEFT JOIN hs_hr_emp_emergency_contacts ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_emergency_contacts.emp_number) \n                    LEFT JOIN ohrm_subunit ON \n                        (hs_hr_employee.work_station = ohrm_subunit.id) \n                    LEFT JOIN ohrm_employment_status ON \n                        (hs_hr_employee.emp_status = ohrm_employment_status.id) \n                    LEFT JOIN ohrm_job_title ON\n                        (hs_hr_employee.job_title_code = ohrm_job_title.id)\n                    LEFT JOIN ohrm_job_category ON \n                        (hs_hr_employee.eeo_cat_code = ohrm_job_category.id) \n                    LEFT JOIN ohrm_nationality ON\n                        (hs_hr_employee.nation_code = ohrm_nationality.id)\n                    LEFT JOIN hs_hr_emp_dependents ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_dependents.emp_number)\n                    LEFT JOIN hs_hr_emp_locations AS emp_location ON\n                        (hs_hr_employee.emp_number = emp_location.emp_number)\n                    LEFT JOIN ohrm_location ON\n                        (emp_location.location_id = ohrm_location.id)\n                    LEFT JOIN hs_hr_emp_contract_extend ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_contract_extend.emp_number) \n                    LEFT JOIN hs_hr_emp_basicsalary ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                    LEFT JOIN ohrm_pay_grade ON \n                        (hs_hr_emp_basicsalary.sal_grd_code = ohrm_pay_grade.id) \n                    LEFT JOIN hs_hr_currency_type ON \n                        (hs_hr_emp_basicsalary.currency_id = hs_hr_currency_type.currency_id) \n                    LEFT JOIN hs_hr_payperiod ON \n                        (hs_hr_emp_basicsalary.payperiod_code = hs_hr_payperiod.payperiod_code) \n                    LEFT JOIN hs_hr_emp_passport ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_passport.emp_number) \n                    LEFT JOIN hs_hr_emp_reportto AS subordinate_list ON \n                        (hs_hr_employee.emp_number = subordinate_list.erep_sup_emp_number) \n                    LEFT JOIN hs_hr_employee AS subordinate ON\n                        (subordinate.emp_number = subordinate_list.erep_sub_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS subordinate_reporting_method ON \n                        (subordinate_list.erep_reporting_mode = subordinate_reporting_method.reporting_method_id) \n                    LEFT JOIN hs_hr_emp_work_experience ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_work_experience.emp_number) \n                    LEFT JOIN ohrm_emp_education ON \n                        (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                    LEFT JOIN ohrm_education ON \n                        (ohrm_emp_education.education_id = ohrm_education.id) \n                    LEFT JOIN hs_hr_emp_skill ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                    LEFT JOIN ohrm_skill ON \n                        (hs_hr_emp_skill.skill_id = ohrm_skill.id) \n                    LEFT JOIN hs_hr_emp_language ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    LEFT JOIN ohrm_language ON \n                        (hs_hr_emp_language.lang_id = ohrm_language.id) \n                    LEFT JOIN ohrm_emp_license ON \n                        (hs_hr_employee.emp_number = ohrm_emp_license.emp_number) \n                    LEFT JOIN ohrm_license ON \n                        (ohrm_emp_license.license_id = ohrm_license.id) \n                    LEFT JOIN hs_hr_emp_member_detail ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_member_detail.emp_number) \n                    LEFT JOIN ohrm_membership ON\n                        (hs_hr_emp_member_detail.membship_code = ohrm_membership.id)\n                    LEFT JOIN hs_hr_country ON \n                        (hs_hr_employee.coun_code = hs_hr_country.cou_code) \n                    LEFT JOIN hs_hr_emp_directdebit ON \n                        (hs_hr_emp_basicsalary.id = hs_hr_emp_directdebit.salary_id) \n                    LEFT JOIN hs_hr_emp_reportto AS supervisor_list ON \n                        (hs_hr_employee.emp_number = supervisor_list.erep_sub_emp_number) \n                    LEFT JOIN hs_hr_employee AS supervisor ON\n                        (supervisor.emp_number = supervisor_list.erep_sup_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS supervisor_reporting_method ON \n                        (supervisor_list.erep_reporting_mode = supervisor_reporting_method.reporting_method_id) \n                    LEFT JOIN ohrm_emp_termination ON\n                        (hs_hr_employee.termination_id = ohrm_emp_termination.id)\n                    LEFT JOIN ohrm_emp_termination_reason ON\n                        (ohrm_emp_termination.reason_id = ohrm_emp_termination_reason.id)\n                WHERE hs_hr_employee.emp_number in (\n                    SELECT hs_hr_employee.emp_number FROM hs_hr_employee\n                        LEFT JOIN hs_hr_emp_basicsalary ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                        LEFT JOIN ohrm_emp_education ON \n                            (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                        LEFT JOIN hs_hr_emp_skill ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                        LEFT JOIN hs_hr_emp_language ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    WHERE whereCondition1\n                )\n                GROUP BY \n                     hs_hr_employee.emp_number,\n                     hs_hr_employee.emp_lastname,\n                     hs_hr_employee.emp_firstname,\n                     hs_hr_employee.emp_middle_name,\n                     hs_hr_employee.emp_birthday,\n                     ohrm_nationality.name,\n                     hs_hr_employee.emp_gender,\n                     hs_hr_employee.emp_marital_status,\n                     hs_hr_employee.emp_dri_lice_num,\n                     hs_hr_employee.emp_dri_lice_exp_date,\n                     hs_hr_employee.emp_street1,\n                     hs_hr_employee.emp_street2,\n                     hs_hr_employee.city_code,\n                     hs_hr_employee.provin_code,\n                     hs_hr_employee.emp_zipcode,\n                     hs_hr_country.cou_code,\n                     hs_hr_employee.emp_hm_telephone,\n                     hs_hr_employee.emp_mobile,\n                     hs_hr_employee.emp_work_telephone,\n                     hs_hr_employee.emp_work_email,\n                     hs_hr_employee.emp_oth_email\n\nORDER BY hs_hr_employee.emp_lastname\n');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer`
--

CREATE TABLE IF NOT EXISTS `ohrm_reviewer` (
`id` int(7) NOT NULL,
  `review_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `status` int(7) DEFAULT NULL,
  `reviewer_group_id` int(7) DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_reviewer_group` (
`id` int(7) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `piority` int(7) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_reviewer_group`
--

INSERT INTO `ohrm_reviewer_group` (`id`, `name`, `piority`) VALUES
(1, 'Supervisor', 1),
(2, 'Employee', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_rating`
--

CREATE TABLE IF NOT EXISTS `ohrm_reviewer_rating` (
`id` int(11) NOT NULL,
  `rating` decimal(18,2) DEFAULT NULL,
  `kpi_id` int(7) DEFAULT NULL,
  `review_id` int(7) DEFAULT NULL,
  `reviewer_id` int(7) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_role_user_selection_rule`
--

CREATE TABLE IF NOT EXISTS `ohrm_role_user_selection_rule` (
  `user_role_id` int(10) NOT NULL,
  `selection_rule_id` int(10) NOT NULL,
  `configurable_params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_screen`
--

CREATE TABLE IF NOT EXISTS `ohrm_screen` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `module_id` int(11) NOT NULL,
  `action_url` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_screen`
--

INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES
(1, 'User List', 2, 'viewSystemUsers'),
(2, 'Add/Edit System User', 2, 'saveSystemUser'),
(3, 'Delete System Users', 2, 'deleteSystemUsers'),
(4, 'Add Employee', 3, 'addEmployee'),
(5, 'View Employee List', 3, 'viewEmployeeList'),
(6, 'Delete Employees', 3, 'deleteEmployees'),
(7, 'Leave Type List', 4, 'leaveTypeList'),
(8, 'Define Leave Type', 4, 'defineLeaveType'),
(9, 'Undelete Leave Type', 4, 'undeleteLeaveType'),
(10, 'Delete Leave Type', 4, 'deleteLeaveType'),
(11, 'View Holiday List', 4, 'viewHolidayList'),
(12, 'Define Holiday', 4, 'defineHoliday'),
(13, 'Delete Holiday', 4, 'deleteHoliday'),
(14, 'Define WorkWeek', 4, 'defineWorkWeek'),
(16, 'Leave List', 4, 'viewLeaveList'),
(17, 'Assign Leave', 4, 'assignLeave'),
(18, 'View Leave Summary', 4, 'viewLeaveSummary'),
(19, 'Save Leave Entitlements', 4, 'saveLeaveEntitlements'),
(20, 'General Information', 2, 'viewOrganizationGeneralInformation'),
(21, 'Location List', 2, 'viewLocations'),
(22, 'View Company Structure', 2, 'viewCompanyStructure'),
(23, 'Job Title List', 2, 'viewJobTitleList'),
(24, 'Pay Grade List', 2, 'viewPayGrades'),
(25, 'Employment Status List', 2, 'employmentStatus'),
(26, 'Job Category List', 2, 'jobCategory'),
(27, 'Work Shift List', 2, 'workShift'),
(28, 'Skill List', 2, 'viewSkills'),
(29, 'Education List', 2, 'viewEducation'),
(30, 'License List', 2, 'viewLicenses'),
(31, 'Language List', 2, 'viewLanguages'),
(32, 'Membership List', 2, 'membership'),
(33, 'Nationality List', 2, 'nationality'),
(34, 'Add/Edit Mail Configuration', 2, 'listMailConfiguration'),
(35, 'Notification List', 2, 'viewEmailNotification'),
(36, 'Customer List', 2, 'viewCustomers'),
(37, 'Project List', 2, 'viewProjects'),
(38, 'Localization', 2, 'localization'),
(39, 'Module Configuration', 2, 'viewModules'),
(40, 'Configure PIM', 3, 'configurePim'),
(41, 'Custom Field List', 3, 'listCustomFields'),
(42, 'Data Import', 2, 'pimCsvImport'),
(43, 'Reporting Method List', 3, 'viewReportingMethods'),
(44, 'Termination Reason List', 3, 'viewTerminationReasons'),
(45, 'PIM Reports List', 1, 'viewDefinedPredefinedReports'),
(46, 'View MyInfo', 3, 'viewMyDetails'),
(47, 'Define Leave Period', 4, 'defineLeavePeriod'),
(48, 'View My Leave List', 4, 'viewMyLeaveList'),
(49, 'Apply Leave', 4, 'applyLeave'),
(50, 'Define Timesheet Start Date', 5, 'defineTimesheetPeriod'),
(51, 'View My Timesheet', 5, 'viewMyTimesheet'),
(52, 'View Employee Timesheet', 5, 'viewEmployeeTimesheet'),
(53, 'View My Attendance', 6, 'viewMyAttendanceRecord'),
(54, 'Punch In/Out', 6, 'punchIn'),
(55, 'View Employee Attendance', 6, 'viewAttendanceRecord'),
(56, 'Attendance Configuration', 6, 'configure'),
(57, 'View Project Report Criteria', 5, 'displayProjectReportCriteria'),
(58, 'View Employee Report Criteria', 5, 'displayEmployeeReportCriteria'),
(59, 'View Attendance Report Criteria', 5, 'displayAttendanceSummaryReportCriteria'),
(60, 'Candidate List', 7, 'viewCandidates'),
(61, 'Vacancy List', 7, 'viewJobVacancy'),
(67, 'View Time Module', 5, 'viewTimeModule'),
(68, 'View Leave Module', 4, 'viewLeaveModule'),
(69, 'Leave Entitlements', 4, 'viewLeaveEntitlements'),
(70, 'My Leave Entitlements', 4, 'viewMyLeaveEntitlements'),
(71, 'Delete Leave Entitlements', 4, 'deleteLeaveEntitlements'),
(72, 'Add Leave Entitlement', 4, 'addLeaveEntitlement'),
(73, 'Edit Leave Entitlement', 4, 'editLeaveEntitlement'),
(74, 'View Admin Module', 2, 'viewAdminModule'),
(75, 'View PIM Module', 3, 'viewPimModule'),
(76, 'View Recruitment Module', 7, 'viewRecruitmentModule'),
(78, 'Leave Balance Report', 4, 'viewLeaveBalanceReport'),
(79, 'My Leave Balance Report', 4, 'viewMyLeaveBalanceReport'),
(80, 'Save Job Title', 2, 'saveJobTitle'),
(81, 'Delete Job Title', 2, 'deleteJobTitle'),
(82, 'Save Pay Grade', 2, 'payGrade'),
(83, 'Delete Pay Grade', 2, 'deletePayGrades'),
(84, 'Save Pay Grade Currency', 2, 'savePayGradeCurrency'),
(85, 'Delete Pay Grade Currency', 2, 'deletePayGradeCurrency'),
(86, 'Add Customer', 2, 'addCustomer'),
(87, 'Delete Customer', 2, 'deleteCustomer'),
(88, 'Save Project', 2, 'saveProject'),
(89, 'Delete Project', 2, 'deleteProject'),
(90, 'Add Project Adtivity', 2, 'addProjectActivity'),
(91, 'Delete Project Adtivity', 2, 'deleteProjectActivity'),
(92, 'Define PIM reports', 1, 'definePredefinedReport'),
(93, 'Display PIM reports', 1, 'displayPredefinedReport'),
(94, 'Add Job Vacancy', 7, 'addJobVacancy'),
(95, 'Delete Job Vacancy', 7, 'deleteJobVacancy'),
(96, 'Add Candidate', 7, 'addCandidate'),
(97, 'Delete Candidate', 7, 'deleteCandidateVacancies'),
(98, 'View Leave Request', 4, 'viewLeaveRequest'),
(99, 'Change Leave Status', 4, 'changeLeaveStatus'),
(100, 'Terminate Employment', 3, 'terminateEmployement'),
(101, 'View Attendance Summary Report', 5, 'displayAttendanceSummaryReport'),
(102, 'View Project Activity Details Report', 5, 'displayProjectActivityDetailsReport'),
(103, 'Dashboard', 10, 'index'),
(104, 'Save KPI', 11, 'saveKpi'),
(105, 'Saearch KPI', 11, 'searchKpi'),
(106, 'My Reviews', 11, 'myPerformanceReview'),
(107, 'Add Review', 11, 'saveReview'),
(108, 'Review Evaluate', 11, 'reviewEvaluate'),
(109, 'Review Evaluate By Admin', 11, 'reviewEvaluateByAdmin'),
(110, 'Search Evaluate Performance', 11, 'searchEvaluatePerformancReview'),
(111, 'Search Performance Review', 11, 'searchPerformancReview'),
(112, 'Manage_Trackers', 11, 'addPerformanceTracker'),
(113, 'Employee_Trackers', 11, 'viewEmployeePerformanceTrackerList'),
(114, 'My_Trackers', 11, 'viewMyPerformanceTrackerList'),
(115, 'Employee_Tracker_Logs', 11, 'addPerformanceTrackerLog'),
(116, 'Directory', 12, 'viewDirectory'),
(117, 'Manage OpenId', 2, 'openIdProvider');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_composite_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_composite_display_field` (
  `id` bigint(20) NOT NULL,
  `composite_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_composite_display_field`
--

INSERT INTO `ohrm_selected_composite_display_field` (`id`, `composite_display_field_id`, `report_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_display_field` (
`id` bigint(20) NOT NULL,
  `display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_display_field`
--

INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES
(2, 2, 1),
(4, 8, 2),
(175, 9, 5),
(176, 10, 5),
(177, 11, 5),
(178, 12, 5),
(179, 13, 5),
(180, 14, 5),
(181, 15, 5),
(182, 17, 5),
(183, 18, 5),
(184, 19, 5),
(186, 20, 5),
(187, 21, 5),
(188, 22, 5),
(189, 23, 5),
(190, 24, 5),
(191, 25, 5),
(192, 26, 5),
(193, 27, 5),
(194, 28, 5),
(195, 29, 5),
(196, 30, 5),
(197, 31, 5),
(198, 32, 5),
(199, 33, 5),
(200, 35, 5),
(201, 36, 5),
(202, 37, 5),
(203, 38, 5),
(204, 39, 5),
(205, 40, 5),
(206, 41, 5),
(207, 42, 5),
(208, 43, 5),
(209, 44, 5),
(210, 45, 5),
(211, 47, 5),
(212, 48, 5),
(213, 49, 5),
(214, 52, 5),
(215, 53, 5),
(216, 54, 5),
(217, 55, 5),
(218, 57, 5),
(219, 58, 5),
(221, 59, 5),
(222, 60, 5),
(223, 61, 5),
(224, 62, 5),
(227, 63, 5),
(225, 64, 5),
(230, 65, 5),
(231, 66, 5),
(232, 67, 5),
(233, 68, 5),
(234, 69, 5),
(235, 70, 5),
(236, 71, 5),
(237, 72, 5),
(238, 73, 5),
(239, 74, 5),
(240, 75, 5),
(241, 76, 5),
(242, 77, 5),
(243, 78, 5),
(244, 80, 5),
(245, 81, 5),
(246, 82, 5),
(247, 83, 5),
(248, 84, 5),
(249, 85, 5),
(250, 86, 5),
(251, 87, 5),
(252, 88, 5),
(253, 89, 5),
(254, 90, 5),
(228, 91, 5),
(220, 92, 5),
(226, 93, 5),
(229, 94, 5),
(255, 95, 5),
(185, 97, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_display_field_group` (
`id` int(10) unsigned NOT NULL,
  `report_id` bigint(20) NOT NULL,
  `display_field_group_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_display_field_group`
--

INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES
(31, 5, 1),
(32, 5, 2),
(33, 5, 3),
(34, 5, 4),
(35, 5, 15),
(36, 5, 10),
(37, 5, 11),
(38, 5, 12),
(39, 5, 13),
(40, 5, 14),
(41, 5, 9),
(42, 5, 8),
(43, 5, 7),
(44, 5, 6),
(45, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_filter_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_filter_field` (
  `report_id` bigint(20) NOT NULL,
  `filter_field_id` bigint(20) NOT NULL,
  `filter_field_order` bigint(20) NOT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `where_condition` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_filter_field`
--

INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'Runtime'),
(1, 3, 2, NULL, NULL, NULL, 'Runtime'),
(1, 7, 3, NULL, NULL, NULL, 'Runtime'),
(1, 21, 4, '0', NULL, '=', 'Predefined'),
(2, 3, 4, NULL, NULL, NULL, 'Runtime'),
(2, 4, 1, NULL, NULL, NULL, 'Runtime'),
(2, 5, 3, NULL, NULL, NULL, 'Runtime'),
(2, 6, 2, NULL, NULL, NULL, 'Runtime'),
(2, 7, 5, NULL, NULL, NULL, 'Runtime'),
(3, 3, 2, NULL, NULL, NULL, 'Runtime'),
(3, 5, 1, NULL, NULL, NULL, 'Runtime'),
(3, 7, 3, NULL, NULL, NULL, 'Runtime'),
(5, 22, 0, NULL, NULL, 'IS NULL', 'Predefined');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_group_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `summary_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_group_field`
--

INSERT INTO `ohrm_selected_group_field` (`group_field_id`, `summary_display_field_id`, `report_id`) VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_skill`
--

CREATE TABLE IF NOT EXISTS `ohrm_skill` (
`id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_subunit`
--

CREATE TABLE IF NOT EXISTS `ohrm_subunit` (
`id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit_id` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `lft` smallint(6) unsigned DEFAULT NULL,
  `rgt` smallint(6) unsigned DEFAULT NULL,
  `level` smallint(6) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_subunit`
--

INSERT INTO `ohrm_subunit` (`id`, `name`, `unit_id`, `description`, `lft`, `rgt`, `level`) VALUES
(1, 'HRM', '', '', 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_summary_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_summary_display_field` (
  `summary_display_field_id` bigint(20) NOT NULL,
  `function` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_summary_display_field`
--

INSERT INTO `ohrm_summary_display_field` (`summary_display_field_id`, `function`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`) VALUES
(1, 'ROUND(COALESCE(sum(duration)/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL),
(2, 'ROUND(COALESCE(sum(TIMESTAMPDIFF(SECOND , ohrm_attendance_record.punch_in_utc_time , ohrm_attendance_record.punch_out_utc_time))/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet`
--

CREATE TABLE IF NOT EXISTS `ohrm_timesheet` (
  `timesheet_id` bigint(20) NOT NULL,
  `state` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_timesheet`
--

INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES
(1, 'NOT SUBMITTED', '2016-04-18', '2016-04-24', 1),
(2, 'NOT SUBMITTED', '2016-02-01', '2016-02-07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_action_log`
--

CREATE TABLE IF NOT EXISTS `ohrm_timesheet_action_log` (
  `timesheet_action_log_id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date_time` date NOT NULL,
  `performed_by` int(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_item`
--

CREATE TABLE IF NOT EXISTS `ohrm_timesheet_item` (
  `timesheet_item_id` bigint(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `comment` text,
  `project_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_upgrade_history`
--

CREATE TABLE IF NOT EXISTS `ohrm_upgrade_history` (
`id` int(10) NOT NULL,
  `start_version` varchar(30) DEFAULT NULL,
  `end_version` varchar(30) DEFAULT NULL,
  `start_increment` int(11) NOT NULL,
  `end_increment` int(11) NOT NULL,
  `upgraded_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user`
--

CREATE TABLE IF NOT EXISTS `ohrm_user` (
`id` int(10) NOT NULL,
  `user_role_id` int(10) NOT NULL,
  `emp_number` int(13) DEFAULT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user`
--

INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES
(1, 1, 1, 'admin', '$2a$12$W02gfaH/H5XygKLmse01a.br6DNvPRfzUa19LfjV2ryvUU/0N1fgy', 0, 1, NULL, '2016-04-23 10:17:39', 1, NULL),
(2, 1, 1, 'hungtq', '$2a$12$hUIpPbtIbHoD3bb3TlqJkua6A7SFyUWwus0d4LoGvBrpRU3KdXW3q', 0, 1, '2016-04-23 05:40:06', '2016-04-23 05:47:46', 1, 1),
(3, 2, 2, 'sonnth', '$2a$12$PJI0Vk7EGkBWOiK9kS4qVO6dIGv15sOUYKcEV145Sm.EHeI6oTxYK', 0, 1, '2016-04-23 05:49:01', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role`
--

CREATE TABLE IF NOT EXISTS `ohrm_user_role` (
`id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_assignable` tinyint(1) DEFAULT '0',
  `is_predefined` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user_role`
--

INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES
(1, 'Admin', 'Admin', 1, 1),
(2, 'ESS', 'ESS', 1, 1),
(3, 'Supervisor', 'Supervisor', 0, 1),
(4, 'ProjectAdmin', 'ProjectAdmin', 0, 1),
(5, 'Interviewer', 'Interviewer', 0, 1),
(6, 'HiringManager', 'HiringManager', 0, 1),
(7, 'Reviewer', 'Reviewer', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_data_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_user_role_data_group` (
`id` int(11) NOT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `data_group_id` int(11) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL,
  `self` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user_role_data_group`
--

INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES
(1, 1, 1, 1, NULL, 1, NULL, 0),
(2, 1, 2, 1, 1, 1, 1, 0),
(3, 1, 3, 1, NULL, 1, NULL, 0),
(4, 1, 4, 1, NULL, 1, NULL, 0),
(5, 1, 5, 1, 1, 1, 1, 0),
(6, 1, 6, 1, NULL, 1, NULL, 0),
(7, 1, 7, 1, 1, 1, 1, 0),
(8, 1, 8, 1, 1, 1, 1, 0),
(9, 1, 9, 1, NULL, 1, NULL, 0),
(10, 1, 10, 1, 1, 1, 1, 0),
(11, 1, 11, 1, 1, 1, 1, 0),
(12, 1, 12, 1, NULL, 1, NULL, 0),
(13, 1, 13, 1, 1, 1, 1, 0),
(14, 1, 14, 1, 1, 1, 1, 0),
(15, 1, 15, 1, NULL, 1, NULL, 0),
(16, 1, 16, 1, NULL, 1, NULL, 0),
(17, 1, 17, 1, 1, 1, 1, 0),
(18, 1, 18, 1, NULL, 1, NULL, 0),
(19, 1, 19, 1, 1, 1, 1, 0),
(20, 1, 20, 1, 1, 1, 1, 0),
(21, 1, 21, 1, NULL, 1, NULL, 0),
(22, 1, 22, 1, NULL, 1, NULL, 0),
(23, 1, 23, 1, 1, 1, 1, 0),
(24, 1, 24, 1, NULL, 1, NULL, 0),
(25, 1, 25, 1, 1, 1, 1, 0),
(26, 1, 26, 1, 1, 1, 1, 0),
(27, 1, 27, 1, 1, 1, 1, 0),
(28, 1, 28, 1, NULL, 1, NULL, 0),
(29, 1, 29, 1, 1, 1, 1, 0),
(30, 1, 30, 1, 1, 1, 1, 0),
(31, 1, 31, 1, 1, 1, 1, 0),
(32, 1, 32, 1, 1, 1, 1, 0),
(33, 1, 33, 1, 1, 1, 1, 0),
(34, 1, 34, 1, 1, 1, 1, 0),
(35, 1, 35, 1, NULL, 1, NULL, 0),
(36, 1, 36, 1, 1, 1, 1, 0),
(37, 1, 37, 1, 1, 1, 1, 0),
(38, 1, 38, 1, NULL, 1, NULL, 0),
(39, 1, 39, 1, NULL, 1, 1, 0),
(40, 1, 40, 1, 1, 1, 1, 0),
(41, 1, 41, 1, NULL, NULL, NULL, 0),
(42, 1, 40, 1, 1, 1, 1, 1),
(43, 2, 1, 1, NULL, 1, NULL, 1),
(44, 2, 2, 1, 1, 1, 1, 1),
(45, 2, 3, 1, NULL, 1, NULL, 1),
(46, 2, 4, 1, NULL, 1, NULL, 1),
(47, 2, 5, 1, 1, 1, 1, 1),
(48, 2, 6, 1, NULL, 1, NULL, 1),
(49, 2, 7, 1, 1, 1, 1, 1),
(50, 2, 8, 1, 1, 1, 1, 1),
(51, 2, 9, 1, NULL, 1, NULL, 1),
(52, 2, 10, 1, 1, 1, 1, 1),
(53, 2, 11, 1, 1, 1, 1, 1),
(54, 2, 12, 1, NULL, 1, NULL, 1),
(55, 2, 13, 1, 1, 1, 1, 1),
(56, 2, 14, 1, 1, 1, 1, 1),
(57, 2, 15, 1, NULL, 1, NULL, 1),
(58, 2, 16, 1, NULL, NULL, NULL, 1),
(59, 2, 17, 1, 0, 0, 0, 1),
(60, 2, 18, 1, 0, 0, 0, 1),
(61, 2, 19, 1, NULL, NULL, NULL, 1),
(62, 2, 20, 1, 0, 0, 0, 1),
(63, 2, 21, 1, 0, 0, 0, 1),
(64, 2, 22, 1, NULL, NULL, NULL, 1),
(65, 2, 23, 1, 0, 0, 0, 1),
(66, 2, 24, 1, 0, 0, 0, 1),
(67, 2, 25, 1, NULL, NULL, NULL, 1),
(68, 2, 26, 1, NULL, NULL, NULL, 1),
(69, 2, 27, 1, 0, 0, 0, 1),
(70, 2, 28, 1, 0, 0, 0, 1),
(71, 2, 29, 1, 1, 1, 1, 1),
(72, 2, 30, 1, 1, 1, 1, 1),
(73, 2, 31, 1, 1, 1, 1, 1),
(74, 2, 32, 1, 1, 1, 1, 1),
(75, 2, 33, 1, 1, 1, 1, 1),
(76, 2, 34, 1, 1, 1, 1, 1),
(77, 2, 35, 1, NULL, 1, NULL, 1),
(78, 2, 36, 1, 1, 1, 1, 1),
(79, 2, 37, 1, 1, 1, 1, 1),
(80, 2, 38, 1, NULL, 1, NULL, 1),
(81, 2, 39, 1, NULL, 1, 1, 1),
(82, 2, 40, 1, 0, 0, 0, 1),
(83, 2, 41, 1, NULL, NULL, NULL, 1),
(84, 3, 1, 1, NULL, 1, NULL, 0),
(85, 3, 2, 1, 1, 1, 1, 0),
(86, 3, 3, 1, NULL, 1, NULL, 0),
(87, 3, 4, 1, NULL, 1, NULL, 0),
(88, 3, 5, 1, 1, 1, 1, 0),
(89, 3, 6, 1, NULL, 1, NULL, 0),
(90, 3, 7, 1, 1, 1, 1, 0),
(91, 3, 8, 1, 1, 1, 1, 0),
(92, 3, 9, 1, NULL, 1, NULL, 0),
(93, 3, 10, 1, 1, 1, 1, 0),
(94, 3, 11, 1, 1, 1, 1, 0),
(95, 3, 12, 1, NULL, 1, NULL, 0),
(96, 3, 13, 1, 1, 1, 1, 0),
(97, 3, 14, 1, 1, 1, 1, 0),
(98, 3, 15, 1, NULL, 1, NULL, 0),
(99, 3, 16, 1, NULL, NULL, NULL, 0),
(100, 3, 17, 1, 0, 0, 0, 0),
(101, 3, 18, 1, 0, 0, 0, 0),
(102, 3, 19, 0, 0, 0, 0, 0),
(103, 3, 20, 0, 0, 0, 0, 0),
(104, 3, 21, 0, 0, 0, 0, 0),
(105, 3, 22, 1, NULL, NULL, NULL, 0),
(106, 3, 23, 1, 0, 0, 0, 0),
(107, 3, 24, 1, 0, 0, 0, 0),
(108, 3, 25, 1, NULL, NULL, NULL, 0),
(109, 3, 26, 1, NULL, NULL, NULL, 0),
(110, 3, 27, 1, 0, 0, 0, 0),
(111, 3, 28, 1, 0, 0, 0, 0),
(112, 3, 29, 1, 1, 1, 1, 0),
(113, 3, 30, 1, 1, 1, 1, 0),
(114, 3, 31, 1, 1, 1, 1, 0),
(115, 3, 32, 1, 1, 1, 1, 0),
(116, 3, 33, 1, 1, 1, 1, 0),
(117, 3, 34, 1, 1, 1, 1, 0),
(118, 3, 35, 1, NULL, 1, NULL, 0),
(119, 3, 36, 1, 1, 1, 1, 0),
(120, 3, 37, 1, 1, 1, 1, 0),
(121, 3, 38, 1, NULL, 1, NULL, 0),
(122, 3, 39, 1, NULL, 1, 1, 0),
(123, 3, 40, 1, 0, 0, 0, 0),
(124, 3, 41, 1, NULL, NULL, NULL, 0),
(125, 3, 1, 1, NULL, 1, NULL, 1),
(126, 3, 2, 1, 1, 1, 1, 1),
(127, 3, 3, 1, NULL, 1, NULL, 1),
(128, 3, 4, 1, NULL, 1, NULL, 1),
(129, 3, 5, 1, 1, 1, 1, 1),
(130, 3, 6, 1, NULL, 1, NULL, 1),
(131, 3, 7, 1, 1, 1, 1, 1),
(132, 3, 8, 1, 1, 1, 1, 1),
(133, 3, 9, 1, NULL, 1, NULL, 1),
(134, 3, 10, 1, 1, 1, 1, 1),
(135, 3, 11, 1, 1, 1, 1, 1),
(136, 3, 12, 1, NULL, 1, NULL, 1),
(137, 3, 13, 1, 1, 1, 1, 1),
(138, 3, 14, 1, 1, 1, 1, 1),
(139, 3, 15, 1, NULL, 1, NULL, 1),
(140, 3, 16, 1, NULL, NULL, NULL, 1),
(141, 3, 17, 1, 0, 0, 0, 1),
(142, 3, 18, 1, 0, 0, 0, 1),
(143, 3, 19, 1, 0, 0, 0, 1),
(144, 3, 20, 1, 0, 0, 0, 1),
(145, 3, 21, 1, 0, 0, 0, 1),
(146, 3, 22, 1, NULL, NULL, NULL, 1),
(147, 3, 23, 1, 0, 0, 0, 1),
(148, 3, 24, 1, 0, 0, 0, 1),
(149, 3, 25, 1, NULL, NULL, NULL, 1),
(150, 3, 26, 1, NULL, NULL, NULL, 1),
(151, 3, 27, 1, 0, 0, 0, 1),
(152, 3, 28, 1, 0, 0, 0, 1),
(153, 3, 29, 1, 1, 1, 1, 1),
(154, 3, 30, 1, 1, 1, 1, 1),
(155, 3, 31, 1, 1, 1, 1, 1),
(156, 3, 32, 1, 1, 1, 1, 1),
(157, 3, 33, 1, 1, 1, 1, 1),
(158, 3, 34, 1, 1, 1, 1, 1),
(159, 3, 35, 1, NULL, 1, NULL, 1),
(160, 3, 36, 1, 1, 1, 1, 1),
(161, 3, 37, 1, 1, 1, 1, 1),
(162, 3, 38, 1, NULL, 1, NULL, 1),
(163, 3, 39, 1, NULL, 1, 1, 1),
(164, 3, 40, 1, 0, 0, 0, 1),
(165, 3, 41, 1, NULL, NULL, NULL, 1),
(166, 1, 42, 1, 1, 1, 1, 0),
(167, 2, 42, 0, 0, 0, 0, 0),
(168, 3, 42, 0, 0, 0, 0, 0),
(169, 1, 43, 1, 1, 1, 1, 0),
(170, 2, 43, 0, 0, 0, 0, 0),
(171, 3, 43, 0, 0, 0, 0, 0),
(172, 1, 44, 1, 1, 1, 1, 0),
(173, 2, 44, 0, 0, 0, 0, 0),
(174, 3, 44, 0, 0, 0, 0, 0),
(175, 1, 45, 1, 1, 1, 1, 0),
(176, 2, 45, 0, 0, 0, 0, 0),
(177, 3, 45, 0, 0, 0, 0, 0),
(178, 4, 45, 1, 0, 1, 0, 0),
(179, 1, 46, 1, 1, 1, 1, 0),
(180, 2, 46, 0, 0, 0, 0, 0),
(181, 3, 46, 0, 0, 0, 0, 0),
(182, 1, 47, 1, NULL, 1, NULL, 0),
(183, 2, 47, 0, 0, 0, 0, 0),
(184, 3, 47, 0, 0, 0, 0, 0),
(185, 1, 48, 1, 0, 0, 0, 0),
(186, 2, 48, 0, 0, 0, 0, 0),
(187, 2, 48, 1, 0, 0, 0, 1),
(188, 3, 48, 1, 0, 0, 0, 0),
(189, 1, 49, 1, 0, 0, 0, 0),
(190, 2, 49, 0, 0, 0, 0, 0),
(191, 3, 49, 0, 0, 0, 0, 0),
(192, 4, 49, 1, 0, 0, 0, 0),
(193, 1, 50, 1, 0, 0, 0, 0),
(194, 2, 50, 0, 0, 0, 0, 0),
(195, 3, 50, 1, 0, 0, 0, 0),
(196, 1, 51, 1, 0, 0, 0, 0),
(197, 2, 51, 0, 0, 0, 0, 0),
(198, 3, 51, 1, 0, 0, 0, 0),
(199, 1, 52, 1, NULL, 1, NULL, 0),
(200, 2, 52, 0, 0, 0, 0, 0),
(201, 3, 52, 0, 0, 0, 0, 0),
(202, 1, 53, 1, 1, 1, 1, 0),
(203, 2, 53, 0, 0, 0, 0, 0),
(204, 3, 53, 0, 0, 0, 0, 0),
(205, 1, 54, 1, 0, 1, 0, 0),
(206, 2, 54, 0, 0, 0, 0, 0),
(207, 3, 54, 0, 0, 0, 0, 0),
(208, 1, 55, 1, 1, 1, 1, 0),
(209, 2, 55, 0, 0, 0, 0, 0),
(210, 3, 55, 0, 0, 0, 0, 0),
(211, 1, 56, 1, 1, 1, 1, 0),
(212, 2, 56, 0, 0, 0, 0, 0),
(213, 3, 56, 0, 0, 0, 0, 0),
(214, 1, 57, 1, 1, 1, 1, 0),
(215, 6, 57, 1, 1, 1, 1, 0),
(216, 5, 57, 1, 0, 1, 0, 0),
(217, 1, 58, 1, 0, 0, 0, 0),
(218, 2, 58, 0, 0, 0, 0, 0),
(219, 2, 58, 1, 0, 0, 0, 1),
(220, 3, 58, 1, 0, 0, 0, 0),
(221, 1, 59, 1, 0, 0, 0, 0),
(222, 2, 59, 1, 0, 0, 0, 1),
(223, 3, 59, 1, 0, 0, 0, 0),
(224, 1, 60, 0, 1, 0, 0, 0),
(225, 2, 60, 0, 1, 0, 0, 1),
(226, 3, 60, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_screen`
--

CREATE TABLE IF NOT EXISTS `ohrm_user_role_screen` (
`id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `can_read` tinyint(1) NOT NULL DEFAULT '0',
  `can_create` tinyint(1) NOT NULL DEFAULT '0',
  `can_update` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user_role_screen`
--

INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1, 1),
(3, 2, 2, 0, 0, 0, 0),
(4, 3, 2, 0, 0, 0, 0),
(5, 1, 3, 1, 1, 1, 1),
(6, 2, 3, 0, 0, 0, 0),
(7, 3, 3, 0, 0, 0, 0),
(8, 1, 4, 1, 1, 1, 1),
(9, 1, 5, 1, 1, 1, 1),
(10, 3, 5, 1, 0, 0, 0),
(11, 1, 6, 1, 0, 0, 1),
(12, 1, 7, 1, 1, 1, 1),
(13, 1, 8, 1, 1, 1, 1),
(14, 1, 9, 1, 1, 1, 1),
(15, 1, 10, 1, 1, 1, 1),
(16, 1, 11, 1, 1, 1, 1),
(17, 1, 12, 1, 1, 1, 1),
(18, 1, 13, 1, 1, 1, 1),
(19, 1, 14, 1, 1, 1, 1),
(20, 1, 16, 1, 1, 1, 0),
(21, 3, 16, 1, 1, 1, 0),
(22, 1, 17, 1, 1, 1, 0),
(23, 3, 17, 1, 1, 1, 0),
(24, 1, 18, 1, 1, 1, 0),
(25, 2, 18, 1, 0, 0, 0),
(26, 3, 18, 1, 0, 0, 0),
(27, 1, 19, 1, 1, 1, 1),
(28, 1, 20, 1, 1, 1, 1),
(29, 1, 21, 1, 1, 1, 1),
(30, 1, 22, 1, 1, 1, 1),
(31, 1, 23, 1, 1, 1, 1),
(32, 1, 24, 1, 1, 1, 1),
(33, 1, 25, 1, 1, 1, 1),
(34, 1, 26, 1, 1, 1, 1),
(35, 1, 27, 1, 1, 1, 1),
(36, 1, 28, 1, 1, 1, 1),
(37, 1, 29, 1, 1, 1, 1),
(38, 1, 30, 1, 1, 1, 1),
(39, 1, 31, 1, 1, 1, 1),
(40, 1, 32, 1, 1, 1, 1),
(41, 1, 33, 1, 1, 1, 1),
(42, 1, 34, 1, 1, 1, 1),
(43, 1, 35, 1, 1, 1, 1),
(44, 1, 36, 1, 1, 1, 1),
(45, 1, 37, 1, 1, 1, 1),
(46, 4, 37, 1, 0, 0, 0),
(47, 1, 38, 1, 1, 1, 1),
(48, 1, 39, 1, 1, 1, 1),
(49, 1, 40, 1, 1, 1, 1),
(50, 1, 41, 1, 1, 1, 1),
(51, 1, 42, 1, 1, 1, 1),
(52, 1, 43, 1, 1, 1, 1),
(53, 1, 44, 1, 1, 1, 1),
(54, 1, 45, 1, 1, 1, 1),
(55, 2, 46, 1, 1, 1, 1),
(56, 1, 47, 1, 1, 1, 1),
(57, 2, 48, 1, 1, 1, 0),
(58, 2, 49, 1, 1, 1, 1),
(59, 1, 50, 1, 1, 1, 1),
(60, 2, 51, 1, 1, 1, 1),
(61, 1, 52, 1, 1, 1, 1),
(62, 3, 52, 1, 1, 1, 1),
(63, 2, 53, 1, 1, 0, 0),
(64, 2, 54, 1, 1, 1, 1),
(65, 1, 55, 1, 1, 0, 1),
(66, 3, 55, 1, 1, 0, 0),
(67, 1, 56, 1, 1, 1, 1),
(68, 1, 57, 1, 1, 1, 1),
(69, 4, 57, 1, 1, 1, 1),
(70, 1, 58, 1, 1, 1, 1),
(71, 3, 58, 1, 1, 1, 1),
(72, 1, 59, 1, 1, 1, 1),
(73, 3, 59, 1, 1, 1, 1),
(74, 1, 60, 1, 1, 1, 1),
(75, 6, 60, 1, 1, 1, 1),
(76, 5, 60, 1, 0, 1, 0),
(77, 1, 61, 1, 1, 1, 1),
(78, 1, 67, 1, 1, 1, 1),
(79, 2, 67, 1, 0, 1, 0),
(80, 3, 67, 1, 0, 1, 0),
(81, 1, 68, 1, 1, 1, 1),
(82, 2, 68, 1, 0, 1, 0),
(83, 3, 68, 1, 0, 1, 0),
(84, 1, 69, 1, 1, 1, 1),
(85, 3, 69, 1, 0, 0, 0),
(86, 2, 70, 1, 0, 0, 0),
(87, 1, 71, 1, 0, 0, 1),
(88, 1, 72, 1, 1, 1, 0),
(89, 1, 73, 1, 0, 1, 0),
(90, 1, 74, 1, 1, 1, 1),
(91, 1, 75, 1, 1, 1, 1),
(92, 3, 75, 1, 1, 1, 1),
(93, 1, 76, 1, 1, 1, 1),
(94, 5, 76, 1, 1, 1, 1),
(95, 6, 76, 1, 1, 1, 1),
(96, 1, 78, 1, 0, 0, 0),
(97, 3, 78, 1, 0, 0, 0),
(98, 2, 79, 1, 0, 0, 0),
(99, 1, 80, 1, 1, 1, 1),
(100, 1, 81, 1, 1, 1, 1),
(101, 1, 82, 1, 1, 1, 1),
(102, 1, 83, 1, 1, 1, 1),
(103, 1, 84, 1, 1, 1, 1),
(104, 1, 85, 1, 1, 1, 1),
(105, 1, 86, 1, 1, 1, 1),
(106, 1, 87, 1, 1, 1, 1),
(107, 1, 88, 1, 1, 1, 1),
(108, 4, 88, 1, 1, 1, 1),
(109, 1, 89, 1, 1, 1, 1),
(110, 1, 90, 1, 1, 1, 1),
(111, 4, 90, 1, 1, 1, 1),
(112, 1, 91, 1, 1, 1, 1),
(113, 4, 91, 1, 1, 1, 1),
(114, 1, 92, 1, 1, 1, 1),
(115, 1, 93, 1, 1, 1, 1),
(116, 1, 94, 1, 1, 1, 1),
(117, 1, 95, 1, 1, 1, 1),
(118, 1, 96, 1, 1, 1, 1),
(119, 5, 96, 1, 1, 1, 1),
(120, 6, 96, 1, 1, 1, 1),
(121, 1, 97, 1, 1, 1, 1),
(122, 6, 97, 1, 1, 1, 1),
(123, 1, 98, 1, 1, 1, 1),
(124, 2, 98, 1, 1, 1, 1),
(125, 3, 98, 1, 1, 1, 1),
(126, 1, 99, 1, 0, 1, 0),
(127, 2, 99, 1, 0, 1, 0),
(128, 3, 99, 1, 0, 1, 0),
(129, 1, 100, 1, 0, 0, 0),
(130, 1, 101, 1, 1, 1, 1),
(131, 3, 101, 1, 1, 1, 1),
(132, 1, 102, 1, 1, 1, 1),
(133, 4, 102, 1, 1, 1, 1),
(134, 1, 103, 1, 0, 0, 0),
(135, 2, 103, 1, 0, 0, 0),
(136, 1, 104, 1, 1, 1, 0),
(137, 1, 105, 1, 1, 1, 1),
(138, 1, 107, 1, 1, 1, 0),
(139, 1, 109, 1, 1, 1, 0),
(140, 1, 111, 1, 1, 1, 1),
(141, 2, 110, 1, 0, 1, 0),
(142, 2, 108, 1, 1, 1, 0),
(143, 2, 106, 1, 0, 1, 0),
(144, 3, 109, 1, 1, 1, 0),
(145, 2, 109, 1, 1, 1, 0),
(146, 1, 112, 1, 1, 1, 1),
(147, 2, 112, 0, 0, 0, 0),
(148, 1, 113, 1, 1, 1, 1),
(149, 2, 113, 1, 1, 1, 0),
(150, 1, 114, 0, 0, 0, 0),
(151, 2, 114, 1, 0, 1, 0),
(152, 1, 115, 1, 1, 1, 0),
(153, 2, 115, 1, 0, 0, 0),
(154, 1, 116, 1, 1, 1, 1),
(155, 2, 116, 1, 1, 1, 1),
(156, 1, 117, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_selection_rule`
--

CREATE TABLE IF NOT EXISTS `ohrm_user_selection_rule` (
`id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `implementation_class` varchar(255) NOT NULL,
  `rule_xml_data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_workflow_state_machine`
--

CREATE TABLE IF NOT EXISTS `ohrm_workflow_state_machine` (
`id` bigint(20) NOT NULL,
  `workflow` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `resulting_state` varchar(255) NOT NULL,
  `roles_to_notify` text,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_workflow_state_machine`
--

INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES
(1, '0', 'INITIAL', 'SYSTEM', '7', 'NOT SUBMITTED', '', 0),
(2, '0', 'SUBMITTED', 'ADMIN', '2', 'APPROVED', '', 0),
(3, '0', 'SUBMITTED', 'ADMIN', '3', 'REJECTED', '', 0),
(4, '0', 'SUBMITTED', 'ADMIN', '0', 'SUBMITTED', '', 0),
(5, '0', 'SUBMITTED', 'ADMIN', '5', 'SUBMITTED', '', 0),
(6, '0', 'SUBMITTED', 'SUPERVISOR', '2', 'APPROVED', '', 0),
(7, '0', 'SUBMITTED', 'SUPERVISOR', '3', 'REJECTED', '', 0),
(8, '0', 'SUBMITTED', 'SUPERVISOR', '5', 'SUBMITTED', '', 0),
(9, '0', 'SUBMITTED', 'SUPERVISOR', '0', 'SUBMITTED', '', 0),
(10, '0', 'SUBMITTED', 'ESS USER', '0', 'SUBMITTED', '', 0),
(11, '0', 'SUBMITTED', 'ESS USER', '5', 'SUBMITTED', '', 0),
(12, '0', 'NOT SUBMITTED', 'ESS USER', '1', 'SUBMITTED', '', 0),
(13, '0', 'NOT SUBMITTED', 'ESS USER', '5', 'NOT SUBMITTED', '', 0),
(15, '0', 'NOT SUBMITTED', 'ESS USER', '0', 'NOT SUBMITTED', '', 0),
(16, '0', 'NOT SUBMITTED', 'SUPERVISOR', '0', 'NOT SUBMITTED', '', 0),
(17, '0', 'NOT SUBMITTED', 'SUPERVISOR', '5', 'NOT SUBMITTED', '', 0),
(18, '0', 'NOT SUBMITTED', 'SUPERVISOR', '1', 'SUBMITTED', '', 0),
(19, '0', 'NOT SUBMITTED', 'ADMIN', '0', 'NOT SUBMITTED', '', 0),
(20, '0', 'NOT SUBMITTED', 'ADMIN', '5', 'NOT SUBMITTED', '', 0),
(21, '0', 'NOT SUBMITTED', 'ADMIN', '1', 'SUBMITTED', '', 0),
(22, '0', 'REJECTED', 'ESS USER', '1', 'SUBMITTED', '', 0),
(23, '0', 'REJECTED', 'ESS USER', '0', 'REJECTED', '', 0),
(24, '0', 'REJECTED', 'ESS USER', '5', 'REJECTED', '', 0),
(25, '0', 'REJECTED', 'SUPERVISOR', '1', 'SUBMITTED', '', 0),
(26, '0', 'REJECTED', 'SUPERVISOR', '0', 'REJECTED', '', 0),
(27, '0', 'REJECTED', 'SUPERVISOR', '5', 'REJECTED', '', 0),
(28, '0', 'REJECTED', 'ADMIN', '0', 'REJECTED', '', 0),
(29, '0', 'REJECTED', 'ADMIN', '5', 'SUBMITTED', '', 0),
(30, '0', 'REJECTED', 'ADMIN', '1', 'SUBMITTED', '', 0),
(31, '0', 'APPROVED', 'ESS USER', '0', 'APPROVED', '', 0),
(32, '0', 'APPROVED', 'SUPERVISOR', '0', 'APPROVED', '', 0),
(33, '0', 'APPROVED', 'ADMIN', '0', 'APPROVED', '', 0),
(34, '0', 'APPROVED', 'ADMIN', '4', 'SUBMITTED', '', 0),
(35, '1', 'PUNCHED IN', 'ESS USER', '1', 'PUNCHED OUT', '', 0),
(36, '1', 'INITIAL', 'ESS USER', '0', 'PUNCHED IN', '', 0),
(37, '2', 'INITIAL', 'ADMIN', '1', 'APPLICATION INITIATED', '', 0),
(38, '2', 'APPLICATION INITIATED', 'ADMIN', '2', 'SHORTLISTED', '', 0),
(39, '2', 'APPLICATION INITIATED', 'ADMIN', '3', 'REJECTED', '', 0),
(40, '2', 'SHORTLISTED', 'ADMIN', '4', 'INTERVIEW SCHEDULED', '', 0),
(41, '2', 'SHORTLISTED', 'ADMIN', '3', 'REJECTED', '', 0),
(42, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '3', 'REJECTED', '', 0),
(43, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '5', 'INTERVIEW PASSED', '', 0),
(44, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '6', 'INTERVIEW FAILED', '', 0),
(45, '2', 'INTERVIEW PASSED', 'ADMIN', '4', 'INTERVIEW SCHEDULED', '', 0),
(46, '2', 'INTERVIEW PASSED', 'ADMIN', '7', 'JOB OFFERED', '', 0),
(47, '2', 'INTERVIEW PASSED', 'ADMIN', '3', 'REJECTED', '', 0),
(48, '2', 'INTERVIEW FAILED', 'ADMIN', '3', 'REJECTED', '', 0),
(49, '2', 'JOB OFFERED', 'ADMIN', '8', 'OFFER DECLINED', '', 0),
(50, '2', 'JOB OFFERED', 'ADMIN', '3', 'REJECTED', '', 0),
(51, '2', 'JOB OFFERED', 'ADMIN', '9', 'HIRED', '', 0),
(52, '2', 'OFFER DECLINED', 'ADMIN', '3', 'REJECTED', '', 0),
(53, '2', 'INITIAL', 'HIRING MANAGER', '1', 'APPLICATION INITIATED', '', 0),
(54, '2', 'APPLICATION INITIATED', 'HIRING MANAGER', '2', 'SHORTLISTED', '', 0),
(55, '2', 'APPLICATION INITIATED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(56, '2', 'SHORTLISTED', 'HIRING MANAGER', '4', 'INTERVIEW SCHEDULED', '', 0),
(57, '2', 'SHORTLISTED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(58, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(59, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '5', 'INTERVIEW PASSED', '', 0),
(60, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '6', 'INTERVIEW FAILED', '', 0),
(61, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '4', 'INTERVIEW SCHEDULED', '', 0),
(62, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '7', 'JOB OFFERED', '', 0),
(63, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(64, '2', 'INTERVIEW FAILED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(65, '2', 'JOB OFFERED', 'HIRING MANAGER', '8', 'OFFER DECLINED', '', 0),
(66, '2', 'JOB OFFERED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(67, '2', 'JOB OFFERED', 'HIRING MANAGER', '9', 'HIRED', '', 0),
(68, '2', 'OFFER DECLINED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(69, '2', 'INTERVIEW SCHEDULED', 'INTERVIEWER', '5', 'INTERVIEW PASSED', '', 0),
(70, '2', 'INTERVIEW SCHEDULED', 'INTERVIEWER', '6', 'INTERVIEW FAILED', '', 0),
(71, '1', 'INITIAL', 'ADMIN', '5', 'PUNCHED IN', '', 0),
(72, '1', 'PUNCHED IN', 'ADMIN', '6', 'PUNCHED OUT', '', 0),
(73, '1', 'PUNCHED IN', 'ADMIN', '2', 'PUNCHED IN', '', 0),
(74, '1', 'PUNCHED IN', 'ADMIN', '7', 'N/A', '', 0),
(75, '1', 'PUNCHED OUT', 'ADMIN', '2', 'PUNCHED OUT', '', 0),
(76, '1', 'PUNCHED OUT', 'ADMIN', '3', 'PUNCHED OUT', '', 0),
(77, '1', 'PUNCHED OUT', 'ADMIN', '7', 'N/A', '', 0),
(78, '0', 'INITIAL', 'ADMIN', '7', 'NOT SUBMITTED', '', 0),
(79, '0', 'INITIAL', 'ESS USER', '7', 'NOT SUBMITTED', '', 0),
(80, '0', 'INITIAL', 'SUPERVISOR', '7', 'NOT SUBMITTED', '', 0),
(81, '3', 'NOT_EXIST', 'ADMIN', '1', 'ACTIVE', '', 0),
(82, '3', 'ACTIVE', 'ADMIN', '2', 'NOT_EXIST', '', 0),
(83, '3', 'ACTIVE', 'ADMIN', '3', 'TERMINATED', '', 0),
(84, '3', 'TERMINATED', 'ADMIN', '4', 'ACTIVE', '', 0),
(85, '3', 'TERMINATED', 'ADMIN', '5', 'NOT_EXIST', '', 0),
(86, '4', 'INITIAL', 'ESS', 'APPLY', 'PENDING APPROVAL', 'supervisor,subscriber', 0),
(87, '4', 'INITIAL', 'ADMIN', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0),
(88, '4', 'INITIAL', 'SUPERVISOR', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0),
(89, '4', 'PENDING APPROVAL', 'ADMIN', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0),
(90, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0),
(91, '4', 'PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(92, '4', 'PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(93, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(94, '4', 'PENDING APPROVAL', 'ADMIN', 'REJECT', 'REJECTED', 'ess,subscriber', 0),
(95, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'REJECT', 'REJECTED', 'ess,subscriber', 0),
(96, '4', 'SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(97, '4', 'SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(98, '4', 'SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(99, '4', 'TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(100, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(101, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(102, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(103, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(104, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(105, '4', 'LEAVE TYPE DELETED SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(106, '4', 'LEAVE TYPE DELETED TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(107, '1', 'INITIAL', 'ESS USER', '8', 'INITIAL', NULL, 0),
(108, '1', 'PUNCHED IN', 'ESS USER', '8', 'PUNCHED IN', NULL, 0),
(109, '1', 'PUNCHED IN', 'ESS USER', '2', 'PUNCHED IN', NULL, 0),
(110, '1', 'PUNCHED OUT', 'ESS USER', '3', 'PUNCHED OUT', NULL, 0),
(111, '1', 'PUNCHED OUT', 'ESS USER', '2', 'PUNCHED OUT', NULL, 0),
(112, '1', 'PUNCHED IN', 'ESS USER', '7', 'NA', NULL, 0),
(113, '1', 'PUNCHED OUT', 'ESS USER', '7', 'NA', NULL, 0),
(114, '1', 'PUNCHED IN', 'SUPERVISOR', '2', 'PUNCHED IN', NULL, 0),
(115, '1', 'PUNCHED OUT', 'SUPERVISOR', '2', 'PUNCHED OUT', NULL, 0),
(116, '1', 'PUNCHED OUT', 'SUPERVISOR', '3', 'PUNCHED OUT', NULL, 0),
(117, '1', 'PUNCHED IN', 'SUPERVISOR', '7', 'NA', NULL, 0),
(118, '1', 'PUNCHED OUT', 'SUPERVISOR', '7', 'NA', NULL, 0),
(119, '1', 'INITIAL', 'SUPERVISOR', '5', 'PUNCHED IN', NULL, 0),
(120, '1', 'PUNCHED IN', 'SUPERVISOR', '6', 'PUNCHED OUT', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_shift`
--

CREATE TABLE IF NOT EXISTS `ohrm_work_shift` (
`id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `hours_per_day` decimal(4,2) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_week`
--

CREATE TABLE IF NOT EXISTS `ohrm_work_week` (
`id` int(10) unsigned NOT NULL,
  `operational_country_id` int(10) unsigned DEFAULT NULL,
  `mon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `wed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `thu` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fri` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sun` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ohrm_work_week`
--

INSERT INTO `ohrm_work_week` (`id`, `operational_country_id`, `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `sun`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_ws_consumer`
--

CREATE TABLE IF NOT EXISTS `ohrm_ws_consumer` (
`app_id` int(10) unsigned NOT NULL,
  `app_token` varchar(10) NOT NULL,
  `app_name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abstract_display_field`
--
ALTER TABLE `abstract_display_field`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_config`
--
ALTER TABLE `hs_hr_config`
 ADD PRIMARY KEY (`key`);

--
-- Indexes for table `hs_hr_country`
--
ALTER TABLE `hs_hr_country`
 ADD PRIMARY KEY (`cou_code`);

--
-- Indexes for table `hs_hr_currency_type`
--
ALTER TABLE `hs_hr_currency_type`
 ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `hs_hr_custom_export`
--
ALTER TABLE `hs_hr_custom_export`
 ADD PRIMARY KEY (`export_id`), ADD KEY `emp_number` (`export_id`);

--
-- Indexes for table `hs_hr_custom_fields`
--
ALTER TABLE `hs_hr_custom_fields`
 ADD PRIMARY KEY (`field_num`), ADD KEY `emp_number` (`field_num`), ADD KEY `screen` (`screen`);

--
-- Indexes for table `hs_hr_custom_import`
--
ALTER TABLE `hs_hr_custom_import`
 ADD PRIMARY KEY (`import_id`), ADD KEY `emp_number` (`import_id`);

--
-- Indexes for table `hs_hr_district`
--
ALTER TABLE `hs_hr_district`
 ADD PRIMARY KEY (`district_code`);

--
-- Indexes for table `hs_hr_employee`
--
ALTER TABLE `hs_hr_employee`
 ADD PRIMARY KEY (`emp_number`), ADD KEY `work_station` (`work_station`), ADD KEY `nation_code` (`nation_code`), ADD KEY `job_title_code` (`job_title_code`), ADD KEY `emp_status` (`emp_status`), ADD KEY `eeo_cat_code` (`eeo_cat_code`), ADD KEY `termination_id` (`termination_id`);

--
-- Indexes for table `hs_hr_emp_attachment`
--
ALTER TABLE `hs_hr_emp_attachment`
 ADD PRIMARY KEY (`emp_number`,`eattach_id`), ADD KEY `screen` (`screen`);

--
-- Indexes for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
 ADD PRIMARY KEY (`id`), ADD KEY `sal_grd_code` (`sal_grd_code`), ADD KEY `currency_id` (`currency_id`), ADD KEY `emp_number` (`emp_number`), ADD KEY `payperiod_code` (`payperiod_code`);

--
-- Indexes for table `hs_hr_emp_children`
--
ALTER TABLE `hs_hr_emp_children`
 ADD PRIMARY KEY (`emp_number`,`ec_seqno`);

--
-- Indexes for table `hs_hr_emp_contract_extend`
--
ALTER TABLE `hs_hr_emp_contract_extend`
 ADD PRIMARY KEY (`emp_number`,`econ_extend_id`);

--
-- Indexes for table `hs_hr_emp_dependents`
--
ALTER TABLE `hs_hr_emp_dependents`
 ADD PRIMARY KEY (`emp_number`,`ed_seqno`);

--
-- Indexes for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
 ADD PRIMARY KEY (`id`), ADD KEY `salary_id` (`salary_id`);

--
-- Indexes for table `hs_hr_emp_emergency_contacts`
--
ALTER TABLE `hs_hr_emp_emergency_contacts`
 ADD PRIMARY KEY (`emp_number`,`eec_seqno`);

--
-- Indexes for table `hs_hr_emp_history_of_ealier_pos`
--
ALTER TABLE `hs_hr_emp_history_of_ealier_pos`
 ADD PRIMARY KEY (`emp_number`,`emp_seqno`);

--
-- Indexes for table `hs_hr_emp_language`
--
ALTER TABLE `hs_hr_emp_language`
 ADD PRIMARY KEY (`emp_number`,`lang_id`,`fluency`), ADD KEY `lang_id` (`lang_id`);

--
-- Indexes for table `hs_hr_emp_locations`
--
ALTER TABLE `hs_hr_emp_locations`
 ADD PRIMARY KEY (`emp_number`,`location_id`), ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `hs_hr_emp_member_detail`
--
ALTER TABLE `hs_hr_emp_member_detail`
 ADD PRIMARY KEY (`emp_number`,`membship_code`), ADD KEY `membship_code` (`membship_code`);

--
-- Indexes for table `hs_hr_emp_passport`
--
ALTER TABLE `hs_hr_emp_passport`
 ADD PRIMARY KEY (`emp_number`,`ep_seqno`);

--
-- Indexes for table `hs_hr_emp_picture`
--
ALTER TABLE `hs_hr_emp_picture`
 ADD PRIMARY KEY (`emp_number`);

--
-- Indexes for table `hs_hr_emp_reportto`
--
ALTER TABLE `hs_hr_emp_reportto`
 ADD PRIMARY KEY (`erep_sup_emp_number`,`erep_sub_emp_number`,`erep_reporting_mode`), ADD KEY `erep_sub_emp_number` (`erep_sub_emp_number`), ADD KEY `erep_reporting_mode` (`erep_reporting_mode`);

--
-- Indexes for table `hs_hr_emp_skill`
--
ALTER TABLE `hs_hr_emp_skill`
 ADD KEY `emp_number` (`emp_number`), ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `hs_hr_emp_us_tax`
--
ALTER TABLE `hs_hr_emp_us_tax`
 ADD PRIMARY KEY (`emp_number`);

--
-- Indexes for table `hs_hr_emp_work_experience`
--
ALTER TABLE `hs_hr_emp_work_experience`
 ADD PRIMARY KEY (`emp_number`,`eexp_seqno`);

--
-- Indexes for table `hs_hr_jobtit_empstat`
--
ALTER TABLE `hs_hr_jobtit_empstat`
 ADD PRIMARY KEY (`jobtit_code`,`estat_code`), ADD KEY `estat_code` (`estat_code`);

--
-- Indexes for table `hs_hr_mailnotifications`
--
ALTER TABLE `hs_hr_mailnotifications`
 ADD KEY `user_id` (`user_id`), ADD KEY `notification_type_id` (`notification_type_id`);

--
-- Indexes for table `hs_hr_module`
--
ALTER TABLE `hs_hr_module`
 ADD PRIMARY KEY (`mod_id`);

--
-- Indexes for table `hs_hr_payperiod`
--
ALTER TABLE `hs_hr_payperiod`
 ADD PRIMARY KEY (`payperiod_code`);

--
-- Indexes for table `hs_hr_pay_period`
--
ALTER TABLE `hs_hr_pay_period`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_province`
--
ALTER TABLE `hs_hr_province`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_unique_id`
--
ALTER TABLE `hs_hr_unique_id`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `table_field` (`table_name`,`field_name`);

--
-- Indexes for table `ohrm_advanced_report`
--
ALTER TABLE `ohrm_advanced_report`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_attendance_record`
--
ALTER TABLE `ohrm_attendance_record`
 ADD PRIMARY KEY (`id`), ADD KEY `emp_id_state` (`employee_id`,`state`), ADD KEY `emp_id_time` (`employee_id`,`punch_in_utc_time`,`punch_out_utc_time`);

--
-- Indexes for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
 ADD PRIMARY KEY (`id`), ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `ohrm_available_group_field`
--
ALTER TABLE `ohrm_available_group_field`
 ADD PRIMARY KEY (`report_group_id`,`group_field_id`), ADD KEY `report_group_id` (`report_group_id`), ADD KEY `group_field_id` (`group_field_id`);

--
-- Indexes for table `ohrm_beacon_notification`
--
ALTER TABLE `ohrm_beacon_notification`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
 ADD PRIMARY KEY (`composite_display_field_id`), ADD KEY `report_group_id` (`report_group_id`), ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_customer`
--
ALTER TABLE `ohrm_customer`
 ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
 ADD PRIMARY KEY (`id`), ADD KEY `datapoint_type_id` (`datapoint_type_id`);

--
-- Indexes for table `ohrm_datapoint_type`
--
ALTER TABLE `ohrm_datapoint_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_data_group`
--
ALTER TABLE `ohrm_data_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
 ADD PRIMARY KEY (`id`), ADD KEY `data_group_id` (`data_group_id`), ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
 ADD PRIMARY KEY (`display_field_id`), ADD KEY `report_group_id` (`report_group_id`), ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
 ADD PRIMARY KEY (`id`), ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_education`
--
ALTER TABLE `ohrm_education`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email`
--
ALTER TABLE `ohrm_email`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD UNIQUE KEY `ohrm_email_name` (`name`);

--
-- Indexes for table `ohrm_email_configuration`
--
ALTER TABLE `ohrm_email_configuration`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email_notification`
--
ALTER TABLE `ohrm_email_notification`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
 ADD PRIMARY KEY (`id`), ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
 ADD PRIMARY KEY (`id`), ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
 ADD PRIMARY KEY (`id`), ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
 ADD PRIMARY KEY (`work_shift_id`,`emp_number`), ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_employment_status`
--
ALTER TABLE `ohrm_employment_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
 ADD PRIMARY KEY (`id`), ADD KEY `emp_number` (`emp_number`), ADD KEY `education_id` (`education_id`);

--
-- Indexes for table `ohrm_emp_license`
--
ALTER TABLE `ohrm_emp_license`
 ADD PRIMARY KEY (`emp_number`,`license_id`), ADD KEY `license_id` (`license_id`);

--
-- Indexes for table `ohrm_emp_reporting_method`
--
ALTER TABLE `ohrm_emp_reporting_method`
 ADD PRIMARY KEY (`reporting_method_id`);

--
-- Indexes for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
 ADD PRIMARY KEY (`id`), ADD KEY `reason_id` (`reason_id`), ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_emp_termination_reason`
--
ALTER TABLE `ohrm_emp_termination_reason`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_filter_field`
--
ALTER TABLE `ohrm_filter_field`
 ADD PRIMARY KEY (`filter_field_id`), ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_group_field`
--
ALTER TABLE `ohrm_group_field`
 ADD PRIMARY KEY (`group_field_id`);

--
-- Indexes for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ohrm_holiday_ohrm_operational_country` (`operational_country_id`);

--
-- Indexes for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
 ADD PRIMARY KEY (`id`), ADD KEY `user_role_id` (`user_role_id`);

--
-- Indexes for table `ohrm_job_candidate`
--
ALTER TABLE `ohrm_job_candidate`
 ADD PRIMARY KEY (`id`), ADD KEY `added_person` (`added_person`);

--
-- Indexes for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
 ADD PRIMARY KEY (`id`), ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
 ADD PRIMARY KEY (`id`), ADD KEY `candidate_id` (`candidate_id`), ADD KEY `vacancy_id` (`vacancy_id`), ADD KEY `interview_id` (`interview_id`), ADD KEY `performed_by` (`performed_by`);

--
-- Indexes for table `ohrm_job_candidate_vacancy`
--
ALTER TABLE `ohrm_job_candidate_vacancy`
 ADD PRIMARY KEY (`candidate_id`,`vacancy_id`), ADD UNIQUE KEY `id` (`id`), ADD KEY `vacancy_id` (`vacancy_id`);

--
-- Indexes for table `ohrm_job_category`
--
ALTER TABLE `ohrm_job_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
 ADD PRIMARY KEY (`id`), ADD KEY `candidate_vacancy_id` (`candidate_vacancy_id`), ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
 ADD PRIMARY KEY (`id`), ADD KEY `interview_id` (`interview_id`);

--
-- Indexes for table `ohrm_job_interview_interviewer`
--
ALTER TABLE `ohrm_job_interview_interviewer`
 ADD PRIMARY KEY (`interview_id`,`interviewer_id`), ADD KEY `interviewer_id` (`interviewer_id`);

--
-- Indexes for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
 ADD PRIMARY KEY (`id`), ADD KEY `job_title_id` (`job_title_id`);

--
-- Indexes for table `ohrm_job_title`
--
ALTER TABLE `ohrm_job_title`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_job_vacancy`
--
ALTER TABLE `ohrm_job_vacancy`
 ADD PRIMARY KEY (`id`), ADD KEY `job_title_code` (`job_title_code`), ADD KEY `hiring_manager_id` (`hiring_manager_id`);

--
-- Indexes for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
 ADD PRIMARY KEY (`id`), ADD KEY `vacancy_id` (`vacancy_id`);

--
-- Indexes for table `ohrm_kpi`
--
ALTER TABLE `ohrm_kpi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_language`
--
ALTER TABLE `ohrm_language`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
 ADD PRIMARY KEY (`id`), ADD KEY `leave_request_type_emp` (`leave_request_id`,`leave_type_id`,`emp_number`), ADD KEY `request_status` (`leave_request_id`,`status`), ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
 ADD PRIMARY KEY (`id`), ADD KEY `leave_type_id` (`leave_type_id`), ADD KEY `emp_number` (`emp_number`), ADD KEY `created_by_id` (`created_by_id`), ADD KEY `adjustment_type` (`adjustment_type`);

--
-- Indexes for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
 ADD PRIMARY KEY (`id`), ADD KEY `leave_id` (`leave_id`), ADD KEY `created_by_id` (`created_by_id`), ADD KEY `created_by_emp_number` (`created_by_emp_number`);

--
-- Indexes for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
 ADD PRIMARY KEY (`id`), ADD KEY `leave_type_id` (`leave_type_id`), ADD KEY `emp_number` (`emp_number`), ADD KEY `entitlement_type` (`entitlement_type`), ADD KEY `created_by_id` (`created_by_id`);

--
-- Indexes for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
 ADD PRIMARY KEY (`id`), ADD KEY `entitlement_id` (`entitlement_id`), ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `ohrm_leave_entitlement_type`
--
ALTER TABLE `ohrm_leave_entitlement_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
 ADD PRIMARY KEY (`id`), ADD KEY `entitlement_id` (`entitlement_id`), ADD KEY `leave_id` (`leave_id`);

--
-- Indexes for table `ohrm_leave_period_history`
--
ALTER TABLE `ohrm_leave_period_history`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
 ADD PRIMARY KEY (`id`), ADD KEY `emp_number` (`emp_number`), ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
 ADD PRIMARY KEY (`id`), ADD KEY `leave_request_id` (`leave_request_id`), ADD KEY `created_by_id` (`created_by_id`), ADD KEY `created_by_emp_number` (`created_by_emp_number`);

--
-- Indexes for table `ohrm_leave_status`
--
ALTER TABLE `ohrm_leave_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
 ADD PRIMARY KEY (`id`), ADD KEY `operational_country_id` (`operational_country_id`);

--
-- Indexes for table `ohrm_license`
--
ALTER TABLE `ohrm_license`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
 ADD PRIMARY KEY (`id`), ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `ohrm_login`
--
ALTER TABLE `ohrm_login`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_membership`
--
ALTER TABLE `ohrm_membership`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
 ADD PRIMARY KEY (`id`), ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_module`
--
ALTER TABLE `ohrm_module`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
 ADD PRIMARY KEY (`id`), ADD KEY `user_role_id` (`user_role_id`), ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `ohrm_nationality`
--
ALTER TABLE `ohrm_nationality`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_oauth_access_token`
--
ALTER TABLE `ohrm_oauth_access_token`
 ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `ohrm_oauth_authorization_code`
--
ALTER TABLE `ohrm_oauth_authorization_code`
 ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `ohrm_oauth_client`
--
ALTER TABLE `ohrm_oauth_client`
 ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `ohrm_oauth_refresh_token`
--
ALTER TABLE `ohrm_oauth_refresh_token`
 ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `ohrm_oauth_user`
--
ALTER TABLE `ohrm_oauth_user`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `ohrm_openid_provider`
--
ALTER TABLE `ohrm_openid_provider`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_openid_user_identity`
--
ALTER TABLE `ohrm_openid_user_identity`
 ADD KEY `ohrm_user_identity_ibfk_1` (`user_id`), ADD KEY `ohrm_user_identity_ibfk_2` (`provider_id`);

--
-- Indexes for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ohrm_operational_country_hs_hr_country` (`country_code`);

--
-- Indexes for table `ohrm_organization_gen_info`
--
ALTER TABLE `ohrm_organization_gen_info`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_pay_grade`
--
ALTER TABLE `ohrm_pay_grade`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_pay_grade_currency`
--
ALTER TABLE `ohrm_pay_grade_currency`
 ADD PRIMARY KEY (`pay_grade_id`,`currency_id`), ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_number` (`employee_number`);

--
-- Indexes for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
 ADD PRIMARY KEY (`id`), ADD KEY `ohrm_performance_track_fk1_idx` (`emp_number`), ADD KEY `ohrm_performance_track_fk2_idx` (`added_by`);

--
-- Indexes for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
 ADD PRIMARY KEY (`id`), ADD KEY `ohrm_performance_tracker_log_fk1_idx` (`performance_track_id`), ADD KEY `ohrm_performance_tracker_log_fk2_idx` (`reviewer_id`), ADD KEY `fk_ohrm_performance_tracker_log_1` (`user_id`);

--
-- Indexes for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
 ADD PRIMARY KEY (`id`), ADD KEY `ohrm_performance_tracker_reviewer_fk1_idx` (`performance_track_id`), ADD KEY `ohrm_performance_tracker_reviewer_fk2_idx` (`reviewer_id`);

--
-- Indexes for table `ohrm_plugin`
--
ALTER TABLE `ohrm_plugin`
 ADD PRIMARY KEY (`id`), ADD KEY `name` (`name`);

--
-- Indexes for table `ohrm_project`
--
ALTER TABLE `ohrm_project`
 ADD PRIMARY KEY (`project_id`,`customer_id`), ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
 ADD PRIMARY KEY (`activity_id`), ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `ohrm_project_admin`
--
ALTER TABLE `ohrm_project_admin`
 ADD PRIMARY KEY (`project_id`,`emp_number`), ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
 ADD PRIMARY KEY (`report_id`), ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_report_group`
--
ALTER TABLE `ohrm_report_group`
 ADD PRIMARY KEY (`report_group_id`);

--
-- Indexes for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
 ADD PRIMARY KEY (`id`), ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `ohrm_reviewer_group`
--
ALTER TABLE `ohrm_reviewer_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
 ADD PRIMARY KEY (`id`), ADD KEY `review_id` (`review_id`), ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `ohrm_role_user_selection_rule`
--
ALTER TABLE `ohrm_role_user_selection_rule`
 ADD PRIMARY KEY (`user_role_id`,`selection_rule_id`);

--
-- Indexes for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
 ADD PRIMARY KEY (`id`), ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `ohrm_selected_composite_display_field`
--
ALTER TABLE `ohrm_selected_composite_display_field`
 ADD PRIMARY KEY (`id`,`composite_display_field_id`,`report_id`), ADD KEY `composite_display_field_id` (`composite_display_field_id`), ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
 ADD PRIMARY KEY (`id`,`display_field_id`,`report_id`), ADD KEY `display_field_id` (`display_field_id`), ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
 ADD PRIMARY KEY (`id`), ADD KEY `report_id` (`report_id`), ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_selected_filter_field`
--
ALTER TABLE `ohrm_selected_filter_field`
 ADD PRIMARY KEY (`report_id`,`filter_field_id`), ADD KEY `report_id` (`report_id`), ADD KEY `filter_field_id` (`filter_field_id`);

--
-- Indexes for table `ohrm_selected_group_field`
--
ALTER TABLE `ohrm_selected_group_field`
 ADD PRIMARY KEY (`group_field_id`,`summary_display_field_id`,`report_id`), ADD KEY `group_field_id` (`group_field_id`), ADD KEY `summary_display_field_id` (`summary_display_field_id`), ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `ohrm_skill`
--
ALTER TABLE `ohrm_skill`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_subunit`
--
ALTER TABLE `ohrm_subunit`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_summary_display_field`
--
ALTER TABLE `ohrm_summary_display_field`
 ADD PRIMARY KEY (`summary_display_field_id`), ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_timesheet`
--
ALTER TABLE `ohrm_timesheet`
 ADD PRIMARY KEY (`timesheet_id`);

--
-- Indexes for table `ohrm_timesheet_action_log`
--
ALTER TABLE `ohrm_timesheet_action_log`
 ADD PRIMARY KEY (`timesheet_action_log_id`), ADD KEY `timesheet_id` (`timesheet_id`), ADD KEY `performed_by` (`performed_by`);

--
-- Indexes for table `ohrm_timesheet_item`
--
ALTER TABLE `ohrm_timesheet_item`
 ADD PRIMARY KEY (`timesheet_item_id`), ADD KEY `timesheet_id` (`timesheet_id`), ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `ohrm_upgrade_history`
--
ALTER TABLE `ohrm_upgrade_history`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_name` (`user_name`), ADD KEY `user_role_id` (`user_role_id`), ADD KEY `emp_number` (`emp_number`), ADD KEY `modified_user_id` (`modified_user_id`), ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `ohrm_user_role`
--
ALTER TABLE `ohrm_user_role`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_role_name` (`name`);

--
-- Indexes for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
 ADD PRIMARY KEY (`id`), ADD KEY `user_role_id` (`user_role_id`), ADD KEY `data_group_id` (`data_group_id`);

--
-- Indexes for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
 ADD PRIMARY KEY (`id`), ADD KEY `user_role_id` (`user_role_id`), ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_user_selection_rule`
--
ALTER TABLE `ohrm_user_selection_rule`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_workflow_state_machine`
--
ALTER TABLE `ohrm_workflow_state_machine`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_work_shift`
--
ALTER TABLE `ohrm_work_shift`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ohrm_work_week_ohrm_operational_country` (`operational_country_id`);

--
-- Indexes for table `ohrm_ws_consumer`
--
ALTER TABLE `ohrm_ws_consumer`
 ADD PRIMARY KEY (`app_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abstract_display_field`
--
ALTER TABLE `abstract_display_field`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hs_hr_province`
--
ALTER TABLE `hs_hr_province`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `hs_hr_unique_id`
--
ALTER TABLE `hs_hr_unique_id`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_beacon_notification`
--
ALTER TABLE `ohrm_beacon_notification`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
MODIFY `composite_display_field_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_customer`
--
ALTER TABLE `ohrm_customer`
MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_datapoint_type`
--
ALTER TABLE `ohrm_datapoint_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ohrm_data_group`
--
ALTER TABLE `ohrm_data_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
MODIFY `display_field_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ohrm_education`
--
ALTER TABLE `ohrm_education`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_email`
--
ALTER TABLE `ohrm_email`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_email_configuration`
--
ALTER TABLE `ohrm_email_configuration`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_email_notification`
--
ALTER TABLE `ohrm_email_notification`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
MODIFY `work_shift_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_employment_status`
--
ALTER TABLE `ohrm_employment_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_emp_reporting_method`
--
ALTER TABLE `ohrm_emp_reporting_method`
MODIFY `reporting_method_id` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_emp_termination_reason`
--
ALTER TABLE `ohrm_emp_termination_reason`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
MODIFY `id` int(13) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ohrm_job_category`
--
ALTER TABLE `ohrm_job_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_title`
--
ALTER TABLE `ohrm_job_title`
MODIFY `id` int(13) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_kpi`
--
ALTER TABLE `ohrm_kpi`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_language`
--
ALTER TABLE `ohrm_language`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_entitlement_type`
--
ALTER TABLE `ohrm_leave_entitlement_type`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_leave_period_history`
--
ALTER TABLE `ohrm_leave_period_history`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_status`
--
ALTER TABLE `ohrm_leave_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_license`
--
ALTER TABLE `ohrm_license`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_login`
--
ALTER TABLE `ohrm_login`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ohrm_membership`
--
ALTER TABLE `ohrm_membership`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `ohrm_module`
--
ALTER TABLE `ohrm_module`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ohrm_nationality`
--
ALTER TABLE `ohrm_nationality`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `ohrm_openid_provider`
--
ALTER TABLE `ohrm_openid_provider`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_organization_gen_info`
--
ALTER TABLE `ohrm_organization_gen_info`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_pay_grade`
--
ALTER TABLE `ohrm_pay_grade`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_plugin`
--
ALTER TABLE `ohrm_plugin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_project`
--
ALTER TABLE `ohrm_project`
MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
MODIFY `report_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_reviewer_group`
--
ALTER TABLE `ohrm_reviewer_group`
MODIFY `id` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=256;
--
-- AUTO_INCREMENT for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `ohrm_skill`
--
ALTER TABLE `ohrm_skill`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_subunit`
--
ALTER TABLE `ohrm_subunit`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_upgrade_history`
--
ALTER TABLE `ohrm_upgrade_history`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ohrm_user_role`
--
ALTER TABLE `ohrm_user_role`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `ohrm_user_selection_rule`
--
ALTER TABLE `ohrm_user_selection_rule`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_workflow_state_machine`
--
ALTER TABLE `ohrm_workflow_state_machine`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `ohrm_work_shift`
--
ALTER TABLE `ohrm_work_shift`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_ws_consumer`
--
ALTER TABLE `ohrm_ws_consumer`
MODIFY `app_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `hs_hr_employee`
--
ALTER TABLE `hs_hr_employee`
ADD CONSTRAINT `hs_hr_employee_ibfk_1` FOREIGN KEY (`work_station`) REFERENCES `ohrm_subunit` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `hs_hr_employee_ibfk_2` FOREIGN KEY (`nation_code`) REFERENCES `ohrm_nationality` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `hs_hr_employee_ibfk_3` FOREIGN KEY (`job_title_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `hs_hr_employee_ibfk_4` FOREIGN KEY (`emp_status`) REFERENCES `ohrm_employment_status` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `hs_hr_employee_ibfk_5` FOREIGN KEY (`eeo_cat_code`) REFERENCES `ohrm_job_category` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `hs_hr_employee_ibfk_6` FOREIGN KEY (`termination_id`) REFERENCES `ohrm_emp_termination` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hs_hr_emp_attachment`
--
ALTER TABLE `hs_hr_emp_attachment`
ADD CONSTRAINT `hs_hr_emp_attachment_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_1` FOREIGN KEY (`sal_grd_code`) REFERENCES `ohrm_pay_grade` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `hs_hr_currency_type` (`currency_id`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_3` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_4` FOREIGN KEY (`payperiod_code`) REFERENCES `hs_hr_payperiod` (`payperiod_code`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_children`
--
ALTER TABLE `hs_hr_emp_children`
ADD CONSTRAINT `hs_hr_emp_children_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_contract_extend`
--
ALTER TABLE `hs_hr_emp_contract_extend`
ADD CONSTRAINT `hs_hr_emp_contract_extend_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_dependents`
--
ALTER TABLE `hs_hr_emp_dependents`
ADD CONSTRAINT `hs_hr_emp_dependents_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
ADD CONSTRAINT `hs_hr_emp_directdebit_ibfk_1` FOREIGN KEY (`salary_id`) REFERENCES `hs_hr_emp_basicsalary` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_emergency_contacts`
--
ALTER TABLE `hs_hr_emp_emergency_contacts`
ADD CONSTRAINT `hs_hr_emp_emergency_contacts_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_history_of_ealier_pos`
--
ALTER TABLE `hs_hr_emp_history_of_ealier_pos`
ADD CONSTRAINT `hs_hr_emp_history_of_ealier_pos_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_language`
--
ALTER TABLE `hs_hr_emp_language`
ADD CONSTRAINT `hs_hr_emp_language_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_emp_language_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `ohrm_language` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_locations`
--
ALTER TABLE `hs_hr_emp_locations`
ADD CONSTRAINT `hs_hr_emp_locations_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `ohrm_location` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_emp_locations_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_member_detail`
--
ALTER TABLE `hs_hr_emp_member_detail`
ADD CONSTRAINT `hs_hr_emp_member_detail_ibfk_1` FOREIGN KEY (`membship_code`) REFERENCES `ohrm_membership` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_emp_member_detail_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_passport`
--
ALTER TABLE `hs_hr_emp_passport`
ADD CONSTRAINT `hs_hr_emp_passport_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_picture`
--
ALTER TABLE `hs_hr_emp_picture`
ADD CONSTRAINT `hs_hr_emp_picture_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_reportto`
--
ALTER TABLE `hs_hr_emp_reportto`
ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_1` FOREIGN KEY (`erep_sup_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_2` FOREIGN KEY (`erep_sub_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_3` FOREIGN KEY (`erep_reporting_mode`) REFERENCES `ohrm_emp_reporting_method` (`reporting_method_id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_skill`
--
ALTER TABLE `hs_hr_emp_skill`
ADD CONSTRAINT `hs_hr_emp_skill_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_emp_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `ohrm_skill` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_us_tax`
--
ALTER TABLE `hs_hr_emp_us_tax`
ADD CONSTRAINT `hs_hr_emp_us_tax_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_work_experience`
--
ALTER TABLE `hs_hr_emp_work_experience`
ADD CONSTRAINT `hs_hr_emp_work_experience_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_jobtit_empstat`
--
ALTER TABLE `hs_hr_jobtit_empstat`
ADD CONSTRAINT `hs_hr_jobtit_empstat_ibfk_1` FOREIGN KEY (`jobtit_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `hs_hr_jobtit_empstat_ibfk_2` FOREIGN KEY (`estat_code`) REFERENCES `ohrm_employment_status` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_mailnotifications`
--
ALTER TABLE `hs_hr_mailnotifications`
ADD CONSTRAINT `hs_hr_mailnotifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
ADD CONSTRAINT `ohrm_auth_provider_extra_details_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `ohrm_openid_provider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_available_group_field`
--
ALTER TABLE `ohrm_available_group_field`
ADD CONSTRAINT `ohrm_available_group_field_ibfk_1` FOREIGN KEY (`group_field_id`) REFERENCES `ohrm_group_field` (`group_field_id`);

--
-- Constraints for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
ADD CONSTRAINT `ohrm_composite_display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_composite_display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
ADD CONSTRAINT `ohrm_datapoint_ibfk_1` FOREIGN KEY (`datapoint_type_id`) REFERENCES `ohrm_datapoint_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
ADD CONSTRAINT `ohrm_data_group_screen_ibfk_1` FOREIGN KEY (`data_group_id`) REFERENCES `ohrm_data_group` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_data_group_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
ADD CONSTRAINT `ohrm_display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
ADD CONSTRAINT `ohrm_display_field_group_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
ADD CONSTRAINT `ohrm_email_processor_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `ohrm_email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
ADD CONSTRAINT `ohrm_email_subscriber_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `ohrm_email_notification` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
ADD CONSTRAINT `ohrm_email_template_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `ohrm_email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
ADD CONSTRAINT `ohrm_employee_work_shift_ibfk_1` FOREIGN KEY (`work_shift_id`) REFERENCES `ohrm_work_shift` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_employee_work_shift_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
ADD CONSTRAINT `ohrm_emp_education_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_emp_education_ibfk_2` FOREIGN KEY (`education_id`) REFERENCES `ohrm_education` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_license`
--
ALTER TABLE `ohrm_emp_license`
ADD CONSTRAINT `ohrm_emp_license_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_emp_license_ibfk_2` FOREIGN KEY (`license_id`) REFERENCES `ohrm_license` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
ADD CONSTRAINT `ohrm_emp_termination_ibfk_1` FOREIGN KEY (`reason_id`) REFERENCES `ohrm_emp_termination_reason` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `ohrm_emp_termination_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_filter_field`
--
ALTER TABLE `ohrm_filter_field`
ADD CONSTRAINT `ohrm_filter_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
ADD CONSTRAINT `fk_ohrm_holiday_ohrm_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
ADD CONSTRAINT `ohrm_home_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_candidate`
--
ALTER TABLE `ohrm_job_candidate`
ADD CONSTRAINT `ohrm_job_candidate_ibfk_1` FOREIGN KEY (`added_person`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
ADD CONSTRAINT `ohrm_job_candidate_attachment_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_3` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_4` FOREIGN KEY (`performed_by`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_candidate_vacancy`
--
ALTER TABLE `ohrm_job_candidate_vacancy`
ADD CONSTRAINT `ohrm_job_candidate_vacancy_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_job_candidate_vacancy_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
ADD CONSTRAINT `ohrm_job_interview_ibfk_1` FOREIGN KEY (`candidate_vacancy_id`) REFERENCES `ohrm_job_candidate_vacancy` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `ohrm_job_interview_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
ADD CONSTRAINT `ohrm_job_interview_attachment_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview_interviewer`
--
ALTER TABLE `ohrm_job_interview_interviewer`
ADD CONSTRAINT `ohrm_job_interview_interviewer_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_job_interview_interviewer_ibfk_2` FOREIGN KEY (`interviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
ADD CONSTRAINT `ohrm_job_specification_attachment_ibfk_1` FOREIGN KEY (`job_title_id`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_vacancy`
--
ALTER TABLE `ohrm_job_vacancy`
ADD CONSTRAINT `ohrm_job_vacancy_ibfk_1` FOREIGN KEY (`job_title_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_job_vacancy_ibfk_2` FOREIGN KEY (`hiring_manager_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
ADD CONSTRAINT `ohrm_job_vacancy_attachment_ibfk_1` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
ADD CONSTRAINT `ohrm_leave_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `ohrm_leave_request` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_4` FOREIGN KEY (`adjustment_type`) REFERENCES `ohrm_leave_entitlement_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
ADD CONSTRAINT `ohrm_leave_comment_ibfk_1` FOREIGN KEY (`leave_id`) REFERENCES `ohrm_leave` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `ohrm_leave_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_3` FOREIGN KEY (`entitlement_type`) REFERENCES `ohrm_leave_entitlement_type` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_4` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
ADD CONSTRAINT `ohrm_leave_entitlement_adjustment_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `ohrm_leave_entitlement` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_entitlement_adjustment_ibfk_2` FOREIGN KEY (`adjustment_id`) REFERENCES `ohrm_leave_adjustment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
ADD CONSTRAINT `ohrm_leave_leave_entitlement_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `ohrm_leave_entitlement` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_leave_entitlement_ibfk_2` FOREIGN KEY (`leave_id`) REFERENCES `ohrm_leave` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
ADD CONSTRAINT `ohrm_leave_request_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_request_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `ohrm_leave_request` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
ADD CONSTRAINT `ohrm_leave_type_ibfk_1` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
ADD CONSTRAINT `ohrm_location_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `hs_hr_country` (`cou_code`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
ADD CONSTRAINT `ohrm_menu_item_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
ADD CONSTRAINT `ohrm_module_default_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_module_default_page_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `ohrm_module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_openid_user_identity`
--
ALTER TABLE `ohrm_openid_user_identity`
ADD CONSTRAINT `ohrm_user_identity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `ohrm_user_identity_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `ohrm_openid_provider` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
ADD CONSTRAINT `fk_ohrm_operational_country_hs_hr_country` FOREIGN KEY (`country_code`) REFERENCES `hs_hr_country` (`cou_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_pay_grade_currency`
--
ALTER TABLE `ohrm_pay_grade_currency`
ADD CONSTRAINT `ohrm_pay_grade_currency_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `hs_hr_currency_type` (`currency_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_pay_grade_currency_ibfk_2` FOREIGN KEY (`pay_grade_id`) REFERENCES `ohrm_pay_grade` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
ADD CONSTRAINT `ohrm_performance_review_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
ADD CONSTRAINT `ohrm_performance_track_fk1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ohrm_performance_track_fk2` FOREIGN KEY (`added_by`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
ADD CONSTRAINT `fk_ohrm_performance_tracker_log_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ohrm_performance_tracker_log_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `ohrm_performance_track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ohrm_performance_tracker_log_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
ADD CONSTRAINT `ohrm_performance_tracker_reviewer_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `ohrm_performance_track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ohrm_performance_tracker_reviewer_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
ADD CONSTRAINT `ohrm_project_activity_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `ohrm_project` (`project_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_project_admin`
--
ALTER TABLE `ohrm_project_admin`
ADD CONSTRAINT `ohrm_project_admin_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `ohrm_project` (`project_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_project_admin_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
ADD CONSTRAINT `ohrm_report_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
ADD CONSTRAINT `ohrm_reviewer_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `ohrm_performance_review` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
ADD CONSTRAINT `ohrm_reviewer_rating_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `ohrm_reviewer` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_reviewer_rating_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `ohrm_performance_review` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
ADD CONSTRAINT `ohrm_screen_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ohrm_module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_composite_display_field`
--
ALTER TABLE `ohrm_selected_composite_display_field`
ADD CONSTRAINT `ohrm_selected_composite_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_selected_composite_display_field_ibfk_2` FOREIGN KEY (`composite_display_field_id`) REFERENCES `ohrm_composite_display_field` (`composite_display_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
ADD CONSTRAINT `ohrm_selected_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_selected_display_field_ibfk_2` FOREIGN KEY (`display_field_id`) REFERENCES `ohrm_display_field` (`display_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
ADD CONSTRAINT `ohrm_selected_display_field_group_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_selected_display_field_group_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_filter_field`
--
ALTER TABLE `ohrm_selected_filter_field`
ADD CONSTRAINT `ohrm_selected_filter_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_selected_filter_field_ibfk_2` FOREIGN KEY (`filter_field_id`) REFERENCES `ohrm_filter_field` (`filter_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_group_field`
--
ALTER TABLE `ohrm_selected_group_field`
ADD CONSTRAINT `ohrm_selected_group_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_selected_group_field_ibfk_2` FOREIGN KEY (`group_field_id`) REFERENCES `ohrm_group_field` (`group_field_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_selected_group_field_ibfk_3` FOREIGN KEY (`summary_display_field_id`) REFERENCES `ohrm_summary_display_field` (`summary_display_field_id`);

--
-- Constraints for table `ohrm_summary_display_field`
--
ALTER TABLE `ohrm_summary_display_field`
ADD CONSTRAINT `ohrm_summary_display_field_ibfk_1` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_timesheet_action_log`
--
ALTER TABLE `ohrm_timesheet_action_log`
ADD CONSTRAINT `ohrm_timesheet_action_log_ibfk_1` FOREIGN KEY (`performed_by`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
ADD CONSTRAINT `ohrm_user_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_user_ibfk_2` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`);

--
-- Constraints for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
ADD CONSTRAINT `ohrm_user_role_data_group_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_user_role_data_group_ibfk_2` FOREIGN KEY (`data_group_id`) REFERENCES `ohrm_data_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
ADD CONSTRAINT `ohrm_user_role_screen_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ohrm_user_role_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
ADD CONSTRAINT `fk_ohrm_work_week_ohrm_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `leave_taken_status_change` ON SCHEDULE EVERY 1 HOUR STARTS '2016-04-23 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
                        UPDATE hs_hr_leave SET leave_status = 3 WHERE leave_status = 2 AND leave_date < DATE(NOW());
                      END$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
