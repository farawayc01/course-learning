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
  bool _isDisposed = false;
  String? message; // Untuk menyimpan pesan error/sukses

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _notifySafely() {
    if (!_isDisposed) {
      onStateUpdated?.call();
    }
  }

  Future<void> handleRegister() async {
    isLoading = true;
    message = null;
    _notifySafely();
    final String fullname = fullNameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final success = await _authService.registerUser(fullname, email, password);
    isLoading = false;
    if (success) {
      message = 'Registration Successfull! Please log in.';
      _notifySafely();
    } else {
      message = 'Registration Failed: Email already registered.';
      _notifySafely();
    }
  }

  Future<void> handleLogin() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    isLoading = true;
    message = null;
    _notifySafely();
    // Panggil AuthService untuk mengecek kredensial
    final bool success = await _authService.loginUser(email, password);

    // Proses Hasil
    isLoading = false;

    if (success) {
      message = 'Login Successfull!';
      _notifySafely();
      if (!_isDisposed) {
        onLoginSuccess?.call();
      }
    } else {
      message = 'Login Failed: Incorrect email or password';
      _notifySafely();
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
    _isDisposed = true;
    onStateUpdated = null;
    onLoginSuccess = null;

    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
