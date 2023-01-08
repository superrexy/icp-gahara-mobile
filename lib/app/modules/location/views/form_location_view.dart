import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/modules/location/controllers/form_location_controller.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_texts.dart';
import '../../../widgets/form_input_field.dart';

class FormLocationView extends GetView<FormLocationController> {
  const FormLocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Lokasi',
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
            Form(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
                          "Lokasi Rental Mobil",
                          style: AppTexts.primaryPBold
                              .copyWith(fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          "Isi data lokasi rental mobil dengan benar",
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
                          hintText: "Masukkan Alamat Rental Mobil",
                          labelText: "Alamat Rental Mobil",
                          isRequired: true,
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
                          "Latitude & Longitude Rental Mobil",
                          style: AppTexts.primaryPBold
                              .copyWith(fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          "Isi data latitude & longitude rental mobil dengan benar",
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
                          hintText: "Masukkan Latitude / -6.193125",
                          labelText: "Latitude",
                          isRequired: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                        FormInputField(
                          controller: TextEditingController(),
                          hintText: "Masukkan Longitude / 106.821810",
                          labelText: "Longitude",
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
            ))
          ],
        ),
      ),
    );
  }
}
