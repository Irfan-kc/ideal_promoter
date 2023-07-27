import 'package:flutter/material.dart';

warningSnackBar({
  required String message,
  int duration = 1,
  required BuildContext context,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: duration),
    content: Text(
      message,
    ),
    backgroundColor: Colors.orange,
  ));
}
