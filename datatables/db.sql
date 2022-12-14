-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 19, 2020 at 03:04 PM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `coa`
--

CREATE TABLE `coa` (
  `id` int(11) NOT NULL,
  `no_perkiraan` varchar(10) NOT NULL DEFAULT '',
  `nama` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `coa`
--

INSERT INTO `coa` (`id`, `no_perkiraan`, `nama`) VALUES
(1, '1000-00-00', 'ASET'),
(2, '1100-00-00', 'ASET LANCAR'),
(3, '1101-00-00', 'KAS & SETARA KAS'),
(4, '1101-01-00', 'KAS & SETARA KAS'),
(5, '1101-01-01', 'KAS-GA'),
(6, '1101-01-02', 'KAS-PRODUCTION'),
(7, '1101-99-00', 'AYAT SILANG'),
(8, '1101-99-01', 'AYAT SILANG'),
(9, '1102-00-00', 'BANK'),
(10, '1102-01-00', 'BANK'),
(11, '1102-01-01', 'BANK MEGA'),
(12, '1102-01-02', 'BANK MANDIRI'),
(13, '1102-01-03', 'BANK BNI'),
(14, '1102-01-04', 'BANK BCA (IN)'),
(15, '1102-01-05', 'BANK BCA (OUT)'),
(16, '1102-01-06', 'BANK BCA (USD)'),
(17, '1102-01-07', 'BANK BJB'),
(18, '1102-01-08', 'BANK OCBC NISP'),
(19, '1103-00-00', 'TIME DEPOSIT'),
(20, '1103-01-00', 'TIME DEPOSIT'),
(21, '1103-01-01', 'TIME DEPOSIT'),
(22, '1104-00-00', 'PIUTANG'),
(23, '1104-01-00', 'PIUTANG USAHA'),
(24, '1104-01-01', 'PIUTANG OOH'),
(25, '1104-01-02', 'PIUTANG DOOH'),
(26, '1104-01-03', 'PIUTANG JASA BANGUN PERIJINAN'),
(27, '1104-02-00', 'PIUTANG PAJAK'),
(28, '1104-02-01', 'PIUTANG PPH 23'),
(29, '1104-03-00', 'PIUTANG AFILIASI'),
(30, '1104-03-01', 'PIUTANG PT. DINAMIKA NEO SEMESTA'),
(31, '1104-04-00', 'PIUTANG LAIN-LAIN'),
(32, '1104-04-01', 'PIUTANG KARYAWAN'),
(33, '1104-04-02', 'PIUTANG PEMEGANG SAHAM'),
(34, '1104-04-03', 'PIUTANG SKPD'),
(35, '1104-04-04', 'PIUTANG LAINNYA'),
(36, '1105-00-00', 'PERSEDIAAN BARANG'),
(37, '1105-01-00', 'PERSEDIAAN BARANG'),
(38, '1105-01-01', 'PERSEDIAAN BARANG'),
(39, '1106-00-00', 'SIMPANAN JAMINAN'),
(40, '1106-01-00', 'SIMPANAN JAMINAN'),
(41, '1106-01-01', 'JAMINAN BANGUNAN'),
(42, '1106-01-02', 'JAMINAN BONGKAR BB'),
(43, '1107-00-00', 'BIAYA DIBAYAR DIMUKA'),
(44, '1107-01-00', 'SEWA DIBAYAR DIMUKA'),
(45, '1107-01-01', 'SEWA BANGUNAN DIBAYAR DIMUKA'),
(46, '1107-01-02', 'SEWA KENDARAAN DIBAYAR DIMUKA'),
(47, '1107-01-03', 'SEWA KONSTRUKSI DIBAYAR DIMUKA'),
(48, '1107-01-04', 'SEWA PERALATAN DIBAYAR DIMUKA'),
(49, '1107-02-00', 'IKLAN DIBAYAR DIMUKA'),
(50, '1107-02-01', 'IKLAN LOKER DIBAYAR DIMUKA'),
(51, '1107-03-00', 'ASURANSI DIBAYAR DIMUKA'),
(52, '1107-03-01', 'ASURANSI BANGUNAN DIBAYAR DIMUKA'),
(53, '1107-03-02', 'ASURANSI KENDARAAN DIBAYAR DIMUKA'),
(54, '1107-03-03', 'ASURANSI KONSTRUKSI DIBAYAR DIMUKA'),
(55, '1107-04-00', 'PAJAK DIBAYAR DIMUKA'),
(56, '1107-04-01', 'PAJAK DIBAYAR DIMUKA PPH 22'),
(57, '1107-04-02', 'PAJAK DIBAYAR DIMUKA PPH 23'),
(58, '1107-04-03', 'PAJAK DIBAYAR DIMUKA PPH 25'),
(59, '1108-00-00', 'UANG MUKA'),
(60, '1108-01-00', 'UANG MUKA SEWA'),
(61, '1108-01-01', 'UANG MUKA SEWA BANGUNAN'),
(62, '1108-01-02', 'UANG MUKA SEWA KENDARAAN'),
(63, '1108-01-03', 'UANG MUKA SEWA KONSTRUKSI'),
(64, '1108-01-04', 'UANG MUKA SEWA PERALATAN'),
(65, '1108-01-05', 'UANG MUKA SEWA TANAH/LOKASI'),
(66, '1108-03-00', 'UANG MUKA PENGALIHAN HAK'),
(67, '1108-03-01', 'UANG MUKA PENGALIHAN HAK'),
(68, '1108-04-00', 'UANG MUKA PLN'),
(69, '1108-04-01', 'UANG MUKA PLN'),
(70, '1108-05-00', 'UANG MUKA LAIN-LAIN'),
(71, '1108-05-01', 'UANG MUKA LAIN-LAIN'),
(72, '1110-00-00', 'PAJAK DIBAYAR DIMUKA'),
(73, '1110-01-00', 'PAJAK PPh PASAL 22'),
(74, '1110-01-01', 'PAJAK PPh PASAL 22'),
(75, '1110-02-00', 'PAJAK PPh PASAL 23'),
(76, '1110-02-01', 'PAJAK PPh PASAL 23'),
(77, '1110-03-00', 'PAJAK PPh PASAL 25'),
(78, '1110-03-01', 'PAJAK PPh PASAL 25'),
(79, '1110-03-02', 'LEBIH BAYAR PPh BADAN'),
(80, '1110-04-00', 'PPN MASUKAN'),
(81, '1110-04-01', 'PPN MASUKAN'),
(82, '1110-05-00', 'PAJAK PPh PASAL 4'),
(83, '1110-05-01', 'PAJAK PPh PASAL 4'),
(84, '1110-06-00', 'PAJAK PPH  PASAL 21'),
(85, '1110-06-01', 'PAJAK PPH PASAL 21'),
(86, '1200-00-00', 'ASET TIDAK LANCAR'),
(87, '1201-00-00', 'INVESTASI JANGKA PANJANG'),
(88, '1201-01-00', 'SAHAM'),
(89, '1201-01-01', 'SAHAM PT. DINAMIKA NEO SEMESTA'),
(90, '1300-00-00', 'AKTIVA TETAP'),
(91, '1301-00-00', 'TANAH'),
(92, '1301-01-00', 'TANAH'),
(93, '1301-01-01', 'TANAH'),
(94, '1302-00-00', 'GEDUNG & BANGUNAN'),
(95, '1302-01-00', 'GEDUNG & BANGUNAN'),
(96, '1302-01-01', 'GEDUNG & BANGUNAN'),
(97, '1303-00-00', 'KENDARAAN BERMOTOR'),
(98, '1303-01-00', 'KENDARAAN BERMOTOR OPERASIONAL'),
(99, '1303-01-01', 'KENDARAAN BERMOTOR OPERASIONAL'),
(100, '1303-02-00', 'ASET TITIK'),
(101, '1303-02-01', 'ASET TITIK'),
(102, '1304-00-00', 'PERALATAN & PERLENGKAPAN'),
(103, '1304-01-00', 'PERALATAN & PERLENGKAPAN'),
(104, '1304-01-01', 'PERALATAN & PERLENGKAPAN'),
(105, '1305-00-00', 'INVENTARIS KANTOR'),
(106, '1305-01-00', 'INVENTARIS KANTOR'),
(107, '1305-01-01', 'INVENTARIS KANTOR'),
(108, '1306-00-00', 'FURNITURE & FIXTURE'),
(109, '1306-01-00', 'FURNITURE & FIXTURE'),
(110, '1306-01-01', 'FURNITURE & FIXTURE'),
(111, '1307-00-00', 'ASET TETAP TIDAK BERWUJUD'),
(112, '1307-01-00', 'ASET TETAP TIDAK BERWUJUD'),
(113, '1307-01-01', 'ASET TETAP TIDAK BERWUJUD'),
(114, '1309-00-00', 'AKUMULASI PENYUSUTAN'),
(115, '1309-03-00', 'AKU.PENYU - PERALATAN & PERLENGKAPAN'),
(116, '1309-03-01', 'AKU.PENYU - PERALATAN & PERLENGKAPAN'),
(117, '1309-04-00', 'AKU.PENYU - INVENTARIS KANTOR'),
(118, '1309-04-01', 'AKU.PENYU - INVENTARIS KANTOR'),
(119, '1309-05-00', 'AKUMULASI PENYUSUTAN KENDARAAN'),
(120, '1309-05-01', 'AKUMULASI PENYUSUTAN KENDARAAN'),
(121, '1309-06-00', 'AKUMULASI PENYUSUTAN ASET TITIK'),
(122, '1309-06-01', 'AKUMULASI PENYUSUTAN ASET TITIK'),
(123, '1309-07-00', 'AKUMULASI PENYUSUTAN BANGUNAN'),
(124, '1309-07-01', 'AKUMULASI PENYUSUTAN BANGUNAN'),
(125, '1309-08-00', 'AKUMULASI PENYUSUTAN HARTA LAINNYA'),
(126, '1309-08-01', 'AKUMULASI PENYUSUTAN HARTA LAINNYA'),
(127, '1900-00-00', 'ASET LAIN-LAIN'),
(128, '1901-00-00', 'ASET LAIN-LAIN'),
(129, '1901-01-00', 'ASET LAIN-LAIN'),
(130, '1901-01-01', 'ASET PAJAK TANGGUHAN'),
(131, '1901-01-02', 'AMORTISASI AKTIVA LAIN-LAIN'),
(132, '1901-01-03', 'ASET TETAP LAIN-LAIN'),
(133, '2000-00-00', 'KEWAJIBAN'),
(134, '2100-00-00', 'KEWAJIBAN LANCAR'),
(135, '2101-00-00', 'HUTANG USAHA'),
(136, '2101-01-00', 'HUTANG USAHA'),
(137, '2101-01-01', 'HUTANG USAHA VENDOR'),
(138, '2101-01-02', 'HUTANG USAHA LAIN-LAIN'),
(139, '2102-00-00', 'HUTANG BANK'),
(140, '2102-01-00', 'HUTANG BANK'),
(141, '2102-01-01', 'HUTANG BANK'),
(142, '2103-00-00', 'HUTANG LEASING'),
(143, '2103-01-00', 'HUTANG LEASING'),
(144, '2103-01-01', 'HUTANG LEASING KENDARAAN'),
(145, '2104-00-00', 'HUTANG PEMEGANG SAHAM'),
(146, '2104-01-00', 'HUTANG PEMEGANG SAHAM'),
(147, '2104-01-01', 'HUTANG PEMEGANG SAHAM'),
(148, '2107-00-00', 'HUTANG PAJAK'),
(149, '2107-01-00', 'HUTANG PAJAK PPH PASAL 21'),
(150, '2107-01-01', 'HUTANG PAJAK PPH PASAL 21'),
(151, '2107-02-00', 'HUTANG PAJAK PPH PASAL 23'),
(152, '2107-02-01', 'HUTANG PAJAK PPH PASAL 23'),
(153, '2107-03-00', 'HUTANG PAJAK PPH PASAL 25/29'),
(154, '2107-03-01', 'HUTANG PAJAK PPH PASAL 25/29'),
(155, '2107-04-00', 'HUTANG PPN'),
(156, '2107-04-01', 'HUTANG PPN'),
(157, '2108-01-00', 'HUTANG BIAYA'),
(158, '2108-01-01', 'HUTANG SEWA'),
(159, '2108-01-02', 'HUTANG IKLAN'),
(160, '2108-01-03', 'HUTANG ASURANSI'),
(161, '2109-01-00', 'HUTANG AFILIASI'),
(162, '2109-01-01', 'HUTANG AFILIASI'),
(163, '2110-01-00', 'HUTANG LAIN-LAIN'),
(164, '2110-01-01', 'HUTANG LAIN-LAIN'),
(165, '2300-00-00', 'HUTANG PAJAK TANGGUHAN'),
(166, '2301-00-00', 'HUTANG PAJAK TANGGUHAN'),
(167, '2301-01-00', 'HUTANG PAJAK TANGGUHAN'),
(168, '2301-01-01', 'HUTANG PAJAK TANGGUHAN'),
(169, '3000-00-00', 'EKUITAS'),
(170, '3100-00-00', 'M O D A L DI SETOR'),
(171, '3101-00-00', 'MODAL'),
(172, '3101-01-00', 'MODAL'),
(173, '3101-01-01', 'MODAL SAHAM'),
(174, '3201-00-00', 'MODAL DONASI'),
(175, '3201-01-00', 'MODAL DONASI'),
(176, '3201-01-01', 'MODAL DONASI'),
(177, '3201-01-02', 'DEVIDEN'),
(178, '3300-00-00', 'PRIVE OWNER'),
(179, '3301-00-00', 'PRIVE OWNER'),
(180, '3301-01-00', 'PRIVE OWNER'),
(181, '3301-01-01', 'PRIVE OWNER'),
(182, '3400-00-00', 'REVALUASI  AKTIVA TETAP'),
(183, '3400-01-00', 'REVALUASI  AKTIVA TETAP'),
(184, '3400-01-01', 'REVALUASI  AKTIVA TETAP'),
(185, '3900-00-00', 'LABA'),
(186, '3901-00-00', 'LABA ( RUGI ) DITAHAN'),
(187, '3901-01-00', 'LABA ( RUGI ) DITAHAN'),
(188, '3901-01-01', 'LABA DITAHAN'),
(189, '3901-01-02', 'HISTORICAL BALANCING'),
(190, '3901-02-00', 'KOREKSI LABA ( RUGI ) DITAHAN'),
(191, '3901-02-01', 'KOREKSI LABA ( RUGI ) DITAHAN'),
(192, '3902-00-00', 'LABA ( RUGI ) TAHUN BERJALAN'),
(193, '3902-01-00', 'LABA ( RUGI ) TAHUN BERJALAN'),
(194, '3902-01-01', 'LABA ( RUGI ) TAHUN BERJALAN'),
(195, '3903-00-00', 'LABA ( RUGI ) BULAN BERJALAN'),
(196, '3903-01-00', 'LABA ( RUGI ) BULAN BERJALAN'),
(197, '3903-01-01', 'LABA ( RUGI ) BULAN BERJALAN'),
(198, '4000-00-00', 'PENJUALAN'),
(199, '4100-00-00', 'PENJUALAN'),
(200, '4101-00-00', 'PENJUALAN BRUTO'),
(201, '4101-01-00', 'PENJUALAN OOH'),
(202, '4101-01-01', 'BB EXISTING'),
(203, '4101-01-02', 'BB RENTAL'),
(204, '4101-01-03', 'BB BANGUN BARU'),
(205, '4101-01-04', 'JASA BANGUN PERIJINAN'),
(206, '4101-01-05', 'REPOSTERING'),
(207, '4101-02-00', 'PENJUALAN DOOH'),
(208, '4101-02-01', 'LED EXISTING'),
(209, '4101-02-02', 'LED RENTAL'),
(210, '4101-02-03', 'LED BANGUN BARU'),
(211, '4101-02-04', 'JASA BANGUN PERIJINAN'),
(212, '4102-00-00', 'RETUR PENJUALAN'),
(213, '4102-01-00', 'RETUR PENJUALAN'),
(214, '4102-01-01', 'RETUR PENJUALAN'),
(215, '4103-00-00', 'POTONGAN PENJUALAN'),
(216, '4103-01-00', 'POTONGAN PENJUALAN'),
(217, '4103-01-01', 'POTONGAN PENJUALAN'),
(218, '4104-00-00', 'KOREKSI PENJUALAN'),
(219, '4104-01-00', 'KOREKSI PENJUALAN'),
(220, '4104-01-01', 'KOREKSI PENJUALAN'),
(221, '5000-00-00', 'HARGA POKOK PENJUALAN'),
(222, '5100-00-00', 'HARGA POKOK PENJUALAN'),
(223, '5101-00-00', 'HPP'),
(224, '6000-00-00', 'BIAYA'),
(225, '6100-00-00', 'BIAYA PEMASARAN DAN PENJUALAN'),
(226, '6101-00-00', 'BIAYA PEMASARAN DAN PENJUALAN'),
(227, '6101-01-00', 'BIAYA PEMASARAN DAN PENJUALAN'),
(228, '6101-01-01', 'BIAYA GAJI PEMASARAN'),
(229, '6101-01-02', 'THR PEMASARAN'),
(230, '6101-01-03', 'TUNJANGAN LAIN PEMASARAN'),
(231, '6101-01-04', 'KOMISI PEMASARAN'),
(232, '6101-01-05', 'PERJALANAN DINAS PEMASARAN'),
(233, '6101-01-06', 'ENTERTAIN'),
(234, '6101-01-07', 'MANAJEMEN FEE'),
(235, '6101-03-00', 'BIAYA AKTIFITAS PENJUALAN'),
(236, '6101-03-01', 'BIAYA PERJALANAN DINAS PENJUALAN'),
(237, '6200-00-00', 'BIAYA ADM DAN UMUM'),
(238, '6201-00-00', 'BIAYA ADM DAN UMUM'),
(239, '6201-01-00', 'BIAYA UMUM GAJI DAN TUNJANGAN'),
(240, '6201-01-01', 'GAJI UMUM'),
(241, '6201-01-02', 'THR UMUM'),
(242, '6201-01-03', 'LEMBUR UMUM'),
(243, '6201-01-04', 'BONUS UMUM'),
(244, '6201-01-05', 'TUNJANGAN TETAP UMUM'),
(245, '6201-01-06', 'TUNJANGAN LAIN UMUM'),
(246, '6201-01-07', 'BPJS KESEHATAN UMUM'),
(247, '6201-01-08', 'BPJS KETENAGAKERJAAN UMUM'),
(248, '6800-00-00', 'BIAYA ADM DAN UMUM'),
(249, '6811-00-00', 'BIAYA ADM DAN UMUM'),
(250, '6811-01-00', 'BIAYA ADM DAN UMUM'),
(251, '6811-01-01', 'PERJALANAN DINAS'),
(252, '6811-01-02', 'TRANSPORTASI'),
(253, '6811-01-03', 'FOTO KOPI'),
(254, '6811-01-04', 'JASA TENAGA AHLI'),
(255, '6811-01-05', 'JASA PENYEDIA TENAGA KERJA'),
(256, '6811-01-06', 'ALAT TULIS KANTOR'),
(257, '6811-01-07', 'LISTRIK'),
(258, '6811-01-08', 'AIR'),
(259, '6811-01-09', 'TELP, FAX, INTERNET'),
(260, '6811-01-10', 'ASURANSI KESEHATAN'),
(261, '6811-01-11', 'PENGOBATAN KARYAWAN'),
(262, '6811-01-12', 'BIAYA PAJAK'),
(263, '6811-01-13', 'PERIJINAN'),
(264, '6811-01-15', 'SERAGAM'),
(265, '6811-01-16', 'SOFTWARE'),
(266, '6811-01-17', 'SEMINAR DAN PELATIHAN'),
(267, '6811-01-18', 'SUMBANGAN'),
(268, '6811-01-19', 'GATHERING'),
(269, '6811-01-20', 'KOMISI CLIENT'),
(270, '6811-01-21', 'PENGIRIMAN DAN EKSPEDISI'),
(271, '6811-01-22', 'SERTIFIKASI'),
(272, '6811-01-23', 'KEAMANAN DAN KEBERSIHAN'),
(273, '6811-01-24', 'KESEJAHTERAAN KARYAWAN'),
(274, '6811-01-25', 'REKRUT TENAGA KERJA'),
(275, '6811-01-26', 'KEPERLUAN KANTOR'),
(276, '6811-01-27', 'MATERAI'),
(277, '6821-00-00', 'BIAYA PEMELIHARAAN'),
(278, '6821-01-00', 'PEMELIHARAAN BANGUNAN'),
(279, '6821-01-01', 'PEMELIHARAAN BANGUNAN'),
(280, '6821-02-00', 'PERAWATAN KENDARAAN'),
(281, '6821-02-01', 'PERAWATAN KENDARAAN'),
(282, '6821-03-00', 'PEMELIHARAAN PERALATAN DAN PERLENGKAPAN'),
(283, '6821-03-01', 'PEMELIHARAAN PERALATAN DAN PERLENGKAPAN'),
(284, '6821-04-00', 'PEMELIHARAAN INVENTARIS KANTOR'),
(285, '6821-04-01', 'PEMELIHARAAN INVENTARIS KANTOR'),
(286, '6821-05-00', 'PEMELIHARAAN FURNITURE DAN FIXTURE'),
(287, '6821-05-01', 'PEMELIHARAAN FURNITURE DAN FIXTURE'),
(288, '6831-00-00', 'BIAYA PENYUSUTAN DAN AMORTISASI'),
(289, '6831-01-00', 'BIAYA PENYUSUTAN'),
(290, '6831-01-01', 'BIAYA PENYUSUTAN BANGUNAN'),
(291, '6831-01-02', 'BIAYA PENYUSUTAN KENDARAAN'),
(292, '6831-01-03', 'BIAYA PENYUSUTAN KONTRUKSI'),
(293, '6831-01-04', 'BIAYA PENYUSUTAN PERALATAN'),
(294, '6831-02-00', 'BIAYA AMORTISASI'),
(295, '6831-02-01', 'BIAYA SEWA BANGUNAN'),
(296, '6831-02-02', 'BIAYA SEWA KENDARAAN'),
(297, '6831-02-03', 'BIAYA SEWA PERALATAN'),
(298, '6831-02-04', 'BIAYA SEWA TANAH / LOKASI'),
(299, '6831-02-05', 'BIAYA PENYUSUTAN HARTA LAINNYA'),
(300, '7100-00-00', 'PENDAPATAN LAIN-LAIN'),
(301, '7101-00-00', 'PENDAPATAN LAIN-LAIN'),
(302, '7101-01-00', 'PENDAPATAN LAIN-LAIN'),
(303, '7101-01-01', 'PENDAPATAN PENJUALAN ASSET'),
(304, '7101-01-02', 'PENDAPATAN SELISIH KURS'),
(305, '7101-01-03', 'PENDAPATAN BUNGA BANK'),
(306, '7101-01-04', 'PENDAPATAN LAINNYA'),
(307, '7201-00-00', 'BIAYA LAIN-LAIN'),
(308, '7201-02-00', 'BIAYA BANK'),
(309, '7201-02-01', 'PAJAK PENDAPATAN BUNGA BANK'),
(310, '7201-02-02', 'BIAYA ADMINISTRASI BANK'),
(311, '9100-00-00', 'TAKSIRAN PAJAK'),
(312, '9101-00-00', 'TAKSIRAN PAJAK'),
(313, '9101-01-00', 'TAKSIRAN PAJAK'),
(314, '9101-01-01', 'TAKSIRAN PAJAK'),
(315, '9200-00-00', 'REKENING SEMENTARA'),
(316, '9201-00-00', 'REKENING SEMENTARA'),
(317, '9201-01-00', 'REKENING SEMENTARA'),
(318, '9201-01-01', 'REKENING SEMENTARA'),
(319, '2105-00-00', 'UANG MUKA CUSTOMER'),
(320, '2105-01-00', 'UANG MUKA CUSTOMER'),
(321, '2105-01-01', 'UANG MUKA CUSTOMER'),
(322, '1101-01-03', 'KAS-TRAFFIC'),
(323, '1104-02-02', 'PIUTANG PAJAK REKLAME'),
(324, '1108-02-00', 'UANG MUKA PEMBELIAN'),
(325, '1108-02-01', 'UANG MUKA PEMBELIAN BANGUNAN'),
(326, '1108-02-02', 'UANG MUKA PEMBELIAN KENDARAAN'),
(327, '1108-02-03', 'UANG MUKA PEMBELIAN KONSTRUKSI'),
(328, '1108-02-04', 'UANG MUKA PEMBELIAN PERALATAN'),
(329, '1108-02-05', 'UANG MUKA PEMBELIAN TANAH/LOKASI'),
(330, '1107-01-05', 'SEWA TANAH/LOKASI DIBAYAR DIMUKA'),
(331, '1308-00-00', 'KONSTRUKSI'),
(332, '1308-01-00', 'KONSTRUKSI'),
(333, '1308-01-01', 'KONSTRUKSI'),
(334, '1309-09-00', 'AKUM. PENYUSUTAN KONSTRUKSI'),
(335, '1309-09-01', 'AKUM. PENYUSUTAN KONSTRUKSI'),
(336, '1901-01-04', 'ASET TIDAK BERWUJUD'),
(337, '1901-01-05', 'AKUM. PENYUSUTAN ASET TIDAK BERWUJUD'),
(338, '2107-05-00', 'HUTANG PPH 4(2)'),
(339, '2107-05-01', 'HUTANG PPH 4(2)'),
(340, '2108-01-04', 'HUTANG LISTRIK'),
(341, '2108-01-05', 'HUTANG TELEPON,FAX,DAN INTERNET'),
(342, '2108-01-06', 'HUTANG BPJS'),
(343, '2200-00-00', 'KEWAJIBAN TIDAK LANCAR'),
(344, '2201-00-00', 'KEWAJIBAN TIDAK LANCAR'),
(345, '2201-01-00', 'KEWAJIBAN TIDAK LANCAR'),
(346, '2201-01-01', 'KEWAJIBAN TIDAK LANCAR'),
(347, '5101-04-00', 'HPP OPERASIONAL BULANAN'),
(348, '5101-04-01', 'HPP OPERASIONAL BULANAN'),
(349, '5101-05-00', 'HPP PEMASANGAN TITIK BARU'),
(350, '5101-05-01', 'HPP PEMASANGAN TITIK BARU'),
(351, '5101-06-00', 'HPP OPERASIONAL PEMASANGAN TITIK BARU'),
(352, '5101-06-01', 'HPP OPERASIONAL PEMASANGAN TITIK BARU'),
(353, '5101-07-00', 'HPP SEWA KONSTRUKSI'),
(354, '5101-07-01', 'HPP SEWA KONSTRUKSI'),
(355, '5101-08-00', 'HPP REPOSTERING'),
(356, '5101-08-01', 'HPP REPOSTERING'),
(357, '5101-09-00', 'HPP JASA BANGUN BISNIS KONSTRUKSI'),
(358, '5101-09-01', 'HPP JASA BANGUN BISNIS KONSTRUKSI'),
(359, '5101-10-00', 'HPP AMORTISASI'),
(360, '5101-10-01', 'HPP AMORTISASI'),
(361, '6101-01-16', 'BIAYA LEMBUR PEMASARAN'),
(362, '6101-01-17', 'BIAYA TUNJANGAN TETAP PEMASARAN'),
(363, '6101-02-00', 'BIAYA AKTIFITAS PEMASARAN'),
(364, '6101-02-01', 'BIAYA AKTIFITAS PEMASARAN'),
(365, '6101-03-02', 'TRANSPORTASI PENJUALAN'),
(366, '6101-03-03', 'BIAYA JAMUAN PENJUALAN'),
(367, '6201-02-00', 'PESANGON/PENSIUN'),
(368, '6201-02-01', 'PESANGON/PENSIUN'),
(369, '6201-03-00', 'BIAYA UMUM KENDARAAN'),
(370, '6201-03-01', 'SEWA KENDARAAN UMUM'),
(371, '6201-03-02', 'ASURANSI KENDARAAN UMUM'),
(372, '6201-03-03', 'PEMELIHARAAN KENDARAAN UMUM'),
(373, '6201-03-04', 'PAJAK DAN ADMINISTRASI KENDARAAN UMUM'),
(374, '6201-04-00', 'BIAYA UMUM BANGUNAN'),
(375, '6201-04-01', 'SEWA BANGUNAN UMUM'),
(376, '6201-04-02', 'ASURANSI BANGUNAN UMUM'),
(377, '6201-04-03', 'PEMELIHARAAN BANGUNAN KANTOR UMUM'),
(378, '6201-05-00', 'BIAYA UMUM PERALATAN'),
(379, '6201-05-01', 'SEWA PERALATAN UMUM'),
(380, '6201-05-02', 'ASURANSI PERALATAN UMUM'),
(381, '6201-05-03', 'PEMELIHARAAN PERALATAN UMUM'),
(382, '6811-01-14', 'JAMUAN'),
(383, '7201-01-00', 'BIAYA LAIN-LAIN'),
(384, '7201-01-01', 'RUGI PENJUALAN ASET'),
(385, '7201-01-02', 'RUGI SELISIH KURS'),
(386, '7201-02-03', 'PROVISI BANK'),
(387, '7201-02-04', 'BUNGA BANK'),
(388, '7201-01-03', 'SELISIH PEMBULATAN'),
(389, '7201-01-04', 'BIAYA LAINNYA'),
(390, '1000-00-00', 'ASET'),
(391, '1100-00-00', 'ASET LANCAR'),
(392, '1101-00-00', 'KAS & SETARA KAS'),
(393, '1101-01-00', 'KAS & SETARA KAS'),
(394, '1101-01-01', 'KAS-GA'),
(395, '1101-01-02', 'KAS-PRODUCTION'),
(396, '1101-01-03', 'KAS-TRAFFIC'),
(397, '1101-99-00', 'AYAT SILANG'),
(398, '1101-99-01', 'AYAT SILANG'),
(399, '1102-00-00', 'BANK'),
(400, '1102-01-00', 'BANK'),
(401, '1102-01-01', 'BANK MEGA'),
(402, '1102-01-02', 'BANK MANDIRI'),
(403, '1102-01-03', 'BANK BNI'),
(404, '1102-01-04', 'BANK BCA (IN)'),
(405, '1102-01-05', 'BANK BCA (OUT)'),
(406, '1102-01-06', 'BANK BCA (USD)'),
(407, '1102-01-07', 'BANK BJB'),
(408, '1102-01-08', 'BANK OCBC NISP'),
(409, '1103-00-00', 'TIME DEPOSIT'),
(410, '1103-01-00', 'TIME DEPOSIT'),
(411, '1103-01-01', 'TIME DEPOSIT'),
(412, '1104-00-00', 'PIUTANG'),
(413, '1104-01-00', 'PIUTANG USAHA'),
(414, '1104-01-01', 'PIUTANG OOH'),
(415, '1104-01-02', 'PIUTANG DOOH'),
(416, '1104-01-03', 'PIUTANG JASA BANGUN PERIJINAN'),
(417, '1104-02-00', 'PIUTANG PAJAK'),
(418, '1104-02-01', 'PIUTANG PPH 23'),
(419, '1104-02-02', 'PIUTANG PAJAK REKLAME'),
(420, '1104-03-00', 'PIUTANG AFILIASI'),
(421, '1104-03-01', 'PIUTANG PT. DINAMIKA NEO SEMESTA'),
(422, '1104-04-00', 'PIUTANG LAIN-LAIN'),
(423, '1104-04-01', 'PIUTANG KARYAWAN'),
(424, '1104-04-02', 'PIUTANG PEMEGANG SAHAM'),
(425, '1104-04-03', 'PIUTANG SKPD'),
(426, '1104-04-04', 'PIUTANG LAINNYA'),
(427, '1105-00-00', 'PERSEDIAAN BARANG'),
(428, '1105-01-00', 'PERSEDIAAN BARANG'),
(429, '1105-01-01', 'PERSEDIAAN BARANG'),
(430, '1106-00-00', 'SIMPANAN JAMINAN'),
(431, '1106-01-00', 'SIMPANAN JAMINAN'),
(432, '1106-01-01', 'JAMINAN BANGUNAN'),
(433, '1106-01-02', 'JAMINAN BONGKAR BB'),
(434, '1107-00-00', 'BIAYA DIBAYAR DIMUKA'),
(435, '1107-01-00', 'SEWA DIBAYAR DIMUKA'),
(436, '1107-01-01', 'SEWA BANGUNAN DIBAYAR DIMUKA'),
(437, '1107-01-02', 'SEWA KENDARAAN DIBAYAR DIMUKA'),
(438, '1107-01-03', 'SEWA KONSTRUKSI DIBAYAR DIMUKA'),
(439, '1107-01-04', 'SEWA PERALATAN DIBAYAR DIMUKA'),
(440, '1107-01-05', 'SEWA TANAH/LOKASI DIBAYAR DIMUKA'),
(441, '1107-02-00', 'IKLAN DIBAYAR DIMUKA'),
(442, '1107-02-01', 'IKLAN LOKER DIBAYAR DIMUKA'),
(443, '1107-03-00', 'ASURANSI DIBAYAR DIMUKA'),
(444, '1107-03-01', 'ASURANSI BANGUNAN DIBAYAR DIMUKA'),
(445, '1107-03-02', 'ASURANSI KENDARAAN DIBAYAR DIMUKA'),
(446, '1107-03-03', 'ASURANSI KONSTRUKSI DIBAYAR DIMUKA'),
(447, '1107-04-00', 'PAJAK DIBAYAR DIMUKA'),
(448, '1107-04-01', 'PAJAK DIBAYAR DIMUKA PPH 22'),
(449, '1107-04-02', 'PAJAK DIBAYAR DIMUKA PPH 23'),
(450, '1107-04-03', 'PAJAK DIBAYAR DIMUKA PPH 25'),
(451, '1108-00-00', 'UANG MUKA'),
(452, '1108-01-00', 'UANG MUKA SEWA'),
(453, '1108-01-01', 'UANG MUKA SEWA BANGUNAN'),
(454, '1108-01-02', 'UANG MUKA SEWA KENDARAAN'),
(455, '1108-01-03', 'UANG MUKA SEWA KONSTRUKSI'),
(456, '1108-01-04', 'UANG MUKA SEWA PERALATAN'),
(457, '1108-01-05', 'UANG MUKA SEWA TANAH/LOKASI'),
(458, '1108-02-00', 'UANG MUKA PEMBELIAN'),
(459, '1108-02-01', 'UANG MUKA PEMBELIAN BANGUNAN'),
(460, '1108-02-02', 'UANG MUKA PEMBELIAN KENDARAAN'),
(461, '1108-02-03', 'UANG MUKA PEMBELIAN KONSTRUKSI'),
(462, '1108-02-04', 'UANG MUKA PEMBELIAN PERALATAN'),
(463, '1108-02-05', 'UANG MUKA PEMBELIAN TANAH/LOKASI'),
(464, '1108-03-00', 'UANG MUKA PENGALIHAN HAK'),
(465, '1108-03-01', 'UANG MUKA PENGALIHAN HAK'),
(466, '1108-04-00', 'UANG MUKA PLN'),
(467, '1108-04-01', 'UANG MUKA PLN'),
(468, '1108-05-00', 'UANG MUKA LAIN-LAIN'),
(469, '1108-05-01', 'UANG MUKA LAIN-LAIN'),
(470, '1110-00-00', 'PAJAK DIBAYAR DIMUKA'),
(471, '1110-01-00', 'PAJAK PPh PASAL 22'),
(472, '1110-01-01', 'PAJAK PPh PASAL 22'),
(473, '1110-02-00', 'PAJAK PPh PASAL 23'),
(474, '1110-02-01', 'PAJAK PPh PASAL 23'),
(475, '1110-03-00', 'PAJAK PPh PASAL 25'),
(476, '1110-03-01', 'PAJAK PPh PASAL 25'),
(477, '1110-03-02', 'LEBIH BAYAR PPh BADAN'),
(478, '1110-04-00', 'PPN MASUKAN'),
(479, '1110-04-01', 'PPN MASUKAN'),
(480, '1110-05-00', 'PAJAK PPh PASAL 4'),
(481, '1110-05-01', 'PAJAK PPh PASAL 4'),
(482, '1110-06-00', 'PAJAK PPH  PASAL 21'),
(483, '1110-06-01', 'PAJAK PPH PASAL 21'),
(484, '1200-00-00', 'ASET TIDAK LANCAR'),
(485, '1201-00-00', 'INVESTASI JANGKA PANJANG'),
(486, '1201-01-00', 'SAHAM'),
(487, '1201-01-01', 'SAHAM PT. DINAMIKA NEO SEMESTA'),
(488, '1300-00-00', 'AKTIVA TETAP'),
(489, '1301-00-00', 'TANAH'),
(490, '1301-01-00', 'TANAH'),
(491, '1301-01-01', 'TANAH'),
(492, '1302-00-00', 'GEDUNG & BANGUNAN'),
(493, '1302-01-00', 'GEDUNG & BANGUNAN'),
(494, '1302-01-01', 'GEDUNG & BANGUNAN'),
(495, '1303-00-00', 'KENDARAAN BERMOTOR'),
(496, '1303-01-00', 'KENDARAAN BERMOTOR OPERASIONAL'),
(497, '1303-01-01', 'KENDARAAN BERMOTOR OPERASIONAL'),
(498, '1303-02-00', 'ASET TITIK'),
(499, '1303-02-01', 'ASET TITIK'),
(500, '1304-00-00', 'PERALATAN & PERLENGKAPAN'),
(501, '1304-01-00', 'PERALATAN & PERLENGKAPAN'),
(502, '1304-01-01', 'PERALATAN & PERLENGKAPAN'),
(503, '1305-00-00', 'INVENTARIS KANTOR'),
(504, '1305-01-00', 'INVENTARIS KANTOR'),
(505, '1305-01-01', 'INVENTARIS KANTOR'),
(506, '1306-00-00', 'FURNITURE & FIXTURE'),
(507, '1306-01-00', 'FURNITURE & FIXTURE'),
(508, '1306-01-01', 'FURNITURE & FIXTURE'),
(509, '1307-00-00', 'ASET TETAP TIDAK BERWUJUD'),
(510, '1307-01-00', 'ASET TETAP TIDAK BERWUJUD'),
(511, '1307-01-01', 'ASET TETAP TIDAK BERWUJUD'),
(512, '1308-00-00', 'KONSTRUKSI'),
(513, '1308-01-00', 'KONSTRUKSI'),
(514, '1308-01-01', 'KONSTRUKSI'),
(515, '1309-00-00', 'AKUMULASI PENYUSUTAN'),
(516, '1309-03-00', 'AKU.PENYU - PERALATAN & PERLENGKAPAN'),
(517, '1309-03-01', 'AKU.PENYU - PERALATAN & PERLENGKAPAN'),
(518, '1309-04-00', 'AKU.PENYU - INVENTARIS KANTOR'),
(519, '1309-04-01', 'AKU.PENYU - INVENTARIS KANTOR'),
(520, '1309-05-00', 'AKUMULASI PENYUSUTAN KENDARAAN'),
(521, '1309-05-01', 'AKUMULASI PENYUSUTAN KENDARAAN'),
(522, '1309-06-00', 'AKUMULASI PENYUSUTAN ASET TITIK'),
(523, '1309-06-01', 'AKUMULASI PENYUSUTAN ASET TITIK'),
(524, '1309-07-00', 'AKUMULASI PENYUSUTAN BANGUNAN'),
(525, '1309-07-01', 'AKUMULASI PENYUSUTAN BANGUNAN'),
(526, '1309-08-00', 'AKUMULASI PENYUSUTAN HARTA LAINNYA'),
(527, '1309-08-01', 'AKUMULASI PENYUSUTAN HARTA LAINNYA'),
(528, '1309-09-00', 'AKUM. PENYUSUTAN KONSTRUKSI'),
(529, '1309-09-01', 'AKUM. PENYUSUTAN KONSTRUKSI'),
(530, '1900-00-00', 'ASET LAIN-LAIN'),
(531, '1901-00-00', 'ASET LAIN-LAIN'),
(532, '1901-01-00', 'ASET LAIN-LAIN'),
(533, '1901-01-01', 'ASET PAJAK TANGGUHAN'),
(534, '1901-01-02', 'AMORTISASI AKTIVA LAIN-LAIN'),
(535, '1901-01-03', 'ASET TETAP LAIN-LAIN'),
(536, '1901-01-04', 'ASET TIDAK BERWUJUD'),
(537, '1901-01-05', 'AKUM. PENYUSUTAN ASET TIDAK BERWUJUD'),
(538, '2000-00-00', 'KEWAJIBAN'),
(539, '2100-00-00', 'KEWAJIBAN LANCAR'),
(540, '2101-00-00', 'HUTANG USAHA'),
(541, '2101-01-00', 'HUTANG USAHA'),
(542, '2101-01-01', 'HUTANG USAHA VENDOR'),
(543, '2101-01-02', 'HUTANG USAHA LAIN-LAIN'),
(544, '2102-00-00', 'HUTANG BANK'),
(545, '2102-01-00', 'HUTANG BANK'),
(546, '2102-01-01', 'HUTANG BANK'),
(547, '2103-00-00', 'HUTANG LEASING'),
(548, '2103-01-00', 'HUTANG LEASING'),
(549, '2103-01-01', 'HUTANG LEASING KENDARAAN'),
(550, '2104-00-00', 'HUTANG PEMEGANG SAHAM'),
(551, '2104-01-00', 'HUTANG PEMEGANG SAHAM'),
(552, '2104-01-01', 'HUTANG PEMEGANG SAHAM'),
(553, '2105-00-00', 'UANG MUKA CUSTOMER'),
(554, '2105-01-00', 'UANG MUKA CUSTOMER'),
(555, '2105-01-01', 'UANG MUKA CUSTOMER'),
(556, '2107-00-00', 'HUTANG PAJAK'),
(557, '2107-01-00', 'HUTANG PAJAK PPH PASAL 21'),
(558, '2107-01-01', 'HUTANG PAJAK PPH PASAL 21'),
(559, '2107-02-00', 'HUTANG PAJAK PPH PASAL 23'),
(560, '2107-02-01', 'HUTANG PAJAK PPH PASAL 23'),
(561, '2107-03-00', 'HUTANG PAJAK PPH PASAL 25/29'),
(562, '2107-03-01', 'HUTANG PAJAK PPH PASAL 25/29'),
(563, '2107-04-00', 'HUTANG PPN'),
(564, '2107-04-01', 'HUTANG PPN'),
(565, '2107-05-00', 'HUTANG PPH 4(2)'),
(566, '2107-05-01', 'HUTANG PPH 4(2)'),
(567, '2108-01-00', 'HUTANG BIAYA'),
(568, '2108-01-01', 'HUTANG SEWA'),
(569, '2108-01-02', 'HUTANG IKLAN'),
(570, '2108-01-03', 'HUTANG ASURANSI'),
(571, '2108-01-04', 'HUTANG LISTRIK'),
(572, '2108-01-05', 'HUTANG TELEPON,FAX,DAN INTERNET'),
(573, '2108-01-06', 'HUTANG BPJS'),
(574, '2109-01-00', 'HUTANG AFILIASI'),
(575, '2109-01-01', 'HUTANG AFILIASI'),
(576, '2110-01-00', 'HUTANG LAIN-LAIN'),
(577, '2110-01-01', 'HUTANG LAIN-LAIN'),
(578, '2200-00-00', 'KEWAJIBAN TIDAK LANCAR'),
(579, '2201-00-00', 'KEWAJIBAN TIDAK LANCAR'),
(580, '2201-01-00', 'KEWAJIBAN TIDAK LANCAR'),
(581, '2201-01-01', 'KEWAJIBAN TIDAK LANCAR'),
(582, '2300-00-00', 'HUTANG PAJAK TANGGUHAN'),
(583, '2301-00-00', 'HUTANG PAJAK TANGGUHAN'),
(584, '2301-01-00', 'HUTANG PAJAK TANGGUHAN'),
(585, '2301-01-01', 'HUTANG PAJAK TANGGUHAN'),
(586, '3000-00-00', 'EKUITAS'),
(587, '3100-00-00', 'M O D A L DI SETOR'),
(588, '3101-00-00', 'MODAL'),
(589, '3101-01-00', 'MODAL'),
(590, '3101-01-01', 'MODAL SAHAM'),
(591, '3201-00-00', 'MODAL DONASI'),
(592, '3201-01-00', 'MODAL DONASI'),
(593, '3201-01-01', 'MODAL DONASI'),
(594, '3201-01-02', 'DEVIDEN'),
(595, '3300-00-00', 'PRIVE OWNER'),
(596, '3301-00-00', 'PRIVE OWNER'),
(597, '3301-01-00', 'PRIVE OWNER'),
(598, '3301-01-01', 'PRIVE OWNER'),
(599, '3400-00-00', 'REVALUASI  AKTIVA TETAP'),
(600, '3400-01-00', 'REVALUASI  AKTIVA TETAP'),
(601, '3400-01-01', 'REVALUASI  AKTIVA TETAP'),
(602, '3900-00-00', 'LABA'),
(603, '3901-00-00', 'LABA ( RUGI ) DITAHAN'),
(604, '3901-01-00', 'LABA ( RUGI ) DITAHAN'),
(605, '3901-01-01', 'LABA DITAHAN'),
(606, '3901-01-02', 'HISTORICAL BALANCING'),
(607, '3901-02-00', 'KOREKSI LABA ( RUGI ) DITAHAN'),
(608, '3901-02-01', 'KOREKSI LABA ( RUGI ) DITAHAN'),
(609, '3902-00-00', 'LABA ( RUGI ) TAHUN BERJALAN'),
(610, '3902-01-00', 'LABA ( RUGI ) TAHUN BERJALAN'),
(611, '3902-01-01', 'LABA ( RUGI ) TAHUN BERJALAN'),
(612, '3903-00-00', 'LABA ( RUGI ) BULAN BERJALAN'),
(613, '3903-01-00', 'LABA ( RUGI ) BULAN BERJALAN'),
(614, '3903-01-01', 'LABA ( RUGI ) BULAN BERJALAN'),
(615, '4000-00-00', 'PENJUALAN'),
(616, '4100-00-00', 'PENJUALAN'),
(617, '4101-00-00', 'PENJUALAN BRUTO'),
(618, '4101-01-00', 'PENJUALAN OOH'),
(619, '4101-01-01', 'BB EXISTING'),
(620, '4101-01-02', 'BB RENTAL'),
(621, '4101-01-03', 'BB BANGUN BARU'),
(622, '4101-01-04', 'JASA BANGUN PERIJINAN'),
(623, '4101-01-05', 'REPOSTERING'),
(624, '4101-02-00', 'PENJUALAN DOOH'),
(625, '4101-02-01', 'LED EXISTING'),
(626, '4101-02-02', 'LED RENTAL'),
(627, '4101-02-03', 'LED BANGUN BARU'),
(628, '4101-02-04', 'JASA BANGUN PERIJINAN'),
(629, '4102-00-00', 'RETUR PENJUALAN'),
(630, '4102-01-00', 'RETUR PENJUALAN'),
(631, '4102-01-01', 'RETUR PENJUALAN'),
(632, '4103-00-00', 'POTONGAN PENJUALAN'),
(633, '4103-01-00', 'POTONGAN PENJUALAN'),
(634, '4103-01-01', 'POTONGAN PENJUALAN'),
(635, '4104-00-00', 'KOREKSI PENJUALAN'),
(636, '4104-01-00', 'KOREKSI PENJUALAN'),
(637, '4104-01-01', 'KOREKSI PENJUALAN'),
(638, '5000-00-00', 'HARGA POKOK PENJUALAN'),
(639, '5100-00-00', 'HARGA POKOK PENJUALAN'),
(640, '5101-00-00', 'HPP'),
(641, '5101-04-00', 'HPP OPERASIONAL BULANAN'),
(642, '5101-04-01', 'HPP OPERASIONAL BULANAN'),
(643, '5101-05-00', 'HPP PEMASANGAN TITIK BARU'),
(644, '5101-05-01', 'HPP PEMASANGAN TITIK BARU'),
(645, '5101-06-00', 'HPP OPERASIONAL PEMASANGAN TITIK BARU'),
(646, '5101-06-01', 'HPP OPERASIONAL PEMASANGAN TITIK BARU'),
(647, '5101-07-00', 'HPP SEWA KONSTRUKSI'),
(648, '5101-07-01', 'HPP SEWA KONSTRUKSI'),
(649, '5101-08-00', 'HPP REPOSTERING'),
(650, '5101-08-01', 'HPP REPOSTERING'),
(651, '5101-09-00', 'HPP JASA BANGUN BISNIS KONSTRUKSI'),
(652, '5101-09-01', 'HPP JASA BANGUN BISNIS KONSTRUKSI'),
(653, '5101-10-00', 'HPP AMORTISASI'),
(654, '5101-10-01', 'HPP AMORTISASI'),
(655, '6000-00-00', 'BIAYA'),
(656, '6100-00-00', 'BIAYA PEMASARAN DAN PENJUALAN'),
(657, '6101-00-00', 'BIAYA PEMASARAN DAN PENJUALAN'),
(658, '6101-01-00', 'BIAYA PEMASARAN DAN PENJUALAN'),
(659, '6101-01-01', 'BIAYA GAJI PEMASARAN'),
(660, '6101-01-02', 'THR PEMASARAN'),
(661, '6101-01-03', 'TUNJANGAN LAIN PEMASARAN'),
(662, '6101-01-04', 'KOMISI PEMASARAN'),
(663, '6101-01-05', 'PERJALANAN DINAS PEMASARAN'),
(664, '6101-01-06', 'ENTERTAIN'),
(665, '6101-01-07', 'MANAJEMEN FEE'),
(666, '6101-01-16', 'BIAYA LEMBUR PEMASARAN'),
(667, '6101-01-17', 'BIAYA TUNJANGAN TETAP PEMASARAN'),
(668, '6101-02-00', 'BIAYA AKTIFITAS PEMASARAN'),
(669, '6101-02-01', 'BIAYA AKTIFITAS PEMASARAN'),
(670, '6101-03-00', 'BIAYA AKTIFITAS PENJUALAN'),
(671, '6101-03-01', 'BIAYA PERJALANAN DINAS PENJUALAN'),
(672, '6101-03-02', 'TRANSPORTASI PENJUALAN'),
(673, '6101-03-03', 'BIAYA JAMUAN PENJUALAN'),
(674, '6200-00-00', 'BIAYA ADM DAN UMUM'),
(675, '6201-00-00', 'BIAYA ADM DAN UMUM'),
(676, '6201-01-00', 'BIAYA UMUM GAJI DAN TUNJANGAN'),
(677, '6201-01-01', 'GAJI UMUM'),
(678, '6201-01-02', 'THR UMUM'),
(679, '6201-01-03', 'LEMBUR UMUM'),
(680, '6201-01-04', 'BONUS UMUM'),
(681, '6201-01-05', 'TUNJANGAN TETAP UMUM'),
(682, '6201-01-06', 'TUNJANGAN LAIN UMUM'),
(683, '6201-01-07', 'BPJS KESEHATAN UMUM'),
(684, '6201-01-08', 'BPJS KETENAGAKERJAAN UMUM'),
(685, '6201-02-00', 'PESANGON/PENSIUN'),
(686, '6201-02-01', 'PESANGON/PENSIUN'),
(687, '6201-03-00', 'BIAYA UMUM KENDARAAN'),
(688, '6201-03-01', 'SEWA KENDARAAN UMUM'),
(689, '6201-03-02', 'ASURANSI KENDARAAN UMUM'),
(690, '6201-03-03', 'PEMELIHARAAN KENDARAAN UMUM'),
(691, '6201-03-04', 'PAJAK DAN ADMINISTRASI KENDARAAN UMUM'),
(692, '6201-04-00', 'BIAYA UMUM BANGUNAN'),
(693, '6201-04-01', 'SEWA BANGUNAN UMUM'),
(694, '6201-04-02', 'ASURANSI BANGUNAN UMUM'),
(695, '6201-04-03', 'PEMELIHARAAN BANGUNAN KANTOR UMUM'),
(696, '6201-05-00', 'BIAYA UMUM PERALATAN'),
(697, '6201-05-01', 'SEWA PERALATAN UMUM'),
(698, '6201-05-02', 'ASURANSI PERALATAN UMUM'),
(699, '6201-05-03', 'PEMELIHARAAN PERALATAN UMUM'),
(700, '6800-00-00', 'BIAYA ADM DAN UMUM'),
(701, '6811-00-00', 'BIAYA ADM DAN UMUM'),
(702, '6811-01-00', 'BIAYA ADM DAN UMUM'),
(703, '6811-01-01', 'PERJALANAN DINAS'),
(704, '6811-01-02', 'TRANSPORTASI'),
(705, '6811-01-03', 'FOTO KOPI'),
(706, '6811-01-04', 'JASA TENAGA AHLI'),
(707, '6811-01-05', 'JASA PENYEDIA TENAGA KERJA'),
(708, '6811-01-06', 'ALAT TULIS KANTOR'),
(709, '6811-01-07', 'LISTRIK'),
(710, '6811-01-08', 'AIR'),
(711, '6811-01-09', 'TELP, FAX, INTERNET'),
(712, '6811-01-10', 'ASURANSI KESEHATAN'),
(713, '6811-01-11', 'PENGOBATAN KARYAWAN'),
(714, '6811-01-12', 'BIAYA PAJAK'),
(715, '6811-01-13', 'PERIJINAN'),
(716, '6811-01-14', 'JAMUAN'),
(717, '6811-01-15', 'SERAGAM'),
(718, '6811-01-16', 'SOFTWARE'),
(719, '6811-01-17', 'SEMINAR DAN PELATIHAN'),
(720, '6811-01-18', 'SUMBANGAN'),
(721, '6811-01-19', 'GATHERING'),
(722, '6811-01-20', 'KOMISI CLIENT'),
(723, '6811-01-21', 'PENGIRIMAN DAN EKSPEDISI'),
(724, '6811-01-22', 'SERTIFIKASI'),
(725, '6811-01-23', 'KEAMANAN DAN KEBERSIHAN'),
(726, '6811-01-24', 'KESEJAHTERAAN KARYAWAN'),
(727, '6811-01-25', 'REKRUT TENAGA KERJA'),
(728, '6811-01-26', 'KEPERLUAN KANTOR'),
(729, '6811-01-27', 'MATERAI'),
(730, '6821-00-00', 'BIAYA PEMELIHARAAN'),
(731, '6821-01-00', 'PEMELIHARAAN BANGUNAN'),
(732, '6821-01-01', 'PEMELIHARAAN BANGUNAN'),
(733, '6821-02-00', 'PERAWATAN KENDARAAN'),
(734, '6821-02-01', 'PERAWATAN KENDARAAN'),
(735, '6821-03-00', 'PEMELIHARAAN PERALATAN DAN PERLENGKAPAN'),
(736, '6821-03-01', 'PEMELIHARAAN PERALATAN DAN PERLENGKAPAN'),
(737, '6821-04-00', 'PEMELIHARAAN INVENTARIS KANTOR'),
(738, '6821-04-01', 'PEMELIHARAAN INVENTARIS KANTOR'),
(739, '6821-05-00', 'PEMELIHARAAN FURNITURE DAN FIXTURE'),
(740, '6821-05-01', 'PEMELIHARAAN FURNITURE DAN FIXTURE'),
(741, '6831-00-00', 'BIAYA PENYUSUTAN DAN AMORTISASI'),
(742, '6831-01-00', 'BIAYA PENYUSUTAN'),
(743, '6831-01-01', 'BIAYA PENYUSUTAN BANGUNAN'),
(744, '6831-01-02', 'BIAYA PENYUSUTAN KENDARAAN'),
(745, '6831-01-03', 'BIAYA PENYUSUTAN KONTRUKSI'),
(746, '6831-01-04', 'BIAYA PENYUSUTAN PERALATAN'),
(747, '6831-02-00', 'BIAYA AMORTISASI'),
(748, '6831-02-01', 'BIAYA SEWA BANGUNAN'),
(749, '6831-02-02', 'BIAYA SEWA KENDARAAN'),
(750, '6831-02-03', 'BIAYA SEWA PERALATAN'),
(751, '6831-02-04', 'BIAYA SEWA TANAH / LOKASI'),
(752, '6831-02-05', 'BIAYA PENYUSUTAN HARTA LAINNYA'),
(753, '7100-00-00', 'PENDAPATAN LAIN-LAIN'),
(754, '7101-00-00', 'PENDAPATAN LAIN-LAIN'),
(755, '7101-01-00', 'PENDAPATAN LAIN-LAIN'),
(756, '7101-01-01', 'PENDAPATAN PENJUALAN ASSET'),
(757, '7101-01-02', 'PENDAPATAN SELISIH KURS'),
(758, '7101-01-03', 'PENDAPATAN BUNGA BANK'),
(759, '7101-01-04', 'PENDAPATAN LAINNYA'),
(760, '7201-00-00', 'BIAYA LAIN-LAIN'),
(761, '7201-01-00', 'BIAYA LAIN-LAIN'),
(762, '7201-01-01', 'RUGI PENJUALAN ASET'),
(763, '7201-01-02', 'RUGI SELISIH KURS'),
(764, '7201-01-03', 'SELISIH PEMBULATAN'),
(765, '7201-01-04', 'BIAYA LAINNYA'),
(766, '7201-02-00', 'BIAYA BANK'),
(767, '7201-02-01', 'PAJAK PENDAPATAN BUNGA BANK'),
(768, '7201-02-02', 'BIAYA ADMINISTRASI BANK'),
(769, '7201-02-03', 'PROVISI BANK'),
(770, '7201-02-04', 'BUNGA BANK'),
(771, '9100-00-00', 'TAKSIRAN PAJAK'),
(772, '9101-00-00', 'TAKSIRAN PAJAK'),
(773, '9101-01-00', 'TAKSIRAN PAJAK'),
(774, '9101-01-01', 'TAKSIRAN PAJAK'),
(775, '9200-00-00', 'REKENING SEMENTARA'),
(776, '9201-00-00', 'REKENING SEMENTARA'),
(777, '9201-01-00', 'REKENING SEMENTARA'),
(778, '9201-01-01', 'REKENING SEMENTARA');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `coa`
--
ALTER TABLE `coa`
  ADD PRIMARY KEY (`id`) USING BTREE;
ALTER TABLE `coa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=779;
COMMIT;
