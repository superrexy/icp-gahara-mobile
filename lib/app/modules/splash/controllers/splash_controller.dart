import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/storage/storage.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

class SplashController extends GetxController {
  void checkToken() {
    Future.delayed(const Duration(seconds: 3), () {
      if (Storage.hasData(AppConstants.token)) {
        Get.offNamed(Routes.DASHBOARD);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onInit() {
    checkToken();
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
