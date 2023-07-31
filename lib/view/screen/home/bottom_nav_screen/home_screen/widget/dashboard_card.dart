import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/dashboard_provider/dashboard_provider.dart';
import 'package:ideal_promoter/view/screen/home/bussiness_volume_page/business_volume_page.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';

import 'earning_card.dart';

class DashBoardCard extends StatelessWidget {
  final DashboardProvider provider;
  const DashBoardCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: EarningsCard(
              provider: provider,
              onTap: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (_) => const EarningsPage()));
                provider.getDashboardData(context);
              },
              heading: 'Total Earnings',
              todayAmount: '\u20B98600.00',
              totalAmount:
                  '\u20B9${provider.dashboardData?.totalEarningsAmount.toString()}',
              totalColor: const Color(0xFF9FFFCB),
            ),
          ),
          const KWidth(20),
          Expanded(
            flex: 1,
            child: EarningsCard(
              provider: provider,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const BusinessVolumePage()));
              },
              heading: 'Business volume',
              todayAmount:
                  '\u20B9${provider.dashboardData?.totalBusinessVolumeAmount.toString()}',
              totalAmount:
                  '\u20B9${provider.dashboardData?.totalBusinessVolumeAmount.toString()}',
              totalColor: const Color(0xFFFFF59F),
            ),
          ),
        ],
      ),
    );
  }
}
