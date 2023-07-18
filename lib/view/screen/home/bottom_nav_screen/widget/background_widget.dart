import 'package:flutter/material.dart';

import '../../../../../constant/const_color.dart';

class BackGroundWidget extends StatelessWidget {
  final List<Widget> column1;
  final Widget column2;
  const BackGroundWidget(
      {super.key, required this.column1, required this.column2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...column1,
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: column2)
          ],
        ),
      ),
    );
  }
}
