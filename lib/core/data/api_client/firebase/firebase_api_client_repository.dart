import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_shop_app/core/data/api_client/api_client_repository.dart';

class FirebaseApiClientRepository implements ApiClientRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseApiClientRepository(this._auth, this._firestore);

  @override
  Future<Map<String, dynamic>> getUser(String id) async {
    try {
      final doc = await _firestore.collection('users').doc(id).get();
      if (!doc.exists) {
        throw Exception('User not found');
      }
      return doc.data()!;
    } catch (e) {
      throw Exception('Error fetching user data: $e');
    }
  }

  @override
  Future<void> saveUser(Map<String, dynamic> userData) async {
    try {
      final id = userData['id'] as String;
      await _firestore.collection('users').doc(id).set(userData);
    } catch (e) {
      throw Exception('Error saving user data: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> registerUser(
      Map<String, dynamic> userData) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: userData['email'],
        password: userData['password'],
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print('Error registering user: $e');
    }

    return userData;
  }

  @override
  Future<User?> authenticateUser(String email, String password) async {
    try {
      // Вход с email и паролем
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Возвращаем пользователя при успешном входе
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided.');
      } else {
        throw Exception('Error logging in: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }
}
