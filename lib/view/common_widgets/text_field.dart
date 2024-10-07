import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.label,
    required this.validator,
    this.controller,
    this.obscureText = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        border: const UnderlineInputBorder(),
      ),
      validator: validator,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
