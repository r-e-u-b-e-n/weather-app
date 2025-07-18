import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';

class AnalyticMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    if (page != null) {
      try {

        FirebaseAnalytics.instance.logScreenView(
          screenName: page.name,
        );
      } catch (e, stackTrace) {
        FirebaseCrashlytics.instance.recordError(
          e,
          stackTrace,
          reason: 'Failed to log screen view for ${page.name}',
        );
      }
    }
    return page;
  }
}