/*
 Navicat Premium Data Transfer

 Source Server         : funedge
 Source Server Type    : MySQL
 Source Server Version : 100517
 Source Host           : funedge.co.id:3306
 Source Schema         : funed713_task_monitoring

 Target Server Type    : MySQL
 Target Server Version : 100517
 File Encoding         : 65001

 Date: 15/12/2022 09:08:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_client
-- ----------------------------
DROP TABLE IF EXISTS `m_client`;
CREATE TABLE `m_client`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_client` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modified_at` datetime NULL DEFAULT NULL,
  `modified_by` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_client
-- ----------------------------
INSERT INTO `m_client` VALUES (67, 'Honda MAM', 'All MAM ', NULL, NULL, '2022-11-24 06:04:56', 1);
INSERT INTO `m_client` VALUES (68, 'Toyota Anzon', '-', NULL, NULL, '2022-12-02 10:04:00', 1);
INSERT INTO `m_client` VALUES (69, 'Honda Bintaro', 'Honda Bintaro', NULL, NULL, '2022-12-02 10:16:12', 1);
INSERT INTO `m_client` VALUES (70, 'Honda Cibubur', 'Honda Cibubur', NULL, NULL, '2022-12-02 10:20:01', 1);
INSERT INTO `m_client` VALUES (71, 'Hino MGI', 'Hino MGI', NULL, NULL, '2022-12-02 10:20:12', 1);
INSERT INTO `m_client` VALUES (72, 'Dealer Jateng', 'Dealer Jateng', NULL, NULL, '2022-12-02 10:20:40', 1);
INSERT INTO `m_client` VALUES (73, 'Honda IKB', 'Honda IKB', NULL, NULL, '2022-12-02 10:21:12', 1);
INSERT INTO `m_client` VALUES (74, 'Honda Kumala', 'Honda Kumala', NULL, NULL, '2022-12-02 10:21:32', 1);
INSERT INTO `m_client` VALUES (75, 'Honda Sunter', 'Honda Sunter', NULL, NULL, '2022-12-02 10:22:33', 1);
INSERT INTO `m_client` VALUES (76, 'HPM', 'HPM', NULL, NULL, '2022-12-02 10:22:47', 1);
INSERT INTO `m_client` VALUES (77, 'All Client', 'All Client', NULL, NULL, '2022-12-02 10:23:20', 1);
INSERT INTO `m_client` VALUES (78, 'Toyota Intercom', 'Toyota Intercom', NULL, NULL, '2022-12-02 10:23:43', 1);
INSERT INTO `m_client` VALUES (79, 'Honda Arta Cikupa', 'Honda Arta Cikupa', NULL, NULL, '2022-12-02 10:23:58', 1);
INSERT INTO `m_client` VALUES (80, 'Chery Arta Cikupa', 'Chery Arta Cikupa', NULL, NULL, '2022-12-02 10:24:07', 1);
INSERT INTO `m_client` VALUES (81, 'Honda Bone', 'Honda Bone', NULL, NULL, '2022-12-02 10:42:41', 1);
INSERT INTO `m_client` VALUES (82, 'TBD', 'TBD', NULL, NULL, '2022-12-02 10:44:18', 1);

-- ----------------------------
-- Table structure for m_numbering_details
-- ----------------------------
DROP TABLE IF EXISTS `m_numbering_details`;
CREATE TABLE `m_numbering_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefix` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_number` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_numbering_details
-- ----------------------------

-- ----------------------------
-- Table structure for m_numberings
-- ----------------------------
DROP TABLE IF EXISTS `m_numberings`;
CREATE TABLE `m_numberings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_toko` int NOT NULL,
  `prefix` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date_info` tinyint(1) NOT NULL,
  `padding` smallint NOT NULL,
  `prefix_separator` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date_separator` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_numberings
-- ----------------------------
INSERT INTO `m_numberings` VALUES (1, 0, 'PROJECT', 1, 4, '.', '.');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `roles` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'ADMIN');
INSERT INTO `roles` VALUES (2, 'PROJECT MANAGER');
INSERT INTO `roles` VALUES (3, 'USER');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_task` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `pic_id` int NOT NULL,
  `client_id` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `flag_delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  `closed_at` datetime NULL DEFAULT NULL,
  `closed_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 'Hansa Renkei', '2022-12-23', 8, 68, 'Create Program Hansa Renkei', 0, 0, '2022-12-08 09:11:13', 1, NULL, NULL);
INSERT INTO `task` VALUES (2, 'Digital Dokumen MAM', '2022-12-26', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 0, '2022-12-12 08:18:29', 1, NULL, NULL);
INSERT INTO `task` VALUES (3, 'Digital Dokumen Bintaro', '2022-12-22', 8, 69, 'PDF Faktur, Kwitansi, TTS', 0, 0, '2022-12-14 11:33:33', 1, NULL, NULL);
INSERT INTO `task` VALUES (4, 'Digital Dokumen Cibubur', '2022-12-22', 8, 70, 'PDF Faktur dan Kwitansi', 0, 0, '2022-12-14 11:33:45', 1, NULL, NULL);
INSERT INTO `task` VALUES (5, 'JACB Jateng', '2022-12-22', 8, 72, 'Implementasi JACB ke Dealer Jateng - Tunggu Request Dealer', 0, 0, '2022-12-14 11:33:58', 1, NULL, NULL);
INSERT INTO `task` VALUES (6, 'e-Meterai IKB', '2022-12-30', 8, 73, 'PDF Faktur dan Stamping e-Meterai', 0, 0, '2022-12-02 10:36:09', 1, NULL, NULL);
INSERT INTO `task` VALUES (7, 'List Request Karawang', '2022-12-20', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 0, '2022-12-14 11:43:36', 1, NULL, NULL);
INSERT INTO `task` VALUES (8, 'Standarisasi Master Tipe Kumala', '2022-12-19', 8, 74, 'Standarisasi untuk Master Tipe di Honda Karawang dan Cikampek untuk Kebutuhan Transfer in out via API', 0, 0, '2022-12-14 11:44:02', 1, NULL, NULL);
INSERT INTO `task` VALUES (9, 'List Request IKB BP (Pradana) ', '2022-12-22', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 0, '2022-12-14 11:34:37', 1, NULL, NULL);
INSERT INTO `task` VALUES (10, 'Insentif Sunter', '2022-12-15', 8, 75, 'Laporan - Laporan insentif Honda Sunter', 0, 0, '2022-12-14 11:49:02', 1, NULL, NULL);
INSERT INTO `task` VALUES (11, 'Monthly Meeting MGI', '2022-12-16', 8, 71, 'Monthly Meeting tiap hari selasa jam 10', 0, 0, '2022-12-08 09:08:14', 1, NULL, NULL);
INSERT INTO `task` VALUES (12, 'Implementasi Chery Arta Cikupa', '2022-12-18', 8, 80, 'Implementasi Dealer Chery Arta Cikupa', 0, 0, '2022-12-14 11:40:55', 1, NULL, NULL);
INSERT INTO `task` VALUES (13, 'Implementasi Honda Bone', '2022-12-21', 8, 81, 'Implementasi Honda Bone', 0, 0, '2022-12-14 11:35:34', 1, NULL, NULL);
INSERT INTO `task` VALUES (14, 'Implementasi Hyundai Batam', '2022-12-22', 8, 82, 'Implementasi Hyundai Batam', 0, 0, '2022-12-14 11:42:12', 1, NULL, NULL);
INSERT INTO `task` VALUES (15, 'Project management review', '2022-12-15', 8, 82, 'Project management review', 0, 0, '2022-12-14 11:41:44', 1, NULL, NULL);
INSERT INTO `task` VALUES (16, 'Standard Tasklist HPM (Remapping)', '2022-12-14', 8, 76, 'Standard Tasklist HPM (Remapping)', 1, 0, '2022-12-14 02:31:15', 13, '2022-12-15 02:01:09', 1);
INSERT INTO `task` VALUES (17, 'Penghapusan Piutang Honda Sunter', '2022-12-22', 8, 75, 'Penghapusan Piutang Honda Sunter sampai 31 Des 2021', 0, 0, '2022-12-14 11:35:44', 1, NULL, NULL);
INSERT INTO `task` VALUES (18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-13', 8, 73, 'Laporan pemakaian point dari Apps', 1, 0, '2022-12-13 03:14:25', 14, '2022-12-14 11:51:42', 1);
INSERT INTO `task` VALUES (19, 'Suara untuk QMS', '2022-12-14', 8, 77, 'Update Suara baru dan demo', 1, 0, '2022-12-14 07:34:56', 13, '2022-12-15 00:18:48', 1);
INSERT INTO `task` VALUES (20, 'List Request Intercom', '2022-12-19', 8, 78, 'List Request Intercom', 0, 0, '2022-12-14 11:36:40', 1, NULL, NULL);
INSERT INTO `task` VALUES (21, 'Sync Dashboard MAM', '2022-12-21', 8, 67, 'Program Sync Dashboard MAM', 0, 0, '2022-12-14 11:37:05', 1, NULL, NULL);
INSERT INTO `task` VALUES (22, 'AP Accessories Local Arta Cikupa', '2022-12-12', 8, 79, 'AP Accessories Local Arta Cikupa', 1, 0, '2022-12-14 11:37:22', 1, '2022-12-14 11:51:48', 1);
INSERT INTO `task` VALUES (23, 'Dokumen Manual DP untuk HPM', '2022-12-08', 8, 77, 'Dokumen Manual DP untuk HPM', 1, 0, '2022-12-07 02:46:19', 1, '2022-12-08 08:21:07', 15);

-- ----------------------------
-- Table structure for task_detail
-- ----------------------------
DROP TABLE IF EXISTS `task_detail`;
CREATE TABLE `task_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `task_number` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numbering` int NOT NULL,
  `tanggal` date NOT NULL,
  `pic_id` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `percentage` int NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `flag_delete` tinyint(1) NOT NULL DEFAULT 0,
  `level` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` int NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_detail
-- ----------------------------
INSERT INTO `task_detail` VALUES (1, 1, 'Task 1', 1, '2022-12-07', 13, 'Review Hasil Live 23 November', 100, 0, 0, 1, 0, '2022-12-06 04:56:49', 13);
INSERT INTO `task_detail` VALUES (2, 2, 'Task 1', 1, '2022-12-12', 13, 'Implementasi Honda BSB', 75, 0, 0, 1, 0, '2022-12-12 13:00:22', 1);
INSERT INTO `task_detail` VALUES (3, 2, 'Task 1.1', 1, '2022-12-09', 13, 'Review dan Adjusment PDF dengan Melly dan Anwar -> sudah difollow up dan belum ada respon -> sudah followup dan ingin langsung kirim wa ke customer', 100, 0, 0, 2, 2, '2022-12-07 13:22:54', 13);
INSERT INTO `task_detail` VALUES (4, 3, 'Task 1', 1, '2022-12-05', 12, 'Followup E-meterai menggunakan distributor yang mana', 98, 0, 0, 1, 0, '2022-12-06 09:46:50', 12);
INSERT INTO `task_detail` VALUES (5, 4, 'Task 1', 1, '2022-12-15', 12, 'Followup E-meterai menggunakan distributor pajakku.com', 98, 0, 0, 1, 0, '2022-12-08 09:03:19', 1);
INSERT INTO `task_detail` VALUES (6, 6, 'Task 1', 1, '2022-12-12', 15, 'Coding Titik Pengiriman Email ke Customer', 100, 0, 0, 1, 0, '2022-12-12 13:00:59', 1);
INSERT INTO `task_detail` VALUES (7, 6, 'Task 2', 2, '2022-12-05', 15, 'Dokumen SIT', 100, 0, 0, 1, 0, '2022-12-05 06:34:55', 1);
INSERT INTO `task_detail` VALUES (8, 6, 'Task 2.1', 1, '2022-12-02', 1, 'Pengisian Dokumen SIT', 100, 0, 0, 2, 7, '2022-12-02 10:58:24', 1);
INSERT INTO `task_detail` VALUES (9, 6, 'Task 2.2', 2, '2022-12-05', 1, 'Pengiriman Dokumen SIT', 100, 0, 0, 2, 7, '2022-12-05 06:34:55', 1);
INSERT INTO `task_detail` VALUES (10, 1, 'Task 1.1', 1, '2022-12-05', 13, 'Jadwalkan Meeting dengan Ibu Lisa', 100, 0, 0, 2, 1, '2022-12-05 04:38:39', 13);
INSERT INTO `task_detail` VALUES (11, 1, 'Task 1.2', 2, '2022-12-06', 13, 'Meeting Review -> 1. TAMBAHAN TAMPILAN NO KTP DAN NPWP DI CR1. 2. TAMBAH NO SPK. 3. RESCHEDULE BOOKING. 4. DI HISTORY CRC TAMBAHKAN NO SPK DAN TGL LAHIR. 5. PISAH CATATAN ANTARA MRA DAN CRC. 6. PERBAIKAN HISTORY CRC -> MRA UPDATE TER INSERT DI HISTORY CRC. 7. KOLOM TABEL DI RAPIHKAN PANJANGNYA. 8. REPORT FORMAT TAM /u. MRA. 9. REPORT FORMAT I CARE /u. CRC. 10. PERBAIKAN FAKTUR KE TAM JANGAN MASUK', 100, 0, 0, 2, 1, '2022-12-06 04:56:49', 13);
INSERT INTO `task_detail` VALUES (12, 3, 'Task 1.1', 1, '2022-12-05', 12, 'Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul - > di lanjut bang zawi', 95, 0, 0, 2, 4, '2022-12-06 09:46:50', 12);
INSERT INTO `task_detail` VALUES (13, 18, 'Task 1', 1, '2022-12-13', 14, 'Pembuatan Laporan Pemakaian', 100, 0, 0, 1, 0, '2022-12-13 03:14:25', 14);
INSERT INTO `task_detail` VALUES (14, 13, 'Task 1', 1, '2022-12-21', 15, 'Review GL ', 67, 0, 0, 1, 0, '2022-12-14 11:35:34', 1);
INSERT INTO `task_detail` VALUES (15, 13, 'Task 1.1', 1, '2022-12-05', 1, 'Meeting Review -> Pindah hari jadi senin -> Review Kembali Tgl 8 untuk closing Oktober', 100, 0, 0, 2, 14, '2022-12-05 05:07:08', 1);
INSERT INTO `task_detail` VALUES (16, 13, 'Task 1.2', 2, '2022-12-21', 0, 'Review Untuk Closing Oktober', 0, 0, 0, 2, 14, '2022-12-14 11:35:34', 1);
INSERT INTO `task_detail` VALUES (17, 3, 'Task 1.2', 2, '2022-12-05', 12, 'Sedang koordinasi dengan pak abdul', 100, 0, 0, 2, 4, '2022-12-05 09:36:50', 12);
INSERT INTO `task_detail` VALUES (18, 7, 'Task 1', 1, '2022-12-12', 12, 'Update Tambahan Laporan Insentif', 80, 0, 0, 1, 0, '2022-12-08 09:05:25', 1);
INSERT INTO `task_detail` VALUES (19, 8, 'Task 1', 1, '2022-12-19', 12, 'Jadwalkan Meeting dengan Cikampek dan Karawang', 0, 0, 0, 1, 0, '2022-12-14 11:44:02', 1);
INSERT INTO `task_detail` VALUES (20, 9, 'Task 1', 1, '2022-12-15', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', 80, 0, 0, 1, 0, '2022-12-12 07:49:39', 13);
INSERT INTO `task_detail` VALUES (21, 9, 'Task 2', 2, '2022-12-08', 13, 'Followup Device Otomanager -> follow up ke Ko Hengki. device belum lengkap. ko hengki akan diskusi dengan manager karang tengah', 100, 0, 0, 1, 0, '2022-12-08 04:07:05', 13);
INSERT INTO `task_detail` VALUES (22, 10, 'Task 1', 1, '2022-12-13', 15, 'Cek insentif dengan Rio', 50, 0, 0, 1, 0, '2022-12-14 11:49:40', 1);
INSERT INTO `task_detail` VALUES (23, 10, 'Task 1.1', 1, '2022-12-13', 15, 'Sudah oke untul detail', 100, 0, 0, 2, 22, '2022-12-14 11:49:40', 1);
INSERT INTO `task_detail` VALUES (24, 11, 'Task 1', 1, '2022-12-13', 12, 'Inputan faktur polisi gabungan dan form', 50, 0, 0, 1, 0, '2022-12-12 13:04:30', 1);
INSERT INTO `task_detail` VALUES (25, 11, 'Task 2', 2, '2022-12-16', 13, 'Menu Surat Tagihan Leasing Gabungan dan Form Tiap Leasing', 0, 0, 0, 1, 0, '2022-12-08 09:08:14', 1);
INSERT INTO `task_detail` VALUES (26, 12, 'Task 1', 1, '2022-12-16', 15, 'Coding untuk Standard menjadi Versi Cabang (Hanya di awalan transaksi)', 0, 0, 0, 1, 0, '2022-12-14 11:40:14', 1);
INSERT INTO `task_detail` VALUES (27, 12, 'Task 2', 2, '2022-12-18', 15, 'After Sales Migrasi ke Desktop', 0, 0, 0, 1, 0, '2022-12-14 11:40:55', 1);
INSERT INTO `task_detail` VALUES (28, 12, 'Task 3', 3, '2022-12-16', 15, 'SPK upload seperti H-Diary', 0, 0, 0, 1, 0, '2022-12-14 11:41:10', 1);
INSERT INTO `task_detail` VALUES (29, 16, 'Task 1', 1, '2022-12-05', 15, 'Email Timeline dan Status Update ke Pak Andri', 100, 0, 0, 1, 0, '2022-12-05 07:43:20', 15);
INSERT INTO `task_detail` VALUES (30, 16, 'Task 2', 2, '2022-12-05', 12, 'Status Update Dealer', 100, 0, 0, 1, 0, '2022-12-12 08:00:40', 14);
INSERT INTO `task_detail` VALUES (31, 16, 'Task 3', 3, '2022-12-09', 14, 'Status Update Dealer', 100, 0, 0, 1, 0, '2022-12-15 01:58:23', 14);
INSERT INTO `task_detail` VALUES (32, 16, 'Task 4', 4, '2022-12-08', 13, 'Status Update Dealer', 100, 0, 0, 1, 0, '2022-12-14 03:52:34', 13);
INSERT INTO `task_detail` VALUES (33, 17, 'Task 1', 1, '2022-12-08', 15, 'Tunggu Data Dari Pak Roni', 0, 0, 0, 1, 0, '2022-12-05 06:47:55', 1);
INSERT INTO `task_detail` VALUES (34, 22, 'Task 1', 1, '2022-12-06', 15, 'Jurnal Pembelian = Persediaan pada Hutang\nJurnal Accessories Purna Jual = Hpp pada Persediaan', 100, 0, 0, 1, 0, '2022-12-06 14:05:29', 1);
INSERT INTO `task_detail` VALUES (35, 21, 'Task 1', 1, '2022-12-13', 12, 'Closing Harian Sync Dashboard + check status sync terakhir kirim ke WA ', 0, 0, 0, 1, 0, '2022-12-08 10:29:20', 1);
INSERT INTO `task_detail` VALUES (36, 6, 'Task 3', 3, '2022-12-12', 15, 'Sudah Update', 100, 0, 0, 1, 0, '2022-12-12 09:33:55', 1);
INSERT INTO `task_detail` VALUES (37, 20, 'Task 1', 1, '2022-12-09', 13, 'Order, Penerimaan, dan Pembebanan Accessories', 100, 0, 0, 1, 0, '2022-12-12 07:49:22', 13);
INSERT INTO `task_detail` VALUES (38, 13, 'Task 1.3', 3, '2022-12-07', 15, 'Sudah Update Saldo Awal Part dan Bahan untuk Persediaan Awal GL', 100, 0, 0, 2, 14, '2022-12-07 06:58:45', 15);
INSERT INTO `task_detail` VALUES (39, 19, 'Task 1', 1, '2022-12-09', 13, 'Sesuaikan dengan sound lain', 100, 0, 0, 1, 0, '2022-12-14 06:49:28', 13);
INSERT INTO `task_detail` VALUES (40, 3, 'Task 1.3', 3, '2022-12-05', 12, 'Info dari Pak Abdul Bu henny nya sedang cuti', 100, 0, 0, 2, 4, '2022-12-05 09:36:33', 12);
INSERT INTO `task_detail` VALUES (41, 4, 'Task 1.1', 1, '2022-12-15', 1, 'Sedang koordinasi dengan Pak Alfons', 95, 0, 0, 2, 5, '2022-12-08 09:03:19', 1);
INSERT INTO `task_detail` VALUES (42, 18, 'Task 1.1', 1, '2022-12-05', 14, 'Sudah dikirim ke server fatmawati', 100, 0, 0, 2, 13, '2022-12-05 09:52:40', 14);
INSERT INTO `task_detail` VALUES (43, 18, 'Task 1.2', 2, '2022-12-13', 14, 'Pak Fauzan sudah bisa buka laporan point. Dan sudah konfirmasi untuk Done requestnya. ', 100, 0, 0, 2, 13, '2022-12-13 03:14:25', 14);
INSERT INTO `task_detail` VALUES (44, 4, 'Task 1.2', 2, '2022-12-05', 12, 'info dari pak alfons Masih pembahasan di manangement ', 100, 0, 0, 2, 5, '2022-12-05 09:58:38', 12);
INSERT INTO `task_detail` VALUES (45, 16, 'Task 2.1', 1, '2022-12-05', 12, 'HONDA PERMATA SERPONG', 100, 0, 0, 2, 30, '2022-12-05 10:14:57', 12);
INSERT INTO `task_detail` VALUES (46, 16, 'Task 4.1', 1, '2022-12-05', 13, 'Dealer IKM HA', 100, 0, 0, 2, 32, '2022-12-05 10:16:03', 13);
INSERT INTO `task_detail` VALUES (47, 16, 'Task 3.1', 1, '2022-12-05', 14, 'Honda Mam Setiabudi', 100, 0, 0, 2, 31, '2022-12-14 11:40:00', 14);
INSERT INTO `task_detail` VALUES (48, 16, 'Task 2.2', 2, '2022-12-05', 14, 'HONDA ARTA CIKUPA', 100, 0, 0, 2, 30, '2022-12-12 08:00:40', 14);
INSERT INTO `task_detail` VALUES (49, 16, 'Task 3.2', 2, '2022-12-06', 14, 'Honda Amartha Samarinda', 100, 0, 0, 2, 31, '2022-12-06 01:59:24', 14);
INSERT INTO `task_detail` VALUES (50, 16, 'Task 3.3', 3, '2022-12-06', 14, 'Honda Nusantara Samarinda', 100, 0, 0, 2, 31, '2022-12-06 01:59:46', 14);
INSERT INTO `task_detail` VALUES (51, 3, 'Task 2', 2, '2022-12-15', 12, 'Hit API WA Bussiness', 67, 0, 0, 1, 0, '2022-12-12 13:01:36', 1);
INSERT INTO `task_detail` VALUES (52, 16, 'Task 3.4', 4, '2022-12-06', 14, 'Honda Nusantara Balikpapan', 100, 0, 0, 2, 31, '2022-12-06 03:41:39', 14);
INSERT INTO `task_detail` VALUES (53, 16, 'Task 3.5', 5, '2022-12-06', 14, 'Pekalongan Motor', 100, 0, 0, 2, 31, '2022-12-06 04:49:34', 14);
INSERT INTO `task_detail` VALUES (54, 1, 'Task 2', 2, '2022-12-23', 13, 'Maintenance Hansa Renkei Live 23 November 2022', 0, 0, 0, 1, 0, '2022-12-08 09:11:13', 1);
INSERT INTO `task_detail` VALUES (55, 16, 'Task 4.2', 2, '2022-12-06', 13, 'HONDA AUTOLAND CIPUTAT', 100, 0, 0, 2, 32, '2022-12-06 06:44:08', 13);
INSERT INTO `task_detail` VALUES (56, 16, 'Task 4.3', 3, '2022-12-06', 13, 'HONDA SLS 2', 100, 0, 0, 2, 32, '2022-12-06 07:17:48', 13);
INSERT INTO `task_detail` VALUES (57, 16, 'Task 4.4', 4, '2022-12-06', 13, 'HONDA SLS PALOPO', 100, 0, 0, 2, 32, '2022-12-06 07:18:56', 13);
INSERT INTO `task_detail` VALUES (58, 16, 'Task 4.5', 5, '2022-12-06', 13, 'MAM JEPARA', 100, 0, 0, 2, 32, '2022-12-06 07:34:54', 13);
INSERT INTO `task_detail` VALUES (59, 16, 'Task 4.6', 6, '2022-12-08', 13, 'ANUGERAH SEJAHTERA MGL', 100, 0, 0, 2, 32, '2022-12-08 03:56:28', 13);
INSERT INTO `task_detail` VALUES (60, 16, 'Task 4.7', 7, '2022-12-08', 13, 'TUNAS JAYA', 100, 0, 0, 2, 32, '2022-12-08 03:45:46', 13);
INSERT INTO `task_detail` VALUES (61, 16, 'Task 4.8', 8, '2022-12-08', 13, 'Honda Pati Jaya', 100, 0, 0, 2, 32, '2022-12-06 07:49:09', 13);
INSERT INTO `task_detail` VALUES (62, 16, 'Task 4.9', 9, '2022-12-08', 13, 'Honda Salatiga Jaya', 100, 0, 0, 2, 32, '2022-12-06 08:07:28', 13);
INSERT INTO `task_detail` VALUES (63, 16, 'Task 4.10', 10, '2022-12-08', 13, 'Honda Kumala Cikampek', 100, 0, 0, 2, 32, '2022-12-06 08:17:31', 13);
INSERT INTO `task_detail` VALUES (64, 16, 'Task 3.6', 6, '2022-12-06', 14, 'Honda Eiyu', 100, 0, 0, 2, 31, '2022-12-14 11:40:30', 14);
INSERT INTO `task_detail` VALUES (65, 3, 'Task 2.1', 1, '2022-12-06', 12, 'Hit API', 100, 0, 0, 2, 51, '2022-12-06 09:45:25', 12);
INSERT INTO `task_detail` VALUES (66, 3, 'Task 2.2', 2, '2022-12-06', 12, 'Tambah Function di controller', 100, 0, 0, 2, 51, '2022-12-06 09:45:52', 12);
INSERT INTO `task_detail` VALUES (67, 3, 'Task 2.3', 3, '2022-12-15', 0, 'Testting', 0, 0, 0, 2, 51, '2022-12-12 13:01:36', 1);
INSERT INTO `task_detail` VALUES (68, 7, 'Task 2', 2, '2022-12-20', 12, 'Fitur Alokas Kendaraan', 0, 0, 0, 1, 0, '2022-12-14 11:43:36', 1);
INSERT INTO `task_detail` VALUES (69, 7, 'Task 1.1', 1, '2022-12-06', 12, 'Tambah Menu Alokasi Kendaraan', 100, 0, 0, 2, 18, '2022-12-06 09:49:01', 12);
INSERT INTO `task_detail` VALUES (70, 7, 'Task 1.2', 2, '2022-12-06', 12, 'Tambah Laporan SPK VS Unit & Alokasi', 100, 0, 0, 2, 18, '2022-12-06 10:40:38', 12);
INSERT INTO `task_detail` VALUES (71, 7, 'Task 1.3', 3, '2022-12-06', 12, 'Koneksikan ke matching otomatis pilih norangka sesuai dengan alokasi', 100, 0, 0, 2, 18, '2022-12-06 11:01:14', 12);
INSERT INTO `task_detail` VALUES (72, 7, 'Task 1.4', 4, '2022-12-06', 12, 'Pilih Alokasi di Pembelian', 100, 0, 0, 2, 18, '2022-12-06 10:40:47', 12);
INSERT INTO `task_detail` VALUES (73, 7, 'Task 1.5', 5, '2022-12-12', 12, 'REVIEW PROGRAM DAN LAPORAN', 0, 0, 0, 2, 18, '2022-12-08 09:05:25', 1);
INSERT INTO `task_detail` VALUES (74, 23, 'Task 1', 1, '2022-12-07', 15, 'Sudah Kirim ke Pak Dedy', 100, 0, 0, 1, 0, '2022-12-07 07:54:47', 15);
INSERT INTO `task_detail` VALUES (75, 16, 'Task 3.7', 7, '2022-12-07', 14, 'Honda Cilacap', 100, 0, 0, 2, 31, '2022-12-07 03:44:53', 14);
INSERT INTO `task_detail` VALUES (76, 16, 'Task 3.8', 8, '2022-12-07', 14, 'Honda Perdana Sukabumi', 100, 0, 0, 2, 31, '2022-12-14 11:40:44', 14);
INSERT INTO `task_detail` VALUES (77, 16, 'Task 3.9', 9, '2022-12-07', 14, 'Pondok Cabe', 100, 0, 0, 2, 31, '2022-12-07 09:17:57', 14);
INSERT INTO `task_detail` VALUES (78, 20, 'Task 1.1', 1, '2022-12-07', 13, 'Order Accessories', 100, 0, 0, 2, 37, '2022-12-07 13:24:29', 13);
INSERT INTO `task_detail` VALUES (79, 20, 'Task 1.2', 2, '2022-12-07', 13, 'Penerimaan Accessories', 100, 0, 0, 2, 37, '2022-12-07 13:24:42', 13);
INSERT INTO `task_detail` VALUES (80, 20, 'Task 1.3', 3, '2022-12-08', 13, 'Pembebanan Accessories', 100, 0, 0, 2, 37, '2022-12-08 06:22:18', 13);
INSERT INTO `task_detail` VALUES (81, 16, 'Task 3.10', 10, '2022-12-08', 14, 'Honda Naga Motor', 100, 0, 0, 2, 31, '2022-12-08 02:07:22', 14);
INSERT INTO `task_detail` VALUES (82, 16, 'Task 3.11', 11, '2022-12-08', 14, 'Honda Mulya Putra', 100, 0, 0, 2, 31, '2022-12-08 03:05:45', 14);
INSERT INTO `task_detail` VALUES (83, 16, 'Task 3.12', 12, '2022-12-08', 14, 'Honda Kusuma', 100, 0, 0, 2, 31, '2022-12-08 03:31:29', 14);
INSERT INTO `task_detail` VALUES (84, 16, 'Task 3.13', 13, '2022-12-08', 14, 'Honda Istana Carindo', 100, 0, 0, 2, 31, '2022-12-14 11:41:11', 14);
INSERT INTO `task_detail` VALUES (85, 20, 'Task 1.4', 4, '2022-12-09', 13, 'Kirim Exe Ke Intercom', 100, 0, 0, 2, 37, '2022-12-12 07:49:22', 13);
INSERT INTO `task_detail` VALUES (86, 22, 'Task 2', 2, '2022-12-12', 15, 'Update Journal Penjualan Accessories Biaya pada Persediaan', 100, 0, 0, 1, 0, '2022-12-14 11:37:34', 1);
INSERT INTO `task_detail` VALUES (87, 2, 'Task 1.2', 2, '2022-12-09', 13, 'Sudah Meeting, MAM akan diskusikan dengan management untuk sewa cloud sendiri', 100, 0, 0, 2, 2, '2022-12-12 07:42:54', 1);
INSERT INTO `task_detail` VALUES (88, 15, 'Task 1', 1, '2022-12-15', 15, 'Source dan db backup di kirim dari ghozi', 0, 0, 0, 1, 0, '2022-12-14 11:41:44', 1);
INSERT INTO `task_detail` VALUES (89, 19, 'Task 2', 2, '2022-12-14', 13, 'Update Sound Baru ke All Toyota', 100, 0, 0, 1, 0, '2022-12-14 12:50:49', 13);
INSERT INTO `task_detail` VALUES (90, 16, 'Task 3.14', 14, '2022-12-09', 14, 'Honda Mulai Cianjur', 100, 0, 0, 2, 31, '2022-12-15 01:58:23', 14);
INSERT INTO `task_detail` VALUES (91, 2, 'Task 1.1', 1, '2022-12-15', 13, 'Tunggu Informasi Sewa Cloud Server', 0, 0, 0, 2, 1, '2022-12-12 07:43:25', 1);
INSERT INTO `task_detail` VALUES (92, 2, 'Task 1.2', 2, '2022-12-26', 13, 'test error', 0, 0, 0, 2, 1, '2022-12-12 08:18:29', 1);
INSERT INTO `task_detail` VALUES (93, 16, 'Task 3.15', 15, '2022-12-12', 14, 'Denpasar Agung', 100, 0, 0, 2, 31, '2022-12-12 09:01:25', 14);
INSERT INTO `task_detail` VALUES (94, 2, 'Task 1.3', 3, '2022-12-15', 13, 'Tunggu dealer diskusi sewa server cloud', 0, 0, 0, 2, 2, '2022-12-12 09:12:31', 1);
INSERT INTO `task_detail` VALUES (95, 6, 'Task 4', 4, '2022-12-12', 15, 'Deploy Kirim Exe ', 100, 0, 0, 1, 0, '2022-12-12 13:02:19', 1);
INSERT INTO `task_detail` VALUES (96, 2, 'Task 1.4', 4, '2022-12-12', 13, 'Testing Fitur', 100, 0, 0, 2, 2, '2022-12-12 13:00:22', 1);
INSERT INTO `task_detail` VALUES (97, 6, 'Task 5', 5, '2022-12-16', 15, 'Trial Codingan Baru', 50, 0, 0, 1, 0, '2022-12-14 11:46:29', 1);
INSERT INTO `task_detail` VALUES (98, 20, 'Task 2', 2, '2022-12-19', 15, 'Setting Interface Journal Menu Accessories Baru', 0, 0, 0, 1, 0, '2022-12-14 11:36:40', 1);
INSERT INTO `task_detail` VALUES (99, 16, 'Task 4.11', 11, '2022-12-14', 13, 'HONDA COKROAMINOTO', 100, 0, 0, 2, 32, '2022-12-14 02:31:15', 13);
INSERT INTO `task_detail` VALUES (100, 16, 'Task 4.12', 12, '2022-12-14', 13, 'Honda Artha Cikupa', 100, 0, 0, 2, 32, '2022-12-14 02:37:35', 13);
INSERT INTO `task_detail` VALUES (101, 16, 'Task 4.13', 13, '2022-12-14', 13, 'Honda Prima HI', 100, 0, 0, 2, 32, '2022-12-14 02:59:24', 13);
INSERT INTO `task_detail` VALUES (102, 16, 'Task 4.14', 14, '2022-12-14', 13, 'Honda Nusantara Bekasi', 100, 0, 0, 2, 32, '2022-12-14 03:16:36', 13);
INSERT INTO `task_detail` VALUES (103, 16, 'Task 4.15', 15, '2022-12-14', 13, 'Honda Nusantara MT Haryono', 100, 0, 0, 2, 32, '2022-12-14 03:16:57', 13);
INSERT INTO `task_detail` VALUES (104, 16, 'Task 4.16', 16, '2022-12-14', 13, 'Honda Niaga Bangka', 100, 0, 0, 2, 32, '2022-12-14 03:42:39', 13);
INSERT INTO `task_detail` VALUES (105, 16, 'Task 4.17', 17, '2022-12-14', 13, 'Honda SLS 1', 100, 0, 0, 2, 32, '2022-12-14 03:52:34', 13);
INSERT INTO `task_detail` VALUES (106, 19, 'Task 2.1', 1, '2022-12-14', 13, 'Intercom', 100, 0, 0, 2, 89, '2022-12-14 07:34:56', 13);
INSERT INTO `task_detail` VALUES (107, 19, 'Task 2.2', 2, '2022-12-14', 13, 'IMM', 100, 0, 0, 2, 89, '2022-12-14 07:35:07', 13);
INSERT INTO `task_detail` VALUES (108, 19, 'Task 2.3', 3, '2022-12-14', 13, 'Tambun', 100, 0, 0, 2, 89, '2022-12-14 07:35:16', 13);
INSERT INTO `task_detail` VALUES (109, 19, 'Task 2.4', 4, '2022-12-14', 13, 'Liek Indrapura', 100, 0, 0, 2, 89, '2022-12-14 12:50:44', 13);
INSERT INTO `task_detail` VALUES (110, 19, 'Task 2.5', 5, '2022-12-14', 13, 'Liek Walikota', 100, 0, 0, 2, 89, '2022-12-14 12:50:49', 13);
INSERT INTO `task_detail` VALUES (111, 19, 'Task 2.6', 6, '2022-12-14', 13, 'Anzon Pontianak', 100, 0, 0, 2, 89, '2022-12-14 07:35:57', 13);
INSERT INTO `task_detail` VALUES (112, 19, 'Task 2.7', 7, '2022-12-14', 13, 'Anzon Sampit', 100, 0, 0, 2, 89, '2022-12-14 07:43:05', 13);
INSERT INTO `task_detail` VALUES (113, 19, 'Task 2.8', 8, '2022-12-14', 13, 'Anzon Sintang', 100, 0, 0, 2, 89, '2022-12-14 07:48:22', 13);
INSERT INTO `task_detail` VALUES (114, 19, 'Task 2.9', 9, '2022-12-14', 13, 'Anzon Singkawang', 100, 0, 0, 2, 89, '2022-12-14 07:46:43', 13);
INSERT INTO `task_detail` VALUES (115, 16, 'Task 3.16', 16, '2022-12-14', 14, 'Untuk dealer yg bagian Fikri sudah selesai semua', 100, 0, 0, 2, 31, '2022-12-14 11:42:49', 14);
INSERT INTO `task_detail` VALUES (116, 10, 'Task 1.2', 2, '2022-12-15', 15, 'Update hitungan sum di footer, rio sudah kirim hitungan final', 0, 0, 0, 2, 22, '2022-12-14 11:49:02', 1);

-- ----------------------------
-- Table structure for task_detail_history
-- ----------------------------
DROP TABLE IF EXISTS `task_detail_history`;
CREATE TABLE `task_detail_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_detail_id` int NOT NULL,
  `task_number` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `pic_id` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `percentage` decimal(4, 1) NOT NULL DEFAULT 0.0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_detail_history
-- ----------------------------
INSERT INTO `task_detail_history` VALUES (1, 2, 'Task 1', '2022-12-09', 13, 'Review dan Adjusment PDF dengan Melly dan Anwar', 0.0, 0, 0, '2022-12-02 10:10:17', 1);
INSERT INTO `task_detail_history` VALUES (2, 8, 'Task 2.1', '2022-12-02', 1, 'Pengisian Dokumen SIT', 0.0, 0, 0, '2022-12-02 10:58:17', 1);
INSERT INTO `task_detail_history` VALUES (3, 10, 'Task 1.1', '2022-12-05', 1, 'Jadwalkan Meeting dengan Ibu Lisa', 0.0, 0, 0, '2022-12-05 04:36:07', 1);
INSERT INTO `task_detail_history` VALUES (4, 4, 'Task 1', '2022-12-05', 12, 'Followup E-meterai menggunakan distributor yang mana', 0.0, 0, 0, '2022-12-02 10:19:11', 1);
INSERT INTO `task_detail_history` VALUES (5, 4, 'Task 1', '2022-12-05', 12, 'Followup E-meterai menggunakan distributor yang mana -> Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul', 50.0, 0, 0, '2022-12-05 04:47:34', 12);
INSERT INTO `task_detail_history` VALUES (6, 12, 'Task 1.1', '2022-12-05', 12, 'Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul', 100.0, 0, 0, '2022-12-05 04:49:46', 12);
INSERT INTO `task_detail_history` VALUES (7, 15, 'Task 1.1', '2022-12-03', 1, 'Meeting Review ', 0.0, 0, 0, '2022-12-05 05:05:46', 1);
INSERT INTO `task_detail_history` VALUES (8, 15, 'Task 1.1', '2022-12-05', 1, 'Meeting Review -> Pindah hari jadi senin', 0.0, 0, 0, '2022-12-05 05:06:09', 1);
INSERT INTO `task_detail_history` VALUES (9, 9, 'Task 2.2', '2022-12-03', 1, 'Pengiriman Dokumen SIT', 0.0, 0, 0, '2022-12-02 10:58:39', 1);
INSERT INTO `task_detail_history` VALUES (10, 26, 'Task 1', '2022-12-12', 12, 'Coding untuk Standard menjadi Versi Cabang (Hanya di awalan transaksi)', 0.0, 0, 0, '2022-12-05 06:44:04', 1);
INSERT INTO `task_detail_history` VALUES (11, 31, 'Task 3', '2022-12-05', 13, 'Status Update Dealer', 0.0, 0, 0, '2022-12-05 06:47:08', 1);
INSERT INTO `task_detail_history` VALUES (12, 34, 'Task 1', '2022-12-05', 15, 'Jurnal Transaksi GL', 0.0, 0, 0, '2022-12-05 06:54:00', 1);
INSERT INTO `task_detail_history` VALUES (13, 34, 'Task 1', '2022-12-05', 15, 'Followup Jurnal Transaksi GL', 0.0, 0, 0, '2022-12-05 06:55:02', 1);
INSERT INTO `task_detail_history` VALUES (14, 35, 'Task 1', '2022-12-08', 12, 'Closing Harian Sync Dashboard', 0.0, 0, 0, '2022-12-05 06:56:55', 1);
INSERT INTO `task_detail_history` VALUES (15, 29, 'Task 1', '2022-12-05', 15, 'Email Timeline dan Status Update ke Pak Andri', 0.0, 0, 0, '2022-12-05 06:46:39', 1);
INSERT INTO `task_detail_history` VALUES (16, 3, 'Task 1.1', '2022-12-09', 1, 'Review dan Adjusment PDF dengan Melly dan Anwar', 0.0, 0, 0, '2022-12-02 10:11:37', 1);
INSERT INTO `task_detail_history` VALUES (17, 17, 'Task 1.2', '2022-12-05', 12, 'Sedang koordinasi dengan pak abdul', 50.0, 0, 0, '2022-12-05 06:16:58', 12);
INSERT INTO `task_detail_history` VALUES (18, 48, 'Task 2.2', '2022-12-05', 12, 'HONDA ARTA CIKUPA', 0.0, 0, 0, '2022-12-05 10:25:55', 12);
INSERT INTO `task_detail_history` VALUES (19, 41, 'Task 1.1', '2022-12-05', 12, 'Sedang koordinasi dengan Pak Alfons', 50.0, 0, 0, '2022-12-05 09:37:59', 12);
INSERT INTO `task_detail_history` VALUES (20, 41, 'Task 1.1', '2022-12-05', 12, 'Sedang koordinasi dengan Pak Alfons', 100.0, 0, 0, '2022-12-06 03:04:47', 12);
INSERT INTO `task_detail_history` VALUES (21, 11, 'Task 1.2', '2022-12-06', 13, 'Meeting Review ', 0.0, 0, 0, '2022-12-05 04:38:15', 13);
INSERT INTO `task_detail_history` VALUES (22, 54, 'Task 2', '2022-12-13', 13, 'Maintenance Hansa Renkei', 0.0, 0, 0, '2022-12-06 05:00:16', 13);
INSERT INTO `task_detail_history` VALUES (23, 23, 'Task 1.1', '2022-12-05', 1, 'Update Pengambilan Nilai Jasa dan Warranty', 0.0, 0, 0, '2022-12-05 06:41:36', 1);
INSERT INTO `task_detail_history` VALUES (24, 39, 'Task 1', '2022-12-08', 13, 'Sesuaikan dengan sound lain', 0.0, 0, 0, '2022-12-05 07:50:52', 1);
INSERT INTO `task_detail_history` VALUES (25, 56, 'Task 4.3', '2022-12-06', 13, 'HONDA SLS 2', 0.0, 0, 0, '2022-12-06 06:49:17', 13);
INSERT INTO `task_detail_history` VALUES (26, 57, 'Task 4.4', '2022-12-06', 13, 'HONDA SLS PALOPO', 0.0, 0, 0, '2022-12-06 06:49:36', 13);
INSERT INTO `task_detail_history` VALUES (27, 58, 'Task 4.5', '2022-12-06', 13, 'MAM JEPARA', 0.0, 0, 0, '2022-12-06 06:50:13', 13);
INSERT INTO `task_detail_history` VALUES (28, 61, 'Task 4.8', '2022-12-08', 13, 'Honda Pati Jaya', 0.0, 0, 0, '2022-12-06 06:51:12', 13);
INSERT INTO `task_detail_history` VALUES (29, 62, 'Task 4.9', '2022-12-08', 13, 'Honda Salatiga Jaya', 0.0, 0, 0, '2022-12-06 06:51:27', 13);
INSERT INTO `task_detail_history` VALUES (30, 63, 'Task 4.10', '2022-12-08', 13, 'Honda Kumala Cikampek', 0.0, 0, 0, '2022-12-06 06:51:47', 13);
INSERT INTO `task_detail_history` VALUES (31, 12, 'Task 1.1', '2022-12-05', 12, 'Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul', 50.0, 0, 0, '2022-12-05 04:49:52', 12);
INSERT INTO `task_detail_history` VALUES (32, 70, 'Task 1.2', '2022-12-06', 12, 'Tambah Laporan SPK VS Unit & Alokasi', 70.0, 0, 0, '2022-12-06 09:49:33', 12);
INSERT INTO `task_detail_history` VALUES (33, 70, 'Task 1.2', '2022-12-06', 12, 'Tambah Laporan SPK VS Unit & Alokasi', 90.0, 0, 0, '2022-12-06 09:50:45', 12);
INSERT INTO `task_detail_history` VALUES (34, 72, 'Task 1.4', '2022-12-06', 12, 'Pilih Alokasi di Pembelian', 70.0, 0, 0, '2022-12-06 09:50:33', 12);
INSERT INTO `task_detail_history` VALUES (35, 71, 'Task 1.3', '2022-12-06', 12, 'Koneksikan ke matching otomatis pilih norangka sesuai dengan alokasi', 0.0, 0, 0, '2022-12-06 09:50:02', 12);
INSERT INTO `task_detail_history` VALUES (36, 34, 'Task 1', '2022-12-05', 15, 'Followup Jurnal Transaksi GL', 50.0, 0, 0, '2022-12-05 06:55:56', 1);
INSERT INTO `task_detail_history` VALUES (37, 23, 'Task 1.1', '2022-12-06', 15, 'Update Pengambilan Nilai Jasa dan Warranty', 80.0, 0, 0, '2022-12-06 05:07:18', 15);
INSERT INTO `task_detail_history` VALUES (38, 38, 'Task 1.3', '2022-12-05', 15, 'Update Saldo Awal Part untuk Compare Persediaan', 0.0, 0, 0, '2022-12-05 07:49:11', 15);
INSERT INTO `task_detail_history` VALUES (39, 74, 'Task 1', '2022-12-07', 15, 'Buat dokumentasi Pembayaran DP', 0.0, 0, 0, '2022-12-07 03:07:50', 1);
INSERT INTO `task_detail_history` VALUES (40, 3, 'Task 1.1', '2022-12-09', 13, 'Review dan Adjusment PDF dengan Melly dan Anwar -> sudah difollow up dan belum ada respon', 0.0, 0, 0, '2022-12-05 09:06:34', 13);
INSERT INTO `task_detail_history` VALUES (41, 79, 'Task 1.2', '2022-12-07', 13, 'Order Accessories', 100.0, 0, 0, '2022-12-07 13:24:29', 13);
INSERT INTO `task_detail_history` VALUES (42, 43, 'Task 1.2', '2022-12-06', 14, 'Menunggu konfirmasi dari pak fauzan', 0.0, 0, 0, '2022-12-05 09:53:15', 14);
INSERT INTO `task_detail_history` VALUES (43, 60, 'Task 4.7', '2022-12-08', 13, 'TUNAS JAYA', 0.0, 0, 0, '2022-12-06 06:50:58', 13);
INSERT INTO `task_detail_history` VALUES (44, 59, 'Task 4.6', '2022-12-08', 13, 'ANUGERAH SEJAHTERA MGL', 0.0, 0, 0, '2022-12-06 06:50:36', 13);
INSERT INTO `task_detail_history` VALUES (45, 21, 'Task 2', '2022-12-08', 13, 'Followup Device Otomanager', 0.0, 0, 0, '2022-12-05 06:39:49', 1);
INSERT INTO `task_detail_history` VALUES (46, 20, 'Task 1', '2022-12-08', 13, 'Review Hasil', 0.0, 0, 0, '2022-12-05 06:39:31', 1);
INSERT INTO `task_detail_history` VALUES (47, 21, 'Task 2', '2022-12-08', 13, 'Followup Device Otomanager', 100.0, 0, 0, '2022-12-08 04:00:49', 13);
INSERT INTO `task_detail_history` VALUES (48, 80, 'Task 1.3', '2022-12-08', 13, 'Pembebanan Accessories', 50.0, 0, 0, '2022-12-07 13:25:16', 13);
INSERT INTO `task_detail_history` VALUES (49, 67, 'Task 2.3', '2022-12-06', 12, 'Testting', 0.0, 0, 51, '2022-12-06 09:46:05', 12);
INSERT INTO `task_detail_history` VALUES (50, 41, 'Task 1.1', '2022-12-05', 12, 'Sedang koordinasi dengan Pak Alfons', 95.0, 0, 5, '2022-12-06 03:04:56', 12);
INSERT INTO `task_detail_history` VALUES (51, 73, 'Task 1.5', '2022-12-07', 12, 'REVIEW PROGRAM DAN LAPORAN', 0.0, 0, 18, '2022-12-06 10:42:03', 12);
INSERT INTO `task_detail_history` VALUES (52, 68, 'Task 2', '2022-12-06', 12, 'Fitur Alokas Kendaraan', 0.0, 0, 0, '2022-12-06 09:48:33', 12);
INSERT INTO `task_detail_history` VALUES (53, 20, 'Task 1', '2022-12-08', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', 0.0, 0, 0, '2022-12-08 04:06:00', 13);
INSERT INTO `task_detail_history` VALUES (54, 25, 'Task 2', '2022-12-12', 13, 'Menu Surat Tagihan Leasing Gabungan dan Form Tiap Leasing', 0.0, 0, 0, '2022-12-05 06:43:32', 1);
INSERT INTO `task_detail_history` VALUES (55, 24, 'Task 1', '2022-12-05', 12, 'Inputan faktur polisi gabungan dan form', 0.0, 0, 0, '2022-12-05 06:42:44', 1);
INSERT INTO `task_detail_history` VALUES (56, 16, 'Task 1.2', '2022-12-08', 1, 'Review Untuk Closing Oktober', 0.0, 0, 14, '2022-12-05 05:07:28', 1);
INSERT INTO `task_detail_history` VALUES (57, 54, 'Task 2', '2022-12-13', 13, 'Maintenance Hansa Renkei Live 23 November 2022', 0.0, 0, 0, '2022-12-06 05:02:59', 13);
INSERT INTO `task_detail_history` VALUES (58, 35, 'Task 1', '2022-12-08', 12, 'Closing Harian Sync Dashboard + check status sync terakhir kirim ke WA ', 0.0, 0, 0, '2022-12-05 06:57:26', 1);
INSERT INTO `task_detail_history` VALUES (59, 87, 'Task 1.2', '2022-12-09', 1, 'Meeting Server PDF dan Link untuk Customer', 0.0, 0, 2, '2022-12-08 09:00:23', 1);
INSERT INTO `task_detail_history` VALUES (60, 20, 'Task 1', '2022-12-12', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', 0.0, 0, 0, '2022-12-08 09:07:43', 1);
INSERT INTO `task_detail_history` VALUES (61, 85, 'Task 1.4', '2022-12-09', 13, 'Kirim Exe Ke Intercom', 0.0, 0, 37, '2022-12-08 06:22:05', 13);
INSERT INTO `task_detail_history` VALUES (62, 20, 'Task 1', '2022-12-12', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', 80.0, 0, 0, '2022-12-12 07:49:00', 13);
INSERT INTO `task_detail_history` VALUES (63, 48, 'Task 2.2', '2022-12-05', 12, 'HONDA ARTA CIKUPA', 10.0, 0, 30, '2022-12-05 10:26:40', 12);
INSERT INTO `task_detail_history` VALUES (64, 36, 'Task 3', '2022-12-09', 15, 'Tambahin field , nomor keluar part buat partshop', 0.0, 0, 0, '2022-12-05 07:17:41', 1);
INSERT INTO `task_detail_history` VALUES (65, 96, 'Task 1.4', '2022-12-12', 13, 'Testing Fitur', 0.0, 0, 2, '2022-12-12 09:36:16', 1);
INSERT INTO `task_detail_history` VALUES (66, 6, 'Task 1', '2022-12-09', 15, 'Coding Titik Pengiriman Email ke Customer', 0.0, 0, 0, '2022-12-02 10:57:15', 1);
INSERT INTO `task_detail_history` VALUES (67, 67, 'Task 2.3', '2022-12-12', 1, 'Testting', 0.0, 0, 51, '2022-12-08 09:02:44', 1);
INSERT INTO `task_detail_history` VALUES (68, 95, 'Task 4', '2022-12-12', 15, 'Deploy Kirim Exe ', 0.0, 0, 0, '2022-12-12 09:35:19', 1);
INSERT INTO `task_detail_history` VALUES (69, 24, 'Task 1', '2022-12-13', 12, 'Inputan faktur polisi gabungan dan form', 0.0, 0, 0, '2022-12-08 09:08:33', 1);
INSERT INTO `task_detail_history` VALUES (70, 26, 'Task 1', '2022-12-12', 15, 'Coding untuk Standard menjadi Versi Cabang (Hanya di awalan transaksi)', 0.0, 0, 0, '2022-12-05 06:44:17', 1);
INSERT INTO `task_detail_history` VALUES (71, 28, 'Task 3', '2022-12-12', 15, 'SPK upload seperti H-Diary', 0.0, 0, 0, '2022-12-05 06:44:47', 1);
INSERT INTO `task_detail_history` VALUES (72, 27, 'Task 2', '2022-12-12', 15, 'After Sales Migrasi ke Desktop', 0.0, 0, 0, '2022-12-05 06:44:31', 1);
INSERT INTO `task_detail_history` VALUES (73, 43, 'Task 1.2', '2022-12-07', 14, 'Info dari pak fauzan : Untuk data point belum dicoba karena beliau sedang sakit. Dan kemarin di follow up belum bisa dibuka. Dan ketika mau remote beliau sedang sibuk mengerjakan laporan', 0.0, 0, 13, '2022-12-08 02:27:37', 14);
INSERT INTO `task_detail_history` VALUES (74, 43, 'Task 1.2', '2022-12-07', 14, 'Pak Fauzan sudah bisa buka laporan point. Dan sudah konfirmasi untuk Done requestnya. ', 100.0, 0, 13, '2022-12-13 03:14:18', 14);
INSERT INTO `task_detail_history` VALUES (75, 39, 'Task 1', '2022-12-09', 13, 'Sesuaikan dengan sound lain', 0.0, 0, 0, '2022-12-06 06:54:06', 1);
INSERT INTO `task_detail_history` VALUES (76, 114, 'Task 2.9', '2022-12-14', 13, 'Anzon Singkawang', 0.0, 0, 89, '2022-12-14 07:43:26', 13);
INSERT INTO `task_detail_history` VALUES (77, 113, 'Task 2.8', '2022-12-14', 13, 'Anzon Sintang', 0.0, 0, 89, '2022-12-14 07:43:16', 13);
INSERT INTO `task_detail_history` VALUES (78, 16, 'Task 1.2', '2022-12-14', 0, 'Review Untuk Closing Oktober', 0.0, 0, 14, '2022-12-08 09:09:18', 1);
INSERT INTO `task_detail_history` VALUES (79, 98, 'Task 2', '2022-12-15', 15, 'Setting Interface Journal Menu Accessories Baru', 0.0, 0, 0, '2022-12-12 13:07:19', 1);
INSERT INTO `task_detail_history` VALUES (80, 86, 'Task 2', '2022-12-08', 15, 'Update Journal Penjualan Accessories Biaya pada Persediaan', 0.0, 0, 0, '2022-12-08 08:20:36', 15);
INSERT INTO `task_detail_history` VALUES (81, 86, 'Task 2', '2022-12-12', 15, 'Update Journal Penjualan Accessories Biaya pada Persediaan', 0.0, 0, 0, '2022-12-14 11:37:22', 1);
INSERT INTO `task_detail_history` VALUES (82, 47, 'Task 3.1', '2022-12-05', 14, 'Honda Mam Setiabudi (Kurang Ubah Tampilan Estimasi WO)', 80.0, 0, 31, '2022-12-05 10:17:44', 14);
INSERT INTO `task_detail_history` VALUES (83, 26, 'Task 1', '2022-12-15', 15, 'Coding untuk Standard menjadi Versi Cabang (Hanya di awalan transaksi)', 0.0, 0, 0, '2022-12-12 13:11:32', 1);
INSERT INTO `task_detail_history` VALUES (84, 64, 'Task 3.6', '2022-12-06', 14, 'Eiyu kurang yg estimasi wo dan rpt estimasi', 80.0, 0, 31, '2022-12-06 09:44:57', 14);
INSERT INTO `task_detail_history` VALUES (85, 76, 'Task 3.8', '2022-12-07', 14, 'Honda Perdana Sukabumi Kurang Estimasi WO', 80.0, 0, 31, '2022-12-07 08:17:52', 14);
INSERT INTO `task_detail_history` VALUES (86, 27, 'Task 2', '2022-12-14', 15, 'After Sales Migrasi ke Desktop', 0.0, 0, 0, '2022-12-12 13:12:18', 1);
INSERT INTO `task_detail_history` VALUES (87, 28, 'Task 3', '2022-12-14', 15, 'SPK upload seperti H-Diary', 0.0, 0, 0, '2022-12-12 13:12:08', 1);
INSERT INTO `task_detail_history` VALUES (88, 84, 'Task 3.13', '2022-12-08', 14, 'Honda Istana Carindo Kurang yg Estimasi WO', 80.0, 0, 31, '2022-12-08 05:00:16', 14);
INSERT INTO `task_detail_history` VALUES (89, 88, 'Task 1', '2022-12-13', 15, 'Pindahkan Source ke Hosting Four Best', 0.0, 0, 0, '2022-12-08 09:10:17', 1);
INSERT INTO `task_detail_history` VALUES (90, 68, 'Task 2', '2022-12-13', 12, 'Fitur Alokas Kendaraan', 0.0, 0, 0, '2022-12-08 09:06:34', 1);
INSERT INTO `task_detail_history` VALUES (91, 19, 'Task 1', '2022-12-13', 12, 'Jadwalkan Meeting dengan Cikampek dan Karawang', 0.0, 0, 0, '2022-12-05 06:38:35', 1);
INSERT INTO `task_detail_history` VALUES (92, 97, 'Task 5', '2022-12-16', 15, 'Trial Codingan Baru', 0.0, 0, 0, '2022-12-12 13:03:06', 1);
INSERT INTO `task_detail_history` VALUES (93, 23, 'Task 1.1', '2022-12-06', 15, 'Sudah diupdate - Rio sedang cek dengan user', 80.0, 0, 22, '2022-12-06 14:08:11', 15);
INSERT INTO `task_detail_history` VALUES (94, 23, 'Task 1.1', '2022-12-12', 15, 'Sudah diupdate - Rio sedang cek dengan user', 80.0, 0, 22, '2022-12-14 11:47:36', 1);
INSERT INTO `task_detail_history` VALUES (95, 109, 'Task 2.4', '2022-12-14', 13, 'Liek Indrapura', 0.0, 0, 89, '2022-12-14 07:35:34', 13);
INSERT INTO `task_detail_history` VALUES (96, 110, 'Task 2.5', '2022-12-14', 13, 'Liek Walikota', 0.0, 0, 89, '2022-12-14 07:35:44', 13);
INSERT INTO `task_detail_history` VALUES (97, 90, 'Task 3.14', '2022-12-09', 14, 'Honda Mulai Cianjur Selesai Faktur\nWo dan Estimasi WO beda format, masih ditanyakan untuk ubah format', 30.0, 0, 31, '2022-12-09 04:27:36', 14);

-- ----------------------------
-- Table structure for task_history
-- ----------------------------
DROP TABLE IF EXISTS `task_history`;
CREATE TABLE `task_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_task` int NOT NULL,
  `no_task` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `pic_id` int NOT NULL,
  `client_id` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `history_remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_history
-- ----------------------------
INSERT INTO `task_history` VALUES (1, 5, 'JACB Jateng', '2022-12-08', 8, 72, 'Implementasi JACB ke Dealer Jateng', 0, 'Perubahan notes ', '2022-12-02 10:25:42', 1);
INSERT INTO `task_history` VALUES (2, 13, 'Implementasi Honda Bone', '2022-12-03', 8, 81, 'Implementasi Honda Bone', 0, 'Perubahan tanggal ', '2022-12-02 10:43:25', 1);
INSERT INTO `task_history` VALUES (3, 20, 'List Request Intercom', '2022-12-05', 8, 78, 'List Request Intercom', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:48:13', 1);
INSERT INTO `task_history` VALUES (4, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-03', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Auto Generated', '2022-12-02 10:47:16', 1);
INSERT INTO `task_history` VALUES (5, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-05', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Auto Generated', '2022-12-05 09:52:40', 14);
INSERT INTO `task_history` VALUES (6, 1, 'Hansa Renkei', '2022-12-07', 8, 68, 'Create Program Hansa Renkei', 0, 'Perubahan tanggal oleh GAMAL dengan Task Auto Generated', '2022-12-02 10:06:01', 1);
INSERT INTO `task_history` VALUES (7, 19, 'Suara untuk QMS', '2022-12-08', 8, 77, 'Update Suara baru dan demo', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:47:49', 1);
INSERT INTO `task_history` VALUES (8, 22, 'AP Accessories Local Arta Cikupa', '2022-12-05', 8, 79, 'AP Accessories Local Arta Cikupa', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:49:42', 1);
INSERT INTO `task_history` VALUES (9, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-06', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Task 1.2', '2022-12-05 09:53:15', 14);
INSERT INTO `task_history` VALUES (10, 20, 'List Request Intercom', '2022-12-08', 8, 78, 'List Request Intercom', 0, 'Perubahan tanggal oleh GAMAL dengan Task Auto Generated', '2022-12-05 07:41:47', 1);
INSERT INTO `task_history` VALUES (11, 8, 'Standarisasi Master Tipe Kumala', '2022-12-13', 8, 74, 'Standarisasi untuk Master Tipe di Honda Karawang dan Cikampek untuk Kebutuhan Transfer in out via API', 0, 'Perubahan tanggal ', '2022-12-02 10:38:32', 1);
INSERT INTO `task_history` VALUES (12, 22, 'AP Accessories Local Arta Cikupa', '2022-12-06', 8, 79, 'AP Accessories Local Arta Cikupa', 0, 'Perubahan tanggal oleh ZAWI USER dengan Task Auto Generated', '2022-12-06 14:05:29', 1);
INSERT INTO `task_history` VALUES (13, 3, 'Digital Dokumen Bintaro', '2022-12-08', 8, 69, 'PDF Faktur, Kwitansi, TTS', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2.3', '2022-12-02 10:18:06', 1);
INSERT INTO `task_history` VALUES (14, 4, 'Digital Dokumen Cibubur', '2022-12-08', 8, 70, 'PDF Faktur dan Kwitansi', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.1', '2022-12-02 10:24:47', 1);
INSERT INTO `task_history` VALUES (15, 5, 'JACB Jateng', '2022-12-08', 8, 72, 'Implementasi JACB ke Dealer Jateng - Tunggu Request Dealer', 0, 'Perubahan tanggal ', '2022-12-02 10:54:46', 1);
INSERT INTO `task_history` VALUES (16, 7, 'List Request Karawang', '2022-12-09', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.5', '2022-12-02 10:37:04', 1);
INSERT INTO `task_history` VALUES (17, 7, 'List Request Karawang', '2022-12-12', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-08 09:05:25', 1);
INSERT INTO `task_history` VALUES (18, 9, 'List Request IKB BP (Pradana) ', '2022-12-08', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:39:41', 1);
INSERT INTO `task_history` VALUES (19, 11, 'Monthly Meeting MGI', '2022-12-13', 8, 71, 'Monthly Meeting tiap hari selasa jam 10', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-02 10:41:40', 1);
INSERT INTO `task_history` VALUES (20, 13, 'Implementasi Honda Bone', '2022-12-08', 8, 81, 'Implementasi Honda Bone', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.2', '2022-12-05 05:03:38', 1);
INSERT INTO `task_history` VALUES (21, 15, 'Project management review', '2022-12-08', 8, 82, 'Project management review', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:45:34', 1);
INSERT INTO `task_history` VALUES (22, 1, 'Hansa Renkei', '2022-12-13', 8, 68, 'Create Program Hansa Renkei', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-06 05:00:16', 13);
INSERT INTO `task_history` VALUES (23, 14, 'Implementasi Hyundai Batam', '2022-12-08', 8, 82, 'Implementasi Hyundai Batam', 0, 'Perubahan tanggal ', '2022-12-02 10:45:09', 1);
INSERT INTO `task_history` VALUES (24, 21, 'Sync Dashboard MAM', '2022-12-08', 8, 67, 'Program Sync Dashboard MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:48:50', 1);
INSERT INTO `task_history` VALUES (25, 2, 'Digital Dokumen MAM', '2022-12-09', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:09:28', 1);
INSERT INTO `task_history` VALUES (26, 9, 'List Request IKB BP (Pradana) ', '2022-12-12', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 'Perubahan tanggal oleh GAMAL dengan Task Task 1', '2022-12-08 09:07:43', 1);
INSERT INTO `task_history` VALUES (27, 2, 'Digital Dokumen MAM', '2022-12-15', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-12 07:43:25', 1);
INSERT INTO `task_history` VALUES (28, 16, 'Standard Tasklist HPM (Remapping)', '2022-12-09', 8, 76, 'Standard Tasklist HPM (Remapping)', 0, 'Perubahan tanggal oleh LUTFI dengan Task Auto Generated', '2022-12-02 10:45:53', 1);
INSERT INTO `task_history` VALUES (29, 3, 'Digital Dokumen Bintaro', '2022-12-12', 8, 69, 'PDF Faktur, Kwitansi, TTS', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2.3', '2022-12-08 09:02:44', 1);
INSERT INTO `task_history` VALUES (30, 20, 'List Request Intercom', '2022-12-09', 8, 78, 'List Request Intercom', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-08 06:22:05', 13);
INSERT INTO `task_history` VALUES (31, 12, 'Implementasi Chery Arta Cikupa', '2022-12-12', 8, 80, 'Implementasi Dealer Chery Arta Cikupa', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:42:16', 1);
INSERT INTO `task_history` VALUES (32, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-07', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Task 1.2', '2022-12-08 02:27:37', 14);
INSERT INTO `task_history` VALUES (33, 16, 'Standard Tasklist HPM (Remapping)', '2022-12-12', 8, 76, 'Standard Tasklist HPM (Remapping)', 0, 'Perubahan tanggal oleh GAMAL dengan Task Auto Generated', '2022-12-12 09:01:25', 14);
INSERT INTO `task_history` VALUES (34, 19, 'Suara untuk QMS', '2022-12-09', 8, 77, 'Update Suara baru dan demo', 0, 'Perubahan tanggal oleh GAMAL dengan Task Auto Generated', '2022-12-06 06:54:06', 1);
INSERT INTO `task_history` VALUES (35, 3, 'Digital Dokumen Bintaro', '2022-12-15', 8, 69, 'PDF Faktur, Kwitansi, TTS', 0, 'Perubahan tanggal ', '2022-12-12 13:01:36', 1);
INSERT INTO `task_history` VALUES (36, 4, 'Digital Dokumen Cibubur', '2022-12-15', 8, 70, 'PDF Faktur dan Kwitansi', 0, 'Perubahan tanggal ', '2022-12-08 09:03:19', 1);
INSERT INTO `task_history` VALUES (37, 5, 'JACB Jateng', '2022-12-15', 8, 72, 'Implementasi JACB ke Dealer Jateng - Tunggu Request Dealer', 0, 'Perubahan tanggal ', '2022-12-08 09:04:37', 1);
INSERT INTO `task_history` VALUES (38, 9, 'List Request IKB BP (Pradana) ', '2022-12-15', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 'Perubahan tanggal ', '2022-12-12 07:49:39', 13);
INSERT INTO `task_history` VALUES (39, 13, 'Implementasi Honda Bone', '2022-12-14', 8, 81, 'Implementasi Honda Bone', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.2', '2022-12-08 09:09:18', 1);
INSERT INTO `task_history` VALUES (40, 17, 'Penghapusan Piutang Honda Sunter', '2022-12-15', 8, 75, 'Penghapusan Piutang Honda Sunter sampai 31 Des 2021', 0, 'Perubahan tanggal ', '2022-12-02 10:46:31', 1);
INSERT INTO `task_history` VALUES (41, 20, 'List Request Intercom', '2022-12-15', 8, 78, 'List Request Intercom', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-12 13:07:19', 1);
INSERT INTO `task_history` VALUES (42, 21, 'Sync Dashboard MAM', '2022-12-13', 8, 67, 'Program Sync Dashboard MAM', 0, 'Perubahan tanggal ', '2022-12-08 10:29:20', 1);
INSERT INTO `task_history` VALUES (43, 22, 'AP Accessories Local Arta Cikupa', '2022-12-08', 8, 79, 'AP Accessories Local Arta Cikupa', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-08 08:20:36', 15);
INSERT INTO `task_history` VALUES (44, 12, 'Implementasi Chery Arta Cikupa', '2022-12-15', 8, 80, 'Implementasi Dealer Chery Arta Cikupa', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-12 13:11:32', 1);
INSERT INTO `task_history` VALUES (45, 12, 'Implementasi Chery Arta Cikupa', '2022-12-16', 8, 80, 'Implementasi Dealer Chery Arta Cikupa', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-14 11:40:14', 1);
INSERT INTO `task_history` VALUES (46, 15, 'Project management review', '2022-12-13', 8, 82, 'Project management review', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-08 09:10:17', 1);
INSERT INTO `task_history` VALUES (47, 14, 'Implementasi Hyundai Batam', '2022-12-15', 8, 82, 'Implementasi Hyundai Batam', 0, 'Perubahan tanggal ', '2022-12-08 09:11:30', 1);
INSERT INTO `task_history` VALUES (48, 7, 'List Request Karawang', '2022-12-13', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-08 09:06:34', 1);
INSERT INTO `task_history` VALUES (49, 8, 'Standarisasi Master Tipe Kumala', '2022-12-15', 8, 74, 'Standarisasi untuk Master Tipe di Honda Karawang dan Cikampek untuk Kebutuhan Transfer in out via API', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-08 07:45:42', 1);
INSERT INTO `task_history` VALUES (50, 10, 'Insentif Sunter', '2022-12-08', 8, 75, 'Laporan - Laporan insentif Honda Sunter', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.1', '2022-12-02 10:40:35', 1);
INSERT INTO `task_history` VALUES (51, 10, 'Insentif Sunter', '2022-12-12', 8, 75, 'Laporan - Laporan insentif Honda Sunter', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.1', '2022-12-14 11:47:36', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_roles` int NOT NULL,
  `last_login` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '$2y$10$Qdb5zdQcZ7TfiCY7OQdgm.7VwMu7zmBJSAvhZnHdQyh2Ad9y.Mgay', 'ADMIN', 1, '2022-12-15 09:00:59', '2022-11-23 02:53:49', 1, '0000-00-00 00:00:00', 0);
INSERT INTO `users` VALUES (8, 'ZAWI', '$2y$10$Xeb/DjLV.4/txLmzojFkE.W8uLNmA8qJEb5/tL0os5aJHChH2MPm6', 'ZAWI', 2, '2022-12-06 16:53:09', '0000-00-00 00:00:00', 0, '2022-11-24 06:05:17', 1);
INSERT INTO `users` VALUES (9, 'WIDI', '$2y$10$ScgY06qKpHmXk8GH3YPySOEhcYB/rsep96SdTJEIfBb9eCLyKUWCG', 'WIDI', 2, '2022-12-06 16:54:43', '0000-00-00 00:00:00', 0, '2022-11-24 06:05:26', 1);
INSERT INTO `users` VALUES (10, 'ANDRIE', '$2y$10$IEQxZtADXYafHCkRB8IZLOOWjY1pJsrSfBh5RsQ1/bYjqrxYmrEQ2', 'ANDRIE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2022-11-24 06:05:35', 1);
INSERT INTO `users` VALUES (11, 'DEDY', '$2y$10$RKXtnTP8hQXJwCqR3gEaPeqVwQmzXwuKBoRAkGHy2p6jlBHiG25ee', 'DEDY', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2022-11-24 06:05:56', 1);
INSERT INTO `users` VALUES (12, 'FIKRI', '$2y$10$NF8O5b.K93lWCWRGJu9GC.KkZjtO.U/Wpf2zgWmdW1M3cjPo5Hb5i', 'FIKRI', 3, '2022-12-06 16:55:09', '0000-00-00 00:00:00', 0, '2022-11-24 06:07:21', 1);
INSERT INTO `users` VALUES (13, 'GAMAL', '$2y$10$RALA3.tKohzqlmorZP7mDeVXxOuSu.t/tA2/4h8qULxikSfn2Uexu', 'GAMAL', 3, '2022-12-14 19:50:33', '0000-00-00 00:00:00', 0, '2022-11-24 06:07:29', 1);
INSERT INTO `users` VALUES (14, 'LUTFI', '$2y$10$QdFQ353OrS77qMvo0Pcviu42fz0TdOpgBH2Tfmk27bH5Hb4L5OK9m', 'LUTFI', 3, '2022-12-15 08:57:53', '0000-00-00 00:00:00', 0, '2022-11-24 06:07:40', 1);
INSERT INTO `users` VALUES (15, 'ZAWI USER', '$2y$10$ecjb0455gSUU9UbMa4aWH.KnjXUg/GOZpLCRIJXcYER.ZcN/zMAUO', 'ZAWI USER', 3, '2022-12-08 15:18:09', '0000-00-00 00:00:00', 0, '2022-12-02 10:56:46', 1);

SET FOREIGN_KEY_CHECKS = 1;
