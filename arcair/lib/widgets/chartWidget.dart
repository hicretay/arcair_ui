import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';

 //Grafiklerin Görünümü, deviceDetailPage sayfasında kullanıldı
class ChartWidget extends StatelessWidget {
  final String chartTitle, columnName, labelFormat;
  final int value0, value6, value12, value18, value24;
  final double columnMax;
  final Color color;
  ChartWidget({
    this.chartTitle,
    this.columnName,
    this.columnMax,
    this.value0,
    this.value6,
    this.value12,
    this.value18,
    this.value24,
    this.labelFormat,
    this.color,
  });

  List getDefaultLineSeries() {
    final List<ChartVariables> lines = <ChartVariables>[
      ChartVariables(time: 0, value: value0),
      ChartVariables(time: 6, value: value6),
      ChartVariables(time: 12, value: value12),
      ChartVariables(time: 18, value: value18),
      ChartVariables(time: 24, value: value24),
    ];
    return <LineSeries<ChartVariables, num>>[
      LineSeries<ChartVariables, num>(
          dataSource: lines,
          xValueMapper: (ChartVariables sales, _) => sales.time,
          yValueMapper: (ChartVariables sales, _) => sales.value,
          enableTooltip: true,
          width: 2,
          markerSettings: MarkerSettings(isVisible: true),
          color: color),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SfTheme(
      data: SfThemeData(
        chartThemeData: SfChartThemeData(
          brightness: Brightness.dark,
          axisLabelColor: Colors.black,
          axisTitleColor: Colors.black,
          majorTickLineColor: Colors.black,
        ),
      ),
      child: SfCartesianChart(
        title: ChartTitle(
          text: chartTitle,
          textStyle: TextStyle(color: color, fontSize: 18),
        ),
        margin: EdgeInsets.only(right: 25, left: 5),
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryXAxis: NumericAxis(
          title: AxisTitle(text: "Zaman(Saat)"),
          name: "Saat",
          desiredIntervals: 4,
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: columnName),
          labelFormat: labelFormat,
          visibleMaximum: columnMax,
        ),
        series: getDefaultLineSeries(),
      ),
    );
  }
}

class ChartVariables {
  final int value, time;
  ChartVariables({this.value, this.time});
}
