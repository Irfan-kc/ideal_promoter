import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:intl/intl.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    super.key,
    required this.fromDate,
    required this.toDate,
    this.onFromTap,
    this.onToTap,
  });

  final Function()? onFromTap;
  final Function()? onToTap;
  final String fromDate;
  final String toDate;

  String formatDate(String inputDate) {
    DateTime date = DateFormat("yyyy-MM-dd").parse(inputDate);

    final DateFormat formatter = DateFormat('dd-MM-yyyy');

    return formatter.format(date);
  }

  static Future<DateTime?> selectDate(
      BuildContext context, DateTime date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: AppColors.primaryColor, // body text color
            ),
          ),
          child: child!,
        );
      },
    );
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.backgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DateWidget(
              onTap: onFromTap,
              label: 'From date',
              date: formatDate(fromDate),
            ),
            Container(
              width: 1,
              height: 30,
              color: AppColors.black.withOpacity(0.3),
            ),
            DateWidget(
              onTap: onToTap,
              label: 'To date',
              date: formatDate(toDate),
            ),
          ],
        ),
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.label,
    required this.date,
    this.onTap,
  });

  final String label;
  final String date;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.primaryColor,
            size: 30,
          ),
          const KWidth(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  )),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// () {
// CustTableData.selectDate(context, toDate).then((value) {
//   toDate = value!;
//   setState(() {});
//   Provider.of<BusinessVolumeProvider>(context, listen: false)
//       .getAllBusinessVolume(
//     context,
//     fromDate: fromDate.toString().split(" ")[0],
//     toDate: toDate.toString().split(" ")[0],
//   );
// });
// }
