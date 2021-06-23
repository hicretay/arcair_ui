import 'dart:convert';
import 'package:arcair/models/dataModel.dart';
import 'package:arcair/settings/consts.dart';
import 'package:http/http.dart' as http;

 Future weatherDataFunc1() async {
    Weather weather;
    final response = await http.post(
      Uri.parse(url1),
    );
    if (response.statusCode == 200) {
      weather = Weather.fromJson(json.decode(response.body));
    } else {
      return null;
    }
    return weather;
  }

   Future weatherDataFunc2() async {
    Weather weather;
    final response = await http.post(
      Uri.parse(url2),
    );
    if (response.statusCode == 200) {
      weather = Weather.fromJson(json.decode(response.body));
    } else {
      return null;
    }
    return weather;
  }



