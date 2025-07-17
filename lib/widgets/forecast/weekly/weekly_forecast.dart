import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class WeeklyForecast extends StatelessWidget {
  final String day;
  final String temperature;
  final String weatherImg;

  const WeeklyForecast({
    super.key,
    required this.day,
    required this.temperature,
    required this.weatherImg,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 146,
      width: 60,
      borderRadius: BorderRadius.circular(30),
      borderColor: Colors.white38,
      blur: 10,
      elevation: 10,
      shadowColor: Colors.black,
      gradient: const LinearGradient(
        colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'SanFrancisco',
              ),
            ),
            Image.asset(weatherImg, height: 50, fit: BoxFit.contain),
            Text(
              temperature,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'SanFrancisco',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
