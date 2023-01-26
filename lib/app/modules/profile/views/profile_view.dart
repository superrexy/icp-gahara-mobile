import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/common/values/app_images.dart';
import 'package:icp_gahara_mobile/app/widgets/form_input_field.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_texts.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      child: Text(
                        'Ubah Profile',
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
            const SizedBox(
              height: 24,
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 0.1,
                          ),
                        ],
                      ),
                      child: GetBuilder<ProfileController>(
                        init: ProfileController(),
                        initState: (_) {},
                        builder: (_) {
                          return controller.image != null
                              ? Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      controller.image!,
                                      width: 180,
                                      height: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : controller.imageUrl!.isNotEmpty
                                  ? Center(
                                      child: Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                            AppConstants.baseURL +
                                                controller.imageUrl!,
                                            width: 180,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Image.asset(
                                        AppImages.imgUser,
                                        width: 150,
                                        height: 150,
                                      ),
                                    );
                        },
                      ),
                    ),
                    GetBuilder<ProfileController>(
                      init: ProfileController(),
                      initState: (_) {},
                      builder: (_) {
                        return Positioned(
                          top: 0,
                          right: 10,
                          child: controller.image == null
                              ? GestureDetector(
                                  onTap: () => controller.getImage(),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.fromBorderSide(
                                        BorderSide(
                                          color: Colors.black.withOpacity(0.1),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.edit,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () => controller.resetImage(),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.fromBorderSide(
                                        BorderSide(
                                          color: Colors.black.withOpacity(0.1),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.delete,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormInputField(
                      hintText: "Masukkan Nama Lengkap Anda",
                      labelText: "Nama Lengkap",
                      isRequired: true,
                      textInputAction: TextInputAction.next,
                      controller: controller.nameController,
                    ),
                    FormInputField(
                      hintText: "Masukkan Alamat Anda",
                      labelText: "Alamat",
                      isTextArea: true,
                      textInputAction: TextInputAction.next,
                      controller: controller.addressController,
                    ),
                    FormInputField(
                      hintText: "Masukkan Nomer HP Anda",
                      labelText: "Nomer HP",
                      isRequired: true,
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (val) => controller.onSubmit(),
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: () => controller.onSubmit(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.all(18.0),
                        ),
                        child: Text(
                          "Simpan Perubahan",
                          style: AppTexts.primaryPBold
                              .copyWith(fontSize: 16, color: Colors.white),
                        ),
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
