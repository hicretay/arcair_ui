import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () { // Sayfanın görünme süresi
    //----Önceki sayfayı silerek LoginPage'e geçiş--------
      Navigator.pushNamedAndRemoveUntil(
          context, "/loginPage", (route) => false);
    //----------------------------------------------------
    });
  }

  @override
  Widget build(BuildContext context) {
    //----------Arkaplan görünümü---------------
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/splash.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
    //-------------------------------------------
  }
}
