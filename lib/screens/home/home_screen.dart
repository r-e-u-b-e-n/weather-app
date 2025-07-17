import 'package:flutter/material.dart';
import 'package:weather_app/constants/image_path.dart';
import 'package:weather_app/widgets/bottom_navigation/bottom_nav.dart';
import 'package:weather_app/widgets/current_weather/current_weather.dart';
import 'package:weather_app/widgets/weather_sheet/weather_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CurrentWeather(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 450,
                    height: 450,
                    child: Image.asset(
                      ImageAssets.house,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),

          WeatherBottomSheet(),
        ],
      ),
      bottomNavigationBar: BottomNavigate(),
    );
  }
}
