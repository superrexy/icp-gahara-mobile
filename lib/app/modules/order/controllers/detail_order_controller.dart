import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/orders_provider.dart';
import 'package:icp_gahara_mobile/app/model/response/order_response.dart';

class DetailOrderController extends GetxController {
  // Provider
  final OrdersProvider ordersProvider = OrdersProvider();

  // Observable
  final order = OrdersDataResponse(
    address: '',
    carId: 0,
    endDate: DateTime.now(),
    id: 0,
    nameRent: '',
    noKtp: '',
    phone: '',
    rentalPurposes: '',
    startDate: DateTime.now(),
    status: 'ACTIVE',
    totalPrice: 0,
    userId: 0,
    car: Car(
        id: 0,
        name: '',
        description: '',
        price: 0,
        seats: 0,
        image: '',
        typeFuel: '',
        typeCar: '',
        transmision: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
  ).obs;

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
