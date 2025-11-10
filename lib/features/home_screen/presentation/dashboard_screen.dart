import 'package:course_learning/features/home_screen/widget/greeting_search_dashboard.dart';
import 'package:course_learning/features/home_screen/widget/live_dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            GreetingSearchDashboard(
              controller: searchController,
              imageUser: "assets/images/person-2.png",
              nameUser: "Avin Hendrawan",
              greetings: "Find your course and enjoy new arrive✨",
            ),
            SizedBox(height: 15),
            LiveDashboardCard(
              nameMentor: "Huberta Raj",
              nameCourse: "Complete Wordpress Training for Beginners",
              assetCourse: "assets/images/wb-1.png",
            ),
          ],
        ),
      ),
    );
  }
}
