import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ParticipantActivityRow extends StatelessWidget {
  final List<String> avatarPaths;
  final String participantsCount;
  final String duration;
  final Color foregroundColor; // Warna teks dan ikon

  const ParticipantActivityRow({
    super.key,
    required this.avatarPaths,
    required this.participantsCount,
    required this.duration,
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // BAGIAN 1: AVATAR STACK (Peserta)
        _buildAvatarStack(),
        const SizedBox(width: 8),

        // Garis Pembatas Vertikal (Opsional, gunakan jika diperlukan pemisah tajam)
        Container(
          height: 20,
          width: 1,
          color: foregroundColor.withOpacity(0.5),
        ),
        const SizedBox(width: 10),

        // BAGIAN 2: DURASI (Jam)
        _buildDurationTime(),
      ],
    );
  }

  // ----------------------------------------
  // A. Widget untuk Avatar Stack (Overlapping Effect)
  // ----------------------------------------
  Widget _buildAvatarStack() {
    // Ukuran default avatar dan margin overlap
    const double avatarSize = 24;
    const double overlap = 10; // Jarak tumpang tindih

    return SizedBox(
      height: avatarSize,
      // Lebar total: (Jumlah avatar * size) - (Jumlah overlap * jarak)
      width:
          (avatarPaths.length * avatarSize) -
          (avatarPaths.length - 1) * overlap +
          30,
      child: Stack(
        // Map data avatar untuk membuat Circular Avatar
        children:
            avatarPaths.asMap().entries.map((entry) {
                int index = entry.key;
                String path = entry.value;

                return Positioned(
                  left:
                      index *
                      (avatarSize - overlap), // Posisi X berdasarkan indeks
                  child: CircleAvatar(
                    radius: avatarSize / 2,
                    backgroundColor: Colors.white, // Border putih
                    child: CircleAvatar(
                      radius: (avatarSize / 2) - 1, // Sedikit lebih kecil
                      backgroundImage: AssetImage(path),
                    ),
                  ),
                );
              }).toList()
              // Tambahkan label 1K+ di paling depan/kanan
              ..add(
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: avatarSize / 2,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Text(
                        participantsCount,
                        style: AppStyles.bodyTextStyle.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  // ----------------------------------------
  // B. Widget untuk Ikon Waktu & Durasi
  // ----------------------------------------
  Widget _buildDurationTime() {
    return Row(
      children: [
        // Ikon Jam (di dalam Container bundar putih seperti di desain)
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: foregroundColor, // Warna putih
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.access_time_filled,
            color: const Color(0xFF673AB7), // Warna ungu tua
            size: 14,
          ),
        ),
        const SizedBox(width: 8),

        // Teks Durasi
        Text(
          duration,
          style: TextStyle(
            color: foregroundColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
