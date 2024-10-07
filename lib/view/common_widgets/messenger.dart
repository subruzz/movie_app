import 'package:flutter/material.dart';
import 'package:movie_app/utils/config/colors.dart';

class Messenger {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar({
    String message = 'An unexpected error occurred, please try again!',
  }) {
    scaffoldKey.currentState!.clearSnackBars();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        duration: const Duration(milliseconds: 4000),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.amber,
        margin: const EdgeInsets.only(
            right: 20, left: 20, top: 30, bottom: 20), // Adjust top margin
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white.withOpacity(.8),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
