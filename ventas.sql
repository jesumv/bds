-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2016 a las 05:17:48
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

CREATE TABLE `artsoc` (
  `idartsoc` bigint(20) UNSIGNED NOT NULL,
  `idoc` bigint(20) UNSIGNED NOT NULL,
  `idproductos` tinyint(3) UNSIGNED NOT NULL,
  `cant` tinyint(3) UNSIGNED NOT NULL,
  `preciou` decimal(6,2) UNSIGNED NOT NULL,
  `preciot` decimal(6,2) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `artsoc`
--

INSERT INTO `artsoc` (`idartsoc`, `idoc`, `idproductos`, `cant`, `preciou`, `preciot`, `status`) VALUES
(1, 19, 2, 2, '47.50', '95.00', 1),
(2, 19, 6, 2, '52.00', '104.00', 1),
(3, 19, 10, 2, '65.50', '131.00', 1),
(4, 20, 4, 1, '47.50', '47.50', 1),
(5, 20, 1, 2, '47.50', '95.00', 1),
(6, 20, 6, 2, '52.00', '104.00', 1),
(7, 20, 5, 2, '45.00', '90.00', 1),
(8, 21, 4, 1, '47.50', '47.50', 1),
(9, 21, 1, 2, '47.50', '95.00', 1),
(10, 21, 6, 2, '52.00', '104.00', 1),
(11, 21, 5, 2, '45.00', '90.00', 1),
(12, 22, 2, 1, '47.50', '47.50', 1),
(13, 22, 6, 1, '52.00', '52.00', 1),
(14, 22, 3, 1, '45.00', '45.00', 1),
(15, 23, 2, 1, '47.50', '47.50', 1),
(16, 24, 2, 2, '47.50', '95.00', 1),
(17, 25, 2, 1, '47.50', '47.50', 1),
(18, 26, 2, 1, '47.50', '47.50', 1),
(19, 27, 2, 1, '47.50', '47.50', 1),
(20, 28, 2, 1, '47.50', '47.50', 1),
(21, 29, 2, 1, '47.50', '47.50', 1),
(22, 30, 6, 1, '52.00', '52.00', 1),
(23, 31, 2, 1, '47.50', '47.50', 1),
(24, 32, 2, 3, '47.50', '142.50', 1),
(25, 32, 9, 2, '17.50', '35.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxp`
--

CREATE TABLE `cxp` (
  `idcxp` int(11) NOT NULL,
  `idmovto` int(10) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL,
  `total` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `idgrupos` tinyint(4) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL COMMENT '0 alta 1 mod 2 baja',
  `usu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`idgrupos`, `nombre`, `status`, `usu`) VALUES
(1, 'Lácteos', 0, ''),
(2, 'Pescados', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oc`
--

CREATE TABLE `oc` (
  `idoc` bigint(20) UNSIGNED NOT NULL,
  `idproveedores` tinyint(3) UNSIGNED NOT NULL,
  `arts` int(6) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL DEFAULT '0.00',
  `total` decimal(18,2) NOT NULL,
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '1 pedido, 2 surtido, 99 pagado, 999 cancelado',
  `coment` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `oc`
--

INSERT INTO `oc` (`idoc`, `idproveedores`, `arts`, `monto`, `iva`, `total`, `fechamov`, `usu`, `status`, `coment`) VALUES
(2, 1, 1, '47.50', '0.00', '0.00', '2016-07-01 19:45:09', 'j.maldonado', 1, NULL),
(3, 1, 1, '47.50', '0.00', '0.00', '2016-07-01 19:47:07', 'j.maldonado', 1, NULL),
(4, 1, 1, '47.50', '0.00', '47.50', '2016-07-01 20:02:23', 'j.maldonado', 1, NULL),
(5, 1, 1, '47.50', '0.00', '47.50', '2016-07-01 20:07:54', 'j.maldonado', 1, NULL),
(6, 1, 1, '47.50', '0.00', '47.50', '2016-07-01 22:01:09', 'j.maldonado', 1, NULL),
(7, 1, 1, '47.50', '0.00', '47.50', '2016-07-01 22:02:40', 'j.maldonado', 1, NULL),
(8, 1, 1, '52.00', '0.00', '52.00', '2016-07-01 22:09:44', 'j.maldonado', 1, NULL),
(9, 1, 1, '47.50', '0.00', '47.50', '2016-07-01 22:16:35', 'j.maldonado', 1, NULL),
(10, 1, 1, '52.00', '0.00', '52.00', '2016-07-01 22:17:18', 'j.maldonado', 1, NULL),
(11, 1, 1, '17.50', '0.00', '17.50', '2016-07-01 23:35:15', 'j.maldonado', 1, NULL),
(12, 1, 3, '142.50', '0.00', '142.50', '2016-07-01 23:37:00', 'j.maldonado', 1, NULL),
(13, 1, 3, '142.50', '0.00', '142.50', '2016-07-01 23:41:12', 'j.maldonado', 1, NULL),
(14, 1, 3, '142.50', '0.00', '142.50', '2016-07-01 23:42:29', 'j.maldonado', 1, NULL),
(15, 1, 3, '142.50', '0.00', '142.50', '2016-07-01 23:44:36', 'j.maldonado', 1, NULL),
(16, 1, 3, '142.50', '0.00', '142.50', '2016-07-01 23:46:30', 'j.maldonado', 1, NULL),
(17, 1, 6, '339.00', '0.00', '339.00', '2016-07-02 17:42:26', 'j.maldonado', 1, NULL),
(18, 1, 6, '220.00', '0.00', '220.00', '2016-07-02 17:43:36', 'j.maldonado', 1, NULL),
(19, 1, 6, '330.00', '0.00', '330.00', '2016-07-02 17:44:36', 'j.maldonado', 1, NULL),
(20, 1, 7, '336.50', '0.00', '336.50', '2016-07-02 17:46:22', 'j.maldonado', 1, NULL),
(21, 1, 7, '336.50', '0.00', '336.50', '2016-07-02 18:02:20', 'j.maldonado', 1, NULL),
(22, 1, 3, '144.50', '0.00', '144.50', '2016-07-02 18:03:54', 'j.maldonado', 1, NULL),
(23, 1, 1, '47.50', '0.00', '47.50', '2016-07-02 18:08:43', 'j.maldonado', 1, NULL),
(24, 1, 2, '95.00', '0.00', '95.00', '2016-07-02 18:10:49', 'j.maldonado', 1, NULL),
(25, 1, 1, '47.50', '0.00', '47.50', '2016-07-02 18:11:45', 'j.maldonado', 1, NULL),
(26, 1, 1, '47.50', '0.00', '47.50', '2016-07-02 18:12:37', 'j.maldonado', 1, NULL),
(27, 1, 1, '47.50', '0.00', '47.50', '2016-07-02 18:16:41', 'j.maldonado', 1, NULL),
(28, 1, 1, '47.50', '0.00', '47.50', '2016-07-02 18:18:26', 'j.maldonado', 1, NULL),
(29, 1, 1, '47.50', '0.00', '47.50', '2016-07-02 18:23:30', 'j.maldonado', 1, NULL),
(30, 1, 1, '52.00', '0.00', '52.00', '2016-07-02 18:53:04', 'j.maldonado', 1, NULL),
(31, 1, 1, '47.50', '0.00', '47.50', '2016-07-02 18:59:16', 'j.maldonado', 1, NULL),
(32, 1, 5, '177.50', '0.00', '177.50', '2016-07-02 19:02:15', 'j.maldonado', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedidos` bigint(20) UNSIGNED NOT NULL,
  `idclientes` tinyint(3) UNSIGNED NOT NULL,
  `arts` int(6) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `fechamov` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(25) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '1 pedido, 2 surtido, 99 pagado, 999 cancelado',
  `coment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproductos` tinyint(3) UNSIGNED NOT NULL,
  `codigo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `cbarras` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `grupo` tinyint(3) UNSIGNED NOT NULL,
  `unidad` tinyint(4) NOT NULL,
  `cant` int(5) UNSIGNED NOT NULL,
  `descripcion` longtext COLLATE utf8_spanish_ci NOT NULL,
  `costo` decimal(15,2) NOT NULL,
  `precio1` decimal(15,2) UNSIGNED NOT NULL,
  `precio2` decimal(15,2) UNSIGNED DEFAULT NULL,
  `precio3` decimal(15,2) UNSIGNED DEFAULT NULL,
  `idproveedores` tinyint(4) NOT NULL,
  `usu` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(9, 'MT250', '111', 'MANTEQUILLA 1/4 KG', 'MANTEQUILLA 1/4K', 1, 2, 250, 'MANTEQUILLA DE 250 GRAMOS', '17.50', '20.00', '22.00', '24.00', 1, 'j.maldonado', '2016-06-20 03:37:43', 0),
(10, 'QPN1000C', '11234', 'QUESO PANELA COMERCIAL 1KG', 'PANELA COMERC 1K', 1, 1, 1, 'QUESO PANELA COMERCIAL BARRA DE 1KG', '65.50', '75.00', '79.00', '82.00', 1, 'j.maldonado', '2016-06-28 21:55:20', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedores` tinyint(3) UNSIGNED NOT NULL,
  `razon_social` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` text COLLATE utf8_spanish_ci,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel` text COLLATE utf8_spanish_ci,
  `contacto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `diascred` int(3) UNSIGNED NOT NULL,
  `usu` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'usuario del ultimo cambio',
  `fecha_mov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha del ultimo cambio',
  `status` tinyint(2) UNSIGNED NOT NULL COMMENT '0 activo 1 mod  2 baja'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedores`, `razon_social`, `rfc`, `nom_corto`, `direccion`, `tel`, `contacto`, `diascred`, `usu`, `fecha_mov`, `status`) VALUES
(1, 'QUESOS PADILLA, S.A. DE C.V.', 'PAQ631021', 'JUAN ANGEL', 'RANCHO PANDA NO. 62 COL. HACIENDA DE COYOACAN', '5555940435', 'JUAN ANGEL GONZALEZ', 15, 'j.maldonado', '2016-07-03 03:15:50', 0),
(2, 'INTERNACIONAL GASTRONOMICA, S.A. DE C.V.', 'IGS990102RR4', 'INTERNACIONAL G', 'TESORO NO. 49 COL. ESTRELLA', '5555873505', 'ELIZABETH BALDOVINOS', 0, 'j.maldonado', '2016-07-03 03:15:26', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `idunidades` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `usu` varchar(20) NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `empresa` tinyint(1) UNSIGNED NOT NULL COMMENT '0 =default',
  `nivel` tinyint(2) UNSIGNED NOT NULL COMMENT '1todopoderoso, 2administrador 10 lector',
  `username` char(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `passcode` blob,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `empresa`, `nivel`, `username`, `passcode`, `nombre`) VALUES
(1, 0, 1, 'j.maldonado', 0xd85a6f8d79eba885ba2647396c8a525b, 'Jesús Maldonado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artsoc`
--
ALTER TABLE `artsoc`
  ADD UNIQUE KEY `idartsoc` (`idartsoc`);

--
-- Indices de la tabla `cxp`
--
ALTER TABLE `cxp`
  ADD PRIMARY KEY (`idcxp`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idgrupos`);

--
-- Indices de la tabla `oc`
--
ALTER TABLE `oc`
  ADD PRIMARY KEY (`idoc`);

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
  MODIFY `idartsoc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `cxp`
--
ALTER TABLE `cxp`
  MODIFY `idcxp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `idgrupos` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `oc`
--
ALTER TABLE `oc`
  MODIFY `idoc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedidos` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproductos` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedores` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `idunidades` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
