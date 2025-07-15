import 'package:dio/dio.dart';
import 'package:weather_app/api_key.dart';

class WeatherApi {
  final Dio dio = Dio();
  final String _baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = ApiKeys().weatherApi;

  Future<Map<String, dynamic>?> getForecastWeather(String location) async {
    final url = '$_baseUrl/forecast.json';
    final params = {'key': apiKey, 'q': location, 'days': 1};

    final response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return response.data;
    }

    return null;
  }
}
