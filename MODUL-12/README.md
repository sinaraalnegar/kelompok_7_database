# Praktikum Modul 12 — Migrasi Basis Data, Optimisasi Query, dan Pengendalian Akses (DCL/RBAC) pada Neo4j

Repositori ini berisi skrip Cypher, diagram *query tree*, serta dokumentasi hasil praktikum migrasi data dari model relasional ke **Graph Database (Neo4j)**, analisis *query execution plan* (`PROFILE`), pengujian keamanan berbasis peran (*Role-Based Access Control* / RBAC), dan rancangan migrasi proyek **Madiun ECO-MAPS**.

---

## Informasi Lingkungan DBMS
- **Paradigma DBMS:** Graph Database (Property Graph)
- **DBMS & Versi:** Neo4j Desktop (`2.3.1`) — Neo4j Kernel `2026.10.2` (Enterprise Edition)
- **Bahasa Query:** Cypher Query Language (Cypher 5 / Cypher 25)
- **Database Uji:** `transport` & `madiunecomaps`

---

## Struktur Direktori

```text
praktikum_modul12/
├── scripts/
│   ├── 01_migrasi_data_latihan.cypher      # Pengecekan versi DBMS, migrasi node & relasi (:Trip, :Route, [:ON_ROUTE])
│   ├── 02_query_transportasi.cypher        # Query seleksi, traversal, proyeksi, dan inspeksi rencana eksekusi (PROFILE)
│   ├── 03_pengujian_dcl.cypher             # Pembuatan role/user, GRANT, REVOKE, dan pengujian hak akses (Least Privilege)
│   └── 04_rancangan_migrasi_pjbl.cypher    # Pembuatan Range Index dan query traversal proyek Madiun ECO-MAPS
├── dokumentasi/
│   ├── analisis_query_cost.pdf             # Analisis perbandingan rencana eksekusi & estimasi page read
│   └── laporan_modul12.pdf                 # Laporan lengkap Tahap 1–5 beserta bukti tangkapan layar
├── diagram/
│   └── query_tree.png                      # Diagram Query Tree (Rencana Standar vs Selection Pushdown)
└── README.md
