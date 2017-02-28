-- phpMyAdmin SQL Dump
-- version 4.5.3.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-02-2017 a las 13:51:44
-- Versión del servidor: 5.6.27-2
-- Versión de PHP: 5.6.16-2

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevaPregunta` (IN `idEncuesta` INT, IN `tipoPregunta` INT, IN `descrip` VARCHAR(250))  BEGIN
 INSERT into pregunta (pregunta.fk_idEncuesta,pregunta.fk_tipoPregunta, pregunta.descripcion)
 VALUES (idEncuesta,tipopregunta,descrip);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevasOpciones` (IN `idPregunta` INT, IN `descripcion` VARCHAR(45))  BEGIN
INSERT INTO opciones (fk_idPregunta,descripcion) VALUES(idPregunta,descripcion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarRespuestaAbierta` (IN `idUsuario` INT, IN `idPregunta` INT, IN `respuesta` TEXT)  BEGIN
INSERT INTO resultadoabierta (respuesta, fk_idUsuario, fk_idPregunta) VALUES(respuesta, idUsuario, idPregunta);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarRespuestaOpcion` (IN `idUsuario` INT, IN `idPregunta` INT, IN `respuesta` INT)  BEGIN
INSERT INTO resultadoopcion (respuesta, fk_idUsuario, fk_idPregunta) VALUES(respuesta, idUsuario, idPregunta);
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
(40, 'Prueba', 8),
(58, 'La buena', 8),
(59, 'Encuesta 1', 11);

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
(21, 53, 'A', ''),
(22, 53, 'B', ''),
(23, 53, 'C', ''),
(24, 53, 'D', ''),
(25, 54, 'primera', ''),
(26, 54, 'segunda', ''),
(27, 54, 'tercera', ''),
(28, 54, 'cuarta', ''),
(29, 56, 'z', ''),
(30, 56, 'x', ''),
(31, 56, 'y', ''),
(32, 56, 'w', ''),
(33, 58, 'Si', ''),
(34, 58, 'No', ''),
(35, 58, '', ''),
(36, 58, '', ''),
(37, 59, 'opcion1', ''),
(38, 59, 'opcion2', ''),
(39, 59, 'opcion3', ''),
(40, 59, 'opcion4', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `idPregunta` int(11) NOT NULL,
  `fk_idEncuesta` int(11) NOT NULL,
  `fk_tipoPregunta` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`idPregunta`, `fk_idEncuesta`, `fk_tipoPregunta`, `descripcion`) VALUES
(1, 40, 1, 'preguntaAbierta'),
(51, 40, 1, 'preguntaAbierta2'),
(52, 58, 1, 'abierta'),
(53, 58, 2, 'opcion'),
(54, 58, 3, 'Elije una o varias:'),
(55, 58, 1, 'abierta2'),
(56, 58, 2, 'opcion2'),
(57, 59, 1, 'pregunta 1'),
(58, 59, 2, 'pregunta 2'),
(59, 59, 3, 'Pregunta 3');

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

--
-- Volcado de datos para la tabla `resultadoabierta`
--

INSERT INTO `resultadoabierta` (`idresultadoAbierta`, `respuesta`, `fk_idPregunta`, `fk_idUsuario`) VALUES
(1, 'dfdsfds', 52, 7),
(2, 'sa vfd', 55, 7),
(3, 'perros', 52, 7),
(4, 'gatos', 55, 7),
(5, 'abc', 57, 9),
(6, 'Otra respuesta', 57, 9);

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

--
-- Volcado de datos para la tabla `resultadoopcion`
--

INSERT INTO `resultadoopcion` (`idresultadoOpcion`, `respuesta`, `fk_idUsuario`, `fk_idPregunta`) VALUES
(1, '22', 7, 53),
(2, '26', 7, 54),
(3, '27', 7, 54),
(4, '31', 7, 56),
(5, '21', 7, 53),
(6, '26', 7, 54),
(7, '28', 7, 54),
(8, '32', 7, 56),
(9, '34', 9, 58),
(10, '38', 9, 59),
(11, '40', 9, 59),
(12, '33', 9, 58),
(13, '37', 9, 59),
(14, '38', 9, 59),
(15, '40', 9, 59);

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
(7, 'user', '123', 1),
(8, 'admin', '123', 2),
(9, 'iridian@hotmail.com', '123', 1),
(10, 'ricardo@hotmail.com', '', 2),
(11, 'ricardo@hotmail.com', '123', 2);

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
  MODIFY `idEncuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `idOpciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `idPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT de la tabla `resultadoabierta`
--
ALTER TABLE `resultadoabierta`
  MODIFY `idresultadoAbierta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `resultadoopcion`
--
ALTER TABLE `resultadoopcion`
  MODIFY `idresultadoOpcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `tipopregunta`
--
ALTER TABLE `tipopregunta`
  MODIFY `idtipoPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
