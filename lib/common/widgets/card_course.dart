import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

Widget cardCourse(
  String imageCourse,
  String courseName,
  String mentorPict,
  String mentorName,
  double courseStars,
  bool isLiked, {
  VoidCallback? onTap,
  bool? isShimmer,
}) {
  return Container(
    width: 200,
    // height: 130,
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                child: Image.asset(imageCourse),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? AppColors.likeColor : AppColors.lightText,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Expanded(
          child: Text(
            courseName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.bodyTextStyle,
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: [
            Container(
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.mustardSoft,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                child: Image.asset(mentorPict),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                mentorName,
                style: AppStyles.bodyTextStyle.copyWith(fontSize: 14),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              children: [
                Icon(Icons.star_sharp, color: Colors.amber, size: 16),
                Text(
                  courseStars.toString(),
                  style: AppStyles.bodyTextStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5),
      ],
    ),
  );
}

Widget cardCourseLong(
  String imageCourse,
  String courseName,
  String mentorPict,
  String mentorName,
  double courseStars,
  bool isLiked,
  bool isCrowned, {
  VoidCallback? onTap,
}) {
  return Container(
    height: 130,
    // width: double.infinity,
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.all(8),
    child: Row(
      children: [
        Container(
          width: 150,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.asset(imageCourse),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        courseName,
                        style: AppStyles.bodyTextStyle,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      children: [
                        isCrowned
                            ? Icon(Icons.emoji_events, color: Colors.amber)
                            : SizedBox.shrink(),
                        isCrowned ? SizedBox(width: 2) : SizedBox.shrink(),
                        GestureDetector(
                          onTap: onTap,
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked
                                ? AppColors.likeColor
                                : AppColors.darkText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColors.mustardSoft,
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(8),
                        child: Image.asset(mentorPict),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        mentorName,
                        style: AppStyles.bodyTextStyle.copyWith(
                          fontSize: 14,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_sharp, color: Colors.amber, size: 16),
                        Text(
                          courseStars.toString(),
                          style: AppStyles.bodyTextStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
