import 'package:get/get.dart';
import 'package:weather_app/services/api/weather_api.dart';

class HomescreenController extends GetxController {
  var isLoading = true.obs;
  var tempC = '';
  var tempHigh = '';
  var tempLow = '';
  var condition = '';

  final WeatherApi weatherApi = WeatherApi();

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  void fetchWeather() async {
    isLoading.value = true;

    final data = await weatherApi.getForecastWeather();
    if (data != null) {
      final current = data['current'];
      final forecast = data['forecast']['forecastday'][0]['day'];

      tempC = current['temp_c'].toString();
      condition = current['condition']['text'];
      tempHigh = forecast['maxtemp_c'].toString();
      tempLow = forecast['mintemp_c'].toString();
    }

    isLoading.value = false;
  }
}
