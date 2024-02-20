-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-02-2024 a las 23:32:36
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
(7, 4, 'Muy buena atención. Muchas Gracias', 56, 23, '29 January 2024', '2024-01-30 01:14:30', '2024-01-30 01:11:34'),
(8, 3, 'Gracias', 67, 1, '14 February 2024', '2024-02-14 19:35:20', '2024-02-14 19:35:20');

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
(26, 2, '08/02/2024 10:35:04', 'OFICINA ADMINISTRATIVA', 1, 1, NULL, NULL, 'N/a', NULL, NULL, NULL, NULL, 2, '2024-02-08 20:36:53', '2024-02-08 20:35:22'),
(27, 2, '14/02/2024 17:09:52', 'oficinas de NETGROUP', 19, 18, NULL, 19, 'salida para  NETGROUP con portátiles alquilados', '2024-02-14_22-15-20.jpg', '14/02/2024 17:15:46', '2024-02-14_22-18-44.jpg', '14/02/2024 17:18:21', 12, '2024-02-14 22:18:46', '2024-02-15 03:12:40'),
(28, 2, '15/02/2024 15:08:59', 'oficina administrativa', 18, 1, NULL, 18, 'Entran los siguientes equipo a la Oficina Administrativa', '2024-02-15_20-15-38.jpg', '15/02/2024 15:14:42', '2024-02-15_20-18-16.jpg', '15/02/2024 15:16:06', 12, '2024-02-15 20:18:18', '2024-02-16 01:10:38'),
(29, 1, '16/02/2024 07:52:50', 'Salida para las oficinas de NETGROPU', 1, NULL, 'NETGROUP', 26, 'Salida con maletines', '2024-02-19_21-00-25.jfif', '19/02/2024 16:00:07', '2024-02-19_21-00-40.jfif', '19/02/2024 16:00:26', 12, '2024-02-19 21:00:55', '2024-02-16 17:54:15');

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

--
-- Volcado de datos para la tabla `characteristics_products`
--

