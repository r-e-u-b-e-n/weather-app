import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/weather_icon.dart';

class WeatherCard extends StatelessWidget {
  final String temperature;
  final String high;
  final String low;
  final String city;
  final String condition;

  const WeatherCard({
    super.key,
    required this.temperature,
    required this.high,
    required this.low,
    required this.city,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 370,
        height: 190,
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/svg/card.svg',
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    temperature,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'H:$high  L:$low',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: -40,
              right: 0,
              child: Column(
                children: [
                  Image.asset(
                    getWeatherIcon(condition),
                    width: 140,
                    height: 200,
                    fit: BoxFit.cover,
                  ),

                  Text(
                    condition,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
