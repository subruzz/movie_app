import 'package:flutter/material.dart';
import 'package:movie_app/utils/config/sized_boxes.dart';
import 'package:movie_app/utils/validators/form_validator.dart';
import 'package:movie_app/view/common_widgets/text_field.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? phoneController;
  final String? profession;
  final List<String>? professions;
  final Function(String?)? onProfessionChanged;
  final GlobalKey<FormState> formKey;

  final bool isLogin;
  const AuthForm({
    required this.formKey,
    super.key,
    this.isLogin = false,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.phoneController,
    this.professions,
    required this.onProfessionChanged,
    this.profession,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Name',
            validator: Validator.validateName,
            controller: nameController,
          ),
          if (!isLogin) Spacing.height12,
          if (!isLogin)
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              label: 'E-mail',
              validator: Validator.validateEmail,
              controller: emailController,
            ),
          Spacing.height12,
          CustomTextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            label: 'Password',
            validator: Validator.validatePassword,
            controller: passwordController,
          ),
          if (!isLogin) Spacing.height12,
          if (!isLogin)
            CustomTextField(
              keyboardType: TextInputType.phone,
              label: 'Phone Number',
              validator: Validator.validatePhone,
              controller: phoneController,
            ),
          if (!isLogin) Spacing.height12,
          if (!isLogin)
            DropdownButtonFormField<String>(
              value: profession,
              decoration: const InputDecoration(
                labelText: 'Profession',
                border: UnderlineInputBorder(),
              ),
              items: professions!.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              validator: (value) =>
                  value == null ? 'Please select your profession' : null,
              onChanged: onProfessionChanged,
            ),
        ],
      ),
    );
  }
}
