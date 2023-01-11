import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/storage/storage.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/data/authentication_provider.dart';
import 'package:icp_gahara_mobile/app/model/request/login_request.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

class LoginController extends GetxController {
  // Authentication Provider
  final AuthenticationProvider authenticationProvider =
      AuthenticationProvider();

  // FORM
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final isVisiblePassword = true.obs;

  void showPassword() {
    isVisiblePassword.value = !isVisiblePassword.value;
  }

  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        final LoginRequest input = LoginRequest(
          email: emailController.text,
          password: passwordController.text,
        );

        final response = await authenticationProvider.login(input);
        if (response != null) {
          Storage.saveValue(AppConstants.token, response.data?.token);
          Get.offAllNamed(Routes.DASHBOARD);
          Get.snackbar(
            'Berhasil',
            'Berhasil Masuk.',
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
