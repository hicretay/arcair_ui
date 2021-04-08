import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';

class ResetPassPage extends StatefulWidget {
  @override
  _ResetPassPageState createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("ŞİFREMİ UNUTTUM"),
      ),
      body: BackgroundWidget(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFieldWidget(labelText: "E-Posta", obscureText: false),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButtonWidget(
                buttonText: "SIFIRLA",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
