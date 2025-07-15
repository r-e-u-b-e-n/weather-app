import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/widgets/forecast/hourly/forecast.dart';

class ForecastContainer extends StatelessWidget {
  const ForecastContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: double.infinity,
      width: double.infinity,
      gradient: LinearGradient(
        colors: [
          Color(0xFF48319D),
          Color(0xFF1C1B33),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(30),
      blur: 15,
      borderGradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Header tabs with glass effect
            Row(
              children: [
                _buildGlassTab("Hourly Forecast", true),
                SizedBox(width: 15),
                _buildGlassTab("Weekly Forecast", false),
              ],
            ),
            SizedBox(height: 20),
            // Forecast widgets row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecast(
                    time: "12 AM",
                    temperature: "19",
                    weatherImg: "assets/images/cloudy.png",
                  ),
                  SizedBox(width: 12),
                  HourlyForecast(
                    time: "Now",
                    temperature: "19",
                    weatherImg: "assets/images/cloudy.png",
                  ),
                  SizedBox(width: 12),
                  HourlyForecast(
                    time: "2 AM",
                    temperature: "18",
                    weatherImg: "assets/images/cloudy.png",
                  ),
                  SizedBox(width: 12),
                  HourlyForecast(
                    time: "3 AM",
                    temperature: "19",
                    weatherImg: "assets/images/cloudy.png",
                  ),
                  SizedBox(width: 12),
                  HourlyForecast(
                    time: "4 AM",
                    temperature: "19",
                    weatherImg: "assets/images/cloudy.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassTab(String text, bool isActive) {
    return GlassContainer(
      height: 35,
      width: 130,
      gradient: LinearGradient(
        colors: isActive
            ? [
          Color(0xFF48319D).withOpacity(0.7),
          Color(0xFF1C1B33).withOpacity(0.5),
        ]
            : [
          Colors.transparent,
          Colors.transparent,
        ],
      ),
      borderRadius: BorderRadius.circular(20),
      blur: isActive ? 10 : 0,
      borderGradient: LinearGradient(
        colors: isActive
            ? [
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0.1),
        ]
            : [
          Colors.transparent,
          Colors.transparent,
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
