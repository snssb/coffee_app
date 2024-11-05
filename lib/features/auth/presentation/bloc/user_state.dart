import 'package:firebase_auth/firebase_auth.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserAuthenticated extends UserState {
  final User user;

  UserAuthenticated(this.user);

  UserAuthenticated copyWith({User? user}) {
    return UserAuthenticated(user ?? this.user);
  }
}

class UserUnauthenticated extends UserState {}

class UserAuthFailure extends UserState {
  final String error;

  UserAuthFailure(this.error);
}
