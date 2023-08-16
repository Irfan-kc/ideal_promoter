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
  final int flex1;
  final int flex2;
  final int flex3;
  final int flex4;

  const CustTableRow({
    super.key,
    required this.orderId,
    required this.orderAmount,
    required this.earningsAmount,
    required this.orderStatus,
    this.textStyle = true,
    this.isEarnings = false,
    this.flex1 = 2,
    this.flex2 = 3,
    this.flex3 = 3,
    this.flex4 = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustTableCell(
          text: orderId,
          flex: flex1,
          textStyle: textStyle,
        ),
        CustTableCell(
          text: orderAmount,
          flex: flex2,
          textStyle: textStyle,
        ),
        CustTableCell(
          text: earningsAmount,
          flex: flex3,
          textStyle: textStyle,
        ),
        CustTableCell(
          text: orderStatus,
          flex: flex4,
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
