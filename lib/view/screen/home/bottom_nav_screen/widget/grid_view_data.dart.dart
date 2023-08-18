import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/screen/home/product_view/product_view.dart';
import 'package:ideal_promoter/view/widget/Loading/shimmer_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';

class GridViewData extends StatelessWidget {
  final bool isExpanded;
  final String title;
  final ScrollController? controller;
  // final Function(int page) isScrollExtents;
  // final Function() initFunction;
  final bool isLoading;
  final int itemCount;
  final List<String> id;

  final List<String> imageUrl;
  final List<String> productName;
  final List<double> productPrice;
  final List<double> productOfferPrice;

  const GridViewData({
    Key? key,
    this.isExpanded = false,
    required this.title,
    this.controller,
    // required this.isScrollExtents,
    // required this.initFunction,
    required this.isLoading,
    required this.itemCount,
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.productOfferPrice,
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
                  controller: controller!,
                  isExpanded: isExpanded,
                  isLoading: isLoading,
                  itemCount: itemCount,
                  id: id,
                  imageUrl: imageUrl,
                  productName: productName,
                  price: productPrice,
                  offerPrice: productOfferPrice,
                ),
              )
            : ProductBuilder(
                controller: controller!,
                isExpanded: isExpanded,
                isLoading: isLoading,
                itemCount: itemCount,
                id: id,
                imageUrl: imageUrl,
                productName: productName,
                price: productPrice,
                offerPrice: productOfferPrice,
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
    required this.offerPrice,
  });

  final bool isExpanded;
  // final List<dynamic> products;
  final List<String> imageUrl;
  final List<String> productName;
  final List<double> price;
  final List<double> offerPrice;
  final int itemCount;
  final bool isLoading;
  final List<String> id;
  final ScrollController controller;

  String convertImg(String? url, String style) {
    if (url == null) return AppImages.noImage;
    var splited = url.split("upload/");
    return '${splited[0]}upload/$style/${splited[1]}';
  }

  double calculateDiscount(double price, double offerPrice) {
    double discount = price - offerPrice;
    double discountPercentage = (discount / price) * 100;
    return discountPercentage;
  }

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
                              convertImg(imageUrl[index], "h_200"),
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
                  : RichText(
                      text: TextSpan(
                        style: AppTextStyle.buttonText.apply(
                          color: AppColors.black,
                        ),
                        children: [
                          TextSpan(
                              text: '₹${price[index]}',
                              style: const TextStyle(
                                  color: Color(0xFF9C9C9C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 1.5)),
                          const WidgetSpan(child: KWidth(10)),
                          TextSpan(
                              text: '₹${offerPrice[index]}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                          const WidgetSpan(child: KWidth(10)),
                          TextSpan(
                            text: offerPrice[index] != 0
                                ? "${calculateDiscount(price[index], offerPrice[index]).toStringAsFixed(0)}% Off"
                                : "",
                            style: const TextStyle(
                              color: AppColors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
             
            ],
          ),
        );
      },
    );
  }
}
