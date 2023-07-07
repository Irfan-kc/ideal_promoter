import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/dashboard_card.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/name_card.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/graph.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/suggested_grid_view.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

import 'widget/graph.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const KHeight(52),
            const NameCard(),
            const KHeight(13),
            const DashBoardCard(),
            const KHeight(12),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const KHeight(20),
                  const GraphView(),
                  const SizedBox(width: 350, child: LineChartSample2()),
                  const KHeight(16),
                  Row(
                    children: [
                      const KWidth(20),
                      RichText(
                          text: const TextSpan(
                              text: 'You got ',
                              style: TextStyle(
                                  color: Color(0xFFFF7448),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              children: [
                            TextSpan(
                                text: '34 Page views',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFF7448),
                                    decoration: TextDecoration.underline))
                          ]))
                    ],
                  ),
                  const KHeight(9),
                  const CategoryTile(),
                  const KHeight(12),
                  const SuggestedGridView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
