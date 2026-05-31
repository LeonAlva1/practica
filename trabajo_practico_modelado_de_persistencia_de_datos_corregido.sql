-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
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
-- Crear y seleccionar la base de datos
--
CREATE DATABASE IF NOT EXISTS `trabajo_practico_modelado_de_persistencia_de_datos_corregido`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE `trabajo_practico_modelado_de_persistencia_de_datos_corregido`;

-- --------------------------------------------------------
-- Tabla: `vehiculo`
-- --------------------------------------------------------

CREATE TABLE `vehiculo` (
  `matricula` varchar(10) NOT NULL,
  `color`     varchar(50)  DEFAULT NULL,
  `marca`     varchar(100) DEFAULT NULL,
  `modelo`    varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `vehiculo` (`matricula`, `color`, `marca`, `modelo`) VALUES
('',       NULL,    NULL,         NULL),
('ABC123', 'Rojo',  'Ford',       'Focus'),
('BCD890', 'Rojo',  'Kia',        'Rio'),
('DEF456', 'Blanco','Chevrolet',  'Cruze'),
('GHI789', 'Negro', 'Toyota',     'Corolla'),
('JKL012', 'Azul',  'Volkswagen', 'Golf'),
('MNO345', 'Gris',  'Renault',    'Sandero'),
('PQR678', 'Plata', 'Peugeot',    '208'),
('STU901', 'Verde', 'Honda',      'Civic'),
('VWX234', 'Blanco','Fiat',       'Cronos'),
('YZA567', 'Negro', 'Nissan',     'Versa');

-- --------------------------------------------------------
-- Tabla: `cliente`
-- --------------------------------------------------------

CREATE TABLE `cliente` (
  `Id_cliente`        int(10) UNSIGNED NOT NULL,
  `nombre`            varchar(50)  DEFAULT NULL,
  `apellido`          varchar(50)  DEFAULT NULL,
  `telefono`          varchar(20)  DEFAULT NULL,
  `vehiculo_a_nombre` varchar(10)  DEFAULT NULL,
  `veh_asign`         int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cliente` (`Id_cliente`, `nombre`, `apellido`, `telefono`, `vehiculo_a_nombre`, `veh_asign`) VALUES
(1,  'Carlos',  'Rodríguez', '1145678901', 'ABC123', NULL),
(2,  'María',   'González',  '1156789012', 'DEF456', NULL),
(3,  'Jorge',   'Martínez',  '1167890123', 'GHI789', NULL),
(4,  'Laura',   'López',     '1178901234', 'JKL012', NULL),
(5,  'Andrés',  'Fernández', '1189012345', 'MNO345', NULL),
(6,  'Sofía',   'Pérez',     '1190123456', 'PQR678', NULL),
(7,  'Ricardo', 'Sánchez',   '1101234567', 'STU901', NULL),
(8,  'Valeria', 'Torres',    '1112345678', 'VWX234', NULL),
(9,  'Gustavo', 'Ramírez',   '1123456789', 'YZA567', NULL),
(10, 'Natalia', 'Díaz',      '1134567890', 'BCD890', NULL);

-- --------------------------------------------------------
-- Tabla: `mecanico`
-- --------------------------------------------------------

CREATE TABLE `mecanico` (
  `Id_mecanico` int(10) UNSIGNED NOT NULL,
  `nombre`      varchar(50) DEFAULT NULL,
  `apellido`    varchar(50) DEFAULT NULL,
  `telefono`    int(11)     DEFAULT NULL,
  `dni`         int(11)     DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `mecanico` (`Id_mecanico`, `nombre`, `apellido`, `telefono`, `dni`) VALUES
(1,  'Pablo',   'Acosta',  1155001100, 28456789),
(2,  'Diego',   'Herrera', 1155002200, 30567890),
(3,  'Sergio',  'Medina',  1155003300, 25678901),
(4,  'Fabián',  'Castro',  1155004400, 32789012),
(5,  'Tomás',   'Romero',  1155005500, 27890123),
(6,  'Lucas',   'Vargas',  1155006600, 31901234),
(7,  'Nicolás', 'Suárez',  1155007700, 29012345),
(8,  'Matías',  'Ríos',    1155008800, 33123456),
(9,  'Emanuel', 'Paredes', 1155009900, 26234567),
(10, 'Rodrigo', 'Molina',  1155010100, 34345678);

-- --------------------------------------------------------
-- Tabla: `mecanico_diagnostico`
-- --------------------------------------------------------

CREATE TABLE `mecanico_diagnostico` (
  `Id_mecanico_d` int(10) UNSIGNED NOT NULL,
  `tematica`      varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `mecanico_diagnostico` (`Id_mecanico_d`, `tematica`) VALUES
(1,  'Diagnóstico de motor'),
(2,  'Diagnóstico de frenos'),
(3,  'Diagnóstico de suspensión'),
(4,  'Diagnóstico eléctrico'),
(5,  'Diagnóstico de transmisión'),
(6,  'Diagnóstico de escape'),
(7,  'Diagnóstico de dirección'),
(8,  'Diagnóstico de climatización'),
(9,  'Diagnóstico de combustible'),
(10, 'Diagnóstico de diferencial');

-- --------------------------------------------------------
-- Tabla: `mecanico_reparacion`
-- --------------------------------------------------------

CREATE TABLE `mecanico_reparacion` (
  `Id_mecanico_r`   int(10) UNSIGNED NOT NULL,
  `horariodetrabajo` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `mecanico_reparacion` (`Id_mecanico_r`, `horariodetrabajo`) VALUES
(1,  '2024-01-08 08:00:00'),
(2,  '2024-01-09 09:30:00'),
(3,  '2024-01-10 10:00:00'),
(4,  '2024-01-11 08:30:00'),
(5,  '2024-01-12 11:00:00'),
(6,  '2024-01-15 09:00:00'),
(7,  '2024-01-16 10:30:00'),
(8,  '2024-01-17 08:00:00'),
(9,  '2024-01-18 13:00:00'),
(10, '2024-01-19 14:30:00');

-- --------------------------------------------------------
-- Tabla: `repuesto`
-- --------------------------------------------------------

CREATE TABLE `repuesto` (
  `codigo`              int(10) UNSIGNED NOT NULL,
  `nombre`              varchar(50)  DEFAULT NULL,
  `precio`              double(10,2) DEFAULT NULL,
  `stock`               int(11)      DEFAULT NULL,
  `unidad_de_medida_cm` double(10,6) DEFAULT NULL,
  `punto_de_pedido`     varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `repuesto` (`codigo`, `nombre`, `precio`, `stock`, `unidad_de_medida_cm`, `punto_de_pedido`) VALUES
(1,  'Filtro de aceite',        1500.00, 30,  12.500000, 'Mann Filter'),
(2,  'Pastillas de freno',      3200.00, 20,  18.750000, 'Brembo'),
(3,  'Amortiguador delantero',  8500.00, 10,  35.000000, 'Monroe'),
(4,  'Batería 12V',            12000.00,  8,  27.300000, 'Bosch'),
(5,  'Correa de distribución',  4500.00, 15,  22.100000, 'Gates'),
(6,  'Bujías x4',              2200.00, 40,   5.500000, 'NGK'),
(7,  'Disco de freno',          5800.00, 12,  28.000000, 'Brembo'),
(8,  'Radiador',                9500.00,  6,  45.600000, 'Valeo'),
(9,  'Bomba de agua',           6700.00,  9,  19.800000, 'Dolz'),
(10, 'Termostato',              1800.00, 25,   8.200000, 'Wahler');

-- --------------------------------------------------------
-- Tabla: `ficha`
-- (Se eliminó Id_presupuesto — redundante, la relación
--  ya existe desde presupuesto.nro_ficha → ficha)
-- --------------------------------------------------------

CREATE TABLE `ficha` (
  `Id_f`              int(10) UNSIGNED NOT NULL,
  `fecha_ingreso`     datetime     DEFAULT NULL,
  `auto_asignado`     varchar(10)  DEFAULT NULL,
  `Id_mecanico_acargo` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `ficha` (`Id_f`, `fecha_ingreso`, `auto_asignado`, `Id_mecanico_acargo`) VALUES
(1,  '2024-01-08 08:30:00', 'ABC123', 1),
(2,  '2024-01-09 09:00:00', 'DEF456', 2),
(3,  '2024-01-10 10:15:00', 'GHI789', 3),
(4,  '2024-01-11 08:45:00', 'JKL012', 4),
(5,  '2024-01-12 11:30:00', 'MNO345', 5),
(6,  '2024-01-15 09:20:00', 'PQR678', 6),
(7,  '2024-01-16 10:00:00', 'STU901', 7),
(8,  '2024-01-17 08:10:00', 'VWX234', 8),
(9,  '2024-01-18 13:30:00', 'YZA567', 9),
(10, '2024-01-19 14:00:00', 'BCD890', 10);

-- --------------------------------------------------------
-- Tabla: `presupuesto`
-- --------------------------------------------------------

CREATE TABLE `presupuesto` (
  `Id_p`              int(10) UNSIGNED NOT NULL,
  `cantidad_repuesto` int(11)      DEFAULT NULL,
  `valor_estimado`    double(30,2) DEFAULT NULL,
  `diagnostico_final` varchar(999) DEFAULT NULL,
  `codigo_pieza`      int(10) UNSIGNED DEFAULT NULL,
  `Id_mecanico_acargo` int(10) UNSIGNED DEFAULT NULL,
  `nro_ficha`         int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `presupuesto`
(`Id_p`, `cantidad_repuesto`, `valor_estimado`, `diagnostico_final`, `codigo_pieza`, `Id_mecanico_acargo`, `nro_ficha`) VALUES
(1,  2, 18500.00, 'Cambio de pastillas y disco de freno delantero',    2, 1,  1),
(2,  1, 12000.00, 'Reemplazo de batería descargada',                   4, 2,  2),
(3,  4,  8800.00, 'Cambio de bujías y filtro de aceite',               6, 3,  3),
(4,  1,  8500.00, 'Reemplazo de amortiguador delantero izquierdo',     3, 4,  4),
(5,  1,  4500.00, 'Cambio de correa de distribución desgastada',       5, 5,  5),
(6,  1,  9500.00, 'Reemplazo de radiador con pérdida de refrigerante', 8, 6,  6),
(7,  2, 11400.00, 'Cambio de bombas de agua y termostato',             9, 7,  7),
(8,  2, 13700.00, 'Reemplazo de discos y pastillas traseras',          7, 8,  8),
(9,  1,  6700.00, 'Cambio de bomba de agua por sobrecalentamiento',    9, 9,  9),
(10, 3,  7300.00, 'Cambio de filtro, bujías y termostato',             1, 10, 10);

-- ========================================================
-- ÍNDICES
-- ========================================================

ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_cliente`),
  ADD KEY `vehiculo_a_nombre` (`vehiculo_a_nombre`);

ALTER TABLE `ficha`
  ADD PRIMARY KEY (`Id_f`),
  ADD KEY `Id_mecanico_acargo` (`Id_mecanico_acargo`),
  ADD KEY `auto_asignado` (`auto_asignado`);

ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`Id_mecanico`);

