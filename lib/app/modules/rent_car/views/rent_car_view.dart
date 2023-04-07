import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/rent_car_controller.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';
import 'package:icp_gahara_mobile/app/widgets/car_rent_card.dart';

class RentCarView extends GetView<RentCarController> {
  const RentCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    bool isMenuAdmin = args?['isMenuAdmin'] == null ? false : true;
    bool isInfo = args?['isInfo'] == null ? false : true;

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
                      child: FittedBox(
                        child: AutoSizeText(
                          isInfo
                              ? "Informasi Mobil"
                              : isMenuAdmin
                                  ? "Menu Mobil"
                                  : "Sewa Mobil",
                          style: AppTexts.primaryPBold
                              .copyWith(fontSize: 18, color: Colors.black),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: isMenuAdmin
                          ? IconButton(
                              onPressed: () => Get.toNamed(Routes.FORM_CAR),
                              icon: const Icon(
                                Icons.add,
                              ),
                            )
                          : const SizedBox(
                              width: 18,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Obx(
                    () => controller.cars.isEmpty
                        ? SizedBox(
                            height: Get.height * 0.8,
                            child: Center(
                              child: Text(
                                "Data Mobil Masih Kosong",
                                style: AppTexts.primaryPBold,
                              ),
                            ),
                          )
                        : Column(
                            children: controller.cars
                                .map(
                                  (element) => CarRentCard(
                                    isAdmin: isMenuAdmin,
                                    isInfo: isInfo,
                                    data: element,
                                    onDelete: () =>
                                        controller.deleteCar(element.id!),
                                  ),
                                )
                                .toList(),
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
