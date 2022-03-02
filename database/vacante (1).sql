-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2022 a las 23:18:04
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vacante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombreCli` varchar(50) DEFAULT NULL,
  `apellidoCli` varchar(50) DEFAULT NULL,
  `sexoCli` varchar(15) DEFAULT NULL,
  `direccionCli` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombreCli`, `apellidoCli`, `sexoCli`, `direccionCli`) VALUES
(1, 'Mauro', 'Chavez', 'M', 'cra 11 calle 34 n°12-23'),
(2, 'Alejandra', 'Garcia', 'F', 'cra 34 calle 45 n°1-93'),
(3, 'Paula', 'Perez', 'F', 'cra 23 calle 78 n°12-78'),
(4, 'Leandro', 'Galeano', 'M', 'cra 98 calle 3 n°64-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `nombre_empresa` varchar(50) DEFAULT NULL,
  `telefono_empresa` varchar(20) DEFAULT NULL,
  `email_empresa` varchar(30) DEFAULT NULL,
  `direccion_empresa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre_empresa`, `telefono_empresa`, `email_empresa`, `direccion_empresa`) VALUES
(1, 'texaco', '+573009876543', 'tex@gmail.com', 'cra 9 calle 22 n°12-90'),
(2, 'tigo', '+573009876543', 'tig@gmail.com', 'cra 78 calle 15 n°75-80'),
(3, 'Avianca', '+573009876543', 'avi@gmail.com', 'cra 93 calle 98 n°56-70'),
(4, 'Ecopetrol', '+573009876543', 'eco@gmail.com', 'cra 8 calle 23 n°18-90');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postula`
--

CREATE TABLE `postula` (
  `id_cliente` int(11) DEFAULT NULL,
  `id_vacantes` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `postula`
--

INSERT INTO `postula` (`id_cliente`, `id_vacantes`, `fecha`) VALUES
(1, 1, '0000-00-00'),
(2, 2, '0000-00-00'),
(3, 2, '0000-00-00'),
(4, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publica`
--

CREATE TABLE `publica` (
  `id_empresa` int(11) DEFAULT NULL,
  `id_vacantes` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `publica`
--

INSERT INTO `publica` (`id_empresa`, `id_vacantes`, `fecha`) VALUES
(1, 2, '2022-02-01'),
(2, 1, '2022-02-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user`, `name`, `rol`, `pass`) VALUES
(3, 'admin', 'juan perez', 'admin', '$2a$08$qzozRSm00UEvUBq5/U6uw.qDx6fvnyk/7bPhIEnS4ERCFXn05u08W'),
(4, 'teo', 'teo hollos herrazo', 'data entry', '$2a$08$kbBakPepHML/x/.lND5ubugZp57J3O7Fj5eqhyR9NphU/Q2KX7NL6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacantes`
--

CREATE TABLE `vacantes` (
  `id_vacantes` int(11) NOT NULL,
  `nombreVacante` varchar(30) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vacantes`
--

INSERT INTO `vacantes` (`id_vacantes`, `nombreVacante`, `descripcion`) VALUES
(1, 'Informatica', 'se nececita personal con conocimiento en informatica con minimo 3 meses de experiencia'),
(2, 'Ingenieria civil', 'se nececita ingeniero civil con minimo 3 meses de experiencia'),
(3, 'ingenieria civil', 'se necesita personal para el cargo, 3 meses de experiencia'),
(4, 'ingenieria alimentos', 'se necesita personal para el cargo, 3 meses de experiencia'),
(5, 'ingenieria sistemas', 'se necesita personal para el cargo, 3 meses de experiencia'),
(6, 'ingenieria software', 'se necesita personal para el cargo, 3 meses de experiencia]'),
(7, 'ingenieria industrial', 'se necesita personal para el cargo, 3 meses de experiencia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `postula`
--
ALTER TABLE `postula`
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_vacantes` (`id_vacantes`);

--
-- Indices de la tabla `publica`
--
ALTER TABLE `publica`
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_vacantes` (`id_vacantes`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD PRIMARY KEY (`id_vacantes`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  MODIFY `id_vacantes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `postula`
--
ALTER TABLE `postula`
  ADD CONSTRAINT `postula_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `postula_ibfk_2` FOREIGN KEY (`id_vacantes`) REFERENCES `vacantes` (`id_vacantes`);

--
-- Filtros para la tabla `publica`
--
ALTER TABLE `publica`
  ADD CONSTRAINT `publica_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`),
  ADD CONSTRAINT `publica_ibfk_2` FOREIGN KEY (`id_vacantes`) REFERENCES `vacantes` (`id_vacantes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
