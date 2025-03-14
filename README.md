# 📰 News App

## 📌 Overview

News App adalah aplikasi mobile yang dikembangkan untuk memenuhi persyaratan technical test. Aplikasi ini memungkinkan pengguna untuk melihat berbagai berita atau artikel terbaru dari berbagai sumber.

### ✨ Fitur Utama
- **Daftar Berita**: Menampilkan list berita terkini.
- **Pencarian Berita**: Memungkinkan pengguna mencari berita berdasarkan kata kunci.
- **Detail Berita**: Melihat isi berita secara lebih rinci dalam aplikasi.
- **Sumber Berita Asli**: Navigasi langsung ke sumber berita resmi.

Aplikasi ini dikembangkan menggunakan **Flutter** dengan pendekatan **Clean Architecture** serta menggunakan **Bloc** sebagai state management untuk memastikan modularitas dan skalabilitas kode.

---

## ⚙️ Instruksi Setup

### 🔧 Prasyarat
Sebelum memulai, pastikan Anda telah menginstal:
- **Flutter SDK versi 3.27** ([Download Flutter](https://flutter.dev/docs/get-started/install))
- **Android Studio atau VS Code** (sebagai IDE pilihan)
- **API Key dari [NewsAPI](https://newsapi.org/)**

### 🚀 Langkah Instalasi
1. **Clone Repository**
   ```bash
   git clone https://github.com/FatwahFir/sru_test.git
   cd sru_test
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Code dengan Build Runner**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Setup API Key**
   - Buat file `.env` di root proyek.
   - Tambahkan API Key dari NewsAPI di dalamnya:
     ```
     API_KEY=your_api_key_here
     ```
   - Jika file `.env` tidak ditemukan, Anda dapat menggunakan file contoh `.env.example` dengan cara mengganti namanya menjadi `.env`.

5. **Jalankan Aplikasi**
   ```bash
   flutter run
   ```
