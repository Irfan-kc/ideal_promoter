import 'package:flutter/material.dart';
import 'package:ideal_promoter/View/screen/home/page_views/page_views.dart';
import 'package:ideal_promoter/provider/dashboard_provider/dashboard_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/dashboard_card.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/widget/name_card.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/suggested_grid_view.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

import '../widget/graph.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
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
                    const GraphView(
                      title: 'Monthly Earnings',
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
                                        decoration: TextDecoration.underline)),
                              )
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
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                    const KHeight(9),
                    const CategoryTile(),
                    const KHeight(12),
                    const GridViewData(title: 'Suggested for you'),
                  ],
                ),
              );
      },
    );
  }
}
