import 'package:flutter/material.dart';

import '../../../../../widget/height_and_width.dart';

class NameCard extends StatelessWidget {
  const NameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const KWidth(32),
        const Image(
          image: AssetImage('assets/images/3d-hands-fun.png'),
          height: 55,
        ),
        const KWidth(28),
        RichText(
            text: const TextSpan(
                text: 'Hi, Irfan Kc\n',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFFFFFFFF)),
                children: [
              TextSpan(
                  text: 'welcome to ideal e shope',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFFFFFFFF),
                      letterSpacing: -0.4))
            ]))
      ],
    );
  }
}
