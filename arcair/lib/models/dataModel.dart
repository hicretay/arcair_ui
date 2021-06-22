class Weather {
  final int temp;
  final int humidity;

  Weather({this.temp, this.humidity});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: (json['main']['temp'].toInt())-273,
      humidity: json['main']['humidity'].toInt(),
    );
  }
}


