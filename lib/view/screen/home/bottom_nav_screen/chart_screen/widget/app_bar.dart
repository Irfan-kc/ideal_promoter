import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/Constant/text_style.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';


class CustAppBar extends StatelessWidget {
  final bool backButton;
  const CustAppBar({super.key, this.backButton = false});

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
              if (backButton)
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(CupertinoIcons.arrow_left),
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
