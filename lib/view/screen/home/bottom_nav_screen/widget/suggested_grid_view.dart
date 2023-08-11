import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/models/Products/product.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/view/screen/home/product_page/product_page.dart';
import 'package:ideal_promoter/view/screen/home/product_view/product_view.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/Loading/shimmer_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class GridViewData extends StatefulWidget {
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
  State<GridViewData> createState() => _GridViewDataState();
}

class _GridViewDataState extends State<GridViewData> {
  final ScrollController controller = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<ProductProvider>(context, listen: false).getAllProducts(
        context,
        page: 1,
        // isFirst: true,
      );

      // Move the following line outside the `setState` callback
      controller.addListener(_scrollListener);
    });
  }

  void _scrollListener() {
    if (controller.position.maxScrollExtent == controller.offset) {
      setState(() {
        page++;
      });
      Provider.of<ProductProvider>(context, listen: false).getAllProducts(
        context,
        page: page,
      );
    }
  }

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
                  widget.title,
                  style: AppTextStyle.titleText1,
                ),
                widget.isShowViewAll
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
            ),
          ),
          const KHeight(8),
          productProvider.isLoading
              ? loader()
              : productProvider.products.isEmpty
                  ? const Text("No products to show")
                  : widget.isExpanded
                      ? Expanded(
                          child: ProductBuilder(
                            controller: controller,
                            isExpanded: widget.isExpanded,
                            isLoading: productProvider.isLoading,
                            products: productProvider.products,
                          ),
                        )
                      : ProductBuilder(
                          controller: controller,
                          isExpanded: widget.isExpanded,
                          isLoading: productProvider.isLoading,
                          products: productProvider.products,
                        )
        ],
      );
    });
  }
}

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({
    super.key,
    required this.isExpanded,
    required this.products,
    required this.isLoading,
    required this.controller,
  });

  final bool isExpanded;
  final List<Product> products;
  final bool isLoading;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      itemCount: products.length,
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductView(
                          id: products[index].id!,
                        )));
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
                      image: products[index].images!.isEmpty
                          ? const NetworkImage(AppImages.noImage)
                          : NetworkImage(
                              products[index].images![0].url ??
                                  AppImages.noImage,
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
                      products[index].primaryLang!.name ?? "NA",
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
                      products[index].varients![0].price != null
                          ? '\u0024${products[index].varients![0].price}'
                          : '\u00240.00',
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
