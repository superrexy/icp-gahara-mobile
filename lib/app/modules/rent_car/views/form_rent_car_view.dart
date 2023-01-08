import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/form_rent_car_controller.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';
import 'package:icp_gahara_mobile/app/widgets/form_input_field.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_texts.dart';

class FormRentCarView extends GetView<FormRentCarController> {
  const FormRentCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Sewa Mobil',
                        style: AppTexts.primaryPBold
                            .copyWith(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Identitas Penyewa",
                                  style: AppTexts.primaryPBold.copyWith(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Text(
                                  "Isi data diri anda dengan benar",
                                  style: AppTexts.primaryPRegular.copyWith(
                                      fontSize: 14,
                                      color: AppColors.secondaryColor.shade700,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                FormInputField(
                                  controller: controller.nameController,
                                  hintText: "Masukkan Nama Lengkap",
                                  labelText: "Nama Lengkap",
                                  isRequired: true,
                                  textInputAction: TextInputAction.next,
                                ),
                                FormInputField(
                                  controller: controller.noKTPController,
                                  hintText: "Masukkan Nomer KTP",
                                  labelText: "Nomer KTP",
                                  isRequired: true,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                                FormInputField(
                                  controller: controller.addressController,
                                  hintText: "Masukkan Alamat",
                                  labelText: "Alamat",
                                  textInputAction: TextInputAction.next,
                                  isTextArea: true,
                                ),
                                FormInputField(
                                  controller: controller.phoneController,
                                  hintText: "Masukkan Nomer Telepon",
                                  labelText: "Nomer Telepon",
                                  isRequired: true,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Data Mobil",
                                  style: AppTexts.primaryPBold.copyWith(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Text(
                                  "Isi data mobil yang disewa dengan benar",
                                  style: AppTexts.primaryPRegular.copyWith(
                                      fontSize: 14,
                                      color: AppColors.secondaryColor.shade700,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                FormInputField(
                                  controller: controller.tujuanSewaController,
                                  hintText: "Masukkan Tujuan Sewa",
                                  labelText: "Tujuan Sewa",
                                  isRequired: true,
                                  textInputAction: TextInputAction.next,
                                ),
                                FormInputField(
                                  controller: controller.tanggalSewaController,
                                  hintText: "Masukkan Tanggal Sewa",
                                  labelText: "Tanggal Sewa",
                                  isRequired: true,
                                  textInputAction: TextInputAction.next,
                                ),
                                FormInputField(
                                  controller:
                                      controller.tanggalKembaliController,
                                  hintText: "Masukkan Tanggal Kembali",
                                  labelText: "Tanggal Kembali",
                                  isRequired: true,
                                  textInputAction: TextInputAction.next,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () =>
                                  Get.toNamed(Routes.FORM_DETAIL_RENT_CAR),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: const Text("Langkah Selanjutnya"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
