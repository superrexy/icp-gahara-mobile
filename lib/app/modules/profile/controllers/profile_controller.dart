import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/users_provider.dart';
import 'package:icp_gahara_mobile/app/model/request/users_request.dart';
import 'package:icp_gahara_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // Controller
  final DashboardController dashboardController = Get.find();

  // Provider
  final UsersProvider usersProvider = UsersProvider();

  // Form
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Image From Internet
  final isImageFromInternet = false.obs;
  String? imageUrl;

  // Image Picker
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {
      print('No image selected.');
    }
  }

  Future<void> resetImage() async {
    image = null;
    update();
  }

  // Init Form
  void initTextForm() {
    nameController.text = dashboardController.user.value.fullName;
    addressController.text = dashboardController.user.value.address ?? "";
    phoneController.text = dashboardController.user.value.phone ?? "";
    isImageFromInternet.value =
        dashboardController.user.value.userImage != null ? true : false;
    imageUrl = dashboardController.user.value.userImage ?? "";
  }

  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        final UsersRequest request = UsersRequest(
          fullName: nameController.text,
          address: addressController.text,
          phone: phoneController.text,
        );

        final response = await usersProvider.updateProfile(request, image);

        if (response != null) {
          await dashboardController.getProfile().then((value) {
            Get.back();
            Get.snackbar(
              'Berhasil',
              'Berhasil mengubah profil',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          });
        }
      }
    } catch (e) {
      Get.printError(info: e.toString());
      Get.snackbar(
        'Terdapat Kesalahan',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onInit() {
    initTextForm();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
