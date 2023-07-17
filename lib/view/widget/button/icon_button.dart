import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class CustIconButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color? color;
  final VoidCallback onTap;
  final int flex;
  const CustIconButton(
      {super.key,
      required this.text,
      required this.icon,
      this.color,
      required this.onTap,
      this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Center(
        child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: color ?? AppColors.primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const KWidth(8),
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
