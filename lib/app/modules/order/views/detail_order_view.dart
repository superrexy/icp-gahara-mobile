import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_images.dart';
import '../../../common/values/app_texts.dart';
import '../../rent_car/views/form_detail_rent_car_view.dart';

class DetailOrderView extends GetView {
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
            Expanded(
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
                            "123456789",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              "Nola Riska",
                                              style: AppTexts.primaryPBold
                                                  .copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              "Kode Pemesanan : 123456789",
                                              style: AppTexts.primaryPRegular
                                                  .copyWith(
                                                fontSize: 14,
                                                color: AppColors
                                                    .secondaryColor.shade800,
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
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Text(
                                            "Selesai",
                                            style:
                                                AppTexts.primaryPBold.copyWith(
                                              fontSize: 14,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "23 Feb 2023, 01:00 PM",
                                      style: AppTexts.primaryPRegular.copyWith(
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
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image:
                                                  AssetImage(AppImages.imgCar2),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.fromBorderSide(
                                              BorderSide(
                                                width: 1,
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Porche 911",
                                              style: AppTexts.primaryPBold
                                                  .copyWith(
                                                fontSize: 18,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Tujuan Sewa",
                                                  style:
                                                      AppTexts.primaryPRegular,
                                                ),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Text(
                                                  "Ke Madiun",
                                                  style: AppTexts.primaryPBold,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Tanggal Sewa",
                                                  style:
                                                      AppTexts.primaryPRegular,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Tanggal Kembali",
                                                  style:
                                                      AppTexts.primaryPRegular,
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
                                            "Porche 911",
                                            style:
                                                AppTexts.primaryPBold.copyWith(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Sewa 1 Hari",
                                                style: AppTexts.primaryPRegular
                                                    .copyWith(
                                                  color: AppColors
                                                      .secondaryColor.shade700,
                                                ),
                                              ),
                                              Text(
                                                "Rp. 1.000.000",
                                                style: AppTexts.primaryPRegular
                                                    .copyWith(
                                                  color: AppColors
                                                      .secondaryColor.shade700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 8,
                                            ),
                                            child: const Divider(
                                              height: 1,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total Harga",
                                                style: AppTexts.primaryPBold
                                                    .copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "Rp. 1.000.000",
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
                                          TextFormItem(
                                            label: "Nama Lengkap",
                                            controller: TextEditingController(
                                                text: 'Rizky'),
                                          ),
                                          TextFormItem(
                                            label: "Nomer KTP",
                                            controller: TextEditingController(
                                                text: '1234567890'),
                                          ),
                                          TextFormItem(
                                            label: "Alamat",
                                            controller: TextEditingController(
                                                text: 'Jl. Raya Cibubur'),
                                          ),
                                          TextFormItem(
                                            label: "Nomer Telepon",
                                            controller: TextEditingController(
                                                text: '081234567890'),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
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
            ),
          ],
        ),
      ),
    );
  }
}
