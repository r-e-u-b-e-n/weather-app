import 'package:weather_app/constants/image_path.dart';

String getWeatherIcon(String condition) {
  condition = condition.toLowerCase();

  if (condition.contains('sunny')) return IconsAssets.sunny;
  if (condition.contains('rain')) return IconsAssets.rainy;
  if (condition.contains('cloud')) return IconsAssets.windy;
  return IconsAssets.sunny;
}
