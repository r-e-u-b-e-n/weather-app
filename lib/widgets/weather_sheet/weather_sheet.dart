import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/widgets/forecast/hourly/forecast.dart';

class WeatherBottomSheet extends StatelessWidget {
  const WeatherBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.1,
      maxChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) {
        return GlassContainer.frostedGlass(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          blur: 20,
          elevation: 3,
          gradient: LinearGradient(
            colors: [
              Color(0xFF5936B4).withOpacity(0.6),
              Color(0xFF362A84).withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderGradient: LinearGradient(
            colors: [
              Colors.purple.withOpacity(0.4),
              Colors.purple.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Hourly Forecast',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Weekly Forecast',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: const [
                    HourlyForecast(
                      time: "12 AM",
                      temperature: "19°",
                      weatherImg: "assets/icons/sunny.png",
                    ),
                    SizedBox(width: 20),
                    HourlyForecast(
                      time: "Now",
                      temperature: "19°",
                      weatherImg: "assets/icons/sunny.png",
                    ),
                    SizedBox(width: 20),
                    HourlyForecast(
                      time: "2 AM",
                      temperature: "18°",
                      weatherImg: "assets/icons/rainy.png",
                    ),
                    SizedBox(width: 20),
                    HourlyForecast(
                      time: "3 AM",
                      temperature: "19°",
                      weatherImg: "assets/icons/rainy.png",
                    ),
                    SizedBox(width: 20),
                    HourlyForecast(
                      time: "4 AM",
                      temperature: "19°",
                      weatherImg: "assets/icons/rainy.png",
                    ),
                    SizedBox(width: 20),
                    HourlyForecast(
                      time: "4 AM",
                      temperature: "19°",
                      weatherImg: "assets/icons/rainy.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
