import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/chart_screen/widget/app_bar.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/suggested_grid_view.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustAppBar(),
        const KHeight(14),
        const CategoryTile(),
        const KHeight(12),
        Expanded(
            child: GridViewData(
          isExpanded: true,
          title: 'Product',
          isScrollExtents: (page) async {
            await Provider.of<ProductProvider>(context, listen: false)
                .getAllProducts(context, page: page);
          },
        )),
      ],
    );
  }
}
