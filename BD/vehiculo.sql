-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2021 a las 09:57:25
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_categoria` (IN `cate` VARCHAR(30))  BEGIN

insert into categorias(categoria) values(cate);
    
    SELECT last_insert_id() AS nuevoid;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_inventario` (IN `val_idvehiculo` INT(11), IN `val_idcategoria` INT(11), IN `val_stock` FLOAT(8,2), IN `val_estado` TINYINT(1))  BEGIN
	insert into inventarios(id_vehiculo, id_categoria, stock, estado) 
	values(val_idvehiculo, val_idcategoria, val_stock,val_estado);
    
    SELECT last_insert_id() AS nuevoid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_vehiculo` (IN `val_idprocucto` INT(11), IN `val_descricion` TEXT, IN `val_precioncompra` DECIMAL(8,2), IN `val_precioventa` DECIMAL(8,2), IN `val_cilingraje` VARCHAR(50), IN `val_modelo` VARCHAR(50), IN `val_ano` INT(4), IN `val_imagen` VARCHAR(255), IN `val_idmarca` INT(11))  BEGIN
	insert into vehiculo(id_producto, descripcion, precio_compra, precio_venta, cilindraje, modelo, ano, imagen, id_marca) 
				values(val_idprocucto, val_descricion, val_precioncompra, val_precioventa,  val_cilingraje, val_modelo, val_ano, val_imagen, val_idmarca);
    
    SELECT last_insert_id() AS nuevoid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_venta` (IN `var_fechaventa` DATE, IN `var_totalpago` DECIMAL(20,2), IN `var_decuento` INT(11), IN `var_idcliente` INT(11), IN `var_idusuario` INT(9))  BEGIN
	insert into vehiculo(fecha_venta, total_pago, descuento, id_cliente, id_usuario) 
				values(var_fechaventa, var_totalpago, var_decuento, var_idcliente, var_idusuario);
    
    SELECT last_insert_id() AS nuevoid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_marca` (IN `val_nombremarca` VARCHAR(150), IN `val_id_marca` INT)  BEGIN
	
	update marca set nombre_marca = val_nombremarca where id_marca = val_id_marca;
    
    SELECT concat('ID: ',val_id_marca, ' modifcado.') as resultado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_marcaimagen` (IN `val_nombremarcaa` VARCHAR(150), IN `val_imgmarca` VARCHAR(150), IN ` val_id_marcaa` INT)  BEGIN
	
	update marca set nombre_marca = val_nombremarcaa, img_marca = val_imgmarca where id_marca = val_id_marcaa;
    
    SELECT concat('ID: ',val_id_marcaa, ' modifcado.') as resultado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `producto_masvendido` ()  SELECT id_producto, modelo,(SELECT COUNT(*)FROM detalle_venta WHERE vehiculo.id_producto=detalle_venta.id_producto) as cantidad FROM vehiculo WHERE(SELECT COUNT(*) FROM detalle_venta WHERE vehiculo.id_producto=detalle_venta.id_producto)>2 ORDER BY id_producto ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selecionar_marca` ()  SELECT * from marca$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria`, `imagen_categoria`) VALUES
