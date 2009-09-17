-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb5+lenny1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-09-2009 a las 19:39:21
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6-1+lenny3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cuidemoselvoto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alert`
--

CREATE TABLE IF NOT EXISTS `alert` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `alert_type` tinyint(4) NOT NULL COMMENT '1 - MOBILE, 2 - EMAIL',
  `alert_recipient` varchar(200) default NULL,
  `alert_code` varchar(30) default NULL,
  `alert_confirmed` tinyint(4) NOT NULL default '0',
  `alert_lat` varchar(150) default NULL,
  `alert_lon` varchar(150) default NULL,
  `alert_ip` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uniq_alert_code` (`alert_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `alert`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alert_sent`
--

CREATE TABLE IF NOT EXISTS `alert_sent` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` bigint(20) NOT NULL,
  `alert_id` bigint(20) NOT NULL,
  `alert_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `alert_sent`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `locale` varchar(10) NOT NULL default 'en_US',
  `category_type` tinyint(4) default NULL,
  `category_title` varchar(255) default NULL,
  `category_description` text,
  `category_color` varchar(20) default NULL,
  `category_visible` tinyint(4) NOT NULL default '1',
  `sms` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcar la base de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `locale`, `category_type`, `category_title`, `category_description`, `category_color`, `category_visible`, `sms`) VALUES
(1, 'en_US', 5, 'Alteración de las urnas', 'Robo, destrucción o modificación de las urnas', '9900CC', 1, 'alte'),
(2, 'en_US', 5, 'Padrón Incompleto', 'Padrón Electoral Incompleto', '3300FF', 1, 'padr'),
(3, 'en_US', 5, 'Violación del voto secreto', 'Violación directa de la secrecía del voto  o actos intimidación', '663300', 1, 'secr'),
(4, 'en_US', 5, 'Falsificación de resultados', 'Alteración de los resultados electorales en casilla', 'CC0000', 1, 'fals'),
(5, 'en_US', 5, 'Campañas en casilla', 'Actos de campañas en la casilla', 'CC9933', 1, 'camp'),
(6, 'en_US', 5, 'Violencia', 'Incitación o actos de violencia', '9999FF', 1, 'viol'),
(7, 'en_US', 5, 'Credenciales falsas', 'Uso de credenciales de elector falsas', '66CC00', 1, 'cred'),
(8, 'en_US', 5, 'Retención de credenciales', 'Acumulación de credenciales para accarreo de votantes', 'FFCC00', 1, 'rete'),
(9, 'en_US', 5, 'Compra de votos', 'Compra de voto o presión sobre los votantes', 'FAEBD7', 1, 'comp'),
(12, 'en_US', NULL, 'Funcionarios irregulares', 'Los funcionarios que corresponden a la casilla fueron sustituidos', '9ee3a6', 1, 'sust'),
(13, 'en_US', NULL, 'Coacción sindical', 'Uso de estrucutras sindicales para acarrear, coaccionar o sustituir a votantes', 'ff3300', 1, 'sind'),
(14, 'en_US', NULL, 'Otras irregularidades', 'Irregularidades que no aparecen en el listado anterior', '00c4ff', 1, NULL),
(15, 'en_US', NULL, 'Coacción con programas sociales', 'Funcionarios públicos o de partidos amenezan a los votantes con quitarles los beneficios de los programas sociales si no votan por algún partidos', '080000', 1, 'prog');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_lang`
--

CREATE TABLE IF NOT EXISTS `category_lang` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `locale` varchar(10) default NULL,
  `category_title` varchar(255) default NULL,
  `category_description` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `category_lang`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `country_id` int(11) default NULL,
  `city` varchar(200) default NULL,
  `city_lat` varchar(150) default NULL,
  `city_lon` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=301 ;

--
-- Volcar la base de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `country_id`, `city`, `city_lat`, `city_lon`) VALUES
(201, 157, 'Mexico City', '19.4341667', '-99.1386111'),
(202, 157, 'Ciudad Juárez', '31.7333333', '-106.4833333'),
(203, 157, 'Puebla', '19.05', '-98.2'),
(204, 157, 'Ecatepec de Morelos', '19.6011111', '-99.0525'),
(205, 157, 'Nezahualcóyotl', '19.4136111', '-99.0330556'),
(206, 157, 'Acapulco', '16.8633623899124', '-99.8900985717773'),
(207, 157, 'Tijuana', '32.5333333', '-117.0166667'),
(208, 157, 'Monterrey', '25.6666667', '-100.3166667'),
(209, 157, 'León', '21.1166667', '-101.6666667'),
(210, 157, 'Guadalajara', '20.6666667', '-103.3333333'),
(211, 157, 'Veracruz', '19.2', '-96.1333333'),
(212, 157, 'Tuxtla Gutiérrez', '16.75', '-93.1166667'),
(213, 157, 'Toluca', '19.2883333', '-99.6672222'),
(214, 157, 'Texcoco', '19.5166667', '-98.8833333'),
(215, 157, 'San Cristóbal de las Casas', '16.75', '-92.6333333'),
(216, 157, 'Oaxaca', '17.05', '-96.7166667'),
(217, 157, 'Mérida', '20.9666667', '-89.6166667'),
(218, 157, 'Xalapa', '19.5333333', '-96.9166667'),
(219, 157, 'Cuernavaca', '18.9166667', '-99.25'),
(220, 157, 'Cancún', '21.1742875657158', '-86.846559047699'),
(221, 157, 'Zapopan', '20.7166667', '-103.4'),
(222, 157, 'Torreón', '25.55', '-103.4333333'),
(223, 157, 'San Luis Potosí', '22.15', '-100.9833333'),
(224, 157, 'Saltillo', '25.4166667', '-101.0'),
(225, 157, 'Morelia', '19.700778906133', '-101.184425354004'),
(226, 157, 'Mexicali', '32.6519444', '-115.4683333'),
(227, 157, 'Hermosillo', '29.0666667', '-110.9666667'),
(228, 157, 'Guadalupe', '25.6833333', '-100.25'),
(229, 157, 'Durango', '24.0333333', '-104.6666667'),
(230, 157, 'Culiacán', '24.7994444', '-107.3897222'),
(231, 157, 'Chihuahua', '28.6333333', '-106.0833333'),
(232, 157, 'Villahermosa', '17.9833333', '-92.9166667'),
(233, 157, 'Cuautitlán Izcalli', '19.6469444', '-99.2466667'),
(234, 157, 'Tehuacán', '18.45', '-97.3833333'),
(235, 157, 'Tapachula', '14.9', '-92.2833333'),
(236, 157, 'Tampico', '22.2166667', '-97.85'),
(237, 157, 'Reynosa', '26.0833333', '-98.2833333'),
(238, 157, 'Pachuca', '20.1169732434711', '-98.7332940101624'),
(239, 157, 'Nuevo Laredo', '27.5', '-99.5166667'),
(240, 157, 'Naucalpan', '19.4785078914381', '-99.2396306991577'),
(241, 157, 'Matamoros', '25.8833333', '-97.5'),
(242, 157, 'Córdoba', '18.8833333', '-96.9333333'),
(243, 157, 'Coatzacoalcos', '18.15', '-94.4166667'),
(244, 157, 'Ciudad Victoria', '23.7333333', '-99.1333333'),
(245, 157, 'Ciudad Valles', '21.9833333', '-99.0166667'),
(246, 157, 'Ciudad Madero', '22.2666667', '-97.8333333'),
(247, 157, 'Ciudad del Carmen', '18.6333333', '-91.8333333'),
(248, 157, 'Cholula', '19.064064852094', '-98.3035182952881'),
(249, 157, 'Chilpancingo', '17.55', '-99.5'),
(250, 157, 'Chetumal', '18.5', '-88.3'),
(251, 157, 'Campeche', '19.85', '-90.5333333'),
(252, 157, 'Ciudad López Mateos', '19.5583333', '-99.2613889'),
(253, 157, 'Zacatecas', '22.7755879690282', '-102.572178840637'),
(254, 157, 'Uruapan', '19.4166667', '-102.0666667'),
(255, 157, 'Tepic', '21.5', '-104.9'),
(256, 157, 'San Nicolás de los Garza', '25.75', '-100.3'),
(257, 157, 'San Luis Río Colorado', '32.4630556', '-114.7766667'),
(258, 157, 'Puerto Vallarta', '20.620413645052', '-105.230655670166'),
(259, 157, 'Piedras Negras', '28.7', '-100.5166667'),
(260, 157, 'Monclova', '26.9', '-101.4166667'),
(261, 157, 'Mazatlán', '23.2166667', '-106.4166667'),
(262, 157, 'Los Mochis', '25.7666667', '-108.9666667'),
(263, 157, 'La Paz', '24.1666667', '-110.3'),
(264, 157, 'Parral', '26.9333333', '-105.6666667'),
(265, 157, 'Guaymas', '27.9333333', '-110.9'),
(266, 157, 'General Escobedo', '25.8166667', '-100.3333333'),
(267, 157, 'Ensenada', '31.8666667', '-116.6166667'),
(268, 157, 'Colima', '19.2333333', '-103.7166667'),
(269, 157, 'Ciudad Obregón', '27.4833333', '-109.9333333'),
(270, 157, 'Ciudad Acuña', '29.3', '-100.9166667'),
(271, 157, 'Tlalnepantla', '19.5269444', '-99.2216667'),
(272, 157, 'San Pablo de las Salinas', '19.6658333', '-99.0963889'),
(273, 157, 'San Juan del Río', '20.3833333', '-100.0'),
(274, 157, 'Jiutepec', '18.8666667', '-99.1833333'),
(275, 157, 'Cuautla', '18.8', '-98.95'),
(276, 157, 'Zamora', '19.9833333', '-102.2666667'),
(277, 157, 'Tlaquepaque', '20.65', '-103.3166667'),
(278, 157, 'Soledad Díez Gutiérrez', '22.2', '-100.95'),
(279, 157, 'Querétaro', '20.6', '-100.3833333'),
(280, 157, 'Nogales', '31.3333333', '-110.9333333'),
(281, 157, 'Ciudad Delicias', '28.190134905189', '-105.470123291016'),
(282, 157, 'Apodaca', '25.7666667', '-100.2'),
(283, 157, 'Aguascalientes', '21.8833333', '-102.3'),
(284, 157, 'Xico', '19.2666667', '-98.9333333'),
(285, 157, 'Tulancingo', '20.0833333', '-98.3666667'),
(286, 157, 'Taxco', '18.55', '-99.6'),
(287, 157, 'Mitla', '16.9166667', '-96.4'),
(288, 157, 'San Francisco Tlalcilalcalpan', '19.2927778', '-99.7777778'),
(289, 157, 'Poza Rica de Hidalgo', '20.5331482715623', '-97.4594593048096'),
(290, 157, 'Palenque/Temp', '17.5166667', '-91.9666667'),
(291, 157, 'Orizaba', '18.85', '-97.1'),
(292, 157, 'Nicolás Romero', '19.6219444', '-99.3130556'),
(293, 157, 'Minatitlán', '17.9833333', '-94.5166667'),
(294, 157, 'Metepec', '19.2536111', '-99.6077778'),
(295, 157, 'Los Reyes', '19.35', '-98.9666667'),
(296, 157, 'Ixtapaluca', '19.3166667', '-98.8833333'),
(297, 157, 'Iguala de la Independencia', '18.35', '-99.5333333'),
(298, 157, 'San Miguel de Cozumel', '20.5083333', '-86.9458333'),
(299, 157, 'Coacalco', '19.6316667', '-99.1102778'),
(300, 157, 'Chalco de Díaz Covarrubias', '19.2666667', '-98.9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cluster`
--

