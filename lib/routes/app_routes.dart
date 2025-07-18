import 'package:get/get.dart';
import 'package:weather_app/middleware/middleware.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/screens/search/search_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
      middlewares: [AnalyticMiddleware()],
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: '/search',
      page: () => SearchScreen(),
      middlewares: [AnalyticMiddleware()],
      transition: Transition.rightToLeft,
    ),
  ];
}
