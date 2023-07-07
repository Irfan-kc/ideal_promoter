import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class GraphView extends StatefulWidget {
  const GraphView({super.key});

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  List<Color> gradientColors = [Colors.blue, Colors.white];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22, right: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Monthly Earnings',
                style: AppTextStyle.titleText1,
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/money-cash.png'),
                    height: 20,
                  ),
                  Text(
                    '420',
                    style: TextStyle(
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
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 3.70,
                child: LineChart(
                  mainData(),
                ),
              ),
            ],
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
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 2:
        text = const Text('Feb', style: style);
        break;
      case 3:
        text = const Text('Mar', style: style);
        break;
      case 4:
        text = const Text('Apr', style: style);
        break;
      case 5:
        text = const Text('May', style: style);
        break;
      case 6:
        text = const Text('Jun', style: style);
        break;
      case 7:
        text = const Text('Jly', style: style);
        break;
      case 8:
        text = const Text('Aug', style: style);
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

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
        horizontalInterval: 1,
        verticalInterval: 1,
      ),
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
            reservedSize: 30,
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
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 9,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(-0.5, 3),
            FlSpot(2, 1),
            FlSpot(3, 2),
            FlSpot(4, 3.1),
            FlSpot(5, 4),
            FlSpot(7, 3),
            FlSpot(9, 4),
            FlSpot(10, 4),
          ],
          isCurved: true,
          gradient: const LinearGradient(
            colors: [AppColors.primaryColor, Colors.blue],
          ),
          barWidth: 2,
          isStrokeCapRound: false,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 236, 245, 252),
              Color(0xFFD2DEFF),
              Colors.white
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            spotsLine: BarAreaSpotsLine(
              applyCutOffY: false,
              show: true,
              flLineStyle: const FlLine(
                color: AppColors.primaryColor,
                strokeWidth: 25,
              ),
              checkToShowSpotLine: (spot) => spot.x == 4,
            ),
          ),
        ),
      ],
    );
  }
}
