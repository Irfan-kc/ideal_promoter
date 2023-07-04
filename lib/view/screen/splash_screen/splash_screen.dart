import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/login_page/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginPage())));
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            'ideal e shope',
            style: TextStyle(
              color: Color(0xFF4274D4),
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
