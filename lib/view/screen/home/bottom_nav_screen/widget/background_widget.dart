import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  final List<Widget> column1;
  final Widget column2;
  final bool isExpanded;
  const BackGroundWidget(
      {super.key,
      required this.column1,
      required this.column2,
      this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: isExpanded == false
          ? SingleChildScrollView(
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
            )
          : Column(
              children: [
                ...column1,
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0)),
                        color: Colors.white,
                      ),
                      child: column2),
                )
              ],
            ),
    );
  }
}
