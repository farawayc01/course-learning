import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Lottie.asset(
              'assets/lottie/pnf404.json',
              fit: BoxFit.fill,
              repeat: true,
            ),
          ),
        ),
      ],
    );
  }
}
