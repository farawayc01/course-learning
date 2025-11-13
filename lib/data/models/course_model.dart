class CourseModel {
  final int id;
  final String title;
  final String instructor;
  final String instructorImage;
  final double rating;
  final bool isFavorite;
  final bool isPremium;
  final bool isLive;
  final String imageAsset;
  final String category;
  final double price;

  // Constructor utama
  const CourseModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.instructorImage,
    required this.rating,
    required this.isFavorite,
    required this.isPremium,
    required this.isLive,
    required this.imageAsset,
    required this.category,
    required this.price,
  });

  // Factory Method untuk mengonversi Map/JSON menjadi CourseModel
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as int,
      title: json['title'] as String,
      instructor: json['instructor'] as String,
      instructorImage: json['instructor_image'] as String,
      // Pastikan rating diubah ke double
      rating: (json['rating'] as num).toDouble(),
      isFavorite: json['is_favorite'] as bool,
      isPremium: json['is_premium'] as bool,
      isLive: json['is_live'] as bool,
      imageAsset: json['image_asset'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
}
