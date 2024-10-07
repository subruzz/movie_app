import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/auh_cubit/auth_cubit.dart';
import 'package:movie_app/cubit/auh_cubit/auth_state.dart';
import 'package:movie_app/utils/config/colors.dart';
import 'package:movie_app/utils/config/sized_boxes.dart';
import 'package:movie_app/view/common_widgets/messenger.dart';
import 'package:movie_app/view/signup/widgets/custom_button.dart';
import 'package:movie_app/view/signup/widgets/auth_choose_text.dart';
import 'package:movie_app/view/signup/widgets/auth_form.dart';

import '../common_widgets/loading.dart';
import '../home_screen/home_screen.dart';

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
                        'Log In',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Spacing.height20,
                      AuthForm(
                          isLogin: true,
                          formKey: _formKey,
                          nameController: _nameController,
                          passwordController: _passwordController,
                          onProfessionChanged: (profession) {}),
                      Spacing.height20,
                      CustomButton(
                        buttonText: 'Log In',
                        isLogin: true,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().loginUser(
                                _nameController.text.trim(),
                                _passwordController.text.trim());
                          }
                        },
                      ),
                      Spacing.height12,
                      const AuthChooseText(
                        isLogin: true,
                      )
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
