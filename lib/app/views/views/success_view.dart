import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';
import 'package:icp_gahara_mobile/app/routes/app_pages.dart';

class SuccessView extends GetView {
  const SuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent.shade100,
                      blurRadius: 16,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              Text(
                'Transaksi Berhasil !',
                style: AppTexts.primaryPBold.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Terima kasih telah menggunakan layanan kami",
                style: AppTexts.primaryPRegular.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 64,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  Get.offAllNamed(Routes.DASHBOARD);
                },
                child: Text('Kembali ke Beranda',
                    style:
                        AppTexts.primaryPRegular.copyWith(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
