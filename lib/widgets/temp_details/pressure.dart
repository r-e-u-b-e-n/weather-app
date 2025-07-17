import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';

class PressureWidget extends StatelessWidget {
  const PressureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomescreenController>();

    return Obx(() {
      double pressureValue = double.tryParse(controller.pressure.value) ?? 0;

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
            children: [
              Row(
                children: const [
                  Icon(Icons.circle, size: 16, color: Colors.white54),
                  SizedBox(width: 6),
                  Text(
                    'PRESSURE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 950,
                      maximum: 1050,
                      interval: 5,
                      showLabels: false,
                      showTicks: true,
                      radiusFactor: 0.9,
                      axisLineStyle: const AxisLineStyle(
                        thickness: 0.12,
                        thicknessUnit: GaugeSizeUnit.factor,
                        color: Colors.white12,
                      ),
                      majorTickStyle: const MajorTickStyle(
                        length: 0.1,
                        thickness: 1.5,
                        lengthUnit: GaugeSizeUnit.factor,
                        color: Colors.white30,
                      ),
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: pressureValue,
                          needleColor: Colors.white,
                          needleLength: 0.7,
                          lengthUnit: GaugeSizeUnit.factor,
                          needleEndWidth: 6,
                          knobStyle: const KnobStyle(
                            color: Colors.white,
                            sizeUnit: GaugeSizeUnit.factor,
                            knobRadius: 0.06,
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
