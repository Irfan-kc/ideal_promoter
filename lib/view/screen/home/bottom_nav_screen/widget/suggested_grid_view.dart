import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/product_page/product_page.dart';
import 'package:ideal_promoter/view/screen/home/product_view/product_view.dart';

import '../../../../../constant/text_style.dart';
import '../../../../widget/height_and_width.dart';

class GridViewData extends StatelessWidget {
  final bool isExpanded;
  final String title;
  final bool isShowViewAll;
  const GridViewData({
    Key? key,
    this.isExpanded = false,
    required this.title,
    this.isShowViewAll = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.titleText1,
                ),
                isShowViewAll
                    ? SizedBox(
                        height: 30,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ProductPage()));
                            },
                            child: const Text(
                              'View all',
                              style: AppTextStyle.smallText,
                            )),
                      )
                    : const SizedBox()
              ],
            )),
        const KHeight(8),
        isExpanded
            ? Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 233),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ProductView()));
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/pic.png',
                            ),
                            width: 170,
                            height: 161,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            '\u0024 150.00',
                            style: AppTextStyle.body1Text,
                          ),
                          Text(
                            'Wooden bedside table featuring a raised desissdssds',
                            style: AppTextStyle.body3Text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 233),
                itemBuilder: (context, index) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/pic.png',
                        ),
                        width: 170,
                        height: 161,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        '\u0024 150.00',
                        style: AppTextStyle.body1Text,
                      ),
                      Text(
                        'Wooden bedside table featuring a raised desissdssds',
                        style: AppTextStyle.body3Text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  );
                },
              ),
      ],
    );
  }
}
