import 'package:course_learning/common/widgets/card_course.dart';
import 'package:course_learning/core/helpers/snackbar_helper.dart';
import 'package:course_learning/features/home_screen/controller/course_list_controller.dart';
import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  final String category;
  const CoursesScreen({super.key, required this.category});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final CourseListController courseListController = CourseListController();

  @override
  void initState() {
    super.initState();
    courseListController.onStateUpdated = () {
      if (mounted) {
        setState(() {});
      }
    };
  }

  @override
  void dispose() {
    courseListController.dispose(); // ← WAJIB
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coursesByCategory = courseListController.courseList
        .where((course) => course.category == widget.category)
        .toList();
    return Scaffold(
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
        child: Padding(
          // padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          padding: EdgeInsetsGeometry.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${widget.category} Courses",
                        style: AppStyles.bodyTextStyle.copyWith(fontSize: 25),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomSnackbar(
                        context,
                        message: "Still Working on it",
                        isSuccess: false,
                      );
                    },
                    child: Icon(Icons.search, size: 25),
                  ),
                ],
              ),
              courseListController.isLoading
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          shrinkWrap: false,
                          itemCount: coursesByCategory.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final course = coursesByCategory[index];
                            return cardCourseLong(
                              course.imageAsset,
                              course.title,
                              course.instructorImage,
                              course.instructor,
                              course.rating,
                              course.isFavorite,
                              course.isPremium,
                              onTap: () {
                                showCustomSnackbar(
                                  context,
                                  message: course.isFavorite
                                      ? "Example from Favorite Courses"
                                      : "Examples of courses not yet in Favorites",
                                  isSuccess: course.isFavorite ? true : false,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
