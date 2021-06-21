import 'package:arcair/screens/addDevicePage.dart';
import 'package:arcair/screens/alertHistoryPage.dart';
import 'package:arcair/screens/deviceDetailPage.dart';
import 'package:arcair/screens/deviceProgrammingPage.dart';
import 'package:arcair/screens/homePage.dart';
import 'package:arcair/screens/loginPage.dart';
import 'package:arcair/screens/nearbyWifiPage.dart';
import 'package:arcair/screens/registerPage.dart';
import 'package:arcair/screens/splashPage.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case nearbyWifiRoute:
        return MaterialPageRoute(builder: (_) => NearbyWifiPage());
      case addDeviceRoute:
        return MaterialPageRoute(builder: (_) => AddDevicePage());
      case alertHistoryRoute:
        return MaterialPageRoute(builder: (_) => AlertHistoryPage());
      case deviceProgrammingRoute:
        return MaterialPageRoute(builder: (_) => DeviceProgrammingPage());
      case deviceDetailRoute:
        return MaterialPageRoute(builder: (_) => DeviceDetailPage());

      default:
      //-------------------hatalı Routing işleminde çalışacak--------------
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(
                "Ters giden bir şeyler oldu !",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
     //--------------------------------------------------------------
    }
  }
}
//---------------Routing Adlandırmaları--------------------
const String splashRoute = "/";
const String loginRoute = "/loginPage";
const String registerRoute = "/registerPage";
const String homeRoute = "/homePage";
const String nearbyWifiRoute = "/nearbyWifiPage";
const String addDeviceRoute = "/addDevicePage";
const String alertHistoryRoute = "/alertHistoryPage";
const String deviceProgrammingRoute = "/deviceProgrammingPage";
const String deviceDetailRoute = "/deviceDetailPage";
//------------------------------------------------------------