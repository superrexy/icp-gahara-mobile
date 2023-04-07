import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/model/response/cars_response.dart';

import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/form_rent_car_controller.dart';
import 'package:icp_gahara_mobile/app/widgets/form_input_datetime.dart';
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
          mainAxisSize: MainAxisSize.max,
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
                  Flexible(
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
                  Flexible(
                    child: Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        'Sewa Mobil',
                        style: AppTexts.primaryPBold
                            .copyWith(fontSize: 18, color: Colors.black),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const Flexible(
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
            Flexible(
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
                          SizedBox(
                            height: 16.h,
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
                                  "Tipe Sewa",
                                  style: AppTexts.primaryPBold.copyWith(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Text(
                                  "Pilih tipe sewa yang anda inginkan",
                                  style: AppTexts.primaryPRegular.copyWith(
                                      fontSize: 14,
                                      color: AppColors.secondaryColor.shade700,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            controller.typeRent.value = "day",
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ).r,
                                          decoration: BoxDecoration(
                                            color: controller.typeRent.value ==
                                                    "day"
                                                ? Colors.green
                                                : Colors.white,
                                            border: Border.all(
                                              color: Colors.green,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0).r,
                                          ),
                                          child: Text(
                                            "Harian",
                                            style:
                                                AppTexts.primaryPBold.copyWith(
                                              fontSize: 14,
                                              color:
                                                  controller.typeRent.value ==
                                                          "day"
                                                      ? Colors.white
                                                      : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            controller.typeRent.value = "hour",
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ).r,
                                          decoration: BoxDecoration(
                                            color: controller.typeRent.value ==
                                                    "hour"
                                                ? Colors.green
                                                : Colors.white,
                                            border: Border.all(
                                              color: Colors.green,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0).r,
                                          ),
                                          child: Text(
                                            "Jam",
                                            style:
                                                AppTexts.primaryPBold.copyWith(
                                              fontSize: 14,
                                              color:
                                                  controller.typeRent.value ==
                                                          "hour"
                                                      ? Colors.white
                                                      : Colors.black,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.typeRent.value != "",
                              child: Container(
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
                                          color:
                                              AppColors.secondaryColor.shade700,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    FormInputField(
                                      controller:
                                          controller.tujuanSewaController,
                                      hintText: "Masukkan Tujuan Sewa",
                                      labelText: "Tujuan Sewa",
                                      isRequired: true,
                                      textInputAction: TextInputAction.next,
                                    ),
                                    Visibility(
                                      visible:
                                          controller.typeRent.value == "day",
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FormInputDateTime(
                                            controller: controller
                                                .tanggalSewaController,
                                            labelText: "Tanggal Sewa",
                                            hintText: "Masukkan Tanggal Sewa",
                                            isRequired: true,
                                            textInputAction:
                                                TextInputAction.next,
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.now().add(
                                              const Duration(days: 30),
                                            ),
                                            onChange: (value) {
                                              if (value != null) {
                                                controller.isDateSelected
                                                    .value = true;
                                              }
                                            },
                                          ),
                                          Obx(
                                            () => FormInputDateTime(
                                              enabled: controller
                                                      .isDateSelected.value ==
                                                  true,
                                              controller: controller
                                                  .tanggalKembaliController,
                                              labelText: "Tanggal Kembali",
                                              hintText:
                                                  "Masukkan Tanggal Kembali",
                                              isRequired: true,
                                              textInputAction:
                                                  TextInputAction.next,
                                              initialDate: controller
                                                          .tanggalSewaController
                                                          .text !=
                                                      ""
                                                  ? DateTime.parse(controller
                                                          .tanggalSewaController
                                                          .text)
                                                      .add(
                                                      const Duration(),
                                                    )
                                                  : DateTime.now(),
                                              firstDate: controller
                                                          .tanggalSewaController
                                                          .text !=
                                                      ""
                                                  ? DateTime.parse(controller
                                                          .tanggalSewaController
                                                          .text)
                                                      .add(
                                                      const Duration(),
                                                    )
                                                  : DateTime.now(),
                                              lastDate: controller
                                                          .tanggalSewaController
                                                          .text !=
                                                      ""
                                                  ? DateTime.parse(controller
                                                          .tanggalSewaController
                                                          .text)
                                                      .add(
                                                      const Duration(days: 30),
                                                    )
                                                  : DateTime.now().add(
                                                      const Duration(days: 30),
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Obx(
                                      () => Visibility(
                                        visible:
                                            controller.typeRent.value == "hour",
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Jam Sewa",
                                              style: AppTexts.primaryPRegular,
                                            ),
                                            SizedBox(height: 2.h),
                                            SizedBox(
                                              width: Get.width,
                                              child: DropdownButtonFormField(
                                                value: controller
                                                    .listHourPrices!.first.id,
                                                items: controller
                                                    .listHourPrices!
                                                    .map(
                                                      (e) => DropdownMenuItem(
                                                        value: e.id,
                                                        child: Text(e.name!),
                                                      ),
                                                    )
                                                    .toList(),
                                                onChanged: (val) {
                                                  controller.selectedHourPrice
                                                      .value = val!;
                                                },
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  12.0,
                                                ).r,
                                                isExpanded: true,
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      AppColors.secondaryColor,
                                                  filled: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                    horizontal: 15,
                                                    vertical: 15,
                                                  ),
                                                  hintStyle: TextStyle(
                                                    color: AppColors
                                                        .secondaryColor
                                                        .shade800,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .secondaryColor,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .secondaryColor,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () => controller.validationPage(),
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
