-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 15 Okt 2025 pada 01.31
-- Versi server: 5.7.39
-- Versi PHP: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akademik2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nama_guru` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text,
  `no_telepon` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mata_pelajaran` varchar(100) DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id_guru`, `nip`, `nama_guru`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `no_telepon`, `email`, `mata_pelajaran`, `status`) VALUES
(1, '1987654321', 'Setiawan', 'L', '1980-05-14', 'Jl. Merdeka No. 10, Bandung', '081234567890', 'setiawan@gmail.com', 'Matematika', 'aktif'),
(2, '1987654322', 'Risa', 'P', '1985-03-22', 'Jl. Melati No. 5, Jakarta', '082345678901', 'risa@gmail.com', 'Bahasa Indonesia', 'aktif'),
(3, '1987654323', 'Budi Hartono', 'L', '1978-11-09', 'Jl. Anggrek No. 12, Surabaya', '083456789012', 'budi.hartono@gmail.com', 'IPA', 'aktif'),
(4, '1987654324', 'Dewi', 'P', '1990-08-15', 'Jl. Kenanga No. 7, Yogyakarta', '084567890123', 'dewi@gmail.com', 'Bahasa Inggris', 'aktif'),
(5, '1987654325', 'Pratama', 'L', '1987-12-01', 'Jl. Mawar No. 9, Medan', '085678901234', 'pratama@gmail.com', 'PJOK', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `singkatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `singkatan`) VALUES
(1, 'Rekayasa Perangkat Lunak', 'RPL'),
(2, 'Teknik Komputer dan Jaringan', 'TKJ'),
(3, 'Desain Komunikasi Visual', 'DKV');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `tingkat` enum('X','XI','XII') NOT NULL,
  `id_jurusan` int(11) DEFAULT NULL,
  `wali_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `tingkat`, `id_jurusan`, `wali_kelas`) VALUES
(1, 'X RPL 1', 'X', 1, NULL),
(2, 'X RPL 2', 'X', 1, NULL),
(3, 'X TKJ 1', 'X', 2, NULL),
(4, 'X TKJ 2', 'X', 2, NULL),
(5, 'X DKV 1', 'X', 3, NULL),
(6, 'X DKV 2', 'X', 3, NULL),
(7, 'XI RPL 1', 'XI', 1, NULL),
(8, 'XI TKJ 1', 'XI', 2, NULL),
(9, 'XI DKV 1', 'XI', 3, NULL),
(10, 'XII RPL 1', 'XII', 1, NULL),
(11, 'XII TKJ 1', 'XII', 2, NULL),
(12, 'XII DKV 1', 'XII', 3, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` varchar(10) NOT NULL,
  `nama_mapel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`) VALUES
('Indx', 'Bahasa Indonesia'),
('INGX', 'Bahasa Inggris'),
('Matx', 'Bahasa Jepang'),
('PPKN', 'Pendidikan Pancasila');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mutasi_siswa`
--

CREATE TABLE `mutasi_siswa` (
  `id_mutasi` int(11) NOT NULL,
  `nis` char(10) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `jenis_mutasi` enum('Masuk','Keluar','Pindah Kelas','Pindah Sekolah') NOT NULL,
  `tanggal_mutasi` date NOT NULL,
  `alasan_mutasi` text,
  `asal_sekolah` varchar(100) DEFAULT NULL,
  `tujuan_sekolah` varchar(100) DEFAULT NULL,
  `kelas_asal` varchar(50) DEFAULT NULL,
  `kelas_tujuan` varchar(50) DEFAULT NULL,
  `keterangan` text,
  `dibuat_oleh` varchar(50) DEFAULT NULL,
  `dibuat_pada` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `diupdate_pada` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mutasi_siswa`
--

INSERT INTO `mutasi_siswa` (`id_mutasi`, `nis`, `nama_siswa`, `jenis_mutasi`, `tanggal_mutasi`, `alasan_mutasi`, `asal_sekolah`, `tujuan_sekolah`, `kelas_asal`, `kelas_tujuan`, `keterangan`, `dibuat_oleh`, `dibuat_pada`, `diupdate_pada`) VALUES
(1, '405', 'Jasver', 'Pindah Kelas', '2025-07-10', 'Ingin Pindah Kelas', NULL, NULL, 'XI RPL 1', 'XI RPL 2', 'Pindah ke kelas XI RPL 2', 'Admin', '2025-10-14 13:20:12', '2025-10-14 13:20:12'),
(2, '406', 'Gauhar', 'Pindah Sekolah', '2025-07-12', 'Ikut orang tua', 'HOGWARTS ACADEMY', 'LENUX SCHOOL', 'X RPL', NULL, 'Pindah ke Bandung', 'Admin', '2025-10-14 13:20:12', '2025-10-14 13:20:12'),
(3, '407', 'Indra', 'Pindah Kelas', '2025-07-13', 'Tidak cocok dengan teman sekelas', NULL, NULL, 'XI TKJ 2', 'XI TKJ 1', 'Pindah ke kelas XI TKJ 2', 'Admin', '2025-10-14 13:20:12', '2025-10-14 13:20:12'),
(4, '408', 'Reno', 'Pindah Sekolah', '2025-07-15', 'Mutasi ke luar kota', 'HOGWARTS ACADEMY', 'SURABAYA SCHOOL', 'XI RPL', NULL, 'Pindah ke Surabaya', 'Admin', '2025-10-14 13:20:12', '2025-10-14 13:20:12');

