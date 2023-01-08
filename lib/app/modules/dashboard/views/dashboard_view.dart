import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';

import 'package:icp_gahara_mobile/app/modules/home/views/home_view.dart';
import 'package:icp_gahara_mobile/app/modules/settings/views/settings_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<DashboardController>(
          init: DashboardController(),
          initState: (_) {},
          builder: (_) {
            return IndexedStack(
              index: controller.selectedIndex.value,
              children: const [
                HomeView(),
                SettingsView(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: GetBuilder<DashboardController>(
        init: DashboardController(),
        initState: (_) {},
        builder: (_) {
          return BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (value) => controller.changeIndex(value),
            selectedItemColor: Colors.green,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Pengaturan',
              ),
            ],
          );
        },
      ),
    );
  }
}
