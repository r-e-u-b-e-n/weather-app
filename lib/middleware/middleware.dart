import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnalyticMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    FirebaseAnalytics.instance.logScreenView(screenName: route);
    return super.redirect(route);
  }
}