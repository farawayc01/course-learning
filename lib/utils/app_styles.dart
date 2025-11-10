import 'package:course_learning/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static Color getAdaptiveTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return isDark ? AppColors.lightText : AppColors.darkText;
  }

  static TextStyle headlineStyle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static TextStyle bodyTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
