-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Bulan Mei 2022 pada 16.10
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ayamswasta`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_keranjang`
--

CREATE TABLE `tb_detail_keranjang` (
  `dk_id` int(11) NOT NULL,
  `dk_ker_id` int(11) NOT NULL,
  `dk_menu_id` int(11) NOT NULL,
  `dk_jml_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_detail_keranjang`
--

INSERT INTO `tb_detail_keranjang` (`dk_id`, `dk_ker_id`, `dk_menu_id`, `dk_jml_menu`) VALUES
(1, 1, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_pesanan`
--

CREATE TABLE `tb_detail_pesanan` (
  `dp_id` int(11) NOT NULL,
  `dp_pesan_id` int(11) NOT NULL,
  `dp_menu_id` int(11) NOT NULL,
  `dp_jml_pesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_detail_pesanan`
--

INSERT INTO `tb_detail_pesanan` (`dp_id`, `dp_pesan_id`, `dp_menu_id`, `dp_jml_pesanan`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_keranjang`
--

CREATE TABLE `tb_keranjang` (
  `ker_id` int(11) NOT NULL,
  `ker_user_id` int(11) NOT NULL,
  `ker_tgl_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_keranjang`
--

INSERT INTO `tb_keranjang` (`ker_id`, `ker_user_id`, `ker_tgl_input`) VALUES
(1, 1, '2022-04-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_menu`
--

CREATE TABLE `tb_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(225) NOT NULL,
  `menu_harga` bigint(20) NOT NULL,
  `menu_disc` int(11) NOT NULL,
  `menu_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_menu`
--

INSERT INTO `tb_menu` (`menu_id`, `menu_name`, `menu_harga`, `menu_disc`, `menu_status`) VALUES
(1, 'dada geprek', 20000, 30, 'ada'),
(2, 'sayap+ esteh', 15000, 0, 'ada'),
(3, 'paha bawah + milo', 17000, 0, 'ada');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `p_id` int(11) NOT NULL,
  `p_user_id` int(11) NOT NULL,
  `p_tgl_pesan` date NOT NULL,
  `p_admin_id` int(11) NOT NULL,
  `p_status` varchar(225) NOT NULL,
  `p_driver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`p_id`, `p_user_id`, `p_tgl_pesan`, `p_admin_id`, `p_status`, `p_driver_id`) VALUES
(1, 3, '2022-04-06', 1, 'sedang dikirim', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_role`
--

CREATE TABLE `tb_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_role`
--

INSERT INTO `tb_role` (`role_id`, `role_name`) VALUES
(1, 'User'),
(2, 'Driver'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `us_id` int(11) NOT NULL,
  `us_username` varchar(225) NOT NULL,
  `us_fullname` varchar(225) NOT NULL,
  `us_password` varchar(225) NOT NULL,
  `us_alamat` varchar(225) NOT NULL,
  `us_telepon` varchar(15) NOT NULL,
  `us_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`us_id`, `us_username`, `us_fullname`, `us_password`, `us_alamat`, `us_telepon`, `us_role_id`) VALUES
(1, 'yusuf', 'yusuf septian', 'osep', 'muntilan', '081234785923', 2),
(2, 'arul', 'nasrullah', 'naser', 'mojogedang', '081252686999', 3),
(3, 'yudi', 'wahyudistira', 'yudist', 'karangpandan', '0838484928', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_detail_keranjang`
--
ALTER TABLE `tb_detail_keranjang`
  ADD PRIMARY KEY (`dk_id`),
  ADD KEY `dk_menu_id` (`dk_menu_id`),
  ADD KEY `dk_ker_id` (`dk_ker_id`);

--
-- Indeks untuk tabel `tb_detail_pesanan`
--
ALTER TABLE `tb_detail_pesanan`
  ADD PRIMARY KEY (`dp_id`),
  ADD KEY `dp_menu_id` (`dp_menu_id`),
  ADD KEY `dp_pesan_id` (`dp_pesan_id`);

--
-- Indeks untuk tabel `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  ADD PRIMARY KEY (`ker_id`),
  ADD KEY `ker_user_id` (`ker_user_id`);

--
-- Indeks untuk tabel `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indeks untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `p_user_id` (`p_user_id`),
  ADD KEY `p_driver_id` (`p_driver_id`),
  ADD KEY `p_admin_id` (`p_admin_id`);

--
-- Indeks untuk tabel `tb_role`
--
ALTER TABLE `tb_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`us_id`),
  ADD KEY `us_role_id` (`us_role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_detail_keranjang`
--
ALTER TABLE `tb_detail_keranjang`
  MODIFY `dk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_detail_pesanan`
--
ALTER TABLE `tb_detail_pesanan`
  MODIFY `dp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  MODIFY `ker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_role`
--
ALTER TABLE `tb_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `us_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_detail_keranjang`
--
ALTER TABLE `tb_detail_keranjang`
  ADD CONSTRAINT `tb_detail_keranjang_ibfk_1` FOREIGN KEY (`dk_ker_id`) REFERENCES `tb_keranjang` (`ker_id`),
  ADD CONSTRAINT `tb_detail_keranjang_ibfk_2` FOREIGN KEY (`dk_menu_id`) REFERENCES `tb_menu` (`menu_id`);

--
-- Ketidakleluasaan untuk tabel `tb_detail_pesanan`
--
ALTER TABLE `tb_detail_pesanan`
  ADD CONSTRAINT `tb_detail_pesanan_ibfk_1` FOREIGN KEY (`dp_pesan_id`) REFERENCES `tb_pesanan` (`p_id`),
  ADD CONSTRAINT `tb_detail_pesanan_ibfk_2` FOREIGN KEY (`dp_menu_id`) REFERENCES `tb_menu` (`menu_id`);

--
-- Ketidakleluasaan untuk tabel `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  ADD CONSTRAINT `tb_keranjang_ibfk_1` FOREIGN KEY (`ker_user_id`) REFERENCES `tb_role` (`role_id`);

--
-- Ketidakleluasaan untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD CONSTRAINT `tb_pesanan_ibfk_1` FOREIGN KEY (`p_driver_id`) REFERENCES `tb_user` (`us_id`),
  ADD CONSTRAINT `tb_pesanan_ibfk_2` FOREIGN KEY (`p_admin_id`) REFERENCES `tb_user` (`us_id`),
  ADD CONSTRAINT `tb_pesanan_ibfk_3` FOREIGN KEY (`p_user_id`) REFERENCES `tb_user` (`us_id`);

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`us_role_id`) REFERENCES `tb_role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
