import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/chart_screen/widget/app_bar.dart';

import '../../../widget/height_and_width.dart';
import '../bottom_nav_screen/widget/suggested_grid_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustAppBar(),
          KHeight(14),
          // CategoryTile(),
          // KHeight(12),
          Expanded(
              child: GridViewData(
            isExpanded: true,
            title: 'Product',
            isShowViewAll: false,
          )),
        ],
      ),
    );
  }
}
