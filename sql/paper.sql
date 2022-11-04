-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2020 at 07:27 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paper`
--

-- --------------------------------------------------------

--
-- Table structure for table `f_invoice`
--

CREATE TABLE `f_invoice` (
  `id` int(11) NOT NULL,
  `no_invoice` varchar(50) NOT NULL,
  `term_of_payment` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `nilai_invoice` decimal(14,2) NOT NULL,
  `nilai_bayar` decimal(14,2) NOT NULL,
  `nilai_pembulatan` decimal(14,2) NOT NULL,
  `flag` int(1) NOT NULL,
  `tanggal` date NOT NULL,
  `tanggal_lunas` date NOT NULL,
  `id_supplier` int(5) NOT NULL,
  `id_sj` int(11) NOT NULL,
  `id_customer` int(5) NOT NULL,
  `ppn` int(1) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `f_invoice_detail`
--

CREATE TABLE `f_invoice_detail` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_sj_detail` int(11) NOT NULL,
  `id_jb` int(11) NOT NULL,
  `netto` decimal(14,2) NOT NULL,
  `harga_beli` decimal(14,2) NOT NULL,
  `id_harga_jual` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `f_match`
--

CREATE TABLE `f_match` (
  `id` int(11) NOT NULL,
  `no_matching` varchar(50) NOT NULL,
  `id_supplier` int(5) NOT NULL,
  `status` int(3) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(3) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_match`
--

INSERT INTO `f_match` (`id`, `no_matching`, `id_supplier`, `status`, `tanggal`, `keterangan`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(1, 'MTCH-0001', 2, 1, '2020-10-06', '', '2020-10-26 05:06:28', 1, '2020-10-26 05:17:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `f_match_detail`
--

CREATE TABLE `f_match_detail` (
  `id` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `jenis_trx` tinyint(1) NOT NULL,
  `jenis_pmb` tinyint(1) NOT NULL DEFAULT 0,
  `id_uk` int(11) NOT NULL,
  `id_sj` int(11) NOT NULL,
  `sj_bayar` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_match_detail`
--

INSERT INTO `f_match_detail` (`id`, `id_match`, `jenis_trx`, `jenis_pmb`, `id_uk`, `id_sj`, `sj_bayar`) VALUES
(1, 1, 0, 0, 0, 1, '100000000.00'),
(2, 1, 1, 0, 1, 0, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `f_pembayaran`
--

CREATE TABLE `f_pembayaran` (
  `id` int(11) NOT NULL,
  `no_pembayaran` varchar(17) NOT NULL,
  `id_group_supplier` int(5) NOT NULL,
  `id_supplier` int(5) NOT NULL,
  `status` int(2) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_pembayaran` varchar(50) NOT NULL,
  `rekening_tujuan` int(3) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `kurs` decimal(8,3) NOT NULL,
  `nominal` decimal(14,3) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `approved_at` datetime NOT NULL,
  `approved_by` int(3) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `reject_at` datetime NOT NULL,
  `reject_by` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `f_pmb`
--

CREATE TABLE `f_pmb` (
  `id` int(11) NOT NULL,
  `no_pmb` varchar(50) NOT NULL,
  `id_customer` int(5) NOT NULL,
  `status` int(3) NOT NULL,
  `tanggal` date NOT NULL,
  `nilai` decimal(14,2) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(3) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `f_pmb_detail`
--

CREATE TABLE `f_pmb_detail` (
  `id` int(11) NOT NULL,
  `id_pmb` int(11) NOT NULL,
  `id_inv` int(11) NOT NULL,
  `inv_bayar` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `f_spl_deposit`
--

CREATE TABLE `f_spl_deposit` (
  `id` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `flag_matching` int(11) NOT NULL DEFAULT 0,
  `nomor` varchar(50) NOT NULL,
  `nilai` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `f_uang_keluar`
--

CREATE TABLE `f_uang_keluar` (
  `id` int(11) NOT NULL,
  `no_uang_keluar` varchar(17) NOT NULL,
  `id_supplier` int(5) NOT NULL,
  `status` int(2) NOT NULL,
  `flag_matching` int(2) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_pembayaran` varchar(50) NOT NULL,
  `rekening_tujuan` int(3) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `kurs` decimal(8,3) NOT NULL,
  `nominal` decimal(14,2) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `approved_at` datetime NOT NULL,
  `approved_by` int(3) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `reject_at` datetime NOT NULL,
  `reject_by` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_uang_keluar`
--

INSERT INTO `f_uang_keluar` (`id`, `no_uang_keluar`, `id_supplier`, `status`, `flag_matching`, `tanggal`, `jenis_pembayaran`, `rekening_tujuan`, `currency`, `kurs`, `nominal`, `keterangan`, `created_at`, `created_by`, `approved_at`, `approved_by`, `modified_at`, `modified_by`, `reject_at`, `reject_by`) VALUES
(1, 'UK-0001', 2, 0, 1, '2020-10-04', 'Cash', 0, 'IDR', '1.000', '100000000.00', '', '2020-10-26 05:14:41', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `tabel` varchar(100) NOT NULL,
  `reff` int(11) NOT NULL,
  `json` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `jenis`, `tabel`, `reff`, `json`, `created_at`, `created_by`) VALUES
(1, 'add', 't_sj_detail', 1, '{\"id_sj\":\"1\",\"id_jb\":\"7\",\"bruto\":\"4569\",\"potongan\":\"45\",\"netto\":\"4524\",\"id_harga\":\"7\",\"harga\":12250,\"bonus\":\"150\",\"total\":\"55419000\"}', '2020-10-26 04:59:41', 1),
(2, 'add', 't_sj_detail', 2, '{\"id_sj\":\"1\",\"id_jb\":\"3\",\"bruto\":\"5459\",\"potongan\":\"74\",\"netto\":\"5385\",\"id_harga\":\"13\",\"harga\":8665,\"bonus\":\"165\",\"total\":\"46661025\"}', '2020-10-26 04:59:53', 1),
(3, 'update', 't_sj_detail', 2, '{\"id_jb\":\"3\",\"bruto\":\"5459.00\",\"potongan\":\"74.00\",\"netto\":\"5385\",\"id_harga\":\"13\",\"harga\":8500,\"bonus\":\"\",\"total\":\"45772500\"}', '2020-10-26 05:00:00', 1),
(4, 'update', 't_sj_detail', 2, '{\"id_jb\":\"3\",\"bruto\":\"5459.00\",\"potongan\":\"74.00\",\"netto\":\"5385\",\"id_harga\":\"13\",\"harga\":8500,\"bonus\":\"\",\"total\":\"45772500\"}', '2020-10-26 05:00:01', 1),
(5, 'update', 't_sj_detail', 2, '{\"id_jb\":\"3\",\"bruto\":\"5459.00\",\"potongan\":\"74.00\",\"netto\":\"5385\",\"id_harga\":\"13\",\"harga\":8500,\"bonus\":\"\",\"total\":\"45772500\"}', '2020-10-26 05:00:08', 1),
(6, 'update', 't_sj_detail', 2, '{\"id_jb\":\"3\",\"bruto\":\"5459.00\",\"potongan\":\"74.00\",\"netto\":\"5385\",\"id_harga\":\"13\",\"harga\":8500,\"bonus\":\"0\",\"total\":\"45772500\"}', '2020-10-26 05:00:38', 1),
(7, 'update', 't_sj_detail', 2, '{\"id_jb\":\"3\",\"bruto\":\"5459.00\",\"potongan\":\"74.00\",\"netto\":\"5385\",\"id_harga\":\"13\",\"harga\":8500,\"bonus\":0,\"total\":\"45772500\"}', '2020-10-26 05:01:26', 1),
(8, 'add', 't_sj_detail', 3, '{\"id_sj\":\"2\",\"id_jb\":\"5\",\"bruto\":\"7500\",\"potongan\":\"45\",\"netto\":\"7455\",\"id_harga\":\"8\",\"harga\":17000,\"bonus\":\"\",\"total\":\"126735000\"}', '2020-10-26 05:02:50', 1),
(9, 'add', 't_sj_detail', 4, '{\"id_sj\":\"2\",\"id_jb\":\"5\",\"bruto\":\"7500\",\"potongan\":\"45\",\"netto\":\"7455\",\"id_harga\":\"8\",\"harga\":17000,\"bonus\":\"\",\"total\":\"126735000\"}', '2020-10-26 05:02:51', 1),
(10, 'add', 't_sj_detail', 5, '{\"id_sj\":\"2\",\"id_jb\":\"5\",\"bruto\":\"7500\",\"potongan\":\"45\",\"netto\":\"7455\",\"id_harga\":\"8\",\"harga\":17000,\"bonus\":\"\",\"total\":\"126735000\"}', '2020-10-26 05:03:08', 1),
(13, 'delete', 't_sj_detail', 5, '[{\"id\":\"5\",\"id_sj\":\"2\",\"id_jb\":\"5\",\"bruto\":\"7500.00\",\"potongan\":\"45.00\",\"netto\":\"7455.00\",\"id_harga\":\"8\",\"harga\":\"17000.00\",\"bonus\":\"0.00\",\"total\":\"126735000.00\"}]', '2020-10-26 05:04:22', 1),
(14, 'delete', 't_sj_detail', 4, '[{\"id\":\"4\",\"id_sj\":\"2\",\"id_jb\":\"5\",\"bruto\":\"7500.00\",\"potongan\":\"45.00\",\"netto\":\"7455.00\",\"id_harga\":\"8\",\"harga\":\"17000.00\",\"bonus\":\"0.00\",\"total\":\"126735000.00\"}]', '2020-10-26 05:04:25', 1),
(17, 'add', 't_sj_detail', 10, '{\"id_sj\":\"2\",\"id_jb\":\"1\",\"bruto\":\"7565\",\"potongan\":\"75\",\"netto\":\"7490\",\"id_harga\":\"14\",\"harga\":21750,\"bonus\":\"750\",\"total\":\"162907500\"}', '2020-10-26 05:06:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_bank`
--

CREATE TABLE `m_bank` (
  `id` int(11) NOT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `atas_nama` varchar(50) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `nomor_rekening` varchar(25) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_bank`
--

INSERT INTO `m_bank` (`id`, `nama_bank`, `atas_nama`, `currency`, `nomor_rekening`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(1, 'BCA', 'High End', 'IDR', '54646467', '2020-09-23 09:11:06', 1, NULL, NULL),
(3, 'BCA USD', 'Hachiman', 'USD', '4365475484', '2020-09-23 09:21:29', 1, NULL, NULL),
(4, 'Mandiri', 'Oasis', 'IDR', '64365444', '2020-09-23 09:23:49', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_barang`
--

CREATE TABLE `m_barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_barang`
--

INSERT INTO `m_barang` (`id`, `nama_barang`, `modified_at`, `modified_by`, `created_at`, `created_by`) VALUES
(1, 'TISSUE BEDDING HAMSTER', NULL, NULL, '2020-09-23 09:44:59', 1),
(2, 'KERTAS HVS', NULL, NULL, '2020-09-23 09:45:30', 1),
(3, 'PIPA BARU', NULL, NULL, '2020-09-23 09:45:35', 1),
(4, 'SAVE PAPER', NULL, NULL, '2020-09-23 09:46:07', 1),
(5, 'HARD PAPER', NULL, NULL, '2020-09-23 09:46:15', 1),
(7, 'ABC-W', NULL, NULL, '2020-09-23 10:30:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_bongkar_muat`
--

CREATE TABLE `m_bongkar_muat` (
  `id` int(11) NOT NULL,
  `nama_bongkar_muat` varchar(50) NOT NULL,
  `harga` decimal(14,2) NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_bongkar_muat`
--

INSERT INTO `m_bongkar_muat` (`id`, `nama_bongkar_muat`, `harga`, `modified_at`, `modified_by`, `created_at`, `created_by`) VALUES
(1, 'OBM 1', '56000.00', '2020-09-24 05:55:14', 1, '2020-09-24 05:42:06', 1),
(2, 'OBM 2', '35000.00', NULL, NULL, '2020-09-24 05:55:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_customer`
--

CREATE TABLE `m_customer` (
  `id` int(11) NOT NULL,
  `nama_customer` varchar(200) NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_customer`
--

INSERT INTO `m_customer` (`id`, `nama_customer`, `modified_at`, `modified_by`, `created_at`, `created_by`) VALUES
(1, 'INDOKA JAYA, P. T.', '2020-09-23 09:48:53', 1, '2020-09-23 09:48:41', 1),
(2, 'ALUM CENTRAL MANDIRI LESTARI, P. T.', NULL, NULL, '2020-09-23 09:48:56', 1),
(3, 'SUGIH COPPER, CV', NULL, NULL, '2020-09-23 09:48:58', 1),
(4, 'TRADECO', NULL, NULL, '2020-09-23 09:49:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_group_supplier`
--

CREATE TABLE `m_group_supplier` (
  `id` int(11) NOT NULL,
  `nama_group_supplier` varchar(200) NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_group_supplier`
--

INSERT INTO `m_group_supplier` (`id`, `nama_group_supplier`, `modified_at`, `modified_by`, `created_at`, `created_by`) VALUES
(1, 'Grade A', NULL, NULL, '2020-09-23 09:57:23', 1),
(2, 'Grade B', NULL, NULL, '2020-09-23 09:57:28', 1),
(3, 'Grade C', NULL, NULL, '2020-09-23 09:57:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_harga`
--

CREATE TABLE `m_harga` (
  `id` int(11) NOT NULL,
  `jenis` int(3) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nilai` decimal(14,2) NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_harga_barang`
--

CREATE TABLE `m_harga_barang` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `harga` decimal(14,2) NOT NULL,
  `tanggal` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_harga_barang`
--

INSERT INTO `m_harga_barang` (`id`, `id_barang`, `harga`, `tanggal`, `created_at`, `created_by`) VALUES
(2, 5, '13000.00', '2020-09-01 06:53:00', '2020-09-24 09:41:31', 1),
(3, 5, '15000.00', '2020-09-01 08:53:00', '2020-09-24 10:36:20', 1),
(4, 7, '12000.00', '2020-09-01 06:37:00', '2020-09-24 10:37:30', 1),
(5, 7, '12500.00', '2020-09-01 09:38:00', '2020-09-24 10:38:38', 1),
(6, 7, '12600.00', '2020-09-01 10:39:00', '2020-09-24 10:38:51', 1),
(7, 7, '12100.00', '2020-09-02 06:37:00', '2020-09-24 10:42:45', 1),
(8, 5, '17000.00', '2020-09-03 16:04:00', '2020-09-24 11:04:42', 1),
(9, 5, '17200.00', '2020-09-04 16:04:00', '2020-09-24 11:04:58', 1),
(10, 5, '16800.00', '2020-09-03 13:05:00', '2020-09-24 11:05:17', 1),
(11, 5, '17200.00', '2020-09-04 14:04:00', '2020-09-24 11:05:25', 1),
(12, 2, '7000.00', '2020-09-01 16:05:00', '2020-09-24 11:05:45', 1),
(13, 3, '8500.00', '2020-09-01 16:05:00', '2020-09-24 11:05:59', 1),
(14, 1, '21000.00', '2020-09-01 16:06:00', '2020-09-24 11:06:14', 1),
(15, 1, '23000.00', '2020-09-02 16:06:00', '2020-09-24 11:06:29', 1),
(16, 1, '14000.00', '2020-09-02 16:06:00', '2020-10-13 11:44:45', 1),
(17, 1, '15000.00', '2020-09-08 10:52:00', '2020-10-13 11:52:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_harga_jual`
--

CREATE TABLE `m_harga_jual` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `harga` decimal(14,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_harga_jual`
--

INSERT INTO `m_harga_jual` (`id`, `id_barang`, `tanggal`, `harga`, `created_at`, `created_by`) VALUES
(1, 5, '2020-10-01 13:59:10', '17000.00', '2020-10-06 13:59:10', 1),
(9, 7, '2020-10-01 13:59:10', '22000.00', '2020-10-06 13:59:10', 1),
(12, 2, '2020-10-06 15:03:29', '11000.00', '2020-10-06 15:03:29', 1),
(13, 3, '2020-10-06 07:42:00', '9500.00', '2020-10-13 11:42:28', 1),
(14, 3, '2020-10-06 11:42:00', '9750.00', '2020-10-13 11:44:11', 1),
(15, 1, '2020-10-05 10:52:00', '24000.00', '2020-10-13 11:52:58', 1),
(16, 1, '2020-09-08 11:00:00', '21000.00', '2020-10-13 11:53:16', 1),
(17, 5, '2020-10-02 09:00:00', '18560.00', '2020-10-13 11:53:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_supplier`
--

CREATE TABLE `m_supplier` (
  `id` int(11) NOT NULL,
  `nama_supplier` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_supplier`
--

INSERT INTO `m_supplier` (`id`, `nama_supplier`, `alamat`, `modified_at`, `modified_by`, `created_at`, `created_by`) VALUES
(1, 'ABADI BARU', '', '2020-09-25 06:38:42', 1, '2020-09-23 09:51:23', 1),
(2, 'HARYANTO', '', NULL, NULL, '2020-09-23 09:51:27', 1),
(3, 'ALDO TOKO', '', NULL, NULL, '2020-09-23 09:51:29', 1),
(4, 'A BOK', '', NULL, NULL, '2020-09-23 09:51:32', 1),
(5, 'KIKI', '', NULL, NULL, '2020-09-23 09:51:38', 1),
(7, 'Coba', '', NULL, NULL, '2020-09-25 05:53:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `roles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `roles`) VALUES
(1, 'ADMIN'),
(2, 'SALES');

-- --------------------------------------------------------

--
-- Table structure for table `t_sj`
--

CREATE TABLE `t_sj` (
  `id` int(11) NOT NULL,
  `no_surat_jalan` varchar(100) NOT NULL,
  `nilai` decimal(14,2) NOT NULL DEFAULT 0.00,
  `nilai_bayar` decimal(14,2) NOT NULL,
  `tanggal` date NOT NULL,
  `tanggal_lunas` date NOT NULL,
  `status` int(1) NOT NULL,
  `flag` int(1) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL DEFAULT 0,
  `id_group_supplier` int(11) NOT NULL DEFAULT 0,
  `id_customer` int(11) NOT NULL DEFAULT 0,
  `jenis_kendaraan` varchar(50) NOT NULL,
  `no_kendaraan` varchar(15) NOT NULL,
  `bonus` decimal(14,2) NOT NULL DEFAULT 0.00,
  `denda` decimal(14,2) NOT NULL,
  `id_obm` int(11) NOT NULL,
  `tiket` decimal(14,2) NOT NULL DEFAULT 0.00,
  `bb_cash` decimal(14,2) NOT NULL DEFAULT 0.00,
  `keterangan` text NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_sj`
--

INSERT INTO `t_sj` (`id`, `no_surat_jalan`, `nilai`, `nilai_bayar`, `tanggal`, `tanggal_lunas`, `status`, `flag`, `id_invoice`, `id_supplier`, `id_group_supplier`, `id_customer`, `jenis_kendaraan`, `no_kendaraan`, `bonus`, `denda`, `id_obm`, `tiket`, `bb_cash`, `keterangan`, `modified_at`, `modified_by`, `created_at`, `created_by`) VALUES
(1, 'SJ-YAP.0001', '111430050.00', '100000000.00', '2020-10-01', '0000-00-00', 1, 0, 0, 2, 1, 0, 'Fuso', '', '0.00', '56000.00', 1, '150000.00', '25000.00', '', '2020-10-26 05:12:09', 1, '2020-10-26 04:59:15', 1),
(2, 'SJ-YAP.0002', '318662750.00', '0.00', '2020-10-04', '0000-00-00', 1, 0, 0, 2, 2, 0, 'Fuso', '', '0.00', '0.00', 1, '0.00', '0.00', '', '2020-10-26 05:12:12', 1, '2020-10-26 05:02:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_sj_details`
--

CREATE TABLE `t_sj_details` (
  `id` int(11) NOT NULL,
  `id_sj` int(11) NOT NULL,
  `id_jb` int(11) NOT NULL,
  `bruto` decimal(14,2) NOT NULL,
  `potongan` decimal(14,2) NOT NULL,
  `netto` decimal(14,2) NOT NULL,
  `id_harga` int(11) NOT NULL,
  `harga` decimal(14,2) NOT NULL,
  `bonus` decimal(14,2) NOT NULL,
  `total` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_sj_details`
--

INSERT INTO `t_sj_details` (`id`, `id_sj`, `id_jb`, `bruto`, `potongan`, `netto`, `id_harga`, `harga`, `bonus`, `total`) VALUES
(1, 1, 7, '4569.00', '45.00', '4524.00', 7, '12250.00', '150.00', '55419000.00'),
(2, 1, 3, '5459.00', '74.00', '5385.00', 13, '8500.00', '0.00', '45772500.00'),
(3, 2, 5, '7500.00', '45.00', '7455.00', 8, '17000.00', '0.00', '126735000.00'),
(10, 2, 1, '7565.00', '75.00', '7490.00', 14, '21750.00', '750.00', '162907500.00');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `id_roles`, `last_login`, `modified_at`, `modified_by`, `created_at`, `created_by`) VALUES
(1, 'admin', '$2y$10$PoOpPaQ9ucmJ5.pUbs8R5OW5.mAheNjEV7cmWny.Cd33vmObG/E26', 'ADMIN', 1, '2020-10-26 13:24:27', '2020-09-25 10:16:46', 1, '0000-00-00 00:00:00', 0),
(2, 'belo', '$2y$10$aud0ra6SRA.AVsDB92UTNOxlVVpgophruF3VyZc16Ir4Uf5Ll.b4.', 'belo', 2, '0000-00-00 00:00:00', '2020-09-25 10:16:51', 1, '2020-09-25 10:10:56', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `f_invoice`
--
ALTER TABLE `f_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_invoice_detail`
--
ALTER TABLE `f_invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_match`
--
ALTER TABLE `f_match`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_match_detail`
--
ALTER TABLE `f_match_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_pembayaran`
--
ALTER TABLE `f_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_pmb`
--
ALTER TABLE `f_pmb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_pmb_detail`
--
ALTER TABLE `f_pmb_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_spl_deposit`
--
ALTER TABLE `f_spl_deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_uang_keluar`
--
ALTER TABLE `f_uang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_bank`
--
ALTER TABLE `m_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_bongkar_muat`
--
ALTER TABLE `m_bongkar_muat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_customer`
--
ALTER TABLE `m_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_group_supplier`
--
ALTER TABLE `m_group_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_harga`
--
ALTER TABLE `m_harga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_harga_barang`
--
ALTER TABLE `m_harga_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_harga_jual`
--
ALTER TABLE `m_harga_jual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_supplier`
--
ALTER TABLE `m_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_sj`
--
ALTER TABLE `t_sj`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_sj_details`
--
ALTER TABLE `t_sj_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `f_invoice`
--
ALTER TABLE `f_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_invoice_detail`
--
ALTER TABLE `f_invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_match`
--
ALTER TABLE `f_match`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `f_match_detail`
--
ALTER TABLE `f_match_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `f_pembayaran`
--
ALTER TABLE `f_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_pmb`
--
ALTER TABLE `f_pmb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_pmb_detail`
--
ALTER TABLE `f_pmb_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_spl_deposit`
--
ALTER TABLE `f_spl_deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_uang_keluar`
--
ALTER TABLE `f_uang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `m_bank`
--
ALTER TABLE `m_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_barang`
--
ALTER TABLE `m_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `m_bongkar_muat`
--
ALTER TABLE `m_bongkar_muat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_customer`
--
ALTER TABLE `m_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_group_supplier`
--
ALTER TABLE `m_group_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_harga`
--
ALTER TABLE `m_harga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_harga_barang`
--
ALTER TABLE `m_harga_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `m_harga_jual`
--
ALTER TABLE `m_harga_jual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `m_supplier`
--
ALTER TABLE `m_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_sj`
--
ALTER TABLE `t_sj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_sj_details`
--
ALTER TABLE `t_sj_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
