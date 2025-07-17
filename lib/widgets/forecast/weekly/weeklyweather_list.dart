import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/utils/date_to_day.dart';
import 'package:weather_app/utils/weather_icon.dart';
import 'package:weather_app/widgets/forecast/weekly/weekly_forecast.dart';

class WeeklyWeatherList extends StatelessWidget {
  const WeeklyWeatherList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomescreenController>();

    return Obx(() {
      if (controller.weeklyForecast.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: controller.weeklyForecast.take(7).map((week) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: WeeklyForecast(
                day: dateToDay(week.day),
                temperature: '${week.maxTempC.toInt()}°',
                weatherImg: getWeatherIcon(week.condition),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
