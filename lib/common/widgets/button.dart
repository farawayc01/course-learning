import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

Widget buttonCustom(
  String title,
  VoidCallback onTap, {
  Color? color,
  Color? titleColor,
  EdgeInsetsGeometry? padding,
}) {
  return Container(
    padding: padding ?? EdgeInsets.all(4),
    width: double.infinity,
    decoration: BoxDecoration(
      color: color ?? AppColors.primaryColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8),
    ),
    child: IconButton(
      onPressed: onTap,
      icon: Text(
        title,
        style: AppStyles.bodyTextStyle.copyWith(
          color: titleColor ?? AppColors.lightText,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
