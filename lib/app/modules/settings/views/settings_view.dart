import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_images.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_texts.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  const Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft, child: SizedBox()),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Pengaturan',
                        style: AppTexts.primaryPBold
                            .copyWith(fontSize: 18, color: Colors.black),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: Get.height * 0.06,
                        height: Get.height * 0.06,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.imgUser),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selamat Datang",
                            style:
                                AppTexts.primaryPRegular.copyWith(fontSize: 14),
                          ),
                          Text(
                            "Bintang Rezeka Ramadani",
                            style: AppTexts.primaryPBold.copyWith(fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: Get.width,
                    height: 0.5,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    color: Colors.grey,
                  ),
                  Text(
                    "Pengaturan Umum",
                    style: AppTexts.primaryPBold.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  OptionMenuItem(
                    label: "Ubah Profile",
                    icon: const Icon(Icons.settings),
                    onTap: () => Get.toNamed(Routes.PROFILE),
                  ),
                  Visibility(
                    visible: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pengaturan Admin",
                          style: AppTexts.primaryPBold.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        OptionMenuItem(
                          label: "Daftar Pesanan",
                          icon: const Icon(Icons.list),
                          onTap: () => Get.toNamed(Routes.ORDER),
                        ),
                        OptionMenuItem(
                          label: "Menu Mobil",
                          icon: const Icon(Icons.add_box),
                          onTap: () => Get.toNamed(Routes.RENT_CAR, arguments: {
                            "isMenuAdmin": true,
                          }),
                        ),
                        OptionMenuItem(
                          label: "Update Lokasi",
                          icon: const Icon(Icons.location_on),
                          onTap: () => Get.toNamed(Routes.FORM_LOCATION),
                        ),
                      ],
                    ),
                  ),
                  OptionMenuItem(
                    label: "Keluar",
                    icon: const Icon(Icons.exit_to_app, color: Colors.white),
                    color: Colors.red.shade500,
                    isDark: true,
                    onTap: () => Get.offAllNamed(Routes.LOGIN),
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

class OptionMenuItem extends StatelessWidget {
  const OptionMenuItem({
    Key? key,
    this.onTap,
    required this.label,
    required this.icon,
    this.color,
    this.isDark = false,
  }) : super(key: key);

  final Function()? onTap;
  final String label;
  final Icon icon;
  final Color? color;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 6,
                ),
                Text(
                  label,
                  style: AppTexts.primaryPRegular.copyWith(
                      fontSize: 18,
                      color: isDark! ? Colors.white : Colors.black),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: isDark! ? Colors.white : Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
