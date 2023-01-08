import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/common/values/app_images.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';
import 'package:icp_gahara_mobile/app/widgets/form_input_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.05),
                Center(
                  child: Image.asset(
                    AppImages.imgLogo,
                    fit: BoxFit.cover,
                    width: 300,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang di ICP Gahara",
                        style: AppTexts.primaryPRegular.copyWith(fontSize: 18),
                      ),
                      Text(
                        "Silahkan Masuk untuk Melanjutkan",
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
                          controller: controller.emailController,
                          textInputAction: TextInputAction.next,
                          hintText: 'Masukkan Email Anda',
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                        ),
                        Obx(
                          () => FormInputField(
                            controller: controller.passwordController,
                            textInputAction: TextInputAction.send,
                            hintText: 'Masukkan Password Anda',
                            labelText: 'Password',
                            obscureText: controller.isVisiblePassword.value,
                            prefixIcon: const Icon(Icons.key),
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
                            onPressed: () => Get.offAllNamed(Routes.DASHBOARD),
                            child: Text(
                              'Masuk',
                              style: AppTexts.primaryPRegular
                                  .copyWith(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum Punya Akun ?"),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                      child: const Text("Daftar Sekarang"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
