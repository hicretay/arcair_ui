import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Kullanıcı adı ve şifre controlleri
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();

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
            children: [
              Spacer(
                flex: 4,
              ),
              Flexible(
                flex: 2,
                child: TextFieldWidget(   // E- posta alma textFieldi
                  labelText: "E-Posta",
                  controller: t1,
                  obscureText: false,
                ),
              ),
              Flexible(
                flex: 2,
                child: TextFieldWidget(   //Şifre alma textFieldi
                    labelText: "Şifre", controller: t2, obscureText: true),
              ),
              Flexible(
                flex: 1,
                child: MaterialButtonWidget(      //Anasayfa giriş butonu
                  buttonText: "GİRİŞ",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/homePage", (route) => false);
                  },
                ),
              ),
              Flexible(
                flex: 1,
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
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(   // Şifremi unuttum alertDialogu açılacak
                        onPressed: () {
                          setState(() {
                            buildResetPassPopUp(context);
                          });
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Şifre sıfırlama alertDialogu
  buildResetPassPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextFieldWidget(
            labelText: "E-Posta",
            obscureText: true,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "İptal",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    "Şifremi Sıfırla",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
