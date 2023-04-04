import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/cars_provider.dart';
import 'package:icp_gahara_mobile/app/model/request/cars_request.dart';
import 'package:icp_gahara_mobile/app/model/response/cars_response.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/controllers/rent_car_controller.dart';
import 'package:image_picker/image_picker.dart';

class FormCarController extends GetxController {
  // CONTROLLER
  final RentCarController rentCarController = Get.find();

  // PROVIDER
  final CarsProvider carsProvider = CarsProvider();

  // FORM
  final formKey = GlobalKey<FormState>();
  final int carId = Get.arguments?['carId'];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  final TextEditingController typeFuelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  List<PriceHourField> priceHourController = [];

  Future<void> addPriceHourController() async {
    priceHourController.add(
      PriceHourField(
        name: TextEditingController(),
        price: TextEditingController(),
      ),
    );

    update();
  }

  Future<void> removePriceHourController(PriceHourField item) async {
    priceHourController.remove(item);
    update();
  }

  // Images From API
  List<CarImage> imagesFromApi = [];
  List<CarImage> deleteImages = [];

  // Image Picker
  final ImagePicker picker = ImagePicker();

  // Array Images
  List<File> images = [];

  Future<void> addImages() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);

    if (pickedFile != null) {
      images.add(File(pickedFile.path));
      update();
    } else {
      print('No image selected.');
    }
  }

  Future<void> removeImage(File file) async {
    images.remove(file);
    update();
  }

  Future<void> removeImageFromAPI(CarImage carImage) async {
    imagesFromApi.remove(carImage);
    deleteImages.add(carImage);
    update();
  }

  // Function
  Future<void> onSubmit() async {
    try {
      print(priceHourController
          .map(
            (e) => PricesHour(
              id: e.id,
              name: e.name.text,
              price: e.price.text,
            ),
          )
          .toList(growable: true)
          .toString());
      if (formKey.currentState!.validate()) {
        if (deleteImages.isNotEmpty) {
          for (var element in deleteImages) {
            await carsProvider.deleteCarImage(carId, element.id!);
          }
        }

        if (Get.arguments?['isUpdate'] == true) {
          final CarsRequest payload = CarsRequest(
            name: nameController.text,
            description: descriptionController.text,
            typeCar: typeController.text,
            priceDay: priceController.text,
            seats: seatsController.text,
            typeFuel: typeFuelController.text,
            transmision: transmissionController.text,
            pricesHour: priceHourController
                .map(
                  (e) => PricesHour(
                    id: e.id,
                    name: e.name.text,
                    price: e.price.text,
                  ),
                )
                .toList(),
          );

          if (images.isNotEmpty) {
            payload.images = images;
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
              'Berhasil Memperbarui Mobil.',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          }
        } else {
          final CarsRequest payload = CarsRequest(
            name: nameController.text,
            description: descriptionController.text,
            typeCar: typeController.text,
            priceDay: priceController.text,
            seats: seatsController.text,
            typeFuel: typeFuelController.text,
            transmision: transmissionController.text,
            images: images,
            pricesHour: priceHourController
                .map(
                  (e) => PricesHour(
                    name: e.name.text,
                    price: e.price.text,
                  ),
                )
                .toList(growable: true),
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
        nameController.text = response.name!;
        descriptionController.text = response.description!;
        typeController.text = response.typeCar!;
        seatsController.text = response.seats.toString();
        typeFuelController.text = response.typeFuel!;
        transmissionController.text = response.transmision!;
        priceController.text = response.carDayPrice!.price.toString();

        for (var element in response.carImages!) {
          imagesFromApi.add(element);
        }

        for (var element in response.carHourPrice!) {
          priceHourController.add(
            PriceHourField(
              id: element.id,
              name: TextEditingController(text: element.name),
              price: TextEditingController(text: element.price.toString()),
            ),
          );
        }

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

class PriceHourField {
  final int? id;
  final TextEditingController name;
  final TextEditingController price;

  PriceHourField({this.id, required this.name, required this.price});
}