CREATE TABLE IF NOT EXISTS `cluster` (
  `id` int(11) NOT NULL,
  `location_id` bigint(20) NOT NULL default '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude_min` double NOT NULL,
  `longitude_min` double NOT NULL,
  `latitude_max` double NOT NULL,
  `longitude_max` double NOT NULL,
  `child_count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `left_side` int(11) NOT NULL,
  `right_side` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `incident_id` bigint(20) NOT NULL default '0',
  `incident_title` varchar(255) default NULL,
  `incident_date` int(10) NOT NULL default '0',
  `category_id` int(11) unsigned NOT NULL default '0',
  `category_color` varchar(20) NOT NULL default '990000',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `cluster`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` bigint(20) NOT NULL,
  `user_id` int(11) default '0',
  `comment_author` varchar(100) default NULL,
  `comment_email` varchar(120) default NULL,
  `comment_description` text,
  `comment_ip` varchar(100) default NULL,
  `comment_rating` varchar(15) NOT NULL default '0',
  `comment_active` tinyint(4) default '0',
  `comment_date` datetime default NULL,
  `comment_date_gmt` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `comment`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL auto_increment,
  `iso` varchar(10) default NULL,
  `country` varchar(100) default NULL,
  `capital` varchar(100) default NULL,
  `cities` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=248 ;

--
-- Volcar la base de datos para la tabla `country`
--

INSERT INTO `country` (`id`, `iso`, `country`, `capital`, `cities`) VALUES
(1, 'AD', 'Andorra', 'Andorra la Vella', 0),
(2, 'AE', 'United Arab Emirates', 'Abu Dhabi', 0),
(3, 'AF', 'Afghanistan', 'Kabul', 0),
(4, 'AG', 'Antigua and Barbuda', 'St. John''s', 0),
(5, 'AI', 'Anguilla', 'The Valley', 0),
(6, 'AL', 'Albania', 'Tirana', 0),
(7, 'AM', 'Armenia', 'Yerevan', 0),
(8, 'AN', 'Netherlands Antilles', 'Willemstad', 0),
(9, 'AO', 'Angola', 'Luanda', 0),
(10, 'AQ', 'Antarctica', '', 0),
(11, 'AR', 'Argentina', 'Buenos Aires', 0),
(12, 'AS', 'American Samoa', 'Pago Pago', 0),
(13, 'AT', 'Austria', 'Vienna', 0),
(14, 'AU', 'Australia', 'Canberra', 0),
(15, 'AW', 'Aruba', 'Oranjestad', 0),
(16, 'AX', 'Aland Islands', 'Mariehamn', 0),
(17, 'AZ', 'Azerbaijan', 'Baku', 0),
(18, 'BA', 'Bosnia and Herzegovina', 'Sarajevo', 0),
(19, 'BB', 'Barbados', 'Bridgetown', 0),
(20, 'BD', 'Bangladesh', 'Dhaka', 0),
(21, 'BE', 'Belgium', 'Brussels', 0),
(22, 'BF', 'Burkina Faso', 'Ouagadougou', 0),
(23, 'BG', 'Bulgaria', 'Sofia', 0),
(24, 'BH', 'Bahrain', 'Manama', 0),
(25, 'BI', 'Burundi', 'Bujumbura', 0),
(26, 'BJ', 'Benin', 'Porto-Novo', 0),
(27, 'BL', 'Saint BarthÃ©lemy', 'Gustavia', 0),
(28, 'BM', 'Bermuda', 'Hamilton', 0),
(29, 'BN', 'Brunei', 'Bandar Seri Begawan', 0),
(30, 'BO', 'Bolivia', 'La Paz', 0),
(31, 'BR', 'Brazil', 'BrasÃ­lia', 0),
(32, 'BS', 'Bahamas', 'Nassau', 0),
(33, 'BT', 'Bhutan', 'Thimphu', 0),
(34, 'BV', 'Bouvet Island', '', 0),
(35, 'BW', 'Botswana', 'Gaborone', 0),
(36, 'BY', 'Belarus', 'Minsk', 0),
(37, 'BZ', 'Belize', 'Belmopan', 0),
(38, 'CA', 'Canada', 'Ottawa', 0),
(39, 'CC', 'Cocos Islands', 'West Island', 0),
(40, 'CD', 'Democratic Republic of the Congo', 'Kinshasa', 0),
(41, 'CF', 'Central African Republic', 'Bangui', 0),
(42, 'CG', 'Congo Brazzavile', 'Brazzaville', 0),
(43, 'CH', 'Switzerland', 'Berne', 0),
(44, 'CI', 'Ivory Coast', 'Yamoussoukro', 0),
(45, 'CK', 'Cook Islands', 'Avarua', 0),
(46, 'CL', 'Chile', 'Santiago', 0),
(47, 'CM', 'Cameroon', 'YaoundÃ©', 0),
(48, 'CN', 'China', 'Beijing', 0),
(49, 'CO', 'Colombia', 'BogotÃ¡', 0),
(50, 'CR', 'Costa Rica', 'San JosÃ©', 0),
(51, 'CS', 'Serbia and Montenegro', 'Belgrade', 0),
(52, 'CU', 'Cuba', 'Havana', 0),
(53, 'CV', 'Cape Verde', 'Praia', 0),
(54, 'CX', 'Christmas Island', 'Flying Fish Cove', 0),
(55, 'CY', 'Cyprus', 'Nicosia', 0),
(56, 'CZ', 'Czech Republic', 'Prague', 0),
(57, 'DE', 'Germany', 'Berlin', 0),
(58, 'DJ', 'Djibouti', 'Djibouti', 0),
(59, 'DK', 'Denmark', 'Copenhagen', 0),
(60, 'DM', 'Dominica', 'Roseau', 0),
(61, 'DO', 'Dominican Republic', 'Santo Domingo', 0),
(62, 'DZ', 'Algeria', 'Algiers', 0),
(63, 'EC', 'Ecuador', 'Quito', 0),
(64, 'EE', 'Estonia', 'Tallinn', 0),
(65, 'EG', 'Egypt', 'Cairo', 0),
(66, 'EH', 'Western Sahara', 'El-Aaiun', 0),
(67, 'ER', 'Eritrea', 'Asmara', 0),
(68, 'ES', 'Spain', 'Madrid', 0),
(69, 'ET', 'Ethiopia', 'Addis Ababa', 0),
(70, 'FI', 'Finland', 'Helsinki', 0),
(71, 'FJ', 'Fiji', 'Suva', 0),
(72, 'FK', 'Falkland Islands', 'Stanley', 0),
(73, 'FM', 'Micronesia', 'Palikir', 0),
(74, 'FO', 'Faroe Islands', 'TÃ³rshavn', 0),
(75, 'FR', 'France', 'Paris', 0),
(76, 'GA', 'Gabon', 'Libreville', 0),
(77, 'GB', 'United Kingdom', 'London', 0),
(78, 'GD', 'Grenada', 'St. George''s', 0),
(79, 'GE', 'Georgia', 'Tbilisi', 0),
(80, 'GF', 'French Guiana', 'Cayenne', 0),
(81, 'GG', 'Guernsey', 'St Peter Port', 0),
(82, 'GH', 'Ghana', 'Accra', 0),
(83, 'GI', 'Gibraltar', 'Gibraltar', 0),
(84, 'GL', 'Greenland', 'Nuuk', 0),
(85, 'GM', 'Gambia', 'Banjul', 0),
(86, 'GN', 'Guinea', 'Conakry', 0),
(87, 'GP', 'Guadeloupe', 'Basse-Terre', 0),
(88, 'GQ', 'Equatorial Guinea', 'Malabo', 0),
(89, 'GR', 'Greece', 'Athens', 0),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'Grytviken', 0),
(91, 'GT', 'Guatemala', 'Guatemala City', 0),
(92, 'GU', 'Guam', 'HagÃ¥tÃ±a', 0),
(93, 'GW', 'Guinea-Bissau', 'Bissau', 0),
(94, 'GY', 'Guyana', 'Georgetown', 0),
(95, 'HK', 'Hong Kong', 'Hong Kong', 0),
(96, 'HM', 'Heard Island and McDonald Islands', '', 0),
(97, 'HN', 'Honduras', 'Tegucigalpa', 0),
(98, 'HR', 'Croatia', 'Zagreb', 0),
(99, 'HT', 'Haiti', 'Port-au-Prince', 0),
(100, 'HU', 'Hungary', 'Budapest', 0),
(101, 'ID', 'Indonesia', 'Jakarta', 0),
(102, 'IE', 'Ireland', 'Dublin', 0),
(103, 'IL', 'Israel', 'Jerusalem', 0),
(104, 'IM', 'Isle of Man', 'Douglas, Isle of Man', 0),
(105, 'IN', 'India', 'New Delhi', 0),
(106, 'IO', 'British Indian Ocean Territory', 'Diego Garcia', 0),
(107, 'IQ', 'Iraq', 'Baghdad', 0),
(108, 'IR', 'Iran', 'Tehran', 0),
(109, 'IS', 'Iceland', 'ReykjavÃ­k', 0),
(110, 'IT', 'Italy', 'Rome', 0),
(111, 'JE', 'Jersey', 'Saint Helier', 0),
(112, 'JM', 'Jamaica', 'Kingston', 0),
(113, 'JO', 'Jordan', 'Amman', 0),
(114, 'JP', 'Japan', 'Tokyo', 0),
(115, 'KE', 'Kenya', 'Nairobi', 0),
(116, 'KG', 'Kyrgyzstan', 'Bishkek', 0),
(117, 'KH', 'Cambodia', 'Phnom Penh', 0),
(118, 'KI', 'Kiribati', 'South Tarawa', 0),
(119, 'KM', 'Comoros', 'Moroni', 0),
(120, 'KN', 'Saint Kitts and Nevis', 'Basseterre', 0),
(121, 'KP', 'North Korea', 'Pyongyang', 0),
(122, 'KR', 'South Korea', 'Seoul', 0),
(123, 'KW', 'Kuwait', 'Kuwait City', 0),
(124, 'KY', 'Cayman Islands', 'George Town', 0),
(125, 'KZ', 'Kazakhstan', 'Astana', 0),
(126, 'LA', 'Laos', 'Vientiane', 0),
(127, 'LB', 'Lebanon', 'Beirut', 0),
(128, 'LC', 'Saint Lucia', 'Castries', 0),
(129, 'LI', 'Liechtenstein', 'Vaduz', 0),
(130, 'LK', 'Sri Lanka', 'Colombo', 0),
(131, 'LR', 'Liberia', 'Monrovia', 0),
(132, 'LS', 'Lesotho', 'Maseru', 0),
(133, 'LT', 'Lithuania', 'Vilnius', 0),
(134, 'LU', 'Luxembourg', 'Luxembourg', 0),
(135, 'LV', 'Latvia', 'Riga', 0),
(136, 'LY', 'Libya', 'Tripolis', 0),
(137, 'MA', 'Morocco', 'Rabat', 0),
(138, 'MC', 'Monaco', 'Monaco', 0),
(139, 'MD', 'Moldova', 'Chi_in_u', 0),
(140, 'ME', 'Montenegro', 'Podgorica', 0),
(141, 'MF', 'Saint Martin', 'Marigot', 0),
(142, 'MG', 'Madagascar', 'Antananarivo', 0),
(143, 'MH', 'Marshall Islands', 'Uliga', 0),
(144, 'MK', 'Macedonia', 'Skopje', 0),
(145, 'ML', 'Mali', 'Bamako', 0),
(146, 'MM', 'Myanmar', 'Yangon', 0),
(147, 'MN', 'Mongolia', 'Ulan Bator', 0),
(148, 'MO', 'Macao', 'Macao', 0),
(149, 'MP', 'Northern Mariana Islands', 'Saipan', 0),
(150, 'MQ', 'Martinique', 'Fort-de-France', 0),
(151, 'MR', 'Mauritania', 'Nouakchott', 0),
(152, 'MS', 'Montserrat', 'Plymouth', 0),
(153, 'MT', 'Malta', 'Valletta', 0),
(154, 'MU', 'Mauritius', 'Port Louis', 0),
(155, 'MV', 'Maldives', 'MalÃ©', 0),
(156, 'MW', 'Malawi', 'Lilongwe', 0),
(157, 'MX', 'Mexico', 'Mexico City', 100),
(158, 'MY', 'Malaysia', 'Kuala Lumpur', 0),
(159, 'MZ', 'Mozambique', 'Maputo', 0),
(160, 'NA', 'Namibia', 'Windhoek', 0),
(161, 'NC', 'New Caledonia', 'NoumÃ©a', 0),
(162, 'NE', 'Niger', 'Niamey', 0),
(163, 'NF', 'Norfolk Island', 'Kingston', 0),
(164, 'NG', 'Nigeria', 'Abuja', 0),
(165, 'NI', 'Nicaragua', 'Managua', 0),
(166, 'NL', 'Netherlands', 'Amsterdam', 0),
(167, 'NO', 'Norway', 'Oslo', 0),
(168, 'NP', 'Nepal', 'Kathmandu', 0),
(169, 'NR', 'Nauru', 'Yaren', 0),
(170, 'NU', 'Niue', 'Alofi', 0),
(171, 'NZ', 'New Zealand', 'Wellington', 0),
(172, 'OM', 'Oman', 'Muscat', 0),
(173, 'PA', 'Panama', 'Panama City', 0),
(174, 'PE', 'Peru', 'Lima', 0),
(175, 'PF', 'French Polynesia', 'Papeete', 0),
(176, 'PG', 'Papua New Guinea', 'Port Moresby', 0),
(177, 'PH', 'Philippines', 'Manila', 0),
(178, 'PK', 'Pakistan', 'Islamabad', 0),
(179, 'PL', 'Poland', 'Warsaw', 0),
(180, 'PM', 'Saint Pierre and Miquelon', 'Saint-Pierre', 0),
(181, 'PN', 'Pitcairn', 'Adamstown', 0),
(182, 'PR', 'Puerto Rico', 'San Juan', 0),
(183, 'PS', 'Palestinian Territory', 'East Jerusalem', 0),
(184, 'PT', 'Portugal', 'Lisbon', 0),
(185, 'PW', 'Palau', 'Koror', 0),
(186, 'PY', 'Paraguay', 'AsunciÃ³n', 0),
(187, 'QA', 'Qatar', 'Doha', 0),
(188, 'RE', 'Reunion', 'Saint-Denis', 0),
(189, 'RO', 'Romania', 'Bucharest', 0),
(190, 'RS', 'Serbia', 'Belgrade', 0),
(191, 'RU', 'Russia', 'Moscow', 0),
(192, 'RW', 'Rwanda', 'Kigali', 0),
(193, 'SA', 'Saudi Arabia', 'Riyadh', 0),
(194, 'SB', 'Solomon Islands', 'Honiara', 0),
(195, 'SC', 'Seychelles', 'Victoria', 0),
(196, 'SD', 'Sudan', 'Khartoum', 0),
(197, 'SE', 'Sweden', 'Stockholm', 0),
(198, 'SG', 'Singapore', 'Singapur', 0),
(199, 'SH', 'Saint Helena', 'Jamestown', 0),
(200, 'SI', 'Slovenia', 'Ljubljana', 0),
(201, 'SJ', 'Svalbard and Jan Mayen', 'Longyearbyen', 0),
(202, 'SK', 'Slovakia', 'Bratislava', 0),
(203, 'SL', 'Sierra Leone', 'Freetown', 0),
(204, 'SM', 'San Marino', 'San Marino', 0),
(205, 'SN', 'Senegal', 'Dakar', 0),
(206, 'SO', 'Somalia', 'Mogadishu', 0),
(207, 'SR', 'Suriname', 'Paramaribo', 0),
(208, 'ST', 'Sao Tome and Principe', 'SÃ£o TomÃ©', 0),
(209, 'SV', 'El Salvador', 'San Salvador', 0),
(210, 'SY', 'Syria', 'Damascus', 0),
(211, 'SZ', 'Swaziland', 'Mbabane', 0),
(212, 'TC', 'Turks and Caicos Islands', 'Cockburn Town', 0),
(213, 'TD', 'Chad', 'N''Djamena', 0),
(214, 'TF', 'French Southern Territories', 'Martin-de-ViviÃ¨s', 0),
(215, 'TG', 'Togo', 'LomÃ©', 0),
(216, 'TH', 'Thailand', 'Bangkok', 0),
(217, 'TJ', 'Tajikistan', 'Dushanbe', 0),
(218, 'TK', 'Tokelau', '', 0),
(219, 'TL', 'East Timor', 'Dili', 0),
(220, 'TM', 'Turkmenistan', 'Ashgabat', 0),
(221, 'TN', 'Tunisia', 'Tunis', 0),
(222, 'TO', 'Tonga', 'Nuku''alofa', 0),
(223, 'TR', 'Turkey', 'Ankara', 0),
(224, 'TT', 'Trinidad and Tobago', 'Port of Spain', 0),
(225, 'TV', 'Tuvalu', 'Vaiaku', 0),
(226, 'TW', 'Taiwan', 'Taipei', 0),
(227, 'TZ', 'Tanzania', 'Dar es Salaam', 0),
(228, 'UA', 'Ukraine', 'Kiev', 0),
(229, 'UG', 'Uganda', 'Kampala', 0),
(230, 'UM', 'United States Minor Outlying Islands', '', 0),
(231, 'US', 'United States', 'Washington', 0),
(232, 'UY', 'Uruguay', 'Montevideo', 0),
(233, 'UZ', 'Uzbekistan', 'Tashkent', 0),
(234, 'VA', 'Vatican', 'Vatican City', 0),
(235, 'VC', 'Saint Vincent and the Grenadines', 'Kingstown', 0),
(236, 'VE', 'Venezuela', 'Caracas', 0),
(237, 'VG', 'British Virgin Islands', 'Road Town', 0),
(238, 'VI', 'U.S. Virgin Islands', 'Charlotte Amalie', 0),
(239, 'VN', 'Vietnam', 'Hanoi', 0),
(240, 'VU', 'Vanuatu', 'Port Vila', 0),
(241, 'WF', 'Wallis and Futuna', 'MatÃ¢''Utu', 0),
(242, 'WS', 'Samoa', 'Apia', 0),
(243, 'YE', 'Yemen', 'Sanâ€˜aâ€™', 0),
(244, 'YT', 'Mayotte', 'Mamoudzou', 0),
(245, 'ZA', 'South Africa', 'Pretoria', 0),
(246, 'ZM', 'Zambia', 'Lusaka', 0),
(247, 'ZW', 'Zimbabwe', 'Harare', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feed`
--

CREATE TABLE IF NOT EXISTS `feed` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `feed_name` varchar(255) default NULL,
  `feed_url` varchar(255) default NULL,
  `feed_cache` text,
  `feed_active` tinyint(4) default '1',
  `feed_update` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `feed`
--

INSERT INTO `feed` (`id`, `feed_name`, `feed_url`, `feed_cache`, `feed_active`, `feed_update`) VALUES
(7, 'Central Electoral - CNNExpansión', 'http://cnnexpansion.mediotiempo.com/centralelectoral/?feed=rss', NULL, 1, 1253143333),
(6, 'Reforma', 'http://www.reforma.com/rss/nacional.xml', NULL, 1, 1253143332),
(5, 'El Universal -  Elecciones 2009', 'http://www.eluniversal.com.mx/rss/elecciones2009.xml', NULL, 1, 1253143331);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feed_item`
--

CREATE TABLE IF NOT EXISTS `feed_item` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `feed_id` int(11) NOT NULL,
  `location_id` bigint(20) default NULL,
  `item_title` varchar(255) default NULL,
  `item_description` text,
  `item_link` varchar(255) default NULL,
  `item_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `feed_item`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `form`
--

CREATE TABLE IF NOT EXISTS `form` (
  `id` int(11) NOT NULL auto_increment,
  `form_title` varchar(200) NOT NULL,
  `form_description` text,
  `form_active` tinyint(4) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `form`
--

INSERT INTO `form` (`id`, `form_title`, `form_description`, `form_active`) VALUES
(1, 'Default Form', 'Default form, for report entry', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `form_field`
--

CREATE TABLE IF NOT EXISTS `form_field` (
  `id` int(11) NOT NULL auto_increment,
  `form_id` int(11) NOT NULL default '0',
  `field_name` varchar(200) default NULL,
  `field_type` tinyint(4) NOT NULL default '1' COMMENT '1 - TEXTFIELD, 2 - TEXTAREA (FREETEXT), 3 - DATE, 4 - PASSWORD, 5 - RADIO, 6 - CHECKBOX',
  `field_required` tinyint(4) default '0',
  `field_options` text,
  `field_position` tinyint(4) NOT NULL default '0',
  `field_default` varchar(200) default NULL,
  `field_maxlength` int(11) NOT NULL default '0',
  `field_width` smallint(6) NOT NULL default '0',
  `field_height` tinyint(4) default '5',
  `field_isdate` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `fk_form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `form_field`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `form_response`
--

CREATE TABLE IF NOT EXISTS `form_response` (
  `id` bigint(20) NOT NULL auto_increment,
  `form_field_id` int(11) NOT NULL,
  `incident_id` bigint(20) NOT NULL,
  `form_response` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_form_field_id` (`form_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `form_response`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idp`
--

CREATE TABLE IF NOT EXISTS `idp` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` bigint(20) NOT NULL,
  `verified_id` bigint(20) default NULL,
  `idp_idnumber` varchar(100) default NULL,
  `idp_orig_idnumber` varchar(100) default NULL,
  `idp_fname` varchar(50) default NULL,
  `idp_lname` varchar(50) default NULL,
  `idp_email` varchar(100) default NULL,
  `idp_phone` varchar(50) default NULL,
  `current_location_id` bigint(20) default NULL,
  `displacedfrom_location_id` bigint(20) default NULL,
  `movedto_location_id` bigint(20) default NULL,
  `idp_move_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `idp`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incident`
--

CREATE TABLE IF NOT EXISTS `incident` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `location_id` bigint(20) NOT NULL,
  `form_id` int(11) NOT NULL default '1',
  `locale` varchar(10) NOT NULL default 'en_US',
  `user_id` bigint(20) default NULL,
  `incident_title` varchar(255) default NULL,
  `incident_description` longtext,
  `incident_date` datetime default NULL,
  `incident_mode` tinyint(4) NOT NULL default '1' COMMENT '1 - WEB, 2 - SMS, 3 - EMAIL, 4 - TWITTER',
  `incident_active` tinyint(4) NOT NULL default '0',
  `incident_verified` tinyint(4) NOT NULL default '0',
  `incident_source` varchar(5) default NULL,
  `incident_information` varchar(5) default NULL,
  `incident_rating` varchar(15) NOT NULL default '0',
  `incident_dateadd` datetime default NULL,
  `incident_dateadd_gmt` datetime default NULL,
  `incident_datemodify` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `incident`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incident_category`
--

CREATE TABLE IF NOT EXISTS `incident_category` (
  `id` int(11) NOT NULL auto_increment,
  `incident_id` bigint(20) NOT NULL default '0',
  `category_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `incident_category`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incident_lang`
--

CREATE TABLE IF NOT EXISTS `incident_lang` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` bigint(20) NOT NULL,
  `locale` varchar(10) default NULL,
  `incident_title` varchar(255) default NULL,
  `incident_description` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `incident_lang`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incident_person`
--

CREATE TABLE IF NOT EXISTS `incident_person` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` bigint(20) default NULL,
  `location_id` bigint(20) default NULL,
  `person_first` varchar(200) default NULL,
  `person_last` varchar(200) default NULL,
  `person_email` varchar(120) default NULL,
  `person_phone` varchar(60) default NULL,
  `person_ip` varchar(50) default NULL,
  `person_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `incident_person`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laconica`
--

CREATE TABLE IF NOT EXISTS `laconica` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` int(11) default '0',
  `laconica_mesg_from` varchar(100) default NULL,
  `laconica_mesg_to` varchar(100) default NULL,
  `laconica_mesg_link` varchar(100) default NULL,
  `laconica_mesg` varchar(255) default NULL,
  `laconica_mesg_type` tinyint(4) default '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin)',
  `laconica_mesg_date` datetime default NULL,
  `hide` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `laconica`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `level_title` varchar(200) default NULL,
  `level_description` varchar(200) default NULL,
  `level_weight` tinyint(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `level`
--

INSERT INTO `level` (`id`, `level_title`, `level_description`, `level_weight`) VALUES
(1, 'SPAM + Delete', 'SPAM + Delete', -2),
(2, 'SPAM', 'SPAM', -1),
(3, 'Untrusted', 'Untrusted', 0),
(4, 'Trusted', 'Trusted', 1),
(5, 'Trusted + Verifiy', 'Trusted + Verify', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `location_name` varchar(255) default NULL,
  `country_id` int(11) default NULL,
  `latitude` double NOT NULL default '0',
  `longitude` double NOT NULL default '0',
  `location_visible` tinyint(4) NOT NULL default '1',
  `location_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=429 ;

--
-- Volcar la base de datos para la tabla `location`
--

INSERT INTO `location` (`id`, `location_name`, `country_id`, `latitude`, `longitude`, `location_visible`, `location_date`) VALUES
(9, 'Cuernavaca', 157, 18.967051, -99.236456, 1, '2009-06-02 18:12:36'),
(10, 'Veracruz', 157, 19.184141, -96.129328, 1, '2009-06-02 18:29:51'),
(11, 'Miahuatlan', 157, 16.320539, -96.596764, 1, '2009-06-09 06:38:39'),
(12, 'Poanas', 157, 25.502692, -103.045054, 1, '2009-06-02 20:21:50'),
(13, 'Queretaro', 157, 20.58316, -100.387398, 1, '2009-06-03 00:52:03'),
(14, 'Ecatepec', 157, 19.609722, -99.06, 1, '2009-06-03 22:19:19'),
(15, 'Silao', 157, 20.943603, -101.426328, 1, '2009-06-03 22:23:14'),
(18, 'Saltillo', 157, 25.436979, -100.994335, 1, '2009-06-07 02:44:28'),
(19, 'frontera. coahuila', 3, 29.13297, -100.770721, 1, '2009-06-07 02:42:53'),
(20, 'Saltillo', NULL, 25.416667, -101, 1, '2009-06-05 02:49:05'),
(21, 'apizaco', 157, 19.415828, -98.140175, 1, '2009-06-07 02:48:05'),
(22, 'apodaca', 157, 25.80066, -100.192739, 1, '2009-06-07 03:44:02'),
(23, 'Aguascalientes', 157, 21.881191, -102.296144, 1, '2009-06-08 20:44:16'),
(24, 'Mazunte', 157, 15.66485, -96.55388, 1, '2009-06-08 20:51:28'),
(25, 'Altamira', 157, 22.396005, -97.93684, 1, '2009-06-08 20:54:21'),
(26, 'Zacapu, Michoacán', 157, 19.811614, -101.793796, 1, '2009-06-09 16:17:38'),
(27, 'Benito Juárez, Distrito Federal', 157, 19.401667, -99.158333, 1, '2009-06-10 08:56:06'),
(28, 'Aguascalientes', 157, 21.881191, -102.296144, 1, '2009-06-10 00:57:32'),
(29, 'Ciudad Serdán, Puebla', 157, 18.988889, -97.446667, 1, '2009-06-10 01:01:48'),
(30, 'Ojinaga, Chihuahua', 157, 29.554104, -104.414366, 1, '2009-06-11 22:23:37'),
(31, 'Cholula, Puebla', 157, 19.05698, -98.301201, 1, '2009-06-11 22:49:11'),
(33, 'morelia, michoacan', 157, 19.702806, -101.18579, 1, '2009-06-12 04:38:44'),
(34, 'campos, manzanillo, colima', 157, 19.024867, -104.31516, 1, '2009-06-12 23:53:50'),
(35, 'Aguascalientes', 157, 21.881191, -102.296144, 1, '2009-06-13 23:38:53'),
(36, 'Tepetlixpa', 157, 19.025833, -98.820556, 1, '2009-06-16 19:56:22'),
(37, 'México', NULL, 23.634501, -102.552784, 1, '2009-06-16 22:53:17'),
(38, 'El Salto, Jalisco', 157, 20.518909, -103.178212, 1, '2009-06-16 23:06:57'),
(40, 'veracruz', 157, 19.184141, -96.129328, 1, '2009-06-17 17:37:49'),
(41, 'Monterrey', 3, 25.666667, -100.316667, 1, '2009-06-17 18:16:09'),
(43, 'Tequila, Jalisco', 157, 20.888366, -103.835255, 1, '2009-06-18 02:07:07'),
(59, 'Tuxtla Gutiérrez, Chiapas', 157, 16.752778, -93.116667, 1, '2009-06-19 22:07:19'),
(60, 'Pichucalco, Chiapas', 157, 17.508611, -93.118333, 1, '2009-06-19 22:08:09'),
(61, 'Tila', NULL, 17.298199, -92.430725, 1, '2009-06-19 22:00:22'),
(62, 'Tuxtla Gutiérrez, Chiapas', 157, 16.752778, -93.116667, 1, '2009-06-19 22:09:48'),
(63, 'Río Grande, Zacatecas', 157, 23.829708, -103.033363, 1, '2009-06-19 23:27:41'),
(64, 'Tapachula, Chiapas', 157, 14.90675, -92.260681, 1, '2009-06-20 18:11:02'),
(66, 'Ocosingo, Chiapas', 157, 16.907222, -92.096111, 1, '2009-06-20 18:12:12'),
(67, 'Tapachula', 3, 14.9, -92.283333, 1, '2009-07-05 14:31:37'),
(68, 'Tuxpan, Jalisco', 157, 19.554543, -103.376567, 1, '2009-06-20 18:15:55'),
(69, 'Huajapan de León, Oaxaca', 157, 17.820608, -97.772827, 1, '2009-06-21 21:13:44'),
(70, 'Gustavo A. Madero, Distrito Federal', 157, 19.482222, -99.1125, 1, '2009-06-21 21:14:41'),
(71, 'Tuxpan, Veracruz', 3, 20.930659, -97.382812, 1, '2009-06-22 05:23:40'),
(72, 'Acapulco, Guerrero', 157, 16.863611, -99.8825, 1, '2009-06-22 18:29:09'),
(73, 'Suchiate, Chiapas', 3, 14.624116, -92.232971, 1, '2009-06-23 18:58:37'),
(74, 'Tapachula, Chiapas', 157, 14.90675, -92.260681, 1, '2009-06-23 19:27:02'),
(75, 'Tapachula, Chiapas', 157, 14.90675, -92.260681, 1, '2009-06-23 19:26:17'),
(76, 'Tapachula', 157, 14.90675, -92.260681, 1, '2009-06-23 04:16:01'),
(77, 'Tuxtla Gutiérrez', 157, 16.752778, -93.116667, 1, '2009-06-23 21:09:03'),
(78, 'tuxtla, chiapas', 157, 16.752778, -93.116667, 1, '2009-06-23 21:50:13'),
(79, 'Distrito Federal, Venustiano Carranza', 157, 19.409595, -99.118109, 1, '2009-06-24 03:08:02'),
(80, 'milpa alta', 157, 19.192222, -99.023056, 1, '2009-06-25 18:45:26'),
(81, 'Ciudad de México', NULL, 19.357915, -99.286752, 1, '2009-06-24 03:02:33'),
(82, 'Matamoros, Tamaulipas', 157, 25.86117, -97.50219, 1, '2009-06-24 16:48:30'),
(83, 'Juanacatlán, Jalisco', 157, 20.509234, -103.171046, 1, '2009-06-24 17:20:26'),
(84, 'Tlalpan, Distrito Federal', 157, 19.308333, -99.225, 1, '2009-06-24 17:21:25'),
(85, 'Villahermosa', 3, 17.983333, -92.916667, 1, '2009-06-24 23:25:35'),
(86, 'Villahermosa', NULL, 17.983333, -92.916667, 1, '2009-06-24 22:58:22'),
(87, 'Villahermosa', 157, 17.989167, -92.928056, 1, '2009-06-25 00:32:12'),
(88, 'Villahermosa', 157, 17.989167, -92.928056, 1, '2009-06-26 03:16:43'),
(89, 'Villahermosa', NULL, 17.983333, -92.916667, 1, '2009-06-24 23:23:49'),
(90, 'Villahermosa', 157, 17.989167, -92.928056, 1, '2009-06-25 00:22:20'),
(91, 'Villahermosa', 3, 17.983333, -92.916667, 1, '2009-06-25 00:32:54'),
(92, 'México, D. F.', NULL, 23.634501, -102.552784, 1, '2009-06-25 04:02:55'),
(93, 'Campeche', 157, 19.840483, -90.536536, 1, '2009-06-25 08:51:16'),
(94, 'Campeche', NULL, 19.85, -90.533333, 1, '2009-06-25 05:01:23'),
(95, 'Campeche', NULL, 19.85, -90.533333, 1, '2009-06-25 05:06:34'),
(96, 'Guaymas', NULL, 27.933333, -110.9, 1, '2009-06-25 05:14:20'),
(97, 'Miguel Hidalgo, Distrito Federal', 157, 19.447979, -99.205341, 1, '2009-06-26 04:07:26'),
(98, 'Guadalajara', NULL, 20.711804, -103.974609, 1, '2009-06-26 03:16:11'),
(99, 'Monclova, Coahuila', 157, 26.915796, -101.4271, 1, '2009-06-26 04:08:19'),
(100, 'San Martin Hidalgo, Jalisco', 157, 20.435119, -103.926404, 1, '2009-06-26 18:50:47'),
(101, 'Naucalpan', NULL, 27.075635, -109.446487, 1, '2009-06-26 18:49:34'),
(102, 'Querétaro, Querétaro', 157, 20.58316, -100.387398, 1, '2009-06-27 00:18:49'),
(103, 'Acambay', 157, 19.953889, -99.843056, 1, '2009-06-27 00:00:05'),
(104, 'U.H.LLANO DE LOS BAEZ', NULL, 23.634501, -102.552784, 1, '2009-06-27 01:52:35'),
(105, 'U.H.LLANO DE LOS BAEZ, Ecatepec', 157, 19.603639, -99.020242, 1, '2009-06-27 02:25:24'),
(106, 'Chetumal', NULL, 18.5, -88.3, 1, '2009-06-27 19:18:00'),
(107, 'Uriangato, Guanajuato', 157, 20.140612, -101.180918, 1, '2009-06-27 23:52:46'),
(108, 'uriangato', 3, 23.634501, -102.552784, 1, '2009-07-02 01:38:17'),
(109, 'San Luis Potosí', 157, 22.15, -100.983333, 1, '2009-06-27 23:54:09'),
(110, 'Toluca, Estado de México', 157, 19.287867, -99.646761, 1, '2009-06-28 01:25:46'),
(111, 'Querétaro', 3, 20.6, -100.383333, 1, '2009-07-02 01:42:00'),
(112, 'Unidad San Jorge, Puebla, Puebla', 157, 18.984383, -98.2164, 1, '2009-06-30 03:16:36'),
(113, 'San Gabriel Jalisco', NULL, 19.746024, -103.771362, 1, '2009-06-30 16:46:29'),
(114, 'Xicotepec de Juarez, Puebla', 157, 20.275357, -97.958901, 1, '2009-07-01 17:46:58'),
(115, 'Xicotepec de Juarez', NULL, 20.276207, -97.958393, 1, '2009-07-01 16:30:23'),
(116, 'Huauchinango, Puebla', NULL, 20.175051, -98.054695, 1, '2009-07-01 16:41:53'),
(117, 'Villa de Allende, Estado de México', 157, 19.402921, -100.147918, 1, '2009-07-01 22:12:30'),
(118, 'Bahia de Banderas, Jalisco', 157, 20.829689, -105.266293, 1, '2009-07-01 20:48:16'),
(119, 'Tecamac, Estado de México', 157, 19.705351, -98.961853, 1, '2009-07-01 20:59:30'),
(120, 'Huixquilucan, Estado de México', 157, 19.399048, -99.345112, 1, '2009-07-02 03:12:47'),
(121, 'Miguel Hidalgo, Distrito Federal', 157, 19.406373, -99.191437, 1, '2009-07-02 02:57:24'),
(122, 'Melchor Ocampo, Estado de México', 157, 19.710125, -99.140081, 1, '2009-07-02 03:06:55'),
(123, 'San Rafael, Querétaro', 157, 20.453135, -100.39745, 1, '2009-07-02 03:33:58'),
(124, 'Querétaro', 157, 20.6, -100.383333, 1, '2009-07-02 20:32:17'),
(125, 'Tepic ,Nayarit', 157, 21.50854, -104.893123, 1, '2009-07-02 03:48:07'),
(126, 'BAHIA DE BANDERAS, Jalisco', 157, 20.829689, -105.266293, 1, '2009-07-02 04:01:11'),
(127, 'Salvatierra, Guanajuato', 157, 20.213238, -100.874575, 1, '2009-07-02 06:59:56'),
(128, 'Cocula, Jalisco', 157, 20.370545, -103.825508, 1, '2009-07-02 08:42:20'),
(129, 'San Miguel de Allende, Guanajuato', 157, 20.915034, -100.744241, 1, '2009-07-02 09:07:24'),
(130, 'Camargo , chihuahua', 157, 28.085461, -104.47233, 1, '2009-07-02 20:31:42'),
(131, 'Mexico City', NULL, 19.434167, -99.138611, 1, '2009-07-02 17:29:41'),
(132, 'Tamazunchale, San Luis Potosí', 157, 21.259341, -98.78816, 1, '2009-07-03 21:17:43'),
(133, 'Tetlatlahuca, Tlaxcala', 157, 19.233496, -98.294946, 1, '2009-07-02 22:22:58'),
(134, 'COXCATLAN, San Luis Potosí', 157, 21.541326, -98.905919, 1, '2009-07-04 00:43:17'),
(135, 'Mexico City', NULL, 19.434167, -99.138611, 1, '2009-07-02 22:59:51'),
(136, 'Hermosillo, Sonora', 157, 29.097659, -110.948833, 1, '2009-07-03 00:15:53'),
(137, 'Nogales, Sonora', 3, 23.634501, -102.552784, 1, '2009-07-03 21:16:41'),
(138, 'San Gabriel Jalisco', NULL, 19.746024, -103.765869, 1, '2009-07-03 01:30:01'),
(139, 'Naucalpan, Estado de México', 157, 19.478508, -99.239631, 1, '2009-07-03 16:41:23'),
(140, 'Coacalco, Estado de México', 157, 19.63562, -99.095467, 1, '2009-07-04 00:44:40'),
(141, 'Ébano, San Luis Potosí', 157, 22.210833, -98.374167, 1, '2009-07-03 18:22:11'),
(142, 'Nezahualcóyotl, Estado de México', 157, 19.403534, -99.023944, 1, '2009-07-03 22:55:25'),
(143, 'Jilotlan de los Dolores, Jal.', 157, 19.370284, -103.018734, 1, '2009-07-04 00:41:05'),
(144, 'Tlajomulco De Zuñiga, Jalisco Mexico', 157, 20.472801, -103.446868, 1, '2009-07-04 00:39:19'),
(145, 'Villa de Ayala, Morelos', 157, 18.922247, -99.246414, 1, '2009-07-04 01:37:55'),
(146, 'Miguel Hidalgo, Distrito Federal', 157, 19.400321, -99.170413, 1, '2009-07-04 02:59:56'),
(147, 'Alvaro Obregón, Distrito Federal', 157, 19.400321, -99.170413, 1, '2009-07-04 18:21:47'),
(148, 'Miguel Hidalgo, Distrito Federal', 157, 19.400321, -99.170413, 1, '2009-07-04 18:18:23'),
(149, 'Martinez de la Torre', NULL, 20.067541, -97.055969, 1, '2009-07-04 12:00:56'),
(150, 'Saltillo, Coahuila', 157, 25.436979, -100.994335, 1, '2009-07-04 15:00:04'),
(154, 'Colima, Colima', 157, 19.243378, -103.722408, 1, '2009-07-04 15:02:38'),
(155, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-04 14:13:08'),
(156, 'Cuernavaca, Morelos', 157, 18.967051, -99.236456, 1, '2009-07-04 14:10:22'),
(157, 'Durango, Durango', 157, 24.019414, -104.667749, 1, '2009-07-04 14:12:21'),
(158, 'Aguascalientes,  Aguascalientes', 157, 21.881191, -102.296144, 1, '2009-07-04 14:13:53'),
(159, 'Cuautitlán Izcalli, Estado de México', 157, 19.646111, -99.211389, 1, '2009-07-04 14:52:50'),
(160, 'Distrito Federal', 157, 19.24647, -99.10135, 1, '2009-07-04 18:13:02'),
(161, 'Querétaro', 157, 23.634501, -102.552784, 1, '2009-07-04 18:13:40'),
(162, 'Cuautitlan Izcalli, Estado de Mexico', 157, 19.646111, -99.211389, 1, '2009-07-04 17:22:42'),
(163, 'Miguel Hidalgo, Distrito Federal', 157, 19.400321, -99.170413, 1, '2009-07-04 18:12:08'),
(164, 'Zapotal, Tampico, Tamaulipas', 157, 22.257087, -97.860975, 1, '2009-07-04 17:52:35'),
(165, 'Hermosillo, Sonora', 157, 29.099677, -110.94183, 1, '2009-07-04 17:54:48'),
(166, 'Distrito Federal', 157, 19.24647, -99.10135, 1, '2009-07-04 18:15:17'),
(167, 'Córdoba, Veracruz', 157, 18.89006, -96.923103, 1, '2009-07-04 18:18:26'),
(168, 'Zacatecas, Zacatecas', 157, 22.771718, -102.575416, 1, '2009-07-04 18:41:46'),
(169, 'Distrito Federal', 157, 19.24647, -99.10135, 1, '2009-07-04 18:43:27'),
(170, 'Mérida, Yucatán', 157, 20.975198, -89.619706, 1, '2009-07-04 21:14:02'),
(171, 'Mérida, Yucatán', 157, 20.975198, -89.619706, 1, '2009-07-04 21:14:58'),
(172, 'San Miguel de Allende, Guanajuato', 157, 20.915034, -100.744241, 1, '2009-07-04 21:15:40'),
(173, 'Soteapan, Veracruz', 157, 18.232425, -94.873025, 1, '2009-07-04 21:17:50'),
(174, 'Chemax, Yucatán', 3, 23.634501, -102.552784, 1, '2009-07-04 21:16:47'),
(175, 'Distrito Federal', 157, 19.24647, -99.10135, 1, '2009-07-04 21:19:07'),
(176, 'Naucalpan, Estado de México', 157, 19.475278, -99.237778, 1, '2009-07-04 21:20:09'),
(177, 'Querétaro, Querétaro', 157, 20.58316, -100.387398, 1, '2009-07-04 21:30:26'),
(178, 'Pachuca, Hidalgo', 157, 20.11968, -98.755127, 1, '2009-07-04 21:31:16'),
(180, 'Mexico City', 3, 19.434167, -99.138611, 1, '2009-07-04 22:37:35'),
(181, 'Toluca', 3, 19.284897, -99.647713, 1, '2009-07-04 22:37:54'),
(182, 'santa maria aztahuacan, iztapalapa', 157, 19.35, -99.05, 1, '2009-07-05 14:28:59'),
(183, 'APASEO EL ALTO', 3, 23.634501, -102.552784, 1, '2009-07-04 23:04:53'),
(184, 'alvaro obregon, Distrito Federal', 157, 19.4, -99.2, 1, '2009-07-05 09:17:32'),
(185, 'Cuernavaca y DF', 3, 23.634501, -102.552784, 1, '2009-07-05 00:01:43'),
(187, 'campeche', 157, 19.840483, -90.536536, 1, '2009-07-05 00:43:22'),
(188, 'Tapachula', 157, 14.9, -92.283333, 1, '2009-07-05 01:09:34'),
(189, 'Suchitlan, Colima', 157, 19.374612, -103.716057, 1, '2009-07-05 01:08:00'),
(190, 'Torreón', NULL, 25.55, -103.433333, 1, '2009-07-05 01:02:50'),
(191, 'Naucalpan, Estado de México', 157, 19.475278, -99.237778, 1, '2009-07-05 08:33:16'),
(192, 'ATITALAQUIA, HIDALGO', 157, 20.059645, -99.22172, 1, '2009-07-05 08:34:04'),
(193, 'Visitacion Melchor Ocampo', 157, 19.71687, -99.135052, 1, '2009-07-05 01:54:39'),
(194, 'Hermosillo, Sonora', 157, 29.097659, -110.948833, 1, '2009-07-05 08:50:08'),
(195, 'VISITACION MELCHOR OCAMPO, Estado de México', 157, 19.71687, -99.135052, 1, '2009-07-05 08:35:11'),
(196, 'Ciudad Obregón, Sonora', 157, 27.493953, -109.930567, 1, '2009-07-05 08:37:34'),
(197, 'Municipo de Nicolas Romero Estado de México', NULL, 23.634501, -102.552784, 1, '2009-07-05 02:06:07'),
(198, 'Monterrey, Nuevo León', 157, 25.67145, -100.308923, 1, '2009-07-05 08:38:01'),
(199, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 08:35:54'),
(200, 'Huauchinango, Puebla', 157, 20.17709, -98.052762, 1, '2009-07-05 08:47:31'),
(201, 'Tlalnepantla, Estado de México', 157, 19.536667, -99.194722, 1, '2009-07-05 09:07:25'),
(202, '1309, Puebla, Puebla', 157, 19.05936, -98.191037, 1, '2009-07-05 09:06:50'),
(203, 'Naucalpan, Estado de México', 157, 19.457893, -99.235811, 1, '2009-07-05 09:14:25'),
(204, 'Calle República Mexicana, San Nicolás de los Garza, Nuevo León', 157, 25.757498, -100.275607, 1, '2009-07-05 09:11:38'),
(205, 'Naucalpan, Estado de México', 157, 19.457123, -99.244689, 1, '2009-07-05 09:21:34'),
(206, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 09:30:00'),
(207, 'Colonia Pedregal de Santo Domingo, Coyoacán, D. F.', 157, 19.330674, -99.165702, 1, '2009-07-05 12:27:35'),
(208, 'San Francisco Totimehuacan', 157, 18.969434, -98.191661, 1, '2009-07-05 10:36:52'),
(209, 'San Gabriel Jalisco', NULL, 20.666667, -103.333333, 1, '2009-07-05 10:09:58'),
(210, 'San Gabriel Jalisco', 3, 20.666667, -103.333333, 1, '2009-07-05 10:15:24'),
(211, '42 SUR ORIENTE Puebla', 157, 18.989429, -98.220145, 1, '2009-07-05 10:26:55'),
(212, 'distrito federal', 3, 19.4343, -99.1856, 1, '2009-07-05 10:36:14'),
(213, 'Tamuin, San Luis Potosí', 157, 22.006944, -98.788611, 1, '2009-07-05 10:35:50'),
(214, 'Jardines de Santa Mónica, Tlanepantla, Estado de México', 157, 19.528354, -99.230888, 1, '2009-07-05 10:36:06'),
(215, 'Guadalajara, Jalisco', 157, 20.676631, -103.34616, 1, '2009-07-05 10:40:00'),
(216, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 10:47:40'),
(217, 'GUSTAVO A MADERO, Cuauhtepec', 157, 19.525216, -99.142104, 1, '2009-07-05 11:21:38'),
(218, 'Lagos de moreno', NULL, 23.634501, -102.552784, 1, '2009-07-05 10:58:59'),
(219, 'Cholula Puebla', 157, 19.05698, -98.301201, 1, '2009-07-05 11:02:35'),
(220, 'Monterrey', 3, 25.666667, -100.316667, 1, '2009-07-05 11:03:38'),
(221, 'Santiago Comaltepec, oaxaca', 157, 17.566853, -96.54843, 1, '2009-07-05 11:03:21'),
(222, 'San Nicolas Totolapan', 157, 19.295301, -99.233765, 1, '2009-07-05 11:12:15'),
(223, 'Calle Monte Casino # 40 DF', 157, 19.422416, -99.202979, 1, '2009-07-05 11:11:12'),
(224, 'Coyoacan', 157, 19.361453, -99.170499, 1, '2009-07-05 11:14:32'),
(225, 'durango', 157, 24.019414, -104.667749, 1, '2009-07-05 11:15:22'),
(226, 'queretaro', 157, 20.58316, -100.387398, 1, '2009-07-05 11:18:03'),
(227, 'AVENIDA MIGUEL OTHON DE MENDIZABAL # 118 DF', 157, 19.506238, -99.148545, 1, '2009-07-05 11:45:16'),
(228, 'Coacalco', 157, 19.63562, -99.095467, 1, '2009-07-05 11:32:38'),
(229, 'Ciudad Obregón, Sonora', 157, 27.493953, -109.930567, 1, '2009-07-05 11:40:00'),
(230, 'Tamazunchale', 157, 21.259341, -98.78816, 1, '2009-07-05 11:40:53'),
(231, 'cuajimalpa, distrito federal', 157, 19.400321, -99.170413, 1, '2009-07-05 11:41:25'),
(232, 'Boulevard Valsequillo, Puebla, Puebla', 157, 19.003543, -98.205699, 1, '2009-07-05 11:42:25'),
(233, 'Distrito Federal', 157, 19.24647, -99.10135, 1, '2009-07-05 11:44:29'),
(234, 'Av Muñoz, San Luis Potosí, San Luis Potosí', 157, 22.160196, -101.000342, 1, '2009-07-05 11:48:22'),
(235, 'Zapopan', 157, 20.720227, -103.391928, 1, '2009-07-05 11:49:21'),
(236, 'Calle Puete de San Miguel Canoa, Puebla, Puebla', 157, 19.066014, -98.160473, 1, '2009-07-05 11:46:43'),
(237, 'Toltepec, Puebla', 157, 18.221769, -97.860893, 1, '2009-07-05 14:28:04'),
(238, 'Monterrey', 157, 25.67145, -100.308923, 1, '2009-07-05 11:54:36'),
(239, 'Tlalpan, DF', 157, 19.308333, -99.225, 1, '2009-07-05 11:58:13'),
(240, 'CALLE HUEMAN, San Luis Potosi', 157, 22.174008, -101.000529, 1, '2009-07-05 12:28:49'),
(241, 'Benito Juarez, Mexico City', 157, 19.401667, -99.158333, 1, '2009-07-05 11:58:52'),
(242, 'Cuautitlan Izcalli, Estado de Mexico', 157, 19.646111, -99.211389, 1, '2009-07-05 11:59:59'),
(243, 'Boulevard Circunvalación, Puebla, Puebla', 157, 19.006679, -98.201069, 1, '2009-07-05 11:59:22'),
(244, 'Boulvard Veinte Sur, Puebla, Puebla', 157, 19.021812, -98.1947, 1, '2009-07-05 12:02:36'),
(245, 'BAHIA DE BANDERAS, NAYARIT', 157, 20.829689, -105.266293, 1, '2009-07-05 12:05:21'),
(246, 'Cuautitlán Izcalli', 157, 19.646111, -99.211389, 1, '2009-07-05 12:15:03'),
(247, 'Mexico', 157, 19.496873, -99.723267, 1, '2009-07-05 12:17:09'),
(248, 'San Juan de Aragón, Gustavo A. Madero, Distrito Federal', 157, 19.461191, -99.081248, 1, '2009-07-05 12:20:17'),
(249, 'Azcapotzalco, Distrito Federal', 157, 19.482769, -99.183352, 1, '2009-07-05 12:21:07'),
(250, 'Boulevard de los Guerreros, Ecatepec de Morelos, Estado de México', 157, 19.530897, -99.021579, 1, '2009-07-05 12:22:37'),
(252, 'Boulevard Violetas, Coacalco, Estado de México', 157, 19.656718, -99.093002, 1, '2009-07-05 12:26:42'),
(253, 'Coyoacán, Distrito Federal', 157, 19.35, -99.161667, 1, '2009-07-05 12:24:50'),
(254, 'Emerson, Miguel Hidalgo, DF', 157, 19.433489, -99.188818, 1, '2009-07-05 12:27:47'),
(255, 'Miguel Hidalgo, Distrito Federal', 157, 19.400321, -99.170413, 1, '2009-07-05 12:27:49'),
(256, 'Miguel Hidalgo, Distrito Federal', 157, 19.434167, -99.138611, 1, '2009-07-05 12:29:26'),
(257, 'Calle Saturno, León, Guanajuato', 157, 21.132759, -101.650069, 1, '2009-07-05 12:31:10'),
(258, 'Ecatepec, Estado de México', 157, 19.609722, -99.06, 1, '2009-07-05 12:32:00'),
(259, 'Distrito Federal', 157, 19.24647, -99.10135, 1, '2009-07-05 12:33:40'),
(260, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 12:38:15'),
(261, 'Colonia Cuatro Árboles, Venustiano Carranza, Distrito Federal', 157, 19.415089, -99.085026, 1, '2009-07-05 12:37:15'),
(262, 'Sonora', 3, 23.634501, -102.552784, 1, '2009-07-05 14:26:49'),
(263, 'Naucalpan', NULL, 19.478508, -99.239631, 1, '2009-07-05 12:41:40'),
(264, 'Colonia Torre Blanca, Miguel Hidlago, Distrito Federal', 157, 19.457184, -99.196078, 1, '2009-07-05 12:48:40'),
(265, 'Tepic, Nayarit', 157, 21.50854, -104.893123, 1, '2009-07-05 12:49:19'),
(266, 'Querétaro, Querétaro', 157, 20.58316, -100.387398, 1, '2009-07-05 13:17:31'),
(267, 'Monterrey,NL', 157, 25.67145, -100.308923, 1, '2009-07-05 12:52:46'),
(268, 'Colonia Anzures, Miguel Hidalgo, Distrito Federal', 157, 19.431975, -99.177001, 1, '2009-07-05 12:56:40'),
(269, 'Avenida Minas Palacio, Naucalpan, Estado de México', 157, 19.455934, -99.259969, 1, '2009-07-05 13:01:45'),
(270, 'Hermosillo, Sonora', 157, 29.097659, -110.948833, 1, '2009-07-05 13:04:10'),
(271, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 13:04:50'),
(272, 'Calle Playa Roqueta, Distrito Federal', 157, 19.383527, -99.1282, 1, '2009-07-05 13:08:27'),
(273, 'Izucar, Puebla', 157, 18.602443, -98.470504, 1, '2009-07-05 13:07:06'),
(274, 'San Andres Cholula, Puebla', NULL, 19.05, -98.2, 1, '2009-07-05 13:07:21'),
(275, 'Hermosillo, Sonora', 157, 29.097659, -110.948833, 1, '2009-07-05 13:09:32'),
(276, 'Paseo Contador, Cuautitlan Izcalli, Estado de México', 157, 19.640604, -99.201874, 1, '2009-07-05 13:10:58'),
(277, 'Ecatepec de Morelos, Estado de México', 157, 19.609722, -99.06, 1, '2009-07-05 13:15:29'),
(278, 'Calle de San José, Puebla, Puebla', 157, 18.957118, -98.230019, 1, '2009-07-05 13:19:14'),
(279, 'Naucalpan, Estado de México', 157, 19.475278, -99.237778, 1, '2009-07-05 13:22:45'),
(280, 'Tlahuac, Distrito Federal', 157, 19.304167, -99.054167, 1, '2009-07-05 13:21:34'),
(281, 'Colonia Granjas Populares, Ecatepec de Morelos, Estado de México', 157, 19.555086, -99.028673, 1, '2009-07-05 13:24:24'),
(282, 'Naucalpan', 157, 19.475278, -99.237778, 1, '2009-07-05 13:31:29'),
(283, 'Calle de las Colinas de San Mateo, Naucalpan, Estado de México', 157, 19.492667, -99.274441, 1, '2009-07-05 13:26:47'),
(284, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 13:33:21'),
(285, 'Querétaro, Querétaro', 157, 20.58316, -100.387398, 1, '2009-07-05 13:34:06'),
(286, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 13:35:26'),
(287, 'Colonia Churubusco Country Club, Coyoacán, Distrito Federal', 157, 19.351738, -99.141736, 1, '2009-07-05 13:40:54'),
(288, 'Mérida, Yucatán', 157, 20.975198, -89.619706, 1, '2009-07-05 13:37:56'),
(289, 'Calle Venustiano Carranza, Ecatepec, Estado de México', 157, 19.61921, -99.069975, 1, '2009-07-05 13:42:09'),
(290, 'Sayulita, Nayarit', 157, 20.865651, -105.437464, 1, '2009-07-05 15:06:12'),
(291, 'Córdoba, Veracruz', 157, 18.89006, -96.923103, 1, '2009-07-05 13:46:13'),
(292, 'Calle Venustiano Carranza, Ecatepec, Estado de México', 157, 19.61921, -99.069975, 1, '2009-07-05 13:54:35'),
(293, 'San Luis Potosí, San Luis Potosí', 157, 22.149856, -100.975017, 1, '2009-07-05 13:58:53'),
(294, 'Córdoba', NULL, 18.883333, -96.933333, 1, '2009-07-05 13:53:33'),
(295, 'Toluca', NULL, 19.288333, -99.667222, 1, '2009-07-05 13:57:08'),
(296, 'San Luis Potosí', 157, 23.634501, -102.552784, 1, '2009-07-05 14:04:22'),
(297, 'Puebla', 3, 23.634501, -102.552784, 1, '2009-07-05 14:25:24'),
(298, 'Calle 28A, Gustavo A. Madero', 157, 19.527707, -99.150442, 1, '2009-07-05 14:10:09'),
(299, 'Ctra Perote-Xalapa, Xalapa, Veracruz', 157, 19.55758, -96.916628, 1, '2009-07-05 14:12:42'),
(300, 'San Luis del Pino, Puebla', 157, 18.450749, -97.159112, 1, '2009-07-05 14:14:20'),
(301, 'Colima, Colima', 157, 19.243378, -103.722408, 1, '2009-07-05 14:24:17'),
(302, 'Monterrey', NULL, 25.666667, -100.316667, 1, '2009-07-05 14:35:05'),
(303, 'Avenida 28 poniente, Puebla, Puebla', 157, 19.062262, -98.20366, 1, '2009-07-05 14:35:39'),
(304, 'Calle Margaritas, Gustavo A. Madero, Distrito Federal', 157, 19.506206, -99.09176, 1, '2009-07-05 14:43:00'),
(305, 'Santiago Yancuiltalpan, Estado de México', 157, 19.380102, -99.307952, 1, '2009-07-05 14:45:02'),
(306, 'Naucalpan', 157, 19.475278, -99.237778, 1, '2009-07-05 14:48:23'),
(307, 'Mexico City', 157, 19.410636, -99.130588, 1, '2009-07-05 14:50:22'),
(308, 'Cuautitlán Izcalli', NULL, 19.646944, -99.246667, 1, '2009-07-05 14:51:05'),
(309, 'Coyoacán', 157, 19.361453, -99.170499, 1, '2009-07-05 15:04:14'),
(310, 'mexico df', 157, 19.410636, -99.130588, 1, '2009-07-05 14:58:54'),
(311, 'Calle Tekal, Talalpan, Distrito Federal', 157, 19.335223, -99.174765, 1, '2009-07-05 14:59:02'),
(312, 'ecatepec, estado de mexico', 157, 19.609722, -99.06, 1, '2009-07-05 15:02:34'),
(313, 'Puebla', 3, 19.05, -98.2, 1, '2009-07-05 15:04:47'),
(314, 'Ecatepec, Estado de México', 157, 19.609722, -99.06, 1, '2009-07-05 16:39:18'),
(315, 'Chihuahua', NULL, 28.633333, -106.083333, 1, '2009-07-05 15:08:55'),
(316, 'Guadalajara, Jalisco', 157, 20.676631, -103.34616, 1, '2009-07-05 15:19:46'),
(317, 'Nuevo Leon', NULL, 23.634501, -102.552784, 1, '2009-07-05 15:31:05'),
(318, 'San Luis Potosí', 157, 22.15, -100.983333, 1, '2009-07-05 15:58:29'),
(319, 'Naucalpan, Estado de México', 157, 19.475278, -99.237778, 1, '2009-07-05 15:59:37'),
(320, 'Hermosillo', 3, 29.066667, -110.966667, 1, '2009-07-05 15:56:37'),
(321, 'Tijuana, Baja California', 157, 32.534818, -117.043807, 1, '2009-07-05 16:00:31'),
(322, 'Campeche', 157, 19.85, -90.533333, 1, '2009-07-05 15:56:03'),
(323, 'Benito Juárez, Distrito Federal', 157, 19.401667, -99.158333, 1, '2009-07-05 16:01:19'),
(324, 'Córdoba', 157, 18.89006, -96.923103, 1, '2009-07-05 15:55:37'),
(325, 'san Luis Potosi', 157, 22.149856, -100.975017, 1, '2009-07-05 15:54:57'),
(326, 'Mexico Df', NULL, 23.634501, -102.552784, 1, '2009-07-05 15:56:44'),
(327, 'Cancún', 157, 21.160556, -86.8475, 1, '2009-07-05 15:58:55'),
(328, 'colima', 157, 19.243378, -103.722408, 1, '2009-07-05 16:04:07'),
(329, 'Los Remedios, Estado de México', 157, 19.511907, -100.046647, 1, '2009-07-05 16:12:54'),
(330, 'Naucalpan', NULL, 19.478508, -99.239631, 1, '2009-07-05 16:04:22'),
(331, 'Monterrey', NULL, 25.666667, -100.316667, 1, '2009-07-05 16:08:10'),
(332, 'Tecoman, COLIMA', 157, 18.908889, -103.874722, 1, '2009-07-05 16:22:02'),
(333, 'Oaxaca, Oaxaca', 157, 16.88866, -96.328125, 1, '2009-07-05 16:14:33'),
(334, 'Zapopan, Jalisco', 157, 20.720227, -103.391928, 1, '2009-07-05 16:14:02'),
(335, 'Córdoba', 3, 18.883333, -96.933333, 1, '2009-07-05 16:16:05'),
(336, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 16:17:11'),
(337, 'Cancún, Quintana Roo', 157, 21.160556, -86.8475, 1, '2009-07-05 16:20:47'),
(338, 'Tarimorio, Guanajuato', 157, 20.291296, -100.755146, 1, '2009-07-05 16:26:15'),
(339, 'Cuajimalpla, Distrito Federal', 157, 19.400321, -99.170413, 1, '2009-07-05 16:34:44'),
(340, 'Toluca, Estado de México', 157, 19.287867, -99.646761, 1, '2009-07-05 16:40:45'),
(341, 'Monterrey, Nuevo León', 157, 25.67145, -100.308923, 1, '2009-07-05 16:36:10'),
(342, 'Guadalajara, Jalisco', 157, 20.676631, -103.34616, 1, '2009-07-05 16:37:59'),
(343, 'Playa del Carmen, Quintana Roo', 157, 20.6275, -87.081111, 1, '2009-07-05 16:40:16'),
(344, 'Toluca', 157, 19.287867, -99.646761, 1, '2009-07-05 16:48:48'),
(345, 'Coacalco, Estado de México', 157, 19.63562, -99.095467, 1, '2009-07-05 17:07:22'),
(346, 'San Nicolás de los Garza', NULL, 25.75, -100.3, 1, '2009-07-05 16:54:07'),
(347, 'Av Contreras, Magdalena Contreras, Distrito Federal', 157, 19.325763, -99.214568, 1, '2009-07-05 17:22:07'),
(348, 'Los remedios, Estado de México', 157, 19.511907, -100.046647, 1, '2009-07-05 17:14:30'),
(349, 'Coacalco', NULL, 19.631667, -99.110278, 1, '2009-07-05 17:19:41'),
(350, 'Juarez Nuevo Leon', NULL, 23.634501, -102.552784, 1, '2009-07-05 17:21:26'),
(351, 'Tepic, Nayarit', 157, 21.50854, -104.893123, 1, '2009-07-05 17:27:24'),
(352, 'Querétaro, Querétaro', 157, 20.58316, -100.387398, 1, '2009-07-05 17:30:02'),
(353, 'Toluca, Estado de México', NULL, 23.634501, -102.552784, 1, '2009-07-05 17:30:18'),
(354, 'Guadalajara, Jalisco', 157, 20.676631, -103.34616, 1, '2009-07-05 17:45:47'),
(355, 'Cholula, Puebla', 157, 19.05698, -98.301201, 1, '2009-07-05 17:46:28'),
(356, 'venustiano carranza', NULL, 23.634501, -102.552784, 1, '2009-07-05 17:37:26'),
(357, 'querétaro, querétaro', 157, 20.58316, -100.387398, 1, '2009-07-05 17:56:09'),
(358, 'San José de los Cedros, Cuajimalpa, Distrito Federal', 157, 19.366225, -99.28817, 1, '2009-07-05 17:42:16'),
(359, 'Saltillo', NULL, 25.416667, -101, 1, '2009-07-05 17:39:31'),
(360, 'Querétaro, querétaro', 157, 20.58316, -100.387398, 1, '2009-07-05 17:55:06'),
(361, 'merida', NULL, 23.634501, -102.552784, 1, '2009-07-05 17:39:54'),
(362, 'Querétaro, querétaro', 157, 20.58316, -100.387398, 1, '2009-07-05 17:54:57'),
(363, 'querétaro, querétaro', 157, 20.58316, -100.387398, 1, '2009-07-05 17:54:47'),
(364, 'Tampico, Tamaulipas', 157, 23.634501, -102.552784, 1, '2009-07-05 17:55:12'),
(365, 'Distrito Federal', NULL, 23.634501, -102.552784, 1, '2009-07-05 17:57:32'),
(366, 'Actopan, Hidalgo', 157, 20.26268, -98.945177, 1, '2009-07-05 18:00:09'),
(367, 'Pachuca, Alvaro Obregón, Distrito Federal', 157, 19.414649, -99.177992, 1, '2009-07-05 18:01:18'),
(368, 'Naucalpan, Estado de México', 157, 19.475278, -99.237778, 1, '2009-07-05 18:03:18'),
(369, 'Distrito Federal', 157, 19.24647, -99.10135, 1, '2009-07-05 18:15:27'),
(370, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 18:49:12'),
(371, 'Cuautitlán Izcalli', NULL, 19.646944, -99.246667, 1, '2009-07-05 18:30:42'),
(372, 'dISTRITO FEDERAL', NULL, 23.634501, -102.552784, 1, '2009-07-05 18:34:56'),
(373, 'Mexico City', NULL, 19.434167, -99.138611, 1, '2009-07-05 18:37:14'),
(374, 'Distrito Federal', NULL, 23.634501, -102.552784, 1, '2009-07-05 18:42:12'),
(375, 'Distrito Federal', 157, 19.24647, -99.10135, 1, '2009-07-05 19:13:10'),
(376, 'AVENIDA NEREO RODRIGUEZ BARRAGAN 1380 san Luis Potosi', 157, 22.151619, -101.012882, 1, '2009-07-05 18:48:22'),
(377, 'Puebla, Puebla', 157, 19.046795, -98.209223, 1, '2009-07-05 18:50:43'),
(378, 'Tlalnepantla, Estado de México', 157, 19.536667, -99.194722, 1, '2009-07-05 19:09:41'),
(379, 'Coyoacán, DF', 157, 19.35, -99.161667, 1, '2009-07-05 18:55:36'),
(380, 'Mexico City', NULL, 19.434167, -99.138611, 1, '2009-07-05 18:57:35'),
(381, 'Mexico City', NULL, 19.434167, -99.138611, 1, '2009-07-05 18:58:12'),
(382, 'coyoacán, DF', 157, 19.35, -99.161667, 1, '2009-07-05 19:01:41'),
(383, 'Coyoacán, Distrito Federal', 157, 19.35, -99.161667, 1, '2009-07-05 19:08:53'),
(384, 'Cuautitlán Izcalli', NULL, 19.646944, -99.246667, 1, '2009-07-05 19:12:09'),
(385, 'México, Distriito Federal. Del. Coyoacán', NULL, 23.634501, -102.552784, 1, '2009-07-05 19:14:16'),
(386, 'Coyoacán', NULL, 23.634501, -102.552784, 1, '2009-07-05 19:17:00'),
(387, 'Distrito Federal, Del. Coyoacán, Col. Copilco El Alto.', NULL, 23.634501, -102.552784, 1, '2009-07-05 19:19:02'),
(388, 'Cuautitlán Izcalli', NULL, 19.646944, -99.246667, 1, '2009-07-05 19:20:29'),
(389, 'Toluca', NULL, 19.288333, -99.667222, 1, '2009-07-05 19:22:57'),
(390, 'COLIMA COL', NULL, 23.634501, -102.552784, 1, '2009-07-05 19:31:47'),
(391, 'Cuajimalpa, Distrito Federal', 157, 23.634501, -102.552784, 1, '2009-07-05 19:51:27'),
(392, 'Chetumal, Quintana Roo', 157, 18.503611, -88.305278, 1, '2009-07-05 19:53:00'),
(393, 'coyoacan', NULL, 23.634501, -102.552784, 1, '2009-07-05 19:53:56'),
(394, 'Chetumal, QuintanaRoo', 157, 18.503611, -88.305278, 1, '2009-07-05 19:54:25'),
(395, 'Oaxaca de Juárez', NULL, 23.634501, -102.552784, 1, '2009-07-05 19:54:54'),
(396, 'D.F.', NULL, 23.634501, -102.552784, 1, '2009-07-05 19:56:00'),
(397, 'Tapachula, Chiapas', 157, 14.90675, -92.260681, 1, '2009-07-05 19:56:47'),
(398, 'Chimalhuacna, Estado de México', 157, 19.4375, -98.954167, 1, '2009-07-05 19:59:32'),
(399, 'Naucalpan, Estado de méxico', 157, 19.475278, -99.237778, 1, '2009-07-05 20:01:18'),
(400, 'Naucalpan, Estado de méxico', 157, 19.475278, -99.237778, 1, '2009-07-05 20:01:27'),
(401, 'Cuajimalpa, Distrito Federal', 157, 19.400321, -99.170413, 1, '2009-07-05 20:03:01'),
(402, 'Mexico', NULL, 23.634501, -102.552784, 1, '2009-07-05 20:04:14'),
(403, 'Naucalpan, Estado de México', 157, 19.475278, -99.237778, 1, '2009-07-05 20:07:10'),
(404, 'Ciudad de Mexico', NULL, 23.634501, -102.552784, 1, '2009-07-05 20:06:52'),
(405, 'Naucalpan, Estado de México', 157, 19.475278, -99.237778, 1, '2009-07-05 20:08:37'),
(406, 'Córdoba', NULL, 18.883333, -96.933333, 1, '2009-07-05 20:10:55'),
(407, 'Estado de México', 157, 19.496873, -99.723267, 1, '2009-07-05 20:10:57'),
(408, 'Puebla', NULL, 23.634501, -102.552784, 1, '2009-07-05 20:41:03'),
(409, 'Chalco de Díaz Covarrubias', NULL, 19.266667, -98.9, 1, '2009-07-05 20:41:15'),
(410, 'Mexico City', NULL, 19.434167, -99.138611, 1, '2009-07-05 21:07:10'),
(411, 'Cuernavaca', NULL, 18.916667, -99.25, 1, '2009-07-05 21:15:43'),
(412, 'Ciudad López Mateos', NULL, 19.558333, -99.261389, 1, '2009-07-05 21:44:51'),
(413, 'colonia 5 de mayo, tecámac estado de méxico', NULL, 23.634501, -102.552784, 1, '2009-07-05 21:45:38'),
(414, 'Distrito Federal', NULL, 19.3028, -99.119854, 1, '2009-07-05 23:30:35'),
(415, 'San Luis Potosí', NULL, 22.15, -100.983333, 1, '2009-07-05 23:50:45'),
(416, 'Soledad de Graciano Sanchez San Luis Potosi SLP', NULL, 23.634501, -102.552784, 1, '2009-07-05 23:55:11'),
(417, 'san luis potosi slp', NULL, 23.634501, -102.552784, 1, '2009-07-06 00:01:14'),
(418, 'Mexico City', NULL, 19.434167, -99.138611, 1, '2009-07-06 00:34:13'),
(419, 'Querétaro', NULL, 20.6, -100.383333, 1, '2009-07-06 01:21:43'),
(420, 'Hermosillo, Sonora, seccion 520', NULL, 23.634501, -102.552784, 1, '2009-07-06 02:13:57'),
(421, 'Naucalpan', NULL, 19.478508, -99.239631, 1, '2009-07-06 09:34:18'),
(422, 'Mexico City', NULL, 19.434167, -99.138611, 1, '2009-07-06 12:25:52'),
(423, 'TLALNEPANTLA DE BAZ', NULL, 23.634501, -102.552784, 1, '2009-07-06 19:01:57'),
(424, 'Cuautitlán Izcalli', NULL, 19.646944, -99.246667, 1, '2009-07-06 21:19:14'),
(425, 'Tlalnepantla, Edo. de México', NULL, 23.634501, -102.552784, 1, '2009-07-07 10:57:45'),
(426, 'Alvaro Obregon - U. Lomas de Plateros', NULL, 23.634501, -102.552784, 1, '2009-07-12 09:49:47'),
(427, 'Aguascalientes', NULL, 21.883333, -102.3, 1, '2009-07-27 04:40:29'),
(428, 'Iztacalco y Estado de Mexico', NULL, 23.634501, -102.552784, 1, '2009-09-14 23:39:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `location_id` bigint(20) default NULL,
  `incident_id` bigint(20) default NULL,
  `media_type` tinyint(4) default NULL COMMENT '1 - IMAGES, 2 - VIDEO, 3 - AUDIO, 4 - NEWS, 5 - PODCAST',
  `media_title` varchar(255) default NULL,
  `media_description` longtext,
  `media_link` varchar(255) default NULL,
  `media_thumb` varchar(255) default NULL,
  `media_date` datetime default NULL,
  `media_active` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `media`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `parent_id` bigint(20) default '0',
  `incident_id` int(11) default '0',
  `user_id` int(11) default '0',
  `reporter_id` bigint(20) default NULL,
  `service_messageid` varchar(100) default NULL,
  `message_from` varchar(100) default NULL,
  `message_to` varchar(100) default NULL,
  `message` text,
  `message_detail` text,
  `message_type` tinyint(4) default '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin)',
  `message_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `message`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `organization_name` varchar(255) default NULL,
  `organization_description` longtext,
  `organization_website` varchar(255) default NULL,
  `organization_email` varchar(120) default NULL,
  `organization_phone1` varchar(50) default NULL,
  `organization_phone2` varchar(50) default NULL,
  `organization_address` varchar(255) default NULL,
  `organization_country` varchar(100) default NULL,
  `organization_active` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `organization`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organization_incident`
--

CREATE TABLE IF NOT EXISTS `organization_incident` (
  `organization_id` bigint(20) default NULL,
  `incident_id` bigint(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `organization_incident`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pending_users`
--

CREATE TABLE IF NOT EXISTS `pending_users` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `key` varchar(32) NOT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(31) NOT NULL default '',
  `password` char(50) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `pending_users`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` bigint(20) default NULL,
  `comment_id` bigint(20) default NULL,
  `rating` tinyint(4) default '0',
  `rating_ip` varchar(100) default NULL,
  `rating_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `rating`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporter`
--

CREATE TABLE IF NOT EXISTS `reporter` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` bigint(20) default NULL,
  `location_id` bigint(20) default NULL,
  `user_id` int(11) default NULL,
  `service_id` int(11) default NULL,
  `service_userid` varchar(255) default NULL,
  `service_account` varchar(255) default NULL,
  `reporter_level` tinyint(4) default '3',
  `reporter_first` varchar(200) default NULL,
  `reporter_last` varchar(200) default NULL,
  `reporter_email` varchar(120) default NULL,
  `reporter_phone` varchar(60) default NULL,
  `reporter_ip` varchar(50) default NULL,
  `reporter_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `reporter`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'login', 'Login privileges, granted after account confirmation'),
(2, 'admin', 'Administrative user, has access to everything.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scheduler`
--

CREATE TABLE IF NOT EXISTS `scheduler` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `scheduler_name` varchar(100) NOT NULL,
  `scheduler_last` int(10) unsigned NOT NULL default '0',
  `scheduler_weekday` smallint(6) NOT NULL default '-1',
  `scheduler_day` smallint(6) NOT NULL default '-1',
  `scheduler_hour` smallint(6) NOT NULL default '-1',
  `scheduler_minute` smallint(6) NOT NULL,
  `scheduler_controller` varchar(100) NOT NULL,
  `scheduler_active` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `scheduler`
--

INSERT INTO `scheduler` (`id`, `scheduler_name`, `scheduler_last`, `scheduler_weekday`, `scheduler_day`, `scheduler_hour`, `scheduler_minute`, `scheduler_controller`, `scheduler_active`) VALUES
(1, 'Feeds', 1253199793, -1, -1, -1, 0, 'feeds', 1),
(2, 'Alerts', 1253201417, -1, -1, -1, -1, 'alerts', 1),
(3, 'Email', 1253199794, -1, -1, -1, 0, 'email', 1),
(4, 'Twitter', 1253199796, -1, -1, -1, 0, 'twitter', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scheduler_log`
--

CREATE TABLE IF NOT EXISTS `scheduler_log` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `scheduler_id` int(11) NOT NULL,
  `scheduler_name` varchar(100) NOT NULL,
  `scheduler_status` varchar(20) default NULL,
  `scheduler_date` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `scheduler_log`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `service_name` varchar(100) default NULL,
  `service_description` varchar(255) default NULL,
  `service_url` varchar(255) default NULL,
  `service_api` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `service`
--

INSERT INTO `service` (`id`, `service_name`, `service_description`, `service_url`, `service_api`) VALUES
(1, 'SMS', 'Text messages from phones', NULL, NULL),
(2, 'Email', 'Text messages from phones', NULL, NULL),
(3, 'Twitter', 'Tweets tweets tweets', 'http://twitter.com', NULL),
(4, 'Laconica', 'Tweets tweets tweets', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(40) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `sessions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `site_name` varchar(255) default NULL,
  `site_tagline` varchar(255) default NULL,
  `site_email` varchar(120) default NULL,
  `site_key` varchar(100) default NULL,
  `site_language` varchar(10) NOT NULL default 'en_US',
  `site_timezone` varchar(80) default NULL,
  `allow_reports` tinyint(4) NOT NULL default '1',
  `allow_comments` tinyint(4) NOT NULL default '1',
  `allow_feed` tinyint(4) NOT NULL default '1',
  `allow_clustering` tinyint(4) NOT NULL default '0',
  `default_map` tinyint(4) NOT NULL default '1' COMMENT '1 - GOOGLE MAPS, 2 - LIVE MAPS, 3 - YAHOO MAPS, 4 - OPEN STREET MAPS',
  `api_google` varchar(200) default NULL,
  `api_yahoo` varchar(200) default NULL,
  `api_live` varchar(200) default NULL,
  `default_country` int(11) default NULL,
  `default_city` varchar(150) default NULL,
  `default_lat` varchar(100) default NULL,
  `default_lon` varchar(100) default NULL,
  `default_zoom` tinyint(4) NOT NULL default '10',
  `items_per_page` smallint(6) NOT NULL default '20',
  `items_per_page_admin` smallint(6) NOT NULL default '20',
  `sms_no1` varchar(100) default NULL,
  `sms_no2` varchar(100) default NULL,
  `sms_no3` varchar(100) default NULL,
  `frontlinesms_key` varchar(30) default NULL,
  `clickatell_api` varchar(30) default NULL,
  `clickatell_username` varchar(100) default NULL,
  `clickatell_password` varchar(100) default NULL,
  `google_analytics` text,
  `twitter_hashtags` text,
  `twitter_username` varchar(50) default NULL,
  `twitter_password` varchar(50) default NULL,
  `laconica_username` varchar(50) default NULL,
  `laconica_password` varchar(50) default NULL,
  `laconica_site` varchar(30) default NULL COMMENT 'a laconica site',
  `date_modify` datetime default NULL,
  `eflyer_username` varchar(100) default NULL,
  `eflyer_password` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `site_tagline`, `site_email`, `site_key`, `site_language`, `site_timezone`, `allow_reports`, `allow_comments`, `allow_feed`, `allow_clustering`, `default_map`, `api_google`, `api_yahoo`, `api_live`, `default_country`, `default_city`, `default_lat`, `default_lon`, `default_zoom`, `items_per_page`, `items_per_page_admin`, `sms_no1`, `sms_no2`, `sms_no3`, `frontlinesms_key`, `clickatell_api`, `clickatell_username`, `clickatell_password`, `google_analytics`, `twitter_hashtags`, `twitter_username`, `twitter_password`, `laconica_username`, `laconica_password`, `laconica_site`, `date_modify`, `eflyer_username`, `eflyer_password`) VALUES
(1, 'Cuidemos el Voto', 'Nueva observación electoral', 'webmaster@cuidemoselvoto.org', NULL, 'en_US', NULL, 1, 1, 1, 1, 1, 'ABQIAAAAJBWKA1FaImmunuohpC7yphTJHToCCIsdBz_ldgTLqnJCTfHmohQQBQbgqwGG0vyOUOZPqMok3I9l7w', '5CYeWbfV34E21JOW1a4.54Mf6e9jLNkD0HVzaKoQmJZi2qzmSZd5mD8X49x7', NULL, 157, 'nairobi', '23.634501', '-102.552784', 5, 20, 20, '5532690062', '', '', 'ADDNEWKEY', NULL, NULL, NULL, 'UA-8679533-1', '#cuidemoselvoto', 'cuidemoselvoto', 'PASS_TWITTER', '', '', '', '2009-07-05 16:08:21', 'cuidemoselvoto', 'PASS_MD5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `twitter`
--

CREATE TABLE IF NOT EXISTS `twitter` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` int(11) default '0',
  `tweet_from` varchar(100) default NULL,
  `tweet_to` varchar(100) default NULL,
  `tweet_hashtag` varchar(50) default NULL,
  `tweet_link` varchar(100) default NULL,
  `tweet` varchar(255) default NULL,
  `tweet_type` tinyint(4) default '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin)',
  `tweet_date` datetime default NULL,
  `hide` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `twitter`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(31) NOT NULL default '',
  `password` char(50) NOT NULL,
  `logins` int(10) unsigned NOT NULL default '0',
  `last_login` int(10) unsigned default NULL,
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `logins`, `last_login`, `updated`) VALUES
(1, 'Administrador', 'admin@cuidemoselvoto.org', 'admin', 'PASSW_MD5', 1, 1246853838, '2009-09-17 19:38:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_tokens`
--

CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `user_tokens`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verified`
--

CREATE TABLE IF NOT EXISTS `verified` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `incident_id` bigint(20) default NULL,
  `idp_id` bigint(20) default NULL,
  `user_id` int(11) default NULL,
  `verified_comment` longtext,
  `verified_date` datetime default NULL,
  `verified_status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `verified`
--

