import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Category/category_provider.dart';
import 'package:ideal_promoter/provider/Dashboard/dashboard_provider.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/dashboard_card.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/name_card.dart';
import 'package:ideal_promoter/view/screen/home/page_views/page_views.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/suggested_grid_view.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

import '../widget/graph.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<DashboardProvider>(context, listen: false)
          .getDashboardData(context);
      Provider.of<GraphProvider>(context, listen: false).getGraphData(context);
      Provider.of<CategoryProvider>(context, listen: false)
          .getAllCategories(context);
      Provider.of<ProductProvider>(context, listen: false)
          .getAllFeaturedProducts(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DashboardProvider, GraphProvider>(
      builder: (context, provider, graphProvider, _) {
        return provider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : BackGroundWidget(
                column1: [
                  const KHeight(52),
                  const NameCard(),
                  const KHeight(13),
                  DashBoardCard(
                    provider:
                        Provider.of<DashboardProvider>(context, listen: false),
                  ),
                  const KHeight(12),
                ],
                column2: Column(
                  children: [
                    const KHeight(20),
                    // const GraphView(),
                    graphProvider.graphData == null
                        ? const Text("Data retrieval failed")
                        : GraphView(
                            title: 'Monthly Earnings',
                            model: graphProvider.graphData!,
                          ),
                    const KHeight(16),
                    Provider.of<DashboardProvider>(context, listen: false)
                                .dashboardData
                                ?.totalPageViewsCount !=
                            0
                        ? Row(
                            children: [
                              const KWidth(20),
                              const Text(
                                'You got ',
                                style: TextStyle(
                                    color: Color(0xFFFF7448),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const PageViews()));
                                },
                                child: Text(
                                  '${Provider.of<DashboardProvider>(context, listen: false).dashboardData?.totalPageViewsCount} Page views',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFF7448),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Row(
                            children: [
                              KWidth(20),
                              Text(
                                'You dont have any page views',
                                style: TextStyle(
                                  color: Color(0xFFFF7448),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                    const KHeight(9),
                    const CategoryTile(),
                    const KHeight(12),
                    GridViewData(
                      title: 'Suggested for you',
                      isScrollExtents: (page) async {
                        await Provider.of<ProductProvider>(context,
                                listen: false)
                            .getAllFeaturedProducts(context, page: page);
                      },
                    ),
                  ],
                ),
              );
      },
    );
  }
}
