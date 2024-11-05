import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static Future<void> setSession(bool isAuthenticated) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
  }

  static Future<bool> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isAuthenticated') ?? false;
  }
}
