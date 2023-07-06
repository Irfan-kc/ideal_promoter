import 'package:flutter/material.dart';

import '../../../../../constant/text_style.dart';

class SuggestedGridView extends StatelessWidget {
  const SuggestedGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 0,
          crossAxisSpacing: 20,
          mainAxisExtent: 222),
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
    );
  }
}
