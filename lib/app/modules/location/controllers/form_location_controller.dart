import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/location_provider.dart';
import 'package:icp_gahara_mobile/app/model/request/location_request.dart';
import 'package:icp_gahara_mobile/app/model/response/location_response.dart';

class FormLocationController extends GetxController {
  // Provider
  final LocationProvider locationProvider = LocationProvider();

  // Form
  final formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  // Function
  Future<void> getLocation() async {
    try {
      final response = await locationProvider.getLocation();

      if (response != null) {
        addressController.text = response.address;
        latitudeController.text = response.latitude.toString();
        longitudeController.text = response.longitude.toString();
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        final LocationRequest payload = LocationRequest(
          address: addressController.text,
          latitude: latitudeController.text,
          longitude: longitudeController.text,
        );
        final response = await locationProvider.updateLocation(payload);

        if (response) {
          Get.back();
          Get.snackbar(
            'Berhasil',
            'Berhasil Memperbarui Lokasi.',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    getLocation();
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
