import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/BusinessVolume/business_volume_provider.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/DateCard/date_card_widget.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
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
  DateTime fromDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
    0,
    0,
    0,
    0,
  );

  DateTime toDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        Provider.of<BusinessVolumeProvider>(context, listen: false)
            .getAllBusinessVolume(context);
        Provider.of<GraphProvider>(context, listen: false)
            .getBusinessVolumeGraphData(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<GraphProvider, BusinessVolumeProvider>(
      builder: (context, graphProvider, businessVolumeProvider, _) {
        return Scaffold(
          body: BackGroundWidget(
            isExpanded: true,
            heading: 'Business Volume',
            column2: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const KHeight(20),
                graphProvider.isLoading
                    ? loader()
                    : graphProvider.bvGraphData == null
                        ? const Text("Data retrieval failed")
                        : GraphView(
                            title: 'Monhtly Business volume',
                            model: graphProvider.bvGraphData!,
                          ),
                const KHeight(16),
                DateCard(
                  onFromTap: () {
                    DateCard.selectDate(context, fromDate).then((value) {
                      fromDate = value!;
                      setState(() {});
                      Provider.of<BusinessVolumeProvider>(context,
                              listen: false)
                          .getAllBusinessVolume(
                        context,
                        fromDate: fromDate.toString().split(" ")[0],
                        toDate: toDate.toString().split(" ")[0],
                      );
                    });
                  },
                  onToTap: () {
                    DateCard.selectDate(context, toDate).then((value) {
                      toDate = value!;
                      setState(() {});
                      Provider.of<BusinessVolumeProvider>(context,
                              listen: false)
                          .getAllBusinessVolume(
                        context,
                        fromDate: fromDate.toString().split(" ")[0],
                        toDate: toDate.toString().split(" ")[0],
                      );
                    });
                  },
                  fromDate: fromDate.toString(),
                  toDate: toDate.toString(),
                ),
                const KHeight(16),
                businessVolumeProvider.isLoading
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: loader(),
                        ),
                      )
                    : businessVolumeProvider.businessVolumeData.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.all(28.0),
                            child: Center(child: Text("No data retrieved")),
                          )
                        : Expanded(
                            child: CustTableData(
                              isEarnings: false,
                              itemCount: businessVolumeProvider
                                  .businessVolumeData.length,
                              orderId: businessVolumeProvider.businessVolumeData
                                  .map((e) => e.refId ?? "#000")
                                  .toList(),
                              orderAmount: businessVolumeProvider
                                  .businessVolumeData
                                  .map((e) => e.earning!.orderAmount.toString())
                                  .toList(),
                              earningsAmount: businessVolumeProvider
                                  .businessVolumeData
                                  .map((e) =>
                                      e.earning!.promoterAmount.toString())
                                  .toList(),
                              orderStatus: businessVolumeProvider
                                  .businessVolumeData
                                  .map((e) => e.status ?? "NA")
                                  .toList(),
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
