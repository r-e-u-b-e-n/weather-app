import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/search/search_screen.dart';

class BottomNavigate extends StatelessWidget {
  const BottomNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 80,
          child: SvgPicture.asset(
            'assets/svg/buttons.svg',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
        Positioned(
          bottom: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () =>
                    Get.to(() => SearchScreen()), // Navigate to location page
                child: SvgPicture.asset(
                  'assets/svg/location.svg',
                  width: 25,
                  height: 25,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 100),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.black, size: 32),
              ),

              const SizedBox(width: 100),
              GestureDetector(
                onTap: () => Get.to(() => SearchScreen()),
                child: SvgPicture.asset(
                  'assets/svg/list.svg',
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
        ),
      ],
    );
  }
}
