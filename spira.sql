-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2021 a las 07:41:26
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `spira`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `idCurso` int(11) NOT NULL,
  `intHoraria_idIntHoraria` int(11) NOT NULL,
  `detalleCurso_iddetalleCurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idCurso`, `intHoraria_idIntHoraria`, `detalleCurso_iddetalleCurso`) VALUES
(24, 1, 1),
(25, 1, 2),
(26, 3, 3),
(27, 2, 3),
(28, 2, 2),
(29, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idCursos` int(11) NOT NULL,
  `curso_idCurso` int(11) NOT NULL,
  `user_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCursos`, `curso_idCurso`, `user_idUser`) VALUES
(1, 24, 2),
(2, 24, 3),
(4, 27, 2),
(6, 29, 4),
(7, 25, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecurso`
--

CREATE TABLE `detallecurso` (
  `iddetalleCurso` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallecurso`
--

INSERT INTO `detallecurso` (`iddetalleCurso`, `nombre`) VALUES
(1, 'Matematicas Discretas'),
(2, 'Programacion - PHP'),
(3, 'Ingles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inthoraria`
--

CREATE TABLE `inthoraria` (
  `idIntHoraria` int(11) NOT NULL,
  `hInicio` time NOT NULL,
  `hFin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inthoraria`
--

INSERT INTO `inthoraria` (`idIntHoraria`, `hInicio`, `hFin`) VALUES
(1, '06:00:00', '08:00:00'),
(2, '08:00:00', '10:00:00'),
(3, '10:00:00', '08:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `nombre`) VALUES
(1, 'administrador'),
(2, 'alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(11) DEFAULT NULL,
  `userLogin_idUserLogin` int(11) NOT NULL,
  `rol_idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUser`, `nombre`, `telefono`, `userLogin_idUserLogin`, `rol_idRol`) VALUES
(1, 'Administrador', '3215723910', 1, 1),
(2, 'Camilo Hamon', '3232390842', 2, 2),
(3, 'Ivan', '3232390842', 3, 2),
(4, 'pruebaLaravel', '3232390411', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userlogin`
--

CREATE TABLE `userlogin` (
  `idUserLogin` int(11) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `userlogin`
--

INSERT INTO `userlogin` (`idUserLogin`, `email`, `password`) VALUES
(1, 'admin@admin.com', '$2a$10$qv2WMAjPcKsKMDPzVG06ieziXyf0lxZ2WmQBw3MDJFoKHUHNfEMyq'),
(2, 'camilohamonserna@gmail.com', '$2y$10$Kqkkjw.mlYEl3tyos4wTkeKqBgQrMe3gzDUbYrKTMIi93w/lGA0vO'),
(3, 'ivan@gmail.com', '$2y$10$JMUvmf73bfyzEapneY08B./T1Wr65geoeORfus044/nyU7x0Km3Hq'),
(4, 'laravel@laravel.com', '$2y$10$EJbkE44nHv8FU8ozMmrYh.6VNCREbdkIsTSPArFaCWWbHGGyxVGvq');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idCurso`),
  ADD KEY `fk_curso_intHoraria1` (`intHoraria_idIntHoraria`),
  ADD KEY `fk_curso_detalleCurso1` (`detalleCurso_iddetalleCurso`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCursos`),
  ADD KEY `fk_cursos_curso1` (`curso_idCurso`),
  ADD KEY `fk_cursos_user1` (`user_idUser`);

--
-- Indices de la tabla `detallecurso`
--
ALTER TABLE `detallecurso`
  ADD PRIMARY KEY (`iddetalleCurso`);

--
-- Indices de la tabla `inthoraria`
--
ALTER TABLE `inthoraria`
  ADD PRIMARY KEY (`idIntHoraria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `fk_user_userLogin` (`userLogin_idUserLogin`),
  ADD KEY `fk_user_rol1` (`rol_idRol`);

--
-- Indices de la tabla `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`idUserLogin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idCursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detallecurso`
--
ALTER TABLE `detallecurso`
  MODIFY `iddetalleCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inthoraria`
--
ALTER TABLE `inthoraria`
  MODIFY `idIntHoraria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `idUserLogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_detalleCurso1` FOREIGN KEY (`detalleCurso_iddetalleCurso`) REFERENCES `detallecurso` (`iddetalleCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_curso_intHoraria1` FOREIGN KEY (`intHoraria_idIntHoraria`) REFERENCES `inthoraria` (`idIntHoraria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos_curso1` FOREIGN KEY (`curso_idCurso`) REFERENCES `curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursos_user1` FOREIGN KEY (`user_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_rol1` FOREIGN KEY (`rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_userLogin` FOREIGN KEY (`userLogin_idUserLogin`) REFERENCES `userlogin` (`idUserLogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
