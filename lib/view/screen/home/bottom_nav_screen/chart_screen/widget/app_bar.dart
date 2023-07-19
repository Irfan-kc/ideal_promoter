import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../constant/text_style.dart';
import '../../../../../widget/height_and_width.dart';

class CustAppBar extends StatelessWidget {
  final bool? backButton;
  const CustAppBar({super.key, this.backButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const KHeight(52),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(CupertinoIcons.arrow_left),
                ),
              ),
              const Text(
                'Select Your Product',
                style: AppTextStyle.body1Text,
              ),
              const Icon(CupertinoIcons.search)
            ],
          ),
        ),
        const KHeight(10)
      ],
    );
  }
}
