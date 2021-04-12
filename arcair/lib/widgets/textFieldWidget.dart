import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  TextFieldWidget({this.labelText, this.controller, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(    // özelleştirilmiş textField. LoginPage, registerPagede kullanıldı
        cursorColor: Colors.black,
        obscureText: obscureText,
        controller: controller,
        
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black87)),
      ),
    );
  }
}
