import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/detail_payment_controller.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_texts.dart';
import '../../../common/utils/extensions.dart';

class DetailPaymentView extends GetView<DetailPaymentController> {
  const DetailPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        'Detail Pembayaran',
                        style: AppTexts.primaryPBold
                            .copyWith(fontSize: 18.sp, color: Colors.black),
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
            Container(
              width: Get.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: GetBuilder<DetailPaymentController>(
                builder: (controller) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Batas Akhir Pembayaran",
                            style: AppTexts.primaryPRegular.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mutedColor,
                            ),
                          ),
                          Text(
                            controller.orderPaymentData.value.expiredAt != null
                                ? controller.orderPaymentData.value.expiredAt!
                                    .toLocal()
                                    .formatDateToString("dd MMMM yyyy HH:mm")
                                : "",
                            style: AppTexts.primaryPRegular.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ).r,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.red,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              controller.countDownExpired,
                              style: AppTexts.primaryPBold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            GetBuilder<DetailPaymentController>(
              builder: (controller) {
                return Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ).r,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.orderPaymentData.value.bank == "bri"
                                ? "BRI Virtual Account"
                                : controller.orderPaymentData.value.bank ==
                                        "bca"
                                    ? "BCA Virtual Account"
                                    : controller.orderPaymentData.value.bank ==
                                            "bni"
                                        ? "BNI Virtual Account"
                                        : controller.orderPaymentData.value
                                                    .bank ==
                                                "mandiri"
                                            ? "Mandiri Virtual Account"
                                            : controller.orderPaymentData.value
                                                            .actionUrl !=
                                                        null &&
                                                    controller.orderPaymentData
                                                        .value.actionUrl!
                                                        .contains("shopeepay")
                                                ? "ShopeePay"
                                                : "GoPay",
                            style: AppTexts.primaryPBold.copyWith(),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: 30.h,
                              maxWidth: 100.w,
                            ),
                            child: controller.orderPaymentData.value.bank !=
                                        null ||
                                    controller
                                            .orderPaymentData.value.actionUrl !=
                                        null
                                ? Image.network(
                                    controller.orderPaymentData.value.bank ==
                                            "bri"
                                        ? "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/09/0fcddd245474380834dfe5f3beb0492f_093eb297aba2188382cf91e556dd9bdf_compressed.png"
                                        : controller.orderPaymentData.value
                                                    .bank ==
                                                "bca"
                                            ? "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/09/fc68a00838f69124fddaf64e30f5e958_ca45aac69ce87ce691c3e6582894b6f0_compressed.png"
                                            : controller.orderPaymentData.value
                                                        .bank ==
                                                    "bni"
                                                ? "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/09/f6f57e9126c57179cf729cc9586e47c0_e26ce4cce944fe379072ae509fe72ec1_compressed.png"
                                                : controller.orderPaymentData
                                                        .value.actionUrl!
                                                        .contains("shopeepay")
                                                    ? "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/10/f7fb2e0ab8572355142dba33ddc7b8d6_0747205be87147c03d04217ad4eb06c3_compressed.png"
                                                    : "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/09/5038aa2e01be0c79443496e8b6112010_718692dca7079b31a47f68e149c81aff_compressed.png",
                                    fit: BoxFit.cover,
                                  )
                                : const CircularProgressIndicator(),
                          ),
                        ],
                      ),
                      Visibility(
                        visible:
                            controller.orderPaymentData.value.actionUrl == null,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          child: const Divider(),
                        ),
                      ),
                      Visibility(
                        visible:
                            controller.orderPaymentData.value.actionUrl == null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nomor Virtual Account",
                                  style: AppTexts.primaryPRegular.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.mutedColor,
                                  ),
                                ),
                                Text(
                                  controller.orderPaymentData.value.vaNumber ??
                                      "-",
                                  style: AppTexts.primaryPRegular.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                  ClipboardData(
                                      text: controller
                                          .orderPaymentData.value.vaNumber),
                                );
                                Get.snackbar(
                                  "Berhasil",
                                  "Nomor Virtual Account berhasil disalin",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                              },
                              icon: const Icon(Icons.copy),
                              iconSize: 18.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            GetBuilder<DetailPaymentController>(
              init: DetailPaymentController(),
              builder: (controller) {
                return Visibility(
                  visible: controller.orderPaymentData.value.actionUrl != null,
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ).r,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: controller
                                          .orderPaymentData.value.actionUrl !=
                                      null &&
                                  controller.orderPaymentData.value.actionUrl!
                                      .contains("shopeepay") ||
                              controller.orderPaymentData.value.actionUrl !=
                                      null &&
                                  controller.orderPaymentData.value.actionUrl!
                                      .contains("gopay"),
                          child: SizedBox(
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (controller.countDownExpired != "00:00:00") {
                                  await launchUrlString(
                                    controller
                                        .orderPaymentData.value.actionUrl!,
                                    mode: LaunchMode.externalApplication,
                                  );
                                } else {
                                  Get.snackbar(
                                    "Gagal",
                                    "Waktu pembayaran telah habis",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                              ),
                              child: const Text("Bayar Sekarang"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
