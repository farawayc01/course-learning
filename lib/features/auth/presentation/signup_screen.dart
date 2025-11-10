import 'package:course_learning/features/auth/presentation/login_screen.dart';
import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:course_learning/common/widgets/button.dart';
import 'package:course_learning/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isTextEmpty = true; // State untuk melacak apakah input kosong

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkTextStatus);
  }

  void _checkTextStatus() {
    // Hanya setState jika status kosong/terisi benar-benar berubah
    if (_isTextEmpty != _emailController.text.isEmpty) {
      setState(() {
        _isTextEmpty = _emailController.text.isEmpty;
      });
    }
  }

  @override
  void dispose() {
    _emailController.removeListener(_checkTextStatus);
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.mustardSoft.withValues(alpha: 0.3),
              AppColors.lightBackground,
              const Color.fromARGB(255, 191, 156, 245).withValues(alpha: 0.3),
            ],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create a New Account",
              style: AppStyles.headlineStyle.copyWith(
                color: AppStyles.getAdaptiveTextColor(context),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Enter your details and enjoy new journey👋",
              style: AppStyles.bodyTextStyle.copyWith(
                color: AppColors.slateGray,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            CustomTextField(
              controller: _emailController,
              label: "Full Name",
              hint: "Full Name",
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: _emailController,
              label: "Email",
              hint: "Email",
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: _emailController,
              label: "Password",
              hint: "Password",
              isPassword: true,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: _emailController,
              label: "Confirm Password",
              hint: "Confirm Password",
              isPassword: true,
            ),
            SizedBox(height: 30),
            buttonCustom("Signup", () {}),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: AppStyles.bodyTextStyle,
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Login",
                    style: AppStyles.bodyTextStyle.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
