import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';

import '../../../widget/height_and_width.dart';
import '../bottom_nav_screen/wallet_screen/widget/table_data.dart';
import '../bottom_nav_screen/widget/graph.dart';

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BackGroundWidget(
            isExpanded: true,
            heading: 'Earnings',
            column2: Column(
              children: [
                KHeight(20),
                GraphView(
                  title: 'Monthly Earnings',
                ),
                KHeight(16),
                Expanded(
                    child: CustTableData(
                  title: 'Monthly Earnings',
                ))
              ],
            )));
  }
}