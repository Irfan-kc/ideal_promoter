import 'package:flutter/material.dart';

class EarningsCard extends StatelessWidget {
  final String heading;
  final String totalAmount;
  final String todayAmount;
  final Color totalColor;
  const EarningsCard(
      {super.key,
      required this.heading,
      required this.totalAmount,
      required this.todayAmount,
      required this.totalColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133,
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.28,
              color: Colors.white,
            ),
          ),
          Text(
            totalAmount,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: totalColor),
          ),
          const Text(
            'Today',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          Text(
            todayAmount,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF)),
          ),
        ],
      ),
    );
  }
}
