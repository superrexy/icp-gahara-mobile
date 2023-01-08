import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_images.dart';
import 'package:icp_gahara_mobile/app/widgets/order_card.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_texts.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                            'Daftar Pesanan',
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
              TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      "Pesanan Aktif",
                      style: AppTexts.primaryPBold.copyWith(fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Pesanan Selesai",
                      style: AppTexts.primaryPBold.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return OrderCard();
                        },
                        itemCount: 5,
                      ),
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return OrderCard();
                        },
                        itemCount: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
