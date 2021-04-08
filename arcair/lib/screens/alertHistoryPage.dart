import 'package:arcair/widgets/alertHistoryCardWidget.dart';
import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:flutter/material.dart';

class AlertHistoryPage extends StatefulWidget {
  @override
  _AlertHistoryPageState createState() => _AlertHistoryPageState();
}

class _AlertHistoryPageState extends State<AlertHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UYARI GEÇMİŞİ"),
      ),
      body: BackgroundWidget(
        child: Column(
          children: [
            Flexible(
              child: AlertHistoryCardWidget(
                cardColor: Color.fromRGBO(255, 103, 55, 0.3),
                alertText:
                    "Dikkat hava kalitesi zararlı seviyede! Lütfen ortamı havalandırın !",
                airQuality: "73",
                coLevel: "35",
                humidityLevel: "30",
                temperature: "22",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
