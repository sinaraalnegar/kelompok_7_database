# Madiun Eco-Map (Modul 11: Pemodelan Data Berorientasi Objek & Relasional)

Repositori ini dibuat untuk memenuhi penugasan praktikum mata kuliah sistem basis data, mengimplementasikan konsep pemodelan data berorientasi objek (*Object-Oriented Data Modeling*), pewarisan (*inheritance*), serta pemetaan data JSON pada basis data relasional MySQL menggunakan studi kasus **Madiun Eco-Map**.

---

## Anggota Kelompok
- **Nama Anggota 1**: Dewi Wasilatul K. (1B/ 264311039)
- **Nama Anggota 2**: M. Mahlayan (1B/ 264311049)
- **Nama Anggota 3**: Roefando Adji Ramadhan (1B/264311057)
- **Nama Anggota 4**: Sinara Endrya A. (1B/ 264311059)
- **Program Studi**: Teknologi Rekayasa Perangkat Lunak (TRPL) / Politeknik Negeri Madiun

---

## Struktur Berkas Proyek (*File Manifest*)
Berikut adalah daftar berkas laporan dan skrip yang dikumpulkan dalam repositori ini:
- `modul11.sql` : Skrip SQL pembuatan tabel, relasi, dan pengujian kueri data objek/JSON.
- `perbandingan_dbms.pdf` : Analisis dan tabel perbandingan DBMS (MySQL, PostgreSQL, MongoDB).
- `analisis_objek.pdf` : Laporan analisis basis data berorientasi objek.
- `lingkup_penerapan.pdf` : Analisis penerapan basis data pada studi kasus organisasi.
- `pemodelan_objek.png` : Berkas gambar diagram kelas (*Class Diagram* & *Inheritance*).
- `worksheet_modul11.pdf` : Lembar kerja praktikum lengkap.

---

## Arsitektur & Pemodelan Data
Sistem ini menggunakan basis data **MySQL** dengan pendekatan hibrida:
1. **Relational Table (3NF)**: Digunakan untuk tabel master yang membutuhkan integritas ketat seperti `users` dan `kategori_lokasi`.
2. **Object-JSON Mapping**: Digunakan pada tabel `lokasi` untuk menampung atribut spesifik dari kelas turunan (*Bank Sampah*, *Thrift Shop*, *ZeroWaste Store*) secara dinamis menggunakan tipe data `JSON`.

---
