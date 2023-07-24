import 'package:flutter/material.dart';

import '../../../widget/height_and_width.dart';
import '../bottom_nav_screen/wallet_screen/widget/table_data.dart';
import '../widget/background_widget.dart';
import '../bottom_nav_screen/widget/graph.dart';

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
