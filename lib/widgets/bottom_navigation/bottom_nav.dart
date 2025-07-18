import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/image_path.dart';

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
            NavigationAssets.bottomBar,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
        Positioned(
          bottom: -18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () => Get.toNamed('/search'),
                child: SvgPicture.asset(
                  NavigationAssets.locationIcon,
                  width: 25,
                  height: 25,
                ),
              ),
              const SizedBox(width: 80),
              GestureDetector(
                onTap: () => Get.toNamed('/search'),
                child: SvgPicture.asset(
                  NavigationAssets.mainButton,
                  width: 120,
                  height: 120,
                ),
              ),

              const SizedBox(width: 80),
              GestureDetector(
                onTap: () => Get.toNamed('/search'),
                child: SvgPicture.asset(
                  NavigationAssets.listIcon,
                  width: 20,
                  height: 20,
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
