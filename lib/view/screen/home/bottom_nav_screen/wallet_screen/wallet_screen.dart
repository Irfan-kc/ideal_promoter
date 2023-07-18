import 'package:flutter/material.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_data.dart';

import '../../../../../constant/const_color.dart';
import '../../../../widget/height_and_width.dart';
import '../widget/graph.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const KHeight(64),
          const Text(
            'Earnings',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const KHeight(30),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: const Column(
                  children: [
                    KHeight(20),
                    GraphView(),
                    KHeight(16),
                    Expanded(child: CustTableData())
                  ],
                )),
          )
        ],
      ),
    );
  }
}
