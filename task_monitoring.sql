-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2022 at 03:02 AM
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

--
-- Dumping data for table `m_client`
--

INSERT INTO `m_client` (`id`, `nama_client`, `alamat`, `modified_at`, `modified_by`, `created_at`, `created_by`) VALUES
(67, 'Honda MAM', 'All MAM ', NULL, NULL, '2022-11-24 06:04:56', 1),
(68, 'Toyota Anzon', '-', NULL, NULL, '2022-12-02 10:04:00', 1),
(69, 'Honda Bintaro', 'Honda Bintaro', NULL, NULL, '2022-12-02 10:16:12', 1),
(70, 'Honda Cibubur', 'Honda Cibubur', NULL, NULL, '2022-12-02 10:20:01', 1),
(71, 'Hino MGI', 'Hino MGI', NULL, NULL, '2022-12-02 10:20:12', 1),
(72, 'Dealer Jateng', 'Dealer Jateng', NULL, NULL, '2022-12-02 10:20:40', 1),
(73, 'Honda IKB', 'Honda IKB', NULL, NULL, '2022-12-02 10:21:12', 1),
(74, 'Honda Kumala', 'Honda Kumala', NULL, NULL, '2022-12-02 10:21:32', 1),
(75, 'Honda Sunter', 'Honda Sunter', NULL, NULL, '2022-12-02 10:22:33', 1),
(76, 'HPM', 'HPM', NULL, NULL, '2022-12-02 10:22:47', 1),
(77, 'All Client', 'All Client', NULL, NULL, '2022-12-02 10:23:20', 1),
(78, 'Toyota Intercom', 'Toyota Intercom', NULL, NULL, '2022-12-02 10:23:43', 1),
(79, 'Honda Arta Cikupa', 'Honda Arta Cikupa', NULL, NULL, '2022-12-02 10:23:58', 1),
(80, 'Chery Arta Cikupa', 'Chery Arta Cikupa', NULL, NULL, '2022-12-02 10:24:07', 1),
(81, 'Honda Bone', 'Honda Bone', NULL, NULL, '2022-12-02 10:42:41', 1),
(82, 'TBD', 'TBD', NULL, NULL, '2022-12-02 10:44:18', 1);

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

--
-- Dumping data for table `m_numberings`
--

