import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Authentication/auth_provider.dart';
import 'package:ideal_promoter/view/screen/home/home.dart';
import 'package:ideal_promoter/view/screen/login/login_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      if (Provider.of<AuthProvider>(context, listen: false).isSigned == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Home()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginPage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
