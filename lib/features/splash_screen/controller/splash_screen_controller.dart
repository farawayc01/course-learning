// Struktur Data Slide (sama seperti sebelumnya)
import 'package:flutter/material.dart';

class Slide {
  final String title;
  final String description;
  final String imagePath;
  Slide(this.title, this.description, this.imagePath);
}

class SplashScreenController {
  VoidCallback? onStateUpdated;

  final List<Slide> slides = [
    Slide(
      "Welcome! Learn Without Limits.",
      "Discover thousands of courses from experts and develop your skills, anytime, anywhere.",
      'assets/images/splash-screen-1.png',
    ),
    Slide(
      "Access Materials Anytime.",
      "Download videos, read modules, and take quizzes offline. Learn flexibly according to your schedule.",
      'assets/images/splash-screen-2.png',
    ),
    Slide(
      "Improve Your Competence.",
      "Get recognized certificates and monitor your learning progress in each course until completion.",
      'assets/images/splash-screen-3.png',
    ),
  ];

  int _currentPage = 0;
  int get currentPage => _currentPage;

  final PageController pageController = PageController(initialPage: 0);

  bool get isLastPage => _currentPage == slides.length - 1;

  void onPageChanged(int page) {
    _currentPage = page;
    onStateUpdated?.call();
  }

  void goToNextPage() {
    if (isLastPage) {
      finishOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  void finishOnboarding() async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('onboardingDone', true);
    onStateUpdated?.call();
  }

  void dispose() {
    pageController.dispose();
  }
}
