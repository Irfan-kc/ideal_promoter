import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_data.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/graph.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';

class EarningsPage extends StatefulWidget {
  const EarningsPage({super.key});

  @override
  State<EarningsPage> createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> {


  @override
  void initState() {
    super.initState();
  }

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
