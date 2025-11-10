class CourseModel {
  final int id;
  final String title;
  final String instructor;
  final double rating;
  final bool isFavorite;
  final bool isPremium;
  final String imageAsset;

  // Constructor utama
  const CourseModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.rating,
    required this.isFavorite,
    required this.isPremium,
    required this.imageAsset,
  });

  // Factory Method untuk mengonversi Map/JSON menjadi CourseModel
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as int,
      title: json['title'] as String,
      instructor: json['instructor'] as String,
      // Pastikan rating diubah ke double
      rating: (json['rating'] as num).toDouble(),
      isFavorite: json['is_favorite'] as bool,
      isPremium: json['is_premium'] as bool,
      imageAsset: json['image_asset'] as String,
    );
  }
}
