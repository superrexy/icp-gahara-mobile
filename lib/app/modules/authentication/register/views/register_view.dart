import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            FormInputField(
                              controller: TextEditingController(),
                              textInputAction: TextInputAction.next,
                              hintText: 'Masukkan Nomer KTP Anda',
                              labelText: 'Nomer KTP',
                              prefixIcon: const Icon(Icons.credit_card),
                            ),
                            FormInputField(
                              controller: TextEditingController(),
                              textInputAction: TextInputAction.next,
                              hintText: 'Masukkan Nama Anda',
                              labelText: 'Nama',
                              prefixIcon: const Icon(Icons.person),
                            ),
                            FormInputField(
                              controller: TextEditingController(),
                              textInputAction: TextInputAction.next,
                              hintText: 'Masukkan Alamat Anda',
                              labelText: 'Alamat',
                              prefixIcon: const Icon(Icons.home),
                            ),
                            FormInputField(
                              controller: TextEditingController(),
                              textInputAction: TextInputAction.next,
                              hintText: 'Masukkan Email Anda',
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email),
                            ),
                            FormInputField(
                              controller: TextEditingController(),
                              textInputAction: TextInputAction.send,
                              hintText: 'Masukkan Password Anda',
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.key),
                            ),
                            FormInputField(
                              controller: TextEditingController(),
                              textInputAction: TextInputAction.send,
                              hintText: 'Masukkan Konfirmasi Password Anda',
                              labelText: 'Konfirmasi Password',
                              prefixIcon: const Icon(Icons.key),
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
                                onPressed: () {},
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
