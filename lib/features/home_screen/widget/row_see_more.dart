import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

Widget rowSeeMore(String title, VoidCallback onTapSeeMore) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: AppStyles.bodyTextStyle.copyWith(
          fontSize: 18,
          color: AppColors.darkText,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 2,
        textAlign: TextAlign.left,
      ),
      GestureDetector(
        onTap: onTapSeeMore,
        child: Text(
          "See More",
          style: AppStyles.bodyTextStyle.copyWith(
            fontSize: 14,
            color: AppColors.primaryColor,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
          textAlign: TextAlign.left,
        ),
      ),
    ],
  );
}
