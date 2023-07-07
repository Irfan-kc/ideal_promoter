import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/const_color.dart';
import '../../../../../constant/text_style.dart';
import '../../../../widget/height_and_width.dart';

class GraphView extends StatefulWidget {
  const GraphView({
    super.key,
  });

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  List<int> showingTooltipOnSpots = [];

  List<FlSpot> get allSpots => const [
        FlSpot(-1, 3),
        FlSpot(0, 3),
        FlSpot(1, 2),
        FlSpot(2, 4),
        FlSpot(3, 3),
        FlSpot(4, 4),
        FlSpot(5, 6),
        FlSpot(6, 6),
        FlSpot(7, 8),
        FlSpot(8, 6),
        FlSpot(9, 7),
        FlSpot(10, 6),
        FlSpot(11, 5),
        FlSpot(12, 4),
      ];

  double selectedYValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: true,
        barWidth: 2,
        dotData: const FlDotData(show: false),
        gradient: const LinearGradient(
          colors: [AppColors.primaryColor, Colors.blue],
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 236, 245, 252),
            Color(0xFFD2DEFF),
            Colors.white
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Monthly Earnings',
                style: AppTextStyle.titleText1,
              ),
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/money-cash.png'),
                    height: 20,
                  ),
                  Text(
                    selectedYValue.toString(),
                    style: const TextStyle(
                        fontSize: 12.6,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  )
                ],
              )
            ],
          ),
        ),
        const KHeight(9),
        SizedBox(
          height: 108,
          child: AspectRatio(
            aspectRatio: 3.7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: LineChart(
                LineChartData(
                  showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                    return ShowingTooltipIndicators([
                      LineBarSpot(
                        tooltipsOnBar,
                        lineBarsData.indexOf(tooltipsOnBar),
                        tooltipsOnBar.spots[index],
                      ),
                    ]);
                  }).toList(),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchCallback:
                        (FlTouchEvent event, LineTouchResponse? response) {
                      if (response == null || response.lineBarSpots == null) {
                        return;
                      }
                      if (event is FlTapUpEvent) {
                        final spotIndex =
                            response.lineBarSpots!.first.spotIndex;
                        final yValue = response.lineBarSpots!.first.y;

                        setState(() {
                          showingTooltipOnSpots.clear();
                          showingTooltipOnSpots.add(spotIndex);
                          selectedYValue = yValue;
                          print(spotIndex);
                          print(yValue);
                        });
                      }
                    },
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((index) {
                        return const TouchedSpotIndicatorData(
                          FlLine(
                            strokeWidth: 10,
                            color: AppColors.primaryColor,
                          ),
                          FlDotData(
                            show: false,
                          ),
                        );
                      }).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: AppColors.primaryColor,
                      tooltipRoundedRadius: 8,
                      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                        return lineBarsSpot.map((lineBarSpot) {
                          return LineTooltipItem(
                            lineBarSpot.y.toString(),
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: lineBarsData,
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 15,
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 20,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        interval: 1,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 42,
                      ),
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(
                    show: false,
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Color(0xFFAEAEAE),
        fontWeight: FontWeight.w400,
        fontSize: 11,
        letterSpacing: 0.272);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Jan', style: style);
        break;
      case 1:
        text = const Text('Feb', style: style);
        break;
      case 2:
        text = const Text('Mar', style: style);
        break;
      case 3:
        text = const Text('Apr', style: style);
        break;
      case 4:
        text = const Text('May', style: style);
        break;
      case 5:
        text = const Text('Jun', style: style);
        break;
      case 6:
        text = const Text('Jly', style: style);
        break;
      case 7:
        text = const Text('Aug', style: style);
        break;

      case 8:
        text = const Text('Sep', style: style);
        break;

      case 9:
        text = const Text('Oct', style: style);
        break;

      case 10:
        text = const Text('Nov', style: style);
        break;
      case 11:
        text = const Text('Dec', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '30K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  int findLargest(List<dynamic>? arr) {
    if (arr != null) {
      int largest = int.parse(arr[0]);
      for (int i = 1; i < arr.length; i++) {
        if (int.parse(arr[i]) > largest) {
          largest = int.parse(arr[i]);
        }
      }
      return largest;
    } else {
      return 100;
    }
  }
}
