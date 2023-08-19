import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';

class CustTableRow extends StatelessWidget {

  final bool textStyle;
  final List<Color>? color;
  final int length;
  final List<String> label;
  final List<int> flex;

  const CustTableRow({
    super.key,
    this.textStyle = false,
    this.color,
    required this.length,
    required this.label,
    required this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      length,
      (index) => CustTableCell(
        text: label[index],
        flex: flex[index],
        textStyle: textStyle,
        color: color![index],
      ),
    ));
  }
}

class CustTableCell extends StatelessWidget {
  final String text;
  final int flex;
  final bool textStyle;
  final Color? color;
  const CustTableCell(
      {super.key,
      required this.text,
      required this.flex,
      this.textStyle = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Text(
          text,
          style: textStyle
              ? AppTextStyle.dataColumnText
              : TextStyle(
                  fontSize: 11,
                  color: color ?? Colors.black,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.14,
                ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
