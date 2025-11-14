import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

Widget buttonCustom(
  String title, {
  Color? color,
  VoidCallback? onTap,
  Color? titleColor,
  EdgeInsetsGeometry? padding,
  double? radius,
}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,
        padding: padding ?? EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10), // Sesuaikan radius
        ),
      ),
      child: Text(
        title,
        style: AppStyles.bodyTextStyle.copyWith(
          color: titleColor ?? AppColors.lightText,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
