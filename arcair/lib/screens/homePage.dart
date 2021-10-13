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
  Weather _weatherdata; // Weather model sınıfı türünden değişken

// ----------------------Wifi İçin Konum İzni Fonksiyonu------------------------
  Future<void> getPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (!status.isGranted) {
      PermissionStatus permissionStatus =
          await Permission.locationWhenInUse.request();
      // konum izni verildiyse
      print("PermissionStatus ${permissionStatus.isGranted}");
      // konum izni reddedildiyse
    } else if (status.isDenied) {
      Permission.locationWhenInUse.request();
    }
  }

//------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
// -----------------------Firebase'den alınan mesajı dinleme--------------------
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        RemoteNotification notification = message.notification;
        AndroidNotification android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode, // bildirim kodu
            notification.title, // bildirim başlığı
            notification.body, // bildirim içeriği
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id, //kanal id'si
                channel.name, // kanal adı
                channel.description, // bildirim içeriği
                color: Colors.blue, // ikon rengi
                playSound: true, // ses seçeneği
                icon: '@mipmap/ic_launcher', // bildirim ikonu
              ),
            ),
          );
        }
      },
    );
//------------------------------------------------------------------------------

//-------------------Bildirim Açıldığında görünecek yapı------------------------
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        RemoteNotification notification = message.notification;
        // Android için bildirim oluşturma
        AndroidNotification android = message.notification?.android;
        if (notification != null && android != null) {
          // ------bildirim boş değilse gösterilecek alertDialog yapısı---------
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title), // bildirim başlığını alma
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body), // bildirim içeriğini alma
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
//------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("ARCAİR"),
        actions: [buildPopupMenu()], //açılır menü fonksiyonu
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
          // Yakındaki wifilara yönlendirme
          getPermission(); // konum izni isteme
          setState(() {});
        },
      ),
      //----------------------------Sayfa Arkaplanı ----------------------------
      body: BackgroundWidget(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              //-------------FutureBuilder ile apiden veri çekme----------------
              FutureBuilder(
                future: getWeatherData(url1),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    this._weatherdata = snapshot.data;
                    if (this._weatherdata == null) {
                      return Text("Bir seyler yanlis gitti");
                      // hata mesajı
                    } else {
                      return DeviceCardWidget(
                        airQuality: "43",
                        cardColor: Color.fromRGBO(0, 255, 0, 0.2),
                        // transparan yeşil
                        deviceName: "AFYON",
                        coLevel: "35",
                        humidityLevel: _weatherdata.humidity.toString(),
                        // apiden çekilen nem seviyesi değeri
                        temperature: _weatherdata.temp.toString(),
                        // apiden çekilen sıcalkık değeri
                        warningColor: Colors.transparent,
                      );
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                    // veri çekilene kadar progress döndür
                  }
                },
              ),
              //----------------------------------------------------------------

              //-------------FutureBuilder ile apiden veri çekme----------------
              FutureBuilder(
                future: getWeatherData(url2),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    this._weatherdata = snapshot.data;
                    if (this._weatherdata == null) {
                      return Text("Bir seyler yanlis gitti");
                      // hata mesajı
                    } else {
                      return DeviceCardWidget(
                        airQuality: "45",
                        cardColor: Color.fromRGBO(0, 255, 0, 0.2),
                        // transparan yeşil
                        deviceName: "KONYA",
                        coLevel: "33",
                        humidityLevel: _weatherdata.humidity.toString(),
                        // apiden çekilen nem seviyesi değeri
                        temperature: _weatherdata.temp.toString(),
                        // apiden çekilen sıcalkık değeri
                        warningColor: Colors.transparent,
                      );
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                    // veri çekilene kadar progress döndür
                  }
                },
              ),
              //----------------------------------------------------------------
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
