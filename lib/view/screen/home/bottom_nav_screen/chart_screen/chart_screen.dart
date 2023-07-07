import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        KHeight(52),
        Row(
          children: [
            Icon(CupertinoIcons.arrow_left),
            Text('Select Your Product')
          ],
        )
      ],
    );
  }
}
