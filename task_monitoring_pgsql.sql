-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               PostgreSQL 15.1, compiled by Visual C++ build 1914, 64-bit
-- Server OS:                    
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table public.m_client
CREATE TABLE IF NOT EXISTS "m_client" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''m_client_id_seq''::regclass)',
	"nama_client" VARCHAR(200) NOT NULL,
	"alamat" VARCHAR(200) NOT NULL,
	"modified_at" TIMESTAMP NULL DEFAULT NULL,
	"modified_by" INTEGER NULL DEFAULT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	"created_by" INTEGER NULL DEFAULT NULL,
	"trial160" CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.m_client: 16 rows
/*!40000 ALTER TABLE "m_client" DISABLE KEYS */;
INSERT INTO "m_client" ("id", "nama_client", "alamat", "modified_at", "modified_by", "created_at", "created_by", "trial160") VALUES
	(67, 'Honda MAM', 'All MAM ', NULL, NULL, '2022-11-24 06:04:56', 1, 'T'),
	(68, 'Toyota Anzon', '-', NULL, NULL, '2022-12-02 10:04:00', 1, 'T'),
	(69, 'Honda Bintaro', 'Honda Bintaro', NULL, NULL, '2022-12-02 10:16:12', 1, 'T'),
	(70, 'Honda Cibubur', 'Honda Cibubur', NULL, NULL, '2022-12-02 10:20:01', 1, 'T'),
	(71, 'Hino MGI', 'Hino MGI', NULL, NULL, '2022-12-02 10:20:12', 1, 'T'),
	(72, 'Dealer Jateng', 'Dealer Jateng', NULL, NULL, '2022-12-02 10:20:40', 1, 'T'),
	(73, 'Honda IKB', 'Honda IKB', NULL, NULL, '2022-12-02 10:21:12', 1, 'T'),
	(74, 'Honda Kumala', 'Honda Kumala', NULL, NULL, '2022-12-02 10:21:32', 1, 'T'),
	(75, 'Honda Sunter', 'Honda Sunter', NULL, NULL, '2022-12-02 10:22:33', 1, 'T'),
	(76, 'HPM', 'HPM', NULL, NULL, '2022-12-02 10:22:47', 1, 'T'),
	(77, 'All Client', 'All Client', NULL, NULL, '2022-12-02 10:23:20', 1, 'T'),
	(78, 'Toyota Intercom', 'Toyota Intercom', NULL, NULL, '2022-12-02 10:23:43', 1, 'T'),
	(79, 'Honda Arta Cikupa', 'Honda Arta Cikupa', NULL, NULL, '2022-12-02 10:23:58', 1, 'T'),
	(80, 'Chery Arta Cikupa', 'Chery Arta Cikupa', NULL, NULL, '2022-12-02 10:24:07', 1, 'T'),
	(81, 'Honda Bone', 'Honda Bone', NULL, NULL, '2022-12-02 10:42:41', 1, 'T'),
	(82, 'TBD', 'TBD', NULL, NULL, '2022-12-02 10:44:18', 1, 'T'),
	(83, 'Funedge Kreasi', 'Pondok Indah', '2022-12-15 04:29:59', 1, '2022-12-15 04:29:47', 1, NULL);
/*!40000 ALTER TABLE "m_client" ENABLE KEYS */;

-- Dumping structure for table public.m_numberings
CREATE TABLE IF NOT EXISTS "m_numberings" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''m_numberings_id_seq''::regclass)',
	"id_toko" INTEGER NOT NULL,
	"prefix" VARCHAR(10) NOT NULL,
	"date_info" SMALLINT NOT NULL,
	"padding" SMALLINT NOT NULL,
	"prefix_separator" VARCHAR(1) NOT NULL,
	"date_separator" VARCHAR(1) NOT NULL,
	"trial248" CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.m_numberings: 1 rows
/*!40000 ALTER TABLE "m_numberings" DISABLE KEYS */;
INSERT INTO "m_numberings" ("id", "id_toko", "prefix", "date_info", "padding", "prefix_separator", "date_separator", "trial248") VALUES
	(1, 0, 'PROJECT', 1, 4, '.', '.', 'T');
/*!40000 ALTER TABLE "m_numberings" ENABLE KEYS */;

-- Dumping structure for table public.m_numbering_details
CREATE TABLE IF NOT EXISTS "m_numbering_details" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''m_numbering_details_id_seq''::regclass)',
	"prefix" VARCHAR(20) NOT NULL,
	"last_number" INTEGER NOT NULL,
	"trial242" CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.m_numbering_details: -1 rows
/*!40000 ALTER TABLE "m_numbering_details" DISABLE KEYS */;
/*!40000 ALTER TABLE "m_numbering_details" ENABLE KEYS */;

-- Dumping structure for table public.roles
CREATE TABLE IF NOT EXISTS "roles" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''roles_id_seq''::regclass)',
	"roles" VARCHAR(50) NOT NULL,
	"trial251" CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.roles: 3 rows
/*!40000 ALTER TABLE "roles" DISABLE KEYS */;
INSERT INTO "roles" ("id", "roles", "trial251") VALUES
	(1, 'ADMIN', 'T'),
	(2, 'PROJECT MANAGER', 'T'),
	(3, 'USER', 'T');
/*!40000 ALTER TABLE "roles" ENABLE KEYS */;

-- Dumping structure for table public.task
CREATE TABLE IF NOT EXISTS "task" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''task_id_seq''::regclass)',
	"no_task" VARCHAR(191) NOT NULL,
	"tanggal" DATE NOT NULL,
	"pic_id" INTEGER NOT NULL,
	"client_id" INTEGER NOT NULL,
	"notes" TEXT NULL DEFAULT NULL,
	"status" SMALLINT NOT NULL DEFAULT '0',
	"flag_delete" SMALLINT NOT NULL DEFAULT '0',
	"created_at" TIMESTAMP NOT NULL,
	"created_by" INTEGER NOT NULL,
	"closed_at" TIMESTAMP NULL DEFAULT NULL,
	"closed_by" INTEGER NULL DEFAULT NULL,
	"trial251" CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.task: 24 rows
