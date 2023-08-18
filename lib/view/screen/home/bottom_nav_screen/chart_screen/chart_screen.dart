import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/provider/Category/category_provider.dart';
import 'package:ideal_promoter/provider/Home/home_screen_provider/bottom_nav_bar_provider.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/category_tile.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/grid_view_data.dart.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:ideal_promoter/view/widget/textfields/custom_textfield.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({
    super.key,
  });

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final ScrollController controller = ScrollController();
  TextEditingController searchController = TextEditingController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      var isFromHome =
          Provider.of<BottomNavProvider>(context, listen: false).isFromHome;
      if (!isFromHome) {
        Provider.of<ProductProvider>(context, listen: false)
            .getAllProducts(context, page: page);
      }
      Provider.of<CategoryProvider>(context, listen: false).getAllSubCategories(
        context,
      );
      controller.addListener(_scrollListener);
    });
  }

  final debouncer = Debouncer(milliseconds: 500);
  void _scrollListener() {
    if (controller.position.maxScrollExtent == controller.offset) {
      page++;
      Provider.of<ProductProvider>(context, listen: false).doPagination(
        context,
        page: page,
        search: searchController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider, CategoryProvider>(
        builder: (context, productProvider, categoryProvider, _) {
      return SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                onChanged: (qry) {
                  debouncer.run(() {
                    page = 1;
                    Provider.of<ProductProvider>(context, listen: false)
                        .getAllProducts(context, page: 1, search: qry);
                  });
                },
                prefix: const Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
                controller: searchController,
                hintText: 'Search product',
              ),
            ),
            const KHeight(14),
            CategoryTile(
              onSelected: () {
                page = 1;
              },
            ),
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
                      page = 1;
                      Provider.of<CategoryProvider>(context, listen: false)
                          .changeIsSelectSub(context, index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: categoryProvider
                                  .subCatListByMainCat[index].isSelected
                              ? AppColors.secondaryColor
                              : AppColors.textPrimary,
                        ),
                        color: categoryProvider
                                .subCatListByMainCat[index].isSelected
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
        ),
      );
    });
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({
    required this.milliseconds,
  });

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
