import 'package:flutter/material.dart';
import 'package:movie_app/utils/config/colors.dart';
import 'package:movie_app/utils/config/sized_boxes.dart';
import 'package:movie_app/view/signup/widgets/auth_button.dart';
import 'package:movie_app/view/signup/widgets/auth_choose_text.dart';
import 'package:movie_app/view/signup/widgets/auth_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.layers_outlined,
                  color: AppColors.amber, size: 40),
              Spacing.height48,
              const Text(
                'Log In',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Spacing.height20,
              AuthForm(
                  isLogin: true,
                  formKey: _formKey,
                  onProfessionChanged: (profession) {}),
              Spacing.height20,
              AuthButton(
                isLogin: true,
                passwordController: _passwordController,
                nameController: _nameController,
                formKey: _formKey,
              ),
              Spacing.height12,
              const AuthChooseText(
                isLogin: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
