import 'dart:ui';

import 'package:arcair/settings/consts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

//AlertHistoryPage görünümü
class AlertHistoryCardWidget extends StatelessWidget {
  //--------Cihazdan gelen değerler----------
  final int coLevel, temperature, humidityLevel, airQuality;
  //------------------------------------------
  final String alertText; //alertText: Uyarı metni
  final Color cardColor; // uyarı seviyesine göre card rengi
  final DateTime dateTime =
      new DateTime.now(); // Uyarı zamanı(verildiği zamanı alacak)

  //-----Değiskenlerin constructorları----
  AlertHistoryCardWidget(
      {this.alertText,
      this.cardColor,
      this.coLevel,
      this.temperature,
      this.humidityLevel,
      this.airQuality});
//------------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 230,
          child: Card(
            color: cardColor,
            child: ListTile(
              title: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    //----------Uyarı Zamanı-------------
                    child: Text(
                      DateFormat.yMd().format(dateTime),
                      style: textStyle,
                    ),
                    //-----------------------------------
                  ),
                  //----------------Uyarı Metni----------------------------
                  Text(
                    alertText,
                    style: textStyle
                  ),
                  //-----------------------------------------------------------
                  SizedBox(
                    height: minSpace,
                  ),
                  Row(
                    //-----------------------Uyarı anındaki cihaz değerleri-------------------
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //-----------------Karbonmonoksit----------------------------
                            Text(
                              "CO",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                            Text("ppm"),
                            Text(
                              coLevel.toString(),
                              style: iconStyle,
                            ),
                            //---------------------------------------------------------
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            //------------------------Nem---------------------------------
                            Icon(
                              FontAwesomeIcons.tint,
                              size: iconSize,
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
                            //-----------------------Sıcaklık-----------------------------
                            Icon(
                              FontAwesomeIcons.thermometerHalf,
                              size: iconSize,
                              color: Colors.red,
                            ),
                            Text("°C"),
                            Text(
                              temperature.toString(),
                              style: iconStyle,
                            ),
                            //--------------------------------------------------------------
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            //-----------------------Hava Kalitesi---------------------------
                            Icon(
                              FontAwesomeIcons.wind,
                              size: iconSize,
                              color: Colors.blueGrey,
                            ),
                            Text("ppm"),
                            Text(
                              airQuality.toString(),
                              style: iconStyle,
                            ),
                            //--------------------------------------------------------------
                          ],
                        ),
                      ),
                      //----------Uyarı ikonu---------
                      Icon(
                        Icons.warning_rounded,
                        color: Colors.black,
                        size: 40,
                      ),
                      //----------------------------
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
