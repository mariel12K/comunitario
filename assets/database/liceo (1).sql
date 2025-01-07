-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-12-2024 a las 00:02:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `liceo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `idd_est` int(8) NOT NULL,
  `per_est` int(8) NOT NULL,
  `con_est` enum('regular','materia pendiente','Repitiente') DEFAULT NULL,
  `enf_est` varchar(30) DEFAULT NULL,
  `pla_est` varchar(50) NOT NULL,
  `rel_est` int(2) DEFAULT NULL,
  `her_est` int(2) DEFAULT NULL,
  `cur_est` enum('Primer','Segundo','Tercer','Cuarto','Quinto') DEFAULT NULL,
  `pes_est` float DEFAULT NULL,
  `alt_est` float DEFAULT NULL,
  `tcm_est` enum('xs','s','m','l','xl') DEFAULT NULL,
  `tpn_est` enum('10','12','14','16') DEFAULT NULL,
  `tzp_est` int(2) DEFAULT NULL,
  `bec_est` enum('nacional','estadal','preparaduria','ninguna') DEFAULT NULL,
  `can_est` enum('si','no') DEFAULT NULL,
  `tbl_est` enum('si','no') DEFAULT NULL,
  `equ_est` enum('buena','regular','mala') DEFAULT NULL,
  `hab_est` int(2) NOT NULL,
  `sec_est` enum('A','B','C','D','E','F') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

CREATE TABLE `habilidad` (
  `idd_hab` int(2) NOT NULL,
  `nom_hab` varchar(30) NOT NULL,
  `des_mat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idd_mat` int(2) NOT NULL,
  `nom_mat` varchar(50) NOT NULL,
  `des_mat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mat_sol`
--

CREATE TABLE `mat_sol` (
  `idd_mts` int(8) NOT NULL,
  `sol_mts` int(8) NOT NULL,
  `mat_mts` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idd_per` int(8) NOT NULL,
  `cdi_per` varchar(15) DEFAULT NULL,
  `ap1_per` varchar(25) NOT NULL,
  `ap2_per` varchar(25) DEFAULT NULL,
  `nb1_per` varchar(25) NOT NULL,
  `nb2_per` varchar(25) DEFAULT NULL,
  `fna_per` date NOT NULL,
  `edd_per` int(2) DEFAULT NULL,
  `nac_per` enum('venezolano','extranjero') DEFAULT NULL,
  `sex_per` enum('F','M') DEFAULT NULL,
  `lgn_per` varchar(30) DEFAULT NULL,
  `dir_per` varchar(50) DEFAULT NULL,
  `prf_pe` varchar(20) NOT NULL,
  `tl1_per` varchar(20) NOT NULL,
  `tl2_per` varchar(20) DEFAULT NULL,
  `cor_per` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `religion`
--

CREATE TABLE `religion` (
  `idd_rel` int(2) NOT NULL,
  `nom_rel` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representante`
--

CREATE TABLE `representante` (
  `idd_rep` int(8) NOT NULL,
  `per_rep` int(8) NOT NULL,
  `prf_rep` varchar(30) NOT NULL,
  `ltb_rep` varchar(30) DEFAULT NULL,
  `pot_rep` varchar(10) DEFAULT NULL,
  `par_rep` enum('padre','madre','representante','persona cercana') DEFAULT NULL,
  `twt_rep` varchar(15) DEFAULT NULL,
  `fac_rep` varchar(15) DEFAULT NULL,
  `ins_rep` varchar(15) DEFAULT NULL,
  `org_rep` enum('UBCH','Consejo comunal','Otro') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rep_est`
--

CREATE TABLE `rep_est` (
  `idd_ret` int(8) NOT NULL,
  `est_ret` int(8) NOT NULL,
  `rep_ret` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solvencia`
--

CREATE TABLE `solvencia` (
  `idd_sol` int(8) NOT NULL,
  `est_sol` int(8) NOT NULL,
  `obv_est` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`idd_est`),
  ADD KEY `per_est` (`per_est`),
  ADD KEY `hab_est` (`hab_est`),
  ADD KEY `rel_est` (`rel_est`);

--
-- Indices de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD PRIMARY KEY (`idd_hab`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idd_mat`);

--
-- Indices de la tabla `mat_sol`
--
ALTER TABLE `mat_sol`
  ADD PRIMARY KEY (`idd_mts`),
  ADD KEY `sol_mts` (`sol_mts`),
  ADD KEY `mat_mts` (`mat_mts`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idd_per`),
  ADD UNIQUE KEY `cdi_per` (`cdi_per`),
  ADD UNIQUE KEY `cor_per` (`cor_per`);

--
-- Indices de la tabla `religion`
--
ALTER TABLE `religion`
  ADD PRIMARY KEY (`idd_rel`);

--
-- Indices de la tabla `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`idd_rep`),
  ADD KEY `per_rep` (`per_rep`);

--
-- Indices de la tabla `rep_est`
--
ALTER TABLE `rep_est`
  ADD PRIMARY KEY (`idd_ret`),
  ADD KEY `est_ret` (`est_ret`),
  ADD KEY `rep_ret` (`rep_ret`);

--
-- Indices de la tabla `solvencia`
--
ALTER TABLE `solvencia`
  ADD PRIMARY KEY (`idd_sol`),
  ADD KEY `est_sol` (`est_sol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `idd_est` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  MODIFY `idd_hab` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idd_mat` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mat_sol`
--
ALTER TABLE `mat_sol`
  MODIFY `idd_mts` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idd_per` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `religion`
--
ALTER TABLE `religion`
  MODIFY `idd_rel` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `representante`
--
ALTER TABLE `representante`
  MODIFY `idd_rep` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rep_est`
--
ALTER TABLE `rep_est`
  MODIFY `idd_ret` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solvencia`
--
ALTER TABLE `solvencia`
  MODIFY `idd_sol` int(8) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`per_est`) REFERENCES `persona` (`idd_per`),
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`hab_est`) REFERENCES `habilidad` (`idd_hab`),
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`rel_est`) REFERENCES `religion` (`idd_rel`);

--
-- Filtros para la tabla `mat_sol`
--
ALTER TABLE `mat_sol`
  ADD CONSTRAINT `mat_sol_ibfk_1` FOREIGN KEY (`sol_mts`) REFERENCES `solvencia` (`idd_sol`),
  ADD CONSTRAINT `mat_sol_ibfk_2` FOREIGN KEY (`mat_mts`) REFERENCES `materia` (`idd_mat`);

--
-- Filtros para la tabla `representante`
--
ALTER TABLE `representante`
  ADD CONSTRAINT `representante_ibfk_1` FOREIGN KEY (`per_rep`) REFERENCES `persona` (`idd_per`);

--
-- Filtros para la tabla `rep_est`
--
ALTER TABLE `rep_est`
  ADD CONSTRAINT `rep_est_ibfk_1` FOREIGN KEY (`est_ret`) REFERENCES `estudiante` (`idd_est`),
  ADD CONSTRAINT `rep_est_ibfk_2` FOREIGN KEY (`rep_ret`) REFERENCES `representante` (`idd_rep`);

--
-- Filtros para la tabla `solvencia`
--
ALTER TABLE `solvencia`
  ADD CONSTRAINT `solvencia_ibfk_1` FOREIGN KEY (`est_sol`) REFERENCES `estudiante` (`idd_est`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
