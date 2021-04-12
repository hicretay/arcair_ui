import 'package:arcair/settings/routers.dart';
import 'package:flutter/material.dart';

void main() {
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  ThemeData theme = new ThemeData(fontFamily: "Quicksand-Medium").copyWith(
    appBarTheme: AppBarTheme(
      color: Color(0xff66778e),
      centerTitle: true,
    ),
  );
  runApp(
    MaterialApp(
      theme: theme,
      onGenerateRoute: Routers.generateRoute,
      initialRoute: splashRoute,
      debugShowCheckedModeBanner: false,
    ),
  );
}
