import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/routes/app_routes.dart';
import 'package:weather_app/services/location/location_controller.dart';


void main() async{
  final locationController = Get.put(LocationController());
  await locationController.fetchAddress();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: AppRoutes.routes,
    );
  }
}