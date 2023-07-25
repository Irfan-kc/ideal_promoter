import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/signup_page/signup_page_provider.dart';
import 'package:ideal_promoter/view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SignUpPageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ideal promoter',
        theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
