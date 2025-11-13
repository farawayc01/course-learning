class UserData {
  final String fullname;
  final String email;
  final String password;

  UserData({
    required this.fullname,
    required this.email,
    required this.password,
  });

  // Konversi UserData ke Map (untuk disimpan sebagai JSON)
  Map<String, dynamic> toJson() => {
    'fullname': fullname,
    'email': email,
    'password': password,
  };

  // Konversi Map/JSON menjadi UserData
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
