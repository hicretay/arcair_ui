import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';

class AddDevicePage extends StatefulWidget {
  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {

  // Wifi cihazları listesi
  List wifi = [
    ListTile(
      title: Text(
        "VODAFONE",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Icon(Icons.wifi),
    ),
    ListTile(
      title: Text(
        "TURKCELL",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Icon(Icons.wifi),
    ),
    ListTile(
      title: Text(
        "TurkTelekom",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Icon(Icons.wifi),
    ),
    ListTile(
      title: Text(
        "SuperOnline",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Icon(Icons.wifi),
    ),
    ListTile(
      title: Text(
        "TTNET",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Icon(Icons.wifi),
    ),
    ListTile(
      title: Text(
        "FiberNet",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Icon(Icons.wifi),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("CİHAZ EKLE"),
      ),
      body: BackgroundWidget(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "ARCAİR_123 Cihazını Ekle", //wifi'ı seçilen cihaz ismi verilecek
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.blueGrey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFieldWidget(   // Kullanıcı cihaz adını değiştirecek
                labelText: "Cihaz Adı",
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Cihazın Bağlanacağı Wifi'ı Seç",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey[800]),
              ),
            ),
            Flexible(
              flex: 4,
              child: ListView.builder(
                  itemCount: wifi.length,
                  itemBuilder: (BuildContext context, int index) {
                    return wifi[index]; // wifi listesi döndürülecek
                  }),
            ),
            MaterialButtonWidget(
              buttonText: "KAYDET",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/homePage", (route) => false);
              },
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
