import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';

class Rainfall extends StatelessWidget {
  final HomescreenController controller = Get.find<HomescreenController>();

  Rainfall({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentRain = double.tryParse(controller.rainfall.value) ?? 0.0;

      final expectedRain = (currentRain / 1.5).toStringAsFixed(1);

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
                  Icon(Icons.water_drop, size: 16, color: Colors.white54),
                  SizedBox(width: 6),
                  Text(
                    "RAINFALL",
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
                "${currentRain.toStringAsFixed(1)} mm",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "in last hour",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),

              const Spacer(),

              // Expected next 24h
              Text(
                "$expectedRain mm expected in next 24h.",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
