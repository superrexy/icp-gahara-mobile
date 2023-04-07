import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/form_car_controller.dart';

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
                      child: AutoSizeText(
                        args?['isUpdate'] != null
                            ? 'Edit Mobil'
                            : 'Tambah Mobil',
                        style: AppTexts.primaryPBold
                            .copyWith(fontSize: 18, color: Colors.black),
                        maxLines: 1,
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
                  key: controller.formKey,
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
                                "Galeri Mobil",
                                style: AppTexts.primaryPBold.copyWith(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "Isi data galeri mobil dengan benar",
                                style: AppTexts.primaryPRegular.copyWith(
                                  fontSize: 14,
                                  color: AppColors.secondaryColor.shade700,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Gambar pertama akan menjadi gambar utama",
                                style: AppTexts.primaryPRegular.copyWith(
                                  fontSize: 14,
                                  color: AppColors.secondaryColor.shade700,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              GetBuilder<FormCarController>(
                                builder: (controller) {
                                  return Row(
                                    children: [
                                      Row(
                                        children: controller.imagesFromApi
                                            .map(
                                              (e) => Container(
                                                width: 50,
                                                height: 50,
                                                margin: const EdgeInsets.only(
                                                        right: 8)
                                                    .r,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.green,
                                                          style:
                                                              BorderStyle.solid,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                    .circular(
                                                                        12)
                                                                .r,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                    .circular(
                                                                        12)
                                                                .r,
                                                        child: Image.network(
                                                          AppConstants.baseURL +
                                                              e.image!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .removeImageFromAPI(
                                                                e);
                                                      },
                                                      icon: const Icon(
                                                        Icons.close,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      Row(
                                        children: controller.images
                                            .map(
                                              (e) => Container(
                                                width: 50,
                                                height: 50,
                                                margin: const EdgeInsets.only(
                                                        right: 8)
                                                    .r,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.green,
                                                          style:
                                                              BorderStyle.solid,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                    .circular(
                                                                        12)
                                                                .r,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                    .circular(
                                                                        12)
                                                                .r,
                                                        child: Image.file(
                                                          e,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .removeImage(e);
                                                      },
                                                      icon: const Icon(
                                                        Icons.close,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      Visibility(
                                        visible: controller.images.length +
                                                controller
                                                    .imagesFromApi.length <
                                            5,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.green,
                                              style: BorderStyle.solid,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12).r,
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              controller.addImages();
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
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
                                "Data Mobil",
                                style: AppTexts.primaryPBold.copyWith(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "Isi data mobil dengan benar",
                                style: AppTexts.primaryPRegular.copyWith(
                                  fontSize: 14,
                                  color: AppColors.secondaryColor.shade700,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              FormInputField(
                                controller: controller.nameController,
                                hintText: "Masukkan Nama Mobil",
                                labelText: "Nama Mobil",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                              FormInputField(
                                controller: controller.typeController,
                                hintText: "Masukkan Tipe Mobil",
                                labelText: "Tipe Mobil",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                              FormInputField(
                                isRequired: true,
                                controller: controller.descriptionController,
                                hintText: "Masukkan Deskripsi Mobil",
                                labelText: "Deskripsi Mobil",
                                textInputAction: TextInputAction.next,
                                isTextArea: true,
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
                              SizedBox(
                                height: 16.h,
                              ),
                              FormInputField(
                                controller: controller.seatsController,
                                hintText: "Masukkan Jumlah Seats",
                                labelText: "Jumlah Seats",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                              ),
                              FormInputField(
                                controller: controller.transmissionController,
                                hintText: "Masukkan Transmisi Mobil",
                                labelText: "Transmisi Mobil",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                              FormInputField(
                                isRequired: true,
                                controller: controller.typeFuelController,
                                hintText: "Masukkan Jenis Bensin",
                                labelText: "Jenis Bensin",
                                textInputAction: TextInputAction.next,
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
                                "Harga Sewa Mobil / Hari",
                                style: AppTexts.primaryPBold.copyWith(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "Isi harga sewa mobil / hari dengan benar",
                                style: AppTexts.primaryPRegular.copyWith(
                                    fontSize: 14,
                                    color: AppColors.secondaryColor.shade700,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              FormInputField(
                                controller: controller.priceController,
                                hintText: "Masukkan Harga Sewa / Hari",
                                labelText: "Harga Sewa / Hari",
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GetBuilder<FormCarController>(
                          builder: (controller) {
                            return Container(
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
                                    "Harga Sewa Mobil / Jam",
                                    style: AppTexts.primaryPBold.copyWith(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  Text(
                                    "Isi harga sewa mobil / jam dengan benar",
                                    style: AppTexts.primaryPRegular.copyWith(
                                        fontSize: 14,
                                        color:
                                            AppColors.secondaryColor.shade700,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Column(
                                    children: controller.priceHourController
                                        .map(
                                          (e) => Column(
                                            children: [
                                              FormInputField(
                                                controller: e.name,
                                                hintText: "Masukkan Nama Jam",
                                                labelText: "Nama Jam",
                                                isRequired: false,
                                                onChanged: (val) {
                                                  if (e.name.text == "" &&
                                                      e.price.text == "") {
                                                    controller
                                                        .removePriceHourController(
                                                            e);
                                                  }
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              FormInputField(
                                                controller: e.price,
                                                hintText:
                                                    "Masukkan Harga Sewa / Jam",
                                                labelText: "Harga Sewa / Jam",
                                                isRequired: false,
                                                onChanged: (val) {
                                                  if (e.name.text == "" &&
                                                      e.price.text == "") {
                                                    controller
                                                        .removePriceHourController(
                                                            e);
                                                  }
                                                },
                                                textInputAction:
                                                    TextInputAction.done,
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                              const Divider(),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  SizedBox(
                                    width: Get.width,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                          color: Colors.green,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      onPressed: () =>
                                          controller.addPriceHourController(),
                                      child: const Text(
                                        "Tambah Opsi",
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 16.h,
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
                            onPressed: () => controller.onSubmit(),
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
