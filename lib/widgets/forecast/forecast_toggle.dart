import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/widgets/forecast/hourly/hourlyweather_list.dart';
import 'package:weather_app/widgets/forecast/weekly/weeklyweather_list.dart';

class ForecastToggle extends StatelessWidget {
  const ForecastToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomescreenController>();

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => controller.toggle(false),
                  child: Text(
                    'Hourly Forecast',
                    style: TextStyle(
                      color: controller.showWeekly.value
                          ? Colors.white54
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.toggle(true),
                  child: Text(
                    'Weekly Forecast',
                    style: TextStyle(
                      color: controller.showWeekly.value
                          ? Colors.white
                          : Colors.white54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          controller.showWeekly.value
              ? const WeeklyWeatherList()
              : const HourlyForecastList(),
        ],
      );
    });
  }
}
