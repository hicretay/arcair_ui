import 'package:flutter/material.dart';

//MaterialButton widgetının özelleştirilmesi
class MaterialButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  MaterialButtonWidget({this.onPressed, this.buttonText});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(  // onPressed parametre alana özelleştirilmiş materialButton
      onPressed: onPressed,
      child:
          Text(buttonText, style: TextStyle(color: Colors.white, fontSize: 18)),
      minWidth: 140,
      height: 50,
      color: Color(0xff66778e),
    );
  }
}
