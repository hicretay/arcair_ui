import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//HomePage sayfasının görünümü
class DeviceCardWidget extends StatelessWidget {
  final String coLevel, temperature, humidityLevel, airQuality;
  final String deviceName;
  final Color cardColor;
  final Color warningColor;
  DeviceCardWidget({
    this.deviceName,
    this.cardColor,
    this.coLevel,
    this.temperature,
    this.humidityLevel,
    this.airQuality,
    this.warningColor,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
        height: 150,
        child: Card(
          color: cardColor,
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/deviceDetailPage");
            },
            title: Column(
              children: [
                Text(
                  deviceName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
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
                      color: warningColor,
                      size: 40,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actionPane: SlidableBehindActionPane(),
      actions: [
        IconSlideAction(
          iconWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete,
                size: 40,
                color: Colors.red[900],
              ),
              Text(
                "Sil",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.red[700], fontWeight: FontWeight.bold),
              )
            ],
          ),
          color: Colors.transparent,
          onTap: () {},
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          iconWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit,
                color: Colors.green[700],
              ),
              Text(
                "Düzenle",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.green[500], fontWeight: FontWeight.bold),
              ),
            ],
          ),
          color: Colors.transparent,
          onTap: () {},
        ),
      ],
    );
  }
}
