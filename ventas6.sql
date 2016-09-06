-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-09-2016 a las 06:37:56
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artsoc`
--

DROP TABLE IF EXISTS `artsoc`;
CREATE TABLE `artsoc` (
  `idartsoc` bigint(20) UNSIGNED NOT NULL,
  `idoc` bigint(20) UNSIGNED NOT NULL,
  `idproductos` tinyint(3) UNSIGNED NOT NULL,
  `cant` tinyint(3) UNSIGNED NOT NULL,
  `preciou` decimal(6,2) UNSIGNED NOT NULL,
  `preciot` decimal(6,2) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 pedido 2 surtido 3 salida 99 cancelado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artsped`
--

DROP TABLE IF EXISTS `artsped`;
CREATE TABLE `artsped` (
  `idartsped` bigint(20) UNSIGNED NOT NULL,
  `idpedido` bigint(20) UNSIGNED NOT NULL,
  `idproductos` tinyint(3) UNSIGNED NOT NULL,
  `cant` tinyint(3) UNSIGNED NOT NULL,
  `preciou` decimal(6,2) UNSIGNED NOT NULL,
  `preciot` decimal(6,2) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 pedido 99 surtido 3 salida 999 cancelado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `idclientes` bigint(20) UNSIGNED NOT NULL,
  `razon social` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `domcalle` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domnoext` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domcol` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domedo` int(10) UNSIGNED DEFAULT NULL,
  `domcp` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel1` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel2` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cel` bigint(15) UNSIGNED DEFAULT NULL,
  `contacto` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nivel` tinyint(3) UNSIGNED NOT NULL,
  `usu` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `diascred` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '1 activo 2 suspendido 99 cancelado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `idcuentabanco` bigint(20) UNSIGNED NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `banco` text COLLATE utf8_spanish_ci,
  `no` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `idcvtas` int(11) NOT NULL,
  `idmovto` int(10) UNSIGNED NOT NULL,
  `idproveedores` tinyint(3) UNSIGNED DEFAULT NULL,
  `idclientes` tinyint(3) UNSIGNED DEFAULT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxc`
--

DROP TABLE IF EXISTS `cxc`;
CREATE TABLE `cxc` (
  `idcxc` int(11) NOT NULL,
  `idmovto` int(10) UNSIGNED NOT NULL,
  `idclientes` tinyint(3) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) UNSIGNED NOT NULL,
  `total` decimal(15,2) UNSIGNED NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxp`
--

DROP TABLE IF EXISTS `cxp`;
CREATE TABLE `cxp` (
  `idcxp` int(11) NOT NULL,
  `idmovto` int(10) UNSIGNED NOT NULL,
  `idproveedores` tinyint(3) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) UNSIGNED NOT NULL,
  `total` decimal(15,2) UNSIGNED NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponible`
--

DROP TABLE IF EXISTS `disponible`;
CREATE TABLE `disponible` (
  `iddisponible` int(11) NOT NULL,
  `idmovto` int(10) UNSIGNED NOT NULL,
  `idproveedores` tinyint(3) UNSIGNED DEFAULT NULL,
  `idclientes` tinyint(3) UNSIGNED DEFAULT NULL,
  `cuenta` tinyint(3) UNSIGNED NOT NULL COMMENT '1 caja 2 bancomer',
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `idgrupos` tinyint(4) NOT NULL,
  `nombre` varchar(15) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL COMMENT '0 alta 1 mod 2 baja',
  `usu` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `idingresos` int(11) NOT NULL,
  `idmovto` int(10) UNSIGNED NOT NULL,
  `idproveedores` tinyint(3) UNSIGNED DEFAULT NULL,
  `idclientes` tinyint(3) UNSIGNED DEFAULT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE `inventario` (
  `idinventario` bigint(20) UNSIGNED NOT NULL,
  `idproductos` tinyint(3) UNSIGNED NOT NULL,
  `tipomov` tinyint(3) UNSIGNED NOT NULL COMMENT '1 entrada 2 salida 3 ajuste',
  `cant` int(11) NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `comentarios` longtext COLLATE utf8_spanish_ci,
  `idoc` bigint(20) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `debe` decimal(15,2) DEFAULT NULL,
  `haber` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ivaacred`
--

DROP TABLE IF EXISTS `ivaacred`;
CREATE TABLE `ivaacred` (
  `idivatrans` int(11) NOT NULL,
  `idmovto` int(10) UNSIGNED NOT NULL,
  `idproveedores` tinyint(3) UNSIGNED NOT NULL,
  `fact` text CHARACTER SET latin1,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 acreditable  1 x acreditar',
  `debe` decimal(15,2) DEFAULT NULL,
  `haber` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ivatrans`
--

DROP TABLE IF EXISTS `ivatrans`;
CREATE TABLE `ivatrans` (
  `idivatrans` int(11) NOT NULL,
  `idmovto` int(10) UNSIGNED NOT NULL,
  `idclientes` tinyint(3) UNSIGNED NOT NULL,
  `fact` text CHARACTER SET latin1,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 trasladado 1 x trasladar',
  `debe` decimal(15,2) DEFAULT NULL,
  `haber` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listasp`
--

DROP TABLE IF EXISTS `listasp`;
CREATE TABLE `listasp` (
  `idlistasp` bigint(20) UNSIGNED NOT NULL,
  `restricciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `cliente` tinyint(3) UNSIGNED NOT NULL,
  `destinatario` mediumtext COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oc`
--

DROP TABLE IF EXISTS `oc`;
CREATE TABLE `oc` (
  `idoc` bigint(20) UNSIGNED NOT NULL,
  `idproveedores` tinyint(3) UNSIGNED NOT NULL,
  `arts` int(6) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL DEFAULT '0.00',
  `total` decimal(18,2) NOT NULL,
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '1 pedido, 5 mail env 10 surtido parc, 11  surt total,99 pagado, 999 cancelado',
  `coment` text CHARACTER SET latin1,
  `correooc` tinyint(1) NOT NULL DEFAULT '0',
  `fact` text COLLATE utf8_spanish_ci COMMENT 'factura recibida por la oc',
  `foliomov` text COLLATE utf8_spanish_ci COMMENT 'folio del movimiento segun comprobante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

DROP TABLE IF EXISTS `parametros`;
CREATE TABLE `parametros` (
  `idparametros` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `valornum` decimal(6,2) DEFAULT NULL,
  `valorent` tinyint(4) DEFAULT NULL,
  `valortexto` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `idpedidos` bigint(20) UNSIGNED NOT NULL,
  `idclientes` tinyint(3) UNSIGNED NOT NULL,
  `arts` int(6) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '1 pedido, 2 surtido, 99 pagado, 999 cancelado',
  `coment` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `idproductos` tinyint(3) UNSIGNED NOT NULL,
  `codigo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `cbarras` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `grupo` tinyint(3) UNSIGNED NOT NULL,
  `unidad` tinyint(4) NOT NULL,
  `cant` decimal(7,2) UNSIGNED NOT NULL,
  `descripcion` longtext COLLATE utf8_spanish_ci NOT NULL,
  `costo` decimal(15,2) NOT NULL,
  `precio1` decimal(15,2) UNSIGNED NOT NULL,
  `precio2` decimal(15,2) UNSIGNED DEFAULT NULL,
  `precio3` decimal(15,2) UNSIGNED DEFAULT NULL,
  `idproveedores` tinyint(4) NOT NULL,
  `usu` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) UNSIGNED NOT NULL COMMENT '0 ACTIVO, 1 INACTIVO 99 CANC',
  `iva` tinyint(1) NOT NULL,
  `foto` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproductos`, `codigo`, `cbarras`, `nombre`, `nom_corto`, `grupo`, `unidad`, `cant`, `descripcion`, `costo`, `precio1`, `precio2`, `precio3`, `idproveedores`, `usu`, `fechamov`, `status`, `iva`, `foto`) VALUES
(1, 'QE500', '7501690516053', 'QUESO CAMPESTRE CON EPAZOTE 1/2 KG', 'CAMP EPAZOTE 1/2 K', 1, 2, '500.00', 'QUESO CAMPESTRE CON EPAZOTE 500G ', '47.50', '55.00', '60.00', '65.00', 1, 'j.maldonado', '2016-08-28 18:13:24', 0, 1, ''),
(2, 'QH500', '7501690516053', 'QUESO CAMPESTRE CON CHIPOTLE 1/2 KG', 'CAMP CHIPOTLE 1/2K', 1, 2, '500.00', 'QUESO CAMPESTRE CON CHIPOTLE 500g', '47.50', '55.00', '60.00', '65.00', 1, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(3, 'QR500', '75016905521057', 'QUESO RANCHERO 1/2 KG', 'RANCHERO 1/2K', 1, 2, '500.00', 'QUESO RANCHERO DE 500G', '45.00', '55.00', '60.00', '65.00', 1, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(4, 'QEN500', '7501690516053', 'QUESO CAMPESTRE ENCHILADO 1/2 KG', 'CAMP ENCHILADO 1/2K', 1, 2, '255.00', 'QUESO CAMPESTRE ENCHILADO DE 500G', '47.50', '55.00', '60.00', '65.00', 1, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(5, 'QPN500', '7501690523051', 'QUESO PANELA DE 1/2 KG', 'PANELA 1/2K', 1, 2, '500.00', 'QUESO PANELA DE 500 GRAMOS', '45.00', '52.00', '56.00', '60.00', 1, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(6, 'QMH500', '75016905520050', 'QUESO MANCHEGO DE 1/2 KG', 'MANCHEGO 1/2K', 1, 2, '500.00', 'QUESO MANCHEGO DE 500G', '52.00', '60.00', '65.00', '70.00', 1, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(7, 'QP500', '7501690516053', 'QUESO CAMPESTRE NATURAL DE 1/2 KG', 'CAMP NATURAL 1/2K', 1, 2, '500.00', 'QUESO CAMPESTRE NATURAL DE 500 GRAMOS', '46.50', '54.00', '58.00', '63.00', 1, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(8, 'QO500', '7501690522054', 'QUESO OAXACA 1/2 KG', 'OAXACA 1/2K', 1, 2, '500.00', 'QUESO OAXACA DE 500 GRAMOS', '46.50', '54.00', '58.00', '63.00', 1, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(9, 'MT250', '111', 'MANTEQUILLA 1/4 KG', 'MANTEQUILLA 1/4K', 1, 2, '250.00', 'MANTEQUILLA DE 250 GRAMOS', '17.50', '20.00', '22.00', '24.00', 1, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(10, 'QPN1000C', '11234', 'QUESO PANELA COMERCIAL 1KG', 'PANELA COMERC 1K', 1, 1, '1.00', 'QUESO PANELA COMERCIAL BARRA DE 1KG', '65.50', '75.00', '79.00', '82.00', 1, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(11, 'IG011', '00011', 'LOMO SALMON FRESCO CBV 1 KG. APROX', 'SALMON FRESCO CBV 1K', 2, 1, '1.00', 'LOMO DE SALMON FRESCO CON BOLSA DE VACIO, SEGUN PESO DE 1.3 A 1.8 KG,', '286.91', '372.00', '387.00', '400.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 1, 1, ''),
(12, 'IG012', '00012', 'MERLUZA DE PINCHO SIN PIEL 140G', 'MERLUZA PORC 140 GR', 2, 2, '140.00', 'PORCION DE MERLUZA DE PINCHO SIN PIEL DE 140 A 160 GRAMOS CONGELADAS, AL VACIO, SEGUN PESO', '73.50', '95.00', '100.00', '105.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(13, 'IG013', '00013', 'TROZOS DE MERLUZA DE PINCHO 2KG', 'MERLUZA TR 2KG', 2, 1, '2.00', 'TROZOS DE MERLUZA DE PINCHO SIN PIEL, CONGELADA EN BOLSA DE 2 KG', '96.00', '125.00', '130.00', '135.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(14, 'IG014', '00014', 'VIEIRAS CONGELADAS BOLSA 1KG', 'VIEIRAS CONG 1K', 2, 1, '1.00', 'VIEIRAS CON CORAL Y CONCHA, CONGELADAS, EN BOLSA DE 1KG.', '191.46', '250.00', '260.00', '270.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(15, 'IG015', '00015', 'MEJILLONES AL VINO BLANCO 50O GR', 'MEJILLONES VINO 500G', 2, 2, '500.00', 'MEJILLONES PRECOCINADOS CONGELADOS AL VINO BLANCO MARCA NORDKINN EN BOLSA DE 500 GRAMOS', '110.41', '145.00', '150.00', '155.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(16, 'IG016', '00016', 'MEJILLONES EN SALSA DE TOMATE 500 GR', 'MEJILLONES SALSA 500', 2, 2, '500.00', 'MEJILLONES PRECOCINADOS CONGELADOS EN SALSA DE TOMATE Y ENELDO MARCA NORDKINN EN BOLSA DE 500 GRAMOS', '110.41', '145.00', '150.00', '155.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(17, 'IG017', '00017', 'PAMPANO AL NATURAL 100 GR', 'PAMPANO NAT 100G', 2, 2, '100.00', 'PAMPANO PRECOCINADO AL NATURAL, CONGELADO EN PORCION INVIVIDUAL DE 100 GRAMOS MARCA C. DE PATAGONIA', '32.36', '40.00', '45.00', '50.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(18, 'IG018', '00018', 'SALMON PRECOCINADO AL NATURAL 100 GR', 'SALMON PREC NAT 100G', 2, 2, '100.00', 'LOMO DE SALMON PRECOCINADO AL NATURAL, CONGELADO, EN EMPAQUE AL VACIO 100 GRAMOS MARCA C. DE PATAGONIA.', '32.36', '40.00', '45.00', '50.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(19, 'IG019', '00019', 'SALMON PRECOCINADO AL TERIYAKI 100 GR', 'SALMON TERIYAKI 100G', 2, 2, '100.00', 'LOMO DE SALMON PRECOCINADO AL TERIYAKI, CONGELADO, EN EMPAQUE AL VACIO 100 GRAMOS MARCA C. DE PATAGONIA', '27.47', '40.00', '45.00', '50.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(20, 'IG020', '0020', 'TARTARE DE SALMON', 'TARTARE SALMON', 2, 2, '90.00', 'TARTARE DE CARNE DE SALMON PRECOCINADA, PORCION DE 90 GRAMOS.', '28.42', '35.00', '38.00', '40.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(21, 'IG021', '00021', 'WELLINGTON DE SALMON', 'WELLINGTON SALMON', 2, 2, '220.00', 'WELLINGTON DE SALMON PRECOCINADO, CONGELADO, EN PORCION DE 220 GRAMOS MARCA C. DE PATAGONIA.', '42.38', '55.00', '58.00', '60.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(22, 'IG022', '00022', 'LOMO DE SALMON FRESCO SBV 1.3 A 1.8 KG', 'SALMON FRESCO SBV 1.', 2, 1, '1.30', 'LOMO DE SALMON FRESCO SIN BOLSA DE VACIO DE 1.3 A 1.8 KG SEGUN PESO', '286.91', '372.00', '387.00', '400.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(23, 'IG023', '00023', 'LOMO DE SALMON CONGELADO SBV 1.3 A 1.8 K', 'SALMON CONG SBV 1.3K', 2, 1, '1.30', 'LOMO DE SALMON CONGELADO SIN BOLSA DE VACIO, DE 1.3 A 1.8 KG SEGUN PESO.', '286.91', '372.00', '387.00', '400.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 1, 1, ''),
(24, 'IG024', '8410694150455', 'SALMON AHUMADO REBANADO 100 GR', 'SALMON AHUM 100G', 2, 2, '100.00', 'SALMON AHUMADO REBANADO CONGELADO EMPAQUE AL VACIO PORTION CONTROL 100 GRAMOS MARCA NORDKINN ', '58.63', '76.00', '80.00', '82.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(25, 'IG025', '00025', 'SALMON PRECOCINADO AL NATURAL 150 GR', 'SALMON PREC NAT 150G', 2, 2, '100.00', 'LOMO DE SALMON PRECOCINADO AL NATURAL, CONGELADO, EN EMPAQUE AL VACIO 500 GRAMOS MARCA C. DE PATAGONIA.', '32.36', '40.00', '45.00', '50.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(26, 'IG026', '00026', 'LOMO DE CHILEAN SEA BASS <1KG.', 'SEA BASS <1KG.', 2, 2, '625.00', 'LOMO DE CHILEAN SEA BASS CONGELADO CHICO, DE MENOS DE 1 KG.', '454.96', '454.96', '454.96', '454.96', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(27, 'IG027', '00027', 'TROZOS DE BACALAO MORHUA BOLSA 1 KG', 'BACALAO TROZOS 1KG', 2, 1, '1.00', 'TROZOS DE BACALAO MORHUA SIN PIEL Y SIN ESPINAS BOLSA DE 1 KG. CONGELADO.', '160.00', '208.00', '208.00', '208.00', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, ''),
(28, 'IG028', '00028', 'LOMO DE BACALAO MORHUA S/PESO', 'BACALAO LOMO >600G', 2, 2, '600.00', 'LOMO DE BACALAO MORHUA SUPERIOR MARCA POLAR SEGúN PESO DE + DE 600G.', '336.60', '437.58', '437.58', '437.58', 2, 'j.maldonado', '2016-08-26 16:56:23', 0, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `idproveedores` tinyint(3) UNSIGNED NOT NULL,
  `razon_social` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel` text COLLATE utf8_spanish_ci,
  `contacto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` tinytext COLLATE utf8_spanish_ci,
  `factura` tinyint(1) NOT NULL,
  `diascred` int(3) UNSIGNED NOT NULL,
  `usu` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'usuario del ultimo cambio',
  `fecha_mov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha del ultimo cambio',
  `status` tinyint(2) UNSIGNED NOT NULL COMMENT '0 activo 1 mod  2 baja'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `idsubcats` bigint(20) UNSIGNED NOT NULL,
  `cat` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usu` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 activo 1 suspendida 99 eliminada',
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `idunidades` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(15) CHARACTER SET latin1 NOT NULL,
  `usu` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `id` int(11) NOT NULL,
  `empresa` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 =default',
  `nivel` tinyint(2) UNSIGNED NOT NULL COMMENT '1todopoderoso, 2administrador, 10 operaciones, 20 ventas',
  `username` char(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `passcode` blob,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `empresa`, `nivel`, `username`, `passcode`, `nombre`, `email`) VALUES
(1, 0, 1, 'j.maldonado', 0xd85a6f8d79eba885ba2647396c8a525b, 'Jesús Maldonado', 'j.maldonado@vannetti.biz'),
(2, 0, 10, 'jesumv', 0x5e4fcb82532340443ac1fd214848090b, 'Jesús Maldonado', 'j.maldonado@vannetti.biz');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artsoc`
--
ALTER TABLE `artsoc`
  ADD UNIQUE KEY `idartsoc` (`idartsoc`);

--
-- Indices de la tabla `artsped`
--
ALTER TABLE `artsped`
  ADD UNIQUE KEY `idartsoc` (`idartsped`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD UNIQUE KEY `idclientes` (`idclientes`);

--
-- Indices de la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
  ADD UNIQUE KEY `idcuentabanco` (`idcuentabanco`);

--
-- Indices de la tabla `cvtas`
--
ALTER TABLE `cvtas`
  ADD PRIMARY KEY (`idcvtas`);

--
-- Indices de la tabla `cxc`
--
ALTER TABLE `cxc`
  ADD PRIMARY KEY (`idcxc`);

--
-- Indices de la tabla `cxp`
--
ALTER TABLE `cxp`
  ADD PRIMARY KEY (`idcxp`);

--
-- Indices de la tabla `disponible`
--
ALTER TABLE `disponible`
  ADD PRIMARY KEY (`iddisponible`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idgrupos`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`idingresos`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD UNIQUE KEY `idinventario` (`idinventario`);

--
-- Indices de la tabla `ivaacred`
--
ALTER TABLE `ivaacred`
  ADD PRIMARY KEY (`idivatrans`);

--
-- Indices de la tabla `ivatrans`
--
ALTER TABLE `ivatrans`
  ADD PRIMARY KEY (`idivatrans`);

--
-- Indices de la tabla `listasp`
--
ALTER TABLE `listasp`
  ADD UNIQUE KEY `idlistasp` (`idlistasp`);

--
-- Indices de la tabla `oc`
--
ALTER TABLE `oc`
  ADD PRIMARY KEY (`idoc`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD UNIQUE KEY `idparametros` (`idparametros`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedidos`),
  ADD UNIQUE KEY `idpedidos` (`idpedidos`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproductos`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedores`),
  ADD UNIQUE KEY `razÃ³n_social` (`razon_social`,`nom_corto`);

--
-- Indices de la tabla `subcats`
--
ALTER TABLE `subcats`
  ADD UNIQUE KEY `idsubcats` (`idsubcats`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`idunidades`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artsoc`
--
ALTER TABLE `artsoc`
  MODIFY `idartsoc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `artsped`
--
ALTER TABLE `artsped`
  MODIFY `idartsped` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idclientes` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
  MODIFY `idcuentabanco` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cvtas`
--
ALTER TABLE `cvtas`
  MODIFY `idcvtas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cxc`
--
ALTER TABLE `cxc`
  MODIFY `idcxc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cxp`
--
ALTER TABLE `cxp`
  MODIFY `idcxp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `disponible`
--
ALTER TABLE `disponible`
  MODIFY `iddisponible` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `idgrupos` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `idingresos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idinventario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ivaacred`
--
ALTER TABLE `ivaacred`
  MODIFY `idivatrans` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ivatrans`
--
ALTER TABLE `ivatrans`
  MODIFY `idivatrans` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `listasp`
--
ALTER TABLE `listasp`
  MODIFY `idlistasp` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `oc`
--
ALTER TABLE `oc`
  MODIFY `idoc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `idparametros` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedidos` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproductos` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedores` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `subcats`
--
ALTER TABLE `subcats`
  MODIFY `idsubcats` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `idunidades` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
