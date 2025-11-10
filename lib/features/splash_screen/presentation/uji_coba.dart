import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/common/widgets/card_course.dart';
import 'package:flutter/material.dart';

class UjiCoba extends StatelessWidget {
  const UjiCoba({super.key});

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
              const Color.fromARGB(255, 191, 156, 245).withValues(alpha: 0.3),
            ],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return cardCourse(
                    "assets/images/tools-4.png",
                    "What is the Layout Design in Figma?",
                    "assets/images/person-4.png",
                    "Carol Tefer Julius Frans",
                    5,
                    true,
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return cardCourseLong(
                      "assets/images/tools-4.png",
                      "What is the Layout Design in Figma?",
                      "assets/images/person-4.png",
                      "Carol Tefer Julius Frans",
                      5,
                      true,
                      false,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
