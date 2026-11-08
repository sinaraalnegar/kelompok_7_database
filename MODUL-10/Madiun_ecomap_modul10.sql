-- Membuat Database
CREATE DATABASE IF NOT EXISTS madiun_ecomap;
USE madiun_ecomap;

-- Membuat 3 tabel
-- 1. Tabel Utama: users (Indek/Master Pengguna & Mitra)
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin','mitra','masyarakat') NOT NULL DEFAULT 'masyarakat',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Tabel Master Pendukung: kategori_lokasi
CREATE TABLE kategori_lokasi (
  kategori_id INT AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(100) NOT NULL UNIQUE,
  deskripsi TEXT
) ENGINE=InnoDB;

-- 3. Tabel Transaksi/Relasi: lokasi (Memiliki 2 Foreign Key ke users dan kategori_lokasi)
CREATE TABLE lokasi (
  lokasi_id INT AUTO_INCREMENT PRIMARY KEY,
  kategori_id INT NOT NULL,
  mitra_id INT NOT NULL,
  nama_tempat VARCHAR(150) NOT NULL,
  alamat TEXT NOT NULL,
  jam_operasional VARCHAR(100) DEFAULT NULL,
  status_validasi ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  
  -- Definisi Foreign Key & Aturan Integritas Referensial
  CONSTRAINT fk_lokasi_kategori FOREIGN KEY (kategori_id) 
    REFERENCES kategori_lokasi(kategori_id) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_lokasi_mitra FOREIGN KEY (mitra_id) 
    REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;


-- Dummy Data
-- Isi data users
INSERT INTO users (user_id, name, email, password, role) VALUES
(1, 'Admin Utama', 'admin@ecomap.madiun.go.id', 'hashed_pass', 'admin'),
(2, 'Bank Sampah Sekar Asri', 'mitra1@sekarasri.org', 'hashed_pass', 'mitra'),
(3, 'Toko Baju Barokah', 'BajuBarokah@brkh.org', 'brkh123777', 'mitra');

-- Isi data kategori_lokasi
INSERT INTO kategori_lokasi (kategori_id, nama_kategori, deskripsi) VALUES
(1, 'Bank Sampah', 'Fasilitas pemilahan dan daur ulang sampah warga'),
(2, 'Thrift Shop', 'Pusat pakaian bekas berkualitas');

-- Isi data lokasi (memerlukan user_id=2 dan kategori_id=1 yang sudah ada)
INSERT INTO lokasi (lokasi_id, kategori_id, mitra_id, nama_tempat, alamat, jam_operasional, status_validasi) VALUES
(1, 1, 2, 'Bank Sampah Sekar Asri Winongo', 'Jl. Ring Road Barat No. 12, Madiun', '08:00 - 15:00 WIB', 'approved'),
(2, 2, 3, 'Toko Baju Barokah', 'Jl. Manalagi No 67, Kab. Madiun', '08.30 - 16.00 WIB', 'approved'); 