import 'package:course_learning/core/helpers/snackbar_helper.dart';
import 'package:course_learning/core/services/auth_services.dart';
import 'package:course_learning/features/auth/presentation/login_screen.dart';
import 'package:flutter/material.dart';

class AuthController {
  // Di dalam RegisterController Anda
  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  final RegExp emailValidatorRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  VoidCallback? onStateUpdated;
  VoidCallback? onLoginSuccess;
  bool isLoading = false;
  String? message; // Untuk menyimpan pesan error/sukses

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> handleRegister() async {
    isLoading = true;
    message = null;
    onStateUpdated?.call();
    final String fullname = fullNameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final success = await _authService.registerUser(fullname, email, password);
    isLoading = false;
    if (success) {
      message = 'Registration Successfull! Please log in.';
      onStateUpdated?.call();
    } else {
      message = 'Registration Failed: Email already registered.';
      onStateUpdated?.call();
    }
  }

  Future<void> handleLogin() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    isLoading = true;
    message = null;
    onStateUpdated?.call();
    // Panggil AuthService untuk mengecek kredensial
    final bool success = await _authService.loginUser(email, password);

    // Proses Hasil
    isLoading = false;

    if (success) {
      message = 'Login Successfull!';
      onStateUpdated?.call();
      onLoginSuccess?.call();
    } else {
      message = 'Login Failed: Incorrect email or password';
      onStateUpdated?.call();
    }
  }

  // Di Controller Home/Profile Anda:
  Future<void> handleLogout(BuildContext context) async {
    final AuthService authService = AuthService();
    await authService.logout();

    // Setelah logout, arahkan ke halaman Login
    showCustomSnackbar(context, message: "Success Sign Out", isSuccess: true);
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
