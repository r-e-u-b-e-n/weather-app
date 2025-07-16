import 'package:get/get.dart';
import 'package:weather_app/services/api/search_api.dart';

class SearchScreenController extends GetxController {
  final SearchApi api = SearchApi();

  var isLoading = false.obs;
  var cityResults = <Map<String, dynamic>>[].obs;

  void searchCity(String query) async {
    if (query.isEmpty) {
      cityResults.clear();
      return;
    }

    isLoading.value = true;
    final results = await api.searchCity(query);
    cityResults.assignAll(results);
    isLoading.value = false;
  }
}
