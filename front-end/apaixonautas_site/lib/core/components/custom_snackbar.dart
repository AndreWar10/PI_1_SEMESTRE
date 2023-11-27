import 'package:flutter/material.dart';

class CustomSnackbar {
  static void snackBarOf({
    required String text,
    required bool isError,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isError ? Colors.red : const Color(0xFF2E7D32),
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
