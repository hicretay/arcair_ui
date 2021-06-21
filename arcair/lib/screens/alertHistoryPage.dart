import 'package:arcair/widgets/alertHistoryCardWidget.dart';
import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:flutter/material.dart';

class AlertHistoryPage extends StatefulWidget {
  @override
  _AlertHistoryPageState createState() => _AlertHistoryPageState();
}

// AlertHistoryCardWidget ' ı kullanılarak oluşturuldu
class _AlertHistoryPageState extends State<AlertHistoryPage> {
  //--------Cihazdan gelen uyarı mesajlarının listesi-----------
  List alertItems = [
    AlertHistoryCardWidget(
      alertText:
          "Dikkat hava kalitesi zararlı seviyede! Lütfen ortamı havalandırın !",
      cardColor: Color.fromRGBO(255, 103, 55, 0.3),
      airQuality: 73,
      coLevel: 35,
      humidityLevel: 30,
      temperature: 22,
    ),
    AlertHistoryCardWidget(
      alertText: "Dikkat zehirlenme uyarısı karbonmonoksit tehlikeli seviyede!",
      airQuality: 43,
      cardColor: Color.fromRGBO(0, 0, 0, 0.4),
      coLevel: 75,
      humidityLevel: 30,
      temperature: 22,
    ),
  ];
  //-------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UYARI GEÇMİŞİ"),
      ),
      body: BackgroundWidget(
        child: ListView.builder(
            itemCount: alertItems.length,
            itemBuilder: (context, index) {
              AlertHistoryCardWidget keyValue = alertItems[
                  index]; // keyValue = AlertHistoryCardWidget ının indexinci itemi
              return Dismissible(
                onDismissed: (direction) {
                  setState(() {
                    alertItems.removeAt(index); // itemin silinmesi
                  });
                },
                child: alertItems[index],
                key: Key(keyValue.dateTime.toString()),
                //-----dismissible kaydırıldıgında oluşacak görünüm-------             
                background: Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                //-------------------------------------------------------
              );
            }),
      ),
    );
  }
}
