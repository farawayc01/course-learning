import 'package:course_learning/data/models/course_model.dart';

final List<CourseModel> dummyCourseData = const [
  CourseModel(
    id: 101,
    title: 'Application Design For Beginner',
    instructor: 'Huberta raj',
    rating: 5.0,
    isFavorite: true, // Tidak perlu komentar Ikon Hati Penuh
    isPremium: false,
    imageAsset: 'assets/images/course_book.png',
  ),
  CourseModel(
    id: 102,
    title: 'Digital Photography Poster Class',
    instructor: 'Carol Tefer',
    rating: 5.0,
    isFavorite: false,
    isPremium: true, // Tidak perlu komentar Ikon Mahkota
    imageAsset: 'assets/images/course_camera.png',
  ),
  CourseModel(
    id: 103,
    title: 'Learn UI - UX For Beginners',
    instructor: 'Rachel & Adrian',
    rating: 5.0,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/course_stack.png',
  ),
  CourseModel(
    id: 104,
    title: 'UI/UX design with Graphic Design',
    instructor: 'Huberta raj',
    rating: 5.0,
    isFavorite: true,
    isPremium: false,
    imageAsset: 'assets/images/course_sofa.png',
  ),
  CourseModel(
    id: 105,
    title: 'Art Work and Home Decorate Design',
    instructor: 'Carol Tefer',
    rating: 5.0,
    isFavorite: false,
    isPremium: true,
    imageAsset: 'assets/images/course_decor.png',
  ),
  CourseModel(
    id: 106,
    title: 'Basic Web Development Fundamentals',
    instructor: 'Rachel & Adrian',
    rating: 4.9,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/course_stack.png',
  ),
];
