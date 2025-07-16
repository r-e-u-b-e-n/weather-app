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
        width: 390,
        height: 200,
        child: Stack(
          children: [
            // Background SVG card
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/svg/card.svg',
                fit: BoxFit.cover,
              ),
            ),

            // Weather Info Text
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
              top: 0,
              right: 10,
              child: Column(
                children: [
                  Image.network(
                    getWeatherIcon(condition),
                    width: 190,
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.cloud, size: 100, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
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
