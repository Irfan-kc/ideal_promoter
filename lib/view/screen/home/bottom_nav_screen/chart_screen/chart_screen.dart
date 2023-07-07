import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        KHeight(52),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(CupertinoIcons.arrow_left),
              Text(
                'Select Your Product',
                style: AppTextStyle.body1Text,
              ),
              Icon(CupertinoIcons.search)
            ],
          ),
        ),
        KHeight(24),
        CategoryTile()
      ],
    );
  }
}
