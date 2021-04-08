import 'package:arcair/screens/homePage.dart';
import 'package:arcair/widgets/backgroundWidget.dart';
import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("KAYIT OL"),
      ),
      body: BackgroundWidget(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFieldWidget(labelText: "Adı Soyadı:", obscureText: false),
            TextFieldWidget(labelText: "E-Posta", obscureText: false),
            TextFieldWidget(labelText: "Şifre", obscureText: true),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButtonWidget(
                buttonText: "KAYDOL",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
