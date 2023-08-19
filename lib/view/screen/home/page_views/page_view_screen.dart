import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/provider/PageView/page_view_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_row.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PageViewsScreen extends StatefulWidget {
  const PageViewsScreen({super.key});

  @override
  State<PageViewsScreen> createState() => _PageViewsScreenState();
}

class _PageViewsScreenState extends State<PageViewsScreen> {
  final ScrollController controller = ScrollController();

  int page = 1;
  int limit = 30;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await Provider.of<PageViewProvider>(context, listen: false)
            .getAllPageViews(context, page: page,limit: limit);
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
          .getAllPageViews(context, page: page, limit: limit);
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Page Views',
                              style: AppTextStyle.textFieldText,
                            ),
                            Text(
                              'Total: ${pageViewProvider.totalPageviews}',
                              style: AppTextStyle.body3Text,
                            ),
                          ],
                        ),
                      ),
                      const KHeight(20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 36,
                        color: const Color(0xffF5FBFF),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustTableRow(
                            length: 2,
                            label: ['Date', 'Name'],
                            flex: [1, 2],
                            color: [Colors.black, Colors.black],
                            textStyle: true,
                          ),
                        ),
                      ),
                      pageViewProvider.isLoading
                          ? loader()
                          : pageViewProvider.pageViewData.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.all(28.0),
                                  child: Center(child: Text("No Data")),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                    controller: controller,
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 0),
                                    itemCount:
                                        pageViewProvider.pageViewData.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: CustTableRow(
                                          length: 2,
                                          label: [
                                            DateFormat("yyyy-MM-dd hh:mm a")
                                                .format(pageViewProvider
                                                    .pageViewData[index]
                                                    .createdAt!),
                                            pageViewProvider
                                                    .pageViewData[index]
                                                    .product!
                                                    .primaryLang!
                                                    .name ??
                                                ''
                                          ],
                                          flex: const [1, 2],
                                          color: const [
                                            Colors.black,
                                            Colors.black
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
              ],
            ),
          ),
        );
      },
    );
  }
}
