import 'package:course_learning/core/helpers/snackbar_helper.dart';
import 'package:course_learning/features/auth/controller/auth_controller.dart';
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
  final AuthController _authController = AuthController();

  @override
  void initState() {
    super.initState();
    _authController.onStateUpdated = () {
      if (!mounted) return;

      if (_authController.message != null && !_authController.isLoading) {
        final bool isSuccess = _authController.message!.contains('Successfull');
        showCustomSnackbar(
          context,
          message: _authController.message!,
          isSuccess: isSuccess, // Cek apakah ini pesan sukses
          durationSeconds: 3,
        );
        if (isSuccess) {
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (mounted) {
              // _authController.dispose();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }
          });
          _authController.message = null;
        }
      }
    };
  }

  void _submitRegistration() {
    if (_authController.formKey.currentState!.validate()) {
      // Jika semua field valid, panggil Controller
      _authController.handleRegister();
    }
  }

  @override
  void dispose() {
    _authController.dispose();
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
              const Color.fromARGB(255, 191, 156, 245).withValues(alpha: 0.3),
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
                    controller: _authController.fullNameController,
                    label: "Full Name",
                    hint: "Full Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Full Name must be filled in.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
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
                  CustomTextField(
                    controller: _authController.confirmPasswordController,
                    label: "Confirm Password",
                    hint: "Confirm Password",
                    isPassword: true,
                    compareValue: _authController.passwordController.text,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirmation Password must be filled in.';
                      }
                      if (value.length < 8) {
                        return 'Confirmation Password must be at least 8 characters long.';
                      }
                      if (value != _authController.passwordController.text) {
                        return 'Confirmation Password does not match.';
                      }
                      return null; // Valid
                    },
                  ),
                  SizedBox(height: 30),
                  buttonCustom("Signup", onTap: _submitRegistration),
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
          ),
        ),
      ),
    );
  }
}
