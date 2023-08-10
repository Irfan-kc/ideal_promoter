import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Home/home_screen_provider/bottom_nav_bar_provider.dart';
import 'package:ideal_promoter/view/screen/home/widget/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavProvider(),
      child: Consumer<BottomNavProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: Container(child: provider.pageBucket[provider.currentIndex]),
            bottomNavigationBar: const BottomNavBarWidget(),
          );
        },
      ),
    );
  }
}
