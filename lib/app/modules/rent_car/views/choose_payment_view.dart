import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/utils/extensions.dart';
import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/form_rent_car_controller.dart';

class ChoosePaymentView extends GetView<FormRentCarController> {
  const ChoosePaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
                  Flexible(
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
                  Flexible(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Pembayaran',
                        style: AppTexts.primaryPBold
                            .copyWith(fontSize: 18.sp, color: Colors.black),
                      ),
                    ),
                  ),
                  const Flexible(
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Pilih Metode Pembayaran",
                    style: AppTexts.primaryPBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "E-Wallet",
                          style: AppTexts.primaryPRegular.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        PaymentItem(
                          title: "GoPay",
                          value: "gopay",
                          groupValue: controller.paymentSelected.value,
                          onChanged: (value) {
                            controller.paymentSelected.value = value!;
                          },
                          image:
                              "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/09/5038aa2e01be0c79443496e8b6112010_718692dca7079b31a47f68e149c81aff_compressed.png",
                        ),
                        PaymentItem(
                          title: "ShoopePay",
                          value: "shopeepay",
                          groupValue: controller.paymentSelected.value,
                          onChanged: (value) {
                            controller.paymentSelected.value = value!;
                          },
                          image:
                              "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/10/f7fb2e0ab8572355142dba33ddc7b8d6_0747205be87147c03d04217ad4eb06c3_compressed.png",
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transfer Virtual Account",
                          style: AppTexts.primaryPRegular.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        PaymentItem(
                          title: "BCA Virtual Account",
                          value: "bca_va",
                          groupValue: controller.paymentSelected.value,
                          onChanged: (value) {
                            controller.paymentSelected.value = value!;
                          },
                          image:
                              "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/09/fc68a00838f69124fddaf64e30f5e958_ca45aac69ce87ce691c3e6582894b6f0_compressed.png",
                        ),
                        PaymentItem(
                          title: "BNI Virtual Account",
                          value: "bni_va",
                          groupValue: controller.paymentSelected.value,
                          onChanged: (value) {
                            controller.paymentSelected.value = value!;
                          },
                          image:
                              "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/09/f6f57e9126c57179cf729cc9586e47c0_e26ce4cce944fe379072ae509fe72ec1_compressed.png",
                        ),
                        PaymentItem(
                          title: "BRI Virtual Account",
                          value: "bri_va",
                          groupValue: controller.paymentSelected.value,
                          onChanged: (value) {
                            controller.paymentSelected.value = value!;
                          },
                          image:
                              "https://storage.googleapis.com/go-merchant-production.appspot.com/uploads/2020/09/0fcddd245474380834dfe5f3beb0492f_093eb297aba2188382cf91e556dd9bdf_compressed.png",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Total Tagihan",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  controller.totalPrice.value.formatCurrencyIDR(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 140.w,
              child: Obx(
                () => ElevatedButton(
                  onPressed: () {
                    if (controller.paymentSelected.value != "") {
                      controller.onSubmit();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.paymentSelected.value != ""
                        ? Colors.green
                        : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
                  ),
                  child: Text(
                    "Bayar",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.title,
    required this.image,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });
  final String title;
  final String image;
  final String value;
  final String? groupValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          Container(
            width: 60.w,
            padding: EdgeInsets.all(6.r),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: AppTexts.primaryPRegular.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
