import 'package:flutter/material.dart';
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
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                )
              : Navigator.pop(context);
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
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
