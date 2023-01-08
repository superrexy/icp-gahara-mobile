import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/form_car_controller.dart';
import 'package:icp_gahara_mobile/app/widgets/form_input_file.dart';

import '../../../common/values/app_texts.dart';
import '../../../widgets/form_input_field.dart';

class FormCarView extends GetView<FormCarController> {
  const FormCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
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
                        args?['isUpdate'] != null
                            ? 'Update Mobil'
                            : 'Tambah Mobil',
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
              child: SingleChildScrollView(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    child: Column(
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
                                "Foto Mobil",
                                style: AppTexts.primaryPBold.copyWith(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "Isi foto mobil dengan benar",
                                style: AppTexts.primaryPRegular.copyWith(
                                    fontSize: 14,
                                    color: AppColors.secondaryColor.shade700,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              GetBuilder<FormCarController>(
                                init: FormCarController(),
                                builder: (controller) {
                                  return FormInputFile(
                                    label: "Unggah Foto Mobil",
                                    changeImage: () => controller.getImage(),
                                    resetImage: () => controller.resetImage(),
                                    fromInternet: false,
                                    valueImage: controller.image,
                                  );
                                },
                              )
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
                                "Isi data mobil dengan benar",
                                style: AppTexts.primaryPRegular.copyWith(
                                    fontSize: 14,
                                    color: AppColors.secondaryColor.shade700,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              FormInputField(
                                controller: TextEditingController(),
                                hintText: "Masukkan Nama Mobil",
                                labelText: "Nama Mobil",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                              FormInputField(
                                controller: TextEditingController(),
                                hintText: "Masukkan Tipe Mobil",
                                labelText: "Tipe Mobil",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                              FormInputField(
                                controller: TextEditingController(),
                                hintText: "Masukkan Deskripsi Mobil",
                                labelText: "Deskripsi Mobil",
                                textInputAction: TextInputAction.next,
                                isTextArea: true,
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
                                "Spesifikasi Mobil",
                                style: AppTexts.primaryPBold.copyWith(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "Isi spesifikasi mobil dengan benar",
                                style: AppTexts.primaryPRegular.copyWith(
                                    fontSize: 14,
                                    color: AppColors.secondaryColor.shade700,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              FormInputField(
                                controller: TextEditingController(),
                                hintText: "Masukkan Jumlah Seats",
                                labelText: "Jumlah Seats",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                              ),
                              FormInputField(
                                controller: TextEditingController(),
                                hintText: "Masukkan Transmisi Mobil",
                                labelText: "Transmisi Mobil",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                              FormInputField(
                                controller: TextEditingController(),
                                hintText: "Masukkan Jenis Bensin",
                                labelText: "Jenis Bensin",
                                textInputAction: TextInputAction.next,
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
                                "Harga Sewa Mobil",
                                style: AppTexts.primaryPBold.copyWith(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "Isi harga sewa mobil dengan benar",
                                style: AppTexts.primaryPRegular.copyWith(
                                    fontSize: 14,
                                    color: AppColors.secondaryColor.shade700,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              FormInputField(
                                controller: TextEditingController(),
                                hintText: "Masukkan Harga Sewa / Hari",
                                labelText: "Harga Sewa / Hari",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Simpan"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
