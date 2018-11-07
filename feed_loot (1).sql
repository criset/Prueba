-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2018 a las 19:09:32
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `feed_loot`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimentacion`
--

CREATE TABLE `alimentacion` (
  `idAlimentacion` int(11) NOT NULL,
  `idCorral` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alimentacion`
--

INSERT INTO `alimentacion` (`idAlimentacion`, `idCorral`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE `animal` (
  `idAnimal` int(11) NOT NULL,
  `idPersonal` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `fechaVacunacion` datetime NOT NULL,
  `idCorral` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `animal`
--

INSERT INTO `animal` (`idAnimal`, `idPersonal`, `peso`, `fechaVacunacion`, `idCorral`) VALUES
(1, 1, 300, '2010-05-13 13:00:25', 1),
(2, 1, 330, '2010-05-13 13:00:25', 2),
(3, 1, 350, '2010-05-13 13:00:25', 3),
(4, 1, 260, '2010-05-13 13:00:25', 1),
(5, 1, 270, '2010-05-13 13:00:25', 1),
(6, 1, 280, '2010-05-13 13:00:25', 1),
(7, 1, 290, '2010-05-13 13:25:25', 1),
(8, 1, 310, '2010-05-13 14:25:25', 2),
(9, 1, 315, '2010-05-13 13:25:30', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebederos`
--

CREATE TABLE `bebederos` (
  `idBebedero` int(11) NOT NULL,
  `idCorral` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bebederos`
--

INSERT INTO `bebederos` (`idBebedero`, `idCorral`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corral`
--

CREATE TABLE `corral` (
  `idCorral` int(11) NOT NULL,
  `descripcionCorral` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `corral`
--

INSERT INTO `corral` (`idCorral`, `descripcionCorral`) VALUES
(1, '260-300 kg'),
(2, '300-340 kg'),
(3, '340-500 kg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `idPersonal` int(11) NOT NULL,
  `nombrePersonal` text NOT NULL,
  `apellidoPersonal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`idPersonal`, `nombrePersonal`, `apellidoPersonal`) VALUES
(1, 'Marco', 'Sastre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `descripcionRegistro` varchar(255) NOT NULL,
  `idRegistro` int(11) NOT NULL,
  `tiempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD PRIMARY KEY (`idAlimentacion`),
  ADD KEY `idCorral` (`idCorral`);

--
-- Indices de la tabla `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`idAnimal`),
  ADD KEY `idPersonal` (`idPersonal`),
  ADD KEY `idCorral` (`idCorral`),
  ADD KEY `idCorral_2` (`idCorral`);

--
-- Indices de la tabla `bebederos`
--
ALTER TABLE `bebederos`
  ADD PRIMARY KEY (`idBebedero`),
  ADD KEY `idCorral` (`idCorral`);

--
-- Indices de la tabla `corral`
--
ALTER TABLE `corral`
  ADD PRIMARY KEY (`idCorral`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idPersonal`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`idRegistro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  MODIFY `idAlimentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `animal`
--
ALTER TABLE `animal`
  MODIFY `idAnimal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `bebederos`
--
ALTER TABLE `bebederos`
  MODIFY `idBebedero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `corral`
--
ALTER TABLE `corral`
  MODIFY `idCorral` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `idPersonal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD CONSTRAINT `alimentacion_ibfk_1` FOREIGN KEY (`idCorral`) REFERENCES `corral` (`idCorral`);

--
-- Filtros para la tabla `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`idPersonal`) REFERENCES `personal` (`idPersonal`);

--
-- Filtros para la tabla `bebederos`
--
ALTER TABLE `bebederos`
  ADD CONSTRAINT `bebederos_ibfk_1` FOREIGN KEY (`idCorral`) REFERENCES `corral` (`idCorral`);

--
-- Filtros para la tabla `corral`
--
ALTER TABLE `corral`
  ADD CONSTRAINT `corral_ibfk_1` FOREIGN KEY (`idCorral`) REFERENCES `animal` (`idCorral`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
