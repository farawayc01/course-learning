import 'package:course_learning/core/helpers/snackbar_helper.dart';
import 'package:course_learning/features/auth/controller/auth_controller.dart';
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
  final AuthController _authController = AuthController();

  @override
  void initState() {
    super.initState();
    _authController.onStateUpdated = () {
      if (mounted) {
        setState(() {});

        if (_authController.message != null && !_authController.isLoading) {
          final bool isSuccess = _authController.message!.contains(
            'Successfull',
          );
          showCustomSnackbar(
            context,
            message: _authController.message!,
            isSuccess: isSuccess,
            durationSeconds: 2,
          );
          if (isSuccess) {
            Future.delayed(const Duration(milliseconds: 1500), () {
              if (mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }
            });
          }
          _authController.message = null;
        }
      }
    };
  }

  void _submitLogin() {
    if (_authController.formKey.currentState!.validate()) {
      _authController.handleLogin();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _authController.formKey,
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
                    controller: _authController.emailController,
                    label: "Email",
                    hint: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email must be filled in.';
                      }

                      if (!_authController.emailValidatorRegExp.hasMatch(
                        value,
                      )) {
                        return 'Email format is invalid (e.g., user@domain.com).';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: _authController.passwordController,
                    label: "Password",
                    hint: "Password",
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password must be filled in.';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      showCustomSnackbar(
                        context,
                        message: "Still Working on it",
                        isSuccess: false,
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password ?",
                        style: AppStyles.bodyTextStyle.copyWith(
                          color: AppColors.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  buttonCustom(
                    "Login",
                    onTap: () {
                      _submitLogin();
                    },
                  ),
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
                            MaterialPageRoute(
                              builder: (_) => const SignupScreen(),
                            ),
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
          ),
        ),
      ),
    );
  }
}
