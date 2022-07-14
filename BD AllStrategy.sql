-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2022 a las 21:31:56
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa pro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `num_registros` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_cliente` varchar(30) NOT NULL,
  `nom_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `tel_empleado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_chat`
--

CREATE TABLE `cliente_chat` (
  `nom_cliente` text NOT NULL,
  `apellido_cliente` text NOT NULL,
  `Id_cliente` varchar(50) NOT NULL,
  `num_registro` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_empleado`
--

CREATE TABLE `cliente_empleado` (
  `num_compra` varchar(50) NOT NULL,
  `Id_cliente` varchar(50) NOT NULL,
  `Id_empleado` varchar(50) NOT NULL,
  `nom_empleado` varchar(50) NOT NULL,
  `apellido_empleado` varchar(50) NOT NULL,
  `tel_empleado` varchar(30) NOT NULL,
  `nom_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `tel_cliente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_empleado` varchar(50) NOT NULL,
  `nom_empleado` varchar(50) NOT NULL,
  `apellido_empleado` varchar(50) NOT NULL,
  `tel_empleado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_chat`
--

CREATE TABLE `empleado_chat` (
  `nom_empleado` varchar(50) NOT NULL,
  `apellido_empleado` varchar(50) NOT NULL,
  `tel_empleado` varchar(50) NOT NULL,
  `Id_empleado` varchar(50) NOT NULL,
  `num_registro` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`num_registros`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_cliente`);

--
-- Indices de la tabla `cliente_chat`
--
ALTER TABLE `cliente_chat`
  ADD UNIQUE KEY `Id_cliente` (`Id_cliente`),
  ADD UNIQUE KEY `num_registro` (`num_registro`);

--
-- Indices de la tabla `cliente_empleado`
--
ALTER TABLE `cliente_empleado`
  ADD PRIMARY KEY (`num_compra`),
  ADD KEY `Id_cliente` (`Id_cliente`),
  ADD KEY `Id_empleado` (`Id_empleado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_empleado`);

--
-- Indices de la tabla `empleado_chat`
--
ALTER TABLE `empleado_chat`
  ADD UNIQUE KEY `Id_empleado` (`Id_empleado`),
  ADD UNIQUE KEY `num_registro` (`num_registro`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente_empleado`
--
ALTER TABLE `cliente_empleado`
  ADD CONSTRAINT `cliente_empleado_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`Id_cliente`),
  ADD CONSTRAINT `cliente_empleado_ibfk_2` FOREIGN KEY (`Id_empleado`) REFERENCES `empleado` (`ID_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
