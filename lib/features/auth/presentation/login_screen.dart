import 'package:course_learning/features/auth/presentation/signup_screen.dart';
import 'package:course_learning/features/home_screen/presentation/home_screen.dart';
import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:course_learning/common/widgets/button.dart';
import 'package:course_learning/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Di dalam class _LoginScreenState Anda
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
              AppColors.customColorPrimary,
            ],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Account",
              style: AppStyles.headlineStyle.copyWith(
                color: AppStyles.getAdaptiveTextColor(context),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Welcome Back to Account👋",
              style: AppStyles.bodyTextStyle.copyWith(
                color: AppColors.slateGray,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
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
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password ?",
                style: AppStyles.bodyTextStyle.copyWith(
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            buttonCustom("Login", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            }),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: AppStyles.bodyTextStyle,
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                  child: Text(
                    "Signup",
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