INSERT INTO `characteristics_products` (`id`, `type`, `detail`, `id_product`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'NEGRO', NULL, 14, 1, '2024-02-16 02:59:46', '2024-02-16 02:59:46'),
(2, 'NEGRO', NULL, 14, 1, '2024-02-16 03:04:05', '2024-02-16 03:04:05'),
(3, 'Negro', NULL, 9, 2, '2024-02-16 21:41:16', '2024-02-16 19:52:35'),
(4, 'MARCA', 'HP', 9, 2, '2024-02-16 21:41:43', '2024-02-16 21:37:51'),
(5, 'COLOR', 'NEGRO', 9, 1, '2024-02-16 21:42:30', '2024-02-16 21:42:30');

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
('asistentetic@eltemplodelamoda.com.co', '949457', '2024-02-14 23:52:01', '2024-02-14 23:52:01'),
('csoporte@eltemplodelamoda.com.co', '271395', '2023-12-09 21:33:16', '2023-12-09 21:33:16'),
('ewtewtewt@eltemplodelamoda.com.co', '480993', '2024-01-05 23:47:39', '2024-01-05 23:47:39'),
('fwefewfw@eltemplodelamoda.com.co', '866571', '2024-01-05 23:43:24', '2024-01-05 23:43:24'),
('jccq12@eltemplodelamoda.com.co', '528815', '2023-12-09 18:50:00', '2023-12-09 18:50:00'),
('jccq12@eltemplodelamodafresca.com.co', '984455', '2023-12-09 18:49:21', '2023-12-09 18:49:21'),
('jccq12@gmail.com', '454489', '2024-01-26 21:16:56', '2024-01-26 21:16:56'),
('recepciontdm@eltemplodelamoda.com.co', '211659', '2024-02-15 02:48:37', '2024-02-15 02:48:37'),
('sistemasaux10@eltemplodelamoda.com.co', '227045', '2024-01-31 01:13:13', '2024-01-31 01:13:13'),
('sistemasaux11@eltemplodelamoda.com.co', '486707', '2024-02-14 18:38:29', '2024-02-14 18:38:29'),
('sistemasaux21@eltemplodelamoda.com.co', '484538', '2024-01-27 19:49:49', '2024-01-27 19:49:49'),
('sistemasaux6@eltemplodelamoda.com.co', '377679', '2024-02-16 00:58:57', '2024-02-16 00:58:57'),
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
(209, 'YA ACABO?', '13 February 2024 15:38:49', 10, 63, 1, '2024-02-13 20:38:51', '2024-02-13 20:38:51'),
(210, 'Buen Dia Leonardo, Porfa cuando pasen estos casos, realizar las preguntar pertinentes las cuales son las siguientes', '14 February 2024 08:51:01', 18, 64, 1, '2024-02-14 18:51:01', '2024-02-14 18:51:01'),
(211, '1 Preguntarle al usuario si debemos ejecutar la NTC por Almacen Fecha y No de Caja', '14 February 2024 08:51:39', 18, 64, 1, '2024-02-14 18:51:39', '2024-02-14 18:51:39'),
(212, 'si ese no es el problema preguntarle si hay un daño de caja o si las ventas no subieron', '14 February 2024 08:52:07', 18, 64, 1, '2024-02-14 13:52:09', '2024-02-14 13:52:09'),
(213, 'con el fin de solucionar y tener un dato mas certero ya que la imagen anexa no me informa nada', '14 February 2024 08:52:32', 18, 64, 1, '2024-02-14 13:52:34', '2024-02-14 13:52:34'),
(214, 'Yo ya pregunte', '14 February 2024 08:59:11', 1, 64, 1, '2024-02-14 18:59:11', '2024-02-14 18:59:11'),
(215, 'Por si algo', '14 February 2024 08:59:17', 1, 64, 1, '2024-02-14 18:59:17', '2024-02-14 18:59:17'),
(216, 'Lo vamos a mandar', '14 February 2024 09:11:40', 1, 65, 1, '2024-02-14 19:11:40', '2024-02-14 19:11:40'),
(217, 'De aqui para alla cierto?', '14 February 2024 09:11:45', 1, 65, 1, '2024-02-14 19:11:45', '2024-02-14 19:11:45'),
(218, 'Osea para el CEDI?', '14 February 2024 09:11:51', 1, 65, 1, '2024-02-14 19:11:51', '2024-02-14 19:11:51'),
(219, 'no sabemos si esta bien el adaptador, necesitamos solo responderle el correo que mando a la cuenta de soporte', '14 February 2024 09:12:58', 19, 65, 1, '2024-02-14 19:12:58', '2024-02-14 19:12:58'),
(220, 'Entonces respondo que si le vamos a enviar uno y ya?', '14 February 2024 09:13:16', 1, 65, 1, '2024-02-14 19:13:16', '2024-02-14 19:13:16'),
(221, 'O como ?', '14 February 2024 09:13:28', 1, 65, 1, '2024-02-14 14:13:30', '2024-02-14 14:13:30'),
(222, 'que dice el correo ?', '14 February 2024 09:13:50', 19, 65, 1, '2024-02-14 19:13:50', '2024-02-14 19:13:50'),
(223, 'Que solicita un convertidor VGA a HTDMI', '14 February 2024 09:14:36', 1, 65, 1, '2024-02-14 19:14:36', '2024-02-14 19:14:36'),
(224, 'Eso no tenemos', '14 February 2024 09:14:39', 1, 65, 1, '2024-02-14 19:14:39', '2024-02-14 19:14:39'),
(225, 'Hay que comprarlo', '14 February 2024 09:14:46', 1, 65, 1, '2024-02-14 19:14:46', '2024-02-14 19:14:46'),
(226, 'Ya', '14 February 2024 09:16:54', 1, 65, 1, '2024-02-14 19:16:54', '2024-02-14 19:16:54'),
(227, 'Cierra el ticket porfa', '14 February 2024 09:17:04', 1, 65, 1, '2024-02-14 19:17:04', '2024-02-14 19:17:04'),
(228, 'Hay que ir a cotizar un cable', '14 February 2024 09:17:13', 1, 65, 1, '2024-02-14 19:17:13', '2024-02-14 19:17:13'),
(229, 'Ese que tu quiere mandar no es', '14 February 2024 09:17:19', 1, 65, 1, '2024-02-14 14:17:21', '2024-02-14 14:17:21'),
(230, 'listo', '14 February 2024 09:22:15', 19, 66, 1, '2024-02-14 14:22:17', '2024-02-14 14:22:17'),
(231, 'Cierra el ticket porfavor', '14 February 2024 09:27:52', 1, 64, 1, '2024-02-14 14:27:54', '2024-02-14 14:27:54'),
(232, 'Listo?', '14 February 2024 09:49:29', 1, 66, 1, '2024-02-14 19:49:29', '2024-02-14 19:49:29'),
(233, 'bro no puedo cambiar los datos ni la contraseña a los correo', '14 February 2024 10:37:35', 19, 69, 1, '2024-02-14 15:37:37', '2024-02-14 15:37:37'),
(234, 'Necesito el correo', '14 February 2024 10:38:43', 1, 69, 1, '2024-02-14 20:38:43', '2024-02-14 20:38:43'),
(235, 'Dime que correo es', '14 February 2024 10:38:49', 1, 69, 1, '2024-02-14 20:38:49', '2024-02-14 20:38:49'),
(236, 'Listo', '14 February 2024 10:42:23', 1, 69, 1, '2024-02-14 20:42:23', '2024-02-14 20:42:23'),
(237, 'Te voy a adjuntar el cambio en una imagen al ticket', '14 February 2024 10:42:35', 1, 69, 1, '2024-02-14 20:42:35', '2024-02-14 20:42:35'),
(238, 'Ya esta', '14 February 2024 10:43:14', 1, 69, 1, '2024-02-14 20:43:14', '2024-02-14 20:43:14'),
(239, 'Puede descargar la captura', '14 February 2024 10:43:21', 1, 69, 1, '2024-02-14 20:43:21', '2024-02-14 20:43:21'),
(240, 'Cerra el ticket porfa :)', '14 February 2024 10:49:11', 1, 69, 1, '2024-02-14 20:49:11', '2024-02-14 20:49:11'),
(241, 'Listo bro', '14 February 2024 11:19:00', 1, 71, 1, '2024-02-14 21:19:00', '2024-02-14 21:19:00'),
(242, 'Informales que ya se hizo porfa', '14 February 2024 11:19:10', 1, 71, 1, '2024-02-14 21:19:10', '2024-02-14 21:19:10'),
(243, 'Y cierra el ticket', '14 February 2024 11:19:13', 1, 71, 1, '2024-02-14 21:19:13', '2024-02-14 21:19:13'),
(244, 'Ya existe la visita?', '14 February 2024 12:00:36', 1, 70, 1, '2024-02-14 17:00:38', '2024-02-14 17:00:38'),
(245, 'me respopndio vale', '14 February 2024 12:01:06', 19, 70, 1, '2024-02-14 22:01:06', '2024-02-14 22:01:06'),
(246, 'esperemos que llegue', '14 February 2024 12:01:14', 19, 70, 1, '2024-02-14 22:01:14', '2024-02-14 22:01:14'),
(247, 'ya lo pedi pero no me han respuesto el correo', '15 February 2024 08:28:44', 19, 73, 1, '2024-02-15 13:28:47', '2024-02-15 13:28:47'),
(248, 'hgh', '16 February 2024 14:03:12', 1, 73, 1, '2024-02-16 19:03:16', '2024-02-16 19:03:16'),
(249, 'Correcto. Ya la ejecuto', '16 February 2024 16:00:43', 1, 74, 1, '2024-02-16 21:00:47', '2024-02-16 21:00:47'),
(250, 'Ya la ejecute', '16 February 2024 16:06:34', 1, 74, 1, '2024-02-17 02:06:34', '2024-02-17 02:06:34');

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
(11, '2024-02-08_10-34-36.webp', 8, 1, '2024-02-08 15:34:36', '2024-02-08 15:34:36'),
(12, '2024-02-14_17-00-13.jpg', 9, 1, '2024-02-14 22:00:13', '2024-02-14 22:00:13'),
(13, '2024-02-14_17-03-19.jpg', 10, 1, '2024-02-14 22:03:19', '2024-02-14 22:03:19'),
(14, '2024-02-14_17-04-00.jpg', 11, 1, '2024-02-14 22:04:00', '2024-02-14 22:04:00'),
(15, '2024-02-14_17-05-24.jpg', 12, 1, '2024-02-14 22:05:24', '2024-02-14 22:05:24'),
(16, '2024-02-14_17-06-13.jpg', 13, 1, '2024-02-14 22:06:13', '2024-02-14 22:06:13'),
(17, '2024-02-14_17-08-17.jpg', 14, 1, '2024-02-14 22:08:17', '2024-02-14 22:08:17');

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
(137, 'Se ha creado un nuevo ticket para ti', '01/02/2024 14:37:11', 'http://localhost/dashboard/tickets/ticket_detail/59', 1, 4, '2024-02-15 20:38:34', '2024-02-01 19:37:11'),
(138, 'Su ticket ha sido VISTO y esta previo a ejecución', '01/02/2024 14:37:21', 'http://localhost/dashboard/tickets/ticket_detail/59', 1, 4, '2024-02-01 19:37:21', '2024-02-01 19:37:21'),
(139, 'El ticket ha sido modificado', '01/02/2024 14:58:32', 'http://localhost/dashboard/tickets/ticket_detail/59', 10, 4, '2024-02-01 19:58:32', '2024-02-01 19:58:32'),
(140, 'Se ha creado una nueva acta para ti', '01/02/2024 15:04:38', 'http://localhost/dashboard/certificates/view_certificate/23', 1, 4, '2024-02-01 20:04:38', '2024-02-01 20:04:38'),
(141, 'El usuario sistemasaux9@eltemplodelamoda.com.co esta esperando que lo ACTIVES', '05/02/2024 10:54:50', 'http://localhost/dashboard/users', 2, 4, '2024-02-15 00:20:15', '2024-02-05 15:54:50'),
(142, 'Se ha eliminado el acta el cual ibas a recibir', '07/02/2024 10:15:34', 'http://172.21.107.193/dashboard/certificates/view_certificate/23', 1, 4, '2024-02-07 15:15:34', '2024-02-07 15:15:34'),
(143, 'Se ha creado una nueva acta para ti', '07/02/2024 10:16:36', 'http://172.21.107.193/dashboard/certificates/view_certificate/24', 24, 4, '2024-02-07 15:16:36', '2024-02-07 15:16:36'),
(144, 'El acta el cual recibiras se encuentra despachada', '07/02/2024 10:17:02', 'http://172.21.107.193/dashboard/certificates/view_certificate/24', 24, 4, '2024-02-07 15:17:02', '2024-02-07 15:17:02'),
(145, 'Se ha eliminado el acta el cual ibas a recibir', '07/02/2024 10:18:37', 'http://172.21.107.193/dashboard/certificates/view_certificate/24', 24, 4, '2024-02-07 15:18:37', '2024-02-07 15:18:37'),
(146, 'Se ha creado una nueva acta para ti', '07/02/2024 10:19:13', 'http://172.21.107.193/dashboard/certificates/view_certificate/25', 18, 4, '2024-02-14 21:35:21', '2024-02-07 15:19:13'),
(147, 'El acta el cual recibiras se encuentra despachada', '07/02/2024 10:19:31', 'http://172.21.107.193/dashboard/certificates/view_certificate/25', 18, 4, '2024-02-07 15:19:31', '2024-02-07 15:19:31'),
(148, 'Su acta ha sido ENTREGADA con exito!', '07/02/2024 10:22:53', 'http://172.21.107.193/dashboard/certificates/view_certificate/24', 10, 4, '2024-02-07 15:22:53', '2024-02-07 15:22:53'),
(149, 'Su acta ha sido ENTREGADA con exito!', '07/02/2024 10:23:16', 'http://172.21.107.193/dashboard/certificates/view_certificate/25', 10, 4, '2024-02-07 15:23:16', '2024-02-07 15:23:16'),
(150, 'Tienes un nuevo comentario en ticket', '07/02/2024 11:01:33', 'http://172.21.107.193/dashboard/tickets/ticket_detail/59', 1, 4, '2024-02-07 21:17:34', '2024-02-07 16:01:33'),
(151, 'Se ha creado una nueva acta para ti', '08/02/2024 10:35:25', 'http://localhost/dashboard/certificates/view_certificate/26', 1, 4, '2024-02-08 15:35:25', '2024-02-08 15:35:25'),
(152, 'Se ha eliminado el acta el cual ibas a recibir', '08/02/2024 10:36:53', 'http://localhost/dashboard/certificates/view_certificate/26', 1, 4, '2024-02-08 15:36:53', '2024-02-08 15:36:53'),
(153, 'Se ha creado un nuevo ticket para ti', '08/02/2024 12:19:06', 'http://localhost/dashboard/tickets/ticket_detail/60', 1, 4, '2024-02-08 17:19:06', '2024-02-08 17:19:06'),
(154, 'Se ha creado un nuevo ticket para ti', '08/02/2024 12:19:59', 'http://localhost/dashboard/tickets/ticket_detail/61', 10, 4, '2024-02-08 17:19:59', '2024-02-08 17:19:59'),
(155, 'Su ticket ha sido VISTO y esta previo a ejecución', '08/02/2024 12:20:10', 'http://localhost/dashboard/tickets/ticket_detail/61', 10, 4, '2024-02-08 17:20:10', '2024-02-08 17:20:10'),
(156, 'El ticket impuesto para ti ha sido eliminado!', '08/02/2024 12:20:16', 'http://localhost/dashboard/tickets/ticket_detail/61', 10, 4, '2024-02-09 00:15:57', '2024-02-08 17:20:16'),
(157, 'Se ha creado un nuevo ticket para ti', '08/02/2024 12:20:34', 'http://localhost/dashboard/tickets/ticket_detail/62', 1, 4, '2024-02-08 17:20:34', '2024-02-08 17:20:34'),
(158, 'Se ha creado un nuevo ticket para ti', '13/02/2024 15:30:45', 'http://localhost/dashboard/tickets/ticket_detail/63', 10, 4, '2024-02-13 20:30:45', '2024-02-13 20:30:45'),
(159, 'Su ticket ha sido VISTO y esta previo a ejecución', '13/02/2024 15:32:23', 'http://localhost/dashboard/tickets/ticket_detail/63', 1, 4, '2024-02-14 01:32:34', '2024-02-13 20:32:23'),
(160, 'Su ticket ha sido ejecutado', '13/02/2024 15:37:42', 'http://localhost/dashboard/tickets/ticket_detail/63', 1, 4, '2024-02-13 20:37:42', '2024-02-13 20:37:42'),
(161, 'Tienes un nuevo comentario en ticket', '13/02/2024 15:38:51', 'http://localhost/dashboard/tickets/ticket_detail/63', 1, 4, '2024-02-13 20:38:51', '2024-02-13 20:38:51'),
(162, 'Se ha creado un nuevo ticket para ti', '14/02/2024 08:47:00', 'http://172.21.107.193/dashboard/tickets/ticket_detail/64', 18, 4, '2024-02-14 18:47:07', '2024-02-14 13:47:00'),
(163, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 08:47:26', 'http://172.21.107.193/dashboard/tickets/ticket_detail/64', 19, 4, '2024-02-14 18:47:47', '2024-02-14 13:47:26'),
(164, 'Tienes un nuevo comentario en ticket', '14/02/2024 08:52:09', 'http://172.21.107.193/dashboard/tickets/ticket_detail/64', 19, 4, '2024-02-14 18:55:51', '2024-02-14 13:52:09'),
(165, 'Tienes un nuevo comentario en ticket', '14/02/2024 08:52:34', 'http://172.21.107.193/dashboard/tickets/ticket_detail/64', 19, 4, '2024-02-14 21:55:13', '2024-02-14 13:52:34'),
(166, 'El ticket ha sido modificado', '14/02/2024 08:55:27', 'http://127.0.0.1:8000/dashboard/tickets/ticket_detail/64', 1, 4, '2024-02-14 13:55:27', '2024-02-14 13:55:27'),
(167, 'Se ha creado un nuevo ticket para ti', '14/02/2024 09:10:33', 'http://172.21.107.193/dashboard/tickets/ticket_detail/65', 1, 4, '2024-02-14 19:10:39', '2024-02-14 14:10:33'),
(168, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 09:10:53', 'http://172.21.107.193/dashboard/tickets/ticket_detail/65', 19, 4, '2024-02-14 19:11:01', '2024-02-14 14:10:53'),
(169, 'Su ticket ha sido ejecutado', '14/02/2024 09:11:22', 'http://172.21.107.193/dashboard/tickets/ticket_detail/65', 19, 4, '2024-02-14 21:55:21', '2024-02-14 14:11:22'),
(170, 'El ticket ha sido modificado', '14/02/2024 09:13:30', 'http://172.21.107.193/dashboard/tickets/ticket_detail/65', 1, 4, '2024-02-14 14:13:30', '2024-02-14 14:13:30'),
(171, 'Tienes un nuevo comentario en ticket', '14/02/2024 09:13:30', 'http://172.21.107.193/dashboard/tickets/ticket_detail/65', 19, 4, '2024-02-14 21:55:27', '2024-02-14 14:13:30'),
(172, 'El usuario Jhan Carlos Cordoba esta esperando la finalizacion del ticket #65', '14/02/2024 09:16:55', 'http://172.21.107.193/dashboard/tickets/ticket_detail/65', 19, 4, '2024-02-14 21:55:34', '2024-02-14 14:16:55'),
(173, 'Tienes un nuevo comentario en ticket', '14/02/2024 09:17:21', 'http://172.21.107.193/dashboard/tickets/ticket_detail/65', 19, 4, '2024-02-14 21:55:41', '2024-02-14 14:17:21'),
(174, 'Su ticket ha sido cerrado con exito!', '14/02/2024 09:17:33', 'http://172.21.107.193/dashboard/tickets/ticket_detail/65', 1, 4, '2024-02-14 14:17:33', '2024-02-14 14:17:33'),
(175, 'Se ha creado un nuevo ticket para ti', '14/02/2024 09:19:05', 'http://172.21.107.193/dashboard/tickets/ticket_detail/66', 19, 4, '2024-02-14 21:55:46', '2024-02-14 14:19:05'),
(176, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 09:19:31', 'http://172.21.107.193/dashboard/tickets/ticket_detail/66', 1, 4, '2024-02-14 14:19:31', '2024-02-14 14:19:31'),
(177, 'Tienes un nuevo comentario en ticket', '14/02/2024 09:22:17', 'http://172.21.107.193/dashboard/tickets/ticket_detail/66', 1, 4, '2024-02-14 14:22:17', '2024-02-14 14:22:17'),
(178, 'Su ticket ha sido ejecutado', '14/02/2024 09:23:22', 'http://172.21.107.193/dashboard/tickets/ticket_detail/66', 1, 4, '2024-02-14 14:23:22', '2024-02-14 14:23:22'),
(179, 'Se ha creado un nuevo ticket para ti', '14/02/2024 09:26:37', 'http://172.21.107.193/dashboard/tickets/ticket_detail/67', 18, 4, '2024-02-14 19:29:58', '2024-02-14 14:26:38'),
(180, 'Su ticket ha sido ejecutado', '14/02/2024 09:27:41', 'http://172.21.107.193/dashboard/tickets/ticket_detail/64', 19, 4, '2024-02-14 21:55:53', '2024-02-14 14:27:41'),
(181, 'Tienes un nuevo comentario en ticket', '14/02/2024 09:27:54', 'http://172.21.107.193/dashboard/tickets/ticket_detail/64', 19, 4, '2024-02-14 21:56:00', '2024-02-14 14:27:54'),
(182, 'El usuario Jhan Carlos Cordoba esta esperando la finalizacion del ticket #64', '14/02/2024 09:27:56', 'http://172.21.107.193/dashboard/tickets/ticket_detail/64', 19, 4, '2024-02-14 21:56:06', '2024-02-14 14:27:56'),
(183, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 09:30:00', 'http://172.21.107.193/dashboard/tickets/ticket_detail/67', 1, 4, '2024-02-14 14:30:00', '2024-02-14 14:30:00'),
(184, 'Su ticket ha sido ejecutado', '14/02/2024 09:34:37', 'http://172.21.107.193/dashboard/tickets/ticket_detail/67', 1, 4, '2024-02-14 14:34:37', '2024-02-14 14:34:37'),
(185, 'Su ticket ha sido cerrado con exito!', '14/02/2024 09:34:49', 'http://172.21.107.193/dashboard/tickets/ticket_detail/67', 18, 4, '2024-02-14 21:35:09', '2024-02-14 14:34:49'),
(186, 'Tu ticket ha sido calificado !Hechale un vistaso!', '14/02/2024 09:35:20', 'http://172.21.107.193/dashboard/tickets/ticket_detail/67', 18, 4, '2024-02-14 21:36:15', '2024-02-14 14:35:20'),
(187, 'El usuario Leonardo Dagua esta esperando la finalizacion del ticket #66', '14/02/2024 09:43:11', 'http://172.21.107.193/dashboard/tickets/ticket_detail/66', 1, 4, '2024-02-14 14:43:11', '2024-02-14 14:43:11'),
(188, 'Su ticket ha sido cerrado con exito!', '14/02/2024 09:49:19', 'http://172.21.107.193/dashboard/tickets/ticket_detail/66', 19, 4, '2024-02-14 21:56:17', '2024-02-14 14:49:19'),
(189, 'Su ticket ha sido cerrado con exito!', '14/02/2024 09:49:55', 'http://172.21.107.193/dashboard/tickets/ticket_detail/64', 1, 4, '2024-02-14 19:50:03', '2024-02-14 14:49:55'),
(190, 'Se ha creado un nuevo ticket para ti', '14/02/2024 10:31:33', 'http://172.21.107.193/dashboard/tickets/ticket_detail/68', 19, 4, '2024-02-14 21:56:23', '2024-02-14 15:31:33'),
(191, 'Se ha creado un nuevo ticket para ti', '14/02/2024 10:33:30', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 19, 4, '2024-02-14 21:56:29', '2024-02-14 15:33:30'),
(192, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 10:36:25', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 19, 4, '2024-02-14 20:36:38', '2024-02-14 15:36:25'),
(193, 'El ticket ha sido modificado', '14/02/2024 10:37:11', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 1, 4, '2024-02-14 15:37:11', '2024-02-14 15:37:11'),
(194, 'Tienes un nuevo comentario en ticket', '14/02/2024 10:37:37', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 1, 4, '2024-02-14 15:37:37', '2024-02-14 15:37:37'),
(195, 'Su ticket ha sido ejecutado', '14/02/2024 10:42:39', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 19, 4, '2024-02-14 21:56:35', '2024-02-14 15:42:39'),
(196, 'El ticket ha sido modificado', '14/02/2024 10:42:58', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 1, 4, '2024-02-14 15:42:58', '2024-02-14 15:42:58'),
(197, 'El usuario Jhan Carlos Cordoba esta esperando la finalizacion del ticket #69', '14/02/2024 10:43:25', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 19, 4, '2024-02-14 21:56:51', '2024-02-14 15:43:25'),
(198, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 10:43:45', 'http://172.21.107.193/dashboard/tickets/ticket_detail/68', 19, 4, '2024-02-14 21:56:58', '2024-02-14 15:43:45'),
(199, 'El usuario Jhan Carlos Cordoba esta esperando la finalizacion del ticket #69', '14/02/2024 10:48:52', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 19, 4, '2024-02-14 21:57:03', '2024-02-14 15:48:52'),
(200, 'El usuario Jhan Carlos Cordoba esta esperando la finalizacion del ticket #69', '14/02/2024 10:53:20', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 19, 4, '2024-02-14 21:57:08', '2024-02-14 15:53:20'),
(201, 'El ticket impuesto para ti ha sido eliminado!', '14/02/2024 11:00:49', 'http://172.21.107.193/dashboard/tickets/ticket_detail/69', 1, 4, '2024-02-14 16:00:49', '2024-02-14 16:00:49'),
(202, 'Se ha creado un nuevo ticket para ti', '14/02/2024 11:03:40', 'http://172.21.107.193/dashboard/tickets/ticket_detail/70', 19, 4, '2024-02-14 21:57:15', '2024-02-14 16:03:40'),
(203, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 11:03:52', 'http://172.21.107.193/dashboard/tickets/ticket_detail/70', 1, 4, '2024-02-14 16:03:52', '2024-02-14 16:03:52'),
(204, 'Su ticket ha sido ejecutado', '14/02/2024 11:16:04', 'http://172.21.107.193/dashboard/tickets/ticket_detail/70', 1, 4, '2024-02-14 16:16:04', '2024-02-14 16:16:04'),
(205, 'Se ha creado un nuevo ticket para ti', '14/02/2024 11:17:34', 'http://172.21.107.193/dashboard/tickets/ticket_detail/71', 1, 4, '2024-02-14 16:17:34', '2024-02-14 16:17:34'),
(206, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 11:17:48', 'http://172.21.107.193/dashboard/tickets/ticket_detail/71', 19, 4, '2024-02-14 22:00:09', '2024-02-14 16:17:48'),
(207, 'Su ticket ha sido ejecutado', '14/02/2024 11:18:03', 'http://172.21.107.193/dashboard/tickets/ticket_detail/71', 19, 4, '2024-02-14 22:00:14', '2024-02-14 16:18:03'),
(208, 'El usuario Jhan Carlos Cordoba esta esperando la finalizacion del ticket #71', '14/02/2024 11:19:16', 'http://172.21.107.193/dashboard/tickets/ticket_detail/71', 19, 4, '2024-02-14 22:00:20', '2024-02-14 16:19:16'),
(209, 'Su ticket ha sido cerrado con exito!', '14/02/2024 11:19:29', 'http://172.21.107.193/dashboard/tickets/ticket_detail/71', 1, 4, '2024-02-14 16:19:29', '2024-02-14 16:19:29'),
(210, 'El ticket ha sido modificado', '14/02/2024 11:31:55', 'http://172.21.107.193/dashboard/tickets/ticket_detail/68', 18, 4, '2024-02-14 21:36:22', '2024-02-14 16:31:55'),
(211, 'El ticket ha sido modificado', '14/02/2024 11:33:32', 'http://172.21.107.193/dashboard/tickets/ticket_detail/68', 18, 4, '2024-02-14 21:35:42', '2024-02-14 16:33:32'),
(212, 'El ticket impuesto para ti ha sido eliminado!', '14/02/2024 11:54:01', 'http://172.21.107.193/dashboard/tickets/ticket_detail/68', 18, 4, '2024-02-14 16:54:01', '2024-02-14 16:54:01'),
(213, 'Tienes un nuevo comentario en ticket', '14/02/2024 12:00:38', 'http://172.21.107.193/dashboard/tickets/ticket_detail/70', 19, 4, '2024-02-14 22:00:43', '2024-02-14 17:00:38'),
(214, 'El usuario asistentetic@eltemplodelamoda.com.co esta esperando que lo ACTIVES', '14/02/2024 13:52:21', 'http://172.21.107.193/dashboard/users', 2, 4, '2024-02-14 18:52:21', '2024-02-14 18:52:21'),
(215, 'Se ha creado un nuevo ticket para ti', '14/02/2024 15:22:19', 'http://172.21.107.193/dashboard/tickets/ticket_detail/72', 1, 4, '2024-02-14 20:22:19', '2024-02-14 20:22:19'),
(216, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 15:22:32', 'http://172.21.107.193/dashboard/tickets/ticket_detail/72', 19, 4, '2024-02-15 01:24:50', '2024-02-14 20:22:32'),
(217, 'Su ticket ha sido ejecutado', '14/02/2024 15:26:43', 'http://172.21.107.193/dashboard/tickets/ticket_detail/72', 19, 4, '2024-02-14 20:26:43', '2024-02-14 20:26:43'),
(218, 'El ticket ha sido modificado', '14/02/2024 15:29:18', 'http://172.21.107.193/dashboard/tickets/ticket_detail/72', 1, 4, '2024-02-14 20:29:18', '2024-02-14 20:29:18'),
(219, 'El usuario Jhan Carlos Cordoba esta esperando la finalizacion del ticket #72', '14/02/2024 15:31:26', 'http://172.21.107.193/dashboard/tickets/ticket_detail/72', 19, 4, '2024-02-14 20:31:26', '2024-02-14 20:31:26'),
(220, 'Su ticket ha sido cerrado con exito!', '14/02/2024 15:36:17', 'http://172.21.107.193/dashboard/tickets/ticket_detail/72', 1, 4, '2024-02-14 20:36:17', '2024-02-14 20:36:17'),
(221, 'Se ha creado un nuevo ticket para ti', '14/02/2024 16:11:04', 'http://172.21.107.193/dashboard/tickets/ticket_detail/73', 19, 4, '2024-02-14 21:11:04', '2024-02-14 21:11:04'),
(222, 'Su ticket ha sido VISTO y esta previo a ejecución', '14/02/2024 16:16:33', 'http://172.21.107.193/dashboard/tickets/ticket_detail/73', 1, 4, '2024-02-14 21:16:33', '2024-02-14 21:16:33'),
(223, 'Su ticket ha sido ejecutado', '14/02/2024 16:16:59', 'http://172.21.107.193/dashboard/tickets/ticket_detail/73', 1, 4, '2024-02-14 21:16:59', '2024-02-14 21:16:59'),
(224, 'El usuario recepciontdm@eltemplodelamoda.com.co esta esperando que lo ACTIVES', '14/02/2024 16:49:03', 'http://172.21.107.193/dashboard/users', 2, 4, '2024-02-14 21:49:03', '2024-02-14 21:49:03'),
(225, 'Se ha creado una nueva acta para ti', '14/02/2024 17:12:42', 'http://172.21.107.193/dashboard/certificates/view_certificate/27', 18, 4, '2024-02-14 22:12:42', '2024-02-14 22:12:42'),
(226, 'El acta el cual recibiras se encuentra despachada', '14/02/2024 17:15:20', 'http://172.21.107.193/dashboard/certificates/view_certificate/27', 18, 4, '2024-02-14 22:15:20', '2024-02-14 22:15:20'),
(227, 'Su acta ha sido ENTREGADA con exito!', '14/02/2024 17:18:44', 'http://172.21.107.193/dashboard/certificates/view_certificate/27', 19, 4, '2024-02-14 22:18:44', '2024-02-14 22:18:44'),
(228, 'Tienes un nuevo comentario en ticket', '15/02/2024 08:28:47', 'http://172.21.107.193/dashboard/tickets/ticket_detail/73', 1, 4, '2024-02-15 18:46:22', '2024-02-15 13:28:47'),
(229, 'Su ticket ha sido cerrado con exito!', '15/02/2024 08:46:46', 'http://172.21.107.193/dashboard/tickets/ticket_detail/73', 19, 4, '2024-02-15 13:46:46', '2024-02-15 13:46:46'),
(230, 'El usuario Jhan Carlos Cordoba ha solicitado un permiso', '15/02/2024 11:22:53', 'http://172.21.107.193/dashboard/permissions/view_permission/2', 1, 4, '2024-02-16 00:32:44', '2024-02-15 16:22:53'),
(231, 'El usuario Sebastian Hinestroza ha solicitado un permiso', '15/02/2024 11:25:03', 'http://172.21.107.193/dashboard/permissions/view_permission/3', 1, 4, '2024-02-16 00:33:01', '2024-02-15 16:25:03'),
(232, 'El jefe de area Rodrigo Rodallega ha aprobado su permiso :) ', '15/02/2024 11:29:27', 'http://172.21.107.193/dashboard/permissions/view_permission/2', 1, 4, '2024-02-16 00:33:17', '2024-02-15 16:29:27'),
(233, 'El jefe de area Rodrigo Rodallega ha aprobado su permiso :) ', '15/02/2024 11:30:10', 'http://172.21.107.193/dashboard/permissions/view_permission/3', 18, 3, '2024-02-15 16:30:10', '2024-02-15 16:30:10'),
(234, 'El usuario Sebastian Hinestroza ha salido de la instalaciones con permiso', '15/02/2024 11:51:27', 'http://172.21.107.193/dashboard/permissions/view_permission/3', 13, 3, '2024-02-15 16:51:27', '2024-02-15 16:51:27'),
(235, 'El usuario Jhan Carlos Cordoba ha salido de la instalaciones con permiso', '15/02/2024 11:51:44', 'http://172.21.107.193/dashboard/permissions/view_permission/2', 13, 3, '2024-02-15 16:51:44', '2024-02-15 16:51:44'),
(236, 'El usuario Sebastian Hinestroza ha regresado a las instalaciones con permiso', '15/02/2024 12:31:59', 'http://172.21.107.193/dashboard/permissions/view_permission/3', 13, 3, '2024-02-15 17:31:59', '2024-02-15 17:31:59'),
(237, 'El usuario Jhan Carlos Cordoba ha regresado a las instalaciones con permiso', '15/02/2024 12:32:24', 'http://172.21.107.193/dashboard/permissions/view_permission/2', 13, 3, '2024-02-15 17:32:24', '2024-02-15 17:32:24'),
(238, 'El usuario Jhan Carlos Cordoba ha solicitado un permiso', '15/02/2024 14:12:50', 'http://172.21.107.193/dashboard/permissions/view_permission/4', 2, 3, '2024-02-15 19:12:50', '2024-02-15 19:12:50'),
(239, 'El usuario Jhan Carlos Cordoba ha solicitado un permiso', '15/02/2024 14:15:19', 'http://172.21.107.193/dashboard/permissions/view_permission/5', 2, 3, '2024-02-15 19:15:19', '2024-02-15 19:15:19'),
(240, 'El colaborador Jhan Carlos Cordoba ha generado un permiso', '15/02/2024 14:15:19', 'http://172.21.107.193/dashboard/permissions/view_permission/5', 2, 3, '2024-02-15 19:15:19', '2024-02-15 19:15:19'),
(241, 'El usuario Jhan Carlos Cordoba ha solicitado un permiso', '15/02/2024 14:19:12', 'http://172.21.107.193/dashboard/permissions/view_permission/6', 2, 3, '2024-02-15 19:19:12', '2024-02-15 19:19:12'),
(242, 'El jefe de area Sebastian Hinestroza ha aprobado su permiso :) ', '15/02/2024 14:21:25', 'http://172.21.107.193/dashboard/permissions/view_permission/6', 1, 4, '2024-02-16 00:32:49', '2024-02-15 19:21:25'),
(243, 'El usuario Sebastian Hinestroza ha solicitado un permiso', '15/02/2024 14:23:15', 'http://172.21.107.193/dashboard/permissions/view_permission/7', 1, 4, '2024-02-16 00:25:19', '2024-02-15 19:23:15'),
(244, 'El usuario Sebastian Hinestroza ha solicitado un permiso', '15/02/2024 14:23:17', 'http://172.21.107.193/dashboard/permissions/view_permission/7', 2, 3, '2024-02-15 19:23:17', '2024-02-15 19:23:17'),
(245, 'El usuario Jhan Carlos Cordoba ha solicitado un permiso', '15/02/2024 14:30:24', 'http://172.21.107.193/dashboard/permissions/view_permission/8', 2, 3, '2024-02-15 19:30:24', '2024-02-15 19:30:24'),
(246, 'El usuario Sebastian Hinestroza ha solicitado un permiso', '15/02/2024 14:34:41', 'http://172.21.107.193/dashboard/permissions/view_permission/9', 1, 3, '2024-02-15 19:34:41', '2024-02-15 19:34:41'),
(247, 'El usuario Sebastian Hinestroza ha solicitado un permiso', '15/02/2024 14:34:43', 'http://172.21.107.193/dashboard/permissions/view_permission/9', 2, 3, '2024-02-15 19:34:43', '2024-02-15 19:34:43'),
(248, 'El usuario Leonardo Dagua ha solicitado un permiso', '15/02/2024 15:00:33', 'http://172.21.107.193/dashboard/permissions/view_permission/10', 1, 3, '2024-02-15 20:00:33', '2024-02-15 20:00:33'),
(249, 'El usuario Leonardo Dagua ha solicitado un permiso', '15/02/2024 15:00:35', 'http://172.21.107.193/dashboard/permissions/view_permission/10', 2, 3, '2024-02-15 20:00:35', '2024-02-15 20:00:35'),
(250, 'El usuario Sebastian Hinestroza ha solicitado un permiso', '15/02/2024 15:08:23', 'http://172.21.107.193/dashboard/permissions/view_permission/12', 1, 3, '2024-02-15 20:08:23', '2024-02-15 20:08:23'),
(251, 'El usuario Sebastian Hinestroza ha solicitado un permiso', '15/02/2024 15:08:26', 'http://172.21.107.193/dashboard/permissions/view_permission/12', 2, 3, '2024-02-15 20:08:26', '2024-02-15 20:08:26'),
(252, 'Se ha creado una nueva acta para ti', '15/02/2024 15:10:40', 'http://172.21.107.193/dashboard/certificates/view_certificate/28', 1, 4, '2024-02-16 01:11:44', '2024-02-15 20:10:40'),
(253, 'El acta el cual recibiras se encuentra despachada', '15/02/2024 15:15:36', 'http://172.21.107.193/dashboard/certificates/view_certificate/28', 1, 3, '2024-02-15 20:15:36', '2024-02-15 20:15:36'),
(254, 'El acta el cual recibiras se encuentra despachada', '15/02/2024 15:15:38', 'http://172.21.107.193/dashboard/certificates/view_certificate/28', 1, 3, '2024-02-15 20:15:38', '2024-02-15 20:15:38'),
(255, 'Su acta ha sido ENTREGADA con exito!', '15/02/2024 15:18:16', 'http://172.21.107.193/dashboard/certificates/view_certificate/28', 18, 3, '2024-02-15 20:18:16', '2024-02-15 20:18:16'),
(256, 'El usuario Jhan Carlos Cordoba ha solicitado un permiso', '15/02/2024 17:12:31', 'http://172.21.107.193/dashboard/permissions/view_permission/13', 2, 3, '2024-02-15 22:12:31', '2024-02-15 22:12:31'),
(257, 'El jefe de area Sebastian Hinestroza ha aprobado su permiso :) ', '15/02/2024 17:13:23', 'http://172.21.107.193/dashboard/permissions/view_permission/13', 1, 4, '2024-02-16 03:13:44', '2024-02-15 22:13:23'),
(258, 'El jefe de area Sebastian Hinestroza ha aprobado su permiso :) ', '15/02/2024 17:16:21', 'http://172.21.107.193/dashboard/permissions/view_permission/13', 1, 3, '2024-02-15 22:16:21', '2024-02-15 22:16:21'),
(259, 'El usuario Jhan Carlos Cordoba ha regresado a las instalaciones con permiso', '16/02/2024 07:48:07', 'http://172.21.107.193/dashboard/permissions/view_permission/13', 18, 3, '2024-02-16 12:48:07', '2024-02-16 12:48:07'),
(260, 'El usuario Jhan Carlos Cordoba ha solicitado un permiso', '16/02/2024 09:00:57', 'http://172.21.107.193/dashboard/permissions/view_permission/14', 2, 3, '2024-02-16 14:00:57', '2024-02-16 14:00:57'),
(261, 'El jefe de area Sebastian Hinestroza ha aprobado su permiso :) ', '16/02/2024 09:02:25', 'http://172.21.107.193/dashboard/permissions/view_permission/14', 1, 3, '2024-02-16 14:02:25', '2024-02-16 14:02:25'),
(262, 'El usuario Jhan Carlos Cordoba ha salido de la instalaciones con permiso', '16/02/2024 09:07:06', 'http://172.21.107.193/dashboard/permissions/view_permission/14', 18, 3, '2024-02-16 14:07:06', '2024-02-16 14:07:06'),
(263, 'El usuario Jhan Carlos Cordoba ha regresado a las instalaciones con permiso', '16/02/2024 09:16:09', 'http://172.21.107.193/dashboard/permissions/view_permission/14', 18, 3, '2024-02-16 14:16:09', '2024-02-16 14:16:09'),
(264, 'El usuario Jhan Carlos Cordoba ha solicitado un permiso', '16/02/2024 09:32:16', 'http://172.21.107.193/dashboard/permissions/view_permission/15', 2, 3, '2024-02-16 14:32:16', '2024-02-16 14:32:16'),
(265, 'El jefe de area Sebastian Hinestroza ha aprobado su permiso :) ', '16/02/2024 09:33:25', 'http://172.21.107.193/dashboard/permissions/view_permission/15', 1, 3, '2024-02-16 14:33:25', '2024-02-16 14:33:25'),
(266, 'El usuario Jhan Carlos Cordoba ha salido de la instalaciones con permiso', '16/02/2024 09:38:51', 'http://172.21.107.193/dashboard/permissions/view_permission/15', 18, 3, '2024-02-16 14:38:51', '2024-02-16 14:38:51'),
(267, 'El usuario Jhan Carlos Cordoba ha regresado a las instalaciones con permiso', '16/02/2024 09:45:11', 'http://172.21.107.193/dashboard/permissions/view_permission/15', 18, 3, '2024-02-16 14:45:11', '2024-02-16 14:45:11'),
(268, 'El usuario Leonardo Dagua ha solicitado un permiso', '16/02/2024 11:16:22', 'http://172.21.107.193/dashboard/permissions/view_permission/16', 1, 3, '2024-02-16 16:16:22', '2024-02-16 16:16:22'),
(269, 'El usuario Leonardo Dagua ha solicitado un permiso', '16/02/2024 11:17:06', 'http://172.21.107.193/dashboard/permissions/view_permission/17', 1, 3, '2024-02-16 16:17:06', '2024-02-16 16:17:06'),
(270, 'El usuario Leonardo Dagua ha solicitado un permiso', '16/02/2024 11:17:28', 'http://172.21.107.193/dashboard/permissions/view_permission/18', 1, 3, '2024-02-16 16:17:28', '2024-02-16 16:17:28'),
(271, 'El usuario Leonardo Dagua ha solicitado un permiso', '16/02/2024 11:18:19', 'http://172.21.107.193/dashboard/permissions/view_permission/19', 1, 3, '2024-02-16 16:18:19', '2024-02-16 16:18:19'),
(272, 'El usuario Leonardo Dagua ha solicitado un permiso', '16/02/2024 11:18:37', 'http://172.21.107.193/dashboard/permissions/view_permission/20', 1, 3, '2024-02-16 16:18:37', '2024-02-16 16:18:37'),
(273, 'El jefe de area Sebastian Hinestroza ha aprobado su permiso :) ', '16/02/2024 11:20:53', 'http://172.21.107.193/dashboard/permissions/view_permission/16', 17, 4, '2024-02-16 21:21:06', '2024-02-16 16:20:53'),
(274, 'El usuario Leonardo Dagua ha salido de la instalaciones con permiso', '16/02/2024 11:27:11', 'http://172.21.107.193/dashboard/permissions/view_permission/16', 18, 3, '2024-02-16 16:27:11', '2024-02-16 16:27:11'),
(275, 'El usuario Leonardo Dagua ha regresado a las instalaciones con permiso', '16/02/2024 11:52:15', 'http://172.21.107.193/dashboard/permissions/view_permission/16', 18, 3, '2024-02-16 16:52:15', '2024-02-16 16:52:15'),
(276, 'El usuario Leonardo Dagua ha solicitado un permiso', '16/02/2024 12:03:39', 'http://172.21.107.193/dashboard/permissions/view_permission/21', 1, 3, '2024-02-16 17:03:39', '2024-02-16 17:03:39'),
(277, 'El usuario Leonardo Dagua ha solicitado un permiso', '16/02/2024 12:03:54', 'http://172.21.107.193/dashboard/permissions/view_permission/21', 2, 3, '2024-02-16 17:03:54', '2024-02-16 17:03:54'),
(278, 'Tienes un nuevo comentario en ticket', '16/02/2024 14:03:16', 'http://172.21.107.193/dashboard/tickets/ticket_detail/73', 19, 3, '2024-02-16 19:03:16', '2024-02-16 19:03:16'),
(279, 'Se ha creado un nuevo ticket para ti', '16/02/2024 15:58:44', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 1, 4, '2024-02-17 02:00:25', '2024-02-16 20:58:44'),
(280, 'Su ticket ha sido VISTO y esta previo a ejecución', '16/02/2024 16:00:27', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 17, 4, '2024-02-17 02:02:41', '2024-02-16 21:00:27'),
(281, 'Tienes un nuevo comentario en ticket', '16/02/2024 16:00:47', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 17, 4, '2024-02-17 02:32:24', '2024-02-16 21:00:47'),
(282, 'Su ticket ha sido ejecutado', '16/02/2024 16:03:43', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 17, 4, '2024-02-17 02:32:33', '2024-02-16 21:03:43'),
(283, 'El ticket ha sido modificado', '16/02/2024 16:05:57', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 1, 4, '2024-02-17 02:16:28', '2024-02-16 21:05:57'),
(284, 'El usuario Jhan Carlos Cordoba esta esperando la finalizacion del ticket #74', '16/02/2024 16:06:37', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 17, 4, '2024-02-17 02:32:41', '2024-02-16 21:06:37'),
(285, 'El usuario Jhan Carlos Cordoba esta esperando la finalizacion del ticket #74', '16/02/2024 16:16:42', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 17, 4, '2024-02-17 02:32:48', '2024-02-16 21:16:42'),
(286, 'Su ticket ha sido cerrado con exito!', '16/02/2024 16:32:06', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 1, 3, '2024-02-16 21:32:06', '2024-02-16 21:32:06'),
(287, 'El ticket impuesto para ti ha sido re abierto!', '16/02/2024 16:40:01', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 1, 3, '2024-02-16 21:40:01', '2024-02-16 21:40:01'),
(288, 'Su ticket ha sido VISTO y esta previo a ejecución', '16/02/2024 16:40:27', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 17, 3, '2024-02-16 21:40:27', '2024-02-16 21:40:27'),
(289, 'El ticket impuesto para ti ha sido eliminado!', '16/02/2024 16:41:11', 'http://172.21.107.193/dashboard/tickets/ticket_detail/74', 1, 3, '2024-02-16 21:41:11', '2024-02-16 21:41:11'),
(290, 'El usuario Jhan Carlos Cordoba ha solicitado un permiso', '17/02/2024 09:49:50', 'http://172.21.107.193/dashboard/permissions/view_permission/22', 2, 3, '2024-02-17 14:49:50', '2024-02-17 14:49:50'),
(291, 'El jefe de area Sebastian Hinestroza ha aprobado su permiso :) ', '17/02/2024 09:51:32', 'http://172.21.107.193/dashboard/permissions/view_permission/22', 1, 3, '2024-02-17 14:51:32', '2024-02-17 14:51:32'),
(292, 'El jefe de area Sebastian Hinestroza ha aprobado su permiso :) ', '17/02/2024 09:51:51', 'http://172.21.107.193/dashboard/permissions/view_permission/22', 1, 3, '2024-02-17 14:51:51', '2024-02-17 14:51:51'),
(293, 'El usuario Jhan Carlos Cordoba ha salido de la instalaciones con permiso', '17/02/2024 09:57:05', 'http://172.21.107.193/dashboard/permissions/view_permission/22', 18, 3, '2024-02-17 14:57:05', '2024-02-17 14:57:05'),
(294, 'El usuario Jhan Carlos Cordoba ha regresado a las instalaciones con permiso', '17/02/2024 10:15:16', 'http://172.21.107.193/dashboard/permissions/view_permission/22', 18, 3, '2024-02-17 15:15:16', '2024-02-17 15:15:16');

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
  `description` varchar(4) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `id_company` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `description`, `name`, `id_company`, `id_state`, `updated_at`, `created_at`) VALUES
(1, 'EFE', 'EFECTIVO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(2, 'CHE', 'CHEQUE', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(3, 'CHD', 'CHEQUE DEVUELTO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(4, 'TC ', 'TARJETA CREDITO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(5, 'TD ', 'TARJETA DEBITO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(6, 'CG1', 'CONSIGNACION', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(7, 'CHP', 'CHEQUES POSFECHADO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(8, '*1 ', 'ANTICIPO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(9, '*2 ', 'GIFT CARD', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(10, 'AJU', 'AJUSTE', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(11, 'TCA', 'AMEX CREDITO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(12, 'TCD', 'CREDITO DINERS', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(13, 'TCM', 'CREDITO MASTER', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(14, 'TCV', 'CREDITO VISA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(15, 'TDM', 'DEBITO MAESTRO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(16, 'TDV', 'DEBITO VISA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(17, 'TNS', 'TRANSFERENCIA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(18, 'BBP', 'BONO BIG PASS PAPEL', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(19, 'TP ', 'TARJETAS DE CREDITO PRIVADAS', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(20, 'TPC', 'CREDITEMPLO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(21, 'TPE', 'EXITO \"LA TUYA\"', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(22, 'TPL', 'LA 14 \"GIROS & FIN.\"', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(23, 'TPU', 'CREDI-UNO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(24, 'BN ', 'BONOS', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(25, 'CRE', 'CREDITO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(26, 'TPA', 'ALKOSTO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(27, 'SCR', 'SISTECREDITO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(28, 'BGO', 'BRILLA GASES OCCIDENTE', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(29, 'PEL', 'PAGO EN LINEA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(30, 'CBC', 'CATALOGO BANCOLOMBIA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(31, 'CBO', 'CATALOGO OCCIDENTE', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(32, 'CBD', 'CATALOGO DAVIVIENDA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(33, 'CCE', 'CONTRAENTREGA TIENDA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(34, 'CBB', 'CATALOGO BOGOTA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(35, 'COO', 'COORDINADORA CONTRAENTREGA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(36, 'SER', 'SERVIENTREGA CONTRAENTREGA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(37, 'VAL', 'VALIENTA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(38, 'BBE', 'BONO BIG PASS ELECTRONICO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(39, 'BSE', 'BONO SODEXO ELECTRONICO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(40, 'BSP', 'BONO SODEXO PAPEL', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(41, 'SOC', 'BONO RETIRO SOCIOS', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(42, 'BIL', 'BILLETE DE DESCUENTO CLIENTE', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(43, 'OB ', 'OBSEQUIOS', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(44, 'OBC', 'OBSEQUIOS CLIENTES', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(45, 'OBE', 'OBSEQUIOS EMPLEADOS', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(46, 'REG', 'TARJETA REGALO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(47, 'PAY', 'PAYU - ECOMMERCE', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(48, 'MER', 'MERCADO LIBRE', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(49, 'KUP', 'KUPI', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(50, 'ASC', 'ASCOMY YUMBO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(51, 'MPA', 'MERCADOPAGO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(52, 'MCP', 'MERCADO PAGO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(53, 'OBS', 'OBSEQUIOS SOCIO ESTRATEGICO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(54, 'OT ', 'OTRAS FORMAS DE PAGO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(55, 'CGS', 'CONSIG. SISTECREDITO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(56, 'CGB', 'CONSIG. BRILLA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(57, 'XAC', 'X-ACA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(58, 'BDT', 'BONO DOTACION', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(59, 'DAM', 'DOTACION ADMINISTRACION', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(60, 'DVT', 'DOTACION VENTAS', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(61, 'TI ', 'TARJETA INSTITUCIONAL', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(62, 'RAP', 'RAPPI', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(63, 'EXI', 'MARKETPLACE EXITO', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(64, 'DRO', 'DROPSHIPPING DROPI', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(65, 'ADD', 'ADDI', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(66, 'DSI', 'DESCUENTO DIA SIN IVA', 1, 1, '2024-02-21 01:58:25', '2024-02-21 01:58:25'),
(67, 'EFE', 'EFECTIVO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(68, 'CHE', 'CHEQUE', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(69, 'CHD', 'CHEQUE DEVUELTO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(70, 'TC ', 'TARJETA CREDITO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(71, 'TD ', 'TARJETA DEBITO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(72, 'CHP', 'CHEQUES POSFECHADO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(73, '*1 ', 'NO USAR', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(74, '*2 ', 'GIFT CARD', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(75, 'TCA', 'TARJETA DE CREDITO AMERICAN EXPRESS', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(76, 'TCD', 'TARJETA DE CREDITO DINNERS', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(77, 'TCM', 'TARJETA DE CREDITO MASTER CARD', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(78, 'TCV', 'TARJETA DE CREDITO VISA', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(79, 'TDM', 'TARJETA DEBITO MAESTRO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(80, 'TDV', 'TARJETA DEBITO VISA', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(81, 'TNS', 'TRANSFERENCIA', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(82, 'CG1', 'CONSIGNACIONES', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(83, 'BIL', 'BILLETE DE DESCUENTO CLIENTES', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(84, 'SRC', 'SISTECREDITO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(85, 'OBC', 'OBSEQUIOS CLIENTES', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(86, 'OBE', 'OBSEQUIOS EMPLEADOS', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(87, 'TPC', 'TARJETA DE CREDITO PRIVADA CODENSA', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(88, 'COO', 'COORDINADORA CONTRAENTREGA', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(89, 'B  ', 'BONOS', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(90, 'BBE', 'BONO BIGPASS ELECTRONICO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(91, 'BBP', 'BONO BIGPASS PAPEL', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(92, 'BSE', 'BONO SODEXO ELECTRONICO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(93, 'BSP', 'BONO SODEXO PAPEL', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(94, 'TR ', 'TARJETA REGALO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(95, 'BRS', 'BONO RETIRO SOCIOS', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(96, 'TP ', 'TARJETA PRIVADA DE CREDITO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(97, 'TPE', 'TARJETA DE CREDITO PRIVADA EXITO TUYA SA', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(98, 'CBC', 'CATALOGO BANCOLOMBIA', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(99, 'CCE', 'CONTRAENTREGA', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(100, 'CS ', 'CONSIGNACION SISTECREDITO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(101, 'BDE', 'BONO DOTACION EMPLEADOS', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(102, 'TIT', 'TARJETA INSTITUCIONAL TEMPLO', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(103, 'TI ', 'TARJETA INSTITUCIONAL', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21'),
(104, 'DSI', 'DESCUENTO DIA SIN IVA', 2, 1, '2024-02-21 01:59:21', '2024-02-21 01:59:21');

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
(1, '30/01/2024 16:14:59', '0', '30/01/2024 17:20:54', '30/01/2024 17:27:24', 10, 1, 23, 'n/A', 1, 1, 10, '2024-01-31 03:29:46', '2024-01-31 02:15:49'),
(2, '15/02/2024 11:22:25', '0', '15/02/2024 11:51:42', '15/02/2024 12:32:14', 1, 13, 26, 'Salida por computadores de netgroup', 4, 2, 10, '2024-02-15 22:32:24', '2024-02-15 21:22:49'),
(3, '15/02/2024 11:24:34', '0', '15/02/2024 11:51:24', '15/02/2024 12:31:54', 18, 13, 26, 'Reclamo de equipo netgroup', 4, 2, 10, '2024-02-15 22:31:59', '2024-02-15 21:25:01'),
(4, '15/02/2024 14:12:37', '0', NULL, NULL, 1, NULL, NULL, 'N/A', 1, 2, 2, '2024-02-16 00:13:54', '2024-02-16 00:12:47'),
(5, '15/02/2024 14:15:00', '0', NULL, NULL, 1, NULL, NULL, 'N/a', 1, 2, 2, '2024-02-16 00:16:13', '2024-02-16 00:15:17'),
(6, '15/02/2024 14:19:01', '0', NULL, NULL, 1, 18, NULL, 'N/A', 1, 2, 2, '2024-02-16 00:21:42', '2024-02-16 00:19:10'),
(7, '15/02/2024 14:22:54', '0', NULL, NULL, 18, NULL, NULL, 'SALIDA BANCO', 1, 2, 2, '2024-02-16 00:29:37', '2024-02-16 00:23:15'),
(8, '15/02/2024 14:30:16', '0', NULL, NULL, 1, NULL, NULL, 'n/a', 1, 1, 2, '2024-02-16 03:08:14', '2024-02-16 00:30:24'),
(9, '15/02/2024 14:34:15', '0', NULL, NULL, 18, NULL, NULL, 'PRUEBA', 1, 2, 3, '2024-02-16 00:34:41', '2024-02-16 00:34:41'),
(10, '15/02/2024 14:59:55', '16/02/2024 18:03:00', NULL, NULL, 17, NULL, NULL, 'qasdasdasd', 1, 2, 2, '2024-02-16 01:01:19', '2024-02-16 01:00:33'),
(11, '15/02/2024 15:01:39', '0', NULL, NULL, 18, NULL, NULL, 'bank attack', 1, 2, 3, '2024-02-16 01:01:56', '2024-02-16 01:01:56'),
(12, '15/02/2024 15:01:39', '0', NULL, NULL, 18, NULL, NULL, 'bank attack', 1, 2, 3, '2024-02-16 01:08:23', '2024-02-16 01:08:23'),
(13, '15/02/2024 17:10:30', '16/02/2024 07:45:00', NULL, '16/02/2024 07:47:48', 1, 18, 26, 'Salida por diligencias personales. NO volvería a las instalaciones de nuevo', 1, 2, 10, '2024-02-16 17:48:07', '2024-02-16 03:12:31'),
(14, '16/02/2024 09:00:36', '0', '16/02/2024 09:06:57', '16/02/2024 09:07:45', 1, 18, 26, 'Salida a TEMPLO 2 por validacion de internet', 4, 2, 10, '2024-02-16 19:16:09', '2024-02-16 19:00:57'),
(15, '16/02/2024 09:31:41', '0', '16/02/2024 09:38:43', '16/02/2024 09:39:25', 1, 18, 26, 'Salida por multipuertos de TEMPLO 2', 4, 1, 10, '2024-02-16 19:45:11', '2024-02-16 19:32:16'),
(16, '16/02/2024 11:15:36', '0', '16/02/2024 11:27:03', '16/02/2024 11:27:51', 17, 18, 26, 'salida a cotización de cable utp', 4, 2, 10, '2024-02-16 21:52:15', '2024-02-16 21:16:22'),
(17, '16/02/2024 11:15:36', '0', NULL, NULL, 17, NULL, NULL, 'salida a cotización de cable utp', 4, 2, 2, '2024-02-16 21:20:07', '2024-02-16 21:17:06'),
(18, '16/02/2024 11:15:36', '0', NULL, NULL, 17, NULL, NULL, 'salida a cotización de cable utp', 4, 2, 2, '2024-02-16 21:19:46', '2024-02-16 21:17:28'),
(19, '16/02/2024 11:15:36', '0', NULL, NULL, 17, NULL, NULL, 'salida a cotización de cable utp', 4, 2, 2, '2024-02-16 21:19:24', '2024-02-16 21:18:19'),
(20, '16/02/2024 11:15:36', '0', NULL, NULL, 17, NULL, NULL, 'salida a cotización de cable utp', 4, 2, 2, '2024-02-16 21:19:02', '2024-02-16 21:18:37'),
(21, '16/02/2024 12:03:04', '0', NULL, NULL, 17, NULL, NULL, 'salida a cotización de cable de red', 4, 2, 2, '2024-02-17 00:49:49', '2024-02-16 22:03:39'),
(22, '17/02/2024 09:49:30', '0', '17/02/2024 09:57:02', '17/02/2024 10:15:02', 1, 18, 26, 'SALIDA A TEMPLO 2 POR VALIDACION DE INTERNET DE EQUIPO', 4, 2, 10, '2024-02-17 20:15:16', '2024-02-17 19:49:49');

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
(9, 'portatil', 'hp', '86857', NULL, 'n/a', 2, 1, 1, 1, 19, '2024-02-19 21:00:55', '2024-02-15 03:00:11'),
(10, 'cargador', 'hp', 'a9825', NULL, 'n/a', 2, 1, 2, 1, 19, '2024-02-19 21:00:55', '2024-02-15 03:03:17'),
(11, 'PORTÁTIL', 'Hp', '87243', NULL, 'N/a', 2, 1, 2, 1, 1, '2024-02-19 21:00:55', '2024-02-15 03:03:58'),
(12, 'CARGADOR PORTÁTIL', 'HP', 'A22975', NULL, 'N/a', 1, 1, 2, 1, 1, '2024-02-19 21:00:55', '2024-02-15 03:05:22'),
(13, 'MOUSE', 'LENOVO', 'TDM926186', NULL, 'N/a', 1, 1, 2, 1, 1, '2024-02-19 21:00:55', '2024-02-15 03:06:11'),
(14, 'mouse', 'hp', 'TDM252674', NULL, 'n/a', 1, 1, 2, 1, 19, '2024-02-19 21:00:55', '2024-02-15 03:08:15');

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
INSERT INTO `reports` (`id`, `description`, `id_user`, `id_report_detail`, `date`, `updated_at`, `created_at`) VALUES
(1227, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 08:37:03', '2024-02-14 13:37:03', '2024-02-14 13:37:03'),
(1228, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 08:37:31', '2024-02-14 13:37:31', '2024-02-14 13:37:31'),
(1229, 'Se han modificado los datos del usuario jccq12@gmail.com', 2, 2, '14/02/2024 08:37:46', '2024-02-14 13:37:46', '2024-02-14 13:37:46'),
(1230, 'El usuario Leonardo Dagua con correo sistemasaux11@eltemplodelamoda.com.co ha ingresado al sistema', 19, 8, '14/02/2024 08:40:21', '2024-02-14 13:40:21', '2024-02-14 13:40:21'),
(1231, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '14/02/2024 08:46:04', '2024-02-14 13:46:04', '2024-02-14 13:46:04'),
(1232, 'El usuario sistemasaux11@eltemplodelamoda.com.co creo un ticket llamado ntc', 19, 4, '14/02/2024 08:47:00', '2024-02-14 13:47:00', '2024-02-14 13:47:00'),
(1233, 'El usuario sistemasaux2@eltemplodelamoda.com.co ha visto el ticket con id 64', 18, 7, '14/02/2024 08:47:24', '2024-02-14 13:47:24', '2024-02-14 13:47:24'),
(1234, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 08:53:15', '2024-02-14 13:53:15', '2024-02-14 13:53:15'),
(1235, 'Se ha editado el ticket con ID 64', 1, 7, '14/02/2024 08:55:28', '2024-02-14 13:55:28', '2024-02-14 13:55:28'),
(1236, 'El usuario sistemasaux11@eltemplodelamoda.com.co creo un ticket llamado contestar correo don Julián Guarnizo', 19, 4, '14/02/2024 09:10:33', '2024-02-14 14:10:33', '2024-02-14 14:10:33'),
(1237, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 09:10:46', '2024-02-14 14:10:46', '2024-02-14 14:10:46'),
(1238, 'El usuario jccq12@gmail.com ha visto el ticket con id 65', 1, 7, '14/02/2024 09:10:52', '2024-02-14 14:10:52', '2024-02-14 14:10:52'),
(1239, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 65', 1, 7, '14/02/2024 09:11:20', '2024-02-14 14:11:20', '2024-02-14 14:11:20'),
(1240, 'Se ha editado el ticket con ID 65', 19, 7, '14/02/2024 09:13:30', '2024-02-14 14:13:30', '2024-02-14 14:13:30'),
(1241, 'El usuario sistemasaux11@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 65', 19, 7, '14/02/2024 09:17:31', '2024-02-14 14:17:31', '2024-02-14 14:17:31'),
(1242, 'El usuario jccq12@gmail.com creo un ticket llamado COTIZAR CONVERTIDOR VGA A HTDMI', 1, 4, '14/02/2024 09:19:05', '2024-02-14 14:19:05', '2024-02-14 14:19:05'),
(1243, 'El usuario sistemasaux11@eltemplodelamoda.com.co ha visto el ticket con id 66', 19, 7, '14/02/2024 09:19:29', '2024-02-14 14:19:29', '2024-02-14 14:19:29'),
(1244, 'El usuario sistemasaux11@eltemplodelamoda.com.co inicio la ejecución del ticket con id 66', 19, 7, '14/02/2024 09:23:20', '2024-02-14 14:23:20', '2024-02-14 14:23:20'),
(1245, 'El usuario jccq12@gmail.com creo un ticket llamado TERMINAR REUNION ZOOM DE HOY', 1, 4, '14/02/2024 09:26:37', '2024-02-14 14:26:37', '2024-02-14 14:26:37'),
(1246, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 64', 1, 7, '14/02/2024 09:27:39', '2024-02-14 14:27:39', '2024-02-14 14:27:39'),
(1247, 'El usuario sistemasaux2@eltemplodelamoda.com.co ha visto el ticket con id 67', 18, 7, '14/02/2024 09:29:58', '2024-02-14 14:29:58', '2024-02-14 14:29:58'),
(1248, 'El usuario sistemasaux2@eltemplodelamoda.com.co inicio la ejecución del ticket con id 67', 18, 7, '14/02/2024 09:34:36', '2024-02-14 14:34:36', '2024-02-14 14:34:36'),
(1249, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 67', 1, 7, '14/02/2024 09:34:47', '2024-02-14 14:34:47', '2024-02-14 14:34:47'),
(1250, 'Se ha agregado una calificacion de 3 estrellas para el ticket con ID 67', 1, 7, '14/02/2024 09:35:21', '2024-02-14 14:35:21', '2024-02-14 14:35:21'),
(1251, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 66', 1, 7, '14/02/2024 09:49:17', '2024-02-14 14:49:17', '2024-02-14 14:49:17'),
(1252, 'El usuario sistemasaux11@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 64', 19, 7, '14/02/2024 09:49:53', '2024-02-14 14:49:53', '2024-02-14 14:49:53'),
(1253, 'El usuario sistemasaux11@eltemplodelamoda.com.co creo un ticket llamado nota en siesa', 19, 4, '14/02/2024 10:31:33', '2024-02-14 15:31:33', '2024-02-14 15:31:33'),
(1254, 'El usuario sistemasaux11@eltemplodelamoda.com.co creo un ticket llamado cambiar contraseña', 19, 4, '14/02/2024 10:33:30', '2024-02-14 15:33:30', '2024-02-14 15:33:30'),
(1255, 'El usuario sistemasaux11@eltemplodelamoda.com.co ha visto el ticket con id 69', 19, 7, '14/02/2024 10:36:23', '2024-02-14 15:36:23', '2024-02-14 15:36:23'),
(1256, 'Se ha editado el ticket con ID 69', 19, 7, '14/02/2024 10:37:11', '2024-02-14 15:37:11', '2024-02-14 15:37:11'),
(1257, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 69', 1, 7, '14/02/2024 10:42:37', '2024-02-14 15:42:37', '2024-02-14 15:42:37'),
(1258, 'Se ha editado el ticket con ID 69', 1, 7, '14/02/2024 10:42:58', '2024-02-14 15:42:58', '2024-02-14 15:42:58'),
(1259, 'El usuario sistemasaux11@eltemplodelamoda.com.co ha visto el ticket con id 68', 19, 7, '14/02/2024 10:43:43', '2024-02-14 15:43:43', '2024-02-14 15:43:43'),
(1260, 'El usuario sistemasaux11@eltemplodelamoda.com.co ha eliminado el ticket con id 69', 19, 6, '14/02/2024 11:00:49', '2024-02-14 16:00:49', '2024-02-14 16:00:49'),
(1261, 'El usuario jccq12@gmail.com creo un ticket llamado SOLICITAR VISITA IMPRESORA', 1, 4, '14/02/2024 11:03:40', '2024-02-14 16:03:40', '2024-02-14 16:03:40'),
(1262, 'El usuario sistemasaux11@eltemplodelamoda.com.co ha visto el ticket con id 70', 19, 7, '14/02/2024 11:03:50', '2024-02-14 16:03:50', '2024-02-14 16:03:50'),
(1263, 'El usuario sistemasaux11@eltemplodelamoda.com.co inicio la ejecución del ticket con id 70', 19, 7, '14/02/2024 11:16:01', '2024-02-14 16:16:01', '2024-02-14 16:16:01'),
(1264, 'El usuario sistemasaux11@eltemplodelamoda.com.co creo un ticket llamado ntc', 19, 4, '14/02/2024 11:17:34', '2024-02-14 16:17:34', '2024-02-14 16:17:34'),
(1265, 'El usuario jccq12@gmail.com ha visto el ticket con id 71', 1, 7, '14/02/2024 11:17:46', '2024-02-14 16:17:46', '2024-02-14 16:17:46'),
(1266, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 71', 1, 7, '14/02/2024 11:18:01', '2024-02-14 16:18:01', '2024-02-14 16:18:01'),
(1267, 'El usuario sistemasaux11@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 71', 19, 7, '14/02/2024 11:19:27', '2024-02-14 16:19:27', '2024-02-14 16:19:27'),
(1268, 'Se ha editado el ticket con ID 68', 19, 7, '14/02/2024 11:31:55', '2024-02-14 16:31:55', '2024-02-14 16:31:55'),
(1269, 'Se ha editado el ticket con ID 68', 19, 7, '14/02/2024 11:33:32', '2024-02-14 16:33:32', '2024-02-14 16:33:32'),
(1270, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 11:42:31', '2024-02-14 16:42:31', '2024-02-14 16:42:31'),
(1271, 'Se han modificado los datos del usuario jccq12@gmail.com', 2, 2, '14/02/2024 11:42:47', '2024-02-14 16:42:47', '2024-02-14 16:42:47'),
(1272, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '14/02/2024 11:43:02', '2024-02-14 16:43:02', '2024-02-14 16:43:02'),
(1273, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 11:44:19', '2024-02-14 16:44:19', '2024-02-14 16:44:19'),
(1274, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 11:51:35', '2024-02-14 16:51:35', '2024-02-14 16:51:35'),
(1275, 'El usuario sistemasaux11@eltemplodelamoda.com.co ha eliminado el ticket con id 68', 19, 6, '14/02/2024 11:54:01', '2024-02-14 16:54:01', '2024-02-14 16:54:01'),
(1276, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 11:58:25', '2024-02-14 16:58:25', '2024-02-14 16:58:25'),
(1277, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 11:58:51', '2024-02-14 16:58:51', '2024-02-14 16:58:51'),
(1278, 'Se han modificado los datos del usuario jccq12@gmail.com', 2, 2, '14/02/2024 11:59:04', '2024-02-14 16:59:04', '2024-02-14 16:59:04'),
(1279, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 11:59:21', '2024-02-14 16:59:21', '2024-02-14 16:59:21'),
(1280, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 13:46:33', '2024-02-14 18:46:33', '2024-02-14 18:46:33'),
(1281, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 13:47:09', '2024-02-14 18:47:09', '2024-02-14 18:47:09'),
(1282, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 13:47:29', '2024-02-14 18:47:29', '2024-02-14 18:47:29'),
(1283, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 13:52:42', '2024-02-14 18:52:42', '2024-02-14 18:52:42'),
(1284, 'El usuario soporte@eltemplodelamoda.com.co ha cambiado el estado del usuario asistentetic@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 2, 3, '14/02/2024 13:52:52', '2024-02-14 18:52:52', '2024-02-14 18:52:52'),
(1285, 'El usuario Valeria Garcia con correo asistentetic@eltemplodelamoda.com.co ha ingresado al sistema', 25, 8, '14/02/2024 13:53:19', '2024-02-14 18:53:19', '2024-02-14 18:53:19'),
(1286, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '14/02/2024 14:00:03', '2024-02-14 19:00:03', '2024-02-14 19:00:03'),
(1287, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '14/02/2024 14:22:43', '2024-02-14 19:22:43', '2024-02-14 19:22:43'),
(1288, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 14:23:21', '2024-02-14 19:23:21', '2024-02-14 19:23:21'),
(1289, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 14:24:54', '2024-02-14 19:24:54', '2024-02-14 19:24:54'),
(1290, 'Se han modificado los datos del usuario jccq12@gmail.com', 2, 2, '14/02/2024 14:25:14', '2024-02-14 19:25:14', '2024-02-14 19:25:14'),
(1291, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 14:25:24', '2024-02-14 19:25:24', '2024-02-14 19:25:24'),
(1292, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 15:19:29', '2024-02-14 20:19:29', '2024-02-14 20:19:29'),
(1293, 'Se han modificado los datos del usuario jccq12@gmail.com', 2, 2, '14/02/2024 15:19:47', '2024-02-14 20:19:47', '2024-02-14 20:19:47'),
(1294, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 15:20:00', '2024-02-14 20:20:00', '2024-02-14 20:20:00'),
(1295, 'El usuario sistemasaux11@eltemplodelamoda.com.co creo un ticket llamado cambiar clave de usuarios remotos', 19, 4, '14/02/2024 15:22:19', '2024-02-14 20:22:19', '2024-02-14 20:22:19'),
(1296, 'El usuario jccq12@gmail.com ha visto el ticket con id 72', 1, 7, '14/02/2024 15:22:30', '2024-02-14 20:22:30', '2024-02-14 20:22:30'),
(1297, 'El usuario jccq12@gmail.com inicio la ejecución del ticket con id 72', 1, 7, '14/02/2024 15:26:41', '2024-02-14 20:26:41', '2024-02-14 20:26:41'),
(1298, 'Se ha editado el ticket con ID 72', 1, 7, '14/02/2024 15:29:18', '2024-02-14 20:29:18', '2024-02-14 20:29:18'),
(1299, 'El usuario sistemasaux11@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 72', 19, 7, '14/02/2024 15:36:15', '2024-02-14 20:36:15', '2024-02-14 20:36:15'),
(1300, 'El usuario jccq12@gmail.com creo un ticket llamado REVISAR LLAVE VPN', 1, 4, '14/02/2024 16:11:04', '2024-02-14 21:11:04', '2024-02-14 21:11:04'),
(1301, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '14/02/2024 16:16:10', '2024-02-14 21:16:10', '2024-02-14 21:16:10'),
(1302, 'El usuario sistemasaux11@eltemplodelamoda.com.co ha visto el ticket con id 73', 19, 7, '14/02/2024 16:16:31', '2024-02-14 21:16:31', '2024-02-14 21:16:31'),
(1303, 'El usuario sistemasaux11@eltemplodelamoda.com.co inicio la ejecución del ticket con id 73', 19, 7, '14/02/2024 16:16:57', '2024-02-14 21:16:57', '2024-02-14 21:16:57'),
(1304, 'El usuario Leonardo Dagua con correo sistemasaux11@eltemplodelamoda.com.co ha ingresado al sistema', 19, 8, '14/02/2024 16:44:35', '2024-02-14 21:44:35', '2024-02-14 21:44:35'),
(1305, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '14/02/2024 16:49:18', '2024-02-14 21:49:18', '2024-02-14 21:49:18'),
(1306, 'El usuario soporte@eltemplodelamoda.com.co ha cambiado el estado del usuario recepciontdm@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 2, 3, '14/02/2024 16:49:32', '2024-02-14 21:49:32', '2024-02-14 21:49:32'),
(1307, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '14/02/2024 16:50:01', '2024-02-14 21:50:01', '2024-02-14 21:50:01'),
(1308, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '14/02/2024 16:57:32', '2024-02-14 21:57:32', '2024-02-14 21:57:32'),
(1309, 'El usuario Leonardo Dagua ha creado un producto con la siguiente serial 86857', 19, 18, '14/02/2024 17:00:11', '2024-02-14 22:00:11', '2024-02-14 22:00:11'),
(1310, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '14/02/2024 17:02:05', '2024-02-14 22:02:05', '2024-02-14 22:02:05'),
(1311, 'El usuario Leonardo Dagua ha creado un producto con la siguiente serial a9825', 19, 18, '14/02/2024 17:03:17', '2024-02-14 22:03:17', '2024-02-14 22:03:17'),
(1312, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial 87243', 1, 18, '14/02/2024 17:03:58', '2024-02-14 22:03:58', '2024-02-14 22:03:58'),
(1313, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial A22975', 1, 18, '14/02/2024 17:05:22', '2024-02-14 22:05:22', '2024-02-14 22:05:22'),
(1314, 'El usuario Jhan Carlos Cordoba ha creado un producto con la siguiente serial TDM926186', 1, 18, '14/02/2024 17:06:11', '2024-02-14 22:06:11', '2024-02-14 22:06:11'),
(1315, 'El usuario Leonardo Dagua ha creado un producto con la siguiente serial TDM252674', 19, 18, '14/02/2024 17:08:15', '2024-02-14 22:08:15', '2024-02-14 22:08:15'),
(1316, 'El usuario Leonardo Dagua ha creado un acta para Sebastian Hinestroza para la siguiente dirección oficinas de NETGROUP', 19, 17, '14/02/2024 17:12:40', '2024-02-14 22:12:40', '2024-02-14 22:12:40'),
(1317, 'El usuario Leonardo Dagua ha Despachado los componentes asignados al acta con ID 27 para Sebastian Hinestroza para la siguiente dirección oficinas de NETGROUP', 19, 17, '14/02/2024 17:15:20', '2024-02-14 22:15:20', '2024-02-14 22:15:20'),
(1318, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '14/02/2024 17:17:00', '2024-02-14 22:17:00', '2024-02-14 22:17:00'),
(1319, 'El usuario Leonardo Dagua ha recibido los componentes asignados al acta con ID 27 para la siguiente dirección oficinas de NETGROUP', 18, 17, '14/02/2024 17:18:44', '2024-02-14 22:18:44', '2024-02-14 22:18:44'),
(1320, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '14/02/2024 17:22:03', '2024-02-14 22:22:03', '2024-02-14 22:22:03'),
(1321, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/02/2024 08:09:47', '2024-02-15 13:09:47', '2024-02-15 13:09:47'),
(1322, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '15/02/2024 08:19:51', '2024-02-15 13:19:51', '2024-02-15 13:19:51'),
(1323, 'El usuario Leonardo Dagua con correo sistemasaux11@eltemplodelamoda.com.co ha ingresado al sistema', 19, 8, '15/02/2024 08:27:19', '2024-02-15 13:27:19', '2024-02-15 13:27:19'),
(1324, 'El usuario jccq12@gmail.com finalizo la ejecución del ticket con id 73', 1, 7, '15/02/2024 08:46:44', '2024-02-15 13:46:44', '2024-02-15 13:46:44'),
(1325, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/02/2024 09:20:51', '2024-02-15 14:20:51', '2024-02-15 14:20:51'),
(1326, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/02/2024 10:34:47', '2024-02-15 15:34:47', '2024-02-15 15:34:47'),
(1327, 'El usuario jccq12@gmail.com ha cambiado el estado del usuario sistemasaux11@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 1, 3, '15/02/2024 10:36:17', '2024-02-15 15:36:17', '2024-02-15 15:36:17'),
(1328, 'Se han modificado los datos del usuario sistemasaux11@eltemplodelamoda.com.co', 1, 2, '15/02/2024 10:36:52', '2024-02-15 15:36:52', '2024-02-15 15:36:52'),
(1329, 'Se han modificado los datos del usuario sistemasaux6@eltemplodelamoda.com.co', 1, 2, '15/02/2024 10:37:41', '2024-02-15 15:37:41', '2024-02-15 15:37:41'),
(1330, 'El usuario jccq12@gmail.com ha cambiado el estado del usuario sistemasaux6@eltemplodelamoda.com.co a ACTIVO O ELIMINADO', 1, 3, '15/02/2024 10:38:04', '2024-02-15 15:38:04', '2024-02-15 15:38:04'),
(1331, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/02/2024 10:38:40', '2024-02-15 15:38:40', '2024-02-15 15:38:40'),
(1332, 'Se han modificado los datos del usuario jccq12@gmail.com', 1, 2, '15/02/2024 11:19:38', '2024-02-15 16:19:38', '2024-02-15 16:19:38'),
(1333, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '15/02/2024 11:20:04', '2024-02-15 16:20:04', '2024-02-15 16:20:04'),
(1334, 'El usuario Jhan Carlos Cordoba con correo jccq12@gmail.com ha ingresado al sistema', 1, 8, '15/02/2024 11:21:21', '2024-02-15 16:21:21', '2024-02-15 16:21:21'),
(1335, 'Ha generado un permiso por/para Salida por computadores de netgroup', 1, 9, '15/02/2024 11:22:55', '2024-02-15 16:22:55', '2024-02-15 16:22:55'),
(1336, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '15/02/2024 11:23:31', '2024-02-15 16:23:31', '2024-02-15 16:23:31'),
(1337, 'Ha generado un permiso por/para Reclamo de equipo netgroup', 18, 9, '15/02/2024 11:25:03', '2024-02-15 16:25:03', '2024-02-15 16:25:03'),
(1338, 'Se han modificado los datos del usuario sistemasaux2@eltemplodelamoda.com.co', 18, 2, '15/02/2024 11:25:33', '2024-02-15 16:25:33', '2024-02-15 16:25:33'),
(1339, 'El usuario Rodrigo Rodallega con correo csoporte@eltemplodelamoda.com.co ha ingresado al sistema', 13, 8, '15/02/2024 11:28:48', '2024-02-15 16:28:48', '2024-02-15 16:28:48'),
(1340, 'El jefe Rodrigo Rodallega ha aprobado el permiso del colaborador Jhan Carlos Cordoba ', 13, 9, '15/02/2024 11:29:27', '2024-02-15 16:29:27', '2024-02-15 16:29:27'),
(1341, 'El jefe Rodrigo Rodallega ha aprobado el permiso del colaborador Sebastian Hinestroza ', 13, 9, '15/02/2024 11:30:10', '2024-02-15 16:30:10', '2024-02-15 16:30:10'),
(1342, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '15/02/2024 11:51:13', '2024-02-15 16:51:13', '2024-02-15 16:51:13'),
(1343, 'El recepcionista Recepcion TDM ha dado salida al colaborador Sebastian Hinestroza ', 26, 9, '15/02/2024 11:51:27', '2024-02-15 16:51:27', '2024-02-15 16:51:27'),
(1344, 'El recepcionista Recepcion TDM ha dado salida al colaborador Jhan Carlos Cordoba ', 26, 9, '15/02/2024 11:51:44', '2024-02-15 16:51:44', '2024-02-15 16:51:44'),
(1345, 'El recepcionista Recepcion TDM ha dado entrada al colaborador Sebastian Hinestroza ', 26, 9, '15/02/2024 12:31:59', '2024-02-15 17:31:59', '2024-02-15 17:31:59'),
(1346, 'El recepcionista Recepcion TDM ha dado entrada al colaborador Jhan Carlos Cordoba ', 26, 9, '15/02/2024 12:32:24', '2024-02-15 17:32:24', '2024-02-15 17:32:24'),
(1347, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '15/02/2024 14:03:37', '2024-02-15 19:03:37', '2024-02-15 19:03:37'),
(1348, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '15/02/2024 14:04:17', '2024-02-15 19:04:17', '2024-02-15 19:04:17'),
(1349, 'Se han modificado los datos del usuario sistemasaux2@eltemplodelamoda.com.co', 2, 2, '15/02/2024 14:08:40', '2024-02-15 19:08:40', '2024-02-15 19:08:40'),
(1350, 'Se han modificado los datos del usuario sistemasaux2@eltemplodelamoda.com.co', 2, 2, '15/02/2024 14:10:58', '2024-02-15 19:10:58', '2024-02-15 19:10:58'),
(1351, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '15/02/2024 14:11:57', '2024-02-15 19:11:57', '2024-02-15 19:11:57'),
(1352, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '15/02/2024 14:12:35', '2024-02-15 19:12:35', '2024-02-15 19:12:35'),
(1353, 'Ha generado un permiso por/para N/A', 1, 9, '15/02/2024 14:12:50', '2024-02-15 19:12:50', '2024-02-15 19:12:50'),
(1354, 'Ha generado un permiso por/para N/a', 1, 9, '15/02/2024 14:15:19', '2024-02-15 19:15:19', '2024-02-15 19:15:19'),
(1355, 'Ha generado un permiso por/para N/A', 1, 9, '15/02/2024 14:19:12', '2024-02-15 19:19:12', '2024-02-15 19:19:12'),
(1356, 'El jefe Sebastian Hinestroza ha aprobado el permiso del colaborador Jhan Carlos Cordoba ', 18, 9, '15/02/2024 14:21:25', '2024-02-15 19:21:25', '2024-02-15 19:21:25'),
(1357, 'Ha generado un permiso por/para SALIDA BANCO', 18, 9, '15/02/2024 14:23:19', '2024-02-15 19:23:19', '2024-02-15 19:23:19'),
(1358, 'Ha generado un permiso por/para n/a', 1, 9, '15/02/2024 14:30:26', '2024-02-15 19:30:26', '2024-02-15 19:30:26'),
(1359, 'Ha generado un permiso por/para PRUEBA', 18, 9, '15/02/2024 14:34:45', '2024-02-15 19:34:45', '2024-02-15 19:34:45'),
(1360, 'El usuario Leonardo Dagua con correo sistemasaux6@eltemplodelamoda.com.co ha ingresado al sistema', 17, 8, '15/02/2024 14:59:38', '2024-02-15 19:59:38', '2024-02-15 19:59:38'),
(1361, 'Ha generado un permiso por/para qasdasdasd', 17, 9, '15/02/2024 15:00:37', '2024-02-15 20:00:37', '2024-02-15 20:00:37'),
(1362, 'Ha generado un permiso por/para bank attack', 18, 9, '15/02/2024 15:08:27', '2024-02-15 20:08:27', '2024-02-15 20:08:27'),
(1363, 'El usuario Sebastian Hinestroza ha creado un acta para Jhan Carlos Cordoba para la siguiente dirección oficina administrativa', 18, 17, '15/02/2024 15:10:38', '2024-02-15 20:10:38', '2024-02-15 20:10:38'),
(1364, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '15/02/2024 15:14:15', '2024-02-15 20:14:15', '2024-02-15 20:14:15'),
(1365, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '15/02/2024 15:14:27', '2024-02-15 20:14:27', '2024-02-15 20:14:27'),
(1366, 'El usuario Sebastian Hinestroza ha Despachado los componentes asignados al acta con ID 28 para Jhan Carlos Cordoba para la siguiente dirección oficina administrativa', 18, 17, '15/02/2024 15:15:36', '2024-02-15 20:15:36', '2024-02-15 20:15:36'),
(1367, 'El usuario Sebastian Hinestroza ha Despachado los componentes asignados al acta con ID 28 para Jhan Carlos Cordoba para la siguiente dirección oficina administrativa', 18, 17, '15/02/2024 15:15:38', '2024-02-15 20:15:38', '2024-02-15 20:15:38'),
(1368, 'El usuario Sebastian Hinestroza ha recibido los componentes asignados al acta con ID 28 para la siguiente dirección oficina administrativa', 1, 17, '15/02/2024 15:18:16', '2024-02-15 20:18:16', '2024-02-15 20:18:16'),
(1369, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '15/02/2024 15:24:04', '2024-02-15 20:24:04', '2024-02-15 20:24:04'),
(1370, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '15/02/2024 16:18:41', '2024-02-15 21:18:41', '2024-02-15 21:18:41'),
(1371, 'El usuario Leonardo Dagua con correo sistemasaux6@eltemplodelamoda.com.co ha ingresado al sistema', 17, 8, '15/02/2024 17:08:12', '2024-02-15 22:08:12', '2024-02-15 22:08:12'),
(1372, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '15/02/2024 17:13:01', '2024-02-15 22:13:01', '2024-02-15 22:13:01'),
(1373, 'El jefe Sebastian Hinestroza ha aprobado el permiso del colaborador Jhan Carlos Cordoba ', 18, 9, '15/02/2024 17:13:23', '2024-02-15 22:13:23', '2024-02-15 22:13:23'),
(1374, 'El jefe Sebastian Hinestroza ha aprobado el permiso del colaborador Jhan Carlos Cordoba ', 18, 9, '15/02/2024 17:16:21', '2024-02-15 22:16:21', '2024-02-15 22:16:21'),
(1375, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '15/02/2024 17:20:19', '2024-02-15 22:20:19', '2024-02-15 22:20:19'),
(1376, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '16/02/2024 07:45:07', '2024-02-16 12:45:07', '2024-02-16 12:45:07'),
(1377, 'El recepcionista Recepcion TDM ha dado entrada al colaborador Jhan Carlos Cordoba ', 26, 9, '16/02/2024 07:48:08', '2024-02-16 12:48:08', '2024-02-16 12:48:08'),
(1378, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '16/02/2024 07:51:14', '2024-02-16 12:51:14', '2024-02-16 12:51:14'),
(1379, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '16/02/2024 07:52:06', '2024-02-16 12:52:06', '2024-02-16 12:52:06'),
(1380, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '16/02/2024 07:57:44', '2024-02-16 12:57:44', '2024-02-16 12:57:44'),
(1381, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '16/02/2024 09:02:12', '2024-02-16 14:02:12', '2024-02-16 14:02:12'),
(1382, 'El jefe Sebastian Hinestroza ha aprobado el permiso del colaborador Jhan Carlos Cordoba ', 18, 9, '16/02/2024 09:02:25', '2024-02-16 14:02:25', '2024-02-16 14:02:25'),
(1383, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '16/02/2024 09:05:48', '2024-02-16 14:05:48', '2024-02-16 14:05:48'),
(1384, 'El recepcionista Recepcion TDM ha dado salida al colaborador Jhan Carlos Cordoba ', 26, 9, '16/02/2024 09:07:06', '2024-02-16 14:07:06', '2024-02-16 14:07:06'),
(1385, 'El recepcionista Recepcion TDM ha dado entrada al colaborador Jhan Carlos Cordoba ', 26, 9, '16/02/2024 09:16:09', '2024-02-16 14:16:09', '2024-02-16 14:16:09'),
(1386, 'Ha generado un permiso por/para Salida por multipuertos de TEMPLO 2', 1, 9, '16/02/2024 09:32:30', '2024-02-16 14:32:30', '2024-02-16 14:32:30'),
(1387, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '16/02/2024 09:33:11', '2024-02-16 14:33:11', '2024-02-16 14:33:11'),
(1388, 'El jefe Sebastian Hinestroza ha aprobado el permiso del colaborador Jhan Carlos Cordoba ', 18, 9, '16/02/2024 09:33:25', '2024-02-16 14:33:25', '2024-02-16 14:33:25'),
(1389, 'El recepcionista Recepcion TDM ha dado salida al colaborador Jhan Carlos Cordoba ', 26, 9, '16/02/2024 09:38:51', '2024-02-16 14:38:51', '2024-02-16 14:38:51'),
(1390, 'El recepcionista Recepcion TDM ha dado entrada al colaborador Jhan Carlos Cordoba ', 26, 9, '16/02/2024 09:45:11', '2024-02-16 14:45:11', '2024-02-16 14:45:11'),
(1391, 'El usuario Leonardo Dagua con correo sistemasaux6@eltemplodelamoda.com.co ha ingresado al sistema', 17, 8, '16/02/2024 11:13:36', '2024-02-16 16:13:36', '2024-02-16 16:13:36'),
(1392, 'El jefe Sebastian Hinestroza ha aprobado el permiso del colaborador Leonardo Dagua ', 18, 9, '16/02/2024 11:20:53', '2024-02-16 16:20:53', '2024-02-16 16:20:53'),
(1393, 'El recepcionista Recepcion TDM ha dado salida al colaborador Leonardo Dagua ', 26, 9, '16/02/2024 11:27:11', '2024-02-16 16:27:11', '2024-02-16 16:27:11'),
(1394, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '16/02/2024 11:43:25', '2024-02-16 16:43:25', '2024-02-16 16:43:25'),
(1395, 'El recepcionista Recepcion TDM ha dado entrada al colaborador Leonardo Dagua ', 26, 9, '16/02/2024 11:52:15', '2024-02-16 16:52:15', '2024-02-16 16:52:15'),
(1396, 'Ha generado un permiso por/para salida a cotización de cable de red', 17, 9, '16/02/2024 12:03:55', '2024-02-16 17:03:55', '2024-02-16 17:03:55'),
(1397, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '16/02/2024 14:00:25', '2024-02-16 19:00:25', '2024-02-16 19:00:25'),
(1398, 'El usuario Jhan Carlos Cordoba ha cambiado los datos del producto con la siguiente serial TDM252674 con ID 14', 1, 18, '16/02/2024 14:02:34', '2024-02-16 19:02:34', '2024-02-16 19:02:34'),
(1399, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '16/02/2024 14:05:44', '2024-02-16 19:05:44', '2024-02-16 19:05:44'),
(1400, 'El usuario Leonardo Dagua con correo sistemasaux6@eltemplodelamoda.com.co ha ingresado al sistema', 17, 8, '16/02/2024 14:48:37', '2024-02-16 19:48:37', '2024-02-16 19:48:37'),
(1401, 'El usuario sistemasaux6@eltemplodelamoda.com.co creo un ticket llamado ntc', 17, 4, '16/02/2024 15:58:44', '2024-02-16 20:58:44', '2024-02-16 20:58:44'),
(1402, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '16/02/2024 16:00:13', '2024-02-16 21:00:13', '2024-02-16 21:00:13'),
(1403, 'El usuario sistemasaux9@eltemplodelamoda.com.co ha visto el ticket con id 74', 1, 7, '16/02/2024 16:00:25', '2024-02-16 21:00:25', '2024-02-16 21:00:25'),
(1404, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '16/02/2024 16:03:17', '2024-02-16 21:03:17', '2024-02-16 21:03:17'),
(1405, 'El usuario sistemasaux9@eltemplodelamoda.com.co inicio la ejecución del ticket con id 74', 1, 7, '16/02/2024 16:03:41', '2024-02-16 21:03:41', '2024-02-16 21:03:41'),
(1406, 'Se ha editado el ticket con ID 74', 1, 7, '16/02/2024 16:05:57', '2024-02-16 21:05:57', '2024-02-16 21:05:57'),
(1407, 'El usuario sistemasaux6@eltemplodelamoda.com.co finalizo la ejecución del ticket con id 74', 17, 7, '16/02/2024 16:31:49', '2024-02-16 21:31:49', '2024-02-16 21:31:49'),
(1408, 'El usuario sistemasaux6@eltemplodelamoda.com.co Re abrio el ticket con id 74', 17, 11, '16/02/2024 16:40:01', '2024-02-16 21:40:01', '2024-02-16 21:40:01'),
(1409, 'El usuario sistemasaux9@eltemplodelamoda.com.co ha visto el ticket con id 74', 1, 7, '16/02/2024 16:40:23', '2024-02-16 21:40:23', '2024-02-16 21:40:23'),
(1410, 'El usuario sistemasaux6@eltemplodelamoda.com.co ha eliminado el ticket con id 74', 17, 6, '16/02/2024 16:41:11', '2024-02-16 21:41:11', '2024-02-16 21:41:11'),
(1411, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '17/02/2024 09:48:47', '2024-02-17 14:48:47', '2024-02-17 14:48:47'),
(1412, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '17/02/2024 09:50:37', '2024-02-17 14:50:37', '2024-02-17 14:50:37'),
(1413, 'El jefe Sebastian Hinestroza ha aprobado el permiso del colaborador Jhan Carlos Cordoba ', 18, 9, '17/02/2024 09:51:32', '2024-02-17 14:51:32', '2024-02-17 14:51:32'),
(1414, 'El jefe Sebastian Hinestroza ha aprobado el permiso del colaborador Jhan Carlos Cordoba ', 18, 9, '17/02/2024 09:51:51', '2024-02-17 14:51:51', '2024-02-17 14:51:51'),
(1415, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '17/02/2024 09:56:00', '2024-02-17 14:56:00', '2024-02-17 14:56:00'),
(1416, 'El recepcionista Recepcion TDM ha dado salida al colaborador Jhan Carlos Cordoba ', 26, 9, '17/02/2024 09:57:05', '2024-02-17 14:57:05', '2024-02-17 14:57:05'),
(1417, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '17/02/2024 10:13:46', '2024-02-17 15:13:46', '2024-02-17 15:13:46'),
(1418, 'El recepcionista Recepcion TDM ha dado entrada al colaborador Jhan Carlos Cordoba ', 26, 9, '17/02/2024 10:15:16', '2024-02-17 15:15:16', '2024-02-17 15:15:16'),
(1419, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '17/02/2024 12:05:44', '2024-02-17 17:05:44', '2024-02-17 17:05:44'),
(1420, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '17/02/2024 12:22:27', '2024-02-17 17:22:27', '2024-02-17 17:22:27'),
(1421, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '19/02/2024 14:32:35', '2024-02-19 19:32:35', '2024-02-19 19:32:35'),
(1422, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '19/02/2024 14:34:17', '2024-02-19 19:34:17', '2024-02-19 19:34:17'),
(1423, 'Se ha creado el siguiente usuario contabilidad@eltemplodelamodafresca.com', 2, 1, '19/02/2024 14:38:20', '2024-02-19 19:38:20', '2024-02-19 19:38:20'),
(1424, 'Se han modificado los datos del usuario contabilidad@eltemplodelamodafresca.com', 2, 2, '19/02/2024 14:39:08', '2024-02-19 19:39:08', '2024-02-19 19:39:08'),
(1425, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '19/02/2024 14:42:44', '2024-02-19 19:42:44', '2024-02-19 19:42:44'),
(1426, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '19/02/2024 14:44:47', '2024-02-19 19:44:47', '2024-02-19 19:44:47'),
(1427, 'El usuario Beatriz Giraldo con correo contabilidad@eltemplodelamodafresca.com ha ingresado al sistema', 27, 8, '19/02/2024 14:48:07', '2024-02-19 19:48:07', '2024-02-19 19:48:07'),
(1428, 'El usuario Recepcion TDM con correo recepciontdm@eltemplodelamoda.com.co ha ingresado al sistema', 26, 8, '19/02/2024 15:59:52', '2024-02-19 20:59:52', '2024-02-19 20:59:52'),
(1429, 'El usuario Recepcion TDM ha Despachado los componentes asignados al acta con ID 29 para NETGROUP para la siguiente dirección Salida para las oficinas de NETGROPU', 26, 17, '19/02/2024 16:00:25', '2024-02-19 21:00:25', '2024-02-19 21:00:25'),
(1430, 'El usuario Jhan Carlos Cordoba ha recibido los componentes asignados al acta con ID 29 para la siguiente dirección Salida para las oficinas de NETGROPU', 26, 17, '19/02/2024 16:00:40', '2024-02-19 21:00:40', '2024-02-19 21:00:40'),
(1431, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '19/02/2024 17:31:20', '2024-02-19 22:31:20', '2024-02-19 22:31:20'),
(1432, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '19/02/2024 17:36:29', '2024-02-19 22:36:29', '2024-02-19 22:36:29'),
(1433, 'El usuario Valeria Garcia con correo asistentetic@eltemplodelamoda.com.co ha ingresado al sistema', 25, 8, '19/02/2024 17:37:44', '2024-02-19 22:37:44', '2024-02-19 22:37:44'),
(1434, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '20/02/2024 10:23:33', '2024-02-20 15:23:33', '2024-02-20 15:23:33'),
(1435, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '20/02/2024 10:23:59', '2024-02-20 15:23:59', '2024-02-20 15:23:59'),
(1436, 'Se ha creado el siguiente usuario auxiliar2@eltemplodelamodafresca.com', 2, 1, '20/02/2024 10:26:05', '2024-02-20 15:26:05', '2024-02-20 15:26:05'),
(1437, 'Se han modificado los datos del usuario auxiliar2@eltemplodelamodafresca.com', 2, 2, '20/02/2024 10:26:37', '2024-02-20 15:26:37', '2024-02-20 15:26:37'),
(1438, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '20/02/2024 10:26:54', '2024-02-20 15:26:54', '2024-02-20 15:26:54'),
(1439, 'El usuario sistemasaux2@eltemplodelamoda.com.co creo una nueva llave VPN con nombre shp_contabilidad_7', 18, 20, '20/02/2024 10:28:09', '2024-02-20 15:28:09', '2024-02-20 15:28:09'),
(1440, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '20/02/2024 10:56:43', '2024-02-20 15:56:43', '2024-02-20 15:56:43'),
(1441, 'El usuario Sebastian Hinestroza con correo sistemasaux2@eltemplodelamoda.com.co ha ingresado al sistema', 18, 8, '20/02/2024 13:37:14', '2024-02-20 18:37:14', '2024-02-20 18:37:14'),
(1442, 'El usuario Administrador GRUPO TDM con correo soporte@eltemplodelamoda.com.co ha ingresado al sistema', 2, 8, '20/02/2024 13:38:36', '2024-02-20 18:38:36', '2024-02-20 18:38:36'),
(1443, 'Se ha creado el siguiente usuario tesoreria1@eltemplodelamodafresca.com', 2, 1, '20/02/2024 13:40:26', '2024-02-20 18:40:26', '2024-02-20 18:40:26'),
(1444, 'Se han modificado los datos del usuario tesoreria1@eltemplodelamodafresca.com', 2, 2, '20/02/2024 13:40:56', '2024-02-20 18:40:56', '2024-02-20 18:40:56'),
(1445, 'Se ha creado el siguiente usuario templo14@eltemplodelamodafresca.com', 2, 1, '20/02/2024 13:46:26', '2024-02-20 18:46:26', '2024-02-20 18:46:26'),
(1446, 'Se han modificado los datos del usuario templo14@eltemplodelamodafresca.com', 2, 2, '20/02/2024 13:46:59', '2024-02-20 18:46:59', '2024-02-20 18:46:59'),
(1447, 'Se ha creado el siguiente usuario tesoreria7@eltemplodelamodafresca.com', 2, 1, '20/02/2024 15:07:35', '2024-02-20 20:07:35', '2024-02-20 20:07:35'),
(1448, 'Se han modificado los datos del usuario tesoreria7@eltemplodelamodafresca.com', 2, 2, '20/02/2024 15:07:55', '2024-02-20 20:07:55', '2024-02-20 20:07:55'),
(1449, 'El usuario soporte@eltemplodelamoda.com.co creo una nueva llave VPN con nombre shp_tesoreria_7', 2, 20, '20/02/2024 15:09:01', '2024-02-20 20:09:01', '2024-02-20 20:09:01'),
(1450, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '20/02/2024 15:09:34', '2024-02-20 20:09:34', '2024-02-20 20:09:34'),
(1451, 'El usuario Jhan Carlos Cordoba con correo sistemasaux9@eltemplodelamoda.com.co ha ingresado al sistema', 1, 8, '20/02/2024 15:47:56', '2024-02-20 20:47:56', '2024-02-20 20:47:56'),
(1452, 'El usuario Anderson Cordoba con correo sistemasaux8@eltemplodelamoda.com.co ha ingresado al sistema', 10, 8, '20/02/2024 17:12:58', '2024-02-20 22:12:58', '2024-02-20 22:12:58');

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
(70, 'El producto ya NO se encuentra asignado al acta  con ID 26', 8, 26, '2024-02-08 20:36:53', '2024-02-08 20:36:53'),
(71, 'El producto se encuentra pendiente asignado al acta  con ID 27  para la direcciòn oficinas de NETGROUP para el usuario Sebastian Hinestroza', 14, 27, '2024-02-15 03:12:42', '2024-02-15 03:12:42'),
(72, 'El producto se encuentra pendiente asignado al acta  con ID 27  para la direcciòn oficinas de NETGROUP para el usuario Sebastian Hinestroza', 10, 27, '2024-02-15 03:12:42', '2024-02-15 03:12:42'),
(73, 'El producto se encuentra pendiente asignado al acta  con ID 27  para la direcciòn oficinas de NETGROUP para el usuario Sebastian Hinestroza', 11, 27, '2024-02-15 03:12:42', '2024-02-15 03:12:42'),
(74, 'El producto se encuentra pendiente asignado al acta  con ID 27  para la direcciòn oficinas de NETGROUP para el usuario Sebastian Hinestroza', 13, 27, '2024-02-15 03:12:42', '2024-02-15 03:12:42'),
(75, 'El producto se encuentra pendiente asignado al acta  con ID 27  para la direcciòn oficinas de NETGROUP para el usuario Sebastian Hinestroza', 9, 27, '2024-02-15 03:12:43', '2024-02-15 03:12:43'),
(76, 'El producto se encuentra pendiente asignado al acta  con ID 27  para la direcciòn oficinas de NETGROUP para el usuario Sebastian Hinestroza', 12, 27, '2024-02-15 03:12:43', '2024-02-15 03:12:43'),
(77, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado DESPACHADO', 14, 27, '2024-02-14 22:15:22', '2024-02-14 22:15:22'),
(78, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado DESPACHADO', 10, 27, '2024-02-14 22:15:22', '2024-02-14 22:15:22'),
(79, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado DESPACHADO', 11, 27, '2024-02-14 22:15:22', '2024-02-14 22:15:22'),
(80, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado DESPACHADO', 13, 27, '2024-02-14 22:15:22', '2024-02-14 22:15:22'),
(81, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado DESPACHADO', 9, 27, '2024-02-14 22:15:22', '2024-02-14 22:15:22'),
(82, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado DESPACHADO', 12, 27, '2024-02-14 22:15:22', '2024-02-14 22:15:22'),
(83, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado ENTREGADO', 14, 27, '2024-02-14 22:18:46', '2024-02-14 22:18:46'),
(84, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado ENTREGADO', 10, 27, '2024-02-14 22:18:46', '2024-02-14 22:18:46'),
(85, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado ENTREGADO', 11, 27, '2024-02-14 22:18:46', '2024-02-14 22:18:46'),
(86, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado ENTREGADO', 13, 27, '2024-02-14 22:18:46', '2024-02-14 22:18:46'),
(87, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado ENTREGADO', 9, 27, '2024-02-14 22:18:46', '2024-02-14 22:18:46'),
(88, 'El producto asociado al acta con ID 27 con destino a oficinas de NETGROUP para el usuario Sebastian Hinestroza esta en estado ENTREGADO', 12, 27, '2024-02-14 22:18:46', '2024-02-14 22:18:46'),
(89, 'El producto se encuentra pendiente asignado al acta  con ID 28  para la direcciòn oficina administrativa para el usuario Jhan Carlos Cordoba', 9, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(90, 'El producto se encuentra pendiente asignado al acta  con ID 28  para la direcciòn oficina administrativa para el usuario Jhan Carlos Cordoba', 13, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(91, 'El producto se encuentra pendiente asignado al acta  con ID 28  para la direcciòn oficina administrativa para el usuario Jhan Carlos Cordoba', 12, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(92, 'El producto se encuentra pendiente asignado al acta  con ID 28  para la direcciòn oficina administrativa para el usuario Jhan Carlos Cordoba', 10, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(93, 'El producto se encuentra pendiente asignado al acta  con ID 28  para la direcciòn oficina administrativa para el usuario Jhan Carlos Cordoba', 11, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(94, 'El producto se encuentra pendiente asignado al acta  con ID 28  para la direcciòn oficina administrativa para el usuario Jhan Carlos Cordoba', 14, 28, '2024-02-16 01:10:41', '2024-02-16 01:10:41'),
(95, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 9, 28, '2024-02-15 20:15:38', '2024-02-15 20:15:38'),
(96, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 13, 28, '2024-02-15 20:15:38', '2024-02-15 20:15:38'),
(97, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 12, 28, '2024-02-15 20:15:38', '2024-02-15 20:15:38'),
(98, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 10, 28, '2024-02-15 20:15:38', '2024-02-15 20:15:38'),
(99, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 11, 28, '2024-02-15 20:15:39', '2024-02-15 20:15:39'),
(100, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 14, 28, '2024-02-15 20:15:39', '2024-02-15 20:15:39'),
(101, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 9, 28, '2024-02-15 20:15:40', '2024-02-15 20:15:40'),
(102, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 13, 28, '2024-02-15 20:15:40', '2024-02-15 20:15:40'),
(103, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 12, 28, '2024-02-15 20:15:40', '2024-02-15 20:15:40'),
(104, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 10, 28, '2024-02-15 20:15:40', '2024-02-15 20:15:40'),
(105, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 11, 28, '2024-02-15 20:15:40', '2024-02-15 20:15:40'),
(106, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado DESPACHADO', 14, 28, '2024-02-15 20:15:40', '2024-02-15 20:15:40'),
(107, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado ENTREGADO', 9, 28, '2024-02-15 20:18:18', '2024-02-15 20:18:18'),
(108, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado ENTREGADO', 13, 28, '2024-02-15 20:18:18', '2024-02-15 20:18:18'),
(109, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado ENTREGADO', 12, 28, '2024-02-15 20:18:18', '2024-02-15 20:18:18'),
(110, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado ENTREGADO', 10, 28, '2024-02-15 20:18:18', '2024-02-15 20:18:18'),
(111, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado ENTREGADO', 11, 28, '2024-02-15 20:18:18', '2024-02-15 20:18:18'),
(112, 'El producto asociado al acta con ID 28 con destino a oficina administrativa para el usuario Jhan Carlos Cordoba esta en estado ENTREGADO', 14, 28, '2024-02-15 20:18:18', '2024-02-15 20:18:18'),
(113, 'El producto se encuentra pendiente asignado al acta  con ID 29  para la direcciòn Salida para las oficinas de NETGROPU para el usuario NETGROUP', 9, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(114, 'El producto se encuentra pendiente asignado al acta  con ID 29  para la direcciòn Salida para las oficinas de NETGROPU para el usuario NETGROUP', 13, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(115, 'El producto se encuentra pendiente asignado al acta  con ID 29  para la direcciòn Salida para las oficinas de NETGROPU para el usuario NETGROUP', 12, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(116, 'El producto se encuentra pendiente asignado al acta  con ID 29  para la direcciòn Salida para las oficinas de NETGROPU para el usuario NETGROUP', 11, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(117, 'El producto se encuentra pendiente asignado al acta  con ID 29  para la direcciòn Salida para las oficinas de NETGROPU para el usuario NETGROUP', 10, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(118, 'El producto se encuentra pendiente asignado al acta  con ID 29  para la direcciòn Salida para las oficinas de NETGROPU para el usuario NETGROUP', 14, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(119, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado DESPACHADO', 9, 29, '2024-02-19 21:00:25', '2024-02-19 21:00:25'),
(120, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado DESPACHADO', 13, 29, '2024-02-19 21:00:25', '2024-02-19 21:00:25'),
(121, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado DESPACHADO', 12, 29, '2024-02-19 21:00:25', '2024-02-19 21:00:25'),
(122, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado DESPACHADO', 11, 29, '2024-02-19 21:00:25', '2024-02-19 21:00:25'),
(123, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado DESPACHADO', 10, 29, '2024-02-19 21:00:25', '2024-02-19 21:00:25'),
(124, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado DESPACHADO', 14, 29, '2024-02-19 21:00:25', '2024-02-19 21:00:25'),
(125, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado ENTREGADO', 9, 29, '2024-02-19 21:00:55', '2024-02-19 21:00:55'),
(126, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado ENTREGADO', 13, 29, '2024-02-19 21:00:55', '2024-02-19 21:00:55'),
(127, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado ENTREGADO', 12, 29, '2024-02-19 21:00:55', '2024-02-19 21:00:55'),
(128, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado ENTREGADO', 11, 29, '2024-02-19 21:00:55', '2024-02-19 21:00:55'),
(129, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado ENTREGADO', 10, 29, '2024-02-19 21:00:55', '2024-02-19 21:00:55'),
(130, 'El producto asociado al acta con ID 29 con destino a Salida para las oficinas de NETGROPU para el usuario NETGROUP esta en estado ENTREGADO', 14, 29, '2024-02-19 21:00:55', '2024-02-19 21:00:55');

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
(25, 8, 26, '2024-02-08 20:35:28', '2024-02-08 20:35:28'),
(26, 14, 27, '2024-02-15 03:12:42', '2024-02-15 03:12:42'),
(27, 10, 27, '2024-02-15 03:12:42', '2024-02-15 03:12:42'),
(28, 11, 27, '2024-02-15 03:12:42', '2024-02-15 03:12:42'),
(29, 13, 27, '2024-02-15 03:12:42', '2024-02-15 03:12:42'),
(30, 9, 27, '2024-02-15 03:12:43', '2024-02-15 03:12:43'),
(31, 12, 27, '2024-02-15 03:12:43', '2024-02-15 03:12:43'),
(32, 9, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(33, 13, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(34, 12, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(35, 10, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(36, 11, 28, '2024-02-16 01:10:40', '2024-02-16 01:10:40'),
(37, 14, 28, '2024-02-16 01:10:41', '2024-02-16 01:10:41'),
(38, 9, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(39, 13, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(40, 12, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(41, 11, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(42, 10, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15'),
(43, 14, 29, '2024-02-16 17:54:15', '2024-02-16 17:54:15');

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
(51, 'OFICINA ADMINISTRATIVA', '', 5, NULL, NULL),
(52, 'OFICINA ADMINISTRATIVA', NULL, 1, NULL, NULL),
(53, 'CEDI', NULL, 1, NULL, NULL),
(54, 'OFICINA ADMINISTRATIVA', NULL, 2, NULL, NULL),
(55, 'CEDI', NULL, 2, NULL, NULL),
(56, 'OFICINA ADMINISTRATIVA', NULL, 3, NULL, NULL),
(57, 'CEDI', NULL, 3, NULL, NULL),
(58, 'OFICINA ADMINISTRATIVA', NULL, 4, NULL, NULL),
(59, 'CEDI', NULL, 4, NULL, NULL);

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
(1, '2024-02-20', '2024-02-19', 1, '2024-02-21 03:17:46', '2024-02-21 03:17:46');

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
(1, 1, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(2, 2, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(3, 3, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(4, 4, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(5, 5, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(6, 6, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(7, 7, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(8, 8, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(9, 9, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(10, 10, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(11, 11, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(12, 12, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(13, 13, 1, '39700', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(14, 14, 1, '24900', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(15, 15, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(16, 16, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(17, 17, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(18, 18, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(19, 19, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(20, 20, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(21, 21, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(22, 22, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(23, 23, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(24, 24, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(25, 25, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(26, 26, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(27, 27, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(28, 28, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(29, 29, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(30, 30, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(31, 31, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(32, 32, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(33, 33, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(34, 34, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(35, 35, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(36, 36, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(37, 37, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(38, 38, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(39, 39, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(40, 40, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(41, 41, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(42, 42, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(43, 43, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(44, 44, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(45, 45, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(46, 46, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(47, 47, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(48, 48, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(49, 49, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(50, 50, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(51, 51, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(52, 52, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(53, 53, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(54, 54, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(55, 55, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(56, 56, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(57, 57, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(58, 58, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(59, 59, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(60, 60, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(61, 61, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(62, 62, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(63, 63, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(64, 64, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(65, 65, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(66, 66, 1, '323200', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(67, 67, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(68, 68, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(69, 69, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(70, 70, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(71, 71, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(72, 72, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(73, 73, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(74, 74, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(75, 75, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(76, 76, 1, '2188500', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(77, 77, 1, '39700', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(78, 78, 1, '24900', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(79, 79, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(80, 80, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(81, 81, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(82, 82, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(83, 83, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(84, 84, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(85, 85, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(86, 86, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(87, 87, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(88, 88, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(89, 89, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(90, 90, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(91, 91, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(92, 92, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(93, 93, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(94, 94, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(95, 95, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(96, 96, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(97, 97, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(98, 98, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(99, 99, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(100, 100, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(101, 101, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(102, 102, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(103, 103, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(104, 104, 1, '304100', NULL, NULL, '2024-02-21 03:27:15', '2024-02-21 03:27:15'),
(105, 1, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(106, 2, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(107, 3, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(108, 4, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(109, 5, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(110, 6, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(111, 7, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(112, 8, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(113, 9, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(114, 10, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(115, 11, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(116, 12, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(117, 13, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(118, 14, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(119, 15, 2, '364400', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(120, 16, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(121, 17, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(122, 18, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(123, 19, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(124, 20, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(125, 21, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(126, 22, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(127, 23, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(128, 24, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(129, 25, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(130, 26, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(131, 27, 2, '371255', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(132, 28, 2, '371255', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(133, 29, 2, '371255', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(134, 30, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(135, 31, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(136, 32, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(137, 33, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(138, 34, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(139, 35, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(140, 36, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(141, 37, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(142, 38, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(143, 39, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(144, 40, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(145, 41, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(146, 42, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(147, 43, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(148, 44, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(149, 45, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(150, 46, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(151, 47, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(152, 48, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(153, 49, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(154, 50, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(155, 51, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(156, 52, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(157, 53, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(158, 54, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(159, 55, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(160, 56, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(161, 57, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(162, 58, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(163, 59, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(164, 60, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(165, 61, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(166, 62, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(167, 63, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(168, 64, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(169, 65, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(170, 66, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(171, 67, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(172, 68, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(173, 69, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(174, 70, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(175, 71, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(176, 72, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(177, 73, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(178, 74, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(179, 75, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(180, 76, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(181, 77, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(182, 78, 2, '749000', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(183, 79, 2, '364400', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(184, 80, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(185, 81, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(186, 82, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(187, 83, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(188, 84, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(189, 85, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(190, 86, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(191, 87, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(192, 88, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(193, 89, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(194, 90, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(195, 91, 2, '507500', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(196, 92, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(197, 93, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(198, 94, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(199, 95, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(200, 96, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(201, 97, 2, '84800', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(202, 98, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(203, 99, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(204, 100, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(205, 101, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(206, 102, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(207, 103, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(208, 104, 2, '123700', NULL, NULL, '2024-02-21 03:27:21', '2024-02-21 03:27:21'),
(209, 1, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(210, 2, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(211, 3, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(212, 4, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(213, 5, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(214, 6, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(215, 7, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(216, 8, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(217, 9, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(218, 10, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(219, 11, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(220, 12, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(221, 13, 3, '263400', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(222, 14, 3, '110600', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(223, 15, 3, '669600', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(224, 16, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(225, 17, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(226, 18, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(227, 19, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(228, 20, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(229, 21, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(230, 22, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(231, 23, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(232, 24, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(233, 25, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(234, 26, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(235, 27, 3, '822700', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(236, 28, 3, '822700', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(237, 29, 3, '822700', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(238, 30, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(239, 31, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(240, 32, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(241, 33, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(242, 34, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(243, 35, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(244, 36, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(245, 37, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(246, 38, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(247, 39, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(248, 40, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(249, 41, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(250, 42, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(251, 43, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(252, 44, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(253, 45, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(254, 46, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(255, 47, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(256, 48, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(257, 49, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(258, 50, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(259, 51, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(260, 52, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(261, 53, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(262, 54, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(263, 55, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(264, 56, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(265, 57, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(266, 58, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(267, 59, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(268, 60, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(269, 61, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(270, 62, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(271, 63, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(272, 64, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(273, 65, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(274, 66, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(275, 67, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(276, 68, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(277, 69, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(278, 70, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(279, 71, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(280, 72, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(281, 73, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(282, 74, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(283, 75, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(284, 76, 3, '2569200', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(285, 77, 3, '263400', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(286, 78, 3, '110600', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(287, 79, 3, '669600', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(288, 80, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(289, 81, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(290, 82, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(291, 83, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(292, 84, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(293, 85, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(294, 86, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(295, 87, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(296, 88, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(297, 89, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(298, 90, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(299, 91, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(300, 92, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(301, 93, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(302, 94, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(303, 95, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(304, 96, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(305, 97, 3, '152500', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(306, 98, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(307, 99, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(308, 100, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(309, 101, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(310, 102, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(311, 103, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(312, 104, 3, '65800', NULL, NULL, '2024-02-21 03:27:27', '2024-02-21 03:27:27'),
(313, 1, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(314, 2, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(315, 3, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(316, 4, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(317, 5, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(318, 6, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(319, 7, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(320, 8, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(321, 9, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(322, 10, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(323, 11, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(324, 12, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(325, 13, 4, '72800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(326, 14, 4, '118700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(327, 15, 4, '59800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(328, 16, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(329, 17, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(330, 18, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(331, 19, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(332, 20, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(333, 21, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(334, 22, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(335, 23, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(336, 24, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(337, 25, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(338, 26, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(339, 27, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(340, 28, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(341, 29, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(342, 30, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(343, 31, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(344, 32, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(345, 33, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(346, 34, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(347, 35, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(348, 36, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(349, 37, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(350, 38, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(351, 39, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(352, 40, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(353, 41, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(354, 42, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(355, 43, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(356, 44, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(357, 45, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(358, 46, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(359, 47, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(360, 48, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(361, 49, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(362, 50, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(363, 51, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(364, 52, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(365, 53, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(366, 54, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(367, 55, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(368, 56, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(369, 57, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(370, 58, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(371, 59, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(372, 60, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(373, 61, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(374, 62, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(375, 63, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(376, 64, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(377, 65, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(378, 66, 4, '65700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(379, 67, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(380, 68, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(381, 69, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(382, 70, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(383, 71, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(384, 72, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(385, 73, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(386, 74, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(387, 75, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(388, 76, 4, '1716800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(389, 77, 4, '72800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(390, 78, 4, '118700', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(391, 79, 4, '59800', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(392, 80, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(393, 81, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(394, 82, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(395, 83, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(396, 84, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(397, 85, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(398, 86, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(399, 87, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(400, 88, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(401, 89, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(402, 90, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(403, 91, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(404, 92, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(405, 93, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(406, 94, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(407, 95, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(408, 96, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(409, 97, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(410, 98, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(411, 99, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(412, 100, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(413, 101, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(414, 102, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(415, 103, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(416, 104, 4, '24900', NULL, NULL, '2024-02-21 03:27:33', '2024-02-21 03:27:33'),
(417, 1, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(418, 2, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(419, 3, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(420, 4, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(421, 5, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(422, 6, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(423, 7, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(424, 8, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(425, 9, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(426, 10, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(427, 11, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(428, 12, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(429, 13, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(430, 14, 5, '44900', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(431, 15, 5, '534800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(432, 16, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(433, 17, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(434, 18, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(435, 19, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(436, 20, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(437, 21, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(438, 22, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(439, 23, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(440, 24, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(441, 25, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(442, 26, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(443, 27, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(444, 28, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(445, 29, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(446, 30, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(447, 31, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(448, 32, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(449, 33, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(450, 34, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(451, 35, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(452, 36, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(453, 37, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(454, 38, 5, '475700', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(455, 39, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(456, 40, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(457, 41, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(458, 42, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(459, 43, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(460, 44, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(461, 45, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(462, 46, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(463, 47, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(464, 48, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(465, 49, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(466, 50, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(467, 51, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(468, 52, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(469, 53, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(470, 54, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(471, 55, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(472, 56, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(473, 57, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(474, 58, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(475, 59, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(476, 60, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(477, 61, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(478, 62, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(479, 63, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(480, 64, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(481, 65, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(482, 66, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(483, 67, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(484, 68, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(485, 69, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(486, 70, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(487, 71, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(488, 72, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(489, 73, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(490, 74, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(491, 75, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(492, 76, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(493, 77, 5, '3094000', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(494, 78, 5, '44900', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(495, 79, 5, '534800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(496, 80, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(497, 81, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(498, 82, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(499, 83, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(500, 84, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(501, 85, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(502, 86, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(503, 87, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(504, 88, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(505, 89, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(506, 90, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(507, 91, 5, '146800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(508, 92, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(509, 93, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(510, 94, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(511, 95, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(512, 96, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(513, 97, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(514, 98, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(515, 99, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(516, 100, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(517, 101, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(518, 102, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(519, 103, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(520, 104, 5, '47800', NULL, NULL, '2024-02-21 03:27:39', '2024-02-21 03:27:39'),
(521, 1, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(522, 2, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(523, 3, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(524, 4, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(525, 5, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(526, 6, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(527, 7, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(528, 8, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(529, 9, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(530, 10, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(531, 11, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(532, 12, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(533, 13, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(534, 14, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(535, 15, 6, '189400', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(536, 16, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(537, 17, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(538, 18, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(539, 19, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(540, 20, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(541, 21, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(542, 22, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(543, 23, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(544, 24, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(545, 25, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(546, 26, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(547, 27, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(548, 28, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(549, 29, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(550, 30, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(551, 31, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(552, 32, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(553, 33, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(554, 34, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(555, 35, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(556, 36, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(557, 37, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(558, 38, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(559, 39, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(560, 40, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(561, 41, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(562, 42, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(563, 43, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(564, 44, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(565, 45, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(566, 46, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(567, 47, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(568, 48, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(569, 49, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(570, 50, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(571, 51, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(572, 52, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(573, 53, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(574, 54, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(575, 55, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(576, 56, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(577, 57, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(578, 58, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(579, 59, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(580, 60, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(581, 61, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(582, 62, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(583, 63, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(584, 64, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(585, 65, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(586, 66, 6, '87600', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(587, 67, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(588, 68, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(589, 69, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(590, 70, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(591, 71, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(592, 72, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(593, 73, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(594, 74, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(595, 75, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(596, 76, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(597, 77, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(598, 78, 6, '1203800', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(599, 79, 6, '189400', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(600, 80, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(601, 81, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(602, 82, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(603, 83, 6, '270000', NULL, NULL, '2024-02-21 03:27:45', '2024-02-21 03:27:45'),
(604, 84, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(605, 85, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(606, 86, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(607, 87, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(608, 88, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(609, 89, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(610, 90, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(611, 91, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(612, 92, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(613, 93, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(614, 94, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(615, 95, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(616, 96, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(617, 97, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(618, 98, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(619, 99, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(620, 100, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(621, 101, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(622, 102, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(623, 103, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(624, 104, 6, '270000', NULL, NULL, '2024-02-21 03:27:46', '2024-02-21 03:27:46'),
(625, 1, 7, '7005420', NULL, NULL, '2024-02-21 03:27:51', '2024-02-21 03:27:51'),
(626, 2, 7, '7005420', NULL, NULL, '2024-02-21 03:27:51', '2024-02-21 03:27:51');
INSERT INTO `spreadsheet_rows_tpvs` (`id`, `id_payment_method`, `id_spreadsheet_tpv`, `value_pos`, `value_treasurer`, `difference`, `updated_at`, `created_at`) VALUES
(627, 3, 7, '7005420', NULL, NULL, '2024-02-21 03:27:51', '2024-02-21 03:27:51'),
(628, 4, 7, '7005420', NULL, NULL, '2024-02-21 03:27:51', '2024-02-21 03:27:51'),
(629, 5, 7, '7005420', NULL, NULL, '2024-02-21 03:27:51', '2024-02-21 03:27:51'),
(630, 6, 7, '7005420', NULL, NULL, '2024-02-21 03:27:51', '2024-02-21 03:27:51'),
(631, 7, 7, '7005420', NULL, NULL, '2024-02-21 03:27:51', '2024-02-21 03:27:51'),
(632, 8, 7, '7005420', NULL, NULL, '2024-02-21 03:27:51', '2024-02-21 03:27:51'),
(633, 9, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(634, 10, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(635, 11, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(636, 12, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(637, 13, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(638, 14, 7, '118800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(639, 15, 7, '210300', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(640, 16, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(641, 17, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(642, 18, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(643, 19, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(644, 20, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(645, 21, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(646, 22, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(647, 23, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(648, 24, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(649, 25, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(650, 26, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(651, 27, 7, '1018300', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(652, 28, 7, '1018300', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(653, 29, 7, '1018300', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(654, 30, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(655, 31, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(656, 32, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(657, 33, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(658, 34, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(659, 35, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(660, 36, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(661, 37, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(662, 38, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(663, 39, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(664, 40, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(665, 41, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(666, 42, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(667, 43, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(668, 44, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(669, 45, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(670, 46, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(671, 47, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(672, 48, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(673, 49, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(674, 50, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(675, 51, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(676, 52, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(677, 53, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(678, 54, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(679, 55, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(680, 56, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(681, 57, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(682, 58, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(683, 59, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(684, 60, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(685, 61, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(686, 62, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(687, 63, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(688, 64, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(689, 65, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(690, 66, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(691, 67, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(692, 68, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(693, 69, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(694, 70, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(695, 71, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(696, 72, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(697, 73, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(698, 74, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(699, 75, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(700, 76, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(701, 77, 7, '7005420', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(702, 78, 7, '118800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(703, 79, 7, '210300', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(704, 80, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(705, 81, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(706, 82, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(707, 83, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(708, 84, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(709, 85, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(710, 86, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(711, 87, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(712, 88, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(713, 89, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(714, 90, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(715, 91, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(716, 92, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(717, 93, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(718, 94, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(719, 95, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(720, 96, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(721, 97, 7, '13900', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(722, 98, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(723, 99, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(724, 100, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(725, 101, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(726, 102, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(727, 103, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(728, 104, 7, '88800', NULL, NULL, '2024-02-21 03:27:52', '2024-02-21 03:27:52'),
(729, 1, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(730, 2, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(731, 3, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(732, 4, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(733, 5, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(734, 6, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(735, 7, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(736, 8, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(737, 9, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(738, 10, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(739, 11, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(740, 12, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(741, 13, 8, '175500', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(742, 14, 8, '279400', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(743, 15, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(744, 16, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(745, 17, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(746, 18, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(747, 19, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(748, 20, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(749, 21, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(750, 22, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(751, 23, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(752, 24, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(753, 25, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(754, 26, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(755, 27, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(756, 28, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(757, 29, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(758, 30, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(759, 31, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(760, 32, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(761, 33, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(762, 34, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(763, 35, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(764, 36, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(765, 37, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(766, 38, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(767, 39, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(768, 40, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(769, 41, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(770, 42, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(771, 43, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(772, 44, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(773, 45, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(774, 46, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(775, 47, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(776, 48, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(777, 49, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(778, 50, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(779, 51, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(780, 52, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(781, 53, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(782, 54, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(783, 55, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(784, 56, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(785, 57, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(786, 58, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(787, 59, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(788, 60, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(789, 61, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(790, 62, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(791, 63, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(792, 64, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(793, 65, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(794, 66, 8, '405600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(795, 67, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(796, 68, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(797, 69, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(798, 70, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(799, 71, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(800, 72, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(801, 73, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(802, 74, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(803, 75, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(804, 76, 8, '546600', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(805, 77, 8, '175500', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(806, 78, 8, '279400', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(807, 79, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(808, 80, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(809, 81, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(810, 82, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(811, 83, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(812, 84, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(813, 85, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(814, 86, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(815, 87, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(816, 88, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(817, 89, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(818, 90, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(819, 91, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(820, 92, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(821, 93, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(822, 94, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(823, 95, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(824, 96, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(825, 97, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(826, 98, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(827, 99, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(828, 100, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(829, 101, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(830, 102, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(831, 103, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(832, 104, 8, '69900', NULL, NULL, '2024-02-21 03:27:58', '2024-02-21 03:27:58'),
(833, 1, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(834, 2, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(835, 3, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(836, 4, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(837, 5, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(838, 6, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(839, 7, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(840, 8, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(841, 9, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(842, 10, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(843, 11, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(844, 12, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(845, 13, 9, '89700', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(846, 14, 9, '89700', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(847, 15, 9, '0', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(848, 16, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(849, 17, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(850, 18, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(851, 19, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(852, 20, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(853, 21, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(854, 22, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(855, 23, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(856, 24, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(857, 25, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(858, 26, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(859, 27, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(860, 28, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(861, 29, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(862, 30, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(863, 31, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(864, 32, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(865, 33, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(866, 34, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(867, 35, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(868, 36, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(869, 37, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(870, 38, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(871, 39, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(872, 40, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(873, 41, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(874, 42, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(875, 43, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(876, 44, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(877, 45, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(878, 46, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(879, 47, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(880, 48, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(881, 49, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(882, 50, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(883, 51, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(884, 52, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(885, 53, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(886, 54, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(887, 55, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(888, 56, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(889, 57, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(890, 58, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(891, 59, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(892, 60, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(893, 61, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(894, 62, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(895, 63, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(896, 64, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(897, 65, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(898, 66, 9, '418000', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(899, 67, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(900, 68, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(901, 69, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(902, 70, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(903, 71, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(904, 72, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(905, 73, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(906, 74, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(907, 75, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(908, 76, 9, '5495200', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(909, 77, 9, '89700', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(910, 78, 9, '89700', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(911, 79, 9, '0', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(912, 80, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(913, 81, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(914, 82, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(915, 83, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(916, 84, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(917, 85, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(918, 86, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(919, 87, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(920, 88, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(921, 89, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(922, 90, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(923, 91, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(924, 92, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(925, 93, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(926, 94, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(927, 95, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(928, 96, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(929, 97, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(930, 98, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(931, 99, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(932, 100, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(933, 101, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(934, 102, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(935, 103, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(936, 104, 9, '123400', NULL, NULL, '2024-02-21 03:28:05', '2024-02-21 03:28:05'),
(937, 1, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(938, 2, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(939, 3, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(940, 4, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(941, 5, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(942, 6, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(943, 7, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(944, 8, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(945, 9, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(946, 10, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(947, 11, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(948, 12, 10, '1763200', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(949, 13, 10, '253000', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(950, 14, 10, '253000', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(951, 15, 10, '259300', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(952, 16, 10, '259300', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(953, 17, 10, '259300', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(954, 18, 10, '259300', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(955, 19, 10, '259300', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(956, 20, 10, '259300', NULL, NULL, '2024-02-21 03:28:11', '2024-02-21 03:28:11'),
(957, 21, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(958, 22, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(959, 23, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(960, 24, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(961, 25, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(962, 26, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(963, 27, 10, '1227900', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(964, 28, 10, '1227900', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(965, 29, 10, '1227900', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(966, 30, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(967, 31, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(968, 32, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(969, 33, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(970, 34, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(971, 35, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(972, 36, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(973, 37, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(974, 38, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(975, 39, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(976, 40, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(977, 41, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(978, 42, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(979, 43, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(980, 44, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(981, 45, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(982, 46, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(983, 47, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(984, 48, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(985, 49, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(986, 50, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(987, 51, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(988, 52, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(989, 53, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(990, 54, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(991, 55, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(992, 56, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(993, 57, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(994, 58, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(995, 59, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(996, 60, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(997, 61, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(998, 62, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(999, 63, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1000, 64, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1001, 65, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1002, 66, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1003, 67, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1004, 68, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1005, 69, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1006, 70, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1007, 71, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1008, 72, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1009, 73, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1010, 74, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1011, 75, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1012, 76, 10, '1763200', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1013, 77, 10, '253000', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1014, 78, 10, '253000', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1015, 79, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1016, 80, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1017, 81, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1018, 82, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1019, 83, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1020, 84, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1021, 85, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1022, 86, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1023, 87, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1024, 88, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1025, 89, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1026, 90, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1027, 91, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1028, 92, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1029, 93, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1030, 94, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1031, 95, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1032, 96, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1033, 97, 10, '259300', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1034, 98, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1035, 99, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1036, 100, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1037, 101, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1038, 102, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1039, 103, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1040, 104, 10, '119800', NULL, NULL, '2024-02-21 03:28:12', '2024-02-21 03:28:12'),
(1041, 1, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1042, 2, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1043, 3, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1044, 4, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1045, 5, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1046, 6, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1047, 7, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1048, 8, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1049, 9, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1050, 10, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1051, 11, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1052, 12, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1053, 13, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1054, 14, 11, '49800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1055, 15, 11, '181300', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1056, 16, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1057, 17, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1058, 18, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1059, 19, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1060, 20, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1061, 21, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1062, 22, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1063, 23, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1064, 24, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1065, 25, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1066, 26, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1067, 27, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1068, 28, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1069, 29, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1070, 30, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1071, 31, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1072, 32, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1073, 33, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1074, 34, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1075, 35, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1076, 36, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1077, 37, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1078, 38, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1079, 39, 11, '274100', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1080, 40, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1081, 41, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1082, 42, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1083, 43, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1084, 44, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1085, 45, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1086, 46, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1087, 47, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1088, 48, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1089, 49, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1090, 50, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1091, 51, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1092, 52, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1093, 53, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1094, 54, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1095, 55, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1096, 56, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1097, 57, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1098, 58, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1099, 59, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1100, 60, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1101, 61, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1102, 62, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1103, 63, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1104, 64, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1105, 65, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1106, 66, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1107, 67, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1108, 68, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1109, 69, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1110, 70, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1111, 71, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1112, 72, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1113, 73, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1114, 74, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1115, 75, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1116, 76, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1117, 77, 11, '5242000', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1118, 78, 11, '49800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1119, 79, 11, '181300', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1120, 80, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1121, 81, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1122, 82, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1123, 83, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1124, 84, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1125, 85, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1126, 86, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1127, 87, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1128, 88, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1129, 89, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1130, 90, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1131, 91, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1132, 92, 11, '52800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1133, 93, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1134, 94, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1135, 95, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1136, 96, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1137, 97, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1138, 98, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1139, 99, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1140, 100, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1141, 101, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1142, 102, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1143, 103, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1144, 104, 11, '45800', NULL, NULL, '2024-02-21 03:28:18', '2024-02-21 03:28:18'),
(1145, 1, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1146, 2, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1147, 3, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1148, 4, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1149, 5, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1150, 6, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1151, 7, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1152, 8, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1153, 9, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1154, 10, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1155, 11, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1156, 12, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1157, 13, 12, '39700', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1158, 14, 12, '24900', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1159, 15, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1160, 16, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1161, 17, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1162, 18, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1163, 19, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1164, 20, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1165, 21, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1166, 22, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1167, 23, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1168, 24, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1169, 25, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1170, 26, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1171, 27, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1172, 28, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1173, 29, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1174, 30, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1175, 31, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1176, 32, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1177, 33, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1178, 34, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1179, 35, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1180, 36, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1181, 37, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1182, 38, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1183, 39, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1184, 40, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1185, 41, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1186, 42, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1187, 43, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1188, 44, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1189, 45, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1190, 46, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1191, 47, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1192, 48, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1193, 49, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1194, 50, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1195, 51, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1196, 52, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1197, 53, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1198, 54, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1199, 55, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1200, 56, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1201, 57, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1202, 58, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1203, 59, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1204, 60, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1205, 61, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1206, 62, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1207, 63, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1208, 64, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1209, 65, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1210, 66, 12, '323200', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1211, 67, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1212, 68, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1213, 69, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1214, 70, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1215, 71, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1216, 72, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1217, 73, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1218, 74, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1219, 75, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1220, 76, 12, '2188500', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1221, 77, 12, '39700', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1222, 78, 12, '24900', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1223, 79, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1224, 80, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1225, 81, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1226, 82, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1227, 83, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1228, 84, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1229, 85, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1230, 86, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1231, 87, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1232, 88, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1233, 89, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1234, 90, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1235, 91, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1236, 92, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1237, 93, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1238, 94, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1239, 95, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1240, 96, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1241, 97, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1242, 98, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1243, 99, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24');
INSERT INTO `spreadsheet_rows_tpvs` (`id`, `id_payment_method`, `id_spreadsheet_tpv`, `value_pos`, `value_treasurer`, `difference`, `updated_at`, `created_at`) VALUES
(1244, 100, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1245, 101, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1246, 102, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1247, 103, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1248, 104, 12, '304100', NULL, NULL, '2024-02-21 03:28:24', '2024-02-21 03:28:24'),
(1249, 1, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1250, 2, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1251, 3, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1252, 4, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1253, 5, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1254, 6, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1255, 7, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1256, 8, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1257, 9, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1258, 10, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1259, 11, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1260, 12, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1261, 13, 13, '39700', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1262, 14, 13, '24900', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1263, 15, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1264, 16, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1265, 17, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1266, 18, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1267, 19, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1268, 20, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1269, 21, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1270, 22, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1271, 23, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1272, 24, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1273, 25, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1274, 26, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1275, 27, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1276, 28, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1277, 29, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1278, 30, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1279, 31, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1280, 32, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1281, 33, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1282, 34, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1283, 35, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1284, 36, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1285, 37, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1286, 38, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1287, 39, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1288, 40, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1289, 41, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1290, 42, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1291, 43, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1292, 44, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1293, 45, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1294, 46, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1295, 47, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1296, 48, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1297, 49, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1298, 50, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1299, 51, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1300, 52, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1301, 53, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1302, 54, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1303, 55, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1304, 56, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1305, 57, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1306, 58, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1307, 59, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1308, 60, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1309, 61, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1310, 62, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1311, 63, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1312, 64, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1313, 65, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1314, 66, 13, '323200', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1315, 67, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1316, 68, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1317, 69, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1318, 70, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1319, 71, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1320, 72, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1321, 73, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1322, 74, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1323, 75, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1324, 76, 13, '2188500', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1325, 77, 13, '39700', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1326, 78, 13, '24900', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1327, 79, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1328, 80, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1329, 81, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1330, 82, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1331, 83, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1332, 84, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1333, 85, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1334, 86, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1335, 87, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1336, 88, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1337, 89, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1338, 90, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1339, 91, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1340, 92, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1341, 93, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1342, 94, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1343, 95, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1344, 96, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1345, 97, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1346, 98, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1347, 99, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1348, 100, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1349, 101, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1350, 102, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1351, 103, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1352, 104, 13, '304100', NULL, NULL, '2024-02-21 03:28:31', '2024-02-21 03:28:31'),
(1353, 1, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1354, 2, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1355, 3, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1356, 4, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1357, 5, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1358, 6, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1359, 7, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1360, 8, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1361, 9, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1362, 10, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1363, 11, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1364, 12, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1365, 13, 14, '39700', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1366, 14, 14, '24900', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1367, 15, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1368, 16, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1369, 17, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1370, 18, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1371, 19, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1372, 20, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1373, 21, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1374, 22, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1375, 23, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1376, 24, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1377, 25, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1378, 26, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1379, 27, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1380, 28, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1381, 29, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1382, 30, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1383, 31, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1384, 32, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1385, 33, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1386, 34, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1387, 35, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1388, 36, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1389, 37, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1390, 38, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1391, 39, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1392, 40, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1393, 41, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1394, 42, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1395, 43, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1396, 44, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1397, 45, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1398, 46, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1399, 47, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1400, 48, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1401, 49, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1402, 50, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1403, 51, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1404, 52, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1405, 53, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1406, 54, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1407, 55, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1408, 56, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1409, 57, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1410, 58, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1411, 59, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1412, 60, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1413, 61, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1414, 62, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1415, 63, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1416, 64, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1417, 65, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1418, 66, 14, '323200', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1419, 67, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1420, 68, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1421, 69, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1422, 70, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1423, 71, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1424, 72, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1425, 73, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1426, 74, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1427, 75, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1428, 76, 14, '2188500', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1429, 77, 14, '39700', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1430, 78, 14, '24900', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1431, 79, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1432, 80, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1433, 81, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1434, 82, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1435, 83, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1436, 84, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1437, 85, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1438, 86, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1439, 87, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1440, 88, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1441, 89, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1442, 90, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1443, 91, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1444, 92, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1445, 93, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1446, 94, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1447, 95, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1448, 96, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1449, 97, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1450, 98, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1451, 99, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1452, 100, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1453, 101, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1454, 102, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1455, 103, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1456, 104, 14, '304100', NULL, NULL, '2024-02-21 03:28:37', '2024-02-21 03:28:37'),
(1457, 1, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1458, 2, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1459, 3, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1460, 4, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1461, 5, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1462, 6, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1463, 7, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1464, 8, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1465, 9, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1466, 10, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1467, 11, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1468, 12, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1469, 13, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1470, 14, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1471, 15, 15, '364400', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1472, 16, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1473, 17, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1474, 18, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1475, 19, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1476, 20, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1477, 21, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1478, 22, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1479, 23, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1480, 24, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1481, 25, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1482, 26, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1483, 27, 15, '371255', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1484, 28, 15, '371255', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1485, 29, 15, '371255', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1486, 30, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1487, 31, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1488, 32, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1489, 33, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1490, 34, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1491, 35, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1492, 36, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1493, 37, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1494, 38, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1495, 39, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1496, 40, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1497, 41, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1498, 42, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1499, 43, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1500, 44, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1501, 45, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1502, 46, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1503, 47, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1504, 48, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1505, 49, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1506, 50, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1507, 51, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1508, 52, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1509, 53, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1510, 54, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1511, 55, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1512, 56, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1513, 57, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1514, 58, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1515, 59, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1516, 60, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1517, 61, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1518, 62, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1519, 63, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1520, 64, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1521, 65, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1522, 66, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1523, 67, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1524, 68, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1525, 69, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1526, 70, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1527, 71, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1528, 72, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1529, 73, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1530, 74, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1531, 75, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1532, 76, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1533, 77, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1534, 78, 15, '749000', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1535, 79, 15, '364400', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1536, 80, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1537, 81, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1538, 82, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1539, 83, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1540, 84, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1541, 85, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1542, 86, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1543, 87, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1544, 88, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1545, 89, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1546, 90, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1547, 91, 15, '507500', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1548, 92, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1549, 93, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1550, 94, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1551, 95, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1552, 96, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1553, 97, 15, '84800', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1554, 98, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1555, 99, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1556, 100, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1557, 101, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1558, 102, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1559, 103, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1560, 104, 15, '123700', NULL, NULL, '2024-02-21 03:28:44', '2024-02-21 03:28:44'),
(1561, 1, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1562, 2, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1563, 3, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1564, 4, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1565, 5, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1566, 6, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1567, 7, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1568, 8, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1569, 9, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1570, 10, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1571, 11, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1572, 12, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1573, 13, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1574, 14, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1575, 15, 16, '364400', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1576, 16, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1577, 17, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1578, 18, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1579, 19, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1580, 20, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1581, 21, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1582, 22, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1583, 23, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1584, 24, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1585, 25, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1586, 26, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1587, 27, 16, '371255', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1588, 28, 16, '371255', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1589, 29, 16, '371255', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1590, 30, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1591, 31, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1592, 32, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1593, 33, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1594, 34, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1595, 35, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1596, 36, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1597, 37, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1598, 38, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1599, 39, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1600, 40, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1601, 41, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1602, 42, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1603, 43, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1604, 44, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1605, 45, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1606, 46, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1607, 47, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1608, 48, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1609, 49, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1610, 50, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1611, 51, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1612, 52, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1613, 53, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1614, 54, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1615, 55, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1616, 56, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1617, 57, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1618, 58, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1619, 59, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1620, 60, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1621, 61, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1622, 62, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1623, 63, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1624, 64, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1625, 65, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1626, 66, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1627, 67, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1628, 68, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1629, 69, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1630, 70, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1631, 71, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1632, 72, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1633, 73, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1634, 74, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1635, 75, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1636, 76, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1637, 77, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1638, 78, 16, '749000', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1639, 79, 16, '364400', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1640, 80, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1641, 81, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1642, 82, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1643, 83, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1644, 84, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1645, 85, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1646, 86, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1647, 87, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1648, 88, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1649, 89, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1650, 90, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1651, 91, 16, '507500', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1652, 92, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1653, 93, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1654, 94, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1655, 95, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1656, 96, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1657, 97, 16, '84800', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1658, 98, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1659, 99, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1660, 100, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1661, 101, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1662, 102, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1663, 103, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1664, 104, 16, '123700', NULL, NULL, '2024-02-21 03:28:51', '2024-02-21 03:28:51'),
(1665, 1, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1666, 2, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1667, 3, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1668, 4, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1669, 5, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1670, 6, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1671, 7, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1672, 8, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1673, 9, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1674, 10, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1675, 11, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1676, 12, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1677, 13, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1678, 14, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1679, 15, 17, '364400', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1680, 16, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1681, 17, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1682, 18, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1683, 19, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1684, 20, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1685, 21, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1686, 22, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1687, 23, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1688, 24, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1689, 25, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1690, 26, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1691, 27, 17, '371255', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1692, 28, 17, '371255', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1693, 29, 17, '371255', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1694, 30, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1695, 31, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1696, 32, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1697, 33, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1698, 34, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1699, 35, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1700, 36, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1701, 37, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1702, 38, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1703, 39, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1704, 40, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1705, 41, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1706, 42, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1707, 43, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1708, 44, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1709, 45, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1710, 46, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1711, 47, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1712, 48, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1713, 49, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1714, 50, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1715, 51, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1716, 52, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1717, 53, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1718, 54, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1719, 55, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1720, 56, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1721, 57, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1722, 58, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1723, 59, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1724, 60, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1725, 61, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1726, 62, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1727, 63, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1728, 64, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1729, 65, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1730, 66, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1731, 67, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1732, 68, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1733, 69, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1734, 70, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1735, 71, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1736, 72, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1737, 73, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1738, 74, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1739, 75, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1740, 76, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1741, 77, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1742, 78, 17, '749000', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1743, 79, 17, '364400', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1744, 80, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1745, 81, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1746, 82, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1747, 83, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1748, 84, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1749, 85, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1750, 86, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1751, 87, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1752, 88, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1753, 89, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1754, 90, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1755, 91, 17, '507500', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1756, 92, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1757, 93, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1758, 94, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1759, 95, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1760, 96, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1761, 97, 17, '84800', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1762, 98, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1763, 99, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1764, 100, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1765, 101, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1766, 102, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1767, 103, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1768, 104, 17, '123700', NULL, NULL, '2024-02-21 03:28:57', '2024-02-21 03:28:57'),
(1769, 1, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1770, 2, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1771, 3, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1772, 4, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1773, 5, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1774, 6, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1775, 7, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1776, 8, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1777, 9, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1778, 10, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1779, 11, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1780, 12, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1781, 13, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1782, 14, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1783, 15, 18, '364400', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1784, 16, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1785, 17, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1786, 18, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1787, 19, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1788, 20, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1789, 21, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1790, 22, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1791, 23, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1792, 24, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1793, 25, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1794, 26, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1795, 27, 18, '371255', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1796, 28, 18, '371255', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1797, 29, 18, '371255', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1798, 30, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1799, 31, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1800, 32, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1801, 33, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1802, 34, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1803, 35, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1804, 36, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1805, 37, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1806, 38, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1807, 39, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1808, 40, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1809, 41, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1810, 42, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1811, 43, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1812, 44, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1813, 45, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1814, 46, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1815, 47, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1816, 48, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1817, 49, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1818, 50, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1819, 51, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1820, 52, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1821, 53, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1822, 54, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1823, 55, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1824, 56, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1825, 57, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1826, 58, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1827, 59, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1828, 60, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1829, 61, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1830, 62, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1831, 63, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1832, 64, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1833, 65, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1834, 66, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1835, 67, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1836, 68, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1837, 69, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1838, 70, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1839, 71, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1840, 72, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1841, 73, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1842, 74, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1843, 75, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1844, 76, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1845, 77, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1846, 78, 18, '749000', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1847, 79, 18, '364400', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1848, 80, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1849, 81, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1850, 82, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1851, 83, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1852, 84, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03');
INSERT INTO `spreadsheet_rows_tpvs` (`id`, `id_payment_method`, `id_spreadsheet_tpv`, `value_pos`, `value_treasurer`, `difference`, `updated_at`, `created_at`) VALUES
(1853, 85, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1854, 86, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1855, 87, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1856, 88, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1857, 89, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1858, 90, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1859, 91, 18, '507500', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1860, 92, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1861, 93, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1862, 94, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1863, 95, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1864, 96, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1865, 97, 18, '84800', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1866, 98, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1867, 99, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1868, 100, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1869, 101, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1870, 102, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1871, 103, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1872, 104, 18, '123700', NULL, NULL, '2024-02-21 03:29:03', '2024-02-21 03:29:03'),
(1873, 1, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1874, 2, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1875, 3, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1876, 4, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1877, 5, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1878, 6, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1879, 7, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1880, 8, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1881, 9, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1882, 10, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1883, 11, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1884, 12, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1885, 13, 19, '263400', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1886, 14, 19, '110600', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1887, 15, 19, '669600', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1888, 16, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1889, 17, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1890, 18, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1891, 19, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1892, 20, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1893, 21, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1894, 22, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1895, 23, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1896, 24, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1897, 25, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1898, 26, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1899, 27, 19, '822700', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1900, 28, 19, '822700', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1901, 29, 19, '822700', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1902, 30, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1903, 31, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1904, 32, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1905, 33, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1906, 34, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1907, 35, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1908, 36, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1909, 37, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1910, 38, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1911, 39, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1912, 40, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1913, 41, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1914, 42, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1915, 43, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1916, 44, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1917, 45, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1918, 46, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1919, 47, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1920, 48, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1921, 49, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1922, 50, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1923, 51, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1924, 52, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1925, 53, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1926, 54, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1927, 55, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1928, 56, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1929, 57, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1930, 58, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1931, 59, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1932, 60, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1933, 61, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1934, 62, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1935, 63, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1936, 64, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1937, 65, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1938, 66, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1939, 67, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1940, 68, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1941, 69, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1942, 70, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1943, 71, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1944, 72, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1945, 73, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1946, 74, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1947, 75, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1948, 76, 19, '2569200', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1949, 77, 19, '263400', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1950, 78, 19, '110600', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1951, 79, 19, '669600', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1952, 80, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1953, 81, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1954, 82, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1955, 83, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1956, 84, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1957, 85, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1958, 86, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1959, 87, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1960, 88, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1961, 89, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1962, 90, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1963, 91, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1964, 92, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1965, 93, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1966, 94, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1967, 95, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1968, 96, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1969, 97, 19, '152500', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1970, 98, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1971, 99, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1972, 100, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1973, 101, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1974, 102, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1975, 103, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12'),
(1976, 104, 19, '65800', NULL, NULL, '2024-02-21 03:31:12', '2024-02-21 03:31:12');

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
(6, 10, 7, 2, '2024-02-15 00:25:37', '2024-02-14 01:59:55'),
(7, 10, 7, 2, '2024-02-15 00:26:27', '2024-02-15 00:26:12');

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
(1, '72760000', '0', '0', 3, 1, 3, '2024-02-21 03:27:15', '2024-02-21 03:17:46'),
(2, '37851465', '0', '0', 4, 1, 3, '2024-02-21 03:27:21', '2024-02-21 03:27:15'),
(3, '68395400', '0', '0', 5, 1, 3, '2024-02-21 03:27:27', '2024-02-21 03:27:21'),
(4, '41796600', '0', '0', 6, 1, 3, '2024-02-21 03:27:33', '2024-02-21 03:27:27'),
(5, '86460000', '0', '0', 7, 1, 3, '2024-02-21 03:27:39', '2024-02-21 03:27:33'),
(6, '44901600', '0', '0', 8, 1, 3, '2024-02-21 03:27:46', '2024-02-21 03:27:39'),
(7, '176153480', '0', '0', 9, 1, 3, '2024-02-21 03:27:52', '2024-02-21 03:27:46'),
(8, '31815200', '0', '0', 10, 1, 3, '2024-02-21 03:27:58', '2024-02-21 03:27:52'),
(9, '142415600', '0', '0', 11, 1, 3, '2024-02-21 03:28:05', '2024-02-21 03:27:58'),
(10, '56795600', '0', '0', 12, 1, 3, '2024-02-21 03:28:12', '2024-02-21 03:28:05'),
(11, '132886900', '0', '0', 13, 1, 3, '2024-02-21 03:28:18', '2024-02-21 03:28:12'),
(12, '72760000', '0', '0', 14, 1, 3, '2024-02-21 03:28:24', '2024-02-21 03:28:18'),
(13, '72760000', '0', '0', 15, 1, 3, '2024-02-21 03:28:31', '2024-02-21 03:28:24'),
(14, '72760000', '0', '0', 16, 1, 3, '2024-02-21 03:28:37', '2024-02-21 03:28:31'),
(15, '37851465', '0', '0', 17, 1, 3, '2024-02-21 03:28:44', '2024-02-21 03:28:37'),
(16, '37851465', '0', '0', 18, 1, 3, '2024-02-21 03:28:51', '2024-02-21 03:28:44'),
(17, '37851465', '0', '0', 19, 1, 3, '2024-02-21 03:28:57', '2024-02-21 03:28:51'),
(18, '37851465', '0', '0', 20, 1, 3, '2024-02-21 03:29:03', '2024-02-21 03:28:57'),
(19, '68395400', '0', '0', 21, 1, 3, '2024-02-21 03:31:12', '2024-02-21 03:29:03'),
(20, '0', '0', '0', 22, 1, 3, '2024-02-21 03:31:12', '2024-02-21 03:31:12');

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
(63, 'HACELE LA COMIDA A VALERIA', 'PATICO', NULL, '13/02/2024 15:29:39', '13/02/2024 16:29:39', 5, 1, 10, 6, '2024-02-14 18:38:53', '2024-02-13 20:30:45'),
(64, 'ntc', 'jhon cortes solicita \"Buenos días por favor para Templo 1 no se reflejan la caja 1 y la caja 3 del.dia de ayer\"', '2024-02-14_13-47-00.jpeg', '14/02/2024 08:45:34', '14/02/2024 14:45:34', 1, 19, 1, 7, '2024-02-14 19:49:53', '2024-02-14 13:47:00'),
(65, 'contestar correo don Julián Guarnizo', 'don Julián solicito confirmación para los tramites para el cable adaptador VGA/hdmi por medio del correo de soporte', NULL, '14/02/2024 09:06:27', '14/02/2024 15:06:27', 1, 19, 1, 7, '2024-02-14 19:17:31', '2024-02-14 14:10:33'),
(66, 'COTIZAR CONVERTIDOR VGA A HTDMI', 'Debes ir a la PAVA a cotizar el adaptador solicitado. Luego montarme un ticket con la imagen de la cotizacion para mandarlo por correo.', NULL, '14/02/2024 09:18:04', '14/02/2024 11:18:04', 4, 1, 19, 7, '2024-02-14 19:49:17', '2024-02-14 14:19:05'),
(67, 'TERMINAR REUNION ZOOM DE HOY', 'Terminar reunion de hoy y enviar grabacion al correo de Andres Benavides O Luz Angela', NULL, '14/02/2024 09:24:27', '14/02/2024 10:24:27', 5, 1, 18, 7, '2024-02-14 19:34:47', '2024-02-14 14:26:37'),
(68, 'nota en siesa', 'no aparecen las notas en los campos de la tabla en siesa, ya se realizo otro archivo y aun asi perdura el error no sale\r\nanydesk: 569401911', '2024-02-14_16-31-55.png', '14/02/2024 10:19:07', '14/02/2024 16:19:07', 1, 19, 18, 6, '2024-02-15 18:27:26', '2024-02-14 15:31:33'),
(69, 'cambiar contraseña', 'carmen de t1 quiere cambiar de contraseña, escribe por el chat', '2024-02-14_15-42-58.png', '14/02/2024 10:31:46', '14/02/2024 16:31:46', 1, 19, 1, 6, '2024-02-15 18:27:33', '2024-02-14 15:33:30'),
(70, 'SOLICITAR VISITA IMPRESORA', 'Solicitar a la visita al SR. Yair Para el arreglo de impresora por correo con direccion de la oficina', NULL, '14/02/2024 11:02:53', '14/02/2024 12:02:53', 5, 1, 19, 6, '2024-02-14 22:06:34', '2024-02-14 16:03:40'),
(71, 'ntc', 'generar ntc T14 día 13 todas las cajas', NULL, '14/02/2024 11:16:23', '14/02/2024 17:16:23', 1, 19, 1, 7, '2024-02-14 21:19:27', '2024-02-14 16:17:34'),
(72, 'cambiar clave de usuarios remotos', 'cambiar el usuario a kelly t30 TMODA\\testdm20 \r\ny\r\ncambiar usuario de los angeles TMODA\\busint_angeles_1 para jhonatan', '2024-02-14_20-29-18.png', '14/02/2024 15:19:52', '14/02/2024 21:19:52', 1, 19, 1, 7, '2024-02-15 01:36:15', '2024-02-14 20:22:19'),
(73, 'REVISAR LLAVE VPN', 'Debes ingresar al anydesk de Tesorera Kelly de T30 y comprimir la llave VPN y pasarla a tu equipo y solicitar una revisión a NEGROUP para esa llave.', '2024-02-14_21-11-04.png', '14/02/2024 16:09:18', '14/02/2024 17:09:18', 5, 1, 19, 7, '2024-02-15 18:46:44', '2024-02-14 21:11:04'),
(74, 'ntc', 'Hola buenas tardes por favor me colaboran la NTC de shopping 14 del dia 15 feb subio por menos valor es la caja 2', NULL, '16/02/2024 15:57:06', '16/02/2024 21:57:06', 1, 17, 1, 2, '2024-02-16 21:41:11', '2024-02-16 20:58:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpvs`
--

CREATE TABLE `tpvs` (
  `id` int(11) NOT NULL,
  `tpv` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `id_shop` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tpvs`
--

INSERT INTO `tpvs` (`id`, `tpv`, `description`, `id_shop`, `id_state`, `updated_at`, `created_at`) VALUES
(3, 'TPV00101', 'CAJA 01', 1, 1, '2024-02-21 02:33:24', '2024-02-21 02:33:24'),
(4, 'TPV00201', 'CAJA 01', 2, 1, '2024-02-21 02:33:24', '2024-02-21 02:33:24'),
(5, 'TPV00401', 'CAJA 01', 3, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(6, 'TPV00501', 'CAJA 01.', 4, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(7, 'TPV00601', 'CAJA 01', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(8, 'TPV00801', 'CAJA 01', 6, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(9, 'TPV00901', 'CAJA 01', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(10, 'TPV01001', 'CAJA 01', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(11, 'TPV01101', 'CAJA 01', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(12, 'TPV01301', 'CAJA 01', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(13, 'TPV01401', 'CAJA 01', 11, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(14, 'TPV00102', 'CAJA 02', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(15, 'TPV00103', 'CAJA 03', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(16, 'TPV00104', 'CAJA 04', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(17, 'TPV00202', 'CAJA 02', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(18, 'TPV00203', 'CAJA 03', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(19, 'TPV00204', 'CAJA 04', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(20, 'TPV00205', 'CAJA 05', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(21, 'TPV00402', 'CAJA 02', 3, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(22, 'TPV00403', 'CAJA 03', 3, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(23, 'TPV00502', 'CAJA 02', 4, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(24, 'TPV00602', 'CAJA 02', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(25, 'TPV00603', 'CAJA 03', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(26, 'TPV00604', 'CAJA 04', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(27, 'TPV00802', 'CAJA 02', 6, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(28, 'TPV00803', 'CAJA 03', 6, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(29, 'TPV00902', 'CAJA 02', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(30, 'TPV00903', 'CAJA 03', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(31, 'TPV00904', 'CAJA 04', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(32, 'TPV00905', 'CAJA 05', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(33, 'TPV01002', 'CAJA 02', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(34, 'TPV01003', 'CAJA 03 - NO USAR ERROR EN CONSECUTIVOS', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(35, 'TPV01004', 'CAJA 04', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(36, 'TPV01102', 'CAJA 02', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(37, 'TPV01103', 'CAJA 03', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(38, 'TPV01104', 'CAJA 04', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(39, 'TPV01302', 'CAJA 02', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(40, 'TPV01303', 'CAJA 03', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(41, 'TPV01304', 'CAJA 04', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(42, 'TPV01402', 'CAJA 02', 11, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(43, 'TPV01403', 'CAJA 03', 11, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(44, 'TPV01404', 'CAJA 04', 11, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(45, 'TPV01405', 'CAJA 05', 11, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(46, 'TPV01105', 'CAJA 05', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(47, 'TPV01601', 'CAJA 01', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(48, 'TPV01602', 'CAJA 02', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(49, 'TPV01603', 'CAJA 03', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(50, 'TPV01604', 'CAJA 04', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(51, 'TPV01605', 'CAJA 05', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(52, 'TPV01606', 'CAJA 06', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(53, 'TPV00206', 'CAJA 06', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(54, 'TPV00207', 'CAJA 07 Caja Manuel', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(55, 'TPV00208', 'CAJA 08', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(56, 'TPV00503', 'CAJA 03', 4, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(57, 'TPV00209', 'CAJA 09', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(58, 'TPV00220', 'CAJA 20', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(59, 'TPV01106', 'CAJA 06', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(60, 'TPV01107', 'CAJA 06', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(61, 'TPV01005', 'CAJA 05', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(62, 'TPV01607', 'CAJA 07', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(63, 'TPV01008', 'CAJA 08', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(64, 'TPV01007', 'CAJA 07', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(65, 'TPV01006', 'CAJA 06', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(66, 'TPV01608', 'CAJA 08', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(67, 'TPV01609', 'CAJA 09', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(68, 'TPV01305', 'CAJA 05', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(69, 'TPV01306', 'CAJA 06', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(70, 'TPV01307', 'CAJA 05', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(71, 'TPV01308', 'CAJA 08', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(72, 'TPV00906', 'CAJA 06', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(73, 'TPV00907', 'CAJA 07', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(74, 'TPV01009', 'CAJA 09', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(75, 'TPV00504', 'CAJA 04', 4, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(76, 'TPV01010', 'CAJA 10', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(77, 'TPV00908', 'CAJA 08', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(78, 'TPV00909', 'CAJA 09', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(79, 'TPV00910', 'CAJA 10', 7, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(80, 'TPV00210', 'CAJA 10', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(81, 'TPV00211', 'CAJA 11', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(82, 'TPV00212', 'CAJA 12', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(83, 'TPV00213', 'CAJA 12', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(84, 'TPV00404', 'CAJA 03', 3, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(85, 'TPV00405', 'CAJA 03', 3, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(86, 'TPV00406', 'CAJA 03', 3, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(87, 'TPV00407', 'CAJA 03', 3, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(88, 'TPV00105', 'CAJA 05', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(89, 'TPV00106', 'CAJA 06', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(90, 'TPV00107', 'CAJA 07', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(91, 'TPV00108', 'CAJA 08', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(92, 'TPV01610', 'CAJA 10', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(93, 'TPV01406', 'CAJA 06', 11, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(94, 'TPV01407', 'CAJA 07', 11, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(95, 'TPV01408', 'CAJA 08', 11, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(96, 'TPV01409', 'CAJA 09', 11, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(97, 'TPV00804', 'CAJA 03', 6, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(98, 'TPV00805', 'CAJA 05', 6, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(99, 'TPV00806', 'CAJA 06', 6, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(100, 'TPV00807', 'CAJA 07', 6, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(101, 'TPV00109', 'CAJA 09', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(102, 'TPV00110', 'CAJA 10', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(103, 'TPV00111', 'CAJA 11', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(104, 'TPV00112', 'CAJA 12', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(105, 'TPV00113', 'CAJA 13', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(106, 'TPV00114', 'CAJA 14', 1, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(107, 'TPV01611', 'CAJA 11', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(108, 'TPV01612', 'CAJA 12', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(109, 'TPV01613', 'CAJA 13', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(110, 'TPV01614', 'CAJA 14', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(111, 'TPV01615', 'CAJA 15', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(112, 'TPV01616', 'CAJA 16', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(113, 'TPV01617', 'CAJA 17', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(114, 'TPV01618', 'CAJA 18', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(115, 'TPV01619', 'CAJA 19', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(116, 'TPV01620', 'CAJA 20', 12, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(117, 'TPV01108', 'CAJA 08', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(118, 'TPV01109', 'CAJA 09', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(119, 'TPV01110', 'CAJA 10', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(120, 'TPV01111', 'CAJA 10', 9, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(121, 'TPV01011', 'CAJA 11', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(122, 'TPV01012', 'CAJA 12', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(123, 'TPV01013', 'CAJA 13', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(124, 'TPV01014', 'CAJA 14', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(125, 'TPV01015', 'CAJA 15', 8, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(126, 'TPV01309', 'CAJA 09', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(127, 'TPV01310', 'CAJA 10', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(128, 'TPV01311', 'CAJA 11', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(129, 'TPV01312', 'CAJA 12', 10, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(130, 'TPV00605', 'CAJA 05', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(131, 'TPV00606', 'CAJA 06', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(132, 'TPV00607', 'CAJA 07', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(133, 'TPV00608', 'CAJA 08', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(134, 'TPV00609', 'CAJA 09', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(135, 'TPV00610', 'CAJA 10', 5, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(136, 'TPV00214', 'CAJA 12', 2, 1, '2024-02-21 02:35:40', '2024-02-21 02:35:40'),
(137, 'TPV00215', 'CAJA 15', 2, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(138, 'TPV00216', 'CAJA 16', 2, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(139, 'TPV00808', 'CAJA 08', 6, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(140, 'TPV00217', 'CAJA 17', 2, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(141, 'TPV01701', 'CAJA 01', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(142, 'TPV01702', 'CAJA 02', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(143, 'TPV01703', 'CAJA 03', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(144, 'TPV01704', 'CAJA 04', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(145, 'TPV01705', 'CAJA 05', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(146, 'TPV00218', 'CAJA 18', 2, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(147, 'TPV00219', 'CAJA 19', 2, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(148, 'TPV00221', 'CAJA 21', 2, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(149, 'TPV00222', 'CAJA 22', 2, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(150, 'TPV00223', 'CAJA 23', 2, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(151, 'TPV00224', 'CAJA 24', 2, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(152, 'TPV01706', 'CAJA 06', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(153, 'TPV01707', 'CAJA 07', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(154, 'TPV01708', 'CAJA 08', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(155, 'TPV01709', 'CAJA 09', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(156, 'TPV01710', 'CAJA 10', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(157, 'TPV01711', 'CAJA 11', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(158, 'TPV01712', 'CAJA 12', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(159, 'TPV01713', 'CAJA 13', 13, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(160, 'TPV00611', 'CAJA 11', 5, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(161, 'TPV00612', 'CAJA 12', 5, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(162, 'TPV00613', 'CAJA 13', 5, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(163, 'TPV01112', 'CAJA 10', 9, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(164, 'TPV01410', 'CAJA 10', 11, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(165, 'TPV01801', 'CAJA01', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(166, 'TPV01802', 'CAJA02', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(167, 'TPV01803', 'CAJA03', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(168, 'TPV01804', 'CAJA04', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(169, 'TPV01805', 'CAJA05', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(170, 'TPV01806', 'CAJA06', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(171, 'TPV01807', 'CAJA07', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(172, 'TPV01808', 'CAJA08', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(173, 'TPV01809', 'CAJA09', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(174, 'TPV01810', 'CAJA10', 14, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(175, 'TPV01901', 'CAJA01', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(176, 'TPV01902', 'CAJA02', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(177, 'TPV01903', 'CAJA03', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(178, 'TPV01904', 'CAJA04', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(179, 'TPV01905', 'CAJA05', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(180, 'TPV01906', 'CAJA06', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(181, 'TPV01907', 'CAJA07', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(182, 'TPV01908', 'CAJA08', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(183, 'TPV01909', 'CAJA09', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(184, 'T0901910', 'CAJA10', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(185, 'TPV01911', 'CAJA11', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(186, 'TPV01912', 'CAJA12', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(187, 'TPV01913', 'CAJA13', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(188, 'TPV01914', 'CAJA14', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(189, 'TPV01915', 'CAJA15', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(190, 'TPV01916', 'CAJA16', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(191, 'TPV01917', 'CAJA17', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(192, 'TPV01918', 'CAJA18', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(193, 'TPV01919', 'CAJA18', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(194, 'TPV01920', 'CAJA20', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(195, 'TPV01921', 'CAJA21', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(196, 'TPV01922', 'CAJA22', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(197, 'TPV01923', 'CAJA23', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(198, 'TPV01924', 'CAJA24', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(199, 'TPV01925', 'CAJA25', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(200, 'TPV01826', 'CAJA26', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(201, 'TPV01928', 'CAJA28', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(202, 'TPV01829', 'CAJA29', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(203, 'TPV01910', 'CAJA10', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(204, 'TPV01926', 'CAJA26', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(205, 'TPV01927', 'CAJA27', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(206, 'TPV00911', 'CAJA 11', 7, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(207, 'TPV00912', 'CAJA 12', 7, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(208, 'TPV02001', 'CAJA01', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(209, 'TPV01113', 'CAJATPV01113', 9, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(210, 'TPV02003', 'CAJA03', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(211, 'TPV02002', 'CAJA02', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(212, 'TPV02004', 'CAJA04', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(213, 'TPV02005', 'CAJA05', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(214, 'TPV02006', 'CAJA06', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(215, 'TPV02007', 'CAJA07', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(216, 'TPV02008', 'CAJA08', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(217, 'TPV02009', 'CAJA09', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(218, 'TPV02010', 'CAJA10', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(219, 'TPV02011', 'CAJA11', 16, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(220, 'TPV00408', 'CAJA08', 3, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(221, 'TPV00409', 'CAJA09', 3, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(222, 'TPV02301', 'CAJA01', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(223, 'TPV02302', 'CAJA02', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(224, 'TPV02303', 'CAJA03', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(225, 'TPV02304', 'CAJA04', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(226, 'TPV02305', 'CAJA05', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(227, 'TPV02306', 'CAJA06', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(228, 'TPV02308', 'CAJA08', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(229, 'TPV02310', 'CAJA10', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(230, 'TPV02311', 'CAJA11', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(231, 'TPV02309', 'CAJA09', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(232, 'TPV02307', 'CAJA07', 17, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(233, 'TPV02401', 'CAJA01', 18, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(234, 'TPV02601', 'CAJA01', 19, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(235, 'TPV02402', 'CAJA02', 18, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(236, 'TPV02403', 'CAJA03', 18, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(237, 'TPV02404', 'CAJA04', 18, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(238, 'TPV02405', 'CAJA05', 18, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(239, 'TPV02406', 'CAJA06', 18, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(240, 'TPV02407', 'CAJA07', 18, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(241, 'TPV00505', 'CAJA05', 4, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(242, 'TPV01016', 'CAJA16', 8, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(243, 'TPV01017', 'CAJA17', 8, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(244, 'TPV00809', 'CAJA09 NO USAR ERROR DE SUBIDA DE VENTAS', 6, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(245, 'TPV00810', 'CAJA10', 6, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(246, 'TPV00811', 'CAJA11 NO USAR ERROR DE SUBIDA DE VENTAS', 6, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(247, 'TPV00812', 'CAJA12', 6, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(248, 'TPV00813', 'CAJA13', 6, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(249, 'TPV00814', 'CAJA14', 6, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(250, 'TPV00506', 'CAJA06', 4, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(251, 'TPV02701', 'CAJA01', 20, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(252, 'TPV02602', 'CAJA02', 19, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(253, 'TPV02603', 'CAJA03', 19, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(254, 'TPV02702', 'CAJA02', 20, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(255, 'TPV02703', 'CAJA03', 20, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(256, 'TPV02604', 'CAJA04', 19, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(257, 'TPV02605', 'CAJA05', 19, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(258, 'TPV02606', 'CAJA06', 19, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(259, 'TPV02704', 'CAJA04', 20, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(260, 'TPV02705', 'CAJA05', 20, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(261, 'TPV02706', 'CAJA06', 20, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(262, 'TPV02607', 'CAJA07', 19, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(263, 'TPV02801', 'CAJA 01', 21, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(264, 'TPV02802', 'CAJA02', 21, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(265, 'TPV02803', 'CAJA03', 21, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(266, 'TPV02804', 'CAJA04', 21, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(267, 'TPV02805', 'CAJA05', 21, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(268, 'TPV02806', 'CAJA06', 21, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(269, 'TPV02807', 'CAJA07', 21, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(270, 'TPV02808', 'CAJA08', 21, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(271, 'TPV02901', 'CAJA 01', 22, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(272, 'TPV03001', 'CAJA 01', 23, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(273, 'TPV02902', 'CAJA02', 22, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(274, 'TPV02903', 'CAJA03', 22, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(275, 'TPV02904', 'CAJA04', 22, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(276, 'TPV02905', 'CAJA05', 22, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(277, 'TPV02906', 'CAJA06', 22, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(278, 'TPV02907', 'CAJA07', 22, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(279, 'TPV02908', 'CAJA08', 22, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(280, 'TPV02909', 'CAJA09', 22, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(281, 'TPV03002', 'CAJA02', 23, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(282, 'TPV03003', 'CAJA03', 23, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(283, 'TPV03004', 'CAJA04', 23, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(284, 'TPV03005', 'CAJA05', 23, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(285, 'TPV03006', 'CAJA06', 23, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(286, 'TPV03007', 'CAJA07', 23, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(287, 'TPV03008', 'CAJA08', 23, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(288, 'TPV03009', 'CAJA09', 23, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(289, 'TPV03101', 'CAJA01', 24, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(290, 'TPV03102', 'CAJA02', 24, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(291, 'TPV03103', 'CAJA03', 24, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(292, 'TPV03104', 'CAJA04', 24, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(293, 'TPV03105', 'CAJA05', 24, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(294, 'TPV03106', 'CAJA06', 24, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(295, 'TPV03201', 'CAJA 01', 25, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(296, 'TPV03202', 'CAJA02', 25, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(297, 'TPV03203', 'CAJA03', 25, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(298, 'TPV03204', 'CAJA04', 25, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(299, 'TPV03205', 'CAJA05', 25, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(300, 'TPV03206', 'CAJA06', 25, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(301, 'TPV03207', 'CAJA07', 25, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(302, 'TPV03208', 'CAJA08', 25, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(303, 'TPV03209', 'CAJA09', 25, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(304, 'TPV03107', 'CAJA07', 24, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(305, 'TPV03108', 'CAJA08', 24, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(306, 'TPV03109', 'CAJA09', 24, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(307, 'TPV03301', 'CAJA01', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(308, 'TPV03302', 'CAJA02', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(309, 'TPV03303', 'CAJA03', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(310, 'TPV03304', 'CAJA04 NO USAR', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(311, 'TPV03306', 'CAJA06', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(312, 'TPV03307', 'CAJA07', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(313, 'TPV03305', 'CAJA05', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(314, 'TPV03308', 'CAJA08', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(315, 'TPV03309', 'CAJA09', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(316, 'TPV03310', 'CAJA10', 26, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(317, 'TPV03401', 'CAJA 01', 27, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(318, 'TPV03501', 'CAJA 01', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(319, 'TPV03402', 'CAJA02', 27, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(320, 'TPV03403', 'CAJA03', 27, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(321, 'TPV03404', 'CAJA04', 27, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(322, 'TPV03405', 'CAJA05', 27, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(323, 'TPV03406', 'CAJA06', 27, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(324, 'TPV03407', 'CAJA07', 27, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(325, 'TPV03408', 'CAJA08', 27, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(326, 'TPV03502', 'CAJA02', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(327, 'TPV03503', 'CAJA03', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(328, 'TPV03504', 'CAJA04', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(329, 'TPV03505', 'CAJA05', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(330, 'TPV03506', 'CAJA06', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(331, 'TPV03507', 'CAJA07', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(332, 'TPV03508', 'CAJA08', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(333, 'TPV03509', 'CAJA09', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(334, 'TPV03510', 'CAJA10', 28, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(335, 'TPV01931', 'CAJA31', 15, 1, '2024-02-21 02:35:41', '2024-02-21 02:35:41'),
(336, 'TPV00101', 'CAJA 01', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(337, 'TPV00102', 'CAJA 02', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(338, 'TPV00201', 'CAJA 01', 30, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(339, 'TPV00202', 'CAJA 02', 30, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(340, 'TPV00301', 'CAJA 01', 31, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(341, 'TPV00302', 'CAJA 02 NO USAR', 31, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(342, 'TPV00401', 'CAJA 01', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(343, 'TPV00402', 'CAJA 02', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(344, 'TPV00501', 'CAJA 01', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(345, 'TPV00502', 'CAJA 02', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(346, 'TPV00601', 'CAJA 01', 34, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(347, 'TPV00602', 'CAJA 02', 34, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(348, 'TPV00701', 'CAJA 01', 35, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(349, 'TPV00801', 'CAJA 01', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(350, 'TPV00104', 'CAJA 04', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(351, 'TPV00103', 'CAJA 03', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(352, 'TPV00603', 'CAJA 03', 34, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(353, 'TPV00702', 'CAJA 02 NO USAR', 35, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(354, 'TPV00703', 'CAJA 03', 35, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(355, 'TPV00802', 'CAJA 02', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(356, 'TPV00803', 'CAJA 03', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(357, 'TPV00804', 'CAJA 04', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(358, 'TPV00203', 'CAJA 03', 30, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(359, 'TPV00901', 'CAJA 01', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(360, 'TPV00902', 'CAJA 02', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(361, 'TPV00903', 'CAJA 03', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(362, 'TPV00904', 'CAJA 04', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(363, 'TPV00905', 'CAJA 05', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(364, 'TPV00906', 'CAJA 06', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(365, 'TPV00907', 'CAJA 07', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(366, 'TPV00908', 'CAJA 08', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(367, 'TPV00909', 'CAJA 09', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(368, 'TPV00910', 'CAJA 10', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(369, 'TPV00911', 'CAJA 11', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(370, 'TPV00912', 'CAJA 12', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(371, 'TPV00913', 'CAJA 13', 37, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(372, 'TPV00105', 'CAJA 05 - Manuel Ortega', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(373, 'TPV00204', 'CAJA 04', 30, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(374, 'TPV00303', 'CAJA 03', 31, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(375, 'TPV00304', 'CAJA 04', 31, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(376, 'TPV00805', 'CAJA05', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(377, 'TPV00806', 'CAJA06', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(378, 'TPV00807', 'CAJA07', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(379, 'TPV00808', 'CAJA08', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(380, 'TPV00809', 'CAJA09', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(381, 'TPV00604', 'CAJA04', 34, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(382, 'TPV00605', 'CAJA05', 34, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(383, 'TPV00704', 'CAJ4 04', 35, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(384, 'TPV00811', 'CAJA11', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(385, 'TPV00810', 'CAJA10', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(386, 'TPV00106', 'CAJA06', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(387, 'TPV00107', 'CAJA07', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(388, 'TPV00108', 'CAJA08', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(389, 'TPV00812', 'CAJA12', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(390, 'TPV00813', 'CAJA13', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(391, 'TPV00606', 'CAJA06', 34, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(392, 'TPV00607', 'CAJA07', 34, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(393, 'TPV00608', 'CAJA08', 34, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(394, 'TPV00705', 'CAJA05', 35, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(395, 'TPV00505', 'CAJA05', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(396, 'TPV00814', 'CAJA14', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(397, 'TPV00706', 'CAJA06', 35, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(398, 'TPV00707', 'CAJA07', 35, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(399, 'TPV00708', 'CAJA08', 35, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(400, 'TPV00506', 'CAJA06', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(401, 'TPV00205', 'CAJA05', 30, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(402, 'TPV00305', 'CAJA05', 31, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(403, 'TPV00815', 'CAJA15', 36, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(404, 'TPV01001', 'CAJA 01', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(405, 'TPV01201', 'CAJA 01', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(406, 'TPV01101', 'CAJA 01', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(407, 'TPV01002', 'CAJA 02', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(408, 'TPV01003', 'CAJA 03', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(409, 'TPV01004', 'CAJA04', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(410, 'TPV01005', 'CAJA05', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(411, 'TPV01006', 'CAJA06', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(412, 'TPV01007', 'CAJA07', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(413, 'TPV01008', 'CAJA08', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(414, 'TPV01009', 'CAJA09', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(415, 'TPV01010', 'CAJA10', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(416, 'TPV01102', 'CAJA02', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(417, 'TPV01103', 'CAJA03', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(418, 'TPV01104', 'CAJA04', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(419, 'TPV01105', 'CAJA05', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(420, 'TPV01106', 'CAJA06', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(421, 'TPV01107', 'CAJA07', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(422, 'TPV01108', 'CAJA08', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(423, 'TPV01109', 'CAJA09', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(424, 'TPV01110', 'CAJA10', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(425, 'TPV01111', 'CAJA11', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(426, 'TPV01112', 'CAJA12', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(427, 'TPV00109', 'CAJA09', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(428, 'TPV00110', 'CAJA10', 29, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(429, 'TPV00206', 'CAJA06', 30, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(430, 'TPV01202', 'CAJA02', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(431, 'TPV01203', 'CAJA03', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(432, 'TPV01204', 'CAJA04', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(433, 'TPV01205', 'CAJA05 NO USAR', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(434, 'TPV01206', 'CAJA06', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(435, 'TPV01207', 'CAJA07', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(436, 'TPV01208', 'CAJA08', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(437, 'TPV01209', 'CAJA09', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(438, 'TPV01210', 'CAJA10', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(439, 'TPV01211', 'CAJA11', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(440, 'TPV01212', 'CAJA12', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(441, 'TPV01213', 'CAJA13', 40, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(442, 'TPV01301', 'CAJA01', 41, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(443, 'TPV01011', 'CAJA11', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(444, 'TPV01012', 'CAJA12', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(445, 'TPV01013', 'CAJA13', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(446, 'TPV01014', 'CAJA14', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(447, 'TPV01015', 'CAJA15', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(448, 'TPV01120', 'CAJA20', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(449, 'TPV01121', 'CAJA21', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(450, 'TPV01122', 'CAJA22', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(451, 'TPV01123', 'CAJA23', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(452, 'TPV01124', 'CAJA24', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(453, 'TPV01125', 'CAJA25', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(454, 'TPV01126', 'CAJA26', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(455, 'TPV01127', 'CAJA27', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(456, 'TPV01128', 'CAJA28', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(457, 'TPV01129', 'CAJA29', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(458, 'TPV01113', 'CAJA13', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(459, 'TPV01114', 'CAJA14', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(460, 'TPV01115', 'CAJA15', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(461, 'TPV01116', 'CAJA16', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(462, 'TPV01117', 'CAJA17', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(463, 'TPV01118', 'CAJA18', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(464, 'TPV01119', 'CAJA19', 39, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(465, 'TPV00403', 'CAJA03', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(466, 'TPV00404', 'CAJA04', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(467, 'TPV00405', 'CAJA05', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(468, 'TPV00406', 'CAJA06', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(469, 'TPV00407', 'CAJA07', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(470, 'TPV00408', 'CAJA08', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(471, 'TPV00409', 'CAJA09', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(472, 'TPV00507', 'CAJA07', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(473, 'TPV00508', 'CAJA08', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(474, 'TPV00509', 'CAJA09', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(475, 'TPV00510', 'CAJA10', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(476, 'TPV00511', 'CAJA11', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(477, 'TPV00512', 'CAJA12', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(478, 'TPV00513', 'CAJA13', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(479, 'TPV00514', 'CAJA14', 33, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(480, 'TPV01303', 'CAJA03', 41, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(481, 'TPV01302', 'CAJA02', 41, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(482, 'TPV01304', 'CAJA04', 41, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(483, 'TPV01305', 'CAJA05', 41, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(484, 'TPV01306', 'CAJA06', 41, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(485, 'TPV01307', 'CAJA07', 41, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(486, 'TPV01308', 'CAJA08', 41, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(487, 'TPV01309', 'CAJA09', 41, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(488, 'TPV01401', 'CAJA 01', 42, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(489, 'TPV01402', 'CAJA 02', 42, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(490, 'TPV01403', 'CAJA 03', 42, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(491, 'TPV01404', 'CAJA 04', 42, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(492, 'TPV01501', 'CAJA 01', 43, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(493, 'TPV01601', 'CAJA 01', 44, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(494, 'TPV01701', 'CAJA01', 45, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(495, 'TPV01702', 'CAJA02', 45, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(496, 'TPV01502', 'CAJA 02', 43, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(497, 'TPV01503', 'CAJA 03', 43, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(498, 'TPV01504', 'CAJA 04', 43, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(499, 'TPV01602', 'CAJA 02', 44, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(500, 'TPV01603', 'CAJA 03', 44, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(501, 'TPV01604', 'CAJA 04', 44, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(502, 'TPV01801', 'Caja 01', 46, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(503, 'TPV01703', 'CAJA03', 45, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(504, 'TPV01704', 'CAJA04', 45, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(505, 'TPV00410', 'CAJA10 - NO USAR', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(506, 'TPV00411', 'CAJA11', 32, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(507, 'TPV01802', 'Caja 02', 46, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(508, 'TPV01803', 'Caja 03', 46, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(509, 'TPV01804', 'Caja 04', 46, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(510, 'TPV01016', 'Caja16', 38, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(511, 'TPV00306', 'Caja 06', 31, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(512, 'TPV01901', 'CAJA 01', 47, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(513, 'TPV01902', 'CAJA02', 47, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(514, 'TPV01903', 'CAJA03', 47, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(515, 'TPV01904', 'CAJA04', 47, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(516, 'TPV01905', 'CAJA05', 47, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(517, 'TPV01906', 'CAJA06', 47, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(518, 'TPV01907', 'CAJA07', 47, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(519, 'TPV01908', 'CAJA08', 47, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(520, 'TPV01909', 'CAJA09', 47, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(521, 'TPV02101', 'CAJA 01', 49, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(522, 'TPV02102', 'CAJA 02', 49, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(523, 'TPV02103', 'CAJA 03', 49, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(524, 'TPV02104', 'CAJA 04', 49, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(525, 'TPV02105', 'CAJA 05', 49, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(526, 'TPV02106', 'CAJA 06', 49, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(527, 'TPV02107', 'CAJA 07', 49, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(528, 'TPV02108', 'CAJA 08', 49, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21'),
(529, 'TPV02109', 'CAJA 09', 49, 1, '2024-02-21 02:36:21', '2024-02-21 02:36:21');

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
(1, 'Jhan Carlos Cordoba', '3043711546', '1111663045', 'sistemasaux9@eltemplodelamoda.com.co', '$2y$12$qiWWz8RWBnifFKhCROdRdOXSHVwVe9ZBZK4.B6aKJ5Pfh.Emk8W3G', 5, 1, 2, 5, 51, 2, '2024-02-15 16:19:38', '2023-12-04 06:41:19'),
(2, 'Administrador GRUPO TDM', NULL, '805027653', 'soporte@eltemplodelamoda.com.co', '$2y$12$URua6E9e.DoM3Nt2TzqadOQo0RG2QnM5Hk6a5A7EdemJZNaKMttVK', 5, 1, 1, 83, NULL, NULL, '2023-12-21 15:29:01', '2023-12-04 07:04:03'),
(10, 'Anderson Cordoba', NULL, '1565654465', 'sistemasaux8@eltemplodelamoda.com.co', '$2y$12$RePEIqHaMsIdOsiT1VgfSOBZPhG3sCGXTFpCfAeOi2V8nBmRwFUI6', 5, 1, 7, 24, 51, 2, '2024-02-13 20:56:10', '2023-12-06 20:36:20'),
(11, 'Kelly Gomez', '3123213123', '123456789', 'analistadesistemas@eltemplodelamoda.com.co', '$2y$12$DsPHFtMueUypFjuQyovIeuDIrr3HDOxvVSlEy4rcP6dt8gOnDPPMO', 1, 2, 2, 4, 2, 1, '2024-01-25 16:33:03', '2023-12-06 23:57:46'),
(12, 'Jerson Henao', NULL, '987456123', 'sistemasaux4@eltemplodelamoda.com.co', '$2y$12$3HC5qCgFUCEYrSTJ/xA6X.Vo.i8ScF5atbOECjPIc3uB9GhgLPpou', 5, 2, 2, 5, 50, 2, '2024-02-01 18:50:09', '2023-12-06 23:59:07'),
(13, 'Rodrigo Rodallega', NULL, '94495428', 'csoporte@eltemplodelamoda.com.co', '$2y$12$RePEIqHaMsIdOsiT1VgfSOBZPhG3sCGXTFpCfAeOi2V8nBmRwFUI6', 5, 1, 2, 1, 51, 3, '2023-12-22 14:49:18', '2023-12-09 21:34:32'),
(15, 'Adrian Garcia', NULL, '11929101283', 'sistemasaux10@eltemplodelamoda.com.co', '$2y$12$tG7piyZI5b9hlxEX9poz5efyu/F1gws7CXlbHV03nEkI3Bsf/NspK', 5, 1, 2, 5, 50, 1, '2024-01-31 01:13:59', '2023-12-11 21:44:18'),
(16, 'Jhan Carlos  Cordoba Quiñonez', '3043711546', '123456789', 'sistemasaux20@eltemplodelamoda.com.co', '$2y$12$/qI94Q1wzePQRzejcL924eeSSsl7HIZc8zR/NPYA4LYYY35DUZNzS', 1, 2, 16, 84, NULL, NULL, '2024-01-31 14:09:46', '2023-12-15 23:30:24'),
(17, 'Leonardo Dagua', NULL, '1006011332', 'sistemasaux6@eltemplodelamoda.com.co', '$2y$12$sC.ZixlZ8/dt6WYo7mFiZ.ERWM.1dCgm3nGOIQqq/dBEmy07vFrgO', 1, 1, 2, 5, 1, 2, '2024-02-16 00:59:28', '2024-01-03 19:10:37'),
(18, 'Sebastian Hinestroza', '3167288107', '1107101121', 'sistemasaux2@eltemplodelamoda.com.co', '$2y$12$/QvvaypJYZQjz9vKk8RCC.TxzokbMqyt4bx4ke2gO.z26C/zoQW1.', 1, 1, 2, 2, 52, 3, '2024-02-15 19:08:40', '2024-01-03 19:16:39'),
(19, 'Auxiliar de sistemas', '3016672211', '1006011332', 'sistemasaux11@eltemplodelamoda.com.co', '$2y$12$jbtcwgZHUOUrSsU6kwydu.TaUSevoNGCMk/opUirK2/MdN/WMGXUu', 5, 2, 2, 5, 51, 2, '2024-02-15 15:36:52', '2024-01-15 17:24:10'),
(23, 'Jhan Carlos  Cordoba', NULL, '4545545454', 'sistemasaux21@eltemplodelamoda.com.co', '$2y$12$bqKdR3HogV6HKgZbk2JQzuxFDJ0TK2uIaf8LWEdhJ./a0QrdD/F8q', 1, 2, 16, 84, 1, NULL, '2024-02-05 15:47:40', '2024-01-27 14:54:46'),
(24, 'Jhan Carlos La maravilla', NULL, '12345678910', 'sistemasaux3213@eltemplodelamoda.com.co', '$2y$12$79HW4BRiM3hPCSGEdlRQj.PDv5nh7UwO9jrruU85Zf8hEJiwSQFYC', 1, 1, 3, 6, 1, 2, '2024-02-07 15:02:51', '2024-01-29 16:35:01'),
(25, 'Valeria Garcia', NULL, '1107511528', 'asistentetic@eltemplodelamoda.com.co', '$2y$12$RePEIqHaMsIdOsiT1VgfSOBZPhG3sCGXTFpCfAeOi2V8nBmRwFUI6', 1, 1, 7, 22, NULL, NULL, '2024-02-14 18:52:52', '2024-02-14 23:52:19'),
(26, 'Recepcion TDM', NULL, '111111111', 'recepciontdm@eltemplodelamoda.com.co', '$2y$12$FsSV.BbIp83rMzHYGbDUDOWTOSA9.zW60erZNp88hiCLCat90cP0e', 1, 1, 16, 84, NULL, NULL, '2024-02-14 21:49:32', '2024-02-15 02:49:01'),
(27, 'Beatriz Giraldo', NULL, '29120606', 'contabilidad@eltemplodelamodafresca.com', '$2y$12$G25dZsJKXVunPAL6DJyMl.J1w3DacddtUF9Kbk6.c2cww7NUhrZqK', 2, 1, 10, 41, 54, NULL, '2024-02-19 19:39:08', '2024-02-19 19:38:20'),
(28, 'Yesenia Cantillo', NULL, '222222222222', 'auxiliar2@eltemplodelamodafresca.com', '$2y$12$bUW6ui6jQv0bc8/w.dLQfuVdZaaoEAZiy7P9.GtW7iIFgCtAjjXZK', 2, 1, 10, 43, 49, NULL, '2024-02-20 15:26:37', '2024-02-20 15:26:05'),
(29, 'Gian Carlos Fonseca', NULL, '1096238809', 'tesoreria1@eltemplodelamodafresca.com', '$2y$12$cC3l06roZ525nSteM1W7dOKXmabYBJcEP9lHRBn.EsmzJg65x6lcO', 2, 1, 7, 24, 29, NULL, '2024-02-20 18:40:56', '2024-02-20 18:40:26'),
(30, 'Cindy Paola Guerrero', NULL, '2222222222', 'templo14@eltemplodelamodafresca.com', '$2y$12$KoBZXXTm.W9nZ/KCZU1dreDXYYGlim/fxnrak4bjj7oMD4bsCxaia', 2, 1, 14, 60, 42, NULL, '2024-02-20 18:46:59', '2024-02-20 18:46:26'),
(31, 'Wendy Katherine Dueñas velasco', NULL, '1102369689', 'tesoreria7@eltemplodelamodafresca.com', '$2y$12$9NYVKkgzkKjGP94Dcz4vpumlggqFA/OlB/CBBaZo7Ll/GKyjQXk3u', 2, 1, 7, 24, 35, NULL, '2024-02-20 20:07:55', '2024-02-20 20:07:35');

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
(5, 'shp_contabilidad_10', '2024-02-19_19-40-03.rar', 27, 1, '2024-02-20 00:40:03', '2024-02-20 00:40:03'),
(6, 'shp_contabilidad_7', '2024-02-20_15-28-06.rar', 28, 1, '2024-02-20 20:28:06', '2024-02-20 20:28:06'),
(7, 'shp_tesoreria_1', '2024-02-20_18-41-32.rar', 29, 1, '2024-02-20 23:41:32', '2024-02-20 23:41:32'),
(8, 'shopping_14', '2024-02-20_18-47-44.rar', 30, 1, '2024-02-20 23:47:44', '2024-02-20 23:47:44'),
(9, 'shp_tesoreria_7', '2024-02-20_20-08-59.rar', 31, 1, '2024-02-21 01:08:59', '2024-02-21 01:08:59');

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
-- Volcado de datos para la tabla `wifi_channels`
--

INSERT INTO `wifi_channels` (`id`, `code`, `detail`, `amount`, `date_start`, `date_finish`, `unit_value`, `id_state`, `updated_at`, `created_at`) VALUES
(1, '12341235', 'CLARO', '4', '2024-02-12', '2024-02-26', '40000', 2, '2024-02-15 02:01:02', '2024-02-15 01:02:57'),
(2, '56535698', 'RED DE CLARO 400MB', '3', '2024-02-15', '2025-02-15', '40000', 1, '2024-02-15 21:10:32', '2024-02-15 21:10:32');

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
  ADD KEY `fk_payment_methods_states1_idx` (`id_state`),
  ADD KEY `fk_payment_methods_companies1_idx` (`id_company`);

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
  ADD KEY `fk_tpvs_shops1_idx` (`id_shop`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `characteristics_products`
--
ALTER TABLE `characteristics_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT de la tabla `origins_certificates`
--
ALTER TABLE `origins_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1453;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `rows_certificates`
--
ALTER TABLE `rows_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `spreadsheets`
--
ALTER TABLE `spreadsheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `spreadsheet_rows_tpvs`
--
ALTER TABLE `spreadsheet_rows_tpvs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1977;

--
-- AUTO_INCREMENT de la tabla `spreadsheet_shops`
--
ALTER TABLE `spreadsheet_shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `spreadsheet_tpvs`
--
ALTER TABLE `spreadsheet_tpvs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `tpvs`
--
ALTER TABLE `tpvs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=530;

--
-- AUTO_INCREMENT de la tabla `type_components`
--
ALTER TABLE `type_components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `vpns`
--
ALTER TABLE `vpns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `fk_payment_methods_companies1` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_tpvs_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
