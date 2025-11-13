import 'dart:convert';

import 'package:course_learning/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _key = 'user_accounts';

  static const _currentUserKey = 'current_user_session';

  // Ambil instance SharedPreferences
  Future<SharedPreferences> _getPrefs() async {
    return SharedPreferences.getInstance();
  }

  // --- 1. REGISTRASI (Menyimpan Data Baru) ---
  Future<bool> registerUser(
    String fullname,
    String email,
    String password,
  ) async {
    final prefs = await _getPrefs();

    // 1. Ambil daftar akun yang sudah ada (dalam bentuk List<String> JSON)
    final List<String> existingUsersJson = prefs.getStringList(_key) ?? [];

    // 2. Cek apakah email sudah terdaftar
    final bool emailExists = existingUsersJson.any((userJson) {
      final userMap = jsonDecode(userJson);
      return userMap['email'] == email;
    });

    if (emailExists) {
      return false; // Registrasi gagal, email sudah ada
    }

    // 3. Buat objek pengguna baru dan konversi ke JSON String
    final newUser = UserData(
      fullname: fullname,
      email: email,
      password: password,
    );
    final newUserJson = jsonEncode(newUser.toJson());

    // 4. Tambahkan pengguna baru ke daftar dan simpan
    existingUsersJson.add(newUserJson);
    await prefs.setStringList(_key, existingUsersJson);

    return true; // Registrasi berhasil
  }

  Future<bool> loginUser(String email, String password) async {
    final prefs = await _getPrefs();
    final List<String> existingUsersJson = prefs.getStringList(_key) ?? [];

    final matchingUserJson = existingUsersJson.firstWhere(
      (userJson) {
        final userMap = jsonDecode(userJson);
        return userMap['email'] == email && userMap['password'] == password;
      },
      orElse: () => '', // Jika tidak ditemukan
    );

    if (matchingUserJson.isNotEmpty) {
      await prefs.setString(_currentUserKey, matchingUserJson);
      return true;
    }

    return false;
  }

  Future<UserData?> getCurrentUser() async {
    final prefs = await _getPrefs();
    final userJson = prefs.getString(_currentUserKey);

    if (userJson != null && userJson.isNotEmpty) {
      final userMap = jsonDecode(userJson);
      return UserData.fromJson(userMap);
    }

    return null;
  }

  // --- 4. LOGOUT (Menghapus Sesi Lokal) ---
  Future<void> logout() async {
    final prefs = await _getPrefs();
    // Hapus data sesi user yang sedang aktif
    await prefs.remove(_currentUserKey);
  }
}
