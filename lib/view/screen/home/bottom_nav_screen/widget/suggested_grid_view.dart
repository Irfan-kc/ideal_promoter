import 'package:flutter/material.dart';

import '../../../../../constant/text_style.dart';
import '../../../../widget/height_and_width.dart';
import 'title_and_view_bar.dart';

class SuggestedGridView extends StatelessWidget {
  const SuggestedGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAndViewBar(title: 'Suggested for you'),
        const KHeight(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                mainAxisSpacing: 0,
                crossAxisSpacing: 20,
                mainAxisExtent: 233),
            itemBuilder: (context, index) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(
                      'assets/images/pic.png',
                    ),
                    width: 170,
                    height: 161,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    '\u0024 150.00',
                    style: AppTextStyle.body1Text,
                  ),
                  Text(
                    'Wooden bedside table featuring a raised desissdssds',
                    style: AppTextStyle.body3Text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
