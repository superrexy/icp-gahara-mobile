import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/modules/order/controllers/detail_order_controller.dart';

import '../controllers/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailOrderController>(
      () => DetailOrderController(),
    );
    Get.lazyPut<OrderController>(
      () => OrderController(),
    );
  }
}
