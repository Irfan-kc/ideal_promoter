import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';

Widget loader({Color? color,double? size}) {
  return Center(
    child: SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color ?? AppColors.primaryColor,
      ),
    ),
  );
}