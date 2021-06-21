import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/rangeSliderWidget.dart';
import 'package:flutter/material.dart';

class DeviceProgrammingPage extends StatefulWidget {
  @override
  _DeviceProgrammingPageState createState() => _DeviceProgrammingPageState();
}

// RangeSliderWidget ' ı kullanıldı
class _DeviceProgrammingPageState extends State<DeviceProgrammingPage> {
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

              // RangeSlider sınıfı ile oluşturulmuş sliderlar
              Flexible(
                child: RangeSliderWidget(
                  divisions: 100,
                  max: 1000,
                  min: 0,
                  sliderName: "CO(ppm)",
                  start: 400,
                  end: 600,
                  sliderColor: Colors.black,
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
                  sliderColor: Colors.blue,
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
                  sliderColor: Colors.red,
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
                  sliderColor: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                // ------Kullanıcının uyarı mesajını gireceği textField--------
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Uyarı metnini giriniz:",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                //-------------------------------------------------------------
              ),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      //---------Programlanan uyarıyı kaydetme----------------
                      child: MaterialButtonWidget(
                        buttonText: "KAYDET",
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/homePage", (route) => false);
                        },
                      ),
                      //------------------------------------------------------
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      //-------Detay sayfasıan gitme--------------------------
                      child: MaterialButtonWidget(
                        buttonText: "VAZGEÇ",
                        onPressed: () {
                          Navigator.pushNamed(context, "/deviceDetailPage");
                        },
                      ),
                      //-----------------------------------------------------
                    ),
                  ],
                ),
              ),
              Flexible(
                // -------eski uyarıları listeleyecek sayfaya geçiş------
                child: TextButton( 
                  child: Text(
                    "Uyarı Geçmişini Görüntüle",
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
                //-------------------------------------------------------
              ),
            ],
          ),
        ),
      ),
    );
  }
}
