import 'package:course_learning/data/data_sources/course_data.dart';
import 'package:course_learning/data/models/course_model.dart';
import 'package:flutter/material.dart';

class CourseListController {
  VoidCallback? onStateUpdated;

  List<CourseModel> courseList = [];
  bool isLoading = false;

  // ✅ Tambahan: kategori yang sedang dipilih
  String? selectedCategory;

  CourseListController() {
    loadCourses();
  }

  void loadCourses() {
    isLoading = true;
    onStateUpdated?.call();

    Future.delayed(const Duration(seconds: 1), () {
      courseList = dummyCourseData;
      isLoading = false;
      onStateUpdated?.call();
    });
  }

  // ✅ Ambil kategori unik
  List<String> get uniqueCategories {
    final categories = courseList.map((e) => e.category).toSet().toList();
    return categories;
  }

  // ✅ Filter daftar course berdasarkan kategori terpilih
  List<CourseModel> get filteredCourses {
    if (selectedCategory == null) return courseList;
    return courseList
        .where((course) => course.category == selectedCategory)
        .toList();
  }

  // ✅ Ganti kategori saat diklik
  void selectCategory(String category) {
    if (selectedCategory == category) {
      selectedCategory = null;
    } else {
      selectedCategory = category;
    }
    onStateUpdated?.call();
  }
}
