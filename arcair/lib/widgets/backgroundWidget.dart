import 'package:flutter/material.dart';

//Tüm ekranların arkaplanı
class BackgroundWidget extends StatelessWidget {
  final Widget child;

  BackgroundWidget({this.child});

  @override
  Widget build(BuildContext context) {
    //--------Arkaplan widgetı-------------
    return Container(
      child: child,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/background.jpg"),
          fit: BoxFit.cover,
          // resim erkanı kaplayacak
        ),
      ),
    );
    //------------------------------------
  }
}
