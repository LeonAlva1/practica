-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2026 a las 23:51:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trabajo_practico_modelado_de_persistencia_de_datos_corregido`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_cliente` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `vehiculo_a_nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha`
--

CREATE TABLE `ficha` (
  `Id_f` int(10) UNSIGNED NOT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `auto_asignado` varchar(10) DEFAULT NULL,
  `Id_mecanico_acargo` int(10) UNSIGNED DEFAULT NULL,
  `Id_presupuesto` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `Id_mecanico` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico_diagnostico`
--

CREATE TABLE `mecanico_diagnostico` (
  `Id_mecanico_d` int(10) UNSIGNED NOT NULL,
  `tematica` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico_reparacion`
--

CREATE TABLE `mecanico_reparacion` (
  `Id_mecanico_r` int(10) UNSIGNED NOT NULL,
  `horariodetrabajo` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

CREATE TABLE `presupuesto` (
  `Id_p` int(10) UNSIGNED NOT NULL,
  `cantidad_repuesto` int(11) DEFAULT NULL,
  `valor_estimado` double(30,2) DEFAULT NULL,
  `diagnostico_final` varchar(999) DEFAULT NULL,
  `codigo_pieza` int(10) UNSIGNED DEFAULT NULL,
  `Id_mecanico_acargo` int(10) UNSIGNED DEFAULT NULL,
  `nro_ficha` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuesto`
--

CREATE TABLE `repuesto` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` double(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `unidad_de_medida_cm` double(10,6) DEFAULT NULL,
  `punto_de_pedido` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `matricula` varchar(10) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_cliente`),
  ADD KEY `vehiculo_a_nombre` (`vehiculo_a_nombre`);

--
-- Indices de la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`Id_f`),
  ADD KEY `Id_mecanico_acargo` (`Id_mecanico_acargo`),
  ADD KEY `auto_asignado` (`auto_asignado`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`Id_mecanico`);

--
-- Indices de la tabla `mecanico_diagnostico`
--
ALTER TABLE `mecanico_diagnostico`
  ADD PRIMARY KEY (`Id_mecanico_d`);

--
-- Indices de la tabla `mecanico_reparacion`
--
ALTER TABLE `mecanico_reparacion`
  ADD PRIMARY KEY (`Id_mecanico_r`);

--
-- Indices de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD PRIMARY KEY (`Id_p`),
  ADD KEY `Id_mecanico_acargo` (`Id_mecanico_acargo`),
  ADD KEY `codigo_pieza` (`codigo_pieza`),
  ADD KEY `nro_ficha` (`nro_ficha`);

--
-- Indices de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`matricula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ficha`
--
ALTER TABLE `ficha`
  MODIFY `Id_f` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  MODIFY `Id_mecanico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  MODIFY `Id_p` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`vehiculo_a_nombre`) REFERENCES `vehiculo` (`matricula`);

--
-- Filtros para la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD CONSTRAINT `ficha_ibfk_1` FOREIGN KEY (`Id_mecanico_acargo`) REFERENCES `mecanico_reparacion` (`Id_mecanico_r`),
  ADD CONSTRAINT `ficha_ibfk_2` FOREIGN KEY (`auto_asignado`) REFERENCES `vehiculo` (`matricula`);

--
-- Filtros para la tabla `mecanico_diagnostico`
--
ALTER TABLE `mecanico_diagnostico`
  ADD CONSTRAINT `mecanico_diagnostico_ibfk_1` FOREIGN KEY (`Id_mecanico_d`) REFERENCES `mecanico` (`Id_mecanico`);

--
-- Filtros para la tabla `mecanico_reparacion`
--
ALTER TABLE `mecanico_reparacion`
  ADD CONSTRAINT `mecanico_reparacion_ibfk_1` FOREIGN KEY (`Id_mecanico_r`) REFERENCES `mecanico` (`Id_mecanico`);

--
-- Filtros para la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD CONSTRAINT `presupuesto_ibfk_1` FOREIGN KEY (`Id_mecanico_acargo`) REFERENCES `mecanico_diagnostico` (`Id_mecanico_d`),
  ADD CONSTRAINT `presupuesto_ibfk_2` FOREIGN KEY (`codigo_pieza`) REFERENCES `repuesto` (`codigo`),
  ADD CONSTRAINT `presupuesto_ibfk_3` FOREIGN KEY (`nro_ficha`) REFERENCES `ficha` (`Id_f`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
