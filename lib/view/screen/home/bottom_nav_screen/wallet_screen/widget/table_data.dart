import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_row.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';

class CustTableData extends StatelessWidget {
  final bool isLoading;
  final bool isEarnings;
  final int itemCount;
  final List<String> orderId;
  final List<String> orderAmount;
  final List<String> earningsAmount;
  final List<String> orderStatus;

  const CustTableData({
    super.key,
    required this.isLoading,
    this.isEarnings = false,
    required this.itemCount,
    required this.orderId,
    required this.orderAmount,
    required this.earningsAmount,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 36,
          color: const Color(0xffF5FBFF),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                const CustTableCell(
                  text: 'Order Id',
                  flex: 2,
                  textStyle: false,
                ),
                const CustTableCell(
                  text: 'Order Amount',
                  flex: 3,
                  textStyle: false,
                ),
                CustTableCell(
                  text: isEarnings ? 'Earnings Amount' : 'BV Amount',
                  flex: 3,
                  textStyle: false,
                ),
                const CustTableCell(
                  text: 'Order Status',
                  flex: 2,
                  // color: AppColors.green,
                  textStyle: false,
                ),
              ],
            ),
          ),
        ),
        isLoading
            ? loader()
            : Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  itemCount: itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 34,
                          child: Center(
                            child: CustTableRow(
                                color: getStatusTypeColor(orderStatus[index]),
                                orderId: orderId[index],
                                orderAmount: orderAmount[index],
                                earningsAmount: earningsAmount[index],
                                orderStatus: orderStatus[index]),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      ],
    );
  }

  static Color? getStatusTypeColor(String statusId) {
    Color? statusColor;
    if (statusId == "Delivered") {
      statusColor = AppColors.green;
    } else if (statusId == "Processing") {
      statusColor = const Color(0xff40CCEB);
    } else if (statusId == "pending") {
      statusColor = AppColors.warning;
    } else if (statusId == "Cancelled") {
      statusColor = Colors.red[800];
    } else {
      statusColor = AppColors.black;
    }
    return statusColor;
  }
}
