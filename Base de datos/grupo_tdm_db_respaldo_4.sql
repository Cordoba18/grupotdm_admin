-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 10:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grupo_tdm_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `area` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `area`, `updated_at`, `created_at`) VALUES
(1, 'ADMINISTRADOR', NULL, NULL),
(2, 'SISTEMAS', NULL, NULL),
(3, 'DISEÑO', NULL, NULL),
(4, 'ADMINISTRACIÓN', NULL, NULL),
(5, 'DEMANDA', NULL, NULL),
(6, 'MERCADEO', NULL, NULL),
(7, 'TESORERÍA', NULL, NULL),
(8, 'SISTEMAS DE INFORMACIÓN', NULL, NULL),
(9, 'GESTIÓN HUMANA', NULL, NULL),
(10, 'CONTABILIDAD', NULL, NULL),
(11, 'CONTROL DE RIESGOS', NULL, NULL),
(12, 'LOGÍSTICA', NULL, NULL),
(13, 'VENTAS VIRTUALES', NULL, NULL),
(14, 'VENTAS', NULL, NULL),
(15, 'PRODUCCIÒN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` int(11) NOT NULL,
  `chargy` varchar(45) NOT NULL,
  `id_area` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`id`, `chargy`, `id_area`, `updated_at`, `created_at`) VALUES
