CREATE DATABASE  IF NOT EXISTS `schema_kino` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `schema_kino`;
-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: schema_kino
-- ------------------------------------------------------
-- Server version	5.7.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `idalumnos` int(11) NOT NULL AUTO_INCREMENT,
  `idtutor` int(11) NOT NULL,
  `idciclo` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `sexo` bit(1) NOT NULL,
  `direccion` varchar(70) CHARACTER SET utf8 NOT NULL,
  `fechanac` date NOT NULL,
  `discapacidad` text,
  `grado` char(3) NOT NULL,
  `nivel` varchar(15) CHARACTER SET utf8 NOT NULL,
  `grupo` char(1) NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idalumnos`),
  KEY `FK_idlaumno_idtutor_idx` (`idtutor`),
  KEY `FK_idalumno_idciclo_idx` (`idciclo`),
  CONSTRAINT `FK_idalumno_idciclo` FOREIGN KEY (`idciclo`) REFERENCES `ciclo` (`idciclo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_idlaumno_idtutor` FOREIGN KEY (`idtutor`) REFERENCES `tutores` (`idtutor`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER nuevo_expediente 
AFTER INSERT ON alumnos
FOR EACH ROW 
  INSERT INTO expediente (idalumno, acta, curp, foto, cartilla_vacunacion, comprobante_domicilio, carta_na, acta_bautismo, tipo_sangre, servicio_medico)
  VALUES (NEW.idalumnos, 0, 0, 0, 0, 0, 0, 0, 0, 0) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ciclo`
--

DROP TABLE IF EXISTS `ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciclo` (
  `idciclo` int(11) NOT NULL AUTO_INCREMENT,
  `año` int(11) NOT NULL,
  PRIMARY KEY (`idciclo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deudas`
--

DROP TABLE IF EXISTS `deudas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deudas` (
  `iddeuda` int(11) NOT NULL AUTO_INCREMENT,
  `idalumno` int(11) NOT NULL,
  `motivo` varchar(35) NOT NULL,
  `cantidad` decimal(15,2) NOT NULL,
  `idciclo` int(11) NOT NULL,
  PRIMARY KEY (`iddeuda`),
  KEY `fk_alumno_deudas_idx` (`idalumno`),
  KEY `fk_ciclo_deudas_idx` (`idciclo`),
  CONSTRAINT `fk_alumno_deudas` FOREIGN KEY (`idalumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ciclo_deudas` FOREIGN KEY (`idciclo`) REFERENCES `ciclo` (`idciclo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expediente`
--

DROP TABLE IF EXISTS `expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente` (
  `idexp` int(11) NOT NULL AUTO_INCREMENT,
  `idalumno` int(11) NOT NULL,
  `acta` bit(1) NOT NULL,
  `curp` bit(1) NOT NULL,
  `foto` bit(1) NOT NULL,
  `cartilla_vacunacion` bit(1) NOT NULL,
  `comprobante_domicilio` bit(1) NOT NULL,
  `carta_na` bit(1) NOT NULL,
  `acta_bautismo` bit(1) NOT NULL,
  `tipo_sangre` bit(1) NOT NULL,
  `servicio_medico` bit(1) NOT NULL,
  PRIMARY KEY (`idexp`),
  KEY `FK_idexp_idalumno_idx` (`idalumno`),
  CONSTRAINT `FK_idexp_idalumno` FOREIGN KEY (`idalumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimientosadeudos`
--

DROP TABLE IF EXISTS `movimientosadeudos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientosadeudos` (
  `idmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `iddeuda` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `montoviejo` decimal(15,2) NOT NULL,
  `montonuevo` decimal(15,2) NOT NULL,
  PRIMARY KEY (`idmovimiento`),
  KEY `FK_usuarios_movimientos_idx` (`idusuario`),
  KEY `FK_deudas_movimientos_idx` (`iddeuda`),
  CONSTRAINT `FK_deudas_movimientos` FOREIGN KEY (`iddeuda`) REFERENCES `deudas` (`iddeuda`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuarios_movimientos` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `precios`
--

DROP TABLE IF EXISTS `precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precios` (
  `idprecio` int(11) NOT NULL AUTO_INCREMENT,
  `idciclo` int(11) NOT NULL,
  `nivel` varchar(15) CHARACTER SET utf8 NOT NULL,
  `inscripcion` decimal(15,2) NOT NULL,
  `cuota_padres` decimal(15,2) NOT NULL,
  `libros` decimal(15,2) NOT NULL,
  `seguro` decimal(15,2) NOT NULL,
  `mensualidad` decimal(15,2) NOT NULL,
  PRIMARY KEY (`idprecio`),
  KEY `FK_idmonto_idciclo_idx` (`idciclo`),
  CONSTRAINT `FK_idprecios_idciclo` FOREIGN KEY (`idciclo`) REFERENCES `ciclo` (`idciclo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tutores`
--

DROP TABLE IF EXISTS `tutores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutores` (
  `idtutor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `direccion` varchar(70) CHARACTER SET utf8 NOT NULL,
  `tel1` bigint(15) NOT NULL,
  `tel2` bigint(15) DEFAULT NULL,
  `correo` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idtutor`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(65) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `privilegios` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-09 23:34:44
