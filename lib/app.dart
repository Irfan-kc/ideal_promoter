import 'package:flutter/material.dart';
import 'package:ideal_promoter/utils/providers.dart';
import 'package:ideal_promoter/view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...providers,
        // ...choppers,
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
