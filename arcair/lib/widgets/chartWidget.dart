import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';

 //Grafiklerin Görünümü, deviceDetailPage sayfasında kullanıldı
class ChartWidget extends StatelessWidget {
  final String chartTitle, columnName, labelFormat;  //grafik başlığı , kolon adı ve kolon görünümü(% veya normal değer)
  final int value0, value6, value12, value18, value24;  // altı saatte alınan grafik değerleri
  final double columnMax; // kolonun max alabileceği değer
  final Color color;  // başlık ve grafik rengi

  //----------Değişken Constructorları--------------
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
  //----------------------------------------------

  List getDefaultLineSeries() {
    //---------Cihaz değerleri Listesi-----------
    final List<ChartVariables> lines = <ChartVariables>[
      ChartVariables(time: 0, value: value0),
      ChartVariables(time: 6, value: value6),
      ChartVariables(time: 12, value: value12),
      ChartVariables(time: 18, value: value18),
      ChartVariables(time: 24, value: value24),
    ];
    //-------------------------------------------
    
    return <LineSeries<ChartVariables, num>>[
      //-----------------------Grafik Değerleri atanması-------------------------
      LineSeries<ChartVariables, num>(
          dataSource: lines,
          xValueMapper: (ChartVariables sales, _) => sales.time, // x ekseni zaman
          yValueMapper: (ChartVariables sales, _) => sales.value, // y ekseni değerler
          enableTooltip: true,
          width: 2,
          markerSettings: MarkerSettings(isVisible: true),
          color: color),
    ];
    //--------------------------------------------------------------------------
  }

  @override
  Widget build(BuildContext context) {
    //--------------------Garfik Görünümü--------------------------------
    return SfTheme(
      data: SfThemeData(
        chartThemeData: SfChartThemeData(
          brightness: Brightness.dark,
          axisLabelColor: Colors.black,
          axisTitleColor: Colors.black,
          majorTickLineColor: Colors.black,
        ),
      ),
      child: SfCartesianChart(   //SfCartesianChart widgetı ile grafik oluşturulması
        title: ChartTitle(
          text: chartTitle,
          textStyle: TextStyle(color: color, fontSize: 18),
        ),
        margin: EdgeInsets.only(right: 25, left: 5),
        tooltipBehavior: TooltipBehavior(enable: true),
        //-------------X ekseni ----------------
        primaryXAxis: NumericAxis(
          title: AxisTitle(text: "Zaman(Saat)"),
          name: "Saat",
          desiredIntervals: 4,
        ),
        //------------------------------------
        //------------Y ekseni-----------------
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: columnName),
          labelFormat: labelFormat,
          visibleMaximum: columnMax,
        ),
        //------------------------------------
        series: getDefaultLineSeries(),
      ),
    );
    //-----------------------------------------------------------------
  }
}

class ChartVariables {  //grafikteki x ve y koordinatlarının seçilmesi
  final int value, time;
  ChartVariables({this.value, this.time});
}
