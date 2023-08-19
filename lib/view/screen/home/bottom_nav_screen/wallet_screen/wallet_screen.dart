import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Earnings/earnings_provider.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_data.dart';
import 'package:ideal_promoter/view/widget/DateCard/date_card_widget.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
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
    return Consumer2<GraphProvider, EarningsProvider>(
        builder: (context, graphProvider, earningsProvider, _) {
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
            // earningsProvider.isLoading
            //     ? Center(
            //         child: Padding(
            //           padding: const EdgeInsets.all(28.0),
            //           child: loader(),
            //         ),
            //       )
            //     : earningsProvider.earningsData.isEmpty
            //         ? const Padding(
            //             padding: EdgeInsets.all(28.0),
            //             child: Center(child: Text("No data retrieved")),
            //           )
            //         : Expanded(
            //             child: CustTableData(
            //               isEarnings: true,
            //               itemCount: earningsProvider.earningsData.length,
            //               orderId: earningsProvider.earningsData.map((e) {
            //                 if (e.order == null) {
            //                   return "#000";
            //                 }
            //                 return e.order!.orderId ?? "#000";
            //               }).toList(),
            //               orderAmount: earningsProvider.earningsData
            //                   .map((e) => e.orderAmount.toString())
            //                   .toList(),
            //               earningsAmount: earningsProvider.earningsData
            //                   .map((e) => e.promoterAmount.toString())
            //                   .toList(),
            //               orderStatus: earningsProvider.earningsData.map((e) {
            //                 if (e.order == null) {
            //                   return "NA";
            //                 }
            //                 return e.order!.orderStatus ?? "NA";
            //               }).toList(),
            //             ),
            //           ),
          ],
        ),
      );
    });
  }
}
