import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/title_and_view_bar.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAndViewBar(title: 'Categories'),
        const KHeight(8),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF6DC6A8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF22B250))),
                    );
                  }),
            ))
      ],
    );
  }
}
