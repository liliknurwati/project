-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Okt 2021 pada 15.56
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_nama` varchar(50) DEFAULT NULL,
  `admin_email` varchar(50) DEFAULT NULL,
  `admin_notelp` varchar(16) DEFAULT NULL,
  `admin_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_nama`, `admin_email`, `admin_notelp`, `admin_password`) VALUES
(1, 'Admin Pendaftaran', 'admin01.admin@gmail.com', '082345654786', 'admin#123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `daftar_id` int(11) NOT NULL,
  `daftar_status` varchar(30) DEFAULT NULL,
  `daftar_keterangan` text DEFAULT NULL,
  `daftar_siswa` int(11) DEFAULT NULL,
  `daftar_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`daftar_id`, `daftar_status`, `daftar_keterangan`, `daftar_siswa`, `daftar_admin`) VALUES
(2, 'Diterima', 'Selamat Anda Diterima. Langkah Selanjutnya yaitu Administrasi.', 2, NULL),
(9, 'Tidak Diterima', 'Data Tidak lengkap', 4, NULL),
(12, 'Diterima', 'Selamat Anda Diterima. Langkah Selanjutnya yaitu Administrasi.', 5, NULL),
(13, 'Diterima', 'Selamat Anda Diterima. Langkah Selanjutnya yaitu Administrasi.', 6, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `siswa_id` int(11) NOT NULL,
  `siswa_nama` varchar(50) DEFAULT NULL,
  `siswa_email` varchar(50) DEFAULT NULL,
  `siswa_password` varchar(50) DEFAULT NULL,
  `siswa_tempat_lahir` varchar(30) DEFAULT NULL,
  `siswa_ttl` date DEFAULT NULL,
  `siswa_sekolah` varchar(50) DEFAULT NULL,
  `siswa_alamat` varchar(100) DEFAULT NULL,
  `siswa_notelp` varchar(16) DEFAULT NULL,
  `siswa_nilai` double DEFAULT NULL,
  `siswa_jurusan` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `siswa_foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`siswa_id`, `siswa_nama`, `siswa_email`, `siswa_password`, `siswa_tempat_lahir`, `siswa_ttl`, `siswa_sekolah`, `siswa_alamat`, `siswa_notelp`, `siswa_nilai`, `siswa_jurusan`, `gender`, `siswa_foto`) VALUES
(2, 'Calon Pendaftar Kedua', 'siswa02.siswa@gmail.com', '1234', 'Blitar', '2007-10-15', 'MTSN 1 Gandusari', 'Jl. Karang Semanding No.2', '087697643324', 90.3, 'IPA', 'Laki-laki', 'hae.jpg'),
(4, 'Calon Pendaftar Ketiga ', 'siswa03.siswa@gmail.com', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Calon Pendaftar Pertama', 'siswa01.siswa@gmail.com', '1234567', 'Karawang', '2007-10-17', 'SMPN 1 Garum', 'Jl. Waru No. 2', '087264232526', 92.3, 'IPA', 'Laki-laki', 'jae.jpg'),
(6, 'Lilik Nurwati', 'lilikelen04@gmail.com', '1234', 'Blitar', '2000-11-28', 'SMPN 1 Garum', 'JL. PEGANGSAAN TIMUR NO.12', '088888866673', 89, 'IPA', 'Perempuan', 'img_liliknurwati.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`daftar_id`),
  ADD KEY `daftar_siswa` (`daftar_siswa`),
  ADD KEY `daftar_admin` (`daftar_admin`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`siswa_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `daftar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `siswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`daftar_siswa`) REFERENCES `siswa` (`siswa_id`),
  ADD CONSTRAINT `pendaftaran_ibfk_2` FOREIGN KEY (`daftar_admin`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
