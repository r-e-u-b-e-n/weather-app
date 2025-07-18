import 'package:firebase_remote_config/firebase_remote_config.dart';

class ApiKeyService {
  static String weatherApiKey = '';

  static Future<void> init() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    weatherApiKey = remoteConfig.getString('weatherApi');
  }
}
