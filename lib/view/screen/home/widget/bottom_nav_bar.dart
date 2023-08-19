import 'package:flutter/cupertino.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
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
        return SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomNavBarItem(
                  label: 'Home',
                  icon: CupertinoIcons.home,
                  currentIndex: bottomNavProvider.currentIndex,
                  defaultIndex: 0,
                ),
                BottomNavBarItem(
                  label: 'Earnings',
                  icon: CupertinoIcons.chart_bar_circle,
                  currentIndex: bottomNavProvider.currentIndex,
                  defaultIndex: 1,
                ),
                BottomNavBarItem(
                  label: 'Products',
                  icon: CupertinoIcons.cube_box,
                  currentIndex: bottomNavProvider.currentIndex,
                  defaultIndex: 2,
                ),
                BottomNavBarItem(
                  label: 'Profile',
                  icon: CupertinoIcons.profile_circled,
                  currentIndex: bottomNavProvider.currentIndex,
                  defaultIndex: 3,
                ),
              ],
            ),
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
    required this.label,
  });

  final int currentIndex;
  final int defaultIndex;
  final IconData icon;
  final String label;

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
              .onBarChanged(defaultIndex, context, false);
        },
        child: Column(
          children: [
            Icon(
              icon,
              size: 28,
              color: isSelected
                  ? AppColors.primaryColor
                  : const Color(0XFFD7DCE4), // Set selected item color
            ),
            Text(
              label,
              style: AppTextStyle.dataColumnText
                  .apply(color: isSelected ? AppColors.primaryColor : null),
            )
          ],
        ),
      );
    });
  }
}
