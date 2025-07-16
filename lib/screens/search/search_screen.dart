import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_card/weather_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a city or airport',
                  hintStyle: const TextStyle(color: Colors.white70),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: const Color(0xFF3D3A6E),
                  contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const WeatherCard(),
              const SizedBox(height: 12),
              const WeatherCard(),
              const SizedBox(height: 12),
              const WeatherCard(),
              const SizedBox(height: 12),
              const WeatherCard(),
              const SizedBox(height: 12),
              const WeatherCard(),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF1F1D47),
    );
  }
}
