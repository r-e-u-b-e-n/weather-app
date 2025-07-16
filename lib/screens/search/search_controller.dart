import 'package:get/get.dart';
import 'package:weather_app/services/api/weather_api.dart';


class SearchController extends GetxController {
  final WeatherApi weatherApi = WeatherApi();

  var cityResults = <Map<String, dynamic>>[].obs;
  var isSearching = false.obs;

  Future<void> searchCity(String query) async {
    if (query.isEmpty) {
      cityResults.clear();
      return;
    }

    isSearching.value = true;
    try {
      final results = await weatherApi.searchCities(query);
      cityResults.value = results?.cast<Map<String, dynamic>>() ?? [];
    } catch (e) {
      cityResults.clear();
    } finally {
      isSearching.value = false;
    }
  }
}
