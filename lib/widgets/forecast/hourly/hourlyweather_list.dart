import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/utils/time_format.dart';
import 'package:weather_app/utils/weather_icon.dart';
import 'package:weather_app/widgets/forecast/hourly/forecast.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomescreenController>();

    return Obx(() {
      if (controller.hourlyForecast.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: controller.hourlyForecast.take(12).map((hour) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: HourlyForecast(
                time: formatTime(hour.time),
                temperature: '${hour.tempC.toInt()}°',
                weatherImg: getWeatherIcon(hour.condition),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
