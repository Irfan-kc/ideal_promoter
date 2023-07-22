import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../../constant/const_color.dart';

class CircularPercentWidget extends StatelessWidget {
  const CircularPercentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double progress = 0.15;
    return SizedBox(
      height: 100,
      child: CircularPercentIndicator(
        radius: 50,
        lineWidth: 5.0,
        percent: progress,
        backgroundColor: const Color(0xFFD9D9D9),
        center: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Text(
                    "${(progress * 100).toStringAsFixed(0)}%",
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  const Text("Profile completed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ))
                ],
              ),
            ),
          ),
        ),
        progressColor: AppColors.textSecondary,
      ),
    );
  }
}
