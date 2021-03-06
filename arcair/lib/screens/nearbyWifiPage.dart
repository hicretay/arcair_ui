import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:flutter/material.dart';

class NearbyWifiPage extends StatefulWidget {
  @override
  _NearbyWifiPageState createState() => _NearbyWifiPageState();
}

class _NearbyWifiPageState extends State<NearbyWifiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WIFI LİSTESi",
        ),
      ),
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(
            15.0,
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Column(
                  children: [
                    Text(
                      "ARCAİR Cihazınızı Seçiniz",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blueGrey,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "ARCAİR_123",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(Icons.wifi),
                      // Cihaz seçildiğinde ekleme sayfasına yönlendirilecek
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/addDevicePage",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
