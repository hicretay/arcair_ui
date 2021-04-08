import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

//AlertHistoryPage görünümü
class AlertHistoryCardWidget extends StatelessWidget {
  final String coLevel, temperature, humidityLevel, airQuality;
  final String alertText;
  final Color cardColor;
  final DateTime dateTime = new DateTime.now();

  AlertHistoryCardWidget({
    this.alertText,
    this.cardColor,
    this.coLevel,
    this.temperature,
    this.humidityLevel,
    this.airQuality,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Card(
        color: cardColor,
        child: ListTile(
          title: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  DateFormat.yMd().format(dateTime),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(alertText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  overflow: TextOverflow.clip),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                        Text("ppm"),
                        Text(
                          coLevel,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
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
                          humidityLevel,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
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
                          temperature,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
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
                          airQuality,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.warning_rounded,
                    color: Colors.black,
                    size: 40,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
