import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/utils/airquality_label.dart';

class Sunrise extends StatelessWidget {
  final HomescreenController controller = Get.find<HomescreenController>();

  Sunrise({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final airQualityValue = int.tryParse(controller.airQuality.value) ?? 0;
      final label = getAirQualityLabel(airQualityValue);

      return GlassContainer(
        height: double.infinity,
        width: double.infinity,
        borderRadius: BorderRadius.circular(22),
        borderColor: Colors.white38,
        blur: 10,
        elevation: 10,
        shadowColor: Colors.black,
        color: Color(0xFF48319D),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Air Quality",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3C3C43),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
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
                    borderWidth: 5,
                    width: 12,
                    height: 12,
                    position: LinearElementPosition.cross,
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
