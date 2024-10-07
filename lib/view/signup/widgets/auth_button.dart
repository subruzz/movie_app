import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/auh_cubit/auth_cubit.dart';
import 'package:movie_app/model/user.dart';
import 'package:movie_app/utils/config/colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      this.isLogin = false,
      required this.formKey,
      this.nameController,
      this.emailController,
      this.passwordController,
      this.phoneController,
      this.profession,
      this.onProfessionChanged});
  final bool isLogin;
  final GlobalKey<FormState> formKey;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? phoneController;
  final String? profession;
  final Function(String?)? onProfessionChanged;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.amber,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (isLogin) {
            context.read<AuthCubit>().loginUser(
                nameController?.text.trim() ?? '',
                passwordController?.text.trim() ?? '');
          } else {
            final user = User(
                name: nameController?.text.trim() ?? '',
                email: nameController?.text.trim() ?? '',
                phoneNumber: phoneController?.text.trim() ?? '',
                password: passwordController?.text.trim() ?? '',
                profession: profession ?? '');
            context.read<AuthCubit>().registerUser(user);
          }
        }
      },
      child: Text(
        isLogin ? 'Log In' : 'Sign Up',
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
