import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/auh_cubit/auth_cubit.dart';
import 'package:movie_app/cubit/auh_cubit/auth_state.dart';
import 'package:movie_app/utils/config/colors.dart';
import 'package:movie_app/utils/config/sized_boxes.dart';
import 'package:movie_app/view/common_widgets/loading.dart';
import 'package:movie_app/view/common_widgets/messenger.dart';
import 'package:movie_app/view/signup/widgets/custom_button.dart';
import 'package:movie_app/view/signup/widgets/auth_choose_text.dart';
import 'package:movie_app/view/signup/widgets/auth_form.dart';

import '../../model/user.dart';
import '../home_screen/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _profession;
  final List<String> _professions = ['Engineer', 'Doctor', 'Teacher', 'Other'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
        if (state is AuthFailure) {
          Messenger.showSnackBar(message: state.error);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
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
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Spacing.height20,
                      AuthForm(
                          nameController: _nameController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          phoneController: _phoneController,
                          profession: _profession,
                          formKey: _formKey,
                          professions: _professions,
                          onProfessionChanged: (profession) {}),
                      Spacing.height20,
                      CustomButton(
                        buttonText: 'Sign Up',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final user = User(
                                name: _nameController.text.trim(),
                                email: _nameController.text.trim(),
                                phoneNumber: _phoneController.text.trim(),
                                password: _passwordController.text.trim(),
                                profession: _profession ?? '');
                            context.read<AuthCubit>().registerUser(user);
                          }
                        },
                      ),
                      Spacing.height12,
                      const AuthChooseText()
                    ],
                  ),
                ),
              ),
            ),
            if (state is AuthLoading) const OverlayLoadingHolder()
          ],
        );
      },
    );
  }
}
