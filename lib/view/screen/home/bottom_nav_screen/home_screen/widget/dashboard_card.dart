import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bussiness_volume_page/business_volume_page.dart';
import 'package:ideal_promoter/view/screen/home/earnings_page/earning_page.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';

import 'earning_card.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({super.key});

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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const EarningsPage()));
              },
              heading: 'Total Earnings',
              todayAmount: '\u20B98600.00',
              totalAmount: '\u20B9122.00',
              totalColor: const Color(0xFF9FFFCB),
            ),
          ),
          const KWidth(20),
          Expanded(
            flex: 1,
            child: EarningsCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const BusinessVolumePage()));
              },
              heading: 'Business volume',
              todayAmount: '22',
              totalAmount: '4255',
              totalColor: const Color(0xFFFFF59F),
            ),
          ),
        ],
      ),
    );
  }
}
