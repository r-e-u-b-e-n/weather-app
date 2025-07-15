import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/services/location/location_controller.dart';
import 'package:weather_app/widgets/bottom_navigation/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final LocationController locationController = Get.put(LocationController());
  final HomescreenController weatherController = Get.put(HomescreenController());


  @override
  Widget build(BuildContext context) {
    ever(locationController.address, (String location) {
      if (location.isNotEmpty &&
          location != 'Location services are off' &&
          !location.startsWith('Permission') &&
          !location.startsWith('Error')) {
        weatherController.fetchWeather(location);
      }
    });

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/png/homescreen.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Obx(() {
              if (locationController.isLoading.value ||
                  weatherController.isLoading.value) {
                return const CircularProgressIndicator(color: Colors.white);
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
                  ),
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
                    weatherController.condition,
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
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 450,
                    height: 450,
                    child: Image.asset(
                      'assets/png/house.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigate(),
    );
  }
}
