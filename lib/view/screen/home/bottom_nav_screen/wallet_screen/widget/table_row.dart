import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';

class CustTableRow extends StatelessWidget {
  final String orderId;
  final String orderAmount;
  final String earningsAmount;
  final String orderStatus;
  final bool? textStyle;
  final bool isEarnings;
  const CustTableRow({
    super.key,
    required this.orderId,
    required this.orderAmount,
    required this.earningsAmount,
    required this.orderStatus,
    this.textStyle = true,
    this.isEarnings = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustTableCell(
          text: orderId,
          flex: 2,
          textStyle: textStyle,
        ),
        CustTableCell(
          text: orderAmount,
          flex: 3,
          textStyle: textStyle,
        ),
        CustTableCell(
          text: earningsAmount,
          flex: 3,
          textStyle: textStyle,
        ),
        CustTableCell(
          text: orderStatus,
          flex: 2,
          color: AppColors.green,
          textStyle: textStyle,
        ),
      ],
    );
  }
}

class CustTableCell extends StatelessWidget {
  final String text;
  final int flex;
  final bool? textStyle;
  final Color? color;
  const CustTableCell(
      {super.key,
      required this.text,
      required this.flex,
      this.textStyle,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: textStyle == false
            ? AppTextStyle.dataColumnText
            : TextStyle(
                fontSize: 11,
                color: color ?? Colors.black,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.14,
              ),
      ),
    );
  }
}
