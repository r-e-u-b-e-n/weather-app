import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/image_path.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/widgets/bottom_navigation/bottom_nav.dart';
import 'package:weather_app/widgets/current_weather/current_weather.dart';
import 'package:weather_app/widgets/weather_sheet/weather_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController controller = Get.put(HomescreenController());

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.background),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CurrentWeather(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 450,
                    height: 450,
                    child: Image.asset(ImageAssets.house),
                  ),
                ],
              ),
            ),
          ),

          WeatherBottomSheet(),
        ],
      ),

      bottomNavigationBar: Obx(() {
        final isVisible = controller.showBottomNav.value;

        return AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          offset: isVisible ? Offset.zero : const Offset(0, 1),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isVisible ? 1.0 : 0.0,
            child: IgnorePointer(
              ignoring: !isVisible,
              child: BottomNavigate(),
            ),
          ),
        );
      }),
    );
  }
}
