import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/Dashboard/dashboard_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/wallet_screen.dart';
import 'package:ideal_promoter/view/screen/home/bussiness_volume_page/business_volume_page.dart';
import 'package:ideal_promoter/view/screen/home/earnings_page/earning_page.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';

import 'earning_card.dart';

class DashBoardCard extends StatelessWidget {
  final DashboardProvider provider;
  const DashBoardCard({
    super.key,
    required this.provider,
  });

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const WalletScreen()));
                provider.getDashboardData(context);
              },
              heading: 'Total Earnings',
              todayAmount: provider.dashboardData?.todayEarningsAmount != null
                  ? '\u20B9${provider.dashboardData?.todayEarningsAmount}'
                  : '\u20B90',
              totalAmount: provider.dashboardData?.totalEarningsAmount != null
                  ? '\u20B9${provider.dashboardData?.totalEarningsAmount}'
                  : '\u20B90',
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
                  provider.dashboardData?.todayBusinessVolumeAmount != null
                      ? '${provider.dashboardData?.todayBusinessVolumeAmount}'
                      : '0',
              totalAmount:
                  provider.dashboardData?.totalBusinessVolumeAmount != null
                      ? '${provider.dashboardData?.totalBusinessVolumeAmount}'
                      : '0',
              totalColor: const Color(0xFFFFF59F),
            ),
          ),
        ],
      ),
    );
  }
}
