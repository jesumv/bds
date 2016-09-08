-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-09-2016 a las 03:40:10
-- Versión del servidor: 5.6.14
-- Versión de PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ventas`
--
CREATE DATABASE IF NOT EXISTS `ventas` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `ventas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artsoc`
--

DROP TABLE IF EXISTS `artsoc`;
CREATE TABLE `artsoc` (
  `idartsoc` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idoc` bigint(20) unsigned NOT NULL,
  `idproductos` tinyint(3) unsigned NOT NULL,
  `cant` tinyint(3) unsigned NOT NULL,
  `preciou` decimal(6,2) unsigned NOT NULL,
  `preciot` decimal(6,2) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 pedido 2 surtido 3 salida 99 cancelado',
  UNIQUE KEY `idartsoc` (`idartsoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artsped`
--

DROP TABLE IF EXISTS `artsped`;
CREATE TABLE `artsped` (
  `idartsped` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idpedido` bigint(20) unsigned NOT NULL,
  `idproductos` tinyint(3) unsigned NOT NULL,
  `cant` tinyint(3) unsigned NOT NULL,
  `preciou` decimal(6,2) unsigned NOT NULL,
  `preciot` decimal(6,2) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 pedido 99 surtido 3 salida 999 cancelado',
  UNIQUE KEY `idartsoc` (`idartsped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `idclientes` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `razon social` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `domcalle` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domnoext` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domcol` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domedo` int(10) unsigned DEFAULT NULL,
  `domcp` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel1` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel2` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cel` bigint(15) unsigned DEFAULT NULL,
  `contacto` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nivel` tinyint(3) unsigned NOT NULL,
  `usu` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `diascred` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '1 activo 2 suspendido 99 cancelado',
  UNIQUE KEY `idclientes` (`idclientes`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idclientes`, `razon social`, `rfc`, `nom_corto`, `domcalle`, `domnoext`, `domcol`, `domedo`, `domcp`, `tel1`, `tel2`, `cel`, `contacto`, `email`, `nivel`, `usu`, `diascred`, `status`) VALUES
(1, 'CLIENTE DE MOSTRADOR', NULL, 'MOSTRADOR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'j.maldonado', 0, 1),
(2, 'CLIENTE COSTO', NULL, 'MOSTRADOR COSTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'j.maldonado', 0, 1),
(3, 'CLIENTE DE MOSTRADOR PREFERENTE', NULL, 'MOSTRADOR PREFERENTE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'j.maldonado', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentabanco`
--

DROP TABLE IF EXISTS `cuentabanco`;
CREATE TABLE `cuentabanco` (
  `idcuentabanco` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `banco` text COLLATE utf8_spanish_ci,
  `no` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `idcuentabanco` (`idcuentabanco`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cuentabanco`
--

INSERT INTO `cuentabanco` (`idcuentabanco`, `nombre`, `banco`, `no`) VALUES
(1, 'CAJA', NULL, NULL),
(2, 'BANCOMER', 'BANCOMER', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cvtas`
--

DROP TABLE IF EXISTS `cvtas`;
CREATE TABLE `cvtas` (
  `idcvtas` int(11) NOT NULL AUTO_INCREMENT,
  `idmovto` int(10) unsigned NOT NULL,
  `idproveedores` tinyint(3) unsigned DEFAULT NULL,
  `idclientes` tinyint(3) unsigned DEFAULT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL,
  PRIMARY KEY (`idcvtas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxc`
--

DROP TABLE IF EXISTS `cxc`;
CREATE TABLE `cxc` (
  `idcxc` int(11) NOT NULL AUTO_INCREMENT,
  `idmovto` int(10) unsigned NOT NULL,
  `idclientes` tinyint(3) unsigned NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) unsigned NOT NULL,
  `total` decimal(15,2) unsigned NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL,
  PRIMARY KEY (`idcxc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxp`
--

DROP TABLE IF EXISTS `cxp`;
CREATE TABLE `cxp` (
  `idcxp` int(11) NOT NULL AUTO_INCREMENT,
  `idmovto` int(10) unsigned NOT NULL,
  `idproveedores` tinyint(3) unsigned NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) unsigned NOT NULL,
  `total` decimal(15,2) unsigned NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL,
  PRIMARY KEY (`idcxp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponible`
--

DROP TABLE IF EXISTS `disponible`;
CREATE TABLE `disponible` (
  `iddisponible` int(11) NOT NULL AUTO_INCREMENT,
  `idmovto` int(10) unsigned NOT NULL,
  `idproveedores` tinyint(3) unsigned DEFAULT NULL,
  `idclientes` tinyint(3) unsigned DEFAULT NULL,
  `cuenta` tinyint(3) unsigned NOT NULL COMMENT '1 caja 2 bancomer',
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL,
  PRIMARY KEY (`iddisponible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `idgrupos` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(2) unsigned NOT NULL COMMENT '0 alta 1 mod 2 baja',
  `usu` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`idgrupos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`idgrupos`, `nombre`, `status`, `usu`) VALUES
(1, 'Lácteos', 0, 'j.maldonado'),
(2, 'Pescados', 0, 'j.maldonado'),
(3, 'Abarrotes', 0, 'j.maldonado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE `ingresos` (
  `idingresos` int(11) NOT NULL AUTO_INCREMENT,
  `idmovto` int(10) unsigned NOT NULL,
  `idproveedores` tinyint(3) unsigned DEFAULT NULL,
  `idclientes` tinyint(3) unsigned DEFAULT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL,
  PRIMARY KEY (`idingresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE `inventario` (
  `idinventario` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idproductos` tinyint(3) unsigned NOT NULL,
  `tipomov` tinyint(3) unsigned NOT NULL COMMENT '1 entrada 2 salida 3 ajuste',
  `cant` int(11) NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `comentarios` longtext COLLATE utf8_spanish_ci,
  `idoc` bigint(20) unsigned NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `debe` decimal(15,2) DEFAULT NULL,
  `haber` decimal(15,2) DEFAULT NULL,
  UNIQUE KEY `idinventario` (`idinventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ivaacred`
--

DROP TABLE IF EXISTS `ivaacred`;
CREATE TABLE `ivaacred` (
  `idivatrans` int(11) NOT NULL AUTO_INCREMENT,
  `idmovto` int(10) unsigned NOT NULL,
  `idproveedores` tinyint(3) unsigned NOT NULL,
  `fact` text CHARACTER SET latin1,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 acreditable  1 x acreditar',
  `debe` decimal(15,2) DEFAULT NULL,
  `haber` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`idivatrans`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ivatrans`
--

DROP TABLE IF EXISTS `ivatrans`;
CREATE TABLE `ivatrans` (
  `idivatrans` int(11) NOT NULL AUTO_INCREMENT,
  `idmovto` int(10) unsigned NOT NULL,
  `idclientes` tinyint(3) unsigned NOT NULL,
  `fact` text CHARACTER SET latin1,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 trasladado 1 x trasladar',
  `debe` decimal(15,2) DEFAULT NULL,
  `haber` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`idivatrans`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listasp`
--

DROP TABLE IF EXISTS `listasp`;
CREATE TABLE `listasp` (
  `idlistasp` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `restricciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `cliente` tinyint(3) unsigned NOT NULL,
  `destinatario` mediumtext COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  UNIQUE KEY `idlistasp` (`idlistasp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oc`
--

DROP TABLE IF EXISTS `oc`;
CREATE TABLE `oc` (
  `idoc` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idproveedores` tinyint(3) unsigned NOT NULL,
  `arts` int(6) unsigned NOT NULL,
  `monto` decimal(20,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL,
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '1 pedido, 5 mail env 10 surtido parc, 11  surt total,99 pagado, 999 cancelado',
  `coment` text CHARACTER SET latin1,
  `correooc` tinyint(1) NOT NULL DEFAULT '0',
  `fact` text COLLATE utf8_spanish_ci COMMENT 'factura recibida por la oc',
  `foliomov` text COLLATE utf8_spanish_ci COMMENT 'folio del movimiento segun comprobante',
  PRIMARY KEY (`idoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

DROP TABLE IF EXISTS `parametros`;
CREATE TABLE `parametros` (
  `idparametros` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `valornum` decimal(6,2) DEFAULT NULL,
  `valorent` tinyint(4) DEFAULT NULL,
  `valortexto` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  UNIQUE KEY `idparametros` (`idparametros`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`idparametros`, `nombre`, `valornum`, `valorent`, `valortexto`) VALUES
(1, 'iva', '0.16', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `idpedidos` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idclientes` tinyint(3) unsigned NOT NULL,
  `arts` int(6) unsigned NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '1 pedido, 2 surtido, 99 pagado, 999 cancelado',
  `coment` text CHARACTER SET latin1,
  PRIMARY KEY (`idpedidos`),
  UNIQUE KEY `idpedidos` (`idpedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `idproductos` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `cbarras` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `grupo` tinyint(3) unsigned NOT NULL,
  `unidad` tinyint(4) NOT NULL,
  `cant` decimal(7,2) unsigned NOT NULL,
  `descripcion` longtext COLLATE utf8_spanish_ci NOT NULL,
  `costo` decimal(15,3) NOT NULL,
  `precio1` decimal(15,3) unsigned NOT NULL,
  `precio2` decimal(15,3) unsigned DEFAULT NULL,
  `precio3` decimal(15,3) unsigned DEFAULT NULL,
  `idproveedores` tinyint(4) NOT NULL,
  `usu` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) unsigned NOT NULL COMMENT '0 ACTIVO, 1 INACTIVO 99 CANC',
  `iva` tinyint(1) NOT NULL,
  `foto` longblob NOT NULL,
  `speso` tinyint(1) NOT NULL COMMENT 'indica si el producto debe pesar al recibirlo',
  PRIMARY KEY (`idproductos`),
  UNIQUE KEY `idproductos` (`idproductos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproductos`, `codigo`, `cbarras`, `nombre`, `nom_corto`, `grupo`, `unidad`, `cant`, `descripcion`, `costo`, `precio1`, `precio2`, `precio3`, `idproveedores`, `usu`, `fechamov`, `status`, `iva`, `foto`, `speso`) VALUES
(1, 'QE500', '7501690516053', 'QUESO CAMPESTRE CON EPAZOTE 1/2 KG', 'CAMP EPAZOTE 1/2 K', 1, 2, '500.00', 'QUESO CAMPESTRE CON EPAZOTE 500G ', '47.500', '55.000', '60.000', '65.000', 1, 'j.maldonado', '2016-09-06 19:19:55', 0, 0, '', 0),
(2, 'QH500', '7501690516053', 'QUESO CAMPESTRE CON CHIPOTLE 1/2 KG', 'CAMP CHIPOTLE 1/2K', 1, 2, '500.00', 'QUESO CAMPESTRE CON CHIPOTLE 500g', '47.500', '55.000', '60.000', '65.000', 1, 'j.maldonado', '2016-09-06 19:29:08', 0, 0, '', 0),
(3, 'QR500', '75016905521057', 'QUESO RANCHERO 1/2 KG', 'RANCHERO 1/2K', 1, 2, '500.00', 'QUESO RANCHERO DE 500G', '45.000', '55.000', '60.000', '65.000', 1, 'j.maldonado', '2016-09-06 19:29:08', 0, 0, '', 0),
(4, 'QEN500', '7501690516053', 'QUESO CAMPESTRE ENCHILADO 1/2 KG', 'CAMP ENCHILADO 1/2K', 1, 2, '255.00', 'QUESO CAMPESTRE ENCHILADO DE 500G', '47.500', '55.000', '60.000', '65.000', 1, 'j.maldonado', '2016-09-06 19:29:08', 0, 0, '', 0),
(5, 'QPN500', '7501690523051', 'QUESO PANELA DE 1/2 KG', 'PANELA 1/2K', 1, 2, '500.00', 'QUESO PANELA DE 500 GRAMOS', '45.000', '52.000', '56.000', '60.000', 1, 'j.maldonado', '2016-09-06 19:29:08', 0, 0, '', 0),
(6, 'QMH500', '75016905520050', 'QUESO MANCHEGO DE 1/2 KG', 'MANCHEGO 1/2K', 1, 2, '500.00', 'QUESO MANCHEGO DE 500G', '52.000', '60.000', '65.000', '70.000', 1, 'j.maldonado', '2016-09-06 19:29:08', 0, 0, '', 0),
(7, 'QP500', '7501690516053', 'QUESO CAMPESTRE NATURAL DE 1/2 KG', 'CAMP NATURAL 1/2K', 1, 2, '500.00', 'QUESO CAMPESTRE NATURAL DE 500 GRAMOS', '46.500', '54.000', '58.000', '65.000', 1, 'j.maldonado', '2016-09-06 19:54:27', 0, 0, '', 0),
(8, 'QO500', '7501690522054', 'QUESO OAXACA 1/2 KG', 'OAXACA 1/2K', 1, 2, '500.00', 'QUESO OAXACA DE 500 GRAMOS', '46.500', '54.000', '58.000', '60.000', 1, 'j.maldonado', '2016-09-06 19:54:51', 0, 0, '', 0),
(9, 'MT250', '111', 'MANTEQUILLA 1/4 KG', 'MANTEQUILLA 1/4K', 1, 2, '250.00', 'MANTEQUILLA DE 250 GRAMOS', '17.500', '20.000', '22.000', '24.000', 1, 'j.maldonado', '2016-09-06 19:29:08', 0, 0, '', 0),
(10, 'QPN1000C', '11234', 'QUESO PANELA COMERCIAL 1KG', 'PANELA COMERC 1K', 1, 1, '1.00', 'QUESO PANELA COMERCIAL BARRA DE 1KG', '65.500', '75.000', '79.000', '82.000', 1, 'j.maldonado', '2016-09-06 19:29:08', 0, 0, '', 0),
(11, 'IG011', '00011', 'LOMO SALMON FRESCO CBV 1 KG. APROX', 'SALMON FRESCO CBV 1K', 2, 1, '1.00', 'LOMO DE SALMON FRESCO CON BOLSA DE VACIO, SEGUN PESO DE 1.3 A 1.8 KG,', '279.920', '335.000', '350.000', '365.000', 2, 'jesumv', '2016-09-07 18:29:32', 1, 0, '', 1),
(12, 'IG012', '00012', 'MERLUZA DE PINCHO SIN PIEL 140G APROX S/', 'MERLUZA PORC S/PESO', 2, 2, '1.00', 'PORCION DE MERLUZA DE PINCHO SIN PIEL DE 140 A 160 GRAMOS CONGELADAS, AL VACIO, SEGUN PESO', '0.074', '0.095', '0.010', '0.011', 2, 'jesumv', '2016-09-07 18:29:50', 0, 0, '', 1),
(13, 'IG013', '00013', 'TROZOS DE MERLUZA DE PINCHO 2KG PROX', 'MERLUZA TR 2KG', 2, 1, '1.00', 'TROZOS DE MERLUZA DE PINCHO SIN PIEL, CONGELADA EN BOLSA DE 2 KG SEGUN PESO', '48.000', '62.000', '65.000', '70.000', 2, 'j.maldonado', '2016-09-07 21:49:52', 0, 0, '', 1),
(14, 'IG014', '00014', 'VIEIRAS CONGELADAS BOLSA 1KG APROX', 'VIEIRAS CONG 1K', 2, 1, '1.00', 'VIEIRAS CON CORAL Y CONCHA, CONGELADAS, EN BOLSA DE 1KG. APROX, SEGUN PESO', '191.460', '250.000', '260.000', '270.000', 2, 'j.maldonado', '2016-09-07 21:50:55', 0, 0, '', 1),
(15, 'IG015', '00015', 'MEJILLONES AL VINO BLANCO 50O GR APROX', 'MEJILLONES VINO 500G', 2, 1, '1.00', 'MEJILLONES PRECOCINADOS CONGELADOS AL VINO BLANCO MARCA NORDKINN EN BOLSA DE 500 GRAMOS APROX, SEGUN PESO.', '110.410', '145.000', '150.000', '155.000', 2, 'j.maldonado', '2016-09-07 21:52:50', 0, 0, '', 1),
(16, 'IG016', '00016', 'MEJILLONES EN SALSA DE TOMATE 500 GR APR', 'MEJILLONES SALSA 500', 2, 1, '1.00', 'MEJILLONES PRECOCINADOS CONGELADOS EN SALSA DE TOMATE Y ENELDO MARCA NORDKINN EN BOLSA DE 500 GRAMOS APROX. SEGUN PESO.', '110.410', '145.000', '150.000', '155.000', 2, 'j.maldonado', '2016-09-07 21:53:20', 0, 0, '', 1),
(17, 'IG017', '00017', 'PAMPANO PRECOCINADO AL NATURAL 100 GR', 'PAMPANO NAT 100G', 2, 2, '100.00', 'PAMPANO PRECOCINADO AL NATURAL, CONGELADO EN PORCION INVIVIDUAL DE 100 GRAMOS MARCA C. DE PATAGONIA', '32.360', '40.000', '45.000', '50.000', 2, 'j.maldonado', '2016-09-06 19:27:39', 0, 0, '', 0),
(18, 'IG018', '00018', 'SALMON PRECOCINADO AL NATURAL 100 GR', 'SALMON PREC NAT 100G', 2, 2, '100.00', 'LOMO DE SALMON PRECOCINADO AL NATURAL, CONGELADO, EN EMPAQUE AL VACIO 100 GRAMOS MARCA C. DE PATAGONIA.', '32.360', '40.000', '45.000', '50.000', 2, 'j.maldonado', '2016-09-06 19:27:39', 0, 0, '', 0),
(19, 'IG019', '00019', 'SALMON PRECOCINADO AL TERIYAKI 100 GR', 'SALMON TERIYAKI 100G', 2, 2, '100.00', 'LOMO DE SALMON PRECOCINADO AL TERIYAKI, CONGELADO, EN EMPAQUE AL VACIO 100 GRAMOS MARCA C. DE PATAGONIA', '27.470', '40.000', '45.000', '50.000', 2, 'j.maldonado', '2016-09-06 19:27:39', 0, 0, '', 0),
(20, 'IG020', '0020', 'TARTARE DE SALMON', 'TARTARE SALMON', 2, 2, '90.00', 'TARTARE DE CARNE DE SALMON PRECOCINADA, PORCION DE 90 GRAMOS.', '28.420', '35.000', '38.000', '40.000', 2, 'j.maldonado', '2016-09-06 19:27:39', 0, 0, '', 0),
(21, 'IG021', '00021', 'WELLINGTON DE SALMON', 'WELLINGTON SALMON', 2, 2, '220.00', 'WELLINGTON DE SALMON PRECOCINADO, CONGELADO, EN PORCION DE 220 GRAMOS MARCA C. DE PATAGONIA.', '42.380', '55.000', '58.000', '60.000', 2, 'j.maldonado', '2016-09-06 19:27:39', 0, 0, '', 0),
(22, 'IG022', '00022', 'LOMO DE SALMON FRESCO SBV 1.3 A 1.8 KG', 'SALMON FRESCO SBV 1K', 2, 1, '1.00', 'LOMO DE SALMON FRESCO SIN BOLSA DE VACIO DE 1.3 A 1.8 KG SEGUN PESO', '286.910', '345.000', '360.000', '375.000', 2, 'jesumv', '2016-09-07 21:37:49', 0, 0, '', 1),
(23, 'IG023', '00023', 'LOMO DE SALMON CONGELADO SBV 1.3 A 1.8 K', 'SALMON CONG SBV 1.3K', 2, 1, '1.00', 'LOMO DE SALMON CONGELADO SIN BOLSA DE VACIO, DE 1.3 A 1.8 KG SEGUN PESO.', '250.000', '280.000', '300.000', '330.000', 2, 'jesumv', '2016-09-07 21:38:03', 1, 0, '', 1),
(24, 'IG024', '8410694150455', 'SALMON AHUMADO REBANADO 100 GR', 'SALMON AHUM 100G', 2, 2, '100.00', 'SALMON AHUMADO REBANADO CONGELADO EMPAQUE AL VACIO PORTION CONTROL 100 GRAMOS MARCA NORDKINN ', '58.630', '76.000', '80.000', '82.000', 2, 'j.maldonado', '2016-09-07 21:38:36', 0, 1, '', 0),
(25, 'IG025', '00025', 'SALMON PRECOCINADO AL NATURAL 150 GR', 'SALMON PREC NAT 150G', 2, 2, '100.00', 'LOMO DE SALMON PRECOCINADO AL NATURAL, CONGELADO, EN EMPAQUE AL VACIO 500 GRAMOS MARCA C. DE PATAGONIA.', '48.530', '60.000', '65.000', '70.000', 2, 'j.maldonado', '2016-09-06 19:27:39', 0, 0, '', 0),
(26, 'IG026', '00026', 'LOMO DE CHILEAN SEA BASS <1KG.', 'SEA BASS <1KG.', 2, 2, '625.00', 'LOMO DE CHILEAN SEA BASS CONGELADO CHICO, DE MENOS DE 1 KG. SEGUN PESO', '454.960', '591.450', '615.000', '640.000', 2, 'j.maldonado', '2016-09-07 22:01:29', 0, 0, '', 1),
(27, 'IG027', '00027', 'TROZOS DE BACALAO MORHUA BOLSA 1 KG  APR', 'BACALAO TROZOS 1KG', 2, 1, '1.00', 'TROZOS DE BACALAO MORHUA SIN PIEL Y SIN ESPINAS BOLSA DE 1 KG. APROX CONGELADO. SEGUN PESO', '160.000', '208.000', '216.000', '224.000', 2, 'jesumv', '2016-09-07 22:02:53', 0, 0, '', 1),
(28, 'IG028', '00028', 'LOMO DE BACALAO MORHUA S/PESO', 'BACALAO LOMO >600G', 2, 1, '1.00', 'LOMO DE BACALAO MORHUA SUPERIOR MARCA POLAR SEGUN PESO DE MAS DE 600G.', '336.600', '355.000', '370.000', '380.000', 2, 'j.maldonado', '2016-09-07 22:10:45', 0, 0, '', 1),
(29, 'IG029', '00029', 'FILETITOS DE MERLUZA <250 GR', 'MERLUZA FILETITOS <2', 2, 1, '1.00', 'PORCIONES CONGELADAS DE MERLUZA DE PINCHO SIN PIEL EN FILETITOS SEGUN PESO', '73.500', '95.000', '100.000', '105.000', 2, 'jesumv', '2016-09-07 21:40:11', 0, 0, '', 1),
(30, 'IG030', '00030', 'MANOS DE CANGREJO COCIDAS GRANDES', 'MANOS CANGREJO BOLSA', 2, 1, '2.27', 'MANOS DE CANGREJO COCIDAS PELADAS GRANDES CONGELADAS EN BOLSA DE 2.270 KG. APROX', '630.270', '820.000', '850.000', '880.000', 2, 'jesumv', '2016-09-07 21:40:35', 0, 0, '', 1),
(31, 'IG031', '00031', 'TURBOT FRESCO 1 KG APROX.', 'TURBOT 1 KG', 2, 1, '1.00', 'TURBOT O RODABALLO FRESCO ENTERO S/PESO', '295.440', '385.000', '400.000', '415.000', 2, 'jesumv', '2016-09-07 21:41:03', 0, 0, '', 1),
(32, 'IG032', '8410694150561', 'SALMON AHUMADO 200 GR', 'SALMON AHUM 200G', 2, 2, '200.00', 'SALMON AHUMADO CONGELADO EN SOBRE DE 200 GRAMOS MARCA NORDKINN', '112.630', '145.000', '155.000', '160.000', 2, 'jesumv', '2016-09-07 21:41:14', 0, 1, '', 0),
(33, 'IG033', '00033', 'SALMON AHUMADO 500 GR', 'SALMON AHUM 500G', 2, 2, '500.00', 'SALMON DEL ATLANTICO AHUMADO CONGELADO EN SOBRE DE 500 GRAMOS MARCA ROYAL SEA', '260.680', '340.000', '350.000', '365.000', 2, 'jesumv', '2016-09-07 04:20:27', 0, 1, '', 0),
(34, 'IG034', '7501728027049', 'PIMIENTO MORRON LATA 400GR', 'PIMIENTO MORRON 400G', 3, 2, '400.00', 'PIMIENTOS  MORRONES ENTEROS EN SALMUERA LATA DE 400G MARCA DON AGUSTIN', '15.690', '20.000', '30.000', '40.000', 2, 'jesumv', '2016-09-07 04:12:40', 0, 0, '', 0),
(35, 'IG035', '7501728025014', 'PERAS EN MITADES 820 GR', 'PERAS LATA 820G', 3, 2, '820.00', 'MITADES DE PERAS EN ALMIBAR LATA DE 820G MARCA DON AGUSTIN', '21.660', '25.990', '30.000', '35.000', 2, 'jesumv', '2016-09-07 23:53:38', 0, 0, '', 0),
(36, 'IG036', '00036', 'LOMO DE SALMON FRESCO SEGUN PESO', 'SALMON FRESCO S/PESO', 2, 2, '1.00', 'LOMO DE SALMON FRESCO PORCIONADO S/PESO', '0.290', '0.335', '0.360', '0.380', 2, 'jesumv', '2016-09-07 21:41:42', 0, 0, '', 1),
(37, 'IG037', '00037', 'LOMO DE SALMON CONGELADO S/PESO', 'SALMON CONGELADO S/P', 2, 2, '1.00', 'LOMO DE SALMON CONGELADO, PORCIONADO S/PESO', '0.287', '0.287', '0.310', '0.340', 2, 'jesumv', '2016-09-07 21:41:56', 0, 0, '', 1),
(38, 'IG038', '00038', 'FILETE DE TURBOT CONGELADO SEGUN PESO', 'TURBOT CONG S/PESO', 2, 2, '1.00', 'FILETE DE TURBOT O RODABALLO CONGELADO SEGUN PESO', '0.295', '0.296', '0.320', '0.350', 2, 'jesumv', '2016-09-07 21:42:05', 0, 0, '', 1),
(39, 'IG039', '7501728001148', 'ESPARRAGOS BLANCOS GRUESOS FRASCO 320 GR', 'ESPARRAGOS GRUESOS', 3, 2, '320.00', 'ESPARRAGOS BLANCOS GRUESOS EN SALMUERA FRASCO DE 320G MARCA DON AGUSTIN', '45.050', '48.000', '50.000', '50.000', 2, 'jesumv', '2016-09-07 23:56:58', 0, 0, '', 0),
(40, 'IG040', '7501728028114', 'DURAZNOS EN MITADES 820GR', 'DURAZNOS 820G', 3, 2, '820.00', 'MITADES DE DURAZNOS EN ALMIBAR LATA DE 820 GRAMOS MARCA DON AGUSTIN', '18.660', '22.390', '25.000', '30.000', 2, 'jesumv', '2016-09-07 04:19:01', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `idproveedores` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel` text COLLATE utf8_spanish_ci,
  `contacto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` tinytext COLLATE utf8_spanish_ci,
  `factura` tinyint(1) NOT NULL,
  `diascred` int(3) unsigned NOT NULL,
  `usu` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'usuario del ultimo cambio',
  `fecha_mov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha del ultimo cambio',
  `status` tinyint(2) unsigned NOT NULL COMMENT '0 activo 1 mod  2 baja',
  PRIMARY KEY (`idproveedores`),
  UNIQUE KEY `razÃ³n_social` (`razon_social`,`nom_corto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedores`, `razon_social`, `rfc`, `nom_corto`, `direccion`, `tel`, `contacto`, `email`, `factura`, `diascred`, `usu`, `fecha_mov`, `status`) VALUES
(1, 'QUESOS PADILLA, S.A. DE C.V.', 'PAQ631021', 'JUAN ANGEL', 'RANCHO PANDA NO. 62 COL. HACIENDA DE COYOACAN', '5555940435', 'JUAN ANGEL GONZALEZ', 'juanangelglez@hotmail.com', 0, 15, 'j.maldonado', '2016-09-03 13:10:43', 0),
(2, 'INTERNACIONAL GASTRONOMICA, S.A. DE C.V.', 'IGS990102RR4', 'INTERNACIONAL G', 'TESORO NO. 49 COL. ESTRELLA', '5555873505', 'ELIZABETH BALDOVINOS', 'jmaldonadoca@gmail.com', 1, 0, 'j.maldonado', '2016-08-28 02:43:26', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcats`
--

DROP TABLE IF EXISTS `subcats`;
CREATE TABLE `subcats` (
  `idsubcats` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cat` tinyint(3) unsigned NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usu` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 activo 1 suspendida 99 eliminada',
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `idsubcats` (`idsubcats`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `subcats`
--

INSERT INTO `subcats` (`idsubcats`, `cat`, `nombre`, `usu`, `status`, `fechamov`) VALUES
(1, 1, 'quesos', 'j.maldonado', 0, '2016-08-10 13:22:23'),
(2, 1, 'otros lácteos', 'j.maldonado', 0, '2016-08-10 13:28:09'),
(3, 2, 'frescos', 'j.maldonado', 0, '2016-08-10 13:28:09'),
(4, 2, 'congelados', 'j.maldonado', 0, '2016-08-10 13:28:53'),
(5, 2, 'precocinados', 'j.maldonado', 0, '2016-08-10 13:28:53'),
(6, 2, 'vivos', 'j.maldonado', 0, '2016-08-10 13:30:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

DROP TABLE IF EXISTS `unidades`;
CREATE TABLE `unidades` (
  `idunidades` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) CHARACTER SET latin1 NOT NULL,
  `usu` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`idunidades`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`idunidades`, `nombre`, `usu`, `fechamov`, `status`) VALUES
(1, 'Kilos', '', '2016-06-13 02:31:32', 0),
(2, 'Gramos', '', '2016-06-13 02:31:19', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 =default',
  `nivel` tinyint(2) unsigned NOT NULL COMMENT '1todopoderoso, 2administrador, 10 operaciones, 20 ventas',
  `username` char(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `passcode` blob,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `empresa`, `nivel`, `username`, `passcode`, `nombre`, `email`) VALUES
(1, 0, 1, 'j.maldonado', 0xd85a6f8d79eba885ba2647396c8a525b, 'Jesús Maldonado', 'j.maldonado@vannetti.biz'),
(2, 0, 10, 'jesumv', 0x5e4fcb82532340443ac1fd214848090b, 'Jesús Maldonado', 'j.maldonado@vannetti.biz');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
