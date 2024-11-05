import 'package:coffee_shop_app/core/data/local_storage/session_manager.dart';
import 'package:coffee_shop_app/features/auth/domain/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<RegisterUser>(_onRegisterUser);
    on<LoginUser>(_onLoginUser);
    on<LogoutUser>(_onLogoutUser);
  }

  Future<void> _onRegisterUser(
      RegisterUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      await userRepository.registerUser(
        event.email,
        event.password,
      );
    } catch (e) {
      emit(UserAuthFailure('Registration failed: ${e.toString()}'));
    }
  }

  Future<void> _onLoginUser(LoginUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user =
          await userRepository.authenticateUser(event.email, event.password);
      if (user != null) {
        await SessionManager.setSession(true);
        emit(UserAuthenticated(user));
      }
    } catch (e) {
      emit(UserAuthFailure('Login failed: ${e.toString()}'));
    }
  }

  Future<void> _onLogoutUser(LogoutUser event, Emitter<UserState> emit) async {
    try {
      emit(UserUnauthenticated());
    } catch (e) {
      emit(UserAuthFailure('Logout failed: ${e.toString()}'));
    }
  }
}