--
-- Trigger `mutasi_siswa`
--
DELIMITER $$
CREATE TRIGGER `after_mutasi_insert` AFTER INSERT ON `mutasi_siswa` FOR EACH ROW BEGIN
    IF NEW.jenis_mutasi = 'Pindah Kelas' THEN
        UPDATE siswa
        SET kelas = NEW.kelas_tujuan,
            status = 'Pindah Kelas',
            tanggal_update = NEW.tanggal_mutasi
        WHERE nis = NEW.nis;

    ELSEIF NEW.jenis_mutasi = 'Pindah Sekolah' THEN
        UPDATE siswa
        SET status = 'Pindah Sekolah',
            tanggal_update = NEW.tanggal_mutasi
        WHERE nis = NEW.nis;

    ELSEIF NEW.jenis_mutasi = 'Lulus' THEN
        UPDATE siswa
        SET status = 'Lulus',
            tanggal_update = NEW.tanggal_mutasi
        WHERE nis = NEW.nis;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_mapel` varchar(20) DEFAULT NULL,
  `nis` char(10) DEFAULT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_mapel`, `nis`, `nilai`) VALUES
(1, 'Matx', '401', 80),
(2, 'Indx', '401', 70),
(3, 'Matx', '402', 65),
(4, 'Indx', '402', 60),
(5, 'Matx', '403', 45),
(6, 'Indx', '403', 90),
(7, 'PPKN', '402', 60);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nis` char(10) NOT NULL,
  `nisn` char(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kelas` varchar(10) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `tlp` varchar(13) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `jurusan` varchar(10) DEFAULT NULL,
  `status` enum('Aktif','Pindah Kelas','Pindah Sekolah','Lulus') DEFAULT 'Aktif',
  `tanggal_update` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nis`, `nisn`, `nama`, `kelas`, `alamat`, `tlp`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `jurusan`, `status`, `tanggal_update`) VALUES
('401', '202501', 'malver', 'X RPL 1', 'Jln. Imam Bonjol No. 1', '0812345678', 'Jakarta', '2008-11-08', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('402', '202502', 'jasmine', 'X TKJ 1', 'Jln. Gatot Subroto No. 2', '0812455384', 'Washington', '2008-12-09', 'Perempuan', 'Teknik Kom', 'Aktif', NULL),
('403', '202503', 'alana', 'X DKV', 'Jln. Sudirman No 3', '0815678456', 'Bandung', '2009-11-08', 'Perempuan', 'Desain Kom', 'Aktif', NULL),
('404', '202504', 'luna', 'X RPL 1', 'Jln. Mahamayu', '0897979797', 'Lampung', '2008-05-12', 'Perempuan', 'Rekayasa P', 'Aktif', NULL),
('405', '202505', 'jasver', 'XI RPL 2', 'Jln. Gn Anjani', '08212121211', 'Melbourne', '2008-01-01', 'Laki-laki', 'Rekayasa P', 'Pindah Kelas', '2025-07-10'),
('406', '202506', 'gauhar', 'X RPL 2', 'Jln. Malioboro', '0834343434', 'Semarang', '2008-03-07', 'Laki-laki', 'Rekayasa P', 'Pindah Sekolah', '2025-07-12'),
('407', '202507', 'indra', 'XI TKJ 1', 'Jln. Merdeka No. 4', '081345678901', 'Surabaya', '2008-04-15', 'Laki-laki', 'Rekayasa P', 'Pindah Kelas', '2025-07-13'),
('408', '202508', 'sarah', 'XI RPL 2', 'Jln. Soekarno No. 5', '081234567890', 'Jakarta', '2008-06-22', 'Perempuan', 'Teknik Kom', 'Pindah Sekolah', '2025-07-15'),
('409', '202509', 'daniel', 'XI TKJ 2', 'Jln. Ahmad Yani No. 9', '082145679012', 'Bandung', '2009-02-10', 'Laki-laki', 'Desain Kom', 'Aktif', NULL),
('410', '202510', 'tania', 'XI DKV 2', 'Jln. Sutomo No. 3', '081278934567', 'Yogyakarta', '2008-09-12', 'Perempuan', 'Rekayasa P', 'Aktif', NULL),
('411', '202511', 'reno', 'XI RPL', 'Jln. Cendrawasih No. 1', '082178934561', 'Medan', '2008-03-05', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('412', '202512', 'kevin', 'XI TKJ', 'Jln. Diponegoro No. 2', '081567893421', 'Surabaya', '2008-05-20', 'Laki-laki', 'Teknik Kom', 'Aktif', NULL),
('413', '202513', 'salsa', 'X DKV', 'Jln. Kartini No. 7', '081298765432', 'Semarang', '2009-08-15', 'Perempuan', 'Desain Kom', 'Aktif', NULL),
('414', '202514', 'bintang', 'XI RPL', 'Jln. Pahlawan No. 10', '089623456789', 'Malang', '2008-11-10', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('415', '202515', 'mira', 'X RPL', 'Jln. Melati No. 9', '081345678954', 'Pontianak', '2009-01-24', 'Perempuan', 'Rekayasa P', 'Aktif', NULL),
('416', '202516', 'fadil', 'X TKJ', 'Jln. Mawar No. 8', '089654321123', 'Depok', '2009-04-11', 'Laki-laki', 'Teknik Kom', 'Aktif', NULL),
('417', '202517', 'aisyah', 'XI TKJ', 'Jln. Anggrek No. 5', '081234566432', 'Jakarta', '2008-07-08', 'Perempuan', 'Teknik Kom', 'Aktif', NULL),
('418', '202518', 'rani', 'X RPL', 'Jln. Flamboyan No. 2', '085634562321', 'Bekasi', '2009-02-19', 'Perempuan', 'Rekayasa P', 'Aktif', NULL),
('419', '202519', 'naufal', 'X RPL', 'Jln. Melur No. 12', '081245671231', 'Padang', '2009-06-02', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('420', '202520', 'adit', 'XI DKV', 'Jln. Wijaya Kusuma No. 3', '081356712341', 'Bali', '2008-12-17', 'Laki-laki', 'Desain Kom', 'Aktif', NULL),
('421', '202521', 'citra', 'X TKJ', 'Jln. Merpati No. 6', '081234543212', 'Banjarmasin', '2009-03-13', 'Perempuan', 'Teknik Kom', 'Aktif', NULL),
('422', '202522', 'andre', 'X RPL', 'Jln. Gajah Mada No. 2', '085612345678', 'Surakarta', '2009-05-24', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('423', '202523', 'sinta', 'XI RPL', 'Jln. Sudirman No. 9', '081345234567', 'Cirebon', '2008-10-21', 'Perempuan', 'Rekayasa P', 'Aktif', NULL),
('424', '202524', 'reza', 'XI TKJ', 'Jln. Kenanga No. 11', '081245678123', 'Tangerang', '2008-09-01', 'Laki-laki', 'Teknik Kom', 'Aktif', NULL),
('425', '202525', 'melani', 'X DKV', 'Jln. Nangka No. 4', '081234567987', 'Bogor', '2009-08-12', 'Perempuan', 'Desain Kom', 'Aktif', NULL),
('426', '202526', 'ariel', 'XI RPL', 'Jln. Cempaka No. 13', '081231212121', 'Makassar', '2008-01-07', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('427', '202527', 'tio', 'XI RPL', 'Jln. Anyelir No. 10', '081356789012', 'Balikpapan', '2008-03-19', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('428', '202528', 'vanya', 'X RPL', 'Jln. Kamboja No. 15', '089765432121', 'Manado', '2009-02-04', 'Perempuan', 'Rekayasa P', 'Aktif', NULL),
('429', '202529', 'mario', 'X TKJ', 'Jln. Mawar No. 16', '081256734512', 'Palembang', '2009-06-06', 'Laki-laki', 'Teknik Kom', 'Aktif', NULL),
('430', '202530', 'putri', 'XI TKJ', 'Jln. Anggrek No. 17', '081277745612', 'Jakarta', '2008-05-12', 'Perempuan', 'Teknik Kom', 'Aktif', NULL),
('431', '202531', 'denis', 'XI DKV', 'Jln. Merdeka No. 20', '081245677890', 'Bandung', '2008-10-23', 'Laki-laki', 'Desain Kom', 'Aktif', NULL),
('432', '202532', 'hani', 'XI RPL', 'Jln. Diponegoro No. 21', '081234598761', 'Surabaya', '2008-07-09', 'Perempuan', 'Rekayasa P', 'Aktif', NULL),
('433', '202533', 'irfan', 'X RPL', 'Jln. Pahlawan No. 22', '089654321567', 'Semarang', '2009-01-15', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('434', '202534', 'karina', 'XI TKJ', 'Jln. Cendana No. 25', '081345678312', 'Depok', '2008-11-18', 'Perempuan', 'Teknik Kom', 'Aktif', NULL),
('435', '202535', 'fajar', 'X RPL', 'Jln. Melati No. 28', '081356789333', 'Yogyakarta', '2009-03-29', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('436', '202536', 'saskia', 'XI DKV', 'Jln. Kenanga No. 30', '081245678554', 'Bogor', '2008-09-09', 'Perempuan', 'Desain Kom', 'Aktif', NULL),
('437', '202537', 'bayu', 'XI RPL', 'Jln. Anggrek No. 33', '081278945678', 'Jakarta', '2008-04-27', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('438', '202538', 'alya', 'X TKJ', 'Jln. Melur No. 35', '081234567899', 'Semarang', '2009-07-17', 'Perempuan', 'Teknik Kom', 'Aktif', NULL),
('439', '202539', 'rama', 'XI RPL', 'Jln. Mawar No. 38', '081256789123', 'Bandung', '2008-08-04', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('440', '202540', 'ani', 'XI TKJ', 'Jln. Cempaka No. 40', '081245678234', 'Bekasi', '2008-10-01', 'Perempuan', 'Teknik Kom', 'Aktif', NULL),
('441', '202541', 'gilang', 'XI DKV', 'Jln. Wijaya Kusuma No. 41', '081245678745', 'Malang', '2008-06-06', 'Laki-laki', 'Desain Kom', 'Aktif', NULL),
('442', '202542', 'tari', 'X RPL', 'Jln. Gajah Mada No. 43', '081245671234', 'Jakarta', '2009-02-20', 'Perempuan', 'Rekayasa P', 'Aktif', NULL),
('443', '202543', 'faisal', 'X RPL', 'Jln. Merdeka No. 44', '081277745631', 'Surabaya', '2009-03-11', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('444', '202544', 'linda', 'XI TKJ', 'Jln. Melati No. 45', '081278934562', 'Depok', '2008-11-30', 'Perempuan', 'Teknik Kom', 'Aktif', NULL),
('445', '202545', 'angga', 'X RPL', 'Jln. Sudirman No. 47', '081245678932', 'Palembang', '2009-01-02', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL),
('446', '202546', 'cindy', 'XI RPL', 'Jln. Pahlawan No. 48', '081345678933', 'Semarang', '2008-05-07', 'Perempuan', 'Rekayasa P', 'Aktif', NULL),
('447', '202547', 'rafli', 'XI TKJ', 'Jln. Cendana No. 49', '081278934534', 'Tangerang', '2008-08-08', 'Laki-laki', 'Teknik Kom', 'Aktif', NULL),
('448', '202548', 'devin', 'X DKV', 'Jln. Melur No. 50', '081245678911', 'Bogor', '2009-06-15', 'Laki-laki', 'Desain Kom', 'Aktif', NULL),
('449', '202549', 'sania', 'XI TKJ', 'Jln. Anyelir No. 51', '081234567765', 'Jakarta', '2008-09-12', 'Perempuan', 'Teknik Kom', 'Aktif', NULL),
('450', '202550', 'riko', 'XI RPL', 'Jln. Kenanga No. 52', '081234567887', 'Surabaya', '2008-12-25', 'Laki-laki', 'Rekayasa P', 'Aktif', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `nama`, `password`) VALUES
(1, 'marvelkeren', 'marvel', '$2y$10$ogZI5kX2UhF6ia8hS44M5uom00PuRTmgmyPJJiNqs5EpB7y0z2A3.'),
(6, 'jasmine sayang', 'jasmine', '$2y$10$VglHzM9wYkmwflB/afcmieUZnG0dj9UV7keqAJbvCVcr2335Pk.0u'),
(7, 'alana cantik', 'alana', '$2y$10$sBbSfNI1gWu/IBog5Lq2POSzpzYeAz4WL01GX33r1bpzO2RJ5uHJu');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `fk_wali_kelas` (`wali_kelas`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `mutasi_siswa`
--
ALTER TABLE `mutasi_siswa`
  ADD PRIMARY KEY (`id_mutasi`),
  ADD KEY `nis` (`nis`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `nis` (`nis`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `mutasi_siswa`
--
ALTER TABLE `mutasi_siswa`
  MODIFY `id_mutasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `fk_wali_kelas` FOREIGN KEY (`wali_kelas`) REFERENCES `guru` (`id_guru`),
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Ketidakleluasaan untuk tabel `mutasi_siswa`
--
ALTER TABLE `mutasi_siswa`
  ADD CONSTRAINT `mutasi_siswa_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`);

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
