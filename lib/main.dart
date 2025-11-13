import 'package:course_learning/core/services/auth_services.dart';
import 'package:course_learning/data/models/user_model.dart';
import 'package:course_learning/features/auth/presentation/login_screen.dart';
import 'package:course_learning/features/home_screen/presentation/home_screen.dart';
import 'package:course_learning/features/splash_screen/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthService authService = AuthService();

  // Ambil data user dari sesi lokal
  final UserData? currentUser = await authService.getCurrentUser();

  // Tentukan root widget berdasarkan status login
  final Widget initialScreen = currentUser != null
      ? const HomeScreen()
      : const LoginScreen();
  runApp(MyApp(initialScreen: initialScreen));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;
  const MyApp({super.key, required this.initialScreen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Learning',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1C1C1E),
      ),
      themeMode: ThemeMode.light,
      home: SplashScreen(initialScreen: initialScreen),
    );
  }
}
