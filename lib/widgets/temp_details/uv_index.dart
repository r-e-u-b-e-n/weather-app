import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/utils/airquality_label.dart';

class UvIndex extends StatelessWidget {
  final HomescreenController controller = Get.find<HomescreenController>();

  UvIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final uvValue = int.tryParse(controller.uvIndex.value) ?? 0;
      final label = getAirQualityLabel(uvValue);

      return GlassContainer(
        height: 260,
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.sunny, size: 16, color: Colors.white54),
                  SizedBox(width: 6),
                  Text(
                    "UV INDEX",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                uvValue.toString(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SfLinearGauge(
                    minimum: 1,
                    maximum: 6,
                    showTicks: false,
                    showLabels: false,
                    axisTrackStyle: const LinearAxisTrackStyle(
                      thickness: 4,
                      gradient: LinearGradient(
                        colors: [Color(0xFF3658B1), Color(0xFFC159EC)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      edgeStyle: LinearEdgeStyle.bothCurve,
                    ),
                    markerPointers: [
                      LinearShapePointer(
                        value: uvValue.toDouble(),
                        shapeType: LinearShapePointerType.circle,
                        color: Colors.white,
                        borderColor: Colors.black,
                        borderWidth: 5,
                        width: 12,
                        height: 12,
                        position: LinearElementPosition.cross,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
