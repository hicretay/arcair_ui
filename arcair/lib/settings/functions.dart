import 'dart:convert';
import 'package:arcair/models/dataModel.dart';
import 'package:arcair/settings/consts.dart';
import 'package:http/http.dart' as http;

 Future weatherDataFunc() async {
    Weather weather;
    final response = await http.post(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      weather = Weather.fromJson(json.decode(response.body));
    } else {
      return null;
    }
    return weather;
  }



