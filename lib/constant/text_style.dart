import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';

abstract class AppTextStyle {
  static const h2 = TextStyle(
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 1.3,
      letterSpacing: -0.6);

  static const alertHead = TextStyle(
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      letterSpacing: -0.196);

  static const titleText1 = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: -0.197);

  static const heading2 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  static const smallestText = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const smallWhiteText = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const body1Text = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const body3Text = TextStyle(
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static const buttonText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static const smallText = TextStyle(
      color: AppColors.textSecondary,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: -0.158);

  static const dataColumnText = TextStyle(
      color: AppColors.textSecondary,
      fontWeight: FontWeight.w400,
      fontSize: 10,
      letterSpacing: -0.14);

  static const text = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const textFieldText = TextStyle(
    color: Colors.black,
    fontSize: 14.6,
    fontWeight: FontWeight.w400,
  );
}
