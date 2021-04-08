import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("KULLANICI GİRİŞİ"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/splash.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 110,
              ),
              TextFieldWidget(
                labelText: "E-Posta",
                controller: t1,
                obscureText: false,
              ),
              TextFieldWidget(
                  labelText: "Şifre", controller: t2, obscureText: true),
              MaterialButtonWidget(
                buttonText: "GİRİŞ",
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/homePage", (route) => false);
                },
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/registerPage");
                  },
                  child: Text(
                    "KAYDOL",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/resetPassPage");
                      },
                      child: Text(
                        "ŞİFREMİ UNUTTUM",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
