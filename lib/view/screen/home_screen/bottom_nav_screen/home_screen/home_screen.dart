import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/screen/home_screen/bottom_nav_screen/home_screen/widget/earning_card.dart';
import 'package:ideal_promoter/view/screen/home_screen/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home_screen/bottom_nav_screen/widget/graph.dart';
import 'package:ideal_promoter/view/screen/home_screen/bottom_nav_screen/widget/suggested_grid_view.dart';
import 'package:ideal_promoter/view/screen/home_screen/bottom_nav_screen/widget/title_and_view_bar.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Column(
        children: [
          const KHeight(52),
          Row(
            children: [
              const KWidth(32),
              const Image(
                image: AssetImage('assets/images/3d-hands-fun.png'),
                height: 55,
              ),
              const KWidth(28),
              RichText(
                  text: const TextSpan(
                      text: 'Hi, Irfan Kc\n',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFFFFFFFF)),
                      children: [
                    TextSpan(
                        text: 'welcome to ideal e shope',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFFFFFFFF),
                            letterSpacing: -0.4))
                  ]))
            ],
          ),
          const KHeight(13),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EarningsCard(
                heading: 'Total Eranings',
                todayAmount: '\u20B98600.00',
                totalAmount: '\u20B9122.00',
                totalColor: Color(0xFF9FFFCB),
              ),
              SizedBox(),
              EarningsCard(
                heading: 'Bussiness volume',
                todayAmount: '22',
                totalAmount: '4255',
                totalColor: Color(0xFFFFF59F),
              ),
            ],
          ),
          const KHeight(12),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const KHeight(20),
                const Padding(
                  padding: EdgeInsets.only(left: 22, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Monthly Earnings',
                        style: AppTextStyle.titleText1,
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/money-cash.png'),
                            height: 20,
                          ),
                          Text(
                            '420',
                            style: TextStyle(
                                fontSize: 12.6,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const KHeight(9),
                const SizedBox(
                  height: 108,
                  child: LineChartSample2(),
                ),
                const KHeight(16),
                Row(
                  children: [
                    const KWidth(20),
                    RichText(
                        text: const TextSpan(
                            text: 'You got ',
                            style: TextStyle(
                                color: Color(0xFFFF7448),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(
                              text: '34 Page views',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFF7448),
                                  decoration: TextDecoration.underline))
                        ]))
                  ],
                ),
                const KHeight(9),
                const CategoryTile(),
                const KHeight(12),
                const TitleAndViewBar(title: 'Suggested for you'),
                const KHeight(8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: const SuggestedGridView()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
