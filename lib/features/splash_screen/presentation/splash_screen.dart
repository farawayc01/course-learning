import 'package:course_learning/features/splash_screen/controller/splash_screen_controller.dart';
import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget initialScreen;
  const SplashScreen({super.key, required this.initialScreen});

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
      if (!mounted) return;
      setState(() {});
    };
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
              AppColors.lightBackground,
              AppColors.lightBackground,
              AppColors.customColorPrimary,
            ],
            stops: [0.0, 0.3, 0.6, 0.7, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // color: Colors.red,
                // height: MediaQuery.of(context).size.height * 0.7,
                height: 600,
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
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _controller.slides.length,
                  (index) => _buildDot(index),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _controller.isLastPage
                            ? SizedBox()
                            : Container(
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
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => widget.initialScreen,
                              ),
                            );
                          },
                          child: Text(
                            _controller.isLastPage ? "Next" : "Skip",
                            style: AppStyles.bodyTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
    return SizedBox(
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(horizontal: 40.0),
      // margin: EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(slide.imagePath, width: 300, height: 300),
          // SizedBox(height: 30),
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
          // SizedBox(height: 20),
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
