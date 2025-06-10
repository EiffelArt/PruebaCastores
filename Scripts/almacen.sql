-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2025 a las 22:56:22
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
-- Base de datos: `almacen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombre`) VALUES
(1, 'Materia Prima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo`
--

CREATE TABLE `motivo` (
  `idMotivo` int(11) NOT NULL,
  `Descripcion` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `motivo`
--

INSERT INTO `motivo` (`idMotivo`, `Descripcion`) VALUES
(1, 'Prestamo'),
(2, 'Baja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `idMov` bigint(20) NOT NULL,
  `fec_mov` datetime DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `user_mod` int(11) NOT NULL,
  `idUsuPrestamo` int(11) NOT NULL,
  `idTipoMov` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idMotivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `codigo` varchar(60) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `cant_minima` int(11) DEFAULT NULL,
  `precio` decimal(12,3) DEFAULT NULL,
  `existencia` bigint(20) DEFAULT NULL,
  `estatus` char(1) DEFAULT NULL,
  `fec_creacion` datetime DEFAULT NULL,
  `user_creo` int(11) NOT NULL,
  `unidad_med` int(11) NOT NULL,
  `idCat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `descripcion`, `codigo`, `foto`, `cant_minima`, `precio`, `existencia`, `estatus`, `fec_creacion`, `user_creo`, `unidad_med`, `idCat`) VALUES
(1, 'Bolsa', 'Bolsa transparente', '1B', 'bolsa.jpg', 0, 1.000, 1, '1', '2025-06-08 18:15:58', 2, 1, 1),
(2, 'Martillo', 'Martillo', 'M1', '', 0, 1.000, 0, 'A', NULL, 2, 1, 1),
(3, 'Flexometro', 'Cinta para medir de 5 metros de longitud', 'F1', '', 0, 10.000, 0, 'A', NULL, 2, 1, 1),
(4, 'Taladro', 'Taladro', 'T1', '', 0, 0.000, 0, 'A', NULL, 2, 1, 1),
(5, 'Trapo', 'Trapo', 'TR1', '', 2, 0.000, 0, 'A', NULL, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Almacenista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mov`
--

CREATE TABLE `tipo_mov` (
  `idTipomov` int(11) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_mov`
--

INSERT INTO `tipo_mov` (`idTipomov`, `Descripcion`) VALUES
(1, 'Entrada'),
(2, 'Salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `idUnidad` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`idUnidad`, `nombre`) VALUES
(1, 'PZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `contrasena` varchar(25) DEFAULT NULL,
  `idRol` int(11) NOT NULL,
  `estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `correo`, `contrasena`, `idRol`, `estatus`) VALUES
(2, 'Jorge Sarabia', 'jluis_sarabia@outlook.com', '123', 1, 1),
(3, 'Luis Parra', 'lparra@outlook.com', 'ABC123', 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `motivo`
--
ALTER TABLE `motivo`
  ADD PRIMARY KEY (`idMotivo`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`idMov`),
  ADD KEY `fk_movuserm` (`user_mod`),
  ADD KEY `fk_movidupre` (`idUsuPrestamo`),
  ADD KEY `fk_movtipmov` (`idTipoMov`),
  ADD KEY `fk_movprod` (`idProducto`),
  ADD KEY `fk_movmot` (`idMotivo`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_produser` (`user_creo`),
  ADD KEY `fk_produom` (`unidad_med`),
  ADD KEY `fk_prodcat` (`idCat`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `tipo_mov`
--
ALTER TABLE `tipo_mov`
  ADD PRIMARY KEY (`idTipomov`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`idUnidad`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_rolUser` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `motivo`
--
ALTER TABLE `motivo`
  MODIFY `idMotivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `idMov` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_mov`
--
ALTER TABLE `tipo_mov`
  MODIFY `idTipomov` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `idUnidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `fk_movidupre` FOREIGN KEY (`idUsuPrestamo`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `fk_movmot` FOREIGN KEY (`idMotivo`) REFERENCES `motivo` (`idMotivo`),
  ADD CONSTRAINT `fk_movprod` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `fk_movtipmov` FOREIGN KEY (`idTipoMov`) REFERENCES `tipo_mov` (`idTipomov`),
  ADD CONSTRAINT `fk_movuserm` FOREIGN KEY (`user_mod`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_prodcat` FOREIGN KEY (`idCat`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `fk_produom` FOREIGN KEY (`unidad_med`) REFERENCES `unidad` (`idUnidad`),
  ADD CONSTRAINT `fk_produser` FOREIGN KEY (`user_creo`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_rolUser` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
