import 'package:course_learning/common/widgets/button.dart';
import 'package:course_learning/features/auth/controller/auth_controller.dart';
import 'package:course_learning/features/profile_screen/widget/menu_card_profile.dart';
import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: AppStyles.bodyTextStyle.copyWith(fontSize: 30),
                  ),
                  SizedBox(
                    width: 120,
                    child: buttonCustom(
                      padding: EdgeInsets.zero,
                      radius: 5,
                      "Sign Out",
                      () => authController.handleLogout(context),
                      color: AppColors.likeColor,
                      titleColor: AppColors.lightText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(8),
                        child: Image.asset("assets/images/person-2.png"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Avin Hendrawan",
                      style: AppStyles.bodyTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              MenuCardProfile(title: "My Profile", icon: Icons.person),
              SizedBox(height: 10),
              MenuCardProfile(title: "My Courses", icon: Icons.book_rounded),
              SizedBox(height: 10),
              MenuCardProfile(title: "My Payment", icon: Icons.credit_card),
              SizedBox(height: 10),
              MenuCardProfile(title: "My Wishlist", icon: Icons.favorite),
              SizedBox(height: 10),
              MenuCardProfile(title: "Change Password", icon: Icons.lock),
              SizedBox(height: 10),
              MenuCardProfile(
                title: "Live Session",
                icon: Icons.wifi_tethering,
              ),
              SizedBox(height: 10),
              MenuCardProfile(title: "Subscription Plan", icon: Icons.list_alt),
            ],
          ),
        ),
      ),
    );
  }
}
