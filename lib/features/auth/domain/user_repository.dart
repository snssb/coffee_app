import 'package:coffee_shop_app/features/auth/domain/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(String id);
  Future<void> registerUser(String mail, String password);
  Future<User?> authenticateUser(String mail, String password);
}
