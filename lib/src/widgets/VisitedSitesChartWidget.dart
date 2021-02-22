import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../config/app_config.dart' as config;

class VisitedChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: config.App(context).appHeight(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sites Visited',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: config.App(context).appHeight(30),
            width: config.App(context).appWidth(90),
            child: LineChart(LineChartData(
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                ),
                touchCallback: (LineTouchResponse touchResponse) {},
                handleBuiltInTouches: true,
              ),
              gridData: FlGridData(
                show: false,
              ),
              titlesData: FlTitlesData(
                bottomTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  getTextStyles: (value) => const TextStyle(
                    color: Color(0xff72719b),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  margin: 10,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 2:
                        return 'SEPT';
                      case 7:
                        return 'OCT';
                      case 12:
                        return 'DEC';
                    }
                    return '';
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                    color: Color(0xff75729e),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 1:
                        return '1m';
                      case 2:
                        return '2m';
                      case 3:
                        return '3m';
                      case 4:
                        return '5m';
                    }
                    return '';
                  },
                  margin: 8,
                  reservedSize: 30,
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  bottom: BorderSide(
                    color: Color(0xff4e4965),
                    width: 4,
                  ),
                  left: BorderSide(
                    color: Colors.transparent,
                  ),
                  right: BorderSide(
                    color: Colors.transparent,
                  ),
                  top: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
              // minX: 0,
              // maxX: 14,
              // maxY: 4,
              // minY: 0,
              lineBarsData: linesBarData1(),
            )),
          )
        ],
      ),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        const Color(0xffaa4cfc),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );

    return [
      lineChartBarData2,
    ];
  }
}
