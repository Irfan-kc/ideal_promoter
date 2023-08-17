import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/provider/Category/category_provider.dart';
import 'package:ideal_promoter/provider/Home/home_screen_provider/bottom_nav_bar_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/title_and_view_bar.dart';
import 'package:ideal_promoter/view/widget/Loading/shimmer_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile({super.key});

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
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
                    ? Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: CustomShimmer(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          radius: 10,
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryProvider.allCategoryList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Provider.of<CategoryProvider>(context,
                                      listen: false)
                                  .changeIsSelect(
                                      context,
                                      index,
                                      categoryProvider
                                              .allCategoryList[index].id ??
                                          '');
                              Provider.of<BottomNavProvider>(context,
                                      listen: false)
                                  .onBarChanged(2, context);
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: categoryProvider.allCategoryList[index]
                                          .logoImages!.isEmpty
                                      ? const NetworkImage(AppImages.noImage)
                                      : NetworkImage(
                                          categoryProvider
                                                  .allCategoryList[index]
                                                  .logoImages![0]
                                                  .url ??
                                              AppImages.noImage,
                                        ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: categoryProvider
                                          .allCategoryList[index].isSelected
                                      ? Colors.blue
                                      : const Color(0xFF22B250),
                                ),
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
