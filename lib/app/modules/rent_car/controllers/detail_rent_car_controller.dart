import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/cars_provider.dart';
import 'package:icp_gahara_mobile/app/model/response/cars_response.dart';

class DetailRentCarController extends GetxController {
  // Provider
  final CarsProvider carsProvider = CarsProvider();

  // Observable
  final car = CarsDataResponse(
    id: 0,
    name: '',
    image: '',
    price: 0,
    seats: 0,
    description: '',
    transmision: '',
    typeCar: '',
    typeFuel: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ).obs;

  // Function
  Future<void> getCar() async {
    try {
      final response = await carsProvider.getCarByID(Get.arguments['carId']);

      if (response != null) {
        car.update((val) {
          val?.id = response.id;
          val?.name = response.name;
          val?.image = response.image;
          val?.price = response.price;
          val?.seats = response.seats;
          val?.description = response.description;
          val?.transmision = response.transmision;
          val?.typeCar = response.typeCar;
          val?.typeFuel = response.typeFuel;
          val?.createdAt = response.createdAt;
          val?.updatedAt = response.updatedAt;
        });
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    getCar();
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
