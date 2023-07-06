import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';

abstract class AppTextStyle {
  static const headingText = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    // fontFamily: 'Quicksand',
  );

  static const h2 = TextStyle(
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: -0.48
      // fontFamily: 'Quicksand',
      );

  static const titleText1 = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: -0.197
      // fontFamily: 'Quicksand',
      );

  static const mainTitleText = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w600,
    fontSize: 21,
    // fontFamily: 'Quicksand',
  );

  static const titleText2 = TextStyle(
    // overflow: TextOverflow.ellipsis,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    // fontFamily: 'Quicksand',
  );

  static const subheadingText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 26,
    // fontFamily: 'Quicksand',
  );

  static const body1Text = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    // fontFamily: 'Quicksand',
  );

  static const body3Text = TextStyle(
    color: Color(0xFF9E9E9E),
    fontWeight: FontWeight.w400,
    fontSize: 12,
    // fontFamily: 'Quicksand',
  );

  static const buttonText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    // fontFamily: 'Quicksand',
  );

  static const smallText = TextStyle(
      color: AppColors.textSecondary,
      fontWeight: FontWeight.w500,
      fontSize: 10,
      letterSpacing: -0.158
      // fontFamily: 'Quicksand',
      );
}
