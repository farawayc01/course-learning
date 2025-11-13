// Fungsi helper reusable untuk menampilkan SnackBar
import 'package:flutter/material.dart';

void showCustomSnackbar(
  BuildContext context, {
  required String message,
  required bool isSuccess,
  int durationSeconds = 3,
}) {
  // Tentukan warna berdasarkan status (sukses atau error/gagal)
  final Color backgroundColor = isSuccess
      ? Colors.green.shade600
      : Colors.red.shade600;

  // Pastikan ScaffoldMessenger tersedia (penting untuk routing)
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: durationSeconds),

      // Memberikan jarak dari bawah layar agar terlihat bersih
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10), // Memberi margin agar sudut membulat
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}

// // Fungsi helper reusable untuk menampilkan SnackBar
// import 'package:flutter/material.dart';

// void showCustomSnackbar(
//   BuildContext context, {
//   required String message,
//   required bool isSuccess,
//   int durationSeconds = 3,
// }) {
//   // Tentukan warna berdasarkan status (sukses atau error/gagal)
//   final Color backgroundColor = isSuccess
//       ? Colors.green.shade600
//       : Colors.red.shade600;

//   // Ambil tinggi layar (MediaQuery)
//   final screenHeight = MediaQuery.of(context).size.height;
//   final double topMargin = 50.0;
//   final double pushUpDistance = screenHeight - topMargin - 100;

//   // Pastikan ScaffoldMessenger tersedia (penting untuk routing)
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(
//         message,
//         style: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       backgroundColor: backgroundColor,
//       duration: Duration(seconds: durationSeconds),

//       // Memberikan jarak dari bawah layar agar terlihat bersih
//       behavior: SnackBarBehavior.floating,
//       margin: EdgeInsets.fromLTRB(10, topMargin, 10, pushUpDistance),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     ),
//   );
// }
