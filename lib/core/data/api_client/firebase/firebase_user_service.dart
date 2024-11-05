import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_api_client_repository.dart';

class FirebaseUserService {
  final FirebaseApiClientRepository _clientRepository;

  FirebaseUserService(this._clientRepository);

  Future<Map<String, dynamic>> getUser(String id) {
    return _clientRepository.getUser(id);
  }

  Future<void> saveUser(Map<String, dynamic> userData) {
    return _clientRepository.saveUser(userData);
  }

  Future<Map<String, dynamic>> registerUser(String email, String password) {
    final userData = {
      'email': email,
      'password': password,
    };
    return _clientRepository.registerUser(userData);
  }

  Future<User?> authenticateUser(String email, String password) {
    return _clientRepository.authenticateUser(email, password);
  }
}
