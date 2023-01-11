import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/model/response/order_response.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

import '../common/utils/extensions.dart';
import '../common/values/app_colors.dart';
import '../common/values/app_texts.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.data,
    this.onConfirm,
    this.isAdmin = false,
  }) : super(key: key);
  final OrdersDataResponse data;
  final Function()? onConfirm;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.DETAIL_ORDER,
        arguments: {"orderId": data.id},
      ),
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
                      data.nameRent!,
                      style: AppTexts.primaryPBold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Kode Pemesanan : ${data.id}",
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
                    color: data.status == "ACTIVE" ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    data.status == "ACTIVE" ? "Aktif" : "Selesai",
                    style: AppTexts.primaryPBold.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              data.createdAt!.formatDateToString("dd MMM yyyy, HH:mm"),
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
                    image: DecorationImage(
                      image: NetworkImage(
                        AppConstants.baseURL + data.car!.image,
                      ),
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
                      data.car!.name,
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
                          data.startDate.formatDateToString("dd MMM yyyy"),
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
                          data.endDate.formatDateToString("dd MMM yyyy"),
                          style: AppTexts.primaryPBold,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Visibility(
              visible: data.status == "ACTIVE" && isAdmin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Selesaikan Pesanan ?",
                        middleText:
                            "Apakah anda yakin ingin menyelesaikan pesanan ini & pastikan mobil sudah dikembalikan ?",
                        textConfirm: "Ya",
                        textCancel: "Tidak",
                        confirmTextColor: Colors.white,
                        cancelTextColor: Colors.black,
                        buttonColor: Colors.green,
                        onConfirm: onConfirm,
                        onCancel: () {
                          Get.closeAllSnackbars();
                        },
                      );
                    },
                    child: Text(
                      "Selesaikan Pesanan",
                      style: AppTexts.primaryPRegular,
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
