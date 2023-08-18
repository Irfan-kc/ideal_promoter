import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/app_images.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/models/SingleProduct/image.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({super.key, required this.images});

  final List<SingleProductImage> images;

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  var currentIndex = 0;

  String convertImg(String? url, String style) {
    if (url == null) return AppImages.noImage;
    var splited = url.split("upload/");
    return '${splited[0]}upload/$style/${splited[1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 460.0,
            autoPlay: false,
            viewportFraction: 1,
            aspectRatio: 16 / 9,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: widget.images.map((item) {
            return widget.images.isNotEmpty
                ? Image.network(
                    convertImg(item.url, 'h_400'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Image.network(AppImages.noImage);
          }).toList(),
        ),
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
          ),
        ),
        widget.images.length > 1
            ? Positioned(
                bottom: 20,
                child: Container(
                  height: 18,
                  width: widget.images.length == 2
                      ? widget.images.length * 24
                      : widget.images.length * 20,
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.images.asMap().entries.map((e) {
                      return Container(
                        width: currentIndex == e.key ? 17 : 7,
                        height: 7,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      );
                    }).toList(),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
