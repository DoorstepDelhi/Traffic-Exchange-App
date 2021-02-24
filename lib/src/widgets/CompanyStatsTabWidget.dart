import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/HitsChartWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/StatsChartWidget.dart';
import 'package:flutter/material.dart';

class CompanyStatsTabWidget extends StatefulWidget {
  @override
  _CompanyStatsTabWidgetState createState() => _CompanyStatsTabWidgetState();
}

class _CompanyStatsTabWidgetState extends State<CompanyStatsTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30.0),
        StatsChartWidget(title: 'This Week'),
        StatsChartWidget(title: 'This Month'),
        StatsChartWidget(title: 'This Year'),
      ],
    );
  }
}
