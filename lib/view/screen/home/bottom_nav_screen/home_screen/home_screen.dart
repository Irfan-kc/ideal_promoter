import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/dashboard_card.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/name_card.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/suggested_grid_view.dart';
import 'package:ideal_promoter/view/screen/home/page_views/page_views.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

import '../widget/graph.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      column1: const [
        KHeight(52),
        NameCard(),
        KHeight(13),
        DashBoardCard(),
        KHeight(12),
      ],
      column2: Column(
        children: [
          const KHeight(20),
          // const GraphView(),
          const GraphView(
            title: 'Monthly Earnings',
          ),
          const KHeight(16),
          Row(
            children: [
              const KWidth(20),
              const Text(
                'You got ',
                style: TextStyle(
                    color: Color(0xFFFF7448),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PageViews()));
                },
                child: const Text('34 Page views',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF7448),
                        decoration: TextDecoration.underline)),
              )
            ],
          ),
          const KHeight(9),
          const CategoryTile(),
          const KHeight(12),
          const GridViewData(title: 'Suggested for you'),
        ],
      ),
    );
  }
}
