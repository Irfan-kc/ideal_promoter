import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/provider/CategoryProvider/category_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/title_and_view_bar.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile({super.key});

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<CategoryProvider>(context, listen: false)
          .getAllCategories(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, _) {
        return Column(
          children: [
            const TitleAndViewBar(title: 'Categories'),
            const KHeight(8),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: categoryProvider.isLoading
                    ? CustomShimmer(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryProvider.categories.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 60,
                            height: 60,
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: categoryProvider
                                    .categories[index].logoImages!.isEmpty
                                ? const NetworkImage(AppImages.noImage)
                                : NetworkImage(
                                    categoryProvider.categories[index]
                                            .logoImages![0].url ??
                                        AppImages.noImage,
                                  ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF22B250),
                              ),
                            ),
                            
                          );
                        },
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.width,
    this.height,
  });
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 234, 234, 234),
      highlightColor: const Color.fromARGB(255, 242, 242, 242),
      enabled: true,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
