import 'package:flutter/material.dart';
import 'package:ideal_promoter/View/screen/home/bottom_nav_screen/widget/graph.dart';
import 'package:ideal_promoter/View/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';

import '../bottom_nav_screen/wallet_screen/widget/table_data.dart';

class PageViews extends StatelessWidget {
  const PageViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BackGroundWidget(
            isExpanded: true,
            heading: 'Page Views',
            column2: Column(
              children: [
                KHeight(20),
                GraphView(
                  title: 'Page views',
                ),
                KHeight(16),
                Expanded(
                    child: CustTableData(
                  title: 'Page views',
                ))
              ],
            )));
  }
}
