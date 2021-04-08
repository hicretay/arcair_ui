import 'package:arcair/screens/addDevicePage.dart';
import 'package:arcair/screens/alertHistoryPage.dart';
import 'package:arcair/screens/deviceDetailPage.dart';
import 'package:arcair/screens/deviceProgramming.dart';
import 'package:arcair/screens/homePage.dart';
import 'package:arcair/screens/loginPage.dart';
import 'package:arcair/screens/nearbyWifiPage.dart';
import 'package:arcair/screens/registerPage.dart';
import 'package:arcair/screens/resetPassPage.dart';
import 'package:arcair/screens/splashPage.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case resetPassRoute:
        return MaterialPageRoute(builder: (_) => ResetPassPage());
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
      case alertSettingRoute:
        return MaterialPageRoute(builder: (_) => AlertSettingPage());
      case deviceDetailRoute:
        return MaterialPageRoute(builder: (_) => DeviceDetailPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text("Ters giden bir şeyler oldu"),
            ),
          ),
        );
    }
  }
}

const String splashRoute = "/";
const String loginRoute = "/loginPage";
const String resetPassRoute = "/resetPassPage";
const String registerRoute = "/registerPage";
const String homeRoute = "/homePage";
const String nearbyWifiRoute = "/nearbyWifiPage";
const String addDeviceRoute = "/addDevicePage";
const String alertHistoryRoute = "/alertHistoryPage";
const String alertSettingRoute = "/alertSettingPage";
const String deviceDetailRoute = "/deviceDetailPage";
