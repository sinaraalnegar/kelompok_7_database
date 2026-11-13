-- ==========================================
-- DATA DUMMY (Sesuai Syarat Minimal 3 Kategori)
-- ==========================================

-- Data Users
INSERT INTO users (user_id, name, email, password, role) VALUES
(1, 'Admin Utama EcoMap', 'admin@ecomap.madiun.go.id', '$2y$10$e8R4a...', 'admin'),
(2, 'Bank Sampah Sekar Asri', 'mitra1@sekarasri.org', '$2y$10$f9T1z...', 'mitra'),
(3, 'Madiun Thrift Center', 'mitra2@thriftmadiun.com', '$2y$10$g0U2a...', 'mitra'),
(4, 'Eco Store Madiun', 'mitra3@ecostore.com', '$2y$10$h1V3b...', 'mitra');

-- Data Kategori Lokasi (3 Kategori Berbeda)
INSERT INTO kategori_lokasi (kategori_id, nama_kategori, deskripsi) VALUES
(1, 'Bank Sampah', 'Fasilitas pemilahan dan daur ulang sampah warga'),
(2, 'Thrift Shop', 'Toko pakaian bekas berkualitas untuk mendukung pemakaian ulang'),
(3, 'Usaha Zero Waste', 'Toko bahan pokok tanpa kemasan plastik sekali pakai');

-- Data Lokasi (3 Tempat dengan Atribut JSON Masing-masing)
INSERT INTO lokasi (lokasi_id, kategori_id, mitra_id, nama_tempat, alamat, latitude, longitude, jam_operasional, deskripsi, status_validasi, detail_json) VALUES
(1, 1, 2, 'Bank Sampah Sekar Asri Winongo', 'Jl. Ring Road Barat No. 12, Winongo, Madiun', -7.62810000, 111.51230000, '08:00 - 15:00 WIB', 'Pusat daur ulang sampah.', 'approved', '{
    "kategori_sampah": ["Organik", "Anorganik", "Plastik"],
    "status_buka": true,
    "kapasitas_kg": 500,
    "kontak": "08123456789"
}'),
(2, 2, 3, 'Madiun Thrift Store Centre', 'Jl. Pahlawan No. 45, Kartoharjo, Madiun', -7.62540000, 111.52340000, '10:00 - 21:00 WIB', 'Pusat pakaian bekas.', 'approved', '{
    "kategori_pakaian": ["Pakaian Bekas", "Aksesoris"],
    "status_buka": true,
    "kapasitas_kg": 200,
    "kontak": "08987654321"
}'),
(3, 3, 4, 'Eco Zero Waste Store Madiun', 'Jl. Panglima Sudirman No. 10, Madiun', -7.62910000, 111.52030000, '09:00 - 20:00 WIB', 'Toko tanpa kemasan plastik.', 'approved', '{
    "kategori_produk": ["Beras Curah", "Minyak Curah", "Sabun Refill"],
    "status_buka": true,
    "bebas_plastik": true,
    "kontak": "08567891234"
}');
