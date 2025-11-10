import 'package:course_learning/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<IconData> _icons = const [
    Icons.home_outlined,
    Icons.grid_view,
    Icons.chat_bubble_outline,
    Icons.book_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.transparentColor,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _icons.asMap().entries.map((entry) {
          int index = entry.key;
          IconData icon = entry.value;

          // Panggil widget kustom untuk setiap item
          return _buildNavItem(icon, index);
        }).toList(),
      ),
    );
  }

  // Widget Kustom untuk Setiap Item Navigasi
  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected =
        index == selectedIndex; // Menggunakan selectedIndex dari parent
    final Color activeColor = const Color(0xFF673AB7);
    final Color inactiveColor = Colors.grey.shade500;

    return GestureDetector(
      onTap: () => onTap(index), // Panggil callback onTap
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              // Efek highlight penuh
              color: isSelected ? activeColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              // Warna ikon berubah menjadi putih jika aktif
              color: isSelected ? Colors.white : inactiveColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
