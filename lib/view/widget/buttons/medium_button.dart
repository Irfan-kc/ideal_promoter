import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:lottie/lottie.dart';

class MediumButton extends StatelessWidget {
  const MediumButton({
    super.key,
    required this.onTap,
    required this.label,
    this.color,
    this.isLoading = false,
    this.width,
    this.textStyle,
    this.height,
  });

  final VoidCallback onTap;
  final String label;
  final bool isLoading;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isLoading) onTap();
      },
      child: Container(
        width: width ?? 190,
        // padding: padding,
        height: height ?? 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color ?? AppColors.primaryColor,
        ),
        child: isLoading
            ? Lottie.asset('assets/animations/loading.json')
            : Center(
                child: Text(
                  label,
                  style: textStyle ?? AppTextStyle.buttonText,
                ),
              ),
      ),
    );
  }
}
