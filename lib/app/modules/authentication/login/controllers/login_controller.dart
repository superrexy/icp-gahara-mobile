import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  // FORM
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final isVisiblePassword = false.obs;

  void showPassword() {
    isVisiblePassword.value = !isVisiblePassword.value;
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
