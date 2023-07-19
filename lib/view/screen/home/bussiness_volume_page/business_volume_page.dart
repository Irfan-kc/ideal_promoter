import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/background_widget.dart';

import '../../../widget/height_and_width.dart';
import '../bottom_nav_screen/wallet_screen/widget/table_data.dart';
import '../bottom_nav_screen/widget/graph.dart';

class BusinessVolumePage extends StatelessWidget {
  const BusinessVolumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BackGroundWidget(
            isExpanded: true,
            column1: [
              KHeight(64),
              Text(
                'Business Volume',
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
                  title: 'Monhtly Business volume',
                ),
                KHeight(16),
                Expanded(
                    child: CustTableData(
                  title: 'Monthly Business volume',
                ))
              ],
            )));
  }
}
