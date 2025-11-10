import 'package:flutter/material.dart';

class AppColors {
  // Warna Primer (Aksen, tombol, dll.)
  static const Color primaryColor = Color(0xFF6231AB); // Biru
  static Color customColorPrimary = Color.fromARGB(
    255,
    191,
    156,
    245,
  ).withValues(alpha: 0.3); // Biru

  // Warna Sekunder (Aksen kedua)
  static const Color accentColor = Color(0xFFA080C7); // Oranye

  static const Color transparentColor = Colors.transparent;
  static const Color likeColor = Colors.red;

  // Warna Netral (Teks, background dasar)
  static const Color darkText = Color(0xFF1A1A1A);
  static const Color lightText = Colors.white;

  // Warna Khusus Kartu (Contoh dari desain Anda)
  // Ini adalah warna kustom yang TIDAK bergantung pada tema
  static const Color mustardSoft = Color(0xFFEBCF9E);
  static const Color slateGray = Color(0xFF86A0B8);
  static const Color greyColor = Colors.grey;

  // Warna Netral (Background Light Mode)
  static const Color lightBackground = Color(0xFFF5F5F5);

  // Warna Netral (Background Dark Mode)
  static const Color darkBackground = Color(0xFF1C1C1E);
  static const Color darkSurface = Color(0xFF2C2C2E);
}
