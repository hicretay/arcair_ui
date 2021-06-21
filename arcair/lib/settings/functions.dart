// import 'dart:convert';
// import 'package:arcair/settings/consts.dart';
// import 'package:http/http.dart';


//-------------------Login Fonksiyonu-----------------------------------
// class LoginService {
//   Future<LoginModel> loginUser(String email, String password) async {
//     final response = await http.post(
//       Uri.parse("https://reqres.in/api/login"),
      
//       body: {"email": email, "password": password},
//       headers: {'Content-type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final String responseString = response.body;
//       return loginModelFromJson(responseString);
//     } else {
//       return null;
//     }
//   }
// }
//---------------------------------------------------------------------
