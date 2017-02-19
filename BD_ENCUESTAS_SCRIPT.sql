

CREATE DATABASE 'Encuestas' DEFAULT CHARACTER SET utf8 ;
USE `Encuestas` ;

-- -----------------------------------------------------
-- Table `Encuestas`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Encuestas`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Encuestas`.`encuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Encuestas`.`encuesta` (
  `idEncuesta` INT NOT NULL AUTO_INCREMENT,
  `nombreEncuesta` VARCHAR(70) NOT NULL,
  `fk_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idEncuesta`),
  INDEX `fk_idUsuario_idx` (`fk_idUsuario` ASC),
  CONSTRAINT `fk_idUsuario`
    FOREIGN KEY (`fk_idUsuario`)
    REFERENCES `Encuestas`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Encuestas`.`tipoPregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Encuestas`.`tipoPregunta` (
  `idtipoPregunta` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoPregunta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Encuestas`.`pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Encuestas`.`pregunta` (
  `idPregunta` INT NOT NULL AUTO_INCREMENT,
  `fk_idEncuesta` INT NOT NULL,
  `fk_tipoPregunta` INT NOT NULL,
  `numero` INT NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`idPregunta`),
  INDEX `fk_idEncuesta_idx` (`fk_idEncuesta` ASC),
  INDEX `fk_tipoPregunta_idx` (`fk_tipoPregunta` ASC),
  CONSTRAINT `fk_idEncuesta`
    FOREIGN KEY (`fk_idEncuesta`)
    REFERENCES `Encuestas`.`encuesta` (`idEncuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipoPregunta`
    FOREIGN KEY (`fk_tipoPregunta`)
    REFERENCES `Encuestas`.`tipoPregunta` (`idtipoPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Encuestas`.`Opciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Encuestas`.`Opciones` (
  `idOpciones` INT NOT NULL AUTO_INCREMENT,
  `fk_idPregunta` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `inciso` CHAR(1) NOT NULL,
  PRIMARY KEY (`idOpciones`),
  INDEX `fk_idPregunta_idx` (`fk_idPregunta` ASC),
  CONSTRAINT `fk_idPregunta`
    FOREIGN KEY (`fk_idPregunta`)
    REFERENCES `Encuestas`.`pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Encuestas`.`resultadoAbierta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Encuestas`.`resultadoAbierta` (
  idresultadoAbierta INT NOT NULL AUTO_INCREMENT,
  respuesta TEXT(1000) NOT NULL,
  fk_idPregunta INT NOT NULL,
  fk_idUsuario INT NOT NULL,
  PRIMARY KEY (idresultadoAbierta),
  CONSTRAINT fk_idPregunta1 FOREIGN KEY (fk_idPregunta)REFERENCES pregunta (idPregunta),
  CONSTRAINT fk_idUsuario1 FOREIGN KEY (fk_idUsuario) REFERENCES usuario (idUsuario));



-- -----------------------------------------------------
-- Table `Encuestas`.`resultadoOpcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Encuestas`.`resultadoOpcion` (
  idresultadoOpcion INT NOT NULL AUTO_INCREMENT,
  respuesta CHAR(1) NOT NULL,
  fk_idUsuario INT NOT NULL,
  fk_idPregunta INT NOT NULL,
  PRIMARY KEY (idresultadoOpcion),
 CONSTRAINT fk_idPregunta2 FOREIGN KEY (fk_idPregunta)REFERENCES pregunta (idPregunta),
  CONSTRAINT fk_idUsuario2 FOREIGN KEY (fk_idUsuario) REFERENCES usuario (idUsuario));


----mods
ALTER TABLE `usuario` ADD `tipoUsuario` VARCHAR(3) NOT NULL DEFAULT 'usr' AFTER `contrasena`;

