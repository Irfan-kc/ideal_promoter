import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/home/product_view/product_view_provider.dart';
import 'package:provider/provider.dart';

class CarouselView extends StatelessWidget {
  const CarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductPageProvider>(builder: (context, data, _) {
      return Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 460.0,
              // enlargeCenterPage: true,
              // enableInfiniteScroll: true,
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: false,
              viewportFraction: 1,
              aspectRatio: 16 / 9,
              initialPage: 0,
              onPageChanged: (index, reason) {
                data.carouselIndex = index;
                data.onRefresh();
              },
            ),
            items: data.imageList.map((item) {
              return Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            }).toList(),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: data.imageList.asMap().entries.map((e) {
                  return Container(
                    width: data.carouselIndex == e.key ? 17 : 7,
                    height: 7,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  );
                }).toList(),
              )),
          Positioned(
              top: 40,
              left: 8,
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.arrow_left,
                  size: 24,
                  // weight: ,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ))
        ],
      );
    });
  }
}
