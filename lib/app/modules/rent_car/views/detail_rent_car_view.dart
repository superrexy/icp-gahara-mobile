import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    const Flexible(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(""),
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
              Obx(
                () => Visibility(
                  visible: controller.car.value.id != null,
                  child: controller.car.value.carImages != null
                      ? ImageSlideshow(
                          autoPlayInterval: 3000,
                          isLoop: true,
                          height: 250.h,
                          children: controller.car.value.carImages!
                              .map((e) => Image.network(
                                    AppConstants.baseURL + e.image!,
                                    fit: BoxFit.cover,
                                  ))
                              .toList(),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.car.value.id != null,
                  child: Container(
                    width: Get.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Obx(
                      () {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.car.value.name ?? "",
                              style: AppTexts.primaryPBold.copyWith(
                                fontSize: 18,
                                color: AppColors.secondaryColor.shade900,
                              ),
                            ),
                            Text(
                              "Tipe ${controller.car.value.typeCar ?? ""}",
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
                              controller.car.value.description ?? "",
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
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SpesificationCarItem(
                                  title:
                                      '${controller.car.value.seats ?? 0} Seats',
                                  imagePath: AppImages.icSeat,
                                ),
                                SpesificationCarItem(
                                  title: controller.car.value.transmision ?? "",
                                  imagePath: AppImages.icTransmission,
                                ),
                                SpesificationCarItem(
                                  title: controller.car.value.typeFuel ?? "",
                                  imagePath: AppImages.icFuel,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              "Harga Sewa",
                              style: AppTexts.primaryPBold.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "Harga Harian ${controller.car.value.priceDay!.formatCurrencyIDR()}",
                            ),
                            Text(controller.car.value.pricesHour != null
                                ? "Harga Per Jam Mulai ${controller.car.value.pricesHour!.formatCurrencyIDR()}"
                                : ""),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                child: Obx(
                                  () => AutoSizeText(
                                    controller.car.value.carDayPrice != null
                                        ? controller
                                            .car.value.carDayPrice!.price!
                                            .formatCurrencyIDR()
                                        : "",
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
                                  " / hari",
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
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                child: Obx(
                                  () => AutoSizeText(
                                    controller.car.value.pricesHour != null
                                        ? controller.car.value.pricesHour!
                                            .formatCurrencyIDR()
                                        : "",
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
                              AutoSizeText(
                                " / jam",
                                style: AppTexts.primaryPRegular.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.secondaryColor.shade900,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.FORM_RENT_CAR,
                            arguments: {
                              "carId": controller.car.value.id,
                              "hourPrices": controller.car.value.carHourPrice,
                            },
                          );
                        },
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
