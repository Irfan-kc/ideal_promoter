import 'package:flutter/material.dart';

import '../../../../constant/const_color.dart';

class TwoTextWidget extends StatelessWidget {
  final String firstText;
  final String scndText;
  final VoidCallback onTap;
  const TwoTextWidget(
      {super.key,
      required this.firstText,
      required this.scndText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(
              color: Color(0xFF828282),
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            scndText,
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
