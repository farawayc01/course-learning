import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MenuCardProfile extends StatelessWidget {
  final String title;
  final IconData icon;
  const MenuCardProfile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightText,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 35),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bodyTextStyle.copyWith(
                fontSize: 16,
                color: AppColors.greyColor,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.primaryColor,
            size: 18,
          ),
        ],
      ),
    );
  }
}
