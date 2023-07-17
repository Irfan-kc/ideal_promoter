import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_row.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class CustTableData extends StatelessWidget {
  const CustTableData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Monthly Earnings',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.195),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.primaryColor),
                  child: const Center(
                    child: Icon(
                      Icons.tune_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
        const KHeight(16),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: CustTableRow(
              textStyle: false,
            )),
        const KHeight(4),
        Expanded(
          // height: 100,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
            itemCount:
                15, // Replace with the actual number of items in your data
            itemBuilder: (BuildContext context, int index) {
              return const Column(
                children: [
                  SizedBox(
                    height: 34,
                    child: Center(
                      child: CustTableRow(
                        orderId: '#001',
                        orderAmount: '200',
                        earningsAmount: '800',
                        orderStatus: 'Delivered',
                      ),
                    ),
                  ),
                ],
              );
              // SizedBox(
              //   height: 34,
              //   child: Row(
              //     children: [
              //       Expanded(
              //           flex: 2,
              //           child: Text(
              //             '#00$index',
              //             style: const TextStyle(
              //                 fontSize: 11,
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w400,
              //                 letterSpacing: -0.14),
              //           )),
              //       const Expanded(
              //           flex: 3,
              //           child: Text(
              //             '300',
              //             style: TextStyle(
              //                 fontSize: 11,
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w400,
              //                 letterSpacing: -0.14),
              //           )),
              //       const Expanded(
              //           flex: 3,
              //           child: Text(
              //             '800',
              //             style: TextStyle(
              //                 fontSize: 11,
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w400,
              //                 letterSpacing: -0.14),
              //           )),
              //       const Expanded(
              //           flex: 2,
              //           child: Text(
              //             'Delivered',
              //             style: TextStyle(
              //                 fontSize: 11,
              //                 color: Color(0xFF35C069),
              //                 fontWeight: FontWeight.w400,
              //                 letterSpacing: -0.14),
              //           )),
              //     ],
              //   ),
              // );
            },
          ),
        )
      ],
    );
  }
}