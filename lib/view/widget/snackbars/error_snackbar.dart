import 'package:flutter/material.dart';

errorSnackBar({
  required String message,
  int duration = 2,
  required BuildContext context,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: duration),
      content: Text(
        message,
      ),
      backgroundColor: Colors.red[900],
    ),
  );
}
