// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movie_app/utils/config/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isLogin = false,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    required this.buttonText,
    this.height,
  });
  final bool isLogin;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final String buttonText;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: textColor ?? Colors.black),
        ),
      ),
    );
  }
}
