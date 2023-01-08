import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/modules/location/controllers/form_location_controller.dart';

import '../controllers/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormLocationController>(
      () => FormLocationController(),
    );
    Get.lazyPut<LocationController>(
      () => LocationController(),
    );
  }
}
