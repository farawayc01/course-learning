import 'package:course_learning/common/widgets/custom_search_bar.dart';
import 'package:course_learning/core/helpers/snackbar_helper.dart';
import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GreetingSearchDashboard extends StatelessWidget {
  final TextEditingController controller;
  final String imageUser;
  final String nameUser;
  final String greetings;
  final VoidCallback? onTap;
  const GreetingSearchDashboard({
    super.key,
    required this.controller,
    required this.imageUser,
    required this.nameUser,
    required this.greetings,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.lightBackground,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.asset(imageUser),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameUser,
                      style: AppStyles.bodyTextStyle.copyWith(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      greetings,
                      style: AppStyles.bodyTextStyle.copyWith(
                        fontWeight: FontWeight.w200,
                        color: AppColors.darkSurface,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              GestureDetector(onTap: onTap, child: Icon(Icons.notifications)),
            ],
          ),
          SizedBox(height: 15),
          CustomSearchBar(
            controller: controller,
            onSubmitted: (_) {
              showCustomSnackbar(
                context,
                message: "Still Working on it",
                isSuccess: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
