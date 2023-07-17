import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';

class CustTableRow extends StatelessWidget {
  final String? orderId;
  final String? orderAmount;
  final String? earningsAmount;
  final String? orderStatus;
  final bool? textStyle;
  const CustTableRow(
      {super.key,
      this.orderId,
      this.orderAmount,
      this.earningsAmount,
      this.orderStatus,
      this.textStyle = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustTableCell(
          text: orderId ?? 'OrderId',
          flex: 2,
          textStyle: textStyle,
        ),
        CustTableCell(
          text: orderAmount ?? 'OrderAmount',
          flex: 3,
          textStyle: textStyle,
        ),
        CustTableCell(
          text: earningsAmount ?? 'EarningsAmount',
          flex: 3,
          textStyle: textStyle,
        ),
        CustTableCell(
          text: orderStatus ?? 'Order Status',
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
  // final TextStyle? textStyle;
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
                  letterSpacing: -0.14),
        ));
  }
}