/*!40000 ALTER TABLE "task" DISABLE KEYS */;
INSERT INTO "task" ("id", "no_task", "tanggal", "pic_id", "client_id", "notes", "status", "flag_delete", "created_at", "created_by", "closed_at", "closed_by", "trial251") VALUES
	(1, 'Hansa Renkei', '2022-12-23', 8, 68, 'Create Program Hansa Renkei', 0, 0, '2022-12-08 09:11:13', 1, NULL, NULL, 'T'),
	(2, 'Digital Dokumen MAM', '2023-01-11', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 0, '2022-12-12 09:57:19', 1, NULL, NULL, 'T'),
	(3, 'Digital Dokumen Bintaro', '2022-12-12', 8, 69, 'PDF Faktur, Kwitansi, TTS', 0, 0, '2022-12-08 09:02:44', 1, NULL, NULL, 'T'),
	(4, 'Digital Dokumen Cibubur', '2022-12-15', 8, 70, 'PDF Faktur dan Kwitansi', 0, 0, '2022-12-08 09:03:19', 1, NULL, NULL, 'T'),
	(5, 'JACB Jateng', '2022-12-15', 8, 72, 'Implementasi JACB ke Dealer Jateng - Tunggu Request Dealer', 0, 0, '2022-12-08 09:04:37', 1, NULL, NULL, 'T'),
	(6, 'e-Meterai IKB', '2022-12-30', 8, 73, 'PDF Faktur dan Stamping e-Meterai', 0, 0, '2022-12-02 10:36:09', 1, NULL, NULL, 'T'),
	(7, 'List Request Karawang', '2022-12-13', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 0, '2022-12-08 09:06:34', 1, NULL, NULL, 'T'),
	(8, 'Standarisasi Master Tipe Kumala', '2022-12-15', 8, 74, 'Standarisasi untuk Master Tipe di Honda Karawang dan Cikampek untuk Kebutuhan Transfer in out via API', 0, 0, '2022-12-08 07:45:42', 1, NULL, NULL, 'T'),
	(9, 'List Request IKB BP (Pradana) ', '2022-12-15', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 0, '2022-12-12 07:49:39', 13, NULL, NULL, 'T'),
	(10, 'Insentif Sunter', '2022-12-08', 8, 75, 'Laporan - Laporan insentif Honda Sunter', 0, 0, '2022-12-02 10:40:35', 1, NULL, NULL, 'T'),
	(11, 'Monthly Meeting MGI', '2022-12-16', 8, 71, 'Monthly Meeting tiap hari selasa jam 10', 0, 0, '2022-12-08 09:08:14', 1, NULL, NULL, 'T'),
	(12, 'Implementasi Chery Arta Cikupa', '2022-12-15', 8, 80, 'Implementasi Dealer Chery Arta Cikupa', 0, 0, '2022-12-12 09:58:26', 1, NULL, NULL, 'T'),
	(13, 'Implementasi Honda Bone', '2022-12-14', 8, 81, 'Implementasi Honda Bone', 0, 0, '2022-12-08 09:09:18', 1, NULL, NULL, 'T'),
	(14, 'Implementasi Hyundai Batam', '2022-12-15', 8, 82, 'Implementasi Hyundai Batam', 0, 0, '2022-12-08 09:11:30', 1, NULL, NULL, 'T'),
	(15, 'Project management review', '2022-12-13', 8, 82, 'Project management review', 0, 0, '2022-12-08 09:10:17', 1, NULL, NULL, 'T'),
	(16, 'Standard Tasklist HPM (Remapping)', '2022-12-09', 8, 76, 'Standard Tasklist HPM (Remapping)', 0, 0, '2022-12-02 10:45:53', 1, NULL, NULL, 'T'),
	(17, 'Penghapusan Piutang Honda Sunter', '2022-12-15', 8, 75, 'Penghapusan Piutang Honda Sunter sampai 31 Des 2021', 0, 0, '2022-12-02 10:46:31', 1, NULL, NULL, 'T'),
	(18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-07', 8, 73, 'Laporan pemakaian point dari Apps', 0, 0, '2022-12-08 02:27:37', 14, NULL, NULL, 'T'),
	(19, 'Suara untuk QMS', '2022-12-09', 8, 77, 'Update Suara baru dan demo', 0, 0, '2022-12-06 06:54:06', 1, NULL, NULL, 'T'),
	(20, 'List Request Intercom', '2022-12-09', 8, 78, 'List Request Intercom', 0, 0, '2022-12-08 06:22:05', 13, NULL, NULL, 'T'),
	(21, 'Sync Dashboard MAM', '2022-12-13', 8, 67, 'Program Sync Dashboard MAM', 0, 0, '2022-12-08 10:29:20', 1, NULL, NULL, 'T'),
	(22, 'AP Accessories Local Arta Cikupa', '2022-12-08', 8, 79, 'AP Accessories Local Arta Cikupa', 0, 0, '2022-12-08 08:20:36', 15, NULL, NULL, 'T'),
	(23, 'Dokumen Manual DP untuk HPM', '2022-12-08', 8, 77, 'Dokumen Manual DP untuk HPM', 1, 0, '2022-12-07 02:46:19', 1, '2022-12-08 08:21:07', 15, 'T'),
	(24, 'Project Testing', '2023-01-31', 9, 72, 'Testing Error', 0, 0, '2022-12-12 10:07:51', 1, NULL, NULL, 'T');
/*!40000 ALTER TABLE "task" ENABLE KEYS */;

-- Dumping structure for table public.task_detail
CREATE TABLE IF NOT EXISTS "task_detail" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''task_detail_id_seq''::regclass)',
	"task_id" INTEGER NOT NULL,
	"task_number" VARCHAR(75) NOT NULL,
	"numbering" INTEGER NOT NULL,
	"tanggal" DATE NOT NULL,
	"pic_id" INTEGER NOT NULL,
	"notes" TEXT NULL DEFAULT NULL,
	"percentage" INTEGER NOT NULL DEFAULT '0',
	"status" SMALLINT NOT NULL DEFAULT '0',
	"flag_delete" SMALLINT NOT NULL DEFAULT '0',
	"level" SMALLINT NOT NULL DEFAULT '1',
	"parent_id" INTEGER NOT NULL DEFAULT '0',
	"created_at" TIMESTAMP NOT NULL,
	"created_by" INTEGER NOT NULL,
	"trial255" CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.task_detail: 105 rows
