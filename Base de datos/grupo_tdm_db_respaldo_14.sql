-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-01-2024 a las 23:30:30
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `grupo_tdm_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `area` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `areas`
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
(15, 'PRODUCCIÒN', NULL, NULL),
(16, 'RECEPCION', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `califications`
--

CREATE TABLE `califications` (
  `id` int(11) NOT NULL,
  `calification` int(11) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `califications`
--

INSERT INTO `califications` (`id`, `calification`, `comment`, `id_ticket`, `id_user`, `date`, `updated_at`, `created_at`) VALUES
(1, 1, 'Pesima atencion', 11, 1, '13 December 2023', '2023-12-14 03:09:46', '2023-12-14 00:06:14'),
(2, 5, 'Muy bien', 6, 1, '13 December 2023', '2023-12-14 00:57:14', '2023-12-14 00:57:14'),
(3, 2, 'Todo esta muy bien gracias', 21, 2, '19 December 2023', '2023-12-19 21:09:31', '2023-12-14 01:04:25'),
(4, 4, 'Gracias', 17, 2, '19 December 2023', '2023-12-19 20:02:52', '2023-12-19 20:02:52'),
(5, 5, 'Muy buen servicio', 25, 16, '21 December 2023', '2023-12-22 01:31:36', '2023-12-22 01:31:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `id_proceeding` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `id_user_delivery` int(11) NOT NULL,
  `id_user_receives` int(11) NOT NULL,
  `id_user_reception` int(11) DEFAULT NULL,
  `general_remarks` varchar(500) DEFAULT NULL,
  `image_exit` varchar(45) DEFAULT NULL,
  `date_exit` varchar(45) DEFAULT NULL,
  `image_delivery` varchar(45) DEFAULT NULL,
  `date_delivery` varchar(45) DEFAULT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `certificates`
--

INSERT INTO `certificates` (`id`, `id_proceeding`, `date`, `address`, `id_user_delivery`, `id_user_receives`, `id_user_reception`, `general_remarks`, `image_exit`, `date_exit`, `image_delivery`, `date_delivery`, `id_state`, `updated_at`, `created_at`) VALUES
(8, 1, '26/12/2023 17:13:30', 'Calle 28#86-29 CALI COLOMBIA', 1, 1, NULL, 'NN/A', NULL, NULL, NULL, NULL, 2, '2023-12-27 20:03:53', '2023-12-27 03:14:16'),
(9, 1, '26/12/2023 17:16:52', 'Calle 28#86-29 CALI COLOMBIA', 1, 1, NULL, 'werwer', NULL, NULL, NULL, NULL, 2, '2023-12-27 19:57:12', '2023-12-27 03:17:25'),
(10, 1, '26/12/2023 17:19:00', 'Calle 28#86-29 CALI COLOMBIA', 1, 1, NULL, 'ewrwerwerwerwerwerwerwerrwerwer', NULL, NULL, NULL, NULL, 2, '2023-12-27 19:56:47', '2023-12-27 03:19:55'),
(11, 1, '26/12/2023 17:24:55', 'Calle 28#86-29 CALI COLOMBIA', 1, 1, NULL, 'fdstfdsg', NULL, NULL, NULL, NULL, 2, '2023-12-27 19:56:07', '2023-12-27 03:25:29'),
(12, 1, '27/12/2023 10:59:15', 'Calle 28#86-29 CALI COLOMBIA', 1, 1, 16, 'N/A', '2023-12-27_18-26-19.jfif', '27/12/2023 13:25:59', '2023-12-27_18-28-55.jfif', '27/12/2023 13:28:07', 2, '2023-12-28 01:43:58', '2023-12-27 20:59:50'),
(13, 2, '27/12/2023 15:47:05', 'Calle 14 TEMPLO 2 CALI', 1, 10, 16, 'Sale los dos productos juntos', '2023-12-27_20-52-48.jfif', '27/12/2023 15:52:36', '2023-12-27_20-57-01.jfif', '27/12/2023 15:55:23', 2, '2023-12-28 23:20:58', '2023-12-28 01:48:26'),
(14, 1, '04/01/2024 08:15:23', 'Calle 28#86-29', 1, 1, NULL, 'N/A', NULL, NULL, NULL, NULL, 3, '2024-01-04 18:15:46', '2024-01-04 18:15:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `charges`
--

CREATE TABLE `charges` (
  `id` int(11) NOT NULL,
  `chargy` varchar(45) NOT NULL,
  `id_area` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `charges`
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
(83, 'JEFE DE AREA', 1, NULL, NULL),
(84, 'JEFE DE AREA', 16, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codes`
--

