import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

class SplashController extends GetxController {
  void checkToken() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.LOGIN);
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
