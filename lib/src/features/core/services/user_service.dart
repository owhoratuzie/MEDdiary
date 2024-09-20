
import 'package:med_diary/src/features/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserModel?> getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  final username = prefs.getString('username');
  final birthMonth = prefs.getInt('birthMonth');
  final birthYear = prefs.getInt('birthYear');

  if (username != null && birthMonth != null && birthYear != null) {
    return UserModel(username, birthMonth, birthYear);
  } else {
    return null;
  }
}

Future<void> saveUserData(UserModel user) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', user.username);
  await prefs.setInt('birthMonth', user.birthMonth);
  await prefs.setInt('birthYear', user.birthYear);
}


Future<void> updateUsername(String newUsername) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', newUsername);
}