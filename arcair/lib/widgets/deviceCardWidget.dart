import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//HomePage sayfasının görünümü
class DeviceCardWidget extends StatelessWidget {
  final int coLevel,
      temperature,
      humidityLevel,
      airQuality; // Cihazdan gelen CO, nem, sıcaklık, hava kalitesi verileri
  final String deviceName; //Cihaz adı
  final Color
      cardColor; //Verilerin durumuna göre cihaz card'ının arka plan rengi
  final Color
      warningColor; // Cihaz uyarı ikonu rengi. Uyarı verilmiyorsa transparent, uyarı veriliyorsa siyah verilecek

//Constructor Method
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
              Navigator.pushNamed(context, "/deviceDetailPage");  // cihaz tıklanırsa cihaz detay sayfasına yönlendirecek
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
                            coLevel.toString(),
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
                            humidityLevel.toString(),
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
                            temperature.toString(),
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
                            airQuality.toString(),
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
      actions: [   // slidable sola kaydrılırsa cihaz silme alertDialogo cikacak
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
          onTap: () {
            buildDeletePopUp(context);
          },
        ),
      ],
      secondaryActions: [  //slidable sağa kaydrılırsa cihaz düzenleme alertDialogu cikacak
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
          onTap: () {
            buildEditPopUp(context);
          },
        ),
      ],
    );
  }

// Sil butonuna basılınca açılacak alertDialog
  buildDeletePopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Cihaz silinsin mi? "),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "İptal",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    "Sil",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }

// Düzenle butonuna basılınca açılacak alertDialog
  buildEditPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "SALON Cihazı Bilgilerini Düzenle",
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFieldWidget(
                labelText: "Cihaz Adı:",
                obscureText: false,
              ),
              MaterialButtonWidget(
                buttonText: "Cihazın Bağlanacağı Ağı Seç",
                onPressed: () {
                  Navigator.pushNamed(context, "/addDevicePage");
                },
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  child: Text(
                    "İptal",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    "Düzenle",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
