import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';
import 'package:weather_app/utils/direction_to_degrees.dart';

class WindWidget extends StatelessWidget {
  WindWidget({super.key});

  final HomescreenController controller = Get.find<HomescreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final windSpeed = double.tryParse(controller.wind.value) ?? 0.0;
      final windDir = controller.windDirection.value;
      final windDegrees = convertDirectionToDegrees(windDir);

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.air, size: 16, color: Colors.white54),
                  SizedBox(width: 6),
                  Text(
                    "WIND",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              SizedBox(
                height: 110,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 360,
                      showTicks: false,
                      showLabels: false,
                      axisLineStyle: const AxisLineStyle(
                        thickness: 0.1,
                        thicknessUnit: GaugeSizeUnit.factor,
                        color: Colors.white24,
                      ),
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: windDegrees,
                          needleLength: 0.6,
                          needleStartWidth: 0,
                          needleEndWidth: 5,
                          knobStyle: const KnobStyle(
                            color: Colors.white,
                            knobRadius: 0.07,
                          ),
                          enableAnimation: true,
                          animationDuration: 1000,
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          angle: 90,
                          positionFactor: 0.1,
                          widget: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                windSpeed.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "km/h",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const GaugeAnnotation(
                          angle: 0,
                          positionFactor: 1.1,
                          widget: Text(
                            "N",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const GaugeAnnotation(
                          angle: 90,
                          positionFactor: 1.1,
                          widget: Text(
                            "E",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const GaugeAnnotation(
                          angle: 180,
                          positionFactor: 1.1,
                          widget: Text(
                            "S",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const GaugeAnnotation(
                          angle: 270,
                          positionFactor: 1.1,
                          widget: Text(
                            "W",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
