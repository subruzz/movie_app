import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../model/user.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Box<User> userBox;

  AuthCubit(this.userBox) : super(AuthInitial());

  Future<void> registerUser(User user) async {
    emit(AuthLoading());
    try {
      await userBox.put(user.name, user);
      emit(AuthSuccess('User registered successfully!'));
    } catch (e) {
      emit(AuthFailure('Registration failed: $e'));
    }
  }

  Future<void> loginUser(String name, String password) async {
    emit(AuthLoading());
    try {
      final user = userBox.get(name);
      if (user != null && user.password == password) {
        emit(AuthSuccess('Login successful!'));
      } else {
        emit(AuthFailure('Invalid credentials'));
      }
    } catch (e) {
      emit(AuthFailure('Login failed: $e'));
    }
  }
}
