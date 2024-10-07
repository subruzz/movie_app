import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Box<User> userBox;

  AuthCubit(this.userBox) : super(AuthInitial());

  static const String isLoggedInKey = 'isLoggedIn';

  Future<void> registerUser(User user) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2));

    try {
      await userBox.put(user.name, user);

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
      final user = userBox.get(name);
      if (user != null && user.password == password) {
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
