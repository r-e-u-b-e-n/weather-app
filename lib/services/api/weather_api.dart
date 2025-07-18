import 'package:dio/dio.dart';
import 'package:weather_app/middleware/fetch_api.dart';
import 'package:weather_app/services/location/location_controller.dart';
import 'package:get/get.dart';

class WeatherApi {
  final Dio dio = Dio();
  final String _baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = ApiKeyService.weatherApiKey;

  final LocationController locationController = Get.find();

  Future<Map<String, dynamic>?> getForecastWeather() async {
    var location = locationController.address.value;

    if (location.isEmpty ||
        location.contains('Error') ||
        location.contains('Permission') ||
        location == 'Address not found') {
      return null;
    }

    final response = await dio.get(
      '$_baseUrl/forecast.json',
      queryParameters: {'key': apiKey, 'q': location, 'days': 7, 'aqi': 'yes'},
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    return null;
  }
}
