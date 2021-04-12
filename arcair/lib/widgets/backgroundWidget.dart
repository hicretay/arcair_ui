import 'package:flutter/material.dart';

//Tüm ekranların arkaplanı
class BackgroundWidget extends StatelessWidget {
  final Widget child;

  BackgroundWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/background.jpg"),
              // resim erkanı kaplayacak
              fit: BoxFit.cover), 
        ));
  }
}
