import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  Widget buildBulletItem(IconData icon, String title, List<String> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.orange, size: 24),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ...details.map(
          (line) => Padding(
            padding: const EdgeInsets.only(left: 34),
            child: Text(
              line,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Page'),
        backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.white.withOpacity(0.95),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Panduan Pemakaian Aplikasi",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildBulletItem(
                    Icons.login,
                    "Masuk dengan Akun Terdaftar",
                    [
                      "Silakan isi username dan password yang telah terdaftar.",
                      "Setelah berhasil login, Anda akan diarahkan ke beranda utama."
                    ],
                  ),
                  buildBulletItem(
                    Icons.menu,
                    "Jelajahi Fitur di Menu Utama",
                    [
                      "Stopwatch : Gunakan untuk menghitung waktu maju atau mundur.",
                      "Jenis Bilangan : Analisis angka dan kategorisasinya.",
                      "Tracking LBS : Lihat lokasi Anda secara langsung.",
                      "Konversi Waktu : Konversikan tahun menjadi jam, menit, dan detik.",
                      "Rekomendasi Situs : Tambahkan situs favorit ke daftar Anda."
                    ],
                  ),
                  buildBulletItem(
                    Icons.navigation,
                    "Mengakses Halaman Lain",
                    [
                      "Navigasi mudah dengan menu di bagian bawah layar.",
                      "Halaman 'Anggota' berisi daftar anggota kelompok."
                    ],
                  ),
                  buildBulletItem(
                    Icons.logout,
                    "Keluar dari Aplikasi",
                    [
                      "Tekan ikon keluar di bagian pojok kanan atas pada menu utama untuk mengakhiri sesi penggunaan."
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "⚠️ Catatan Penting:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Pastikan Anda terhubung ke internet agar fitur berbasis lokasi dapat bekerja dengan optimal.",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
