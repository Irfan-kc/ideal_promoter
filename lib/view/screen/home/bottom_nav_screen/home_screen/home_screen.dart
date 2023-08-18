import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/provider/Category/category_provider.dart';
import 'package:ideal_promoter/provider/Dashboard/dashboard_provider.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/provider/Profile/profile_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/dashboard_card.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/name_card.dart';
import 'package:ideal_promoter/view/screen/home/page_views/page_view_screen.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/grid_view_data.dart.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

import '../widget/graph.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController controller = ScrollController();

  int page = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<ProfileProvider>(context, listen: false)
          .getProfileData(context);
      Provider.of<DashboardProvider>(context, listen: false)
          .getDashboardData(context);
      Provider.of<GraphProvider>(context, listen: false)
          .getEarningsGraphData(context);
      Provider.of<CategoryProvider>(context, listen: false)
          .getAllCategories(context);
      Provider.of<ProductProvider>(context, listen: false)
          .getAllFeaturedProducts(context, page: page);
      controller.addListener(_scrollListener);
    });
  }

  void _scrollListener() {
    if (controller.position.maxScrollExtent == controller.offset) {
      setState(() {
        page++;
      });
      Provider.of<ProductProvider>(context, listen: false)
          .getAllFeaturedProducts(context, page: page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<DashboardProvider, GraphProvider, ProductProvider>(
      builder: (context, provider, graphProvider, productProvider, _) {
        return provider.isLoading
            ? Center(
                child: loader(),
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
                    graphProvider.earningsGraphData == null
                        ? const Text("Data retrieval failed")
                        : GraphView(
                            title: 'Monthly Earnings',
                            model: graphProvider.earningsGraphData!,
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
                                          builder: (_) =>
                                              const PageViewsScreen()));
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
                    CategoryTile(
                      onSelected: () {},
                    ),
                    const KHeight(12),
                    productProvider.isLoading
                        ? loader()
                        : productProvider.featuredProducts.isEmpty
                            ? const Text("No products to show")
                            : GridViewData(
                                title: 'Suggested for you',
                                controller: controller,
                                isLoading: productProvider.isLoading,
                                itemCount:
                                    productProvider.featuredProducts.length,
                                id: productProvider.featuredProducts
                                    .map((e) => e.id!)
                                    .toList(),
                                imageUrl:
                                    productProvider.featuredProducts.map((e) {
                                  if (e.images == null || e.images!.isEmpty) {
                                    return AppImages.noImage;
                                  } else {
                                    return e.images![0].url ??
                                        AppImages.noImage;
                                  }
                                }).toList(),
                                productName: productProvider.featuredProducts
                                    .map((e) => e.primaryLang!.name!)
                                    .toList(),
                                productPrice: productProvider.featuredProducts
                                    .map((e) =>
                                        "${e.offerPrice ?? e.price ?? "0"}")
                                    .toList(),
                              ),
                  ],
                ),
              );
      },
    );
  }
}
