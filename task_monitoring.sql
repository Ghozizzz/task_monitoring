-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2022 at 03:06 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_client`
--

CREATE TABLE `m_client` (
  `id` int(11) NOT NULL,
  `nama_client` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_numberings`
--

CREATE TABLE `m_numberings` (
  `id` int(11) NOT NULL,
  `id_toko` int(3) NOT NULL,
  `prefix` varchar(10) NOT NULL,
  `date_info` tinyint(1) NOT NULL,
  `padding` smallint(6) NOT NULL,
  `prefix_separator` varchar(1) NOT NULL,
  `date_separator` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_numbering_details`
--

CREATE TABLE `m_numbering_details` (
  `id` int(11) NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `last_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `roles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `roles`) VALUES
(1, 'ADMIN'),
(2, 'PROJECT MANAGER'),
(3, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `no_task` varchar(191) NOT NULL,
  `tanggal` date NOT NULL,
  `pic_id` int(7) NOT NULL,
  `client_id` int(6) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `flag_delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` int(7) NOT NULL,
  `closed_at` datetime DEFAULT NULL,
  `closed_by` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_detail`
--

CREATE TABLE `task_detail` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_number` varchar(75) NOT NULL,
  `numbering` int(3) NOT NULL,
  `tanggal` date NOT NULL,
  `pic_id` int(7) NOT NULL,
  `notes` text DEFAULT NULL,
  `percentage` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `flag_delete` tinyint(1) NOT NULL DEFAULT 0,
  `level` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_detail_history`
--

CREATE TABLE `task_detail_history` (
  `id` int(11) NOT NULL,
  `task_detail_id` int(11) NOT NULL,
  `task_number` varchar(75) NOT NULL,
  `tanggal` date NOT NULL,
  `pic_id` int(7) NOT NULL,
  `notes` text DEFAULT NULL,
  `percentage` decimal(4,1) NOT NULL DEFAULT 0.0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_history`
--

CREATE TABLE `task_history` (
  `id` int(11) NOT NULL,
  `id_task` int(11) NOT NULL,
  `no_task` varchar(191) NOT NULL,
  `tanggal` date NOT NULL,
  `pic_id` int(7) NOT NULL,
  `client_id` int(6) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `history_remarks` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(250) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_roles` int(2) NOT NULL,
  `last_login` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(3) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `id_roles`, `last_login`, `modified_at`, `modified_by`, `created_at`, `created_by`) VALUES
(1, 'admin', '$2y$10$Qdb5zdQcZ7TfiCY7OQdgm.7VwMu7zmBJSAvhZnHdQyh2Ad9y.Mgay', 'ADMIN', 1, '2022-12-12 15:17:19', '2022-11-23 02:53:49', 1, '0000-00-00 00:00:00', 0),
(8, 'ZAWI', '$2y$10$Xeb/DjLV.4/txLmzojFkE.W8uLNmA8qJEb5/tL0os5aJHChH2MPm6', 'ZAWI', 2, '2022-12-06 16:53:09', '0000-00-00 00:00:00', 0, '2022-11-24 06:05:17', 1),
(9, 'WIDI', '$2y$10$ScgY06qKpHmXk8GH3YPySOEhcYB/rsep96SdTJEIfBb9eCLyKUWCG', 'WIDI', 2, '2022-12-06 16:54:43', '0000-00-00 00:00:00', 0, '2022-11-24 06:05:26', 1),
(10, 'ANDRIE', '$2y$10$IEQxZtADXYafHCkRB8IZLOOWjY1pJsrSfBh5RsQ1/bYjqrxYmrEQ2', 'ANDRIE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2022-11-24 06:05:35', 1),
(11, 'DEDY', '$2y$10$RKXtnTP8hQXJwCqR3gEaPeqVwQmzXwuKBoRAkGHy2p6jlBHiG25ee', 'DEDY', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2022-11-24 06:05:56', 1),
(12, 'FIKRI', '$2y$10$NF8O5b.K93lWCWRGJu9GC.KkZjtO.U/Wpf2zgWmdW1M3cjPo5Hb5i', 'FIKRI', 3, '2022-12-06 16:55:09', '0000-00-00 00:00:00', 0, '2022-11-24 06:07:21', 1),
(13, 'GAMAL', '$2y$10$RALA3.tKohzqlmorZP7mDeVXxOuSu.t/tA2/4h8qULxikSfn2Uexu', 'GAMAL', 3, '2022-12-12 14:48:01', '0000-00-00 00:00:00', 0, '2022-11-24 06:07:29', 1),
(14, 'LUTFI', '$2y$10$QdFQ353OrS77qMvo0Pcviu42fz0TdOpgBH2Tfmk27bH5Hb4L5OK9m', 'LUTFI', 3, '2022-12-12 14:50:00', '0000-00-00 00:00:00', 0, '2022-11-24 06:07:40', 1),
(15, 'ZAWI USER', '$2y$10$ecjb0455gSUU9UbMa4aWH.KnjXUg/GOZpLCRIJXcYER.ZcN/zMAUO', 'ZAWI USER', 3, '2022-12-08 15:18:09', '0000-00-00 00:00:00', 0, '2022-12-02 10:56:46', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_client`
--
ALTER TABLE `m_client`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `m_numberings`
--
ALTER TABLE `m_numberings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `m_numbering_details`
--
ALTER TABLE `m_numbering_details`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `task_detail`
--
ALTER TABLE `task_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `task_detail_history`
--
ALTER TABLE `task_detail_history`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `task_history`
--
ALTER TABLE `task_history`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_client`
--
ALTER TABLE `m_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_numberings`
--
ALTER TABLE `m_numberings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_numbering_details`
--
ALTER TABLE `m_numbering_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_detail`
--
ALTER TABLE `task_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_detail_history`
--
ALTER TABLE `task_detail_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_history`
--
ALTER TABLE `task_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
