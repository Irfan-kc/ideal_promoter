import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_data.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

import '../../widget/background_widget.dart';
import '../widget/graph.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GraphProvider>(builder: (context, graphProvider, _) {
      return BackGroundWidget(
        isExpanded: true,
        backButton: false,
        heading: 'Earnings',
        column2: Column(
          children: [
            const KHeight(20),
            GraphView(
              title: 'Monthly Earnings',
              model: graphProvider.graphData!,
            ),
            const KHeight(16),
            const Expanded(
              child: CustTableData(
                title: 'Monthly Earnings',
              ),
            ),
          ],
        ),
      );
    });
  }
}
