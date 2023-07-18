import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/chart_screen/chart_screen.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/home_screen.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/profile_screen.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/wallet_screen.dart';

class BottomNavProvider extends ChangeNotifier {
  Widget currentPage = const HomeScreen();
  int currentIndex = 3;
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
