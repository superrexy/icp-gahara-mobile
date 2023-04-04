import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/utils/extensions.dart';
import 'package:icp_gahara_mobile/app/common/utils/helpers.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/modules/order/controllers/detail_order_controller.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_texts.dart';
import '../../rent_car/views/form_detail_rent_car_view.dart';

class DetailOrderView extends GetView<DetailOrderController> {
  const DetailOrderView({Key? key}) : super(key: key);
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
                      child: FittedBox(
                        child: Text(
                          'Detail Riwayat',
                          style: AppTexts.primaryPBold
                              .copyWith(fontSize: 18, color: Colors.black),
                        ),
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
            Obx(
              () => Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height * 0.13,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primaryColor,
                              AppColors.primaryColor.shade200,
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kode Pemesanan",
                              style: AppTexts.primaryPBold.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              controller.order.value.id != null
                                  ? controller.order.value.id.toString()
                                  : "-",
                              style: AppTexts.primaryPBold.copyWith(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            const Divider(),
                            Text(
                              "Detail Pemesanan",
                              style: AppTexts.primaryPBold.copyWith(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                        .order.value.nameRent ??
                                                    "-",
                                                style: AppTexts.primaryPBold
                                                    .copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                              horizontal: 8.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: controller
                                                          .order.value.status ==
                                                      "ACTIVE"
                                                  ? Colors.green
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Text(
                                              controller.order.value.status ==
                                                      "ACTIVE"
                                                  ? "Aktif"
                                                  : controller.order.value
                                                              .status ==
                                                          "NOTPAID"
                                                      ? "Belum Dibayar"
                                                      : controller.order.value
                                                                  .status ==
                                                              "EXPIRED"
                                                          ? "Kadaluarsa"
                                                          : "Selesai",
                                              style: AppTexts.primaryPBold
                                                  .copyWith(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        controller.order.value.createdAt != null
                                            ? controller.order.value.createdAt!
                                                .toLocal()
                                                .formatDateToString(
                                                    "dd MMM yyyy, HH:mm")
                                            : "-",
                                        style:
                                            AppTexts.primaryPRegular.copyWith(
                                          fontSize: 14,
                                          color:
                                              AppColors.secondaryColor.shade800,
                                        ),
                                      ),
                                      const Divider(),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          controller.order.value.car?.image !=
                                                  null
                                              ? Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          AppConstants.baseURL +
                                                              controller
                                                                  .order
                                                                  .value
                                                                  .car!
                                                                  .image),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border:
                                                        Border.fromBorderSide(
                                                      BorderSide(
                                                        width: 1,
                                                        color: Colors.grey
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : const CircularProgressIndicator(),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.order.value.car
                                                        ?.name ??
                                                    "-",
                                                style: AppTexts.primaryPBold
                                                    .copyWith(
                                                  fontSize: 18,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6.h,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Tujuan Sewa",
                                                    style: AppTexts
                                                        .primaryPRegular,
                                                  ),
                                                  const SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    controller.order.value
                                                            .rentalPurposes ??
                                                        "-",
                                                    style:
                                                        AppTexts.primaryPBold,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Visibility(
                                                visible: controller.order.value
                                                        .rentHourId !=
                                                    null,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Jam Sewa",
                                                      style: AppTexts
                                                          .primaryPRegular,
                                                    ),
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      controller.order.value
                                                              .rentHour?.name ??
                                                          "-",
                                                      style:
                                                          AppTexts.primaryPBold,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: controller.order.value
                                                        .rentHourId ==
                                                    null,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Tanggal Sewa",
                                                          style: AppTexts
                                                              .primaryPRegular,
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          controller.order.value
                                                                      .startDate !=
                                                                  null
                                                              ? controller
                                                                  .order
                                                                  .value
                                                                  .startDate!
                                                                  .toLocal()
                                                                  .formatDateToString(
                                                                      "dd MMM yyyy, HH:mm")
                                                              : "-",
                                                          style: AppTexts
                                                              .primaryPBold,
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Tanggal Kembali",
                                                          style: AppTexts
                                                              .primaryPRegular,
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          controller.order.value
                                                                      .endDate !=
                                                                  null
                                                              ? controller
                                                                  .order
                                                                  .value
                                                                  .endDate!
                                                                  .toLocal()
                                                                  .formatDateToString(
                                                                      "dd MMM yyyy, HH:mm")
                                                              : "-",
                                                          style: AppTexts
                                                              .primaryPBold,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Detail Harga",
                              style: AppTexts.primaryPBold.copyWith(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
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
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                      .order.value.car?.name ??
                                                  "-",
                                              style: AppTexts.primaryPBold
                                                  .copyWith(
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                controller.order.value
                                                            .rentHourId ==
                                                        null
                                                    ? Text(
                                                        controller.order.value
                                                                    .startDate ==
                                                                null
                                                            ? ""
                                                            : "Sewa ${Helpers.countRangeDays(controller.order.value.startDate!.toLocal(), controller.order.value.endDate!.toLocal())} Hari",
                                                        style: AppTexts
                                                            .primaryPRegular
                                                            .copyWith(
                                                          color: AppColors
                                                              .secondaryColor
                                                              .shade700,
                                                        ),
                                                      )
                                                    : Text(
                                                        "Sewa ${controller.order.value.rentHour?.name}",
                                                        style: AppTexts
                                                            .primaryPRegular
                                                            .copyWith(
                                                          color: AppColors
                                                              .secondaryColor
                                                              .shade700,
                                                        ),
                                                      ),
                                                Text(
                                                  controller.order.value
                                                              .totalPrice !=
                                                          null
                                                      ? controller.order.value
                                                          .totalPrice!
                                                          .formatCurrencyIDR()
                                                      : "-",
                                                  style: AppTexts
                                                      .primaryPRegular
                                                      .copyWith(
                                                    color: AppColors
                                                        .secondaryColor
                                                        .shade700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8,
                                              ),
                                              child: const Divider(
                                                height: 1,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Total Harga",
                                                  style: AppTexts.primaryPBold
                                                      .copyWith(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  controller.order.value
                                                              .totalPrice !=
                                                          null
                                                      ? controller.order.value
                                                          .totalPrice!
                                                          .formatCurrencyIDR()
                                                      : "-",
                                                  style: AppTexts.primaryPBold
                                                      .copyWith(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Identitas Penyewa",
                              style: AppTexts.primaryPBold.copyWith(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextFormItem(
                                              label: "Nama Lengkap",
                                              controller: TextEditingController(
                                                text: controller
                                                        .order.value.nameRent ??
                                                    "-",
                                              ),
                                            ),
                                            TextFormItem(
                                              label: "Nomer KTP",
                                              controller: TextEditingController(
                                                text: controller
                                                        .order.value.noKtp ??
                                                    "-",
                                              ),
                                            ),
                                            TextFormItem(
                                              label: "Alamat",
                                              controller: TextEditingController(
                                                text: controller
                                                        .order.value.address ??
                                                    "-",
                                              ),
                                            ),
                                            TextFormItem(
                                              label: "Nomer Telepon",
                                              controller: TextEditingController(
                                                text: controller
                                                        .order.value.phone ??
                                                    "-",
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Visibility(
                              visible:
                                  controller.order.value.status == "NOTPAID" &&
                                      controller.dashboardController.user.value
                                              .role ==
                                          "user",
                              child: SizedBox(
                                width: Get.width,
                                child: OutlinedButton(
                                  onPressed: () => Get.toNamed(
                                    Routes.DETAIL_PAYMENT,
                                    arguments: {
                                      "orderId": controller.order.value.id,
                                    },
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: Colors.green,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8).r,
                                    ),
                                  ),
                                  child: const Text(
                                    "Cek Status Pembayaran",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
