import 'dart:convert';
import 'package:arcair/models/dataModel.dart';
import 'package:http/http.dart' as http;


 Stream<Weather> getWeatherDataStream(String url)async* {
    Weather weather;
    final response = await http.post(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      weather = Weather.fromJson(json.decode(response.body));
    } else {
      yield null;
    }
    yield weather;
  }


Future getWeatherData(String url) async {
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

