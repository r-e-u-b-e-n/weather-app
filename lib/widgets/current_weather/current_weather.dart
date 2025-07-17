import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/services/location/location_controller.dart';

class CurrentWeather extends StatelessWidget {
  CurrentWeather({super.key});

  final LocationController locationController = Get.put(LocationController());
  final HomescreenController weatherController = Get.put(HomescreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (locationController.isLoading.value || weatherController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            locationController.address.value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            '${weatherController.tempC}°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 90,
              fontWeight: FontWeight.w400,
              fontFamily: 'SanFrancisco',
            ),
          ),
          Text(
            weatherController.condition.value,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'H: ${weatherController.tempHigh}°',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(width: 20),
              Text(
                'L: ${weatherController.tempLow}°',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ],
      );
    });
  }
}
