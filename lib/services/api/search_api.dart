import 'package:dio/dio.dart';
import 'package:weather_app/api_key.dart';

class SearchApi {
  final Dio dio = Dio();
  final String _baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = ApiKeys().weatherApi;

  Future<List<String>> getCities(String query) async {
    List<String> cities = [];

    final response = await dio.get(
      '$_baseUrl/search.json',
      queryParameters: {'key': apiKey, 'q': query},
    );

    if (response.statusCode == 200) {
      final data = response.data as List;
      for (var city in data) {
        cities.add(city['name']);
      }
    }

    return cities;
  }

  Future<List<Map<String, dynamic>>> searchCity(String query) async {
    List<Map<String, dynamic>> results = [];

    final cityNames = await getCities(query);

    final futures = cityNames.map((cityName) => getWeatherForCity(cityName));
    final weatherDataList = await Future.wait(futures);

    results = weatherDataList.whereType<Map<String, dynamic>>().toList();

    return results;
  }

  Future<Map<String, dynamic>?> getWeatherForCity(String cityName) async {
    final response = await dio.get(
      '$_baseUrl/current.json',
      queryParameters: {'key': apiKey, 'q': cityName},
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    return null;
  }
}
