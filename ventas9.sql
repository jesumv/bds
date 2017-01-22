-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-01-2017 a las 04:31:39
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.19

--
-- antes de eliminar tablas cont
--
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

--
-- Truncar tablas antes de insertar `artsoc`
--

TRUNCATE TABLE `artsoc`;
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
  `status` tinyint(4) NOT NULL COMMENT '1 pedido 10xsurtir 99 surtido 3 salida 999 cancelado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `artsped`
--

TRUNCATE TABLE `artsped`;
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
  `Natur` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `R` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `catctasat`
--

TRUNCATE TABLE `catctasat`;
--
-- Volcado de datos para la tabla `catctasat`
--

INSERT INTO `catctasat` (`idcat`, `CodAgrup`, `NumCta`, `Desc`, `SubCtaDe`, `Nivel`, `Natur`, `R`) VALUES
(1, '100.00', '100.00', 'ACTIVO', NULL, NULL, 'D', 0),
(2, '100.01', '100.01', 'ACTIVO A CORTO PLAZO', NULL, NULL, 'D', 0),
(3, '101.00', '101.00', 'CAJA', NULL, 1, 'D', 0),
(4, '101.01', '101.01', 'CAJA Y EFECTIVO', NULL, 2, 'D', 0),
(5, '102.00', '102.00', 'BANCOS', NULL, 1, 'D', 0),
(6, '102.01', '102.01', 'BANCOS NACIONALES', NULL, 2, 'D', 0),
(7, '115.00', '115.00', 'INVENTARIO', NULL, 1, 'D', 0),
(8, '115.01', '115.01', 'INVENTARIO', NULL, 2, 'D', 0),
(9, '118.00', '118.00', 'IMPUESTOS ACREDITABLES PAGADOS', NULL, 1, 'D', 0),
(10, '118.01', '118.01', 'IVA ACREDITABLE PAGADO', NULL, 2, 'D', 0),
(11, '119.00', '119.00', 'IMPUESTOS ACREDITABLES POR PAGAR', NULL, 1, 'D', 0),
(12, '119.01', '119.01', 'IVA PENDIENTE DE PAGO', NULL, 2, 'D', 0),
(13, '200.00', '200.00', 'PASIVO', NULL, NULL, 'A', 0),
(14, '200.01', '200.01', 'PASIVO A CORTO PLAZO', NULL, NULL, 'A', 0),
(15, '201.00', '201.00', 'PROVEEDORES', NULL, 1, 'A', 0),
(16, '201.01', '201.01', 'PROVEEDORES NACIONALES', NULL, 2, 'A', 0),
(17, '105.00', '105.00', 'CLIENTES', NULL, 1, 'D', 0),
(18, '105.01', '105.01', 'CLIENTES NACIONALES', NULL, 2, 'D', 0),
(19, '208.00', '208.00', 'IMPUESTOS TRASLADADOS COBRADOS', NULL, 1, 'A', 0),
(20, '208.01', '208.01', 'IVA TRASLADADO COBRADO', NULL, 2, 'A', 0),
(21, '209.00', '209.00', 'INPUESTOS TRASLADADOS NO COBRADOS', NULL, 1, 'A', 0),
(22, '209.01', '209.01', 'IVA TRASLADADO NO COBRADO', NULL, 2, 'A', 0),
(23, '213.00', '213.00', 'IMPUESTOS Y DERECHOS POR PAGAR', NULL, 1, 'A', 0),
(24, '213.01', '213.01', 'IVA POR PAGAR', NULL, 2, 'A', 0),
(25, '300.00', '300.00', 'CAPITAL CONTABLE', NULL, NULL, 'A', 0),
(26, '302.00', '302.00', 'PATRIMONIO', NULL, 1, 'A', 0),
(27, '302.01', '302.01', 'PATRIMONIO', NULL, 2, 'A', 0),
(28, '304.00', '304.00', 'RESULTADO DE EJERCICIOS ANTERIORES', NULL, 1, 'A', 0),
(29, '304.01', '304.01', 'UTILIDAD DE EJERCICIOS ANTERIORES', NULL, 2, 'A', 0),
(30, '304.02', '304.02', 'PERDIDA DE EJERCICIOS ANTERIORES', NULL, 2, 'A', 0),
(31, '305.00', '305.00', 'RESULTADO DEL EJERCICIO', NULL, 1, 'A', 0),
(32, '305.01', '305.01', 'UTILIDAD DEL EJERCICIO', NULL, 2, 'A', 0),
(33, '305.02', '305.02', 'PERDIDA DEL EJERCICIO', NULL, 2, 'A', 0),
(34, '305.03', '305.03', 'RESULTADO INTEGRAL', NULL, 2, 'A', 0),
(35, '400.00', '400.00', 'INGRESOS', NULL, NULL, 'A', 0),
(36, '401.00', '401.00', 'INGRESOS', NULL, 1, 'A', 0),
(37, '401.01', '401.01', 'VENTAS GRAVADAS A LA TASA GENERAL', NULL, 2, 'A', 0),
(38, '401.04', '401.04', 'VENTAS GRAVADAS AL 0%', NULL, 2, 'A', 0),
(39, '402.00', '402.00', 'DEVOLUCIONES, DESCUENTOS O BONIFICACIONES SOBRE INGRESOS', NULL, 1, 'A', 0),
(40, '402.01', '402.01', 'DEVOLUCIONES, DESCUENTOS O BONIFICACIONES SOBRE VENTAS A LA TASA GENERAL', NULL, 2, 'A', 0),
(41, '402.02', '402.02', 'DEVOLUCIONES, DESCUENTOS O BONIFICACIONES SOBRE VENTAS AL 0%', NULL, 2, 'A', 0),
(42, '500.00', '500.00', 'COSTOS', NULL, NULL, 'D', 0),
(43, '501.00', '501.00', 'COSTO DE VENTA Y/O SERVICIO', NULL, 1, 'D', 0),
(44, '501.01', '501.01', 'COSTO DE VENTA', NULL, 2, 'D', 0),
(45, '600.00', '600.00', 'GASTOS', NULL, NULL, 'D', 0),
(46, '601.00', '601.00', 'GASTOS GENERALES', NULL, 1, 'D', 0),
(47, '601.48', '601.48', 'COMBUSTIBLES Y LUBRICANTES', NULL, 2, 'D', 0),
(48, '601.49', '601.49', 'VIATICOS Y GASTOS DE VIAJE', NULL, 2, 'D', 0),
(49, '601.50', '601.50', 'TELEFONO, INTERNET', NULL, 2, 'D', 0),
(50, '601.54', '601.54', 'LIMPIEZA', NULL, 2, 'D', 0),
(51, '601.55', '601.55', 'PAPELERIA Y ARTICULOS DE OFICINA', NULL, 2, 'D', 0),
(52, '601.56', '601.56', 'MANTENIMIENTO Y CONSERVACION', NULL, 2, 'D', 0),
(53, '601.57', '601.57', 'SEGUROS Y FIANZAS', NULL, 2, 'D', 0),
(54, '601.83', '601.83', 'GASTOS NO DEDUCIBLES', NULL, 2, 'D', 0),
(55, '601.84', '601.84', 'OTROS GASTOS GENERALES', NULL, 2, 'D', 0),
(56, '611.00', '611.00', 'IMPUESTO SOBRE LA RENTA', NULL, 1, 'D', 0),
(57, '611.01', '611.01', 'IMPUESTO SOBRE LA RENTA', NULL, 2, 'D', 0),
(58, '701.00', '701.00', 'GASTOS FINANCIEROS', NULL, 1, 'D', 0),
(59, '701.04', '701.04', 'INTERESES A CARGO BANCOS NACIONALES', NULL, 2, 'D', 0),
(60, '701.10', '701.10', 'COMISIONES BANCARIAS', NULL, 2, 'D', 0),
(61, '113.00', '113.00', 'IMPUESTOS A FAVOR', NULL, 1, 'D', 0),
(62, '113.01', '113.01', 'IVA A FAVOR', NULL, 2, 'D', 0),
(63, '113.02', '113.02', 'ISR A FAVOR', NULL, 2, 'D', 0),
(64, '602.00', '602.00', 'GASTOS DE VENTA', NULL, 1, 'D', 0),
(65, '603.00', '603.00', 'GASTOS DE ADMINISTRACION', NULL, 1, 'D', 0),
(66, '602.61', '602.61', 'PROPAGANDA Y PUBLICIDAD', NULL, 2, 'D', 0),
(67, '602.83', '602.83', 'GASTOS NO DEDUCIBLES', NULL, 2, 'D', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idclientes` bigint(20) UNSIGNED NOT NULL,
  `razon_social` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nom_corto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `domcalle` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domnoext` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domnoint` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domcol` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dommun` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
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
-- Truncar tablas antes de insertar `clientes`
--

TRUNCATE TABLE `clientes`;
--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idclientes`, `razon_social`, `rfc`, `nom_corto`, `domcalle`, `domnoext`, `domnoint`, `domcol`, `dommun`, `domedo`, `domcp`, `tel1`, `tel2`, `cel`, `contacto`, `email`, `nivel`, `usu`, `diascred`, `status`) VALUES
(1, 'PUBLICO EN GENERAL', 'XAXX010101000', 'MOSTRADOR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'j.maldonado', 0, 1),
(2, 'PUBLICO EN GENERAL', 'XAXX010101000', 'MOSTRADOR COSTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'j.maldonado', 0, 1),
(3, 'PUBLICO EN GENERAL', 'XAXX010101000', 'MOSTRADOR PREFERENTE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'j.maldonado', 0, 1),
(4, 'PUBLICO EN GENERAL', 'XAXX010101000', 'MOSTRADOR VIP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'j.maldonado', 0, 1),
(5, 'OPERADORA HOTELERA PATRISAN, S.A DE C.V.', 'OHP010813IP1', 'EL MADRIGAL', 'SONORA', '115', NULL, 'VISTAHERMOSA', 'CUERNAVACA', 17, '62290', '7771007700', NULL, NULL, 'ELIZABETH VARGAS', 'compras@elmadrigal.com.mx', 1, 'j.maldonado', 8, 1),
(6, 'GUSTAVO ADOLFO GARCIA CHAVEZ', 'GACG580614BA8', 'CASA DEL CHEF', 'FRANCISCO GARCIA CONDE', '10', NULL, 'SAN MIGUEL CHAPULTEPEC', 'MIGUEL HIDALGO', 9, '11850', NULL, NULL, NULL, 'GUSTAVO CHAVEZ', 'gustedadecomer@yahoo.com', 2, 'j.maldonado', 8, 1);

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

--
-- Truncar tablas antes de insertar `cuentabanco`
--

TRUNCATE TABLE `cuentabanco`;
--
-- Volcado de datos para la tabla `cuentabanco`
--

INSERT INTO `cuentabanco` (`idcuentabanco`, `nombre`, `banco`, `no`) VALUES
(1, 'BANCOMER', 'BANCOMER', 2900585815),
(2, 'BANORTE', 'BANORTE', 229272648);

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

--
-- Truncar tablas antes de insertar `cvtas`
--

TRUNCATE TABLE `cvtas`;
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

--
-- Truncar tablas antes de insertar `cxc`
--

TRUNCATE TABLE `cxc`;
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

--
-- Truncar tablas antes de insertar `cxp`
--

TRUNCATE TABLE `cxp`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diario`
--

CREATE TABLE `diario` (
  `iddiario` bigint(20) UNSIGNED NOT NULL,
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha` date NOT NULL,
  `cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `subcuenta` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `referencia` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `aux` decimal(15,2) NOT NULL,
  `debe` decimal(15,2) NOT NULL,
  `haber` decimal(15,2) NOT NULL,
  `facturar` tinyint(1) NOT NULL,
  `coment` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `diario`
--

TRUNCATE TABLE `diario`;
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

--
-- Truncar tablas antes de insertar `disponible`
--

TRUNCATE TABLE `disponible`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(2) NOT NULL,
  `nombre` varchar(21) DEFAULT NULL,
  `capital` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `estados`
--

TRUNCATE TABLE `estados`;
--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`, `capital`) VALUES
(1, 'Aguascalientes', 'Aguascalientes'),
(2, 'Baja California Norte', 'Mexicali'),
(3, 'Baja California Sur', 'La Paz'),
(4, 'Campeche', 'Campeche'),
(5, 'Chiapas', 'Tuxtla Gutierrez'),
(6, 'Chihuahua', 'Chihuahua'),
(7, 'Coahuila', 'Saltillo'),
(8, 'Colima', 'Colima'),
(9, 'Ciudad de M?xico', 'Cd. de Mexico'),
(10, 'Durango', 'Durango'),
(11, 'Guanajuato', 'Guanajuato'),
(12, 'Guerrero', 'Chilpancingo'),
(13, 'Hidalgo', 'Pachuca'),
(14, 'Jalisco', 'Guadalajara'),
(15, 'Mexico', 'Toluca'),
(16, 'Michoacan', 'Morelia'),
(17, 'Morelos', 'Cuernavaca'),
(18, 'Nayarit', 'Tepic'),
(19, 'Nuevo Leon', 'Monterrey'),
(20, 'Oaxaca', 'Oaxaca'),
(21, 'Puebla', 'Puebla'),
(22, 'Queretaro', 'Queretaro'),
(23, 'Quintana Roo', 'Chetumal'),
(24, 'San Luis Potosi', 'San Luis Potosi'),
(25, 'Sinaloa', 'Culiacan'),
(26, 'Sonora', 'Hermosillo'),
(27, 'Tabasco', 'Villahermosa'),
(28, 'Tamaulipas', 'Cd. Victoria'),
(29, 'Tlaxcala', 'Tlaxcala'),
(30, 'Veracruz', 'Jalapa'),
(31, 'Yucatan', 'Merida'),
(32, 'Zacatecas', 'Zacatecas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factem`
--

CREATE TABLE `factem` (
  `idfactem` int(11) NOT NULL,
  `serie` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `folio` bigint(20) UNSIGNED DEFAULT NULL,
  `archivo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `nreceptor` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `subtotal` decimal(15,2) UNSIGNED NOT NULL,
  `iva` decimal(15,2) UNSIGNED NOT NULL,
  `total` decimal(15,2) UNSIGNED NOT NULL,
  `arts` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `factem`
--

TRUNCATE TABLE `factem`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factrec`
--

CREATE TABLE `factrec` (
  `idfactrec` int(11) NOT NULL,
  `serie` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `folio` bigint(20) UNSIGNED DEFAULT NULL,
  `archivo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `nreceptor` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `subtotal` decimal(15,2) UNSIGNED NOT NULL,
  `iva` decimal(15,2) UNSIGNED NOT NULL,
  `total` decimal(15,2) UNSIGNED NOT NULL,
  `arts` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `factrec`
--

TRUNCATE TABLE `factrec`;
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

--
-- Truncar tablas antes de insertar `grupos`
--

TRUNCATE TABLE `grupos`;
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

--
-- Truncar tablas antes de insertar `ingresos`
--

TRUNCATE TABLE `ingresos`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idinventario` bigint(20) UNSIGNED NOT NULL,
  `fechamod` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'ultima modificacion',
  `idproductos` tinyint(3) UNSIGNED NOT NULL,
  `tipomov` tinyint(3) UNSIGNED NOT NULL COMMENT '1 entrada 2 salida 3 ajuste',
  `cant` decimal(10,3) NOT NULL,
  `fechamov` date NOT NULL,
  `usu` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `comentarios` longtext COLLATE utf8_spanish_ci,
  `idoc` bigint(20) UNSIGNED DEFAULT NULL,
  `debe` decimal(15,2) DEFAULT NULL,
  `haber` decimal(15,2) DEFAULT NULL,
  `factu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `inventario`
--

TRUNCATE TABLE `inventario`;
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

--
-- Truncar tablas antes de insertar `ivaacred`
--

TRUNCATE TABLE `ivaacred`;
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

--
-- Truncar tablas antes de insertar `ivatrans`
--

TRUNCATE TABLE `ivatrans`;
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

--
-- Truncar tablas antes de insertar `listasp`
--

TRUNCATE TABLE `listasp`;
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
  `fecharec` date DEFAULT NULL,
  `fechapago` date DEFAULT NULL,
  `usu` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '1 pedido, 5 mail env 10 surtido parc, 11  surt total,50 cfactura,99 pagado, 999 cancelado',
  `coment` text CHARACTER SET latin1,
  `correooc` tinyint(1) NOT NULL DEFAULT '0',
  `factura` varchar(35) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'factura recibida por la oc',
  `remision` varchar(35) COLLATE utf8_spanish_ci DEFAULT NULL,
  `foliomov` text COLLATE utf8_spanish_ci COMMENT 'folio del movimiento segun comprobante',
  `facturar` tinyint(1) NOT NULL,
  `credito` tinyint(1) NOT NULL,
  `arch` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `oc`
--

TRUNCATE TABLE `oc`;
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

--
-- Truncar tablas antes de insertar `parametros`
--

TRUNCATE TABLE `parametros`;
--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`idparametros`, `nombre`, `valornum`, `valorent`, `valortexto`) VALUES
(1, 'iva', '0.16', 0, ''),
(2, 'comision tarj', '0.04', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedidos` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `fechapago` date DEFAULT NULL,
  `idclientes` tinyint(3) UNSIGNED NOT NULL,
  `arts` int(6) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `fechamov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipovta` tinyint(3) UNSIGNED NOT NULL COMMENT '0 mostrador 1 contado 2 credito',
  `factura` varchar(35) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '0 pedido, 10 surtido, 20 al cobro,25 x facturar 30 cxc, 40 pagado, 999 cancelado',
  `coment` text CHARACTER SET latin1,
  `facturar` tinyint(1) NOT NULL,
  `arch` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `pedidos`
--

TRUNCATE TABLE `pedidos`;
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

--
-- TIPOS MIME PARA LA TABLA `productos`:
--   `foto`
--       `Image_JPEG`
--

--
-- Truncar tablas antes de insertar `productos`
--

TRUNCATE TABLE `productos`;
--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproductos`, `codigo`, `cbarras`, `nombre`, `nom_corto`, `nom_cat`, `grupo`, `unidad`, `cant`, `descripcion`, `costo`, `precio1`, `precio2`, `precio3`, `idproveedores`, `usu`, `fechamov`, `status`, `iva`, `foto`, `speso`, `spesov`, `selecciona`) VALUES
(1, 'QE500', '7501690516053', 'QUESO CAMPESTRE CON EPAZOTE 1/2 KG', 'CAMP EPAZOTE 1/2 K', 'EPAZOTE 1/2 KG', 1, 4, '1.00', 'QUESO CAMPESTRE CON EPAZOTE 500G ', '47.5000', '55.000', '60.000', '65.000', 1, 'j.maldonado', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(2, 'QH500', '7501690516053', 'QUESO CAMPESTRE CON CHIPOTLE 1/2 KG', 'CAMP CHIPOTLE 1/2K', 'CHIPOTLE 1/2 KG', 1, 4, '1.00', 'QUESO CAMPESTRE CON CHIPOTLE 500g', '47.5000', '55.000', '60.000', '65.000', 1, 'j.maldonado', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(3, 'QR500', '75016905521057', 'QUESO RANCHERO 1/2 KG', 'RANCHERO 1/2K', 'RANCHERO 1/2K', 1, 4, '1.00', 'QUESO RANCHERO DE 500G', '45.0000', '55.000', '60.000', '65.000', 1, 'j.maldonado', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(4, 'QEN500', '7501690516053', 'QUESO CAMPESTRE ENCHILADO 1/2 KG', 'CAMP ENCHILADO 1/2K', 'ENCHILADO 1/2KG', 1, 4, '1.00', 'QUESO CAMPESTRE ENCHILADO DE 500G', '47.5000', '55.000', '60.000', '65.000', 1, 'j.maldonado', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(5, 'QPN500', '7501690523051', 'QUESO PANELA DE 1/2 KG', 'PANELA 1/2K', 'PANELA 1/2KG', 1, 4, '1.00', 'QUESO PANELA DE 500 GRAMOS', '45.0000', '50.000', '52.000', '55.000', 1, 'jesumv', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(6, 'QMH500', '75016905520050', 'QUESO MANCHEGO DE 1/2 KG', 'MANCHEGO 1/2K', 'MANCHEGO 1/2KG', 1, 4, '1.00', 'QUESO MANCHEGO DE 500G', '52.0000', '60.000', '65.000', '70.000', 1, 'j.maldonado', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(7, 'QP500', '7501690516053', 'QUESO CAMPESTRE NATURAL DE 1/2 KG', 'CAMP NATURAL 1/2K', 'CAMPESTRE NATURAL 1/2', 1, 4, '1.00', 'QUESO CAMPESTRE NATURAL DE 500 GRAMOS', '46.5000', '55.000', '60.000', '65.000', 1, 'j.maldonado', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(8, 'QO500', '7501690522054', 'QUESO OAXACA 1/2 KG', 'OAXACA 1/2K', 'OAXACA 1/2KG', 1, 4, '1.00', 'QUESO OAXACA DE 500 GRAMOS', '46.5000', '55.000', '58.000', '60.000', 1, 'j.maldonado', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(9, 'MT250', '111', 'MANTEQUILLA 1/4 KG', 'MANTEQUILLA 1/4K', 'MANTEQUILLA 1/4', 1, 4, '1.00', 'MANTEQUILLA DE 250 GRAMOS', '17.5000', '20.000', '22.000', '24.000', 1, 'j.maldonado', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(10, 'QPN1000C', '11234', 'QUESO PANELA COMERCIAL 1KG', 'PANELA COMERC 1K', 'PANELA ECO.', 1, 4, '1.00', 'QUESO PANELA COMERCIAL BARRA DE 1KG', '65.5000', '75.000', '79.000', '82.000', 1, 'j.maldonado', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(11, 'IG011', '00011', 'LOMO SALMON FRESCO CBV PRECIO POR KILO', 'SALMON FRESCO CBV 1K', 'LOMO DE SALMON FRESCO CON BOLSA DE VACIO', 2, 1, '1.00', 'LOMO DE SALMON FRESCO CON BOLSA DE VACIO, SEGUN PESO DE 1.3 A 1.8 KG,', '286.9100', '372.000', '387.000', '400.000', 2, 'jesumv', '2016-09-26 01:00:00', 1, 0, '', 1, 0, 0),
(12, 'IG012', '00012', 'MERLUZA DE PINCHO SIN PIEL 140G APROX', 'MERLUZA PORCION', 'PORCIONES DE MERLUZA DE PINCHO SIN PIEL 125-140G', 2, 4, '1.00', 'PORCION DE MERLUZA DE PINCHO SIN PIEL DE 125 A 140 GRAMOS CONGELADAS, AL VACIO, 160G APROX', '0.0735', '15.000', '20.000', '25.000', 2, 'jesumv', '2016-12-27 14:51:59', 0, 0, '', 1, 0, 0),
(13, 'IG013', '00013', 'TROZOS DE MERLUZA DE PINCHO BOLSA 2 KG APROX.', 'MERLUZA TROZOS 2KG', 'TROZOS DE MERLUZA DE PINCHO SIN PIEL EN BOLSA 2 KG', 2, 1, '1.00', 'TROZOS DE MERLUZA DE PINCHO SIN PIEL, CONGELADA EN BOLSA DE 2 KG SEGUN PESO', '48.0000', '62.000', '65.000', '70.000', 2, 'jesumv', '2016-12-27 14:55:16', 0, 0, '', 1, 0, 0),
(14, 'IG014', '00014', 'VIEIRAS CONGELADAS BOLSA DE 1 KG. APROX.', 'VIEIRAS CONG 1K', 'VIEIRAS CONGELADAS CON CORAL Y CONCHA BOLSA 1 KG', 2, 1, '1.00', 'VIEIRAS CON CORAL Y CONCHA CONGELADAS, BOLSA 1 KG. APROX. PRECIO SEGUN PESO', '191.4600', '250.000', '260.000', '270.000', 2, 'j.maldonado', '2017-01-07 01:01:26', 0, 0, '', 1, 1, 0),
(15, 'IG015', '00015', 'MEJILLONES AL VINO BLANCO 50O GR APROX', 'MEJILLONES VINO 500G', '', 2, 4, '1.00', 'MEJILLONES PRECOCINADOS CONGELADOS AL VINO BLANCO MARCA NORDKINN EN BOLSA DE 500 GRAMOS APROX, SEGUN PESO.', '55.2100', '65.000', '70.000', '75.000', 2, 'jesumv', '2016-12-27 14:59:43', 0, 0, '', 0, 0, 0),
(16, 'IG016', '00016', 'MEJILLONES EN SALSA DE TOMATE 500 GR APR', 'MEJILLONES SALSA 500', '', 2, 4, '1.00', 'MEJILLONES PRECOCINADOS CONGELADOS EN SALSA DE TOMATE Y ENELDO MARCA NORDKINN EN BOLSA DE 500 GRAMOS APROX. SEGUN PESO.', '55.2100', '65.000', '70.000', '75.000', 2, 'jesumv', '2016-12-27 15:00:12', 0, 0, '', 0, 0, 0),
(17, 'IG017', '00017', 'PAMPANO PRECOCINADO AL NATURAL 100 GR', 'PAMPANO NAT 100G', '', 2, 4, '1.00', 'PAMPANO PRECOCINADO AL NATURAL, CONGELADO EN PORCION INVIVIDUAL DE 100 GRAMOS MARCA C. DE PATAGONIA', '32.3600', '40.000', '45.000', '50.000', 2, 'j.maldonado', '2016-12-27 15:00:31', 0, 0, '', 0, 0, 0),
(18, 'IG018', '00018', 'SALMON PRECOCINADO AL NATURAL 100 GR', 'SALMON PREC NAT 100G', '', 2, 4, '1.00', 'LOMO DE SALMON PRECOCINADO AL NATURAL, CONGELADO, EN EMPAQUE AL VACIO 100 GRAMOS MARCA C. DE PATAGONIA.', '32.3600', '40.000', '45.000', '50.000', 2, 'j.maldonado', '2016-12-27 15:00:52', 0, 0, '', 0, 0, 0),
(19, 'IG019', '00019', 'SALMON PRECOCINADO AL TERIYAKI 100 GR', 'SALMON TERIYAKI 100G', '', 2, 4, '1.00', 'LOMO DE SALMON PRECOCINADO AL TERIYAKI, CONGELADO, EN EMPAQUE AL VACIO 100 GRAMOS MARCA C. DE PATAGONIA', '27.4700', '40.000', '45.000', '50.000', 2, 'j.maldonado', '2016-12-27 15:01:23', 0, 0, '', 0, 0, 0),
(20, 'IG020', '0020', 'TARTARE DE SALMON', 'TARTARE SALMON', '', 2, 4, '1.00', 'TARTARE DE CARNE DE SALMON PRECOCINADA, PORCION DE 90 GRAMOS.', '28.4200', '35.000', '38.000', '40.000', 2, 'j.maldonado', '2016-12-27 15:01:39', 0, 0, '', 0, 0, 0),
(21, 'IG021', '00021', 'WELLINGTON DE SALMON', 'WELLINGTON SALMON', '', 2, 4, '1.00', 'WELLINGTON DE SALMON PRECOCINADO, CONGELADO, EN PORCION DE 220 GRAMOS MARCA C. DE PATAGONIA.', '42.3800', '55.000', '58.000', '60.000', 2, 'j.maldonado', '2016-12-27 15:02:24', 0, 0, '', 0, 0, 0),
(22, 'IG022', '00022', 'LOMO DE SALMON FRESCO SBV PRECIO X KG', 'SALMON FRESCO SBV KG', 'LOMO DE SALMON FRESCO CON PIEL SEGUN PESO', 2, 1, '1.00', 'LOMO DE SALMON FRESCO SIN BOLSA DE VACIO DE 1.3 A 1.8 KG SEGUN PESO', '286.9100', '365.000', '385.000', '399.000', 2, 'j.maldonado', '2017-01-15 00:59:28', 0, 0, '', 1, 1, 0),
(23, 'IG023', '00023', 'LOMO DE SALMON CONGELADO CBV PRECIO X KG', 'SALMON CONG CBV KG', '', 2, 1, '1.00', 'LOMO DE SALMON CONGELADO CON BOLSA DE VACIO, DE 1.3 A 1.8 KG SEGUN PESO.', '250.0000', '280.000', '300.000', '320.000', 2, 'jesumv', '2016-12-27 15:03:37', 1, 0, '', 1, 0, 0),
(24, 'IG024', '8410694150455', 'SALMON AHUMADO REBANADO 100 GR', 'SALMON AHUM 100G', '', 2, 4, '1.00', 'SALMON AHUMADO REBANADO CONGELADO EMPAQUE AL VACIO PORTION CONTROL 100 GRAMOS MARCA NORDKINN ', '58.6300', '76.000', '80.000', '82.000', 2, 'j.maldonado', '2016-12-27 15:04:13', 0, 1, '', 0, 0, 0),
(25, 'IG025', '00025', 'SALMON PRECOCINADO AL NATURAL 150 GR', 'SALMON PREC NAT 150G', '', 2, 4, '1.00', 'LOMO DE SALMON PRECOCINADO AL NATURAL, CONGELADO, EN EMPAQUE AL VACIO 500 GRAMOS MARCA C. DE PATAGONIA.', '48.5300', '60.000', '65.000', '70.000', 2, 'j.maldonado', '2016-12-27 15:04:34', 0, 0, '', 0, 0, 0),
(26, 'IG026', '00026', 'LOMO DE CHILEAN SEA BASS PRECIO X KG', 'SEA BASS LOMO KG', 'LOMO DE CHILEAN SEA BASS SIN PIEL MENOS DE 1KG.', 2, 1, '1.00', 'LOMO DE CHILEAN SEA BASS CONGELADO CHICO, DE MENOS DE 1 KG. SEGUN PESO', '454.9600', '591.450', '615.000', '640.000', 2, 'jesumv', '2016-12-27 15:05:15', 0, 0, '', 1, 0, 0),
(27, 'IG027', '00027', 'BACALAO MORHUA DESMENUZADO POR KG', 'BACALAO DESM X KG', 'BACALAO MORHUA SUPERIOR EN TROZOS KG.', 2, 1, '1.00', 'TROZOS DE BACALAO MORHUA SIN PIEL Y SIN ESPINAS BOLSA DE 1 KG. APROX CONGELADO. VENTA POR KG.', '160.0000', '208.000', '208.000', '216.000', 2, 'j.maldonado', '2017-01-13 04:17:51', 0, 0, '', 0, 0, 0),
(28, 'IG028', '00028', 'LOMO DE BACALAO MORHUA SALADO PRECIO X KG', 'BACALAO LOMO KG', 'LOMO DE BACALAO MORHUA SUPERIOR DE MAS DE 600 GR', 2, 1, '1.00', 'LOMO DE BACALAO MORHUA SUPERIOR MARCA POLAR SEGUN PESO DE MAS DE 600G. PRECIO POR KG.', '336.6000', '355.000', '370.000', '380.000', 2, 'j.maldonado', '2016-12-28 04:28:38', 0, 0, '', 1, 1, 0),
(29, 'IG029', '00029', 'MERLUZA FILETITOS CON  PIEL 225G', 'MERLUZA FIL C PIEL ', 'PORCIONES DE MERLUZA DE PINCHO CON PIEL FILETITOS', 2, 4, '1.00', 'PORCIONES CONGELADAS DE MERLUZA DE PINCHO CON PIEL EN FILETITOS DE APROXIMADAMENTE 225 G.', '0.0465', '15.000', '20.000', '25.000', 2, 'j.maldonado', '2016-12-27 15:13:22', 0, 0, '', 1, 0, 0),
(30, 'IG030', '00030', 'MANOS DE CANGREJO COCIDAS GRANDES BOLSA 2.27 KG', 'MANOS CANGREJO BOLSA', 'MANOS DE CANGREJO COC PELADAS GDES BOLSA 2.270 KG', 2, 4, '1.00', 'MANOS DE CANGREJO COCIDAS PELADAS GRANDES CONGELADAS EN BOLSA DE 2.270 KG. APROX', '630.2700', '830.000', '870.000', '890.000', 2, 'j.maldonado', '2016-12-26 20:50:56', 0, 0, '', 0, 0, 0),
(31, 'IG031', '00031', 'TURBOT FRESCO ENTERO PRECIO POR KG', 'TURBOT X KG', 'TURBOT FRESCO DE 1 KG', 2, 1, '1.00', 'TURBOT O RODABALLO FRESCO ENTERO S/PESO', '295.4400', '385.000', '400.000', '415.000', 2, 'jesumv', '2016-09-22 23:28:51', 0, 0, '', 1, 0, 0),
(32, 'IG032', '8410694150561', 'SALMON AHUMADO REBANADO 200 GR', 'SALMON AHUM 200G', '', 2, 4, '1.00', 'SALMON AHUMADO CONGELADO EN SOBRE DE 200 GRAMOS MARCA NORDKINN', '112.6300', '145.000', '155.000', '160.000', 2, 'jesumv', '2016-12-27 15:13:54', 0, 1, '', 0, 0, 0),
(33, 'IG033', '00033', 'SALMON AHUMADO REBANADO 500 GR', 'SALMON AHUM 500G', '', 2, 4, '1.00', 'SALMON DEL ATLANTICO AHUMADO CONGELADO EN SOBRE DE 500 GRAMOS MARCA ROYAL SEA', '260.6800', '340.000', '350.000', '365.000', 2, 'jesumv', '2016-12-27 15:14:19', 0, 1, '', 0, 0, 0),
(34, 'IG034', '7501728027049', 'PIMIENTO MORRON LATA 400GR', 'PIMIENTO MORRON 400G', '', 3, 4, '1.00', 'PIMIENTOS  MORRONES ENTEROS EN SALMUERA LATA DE 400G MARCA DON AGUSTIN', '15.6900', '20.000', '30.000', '40.000', 2, 'jesumv', '2016-12-27 15:17:14', 0, 0, '', 0, 0, 0),
(35, 'IG035', '7501728025014', 'PERAS EN MITADES 820 GR', 'PERAS LATA 820G', '', 3, 4, '1.00', 'MITADES DE PERAS EN ALMIBAR LATA DE 820G MARCA DON AGUSTIN', '21.6600', '25.990', '30.000', '35.000', 2, 'jesumv', '2016-12-27 15:17:14', 0, 0, '', 0, 0, 0),
(36, 'IG036', '00036', 'LOMO DE SALMON FRESCO SEGUN PESO', 'SALMON FRESCO S/PESO', '', 2, 2, '1.00', 'LOMO DE SALMON FRESCO PORCIONADO S/PESO', '0.2900', '0.335', '0.360', '0.380', 2, 'jesumv', '2016-09-07 21:41:42', 0, 0, '', 1, 0, 0),
(37, 'IG037', '00037', 'LOMO DE SALMON CONGELADO PRECIO X KG', 'SALMON CONGELADO S/P', 'LOMO DE SALMON CONGELADO DE 1.3 A 1.5 KG. PIEZA', 2, 1, '1.00', 'LOMO DE SALMON CONGELADO, PORCIONADO S/PESO', '225.0000', '260.000', '270.000', '280.000', 2, 'jesumv', '2016-09-22 23:05:50', 0, 0, '', 1, 0, 0),
(38, 'IG038', '00038', 'FILETE DE TURBOT CONG PRECIO X 100 GR', 'TURBOT CONG S/PESO', 'TURBOT FRESCO FILETEADO', 2, 2, '100.00', 'FILETE DE TURBOT O RODABALLO CONGELADO SEGUN PESO', '29.5000', '30.000', '32.000', '35.000', 2, 'jesumv', '2016-09-22 19:23:19', 0, 0, '', 1, 0, 0),
(39, 'IG039', '7501728001148', 'ESPARRAGOS BLANCOS GRUESOS FRASCO 320 GR', 'ESPARRAGOS GRUESOS', '', 3, 4, '1.00', 'ESPARRAGOS BLANCOS GRUESOS EN SALMUERA FRASCO DE 320G MARCA DON AGUSTIN', '45.0500', '48.000', '50.000', '50.000', 2, 'jesumv', '2016-12-27 15:17:14', 0, 0, '', 0, 0, 0),
(40, 'IG040', '7501728028114', 'DURAZNOS EN MITADES 820GR', 'DURAZNOS 820G', '', 3, 4, '1.00', 'MITADES DE DURAZNOS EN ALMIBAR LATA DE 820 GRAMOS MARCA DON AGUSTIN', '18.6600', '22.390', '25.000', '30.000', 2, 'jesumv', '2016-12-27 15:17:14', 0, 0, '', 0, 0, 0),
(41, 'IG041', '7502260360182', 'WELLINGTON DE SALMON CAJA CON 2 PZAS', 'WELLINGTON CAJA 2 PZ', 'WELLINGTON DE SALMON CAJITA CON 2 PZAS', 2, 4, '1.00', 'WELLINGTON DE SALMON PRECOCINADO, CONGELADO, CAJA CON 2 PIEZAS, 440 GRAMOS', '84.7600', '110.000', '115.000', '120.000', 2, 'j.maldonado', '2016-12-27 14:45:06', 0, 0, '', 0, 0, 0),
(42, 'L001', '00042', 'QUESO RICOTTA 500 GR', 'RICOTTA 500G', '', 1, 4, '1.00', 'QUESO RICOTTA PADILLA ENVASE CON 500 GRAMOS', '25.0000', '30.000', '32.000', '35.000', 1, 'jesumv', '2016-12-27 14:47:39', 0, 0, '', 0, 0, 0),
(43, 'IG043', '00043', 'CARNE DE CENTOLLO PRECOC EN CHAROLA PRECIO X KG', 'CENTOLLO CHAROLA', 'CARNE DE CENTOLLO CHAROLA 500G', 2, 4, '1.00', 'CARNE DE CENTOLLO EN CHAROLA DE APROX. 500 G PRECIO SEGUN PESO', '275.6000', '321.000', '350.000', '375.000', 2, 'j.maldonado', '2016-12-27 15:15:37', 0, 0, '', 0, 0, 0),
(44, 'IG044', '00044', 'FILETITOS DE MERLUZA SIN  PIEL 225G', 'MERLUZA FIL S PIEL', 'PORCIONES DE MERLUZA DE PINCHO SIN PIEL FILETITOS', 2, 4, '1.00', 'PORCIONES CONGELADAS DE MERLUZA DE PINCHO SIN PIEL EN FILETITOS DE APROXIMADAMENTE 225 G.', '0.0500', '20.000', '25.000', '30.000', 2, 'jesumv', '2016-12-27 15:16:00', 0, 0, '', 1, 0, 0),
(45, 'IG045', '00045', 'TROZOS DE MERLUZA DE PINCHO 1 KG CBV', 'MERLUZA TROZOS 1 KG', 'MERLUZA DE PINCHO EN TROZOS BOLSA DE 1 KG', 2, 1, '1.00', 'MERLUZA DE PINCHO CONGELADA EN TROZOS, EN BOLSA DE VACIO 1KG', '48.0000', '62.000', '65.000', '70.000', 2, 'j.maldonado', '2016-12-10 02:32:32', 0, 0, '', 0, 0, 0),
(46, 'IG049', '8411942773426', 'MANDARINAS EN ALMIBAR', 'MANDARINAS 3KG', 'MANDARINAS EN ALMIBAR', 3, 4, '1.00', 'MANDARINAS EN ALMIBAR EN LATA DE 3 KILOGRAMOS', '83.1600', '100.000', '100.000', '100.000', 2, 'j.maldonado', '2016-12-27 15:17:14', 0, 0, '', 0, 0, 0),
(47, 'IG047', '00047', 'MERLUZA PORCIONES POR KG.', 'MERLUZA PORCION X KG', 'PORCIONES DE MERLUZA DE PINCHO X KG.', 2, 1, '1.00', 'MERLUZA DE PINCHO PORCIONES DE 125 G VENTA POR KILOGRAMO', '73.5000', '95.000', '95.000', '95.000', 2, 'j.maldonado', '2016-12-10 02:30:54', 0, 0, '', 1, 1, 0),
(48, 'IG048', '00048', 'ALMEJA CHOCHOLATA VIVA', 'CHOCOLATA VIVA', 'ALMEJA CHOCOLATA VIVA', 2, 3, '1.00', 'ALMEJA CHOCOLATA VIVA POR DOCENA', '141.6800', '185.000', '185.000', '185.000', 2, 'j.maldonado', '2016-12-24 03:24:03', 0, 0, '', 0, 0, 0),
(49, 'QPN3000', '', 'QUESO PANELA GRANEL DE 3 KG', 'PANELA 3 KG', 'QUESO PANELA 3 KG', 1, 1, '3.00', 'QUESO PANELA 100% DE LECHE EN PIEZA DE APROX. 3 KG. SEGUN PESO.', '79.0000', '95.000', '100.000', '100.000', 1, 'j.maldonado', '2017-01-12 00:48:03', 0, 0, '', 1, 1, 0),
(50, 'IG050', '00050', 'VIEIRAS CONGELADAS PRECIO X KILO', 'VIEIRAS X KILO', 'VIEIRAS CONGELADAS POR KILO', 2, 1, '1.00', 'VIEIRAS CON CORAL Y CONCHA CONGELADAS, VENTA POR PESO.', '191.4600', '250.000', '260.000', '270.000', 2, 'j.maldonado', '2017-01-07 01:05:07', 0, 0, '', 1, 1, 0);

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

--
-- Truncar tablas antes de insertar `proveedores`
--

TRUNCATE TABLE `proveedores`;
--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedores`, `razon_social`, `rfc`, `nom_corto`, `direccion`, `tel`, `contacto`, `email`, `factura`, `diascred`, `usu`, `fecha_mov`, `status`) VALUES
(1, 'QUESOS PADILLA, S.A. DE C.V.', 'QPA931129UTA', 'JUAN ANGEL', 'RANCHO PANDA NO. 62 COL. HACIENDA DE COYOACAN', '5555940435', 'JUAN ANGEL GONZALEZ', 'juanangelglez@hotmail.com', 0, 15, 'j.maldonado', '2016-12-25 19:32:24', 0),
(2, 'INTERNACIONAL GASTRONOMICA, S.A. DE C.V.', 'IGS990102RR4', 'INTERNACIONAL G', 'TESORO NO. 49 COL. ESTRELLA', '5555873505', 'ELIZABETH BALDOVINOS', 'jmaldonadoca@gmail.com', 1, 30, 'j.maldonado', '2016-12-25 19:31:46', 0);

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

--
-- Truncar tablas antes de insertar `subcats`
--

TRUNCATE TABLE `subcats`;
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

CREATE TABLE `unidades` (
  `idunidades` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(15) CHARACTER SET latin1 NOT NULL,
  `usu` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fechamov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `unidades`
--

TRUNCATE TABLE `unidades`;
--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`idunidades`, `nombre`, `usu`, `fechamov`, `status`) VALUES
(1, 'Kilos', 'j.maldonado', '2016-12-25 19:20:58', 0),
(2, 'Gramos', 'j.maldonado', '2016-12-25 19:20:45', 0),
(3, 'Docena', 'j.maldonado', '2016-12-24 23:43:40', 0),
(4, 'Pieza', 'j.maldonado', '2016-12-25 19:20:26', 0);

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
-- Truncar tablas antes de insertar `usuarios`
--

TRUNCATE TABLE `usuarios`;
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
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factem`
--
ALTER TABLE `factem`
  ADD PRIMARY KEY (`idfactem`);

--
-- Indices de la tabla `factrec`
--
ALTER TABLE `factrec`
  ADD PRIMARY KEY (`idfactrec`);

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
  MODIFY `idartsoc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `artsped`
--
ALTER TABLE `artsped`
  MODIFY `idartsped` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `catctasat`
--
ALTER TABLE `catctasat`
  MODIFY `idcat` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idclientes` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
-- AUTO_INCREMENT de la tabla `factem`
--
ALTER TABLE `factem`
  MODIFY `idfactem` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `factrec`
--
ALTER TABLE `factrec`
  MODIFY `idfactrec` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `idparametros` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedidos` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproductos` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
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
  MODIFY `idunidades` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
