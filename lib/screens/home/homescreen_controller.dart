import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/services/api/weather_api.dart';

class HomescreenController extends GetxController {
  final WeatherApi weatherService = WeatherApi();
  final GetStorage storage = GetStorage();

  static const storageKey = 'weatherData';

  var isLoading = false.obs;
  var error = ''.obs;

  Future<void> fetchWeather(String location) async {
    isLoading.value = true;
    error.value = '';

    final data = await weatherService.getForecastWeather(location);

    if (data != null) {
      storage.write(storageKey, data);
    } else {
      error.value = 'Could not load weather';
    }

    isLoading.value = false;
  }

  Map<String, dynamic> get weather => storage.read(storageKey);

  String get tempC => weather['current']?['temp_c']?.toString() ?? 'N/A';
  String get condition => weather['current']?['condition']?['text'] ?? 'N/A';
  String get tempHigh => weather['forecast']?['forecastday']?[0]?['day']?['maxtemp_c']?.toString() ?? '--';
  String get tempLow => weather['forecast']?['forecastday']?[0]?['day']?['mintemp_c']?.toString() ?? '--';
}
