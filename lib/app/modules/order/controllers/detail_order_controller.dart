import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/orders_provider.dart';
import 'package:icp_gahara_mobile/app/model/response/order_response.dart';
import 'package:icp_gahara_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';

class DetailOrderController extends GetxController {
  // Controller
  final DashboardController dashboardController = Get.find();

  // Provider
  final OrdersProvider ordersProvider = OrdersProvider();

  // Observable
  final order = OrdersDataResponse().obs;

  // Function
  Future<void> getOrder() async {
    try {
      final response =
          await ordersProvider.getOrderByID(Get.arguments["orderId"]);

      if (response != null) {
        order.update((val) {
          val!.id = response.id;
          val.nameRent = response.nameRent;
          val.noKtp = response.noKtp;
          val.phone = response.phone;
          val.address = response.address;
          val.startDate = response.startDate;
          val.rentalPurposes = response.rentalPurposes;
          val.endDate = response.endDate;
          val.totalPrice = response.totalPrice;
          val.status = response.status;
          val.createdAt = response.createdAt;
          val.updatedAt = response.updatedAt;
          val.carId = response.carId;
          val.car = response.car;
          val.userId = response.userId;
          val.rentHourId = response.rentHourId;
          val.rentHour = response.rentHour;
          val.car = response.car;
        });
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    getOrder();
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
