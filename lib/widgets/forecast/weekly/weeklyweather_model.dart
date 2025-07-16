class WeeklyWeather {
  String date;
  double maxTempC;
  double minTempC;
  String condition;

  WeeklyWeather({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.condition,
  });

  static  WeeklyWeather fromJson(Map<String, dynamic> json) {
    return WeeklyWeather(
      date: json['date'],
      maxTempC: json['day']['maxtemp_c'],
      minTempC: json['day']['mintemp_c'],
      condition: json['day']['condition']['text'],
    );
  }
}
