import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/storage/storage.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/data/authentication_provider.dart';
import 'package:icp_gahara_mobile/app/model/request/register_request.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  // Authentication Provider
  final AuthenticationProvider authenticationProvider =
      AuthenticationProvider();

  // Observable
  final isPasswordHide = true.obs;
  final isPasswordConfirmHide = true.obs;

  // Form
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController noKTPController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        final RegisterRequest input = RegisterRequest(
          fullName: nameController.text,
          address: addressController.text,
          email: emailController.text,
          noKtp: noKTPController.text,
          password: passwordController.text,
        );

        final response = await authenticationProvider.register(input);
        if (response != null) {
          Storage.saveValue(AppConstants.token, response.data?.token);
          Get.offAllNamed(Routes.DASHBOARD);
          Get.snackbar(
            'Berhasil',
            'Berhasil mendaftar.',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.printError(info: e.toString());
      Get.snackbar(
        'Terdapat Kesalahan',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
