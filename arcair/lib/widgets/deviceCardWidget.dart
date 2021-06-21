import 'package:arcair/settings/consts.dart';
import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//HomePage sayfasının görünümünde kullanıldı
//MaterialButtonWidget, TextFiedlWidget widgetları kullanıldı
class DeviceCardWidget extends StatelessWidget {
  // -----Cihazdan gelen CO, nem, sıcaklık, hava kalitesi verileri--------
  final int coLevel, temperature, humidityLevel, airQuality;
  //--------------------------------------------------
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
            //---------cihaz tıklanırsa cihaz detay sayfasına yönlendirecek----------
            onTap: () {
              Navigator.pushNamed(context, "/deviceDetailPage");
            },
            //--------------------------------------------------------
            title: Column(
              children: [
                //------------------Cihaz Adı--------------------------------
                Text(
                  deviceName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                //------------------------------------------------------------
                SizedBox(
                  height: minSpace,
                ),
                Row(
                  children: [
                    Expanded(
                      //---------------Çıktı Birimlerinin ikon ve adlandırılması------------
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //------------------------Karbonmonoksit--------------------------
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
                          //------------------------------------------------------------------
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          //-----------------------Nem-------------------------------------
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
                          //---------------------------------------------------------------
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          //-----------------------Sıcaklık------------------------------------
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
                          //---------------------------------------------------------------------
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          //------------------------Hava Kalitesi----------------------------
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
                          //-------------------------------------------------------------------
                        ],
                      ),
                      //------------------------------------------------------------------------
                    ),
                    //---------Uyarı ikonu-----------
                    Icon(
                      Icons.warning_rounded,
                      color: warningColor,
                      size: iconSize,
                    )
                    //------------------------------
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actionPane: SlidableBehindActionPane(),
      //-----------------Slidable sola kaydırma olayı------------------
      actions: [
        // slidable sola kaydrılırsa cihaz silme alertDialogo cikacak
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
        //---------------------------------------------------------------
      ],
      //-----------------Slidable sağa kaydırma olayı---------------------
      secondaryActions: [
        //slidable sağa kaydrılırsa cihaz düzenleme alertDialogu cikacak
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
            //buildEditPopUp fonksiyonu çağrılacak
          },
        ),
      ],
    );
    //--------------------------------------------------------------------
  }

//--------------Sil butonuna basılınca açılacak alertDialog fonksiyonu-----------------
  buildDeletePopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Cihaz silinsin mi? "), //AlertDialog başlığı
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //------Düzenle Butonu-----------
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
                //------------------------------
                //-----------------Sil Butonu------------------
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
                //--------------------------------------------
              ],
            ),
          ],
        );
      },
    );
  }
  //-----------------------------------------------------------------------

//-----------Düzenle butonuna basılınca açılacak alertDialog fonksiyonu--------------
  buildEditPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            //AlertDialog başlığı
            "SALON Cihazı Bilgilerini Düzenle",
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //--------Cihaz adı kullanıcı girişi------------
              TextFieldWidget(
                labelText: "Cihaz Adı:",
                obscureText: false,
              ),
              //--------------------------------------------
              //-------------MaterialButton görünümü-------------
              MaterialButtonWidget(
                buttonText: "Cihazın Bağlanacağı Ağı Seç",
                onPressed: () {
                  Navigator.pushNamed(context, "/addDevicePage");
                },
              ),
              //-------------------------------------------------
            ],
          ),
          actions: [
            Row(
              children: [
                //--------------İptal Butonu-------------
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
                    //Dialogu kapatacak
                  },
                ),
                //-------------------------------------------
                //---------------Düzenle Butonu--------------
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
                //------------------------------------------
              ],
            ),
          ],
        );
      },
    );
  }
  //-----------------------------------------------------------------------
}
