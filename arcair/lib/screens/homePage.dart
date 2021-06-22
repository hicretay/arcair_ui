import 'dart:convert';

import 'package:arcair/models/dataModel.dart';
import 'package:arcair/settings/consts.dart';
import 'package:arcair/settings/functions.dart';
import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/deviceCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ---DeviceCardWidget sınıfı türünde cihaz bilgileri listesi----
  //List<DeviceCardWidget> devices = [];
  //------------------------------------------------------------
  Weather _weatherdata;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("ARCAİR"),
        actions: [buildPopupMenu()],
      ),
      floatingActionButton: FloatingActionButton(
        // yeni cihaz ekleme
        backgroundColor: Color(primaryColor),
        child: Icon(
          Icons.add,
          size: 28,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/nearbyWifiPage");
        },
      ),
      //--------------------Sayfa Arkaplanı -----------------------
      body: BackgroundWidget(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    FutureBuilder(
                      future: weatherDataFunc(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          this._weatherdata = snapshot.data;
                          if (this._weatherdata == null) {
                            print("Birseyler yanlis gitti");
                            return Text("Birseyler yanlis gitti");
                          } else {
                            return DeviceCardWidget(
                              airQuality: "43",
                              cardColor: Color.fromRGBO(0, 255, 0, 0.2),
                              deviceName: "AFYON",
                              coLevel: "35",
                              humidityLevel: _weatherdata.humidity.toString(),
                              temperature: _weatherdata.temp.toString(),
                              warningColor: Colors.transparent,
                            );
                          } // devices listesi döndürülecek
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                );
              }),
        ),
      ),
      //-----------------------------------------------------------
    );
  }

  // ----------------Sağ üst açılır menü--------------------
  buildPopupMenu() {
    return PopupMenuButton(
      onSelected: (value) {},
      itemBuilder: (context) => [
        //Ayarlar sekmesi
        PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            minLeadingWidth: 1,
            title: Text("Ayarlar"),
          ),
        ),
        //Lisans Bilgileri Sekmesi
        PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.insert_drive_file_rounded, color: Colors.black),
            minLeadingWidth: 1,
            title: Text("Lisans Bilgileri"),
          ),
        ),
        //Hakkında sekmesi
        PopupMenuItem(
          value: 3,
          child: ListTile(
            leading: Icon(Icons.info, color: Colors.black),
            minLeadingWidth: 1,
            title: Text("Hakkında"),
          ),
        ),
        //Çıkış sekmesi kilit ekranına atacak
        PopupMenuItem(
          value: 4,
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/loginPage");
            },
            leading: Icon(Icons.exit_to_app, color: Colors.black),
            minLeadingWidth: 1,
            title: Text("Çıkış"),
          ),
        ),
      ],
    );
    //--------------------------------------------------------------
  }
}
