import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/provider/BusinessVolume/business_volume_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/wallet_screen/widget/table_row.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CustTableData extends StatefulWidget {
  final String title;
  const CustTableData({
    super.key,
    required this.title,
  });

  @override
  State<CustTableData> createState() => _CustTableDataState();

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
                colorScheme: ColorScheme.light(
                  primary: Colors.lightBlue.shade900, // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: Colors.lightBlue.shade900, // body text color
                ),
              ),
              child: child!);
        });

    return picked;
  }
}

class _CustTableDataState extends State<CustTableData> {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  DateTime fromDate = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, 0, 0, 0, 1);

  DateTime toDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessVolumeProvider>(
      builder: (context, businessVolumeProvider, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.195,
                    ),
                  ),
                  // Container(
                  //   height: 30,
                  //   width: 30,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(6),
                  //     color: AppColors.primaryColor,
                  //   ),
                  //   child: const Center(
                  //     child: Icon(
                  //       Icons.tune_outlined,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const KHeight(16),
            Card(
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
                    DateCard(
                      onTap: () {
                        CustTableData.selectDate(context, fromDate)
                            .then((value) {
                          fromDate = DateTime(
                              value!.year, value.month, value.day, 0, 0, 0, 0);
                          setState(() {});
                        });
                      },
                      label: 'From date',
                      date: formatDate(fromDate.toString().split(" ")[0]),
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: AppColors.black.withOpacity(0.3),
                    ),
                    DateCard(
                      onTap: () {
                        CustTableData.selectDate(context, toDate).then((value) {
                          toDate = value!;
                          setState(() {});
                        });
                      },
                      label: 'To date',
                      date: formatDate(toDate.toString().split(" ")[0]),
                    ),
                  ],
                ),
              ),
            ),
            const KHeight(16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: CustTableRow(
                textStyle: false,
              ),
            ),
            const KHeight(4),
            businessVolumeProvider.isLoading
                ? loader()
                : Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 0),
                      itemCount:
                          businessVolumeProvider.businessVolumeData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 34,
                              child: Center(
                                child: CustTableRow(
                                  orderId: businessVolumeProvider
                                          .businessVolumeData[index].refId ??
                                      "#000",
                                  orderAmount: businessVolumeProvider
                                              .businessVolumeData[index]
                                              .earning!
                                              .orderAmount !=
                                          null
                                      ? businessVolumeProvider
                                          .businessVolumeData[index]
                                          .earning!
                                          .orderAmount
                                          .toString()
                                      : '0',
                                  earningsAmount: businessVolumeProvider
                                              .businessVolumeData[index]
                                              .earning!
                                              .promoterAmount !=
                                          null
                                      ? businessVolumeProvider
                                          .businessVolumeData[index]
                                          .earning!
                                          .promoterAmount
                                          .toString()
                                      : '0',
                                  orderStatus: businessVolumeProvider
                                          .businessVolumeData[index].status ??
                                      "NA",
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ],
        );
      },
    );
  }

  String formatDate(String inputDate) {
    DateTime date = DateFormat("yyyy-MM-dd").parse(inputDate);

    final DateFormat formatter = DateFormat('dd-MM-yyyy');

    return formatter.format(date);
  }
}

class DateCard extends StatelessWidget {
  const DateCard({
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
          )
        ],
      ),
    );
  }
}
