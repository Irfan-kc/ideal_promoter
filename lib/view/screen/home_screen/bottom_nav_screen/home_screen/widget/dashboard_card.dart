import 'package:flutter/widgets.dart';

import '../../../../../widget/height_and_width.dart';
import 'earning_card.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: EarningsCard(
              heading: 'Total Eranings',
              todayAmount: '\u20B98600.00',
              totalAmount: '\u20B9122.00',
              totalColor: Color(0xFF9FFFCB),
            ),
          ),
          KWidth(20),
          Expanded(
            flex: 1,
            child: EarningsCard(
              heading: 'Bussiness volume',
              todayAmount: '22',
              totalAmount: '4255',
              totalColor: Color(0xFFFFF59F),
            ),
          ),
        ],
      ),
    );
  }
}
