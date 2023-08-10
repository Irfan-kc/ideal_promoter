import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Dashboard/dashboard_provider.dart';

class EarningsCard extends StatelessWidget {
  final String heading;
  final String totalAmount;
  final String todayAmount;
  final Color totalColor;
  final VoidCallback? onTap;
  final DashboardProvider provider;
  const EarningsCard(
      {super.key,
      required this.heading,
      required this.totalAmount,
      required this.todayAmount,
      required this.totalColor,
      this.onTap,
      required this.provider});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
            provider.dashboardData != null
                ? Text(
                    totalAmount,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: totalColor),
                  )
                : const Text(
                    'Failed to load data from the server',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.red),
                  ),
            const Text(
              'Today',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            provider.dashboardData != null
                ? Text(
                    todayAmount,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                : const Text(
                    'Failed to load data from the server',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.red),
                  ),
          ],
        ),
      ),
    );
  }
}
