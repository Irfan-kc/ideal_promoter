import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class CustTableData extends StatelessWidget {
  const CustTableData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Monthly Earnings',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.195),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.primaryColor),
                  child: const Center(
                    child: Icon(
                      Icons.tune_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
        const KHeight(16),

        Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final totalWidth = MediaQuery.of(context).size.width;
                final columnWidth =
                    totalWidth / 4; // Assuming there are 4 columns

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 30,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Order Id',
                          style: AppTextStyle.dataColumnText,
                        ),
                      ),
                      DataColumn(
                        label: Text('Order Amount',
                            style: AppTextStyle.dataColumnText),
                      ),
                      DataColumn(
                        label: Text('Earnings Amount',
                            style: AppTextStyle.dataColumnText),
                      ),
                      DataColumn(
                        label: Text('Order Status',
                            style: AppTextStyle.dataColumnText),
                      ),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Item 1')),
                        DataCell(Text('200')),
                        DataCell(Text('Completed')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Item 2')),
                        DataCell(Text('300')),
                        DataCell(Text('Pending')),
                      ]),
                      // Add more rows as needed
                    ],
                  ),
                );
              },
            ),
          ],
        )

        // SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   child: PaginatedDataTable(
        //     columns: const [
        //       DataColumn(
        //           label: Text(
        //         'Order Id',
        //         style: AppTextStyle.dataColumnText,
        //       )),
        //       DataColumn(
        //           label: Text(
        //         'Order Amount',
        //         style: AppTextStyle.dataColumnText,
        //       ),),
        //       DataColumn(
        //           label: Text(
        //         'Earnings Amount',
        //         style: AppTextStyle.dataColumnText,
        //       )),
        //       DataColumn(
        //           label: Text(
        //         'Order Status',
        //         style: AppTextStyle.dataColumnText,
        //       ))
        //     ],
        //     source: MyData(),
        //   ),
        // )
      ],
    );
  }
}

class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      10,
      (index) => {
            "Order Id": index,
            "Order Amount": "Item $index",
            "Earnings Amount": '200',
            "Order Status": '200',
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['Order Id'].toString())),
      DataCell(Text(_data[index]["Order Amount"])),
      DataCell(Text(_data[index]["Earnings Amount"].toString())),
      DataCell(Text(_data[index]["Order Status"].toString())),
    ]);
  }
}
