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
      "Selamat Datang! Belajar Tanpa Batas.",
      "Temukan ribuan kursus dari para ahli dan kembangkan keahlian Anda, kapan pun dan di mana pun.",
      'assets/images/splash-screen-1.png',
    ),
    Slide(
      "Akses Materi Kapan Saja.",
      "Unduh video, baca modul, dan kerjakan kuis secara offline. Belajar jadi fleksibel sesuai jadwal Anda.",
      'assets/images/splash-screen-2.png',
    ),
    Slide(
      "Tingkatkan Kompetensi Anda.",
      "Dapatkan sertifikat yang diakui dan pantau progres belajar Anda di setiap kursus hingga selesai.",
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
