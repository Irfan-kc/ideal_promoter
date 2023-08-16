import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/screen/home/product_view/product_view.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/Loading/shimmer_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';

class GridViewData extends StatelessWidget {
  final bool isExpanded;
  final String title;
  final ScrollController controller;
  // final Function(int page) isScrollExtents;
  // final Function() initFunction;
  final bool isLoading;
  final int itemCount;
  final List<String> id;

  final List<String> imageUrl;
  final List<String> productName;
  final List<String> productPrice;

  const GridViewData({
    Key? key,
    this.isExpanded = false,
    required this.title,
    required this.controller,
    // required this.isScrollExtents,
    // required this.initFunction,
    required this.isLoading,
    required this.itemCount,
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
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
            ],
          ),
        ),
        const KHeight(8),
        isExpanded
            ? Expanded(
                child: ProductBuilder(
                  controller: controller,
                  isExpanded: isExpanded,
                  isLoading: isLoading,
                  itemCount: itemCount,
                  id: id,
                  imageUrl: imageUrl,
                  productName: productName,
                  price: productPrice,
                ),
              )
            : ProductBuilder(
                controller: controller,
                isExpanded: isExpanded,
                isLoading: isLoading,
                itemCount: itemCount,
                id: id,
                imageUrl: imageUrl,
                productName: productName,
                price: productPrice,
              )
      ],
    );
  }
}

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({
    super.key,
    required this.isExpanded,
    required this.isLoading,
    required this.controller,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.itemCount,
    required this.id,
  });

  final bool isExpanded;
  // final List<dynamic> products;
  final List<String> imageUrl;
  final List<String> productName;
  final List<String> price;
  final int itemCount;
  final bool isLoading;
  final List<String> id;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      itemCount: itemCount,
      physics: isExpanded
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisSpacing: 0,
          crossAxisSpacing: 20,
          mainAxisExtent: 233),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => ProductView(id: id[index])));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLoading
                  ? const CustomShimmer(
                      width: 170,
                      height: 161,
                      radius: 8,
                    )
                  : Image(
                      image: imageUrl.isEmpty
                          ? const NetworkImage(AppImages.noImage)
                          : NetworkImage(
                              imageUrl[index],
                            ),
                      width: 170,
                      height: 161,
                      fit: BoxFit.fill,
                    ),
              isLoading
                  ? const Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 6),
                      child: CustomShimmer(
                        width: double.infinity,
                        height: 16,
                        radius: 4,
                      ),
                    )
                  : Text(
                      productName[index],
                      style: AppTextStyle.body1Text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
              isLoading
                  ? const CustomShimmer(
                      width: double.infinity,
                      height: 10,
                      radius: 3,
                    )
                  : Text(
                      '\u0024 ${price[index]}',
                      // : '\u00240.00',
                      style: AppTextStyle.body3Text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
            ],
          ),
        );
      },
    );
  }
}
