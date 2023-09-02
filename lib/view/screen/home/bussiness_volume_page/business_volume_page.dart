import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/BusinessVolume/business_volume_provider.dart';
import 'package:ideal_promoter/provider/Dashboard/dashboard_provider.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_row.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/DateCard/date_card_widget.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

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

  DateTime getLastDateOfCurrentMonth() {
    final now = DateTime.now();
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    return lastDayOfMonth;
  }

  @override
  void initState() {
    super.initState();
    toDate = getLastDateOfCurrentMonth();
    Future.delayed(
      Duration.zero,
      () async {
        Provider.of<BusinessVolumeProvider>(context, listen: false)
            .getAllBusinessVolume(
          context,
          fromDate: fromDate.toString().split(" ")[0],
          toDate: toDate.toString().split(" ")[0],
        );
        Provider.of<GraphProvider>(context, listen: false)
            .getBusinessVolumeGraphData(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<GraphProvider, BusinessVolumeProvider, DashboardProvider>(
      builder: (context, graphProvider, businessVolumeProvider,
          dashboardProvider, _) {
        return Scaffold(
          body: BackGroundWidget(
            isExpanded: true,
            heading: 'Business Volume',
            column2: Column(
              children: [
                const KHeight(20),
                graphProvider.isLoading
                    ? loader()
                    : graphProvider.bvGraphData == null
                        ? const Center(child: Text("No Data"))
                        : GraphView(
                            title: 'Monhtly Business volume',
                            model: graphProvider.bvGraphData!,
                            selectedYValue: dashboardProvider
                                    .dashboardData!.totalBusinessVolumeAmount ??
                                0.0,
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 36,
                  color: const Color(0xffF5FBFF),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: CustTableRow(
                      length: 4,
                      label: [
                        'Ref Id',
                        'Order Amount',
                        'BV Amount',
                        'Order Status'
                      ],
                      flex: [2, 3, 3, 2],
                      color: [
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black
                      ],
                      textStyle: true,
                    ),
                  ),
                ),
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
                            child: Center(
                                child:
                                    Text("No Business Volume in this period")),
                          )
                        : Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              itemCount: businessVolumeProvider
                                  .businessVolumeData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: CustTableRow(
                                    length: 4,
                                    label: [
                                      businessVolumeProvider
                                              .businessVolumeData[index]
                                              .refId ??
                                          '',
                                      "₹${businessVolumeProvider.businessVolumeData[index].earning!.orderAmount}",
                                      "₹${businessVolumeProvider.businessVolumeData[index].amount}",
                                      businessVolumeProvider
                                              .businessVolumeData[index]
                                              .status ??
                                          ''
                                    ],
                                    flex: const [2, 3, 3, 2],
                                    color: [
                                      Colors.black,
                                      Colors.black,
                                      Colors.black,
                                      CustTableRow.getStatusTypeColor(
                                          businessVolumeProvider
                                              .businessVolumeData[index]
                                              .status!)!,
                                    ],
                                    textStyle: false,
                                  ),
                                );
                              },
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
