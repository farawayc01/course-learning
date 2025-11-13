import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

Widget cardCategory(
  String ctgName,
  String qtyCourse, {
  double? margin,
  VoidCallback? onTap,
  double? height,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: margin != null ? EdgeInsets.only(right: margin) : null,
      height: height ?? 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.slateGray,
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Stack(
          children: [
            const Positioned(
              left: -10,
              top: -10,
              child: SizedBox(
                width: 40,
                height: 90,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFB6C1), Color(0xFFFFDAB9)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: -30,
              bottom: -30,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: -20,
              bottom: -10,
              child: Transform.rotate(
                angle: 0.5,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade700.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ctgName,
                    style: AppStyles.bodyTextStyle.copyWith(
                      fontSize: 18,
                      color: AppColors.lightText,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "$qtyCourse courses",
                    style: AppStyles.bodyTextStyle.copyWith(
                      fontSize: 14,
                      color: AppColors.lightText,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