INSERT INTO `m_numberings` (`id`, `id_toko`, `prefix`, `date_info`, `padding`, `prefix_separator`, `date_separator`) VALUES
(1, 0, 'PROJECT', 1, 4, '.', '.');

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

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `no_task`, `tanggal`, `pic_id`, `client_id`, `notes`, `status`, `flag_delete`, `created_at`, `created_by`, `closed_at`, `closed_by`) VALUES
(1, 'Hansa Renkei', '2022-12-23', 8, 68, 'Create Program Hansa Renkei', 0, 0, '2022-12-08 09:11:13', 1, NULL, NULL),
(2, 'Digital Dokumen MAM', '2023-01-11', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 0, '2022-12-12 09:57:19', 1, NULL, NULL),
(3, 'Digital Dokumen Bintaro', '2022-12-12', 8, 69, 'PDF Faktur, Kwitansi, TTS', 0, 0, '2022-12-08 09:02:44', 1, NULL, NULL),
(4, 'Digital Dokumen Cibubur', '2022-12-15', 8, 70, 'PDF Faktur dan Kwitansi', 0, 0, '2022-12-08 09:03:19', 1, NULL, NULL),
(5, 'JACB Jateng', '2022-12-15', 8, 72, 'Implementasi JACB ke Dealer Jateng - Tunggu Request Dealer', 0, 0, '2022-12-08 09:04:37', 1, NULL, NULL),
(6, 'e-Meterai IKB', '2022-12-30', 8, 73, 'PDF Faktur dan Stamping e-Meterai', 0, 0, '2022-12-02 10:36:09', 1, NULL, NULL),
(7, 'List Request Karawang', '2022-12-13', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 0, '2022-12-08 09:06:34', 1, NULL, NULL),
(8, 'Standarisasi Master Tipe Kumala', '2022-12-15', 8, 74, 'Standarisasi untuk Master Tipe di Honda Karawang dan Cikampek untuk Kebutuhan Transfer in out via API', 0, 0, '2022-12-08 07:45:42', 1, NULL, NULL),
(9, 'List Request IKB BP (Pradana) ', '2022-12-15', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 0, '2022-12-12 07:49:39', 13, NULL, NULL),
(10, 'Insentif Sunter', '2022-12-08', 8, 75, 'Laporan - Laporan insentif Honda Sunter', 0, 0, '2022-12-02 10:40:35', 1, NULL, NULL),
(11, 'Monthly Meeting MGI', '2022-12-16', 8, 71, 'Monthly Meeting tiap hari selasa jam 10', 0, 0, '2022-12-08 09:08:14', 1, NULL, NULL),
(12, 'Implementasi Chery Arta Cikupa', '2022-12-15', 8, 80, 'Implementasi Dealer Chery Arta Cikupa', 0, 0, '2022-12-12 09:58:26', 1, NULL, NULL),
(13, 'Implementasi Honda Bone', '2022-12-14', 8, 81, 'Implementasi Honda Bone', 0, 0, '2022-12-08 09:09:18', 1, NULL, NULL),
(14, 'Implementasi Hyundai Batam', '2022-12-15', 8, 82, 'Implementasi Hyundai Batam', 0, 0, '2022-12-08 09:11:30', 1, NULL, NULL),
(15, 'Project management review', '2022-12-13', 8, 82, 'Project management review', 0, 0, '2022-12-08 09:10:17', 1, NULL, NULL),
(16, 'Standard Tasklist HPM (Remapping)', '2022-12-09', 8, 76, 'Standard Tasklist HPM (Remapping)', 0, 0, '2022-12-02 10:45:53', 1, NULL, NULL),
(17, 'Penghapusan Piutang Honda Sunter', '2022-12-15', 8, 75, 'Penghapusan Piutang Honda Sunter sampai 31 Des 2021', 0, 0, '2022-12-02 10:46:31', 1, NULL, NULL),
(18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-07', 8, 73, 'Laporan pemakaian point dari Apps', 0, 0, '2022-12-08 02:27:37', 14, NULL, NULL),
(19, 'Suara untuk QMS', '2022-12-09', 8, 77, 'Update Suara baru dan demo', 0, 0, '2022-12-06 06:54:06', 1, NULL, NULL),
(20, 'List Request Intercom', '2022-12-09', 8, 78, 'List Request Intercom', 0, 0, '2022-12-08 06:22:05', 13, NULL, NULL),
(21, 'Sync Dashboard MAM', '2022-12-13', 8, 67, 'Program Sync Dashboard MAM', 0, 0, '2022-12-08 10:29:20', 1, NULL, NULL),
(22, 'AP Accessories Local Arta Cikupa', '2022-12-08', 8, 79, 'AP Accessories Local Arta Cikupa', 0, 0, '2022-12-08 08:20:36', 15, NULL, NULL),
(23, 'Dokumen Manual DP untuk HPM', '2022-12-08', 8, 77, 'Dokumen Manual DP untuk HPM', 1, 0, '2022-12-07 02:46:19', 1, '2022-12-08 08:21:07', 15),
(24, 'Project Testing', '2023-01-31', 9, 72, 'Testing Error', 0, 0, '2022-12-12 10:07:51', 1, NULL, NULL);

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

--
-- Dumping data for table `task_detail`
--

INSERT INTO `task_detail` (`id`, `task_id`, `task_number`, `numbering`, `tanggal`, `pic_id`, `notes`, `percentage`, `status`, `flag_delete`, `level`, `parent_id`, `created_at`, `created_by`) VALUES
(1, 1, 'Task 1', 1, '2022-12-07', 13, 'Review Hasil Live 23 November', 100, 0, 0, 1, 0, '2022-12-06 04:56:49', 13),
(2, 2, 'Task 1', 1, '2023-01-11', 13, 'Implementasi Honda BSB', 61, 0, 0, 1, 0, '2022-12-12 10:33:46', 1),
(3, 2, 'Task 1.1', 1, '2022-12-09', 13, 'Review dan Adjusment PDF dengan Melly dan Anwar -> sudah difollow up dan belum ada respon -> sudah followup dan ingin langsung kirim wa ke customer', 100, 0, 0, 2, 2, '2022-12-07 13:22:54', 13),
(4, 3, 'Task 1', 1, '2022-12-05', 12, 'Followup E-meterai menggunakan distributor yang mana', 98, 0, 0, 1, 0, '2022-12-06 09:46:50', 12),
(5, 4, 'Task 1', 1, '2022-12-15', 12, 'Followup E-meterai menggunakan distributor pajakku.com', 98, 0, 0, 1, 0, '2022-12-08 09:03:19', 1),
(6, 6, 'Task 1', 1, '2022-12-09', 15, 'Coding Titik Pengiriman Email ke Customer', 0, 0, 0, 1, 0, '2022-12-02 10:57:15', 1),
(7, 6, 'Task 2', 2, '2022-12-05', 15, 'Dokumen SIT', 100, 0, 0, 1, 0, '2022-12-05 06:34:55', 1),
(8, 6, 'Task 2.1', 1, '2022-12-02', 1, 'Pengisian Dokumen SIT', 100, 0, 0, 2, 7, '2022-12-02 10:58:24', 1),
(9, 6, 'Task 2.2', 2, '2022-12-05', 1, 'Pengiriman Dokumen SIT', 100, 0, 0, 2, 7, '2022-12-05 06:34:55', 1),
(10, 1, 'Task 1.1', 1, '2022-12-05', 13, 'Jadwalkan Meeting dengan Ibu Lisa', 100, 0, 0, 2, 1, '2022-12-05 04:38:39', 13),
(11, 1, 'Task 1.2', 2, '2022-12-06', 13, 'Meeting Review -> 1. TAMBAHAN TAMPILAN NO KTP DAN NPWP DI CR1. 2. TAMBAH NO SPK. 3. RESCHEDULE BOOKING. 4. DI HISTORY CRC TAMBAHKAN NO SPK DAN TGL LAHIR. 5. PISAH CATATAN ANTARA MRA DAN CRC. 6. PERBAIKAN HISTORY CRC -> MRA UPDATE TER INSERT DI HISTORY CRC. 7. KOLOM TABEL DI RAPIHKAN PANJANGNYA. 8. REPORT FORMAT TAM /u. MRA. 9. REPORT FORMAT I CARE /u. CRC. 10. PERBAIKAN FAKTUR KE TAM JANGAN MASUK', 100, 0, 0, 2, 1, '2022-12-06 04:56:49', 13),
(12, 3, 'Task 1.1', 1, '2022-12-05', 12, 'Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul - > di lanjut bang zawi', 95, 0, 0, 2, 4, '2022-12-06 09:46:50', 12),
(13, 18, 'Task 1', 1, '2022-12-07', 14, 'Pembuatan Laporan Pemakaian', 50, 0, 0, 1, 0, '2022-12-08 02:27:37', 14),
(14, 13, 'Task 1', 1, '2022-12-14', 15, 'Review GL ', 67, 0, 0, 1, 0, '2022-12-08 09:09:18', 1),
(15, 13, 'Task 1.1', 1, '2022-12-05', 1, 'Meeting Review -> Pindah hari jadi senin -> Review Kembali Tgl 8 untuk closing Oktober', 100, 0, 0, 2, 14, '2022-12-05 05:07:08', 1),
(16, 13, 'Task 1.2', 2, '2022-12-14', 0, 'Review Untuk Closing Oktober', 0, 0, 0, 2, 14, '2022-12-08 09:09:18', 1),
(17, 3, 'Task 1.2', 2, '2022-12-05', 12, 'Sedang koordinasi dengan pak abdul', 100, 0, 0, 2, 4, '2022-12-05 09:36:50', 12),
(18, 7, 'Task 1', 1, '2022-12-12', 12, 'Update Tambahan Laporan Insentif', 80, 0, 0, 1, 0, '2022-12-08 09:05:25', 1),
(19, 8, 'Task 1', 1, '2022-12-13', 12, 'Jadwalkan Meeting dengan Cikampek dan Karawang', 0, 0, 0, 1, 0, '2022-12-05 06:38:35', 1),
(20, 9, 'Task 1', 1, '2022-12-15', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', 80, 0, 0, 1, 0, '2022-12-12 07:49:39', 13),
(21, 9, 'Task 2', 2, '2022-12-08', 13, 'Followup Device Otomanager -> follow up ke Ko Hengki. device belum lengkap. ko hengki akan diskusi dengan manager karang tengah', 100, 0, 0, 1, 0, '2022-12-08 04:07:05', 13),
(22, 10, 'Task 1', 1, '2022-12-06', 15, 'Cek insentif dengan Rio', 80, 0, 0, 1, 0, '2022-12-06 14:08:11', 15),
(23, 10, 'Task 1.1', 1, '2022-12-06', 15, 'Sudah diupdate - Rio sedang cek dengan user', 80, 0, 0, 2, 22, '2022-12-06 14:08:11', 15),
(24, 11, 'Task 1', 1, '2022-12-13', 12, 'Inputan faktur polisi gabungan dan form', 0, 0, 0, 1, 0, '2022-12-08 09:08:33', 1),
(25, 11, 'Task 2', 2, '2022-12-16', 13, 'Menu Surat Tagihan Leasing Gabungan dan Form Tiap Leasing', 0, 0, 0, 1, 0, '2022-12-08 09:08:14', 1),
(26, 12, 'Task 1', 1, '2022-12-12', 15, 'Coding untuk Standard menjadi Versi Cabang (Hanya di awalan transaksi)', 0, 0, 0, 1, 0, '2022-12-05 06:44:17', 1),
(27, 12, 'Task 2', 2, '2022-12-12', 15, 'After Sales Migrasi ke Desktop', 0, 0, 0, 1, 0, '2022-12-05 06:44:31', 1),
(28, 12, 'Task 3', 3, '2022-12-12', 15, 'SPK upload seperti H-Diary', 0, 0, 0, 1, 0, '2022-12-05 06:44:47', 1),
(29, 16, 'Task 1', 1, '2022-12-05', 15, 'Email Timeline dan Status Update ke Pak Andri', 100, 0, 0, 1, 0, '2022-12-05 07:43:20', 15),
(30, 16, 'Task 2', 2, '2022-12-05', 12, 'Status Update Dealer', 100, 0, 0, 1, 0, '2022-12-12 08:00:40', 14),
(31, 16, 'Task 3', 3, '2022-12-05', 14, 'Status Update Dealer', 89, 0, 0, 1, 0, '2022-12-09 04:27:36', 14),
(32, 16, 'Task 4', 4, '2022-12-08', 13, 'Status Update Dealer', 100, 0, 0, 1, 0, '2022-12-08 03:56:28', 13),
(33, 17, 'Task 1', 1, '2022-12-08', 15, 'Tunggu Data Dari Pak Roni', 0, 0, 0, 1, 0, '2022-12-05 06:47:55', 1),
(34, 22, 'Task 1', 1, '2022-12-06', 15, 'Jurnal Pembelian = Persediaan pada Hutang\nJurnal Accessories Purna Jual = Hpp pada Persediaan', 100, 0, 0, 1, 0, '2022-12-06 14:05:29', 1),
(35, 21, 'Task 1', 1, '2022-12-13', 12, 'Closing Harian Sync Dashboard + check status sync terakhir kirim ke WA ', 0, 0, 0, 1, 0, '2022-12-08 10:29:20', 1),
(36, 6, 'Task 3', 3, '2022-12-09', 15, 'Tambahin field , nomor keluar part buat partshop', 0, 0, 0, 1, 0, '2022-12-05 07:17:41', 1),
(37, 20, 'Task 1', 1, '2022-12-09', 13, 'Order, Penerimaan, dan Pembebanan Accessories', 100, 0, 0, 1, 0, '2022-12-12 07:49:22', 13),
(38, 13, 'Task 1.3', 3, '2022-12-07', 15, 'Sudah Update Saldo Awal Part dan Bahan untuk Persediaan Awal GL', 100, 0, 0, 2, 14, '2022-12-07 06:58:45', 15),
(39, 19, 'Task 1', 1, '2022-12-09', 13, 'Sesuaikan dengan sound lain', 0, 0, 0, 1, 0, '2022-12-06 06:54:06', 1),
(40, 3, 'Task 1.3', 3, '2022-12-05', 12, 'Info dari Pak Abdul Bu henny nya sedang cuti', 100, 0, 0, 2, 4, '2022-12-05 09:36:33', 12),
(41, 4, 'Task 1.1', 1, '2022-12-15', 1, 'Sedang koordinasi dengan Pak Alfons', 95, 0, 0, 2, 5, '2022-12-08 09:03:19', 1),
(42, 18, 'Task 1.1', 1, '2022-12-05', 14, 'Sudah dikirim ke server fatmawati', 100, 0, 0, 2, 13, '2022-12-05 09:52:40', 14),
(43, 18, 'Task 1.2', 2, '2022-12-07', 14, 'Info dari pak fauzan : Untuk data point belum dicoba karena beliau sedang sakit. Dan kemarin di follow up belum bisa dibuka. Dan ketika mau remote beliau sedang sibuk mengerjakan laporan', 0, 0, 0, 2, 13, '2022-12-08 02:27:37', 14),
(44, 4, 'Task 1.2', 2, '2022-12-05', 12, 'info dari pak alfons Masih pembahasan di manangement ', 100, 0, 0, 2, 5, '2022-12-05 09:58:38', 12),
(45, 16, 'Task 2.1', 1, '2022-12-05', 12, 'HONDA PERMATA SERPONG', 100, 0, 0, 2, 30, '2022-12-05 10:14:57', 12),
(46, 16, 'Task 4.1', 1, '2022-12-05', 13, 'Dealer IKM HA', 100, 0, 0, 2, 32, '2022-12-05 10:16:03', 13),
(47, 16, 'Task 3.1', 1, '2022-12-05', 14, 'Honda Mam Setiabudi (Kurang Ubah Tampilan Estimasi WO)', 80, 0, 0, 2, 31, '2022-12-05 10:17:44', 14),
(48, 16, 'Task 2.2', 2, '2022-12-05', 14, 'HONDA ARTA CIKUPA', 100, 0, 0, 2, 30, '2022-12-12 08:00:40', 14),
(49, 16, 'Task 3.2', 2, '2022-12-06', 14, 'Honda Amartha Samarinda', 100, 0, 0, 2, 31, '2022-12-06 01:59:24', 14),
(50, 16, 'Task 3.3', 3, '2022-12-06', 14, 'Honda Nusantara Samarinda', 100, 0, 0, 2, 31, '2022-12-06 01:59:46', 14),
(51, 3, 'Task 2', 2, '2022-12-12', 12, 'Hit API WA Bussiness', 67, 0, 0, 1, 0, '2022-12-08 09:02:44', 1),
(52, 16, 'Task 3.4', 4, '2022-12-06', 14, 'Honda Nusantara Balikpapan', 100, 0, 0, 2, 31, '2022-12-06 03:41:39', 14),
(53, 16, 'Task 3.5', 5, '2022-12-06', 14, 'Pekalongan Motor', 100, 0, 0, 2, 31, '2022-12-06 04:49:34', 14),
(54, 1, 'Task 2', 2, '2022-12-23', 13, 'Maintenance Hansa Renkei Live 23 November 2022', 0, 0, 0, 1, 0, '2022-12-08 09:11:13', 1),
(55, 16, 'Task 4.2', 2, '2022-12-06', 13, 'HONDA AUTOLAND CIPUTAT', 100, 0, 0, 2, 32, '2022-12-06 06:44:08', 13),
(56, 16, 'Task 4.3', 3, '2022-12-06', 13, 'HONDA SLS 2', 100, 0, 0, 2, 32, '2022-12-06 07:17:48', 13),
(57, 16, 'Task 4.4', 4, '2022-12-06', 13, 'HONDA SLS PALOPO', 100, 0, 0, 2, 32, '2022-12-06 07:18:56', 13),
(58, 16, 'Task 4.5', 5, '2022-12-06', 13, 'MAM JEPARA', 100, 0, 0, 2, 32, '2022-12-06 07:34:54', 13),
(59, 16, 'Task 4.6', 6, '2022-12-08', 13, 'ANUGERAH SEJAHTERA MGL', 100, 0, 0, 2, 32, '2022-12-08 03:56:28', 13),
(60, 16, 'Task 4.7', 7, '2022-12-08', 13, 'TUNAS JAYA', 100, 0, 0, 2, 32, '2022-12-08 03:45:46', 13),
(61, 16, 'Task 4.8', 8, '2022-12-08', 13, 'Honda Pati Jaya', 100, 0, 0, 2, 32, '2022-12-06 07:49:09', 13),
(62, 16, 'Task 4.9', 9, '2022-12-08', 13, 'Honda Salatiga Jaya', 100, 0, 0, 2, 32, '2022-12-06 08:07:28', 13),
(63, 16, 'Task 4.10', 10, '2022-12-08', 13, 'Honda Kumala Cikampek', 100, 0, 0, 2, 32, '2022-12-06 08:17:31', 13),
(64, 16, 'Task 3.6', 6, '2022-12-06', 14, 'Eiyu kurang yg estimasi wo dan rpt estimasi', 80, 0, 0, 2, 31, '2022-12-06 09:44:57', 14),
(65, 3, 'Task 2.1', 1, '2022-12-06', 12, 'Hit API', 100, 0, 0, 2, 51, '2022-12-06 09:45:25', 12),
(66, 3, 'Task 2.2', 2, '2022-12-06', 12, 'Tambah Function di controller', 100, 0, 0, 2, 51, '2022-12-06 09:45:52', 12),
(67, 3, 'Task 2.3', 3, '2022-12-12', 1, 'Testting', 0, 0, 0, 2, 51, '2022-12-08 09:02:44', 1),
(68, 7, 'Task 2', 2, '2022-12-13', 12, 'Fitur Alokas Kendaraan', 0, 0, 0, 1, 0, '2022-12-08 09:06:34', 1),
(69, 7, 'Task 1.1', 1, '2022-12-06', 12, 'Tambah Menu Alokasi Kendaraan', 100, 0, 0, 2, 18, '2022-12-06 09:49:01', 12),
(70, 7, 'Task 1.2', 2, '2022-12-06', 12, 'Tambah Laporan SPK VS Unit & Alokasi', 100, 0, 0, 2, 18, '2022-12-06 10:40:38', 12),
(71, 7, 'Task 1.3', 3, '2022-12-06', 12, 'Koneksikan ke matching otomatis pilih norangka sesuai dengan alokasi', 100, 0, 0, 2, 18, '2022-12-06 11:01:14', 12),
(72, 7, 'Task 1.4', 4, '2022-12-06', 12, 'Pilih Alokasi di Pembelian', 100, 0, 0, 2, 18, '2022-12-06 10:40:47', 12),
(73, 7, 'Task 1.5', 5, '2022-12-12', 12, 'REVIEW PROGRAM DAN LAPORAN', 0, 0, 0, 2, 18, '2022-12-08 09:05:25', 1),
(74, 23, 'Task 1', 1, '2022-12-07', 15, 'Sudah Kirim ke Pak Dedy', 100, 0, 0, 1, 0, '2022-12-07 07:54:47', 15),
(75, 16, 'Task 3.7', 7, '2022-12-07', 14, 'Honda Cilacap', 100, 0, 0, 2, 31, '2022-12-07 03:44:53', 14),
(76, 16, 'Task 3.8', 8, '2022-12-07', 14, 'Honda Perdana Sukabumi Kurang Estimasi WO', 80, 0, 0, 2, 31, '2022-12-07 08:17:52', 14),
(77, 16, 'Task 3.9', 9, '2022-12-07', 14, 'Pondok Cabe', 100, 0, 0, 2, 31, '2022-12-07 09:17:57', 14),
(78, 20, 'Task 1.1', 1, '2022-12-07', 13, 'Order Accessories', 100, 0, 0, 2, 37, '2022-12-07 13:24:29', 13),
(79, 20, 'Task 1.2', 2, '2022-12-07', 13, 'Penerimaan Accessories', 100, 0, 0, 2, 37, '2022-12-07 13:24:42', 13),
(80, 20, 'Task 1.3', 3, '2022-12-08', 13, 'Pembebanan Accessories', 100, 0, 0, 2, 37, '2022-12-08 06:22:18', 13),
(81, 16, 'Task 3.10', 10, '2022-12-08', 14, 'Honda Naga Motor', 100, 0, 0, 2, 31, '2022-12-08 02:07:22', 14),
(82, 16, 'Task 3.11', 11, '2022-12-08', 14, 'Honda Mulya Putra', 100, 0, 0, 2, 31, '2022-12-08 03:05:45', 14),
(83, 16, 'Task 3.12', 12, '2022-12-08', 14, 'Honda Kusuma', 100, 0, 0, 2, 31, '2022-12-08 03:31:29', 14),
(84, 16, 'Task 3.13', 13, '2022-12-08', 14, 'Honda Istana Carindo Kurang yg Estimasi WO', 80, 0, 0, 2, 31, '2022-12-08 05:00:16', 14),
(85, 20, 'Task 1.4', 4, '2022-12-09', 13, 'Kirim Exe Ke Intercom', 100, 0, 0, 2, 37, '2022-12-12 07:49:22', 13),
(86, 22, 'Task 2', 2, '2022-12-08', 15, 'Update Journal Penjualan Accessories Biaya pada Persediaan', 0, 0, 0, 1, 0, '2022-12-08 08:20:36', 15),
(87, 2, 'Task 1.2', 2, '2022-12-09', 0, 'Sudah Meeting, MAM akan diskusikan dengan management untuk sewa cloud sendiri', 100, 0, 0, 2, 2, '2022-12-12 07:42:54', 1),
(88, 15, 'Task 1', 1, '2022-12-13', 15, 'Pindahkan Source ke Hosting Four Best', 0, 0, 0, 1, 0, '2022-12-08 09:10:17', 1),
(89, 19, 'Task 2', 2, '2022-12-09', 13, 'Update Sound Baru ke All Toyota', 0, 0, 0, 1, 0, '2022-12-08 10:28:34', 1),
(90, 16, 'Task 3.14', 14, '2022-12-09', 14, 'Honda Mulai Cianjur Selesai Faktur\nWo dan Estimasi WO beda format, masih ditanyakan untuk ubah format', 30, 0, 0, 2, 31, '2022-12-09 04:27:36', 14),
(91, 2, 'Task 1.1', 1, '2022-12-15', 0, 'Tunggu Informasi Sewa Cloud Server', 0, 0, 0, 2, 1, '2022-12-12 07:43:25', 1),
(92, 2, 'Task 1.2', 2, '2022-12-26', 0, 'test error', 0, 0, 0, 2, 1, '2022-12-12 08:18:29', 1),
(93, 2, 'Task 2', 2, '2022-12-07', 13, 'Task 2 nih', 0, 0, 0, 1, 0, '2022-12-12 09:57:57', 1),
(94, 2, 'Task 2.1', 1, '2022-12-29', 13, 'Task 2 bawahnya', 0, 0, 0, 2, 93, '2022-12-12 09:53:22', 1),
(95, 2, 'Task 1.3', 3, '2023-01-11', 0, 'Task 1 bawahnya', 45, 0, 0, 2, 2, '2022-12-12 09:57:33', 1),
(96, 2, 'Task 2.2', 2, '2022-12-13', 13, '', 0, 0, 0, 2, 93, '2022-12-12 09:57:57', 1),
(97, 2, 'Task 3', 3, '2022-12-16', 14, '', 0, 0, 0, 1, 0, '2022-12-12 09:58:10', 1),
(98, 12, 'Task 4', 4, '2022-12-15', 15, '', 0, 0, 0, 1, 0, '2022-12-12 09:58:41', 1),
(99, 12, 'Task 4.1', 1, '2022-12-15', 0, 'cherry', 0, 0, 0, 2, 98, '2022-12-12 09:58:41', 1),
(100, 24, 'Task 1', 1, '2022-12-14', 13, 'Apakah Bisa', 24, 0, 0, 1, 0, '2022-12-12 10:09:11', 1),
(101, 24, 'Task 2', 2, '2022-12-07', 13, 'Iya bisa', 12, 0, 0, 1, 0, '2022-12-12 10:09:49', 1),
(102, 24, 'Task 1.1', 1, '2022-12-15', 1, 'Bisa dong', 10, 0, 0, 2, 100, '2022-12-12 10:09:02', 1),
(103, 24, 'Task 1.2', 2, '2022-12-15', 1, 'Lanjut', 38, 0, 0, 2, 100, '2022-12-12 10:09:11', 1),
(104, 24, 'Task 2.1', 1, '2022-12-23', 1, 'Kurang', 12, 0, 0, 2, 101, '2022-12-12 10:09:49', 1),
(105, 2, 'Task 1.4', 4, '2022-12-14', 13, 'PIC siapa', 0, 0, 0, 2, 2, '2022-12-12 10:33:46', 1);

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

--
-- Dumping data for table `task_detail_history`
--

INSERT INTO `task_detail_history` (`id`, `task_detail_id`, `task_number`, `tanggal`, `pic_id`, `notes`, `percentage`, `status`, `parent_id`, `created_at`, `created_by`) VALUES
(1, 2, 'Task 1', '2022-12-09', 13, 'Review dan Adjusment PDF dengan Melly dan Anwar', '0.0', 0, 0, '2022-12-02 10:10:17', 1),
(2, 8, 'Task 2.1', '2022-12-02', 1, 'Pengisian Dokumen SIT', '0.0', 0, 0, '2022-12-02 10:58:17', 1),
(3, 10, 'Task 1.1', '2022-12-05', 1, 'Jadwalkan Meeting dengan Ibu Lisa', '0.0', 0, 0, '2022-12-05 04:36:07', 1),
(4, 4, 'Task 1', '2022-12-05', 12, 'Followup E-meterai menggunakan distributor yang mana', '0.0', 0, 0, '2022-12-02 10:19:11', 1),
(5, 4, 'Task 1', '2022-12-05', 12, 'Followup E-meterai menggunakan distributor yang mana -> Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul', '50.0', 0, 0, '2022-12-05 04:47:34', 12),
(6, 12, 'Task 1.1', '2022-12-05', 12, 'Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul', '100.0', 0, 0, '2022-12-05 04:49:46', 12),
(7, 15, 'Task 1.1', '2022-12-03', 1, 'Meeting Review ', '0.0', 0, 0, '2022-12-05 05:05:46', 1),
(8, 15, 'Task 1.1', '2022-12-05', 1, 'Meeting Review -> Pindah hari jadi senin', '0.0', 0, 0, '2022-12-05 05:06:09', 1),
(9, 9, 'Task 2.2', '2022-12-03', 1, 'Pengiriman Dokumen SIT', '0.0', 0, 0, '2022-12-02 10:58:39', 1),
(10, 26, 'Task 1', '2022-12-12', 12, 'Coding untuk Standard menjadi Versi Cabang (Hanya di awalan transaksi)', '0.0', 0, 0, '2022-12-05 06:44:04', 1),
(11, 31, 'Task 3', '2022-12-05', 13, 'Status Update Dealer', '0.0', 0, 0, '2022-12-05 06:47:08', 1),
(12, 34, 'Task 1', '2022-12-05', 15, 'Jurnal Transaksi GL', '0.0', 0, 0, '2022-12-05 06:54:00', 1),
(13, 34, 'Task 1', '2022-12-05', 15, 'Followup Jurnal Transaksi GL', '0.0', 0, 0, '2022-12-05 06:55:02', 1),
(14, 35, 'Task 1', '2022-12-08', 12, 'Closing Harian Sync Dashboard', '0.0', 0, 0, '2022-12-05 06:56:55', 1),
(15, 29, 'Task 1', '2022-12-05', 15, 'Email Timeline dan Status Update ke Pak Andri', '0.0', 0, 0, '2022-12-05 06:46:39', 1),
(16, 3, 'Task 1.1', '2022-12-09', 1, 'Review dan Adjusment PDF dengan Melly dan Anwar', '0.0', 0, 0, '2022-12-02 10:11:37', 1),
(17, 17, 'Task 1.2', '2022-12-05', 12, 'Sedang koordinasi dengan pak abdul', '50.0', 0, 0, '2022-12-05 06:16:58', 12),
(18, 48, 'Task 2.2', '2022-12-05', 12, 'HONDA ARTA CIKUPA', '0.0', 0, 0, '2022-12-05 10:25:55', 12),
(19, 41, 'Task 1.1', '2022-12-05', 12, 'Sedang koordinasi dengan Pak Alfons', '50.0', 0, 0, '2022-12-05 09:37:59', 12),
(20, 41, 'Task 1.1', '2022-12-05', 12, 'Sedang koordinasi dengan Pak Alfons', '100.0', 0, 0, '2022-12-06 03:04:47', 12),
(21, 11, 'Task 1.2', '2022-12-06', 13, 'Meeting Review ', '0.0', 0, 0, '2022-12-05 04:38:15', 13),
(22, 54, 'Task 2', '2022-12-13', 13, 'Maintenance Hansa Renkei', '0.0', 0, 0, '2022-12-06 05:00:16', 13),
(23, 23, 'Task 1.1', '2022-12-05', 1, 'Update Pengambilan Nilai Jasa dan Warranty', '0.0', 0, 0, '2022-12-05 06:41:36', 1),
(24, 39, 'Task 1', '2022-12-08', 13, 'Sesuaikan dengan sound lain', '0.0', 0, 0, '2022-12-05 07:50:52', 1),
(25, 56, 'Task 4.3', '2022-12-06', 13, 'HONDA SLS 2', '0.0', 0, 0, '2022-12-06 06:49:17', 13),
(26, 57, 'Task 4.4', '2022-12-06', 13, 'HONDA SLS PALOPO', '0.0', 0, 0, '2022-12-06 06:49:36', 13),
(27, 58, 'Task 4.5', '2022-12-06', 13, 'MAM JEPARA', '0.0', 0, 0, '2022-12-06 06:50:13', 13),
(28, 61, 'Task 4.8', '2022-12-08', 13, 'Honda Pati Jaya', '0.0', 0, 0, '2022-12-06 06:51:12', 13),
(29, 62, 'Task 4.9', '2022-12-08', 13, 'Honda Salatiga Jaya', '0.0', 0, 0, '2022-12-06 06:51:27', 13),
(30, 63, 'Task 4.10', '2022-12-08', 13, 'Honda Kumala Cikampek', '0.0', 0, 0, '2022-12-06 06:51:47', 13),
(31, 12, 'Task 1.1', '2022-12-05', 12, 'Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul', '50.0', 0, 0, '2022-12-05 04:49:52', 12),
(32, 70, 'Task 1.2', '2022-12-06', 12, 'Tambah Laporan SPK VS Unit & Alokasi', '70.0', 0, 0, '2022-12-06 09:49:33', 12),
(33, 70, 'Task 1.2', '2022-12-06', 12, 'Tambah Laporan SPK VS Unit & Alokasi', '90.0', 0, 0, '2022-12-06 09:50:45', 12),
(34, 72, 'Task 1.4', '2022-12-06', 12, 'Pilih Alokasi di Pembelian', '70.0', 0, 0, '2022-12-06 09:50:33', 12),
(35, 71, 'Task 1.3', '2022-12-06', 12, 'Koneksikan ke matching otomatis pilih norangka sesuai dengan alokasi', '0.0', 0, 0, '2022-12-06 09:50:02', 12),
(36, 34, 'Task 1', '2022-12-05', 15, 'Followup Jurnal Transaksi GL', '50.0', 0, 0, '2022-12-05 06:55:56', 1),
(37, 23, 'Task 1.1', '2022-12-06', 15, 'Update Pengambilan Nilai Jasa dan Warranty', '80.0', 0, 0, '2022-12-06 05:07:18', 15),
(38, 38, 'Task 1.3', '2022-12-05', 15, 'Update Saldo Awal Part untuk Compare Persediaan', '0.0', 0, 0, '2022-12-05 07:49:11', 15),
(39, 74, 'Task 1', '2022-12-07', 15, 'Buat dokumentasi Pembayaran DP', '0.0', 0, 0, '2022-12-07 03:07:50', 1),
(40, 3, 'Task 1.1', '2022-12-09', 13, 'Review dan Adjusment PDF dengan Melly dan Anwar -> sudah difollow up dan belum ada respon', '0.0', 0, 0, '2022-12-05 09:06:34', 13),
(41, 79, 'Task 1.2', '2022-12-07', 13, 'Order Accessories', '100.0', 0, 0, '2022-12-07 13:24:29', 13),
(42, 43, 'Task 1.2', '2022-12-06', 14, 'Menunggu konfirmasi dari pak fauzan', '0.0', 0, 0, '2022-12-05 09:53:15', 14),
(43, 60, 'Task 4.7', '2022-12-08', 13, 'TUNAS JAYA', '0.0', 0, 0, '2022-12-06 06:50:58', 13),
(44, 59, 'Task 4.6', '2022-12-08', 13, 'ANUGERAH SEJAHTERA MGL', '0.0', 0, 0, '2022-12-06 06:50:36', 13),
(45, 21, 'Task 2', '2022-12-08', 13, 'Followup Device Otomanager', '0.0', 0, 0, '2022-12-05 06:39:49', 1),
(46, 20, 'Task 1', '2022-12-08', 13, 'Review Hasil', '0.0', 0, 0, '2022-12-05 06:39:31', 1),
(47, 21, 'Task 2', '2022-12-08', 13, 'Followup Device Otomanager', '100.0', 0, 0, '2022-12-08 04:00:49', 13),
(48, 80, 'Task 1.3', '2022-12-08', 13, 'Pembebanan Accessories', '50.0', 0, 0, '2022-12-07 13:25:16', 13),
(49, 67, 'Task 2.3', '2022-12-06', 12, 'Testting', '0.0', 0, 51, '2022-12-06 09:46:05', 12),
(50, 41, 'Task 1.1', '2022-12-05', 12, 'Sedang koordinasi dengan Pak Alfons', '95.0', 0, 5, '2022-12-06 03:04:56', 12),
(51, 73, 'Task 1.5', '2022-12-07', 12, 'REVIEW PROGRAM DAN LAPORAN', '0.0', 0, 18, '2022-12-06 10:42:03', 12),
(52, 68, 'Task 2', '2022-12-06', 12, 'Fitur Alokas Kendaraan', '0.0', 0, 0, '2022-12-06 09:48:33', 12),
(53, 20, 'Task 1', '2022-12-08', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', '0.0', 0, 0, '2022-12-08 04:06:00', 13),
(54, 25, 'Task 2', '2022-12-12', 13, 'Menu Surat Tagihan Leasing Gabungan dan Form Tiap Leasing', '0.0', 0, 0, '2022-12-05 06:43:32', 1),
(55, 24, 'Task 1', '2022-12-05', 12, 'Inputan faktur polisi gabungan dan form', '0.0', 0, 0, '2022-12-05 06:42:44', 1),
(56, 16, 'Task 1.2', '2022-12-08', 1, 'Review Untuk Closing Oktober', '0.0', 0, 14, '2022-12-05 05:07:28', 1),
(57, 54, 'Task 2', '2022-12-13', 13, 'Maintenance Hansa Renkei Live 23 November 2022', '0.0', 0, 0, '2022-12-06 05:02:59', 13),
(58, 35, 'Task 1', '2022-12-08', 12, 'Closing Harian Sync Dashboard + check status sync terakhir kirim ke WA ', '0.0', 0, 0, '2022-12-05 06:57:26', 1),
(59, 87, 'Task 1.2', '2022-12-09', 1, 'Meeting Server PDF dan Link untuk Customer', '0.0', 0, 2, '2022-12-08 09:00:23', 1),
(60, 20, 'Task 1', '2022-12-12', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', '0.0', 0, 0, '2022-12-08 09:07:43', 1),
(61, 85, 'Task 1.4', '2022-12-09', 13, 'Kirim Exe Ke Intercom', '0.0', 0, 37, '2022-12-08 06:22:05', 13),
(62, 20, 'Task 1', '2022-12-12', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', '80.0', 0, 0, '2022-12-12 07:49:00', 13),
(63, 48, 'Task 2.2', '2022-12-05', 12, 'HONDA ARTA CIKUPA', '10.0', 0, 30, '2022-12-05 10:26:40', 12),
(64, 95, 'Task 1.3', '2023-01-11', 0, 'Task 1 bawahnya', '0.0', 0, 2, '2022-12-12 09:57:19', 1),
(65, 101, 'Task 2', '2022-12-07', 13, 'Iya bisa', '0.0', 0, 0, '2022-12-12 10:08:49', 1),
(66, 101, 'Task 2', '2022-12-07', 13, 'Iya bisa', '0.0', 0, 0, '2022-12-12 10:09:35', 1);

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

--
-- Dumping data for table `task_history`
--

INSERT INTO `task_history` (`id`, `id_task`, `no_task`, `tanggal`, `pic_id`, `client_id`, `notes`, `status`, `history_remarks`, `created_at`, `created_by`) VALUES
(1, 5, 'JACB Jateng', '2022-12-08', 8, 72, 'Implementasi JACB ke Dealer Jateng', 0, 'Perubahan notes ', '2022-12-02 10:25:42', 1),
(2, 13, 'Implementasi Honda Bone', '2022-12-03', 8, 81, 'Implementasi Honda Bone', 0, 'Perubahan tanggal ', '2022-12-02 10:43:25', 1),
(3, 20, 'List Request Intercom', '2022-12-05', 8, 78, 'List Request Intercom', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:48:13', 1),
(4, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-03', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Auto Generated', '2022-12-02 10:47:16', 1),
(5, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-05', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Auto Generated', '2022-12-05 09:52:40', 14),
(6, 1, 'Hansa Renkei', '2022-12-07', 8, 68, 'Create Program Hansa Renkei', 0, 'Perubahan tanggal oleh GAMAL dengan Task Auto Generated', '2022-12-02 10:06:01', 1),
(7, 19, 'Suara untuk QMS', '2022-12-08', 8, 77, 'Update Suara baru dan demo', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:47:49', 1),
(8, 22, 'AP Accessories Local Arta Cikupa', '2022-12-05', 8, 79, 'AP Accessories Local Arta Cikupa', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:49:42', 1),
(9, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-06', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Task 1.2', '2022-12-05 09:53:15', 14),
(10, 20, 'List Request Intercom', '2022-12-08', 8, 78, 'List Request Intercom', 0, 'Perubahan tanggal oleh GAMAL dengan Task Auto Generated', '2022-12-05 07:41:47', 1),
(11, 8, 'Standarisasi Master Tipe Kumala', '2022-12-13', 8, 74, 'Standarisasi untuk Master Tipe di Honda Karawang dan Cikampek untuk Kebutuhan Transfer in out via API', 0, 'Perubahan tanggal ', '2022-12-02 10:38:32', 1),
(12, 22, 'AP Accessories Local Arta Cikupa', '2022-12-06', 8, 79, 'AP Accessories Local Arta Cikupa', 0, 'Perubahan tanggal oleh ZAWI USER dengan Task Auto Generated', '2022-12-06 14:05:29', 1),
(13, 3, 'Digital Dokumen Bintaro', '2022-12-08', 8, 69, 'PDF Faktur, Kwitansi, TTS', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2.3', '2022-12-02 10:18:06', 1),
(14, 4, 'Digital Dokumen Cibubur', '2022-12-08', 8, 70, 'PDF Faktur dan Kwitansi', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.1', '2022-12-02 10:24:47', 1),
(15, 5, 'JACB Jateng', '2022-12-08', 8, 72, 'Implementasi JACB ke Dealer Jateng - Tunggu Request Dealer', 0, 'Perubahan tanggal ', '2022-12-02 10:54:46', 1),
(16, 7, 'List Request Karawang', '2022-12-09', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.5', '2022-12-02 10:37:04', 1),
(17, 7, 'List Request Karawang', '2022-12-12', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-08 09:05:25', 1),
(18, 9, 'List Request IKB BP (Pradana) ', '2022-12-08', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:39:41', 1),
(19, 11, 'Monthly Meeting MGI', '2022-12-13', 8, 71, 'Monthly Meeting tiap hari selasa jam 10', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-02 10:41:40', 1),
(20, 13, 'Implementasi Honda Bone', '2022-12-08', 8, 81, 'Implementasi Honda Bone', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.2', '2022-12-05 05:03:38', 1),
(21, 15, 'Project management review', '2022-12-08', 8, 82, 'Project management review', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:45:34', 1),
(22, 1, 'Hansa Renkei', '2022-12-13', 8, 68, 'Create Program Hansa Renkei', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-06 05:00:16', 13),
(23, 14, 'Implementasi Hyundai Batam', '2022-12-08', 8, 82, 'Implementasi Hyundai Batam', 0, 'Perubahan tanggal ', '2022-12-02 10:45:09', 1),
(24, 21, 'Sync Dashboard MAM', '2022-12-08', 8, 67, 'Program Sync Dashboard MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:48:50', 1),
(25, 2, 'Digital Dokumen MAM', '2022-12-09', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:09:28', 1),
(26, 9, 'List Request IKB BP (Pradana) ', '2022-12-12', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 'Perubahan tanggal oleh GAMAL dengan Task Task 1', '2022-12-08 09:07:43', 1),
(27, 2, 'Digital Dokumen MAM', '2022-12-15', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-12 07:43:25', 1),
(28, 2, 'Digital Dokumen MAM', '2022-12-26', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-12 08:18:29', 1),
(29, 2, 'Digital Dokumen MAM', '2022-12-29', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-12 09:53:22', 1),
(30, 12, 'Implementasi Chery Arta Cikupa', '2022-12-12', 8, 80, 'Implementasi Dealer Chery Arta Cikupa', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:42:16', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `m_numberings`
--
ALTER TABLE `m_numberings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `task_detail`
--
ALTER TABLE `task_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `task_detail_history`
--
ALTER TABLE `task_detail_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `task_history`
--
ALTER TABLE `task_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
