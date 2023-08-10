import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/view/screen/home/product_page/product_page.dart';
import 'package:ideal_promoter/view/screen/home/product_view/product_view.dart';
import 'package:ideal_promoter/view/widget/Loading/shimmer_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ProductProvider>(builder: (context, productProvider, _) {
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
                    itemCount: productProvider.products.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            productProvider.isLoading
                            ? const CustomShimmer(
                                width: 170,
                                height: 161,
                                radius: 8,
                              )
                            : Image(
                                image: productProvider
                                        .products[index].images!.isEmpty
                                    ? const NetworkImage(AppImages.noImage)
                                    : NetworkImage(
                                        productProvider.products[index]
                                                .images![0].url ??
                                            AppImages.noImage,
                                      ),
                                width: 170,
                                height: 161,
                                fit: BoxFit.fill,
                              ),
                        productProvider.isLoading
                            ? const Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 6),
                                child: CustomShimmer(
                                  width: double.infinity,
                                  height: 16,
                                  radius: 4,
                                ),
                              )
                            : Text(
                                productProvider
                                        .products[index].primaryLang!.name ??
                                    "NA",
                                style: AppTextStyle.body1Text,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                        productProvider.isLoading
                            ? const CustomShimmer(
                                width: double.infinity,
                                height: 10,
                                radius: 3,
                              )
                            : Text(
                                productProvider.products[index].varients![0]
                                            .price !=
                                        null
                                    ? '\u0024 ${productProvider.products[index].varients![0].price}'
                                    : '\u0024 150.00',
                                style: AppTextStyle.body3Text,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  itemCount: productProvider.products.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 233),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        productProvider.isLoading
                            ? const CustomShimmer(
                                width: 170,
                                height: 161,
                                radius: 8,
                              )
                            : Image(
                                image: productProvider
                                        .products[index].images!.isEmpty
                                    ? const NetworkImage(AppImages.noImage)
                                    : NetworkImage(
                                        productProvider.products[index]
                                                .images![0].url ??
                                            AppImages.noImage,
                                      ),
                                width: 170,
                                height: 161,
                                fit: BoxFit.fill,
                              ),
                        productProvider.isLoading
                            ? const Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 6),
                                child: CustomShimmer(
                                  width: double.infinity,
                                  height: 16,
                                  radius: 4,
                                ),
                              )
                            : Text(
                                productProvider
                                        .products[index].primaryLang!.name ??
                                    "NA",
                                style: AppTextStyle.body1Text,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                        productProvider.isLoading
                            ? const CustomShimmer(
                                width: double.infinity,
                                height: 10,
                                radius: 3,
                              )
                            : Text(
                                productProvider.products[index].varients![0]
                                            .price !=
                                        null
                                    ? '\u0024 ${productProvider.products[index].varients![0].price}'
                                    : '\u0024 150.00',
                                style: AppTextStyle.body3Text,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                      ],
                    );
                  },
                ),
        ],
      );
    });
  }
}
