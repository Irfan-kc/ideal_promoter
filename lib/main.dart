import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/sign_up_page/sign_up_page.dart';
import 'package:ideal_promoter/view/screen/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ideal promoter',
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      home: const SplashScreen(),
    );
  }
}