(1, 'Automóviles', ''),
(2, 'Camionetas', ''),
(3, 'Vehículos deportivos', ''),
(4, 'Frontier', ''),
(5, 'Microbus', ''),
(6, 'Pick-Up', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clavesanteriores`
--

CREATE TABLE `clavesanteriores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `clave_anterior` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clavesanteriores`
--

INSERT INTO `clavesanteriores` (`id`, `nombre`, `clave_anterior`) VALUES
(1, 'operador', '$2y$10$vtKsgQKvYru4kk7nWUMeGeLS4ldR.eQpgB9bSxeVdqObH36mOjGii'),
(2, 'Jose', '$2y$10$rh.otOrPJVHuiSdaNxg/juWNAA6eWzkDB6HWXkzOULBGfaTEB4KI.'),
(3, 'Jose', '$2y$10$PZvO9N7zf4sbI1Cb6YZDE.O.sQpe58LoiUbhaQp2zGy726iwx1p4S'),
(4, 'Jose', '$2y$10$PZvO9N7zf4sbI1Cb6YZDE.O.sQpe58LoiUbhaQp2zGy726iwx1p4S'),
(5, 'Jose', '$2y$10$PZvO9N7zf4sbI1Cb6YZDE.O.sQpe58LoiUbhaQp2zGy726iwx1p4S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(9) NOT NULL,
  `nombres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombres`, `apellidos`) VALUES
(345678923, 'MAURICIO', 'CASTELLANOS'),
(425273323, 'ANDREA', 'MARBELLA'),
(456789323, 'JOSE', 'cruz'),
(567891234, 'JAVIER', 'LOPEZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle_v` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `precio_unitario` decimal(20,2) NOT NULL,
  `cantidad_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle_v`, `id_venta`, `id_producto`, `id_sucursal`, `precio_unitario`, `cantidad_prod`) VALUES
