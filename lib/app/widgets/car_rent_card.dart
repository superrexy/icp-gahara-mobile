import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_images.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

class CarRentCard extends StatelessWidget {
  const CarRentCard({super.key, this.isAdmin = false, this.isInfo = false});
  final bool? isAdmin;
  final bool? isInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_RENT_CAR, arguments: {
          "isMenuAdmin": isAdmin,
          "isInfo": isInfo,
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
                        onConfirm: () {
                          Get.closeAllSnackbars();
                        },
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
            Image.asset(
              AppImages.imgCar2,
              fit: BoxFit.cover,
              width: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Porsche 911",
                        style: AppTexts.primaryPBold
                            .copyWith(fontSize: 18, color: Colors.black),
                      ),
                      Text("2 Seat", style: AppTexts.primaryPRegular),
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
                          child: Text(
                            "Rp. 250.000.000",
                            style: AppTexts.primaryPBold.copyWith(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          "/hari",
                          style: AppTexts.primaryPRegular.copyWith(
                            fontSize: 12,
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
