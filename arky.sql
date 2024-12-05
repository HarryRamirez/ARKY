-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 20:52:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arky`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `rut` varchar(255) NOT NULL,
  `rubro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `correo`, `telefono`, `direccion`, `rut`, `rubro`) VALUES
(1, 'Laura Beatriz Martínez López', 'laura.martinezlopez@gmail.com', '3106543210', 'Calle 85 #12-34, Bogotá', '12.345.678-9', 'Comercio Electrónico'),
(2, 'Carlos Eduardo Hernández Ramírez', 'carlos.hernandezramirez@hotmail.com', '3127654321', 'Carrera 15 #78-56, Bogotá', '13.456.789-0', 'Consultoría Financiera'),
(3, 'María Fernanda López Silva', 'maria.lopezsilva@gmail.com', '3148765432', 'Calle 10 #23-45, Medellín', '14.567.890-1', 'Marketing Digita'),
(4, 'Juan Andrés Pérez González', 'juan.perezgonzalez@gmail.com', '3159987766', 'Carrera 50 #25-67, Medellín', '15.678.901-2', 'Desarrollo de Software'),
(5, 'Ana Isabel González Reyes', 'ana.gonzalezreyes@yahoo.com', '3168876655', 'Calle 70 #30-12, Cali', '16.789.012-3', 'Educación'),
(6, 'Luis Alberto Ramírez Peña', 'luis.ramirezpena@gmail.com', '3177765544', 'Carrera 65 #45-89, Cali', '17.890.123-4', 'Salud y Bienestar'),
(7, 'Patricia Alejandra Castillo Morales', 'patricia.castillomorales@hotmail.com', '3186654433', 'Calle 13 #6-78, Cartagena', '18.901.234-5', 'Turismo'),
(8, 'José Antonio Torres Fuentes', 'jose.torresfuentes@gmail.com', '3195543322', 'Carrera 2 #45-67, Barranquilla', '19.012.345-6', 'Logística'),
(9, 'Paula Andrea Rojas Soto', 'paula.rojassoto@gmail.com', '3204432211', 'Calle 8 #9-10, Santa Marta', '20.123.456-7', 'Restauración'),
(16, 'Valeria Constanza Vega Paredes', 'valeria.vegaparedes@yahoo.com', '3222210099', 'Calle 23 #67-89, Pereira', '22.345.678-9', 'Retail'),
(17, 'Nicolás Javier Morales Herrera', 'nicolas.moralesherrera@gmail.com', '3231109988', 'Carrera 10 #54-32, Manizales', '23.456.789-0', 'Construcción'),
(71, 'Camila Soledad Díaz Riquelme', 'camila.diazriquelme@hotmail.com', '3249988877', 'Calle 11 #22-44, Cúcuta', '24.567.890-1', 'Abogada'),
(85, 'Maria Sofia Ruiz Alvarado', 'mario@gmail.com', '3214563489', 'Carrera 20 #34-65', '12.123.345-5', 'Abogado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id_cotizacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_descuento` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `remitente` varchar(255) DEFAULT NULL,
  `fecha_cot` date NOT NULL,
  `fecha_evento` date NOT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `neto` decimal(10,2) DEFAULT NULL,
  `iva` decimal(5,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`id_cotizacion`, `id_usuario`, `id_cliente`, `id_descuento`, `id_estado`, `remitente`, `fecha_cot`, `fecha_evento`, `referencia`, `neto`, `iva`, `total`) VALUES
(6, 1, 1, 1, 2, 'Juan Pérez', '2024-08-27', '2024-08-27', 'Ref-001', 1390000.00, 0.00, 1251000.00),
(8, 3, 3, 3, 1, 'Carlos López', '2024-08-27', '2024-08-27', 'Ref-003', 388000.00, 0.19, 269376.00),
(9, 1, 4, 4, 2, 'Juan Pérez', '2024-08-27', '2024-08-27', 'Ref-004', 251000.00, 0.00, 188250.00),
(10, 3, 3, 3, 3, 'Sandra Quezada', '2024-08-01', '2024-08-30', 'Ref-010', 67000.00, 0.00, 53600.00),
(15, 2, 3, 7, 2, 'otto nievez', '2024-08-12', '2024-08-30', 'Ref-009', 3000000.00, 0.00, 1800000.00),
(16, 2, 2, 2, 1, 'John Doe', '2024-09-16', '2024-10-01', 'REF001', 700000.00, 0.19, 708000.00),
(19, 2, 3, 4, 1, 'Aura Vanesa', '2024-09-16', '2024-10-01', 'REF001', 300000.00, 0.00, 225000.00),
(20, 3, 4, 1, 3, 'Adolfo Villanueva', '2024-09-16', '2024-10-01', 'REF001', 300000.00, 0.19, 321300.00),
(21, 1, 1, 5, 1, 'Lorena Montenegro', '2024-09-16', '2024-10-01', 'REF001', 300000.00, 0.00, 210000.00),
(22, 2, 2, 2, 2, 'John Doe', '2024-09-16', '2024-10-01', 'REF001', 600000.00, 0.00, 510000.00),
(23, 7, 6, 7, 1, 'Yimer Mahecha', '2024-09-16', '2024-10-01', 'REF001', 500000.00, 0.19, 357000.00),
(24, 11, 17, 2, 2, 'Jenny Naranjo', '2024-09-16', '2024-10-01', 'REF001', 700000.00, 0.00, 595000.00),
(56, 10, 71, 3, 1, 'Yimer Mahecha', '2024-09-16', '2024-10-01', 'REF001', 300000.00, NULL, 300000.00),
(78, 41, 85, 2, 2, 'carlos', '2024-12-03', '2024-12-25', 'navidad', 88000.00, 0.19, 94248.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `id_descuento` int(11) NOT NULL,
  `porcentaje` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descuento`
--

INSERT INTO `descuento` (`id_descuento`, `porcentaje`) VALUES
(1, 0),
(2, 10),
(3, 15),
(4, 20),
(5, 25),
(6, 30),
(7, 35),
(8, 40),
(9, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre_estado`) VALUES
(1, 'Aceptada'),
(2, 'Pendiente'),
(3, 'Rechazada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemcotizacion`
--

CREATE TABLE `itemcotizacion` (
  `id_item_cotizacion` int(11) NOT NULL,
  `id_cotizacion` int(11) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_unitario` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `itemcotizacion`
--

INSERT INTO `itemcotizacion` (`id_item_cotizacion`, `id_cotizacion`, `id_servicio`, `cantidad`, `valor_unitario`, `valor_total`) VALUES
(76, 6, 1, 50, 5000.00, 250000.00),
(77, 6, 2, 10, 3000.00, 30000.00),
(78, 6, 3, 1, 15000.00, 15000.00),
(79, 6, 4, 1, 30000.00, 30000.00),
(80, 6, 5, 5, 8000.00, 40000.00),
(81, 6, 6, 1, 25000.00, 25000.00),
(88, 8, 13, 1, 8000.00, 8000.00),
(89, 8, 14, 3, 20000.00, 60000.00),
(90, 8, 15, 1, 25000.00, 25000.00),
(91, 8, 1, 50, 5000.00, 250000.00),
(92, 8, 2, 10, 3000.00, 30000.00),
(93, 8, 3, 1, 15000.00, 15000.00),
(94, 9, 4, 1, 30000.00, 30000.00),
(95, 9, 5, 5, 8000.00, 40000.00),
(96, 9, 6, 1, 25000.00, 25000.00),
(97, 9, 7, 2, 12000.00, 24000.00),
(98, 9, 8, 3, 20000.00, 60000.00),
(99, 9, 9, 4, 18000.00, 72000.00),
(100, 10, 10, 2, 10000.00, 20000.00),
(101, 10, 11, 1, 15000.00, 15000.00),
(102, 10, 12, 2, 12000.00, 24000.00),
(103, 10, 13, 1, 8000.00, 8000.00),
(106, 6, 3, 40, 40000.00, 1000000.00),
(107, 0, 3, 10, 500.00, 5000.00),
(108, 0, 5, 2, 1500.00, 3000.00),
(109, 0, 3, 10, 500.00, 5000.00),
(110, 0, 5, 2, 1500.00, 3000.00),
(111, 0, 29, 40, 40000.00, 1000000.00),
(112, 15, 29, 40, 40000.00, 1000000.00),
(113, 15, 29, 40, 40000.00, 1000000.00),
(114, 15, 29, 40, 40000.00, 1000000.00),
(115, 16, 1, 10, 10000.00, 100000.00),
(116, 16, 2, 5, 20000.00, 100000.00),
(121, 16, 1, 10, 10000.00, 100000.00),
(122, 16, 2, 5, 20000.00, 100000.00),
(123, 16, 1, 10, 10000.00, 100000.00),
(124, 16, 2, 5, 20000.00, 100000.00),
(125, 16, 3, 5, 20000.00, 100000.00),
(126, 19, 1, 10, 10000.00, 100000.00),
(127, 19, 2, 5, 20000.00, 100000.00),
(128, 19, 3, 5, 20000.00, 100000.00),
(129, 20, 4, 10, 10000.00, 100000.00),
(130, 20, 5, 5, 20000.00, 100000.00),
(131, 20, 6, 5, 20000.00, 100000.00),
(132, 21, 4, 10, 10000.00, 100000.00),
(133, 21, 5, 5, 20000.00, 100000.00),
(134, 21, 6, 5, 20000.00, 100000.00),
(135, 22, 4, 10, 10000.00, 100000.00),
(136, 22, 5, 5, 20000.00, 100000.00),
(137, 22, 6, 5, 20000.00, 100000.00),
(138, 22, 1, 10, 10000.00, 100000.00),
(139, 22, 2, 5, 20000.00, 100000.00),
(140, 22, 3, 5, 20000.00, 100000.00),
(141, 23, 4, 10, 10000.00, 100000.00),
(142, 23, 5, 5, 20000.00, 100000.00),
(143, 23, 6, 5, 20000.00, 100000.00),
(144, 23, 5, 5, 20000.00, 100000.00),
(145, 23, 6, 5, 20000.00, 100000.00),
(146, 24, 4, 10, 10000.00, 100000.00),
(147, 24, 5, 5, 20000.00, 100000.00),
(148, 24, 6, 5, 20000.00, 100000.00),
(149, 24, 5, 5, 20000.00, 100000.00),
(150, 24, 6, 5, 20000.00, 100000.00),
(151, 24, 8, 12, 20000.00, 200000.00),
(188, 56, 4, 10, 10000.00, 100000.00),
(189, 56, 5, 5, 20000.00, 100000.00),
(190, 56, 6, 5, 20000.00, 100000.00),
(191, 56, 5, 5, 20000.00, 100000.00),
(192, 56, 6, 5, 20000.00, 100000.00),
(229, 78, 5, 5, 8000.00, 40000.00),
(230, 78, 7, 4, 12000.00, 48000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'ASSESOR'),
(3, 'COORDINADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `id_tipo_serv` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `neto` decimal(10,2) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `id_tipo_serv`, `nombre`, `neto`, `descripcion`) VALUES
(1, 1, 'Alquiler de Sillas', 5000.00, 'Alquiler de sillas para eventos'),
(2, 1, 'Montaje de Sillas', 3000.00, 'Montaje y desmontaje de sillas'),
(3, 2, 'Sistema de Sonido Básico', 15000.00, 'Sistema de sonido básico para eventos'),
(4, 2, 'Sistema de Sonido Profesional', 30000.00, 'Sistema de sonido profesional'),
(5, 2, 'Microfonía', 8000.00, 'Alquiler de micrófonos'),
(6, 3, 'Coordinación Logística', 25000.00, 'Coordinación logística de eventos'),
(7, 3, 'Transporte de Equipos', 12000.00, 'Transporte de equipos para eventos'),
(8, 3, 'Montaje de Escenarios', 20000.00, 'Montaje y desmontaje de escenarios'),
(9, 4, 'Personal de Seguridad', 100000.00, 'Personal de seguridad para eventos'),
(10, 4, 'Personal de Limpieza', 100000.00, 'Personal de limpieza post-evento'),
(11, 4, 'Asistentes de Evento', 100000.00, 'Asistentes para organización de eventos'),
(12, 4, 'Personal de Montaje', 100000.00, 'Personal especializado en montaje'),
(13, 4, 'Recepcionistas', 100000.00, 'Recepcionistas para registro de asistentes'),
(14, 4, 'Personal de Catering', 100000.00, 'Personal especializado en catering'),
(15, 4, 'Coordinadores de Área', 100000.00, 'Coordinadores para áreas específicas en eventos'),
(29, 4, 'Personal de Catering', 150000.00, 'Personal especializado en catering'),
(30, 1, 'Sillas desplegables', 5000.00, 'Eeventos de corta duracion'),
(38, 1, 'Nuevo Nombre del Producto', 2000.00, 'Nueva Descripción del Producto'),
(39, 7, 'Guitarra', 200000.00, 'Guitarra  para conciertos'),
(44, 8, 'mix', 150000.00, 'tablero de mezclas'),
(46, 2, 'Bocinas ', 150000.00, 'bocinas para cualquier evento, campo cerrado o abierto'),
(52, 5, 'Bateria acustica', 100000.00, 'bateria acustica'),
(54, 2, 'bafles', 100000.00, 'musica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposervicio`
--

CREATE TABLE `tiposervicio` (
  `id_tipo_servicio` int(11) NOT NULL,
  `nombre_tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiposervicio`
--

INSERT INTO `tiposervicio` (`id_tipo_servicio`, `nombre_tipo`) VALUES
(1, 'Silletería'),
(2, 'Sonido'),
(3, 'Logística'),
(4, 'Personal'),
(5, 'Viaticos'),
(6, 'Alimentos'),
(7, 'Instrumentos'),
(8, 'Electronico'),
(9, 'Ambiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_rol`, `nombre`, `apellido`, `correo`, `contrasenia`) VALUES
(1, 1, 'Juan', 'Pérez', 'juan.perez@empresa.com', 'contrasenia1'),
(2, 2, 'Ana', 'García', 'ana.garcia@empresa.com', 'contrasenia2'),
(3, 3, 'Carlos', 'López', 'carlos.lopez@empresa.com', 'contrasenia3'),
(7, 2, 'Aura Vanesa', 'Cardozo Montenegro', 'aura@gmail.com', 'aura456'),
(8, 1, 'Manuel', 'Quezada Perez', 'manuel@gmail.com', 'manu456'),
(9, 3, 'Edilma', 'Ramirez', 'edilma@gmail.com', 'edi765'),
(10, 1, 'Mildrey', 'Montenegro', 'mild@gmail.com', 'mild765'),
(11, 2, 'Abril', 'Cardozo', 'abril@gmail.com', 'miperro234'),
(16, 1, 'Kenny Jarrison', 'Ramirez Quezada', 'Kenny@yahoo.com', '$2a$10$qCM0PixrgeXouUMFuiEdT.6Mo4kgIzpQQ5JuMv/xRjvHmoGTCB0Yq'),
(17, 2, 'Thomas ', 'Aguirre Leon', 'Thomas@gmail.com', '$2a$10$DHqtOVK..6iOKWOgOXUzweL42BLwXQWTralZy2LBpprpK3LR3n4Yu'),
(18, 2, 'Carlos', 'Rivera Rivera', 'Carlos@gmail.com', '$2a$10$91ofw5aEEw/52MwpJmKFz.vdI5ofN.voFtdI1HZPmUgor27v.wHau'),
(31, 3, 'Andres', 'Cardozo montenegro', 'Andres@gmail.com', '$2a$10$Yo69RNbkKnuSW5gpfaApD.1EwJxjKnvgGBjtBGovEl0mKibxi.EBm'),
(32, 3, 'Kristhian Eduardo', 'Rivera Palomar', 'eduardo@gmail.com', '$2a$10$Y.2Yp3FW1C1KM4zSX3CjDettxX.dL0W7I9aTWJcJscogFSODRci2S'),
(34, 2, 'Charly', 'Chisco Siendua', 'Charly@gmail.com', '$2a$10$DF.UnBv0/a8fuolltBurx.D1pWqUH6c74d1dwIZ04dXtQCmPLofH2'),
(35, 3, 'Maria Cristina', 'Garcia Torres', 'maria@gmail.com', '$2a$10$bS9WvZtUG5mrRCOsnQrqyO6ZsPmh33DUUgMsxcpHwsRiGj0oP1xxu'),
(36, 3, 'Kenny Jarrison', 'Ramirez Quezada', 'kennyramirez60@yahoo.com', '$2a$10$NF0KIOG1wLeFCpjEhxyZGu/VY9vLRWokDPQXuerBW/LLJzAMxEcd2'),
(37, 3, 'pepito caremani', 'perez gomez', 'caremani@gmail.com', '$2a$10$3aA78ApX1rW2p13WKaZP5.OsU6rngAkze7G4JcJf5Svc0OaycclQy'),
(39, 2, 'yuyuy', 'yuyyuyuyu', 'yuyuyu@gmail.com', '$2a$10$2jYLYJMEfdulcEF2STBW9up5zG4RfL/pT1jeBAZYt85CgjwmzMrxW'),
(40, 3, 'asdsada', 'asdsdsada', 'sx@gmail.com', '$2a$10$gOTtIEtHNU6BNOEmsX9myefJLPTSnBpfI3pZcEJ2Gc.Q4EkacWx.S'),
(41, 2, 'tatiana ', 'lara', 'tatiana@gmail.com', '$2a$10$HhnGG4xsFw8c33yYdjxl8OG5NpHBpBlZA3NgkZyQjIPZBH7/eHhXa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `id_usuario_cot` (`id_usuario`),
  ADD KEY `id_cliente_cot` (`id_cliente`),
  ADD KEY `cotizacion_ibfk_4` (`id_descuento`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`id_descuento`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `itemcotizacion`
--
ALTER TABLE `itemcotizacion`
  ADD PRIMARY KEY (`id_item_cotizacion`),
  ADD KEY `id_serv_item_cot` (`id_servicio`),
  ADD KEY `fk_item_cotizacion_cotizacion` (`id_cotizacion`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_tipo_serv` (`id_tipo_serv`);

--
-- Indices de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  ADD PRIMARY KEY (`id_tipo_servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol_usuario` (`id_rol`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `id_descuento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `itemcotizacion`
--
ALTER TABLE `itemcotizacion`
  MODIFY `id_item_cotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  MODIFY `id_tipo_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `cotizacion_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `cotizacion_ibfk_4` FOREIGN KEY (`id_descuento`) REFERENCES `descuento` (`id_descuento`),
  ADD CONSTRAINT `id_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `itemcotizacion`
--
ALTER TABLE `itemcotizacion`
  ADD CONSTRAINT `fk_item_cotizacion_cotizacion` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
  ADD CONSTRAINT `itemcotizacion_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`id_tipo_serv`) REFERENCES `tiposervicio` (`id_tipo_servicio`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
