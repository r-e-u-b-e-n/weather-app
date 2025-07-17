class WeeklyWeather {
  String day;
  double maxTempC;
  String condition;

  WeeklyWeather({
    required this.day,
    required this.maxTempC,
    required this.condition,
  });

  static WeeklyWeather fromJson(Map<String, dynamic> json) {
    return WeeklyWeather(
      day: json['date'],
      maxTempC: json['day']['maxtemp_c'],
      condition: json['day']['condition']['text'],
    );
  }
}
