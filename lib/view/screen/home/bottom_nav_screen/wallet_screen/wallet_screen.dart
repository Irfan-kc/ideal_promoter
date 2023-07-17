import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_data.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/background_widget.dart';

import '../../../../widget/height_and_width.dart';
import '../widget/graph.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackGroundWidget(
      column1: [
        KHeight(64),
        Text(
          'Earnings',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        KHeight(30),
      ],
      column2: Column(
        children: [
          KHeight(20),
          // const GraphView(),
          GraphView(),
          KHeight(16),
          CustTableData()
        ],
      ),
    );
  }
}
