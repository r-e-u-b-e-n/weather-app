import 'package:get/get.dart';
import 'package:weather_app/services/api/weather_api.dart';

class HomescreenController extends GetxController {
  var isLoading = true.obs;
  var tempC = ''.obs;
  var tempHigh = ''.obs;
  var tempLow = ''.obs;
  var condition = ''.obs;

  final WeatherApi weatherApi = WeatherApi();

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  void fetchWeather() async {
    isLoading.value = true;

    try {
      final data = await weatherApi.getForecastWeather();
      if (data != null) {
        final current = data['current'];
        final forecast = data['forecast']['forecastday'][0]['day'];

        tempC.value = current['temp_c'].toString();
        condition.value = current['condition']['text'];
        tempHigh.value = forecast['maxtemp_c'].toString();
        tempLow.value = forecast['mintemp_c'].toString();
      }
    } finally {
      isLoading.value = false;
    }
  }
}
