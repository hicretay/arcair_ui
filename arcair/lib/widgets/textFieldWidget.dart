import 'package:arcair/settings/consts.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText; // textField başlığı
  final TextEditingController controller; // textField kontrolü
  final bool obscureText; // imleç odaklansın mı
  final TextInputType keyboardType; // Metin girişi türü
  TextFieldWidget(
      {this.labelText, this.controller, this.obscureText, this.keyboardType});

  // özelleştirilmiş textField LoginPage, RegisterPage de kullanıldı
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(maxSpace),
      //----------------TextField görünümü---------------
      child: TextField(
        cursorColor: Colors.black,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black87)),
      ),
      //----------------------------------------------------------------------
    );
  }
}
