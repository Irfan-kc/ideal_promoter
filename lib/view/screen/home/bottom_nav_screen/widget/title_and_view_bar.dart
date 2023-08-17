import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';

class TitleAndViewBar extends StatelessWidget {
  final String title;
  const TitleAndViewBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.titleText1,
            ),
            // const Text(
            //   'View all',
            //   style: AppTextStyle.smallText,
            // )
          ],
        ));
  }
}
