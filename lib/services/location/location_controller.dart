import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  var address = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddress();
  }

  Future<void> fetchAddress() async {
    isLoading.value = true;

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        address.value = 'Location services are off';
        isLoading.value = false;
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          address.value = 'Permission denied';
          isLoading.value = false;
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        address.value = 'Permission permanently denied';
        isLoading.value = false;
        return;
      }

      Position position = await Geolocator.getCurrentPosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address.value = '${place.locality}';
      } else {
        address.value = 'Address not found';
      }
    } catch (e) {
      address.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
