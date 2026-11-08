-- Praktik Operasi CRUD

-- Create
INSERT INTO kategori_lokasi (nama_kategori, deskripsi) VALUES ('Toko Tanaman Hijau', 'Pusat jual-beli tanaman hijau');

-- Read
SELECT l.nama_tempat, k.nama_kategori, u.name AS nama_mitra 
FROM lokasi l
JOIN kategori_lokasi k ON l.kategori_id = k.kategori_id
JOIN users u ON l.mitra_id = u.user_id;

-- Update
UPDATE lokasi SET jam_operasional = '08:00 - 16:00 WIB' WHERE lokasi_id = 1;

-- Delete
DELETE FROM lokasi WHERE lokasi_id = 2;



-- Pengujian integritas
DELETE FROM kategori_lokasi
WHERE kategori_id = 1;
-- Tidak bisa dihapus karena datanya masih dipakai oleh tabel lokasi. MySQL akan menolak (error) secara otomatis untuk mencegah munculnya data yatim (orphan data).

INSERT INTO lokasi (lokasi_id, kategori_id, mitra_id, nama_tempat, alamat, jam_operasional, status_validasi)
VALUES (2, 2, 67, 'toko baju sejahtera', 'desa ngawi', '8.00-12.00', 'approved')
-- Gagal karena mitra dengan id 67 tidak ada.



-- Pengujian COMMIT
-- Mulai transaksi
START TRANSACTION;

-- 1. Tambah data user/mitra baru
INSERT INTO users (user_id, name, email, password, role) 
VALUES (10, 'Eco Waste Madiun', 'ecowaste@mail.com', 'hashed_pass', 'mitra');

-- 2. Tambah data lokasi yang terikat pada mitra tersebut
INSERT INTO lokasi (lokasi_id, kategori_id, mitra_id, nama_tempat, alamat, status_validasi) 
VALUES (10, 1, 10, 'Depo Pengolahan Sampah Madiun', 'Jl. Merbabu No. 5', 'pending');

-- Simpan perubahan secara permanen ke database
COMMIT;

-- Pengujian ROLLBACK
-- Mulai transaksi
START TRANSACTION;

-- Tambah data uji coba yang salah atau batal
INSERT INTO users (user_id, name, email, password, role) 
VALUES (11, 'Mitra Batal', 'batal@mail.com', 'hashed_pass', 'mitra');

-- Batalkan seluruh operasi sejak perintah START TRANSACTION
ROLLBACK;

-- Pengujian Index
EXPLAIN SELECT * FROM lokasi WHERE kategori_id = 1;
CREATE INDEX idx_kategori_lokasi ON lokasi(kategori_id);

-- Pengujian Setelah membuat Index
EXPLAIN SELECT * FROM lokasi WHERE kategori_id = 1;