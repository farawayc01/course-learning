import 'package:course_learning/features/home_screen/presentation/dashboard_screen.dart';
import 'package:course_learning/features/home_screen/widget/custom_navigation_bar.dart';
import 'package:course_learning/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // 2. CONTROLLER: Untuk mengontrol PageView
  late PageController _pageController;

  // 3. DAFTAR HALAMAN (CONTENT)
  final List<Widget> _pages = [
    // Ganti dengan widget layar nyata Anda
    const DashboardScreen(),
    const Center(child: Text("Halaman 2: Semua Kursus")),
    const Center(child: Text("Halaman 3: Pesan")),
    const Center(child: Text("Halaman 4: Sertifikat")),
    const Center(child: Text("Halaman 5: Profil")),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Fungsi yang dipanggil saat tombol navigasi ditekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Kunci: Pindah PageView tanpa animasi geser
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
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
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),

          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: _pages,
        ),
      ),

      // BOTTOM NAVIGATION: Menggunakan widget kustom
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
