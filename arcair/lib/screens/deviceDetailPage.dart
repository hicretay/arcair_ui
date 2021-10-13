import 'package:arcair/settings/consts.dart';
import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/chartWidget.dart';
import 'package:arcair/widgets/detailCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DeviceDetailPage extends StatefulWidget {
  @override
  _DeviceDetailPageState createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {

  // --------chartWidget sınıfından oluşturulmuş grafik listesi---------
  List<ChartWidget> charts = [
    ChartWidget(
      columnName: "CO(ppm)",
      chartTitle: "Karbonmonoksit",
      columnMax: 200,
      value0: 35,
      value6: 40,
      value12: 41,
      value18: 43,
      value24: 45,
      color: Colors.black,
    ),
    ChartWidget(
      columnName: "Nem(%)",
      chartTitle: "Nem",
      columnMax: 100,
      value0: 35,
      value6: 33,
      value12: 28,
      value18: 25,
      value24: 28,
      labelFormat: '%{value}',
      color: Colors.blue,
    ),
    ChartWidget(
      columnName: "Sıcaklık(°C)",
      chartTitle: "Sıcaklık",
      columnMax: 35,
      value0: 22,
      value6: 23,
      value12: 21,
      value18: 21,
      value24: 23,
      color: Colors.red,
    ),
    ChartWidget(
      columnName: "Hava Kalitesi(ppm)",
      chartTitle: "Hava Kalitesi",
      columnMax: 500,
      value0: 250,
      value6: 280,
      value12: 300,
      value18: 290,
      value24: 290,
      color: Colors.blueGrey,
    )
  ];
  //------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("AFYON"),   // seçilen cihaz adı appBara yazılacak
      ),
      body: BackgroundWidget(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding),
              child: DetailCardWidget(   // cihazın anlık değerlerini verecek
                airQuality: 43,
                coLevel: 35,
                humidityLevel: 29,
                temperature: 28,
                warningColor: Colors.black,
                onPressed: () {
                  // Cihaz Programlama sayfasına geçiş 
                  Navigator.pushNamed(context, "/deviceProgrammingPage");  // alarm iconuna basıldığında cihaz programlama sayfasına atacak
                },
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: charts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: charts[index],  //charts listesi döndürülecek
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
