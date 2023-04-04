import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/orders_provider.dart';
import 'package:icp_gahara_mobile/app/model/request/order_request.dart';
import 'package:icp_gahara_mobile/app/model/response/order_response.dart';
import 'package:icp_gahara_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';

class OrderController extends GetxController {
  // Controller
  final DashboardController dashboardController = Get.find();

  // Provider
  final OrdersProvider ordersProvider = OrdersProvider();
  // Observable
  final ordersActive = <OrdersDataResponse>[].obs;
  final ordersInactive = <OrdersDataResponse>[].obs;

  // Function
  Future<void> getOrders() async {
    try {
      final response = await ordersProvider.getOrders();

      if (response != null) {
        ordersActive.assignAll(
            response.where((element) => element.status != "INACTIVE").toList());
        ordersInactive.assignAll(
            response.where((element) => element.status == "INACTIVE").toList());
      } else {
        ordersActive.assignAll([]);
        ordersInactive.assignAll([]);
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  Future<void> doneOrder(OrdersDataResponse data) async {
    try {
      final response = await ordersProvider.doneOrderByID(data.id!);

      if (response) {
        Get.back();

        await getOrders().then(
          (value) => Get.snackbar(
            'Berhasil',
            'Berhasil Menyelesaikan Pesanan.',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          ),
        );
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    getOrders();
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
