import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Dashboard/dashboard_provider.dart';
import 'package:ideal_promoter/provider/Earnings/earnings_provider.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_row.dart';
import 'package:ideal_promoter/view/widget/DateCard/date_card_widget.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../widget/background_widget.dart';
import '../widget/graph.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
        await Provider.of<EarningsProvider>(context, listen: false)
            .getAllEarnings(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<GraphProvider, EarningsProvider, DashboardProvider>(
        builder:
            (context, graphProvider, earningsProvider, dashboardProvider, _) {
      return BackGroundWidget(
        isExpanded: true,
        backButton: false,
        heading: 'Earnings',
        column2: Column(
          children: [
            const KHeight(20),
            graphProvider.isLoading
                ? loader()
                : graphProvider.earningsGraphData == null
                    ? const Text("Data retrieval failed")
                    : GraphView(
                        title: 'Monthly Earnings',
                        model: graphProvider.earningsGraphData!,
                        selectedYValue: dashboardProvider
                                .dashboardData!.totalEarningsAmount ??
                            0.0,
                      ),
            const KHeight(16),
            DateCard(
              onFromTap: () {
                DateCard.selectDate(context, fromDate).then((value) {
                  fromDate = value!;
                  setState(() {});
                  Provider.of<EarningsProvider>(context, listen: false)
                      .getAllEarnings(
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
                  Provider.of<EarningsProvider>(context, listen: false)
                      .getAllEarnings(
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
                    'Date',
                    'Ref Id',
                    // 'Order Amount',
                    'Amount',
                    'Order Status'
                  ],
                  flex: [
                    1,
                    1,
                    1,
                    1,
                  ],
                  color: [
                    Colors.black,
                    Colors.black,
                    // Colors.black,
                    Colors.black,
                    Colors.black
                  ],
                  textStyle: true,
                ),
              ),
            ),
            earningsProvider.isLoading
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: loader(),
                    ),
                  )
                : earningsProvider.earningsData.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.all(28.0),
                        child: Center(child: Text("No data retrieved")),
                      )
                    : Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 0),
                          itemCount: earningsProvider.earningsData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: CustTableRow(
                                length: 4,
                                label: [
                                  DateFormat("yyyy-MM-dd").format(
                                      earningsProvider
                                          .earningsData[index].createdAt!),
                                  earningsProvider.earningsData[index].order !=
                                          null
                                      ? earningsProvider.earningsData[index]
                                              .order!.orderId ??
                                          ''
                                      : '',
                                  // earningsProvider
                                  //     .earningsData[index].orderAmount
                                  //     .toString(),
                                  earningsProvider
                                      .earningsData[index].promoterAmount
                                      .toString(),
                                  earningsProvider.earningsData[index].order !=
                                          null
                                      ? earningsProvider.earningsData[index]
                                              .order!.orderStatus ??
                                          ''
                                      : ''
                                ],
                                flex: const [
                                  1,
                                  1,
                                  1,
                                  1,
                                ],
                                color: [
                                  Colors.black,
                                  Colors.black,
                                  Colors.black,
                                  // Colors.black,
                                  // Colors.black,

                                  earningsProvider.earningsData[index].order !=
                                          null
                                      ? CustTableRow.getStatusTypeColor(
                                          earningsProvider.earningsData[index]
                                              .order!.orderStatus!)!
                                      : Colors.black,
                                ],
                                textStyle: false,
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      );
    });
  }
}
