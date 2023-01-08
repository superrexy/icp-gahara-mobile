import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormRentCarController extends GetxController {
  // FORM
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController noKTPController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController tujuanSewaController = TextEditingController();
  final TextEditingController tanggalSewaController = TextEditingController();
  final TextEditingController tanggalKembaliController =
      TextEditingController();

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
