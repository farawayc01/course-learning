import 'package:course_learning/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged; // Callback saat teks berubah
  final Function(String)? onSubmitted; // Callback saat menekan enter
  final VoidCallback? onClear; // Callback saat ikon clear ditekan
  final bool showClearButton; // Opsi untuk menampilkan tombol clear

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.hintText = 'Search Courses Here...', // Default hint text
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.showClearButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.customColorPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
            suffixIcon: showClearButton && controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey.shade600),
                    onPressed: () {
                      controller.clear();
                      if (onClear != null) {
                        onClear!();
                      }
                    },
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 12,
            ),
            border: InputBorder.none,
            isDense: true,
          ),
          style: const TextStyle(color: Colors.black87, fontSize: 16),
          textInputAction: TextInputAction.search,
        ),
      ),
    );
  }
}
