import 'package:coffee_shop_app/core/data/api_client/firebase/firebase_user_service.dart';
import 'package:coffee_shop_app/features/auth/data/user_model.dart';
import 'package:coffee_shop_app/features/auth/domain/user_entity.dart';
import 'package:coffee_shop_app/features/auth/domain/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseUserService _userService;

  UserRepositoryImpl(this._userService);

  @override
  Future<UserEntity> getUser(String id) async {
    final userData = await _userService.getUser(id);
    final userModel = UserModel.fromJson(userData);
    return _mapModelToEntity(userModel);
  }

  Future<void> saveUser(UserEntity user) async {
    final userModel = _mapEntityToModel(user);
    await _userService.saveUser(userModel.toJson());
  }

  @override
  Future<Map<String, dynamic>> registerUser(
      String email, String password) async {
    final user = await _userService.registerUser(email, password);
    return user;
  }

  @override
  Future<User?> authenticateUser(String email, String password) async {
    final user = await _userService.authenticateUser(email, password);
    return user;
  }

  UserEntity _mapModelToEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
    );
  }

  UserModel _mapEntityToModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }
}
