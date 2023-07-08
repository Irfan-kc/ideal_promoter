import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/chart_screen/widget/app_bar.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/suggested_grid_view.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

import '../../../../../constant/text_style.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustAppBar(),
        KHeight(14),
        CategoryTile(),
        KHeight(12),
        Expanded(
            child: GridViewData(
          isScrollable: true,
          isExpanded: true,
          title: 'Product',
          isShowViewAll: false,
        )),
      ],
    );
  }
}
