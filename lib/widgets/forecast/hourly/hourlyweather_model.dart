class HourlyWeather {
  String time;
  double tempC;
  String condition;

  HourlyWeather({
    required this.time,
    required this.tempC,
    required this.condition,
  });

  static HourlyWeather fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      time: json['time'],
      tempC: json['temp_c'],
      condition: json['condition']['text'],
    );
  }
}
