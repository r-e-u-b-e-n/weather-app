import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/utils/airquality_label.dart';

class AirQualityWidget extends StatelessWidget {
  final HomescreenController controller = Get.find<HomescreenController>();

  AirQualityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final airQualityValue = int.tryParse(controller.airQuality.value) ?? 0;
      final label = getAirQualityLabel(airQualityValue);

      return GlassContainer(
        height: 300,
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "AIR QUALITY",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              SfLinearGauge(
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
                    value: airQualityValue.toDouble(),
                    shapeType: LinearShapePointerType.circle,
                    color: Colors.white,
                    borderColor: Colors.black,
                    borderWidth: 2,
                    width: 12,
                    height: 12,
                    position: LinearElementPosition.cross,
                  ),
                ],
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "See more",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Colors.white70,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
