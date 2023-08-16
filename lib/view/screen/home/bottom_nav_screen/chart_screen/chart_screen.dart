import 'package:flutter/material.dart';
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
      await Provider.of<ProductProvider>(context, listen: false)
          .getAllProducts(context, page: page);
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
    return Consumer<ProductProvider>(builder: (context, productProvider, _) {
      return Column(
        children: [
          const CustAppBar(),
          const KHeight(14),
          const CategoryTile(),
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
                        imageUrl: productProvider.allProducts
                            .map((e) => e.images![0].url!)
                            .toList(),
                        productName: productProvider.allProducts
                            .map((e) => e.primaryLang!.name!)
                            .toList(),
                        productPrice: productProvider.allProducts
                            .map((e) => e.varients![0].price.toString())
                            .toList(),
                      ),
          ),
        ],
      );
    });
  }
}
