# Praktikum Basis Data — Modul 13: Polyglot Persistence (MySQL ke Neo4j)

Repository dokumentasi dan implementasi migrasi selektif basis data pada proyek **Madiun ECO-MAPS (`madiun_ecomaps_v2`)** — *Sistem Informasi Geografis & Direktori Zero Waste Wilayah Kota Madiun* — dari **MySQL** ke **Neo4j (Graph Database)**.

## Anggota Kelompok 7
1. **Dewi Wasilatul Khoiriyah** — (264311039)
2. **Roefando A. R.** — (264311049)
3. **M. Mahlayan** — (264311057)
4. **Sinara Endrya A.** — (264311059)

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

