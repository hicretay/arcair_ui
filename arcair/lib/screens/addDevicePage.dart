import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';

class AddDevicePage extends StatefulWidget {
  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
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
                "ARCAİR_123 Cihazını Ekle",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.blueGrey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFieldWidget(
                labelText: "Cihaz Adı",
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Cihazın Bağlanacağı Wifi'ı Seç",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ),
            MaterialButtonWidget(
              onPressed: () {},
              buttonText: "KAYDET",
            ),
          ],
        ),
      ),
    );
  }
}
