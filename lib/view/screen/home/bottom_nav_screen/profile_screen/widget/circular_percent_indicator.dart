import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../../constant/const_color.dart';

class CircularPercentWidget extends StatelessWidget {
  const CircularPercentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: CircularPercentIndicator(
        radius: 45,
        lineWidth: 5.0,
        percent: 0.7,
        backgroundColor: const Color(0xFFD9D9D9),
        center: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: const Center(
            child: Text(
              "75%",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
          ),
        ),
        progressColor: const Color(0XFF9F9F9F),
      ),
    );
  }
}
