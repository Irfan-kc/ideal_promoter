import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';

class BackGroundWidget extends StatelessWidget {
  final List<Widget>? column1;
  final Widget column2;
  final bool isExpanded;
  final String? heading;
  final bool backButton;
  const BackGroundWidget(
      {super.key,
      this.column1,
      required this.column2,
      this.isExpanded = false,
      this.heading,
      this.backButton = true});

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
                  ...?column1,
                  Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                        color: AppColors.backgroundColor,
                      ),
                      child: column2)
                ],
              ),
            )
          : Column(
              children: [
                const KHeight(60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    children: [
                      if (backButton)
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.white,
                          ),
                        ),
                      Expanded(
                        child: Center(
                          child: Text(
                            heading.toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const KHeight(30),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                        color: Colors.white,
                      ),
                      child: column2),
                )
              ],
            ),
    );
  }
}
