import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';
import 'package:icp_gahara_mobile/app/widgets/form_input_field.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Buat Akun Baru",
                            style:
                                AppTexts.primaryPRegular.copyWith(fontSize: 18),
                          ),
                          Text(
                            "Mulai perjalanan anda bersama kami",
                            style: AppTexts.primaryPRegular
                                .copyWith(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            FormInputField(
                              isRequired: true,
                              controller: controller.noKTPController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              hintText: 'Masukkan Nomer KTP Anda',
                              labelText: 'Nomer KTP',
                              prefixIcon: const Icon(Icons.credit_card),
                            ),
                            FormInputField(
                              isRequired: true,
                              controller: controller.nameController,
                              textInputAction: TextInputAction.next,
                              hintText: 'Masukkan Nama Anda',
                              labelText: 'Nama',
                              prefixIcon: const Icon(Icons.person),
                            ),
                            FormInputField(
                              controller: controller.addressController,
                              textInputAction: TextInputAction.next,
                              hintText: 'Masukkan Alamat Anda',
                              labelText: 'Alamat',
                              prefixIcon: const Icon(Icons.home),
                            ),
                            FormInputField(
                              isRequired: true,
                              controller: controller.emailController,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.emailAddress,
                              hintText: 'Masukkan Email Anda',
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email),
                            ),
                            Obx(
                              () => FormInputField(
                                isRequired: true,
                                controller: controller.passwordController,
                                textInputAction: TextInputAction.send,
                                textCapitalization: TextCapitalization.none,
                                hintText: 'Masukkan Password Anda',
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.key),
                                obscureText: controller.isPasswordHide.value,
                                customValidation: true,
                                customValidationFunction: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  } else if (value.length < 6) {
                                    return 'Password minimal 6 karakter';
                                  } else {
                                    return null;
                                  }
                                },
                                onPasswordVisibilityChanged: () =>
                                    controller.isPasswordHide.toggle(),
                              ),
                            ),
                            Obx(
                              () => FormInputField(
                                isRequired: true,
                                controller:
                                    controller.confirmPasswordController,
                                textInputAction: TextInputAction.send,
                                textCapitalization: TextCapitalization.none,
                                onFieldSubmitted: (value) =>
                                    controller.onSubmit(),
                                hintText: 'Masukkan Konfirmasi Password Anda',
                                labelText: 'Konfirmasi Password',
                                prefixIcon: const Icon(Icons.key),
                                customValidation: true,
                                customValidationFunction: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  } else if (value.length < 6) {
                                    return 'Password minimal 6 karakter';
                                  } else if (value !=
                                      controller.passwordController.text) {
                                    return 'Password tidak sama';
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText:
                                    controller.isPasswordConfirmHide.value,
                                onPasswordVisibilityChanged: () =>
                                    controller.isPasswordConfirmHide.toggle(),
                              ),
                            ),
                            Container(
                              width: Get.width,
                              margin: const EdgeInsets.only(top: 16),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () => controller.onSubmit(),
                                child: Text(
                                  'Daftar',
                                  style: AppTexts.primaryPRegular.copyWith(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah Punya Akun ?"),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text("Masuk Sekarang"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
