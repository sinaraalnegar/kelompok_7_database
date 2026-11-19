// =========================================================================
// FILE: 04_rancangan_migrasi_pjbl.cypher
// PROYEK: Madiun ECO-MAPS (Direktori Zero Waste Wilayah Madiun)
// =========================================================================

// -------------------------------------------------------------------------
// CONSTRAINT & INDEXING (OPTIMISASI QUERY)
// -------------------------------------------------------------------------
CREATE CONSTRAINT uniq_lokasi_id IF NOT EXISTS
FOR (l:Lokasi) REQUIRE l.lokasi_id IS UNIQUE;

CREATE CONSTRAINT uniq_kategori_id IF NOT EXISTS
FOR (k:KategoriLokasi) REQUIRE k.kategori_id IS UNIQUE;

CREATE INDEX idx_kategori_nama IF NOT EXISTS
FOR (k:KategoriLokasi) ON (k.nama_kategori);

CREATE INDEX idx_lokasi_status IF NOT EXISTS
FOR (l:Lokasi) ON (l.status_validasi);

// -------------------------------------------------------------------------
// BAGIAN B: RANCANGAN QUERY TRAVERSAL FITUR UTAMA
// Kebutuhan: Daftar titik lokasi zero waste terverifikasi per kategori
// -------------------------------------------------------------------------
MATCH (l:Lokasi)-[:TERMASUK_KATEGORI]->(k:KategoriLokasi {nama_kategori: 'Bank Sampah'})
WHERE l.status_validasi = 'terverifikasi'
RETURN l.lokasi_id AS lokasi_id,
       l.nama_tempat AS nama_tempat,
       l.alamat AS alamat,
       l.jam_operasional AS jam_operasional,
       l.latitude AS latitude,
       l.longitude AS longitude,
       k.nama_kategori AS nama_kategori
ORDER BY l.nama_tempat ASC;

// -------------------------------------------------------------------------
// BAGIAN C: RANCANGAN KONTROL AKSES RBAC (DIJALANKAN DI DATABASE: system)
// Catatan: Kredensial menggunakan placeholder sesuai kebijakan keamanan
// -------------------------------------------------------------------------

// 1. Role Masyarakat / Pengunjung (Read-Only - Least Privilege)
CREATE ROLE viewer_role IF NOT EXISTS;
CREATE USER ecomaps_viewer IF NOT EXISTS SET PASSWORD 'GantiDenganPasswordKuat!' CHANGE NOT REQUIRED;
GRANT ROLE viewer_role TO ecomaps_viewer;
GRANT ACCESS ON DATABASE madiunecomaps TO viewer_role;
GRANT TRAVERSE, READ ON GRAPH madiunecomaps TO viewer_role;

// 2. Role Mitra Pengelola Lokasi (Baca + Tambah/Ubah Node & Relasi)
CREATE ROLE contributor_role IF NOT EXISTS;
CREATE USER ecomaps_contributor IF NOT EXISTS SET PASSWORD 'GantiDenganPasswordKuat!' CHANGE NOT REQUIRED;
GRANT ROLE contributor_role TO ecomaps_contributor;
GRANT ACCESS ON DATABASE madiunecomaps TO contributor_role;
GRANT TRAVERSE, READ ON GRAPH madiunecomaps TO contributor_role;
GRANT CREATE ON GRAPH madiunecomaps TO contributor_role;
GRANT SET PROPERTY {*} ON GRAPH madiunecomaps TO contributor_role;

// 3. Pemeriksaan konfigurasi hak akses
SHOW ROLES;
