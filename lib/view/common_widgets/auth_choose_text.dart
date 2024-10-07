import 'package:flutter/material.dart';
import 'package:movie_app/utils/config/colors.dart';
import 'package:movie_app/view/login/login_screen.dart';
import 'package:movie_app/view/signup/signup_screen.dart';

class AuthChooseText extends StatelessWidget {
  const AuthChooseText({super.key, this.isLogin = false});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          isLogin
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                )
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: isLogin
                    ? 'Don\'t have an account? '
                    : 'Already have an account? ',
                style: const TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: isLogin ? 'Sign Up' : 'Login',
                style: const TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
