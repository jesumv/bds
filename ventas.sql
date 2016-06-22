-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-06-2016 a las 01:30:47
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxp`
--

CREATE TABLE IF NOT EXISTS `cxp` (
  `idcxp` int(11) NOT NULL AUTO_INCREMENT,
  `idmovto` int(10) unsigned NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  PRIMARY KEY (`idcxp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `idgrupos` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  `status` tinyint(2) unsigned NOT NULL COMMENT '0 alta 1 mod 2 baja',
  `usu` varchar(10) NOT NULL,
  PRIMARY KEY (`idgrupos`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`idgrupos`, `nombre`, `status`, `usu`) VALUES
(1, 'Lácteos', 0, ''),
(2, 'Pescados', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `OC`
--

CREATE TABLE IF NOT EXISTS `OC` (
  `idoc` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `idpedidos` int(11) NOT NULL AUTO_INCREMENT,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  PRIMARY KEY (`idpedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `idproductos` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `cbarras` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `grupo` tinyint(3) unsigned NOT NULL,
  `unidad` tinyint(4) NOT NULL,
  `cant` int(5) unsigned NOT NULL,
  `descripcion` longtext COLLATE utf8_spanish_ci NOT NULL,
  `costo` decimal(15,2) NOT NULL,
  `precio1` decimal(15,2) unsigned NOT NULL,
  `precio2` decimal(15,2) unsigned DEFAULT NULL,
  `precio3` decimal(15,2) unsigned DEFAULT NULL,
  `idproveedores` tinyint(4) NOT NULL,
  `usu` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`idproductos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproductos`, `codigo`, `cbarras`, `nombre`, `nom_corto`, `grupo`, `unidad`, `cant`, `descripcion`, `costo`, `precio1`, `precio2`, `precio3`, `idproveedores`, `usu`, `fechamov`, `status`) VALUES
(1, 'QE500', '7501690516053', 'QUESO CAMPESTRE CON EPAZOTE 1/2 KG', 'CAMP EPAZOTE 1/2 K', 1, 2, 500, 'QUESO CAMPESTRE CON EPAZOTE 500G ', '47.50', '55.00', '60.00', '65.00', 1, 'j.maldonado', '2016-06-13 04:54:43', 0),
(2, 'QH500', '7501690516053', 'QUESO CAMPESTRE CON CHIPOTLE 1/2 KG', 'CAMP CHIPOTLE 1/2K', 1, 2, 500, 'QUESO CAMPESTRE CON CHIPOTLE 500g', '47.50', '55.00', '60.00', '65.00', 1, 'j.maldonado', '2016-06-13 04:54:43', 0),
(3, 'QR500', '75016905521057', 'QUESO RANCHERO 1/2 KG', 'RANCHERO 1/2K', 1, 2, 500, 'QUESO RANCHERO DE 500G', '45.00', '55.00', '60.00', '65.00', 1, 'j.maldonado', '2016-06-13 04:44:03', 0),
(4, 'QEN500', '7501690516053', 'QUESO CAMPESTRE ENCHILADO 1/2 KG', 'CAMP ENCHILADO 1/2K', 1, 2, 255, 'QUESO CAMPESTRE ENCHILADO DE 500G', '47.50', '55.00', '60.00', '65.00', 1, 'j.maldonado', '2016-06-13 04:09:31', 0),
(5, 'QPN500', '7501690523051', 'QUESO PANELA DE 1/2 KG', 'PANELA 1/2K', 1, 2, 500, 'QUESO PANELA DE 500 GRAMOS', '45.00', '52.00', '56.00', '60.00', 1, 'j.maldonado', '2016-06-13 04:44:03', 0),
(6, 'QMH500', '75016905520050', 'QUESO MANCHEGO DE 1/2 KG', 'MANCHEGO 1/2K', 1, 2, 500, 'QUESO MANCHEGO DE 500G', '52.00', '60.00', '65.00', '70.00', 1, 'j.maldonado', '2016-06-13 04:19:59', 0),
(7, 'QP500', '7501690516053', 'QUESO CAMPESTRE NATURAL DE 1/2 KG', 'CAMP NATURAL 1/2K', 1, 2, 500, 'QUESO CAMPESTRE NATURAL DE 500 GRAMOS', '46.50', '54.00', '58.00', '63.00', 1, 'j.maldonado', '2016-06-20 03:37:06', 0),
(8, 'QO500', '11111', 'QUESO OAXACA 1/2 KG', 'OAXACA 1/2K', 1, 2, 500, 'QUESO OAXACA DE 500 GRAMOS', '46.50', '54.00', '58.00', '63.00', 1, 'j.maldonado', '2016-06-13 04:45:37', 0),
(9, 'MT250', '111', 'MANTEQUILLA 1/4 KG', 'MANTEQUILLA 1/4K', 1, 2, 250, 'MANTEQUILLA DE 250 GRAMOS', '17.50', '20.00', '22.00', '24.00', 1, 'j.maldonado', '2016-06-20 03:37:43', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
  `idproveedores` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` text COLLATE utf8_spanish_ci,
  `nom_corto` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel` text COLLATE utf8_spanish_ci,
  `contacto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `diascred` int(3) unsigned NOT NULL,
  `usu` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'usuario del ultimo cambio',
  `fecha_mov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha del ultimo cambio',
  `status` tinyint(2) unsigned NOT NULL COMMENT '0 activo 1 mod  2 baja',
  PRIMARY KEY (`idproveedores`),
  UNIQUE KEY `razÃ³n_social` (`razon_social`,`nom_corto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedores`, `razon_social`, `rfc`, `nom_corto`, `direccion`, `tel`, `contacto`, `diascred`, `usu`, `fecha_mov`, `status`) VALUES
(1, 'QUESOS PADILLA, S.A. DE C.V.', 'PAQ631021', 'JUAN ANGEL', 'RANCHO PANDA NO. 62 COL. HACIENDA DE COYOACáN', '5555940435', 'JUAN ANGEL GONZALEZ', 15, 'j.maldonado', '2016-06-13 04:26:09', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE IF NOT EXISTS `unidades` (
  `idunidades` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  `usu` varchar(20) NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`idunidades`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` tinyint(1) unsigned NOT NULL COMMENT '0 =default',
  `nivel` tinyint(2) unsigned NOT NULL COMMENT '1todopoderoso, 2administrador 10 lector',
  `username` char(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `passcode` blob,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `empresa`, `nivel`, `username`, `passcode`, `nombre`) VALUES
(1, 0, 1, 'j.maldonado', 0xd85a6f8d79eba885ba2647396c8a525b, 'Jesús Maldonado');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
