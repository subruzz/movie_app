import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user.dart';
import '../../services/hive_services.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserService userService; // Use UserService instead of Box<User>

  AuthCubit(this.userService) : super(AuthInitial());

  static const String isLoggedInKey = 'isLoggedIn';

  Future<void> registerUser(User user) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2));
    log('user name is ${user.name}');
    try {
      bool userExists = await userService.userExists(user.name, user.password);
      if (userExists) {
        return emit(
            AuthFailure('Account already exists. Please try to login!'));
      }
      await userService.addUser(user);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(isLoggedInKey, true);

      emit(AuthSuccess('User registered successfully!'));
    } catch (e) {
      emit(AuthFailure('Registration failed: $e'));
    }
  }

  Future<void> loginUser(String name, String password) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2));

    try {
      final user = await userService.getUser(name, password);
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(isLoggedInKey, true);

        emit(AuthSuccess('Login successful!'));
      } else {
        emit(AuthFailure('Invalid credentials'));
      }
    } catch (e) {
      emit(AuthFailure('Login failed: $e'));
    }
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(isLoggedInKey) ?? false;

    if (isLoggedIn) {
      emit(AuthSuccess('User is already logged in.'));
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> logoutUser() async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(isLoggedInKey);
    emit(AuthInitial());
  }
}
