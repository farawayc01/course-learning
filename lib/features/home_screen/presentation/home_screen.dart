import 'package:course_learning/features/category_screen/presentation/category_screen.dart';
import 'package:course_learning/features/my_course_screen/presentation/my_course_screen.dart';
import 'package:course_learning/features/home_screen/presentation/dashboard_screen.dart';
import 'package:course_learning/features/home_screen/widget/custom_navigation_bar.dart';
import 'package:course_learning/features/inbox_screen/presentation/inbox_screen.dart';
import 'package:course_learning/features/profile_screen/presentation/profile_screen.dart';
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
    const CategoryScreen(),
    const InboxScreen(),
    const MyCourseScreen(),
    const ProfileScreen(),
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
    // // Kunci: Pindah PageView tanpa animasi geser
    // _pageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeOut,
    // );
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
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            // Fade + slide kecil
            return SlideTransition(
              position:
                  Tween<Offset>(
                    begin: const Offset(0, 0), // geser dikit dari kanan
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeOut),
                  ),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: IndexedStack(
            key: ValueKey<int>(
              _selectedIndex,
            ), // penting agar AnimatedSwitcher tahu halaman berubah
            index: _selectedIndex,
            children: _pages,
          ),
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
