import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/detail_payment_controller.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/detail_rent_car_controller.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/form_car_controller.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/form_rent_car_controller.dart';

import '../controllers/rent_car_controller.dart';

class RentCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPaymentController>(
      () => DetailPaymentController(),
    );
    Get.lazyPut<FormCarController>(
      () => FormCarController(),
    );
    Get.lazyPut<FormRentCarController>(
      () => FormRentCarController(),
    );
    Get.lazyPut<DetailRentCarController>(
      () => DetailRentCarController(),
    );
    Get.lazyPut<RentCarController>(
      () => RentCarController(),
    );
    Get.lazyPut<DetailPaymentController>(
      () => DetailPaymentController(),
    );
  }
}
