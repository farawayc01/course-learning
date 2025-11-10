import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  bool _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    // Tambahkan listener saat controller diinisialisasi
    widget.controller.addListener(_checkTextStatus);
    // Cek status awal (penting jika field diisi dari awal)
    _isTextEmpty = widget.controller.text.isEmpty;
  }

  void _checkTextStatus() {
    if (_isTextEmpty != widget.controller.text.isEmpty) {
      setState(() {
        _isTextEmpty = widget.controller.text.isEmpty;
      });
    }
  }

  @override
  void dispose() {
    // Hapus listener saat widget dibuang
    widget.controller.removeListener(_checkTextStatus);
    // Jangan dispose controller di sini; itu tanggung jawab parent widget!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withValues(alpha: 0.9),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText && widget.isPassword,
        decoration: InputDecoration(
          labelText: _isTextEmpty ? null : widget.label,
          hintText: _isTextEmpty ? widget.label : null,
          hintStyle: AppStyles.bodyTextStyle.copyWith(
            color: AppColors.greyColor,
          ),
          labelStyle: AppStyles.bodyTextStyle.copyWith(
            color: AppColors.greyColor,
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    // KUNCI 3: Toggle state saat tombol diklik
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    // Mengganti ikon berdasarkan state _obscureText
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.shade600,
                  ),
                )
              : null, // Jika bukan password, ikon dihilangkan
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 12,
          ),
          isDense: true,
        ),
        style: AppStyles.bodyTextStyle,
      ),
    );
  }
}
