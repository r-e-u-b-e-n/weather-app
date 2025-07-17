import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/widgets/forecast/hourly/hourlyweather_list.dart';
import 'package:weather_app/widgets/forecast/weekly/weeklyweather_list.dart';
import 'package:weather_app/widgets/temp_details/air_quality.dart';
import 'package:weather_app/widgets/temp_details/feels_like.dart';
import 'package:weather_app/widgets/temp_details/humidity.dart';
import 'package:weather_app/widgets/temp_details/pressure.dart';
import 'package:weather_app/widgets/temp_details/rainfall.dart';
import 'package:weather_app/widgets/temp_details/sunrise.dart';
import 'package:weather_app/widgets/temp_details/uv_index.dart';
import 'package:weather_app/widgets/temp_details/wind.dart';
import 'package:weather_app/widgets/temp_details/visibility.dart';

class WeatherBottomSheet extends StatelessWidget {
  WeatherBottomSheet({super.key});

  final HomescreenController controller = Get.find<HomescreenController>();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.2,
      maxChildSize: 0.85,
      builder: (BuildContext context, ScrollController scrollController) {
        return GlassContainer.frostedGlass(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          blur: 20,
          elevation: 3,
          gradient: const LinearGradient(
            colors: [
              Color(0x995936B4),
              Color(0x80362A84),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderGradient: const LinearGradient(
            colors: [
              Color(0x669C27B0),
              Color(0x339C27B0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            children: [
              Obx(() {
                return Padding(
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
                );
              }),
              const SizedBox(height: 20),

              // Show forecast based on toggle state
              Obx(() {
                return controller.showWeekly.value
                    ? const WeeklyWeatherList()
                    : const HourlyForecastList();
              }),

              const SizedBox(height: 20),

              SizedBox(height: 180, child: AirQualityWidget()),

              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  UvIndex(),
                  Sunrise(),
                  WindWidget(),
                  Rainfall(),
                  FeelsLike(),
                  Humidity(),
                  VisibilityCard(),
                  PressureWidget(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
