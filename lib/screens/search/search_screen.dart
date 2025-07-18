import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/search/search_controller.dart';
import 'package:weather_app/widgets/current_weather/current_weather.dart';
import 'package:weather_app/widgets/weather_card/weather_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchScreenController());

    return Scaffold(
      backgroundColor: const Color(0xFF1F1D47),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1D47),
        foregroundColor: Colors.white,
        title: const Text('Weather'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: controller.searchCity,
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

              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.cityResults.isEmpty) {
                    return Center(
                      child: CurrentWeather(),
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.cityResults.length,
                    itemBuilder: (context, index) {
                      final data = controller.cityResults[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: WeatherCard(
                          temperature: '${data['current']['temp_c']}°',
                          high: '22°',
                          low: '22°',
                          city: '${data['location']['name']}, ${data['location']['country']}',
                          condition: data['current']['condition']['text'],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
