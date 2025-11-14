import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_learning/common/widgets/card_course.dart';
import 'package:course_learning/core/helpers/snackbar_helper.dart';
import 'package:course_learning/core/services/auth_services.dart';
import 'package:course_learning/data/models/user_model.dart';
import 'package:course_learning/features/category_screen/presentation/courses_screen.dart';
import 'package:course_learning/features/category_screen/widget/card_category.dart';
import 'package:course_learning/features/home_screen/controller/course_list_controller.dart';
import 'package:course_learning/features/home_screen/widget/greeting_search_dashboard.dart';
import 'package:course_learning/features/home_screen/widget/live_dashboard_card.dart';
import 'package:course_learning/features/home_screen/widget/row_see_more.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final Function(int) onNavigate;
  const DashboardScreen({super.key, required this.onNavigate});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final CourseListController courseListController = CourseListController();
  final TextEditingController searchController = TextEditingController();
  final AuthService authService = AuthService();
  UserData? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    courseListController.onStateUpdated = () {
      if (mounted) {
        setState(() {});
      }
    };
  }

  Future<void> getCurrentUser() async {
    final user = await authService.getCurrentUser();
    if (mounted) {
      setState(() {
        currentUser = user;
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    courseListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final liveCourses = courseListController.courseList
        .where((c) => c.isLive)
        .toList();
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: [
              GreetingSearchDashboard(
                controller: searchController,
                imageUser: "assets/images/person-2.png",
                nameUser: currentUser?.fullname ?? '',
                greetings: "Find your course and enjoy new arrive✨",
                onTap: () {
                  showCustomSnackbar(
                    context,
                    message: "Still Working on it",
                    isSuccess: false,
                  );
                },
              ),
              SizedBox(height: 15),
              courseListController.isLoading
                  ? SizedBox(
                      height: 260,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : CarouselSlider.builder(
                      itemCount: liveCourses.length,
                      itemBuilder: (context, index, realIndex) {
                        final course = liveCourses[index];
                        return LiveDashboardCard(
                          nameMentor: course.instructor,
                          nameCourse: course.title,
                          assetCourse: "assets/images/wb-1.png",
                          onTap: () {
                            showCustomSnackbar(
                              context,
                              message: "Still Working on it",
                              isSuccess: false,
                            );
                          },
                        );
                      },
                      options: CarouselOptions(
                        height: 260,
                        // aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 2000,
                        ),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
              SizedBox(height: 15),
              rowSeeMore("Your Today Session", () {
                widget.onNavigate(3);
              }),
              SizedBox(height: 10),
              courseListController.isLoading
                  ? SizedBox(
                      height: 250,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: false,
                        itemCount: courseListController.courseList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final course = courseListController.courseList[index];
                          return cardCourse(
                            course.imageAsset,
                            course.title,
                            course.instructorImage,
                            course.instructor,
                            course.rating,
                            course.isFavorite,
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
              SizedBox(height: 10),
              rowSeeMore("Categories", () {
                widget.onNavigate(1);
              }),
              SizedBox(height: 10),
              courseListController.isLoading
                  ? SizedBox(
                      height: 250,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: false,
                        itemCount: courseListController.uniqueCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final category =
                              courseListController.uniqueCategories[index];
                          final count = courseListController.courseList
                              .where((course) => course.category == category)
                              .length;
                          return cardCategory(
                            category,
                            count.toString(),
                            margin: 10,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      CoursesScreen(category: category),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
