import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_data.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/graph.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

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
    return  Consumer<GraphProvider>(
      builder: (context, graphProvider,_) {
        return Scaffold(
            body: BackGroundWidget(
                isExpanded: true,
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
                    ))
                  ],
                )));
      }
    );
  }
}
