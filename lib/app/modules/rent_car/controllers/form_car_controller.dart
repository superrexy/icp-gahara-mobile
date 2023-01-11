import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';
import 'package:icp_gahara_mobile/app/data/cars_provider.dart';
import 'package:icp_gahara_mobile/app/model/request/cars_request.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/rent_car_controller.dart';
import 'package:image_picker/image_picker.dart';

class FormCarController extends GetxController {
  // CONTROLLER
  final RentCarController rentCarController = Get.find();

  // PROVIDER
  final CarsProvider carsProvider = CarsProvider();

  // FORM
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  final TextEditingController typeFuelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final isImageFromInternet = false.obs;
  final urlImage = "".obs;

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
    isImageFromInternet.value = false;
    image = null;
    update();
  }

  // Function
  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        if (Get.arguments?['isUpdate'] == true) {
          final CarsRequest payload = CarsRequest(
            name: nameController.text,
            description: descriptionController.text,
            typeCar: typeController.text,
            price: priceController.text,
            seats: seatsController.text,
            typeFuel: typeFuelController.text,
            transmision: transmissionController.text,
          );

          if (image != null) {
            payload.carImage = image;
          }

          final response = await carsProvider.updateCar(
            Get.arguments?['carId'],
            payload,
          );

          if (response) {
            await rentCarController.getCars();
            Get.back();
            Get.snackbar(
              'Berhasil',
              'Berhasil Menambahkan Mobil.',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          }
        } else {
          final CarsRequest payload = CarsRequest(
            name: nameController.text,
            description: descriptionController.text,
            typeCar: typeController.text,
            price: priceController.text,
            seats: seatsController.text,
            typeFuel: typeFuelController.text,
            transmision: transmissionController.text,
            carImage: image,
          );

          final response = await carsProvider.createCar(payload);

          if (response) {
            await rentCarController.getCars();
            Get.back();
            Get.snackbar(
              'Berhasil',
              'Berhasil Menambahkan Mobil.',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          }
        }
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  Future<void> getCar() async {
    try {
      final response = await carsProvider.getCarByID(Get.arguments?['carId']);

      if (response != null) {
        isImageFromInternet.value = true;
        urlImage.value = AppConstants.baseURL + response.image;
        nameController.text = response.name;
        descriptionController.text = response.description;
        typeController.text = response.typeCar;
        priceController.text = response.price.toString();
        seatsController.text = response.seats.toString();
        typeFuelController.text = response.typeFuel;
        transmissionController.text = response.transmision;
        update();
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    if (Get.arguments?['isUpdate'] == true) {
      getCar();
    }

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
