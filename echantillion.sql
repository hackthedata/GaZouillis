-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 29, 2016 at 04:57 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gazou`
--

-- --------------------------------------------------------

--
-- Table structure for table `echantillion`
--

CREATE TABLE IF NOT EXISTS `echantillion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) COLLATE utf8_esperanto_ci NOT NULL,
  `date_sql` date NOT NULL,
  `jour` varchar(2) COLLATE utf8_esperanto_ci NOT NULL,
  `mois` varchar(2) COLLATE utf8_esperanto_ci NOT NULL,
  `annee` varchar(2) COLLATE utf8_esperanto_ci NOT NULL,
  `date_excel` varchar(5) COLLATE utf8_esperanto_ci NOT NULL,
  `globale` varchar(50) COLLATE utf8_esperanto_ci NOT NULL,
  `chauffage` varchar(50) COLLATE utf8_esperanto_ci NOT NULL,
  `eau` varchar(50) COLLATE utf8_esperanto_ci NOT NULL,
  `cuisson` varchar(50) COLLATE utf8_esperanto_ci NOT NULL,
  `dju` varchar(10) COLLATE utf8_esperanto_ci NOT NULL,
  `degre` varchar(10) COLLATE utf8_esperanto_ci NOT NULL,
  `periode` varchar(1) COLLATE utf8_esperanto_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci AUTO_INCREMENT=1094 ;

--
-- Dumping data for table `echantillion`
--

INSERT INTO `echantillion` (`id`, `date`, `date_sql`, `jour`, `mois`, `annee`, `date_excel`, `globale`, `chauffage`, `eau`, `cuisson`, `dju`, `degre`, `periode`) VALUES /* DATA EFFACEES EN REPONSE A LA CHARTRE */
INSERT INTO `echantillion` (`id`, `date`, `date_sql`, `jour`, `mois`, `annee`, `date_excel`, `globale`, `chauffage`, `eau`, `cuisson`, `dju`, `degre`, `periode`) VALUES/* DATA EFFACEES EN REPONSE A LA CHARTRE */

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
