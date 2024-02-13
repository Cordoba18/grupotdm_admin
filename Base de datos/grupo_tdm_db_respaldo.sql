-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2024 a las 23:19:33
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
(1, 5, 'Chévere', 11, 1, '18 January 2024', '2024-01-19 01:56:05', '2023-12-14 00:06:14'),
(2, 5, 'Muy bien', 6, 1, '13 December 2023', '2023-12-14 00:57:14', '2023-12-14 00:57:14'),
(3, 2, 'Todo esta muy bien gracias', 21, 2, '19 December 2023', '2023-12-19 21:09:31', '2023-12-14 01:04:25'),
(4, 4, 'Gracias', 17, 2, '19 December 2023', '2023-12-19 20:02:52', '2023-12-19 20:02:52'),
(5, 5, 'Muy buen servicio', 25, 16, '21 December 2023', '2023-12-22 01:31:36', '2023-12-22 01:31:36'),
(6, 4, 'Horrible', 8, 10, '06 January 2024', '2024-01-06 21:27:10', '2024-01-06 21:27:10'),
(7, 4, 'Muy buena atención. Muchas Gracias', 56, 23, '29 January 2024', '2024-01-30 01:14:30', '2024-01-30 01:11:34');

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
  `id_user_receives` int(11) DEFAULT NULL,
  `name_user_receives` varchar(100) DEFAULT NULL,
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

