import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/cars_provider.dart';
import 'package:icp_gahara_mobile/app/model/response/cars_response.dart';

class RentCarController extends GetxController {
  // Provider
  final CarsProvider carsProvider = CarsProvider();

  // Observable
  final cars = <CarsDataResponse>[].obs;

  // Function
  Future<void> getCars() async {
    try {
      final response = await carsProvider.getCars();

      if (response != null) {
        cars.assignAll(response);
      } else {
        cars.assignAll([]);
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  Future<void> deleteCar(int carId) async {
    try {
      final response = await carsProvider.deleteCar(carId);

      if (response) {
        await getCars();
        Get.back();
        Get.snackbar(
          'Berhasil',
          'Berhasil Menghapus Mobil.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    getCars();
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
