import 'package:flutter/material.dart';

import '../../../widget/height_and_width.dart';
import '../bottom_nav_screen/wallet_screen/widget/table_data.dart';
import '../bottom_nav_screen/widget/background_widget.dart';
import '../bottom_nav_screen/widget/graph.dart';

class PageViews extends StatelessWidget {
  const PageViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BackGroundWidget(
            isExpanded: true,
            column1: [
              KHeight(64),
              Text(
                'Page Views',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              KHeight(30),
            ],
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