INSERT INTO `certificates` (`id`, `id_proceeding`, `date`, `address`, `id_user_delivery`, `id_user_receives`, `name_user_receives`, `id_user_reception`, `general_remarks`, `image_exit`, `date_exit`, `image_delivery`, `date_delivery`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 1, '16/01/2024 17:13:06', 'TEMPLO 2', 1, 1, NULL, NULL, 'n/a', NULL, NULL, NULL, NULL, 2, '2024-01-17 03:13:18', '2024-01-17 03:13:18'),
(2, 1, '16/01/2024 17:15:45', 'TEMPLO 2', 1, 1, NULL, NULL, 'n/a', NULL, NULL, NULL, NULL, 2, '2024-01-17 03:16:18', '2024-01-17 03:16:18'),
(3, 1, '16/01/2024 17:19:31', 'TEMPLO 2', 1, NULL, 'jhan carlos PC COM', NULL, 'N/A', NULL, NULL, NULL, NULL, 2, '2024-01-17 03:19:54', '2024-01-17 03:19:54'),
(4, 1, '16/01/2024 17:23:57', 'Calle 28#86-29', 1, NULL, 'PC COM', NULL, 'n/a', NULL, NULL, NULL, NULL, 2, '2024-01-17 03:24:27', '2024-01-17 03:24:27'),
(5, 1, '16/01/2024 17:25:50', 'TEMPLO 2', 1, NULL, 'PC COM', NULL, 'N/a', '2024-01-17_13-40-23.jpg', '17/01/2024 08:40:15', '2024-01-17_13-40-38.jpg', '17/01/2024 08:40:24', 12, '2024-01-17 13:40:40', '2024-01-17 03:26:07'),
(6, 2, '17/01/2024 08:21:46', 'TEMPLO 2', 1, NULL, 'RODRIGO', NULL, 'N/a', '2024-01-17_13-36-17.png', '17/01/2024 08:36:04', NULL, NULL, 2, '2024-01-17 18:37:00', '2024-01-17 18:22:18'),
(7, 1, '17/01/2024 08:44:17', 'TEMPLO 2', 1, NULL, 'Leonardo', NULL, 'n/a', '2024-01-17_13-45-42.gif', '17/01/2024 08:45:35', NULL, NULL, 2, '2024-01-17 18:46:23', '2024-01-17 18:44:47'),
(8, 1, '17/01/2024 08:47:03', 'TEMPLO 2', 1, NULL, 'PC COM', NULL, 'N/A', '2024-01-17_13-47-40.jpg', '17/01/2024 08:47:34', NULL, NULL, 2, '2024-01-17 18:50:09', '2024-01-17 18:47:14'),
(9, 1, '17/01/2024 08:50:14', 'TEMPLO 2', 1, NULL, 'PC COM', 16, 'N/A', '2024-01-17_13-50-48.png', '17/01/2024 08:50:41', '2024-01-17_13-51-16.gif', '17/01/2024 08:50:49', 12, '2024-01-17 13:51:18', '2024-01-17 18:50:25'),
(10, 1, '17/01/2024 09:16:00', 'TEMPLO 2', 1, 19, NULL, 16, 'N/A', '2024-01-17_14-19-02.jpg', '17/01/2024 09:17:17', '2024-01-17_14-20-36.png', '17/01/2024 09:20:26', 12, '2024-01-17 14:20:38', '2024-01-17 19:16:21'),
(11, 1, '17/01/2024 09:21:45', 'TEMPLO 2', 1, 1, NULL, NULL, 'N/A', NULL, NULL, NULL, NULL, 2, '2024-01-17 19:22:52', '2024-01-17 19:22:00'),
(12, 1, '17/01/2024 09:25:09', 'TEMPLO 2', 1, 1, NULL, 16, 'N/A', '2024-01-17_14-26-22.png', '17/01/2024 09:25:55', '2024-01-17_14-26-42.jpg', '17/01/2024 09:26:28', 12, '2024-01-17 14:26:44', '2024-01-17 19:25:38'),
(13, 1, '17/01/2024 10:03:49', 'TEMPLO 2', 1, 1, NULL, NULL, 'n/a', NULL, NULL, NULL, NULL, 2, '2024-01-22 18:25:18', '2024-01-17 20:04:04'),
(14, 2, '20/01/2024 08:47:32', 'Calle 28#86-29', 1, 1, NULL, 1, 'N/A', '2024-01-20_13-48-20.jpg', '20/01/2024 08:48:10', 'success.png', '20/01/2024 09:11:02', 12, '2024-01-20 19:11:02', '2024-01-20 18:47:54'),
(15, 2, '20/01/2024 11:13:31', 'OFICINA ADMINISTRATIVA', 10, 1, NULL, 10, 'N/A', '2024-01-20_16-14-48.png', '20/01/2024 11:14:41', 'success.png', '20/01/2024 11:15:28', 12, '2024-01-20 21:15:28', '2024-01-20 21:13:54'),
(16, 1, '22/01/2024 14:06:47', 'TEMPLO 2', 1, 10, NULL, NULL, 'n/a', NULL, NULL, NULL, NULL, 2, '2024-01-23 00:28:37', '2024-01-23 00:07:03'),
(17, 1, '22/01/2024 14:30:16', 'TEMPLO 2', 1, 10, NULL, NULL, 'n/a', NULL, NULL, NULL, NULL, 2, '2024-01-23 00:34:52', '2024-01-23 00:30:43'),
(18, 2, '23/01/2024 16:13:06', 'TEMPLO 2', 1, 10, NULL, NULL, 'n/a', NULL, NULL, NULL, NULL, 2, '2024-01-30 18:35:56', '2024-01-24 02:13:20'),
(19, 2, '30/01/2024 12:06:57', 'OFICINA ADMINISTRATIVA', 1, 1, NULL, NULL, 'n/a', NULL, NULL, NULL, NULL, 2, '2024-01-30 22:12:51', '2024-01-30 22:08:13'),
(20, 2, '31/01/2024 09:13:03', 'OFICINA ADMINISTRATIVA', 1, 24, NULL, 1, 'Sale sin problemas (Producto delicado)', '2024-01-31_15-33-34.avif', '31/01/2024 10:33:28', NULL, NULL, 2, '2024-01-31 21:47:03', '2024-01-31 19:15:43'),
(21, 2, '01/02/2024 12:28:08', 'OFICINA ADMINISTRATIVA', 1, 1, NULL, 1, 'n/a', '2024-02-01_17-29-40.avif', '01/02/2024 12:29:30', '2024-02-01_17-30-12.webp', '01/02/2024 12:30:04', 12, '2024-02-01 17:30:14', '2024-02-01 22:28:36'),
(22, 2, '01/02/2024 13:52:21', 'OFICINA ADMINISTRATIVA', 1, NULL, 'PCCOM', NULL, 'N/A', '2024-02-01_18-53-16.avif', '01/02/2024 13:53:02', NULL, NULL, 2, '2024-02-01 23:56:11', '2024-02-01 23:52:48'),
(23, 2, '01/02/2024 15:04:19', 'OFICINA ADMINISTRATIVA', 10, 1, NULL, NULL, 'N/a', NULL, NULL, NULL, NULL, 2, '2024-02-07 20:15:34', '2024-02-02 01:04:36'),
(24, 2, '07/02/2024 10:16:05', 'OFICINA ADMINISTRATIVA', 10, 24, NULL, 10, 'N/a', '2024-02-07_15-17-02.gif', '07/02/2024 10:16:51', 'success.png', '07/02/2024 10:22:53', 12, '2024-02-07 20:22:53', '2024-02-07 20:16:34'),
(25, 2, '07/02/2024 10:18:45', 'OFICINA ADMINISTRATIVA', 10, 18, NULL, 10, 'N/A', '2024-02-07_15-19-31.gif', '07/02/2024 10:19:24', 'success.png', '07/02/2024 10:23:16', 12, '2024-02-07 20:23:16', '2024-02-07 20:19:11'),
(26, 2, '08/02/2024 10:35:04', 'OFICINA ADMINISTRATIVA', 1, 1, NULL, NULL, 'N/a', NULL, NULL, NULL, NULL, 2, '2024-02-08 20:36:53', '2024-02-08 20:35:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `characteristics_products`
--

CREATE TABLE `characteristics_products` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('asdasd123@tceluniverso.com', '512289', '2024-01-25 19:03:08', '2024-01-25 19:03:08'),
('csoporte@eltemplodelamoda.com.co', '271395', '2023-12-09 21:33:16', '2023-12-09 21:33:16'),
('ewtewtewt@eltemplodelamoda.com.co', '480993', '2024-01-05 23:47:39', '2024-01-05 23:47:39'),
('fwefewfw@eltemplodelamoda.com.co', '866571', '2024-01-05 23:43:24', '2024-01-05 23:43:24'),
('jccq12@eltemplodelamoda.com.co', '528815', '2023-12-09 18:50:00', '2023-12-09 18:50:00'),
('jccq12@eltemplodelamodafresca.com.co', '984455', '2023-12-09 18:49:21', '2023-12-09 18:49:21'),
('jccq12@gmail.com', '454489', '2024-01-26 21:16:56', '2024-01-26 21:16:56'),
('sistemasaux10@eltemplodelamoda.com.co', '227045', '2024-01-31 01:13:13', '2024-01-31 01:13:13'),
('sistemasaux21@eltemplodelamoda.com.co', '484538', '2024-01-27 19:49:49', '2024-01-27 19:49:49'),
('sistemasaux8@eltemplodelamoda.com.co', '450521', '2023-12-07 18:38:05', '2023-12-07 18:38:05'),
('sistemasaux9@eltemplodelamoda.com.co', '407743', '2024-02-05 20:54:36', '2024-02-05 20:54:36'),
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
(21, 'A la hora 30, me toca solucionar a mi, ome', '03 January 2024', 12, 26, 1, '2024-01-03 19:18:30', '2024-01-03 19:18:30'),
(50, 'A', '06 January 2024', 10, 8, 1, '2024-01-06 16:35:04', '2024-01-06 16:35:04'),
(53, 'Rey hasta cuando', '15 January 2024', 1, 35, 1, '2024-01-15 17:28:47', '2024-01-15 17:28:47'),
(54, 'dasd', '18 January 2024', 1, 7, 1, '2024-01-18 15:53:38', '2024-01-18 15:53:38'),
(55, 'Ola K Ase :v', '18 January 2024', 18, 9, 1, '2024-01-18 17:24:11', '2024-01-18 17:24:11'),
(56, 'asdasd', '18 January 2024', 1, 7, 1, '2024-01-18 19:23:07', '2024-01-18 19:23:07'),
(57, 'Que mas pues', '18 January 2024', 10, 7, 1, '2024-01-18 19:55:32', '2024-01-18 19:55:32'),
(58, 'adsadsa', '18 January 2024', 1, 7, 1, '2024-01-18 19:56:59', '2024-01-18 19:56:59'),
(59, 'sadasd', '18 January 2024', 1, 7, 1, '2024-01-18 19:57:22', '2024-01-18 19:57:22'),
(60, 'adssad', '18 January 2024', 1, 7, 1, '2024-01-18 19:57:46', '2024-01-18 19:57:46'),
(61, 'asd', '18 January 2024', 1, 7, 1, '2024-01-18 19:58:03', '2024-01-18 19:58:03'),
(62, 'Hola que mas', '18 January 2024', 1, 7, 1, '2024-01-18 19:58:22', '2024-01-18 19:58:22'),
(63, 'sa', '18 January 2024', 1, 7, 1, '2024-01-18 19:58:48', '2024-01-18 19:58:48'),
(64, 'asd', '18 January 2024', 1, 7, 1, '2024-01-18 19:59:14', '2024-01-18 19:59:14'),
(65, 'asdad', '18 January 2024', 1, 7, 1, '2024-01-18 19:59:37', '2024-01-18 19:59:37'),
(66, 'asdad', '18 January 2024', 1, 7, 1, '2024-01-18 19:59:38', '2024-01-18 19:59:38'),
(67, 'asdasd', '18 January 2024', 1, 7, 1, '2024-01-18 20:00:13', '2024-01-18 20:00:13'),
(68, 'ads', '18 January 2024', 1, 7, 1, '2024-01-18 20:01:11', '2024-01-18 20:01:11'),
(69, 's', '18 January 2024', 1, 7, 1, '2024-01-18 20:01:48', '2024-01-18 20:01:48'),
(70, 'asd', '18 January 2024', 1, 7, 1, '2024-01-18 20:02:14', '2024-01-18 20:02:14'),
(71, 'asdad', '18 January 2024', 1, 7, 1, '2024-01-18 20:05:38', '2024-01-18 20:05:38'),
(72, 'Qe', '18 January 2024', 1, 7, 1, '2024-01-18 20:06:54', '2024-01-18 20:06:54'),
(73, 'Qe', '18 January 2024', 1, 7, 1, '2024-01-18 20:09:24', '2024-01-18 20:09:24'),
(74, 'a', '18 January 2024', 1, 7, 1, '2024-01-18 20:09:35', '2024-01-18 20:09:35'),
(75, 'sfa', '18 January 2024', 1, 7, 1, '2024-01-18 20:12:47', '2024-01-18 20:12:47'),
(76, 'Hola', '18 January 2024', 1, 7, 1, '2024-01-18 20:15:22', '2024-01-18 20:15:22'),
(77, 'Que mas ve', '18 January 2024', 10, 7, 1, '2024-01-18 20:15:41', '2024-01-18 20:15:41'),
(78, 'Csadas', '18 January 2024', 1, 7, 1, '2024-01-18 20:16:15', '2024-01-18 20:16:15'),
(79, 'asd', '18 January 2024', 10, 7, 1, '2024-01-18 20:17:03', '2024-01-18 20:17:03'),
(80, 'Bien o que', '18 January 2024', 1, 7, 1, '2024-01-18 20:17:08', '2024-01-18 20:17:08'),
(81, 'tre tri', '18 January 2024', 1, 7, 1, '2024-01-18 20:17:18', '2024-01-18 20:17:18'),
(82, 'Que mas ve', '18 January 2024', 1, 7, 1, '2024-01-18 20:17:30', '2024-01-18 20:17:30'),
(83, 'dsa', '18 January 2024', 1, 7, 1, '2024-01-18 20:19:20', '2024-01-18 20:19:20'),
(84, 'chevere que mas ve?', '18 January 2024', 1, 7, 1, '2024-01-18 20:44:58', '2024-01-18 20:44:58'),
(85, 'Mano es que la real no se puede weon', '18 January 2024', 1, 7, 1, '2024-01-18 20:45:58', '2024-01-18 20:45:58'),
(86, 'Por que o que?', '18 January 2024', 10, 7, 1, '2024-01-18 20:46:06', '2024-01-18 20:46:06'),
(87, 'Feo horrible', '18 January 2024', 1, 7, 1, '2024-01-18 20:46:17', '2024-01-18 20:46:17'),
(88, 'feo', '18 January 2024', 10, 7, 1, '2024-01-18 20:46:48', '2024-01-18 20:46:48'),
(89, 'feo', '18 January 2024', 10, 7, 1, '2024-01-18 20:46:50', '2024-01-18 20:46:50'),
(90, 'feo', '18 January 2024', 10, 7, 1, '2024-01-18 20:46:50', '2024-01-18 20:46:50'),
(91, 'feo', '18 January 2024', 10, 7, 1, '2024-01-18 20:46:51', '2024-01-18 20:46:51'),
(92, 'Sos horrible', '18 January 2024', 10, 7, 1, '2024-01-18 20:47:06', '2024-01-18 20:47:06'),
(93, 'Chévere', '18 January 2024', 1, 9, 1, '2024-01-18 20:53:26', '2024-01-18 20:53:26'),
(94, 'Ola K Ase :v', '18 January 2024', 18, 11, 1, '2024-01-18 21:00:23', '2024-01-18 21:00:23'),
(95, 'Hablame', '18 January 2024', 18, 11, 1, '2024-01-18 21:00:40', '2024-01-18 21:00:40'),
(96, 'Mano cállate', '18 January 2024', 1, 11, 1, '2024-01-18 21:00:54', '2024-01-18 21:00:54'),
(97, ':c', '18 January 2024', 18, 11, 1, '2024-01-18 21:01:00', '2024-01-18 21:01:00'),
(98, 'Deja de hablar bobadas', '18 January 2024', 18, 11, 1, '2024-01-18 21:01:09', '2024-01-18 21:01:09'),
(99, 'necesito ayuda', '18 January 2024', 18, 11, 1, '2024-01-18 21:01:22', '2024-01-18 21:01:22'),
(100, 'Chévere', '18 January 2024', 1, 12, 1, '2024-01-18 21:25:06', '2024-01-18 21:25:06'),
(102, 'Hola', '19 January 2024', 16, 14, 1, '2024-01-19 17:09:16', '2024-01-19 17:09:16'),
(103, 'Ya resuelvo tu ticket', '19 January 2024', 1, 14, 1, '2024-01-19 17:09:38', '2024-01-19 17:09:38'),
(104, 'Enciende el equipo porfa', '19 January 2024', 16, 14, 1, '2024-01-19 17:10:01', '2024-01-19 17:10:01'),
(105, 'Hola', '19 January 2024', 1, 14, 1, '2024-01-19 17:19:04', '2024-01-19 17:19:04'),
(106, 'Hola', '19 January 2024', 1, 14, 1, '2024-01-19 17:20:36', '2024-01-19 17:20:36'),
(107, 'wefwf', '19 January 2024', 16, 14, 1, '2024-01-19 17:20:45', '2024-01-19 17:20:45'),
(108, 'Ya?', '19 January 2024', 1, 15, 1, '2024-01-19 20:23:00', '2024-01-19 20:23:00'),
(109, 'sisas', '19 January 2024', 10, 15, 1, '2024-01-19 20:23:08', '2024-01-19 20:23:08'),
(110, 'Melo', '19 January 2024', 1, 15, 1, '2024-01-19 20:23:15', '2024-01-19 20:23:15'),
(111, 'Puedes cerrar el ticket porfa?', '19 January 2024', 10, 15, 1, '2024-01-19 20:25:23', '2024-01-19 20:25:23'),
(112, 'Ok', '19 January 2024', 1, 15, 1, '2024-01-19 20:25:27', '2024-01-19 20:25:27'),
(113, 'Hola', '19 January 2024', 1, 15, 1, '2024-01-19 20:38:32', '2024-01-19 20:38:32'),
(159, 'asdasdasd', '19 January 2024', 1, 13, 1, '2024-01-19 21:38:40', '2024-01-19 21:38:40'),
(163, 'Como vas', '19 January 2024', 10, 13, 1, '2024-01-19 21:38:58', '2024-01-19 21:38:58'),
(164, 'Como te va en la vida ve', '19 January 2024', 10, 13, 1, '2024-01-19 21:39:03', '2024-01-19 21:39:03'),
(165, 'Care monda', '19 January 2024', 10, 13, 1, '2024-01-19 21:39:06', '2024-01-19 21:39:06'),
(166, 'Melo?', '19 January 2024', 10, 13, 1, '2024-01-19 21:39:17', '2024-01-19 21:39:17'),
(169, 'Si puedes elimina el ticket porfavor', '19 January 2024', 1, 13, 1, '2024-01-19 21:40:26', '2024-01-19 21:40:26'),
(170, 'asdasd', '19 January 2024', 1, 13, 1, '2024-01-19 21:52:30', '2024-01-19 21:52:30'),
(171, 'sads', '19 January 2024', 1, 13, 1, '2024-01-19 21:52:46', '2024-01-19 21:52:46'),
(172, 'sadas', '19 January 2024', 10, 13, 1, '2024-01-19 21:52:53', '2024-01-19 21:52:53'),
(173, 'Ola K Ase :v', '19 January 2024', 18, 18, 1, '2024-01-19 22:00:38', '2024-01-19 22:00:38'),
(174, 'Bien o qué?', '19 January 2024', 1, 18, 1, '2024-01-19 22:00:47', '2024-01-19 22:00:47'),
(176, 'Buen dia', '20 January 2024', 10, 30, 1, '2024-01-20 16:26:04', '2024-01-20 16:26:04'),
(177, 'Ya te colaboro', '20 January 2024', 10, 30, 1, '2024-01-20 16:26:08', '2024-01-20 16:26:08'),
(178, 'Vale Gracias', '20 January 2024', 1, 30, 1, '2024-01-20 16:26:14', '2024-01-20 16:26:14'),
(179, 'asd', '20 January 2024', 1, 30, 1, '2024-01-20 16:30:22', '2024-01-20 16:30:22'),
(181, 'sadasd', '20 January 2024', 10, 30, 1, '2024-01-20 16:33:19', '2024-01-20 16:33:19'),
(182, 'asdasdasd', '20 January 2024', 1, 30, 1, '2024-01-20 16:33:24', '2024-01-20 16:33:24'),
(184, 'Ya resolviste?', '20 January 2024', 1, 30, 1, '2024-01-20 16:35:56', '2024-01-20 16:35:56'),
(185, 'dsad', '20 January 2024', 1, 30, 1, '2024-01-20 16:46:53', '2024-01-20 16:46:53'),
(186, 'a', '20 January 2024', 1, 30, 1, '2024-01-20 16:47:07', '2024-01-20 16:47:07'),
(187, 'sadas', '20 January 2024', 10, 30, 1, '2024-01-20 16:47:30', '2024-01-20 16:47:30'),
(188, 'Uy Cualejesa', '20 January 2024', 1, 30, 1, '2024-01-20 17:12:53', '2024-01-20 17:12:53'),
(189, 'Que mas pues', '20 January 2024', 10, 30, 1, '2024-01-20 17:13:02', '2024-01-20 17:13:02'),
(190, 'Hola}', '22/01/2024 08:32:41', 10, 30, 1, '2024-01-22 13:32:41', '2024-01-22 13:32:41'),
(191, 'QUE MAS', '22 January 2024 08:34:34', 10, 30, 1, '2024-01-22 13:34:34', '2024-01-22 13:34:34'),
(192, 'Bien', '22 January 2024 08:34:47', 1, 30, 1, '2024-01-22 13:34:47', '2024-01-22 13:34:47'),
(193, 'Ola K Ase :v', '22 January 2024 14:45:31', 18, 35, 1, '2024-01-22 19:45:33', '2024-01-22 19:45:33'),
(194, 'Hola', '22 January 2024 14:45:52', 1, 35, 1, '2024-01-22 19:45:52', '2024-01-22 19:45:52'),
(195, 'Hola', '23 January 2024 10:41:36', 1, 36, 1, '2024-01-23 15:41:39', '2024-01-23 15:41:39'),
(199, 'Ya estoy realizando tu ticket', '29 January 2024 15:05:53', 23, 56, 1, '2024-01-30 01:05:53', '2024-01-30 01:05:53'),
(200, 'HOLA', '29 January 2024 15:38:46', 23, 56, 1, '2024-01-30 01:38:46', '2024-01-30 01:38:46'),
(203, 'Ahlo', '30 January 2024 15:17:34', 15, 58, 1, '2024-01-31 01:17:34', '2024-01-31 01:17:34'),
(204, 'Hola', '01 February 2024 15:00:26', 1, 59, 1, '2024-02-02 01:00:26', '2024-02-02 01:00:26'),
(205, 'Hola', '03 February 2024 12:29:36', 10, 59, 1, '2024-02-03 22:29:36', '2024-02-03 22:29:36'),
(206, 'Chevere', '07 February 2024 11:01:31', 10, 59, 1, '2024-02-07 16:01:33', '2024-02-07 16:01:33'),
(207, 'hOLA', '13 February 2024 15:32:43', 10, 63, 1, '2024-02-14 01:32:43', '2024-02-14 01:32:43'),
(208, 'Necesitas algo', '13 February 2024 15:32:46', 10, 63, 1, '2024-02-14 01:32:46', '2024-02-14 01:32:46'),
(209, 'YA ACABO?', '13 February 2024 15:38:49', 10, 63, 1, '2024-02-13 20:38:51', '2024-02-13 20:38:51');

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
(2, 'ACTAS SALIDAS', '118974', '12-12-2023 16-03-31/1', '12-12-2023 16-03-31', '12-12-2023 16-14-45', 1, 2, '2024-01-06 13:39:35', '2023-12-13 02:03:34'),
(3, 'OTRO', '560958', '12-12-2023 16-32-56/12', '12-12-2023 16-32-56', '12-12-2023 16-32-56', 12, 1, '2023-12-13 02:32:59', '2023-12-13 02:32:59'),
(4, 'DOCUMENTOS DE KAREN', '634187', '15-12-2023 14-07-00/2', '15-12-2023 14-07-00', '15-12-2023 14-09-17', 2, 2, '2023-12-19 15:24:35', '2023-12-16 00:07:03'),
(5, 'DOCUMENTOS DE KAREN', '808495', '19-12-2023 10-23-15/2', '19-12-2023 10-23-15', '19-12-2023 10-23-15', 2, 2, '2023-12-19 15:24:32', '2023-12-19 15:23:18'),
(6, 'DOCUMENTOS', '768224', '19-12-2023 10-29-27/2', '19-12-2023 10-29-27', '19-12-2023 10-29-27', 2, 1, '2023-12-19 15:29:30', '2023-12-19 15:29:30'),
(7, 'BASES DE DATOS', '702832', '03-01-2024 14-42-35/1', '03-01-2024 14-42-35', '03-01-2024 14-42-35', 1, 2, '2024-01-05 18:29:22', '2024-01-03 19:42:38'),
(8, 'feo', '726525', '05-01-2024 13-12-38/1', '05-01-2024 13-12-38', '05-01-2024 13-12-38', 1, 2, '2024-01-05 18:12:46', '2024-01-05 18:12:39'),
(9, 'BASES DE DATOS', '451721', '06-01-2024 08-39-42/1', '06-01-2024 08-39-42', '06-01-2024 08-39-42', 1, 1, '2024-01-06 13:39:45', '2024-01-06 13:39:45'),
(10, 'PRUEBA', '561230', '30-01-2024 13-54-53/23', '30-01-2024 13-54-53', '30-01-2024 14-44-35', 23, 2, '2024-01-30 19:56:28', '2024-01-30 18:54:57');

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
(6, 'REPORTE ACTUALIZADO DE TIENDAS 2023', '2023-12-21_19-13-19.xlsx', '21-12-2023 14-13-19', '21-12-2023 14-13-19', 6, 1, 2, '2023-12-21 19:13:21', '2023-12-21 19:13:21'),
(7, 'TEMPLO 9 CAJA 9', '2024-01-06_13-57-48.rar', '06-01-2024 08-57-48', '06-01-2024 08-57-48', 9, 2, 1, '2024-01-06 13:59:35', '2024-01-06 13:57:49'),
(8, 'INFORME DE BASE DE DATOS', '2024-01-25_18-54-55.xlsx', '25-01-2024 13-54-55', '25-01-2024 13-54-55', 9, 1, 1, '2024-01-25 23:54:55', '2024-01-25 23:54:55'),
(9, 'ARCHIVO DE PRUEBA V2', '2024-01-30_19-44-35.webp', '30-01-2024 14-12-48', '30-01-2024 14-44-35', 10, 2, 23, '2024-01-30 19:49:24', '2024-01-31 00:12:48'),
(10, 'asdasd', '2024-01-31_17-17-47.jpg', '31-01-2024 12-17-47', '31-01-2024 12-17-47', 9, 1, 1, '2024-01-31 22:17:47', '2024-01-31 22:17:47');

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
(3, 'ACTAS DE ENTREGA', '2023-12-15_19-07-39.xlsx', '15-12-2023 14-07-39', 4, 2, '2023-12-16 00:09:17', '2023-12-16 00:09:17'),
(4, 'ARCHIVO DE PRUEBA', '2024-01-30_19-12-48.jpg', '30-01-2024 14-12-48', 9, 23, '2024-01-31 00:44:35', '2024-01-31 00:44:35');

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
(1, '2024-01-16_10-31-27.jpg', 1, 1, '2024-01-16 15:31:27', '2024-01-16 15:31:27'),
(2, '2024-01-16_15-32-42.jpg', 1, 1, '2024-01-16 20:32:42', '2024-01-16 20:32:42'),
(3, '2024-01-16_11-23-22.jpg', 2, 1, '2024-01-16 16:23:22', '2024-01-16 16:23:22'),
(4, '2024-01-16_12-10-44.jpg', 3, 1, '2024-01-16 17:10:44', '2024-01-16 17:10:44'),
(5, '2024-01-19_12-00-26.webp', 4, 1, '2024-01-19 17:00:26', '2024-01-19 17:00:26'),
(6, '2024-01-19_17-02-19.jpg', 5, 1, '2024-01-19 22:02:19', '2024-01-19 22:02:19'),
(7, '2024-01-30_15-59-03.webp', 6, 1, '2024-01-30 20:59:03', '2024-01-30 15:02:41'),
(8, '2024-01-30_16-04-39.webp', 6, 2, '2024-01-30 21:13:54', '2024-01-30 21:04:39'),
(9, '2024-01-30_16-16-57.webp', 6, 1, '2024-01-30 21:16:57', '2024-01-30 21:16:57'),
(10, '2024-01-31_08-43-55.avif', 7, 1, '2024-01-31 13:43:55', '2024-01-31 13:43:55'),
(11, '2024-02-08_10-34-36.webp', 8, 1, '2024-02-08 15:34:36', '2024-02-08 15:34:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ip_linux_directions`
--

CREATE TABLE `ip_linux_directions` (
  `id` int(11) NOT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `id_server` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ip_linux_directions`
--

INSERT INTO `ip_linux_directions` (`id`, `ip`, `id_server`, `id_state`, `updated_at`, `created_at`) VALUES
(1, '172.21.107.7', 1, 2, '2024-02-07 18:34:08', '2024-02-06 19:21:14'),
(2, '172.21.107.7', 1, 2, '2024-02-06 20:35:59', '2024-02-06 19:53:51'),
(3, '1072.21.107.7', 1, 2, '2024-02-06 20:36:45', '2024-02-06 20:36:38'),
(4, '10.75.65.31', 1, 2, '2024-02-07 18:38:45', '2024-02-07 18:37:09'),
(5, '107.65.107.7', 1, 1, '2024-02-07 22:29:07', '2024-02-07 22:29:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notification` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `route` varchar(500) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `notification`, `date`, `route`, `id_user`, `id_state`, `updated_at`, `created_at`) VALUES
(134, 'Se ha creado una nueva acta para ti', '01/02/2024 12:28:40', 'http://localhost/dashboard/certificates/view_certificate/21', 1, 4, '2024-02-01 23:51:36', '2024-02-01 17:28:40'),
(135, 'El acta el cual recibiras se encuentra despachada', '01/02/2024 12:29:40', 'http://localhost/dashboard/certificates/view_certificate/21', 1, 4, '2024-02-01 23:51:29', '2024-02-01 17:29:40'),
(136, 'Su acta ha sido ENTREGADA con exito!', '01/02/2024 12:30:12', 'http://localhost/dashboard/certificates/view_certificate/21', 1, 4, '2024-02-01 23:45:27', '2024-02-01 17:30:12'),
(137, 'Se ha creado un nuevo ticket para ti', '01/02/2024 14:37:11', 'http://localhost/dashboard/tickets/ticket_detail/59', 1, 3, '2024-02-01 19:37:11', '2024-02-01 19:37:11'),
(138, 'Su ticket ha sido VISTO y esta previo a ejecución', '01/02/2024 14:37:21', 'http://localhost/dashboard/tickets/ticket_detail/59', 1, 3, '2024-02-01 19:37:21', '2024-02-01 19:37:21'),
(139, 'El ticket ha sido modificado', '01/02/2024 14:58:32', 'http://localhost/dashboard/tickets/ticket_detail/59', 10, 3, '2024-02-01 19:58:32', '2024-02-01 19:58:32'),
(140, 'Se ha creado una nueva acta para ti', '01/02/2024 15:04:38', 'http://localhost/dashboard/certificates/view_certificate/23', 1, 3, '2024-02-01 20:04:38', '2024-02-01 20:04:38'),
(141, 'El usuario sistemasaux9@eltemplodelamoda.com.co esta esperando que lo ACTIVES', '05/02/2024 10:54:50', 'http://localhost/dashboard/users', 2, 3, '2024-02-05 15:54:50', '2024-02-05 15:54:50'),
(142, 'Se ha eliminado el acta el cual ibas a recibir', '07/02/2024 10:15:34', 'http://172.21.107.193/dashboard/certificates/view_certificate/23', 1, 3, '2024-02-07 15:15:34', '2024-02-07 15:15:34'),
(143, 'Se ha creado una nueva acta para ti', '07/02/2024 10:16:36', 'http://172.21.107.193/dashboard/certificates/view_certificate/24', 24, 3, '2024-02-07 15:16:36', '2024-02-07 15:16:36'),
(144, 'El acta el cual recibiras se encuentra despachada', '07/02/2024 10:17:02', 'http://172.21.107.193/dashboard/certificates/view_certificate/24', 24, 3, '2024-02-07 15:17:02', '2024-02-07 15:17:02'),
(145, 'Se ha eliminado el acta el cual ibas a recibir', '07/02/2024 10:18:37', 'http://172.21.107.193/dashboard/certificates/view_certificate/24', 24, 3, '2024-02-07 15:18:37', '2024-02-07 15:18:37'),
(146, 'Se ha creado una nueva acta para ti', '07/02/2024 10:19:13', 'http://172.21.107.193/dashboard/certificates/view_certificate/25', 18, 3, '2024-02-07 15:19:13', '2024-02-07 15:19:13'),
(147, 'El acta el cual recibiras se encuentra despachada', '07/02/2024 10:19:31', 'http://172.21.107.193/dashboard/certificates/view_certificate/25', 18, 3, '2024-02-07 15:19:31', '2024-02-07 15:19:31'),
(148, 'Su acta ha sido ENTREGADA con exito!', '07/02/2024 10:22:53', 'http://172.21.107.193/dashboard/certificates/view_certificate/24', 10, 3, '2024-02-07 15:22:53', '2024-02-07 15:22:53'),
(149, 'Su acta ha sido ENTREGADA con exito!', '07/02/2024 10:23:16', 'http://172.21.107.193/dashboard/certificates/view_certificate/25', 10, 3, '2024-02-07 15:23:16', '2024-02-07 15:23:16'),
(150, 'Tienes un nuevo comentario en ticket', '07/02/2024 11:01:33', 'http://172.21.107.193/dashboard/tickets/ticket_detail/59', 1, 4, '2024-02-07 21:17:34', '2024-02-07 16:01:33'),
(151, 'Se ha creado una nueva acta para ti', '08/02/2024 10:35:25', 'http://localhost/dashboard/certificates/view_certificate/26', 1, 3, '2024-02-08 15:35:25', '2024-02-08 15:35:25'),
(152, 'Se ha eliminado el acta el cual ibas a recibir', '08/02/2024 10:36:53', 'http://localhost/dashboard/certificates/view_certificate/26', 1, 3, '2024-02-08 15:36:53', '2024-02-08 15:36:53'),
(153, 'Se ha creado un nuevo ticket para ti', '08/02/2024 12:19:06', 'http://localhost/dashboard/tickets/ticket_detail/60', 1, 3, '2024-02-08 17:19:06', '2024-02-08 17:19:06'),
(154, 'Se ha creado un nuevo ticket para ti', '08/02/2024 12:19:59', 'http://localhost/dashboard/tickets/ticket_detail/61', 10, 3, '2024-02-08 17:19:59', '2024-02-08 17:19:59'),
(155, 'Su ticket ha sido VISTO y esta previo a ejecución', '08/02/2024 12:20:10', 'http://localhost/dashboard/tickets/ticket_detail/61', 10, 3, '2024-02-08 17:20:10', '2024-02-08 17:20:10'),
(156, 'El ticket impuesto para ti ha sido eliminado!', '08/02/2024 12:20:16', 'http://localhost/dashboard/tickets/ticket_detail/61', 10, 4, '2024-02-09 00:15:57', '2024-02-08 17:20:16'),
(157, 'Se ha creado un nuevo ticket para ti', '08/02/2024 12:20:34', 'http://localhost/dashboard/tickets/ticket_detail/62', 1, 3, '2024-02-08 17:20:34', '2024-02-08 17:20:34'),
(158, 'Se ha creado un nuevo ticket para ti', '13/02/2024 15:30:45', 'http://localhost/dashboard/tickets/ticket_detail/63', 10, 3, '2024-02-13 20:30:45', '2024-02-13 20:30:45'),
(159, 'Su ticket ha sido VISTO y esta previo a ejecución', '13/02/2024 15:32:23', 'http://localhost/dashboard/tickets/ticket_detail/63', 1, 4, '2024-02-14 01:32:34', '2024-02-13 20:32:23'),
(160, 'Su ticket ha sido ejecutado', '13/02/2024 15:37:42', 'http://localhost/dashboard/tickets/ticket_detail/63', 1, 3, '2024-02-13 20:37:42', '2024-02-13 20:37:42'),
(161, 'Tienes un nuevo comentario en ticket', '13/02/2024 15:38:51', 'http://localhost/dashboard/tickets/ticket_detail/63', 1, 3, '2024-02-13 20:38:51', '2024-02-13 20:38:51');

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
-- Estructura de tabla para la tabla `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'EFECTIVO', 1, NULL, NULL),
(2, 'TARJETA', 2, NULL, NULL);

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
(1, '30/01/2024 16:14:59', '0', '30/01/2024 17:20:54', '30/01/2024 17:27:24', 10, 1, 23, 'n/A', 1, 1, 10, '2024-01-31 03:29:46', '2024-01-31 02:15:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `image_serie` varchar(500) DEFAULT NULL,
  `accessories` varchar(100) NOT NULL,
  `id_type_component` int(11) NOT NULL,
  `id_state_certificate` int(11) NOT NULL,
  `id_origin_certificate` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `brand`, `serie`, `image_serie`, `accessories`, `id_type_component`, `id_state_certificate`, `id_origin_certificate`, `id_state`, `id_user`, `updated_at`, `created_at`) VALUES
(6, 'PC', 'HP', 'TDM67516', NULL, 'N/A', 1, 1, 1, 1, 1, '2024-02-07 20:22:53', '2024-01-30 20:02:38'),
(7, 'MOUSE', 'HP', 'TDM540457', NULL, 'N/A', 1, 1, 1, 1, 1, '2024-01-31 18:43:51', '2024-01-31 18:43:51'),
(8, 'TECLADO', 'N/a', 'TDM885835', NULL, 'N/A', 1, 2, 2, 1, 1, '2024-02-08 20:36:53', '2024-02-08 20:34:30');

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
(195, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '04/01/2024 15:00:08', '2024-01-04 20:00:08', '2024-01-04 20:00:08'),
(196, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 08:25:45', '2024-01-05 13:25:45', '2024-01-05 13:25:45'),
(197, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 14 para Jhan Carlos Cordoba para la siguiente dirección ', 1, 17, '05/01/2024 08:25:51', '2024-01-05 13:25:51', '2024-01-05 13:25:51'),
(198, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:26:10', '2024-01-05 13:26:10', '2024-01-05 13:26:10'),
(199, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '05/01/2024 08:26:28', '2024-01-05 13:26:28', '2024-01-05 13:26:28'),
(200, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 15 para Jhan Carlos Cordoba para la siguiente dirección Calle 28#86-29', 16, 17, '05/01/2024 08:26:39', '2024-01-05 13:26:39', '2024-01-05 13:26:39'),
(201, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:26:59', '2024-01-05 13:26:59', '2024-01-05 13:26:59'),
(202, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:30:33', '2024-01-05 13:30:33', '2024-01-05 13:30:33'),
(203, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:30:34', '2024-01-05 13:30:34', '2024-01-05 13:30:34'),
(204, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:30:57', '2024-01-05 13:30:57', '2024-01-05 13:30:57'),
(205, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:31:25', '2024-01-05 13:31:25', '2024-01-05 13:31:25'),
(206, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:31:49', '2024-01-05 13:31:49', '2024-01-05 13:31:49'),
(207, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:35:48', '2024-01-05 13:35:48', '2024-01-05 13:35:48'),
(208, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:35:53', '2024-01-05 13:35:53', '2024-01-05 13:35:53'),
(209, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 08:41:36', '2024-01-05 13:41:36', '2024-01-05 13:41:36'),
(210, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '05/01/2024 08:45:05', '2024-01-05 13:45:05', '2024-01-05 13:45:05'),
(211, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:45:52', '2024-01-05 13:45:52', '2024-01-05 13:45:52'),
(212, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 08:46:30', '2024-01-05 13:46:30', '2024-01-05 13:46:30'),
(213, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 08:47:21', '2024-01-05 13:47:21', '2024-01-05 13:47:21'),
(214, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 16 para Jhan Carlos Cordoba para la siguiente dirección ', 1, 17, '05/01/2024 08:47:46', '2024-01-05 13:47:46', '2024-01-05 13:47:46'),
(215, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 08:59:21', '2024-01-05 13:59:21', '2024-01-05 13:59:21'),
(216, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REF6vwz', 1, 18, '05/01/2024 09:04:07', '2024-01-05 14:04:07', '2024-01-05 14:04:07'),
(217, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección calle 28 #86-29', 1, 17, '05/01/2024 09:07:22', '2024-01-05 14:07:22', '2024-01-05 14:07:22'),
(218, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '05/01/2024 09:07:53', '2024-01-05 14:07:53', '2024-01-05 14:07:53'),
(219, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 17 para Jhan Carlos Cordoba para la siguiente dirección calle 28 #86-29', 16, 17, '05/01/2024 09:08:28', '2024-01-05 14:08:28', '2024-01-05 14:08:28'),
(220, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 09:14:06', '2024-01-05 14:14:06', '2024-01-05 14:14:06'),
(221, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 17 para Jhan Carlos Cordoba para la siguiente dirección ', 1, 17, '05/01/2024 09:24:19', '2024-01-05 14:24:19', '2024-01-05 14:24:19'),
(222, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 09:24:48', '2024-01-05 14:24:48', '2024-01-05 14:24:48'),
(223, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '05/01/2024 09:26:37', '2024-01-05 14:26:37', '2024-01-05 14:26:37'),
(224, 'Se han modificado los datos del usuario sistemasaux9@eltemplodelamoda.com.co', 16, 2, '05/01/2024 09:29:26', '2024-01-05 14:29:26', '2024-01-05 14:29:26'),
(225, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 09:29:32', '2024-01-05 14:29:32', '2024-01-05 14:29:32'),
(226, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 18 para Jhan Carlos Cordoba para la siguiente dirección ', 1, 17, '05/01/2024 09:35:52', '2024-01-05 14:35:52', '2024-01-05 14:35:52'),
(227, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección Calle 28#86-29', 1, 17, '05/01/2024 09:36:35', '2024-01-05 14:36:35', '2024-01-05 14:36:35'),
(228, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 19 para Jhan Carlos Cordoba para la siguiente dirección ', 1, 17, '05/01/2024 09:38:09', '2024-01-05 14:38:09', '2024-01-05 14:38:09'),
(229, 'El usuario Jhan Carlos Cordoba ha creado un acta para Anderson Cordoba para la siguiente dirección calle 28 #86-29', 1, 17, '05/01/2024 09:38:35', '2024-01-05 14:38:35', '2024-01-05 14:38:35'),
(230, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 20 para Anderson Cordoba para la siguiente dirección ', 1, 17, '05/01/2024 09:39:38', '2024-01-05 14:39:38', '2024-01-05 14:39:38'),
(231, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REF1mGN', 1, 18, '05/01/2024 09:46:15', '2024-01-05 14:46:15', '2024-01-05 14:46:15'),
(232, 'El usuario Jhan Carlos Cordoba ha creado un acta para Karen Arenas para la siguiente dirección calle 28 #86-29', 1, 17, '05/01/2024 09:49:50', '2024-01-05 14:49:50', '2024-01-05 14:49:50'),
(233, 'El usuario Karen Arenas con correo sistemasaux6@eltemplodelamoda.com.co ha ingresado al sistema', 17, 8, '05/01/2024 10:00:29', '2024-01-05 15:00:29', '2024-01-05 15:00:29'),
(234, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 21 para Karen Arenas para la siguiente dirección ', 1, 17, '05/01/2024 10:04:01', '2024-01-05 15:04:01', '2024-01-05 15:04:01'),
(235, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección calle 28 #86-29', 1, 17, '05/01/2024 10:04:26', '2024-01-05 15:04:26', '2024-01-05 15:04:26'),
(236, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '05/01/2024 10:04:50', '2024-01-05 15:04:50', '2024-01-05 15:04:50'),
(237, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 22 para Jhan Carlos Cordoba para la siguiente dirección calle 28 #86-29', 16, 17, '05/01/2024 10:05:49', '2024-01-05 15:05:49', '2024-01-05 15:05:49'),
(238, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 22 para la siguiente dirección calle 28 #86-29', 1, 17, '05/01/2024 10:07:05', '2024-01-05 15:07:05', '2024-01-05 15:07:05'),
(239, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 10:09:50', '2024-01-05 15:09:50', '2024-01-05 15:09:50'),
(240, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REFPHlu', 1, 18, '05/01/2024 10:11:22', '2024-01-05 15:11:22', '2024-01-05 15:11:22'),
(241, 'El usuario Jerson Henao con correo sistemasaux4@eltemplodelamoda.com.co ha ingresado al sistema', 12, 8, '05/01/2024 10:12:15', '2024-01-05 15:12:15', '2024-01-05 15:12:15'),
(242, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jerson Henao para la siguiente dirección TEMPLO 2 oficina', 1, 17, '05/01/2024 10:13:17', '2024-01-05 15:13:17', '2024-01-05 15:13:17'),
(243, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '05/01/2024 10:13:43', '2024-01-05 15:13:43', '2024-01-05 15:13:43'),
(244, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 23 para Jerson Henao para la siguiente dirección TEMPLO 2 oficina', 16, 17, '05/01/2024 10:14:32', '2024-01-05 15:14:32', '2024-01-05 15:14:32'),
(245, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 23 para la siguiente dirección TEMPLO 2 oficina', 16, 17, '05/01/2024 10:16:03', '2024-01-05 15:16:03', '2024-01-05 15:16:03'),
(246, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 10:58:09', '2024-01-05 15:58:09', '2024-01-05 15:58:09'),
(247, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 10:59:18', '2024-01-05 15:59:18', '2024-01-05 15:59:18'),
(248, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 12:34:25', '2024-01-05 17:34:25', '2024-01-05 17:34:25'),
(249, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 12:47:47', '2024-01-05 17:47:47', '2024-01-05 17:47:47'),
(250, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '05/01/2024 13:11:14', '2024-01-05 18:11:14', '2024-01-05 18:11:14'),
(251, 'Se ha editado el ticket con ID 28', 1, 7, '05/01/2024 13:11:33', '2024-01-05 18:11:33', '2024-01-05 18:11:33'),
(252, 'Se ha creado un nuevo repositorio con llamado feo', 1, 12, '05/01/2024 13:12:39', '2024-01-05 18:12:39', '2024-01-05 18:12:39'),
(253, 'Se ha eliminado un directorio llamado feo con ID 8', 1, 13, '05/01/2024 13:12:46', '2024-01-05 18:12:46', '2024-01-05 18:12:46'),
(254, 'Ha generado un permiso por/para n/a', 1, 9, '05/01/2024 13:13:13', '2024-01-05 18:13:13', '2024-01-05 18:13:13'),
(255, 'Ha generado un permiso por/para N/A', 1, 9, '05/01/2024 13:14:03', '2024-01-05 18:14:03', '2024-01-05 18:14:03'),
(256, 'Ha generado un permiso por/para N/A', 1, 9, '05/01/2024 13:15:28', '2024-01-05 18:15:28', '2024-01-05 18:15:28'),
(257, 'Ha generado un permiso por/para N/A', 1, 9, '05/01/2024 13:16:06', '2024-01-05 18:16:06', '2024-01-05 18:16:06'),
(258, 'Ha generado un permiso por/para N/A', 1, 9, '05/01/2024 13:17:11', '2024-01-05 18:17:11', '2024-01-05 18:17:11'),
(259, 'Ha generado un permiso por/para N/a', 1, 9, '05/01/2024 13:17:43', '2024-01-05 18:17:43', '2024-01-05 18:17:43'),
(260, 'Ha generado un permiso por/para N/a', 1, 9, '05/01/2024 13:18:04', '2024-01-05 18:18:04', '2024-01-05 18:18:04'),
(261, 'Ha generado un permiso por/para N/A', 1, 9, '05/01/2024 13:18:41', '2024-01-05 18:18:41', '2024-01-05 18:18:41'),
(262, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REFWxp1', 1, 18, '05/01/2024 13:20:27', '2024-01-05 18:20:27', '2024-01-05 18:20:27'),
(263, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 13:22:04', '2024-01-05 18:22:04', '2024-01-05 18:22:04'),
(264, 'Ha generado un permiso por/para n/a', 1, 9, '05/01/2024 13:22:55', '2024-01-05 18:22:55', '2024-01-05 18:22:55'),
(265, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 13:23:38', '2024-01-05 18:23:38', '2024-01-05 18:23:38'),
(266, 'Ha generado un permiso por/para N/a', 1, 9, '05/01/2024 13:24:28', '2024-01-05 18:24:28', '2024-01-05 18:24:28'),
(267, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '05/01/2024 13:26:12', '2024-01-05 18:26:12', '2024-01-05 18:26:12'),
(268, 'Ha generado un permiso por/para HBUB', 10, 9, '05/01/2024 13:27:02', '2024-01-05 18:27:02', '2024-01-05 18:27:02'),
(269, 'Se ha eliminado un directorio llamado BASES DE DATOS con ID 7', 1, 13, '05/01/2024 13:29:22', '2024-01-05 18:29:22', '2024-01-05 18:29:22'),
(270, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 28', 10, 7, '05/01/2024 13:41:51', '2024-01-05 18:41:51', '2024-01-05 18:41:51'),
(271, 'El ticket con ID 28 para el usuario sistemasaux8@eltemplodelamoda.com.co ha vencido', 10, 7, '05/01/2024 13:41:51', '2024-01-05 18:41:51', '2024-01-05 18:41:51'),
(272, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 14:43:34', '2024-01-05 19:43:34', '2024-01-05 19:43:34'),
(273, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '05/01/2024 15:04:11', '2024-01-05 20:04:11', '2024-01-05 20:04:11'),
(274, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '05/01/2024 15:05:12', '2024-01-05 20:05:12', '2024-01-05 20:05:12'),
(275, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 15:06:00', '2024-01-05 20:06:00', '2024-01-05 20:06:00'),
(276, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 28', 1, 6, '05/01/2024 15:06:05', '2024-01-05 20:06:05', '2024-01-05 20:06:05'),
(277, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '05/01/2024 15:06:28', '2024-01-05 20:06:28', '2024-01-05 20:06:28'),
(278, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '05/01/2024 15:07:08', '2024-01-05 20:07:08', '2024-01-05 20:07:08'),
(279, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ewrtewr', 10, 4, '05/01/2024 15:08:16', '2024-01-05 20:08:16', '2024-01-05 20:08:16'),
(280, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha eliminado el ticket con id 31', 10, 6, '05/01/2024 15:08:27', '2024-01-05 20:08:27', '2024-01-05 20:08:27'),
(281, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 29', 10, 7, '05/01/2024 15:10:33', '2024-01-05 20:10:33', '2024-01-05 20:10:33'),
(282, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 29', 10, 7, '05/01/2024 15:11:12', '2024-01-05 20:11:12', '2024-01-05 20:11:12'),
(283, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 15:13:01', '2024-01-05 20:13:01', '2024-01-05 20:13:01'),
(284, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 29', 1, 7, '05/01/2024 15:13:13', '2024-01-05 20:13:13', '2024-01-05 20:13:13'),
(285, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '05/01/2024 15:14:25', '2024-01-05 20:14:25', '2024-01-05 20:14:25'),
(286, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 30', 10, 7, '05/01/2024 15:14:39', '2024-01-05 20:14:39', '2024-01-05 20:14:39'),
(287, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado wetewtwe', 10, 4, '05/01/2024 15:19:27', '2024-01-05 20:19:27', '2024-01-05 20:19:27'),
(288, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 30', 10, 7, '05/01/2024 15:59:37', '2024-01-05 20:59:37', '2024-01-05 20:59:37'),
(289, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 16:06:38', '2024-01-05 21:06:38', '2024-01-05 21:06:38'),
(290, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '05/01/2024 16:06:48', '2024-01-05 21:06:48', '2024-01-05 21:06:48'),
(291, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '05/01/2024 16:06:57', '2024-01-05 21:06:57', '2024-01-05 21:06:57'),
(292, 'Ha generado un permiso por/para n/a', 10, 9, '05/01/2024 16:07:55', '2024-01-05 21:07:55', '2024-01-05 21:07:55'),
(293, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 30', 1, 7, '05/01/2024 16:17:58', '2024-01-05 21:17:58', '2024-01-05 21:17:58');
INSERT INTO `reports` (`id`, `description`, `id_user`, `id_report_detail`, `date`, `updated_at`, `created_at`) VALUES
(294, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 30', 1, 7, '05/01/2024 16:19:05', '2024-01-05 21:19:05', '2024-01-05 21:19:05'),
(295, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 30', 1, 7, '05/01/2024 16:19:15', '2024-01-05 21:19:15', '2024-01-05 21:19:15'),
(296, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 30', 1, 7, '05/01/2024 16:19:25', '2024-01-05 21:19:25', '2024-01-05 21:19:25'),
(297, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 30', 1, 7, '05/01/2024 16:19:38', '2024-01-05 21:19:38', '2024-01-05 21:19:38'),
(298, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 30', 1, 7, '05/01/2024 16:20:24', '2024-01-05 21:20:24', '2024-01-05 21:20:24'),
(299, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 30', 1, 7, '05/01/2024 16:20:26', '2024-01-05 21:20:26', '2024-01-05 21:20:26'),
(300, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 30', 1, 7, '05/01/2024 16:20:33', '2024-01-05 21:20:33', '2024-01-05 21:20:33'),
(301, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 16:21:11', '2024-01-05 21:21:11', '2024-01-05 21:21:11'),
(302, 'El usuario jccq12@gmail.com ha visto el ticket con id 32', 1, 7, '05/01/2024 16:21:20', '2024-01-05 21:21:20', '2024-01-05 21:21:20'),
(303, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 32', 1, 7, '05/01/2024 16:21:26', '2024-01-05 21:21:26', '2024-01-05 21:21:26'),
(304, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '05/01/2024 16:27:47', '2024-01-05 21:27:47', '2024-01-05 21:27:47'),
(305, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ACTIVACION MAC', 10, 4, '05/01/2024 16:28:34', '2024-01-05 21:28:34', '2024-01-05 21:28:34'),
(306, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 16:29:00', '2024-01-05 21:29:00', '2024-01-05 21:29:00'),
(307, 'El usuario jccq12@gmail.com ha visto el ticket con id 33', 1, 7, '05/01/2024 16:29:06', '2024-01-05 21:29:06', '2024-01-05 21:29:06'),
(308, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 33', 1, 7, '05/01/2024 16:29:12', '2024-01-05 21:29:12', '2024-01-05 21:29:12'),
(309, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '05/01/2024 16:34:21', '2024-01-05 21:34:21', '2024-01-05 21:34:21'),
(310, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ewrewr ewrwer', 10, 4, '05/01/2024 16:34:41', '2024-01-05 21:34:41', '2024-01-05 21:34:41'),
(311, 'El usuario jccq12@gmail.com ha visto el ticket con id 34', 1, 7, '05/01/2024 16:35:18', '2024-01-05 21:35:18', '2024-01-05 21:35:18'),
(312, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 34', 1, 7, '05/01/2024 16:35:49', '2024-01-05 21:35:49', '2024-01-05 21:35:49'),
(313, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 30', 1, 7, '05/01/2024 16:42:13', '2024-01-05 21:42:13', '2024-01-05 21:42:13'),
(314, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/01/2024 17:12:52', '2024-01-05 22:12:52', '2024-01-05 22:12:52'),
(315, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REFWxp1 con ID 9', 1, 18, '05/01/2024 17:23:24', '2024-01-05 22:23:24', '2024-01-05 22:23:24'),
(316, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '06/01/2024 08:17:50', '2024-01-06 13:17:50', '2024-01-06 13:17:50'),
(317, 'Se ha eliminado un directorio llamado ACTAS SALIDAS con ID 2', 1, 13, '06/01/2024 08:39:35', '2024-01-06 13:39:35', '2024-01-06 13:39:35'),
(318, 'Se ha creado un nuevo repositorio con llamado BASES DE DATOS', 1, 12, '06/01/2024 08:39:45', '2024-01-06 13:39:45', '2024-01-06 13:39:45'),
(319, 'Se ha creado un nuevo archivo con llamado TEMPLO 9 CAJA 9 en el directorio con ID 9', 1, 14, '06/01/2024 08:57:49', '2024-01-06 13:57:49', '2024-01-06 13:57:49'),
(320, 'Se ha eliminado un archivo llamado TEMPLO 9 CAJA 9 con ID 7', 1, 16, '06/01/2024 08:59:35', '2024-01-06 13:59:35', '2024-01-06 13:59:35'),
(321, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '06/01/2024 10:49:36', '2024-01-06 15:49:36', '2024-01-06 15:49:36'),
(322, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 10:50:02', '2024-01-06 15:50:02', '2024-01-06 15:50:02'),
(323, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 10:58:13', '2024-01-06 15:58:13', '2024-01-06 15:58:13'),
(324, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 10:58:40', '2024-01-06 15:58:40', '2024-01-06 15:58:40'),
(325, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 10:59:26', '2024-01-06 15:59:26', '2024-01-06 15:59:26'),
(326, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 10:59:33', '2024-01-06 15:59:33', '2024-01-06 15:59:33'),
(327, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:00:12', '2024-01-06 16:00:12', '2024-01-06 16:00:12'),
(328, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:00:23', '2024-01-06 16:00:23', '2024-01-06 16:00:23'),
(329, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:01:00', '2024-01-06 16:01:00', '2024-01-06 16:01:00'),
(330, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:01:13', '2024-01-06 16:01:13', '2024-01-06 16:01:13'),
(331, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:01:38', '2024-01-06 16:01:38', '2024-01-06 16:01:38'),
(332, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:02:02', '2024-01-06 16:02:02', '2024-01-06 16:02:02'),
(333, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:02:52', '2024-01-06 16:02:52', '2024-01-06 16:02:52'),
(334, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:03:22', '2024-01-06 16:03:22', '2024-01-06 16:03:22'),
(335, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:03:43', '2024-01-06 16:03:43', '2024-01-06 16:03:43'),
(336, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:03:49', '2024-01-06 16:03:49', '2024-01-06 16:03:49'),
(337, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:04:33', '2024-01-06 16:04:33', '2024-01-06 16:04:33'),
(338, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:06:18', '2024-01-06 16:06:18', '2024-01-06 16:06:18'),
(339, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:06:29', '2024-01-06 16:06:29', '2024-01-06 16:06:29'),
(340, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:06:45', '2024-01-06 16:06:45', '2024-01-06 16:06:45'),
(341, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:06:56', '2024-01-06 16:06:56', '2024-01-06 16:06:56'),
(342, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:07:45', '2024-01-06 16:07:45', '2024-01-06 16:07:45'),
(343, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:08:10', '2024-01-06 16:08:10', '2024-01-06 16:08:10'),
(344, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:10:00', '2024-01-06 16:10:00', '2024-01-06 16:10:00'),
(345, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:14:41', '2024-01-06 16:14:41', '2024-01-06 16:14:41'),
(346, 'Se ha eliminado el comentario con ID 45 para el ticket con ID 8', 10, 7, '06/01/2024 11:14:46', '2024-01-06 16:14:46', '2024-01-06 16:14:46'),
(347, 'Se ha eliminado el comentario con ID 44 para el ticket con ID 8', 10, 7, '06/01/2024 11:14:50', '2024-01-06 16:14:50', '2024-01-06 16:14:50'),
(348, 'Se ha eliminado el comentario con ID 43 para el ticket con ID 8', 10, 7, '06/01/2024 11:14:52', '2024-01-06 16:14:52', '2024-01-06 16:14:52'),
(349, 'Se ha eliminado el comentario con ID 42 para el ticket con ID 8', 10, 7, '06/01/2024 11:14:56', '2024-01-06 16:14:56', '2024-01-06 16:14:56'),
(350, 'Se ha eliminado el comentario con ID 41 para el ticket con ID 8', 10, 7, '06/01/2024 11:14:59', '2024-01-06 16:14:59', '2024-01-06 16:14:59'),
(351, 'Se ha eliminado el comentario con ID 40 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:01', '2024-01-06 16:15:01', '2024-01-06 16:15:01'),
(352, 'Se ha eliminado el comentario con ID 39 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:04', '2024-01-06 16:15:04', '2024-01-06 16:15:04'),
(353, 'Se ha eliminado el comentario con ID 38 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:06', '2024-01-06 16:15:06', '2024-01-06 16:15:06'),
(354, 'Se ha eliminado el comentario con ID 37 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:10', '2024-01-06 16:15:10', '2024-01-06 16:15:10'),
(355, 'Se ha eliminado el comentario con ID 36 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:12', '2024-01-06 16:15:12', '2024-01-06 16:15:12'),
(356, 'Se ha eliminado el comentario con ID 35 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:15', '2024-01-06 16:15:15', '2024-01-06 16:15:15'),
(357, 'Se ha eliminado el comentario con ID 34 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:19', '2024-01-06 16:15:19', '2024-01-06 16:15:19'),
(358, 'Se ha eliminado el comentario con ID 33 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:22', '2024-01-06 16:15:22', '2024-01-06 16:15:22'),
(359, 'Se ha eliminado el comentario con ID 32 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:24', '2024-01-06 16:15:24', '2024-01-06 16:15:24'),
(360, 'Se ha eliminado el comentario con ID 31 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:27', '2024-01-06 16:15:27', '2024-01-06 16:15:27'),
(361, 'Se ha eliminado el comentario con ID 30 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:30', '2024-01-06 16:15:30', '2024-01-06 16:15:30'),
(362, 'Se ha eliminado el comentario con ID 29 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:33', '2024-01-06 16:15:33', '2024-01-06 16:15:33'),
(363, 'Se ha eliminado el comentario con ID 28 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:35', '2024-01-06 16:15:35', '2024-01-06 16:15:35'),
(364, 'Se ha eliminado el comentario con ID 22 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:40', '2024-01-06 16:15:40', '2024-01-06 16:15:40'),
(365, 'Se ha eliminado el comentario con ID 27 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:44', '2024-01-06 16:15:44', '2024-01-06 16:15:44'),
(366, 'Se ha eliminado el comentario con ID 26 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:47', '2024-01-06 16:15:47', '2024-01-06 16:15:47'),
(367, 'Se ha eliminado el comentario con ID 25 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:49', '2024-01-06 16:15:49', '2024-01-06 16:15:49'),
(368, 'Se ha eliminado el comentario con ID 24 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:52', '2024-01-06 16:15:52', '2024-01-06 16:15:52'),
(369, 'Se ha eliminado el comentario con ID 23 para el ticket con ID 8', 10, 7, '06/01/2024 11:15:55', '2024-01-06 16:15:55', '2024-01-06 16:15:55'),
(370, 'Ha generado un permiso por/para N/A', 10, 9, '06/01/2024 11:16:24', '2024-01-06 16:16:24', '2024-01-06 16:16:24'),
(371, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:20:24', '2024-01-06 16:20:24', '2024-01-06 16:20:24'),
(372, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:21:58', '2024-01-06 16:21:58', '2024-01-06 16:21:58'),
(373, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:25:21', '2024-01-06 16:25:21', '2024-01-06 16:25:21'),
(374, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:26:40', '2024-01-06 16:26:40', '2024-01-06 16:26:40'),
(375, 'Se ha agregado una calificacion de 4 estrellas para el ticket con ID 8', 10, 7, '06/01/2024 11:27:10', '2024-01-06 16:27:10', '2024-01-06 16:27:10'),
(376, 'Se ha eliminado el comentario con ID 49 para el ticket con ID 8', 10, 7, '06/01/2024 11:27:31', '2024-01-06 16:27:31', '2024-01-06 16:27:31'),
(377, 'Se ha eliminado el comentario con ID 48 para el ticket con ID 8', 10, 7, '06/01/2024 11:27:33', '2024-01-06 16:27:33', '2024-01-06 16:27:33'),
(378, 'Se ha eliminado el comentario con ID 47 para el ticket con ID 8', 10, 7, '06/01/2024 11:27:36', '2024-01-06 16:27:36', '2024-01-06 16:27:36'),
(379, 'Se ha eliminado el comentario con ID 46 para el ticket con ID 8', 10, 7, '06/01/2024 11:27:40', '2024-01-06 16:27:40', '2024-01-06 16:27:40'),
(380, 'Se ha agregado un comentario para el ticket con ID 8', 1, 7, '06/01/2024 11:35:02', '2024-01-06 16:35:02', '2024-01-06 16:35:02'),
(381, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '06/01/2024 11:36:38', '2024-01-06 16:36:38', '2024-01-06 16:36:38'),
(382, 'Se ha agregado un comentario para el ticket con ID 8', 10, 7, '06/01/2024 11:36:54', '2024-01-06 16:36:54', '2024-01-06 16:36:54'),
(383, 'Se ha agregado un comentario para el ticket con ID 8', 10, 7, '06/01/2024 11:37:05', '2024-01-06 16:37:05', '2024-01-06 16:37:05'),
(384, 'Se ha eliminado el comentario con ID 52 para el ticket con ID 8', 1, 7, '06/01/2024 11:45:16', '2024-01-06 16:45:16', '2024-01-06 16:45:16'),
(385, 'Se ha eliminado el comentario con ID 51 para el ticket con ID 8', 1, 7, '06/01/2024 11:45:19', '2024-01-06 16:45:19', '2024-01-06 16:45:19'),
(386, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '06/01/2024 11:57:05', '2024-01-06 16:57:05', '2024-01-06 16:57:05'),
(387, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/01/2024 08:34:34', '2024-01-15 13:34:34', '2024-01-15 13:34:34'),
(388, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/01/2024 10:05:12', '2024-01-15 15:05:12', '2024-01-15 15:05:12'),
(389, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/01/2024 10:42:59', '2024-01-15 15:42:59', '2024-01-15 15:42:59'),
(390, 'El usuario jccq12@gmail.com creo un ticket llamado AYUDA A LEONARDO', 1, 4, '15/01/2024 12:00:51', '2024-01-15 17:00:51', '2024-01-15 17:00:51'),
(391, 'Se ha creado el siguiente usuario sistemasaux11@eltemplodelamoda.com.co', 1, 1, '15/01/2024 12:24:10', '2024-01-15 17:24:10', '2024-01-15 17:24:10'),
(392, 'El usuario Leonardo Dagua con correo sistemasaux11@eltemplodelamoda.com.co ha ingresado al sistema', 19, 8, '15/01/2024 12:25:16', '2024-01-15 17:25:16', '2024-01-15 17:25:16'),
(393, 'Se han modificado los datos del usuario sistemasaux11@eltemplodelamoda.com.co', 19, 2, '15/01/2024 12:26:55', '2024-01-15 17:26:55', '2024-01-15 17:26:55'),
(394, 'Se ha agregado un comentario para el ticket con ID 35', 10, 7, '15/01/2024 12:28:44', '2024-01-15 17:28:44', '2024-01-15 17:28:44'),
(395, 'El usuario Leonardo Dagua con correo sistemasaux11@eltemplodelamoda.com.co ha ingresado al sistema', 19, 8, '15/01/2024 13:38:58', '2024-01-15 18:38:58', '2024-01-15 18:38:58'),
(396, 'El usuario Jhan Carlos Cordoba ha creado un acta para Anderson Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '15/01/2024 13:42:42', '2024-01-15 18:42:42', '2024-01-15 18:42:42'),
(397, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '15/01/2024 13:53:53', '2024-01-15 18:53:53', '2024-01-15 18:53:53'),
(398, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 24 para Anderson Cordoba para la siguiente dirección TEMPLO 2', 16, 17, '15/01/2024 13:54:55', '2024-01-15 18:54:55', '2024-01-15 18:54:55'),
(399, 'El usuario sistemasaux11@eltemplodelamoda.com.co creo un ticket llamado actualizar datos', 19, 4, '15/01/2024 13:59:19', '2024-01-15 18:59:19', '2024-01-15 18:59:19'),
(400, 'El usuario jccq12@gmail.com ha visto el ticket con id 36', 1, 7, '15/01/2024 13:59:36', '2024-01-15 18:59:36', '2024-01-15 18:59:36'),
(401, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 36', 1, 7, '15/01/2024 13:59:44', '2024-01-15 18:59:44', '2024-01-15 18:59:44'),
(402, 'El usuario sistemasaux11@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 36', 19, 7, '15/01/2024 14:00:13', '2024-01-15 19:00:13', '2024-01-15 19:00:13'),
(403, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '15/01/2024 14:06:50', '2024-01-15 19:06:50', '2024-01-15 19:06:50'),
(404, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/01/2024 14:17:35', '2024-01-15 19:17:35', '2024-01-15 19:17:35'),
(405, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/01/2024 14:32:27', '2024-01-15 19:32:27', '2024-01-15 19:32:27'),
(406, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '15/01/2024 14:32:54', '2024-01-15 19:32:54', '2024-01-15 19:32:54'),
(407, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/01/2024 14:40:34', '2024-01-15 19:40:34', '2024-01-15 19:40:34'),
(408, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFWxp1', 1, 18, '15/01/2024 14:49:22', '2024-01-15 19:49:22', '2024-01-15 19:49:22'),
(409, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFPHlu', 1, 18, '15/01/2024 14:49:32', '2024-01-15 19:49:32', '2024-01-15 19:49:32'),
(410, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial REFWxp1', 1, 18, '15/01/2024 14:54:04', '2024-01-15 19:54:04', '2024-01-15 19:54:04'),
(411, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFWxp1', 1, 18, '15/01/2024 14:54:09', '2024-01-15 19:54:09', '2024-01-15 19:54:09'),
(412, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial REFWxp1', 1, 18, '15/01/2024 14:54:13', '2024-01-15 19:54:13', '2024-01-15 19:54:13'),
(413, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REFFnwp', 1, 18, '15/01/2024 15:07:08', '2024-01-15 20:07:08', '2024-01-15 20:07:08'),
(414, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial A22975', 1, 18, '15/01/2024 15:23:33', '2024-01-15 20:23:33', '2024-01-15 20:23:33'),
(415, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REFRkER', 1, 18, '15/01/2024 16:24:42', '2024-01-15 21:24:42', '2024-01-15 21:24:42'),
(416, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/01/2024 16:47:45', '2024-01-15 21:47:45', '2024-01-15 21:47:45'),
(417, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/01/2024 17:14:23', '2024-01-15 22:14:23', '2024-01-15 22:14:23'),
(418, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '16/01/2024 09:46:28', '2024-01-16 14:46:28', '2024-01-16 14:46:28'),
(419, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '16/01/2024 10:25:06', '2024-01-16 15:25:06', '2024-01-16 15:25:06'),
(420, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REF3TNr', 1, 18, '16/01/2024 10:26:05', '2024-01-16 15:26:05', '2024-01-16 15:26:05'),
(421, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REF95E7', 1, 18, '16/01/2024 10:31:25', '2024-01-16 15:31:25', '2024-01-16 15:31:25'),
(422, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REF95E7', 1, 18, '16/01/2024 10:36:58', '2024-01-16 15:36:58', '2024-01-16 15:36:58'),
(423, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial REF95E7', 1, 18, '16/01/2024 10:46:17', '2024-01-16 15:46:17', '2024-01-16 15:46:17'),
(424, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REF95E7 con ID 1', 1, 18, '16/01/2024 10:47:20', '2024-01-16 15:47:20', '2024-01-16 15:47:20'),
(425, 'El usuario Jhan Carlos Cordoba ha creado un acta para Leonardo Dagua para la siguiente dirección Templo 2', 1, 17, '16/01/2024 11:14:50', '2024-01-16 16:14:50', '2024-01-16 16:14:50'),
(426, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 1 para Leonardo Dagua para la siguiente dirección ', 1, 17, '16/01/2024 11:21:39', '2024-01-16 16:21:39', '2024-01-16 16:21:39'),
(427, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial 00008632110050638985', 1, 18, '16/01/2024 11:23:20', '2024-01-16 16:23:20', '2024-01-16 16:23:20'),
(428, 'El usuario Jhan Carlos Cordoba ha creado un acta para Leonardo Dagua para la siguiente dirección Templo 2', 1, 17, '16/01/2024 12:01:20', '2024-01-16 17:01:20', '2024-01-16 17:01:20'),
(429, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REFe3xz', 1, 18, '16/01/2024 12:10:42', '2024-01-16 17:10:42', '2024-01-16 17:10:42'),
(430, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 2 para Leonardo Dagua para la siguiente dirección ', 1, 17, '16/01/2024 12:16:07', '2024-01-16 17:16:07', '2024-01-16 17:16:07'),
(431, 'El usuario Jhan Carlos Cordoba ha creado un acta para Leonardo Dagua para la siguiente dirección TEMPLO 2', 1, 17, '16/01/2024 12:16:51', '2024-01-16 17:16:51', '2024-01-16 17:16:51'),
(432, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REFe3xz con ID 3', 1, 18, '16/01/2024 12:23:50', '2024-01-16 17:23:50', '2024-01-16 17:23:50'),
(433, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REFe3xz con ID 3', 1, 18, '16/01/2024 12:24:18', '2024-01-16 17:24:18', '2024-01-16 17:24:18'),
(434, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REFe3xz con ID 3', 1, 18, '16/01/2024 12:25:33', '2024-01-16 17:25:33', '2024-01-16 17:25:33'),
(435, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REFe3xz con ID 3', 1, 18, '16/01/2024 12:25:40', '2024-01-16 17:25:40', '2024-01-16 17:25:40'),
(436, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '16/01/2024 14:05:05', '2024-01-16 19:05:05', '2024-01-16 19:05:05'),
(437, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '16/01/2024 14:28:10', '2024-01-16 19:28:10', '2024-01-16 19:28:10'),
(438, 'El usuario Jhan Carlos Cordoba ha creado un acta para Anderson Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '16/01/2024 14:32:45', '2024-01-16 19:32:45', '2024-01-16 19:32:45'),
(439, 'El usuario Jhan Carlos Cordoba ha Despachado los componentes asignados al acta con ID 4 para Anderson Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '16/01/2024 14:34:51', '2024-01-16 19:34:51', '2024-01-16 19:34:51'),
(440, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 3 para Leonardo Dagua para la siguiente dirección ', 1, 17, '16/01/2024 16:07:04', '2024-01-16 21:07:04', '2024-01-16 21:07:04'),
(441, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '16/01/2024 16:15:55', '2024-01-16 21:15:55', '2024-01-16 21:15:55'),
(442, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '16/01/2024 17:13:18', '2024-01-16 22:13:18', '2024-01-16 22:13:18'),
(443, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '16/01/2024 17:16:18', '2024-01-16 22:16:18', '2024-01-16 22:16:18'),
(444, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 08:13:15', '2024-01-17 13:13:15', '2024-01-17 13:13:15'),
(445, 'El usuario Jhan Carlos Cordoba ha Despachado los componentes asignados al acta con ID 6 para RODRIGO para la siguiente dirección TEMPLO 2', 1, 17, '17/01/2024 08:36:17', '2024-01-17 13:36:17', '2024-01-17 13:36:17'),
(446, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 6 para RODRIGO para la siguiente dirección ', 1, 17, '17/01/2024 08:39:21', '2024-01-17 13:39:21', '2024-01-17 13:39:21'),
(447, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '17/01/2024 08:40:09', '2024-01-17 13:40:09', '2024-01-17 13:40:09'),
(448, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 5 para PC COM para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 08:40:23', '2024-01-17 13:40:23', '2024-01-17 13:40:23'),
(449, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 5 para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 08:40:38', '2024-01-17 13:40:38', '2024-01-17 13:40:38'),
(450, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 7 para Leonardo para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 08:45:42', '2024-01-17 13:45:42', '2024-01-17 13:45:42'),
(451, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 7 para Leonardo para la siguiente dirección ', 1, 17, '17/01/2024 08:46:23', '2024-01-17 13:46:23', '2024-01-17 13:46:23'),
(452, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 8 para PC COM para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 08:47:40', '2024-01-17 13:47:40', '2024-01-17 13:47:40'),
(453, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 8 para PC COM para la siguiente dirección ', 1, 17, '17/01/2024 08:50:09', '2024-01-17 13:50:09', '2024-01-17 13:50:09'),
(454, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 9 para PC COM para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 08:50:48', '2024-01-17 13:50:48', '2024-01-17 13:50:48'),
(455, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 9 para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 08:51:16', '2024-01-17 13:51:16', '2024-01-17 13:51:16'),
(456, 'El usuario Jhan Carlos Cordoba ha creado un acta para Leonardo Dagua para la siguiente dirección TEMPLO 2', 1, 17, '17/01/2024 09:16:21', '2024-01-17 14:16:21', '2024-01-17 14:16:21'),
(457, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 10 para Leonardo Dagua para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 09:19:02', '2024-01-17 14:19:02', '2024-01-17 14:19:02'),
(458, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 10 para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 09:20:36', '2024-01-17 14:20:36', '2024-01-17 14:20:36'),
(459, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '17/01/2024 09:22:00', '2024-01-17 14:22:00', '2024-01-17 14:22:00'),
(460, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 11 para Jhan Carlos Cordoba para la siguiente dirección ', 1, 17, '17/01/2024 09:22:52', '2024-01-17 14:22:52', '2024-01-17 14:22:52'),
(461, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '17/01/2024 09:25:38', '2024-01-17 14:25:38', '2024-01-17 14:25:38'),
(462, 'El usuario Jhan Carlos  Cordoba Quiñonez ha Despachado los componentes asignados al acta con ID 12 para Jhan Carlos Cordoba para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 09:26:22', '2024-01-17 14:26:22', '2024-01-17 14:26:22'),
(463, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 12 para la siguiente dirección TEMPLO 2', 16, 17, '17/01/2024 09:26:43', '2024-01-17 14:26:43', '2024-01-17 14:26:43'),
(464, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial 00008632110050638985', 1, 18, '17/01/2024 09:27:03', '2024-01-17 14:27:03', '2024-01-17 14:27:03'),
(465, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial 00008632110050638985', 1, 18, '17/01/2024 09:27:10', '2024-01-17 14:27:10', '2024-01-17 14:27:10'),
(466, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFe3xz', 1, 18, '17/01/2024 09:28:29', '2024-01-17 14:28:29', '2024-01-17 14:28:29'),
(467, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial REFe3xz', 1, 18, '17/01/2024 09:28:36', '2024-01-17 14:28:36', '2024-01-17 14:28:36'),
(468, 'Ha generado un permiso por/para N/A', 1, 9, '17/01/2024 09:35:17', '2024-01-17 14:35:17', '2024-01-17 14:35:17'),
(469, 'El jefe Jhan Carlos Cordoba ha aprovado el permiso del colaborador Jhan Carlos Cordoba ', 1, 9, '17/01/2024 09:35:26', '2024-01-17 14:35:26', '2024-01-17 14:35:26'),
(470, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '17/01/2024 10:04:04', '2024-01-17 15:04:04', '2024-01-17 15:04:04'),
(471, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 10:35:54', '2024-01-17 15:35:54', '2024-01-17 15:35:54'),
(472, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 10:57:35', '2024-01-17 15:57:35', '2024-01-17 15:57:35'),
(473, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 10:58:26', '2024-01-17 15:58:26', '2024-01-17 15:58:26'),
(474, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 11:07:44', '2024-01-17 16:07:44', '2024-01-17 16:07:44'),
(475, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '17/01/2024 11:34:35', '2024-01-17 16:34:35', '2024-01-17 16:34:35'),
(476, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 11:36:10', '2024-01-17 16:36:10', '2024-01-17 16:36:10'),
(477, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 11:53:20', '2024-01-17 16:53:20', '2024-01-17 16:53:20'),
(478, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 11:56:43', '2024-01-17 16:56:43', '2024-01-17 16:56:43'),
(479, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '17/01/2024 11:57:09', '2024-01-17 16:57:09', '2024-01-17 16:57:09'),
(480, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '17/01/2024 11:57:42', '2024-01-17 16:57:42', '2024-01-17 16:57:42'),
(481, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '17/01/2024 11:59:14', '2024-01-17 16:59:14', '2024-01-17 16:59:14'),
(482, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado Jhan Carlos', 10, 4, '17/01/2024 12:05:23', '2024-01-17 17:05:23', '2024-01-17 17:05:23'),
(483, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 12:08:28', '2024-01-17 17:08:28', '2024-01-17 17:08:28'),
(484, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '17/01/2024 12:17:03', '2024-01-17 17:17:03', '2024-01-17 17:17:03'),
(485, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asdsads', 10, 4, '17/01/2024 12:19:12', '2024-01-17 17:19:12', '2024-01-17 17:19:12'),
(486, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '17/01/2024 12:20:41', '2024-01-17 17:20:41', '2024-01-17 17:20:41'),
(487, 'El usuario jccq12@gmail.com creo un ticket llamado werewre', 1, 4, '17/01/2024 12:21:11', '2024-01-17 17:21:11', '2024-01-17 17:21:11'),
(488, 'El usuario jccq12@gmail.com creo un ticket llamado sadas', 1, 4, '17/01/2024 12:24:50', '2024-01-17 17:24:50', '2024-01-17 17:24:50'),
(489, 'El usuario jccq12@gmail.com creo un ticket llamado adasd', 1, 4, '17/01/2024 12:27:58', '2024-01-17 17:27:58', '2024-01-17 17:27:58'),
(490, 'El usuario jccq12@gmail.com creo un ticket llamado adasd', 1, 4, '17/01/2024 13:55:43', '2024-01-17 18:55:43', '2024-01-17 18:55:43'),
(491, 'El usuario jccq12@gmail.com creo un ticket llamado afasf', 1, 4, '17/01/2024 13:58:03', '2024-01-17 18:58:03', '2024-01-17 18:58:03'),
(492, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 37', 1, 6, '17/01/2024 13:58:15', '2024-01-17 18:58:15', '2024-01-17 18:58:15'),
(493, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 38', 1, 6, '17/01/2024 13:58:20', '2024-01-17 18:58:20', '2024-01-17 18:58:20'),
(494, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 39', 1, 6, '17/01/2024 13:58:29', '2024-01-17 18:58:29', '2024-01-17 18:58:29'),
(495, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 41', 1, 6, '17/01/2024 13:58:35', '2024-01-17 18:58:35', '2024-01-17 18:58:35'),
(496, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 43', 1, 6, '17/01/2024 13:58:39', '2024-01-17 18:58:39', '2024-01-17 18:58:39'),
(497, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 44', 1, 6, '17/01/2024 13:58:44', '2024-01-17 18:58:44', '2024-01-17 18:58:44'),
(498, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 45', 1, 6, '17/01/2024 13:58:49', '2024-01-17 18:58:49', '2024-01-17 18:58:49'),
(499, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 46', 1, 6, '17/01/2024 13:58:53', '2024-01-17 18:58:53', '2024-01-17 18:58:53'),
(500, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 47', 1, 6, '17/01/2024 13:58:58', '2024-01-17 18:58:58', '2024-01-17 18:58:58'),
(501, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado adasd', 10, 4, '17/01/2024 14:03:10', '2024-01-17 19:03:10', '2024-01-17 19:03:10'),
(502, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asdasdsa', 10, 4, '17/01/2024 14:05:38', '2024-01-17 19:05:38', '2024-01-17 19:05:38'),
(503, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 14:10:36', '2024-01-17 19:10:36', '2024-01-17 19:10:36'),
(504, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '17/01/2024 14:11:06', '2024-01-17 19:11:06', '2024-01-17 19:11:06'),
(505, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado sdasdsa', 10, 4, '17/01/2024 14:12:09', '2024-01-17 19:12:09', '2024-01-17 19:12:09'),
(506, 'El usuario jccq12@gmail.com creo un ticket llamado adssad', 1, 4, '17/01/2024 14:20:24', '2024-01-17 19:20:24', '2024-01-17 19:20:24'),
(507, 'El usuario jccq12@gmail.com creo un ticket llamado adssad', 1, 4, '17/01/2024 14:21:45', '2024-01-17 19:21:45', '2024-01-17 19:21:45'),
(508, 'El usuario jccq12@gmail.com creo un ticket llamado adssad', 1, 4, '17/01/2024 14:21:52', '2024-01-17 19:21:52', '2024-01-17 19:21:52'),
(509, 'El usuario jccq12@gmail.com creo un ticket llamado adssad', 1, 4, '17/01/2024 14:22:04', '2024-01-17 19:22:04', '2024-01-17 19:22:04'),
(510, 'El usuario jccq12@gmail.com creo un ticket llamado dasd', 1, 4, '17/01/2024 14:25:03', '2024-01-17 19:25:03', '2024-01-17 19:25:03'),
(511, 'El usuario jccq12@gmail.com creo un ticket llamado adsad', 1, 4, '17/01/2024 14:28:36', '2024-01-17 19:28:36', '2024-01-17 19:28:36'),
(512, 'El usuario jccq12@gmail.com creo un ticket llamado assa', 1, 4, '17/01/2024 14:30:03', '2024-01-17 19:30:03', '2024-01-17 19:30:03'),
(513, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 14:32:52', '2024-01-17 19:32:52', '2024-01-17 19:32:52'),
(514, 'El usuario jccq12@gmail.com creo un ticket llamado sasdsa', 1, 4, '17/01/2024 15:16:45', '2024-01-17 20:16:45', '2024-01-17 20:16:45'),
(515, 'El usuario jccq12@gmail.com creo un ticket llamado asfa', 1, 4, '17/01/2024 15:17:59', '2024-01-17 20:17:59', '2024-01-17 20:17:59'),
(516, 'El usuario jccq12@gmail.com creo un ticket llamado asdsad', 1, 4, '17/01/2024 15:18:32', '2024-01-17 20:18:32', '2024-01-17 20:18:32'),
(517, 'El usuario jccq12@gmail.com creo un ticket llamado asdad', 1, 4, '17/01/2024 15:21:07', '2024-01-17 20:21:07', '2024-01-17 20:21:07'),
(518, 'El usuario jccq12@gmail.com creo un ticket llamado asdad', 1, 4, '17/01/2024 15:21:22', '2024-01-17 20:21:22', '2024-01-17 20:21:22'),
(519, 'El usuario jccq12@gmail.com creo un ticket llamado asda', 1, 4, '17/01/2024 15:31:35', '2024-01-17 20:31:35', '2024-01-17 20:31:35'),
(520, 'El usuario jccq12@gmail.com creo un ticket llamado adssad', 1, 4, '17/01/2024 15:42:03', '2024-01-17 20:42:03', '2024-01-17 20:42:03'),
(521, 'El usuario jccq12@gmail.com creo un ticket llamado asdas', 1, 4, '17/01/2024 15:42:29', '2024-01-17 20:42:29', '2024-01-17 20:42:29'),
(522, 'El usuario jccq12@gmail.com creo un ticket llamado asdsa', 1, 4, '17/01/2024 16:11:06', '2024-01-17 21:11:06', '2024-01-17 21:11:06'),
(523, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asdsad', 10, 4, '17/01/2024 16:11:58', '2024-01-17 21:11:58', '2024-01-17 21:11:58'),
(524, 'El usuario jccq12@gmail.com ha visto el ticket con id 67', 1, 7, '17/01/2024 16:12:14', '2024-01-17 21:12:14', '2024-01-17 21:12:14'),
(525, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asdsad', 10, 4, '17/01/2024 16:16:02', '2024-01-17 21:16:02', '2024-01-17 21:16:02'),
(526, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado rewrewr', 10, 4, '17/01/2024 16:16:53', '2024-01-17 21:16:53', '2024-01-17 21:16:53'),
(527, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ertert', 10, 4, '17/01/2024 16:17:50', '2024-01-17 21:17:50', '2024-01-17 21:17:50'),
(528, 'El usuario jccq12@gmail.com ha visto el ticket con id 70', 1, 7, '17/01/2024 16:18:26', '2024-01-17 21:18:26', '2024-01-17 21:18:26'),
(529, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '17/01/2024 16:20:40', '2024-01-17 21:20:40', '2024-01-17 21:20:40'),
(530, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asdas', 10, 4, '17/01/2024 16:21:23', '2024-01-17 21:21:23', '2024-01-17 21:21:23'),
(531, 'El usuario jccq12@gmail.com ha visto el ticket con id 71', 1, 7, '17/01/2024 16:22:08', '2024-01-17 21:22:08', '2024-01-17 21:22:08'),
(532, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '17/01/2024 16:24:46', '2024-01-17 21:24:46', '2024-01-17 21:24:46'),
(533, 'El usuario jccq12@gmail.com creo un ticket llamado Shhsha', 1, 4, '17/01/2024 16:25:24', '2024-01-17 21:25:24', '2024-01-17 21:25:24'),
(534, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 72', 10, 7, '17/01/2024 16:25:39', '2024-01-17 21:25:39', '2024-01-17 21:25:39'),
(535, 'El usuario jccq12@gmail.com creo un ticket llamado Chevere', 1, 4, '17/01/2024 16:59:03', '2024-01-17 21:59:03', '2024-01-17 21:59:03'),
(536, 'El usuario jccq12@gmail.com ha visto el ticket con id 68', 1, 7, '17/01/2024 16:59:34', '2024-01-17 21:59:34', '2024-01-17 21:59:34'),
(537, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '18/01/2024 08:10:47', '2024-01-18 13:10:47', '2024-01-18 13:10:47'),
(538, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '18/01/2024 08:48:43', '2024-01-18 13:48:43', '2024-01-18 13:48:43'),
(539, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '18/01/2024 08:49:44', '2024-01-18 13:49:44', '2024-01-18 13:49:44'),
(540, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado adsad', 10, 4, '18/01/2024 08:50:06', '2024-01-18 13:50:06', '2024-01-18 13:50:06'),
(541, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ADSAD', 10, 4, '18/01/2024 08:52:37', '2024-01-18 13:52:37', '2024-01-18 13:52:37'),
(542, 'El usuario jccq12@gmail.com ha visto el ticket con id 1', 1, 7, '18/01/2024 08:52:46', '2024-01-18 13:52:46', '2024-01-18 13:52:46'),
(543, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ASDSAD', 10, 4, '18/01/2024 08:54:12', '2024-01-18 13:54:12', '2024-01-18 13:54:12'),
(544, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ASDSAD', 10, 4, '18/01/2024 08:54:34', '2024-01-18 13:54:34', '2024-01-18 13:54:34'),
(545, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asdad', 10, 4, '18/01/2024 09:18:57', '2024-01-18 14:18:57', '2024-01-18 14:18:57'),
(546, 'El usuario jccq12@gmail.com ha visto el ticket con id 2', 1, 7, '18/01/2024 09:19:17', '2024-01-18 14:19:17', '2024-01-18 14:19:17'),
(547, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 2', 1, 7, '18/01/2024 09:19:22', '2024-01-18 14:19:22', '2024-01-18 14:19:22'),
(548, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 1', 1, 7, '18/01/2024 09:21:18', '2024-01-18 14:21:18', '2024-01-18 14:21:18'),
(549, 'El usuario jccq12@gmail.com ha visto el ticket con id 3', 1, 7, '18/01/2024 09:26:20', '2024-01-18 14:26:20', '2024-01-18 14:26:20'),
(550, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 3', 1, 7, '18/01/2024 09:28:31', '2024-01-18 14:28:31', '2024-01-18 14:28:31'),
(551, 'El usuario sistemasaux8@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 3', 10, 7, '18/01/2024 09:28:51', '2024-01-18 14:28:51', '2024-01-18 14:28:51'),
(552, 'El usuario jccq12@gmail.com ha visto el ticket con id 4', 1, 7, '18/01/2024 09:29:13', '2024-01-18 14:29:13', '2024-01-18 14:29:13'),
(553, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 4', 1, 7, '18/01/2024 09:29:23', '2024-01-18 14:29:23', '2024-01-18 14:29:23'),
(554, 'El usuario sistemasaux8@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 4', 10, 7, '18/01/2024 09:31:44', '2024-01-18 14:31:44', '2024-01-18 14:31:44'),
(555, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha eliminado el ticket con id 1', 10, 6, '18/01/2024 09:38:38', '2024-01-18 14:38:38', '2024-01-18 14:38:38'),
(556, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha eliminado el ticket con id 2', 10, 6, '18/01/2024 09:39:44', '2024-01-18 14:39:44', '2024-01-18 14:39:44'),
(557, 'El usuario jccq12@gmail.com creo un ticket llamado rewre', 1, 4, '18/01/2024 09:41:29', '2024-01-18 14:41:29', '2024-01-18 14:41:29'),
(558, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 5', 10, 7, '18/01/2024 09:41:34', '2024-01-18 14:41:34', '2024-01-18 14:41:34'),
(559, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 5', 10, 7, '18/01/2024 09:41:53', '2024-01-18 14:41:53', '2024-01-18 14:41:53'),
(560, 'Se ha editado el ticket con ID 5', 10, 7, '18/01/2024 09:42:14', '2024-01-18 14:42:14', '2024-01-18 14:42:14'),
(561, 'Se ha editado el ticket con ID 5', 10, 7, '18/01/2024 09:42:39', '2024-01-18 14:42:39', '2024-01-18 14:42:39'),
(562, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 5', 1, 7, '18/01/2024 09:43:02', '2024-01-18 14:43:02', '2024-01-18 14:43:02'),
(563, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado dadsad', 10, 4, '18/01/2024 10:09:11', '2024-01-18 15:09:11', '2024-01-18 15:09:11'),
(564, 'El usuario jccq12@gmail.com ha visto el ticket con id 6', 1, 7, '18/01/2024 10:11:24', '2024-01-18 15:11:24', '2024-01-18 15:11:24'),
(565, 'El usuario jccq12@gmail.com ha visto el ticket con id 6', 1, 7, '18/01/2024 10:13:43', '2024-01-18 15:13:43', '2024-01-18 15:13:43'),
(566, 'El usuario jccq12@gmail.com ha visto el ticket con id 6', 1, 7, '18/01/2024 10:16:41', '2024-01-18 15:16:41', '2024-01-18 15:16:41'),
(567, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 6', 1, 7, '18/01/2024 10:16:50', '2024-01-18 15:16:50', '2024-01-18 15:16:50'),
(568, 'El usuario sistemasaux8@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 6', 10, 7, '18/01/2024 10:18:59', '2024-01-18 15:18:59', '2024-01-18 15:18:59'),
(569, 'El usuario jccq12@gmail.com creo un ticket llamado asda', 1, 4, '18/01/2024 10:21:43', '2024-01-18 15:21:43', '2024-01-18 15:21:43'),
(570, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 7', 10, 7, '18/01/2024 10:21:57', '2024-01-18 15:21:57', '2024-01-18 15:21:57'),
(571, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 10:53:36', '2024-01-18 15:53:36', '2024-01-18 15:53:36'),
(572, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '18/01/2024 11:26:27', '2024-01-18 16:26:27', '2024-01-18 16:26:27'),
(573, 'El usuario Jerson Henao con correo sistemasaux4@eltemplodelamoda.com.co ha ingresado al sistema', 12, 8, '18/01/2024 11:27:28', '2024-01-18 16:27:28', '2024-01-18 16:27:28'),
(574, 'El usuario sistemasaux4@eltemplodelamoda.com.co creo un ticket llamado asdsad', 12, 4, '18/01/2024 11:27:49', '2024-01-18 16:27:49', '2024-01-18 16:27:49'),
(575, 'El usuario jccq12@gmail.com ha visto el ticket con id 8', 1, 7, '18/01/2024 11:44:50', '2024-01-18 16:44:50', '2024-01-18 16:44:50'),
(576, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '18/01/2024 12:21:15', '2024-01-18 17:21:15', '2024-01-18 17:21:15'),
(577, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '18/01/2024 12:22:24', '2024-01-18 17:22:24', '2024-01-18 17:22:24'),
(578, 'El usuario jccq12@gmail.com creo un ticket llamado Activar', 1, 4, '18/01/2024 12:23:17', '2024-01-18 17:23:17', '2024-01-18 17:23:17'),
(579, 'El usuario sistemasaux2@eltemplodelamoda.com.co ha visto el ticket con id 9', 18, 7, '18/01/2024 12:23:27', '2024-01-18 17:23:27', '2024-01-18 17:23:27'),
(580, 'El usuario sistemasaux2@eltemplodelamoda.com.co inicio la ejecución del ticket con id 9', 18, 7, '18/01/2024 12:23:53', '2024-01-18 17:23:53', '2024-01-18 17:23:53'),
(581, 'Se ha agregado un comentario para el ticket con ID 9', 1, 7, '18/01/2024 12:24:10', '2024-01-18 17:24:10', '2024-01-18 17:24:10'),
(582, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 9', 1, 7, '18/01/2024 12:24:38', '2024-01-18 17:24:38', '2024-01-18 17:24:38'),
(583, 'El usuario jccq12@gmail.com Re abrio el ticket con id 9', 1, 11, '18/01/2024 12:24:51', '2024-01-18 17:24:51', '2024-01-18 17:24:51'),
(584, 'El usuario jccq12@gmail.com creo un ticket llamado Jshshs', 1, 4, '18/01/2024 12:25:35', '2024-01-18 17:25:35', '2024-01-18 17:25:35'),
(585, 'El usuario sistemasaux2@eltemplodelamoda.com.co ha visto el ticket con id 10', 18, 7, '18/01/2024 12:25:43', '2024-01-18 17:25:43', '2024-01-18 17:25:43'),
(586, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 10', 1, 6, '18/01/2024 12:25:56', '2024-01-18 17:25:56', '2024-01-18 17:25:56'),
(587, 'El usuario sistemasaux2@eltemplodelamoda.com.co ha visto el ticket con id 9', 18, 7, '18/01/2024 12:29:19', '2024-01-18 17:29:19', '2024-01-18 17:29:19'),
(588, 'El usuario sistemasaux4@eltemplodelamoda.com.co ha eliminado el ticket con id 8', 12, 6, '18/01/2024 13:23:52', '2024-01-18 18:23:52', '2024-01-18 18:23:52'),
(589, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 7', 10, 7, '18/01/2024 13:38:30', '2024-01-18 18:38:30', '2024-01-18 18:38:30'),
(590, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 7', 1, 7, '18/01/2024 14:01:37', '2024-01-18 19:01:37', '2024-01-18 19:01:37'),
(591, 'El usuario jccq12@gmail.com Re abrio el ticket con id 7', 1, 11, '18/01/2024 14:06:47', '2024-01-18 19:06:47', '2024-01-18 19:06:47'),
(592, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 7', 10, 7, '18/01/2024 14:07:06', '2024-01-18 19:07:06', '2024-01-18 19:07:06'),
(593, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 7', 10, 7, '18/01/2024 14:07:32', '2024-01-18 19:07:32', '2024-01-18 19:07:32'),
(594, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 7', 1, 7, '18/01/2024 14:08:17', '2024-01-18 19:08:17', '2024-01-18 19:08:17'),
(595, 'El usuario jccq12@gmail.com Re abrio el ticket con id 7', 1, 11, '18/01/2024 14:09:28', '2024-01-18 19:09:28', '2024-01-18 19:09:28'),
(596, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 7', 10, 7, '18/01/2024 14:09:54', '2024-01-18 19:09:54', '2024-01-18 19:09:54'),
(597, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 7', 10, 7, '18/01/2024 14:10:16', '2024-01-18 19:10:16', '2024-01-18 19:10:16'),
(598, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 7', 1, 7, '18/01/2024 14:11:02', '2024-01-18 19:11:02', '2024-01-18 19:11:02'),
(599, 'El usuario jccq12@gmail.com Re abrio el ticket con id 7', 1, 11, '18/01/2024 14:11:35', '2024-01-18 19:11:35', '2024-01-18 19:11:35'),
(600, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 7', 10, 7, '18/01/2024 14:11:39', '2024-01-18 19:11:39', '2024-01-18 19:11:39'),
(601, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 7', 10, 7, '18/01/2024 14:12:40', '2024-01-18 19:12:40', '2024-01-18 19:12:40'),
(602, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 7', 1, 7, '18/01/2024 14:13:15', '2024-01-18 19:13:15', '2024-01-18 19:13:15'),
(603, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:19:26', '2024-01-18 19:19:26', '2024-01-18 19:19:26'),
(604, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:19:57', '2024-01-18 19:19:57', '2024-01-18 19:19:57');
INSERT INTO `reports` (`id`, `description`, `id_user`, `id_report_detail`, `date`, `updated_at`, `created_at`) VALUES
(605, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:21:36', '2024-01-18 19:21:36', '2024-01-18 19:21:36'),
(606, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:23:07', '2024-01-18 19:23:07', '2024-01-18 19:23:07'),
(607, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 14:46:17', '2024-01-18 19:46:17', '2024-01-18 19:46:17'),
(608, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:49:39', '2024-01-18 19:49:39', '2024-01-18 19:49:39'),
(609, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:51:21', '2024-01-18 19:51:21', '2024-01-18 19:51:21'),
(610, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:51:53', '2024-01-18 19:51:53', '2024-01-18 19:51:53'),
(611, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:52:03', '2024-01-18 19:52:03', '2024-01-18 19:52:03'),
(612, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:54:22', '2024-01-18 19:54:22', '2024-01-18 19:54:22'),
(613, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 14:55:32', '2024-01-18 19:55:32', '2024-01-18 19:55:32'),
(614, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:56:59', '2024-01-18 19:56:59', '2024-01-18 19:56:59'),
(615, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:57:22', '2024-01-18 19:57:22', '2024-01-18 19:57:22'),
(616, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:57:46', '2024-01-18 19:57:46', '2024-01-18 19:57:46'),
(617, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:58:03', '2024-01-18 19:58:03', '2024-01-18 19:58:03'),
(618, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:58:22', '2024-01-18 19:58:22', '2024-01-18 19:58:22'),
(619, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:58:48', '2024-01-18 19:58:48', '2024-01-18 19:58:48'),
(620, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:59:14', '2024-01-18 19:59:14', '2024-01-18 19:59:14'),
(621, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:59:34', '2024-01-18 19:59:34', '2024-01-18 19:59:34'),
(622, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 14:59:36', '2024-01-18 19:59:36', '2024-01-18 19:59:36'),
(623, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:00:13', '2024-01-18 20:00:13', '2024-01-18 20:00:13'),
(624, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:01:11', '2024-01-18 20:01:11', '2024-01-18 20:01:11'),
(625, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:01:48', '2024-01-18 20:01:48', '2024-01-18 20:01:48'),
(626, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:02:14', '2024-01-18 20:02:14', '2024-01-18 20:02:14'),
(627, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:05:38', '2024-01-18 20:05:38', '2024-01-18 20:05:38'),
(628, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:06:54', '2024-01-18 20:06:54', '2024-01-18 20:06:54'),
(629, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:09:24', '2024-01-18 20:09:24', '2024-01-18 20:09:24'),
(630, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:09:35', '2024-01-18 20:09:35', '2024-01-18 20:09:35'),
(631, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:12:47', '2024-01-18 20:12:47', '2024-01-18 20:12:47'),
(632, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:15:22', '2024-01-18 20:15:22', '2024-01-18 20:15:22'),
(633, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:15:41', '2024-01-18 20:15:41', '2024-01-18 20:15:41'),
(634, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:16:15', '2024-01-18 20:16:15', '2024-01-18 20:16:15'),
(635, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:17:03', '2024-01-18 20:17:03', '2024-01-18 20:17:03'),
(636, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:17:08', '2024-01-18 20:17:08', '2024-01-18 20:17:08'),
(637, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:17:18', '2024-01-18 20:17:18', '2024-01-18 20:17:18'),
(638, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:17:30', '2024-01-18 20:17:30', '2024-01-18 20:17:30'),
(639, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:19:20', '2024-01-18 20:19:20', '2024-01-18 20:19:20'),
(640, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:44:58', '2024-01-18 20:44:58', '2024-01-18 20:44:58'),
(641, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:45:58', '2024-01-18 20:45:58', '2024-01-18 20:45:58'),
(642, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:46:06', '2024-01-18 20:46:06', '2024-01-18 20:46:06'),
(643, 'Se ha agregado un comentario para el ticket con ID 7', 10, 7, '18/01/2024 15:46:17', '2024-01-18 20:46:17', '2024-01-18 20:46:17'),
(644, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:46:46', '2024-01-18 20:46:46', '2024-01-18 20:46:46'),
(645, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:46:48', '2024-01-18 20:46:48', '2024-01-18 20:46:48'),
(646, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:46:48', '2024-01-18 20:46:48', '2024-01-18 20:46:48'),
(647, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:46:49', '2024-01-18 20:46:49', '2024-01-18 20:46:49'),
(648, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:46:49', '2024-01-18 20:46:49', '2024-01-18 20:46:49'),
(649, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:46:49', '2024-01-18 20:46:49', '2024-01-18 20:46:49'),
(650, 'Se ha agregado un comentario para el ticket con ID 7', 1, 7, '18/01/2024 15:47:04', '2024-01-18 20:47:04', '2024-01-18 20:47:04'),
(651, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '18/01/2024 15:52:52', '2024-01-18 20:52:52', '2024-01-18 20:52:52'),
(652, 'Se ha agregado un comentario para el ticket con ID 9', 18, 7, '18/01/2024 15:53:26', '2024-01-18 20:53:26', '2024-01-18 20:53:26'),
(653, 'El usuario jccq12@gmail.com creo un ticket llamado Chevere', 1, 4, '18/01/2024 15:54:19', '2024-01-18 20:54:19', '2024-01-18 20:54:19'),
(654, 'Se ha agregado una calificacion de 5 estrellas para el ticket con ID 11', 1, 7, '18/01/2024 15:56:05', '2024-01-18 20:56:05', '2024-01-18 20:56:05'),
(655, 'El usuario Jerson Henao con correo sistemasaux4@eltemplodelamoda.com.co ha ingresado al sistema', 12, 8, '18/01/2024 15:59:48', '2024-01-18 20:59:48', '2024-01-18 20:59:48'),
(656, 'El usuario sistemasaux2@eltemplodelamoda.com.co ha visto el ticket con id 11', 18, 7, '18/01/2024 16:00:11', '2024-01-18 21:00:11', '2024-01-18 21:00:11'),
(657, 'Se ha agregado un comentario para el ticket con ID 11', 1, 7, '18/01/2024 16:00:21', '2024-01-18 21:00:21', '2024-01-18 21:00:21'),
(658, 'Se ha agregado un comentario para el ticket con ID 11', 1, 7, '18/01/2024 16:00:40', '2024-01-18 21:00:40', '2024-01-18 21:00:40'),
(659, 'Se ha agregado un comentario para el ticket con ID 11', 18, 7, '18/01/2024 16:00:54', '2024-01-18 21:00:54', '2024-01-18 21:00:54'),
(660, 'Se ha agregado un comentario para el ticket con ID 11', 1, 7, '18/01/2024 16:01:00', '2024-01-18 21:01:00', '2024-01-18 21:01:00'),
(661, 'Se ha agregado un comentario para el ticket con ID 11', 1, 7, '18/01/2024 16:01:09', '2024-01-18 21:01:09', '2024-01-18 21:01:09'),
(662, 'Se ha agregado un comentario para el ticket con ID 11', 1, 7, '18/01/2024 16:01:22', '2024-01-18 21:01:22', '2024-01-18 21:01:22'),
(663, 'El usuario sistemasaux2@eltemplodelamoda.com.co inicio la ejecución del ticket con id 11', 18, 7, '18/01/2024 16:01:38', '2024-01-18 21:01:38', '2024-01-18 21:01:38'),
(664, 'El usuario sistemasaux4@eltemplodelamoda.com.co creo un ticket llamado Ingreso de vaso', 12, 4, '18/01/2024 16:01:46', '2024-01-18 21:01:46', '2024-01-18 21:01:46'),
(665, 'El usuario jccq12@gmail.com ha visto el ticket con id 12', 1, 7, '18/01/2024 16:24:07', '2024-01-18 21:24:07', '2024-01-18 21:24:07'),
(666, 'Se ha agregado un comentario para el ticket con ID 12', 12, 7, '18/01/2024 16:24:58', '2024-01-18 21:24:58', '2024-01-18 21:24:58'),
(667, 'Se ha agregado un comentario para el ticket con ID 12', 12, 7, '18/01/2024 16:25:04', '2024-01-18 21:25:04', '2024-01-18 21:25:04'),
(668, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '18/01/2024 16:26:52', '2024-01-18 21:26:52', '2024-01-18 21:26:52'),
(669, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/01/2024 08:23:43', '2024-01-19 13:23:43', '2024-01-19 13:23:43'),
(670, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REFGeAI', 1, 18, '19/01/2024 12:00:24', '2024-01-19 17:00:24', '2024-01-19 17:00:24'),
(671, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/01/2024 12:03:36', '2024-01-19 17:03:36', '2024-01-19 17:03:36'),
(672, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '19/01/2024 12:03:55', '2024-01-19 17:03:55', '2024-01-19 17:03:55'),
(673, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 12:06:48', '2024-01-19 17:06:48', '2024-01-19 17:06:48'),
(674, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '19/01/2024 12:07:20', '2024-01-19 17:07:20', '2024-01-19 17:07:20'),
(675, 'El usuario sistemasaux9@eltemplodelamoda.com.co creo un ticket llamado asdsads', 16, 4, '19/01/2024 12:07:42', '2024-01-19 17:07:42', '2024-01-19 17:07:42'),
(676, 'Se ha editado el ticket con ID 14', 1, 7, '19/01/2024 12:08:19', '2024-01-19 17:08:19', '2024-01-19 17:08:19'),
(677, 'El usuario jccq12@gmail.com ha visto el ticket con id 14', 1, 7, '19/01/2024 12:08:22', '2024-01-19 17:08:22', '2024-01-19 17:08:22'),
(678, 'Se ha agregado un comentario para el ticket con ID 14', 1, 7, '19/01/2024 12:09:14', '2024-01-19 17:09:14', '2024-01-19 17:09:14'),
(679, 'Se ha agregado un comentario para el ticket con ID 14', 16, 7, '19/01/2024 12:09:38', '2024-01-19 17:09:38', '2024-01-19 17:09:38'),
(680, 'Se ha agregado un comentario para el ticket con ID 14', 1, 7, '19/01/2024 12:10:01', '2024-01-19 17:10:01', '2024-01-19 17:10:01'),
(681, 'Se ha agregado un comentario para el ticket con ID 14', 16, 7, '19/01/2024 12:19:04', '2024-01-19 17:19:04', '2024-01-19 17:19:04'),
(682, 'Se ha agregado un comentario para el ticket con ID 14', 16, 7, '19/01/2024 12:20:36', '2024-01-19 17:20:36', '2024-01-19 17:20:36'),
(683, 'Se ha agregado un comentario para el ticket con ID 14', 1, 7, '19/01/2024 12:20:45', '2024-01-19 17:20:45', '2024-01-19 17:20:45'),
(684, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 14', 1, 7, '19/01/2024 12:21:00', '2024-01-19 17:21:00', '2024-01-19 17:21:00'),
(685, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '19/01/2024 13:41:43', '2024-01-19 18:41:43', '2024-01-19 18:41:43'),
(686, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '19/01/2024 13:41:56', '2024-01-19 18:41:56', '2024-01-19 18:41:56'),
(687, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '19/01/2024 13:53:34', '2024-01-19 18:53:34', '2024-01-19 18:53:34'),
(688, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/01/2024 13:56:33', '2024-01-19 18:56:33', '2024-01-19 18:56:33'),
(689, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '19/01/2024 13:57:29', '2024-01-19 18:57:29', '2024-01-19 18:57:29'),
(690, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/01/2024 14:22:49', '2024-01-19 19:22:49', '2024-01-19 19:22:49'),
(691, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REFe3xz con ID 3', 1, 18, '19/01/2024 15:06:51', '2024-01-19 20:06:51', '2024-01-19 20:06:51'),
(692, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REFGeAI con ID 4', 1, 18, '19/01/2024 15:07:31', '2024-01-19 20:07:31', '2024-01-19 20:07:31'),
(693, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFGeAI', 1, 18, '19/01/2024 15:10:07', '2024-01-19 20:10:07', '2024-01-19 20:10:07'),
(694, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial REFGeAI', 1, 18, '19/01/2024 15:10:13', '2024-01-19 20:10:13', '2024-01-19 20:10:13'),
(695, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial REFGeAI con ID 4', 1, 18, '19/01/2024 15:10:17', '2024-01-19 20:10:17', '2024-01-19 20:10:17'),
(696, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/01/2024 15:18:41', '2024-01-19 20:18:41', '2024-01-19 20:18:41'),
(697, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFGeAI', 1, 18, '19/01/2024 15:20:17', '2024-01-19 20:20:17', '2024-01-19 20:20:17'),
(698, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial REFGeAI', 1, 18, '19/01/2024 15:20:21', '2024-01-19 20:20:21', '2024-01-19 20:20:21'),
(699, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '19/01/2024 15:20:46', '2024-01-19 20:20:46', '2024-01-19 20:20:46'),
(700, 'El usuario jccq12@gmail.com creo un ticket llamado Hgf', 1, 4, '19/01/2024 15:21:42', '2024-01-19 20:21:42', '2024-01-19 20:21:42'),
(701, 'Se ha editado el ticket con ID 15', 1, 7, '19/01/2024 15:22:13', '2024-01-19 20:22:13', '2024-01-19 20:22:13'),
(702, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 15', 10, 7, '19/01/2024 15:22:27', '2024-01-19 20:22:27', '2024-01-19 20:22:27'),
(703, 'Se ha agregado un comentario para el ticket con ID 15', 10, 7, '19/01/2024 15:23:00', '2024-01-19 20:23:00', '2024-01-19 20:23:00'),
(704, 'Se ha agregado un comentario para el ticket con ID 15', 1, 7, '19/01/2024 15:23:08', '2024-01-19 20:23:08', '2024-01-19 20:23:08'),
(705, 'Se ha agregado un comentario para el ticket con ID 15', 10, 7, '19/01/2024 15:23:15', '2024-01-19 20:23:15', '2024-01-19 20:23:15'),
(706, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 15', 10, 7, '19/01/2024 15:23:40', '2024-01-19 20:23:40', '2024-01-19 20:23:40'),
(707, 'Se ha agregado un comentario para el ticket con ID 15', 1, 7, '19/01/2024 15:25:23', '2024-01-19 20:25:23', '2024-01-19 20:25:23'),
(708, 'Se ha agregado un comentario para el ticket con ID 15', 10, 7, '19/01/2024 15:25:27', '2024-01-19 20:25:27', '2024-01-19 20:25:27'),
(709, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 15', 1, 7, '19/01/2024 15:25:31', '2024-01-19 20:25:31', '2024-01-19 20:25:31'),
(710, 'Se ha agregado un comentario para el ticket con ID 15', 10, 7, '19/01/2024 15:38:32', '2024-01-19 20:38:32', '2024-01-19 20:38:32'),
(711, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '19/01/2024 15:40:58', '2024-01-19 20:40:58', '2024-01-19 20:40:58'),
(712, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 15:41:49', '2024-01-19 20:41:49', '2024-01-19 20:41:49'),
(713, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 15:42:59', '2024-01-19 20:42:59', '2024-01-19 20:42:59'),
(714, 'Se ha eliminado el comentario con ID 115 para el ticket con ID 13', 1, 7, '19/01/2024 15:51:39', '2024-01-19 20:51:39', '2024-01-19 20:51:39'),
(715, 'Se ha eliminado el comentario con ID 114 para el ticket con ID 13', 1, 7, '19/01/2024 15:51:45', '2024-01-19 20:51:45', '2024-01-19 20:51:45'),
(716, 'Se ha eliminado el comentario con ID 101 para el ticket con ID 13', 1, 7, '19/01/2024 15:52:18', '2024-01-19 20:52:18', '2024-01-19 20:52:18'),
(717, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 15:53:08', '2024-01-19 20:53:08', '2024-01-19 20:53:08'),
(718, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 15:53:14', '2024-01-19 20:53:14', '2024-01-19 20:53:14'),
(719, 'Se ha eliminado el comentario con ID 117 para el ticket con ID 13', 1, 7, '19/01/2024 15:57:47', '2024-01-19 20:57:47', '2024-01-19 20:57:47'),
(720, 'Se ha eliminado el comentario con ID 116 para el ticket con ID 13', 1, 7, '19/01/2024 15:57:53', '2024-01-19 20:57:53', '2024-01-19 20:57:53'),
(721, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 15:58:34', '2024-01-19 20:58:34', '2024-01-19 20:58:34'),
(722, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 15:58:39', '2024-01-19 20:58:39', '2024-01-19 20:58:39'),
(723, 'Se ha eliminado el comentario con ID 119 para el ticket con ID 13', 1, 7, '19/01/2024 15:59:32', '2024-01-19 20:59:32', '2024-01-19 20:59:32'),
(724, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '19/01/2024 16:02:28', '2024-01-19 21:02:28', '2024-01-19 21:02:28'),
(725, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 13', 10, 7, '19/01/2024 16:02:36', '2024-01-19 21:02:36', '2024-01-19 21:02:36'),
(726, 'Se ha eliminado el comentario con ID 118 para el ticket con ID 13', 1, 7, '19/01/2024 16:03:25', '2024-01-19 21:03:25', '2024-01-19 21:03:25'),
(727, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:04:54', '2024-01-19 21:04:54', '2024-01-19 21:04:54'),
(728, 'Se ha eliminado el comentario con ID 120 para el ticket con ID 13', 1, 7, '19/01/2024 16:05:07', '2024-01-19 21:05:07', '2024-01-19 21:05:07'),
(729, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:05:55', '2024-01-19 21:05:55', '2024-01-19 21:05:55'),
(730, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:05:57', '2024-01-19 21:05:57', '2024-01-19 21:05:57'),
(731, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:05:58', '2024-01-19 21:05:58', '2024-01-19 21:05:58'),
(732, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:05:59', '2024-01-19 21:05:59', '2024-01-19 21:05:59'),
(733, 'Se ha eliminado el comentario con ID 124 para el ticket con ID 13', 1, 7, '19/01/2024 16:06:10', '2024-01-19 21:06:10', '2024-01-19 21:06:10'),
(734, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:06:16', '2024-01-19 21:06:16', '2024-01-19 21:06:16'),
(735, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:06:18', '2024-01-19 21:06:18', '2024-01-19 21:06:18'),
(736, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:07:43', '2024-01-19 21:07:43', '2024-01-19 21:07:43'),
(737, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:07:48', '2024-01-19 21:07:48', '2024-01-19 21:07:48'),
(738, 'Se ha eliminado el comentario con ID 128 para el ticket con ID 13', 1, 7, '19/01/2024 16:08:39', '2024-01-19 21:08:39', '2024-01-19 21:08:39'),
(739, 'Se ha eliminado el comentario con ID 127 para el ticket con ID 13', 1, 7, '19/01/2024 16:08:46', '2024-01-19 21:08:46', '2024-01-19 21:08:46'),
(740, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:08:49', '2024-01-19 21:08:49', '2024-01-19 21:08:49'),
(741, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:09:51', '2024-01-19 21:09:51', '2024-01-19 21:09:51'),
(742, 'Se ha eliminado el comentario con ID 130 para el ticket con ID 13', 1, 7, '19/01/2024 16:10:03', '2024-01-19 21:10:03', '2024-01-19 21:10:03'),
(743, 'Se ha eliminado el comentario con ID 129 para el ticket con ID 13', 1, 7, '19/01/2024 16:10:11', '2024-01-19 21:10:11', '2024-01-19 21:10:11'),
(744, 'Se ha eliminado el comentario con ID 126 para el ticket con ID 13', 1, 7, '19/01/2024 16:10:15', '2024-01-19 21:10:15', '2024-01-19 21:10:15'),
(745, 'Se ha eliminado el comentario con ID 125 para el ticket con ID 13', 1, 7, '19/01/2024 16:10:19', '2024-01-19 21:10:19', '2024-01-19 21:10:19'),
(746, 'Se ha eliminado el comentario con ID 123 para el ticket con ID 13', 1, 7, '19/01/2024 16:10:22', '2024-01-19 21:10:22', '2024-01-19 21:10:22'),
(747, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:10:25', '2024-01-19 21:10:25', '2024-01-19 21:10:25'),
(748, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:11:01', '2024-01-19 21:11:01', '2024-01-19 21:11:01'),
(749, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:11:55', '2024-01-19 21:11:55', '2024-01-19 21:11:55'),
(750, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:12:32', '2024-01-19 21:12:32', '2024-01-19 21:12:32'),
(751, 'Se ha eliminado el comentario con ID 121 para el ticket con ID 13', 1, 7, '19/01/2024 16:12:54', '2024-01-19 21:12:54', '2024-01-19 21:12:54'),
(752, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:15:44', '2024-01-19 21:15:44', '2024-01-19 21:15:44'),
(753, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:15:50', '2024-01-19 21:15:50', '2024-01-19 21:15:50'),
(754, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:16:08', '2024-01-19 21:16:08', '2024-01-19 21:16:08'),
(755, 'Se ha eliminado el comentario con ID 137 para el ticket con ID 13', 1, 7, '19/01/2024 16:16:13', '2024-01-19 21:16:13', '2024-01-19 21:16:13'),
(756, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:16:52', '2024-01-19 21:16:52', '2024-01-19 21:16:52'),
(757, 'Se ha eliminado el comentario con ID 138 para el ticket con ID 13', 1, 7, '19/01/2024 16:16:57', '2024-01-19 21:16:57', '2024-01-19 21:16:57'),
(758, 'Se ha eliminado el comentario con ID 136 para el ticket con ID 13', 1, 7, '19/01/2024 16:17:43', '2024-01-19 21:17:43', '2024-01-19 21:17:43'),
(759, 'Se ha eliminado el comentario con ID 135 para el ticket con ID 13', 1, 7, '19/01/2024 16:17:58', '2024-01-19 21:17:58', '2024-01-19 21:17:58'),
(760, 'Se ha eliminado el comentario con ID 134 para el ticket con ID 13', 1, 7, '19/01/2024 16:19:10', '2024-01-19 21:19:10', '2024-01-19 21:19:10'),
(761, 'Se ha eliminado el comentario con ID 133 para el ticket con ID 13', 1, 7, '19/01/2024 16:20:00', '2024-01-19 21:20:00', '2024-01-19 21:20:00'),
(762, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:20:05', '2024-01-19 21:20:05', '2024-01-19 21:20:05'),
(763, 'Se ha eliminado el comentario con ID 139 para el ticket con ID 13', 1, 7, '19/01/2024 16:20:36', '2024-01-19 21:20:36', '2024-01-19 21:20:36'),
(764, 'Se ha eliminado el comentario con ID 132 para el ticket con ID 13', 1, 7, '19/01/2024 16:20:40', '2024-01-19 21:20:40', '2024-01-19 21:20:40'),
(765, 'Se ha eliminado el comentario con ID 131 para el ticket con ID 13', 1, 7, '19/01/2024 16:20:43', '2024-01-19 21:20:43', '2024-01-19 21:20:43'),
(766, 'Se ha eliminado el comentario con ID 122 para el ticket con ID 13', 1, 7, '19/01/2024 16:20:47', '2024-01-19 21:20:47', '2024-01-19 21:20:47'),
(767, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:20:52', '2024-01-19 21:20:52', '2024-01-19 21:20:52'),
(768, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:22:35', '2024-01-19 21:22:35', '2024-01-19 21:22:35'),
(769, 'Se ha eliminado el comentario con ID 141 para el ticket con ID 13', 1, 7, '19/01/2024 16:23:28', '2024-01-19 21:23:28', '2024-01-19 21:23:28'),
(770, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:23:31', '2024-01-19 21:23:31', '2024-01-19 21:23:31'),
(771, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:26:56', '2024-01-19 21:26:56', '2024-01-19 21:26:56'),
(772, 'Se ha eliminado el comentario con ID 143 para el ticket con ID 13', 1, 7, '19/01/2024 16:27:15', '2024-01-19 21:27:15', '2024-01-19 21:27:15'),
(773, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:27:19', '2024-01-19 21:27:19', '2024-01-19 21:27:19'),
(774, 'Se ha eliminado el comentario con ID 144 para el ticket con ID 13', 1, 7, '19/01/2024 16:27:39', '2024-01-19 21:27:39', '2024-01-19 21:27:39'),
(775, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:27:43', '2024-01-19 21:27:43', '2024-01-19 21:27:43'),
(776, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:29:10', '2024-01-19 21:29:10', '2024-01-19 21:29:10'),
(777, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:29:28', '2024-01-19 21:29:28', '2024-01-19 21:29:28'),
(778, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:29:37', '2024-01-19 21:29:37', '2024-01-19 21:29:37'),
(779, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:31:52', '2024-01-19 21:31:52', '2024-01-19 21:31:52'),
(780, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:32:26', '2024-01-19 21:32:26', '2024-01-19 21:32:26'),
(781, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:32:28', '2024-01-19 21:32:28', '2024-01-19 21:32:28'),
(782, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:32:30', '2024-01-19 21:32:30', '2024-01-19 21:32:30'),
(783, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:33:27', '2024-01-19 21:33:27', '2024-01-19 21:33:27'),
(784, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:33:39', '2024-01-19 21:33:39', '2024-01-19 21:33:39'),
(785, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:36:39', '2024-01-19 21:36:39', '2024-01-19 21:36:39'),
(786, 'Se ha eliminado el comentario con ID 155 para el ticket con ID 13', 1, 7, '19/01/2024 16:36:58', '2024-01-19 21:36:58', '2024-01-19 21:36:58'),
(787, 'Se ha eliminado el comentario con ID 154 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:02', '2024-01-19 21:37:02', '2024-01-19 21:37:02'),
(788, 'Se ha eliminado el comentario con ID 153 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:05', '2024-01-19 21:37:05', '2024-01-19 21:37:05'),
(789, 'Se ha eliminado el comentario con ID 152 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:08', '2024-01-19 21:37:08', '2024-01-19 21:37:08'),
(790, 'Se ha eliminado el comentario con ID 151 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:11', '2024-01-19 21:37:11', '2024-01-19 21:37:11'),
(791, 'Se ha eliminado el comentario con ID 150 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:14', '2024-01-19 21:37:14', '2024-01-19 21:37:14'),
(792, 'Se ha eliminado el comentario con ID 149 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:17', '2024-01-19 21:37:17', '2024-01-19 21:37:17'),
(793, 'Se ha eliminado el comentario con ID 148 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:21', '2024-01-19 21:37:21', '2024-01-19 21:37:21'),
(794, 'Se ha eliminado el comentario con ID 147 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:24', '2024-01-19 21:37:24', '2024-01-19 21:37:24'),
(795, 'Se ha eliminado el comentario con ID 146 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:27', '2024-01-19 21:37:27', '2024-01-19 21:37:27'),
(796, 'Se ha eliminado el comentario con ID 145 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:31', '2024-01-19 21:37:31', '2024-01-19 21:37:31'),
(797, 'Se ha eliminado el comentario con ID 142 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:35', '2024-01-19 21:37:35', '2024-01-19 21:37:35'),
(798, 'Se ha eliminado el comentario con ID 140 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:40', '2024-01-19 21:37:40', '2024-01-19 21:37:40'),
(799, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:37:44', '2024-01-19 21:37:44', '2024-01-19 21:37:44'),
(800, 'Se ha eliminado el comentario con ID 156 para el ticket con ID 13', 1, 7, '19/01/2024 16:37:49', '2024-01-19 21:37:49', '2024-01-19 21:37:49'),
(801, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:37:53', '2024-01-19 21:37:53', '2024-01-19 21:37:53'),
(802, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:37:57', '2024-01-19 21:37:57', '2024-01-19 21:37:57'),
(803, 'Se ha eliminado el comentario con ID 158 para el ticket con ID 13', 1, 7, '19/01/2024 16:38:00', '2024-01-19 21:38:00', '2024-01-19 21:38:00'),
(804, 'Se ha eliminado el comentario con ID 157 para el ticket con ID 13', 1, 7, '19/01/2024 16:38:38', '2024-01-19 21:38:38', '2024-01-19 21:38:38'),
(805, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:38:40', '2024-01-19 21:38:40', '2024-01-19 21:38:40'),
(806, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:38:42', '2024-01-19 21:38:42', '2024-01-19 21:38:42'),
(807, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:38:43', '2024-01-19 21:38:43', '2024-01-19 21:38:43'),
(808, 'Se ha eliminado el comentario con ID 161 para el ticket con ID 13', 1, 7, '19/01/2024 16:38:46', '2024-01-19 21:38:46', '2024-01-19 21:38:46'),
(809, 'Se ha eliminado el comentario con ID 161 para el ticket con ID 13', 1, 7, '19/01/2024 16:38:46', '2024-01-19 21:38:46', '2024-01-19 21:38:46'),
(810, 'Se ha agregado un comentario para el ticket con ID 13', 1, 7, '19/01/2024 16:38:51', '2024-01-19 21:38:51', '2024-01-19 21:38:51'),
(811, 'Se ha eliminado el comentario con ID 162 para el ticket con ID 13', 10, 7, '19/01/2024 16:38:54', '2024-01-19 21:38:54', '2024-01-19 21:38:54'),
(812, 'Se ha agregado un comentario para el ticket con ID 13', 1, 7, '19/01/2024 16:38:58', '2024-01-19 21:38:58', '2024-01-19 21:38:58'),
(813, 'Se ha agregado un comentario para el ticket con ID 13', 1, 7, '19/01/2024 16:39:03', '2024-01-19 21:39:03', '2024-01-19 21:39:03'),
(814, 'Se ha agregado un comentario para el ticket con ID 13', 1, 7, '19/01/2024 16:39:06', '2024-01-19 21:39:06', '2024-01-19 21:39:06'),
(815, 'Se ha eliminado el comentario con ID 160 para el ticket con ID 13', 1, 7, '19/01/2024 16:39:11', '2024-01-19 21:39:11', '2024-01-19 21:39:11'),
(816, 'Se ha agregado un comentario para el ticket con ID 13', 1, 7, '19/01/2024 16:39:17', '2024-01-19 21:39:17', '2024-01-19 21:39:17'),
(817, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:39:23', '2024-01-19 21:39:23', '2024-01-19 21:39:23'),
(818, 'Se ha eliminado el comentario con ID 167 para el ticket con ID 13', 1, 7, '19/01/2024 16:39:26', '2024-01-19 21:39:26', '2024-01-19 21:39:26'),
(819, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:39:29', '2024-01-19 21:39:29', '2024-01-19 21:39:29'),
(820, 'Se ha eliminado el comentario con ID 168 para el ticket con ID 13', 1, 7, '19/01/2024 16:39:33', '2024-01-19 21:39:33', '2024-01-19 21:39:33'),
(821, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:40:26', '2024-01-19 21:40:26', '2024-01-19 21:40:26'),
(822, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:52:30', '2024-01-19 21:52:30', '2024-01-19 21:52:30'),
(823, 'Se ha agregado un comentario para el ticket con ID 13', 10, 7, '19/01/2024 16:52:46', '2024-01-19 21:52:46', '2024-01-19 21:52:46'),
(824, 'Se ha agregado un comentario para el ticket con ID 13', 1, 7, '19/01/2024 16:52:53', '2024-01-19 21:52:53', '2024-01-19 21:52:53'),
(825, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asdsa', 10, 4, '19/01/2024 16:56:03', '2024-01-19 21:56:03', '2024-01-19 21:56:03'),
(826, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado dasdasd', 10, 4, '19/01/2024 16:56:36', '2024-01-19 21:56:36', '2024-01-19 21:56:36'),
(827, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '19/01/2024 16:59:17', '2024-01-19 21:59:17', '2024-01-19 21:59:17'),
(828, 'El usuario jccq12@gmail.com creo un ticket llamado Ygg', 1, 4, '19/01/2024 16:59:43', '2024-01-19 21:59:43', '2024-01-19 21:59:43'),
(829, 'El usuario sistemasaux2@eltemplodelamoda.com.co ha visto el ticket con id 18', 18, 7, '19/01/2024 17:00:27', '2024-01-19 22:00:27', '2024-01-19 22:00:27'),
(830, 'Se ha agregado un comentario para el ticket con ID 18', 1, 7, '19/01/2024 17:00:38', '2024-01-19 22:00:38', '2024-01-19 22:00:38'),
(831, 'Se ha agregado un comentario para el ticket con ID 18', 18, 7, '19/01/2024 17:00:47', '2024-01-19 22:00:47', '2024-01-19 22:00:47'),
(832, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial REFon8h', 1, 18, '19/01/2024 17:02:17', '2024-01-19 22:02:17', '2024-01-19 22:02:17'),
(833, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '20/01/2024 08:24:34', '2024-01-20 13:24:34', '2024-01-20 13:24:34'),
(834, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección Calle 28#86-29', 1, 17, '20/01/2024 08:47:54', '2024-01-20 13:47:54', '2024-01-20 13:47:54'),
(835, 'El usuario Jhan Carlos Cordoba ha Despachado los componentes asignados al acta con ID 14 para Jhan Carlos Cordoba para la siguiente dirección Calle 28#86-29', 1, 17, '20/01/2024 08:48:20', '2024-01-20 13:48:20', '2024-01-20 13:48:20'),
(836, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 14 para la siguiente dirección Calle 28#86-29', 1, 17, '20/01/2024 09:11:02', '2024-01-20 14:11:02', '2024-01-20 14:11:02'),
(837, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '20/01/2024 10:05:20', '2024-01-20 15:05:20', '2024-01-20 15:05:20'),
(838, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado adsad', 10, 4, '20/01/2024 10:05:41', '2024-01-20 15:05:41', '2024-01-20 15:05:41'),
(839, 'El usuario jccq12@gmail.com ha visto el ticket con id 19', 1, 7, '20/01/2024 10:06:09', '2024-01-20 15:06:09', '2024-01-20 15:06:09'),
(840, 'Se ha agregado un comentario para el ticket con ID 19', 1, 7, '20/01/2024 10:06:30', '2024-01-20 15:06:30', '2024-01-20 15:06:30'),
(841, 'Se ha eliminado el comentario con ID 175 para el ticket con ID 19', 10, 7, '20/01/2024 10:06:35', '2024-01-20 15:06:35', '2024-01-20 15:06:35'),
(842, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asdsad', 10, 4, '20/01/2024 10:08:24', '2024-01-20 15:08:24', '2024-01-20 15:08:24'),
(843, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asdas', 10, 4, '20/01/2024 10:24:49', '2024-01-20 15:24:49', '2024-01-20 15:24:49'),
(844, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '20/01/2024 10:35:36', '2024-01-20 15:35:36', '2024-01-20 15:35:36'),
(845, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '20/01/2024 10:36:05', '2024-01-20 15:36:05', '2024-01-20 15:36:05'),
(846, 'El usuario jccq12@gmail.com creo un ticket llamado ASDSA', 1, 4, '20/01/2024 10:36:59', '2024-01-20 15:36:59', '2024-01-20 15:36:59'),
(847, 'El usuario jccq12@gmail.com creo un ticket llamado asdsa', 1, 4, '20/01/2024 10:38:00', '2024-01-20 15:38:00', '2024-01-20 15:38:00'),
(848, 'El usuario jccq12@gmail.com creo un ticket llamado assdsa', 1, 4, '20/01/2024 10:38:42', '2024-01-20 15:38:42', '2024-01-20 15:38:42'),
(849, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '20/01/2024 10:39:42', '2024-01-20 15:39:42', '2024-01-20 15:39:42'),
(850, 'El usuario jccq12@gmail.com creo un ticket llamado Jhgg', 1, 4, '20/01/2024 10:40:10', '2024-01-20 15:40:10', '2024-01-20 15:40:10'),
(851, 'El usuario jccq12@gmail.com creo un ticket llamado Hgg', 1, 4, '20/01/2024 10:41:38', '2024-01-20 15:41:38', '2024-01-20 15:41:38'),
(852, 'El usuario jccq12@gmail.com creo un ticket llamado Hgg', 1, 4, '20/01/2024 10:43:23', '2024-01-20 15:43:23', '2024-01-20 15:43:23'),
(853, 'El usuario jccq12@gmail.com creo un ticket llamado Hgg', 1, 4, '20/01/2024 10:43:54', '2024-01-20 15:43:54', '2024-01-20 15:43:54'),
(854, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFon8h', 1, 18, '20/01/2024 10:58:06', '2024-01-20 15:58:06', '2024-01-20 15:58:06'),
(855, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial REFon8h', 1, 18, '20/01/2024 11:05:24', '2024-01-20 16:05:24', '2024-01-20 16:05:24'),
(856, 'El usuario Anderson Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '20/01/2024 11:13:54', '2024-01-20 16:13:54', '2024-01-20 16:13:54'),
(857, 'El usuario Anderson Cordoba ha Despachado los componentes asignados al acta con ID 15 para Jhan Carlos Cordoba para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '20/01/2024 11:14:48', '2024-01-20 16:14:48', '2024-01-20 16:14:48'),
(858, 'El usuario Anderson Cordoba ha recibido los componentes asignados al acta con ID 15 para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '20/01/2024 11:15:28', '2024-01-20 16:15:28', '2024-01-20 16:15:28'),
(859, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado AD', 10, 4, '20/01/2024 11:23:35', '2024-01-20 16:23:35', '2024-01-20 16:23:35'),
(860, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado RYRTY', 10, 4, '20/01/2024 11:25:26', '2024-01-20 16:25:26', '2024-01-20 16:25:26'),
(861, 'El usuario jccq12@gmail.com ha visto el ticket con id 30', 1, 7, '20/01/2024 11:25:40', '2024-01-20 16:25:40', '2024-01-20 16:25:40'),
(862, 'Se ha agregado un comentario para el ticket con ID 30', 1, 7, '20/01/2024 11:26:04', '2024-01-20 16:26:04', '2024-01-20 16:26:04'),
(863, 'Se ha agregado un comentario para el ticket con ID 30', 1, 7, '20/01/2024 11:26:08', '2024-01-20 16:26:08', '2024-01-20 16:26:08'),
(864, 'Se ha agregado un comentario para el ticket con ID 30', 10, 7, '20/01/2024 11:26:14', '2024-01-20 16:26:14', '2024-01-20 16:26:14'),
(865, 'Se ha agregado un comentario para el ticket con ID 30', 10, 7, '20/01/2024 11:30:22', '2024-01-20 16:30:22', '2024-01-20 16:30:22'),
(866, 'Se ha agregado un comentario para el ticket con ID 30', 1, 7, '20/01/2024 11:33:15', '2024-01-20 16:33:15', '2024-01-20 16:33:15'),
(867, 'Se ha agregado un comentario para el ticket con ID 30', 1, 7, '20/01/2024 11:33:19', '2024-01-20 16:33:19', '2024-01-20 16:33:19'),
(868, 'Se ha agregado un comentario para el ticket con ID 30', 10, 7, '20/01/2024 11:33:24', '2024-01-20 16:33:24', '2024-01-20 16:33:24'),
(869, 'Se ha agregado un comentario para el ticket con ID 30', 1, 7, '20/01/2024 11:35:40', '2024-01-20 16:35:40', '2024-01-20 16:35:40'),
(870, 'Se ha agregado un comentario para el ticket con ID 30', 10, 7, '20/01/2024 11:35:56', '2024-01-20 16:35:56', '2024-01-20 16:35:56'),
(871, 'Se ha eliminado el comentario con ID 183 para el ticket con ID 30', 10, 7, '20/01/2024 11:36:03', '2024-01-20 16:36:03', '2024-01-20 16:36:03'),
(872, 'Se ha eliminado el comentario con ID 183 para el ticket con ID 30', 10, 7, '20/01/2024 11:36:03', '2024-01-20 16:36:03', '2024-01-20 16:36:03'),
(873, 'Se ha eliminado el comentario con ID 180 para el ticket con ID 30', 10, 7, '20/01/2024 11:36:09', '2024-01-20 16:36:09', '2024-01-20 16:36:09'),
(874, 'Se ha eliminado el comentario con ID 180 para el ticket con ID 30', 10, 7, '20/01/2024 11:36:09', '2024-01-20 16:36:09', '2024-01-20 16:36:09'),
(875, 'Se ha eliminado el comentario con ID 180 para el ticket con ID 30', 10, 7, '20/01/2024 11:36:09', '2024-01-20 16:36:09', '2024-01-20 16:36:09'),
(876, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 30', 1, 7, '20/01/2024 11:36:41', '2024-01-20 16:36:41', '2024-01-20 16:36:41'),
(877, 'Se ha agregado un comentario para el ticket con ID 30', 10, 7, '20/01/2024 11:46:51', '2024-01-20 16:46:51', '2024-01-20 16:46:51'),
(878, 'Se ha agregado un comentario para el ticket con ID 30', 10, 7, '20/01/2024 11:47:05', '2024-01-20 16:47:05', '2024-01-20 16:47:05'),
(879, 'Se ha agregado un comentario para el ticket con ID 30', 1, 7, '20/01/2024 11:47:28', '2024-01-20 16:47:28', '2024-01-20 16:47:28'),
(880, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 29', 10, 7, '20/01/2024 11:49:40', '2024-01-20 16:49:40', '2024-01-20 16:49:40'),
(881, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFon8h', 1, 18, '20/01/2024 11:54:07', '2024-01-20 16:54:07', '2024-01-20 16:54:07'),
(882, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial REFon8h', 1, 18, '20/01/2024 11:54:12', '2024-01-20 16:54:12', '2024-01-20 16:54:12'),
(883, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '20/01/2024 12:11:40', '2024-01-20 17:11:40', '2024-01-20 17:11:40'),
(884, 'Se ha agregado un comentario para el ticket con ID 30', 10, 7, '20/01/2024 12:12:53', '2024-01-20 17:12:53', '2024-01-20 17:12:53'),
(885, 'Se ha agregado un comentario para el ticket con ID 30', 1, 7, '20/01/2024 12:13:02', '2024-01-20 17:13:02', '2024-01-20 17:13:02'),
(886, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '22/01/2024 08:20:44', '2024-01-22 13:20:44', '2024-01-22 13:20:44'),
(887, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '22/01/2024 08:23:50', '2024-01-22 13:23:50', '2024-01-22 13:23:50'),
(888, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 13 para Jhan Carlos Cordoba para la siguiente dirección ', 1, 17, '22/01/2024 08:25:18', '2024-01-22 13:25:18', '2024-01-22 13:25:18'),
(889, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '22/01/2024 08:32:11', '2024-01-22 13:32:11', '2024-01-22 13:32:11'),
(890, 'Se ha agregado un comentario para el ticket con ID 30', 1, 7, '22/01/2024 08:32:41', '2024-01-22 13:32:41', '2024-01-22 13:32:41'),
(891, 'Se ha agregado un comentario para el ticket con ID 30', 1, 7, '22/01/2024 08:34:34', '2024-01-22 13:34:34', '2024-01-22 13:34:34'),
(892, 'Se ha agregado un comentario para el ticket con ID 30', 10, 7, '22/01/2024 08:34:47', '2024-01-22 13:34:47', '2024-01-22 13:34:47'),
(893, 'Se han modificado los datos del usuario sistemasaux4@eltemplodelamoda.com.co', 10, 2, '22/01/2024 08:46:14', '2024-01-22 13:46:14', '2024-01-22 13:46:14'),
(894, 'Se han modificado los datos del usuario sistemasaux6@eltemplodelamoda.com.co', 10, 2, '22/01/2024 08:46:56', '2024-01-22 13:46:56', '2024-01-22 13:46:56'),
(895, 'Se han modificado los datos del usuario sistemasaux2@eltemplodelamoda.com.co', 10, 2, '22/01/2024 08:47:20', '2024-01-22 13:47:20', '2024-01-22 13:47:20'),
(896, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '22/01/2024 08:47:42', '2024-01-22 13:47:42', '2024-01-22 13:47:42'),
(897, 'El usuario sistemasaux9@eltemplodelamoda.com.co creo un ticket llamado TICKET', 16, 4, '22/01/2024 08:48:52', '2024-01-22 13:48:52', '2024-01-22 13:48:52'),
(898, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '22/01/2024 08:49:16', '2024-01-22 13:49:16', '2024-01-22 13:49:16'),
(899, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 1, 2, '22/01/2024 08:49:50', '2024-01-22 13:49:50', '2024-01-22 13:49:50'),
(900, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '22/01/2024 10:58:06', '2024-01-22 15:58:06', '2024-01-22 15:58:06'),
(901, 'Ha generado un permiso por/para N/A', 10, 9, '22/01/2024 10:58:48', '2024-01-22 15:58:48', '2024-01-22 15:58:48'),
(902, 'Ha generado un permiso por/para n/a', 10, 9, '22/01/2024 11:00:27', '2024-01-22 16:00:27', '2024-01-22 16:00:27'),
(903, 'Ha generado un permiso por/para n/a', 10, 9, '22/01/2024 11:01:23', '2024-01-22 16:01:23', '2024-01-22 16:01:23'),
(904, 'Ha generado un permiso por/para n/a', 10, 9, '22/01/2024 11:02:03', '2024-01-22 16:02:03', '2024-01-22 16:02:03'),
(905, 'Ha generado un permiso por/para n/a', 10, 9, '22/01/2024 11:03:00', '2024-01-22 16:03:00', '2024-01-22 16:03:00'),
(906, 'Ha generado un permiso por/para n/a', 10, 9, '22/01/2024 11:56:54', '2024-01-22 16:56:54', '2024-01-22 16:56:54'),
(907, 'Ha generado un permiso por/para n/a', 10, 9, '22/01/2024 11:58:20', '2024-01-22 16:58:20', '2024-01-22 16:58:20'),
(908, 'El usuario jccq12@gmail.com creo un ticket llamado asdsa', 1, 4, '22/01/2024 12:01:07', '2024-01-22 17:01:07', '2024-01-22 17:01:07'),
(909, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '22/01/2024 12:21:58', '2024-01-22 17:21:58', '2024-01-22 17:21:58'),
(910, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '22/01/2024 12:31:05', '2024-01-22 17:31:05', '2024-01-22 17:31:05'),
(911, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ACTIVACION DE MAC', 10, 4, '22/01/2024 14:02:20', '2024-01-22 19:02:20', '2024-01-22 19:02:20'),
(912, 'El usuario jccq12@gmail.com ha visto el ticket con id 33', 1, 7, '22/01/2024 14:02:30', '2024-01-22 19:02:30', '2024-01-22 19:02:30'),
(913, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 33', 1, 7, '22/01/2024 14:02:39', '2024-01-22 19:02:39', '2024-01-22 19:02:39'),
(914, 'El usuario jccq12@gmail.com ha visto el ticket con id 33', 1, 7, '22/01/2024 14:04:14', '2024-01-22 19:04:14', '2024-01-22 19:04:14'),
(915, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 33', 1, 7, '22/01/2024 14:04:42', '2024-01-22 19:04:42', '2024-01-22 19:04:42'),
(916, 'El usuario sistemasaux8@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 33', 10, 7, '22/01/2024 14:05:08', '2024-01-22 19:05:08', '2024-01-22 19:05:08'),
(917, 'El usuario Jhan Carlos Cordoba ha creado un acta para Anderson Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '22/01/2024 14:07:03', '2024-01-22 19:07:03', '2024-01-22 19:07:03'),
(918, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 16 para Anderson Cordoba para la siguiente dirección ', 1, 17, '22/01/2024 14:28:37', '2024-01-22 19:28:37', '2024-01-22 19:28:37'),
(919, 'El usuario Jhan Carlos Cordoba ha creado un acta para Anderson Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '22/01/2024 14:30:43', '2024-01-22 19:30:43', '2024-01-22 19:30:43'),
(920, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 17 para Anderson Cordoba para la siguiente dirección ', 1, 17, '22/01/2024 14:34:52', '2024-01-22 19:34:52', '2024-01-22 19:34:52'),
(921, 'El usuario jccq12@gmail.com creo un ticket llamado safas', 1, 4, '22/01/2024 14:39:57', '2024-01-22 19:39:57', '2024-01-22 19:39:57'),
(922, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 34', 10, 7, '22/01/2024 14:40:22', '2024-01-22 19:40:22', '2024-01-22 19:40:22'),
(923, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '22/01/2024 14:42:49', '2024-01-22 19:42:49', '2024-01-22 19:42:49'),
(924, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '22/01/2024 14:43:47', '2024-01-22 19:43:47', '2024-01-22 19:43:47'),
(925, 'El usuario jccq12@gmail.com creo un ticket llamado Activación de mac', 1, 4, '22/01/2024 14:45:02', '2024-01-22 19:45:02', '2024-01-22 19:45:02'),
(926, 'El usuario sistemasaux2@eltemplodelamoda.com.co ha visto el ticket con id 35', 18, 7, '22/01/2024 14:45:14', '2024-01-22 19:45:14', '2024-01-22 19:45:14'),
(927, 'Se ha agregado un comentario para el ticket con ID 35', 1, 7, '22/01/2024 14:45:31', '2024-01-22 19:45:31', '2024-01-22 19:45:31'),
(928, 'Se ha agregado un comentario para el ticket con ID 35', 18, 7, '22/01/2024 14:45:52', '2024-01-22 19:45:52', '2024-01-22 19:45:52'),
(929, 'El usuario sistemasaux2@eltemplodelamoda.com.co inicio la ejecución del ticket con id 35', 18, 7, '22/01/2024 14:46:18', '2024-01-22 19:46:18', '2024-01-22 19:46:18'),
(930, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '23/01/2024 09:24:50', '2024-01-23 14:24:50', '2024-01-23 14:24:50'),
(931, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '23/01/2024 09:24:56', '2024-01-23 14:24:56', '2024-01-23 14:24:56'),
(932, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '23/01/2024 09:25:15', '2024-01-23 14:25:15', '2024-01-23 14:25:15'),
(933, 'El usuario jccq12@gmail.com creo un ticket llamado AYUDA CON MAC', 1, 4, '23/01/2024 10:41:17', '2024-01-23 15:41:17', '2024-01-23 15:41:17'),
(934, 'Se ha agregado un comentario para el ticket con ID 36', 10, 7, '23/01/2024 10:41:36', '2024-01-23 15:41:36', '2024-01-23 15:41:36'),
(935, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '23/01/2024 10:41:54', '2024-01-23 15:41:54', '2024-01-23 15:41:54'),
(936, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 36', 10, 7, '23/01/2024 10:42:02', '2024-01-23 15:42:02', '2024-01-23 15:42:02'),
(937, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 36', 10, 7, '23/01/2024 10:42:17', '2024-01-23 15:42:17', '2024-01-23 15:42:17');
INSERT INTO `reports` (`id`, `description`, `id_user`, `id_report_detail`, `date`, `updated_at`, `created_at`) VALUES
(938, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 36', 1, 6, '23/01/2024 10:42:36', '2024-01-23 15:42:36', '2024-01-23 15:42:36'),
(939, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '23/01/2024 10:48:16', '2024-01-23 15:48:16', '2024-01-23 15:48:16'),
(940, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '23/01/2024 10:49:33', '2024-01-23 15:49:33', '2024-01-23 15:49:33'),
(941, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '23/01/2024 10:49:37', '2024-01-23 15:49:37', '2024-01-23 15:49:37'),
(942, 'El jefe Jhan Carlos Cordoba ha rechazado el permiso del colaborador Anderson Cordoba ', 1, 9, '23/01/2024 10:50:24', '2024-01-23 15:50:24', '2024-01-23 15:50:24'),
(943, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial 00008632110050638985 con ID 2', 1, 18, '23/01/2024 10:51:26', '2024-01-23 15:51:26', '2024-01-23 15:51:26'),
(944, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial 00008632110050638985 con ID 2', 1, 18, '23/01/2024 10:51:58', '2024-01-23 15:51:58', '2024-01-23 15:51:58'),
(945, 'Ha generado un permiso por/para n/a', 10, 9, '23/01/2024 10:57:14', '2024-01-23 15:57:14', '2024-01-23 15:57:14'),
(946, 'El jefe Jhan Carlos Cordoba ha aprobado el permiso del colaborador Anderson Cordoba ', 1, 9, '23/01/2024 10:57:26', '2024-01-23 15:57:26', '2024-01-23 15:57:26'),
(947, 'Ha generado un permiso por/para 7u', 10, 9, '23/01/2024 10:59:33', '2024-01-23 15:59:33', '2024-01-23 15:59:33'),
(948, 'El jefe Jhan Carlos Cordoba ha aprobado el permiso del colaborador Anderson Cordoba ', 1, 9, '23/01/2024 10:59:48', '2024-01-23 15:59:48', '2024-01-23 15:59:48'),
(949, 'Ha generado un permiso por/para u', 10, 9, '23/01/2024 11:02:20', '2024-01-23 16:02:20', '2024-01-23 16:02:20'),
(950, 'El jefe Jhan Carlos Cordoba ha aprobado el permiso del colaborador Anderson Cordoba ', 1, 9, '23/01/2024 11:05:11', '2024-01-23 16:05:11', '2024-01-23 16:05:11'),
(951, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '23/01/2024 11:09:39', '2024-01-23 16:09:39', '2024-01-23 16:09:39'),
(952, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '23/01/2024 11:46:32', '2024-01-23 16:46:32', '2024-01-23 16:46:32'),
(953, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ACTIVACION DE MAC', 10, 4, '23/01/2024 11:46:57', '2024-01-23 16:46:57', '2024-01-23 16:46:57'),
(954, 'El usuario jccq12@gmail.com ha visto el ticket con id 37', 1, 7, '23/01/2024 11:47:07', '2024-01-23 16:47:07', '2024-01-23 16:47:07'),
(955, 'Ha generado un permiso por/para N/A', 10, 9, '23/01/2024 11:48:49', '2024-01-23 16:48:49', '2024-01-23 16:48:49'),
(956, 'El jefe Jhan Carlos Cordoba ha aprobado el permiso del colaborador Anderson Cordoba ', 1, 9, '23/01/2024 11:49:03', '2024-01-23 16:49:03', '2024-01-23 16:49:03'),
(957, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 37', 1, 7, '23/01/2024 11:55:50', '2024-01-23 16:55:50', '2024-01-23 16:55:50'),
(958, 'El usuario jccq12@gmail.com creo un ticket llamado sfdsf', 1, 4, '23/01/2024 12:04:17', '2024-01-23 17:04:17', '2024-01-23 17:04:17'),
(959, 'El usuario jccq12@gmail.com creo un ticket llamado adsad', 1, 4, '23/01/2024 12:04:58', '2024-01-23 17:04:58', '2024-01-23 17:04:58'),
(960, 'El usuario jccq12@gmail.com creo un ticket llamado adsad', 1, 4, '23/01/2024 12:05:52', '2024-01-23 17:05:52', '2024-01-23 17:05:52'),
(961, 'El usuario jccq12@gmail.com creo un ticket llamado assda', 1, 4, '23/01/2024 12:06:40', '2024-01-23 17:06:40', '2024-01-23 17:06:40'),
(962, 'El usuario jccq12@gmail.com creo un ticket llamado asdsad', 1, 4, '23/01/2024 12:08:34', '2024-01-23 17:08:34', '2024-01-23 17:08:34'),
(963, 'El usuario jccq12@gmail.com creo un ticket llamado dsad', 1, 4, '23/01/2024 12:10:31', '2024-01-23 17:10:31', '2024-01-23 17:10:31'),
(964, 'El usuario jccq12@gmail.com creo un ticket llamado asda', 1, 4, '23/01/2024 12:11:40', '2024-01-23 17:11:40', '2024-01-23 17:11:40'),
(965, 'El usuario jccq12@gmail.com creo un ticket llamado asdsa', 1, 4, '23/01/2024 12:12:58', '2024-01-23 17:12:58', '2024-01-23 17:12:58'),
(966, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '23/01/2024 12:16:30', '2024-01-23 17:16:30', '2024-01-23 17:16:30'),
(967, 'El usuario Jerson Henao con correo sistemasaux4@eltemplodelamoda.com.co ha ingresado al sistema', 12, 8, '23/01/2024 12:16:46', '2024-01-23 17:16:46', '2024-01-23 17:16:46'),
(968, 'El usuario sistemasaux4@eltemplodelamoda.com.co creo un ticket llamado hghgh', 12, 4, '23/01/2024 12:17:09', '2024-01-23 17:17:09', '2024-01-23 17:17:09'),
(969, 'El usuario jccq12@gmail.com ha visto el ticket con id 46', 1, 7, '23/01/2024 12:17:35', '2024-01-23 17:17:35', '2024-01-23 17:17:35'),
(970, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 45', 10, 7, '23/01/2024 12:18:11', '2024-01-23 17:18:11', '2024-01-23 17:18:11'),
(971, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado ACTIVACION DE MAC', 10, 4, '23/01/2024 12:20:04', '2024-01-23 17:20:04', '2024-01-23 17:20:04'),
(972, 'El usuario jccq12@gmail.com ha visto el ticket con id 47', 1, 7, '23/01/2024 13:44:48', '2024-01-23 18:44:48', '2024-01-23 18:44:48'),
(973, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '23/01/2024 13:51:00', '2024-01-23 18:51:00', '2024-01-23 18:51:00'),
(974, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '23/01/2024 13:59:04', '2024-01-23 18:59:04', '2024-01-23 18:59:04'),
(975, 'Se ha agregado un comentario para el ticket con ID 47', 10, 7, '23/01/2024 14:00:18', '2024-01-23 19:00:18', '2024-01-23 19:00:18'),
(976, 'Se ha eliminado el comentario con ID 196 para el ticket con ID 47', 1, 7, '23/01/2024 14:00:30', '2024-01-23 19:00:30', '2024-01-23 19:00:30'),
(977, 'El usuario sistemasaux8@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 37', 10, 7, '23/01/2024 14:23:41', '2024-01-23 19:23:41', '2024-01-23 19:23:41'),
(978, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '23/01/2024 16:12:58', '2024-01-23 21:12:58', '2024-01-23 21:12:58'),
(979, 'El usuario Jhan Carlos Cordoba ha creado un acta para Anderson Cordoba para la siguiente dirección TEMPLO 2', 1, 17, '23/01/2024 16:13:20', '2024-01-23 21:13:20', '2024-01-23 21:13:20'),
(980, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '24/01/2024 08:39:13', '2024-01-24 13:39:13', '2024-01-24 13:39:13'),
(981, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '24/01/2024 09:15:31', '2024-01-24 14:15:31', '2024-01-24 14:15:31'),
(982, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '24/01/2024 10:23:01', '2024-01-24 15:23:01', '2024-01-24 15:23:01'),
(983, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '24/01/2024 10:23:41', '2024-01-24 15:23:41', '2024-01-24 15:23:41'),
(984, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '24/01/2024 16:05:29', '2024-01-24 21:05:29', '2024-01-24 21:05:29'),
(985, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '24/01/2024 16:46:08', '2024-01-24 21:46:08', '2024-01-24 21:46:08'),
(986, 'El usuario jccq12@gmail.com creo un ticket llamado sfsdf', 1, 4, '24/01/2024 16:53:51', '2024-01-24 21:53:51', '2024-01-24 21:53:51'),
(987, 'El usuario jccq12@gmail.com creo un ticket llamado asd', 1, 4, '24/01/2024 16:54:40', '2024-01-24 21:54:40', '2024-01-24 21:54:40'),
(988, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '25/01/2024 08:34:24', '2024-01-25 13:34:24', '2024-01-25 13:34:24'),
(989, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '25/01/2024 10:24:12', '2024-01-25 15:24:12', '2024-01-25 15:24:12'),
(990, 'Se han modificado los datos del usuario analistadesistemas@eltemplodelamoda.com.co', 1, 2, '25/01/2024 11:32:55', '2024-01-25 16:32:55', '2024-01-25 16:32:55'),
(991, 'Se han modificado los datos del usuario analistadesistemas@eltemplodelamoda.com.co', 1, 2, '25/01/2024 11:33:03', '2024-01-25 16:33:03', '2024-01-25 16:33:03'),
(992, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '25/01/2024 11:51:32', '2024-01-25 16:51:32', '2024-01-25 16:51:32'),
(993, 'El usuario jccq12@gmail.com creo un ticket llamado MAC', 1, 4, '25/01/2024 11:51:59', '2024-01-25 16:51:59', '2024-01-25 16:51:59'),
(994, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 52', 10, 7, '25/01/2024 11:52:07', '2024-01-25 16:52:07', '2024-01-25 16:52:07'),
(995, 'Se ha creado un nuevo archivo con llamado INFORME DE BASE DE DATOS en el directorio con ID 9', 1, 14, '25/01/2024 13:54:55', '2024-01-25 18:54:55', '2024-01-25 18:54:55'),
(996, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '26/01/2024 08:41:29', '2024-01-26 13:41:29', '2024-01-26 13:41:29'),
(997, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '26/01/2024 11:17:28', '2024-01-26 16:17:28', '2024-01-26 16:17:28'),
(998, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '26/01/2024 14:09:59', '2024-01-26 19:09:59', '2024-01-26 19:09:59'),
(999, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '27/01/2024 08:42:02', '2024-01-27 13:42:02', '2024-01-27 13:42:02'),
(1000, 'El usuario Jhan Carlos  Cordoba Quiñonez con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 16, 8, '27/01/2024 08:43:06', '2024-01-27 13:43:06', '2024-01-27 13:43:06'),
(1001, 'El usuario sistemasaux9@eltemplodelamoda.com.co creo un ticket llamado TICKET', 16, 4, '27/01/2024 08:43:31', '2024-01-27 13:43:31', '2024-01-27 13:43:31'),
(1002, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '27/01/2024 08:43:57', '2024-01-27 13:43:57', '2024-01-27 13:43:57'),
(1003, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '27/01/2024 09:51:35', '2024-01-27 14:51:35', '2024-01-27 14:51:35'),
(1004, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '27/01/2024 09:57:23', '2024-01-27 14:57:23', '2024-01-27 14:57:23'),
(1005, 'El usuario soporte@eltemplodelamoda.com.co ha cambiado el estado del usuario sistemasaux9@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 2, 3, '27/01/2024 09:57:37', '2024-01-27 14:57:37', '2024-01-27 14:57:37'),
(1006, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '27/01/2024 09:58:19', '2024-01-27 14:58:19', '2024-01-27 14:58:19'),
(1007, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '27/01/2024 10:39:01', '2024-01-27 15:39:01', '2024-01-27 15:39:01'),
(1008, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '27/01/2024 10:44:28', '2024-01-27 15:44:28', '2024-01-27 15:44:28'),
(1009, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '27/01/2024 10:51:57', '2024-01-27 15:51:57', '2024-01-27 15:51:57'),
(1010, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado PROBLEMA EN CAJA', 10, 4, '27/01/2024 10:57:36', '2024-01-27 15:57:36', '2024-01-27 15:57:36'),
(1011, 'El usuario jccq12@gmail.com ha visto el ticket con id 54', 1, 7, '27/01/2024 11:03:25', '2024-01-27 16:03:25', '2024-01-27 16:03:25'),
(1012, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '27/01/2024 11:05:12', '2024-01-27 16:05:12', '2024-01-27 16:05:12'),
(1013, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '27/01/2024 11:09:14', '2024-01-27 16:09:14', '2024-01-27 16:09:14'),
(1014, 'Se han modificado los datos del usuario sistemasaux9@eltemplodelamoda.com.co', 2, 2, '27/01/2024 11:10:31', '2024-01-27 16:10:31', '2024-01-27 16:10:31'),
(1015, 'Se han modificado los datos del usuario sistemasaux9@eltemplodelamoda.com.co', 2, 2, '27/01/2024 11:17:53', '2024-01-27 16:17:53', '2024-01-27 16:17:53'),
(1016, 'Se han modificado los datos del usuario sistemasaux21@eltemplodelamoda.com.co', 2, 2, '27/01/2024 11:18:14', '2024-01-27 16:18:14', '2024-01-27 16:18:14'),
(1017, 'Se han modificado los datos del usuario sistemasaux9@eltemplodelamoda.com.co', 2, 2, '27/01/2024 11:18:21', '2024-01-27 16:18:21', '2024-01-27 16:18:21'),
(1018, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '27/01/2024 11:18:46', '2024-01-27 16:18:46', '2024-01-27 16:18:46'),
(1019, 'Se han modificado los datos del usuario sistemasaux9@eltemplodelamoda.com.co', 1, 2, '27/01/2024 11:43:21', '2024-01-27 16:43:21', '2024-01-27 16:43:21'),
(1020, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '29/01/2024 09:15:48', '2024-01-29 14:15:48', '2024-01-29 14:15:48'),
(1021, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '29/01/2024 11:26:11', '2024-01-29 16:26:11', '2024-01-29 16:26:11'),
(1022, 'Se ha creado el siguiente usuario sistemasaux22@eltemplodelamoda.com.co', 1, 1, '29/01/2024 11:35:01', '2024-01-29 16:35:01', '2024-01-29 16:35:01'),
(1023, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '29/01/2024 12:09:14', '2024-01-29 17:09:14', '2024-01-29 17:09:14'),
(1024, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '29/01/2024 12:09:50', '2024-01-29 17:09:50', '2024-01-29 17:09:50'),
(1025, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '29/01/2024 12:18:46', '2024-01-29 17:18:46', '2024-01-29 17:18:46'),
(1026, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '29/01/2024 12:18:53', '2024-01-29 17:18:53', '2024-01-29 17:18:53'),
(1027, 'El usuario jccq12@gmail.com creo un ticket llamado ACTIVACION MAC', 1, 4, '29/01/2024 12:19:20', '2024-01-29 17:19:20', '2024-01-29 17:19:20'),
(1028, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 55', 10, 7, '29/01/2024 12:19:28', '2024-01-29 17:19:28', '2024-01-29 17:19:28'),
(1029, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 55', 10, 7, '29/01/2024 12:19:36', '2024-01-29 17:19:36', '2024-01-29 17:19:36'),
(1030, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '29/01/2024 12:20:48', '2024-01-29 17:20:48', '2024-01-29 17:20:48'),
(1031, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 55', 1, 7, '29/01/2024 12:20:54', '2024-01-29 17:20:54', '2024-01-29 17:20:54'),
(1032, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 55', 1, 7, '29/01/2024 12:24:07', '2024-01-29 17:24:07', '2024-01-29 17:24:07'),
(1033, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 55', 1, 7, '29/01/2024 12:27:45', '2024-01-29 17:27:45', '2024-01-29 17:27:45'),
(1034, 'El usuario jccq12@gmail.com Re abrio el ticket con id 55', 1, 11, '29/01/2024 12:28:19', '2024-01-29 17:28:19', '2024-01-29 17:28:19'),
(1035, 'El usuario jccq12@gmail.com ha eliminado el ticket con id 55', 1, 6, '29/01/2024 12:28:28', '2024-01-29 17:28:28', '2024-01-29 17:28:28'),
(1036, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '29/01/2024 13:36:42', '2024-01-29 18:36:42', '2024-01-29 18:36:42'),
(1037, 'El usuario sistemasaux9@eltemplodelamoda.com.co creo un ticket llamado CAMPO DE COMPUTADOR', 23, 4, '29/01/2024 13:44:17', '2024-01-29 18:44:17', '2024-01-29 18:44:17'),
(1038, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '29/01/2024 13:48:50', '2024-01-29 18:48:50', '2024-01-29 18:48:50'),
(1039, 'El usuario jccq12@gmail.com ha visto el ticket con id 56', 1, 7, '29/01/2024 13:49:03', '2024-01-29 18:49:03', '2024-01-29 18:49:03'),
(1040, 'El usuario jccq12@gmail.com ha visto el ticket con id 56', 1, 7, '29/01/2024 13:50:43', '2024-01-29 18:50:43', '2024-01-29 18:50:43'),
(1041, 'Se ha eliminado el comentario con ID 198 para el ticket con ID 56', 23, 7, '29/01/2024 15:04:02', '2024-01-29 20:04:02', '2024-01-29 20:04:02'),
(1042, 'Se ha eliminado el comentario con ID 197 para el ticket con ID 56', 1, 7, '29/01/2024 15:07:27', '2024-01-29 20:07:27', '2024-01-29 20:07:27'),
(1043, 'Se ha agregado una calificacion de 4 estrellas para el ticket con ID 56', 23, 7, '29/01/2024 15:11:34', '2024-01-29 20:11:34', '2024-01-29 20:11:34'),
(1044, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '29/01/2024 15:13:30', '2024-01-29 20:13:30', '2024-01-29 20:13:30'),
(1045, 'Se ha agregado una calificacion de 3 estrellas para el ticket con ID 56', 23, 7, '29/01/2024 15:13:52', '2024-01-29 20:13:52', '2024-01-29 20:13:52'),
(1046, 'Se ha agregado una calificacion de 5 estrellas para el ticket con ID 56', 23, 7, '29/01/2024 15:14:10', '2024-01-29 20:14:10', '2024-01-29 20:14:10'),
(1047, 'Se ha agregado una calificacion de 4 estrellas para el ticket con ID 56', 23, 7, '29/01/2024 15:14:30', '2024-01-29 20:14:30', '2024-01-29 20:14:30'),
(1048, 'Se ha editado el ticket con ID 56', 23, 7, '29/01/2024 15:21:53', '2024-01-29 20:21:53', '2024-01-29 20:21:53'),
(1049, 'Se ha editado el ticket con ID 56', 23, 7, '29/01/2024 15:23:45', '2024-01-29 20:23:45', '2024-01-29 20:23:45'),
(1050, 'El usuario jccq12@gmail.com Re abrio el ticket con id 15', 1, 11, '29/01/2024 15:28:50', '2024-01-29 20:28:50', '2024-01-29 20:28:50'),
(1051, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 56', 1, 7, '29/01/2024 15:32:06', '2024-01-29 20:32:06', '2024-01-29 20:32:06'),
(1052, 'El usuario sistemasaux9@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 56', 23, 7, '29/01/2024 16:51:13', '2024-01-29 21:51:13', '2024-01-29 21:51:13'),
(1053, 'El usuario sistemasaux9@eltemplodelamoda.com.co ha eliminado el ticket con id 56', 23, 6, '29/01/2024 17:02:15', '2024-01-29 22:02:15', '2024-01-29 22:02:15'),
(1054, 'El usuario sistemasaux9@eltemplodelamoda.com.co Re abrio el ticket con id 56', 23, 11, '29/01/2024 17:06:20', '2024-01-29 22:06:20', '2024-01-29 22:06:20'),
(1055, 'El usuario jccq12@gmail.com ha visto el ticket con id 56', 1, 7, '29/01/2024 17:06:29', '2024-01-29 22:06:29', '2024-01-29 22:06:29'),
(1056, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 18 para Anderson Cordoba para la siguiente dirección ', 1, 17, '30/01/2024 08:35:56', '2024-01-30 13:35:56', '2024-01-30 13:35:56'),
(1057, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '30/01/2024 09:16:14', '2024-01-30 14:16:14', '2024-01-30 14:16:14'),
(1058, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFon8h', 1, 18, '30/01/2024 09:16:35', '2024-01-30 14:16:35', '2024-01-30 14:16:35'),
(1059, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFGeAI', 1, 18, '30/01/2024 09:16:39', '2024-01-30 14:16:39', '2024-01-30 14:16:39'),
(1060, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFe3xz', 1, 18, '30/01/2024 09:16:43', '2024-01-30 14:16:43', '2024-01-30 14:16:43'),
(1061, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial 00008632110050638985', 1, 18, '30/01/2024 09:16:48', '2024-01-30 14:16:48', '2024-01-30 14:16:48'),
(1062, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial 32B96214010515', 1, 18, '30/01/2024 09:16:53', '2024-01-30 14:16:53', '2024-01-30 14:16:53'),
(1063, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial REFGeAI', 1, 18, '30/01/2024 09:16:57', '2024-01-30 14:16:57', '2024-01-30 14:16:57'),
(1064, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial REFGeAI', 1, 18, '30/01/2024 09:17:01', '2024-01-30 14:17:01', '2024-01-30 14:17:01'),
(1065, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial TDM67516', 1, 18, '30/01/2024 10:02:38', '2024-01-30 15:02:38', '2024-01-30 15:02:38'),
(1066, 'El usuario jccq12@gmail.com creo un ticket llamado ASD', 1, 4, '30/01/2024 10:44:05', '2024-01-30 15:44:05', '2024-01-30 15:44:05'),
(1067, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial TDM67516 con ID 6', 1, 18, '30/01/2024 10:54:33', '2024-01-30 15:54:33', '2024-01-30 15:54:33'),
(1068, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial TDM67516 con ID 6', 1, 18, '30/01/2024 10:59:03', '2024-01-30 15:59:03', '2024-01-30 15:59:03'),
(1069, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial TDM67516', 1, 18, '30/01/2024 11:23:26', '2024-01-30 16:23:26', '2024-01-30 16:23:26'),
(1070, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial TDM67516', 1, 18, '30/01/2024 11:23:31', '2024-01-30 16:23:31', '2024-01-30 16:23:31'),
(1071, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial TDM67516', 1, 18, '30/01/2024 11:24:54', '2024-01-30 16:24:54', '2024-01-30 16:24:54'),
(1072, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial TDM67516', 1, 18, '30/01/2024 11:24:59', '2024-01-30 16:24:59', '2024-01-30 16:24:59'),
(1073, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial TDM67516', 1, 18, '30/01/2024 11:33:44', '2024-01-30 16:33:44', '2024-01-30 16:33:44'),
(1074, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial TDM67516', 1, 18, '30/01/2024 11:59:09', '2024-01-30 16:59:09', '2024-01-30 16:59:09'),
(1075, 'El usuario Jhan Carlos Cordoba ha eliminado el producto con la siguiente serial TDM67516', 1, 18, '30/01/2024 12:02:52', '2024-01-30 17:02:52', '2024-01-30 17:02:52'),
(1076, 'El usuario Jhan Carlos Cordoba ha activado el producto con la siguiente serial TDM67516', 1, 18, '30/01/2024 12:04:23', '2024-01-30 17:04:23', '2024-01-30 17:04:23'),
(1077, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '30/01/2024 12:08:14', '2024-01-30 17:08:14', '2024-01-30 17:08:14'),
(1078, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 19 para Jhan Carlos Cordoba para la siguiente dirección ', 1, 17, '30/01/2024 12:12:51', '2024-01-30 17:12:51', '2024-01-30 17:12:51'),
(1079, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '30/01/2024 13:42:58', '2024-01-30 18:42:58', '2024-01-30 18:42:58'),
(1080, 'Se ha creado un nuevo repositorio con llamado PRUEBA', 23, 12, '30/01/2024 13:54:57', '2024-01-30 18:54:57', '2024-01-30 18:54:57'),
(1081, 'Se ha creado un nuevo archivo con llamado ARCHIVO DE PRUEBA en el directorio con ID 10', 23, 14, '30/01/2024 14:12:48', '2024-01-30 19:12:48', '2024-01-30 19:12:48'),
(1082, 'Se ha eliminado un archivo llamado ARCHIVO DE PRUEBA V2 con ID 9', 23, 16, '30/01/2024 14:49:24', '2024-01-30 19:49:24', '2024-01-30 19:49:24'),
(1083, 'Se ha eliminado un directorio llamado PRUEBA con ID 10', 23, 13, '30/01/2024 14:56:28', '2024-01-30 19:56:28', '2024-01-30 19:56:28'),
(1084, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '30/01/2024 15:10:50', '2024-01-30 20:10:50', '2024-01-30 20:10:50'),
(1085, 'El usuario jccq12@gmail.com creo un ticket llamado HACERLE LA COMIIDA A LEONARDO', 1, 4, '30/01/2024 15:11:26', '2024-01-30 20:11:26', '2024-01-30 20:11:26'),
(1086, 'El usuario Adrian Garcia con correo sistemasaux10@eltemplodelamoda.com.co ha ingresado al sistema', 15, 8, '30/01/2024 15:14:13', '2024-01-30 20:14:13', '2024-01-30 20:14:13'),
(1087, 'El usuario sistemasaux10@eltemplodelamoda.com.co ha visto el ticket con id 58', 15, 7, '30/01/2024 15:14:25', '2024-01-30 20:14:25', '2024-01-30 20:14:25'),
(1088, 'El usuario sistemasaux10@eltemplodelamoda.com.co inicio la ejecución del ticket con id 58', 15, 7, '30/01/2024 15:14:56', '2024-01-30 20:14:56', '2024-01-30 20:14:56'),
(1089, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '30/01/2024 15:15:21', '2024-01-30 20:15:21', '2024-01-30 20:15:21'),
(1090, 'Se ha eliminado el comentario con ID 201 para el ticket con ID 58', 1, 7, '30/01/2024 15:16:06', '2024-01-30 20:16:06', '2024-01-30 20:16:06'),
(1091, 'Se ha eliminado el comentario con ID 201 para el ticket con ID 58', 1, 7, '30/01/2024 15:16:06', '2024-01-30 20:16:06', '2024-01-30 20:16:06'),
(1092, 'Se ha eliminado el comentario con ID 202 para el ticket con ID 58', 1, 7, '30/01/2024 15:16:10', '2024-01-30 20:16:10', '2024-01-30 20:16:10'),
(1093, 'El usuario Adrian Garcia con correo sistemasaux10@eltemplodelamoda.com.co ha ingresado al sistema', 15, 8, '30/01/2024 15:17:16', '2024-01-30 20:17:16', '2024-01-30 20:17:16'),
(1094, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '30/01/2024 15:58:37', '2024-01-30 20:58:37', '2024-01-30 20:58:37'),
(1095, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '30/01/2024 16:09:15', '2024-01-30 21:09:15', '2024-01-30 21:09:15'),
(1096, 'Ha generado un permiso por/para n/A', 10, 9, '30/01/2024 16:15:51', '2024-01-30 21:15:51', '2024-01-30 21:15:51'),
(1097, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '30/01/2024 16:32:34', '2024-01-30 21:32:34', '2024-01-30 21:32:34'),
(1098, 'El jefe Jhan Carlos Cordoba ha aprobado el permiso del colaborador Anderson Cordoba ', 1, 9, '30/01/2024 16:33:50', '2024-01-30 21:33:50', '2024-01-30 21:33:50'),
(1099, 'El jefe Jhan Carlos Cordoba ha rechazado el permiso del colaborador Anderson Cordoba ', 1, 9, '30/01/2024 16:41:27', '2024-01-30 21:41:27', '2024-01-30 21:41:27'),
(1100, 'El jefe Jhan Carlos Cordoba ha aprobado el permiso del colaborador Anderson Cordoba ', 1, 9, '30/01/2024 17:18:25', '2024-01-30 22:18:25', '2024-01-30 22:18:25'),
(1101, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '30/01/2024 17:20:38', '2024-01-30 22:20:38', '2024-01-30 22:20:38'),
(1102, 'El recepcionista Jhan Carlos  Cordoba ha dado salida al colaborador Anderson Cordoba ', 23, 9, '30/01/2024 17:27:21', '2024-01-30 22:27:21', '2024-01-30 22:27:21'),
(1103, 'El recepcionista Jhan Carlos  Cordoba ha dado entrada al colaborador Anderson Cordoba ', 23, 9, '30/01/2024 17:29:46', '2024-01-30 22:29:46', '2024-01-30 22:29:46'),
(1104, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '31/01/2024 08:23:58', '2024-01-31 13:23:58', '2024-01-31 13:23:58'),
(1105, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '31/01/2024 08:25:16', '2024-01-31 13:25:16', '2024-01-31 13:25:16'),
(1106, 'El usuario Jhan Carlos  Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 23, 8, '31/01/2024 08:27:11', '2024-01-31 13:27:11', '2024-01-31 13:27:11'),
(1107, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '31/01/2024 08:27:28', '2024-01-31 13:27:28', '2024-01-31 13:27:28'),
(1108, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial TDM540457', 1, 18, '31/01/2024 08:43:51', '2024-01-31 13:43:51', '2024-01-31 13:43:51'),
(1109, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '31/01/2024 08:54:59', '2024-01-31 13:54:59', '2024-01-31 13:54:59'),
(1110, 'El usuario jccq12@gmail.com ha cambiado el estado del usuario sistemasaux20@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 1, 3, '31/01/2024 09:09:46', '2024-01-31 14:09:46', '2024-01-31 14:09:46'),
(1111, 'Se han modificado los datos del usuario sistemasaux22@eltemplodelamoda.com.co', 1, 2, '31/01/2024 09:10:22', '2024-01-31 14:10:22', '2024-01-31 14:10:22'),
(1112, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '31/01/2024 09:10:55', '2024-01-31 14:10:55', '2024-01-31 14:10:55'),
(1113, 'Se han modificado los datos del usuario sistemasaux21@eltemplodelamoda.com.co', 2, 2, '31/01/2024 09:11:18', '2024-01-31 14:11:18', '2024-01-31 14:11:18'),
(1114, 'Se han modificado los datos del usuario sistemasaux9@eltemplodelamoda.com.co', 2, 2, '31/01/2024 09:11:36', '2024-01-31 14:11:36', '2024-01-31 14:11:36'),
(1115, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '31/01/2024 09:11:50', '2024-01-31 14:11:50', '2024-01-31 14:11:50'),
(1116, 'El usuario Jhan Carlos Cordoba ha creado un acta para USUARIO DE PRUEBAS para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '31/01/2024 09:15:43', '2024-01-31 14:15:43', '2024-01-31 14:15:43'),
(1117, 'El usuario Jhan Carlos Cordoba ha Despachado los componentes asignados al acta con ID 20 para USUARIO DE PRUEBAS para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '31/01/2024 10:07:54', '2024-01-31 15:07:54', '2024-01-31 15:07:54'),
(1118, 'El usuario Jhan Carlos Cordoba ha Despachado los componentes asignados al acta con ID 20 para USUARIO DE PRUEBAS para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '31/01/2024 10:09:26', '2024-01-31 15:09:26', '2024-01-31 15:09:26'),
(1119, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 20 para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '31/01/2024 10:22:25', '2024-01-31 15:22:25', '2024-01-31 15:22:25'),
(1120, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 20 para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '31/01/2024 10:30:00', '2024-01-31 15:30:00', '2024-01-31 15:30:00'),
(1121, 'El usuario Jhan Carlos Cordoba ha Despachado los componentes asignados al acta con ID 20 para USUARIO DE PRUEBAS para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '31/01/2024 10:33:36', '2024-01-31 15:33:36', '2024-01-31 15:33:36'),
(1122, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 20 para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '31/01/2024 11:06:51', '2024-01-31 16:06:51', '2024-01-31 16:06:51'),
(1123, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 20 para USUARIO DE PRUEBAS para la siguiente dirección ', 1, 17, '31/01/2024 11:47:03', '2024-01-31 16:47:03', '2024-01-31 16:47:03'),
(1124, 'Se ha creado un nuevo archivo con llamado asdasd en el directorio con ID 9', 1, 14, '31/01/2024 12:17:47', '2024-01-31 17:17:47', '2024-01-31 17:17:47'),
(1125, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '31/01/2024 14:00:41', '2024-01-31 19:00:41', '2024-01-31 19:00:41'),
(1126, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '31/01/2024 14:01:37', '2024-01-31 19:01:37', '2024-01-31 19:01:37'),
(1127, 'Se han modificado los datos del usuario sistemasaux9@eltemplodelamoda.com.co', 2, 2, '31/01/2024 14:01:56', '2024-01-31 19:01:56', '2024-01-31 19:01:56'),
(1128, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '31/01/2024 14:13:20', '2024-01-31 19:13:20', '2024-01-31 19:13:20'),
(1129, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '31/01/2024 16:19:31', '2024-01-31 21:19:31', '2024-01-31 21:19:31'),
(1130, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '31/01/2024 16:24:27', '2024-01-31 21:24:27', '2024-01-31 21:24:27'),
(1131, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '01/02/2024 09:32:39', '2024-02-01 14:32:39', '2024-02-01 14:32:39'),
(1132, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '01/02/2024 09:43:21', '2024-02-01 14:43:21', '2024-02-01 14:43:21'),
(1133, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '01/02/2024 12:28:36', '2024-02-01 17:28:36', '2024-02-01 17:28:36'),
(1134, 'El usuario Jhan Carlos Cordoba ha Despachado los componentes asignados al acta con ID 21 para Jhan Carlos Cordoba para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '01/02/2024 12:29:40', '2024-02-01 17:29:40', '2024-02-01 17:29:40'),
(1135, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 21 para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '01/02/2024 12:30:12', '2024-02-01 17:30:12', '2024-02-01 17:30:12'),
(1136, 'Se han modificado los datos del usuario sistemasaux4@eltemplodelamoda.com.co', 1, 2, '01/02/2024 13:49:18', '2024-02-01 18:49:18', '2024-02-01 18:49:18'),
(1137, 'Se han modificado los datos del usuario sistemasaux2@eltemplodelamoda.com.co', 1, 2, '01/02/2024 13:49:45', '2024-02-01 18:49:45', '2024-02-01 18:49:45'),
(1138, 'El usuario jccq12@gmail.com ha cambiado el estado del usuario sistemasaux6@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 1, 3, '01/02/2024 13:49:57', '2024-02-01 18:49:57', '2024-02-01 18:49:57'),
(1139, 'El usuario jccq12@gmail.com ha cambiado el estado del usuario sistemasaux4@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 1, 3, '01/02/2024 13:50:09', '2024-02-01 18:50:09', '2024-02-01 18:50:09'),
(1140, 'El usuario Jhan Carlos Cordoba ha Despachado los componentes asignados al acta con ID 22 para PCCOM para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '01/02/2024 13:53:16', '2024-02-01 18:53:16', '2024-02-01 18:53:16'),
(1141, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 22 para PCCOM para la siguiente dirección ', 1, 17, '01/02/2024 13:56:11', '2024-02-01 18:56:11', '2024-02-01 18:56:11'),
(1142, 'El usuario jccq12@gmail.com creo un ticket llamado AYUDA CON EQUIPO DE NOMINA', 1, 4, '01/02/2024 14:37:11', '2024-02-01 19:37:11', '2024-02-01 19:37:11'),
(1143, 'El usuario jccq12@gmail.com ha visto el ticket con id 59', 1, 7, '01/02/2024 14:37:19', '2024-02-01 19:37:19', '2024-02-01 19:37:19'),
(1144, 'El usuario USUARIO DE PRUEBAS con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 24, 8, '01/02/2024 14:51:01', '2024-02-01 19:51:01', '2024-02-01 19:51:01'),
(1145, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '01/02/2024 14:53:37', '2024-02-01 19:53:37', '2024-02-01 19:53:37'),
(1146, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '01/02/2024 14:57:52', '2024-02-01 19:57:52', '2024-02-01 19:57:52'),
(1147, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '01/02/2024 14:58:08', '2024-02-01 19:58:08', '2024-02-01 19:58:08'),
(1148, 'Se ha editado el ticket con ID 59', 10, 7, '01/02/2024 14:58:32', '2024-02-01 19:58:32', '2024-02-01 19:58:32'),
(1149, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '01/02/2024 14:59:17', '2024-02-01 19:59:17', '2024-02-01 19:59:17'),
(1150, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '01/02/2024 15:00:05', '2024-02-01 20:00:05', '2024-02-01 20:00:05'),
(1151, 'El usuario Anderson Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '01/02/2024 15:04:36', '2024-02-01 20:04:36', '2024-02-01 20:04:36'),
(1152, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '01/02/2024 15:06:44', '2024-02-01 20:06:44', '2024-02-01 20:06:44'),
(1153, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '03/02/2024 11:15:20', '2024-02-03 16:15:20', '2024-02-03 16:15:20'),
(1154, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '03/02/2024 12:29:14', '2024-02-03 17:29:14', '2024-02-03 17:29:14'),
(1155, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/02/2024 08:51:27', '2024-02-05 13:51:27', '2024-02-05 13:51:27'),
(1156, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/02/2024 10:11:47', '2024-02-05 15:11:47', '2024-02-05 15:11:47'),
(1157, 'El usuario USUARIO DE PRUEBAS con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 24, 8, '05/02/2024 10:46:30', '2024-02-05 15:46:30', '2024-02-05 15:46:30'),
(1158, 'El usuario sistemasaux9@eltemplodelamoda.com.co ha cambiado el estado del usuario sistemasaux21@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 24, 3, '05/02/2024 10:47:40', '2024-02-05 15:47:40', '2024-02-05 15:47:40'),
(1159, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '05/02/2024 10:51:39', '2024-02-05 15:51:39', '2024-02-05 15:51:39'),
(1160, 'El usuario soporte@eltemplodelamoda.com.co ha cambiado el estado del usuario sistemasaux9@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 2, 3, '05/02/2024 10:52:58', '2024-02-05 15:52:58', '2024-02-05 15:52:58'),
(1161, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '05/02/2024 10:55:12', '2024-02-05 15:55:12', '2024-02-05 15:55:12'),
(1162, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '05/02/2024 11:51:18', '2024-02-05 16:51:18', '2024-02-05 16:51:18'),
(1163, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '06/02/2024 08:46:57', '2024-02-06 13:46:57', '2024-02-06 13:46:57'),
(1164, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '07/02/2024 08:21:44', '2024-02-07 13:21:44', '2024-02-07 13:21:44'),
(1165, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '07/02/2024 09:50:50', '2024-02-07 14:50:50', '2024-02-07 14:50:50'),
(1166, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '07/02/2024 09:55:16', '2024-02-07 14:55:16', '2024-02-07 14:55:16'),
(1167, 'El usuario jccq12@gmail.com ha cambiado el estado del usuario sistemasaux9@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 1, 3, '07/02/2024 10:02:51', '2024-02-07 15:02:51', '2024-02-07 15:02:51'),
(1168, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '07/02/2024 10:14:54', '2024-02-07 15:14:54', '2024-02-07 15:14:54'),
(1169, 'El usuario Anderson Cordoba ha eliminado el acta con ID 23 para Jhan Carlos Cordoba para la siguiente dirección ', 10, 17, '07/02/2024 10:15:36', '2024-02-07 15:15:36', '2024-02-07 15:15:36'),
(1170, 'El usuario Anderson Cordoba ha creado un acta para Jhan Carlos La maravilla para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '07/02/2024 10:16:34', '2024-02-07 15:16:34', '2024-02-07 15:16:34'),
(1171, 'El usuario Anderson Cordoba ha Despachado los componentes asignados al acta con ID 24 para Jhan Carlos La maravilla para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '07/02/2024 10:17:02', '2024-02-07 15:17:02', '2024-02-07 15:17:02'),
(1172, 'El usuario Anderson Cordoba ha eliminado el acta con ID 24 para Jhan Carlos La maravilla para la siguiente dirección ', 10, 17, '07/02/2024 10:18:37', '2024-02-07 15:18:37', '2024-02-07 15:18:37'),
(1173, 'El usuario Anderson Cordoba ha creado un acta para Sebastian Hinestroza para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '07/02/2024 10:19:11', '2024-02-07 15:19:11', '2024-02-07 15:19:11'),
(1174, 'El usuario Anderson Cordoba ha Despachado los componentes asignados al acta con ID 25 para Sebastian Hinestroza para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '07/02/2024 10:19:31', '2024-02-07 15:19:31', '2024-02-07 15:19:31'),
(1175, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '07/02/2024 10:19:41', '2024-02-07 15:19:41', '2024-02-07 15:19:41'),
(1176, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '07/02/2024 10:22:25', '2024-02-07 15:22:25', '2024-02-07 15:22:25'),
(1177, 'El usuario Anderson Cordoba ha recibido los componentes asignados al acta con ID 24 para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '07/02/2024 10:22:53', '2024-02-07 15:22:53', '2024-02-07 15:22:53'),
(1178, 'El usuario Anderson Cordoba ha recibido los componentes asignados al acta con ID 25 para la siguiente dirección OFICINA ADMINISTRATIVA', 10, 17, '07/02/2024 10:23:16', '2024-02-07 15:23:16', '2024-02-07 15:23:16'),
(1179, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '07/02/2024 11:17:22', '2024-02-07 16:17:22', '2024-02-07 16:17:22'),
(1180, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '07/02/2024 16:07:44', '2024-02-07 21:07:44', '2024-02-07 21:07:44'),
(1181, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '07/02/2024 17:09:36', '2024-02-07 22:09:36', '2024-02-07 22:09:36'),
(1182, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '08/02/2024 08:38:30', '2024-02-08 13:38:30', '2024-02-08 13:38:30'),
(1183, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial TDM885835', 1, 18, '08/02/2024 10:34:30', '2024-02-08 15:34:30', '2024-02-08 15:34:30'),
(1184, 'El usuario Jhan Carlos Cordoba ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección OFICINA ADMINISTRATIVA', 1, 17, '08/02/2024 10:35:22', '2024-02-08 15:35:22', '2024-02-08 15:35:22'),
(1185, 'El usuario Jhan Carlos Cordoba ha eliminado el acta con ID 26 para Jhan Carlos Cordoba para la siguiente dirección ', 1, 17, '08/02/2024 10:36:53', '2024-02-08 15:36:53', '2024-02-08 15:36:53'),
(1186, 'El usuario Jhan Carlos La maravilla con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 24, 8, '08/02/2024 11:07:34', '2024-02-08 16:07:34', '2024-02-08 16:07:34'),
(1187, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '08/02/2024 11:53:57', '2024-02-08 16:53:57', '2024-02-08 16:53:57'),
(1188, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '08/02/2024 12:18:22', '2024-02-08 17:18:22', '2024-02-08 17:18:22'),
(1189, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado AYUDA CON COSAS', 10, 4, '08/02/2024 12:19:06', '2024-02-08 17:19:06', '2024-02-08 17:19:06'),
(1190, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asd', 10, 4, '08/02/2024 12:19:59', '2024-02-08 17:19:59', '2024-02-08 17:19:59'),
(1191, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 61', 10, 7, '08/02/2024 12:20:07', '2024-02-08 17:20:07', '2024-02-08 17:20:07'),
(1192, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha eliminado el ticket con id 61', 10, 6, '08/02/2024 12:20:16', '2024-02-08 17:20:16', '2024-02-08 17:20:16'),
(1193, 'El usuario sistemasaux8@eltemplodelamoda.com.co creo un ticket llamado asda', 10, 4, '08/02/2024 12:20:34', '2024-02-08 17:20:34', '2024-02-08 17:20:34'),
(1194, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '09/02/2024 15:28:02', '2024-02-09 20:28:02', '2024-02-09 20:28:02'),
(1195, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '10/02/2024 09:32:30', '2024-02-10 14:32:30', '2024-02-10 14:32:30'),
(1196, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '11/02/2024 19:14:41', '2024-02-12 00:14:41', '2024-02-12 00:14:41'),
(1197, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '11/02/2024 19:29:09', '2024-02-12 00:29:09', '2024-02-12 00:29:09'),
(1198, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 2, 2, '12/02/2024 19:56:00', '2024-02-13 00:56:00', '2024-02-13 00:56:00'),
(1199, 'Se han modificado los datos del usuario jccq12@gmail.com', 2, 2, '12/02/2024 19:56:25', '2024-02-13 00:56:25', '2024-02-13 00:56:25'),
(1200, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '12/02/2024 19:56:38', '2024-02-13 00:56:38', '2024-02-13 00:56:38'),
(1201, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '12/02/2024 20:00:22', '2024-02-13 01:00:22', '2024-02-13 01:00:22'),
(1202, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '12/02/2024 20:56:14', '2024-02-13 01:56:14', '2024-02-13 01:56:14'),
(1203, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '12/02/2024 20:56:44', '2024-02-13 01:56:44', '2024-02-13 01:56:44'),
(1204, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '12/02/2024 21:01:43', '2024-02-13 02:01:43', '2024-02-13 02:01:43'),
(1205, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '12/02/2024 21:07:37', '2024-02-13 02:07:37', '2024-02-13 02:07:37'),
(1206, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '12/02/2024 21:08:06', '2024-02-13 02:08:06', '2024-02-13 02:08:06'),
(1207, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '12/02/2024 21:08:38', '2024-02-13 02:08:38', '2024-02-13 02:08:38'),
(1208, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '12/02/2024 21:09:16', '2024-02-13 02:09:16', '2024-02-13 02:09:16'),
(1209, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '12/02/2024 21:09:53', '2024-02-13 02:09:53', '2024-02-13 02:09:53'),
(1210, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '12/02/2024 21:24:38', '2024-02-13 02:24:38', '2024-02-13 02:24:38'),
(1211, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '12/02/2024 21:26:11', '2024-02-13 02:26:11', '2024-02-13 02:26:11'),
(1212, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '12/02/2024 21:28:11', '2024-02-13 02:28:11', '2024-02-13 02:28:11'),
(1213, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '13/02/2024 15:22:30', '2024-02-13 20:22:30', '2024-02-13 20:22:30'),
(1214, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '13/02/2024 15:27:26', '2024-02-13 20:27:26', '2024-02-13 20:27:26'),
(1215, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '13/02/2024 15:28:00', '2024-02-13 20:28:00', '2024-02-13 20:28:00'),
(1216, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '13/02/2024 15:28:28', '2024-02-13 20:28:28', '2024-02-13 20:28:28'),
(1217, 'Se han modificado los datos del usuario jccq12@gmail.com', 2, 2, '13/02/2024 15:28:43', '2024-02-13 20:28:43', '2024-02-13 20:28:43'),
(1218, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 2, 2, '13/02/2024 15:28:58', '2024-02-13 20:28:58', '2024-02-13 20:28:58'),
(1219, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '13/02/2024 15:29:08', '2024-02-13 20:29:08', '2024-02-13 20:29:08'),
(1220, 'El usuario jccq12@gmail.com creo un ticket llamado HACELE LA COMIDA A VALERIA', 1, 4, '13/02/2024 15:30:45', '2024-02-13 20:30:45', '2024-02-13 20:30:45'),
(1221, 'El usuario sistemasaux8@eltemplodelamoda.com.co ha visto el ticket con id 63', 10, 7, '13/02/2024 15:32:20', '2024-02-13 20:32:20', '2024-02-13 20:32:20'),
(1222, 'El usuario sistemasaux8@eltemplodelamoda.com.co inicio la ejecución del ticket con id 63', 10, 7, '13/02/2024 15:37:40', '2024-02-13 20:37:40', '2024-02-13 20:37:40'),
(1223, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '13/02/2024 15:55:30', '2024-02-13 20:55:30', '2024-02-13 20:55:30'),
(1224, 'Se han modificado los datos del usuario jccq12@gmail.com', 2, 2, '13/02/2024 15:55:51', '2024-02-13 20:55:51', '2024-02-13 20:55:51'),
(1225, 'Se han modificado los datos del usuario sistemasaux8@eltemplodelamoda.com.co', 2, 2, '13/02/2024 15:56:10', '2024-02-13 20:56:10', '2024-02-13 20:56:10'),
(1226, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '13/02/2024 15:56:20', '2024-02-13 20:56:20', '2024-02-13 20:56:20');

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

--
-- Volcado de datos para la tabla `reports_certificate`
--

INSERT INTO `reports_certificate` (`id`, `description`, `image`, `date`, `id_user`, `id_certificate`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'SE DAÑO UN MOUSE', '2024-01-23_21-14-29.jpg', '23-01-2024 16:14:29', 1, 18, 2, '2024-01-24 02:14:57', '2024-01-24 02:14:29'),
(2, 'SE DAÑO UN MOUSE', '2024-01-23_21-15-21.jpg', '23-01-2024 16:15:21', 10, 18, 2, '2024-01-24 02:16:17', '2024-01-24 02:15:21'),
(3, 'SE DAÑO UN MOUSE', '2024-01-23_21-16-30.jpg', '23-01-2024 16:16:30', 10, 18, 1, '2024-01-24 02:16:30', '2024-01-24 02:16:30'),
(4, 'ESO ESTABA BUENO', '2024-01-23_21-32-14.jpg', '23-01-2024 16:32:14', 1, 18, 1, '2024-01-24 02:32:14', '2024-01-24 02:32:14'),
(5, 'FEOFEO', '2024-01-23_21-34-36.jpg', '23-01-2024 16:34:36', 1, 18, 1, '2024-01-24 02:34:36', '2024-01-24 02:34:36'),
(6, 'ESTA BIEN', '2024-01-23_21-34-51.jpg', '23-01-2024 16:34:51', 10, 18, 1, '2024-01-24 02:34:51', '2024-01-24 02:34:51'),
(7, 'reportes', '2024-01-23_21-38-16.gif', '23-01-2024 16:38:16', 10, 18, 1, '2024-01-24 02:38:16', '2024-01-24 02:38:16'),
(8, 'dsadsad', '2024-01-23_21-40-59.gif', '23-01-2024 16:40:59', 1, 18, 1, '2024-01-24 02:40:59', '2024-01-24 02:40:59'),
(9, 'asdasd', '2024-01-23_21-43-14.jpg', '23-01-2024 16:43:14', 1, 18, 1, '2024-01-24 02:43:14', '2024-01-24 02:43:14'),
(10, 'Se daño el pc', '2024-01-31_16-33-33.jpg', '31-01-2024 11:33:33', 1, 20, 2, '2024-01-31 21:41:10', '2024-01-31 21:33:33');

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
(18, 'INVENTARIO', NULL, NULL),
(19, 'SERVIDORES', NULL, NULL),
(20, 'VPNS', NULL, NULL);

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
(1, 'El producto se encuentra pendiente asignado al acta  con ID 1  para la direcciòn TEMPLO 2', 1, 1, '2024-01-17 03:13:21', '2024-01-17 03:13:21'),
(2, 'El producto se encuentra pendiente asignado al acta  con ID 2  para la direcciòn TEMPLO 2', 1, 2, '2024-01-17 03:16:21', '2024-01-17 03:16:21'),
(3, 'El producto se encuentra pendiente asignado al acta  con ID 5  para la direcciòn TEMPLO 2', 1, 5, '2024-01-17 03:26:07', '2024-01-17 03:26:07'),
(4, 'El producto se encuentra pendiente asignado al acta  con ID 6  para la direcciòn TEMPLO 2', 3, 6, '2024-01-17 18:22:18', '2024-01-17 18:22:18'),
(5, 'El producto asociado al acta con ID 6 y fecha TEMPLO 2 esta en estado DESPACHADO', 3, 6, '2024-01-17 13:36:17', '2024-01-17 13:36:17'),
(6, 'El producto ya NO se encuentra asignado al acta  con ID 6', 3, 6, '2024-01-17 18:37:00', '2024-01-17 18:37:00'),
(7, 'El producto ya NO se encuentra asignado al acta  con ID 6', 3, 6, '2024-01-17 18:39:21', '2024-01-17 18:39:21'),
(8, 'El producto asociado al acta con ID 5 y fecha TEMPLO 2 esta en estado DESPACHADO', 1, 5, '2024-01-17 13:40:23', '2024-01-17 13:40:23'),
(9, 'El producto asociado al acta con ID 5 y fecha TEMPLO 2 esta en estado ENTREGADO', 1, 5, '2024-01-17 13:40:40', '2024-01-17 13:40:40'),
(10, 'El producto se encuentra pendiente asignado al acta  con ID 7  para la direcciòn TEMPLO 2', 1, 7, '2024-01-17 18:44:47', '2024-01-17 18:44:47'),
(11, 'El producto asociado al acta con ID 7 y fecha TEMPLO 2 esta en estado DESPACHADO', 1, 7, '2024-01-17 13:45:42', '2024-01-17 13:45:42'),
(12, 'El producto ya NO se encuentra asignado al acta  con ID 7', 1, 7, '2024-01-17 18:46:23', '2024-01-17 18:46:23'),
(13, 'El producto se encuentra pendiente asignado al acta  con ID 8  para la direcciòn TEMPLO 2', 1, 8, '2024-01-17 18:47:15', '2024-01-17 18:47:15'),
(14, 'El producto asociado al acta con ID 8 y fecha TEMPLO 2 esta en estado DESPACHADO', 1, 8, '2024-01-17 13:47:40', '2024-01-17 13:47:40'),
(15, 'El producto ya NO se encuentra asignado al acta  con ID 8', 1, 8, '2024-01-17 18:50:09', '2024-01-17 18:50:09'),
(16, 'El producto se encuentra pendiente asignado al acta  con ID 9  para la direcciòn TEMPLO 2', 1, 9, '2024-01-17 18:50:25', '2024-01-17 18:50:25'),
(17, 'El producto asociado al acta con ID 9 y fecha TEMPLO 2 esta en estado DESPACHADO', 1, 9, '2024-01-17 13:50:48', '2024-01-17 13:50:48'),
(18, 'El producto asociado al acta con ID 9 y fecha TEMPLO 2 esta en estado ENTREGADO', 1, 9, '2024-01-17 13:51:18', '2024-01-17 13:51:18'),
(19, 'El producto se encuentra pendiente asignado al acta  con ID 10  para la direcciòn TEMPLO 2', 1, 10, '2024-01-17 19:16:23', '2024-01-17 19:16:23'),
(20, 'El producto asociado al acta con ID 10 y fecha TEMPLO 2 esta en estado DESPACHADO', 1, 10, '2024-01-17 14:19:04', '2024-01-17 14:19:04'),
(21, 'El producto asociado al acta con ID 10 y fecha TEMPLO 2 esta en estado ENTREGADO', 1, 10, '2024-01-17 14:20:38', '2024-01-17 14:20:38'),
(22, 'El producto se encuentra pendiente asignado al acta  con ID 11  para la direcciòn TEMPLO 2', 1, 11, '2024-01-17 19:22:02', '2024-01-17 19:22:02'),
(23, 'El producto ya NO se encuentra asignado al acta  con ID 11', 1, 11, '2024-01-17 19:22:52', '2024-01-17 19:22:52'),
(24, 'El producto se encuentra pendiente asignado al acta  con ID 12  para la direcciòn TEMPLO 2', 2, 12, '2024-01-17 19:25:41', '2024-01-17 19:25:41'),
(25, 'El producto se encuentra pendiente asignado al acta  con ID 12  para la direcciòn TEMPLO 2', 1, 12, '2024-01-17 19:25:41', '2024-01-17 19:25:41'),
(26, 'El producto asociado al acta con ID 12 y fecha TEMPLO 2 esta en estado DESPACHADO', 2, 12, '2024-01-17 14:26:24', '2024-01-17 14:26:24'),
(27, 'El producto asociado al acta con ID 12 y fecha TEMPLO 2 esta en estado DESPACHADO', 1, 12, '2024-01-17 14:26:24', '2024-01-17 14:26:24'),
(28, 'El producto asociado al acta con ID 12 y fecha TEMPLO 2 esta en estado ENTREGADO', 2, 12, '2024-01-17 14:26:44', '2024-01-17 14:26:44'),
(29, 'El producto asociado al acta con ID 12 y fecha TEMPLO 2 esta en estado ENTREGADO', 1, 12, '2024-01-17 14:26:44', '2024-01-17 14:26:44'),
(30, 'El producto se encuentra pendiente asignado al acta  con ID 13  para la direcciòn TEMPLO 2', 1, 13, '2024-01-17 20:04:06', '2024-01-17 20:04:06'),
(31, 'El producto se encuentra pendiente asignado al acta  con ID 14  para la direcciòn Calle 28#86-29', 4, 14, '2024-01-20 18:47:57', '2024-01-20 18:47:57'),
(32, 'El producto asociado al acta con ID 14 y fecha Calle 28#86-29 esta en estado DESPACHADO', 4, 14, '2024-01-20 13:48:22', '2024-01-20 13:48:22'),
(33, 'El producto asociado al acta con ID 14 y fecha Calle 28#86-29 esta en estado ENTREGADO', 4, 14, '2024-01-20 19:11:02', '2024-01-20 19:11:02'),
(34, 'El producto se encuentra pendiente asignado al acta  con ID 15  para la direcciòn OFICINA ADMINISTRATIVA', 4, 15, '2024-01-20 21:13:56', '2024-01-20 21:13:56'),
(35, 'El producto asociado al acta con ID 15 y fecha OFICINA ADMINISTRATIVA esta en estado DESPACHADO', 4, 15, '2024-01-20 16:14:50', '2024-01-20 16:14:50'),
(36, 'El producto asociado al acta con ID 15 y fecha OFICINA ADMINISTRATIVA esta en estado ENTREGADO', 4, 15, '2024-01-20 21:15:28', '2024-01-20 21:15:28'),
(37, 'El producto ya NO se encuentra asignado al acta  con ID 13', 1, 13, '2024-01-22 18:25:18', '2024-01-22 18:25:18'),
(38, 'El producto se encuentra pendiente asignado al acta  con ID 16  para la direcciòn TEMPLO 2', 1, 16, '2024-01-23 00:07:05', '2024-01-23 00:07:05'),
(39, 'El producto ya NO se encuentra asignado al acta  con ID 16', 1, 16, '2024-01-23 00:28:37', '2024-01-23 00:28:37'),
(40, 'El producto se encuentra pendiente asignado al acta  con ID 17  para la direcciòn TEMPLO 2', 1, 17, '2024-01-23 00:30:45', '2024-01-23 00:30:45'),
(41, 'El producto ya NO se encuentra asignado al acta  con ID 17', 1, 17, '2024-01-23 00:34:52', '2024-01-23 00:34:52'),
(42, 'El producto se encuentra pendiente asignado al acta  con ID 18  para la direcciòn TEMPLO 2', 1, 18, '2024-01-24 02:13:26', '2024-01-24 02:13:26'),
(43, 'El producto ya NO se encuentra asignado al acta  con ID 18', 1, 18, '2024-01-30 18:35:56', '2024-01-30 18:35:56'),
(44, 'El producto se encuentra pendiente asignado al acta  con ID 19  para la direcciòn OFICINA ADMINISTRATIVA', 6, 19, '2024-01-30 22:08:16', '2024-01-30 22:08:16'),
(45, 'El producto ya NO se encuentra asignado al acta  con ID 19', 6, 19, '2024-01-30 22:12:51', '2024-01-30 22:12:51'),
(46, 'El producto se encuentra pendiente asignado al acta  con ID 20  para la direcciòn OFICINA ADMINISTRATIVA', 6, 20, '2024-01-31 19:15:48', '2024-01-31 19:15:48'),
(47, 'El producto asociado al acta con ID 20 con destino a OFICINA ADMINISTRATIVA esta en estado DESPACHADO', 6, 20, '2024-01-31 15:07:56', '2024-01-31 15:07:56'),
(48, 'El producto asociado al acta con ID 20 con destino a OFICINA ADMINISTRATIVA esta en estado DESPACHADO', 6, 20, '2024-01-31 15:09:28', '2024-01-31 15:09:28'),
(49, 'El producto asociado al acta con ID 20 y fecha OFICINA ADMINISTRATIVA esta en estado ENTREGADO', 6, 20, '2024-01-31 20:22:25', '2024-01-31 20:22:25'),
(50, 'El producto asociado al acta con ID 20 con destino a OFICINA ADMINISTRATIVA esta en estado ENTREGADO', 6, 20, '2024-01-31 15:30:02', '2024-01-31 15:30:02'),
(51, 'El producto asociado al acta con ID 20 con destino a OFICINA ADMINISTRATIVA esta en estado DESPACHADO', 6, 20, '2024-01-31 15:33:38', '2024-01-31 15:33:38'),
(52, 'El producto asociado al acta con ID 20 y fecha OFICINA ADMINISTRATIVA esta en estado ENTREGADO', 6, 20, '2024-01-31 21:06:51', '2024-01-31 21:06:51'),
(53, 'El producto ya NO se encuentra asignado al acta  con ID 20', 6, 20, '2024-01-31 21:47:03', '2024-01-31 21:47:03'),
(54, 'El producto se encuentra pendiente asignado al acta  con ID 21  para la direcciòn OFICINA ADMINISTRATIVA para el usuario Jhan Carlos Cordoba', 6, 21, '2024-02-01 22:28:42', '2024-02-01 22:28:42'),
(55, 'El producto asociado al acta con ID 21 con destino a OFICINA ADMINISTRATIVA para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 6, 21, '2024-02-01 17:29:42', '2024-02-01 17:29:42'),
(56, 'El producto asociado al acta con ID 21 con destino a OFICINA ADMINISTRATIVA para el usuario Jhan Carlos Cordoba esta en estado ENTREGADO', 6, 21, '2024-02-01 17:30:14', '2024-02-01 17:30:14'),
(57, 'El producto se encuentra pendiente asignado al acta  con ID 22  para la direcciòn OFICINA ADMINISTRATIVA para el usuario PCCOM', 6, 22, '2024-02-01 23:52:48', '2024-02-01 23:52:48'),
(58, 'El producto asociado al acta con ID 22 con destino a OFICINA ADMINISTRATIVA para el usuario PCCOM esta en estado DESPACHADO', 6, 22, '2024-02-01 18:53:16', '2024-02-01 18:53:16'),
(59, 'El producto ya NO se encuentra asignado al acta  con ID 22', 6, 22, '2024-02-01 23:56:11', '2024-02-01 23:56:11'),
(60, 'El producto se encuentra pendiente asignado al acta  con ID 23  para la direcciòn OFICINA ADMINISTRATIVA para el usuario Jhan Carlos Cordoba', 6, 23, '2024-02-02 01:04:38', '2024-02-02 01:04:38'),
(61, 'El producto ya NO se encuentra asignado al acta  con ID 23', 6, 23, '2024-02-07 20:15:34', '2024-02-07 20:15:34'),
(62, 'El producto se encuentra pendiente asignado al acta  con ID 24  para la direcciòn OFICINA ADMINISTRATIVA para el usuario Jhan Carlos La maravilla', 6, 24, '2024-02-07 20:16:37', '2024-02-07 20:16:37'),
(63, 'El producto asociado al acta con ID 24 con destino a OFICINA ADMINISTRATIVA para el usuario Jhan Carlos La maravilla esta en estado DESPACHADO', 6, 24, '2024-02-07 15:17:04', '2024-02-07 15:17:04'),
(64, 'El producto ya NO se encuentra asignado al acta  con ID 24', 6, 24, '2024-02-07 20:18:37', '2024-02-07 20:18:37'),
(65, 'El producto se encuentra pendiente asignado al acta  con ID 25  para la direcciòn OFICINA ADMINISTRATIVA para el usuario Sebastian Hinestroza', 6, 25, '2024-02-07 20:19:13', '2024-02-07 20:19:13'),
(66, 'El producto asociado al acta con ID 25 con destino a OFICINA ADMINISTRATIVA para el usuario Sebastian Hinestroza esta en estado DESPACHADO', 6, 25, '2024-02-07 15:19:33', '2024-02-07 15:19:33'),
(67, 'El producto asociado al acta con ID 24 y direccion OFICINA ADMINISTRATIVA esta en estado ENTREGADO', 6, 24, '2024-02-07 20:22:53', '2024-02-07 20:22:53'),
(68, 'El producto asociado al acta con ID 25 y direccion OFICINA ADMINISTRATIVA esta en estado ENTREGADO', 6, 25, '2024-02-07 20:23:16', '2024-02-07 20:23:16'),
(69, 'El producto se encuentra pendiente asignado al acta  con ID 26  para la direcciòn OFICINA ADMINISTRATIVA para el usuario Jhan Carlos Cordoba', 8, 26, '2024-02-08 20:35:28', '2024-02-08 20:35:28'),
(70, 'El producto ya NO se encuentra asignado al acta  con ID 26', 8, 26, '2024-02-08 20:36:53', '2024-02-08 20:36:53');

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
(1, 1, 1, '2024-01-17 03:13:21', '2024-01-17 03:13:21'),
(2, 1, 2, '2024-01-17 03:16:21', '2024-01-17 03:16:21'),
(3, 1, 5, '2024-01-17 03:26:07', '2024-01-17 03:26:07'),
(4, 3, 6, '2024-01-17 18:22:18', '2024-01-17 18:22:18'),
(5, 1, 7, '2024-01-17 18:44:47', '2024-01-17 18:44:47'),
(6, 1, 8, '2024-01-17 18:47:15', '2024-01-17 18:47:15'),
(7, 1, 9, '2024-01-17 18:50:25', '2024-01-17 18:50:25'),
(8, 1, 10, '2024-01-17 19:16:23', '2024-01-17 19:16:23'),
(9, 1, 11, '2024-01-17 19:22:02', '2024-01-17 19:22:02'),
(10, 2, 12, '2024-01-17 19:25:41', '2024-01-17 19:25:41'),
(11, 1, 12, '2024-01-17 19:25:41', '2024-01-17 19:25:41'),
(12, 1, 13, '2024-01-17 20:04:06', '2024-01-17 20:04:06'),
(13, 4, 14, '2024-01-20 18:47:57', '2024-01-20 18:47:57'),
(14, 4, 15, '2024-01-20 21:13:56', '2024-01-20 21:13:56'),
(15, 1, 16, '2024-01-23 00:07:05', '2024-01-23 00:07:05'),
(16, 1, 17, '2024-01-23 00:30:45', '2024-01-23 00:30:45'),
(17, 1, 18, '2024-01-24 02:13:26', '2024-01-24 02:13:26'),
(18, 6, 19, '2024-01-30 22:08:16', '2024-01-30 22:08:16'),
(19, 6, 20, '2024-01-31 19:15:48', '2024-01-31 19:15:48'),
(20, 6, 21, '2024-02-01 22:28:42', '2024-02-01 22:28:42'),
(21, 6, 22, '2024-02-01 23:52:48', '2024-02-01 23:52:48'),
(22, 6, 23, '2024-02-02 01:04:38', '2024-02-02 01:04:38'),
(23, 6, 24, '2024-02-07 20:16:37', '2024-02-07 20:16:37'),
(24, 6, 25, '2024-02-07 20:19:13', '2024-02-07 20:19:13'),
(25, 8, 26, '2024-02-08 20:35:28', '2024-02-08 20:35:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servers`
--

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `OS` varchar(45) DEFAULT NULL,
  `service` varchar(45) DEFAULT NULL,
  `observations` varchar(1000) DEFAULT NULL,
  `RAM` varchar(45) DEFAULT NULL,
  `vcpu` varchar(45) DEFAULT NULL,
  `totaldd` varchar(45) DEFAULT NULL,
  `ip` varchar(12) DEFAULT NULL,
  `SPLA_RDP_TS` varchar(45) DEFAULT NULL,
  `SPLA_EXCEL` varchar(45) DEFAULT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servers`
--

INSERT INTO `servers` (`id`, `name`, `OS`, `service`, `observations`, `RAM`, `vcpu`, `totaldd`, `ip`, `SPLA_RDP_TS`, `SPLA_EXCEL`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'LINUX-TDM-VPN2', 'LINUX', 'OpenVpn', 'El servidor se encuentra en un estado de lentitud por falta de memoria RAM', '6', '8', '50', '10.75.65.7', 'n/a', 'n/a', 1, '2024-02-08 02:29:54', '2024-02-03 22:16:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_sql_licenses`
--

CREATE TABLE `server_sql_licenses` (
  `id` int(11) NOT NULL,
  `id_server` int(11) NOT NULL,
  `id_sql_licenses` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `server_sql_licenses`
--

INSERT INTO `server_sql_licenses` (`id`, `id_server`, `id_sql_licenses`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 2, '2024-02-06 00:08:57', '2024-02-05 23:51:15'),
(2, 1, 1, 2, '2024-02-06 00:09:34', '2024-02-06 00:09:30'),
(3, 1, 1, 2, '2024-02-06 00:47:38', '2024-02-06 00:10:01'),
(4, 1, 2, 2, '2024-02-06 00:47:48', '2024-02-06 00:40:32'),
(5, 1, 3, 1, '2024-02-06 02:15:43', '2024-02-06 02:15:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `shop` varchar(100) NOT NULL,
  `operation_center` varchar(45) DEFAULT NULL,
  `id_company` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `shops`
--

INSERT INTO `shops` (`id`, `shop`, `operation_center`, `id_company`, `updated_at`, `created_at`) VALUES
(1, 'CALI CENTRO - TEMPLO 1', '001', 1, NULL, NULL),
(2, 'CALI CENTRO - TEMPLO 2', '002', 1, NULL, NULL),
(3, 'ARMENIA - TEMPLO 4', '004', 1, NULL, NULL),
(4, 'CALI VALLE DEL LILI SUR - TEMPLO 5', '005', 1, NULL, NULL),
(5, 'BUENAVENTURA - TEMPLO 6', '006', 1, NULL, NULL),
(6, 'CALI CALIMA - TEMPLO 8', '008', 1, NULL, NULL),
(7, 'PALMIRA - TEMPLO 9', '009', 1, NULL, NULL),
(8, 'PEREIRA - TEMPLO 10', '010', 1, NULL, NULL),
(9, 'CALI CENTRO - TEMPLO 11', '011', 1, NULL, NULL),
(10, 'JAMUNDÌ - TEMPLO 13', '013', 1, NULL, NULL),
(11, 'MANIZALES - TEMPLO 14', '014', 1, NULL, NULL),
(12, 'TULÙA - TEMPLO 16', '016', 1, NULL, NULL),
(13, 'SANTANDER DE QUILICHAO - TEMPLO 17', '017', 1, NULL, NULL),
(14, 'CALI CALLE 26 - TEMPLO 18', '018', 1, NULL, NULL),
(15, 'IBAGUÈ - TEMPLO 19', '019', 1, NULL, NULL),
(16, 'CALI MARIANO RAMOS - TEMPLO 20', '020', 1, NULL, NULL),
(17, 'YUMBO - TEMPLO 23', '023', 1, NULL, NULL),
(18, 'BUGA - TEMPLO 24', '024', 1, NULL, NULL),
(19, 'CALI LOS MANGOS - TEMPLO 26', '026', 1, NULL, NULL),
(20, 'FLORIDA - TEMPLO 27', '027', 1, NULL, NULL),
(21, 'POPAYÀN - TEMPLO 28', '028', 1, NULL, NULL),
(22, 'CALI MELÈNDEZ - TEMPLO 29', '029', 1, NULL, NULL),
(23, 'CALI ALAMEDA - TEMPLO 30', '030', 1, NULL, NULL),
(24, 'CALI CARRERA 1 - TEMPLO 31', '031', 1, NULL, NULL),
(25, 'CALI COSMOCENTRO - TEMPLO 32', '032', 1, NULL, NULL),
(26, 'NEIVA CENTRO - TEMPLO 33', '033', 1, NULL, NULL),
(27, 'BUENAVENTURA PACIFIC MALLL - TEMPLO 34', '034', 1, NULL, NULL),
(28, 'PALMIRA UNICENTRO - TEMPLO 35', '035', 1, NULL, NULL),
(29, 'SHOPPING TEX 1', '001', 2, NULL, NULL),
(30, 'SHOPPING TEX 2', '002', 2, NULL, NULL),
(31, 'SHOPPING TEX 3', '003', 2, NULL, NULL),
(32, 'SHOPPING TEX 4', '004', 2, NULL, NULL),
(33, 'SHOPPING TEX 5', '005', 2, NULL, NULL),
(34, 'SHOPPING TEX 6', '006', 2, NULL, NULL),
(35, 'SHOPPING TEX 7', '007', 2, NULL, NULL),
(36, 'SHOPPING TEX 8', '008', 2, NULL, NULL),
(37, 'SHOPPING TEX 9', '009', 2, NULL, NULL),
(38, 'SHOPPING TEX 10', '010', 2, NULL, NULL),
(39, 'SHOPPING TEX 11', '011', 2, NULL, NULL),
(40, 'SHOPPING TEX 12', '012', 2, NULL, NULL),
(41, 'SHOPPING TEX 13', '013', 2, NULL, NULL),
(42, 'SHOPPING TEX 14', '014', 2, NULL, NULL),
(43, 'SHOPPING TEX 15', '015', 2, NULL, NULL),
(44, 'SHOPPING TEX 16', '016', 2, NULL, NULL),
(45, 'SHOPPING TEX 17', '017', 2, NULL, NULL),
(46, 'SHOPPING TEX 18', '018', 2, NULL, NULL),
(47, 'SHOPPING TEX 19', '019', 2, NULL, NULL),
(48, 'SHOPPING TEX 20', '020', 2, NULL, NULL),
(49, 'SHOPPING TEX 21', '021', 2, NULL, NULL),
(50, 'CEDI', '', 5, NULL, NULL),
(51, 'OFICINA ADMINISTRATIVA', '', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spreadsheets`
--

CREATE TABLE `spreadsheets` (
  `id` int(11) NOT NULL,
  `date_now` varchar(45) DEFAULT NULL,
  `date_previous` varchar(45) DEFAULT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `spreadsheets`
--

INSERT INTO `spreadsheets` (`id`, `date_now`, `date_previous`, `id_state`, `updated_at`, `created_at`) VALUES
(1, '2024-02-12', '2024-02-11', 1, '2024-02-13 05:55:21', '2024-02-13 05:55:21'),
(2, '2024-02-13', '2024-02-12', 1, '2024-02-14 01:21:19', '2024-02-14 01:21:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spreadsheet_rows_tpvs`
--

CREATE TABLE `spreadsheet_rows_tpvs` (
  `id` int(11) NOT NULL,
  `id_payment_method` int(11) NOT NULL,
  `id_spreadsheet_tpv` int(11) NOT NULL,
  `value_pos` varchar(45) DEFAULT NULL,
  `value_treasurer` varchar(45) DEFAULT NULL,
  `difference` varchar(45) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `spreadsheet_rows_tpvs`
--

INSERT INTO `spreadsheet_rows_tpvs` (`id`, `id_payment_method`, `id_spreadsheet_tpv`, `value_pos`, `value_treasurer`, `difference`, `updated_at`, `created_at`) VALUES
(1, 1, 1, '50000', NULL, NULL, '2024-02-13 05:55:21', '2024-02-13 05:55:21'),
(2, 2, 1, '30000', NULL, NULL, '2024-02-13 05:55:21', '2024-02-13 05:55:21'),
(3, 1, 2, '50000', '30000', '20000', '2024-02-13 06:00:47', '2024-02-13 05:55:21'),
(4, 2, 2, '20000', '20000', '0', '2024-02-13 06:00:47', '2024-02-13 05:55:21'),
(5, 1, 3, '90000', NULL, NULL, '2024-02-13 06:13:35', '2024-02-13 06:13:35'),
(6, 2, 3, '30000', NULL, NULL, '2024-02-13 06:13:35', '2024-02-13 06:13:35'),
(7, 1, 4, '60000', '60000', '0', '2024-02-13 07:09:01', '2024-02-13 06:55:35'),
(8, 2, 4, '30000', '20000', '10000', '2024-02-13 07:09:01', '2024-02-13 06:55:35'),
(9, 1, 5, '80000', '80000', '0', '2024-02-14 01:59:01', '2024-02-14 01:21:19'),
(10, 2, 5, '20000', '10000', '10000', '2024-02-14 01:59:01', '2024-02-14 01:21:19'),
(11, 1, 6, '40000', '50000', '-10000', '2024-02-14 02:07:08', '2024-02-14 01:21:19'),
(12, 2, 6, '30000', '20000', '10000', '2024-02-14 02:07:08', '2024-02-14 01:21:19'),
(13, 1, 7, '70000', NULL, NULL, '2024-02-14 01:21:19', '2024-02-14 01:21:19'),
(14, 2, 7, '50000', NULL, NULL, '2024-02-14 01:21:19', '2024-02-14 01:21:19'),
(15, 1, 8, '20000', NULL, NULL, '2024-02-14 01:21:19', '2024-02-14 01:21:19'),
(16, 2, 8, '90000', NULL, NULL, '2024-02-14 01:21:19', '2024-02-14 01:21:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spreadsheet_shops`
--

CREATE TABLE `spreadsheet_shops` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `spreadsheet_shops`
--

INSERT INTO `spreadsheet_shops` (`id`, `id_user`, `id_shop`, `id_state`, `updated_at`, `created_at`) VALUES
(5, 10, 8, 1, '2024-02-14 01:59:39', '2024-02-14 01:59:39'),
(6, 10, 7, 1, '2024-02-14 01:59:55', '2024-02-14 01:59:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spreadsheet_tpvs`
--

CREATE TABLE `spreadsheet_tpvs` (
  `id` int(11) NOT NULL,
  `total` varchar(45) DEFAULT NULL,
  `sub_total` varchar(45) DEFAULT NULL,
  `difference` varchar(45) DEFAULT NULL,
  `id_tpv` int(11) NOT NULL,
  `id_spreadsheet` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `spreadsheet_tpvs`
--

INSERT INTO `spreadsheet_tpvs` (`id`, `total`, `sub_total`, `difference`, `id_tpv`, `id_spreadsheet`, `id_state`, `updated_at`, `created_at`) VALUES
(1, '80000', '0', '0', 2, 1, 3, '2024-02-13 05:55:21', '2024-02-13 05:55:21'),
(2, '70000', '50000', '20000', 3, 1, 3, '2024-02-13 06:00:47', '2024-02-13 05:55:21'),
(3, '120000', '0', '0', 4, 1, 3, '2024-02-13 06:13:35', '2024-02-13 06:13:35'),
(4, '90000', '80000', '10000', 5, 1, 3, '2024-02-13 07:09:37', '2024-02-13 06:55:35'),
(5, '100000', '90000', '10000', 2, 2, 3, '2024-02-14 01:59:01', '2024-02-14 01:21:19'),
(6, '70000', '70000', '0', 3, 2, 7, '2024-02-14 02:07:13', '2024-02-14 01:21:19'),
(7, '120000', '0', '0', 4, 2, 3, '2024-02-14 01:21:19', '2024-02-14 01:21:19'),
(8, '110000', '0', '0', 5, 2, 3, '2024-02-14 01:21:19', '2024-02-14 01:21:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sql_licenses`
--

CREATE TABLE `sql_licenses` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sql_licenses`
--

INSERT INTO `sql_licenses` (`id`, `name`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'Licencia sql ENTERPRISE', 2, '2024-02-06 00:47:38', '2024-02-05 21:36:25'),
(2, 'Licencia sql ESTANDAR', 2, '2024-02-06 00:41:56', '2024-02-06 00:40:15'),
(3, 'Licencia sql ENTERPRISE', 1, '2024-02-06 02:03:44', '2024-02-06 02:03:44');

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
  `theme_user` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `themes_users`
--

INSERT INTO `themes_users` (`id`, `theme_user`, `updated_at`, `created_at`) VALUES
(1, 'CAJAS,MANTENIMIENTOS O COLABORACIONES CEDI', NULL, NULL),
(2, 'CAJAS, MANTENIMIENTOS O COLABORACIONES OFICINA', NULL, NULL),
(3, 'BASES DE DATOS Y SERVIDORES', NULL, NULL);

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
(1, 'ADSAD', 'ASDSAD', '2024-01-18_13-52-37.gif', '18/01/2024 08:52:26', '18/01/2024 14:52:26', 1, 10, 1, 6, '2024-01-19 19:26:39', '2024-01-18 13:52:39'),
(2, 'ASDSAD', 'ASDSAD', '2024-01-18_13-54-12.png', '18/01/2024 08:53:59', '18/01/2024 14:53:59', 1, 10, 1, 6, '2024-01-19 19:26:45', '2024-01-18 13:54:14'),
(3, 'ASDSAD', 'ASDSAD', '2024-01-18_13-54-34.gif', '18/01/2024 08:54:22', '18/01/2024 14:54:22', 1, 10, 1, 7, '2024-01-18 19:28:51', '2024-01-18 13:54:36'),
(4, 'asdad', 'dasdsa', '2024-01-18_14-18-57.jpg', '18/01/2024 09:18:45', '18/01/2024 15:18:45', 1, 10, 1, 7, '2024-01-18 19:31:44', '2024-01-18 14:18:59'),
(5, 'ACTIVACION DE MAC', 'ewrewrsasd', '2024-01-18_14-41-29.jpg', '18/01/2024 09:41:00', '18/01/2024 15:41:00', 1, 1, 10, 7, '2024-01-18 19:43:02', '2024-01-18 14:41:31'),
(6, 'dadsad', 'assdsad', '2024-01-18_15-09-11.jpg', '18/01/2024 10:08:57', '18/01/2024 11:08:57', 5, 10, 1, 7, '2024-01-18 20:18:59', '2024-01-18 15:09:13'),
(7, 'asda', 'sads', NULL, '18/01/2024 10:21:29', '18/01/2024 16:21:29', 1, 1, 10, 7, '2024-01-19 00:13:15', '2024-01-18 15:21:45'),
(8, 'asdsad', 'adsad', '2024-01-18_16-27-49.jpg', '18/01/2024 11:27:35', '18/01/2024 17:27:35', 1, 12, 1, 6, '2024-01-19 19:26:48', '2024-01-18 16:27:51'),
(9, 'Activar', 'Homa', '2024-01-18_17-23-17.jpeg', '18/01/2024 12:22:32', '18/01/2024 18:22:32', 1, 1, 18, 6, '2024-01-19 19:26:50', '2024-01-18 17:23:19'),
(10, 'Jshshs', 'Shshshs', NULL, '18/01/2024 12:25:03', '18/01/2024 18:25:03', 1, 1, 18, 6, '2024-01-19 19:26:52', '2024-01-18 17:25:37'),
(11, 'Chevere', 'Muy chévere', '2024-01-18_20-54-19.jpeg', '18/01/2024 15:53:57', '18/01/2024 21:53:57', 1, 1, 18, 6, '2024-01-19 19:26:54', '2024-01-18 20:54:21'),
(12, 'Ingreso de vaso', 'Por favor ingresar el vaso de spiderman', NULL, '18/01/2024 16:00:19', '18/01/2024 17:00:19', 5, 12, 1, 6, '2024-01-19 19:26:56', '2024-01-18 21:01:48'),
(13, 'ACTIVACION MAC', 'adsad', NULL, '19/01/2024 12:03:42', '19/01/2024 13:03:42', 5, 1, 10, 6, '2024-01-20 18:32:26', '2024-01-19 17:03:57'),
(14, 'asdsads', 'asdasd', '2024-01-19_17-07-42.jpg', '19/01/2024 12:07:31', '19/01/2024 18:07:31', 1, 16, 1, 6, '2024-01-20 18:32:29', '2024-01-19 17:07:44'),
(15, 'Feo', 'Hhg', '2024-01-19_20-21-42.jpeg', '19/01/2024 15:21:03', '19/01/2024 21:21:03', 1, 1, 10, 6, '2024-01-30 01:28:52', '2024-01-19 20:21:45'),
(16, 'asdsa', 'sadasd', '2024-01-19_21-56-03.ico', '19/01/2024 16:55:51', '19/01/2024 21:55:51', 2, 10, 1, 6, '2024-01-20 18:32:32', '2024-01-19 21:56:05'),
(17, 'dasdasd', 'asdsad', '2024-01-19_21-56-36.ico', '19/01/2024 16:56:24', '19/01/2024 22:56:24', 1, 10, 1, 6, '2024-01-20 18:32:34', '2024-01-19 21:56:38'),
(18, 'Ygg', 'Cg', NULL, '19/01/2024 16:59:25', '19/01/2024 22:59:25', 1, 1, 18, 6, '2024-01-20 18:32:37', '2024-01-19 21:59:45'),
(19, 'adsad', 'asdasd', '2024-01-20_15-05-41.png', '20/01/2024 10:05:26', '20/01/2024 11:05:26', 5, 10, 1, 6, '2024-01-22 18:20:51', '2024-01-20 15:05:43'),
(20, 'asdsad', 'asdasd', '2024-01-20_15-08-24.gif', '20/01/2024 10:08:13', '20/01/2024 16:08:13', 1, 10, 1, 6, '2024-01-22 18:20:58', '2024-01-20 15:08:27'),
(21, 'asdas', 'adssad', '2024-01-20_15-24-49.jpg', '20/01/2024 10:24:34', '20/01/2024 11:24:34', 5, 10, 1, 6, '2024-01-22 18:21:00', '2024-01-20 15:24:51'),
(22, 'ACTIVACION MAC', 'DSADSAD', NULL, '20/01/2024 10:35:22', '20/01/2024 16:35:22', 1, 1, 10, 6, '2024-01-22 18:21:02', '2024-01-20 15:35:38'),
(23, 'ACTIVACION MAC', 'QWEWQE', NULL, '20/01/2024 10:35:56', '20/01/2024 16:35:56', 1, 1, 10, 6, '2024-01-22 18:21:05', '2024-01-20 15:36:07'),
(24, 'ASDSA', 'ASDASD', NULL, '20/01/2024 10:36:52', '20/01/2024 16:36:52', 1, 1, 10, 6, '2024-01-22 18:21:07', '2024-01-20 15:37:01'),
(25, 'asdsa', 'asdsad', '2024-01-20_15-38-00.jpg', '20/01/2024 10:37:46', '20/01/2024 16:37:46', 1, 1, 10, 6, '2024-01-22 18:21:09', '2024-01-20 15:38:02'),
(26, 'assdsa', 'asdsad', NULL, '20/01/2024 10:38:32', '20/01/2024 11:38:32', 5, 1, 10, 6, '2024-01-22 18:21:11', '2024-01-20 15:38:44'),
(27, 'Jhgg', 'Gggc', NULL, '20/01/2024 10:39:57', '20/01/2024 16:39:57', 1, 1, 10, 6, '2024-01-22 18:21:13', '2024-01-20 15:40:12'),
(28, 'Hgg', 'Gg', NULL, '20/01/2024 10:41:27', '20/01/2024 16:41:27', 1, 1, 10, 6, '2024-01-22 18:21:15', '2024-01-20 15:41:40'),
(29, 'Hgg', 'Ccc', NULL, '20/01/2024 10:43:12', '20/01/2024 16:43:12', 1, 1, 10, 6, '2024-01-22 18:21:17', '2024-01-20 15:43:25'),
(30, 'RYRTY', 'RTYTTR', '2024-01-20_16-25-26.gif', '20/01/2024 11:25:12', '20/01/2024 12:25:12', 5, 10, 1, 6, '2024-01-22 18:21:19', '2024-01-20 16:25:26'),
(31, 'TICKET', 'DADDAED', NULL, '22/01/2024 08:47:54', '22/01/2024 14:47:54', 1, 16, 10, 6, '2024-01-23 19:25:00', '2024-01-22 13:48:52'),
(32, 'asdsa', 'asdsad', NULL, '22/01/2024 12:00:59', '22/01/2024 16:00:59', 3, 1, 10, 6, '2024-01-23 19:25:05', '2024-01-22 17:01:07'),
(33, 'ACTIVACION DE MAC', 'ADASDS', NULL, '22/01/2024 14:02:09', '22/01/2024 20:02:09', 1, 10, 1, 7, '2024-01-23 00:05:08', '2024-01-22 19:02:20'),
(34, 'safas', 'asfas', NULL, '22/01/2024 14:39:47', '22/01/2024 16:39:47', 4, 1, 10, 6, '2024-01-23 19:25:07', '2024-01-22 19:39:57'),
(35, 'Activación de mac', 'Jsjsj', NULL, '22/01/2024 14:44:40', '22/01/2024 15:44:40', 5, 1, 18, 6, '2024-01-23 19:25:10', '2024-01-22 19:45:02'),
(36, 'AYUDA CON MAC', 'ACTIVAR MAC ANYDESK 4324324234234234', NULL, '23/01/2024 10:40:54', '23/01/2024 11:40:54', 5, 1, 10, 6, '2024-01-24 18:39:43', '2024-01-23 15:41:17'),
(37, 'ACTIVACION DE MAC', 'SADAWAD', NULL, '23/01/2024 11:46:46', '23/01/2024 12:46:46', 5, 10, 1, 7, '2024-01-24 00:23:41', '2024-01-23 16:46:57'),
(38, 'sfdsf', 'dsfdsfds', NULL, '23/01/2024 12:04:07', '23/01/2024 18:04:07', 1, 1, 10, 6, '2024-01-24 18:39:49', '2024-01-23 17:04:17'),
(39, 'adsad', 'adasd', NULL, '23/01/2024 12:04:50', '23/01/2024 13:04:50', 5, 1, 10, 6, '2024-01-24 18:39:51', '2024-01-23 17:04:58'),
(40, 'adsad', 'adsadsad', NULL, '23/01/2024 12:05:43', '23/01/2024 13:05:43', 5, 1, 10, 6, '2024-01-24 18:39:53', '2024-01-23 17:05:52'),
(41, 'assda', 'asdasd', NULL, '23/01/2024 12:06:33', '23/01/2024 18:06:33', 1, 1, 10, 6, '2024-01-24 18:39:55', '2024-01-23 17:06:40'),
(42, 'asdsad', 'asdsad', NULL, '23/01/2024 12:08:26', '23/01/2024 13:08:26', 5, 1, 10, 6, '2024-01-24 18:39:57', '2024-01-23 17:08:34'),
(43, 'dsad', 'aasdsad', NULL, '23/01/2024 12:10:23', '23/01/2024 13:10:23', 5, 1, 10, 6, '2024-01-24 18:40:00', '2024-01-23 17:10:31'),
(44, 'asda', 'sadsad', NULL, '23/01/2024 12:11:32', '23/01/2024 13:11:32', 5, 1, 10, 6, '2024-01-24 18:40:02', '2024-01-23 17:11:40'),
(45, 'asdsa', 'asdasd', NULL, '23/01/2024 12:12:50', '23/01/2024 13:12:50', 5, 1, 10, 6, '2024-01-24 18:40:04', '2024-01-23 17:12:58'),
(46, 'hghgh', 'gfgfgf', NULL, '23/01/2024 12:16:30', '23/01/2024 18:16:30', 1, 12, 1, 6, '2024-01-24 18:40:06', '2024-01-23 17:17:09'),
(47, 'ACTIVACION DE MAC', 'gfytrytry', NULL, '23/01/2024 12:19:55', '23/01/2024 18:19:55', 1, 10, 1, 6, '2024-01-24 18:40:08', '2024-01-23 17:20:04'),
(48, 'ACTIVACION MAC', 'DEDASDASSD', NULL, '24/01/2024 09:15:20', '24/01/2024 10:15:20', 5, 1, 10, 6, '2024-01-24 20:38:52', '2024-01-24 14:15:31'),
(49, 'ACTIVACION MAC', 'SDADASD', NULL, '24/01/2024 10:23:33', '24/01/2024 12:23:33', 4, 1, 10, 6, '2024-01-25 02:06:09', '2024-01-24 15:23:41'),
(50, 'sfsdf', 'sdf', NULL, '24/01/2024 16:53:34', '24/01/2024 17:53:34', 5, 1, 10, 6, '2024-01-25 18:34:31', '2024-01-24 21:53:51'),
(51, 'asd', 'asdsa', NULL, '24/01/2024 16:54:32', '24/01/2024 18:54:32', 4, 1, 10, 6, '2024-01-25 18:34:37', '2024-01-24 21:54:40'),
(52, 'MAC', 'WERWER', NULL, '25/01/2024 11:51:43', '25/01/2024 12:51:43', 5, 1, 10, 6, '2024-01-26 01:21:27', '2024-01-25 16:51:59'),
(53, 'TICKET', 'TICKET', NULL, '27/01/2024 08:43:16', '27/01/2024 09:43:16', 5, 16, 10, 6, '2024-01-27 20:52:02', '2024-01-27 13:43:31'),
(54, 'PROBLEMA EN CAJA', 'La caja no me prende desde hace 3 dias no se que le pasa y sale este boton que subire en archivo', '2024-01-27_15-57-36.jpg', '27/01/2024 10:52:14', '27/01/2024 11:52:14', 5, 10, 1, 6, '2024-01-29 21:55:02', '2024-01-27 15:57:36'),
(55, 'ACTIVACION MAC', 'ADAWDAD', NULL, '29/01/2024 12:19:07', '29/01/2024 18:19:07', 1, 1, 10, 6, '2024-01-30 19:50:00', '2024-01-29 17:19:20'),
(56, 'CAMBIODE COMPUTADOR', 'Solicito amablemente de su colaboracion para el cambio de equipo en el area de recepción', '2024-01-29_18-44-17.png', '29/01/2024 13:36:48', '29/01/2024 19:36:48', 1, 23, 1, 6, '2024-01-30 19:50:05', '2024-01-29 18:44:17'),
(57, 'ASD', 'ASDAD', NULL, '30/01/2024 10:43:56', '30/01/2024 16:43:56', 1, 1, 1, 6, '2024-02-01 00:00:46', '2024-01-30 15:44:05'),
(58, 'HACERLE LA COMIIDA A LEONARDO', 'Darsela en boca', NULL, '30/01/2024 15:11:04', '30/01/2024 16:11:04', 5, 1, 15, 6, '2024-01-31 02:38:12', '2024-01-30 20:11:26'),
(59, 'AYUDA CON EQUIPO DE NOMINA', 'Traslado de equipo', NULL, '01/02/2024 14:36:45', '01/02/2024 15:36:45', 5, 1, 10, 6, '2024-02-03 22:28:37', '2024-02-01 19:37:11'),
(60, 'AYUDA CON COSAS', 'N/A', NULL, '08/02/2024 12:18:43', '08/02/2024 14:18:43', 4, 10, 1, 6, '2024-02-12 00:50:28', '2024-02-08 17:19:06'),
(61, 'asd', 'adasd', NULL, '08/02/2024 12:19:50', '08/02/2024 13:19:50', 5, 10, 10, 6, '2024-02-12 00:50:34', '2024-02-08 17:19:59'),
(62, 'asda', 'asdsad', NULL, '08/02/2024 12:20:26', '08/02/2024 13:20:26', 5, 10, 1, 6, '2024-02-12 00:50:37', '2024-02-08 17:20:34'),
(63, 'HACELE LA COMIDA A VALERIA', 'PATICO', NULL, '13/02/2024 15:29:39', '13/02/2024 16:29:39', 5, 1, 10, 5, '2024-02-14 01:37:40', '2024-02-13 20:30:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpvs`
--

CREATE TABLE `tpvs` (
  `id` int(11) NOT NULL,
  `tpv` varchar(45) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_shop` int(11) DEFAULT NULL,
  `id_tpv_component` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tpvs`
--

INSERT INTO `tpvs` (`id`, `tpv`, `id_user`, `id_shop`, `id_tpv_component`, `id_state`, `updated_at`, `created_at`) VALUES
(2, 'TPV00101', 1, 8, 1, 1, NULL, NULL),
(3, 'TPV00102', 1, 7, 1, 1, NULL, NULL),
(4, 'TPV01009', 1, 8, 2, 1, NULL, NULL),
(5, 'TPV00601', 1, 5, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpv_types`
--

CREATE TABLE `tpv_types` (
  `id` int(11) NOT NULL,
  `tpv_type` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tpv_types`
--

INSERT INTO `tpv_types` (`id`, `tpv_type`, `updated_at`, `created_at`) VALUES
(1, 'FIJA', NULL, NULL),
(2, 'TEMPORADA', NULL, NULL);

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
(1, 'Jhan Carlos Cordoba', '3043711546', '1111663045', 'jccq12@gmail.com', '$2y$12$qiWWz8RWBnifFKhCROdRdOXSHVwVe9ZBZK4.B6aKJ5Pfh.Emk8W3G', 5, 1, 7, 22, 51, 2, '2024-02-13 20:55:51', '2023-12-04 06:41:19'),
(2, 'Administrador GRUPO TDM', NULL, '805027653', 'soporte@eltemplodelamoda.com.co', '$2y$12$URua6E9e.DoM3Nt2TzqadOQo0RG2QnM5Hk6a5A7EdemJZNaKMttVK', 5, 1, 1, 83, NULL, NULL, '2023-12-21 15:29:01', '2023-12-04 07:04:03'),
(10, 'Anderson Cordoba', NULL, '1565654465', 'sistemasaux8@eltemplodelamoda.com.co', '$2y$12$RePEIqHaMsIdOsiT1VgfSOBZPhG3sCGXTFpCfAeOi2V8nBmRwFUI6', 5, 1, 7, 24, 51, 2, '2024-02-13 20:56:10', '2023-12-06 20:36:20'),
(11, 'Kelly Gomez', '3123213123', '123456789', 'analistadesistemas@eltemplodelamoda.com.co', '$2y$12$DsPHFtMueUypFjuQyovIeuDIrr3HDOxvVSlEy4rcP6dt8gOnDPPMO', 1, 2, 2, 4, 2, 1, '2024-01-25 16:33:03', '2023-12-06 23:57:46'),
(12, 'Jerson Henao', NULL, '987456123', 'sistemasaux4@eltemplodelamoda.com.co', '$2y$12$3HC5qCgFUCEYrSTJ/xA6X.Vo.i8ScF5atbOECjPIc3uB9GhgLPpou', 5, 2, 2, 5, 50, 2, '2024-02-01 18:50:09', '2023-12-06 23:59:07'),
(13, 'Rodrigo Rodallega', NULL, '94495428', 'csoporte@eltemplodelamoda.com.co', '$2y$12$QHlRbbn8t9BP1NUuRB90oeZ7kQ/Q7lt1UuhAafWbnZjPvgLxnSYe2', 5, 1, 2, 1, 51, 3, '2023-12-22 14:49:18', '2023-12-09 21:34:32'),
(15, 'Adrian Garcia', NULL, '11929101283', 'sistemasaux10@eltemplodelamoda.com.co', '$2y$12$tG7piyZI5b9hlxEX9poz5efyu/F1gws7CXlbHV03nEkI3Bsf/NspK', 5, 1, 2, 5, 50, 1, '2024-01-31 01:13:59', '2023-12-11 21:44:18'),
(16, 'Jhan Carlos  Cordoba Quiñonez', '3043711546', '123456789', 'sistemasaux20@eltemplodelamoda.com.co', '$2y$12$/qI94Q1wzePQRzejcL924eeSSsl7HIZc8zR/NPYA4LYYY35DUZNzS', 1, 2, 16, 84, NULL, NULL, '2024-01-31 14:09:46', '2023-12-15 23:30:24'),
(17, 'Karen Arenas', NULL, '567688878', 'sistemasaux6@eltemplodelamoda.com.co', '$2y$12$kRnWSni/aDjFfpTXRSy3i.ruPxFYskvoHpfaKjrfk5Wm.LyKcu38y', NULL, 2, 2, NULL, 51, 2, '2024-02-01 18:49:57', '2024-01-03 19:10:37'),
(18, 'Sebastian Hinestroza', NULL, '65764754656', 'sistemasaux2@eltemplodelamoda.com.co', '$2y$12$/QvvaypJYZQjz9vKk8RCC.TxzokbMqyt4bx4ke2gO.z26C/zoQW1.', 5, 1, 2, 2, 50, 3, '2024-02-01 18:49:45', '2024-01-03 19:16:39'),
(19, 'Leonardo Dagua', '3016672211', '1006011332', 'sistemasaux11@eltemplodelamoda.com.co', '$2y$12$ja.dnChTfKTVVX4rpujPcO2IfyOEzb7jd3uEEjJ9cvVf4BtFq6hne', NULL, 1, 2, NULL, 50, 1, '2024-01-15 17:26:55', '2024-01-15 17:24:10'),
(23, 'Jhan Carlos  Cordoba', NULL, '4545545454', 'sistemasaux21@eltemplodelamoda.com.co', '$2y$12$bqKdR3HogV6HKgZbk2JQzuxFDJ0TK2uIaf8LWEdhJ./a0QrdD/F8q', 1, 2, 16, 84, 1, NULL, '2024-02-05 15:47:40', '2024-01-27 14:54:46'),
(24, 'Jhan Carlos La maravilla', NULL, '12345678910', 'sistemasaux9@eltemplodelamoda.com.co', '$2y$12$79HW4BRiM3hPCSGEdlRQj.PDv5nh7UwO9jrruU85Zf8hEJiwSQFYC', 1, 1, 3, 6, 1, 2, '2024-02-07 15:02:51', '2024-01-29 16:35:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vpns`
--

CREATE TABLE `vpns` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `file` varchar(500) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vpns`
--

INSERT INTO `vpns` (`id`, `name`, `file`, `id_user`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'tdm_conexion_70', '2024-02-07_14-47-55.zip', 24, 1, '2024-02-07 20:03:15', '2024-02-06 22:01:32'),
(2, 'tdm_conexion_30', '2024-02-06_22-18-18.pptx', 10, 1, '2024-02-07 03:18:18', '2024-02-07 03:12:59'),
(3, 'tdm_conexion_80', '2024-02-07_14-51-24.zip', 19, 2, '2024-02-08 00:59:52', '2024-02-07 19:51:24'),
(4, 'tmf_conexion_91', '2024-02-07_14-56-12.zip', 18, 1, '2024-02-07 19:56:12', '2024-02-07 19:56:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vpn_servers`
--

CREATE TABLE `vpn_servers` (
  `id` int(11) NOT NULL,
  `id_ip_linux_direction` int(11) NOT NULL,
  `id_vpn` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vpn_servers`
--

INSERT INTO `vpn_servers` (`id`, `id_ip_linux_direction`, `id_vpn`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 2, '2024-02-07 02:57:45', '2024-02-07 02:48:00'),
(2, 1, 1, 2, '2024-02-07 02:58:41', '2024-02-07 02:58:38'),
(3, 1, 2, 2, '2024-02-07 18:36:12', '2024-02-07 03:15:01'),
(4, 1, 1, 2, '2024-02-07 18:33:10', '2024-02-07 18:33:07'),
(5, 4, 2, 2, '2024-02-07 18:38:45', '2024-02-07 18:37:33'),
(6, 5, 1, 1, '2024-02-08 02:57:38', '2024-02-08 02:57:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wifi_channels`
--

CREATE TABLE `wifi_channels` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `date_start` varchar(45) DEFAULT NULL,
  `date_finish` varchar(45) DEFAULT NULL,
  `unit_value` varchar(45) DEFAULT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indices de la tabla `characteristics_products`
--
ALTER TABLE `characteristics_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_characteristics_products_products1_idx` (`id_product`),
  ADD KEY `fk_characteristics_products_states1_idx` (`id_state`);

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
-- Indices de la tabla `ip_linux_directions`
--
ALTER TABLE `ip_linux_directions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ip_linux_directions_services1_idx` (`id_server`),
  ADD KEY `fk_ip_linux_directions_states1_idx` (`id_state`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notifications_users1_idx` (`id_user`),
  ADD KEY `fk_notifications_states1_idx` (`id_state`);

--
-- Indices de la tabla `origins_certificates`
--
ALTER TABLE `origins_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payment_methods_states1_idx` (`id_state`);

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
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
  ADD KEY `fk_products_states1_idx` (`id_state`),
  ADD KEY `fk_products_users1_idx` (`id_user`);

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
-- Indices de la tabla `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servers_states1_idx` (`id_state`);

--
-- Indices de la tabla `server_sql_licenses`
--
ALTER TABLE `server_sql_licenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_server_sql_licenses_servers1_idx` (`id_server`),
  ADD KEY `fk_server_sql_licenses_sql_licenses1_idx` (`id_sql_licenses`),
  ADD KEY `fk_server_sql_licenses_states1_idx` (`id_state`);

--
-- Indices de la tabla `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shops_companies1_idx` (`id_company`);

--
-- Indices de la tabla `spreadsheets`
--
ALTER TABLE `spreadsheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_report_sales_states1_idx` (`id_state`);

--
-- Indices de la tabla `spreadsheet_rows_tpvs`
--
ALTER TABLE `spreadsheet_rows_tpvs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_report_sale_tpvs_payment_methods1_idx` (`id_payment_method`),
  ADD KEY `fk_spreadsheet_rows_tpvs_spreadsheet_tpvs1_idx` (`id_spreadsheet_tpv`);

--
-- Indices de la tabla `spreadsheet_shops`
--
ALTER TABLE `spreadsheet_shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_spreadsheet_shops_users1_idx` (`id_user`),
  ADD KEY `fk_spreadsheet_shops_shops1_idx` (`id_shop`),
  ADD KEY `fk_spreadsheet_shops_states1_idx` (`id_state`);

--
-- Indices de la tabla `spreadsheet_tpvs`
--
ALTER TABLE `spreadsheet_tpvs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_report_sale_total_tpvs_tpvs1_idx` (`id_tpv`),
  ADD KEY `fk_spreadsheet_tpvs_spreadsheets1_idx` (`id_spreadsheet`),
  ADD KEY `fk_spreadsheet_tpvs_states1_idx` (`id_state`);

--
-- Indices de la tabla `sql_licenses`
--
ALTER TABLE `sql_licenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sql_licenses_states1_idx` (`id_state`);

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
-- Indices de la tabla `tpvs`
--
ALTER TABLE `tpvs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tpvs_states1_idx` (`id_state`),
  ADD KEY `fk_tpvs_tpv_types1_idx` (`id_tpv_component`),
  ADD KEY `fk_tpvs_users2_idx` (`id_user`),
  ADD KEY `fk_tpvs_shops1_idx` (`id_shop`);

--
-- Indices de la tabla `tpv_types`
--
ALTER TABLE `tpv_types`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `vpns`
--
ALTER TABLE `vpns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vpns_users1_idx` (`id_user`),
  ADD KEY `fk_vpns_states1_idx` (`id_state`);

--
-- Indices de la tabla `vpn_servers`
--
ALTER TABLE `vpn_servers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vpn_serves_ip_linux_directions1_idx` (`id_ip_linux_direction`),
  ADD KEY `fk_vpn_serves_vpns1_idx` (`id_vpn`),
  ADD KEY `fk_vpn_serves_states1_idx` (`id_state`);

--
-- Indices de la tabla `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `wifi_channels`
--
ALTER TABLE `wifi_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wifi_channels_states1_idx` (`id_state`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `characteristics_products`
--
ALTER TABLE `characteristics_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `directories`
--
ALTER TABLE `directories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `files_modified`
--
ALTER TABLE `files_modified`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `images_products`
--
ALTER TABLE `images_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ip_linux_directions`
--
ALTER TABLE `ip_linux_directions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT de la tabla `origins_certificates`
--
ALTER TABLE `origins_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1227;

--
-- AUTO_INCREMENT de la tabla `reports_certificate`
--
ALTER TABLE `reports_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `report_details`
--
ALTER TABLE `report_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `report_products`
--
ALTER TABLE `report_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `rows_certificates`
--
ALTER TABLE `rows_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `server_sql_licenses`
--
ALTER TABLE `server_sql_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `spreadsheets`
--
ALTER TABLE `spreadsheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `spreadsheet_rows_tpvs`
--
ALTER TABLE `spreadsheet_rows_tpvs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `spreadsheet_shops`
--
ALTER TABLE `spreadsheet_shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `spreadsheet_tpvs`
--
ALTER TABLE `spreadsheet_tpvs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sql_licenses`
--
ALTER TABLE `sql_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `tpvs`
--
ALTER TABLE `tpvs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tpv_types`
--
ALTER TABLE `tpv_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `type_components`
--
ALTER TABLE `type_components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `vpns`
--
ALTER TABLE `vpns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vpn_servers`
--
ALTER TABLE `vpn_servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wifi_channels`
--
ALTER TABLE `wifi_channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Filtros para la tabla `characteristics_products`
--
ALTER TABLE `characteristics_products`
  ADD CONSTRAINT `fk_characteristics_products_products1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_characteristics_products_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Filtros para la tabla `ip_linux_directions`
--
ALTER TABLE `ip_linux_directions`
  ADD CONSTRAINT `fk_ip_linux_directions_services1` FOREIGN KEY (`id_server`) REFERENCES `servers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ip_linux_directions_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `fk_payment_methods_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `spreadsheets`
--
ALTER TABLE `spreadsheets`
  ADD CONSTRAINT `fk_report_sales_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `spreadsheet_rows_tpvs`
--
ALTER TABLE `spreadsheet_rows_tpvs`
  ADD CONSTRAINT `fk_report_sale_tpvs_payment_methods1` FOREIGN KEY (`id_payment_method`) REFERENCES `payment_methods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_spreadsheet_rows_tpvs_spreadsheet_tpvs1` FOREIGN KEY (`id_spreadsheet_tpv`) REFERENCES `spreadsheet_tpvs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `spreadsheet_shops`
--
ALTER TABLE `spreadsheet_shops`
  ADD CONSTRAINT `fk_spreadsheet_shops_shops1` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_spreadsheet_shops_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_spreadsheet_shops_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `spreadsheet_tpvs`
--
ALTER TABLE `spreadsheet_tpvs`
  ADD CONSTRAINT `fk_report_sale_total_tpvs_tpvs1` FOREIGN KEY (`id_tpv`) REFERENCES `tpvs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_spreadsheet_tpvs_spreadsheets1` FOREIGN KEY (`id_spreadsheet`) REFERENCES `spreadsheets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_spreadsheet_tpvs_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tpvs`
--
ALTER TABLE `tpvs`
  ADD CONSTRAINT `fk_tpvs_shops1` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tpvs_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tpvs_tpv_types1` FOREIGN KEY (`id_tpv_component`) REFERENCES `tpv_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tpvs_users2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
