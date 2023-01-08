import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:icp_gahara_mobile/app/modules/settings/controllers/settings_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
      DashboardController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