/*!40000 ALTER TABLE "task_detail" DISABLE KEYS */;
INSERT INTO "task_detail" ("id", "task_id", "task_number", "numbering", "tanggal", "pic_id", "notes", "percentage", "status", "flag_delete", "level", "parent_id", "created_at", "created_by", "trial255") VALUES
	(1, 1, 'Task 1', 1, '2022-12-07', 13, 'Review Hasil Live 23 November', 100, 0, 0, 1, 0, '2022-12-06 04:56:49', 13, 'T'),
	(2, 2, 'Task 1', 1, '2023-01-11', 13, 'Implementasi Honda BSB', 61, 0, 0, 1, 0, '2022-12-12 10:33:46', 1, 'T'),
	(3, 2, 'Task 1.1', 1, '2022-12-09', 13, 'Review dan Adjusment PDF dengan Melly dan Anwar -> sudah difollow up dan belum ada respon -> sudah followup dan ingin langsung kirim wa ke customer', 100, 0, 0, 2, 2, '2022-12-07 13:22:54', 13, 'T'),
	(4, 3, 'Task 1', 1, '2022-12-05', 12, 'Followup E-meterai menggunakan distributor yang mana', 98, 0, 0, 1, 0, '2022-12-06 09:46:50', 12, 'T'),
	(5, 4, 'Task 1', 1, '2022-12-15', 12, 'Followup E-meterai menggunakan distributor pajakku.com', 98, 0, 0, 1, 0, '2022-12-08 09:03:19', 1, 'T'),
	(6, 6, 'Task 1', 1, '2022-12-09', 15, 'Coding Titik Pengiriman Email ke Customer', 0, 0, 0, 1, 0, '2022-12-02 10:57:15', 1, 'T'),
	(7, 6, 'Task 2', 2, '2022-12-05', 15, 'Dokumen SIT', 100, 0, 0, 1, 0, '2022-12-05 06:34:55', 1, 'T'),
	(8, 6, 'Task 2.1', 1, '2022-12-02', 1, 'Pengisian Dokumen SIT', 100, 0, 0, 2, 7, '2022-12-02 10:58:24', 1, 'T'),
	(9, 6, 'Task 2.2', 2, '2022-12-05', 1, 'Pengiriman Dokumen SIT', 100, 0, 0, 2, 7, '2022-12-05 06:34:55', 1, 'T'),
	(10, 1, 'Task 1.1', 1, '2022-12-05', 13, 'Jadwalkan Meeting dengan Ibu Lisa', 100, 0, 0, 2, 1, '2022-12-05 04:38:39', 13, 'T'),
	(11, 1, 'Task 1.2', 2, '2022-12-06', 13, 'Meeting Review -> 1. TAMBAHAN TAMPILAN NO KTP DAN NPWP DI CR1. 2. TAMBAH NO SPK. 3. RESCHEDULE BOOKING. 4. DI HISTORY CRC TAMBAHKAN NO SPK DAN TGL LAHIR. 5. PISAH CATATAN ANTARA MRA DAN CRC. 6. PERBAIKAN HISTORY CRC -> MRA UPDATE TER INSERT DI HISTORY CRC. 7. KOLOM TABEL DI RAPIHKAN PANJANGNYA. 8. REPORT FORMAT TAM /u. MRA. 9. REPORT FORMAT I CARE /u. CRC. 10. PERBAIKAN FAKTUR KE TAM JANGAN MASUK', 100, 0, 0, 2, 1, '2022-12-06 04:56:49', 13, 'T'),
	(12, 3, 'Task 1.1', 1, '2022-12-05', 12, 'Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul - > di lanjut bang zawi', 95, 0, 0, 2, 4, '2022-12-06 09:46:50', 12, 'T'),
	(13, 18, 'Task 1', 1, '2022-12-07', 14, 'Pembuatan Laporan Pemakaian', 50, 0, 0, 1, 0, '2022-12-08 02:27:37', 14, 'T'),
	(14, 13, 'Task 1', 1, '2022-12-14', 15, 'Review GL ', 67, 0, 0, 1, 0, '2022-12-08 09:09:18', 1, 'T'),
	(15, 13, 'Task 1.1', 1, '2022-12-05', 1, 'Meeting Review -> Pindah hari jadi senin -> Review Kembali Tgl 8 untuk closing Oktober', 100, 0, 0, 2, 14, '2022-12-05 05:07:08', 1, 'T'),
	(16, 13, 'Task 1.2', 2, '2022-12-14', 0, 'Review Untuk Closing Oktober', 0, 0, 0, 2, 14, '2022-12-08 09:09:18', 1, 'T'),
	(17, 3, 'Task 1.2', 2, '2022-12-05', 12, 'Sedang koordinasi dengan pak abdul', 100, 0, 0, 2, 4, '2022-12-05 09:36:50', 12, 'T'),
	(18, 7, 'Task 1', 1, '2022-12-12', 12, 'Update Tambahan Laporan Insentif', 80, 0, 0, 1, 0, '2022-12-08 09:05:25', 1, 'T'),
	(19, 8, 'Task 1', 1, '2022-12-13', 12, 'Jadwalkan Meeting dengan Cikampek dan Karawang', 0, 0, 0, 1, 0, '2022-12-05 06:38:35', 1, 'T'),
	(20, 9, 'Task 1', 1, '2022-12-15', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', 80, 0, 0, 1, 0, '2022-12-12 07:49:39', 13, 'T'),
	(21, 9, 'Task 2', 2, '2022-12-08', 13, 'Followup Device Otomanager -> follow up ke Ko Hengki. device belum lengkap. ko hengki akan diskusi dengan manager karang tengah', 100, 0, 0, 1, 0, '2022-12-08 04:07:05', 13, 'T'),
	(22, 10, 'Task 1', 1, '2022-12-06', 15, 'Cek insentif dengan Rio', 80, 0, 0, 1, 0, '2022-12-06 14:08:11', 15, 'T'),
	(23, 10, 'Task 1.1', 1, '2022-12-06', 15, 'Sudah diupdate - Rio sedang cek dengan user', 80, 0, 0, 2, 22, '2022-12-06 14:08:11', 15, 'T'),
	(24, 11, 'Task 1', 1, '2022-12-13', 12, 'Inputan faktur polisi gabungan dan form', 0, 0, 0, 1, 0, '2022-12-08 09:08:33', 1, 'T'),
	(25, 11, 'Task 2', 2, '2022-12-16', 13, 'Menu Surat Tagihan Leasing Gabungan dan Form Tiap Leasing', 0, 0, 0, 1, 0, '2022-12-08 09:08:14', 1, 'T'),
	(26, 12, 'Task 1', 1, '2022-12-12', 15, 'Coding untuk Standard menjadi Versi Cabang (Hanya di awalan transaksi)', 0, 0, 0, 1, 0, '2022-12-05 06:44:17', 1, 'T'),
	(27, 12, 'Task 2', 2, '2022-12-12', 15, 'After Sales Migrasi ke Desktop', 0, 0, 0, 1, 0, '2022-12-05 06:44:31', 1, 'T'),
	(28, 12, 'Task 3', 3, '2022-12-12', 15, 'SPK upload seperti H-Diary', 0, 0, 0, 1, 0, '2022-12-05 06:44:47', 1, 'T'),
	(29, 16, 'Task 1', 1, '2022-12-05', 15, 'Email Timeline dan Status Update ke Pak Andri', 100, 0, 0, 1, 0, '2022-12-05 07:43:20', 15, 'T'),
	(30, 16, 'Task 2', 2, '2022-12-05', 12, 'Status Update Dealer', 100, 0, 0, 1, 0, '2022-12-12 08:00:40', 14, 'T'),
	(31, 16, 'Task 3', 3, '2022-12-05', 14, 'Status Update Dealer', 89, 0, 0, 1, 0, '2022-12-09 04:27:36', 14, 'T'),
	(32, 16, 'Task 4', 4, '2022-12-08', 13, 'Status Update Dealer', 100, 0, 0, 1, 0, '2022-12-08 03:56:28', 13, 'T'),
	(33, 17, 'Task 1', 1, '2022-12-08', 15, 'Tunggu Data Dari Pak Roni', 0, 0, 0, 1, 0, '2022-12-05 06:47:55', 1, 'T'),
	(34, 22, 'Task 1', 1, '2022-12-06', 15, 'Jurnal Pembelian = Persediaan pada Hutang
Jurnal Accessories Purna Jual = Hpp pada Persediaan', 100, 0, 0, 1, 0, '2022-12-06 14:05:29', 1, 'T'),
	(35, 21, 'Task 1', 1, '2022-12-13', 12, 'Closing Harian Sync Dashboard + check status sync terakhir kirim ke WA ', 0, 0, 0, 1, 0, '2022-12-08 10:29:20', 1, 'T'),
	(36, 6, 'Task 3', 3, '2022-12-09', 15, 'Tambahin field , nomor keluar part buat partshop', 0, 0, 0, 1, 0, '2022-12-05 07:17:41', 1, 'T'),
	(37, 20, 'Task 1', 1, '2022-12-09', 13, 'Order, Penerimaan, dan Pembebanan Accessories', 100, 0, 0, 1, 0, '2022-12-12 07:49:22', 13, 'T'),
	(38, 13, 'Task 1.3', 3, '2022-12-07', 15, 'Sudah Update Saldo Awal Part dan Bahan untuk Persediaan Awal GL', 100, 0, 0, 2, 14, '2022-12-07 06:58:45', 15, 'T'),
	(39, 19, 'Task 1', 1, '2022-12-09', 13, 'Sesuaikan dengan sound lain', 0, 0, 0, 1, 0, '2022-12-06 06:54:06', 1, 'T'),
	(40, 3, 'Task 1.3', 3, '2022-12-05', 12, 'Info dari Pak Abdul Bu henny nya sedang cuti', 100, 0, 0, 2, 4, '2022-12-05 09:36:33', 12, 'T'),
	(41, 4, 'Task 1.1', 1, '2022-12-15', 1, 'Sedang koordinasi dengan Pak Alfons', 95, 0, 0, 2, 5, '2022-12-08 09:03:19', 1, 'T'),
	(42, 18, 'Task 1.1', 1, '2022-12-05', 14, 'Sudah dikirim ke server fatmawati', 100, 0, 0, 2, 13, '2022-12-05 09:52:40', 14, 'T'),
	(43, 18, 'Task 1.2', 2, '2022-12-07', 14, 'Info dari pak fauzan : Untuk data point belum dicoba karena beliau sedang sakit. Dan kemarin di follow up belum bisa dibuka. Dan ketika mau remote beliau sedang sibuk mengerjakan laporan', 0, 0, 0, 2, 13, '2022-12-08 02:27:37', 14, 'T'),
	(44, 4, 'Task 1.2', 2, '2022-12-05', 12, 'info dari pak alfons Masih pembahasan di manangement ', 100, 0, 0, 2, 5, '2022-12-05 09:58:38', 12, 'T'),
	(45, 16, 'Task 2.1', 1, '2022-12-05', 12, 'HONDA PERMATA SERPONG', 100, 0, 0, 2, 30, '2022-12-05 10:14:57', 12, 'T'),
	(46, 16, 'Task 4.1', 1, '2022-12-05', 13, 'Dealer IKM HA', 100, 0, 0, 2, 32, '2022-12-05 10:16:03', 13, 'T'),
	(47, 16, 'Task 3.1', 1, '2022-12-05', 14, 'Honda Mam Setiabudi (Kurang Ubah Tampilan Estimasi WO)', 80, 0, 0, 2, 31, '2022-12-05 10:17:44', 14, 'T'),
	(48, 16, 'Task 2.2', 2, '2022-12-05', 14, 'HONDA ARTA CIKUPA', 100, 0, 0, 2, 30, '2022-12-12 08:00:40', 14, 'T'),
	(49, 16, 'Task 3.2', 2, '2022-12-06', 14, 'Honda Amartha Samarinda', 100, 0, 0, 2, 31, '2022-12-06 01:59:24', 14, 'T'),
	(50, 16, 'Task 3.3', 3, '2022-12-06', 14, 'Honda Nusantara Samarinda', 100, 0, 0, 2, 31, '2022-12-06 01:59:46', 14, 'T'),
	(51, 3, 'Task 2', 2, '2022-12-12', 12, 'Hit API WA Bussiness', 67, 0, 0, 1, 0, '2022-12-08 09:02:44', 1, 'T'),
	(52, 16, 'Task 3.4', 4, '2022-12-06', 14, 'Honda Nusantara Balikpapan', 100, 0, 0, 2, 31, '2022-12-06 03:41:39', 14, 'T'),
	(53, 16, 'Task 3.5', 5, '2022-12-06', 14, 'Pekalongan Motor', 100, 0, 0, 2, 31, '2022-12-06 04:49:34', 14, 'T'),
	(54, 1, 'Task 2', 2, '2022-12-23', 13, 'Maintenance Hansa Renkei Live 23 November 2022', 0, 0, 0, 1, 0, '2022-12-08 09:11:13', 1, 'T'),
	(55, 16, 'Task 4.2', 2, '2022-12-06', 13, 'HONDA AUTOLAND CIPUTAT', 100, 0, 0, 2, 32, '2022-12-06 06:44:08', 13, 'T'),
	(56, 16, 'Task 4.3', 3, '2022-12-06', 13, 'HONDA SLS 2', 100, 0, 0, 2, 32, '2022-12-06 07:17:48', 13, 'T'),
	(57, 16, 'Task 4.4', 4, '2022-12-06', 13, 'HONDA SLS PALOPO', 100, 0, 0, 2, 32, '2022-12-06 07:18:56', 13, 'T'),
	(58, 16, 'Task 4.5', 5, '2022-12-06', 13, 'MAM JEPARA', 100, 0, 0, 2, 32, '2022-12-06 07:34:54', 13, 'T'),
	(59, 16, 'Task 4.6', 6, '2022-12-08', 13, 'ANUGERAH SEJAHTERA MGL', 100, 0, 0, 2, 32, '2022-12-08 03:56:28', 13, 'T'),
	(60, 16, 'Task 4.7', 7, '2022-12-08', 13, 'TUNAS JAYA', 100, 0, 0, 2, 32, '2022-12-08 03:45:46', 13, 'T'),
	(61, 16, 'Task 4.8', 8, '2022-12-08', 13, 'Honda Pati Jaya', 100, 0, 0, 2, 32, '2022-12-06 07:49:09', 13, 'T'),
	(62, 16, 'Task 4.9', 9, '2022-12-08', 13, 'Honda Salatiga Jaya', 100, 0, 0, 2, 32, '2022-12-06 08:07:28', 13, 'T'),
	(63, 16, 'Task 4.10', 10, '2022-12-08', 13, 'Honda Kumala Cikampek', 100, 0, 0, 2, 32, '2022-12-06 08:17:31', 13, 'T'),
	(64, 16, 'Task 3.6', 6, '2022-12-06', 14, 'Eiyu kurang yg estimasi wo dan rpt estimasi', 80, 0, 0, 2, 31, '2022-12-06 09:44:57', 14, 'T'),
	(65, 3, 'Task 2.1', 1, '2022-12-06', 12, 'Hit API', 100, 0, 0, 2, 51, '2022-12-06 09:45:25', 12, 'T'),
	(66, 3, 'Task 2.2', 2, '2022-12-06', 12, 'Tambah Function di controller', 100, 0, 0, 2, 51, '2022-12-06 09:45:52', 12, 'T'),
	(67, 3, 'Task 2.3', 3, '2022-12-12', 1, 'Testting', 0, 0, 0, 2, 51, '2022-12-08 09:02:44', 1, 'T'),
	(68, 7, 'Task 2', 2, '2022-12-13', 12, 'Fitur Alokas Kendaraan', 0, 0, 0, 1, 0, '2022-12-08 09:06:34', 1, 'T'),
	(69, 7, 'Task 1.1', 1, '2022-12-06', 12, 'Tambah Menu Alokasi Kendaraan', 100, 0, 0, 2, 18, '2022-12-06 09:49:01', 12, 'T'),
	(70, 7, 'Task 1.2', 2, '2022-12-06', 12, 'Tambah Laporan SPK VS Unit & Alokasi', 100, 0, 0, 2, 18, '2022-12-06 10:40:38', 12, 'T'),
	(71, 7, 'Task 1.3', 3, '2022-12-06', 12, 'Koneksikan ke matching otomatis pilih norangka sesuai dengan alokasi', 100, 0, 0, 2, 18, '2022-12-06 11:01:14', 12, 'T'),
	(72, 7, 'Task 1.4', 4, '2022-12-06', 12, 'Pilih Alokasi di Pembelian', 100, 0, 0, 2, 18, '2022-12-06 10:40:47', 12, 'T'),
	(73, 7, 'Task 1.5', 5, '2022-12-12', 12, 'REVIEW PROGRAM DAN LAPORAN', 0, 0, 0, 2, 18, '2022-12-08 09:05:25', 1, 'T'),
	(74, 23, 'Task 1', 1, '2022-12-07', 15, 'Sudah Kirim ke Pak Dedy', 100, 0, 0, 1, 0, '2022-12-07 07:54:47', 15, 'T'),
	(75, 16, 'Task 3.7', 7, '2022-12-07', 14, 'Honda Cilacap', 100, 0, 0, 2, 31, '2022-12-07 03:44:53', 14, 'T'),
	(76, 16, 'Task 3.8', 8, '2022-12-07', 14, 'Honda Perdana Sukabumi Kurang Estimasi WO', 80, 0, 0, 2, 31, '2022-12-07 08:17:52', 14, 'T'),
	(77, 16, 'Task 3.9', 9, '2022-12-07', 14, 'Pondok Cabe', 100, 0, 0, 2, 31, '2022-12-07 09:17:57', 14, 'T'),
	(78, 20, 'Task 1.1', 1, '2022-12-07', 13, 'Order Accessories', 100, 0, 0, 2, 37, '2022-12-07 13:24:29', 13, 'T'),
	(79, 20, 'Task 1.2', 2, '2022-12-07', 13, 'Penerimaan Accessories', 100, 0, 0, 2, 37, '2022-12-07 13:24:42', 13, 'T'),
	(80, 20, 'Task 1.3', 3, '2022-12-08', 13, 'Pembebanan Accessories', 100, 0, 0, 2, 37, '2022-12-08 06:22:18', 13, 'T'),
	(81, 16, 'Task 3.10', 10, '2022-12-08', 14, 'Honda Naga Motor', 100, 0, 0, 2, 31, '2022-12-08 02:07:22', 14, 'T'),
	(82, 16, 'Task 3.11', 11, '2022-12-08', 14, 'Honda Mulya Putra', 100, 0, 0, 2, 31, '2022-12-08 03:05:45', 14, 'T'),
	(83, 16, 'Task 3.12', 12, '2022-12-08', 14, 'Honda Kusuma', 100, 0, 0, 2, 31, '2022-12-08 03:31:29', 14, 'T'),
	(84, 16, 'Task 3.13', 13, '2022-12-08', 14, 'Honda Istana Carindo Kurang yg Estimasi WO', 80, 0, 0, 2, 31, '2022-12-08 05:00:16', 14, 'T'),
	(85, 20, 'Task 1.4', 4, '2022-12-09', 13, 'Kirim Exe Ke Intercom', 100, 0, 0, 2, 37, '2022-12-12 07:49:22', 13, 'T'),
	(86, 22, 'Task 2', 2, '2022-12-08', 15, 'Update Journal Penjualan Accessories Biaya pada Persediaan', 0, 0, 0, 1, 0, '2022-12-08 08:20:36', 15, 'T'),
	(87, 2, 'Task 1.2', 2, '2022-12-09', 0, 'Sudah Meeting, MAM akan diskusikan dengan management untuk sewa cloud sendiri', 100, 0, 0, 2, 2, '2022-12-12 07:42:54', 1, 'T'),
	(88, 15, 'Task 1', 1, '2022-12-13', 15, 'Pindahkan Source ke Hosting Four Best', 0, 0, 0, 1, 0, '2022-12-08 09:10:17', 1, 'T'),
	(89, 19, 'Task 2', 2, '2022-12-09', 13, 'Update Sound Baru ke All Toyota', 0, 0, 0, 1, 0, '2022-12-08 10:28:34', 1, 'T'),
	(90, 16, 'Task 3.14', 14, '2022-12-09', 14, 'Honda Mulai Cianjur Selesai Faktur
Wo dan Estimasi WO beda format, masih ditanyakan untuk ubah format', 30, 0, 0, 2, 31, '2022-12-09 04:27:36', 14, 'T'),
	(91, 2, 'Task 1.1', 1, '2022-12-15', 0, 'Tunggu Informasi Sewa Cloud Server', 0, 0, 0, 2, 1, '2022-12-12 07:43:25', 1, 'T'),
	(92, 2, 'Task 1.2', 2, '2022-12-26', 0, 'test error', 0, 0, 0, 2, 1, '2022-12-12 08:18:29', 1, 'T'),
	(93, 2, 'Task 2', 2, '2022-12-07', 13, 'Task 2 nih', 0, 0, 0, 1, 0, '2022-12-12 09:57:57', 1, 'T'),
	(94, 2, 'Task 2.1', 1, '2022-12-29', 13, 'Task 2 bawahnya', 0, 0, 0, 2, 93, '2022-12-12 09:53:22', 1, 'T'),
	(95, 2, 'Task 1.3', 3, '2023-01-11', 0, 'Task 1 bawahnya', 45, 0, 0, 2, 2, '2022-12-12 09:57:33', 1, 'T'),
	(96, 2, 'Task 2.2', 2, '2022-12-13', 13, '', 0, 0, 0, 2, 93, '2022-12-12 09:57:57', 1, 'T'),
	(97, 2, 'Task 3', 3, '2022-12-16', 14, '', 0, 0, 0, 1, 0, '2022-12-12 09:58:10', 1, 'T'),
	(98, 12, 'Task 4', 4, '2022-12-15', 15, '', 0, 0, 0, 1, 0, '2022-12-12 09:58:41', 1, 'T'),
	(99, 12, 'Task 4.1', 1, '2022-12-15', 0, 'cherry', 0, 0, 0, 2, 98, '2022-12-12 09:58:41', 1, 'T'),
	(100, 24, 'Task 1', 1, '2022-12-14', 13, 'Apakah Bisa', 24, 0, 0, 1, 0, '2022-12-12 10:09:11', 1, 'T'),
	(101, 24, 'Task 2', 2, '2022-12-07', 13, 'Iya bisa', 12, 0, 0, 1, 0, '2022-12-12 10:09:49', 1, 'T'),
	(102, 24, 'Task 1.1', 1, '2022-12-15', 1, 'Bisa dong', 10, 0, 0, 2, 100, '2022-12-12 10:09:02', 1, 'T'),
	(103, 24, 'Task 1.2', 2, '2022-12-15', 1, 'Lanjut', 38, 0, 0, 2, 100, '2022-12-12 10:09:11', 1, 'T'),
	(104, 24, 'Task 2.1', 1, '2022-12-23', 1, 'Kurang', 12, 0, 0, 2, 101, '2022-12-12 10:09:49', 1, 'T'),
	(105, 2, 'Task 1.4', 4, '2022-12-14', 13, 'PIC siapa', 0, 0, 0, 2, 2, '2022-12-12 10:33:46', 1, 'T'),
	(108, 24, 'Task 3', 3, '2022-12-13', 13, 'Postgres Testing 45%', 45, 0, 0, 1, 0, '2022-12-15 04:43:54', 1, NULL);
/*!40000 ALTER TABLE "task_detail" ENABLE KEYS */;

-- Dumping structure for table public.task_detail_history
CREATE TABLE IF NOT EXISTS "task_detail_history" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''task_detail_history_id_seq''::regclass)',
	"task_detail_id" INTEGER NOT NULL,
	"task_number" VARCHAR(75) NOT NULL,
	"tanggal" DATE NOT NULL,
	"pic_id" INTEGER NOT NULL,
	"notes" TEXT NULL DEFAULT NULL,
	"percentage" NUMERIC(4,1) NOT NULL DEFAULT '0.0',
	"status" SMALLINT NOT NULL DEFAULT '0',
	"parent_id" INTEGER NOT NULL DEFAULT '0',
	"created_at" TIMESTAMP NOT NULL,
	"created_by" INTEGER NOT NULL,
	"trial258" CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.task_detail_history: 66 rows
/*!40000 ALTER TABLE "task_detail_history" DISABLE KEYS */;
INSERT INTO "task_detail_history" ("id", "task_detail_id", "task_number", "tanggal", "pic_id", "notes", "percentage", "status", "parent_id", "created_at", "created_by", "trial258") VALUES
	(1, 2, 'Task 1', '2022-12-09', 13, 'Review dan Adjusment PDF dengan Melly dan Anwar', 0.0, 0, 0, '2022-12-02 10:10:17', 1, 'T'),
	(2, 8, 'Task 2.1', '2022-12-02', 1, 'Pengisian Dokumen SIT', 0.0, 0, 0, '2022-12-02 10:58:17', 1, 'T'),
	(3, 10, 'Task 1.1', '2022-12-05', 1, 'Jadwalkan Meeting dengan Ibu Lisa', 0.0, 0, 0, '2022-12-05 04:36:07', 1, 'T'),
	(4, 4, 'Task 1', '2022-12-05', 12, 'Followup E-meterai menggunakan distributor yang mana', 0.0, 0, 0, '2022-12-02 10:19:11', 1, 'T'),
	(5, 4, 'Task 1', '2022-12-05', 12, 'Followup E-meterai menggunakan distributor yang mana -> Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul', 50.0, 0, 0, '2022-12-05 04:47:34', 12, 'T'),
	(6, 12, 'Task 1.1', '2022-12-05', 12, 'Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul', 100.0, 0, 0, '2022-12-05 04:49:46', 12, 'T'),
	(7, 15, 'Task 1.1', '2022-12-03', 1, 'Meeting Review ', 0.0, 0, 0, '2022-12-05 05:05:46', 1, 'T'),
	(8, 15, 'Task 1.1', '2022-12-05', 1, 'Meeting Review -> Pindah hari jadi senin', 0.0, 0, 0, '2022-12-05 05:06:09', 1, 'T'),
	(9, 9, 'Task 2.2', '2022-12-03', 1, 'Pengiriman Dokumen SIT', 0.0, 0, 0, '2022-12-02 10:58:39', 1, 'T'),
	(10, 26, 'Task 1', '2022-12-12', 12, 'Coding untuk Standard menjadi Versi Cabang (Hanya di awalan transaksi)', 0.0, 0, 0, '2022-12-05 06:44:04', 1, 'T'),
	(11, 31, 'Task 3', '2022-12-05', 13, 'Status Update Dealer', 0.0, 0, 0, '2022-12-05 06:47:08', 1, 'T'),
	(12, 34, 'Task 1', '2022-12-05', 15, 'Jurnal Transaksi GL', 0.0, 0, 0, '2022-12-05 06:54:00', 1, 'T'),
	(13, 34, 'Task 1', '2022-12-05', 15, 'Followup Jurnal Transaksi GL', 0.0, 0, 0, '2022-12-05 06:55:02', 1, 'T'),
	(14, 35, 'Task 1', '2022-12-08', 12, 'Closing Harian Sync Dashboard', 0.0, 0, 0, '2022-12-05 06:56:55', 1, 'T'),
	(15, 29, 'Task 1', '2022-12-05', 15, 'Email Timeline dan Status Update ke Pak Andri', 0.0, 0, 0, '2022-12-05 06:46:39', 1, 'T'),
	(16, 3, 'Task 1.1', '2022-12-09', 1, 'Review dan Adjusment PDF dengan Melly dan Anwar', 0.0, 0, 0, '2022-12-02 10:11:37', 1, 'T'),
	(17, 17, 'Task 1.2', '2022-12-05', 12, 'Sedang koordinasi dengan pak abdul', 50.0, 0, 0, '2022-12-05 06:16:58', 12, 'T'),
	(18, 48, 'Task 2.2', '2022-12-05', 12, 'HONDA ARTA CIKUPA', 0.0, 0, 0, '2022-12-05 10:25:55', 12, 'T'),
	(19, 41, 'Task 1.1', '2022-12-05', 12, 'Sedang koordinasi dengan Pak Alfons', 50.0, 0, 0, '2022-12-05 09:37:59', 12, 'T'),
	(20, 41, 'Task 1.1', '2022-12-05', 12, 'Sedang koordinasi dengan Pak Alfons', 100.0, 0, 0, '2022-12-06 03:04:47', 12, 'T'),
	(21, 11, 'Task 1.2', '2022-12-06', 13, 'Meeting Review ', 0.0, 0, 0, '2022-12-05 04:38:15', 13, 'T'),
	(22, 54, 'Task 2', '2022-12-13', 13, 'Maintenance Hansa Renkei', 0.0, 0, 0, '2022-12-06 05:00:16', 13, 'T'),
	(23, 23, 'Task 1.1', '2022-12-05', 1, 'Update Pengambilan Nilai Jasa dan Warranty', 0.0, 0, 0, '2022-12-05 06:41:36', 1, 'T'),
	(24, 39, 'Task 1', '2022-12-08', 13, 'Sesuaikan dengan sound lain', 0.0, 0, 0, '2022-12-05 07:50:52', 1, 'T'),
	(25, 56, 'Task 4.3', '2022-12-06', 13, 'HONDA SLS 2', 0.0, 0, 0, '2022-12-06 06:49:17', 13, 'T'),
	(26, 57, 'Task 4.4', '2022-12-06', 13, 'HONDA SLS PALOPO', 0.0, 0, 0, '2022-12-06 06:49:36', 13, 'T'),
	(27, 58, 'Task 4.5', '2022-12-06', 13, 'MAM JEPARA', 0.0, 0, 0, '2022-12-06 06:50:13', 13, 'T'),
	(28, 61, 'Task 4.8', '2022-12-08', 13, 'Honda Pati Jaya', 0.0, 0, 0, '2022-12-06 06:51:12', 13, 'T'),
	(29, 62, 'Task 4.9', '2022-12-08', 13, 'Honda Salatiga Jaya', 0.0, 0, 0, '2022-12-06 06:51:27', 13, 'T'),
	(30, 63, 'Task 4.10', '2022-12-08', 13, 'Honda Kumala Cikampek', 0.0, 0, 0, '2022-12-06 06:51:47', 13, 'T'),
	(31, 12, 'Task 1.1', '2022-12-05', 12, 'Info Bu Henny sudah daftar tapi tidak pakai API, di koordinasikan dengan Pak Abdul', 50.0, 0, 0, '2022-12-05 04:49:52', 12, 'T'),
	(32, 70, 'Task 1.2', '2022-12-06', 12, 'Tambah Laporan SPK VS Unit & Alokasi', 70.0, 0, 0, '2022-12-06 09:49:33', 12, 'T'),
	(33, 70, 'Task 1.2', '2022-12-06', 12, 'Tambah Laporan SPK VS Unit & Alokasi', 90.0, 0, 0, '2022-12-06 09:50:45', 12, 'T'),
	(34, 72, 'Task 1.4', '2022-12-06', 12, 'Pilih Alokasi di Pembelian', 70.0, 0, 0, '2022-12-06 09:50:33', 12, 'T'),
	(35, 71, 'Task 1.3', '2022-12-06', 12, 'Koneksikan ke matching otomatis pilih norangka sesuai dengan alokasi', 0.0, 0, 0, '2022-12-06 09:50:02', 12, 'T'),
	(36, 34, 'Task 1', '2022-12-05', 15, 'Followup Jurnal Transaksi GL', 50.0, 0, 0, '2022-12-05 06:55:56', 1, 'T'),
	(37, 23, 'Task 1.1', '2022-12-06', 15, 'Update Pengambilan Nilai Jasa dan Warranty', 80.0, 0, 0, '2022-12-06 05:07:18', 15, 'T'),
	(38, 38, 'Task 1.3', '2022-12-05', 15, 'Update Saldo Awal Part untuk Compare Persediaan', 0.0, 0, 0, '2022-12-05 07:49:11', 15, 'T'),
	(39, 74, 'Task 1', '2022-12-07', 15, 'Buat dokumentasi Pembayaran DP', 0.0, 0, 0, '2022-12-07 03:07:50', 1, 'T'),
	(40, 3, 'Task 1.1', '2022-12-09', 13, 'Review dan Adjusment PDF dengan Melly dan Anwar -> sudah difollow up dan belum ada respon', 0.0, 0, 0, '2022-12-05 09:06:34', 13, 'T'),
	(41, 79, 'Task 1.2', '2022-12-07', 13, 'Order Accessories', 100.0, 0, 0, '2022-12-07 13:24:29', 13, 'T'),
	(42, 43, 'Task 1.2', '2022-12-06', 14, 'Menunggu konfirmasi dari pak fauzan', 0.0, 0, 0, '2022-12-05 09:53:15', 14, 'T'),
	(43, 60, 'Task 4.7', '2022-12-08', 13, 'TUNAS JAYA', 0.0, 0, 0, '2022-12-06 06:50:58', 13, 'T'),
	(44, 59, 'Task 4.6', '2022-12-08', 13, 'ANUGERAH SEJAHTERA MGL', 0.0, 0, 0, '2022-12-06 06:50:36', 13, 'T'),
	(45, 21, 'Task 2', '2022-12-08', 13, 'Followup Device Otomanager', 0.0, 0, 0, '2022-12-05 06:39:49', 1, 'T'),
	(46, 20, 'Task 1', '2022-12-08', 13, 'Review Hasil', 0.0, 0, 0, '2022-12-05 06:39:31', 1, 'T'),
	(47, 21, 'Task 2', '2022-12-08', 13, 'Followup Device Otomanager', 100.0, 0, 0, '2022-12-08 04:00:49', 13, 'T'),
	(48, 80, 'Task 1.3', '2022-12-08', 13, 'Pembebanan Accessories', 50.0, 0, 0, '2022-12-07 13:25:16', 13, 'T'),
	(49, 67, 'Task 2.3', '2022-12-06', 12, 'Testting', 0.0, 0, 51, '2022-12-06 09:46:05', 12, 'T'),
	(50, 41, 'Task 1.1', '2022-12-05', 12, 'Sedang koordinasi dengan Pak Alfons', 95.0, 0, 5, '2022-12-06 03:04:56', 12, 'T'),
	(51, 73, 'Task 1.5', '2022-12-07', 12, 'REVIEW PROGRAM DAN LAPORAN', 0.0, 0, 18, '2022-12-06 10:42:03', 12, 'T'),
	(52, 68, 'Task 2', '2022-12-06', 12, 'Fitur Alokas Kendaraan', 0.0, 0, 0, '2022-12-06 09:48:33', 12, 'T'),
	(53, 20, 'Task 1', '2022-12-08', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', 0.0, 0, 0, '2022-12-08 04:06:00', 13, 'T'),
	(54, 25, 'Task 2', '2022-12-12', 13, 'Menu Surat Tagihan Leasing Gabungan dan Form Tiap Leasing', 0.0, 0, 0, '2022-12-05 06:43:32', 1, 'T'),
	(55, 24, 'Task 1', '2022-12-05', 12, 'Inputan faktur polisi gabungan dan form', 0.0, 0, 0, '2022-12-05 06:42:44', 1, 'T'),
	(56, 16, 'Task 1.2', '2022-12-08', 1, 'Review Untuk Closing Oktober', 0.0, 0, 14, '2022-12-05 05:07:28', 1, 'T'),
	(57, 54, 'Task 2', '2022-12-13', 13, 'Maintenance Hansa Renkei Live 23 November 2022', 0.0, 0, 0, '2022-12-06 05:02:59', 13, 'T'),
	(58, 35, 'Task 1', '2022-12-08', 12, 'Closing Harian Sync Dashboard + check status sync terakhir kirim ke WA ', 0.0, 0, 0, '2022-12-05 06:57:26', 1, 'T'),
	(59, 87, 'Task 1.2', '2022-12-09', 1, 'Meeting Server PDF dan Link untuk Customer', 0.0, 0, 2, '2022-12-08 09:00:23', 1, 'T'),
	(60, 20, 'Task 1', '2022-12-12', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', 0.0, 0, 0, '2022-12-08 09:07:43', 1, 'T'),
	(61, 85, 'Task 1.4', '2022-12-09', 13, 'Kirim Exe Ke Intercom', 0.0, 0, 37, '2022-12-08 06:22:05', 13, 'T'),
	(62, 20, 'Task 1', '2022-12-12', 13, 'Review Hasil -> Sudah Follow Up Ko Hengki. Belum ada Feedback dari user. ', 80.0, 0, 0, '2022-12-12 07:49:00', 13, 'T'),
	(63, 48, 'Task 2.2', '2022-12-05', 12, 'HONDA ARTA CIKUPA', 10.0, 0, 30, '2022-12-05 10:26:40', 12, 'T'),
	(64, 95, 'Task 1.3', '2023-01-11', 0, 'Task 1 bawahnya', 0.0, 0, 2, '2022-12-12 09:57:19', 1, 'T'),
	(65, 101, 'Task 2', '2022-12-07', 13, 'Iya bisa', 0.0, 0, 0, '2022-12-12 10:08:49', 1, 'T'),
	(66, 101, 'Task 2', '2022-12-07', 13, 'Iya bisa', 0.0, 0, 0, '2022-12-12 10:09:35', 1, 'T'),
	(67, 108, 'Task 3', '2022-12-13', 13, 'Postgres Testing', 10.0, 0, 0, '2022-12-15 04:43:32', 1, NULL),
	(68, 108, 'Task 3', '2022-12-13', 13, 'Postgres Testing', 35.0, 0, 0, '2022-12-15 04:43:42', 1, NULL);
/*!40000 ALTER TABLE "task_detail_history" ENABLE KEYS */;

-- Dumping structure for table public.task_history
CREATE TABLE IF NOT EXISTS "task_history" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''task_history_id_seq''::regclass)',
	"id_task" INTEGER NOT NULL,
	"no_task" VARCHAR(191) NOT NULL,
	"tanggal" DATE NOT NULL,
	"pic_id" INTEGER NOT NULL,
	"client_id" INTEGER NOT NULL,
	"notes" TEXT NULL DEFAULT NULL,
	"status" SMALLINT NOT NULL DEFAULT '0',
	"history_remarks" TEXT NULL DEFAULT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"created_by" INTEGER NOT NULL,
	"trial261" CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.task_history: 30 rows
/*!40000 ALTER TABLE "task_history" DISABLE KEYS */;
INSERT INTO "task_history" ("id", "id_task", "no_task", "tanggal", "pic_id", "client_id", "notes", "status", "history_remarks", "created_at", "created_by", "trial261") VALUES
	(1, 5, 'JACB Jateng', '2022-12-08', 8, 72, 'Implementasi JACB ke Dealer Jateng', 0, 'Perubahan notes ', '2022-12-02 10:25:42', 1, 'T'),
	(2, 13, 'Implementasi Honda Bone', '2022-12-03', 8, 81, 'Implementasi Honda Bone', 0, 'Perubahan tanggal ', '2022-12-02 10:43:25', 1, 'T'),
	(3, 20, 'List Request Intercom', '2022-12-05', 8, 78, 'List Request Intercom', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:48:13', 1, 'T'),
	(4, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-03', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Auto Generated', '2022-12-02 10:47:16', 1, 'T'),
	(5, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-05', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Auto Generated', '2022-12-05 09:52:40', 14, 'T'),
	(6, 1, 'Hansa Renkei', '2022-12-07', 8, 68, 'Create Program Hansa Renkei', 0, 'Perubahan tanggal oleh GAMAL dengan Task Auto Generated', '2022-12-02 10:06:01', 1, 'T'),
	(7, 19, 'Suara untuk QMS', '2022-12-08', 8, 77, 'Update Suara baru dan demo', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:47:49', 1, 'T'),
	(8, 22, 'AP Accessories Local Arta Cikupa', '2022-12-05', 8, 79, 'AP Accessories Local Arta Cikupa', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:49:42', 1, 'T'),
	(9, 18, 'Laporan Pemakaian Poin dari Mobile', '2022-12-06', 8, 73, 'Laporan pemakaian point dari Apps', 0, 'Perubahan tanggal oleh LUTFI dengan Task Task 1.2', '2022-12-05 09:53:15', 14, 'T'),
	(10, 20, 'List Request Intercom', '2022-12-08', 8, 78, 'List Request Intercom', 0, 'Perubahan tanggal oleh GAMAL dengan Task Auto Generated', '2022-12-05 07:41:47', 1, 'T'),
	(11, 8, 'Standarisasi Master Tipe Kumala', '2022-12-13', 8, 74, 'Standarisasi untuk Master Tipe di Honda Karawang dan Cikampek untuk Kebutuhan Transfer in out via API', 0, 'Perubahan tanggal ', '2022-12-02 10:38:32', 1, 'T'),
	(12, 22, 'AP Accessories Local Arta Cikupa', '2022-12-06', 8, 79, 'AP Accessories Local Arta Cikupa', 0, 'Perubahan tanggal oleh ZAWI USER dengan Task Auto Generated', '2022-12-06 14:05:29', 1, 'T'),
	(13, 3, 'Digital Dokumen Bintaro', '2022-12-08', 8, 69, 'PDF Faktur, Kwitansi, TTS', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2.3', '2022-12-02 10:18:06', 1, 'T'),
	(14, 4, 'Digital Dokumen Cibubur', '2022-12-08', 8, 70, 'PDF Faktur dan Kwitansi', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.1', '2022-12-02 10:24:47', 1, 'T'),
	(15, 5, 'JACB Jateng', '2022-12-08', 8, 72, 'Implementasi JACB ke Dealer Jateng - Tunggu Request Dealer', 0, 'Perubahan tanggal ', '2022-12-02 10:54:46', 1, 'T'),
	(16, 7, 'List Request Karawang', '2022-12-09', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.5', '2022-12-02 10:37:04', 1, 'T'),
	(17, 7, 'List Request Karawang', '2022-12-12', 8, 74, 'List Request Update Honda Kumala Karawang', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-08 09:05:25', 1, 'T'),
	(18, 9, 'List Request IKB BP (Pradana) ', '2022-12-08', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:39:41', 1, 'T'),
	(19, 11, 'Monthly Meeting MGI', '2022-12-13', 8, 71, 'Monthly Meeting tiap hari selasa jam 10', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-02 10:41:40', 1, 'T'),
	(20, 13, 'Implementasi Honda Bone', '2022-12-08', 8, 81, 'Implementasi Honda Bone', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1.2', '2022-12-05 05:03:38', 1, 'T'),
	(21, 15, 'Project management review', '2022-12-08', 8, 82, 'Project management review', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:45:34', 1, 'T'),
	(22, 1, 'Hansa Renkei', '2022-12-13', 8, 68, 'Create Program Hansa Renkei', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 2', '2022-12-06 05:00:16', 13, 'T'),
	(23, 14, 'Implementasi Hyundai Batam', '2022-12-08', 8, 82, 'Implementasi Hyundai Batam', 0, 'Perubahan tanggal ', '2022-12-02 10:45:09', 1, 'T'),
	(24, 21, 'Sync Dashboard MAM', '2022-12-08', 8, 67, 'Program Sync Dashboard MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Task 1', '2022-12-02 10:48:50', 1, 'T'),
	(25, 2, 'Digital Dokumen MAM', '2022-12-09', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:09:28', 1, 'T'),
	(26, 9, 'List Request IKB BP (Pradana) ', '2022-12-12', 8, 73, 'List Request Laporan dan Update Menu untuk Honda Pradana', 0, 'Perubahan tanggal oleh GAMAL dengan Task Task 1', '2022-12-08 09:07:43', 1, 'T'),
	(27, 2, 'Digital Dokumen MAM', '2022-12-15', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-12 07:43:25', 1, 'T'),
	(28, 2, 'Digital Dokumen MAM', '2022-12-26', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-12 08:18:29', 1, 'T'),
	(29, 2, 'Digital Dokumen MAM', '2022-12-29', 8, 67, 'Implementasi Digital Dokumen untuk Group MAM', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-12 09:53:22', 1, 'T'),
	(30, 12, 'Implementasi Chery Arta Cikupa', '2022-12-12', 8, 80, 'Implementasi Dealer Chery Arta Cikupa', 0, 'Perubahan tanggal oleh ADMIN dengan Task Auto Generated', '2022-12-02 10:42:16', 1, 'T');
/*!40000 ALTER TABLE "task_history" ENABLE KEYS */;

-- Dumping structure for table public.users
CREATE TABLE IF NOT EXISTS "users" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''users_id_seq''::regclass)',
	"username" VARCHAR(15) NOT NULL,
	"password" VARCHAR(250) NOT NULL,
	"name" VARCHAR(50) NOT NULL,
	"id_roles" INTEGER NOT NULL,
	"last_login" TIMESTAMP NOT NULL,
	"modified_at" TIMESTAMP NOT NULL,
	"modified_by" INTEGER NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"created_by" INTEGER NOT NULL,
	"trial264" CHAR(1) NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	INDEX "idx_username" ("username")
);

-- Dumping data for table public.users: 9 rows
/*!40000 ALTER TABLE "users" DISABLE KEYS */;
INSERT INTO "users" ("id", "username", "password", "name", "id_roles", "last_login", "modified_at", "modified_by", "created_at", "created_by", "trial264") VALUES
	(8, 'ZAWI', '$2y$10$Xeb/DjLV.4/txLmzojFkE.W8uLNmA8qJEb5/tL0os5aJHChH2MPm6', 'ZAWI', 2, '2022-12-06 16:53:09', '0001-01-01 00:00:00', 0, '2022-11-24 06:05:17', 1, 'T'),
	(9, 'WIDI', '$2y$10$ScgY06qKpHmXk8GH3YPySOEhcYB/rsep96SdTJEIfBb9eCLyKUWCG', 'WIDI', 2, '2022-12-06 16:54:43', '0001-01-01 00:00:00', 0, '2022-11-24 06:05:26', 1, 'T'),
	(10, 'ANDRIE', '$2y$10$IEQxZtADXYafHCkRB8IZLOOWjY1pJsrSfBh5RsQ1/bYjqrxYmrEQ2', 'ANDRIE', 2, '0001-01-01 00:00:00', '0001-01-01 00:00:00', 0, '2022-11-24 06:05:35', 1, 'T'),
	(11, 'DEDY', '$2y$10$RKXtnTP8hQXJwCqR3gEaPeqVwQmzXwuKBoRAkGHy2p6jlBHiG25ee', 'DEDY', 2, '0001-01-01 00:00:00', '0001-01-01 00:00:00', 0, '2022-11-24 06:05:56', 1, 'T'),
	(12, 'FIKRI', '$2y$10$NF8O5b.K93lWCWRGJu9GC.KkZjtO.U/Wpf2zgWmdW1M3cjPo5Hb5i', 'FIKRI', 3, '2022-12-06 16:55:09', '0001-01-01 00:00:00', 0, '2022-11-24 06:07:21', 1, 'T'),
	(13, 'GAMAL', '$2y$10$RALA3.tKohzqlmorZP7mDeVXxOuSu.t/tA2/4h8qULxikSfn2Uexu', 'GAMAL', 3, '2022-12-12 14:48:01', '0001-01-01 00:00:00', 0, '2022-11-24 06:07:29', 1, 'T'),
	(14, 'LUTFI', '$2y$10$QdFQ353OrS77qMvo0Pcviu42fz0TdOpgBH2Tfmk27bH5Hb4L5OK9m', 'LUTFI', 3, '2022-12-12 14:50:00', '0001-01-01 00:00:00', 0, '2022-11-24 06:07:40', 1, 'T'),
	(15, 'ZAWI USER', '$2y$10$ecjb0455gSUU9UbMa4aWH.KnjXUg/GOZpLCRIJXcYER.ZcN/zMAUO', 'ZAWI USER', 3, '2022-12-08 15:18:09', '0001-01-01 00:00:00', 0, '2022-12-02 10:56:46', 1, 'T'),
	(1, 'admin', '$2y$10$Qdb5zdQcZ7TfiCY7OQdgm.7VwMu7zmBJSAvhZnHdQyh2Ad9y.Mgay', 'ADMIN', 1, '2022-12-15 10:29:29.403661', '2022-11-23 02:53:49', 1, '0001-01-01 00:00:00', 0, 'T');
/*!40000 ALTER TABLE "users" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
