-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 11:29 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(14, 'VENTAS', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(58, 'ASESOR', 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `email` varchar(100) NOT NULL,
  `code` varchar(6) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company`, `updated_at`, `created_at`) VALUES
(1, 'EL TEMPLO DE LA MODA S.A.S', NULL, NULL),
(2, 'SHOPPING TEX', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directories`
--

CREATE TABLE `directories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `directory` varchar(30) NOT NULL,
  `date_create` varchar(45) NOT NULL,
  `date_update` varchar(45) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `id_state` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `d_user` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `priority`, `hour`, `updated_at`, `created_at`) VALUES
(1, 'BAJA', 8, NULL, NULL),
(2, 'MEDIA', 6, NULL, NULL),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_details`
--

CREATE TABLE `report_details` (
  `id` int(11) NOT NULL,
  `report` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `shop` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `state` varchar(45) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state`, `updated_at`, `created_at`) VALUES
(1, 'ACTIVO', NULL, NULL),
(2, 'INACTIVO', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `date_start` varchar(45) NOT NULL,
  `date_finally` varchar(45) NOT NULL,
  `id_priority` int(11) NOT NULL,
  `id_user_sender` int(11) NOT NULL,
  `id_user_destination` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `fk_files_users1_idx` (`id_user`);

--
-- Indexes for table `files_modified`
--
ALTER TABLE `files_modified`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_files_modified_files1_idx` (`id_file`),
  ADD KEY `fk_files_modified_users1_idx` (`d_user`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `directories`
--
ALTER TABLE `directories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files_modified`
--
ALTER TABLE `files_modified`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `fk_files_states1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_files_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `files_modified`
--
ALTER TABLE `files_modified`
  ADD CONSTRAINT `fk_files_modified_files1` FOREIGN KEY (`id_file`) REFERENCES `files` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_files_modified_users1` FOREIGN KEY (`d_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_report_details1` FOREIGN KEY (`id_report_detail`) REFERENCES `report_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reports_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
