import 'package:course_learning/features/auth/presentation/login_screen.dart';
import 'package:course_learning/features/splash_screen/controller/splash_screen_controller.dart';
import 'package:course_learning/features/splash_screen/presentation/uji_coba.dart';
import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:course_learning/common/widgets/button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenController _controller = SplashScreenController();

  @override
  void initState() {
    super.initState();
    // 2. Pasang Callback Controller
    _controller.onStateUpdated = () {
      // Ini adalah JANTUNG pembaruan UI
      if (mounted) {
        setState(() {
          // Jika sudah selesai Onboarding, segera navigasi
          if (_controller.isLastPage) {
            // Karena finishOnboarding memanggil onStateUpdated, kita cek di sini:
            if (_controller.isLastPage) {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (context) => const HomePage()),
              // );
            }
          }
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.mustardSoft.withValues(alpha: 0.3),
              AppColors.lightBackground,
              AppColors.lightBackground,
              AppColors.lightBackground,
              AppColors.customColorPrimary,
            ],
            stops: [0.0, 0.3, 0.6, 0.7, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: PageView.builder(
                controller: _controller.pageController,
                itemCount: _controller.slides.length,
                onPageChanged: _controller.onPageChanged,
                itemBuilder: (context, index) {
                  // return _buildSlide(_controller.slides[index]);
                  return AnimatedBuilder(
                    animation: _controller.pageController,
                    builder: (context, child) {
                      double value = 0;
                      try {
                        value = _controller.pageController.page! - index;
                      } catch (e) {
                        // Abaikan error jika pageController.page belum diinisialisasi
                        // Terjadi di frame pertama.
                      }
                      value = value.clamp(-1.0, 1.0);
                      value = (1 - (value.abs() * 0.5));

                      return Opacity(
                        opacity: value,
                        child: Transform.scale(
                          scale: value,
                          child: _buildSlide(_controller.slides[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _controller.slides.length,
                  (index) => _buildDot(index),
                ),
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol
                  // ElevatedButton(
                  //   onPressed: _controller.goToNextPage,
                  //   child: Text(_controller.isLastPage ? "Selesai" : "Lanjut"),
                  // ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: _controller.goToNextPage,
                        icon: Icon(
                          Icons.arrow_forward,
                          color: AppColors.lightBackground,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: AppStyles.bodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Bersihkan PageController
    super.dispose();
  }

  Widget _buildSlide(Slide slide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(slide.imagePath),
          SizedBox(height: 30),
          Text(
            slide.title,
            style: AppStyles.headlineStyle.copyWith(
              color: AppStyles.getAdaptiveTextColor(context),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            slide.description,
            style: AppStyles.bodyTextStyle.copyWith(color: AppColors.slateGray),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      width: _controller.currentPage == index ? 12 : 12,
      height: 4,
      decoration: BoxDecoration(
        color: _controller.currentPage == index
            ? AppColors.primaryColor
            : AppColors.lightBackground,
        // borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