(1, 99, 1, 8, '20.00', 1),
(2, 100, 2, 5, '2000.00', 1),
(3, 101, 2, 2, '2000.00', 1),
(4, 102, 3, 2, '30.00', 1),
(5, 103, 2, 2, '2000.00', 1),
(6, 104, 2, 1, '2000.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id_inventario` int(11) NOT NULL,
  `id_vehiculo` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `stock` float DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inventarios`
--

INSERT INTO `inventarios` (`id_inventario`, `id_vehiculo`, `id_categoria`, `stock`, `estado`) VALUES
(52, 1, 1, 2, 1),
(53, 2, 3, 0, 1),
(54, 3, 1, 4, 1),
(57, 4, 3, 30, 1),
(58, 5, 6, 34, 1),
(59, 6, 2, 50, 1);

--
-- Disparadores `inventarios`
--
DELIMITER $$
CREATE TRIGGER `inventario_total_AI` AFTER INSERT ON `inventarios` FOR EACH ROW begin
  insert into inventario_total(id_inventario, stock_total) values (NEW.id_inventario, NEW.stock); 
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_total`
--

CREATE TABLE `inventario_total` (
  `id` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `stock_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario_total`
--

INSERT INTO `inventario_total` (`id`, `id_inventario`, `stock_total`) VALUES
(1, 56, 45),
(2, 57, 30),
(3, 58, 34),
(4, 59, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `limite_productos`
--

CREATE TABLE `limite_productos` (
  `id_limite` int(11) NOT NULL,
  `id_vehiculo` int(11) DEFAULT NULL,
  `limite` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `limite_productos`
--

INSERT INTO `limite_productos` (`id_limite`, `id_vehiculo`, `limite`) VALUES
(19, 1, 30),
(21, 2, 10),
(22, 4, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `img_marca` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Guardara informacion de los proveedores';

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`, `img_marca`) VALUES
(12, 'NISSAN', 'proveedor/K/K.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_empresa` int(11) NOT NULL,
  `nombre_empresa` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email_empresa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_empresa` int(11) NOT NULL,
  `direccion_empresa` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_empresa`, `nombre_empresa`, `email_empresa`, `telefono_empresa`, `direccion_empresa`) VALUES
(1, 'San Miquel', 'nissanroosevelt@nissan.sv', 4545454, 'avenida roosevelt'),
(2, 'Santa Ana', 'josezabaleta@gmail.com', 7585858, 'Avenida el calvario'),
(5, 'Casa Matriz', 'casmatriz@nissan.sv', 74568934, 'avenida juan pablo'),
(8, 'san vicente', 'vicente@gmail.com', 7756849, 'lllllllllo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passw` text DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `token` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `email`, `passw`, `tipo`, `estado`, `token`) VALUES
(1, 'admin', 'administrador@admin.com', '$2y$10$xwThYwwCvFjNloIGoOYgBuf9tFwNwyTiR0YLJvM4twehXcYnDmJDe', 1, 1, NULL),
(2, 'operador', 'usuario_operador@farmacia.com', '$2y$10$fAtqaEGNEWpLAND5m/jVd.ZxDPi3ITdLbTlN4tl66HXQNERkrUUBa', 1, 1, NULL);

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `claves` AFTER UPDATE ON `usuarios` FOR EACH ROW begin
  insert into clavesanteriores(nombre, clave_anterior) values (old.usuario, old.passw); 
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_producto` int(11) NOT NULL,
  `descripcion` text CHARACTER SET armscii8 DEFAULT NULL,
  `precio_compra` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(8,2) DEFAULT NULL,
  `cilindraje` varchar(50) CHARACTER SET armscii8 DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `ano` int(5) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_producto`, `descripcion`, `precio_compra`, `precio_venta`, `cilindraje`, `modelo`, `ano`, `imagen`, `id_marca`) VALUES
(1, 'NISSAN altima 2019', '200.00', '20.00', '4', 'Altima', 2021, 'productos/Automóviles/Altima.jpg', 12),
(2, ' Autos deportivos', '7000.00', '2000.00', '4', 'MSRP 37OZ', 2021, 'productos/Vehículos deportivos/MSRP 37OZ.jpg', 12),
(3, 'Dimensiones: 4508 / 1709 / 1410 / 2535 mm', '10.00', '30.00', '4', 'Sentra', 2021, 'productos/Automóviles/Sentra.jpg', 12),
(4, 'Nissan GT-R NISMO 3.8 V6 441 kW (600 CV) (2020)', '20000.00', '40000.00', '5', 'GT-R', 2022, 'productos/Vehículos deportivos/GT-R.jpg', 12),
(5, 'Doble Cabina Visia 4 Puertas (A?o 2019)', '345000.00', '40200.00', '6', 'NAVARA VISIA', 2020, 'productos/Pick-Up/NAVARA VISIA.jpg', 12),
(6, 'faros m?s afilados, una parrilla m?s grande y detallada', '50000.00', '57500.00', '7', 'Kicks', 2022, 'productos/Camionetas/Kicks.jpg', 12);

--
-- Disparadores `vehiculo`
--
DELIMITER $$
CREATE TRIGGER ` ACTUALIZA_VEHICULOS_BU` BEFORE UPDATE ON `vehiculo` FOR EACH ROW begin
  insert into vehiculo_actualizado(anterior_id_producto,anterior_descripcion, anterior_precio_compra,anterior_precio_venta, anterior_id_marca, nuevo_descripcion,nuevo_precio_compra,nuevo_precio_venta,nuevo_id_marca,usuario,f_modificacion ) values (OLD.id_producto, OLD.descripcion, OLD.precio_compra, OLD.precio_venta, OLD.id_marca, NEW.descripcion,NEW.precio_compra,NEW.precio_venta, NEW.id_marca,CURRENT_USER(),NOW()); 
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ELIVEHICULO_AD` AFTER DELETE ON `vehiculo` FOR EACH ROW begin
  insert into vehiculo_eliminado(id_producto,descripcion, precio_compra,precio_venta, cilindraje,modelo, ano, id_marca,usuario,fecha_eliminacio ) values (OLD.id_producto, OLD.descripcion, OLD.precio_compra, OLD.precio_venta, OLD.cilindraje, OLD.modelo, OLD.ano,  OLD.id_marca,CURRENT_USER(),NOW()); 
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_actualizado`
--

CREATE TABLE `vehiculo_actualizado` (
  `id_vehuculo_ap` int(11) NOT NULL,
  `anterior_id_producto` int(11) NOT NULL,
  `anterior_descripcion` text NOT NULL,
  `anterior_precio_compra` decimal(8,2) NOT NULL,
  `anterior_precio_venta` decimal(8,2) NOT NULL,
  `anterior_id_marca` int(11) NOT NULL,
  `nuevo_descripcion` text NOT NULL,
  `nuevo_precio_compra` decimal(8,2) NOT NULL,
  `nuevo_precio_venta` decimal(8,2) NOT NULL,
  `nuevo_id_marca` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `f_modificacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculo_actualizado`
--

INSERT INTO `vehiculo_actualizado` (`id_vehuculo_ap`, `anterior_id_producto`, `anterior_descripcion`, `anterior_precio_compra`, `anterior_precio_venta`, `anterior_id_marca`, `nuevo_descripcion`, `nuevo_precio_compra`, `nuevo_precio_venta`, `nuevo_id_marca`, `usuario`, `f_modificacion`) VALUES
(1, 0, 'MMMMMMMMMMMMMMMM', '2000.00', '4000.00', 2, 'MMMMMMMMMMMMMMMM', '2000.00', '4000.00', 2, 'root@localhost', '2021-11-26'),
(2, 5, 'jkl', '4000.00', '5000.00', 12, 'jklklm', '4000.00', '5000.00', 12, 'root@localhost', '2021-11-26'),
(3, 1, 'Nissan GT-R 3.8 V6 419 kW (570 CV) Black Edition (2020)', '10000.00', '15000.00', 12, 'Nissan GT-R 3.8 V6 419 kW (570 CV) Black Edition (2020)', '10000.00', '15000.00', 12, 'root@localhost', '2021-11-26'),
(4, 1, 'Nissan GT-R 3.8 V6 419 kW (570 CV) Black Edition (2020)', '10000.00', '15000.00', 12, 'Nissan GT-R 3.8 V6 419 kW (570 CV) Black Edition (2020)', '10000.00', '15000.00', 12, 'root@localhost', '2021-11-26'),
(5, 2, 'Camionetas color rojo.', '200.00', '12.00', 12, 'Camionetas color rojo.', '200.00', '12.00', 12, 'root@localhost', '2021-11-26'),
(6, 2, 'Camionetas color rojo.', '200.00', '12.00', 12, 'Camionetas color rojo.', '200.00', '12.00', 12, 'root@localhost', '2021-11-26'),
(7, 3, 'Descripcion', '100.00', '3000.00', 12, 'Descripcionk', '100.00', '3000.00', 12, 'root@localhost', '2021-11-27'),
(8, 3, 'Descripcionk', '100.00', '3000.00', 12, 'Descripcionk', '10.00', '30.00', 12, 'root@localhost', '2021-11-27'),
(9, 1, 'Descripcion', '200.00', '20.00', 12, 'NISSAN Versa 2019', '200.00', '20.00', 12, 'root@localhost', '2021-11-27'),
(10, 1, 'NISSAN Versa 2019', '200.00', '20.00', 12, 'NISSAN altima 2019', '200.00', '20.00', 12, 'root@localhost', '2021-11-27'),
(11, 2, 'Descripcion', '1000.00', '2000.00', 12, ' Autos deportivos', '7000.00', '2000.00', 12, 'root@localhost', '2021-11-27'),
(12, 3, 'Descripcionk', '10.00', '30.00', 12, 'Dimensiones: 4508 / 1709 / 1410 / 2535 mm', '10.00', '30.00', 12, 'root@localhost', '2021-11-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_eliminado`
--

CREATE TABLE `vehiculo_eliminado` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `precio_compra` decimal(8,2) NOT NULL,
  `precio_venta` decimal(8,2) NOT NULL,
  `cilindraje` int(10) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `ano` int(4) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `fecha_eliminacio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculo_eliminado`
--

INSERT INTO `vehiculo_eliminado` (`id`, `id_producto`, `descripcion`, `precio_compra`, `precio_venta`, `cilindraje`, `modelo`, `ano`, `id_marca`, `usuario`, `fecha_eliminacio`) VALUES
(1, 1, 'MMMMMMMMMMMMMMMM', '2000.00', '4000.00', 4, 'MKLHJY', 2020, 2, 'root@localhost', '2021-11-26'),
(2, 3, 'vehiculos', '12.00', '23.00', 4, 'modelo', 2021, 12, 'root@localhost', '2021-11-26'),
(3, 5, 'jklklm', '4000.00', '5000.00', 5, 'klj', 2020, 12, 'root@localhost', '2021-11-26'),
(4, 2, 'LLLL', '3000.00', '80000.00', 5, 'LLL', 2020, 12, 'root@localhost', '2021-11-26'),
(5, 4, 'klll', '3000.00', '2000.00', 4, 'klhdjf', 2020, 12, 'root@localhost', '2021-11-26'),
(6, 2, 'Camionetas color rojo.', '200.00', '12.00', 4, 'vw', 2021, 12, 'root@localhost', '2021-11-26'),
(7, 3, 'Descripci?n', '200.00', '10.00', 4, 'Modelo', 2021, 12, 'root@localhost', '2021-11-26'),
(8, 1, 'Nissan GT-R 3.8 V6 419 kW (570 CV) Black Edition (2020)', '10000.00', '15000.00', 4, 'GT-R', 2020, 12, 'root@localhost', '2021-11-26'),
(9, 5, 'KJP', '10000.00', '50000.00', 5, 'GRT-H', 2020, 12, 'root@localhost', '2021-11-27'),
(10, 4, 'jkl', '5600.00', '78000.00', 4, 'mlkjh', 2020, 12, 'root@localhost', '2021-11-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `total_pago` decimal(20,2) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `fecha_venta`, `total_pago`, `descuento`, `id_cliente`, `id_usuario`) VALUES
(99, '2021-11-27', '17.60', 12, 425273323, 1),
(100, '2021-11-27', '1760.00', 12, 425273323, 1),
(101, '2021-11-27', '1960.00', 2, 456789323, 1),
(102, '2021-11-27', '28.50', 5, 456789323, 1),
(103, '2021-11-27', '1900.00', 5, 567891234, 1),
(104, '2021-11-27', '1900.00', 5, 345678923, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clavesanteriores`
--
ALTER TABLE `clavesanteriores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle_v`),
  ADD KEY `fk_detalle_product` (`id_producto`),
  ADD KEY `fk_detalle_sucursal` (`id_sucursal`),
  ADD KEY `fk_detalle_venta` (`id_venta`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id_inventario`),
  ADD UNIQUE KEY `id_producto` (`id_vehiculo`),
  ADD KEY `categoria` (`id_categoria`);

--
-- Indices de la tabla `inventario_total`
--
ALTER TABLE `inventario_total`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `limite_productos`
--
ALTER TABLE `limite_productos`
  ADD PRIMARY KEY (`id_limite`),
  ADD UNIQUE KEY `id_producto` (`id_vehiculo`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_proveedor` (`id_marca`);

--
-- Indices de la tabla `vehiculo_actualizado`
--
ALTER TABLE `vehiculo_actualizado`
  ADD PRIMARY KEY (`id_vehuculo_ap`);

--
-- Indices de la tabla `vehiculo_eliminado`
--
ALTER TABLE `vehiculo_eliminado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_ventas_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clavesanteriores`
--
ALTER TABLE `clavesanteriores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle_v` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `inventario_total`
--
ALTER TABLE `inventario_total`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `limite_productos`
--
ALTER TABLE `limite_productos`
  MODIFY `id_limite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `vehiculo_actualizado`
--
ALTER TABLE `vehiculo_actualizado`
  MODIFY `id_vehuculo_ap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `vehiculo_eliminado`
--
ALTER TABLE `vehiculo_eliminado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_product` FOREIGN KEY (`id_producto`) REFERENCES `vehiculo` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `limite_productos`
--
ALTER TABLE `limite_productos`
  ADD CONSTRAINT `producto` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `fk_producto_prove` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fj_ventas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ventas_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
