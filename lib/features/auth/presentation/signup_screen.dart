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
      if (mounted) {
        setState(() {});
        if (_authController.message != null && !_authController.isLoading) {
          showCustomSnackbar(
            context,
            message: _authController.message!,
            isSuccess: _authController.message!.contains(
              'Berhasil',
            ), // Cek apakah ini pesan sukses
            durationSeconds: 3,
          );
          if (_authController.message!.contains('Berhasil')) {
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
                    return 'Full Name wajib diisi.';
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
                    return 'Email wajib diisi.';
                  }

                  if (!_authController.emailValidatorRegExp.hasMatch(value)) {
                    return 'Format email tidak valid (misal: user@domain.com).';
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
                    return 'Kata sandi wajib diisi.';
                  }
                  if (value.length < 8) {
                    return 'Kata sandi minimal 8 karakter.';
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
                    return 'Konfirmasi kata sandi wajib diisi.';
                  }
                  if (value.length < 8) {
                    return 'Konfirmasi minimal 8 karakter.';
                  }
                  if (value != _authController.passwordController.text) {
                    return 'Kata sandi tidak cocok.';
                  }
                  return null; // Valid
                },
              ),
              SizedBox(height: 30),
              buttonCustom("Signup", _submitRegistration),
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
    );
  }
}
