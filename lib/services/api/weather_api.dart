import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_app/api_key.dart';
import 'package:weather_app/services/location/location_controller.dart';

class WeatherApi {
  final Dio dio = Dio();
  final String _baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = ApiKeys().weatherApi;

  final LocationController locationController = Get.find();

  Future<Map<String, dynamic>?> getForecastWeather() async {
    try {
      locationController.isLoading.value = true;

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        locationController.address.value = 'Location services are off';
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          locationController.address.value = 'Permission denied';
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        locationController.address.value = 'Permission permanently denied';
        return null;
      }

      Position position = await Geolocator.getCurrentPosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String location = placemarks.isNotEmpty
          ? placemarks[0].locality ?? 'Unknown'
          : 'Unknown';

      locationController.address.value = location;

      final response = await dio.get('$_baseUrl/forecast.json', queryParameters: {
        'key': apiKey,
        'q': location,
        'days': 1,
      });

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      locationController.address.value = 'Error: $e';
    } finally {
      locationController.isLoading.value = false;
    }

    return null;
  }
}
