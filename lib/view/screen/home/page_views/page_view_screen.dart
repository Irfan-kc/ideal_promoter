import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/provider/PageView/page_view_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_row.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class PageViewsScreen extends StatefulWidget {
  const PageViewsScreen({super.key});

  @override
  State<PageViewsScreen> createState() => _PageViewsScreenState();
}

class _PageViewsScreenState extends State<PageViewsScreen> {
  final ScrollController controller = ScrollController();

  int page = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await Provider.of<PageViewProvider>(context, listen: false)
            .getAllPageViews(context);
        controller.addListener(_scrollListener);
      },
    );
  }

  void _scrollListener() {
    if (controller.position.maxScrollExtent == controller.offset) {
      setState(() {
        page++;
      });
      Provider.of<PageViewProvider>(context, listen: false)
          .getAllPageViews(context, page: page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageViewProvider>(
      builder: (context, pageViewProvider, _) {
        return Scaffold(
          body: BackGroundWidget(
            isExpanded: true,
            heading: 'Page Views',
            column2: Column(
              children: [
                const KHeight(40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Page Views',
                          style: AppTextStyle.textFieldText,
                        ),
                      ),
                      const KHeight(20),
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
                                flex: 4,
                                textStyle: false,
                              ),
                              CustTableCell(
                                text: 'Price',
                                flex: 2,
                                textStyle: false,
                              ),
                              CustTableCell(
                                text: 'Offer Price',
                                flex: 2,
                                textStyle: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      pageViewProvider.isLoading
                          ? loader()
                          : pageViewProvider.pageViewData.isEmpty
                              ? const Padding(
                                padding: EdgeInsets.all(28.0),
                                child: Center(child: Text("No data retrieved")),
                              )
                              : Expanded(
                                  child: ListView.builder(
                                    controller: controller,
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 0),
                                    itemCount:
                                        pageViewProvider.pageViewData.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: 34,
                                            child: Center(
                                              child: CustTableRow(
                                                  color: AppColors.green,
                                                  flex2: 4,
                                                  flex3: 2,
                                                  orderId:
                                                      pageViewProvider.pageViewData[index].refId ??
                                                          "#000",
                                                  orderAmount: pageViewProvider
                                                          .pageViewData[index]
                                                          .product!
                                                          .primaryLang!
                                                          .name ??
                                                      "NA",
                                                  earningsAmount: pageViewProvider.pageViewData[index].product!.price != null
                                                      ? pageViewProvider
                                                          .pageViewData[index]
                                                          .product!
                                                          .price
                                                          .toString()
                                                      : "0",
                                                  orderStatus: pageViewProvider
                                                              .pageViewData[
                                                                  index]
                                                              .product!
                                                              .offerPrice !=
                                                          null
                                                      ? pageViewProvider
                                                          .pageViewData[index]
                                                          .product!
                                                          .offerPrice
                                                          .toString()
                                                      : "0"),
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
            ),
          ),
        );
      },
    );
  }
}
