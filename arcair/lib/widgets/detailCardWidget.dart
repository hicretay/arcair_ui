import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//DeviceDetailPage sayfasının görünümü
class DetailCardWidget extends StatelessWidget {
  final int coLevel, temperature, humidityLevel, airQuality; // Cihazdan alınacak değerler
  final Color warningColor; // Card da görünecek uyarı icon rengi. Değerler normal ise ikon rengi transparent olacak
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
              Icon(
                Icons.warning_rounded,
                color: warningColor,
                size: 40,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CO",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Text("ppm"),
                    Text(
                      coLevel.toString(),
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.tint,
                      size: 35,
                      color: Colors.blue,
                    ),
                    Text("%"),
                    Text(
                      humidityLevel.toString(),
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.thermometerHalf,
                      size: 35,
                      color: Colors.red,
                    ),
                    Text("°C"),
                    Text(
                      temperature.toString(),
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.wind,
                      size: 35,
                      color: Colors.blueGrey,
                    ),
                    Text("ppm"),
                    Text(
                      airQuality.toString(),
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.solidBell),
                color: Colors.black,
                iconSize: 40,
                onPressed: onPressed,
              )
            ],
          ),
        ],
      ),
    );
  }
}