(1, 'JEFE DE AREA', 2, NULL, NULL),
(2, 'COORDINADOR', 2, NULL, NULL),
(3, 'ANALISTA DE INNOVACIÓN', 2, NULL, NULL),
(4, 'ANALISTA DE SOPORTE', 2, NULL, NULL),
(5, 'AUXILIAR', 2, NULL, NULL),
(6, 'JEFE DE AREA', 3, NULL, NULL),
(7, 'DISEÑADOR', 3, NULL, NULL),
(8, 'PATRONISTA', 3, NULL, NULL),
(9, 'OPERARIA DE MUESTRA', 3, NULL, NULL),
(10, 'OPERARIA DE CONFECCIÓN', 3, NULL, NULL),
(11, 'JEFE DE AREA', 4, NULL, NULL),
(12, 'COORDINADOR', 4, NULL, NULL),
(13, 'AUXILIAR DE MANTENIMIENTO', 4, NULL, NULL),
(14, 'JEFE DE AREA', 5, NULL, NULL),
(15, 'COORDINADOR', 5, NULL, NULL),
(16, 'JEFE DE COMPRAS', 5, NULL, NULL),
(17, 'ANALISTA DE DISTRIBUCIÓN', 5, NULL, NULL),
(18, 'JEFE DE AREA', 6, NULL, NULL),
(19, 'COORDINADORA', 6, NULL, NULL),
(20, 'DISEÑADORES GRAFICOS', 6, NULL, NULL),
(21, 'VISUAL NACIONAL', 6, NULL, NULL),
(22, 'JEFE DE AREA', 7, NULL, NULL),
(23, 'COORDINADOR', 7, NULL, NULL),
(24, 'TESORERO', 7, NULL, NULL),
(25, 'MENSAJERO', 7, NULL, NULL),
(26, 'AUXILIAR', 7, NULL, NULL),
(27, 'JEFE DE AREA', 8, NULL, NULL),
(28, 'COORDINADOR', 8, NULL, NULL),
(29, 'ANALISTA DE INNOVACIÓN', 8, NULL, NULL),
(30, 'ANALISTA DE SOPORTE', 8, NULL, NULL),
(31, 'AUXILIAR', 8, NULL, NULL),
(32, 'JEFE DE AREA', 9, NULL, NULL),
(33, 'JEFE', 9, NULL, NULL),
(34, 'ANALISTA SST', 9, NULL, NULL),
(35, 'ANALISTA DE SELECCIÓN', 9, NULL, NULL),
(36, 'COORDINADOR NÓMINA Y CONTRATACIÓN', 9, NULL, NULL),
(37, 'AUXILIAR', 9, NULL, NULL),
(38, 'ANALISTA', 9, NULL, NULL),
(39, 'JEFE DE AREA', 10, NULL, NULL),
(40, 'DIRECCIÓN', 10, NULL, NULL),
(41, 'CONTADOR', 10, NULL, NULL),
(42, 'ANALISTA', 10, NULL, NULL),
(43, 'AUXILIAR', 10, NULL, NULL),
(44, 'COORDINADOR DE INVENTARIOS', 10, NULL, NULL),
(45, 'AUDITORIA CONTROL INTERNO', 10, NULL, NULL),
(46, 'JEFE DE AREA', 11, NULL, NULL),
(47, 'COORDINADORA', 11, NULL, NULL),
(48, 'LIDER', 11, NULL, NULL),
(49, 'AUXILIAR', 11, NULL, NULL),
(50, 'JEFE DE AREA', 12, NULL, NULL),
(51, 'COORDINADOR DESPACHO', 12, NULL, NULL),
(52, 'COORDINADOR OPERACIONAL', 12, NULL, NULL),
(53, 'COORDINADOR DE INGRESO', 12, NULL, NULL),
(54, 'CONDUCTOR', 12, NULL, NULL),
(55, 'AUXILIAR', 12, NULL, NULL),
(56, 'JEFE DE AREA', 13, NULL, NULL),
(57, 'LÍDER', 13, NULL, NULL),
(58, 'ASESOR', 13, NULL, NULL),
(59, 'JEFE DE AREA', 14, NULL, NULL),
(60, 'ADMINISTRADOR/LIDER DE SERVICIO', 14, NULL, NULL),
(61, 'ELITE', 14, NULL, NULL),
(62, 'LIDER ESTRATÈGICO', 14, NULL, NULL),
(63, 'SOCIO ESTRATÈGICO', 14, NULL, NULL),
(64, 'LÌDER DE CAJA', 14, NULL, NULL),
(65, 'VENDEDOR', 14, NULL, NULL),
(66, 'LOCUTOR', 14, NULL, NULL),
(67, 'VISUAL', 14, NULL, NULL),
(68, 'AUXILIAR DE CAJA', 14, NULL, NULL),
(69, 'JEFE DE AREA', 15, NULL, NULL),
(70, 'COORDINADOR', 15, NULL, NULL),
(71, 'JEFE DE BODEGA', 15, NULL, NULL),
(72, 'INSUMOS', 15, NULL, NULL),
(73, 'MATERIA PRIMA', 15, NULL, NULL),
(74, 'EXTENDEDORES Y CONTADORES', 15, NULL, NULL),
(75, 'JEFE DE CORTE', 15, NULL, NULL),
(76, 'COSTOS Y FACTURACIÒN', 15, NULL, NULL),
(77, 'LEGISLACIÒN DE INGRESOS A BODEGA', 15, NULL, NULL),
(78, 'COSTEO DE PRENDAS', 15, NULL, NULL),
(79, 'FACTURACIÒN', 15, NULL, NULL),
(80, 'TALLERES', 15, NULL, NULL),
(81, 'GESTORES DE PRODUCCIÒN', 15, NULL, NULL),
(82, 'AUTORES DE CALIDAD', 15, NULL, NULL),
(83, 'JEFE DE AREA', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `email` varchar(100) NOT NULL,
  `code` varchar(6) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`email`, `code`, `updated_at`, `created_at`) VALUES
