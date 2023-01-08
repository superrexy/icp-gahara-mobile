import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

import '../common/values/app_colors.dart';
import '../common/values/app_images.dart';
import '../common/values/app_texts.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_ORDER),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 1), // c
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nola Riska",
                      style: AppTexts.primaryPBold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Kode Pemesanan : 123456789",
                      style: AppTexts.primaryPRegular.copyWith(
                        fontSize: 14,
                        color: AppColors.secondaryColor.shade800,
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
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    "Selesai",
                    style: AppTexts.primaryPBold.copyWith(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              "23 Feb 2023, 01:00 PM",
              style: AppTexts.primaryPRegular.copyWith(
                fontSize: 14,
                color: AppColors.secondaryColor.shade800,
              ),
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(AppImages.imgCar2),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Porche 911",
                      style: AppTexts.primaryPBold.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tanggal Sewa",
                          style: AppTexts.primaryPRegular,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "25 Feb 2023, 02:00 AM",
                          style: AppTexts.primaryPBold,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tanggal Kembali",
                          style: AppTexts.primaryPRegular,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "26 Feb 2023, 02:00 AM",
                          style: AppTexts.primaryPBold,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
