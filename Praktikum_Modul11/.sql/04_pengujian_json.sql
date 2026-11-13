-- READ (membaca atribut JSON)
SELECT 
    l.nama_tempat,
    k.nama_kategori,
    JSON_EXTRACT(
        l.detail_json,
        '$.kapasitas_kg'
    ) AS kapasitas
FROM lokasi l
JOIN kategori_lokasi k ON l.kategori_id = k.kategori_id;

-- =============================================

-- UPDATE (memperbarui atribut JSON)
UPDATE lokasi 
SET detail_json = JSON_SET(detail_json, '$.kapasitas_kg', 750) 
WHERE lokasi_id = 1;
-- melihat hasil update
SELECT nama_tempat, JSON_EXTRACT(detail_json, '$.kapasitas_kg') AS kapasitas_baru 
FROM lokasi 
WHERE lokasi_id = 1;

-- =============================================

-- CREATE (menambahkan atribut baru ke JSON)
UPDATE lokasi 
SET detail_json = JSON_SET(detail_json, '$.metode_pembayaran', 'QRIS & Cash') 
WHERE lokasi_id = 2;
-- melihat hasil create
SELECT nama_tempat, JSON_EXTRACT(detail_json, '$.metode_pembayaran') AS metode_pembayaran 
FROM lokasi 
WHERE lokasi_id = 2;

-- =============================================

-- DELETE (menghapus atribut dari JSON)
UPDATE lokasi 
SET detail_json = JSON_REMOVE(detail_json, '$.kontak') 
WHERE lokasi_id = 1;
-- melihat hasil delete
SELECT nama_tempat, JSON_EXTRACT(detail_json, '$.kontak') AS kontak_setelah_dihapus 
FROM lokasi 
WHERE lokasi_id = 1;

-- ============================================

--Bukti Pencarian Berdasarkan JSON
SELECT nama_tempat, alamat 
FROM lokasi 
WHERE JSON_UNQUOTE(JSON_EXTRACT(detail_json, '$.status_buka')) = 'true';
