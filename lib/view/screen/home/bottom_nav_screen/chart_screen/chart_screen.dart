import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/provider/Category/category_provider.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/chart_screen/widget/app_bar.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/grid_view_data.dart.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final ScrollController controller = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<ProductProvider>(context, listen: false)
          .getAllProducts(context, page: page);
      Provider.of<CategoryProvider>(context, listen: false).getAllSubCategories(
        context,
      );
      controller.addListener(_scrollListener);
    });
  }

  void _scrollListener() {
    if (controller.position.maxScrollExtent == controller.offset) {
      setState(() {
        page++;
      });
      Provider.of<ProductProvider>(context, listen: false)
          .getAllProducts(context, page: page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider, CategoryProvider>(
        builder: (context, productProvider, categoryProvider, _) {
      return Column(
        children: [
          const CustAppBar(),
          const KHeight(14),
          const CategoryTile(),
          const KHeight(12),
          Visibility(
            visible: categoryProvider.subCatListByMainCat.isNotEmpty,
            child: SizedBox(
              height: 30,
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 16),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Provider.of<CategoryProvider>(context, listen: false)
                        .changeIsSelectSub(context,index);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: categoryProvider
                                .subCatListByMainCat[index].isSelected
                            ? AppColors.secondaryColor
                            : AppColors.textPrimary,
                      ),
                      color:
                          categoryProvider.subCatListByMainCat[index].isSelected
                              ? AppColors.textPrimary
                              : AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        "${categoryProvider.subCatListByMainCat[index].primaryLang!.name}",
                        style: TextStyle(
                          color: categoryProvider
                                  .subCatListByMainCat[index].isSelected
                              ? AppColors.secondaryColor
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const KWidth(4),
                itemCount: categoryProvider.subCatListByMainCat.length,
              ),
            ),
          ),
          const KHeight(12),
          Expanded(
            child: productProvider.isLoading
                ? loader()
                : productProvider.allProducts.isEmpty
                    ? const Text("No products to show")
                    : GridViewData(
                        isExpanded: true,
                        title: "Products",
                        controller: controller,
                        isLoading: productProvider.isLoading,
                        itemCount: productProvider.allProducts.length,
                        id: productProvider.allProducts
                            .map((e) => e.id!)
                            .toList(),
                        imageUrl: productProvider.allProducts.map((e) {
                          if (e.images == null || e.images!.isEmpty) {
                            return AppImages.noImage;
                          } else {
                            return e.images![0].url ?? AppImages.noImage;
                          }
                        }).toList(),
                        productName: productProvider.allProducts
                            .map((e) => e.primaryLang!.name!)
                            .toList(),
                        productPrice: productProvider.allProducts
                            .map((e) => "${e.offerPrice ?? e.price ?? "0"}")
                            .toList(),
                      ),
          ),
        ],
      );
    });
  }
}
