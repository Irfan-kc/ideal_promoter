import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';

class TwoTextWidget extends StatelessWidget {
  const TwoTextWidget({
    super.key,
    required this.labelText,
    required this.actionText,
    required this.onTap,
  });

  final String labelText;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: const TextStyle(
              color: Color(0xFF828282),
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            actionText,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
