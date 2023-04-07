import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
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
                AutoSizeText("Gahara Rent Car", style: AppTexts.primaryPBold),
                Container(
                  width: 40.w,
                  height: 35.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => Get.toNamed(Routes.PROFILE),
                      child:
                          controller.dashboardController.user.value.userImage !=
                                  null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    AppConstants.baseURL +
                                        controller.dashboardController.user
                                            .value.userImage!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Image.asset(
                                  AppImages.imgUser,
                                  fit: BoxFit.cover,
                                ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 100.w, maxHeight: 150.h),
            child: Image.asset(
              AppImages.imgLogo,
            ),
          ),
          SizedBox(height: 10.h),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Visibility(
                      visible: controller.dashboardController.user.value.role !=
                          "admin",
                      child: Container(
                        width: 100.w,
                        height: 110.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            FittedBox(
                              child: AutoSizeText(
                                "Sewa Mobil",
                                style: AppTexts.primaryPRegular,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 110.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        FittedBox(
                          child: AutoSizeText(
                            "Informasi Mobil",
                            style: AppTexts.primaryPRegular,
                            textAlign: TextAlign.center,
                          ),
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
                      width: 100.w,
                      height: 110.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          FittedBox(
                            child: AutoSizeText(
                              "Daftar Pesanan",
                              textAlign: TextAlign.center,
                              style: AppTexts.primaryPRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.LOCATION);
                    },
                    child: Container(
                      width: 100.w,
                      height: 110.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          FittedBox(
                            child: AutoSizeText(
                              "Lokasi",
                              style: AppTexts.primaryPRegular,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 26.0.h),
            constraints: BoxConstraints(maxWidth: 100.w, maxHeight: 150.h),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.imgLogoTransparent,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