ALTER TABLE `mecanico_diagnostico`
  ADD PRIMARY KEY (`Id_mecanico_d`);

ALTER TABLE `mecanico_reparacion`
  ADD PRIMARY KEY (`Id_mecanico_r`);

ALTER TABLE `presupuesto`
  ADD PRIMARY KEY (`Id_p`),
  ADD KEY `Id_mecanico_acargo` (`Id_mecanico_acargo`),
  ADD KEY `codigo_pieza` (`codigo_pieza`),
  ADD KEY `nro_ficha` (`nro_ficha`);

ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`codigo`);

ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`matricula`);

-- ========================================================
-- AUTO_INCREMENT
-- ========================================================

ALTER TABLE `cliente`
  MODIFY `Id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `ficha`
  MODIFY `Id_f` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `mecanico`
  MODIFY `Id_mecanico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `presupuesto`
  MODIFY `Id_p` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `repuesto`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

-- ========================================================
-- CLAVES FORÁNEAS
-- ========================================================

-- cliente → vehiculo
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1`
    FOREIGN KEY (`vehiculo_a_nombre`) REFERENCES `vehiculo` (`matricula`);

-- ficha → mecanico_reparacion
-- ficha → vehiculo
ALTER TABLE `ficha`
  ADD CONSTRAINT `ficha_ibfk_1`
    FOREIGN KEY (`Id_mecanico_acargo`) REFERENCES `mecanico_reparacion` (`Id_mecanico_r`),
  ADD CONSTRAINT `ficha_ibfk_2`
    FOREIGN KEY (`auto_asignado`) REFERENCES `vehiculo` (`matricula`);

-- mecanico_diagnostico → mecanico
ALTER TABLE `mecanico_diagnostico`
  ADD CONSTRAINT `mecanico_diagnostico_ibfk_1`
    FOREIGN KEY (`Id_mecanico_d`) REFERENCES `mecanico` (`Id_mecanico`);

-- mecanico_reparacion → mecanico
ALTER TABLE `mecanico_reparacion`
  ADD CONSTRAINT `mecanico_reparacion_ibfk_1`
    FOREIGN KEY (`Id_mecanico_r`) REFERENCES `mecanico` (`Id_mecanico`);

-- presupuesto → mecanico_diagnostico
-- presupuesto → repuesto
-- presupuesto → ficha
ALTER TABLE `presupuesto`
  ADD CONSTRAINT `presupuesto_ibfk_1`
    FOREIGN KEY (`Id_mecanico_acargo`) REFERENCES `mecanico_diagnostico` (`Id_mecanico_d`),
  ADD CONSTRAINT `presupuesto_ibfk_2`
    FOREIGN KEY (`codigo_pieza`) REFERENCES `repuesto` (`codigo`),
  ADD CONSTRAINT `presupuesto_ibfk_3`
    FOREIGN KEY (`nro_ficha`) REFERENCES `ficha` (`Id_f`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
