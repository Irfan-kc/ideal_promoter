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
  });

  final VoidCallback onTap;
  final String label;
  final bool isLoading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isLoading) onTap();
      },
      child: Container(
        width: 190,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color ?? AppColors.primaryColor,
        ),
        child: isLoading
            ? Lottie.asset('assets/animations/loading.json')
            : Center(
                child: Text(
                  label,
                  style: AppTextStyle.buttonText,
                ),
              ),
      ),
    );
  }
}
