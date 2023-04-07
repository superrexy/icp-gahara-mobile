import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/utils/extensions.dart';
import 'package:icp_gahara_mobile/app/common/utils/helpers.dart';
import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/form_rent_car_controller.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

class FormDetailRentCarView extends GetView<FormRentCarController> {
  const FormDetailRentCarView({Key? key}) : super(key: key);
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
                      child: AutoSizeText(
                        'Sewa Mobil',
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
              child: ListView(
                children: [
                  Padding(
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
                                "Pastikan data yang anda masukkan benar",
                                style: AppTexts.primaryPRegular.copyWith(
                                    fontSize: 14,
                                    color: AppColors.secondaryColor.shade700,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormItem(
                                label: "Nama Lengkap",
                                controller: controller.nameController,
                              ),
                              TextFormItem(
                                label: "Nomer KTP",
                                controller: controller.noKTPController,
                              ),
                              TextFormItem(
                                label: "Alamat",
                                controller: controller.addressController,
                              ),
                              TextFormItem(
                                label: "Nomer Telepon",
                                controller: controller.phoneController,
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
                                "Pastikan data yang anda masukkan benar",
                                style: AppTexts.primaryPRegular.copyWith(
                                    fontSize: 14,
                                    color: AppColors.secondaryColor.shade700,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormItem(
                                label: "Tujuan Sewa",
                                controller: controller.tujuanSewaController,
                              ),
                              TextFormItem(
                                label: "Lama Sewa",
                                isTextEditingController: false,
                                text: controller.typeRent.value == "day"
                                    ? "${controller.totalDays.value} Hari"
                                    : controller.nameHourPrice.value,
                              ),
                              TextFormItem(
                                label: "Total Harga",
                                isTextEditingController: false,
                                text: controller.totalPrice.value
                                    .formatCurrencyIDR(),
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
                            onPressed: () => Get.toNamed(Routes.CHOOSE_PAYMENT),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text("Pilih Pembayaran"),
                          ),
                        )
                      ],
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

class TextFormItem extends StatelessWidget {
  const TextFormItem({
    Key? key,
    this.controller,
    required this.label,
    this.isTextEditingController = true,
    this.text,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final bool? isTextEditingController;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTexts.primaryPBold),
        isTextEditingController! ? Text(controller!.text) : Text(text!),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
