import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  const LoginButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.padding,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color ?? AppColors.primaryColor),
          child: Text(
            text,
            style: AppTextStyle.buttonText,
          ),
        ));
  }
}
