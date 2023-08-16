import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_row.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class PageViews extends StatelessWidget {
  const PageViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GraphProvider>(builder: (context, graphProvider, _) {
      return  Scaffold(
          body: BackGroundWidget(
              isExpanded: true,
              heading: 'Page Views',
              column2: Column(
                children: [
                  const KHeight(20),
                  Expanded(
                    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 36,
          color: const Color(0xffF5FBFF),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                CustTableCell(
                  text: 'Ref Id',
                  flex: 2,
                  textStyle: false,
                ),
                CustTableCell(
                  text: 'Name',
                  flex: 3,
                  textStyle: false,
                ),
                CustTableCell(
                  text: 'Price',
                  flex: 3,
                  textStyle: false,
                ),
                CustTableCell(
                  text: 'Offer Price',
                  flex: 2,
                  color: AppColors.green,
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
                                orderId: ,
                                orderAmount: ,
                                earningsAmount: ,
                                orderStatus: ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      ],
    ),
                  ),
                ],
              ),),);
    },);
  }
}
