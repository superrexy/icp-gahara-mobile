import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/model/response/cars_response.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/extensions.dart';

class CarRentCard extends StatelessWidget {
  const CarRentCard(
      {super.key,
      this.isAdmin = false,
      this.isInfo = false,
      required this.data,
      this.onDelete});
  final bool? isAdmin;
  final bool? isInfo;
  final CarsDataResponse data;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_RENT_CAR, arguments: {
          "isMenuAdmin": isAdmin,
          "isInfo": isInfo,
          "carId": data.id,
        });
      },
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 8),
            ),
          ],
        ),
        constraints: const BoxConstraints(
          minHeight: 200,
        ),
        child: Column(
          children: [
            Visibility(
              visible: isAdmin!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Get.toNamed(Routes.FORM_CAR, arguments: {
                      "isUpdate": true,
                      "carId": data.id,
                    }),
                    icon: const Icon(Icons.edit, color: Colors.yellow),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Hapus Mobil",
                        middleText:
                            "Apakah anda yakin ingin menghapus mobil ini ?",
                        textConfirm: "Ya",
                        textCancel: "Tidak",
                        confirmTextColor: Colors.white,
                        cancelTextColor: Colors.black,
                        buttonColor: Colors.green,
                        onConfirm: onDelete,
                        onCancel: () {
                          Get.closeAllSnackbars();
                        },
                      );
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 160.h),
              child: Image.network(
                AppConstants.baseURL + data.image,
                fit: BoxFit.cover,
                width: 280.w,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        data.name,
                        style: AppTexts.primaryPBold
                            .copyWith(fontSize: 16.sp, color: Colors.black),
                      ),
                      AutoSizeText(
                        "${data.seats} Seat",
                        style:
                            AppTexts.primaryPRegular.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 130,
                        child: FittedBox(
                          child: AutoSizeText(
                            data.price.formatCurrencyIDR(),
                            style: AppTexts.primaryPBold.copyWith(
                              fontSize: 14.sp,
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
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
