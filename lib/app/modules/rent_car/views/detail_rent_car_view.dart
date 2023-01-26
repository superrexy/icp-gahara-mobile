import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:readmore/readmore.dart';

import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_images.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/detail_rent_car_controller.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';
import 'package:icp_gahara_mobile/app/widgets/spesification_car_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/extensions.dart';

class DetailRentCarView extends GetView<DetailRentCarController> {
  const DetailRentCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final bool isInfo = args?['isInfo'] == false ? false : true;
    final bool isMenuAdmin = args?['isMenuAdmin'] == false ? false : true;

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
                  const Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(""),
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
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => Visibility(
                visible: controller.car.value.id != 0,
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 400,
                  ),
                  child: Image.network(
                    AppConstants.baseURL + controller.car.value.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.car.value.id != 0,
                child: Expanded(
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Obx(
                        () {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.car.value.name,
                                style: AppTexts.primaryPBold.copyWith(
                                  fontSize: 18,
                                  color: AppColors.secondaryColor.shade900,
                                ),
                              ),
                              Text(
                                "Tipe ${controller.car.value.typeCar}",
                                style: AppTexts.primaryPRegular.copyWith(
                                  fontSize: 14,
                                  color: AppColors.secondaryColor.shade700,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "RINGKASAN",
                                style: AppTexts.primaryPBold.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              ReadMoreText(
                                controller.car.value.description,
                                moreStyle: AppTexts.primaryPBold.copyWith(
                                  fontSize: 14,
                                ),
                                lessStyle: AppTexts.primaryPBold.copyWith(
                                  fontSize: 14,
                                ),
                                style: AppTexts.primaryPRegular.copyWith(
                                  fontSize: 14,
                                  color: AppColors.secondaryColor.shade900,
                                ),
                                textAlign: TextAlign.justify,
                                trimCollapsedText: ' Selengkapnya',
                                trimExpandedText: ' Sembunyikan',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "SPESIFIKASI",
                                style: AppTexts.primaryPBold.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SpesificationCarItem(
                                    title:
                                        '${controller.car.value.seats} Seats',
                                    imagePath: AppImages.icSeat,
                                  ),
                                  SpesificationCarItem(
                                    title: controller.car.value.transmision,
                                    imagePath: AppImages.icTransmission,
                                  ),
                                  SpesificationCarItem(
                                    title: controller.car.value.typeFuel,
                                    imagePath: AppImages.icFuel,
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isInfo == false && isMenuAdmin == false
          ? Obx(
              () => Visibility(
                visible: controller.car.value.id != 0,
                child: Container(
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 130,
                            child: FittedBox(
                              child: AutoSizeText(
                                controller.car.value.price.formatCurrencyIDR(),
                                style: AppTexts.primaryPBold.copyWith(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          FittedBox(
                            child: AutoSizeText(
                              "/hari",
                              style: AppTexts.primaryPRegular.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.secondaryColor.shade900,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => Get.toNamed(
                          Routes.FORM_RENT_CAR,
                          arguments: {
                            "carId": controller.car.value.id,
                          },
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: AutoSizeText(
                          "Pesan Sekarang",
                          style: AppTexts.primaryPRegular
                              .copyWith(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
