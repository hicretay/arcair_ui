import 'package:arcair/settings/consts.dart';
import 'package:arcair/settings/routers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // başlık
  'This channel is used for important notifications.', // açıklama
  importance: Importance.high,
  playSound: true,
);
// Firebase FlutterLocalNotificationsPlugin tanımlanması
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  // Firebase'in başlatılması
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

// Bildirim özelliklerinin ayarlanması
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
//------------------------------------------------------------------------------

  //------------Uygualama teması, AppBar ve yazı tipi özelleştirme--------------
  ThemeData theme = new ThemeData(
    fontFamily: "Quicksand-Medium",
  ).copyWith(
    // yazı tipi
    appBarTheme: AppBarTheme(
      // AppBar teması
      color: Color(primaryColor), //AppBar rengi
      centerTitle: true, // başlık konumu
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
