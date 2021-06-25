import 'package:arcair/settings/consts.dart';
import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:simply_wifi/simply_wifi.dart';
import 'package:wifi_iot/wifi_iot.dart';

class AddDevicePage extends StatefulWidget {
  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  String name = "Unknown";
  List<WifiNetwork> _wifiNetworks = [];
  // wifi_iot pluginin WifiNetwork classı türünde liste

//--------------------Wifi Listesi Doldurma Fonksiyonu--------------------------
  Future<void> getWifiList() async {
    var list = await SimplyWifi.getListOfWifis();
    setState(() {
      this._wifiNetworks = list;
    });
  }
//------------------------------------------------------------------------------

  @override
  void initState() {
    setState(() {
      getWifiList();
    });
    super.initState();
  }

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
              padding: const EdgeInsets.only(top: defaultPadding),
              //----------wifi'ı seçilen cihaz ismi ----------
              child: Text(
                "ARCAİR_123 Cihazını Ekle",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.blueGrey),
              ),
              //-------------------------------------------
            ),
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding),
              // ----------Cihaz adı girişi---------------
              child: TextFieldWidget(
                labelText: "Cihaz Adı",
                obscureText: false,
              ),
              //----------------------------------------
            ),
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding),
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
              // ------------wifi listesi ----------------
              child: ListView.builder(
                itemCount: _wifiNetworks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Center(
                      child: Text(
                        _wifiNetworks[index].ssid,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  );
                },
              ),
              //-------------------------------------------
            ),
            //-------Cihazı cihaz listesine kaydetme-----------
            MaterialButtonWidget(
              buttonText: "KAYDET",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/homePage", (route) => false);
              },
            ),
            //---------------------------------------------
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
