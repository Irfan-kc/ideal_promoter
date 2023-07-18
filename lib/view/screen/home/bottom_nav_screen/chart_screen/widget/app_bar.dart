import 'package:flutter/cupertino.dart';

import '../../../../../../constant/text_style.dart';
import '../../../../../widget/height_and_width.dart';

class CustAppBar extends StatelessWidget {
  const CustAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        KHeight(52),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Your Product',
                style: AppTextStyle.body1Text,
              ),
              Icon(CupertinoIcons.search)
            ],
          ),
        ),
        KHeight(10)
      ],
    );
  }
}
