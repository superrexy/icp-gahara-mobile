import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/location_provider.dart';
import 'package:latlong2/latlong.dart';

class LocationController extends GetxController {
  // Provider
  final LocationProvider locationProvider = LocationProvider();

  // Observable
  final addressController = ''.obs;
  final latitudeController = 0.0.obs;
  final longitudeController = 0.0.obs;

  // Flutter Map
  final MapController mapController = MapController();

  // Function
  Future<void> getLocation() async {
    try {
      final response = await locationProvider.getLocation();

      if (response != null) {
        addressController.value = response.address;
        latitudeController.value = response.latitude;
        longitudeController.value = response.longitude;
        mapController.move(
          LatLng(response.latitude, response.longitude),
          15,
        );
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
