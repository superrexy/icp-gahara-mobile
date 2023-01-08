import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_images.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/detail_rent_car_controller.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';
import 'package:icp_gahara_mobile/app/widgets/spesification_car_item.dart';

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
            Image.asset(
              AppImages.imgCar2,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Porsche 911",
                        style: AppTexts.primaryPBold.copyWith(
                          fontSize: 18,
                          color: AppColors.secondaryColor.shade900,
                        ),
                      ),
                      Text(
                        "Tipe Sport",
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
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam malesuada efficitur nisl, eu posuere diam molestie eu. Vestibulum tellus dolor, sodales in urna id, pretium bibendum erat. Praesent porttitor interdum cursus. Mauris nec sem ut sapien interdum tincidunt. Etiam in interdum erat. Nam lobortis accumsan pulvinar. Duis sagittis felis ac neque vehicula sagittis. Proin gravida, odio in fermentum pulvinar, urna nisl egestas lorem, vel malesuada turpis enim id odio. Nunc pretium bibendum metus nec lacinia. Donec rutrum lobortis rhoncus. Fusce fermentum scelerisque urna ac pharetra.",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SpesificationCarItem(
                            title: '2 Seats',
                            imagePath: AppImages.icSeat,
                          ),
                          SpesificationCarItem(
                            title: 'Manual',
                            imagePath: AppImages.icTransmission,
                          ),
                          SpesificationCarItem(
                            title: 'Bensin',
                            imagePath: AppImages.icFuel,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: isInfo == false && isMenuAdmin == false
          ? Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                          child: Text(
                            "Rp. 10.000.000",
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
                  ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.FORM_RENT_CAR),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Pesan Sekarang",
                      style: AppTexts.primaryPRegular
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
