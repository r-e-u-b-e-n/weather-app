import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/widgets/forecast/hourly/hourlyweather_list.dart';
import 'package:weather_app/widgets/temp_details/air_quality.dart';
import 'package:weather_app/widgets/temp_details/sunrise.dart';
import 'package:weather_app/widgets/temp_details/uv_index.dart';

class WeatherBottomSheet extends StatelessWidget {
  const WeatherBottomSheet({super.key});

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
          gradient: LinearGradient(
            colors: [
              const Color(0xFF5936B4).withOpacity(0.6),
              const Color(0xFF362A84).withOpacity(0.5),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
              const HourlyForecastList(),
              const SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: AirQualityWidget(),
              ),
              const SizedBox(height: 16),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.3,
                children: [
                  UvIndex(),
                  Sunrise(),
                  UvIndex(),
                  Sunrise(),
                  UvIndex(),
                  Sunrise(),
                  UvIndex(),
                  Sunrise(),
                ],
              ),

            ],
          ),
        );
      },
    );
  }
}
