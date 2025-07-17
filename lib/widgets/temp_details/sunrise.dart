import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/screens/home/homescreen_controller.dart';


class Sunrise extends StatelessWidget {
  final HomescreenController controller = Get.find<HomescreenController>();

  Sunrise({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    //   Obx(() {
    //
    //
    //   return GlassContainer(
    //     height: 300,
    //     width: double.infinity,
    //     borderRadius: BorderRadius.circular(22),
    //     borderColor: Colors.white38,
    //     blur: 10,
    //     elevation: 10,
    //     shadowColor: Colors.black,
    //     color: Color(0xFF48319D),
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const Text(
    //             "SUNRISE",
    //             style: TextStyle(
    //               fontSize: 18,
    //               fontWeight: FontWeight.w600,
    //               color: Color(0xFF3C3C43),
    //             ),
    //           ),
    //
    //         ],
    //       ),
    //     ),
    //   );
    // });
  }
}
