-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2023 a las 17:58:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clases_enyoi_relacional`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animales`
--

CREATE TABLE `animales` (
  `ID Animales` varchar(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Genero` varchar(10) NOT NULL,
  `Raza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `animales`
--

INSERT INTO `animales` (`ID Animales`, `Nombre`, `Genero`, `Raza`) VALUES
('1', 'Fargo', 'Macho', 'Husky Siberiano'),
('2', 'Valhalla', 'Macho', 'Bombay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `ID Personas` varchar(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Edad` int(3) NOT NULL,
  `Cédula` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`ID Personas`, `Nombre`, `Apellidos`, `Edad`, `Cédula`) VALUES
('1', 'Yeny', 'González', 31, '1057489652'),
('2', 'Olga', 'Uribe', 40, '30256987');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinaria`
--

CREATE TABLE `veterinaria` (
  `ID Veterinaria` varchar(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Dirección` varchar(30) NOT NULL,
  `Teléfono` varchar(15) NOT NULL,
  `ID Personas` varchar(10) NOT NULL,
  `ID Animales` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `veterinaria`
--

INSERT INTO `veterinaria` (`ID Veterinaria`, `Nombre`, `Dirección`, `Teléfono`, `ID Personas`, `ID Animales`) VALUES
('1', 'Riovet', 'Avenida 7 de Agosto', '(+57)-302356879', '1', '2'),
('2', 'Zooplanet', 'Carrera 5 #45-09', '(+57)-321742368', '2', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animales`
--
ALTER TABLE `animales`
  ADD PRIMARY KEY (`ID Animales`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`ID Personas`);

--
-- Indices de la tabla `veterinaria`
--
ALTER TABLE `veterinaria`
  ADD PRIMARY KEY (`ID Veterinaria`),
  ADD UNIQUE KEY `ID Animales_3` (`ID Animales`),
  ADD UNIQUE KEY `ID Personas_2` (`ID Personas`),
  ADD KEY `ID Personas` (`ID Personas`),
  ADD KEY `ID Animales` (`ID Animales`),
  ADD KEY `ID Animales_2` (`ID Animales`),
  ADD KEY `Teléfono` (`Teléfono`),
  ADD KEY `Dirección` (`Dirección`),
  ADD KEY `Nombre` (`Nombre`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `veterinaria`
--
ALTER TABLE `veterinaria`
  ADD CONSTRAINT `veterinaria_ibfk_1` FOREIGN KEY (`ID Personas`) REFERENCES `personas` (`ID Personas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `veterinaria_ibfk_2` FOREIGN KEY (`ID Animales`) REFERENCES `animales` (`ID Animales`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
