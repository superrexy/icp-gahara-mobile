import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/model/response/order_payment_response.dart';
import 'package:icp_gahara_mobile/app/modules/order/controllers/detail_order_controller.dart';
import 'package:icp_gahara_mobile/app/modules/order/controllers/order_controller.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../../../data/orders_provider.dart';

class DetailPaymentController extends GetxController {
  // CONTROLLER
  final OrderController orderController = Get.put(OrderController());
  final DetailOrderController detailOrderController =
      Get.put(DetailOrderController());

  // PROVIDER
  final OrdersProvider ordersProvider = OrdersProvider();

  // VARIABLE
  var previousRoute = Get.previousRoute;
  late Timer _timer;
  late Duration _duration;

  IO.Socket socket = IO.io(
    AppConstants.baseURL,
    OptionBuilder().setTransports(['websocket']).enableAutoConnect().build(),
  );

  // OBS
  final orderPaymentData = OrderPaymentDataResponse().obs;

  // FUNCTION
  Future<void> getOrderPayment() async {
    try {
      final response =
          await ordersProvider.orderPayment(Get.arguments['orderId']);

      if (response != null) {
        orderPaymentData.update((val) {
          val?.id = response.id;
          val?.orderId = response.orderId;
          val?.bank = response.bank;
          val?.actionUrl = response.actionUrl;
          val?.vaNumber = response.vaNumber;
          val?.expiredAt = response.expiredAt;
          val?.createdAt = response.createdAt;
          val?.updatedAt = response.updatedAt;
        });

        _duration = response.expiredAt!.toLocal().difference(DateTime.now());
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          _duration = _duration - const Duration(seconds: 1);
          update();
          if (_duration.inSeconds <= 0) {
            timer.cancel();
          }
        });

        update();
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  Future<void> joinRoomOrder() async {
    socket.onConnect((_) {
      socket.emit('join', "order-${Get.arguments['orderId']}");
    });

    socket.on('status', (data) async {
      if (data['status'] == "PAID") {
        await orderController.getOrders();
        await detailOrderController.getOrder();

        if (previousRoute == "/rent-car") {
          Get.offAllNamed(
            Routes.DETAIL_ORDER,
            predicate: (route) => route.settings.name == Routes.DASHBOARD,
            arguments: {
              "orderId": orderPaymentData.value.orderId,
            },
          );
        } else {
          Get.back();
        }

        Get.snackbar(
          "Berhasil",
          "Pembayaran Berhasil",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else if (data['status'] == "EXPIRED") {
        await orderController.getOrders();
        await detailOrderController.getOrder();

        if (previousRoute == "/rent-car") {
          Get.offAllNamed(
            Routes.DETAIL_ORDER,
            predicate: (route) => route.settings.name == Routes.DASHBOARD,
            arguments: {
              "orderId": orderPaymentData.value.orderId,
            },
          );
        } else {
          Get.back();
        }

        Get.snackbar(
          "Gagal",
          "Pembayaran Telah Kadaluarsa",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    });
  }

  String get countDownExpired {
    if (_duration.inSeconds <= 0) {
      return "00:00:00";
    } else {
      return _duration == null
          ? "00:00:00"
          : "${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}";
    }
  }

  @override
  void onInit() {
    print(previousRoute);
    _duration = const Duration(seconds: 0);

    if (Get.arguments?['orderId'] != null) {
      joinRoomOrder();
      getOrderPayment();
    } else {
      Get.back();
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    super.onInit();
  }
}
