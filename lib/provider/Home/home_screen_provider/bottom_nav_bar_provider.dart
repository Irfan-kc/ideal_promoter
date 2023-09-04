import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Category/category_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/chart_screen/chart_screen.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/home_screen.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/profile_screen.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/wallet_screen.dart';
import 'package:provider/provider.dart';

class BottomNavProvider extends ChangeNotifier {
  Widget currentPage = const HomeScreen();
  int currentIndex = 0;
  PreferredSize? appBar;
  bool isFromHome = true;

  List<Widget> pageBucket = [
    const HomeScreen(),
    const WalletScreen(),
    const ChartScreen(),
    const ProfileScreen()
  ];

  onBarChanged(int index, BuildContext context, bool isNavFromHome) {
    if (index == 2 && !isFromHome) {
      Provider.of<CategoryProvider>(context, listen: false)
          .clearSubCategoryList();
    }
    isFromHome = isNavFromHome;
    currentIndex = index;
    currentPage = pageBucket[index];
    notifyListeners();
  }
}
