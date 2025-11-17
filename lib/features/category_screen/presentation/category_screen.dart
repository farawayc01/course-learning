import 'package:course_learning/features/category_screen/presentation/courses_screen.dart';
import 'package:course_learning/features/category_screen/widget/card_category.dart';
import 'package:course_learning/features/home_screen/controller/course_list_controller.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
    super.dispose();
    courseListController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 50),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Category",
                  style: AppStyles.bodyTextStyle.copyWith(fontSize: 30),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Text(
                        courseListController.uniqueCategories.length.toString(),
                        style: AppStyles.bodyTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    Text(
                      "Categories",
                      style: AppStyles.bodyTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            courseListController.isLoading
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemCount: courseListController.uniqueCategories.length,
                      itemBuilder: (context, index) {
                        final double marginTop = (index % 2 == 0) ? 0 : 10;
                        final category =
                            courseListController.uniqueCategories[index];
                        final count = courseListController.courseList
                            .where((course) => course.category == category)
                            .length;
                        return Container(
                          margin: EdgeInsets.only(top: marginTop),
                          child: cardCategory(
                            category,
                            count.toString(),
                            height: 250,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      CoursesScreen(category: category),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
