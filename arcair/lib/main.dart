import 'package:arcair/settings/consts.dart';
import 'package:arcair/settings/routers.dart';
import 'package:flutter/material.dart';

void main() {
  //------------Uygualama teması, AppBar ve yazı tipi özelleştirme--------------
  ThemeData theme = new ThemeData(fontFamily: "Quicksand-Medium").copyWith(
    appBarTheme: AppBarTheme(
      color: Color(primaryColor),
      centerTitle: true,
    ),
  );
  runApp(
    MaterialApp(
      theme: theme,
      onGenerateRoute: Routers.generateRoute, // Sayfa yönlendirme tanımı
      initialRoute: splashRoute, // Başlangıç SplashPage
      debugShowCheckedModeBanner: false, // debug yazısı kaldırma
    ),
  );
}
