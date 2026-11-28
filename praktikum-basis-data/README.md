# Praktikum Basis Data — Modul 13: Polyglot Persistence (MySQL ke Neo4j)

Repository dokumentasi dan implementasi migrasi selektif basis data pada proyek **Madiun ECO-MAPS (`madiun_ecomaps_v2`)** — *Sistem Informasi Geografis & Direktori Zero Waste Wilayah Kota Madiun* — dari **MySQL** ke **Neo4j (Graph Database)**.

## Anggota Kelompok 7
1. **Dewi Wasilatul Khoiriyah** — Analisis Keputusan Migrasi, Pemetaan Struktur Data & Finalisasi Repository
2. **Roefando A. R.** — Ekstraksi, Transformasi, Loading (ETL CSV ke Neo4j) & Validasi Hasil Migrasi
3. **M. Mahlayan** — Pengujian Operasi CRUD & Workload Query pada Neo4j
4. **Sinara Endrya A.** — Analisis Trade-Off & Evaluasi

---

## Ringkasan Migrasi Data

* **DBMS Sumber:** MySQL (`madiun_ecomaps_v2`)
* **DBMS Tujuan:** Neo4j (Graph Database — Neo4j Desktop 2.3.1 / Kernel 2026.10.2)
* **Data yang Dimigrasikan (3 Tabel Terpilih — 14 Baris):**
  * `users` (5 baris) $\rightarrow$ Node `:User`
  * `kategori_lokasi` (4 baris) $\rightarrow$ Node `:KategoriLokasi`
  * `lokasi` (5 baris) $\rightarrow$ Node `:Lokasi`
* **Relationship Graf yang Terbentuk (14 Relasi):**
  * `(:User)-[:MENGELOLA]->(:Lokasi)` (5 relasi)
  * `(:Lokasi)-[:TERMASUK_KATEGORI]->(:KategoriLokasi)` (5 relasi)
  * `(:User)-[:MEMVERIFIKASI]->(:Lokasi)` (4 relasi)
* **Data yang Tetap di MySQL:** Tabel operasional dan transaksional (`jenis_sampah`, `tarif_lokasi`, `promo_eco`, `ulasan_lokasi`, `foto_lokasi`, `favorit_lokasi`, `laporan_lokasi`, `riwayat_verifikasi`, `konten_edukasi`, `sessions`) serta kolom kredensial (`password`, `remember_token`).

---

## Struktur Repository

```text
praktikum-basis-data/
├── mysql/
│   └── source-schema-and-data/
│       └── schema_and_seed_sumber.sql
├── migration/
│   ├── extraction/
│   │   ├── extract_from_mysql.sql
│   │   ├── users.csv
│   │   ├── kategori_lokasi.csv
│   │   └── lokasi.csv
│   ├── transformation/
│   │   └── transformation_rules.md
│   └── loading/
│       └── load_to_neo4j.cypher
├── target-dbms/
│   ├── structure/
│   │   └── constraints.cypher
│   ├── crud/
│   │   └── crud_operations.cypher
│   └── workload-query/
│       └── workload_queries.cypher
├── evidence/
│   └── screenshots/
└── README.md
```

---

## Penjelasan Direktori & Alur Eksekusi

1. **`mysql/source-schema-and-data/`**
   Berisi skema DDL dan data awal database sumber `madiun_ecomaps_v2` pada MySQL sebelum dilakukan migrasi selektif.
2. **`migration/extraction/`**
   Berisi kueri SQL pengambilan data terpilih (`extract_from_mysql.sql`) serta hasil ekspor mentah dalam format CSV (`users.csv`, `kategori_lokasi.csv`, `lokasi.csv`).
3. **`migration/transformation/`**
   Berisi aturan penyesuaian struktur dan tipe data (`transformation_rules.md`), mencakup penghapusan kolom sensitif/NULL serta konversi *Foreign Key* menjadi relasi graf.
4. **`migration/loading/`**
   Berisi skrip Cypher (`load_to_neo4j.cypher`) untuk memuat file CSV ke Neo4j menggunakan `LOAD CSV WITH HEADERS` dan `MERGE`.
5. **`target-dbms/`**
   * `structure/constraints.cypher` — Pembuatan *Unique Constraint* pada properti `id` untuk `:User`, `:KategoriLokasi`, dan `:Lokasi`.
   * `crud/crud_operations.cypher` — Pengujian operasi dasar *Create*, *Read*, *Update*, dan *Delete* di Neo4j.
   * `workload-query/workload_queries.cypher` — Kueri validasi jumlah node/relasi serta penelusuran graf direktori titik *zero-waste* aktif.
6. **`evidence/screenshots/`**
   Berisi dokumentasi tangkapan layar hasil migrasi, validasi jumlah node/relasi, pengujian CRUD, dan visualisasi graf pada Neo4j Browser.
