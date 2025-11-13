import 'dart:math';

import 'package:course_learning/data/models/course_model.dart';

// Inisialisasi objek Random sekali saja
final _random = Random();

// Fungsi helper untuk mendapatkan true atau false secara acak
bool _getRandomBool() {
  return _random.nextBool();
}

final List<CourseModel> dummyCourseData = [
  // Hapus 'const'
  CourseModel(
    id: 101,
    title: 'Application Design For Beginner',
    instructor: 'Huberta raj',
    instructorImage: 'assets/images/person-2.png',
    rating: 5.0,
    isFavorite: true,
    isPremium: false,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Design',
    price: 49.99,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 102,
    title: 'Digital Photography Poster Class',
    instructor: 'Carol Tefer',
    instructorImage: 'assets/images/person-3.png',
    rating: 5.0,
    isFavorite: false,
    isPremium: true,
    imageAsset: 'assets/images/courses-2.png',
    category: 'Art',
    price: 0.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 103,
    title: 'Learn UI - UX For Beginners',
    instructor: 'Rachel',
    instructorImage: 'assets/images/person-1.png',
    rating: 5.0,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/courses-3.png',
    category: 'Design',
    price: 79.99,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 104,
    title: 'UI/UX design with Graphic Design',
    instructor: 'Huberta raj',
    instructorImage: 'assets/images/person-2.png',
    rating: 5.0,
    isFavorite: true,
    isPremium: false,
    imageAsset: 'assets/images/courses-3.png',
    category: 'Development',
    price: 129.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 105,
    title: 'Art Work and Home Decorate Design',
    instructor: 'Carol Tefer',
    instructorImage: 'assets/images/person-3.png',
    rating: 5.0,
    isFavorite: false,
    isPremium: true,
    imageAsset: 'assets/images/courses-3.png',
    category: 'Art',
    price: 99.50,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 106,
    title: 'Basic Web Development Fundamentals',
    instructor: 'Rachel',
    instructorImage: 'assets/images/person-1.png',
    rating: 4.9,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Development',
    price: 19.99,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 107,
    title: 'Financial Planning and Budgeting 101',
    instructor: 'Ariel Santoso',
    instructorImage: 'assets/images/person-5.png',
    rating: 4.7,
    isFavorite: true,
    isPremium: true,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Business',
    price: 199.99,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 108,
    title: 'Advanced NodeJS for Backend Engineering',
    instructor: 'Budi Hartono',
    instructorImage: 'assets/images/person-5.png',
    rating: 5.0,
    isFavorite: false,
    isPremium: true,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Development',
    price: 0.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 109,
    title: 'Introduction to 3D Modeling (Blender)',
    instructor: 'Carol Tefer',
    instructorImage: 'assets/images/person-3.png',
    rating: 4.8,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/courses-3.png',
    category: 'Design',
    price: 85.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 110,
    title: 'Mastering Public Speaking & Presentation',
    instructor: 'Huberta raj',
    instructorImage: 'assets/images/person-2.png',
    rating: 5.0,
    isFavorite: true,
    isPremium: false,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Business',
    price: 45.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 111,
    title: 'Watercolor Painting Techniques',
    instructor: 'Rachel',
    instructorImage: 'assets/images/person-1.png',
    rating: 4.5,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/courses-3.png',
    category: 'Art',
    price: 29.99,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 112,
    title: 'Data Science with Python and Pandas',
    instructor: 'Ariel Santoso',
    instructorImage: 'assets/images/person-5.png',
    rating: 4.9,
    isFavorite: true,
    isPremium: true,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Development',
    price: 250.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 113,
    title: 'Digital Marketing Fundamentals (SEO)',
    instructor: 'Budi Hartono',
    instructorImage: 'assets/images/person-5.png',
    rating: 4.6,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Business',
    price: 35.50,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 114,
    title: 'Creating Mobile Apps with Flutter & Dart',
    instructor: 'Rachel',
    instructorImage: 'assets/images/person-1.png',
    rating: 5.0,
    isFavorite: true,
    isPremium: true,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Development',
    price: 150.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 115,
    title: 'Modern Abstract Art for Beginners',
    instructor: 'Carol Tefer',
    instructorImage: 'assets/images/person-3.png',
    rating: 4.4,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Art',
    price: 55.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 116,
    title: 'Supply Chain Management Strategy',
    instructor: 'Ariel Santoso',
    instructorImage: 'assets/images/person-5.png',
    rating: 4.9,
    isFavorite: true,
    isPremium: false,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Business',
    price: 0.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 117,
    title: 'Photography Editing Masterclass (Lightroom)',
    instructor: 'Huberta raj',
    instructorImage: 'assets/images/person-2.png',
    rating: 4.8,
    isFavorite: false,
    isPremium: true,
    imageAsset: 'assets/images/courses-2.png',
    category: 'Art',
    price: 75.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 118,
    title: 'Figma Auto Layout and Component Design',
    instructor: 'Budi Hartono',
    instructorImage: 'assets/images/person-5.png',
    rating: 5.0,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/courses-3.png',
    category: 'Design',
    price: 65.99,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 119,
    title: 'Database Management with SQL and NoSQL',
    instructor: 'Ariel Santoso',
    instructorImage: 'assets/images/person-5.png',
    rating: 4.9,
    isFavorite: true,
    isPremium: true,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Development',
    price: 180.00,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
  CourseModel(
    id: 120,
    title: 'Effective Business Communication',
    instructor: 'Huberta raj',
    instructorImage: 'assets/images/person-2.png',
    rating: 4.7,
    isFavorite: false,
    isPremium: false,
    imageAsset: 'assets/images/courses-1.png',
    category: 'Business',
    price: 39.99,
    isLive: _getRandomBool(), // <-- Nilai Acak
  ),
];
