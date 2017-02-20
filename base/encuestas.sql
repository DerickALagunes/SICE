-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-02-2017 a las 07:42:22
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `encuestas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEncuestaId` (IN `nombre` VARCHAR(75), IN `usuarioId` INT, OUT `idEnc` INT)  BEGIN
SELECT encuesta.idEncuesta INTO idEnc FROM encuesta WHERE encuesta.nombreEncuesta=nombre AND encuesta.fk_idUsuario=usuarioId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPreguntaId` (IN `idEncuesta` INT, IN `descripcion` VARCHAR(250), OUT `id` INT)  BEGIN
SELECT pregunta.idPregunta INTO id FROM pregunta WHERE pregunta.fk_idEncuesta=idEncuesta AND pregunta.descripcion=descripcion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario` (IN `userr` VARCHAR(50), IN `pass` VARCHAR(45), IN `tipo` INT)  BEGIN
INSERT INTO usuario (usuario,contrasena,tipoUsuario) VALUES(userr,pass,tipo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevaEncuesta` (IN `idUsuario` INT, IN `nombre` VARCHAR(70))  BEGIN
INSERT INTO encuesta (nombreEncuesta,fk_idUsuario) VALUES(nombre,idUsuario);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevaPregunta` (IN `idEncuesta` INT, IN `tipoPregunta` INT, IN `numero` INT, IN `descripcion` VARCHAR(250))  BEGIN
INSERT INTO pregunta(fk_idEncuesta,fk_tipoPregunta,numero,descripcion) VALUES(idEncuesta,tipoPregunta,numero,descripcion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevasOpciones` (IN `idPregunta` INT, IN `descripcion` VARCHAR(45))  BEGIN
INSERT INTO opciones (fk_idPregunta,descripcion) VALUES(idPregunta,descripcion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarUsuario` (IN `usuario` VARCHAR(50), IN `contrasena` VARCHAR(45), OUT `existe` BOOLEAN, OUT `tipo` INT, OUT `idUser` INT)  BEGIN
DECLARE id int;
SET id= 0;
SELECT idUsuario INTO id FROM usuario WHERE usuario.usuario = usuario AND usuario.contrasena=contrasena;
IF (id!=0) 
THEN 
 SET existe=true;
 SELECT tipoUsuario INTO tipo FROM usuario WHERE usuario.usuario = usuario AND usuario.contrasena=contrasena;
 SELECT idUsuario INTO idUser FROM usuario WHERE usuario.usuario = usuario AND usuario.contrasena=contrasena;
 ELSE 
    SET existe=false;
 END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `idEncuesta` int(11) NOT NULL,
  `nombreEncuesta` varchar(70) NOT NULL,
  `fk_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`idEncuesta`, `nombreEncuesta`, `fk_idUsuario`) VALUES
(30, 'nueva', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `idOpciones` int(11) NOT NULL,
  `fk_idPregunta` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `inciso` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`idOpciones`, `fk_idPregunta`, `descripcion`, `inciso`) VALUES
(22, 9, 'A', ''),
(23, 9, 'B', ''),
(24, 9, 'C', ''),
(25, 9, 'D', ''),
(26, 10, 'A', ''),
(27, 10, 'B', ''),
(28, 10, 'C', ''),
(29, 10, 'D', ''),
(30, 11, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `idPregunta` int(11) NOT NULL,
  `fk_idEncuesta` int(11) NOT NULL,
  `fk_tipoPregunta` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`idPregunta`, `fk_idEncuesta`, `fk_tipoPregunta`, `numero`, `descripcion`) VALUES
(9, 30, 2, 1, 'opcion1'),
(10, 30, 2, 6, 'opcion2'),
(11, 30, 1, 11, 'abierta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultadoabierta`
--

CREATE TABLE `resultadoabierta` (
  `idresultadoAbierta` int(11) NOT NULL,
  `respuesta` text NOT NULL,
  `fk_idPregunta` int(11) NOT NULL,
  `fk_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultadoopcion`
--

CREATE TABLE `resultadoopcion` (
  `idresultadoOpcion` int(11) NOT NULL,
  `respuesta` varchar(250) NOT NULL,
  `fk_idUsuario` int(11) NOT NULL,
  `fk_idPregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopregunta`
--

CREATE TABLE `tipopregunta` (
  `idtipoPregunta` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipopregunta`
--

INSERT INTO `tipopregunta` (`idtipoPregunta`, `tipo`) VALUES
(1, 'abierta'),
(2, 'opcion'),
(3, 'seleccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `tipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `usuario`, `contrasena`, `tipoUsuario`) VALUES
(4, 'yugiohax@hotmail.com', 'qwerty', 2),
(5, 'axel_lagunes@outlook.com', 'asd', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`idEncuesta`),
  ADD KEY `fk_idUsuario_idx` (`fk_idUsuario`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`idOpciones`),
  ADD KEY `fk_idPregunta_idx` (`fk_idPregunta`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`idPregunta`),
  ADD KEY `fk_idEncuesta_idx` (`fk_idEncuesta`),
  ADD KEY `fk_tipoPregunta_idx` (`fk_tipoPregunta`);

--
-- Indices de la tabla `resultadoabierta`
--
ALTER TABLE `resultadoabierta`
  ADD PRIMARY KEY (`idresultadoAbierta`),
  ADD KEY `fk_idPregunta1` (`fk_idPregunta`),
  ADD KEY `fk_idUsuario1` (`fk_idUsuario`);

--
-- Indices de la tabla `resultadoopcion`
--
ALTER TABLE `resultadoopcion`
  ADD PRIMARY KEY (`idresultadoOpcion`),
  ADD KEY `fk_idPregunta2` (`fk_idPregunta`),
  ADD KEY `fk_idUsuario2` (`fk_idUsuario`);

--
-- Indices de la tabla `tipopregunta`
--
ALTER TABLE `tipopregunta`
  ADD PRIMARY KEY (`idtipoPregunta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `idEncuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `idOpciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `idPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `resultadoabierta`
--
ALTER TABLE `resultadoabierta`
  MODIFY `idresultadoAbierta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `resultadoopcion`
--
ALTER TABLE `resultadoopcion`
  MODIFY `idresultadoOpcion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipopregunta`
--
ALTER TABLE `tipopregunta`
  MODIFY `idtipoPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `fk_idUsuario` FOREIGN KEY (`fk_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `fk_idPregunta` FOREIGN KEY (`fk_idPregunta`) REFERENCES `pregunta` (`idPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `fk_idEncuesta` FOREIGN KEY (`fk_idEncuesta`) REFERENCES `encuesta` (`idEncuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipoPregunta` FOREIGN KEY (`fk_tipoPregunta`) REFERENCES `tipopregunta` (`idtipoPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `resultadoabierta`
--
ALTER TABLE `resultadoabierta`
  ADD CONSTRAINT `fk_idPregunta1` FOREIGN KEY (`fk_idPregunta`) REFERENCES `pregunta` (`idPregunta`),
  ADD CONSTRAINT `fk_idUsuario1` FOREIGN KEY (`fk_idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `resultadoopcion`
--
ALTER TABLE `resultadoopcion`
  ADD CONSTRAINT `fk_idPregunta2` FOREIGN KEY (`fk_idPregunta`) REFERENCES `pregunta` (`idPregunta`),
  ADD CONSTRAINT `fk_idUsuario2` FOREIGN KEY (`fk_idUsuario`) REFERENCES `usuario` (`idUsuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
