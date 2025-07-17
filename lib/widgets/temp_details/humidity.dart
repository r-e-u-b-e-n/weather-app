import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';

class Humidity extends StatelessWidget {
  final HomescreenController controller = Get.find<HomescreenController>();

  Humidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final humidity = int.tryParse(controller.humidity.value) ?? 0;

      return GlassContainer(
        height: 180,
        width: double.infinity,
        borderRadius: BorderRadius.circular(22),
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: const [
                  Icon(Icons.cloud_done, size: 16, color: Colors.white54),
                  SizedBox(width: 6),
                  Text(
                    "HUMIDITY",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Text(
                "$humidity%",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 4),

              const Spacer(),

              Text(
                "Dew point is 17 right now.",
                style: const TextStyle(fontSize: 14, color: Colors.white60),
              ),
            ],
          ),
        ),
      );
    });
  }
}
