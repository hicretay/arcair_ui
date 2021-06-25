import 'package:arcair/main.dart';
import 'package:arcair/models/dataModel.dart';
import 'package:arcair/settings/consts.dart';
import 'package:arcair/settings/functions.dart';
import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/deviceCardWidget.dart';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather _weatherdata;
  //StreamController _streamControllerdata = StreamController();

  Future<void> getPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (!status.isGranted) {
      PermissionStatus permissionStatus =
          await Permission.locationWhenInUse.request();
      print("PermissionStatus ${permissionStatus.isGranted}");
    } else if (status.isDenied) {
      Permission.locationWhenInUse.request();
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        RemoteNotification notification = message.notification;
        AndroidNotification android = message.notification?.android;
        if (notification != null && android != null) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
      0,
      "ARCAir",
      "Sıcaklık ${_weatherdata.temp.toString()} °C",
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
          importance: Importance.high,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }

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
          getPermission();
          //showNotification();
          setState(() {});
        },
      ),
      //----------------------------Sayfa Arkaplanı ----------------------------
      body: BackgroundWidget(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              StreamBuilder(
                stream: getWeatherDataStream(url1),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    this._weatherdata = snapshot.data;
                    if (this._weatherdata == null) {
                      return Text("Bir seyler yanlis gitti");
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
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              // FutureBuilder(

              //   future: getWeatherData(url2),
              //   builder: (BuildContext context, AsyncSnapshot snapshot) {
              //     if (snapshot.data != null) {
              //       this._weatherdata = snapshot.data;
              //       if (this._weatherdata == null) {
              //         return Text("Bir seyler yanlis gitti");
              //       } else {
              //         return DeviceCardWidget(
              //           airQuality: "45",
              //           cardColor: Color.fromRGBO(0, 255, 0, 0.2),
              //           deviceName: "KONYA",
              //           coLevel: "33",
              //           humidityLevel: _weatherdata.humidity.toString(),
              //           temperature: _weatherdata.temp.toString(),
              //           warningColor: Colors.transparent,
              //         );
              //       }
              //     } else {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
      //------------------------------------------------------------------------
    );
  }

  // -----------------------------Sağ üst açılır menü---------------------------
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
    //--------------------------------------------------------------------------
  }
}
