import 'package:flutter/cupertino.dart';

//Uygulama ana rengi
const primaryColor = 0xff66778e;

//Kullanılcak boşluk değerleri
const defaultPadding = 20.0;
const minSpace = 5.0;
const maxSpace = 10.0;

//icon boyutları
const iconSize = 35.0;

//yazı stili
const textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

//icon stili
const iconStyle = TextStyle(fontSize: iconSize, fontWeight: FontWeight.bold);

// Afyonkarahisar ili id'sine göre oluşturulan api yolu
String url1 =
    "https://api.openweathermap.org/data/2.5/weather?id=325303&appid=4c4ba1524c64e60c868e96c1775823f1";

// Konya ili id'sine göre oluşturulan api yolu
String url2 =
    "https://api.openweathermap.org/data/2.5/weather?id=306571&appid=4c4ba1524c64e60c868e96c1775823f1";
