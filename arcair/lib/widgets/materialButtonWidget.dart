import 'package:arcair/settings/consts.dart';
import 'package:flutter/material.dart';

//MaterialButton widgetının özelleştirilmesi sınıfı
//LoginPage, RegisterPage ve DeviceProgrammingPage'de kullanıldı
class MaterialButtonWidget extends StatelessWidget {
  final VoidCallback onPressed; //buton olayları
  final String buttonText; //Buton metni

  MaterialButtonWidget({this.onPressed, this.buttonText});
  @override
  Widget build(BuildContext context) {
    //----------------MaterialButton Görünümü-------------------
    return MaterialButton(
      onPressed: onPressed,
      child:
          Text(buttonText, style: TextStyle(color: Colors.white, fontSize: 18)),
      minWidth: 140,
      height: 50,
      color: Color(primaryColor),
    );
    //-------------------------------------------------------------------------
  }
}
