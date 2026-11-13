-- 1. Tabel Users (Pengguna & Mitra)
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin','mitra','masyarakat') NOT NULL DEFAULT 'masyarakat',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabel Kategori Lokasi
CREATE TABLE kategori_lokasi (
  kategori_id INT AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(100) NOT NULL UNIQUE,
  deskripsi TEXT
);

-- 3. Tabel Lokasi Ramah Lingkungan
CREATE TABLE lokasi (
  lokasi_id INT AUTO_INCREMENT PRIMARY KEY,
  kategori_id INT NOT NULL,
  mitra_id INT NOT NULL,
  nama_tempat VARCHAR(150) NOT NULL,
  alamat TEXT NOT NULL,
  latitude DECIMAL(10,8) NOT NULL,
  longitude DECIMAL(11,8) NOT NULL,
  jam_operasional VARCHAR(100) DEFAULT NULL,
  deskripsi TEXT,
  status_validasi ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  detail_json JSON DEFAULT NULL, -- Kolom untuk modul JSON
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (kategori_id) REFERENCES kategori_lokasi(kategori_id) ON UPDATE CASCADE,
  FOREIGN KEY (mitra_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
