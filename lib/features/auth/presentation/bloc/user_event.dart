abstract class UserEvent {}

class RegisterUser extends UserEvent {
  final String email;
  final String password;

  RegisterUser(
    this.email,
    this.password,
  );

  @override
  bool operator ==(covariant RegisterUser other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;

  @override
  String toString() => 'RegisterUser(email: $email, password: $password)';
}

class LoginUser extends UserEvent {
  final String email;
  final String password;

  LoginUser(
    this.email,
    this.password,
  );

  @override
  bool operator ==(covariant LoginUser other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

class LogoutUser extends UserEvent {
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is LogoutUser;
}
