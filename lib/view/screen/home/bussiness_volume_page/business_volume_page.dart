import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/BusinessVolume/business_volume_provider.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

import '../bottom_nav_screen/wallet_screen/widget/table_data.dart';
import '../bottom_nav_screen/widget/graph.dart';

class BusinessVolumePage extends StatefulWidget {
  const BusinessVolumePage({super.key});

  @override
  State<BusinessVolumePage> createState() => _BusinessVolumePageState();
}

class _BusinessVolumePageState extends State<BusinessVolumePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<BusinessVolumeProvider>(context, listen: false)
          .getAllBusinessVolume(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GraphProvider>(
      builder: (context, graphProvider, _) {
        return Scaffold(
          body: BackGroundWidget(
            isExpanded: true,
            heading: 'Business Volume',
            column2: Column(
              children: [
                const KHeight(20),
                GraphView(
                  title: 'Monhtly Business volume',
                  model: graphProvider.graphData!,
                ),
                const KHeight(16),
                 const Expanded(
                  child: CustTableData(
                    title: 'Monthly Business volume',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
