import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/utils/helpers.dart';
import 'package:icp_gahara_mobile/app/data/cars_provider.dart';
import 'package:icp_gahara_mobile/app/data/orders_provider.dart';
import 'package:icp_gahara_mobile/app/model/request/order_request.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

class FormRentCarController extends GetxController {
  // PROVIDER
  final OrdersProvider ordersProvider = OrdersProvider();
  final CarsProvider carsProvider = CarsProvider();
  // FORM
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController noKTPController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController tujuanSewaController = TextEditingController();
  final TextEditingController tanggalSewaController = TextEditingController();
  final TextEditingController tanggalKembaliController =
      TextEditingController();

  // Observable
  final carId = 0.obs;
  final totalDays = 0.obs;
  final totalPrice = 0.obs;
  final isDateSelected = false.obs;

  // Function
  Future<void> validationPage() async {
    if (formKey.currentState!.validate()) {
      final response = await carsProvider.getCarByID(Get.arguments?['carId']);

      if (response != null) {
        carId.value = response.id;

        totalDays.value = Helpers.countRangeDays(
            DateTime.parse(tanggalSewaController.text),
            DateTime.parse(tanggalKembaliController.text));

        if (totalDays.value == 0) {
          totalDays.value = 1;
        }

        totalPrice.value = response.price * totalDays.value;

        Get.toNamed(Routes.FORM_DETAIL_RENT_CAR);
      }
    }
  }

  Future<void> onSubmit() async {
    try {
      final OrdersRequest payload = OrdersRequest(
        nameRent: nameController.text,
        noKtp: noKTPController.text,
        phone: phoneController.text,
        rentalPurposes: tujuanSewaController.text,
        startDate: tanggalSewaController.text,
        endDate: tanggalKembaliController.text,
        carId: carId.value,
        address: addressController.text,
      );

      final response = await ordersProvider.createOrder(payload);
      if (response) {
        Get.offNamed(Routes.SUCCESS);
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  @override
  void onInit() {
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
