import 'package:firebase_auth/firebase_auth.dart';

abstract class ApiClientRepository {
  Future<Map<String, dynamic>> getUser(String id);
  Future<void> saveUser(Map<String, dynamic> userData);
  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> userData);
  Future<User?> authenticateUser(String email, String password);
}
