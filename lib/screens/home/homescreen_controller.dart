import 'package:get/get.dart';
import 'package:weather_app/services/api/weather_api.dart';
import 'package:weather_app/widgets/forecast/hourly/hourlyweather_model.dart';
import 'package:weather_app/widgets/forecast/weekly/weeklyweather_model.dart';

class HomescreenController extends GetxController {
  var isLoading = true.obs;
  var tempC = ''.obs;
  var tempHigh = ''.obs;
  var tempLow = ''.obs;
  var condition = ''.obs;
  var airQuality = ''.obs;
  var uvIndex = ''.obs;
  var sunrise = ''.obs;
  var sunset = ''.obs;
  var wind = ''.obs;
  var windDirection = ''.obs;
  var rainfall = ''.obs;
  var feelsLike = ''.obs;
  var humidity = ''.obs;
  var visibility = ''.obs;
  var pressure = ''.obs;
  var showWeekly = false.obs;
  var showBottomNav = true.obs;

  var hourlyForecast = <HourlyWeather>[].obs;
  var weeklyForecast = <WeeklyWeather>[].obs;

  final WeatherApi weatherApi = WeatherApi();

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  void toggle(bool value) {
    showWeekly.value = value;
  }

  void updateSheetPosition(double position) {
    if (position > 0.4) {
      showBottomNav.value = false;
    } else {
      showBottomNav.value = true;
    }
  }

  void fetchWeather() async {
    isLoading.value = true;

    final data = await weatherApi.getForecastWeather();
    if (data != null) {
      final current = data['current'];
      final forecast = data['forecast']['forecastday'][0]['day'];
      tempC.value = current['temp_c'].toString();
      condition.value = current['condition']['text'];
      tempHigh.value = forecast['maxtemp_c'].toString();
      tempLow.value = forecast['mintemp_c'].toString();
      airQuality.value = current['air_quality']['us-epa-index'].toString();
      uvIndex.value = current['uv'].toString();
      sunrise.value = data['forecast']['forecastday'][0]['astro']['sunrise']
          .toString();
      sunset.value = data['forecast']['forecastday'][0]['astro']['sunset']
          .toString();
      wind.value = current['wind_kph'].toString();
      windDirection.value = current['wind_dir'].toString();
      rainfall.value = forecast['totalprecip_mm'].toString();
      feelsLike.value = current['feelslike_c'].toString();
      humidity.value = current['humidity'].toString();
      visibility.value = current['vis_km'].toString();
      pressure.value = current['pressure_mb'].toString();

      hourlyForecast.value =
          (data['forecast']['forecastday'][0]['hour'] as List)
              .map((e) => HourlyWeather.fromJson(e))
              .toList();

      weeklyForecast.value = (data['forecast']['forecastday'] as List)
          .map((e) => WeeklyWeather.fromJson(e))
          .toList();
    }

    isLoading.value = false;
  }
}
