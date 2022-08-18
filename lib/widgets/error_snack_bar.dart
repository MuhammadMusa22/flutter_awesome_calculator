import 'package:flutter/material.dart';

class ErrorSnackBar {
  static bool isShown = false;

  static showSnackBar(
      {required String message, required BuildContext context}) {
    if (!isShown) {
      isShown = true;
      return ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              message,
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      )
          .closed
          .then((value) {
        isShown = false;
      });
    }
  }
}