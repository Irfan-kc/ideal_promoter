import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:provider/provider.dart';

import '../../../../provider/Home/home_screen_provider/bottom_nav_bar_provider.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, _) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavBarItem(
                icon: CupertinoIcons.home,
                currentIndex: bottomNavProvider.currentIndex,
                defaultIndex: 0,
              ),
              BottomNavBarItem(
                icon: Icons.wallet_outlined,
                currentIndex: bottomNavProvider.currentIndex,
                defaultIndex: 1,
              ),
              BottomNavBarItem(
                icon: CupertinoIcons.chart_bar_circle,
                currentIndex: bottomNavProvider.currentIndex,
                defaultIndex: 2,
              ),
              BottomNavBarItem(
                icon: CupertinoIcons.profile_circled,
                currentIndex: bottomNavProvider.currentIndex,
                defaultIndex: 3,
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.currentIndex,
    required this.defaultIndex,
    required this.icon,
  });

  final int currentIndex;
  final int defaultIndex;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == defaultIndex;

    return Consumer<BottomNavProvider>(builder: (
      context,
      bottomNavProvider,
      _,
    ) {
      return GestureDetector(
        onTap: () {
          Provider.of<BottomNavProvider>(context, listen: false)
              .onBarChanged(defaultIndex, context);
        },
        child: Column(
          children: [
            Icon(
              icon,
              size: 23,
              color: isSelected
                  ? AppColors.primaryColor
                  : const Color(0XFFD7DCE4), // Set selected item color
            ),
          ],
        ),
      );
    });
  }
}
