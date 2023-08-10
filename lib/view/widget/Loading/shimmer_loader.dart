import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.width,
    this.height,
    this.radius,
  });
  final double? height;
  final double? width;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 234, 234, 234),
      highlightColor: const Color.fromARGB(255, 242, 242, 242),
      enabled: true,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(radius!),
        ),
      ),
    );
  }
}
