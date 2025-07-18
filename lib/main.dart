import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/middleware/fetch_api.dart';
import 'package:weather_app/routes/app_routes.dart';
import 'package:weather_app/services/location/location_controller.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await ApiKeyService.init();
    final locationController = Get.put(LocationController());
    await locationController.fetchAddress();
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    runApp(const MyApp());
  } catch (e, stackTrace) {
    await FirebaseCrashlytics.instance.recordError(e, stackTrace);

  }
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
