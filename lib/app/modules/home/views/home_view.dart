import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_images.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gahara Rent Car", style: AppTexts.primaryPBold),
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.PROFILE),
                    child: Image.asset(
                      AppImages.imgUser,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 100, maxHeight: 200),
            child: Image.asset(
              AppImages.imgLogo,
            ),
          ),
          SizedBox(height: Get.height * 0.05),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.RENT_CAR),
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: SvgPicture.asset(
                              AppImages.icRent,
                              width: 40,
                            ),
                          ),
                        ),
                        Text("Sewa Mobil", style: AppTexts.primaryPRegular),
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.RENT_CAR, arguments: {
                            "isInfo": true,
                          }),
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: SvgPicture.asset(
                              AppImages.icRent,
                              width: 40,
                            ),
                          ),
                        ),
                        Text(
                          "Informasi Mobil",
                          style: AppTexts.primaryPRegular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.ORDER),
                    child: Container(
                      width: 120,
                      height: 120,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: SvgPicture.asset(
                              AppImages.icAbout,
                              width: 40,
                            ),
                          ),
                          Text("Daftar Pesanan",
                              style: AppTexts.primaryPRegular),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.LOCATION),
                    child: Container(
                      width: 120,
                      height: 120,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: SvgPicture.asset(
                              AppImages.icLocation,
                              width: 40,
                            ),
                          ),
                          Text("Lokasi", style: AppTexts.primaryPRegular),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.05),
          Image.asset(
            AppImages.imgLogoTransparent,
            fit: BoxFit.cover,
            height: Get.height * 0.23,
          ),
        ],
      ),
    );
  }
}
