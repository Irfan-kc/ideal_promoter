import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home_screen/bottom_nav_screen/chart_screen.dart';
import 'package:ideal_promoter/view/screen/home_screen/bottom_nav_screen/home_screen.dart';
import 'package:ideal_promoter/view/screen/home_screen/bottom_nav_screen/profile_screen.dart';
import 'package:ideal_promoter/view/screen/home_screen/bottom_nav_screen/wallet_screen.dart';

class BottomNavProvider extends ChangeNotifier {
  Widget currentPage = const HomeScreen();
  int currentIndex = 0;
  PreferredSize? appBar;

  List<Widget> pageBucket = const [
    HomeScreen(),
    WalletScreen(),
    ChartScreen(),
    ProfileScreen()
  ];

  onBarChanged(int index, BuildContext context) {
    currentIndex = index;
    currentPage = pageBucket[index];
    notifyListeners();
  }
}