import 'package:arcair/widgets/materialButtonWidget.dart';
import 'package:arcair/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//---------Kullanıcı adı ve şifre controlleri---------------
  TextEditingController teEmail = new TextEditingController();
  TextEditingController tePass = new TextEditingController();
//------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("KULLANICI GİRİŞİ"),
      ),
      //----------Arkaplan Görünümü-----------------
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/splash.jpg"),
              fit: BoxFit.cover),
        ),
        //--------------------------------------------

        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Spacer(
                flex: 4,
              ),
              Flexible(
                flex: 2,
                //-------------- E- posta alma textFieldi--------------
                child: TextFieldWidget(
                  keyboardType: TextInputType.emailAddress,
                  labelText: "E-Posta",
                  controller: teEmail,
                  obscureText: false,
                ),
                //-----------------------------------------------------
              ),
              Flexible(
                flex: 2,
                //------------ Şifre alma textFieldi-------------------
                child: TextFieldWidget(
                    labelText: "Şifre", controller: tePass, obscureText: true),
                //-----------------------------------------------------
              ),
              Flexible(
                flex: 1,
                //-------------Anasayfaya giriş butonu---------
                child: MaterialButtonWidget(
                  buttonText: "GİRİŞ",
                  onPressed: () async {
                    // final String email = teEmail.text;
                    // final String password = tePass.text;

                    Navigator.pushNamedAndRemoveUntil(
                        context, "/homePage", (route) => false);
                  },
                ),
                //----------------------------------------------
              ),
              Flexible(
                flex: 1,
                //---------- Kaydol Sayfasına Geçiş Butonu----------
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
                //-------------------------------------------------
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      // ---------Şifremi unuttum alertDialogu açacak buton---------
                      child: TextButton(
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
                      //------------------------------------------------------------
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

  //------------- Şifre sıfırlama alertDialogu metodu----------------------
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
  //-------------------------------------------------------------------
}