CREATE TABLE `codes` (
  `email` varchar(100) NOT NULL,
  `code` varchar(6) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `codes`
--

INSERT INTO `codes` (`email`, `code`, `updated_at`, `created_at`) VALUES
('csoporte@eltemplodelamoda.com.co', '271395', '2023-12-09 21:33:16', '2023-12-09 21:33:16'),
('jccq12@eltemplodelamoda.com.co', '528815', '2023-12-09 18:50:00', '2023-12-09 18:50:00'),
('jccq12@eltemplodelamodafresca.com.co', '984455', '2023-12-09 18:49:21', '2023-12-09 18:49:21'),
('jccq12@gmail.com', '838625', '2023-12-20 21:33:53', '2023-12-20 21:33:53'),
('sistemasaux8@eltemplodelamoda.com.co', '450521', '2023-12-07 18:38:05', '2023-12-07 18:38:05'),
('sistemasaux9@eltemplodelamoda.com.co', '822431', '2023-12-21 00:26:14', '2023-12-21 00:26:14'),
('soporte@eltemplodelamoda.com.co', '786221', '2023-12-16 00:12:19', '2023-12-16 00:12:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `comment`, `date`, `id_user`, `id_ticket`, `id_state`, `updated_at`, `created_at`) VALUES
(8, 'Porfavor enciende el equipo', '13 December 2023', 1, 11, 1, '2023-12-13 23:59:13', '2023-12-13 23:59:13'),
(9, 'Hola estas haciendo la tarea?', '15 December 2023', 16, 23, 1, '2023-12-15 23:49:21', '2023-12-15 23:49:21'),
(10, 'Si dame un momento', '15 December 2023', 11, 23, 1, '2023-12-15 23:50:30', '2023-12-15 23:50:30'),
(11, 'Porfavor enciende el equipo', '19 December 2023', 1, 20, 1, '2023-12-19 14:59:50', '2023-12-19 14:59:50'),
(12, 'Porfavor enciende el equipo', '19 December 2023', 2, 17, 1, '2023-12-19 15:02:16', '2023-12-19 15:02:16'),
(14, 'Porfavor enciende el equipo', '21 December 2023', 10, 25, 1, '2023-12-21 20:20:16', '2023-12-21 20:20:16'),
(15, 'Esta encendido', '21 December 2023', 16, 25, 1, '2023-12-21 20:20:40', '2023-12-21 20:20:40'),
(16, 'Prueba de nuevo', '21 December 2023', 16, 25, 1, '2023-12-21 20:22:06', '2023-12-21 20:22:06'),
(17, 'asfergre', '22 December 2023', 1, 21, 1, '2023-12-22 13:46:22', '2023-12-22 13:46:22'),
(18, 'Y entonces', '03 January 2024', 12, 26, 1, '2024-01-03 19:17:40', '2024-01-03 19:17:40'),
(19, 'Hasta la cuantas?', '03 January 2024', 12, 26, 1, '2024-01-03 19:18:09', '2024-01-03 19:18:09'),
(20, 'Ya rey', '03 January 2024', 10, 26, 1, '2024-01-03 19:18:14', '2024-01-03 19:18:14'),
(21, 'A la hora 30, me toca solucionar a mi, ome', '03 January 2024', 12, 26, 1, '2024-01-03 19:18:30', '2024-01-03 19:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `company`, `updated_at`, `created_at`) VALUES
(1, 'EL TEMPLO DE LA MODA S.A.S', NULL, NULL),
(2, 'EL TEMPLO DE LA MODA FRESCA S.A.S', NULL, NULL),
(3, 'TEXTILES Y CREACIONES EL UNIVERSO S.A.S', NULL, NULL),
(4, 'TEXTILES Y CREACIONES LOS ANGELES S.A.S', NULL, NULL),
(5, 'TODAS LAS COMPAÑIAS', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directories`
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
-- Volcado de datos para la tabla `directories`
--

INSERT INTO `directories` (`id`, `name`, `code`, `directory`, `date_create`, `date_update`, `id_user`, `id_state`, `updated_at`, `created_at`) VALUES
(2, 'ACTAS SALIDAS', '118974', '12-12-2023 16-03-31/1', '12-12-2023 16-03-31', '12-12-2023 16-14-45', 1, 1, '2023-12-13 02:14:45', '2023-12-13 02:03:34'),
(3, 'OTRO', '560958', '12-12-2023 16-32-56/12', '12-12-2023 16-32-56', '12-12-2023 16-32-56', 12, 1, '2023-12-13 02:32:59', '2023-12-13 02:32:59'),
(4, 'DOCUMENTOS DE KAREN', '634187', '15-12-2023 14-07-00/2', '15-12-2023 14-07-00', '15-12-2023 14-09-17', 2, 2, '2023-12-19 15:24:35', '2023-12-16 00:07:03'),
(5, 'DOCUMENTOS DE KAREN', '808495', '19-12-2023 10-23-15/2', '19-12-2023 10-23-15', '19-12-2023 10-23-15', 2, 2, '2023-12-19 15:24:32', '2023-12-19 15:23:18'),
(6, 'DOCUMENTOS', '768224', '19-12-2023 10-29-27/2', '19-12-2023 10-29-27', '19-12-2023 10-29-27', 2, 1, '2023-12-19 15:29:30', '2023-12-19 15:29:30'),
(7, 'BASES DE DATOS', '702832', '03-01-2024 14-42-35/1', '03-01-2024 14-42-35', '03-01-2024 14-42-35', 1, 1, '2024-01-03 19:42:38', '2024-01-03 19:42:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `files`
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
-- Volcado de datos para la tabla `files`
--

INSERT INTO `files` (`id`, `name`, `file`, `date_create`, `date_update`, `id_directory`, `id_state`, `id_user`, `updated_at`, `created_at`) VALUES
(2, 'ACTA ENTRAGA', '2023-12-12_21-14-45.xlsx', '12-12-2023 16-04-15', '12-12-2023 16-14-45', 2, 1, 12, '2023-12-13 02:14:45', '2023-12-13 02:04:18'),
(3, 'ACTIVACION DE MAC', '2023-12-12_21-14-01.jfif', '12-12-2023 16-14-01', '12-12-2023 16-14-01', 2, 1, 12, '2023-12-13 02:14:04', '2023-12-13 02:14:04'),
(4, 'ACTAS DE ENTREGA', '2023-12-15_19-09-17.xlsx', '15-12-2023 14-07-39', '15-12-2023 14-09-17', 4, 1, 2, '2023-12-16 00:09:17', '2023-12-16 00:07:42'),
(5, 'ANYDESK DE MI EQUIPO', '2023-12-15_19-08-52.jfif', '15-12-2023 14-08-52', '15-12-2023 14-08-52', 4, 1, 2, '2023-12-16 00:08:55', '2023-12-16 00:08:55'),
(6, 'REPORTE ACTUALIZADO DE TIENDAS 2023', '2023-12-21_19-13-19.xlsx', '21-12-2023 14-13-19', '21-12-2023 14-13-19', 6, 1, 2, '2023-12-21 19:13:21', '2023-12-21 19:13:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `files_modified`
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
-- Volcado de datos para la tabla `files_modified`
--

INSERT INTO `files_modified` (`id`, `name`, `file`, `date_update`, `id_file`, `id_user`, `updated_at`, `created_at`) VALUES
(2, 'ACTA ENTRAGA', '2023-12-12_21-04-15.xlsx', '12-12-2023 16-04-15', 2, 1, '2023-12-13 02:14:45', '2023-12-13 02:14:45'),
(3, 'ACTAS DE ENTREGA', '2023-12-15_19-07-39.xlsx', '15-12-2023 14-07-39', 4, 2, '2023-12-16 00:09:17', '2023-12-16 00:09:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images_products`
--

CREATE TABLE `images_products` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `images_products`
--

INSERT INTO `images_products` (`id`, `image`, `id_product`, `id_state`, `updated_at`, `created_at`) VALUES
(1, '2023-12-28_19-38-04.jfif', 2, 1, '2023-12-29 00:38:04', '2023-12-29 00:38:04'),
(2, '2024-01-03_14-46-16.png', 3, 1, '2024-01-03 19:46:16', '2024-01-03 19:46:16'),
(3, '2024-01-04_19-43-56.webp', 4, 1, '2024-01-05 00:43:56', '2024-01-04 13:15:14'),
(4, '2024-01-04_14-45-40.jpg', 5, 1, '2024-01-04 19:45:40', '2024-01-04 19:45:40'),
(5, '2024-01-04_19-50-21.png', 4, 1, '2024-01-05 00:50:21', '2024-01-05 00:50:21'),
(6, '2024-01-04_19-50-28.webp', 4, 1, '2024-01-05 00:50:28', '2024-01-05 00:50:28'),
(7, '2024-01-04_19-50-34.jpg', 4, 1, '2024-01-05 00:50:34', '2024-01-05 00:50:34'),
(8, '2024-01-04_19-50-40.png', 4, 2, '2024-01-05 00:53:47', '2024-01-05 00:50:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origins_certificates`
--

CREATE TABLE `origins_certificates` (
  `id` int(11) NOT NULL,
  `origin_certificate` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `origins_certificates`
--

INSERT INTO `origins_certificates` (`id`, `origin_certificate`, `updated_at`, `created_at`) VALUES
(1, 'NUEVO', NULL, NULL),
(2, 'USADO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `date_application` varchar(45) DEFAULT NULL,
  `date_tomorrow` varchar(45) DEFAULT NULL,
  `time_exit` varchar(45) DEFAULT NULL,
  `time_return` varchar(45) DEFAULT NULL,
  `id_user_collaborator` int(11) DEFAULT NULL,
  `id_user_boss` int(11) DEFAULT NULL,
  `id_user_reception` int(11) DEFAULT NULL,
  `observations` varchar(500) DEFAULT NULL,
  `id_reason` int(11) NOT NULL,
  `id_replenish_time` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `date_application`, `date_tomorrow`, `time_exit`, `time_return`, `id_user_collaborator`, `id_user_boss`, `id_user_reception`, `observations`, `id_reason`, `id_replenish_time`, `id_state`, `updated_at`, `created_at`) VALUES
(1, '20/12/2023 09:09:19', '0', NULL, NULL, 10, NULL, NULL, 'SALIDA TEMPLO 11', 1, 1, 2, '2023-12-20 19:18:38', '2023-12-20 19:09:59'),
(2, '20/12/2023 09:36:01', '0', '21/12/2023 11:41:33', '21/12/2023 11:41:37', 10, 1, 16, 'SALIDA TEMPLO 11', 1, 1, 10, '2023-12-21 21:41:39', '2023-12-20 19:36:10'),
(3, '20/12/2023 09:36:58', '0', '20/12/2023 16:26:23', '21/12/2023 10:05:19', 10, 1, 16, 'SALIDA TEMPLO 11', 1, 1, 10, '2023-12-21 20:05:26', '2023-12-20 19:37:07'),
(4, '20/12/2023 11:38:44', '0', '20/12/2023 14:52:43', '20/12/2023 14:56:40', 10, 1, 16, 'SALIDA', 1, 1, 10, '2023-12-21 00:56:42', '2023-12-20 21:38:51'),
(5, '20/12/2023 14:58:34', '0', NULL, NULL, 10, 1, NULL, 'SALIDA TEMPLO 2 ARREGLO DE EQUIPO', 4, 2, 10, '2023-12-21 01:10:06', '2023-12-21 00:58:56'),
(6, '20/12/2023 15:10:48', '0', '20/12/2023 15:13:14', '20/12/2023 15:13:18', 1, 1, 16, 'VOY POR UNAS NEW BALANCE 550', 4, 2, 2, '2023-12-21 21:41:19', '2023-12-21 01:11:12'),
(7, '20/12/2023 15:59:15', '0', '20/12/2023 17:21:25', '21/12/2023 08:21:49', 10, 1, 16, 'SALIDA TEMPLO POR AHI', 1, 1, 10, '2023-12-21 18:21:51', '2023-12-21 01:59:29'),
(8, '21/12/2023 08:32:24', '22/12/2023 08:33:00', NULL, NULL, 10, 1, NULL, 'SALIDA A TEMPLO POR MATERIALES', 4, 1, 9, '2023-12-21 18:34:26', '2023-12-21 18:33:20'),
(9, '21/12/2023 10:22:38', '0', '21/12/2023 10:25:38', '21/12/2023 10:25:45', 10, 1, 16, 'salida por maletas', 1, 1, 10, '2023-12-21 20:25:48', '2023-12-21 20:22:52'),
(10, '21/12/2023 14:30:46', '0', '21/12/2023 14:31:56', '21/12/2023 14:32:02', 10, 2, 16, 'SALIDA POR NIKE', 4, 1, 10, '2023-12-22 00:32:03', '2023-12-22 00:31:11'),
(11, '04/01/2024 08:28:50', '05/01/2024 09:54:00', NULL, '04/01/2024 08:49:54', 1, 1, 16, 'N/A', 1, 1, 10, '2024-01-04 18:49:55', '2024-01-04 18:29:09'),
(12, '04/01/2024 08:51:41', '05/01/2024 09:56:00', NULL, '04/01/2024 08:57:57', 10, 1, 16, 'N/A', 1, 1, 10, '2024-01-04 18:58:00', '2024-01-04 18:51:54'),
(13, '04/01/2024 08:58:36', '0', '04/01/2024 09:00:11', '04/01/2024 09:00:17', 10, 1, 16, 'N/A', 1, 1, 10, '2024-01-04 19:00:20', '2024-01-04 18:58:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `priorities`
--

CREATE TABLE `priorities` (
  `id` int(11) NOT NULL,
  `priority` varchar(45) NOT NULL,
  `hour` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `priorities`
--

INSERT INTO `priorities` (`id`, `priority`, `hour`, `updated_at`, `created_at`) VALUES
(1, 'BAJA', 6, NULL, NULL),
(2, 'MEDIA', 5, NULL, NULL),
(3, 'ALTA', 4, NULL, NULL),
(4, 'SUPERIOR', 2, NULL, NULL),
(5, 'URGENTE', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceedings`
--

CREATE TABLE `proceedings` (
  `id` int(11) NOT NULL,
  `proceeding` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proceedings`
--

INSERT INTO `proceedings` (`id`, `proceeding`, `updated_at`, `created_at`) VALUES
(1, 'SALIDA', NULL, NULL),
(2, 'ENTREGA', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `serie` varchar(45) NOT NULL,
  `accessories` varchar(100) NOT NULL,
  `id_type_component` int(11) NOT NULL,
  `id_state_certificate` int(11) NOT NULL,
  `id_origin_certificate` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `brand`, `serie`, `accessories`, `id_type_component`, `id_state_certificate`, `id_origin_certificate`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'Celular pequeño', 'ALCATEL', 'REF0001', 'N/A', 1, 1, 2, 2, '2024-01-03 03:18:27', '2023-12-29 00:36:16'),
(2, 'Celular pequeño', 'ALCATEL', 'REF0002', 'N/A', 1, 1, 2, 2, '2024-01-03 03:20:03', '2023-12-29 00:38:04'),
(3, 'CHANCLA', 'CHANQUITA', 'REFWAg5', 'N/A ROJA', 2, 2, 2, 2, '2024-01-04 00:46:34', '2024-01-04 00:46:14'),
(4, 'Torre', 'N/a', 'REFb6O7', 'n/a', 1, 1, 1, 1, '2024-01-04 18:15:10', '2024-01-04 18:15:10'),
(5, 'PC', 'ANDERSON', 'REF4hv9', 'N/A', 1, 2, 2, 1, '2024-01-05 00:45:37', '2024-01-05 00:45:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reasons`
--

CREATE TABLE `reasons` (
  `id` int(11) NOT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reasons`
--

INSERT INTO `reasons` (`id`, `reason`, `updated_at`, `created_at`) VALUES
(1, 'PERSONAL', NULL, NULL),
(2, 'MEDICO', NULL, NULL),
(3, 'CALAMIDAD', NULL, NULL),
(4, 'TRABAJO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `replenish_times`
--

CREATE TABLE `replenish_times` (
  `id` int(11) NOT NULL,
  `replenish_time` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `replenish_times`
--

INSERT INTO `replenish_times` (`id`, `replenish_time`, `updated_at`, `created_at`) VALUES
(1, 'SI', NULL, NULL),
(2, 'NO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_report_detail` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reports`
--

INSERT INTO `reports` (`id`, `description`, `id_user`, `id_report_detail`, `date`, `updated_at`, `created_at`) VALUES
(1, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/12/2023 16:04:52', '2023-12-14 21:04:52', '2023-12-14 21:04:52'),
(2, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/12/2023 11:36:01', '2023-12-15 16:36:01', '2023-12-15 16:36:01'),
(3, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '15/12/2023 13:32:05', '2023-12-15 18:32:05', '2023-12-15 18:32:05'),
(4, 'El usuario soporte@eltemplodelamoda.com.co ha cambiado el estado del usuario sistemasaux9@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 2, 3, '15/12/2023 13:32:11', '2023-12-15 18:32:11', '2023-12-15 18:32:11'),
(5, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '15/12/2023 13:32:40', '2023-12-15 18:32:40', '2023-12-15 18:32:40'),
(6, 'El usuario sistemasaux9@eltemplodelamoda.com.co creo un ticket llamado ACTIVACION DE MAC', 16, 4, '15/12/2023 13:33:53', '2023-12-15 18:33:53', '2023-12-15 18:33:53'),
(7, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/12/2023 13:35:13', '2023-12-15 18:35:13', '2023-12-15 18:35:13'),
(8, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '15/12/2023 13:36:26', '2023-12-15 18:36:26', '2023-12-15 18:36:26'),
(9, 'El usuario sistemasaux9@eltemplodelamoda.com.co creo un ticket llamado NO ME ABRE EL POS', 16, 4, '15/12/2023 13:37:22', '2023-12-15 18:37:22', '2023-12-15 18:37:22'),
(10, 'El usuario Kelly Gomez con correo analistadesistemas@eltemplodelamoda.com.co ha ingresado al sistema', 11, 8, '15/12/2023 13:49:59', '2023-12-15 18:49:59', '2023-12-15 18:49:59'),
(11, 'El usuario analistadesistemas@eltemplodelamoda.com.co inicio la ejecución del ticket con id 23', 11, 7, '15/12/2023 13:50:36', '2023-12-15 18:50:36', '2023-12-15 18:50:36'),
(12, 'El usuario analistadesistemas@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 23', 11, 7, '15/12/2023 13:50:53', '2023-12-15 18:50:53', '2023-12-15 18:50:53'),
(13, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '15/12/2023 13:51:13', '2023-12-15 18:51:13', '2023-12-15 18:51:13'),
(14, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/12/2023 13:58:00', '2023-12-15 18:58:00', '2023-12-15 18:58:00'),
(15, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '15/12/2023 13:58:23', '2023-12-15 18:58:23', '2023-12-15 18:58:23'),
(16, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '15/12/2023 14:06:42', '2023-12-15 19:06:42', '2023-12-15 19:06:42'),
(17, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/12/2023 14:13:22', '2023-12-15 19:13:22', '2023-12-15 19:13:22'),
(18, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 08:51:01', '2023-12-19 13:51:01', '2023-12-19 13:51:01'),
(19, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '19/12/2023 09:31:18', '2023-12-19 14:31:18', '2023-12-19 14:31:18'),
(20, 'El usuario soporte@eltemplodelamoda.com.co creo un ticket llamado ACTIVACION DE MAC', 2, 4, '19/12/2023 09:58:31', '2023-12-19 14:58:31', '2023-12-19 14:58:31'),
(21, 'El usuario soporte@eltemplodelamoda.com.co ha eliminado el ticket con id 24', 2, 6, '19/12/2023 09:58:38', '2023-12-19 14:58:38', '2023-12-19 14:58:38'),
(22, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 09:59:34', '2023-12-19 14:59:34', '2023-12-19 14:59:34'),
(23, 'Se ha agregado un comentario para el ticket con ID 20', 2, 7, '19/12/2023 09:59:47', '2023-12-19 14:59:47', '2023-12-19 14:59:47'),
(24, 'Se ha editado el ticket con ID 17', 1, 7, '19/12/2023 10:01:32', '2023-12-19 15:01:32', '2023-12-19 15:01:32'),
(25, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '19/12/2023 10:02:04', '2023-12-19 15:02:04', '2023-12-19 15:02:04'),
(26, 'Se ha agregado un comentario para el ticket con ID 17', 10, 7, '19/12/2023 10:02:14', '2023-12-19 15:02:14', '2023-12-19 15:02:14'),
(27, 'Se ha agregado una calificacion de 4 estrellas para el ticket con ID 17', 2, 7, '19/12/2023 10:02:52', '2023-12-19 15:02:52', '2023-12-19 15:02:52'),
(28, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 10:04:13', '2023-12-19 15:04:13', '2023-12-19 15:04:13'),
(29, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '19/12/2023 10:05:51', '2023-12-19 15:05:51', '2023-12-19 15:05:51'),
(30, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '19/12/2023 10:18:22', '2023-12-19 15:18:22', '2023-12-19 15:18:22'),
(31, 'Se ha creado un nuevo repositorio con llamado DOCUMENTOS DE KAREN', 2, 12, '19/12/2023 10:23:18', '2023-12-19 15:23:18', '2023-12-19 15:23:18'),
(32, 'Se ha eliminado un directorio llamado DOCUMENTOS DE KAREN con ID 5', 2, 13, '19/12/2023 10:24:32', '2023-12-19 15:24:32', '2023-12-19 15:24:32'),
(33, 'Se ha eliminado un directorio llamado DOCUMENTOS DE KAREN con ID 4', 2, 13, '19/12/2023 10:24:35', '2023-12-19 15:24:35', '2023-12-19 15:24:35'),
(34, 'Se ha creado un nuevo repositorio con llamado DOCUMENTOS', 2, 12, '19/12/2023 10:29:30', '2023-12-19 15:29:30', '2023-12-19 15:29:30'),
(35, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 10:37:38', '2023-12-19 15:37:38', '2023-12-19 15:37:38'),
(36, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '19/12/2023 10:38:01', '2023-12-19 15:38:01', '2023-12-19 15:38:01'),
(37, 'Se ha agregado una calificacion de 2 estrellas para el ticket con ID 21', 2, 7, '19/12/2023 11:09:31', '2023-12-19 16:09:31', '2023-12-19 16:09:31'),
(38, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 11:36:50', '2023-12-19 16:36:50', '2023-12-19 16:36:50'),
(39, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 14:07:29', '2023-12-19 19:07:29', '2023-12-19 19:07:29'),
(40, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 14:11:17', '2023-12-19 19:11:17', '2023-12-19 19:11:17'),
(41, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 14:13:15', '2023-12-19 19:13:15', '2023-12-19 19:13:15'),
(42, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 14:19:55', '2023-12-19 19:19:55', '2023-12-19 19:19:55'),
(43, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/12/2023 16:08:17', '2023-12-19 21:08:17', '2023-12-19 21:08:17'),
(44, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '20/12/2023 08:39:11', '2023-12-20 13:39:11', '2023-12-20 13:39:11'),
(45, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '20/12/2023 08:46:37', '2023-12-20 13:46:37', '2023-12-20 13:46:37'),
(46, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '20/12/2023 11:34:55', '2023-12-20 16:34:55', '2023-12-20 16:34:55'),
(47, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '20/12/2023 11:38:39', '2023-12-20 16:38:39', '2023-12-20 16:38:39'),
(48, 'Ha generado un permiso con fecha: 20/12/2023 11:38:44 ', 10, 9, '20/12/2023 11:38:53', '2023-12-20 16:38:53', '2023-12-20 16:38:53'),
(49, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '20/12/2023 14:12:52', '2023-12-20 19:12:52', '2023-12-20 19:12:52'),
(50, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '20/12/2023 14:26:45', '2023-12-20 19:26:45', '2023-12-20 19:26:45'),
(51, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '20/12/2023 14:29:53', '2023-12-20 19:29:53', '2023-12-20 19:29:53'),
(52, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '20/12/2023 14:30:11', '2023-12-20 19:30:11', '2023-12-20 19:30:11'),
(53, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '20/12/2023 14:58:27', '2023-12-20 19:58:27', '2023-12-20 19:58:27'),
(54, 'Ha generado un permiso con fecha: 20/12/2023 14:58:34 ', 10, 9, '20/12/2023 14:58:58', '2023-12-20 19:58:58', '2023-12-20 19:58:58'),
(55, 'Ha generado un permiso con fecha: 20/12/2023 15:10:48 ', 1, 9, '20/12/2023 15:11:14', '2023-12-20 20:11:14', '2023-12-20 20:11:14'),
(56, 'Ha generado un permiso con fecha: 20/12/2023 15:59:15 ', 10, 9, '20/12/2023 15:59:31', '2023-12-20 20:59:31', '2023-12-20 20:59:31'),
(57, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '20/12/2023 17:21:18', '2023-12-20 22:21:18', '2023-12-20 22:21:18'),
(58, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '21/12/2023 08:21:06', '2023-12-21 13:21:06', '2023-12-21 13:21:06'),
(59, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '21/12/2023 08:21:45', '2023-12-21 13:21:45', '2023-12-21 13:21:45'),
(60, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '21/12/2023 08:30:20', '2023-12-21 13:30:20', '2023-12-21 13:30:20'),
(61, 'Ha generado un permiso con fecha: 21/12/2023 08:32:24 ', 10, 9, '21/12/2023 08:33:22', '2023-12-21 13:33:22', '2023-12-21 13:33:22'),
(62, 'El usuario sistemasaux9@eltemplodelamoda.com.co creo un ticket llamado ACTIVACION DE MAC', 16, 4, '21/12/2023 08:52:54', '2023-12-21 13:52:54', '2023-12-21 13:52:54'),
(63, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 25', 10, 7, '21/12/2023 08:53:19', '2023-12-21 13:53:19', '2023-12-21 13:53:19'),
(64, 'El ticket con ID 25 para el usuario sistemasaux8@eltemplodelamoda.com.co ha vencido', 10, 7, '21/12/2023 08:53:19', '2023-12-21 13:53:19', '2023-12-21 13:53:19'),
(65, 'El usuario jccq12@gmail.com ha cambiado el estado del usuario analistadesistemas@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 1, 3, '21/12/2023 08:54:44', '2023-12-21 13:54:44', '2023-12-21 13:54:44'),
(66, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '21/12/2023 09:35:22', '2023-12-21 14:35:22', '2023-12-21 14:35:22'),
(67, 'Ha generado un permiso con fecha: 21/12/2023 10:22:38 ', 10, 9, '21/12/2023 10:22:54', '2023-12-21 15:22:54', '2023-12-21 15:22:54'),
(68, 'El jefe Jhan Carlos Cordoba ha aprovado el permiso del colaborador Anderson Cordoba ', 1, 9, '21/12/2023 10:25:24', '2023-12-21 15:25:24', '2023-12-21 15:25:24'),
(69, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado salida al colaborador Anderson Cordoba ', 16, 9, '21/12/2023 10:25:43', '2023-12-21 15:25:43', '2023-12-21 15:25:43'),
(70, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado entrada al colaborador Anderson Cordoba ', 16, 9, '21/12/2023 10:25:48', '2023-12-21 15:25:48', '2023-12-21 15:25:48'),
(71, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '21/12/2023 10:26:36', '2023-12-21 15:26:36', '2023-12-21 15:26:36'),
(72, 'Se han modificado los datos del usuario soporte@eltemplodelamoda.com.co', 2, 2, '21/12/2023 10:29:01', '2023-12-21 15:29:01', '2023-12-21 15:29:01'),
(73, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '21/12/2023 11:41:06', '2023-12-21 16:41:06', '2023-12-21 16:41:06'),
(74, 'El jefe Jhan Carlos Cordoba ha aprovado el permiso del colaborador Anderson Cordoba ', 1, 9, '21/12/2023 11:41:23', '2023-12-21 16:41:23', '2023-12-21 16:41:23'),
(75, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado salida al colaborador Anderson Cordoba ', 16, 9, '21/12/2023 11:41:35', '2023-12-21 16:41:35', '2023-12-21 16:41:35'),
(76, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado entrada al colaborador Anderson Cordoba ', 16, 9, '21/12/2023 11:41:39', '2023-12-21 16:41:39', '2023-12-21 16:41:39'),
(77, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '21/12/2023 13:32:06', '2023-12-21 18:32:06', '2023-12-21 18:32:06'),
(78, 'Se ha creado un nuevo archivo con llamado REPORTE ACTUALIZADO DE TIENDAS 2023 en el directorio con ID 6', 2, 14, '21/12/2023 14:13:21', '2023-12-21 19:13:21', '2023-12-21 19:13:21'),
(79, 'Ha generado un permiso con fecha: 21/12/2023 14:30:46 ', 10, 9, '21/12/2023 14:31:13', '2023-12-21 19:31:13', '2023-12-21 19:31:13'),
(80, 'El jefe Administrador GRUPO TDM ha aprovado el permiso del colaborador Anderson Cordoba ', 2, 9, '21/12/2023 14:31:43', '2023-12-21 19:31:43', '2023-12-21 19:31:43'),
(81, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado salida al colaborador Anderson Cordoba ', 16, 9, '21/12/2023 14:31:59', '2023-12-21 19:31:59', '2023-12-21 19:31:59'),
(82, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado entrada al colaborador Anderson Cordoba ', 16, 9, '21/12/2023 14:32:03', '2023-12-21 19:32:03', '2023-12-21 19:32:03'),
(83, 'Se ha agregado un comentario para el ticket con ID 21', 1, 7, '21/12/2023 14:47:41', '2023-12-21 19:47:41', '2023-12-21 19:47:41'),
(84, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '21/12/2023 15:18:59', '2023-12-21 20:18:59', '2023-12-21 20:18:59'),
(85, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '21/12/2023 15:19:21', '2023-12-21 20:19:21', '2023-12-21 20:19:21'),
(86, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 25', 10, 7, '21/12/2023 15:19:39', '2023-12-21 20:19:39', '2023-12-21 20:19:39'),
(87, 'Se ha agregado un comentario para el ticket con ID 25', 16, 7, '21/12/2023 15:20:14', '2023-12-21 20:20:14', '2023-12-21 20:20:14'),
(88, 'Se ha agregado un comentario para el ticket con ID 25', 10, 7, '21/12/2023 15:20:38', '2023-12-21 20:20:38', '2023-12-21 20:20:38'),
(89, 'Se ha agregado un comentario para el ticket con ID 25', 10, 7, '21/12/2023 15:22:04', '2023-12-21 20:22:04', '2023-12-21 20:22:04'),
(90, 'Se ha eliminado el comentario con ID 13 para el ticket con ID 21', 2, 7, '21/12/2023 15:23:53', '2023-12-21 20:23:53', '2023-12-21 20:23:53'),
(91, 'El usuario sistemasaux8@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 25', 10, 7, '21/12/2023 15:30:18', '2023-12-21 20:30:18', '2023-12-21 20:30:18'),
(92, 'Se ha agregado una calificacion de 5 estrellas para el ticket con ID 25', 16, 7, '21/12/2023 15:31:36', '2023-12-21 20:31:36', '2023-12-21 20:31:36'),
(93, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '22/12/2023 08:12:36', '2023-12-22 13:12:36', '2023-12-22 13:12:36'),
(94, 'Se ha agregado un comentario para el ticket con ID 21', 2, 7, '22/12/2023 08:46:19', '2023-12-22 13:46:19', '2023-12-22 13:46:19'),
(95, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '22/12/2023 08:48:48', '2023-12-22 13:48:48', '2023-12-22 13:48:48'),
(96, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '22/12/2023 09:47:41', '2023-12-22 14:47:41', '2023-12-22 14:47:41'),
(97, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:47:57', '2023-12-22 14:47:57', '2023-12-22 14:47:57'),
(98, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:48:15', '2023-12-22 14:48:15', '2023-12-22 14:48:15'),
(99, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:48:23', '2023-12-22 14:48:23', '2023-12-22 14:48:23'),
(100, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:48:28', '2023-12-22 14:48:28', '2023-12-22 14:48:28'),
(101, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:48:35', '2023-12-22 14:48:35', '2023-12-22 14:48:35'),
(102, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:48:57', '2023-12-22 14:48:57', '2023-12-22 14:48:57'),
(103, 'Se han modificado los datos del usuario sistemasaux10@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:49:08', '2023-12-22 14:49:08', '2023-12-22 14:49:08'),
(104, 'Se han modificado los datos del usuario csoporte@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:49:18', '2023-12-22 14:49:18', '2023-12-22 14:49:18'),
(105, 'Se han modificado los datos del usuario sistemasaux4@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:49:28', '2023-12-22 14:49:28', '2023-12-22 14:49:28'),
(106, 'Se han modificado los datos del usuario sistemasaux10@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:49:43', '2023-12-22 14:49:43', '2023-12-22 14:49:43'),
(107, 'Se han modificado los datos del usuario sistemasaux10@eltemplodelamoda.com.co', 1, 2, '22/12/2023 09:49:46', '2023-12-22 14:49:46', '2023-12-22 14:49:46'),
(108, 'Se han modificado los datos del usuario jccq12@gmail.com', 1, 2, '22/12/2023 11:36:26', '2023-12-22 16:36:26', '2023-12-22 16:36:26'),
(109, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '22/12/2023 11:47:43', '2023-12-22 16:47:43', '2023-12-22 16:47:43'),
(110, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '23/12/2023 08:15:14', '2023-12-23 13:15:14', '2023-12-23 13:15:14'),
(111, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '23/12/2023 08:22:59', '2023-12-23 13:22:59', '2023-12-23 13:22:59'),
(112, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '26/12/2023 08:28:03', '2023-12-26 13:28:03', '2023-12-26 13:28:03'),
(113, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '26/12/2023 13:20:34', '2023-12-26 18:20:34', '2023-12-26 18:20:34'),
(114, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 10', 1, 6, '26/12/2023 17:23:08', '2023-12-26 22:23:08', '2023-12-26 22:23:08'),
(115, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '27/12/2023 09:34:51', '2023-12-27 14:34:51', '2023-12-27 14:34:51'),
(116, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '27/12/2023 13:02:42', '2023-12-27 18:02:42', '2023-12-27 18:02:42'),
(117, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '27/12/2023 14:00:48', '2023-12-27 19:00:48', '2023-12-27 19:00:48'),
(118, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '27/12/2023 15:51:06', '2023-12-27 20:51:06', '2023-12-27 20:51:06'),
(119, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '27/12/2023 15:53:48', '2023-12-27 20:53:48', '2023-12-27 20:53:48'),
(120, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '27/12/2023 15:55:17', '2023-12-27 20:55:17', '2023-12-27 20:55:17'),
(121, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha eliminado el ticket con id 8', 10, 6, '27/12/2023 17:02:29', '2023-12-27 22:02:29', '2023-12-27 22:02:29'),
(122, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '28/12/2023 08:44:29', '2023-12-28 13:44:29', '2023-12-28 13:44:29'),
(123, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '28/12/2023 11:19:15', '2023-12-28 16:19:15', '2023-12-28 16:19:15'),
(124, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '28/12/2023 14:45:52', '2023-12-28 19:45:52', '2023-12-28 19:45:52'),
(125, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '28/12/2023 14:48:21', '2023-12-28 19:48:21', '2023-12-28 19:48:21'),
(126, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '02/01/2024 17:18:16', '2024-01-02 22:18:16', '2024-01-02 22:18:16'),
(128, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REF0001', 1, 18, '02/01/2024 17:19:59', '2024-01-02 22:19:59', '2024-01-02 22:19:59'),
(129, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REF0002', 1, 18, '02/01/2024 17:20:03', '2024-01-02 22:20:03', '2024-01-02 22:20:03'),
(130, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '03/01/2024 08:23:54', '2024-01-03 13:23:54', '2024-01-03 13:23:54'),
(131, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '03/01/2024 14:08:54', '2024-01-03 19:08:54', '2024-01-03 19:08:54'),
(132, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '03/01/2024 14:09:26', '2024-01-03 19:09:26', '2024-01-03 19:09:26'),
(133, 'Se ha creado el siguiente usuario sistemasaux6@eltemplodelamoda.com.co', 1, 1, '03/01/2024 14:10:37', '2024-01-03 19:10:37', '2024-01-03 19:10:37'),
(134, 'El usuario Jerson Henao con correo sistemasaux4@eltemplodelamoda.com.co ha ingresado al sistema', 12, 8, '03/01/2024 14:14:21', '2024-01-03 19:14:21', '2024-01-03 19:14:21'),
(135, 'Se ha creado el siguiente usuario sistemasaux2@eltemplodelamoda.com.co', 1, 1, '03/01/2024 14:16:39', '2024-01-03 19:16:39', '2024-01-03 19:16:39'),
(136, 'El usuario sistemasaux4@eltemplodelamoda.com.co creo un ticket llamado Cambio de equipo gestion humana', 12, 4, '03/01/2024 14:16:48', '2024-01-03 19:16:48', '2024-01-03 19:16:48'),
(137, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 26', 10, 7, '03/01/2024 14:17:28', '2024-01-03 19:17:28', '2024-01-03 19:17:28'),
(138, 'El ticket con ID 26 para el usuario sistemasaux8@eltemplodelamoda.com.co ha vencido', 10, 7, '03/01/2024 14:17:28', '2024-01-03 19:17:28', '2024-01-03 19:17:28'),
(139, 'Se ha agregado un comentario para el ticket con ID 26', 10, 7, '03/01/2024 14:17:36', '2024-01-03 19:17:36', '2024-01-03 19:17:36'),
(140, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 26', 10, 7, '03/01/2024 14:17:38', '2024-01-03 19:17:38', '2024-01-03 19:17:38'),
(141, 'Se ha agregado un comentario para el ticket con ID 26', 10, 7, '03/01/2024 14:18:05', '2024-01-03 19:18:05', '2024-01-03 19:18:05'),
(142, 'Se ha agregado un comentario para el ticket con ID 26', 12, 7, '03/01/2024 14:18:11', '2024-01-03 19:18:11', '2024-01-03 19:18:11'),
(143, 'Se ha agregado un comentario para el ticket con ID 26', 10, 7, '03/01/2024 14:18:27', '2024-01-03 19:18:27', '2024-01-03 19:18:27'),
(144, 'El usuario sistemasaux4@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 26', 12, 7, '03/01/2024 14:19:59', '2024-01-03 19:19:59', '2024-01-03 19:19:59'),
(145, 'El usuario Karen Arenas con correo sistemasaux6@eltemplodelamoda.com.co ha ingresado al sistema', 17, 8, '03/01/2024 14:27:57', '2024-01-03 19:27:57', '2024-01-03 19:27:57'),
(146, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '03/01/2024 14:28:13', '2024-01-03 19:28:13', '2024-01-03 19:28:13'),
(147, 'El usuario Karen Arenas con correo sistemasaux6@eltemplodelamoda.com.co ha ingresado al sistema', 17, 8, '03/01/2024 14:28:29', '2024-01-03 19:28:29', '2024-01-03 19:28:29'),
(148, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '03/01/2024 14:29:33', '2024-01-03 19:29:33', '2024-01-03 19:29:33'),
(149, 'El usuario sistemasaux2@eltemplodelamoda.com.co creo un ticket llamado Centralizar Caja de Templo 8 Por Daño', 18, 4, '03/01/2024 14:33:46', '2024-01-03 19:33:46', '2024-01-03 19:33:46'),
(150, 'El usuario sistemasaux2@eltemplodelamoda.com.co creo un ticket llamado Centralizar Caja de Templo 8 Por Daño', 18, 4, '03/01/2024 14:33:51', '2024-01-03 19:33:51', '2024-01-03 19:33:51'),
(151, 'Se ha creado un nuevo repositorio con llamado BASES DE DATOS', 1, 12, '03/01/2024 14:42:38', '2024-01-03 19:42:38', '2024-01-03 19:42:38'),
(152, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REFWAg5', 1, 18, '03/01/2024 14:46:14', '2024-01-03 19:46:14', '2024-01-03 19:46:14'),
(153, 'El usuario Anderson Cordoba ha eliminado el producto con la siguiente serial REFWAg5', 10, 18, '03/01/2024 14:46:34', '2024-01-03 19:46:34', '2024-01-03 19:46:34'),
(154, 'El usuario sistemasaux4@eltemplodelamoda.com.co creo un ticket llamado Centralizacion TPV', 12, 4, '03/01/2024 14:53:07', '2024-01-03 19:53:07', '2024-01-03 19:53:07'),
(155, 'El usuario sistemasaux2@eltemplodelamoda.com.co ha visto el ticket con id 27', 18, 7, '03/01/2024 15:38:04', '2024-01-03 20:38:04', '2024-01-03 20:38:04'),
(156, 'El ticket con ID 27 para el usuario sistemasaux2@eltemplodelamoda.com.co ha vencido', 18, 7, '03/01/2024 15:38:04', '2024-01-03 20:38:04', '2024-01-03 20:38:04'),
(157, 'El usuario sistemasaux2@eltemplodelamoda.com.co inicio la ejecución del ticket con id 27', 18, 7, '03/01/2024 15:38:09', '2024-01-03 20:38:09', '2024-01-03 20:38:09'),
(158, 'El usuario sistemasaux4@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 27', 12, 7, '03/01/2024 15:40:58', '2024-01-03 20:40:58', '2024-01-03 20:40:58'),
(159, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '04/01/2024 08:12:21', '2024-01-04 13:12:21', '2024-01-04 13:12:21'),
(160, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REFb6O7', 1, 18, '04/01/2024 08:15:10', '2024-01-04 13:15:10', '2024-01-04 13:15:10'),
(161, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección Calle 28#86-29', 1, 17, '04/01/2024 08:15:46', '2024-01-04 13:15:46', '2024-01-04 13:15:46'),
(162, 'Ha generado un permiso por/para N/A', 1, 9, '04/01/2024 08:29:11', '2024-01-04 13:29:11', '2024-01-04 13:29:11'),
(163, 'El jefe Jhan Carlos Cordoba ha aprovado el permiso del colaborador Jhan Carlos Cordoba ', 1, 9, '04/01/2024 08:39:01', '2024-01-04 13:39:01', '2024-01-04 13:39:01'),
(164, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '04/01/2024 08:39:27', '2024-01-04 13:39:27', '2024-01-04 13:39:27'),
(165, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado entrada al colaborador Jhan Carlos Cordoba ', 16, 9, '04/01/2024 08:49:55', '2024-01-04 13:49:55', '2024-01-04 13:49:55'),
(166, 'El usuario Karen Arenas con correo sistemasaux6@eltemplodelamoda.com.co ha ingresado al sistema', 17, 8, '04/01/2024 08:50:26', '2024-01-04 13:50:26', '2024-01-04 13:50:26'),
(167, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '04/01/2024 08:50:39', '2024-01-04 13:50:39', '2024-01-04 13:50:39'),
(168, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '04/01/2024 08:51:20', '2024-01-04 13:51:20', '2024-01-04 13:51:20'),
(169, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '04/01/2024 08:51:35', '2024-01-04 13:51:35', '2024-01-04 13:51:35'),
(170, 'Ha generado un permiso por/para N/A', 10, 9, '04/01/2024 08:51:56', '2024-01-04 13:51:56', '2024-01-04 13:51:56'),
(171, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '04/01/2024 08:56:46', '2024-01-04 13:56:46', '2024-01-04 13:56:46'),
(172, 'El jefe Jhan Carlos Cordoba ha aprovado el permiso del colaborador Anderson Cordoba ', 1, 9, '04/01/2024 08:56:53', '2024-01-04 13:56:53', '2024-01-04 13:56:53'),
(173, 'El usuario Karen Arenas con correo sistemasaux6@eltemplodelamoda.com.co ha ingresado al sistema', 17, 8, '04/01/2024 08:57:09', '2024-01-04 13:57:09', '2024-01-04 13:57:09'),
(174, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '04/01/2024 08:57:38', '2024-01-04 13:57:38', '2024-01-04 13:57:38'),
(175, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '04/01/2024 08:57:52', '2024-01-04 13:57:52', '2024-01-04 13:57:52'),
(176, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado entrada al colaborador Anderson Cordoba ', 16, 9, '04/01/2024 08:58:00', '2024-01-04 13:58:00', '2024-01-04 13:58:00'),
(177, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '04/01/2024 08:58:15', '2024-01-04 13:58:15', '2024-01-04 13:58:15'),
(178, 'Ha generado un permiso por/para N/A', 10, 9, '04/01/2024 08:58:49', '2024-01-04 13:58:49', '2024-01-04 13:58:49'),
(179, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '04/01/2024 08:59:01', '2024-01-04 13:59:01', '2024-01-04 13:59:01'),
(180, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '04/01/2024 08:59:11', '2024-01-04 13:59:11', '2024-01-04 13:59:11'),
(181, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '04/01/2024 08:59:25', '2024-01-04 13:59:25', '2024-01-04 13:59:25'),
(182, 'El jefe Jhan Carlos Cordoba ha aprovado el permiso del colaborador Anderson Cordoba ', 1, 9, '04/01/2024 08:59:32', '2024-01-04 13:59:32', '2024-01-04 13:59:32'),
(183, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '04/01/2024 08:59:45', '2024-01-04 13:59:45', '2024-01-04 13:59:45'),
(184, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '04/01/2024 08:59:55', '2024-01-04 13:59:55', '2024-01-04 13:59:55'),
(185, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '04/01/2024 09:00:07', '2024-01-04 14:00:07', '2024-01-04 14:00:07'),
(186, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado salida al colaborador Anderson Cordoba ', 16, 9, '04/01/2024 09:00:15', '2024-01-04 14:00:15', '2024-01-04 14:00:15'),
(187, 'El recepcionista Jhan Carlos  Cordoba Quiñonez ha dado entrada al colaborador Anderson Cordoba ', 16, 9, '04/01/2024 09:00:20', '2024-01-04 14:00:20', '2024-01-04 14:00:20'),
(188, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '04/01/2024 13:44:29', '2024-01-04 18:44:29', '2024-01-04 18:44:29'),
(189, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '04/01/2024 13:51:46', '2024-01-04 18:51:46', '2024-01-04 18:51:46'),
(190, 'Se han modificado los datos del usuario jccq12@gmail.com', 1, 2, '04/01/2024 13:56:27', '2024-01-04 18:56:27', '2024-01-04 18:56:27'),
(191, 'Se han modificado los datos del usuario jccq12@gmail.com', 1, 2, '04/01/2024 13:56:34', '2024-01-04 18:56:34', '2024-01-04 18:56:34'),
(192, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '04/01/2024 14:22:49', '2024-01-04 19:22:49', '2024-01-04 19:22:49'),
(193, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REFb6O7 con ID 4', 1, 18, '04/01/2024 14:43:56', '2024-01-04 19:43:56', '2024-01-04 19:43:56'),
(194, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REF4hv9', 1, 18, '04/01/2024 14:45:37', '2024-01-04 19:45:37', '2024-01-04 19:45:37'),
(195, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '04/01/2024 15:00:08', '2024-01-04 20:00:08', '2024-01-04 20:00:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reports_certificate`
--

CREATE TABLE `reports_certificate` (
  `id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_certificate` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `report_details`
--

CREATE TABLE `report_details` (
  `id` int(11) NOT NULL,
  `report` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `report_details`
--

INSERT INTO `report_details` (`id`, `report`, `updated_at`, `created_at`) VALUES
(1, 'CREO UN USUARIO', NULL, NULL),
(2, 'EDITO UN USUARIO', NULL, NULL),
(3, 'ACTIVO/ELIMINO UN USUARIO', NULL, NULL),
(4, 'CREO UN TICKET', NULL, NULL),
(5, 'EDITO UN TICKET', NULL, NULL),
(6, 'ELIMINO UN TICKET', NULL, NULL),
(7, 'ACCIONÓ UN TICKET', NULL, NULL),
(8, 'INGRESO AL SISTEMA', NULL, NULL),
(9, 'PERMISO', NULL, NULL),
(10, 'GENERO UNA ACTA', NULL, NULL),
(11, 'RE ABRIO UN TICKET', NULL, NULL),
(12, 'CREO UN DIRECTORIO', NULL, NULL),
(13, 'ELIMINO DIRECTORIO', NULL, NULL),
(14, 'CREO UN ARCHIVO', NULL, NULL),
(15, 'ACCIÓN ARCHIVO', NULL, NULL),
(16, 'ELIMINO ARCHIVO', NULL, NULL),
(17, 'ACTAS', NULL, NULL),
(18, 'INVENTARIO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `report_products`
--

CREATE TABLE `report_products` (
  `id` int(11) NOT NULL,
  `report` varchar(500) DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `id_certificate` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `report_products`
--

INSERT INTO `report_products` (`id`, `report`, `id_product`, `id_certificate`, `updated_at`, `created_at`) VALUES
(1, 'El producto se encuentra pendiente asignado al acta  con ID 14  para la direcciòn Calle 28#86-29', 4, 14, '2024-01-04 18:15:49', '2024-01-04 18:15:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rows_certificates`
--

CREATE TABLE `rows_certificates` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_certificate` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rows_certificates`
--

INSERT INTO `rows_certificates` (`id`, `id_product`, `id_certificate`, `updated_at`, `created_at`) VALUES
(1, 4, 14, '2024-01-04 18:15:49', '2024-01-04 18:15:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `shop` varchar(100) NOT NULL,
  `id_company` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `shops`
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
(28, 'PALMIRA UNICENTRO - TEMPLO 35', 1, NULL, NULL),
(29, 'SHOPPING TEX 1', 2, NULL, NULL),
(30, 'SHOPPING TEX 2', 2, NULL, NULL),
(31, 'SHOPPING TEX 3', 2, NULL, NULL),
(32, 'SHOPPING TEX 4', 2, NULL, NULL),
(33, 'SHOPPING TEX 5', 2, NULL, NULL),
(34, 'SHOPPING TEX 6', 2, NULL, NULL),
(35, 'SHOPPING TEX 7', 2, NULL, NULL),
(36, 'SHOPPING TEX 8', 2, NULL, NULL),
(37, 'SHOPPING TEX 9', 2, NULL, NULL),
(38, 'SHOPPING TEX 10', 2, NULL, NULL),
(39, 'SHOPPING TEX 11', 2, NULL, NULL),
(40, 'SHOPPING TEX 12', 2, NULL, NULL),
(41, 'SHOPPING TEX 13', 2, NULL, NULL),
(42, 'SHOPPING TEX 14', 2, NULL, NULL),
(43, 'SHOPPING TEX 15', 2, NULL, NULL),
(44, 'SHOPPING TEX 16', 2, NULL, NULL),
(45, 'SHOPPING TEX 17', 2, NULL, NULL),
(46, 'SHOPPING TEX 18', 2, NULL, NULL),
(47, 'SHOPPING TEX 19', 2, NULL, NULL),
(48, 'SHOPPING TEX 20', 2, NULL, NULL),
(49, 'SHOPPING TEX 21', 2, NULL, NULL),
(50, 'CEDI', 5, NULL, NULL),
(51, 'OFICINA ADMINISTRATIVA', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `state` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `states`
--

INSERT INTO `states` (`id`, `state`, `updated_at`, `created_at`) VALUES
(1, 'ACTIVO', NULL, NULL),
(2, 'INACTIVO', NULL, NULL),
(3, 'PENDIENTE', NULL, NULL),
(4, 'VISTO', NULL, NULL),
(5, 'EN EJECUCIÒN', NULL, NULL),
(6, 'VENCIDO', NULL, NULL),
(7, 'TERMINADO', NULL, NULL),
(8, 'PENDIENTE', NULL, NULL),
(9, 'RECHAZADO', NULL, NULL),
(10, 'APROBADO', NULL, NULL),
(11, 'DESPACHADO', NULL, NULL),
(12, 'ENTREGADO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states_certificates`
--

CREATE TABLE `states_certificates` (
  `id` int(11) NOT NULL,
  `state_certificate` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `states_certificates`
--

INSERT INTO `states_certificates` (`id`, `state_certificate`, `updated_at`, `created_at`) VALUES
(1, 'BUENO', NULL, NULL),
(2, 'MALO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `themes_users`
--

CREATE TABLE `themes_users` (
  `id` int(11) NOT NULL,
  `theme_user` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `themes_users`
--

INSERT INTO `themes_users` (`id`, `theme_user`, `updated_at`, `created_at`) VALUES
(1, 'CAJAS', NULL, NULL),
(2, 'BASE DE DATOS', NULL, NULL),
(3, 'SERVIDOR', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `name`, `description`, `file`, `date_start`, `date_finally`, `id_priority`, `id_user_sender`, `id_user_destination`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'ACTIVACION DE MAC', 'erfewrewr', '2023-12-11_21-22-56.jfif', '11/12/2023 16:22:18', '11/15/2023 20:22:18', 3, 1, 12, 2, '2023-12-13 00:20:19', '2023-12-12 02:22:59'),
(2, 'ACTIVACION DE MAC', 'anydesk 444444585', NULL, '06/12/2023 16:14:31', '06/12/2023 18:14:31', 4, 1, 12, 6, '2023-12-08 01:41:34', '2023-12-07 07:14:46'),
(3, 'HABILITACION MAC', 'SDDFSDFDSFDSFDS', NULL, '06/12/2023 16:18:50', '06/12/2023 17:18:50', 5, 1, 12, 6, '2023-12-08 02:39:05', '2023-12-07 07:19:11'),
(4, 'FEWFEWF', 'WRWEREWRWER', NULL, '06/12/2023 16:20:00', '06/12/2023 20:20:00', 3, 1, 12, 6, '2023-12-08 02:44:01', '2023-12-07 07:20:14'),
(5, '32423R423RWER', 'EWREWRWERWEREW', NULL, '06/12/2023 16:20:49', '06/12/2023 18:20:49', 4, 1, 12, 6, '2023-12-08 02:43:32', '2023-12-07 07:21:00'),
(6, 'ACTIVACION DE MAC', 'w24e2424', NULL, '06/12/2023 16:33:04', '07/14/2023 22:33:04', 1, 1, 12, 7, '2023-12-08 01:57:03', '2023-12-07 07:33:16'),
(7, 'ACTIVACION DE MAC', 'fsefesfw', NULL, '06/12/2023 16:58:51', '06/12/2023 18:58:51', 4, 1, 1, 6, '2023-12-13 02:00:36', '2023-12-07 07:59:05'),
(8, 'ACTIVACION DE MAC', 'adsadasdsad', NULL, '06/12/2023 17:31:16', '06/12/2023 23:31:16', 1, 10, 1, 6, '2023-12-28 03:02:32', '2023-12-07 08:31:54'),
(9, 'ACTIVACION DE MAC', '2werewrewre', NULL, '07/12/2023 11:44:35', '07/12/2023 12:44:35', 5, 1, 1, 6, '2023-12-13 01:57:35', '2023-12-08 02:44:48'),
(10, 'EQUIPO LENTO', 'Equipo muy lento', NULL, '07/12/2023 14:24:18', '07/12/2023 15:24:18', 5, 1, 1, 6, '2023-12-27 03:23:11', '2023-12-08 05:24:52'),
(11, 'Revisar actas de entrega', 'Lo mas pronto posible revisar lo siguiente', '2023-12-07_19-28-38.xlsx', '07/12/2023 14:27:56', '07/12/2023 15:27:56', 5, 1, 1, 6, '2023-12-09 23:01:44', '2023-12-08 05:28:40'),
(12, 'ACTIVACION DE MAC', 'Activar mac con el siguiente anydesk porfavorrrr', '2023-12-07_19-36-08.jfif', '07/12/2023 14:35:43', '07/15/2023 15:35:43', 5, 1, 1, 2, '2023-12-13 19:41:05', '2023-12-08 05:36:10'),
(13, 'ACTIVACION DE MAC', 'asdadawd', '2023-12-09_15-51-35.jfif', '09/12/2023 10:51:20', '09/12/2023 11:51:20', 5, 2, 1, 6, '2023-12-13 19:22:39', '2023-12-10 01:51:37'),
(14, 'ACTIVACION DE MAC', 'Necesito esta tarea', '2023-12-09_16-46-22.jfif', '09/12/2023 11:43:36', '09/12/2023 12:43:36', 5, 13, 1, 6, '2023-12-13 19:22:44', '2023-12-10 02:46:24'),
(15, 'SALIDA SPACE', 'Mañan 10 pm', NULL, '11/12/2023 11:44:39', '11/15/2023 15:44:39', 3, 13, 15, 2, '2023-12-13 00:17:28', '2023-12-12 02:44:59'),
(16, 'ACTIVACION DE MAC', 'porfavor activar mac', '2023-12-12_19-19-20.jfif', '12/12/2023 14:18:45', '12/12/2023 15:18:45', 5, 13, 1, 6, '2023-12-13 19:22:46', '2023-12-13 00:19:22'),
(17, 'ACTIVACION DE MAC', 'Descripcion de tarea', '2023-12-12_20-14-38.jfif', '12/12/2023 15:14:19', '12/12/2023 16:14:19', 5, 2, 10, 6, '2023-12-19 15:01:35', '2023-12-13 01:14:41'),
(18, 'otro ticket', 'Descripcion del ticket', '2023-12-12_20-15-11.jfif', '12/12/2023 15:14:47', '12/12/2023 17:14:47', 4, 2, 15, 6, '2023-12-13 19:22:51', '2023-12-13 01:15:14'),
(19, 'ACTIVACION DE MAC', 'arwar', '2023-12-12_20-15-34.xlsx', '12/12/2023 15:15:20', '12/12/2023 16:15:20', 5, 2, 13, 6, '2023-12-13 19:22:54', '2023-12-13 01:15:36'),
(20, 'Regeneracion de base de datos', 'Activaciones', '2023-12-12_20-18-08.xlsx', '12/12/2023 15:17:44', '12/12/2023 19:17:44', 3, 2, 1, 6, '2023-12-13 19:22:56', '2023-12-13 01:18:10'),
(21, 'ACTIVACION DE MAC', '32423423', '2023-12-12_20-32-08.xlsx', '12/12/2023 15:31:53', '12/12/2023 16:31:53', 5, 2, 1, 7, '2023-12-13 01:33:05', '2023-12-13 01:32:11'),
(22, 'ACTIVACION DE MAC', 'Porfavor activar mac en el siguiente equipo', '2023-12-15_18-33-53.jfif', '15/12/2023 13:32:50', '15/12/2023 14:32:50', 5, 16, 10, 6, '2023-12-19 18:51:25', '2023-12-15 18:33:55'),
(23, 'NO ME ABRE EL POS', 'Me pueden ayudar', '2023-12-15_18-37-22.jfif', '15/12/2023 13:36:29', '15/12/2023 15:36:29', 4, 16, 11, 7, '2023-12-15 18:50:53', '2023-12-15 18:37:25'),
(24, 'ACTIVACION DE MAC', 'Anydesk 4324324324', '2023-12-19_14-58-31.jfif', '19/12/2023 09:58:12', '19/12/2023 10:58:12', 5, 2, 15, 6, '2023-12-20 18:39:17', '2023-12-19 14:58:34'),
(25, 'ACTIVACION DE MAC', 'porfavor necesito este equipo listo', '2023-12-21_13-52-54.jfif', '21/12/2023 08:52:18', '21/12/2023 10:52:18', 4, 16, 10, 7, '2023-12-21 20:30:18', '2023-12-21 13:52:56'),
(26, 'Cambio de equipo gestion humana', 'Realizar cambio de equipo para la nueva analista de recursos humanos', NULL, '03/01/2024 14:14:39', '03/01/2024 15:14:39', 5, 12, 10, 7, '2024-01-04 00:19:59', '2024-01-03 19:16:58'),
(27, 'Centralizacion TPV', 'Realizar la centralización de la tpv00802 debido a que el se dañó', NULL, '03/01/2024 14:50:35', '03/01/2024 15:50:35', 5, 12, 18, 7, '2024-01-04 01:40:58', '2024-01-03 19:53:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_components`
--

CREATE TABLE `type_components` (
  `id` int(11) NOT NULL,
  `type_component` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `type_components`
--

INSERT INTO `type_components` (`id`, `type_component`, `updated_at`, `created_at`) VALUES
(1, 'PROPIO', NULL, NULL),
(2, 'ALQUILADO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_company` int(11) DEFAULT NULL,
  `id_state` int(11) NOT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_chargy` int(11) DEFAULT NULL,
  `id_shop` int(11) DEFAULT NULL,
  `id_theme_user` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `nit`, `email`, `password`, `id_company`, `id_state`, `id_area`, `id_chargy`, `id_shop`, `id_theme_user`, `updated_at`, `created_at`) VALUES
(1, 'Jhan Carlos Cordoba', '3043711546', '1111663045', 'jccq12@gmail.com', '$2y$12$qiWWz8RWBnifFKhCROdRdOXSHVwVe9ZBZK4.B6aKJ5Pfh.Emk8W3G', 5, 1, 2, 1, 51, 2, '2024-01-04 18:56:34', '2023-12-04 06:41:19'),
(2, 'Administrador GRUPO TDM', NULL, '805027653', 'soporte@eltemplodelamoda.com.co', '$2y$12$URua6E9e.DoM3Nt2TzqadOQo0RG2QnM5Hk6a5A7EdemJZNaKMttVK', 5, 1, 1, 83, NULL, NULL, '2023-12-21 15:29:01', '2023-12-04 07:04:03'),
(10, 'Anderson Cordoba', NULL, '1565654465', 'sistemasaux8@eltemplodelamoda.com.co', '$2y$12$RePEIqHaMsIdOsiT1VgfSOBZPhG3sCGXTFpCfAeOi2V8nBmRwFUI6', 5, 1, 2, 5, 51, 1, '2023-12-22 14:48:57', '2023-12-06 20:36:20'),
(11, 'Kelly Gomez', NULL, '123456789', 'analistadesistemas@eltemplodelamoda.com.co', '$2y$12$DsPHFtMueUypFjuQyovIeuDIrr3HDOxvVSlEy4rcP6dt8gOnDPPMO', 1, 2, 2, 4, 2, 1, '2023-12-21 13:54:44', '2023-12-06 23:57:46'),
(12, 'Jerson Henao', NULL, '987456123', 'sistemasaux4@eltemplodelamoda.com.co', '$2y$12$3HC5qCgFUCEYrSTJ/xA6X.Vo.i8ScF5atbOECjPIc3uB9GhgLPpou', 5, 1, 2, 5, 51, 1, '2023-12-22 14:49:28', '2023-12-06 23:59:07'),
(13, 'Rodrigo Rodallega', NULL, '94495428', 'csoporte@eltemplodelamoda.com.co', '$2y$12$QHlRbbn8t9BP1NUuRB90oeZ7kQ/Q7lt1UuhAafWbnZjPvgLxnSYe2', 5, 1, 2, 1, 51, 3, '2023-12-22 14:49:18', '2023-12-09 21:34:32'),
(15, 'Adrian Garcia', NULL, '11929101283', 'sistemasaux10@eltemplodelamoda.com.co', '$2y$12$phLVMrVM7llr9rKXZhNiIuhlbEL7pfvnSk2q1yKmxdxcrnhwEjulK', 5, 1, 2, 5, 50, 1, '2023-12-22 14:49:46', '2023-12-11 21:44:18'),
(16, 'Jhan Carlos  Cordoba Quiñonez', NULL, '123456789', 'sistemasaux9@eltemplodelamoda.com.co', '$2y$12$/qI94Q1wzePQRzejcL924eeSSsl7HIZc8zR/NPYA4LYYY35DUZNzS', 1, 1, 16, 84, NULL, NULL, '2023-12-21 00:26:36', '2023-12-15 23:30:24'),
(17, 'Karen Arenas', NULL, '567688878', 'sistemasaux6@eltemplodelamoda.com.co', '$2y$12$kRnWSni/aDjFfpTXRSy3i.ruPxFYskvoHpfaKjrfk5Wm.LyKcu38y', 5, 1, 2, 5, 51, 1, '2024-01-03 19:10:37', '2024-01-03 19:10:37'),
(18, 'Sebastian Hinestroza', NULL, '65764754656', 'sistemasaux2@eltemplodelamoda.com.co', '$2y$12$/QvvaypJYZQjz9vKk8RCC.TxzokbMqyt4bx4ke2gO.z26C/zoQW1.', 5, 1, 2, 2, 51, 2, '2024-01-03 19:16:39', '2024-01-03 19:16:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `califications`
--
ALTER TABLE `califications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_califications_tickets1_idx` (`id_ticket`),
  ADD KEY `fk_califications_users1_idx` (`id_user`);

--
-- Indices de la tabla `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departure_certificates_users1_idx` (`id_user_delivery`),
  ADD KEY `fk_departure_certificates_users2_idx` (`id_user_receives`),
  ADD KEY `fk_certificates_proceedings1_idx` (`id_proceeding`),
  ADD KEY `fk_certificates_states1_idx` (`id_state`),
  ADD KEY `fk_certificates_users1_idx` (`id_user_reception`);

--
-- Indices de la tabla `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_charges_areas_idx` (`id_area`);

--
-- Indices de la tabla `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_users1_idx` (`id_user`),
  ADD KEY `fk_comments_tickets1_idx` (`id_ticket`),
  ADD KEY `fk_comments_states1_idx` (`id_state`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `directories`
--
ALTER TABLE `directories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_directories_users1_idx` (`id_user`),
  ADD KEY `fk_directories_states1_idx` (`id_state`);

--
-- Indices de la tabla `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_files_states1_idx` (`id_state`),
  ADD KEY `fk_files_users1_idx` (`id_user`),
  ADD KEY `fk_files_directories1_idx` (`id_directory`);

--
-- Indices de la tabla `files_modified`
--
ALTER TABLE `files_modified`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_files_modified_files1_idx` (`id_file`),
  ADD KEY `fk_files_modified_users1_idx` (`id_user`);

--
-- Indices de la tabla `images_products`
--
ALTER TABLE `images_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_images_products_products1_idx` (`id_product`),
  ADD KEY `fk_images_products_states1_idx` (`id_state`);

--
-- Indices de la tabla `origins_certificates`
--
ALTER TABLE `origins_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_permissions_users1_idx` (`id_user_collaborator`),
  ADD KEY `fk_permissions_users2_idx` (`id_user_boss`),
  ADD KEY `fk_permissions_users3_idx` (`id_user_reception`),
  ADD KEY `fk_permissions_reason1_idx` (`id_reason`),
  ADD KEY `fk_permissions_replenish_times1_idx` (`id_replenish_time`),
  ADD KEY `fk_permissions_states1_idx` (`id_state`);

--
-- Indices de la tabla `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proceedings`
--
ALTER TABLE `proceedings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_type_components1_idx` (`id_type_component`),
  ADD KEY `fk_products_states_certificates1_idx` (`id_state_certificate`),
  ADD KEY `fk_products_origins_certificates1_idx` (`id_origin_certificate`),
  ADD KEY `fk_products_states1_idx` (`id_state`);

--
-- Indices de la tabla `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `replenish_times`
--
ALTER TABLE `replenish_times`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reports_users1_idx` (`id_user`),
  ADD KEY `fk_reports_report_details1_idx` (`id_report_detail`);

--
-- Indices de la tabla `reports_certificate`
--
ALTER TABLE `reports_certificate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reports_certificate_certificates1_idx` (`id_certificate`),
  ADD KEY `fk_reports_certificate_states1_idx` (`id_state`),
  ADD KEY `fk_reports_certificate_users1_idx` (`id_user`);

--
-- Indices de la tabla `report_details`
--
ALTER TABLE `report_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `report_products`
--
ALTER TABLE `report_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_report_products_products1_idx` (`id_product`),
  ADD KEY `fk_report_products_certificates1_idx` (`id_certificate`);

--
-- Indices de la tabla `rows_certificates`
--
ALTER TABLE `rows_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rows_certificates_certificates1_idx` (`id_certificate`),
  ADD KEY `fk_rows_certificates_products1_idx` (`id_product`);

--
-- Indices de la tabla `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shops_companies1_idx` (`id_company`);

--
-- Indices de la tabla `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `states_certificates`
--
ALTER TABLE `states_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `themes_users`
--
ALTER TABLE `themes_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tickets_states1_idx` (`id_state`),
  ADD KEY `fk_tickets_users1_idx` (`id_user_sender`),
  ADD KEY `fk_tickets_users2_idx` (`id_user_destination`),
  ADD KEY `fk_tickets_priorities1_idx` (`id_priority`);

--
-- Indices de la tabla `type_components`
--
ALTER TABLE `type_components`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_companies1_idx` (`id_company`),
  ADD KEY `fk_users_states1_idx` (`id_state`),
  ADD KEY `fk_users_areas1_idx` (`id_area`),
  ADD KEY `fk_users_charges1_idx` (`id_chargy`),
  ADD KEY `fk_users_shops1_idx` (`id_shop`),
  ADD KEY `fk_users_themes_users1_idx` (`id_theme_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `califications`
--
ALTER TABLE `califications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `directories`
--
ALTER TABLE `directories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `files_modified`
--
ALTER TABLE `files_modified`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `images_products`
--
ALTER TABLE `images_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `origins_certificates`
--
ALTER TABLE `origins_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proceedings`
--
ALTER TABLE `proceedings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `replenish_times`
--
ALTER TABLE `replenish_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT de la tabla `reports_certificate`
--
ALTER TABLE `reports_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `report_details`
--
ALTER TABLE `report_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `report_products`
--
ALTER TABLE `report_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rows_certificates`
--
ALTER TABLE `rows_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `states_certificates`
--
ALTER TABLE `states_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `themes_users`
--
ALTER TABLE `themes_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `type_components`
--
ALTER TABLE `type_components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `califications`
--
ALTER TABLE `califications`
  ADD CONSTRAINT `fk_califications_tickets1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_califications_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `fk_certificates_proceedings1` FOREIGN KEY (`id_proceeding`) REFERENCES `proceedings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificates_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificates_users1` FOREIGN KEY (`id_user_reception`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_departure_certificates_users1` FOREIGN KEY (`id_user_delivery`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_departure_certificates_users2` FOREIGN KEY (`id_user_receives`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `fk_charges_areas` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_tickets1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `directories`
--
ALTER TABLE `directories`
  ADD CONSTRAINT `fk_directories_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_directories_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `fk_files_directories1` FOREIGN KEY (`id_directory`) REFERENCES `directories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_files_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_files_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `files_modified`
--
ALTER TABLE `files_modified`
  ADD CONSTRAINT `fk_files_modified_files1` FOREIGN KEY (`id_file`) REFERENCES `files` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_files_modified_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `images_products`
--
ALTER TABLE `images_products`
  ADD CONSTRAINT `fk_images_products_products1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_images_products_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `fk_permissions_reason1` FOREIGN KEY (`id_reason`) REFERENCES `reasons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_permissions_replenish_times1` FOREIGN KEY (`id_replenish_time`) REFERENCES `replenish_times` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_permissions_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_permissions_users1` FOREIGN KEY (`id_user_collaborator`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_permissions_users2` FOREIGN KEY (`id_user_boss`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_permissions_users3` FOREIGN KEY (`id_user_reception`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_origins_certificates1` FOREIGN KEY (`id_origin_certificate`) REFERENCES `origins_certificates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_states_certificates1` FOREIGN KEY (`id_state_certificate`) REFERENCES `states_certificates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_type_components1` FOREIGN KEY (`id_type_component`) REFERENCES `type_components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_report_details1` FOREIGN KEY (`id_report_detail`) REFERENCES `report_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reports_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reports_certificate`
--
ALTER TABLE `reports_certificate`
  ADD CONSTRAINT `fk_reports_certificate_certificates1` FOREIGN KEY (`id_certificate`) REFERENCES `certificates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reports_certificate_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reports_certificate_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `report_products`
--
ALTER TABLE `report_products`
  ADD CONSTRAINT `fk_report_products_certificates1` FOREIGN KEY (`id_certificate`) REFERENCES `certificates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_report_products_products1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rows_certificates`
--
ALTER TABLE `rows_certificates`
  ADD CONSTRAINT `fk_rows_certificates_certificates1` FOREIGN KEY (`id_certificate`) REFERENCES `certificates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rows_certificates_products1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `fk_shops_companies1` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_tickets_priorities1` FOREIGN KEY (`id_priority`) REFERENCES `priorities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_users1` FOREIGN KEY (`id_user_sender`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_users2` FOREIGN KEY (`id_user_destination`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_areas1` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_charges1` FOREIGN KEY (`id_chargy`) REFERENCES `charges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_companies1` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_shops1` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_themes_users1` FOREIGN KEY (`id_theme_user`) REFERENCES `themes_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
