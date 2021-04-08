import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/deviceCardWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DeviceCardWidget> devices = [
    DeviceCardWidget(
      airQuality: "43",
      cardColor: Color.fromRGBO(0, 255, 0, 0.2),
      deviceName: "SALON",
      coLevel: "35",
      humidityLevel: "30",
      temperature: "22",
      warningColor: Colors.transparent,
    ),
    DeviceCardWidget(
      airQuality: "43",
      cardColor: Color.fromRGBO(255, 0, 0, 0.3),
      deviceName: "CİHAZ_1",
      coLevel: "35",
      humidityLevel: "30",
      temperature: "22",
      warningColor: Colors.black,
    ),
    DeviceCardWidget(
      airQuality: "43",
      cardColor: Color.fromRGBO(0, 0, 0, 0.4),
      deviceName: "TOPLANTI ODASI",
      coLevel: "75",
      humidityLevel: "30",
      temperature: "22",
      warningColor: Colors.black,
    ),
    DeviceCardWidget(
      airQuality: "43",
      cardColor: Color.fromRGBO(255, 103, 55, 0.3),
      deviceName: "CİHAZ_2",
      coLevel: "35",
      humidityLevel: "30",
      temperature: "22",
      warningColor: Colors.black,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("ARCAİR"),
        actions: [buildPopupMenu()],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff66778e),
        child: Icon(
          Icons.add,
          size: 28,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/nearbyWifiPage");
        },
      ),
      body: BackgroundWidget(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (BuildContext context, int index) {
                return devices[index];
              }),
        ),
      ),
    );
  }

  buildPopupMenu() {
    return PopupMenuButton(
      onSelected: (value) {},
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            minLeadingWidth: 1,
            title: Text("Ayarlar"),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.insert_drive_file_rounded, color: Colors.black),
            minLeadingWidth: 1,
            title: Text("Lisans Bilgileri"),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: ListTile(
            leading: Icon(Icons.info, color: Colors.black),
            minLeadingWidth: 1,
            title: Text("Hakkında"),
          ),
        ),
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
  }
}
