import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/rangeSliderWidget.dart';
import 'package:flutter/material.dart';

class AlertSettingPage extends StatefulWidget {
  @override
  _AlertSettingPageState createState() => _AlertSettingPageState();
}

class _AlertSettingPageState extends State<AlertSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("CİHAZI PROGRAMLA"),
      ),
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Flexible(
                child: Text(
                  "SALON",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 25),
                ),
              ),
              Flexible(
                child: RangeSliderWidget(
                  divisions: 100,
                  max: 1000,
                  min: 0,
                  sliderName: "CO(ppm)",
                  start: 400,
                  end: 600,
                ),
              ),
              Flexible(
                child: RangeSliderWidget(
                  divisions: 100,
                  max: 100,
                  min: 0,
                  sliderName: "Nem(%)",
                  start: 20,
                  end: 60,
                ),
              ),
              Flexible(
                child: RangeSliderWidget(
                  divisions: 40,
                  max: 40,
                  min: 0,
                  sliderName: "Sıcaklık",
                  start: 22,
                  end: 26,
                ),
              ),
              Flexible(
                child: RangeSliderWidget(
                  divisions: 100,
                  max: 1000,
                  min: 0,
                  sliderName: "Hava\nKalitesi",
                  start: 400,
                  end: 600,
                ),
              ),
              Flexible(
                child: Text(
                  "Uyarı Metni",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Uyarı metnini giriniz:",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButtonWidget(
                        buttonText: "KAYDET",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: MaterialButtonWidget(
                        buttonText: "VAZGEÇ",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: TextButton(
                  child: Text(
                    "Uyarı geçmişini Görüntüle",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/alertHistoryPage");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
