import 'package:arcair/settings/consts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//DeviceDetailPage sayfasının anlık veriler görünümü
class DetailCardWidget extends StatelessWidget {
  final int coLevel,
      temperature,
      humidityLevel,
      airQuality; // Cihazdan alınacak değerler
  final Color warningColor; // Card da görünecek uyarı icon rengi.
  // Değerler normal ise ikon rengi transparent olacak
  final VoidCallback onPressed; // Alarm iconButton onPressi

  DetailCardWidget(
      {this.coLevel,
      this.temperature,
      this.humidityLevel,
      this.airQuality,
      this.warningColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Row(
            children: [
              //----------Uyarı ikonu-------
              Icon(
                Icons.warning_rounded,
                color: warningColor,
                size: 40,
              ),
              //----------------------------
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //-----------------Karbonmonoksit ---------------------
                    Text(
                      "CO",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Text("ppm"),
                    Text(
                      coLevel.toString(),
                      style: iconStyle,
                    ),
                    //----------------------------------------------------------
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    //-----------------------Nem---------------------------------
                    Icon(
                      FontAwesomeIcons.tint,
                      size: 35,
                      color: Colors.blue,
                    ),
                    Text("%"),
                    Text(
                      humidityLevel.toString(),
                      style: iconStyle,
                    ),
                    //------------------------------------------------------------
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    //-----------------------Sıcaklık-------------------------------
                    Icon(
                      FontAwesomeIcons.thermometerHalf,
                      size: 35,
                      color: Colors.red,
                    ),
                    Text("°C"),
                    Text(
                      temperature.toString(),
                      style: iconStyle,
                    ),
                    //---------------------------------------------------------------
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    //--------------------Hava Kalitesi------------------------------
                    Icon(
                      FontAwesomeIcons.wind,
                      size: 35,
                      color: Colors.blueGrey,
                    ),
                    Text("ppm"),
                    Text(
                      airQuality.toString(),
                      style: iconStyle,
                    ),
                    //---------------------------------------------------------------
                  ],
                ),
              ),
              //-------------Alarm icon Butonu-----------
              IconButton(
                icon: Icon(FontAwesomeIcons.solidBell),
                color: Colors.black,
                iconSize: iconSize,
                onPressed: onPressed,
              ),
              //-------------------------------------------
            ],
          ),
        ],
      ),
    );
  }
}
