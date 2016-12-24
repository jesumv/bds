-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-12-2016 a las 22:32:55
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
  `status` tinyint(4) NOT NULL COMMENT '1 pedido 2 surtido 3 salida 99 cancelado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artsped`
--

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
-- Estructura de tabla para la tabla `catctasat`
--

CREATE TABLE `catctasat` (
  `idcat` bigint(20) UNSIGNED NOT NULL,
  `CodAgrup` decimal(6,2) NOT NULL,
  `NumCta` decimal(6,2) NOT NULL,
  `Desc` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `SubCtaDe` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nivel` int(1) UNSIGNED DEFAULT NULL,
  `Natur` varchar(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentabanco`
--

CREATE TABLE `cuentabanco` (
  `idcuentabanco` bigint(20) UNSIGNED NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `banco` text COLLATE utf8_spanish_ci,
  `no` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cvtas`
--

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
-- Estructura de tabla para la tabla `diario`
--

CREATE TABLE `diario` (
  `iddiario` bigint(20) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `subcuenta` int(10) UNSIGNED DEFAULT NULL,
  `referencia` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `aux` decimal(15,2) NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL,
  `facturar` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponible`
--

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

CREATE TABLE `grupos` (
  `idgrupos` tinyint(4) NOT NULL,
  `nombre` varchar(15) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL COMMENT '0 alta 1 mod 2 baja',
  `usu` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

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

CREATE TABLE `oc` (
  `idoc` bigint(20) UNSIGNED NOT NULL,
  `idproveedores` tinyint(3) UNSIGNED NOT NULL,
  `arts` int(6) UNSIGNED NOT NULL,
  `monto` decimal(20,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL,
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '1 pedido, 5 mail env 10 surtido parc, 11  surt total,99 pagado, 999 cancelado',
  `coment` text CHARACTER SET latin1,
  `correooc` tinyint(1) NOT NULL DEFAULT '0',
  `factura` text COLLATE utf8_spanish_ci COMMENT 'factura recibida por la oc',
  `remision` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `foliomov` text COLLATE utf8_spanish_ci COMMENT 'folio del movimiento segun comprobante',
  `facturar` tinyint(1) NOT NULL,
  `credito` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `idparametros` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `valornum` decimal(6,2) DEFAULT NULL,
  `valorent` tinyint(4) DEFAULT NULL,
  `valortexto` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '1 pedido, 2 surtido, 99 pagado, 999 cancelado',
  `coment` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproductos` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `cbarras` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nom_cat` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `grupo` tinyint(3) UNSIGNED NOT NULL,
  `unidad` tinyint(4) NOT NULL,
  `cant` decimal(7,2) UNSIGNED NOT NULL,
  `descripcion` longtext COLLATE utf8_spanish_ci NOT NULL,
  `costo` decimal(16,4) NOT NULL,
  `precio1` decimal(15,3) UNSIGNED NOT NULL,
  `precio2` decimal(15,3) UNSIGNED DEFAULT NULL,
  `precio3` decimal(15,3) UNSIGNED DEFAULT NULL,
  `idproveedores` tinyint(4) NOT NULL,
  `usu` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) UNSIGNED NOT NULL COMMENT '0 ACTIVO, 1 INACTIVO 99 CANC',
  `iva` tinyint(1) NOT NULL,
  `foto` longblob NOT NULL,
  `speso` tinyint(1) NOT NULL COMMENT 'indica si el producto debe pesar al recibirlo',
  `spesov` tinyint(1) NOT NULL,
  `selecciona` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcats`
--

CREATE TABLE `subcats` (
  `idsubcats` bigint(20) UNSIGNED NOT NULL,
  `cat` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usu` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 activo 1 suspendida 99 eliminada',
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `idunidades` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(15) CHARACTER SET latin1 NOT NULL,
  `usu` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

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
-- Indices de la tabla `catctasat`
--
ALTER TABLE `catctasat`
  ADD UNIQUE KEY `idcat` (`idcat`);

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
-- Indices de la tabla `diario`
--
ALTER TABLE `diario`
  ADD UNIQUE KEY `iddiario` (`iddiario`);

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
  ADD PRIMARY KEY (`idproductos`),
  ADD UNIQUE KEY `idproductos` (`idproductos`);

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
  MODIFY `idartsoc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `artsped`
--
ALTER TABLE `artsped`
  MODIFY `idartsped` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `catctasat`
--
ALTER TABLE `catctasat`
  MODIFY `idcat` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
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
-- AUTO_INCREMENT de la tabla `diario`
--
ALTER TABLE `diario`
  MODIFY `iddiario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
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
  MODIFY `idproductos` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
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
