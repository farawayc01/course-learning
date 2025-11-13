import 'package:course_learning/common/widgets/button.dart';
import 'package:course_learning/data/data_sources/participant_data.dart';
import 'package:course_learning/features/home_screen/widget/participant_activity_row.dart';
import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

class LiveDashboardCard extends StatelessWidget {
  final String nameMentor;
  final String nameCourse;
  final String assetCourse;
  const LiveDashboardCard({
    super.key,
    required this.nameMentor,
    required this.nameCourse,
    required this.assetCourse,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.likeColor,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.lightText,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Live",
                          style: AppStyles.bodyTextStyle.copyWith(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.lightText,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: AppColors.customColorPrimary,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "Free",
                      style: AppStyles.bodyTextStyle.copyWith(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.lightText,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                nameMentor,
                style: AppStyles.bodyTextStyle.copyWith(
                  fontSize: 14,
                  color: AppColors.lightText,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  nameCourse,
                  style: AppStyles.bodyTextStyle.copyWith(
                    fontSize: 16,
                    color: AppColors.lightText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              Spacer(),
              ParticipantActivityRow(
                avatarPaths: dummyAvatars,
                participantsCount: participantsCount,
                duration: courseDuration,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 120,
                child: buttonCustom(
                  padding: EdgeInsets.zero,
                  radius: 5,
                  "Join Now",
                  () {},
                  color: Colors.amber,
                  titleColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -60, // Sesuaikan posisi horizontal
          bottom: -15, // Tempelkan di bagian bawah
          child: Image.asset(
            assetCourse,
            height: 180, // Sesuaikan tinggi gambar
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