('csoporte@eltemplodelamoda.com.co', '271395', '2023-12-09 21:33:16', '2023-12-09 21:33:16'),
('jccq12@eltemplodelamoda.com.co', '528815', '2023-12-09 18:50:00', '2023-12-09 18:50:00'),
('jccq12@eltemplodelamodafresca.com.co', '984455', '2023-12-09 18:49:21', '2023-12-09 18:49:21'),
('jccq12@gmail.com', '551555', '2023-12-07 20:40:26', '2023-12-07 20:40:26'),
('sistemasaux8@eltemplodelamoda.com.co', '450521', '2023-12-07 18:38:05', '2023-12-07 18:38:05'),
('soporte@eltemplodelamoda.com.co', '388343', '2023-12-07 20:24:41', '2023-12-07 20:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `date` varchar(45) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `date`, `id_user`, `id_ticket`, `id_state`, `updated_at`, `created_at`) VALUES
(7, 'No se pudo activar mac', 'December 07 2023', 1, 6, 1, '2023-12-08 01:46:09', '2023-12-08 01:46:09'),
(8, 'Volvere a intentar dame un momento', 'December 07 2023', 12, 6, 1, '2023-12-08 01:48:42', '2023-12-08 01:48:42'),
(10, 'Ya va mucho tiempo de espera', 'December 07 2023', 1, 6, 1, '2023-12-08 02:49:17', '2023-12-08 02:49:17'),
(12, 'Enciende el equipo', '09 December 2023', 1, 13, 1, '2023-12-09 20:52:31', '2023-12-09 20:52:31'),
(13, 'Ya lo encendi', '09 December 2023', 2, 13, 1, '2023-12-09 20:53:17', '2023-12-09 20:53:17'),
(14, 'Porfavor enciende el equipo', '09 December 2023', 1, 14, 1, '2023-12-09 21:48:46', '2023-12-09 21:48:46');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company`, `updated_at`, `created_at`) VALUES
(1, 'EL TEMPLO DE LA MODA S.A.S', NULL, NULL),
(2, 'EL TEMPLO DE LA MODA FRESCA S.A.S', NULL, NULL),
(3, 'TEXTILES Y CREACIONES EL UNIVERSO S.A.S', NULL, NULL),
(4, 'TEXTILES Y CREACIONES LOS ANGELES S.A.S', NULL, NULL),
(5, 'TODAS LAS COMPAÑIAS', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directories`
--

CREATE TABLE `directories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `code` varchar(6) DEFAULT NULL,
  `directory` varchar(30) NOT NULL,
  `date_create` varchar(45) NOT NULL,
  `date_update` varchar(45) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directories`
--

INSERT INTO `directories` (`id`, `name`, `code`, `directory`, `date_create`, `date_update`, `id_user`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'TPV 2023', '983705', '09-12-2023 08-04-24/1', '09-12-2023 08-04-24', '09-12-2023 08-05-40', 1, 2, '2023-12-09 18:06:31', '2023-12-09 18:04:26'),
(2, 'MANUEL INSTALACION CAJAS', '840428', '09-12-2023 12-06-19/1', '09-12-2023 12-06-19', '09-12-2023 12-08-12', 1, 1, '2023-12-09 22:08:12', '2023-12-09 22:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `file` varchar(100) NOT NULL,
  `date_create` varchar(45) NOT NULL,
  `date_update` varchar(45) NOT NULL,
  `id_directory` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `file`, `date_create`, `date_update`, `id_directory`, `id_state`, `id_user`, `updated_at`, `created_at`) VALUES
(1, 'ACTA DE SALIDA V2', '2023-12-09_13-05-40.jfif', '09-12-2023 08-04-59', '09-12-2023 08-05-40', 1, 2, 1, '2023-12-09 18:06:23', '2023-12-09 18:05:01'),
(2, 'MANUAL INSTALACION 2023 V2', '2023-12-09_17-08-12.jfif', '09-12-2023 12-07-27', '09-12-2023 12-08-12', 2, 1, 1, '2023-12-09 22:08:12', '2023-12-09 22:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `files_modified`
--

CREATE TABLE `files_modified` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `file` varchar(100) NOT NULL,
  `date_update` varchar(45) NOT NULL,
  `id_file` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files_modified`
--

INSERT INTO `files_modified` (`id`, `name`, `file`, `date_update`, `id_file`, `id_user`, `updated_at`, `created_at`) VALUES
(1, 'VERSION', '2023-12-09_13-04-59.xlsx', '09-12-2023 08-04-59', 1, 1, '2023-12-09 18:05:27', '2023-12-09 18:05:27'),
(2, 'ACTA DE SALIDA', '2023-12-09_13-04-59.xlsx', '09-12-2023 08-05-27', 1, 1, '2023-12-09 18:05:40', '2023-12-09 18:05:40'),
(3, 'MANUAL INSTALACION 2023', '2023-12-09_17-07-27.xlsx', '09-12-2023 12-07-27', 2, 1, '2023-12-09 22:08:12', '2023-12-09 22:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` int(11) NOT NULL,
  `priority` varchar(45) NOT NULL,
  `hour` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `priority`, `hour`, `updated_at`, `created_at`) VALUES
(1, 'BAJA', 6, NULL, NULL),
(2, 'MEDIA', 5, NULL, NULL),
(3, 'ALTA', 4, NULL, NULL),
(4, 'SUPERIOR', 2, NULL, NULL),
(5, 'URGENTE', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_report_detail` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_details`
--

CREATE TABLE `report_details` (
  `id` int(11) NOT NULL,
  `report` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `shop` varchar(100) NOT NULL,
  `id_company` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `shop`, `id_company`, `updated_at`, `created_at`) VALUES
(1, 'CALI CENTRO - TEMPLO 1', 1, NULL, NULL),
(2, 'CALI CENTRO - TEMPLO 2', 1, NULL, NULL),
(3, 'ARMENIA - TEMPLO 4', 1, NULL, NULL),
(4, 'CALI VALLE DEL LILI SUR - TEMPLO 5', 1, NULL, NULL),
(5, 'BUENAVENTURA - TEMPLO 6', 1, NULL, NULL),
(6, 'CALI CALIMA - TEMPLO 8', 1, NULL, NULL),
(7, 'PALMIRA - TEMPLO 9', 1, NULL, NULL),
(8, 'PEREIRA - TEMPLO 10', 1, NULL, NULL),
(9, 'CALI CENTRO - TEMPLO 11', 1, NULL, NULL),
(10, 'JAMUNDÌ - TEMPLO 13', 1, NULL, NULL),
(11, 'MANIZALES - TEMPLO 14', 1, NULL, NULL),
(12, 'TULÙA - TEMPLO 16', 1, NULL, NULL),
(13, 'SANTANDER DE QUILICHAO - TEMPLO 17', 1, NULL, NULL),
(14, 'CALI CALLE 26 - TEMPLO 18', 1, NULL, NULL),
(15, 'IBAGUÈ - TEMPLO 19', 1, NULL, NULL),
(16, 'CALI MARIANO RAMOS - TEMPLO 20', 1, NULL, NULL),
(17, 'YUMBO - TEMPLO 23', 1, NULL, NULL),
(18, 'BUGA - TEMPLO 24', 1, NULL, NULL),
(19, 'CALI LOS MANGOS - TEMPLO 26', 1, NULL, NULL),
(20, 'FLORIDA - TEMPLO 27', 1, NULL, NULL),
(21, 'POPAYÀN - TEMPLO 28', 1, NULL, NULL),
(22, 'CALI MELÈNDEZ - TEMPLO 29', 1, NULL, NULL),
(23, 'CALI ALAMEDA - TEMPLO 30', 1, NULL, NULL),
(24, 'CALI CARRERA 1 - TEMPLO 31', 1, NULL, NULL),
(25, 'CALI COSMOCENTRO - TEMPLO 32', 1, NULL, NULL),
(26, 'NEIVA CENTRO - TEMPLO 33', 1, NULL, NULL),
(27, 'BUENAVENTURA PACIFIC MALLL - TEMPLO 34', 1, NULL, NULL),
(28, 'PALMIRA UNICENTRO - TEMPLO 35', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `state` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state`, `updated_at`, `created_at`) VALUES
(1, 'ACTIVO', NULL, NULL),
(2, 'INACTIVO', NULL, NULL),
(3, 'PENDIENTE', NULL, NULL),
(4, 'VISTO', NULL, NULL),
(5, 'EN EJECUCIÒN', NULL, NULL),
(6, 'VENCIDO', NULL, NULL),
(7, 'TERMINADO', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `date_start` varchar(45) NOT NULL,
  `date_finally` varchar(45) NOT NULL,
  `id_priority` int(11) NOT NULL,
  `id_user_sender` int(11) NOT NULL,
  `id_user_destination` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `name`, `description`, `file`, `date_start`, `date_finally`, `id_priority`, `id_user_sender`, `id_user_destination`, `id_state`, `updated_at`, `created_at`) VALUES
(2, 'ACTIVACION DE MAC', 'anydesk 444444585', NULL, '06/12/2023 16:14:31', '06/12/2023 18:14:31', 4, 1, 12, 6, '2023-12-07 20:41:34', '2023-12-07 02:14:46'),
(3, 'HABILITACION MAC', 'SDDFSDFDSFDSFDS', NULL, '06/12/2023 16:18:50', '06/12/2023 17:18:50', 5, 1, 12, 6, '2023-12-07 21:39:05', '2023-12-07 02:19:11'),
(4, 'FEWFEWF', 'WRWEREWRWER', NULL, '06/12/2023 16:20:00', '06/12/2023 20:20:00', 3, 1, 12, 6, '2023-12-07 21:44:01', '2023-12-07 02:20:14'),
(5, '32423R423RWER', 'EWREWRWERWEREW', NULL, '06/12/2023 16:20:49', '06/12/2023 18:20:49', 4, 1, 12, 6, '2023-12-07 21:43:32', '2023-12-07 02:21:00'),
(6, 'ACTIVACION DE MAC', 'w24e2424', NULL, '06/12/2023 16:33:04', '07/14/2023 22:33:04', 1, 1, 12, 7, '2023-12-07 20:57:03', '2023-12-07 02:33:16'),
(7, 'ACTIVACION DE MAC', 'fsefesfw', NULL, '06/12/2023 16:58:51', '06/12/2023 18:58:51', 4, 1, 1, 7, '2023-12-07 20:41:34', '2023-12-07 02:59:05'),
(8, 'ACTIVACION DE MAC', 'adsadasdsad', NULL, '06/12/2023 17:31:16', '06/12/2023 23:31:16', 1, 10, 1, 6, '2023-12-07 20:41:34', '2023-12-07 03:31:54'),
(9, 'ACTIVACION DE MAC', '2werewrewre', NULL, '07/12/2023 11:44:35', '07/12/2023 12:44:35', 5, 1, 1, 7, '2023-12-07 21:47:51', '2023-12-07 21:44:48'),
(10, 'EQUIPO LENTO', 'Equipo muy lento', NULL, '07/12/2023 14:24:18', '07/12/2023 15:24:18', 5, 1, 1, 6, '2023-12-09 18:01:48', '2023-12-08 00:24:52'),
(11, 'Revisar actas de entrega', 'Lo mas pronto posible revisar lo siguiente', '2023-12-07_19-28-38.xlsx', '07/12/2023 14:27:56', '07/12/2023 15:27:56', 5, 1, 1, 6, '2023-12-09 18:01:44', '2023-12-08 00:28:40'),
(12, 'ACTIVACION DE MAC', 'Activar mac con el siguiente anydesk porfavorrrr', '2023-12-07_19-36-08.jfif', '07/12/2023 14:35:43', '07/15/2023 15:35:43', 5, 1, 1, 7, '2023-12-09 19:10:40', '2023-12-08 00:36:10'),
(13, 'ACTIVACION DE MAC', 'asdadawd', '2023-12-09_15-51-35.jfif', '09/12/2023 10:51:20', '09/12/2023 11:51:20', 5, 2, 1, 2, '2023-12-09 20:59:22', '2023-12-09 20:51:37'),
(14, 'ACTIVACION DE MAC', 'Necesito esta tarea', '2023-12-09_16-46-22.jfif', '09/12/2023 11:43:36', '09/12/2023 12:43:36', 5, 13, 1, 7, '2023-12-09 21:50:33', '2023-12-09 21:46:24'),
(15, 'SALIDA SPACE', 'Mañan 10 pm', NULL, '11/12/2023 11:44:39', '11/15/2023 15:44:39', 3, 13, 15, 3, '2023-12-11 21:44:59', '2023-12-11 21:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_company` int(11) DEFAULT NULL,
  `id_state` int(11) NOT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_chargy` int(11) DEFAULT NULL,
  `id_shop` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `nit`, `email`, `password`, `id_company`, `id_state`, `id_area`, `id_chargy`, `id_shop`, `updated_at`, `created_at`) VALUES
(1, 'Jhan Carlos Cordoba', '1111663045', 'jccq12@gmail.com', '$2y$12$1iTANTEqugORQjx5fENwwOGrjYaCugfuZ8JdUDPt6sR4zOnns6c.S', 1, 1, 2, 1, NULL, '2023-12-06 19:36:34', '2023-12-04 06:41:19'),
(2, 'Administrador GRUPO TDM', '805027653', 'soporte@eltemplodelamoda.com.co', '$2y$12$URua6E9e.DoM3Nt2TzqadOQo0RG2QnM5Hk6a5A7EdemJZNaKMttVK', 3, 1, 1, 83, NULL, '2023-12-04 07:04:03', '2023-12-04 07:04:03'),
(10, 'Anderson Cordoba', '1565654465', 'sistemasaux8@eltemplodelamoda.com.co', '$2y$12$RePEIqHaMsIdOsiT1VgfSOBZPhG3sCGXTFpCfAeOi2V8nBmRwFUI6', 5, 1, 2, 5, 2, '2023-12-06 20:52:00', '2023-12-06 20:36:20'),
(11, 'Kelly Gomez', '123456789', 'analistadesistemas@eltemplodelamoda.com.co', '$2y$12$DsPHFtMueUypFjuQyovIeuDIrr3HDOxvVSlEy4rcP6dt8gOnDPPMO', 1, 1, 2, 4, 2, '2023-12-06 23:57:46', '2023-12-06 23:57:46'),
(12, 'Jerson Henao', '987456123', 'sistemasaux4@eltemplodelamoda.com.co', '$2y$12$3HC5qCgFUCEYrSTJ/xA6X.Vo.i8ScF5atbOECjPIc3uB9GhgLPpou', 5, 1, 2, 3, 2, '2023-12-06 23:59:07', '2023-12-06 23:59:07'),
(13, 'Rodrigo Rodallega', '94495428', 'csoporte@eltemplodelamoda.com.co', '$2y$12$QHlRbbn8t9BP1NUuRB90oeZ7kQ/Q7lt1UuhAafWbnZjPvgLxnSYe2', 5, 1, 2, 1, NULL, '2023-12-09 21:35:23', '2023-12-09 21:34:32'),
(15, 'Adrian Garcia', '11929101283', 'sistemasaux10@eltemplodelamoda.com.co', '$2y$12$phLVMrVM7llr9rKXZhNiIuhlbEL7pfvnSk2q1yKmxdxcrnhwEjulK', 1, 1, 2, 5, NULL, '2023-12-11 21:44:18', '2023-12-11 21:44:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_charges_areas_idx` (`id_area`);

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_users1_idx` (`id_user`),
  ADD KEY `fk_comments_tickets1_idx` (`id_ticket`),
  ADD KEY `fk_comments_states1_idx` (`id_state`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directories`
--
ALTER TABLE `directories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_directories_users1_idx` (`id_user`),
  ADD KEY `fk_directories_states1_idx` (`id_state`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_files_states1_idx` (`id_state`),
  ADD KEY `fk_files_users1_idx` (`id_user`),
  ADD KEY `fk_files_directories1_idx` (`id_directory`);

--
-- Indexes for table `files_modified`
--
ALTER TABLE `files_modified`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_files_modified_files1_idx` (`id_file`),
  ADD KEY `fk_files_modified_users1_idx` (`id_user`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reports_users1_idx` (`id_user`),
  ADD KEY `fk_reports_report_details1_idx` (`id_report_detail`);

--
-- Indexes for table `report_details`
--
ALTER TABLE `report_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shops_companies1_idx` (`id_company`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tickets_states1_idx` (`id_state`),
  ADD KEY `fk_tickets_users1_idx` (`id_user_sender`),
  ADD KEY `fk_tickets_users2_idx` (`id_user_destination`),
  ADD KEY `fk_tickets_priorities1_idx` (`id_priority`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_companies1_idx` (`id_company`),
  ADD KEY `fk_users_states1_idx` (`id_state`),
  ADD KEY `fk_users_areas1_idx` (`id_area`),
  ADD KEY `fk_users_charges1_idx` (`id_chargy`),
  ADD KEY `fk_users_shops1_idx` (`id_shop`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `directories`
--
ALTER TABLE `directories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `files_modified`
--
ALTER TABLE `files_modified`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_details`
--
ALTER TABLE `report_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `fk_charges_areas` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_tickets1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `directories`
--
ALTER TABLE `directories`
  ADD CONSTRAINT `fk_directories_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_directories_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `fk_files_directories1` FOREIGN KEY (`id_directory`) REFERENCES `directories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_files_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_files_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `files_modified`
--
ALTER TABLE `files_modified`
  ADD CONSTRAINT `fk_files_modified_files1` FOREIGN KEY (`id_file`) REFERENCES `files` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_files_modified_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_report_details1` FOREIGN KEY (`id_report_detail`) REFERENCES `report_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reports_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `fk_shops_companies1` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_tickets_priorities1` FOREIGN KEY (`id_priority`) REFERENCES `priorities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_users1` FOREIGN KEY (`id_user_sender`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_users2` FOREIGN KEY (`id_user_destination`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_areas1` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_charges1` FOREIGN KEY (`id_chargy`) REFERENCES `charges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_companies1` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_shops1` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
