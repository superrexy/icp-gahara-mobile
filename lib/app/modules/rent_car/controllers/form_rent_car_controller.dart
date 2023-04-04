import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/utils/helpers.dart';
import 'package:icp_gahara_mobile/app/data/cars_provider.dart';
import 'package:icp_gahara_mobile/app/data/orders_provider.dart';
import 'package:icp_gahara_mobile/app/model/request/order_request.dart';
import 'package:icp_gahara_mobile/app/model/response/cars_response.dart';
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

  // Hour Prices List
  final List<CarPrice>? listHourPrices = Get.arguments["hourPrices"];
  final selectedHourPrice = Rxn<int>();

  // Observable
  final carId = 0.obs;
  final totalDays = 0.obs;
  final nameHourPrice = "".obs;
  final totalPrice = 0.obs;
  final isDateSelected = false.obs;
  final typeRent = "".obs;
  final paymentSelected = "".obs;

  Future<void> validationPage() async {
    if (formKey.currentState!.validate()) {
      final response = await carsProvider.getCarByID(Get.arguments?['carId']);

      if (response != null) {
        carId.value = response.id!;

        if (typeRent.value == "day") {
          totalDays.value = Helpers.countRangeDays(
              DateTime.parse(tanggalSewaController.text),
              DateTime.parse(tanggalKembaliController.text));

          if (totalDays.value == 0) {
            totalDays.value = 1;
          }

          totalPrice.value = response.priceDay! * totalDays.value;
        } else if (typeRent.value == "hour") {
          late CarPrice hourPrice;

          if (selectedHourPrice.value == null) {
            hourPrice = listHourPrices!.first;

            selectedHourPrice.value = hourPrice.id;
          } else {
            hourPrice = listHourPrices!
                .firstWhere((element) => element.id == selectedHourPrice.value);
          }

          nameHourPrice.value = hourPrice.name!;
          totalPrice.value = hourPrice.price!;
        }
      }

      Get.toNamed(Routes.FORM_DETAIL_RENT_CAR);
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
        rentType: typeRent.value == "day" ? TypeRent.day : TypeRent.hour,
        rentHourId: selectedHourPrice.value,
        paymentType: paymentSelected.value,
      );

      final response = await ordersProvider.createOrder(payload);

      if (response != null) {
        Get.offAllNamed(
          Routes.DETAIL_PAYMENT,
          predicate: (route) => route.settings.name == Routes.DASHBOARD,
          arguments: {
            "orderId": response.id,
          },
        );
      }
    } catch (e) {
      Get.snackbar("Error !", "Terjadi kesalahan, silahkan coba lagi",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      Get.printError(info: e.toString());
    }
  }
}
